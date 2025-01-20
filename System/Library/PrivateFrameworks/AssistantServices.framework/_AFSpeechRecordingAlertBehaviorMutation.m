@interface _AFSpeechRecordingAlertBehaviorMutation
- (BOOL)isDirty;
- (_AFSpeechRecordingAlertBehaviorMutation)initWithBase:(id)a3;
- (int64_t)getBeepSoundID;
- (int64_t)getStyle;
- (void)setBeepSoundID:(int64_t)a3;
- (void)setStyle:(int64_t)a3;
@end

@implementation _AFSpeechRecordingAlertBehaviorMutation

- (void).cxx_destruct
{
}

- (void)setBeepSoundID:(int64_t)a3
{
  self->_beepSoundID = a3;
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (int64_t)getBeepSoundID
{
  if ((*(unsigned char *)&self->_mutationFlags & 4) != 0) {
    return self->_beepSoundID;
  }
  else {
    return [(AFSpeechRecordingAlertBehavior *)self->_base beepSoundID];
  }
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (int64_t)getStyle
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0) {
    return self->_style;
  }
  else {
    return [(AFSpeechRecordingAlertBehavior *)self->_base style];
  }
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_AFSpeechRecordingAlertBehaviorMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFSpeechRecordingAlertBehaviorMutation;
  v6 = [(_AFSpeechRecordingAlertBehaviorMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end