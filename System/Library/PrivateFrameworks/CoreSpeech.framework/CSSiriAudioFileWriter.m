@interface CSSiriAudioFileWriter
+ (id)_generateTemporaryFileURL;
+ (id)_savedAudioFilesDirectory;
- (CSSiriAudioFileWriter)init;
- (CSSiriAudioFileWriter)initWithType:(int64_t)a3 fileHandle:(id)a4 priority:(unsigned int)a5;
- (CSSiriAudioFileWriter)initWithType:(int64_t)a3 pathGenerator:(id)a4 priority:(unsigned int)a5;
- (id)_initWithType:(int64_t)a3 pathGenerator:(id)a4 xorFileHandle:(id)a5 priority:(unsigned int)a6;
- (void)_close;
- (void)_delete;
- (void)appendAudioData:(id)a3;
- (void)cancel;
- (void)configureWithAudioStreamBasicDescription:(const AudioStreamBasicDescription *)a3;
- (void)dealloc;
- (void)flushWithCompletion:(id)a3;
@end

@implementation CSSiriAudioFileWriter

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
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__CSSiriAudioFileWriter_cancel__block_invoke;
  block[3] = &unk_1E658D4D8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __31__CSSiriAudioFileWriter_cancel__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _close];
  v2 = *(void **)(a1 + 32);
  return [v2 _delete];
}

- (void)flushWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__CSSiriAudioFileWriter_flushWithCompletion___block_invoke;
  v7[3] = &unk_1E658D3A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __45__CSSiriAudioFileWriter_flushWithCompletion___block_invoke(uint64_t a1)
{
  v24[1] = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  v3 = (void *)v2[3];
  if (v3)
  {
    if (v2[11])
    {
LABEL_5:
      v9 = 0;
      goto LABEL_12;
    }
    id v4 = [v3 path];
    uint64_t v5 = open((const char *)[v4 fileSystemRepresentation], 0);

    if ((v5 & 0x80000000) == 0)
    {
      uint64_t v6 = [objc_alloc(MEMORY[0x1E4F28CB0]) initWithFileDescriptor:v5 closeOnDealloc:1];
      uint64_t v7 = *(void *)(a1 + 32);
      id v8 = *(void **)(v7 + 88);
      *(void *)(v7 + 88) = v6;

      goto LABEL_5;
    }
    v14 = (void *)*MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      v16 = v14;
      v17 = __error();
      v18 = strerror(*v17);
      int v19 = 136315394;
      v20 = "-[CSSiriAudioFileWriter flushWithCompletion:]_block_invoke";
      __int16 v21 = 2082;
      v22 = v18;
      _os_log_error_impl(&dword_1C9338000, v16, OS_LOG_TYPE_ERROR, "%s Failed opening fd for flushed audio file %{public}s", (uint8_t *)&v19, 0x16u);
    }
    id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
    v9 = (void *)[v15 initWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:0];
  }
  else
  {
    v10 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      int v19 = 136315138;
      v20 = "-[CSSiriAudioFileWriter flushWithCompletion:]_block_invoke";
      _os_log_error_impl(&dword_1C9338000, v10, OS_LOG_TYPE_ERROR, "%s No file url on flush", (uint8_t *)&v19, 0xCu);
      v2 = *(void **)(a1 + 32);
    }
    uint64_t v11 = v2[12];
    if (v11)
    {
      uint64_t v23 = *MEMORY[0x1E4F28A50];
      v24[0] = v11;
      v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    }
    else
    {
      v12 = 0;
    }
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"CSSiriAudioFileWriterErrorDomain" code:1 userInfo:v12];
  }
LABEL_12:
  [*(id *)(a1 + 32) _close];
  uint64_t v13 = *(void *)(a1 + 40);
  if (v13) {
    (*(void (**)(uint64_t, void, void, void *))(v13 + 16))(v13, *(void *)(*(void *)(a1 + 32) + 88), *(void *)(*(void *)(a1 + 32) + 24), v9);
  }
}

- (void)appendAudioData:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__CSSiriAudioFileWriter_appendAudioData___block_invoke;
  v7[3] = &unk_1E658D4B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __41__CSSiriAudioFileWriter_appendAudioData___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1 + 32) + 40))
  {
    unsigned int v2 = [*(id *)(a1 + 40) length];
    *(void *)&ioData.mNumberBuffers = 1;
    uint64_t v4 = *(void *)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    unsigned int v5 = *(_DWORD *)(v4 + 72);
    ioData.mBuffers[0].mNumberChannels = *(_DWORD *)(v4 + 76);
    UInt32 v6 = v2 / v5;
    ioData.mBuffers[0].mDataByteSize = [v3 length];
    ioData.mBuffers[0].mData = (void *)[*(id *)(a1 + 40) bytes];
    OSStatus v7 = ExtAudioFileWrite(*(ExtAudioFileRef *)(*(void *)(a1 + 32) + 40), v6, &ioData);
    if (v7)
    {
      OSStatus v8 = v7;
      v9 = *MEMORY[0x1E4F4E380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
      {
        int v15 = 136315394;
        v16 = "-[CSSiriAudioFileWriter appendAudioData:]_block_invoke";
        __int16 v17 = 1026;
        OSStatus v18 = v8;
        v10 = "%s Failed writing audio file %{public}d";
        p_AudioBufferList ioData = (AudioBufferList *)&v15;
        v12 = v9;
        uint32_t v13 = 18;
LABEL_8:
        _os_log_error_impl(&dword_1C9338000, v12, OS_LOG_TYPE_ERROR, v10, (uint8_t *)p_ioData, v13);
      }
    }
  }
  else
  {
    v14 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      ioData.mNumberBuffers = 136315138;
      *(void *)(&ioData.mNumberBuffers + 1) = "-[CSSiriAudioFileWriter appendAudioData:]_block_invoke";
      v10 = "%s No audio file to append data";
      p_AudioBufferList ioData = &ioData;
      v12 = v14;
      uint32_t v13 = 12;
      goto LABEL_8;
    }
  }
}

- (void)configureWithAudioStreamBasicDescription:(const AudioStreamBasicDescription *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v5 = *(_OWORD *)&a3->mBytesPerPacket;
  long long v12 = *(_OWORD *)&a3->mSampleRate;
  long long v13 = v5;
  uint64_t v14 = *(void *)&a3->mBitsPerChannel;
  UInt32 v6 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v16 = "-[CSSiriAudioFileWriter configureWithAudioStreamBasicDescription:]";
    __int16 v17 = 1040;
    int v18 = 4;
    __int16 v19 = 2080;
    uint64_t v20 = (char *)&v12 + 8;
    _os_log_impl(&dword_1C9338000, v6, OS_LOG_TYPE_INFO, "%s Configuring with asbd %.4s", buf, 0x1Cu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__CSSiriAudioFileWriter_configureWithAudioStreamBasicDescription___block_invoke;
  block[3] = &unk_1E6589DE8;
  block[4] = self;
  void block[5] = a2;
  long long v9 = v12;
  long long v10 = v13;
  uint64_t v11 = v14;
  dispatch_async(queue, block);
}

uint64_t __66__CSSiriAudioFileWriter_configureWithAudioStreamBasicDescription___block_invoke(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 40))
  {
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"CSSiriAudioFileWriter.m" lineNumber:213 description:@"AudioFile Already configured"];

    uint64_t v2 = *(void *)(a1 + 32);
  }
  long long v3 = *(_OWORD *)(a1 + 48);
  long long v4 = *(_OWORD *)(a1 + 64);
  *(void *)(v2 + 80) = *(void *)(a1 + 80);
  *(_OWORD *)(v2 + 48) = v3;
  *(_OWORD *)(v2 + 64) = v4;
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 32);
  if (v5) {
    [MEMORY[0x1E4F1CB10] fileURLWithPath:v5 isDirectory:0];
  }
  else {
  UInt32 v6 = [(id)objc_opt_class() _generateTemporaryFileURL];
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), v6);

  OSStatus v7 = (os_log_t *)MEMORY[0x1E4F4E380];
  OSStatus v8 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 24);
    *(_DWORD *)buf = 136315394;
    v36 = "-[CSSiriAudioFileWriter configureWithAudioStreamBasicDescription:]_block_invoke";
    __int16 v37 = 2112;
    *(void *)v38 = v9;
    _os_log_impl(&dword_1C9338000, v8, OS_LOG_TYPE_INFO, "%s Creating audio file at URL %@", buf, 0x16u);
  }
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void *)(v10 + 16);
  memset(&v32.mFormatID, 0, 32);
  UInt32 v12 = *(_DWORD *)(v10 + 76);
  v32.mChannelsPerFrame = v12;
  if (!v12)
  {
    long long v13 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v36 = "_AudioStreamBasicDescriptionForAFAudioFileType";
      __int16 v37 = 2048;
      *(void *)v38 = 0;
      _os_log_error_impl(&dword_1C9338000, v13, OS_LOG_TYPE_ERROR, "%s inASBD->mChannelsPerFrame = %lu", buf, 0x16u);
    }
    UInt32 v12 = 1;
    v32.mChannelsPerFrame = 1;
  }
  v32.mSampleRate = *(Float64 *)(v10 + 48);
  switch(v11)
  {
    case 3:
      v32.mSampleRate = 24000.0;
      v32.mFormatID = 1869641075;
      v32.mFramesPerPacket = 480;
      v32.mChannelsPerFrame = 1;
      break;
    case 2:
      *(void *)&v32.mFormatID = 0xC6C70636DLL;
      v32.mBitsPerChannel = 16;
      v32.mFramesPerPacket = 1;
      v32.mBytesPerFrame = 2 * v12;
      v32.mBytesPerPacket = 2 * v12;
      break;
    case 1:
      v32.mSampleRate = 0.0;
      v32.mFormatID = 1935764850;
      break;
    default:
      goto LABEL_21;
  }
  UInt32 ioPropertyDataSize = 40;
  OSStatus Property = AudioFormatGetProperty(0x666D7469u, 0, 0, &ioPropertyDataSize, &v32);
  if (Property)
  {
    uint64_t v14 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v36 = "_AudioStreamBasicDescriptionForAFAudioFileType";
      __int16 v37 = 1042;
      *(_DWORD *)v38 = 4;
      *(_WORD *)&v38[4] = 2082;
      *(void *)&v38[6] = &v32.mFormatID;
      __int16 v39 = 1042;
      int v40 = 4;
      __int16 v41 = 2082;
      p_OSStatus Property = &Property;
      _os_log_error_impl(&dword_1C9338000, v14, OS_LOG_TYPE_ERROR, "%s Error getting format info for type %{public}.4s %{public}.4s", buf, 0x2Cu);
    }
  }
LABEL_21:
  uint64_t v15 = *(void *)(a1 + 32);
  uint64_t v16 = *(void *)(v15 + 16);
  if ((unint64_t)(v16 - 1) > 2) {
    AudioFileTypeID v17 = 0;
  }
  else {
    AudioFileTypeID v17 = dword_1C94A6D7C[v16 - 1];
  }
  if (v16 == 3) {
    UInt32 v18 = 3;
  }
  else {
    UInt32 v18 = 1;
  }
  OSStatus v19 = ExtAudioFileCreateWithURL(*(CFURLRef *)(v15 + 24), v17, &v32, 0, v18, (ExtAudioFileRef *)(v15 + 40));
  if (v19)
  {
    OSStatus v20 = v19;
    uint64_t v21 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v30 = *(void *)(*(void *)(a1 + 32) + 24);
      *(_DWORD *)buf = 136315650;
      v36 = "-[CSSiriAudioFileWriter configureWithAudioStreamBasicDescription:]_block_invoke";
      __int16 v37 = 2114;
      *(void *)v38 = v30;
      *(_WORD *)&v38[8] = 1026;
      *(_DWORD *)&v38[10] = v20;
      _os_log_error_impl(&dword_1C9338000, v21, OS_LOG_TYPE_ERROR, "%s Failed creating audio file at url %{public}@ %{public}d", buf, 0x1Cu);
    }
    uint64_t v22 = *(void *)(a1 + 32);
    if (!*(void *)(v22 + 96) && *(void *)(v22 + 88))
    {
      id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v24 = objc_msgSend(v23, "initWithDomain:code:userInfo:", @"CSSiriAudioFileWriterExtAudioFileErrorDomain", v20, 0, *(void *)&v32.mSampleRate, *(_OWORD *)&v32.mFormatID, *(_OWORD *)&v32.mBytesPerFrame);
      uint64_t v25 = *(void *)(a1 + 32);
      v26 = *(void **)(v25 + 96);
      *(void *)(v25 + 96) = v24;
    }
  }
  else
  {
    uint64_t result = ExtAudioFileSetProperty(*(ExtAudioFileRef *)(*(void *)(a1 + 32) + 40), 0x63666D74u, 0x28u, (const void *)(*(void *)(a1 + 32) + 48));
    if (!result) {
      return result;
    }
    int v28 = result;
    v29 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v36 = "-[CSSiriAudioFileWriter configureWithAudioStreamBasicDescription:]_block_invoke";
      __int16 v37 = 1026;
      *(_DWORD *)v38 = v28;
      _os_log_error_impl(&dword_1C9338000, v29, OS_LOG_TYPE_ERROR, "%s Error setting input format %{public}d", buf, 0x12u);
    }
  }
  uint64_t result = *(void *)(a1 + 32);
  if (*(void *)(result + 40))
  {
    [(id)result _close];
    return [*(id *)(a1 + 32) _delete];
  }
  return result;
}

- (void)_delete
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_url)
  {
    long long v3 = [MEMORY[0x1E4F28CB8] defaultManager];
    url = self->_url;
    id v9 = 0;
    char v5 = [v3 removeItemAtURL:url error:&v9];
    id v6 = v9;

    if ((v5 & 1) == 0)
    {
      OSStatus v7 = *MEMORY[0x1E4F4E380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v11 = "-[CSSiriAudioFileWriter _delete]";
        __int16 v12 = 2114;
        id v13 = v6;
        _os_log_error_impl(&dword_1C9338000, v7, OS_LOG_TYPE_ERROR, "%s Error removing item at URL %{public}@", buf, 0x16u);
      }
    }
    OSStatus v8 = self->_url;
    self->_url = 0;
  }
}

- (void)_close
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  audioFile = self->_audioFile;
  if (audioFile)
  {
    OSStatus v4 = ExtAudioFileDispose(audioFile);
    if (v4)
    {
      OSStatus v5 = v4;
      id v6 = *MEMORY[0x1E4F4E380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
      {
        int v7 = 136315394;
        OSStatus v8 = "-[CSSiriAudioFileWriter _close]";
        __int16 v9 = 1026;
        OSStatus v10 = v5;
        _os_log_error_impl(&dword_1C9338000, v6, OS_LOG_TYPE_ERROR, "%s Failure disposing audio file %{public}d", (uint8_t *)&v7, 0x12u);
      }
    }
    self->_audioFile = 0;
  }
}

- (void)dealloc
{
  [(CSSiriAudioFileWriter *)self _close];
  v3.receiver = self;
  v3.super_class = (Class)CSSiriAudioFileWriter;
  [(CSSiriAudioFileWriter *)&v3 dealloc];
}

- (CSSiriAudioFileWriter)init
{
  return 0;
}

- (id)_initWithType:(int64_t)a3 pathGenerator:(id)a4 xorFileHandle:(id)a5 priority:(unsigned int)a6
{
  id v11 = a4;
  id v12 = a5;
  if (!a3)
  {
    OSStatus v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"CSSiriAudioFileWriter.m", 62, @"Invalid parameter not satisfying: %@", @"type != AFAudioFileTypeNone" object file lineNumber description];
  }
  v25.receiver = self;
  v25.super_class = (Class)CSSiriAudioFileWriter;
  id v13 = [(CSSiriAudioFileWriter *)&v25 init];
  if (v13)
  {
    uint64_t v14 = dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)a6, 0);
    dispatch_queue_t v15 = dispatch_queue_create("CSSiriAudioFileWriterQueue", v14);

    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v15;

    AudioFileTypeID v17 = v13->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__CSSiriAudioFileWriter__initWithType_pathGenerator_xorFileHandle_priority___block_invoke;
    block[3] = &unk_1E658A9D0;
    uint64_t v21 = v13;
    int64_t v24 = a3;
    id v22 = v12;
    id v23 = v11;
    dispatch_async(v17, block);
  }
  return v13;
}

void __76__CSSiriAudioFileWriter__initWithType_pathGenerator_xorFileHandle_priority___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  *(void *)(*(void *)(a1 + 32) + 16) = *(void *)(a1 + 56);
  objc_super v3 = *(void **)(a1 + 40);
  if (v3)
  {
    if (fcntl([v3 fileDescriptor], 50, v19) == -1)
    {
      __int16 v9 = *MEMORY[0x1E4F4E380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        UInt32 v18 = "-[CSSiriAudioFileWriter _initWithType:pathGenerator:xorFileHandle:priority:]_block_invoke";
        _os_log_error_impl(&dword_1C9338000, v9, OS_LOG_TYPE_ERROR, "%s Error getting file path from provided file handle; will create our own path and handle",
          buf,
          0xCu);
      }
    }
    else
    {
      uint64_t v4 = objc_msgSend(NSString, "stringWithCString:encoding:", v19, objc_msgSend(NSString, "defaultCStringEncoding"));
      uint64_t v5 = *(void *)(a1 + 32);
      id v6 = *(void **)(v5 + 32);
      *(void *)(v5 + 32) = v4;

      objc_storeStrong((id *)(*(void *)(a1 + 32) + 88), *(id *)(a1 + 40));
    }
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 48);
    if (v7)
    {
      v1 = (*(void (**)(void))(v7 + 16))(*(void *)(a1 + 48));
      OSStatus v8 = (void *)[v1 copy];
    }
    else
    {
      OSStatus v8 = 0;
    }
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), v8);
    if (v7)
    {
    }
  }
  if ((AFIsInternalInstall() & 1) == 0)
  {
    id v11 = [MEMORY[0x1E4F4E538] sharedPreferences];
    if ([v11 shouldLogForQA])
    {
      uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 32);

      if (v12)
      {
        uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 32);
        goto LABEL_17;
      }
    }
    else
    {
    }
LABEL_19:
    id v13 = 0;
    goto LABEL_20;
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 32);
  if (!v10) {
    goto LABEL_19;
  }
LABEL_17:
  dispatch_queue_t v15 = @"path";
  uint64_t v16 = v10;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
LABEL_20:
  uint64_t v14 = [MEMORY[0x1E4F4E3A0] sharedAnalytics];
  [v14 logEventWithType:238 context:v13];
}

- (CSSiriAudioFileWriter)initWithType:(int64_t)a3 fileHandle:(id)a4 priority:(unsigned int)a5
{
  return (CSSiriAudioFileWriter *)[(CSSiriAudioFileWriter *)self _initWithType:a3 pathGenerator:0 xorFileHandle:a4 priority:*(void *)&a5];
}

- (CSSiriAudioFileWriter)initWithType:(int64_t)a3 pathGenerator:(id)a4 priority:(unsigned int)a5
{
  return (CSSiriAudioFileWriter *)[(CSSiriAudioFileWriter *)self _initWithType:a3 pathGenerator:a4 xorFileHandle:0 priority:*(void *)&a5];
}

+ (id)_generateTemporaryFileURL
{
  uint64_t v2 = [a1 _savedAudioFilesDirectory];
  objc_super v3 = [v2 URLByAppendingPathComponent:@"SavedAudioFile"];

  return v3;
}

+ (id)_savedAudioFilesDirectory
{
  return (id)MEMORY[0x1F4115458](a1, a2);
}

@end