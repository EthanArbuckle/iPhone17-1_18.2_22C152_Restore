@interface _DASLimiterResponse
+ (BOOL)queryActivityDecision:(unint64_t)a3 fromResponses:(id)a4;
+ (BOOL)supportsSecureCoding;
+ (id)limitResponseWithDecision:(unint64_t)a3 withLimiter:(id)a4 validityDuration:(double)a5 rationale:(id)a6;
+ (unint64_t)bitmaskFromResponses:(id)a3;
+ (void)updateActivity:(id)a3 withLimitResponse:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)limiterName;
- (NSString)rationale;
- (_DASLimiterResponse)initWithCoder:(id)a3;
- (_DASLimiterResponse)initWithDecision:(unint64_t)a3 withLimiter:(id)a4 validityDuration:(double)a5 rationale:(id)a6;
- (double)validityDuration;
- (id)description;
- (unint64_t)decision;
- (void)encodeWithCoder:(id)a3;
- (void)setRationale:(id)a3;
@end

@implementation _DASLimiterResponse

- (id)description
{
  unint64_t v2 = self->_decision - 1;
  if (v2 > 4) {
    v3 = @"None";
  }
  else {
    v3 = off_1E6112E38[v2];
  }
  double validityDuration = self->_validityDuration;
  rationale = self->_rationale;
  limiterName = self->_limiterName;
  if (validityDuration == 0.0) {
    [NSString stringWithFormat:@"%@ Limiter Decision: '%@' Rationale: '%@'", limiterName, v3, rationale, v9];
  }
  else {
  v7 = [NSString stringWithFormat:@"%@ Limiter Decision: '%@' Rationale: '%@' Duration: '%f mins'", limiterName, v3, rationale, validityDuration / 60.0];
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  unint64_t decision = self->_decision;
  id v8 = a3;
  v6 = [v4 numberWithUnsignedInteger:decision];
  [v8 encodeObject:v6 forKey:@"decision"];

  [v8 encodeObject:self->_rationale forKey:@"rationale"];
  v7 = [NSNumber numberWithDouble:self->_validityDuration];
  [v8 encodeObject:v7 forKey:@"validityDuration"];

  [v8 encodeObject:self->_limiterName forKey:@"limiterName"];
}

+ (BOOL)queryActivityDecision:(unint64_t)a3 fromResponses:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = v5;
  if (v5)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          if (objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "decision", (void)v14) == a3)
          {
            BOOL v12 = 1;
            goto LABEL_12;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    BOOL v12 = 0;
LABEL_12:
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (unint64_t)decision
{
  return self->_decision;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_limiterName, 0);

  objc_storeStrong((id *)&self->_rationale, 0);
}

- (_DASLimiterResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_DASLimiterResponse;
  id v5 = [(_DASLimiterResponse *)&v14 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"decision"];
    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rationale"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"limiterName"];
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"validityDuration"];
    uint64_t v10 = (void *)v9;
    v11 = 0;
    if (v6 && v9 && v7 && v8)
    {
      v5->_unint64_t decision = [v6 unsignedIntValue];
      [v10 doubleValue];
      v5->_double validityDuration = v12;
      objc_storeStrong((id *)&v5->_rationale, v7);
      objc_storeStrong((id *)&v5->_limiterName, v8);
      v11 = v5;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)limitResponseWithDecision:(unint64_t)a3 withLimiter:(id)a4 validityDuration:(double)a5 rationale:(id)a6
{
  id v9 = a6;
  id v10 = a4;
  v11 = [[_DASLimiterResponse alloc] initWithDecision:a3 withLimiter:v10 validityDuration:v9 rationale:a5];

  return v11;
}

- (_DASLimiterResponse)initWithDecision:(unint64_t)a3 withLimiter:(id)a4 validityDuration:(double)a5 rationale:(id)a6
{
  id v11 = a4;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)_DASLimiterResponse;
  v13 = [(_DASLimiterResponse *)&v16 init];
  objc_super v14 = v13;
  if (v13)
  {
    v13->_unint64_t decision = a3;
    objc_storeStrong((id *)&v13->_limiterName, a4);
    v14->_double validityDuration = a5;
    if (v12) {
      objc_storeStrong((id *)&v14->_rationale, a6);
    }
  }

  return v14;
}

- (double)validityDuration
{
  return self->_validityDuration;
}

+ (void)updateActivity:(id)a3 withLimitResponse:(id)a4
{
  id v11 = a4;
  id v5 = a3;
  v6 = [v5 limitationResponse];

  if (v6)
  {
    id v7 = [v5 limitationResponse];
    uint64_t v8 = [MEMORY[0x1E4F1CA80] setWithArray:v7];
    [v8 addObjectsFromArray:v11];
    id v9 = [v8 allObjects];
    id v10 = (void *)[v9 mutableCopy];
    [v5 setLimitationResponse:v10];

    id v5 = v8;
  }
  else
  {
    id v7 = (void *)[v11 mutableCopy];
    [v5 setLimitationResponse:v7];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (unint64_t)bitmaskFromResponses:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = v3;
  if (v3 && [v3 count])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = v4;
    unint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      int v7 = 0;
      uint64_t v8 = *(void *)v14;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v9), "limiterName", (void)v13);
          uint64_t v11 = +[_DASLimitsUtilities bitmaskForLimitationName:v10];

          v7 |= v11 & ~(v11 >> 63);
          ++v9;
        }
        while (v6 != v9);
        unint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
      unint64_t v6 = v7;
    }
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_DASLimiterResponse *)a3;
  if (self == v4)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      unint64_t decision = self->_decision;
      if (decision == [(_DASLimiterResponse *)v5 decision])
      {
        rationale = self->_rationale;
        uint64_t v8 = [(_DASLimiterResponse *)v5 rationale];
        if ([(NSString *)rationale isEqualToString:v8]
          && (double validityDuration = self->_validityDuration,
              [(_DASLimiterResponse *)v5 validityDuration],
              validityDuration == v10))
        {
          limiterName = self->_limiterName;
          id v12 = [(_DASLimiterResponse *)v5 limiterName];
          char v13 = [(NSString *)limiterName isEqualToString:v12];
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
    else
    {
      char v13 = 0;
    }
  }

  return v13;
}

- (NSString)rationale
{
  return self->_rationale;
}

- (void)setRationale:(id)a3
{
}

- (NSString)limiterName
{
  return self->_limiterName;
}

@end