@interface HMDFMF
+ (id)fmfStatusWithCoder:(id)a3;
+ (id)fmfStatusWithDict:(id)a3;
+ (id)fmfStatusWithMessage:(id)a3;
+ (id)fmfStatusWithNumber:(id)a3;
+ (id)fmfStatusWithValue:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (HMDFMF)initWithNumber:(id)a3;
- (NSNumber)number;
- (id)description;
- (unint64_t)value;
- (void)addToCoder:(id)a3;
- (void)addToPayload:(id)a3;
@end

@implementation HMDFMF

- (unint64_t)value
{
  return self->_value;
}

- (id)description
{
  v2 = NSString;
  unint64_t v3 = [(HMDFMF *)self value];
  if (v3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown HMDFMFStatus %tu", v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = off_1E6A137F0[v3];
  }
  v5 = [v2 stringWithFormat:@"%@", v4];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMDFMF *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    v6 = v5;
    if (v6)
    {
      unint64_t v7 = [(HMDFMF *)self value];
      BOOL v8 = v7 == [(HMDFMF *)v6 value];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  return v8;
}

- (NSNumber)number
{
  v2 = NSNumber;
  unint64_t v3 = [(HMDFMF *)self value];
  return (NSNumber *)[v2 numberWithUnsignedInteger:v3];
}

- (void)addToPayload:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDFMF *)self number];
  [v4 setObject:v5 forKeyedSubscript:@"FMFStatus"];
}

- (void)addToCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDFMF *)self number];
  [v4 encodeObject:v5 forKey:@"FMFStatus"];
}

- (HMDFMF)initWithNumber:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v8.receiver = self;
    v8.super_class = (Class)HMDFMF;
    id v5 = [(HMDFMF *)&v8 init];
    if (v5) {
      v5->_value = [v4 unsignedIntegerValue];
    }
    self = v5;
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)fmfStatusWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"FMFStatus"];

  id v5 = +[HMDFMF fmfStatusWithNumber:v4];

  return v5;
}

+ (id)fmfStatusWithDict:(id)a3
{
  id v3 = objc_msgSend(a3, "hmf_numberForKey:", @"FMFStatus");
  id v4 = +[HMDFMF fmfStatusWithNumber:v3];

  return v4;
}

+ (id)fmfStatusWithMessage:(id)a3
{
  id v3 = [a3 numberForKey:@"FMFStatus"];
  id v4 = +[HMDFMF fmfStatusWithNumber:v3];

  return v4;
}

+ (id)fmfStatusWithNumber:(id)a3
{
  id v3 = a3;
  id v4 = [[HMDFMF alloc] initWithNumber:v3];

  return v4;
}

+ (id)fmfStatusWithValue:(unint64_t)a3
{
  id v4 = [HMDFMF alloc];
  id v5 = [NSNumber numberWithUnsignedInteger:a3];
  v6 = [(HMDFMF *)v4 initWithNumber:v5];

  return v6;
}

@end