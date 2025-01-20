@interface _AFSpeechRecordingAlertPolicyMutation
- (BOOL)isDirty;
- (_AFSpeechRecordingAlertPolicyMutation)initWithBase:(id)a3;
- (id)getStartingAlertBehavior;
- (id)getStoppedAlertBehavior;
- (id)getStoppedWithErrorAlertBehavior;
- (void)setStartingAlertBehavior:(id)a3;
- (void)setStoppedAlertBehavior:(id)a3;
- (void)setStoppedWithErrorAlertBehavior:(id)a3;
@end

@implementation _AFSpeechRecordingAlertPolicyMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stoppedWithErrorAlertBehavior, 0);
  objc_storeStrong((id *)&self->_stoppedAlertBehavior, 0);
  objc_storeStrong((id *)&self->_startingAlertBehavior, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setStoppedWithErrorAlertBehavior:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 9u;
}

- (id)getStoppedWithErrorAlertBehavior
{
  if ((*(unsigned char *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_stoppedWithErrorAlertBehavior;
  }
  else
  {
    v2 = [(AFSpeechRecordingAlertPolicy *)self->_base stoppedWithErrorAlertBehavior];
  }
  return v2;
}

- (void)setStoppedAlertBehavior:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (id)getStoppedAlertBehavior
{
  if ((*(unsigned char *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_stoppedAlertBehavior;
  }
  else
  {
    v2 = [(AFSpeechRecordingAlertPolicy *)self->_base stoppedAlertBehavior];
  }
  return v2;
}

- (void)setStartingAlertBehavior:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (id)getStartingAlertBehavior
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_startingAlertBehavior;
  }
  else
  {
    v2 = [(AFSpeechRecordingAlertPolicy *)self->_base startingAlertBehavior];
  }
  return v2;
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_AFSpeechRecordingAlertPolicyMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFSpeechRecordingAlertPolicyMutation;
  v6 = [(_AFSpeechRecordingAlertPolicyMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end