@interface AVAudioSequencer
- (AVAudioSequencer)init;
- (AVAudioSequencer)initWithAudioEngine:(AVAudioEngine *)engine;
- (AVAudioSequencer)initWithImpl:(void *)a3;
- (AVMusicTimeStamp)beatsForHostTime:(UInt64)inHostTime error:(NSError *)outError;
- (AVMusicTimeStamp)beatsForSeconds:(NSTimeInterval)seconds;
- (AVMusicTrack)createAndAppendTrack;
- (AVMusicTrack)tempoTrack;
- (BOOL)isPlaying;
- (BOOL)loadFromData:(NSData *)data options:(AVMusicSequenceLoadOptions)options error:(NSError *)outError;
- (BOOL)loadFromURL:(NSURL *)fileURL options:(AVMusicSequenceLoadOptions)options error:(NSError *)outError;
- (BOOL)removeTrack:(AVMusicTrack *)track;
- (BOOL)startAndReturnError:(NSError *)outError;
- (BOOL)writeToURL:(NSURL *)fileURL SMPTEResolution:(NSInteger)resolution replaceExisting:(BOOL)replace error:(NSError *)outError;
- (NSData)dataWithSMPTEResolution:(NSInteger)SMPTEResolution error:(NSError *)outError;
- (NSDictionary)userInfo;
- (NSTimeInterval)currentPositionInBeats;
- (NSTimeInterval)currentPositionInSeconds;
- (NSTimeInterval)secondsForBeats:(AVMusicTimeStamp)beats;
- (UInt64)hostTimeForBeats:(AVMusicTimeStamp)inBeats error:(NSError *)outError;
- (float)rate;
- (id)trackArray;
- (unint64_t)numberOfTracks;
- (void)cleanTracks;
- (void)dealloc;
- (void)prepareToPlay;
- (void)reverseEvents;
- (void)setCurrentPositionInBeats:(NSTimeInterval)currentPositionInBeats;
- (void)setCurrentPositionInSeconds:(NSTimeInterval)currentPositionInSeconds;
- (void)setRate:(float)rate;
- (void)setTempoTrack:(id)a3;
- (void)setTrackArray:(id)a3;
- (void)setUserCallback:(AVAudioSequencerUserCallback)userCallback;
- (void)setupTrackArray;
- (void)setupTracks;
- (void)stop;
@end

@implementation AVAudioSequencer

- (AVMusicTrack)tempoTrack
{
  return (AVMusicTrack *)*((id *)self->_impl + 3);
}

- (void)setTempoTrack:(id)a3
{
}

- (id)trackArray
{
  return *((id *)self->_impl + 2);
}

- (void)setTrackArray:(id)a3
{
}

- (void)setUserCallback:(AVAudioSequencerUserCallback)userCallback
{
  impl = self->_impl;
  v10 = self;
  v6 = _Block_copy(userCallback);
  v7 = (void *)*((void *)impl + 4);
  *((void *)impl + 4) = v6;

  objc_storeStrong((id *)impl + 7, self);
  if (*((void *)impl + 4)) {
    v8 = (void (__cdecl *)(void *, MusicSequence, MusicTrack, MusicTimeStamp, const MusicEventUserData *, MusicTimeStamp, MusicTimeStamp))AVAudioSequencerImpl::UserCallback;
  }
  else {
    v8 = 0;
  }
  uint64_t v9 = MusicSequenceSetUserCallback(*((MusicSequence *)impl + 1), v8, impl);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 310, (uint64_t)"InstallUserCallback", (uint64_t)"MusicSequenceSetUserCallback(mSequence, (mUserCallbackBlock) ? UserCallback : nullptr, this)", v9, 0);
}

- (void)reverseEvents
{
  uint64_t v2 = MusicSequenceReverse(*((MusicSequence *)self->_impl + 1));

  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 274, (uint64_t)"Reverse", (uint64_t)"MusicSequenceReverse(mSequence)", v2, 0);
}

- (AVMusicTimeStamp)beatsForSeconds:(NSTimeInterval)seconds
{
  return AVAudioSequencerImpl::GetBeatsForSeconds(*((AVAudioSequencerImpl **)self->_impl + 1), seconds);
}

- (NSTimeInterval)secondsForBeats:(AVMusicTimeStamp)beats
{
  float v3 = beats;
  return AVAudioSequencerImpl::GetSecondsForBeats(*((AVAudioSequencerImpl **)self->_impl + 1), v3);
}

- (BOOL)removeTrack:(AVMusicTrack *)track
{
  v4 = track;
  uint64_t v5 = [(AVMusicTrack *)v4 index];
  v6 = [(AVAudioSequencer *)self trackArray];
  [v6 removeObjectAtIndex:v5];

  return 1;
}

- (AVMusicTrack)createAndAppendTrack
{
  [(AVAudioSequencer *)self setupTrackArray];
  uint64_t v2 = [AVMusicTrack alloc];
  operator new();
}

- (NSData)dataWithSMPTEResolution:(NSInteger)SMPTEResolution error:(NSError *)outError
{
  CFDataRef outData = 0;
  uint64_t v5 = MusicSequenceFileCreateData(*((MusicSequence *)self->_impl + 1), kMusicSequenceFile_AnyType, 0, SMPTEResolution, &outData);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencer.mm", 231, (uint64_t)"-[AVAudioSequencer dataWithSMPTEResolution:error:]", (uint64_t)"impl->WriteToData(&outData, (SInt32)SMPTEResolution)", v5, outError);
  CFDataRef v6 = outData;

  return (NSData *)v6;
}

- (BOOL)writeToURL:(NSURL *)fileURL SMPTEResolution:(NSInteger)resolution replaceExisting:(BOOL)replace error:(NSError *)outError
{
  MusicSequenceFileFlags v7 = replace;
  SInt16 v8 = resolution;
  v10 = fileURL;
  uint64_t v11 = MusicSequenceFileCreate(*((MusicSequence *)self->_impl + 1), (CFURLRef)v10, kMusicSequenceFile_AnyType, v7, v8);
  LOBYTE(outError) = _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencer.mm", 225, (uint64_t)"-[AVAudioSequencer writeToURL:SMPTEResolution:replaceExisting:error:]", (uint64_t)"impl->WriteToFile((__bridge CFURLRef)fileURL, (SInt32)resolution, replace)", v11, outError);

  return (char)outError;
}

- (BOOL)loadFromData:(NSData *)data options:(AVMusicSequenceLoadOptions)options error:(NSError *)outError
{
  MusicSequenceLoadFlags v6 = options;
  SInt16 v8 = data;
  [(AVAudioSequencer *)self cleanTracks];
  uint64_t v9 = MusicSequenceFileLoadData(*((MusicSequence *)self->_impl + 1), (CFDataRef)v8, kMusicSequenceFile_AnyType, v6);
  BOOL v10 = _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencer.mm", 216, (uint64_t)"-[AVAudioSequencer loadFromData:options:error:]", (uint64_t)"impl->LoadFromData((__bridge CFDataRef)data, (UInt32)options)", v9, outError);
  if (v10) {
    [(AVAudioSequencer *)self setupTracks];
  }

  return v10;
}

- (BOOL)loadFromURL:(NSURL *)fileURL options:(AVMusicSequenceLoadOptions)options error:(NSError *)outError
{
  MusicSequenceLoadFlags v6 = options;
  SInt16 v8 = fileURL;
  [(AVAudioSequencer *)self cleanTracks];
  uint64_t v9 = MusicSequenceFileLoad(*((MusicSequence *)self->_impl + 1), (CFURLRef)v8, kMusicSequenceFile_AnyType, v6);
  BOOL v10 = _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencer.mm", 206, (uint64_t)"-[AVAudioSequencer loadFromURL:options:error:]", (uint64_t)"impl->LoadFromFile((__bridge CFURLRef)fileURL, (UInt32)options)", v9, outError);
  if (v10) {
    [(AVAudioSequencer *)self setupTracks];
  }

  return v10;
}

- (NSDictionary)userInfo
{
  return (NSDictionary *)MusicSequenceGetInfoDictionary(*((MusicSequence *)self->_impl + 1));
}

- (void)setupTracks
{
  [(AVAudioSequencer *)self setupTrackArray];
  if ([(AVAudioSequencer *)self numberOfTracks])
  {
    float v3 = [AVMusicTrack alloc];
    operator new();
  }
  v4 = [AVMusicTrack alloc];
  operator new();
}

- (void)setupTrackArray
{
  float v3 = [(AVAudioSequencer *)self trackArray];

  if (!v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    -[AVAudioSequencer setTrackArray:](self, "setTrackArray:");
  }
}

- (void)cleanTracks
{
  [(AVAudioSequencer *)self setTempoTrack:0];

  [(AVAudioSequencer *)self setTrackArray:0];
}

- (unint64_t)numberOfTracks
{
  impl = (MusicSequence *)self->_impl;
  UInt32 outNumberOfTracks = 0;
  uint64_t TrackCount = MusicSequenceGetTrackCount(impl[1], &outNumberOfTracks);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 173, (uint64_t)"NumberOfTracks", (uint64_t)"MusicSequenceGetTrackCount(mSequence, &trackCount)", TrackCount, 0);
  return outNumberOfTracks;
}

- (void)dealloc
{
  [(AVAudioSequencer *)self cleanTracks];
  impl = (AVAudioSequencerImpl *)self->_impl;
  if (impl) {
    AVAudioSequencerImpl::~AVAudioSequencerImpl(impl);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVAudioSequencer;
  [(AVAudioSequencer *)&v4 dealloc];
}

- (AVAudioSequencer)initWithImpl:(void *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AVAudioSequencer;
  objc_super v4 = [(AVAudioSequencer *)&v7 init];
  if (v4)
  {
    v4->_impl = a3;
    uint64_t v5 = [AVMusicTrack alloc];
    operator new();
  }
  if (a3) {
    AVAudioSequencerImpl::~AVAudioSequencerImpl((AVAudioSequencerImpl *)a3);
  }
  return 0;
}

- (AVAudioSequencer)initWithAudioEngine:(AVAudioEngine *)engine
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  float v3 = engine;
  operator new();
}

- (AVAudioSequencer)init
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  operator new();
}

- (void)stop
{
  impl = self->_impl;
  uint64_t v3 = dispatch_get_global_queue(0, 0);
  uint64_t v4 = impl[6];
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  id v5 = v3;
  operator new();
}

- (BOOL)startAndReturnError:(NSError *)outError
{
  uint64_t v4 = MusicPlayerStart(*(MusicPlayer *)self->_impl);

  return _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencer.mm", 121, (uint64_t)"-[AVAudioSequencer(AVAudioSequencer_Player) startAndReturnError:]", (uint64_t)"impl->Start()", v4, outError);
}

- (void)prepareToPlay
{
  uint64_t v2 = MusicPlayerPreroll(*(MusicPlayer *)self->_impl);

  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencer.mm", 116, (uint64_t)"-[AVAudioSequencer(AVAudioSequencer_Player) prepareToPlay]", (uint64_t)"impl->PrepareToPlay()", v2, 0);
}

- (AVMusicTimeStamp)beatsForHostTime:(UInt64)inHostTime error:(NSError *)outError
{
  MusicTimeStamp outBeats = 0.0;
  uint64_t BeatsForHostTime = MusicPlayerGetBeatsForHostTime(*(MusicPlayer *)self->_impl, inHostTime, &outBeats);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 144, (uint64_t)"BeatsForHostTime", (uint64_t)"MusicPlayerGetBeatsForHostTime(mPlayer, inHostTime, pOutBeats)", BeatsForHostTime, 0);
  return outBeats;
}

- (UInt64)hostTimeForBeats:(AVMusicTimeStamp)inBeats error:(NSError *)outError
{
  UInt64 outHostTime = 0;
  uint64_t HostTimeForBeats = MusicPlayerGetHostTimeForBeats(*(MusicPlayer *)self->_impl, inBeats, &outHostTime);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 139, (uint64_t)"HostTimeForBeats", (uint64_t)"MusicPlayerGetHostTimeForBeats(mPlayer, inBeats, pOutHostTime)", HostTimeForBeats, 0);
  return outHostTime;
}

- (void)setRate:(float)rate
{
  uint64_t v3 = MusicPlayerSetPlayRateScalar(*(MusicPlayer *)self->_impl, rate);

  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 134, (uint64_t)"SetRate", (uint64_t)"MusicPlayerSetPlayRateScalar(mPlayer, inRate)", v3, 0);
}

- (float)rate
{
  impl = (MusicPlayer *)self->_impl;
  Float64 outScaleRate = 0.0;
  uint64_t PlayRateScalar = MusicPlayerGetPlayRateScalar(*impl, &outScaleRate);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 128, (uint64_t)"GetRate", (uint64_t)"MusicPlayerGetPlayRateScalar(mPlayer, &theRate)", PlayRateScalar, 0);
  return outScaleRate;
}

- (BOOL)isPlaying
{
  impl = (MusicPlayer *)self->_impl;
  outuint64_t IsPlaying = 0;
  uint64_t IsPlaying = MusicPlayerIsPlaying(*impl, &outIsPlaying);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 121, (uint64_t)"IsPlaying", (uint64_t)"MusicPlayerIsPlaying(mPlayer, &isPlaying)", IsPlaying, 0);
  return outIsPlaying != 0;
}

- (void)setCurrentPositionInBeats:(NSTimeInterval)currentPositionInBeats
{
  uint64_t v3 = MusicPlayerSetTime(*(MusicPlayer *)self->_impl, currentPositionInBeats);

  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 115, (uint64_t)"SetCurrentPosition", (uint64_t)"MusicPlayerSetTime(mPlayer, currentPosition)", v3, 0);
}

- (NSTimeInterval)currentPositionInBeats
{
  return AVAudioSequencerImpl::CurrentPosition(*(AVAudioSequencerImpl **)self->_impl);
}

- (void)setCurrentPositionInSeconds:(NSTimeInterval)currentPositionInSeconds
{
  float BeatsForSeconds = AVAudioSequencerImpl::GetBeatsForSeconds(*((AVAudioSequencerImpl **)self->_impl + 1), currentPositionInSeconds);
  uint64_t v5 = MusicPlayerSetTime(*(MusicPlayer *)self->_impl, BeatsForSeconds);

  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 115, (uint64_t)"SetCurrentPosition", (uint64_t)"MusicPlayerSetTime(mPlayer, currentPosition)", v5, 0);
}

- (NSTimeInterval)currentPositionInSeconds
{
  float v3 = AVAudioSequencerImpl::CurrentPosition(*(AVAudioSequencerImpl **)self->_impl);
  uint64_t v4 = (AVAudioSequencerImpl *)*((void *)self->_impl + 1);

  return AVAudioSequencerImpl::GetSecondsForBeats(v4, v3);
}

@end