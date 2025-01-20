@interface _AFClockAlarmSnapshotMutation
- (BOOL)isDirty;
- (_AFClockAlarmSnapshotMutation)initWithBase:(id)a3;
- (id)getAlarmsByID;
- (id)getDate;
- (id)getNotifiedFiringAlarmIDs;
- (unint64_t)getGeneration;
- (void)setAlarmsByID:(id)a3;
- (void)setDate:(id)a3;
- (void)setGeneration:(unint64_t)a3;
- (void)setNotifiedFiringAlarmIDs:(id)a3;
@end

@implementation _AFClockAlarmSnapshotMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifiedFiringAlarmIDs, 0);
  objc_storeStrong((id *)&self->_alarmsByID, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setNotifiedFiringAlarmIDs:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 0x11u;
}

- (id)getNotifiedFiringAlarmIDs
{
  if ((*(unsigned char *)&self->_mutationFlags & 0x10) != 0)
  {
    v2 = self->_notifiedFiringAlarmIDs;
  }
  else
  {
    v2 = [(AFClockAlarmSnapshot *)self->_base notifiedFiringAlarmIDs];
  }
  return v2;
}

- (void)setAlarmsByID:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 9u;
}

- (id)getAlarmsByID
{
  if ((*(unsigned char *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_alarmsByID;
  }
  else
  {
    v2 = [(AFClockAlarmSnapshot *)self->_base alarmsByID];
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
    v2 = [(AFClockAlarmSnapshot *)self->_base date];
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
    return [(AFClockAlarmSnapshot *)self->_base generation];
  }
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_AFClockAlarmSnapshotMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFClockAlarmSnapshotMutation;
  v6 = [(_AFClockAlarmSnapshotMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end