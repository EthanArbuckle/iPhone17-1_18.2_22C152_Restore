@interface CPLBGSTActivityReport
+ (BOOL)supportsSecureCoding;
+ (id)descriptionForPhase:(int64_t)a3;
+ (id)simplifiedTaskIdentifierForTaskIdentifier:(id)a3;
- (CPLBGSTActivityReport)initWithCoder:(id)a3;
- (CPLBGSTActivityReport)initWithTaskIdentifier:(id)a3;
- (NSString)taskIdentifier;
- (id)statusWithNow:(id)a3;
- (int64_t)phase;
- (void)_didReportPhase:(int64_t)a3;
- (void)didAcquire;
- (void)didCancel;
- (void)didDefer;
- (void)didError;
- (void)didExpire;
- (void)didFinish;
- (void)didSubmit;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CPLBGSTActivityReport

- (CPLBGSTActivityReport)initWithTaskIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPLBGSTActivityReport;
  v5 = [(CPLBGSTActivityReport *)&v9 init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    taskIdentifier = v5->_taskIdentifier;
    v5->_taskIdentifier = v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPLBGSTActivityReport)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"taskIdentifier"];
  if (v5)
  {
    v6 = [(CPLBGSTActivityReport *)self initWithTaskIdentifier:v5];
    if (v6)
    {
      uint64_t v7 = objc_opt_class();
      v8 = +[NSDate date];
      objc_super v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, v8, objc_opt_class(), 0);
      v10 = [v4 decodeObjectOfClasses:v9 forKey:@"dates"];

      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v11 = v10;
      id v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v20;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v20 != v14) {
              objc_enumerationMutation(v11);
            }
            v16 = *(void **)(*((void *)&v19 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              objc_storeStrong((id *)v6->_phaseDates, v16);
              v6->_phase = 0;
            }
          }
          id v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v13);
      }
    }
    self = v6;
    v17 = self;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_taskIdentifier forKey:@"taskIdentifier"];
  uint64_t v5 = 0;
  uint64_t v15 = 0;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v12 = 0u;
  phaseDates = self->_phaseDates;
  do
  {
    uint64_t v7 = phaseDates[v5];
    if (v7)
    {
      v8 = v7;
    }
    else
    {
      v8 = +[NSNull null];
    }
    objc_super v9 = *(void **)((char *)&v12 + v5 * 8);
    *(void *)((char *)&v12 + v5 * 8) = v8;

    ++v5;
  }
  while (v5 != 7);
  id v10 = [objc_alloc((Class)NSArray) initWithObjects:&v12 count:7];
  [v4 encodeObject:v10 forKey:@"dates"];

  for (uint64_t i = 48; i != -8; i -= 8)
}

- (void)_didReportPhase:(int64_t)a3
{
  if (a3 == 2 && self->_phase == 4) {
    objc_storeStrong((id *)self->_phaseDates, self->_phaseDates[4]);
  }
  uint64_t v5 = +[NSDate date];
  phaseDates = self->_phaseDates;
  uint64_t v7 = self->_phaseDates[a3];
  self->_phaseDates[a3] = v5;

  if (a3 == 4 && self->_phase == 3)
  {
    v8 = self->_phaseDates[3];
    if (v8)
    {
      [(NSDate *)self->_phaseDates[4] timeIntervalSinceDate:v8];
      if (v9 < 0.0) {
        double v9 = -v9;
      }
      if (v9 < 1.0)
      {
        int64_t phase = self->_phase;
        id v11 = phaseDates[phase];
        phaseDates[phase] = 0;
      }
    }
  }
  if (self->_phase > a3)
  {
    long long v12 = &self->_phaseDates[1];
    int64_t v13 = a3;
    do
    {
      int64_t v14 = v13 + 1;
      uint64_t v15 = v12[v13];
      v12[v13] = 0;

      int64_t v13 = v14;
    }
    while (v14 < self->_phase);
  }
  self->_int64_t phase = a3;
}

- (void)didSubmit
{
}

- (void)didCancel
{
}

- (void)didAcquire
{
}

- (void)didExpire
{
}

- (void)didDefer
{
}

- (void)didError
{
}

- (void)didFinish
{
}

+ (id)descriptionForPhase:(int64_t)a3
{
  if ((unint64_t)a3 >= 7) {
    sub_1001C55AC((uint64_t)a2, (uint64_t)a1, a3);
  }
  return *(&off_1002770A0 + a3);
}

+ (id)simplifiedTaskIdentifierForTaskIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 hasPrefix:@"com.apple.cloudphotod."])
  {
    id v4 = [v3 substringFromIndex:22];
  }
  else
  {
    id v4 = v3;
  }
  uint64_t v5 = v4;

  return v5;
}

- (id)statusWithNow:(id)a3
{
  id v4 = a3;
  uint64_t v15 = +[CPLBGSTActivityReport simplifiedTaskIdentifierForTaskIdentifier:self->_taskIdentifier];
  id v5 = [objc_alloc((Class)NSMutableString) initWithFormat:@"%@: ", v15];
  v6 = 0;
  for (uint64_t i = 0; i != 7; ++i)
  {
    v8 = self->_phaseDates[i];
    if (!v8) {
      goto LABEL_10;
    }
    double v9 = +[CPLBGSTActivityReport descriptionForPhase:i];
    if (v6)
    {
      [(NSDate *)v8 timeIntervalSinceDate:v6];
      if (v10 <= 1.0)
      {
        [v5 appendFormat:@" ... %@", v9];
        goto LABEL_9;
      }
      id v11 = +[CPLDateFormatter stringForTimeInterval:](CPLDateFormatter, "stringForTimeInterval:");
      [v5 appendFormat:@" ... %@ ... %@", v11, v9];
    }
    else
    {
      id v11 = +[CPLDateFormatter stringFromDateAgo:v8 now:v4];
      [v5 appendFormat:@"%@ [%@]", v9, v11];
    }

LABEL_9:
    long long v12 = v8;

    v6 = v12;
LABEL_10:
  }
  if (!v6) {
    [v5 appendString:@"never"];
  }
  id v13 = [v5 copy];

  return v13;
}

- (NSString)taskIdentifier
{
  return self->_taskIdentifier;
}

- (int64_t)phase
{
  return self->_phase;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskIdentifier, 0);
  uint64_t v3 = 56;
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + v3), 0);
    v3 -= 8;
  }
  while (v3);
}

@end