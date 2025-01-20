@interface DNDSMetricsRecord
+ (id)backingStoreWithFileURL:(id)a3;
+ (id)migrateDictionaryRepresentation:(id)a3 fromVersionNumber:(unint64_t)a4 toVersionNumber:(unint64_t)a5;
+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4;
- (BOOL)isEqual:(id)a3;
- (DNDSMetricsRecord)init;
- (NSDate)lastDailyHeartbeat;
- (NSDate)lastMonthlyHeartbeat;
- (NSDate)lastWeeklyHeartbeat;
- (NSDictionary)metricsByDay;
- (NSDictionary)metricsByMonth;
- (NSDictionary)metricsByWeek;
- (NSString)description;
- (id)_initWithMetricsByDay:(id)a3 lastDailyHeartbeat:(id)a4 metricsByWeek:(id)a5 lastWeeklyHeartbeat:(id)a6 metricsByMonth:(id)a7 lastMonthlyHeartbeat:(id)a8;
- (id)_initWithRecord:(id)a3;
- (id)dictionaryRepresentationWithContext:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation DNDSMetricsRecord

+ (id)backingStoreWithFileURL:(id)a3
{
  id v4 = a3;
  v5 = [[DNDSJSONBackingStore alloc] initWithRecordClass:a1 fileURL:v4 versionNumber:1];

  return v5;
}

- (DNDSMetricsRecord)init
{
  return (DNDSMetricsRecord *)[(DNDSMetricsRecord *)self _initWithRecord:0];
}

- (id)_initWithRecord:(id)a3
{
  id v4 = a3;
  v5 = [v4 metricsByDay];
  v6 = [v4 lastDailyHeartbeat];
  v7 = [v4 metricsByWeek];
  v8 = [v4 lastWeeklyHeartbeat];
  v9 = [v4 metricsByMonth];
  v10 = [v4 lastMonthlyHeartbeat];

  id v11 = [(DNDSMetricsRecord *)self _initWithMetricsByDay:v5 lastDailyHeartbeat:v6 metricsByWeek:v7 lastWeeklyHeartbeat:v8 metricsByMonth:v9 lastMonthlyHeartbeat:v10];
  return v11;
}

- (id)_initWithMetricsByDay:(id)a3 lastDailyHeartbeat:(id)a4 metricsByWeek:(id)a5 lastWeeklyHeartbeat:(id)a6 metricsByMonth:(id)a7 lastMonthlyHeartbeat:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v46.receiver = self;
  v46.super_class = (Class)DNDSMetricsRecord;
  v20 = [(DNDSMetricsRecord *)&v46 init];
  if (v20)
  {
    v21 = (void *)[v14 copy];
    v22 = v21;
    if (v21) {
      v23 = v21;
    }
    else {
      v23 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1C9E8]);
    }
    metricsByDay = v20->_metricsByDay;
    v20->_metricsByDay = v23;

    v25 = (void *)[v15 copy];
    v26 = v25;
    if (v25)
    {
      v27 = v25;
    }
    else
    {
      v27 = [MEMORY[0x1E4F1C9C8] distantPast];
    }
    lastDailyHeartbeat = v20->_lastDailyHeartbeat;
    v20->_lastDailyHeartbeat = v27;

    v29 = (void *)[v16 copy];
    v30 = v29;
    if (v29) {
      v31 = v29;
    }
    else {
      v31 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1C9E8]);
    }
    metricsByWeek = v20->_metricsByWeek;
    v20->_metricsByWeek = v31;

    v33 = (void *)[v17 copy];
    v34 = v33;
    if (v33)
    {
      v35 = v33;
    }
    else
    {
      v35 = [MEMORY[0x1E4F1C9C8] distantPast];
    }
    lastWeeklyHeartbeat = v20->_lastWeeklyHeartbeat;
    v20->_lastWeeklyHeartbeat = v35;

    v37 = (void *)[v18 copy];
    v38 = v37;
    if (v37) {
      v39 = v37;
    }
    else {
      v39 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1C9E8]);
    }
    metricsByMonth = v20->_metricsByMonth;
    v20->_metricsByMonth = v39;

    v41 = (void *)[v19 copy];
    v42 = v41;
    if (v41)
    {
      v43 = v41;
    }
    else
    {
      v43 = [MEMORY[0x1E4F1C9C8] distantPast];
    }
    lastMonthlyHeartbeat = v20->_lastMonthlyHeartbeat;
    v20->_lastMonthlyHeartbeat = v43;
  }
  return v20;
}

- (unint64_t)hash
{
  v3 = [(DNDSMetricsRecord *)self metricsByDay];
  uint64_t v4 = [v3 hash];
  v5 = [(DNDSMetricsRecord *)self lastDailyHeartbeat];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(DNDSMetricsRecord *)self metricsByWeek];
  uint64_t v8 = [v7 hash];
  v9 = [(DNDSMetricsRecord *)self lastWeeklyHeartbeat];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  id v11 = [(DNDSMetricsRecord *)self metricsByMonth];
  uint64_t v12 = [v11 hash];
  v13 = [(DNDSMetricsRecord *)self lastMonthlyHeartbeat];
  unint64_t v14 = v10 ^ v12 ^ [v13 hash];

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (DNDSMetricsRecord *)a3;
  if (self == v5)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = v5;
      v7 = [(DNDSMetricsRecord *)self metricsByDay];
      uint64_t v8 = [(DNDSMetricsRecord *)v6 metricsByDay];
      if (v7 != v8)
      {
        uint64_t v9 = [(DNDSMetricsRecord *)self metricsByDay];
        if (!v9)
        {
          char v13 = 0;
          goto LABEL_73;
        }
        uint64_t v10 = (void *)v9;
        id v11 = [(DNDSMetricsRecord *)v6 metricsByDay];
        if (!v11)
        {
          char v13 = 0;
LABEL_72:

          goto LABEL_73;
        }
        v3 = [(DNDSMetricsRecord *)self metricsByDay];
        uint64_t v12 = [(DNDSMetricsRecord *)v6 metricsByDay];
        if (![v3 isEqual:v12])
        {
          char v13 = 0;
LABEL_71:

          goto LABEL_72;
        }
        v75 = v10;
        v76 = v12;
        v77 = v3;
        v78 = v11;
      }
      unint64_t v14 = [(DNDSMetricsRecord *)self lastDailyHeartbeat];
      id v15 = [(DNDSMetricsRecord *)v6 lastDailyHeartbeat];
      if (v14 != v15)
      {
        uint64_t v16 = [(DNDSMetricsRecord *)self lastDailyHeartbeat];
        if (v16)
        {
          id v17 = (void *)v16;
          v79 = v14;
          uint64_t v18 = [(DNDSMetricsRecord *)v6 lastDailyHeartbeat];
          if (v18)
          {
            v3 = (void *)v18;
            id v19 = [(DNDSMetricsRecord *)self lastDailyHeartbeat];
            v20 = [(DNDSMetricsRecord *)v6 lastDailyHeartbeat];
            if ([v19 isEqual:v20])
            {
              v72 = v20;
              v73 = v19;
              v69 = v3;
              v70 = v17;
              goto LABEL_17;
            }
          }
        }
        else
        {
        }
LABEL_69:
        char v13 = 0;
        goto LABEL_70;
      }
      v79 = v14;
LABEL_17:
      v21 = [(DNDSMetricsRecord *)self metricsByWeek];
      v22 = [(DNDSMetricsRecord *)v6 metricsByWeek];
      if (v21 == v22) {
        goto LABEL_25;
      }
      uint64_t v23 = [(DNDSMetricsRecord *)self metricsByWeek];
      if (v23)
      {
        v71 = (void *)v23;
        uint64_t v24 = [(DNDSMetricsRecord *)v6 metricsByWeek];
        if (v24)
        {
          v67 = (void *)v24;
          v3 = [(DNDSMetricsRecord *)self metricsByWeek];
          v25 = [(DNDSMetricsRecord *)v6 metricsByWeek];
          if ([v3 isEqual:v25])
          {
            v62 = v25;
            v63 = v3;
LABEL_25:
            v26 = [(DNDSMetricsRecord *)self lastWeeklyHeartbeat];
            v74 = [(DNDSMetricsRecord *)v6 lastWeeklyHeartbeat];
            if (v26 == v74)
            {
              v68 = v22;
              v30 = v21;
LABEL_33:
              uint64_t v31 = [(DNDSMetricsRecord *)self metricsByMonth];
              v65 = [(DNDSMetricsRecord *)v6 metricsByMonth];
              v66 = (void *)v31;
              if ((void *)v31 == v65)
              {
                v33 = v30;
                goto LABEL_44;
              }
              uint64_t v32 = [(DNDSMetricsRecord *)self metricsByMonth];
              v33 = v30;
              if (v32)
              {
                v56 = (void *)v32;
                v60 = v26;
                v34 = [(DNDSMetricsRecord *)v6 metricsByMonth];
                v35 = v66;
                if (v34)
                {
                  id v53 = v34;
                  v36 = [(DNDSMetricsRecord *)self metricsByMonth];
                  v37 = [(DNDSMetricsRecord *)v6 metricsByMonth];
                  if ([v36 isEqual:v37])
                  {
                    v51 = v37;
                    v52 = v36;
                    v26 = v60;
LABEL_44:
                    v39 = [(DNDSMetricsRecord *)self lastMonthlyHeartbeat];
                    uint64_t v40 = [(DNDSMetricsRecord *)v6 lastMonthlyHeartbeat];
                    v54 = v3;
                    v57 = v33;
                    if (v39 == (void *)v40)
                    {

                      char v13 = 1;
                    }
                    else
                    {
                      v61 = (void *)v40;
                      uint64_t v41 = [(DNDSMetricsRecord *)self lastMonthlyHeartbeat];
                      if (v41)
                      {
                        v50 = (void *)v41;
                        v42 = [(DNDSMetricsRecord *)v6 lastMonthlyHeartbeat];
                        if (v42)
                        {
                          v49 = v42;
                          v43 = [(DNDSMetricsRecord *)self lastMonthlyHeartbeat];
                          v44 = [(DNDSMetricsRecord *)v6 lastMonthlyHeartbeat];
                          char v13 = [v43 isEqual:v44];

                          v42 = v49;
                        }
                        else
                        {
                          char v13 = 0;
                        }
                      }
                      else
                      {

                        char v13 = 0;
                      }
                    }
                    if (v66 != v65)
                    {
                    }
                    if (v26 != v74)
                    {
                    }
                    if (v57 != v68)
                    {
                    }
                    if (v79 != v15)
                    {
                    }
LABEL_70:
                    v3 = v77;
                    id v11 = v78;
                    uint64_t v10 = v75;
                    uint64_t v12 = v76;
                    if (v7 != v8) {
                      goto LABEL_71;
                    }
LABEL_73:

                    goto LABEL_74;
                  }

                  v34 = v53;
                  v35 = v66;
                }

                v47 = v74;
                objc_super v46 = v60;
              }
              else
              {

                objc_super v46 = v26;
                v47 = v74;
              }
              if (v46 != v47)
              {
              }
              v45 = v73;
              if (v33 != v68)
              {
              }
              v38 = v79;
              if (v79 == v15) {
                goto LABEL_67;
              }
LABEL_65:

LABEL_66:
LABEL_67:

              goto LABEL_68;
            }
            uint64_t v27 = [(DNDSMetricsRecord *)self lastWeeklyHeartbeat];
            if (v27)
            {
              v64 = (void *)v27;
              uint64_t v28 = [(DNDSMetricsRecord *)v6 lastWeeklyHeartbeat];
              if (v28)
              {
                v58 = (void *)v28;
                v59 = v26;
                v29 = [(DNDSMetricsRecord *)self lastWeeklyHeartbeat];
                v3 = [(DNDSMetricsRecord *)v6 lastWeeklyHeartbeat];
                if ([v29 isEqual:v3])
                {
                  v68 = v22;
                  v30 = v21;
                  v55 = v29;
                  v26 = v59;
                  goto LABEL_33;
                }

LABEL_51:
                if (v21 == v22)
                {
                }
                else
                {
                }
                v38 = v79;
                v45 = v73;
                if (v79 == v15) {
                  goto LABEL_67;
                }
                goto LABEL_65;
              }
            }
            goto LABEL_51;
          }
        }
      }

      v38 = v79;
      if (v79 == v15)
      {

LABEL_68:
        goto LABEL_69;
      }

      goto LABEL_66;
    }
    char v13 = 0;
  }
LABEL_74:

  return v13;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(DNDSMetricsRecord *)self metricsByDay];
  uint64_t v6 = [(DNDSMetricsRecord *)self lastDailyHeartbeat];
  v7 = [(DNDSMetricsRecord *)self metricsByWeek];
  uint64_t v8 = [(DNDSMetricsRecord *)self lastWeeklyHeartbeat];
  uint64_t v9 = [(DNDSMetricsRecord *)self metricsByMonth];
  uint64_t v10 = [(DNDSMetricsRecord *)self lastMonthlyHeartbeat];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; metricsByDay: %@; lastDailyHeartbeat: %@; metricsByWeek: %@; lastWeeklyHeartbeat: %@; metricsByMonth: %@; lastMonthlyHeartbeat: %@>",
    v4,
    self,
    v5,
    v6,
    v7,
    v8,
    v9,
  id v11 = v10);

  return (NSString *)v11;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [DNDSMutableMetricsRecord alloc];
  return [(DNDSMetricsRecord *)v4 _initWithRecord:self];
}

+ (id)migrateDictionaryRepresentation:(id)a3 fromVersionNumber:(unint64_t)a4 toVersionNumber:(unint64_t)a5
{
  id v5 = a3;
  return v5;
}

+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4
{
  id v5 = a3;
  uint64_t v6 = objc_msgSend(v5, "bs_safeObjectForKey:ofType:", @"metricsByDay", objc_opt_class());
  v7 = (void *)MEMORY[0x1E4F1C9C8];
  uint64_t v8 = objc_msgSend(v5, "bs_safeNumberForKey:", @"lastDailyHeartbeat");
  [v8 doubleValue];
  uint64_t v9 = objc_msgSend(v7, "dateWithTimeIntervalSinceReferenceDate:");

  uint64_t v10 = objc_msgSend(v5, "bs_safeObjectForKey:ofType:", @"metricsByWeek", objc_opt_class());
  id v11 = (void *)MEMORY[0x1E4F1C9C8];
  uint64_t v12 = objc_msgSend(v5, "bs_safeNumberForKey:", @"lastWeeklyHeartbeat");
  [v12 doubleValue];
  char v13 = objc_msgSend(v11, "dateWithTimeIntervalSinceReferenceDate:");

  unint64_t v14 = objc_msgSend(v5, "bs_safeObjectForKey:ofType:", @"metricsByMonth", objc_opt_class());
  id v15 = (void *)MEMORY[0x1E4F1C9C8];
  uint64_t v16 = objc_msgSend(v5, "bs_safeNumberForKey:", @"lastMonthlyHeartbeat");

  [v16 doubleValue];
  id v17 = objc_msgSend(v15, "dateWithTimeIntervalSinceReferenceDate:");

  uint64_t v18 = (void *)[objc_alloc((Class)a1) _initWithMetricsByDay:v6 lastDailyHeartbeat:v9 metricsByWeek:v10 lastWeeklyHeartbeat:v13 metricsByMonth:v14 lastMonthlyHeartbeat:v17];
  return v18;
}

- (id)dictionaryRepresentationWithContext:(id)a3
{
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", a3);
  [v4 setObject:self->_metricsByDay forKey:@"metricsByDay"];
  id v5 = NSNumber;
  [(NSDate *)self->_lastDailyHeartbeat timeIntervalSinceReferenceDate];
  uint64_t v6 = objc_msgSend(v5, "numberWithDouble:");
  [v4 setObject:v6 forKey:@"lastDailyHeartbeat"];

  [v4 setObject:self->_metricsByWeek forKey:@"metricsByWeek"];
  v7 = NSNumber;
  [(NSDate *)self->_lastWeeklyHeartbeat timeIntervalSinceReferenceDate];
  uint64_t v8 = objc_msgSend(v7, "numberWithDouble:");
  [v4 setObject:v8 forKey:@"lastWeeklyHeartbeat"];

  [v4 setObject:self->_metricsByMonth forKey:@"metricsByMonth"];
  uint64_t v9 = NSNumber;
  [(NSDate *)self->_lastMonthlyHeartbeat timeIntervalSinceReferenceDate];
  uint64_t v10 = objc_msgSend(v9, "numberWithDouble:");
  [v4 setObject:v10 forKey:@"lastMonthlyHeartbeat"];

  return v4;
}

- (NSDictionary)metricsByDay
{
  return self->_metricsByDay;
}

- (NSDate)lastDailyHeartbeat
{
  return self->_lastDailyHeartbeat;
}

- (NSDictionary)metricsByWeek
{
  return self->_metricsByWeek;
}

- (NSDate)lastWeeklyHeartbeat
{
  return self->_lastWeeklyHeartbeat;
}

- (NSDictionary)metricsByMonth
{
  return self->_metricsByMonth;
}

- (NSDate)lastMonthlyHeartbeat
{
  return self->_lastMonthlyHeartbeat;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastMonthlyHeartbeat, 0);
  objc_storeStrong((id *)&self->_metricsByMonth, 0);
  objc_storeStrong((id *)&self->_lastWeeklyHeartbeat, 0);
  objc_storeStrong((id *)&self->_metricsByWeek, 0);
  objc_storeStrong((id *)&self->_lastDailyHeartbeat, 0);
  objc_storeStrong((id *)&self->_metricsByDay, 0);
}

@end