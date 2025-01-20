@interface DTTapConfig
- (BOOL)discardHeartbeatsWhenPossible;
- (BOOL)filePreservation;
- (BOOL)isDeferredDisplay;
- (BOOL)spoolToDiskWhenPossible;
- (DTTapBulkDataReceiver)bulkDataReceiver;
- (DTTapConfig)init;
- (DTTapConfig)initWithPlist:(id)a3;
- (NSString)serviceName;
- (NSString)uuid;
- (id)_getSerializableObjectForKey:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)plist;
- (id)recordingInfoHandler;
- (id)runningMetadataChangedHandler;
- (id)statusHandler;
- (int64_t)serviceVersion;
- (unint64_t)bufferMode;
- (unint64_t)pollingInterval;
- (unint64_t)windowSize;
- (void)_dispatchStatus:(unsigned int)a3 timestamp:(unint64_t)a4 notice:(id)a5 info:(id)a6;
- (void)_removeSerializableObjectForKey:(id)a3;
- (void)_runningMetadataChanged:(id)a3;
- (void)_setSerializableObject:(id)a3 forKey:(id)a4;
- (void)refreshUUID;
- (void)setBufferMode:(unint64_t)a3;
- (void)setBulkDataReceiver:(id)a3;
- (void)setDiscardHeartbeatsWhenPossible:(BOOL)a3;
- (void)setFilePreservation:(BOOL)a3;
- (void)setIsDeferredDisplay:(BOOL)a3;
- (void)setPollingInterval:(unint64_t)a3;
- (void)setRecordingInfoHandler:(id)a3;
- (void)setRunningMetadataChangedHandler:(id)a3;
- (void)setServiceName:(id)a3;
- (void)setServiceVersion:(int64_t)a3;
- (void)setSpoolToDiskWhenPossible:(BOOL)a3;
- (void)setStatusHandler:(id)a3;
- (void)setUuid:(id)a3;
- (void)setWindowSize:(unint64_t)a3;
@end

@implementation DTTapConfig

- (DTTapConfig)init
{
  v8.receiver = self;
  v8.super_class = (Class)DTTapConfig;
  v2 = [(DTTapConfig *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    dict = v2->_dict;
    v2->_dict = (NSMutableDictionary *)v3;

    v2->_serviceVersion = -1;
    [(DTTapConfig *)v2 setBufferMode:0];
    uint64_t v5 = sub_2308D0ED0();
    uuid = v2->_uuid;
    v2->_uuid = (NSString *)v5;
  }
  return v2;
}

- (DTTapConfig)initWithPlist:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DTTapConfig;
  uint64_t v5 = [(DTTapConfig *)&v12 init];
  v6 = v5;
  if (v5)
  {
    v5->_serviceVersion = -1;
    uint64_t v7 = [v4 mutableCopy];
    dict = v6->_dict;
    v6->_dict = (NSMutableDictionary *)v7;

    uint64_t v9 = sub_2308D0ED0();
    uuid = v6->_uuid;
    v6->_uuid = (NSString *)v9;
  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [[[objc_opt_class() allocWithZone:a3] init] autorelease];
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = (void *)v5[1];
  v5[1] = v6;

  dict = self->_dict;
  uint64_t v21 = MEMORY[0x263EF8330];
  uint64_t v22 = 3221225472;
  v23 = sub_2308D10F4;
  v24 = &unk_264B8F478;
  v26 = a3;
  uint64_t v9 = v5;
  id v25 = v9;
  [(NSMutableDictionary *)dict enumerateKeysAndObjectsUsingBlock:&v21];
  uint64_t v10 = [(NSString *)self->_serviceName copy];
  v11 = (void *)v9[3];
  v9[3] = v10;

  v9[4] = self->_serviceVersion;
  v9[6] = self->_bulkDataReceiver;
  uint64_t v12 = [self->_runningMetadataChangedHandler copy];
  v13 = (void *)v9[7];
  v9[7] = v12;

  uint64_t v14 = [self->_statusHandler copy];
  v15 = (void *)v9[8];
  v9[8] = v14;

  uint64_t v16 = [self->_recordingInfoHandler copy];
  v17 = (void *)v9[9];
  v9[9] = v16;

  uint64_t v18 = [(NSString *)self->_uuid copy];
  v19 = (void *)v9[5];
  v9[5] = v18;

  return v9;
}

- (id)plist
{
  v2 = (void *)[(NSMutableDictionary *)self->_dict copy];
  return v2;
}

- (void)_setSerializableObject:(id)a3 forKey:(id)a4
{
}

- (id)_getSerializableObjectForKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_dict objectForKeyedSubscript:a3];
}

- (void)_removeSerializableObjectForKey:(id)a3
{
}

- (void)refreshUUID
{
  sub_2308D0ED0();
  uint64_t v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  uuid = self->_uuid;
  self->_uuid = v3;
}

- (void)setRunningMetadataChangedHandler:(id)a3
{
  id v4 = _Block_copy(a3);
  id runningMetadataChangedHandler = self->_runningMetadataChangedHandler;
  self->_id runningMetadataChangedHandler = v4;
}

- (void)setStatusHandler:(id)a3
{
  id v4 = _Block_copy(a3);
  id statusHandler = self->_statusHandler;
  self->_id statusHandler = v4;
}

- (void)_runningMetadataChanged:(id)a3
{
  id v4 = a3;
  id runningMetadataChangedHandler = self->_runningMetadataChangedHandler;
  if (runningMetadataChangedHandler)
  {
    uint64_t v6 = _Block_copy(runningMetadataChangedHandler);
    uint64_t v7 = dispatch_get_global_queue(0, 0);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = sub_2308D1350;
    v9[3] = &unk_264B8F4A0;
    id v11 = v6;
    id v10 = v4;
    id v8 = v6;
    dispatch_async(v7, v9);
  }
}

- (void)_dispatchStatus:(unsigned int)a3 timestamp:(unint64_t)a4 notice:(id)a5 info:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id statusHandler = self->_statusHandler;
  if (statusHandler)
  {
    v13 = _Block_copy(statusHandler);
    uint64_t v14 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_2308D1474;
    block[3] = &unk_264B8F4C8;
    unsigned int v21 = a3;
    id v19 = v13;
    unint64_t v20 = a4;
    id v17 = v10;
    id v18 = v11;
    id v15 = v13;
    dispatch_async(v14, block);
  }
}

- (BOOL)isDeferredDisplay
{
  v2 = [(DTTapConfig *)self _getSerializableObjectForKey:@"ur"];
  BOOL v3 = v2 == 0;

  return v3;
}

- (void)setIsDeferredDisplay:(BOOL)a3
{
  if (a3)
  {
    MEMORY[0x270F9A6D0](self, sel__removeSerializableObjectForKey_);
  }
  else
  {
    id v4 = [(DTTapConfig *)self _getSerializableObjectForKey:@"ur"];

    if (!v4)
    {
      id v5 = [NSNumber numberWithUnsignedInt:500];
      [(DTTapConfig *)self _setSerializableObject:v5 forKey:@"ur"];
    }
  }
}

- (BOOL)spoolToDiskWhenPossible
{
  v2 = [(DTTapConfig *)self _getSerializableObjectForKey:@"s2d"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setSpoolToDiskWhenPossible:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(DTTapConfig *)self _setSerializableObject:v4 forKey:@"s2d"];
}

- (BOOL)discardHeartbeatsWhenPossible
{
  v2 = [(DTTapConfig *)self _getSerializableObjectForKey:@"nohb"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setDiscardHeartbeatsWhenPossible:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(DTTapConfig *)self _setSerializableObject:v4 forKey:@"nohb"];
}

- (void)setPollingInterval:(unint64_t)a3
{
  if (a3)
  {
    id v4 = [NSNumber numberWithUnsignedInt:a3 / 0xF4240];
    [(DTTapConfig *)self _setSerializableObject:v4 forKey:@"ur"];
  }
  else
  {
    MEMORY[0x270F9A6D0](self, sel_setIsDeferredDisplay_);
  }
}

- (unint64_t)pollingInterval
{
  v2 = [(DTTapConfig *)self _getSerializableObjectForKey:@"ur"];
  uint64_t v3 = [v2 unsignedLongLongValue];

  return 1000000 * v3;
}

- (void)setBufferMode:(unint64_t)a3
{
  [NSNumber numberWithUnsignedInteger:];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  -[DTTapConfig _setSerializableObject:forKey:](self, "_setSerializableObject:forKey:");
  if (a3 - 1 <= 1) {
    [(DTTapConfig *)self setPollingInterval:0];
  }
}

- (unint64_t)bufferMode
{
  v2 = [(DTTapConfig *)self _getSerializableObjectForKey:@"bm"];
  uint64_t v3 = [v2 intValue];
  if (v2) {
    BOOL v4 = v3 > 2;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (v2) {
      NSLog(&cfstr_UnsupportedBuf_0.isa, v3);
    }
    unint64_t v5 = 1;
  }
  else
  {
    unint64_t v5 = v3;
  }

  return v5;
}

- (unint64_t)windowSize
{
  v2 = [(DTTapConfig *)self _getSerializableObjectForKey:@"ws"];
  uint64_t v3 = v2;
  if (v2) {
    unint64_t v4 = 1000000 * [v2 unsignedIntegerValue];
  }
  else {
    unint64_t v4 = 0;
  }

  return v4;
}

- (void)setWindowSize:(unint64_t)a3
{
  if (a3 <= 0xF423FFFFFFFFFLL)
  {
    id v5 = [NSNumber numberWithUnsignedInt:a3 / 0xF4240];
    [(DTTapConfig *)self _setSerializableObject:v5 forKey:@"ws"];
  }
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (int64_t)serviceVersion
{
  return self->_serviceVersion;
}

- (void)setServiceVersion:(int64_t)a3
{
  self->_serviceVersion = a3;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (BOOL)filePreservation
{
  return self->_filePreservation;
}

- (void)setFilePreservation:(BOOL)a3
{
  self->_filePreservation = a3;
}

- (DTTapBulkDataReceiver)bulkDataReceiver
{
  return self->_bulkDataReceiver;
}

- (void)setBulkDataReceiver:(id)a3
{
  self->_bulkDataReceiver = (DTTapBulkDataReceiver *)a3;
}

- (id)runningMetadataChangedHandler
{
  return self->_runningMetadataChangedHandler;
}

- (id)statusHandler
{
  return self->_statusHandler;
}

- (id)recordingInfoHandler
{
  return self->_recordingInfoHandler;
}

- (void)setRecordingInfoHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_recordingInfoHandler, 0);
  objc_storeStrong(&self->_statusHandler, 0);
  objc_storeStrong(&self->_runningMetadataChangedHandler, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_dict, 0);
}

@end