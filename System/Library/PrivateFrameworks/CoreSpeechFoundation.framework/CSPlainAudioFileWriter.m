@interface CSPlainAudioFileWriter
+ (void)saveAudioChunck:(id)a3 toURL:(id)a4;
- (BOOL)addSamples:(const void *)a3 numSamples:(int64_t)a4;
- (BOOL)endAudio;
- (CSPlainAudioFileWriter)initWithFilepath:(id)a3;
- (CSPlainAudioFileWriter)initWithURL:(id)a3;
- (CSPlainAudioFileWriter)initWithURL:(id)a3 inputFormat:(AudioStreamBasicDescription *)a4 outputFormat:(AudioStreamBasicDescription *)a5;
- (NSURL)fileURL;
- (void)addContextKey:(id)a3 fromMetaFile:(id)a4;
- (void)addContextKey:(id)a3 withContext:(id)a4;
- (void)createAcousticMetaFileForContext:(id)a3 withContext:(id)a4;
- (void)dealloc;
@end

@implementation CSPlainAudioFileWriter

- (void).cxx_destruct
{
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)addContextKey:(id)a3 fromMetaFile:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (CSIsHorseman_onceToken != -1) {
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
  }
  if (CSIsHorseman_isHorseman)
  {
    if (v7)
    {
      uint64_t v8 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v7];
      if (v8)
      {
        v9 = (void *)v8;
        id v15 = 0;
        v10 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v8 options:0 error:&v15];
        id v11 = v15;
        v12 = v11;
        if (!v10 || v11)
        {
          v13 = CSLogCategoryAudio;
          if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v17 = "-[CSPlainAudioFileWriter addContextKey:fromMetaFile:]";
            __int16 v18 = 2112;
            id v19 = v7;
            __int16 v20 = 2112;
            v21 = v12;
            _os_log_error_impl(&dword_1BA1A5000, v13, OS_LOG_TYPE_ERROR, "%s Could not read existing %@ file: err: %@", buf, 0x20u);
          }

          v10 = 0;
        }
        goto LABEL_14;
      }
      v14 = CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v17 = "-[CSPlainAudioFileWriter addContextKey:fromMetaFile:]";
        __int16 v18 = 2112;
        id v19 = v7;
        _os_log_error_impl(&dword_1BA1A5000, v14, OS_LOG_TYPE_ERROR, "%s Unable to read data from file: %@", buf, 0x16u);
      }
    }
    v9 = 0;
    v10 = 0;
    v12 = 0;
LABEL_14:
    [(CSPlainAudioFileWriter *)self addContextKey:v6 withContext:v10];
  }
}

- (void)createAcousticMetaFileForContext:(id)a3 withContext:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [(NSURL *)self->_fileURL lastPathComponent];
  id v7 = [v6 stringByDeletingPathExtension];
  uint64_t v8 = [v7 stringByAppendingString:@"-SL.json"];

  v9 = [(NSURL *)self->_fileURL URLByDeletingLastPathComponent];
  v10 = [v9 path];
  id v11 = [v10 stringByAppendingPathComponent:v8];

  if (v5)
  {
    id v16 = 0;
    v12 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v5 options:1 error:&v16];
    id v13 = v16;
    if (v13 || !v12)
    {
      id v15 = CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        __int16 v18 = "-[CSPlainAudioFileWriter createAcousticMetaFileForContext:withContext:]";
        __int16 v19 = 2114;
        __int16 v20 = v11;
        __int16 v21 = 2114;
        id v22 = v13;
        _os_log_error_impl(&dword_1BA1A5000, v15, OS_LOG_TYPE_ERROR, "%s ERR: Failed to create json %{public}@ with %{public}@", buf, 0x20u);
      }
    }
    else
    {
      [v12 writeToFile:v11 atomically:0];
    }
  }
  else
  {
    v14 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v18 = "-[CSPlainAudioFileWriter createAcousticMetaFileForContext:withContext:]";
      _os_log_impl(&dword_1BA1A5000, v14, OS_LOG_TYPE_DEFAULT, "%s metaInfo passed is nil - Bailing out", buf, 0xCu);
    }
    id v13 = 0;
  }
}

- (void)addContextKey:(id)a3 withContext:(id)a4
{
  v60[5] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(NSURL *)self->_fileURL URLByDeletingPathExtension];
  v9 = [v8 URLByAppendingPathExtension:@"json"];

  v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v11 = [v9 path];
  char v12 = [v10 fileExistsAtPath:v11];

  if (v12)
  {
    if (v7)
    {
      id v13 = (void *)MEMORY[0x1E4F1C9B8];
      v14 = [v9 path];
      id v15 = [v13 dataWithContentsOfFile:v14];

      if (v15)
      {
        id v51 = 0;
        id v16 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v15 options:0 error:&v51];
        id v17 = v51;
        id v18 = v17;
        if (!v16 || v17)
        {
          v45 = CSLogCategoryAudio;
          if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v54 = "-[CSPlainAudioFileWriter addContextKey:withContext:]";
            __int16 v55 = 2112;
            v56 = v9;
            __int16 v57 = 2112;
            id v58 = v18;
            _os_log_error_impl(&dword_1BA1A5000, v45, OS_LOG_TYPE_ERROR, "%s Could not read existing %@ file: err: %@", buf, 0x20u);
          }
        }
        else
        {
          __int16 v19 = (void *)[v16 mutableCopy];
          [v19 setObject:v7 forKey:v6];
          id v50 = 0;
          __int16 v20 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v19 options:1 error:&v50];
          id v18 = v50;
          if (v18 || !v20)
          {
            v46 = CSLogCategoryAudio;
            if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315650;
              v54 = "-[CSPlainAudioFileWriter addContextKey:withContext:]";
              __int16 v55 = 2114;
              v56 = v9;
              __int16 v57 = 2114;
              id v58 = v18;
              _os_log_error_impl(&dword_1BA1A5000, v46, OS_LOG_TYPE_ERROR, "%s ERR: Failed to create json %{public}@ with %{public}@", buf, 0x20u);
            }
          }
          else
          {
            __int16 v21 = [v9 path];
            [v20 writeToFile:v21 atomically:0];
          }
        }
      }
      else
      {
        v44 = CSLogCategoryAudio;
        if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v54 = "-[CSPlainAudioFileWriter addContextKey:withContext:]";
          __int16 v55 = 2112;
          v56 = v9;
          _os_log_error_impl(&dword_1BA1A5000, v44, OS_LOG_TYPE_ERROR, "%s Unable to read data from file: %@", buf, 0x16u);
        }
      }
    }
    else
    {
      v43 = CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v54 = "-[CSPlainAudioFileWriter addContextKey:withContext:]";
        _os_log_impl(&dword_1BA1A5000, v43, OS_LOG_TYPE_DEFAULT, "%s metaInfo passed is nil - Bailing out", buf, 0xCu);
      }
    }
  }
  else
  {
    id v48 = v6;
    id v49 = v7;
    id v22 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
    id v23 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    v24 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
    [v23 setLocale:v24];

    [v23 setDateFormat:@"yyyy_MM_dd-HHmmss.SSS"];
    v47 = v22;
    v25 = [v23 stringFromDate:v22];
    v26 = (void *)MEMORY[0x1E4F1CA60];
    v59[0] = @"productType";
    v27 = +[CSUtils deviceProductType];
    v60[0] = v27;
    v59[1] = @"productVersion";
    v28 = +[CSUtils deviceProductVersion];
    v60[1] = v28;
    v59[2] = @"buildVersion";
    v29 = +[CSUtils deviceBuildVersion];
    v60[2] = v29;
    v59[3] = @"liveOnHomePod";
    v30 = NSNumber;
    if (CSIsHorseman_onceToken != -1) {
      dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
    }
    if (CSIsHorseman_isHorseman
      && (v31 = (void *)CFPreferencesCopyAppValue(@"ExperimentGroup", @"com.apple.da")) != 0)
    {
      v32 = v31;
      uint64_t v33 = [v31 isEqualToString:@"walkabout"];
    }
    else
    {
      uint64_t v33 = 0;
    }
    uint64_t v34 = [v30 numberWithBool:v33];
    v35 = (void *)v34;
    v59[4] = @"timeStamp";
    v36 = &stru_1F13A10B0;
    if (v25) {
      v36 = v25;
    }
    v60[3] = v34;
    v60[4] = v36;
    v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:v59 count:5];
    v38 = [v26 dictionaryWithDictionary:v37];

    id v6 = v48;
    if (v49) {
      [v38 setObject:v49 forKey:v48];
    }
    id v52 = 0;
    v39 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v38 options:1 error:&v52];
    id v40 = v52;
    if (v40 || !v39)
    {
      v42 = CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v54 = "-[CSPlainAudioFileWriter addContextKey:withContext:]";
        __int16 v55 = 2114;
        v56 = v9;
        __int16 v57 = 2114;
        id v58 = v40;
        _os_log_error_impl(&dword_1BA1A5000, v42, OS_LOG_TYPE_ERROR, "%s ERR: Failed to create json %{public}@ with %{public}@", buf, 0x20u);
      }
    }
    else
    {
      v41 = [v9 path];
      [v39 writeToFile:v41 atomically:0];
    }
    id v7 = v49;
  }
}

- (BOOL)addSamples:(const void *)a3 numSamples:(int64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v4 = 1;
  if (a4 >= 1 && self->isWriting)
  {
    id v5 = (AudioBufferList *)&buf[-((24 * self->inASBD.mChannelsPerFrame + 15) & 0x3FFFFFFFF0)];
    uint64_t mChannelsPerFrame = self->inASBD.mChannelsPerFrame;
    v5->mNumberBuffers = mChannelsPerFrame;
    if (mChannelsPerFrame)
    {
      unsigned int v7 = 0;
      int v8 = self->inASBD.mBytesPerFrame * a4;
      p_mData = &v5->mBuffers[0].mData;
      do
      {
        *((_DWORD *)p_mData - 2) = 1;
        *((_DWORD *)p_mData - 1) = v8;
        *p_mData = (char *)a3 + v7;
        p_mData += 2;
        v7 += v8;
        --mChannelsPerFrame;
      }
      while (mChannelsPerFrame);
    }
    OSStatus v10 = ExtAudioFileWrite(self->fFile, a4, v5);
    BOOL v4 = v10 == 0;
    if (v10)
    {
      OSStatus v11 = v10;
      char v12 = CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v15 = "-[CSPlainAudioFileWriter addSamples:numSamples:]";
        __int16 v16 = 2050;
        uint64_t v17 = v11;
        _os_log_error_impl(&dword_1BA1A5000, v12, OS_LOG_TYPE_ERROR, "%s ::: Error writing to output wave file. : %{public}ld", buf, 0x16u);
      }
    }
  }
  return v4;
}

- (BOOL)endAudio
{
  fFile = self->fFile;
  if (fFile) {
    ExtAudioFileDispose(fFile);
  }
  self->isWriting = 0;
  return 1;
}

- (void)dealloc
{
  [(CSPlainAudioFileWriter *)self endAudio];
  v3.receiver = self;
  v3.super_class = (Class)CSPlainAudioFileWriter;
  [(CSPlainAudioFileWriter *)&v3 dealloc];
}

- (CSPlainAudioFileWriter)initWithURL:(id)a3 inputFormat:(AudioStreamBasicDescription *)a4 outputFormat:(AudioStreamBasicDescription *)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  CFURLRef v8 = (const __CFURL *)a3;
  v22.receiver = self;
  v22.super_class = (Class)CSPlainAudioFileWriter;
  v9 = [(CSPlainAudioFileWriter *)&v22 init];
  OSStatus v10 = v9;
  if (v9)
  {
    a5->mSampleRate = a4->mSampleRate;
    OSStatus v11 = ExtAudioFileCreateWithURL(v8, 0x57415645u, a5, 0, 1u, &v9->fFile);
    if (v11)
    {
      OSStatus v12 = v11;
      id v13 = CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v24 = "-[CSPlainAudioFileWriter initWithURL:inputFormat:outputFormat:]";
        __int16 v25 = 2114;
        CFURLRef v26 = v8;
        __int16 v27 = 1026;
        OSStatus v28 = v12;
        _os_log_error_impl(&dword_1BA1A5000, v13, OS_LOG_TYPE_ERROR, "%s ::: Error creating output file %{public}@, err: %{public}d", buf, 0x1Cu);
      }
    }
    if (v10->fFile) {
      CFURLRef v14 = v8;
    }
    else {
      CFURLRef v14 = 0;
    }
    fileURL = v10->_fileURL;
    v10->_fileURL = (NSURL *)v14;

    fFile = v10->fFile;
    if (fFile) {
      ExtAudioFileSetProperty(fFile, 0x63666D74u, 0x28u, a4);
    }
    v10->isWriting = 1;
    long long v17 = *(_OWORD *)&a4->mSampleRate;
    long long v18 = *(_OWORD *)&a4->mBytesPerPacket;
    *(void *)&v10->inASBD.mBitsPerChannel = *(void *)&a4->mBitsPerChannel;
    *(_OWORD *)&v10->inASBD.mBytesPerPacket = v18;
    *(_OWORD *)&v10->inASBD.mSampleRate = v17;
    long long v19 = *(_OWORD *)&a5->mSampleRate;
    long long v20 = *(_OWORD *)&a5->mBytesPerPacket;
    *(void *)&v10->outASBD.mBitsPerChannel = *(void *)&a5->mBitsPerChannel;
    *(_OWORD *)&v10->outASBD.mSampleRate = v19;
    *(_OWORD *)&v10->outASBD.mBytesPerPacket = v20;
  }

  return v10;
}

- (CSPlainAudioFileWriter)initWithFilepath:(id)a3
{
  BOOL v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:a3];
  +[CSFAudioStreamBasicDescriptionFactory utteranceFileASBD];
  +[CSFAudioStreamBasicDescriptionFactory lpcmInt16ASBD];
  id v5 = [(CSPlainAudioFileWriter *)self initWithURL:v4 inputFormat:v8 outputFormat:&v7];

  return v5;
}

- (CSPlainAudioFileWriter)initWithURL:(id)a3
{
  id v4 = a3;
  +[CSFAudioStreamBasicDescriptionFactory utteranceFileASBD];
  +[CSFAudioStreamBasicDescriptionFactory lpcmInt16ASBD];
  id v5 = [(CSPlainAudioFileWriter *)self initWithURL:v4 inputFormat:v8 outputFormat:&v7];

  return v5;
}

+ (void)saveAudioChunck:(id)a3 toURL:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "+[CSPlainAudioFileWriter saveAudioChunck:toURL:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v6;
    _os_log_impl(&dword_1BA1A5000, v7, OS_LOG_TYPE_DEFAULT, "%s saveAudioChunk toURL: %{public}@", buf, 0x16u);
  }
  uint64_t v29 = 0;
  memset(buf, 0, sizeof(buf));
  +[CSConfig inputRecordingSampleRate];
  int v9 = v8;
  uint64_t v10 = [v5 numChannels];
  LODWORD(v11) = v9;
  +[CSFAudioStreamBasicDescriptionFactory lpcmNonInterleavedASBDWithSampleRate:v10 numberOfChannels:v11];
  uint64_t v24 = 0;
  long long v22 = 0u;
  long long v23 = 0u;
  +[CSConfig inputRecordingSampleRate];
  int v13 = v12;
  uint64_t v14 = [v5 numChannels];
  LODWORD(v15) = v13;
  +[CSFAudioStreamBasicDescriptionFactory lpcmInterleavedASBDWithSampleRate:v14 numberOfChannels:v15];
  __int16 v16 = [CSPlainAudioFileWriter alloc];
  *(_OWORD *)__int16 v25 = *(_OWORD *)buf;
  long long v26 = *(_OWORD *)&buf[16];
  uint64_t v27 = v29;
  v20[0] = v22;
  v20[1] = v23;
  uint64_t v21 = v24;
  long long v17 = [(CSPlainAudioFileWriter *)v16 initWithURL:v6 inputFormat:v25 outputFormat:v20];
  if (v5)
  {
    id v18 = [v5 data];
    -[CSPlainAudioFileWriter addSamples:numSamples:](v17, "addSamples:numSamples:", [v18 bytes], objc_msgSend(v5, "numSamples"));
  }
  else
  {
    long long v19 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int16 v25 = 136315138;
      *(void *)&v25[4] = "+[CSPlainAudioFileWriter saveAudioChunck:toURL:]";
      _os_log_error_impl(&dword_1BA1A5000, v19, OS_LOG_TYPE_ERROR, "%s Invalid request: nothing to write to file", v25, 0xCu);
    }
  }
  [(CSPlainAudioFileWriter *)v17 endAudio];
}

@end