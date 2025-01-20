@interface _AFClockTimerMutation
- (BOOL)getIsFiring;
- (BOOL)isDirty;
- (_AFClockTimerMutation)initWithBase:(id)a3;
- (double)getDuration;
- (double)getFireTimeInterval;
- (id)getDismissedDate;
- (id)getFireDate;
- (id)getFiredDate;
- (id)getLastModifiedDate;
- (id)getTimerID;
- (id)getTimerURL;
- (id)getTitle;
- (int64_t)getState;
- (int64_t)getType;
- (void)setDismissedDate:(id)a3;
- (void)setDuration:(double)a3;
- (void)setFireDate:(id)a3;
- (void)setFireTimeInterval:(double)a3;
- (void)setFiredDate:(id)a3;
- (void)setIsFiring:(BOOL)a3;
- (void)setLastModifiedDate:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setTimerID:(id)a3;
- (void)setTimerURL:(id)a3;
- (void)setTitle:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation _AFClockTimerMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
  objc_storeStrong((id *)&self->_dismissedDate, 0);
  objc_storeStrong((id *)&self->_firedDate, 0);
  objc_storeStrong((id *)&self->_fireDate, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_timerURL, 0);
  objc_storeStrong((id *)&self->_timerID, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setLastModifiedDate:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x1001u;
}

- (id)getLastModifiedDate
{
  if ((*(_WORD *)&self->_mutationFlags & 0x1000) != 0)
  {
    v2 = self->_lastModifiedDate;
  }
  else
  {
    v2 = [(AFClockTimer *)self->_base lastModifiedDate];
  }
  return v2;
}

- (void)setDismissedDate:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x801u;
}

- (id)getDismissedDate
{
  if ((*(_WORD *)&self->_mutationFlags & 0x800) != 0)
  {
    v2 = self->_dismissedDate;
  }
  else
  {
    v2 = [(AFClockTimer *)self->_base dismissedDate];
  }
  return v2;
}

- (void)setFiredDate:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x401u;
}

- (id)getFiredDate
{
  if ((*(_WORD *)&self->_mutationFlags & 0x400) != 0)
  {
    v2 = self->_firedDate;
  }
  else
  {
    v2 = [(AFClockTimer *)self->_base firedDate];
  }
  return v2;
}

- (void)setFireDate:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x201u;
}

- (id)getFireDate
{
  if ((*(_WORD *)&self->_mutationFlags & 0x200) != 0)
  {
    v2 = self->_fireDate;
  }
  else
  {
    v2 = [(AFClockTimer *)self->_base fireDate];
  }
  return v2;
}

- (void)setFireTimeInterval:(double)a3
{
  self->_fireTimeInterval = a3;
  *(_WORD *)&self->_mutationFlags |= 0x101u;
}

- (double)getFireTimeInterval
{
  if ((*(_WORD *)&self->_mutationFlags & 0x100) != 0) {
    return self->_fireTimeInterval;
  }
  [(AFClockTimer *)self->_base fireTimeInterval];
  return result;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
  *(_WORD *)&self->_mutationFlags |= 0x81u;
}

- (int64_t)getType
{
  if ((*(_WORD *)&self->_mutationFlags & 0x80) != 0) {
    return self->_type;
  }
  else {
    return [(AFClockTimer *)self->_base type];
  }
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
  *(_WORD *)&self->_mutationFlags |= 0x41u;
}

- (double)getDuration
{
  if ((*(_WORD *)&self->_mutationFlags & 0x40) != 0) {
    return self->_duration;
  }
  [(AFClockTimer *)self->_base duration];
  return result;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
  *(_WORD *)&self->_mutationFlags |= 0x21u;
}

- (int64_t)getState
{
  if ((*(_WORD *)&self->_mutationFlags & 0x20) != 0) {
    return self->_state;
  }
  else {
    return [(AFClockTimer *)self->_base state];
  }
}

- (void)setTitle:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x11u;
}

- (id)getTitle
{
  if ((*(_WORD *)&self->_mutationFlags & 0x10) != 0)
  {
    v2 = self->_title;
  }
  else
  {
    v2 = [(AFClockTimer *)self->_base title];
  }
  return v2;
}

- (void)setIsFiring:(BOOL)a3
{
  self->_isFiring = a3;
  *(_WORD *)&self->_mutationFlags |= 9u;
}

- (BOOL)getIsFiring
{
  if ((*(_WORD *)&self->_mutationFlags & 8) != 0) {
    return self->_isFiring;
  }
  else {
    return [(AFClockTimer *)self->_base isFiring];
  }
}

- (void)setTimerURL:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 5u;
}

- (id)getTimerURL
{
  if ((*(_WORD *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_timerURL;
  }
  else
  {
    v2 = [(AFClockTimer *)self->_base timerURL];
  }
  return v2;
}

- (void)setTimerID:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 3u;
}

- (id)getTimerID
{
  if ((*(_WORD *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_timerID;
  }
  else
  {
    v2 = [(AFClockTimer *)self->_base timerID];
  }
  return v2;
}

- (BOOL)isDirty
{
  return *(_WORD *)&self->_mutationFlags & 1;
}

- (_AFClockTimerMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFClockTimerMutation;
  v6 = [(_AFClockTimerMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end