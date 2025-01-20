@interface ADAMAudioDataReceiver
- (ADAMAudioDataReceiver)initWithIdentifier:(id)a3;
- (ADAMAudioDataReceiverDelegate)delegate;
- (BOOL)connectionDidInvalidate;
- (BOOL)isMeasurementOnForAudioSampleType:(unsigned int)a3;
- (BOOL)verifyInvariants;
- (id)getCurrentConfigurationForAudioSampleType:(unsigned int)a3;
- (id)setupConnection;
- (void)configureAudioSampleType:(unsigned int)a3 configuration:(id)a4;
- (void)dealloc;
- (void)handleAndLogError:(id)a3;
- (void)receiveAudioSample:(id)a3;
- (void)receiveAudioSample:(id)a3 type:(unsigned int)a4 metadata:(id)a5;
- (void)reconnect;
- (void)reset;
- (void)setConnectionDidInvalidate:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)startMeasuringAudioSampleType:(unsigned int)a3 withConfiguration:(id)a4;
- (void)startReceivingAudioSampleType:(unsigned int)a3;
- (void)startReceivingAudioSampleType:(unsigned int)a3 withCallback:(id)a4;
- (void)stopMeasuringAudioSampleType:(unsigned int)a3;
- (void)stopReceivingAudioSampleType:(unsigned int)a3;
@end

@implementation ADAMAudioDataReceiver

- (ADAMAudioDataReceiver)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ADAMAudioDataReceiver;
  v6 = [(ADAMAudioDataReceiver *)&v17 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_name, a3);
    uint64_t v8 = [(ADAMAudioDataReceiver *)v7 setupConnection];
    connection = v7->_connection;
    v7->_connection = (NSXPCConnection *)v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    sensorStatus = v7->_sensorStatus;
    v7->_sensorStatus = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    callbacks = v7->_callbacks;
    v7->_callbacks = v12;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    configs = v7->_configs;
    v7->_configs = v14;

    v7->_lock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (void)reset
{
  connection = self->_connection;
  if (connection) {
    [(NSXPCConnection *)connection invalidate];
  }
  name = self->_name;
  self->_name = 0;

  id v5 = self->_connection;
  self->_connection = 0;

  sensorStatus = self->_sensorStatus;
  self->_sensorStatus = 0;

  callbacks = self->_callbacks;
  self->_callbacks = 0;

  configs = self->_configs;
  self->_configs = 0;
}

- (BOOL)verifyInvariants
{
  return self->_connection && self->_sensorStatus && self->_callbacks && self->_configs != 0;
}

- (void)receiveAudioSample:(id)a3 type:(unsigned int)a4 metadata:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  os_unfair_lock_lock(&self->_lock);
  callbacks = self->_callbacks;
  v11 = [NSNumber numberWithUnsignedInteger:v6];
  v12 = [(NSMutableDictionary *)callbacks objectForKey:v11];

  os_unfair_lock_unlock(&self->_lock);
  if (v12)
  {
    ((void (**)(void, id, id))v12)[2](v12, v8, v9);
  }
  else
  {
    v13 = ADAFLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ADAMAudioDataReceiver receiveAudioSample:type:metadata:]();
    }

    [(ADAMAudioDataReceiver *)self stopReceivingAudioSampleType:v6];
  }
}

- (void)startReceivingAudioSampleType:(unsigned int)a3 withCallback:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if ([(ADAMAudioDataReceiver *)self verifyInvariants])
  {
    v7 = ADAFLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = +[ADAFUtil stringFromDataType:v4];
      *(_DWORD *)buf = 138412290;
      v18 = v8;
      _os_log_impl(&dword_21873E000, v7, OS_LOG_TYPE_DEFAULT, "start receiving audio sample type: %@", buf, 0xCu);
    }
    os_unfair_lock_lock(&self->_lock);
    callbacks = self->_callbacks;
    v10 = (void *)[v6 copy];
    v11 = [NSNumber numberWithUnsignedInteger:v4];
    [(NSMutableDictionary *)callbacks setObject:v10 forKey:v11];

    os_unfair_lock_unlock(&self->_lock);
    connection = self->_connection;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __68__ADAMAudioDataReceiver_startReceivingAudioSampleType_withCallback___block_invoke;
    v16[3] = &unk_2643371A0;
    v16[4] = self;
    v13 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v16];
    name = self->_name;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __68__ADAMAudioDataReceiver_startReceivingAudioSampleType_withCallback___block_invoke_6;
    v15[3] = &unk_2643371A0;
    v15[4] = self;
    [v13 startListeningToAudioSampleWithIdentifier:name type:v4 withReply:v15];
  }
}

void __68__ADAMAudioDataReceiver_startReceivingAudioSampleType_withCallback___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = ADAFLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __68__ADAMAudioDataReceiver_startReceivingAudioSampleType_withCallback___block_invoke_cold_1();
  }
}

uint64_t __68__ADAMAudioDataReceiver_startReceivingAudioSampleType_withCallback___block_invoke_6(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) handleAndLogError:a2];
  }
  return result;
}

- (void)startReceivingAudioSampleType:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  if ([(ADAMAudioDataReceiver *)self verifyInvariants])
  {
    id v5 = ADAFLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = +[ADAFUtil stringFromDataType:v3];
      *(_DWORD *)buf = 138412290;
      v15 = v6;
      _os_log_impl(&dword_21873E000, v5, OS_LOG_TYPE_DEFAULT, "start receiving audio sample type: %@", buf, 0xCu);
    }
    os_unfair_lock_lock(&self->_lock);
    callbacks = self->_callbacks;
    id v8 = [NSNumber numberWithUnsignedInteger:v3];
    [(NSMutableDictionary *)callbacks setObject:&__block_literal_global_9 forKey:v8];

    os_unfair_lock_unlock(&self->_lock);
    connection = self->_connection;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __55__ADAMAudioDataReceiver_startReceivingAudioSampleType___block_invoke_2;
    v13[3] = &unk_2643371A0;
    v13[4] = self;
    v10 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v13];
    name = self->_name;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __55__ADAMAudioDataReceiver_startReceivingAudioSampleType___block_invoke_10;
    v12[3] = &unk_2643371A0;
    v12[4] = self;
    [v10 startListeningToAudioSampleWithIdentifier:name type:v3 withReply:v12];
  }
}

void __55__ADAMAudioDataReceiver_startReceivingAudioSampleType___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = ADAFLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __68__ADAMAudioDataReceiver_startReceivingAudioSampleType_withCallback___block_invoke_cold_1();
  }
}

uint64_t __55__ADAMAudioDataReceiver_startReceivingAudioSampleType___block_invoke_10(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) handleAndLogError:a2];
  }
  return result;
}

- (void)stopReceivingAudioSampleType:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  if ([(ADAMAudioDataReceiver *)self verifyInvariants])
  {
    id v5 = ADAFLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = +[ADAFUtil stringFromDataType:v3];
      *(_DWORD *)buf = 138412290;
      v15 = v6;
      _os_log_impl(&dword_21873E000, v5, OS_LOG_TYPE_DEFAULT, "stop receiving audio sample type: %@", buf, 0xCu);
    }
    os_unfair_lock_lock(&self->_lock);
    callbacks = self->_callbacks;
    id v8 = [NSNumber numberWithUnsignedInteger:v3];
    [(NSMutableDictionary *)callbacks removeObjectForKey:v8];

    os_unfair_lock_unlock(&self->_lock);
    connection = self->_connection;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __54__ADAMAudioDataReceiver_stopReceivingAudioSampleType___block_invoke;
    v13[3] = &unk_2643371A0;
    v13[4] = self;
    v10 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v13];
    name = self->_name;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __54__ADAMAudioDataReceiver_stopReceivingAudioSampleType___block_invoke_11;
    v12[3] = &unk_2643371A0;
    v12[4] = self;
    [v10 stopListeningToAudioSampleTypeWithIdentifier:name type:v3 withReply:v12];
  }
}

void __54__ADAMAudioDataReceiver_stopReceivingAudioSampleType___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = ADAFLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __54__ADAMAudioDataReceiver_stopReceivingAudioSampleType___block_invoke_cold_1();
  }
}

uint64_t __54__ADAMAudioDataReceiver_stopReceivingAudioSampleType___block_invoke_11(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) handleAndLogError:a2];
  }
  return result;
}

- (void)startMeasuringAudioSampleType:(unsigned int)a3 withConfiguration:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if ([(ADAMAudioDataReceiver *)self verifyInvariants])
  {
    v7 = ADAFLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = +[ADAFUtil stringFromDataType:v4];
      *(_DWORD *)buf = 138412290;
      id v24 = v8;
      _os_log_impl(&dword_21873E000, v7, OS_LOG_TYPE_DEFAULT, "attempting to start measuring %@ with configuration", buf, 0xCu);
    }
    if (v4 == 1702260324)
    {
      id v9 = ADAFLog();
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      if (v6)
      {
        if (v10)
        {
          *(_DWORD *)buf = 138412290;
          id v24 = v6;
          v11 = "%@";
          v12 = v9;
          uint32_t v13 = 12;
LABEL_10:
          _os_log_impl(&dword_21873E000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
        }
      }
      else if (v10)
      {
        *(_WORD *)buf = 0;
        v11 = "configuration empty";
        v12 = v9;
        uint32_t v13 = 2;
        goto LABEL_10;
      }

      os_unfair_lock_lock(&self->_lock);
      sensorStatus = self->_sensorStatus;
      v15 = [NSNumber numberWithBool:1];
      uint64_t v16 = [NSNumber numberWithUnsignedInteger:1702260324];
      [(NSMutableDictionary *)sensorStatus setObject:v15 forKey:v16];

      if (v6)
      {
        configs = self->_configs;
        v18 = [NSDictionary dictionaryWithDictionary:v6];
        uint64_t v19 = [NSNumber numberWithUnsignedInteger:1702260324];
        [(NSMutableDictionary *)configs setObject:v18 forKey:v19];
      }
      os_unfair_lock_unlock(&self->_lock);
      v20 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_14];
      name = self->_name;
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __73__ADAMAudioDataReceiver_startMeasuringAudioSampleType_withConfiguration___block_invoke_15;
      v22[3] = &unk_2643371A0;
      v22[4] = self;
      [v20 startMeasuringAudioSampleTypeWithIdentifier:name type:1702260324 withConfiguration:v6 andReply:v22];
    }
  }
}

void __73__ADAMAudioDataReceiver_startMeasuringAudioSampleType_withConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = ADAFLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __73__ADAMAudioDataReceiver_startMeasuringAudioSampleType_withConfiguration___block_invoke_cold_1();
  }
}

uint64_t __73__ADAMAudioDataReceiver_startMeasuringAudioSampleType_withConfiguration___block_invoke_15(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) handleAndLogError:a2];
  }
  return result;
}

- (void)stopMeasuringAudioSampleType:(unsigned int)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  BOOL v5 = [(ADAMAudioDataReceiver *)self verifyInvariants];
  if (a3 == 1702260324 && v5)
  {
    id v6 = ADAFLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = +[ADAFUtil stringFromDataType:1702260324];
      *(_DWORD *)buf = 138412290;
      v18 = v7;
      _os_log_impl(&dword_21873E000, v6, OS_LOG_TYPE_DEFAULT, "attempting to stop measuring %@", buf, 0xCu);
    }
    os_unfair_lock_lock(&self->_lock);
    sensorStatus = self->_sensorStatus;
    id v9 = [NSNumber numberWithUnsignedInteger:1702260324];
    BOOL v10 = [(NSMutableDictionary *)sensorStatus objectForKey:v9];

    if (v10)
    {
      v11 = self->_sensorStatus;
      v12 = [NSNumber numberWithBool:0];
      uint32_t v13 = [NSNumber numberWithUnsignedInteger:1702260324];
      [(NSMutableDictionary *)v11 setObject:v12 forKey:v13];
    }
    os_unfair_lock_unlock(&self->_lock);
    v14 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_17];
    name = self->_name;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __54__ADAMAudioDataReceiver_stopMeasuringAudioSampleType___block_invoke_18;
    v16[3] = &unk_2643371A0;
    v16[4] = self;
    [v14 stopMeasuringAudioSampleTypeWithIdentifier:name type:1702260324 andReply:v16];
  }
}

void __54__ADAMAudioDataReceiver_stopMeasuringAudioSampleType___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = ADAFLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __73__ADAMAudioDataReceiver_startMeasuringAudioSampleType_withConfiguration___block_invoke_cold_1();
  }
}

uint64_t __54__ADAMAudioDataReceiver_stopMeasuringAudioSampleType___block_invoke_18(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) handleAndLogError:a2];
  }
  return result;
}

- (void)configureAudioSampleType:(unsigned int)a3 configuration:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a4;
  BOOL v7 = [(ADAMAudioDataReceiver *)self verifyInvariants];
  if (v6 && v7)
  {
    id v8 = ADAFLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = +[ADAFUtil stringFromDataType:v4];
      *(_DWORD *)buf = 138412546;
      objc_super v17 = v9;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl(&dword_21873E000, v8, OS_LOG_TYPE_DEFAULT, "configuring %@ with configs: %@", buf, 0x16u);
    }
    os_unfair_lock_lock(&self->_lock);
    configs = self->_configs;
    v11 = (void *)[objc_alloc(NSDictionary) initWithDictionary:v6 copyItems:1];
    v12 = [NSNumber numberWithUnsignedInteger:v4];
    [(NSMutableDictionary *)configs setObject:v11 forKey:v12];

    os_unfair_lock_unlock(&self->_lock);
    uint32_t v13 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_20];
    name = self->_name;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __64__ADAMAudioDataReceiver_configureAudioSampleType_configuration___block_invoke_21;
    v15[3] = &unk_2643371A0;
    v15[4] = self;
    [v13 configureAudioSampleTypeWithIdentifier:name type:v4 configuration:v6 withReply:v15];
  }
}

void __64__ADAMAudioDataReceiver_configureAudioSampleType_configuration___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = ADAFLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __73__ADAMAudioDataReceiver_startMeasuringAudioSampleType_withConfiguration___block_invoke_cold_1();
  }
}

uint64_t __64__ADAMAudioDataReceiver_configureAudioSampleType_configuration___block_invoke_21(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) handleAndLogError:a2];
  }
  return result;
}

- (id)getCurrentConfigurationForAudioSampleType:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v26 = *MEMORY[0x263EF8340];
  if ([(ADAMAudioDataReceiver *)self verifyInvariants])
  {
    uint64_t v18 = 0;
    id v19 = &v18;
    uint64_t v20 = 0x3032000000;
    v21 = __Block_byref_object_copy_;
    v22 = __Block_byref_object_dispose_;
    dispatch_semaphore_t v23 = dispatch_semaphore_create(0);
    uint64_t v12 = 0;
    uint32_t v13 = &v12;
    uint64_t v14 = 0x3032000000;
    v15 = __Block_byref_object_copy_;
    uint64_t v16 = __Block_byref_object_dispose_;
    id v17 = 0;
    BOOL v5 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_23];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __67__ADAMAudioDataReceiver_getCurrentConfigurationForAudioSampleType___block_invoke_24;
    v11[3] = &unk_264337208;
    v11[4] = &v12;
    v11[5] = &v18;
    [v5 getCurrentConfigurationForAudioSampleType:v3 withReply:v11];

    id v6 = v19[5];
    dispatch_time_t v7 = dispatch_time(0xFFFFFFFFFFFFFFFELL, 2000000000);
    if (dispatch_semaphore_wait(v6, v7))
    {
      id v8 = ADAFLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v25 = "-[ADAMAudioDataReceiver getCurrentConfigurationForAudioSampleType:]";
        _os_log_impl(&dword_21873E000, v8, OS_LOG_TYPE_DEFAULT, "connection timeout: %s", buf, 0xCu);
      }
    }
    id v9 = (id)v13[5];
    _Block_object_dispose(&v12, 8);

    _Block_object_dispose(&v18, 8);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

void __67__ADAMAudioDataReceiver_getCurrentConfigurationForAudioSampleType___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = ADAFLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __73__ADAMAudioDataReceiver_startMeasuringAudioSampleType_withConfiguration___block_invoke_cold_1();
  }
}

intptr_t __67__ADAMAudioDataReceiver_getCurrentConfigurationForAudioSampleType___block_invoke_24(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = [NSDictionary dictionaryWithDictionary:a2];
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    BOOL v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  id v6 = *(NSObject **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  return dispatch_semaphore_signal(v6);
}

- (BOOL)isMeasurementOnForAudioSampleType:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (![(ADAMAudioDataReceiver *)self verifyInvariants]) {
    return 0;
  }
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy_;
  uint64_t v20 = __Block_byref_object_dispose_;
  dispatch_semaphore_t v21 = dispatch_semaphore_create(0);
  uint64_t v12 = 0;
  uint32_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  BOOL v5 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_27];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __59__ADAMAudioDataReceiver_isMeasurementOnForAudioSampleType___block_invoke_28;
  v11[3] = &unk_264337230;
  v11[4] = &v12;
  v11[5] = &v16;
  [v5 isMeasurementOnForAudioSampleType:v3 withReply:v11];

  id v6 = v17[5];
  dispatch_time_t v7 = dispatch_time(0xFFFFFFFFFFFFFFFELL, 2000000000);
  if (dispatch_semaphore_wait(v6, v7))
  {
    id v8 = ADAFLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      dispatch_semaphore_t v23 = "-[ADAMAudioDataReceiver isMeasurementOnForAudioSampleType:]";
      _os_log_impl(&dword_21873E000, v8, OS_LOG_TYPE_DEFAULT, "connection timeout: %s", buf, 0xCu);
    }
  }
  BOOL v9 = *((unsigned char *)v13 + 24) != 0;
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);

  return v9;
}

void __59__ADAMAudioDataReceiver_isMeasurementOnForAudioSampleType___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = ADAFLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __73__ADAMAudioDataReceiver_startMeasuringAudioSampleType_withConfiguration___block_invoke_cold_1();
  }
}

intptr_t __59__ADAMAudioDataReceiver_isMeasurementOnForAudioSampleType___block_invoke_28(uint64_t a1, int a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  uint64_t v4 = ADAFLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = "OFF";
    if (a2) {
      BOOL v5 = "ON";
    }
    int v7 = 136315138;
    id v8 = v5;
    _os_log_impl(&dword_21873E000, v4, OS_LOG_TYPE_DEFAULT, "measurement is %s", (uint8_t *)&v7, 0xCu);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

- (void)receiveAudioSample:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = ADAFLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_impl(&dword_21873E000, v5, OS_LOG_TYPE_INFO, "receieved audio data analysis sample %@", (uint8_t *)&v11, 0xCu);
  }

  id v6 = [(ADAMAudioDataReceiver *)self delegate];

  if (v6)
  {
    int v7 = ADAFLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = [v4 uuid];
      id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
      int v11 = 138412546;
      id v12 = v8;
      __int16 v13 = 2112;
      id v14 = WeakRetained;
      _os_log_impl(&dword_21873E000, v7, OS_LOG_TYPE_INFO, "sending sample [%@] to delegate %@", (uint8_t *)&v11, 0x16u);
    }
    BOOL v10 = [(ADAMAudioDataReceiver *)self delegate];
    [v10 receiveAudioSample:v4];
  }
}

- (id)setupConnection
{
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.audio.adam.xpc" options:4096];
  id v4 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C9DBBC0];
  [v3 setRemoteObjectInterface:v4];

  BOOL v5 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C9DA6A0];
  [v3 setExportedInterface:v5];

  [v3 setExportedObject:self];
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __40__ADAMAudioDataReceiver_setupConnection__block_invoke;
  v10[3] = &unk_264337258;
  objc_copyWeak(&v11, &location);
  [v3 setInterruptionHandler:v10];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __40__ADAMAudioDataReceiver_setupConnection__block_invoke_97;
  v8[3] = &unk_264337258;
  objc_copyWeak(&v9, &location);
  [v3 setInvalidationHandler:v8];
  id v6 = objc_loadWeakRetained(&location);
  [v6 setConnectionDidInvalidate:0];

  [v3 resume];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v3;
}

void __40__ADAMAudioDataReceiver_setupConnection__block_invoke(uint64_t a1)
{
  id v2 = ADAFLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __40__ADAMAudioDataReceiver_setupConnection__block_invoke_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reconnect];
}

void __40__ADAMAudioDataReceiver_setupConnection__block_invoke_97(uint64_t a1)
{
  id v2 = ADAFLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __40__ADAMAudioDataReceiver_setupConnection__block_invoke_97_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setConnectionDidInvalidate:1];
}

- (void)reconnect
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_21873E000, v0, v1, "re-connection to AudioDataAnalysisManager(ADAM) aborted due to invalid connection", v2, v3, v4, v5, v6);
}

void __34__ADAMAudioDataReceiver_reconnect__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 unsignedIntegerValue];
  int v8 = [v6 BOOLValue];

  if (v8)
  {
    id v9 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKey:v5];
    BOOL v10 = ADAFLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = +[ADAFUtil stringFromDataType:v7];
      *(_DWORD *)buf = 138412546;
      id v17 = v11;
      __int16 v18 = 2112;
      id v19 = v9;
      _os_log_impl(&dword_21873E000, v10, OS_LOG_TYPE_DEFAULT, "*restart* measuring '%@' with cfg: %@", buf, 0x16u);
    }
    id v12 = [*(id *)(*(void *)(a1 + 32) + 40) remoteObjectProxyWithErrorHandler:&__block_literal_global_100];
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = *(void *)(v13 + 8);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __34__ADAMAudioDataReceiver_reconnect__block_invoke_101;
    v15[3] = &unk_2643371A0;
    v15[4] = v13;
    [v12 startMeasuringAudioSampleTypeWithIdentifier:v14 type:v7 withConfiguration:v9 andReply:v15];
  }
}

void __34__ADAMAudioDataReceiver_reconnect__block_invoke_98(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = ADAFLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __73__ADAMAudioDataReceiver_startMeasuringAudioSampleType_withConfiguration___block_invoke_cold_1();
  }
}

uint64_t __34__ADAMAudioDataReceiver_reconnect__block_invoke_101(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) handleAndLogError:a2];
  }
  return result;
}

void __34__ADAMAudioDataReceiver_reconnect__block_invoke_103(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = ADAFLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __73__ADAMAudioDataReceiver_startMeasuringAudioSampleType_withConfiguration___block_invoke_cold_1();
  }
}

uint64_t __34__ADAMAudioDataReceiver_reconnect__block_invoke_106(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) handleAndLogError:a2];
  }
  return result;
}

- (void)handleAndLogError:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_12;
  }
  uint64_t v6 = [v4 code];
  if (v6 == 560164457)
  {
LABEL_5:
    [(ADAMAudioDataReceiver *)self reset];
    goto LABEL_9;
  }
  if (v6 != 1969974894)
  {
    if (v6 != 560295540)
    {
      uint64_t v7 = ADAFLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[ADAMAudioDataReceiver handleAndLogError:]();
      }

      goto LABEL_9;
    }
    goto LABEL_5;
  }
LABEL_9:
  int v8 = ADAFLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[ADAMAudioDataReceiver handleAndLogError:]();
  }

LABEL_12:
}

- (void)dealloc
{
  [(ADAMAudioDataReceiver *)self reset];
  v3.receiver = self;
  v3.super_class = (Class)ADAMAudioDataReceiver;
  [(ADAMAudioDataReceiver *)&v3 dealloc];
}

- (ADAMAudioDataReceiverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);

  return (ADAMAudioDataReceiverDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)connectionDidInvalidate
{
  return self->_connectionDidInvalidate;
}

- (void)setConnectionDidInvalidate:(BOOL)a3
{
  self->_connectionDidInvalidate = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_configs, 0);
  objc_storeStrong((id *)&self->_callbacks, 0);
  objc_storeStrong((id *)&self->_sensorStatus, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (void)receiveAudioSample:type:metadata:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_21873E000, v0, v1, "failed to fetch callback function", v2, v3, v4, v5, v6);
}

void __68__ADAMAudioDataReceiver_startReceivingAudioSampleType_withCallback___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_21873E000, v0, v1, "%@ : connection error %@");
}

void __54__ADAMAudioDataReceiver_stopReceivingAudioSampleType___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_21873E000, v0, v1, "%@ : connection error: %@");
}

void __73__ADAMAudioDataReceiver_startMeasuringAudioSampleType_withConfiguration___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21873E000, v0, v1, "connection error %@", v2, v3, v4, v5, v6);
}

void __40__ADAMAudioDataReceiver_setupConnection__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_21873E000, v0, v1, "Connection to AudioDataAnalysisManager(ADAM) interrupted, will attempt to reconnect", v2, v3, v4, v5, v6);
}

void __40__ADAMAudioDataReceiver_setupConnection__block_invoke_97_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_21873E000, v0, v1, "Connection to AudioDataAnalysisManager(ADAM) invalidated", v2, v3, v4, v5, v6);
}

- (void)handleAndLogError:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21873E000, v0, v1, "%@", v2, v3, v4, v5, v6);
}

- (void)handleAndLogError:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_21873E000, v0, v1, "Unexpected Error!", v2, v3, v4, v5, v6);
}

@end