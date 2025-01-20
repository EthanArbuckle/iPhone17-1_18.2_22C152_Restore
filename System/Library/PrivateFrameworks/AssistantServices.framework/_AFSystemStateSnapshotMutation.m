@interface _AFSystemStateSnapshotMutation
- (BOOL)isDirty;
- (_AFSystemStateSnapshotMutation)initWithBase:(id)a3;
- (int64_t)getSleepState;
- (void)setSleepState:(int64_t)a3;
@end

@implementation _AFSystemStateSnapshotMutation

- (void).cxx_destruct
{
}

- (void)setSleepState:(int64_t)a3
{
  self->_sleepState = a3;
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (int64_t)getSleepState
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0) {
    return self->_sleepState;
  }
  else {
    return [(AFSystemStateSnapshot *)self->_base sleepState];
  }
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_AFSystemStateSnapshotMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFSystemStateSnapshotMutation;
  v6 = [(_AFSystemStateSnapshotMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end