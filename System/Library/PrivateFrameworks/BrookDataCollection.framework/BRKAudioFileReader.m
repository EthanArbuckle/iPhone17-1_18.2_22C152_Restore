@interface BRKAudioFileReader
- (BOOL)readData:(signed __int16 *)a3 count:(int64_t *)a4;
- (BRKAudioFileReader)initWithPath:(id)a3;
- (NSString)path;
- (int64_t)fileFrameCount;
- (void)dealloc;
@end

@implementation BRKAudioFileReader

- (BRKAudioFileReader)initWithPath:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BRKAudioFileReader;
  v6 = [(BRKAudioFileReader *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_path, a3);
    CFURLRef v8 = [NSURL fileURLWithPath:v5 isDirectory:0];
    ExtAudioFileOpenURL(v8, &v7->_audioFile);
  }
  return v7;
}

- (BOOL)readData:(signed __int16 *)a3 count:(int64_t *)a4
{
  audioFile = self->_audioFile;
  if (audioFile)
  {
    *(&ioData.mNumberBuffers + 1) = 0;
    ioData.mNumberBuffers = 1;
    UInt32 v6 = *(_DWORD *)a4;
    ioData.mBuffers[0].mNumberChannels = 1;
    ioData.mBuffers[0].mDataByteSize = 2 * v6;
    ioData.mBuffers[0].mData = a3;
    UInt32 ioNumberFrames = v6;
    OSStatus v7 = ExtAudioFileRead(audioFile, &ioNumberFrames, &ioData);
    if (v7)
    {
      int v8 = v7;
      v9 = BRKLoggingObjectForDomain();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[BRKAudioFileReader readData:count:](v8, v9);
      }

      UInt32 v10 = 0;
    }
    else
    {
      UInt32 v10 = ioNumberFrames;
    }
    *a4 = v10;
    LOBYTE(audioFile) = v10 != 0;
  }
  return (char)audioFile;
}

- (int64_t)fileFrameCount
{
  int64_t outPropertyData = 0;
  UInt32 ioPropertyDataSize = 8;
  if (ExtAudioFileGetProperty(self->_audioFile, 0x2366726Du, &ioPropertyDataSize, &outPropertyData)) {
    return outPropertyData;
  }
  else {
    return 0;
  }
}

- (void)dealloc
{
  audioFile = self->_audioFile;
  if (audioFile) {
    ExtAudioFileDispose(audioFile);
  }
  v4.receiver = self;
  v4.super_class = (Class)BRKAudioFileReader;
  [(BRKAudioFileReader *)&v4 dealloc];
}

- (NSString)path
{
  return self->_path;
}

- (void).cxx_destruct
{
}

- (void)readData:(int)a1 count:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_234680000, a2, OS_LOG_TYPE_ERROR, "Unable to read audio %d", (uint8_t *)v2, 8u);
}

@end