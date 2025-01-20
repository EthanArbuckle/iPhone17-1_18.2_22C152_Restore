@interface CSSiriAudioMessageRequestHandler
- (CSSiriAudioMessageFile)currentSiriAudioMessageFile;
- (CSSiriAudioMessageRequestHandler)init;
- (NSMutableDictionary)audioMessageAudioFiles;
- (NSMutableDictionary)audioMessageFileRetainLocks;
- (OS_dispatch_group)recordingAudioGroup;
- (OS_dispatch_queue)queue;
- (id)_createAudioMessageFile:(id)a3;
- (void)_releaseRetainIfNeeded;
- (void)attSiriAudioSrcNodeDidStartRecording:(id)a3 successfully:(BOOL)a4 error:(id)a5;
- (void)attSiriAudioSrcNodeDidStop:(id)a3;
- (void)attSiriAudioSrcNodeLPCMRecordBufferAvailable:(id)a3 audioChunk:(id)a4;
- (void)deleteAudioMessageFile:(id)a3 completion:(id)a4;
- (void)forceReleaseAllAudioMessageRetainLock;
- (void)getAudioFileWithRequestId:(id)a3 completion:(id)a4;
- (void)releaseAudioMessageRetainLockFromRequestId:(id)a3;
- (void)setAudioMessageAudioFiles:(id)a3;
- (void)setAudioMessageFileRetainLocks:(id)a3;
- (void)setCurrentSiriAudioMessageFile:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRecordingAudioGroup:(id)a3;
- (void)startLoggingWithRequestId:(id)a3 recordContext:(id)a4;
@end

@implementation CSSiriAudioMessageRequestHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordingAudioGroup, 0);
  objc_storeStrong((id *)&self->_currentSiriAudioMessageFile, 0);
  objc_storeStrong((id *)&self->_audioMessageFileRetainLocks, 0);
  objc_storeStrong((id *)&self->_audioMessageAudioFiles, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setRecordingAudioGroup:(id)a3
{
}

- (OS_dispatch_group)recordingAudioGroup
{
  return self->_recordingAudioGroup;
}

- (void)setCurrentSiriAudioMessageFile:(id)a3
{
}

- (CSSiriAudioMessageFile)currentSiriAudioMessageFile
{
  return self->_currentSiriAudioMessageFile;
}

- (void)setAudioMessageFileRetainLocks:(id)a3
{
}

- (NSMutableDictionary)audioMessageFileRetainLocks
{
  return self->_audioMessageFileRetainLocks;
}

- (void)setAudioMessageAudioFiles:(id)a3
{
}

- (NSMutableDictionary)audioMessageAudioFiles
{
  return self->_audioMessageAudioFiles;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)attSiriAudioSrcNodeLPCMRecordBufferAvailable:(id)a3 audioChunk:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001535A8;
  v8[3] = &unk_100253B08;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)attSiriAudioSrcNodeDidStop:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100153628;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)attSiriAudioSrcNodeDidStartRecording:(id)a3 successfully:(BOOL)a4 error:(id)a5
{
  if (!a4)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10015377C;
    block[3] = &unk_100253AE0;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

- (void)deleteAudioMessageFile:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6)
  {
    queue = self->_queue;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1001538F4;
    v10[3] = &unk_100253B08;
    v10[4] = self;
    id v11 = v6;
    dispatch_async(queue, v10);
  }
  else if (v7)
  {
    (*((void (**)(id))v7 + 2))(v7);
  }
}

- (id)_createAudioMessageFile:(id)a3
{
  id v4 = a3;
  id v5 = [[CSSiriAudioMessageFile alloc] initWithRequestUUID:v4];
  [(NSMutableDictionary *)self->_audioMessageAudioFiles setObject:v5 forKey:v4];

  return v5;
}

- (void)_releaseRetainIfNeeded
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v3 = [(CSSiriAudioMessageRequestHandler *)self audioMessageAudioFiles];
  id obj = [v3 allKeys];

  id v4 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v17;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v16 + 1) + 8 * (void)v6);
        uint64_t v12 = 0;
        v13 = &v12;
        uint64_t v14 = 0x2020000000;
        uint64_t v15 = 0;
        v8 = [(CSSiriAudioMessageRequestHandler *)self audioMessageFileRetainLocks];
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472;
        v11[2] = sub_100153B60;
        v11[3] = &unk_100252D60;
        v11[4] = v7;
        v11[5] = &v12;
        [v8 enumerateKeysAndObjectsUsingBlock:v11];

        if (!v13[3])
        {
          id v9 = [(CSSiriAudioMessageRequestHandler *)self audioMessageAudioFiles];
          [v9 removeObjectForKey:v7];
        }
        _Block_object_dispose(&v12, 8);
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v4);
  }
}

- (void)forceReleaseAllAudioMessageRetainLock
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100153C34;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)releaseAudioMessageRetainLockFromRequestId:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100153D0C;
  v7[3] = &unk_100253B08;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)getAudioFileWithRequestId:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [[CSSiriAudioMessageFileRetainLock alloc] initWithRequestId:v6];
  id v9 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    long long v16 = "-[CSSiriAudioMessageRequestHandler getAudioFileWithRequestId:completion:]";
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s Fetching Audio File with RequestID : %@", buf, 0x16u);
  }
  if (v6)
  {
    if (v7)
    {
      queue = self->_queue;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1001540A4;
      v11[3] = &unk_100252D38;
      v11[4] = self;
      id v12 = v6;
      v13 = v8;
      id v14 = v7;
      dispatch_async(queue, v11);
    }
  }
  else if (v7)
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

- (void)startLoggingWithRequestId:(id)a3 recordContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100154478;
  block[3] = &unk_100253540;
  id v12 = v7;
  id v13 = v6;
  id v14 = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

- (CSSiriAudioMessageRequestHandler)init
{
  v12.receiver = self;
  v12.super_class = (Class)CSSiriAudioMessageRequestHandler;
  v2 = [(CSSiriAudioMessageRequestHandler *)&v12 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSSiriAudioMessageRequestHandler", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = +[NSMutableDictionary dictionary];
    audioMessageAudioFiles = v2->_audioMessageAudioFiles;
    v2->_audioMessageAudioFiles = (NSMutableDictionary *)v5;

    uint64_t v7 = +[NSMutableDictionary dictionary];
    audioMessageFileRetainLocks = v2->_audioMessageFileRetainLocks;
    v2->_audioMessageFileRetainLocks = (NSMutableDictionary *)v7;

    dispatch_group_t v9 = dispatch_group_create();
    recordingAudioGroup = v2->_recordingAudioGroup;
    v2->_recordingAudioGroup = (OS_dispatch_group *)v9;
  }
  return v2;
}

@end