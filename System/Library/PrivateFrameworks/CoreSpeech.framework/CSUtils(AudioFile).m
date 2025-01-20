@interface CSUtils(AudioFile)
+ (BOOL)readAudioChunksFrom:()AudioFile block:;
@end

@implementation CSUtils(AudioFile)

+ (BOOL)readAudioChunksFrom:()AudioFile block:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = a4;
  inPropertyData[0] = xmmword_1C94A6F28;
  inPropertyData[1] = unk_1C94A6F38;
  uint64_t v21 = 16;
  ExtAudioFileRef outExtAudioFile = 0;
  AudioFileID outAudioFile = 0;
  if (!AudioFileOpenURL((CFURLRef)[MEMORY[0x1E4F1CB10] URLWithString:v5], kAudioFileReadPermission, 0, &outAudioFile))
  {
    if (!ExtAudioFileWrapAudioFileID(outAudioFile, 0, &outExtAudioFile)) {
      goto LABEL_5;
    }
    AudioFileClose(outAudioFile);
  }
  AudioFileID outAudioFile = 0;
LABEL_5:
  if (outExtAudioFile)
  {
    uint64_t v17 = 0;
    memset(outPropertyData, 0, sizeof(outPropertyData));
    UInt32 ioPropertyDataSize = 40;
    ExtAudioFileGetProperty(outExtAudioFile, 0x66666D74u, &ioPropertyDataSize, outPropertyData);
    ExtAudioFileSetProperty(outExtAudioFile, 0x63666D74u, 0x28u, inPropertyData);
    id v7 = [MEMORY[0x1E4F1CA58] dataWithLength:2048];
    *(void *)&ioData.mNumberBuffers = 1;
    *(void *)&ioData.mBuffers[0].mNumberChannels = 0x80000000001;
    ioData.mBuffers[0].mData = (void *)[v7 mutableBytes];
    while (1)
    {
      UInt32 ioNumberFrames = 1024;
      OSStatus v8 = ExtAudioFileRead(outExtAudioFile, &ioNumberFrames, &ioData);
      BOOL v9 = v8 == 0;
      if (v8) {
        break;
      }
      if (!ioNumberFrames) {
        goto LABEL_14;
      }
      if (v6) {
        v6[2](v6, ioData.mBuffers[0].mData, ioData.mBuffers[0].mDataByteSize >> 1);
      }
    }
    OSStatus v10 = v8;
    v11 = *MEMORY[0x1E4F5D180];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "+[CSUtils(AudioFile) readAudioChunksFrom:block:]";
      __int16 v24 = 1026;
      OSStatus v25 = v10;
      _os_log_error_impl(&dword_1C9338000, v11, OS_LOG_TYPE_ERROR, "%s Error reading audio file: %{public}d, skipping...", buf, 0x12u);
    }
LABEL_14:
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

@end