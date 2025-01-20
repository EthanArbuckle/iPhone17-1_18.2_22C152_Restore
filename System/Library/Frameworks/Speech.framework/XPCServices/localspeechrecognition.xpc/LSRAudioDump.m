@interface LSRAudioDump
+ (id)dumpDirectory;
+ (id)filenameForTaskIdentifier:(id)a3;
+ (id)urlForTaskIdentifier:(id)a3;
+ (void)initialize;
- (LSRAudioDump)initWithTaskIdentifier:(id)a3;
- (void)appendBytes:(id)a3;
- (void)close;
- (void)dealloc;
- (void)discard;
@end

@implementation LSRAudioDump

- (void).cxx_destruct
{
}

- (void)discard
{
  [(LSRAudioDump *)self close];
  id v3 = +[NSFileManager defaultManager];
  [v3 removeItemAtURL:self->_url error:0];
}

- (void)close
{
  extendedFile = self->_extendedFile;
  if (extendedFile) {
    ExtAudioFileDispose(extendedFile);
  }
  fileID = self->_fileID;
  if (fileID) {
    AudioFileClose(fileID);
  }
  v5 = SFLogConnection;
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
  {
    url = self->_url;
    int v7 = 136315394;
    v8 = "-[LSRAudioDump close]";
    __int16 v9 = 2112;
    v10 = url;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Closed audio dump file at: %@", (uint8_t *)&v7, 0x16u);
  }
}

- (void)appendBytes:(id)a3
{
  if (self->_extendedFile)
  {
    id v4 = a3;
    UInt32 v5 = [v4 length];
    id v6 = v4;
    id v7 = [v6 bytes];

    *(void *)&ioData.mNumberBuffers = 1;
    ioData.mBuffers[0].mNumberChannels = 1;
    ioData.mBuffers[0].mDataByteSize = v5;
    ioData.mBuffers[0].mData = v7;
    OSStatus v8 = ExtAudioFileWriteAsync(self->_extendedFile, v5 / SupportedASBD[6], &ioData);
    if (v8)
    {
      __int16 v9 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v8 userInfo:0];
      v10 = (void *)SFLogConnection;
      if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
      {
        v11 = v10;
        v12 = [v9 description];
        url = self->_url;
        *(_DWORD *)buf = 136315650;
        v16 = "-[LSRAudioDump appendBytes:]";
        __int16 v17 = 2112;
        v18 = v12;
        __int16 v19 = 2112;
        v20 = url;
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s Failed to write to dump file. Error: %@, URL: %@", buf, 0x20u);
      }
    }
  }
}

- (void)dealloc
{
  [(LSRAudioDump *)self close];
  v3.receiver = self;
  v3.super_class = (Class)LSRAudioDump;
  [(LSRAudioDump *)&v3 dealloc];
}

- (LSRAudioDump)initWithTaskIdentifier:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)LSRAudioDump;
  id v5 = [(LSRAudioDump *)&v30 init];
  if (!v5)
  {
LABEL_14:
    __int16 v19 = (LSRAudioDump *)v5;
    goto LABEL_15;
  }
  uint64_t v6 = +[LSRAudioDump urlForTaskIdentifier:v4];
  id v7 = (void *)*((void *)v5 + 1);
  *((void *)v5 + 1) = v6;

  OSStatus v8 = +[NSFileManager defaultManager];
  __int16 v9 = +[LSRAudioDump dumpDirectory];
  [v8 createDirectoryAtURL:v9 withIntermediateDirectories:1 attributes:0 error:0];

  OSStatus v10 = AudioFileCreateWithURL(*((CFURLRef *)v5 + 1), 0x57415645u, (const AudioStreamBasicDescription *)SupportedASBD, 1u, (AudioFileID *)v5 + 2);
  if (v10)
  {
    v11 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v10 userInfo:0];
    v12 = (void *)SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
    {
      v13 = v12;
      v14 = [v11 description];
      uint64_t v15 = *((void *)v5 + 1);
      *(_DWORD *)buf = 136315650;
      v32 = "-[LSRAudioDump initWithTaskIdentifier:]";
      __int16 v33 = 2112;
      v34 = v14;
      __int16 v35 = 2112;
      uint64_t v36 = v15;
      v16 = "%s Failed to create audio dump file. Error: %@, URL: %@";
LABEL_17:
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, v16, buf, 0x20u);

      goto LABEL_7;
    }
    goto LABEL_7;
  }
  OSStatus v17 = ExtAudioFileWrapAudioFileID(*((AudioFileID *)v5 + 2), 1u, (ExtAudioFileRef *)v5 + 3);
  if (!v17)
  {
    OSStatus v20 = ExtAudioFileWriteAsync(*((ExtAudioFileRef *)v5 + 3), 0, 0);
    if (v20)
    {
      v21 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v20 userInfo:0];
      v22 = (void *)SFLogConnection;
      if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
      {
        v27 = v22;
        v28 = [v21 description];
        uint64_t v29 = *((void *)v5 + 1);
        *(_DWORD *)buf = 136315650;
        v32 = "-[LSRAudioDump initWithTaskIdentifier:]";
        __int16 v33 = 2112;
        v34 = v28;
        __int16 v35 = 2112;
        uint64_t v36 = v29;
        _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%s Failed to prewarm dump file. Error: %@, URL: %@", buf, 0x20u);
      }
    }
    v23 = SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
    {
      v24 = (void *)*((void *)v5 + 1);
      *(_DWORD *)buf = 136315394;
      v32 = "-[LSRAudioDump initWithTaskIdentifier:]";
      __int16 v33 = 2112;
      v34 = v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%s Created audio file at: %@", buf, 0x16u);
    }
    goto LABEL_14;
  }
  v11 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v17 userInfo:0];
  v18 = (void *)SFLogConnection;
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
  {
    v13 = v18;
    v14 = [v11 description];
    uint64_t v26 = *((void *)v5 + 1);
    *(_DWORD *)buf = 136315650;
    v32 = "-[LSRAudioDump initWithTaskIdentifier:]";
    __int16 v33 = 2112;
    v34 = v14;
    __int16 v35 = 2112;
    uint64_t v36 = v26;
    v16 = "%s Failed to extend audio dump file. Error: %@, URL: %@";
    goto LABEL_17;
  }
LABEL_7:

  __int16 v19 = 0;
LABEL_15:

  return v19;
}

+ (id)filenameForTaskIdentifier:(id)a3
{
  memset(&v7, 0, sizeof(v7));
  v6.tv_sec = 0;
  *(void *)&v6.tv_usec = 0;
  id v3 = a3;
  gettimeofday(&v6, 0);
  localtime_r(&v6.tv_sec, &v7);
  id v4 = +[NSString stringWithFormat:@"%@-%04d%02d%02d-%02d%02d%02d.%d.wav", v3, (v7.tm_year + 1900), (v7.tm_mon + 1), v7.tm_mday, v7.tm_hour, v7.tm_min, v7.tm_sec, getpid(), v6.tv_sec, *(void *)&v6.tv_usec];

  return v4;
}

+ (id)dumpDirectory
{
  v2 = NSHomeDirectory();
  id v3 = [v2 stringByAppendingPathComponent:@"Library/Caches/com.apple.speech.localspeechrecognition/lsr_audio_dumps"];

  id v4 = +[NSURL fileURLWithPath:v3];

  return v4;
}

+ (id)urlForTaskIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = +[LSRAudioDump dumpDirectory];
  timeval v6 = [a1 filenameForTaskIdentifier:v4];

  tm v7 = [v5 URLByAppendingPathComponent:v6];

  return v7;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    SFLogInitIfNeeded();
  }
}

@end