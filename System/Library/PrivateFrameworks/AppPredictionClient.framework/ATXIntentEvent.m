@interface ATXIntentEvent
+ (BOOL)supportsSecureCoding;
- (ATXAction)action;
- (ATXIntentEvent)initWithBundleId:(id)a3 intentType:(id)a4 dateInterval:(id)a5;
- (ATXIntentEvent)initWithBundleId:(id)a3 intentType:(id)a4 dateInterval:(id)a5 action:(id)a6;
- (ATXIntentEvent)initWithBundleId:(id)a3 intentType:(id)a4 dateInterval:(id)a5 intent:(id)a6;
- (ATXIntentEvent)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXIntentEvent:(id)a3;
- (INIntent)intent;
- (NSDateInterval)dateInterval;
- (NSString)arg1;
- (NSString)arg2;
- (NSString)bundleId;
- (NSString)description;
- (NSString)intentType;
- (id)endDate;
- (id)startDate;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setArg1:(id)a3;
- (void)setArg2:(id)a3;
- (void)setBundleId:(id)a3;
@end

@implementation ATXIntentEvent

- (ATXIntentEvent)initWithBundleId:(id)a3 intentType:(id)a4 dateInterval:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"ATXIntentEvent.m", 31, @"Invalid parameter not satisfying: %@", @"bundleId" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2, self, @"ATXIntentEvent.m", 32, @"Invalid parameter not satisfying: %@", @"intentType" object file lineNumber description];

LABEL_3:
  v25.receiver = self;
  v25.super_class = (Class)ATXIntentEvent;
  v12 = [(ATXIntentEvent *)&v25 init];
  if (v12)
  {
    uint64_t v13 = [v9 copy];
    bundleId = v12->_bundleId;
    v12->_bundleId = (NSString *)v13;

    uint64_t v15 = [v10 copy];
    intentType = v12->_intentType;
    v12->_intentType = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    dateInterval = v12->_dateInterval;
    v12->_dateInterval = (NSDateInterval *)v17;

    intent = v12->_intent;
    v12->_intent = 0;

    arg1 = v12->_arg1;
    v12->_arg1 = (NSString *)@"ARG1_MISSING";

    arg2 = v12->_arg2;
    v12->_arg2 = (NSString *)@"ARG2_MISSING";
  }
  return v12;
}

- (ATXIntentEvent)initWithBundleId:(id)a3 intentType:(id)a4 dateInterval:(id)a5 intent:(id)a6
{
  id v11 = a6;
  v12 = [(ATXIntentEvent *)self initWithBundleId:a3 intentType:a4 dateInterval:a5];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_intent, a6);
    objc_msgSend(v11, "atx_getArgsInto:", v13);
  }

  return v13;
}

- (ATXIntentEvent)initWithBundleId:(id)a3 intentType:(id)a4 dateInterval:(id)a5 action:(id)a6
{
  id v11 = a6;
  v12 = [(ATXIntentEvent *)self initWithBundleId:a3 intentType:a4 dateInterval:a5];
  uint64_t v13 = v12;
  if (v11)
  {
    if (v12)
    {
      objc_storeStrong((id *)&v12->_action, a6);
      if (![v11 actionType] || objc_msgSend(v11, "actionType") == 2)
      {
        uint64_t v14 = [v11 intent];
        intent = v13->_intent;
        v13->_intent = (INIntent *)v14;

        [(INIntent *)v13->_intent atx_getArgsInto:v13];
      }
    }
  }

  return v13;
}

- (void)setArg1:(id)a3
{
  if (a3) {
    v3 = (__CFString *)a3;
  }
  else {
    v3 = @"ARG1_MISSING";
  }
  objc_storeStrong((id *)&self->_arg1, v3);
}

- (void)setArg2:(id)a3
{
  if (a3) {
    v3 = (__CFString *)a3;
  }
  else {
    v3 = @"ARG2_MISSING";
  }
  objc_storeStrong((id *)&self->_arg2, v3);
}

- (id)startDate
{
  return [(NSDateInterval *)self->_dateInterval startDate];
}

- (id)endDate
{
  return [(NSDateInterval *)self->_dateInterval endDate];
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@ %@ %@(%@, %@)>", v5, self->_dateInterval, self->_bundleId, self->_arg1, self->_arg2];

  return (NSString *)v6;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ATXIntentEvent *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXIntentEvent *)self isEqualToATXIntentEvent:v5];

  return v6;
}

- (BOOL)isEqualToATXIntentEvent:(id)a3
{
  v4 = (id *)a3;
  bundleId = self->_bundleId;
  BOOL v6 = (NSString *)v4[2];
  if (bundleId == v6)
  {
  }
  else
  {
    v7 = v6;
    v8 = bundleId;
    char v9 = [(NSString *)v8 isEqual:v7];

    if ((v9 & 1) == 0) {
      goto LABEL_19;
    }
  }
  intentType = self->_intentType;
  id v11 = (NSString *)v4[1];
  if (intentType == v11)
  {
  }
  else
  {
    v12 = v11;
    uint64_t v13 = intentType;
    char v14 = [(NSString *)v13 isEqual:v12];

    if ((v14 & 1) == 0) {
      goto LABEL_19;
    }
  }
  dateInterval = self->_dateInterval;
  v16 = (NSDateInterval *)v4[3];
  if (dateInterval == v16)
  {
  }
  else
  {
    uint64_t v17 = v16;
    v18 = dateInterval;
    char v19 = [(NSDateInterval *)v18 isEqual:v17];

    if ((v19 & 1) == 0) {
      goto LABEL_19;
    }
  }
  intent = self->_intent;
  v21 = (INIntent *)v4[4];
  if (intent == v21)
  {
  }
  else
  {
    v22 = v21;
    v23 = intent;
    char v24 = [(INIntent *)v23 isEqual:v22];

    if ((v24 & 1) == 0) {
      goto LABEL_19;
    }
  }
  arg1 = self->_arg1;
  v26 = (NSString *)v4[6];
  if (arg1 == v26)
  {
  }
  else
  {
    v27 = v26;
    v28 = arg1;
    char v29 = [(NSString *)v28 isEqual:v27];

    if ((v29 & 1) == 0)
    {
LABEL_19:
      char v30 = 0;
      goto LABEL_20;
    }
  }
  v32 = self->_arg2;
  v33 = v32;
  if (v32 == v4[7]) {
    char v30 = 1;
  }
  else {
    char v30 = -[NSString isEqual:](v32, "isEqual:");
  }

LABEL_20:
  return v30;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_bundleId hash];
  NSUInteger v4 = [(NSString *)self->_intentType hash] - v3 + 32 * v3;
  uint64_t v5 = [(NSDateInterval *)self->_dateInterval hash] - v4 + 32 * v4;
  uint64_t v6 = [(INIntent *)self->_intent hash] - v5 + 32 * v5;
  NSUInteger v7 = [(NSString *)self->_arg1 hash] - v6 + 32 * v6;
  return [(NSString *)self->_arg2 hash] - v7 + 32 * v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXIntentEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleId"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"intentType"];
  NSUInteger v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateInterval"];
  v8 = [(ATXIntentEvent *)self initWithBundleId:v5 intentType:v6 dateInterval:v7];

  if (v8)
  {
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"arg1"];
    arg1 = v8->_arg1;
    v8->_arg1 = (NSString *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"arg2"];
    arg2 = v8->_arg2;
    v8->_arg2 = (NSString *)v11;
  }
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [v5 encodeObject:v4->_arg1 forKey:@"arg1"];
  [v5 encodeObject:v4->_arg2 forKey:@"arg2"];
  [v5 encodeObject:v4->_bundleId forKey:@"bundleId"];
  [v5 encodeObject:v4->_intentType forKey:@"intentType"];
  objc_sync_exit(v4);
}

- (NSString)intentType
{
  return self->_intentType;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (INIntent)intent
{
  return self->_intent;
}

- (ATXAction)action
{
  return self->_action;
}

- (NSString)arg1
{
  return self->_arg1;
}

- (NSString)arg2
{
  return self->_arg2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arg2, 0);
  objc_storeStrong((id *)&self->_arg1, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_intent, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);

  objc_storeStrong((id *)&self->_intentType, 0);
}

@end