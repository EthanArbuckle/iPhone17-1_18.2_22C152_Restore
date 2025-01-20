@interface DNDSHeartbeatMetricsRecord
+ (id)migrateDictionaryRepresentation:(id)a3 fromVersionNumber:(unint64_t)a4 toVersionNumber:(unint64_t)a5;
+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4;
- (BOOL)enabled;
- (BOOL)enabledAtLocation;
- (BOOL)enabledDrivingMode;
- (BOOL)enabledDuringEvent;
- (BOOL)enabledForOneHour;
- (BOOL)enabledFromControlCenterPhone;
- (BOOL)enabledFromControlCenterWatch;
- (BOOL)enabledSleepMode;
- (BOOL)enabledUntilEvening;
- (BOOL)enabledUntilMorning;
- (BOOL)isEqual:(id)a3;
- (BOOL)manuallyEnabled;
- (DNDSHeartbeatMetricsRecord)init;
- (NSNumber)numberOfManualSessions;
- (NSNumber)numberOfSessions;
- (NSString)description;
- (id)_initWithEnabled:(BOOL)a3 manuallyEnabled:(BOOL)a4 numberOfSessions:(id)a5 numberOfManualSessions:(id)a6 enabledFromControlCenterPhone:(BOOL)a7 enabledFromControlCenterWatch:(BOOL)a8 enabledForOneHour:(BOOL)a9 enabledUntilEvening:(BOOL)a10 enabledUntilMorning:(BOOL)a11 enabledAtLocation:(BOOL)a12 enabledDuringEvent:(BOOL)a13 enabledDrivingMode:(BOOL)a14 enabledSleepMode:(BOOL)a15;
- (id)_initWithRecord:(id)a3;
- (id)dictionaryRepresentationWithContext:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation DNDSHeartbeatMetricsRecord

- (DNDSHeartbeatMetricsRecord)init
{
  return (DNDSHeartbeatMetricsRecord *)[(DNDSHeartbeatMetricsRecord *)self _initWithRecord:0];
}

- (id)_initWithRecord:(id)a3
{
  id v3 = a3;
  unsigned int v19 = [v3 enabled];
  unsigned int v18 = [v3 manuallyEnabled];
  v4 = [v3 numberOfSessions];
  v5 = [v3 numberOfManualSessions];
  unsigned int v17 = [v3 enabledFromControlCenterPhone];
  unsigned int v16 = [v3 enabledFromControlCenterWatch];
  char v6 = [v3 enabledForOneHour];
  char v7 = [v3 enabledUntilEvening];
  char v8 = [v3 enabledUntilMorning];
  char v9 = [v3 enabledAtLocation];
  char v10 = [v3 enabledDuringEvent];
  char v11 = [v3 enabledDrivingMode];
  char v12 = [v3 enabledSleepMode];

  BYTE6(v15) = v12;
  BYTE5(v15) = v11;
  BYTE4(v15) = v10;
  BYTE3(v15) = v9;
  BYTE2(v15) = v8;
  BYTE1(v15) = v7;
  LOBYTE(v15) = v6;
  id v13 = -[DNDSHeartbeatMetricsRecord _initWithEnabled:manuallyEnabled:numberOfSessions:numberOfManualSessions:enabledFromControlCenterPhone:enabledFromControlCenterWatch:enabledForOneHour:enabledUntilEvening:enabledUntilMorning:enabledAtLocation:enabledDuringEvent:enabledDrivingMode:enabledSleepMode:](self, "_initWithEnabled:manuallyEnabled:numberOfSessions:numberOfManualSessions:enabledFromControlCenterPhone:enabledFromControlCenterWatch:enabledForOneHour:enabledUntilEvening:enabledUntilMorning:enabledAtLocation:enabledDuringEvent:enabledDrivingMode:enabledSleepMode:", v19, v18, v4, v5, v17, v16, v15);

  return v13;
}

- (id)_initWithEnabled:(BOOL)a3 manuallyEnabled:(BOOL)a4 numberOfSessions:(id)a5 numberOfManualSessions:(id)a6 enabledFromControlCenterPhone:(BOOL)a7 enabledFromControlCenterWatch:(BOOL)a8 enabledForOneHour:(BOOL)a9 enabledUntilEvening:(BOOL)a10 enabledUntilMorning:(BOOL)a11 enabledAtLocation:(BOOL)a12 enabledDuringEvent:(BOOL)a13 enabledDrivingMode:(BOOL)a14 enabledSleepMode:(BOOL)a15
{
  id v21 = a5;
  id v22 = a6;
  v32.receiver = self;
  v32.super_class = (Class)DNDSHeartbeatMetricsRecord;
  v23 = [(DNDSHeartbeatMetricsRecord *)&v32 init];
  v24 = v23;
  if (v23)
  {
    v23->_enabled = a3;
    v23->_manuallyEnabled = a4;
    uint64_t v25 = [v21 copy];
    v26 = (void *)v25;
    if (v25) {
      v27 = (void *)v25;
    }
    else {
      v27 = &unk_1F2A5D988;
    }
    objc_storeStrong((id *)&v24->_numberOfSessions, v27);

    uint64_t v28 = [v22 copy];
    v29 = (void *)v28;
    if (v28) {
      v30 = (void *)v28;
    }
    else {
      v30 = &unk_1F2A5D988;
    }
    objc_storeStrong((id *)&v24->_numberOfManualSessions, v30);

    v24->_enabledFromControlCenterPhone = a7;
    v24->_enabledFromControlCenterWatch = a8;
    v24->_enabledForOneHour = a9;
    v24->_enabledUntilEvening = a10;
    v24->_enabledUntilMorning = a11;
    v24->_enabledAtLocation = a12;
    v24->_enabledDuringEvent = a13;
    v24->_enabledDrivingMode = a14;
    v24->_enabledSleepMode = a15;
  }

  return v24;
}

- (unint64_t)hash
{
  BOOL v3 = [(DNDSHeartbeatMetricsRecord *)self enabled];
  uint64_t v4 = v3 ^ [(DNDSHeartbeatMetricsRecord *)self manuallyEnabled];
  v5 = [(DNDSHeartbeatMetricsRecord *)self numberOfSessions];
  uint64_t v6 = [v5 hash];
  char v7 = [(DNDSHeartbeatMetricsRecord *)self numberOfManualSessions];
  uint64_t v8 = v6 ^ [v7 hash];
  uint64_t v9 = v8 ^ [(DNDSHeartbeatMetricsRecord *)self enabledFromControlCenterPhone] ^ v4;
  uint64_t v10 = [(DNDSHeartbeatMetricsRecord *)self enabledFromControlCenterWatch];
  uint64_t v11 = v10 ^ [(DNDSHeartbeatMetricsRecord *)self enabledForOneHour];
  uint64_t v12 = v9 ^ v11 ^ [(DNDSHeartbeatMetricsRecord *)self enabledUntilEvening];
  uint64_t v13 = [(DNDSHeartbeatMetricsRecord *)self enabledUntilMorning];
  uint64_t v14 = v13 ^ [(DNDSHeartbeatMetricsRecord *)self enabledAtLocation];
  uint64_t v15 = v14 ^ [(DNDSHeartbeatMetricsRecord *)self enabledDuringEvent];
  uint64_t v16 = v12 ^ v15 ^ [(DNDSHeartbeatMetricsRecord *)self enabledDrivingMode];
  unint64_t v17 = v16 ^ [(DNDSHeartbeatMetricsRecord *)self enabledSleepMode];

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v6 = (DNDSHeartbeatMetricsRecord *)a3;
  if (self == v6)
  {
    LOBYTE(v10) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v7 = v6;
      BOOL v8 = [(DNDSHeartbeatMetricsRecord *)self enabled];
      if (v8 != [(DNDSHeartbeatMetricsRecord *)v7 enabled]
        || (BOOL v9 = [(DNDSHeartbeatMetricsRecord *)self manuallyEnabled],
            v9 != [(DNDSHeartbeatMetricsRecord *)v7 manuallyEnabled]))
      {
        LOBYTE(v10) = 0;
LABEL_42:

        goto LABEL_43;
      }
      uint64_t v11 = [(DNDSHeartbeatMetricsRecord *)self numberOfSessions];
      uint64_t v12 = [(DNDSHeartbeatMetricsRecord *)v7 numberOfSessions];
      if (v11 != v12)
      {
        uint64_t v13 = [(DNDSHeartbeatMetricsRecord *)self numberOfSessions];
        if (!v13)
        {
          LOBYTE(v10) = 0;
          goto LABEL_41;
        }
        BOOL v3 = (void *)v13;
        uint64_t v14 = [(DNDSHeartbeatMetricsRecord *)v7 numberOfSessions];
        if (!v14)
        {
          LOBYTE(v10) = 0;
LABEL_40:

          goto LABEL_41;
        }
        uint64_t v15 = (void *)v14;
        uint64_t v16 = [(DNDSHeartbeatMetricsRecord *)self numberOfSessions];
        uint64_t v4 = [(DNDSHeartbeatMetricsRecord *)v7 numberOfSessions];
        if (![v16 isEqual:v4])
        {
          LOBYTE(v10) = 0;
LABEL_39:

          goto LABEL_40;
        }
        v38 = v4;
        v39 = v16;
        v40 = v15;
      }
      unint64_t v17 = [(DNDSHeartbeatMetricsRecord *)self numberOfManualSessions];
      unsigned int v18 = [(DNDSHeartbeatMetricsRecord *)v7 numberOfManualSessions];
      if (v17 != v18)
      {
        uint64_t v19 = [(DNDSHeartbeatMetricsRecord *)self numberOfManualSessions];
        if (!v19)
        {
LABEL_29:

          LOBYTE(v10) = 0;
          goto LABEL_38;
        }
        uint64_t v4 = (void *)v19;
        uint64_t v20 = [(DNDSHeartbeatMetricsRecord *)v7 numberOfManualSessions];
        if (!v20)
        {
          LOBYTE(v10) = 0;
LABEL_36:

          goto LABEL_37;
        }
        id v21 = (void *)v20;
        v35 = v3;
        id v22 = v4;
        v23 = [(DNDSHeartbeatMetricsRecord *)self numberOfManualSessions];
        v36 = [(DNDSHeartbeatMetricsRecord *)v7 numberOfManualSessions];
        v37 = v23;
        if (!objc_msgSend(v23, "isEqual:"))
        {
          LOBYTE(v10) = 0;
          uint64_t v4 = v22;
          BOOL v3 = v35;
LABEL_35:

          goto LABEL_36;
        }
        v34 = v21;
        uint64_t v4 = v22;
        BOOL v3 = v35;
      }
      BOOL v24 = [(DNDSHeartbeatMetricsRecord *)self enabledFromControlCenterPhone];
      if (v24 != [(DNDSHeartbeatMetricsRecord *)v7 enabledFromControlCenterPhone]
        || (BOOL v25 = [(DNDSHeartbeatMetricsRecord *)self enabledFromControlCenterWatch],
            v25 != [(DNDSHeartbeatMetricsRecord *)v7 enabledFromControlCenterWatch])
        || (BOOL v26 = [(DNDSHeartbeatMetricsRecord *)self enabledForOneHour],
            v26 != [(DNDSHeartbeatMetricsRecord *)v7 enabledForOneHour])
        || (BOOL v27 = [(DNDSHeartbeatMetricsRecord *)self enabledUntilEvening],
            v27 != [(DNDSHeartbeatMetricsRecord *)v7 enabledUntilEvening])
        || (BOOL v28 = [(DNDSHeartbeatMetricsRecord *)self enabledUntilMorning],
            v28 != [(DNDSHeartbeatMetricsRecord *)v7 enabledUntilMorning])
        || (BOOL v29 = [(DNDSHeartbeatMetricsRecord *)self enabledAtLocation],
            v29 != [(DNDSHeartbeatMetricsRecord *)v7 enabledAtLocation])
        || (BOOL v30 = [(DNDSHeartbeatMetricsRecord *)self enabledDuringEvent],
            v30 != [(DNDSHeartbeatMetricsRecord *)v7 enabledDuringEvent])
        || (BOOL v31 = [(DNDSHeartbeatMetricsRecord *)self enabledDrivingMode],
            v31 != [(DNDSHeartbeatMetricsRecord *)v7 enabledDrivingMode]))
      {
        if (v17 != v18)
        {

          goto LABEL_29;
        }
        LOBYTE(v10) = 0;
LABEL_37:

LABEL_38:
        uint64_t v16 = v39;
        uint64_t v15 = v40;
        uint64_t v4 = v38;
        if (v11 != v12) {
          goto LABEL_39;
        }
LABEL_41:

        goto LABEL_42;
      }
      BOOL v33 = [(DNDSHeartbeatMetricsRecord *)self enabledSleepMode];
      BOOL v10 = v33 ^ [(DNDSHeartbeatMetricsRecord *)v7 enabledSleepMode] ^ 1;
      id v21 = v34;
      if (v17 == v18) {
        goto LABEL_37;
      }
      goto LABEL_35;
    }
    LOBYTE(v10) = 0;
  }
LABEL_43:

  return v10;
}

- (NSString)description
{
  v23 = NSString;
  uint64_t v22 = objc_opt_class();
  if ([(DNDSHeartbeatMetricsRecord *)self enabled]) {
    BOOL v3 = @"YES";
  }
  else {
    BOOL v3 = @"NO";
  }
  id v21 = v3;
  if ([(DNDSHeartbeatMetricsRecord *)self manuallyEnabled]) {
    uint64_t v4 = @"YES";
  }
  else {
    uint64_t v4 = @"NO";
  }
  uint64_t v20 = v4;
  uint64_t v19 = [(DNDSHeartbeatMetricsRecord *)self numberOfSessions];
  v5 = [(DNDSHeartbeatMetricsRecord *)self numberOfManualSessions];
  if ([(DNDSHeartbeatMetricsRecord *)self enabledFromControlCenterPhone]) {
    uint64_t v6 = @"YES";
  }
  else {
    uint64_t v6 = @"NO";
  }
  unsigned int v18 = v6;
  if ([(DNDSHeartbeatMetricsRecord *)self enabledFromControlCenterWatch]) {
    char v7 = @"YES";
  }
  else {
    char v7 = @"NO";
  }
  unint64_t v17 = v7;
  if ([(DNDSHeartbeatMetricsRecord *)self enabledForOneHour]) {
    BOOL v8 = @"YES";
  }
  else {
    BOOL v8 = @"NO";
  }
  if ([(DNDSHeartbeatMetricsRecord *)self enabledUntilEvening]) {
    BOOL v9 = @"YES";
  }
  else {
    BOOL v9 = @"NO";
  }
  if ([(DNDSHeartbeatMetricsRecord *)self enabledUntilMorning]) {
    BOOL v10 = @"YES";
  }
  else {
    BOOL v10 = @"NO";
  }
  if ([(DNDSHeartbeatMetricsRecord *)self enabledAtLocation]) {
    uint64_t v11 = @"YES";
  }
  else {
    uint64_t v11 = @"NO";
  }
  if ([(DNDSHeartbeatMetricsRecord *)self enabledDuringEvent]) {
    uint64_t v12 = @"YES";
  }
  else {
    uint64_t v12 = @"NO";
  }
  if ([(DNDSHeartbeatMetricsRecord *)self enabledDrivingMode]) {
    uint64_t v13 = @"YES";
  }
  else {
    uint64_t v13 = @"NO";
  }
  if ([(DNDSHeartbeatMetricsRecord *)self enabledSleepMode]) {
    uint64_t v14 = @"YES";
  }
  else {
    uint64_t v14 = @"NO";
  }
  objc_msgSend(v23, "stringWithFormat:", @"<%@: %p; enabled: %@; manuallyEnabled: %@; numberOfSessions: %@; numberOfManualSessions: %@; enabledFromControlCenterPhone: %@; enabledFromControlCenterWatch: %@; enabledForOneHour: %@; enabledUntilEvening: %@; enabledUntilMorning: %@; enabledAtLocation: %@; enabledDuringEvent: %@; enabledDrivingMode: %@; enabledSleepMode: %@>",
    v22,
    self,
    v21,
    v20,
    v19,
    v5,
    v18,
    v17,
    v8,
    v9,
    v10,
    v11,
    v12,
    v13,
  uint64_t v15 = v14);

  return (NSString *)v15;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [DNDSMutableHeartbeatMetricsRecord alloc];
  return [(DNDSHeartbeatMetricsRecord *)v4 _initWithRecord:self];
}

+ (id)migrateDictionaryRepresentation:(id)a3 fromVersionNumber:(unint64_t)a4 toVersionNumber:(unint64_t)a5
{
  id v5 = a3;
  return v5;
}

+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4
{
  id v4 = a3;
  unsigned int v21 = objc_msgSend(v4, "bs_BOOLForKey:", @"enabled");
  unsigned int v19 = objc_msgSend(v4, "bs_BOOLForKey:", @"manuallyEnabled");
  id v5 = objc_msgSend(v4, "bs_safeObjectForKey:ofType:", @"numOfSessions", objc_opt_class());
  uint64_t v6 = objc_msgSend(v4, "bs_safeObjectForKey:ofType:", @"numOfManualSessions", objc_opt_class());
  unsigned int v18 = objc_msgSend(v4, "bs_BOOLForKey:", @"enabledFromControlCenterPhone");
  unsigned int v17 = objc_msgSend(v4, "bs_BOOLForKey:", @"enabledFromControlCenterWatch");
  char v7 = objc_msgSend(v4, "bs_BOOLForKey:", @"enabledForOneHour");
  char v8 = objc_msgSend(v4, "bs_BOOLForKey:", @"enabledUntilEvening");
  char v9 = objc_msgSend(v4, "bs_BOOLForKey:", @"enabledUntilMorning");
  char v10 = objc_msgSend(v4, "bs_BOOLForKey:", @"enabledAtLocation");
  char v11 = objc_msgSend(v4, "bs_BOOLForKey:", @"enabledDuringEvent");
  char v12 = objc_msgSend(v4, "bs_BOOLForKey:", @"enabledDrivingMode");
  char v13 = objc_msgSend(v4, "bs_BOOLForKey:", @"enabledSleepMode");

  BYTE6(v16) = v13;
  BYTE5(v16) = v12;
  BYTE4(v16) = v11;
  BYTE3(v16) = v10;
  BYTE2(v16) = v9;
  BYTE1(v16) = v8;
  LOBYTE(v16) = v7;
  uint64_t v14 = objc_msgSend(objc_alloc((Class)a1), "_initWithEnabled:manuallyEnabled:numberOfSessions:numberOfManualSessions:enabledFromControlCenterPhone:enabledFromControlCenterWatch:enabledForOneHour:enabledUntilEvening:enabledUntilMorning:enabledAtLocation:enabledDuringEvent:enabledDrivingMode:enabledSleepMode:", v21, v19, v5, v6, v18, v17, v16);

  return v14;
}

- (id)dictionaryRepresentationWithContext:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", a3);
  id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[DNDSHeartbeatMetricsRecord enabled](self, "enabled"));
  [v4 setObject:v5 forKey:@"enabled"];

  uint64_t v6 = objc_msgSend(NSNumber, "numberWithBool:", -[DNDSHeartbeatMetricsRecord manuallyEnabled](self, "manuallyEnabled"));
  [v4 setObject:v6 forKey:@"manuallyEnabled"];

  char v7 = [(DNDSHeartbeatMetricsRecord *)self numberOfSessions];
  [v4 setObject:v7 forKey:@"numOfSessions"];

  char v8 = [(DNDSHeartbeatMetricsRecord *)self numberOfManualSessions];
  [v4 setObject:v8 forKey:@"numOfManualSessions"];

  char v9 = objc_msgSend(NSNumber, "numberWithBool:", -[DNDSHeartbeatMetricsRecord enabledFromControlCenterPhone](self, "enabledFromControlCenterPhone"));
  [v4 setObject:v9 forKey:@"enabledFromControlCenterPhone"];

  char v10 = objc_msgSend(NSNumber, "numberWithBool:", -[DNDSHeartbeatMetricsRecord enabledFromControlCenterWatch](self, "enabledFromControlCenterWatch"));
  [v4 setObject:v10 forKey:@"enabledFromControlCenterWatch"];

  char v11 = objc_msgSend(NSNumber, "numberWithBool:", -[DNDSHeartbeatMetricsRecord enabledForOneHour](self, "enabledForOneHour"));
  [v4 setObject:v11 forKey:@"enabledForOneHour"];

  char v12 = objc_msgSend(NSNumber, "numberWithBool:", -[DNDSHeartbeatMetricsRecord enabledUntilEvening](self, "enabledUntilEvening"));
  [v4 setObject:v12 forKey:@"enabledUntilEvening"];

  char v13 = objc_msgSend(NSNumber, "numberWithBool:", -[DNDSHeartbeatMetricsRecord enabledUntilMorning](self, "enabledUntilMorning"));
  [v4 setObject:v13 forKey:@"enabledUntilMorning"];

  uint64_t v14 = objc_msgSend(NSNumber, "numberWithBool:", -[DNDSHeartbeatMetricsRecord enabledAtLocation](self, "enabledAtLocation"));
  [v4 setObject:v14 forKey:@"enabledAtLocation"];

  uint64_t v15 = objc_msgSend(NSNumber, "numberWithBool:", -[DNDSHeartbeatMetricsRecord enabledDuringEvent](self, "enabledDuringEvent"));
  [v4 setObject:v15 forKey:@"enabledDuringEvent"];

  uint64_t v16 = objc_msgSend(NSNumber, "numberWithBool:", -[DNDSHeartbeatMetricsRecord enabledDrivingMode](self, "enabledDrivingMode"));
  [v4 setObject:v16 forKey:@"enabledDrivingMode"];

  unsigned int v17 = objc_msgSend(NSNumber, "numberWithBool:", -[DNDSHeartbeatMetricsRecord enabledSleepMode](self, "enabledSleepMode"));
  [v4 setObject:v17 forKey:@"enabledSleepMode"];

  return v4;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (BOOL)manuallyEnabled
{
  return self->_manuallyEnabled;
}

- (NSNumber)numberOfSessions
{
  return self->_numberOfSessions;
}

- (NSNumber)numberOfManualSessions
{
  return self->_numberOfManualSessions;
}

- (BOOL)enabledFromControlCenterPhone
{
  return self->_enabledFromControlCenterPhone;
}

- (BOOL)enabledFromControlCenterWatch
{
  return self->_enabledFromControlCenterWatch;
}

- (BOOL)enabledForOneHour
{
  return self->_enabledForOneHour;
}

- (BOOL)enabledUntilEvening
{
  return self->_enabledUntilEvening;
}

- (BOOL)enabledUntilMorning
{
  return self->_enabledUntilMorning;
}

- (BOOL)enabledAtLocation
{
  return self->_enabledAtLocation;
}

- (BOOL)enabledDuringEvent
{
  return self->_enabledDuringEvent;
}

- (BOOL)enabledDrivingMode
{
  return self->_enabledDrivingMode;
}

- (BOOL)enabledSleepMode
{
  return self->_enabledSleepMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberOfManualSessions, 0);
  objc_storeStrong((id *)&self->_numberOfSessions, 0);
}

@end