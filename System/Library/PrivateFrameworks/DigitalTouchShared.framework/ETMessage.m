@interface ETMessage
+ (id)unarchive:(id)a3;
+ (unsigned)messageType;
- (BOOL)delayWisp;
- (BOOL)hasWispingChildren;
- (BOOL)isAnimated;
- (BOOL)isRenderingOffscreen;
- (BOOL)isRenderingOffscreenOpaque;
- (BOOL)missedDuringPlayback;
- (BOOL)mute;
- (BOOL)reachedSizeLimit;
- (BOOL)sendTimeIsValid;
- (BOOL)shouldLoopDuringPlayback;
- (BOOL)supportsPlaybackTimeOffset;
- (CGPoint)scenePointFromNormalizedPoint:(CGPoint)a3 inScene:(id)a4;
- (ETMessage)init;
- (ETMessage)initWithCoder:(id)a3;
- (ETMessage)parentMessage;
- (ETMessageDelegate)delegate;
- (ETMessageTimeSource)timeSource;
- (NSString)identifier;
- (UIColor)color;
- (double)messageDuration;
- (double)sendTime;
- (double)startDelay;
- (double)timeCreated;
- (id)archive;
- (id)archiveData;
- (id)description;
- (id)messageTypeAsString;
- (unint64_t)messageVersion;
- (unsigned)messageType;
- (void)childMessageDidCompleteWisp:(id)a3;
- (void)childMessageDidDelayWisp:(id)a3;
- (void)displayInScene:(id)a3;
- (void)setColor:(id)a3;
- (void)setDelayWisp:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setMissedDuringPlayback:(BOOL)a3;
- (void)setMute:(BOOL)a3;
- (void)setParentMessage:(id)a3;
- (void)setRenderingOffscreen:(BOOL)a3;
- (void)setRenderingOffscreenOpaque:(BOOL)a3;
- (void)setSendTime:(double)a3;
- (void)setStartDelay:(double)a3;
- (void)setSupportsPlaybackTimeOffset:(BOOL)a3;
- (void)setTimeCreated:(double)a3;
- (void)setTimeSource:(id)a3;
- (void)stopPlaying;
- (void)wispChildren;
@end

@implementation ETMessage

+ (unsigned)messageType
{
  return -1;
}

- (unsigned)messageType
{
  v2 = objc_opt_class();

  return [v2 messageType];
}

- (ETMessage)init
{
  v9.receiver = self;
  v9.super_class = (Class)ETMessage;
  v2 = [(ETMessage *)&v9 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F1C550] whiteColor];
    color = v2->_color;
    v2->_color = (UIColor *)v3;

    v5 = [MEMORY[0x263F08C38] UUID];
    uint64_t v6 = [v5 UUIDString];
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)v6;

    v2->_timeCreated = CFAbsoluteTimeGetCurrent();
  }
  return v2;
}

- (id)archiveData
{
  return 0;
}

+ (id)unarchive:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [[ETPHeader alloc] initWithData:v3];
  v5 = v4;
  if (v4 && [(ETPHeader *)v4 hasMessageType])
  {
    uint64_t v6 = [(ETPHeader *)v5 messageData];
    uint64_t v7 = [(ETPHeader *)v5 messageType];
    switch((int)v7)
    {
      case 1:
        v8 = ETTapMessage;
        goto LABEL_13;
      case 2:
        v8 = ETQuickTapMessage;
        goto LABEL_13;
      case 3:
        v8 = ETHeartbeatMessage;
        goto LABEL_13;
      case 4:
        v8 = ETSketchMessage;
        goto LABEL_13;
      case 5:
        v8 = ETReadReceiptMessage;
        goto LABEL_13;
      case 6:
        v8 = ETVideoMessage;
        goto LABEL_13;
      case 7:
        v8 = ETKissMessage;
        goto LABEL_13;
      case 8:
        v8 = ETAngerMessage;
LABEL_13:
        objc_super v9 = (void *)[[v8 alloc] initWithArchiveData:v6];
        break;
      default:
        uint64_t v22 = v7;
        if (IMOSLoggingEnabled())
        {
          v23 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            v24 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v22);
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v26 = v22;
            *(_WORD *)&v26[4] = 2112;
            *(void *)&v26[6] = v24;
            _os_log_impl(&dword_23B55A000, v23, OS_LOG_TYPE_INFO, "Unknown message type %du (%@)", buf, 0x12u);
          }
        }
        objc_super v9 = 0;
        break;
    }
    if ([(ETPHeader *)v5 hasIdentifier])
    {
      v10 = [(ETPHeader *)v5 identifier];
      v11 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v10];
      BOOL v12 = v11 == 0;

      if (v12)
      {
        if (IMOSLoggingEnabled())
        {
          v13 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            *(void *)v26 = "+[ETMessage unarchive:]";
            *(_WORD *)&v26[8] = 2112;
            *(void *)&v26[10] = v10;
            _os_log_impl(&dword_23B55A000, v13, OS_LOG_TYPE_INFO, "%s: unarchived Digital Touch message header has a malformed identifier! (\"%@\")", buf, 0x16u);
          }
        }
      }
      else
      {
        [v9 setIdentifier:v10];
      }
    }
    if ([(ETPHeader *)v5 hasBaseColor])
    {
      unsigned int v14 = bswap32([(ETPHeader *)v5 baseColor]);
      v15 = [MEMORY[0x263F1C550] colorWithRed:(double)v14 / 255.0 green:(double)BYTE1(v14) / 255.0 blue:(double)BYTE2(v14) / 255.0 alpha:(double)HIBYTE(v14) / 255.0];
      [v9 setColor:v15];
    }
    else
    {
      [v9 setColor:0];
    }
    BOOL v16 = [(ETPHeader *)v5 hasSendDate];
    double v17 = 0.0;
    if (v16) {
      double v17 = (double)[(ETPHeader *)v5 sendDate] / 1000.0;
    }
    [v9 setSendTime:v17];
    BOOL v18 = [(ETPHeader *)v5 hasStartDelay];
    double v19 = 0.0;
    if (v18) {
      [(ETPHeader *)v5 startDelay];
    }
    [v9 setStartDelay:v19];
    if ([(ETPHeader *)v5 hasSupportsPlaybackTimeOffsets]) {
      uint64_t v20 = [(ETPHeader *)v5 supportsPlaybackTimeOffsets];
    }
    else {
      uint64_t v20 = 0;
    }
    [v9 setSupportsPlaybackTimeOffset:v20];
  }
  else
  {
    objc_super v9 = 0;
  }

  return v9;
}

- (id)archive
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(ETPHeader);
  unsigned int v4 = [(ETMessage *)self messageType];
  if (v4 < 0xB && ((0x7C7u >> v4) & 1) != 0)
  {
    [(ETPHeader *)v3 setMessageType:dword_23B58D918[(__int16)v4]];
    v8 = [(ETMessage *)self color];

    if (v8)
    {
      objc_super v9 = [(ETMessage *)self color];
      double v22 = 0.0;
      *(void *)buf = 0;
      double v20 = 0.0;
      double v21 = 0.0;
      [v9 getRed:buf green:&v22 blue:&v21 alpha:&v20];
      float v10 = *(double *)buf * 255.0;
      unsigned int v11 = llroundf(v10);
      float v12 = v22 * 255.0;
      unsigned int v13 = llroundf(v12);
      float v14 = v21 * 255.0;
      unsigned int v15 = llroundf(v14);
      float v16 = v20 * 255.0;
      [(ETPHeader *)v3 setBaseColor:bswap32((v15 << 16) | (llroundf(v16) << 24) | (v13 << 8) | v11)];
    }
    [(ETMessage *)self sendTime];
    [(ETPHeader *)v3 setSendDate:(uint64_t)(v17 * 1000.0)];
    BOOL v18 = [(ETMessage *)self archiveData];
    [(ETPHeader *)v3 setMessageData:v18];

    [(ETPHeader *)v3 setIdentifier:self->_identifier];
    [(ETPHeader *)v3 setStartDelay:self->_startDelay];
    [(ETPHeader *)v3 setSupportsPlaybackTimeOffsets:self->_supportsPlaybackTimeOffset];
    uint64_t v7 = [(ETPHeader *)v3 data];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        uint64_t v6 = NSStringFromETMessageType([(ETMessage *)self messageType]);
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v6;
        _os_log_impl(&dword_23B55A000, v5, OS_LOG_TYPE_INFO, "Cannot archive message of type %@", buf, 0xCu);
      }
    }
    uint64_t v7 = 0;
  }

  return v7;
}

- (ETMessage)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ETMessage;
  return [(ETMessage *)&v4 init];
}

- (void)displayInScene:(id)a3
{
  v34[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v6 = (void (*)(id))getSKSetResourceBundleSymbolLoc_ptr;
  v32 = getSKSetResourceBundleSymbolLoc_ptr;
  if (!getSKSetResourceBundleSymbolLoc_ptr)
  {
    uint64_t v24 = MEMORY[0x263EF8330];
    uint64_t v25 = 3221225472;
    v26 = __getSKSetResourceBundleSymbolLoc_block_invoke;
    uint64_t v27 = &unk_264DEC848;
    v28 = &v29;
    uint64_t v7 = (void *)SpriteKitLibrary();
    v30[3] = (uint64_t)dlsym(v7, "SKSetResourceBundle");
    getSKSetResourceBundleSymbolLoc_ptr = *(_UNKNOWN **)(v28[1] + 24);
    uint64_t v6 = (void (*)(id))v30[3];
  }
  _Block_object_dispose(&v29, 8);
  if (!v6) {
    -[ETMessage displayInScene:]();
  }
  v6(v5);

  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2050000000;
  v8 = (void *)getSKSpriteNodeClass_softClass;
  v32 = (void *)getSKSpriteNodeClass_softClass;
  if (!getSKSpriteNodeClass_softClass)
  {
    uint64_t v24 = MEMORY[0x263EF8330];
    uint64_t v25 = 3221225472;
    v26 = __getSKSpriteNodeClass_block_invoke;
    uint64_t v27 = &unk_264DEC848;
    v28 = &v29;
    __getSKSpriteNodeClass_block_invoke((uint64_t)&v24);
    v8 = (void *)v30[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v29, 8);
  float v10 = [v9 spriteNodeWithImageNamed:@"Dot"];
  [v10 setColorBlendFactor:0.8];
  unsigned int v11 = [(ETMessage *)self color];
  [v10 setColor:v11];

  [v10 setScale:0.0005];
  id SKActionClass = getSKActionClass();
  unsigned int v13 = [getSKActionClass() scaleTo:0.005 duration:1.0];
  v34[0] = v13;
  float v14 = [getSKActionClass() fadeOutWithDuration:1.0];
  v34[1] = v14;
  unsigned int v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:2];
  float v16 = [SKActionClass group:v15];

  id v17 = getSKActionClass();
  v33[0] = v16;
  BOOL v18 = [getSKActionClass() removeFromParent];
  v33[1] = v18;
  id v19 = getSKActionClass();
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __28__ETMessage_displayInScene___block_invoke;
  v23[3] = &unk_264DEC6D0;
  v23[4] = self;
  double v20 = [v19 runBlock:v23 queue:MEMORY[0x263EF83A0]];
  v33[2] = v20;
  double v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:3];
  double v22 = [v17 sequence:v21];
  [v10 runAction:v22];

  [v4 addChild:v10];
}

uint64_t __28__ETMessage_displayInScene___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopPlaying];
}

- (id)messageTypeAsString
{
  return @"Unknown";
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(ETMessage *)self messageTypeAsString];
  uint64_t v6 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:self->_timeCreated];
  double timeCreated = self->_timeCreated;
  v8 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:self->_sendTime];
  objc_msgSend(v3, "stringWithFormat:", @"%@: %p; messageType: %@, time created: %@ (%f), sendTime: %@ (%f), identifier: %@",
    v4,
    self,
    v5,
    v6,
    *(void *)&timeCreated,
    v8,
    *(void *)&self->_sendTime,
  id v9 = self->_identifier);

  return v9;
}

- (BOOL)sendTimeIsValid
{
  [(ETMessage *)self sendTime];
  return v2 > 0.0;
}

- (BOOL)reachedSizeLimit
{
  return 0;
}

- (CGPoint)scenePointFromNormalizedPoint:(CGPoint)a3 inScene:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  [a4 size];
  double v7 = x * v6;
  double v9 = y * v8;
  result.double y = v9;
  result.double x = v7;
  return result;
}

- (void)stopPlaying
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained messageWillStopPlaying:self];

  id v5 = objc_loadWeakRetained((id *)p_delegate);
  [v5 messageDidStopPlaying:self];
}

- (double)messageDuration
{
  return 0.0;
}

- (BOOL)shouldLoopDuringPlayback
{
  return 0;
}

- (void)wispChildren
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  double v2 = (void *)[(NSMutableSet *)self->_childrenDelayingWisp copy];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v8, "messageType", (void)v9) != 1) {
          [v8 stopPlaying];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)childMessageDidCompleteWisp:(id)a3
{
}

- (void)childMessageDidDelayWisp:(id)a3
{
  id v4 = a3;
  childrenDelayingWisp = self->_childrenDelayingWisp;
  id v8 = v4;
  if (!childrenDelayingWisp)
  {
    uint64_t v6 = [MEMORY[0x263EFF9C0] set];
    double v7 = self->_childrenDelayingWisp;
    self->_childrenDelayingWisp = v6;

    id v4 = v8;
    childrenDelayingWisp = self->_childrenDelayingWisp;
  }
  [(NSMutableSet *)childrenDelayingWisp addObject:v4];
}

- (BOOL)hasWispingChildren
{
  return [(NSMutableSet *)self->_childrenDelayingWisp count] != 0;
}

- (BOOL)isAnimated
{
  return 1;
}

- (unint64_t)messageVersion
{
  return self->_messageVersion;
}

- (double)timeCreated
{
  return self->_timeCreated;
}

- (void)setTimeCreated:(double)a3
{
  self->_double timeCreated = a3;
}

- (double)sendTime
{
  return self->_sendTime;
}

- (void)setSendTime:(double)a3
{
  self->_sendTime = a3;
}

- (double)startDelay
{
  return self->_startDelay;
}

- (void)setStartDelay:(double)a3
{
  self->_startDeladouble y = a3;
}

- (BOOL)supportsPlaybackTimeOffset
{
  return self->_supportsPlaybackTimeOffset;
}

- (void)setSupportsPlaybackTimeOffset:(BOOL)a3
{
  self->_supportsPlaybackTimeOffset = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (BOOL)missedDuringPlayback
{
  return self->_missedDuringPlayback;
}

- (void)setMissedDuringPlayback:(BOOL)a3
{
  self->_missedDuringPlayback = a3;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (BOOL)isRenderingOffscreen
{
  return self->_renderingOffscreen;
}

- (void)setRenderingOffscreen:(BOOL)a3
{
  self->_renderingOffscreen = a3;
}

- (BOOL)isRenderingOffscreenOpaque
{
  return self->_renderingOffscreenOpaque;
}

- (void)setRenderingOffscreenOpaque:(BOOL)a3
{
  self->_renderingOffscreenOpaque = a3;
}

- (ETMessageDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ETMessageDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (ETMessageTimeSource)timeSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_timeSource);

  return (ETMessageTimeSource *)WeakRetained;
}

- (void)setTimeSource:(id)a3
{
}

- (BOOL)delayWisp
{
  return self->_delayWisp;
}

- (void)setDelayWisp:(BOOL)a3
{
  self->_delayWisp = a3;
}

- (ETMessage)parentMessage
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentMessage);

  return (ETMessage *)WeakRetained;
}

- (void)setParentMessage:(id)a3
{
}

- (BOOL)mute
{
  return self->_mute;
}

- (void)setMute:(BOOL)a3
{
  self->_mute = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentMessage);
  objc_destroyWeak((id *)&self->_timeSource);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_childrenDelayingWisp, 0);
}

- (void)displayInScene:.cold.1()
{
}

@end