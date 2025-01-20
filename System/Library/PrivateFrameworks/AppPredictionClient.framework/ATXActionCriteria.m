@interface ATXActionCriteria
+ (BOOL)supportsSecureCoding;
+ (id)predicateValidForAirplaneModeOn:(BOOL)a3;
+ (id)predicateValidForDNDStatusOn:(BOOL)a3;
- (ATXActionCriteria)init;
- (ATXActionCriteria)initWithCoder:(id)a3;
- (ATXActionCriteria)initWithProto:(id)a3;
- (ATXActionCriteria)initWithProtoData:(id)a3;
- (ATXActionCriteria)initWithStartDate:(id)a3 endDate:(id)a4 lockScreenEligible:(BOOL)a5 predicate:(id)a6;
- (BOOL)isRelevant:(id)a3;
- (BOOL)lockScreenEligible;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSDateInterval)dateInterval;
- (NSPredicate)predicate;
- (id)description;
- (id)encodeAsProto;
- (id)json;
- (id)proto;
- (void)encodeWithCoder:(id)a3;
- (void)proto;
@end

@implementation ATXActionCriteria

- (ATXActionCriteria)initWithStartDate:(id)a3 endDate:(id)a4 lockScreenEligible:(BOOL)a5 predicate:(id)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      id v10 = 0;
    }
  }
  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (v10 && [v10 compare:v11] == 1)
      {
        v13 = __atxlog_handle_default();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        {
          v21 = (objc_class *)objc_opt_class();
          v22 = NSStringFromClass(v21);
          *(_DWORD *)buf = 138412802;
          v25 = v22;
          __int16 v26 = 2112;
          id v27 = v10;
          __int16 v28 = 2112;
          id v29 = v11;
          _os_log_fault_impl(&dword_1A790D000, v13, OS_LOG_TYPE_FAULT, "%@: tried to initialize startDate must be before endDate %@ : %@", buf, 0x20u);
        }
        v14 = 0;
        goto LABEL_15;
      }
    }
    else
    {

      id v11 = 0;
    }
  }
  v23.receiver = self;
  v23.super_class = (Class)ATXActionCriteria;
  v15 = [(ATXActionCriteria *)&v23 init];
  if (v15)
  {
    uint64_t v16 = [v10 copy];
    startDate = v15->_startDate;
    v15->_startDate = (NSDate *)v16;

    uint64_t v18 = [v11 copy];
    endDate = v15->_endDate;
    v15->_endDate = (NSDate *)v18;

    v15->_lockScreenEligible = a5;
    objc_storeStrong((id *)&v15->_predicate, a6);
  }
  self = v15;
  v14 = self;
LABEL_15:

  return v14;
}

- (ATXActionCriteria)init
{
  return [(ATXActionCriteria *)self initWithStartDate:0 endDate:0 lockScreenEligible:0 predicate:0];
}

+ (id)predicateValidForDNDStatusOn:(BOOL)a3
{
  v3 = (void *)MEMORY[0x1E4F28F60];
  v4 = [NSNumber numberWithBool:a3];
  v5 = [v3 predicateWithFormat:@"doNotDisturb==%@", v4];

  return v5;
}

+ (id)predicateValidForAirplaneModeOn:(BOOL)a3
{
  v3 = (void *)MEMORY[0x1E4F28F60];
  v4 = [NSNumber numberWithBool:a3];
  v5 = [v3 predicateWithFormat:@"airplaneMode==%@", v4];

  return v5;
}

- (NSDateInterval)dateInterval
{
  id v3 = objc_alloc(MEMORY[0x1E4F28C18]);
  startDate = self->_startDate;
  v5 = startDate;
  if (!startDate)
  {
    v5 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  if (self->_endDate)
  {
    v6 = objc_msgSend(v3, "initWithStartDate:endDate:", v5);
    if (startDate) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  v8 = [MEMORY[0x1E4F1C9C8] distantFuture];
  v6 = (void *)[v3 initWithStartDate:v5 endDate:v8];

  if (!startDate) {
LABEL_5:
  }

LABEL_6:

  return (NSDateInterval *)v6;
}

- (BOOL)isRelevant:(id)a3
{
  id v4 = a3;
  v5 = [(ATXActionCriteria *)self dateInterval];
  v6 = [v4 now];
  int v7 = [v5 containsDate:v6];

  if (!v7
    || [v4 lockScreen]
    && ![(ATXActionCriteria *)self lockScreenEligible])
  {
    goto LABEL_11;
  }
  predicate = self->_predicate;
  if (!predicate) {
    goto LABEL_10;
  }
  if (([(NSPredicate *)predicate _allowsEvaluation] & 1) == 0)
  {
    v9 = [[ATXActionCriteriaPredicateChecker alloc] initWithObject:v4];
    if ([(ATXActionCriteriaPredicateChecker *)v9 isValid:self->_predicate]) {
      [(NSPredicate *)self->_predicate allowEvaluation];
    }
  }
  if ([(NSPredicate *)self->_predicate evaluateWithObject:v4]) {
LABEL_10:
  }
    BOOL v10 = 1;
  else {
LABEL_11:
  }
    BOOL v10 = 0;

  return v10;
}

- (id)json
{
  v11[4] = *MEMORY[0x1E4F143B8];
  v10[0] = @"startDate";
  id v3 = dateToJson(self->_startDate);
  v11[0] = v3;
  v10[1] = @"endDate";
  id v4 = dateToJson(self->_endDate);
  v11[1] = v4;
  v10[2] = @"isLockScreenEligible";
  v5 = [NSNumber numberWithBool:self->_lockScreenEligible];
  v11[2] = v5;
  v10[3] = @"predicate";
  v6 = [(NSPredicate *)self->_predicate description];
  int v7 = v6;
  if (!v6)
  {
    int v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v11[3] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:4];
  if (!v6) {

  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  startDate = self->_startDate;
  id v5 = a3;
  [v5 encodeObject:startDate forKey:@"startDate"];
  [v5 encodeObject:self->_endDate forKey:@"endDate"];
  [v5 encodeBool:self->_lockScreenEligible forKey:@"lockScreenEligible"];
  [v5 encodeObject:self->_predicate forKey:@"predicate"];
}

- (ATXActionCriteria)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endDate"];
  uint64_t v7 = [v4 decodeBoolForKey:@"lockScreenEligible"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"predicate"];

  v9 = [(ATXActionCriteria *)self initWithStartDate:v5 endDate:v6 lockScreenEligible:v7 predicate:v8];
  return v9;
}

- (ATXActionCriteria)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[ATXPBActionCriteria alloc] initWithData:v4];

    self = [(ATXActionCriteria *)self initWithProto:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)encodeAsProto
{
  v2 = [(ATXActionCriteria *)self proto];
  id v3 = [v2 data];

  return v3;
}

- (ATXActionCriteria)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      if ([v5 hasStartDate])
      {
        id v6 = objc_alloc(MEMORY[0x1E4F1C9C8]);
        [v5 startDate];
        uint64_t v7 = objc_msgSend(v6, "initWithTimeIntervalSinceReferenceDate:");
      }
      else
      {
        uint64_t v7 = 0;
      }
      if ([v5 hasEndDate])
      {
        id v9 = objc_alloc(MEMORY[0x1E4F1C9C8]);
        [v5 endDate];
        BOOL v10 = objc_msgSend(v9, "initWithTimeIntervalSinceReferenceDate:");
      }
      else
      {
        BOOL v10 = 0;
      }
      id v11 = [v5 predicate];
      uint64_t v12 = [v11 length];

      if (v12)
      {
        v13 = (void *)MEMORY[0x1AD0D3C30]();
        v14 = (void *)MEMORY[0x1E4F28DC0];
        uint64_t v15 = objc_opt_class();
        uint64_t v16 = [v5 predicate];
        id v21 = 0;
        v17 = [v14 unarchivedObjectOfClass:v15 fromData:v16 error:&v21];
        id v18 = v21;

        if (v18)
        {
          v19 = __atxlog_handle_default();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
            -[ATXActionCriteria initWithProto:]((uint64_t)v18, v19);
          }
        }
      }
      else
      {
        v17 = 0;
      }
      self = [(ATXActionCriteria *)self initWithStartDate:v7 endDate:v10 lockScreenEligible:[v5 isLockScreenEligible] predicate:v17];

      v8 = self;
    }
    else
    {
      id v5 = __atxlog_handle_default();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[ATXActionCriteria initWithProto:]((uint64_t)self, v5);
      }
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)proto
{
  id v3 = objc_alloc_init(ATXPBActionCriteria);
  startDate = self->_startDate;
  if (startDate)
  {
    [(NSDate *)startDate timeIntervalSinceReferenceDate];
    -[ATXPBActionCriteria setStartDate:](v3, "setStartDate:");
  }
  endDate = self->_endDate;
  if (endDate)
  {
    [(NSDate *)endDate timeIntervalSinceReferenceDate];
    -[ATXPBActionCriteria setEndDate:](v3, "setEndDate:");
  }
  uint64_t v6 = [(ATXPBActionCriteria *)v3 setIsLockScreenEligible:self->_lockScreenEligible];
  if (self->_predicate)
  {
    uint64_t v7 = (void *)MEMORY[0x1AD0D3C30](v6);
    predicate = self->_predicate;
    id v13 = 0;
    id v9 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:predicate requiringSecureCoding:1 error:&v13];
    id v10 = v13;
    [(ATXPBActionCriteria *)v3 setPredicate:v9];

    if (v10)
    {
      id v11 = __atxlog_handle_default();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        [(ATXActionCriteria *)(uint64_t)v10 proto];
      }
    }
  }

  return v3;
}

- (id)description
{
  id v3 = [NSString alloc];
  startDate = self->_startDate;
  endDate = self->_endDate;
  uint64_t v6 = [NSNumber numberWithBool:self->_lockScreenEligible];
  uint64_t v7 = (void *)[v3 initWithFormat:@"<ATXActionCriteria startDate: %@, endDate: %@, lockScreenEligible: %@, predicate: %@", startDate, endDate, v6, self->_predicate];

  return v7;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (BOOL)lockScreenEligible
{
  return self->_lockScreenEligible;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_endDate, 0);

  objc_storeStrong((id *)&self->_startDate, 0);
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A790D000, a2, OS_LOG_TYPE_ERROR, "Could not unarchive predicate via protobufs: %@", (uint8_t *)&v2, 0xCu);
}

- (void)initWithProto:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  uint64_t v6 = v4;
  _os_log_fault_impl(&dword_1A790D000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-ATXPBActionCriteria proto", (uint8_t *)&v5, 0xCu);
}

- (void)proto
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A790D000, a2, OS_LOG_TYPE_ERROR, "Could not archive predicate via protobufs: %@", (uint8_t *)&v2, 0xCu);
}

@end