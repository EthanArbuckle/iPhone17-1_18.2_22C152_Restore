@interface APCPlayer
+ (id)carrierAssetIdentifiers;
+ (id)fileNameForCarrierAsset:(unint64_t)a3;
+ (id)urlForCarrierAsset:(unint64_t)a3;
+ (unint64_t)assetIDFromIdentifier:(id)a3;
- (APCPlayer)init;
- (APCPlayer)initWithCodecConfiguration:(id)a3;
- (APCPlayer)initWithListenerCapabilityData:(id)a3;
- (APCPlayer)initWithListenerCapabilityData:(id)a3 payloadLength:(unint64_t)a4;
- (APCPlayerEmbedInfo)embeddingInfo;
- (BOOL)isPlaying;
- (BOOL)startSend;
- (BOOL)startSendAtTime:(unint64_t)a3 withBeginning:(id)a4;
- (NSData)configurationData;
- (NSData)payload;
- (OS_dispatch_queue)dispatchQueue;
- (float)preparePayload:(id)a3 usingCarrierAsset:(unint64_t)a4 error:(id *)a5;
- (float)preparePayload:(id)a3 usingCarrierAtURL:(id)a4 error:(id *)a5;
- (id)createCompatibleConfigForCapabilites:(id)a3;
- (unint64_t)callbackTimingMSec;
- (void)endPasscodeEmbedding;
- (void)setCallbackTimingMSec:(unint64_t)a3;
- (void)setDispatchQueue:(id)a3;
- (void)stopSend:(BOOL)a3 withCompletion:(id)a4;
- (void)stopSendAfterMinimumLoops:(unint64_t)a3 withCompletion:(id)a4;
- (void)stopSendWithFadeOut:(float)a3 completion:(id)a4;
@end

@implementation APCPlayer

- (APCPlayer)init
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF8F8]);
  v4 = [(APCPlayer *)self initWithListenerCapabilityData:v3 payloadLength:0];

  return v4;
}

- (id)createCompatibleConfigForCapabilites:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v3);
        }
        v7 = +[APCCodecFactory createBestConfigForCapability:*(void *)(*((void *)&v11 + 1) + 8 * i)];
        if (v7)
        {
          v8 = v3;
          goto LABEL_13;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

  v8 = APCLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_237D0E000, v8, OS_LOG_TYPE_ERROR, "Can't find a codec capability data", v10, 2u);
  }
  v7 = 0;
LABEL_13:

  return v7;
}

- (APCPlayer)initWithListenerCapabilityData:(id)a3
{
  return [(APCPlayer *)self initWithListenerCapabilityData:a3 payloadLength:3];
}

- (APCPlayer)initWithListenerCapabilityData:(id)a3 payloadLength:(unint64_t)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v31.receiver = self;
  v31.super_class = (Class)APCPlayer;
  v7 = [(APCPlayer *)&v31 init];
  v8 = v7;
  if (!v7) {
    goto LABEL_10;
  }
  v7->_isPlaying = 0;
  if (!v6 || ![v6 length])
  {
LABEL_20:
    v19 = 0;
    goto LABEL_21;
  }
  v9 = (void *)MEMORY[0x263EFFA08];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  v15 = objc_msgSend(v9, "setWithObjects:", v10, v11, v12, v13, v14, objc_opt_class(), 0);
  uint64_t v16 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:v15 fromData:v6 error:0];
  if (!v16 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    goto LABEL_20;
  }
  id v17 = v16;
  v18 = [v17 objectForKey:@"version"];
  if (!v18 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
LABEL_19:

    goto LABEL_20;
  }
  if (![v18 unsignedIntegerValue])
  {
    v20 = [v17 objectForKey:@"aupccapability"];
    if (v20)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v21 = [(APCPlayer *)v8 createCompatibleConfigForCapabilites:v20];
        codecConfig = v8->_codecConfig;
        v8->_codecConfig = (AUPasscodeCodecConfiguration *)v21;

        v23 = v8->_codecConfig;
        if (v23)
        {
          [(AUPasscodeCodecConfiguration *)v23 setPayloadLengthBytes:a4];
          v24 = APCLogObject();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            v25 = v8->_codecConfig;
            *(_DWORD *)buf = 138412290;
            v33 = v25;
            _os_log_impl(&dword_237D0E000, v24, OS_LOG_TYPE_INFO, "Created codec config from capabilities: %@", buf, 0xCu);
          }

          id v26 = objc_alloc(MEMORY[0x263EFF8F8]);
          v27 = [MEMORY[0x263F08910] archivedDataWithRootObject:v8->_codecConfig requiringSecureCoding:0 error:0];
          uint64_t v28 = [v26 initWithData:v27];
          configurationData = v8->_configurationData;
          v8->_configurationData = (NSData *)v28;

          goto LABEL_9;
        }
      }
    }

    goto LABEL_19;
  }
LABEL_9:
  v8->_callbackTimingMSec = 300;

LABEL_10:
  v19 = v8;
LABEL_21:

  return v19;
}

- (APCPlayer)initWithCodecConfiguration:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)APCPlayer;
  id v6 = [(APCPlayer *)&v17 init];
  v7 = v6;
  if (v6)
  {
    v6->_isPlaying = 0;
    p_codecConfig = &v6->_codecConfig;
    objc_storeStrong((id *)&v6->_codecConfig, a3);
    if (!*p_codecConfig)
    {
      v15 = 0;
      goto LABEL_8;
    }
    v9 = APCLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = *p_codecConfig;
      *(_DWORD *)buf = 138412290;
      v19 = v10;
      _os_log_impl(&dword_237D0E000, v9, OS_LOG_TYPE_INFO, "Created codec config from configuration: %@", buf, 0xCu);
    }

    id v11 = objc_alloc(MEMORY[0x263EFF8F8]);
    uint64_t v12 = [MEMORY[0x263F08910] archivedDataWithRootObject:*p_codecConfig requiringSecureCoding:0 error:0];
    uint64_t v13 = [v11 initWithData:v12];
    configurationData = v7->_configurationData;
    v7->_configurationData = (NSData *)v13;
  }
  v15 = v7;
LABEL_8:

  return v15;
}

- (void)setDispatchQueue:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
  playerEngine = self->_playerEngine;
  if (playerEngine) {
    [(APCPlayerEngine *)playerEngine setDispatchQueue:v6];
  }
}

- (void)setCallbackTimingMSec:(unint64_t)a3
{
  if (!self->_isPlaying) {
    self->_callbackTimingMSec = a3;
  }
}

+ (id)urlForCarrierAsset:(unint64_t)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = +[APCPlayer fileNameForCarrierAsset:a3];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v5 = [v4 URLForResource:v3 withExtension:@"wav"];

    id v6 = APCLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = [v5 absoluteString];
      int v9 = 136315138;
      uint64_t v10 = [v7 UTF8String];
      _os_log_impl(&dword_237D0E000, v6, OS_LOG_TYPE_INFO, "Carrier Resource path: %s", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)fileNameForCarrierAsset:(unint64_t)a3
{
  if (a3 - 1 > 3) {
    return 0;
  }
  else {
    return off_264CFE598[a3 - 1];
  }
}

+ (id)carrierAssetIdentifiers
{
  v9[4] = *MEMORY[0x263EF8340];
  v8[0] = @"WOC";
  v2 = [NSNumber numberWithUnsignedInteger:1];
  v9[0] = v2;
  v8[1] = @"light";
  id v3 = [NSNumber numberWithUnsignedInteger:2];
  v9[1] = v3;
  v8[2] = @"pingpong";
  uint64_t v4 = [NSNumber numberWithUnsignedInteger:3];
  v9[2] = v4;
  v8[3] = @"ring";
  id v5 = [NSNumber numberWithUnsignedInteger:4];
  v9[3] = v5;
  id v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:4];

  return v6;
}

+ (unint64_t)assetIDFromIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[APCPlayer carrierAssetIdentifiers];
  id v5 = [v4 objectForKey:v3];
  id v6 = v5;
  if (v5) {
    unint64_t v7 = [v5 unsignedIntegerValue];
  }
  else {
    unint64_t v7 = 0;
  }

  return v7;
}

- (float)preparePayload:(id)a3 usingCarrierAsset:(unint64_t)a4 error:(id *)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  int v9 = v8;
  if (!v8
    || (uint64_t v10 = [v8 length],
        v10 != [(AUPasscodeCodecConfiguration *)self->_codecConfig payloadLengthBytes]))
  {
    objc_super v17 = APCLogObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      if (v9) {
        uint64_t v18 = [v9 length];
      }
      else {
        uint64_t v18 = 0;
      }
      int64_t v19 = [(AUPasscodeCodecConfiguration *)self->_codecConfig payloadLengthBytes];
      int v21 = 134218240;
      uint64_t v22 = v18;
      __int16 v23 = 2048;
      int64_t v24 = v19;
      _os_log_impl(&dword_237D0E000, v17, OS_LOG_TYPE_ERROR, "Payload passed to prepare contains %lu bytes, was told we'd send %ld bytes. These must match!", (uint8_t *)&v21, 0x16u);
    }

    goto LABEL_13;
  }
  uint64_t v11 = +[APCPlayer urlForCarrierAsset:a4];
  uint64_t v12 = +[APCPlayerEngine playerWithAssetURL:v11 codecConfig:self->_codecConfig payload:v9 error:a5];
  playerEngine = self->_playerEngine;
  self->_playerEngine = v12;

  if (self->_dispatchQueue) {
    -[APCPlayerEngine setDispatchQueue:](self->_playerEngine, "setDispatchQueue:");
  }
  uint64_t v14 = self->_playerEngine;
  if (!v14)
  {
LABEL_13:
    float v16 = -1.0;
    goto LABEL_14;
  }
  [(APCPlayerEngine *)v14 evaluateAsset];
  float v16 = v15;
LABEL_14:

  return v16;
}

- (float)preparePayload:(id)a3 usingCarrierAtURL:(id)a4 error:(id *)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if (!v8
    || (uint64_t v10 = [v8 length],
        v10 != [(AUPasscodeCodecConfiguration *)self->_codecConfig payloadLengthBytes]))
  {
    float v16 = APCLogObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      if (v8) {
        uint64_t v17 = [v8 length];
      }
      else {
        uint64_t v17 = 0;
      }
      int64_t v18 = [(AUPasscodeCodecConfiguration *)self->_codecConfig payloadLengthBytes];
      int v20 = 134218240;
      uint64_t v21 = v17;
      __int16 v22 = 2048;
      int64_t v23 = v18;
      _os_log_impl(&dword_237D0E000, v16, OS_LOG_TYPE_ERROR, "Payload passed to prepare contains %lu bytes, was told we'd send %ld bytes. These must match!", (uint8_t *)&v20, 0x16u);
    }

    goto LABEL_11;
  }
  uint64_t v11 = +[APCPlayerEngine playerWithAssetURL:v9 codecConfig:self->_codecConfig payload:v8 error:a5];
  playerEngine = self->_playerEngine;
  self->_playerEngine = v11;

  uint64_t v13 = self->_playerEngine;
  if (!v13)
  {
LABEL_11:
    float v15 = -1.0;
    goto LABEL_12;
  }
  [(APCPlayerEngine *)v13 evaluateAsset];
  float v15 = v14;
LABEL_12:

  return v15;
}

- (BOOL)startSend
{
  return [(APCPlayer *)self startSendAtTime:0 withBeginning:0];
}

- (BOOL)startSendAtTime:(unint64_t)a3 withBeginning:(id)a4
{
  id v6 = a4;
  playerEngine = self->_playerEngine;
  if (playerEngine)
  {
    BOOL v8 = [(APCPlayerEngine *)playerEngine startEngineAtTime:a3 withBeginning:v6 callbackTime:self->_callbackTimingMSec];
    self->_isPlaying = 1;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)endPasscodeEmbedding
{
}

- (void)stopSend:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  playerEngine = self->_playerEngine;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __37__APCPlayer_stopSend_withCompletion___block_invoke;
  v9[3] = &unk_264CFE578;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [(APCPlayerEngine *)playerEngine stopEngine:v4 withCompletion:v9];
}

uint64_t __37__APCPlayer_stopSend_withCompletion___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 40) = 0;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)stopSendAfterMinimumLoops:(unint64_t)a3 withCompletion:(id)a4
{
  id v6 = a4;
  playerEngine = self->_playerEngine;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __54__APCPlayer_stopSendAfterMinimumLoops_withCompletion___block_invoke;
  v9[3] = &unk_264CFE578;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [(APCPlayerEngine *)playerEngine stopEngineAfterMinimumLoops:a3 withCompletion:v9];
}

uint64_t __54__APCPlayer_stopSendAfterMinimumLoops_withCompletion___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 40) = 0;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)stopSendWithFadeOut:(float)a3 completion:(id)a4
{
  id v6 = a4;
  playerEngine = self->_playerEngine;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __44__APCPlayer_stopSendWithFadeOut_completion___block_invoke;
  v10[3] = &unk_264CFE578;
  v10[4] = self;
  id v11 = v6;
  id v8 = v6;
  *(float *)&double v9 = a3;
  [(APCPlayerEngine *)playerEngine stopEngineWithFadeOut:v10 completion:v9];
}

uint64_t __44__APCPlayer_stopSendWithFadeOut_completion___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 40) = 0;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (APCPlayerEmbedInfo)embeddingInfo
{
  playerEngine = self->_playerEngine;
  if (playerEngine)
  {
    playerEngine = [playerEngine embeddingInfo];
  }

  return (APCPlayerEmbedInfo *)playerEngine;
}

- (NSData)payload
{
  return self->_payload;
}

- (NSData)configurationData
{
  return self->_configurationData;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (BOOL)isPlaying
{
  return self->_isPlaying;
}

- (unint64_t)callbackTimingMSec
{
  return self->_callbackTimingMSec;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_configurationData, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_codecConfig, 0);
  objc_storeStrong((id *)&self->_playerEngine, 0);
  objc_storeStrong((id *)&self->_encodeProcessor, 0);

  objc_storeStrong((id *)&self->_player, 0);
}

@end