@interface ADAudioFileWriter
+ (id)_generateTemporaryFileURL;
+ (id)_savedAudioFilesDirectory;
- (ADAudioFileWriter)init;
- (ADAudioFileWriter)initWithType:(int64_t)a3 fileHandle:(id)a4 priority:(unsigned int)a5;
- (ADAudioFileWriter)initWithType:(int64_t)a3 pathGenerator:(id)a4 priority:(unsigned int)a5;
- (id)_initWithType:(int64_t)a3 pathGenerator:(id)a4 xorFileHandle:(id)a5 priority:(unsigned int)a6;
- (void)_close;
- (void)_delete;
- (void)appendAudioData:(id)a3;
- (void)cancel;
- (void)configureWithAudioStreamBasicDescription:(const AudioStreamBasicDescription *)a3;
- (void)dealloc;
- (void)flushWithCompletion:(id)a3;
@end

@implementation ADAudioFileWriter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingError, 0);
  objc_storeStrong((id *)&self->_fileHandle, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)cancel
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006F8B8;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)flushWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10006F98C;
  v7[3] = &unk_10050E188;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)appendAudioData:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10006FCA0;
  v7[3] = &unk_10050E160;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)configureWithAudioStreamBasicDescription:(const AudioStreamBasicDescription *)a3
{
  long long v5 = *(_OWORD *)&a3->mBytesPerPacket;
  long long v12 = *(_OWORD *)&a3->mSampleRate;
  long long v13 = v5;
  uint64_t v14 = *(void *)&a3->mBitsPerChannel;
  id v6 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v16 = "-[ADAudioFileWriter configureWithAudioStreamBasicDescription:]";
    __int16 v17 = 1040;
    int v18 = 4;
    __int16 v19 = 2080;
    v20 = (char *)&v12 + 8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Configuring with asbd %.4s", buf, 0x1Cu);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006FF70;
  block[3] = &unk_1004FFB20;
  block[4] = self;
  void block[5] = a2;
  long long v9 = v12;
  long long v10 = v13;
  uint64_t v11 = v14;
  dispatch_async(queue, block);
}

- (void)_delete
{
  if (self->_url)
  {
    v3 = +[NSFileManager defaultManager];
    url = self->_url;
    id v9 = 0;
    unsigned __int8 v5 = [v3 removeItemAtURL:url error:&v9];
    id v6 = v9;

    if ((v5 & 1) == 0)
    {
      v7 = AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v11 = "-[ADAudioFileWriter _delete]";
        __int16 v12 = 2114;
        id v13 = v6;
        _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s Error removing item at URL %{public}@", buf, 0x16u);
      }
    }
    id v8 = self->_url;
    self->_url = 0;
  }
}

- (void)_close
{
  audioFile = self->_audioFile;
  if (audioFile)
  {
    OSStatus v4 = ExtAudioFileDispose(audioFile);
    if (v4)
    {
      OSStatus v5 = v4;
      id v6 = AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
      {
        int v7 = 136315394;
        id v8 = "-[ADAudioFileWriter _close]";
        __int16 v9 = 1026;
        OSStatus v10 = v5;
        _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s Failure disposing audio file %{public}d", (uint8_t *)&v7, 0x12u);
      }
    }
    self->_audioFile = 0;
  }
}

- (void)dealloc
{
  [(ADAudioFileWriter *)self _close];
  v3.receiver = self;
  v3.super_class = (Class)ADAudioFileWriter;
  [(ADAudioFileWriter *)&v3 dealloc];
}

- (ADAudioFileWriter)init
{
  return 0;
}

- (id)_initWithType:(int64_t)a3 pathGenerator:(id)a4 xorFileHandle:(id)a5 priority:(unsigned int)a6
{
  id v11 = a4;
  id v12 = a5;
  if (!a3)
  {
    v20 = +[NSAssertionHandler currentHandler];
    [v20 handleFailureInMethod:a2, self, @"ADAudioFileWriter.m", 59, @"Invalid parameter not satisfying: %@", @"type != AFAudioFileTypeNone" object file lineNumber description];
  }
  v26.receiver = self;
  v26.super_class = (Class)ADAudioFileWriter;
  id v13 = [(ADAudioFileWriter *)&v26 init];
  if (v13)
  {
    uint64_t v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = dispatch_queue_attr_make_with_qos_class(v14, (dispatch_qos_class_t)a6, 0);

    dispatch_queue_t v16 = dispatch_queue_create("AudioFileWriterQueue", v15);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v16;

    int v18 = v13->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100070854;
    block[3] = &unk_10050C278;
    v22 = v13;
    int64_t v25 = a3;
    id v23 = v12;
    id v24 = v11;
    dispatch_async(v18, block);
  }
  return v13;
}

- (ADAudioFileWriter)initWithType:(int64_t)a3 fileHandle:(id)a4 priority:(unsigned int)a5
{
  return (ADAudioFileWriter *)[(ADAudioFileWriter *)self _initWithType:a3 pathGenerator:0 xorFileHandle:a4 priority:*(void *)&a5];
}

- (ADAudioFileWriter)initWithType:(int64_t)a3 pathGenerator:(id)a4 priority:(unsigned int)a5
{
  return (ADAudioFileWriter *)[(ADAudioFileWriter *)self _initWithType:a3 pathGenerator:a4 xorFileHandle:0 priority:*(void *)&a5];
}

+ (id)_generateTemporaryFileURL
{
  v2 = [a1 _savedAudioFilesDirectory];
  objc_super v3 = [v2 URLByAppendingPathComponent:@"SavedAudioFile"];

  return v3;
}

+ (id)_savedAudioFilesDirectory
{
  if (qword_100585E20 != -1) {
    dispatch_once(&qword_100585E20, &stru_1005069B0);
  }
  v0 = (void *)qword_100585E18;
  return v0;
}

@end