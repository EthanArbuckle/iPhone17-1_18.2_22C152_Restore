@interface DNDSModeAssertionLifetimeRecord
+ (id)recordForAssertionLifetime:(id)a3;
+ (id)recordForDictionary:(id)a3 keys:(id *)a4;
- (NSNumber)endDate;
- (NSNumber)latitude;
- (NSNumber)longitude;
- (NSNumber)occurrenceDate;
- (NSNumber)onlyDuringEvent;
- (NSNumber)radius;
- (NSNumber)startDate;
- (NSString)behavior;
- (NSString)eventUniqueID;
- (NSString)lifetimeType;
- (NSString)regionIdentifier;
- (NSString)scheduleIdentifier;
- (id)dictionaryWithKeys:(id *)a3 options:(unint64_t)a4;
- (id)object;
- (void)object;
- (void)setBehavior:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setEventUniqueID:(id)a3;
- (void)setLatitude:(id)a3;
- (void)setLifetimeType:(id)a3;
- (void)setLongitude:(id)a3;
- (void)setOccurrenceDate:(id)a3;
- (void)setOnlyDuringEvent:(id)a3;
- (void)setRadius:(id)a3;
- (void)setRegionIdentifier:(id)a3;
- (void)setScheduleIdentifier:(id)a3;
- (void)setStartDate:(id)a3;
@end

@implementation DNDSModeAssertionLifetimeRecord

+ (id)recordForDictionary:(id)a3 keys:(id *)a4
{
  if (a3)
  {
    id v5 = a3;
    v6 = objc_alloc_init(DNDSModeAssertionLifetimeRecord);
    v7 = objc_msgSend(v5, "bs_safeStringForKey:", a4->var3.var0);
    [(DNDSModeAssertionLifetimeRecord *)v6 setLifetimeType:v7];

    v8 = objc_msgSend(v5, "bs_safeStringForKey:", a4->var3.var1);
    [(DNDSModeAssertionLifetimeRecord *)v6 setEventUniqueID:v8];

    v9 = objc_msgSend(v5, "bs_safeNumberForKey:", a4->var3.var2);
    [(DNDSModeAssertionLifetimeRecord *)v6 setOccurrenceDate:v9];

    v10 = objc_msgSend(v5, "bs_safeNumberForKey:", a4->var3.var3);
    [(DNDSModeAssertionLifetimeRecord *)v6 setOnlyDuringEvent:v10];

    v11 = objc_msgSend(v5, "bs_safeNumberForKey:", a4->var3.var4);
    [(DNDSModeAssertionLifetimeRecord *)v6 setStartDate:v11];

    v12 = objc_msgSend(v5, "bs_safeNumberForKey:", a4->var3.var5);
    [(DNDSModeAssertionLifetimeRecord *)v6 setEndDate:v12];

    v13 = objc_msgSend(v5, "bs_safeStringForKey:", a4->var3.var6);
    [(DNDSModeAssertionLifetimeRecord *)v6 setScheduleIdentifier:v13];

    v14 = objc_msgSend(v5, "bs_safeStringForKey:", a4->var3.var7);
    [(DNDSModeAssertionLifetimeRecord *)v6 setBehavior:v14];

    v15 = objc_msgSend(v5, "bs_safeNumberForKey:", a4->var3.var8);
    [(DNDSModeAssertionLifetimeRecord *)v6 setLatitude:v15];

    v16 = objc_msgSend(v5, "bs_safeNumberForKey:", a4->var3.var9);
    [(DNDSModeAssertionLifetimeRecord *)v6 setLongitude:v16];

    v17 = objc_msgSend(v5, "bs_safeNumberForKey:", a4->var3.var10);
    [(DNDSModeAssertionLifetimeRecord *)v6 setRadius:v17];

    v18 = objc_msgSend(v5, "bs_safeStringForKey:", a4->var3.var11);

    [(DNDSModeAssertionLifetimeRecord *)v6 setRegionIdentifier:v18];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)dictionaryWithKeys:(id *)a3 options:(unint64_t)a4
{
  char v4 = a4;
  v7 = [MEMORY[0x1E4F1CA60] dictionary];
  v8 = [(DNDSModeAssertionLifetimeRecord *)self lifetimeType];
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v8, a3->var3.var0);

  v9 = [(DNDSModeAssertionLifetimeRecord *)self eventUniqueID];
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v9, a3->var3.var1);

  v10 = [(DNDSModeAssertionLifetimeRecord *)self occurrenceDate];
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v10, a3->var3.var2);

  v11 = [(DNDSModeAssertionLifetimeRecord *)self onlyDuringEvent];
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v11, a3->var3.var3);

  v12 = [(DNDSModeAssertionLifetimeRecord *)self startDate];
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v12, a3->var3.var4);

  v13 = [(DNDSModeAssertionLifetimeRecord *)self endDate];
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v13, a3->var3.var5);

  v14 = [(DNDSModeAssertionLifetimeRecord *)self scheduleIdentifier];
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v14, a3->var3.var6);

  v15 = [(DNDSModeAssertionLifetimeRecord *)self behavior];
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v15, a3->var3.var7);

  v16 = [(DNDSModeAssertionLifetimeRecord *)self latitude];
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v16, a3->var3.var8);

  v17 = [(DNDSModeAssertionLifetimeRecord *)self longitude];
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v17, a3->var3.var9);

  v18 = [(DNDSModeAssertionLifetimeRecord *)self radius];
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v18, a3->var3.var10);

  v19 = [(DNDSModeAssertionLifetimeRecord *)self regionIdentifier];
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v19, a3->var3.var11);

  if (v4)
  {
    v20 = [(DNDSModeAssertionLifetimeRecord *)self startDate];
    v21 = [NSString stringWithFormat:@"%@Local", a3->var3.var4];
    objc_msgSend(v7, "dnds_setSafeLocalDateForTimestamp:key:", v20, v21);

    v22 = [(DNDSModeAssertionLifetimeRecord *)self endDate];
    v23 = [NSString stringWithFormat:@"%@Local", a3->var3.var5];
    objc_msgSend(v7, "dnds_setSafeLocalDateForTimestamp:key:", v22, v23);
  }
  return v7;
}

+ (id)recordForAssertionLifetime:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    char v4 = objc_alloc_init(DNDSModeAssertionLifetimeRecord);
    uint64_t v5 = [v3 lifetimeType];
    v6 = objc_msgSend(NSString, "dnds_stringForLifetimeType:", v5);
    [(DNDSModeAssertionLifetimeRecord *)v4 setLifetimeType:v6];

    switch(v5)
    {
      case 1:
        id v7 = v3;
        v8 = [v7 eventUniqueID];
        [(DNDSModeAssertionLifetimeRecord *)v4 setEventUniqueID:v8];

        v9 = NSNumber;
        v10 = [v7 occurrenceDate];
        v11 = objc_msgSend(v9, "dnds_safeNumberWithDate:", v10);
        [(DNDSModeAssertionLifetimeRecord *)v4 setOccurrenceDate:v11];

        v12 = NSNumber;
        uint64_t v13 = [v7 isOnlyDuringEvent];

        v14 = [v12 numberWithBool:v13];
        [(DNDSModeAssertionLifetimeRecord *)v4 setOnlyDuringEvent:v14];
        goto LABEL_8;
      case 2:
        v15 = NSNumber;
        id v16 = v3;
        v17 = [v16 dateInterval];
        v18 = [v17 startDate];
        v19 = objc_msgSend(v15, "dnds_numberWithDate:", v18);
        [(DNDSModeAssertionLifetimeRecord *)v4 setStartDate:v19];

        v20 = NSNumber;
        v14 = [v16 dateInterval];

        v21 = [v14 endDate];
        v22 = objc_msgSend(v20, "dnds_numberWithDate:", v21);
        [(DNDSModeAssertionLifetimeRecord *)v4 setEndDate:v22];

        goto LABEL_8;
      case 4:
        id v23 = v3;
        v24 = [v23 scheduleIdentifier];
        [(DNDSModeAssertionLifetimeRecord *)v4 setScheduleIdentifier:v24];

        v25 = NSString;
        uint64_t v26 = [v23 behavior];

        v14 = objc_msgSend(v25, "dnds_stringForScheduleLifetimeBehavior:", v26);
        [(DNDSModeAssertionLifetimeRecord *)v4 setBehavior:v14];
        goto LABEL_8;
      case 5:
        v27 = NSNumber;
        id v28 = v3;
        v29 = [v28 region];
        [v29 center];
        v30 = objc_msgSend(v27, "numberWithDouble:");
        [(DNDSModeAssertionLifetimeRecord *)v4 setLatitude:v30];

        v31 = NSNumber;
        v32 = [v28 region];
        [v32 center];
        v34 = [v31 numberWithDouble:v33];
        [(DNDSModeAssertionLifetimeRecord *)v4 setLongitude:v34];

        v35 = NSNumber;
        v36 = [v28 region];
        [v36 radius];
        v37 = objc_msgSend(v35, "numberWithDouble:");
        [(DNDSModeAssertionLifetimeRecord *)v4 setRadius:v37];

        v14 = [v28 region];

        v38 = [v14 identifier];
        [(DNDSModeAssertionLifetimeRecord *)v4 setRegionIdentifier:v38];

LABEL_8:
        break;
      default:
        break;
    }
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (id)object
{
  id v3 = [(DNDSModeAssertionLifetimeRecord *)self lifetimeType];
  uint64_t v4 = objc_msgSend(v3, "dnds_lifetimeTypeValue");

  switch(v4)
  {
    case 1:
      uint64_t v5 = [(DNDSModeAssertionLifetimeRecord *)self eventUniqueID];
      v6 = [(DNDSModeAssertionLifetimeRecord *)self occurrenceDate];
      id v7 = objc_msgSend(v6, "dnds_dateValue");

      v8 = [(DNDSModeAssertionLifetimeRecord *)self onlyDuringEvent];
      uint64_t v9 = [v8 BOOLValue];

      if (!v5) {
        goto LABEL_17;
      }
      uint64_t v10 = [objc_alloc(MEMORY[0x1E4F5F608]) initWithEventUniqueID:v5 occurrenceDate:v7 onlyDuringEvent:v9];
      goto LABEL_16;
    case 2:
      v11 = [(DNDSModeAssertionLifetimeRecord *)self startDate];
      uint64_t v5 = objc_msgSend(v11, "dnds_dateValue");

      v12 = [(DNDSModeAssertionLifetimeRecord *)self endDate];
      id v7 = objc_msgSend(v12, "dnds_dateValue");

      uint64_t v13 = 0;
      if (v5 && v7)
      {
        v14 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v5 endDate:v7];
        uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F5F618]) initWithDateInterval:v14];
      }
      goto LABEL_18;
    case 3:
      uint64_t v13 = [MEMORY[0x1E4F5F610] sharedInstance];
      goto LABEL_23;
    case 4:
      uint64_t v5 = [(DNDSModeAssertionLifetimeRecord *)self scheduleIdentifier];
      v15 = [(DNDSModeAssertionLifetimeRecord *)self behavior];
      id v7 = v15;
      uint64_t v13 = 0;
      if (!v5 || !v15) {
        goto LABEL_18;
      }
      uint64_t v16 = objc_msgSend(v15, "dnds_scheduleLifetimeBehaviorValue");
      uint64_t v10 = [objc_alloc(MEMORY[0x1E4F5F640]) initWithScheduleIdentifier:v5 behavior:v16];
      goto LABEL_16;
    case 5:
      uint64_t v17 = [(DNDSModeAssertionLifetimeRecord *)self latitude];
      if (!v17) {
        goto LABEL_20;
      }
      v18 = (void *)v17;
      uint64_t v19 = [(DNDSModeAssertionLifetimeRecord *)self radius];
      if (!v19)
      {

        goto LABEL_20;
      }
      v20 = (void *)v19;
      v21 = [(DNDSModeAssertionLifetimeRecord *)self regionIdentifier];

      if (!v21)
      {
LABEL_20:
        v31 = DNDSLogAssertionStore;
        if (os_log_type_enabled((os_log_t)DNDSLogAssertionStore, OS_LOG_TYPE_FAULT)) {
          [(DNDSModeAssertionLifetimeRecord *)(uint64_t)self object];
        }
LABEL_22:
        uint64_t v13 = 0;
        goto LABEL_23;
      }
      v22 = [(DNDSModeAssertionLifetimeRecord *)self latitude];
      [v22 doubleValue];
      double v24 = v23;
      v25 = [(DNDSModeAssertionLifetimeRecord *)self longitude];
      [v25 doubleValue];
      double v27 = v26;

      id v28 = [(DNDSModeAssertionLifetimeRecord *)self radius];
      [v28 doubleValue];
      double v30 = v29;

      uint64_t v5 = [(DNDSModeAssertionLifetimeRecord *)self regionIdentifier];
      id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1E5A8]), "initWithCenter:radius:identifier:", v5, v24, v27, v30);
      if (v7)
      {
        uint64_t v10 = [objc_alloc(MEMORY[0x1E4F5F628]) initWithRegion:v7];
LABEL_16:
        uint64_t v13 = (void *)v10;
      }
      else
      {
LABEL_17:
        uint64_t v13 = 0;
      }
LABEL_18:

LABEL_23:
      return v13;
    default:
      goto LABEL_22;
  }
}

- (NSString)lifetimeType
{
  return self->_lifetimeType;
}

- (void)setLifetimeType:(id)a3
{
}

- (NSString)eventUniqueID
{
  return self->_eventUniqueID;
}

- (void)setEventUniqueID:(id)a3
{
}

- (NSNumber)occurrenceDate
{
  return self->_occurrenceDate;
}

- (void)setOccurrenceDate:(id)a3
{
}

- (NSNumber)onlyDuringEvent
{
  return self->_onlyDuringEvent;
}

- (void)setOnlyDuringEvent:(id)a3
{
}

- (NSNumber)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSNumber)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (NSString)scheduleIdentifier
{
  return self->_scheduleIdentifier;
}

- (void)setScheduleIdentifier:(id)a3
{
}

- (NSString)behavior
{
  return self->_behavior;
}

- (void)setBehavior:(id)a3
{
}

- (NSNumber)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(id)a3
{
}

- (NSNumber)longitude
{
  return self->_longitude;
}

- (void)setLongitude:(id)a3
{
}

- (NSNumber)radius
{
  return self->_radius;
}

- (void)setRadius:(id)a3
{
}

- (NSString)regionIdentifier
{
  return self->_regionIdentifier;
}

- (void)setRegionIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionIdentifier, 0);
  objc_storeStrong((id *)&self->_radius, 0);
  objc_storeStrong((id *)&self->_longitude, 0);
  objc_storeStrong((id *)&self->_latitude, 0);
  objc_storeStrong((id *)&self->_behavior, 0);
  objc_storeStrong((id *)&self->_scheduleIdentifier, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_onlyDuringEvent, 0);
  objc_storeStrong((id *)&self->_occurrenceDate, 0);
  objc_storeStrong((id *)&self->_eventUniqueID, 0);
  objc_storeStrong((id *)&self->_lifetimeType, 0);
}

- (void)object
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D3052000, a2, OS_LOG_TYPE_FAULT, "Missing parameters of region trigger: %@", (uint8_t *)&v2, 0xCu);
}

@end