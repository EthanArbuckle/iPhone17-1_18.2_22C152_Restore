@interface AVMusicTrack
- (AVAudioUnit)destinationAudioUnit;
- (AVBeatRange)loopRange;
- (AVMusicTimeStamp)lengthInBeats;
- (AVMusicTimeStamp)offsetTime;
- (AVMusicTrack)initWithImpl:(MusicTrackImpl *)a3;
- (BOOL)isLoopingEnabled;
- (BOOL)isMuted;
- (BOOL)isSoloed;
- (BOOL)usesAutomatedParameters;
- (MIDIEndpointRef)destinationMIDIEndpoint;
- (NSInteger)numberOfLoops;
- (NSTimeInterval)lengthInSeconds;
- (NSUInteger)timeResolution;
- (OpaqueMusicTrack)track;
- (id)createEventIterator;
- (unint64_t)index;
- (void)addEvent:(AVMusicEvent *)event atBeat:(AVMusicTimeStamp)beat;
- (void)clearEventsInRange:(AVBeatRange)range;
- (void)copyAndMergeEventsInRange:(AVBeatRange)range fromTrack:(AVMusicTrack *)sourceTrack mergeAtBeat:(AVMusicTimeStamp)mergeStartBeat;
- (void)copyEventsInRange:(AVBeatRange)range fromTrack:(AVMusicTrack *)sourceTrack insertAtBeat:(AVMusicTimeStamp)insertStartBeat;
- (void)cutEventsInRange:(AVBeatRange)range;
- (void)dealloc;
- (void)doAddAUPresetEvent:(id)a3 atBeat:(double)a4;
- (void)doAddExtendedNoteOnEvent:(id)a3 atBeat:(double)a4;
- (void)doAddExtendedTempoEvent:(id)a3 atBeat:(double)a4;
- (void)doAddMIDIChannelEvent:(id)a3 atBeat:(double)a4;
- (void)doAddMIDIMetaEvent:(id)a3 atBeat:(double)a4;
- (void)doAddMIDINoteEvent:(id)a3 atBeat:(double)a4;
- (void)doAddMIDISysexEvent:(id)a3 atBeat:(double)a4;
- (void)doAddParameterEvent:(id)a3 atBeat:(double)a4;
- (void)doAddUserEvent:(id)a3 atBeat:(double)a4;
- (void)enumerateEventsInRange:(AVBeatRange)range usingBlock:(AVMusicEventEnumerationBlock)block;
- (void)moveEventsInRange:(AVBeatRange)range byAmount:(AVMusicTimeStamp)beatAmount;
- (void)setDestinationAudioUnit:(AVAudioUnit *)destinationAudioUnit;
- (void)setDestinationMIDIEndpoint:(MIDIEndpointRef)destinationMIDIEndpoint;
- (void)setLengthInBeats:(AVMusicTimeStamp)lengthInBeats;
- (void)setLengthInSeconds:(NSTimeInterval)lengthInSeconds;
- (void)setLoopRange:(AVBeatRange)loopRange;
- (void)setLoopingEnabled:(BOOL)loopingEnabled;
- (void)setMuted:(BOOL)muted;
- (void)setNumberOfLoops:(NSInteger)numberOfLoops;
- (void)setOffsetTime:(AVMusicTimeStamp)offsetTime;
- (void)setSoloed:(BOOL)soloed;
- (void)setUsesAutomatedParameters:(BOOL)usesAutomatedParameters;
@end

@implementation AVMusicTrack

- (NSUInteger)timeResolution
{
  impl = (MusicTrack *)self->_impl;
  __int16 outData = 0;
  UInt32 ioLength = 2;
  uint64_t Property = MusicTrackGetProperty(*impl, 6u, &outData, &ioLength);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 579, (uint64_t)"GetTimeResolution", (uint64_t)"MusicTrackGetProperty(mTrack, kSequenceTrackProperty_TimeResolution, &timeRes, &pLen)", Property, 0);
  return outData;
}

- (void)setLengthInSeconds:(NSTimeInterval)lengthInSeconds
{
  impl = (MusicTrack *)self->_impl;
  MusicTimeStamp v7 = 0.0;
  outuint64_t Sequence = 0;
  uint64_t Sequence = MusicTrackGetSequence(*impl, &outSequence);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 401, (uint64_t)"SetLengthInSeconds", (uint64_t)"MusicTrackGetSequence(mTrack, &seq)", Sequence, 0);
  uint64_t BeatsForSeconds = MusicSequenceGetBeatsForSeconds(outSequence, lengthInSeconds, &v7);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 402, (uint64_t)"SetLengthInSeconds", (uint64_t)"MusicSequenceGetBeatsForSeconds(seq, inLength, &beatLength)", BeatsForSeconds, 0);
  MusicTrackImpl::DoSetLengthInBeats((MusicTrackImpl *)*impl, v7);
}

- (NSTimeInterval)lengthInSeconds
{
  impl = (MusicTrack *)self->_impl;
  double v8 = 0.0;
  outuint64_t Sequence = 0;
  uint64_t Sequence = MusicTrackGetSequence(*impl, &outSequence);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 410, (uint64_t)"GetLengthInSeconds", (uint64_t)"MusicTrackGetSequence(mTrack, &seq)", Sequence, 0);
  v4 = outSequence;
  double LengthInBeats = MusicTrackImpl::DoGetLengthInBeats((MusicTrackImpl *)*impl);
  uint64_t SecondsForBeats = MusicSequenceGetSecondsForBeats(v4, LengthInBeats, &v8);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 411, (uint64_t)"GetLengthInSeconds", (uint64_t)"MusicSequenceGetSecondsForBeats(seq, DoGetLengthInBeats(), &seconds)", SecondsForBeats, 0);
  return v8;
}

- (void)setLengthInBeats:(AVMusicTimeStamp)lengthInBeats
{
}

- (AVMusicTimeStamp)lengthInBeats
{
  return MusicTrackImpl::DoGetLengthInBeats(*(MusicTrackImpl **)self->_impl);
}

- (void)setUsesAutomatedParameters:(BOOL)usesAutomatedParameters
{
}

- (BOOL)usesAutomatedParameters
{
  return MusicTrackImpl::UsesAutomatedParams(*(MusicTrackImpl **)self->_impl);
}

- (void)setSoloed:(BOOL)soloed
{
  impl = (MusicTrack *)self->_impl;
  BOOL inData = soloed;
  uint64_t v4 = MusicTrackSetProperty(*impl, 3u, &inData, 1u);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 549, (uint64_t)"Solo", (uint64_t)"MusicTrackSetProperty(mTrack, kSequenceTrackProperty_SoloStatus, &soloStatus, pLen)", v4, 0);
}

- (BOOL)isSoloed
{
  impl = (MusicTrack *)self->_impl;
  char outData = 0;
  UInt32 ioLength = 1;
  uint64_t Property = MusicTrackGetProperty(*impl, 3u, &outData, &ioLength);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 556, (uint64_t)"IsSoloed", (uint64_t)"MusicTrackGetProperty(mTrack, kSequenceTrackProperty_SoloStatus, &soloStatus, &pLen)", Property, 0);
  return outData != 0;
}

- (void)setMuted:(BOOL)muted
{
  impl = (MusicTrack *)self->_impl;
  BOOL inData = muted;
  uint64_t v4 = MusicTrackSetProperty(*impl, 2u, &inData, 1u);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 534, (uint64_t)"Mute", (uint64_t)"MusicTrackSetProperty(mTrack, kSequenceTrackProperty_MuteStatus, &muteStatus, pLen)", v4, 0);
}

- (BOOL)isMuted
{
  impl = (MusicTrack *)self->_impl;
  char outData = 0;
  UInt32 ioLength = 1;
  uint64_t Property = MusicTrackGetProperty(*impl, 2u, &outData, &ioLength);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 541, (uint64_t)"IsMuted", (uint64_t)"MusicTrackGetProperty(mTrack, kSequenceTrackProperty_MuteStatus, &muteStatus, &pLen)", Property, 0);
  return outData != 0;
}

- (void)setOffsetTime:(AVMusicTimeStamp)offsetTime
{
  impl = (MusicTrack *)self->_impl;
  AVMusicTimeStamp inData = offsetTime;
  uint64_t v4 = MusicTrackSetProperty(*impl, 1u, &inData, 8u);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 417, (uint64_t)"SetOffset", (uint64_t)"MusicTrackSetProperty(mTrack, kSequenceTrackProperty_OffsetTime, &inOffset, sizeof(inOffset))", v4, 0);
}

- (AVMusicTimeStamp)offsetTime
{
  impl = (MusicTrack *)self->_impl;
  double outData = 0.0;
  UInt32 ioLength = 8;
  uint64_t Property = MusicTrackGetProperty(*impl, 1u, &outData, &ioLength);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 424, (uint64_t)"GetOffset", (uint64_t)"MusicTrackGetProperty(mTrack, kSequenceTrackProperty_OffsetTime, &offset, &pLen)", Property, 0);
  return outData;
}

- (void)setNumberOfLoops:(NSInteger)numberOfLoops
{
  int v3 = numberOfLoops;
  _AVAE_Check("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencer.mm", 389, "-[AVMusicTrack setNumberOfLoops:]", "numberOfLoops != 0", numberOfLoops != 0);
  impl = self->_impl;
  if (v3 == -1) {
    int v6 = 0;
  }
  else {
    int v6 = v3;
  }
  impl[5] = v6;
  if (*((unsigned char *)impl + 16))
  {
    UInt32 ioLength = 24;
    uint64_t Property = MusicTrackGetProperty(*(MusicTrack *)impl, 7u, outData, &ioLength);
    _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 446, (uint64_t)"SetLoopCount", (uint64_t)"MusicTrackGetProperty(mTrack, kSequenceTrackProperty_LoopRegion, &region, &pLen)", Property, 0);
    int v11 = impl[5];
    uint64_t v8 = MusicTrackSetProperty(*(MusicTrack *)impl, 7u, outData, ioLength);
    _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 448, (uint64_t)"SetLoopCount", (uint64_t)"MusicTrackSetProperty(mTrack, kSequenceTrackProperty_LoopRegion, &region, pLen)", v8, 0);
  }
}

- (NSInteger)numberOfLoops
{
  impl = (MusicTrack *)self->_impl;
  if (*((unsigned char *)impl + 16))
  {
    UInt32 ioLength = 24;
    uint64_t Property = MusicTrackGetProperty(*impl, 7u, outData, &ioLength);
    _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 458, (uint64_t)"GetLoopCount", (uint64_t)"MusicTrackGetProperty(mTrack, kSequenceTrackProperty_LoopRegion, &region, &pLen)", Property, 0);
    int v4 = v8;
  }
  else
  {
    int v4 = *((_DWORD *)impl + 5);
  }
  if (!v4) {
    return -1;
  }
  return v4;
}

- (void)setLoopingEnabled:(BOOL)loopingEnabled
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  impl = self->_impl;
  if (*((unsigned char *)impl + 16) != loopingEnabled)
  {
    BOOL v4 = loopingEnabled;
    UInt32 ioLength = 24;
    uint64_t Property = MusicTrackGetProperty(*(MusicTrack *)impl, 7u, &outData, &ioLength);
    _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 510, (uint64_t)"EnableLooping", (uint64_t)"MusicTrackGetProperty(mTrack, kSequenceTrackProperty_LoopRegion, &region, &pLen)", Property, 0);
    if (v4) {
      int v6 = *((_DWORD *)impl + 5);
    }
    else {
      int v6 = -1;
    }
    int v15 = v6;
    double LengthInBeats = v14;
    if (v14 <= outData) {
      double LengthInBeats = MusicTrackImpl::DoGetLengthInBeats(*(MusicTrackImpl **)impl);
    }
    double v14 = LengthInBeats;
    if (kAVASScope)
    {
      int v8 = *(id *)kAVASScope;
      if (!v8)
      {
LABEL_16:
        uint64_t v11 = MusicTrackSetProperty(*(MusicTrack *)impl, 7u, &outData, ioLength);
        _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 517, (uint64_t)"EnableLooping", (uint64_t)"MusicTrackSetProperty(mTrack, kSequenceTrackProperty_LoopRegion, &region, pLen)", v11, 0);
        *((unsigned char *)impl + 16) = v4;
        return;
      }
    }
    else
    {
      int v8 = MEMORY[0x1E4F14500];
      id v9 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v10 = "dis";
      v17 = "AVAudioSequencerImpl.mm";
      __int16 v18 = 1024;
      *(_DWORD *)buf = 136316162;
      if (v4) {
        v10 = "en";
      }
      int v19 = 516;
      __int16 v20 = 2080;
      v21 = v10;
      __int16 v22 = 2048;
      double v23 = outData;
      __int16 v24 = 2048;
      double v25 = LengthInBeats;
      _os_log_impl(&dword_19D794000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d %sabling looping [%.2f - %.2f]", buf, 0x30u);
    }

    goto LABEL_16;
  }
}

- (BOOL)isLoopingEnabled
{
  impl = (MusicTrack *)self->_impl;
  UInt32 ioLength = 24;
  uint64_t Property = MusicTrackGetProperty(*impl, 7u, outData, &ioLength);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 526, (uint64_t)"IsLoopingEnabled", (uint64_t)"MusicTrackGetProperty(mTrack, kSequenceTrackProperty_LoopRegion, &region, &pLen)", Property, 0);
  return v7 != -1;
}

- (void)setLoopRange:(AVBeatRange)loopRange
{
  double start = loopRange.start;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  impl = (MusicTrack *)self->_impl;
  double v6 = -0.0;
  if (loopRange.length != 1.79769313e308) {
    double v6 = start;
  }
  double v7 = loopRange.length + v6;
  UInt32 ioLength = 24;
  uint64_t Property = MusicTrackGetProperty(*impl, 7u, &outData, &ioLength);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 490, (uint64_t)"SetLoopEnd", (uint64_t)"MusicTrackGetProperty(mTrack, kSequenceTrackProperty_LoopRegion, &region, &pLen)", Property, 0);
  double v19 = v7;
  if (kAVASScope)
  {
    id v9 = *(id *)kAVASScope;
    if (!v9) {
      goto LABEL_10;
    }
  }
  else
  {
    id v9 = MEMORY[0x1E4F14500];
    id v10 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    v21 = "AVAudioSequencerImpl.mm";
    __int16 v22 = 1024;
    int v23 = 493;
    __int16 v24 = 2048;
    double v25 = v7;
    __int16 v26 = 2048;
    double v27 = outData;
    _os_log_impl(&dword_19D794000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d end -> %.2f [start %.2f]", buf, 0x26u);
  }

LABEL_10:
  uint64_t v11 = MusicTrackSetProperty(*impl, 7u, &outData, ioLength);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 494, (uint64_t)"SetLoopEnd", (uint64_t)"MusicTrackSetProperty(mTrack, kSequenceTrackProperty_LoopRegion, &region, pLen)", v11, 0);
  v12 = (MusicTrack *)self->_impl;
  UInt32 ioLength = 24;
  uint64_t v13 = MusicTrackGetProperty(*v12, 7u, &outData, &ioLength);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 471, (uint64_t)"SetLoopStart", (uint64_t)"MusicTrackGetProperty(mTrack, kSequenceTrackProperty_LoopRegion, &region, &pLen)", v13, 0);
  double outData = start;
  if (kAVASScope)
  {
    double v14 = *(id *)kAVASScope;
    if (!v14) {
      goto LABEL_17;
    }
  }
  else
  {
    double v14 = MEMORY[0x1E4F14500];
    id v15 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    v21 = "AVAudioSequencerImpl.mm";
    __int16 v22 = 1024;
    int v23 = 474;
    __int16 v24 = 2048;
    double v25 = start;
    __int16 v26 = 2048;
    double v27 = v19;
    _os_log_impl(&dword_19D794000, v14, OS_LOG_TYPE_DEBUG, "%25s:%-5d start -> %.2f [end %.2f]", buf, 0x26u);
  }

LABEL_17:
  uint64_t v16 = MusicTrackSetProperty(*v12, 7u, &outData, ioLength);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 475, (uint64_t)"SetLoopStart", (uint64_t)"MusicTrackSetProperty(mTrack, kSequenceTrackProperty_LoopRegion, &region, pLen)", v16, 0);
}

- (AVBeatRange)loopRange
{
  double LoopStart = MusicTrackImpl::GetLoopStart(*(MusicTrackImpl **)self->_impl);
  impl = (MusicTrack *)self->_impl;
  UInt32 ioLength = 24;
  uint64_t Property = MusicTrackGetProperty(*impl, 7u, outData, &ioLength);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 501, (uint64_t)"GetLoopEnd", (uint64_t)"MusicTrackGetProperty(mTrack, kSequenceTrackProperty_LoopRegion, &region, &pLen)", Property, 0);
  double v6 = v11;
  double v7 = v6 - MusicTrackImpl::GetLoopStart(*(MusicTrackImpl **)self->_impl);
  double v8 = LoopStart;
  result.length = v7;
  result.double start = v8;
  return result;
}

- (MIDIEndpointRef)destinationMIDIEndpoint
{
  impl = (MusicTrack *)self->_impl;
  MIDIEndpointRef outEndpoint = 0;
  uint64_t DestMIDIEndpoint = MusicTrackGetDestMIDIEndpoint(*impl, &outEndpoint);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 369, (uint64_t)"GetDestinationMIDIEndpoint", (uint64_t)"MusicTrackGetDestMIDIEndpoint(mTrack, &endPoint)", DestMIDIEndpoint, 0);
  return outEndpoint;
}

- (void)setDestinationMIDIEndpoint:(MIDIEndpointRef)destinationMIDIEndpoint
{
  uint64_t v3 = MusicTrackSetDestMIDIEndpoint(*(MusicTrack *)self->_impl, destinationMIDIEndpoint);

  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 361, (uint64_t)"SetDestinationMIDIEndpoint", (uint64_t)"MusicTrackSetDestMIDIEndpoint(mTrack, inEndPoint)", v3, 0);
}

- (AVAudioUnit)destinationAudioUnit
{
  return (AVAudioUnit *)*((id *)self->_impl + 1);
}

- (void)setDestinationAudioUnit:(AVAudioUnit *)destinationAudioUnit
{
  impl = (id *)self->_impl;
  v5 = destinationAudioUnit;
  double v6 = v5;
  if (impl[1] != v5)
  {
    if (v5) {
      [(AVAudioUnit *)v5 audioComponentDescription];
    }
    [(AVAudioUnit *)v6 audioUnit];
    uint64_t v7 = MusicTrackSetDestinationAU();
    _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 348, (uint64_t)"SetDestinationAudioUnit", (uint64_t)"MusicTrackSetDestinationAU(mTrack, inUnit.audioUnit, &desc)", v7, 0);
    objc_storeStrong(impl + 1, destinationAudioUnit);
  }
}

- (OpaqueMusicTrack)track
{
  return *(OpaqueMusicTrack **)self->_impl;
}

- (unint64_t)index
{
  impl = (MusicTrack *)self->_impl;
  outuint64_t Sequence = 0;
  outuint64_t TrackIndex = 0;
  uint64_t Sequence = MusicTrackGetSequence(*impl, &outSequence);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 587, (uint64_t)"GetIndex", (uint64_t)"MusicTrackGetSequence(mTrack, &sequence)", Sequence, 0);
  uint64_t TrackIndex = MusicSequenceGetTrackIndex(outSequence, *impl, &outTrackIndex);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 588, (uint64_t)"GetIndex", (uint64_t)"MusicSequenceGetTrackIndex(sequence, mTrack, &index)", TrackIndex, 0);
  return outTrackIndex;
}

- (void)dealloc
{
  impl = (MusicTrackImpl *)self->_impl;
  if (impl)
  {
    MusicTrackImpl::~MusicTrackImpl(impl);
    MEMORY[0x19F3ABB30]();
  }
  v4.receiver = self;
  v4.super_class = (Class)AVMusicTrack;
  [(AVMusicTrack *)&v4 dealloc];
}

- (AVMusicTrack)initWithImpl:(MusicTrackImpl *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AVMusicTrack;
  objc_super v4 = [(AVMusicTrack *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_impl = a3;
  }
  else if (a3)
  {
    MusicTrackImpl::~MusicTrackImpl(a3);
    MEMORY[0x19F3ABB30]();
  }
  return v5;
}

- (id)createEventIterator
{
  v2 = [AVMusicTrackEventIterator alloc];
  operator new();
}

- (void)enumerateEventsInRange:(AVBeatRange)range usingBlock:(AVMusicEventEnumerationBlock)block
{
  double length = range.length;
  double start = range.start;
  double v8 = block;
  id v9 = [(AVMusicTrack *)self createEventIterator];
  id v10 = v9;
  if (length == 1.79769313e308) {
    double v11 = -0.0;
  }
  else {
    double v11 = start;
  }
  [v9 seek:start];
  double v12 = length + v11;
  while ([v10 hasCurrentEvent])
  {
    double v37 = 0.0;
    unsigned int v36 = 0;
    *(void *)&__n[1] = 0;
    __n[0] = 0;
    [v10 getEventInfo:&v37 outEventType:&v36 eventData:&__n[1] dataSize:__n];
    if (v37 > v12) {
      break;
    }
    uint64_t v13 = 0;
    switch(v36)
    {
      case 0u:
        double v14 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", v37);
        [v14 handleFailureInMethod:a2 object:self file:@"AVAudioSequencer.mm" lineNumber:598 description:@"Should never get a NULL event type"];

        goto LABEL_16;
      case 1u:
        id v15 = [AVExtendedNoteOnEvent alloc];
        uint64_t v16 = [(AVExtendedNoteOnEvent *)v15 initWithNoteOnEvent:*(void *)&__n[1]];
        goto LABEL_20;
      case 3u:
        v17 = [AVExtendedTempoEvent alloc];
        uint64_t v16 = [(AVExtendedTempoEvent *)v17 initWithTempo:**(double **)&__n[1]];
        goto LABEL_20;
      case 4u:
        __int16 v18 = [AVMusicUserEvent alloc];
        uint64_t v16 = [(AVMusicUserEvent *)v18 initWithUserData:*(void *)&__n[1]];
        goto LABEL_20;
      case 5u:
        double v19 = [AVMIDIMetaEvent alloc];
        uint64_t v16 = [(AVMIDIMetaEvent *)v19 initWithMetaEvent:*(void *)&__n[1]];
        goto LABEL_20;
      case 6u:
        __int16 v20 = [AVMIDINoteEvent alloc];
        uint64_t v16 = [(AVMIDINoteEvent *)v20 initWithMessage:*(void *)&__n[1]];
        goto LABEL_20;
      case 7u:
        unsigned int v21 = (**(unsigned char **)&__n[1] & 0xF0) - 160;
        if (v21 >= 0x50)
        {
LABEL_16:
          uint64_t v13 = 0;
        }
        else
        {
          uint64_t v16 = [objc_alloc(*off_1E59659C0[v21 >> 4]) initWithMessage:*(void *)&__n[1]];
LABEL_20:
          uint64_t v13 = (void *)v16;
        }
LABEL_21:
        double v34 = v37;
        char v33 = 0;
        v8[2](v8, v13, &v34, &v33);
        if (v33)
        {
          [v10 deleteEvent];
        }
        else
        {
          double v25 = v34;
          if (v34 != v37) {
            [v10 setEventTime:v34];
          }
          uint64_t v32 = 0;
          switch(v36)
          {
            case 1u:
            case 9u:
              uint64_t v31 = objc_msgSend(v13, "event", v25);
              goto LABEL_29;
            case 3u:
              objc_msgSend(v13, "tempo", v25);
              uint64_t v32 = v26;
              double v27 = *(const void **)&__n[1];
              size_t v28 = __n[0];
              v29 = &v32;
              v30 = &v32;
              goto LABEL_30;
            case 6u:
            case 7u:
              uint64_t v31 = objc_msgSend(v13, "message", v25);
LABEL_29:
              v29 = (uint64_t *)v31;
              double v27 = *(const void **)&__n[1];
              size_t v28 = __n[0];
              v30 = v29;
LABEL_30:
              if (memcmp(v27, v30, v28)) {
                [v10 setEventInfo:v36 data:v29];
              }
              break;
            case 0xAu:
              objc_msgSend(v13, "event", v25);
              break;
            default:
              break;
          }
          objc_msgSend(v10, "nextEvent", v25);
        }

        break;
      case 8u:
        __int16 v22 = [AVMIDISysexEvent alloc];
        uint64_t v16 = [(AVMIDISysexEvent *)v22 initWithMIDIRawData:*(void *)&__n[1]];
        goto LABEL_20;
      case 9u:
        int v23 = [AVParameterEvent alloc];
        uint64_t v16 = [(AVParameterEvent *)v23 initWithParameterEvent:*(void *)&__n[1]];
        goto LABEL_20;
      case 0xAu:
        __int16 v24 = [AVAUPresetEvent alloc];
        uint64_t v16 = [(AVAUPresetEvent *)v24 initWithAUPresetEvent:*(void *)&__n[1]];
        goto LABEL_20;
      default:
        goto LABEL_21;
    }
  }
}

- (void)copyAndMergeEventsInRange:(AVBeatRange)range fromTrack:(AVMusicTrack *)sourceTrack mergeAtBeat:(AVMusicTimeStamp)mergeStartBeat
{
  double length = range.length;
  double start = range.start;
  id v9 = sourceTrack;
  impl = (MusicTrack *)self->_impl;
  double v14 = v9;
  double v11 = [(AVMusicTrack *)v9 track];
  double v12 = -0.0;
  if (length != 1.79769313e308) {
    double v12 = start;
  }
  uint64_t v13 = MusicTrackMerge(v11, start, length + v12, *impl, mergeStartBeat);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 630, (uint64_t)"CopyMergeEvents", (uint64_t)"MusicTrackMerge(inSourceTrack, inSourceStartBeat, inSourceEndBeat, mTrack, inInsertBeat)", v13, 0);
}

- (void)copyEventsInRange:(AVBeatRange)range fromTrack:(AVMusicTrack *)sourceTrack insertAtBeat:(AVMusicTimeStamp)insertStartBeat
{
  double length = range.length;
  double start = range.start;
  id v9 = sourceTrack;
  impl = (MusicTrack *)self->_impl;
  double v14 = v9;
  double v11 = [(AVMusicTrack *)v9 track];
  double v12 = -0.0;
  if (length != 1.79769313e308) {
    double v12 = start;
  }
  uint64_t v13 = MusicTrackCopyInsert(v11, start, length + v12, *impl, insertStartBeat);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 618, (uint64_t)"CopyInsertEvents", (uint64_t)"MusicTrackCopyInsert(inSourceTrack, inSourceStartBeat, inSourceEndBeat, mTrack, inInsertBeat)", v13, 0);
}

- (void)cutEventsInRange:(AVBeatRange)range
{
  double start = -0.0;
  if (range.length != 1.79769313e308) {
    double start = range.start;
  }
  uint64_t v4 = MusicTrackCut(*(MusicTrack *)self->_impl, range.start, range.length + start);

  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 606, (uint64_t)"CutEvents", (uint64_t)"MusicTrackCut(mTrack, inStartBeat, inEndBeat)", v4, 0);
}

- (void)clearEventsInRange:(AVBeatRange)range
{
  double start = -0.0;
  if (range.length != 1.79769313e308) {
    double start = range.start;
  }
  uint64_t v4 = MusicTrackClear(*(MusicTrack *)self->_impl, range.start, range.length + start);

  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 601, (uint64_t)"ClearEvents", (uint64_t)"MusicTrackClear(mTrack, inStartBeat, inEndBeat)", v4, 0);
}

- (void)moveEventsInRange:(AVBeatRange)range byAmount:(AVMusicTimeStamp)beatAmount
{
  double start = -0.0;
  if (range.length != 1.79769313e308) {
    double start = range.start;
  }
  uint64_t v5 = MusicTrackMoveEvents(*(MusicTrack *)self->_impl, range.start, range.length + start, beatAmount);

  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 596, (uint64_t)"MoveEvents", (uint64_t)"MusicTrackMoveEvents(mTrack, inStartBeat, inEndBeat, inToBeat)", v5, 0);
}

- (void)addEvent:(AVMusicEvent *)event atBeat:(AVMusicTimeStamp)beat
{
  double v6 = event;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(AVMusicTrack *)self doAddMIDINoteEvent:v6 atBeat:beat];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(AVMusicTrack *)self doAddMIDIChannelEvent:v6 atBeat:beat];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(AVMusicTrack *)self doAddMIDISysexEvent:v6 atBeat:beat];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [(AVMusicTrack *)self doAddMIDIMetaEvent:v6 atBeat:beat];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [(AVMusicTrack *)self doAddUserEvent:v6 atBeat:beat];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [(AVMusicTrack *)self doAddExtendedNoteOnEvent:v6 atBeat:beat];
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [(AVMusicTrack *)self doAddParameterEvent:v6 atBeat:beat];
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  [(AVMusicTrack *)self doAddAUPresetEvent:v6 atBeat:beat];
                }
                else
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass()) {
                    [(AVMusicTrack *)self doAddExtendedTempoEvent:v6 atBeat:beat];
                  }
                  else {
                    [MEMORY[0x1E4F1CA00] raise:@"com.apple.coreaudio.avfaudio" format:@"AVMusicEvent was not of any known class"];
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

- (void)doAddAUPresetEvent:(id)a3 atBeat:(double)a4
{
  id v7 = a3;
  uint64_t v6 = MusicTrackNewAUPresetEvent(*(MusicTrack *)self->_impl, a4, (const AUPresetEvent *)[v7 event]);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 672, (uint64_t)"AddEvent", (uint64_t)"MusicTrackNewAUPresetEvent(mTrack, inTimeStamp, &inEvent)", v6, 0);
}

- (void)doAddUserEvent:(id)a3 atBeat:(double)a4
{
  id v7 = a3;
  uint64_t v6 = MusicTrackNewUserEvent(*(MusicTrack *)self->_impl, a4, (const MusicEventUserData *)[v7 userData]);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 667, (uint64_t)"AddEvent", (uint64_t)"MusicTrackNewUserEvent(mTrack, inTimeStamp, &inEvent)", v6, 0);
}

- (void)doAddMIDIMetaEvent:(id)a3 atBeat:(double)a4
{
  id v7 = a3;
  uint64_t v6 = MusicTrackNewMetaEvent(*(MusicTrack *)self->_impl, a4, (const MIDIMetaEvent *)[v7 metaEvent]);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 662, (uint64_t)"AddEvent", (uint64_t)"MusicTrackNewMetaEvent(mTrack, inTimeStamp, &inEvent)", v6, 0);
}

- (void)doAddExtendedTempoEvent:(id)a3 atBeat:(double)a4
{
  id v6 = a3;
  impl = (MusicTrack *)self->_impl;
  id v10 = v6;
  [v6 tempo];
  uint64_t v9 = MusicTrackNewExtendedTempoEvent(*impl, a4, v8);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 677, (uint64_t)"AddExtendedTempoEvent", (uint64_t)"MusicTrackNewExtendedTempoEvent(mTrack, inTimeStamp, inTempo)", v9, 0);
}

- (void)doAddParameterEvent:(id)a3 atBeat:(double)a4
{
  id v7 = a3;
  uint64_t v6 = MusicTrackNewParameterEvent(*(MusicTrack *)self->_impl, a4, (const ParameterEvent *)[v7 event]);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 657, (uint64_t)"AddEvent", (uint64_t)"MusicTrackNewParameterEvent(mTrack, inTimeStamp, &inEvent)", v6, 0);
}

- (void)doAddExtendedNoteOnEvent:(id)a3 atBeat:(double)a4
{
  id v7 = a3;
  uint64_t v6 = MusicTrackNewExtendedNoteEvent(*(MusicTrack *)self->_impl, a4, (const ExtendedNoteOnEvent *)[v7 event]);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 652, (uint64_t)"AddEvent", (uint64_t)"MusicTrackNewExtendedNoteEvent(mTrack, inTimeStamp, &inEvent)", v6, 0);
}

- (void)doAddMIDISysexEvent:(id)a3 atBeat:(double)a4
{
  id v7 = a3;
  uint64_t v6 = MusicTrackNewMIDIRawDataEvent(*(MusicTrack *)self->_impl, a4, (const MIDIRawData *)[v7 rawData]);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 647, (uint64_t)"AddEvent", (uint64_t)"MusicTrackNewMIDIRawDataEvent(mTrack, inTimeStamp, &inEvent)", v6, 0);
}

- (void)doAddMIDIChannelEvent:(id)a3 atBeat:(double)a4
{
  id v7 = a3;
  uint64_t v6 = MusicTrackNewMIDIChannelEvent(*(MusicTrack *)self->_impl, a4, (const MIDIChannelMessage *)[v7 message]);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 642, (uint64_t)"AddEvent", (uint64_t)"MusicTrackNewMIDIChannelEvent(mTrack, inTimeStamp, &inEvent)", v6, 0);
}

- (void)doAddMIDINoteEvent:(id)a3 atBeat:(double)a4
{
  id v7 = a3;
  uint64_t v6 = MusicTrackNewMIDINoteEvent(*(MusicTrack *)self->_impl, a4, (const MIDINoteMessage *)[v7 message]);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioSequencerImpl.mm", 637, (uint64_t)"AddEvent", (uint64_t)"MusicTrackNewMIDINoteEvent(mTrack, inTimeStamp, &inEvent)", v6, 0);
}

@end