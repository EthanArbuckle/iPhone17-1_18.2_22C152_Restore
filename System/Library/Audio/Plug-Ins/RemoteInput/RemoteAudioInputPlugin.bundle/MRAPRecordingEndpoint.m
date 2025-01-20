@interface MRAPRecordingEndpoint
+ (id)sharedEndpoint;
- (MRAPRecordingEndpoint)init;
- (NSArray)delegates;
- (void)_inputDeviceConnectedWithDeviceID:(unsigned int)a3;
- (void)_inputDeviceDisconnectedWithDeviceID:(unsigned int)a3;
- (void)_setupVoiceRecordingEndpoint;
- (void)_tearDownVoiceRecordingEndpoint;
- (void)_voiceDataReceivedForDeviceWithID:(unsigned int)a3 withBuffer:(void *)a4 time:(id)a5 gain:(float)a6;
- (void)addDelegate:(id)a3;
- (void)dealloc;
- (void)removeAllDelegates;
- (void)removeDelegate:(id)a3;
@end

@implementation MRAPRecordingEndpoint

+ (id)sharedEndpoint
{
  if (qword_D290 != -1) {
    dispatch_once(&qword_D290, &stru_8258);
  }
  v2 = (void *)qword_D298;

  return v2;
}

- (MRAPRecordingEndpoint)init
{
  v10.receiver = self;
  v10.super_class = (Class)MRAPRecordingEndpoint;
  v2 = [(MRAPRecordingEndpoint *)&v10 init];
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    Name = class_getName(v3);
    dispatch_queue_t v5 = dispatch_queue_create(Name, 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v5;

    v7 = (NSPointerArray *)[objc_alloc((Class)NSPointerArray) initWithOptions:5];
    delegates = v2->_delegates;
    v2->_delegates = v7;

    [(MRAPRecordingEndpoint *)v2 _setupVoiceRecordingEndpoint];
  }
  return v2;
}

- (void)dealloc
{
  [(MRAPRecordingEndpoint *)self _tearDownVoiceRecordingEndpoint];
  v3.receiver = self;
  v3.super_class = (Class)MRAPRecordingEndpoint;
  [(MRAPRecordingEndpoint *)&v3 dealloc];
}

- (NSArray)delegates
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_4068;
  objc_super v10 = sub_4078;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_4080;
  v5[3] = &unk_8280;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (void)addDelegate:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_4240;
  v7[3] = &unk_82A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)serialQueue, v7);
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_42E4;
  v7[3] = &unk_82A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)serialQueue, v7);
}

- (void)removeAllDelegates
{
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_449C;
  block[3] = &unk_82D0;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
}

- (void)_setupVoiceRecordingEndpoint
{
  qword_D0F0 = (uint64_t)self;
  _MRVirtualVoiceInputSetRecordingEndpoint(&qword_D0F0, a2);
}

- (void)_tearDownVoiceRecordingEndpoint
{
}

- (void)_inputDeviceConnectedWithDeviceID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  dispatch_queue_t v5 = _MRLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_6034(v3, v5);
  }

  id v6 = [(MRAPRecordingEndpoint *)self delegates];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      objc_super v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) recordingEndpoint:self inputDeviceConnectedWithID:v3];
        objc_super v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)_inputDeviceDisconnectedWithDeviceID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  dispatch_queue_t v5 = _MRLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_60AC(v3, v5);
  }

  id v6 = [(MRAPRecordingEndpoint *)self delegates];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      objc_super v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) recordingEndpoint:self inputDeviceDisconnectedWithID:v3];
        objc_super v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)_voiceDataReceivedForDeviceWithID:(unsigned int)a3 withBuffer:(void *)a4 time:(id)a5 gain:(float)a6
{
  double var1 = a5.var1;
  double var0 = a5.var0;
  uint64_t v10 = *(void *)&a3;
  long long v12 = [(MRAPRecordingEndpoint *)self delegates];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    id v15 = v13;
    uint64_t v16 = *(void *)v19;
    do
    {
      v17 = 0;
      do
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v12);
        }
        *(float *)&double v14 = a6;
        objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * (void)v17), "recordingEndpoint:inputDeviceWithID:receivedAudioBuffer:withTime:gain:", self, v10, a4, var0, var1, v14);
        v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      id v15 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v15);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegates, 0);

  objc_storeStrong((id *)&self->_serialQueue, 0);
}

@end