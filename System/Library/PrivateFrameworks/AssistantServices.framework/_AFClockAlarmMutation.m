@interface _AFClockAlarmMutation
- (BOOL)getIsEnabled;
- (BOOL)getIsFiring;
- (BOOL)getIsSnoozed;
- (BOOL)isDirty;
- (_AFClockAlarmMutation)initWithBase:(id)a3;
- (id)getAlarmID;
- (id)getAlarmURL;
- (id)getDismissedDate;
- (id)getFiredDate;
- (id)getLastModifiedDate;
- (id)getTitle;
- (unint64_t)getHour;
- (unint64_t)getMinute;
- (unint64_t)getRepeatOptions;
- (unint64_t)getType;
- (void)setAlarmID:(id)a3;
- (void)setAlarmURL:(id)a3;
- (void)setDismissedDate:(id)a3;
- (void)setFiredDate:(id)a3;
- (void)setHour:(unint64_t)a3;
- (void)setIsEnabled:(BOOL)a3;
- (void)setIsFiring:(BOOL)a3;
- (void)setIsSnoozed:(BOOL)a3;
- (void)setLastModifiedDate:(id)a3;
- (void)setMinute:(unint64_t)a3;
- (void)setRepeatOptions:(unint64_t)a3;
- (void)setTitle:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation _AFClockAlarmMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
  objc_storeStrong((id *)&self->_dismissedDate, 0);
  objc_storeStrong((id *)&self->_firedDate, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_alarmURL, 0);
  objc_storeStrong((id *)&self->_alarmID, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setLastModifiedDate:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x2001u;
}

- (id)getLastModifiedDate
{
  if ((*(_WORD *)&self->_mutationFlags & 0x2000) != 0)
  {
    v2 = self->_lastModifiedDate;
  }
  else
  {
    v2 = [(AFClockAlarm *)self->_base lastModifiedDate];
  }
  return v2;
}

- (void)setDismissedDate:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x1001u;
}

- (id)getDismissedDate
{
  if ((*(_WORD *)&self->_mutationFlags & 0x1000) != 0)
  {
    v2 = self->_dismissedDate;
  }
  else
  {
    v2 = [(AFClockAlarm *)self->_base dismissedDate];
  }
  return v2;
}

- (void)setFiredDate:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x801u;
}

- (id)getFiredDate
{
  if ((*(_WORD *)&self->_mutationFlags & 0x800) != 0)
  {
    v2 = self->_firedDate;
  }
  else
  {
    v2 = [(AFClockAlarm *)self->_base firedDate];
  }
  return v2;
}

- (void)setIsSnoozed:(BOOL)a3
{
  self->_isSnoozed = a3;
  *(_WORD *)&self->_mutationFlags |= 0x401u;
}

- (BOOL)getIsSnoozed
{
  if ((*(_WORD *)&self->_mutationFlags & 0x400) != 0) {
    return self->_isSnoozed;
  }
  else {
    return [(AFClockAlarm *)self->_base isSnoozed];
  }
}

- (void)setIsEnabled:(BOOL)a3
{
  self->_isEnabled = a3;
  *(_WORD *)&self->_mutationFlags |= 0x201u;
}

- (BOOL)getIsEnabled
{
  if ((*(_WORD *)&self->_mutationFlags & 0x200) != 0) {
    return self->_isEnabled;
  }
  else {
    return [(AFClockAlarm *)self->_base isEnabled];
  }
}

- (void)setRepeatOptions:(unint64_t)a3
{
  self->_repeatOptions = a3;
  *(_WORD *)&self->_mutationFlags |= 0x101u;
}

- (unint64_t)getRepeatOptions
{
  if ((*(_WORD *)&self->_mutationFlags & 0x100) != 0) {
    return self->_repeatOptions;
  }
  else {
    return [(AFClockAlarm *)self->_base repeatOptions];
  }
}

- (void)setMinute:(unint64_t)a3
{
  self->_minute = a3;
  *(_WORD *)&self->_mutationFlags |= 0x81u;
}

- (unint64_t)getMinute
{
  if ((*(_WORD *)&self->_mutationFlags & 0x80) != 0) {
    return self->_minute;
  }
  else {
    return [(AFClockAlarm *)self->_base minute];
  }
}

- (void)setHour:(unint64_t)a3
{
  self->_hour = a3;
  *(_WORD *)&self->_mutationFlags |= 0x41u;
}

- (unint64_t)getHour
{
  if ((*(_WORD *)&self->_mutationFlags & 0x40) != 0) {
    return self->_hour;
  }
  else {
    return [(AFClockAlarm *)self->_base hour];
  }
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
  *(_WORD *)&self->_mutationFlags |= 0x21u;
}

- (unint64_t)getType
{
  if ((*(_WORD *)&self->_mutationFlags & 0x20) != 0) {
    return self->_type;
  }
  else {
    return [(AFClockAlarm *)self->_base type];
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
    v2 = [(AFClockAlarm *)self->_base title];
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
    return [(AFClockAlarm *)self->_base isFiring];
  }
}

- (void)setAlarmURL:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 5u;
}

- (id)getAlarmURL
{
  if ((*(_WORD *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_alarmURL;
  }
  else
  {
    v2 = [(AFClockAlarm *)self->_base alarmURL];
  }
  return v2;
}

- (void)setAlarmID:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 3u;
}

- (id)getAlarmID
{
  if ((*(_WORD *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_alarmID;
  }
  else
  {
    v2 = [(AFClockAlarm *)self->_base alarmID];
  }
  return v2;
}

- (BOOL)isDirty
{
  return *(_WORD *)&self->_mutationFlags & 1;
}

- (_AFClockAlarmMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFClockAlarmMutation;
  v6 = [(_AFClockAlarmMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end