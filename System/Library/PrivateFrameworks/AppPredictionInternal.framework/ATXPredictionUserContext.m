@interface ATXPredictionUserContext
- (ATXPredictionUserContext)initWithLastUnlockDate:(id)a3 lastAppLaunch:(id)a4 lastAppLaunchDate:(id)a5 secondMostRecentAppLaunch:(id)a6 lastAppActionLaunch:(id)a7;
- (ATXPredictionUserContext)initWithProto:(id)a3;
- (ATXPredictionUserContext)initWithProtoData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXPredictionUserContext:(id)a3;
- (NSDate)lastAppLaunchDate;
- (NSDate)lastUnlockDate;
- (NSString)lastAppActionLaunch;
- (NSString)lastAppLaunch;
- (NSString)secondMostRecentAppLaunch;
- (id)description;
- (id)encodeAsProto;
- (id)jsonDict;
- (id)proto;
@end

@implementation ATXPredictionUserContext

- (ATXPredictionUserContext)initWithLastUnlockDate:(id)a3 lastAppLaunch:(id)a4 lastAppLaunchDate:(id)a5 secondMostRecentAppLaunch:(id)a6 lastAppActionLaunch:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v28.receiver = self;
  v28.super_class = (Class)ATXPredictionUserContext;
  v17 = [(ATXPredictionUserContext *)&v28 init];
  if (v17)
  {
    double v18 = 0.0;
    double v19 = 0.0;
    if (v12) {
      objc_msgSend(v12, "timeIntervalSince1970", 0.0);
    }
    v17->_absoluteLastUnlockDate = v19;
    uint64_t v20 = [v13 copy];
    lastAppLaunch = v17->_lastAppLaunch;
    v17->_lastAppLaunch = (NSString *)v20;

    if (v14)
    {
      [v14 timeIntervalSince1970];
      double v18 = v22;
    }
    v17->_absoluteLastAppLaunchDate = v18;
    uint64_t v23 = [v15 copy];
    secondMostRecentAppLaunch = v17->_secondMostRecentAppLaunch;
    v17->_secondMostRecentAppLaunch = (NSString *)v23;

    uint64_t v25 = [v16 copy];
    lastAppActionLaunch = v17->_lastAppActionLaunch;
    v17->_lastAppActionLaunch = (NSString *)v25;
  }
  return v17;
}

- (NSDate)lastUnlockDate
{
  if (self->_absoluteLastUnlockDate == 0.0) {
    v2 = 0;
  }
  else {
    v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSince1970:self->_absoluteLastUnlockDate];
  }
  return (NSDate *)v2;
}

- (NSDate)lastAppLaunchDate
{
  if (self->_absoluteLastAppLaunchDate == 0.0) {
    v2 = 0;
  }
  else {
    v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSince1970:self->_absoluteLastAppLaunchDate];
  }
  return (NSDate *)v2;
}

- (id)description
{
  v2 = [(ATXPredictionUserContext *)self jsonDict];
  v3 = [v2 description];

  return v3;
}

- (id)jsonDict
{
  v16[5] = *MEMORY[0x1E4F143B8];
  v15[0] = @"lastUnlockDate";
  v5 = [(ATXPredictionUserContext *)self lastUnlockDate];
  if (v5)
  {
    v2 = [(ATXPredictionUserContext *)self lastUnlockDate];
    v6 = [v2 description];
  }
  else
  {
    v6 = @"nil";
  }
  lastAppLaunch = (__CFString *)self->_lastAppLaunch;
  if (!lastAppLaunch) {
    lastAppLaunch = @"nil";
  }
  v16[0] = v6;
  v16[1] = lastAppLaunch;
  v15[1] = @"lastAppLaunch";
  v15[2] = @"lastAppLaunchDate";
  v8 = [(ATXPredictionUserContext *)self lastAppLaunchDate];
  if (v8)
  {
    v3 = [(ATXPredictionUserContext *)self lastAppLaunchDate];
    v9 = [v3 description];
  }
  else
  {
    v9 = @"nil";
  }
  secondMostRecentAppLaunch = (__CFString *)self->_secondMostRecentAppLaunch;
  if (!secondMostRecentAppLaunch) {
    secondMostRecentAppLaunch = @"nil";
  }
  v16[2] = v9;
  v16[3] = secondMostRecentAppLaunch;
  lastAppActionLaunch = self->_lastAppActionLaunch;
  v15[3] = @"secondMostRecentAppLaunch";
  v15[4] = @"lastAppActionLaunch";
  if (lastAppActionLaunch) {
    id v12 = (__CFString *)lastAppActionLaunch;
  }
  else {
    id v12 = @"nil";
  }
  v16[4] = v12;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:5];
  if (v8)
  {
  }
  if (v5)
  {
  }
  return v13;
}

- (ATXPredictionUserContext)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [[ATXPBPredictionUserContext alloc] initWithData:v4];

    self = [(ATXPredictionUserContext *)self initWithProto:v5];
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
  v2 = [(ATXPredictionUserContext *)self proto];
  v3 = [v2 data];

  return v3;
}

- (ATXPredictionUserContext)initWithProto:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_8:
    v9 = 0;
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = __atxlog_handle_default();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[ATXPredictionUserContext initWithProto:]((uint64_t)self, v8);
    }

    goto LABEL_8;
  }
  id v5 = v4;
  if ([v5 hasLastUnlockDate])
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    [v5 lastUnlockDate];
    v7 = objc_msgSend(v6, "initWithTimeIntervalSince1970:");
  }
  else
  {
    v7 = 0;
  }
  if ([v5 hasLastAppLaunchDate])
  {
    id v10 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    [v5 lastAppLaunchDate];
    v11 = objc_msgSend(v10, "initWithTimeIntervalSince1970:");
  }
  else
  {
    v11 = 0;
  }
  id v12 = [v5 lastAppLaunch];
  id v13 = [v5 secondMostRecentAppLaunch];
  id v14 = [v5 lastAppActionLaunch];
  self = [(ATXPredictionUserContext *)self initWithLastUnlockDate:v7 lastAppLaunch:v12 lastAppLaunchDate:v11 secondMostRecentAppLaunch:v13 lastAppActionLaunch:v14];

  v9 = self;
LABEL_14:

  return v9;
}

- (id)proto
{
  v3 = objc_opt_new();
  id v4 = v3;
  if (self->_absoluteLastUnlockDate != 0.0) {
    objc_msgSend(v3, "setLastUnlockDate:");
  }
  [v4 setLastAppLaunch:self->_lastAppLaunch];
  if (self->_absoluteLastAppLaunchDate != 0.0) {
    objc_msgSend(v4, "setLastAppLaunchDate:");
  }
  [v4 setSecondMostRecentAppLaunch:self->_secondMostRecentAppLaunch];
  [v4 setLastAppActionLaunch:self->_lastAppActionLaunch];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXPredictionUserContext *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXPredictionUserContext *)self isEqualToATXPredictionUserContext:v5];

  return v6;
}

- (BOOL)isEqualToATXPredictionUserContext:(id)a3
{
  id v4 = (id *)a3;
  id v5 = v4;
  if (self->_absoluteLastUnlockDate != *((double *)v4 + 1)) {
    goto LABEL_7;
  }
  lastAppLaunch = self->_lastAppLaunch;
  v7 = (NSString *)v4[3];
  if (lastAppLaunch == v7)
  {
  }
  else
  {
    v8 = v7;
    v9 = lastAppLaunch;
    char v10 = [(NSString *)v9 isEqual:v8];

    if ((v10 & 1) == 0) {
      goto LABEL_7;
    }
  }
  if (self->_absoluteLastAppLaunchDate != *((double *)v5 + 2))
  {
LABEL_7:
    char v11 = 0;
    goto LABEL_8;
  }
  secondMostRecentAppLaunch = self->_secondMostRecentAppLaunch;
  id v14 = (NSString *)v5[4];
  if (secondMostRecentAppLaunch == v14)
  {
  }
  else
  {
    id v15 = v14;
    id v16 = secondMostRecentAppLaunch;
    char v17 = [(NSString *)v16 isEqual:v15];

    if ((v17 & 1) == 0) {
      goto LABEL_7;
    }
  }
  double v18 = self->_lastAppActionLaunch;
  double v19 = v18;
  if (v18 == v5[5]) {
    char v11 = 1;
  }
  else {
    char v11 = -[NSString isEqual:](v18, "isEqual:");
  }

LABEL_8:
  return v11;
}

- (NSString)lastAppLaunch
{
  return self->_lastAppLaunch;
}

- (NSString)secondMostRecentAppLaunch
{
  return self->_secondMostRecentAppLaunch;
}

- (NSString)lastAppActionLaunch
{
  return self->_lastAppActionLaunch;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastAppActionLaunch, 0);
  objc_storeStrong((id *)&self->_secondMostRecentAppLaunch, 0);
  objc_storeStrong((id *)&self->_lastAppLaunch, 0);
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  BOOL v6 = v4;
  _os_log_fault_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-ATXPBPredictionUserContext proto", (uint8_t *)&v5, 0xCu);
}

@end