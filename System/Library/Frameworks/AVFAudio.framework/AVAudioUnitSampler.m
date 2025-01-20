@interface AVAudioUnitSampler
- (AVAudioUnitSampler)init;
- (AVAudioUnitSampler)initWithAudioComponentDescription:(AudioComponentDescription *)a3;
- (BOOL)loadAudioFilesAtURLs:(NSArray *)audioFiles error:(NSError *)outError;
- (BOOL)loadInstrumentAtURL:(NSURL *)instrumentURL error:(NSError *)outError;
- (BOOL)loadSoundBankInstrumentAtURL:(NSURL *)bankURL program:(uint8_t)program bankMSB:(uint8_t)bankMSB bankLSB:(uint8_t)bankLSB error:(NSError *)outError;
- (float)globalTuning;
- (float)overallGain;
- (float)stereoPan;
- (void)setGlobalTuning:(float)globalTuning;
- (void)setOverallGain:(float)overallGain;
- (void)setStereoPan:(float)stereoPan;
@end

@implementation AVAudioUnitSampler

- (void)setGlobalTuning:(float)globalTuning
{
  float v4 = globalTuning / 100.0;
  int v5 = (int)fmod(globalTuning, 100.0);
  (*(void (**)(void *, uint64_t, void, void, float))(*(void *)self->super.super.super._impl + 128))(self->super.super.super._impl, 901, 0, 0, (float)(int)v4);
  v7 = *(void (**)(__n128))(*(void *)self->super.super.super._impl + 128);

  v6.n128_f32[0] = (float)v5;
  v7(v6);
}

- (void)setOverallGain:(float)overallGain
{
}

- (void)setStereoPan:(float)stereoPan
{
}

- (float)globalTuning
{
  uint64_t v4 = 0;
  (*(void (**)(void *, uint64_t, void, void, char *))(*(void *)self->super.super.super._impl + 136))(self->super.super.super._impl, 902, 0, 0, (char *)&v4 + 4);
  (*(void (**)(void *, uint64_t, void, void, uint64_t *))(*(void *)self->super.super.super._impl + 136))(self->super.super.super._impl, 901, 0, 0, &v4);
  return *((float *)&v4 + 1) + (float)(*(float *)&v4 * 100.0);
}

- (float)overallGain
{
  float v3 = 0.0;
  (*(void (**)(void *, uint64_t, void, void, float *))(*(void *)self->super.super.super._impl + 136))(self->super.super.super._impl, 900, 0, 0, &v3);
  return v3;
}

- (float)stereoPan
{
  float v3 = 0.0;
  (*(void (**)(void *, uint64_t, void, void, float *))(*(void *)self->super.super.super._impl + 136))(self->super.super.super._impl, 903, 0, 0, &v3);
  return v3;
}

- (BOOL)loadAudioFilesAtURLs:(NSArray *)audioFiles error:(NSError *)outError
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v11, (uint64_t)self->super.super.super._impl);
  impl = self->super.super.super._impl;
  v15 = audioFiles;
  uint64_t v8 = (*(uint64_t (**)(void *, uint64_t, void, void, NSArray **, uint64_t))(*(void *)impl + 160))(impl, 4101, 0, 0, &v15, 8);
  int v9 = v8;
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioUnitSampler.mm", 167, "-[AVAudioUnitSampler loadAudioFilesAtURLs:error:]", "error", v8, outError);
  if (v14) {
    std::recursive_mutex::unlock(v13);
  }
  if (v12) {
    std::recursive_mutex::unlock(v11);
  }
  return v9 == 0;
}

- (BOOL)loadSoundBankInstrumentAtURL:(NSURL *)bankURL program:(uint8_t)program bankMSB:(uint8_t)bankMSB bankLSB:(uint8_t)bankLSB error:(NSError *)outError
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v16, (uint64_t)self->super.super.super._impl);
  impl = (AVAudioUnitSamplerImpl *)self->super.super.super._impl;
  char v21 = 1;
  uint8_t v23 = bankLSB;
  uint8_t v22 = bankMSB;
  v20 = bankURL;
  uint8_t v24 = program;
  uint64_t v14 = (*(uint64_t (**)(AVAudioUnitSamplerImpl *, uint64_t, void, void, NSURL **, uint64_t))(*(void *)impl + 160))(impl, 4102, 0, 0, &v20, 16);
  if (!v14) {
    AVAudioUnitSamplerImpl::SetSoundBankURL(impl, bankURL);
  }
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioUnitSampler.mm", 157, "-[AVAudioUnitSampler loadSoundBankInstrumentAtURL:program:bankMSB:bankLSB:error:]", "error", v14, outError);
  if (v19) {
    std::recursive_mutex::unlock(v18);
  }
  if (v17) {
    std::recursive_mutex::unlock(v16);
  }
  return v14 == 0;
}

- (BOOL)loadInstrumentAtURL:(NSURL *)instrumentURL error:(NSError *)outError
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v13, (uint64_t)self->super.super.super._impl);
  if ([(NSString *)[(NSURL *)instrumentURL pathExtension] caseInsensitiveCompare:@"aupreset"])
  {
    if ([(NSString *)[(NSURL *)instrumentURL pathExtension] caseInsensitiveCompare:@"exs"])
    {
      if ([(NSString *)[(NSURL *)instrumentURL pathExtension] caseInsensitiveCompare:@"dls"]&& [(NSString *)[(NSURL *)instrumentURL pathExtension] caseInsensitiveCompare:@"sf2"])
      {
        LODWORD(v7) = -50;
        goto LABEL_16;
      }
      int v8 = 1;
      char v9 = 1;
    }
    else
    {
      int v8 = 0;
      char v9 = 4;
    }
  }
  else
  {
    int v8 = 0;
    char v9 = 2;
  }
  impl = (AVAudioUnitSamplerImpl *)self->super.super.super._impl;
  (*(void (**)(AVAudioUnitSamplerImpl *))(*(void *)impl + 32))(impl);
  char v18 = v9;
  char v17 = instrumentURL;
  __int16 v19 = 121;
  char v20 = 0;
  uint64_t v7 = (*(uint64_t (**)(AVAudioUnitSamplerImpl *, uint64_t, void, void, NSURL **, uint64_t))(*(void *)impl + 160))(impl, 4102, 0, 0, &v17, 16);
  if (!v7)
  {
    if (v8)
    {
      AVAudioUnitSamplerImpl::SetSoundBankURL(impl, instrumentURL);
    }
    else
    {
      v11 = (const void *)*((void *)impl + 24);
      if (v11)
      {
        CFRelease(v11);
        *((void *)impl + 24) = 0;
      }
      *((unsigned char *)impl + 184) = 0;
    }
  }
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioUnitSampler.mm", 144, "-[AVAudioUnitSampler loadInstrumentAtURL:error:]", "error", v7, outError);
LABEL_16:
  if (v16) {
    std::recursive_mutex::unlock(v15);
  }
  if (v14) {
    std::recursive_mutex::unlock(v13);
  }
  return v7 == 0;
}

- (AVAudioUnitSampler)initWithAudioComponentDescription:(AudioComponentDescription *)a3
{
}

- (AVAudioUnitSampler)init
{
  strcpy(v3, "umuapmaslppa");
  char v4 = 0;
  __int16 v5 = 0;
  int v6 = 0;
  return [(AVAudioUnitSampler *)self initWithAudioComponentDescription:v3];
}

@end