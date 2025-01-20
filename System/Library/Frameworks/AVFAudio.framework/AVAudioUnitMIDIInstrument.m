@interface AVAudioUnitMIDIInstrument
- (AVAudioUnitMIDIInstrument)initWithAudioComponentDescription:(AudioComponentDescription *)description;
- (void)sendController:(uint8_t)controller withValue:(uint8_t)value onChannel:(uint8_t)channel;
- (void)sendMIDIEvent:(uint8_t)midiStatus data1:(uint8_t)data1;
- (void)sendMIDIEvent:(uint8_t)midiStatus data1:(uint8_t)data1 data2:(uint8_t)data2;
- (void)sendMIDIEventList:(const MIDIEventList *)eventList;
- (void)sendMIDISysExEvent:(NSData *)midiData;
- (void)sendPitchBend:(uint16_t)pitchbend onChannel:(uint8_t)channel;
- (void)sendPressure:(uint8_t)pressure onChannel:(uint8_t)channel;
- (void)sendPressureForKey:(uint8_t)key withValue:(uint8_t)value onChannel:(uint8_t)channel;
- (void)sendProgramChange:(uint8_t)program bankMSB:(uint8_t)bankMSB bankLSB:(uint8_t)bankLSB onChannel:(uint8_t)channel;
- (void)sendProgramChange:(uint8_t)program onChannel:(uint8_t)channel;
- (void)startNote:(uint8_t)note withVelocity:(uint8_t)velocity onChannel:(uint8_t)channel;
- (void)stopNote:(uint8_t)note onChannel:(uint8_t)channel;
@end

@implementation AVAudioUnitMIDIInstrument

- (void)sendMIDIEventList:(const MIDIEventList *)eventList
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (*(uint64_t (**)(void *, SEL))(*(void *)self->super.super._impl + 40))(self->super.super._impl, a2);
  if (((*(uint64_t (**)(uint64_t, void, void, const MIDIEventList *))(*(void *)v4 + 144))(v4, 0, 0, eventList) & 1) == 0)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    v5 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136316162;
      v8 = "AVAudioUnitMIDIInstrument.mm";
      __int16 v9 = 1024;
      int v10 = 78;
      __int16 v11 = 2048;
      v12 = eventList;
      __int16 v13 = 1024;
      int v14 = 0;
      __int16 v15 = 1024;
      LODWORD(v16) = 0;
      _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_INFO, "%25s:%-5d Unable to send midi event list %p, offset = %d, cable = %d\n", buf, 0x28u);
      if (AVAudioEngineLogCategory(void)::once != -1) {
        dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
      }
    }
    v6 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v8 = "AVAEInternal.h";
      __int16 v9 = 1024;
      int v10 = 71;
      __int16 v11 = 2080;
      v12 = (const MIDIEventList *)"AVAudioUnitMIDIInstrument.mm";
      __int16 v13 = 1024;
      int v14 = 166;
      __int16 v15 = 2080;
      v16 = "-[AVAudioUnitMIDIInstrument sendMIDIEventList:]";
      __int16 v17 = 2080;
      v18 = "_IMPL->SendMIDIEventList(eventList, 0, 0)";
      _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "_IMPL->SendMIDIEventList(eventList, 0, 0)");
  }
}

- (void)sendMIDISysExEvent:(NSData *)midiData
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  impl = self->super.super._impl;
  CFIndex Length = CFDataGetLength((CFDataRef)midiData);
  BytePtr = CFDataGetBytePtr((CFDataRef)midiData);
  uint64_t v7 = (*(uint64_t (**)(void *))(*(void *)impl + 40))(impl);
  if (((*(uint64_t (**)(uint64_t, uint64_t, void, void, CFIndex, const UInt8 *))(*(void *)v7 + 136))(v7, 1, 0, 0, Length, BytePtr) & 1) == 0)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    v8 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      int v10 = "AVAEInternal.h";
      __int16 v11 = 1024;
      int v12 = 71;
      __int16 v13 = 2080;
      int v14 = "AVAudioUnitMIDIInstrument.mm";
      __int16 v15 = 1024;
      int v16 = 161;
      __int16 v17 = 2080;
      v18 = "-[AVAudioUnitMIDIInstrument sendMIDISysExEvent:]";
      __int16 v19 = 2080;
      v20 = "_IMPL->SendMIDISysexEvent((CFDataRef)midiData)";
      _os_log_impl(&dword_19D794000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "_IMPL->SendMIDISysexEvent((CFDataRef)midiData)");
  }
}

- (void)sendMIDIEvent:(uint8_t)midiStatus data1:(uint8_t)data1
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ((AVAudioUnitMIDIInstrumentImpl::SendMIDIEvent((AVAudioUnitMIDIInstrumentImpl *)self->super.super._impl, midiStatus, data1, 0, 0) & 1) == 0)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    uint64_t v4 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v6 = "AVAEInternal.h";
      __int16 v7 = 1024;
      int v8 = 71;
      __int16 v9 = 2080;
      int v10 = "AVAudioUnitMIDIInstrument.mm";
      __int16 v11 = 1024;
      int v12 = 156;
      __int16 v13 = 2080;
      int v14 = "-[AVAudioUnitMIDIInstrument sendMIDIEvent:data1:]";
      __int16 v15 = 2080;
      int v16 = "_IMPL->SendMIDIEvent(midiStatus, data1, 0, 0, 0)";
      _os_log_impl(&dword_19D794000, v4, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "_IMPL->SendMIDIEvent(midiStatus, data1, 0, 0, 0)");
  }
}

- (void)sendMIDIEvent:(uint8_t)midiStatus data1:(uint8_t)data1 data2:(uint8_t)data2
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ((AVAudioUnitMIDIInstrumentImpl::SendMIDIEvent((AVAudioUnitMIDIInstrumentImpl *)self->super.super._impl, midiStatus, data1, data2, 0) & 1) == 0)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    v5 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      __int16 v7 = "AVAEInternal.h";
      __int16 v8 = 1024;
      int v9 = 71;
      __int16 v10 = 2080;
      __int16 v11 = "AVAudioUnitMIDIInstrument.mm";
      __int16 v12 = 1024;
      int v13 = 151;
      __int16 v14 = 2080;
      __int16 v15 = "-[AVAudioUnitMIDIInstrument sendMIDIEvent:data1:data2:]";
      __int16 v16 = 2080;
      uint64_t v17 = "_IMPL->SendMIDIEvent(midiStatus, data1, data2, 0, 0)";
      _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "_IMPL->SendMIDIEvent(midiStatus, data1, data2, 0, 0)");
  }
}

- (void)sendProgramChange:(uint8_t)program bankMSB:(uint8_t)bankMSB bankLSB:(uint8_t)bankLSB onChannel:(uint8_t)channel
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (((*(uint64_t (**)(void *, void, void, void, void))(*(void *)self->super.super._impl + 464))(self->super.super._impl, program, bankMSB, bankLSB, channel) & 1) == 0)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    v6 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      __int16 v8 = "AVAEInternal.h";
      __int16 v9 = 1024;
      int v10 = 71;
      __int16 v11 = 2080;
      __int16 v12 = "AVAudioUnitMIDIInstrument.mm";
      __int16 v13 = 1024;
      int v14 = 146;
      __int16 v15 = 2080;
      __int16 v16 = "-[AVAudioUnitMIDIInstrument sendProgramChange:bankMSB:bankLSB:onChannel:]";
      __int16 v17 = 2080;
      uint64_t v18 = "_IMPL->SendProgramChange(program, bankMSB, bankLSB, channel)";
      _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "_IMPL->SendProgramChange(program, bankMSB, bankLSB, channel)");
  }
}

- (void)sendProgramChange:(uint8_t)program onChannel:(uint8_t)channel
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ((AVAudioUnitMIDIInstrumentImpl::SendMIDIEvent((AVAudioUnitMIDIInstrumentImpl *)self->super.super._impl, 192, program, 0, channel) & 1) == 0)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    uint64_t v4 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v6 = "AVAEInternal.h";
      __int16 v7 = 1024;
      int v8 = 71;
      __int16 v9 = 2080;
      int v10 = "AVAudioUnitMIDIInstrument.mm";
      __int16 v11 = 1024;
      int v12 = 140;
      __int16 v13 = 2080;
      int v14 = "-[AVAudioUnitMIDIInstrument sendProgramChange:onChannel:]";
      __int16 v15 = 2080;
      __int16 v16 = "_IMPL->SendMIDIEvent(kMIDIMessage_PatchChange, program, 0, 0, channel)";
      _os_log_impl(&dword_19D794000, v4, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "_IMPL->SendMIDIEvent(kMIDIMessage_PatchChange, program, 0, 0, channel)");
  }
}

- (void)sendPressureForKey:(uint8_t)key withValue:(uint8_t)value onChannel:(uint8_t)channel
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ((AVAudioUnitMIDIInstrumentImpl::SendMIDIEvent((AVAudioUnitMIDIInstrumentImpl *)self->super.super._impl, 160, key, (float)((float)((float)value * 127.0) + 0.5), channel) & 1) == 0)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    v5 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      __int16 v7 = "AVAEInternal.h";
      __int16 v8 = 1024;
      int v9 = 71;
      __int16 v10 = 2080;
      __int16 v11 = "AVAudioUnitMIDIInstrument.mm";
      __int16 v12 = 1024;
      int v13 = 134;
      __int16 v14 = 2080;
      __int16 v15 = "-[AVAudioUnitMIDIInstrument sendPressureForKey:withValue:onChannel:]";
      __int16 v16 = 2080;
      uint64_t v17 = "_IMPL->SendMIDIEvent(kMIDIMessage_KeyPressure, key, pressureValue, 0, channel)";
      _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "_IMPL->SendMIDIEvent(kMIDIMessage_KeyPressure, key, pressureValue, 0, channel)");
  }
}

- (void)sendPressure:(uint8_t)pressure onChannel:(uint8_t)channel
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ((AVAudioUnitMIDIInstrumentImpl::SendMIDIEvent((AVAudioUnitMIDIInstrumentImpl *)self->super.super._impl, 208, pressure, 0, channel) & 1) == 0)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    uint64_t v4 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v6 = "AVAEInternal.h";
      __int16 v7 = 1024;
      int v8 = 71;
      __int16 v9 = 2080;
      __int16 v10 = "AVAudioUnitMIDIInstrument.mm";
      __int16 v11 = 1024;
      int v12 = 128;
      __int16 v13 = 2080;
      __int16 v14 = "-[AVAudioUnitMIDIInstrument sendPressure:onChannel:]";
      __int16 v15 = 2080;
      __int16 v16 = "_IMPL->SendMIDIEvent(kMIDIMessage_ChannelPressure, pressureValue, 0, 0, channel)";
      _os_log_impl(&dword_19D794000, v4, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "_IMPL->SendMIDIEvent(kMIDIMessage_ChannelPressure, pressureValue, 0, 0, channel)");
  }
}

- (void)sendPitchBend:(uint16_t)pitchbend onChannel:(uint8_t)channel
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ((AVAudioUnitMIDIInstrumentImpl::SendMIDIEvent((AVAudioUnitMIDIInstrumentImpl *)self->super.super._impl, 224, pitchbend & 0x7F, (pitchbend >> 7), channel) & 1) == 0)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    uint64_t v4 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v6 = "AVAEInternal.h";
      __int16 v7 = 1024;
      int v8 = 71;
      __int16 v9 = 2080;
      __int16 v10 = "AVAudioUnitMIDIInstrument.mm";
      __int16 v11 = 1024;
      int v12 = 121;
      __int16 v13 = 2080;
      __int16 v14 = "-[AVAudioUnitMIDIInstrument sendPitchBend:onChannel:]";
      __int16 v15 = 2080;
      __int16 v16 = "_IMPL->SendMIDIEvent(kMIDIMessage_PitchBend, value&0x7F, value>>7, 0, channel)";
      _os_log_impl(&dword_19D794000, v4, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "_IMPL->SendMIDIEvent(kMIDIMessage_PitchBend, value&0x7F, value>>7, 0, channel)");
  }
}

- (void)sendController:(uint8_t)controller withValue:(uint8_t)value onChannel:(uint8_t)channel
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ((AVAudioUnitMIDIInstrumentImpl::SendMIDIEvent((AVAudioUnitMIDIInstrumentImpl *)self->super.super._impl, 176, controller, value, channel) & 1) == 0)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    v5 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      __int16 v7 = "AVAEInternal.h";
      __int16 v8 = 1024;
      int v9 = 71;
      __int16 v10 = 2080;
      __int16 v11 = "AVAudioUnitMIDIInstrument.mm";
      __int16 v12 = 1024;
      int v13 = 113;
      __int16 v14 = 2080;
      __int16 v15 = "-[AVAudioUnitMIDIInstrument sendController:withValue:onChannel:]";
      __int16 v16 = 2080;
      uint64_t v17 = "_IMPL->SendMIDIEvent(kMIDIMessage_ControlChange, controller, controllerValue, 0, channel)";
      _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "_IMPL->SendMIDIEvent(kMIDIMessage_ControlChange, controller, controllerValue, 0, channel)");
  }
}

- (void)stopNote:(uint8_t)note onChannel:(uint8_t)channel
{
  int v4 = note;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ((AVAudioUnitMIDIInstrumentImpl::SendMIDIEvent((AVAudioUnitMIDIInstrumentImpl *)self->super.super._impl, 128, note, 0, channel) & 1) == 0)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    v5 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v8 = "AVAudioUnitMIDIInstrument.mm";
      __int16 v9 = 1024;
      int v10 = 36;
      __int16 v11 = 1024;
      LODWORD(v12) = v4;
      _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_INFO, "%25s:%-5d Unable to stop playing the note %d\n", buf, 0x18u);
      if (AVAudioEngineLogCategory(void)::once != -1) {
        dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
      }
    }
    v6 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      __int16 v8 = "AVAEInternal.h";
      __int16 v9 = 1024;
      int v10 = 71;
      __int16 v11 = 2080;
      __int16 v12 = "AVAudioUnitMIDIInstrument.mm";
      __int16 v13 = 1024;
      int v14 = 107;
      __int16 v15 = 2080;
      __int16 v16 = "-[AVAudioUnitMIDIInstrument stopNote:onChannel:]";
      __int16 v17 = 2080;
      uint64_t v18 = "_IMPL->StopNote(note, channel)";
      _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "_IMPL->StopNote(note, channel)");
  }
}

- (void)startNote:(uint8_t)note withVelocity:(uint8_t)velocity onChannel:(uint8_t)channel
{
  int v5 = note;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ((AVAudioUnitMIDIInstrumentImpl::SendMIDIEvent((AVAudioUnitMIDIInstrumentImpl *)self->super.super._impl, 144, note, velocity, channel) & 1) == 0)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    v6 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v9 = "AVAudioUnitMIDIInstrument.mm";
      __int16 v10 = 1024;
      int v11 = 27;
      __int16 v12 = 1024;
      LODWORD(v13) = v5;
      _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_INFO, "%25s:%-5d Unable to start playing the note %d\n", buf, 0x18u);
      if (AVAudioEngineLogCategory(void)::once != -1) {
        dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
      }
    }
    __int16 v7 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      __int16 v9 = "AVAEInternal.h";
      __int16 v10 = 1024;
      int v11 = 71;
      __int16 v12 = 2080;
      __int16 v13 = "AVAudioUnitMIDIInstrument.mm";
      __int16 v14 = 1024;
      int v15 = 102;
      __int16 v16 = 2080;
      __int16 v17 = "-[AVAudioUnitMIDIInstrument startNote:withVelocity:onChannel:]";
      __int16 v18 = 2080;
      uint64_t v19 = "_IMPL->StartNote(note, velocity, channel)";
      _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "_IMPL->StartNote(note, velocity, channel)");
  }
}

- (AVAudioUnitMIDIInstrument)initWithAudioComponentDescription:(AudioComponentDescription *)description
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  OSType componentType = description->componentType;
  if (description->componentType != 1635085673 && componentType != 1635085685 && componentType != 1635086953)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    v6 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      __int16 v9 = "AVAEInternal.h";
      __int16 v10 = 1024;
      int v11 = 71;
      __int16 v12 = 2080;
      __int16 v13 = "AVAudioUnitMIDIInstrument.mm";
      __int16 v14 = 1024;
      int v15 = 94;
      __int16 v16 = 2080;
      __int16 v17 = "-[AVAudioUnitMIDIInstrument initWithAudioComponentDescription:]";
      __int16 v18 = 2080;
      uint64_t v19 = "(description.componentType == kAudioUnitType_MusicDevice) || (description.componentType == kAudioUnitType_MI"
            "DIProcessor) || (description.componentType == kAudioUnitType_RemoteInstrument)";
      _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "(description.componentType == kAudioUnitType_MusicDevice) || (description.componentType == kAudioUnitType_MIDIProcessor) || (description.componentType == kAudioUnitType_RemoteInstrument)");
  }
  operator new();
}

@end