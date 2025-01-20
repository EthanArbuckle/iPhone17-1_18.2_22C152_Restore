@interface AVExtendedNoteOnEvent
- (AVExtendedNoteOnEvent)initWithMIDINote:(float)midiNote velocity:(float)velocity groupID:(UInt32)groupID duration:(AVMusicTimeStamp)duration;
- (AVExtendedNoteOnEvent)initWithMIDINote:(float)midiNote velocity:(float)velocity instrumentID:(UInt32)instrumentID groupID:(UInt32)groupID duration:(AVMusicTimeStamp)duration;
- (AVExtendedNoteOnEvent)initWithNoteOnEvent:(ExtendedNoteOnEvent *)a3;
- (AVMusicTimeStamp)duration;
- (ExtendedNoteOnEvent)event;
- (UInt32)groupID;
- (UInt32)instrumentID;
- (float)midiNote;
- (float)velocity;
- (void)dealloc;
- (void)setDuration:(AVMusicTimeStamp)duration;
- (void)setGroupID:(UInt32)groupID;
- (void)setInstrumentID:(UInt32)instrumentID;
- (void)setMidiNote:(float)midiNote;
- (void)setVelocity:(float)velocity;
@end

@implementation AVExtendedNoteOnEvent

- (ExtendedNoteOnEvent)event
{
  return self->_event;
}

- (void)dealloc
{
  free(self->_event);
  v3.receiver = self;
  v3.super_class = (Class)AVExtendedNoteOnEvent;
  [(AVExtendedNoteOnEvent *)&v3 dealloc];
}

- (AVExtendedNoteOnEvent)initWithNoteOnEvent:(ExtendedNoteOnEvent *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AVExtendedNoteOnEvent;
  v4 = [(AVExtendedNoteOnEvent *)&v8 init];
  if (v4)
  {
    v5 = (ExtendedNoteOnEvent *)malloc_type_malloc(0x20uLL, 0x1000040E0EAB150uLL);
    v4->_event = v5;
    long long v6 = *(_OWORD *)&a3->extendedParams.mPitch;
    *(_OWORD *)&v5->instrumentID = *(_OWORD *)&a3->instrumentID;
    *(_OWORD *)&v5->extendedParams.mPitch = v6;
    v4->_event->extendedParams.argCount = 2;
  }
  return v4;
}

- (void)setDuration:(AVMusicTimeStamp)duration
{
  Float32 v3 = duration;
  self->_event->duration = v3;
}

- (AVMusicTimeStamp)duration
{
  return self->_event->duration;
}

- (void)setGroupID:(UInt32)groupID
{
  self->_event->groupID = groupID;
}

- (UInt32)groupID
{
  return self->_event->groupID;
}

- (void)setInstrumentID:(UInt32)instrumentID
{
  self->_event->instrumentID = instrumentID;
}

- (UInt32)instrumentID
{
  return self->_event->instrumentID;
}

- (void)setVelocity:(float)velocity
{
  self->_event->extendedParams.mVelocity = velocity;
}

- (float)velocity
{
  return self->_event->extendedParams.mVelocity;
}

- (void)setMidiNote:(float)midiNote
{
  self->_event->extendedParams.mPitch = midiNote;
}

- (float)midiNote
{
  return self->_event->extendedParams.mPitch;
}

- (AVExtendedNoteOnEvent)initWithMIDINote:(float)midiNote velocity:(float)velocity groupID:(UInt32)groupID duration:(AVMusicTimeStamp)duration
{
  v14.receiver = self;
  v14.super_class = (Class)AVExtendedNoteOnEvent;
  v10 = [(AVExtendedNoteOnEvent *)&v14 init];
  if (v10)
  {
    v11 = (ExtendedNoteOnEvent *)malloc_type_malloc(0x20uLL, 0x1000040E0EAB150uLL);
    v10->_event = v11;
    v11->instrumentID = -1;
    v11->groupID = groupID;
    Float32 v12 = duration;
    v11->duration = v12;
    v11->extendedParams.argCount = 2;
    v11->extendedParams.mPitch = midiNote;
    v11->extendedParams.mVelocity = velocity;
    v11->extendedParams.mControls[0] = 0;
  }
  return v10;
}

- (AVExtendedNoteOnEvent)initWithMIDINote:(float)midiNote velocity:(float)velocity instrumentID:(UInt32)instrumentID groupID:(UInt32)groupID duration:(AVMusicTimeStamp)duration
{
  v16.receiver = self;
  v16.super_class = (Class)AVExtendedNoteOnEvent;
  Float32 v12 = [(AVExtendedNoteOnEvent *)&v16 init];
  if (v12)
  {
    v13 = (ExtendedNoteOnEvent *)malloc_type_malloc(0x20uLL, 0x1000040E0EAB150uLL);
    v12->_event = v13;
    v13->instrumentID = instrumentID;
    v13->groupID = groupID;
    Float32 v14 = duration;
    v13->duration = v14;
    v13->extendedParams.argCount = 2;
    v13->extendedParams.mPitch = midiNote;
    v13->extendedParams.mVelocity = velocity;
    v13->extendedParams.mControls[0] = 0;
  }
  return v12;
}

@end