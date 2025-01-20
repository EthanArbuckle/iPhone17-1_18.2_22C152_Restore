@interface _AFClockTimerSnapshotMutation
- (BOOL)isDirty;
- (_AFClockTimerSnapshotMutation)initWithBase:(id)a3;
- (id)getDate;
- (id)getNotifiedFiringTimerIDs;
- (id)getTimersByID;
- (unint64_t)getGeneration;
- (void)setDate:(id)a3;
- (void)setGeneration:(unint64_t)a3;
- (void)setNotifiedFiringTimerIDs:(id)a3;
- (void)setTimersByID:(id)a3;
@end

@implementation _AFClockTimerSnapshotMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifiedFiringTimerIDs, 0);
  objc_storeStrong((id *)&self->_timersByID, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setNotifiedFiringTimerIDs:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 0x11u;
}

- (id)getNotifiedFiringTimerIDs
{
  if ((*(unsigned char *)&self->_mutationFlags & 0x10) != 0)
  {
    v2 = self->_notifiedFiringTimerIDs;
  }
  else
  {
    v2 = [(AFClockTimerSnapshot *)self->_base notifiedFiringTimerIDs];
  }
  return v2;
}

- (void)setTimersByID:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 9u;
}

- (id)getTimersByID
{
  if ((*(unsigned char *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_timersByID;
  }
  else
  {
    v2 = [(AFClockTimerSnapshot *)self->_base timersByID];
  }
  return v2;
}

- (void)setDate:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (id)getDate
{
  if ((*(unsigned char *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_date;
  }
  else
  {
    v2 = [(AFClockTimerSnapshot *)self->_base date];
  }
  return v2;
}

- (void)setGeneration:(unint64_t)a3
{
  self->_generation = a3;
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (unint64_t)getGeneration
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0) {
    return self->_generation;
  }
  else {
    return [(AFClockTimerSnapshot *)self->_base generation];
  }
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_AFClockTimerSnapshotMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFClockTimerSnapshotMutation;
  v6 = [(_AFClockTimerSnapshotMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end