@interface CPLResetReason
+ (BOOL)supportsSecureCoding;
- (BOOL)tentative;
- (CPLResetReason)initWithCoder:(id)a3;
- (CPLResetReason)initWithDate:(id)a3 reason:(id)a4;
- (CPLResetReason)initWithPlist:(id)a3;
- (NSDate)date;
- (NSString)reason;
- (NSString)uuid;
- (id)asPlist;
- (id)reasonDescriptionWithNow:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setTentative:(BOOL)a3;
@end

@implementation CPLResetReason

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)setTentative:(BOOL)a3
{
  self->_tentative = a3;
}

- (BOOL)tentative
{
  return self->_tentative;
}

- (NSString)reason
{
  return self->_reason;
}

- (NSDate)date
{
  return self->_date;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)encodeWithCoder:(id)a3
{
  reason = self->_reason;
  id v5 = a3;
  [v5 encodeObject:reason forKey:@"r"];
  [v5 encodeObject:self->_date forKey:@"d"];
  [v5 encodeObject:self->_uuid forKey:@"u"];
}

- (CPLResetReason)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"r"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"d"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"u"];

  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8 || v7 == 0)
  {
    v10 = 0;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)CPLResetReason;
    v11 = [(CPLResetReason *)&v14 init];
    p_isa = (id *)&v11->super.isa;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_reason, v5);
      objc_storeStrong(p_isa + 3, v6);
      objc_storeStrong(p_isa + 2, v7);
    }
    self = p_isa;
    v10 = self;
  }

  return v10;
}

- (id)reasonDescriptionWithNow:(id)a3
{
  v3 = NSString;
  reason = self->_reason;
  id v5 = +[CPLDateFormatter stringForTimeIntervalAgo:self->_date now:a3];
  v6 = [v3 stringWithFormat:@"%@ - %@", reason, v5];

  return v6;
}

- (id)asPlist
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v6[0] = @"reason";
  v6[1] = @"date";
  date = self->_date;
  uuid = self->_uuid;
  v7[0] = self->_reason;
  v7[1] = date;
  v6[2] = @"uuid";
  v7[2] = uuid;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:3];
  return v4;
}

- (CPLResetReason)initWithPlist:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [v5 objectForKeyedSubscript:@"reason"];
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v7 = [v5 objectForKeyedSubscript:@"uuid"];
      if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        BOOL v8 = [v5 objectForKeyedSubscript:@"date"];
        if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v13.receiver = self;
          v13.super_class = (Class)CPLResetReason;
          v9 = [(CPLResetReason *)&v13 init];
          p_isa = (id *)&v9->super.isa;
          if (v9)
          {
            objc_storeStrong((id *)&v9->_reason, v6);
            objc_storeStrong(p_isa + 3, v8);
            objc_storeStrong(p_isa + 2, v7);
          }
          self = p_isa;
          v11 = self;
        }
        else
        {
          v11 = 0;
        }
      }
      else
      {
        v11 = 0;
      }
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (CPLResetReason)initWithDate:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CPLResetReason;
  BOOL v8 = [(CPLResetReason *)&v17 init];
  if (v8)
  {
    uint64_t v9 = [v7 copy];
    reason = v8->_reason;
    v8->_reason = (NSString *)v9;

    uint64_t v11 = [v6 copy];
    date = v8->_date;
    v8->_date = (NSDate *)v11;

    objc_super v13 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v14 = [v13 UUIDString];
    uuid = v8->_uuid;
    v8->_uuid = (NSString *)v14;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end