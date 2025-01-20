@interface DNDSDailyHeartbeatMetricsRecord
+ (id)migrateDictionaryRepresentation:(id)a3 fromVersionNumber:(unint64_t)a4 toVersionNumber:(unint64_t)a5;
+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4;
- (BOOL)isEqual:(id)a3;
- (DNDSDailyHeartbeatMetricsRecord)init;
- (NSNumber)dayOfWeek;
- (id)_initWithEnabled:(BOOL)a3 manuallyEnabled:(BOOL)a4 numberOfSessions:(id)a5 numberOfManualSessions:(id)a6 enabledFromControlCenterPhone:(BOOL)a7 enabledFromControlCenterWatch:(BOOL)a8 enabledForOneHour:(BOOL)a9 enabledUntilEvening:(BOOL)a10 enabledUntilMorning:(BOOL)a11 enabledAtLocation:(BOOL)a12 enabledDuringEvent:(BOOL)a13 enabledDrivingMode:(BOOL)a14 enabledSleepMode:(BOOL)a15 dayOfWeek:(id)a16;
- (id)_initWithRecord:(id)a3;
- (id)description;
- (id)dictionaryRepresentationWithContext:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation DNDSDailyHeartbeatMetricsRecord

- (DNDSDailyHeartbeatMetricsRecord)init
{
  return (DNDSDailyHeartbeatMetricsRecord *)[(DNDSDailyHeartbeatMetricsRecord *)self _initWithRecord:0];
}

- (id)_initWithRecord:(id)a3
{
  id v3 = a3;
  unsigned int v20 = [v3 enabled];
  unsigned int v19 = [v3 manuallyEnabled];
  v18 = [v3 numberOfSessions];
  v4 = [v3 numberOfManualSessions];
  unsigned int v17 = [v3 enabledFromControlCenterPhone];
  unsigned int v16 = [v3 enabledFromControlCenterWatch];
  char v5 = [v3 enabledForOneHour];
  char v6 = [v3 enabledUntilEvening];
  char v7 = [v3 enabledUntilMorning];
  char v8 = [v3 enabledAtLocation];
  char v9 = [v3 enabledDuringEvent];
  char v10 = [v3 enabledDrivingMode];
  char v11 = [v3 enabledSleepMode];
  v12 = [v3 dayOfWeek];

  BYTE6(v15) = v11;
  BYTE5(v15) = v10;
  BYTE4(v15) = v9;
  BYTE3(v15) = v8;
  BYTE2(v15) = v7;
  BYTE1(v15) = v6;
  LOBYTE(v15) = v5;
  id v13 = -[DNDSDailyHeartbeatMetricsRecord _initWithEnabled:manuallyEnabled:numberOfSessions:numberOfManualSessions:enabledFromControlCenterPhone:enabledFromControlCenterWatch:enabledForOneHour:enabledUntilEvening:enabledUntilMorning:enabledAtLocation:enabledDuringEvent:enabledDrivingMode:enabledSleepMode:dayOfWeek:](self, "_initWithEnabled:manuallyEnabled:numberOfSessions:numberOfManualSessions:enabledFromControlCenterPhone:enabledFromControlCenterWatch:enabledForOneHour:enabledUntilEvening:enabledUntilMorning:enabledAtLocation:enabledDuringEvent:enabledDrivingMode:enabledSleepMode:dayOfWeek:", v20, v19, v18, v4, v17, v16, v15, v12);

  return v13;
}

- (id)_initWithEnabled:(BOOL)a3 manuallyEnabled:(BOOL)a4 numberOfSessions:(id)a5 numberOfManualSessions:(id)a6 enabledFromControlCenterPhone:(BOOL)a7 enabledFromControlCenterWatch:(BOOL)a8 enabledForOneHour:(BOOL)a9 enabledUntilEvening:(BOOL)a10 enabledUntilMorning:(BOOL)a11 enabledAtLocation:(BOOL)a12 enabledDuringEvent:(BOOL)a13 enabledDrivingMode:(BOOL)a14 enabledSleepMode:(BOOL)a15 dayOfWeek:(id)a16
{
  BOOL v28 = a7;
  BOOL v29 = a8;
  BOOL v25 = a4;
  BOOL v16 = a3;
  id v18 = a16;
  v30.receiver = self;
  v30.super_class = (Class)DNDSDailyHeartbeatMetricsRecord;
  BYTE6(v24) = a15;
  BYTE5(v24) = a14;
  BYTE4(v24) = a13;
  BYTE3(v24) = a12;
  BYTE2(v24) = a11;
  LOWORD(v24) = __PAIR16__(a10, a9);
  unsigned int v19 = -[DNDSHeartbeatMetricsRecord _initWithEnabled:manuallyEnabled:numberOfSessions:numberOfManualSessions:enabledFromControlCenterPhone:enabledFromControlCenterWatch:enabledForOneHour:enabledUntilEvening:enabledUntilMorning:enabledAtLocation:enabledDuringEvent:enabledDrivingMode:enabledSleepMode:](&v30, sel__initWithEnabled_manuallyEnabled_numberOfSessions_numberOfManualSessions_enabledFromControlCenterPhone_enabledFromControlCenterWatch_enabledForOneHour_enabledUntilEvening_enabledUntilMorning_enabledAtLocation_enabledDuringEvent_enabledDrivingMode_enabledSleepMode_, v16, v25, a5, a6, v28, v29, v24);
  if (v19)
  {
    uint64_t v20 = [v18 copy];
    v21 = (void *)v20;
    if (v20) {
      v22 = (void *)v20;
    }
    else {
      v22 = &unk_1F2A5D988;
    }
    objc_storeStrong(v19 + 6, v22);
  }
  return v19;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)DNDSDailyHeartbeatMetricsRecord;
  unint64_t v3 = [(DNDSHeartbeatMetricsRecord *)&v7 hash];
  v4 = [(DNDSDailyHeartbeatMetricsRecord *)self dayOfWeek];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (DNDSDailyHeartbeatMetricsRecord *)a3;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = v4;
      v14.receiver = self;
      v14.super_class = (Class)DNDSDailyHeartbeatMetricsRecord;
      if ([(DNDSHeartbeatMetricsRecord *)&v14 isEqual:v5])
      {
        char v6 = [(DNDSDailyHeartbeatMetricsRecord *)self dayOfWeek];
        objc_super v7 = [(DNDSDailyHeartbeatMetricsRecord *)v5 dayOfWeek];
        if (v6 == v7)
        {
          char v12 = 1;
        }
        else
        {
          char v8 = [(DNDSDailyHeartbeatMetricsRecord *)self dayOfWeek];
          if (v8)
          {
            char v9 = [(DNDSDailyHeartbeatMetricsRecord *)v5 dayOfWeek];
            if (v9)
            {
              char v10 = [(DNDSDailyHeartbeatMetricsRecord *)self dayOfWeek];
              char v11 = [(DNDSDailyHeartbeatMetricsRecord *)v5 dayOfWeek];
              char v12 = [v10 isEqual:v11];
            }
            else
            {
              char v12 = 0;
            }
          }
          else
          {
            char v12 = 0;
          }
        }
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }

  return v12;
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v9.receiver = self;
  v9.super_class = (Class)DNDSDailyHeartbeatMetricsRecord;
  unint64_t v5 = [(DNDSHeartbeatMetricsRecord *)&v9 description];
  char v6 = [(DNDSDailyHeartbeatMetricsRecord *)self dayOfWeek];
  objc_super v7 = [v3 stringWithFormat:@"<%@: %p; %@; dayOfWeek: %@>", v4, self, v5, v6];

  return v7;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [DNDSMutableDailyHeartbeatMetricsRecord alloc];
  return [(DNDSDailyHeartbeatMetricsRecord *)v4 _initWithRecord:self];
}

+ (id)migrateDictionaryRepresentation:(id)a3 fromVersionNumber:(unint64_t)a4 toVersionNumber:(unint64_t)a5
{
  id v5 = a3;
  return v5;
}

+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = +[DNDSHeartbeatMetricsRecord newWithDictionaryRepresentation:v6 context:a4];
  char v8 = objc_msgSend(v6, "bs_safeObjectForKey:ofType:", @"dayOfWeek", objc_opt_class());

  id v23 = objc_alloc((Class)a1);
  unsigned int v22 = [v7 enabled];
  unsigned int v21 = [v7 manuallyEnabled];
  objc_super v9 = [v7 numberOfSessions];
  char v10 = [v7 numberOfManualSessions];
  unsigned int v20 = [v7 enabledFromControlCenterPhone];
  unsigned int v19 = [v7 enabledFromControlCenterWatch];
  char v11 = [v7 enabledForOneHour];
  LOBYTE(v6) = [v7 enabledUntilEvening];
  char v12 = [v7 enabledUntilMorning];
  char v13 = [v7 enabledAtLocation];
  char v14 = [v7 enabledDuringEvent];
  char v15 = [v7 enabledDrivingMode];
  BYTE6(v18) = [v7 enabledSleepMode];
  BYTE5(v18) = v15;
  BYTE4(v18) = v14;
  BYTE3(v18) = v13;
  BYTE2(v18) = v12;
  BYTE1(v18) = (_BYTE)v6;
  LOBYTE(v18) = v11;
  BOOL v16 = objc_msgSend(v23, "_initWithEnabled:manuallyEnabled:numberOfSessions:numberOfManualSessions:enabledFromControlCenterPhone:enabledFromControlCenterWatch:enabledForOneHour:enabledUntilEvening:enabledUntilMorning:enabledAtLocation:enabledDuringEvent:enabledDrivingMode:enabledSleepMode:dayOfWeek:", v22, v21, v9, v10, v20, v19, v18, v8);

  return v16;
}

- (id)dictionaryRepresentationWithContext:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)DNDSDailyHeartbeatMetricsRecord;
  uint64_t v4 = [(DNDSHeartbeatMetricsRecord *)&v8 dictionaryRepresentationWithContext:a3];
  id v5 = (void *)[v4 mutableCopy];

  id v6 = [(DNDSDailyHeartbeatMetricsRecord *)self dayOfWeek];
  [v5 setObject:v6 forKey:@"dayOfWeek"];

  return v5;
}

- (NSNumber)dayOfWeek
{
  return self->_dayOfWeek;
}

- (void).cxx_destruct
{
}

@end