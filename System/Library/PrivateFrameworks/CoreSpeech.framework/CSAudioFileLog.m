@interface CSAudioFileLog
+ (id)sharedInstance;
- (CSAudioFileLog)init;
- (id)_audioLogDirectory;
- (id)_getOrCreateAudioLogDirectory;
- (id)_makeTimestampedAudioLogFilenameWithPrefix:(id)a3 suffix:(id)a4;
- (id)_nowString;
- (void)_closeAudioFile;
- (void)appendAudioData:(id)a3;
- (void)dealloc;
- (void)startRecording;
- (void)stopRecording;
@end

@implementation CSAudioFileLog

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (id)_makeTimestampedAudioLogFilenameWithPrefix:(id)a3 suffix:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(CSAudioFileLog *)self _getOrCreateAudioLogDirectory];
  uint64_t v9 = [(CSAudioFileLog *)self _nowString];
  v10 = (void *)v9;
  CFStringRef v11 = &stru_100254530;
  if (v9) {
    CFStringRef v11 = (const __CFString *)v9;
  }
  v12 = +[NSString stringWithFormat:@"%@/%@%@%@", v8, v7, v11, v6];

  v13 = [v12 stringByReplacingOccurrencesOfString:@" " withString:@"_"];

  return v13;
}

- (id)_nowString
{
  id v2 = objc_alloc_init((Class)NSDateFormatter);
  v3 = +[NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v2 setLocale:v3];

  [v2 setDateFormat:@"yyyyMMdd-HHmmss"];
  v4 = +[NSDate date];
  v5 = [v2 stringFromDate:v4];

  return v5;
}

- (id)_getOrCreateAudioLogDirectory
{
  id v2 = [(CSAudioFileLog *)self _audioLogDirectory];
  v3 = +[NSFileManager defaultManager];
  unsigned __int8 v4 = [v3 fileExistsAtPath:v2 isDirectory:0];

  if (v4)
  {
    id v5 = 0;
  }
  else
  {
    id v6 = +[NSFileManager defaultManager];
    id v12 = 0;
    unsigned __int8 v7 = [v6 createDirectoryAtPath:v2 withIntermediateDirectories:1 attributes:0 error:&v12];
    id v5 = v12;

    if ((v7 & 1) == 0)
    {
      v8 = (void *)CSLogCategoryAudio;
      if (os_log_type_enabled(CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      {
        v10 = v8;
        CFStringRef v11 = [v5 localizedDescription];
        *(_DWORD *)buf = 136315650;
        v14 = "-[CSAudioFileLog _getOrCreateAudioLogDirectory]";
        __int16 v15 = 2114;
        v16 = v2;
        __int16 v17 = 2114;
        v18 = v11;
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s Couldn't create CoreSpeech log directory at path %{public}@ %{public}@", buf, 0x20u);
      }
      id v2 = @"/tmp";
    }
  }

  return v2;
}

- (id)_audioLogDirectory
{
  if (qword_1002A3638 != -1) {
    dispatch_once(&qword_1002A3638, &stru_10024E858);
  }
  id v2 = (void *)qword_1002A3630;
  return v2;
}

- (void)stopRecording
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100024944;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)appendAudioData:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100024AB4;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)startRecording
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100024CCC;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_closeAudioFile
{
  audioFile = self->_audioFile;
  if (audioFile)
  {
    OSStatus v4 = ExtAudioFileDispose(audioFile);
    if (v4)
    {
      OSStatus v5 = v4;
      id v6 = CSLogCategoryAudio;
      if (os_log_type_enabled(CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      {
        int v7 = 136315394;
        id v8 = "-[CSAudioFileLog _closeAudioFile]";
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
  [(CSAudioFileLog *)self _closeAudioFile];
  v3.receiver = self;
  v3.super_class = (Class)CSAudioFileLog;
  [(CSAudioFileLog *)&v3 dealloc];
}

- (CSAudioFileLog)init
{
  v12.receiver = self;
  v12.super_class = (Class)CSAudioFileLog;
  id v2 = [(CSAudioFileLog *)&v12 init];
  if (v2)
  {
    id v3 = [(id)objc_opt_class() description];
    dispatch_queue_t v4 = dispatch_queue_create((const char *)[v3 UTF8String], 0);
    OSStatus v5 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v4;

    id v6 = *((void *)v2 + 1);
    int v7 = dispatch_get_global_queue(17, 0);
    dispatch_set_target_queue(v6, v7);

    +[CSFAudioStreamBasicDescriptionFactory utteranceFileASBD];
    *(_OWORD *)(v2 + 24) = v9;
    *(_OWORD *)(v2 + 40) = v10;
    *((void *)v2 + 7) = v11;
  }
  return (CSAudioFileLog *)v2;
}

+ (id)sharedInstance
{
  if (qword_1002A3628 != -1) {
    dispatch_once(&qword_1002A3628, &stru_10024E838);
  }
  id v2 = (void *)qword_1002A3620;
  return v2;
}

@end