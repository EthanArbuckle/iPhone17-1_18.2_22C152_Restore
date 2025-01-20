@interface CRKEventLog
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTimeline:(id)a3;
- (CRKEventLog)init;
- (CRKEventLog)initWithCoder:(id)a3;
- (CRKEventLog)initWithStartDate:(id)a3 endDate:(id)a4;
- (CRKEventLog)initWithStartDate:(id)a3 endDate:(id)a4 eventDatas:(id)a5;
- (CRKEventLog)initWithStartDate:(id)a3 endDate:(id)a4 events:(id)a5;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSSet)events;
- (NSSet)passedInEventDatas;
- (NSSet)passedInEvents;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setPassedInEventDatas:(id)a3;
- (void)setPassedInEvents:(id)a3;
- (void)setStartDate:(id)a3;
@end

@implementation CRKEventLog

- (CRKEventLog)init
{
  v3 = [MEMORY[0x263EFF910] date];
  v4 = [MEMORY[0x263EFFA08] set];
  v5 = [(CRKEventLog *)self initWithStartDate:v3 endDate:v3 events:v4];

  return v5;
}

- (CRKEventLog)initWithStartDate:(id)a3 endDate:(id)a4 events:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v11)
  {
    v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"CRKEventLog.m", 34, @"Invalid parameter not satisfying: %@", @"events" object file lineNumber description];
  }
  v12 = [(CRKEventLog *)self initWithStartDate:v9 endDate:v10];
  if (v12)
  {
    uint64_t v13 = [v11 copy];
    passedInEvents = v12->_passedInEvents;
    v12->_passedInEvents = (NSSet *)v13;
  }
  return v12;
}

- (CRKEventLog)initWithStartDate:(id)a3 endDate:(id)a4 eventDatas:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v11)
  {
    v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"CRKEventLog.m", 43, @"Invalid parameter not satisfying: %@", @"eventDatas" object file lineNumber description];
  }
  v12 = [(CRKEventLog *)self initWithStartDate:v9 endDate:v10];
  if (v12)
  {
    uint64_t v13 = [v11 copy];
    passedInEventDatas = v12->_passedInEventDatas;
    v12->_passedInEventDatas = (NSSet *)v13;
  }
  return v12;
}

- (CRKEventLog)initWithStartDate:(id)a3 endDate:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"CRKEventLog.m", 52, @"Invalid parameter not satisfying: %@", @"startDate" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v15 = [MEMORY[0x263F08690] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"CRKEventLog.m", 53, @"Invalid parameter not satisfying: %@", @"endDate" object file lineNumber description];

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)CRKEventLog;
  id v11 = [(CRKEventLog *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_startDate, a3);
    objc_storeStrong((id *)&v12->_endDate, a4);
  }

  return v12;
}

- (NSSet)events
{
  v3 = [(CRKEventLog *)self passedInEvents];

  if (v3)
  {
    v4 = [(CRKEventLog *)self passedInEvents];
  }
  else
  {
    mLazilyLoadedEvents = self->mLazilyLoadedEvents;
    if (!mLazilyLoadedEvents)
    {
      v6 = [(CRKEventLog *)self passedInEventDatas];
      objc_msgSend(v6, "crk_mapUsingBlock:", &__block_literal_global_63);
      v7 = (NSSet *)objc_claimAutoreleasedReturnValue();
      id v8 = self->mLazilyLoadedEvents;
      self->mLazilyLoadedEvents = v7;

      mLazilyLoadedEvents = self->mLazilyLoadedEvents;
    }
    v4 = mLazilyLoadedEvents;
  }

  return v4;
}

id __21__CRKEventLog_events__block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263F08928];
  id v3 = a2;
  id v8 = 0;
  v4 = objc_msgSend(v2, "cat_unarchiveObjectOfClass:withData:error:", objc_opt_class(), v3, &v8);

  id v5 = v8;
  if (!v4)
  {
    if (_CRKLogGeneral_onceToken_21 != -1) {
      dispatch_once(&_CRKLogGeneral_onceToken_21, &__block_literal_global_87_0);
    }
    v6 = (void *)_CRKLogGeneral_logObj_21;
    if (os_log_type_enabled((os_log_t)_CRKLogGeneral_logObj_21, OS_LOG_TYPE_ERROR)) {
      __21__CRKEventLog_events__block_invoke_cold_1(v6, v5);
    }
  }

  return v4;
}

- (unint64_t)hash
{
  id v3 = [(CRKEventLog *)self startDate];
  uint64_t v4 = [v3 hash];
  id v5 = [(CRKEventLog *)self endDate];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(CRKEventLog *)self passedInEvents];
  uint64_t v8 = [v7 hash];
  id v9 = [(CRKEventLog *)self passedInEventDatas];
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(CRKEventLog *)self isEqualToTimeline:v4];

  return v5;
}

- (BOOL)isEqualToTimeline:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = [(CRKEventLog *)self startDate];
    uint64_t v6 = [v4 startDate];
    unint64_t v7 = v5;
    unint64_t v8 = v6;
    if (v7 | v8 && (int v9 = [(id)v7 isEqual:v8], (id)v8, (id)v7, !v9))
    {
      char v22 = 0;
    }
    else
    {
      unint64_t v10 = [(CRKEventLog *)self endDate];
      id v11 = [v4 endDate];
      unint64_t v12 = v10;
      unint64_t v13 = v11;
      if (v12 | v13
        && (int v14 = [(id)v12 isEqual:v13], (id)v13, (id)v12, !v14))
      {
        char v22 = 0;
      }
      else
      {
        v15 = [(CRKEventLog *)self passedInEvents];
        objc_super v16 = [v4 passedInEvents];
        unint64_t v17 = v15;
        unint64_t v18 = v16;
        if (v17 | v18
          && (int v19 = [(id)v17 isEqual:v18], (id)v18, (id)v17, !v19))
        {
          char v22 = 0;
        }
        else
        {
          uint64_t v20 = [(CRKEventLog *)self passedInEventDatas];
          uint64_t v21 = [v4 passedInEventDatas];
          if (v20 | v21) {
            char v22 = [(id)v20 isEqual:v21];
          }
          else {
            char v22 = 1;
          }
        }
      }
    }
  }
  else
  {
    char v22 = 0;
  }

  return v22;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  BOOL v5 = [(CRKEventLog *)self startDate];
  uint64_t v6 = [(CRKEventLog *)self endDate];
  unint64_t v7 = [(CRKEventLog *)self passedInEvents];
  unint64_t v8 = NSNumber;
  int v9 = [(CRKEventLog *)self passedInEventDatas];
  unint64_t v10 = objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
  id v11 = [v3 stringWithFormat:@"<%@: %p { startDate = %@, endDate = %@, passedInEvents = %@, passedInEventDatasCount = %@ }>", v4, self, v5, v6, v7, v10];

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CRKEventLog *)self startDate];
  [v4 encodeObject:v5 forKey:@"startDate"];

  uint64_t v6 = [(CRKEventLog *)self endDate];
  [v4 encodeObject:v6 forKey:@"endDate"];

  unint64_t v7 = [(CRKEventLog *)self passedInEvents];
  [v4 encodeObject:v7 forKey:@"passedInEvents"];

  id v8 = [(CRKEventLog *)self passedInEventDatas];
  [v4 encodeObject:v8 forKey:@"passedInEventDatas"];
}

- (CRKEventLog)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CRKEventLog;
  BOOL v5 = [(CRKEventLog *)&v23 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"startDate"];
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v7;

    int v9 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"endDate"];
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v10;

    unint64_t v12 = (void *)MEMORY[0x263EFFA08];
    uint64_t v13 = objc_opt_class();
    int v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"passedInEvents"];
    passedInEvents = v5->_passedInEvents;
    v5->_passedInEvents = (NSSet *)v15;

    unint64_t v17 = (void *)MEMORY[0x263EFFA08];
    uint64_t v18 = objc_opt_class();
    int v19 = objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"passedInEventDatas"];
    passedInEventDatas = v5->_passedInEventDatas;
    v5->_passedInEventDatas = (NSSet *)v20;
  }
  return v5;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (NSSet)passedInEvents
{
  return self->_passedInEvents;
}

- (void)setPassedInEvents:(id)a3
{
}

- (NSSet)passedInEventDatas
{
  return self->_passedInEventDatas;
}

- (void)setPassedInEventDatas:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passedInEventDatas, 0);
  objc_storeStrong((id *)&self->_passedInEvents, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);

  objc_storeStrong((id *)&self->mLazilyLoadedEvents, 0);
}

void __21__CRKEventLog_events__block_invoke_cold_1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = [a2 verboseDescription];
  int v5 = 138543362;
  uint64_t v6 = v4;
  _os_log_error_impl(&dword_224C00000, v3, OS_LOG_TYPE_ERROR, "Failed to unarchive event: %{public}@", (uint8_t *)&v5, 0xCu);
}

@end