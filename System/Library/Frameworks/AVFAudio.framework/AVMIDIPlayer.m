@interface AVMIDIPlayer
- (AVMIDIPlayer)initWithContentsOfURL:(NSURL *)inURL soundBankURL:(NSURL *)bankURL error:(NSError *)outError;
- (AVMIDIPlayer)initWithData:(NSData *)data soundBankURL:(NSURL *)bankURL error:(NSError *)outError;
- (BOOL)isPlaying;
- (MIDIPlayerImpl)impl;
- (NSTimeInterval)currentPosition;
- (NSTimeInterval)duration;
- (double)beatsForHostTime:(unint64_t)a3;
- (float)rate;
- (id)initBase;
- (unint64_t)hostTimeForBeats:(double)a3;
- (void)dealloc;
- (void)destroyBase;
- (void)finalize;
- (void)play:(AVMIDIPlayerCompletionHandler)completionHandler;
- (void)prepareToPlay;
- (void)setCurrentPosition:(NSTimeInterval)currentPosition;
- (void)setRate:(float)rate;
- (void)stop;
@end

@implementation AVMIDIPlayer

- (void)setCurrentPosition:(NSTimeInterval)currentPosition
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v4 = [(AVMIDIPlayer *)self impl];
  MusicTimeStamp outBeats = 0.0;
  uint64_t BeatsForSeconds = MusicSequenceGetBeatsForSeconds(v4->var2, currentPosition, &outBeats);
  if (BeatsForSeconds)
  {
    uint64_t v6 = BeatsForSeconds;
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    v7 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316674;
      v13 = "AVAEInternal.h";
      __int16 v14 = 1024;
      int v15 = 104;
      __int16 v16 = 2080;
      v17 = "AVMIDIPlayer.mm";
      __int16 v18 = 1024;
      int v19 = 200;
      __int16 v20 = 2080;
      v21 = "-[AVMIDIPlayer setCurrentPosition:]";
      __int16 v22 = 2080;
      v23 = "MusicSequenceGetBeatsForSeconds(impl->mSequence, (Float64) currentPosition, &positionInBeats)";
      __int16 v24 = 1024;
      int v25 = v6;
      _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d [%s:%d:%s: (%s): error %d", buf, 0x3Cu);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"error %d", v6);
  }
  uint64_t v8 = MusicPlayerSetTime(v4->var1, outBeats);
  if (v8)
  {
    uint64_t v9 = v8;
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    v10 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316674;
      v13 = "AVAEInternal.h";
      __int16 v14 = 1024;
      int v15 = 104;
      __int16 v16 = 2080;
      v17 = "AVMIDIPlayer.mm";
      __int16 v18 = 1024;
      int v19 = 201;
      __int16 v20 = 2080;
      v21 = "-[AVMIDIPlayer setCurrentPosition:]";
      __int16 v22 = 2080;
      v23 = "MusicPlayerSetTime(impl->mPlayer, positionInBeats)";
      __int16 v24 = 1024;
      int v25 = v9;
      _os_log_impl(&dword_19D794000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d [%s:%d:%s: (%s): error %d", buf, 0x3Cu);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"error %d", v9);
  }
}

- (NSTimeInterval)currentPosition
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v2 = [(AVMIDIPlayer *)self impl];
  Float64 outSeconds = 0.0;
  outuint64_t Time = 0.0;
  uint64_t Time = MusicPlayerGetTime(v2->var1, &outTime);
  if (Time)
  {
    uint64_t v4 = Time;
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    v5 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316674;
      v13 = "AVAEInternal.h";
      __int16 v14 = 1024;
      int v15 = 104;
      __int16 v16 = 2080;
      v17 = "AVMIDIPlayer.mm";
      __int16 v18 = 1024;
      int v19 = 191;
      __int16 v20 = 2080;
      v21 = "-[AVMIDIPlayer currentPosition]";
      __int16 v22 = 2080;
      v23 = "MusicPlayerGetTime(impl->mPlayer, &positionInBeats)";
      __int16 v24 = 1024;
      int v25 = v4;
      _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d [%s:%d:%s: (%s): error %d", buf, 0x3Cu);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"error %d", v4);
  }
  uint64_t SecondsForBeats = MusicSequenceGetSecondsForBeats(v2->var2, outTime, &outSeconds);
  if (SecondsForBeats)
  {
    uint64_t v7 = SecondsForBeats;
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    uint64_t v8 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316674;
      v13 = "AVAEInternal.h";
      __int16 v14 = 1024;
      int v15 = 104;
      __int16 v16 = 2080;
      v17 = "AVMIDIPlayer.mm";
      __int16 v18 = 1024;
      int v19 = 192;
      __int16 v20 = 2080;
      v21 = "-[AVMIDIPlayer currentPosition]";
      __int16 v22 = 2080;
      v23 = "MusicSequenceGetSecondsForBeats(impl->mSequence, positionInBeats, &positionInTime)";
      __int16 v24 = 1024;
      int v25 = v7;
      _os_log_impl(&dword_19D794000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d [%s:%d:%s: (%s): error %d", buf, 0x3Cu);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"error %d", v7);
  }
  return outSeconds;
}

- (NSTimeInterval)duration
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = [(AVMIDIPlayer *)self impl];
  Float64 outSeconds = 0.0;
  uint64_t SecondsForBeats = MusicSequenceGetSecondsForBeats(v2->var2, v2->var3, &outSeconds);
  if (SecondsForBeats)
  {
    uint64_t v4 = SecondsForBeats;
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    v5 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316674;
      uint64_t v9 = "AVAEInternal.h";
      __int16 v10 = 1024;
      int v11 = 104;
      __int16 v12 = 2080;
      v13 = "AVMIDIPlayer.mm";
      __int16 v14 = 1024;
      int v15 = 182;
      __int16 v16 = 2080;
      v17 = "-[AVMIDIPlayer duration]";
      __int16 v18 = 2080;
      int v19 = "MusicSequenceGetSecondsForBeats(impl->mSequence, impl->mLength, &durInSeconds)";
      __int16 v20 = 1024;
      int v21 = v4;
      _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d [%s:%d:%s: (%s): error %d", buf, 0x3Cu);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"error %d", v4);
  }
  return outSeconds;
}

- (void)setRate:(float)rate
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = MusicPlayerSetPlayRateScalar((MusicPlayer)[(AVMIDIPlayer *)self impl][8], rate);
  if (v3)
  {
    uint64_t v4 = v3;
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    v5 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316674;
      uint64_t v7 = "AVAEInternal.h";
      __int16 v8 = 1024;
      int v9 = 104;
      __int16 v10 = 2080;
      int v11 = "AVMIDIPlayer.mm";
      __int16 v12 = 1024;
      int v13 = 175;
      __int16 v14 = 2080;
      int v15 = "-[AVMIDIPlayer setRate:]";
      __int16 v16 = 2080;
      v17 = "MusicPlayerSetPlayRateScalar(impl->mPlayer, rate)";
      __int16 v18 = 1024;
      int v19 = v4;
      _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d [%s:%d:%s: (%s): error %d", buf, 0x3Cu);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"error %d", v4);
  }
}

- (float)rate
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  Float64 outScaleRate = 0.0;
  uint64_t PlayRateScalar = MusicPlayerGetPlayRateScalar((MusicPlayer)[(AVMIDIPlayer *)self impl][8], &outScaleRate);
  if (PlayRateScalar)
  {
    uint64_t v3 = PlayRateScalar;
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    uint64_t v4 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316674;
      __int16 v8 = "AVAEInternal.h";
      __int16 v9 = 1024;
      int v10 = 104;
      __int16 v11 = 2080;
      __int16 v12 = "AVMIDIPlayer.mm";
      __int16 v13 = 1024;
      int v14 = 168;
      __int16 v15 = 2080;
      __int16 v16 = "-[AVMIDIPlayer rate]";
      __int16 v17 = 2080;
      __int16 v18 = "MusicPlayerGetPlayRateScalar(impl->mPlayer, &scalar)";
      __int16 v19 = 1024;
      int v20 = v3;
      _os_log_impl(&dword_19D794000, v4, OS_LOG_TYPE_ERROR, "%25s:%-5d [%s:%d:%s: (%s): error %d", buf, 0x3Cu);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"error %d", v3);
  }
  return outScaleRate;
}

- (BOOL)isPlaying
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  outuint64_t IsPlaying = 0;
  uint64_t IsPlaying = MusicPlayerIsPlaying((MusicPlayer)[(AVMIDIPlayer *)self impl][8], &outIsPlaying);
  if (IsPlaying)
  {
    uint64_t v3 = IsPlaying;
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    uint64_t v4 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316674;
      __int16 v8 = "AVAEInternal.h";
      __int16 v9 = 1024;
      int v10 = 104;
      __int16 v11 = 2080;
      __int16 v12 = "AVMIDIPlayer.mm";
      __int16 v13 = 1024;
      int v14 = 160;
      __int16 v15 = 2080;
      __int16 v16 = "-[AVMIDIPlayer isPlaying]";
      __int16 v17 = 2080;
      __int16 v18 = "MusicPlayerIsPlaying(impl->mPlayer, &playing)";
      __int16 v19 = 1024;
      int v20 = v3;
      _os_log_impl(&dword_19D794000, v4, OS_LOG_TYPE_ERROR, "%25s:%-5d [%s:%d:%s: (%s): error %d", buf, 0x3Cu);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"error %d", v3);
  }
  return outIsPlaying != 0;
}

- (void)stop
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = [(AVMIDIPlayer *)self impl];
  uint64_t v3 = MusicPlayerStop(v2->var1);
  if (v3)
  {
    uint64_t v4 = v3;
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    v5 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316674;
      *(void *)&uint8_t buf[4] = "AVAEInternal.h";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 104;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "AVMIDIPlayer.mm";
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = 303;
      *(_WORD *)&buf[34] = 2080;
      *(void *)&buf[36] = "stop";
      __int16 v9 = 2080;
      int v10 = "MusicPlayerStop(mPlayer)";
      __int16 v11 = 1024;
      int v12 = v4;
      _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d [%s:%d:%s: (%s): error %d", buf, 0x3Cu);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"error %d", v4);
  }
  id var4 = v2->var4;
  if (var4)
  {
    v2->id var4 = 0;
    var5 = v2->var5;
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = ___ZN14MIDIPlayerImpl4stopEv_block_invoke;
    *(void *)&buf[24] = &unk_1E5965A18;
    *(void *)&buf[32] = var4;
    dispatch_async(var5, buf);
  }
}

- (void)play:(AVMIDIPlayerCompletionHandler)completionHandler
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(AVMIDIPlayer *)self impl];
  v4->id var4 = _Block_copy(completionHandler);
  uint64_t v5 = MusicPlayerStart(v4->var1);
  if (v5)
  {
    uint64_t v6 = v5;
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    uint64_t v7 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316674;
      __int16 v9 = "AVAEInternal.h";
      __int16 v10 = 1024;
      int v11 = 104;
      __int16 v12 = 2080;
      uint64_t v13 = "AVMIDIPlayer.mm";
      __int16 v14 = 1024;
      int v15 = 298;
      __int16 v16 = 2080;
      __int16 v17 = "start";
      __int16 v18 = 2080;
      __int16 v19 = "MusicPlayerStart(mPlayer)";
      __int16 v20 = 1024;
      int v21 = v6;
      _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d [%s:%d:%s: (%s): error %d", buf, 0x3Cu);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"error %d", v6);
  }
}

- (void)prepareToPlay
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = MusicPlayerPreroll((MusicPlayer)[(AVMIDIPlayer *)self impl][8]);
  if (v2)
  {
    uint64_t v3 = v2;
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    uint64_t v4 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316674;
      uint64_t v6 = "AVAEInternal.h";
      __int16 v7 = 1024;
      int v8 = 104;
      __int16 v9 = 2080;
      __int16 v10 = "AVMIDIPlayer.mm";
      __int16 v11 = 1024;
      int v12 = 137;
      __int16 v13 = 2080;
      __int16 v14 = "-[AVMIDIPlayer prepareToPlay]";
      __int16 v15 = 2080;
      __int16 v16 = "MusicPlayerPreroll(impl->mPlayer)";
      __int16 v17 = 1024;
      int v18 = v3;
      _os_log_impl(&dword_19D794000, v4, OS_LOG_TYPE_ERROR, "%25s:%-5d [%s:%d:%s: (%s): error %d", buf, 0x3Cu);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"error %d", v3);
  }
}

- (double)beatsForHostTime:(unint64_t)a3
{
  MusicTimeStamp outBeats = 0.0;
  BeatsForHostuint64_t Time = MusicPlayerGetBeatsForHostTime((MusicPlayer)[(AVMIDIPlayer *)self impl][8], a3, &outBeats);
  double result = outBeats;
  if (BeatsForHostTime) {
    return 0.0;
  }
  return result;
}

- (unint64_t)hostTimeForBeats:(double)a3
{
  outHostuint64_t Time = 0;
  if (MusicPlayerGetHostTimeForBeats((MusicPlayer)[(AVMIDIPlayer *)self impl][8], a3, &outHostTime)) {
    return 0;
  }
  else {
    return outHostTime;
  }
}

- (AVMIDIPlayer)initWithData:(NSData *)data soundBankURL:(NSURL *)bankURL error:(NSError *)outError
{
  int v8 = [(AVMIDIPlayer *)self initBase];
  __int16 v9 = v8;
  if (v8)
  {
    if (!data)
    {
LABEL_9:
      int v12 = v9;
      return 0;
    }
    if (outError) {
      *outError = 0;
    }
    __int16 v10 = [(AVMIDIPlayer *)v8 impl];
    OSStatus v11 = MusicSequenceFileLoadData(v10->var2, (CFDataRef)data, kMusicSequenceFile_AnyType, 1u);
    if (v11 || (OSStatus v11 = MIDIPlayerImpl::finishLoad(v10, bankURL)) != 0)
    {
      if (outError) {
        *outError = (NSError *)[MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.coreaudio.avfaudio" code:v11 userInfo:0];
      }
      goto LABEL_9;
    }
  }
  return v9;
}

- (AVMIDIPlayer)initWithContentsOfURL:(NSURL *)inURL soundBankURL:(NSURL *)bankURL error:(NSError *)outError
{
  int v8 = [(AVMIDIPlayer *)self initBase];
  __int16 v9 = v8;
  if (v8)
  {
    if (!inURL)
    {
LABEL_9:
      int v12 = v9;
      return 0;
    }
    if (outError) {
      *outError = 0;
    }
    uint64_t v10 = [(AVMIDIPlayer *)v8 impl];
    *(void *)(v10 + 24) = 0;
    OSStatus v11 = MusicSequenceFileLoad(*(MusicSequence *)(v10 + 16), (CFURLRef)inURL, kMusicSequenceFile_AnyType, 1u);
    if (v11 || (OSStatus v11 = MIDIPlayerImpl::finishLoad((MIDIPlayerImpl *)v10, bankURL)) != 0)
    {
      if (outError) {
        *outError = (NSError *)[MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.coreaudio.avfaudio" code:v11 userInfo:0];
      }
      goto LABEL_9;
    }
  }
  return v9;
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (kAVMPScope)
  {
    uint64_t v3 = *(NSObject **)kAVMPScope;
    if (!*(void *)kAVMPScope) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v3 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v6 = "AVMIDIPlayer.mm";
    __int16 v7 = 1024;
    int v8 = 73;
    __int16 v9 = 2048;
    uint64_t v10 = self;
    _os_log_impl(&dword_19D794000, v3, OS_LOG_TYPE_DEBUG, "%25s:%-5d ---> self = %p", buf, 0x1Cu);
  }
LABEL_7:
  [(AVMIDIPlayer *)self destroyBase];
  v4.receiver = self;
  v4.super_class = (Class)AVMIDIPlayer;
  [(AVMIDIPlayer *)&v4 dealloc];
}

- (void)finalize
{
  [(AVMIDIPlayer *)self destroyBase];
  v3.receiver = self;
  v3.super_class = (Class)AVMIDIPlayer;
  [(AVMIDIPlayer *)&v3 finalize];
}

- (void)destroyBase
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(AVMIDIPlayer *)self impl];
  if (v2)
  {
    objc_super v3 = v2;
    if (kAVMPScope)
    {
      objc_super v4 = *(NSObject **)kAVMPScope;
      if (!*(void *)kAVMPScope) {
        goto LABEL_9;
      }
    }
    else
    {
      objc_super v4 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int v8 = 136315650;
      __int16 v9 = "AVMIDIPlayer.mm";
      __int16 v10 = 1024;
      int v11 = 268;
      __int16 v12 = 2048;
      __int16 v13 = v3;
      _os_log_impl(&dword_19D794000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d ---> this = %p", (uint8_t *)&v8, 0x1Cu);
    }
LABEL_9:
    var5 = v3->var5;
    if (var5) {
      dispatch_release(var5);
    }
    var1 = v3->var1;
    if (var1) {
      DisposeMusicPlayer(var1);
    }
    var2 = v3->var2;
    if (var2) {
      DisposeMusicSequence(var2);
    }
    if (v3->var0) {
      DisposeAUGraph(v3->var0);
    }
    JUMPOUT(0x19F3ABB30);
  }
}

- (id)initBase
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)AVMIDIPlayer;
  if ([(AVMIDIPlayer *)&v3 init])
  {
    if (-[AVMIDIPlayer(AVMIDIPlayerPriv) initBase]::once != -1) {
      dispatch_once(&-[AVMIDIPlayer(AVMIDIPlayerPriv) initBase]::once, &__block_literal_global_3089);
    }
    operator new();
  }
  return 0;
}

void __42__AVMIDIPlayer_AVMIDIPlayerPriv__initBase__block_invoke()
{
}

- (MIDIPlayerImpl)impl
{
  return (MIDIPlayerImpl *)self->_impl;
}

@end