@interface _AFCallStateSnapshotMutation
- (BOOL)getIsDropInCall;
- (BOOL)getOnSpeaker;
- (BOOL)isDirty;
- (_AFCallStateSnapshotMutation)initWithBase:(id)a3;
- (unint64_t)getCallState;
- (void)setCallState:(unint64_t)a3;
- (void)setIsDropInCall:(BOOL)a3;
- (void)setOnSpeaker:(BOOL)a3;
@end

@implementation _AFCallStateSnapshotMutation

- (void).cxx_destruct
{
}

- (void)setIsDropInCall:(BOOL)a3
{
  self->_isDropInCall = a3;
  *(unsigned char *)&self->_mutationFlags |= 9u;
}

- (BOOL)getIsDropInCall
{
  if ((*(unsigned char *)&self->_mutationFlags & 8) != 0) {
    return self->_isDropInCall;
  }
  else {
    return [(AFCallStateSnapshot *)self->_base isDropInCall];
  }
}

- (void)setOnSpeaker:(BOOL)a3
{
  self->_onSpeaker = a3;
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (BOOL)getOnSpeaker
{
  if ((*(unsigned char *)&self->_mutationFlags & 4) != 0) {
    return self->_onSpeaker;
  }
  else {
    return [(AFCallStateSnapshot *)self->_base onSpeaker];
  }
}

- (void)setCallState:(unint64_t)a3
{
  self->_callState = a3;
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (unint64_t)getCallState
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0) {
    return self->_callState;
  }
  else {
    return [(AFCallStateSnapshot *)self->_base callState];
  }
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_AFCallStateSnapshotMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFCallStateSnapshotMutation;
  v6 = [(_AFCallStateSnapshotMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end