@interface HUMobileTimerObject
- (BOOL)_alarmIDsMatch:(id)a3;
- (BOOL)_timerIDsMatch:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isIgnorableTimerObject;
- (HUMobileTimerObject)initWithAlarm:(id)a3;
- (HUMobileTimerObject)initWithTimer:(id)a3;
- (MTAlarm)alarm;
- (MTTimer)timer;
- (NSUUID)uniqueIdentifier;
- (id)description;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
@end

@implementation HUMobileTimerObject

- (HUMobileTimerObject)initWithAlarm:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUMobileTimerObject;
  v6 = [(HUMobileTimerObject *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_alarm, a3);
    uint64_t v8 = [v5 alarmID];
    uniqueIdentifier = v7->_uniqueIdentifier;
    v7->_uniqueIdentifier = (NSUUID *)v8;
  }
  return v7;
}

- (HUMobileTimerObject)initWithTimer:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUMobileTimerObject;
  v6 = [(HUMobileTimerObject *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_timer, a3);
    uint64_t v8 = [v5 timerID];
    uniqueIdentifier = v7->_uniqueIdentifier;
    v7->_uniqueIdentifier = (NSUUID *)v8;
  }
  return v7;
}

- (unint64_t)hash
{
  v4 = [(HUMobileTimerObject *)self alarm];
  if (v4) {
    goto LABEL_2;
  }
  id v5 = [(HUMobileTimerObject *)self timer];

  if (!v5)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"HUMobileTimerObject.m" lineNumber:41 description:@"HUMobileTimerObject must wrap an alarm or a timer"];
LABEL_2:
  }
  v6 = [(HUMobileTimerObject *)self alarm];

  if (v6) {
    [(HUMobileTimerObject *)self alarm];
  }
  else {
  v7 = [(HUMobileTimerObject *)self timer];
  }
  unint64_t v8 = [v7 hash];

  return v8;
}

- (BOOL)_timerIDsMatch:(id)a3
{
  id v4 = a3;
  id v5 = [(HUMobileTimerObject *)self timer];

  char v6 = 0;
  if (v4 && v5)
  {
    v7 = [(HUMobileTimerObject *)self timer];
    unint64_t v8 = [v7 timerID];
    v9 = [v4 timerID];
    char v6 = [v8 isEqual:v9];
  }
  return v6;
}

- (BOOL)_alarmIDsMatch:(id)a3
{
  id v4 = a3;
  id v5 = [(HUMobileTimerObject *)self alarm];

  char v6 = 0;
  if (v4 && v5)
  {
    v7 = [(HUMobileTimerObject *)self alarm];
    unint64_t v8 = [v7 alarmID];
    v9 = [v4 alarmID];
    char v6 = [v8 isEqual:v9];
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  char v6 = [(HUMobileTimerObject *)self alarm];
  if (v6) {
    goto LABEL_2;
  }
  v7 = [(HUMobileTimerObject *)self timer];

  if (!v7)
  {
    char v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"HUMobileTimerObject.m" lineNumber:70 description:@"HUMobileTimerObject must wrap an alarm or a timer"];
LABEL_2:
  }
  objc_opt_class();
  id v8 = v5;
  if (objc_opt_isKindOfClass()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  if (!v10) {
    goto LABEL_17;
  }
  objc_super v11 = [(HUMobileTimerObject *)self alarm];

  if (!v11)
  {
    v16 = [(HUMobileTimerObject *)self timer];

    if (v16)
    {
      v17 = [v10 timer];

      if (!v17)
      {
        uint64_t v18 = objc_opt_class();
        NSLog(&cfstr_ComparingNonTi.isa, v18);
      }
      v14 = [v10 timer];
      BOOL v15 = [(HUMobileTimerObject *)self _timerIDsMatch:v14];
      goto LABEL_16;
    }
LABEL_17:
    BOOL v19 = 0;
    goto LABEL_18;
  }
  v12 = [v10 alarm];

  if (!v12)
  {
    uint64_t v13 = objc_opt_class();
    NSLog(&cfstr_ComparingNonAl.isa, v13);
  }
  v14 = [v10 alarm];
  BOOL v15 = [(HUMobileTimerObject *)self _alarmIDsMatch:v14];
LABEL_16:
  BOOL v19 = v15;

LABEL_18:
  return v19;
}

- (BOOL)isIgnorableTimerObject
{
  v3 = [(HUMobileTimerObject *)self timer];

  if (v3)
  {
    id v4 = [(HUMobileTimerObject *)self timer];
    char v5 = [v4 isCurrentTimer];

    if (v5) {
      return 1;
    }
    char v6 = [(HUMobileTimerObject *)self timer];
    if ([v6 state] == 1)
    {
      v7 = [(HUMobileTimerObject *)self timer];
      int v8 = [v7 isFiring];

      if (!v8) {
        return 1;
      }
    }
    else
    {
    }
  }
  return 0;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HUMobileTimerObject *)self alarm];
  if (v5)
  {
    char v6 = (void *)v5;
    v7 = [v4 alarm];

    if (v7)
    {
      int v8 = [(HUMobileTimerObject *)self alarm];
      uint64_t v9 = [v4 alarm];
LABEL_7:
      uint64_t v13 = (void *)v9;
      int64_t v14 = [v8 compare:v9];

      goto LABEL_11;
    }
  }
  uint64_t v10 = [(HUMobileTimerObject *)self timer];
  if (v10)
  {
    objc_super v11 = (void *)v10;
    v12 = [v4 timer];

    if (v12)
    {
      int v8 = [(HUMobileTimerObject *)self timer];
      uint64_t v9 = [v4 timer];
      goto LABEL_7;
    }
  }
  BOOL v15 = HFLogForCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v17 = 0;
    _os_log_error_impl(&dword_1BE345000, v15, OS_LOG_TYPE_ERROR, "Error: comparing an MTAlarm to an MTTimer is not allowed.", v17, 2u);
  }

  int64_t v14 = 0;
LABEL_11:

  return v14;
}

- (id)description
{
  id v4 = [(HUMobileTimerObject *)self alarm];
  if (v4) {
    goto LABEL_2;
  }
  uint64_t v5 = [(HUMobileTimerObject *)self timer];

  if (!v5)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"HUMobileTimerObject.m" lineNumber:123 description:@"HUMobileTimerObject must wrap an alarm or a timer"];
LABEL_2:
  }
  char v6 = [MEMORY[0x1E4F7A0D0] builderWithObject:self];
  v7 = [(HUMobileTimerObject *)self alarm];

  int v8 = NSString;
  if (v7)
  {
    uint64_t v9 = [(HUMobileTimerObject *)self alarm];
    uint64_t v10 = objc_msgSend(v8, "stringWithFormat:", @"%p", v9);
    [v6 appendString:v10 withName:@"MTAlarm"];

    objc_super v11 = [(HUMobileTimerObject *)self alarm];
    v12 = [v11 alarmID];
    id v13 = (id)[v6 appendObject:v12 withName:@"AlarmID"];

    int64_t v14 = [(HUMobileTimerObject *)self alarm];
    id v15 = (id)objc_msgSend(v6, "appendBool:withName:", objc_msgSend(v14, "isEnabled"), @"Enabled");

    v16 = [(HUMobileTimerObject *)self alarm];
    v17 = [v16 title];
    id v18 = (id)[v6 appendObject:v17 withName:@"Title"];

    BOOL v19 = NSString;
    v20 = [(HUMobileTimerObject *)self alarm];
    uint64_t v21 = [v20 hour];
    v22 = [(HUMobileTimerObject *)self alarm];
    v23 = objc_msgSend(v19, "stringWithFormat:", @"%lu:%lu", v21, objc_msgSend(v22, "minute"));
    id v24 = (id)[v6 appendObject:v23 withName:@"HH:MM"];
  }
  else
  {
    v25 = [(HUMobileTimerObject *)self timer];
    v26 = objc_msgSend(v8, "stringWithFormat:", @"%p", v25);
    [v6 appendString:v26 withName:@"MTTimer"];

    v27 = [(HUMobileTimerObject *)self timer];
    v28 = [v27 timerID];
    id v29 = (id)[v6 appendObject:v28 withName:@"TimerID"];

    v30 = [(HUMobileTimerObject *)self timer];
    id v31 = (id)objc_msgSend(v6, "appendUnsignedInteger:withName:", objc_msgSend(v30, "state"), @"State");

    v32 = [(HUMobileTimerObject *)self timer];
    v33 = [v32 title];
    id v34 = (id)[v6 appendObject:v33 withName:@"Title"];

    v35 = [(HUMobileTimerObject *)self timer];
    [v35 remainingTime];
    id v36 = (id)objc_msgSend(v6, "appendTimeInterval:withName:decomposeUnits:", @"Remaining", 1);

    v20 = [(HUMobileTimerObject *)self timer];
    [v20 duration];
    id v37 = (id)objc_msgSend(v6, "appendTimeInterval:withName:decomposeUnits:", @"of", 1);
  }

  v38 = [v6 build];

  return v38;
}

- (MTAlarm)alarm
{
  return self->_alarm;
}

- (MTTimer)timer
{
  return self->_timer;
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_timer, 0);

  objc_storeStrong((id *)&self->_alarm, 0);
}

@end