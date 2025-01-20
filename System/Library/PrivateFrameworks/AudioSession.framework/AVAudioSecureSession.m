@interface AVAudioSecureSession
- (AVAudioSecureSession)initWithIsolatedAudioUseCaseID:(unsigned int)a3;
- (BOOL)setActive:(BOOL)a3 error:(id *)a4;
- (BOOL)setCategory:(id)a3 error:(id *)a4;
- (BOOL)setCategory:(id)a3 mode:(id)a4 options:(unint64_t)a5 error:(id *)a6;
- (NSArray)availableCategories;
- (NSArray)availableModes;
- (NSString)category;
- (NSString)mode;
- (double)IOBufferDuration;
- (double)inputLatency;
- (double)inputSampleRate;
- (unint64_t)IOBufferFrameSize;
@end

@implementation AVAudioSecureSession

- (AVAudioSecureSession)initWithIsolatedAudioUseCaseID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v10.receiver = self;
  v10.super_class = (Class)AVAudioSecureSession;
  v4 = [(AVAudioSecureSession *)&v10 init];
  if (v4)
  {
    v5 = [[AVAudioSession alloc] initWithIsolatedAudioUseCaseID:v3];
    innerSession = v4->_innerSession;
    v4->_innerSession = v5;

    v7 = v4->_innerSession;
    if (!v7)
    {
      v8 = 0;
      goto LABEL_6;
    }
    [(AVAudioSession *)v7 registerPublishingSessionNotifications:v4];
  }
  v8 = v4;
LABEL_6:

  return v8;
}

- (NSArray)availableCategories
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"AVAudioSessionCategoryRecord";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return (NSArray *)v2;
}

- (BOOL)setCategory:(id)a3 error:(id *)a4
{
  return [(AVAudioSession *)self->_innerSession setCategory:a3 error:a4];
}

- (BOOL)setCategory:(id)a3 mode:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  if (a5)
  {
    if (a6)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:0];
      BOOL v12 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = [(AVAudioSession *)self->_innerSession setCategory:v10 mode:v11 options:-1 error:a6];
  }

  return v12;
}

- (NSString)category
{
  return [(AVAudioSession *)self->_innerSession category];
}

- (NSArray)availableModes
{
  v4[6] = *MEMORY[0x1E4F143B8];
  v4[0] = @"AVAudioSessionModeDefault";
  v4[1] = @"AVAudioSessionModeSpeechRecognition";
  void v4[2] = @"AVAudioSessionModeVoiceChat";
  v4[3] = @"AVAudioSessionModeVideoChat";
  v4[4] = @"AVAudioSessionModeGameChat";
  v4[5] = @"AVAudioSessionModeSoundRecognition";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:6];
  return (NSArray *)v2;
}

- (NSString)mode
{
  return [(AVAudioSession *)self->_innerSession mode];
}

- (BOOL)setActive:(BOOL)a3 error:(id *)a4
{
  return [(AVAudioSession *)self->_innerSession setActive:a3 error:a4];
}

- (double)inputSampleRate
{
  [(AVAudioSession *)self->_innerSession inputSampleRate];
  return result;
}

- (double)IOBufferDuration
{
  [(AVAudioSession *)self->_innerSession IOBufferDuration];
  return result;
}

- (double)inputLatency
{
  [(AVAudioSession *)self->_innerSession inputLatency];
  return result;
}

- (unint64_t)IOBufferFrameSize
{
  return [(AVAudioSession *)self->_innerSession IOBufferFrameSize];
}

- (void).cxx_destruct
{
}

@end