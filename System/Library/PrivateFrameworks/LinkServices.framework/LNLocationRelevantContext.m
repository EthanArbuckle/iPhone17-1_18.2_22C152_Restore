@interface LNLocationRelevantContext
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CLRegion)region;
- (LNLocationRelevantContext)initWithCoder:(id)a3;
- (LNLocationRelevantContext)initWithRegion:(id)a3;
- (id)analyticsDescription;
- (id)asCondition;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNLocationRelevantContext

- (void).cxx_destruct
{
}

- (CLRegion)region
{
  return self->_region;
}

- (id)asCondition
{
  v3 = [LNLocationRelevantCondition alloc];
  v4 = [(LNLocationRelevantContext *)self region];
  v5 = [(LNLocationRelevantCondition *)v3 initWithRegion:v4];

  return v5;
}

- (id)analyticsDescription
{
  return @".location()";
}

- (id)description
{
  v2 = NSString;
  v3 = [(LNLocationRelevantContext *)self region];
  v4 = [v2 stringWithFormat:@"<location: %@>", v3];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (LNLocationRelevantContext *)a3;
  if (v4 == self)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      region = self->_region;
      BOOL v7 = region == v5->_region || -[CLRegion isEqual:](region, "isEqual:");
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  return [(CLRegion *)self->_region hash];
}

- (void)encodeWithCoder:(id)a3
{
}

- (LNLocationRelevantContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"region"];

  if (v5)
  {
    self = [(LNLocationRelevantContext *)self initWithRegion:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (LNLocationRelevantContext)initWithRegion:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"LNRelevantContext.m", 182, @"Invalid parameter not satisfying: %@", @"region" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)LNLocationRelevantContext;
  BOOL v7 = [(LNRelevantContext *)&v12 _init];
  v8 = (LNLocationRelevantContext *)v7;
  if (v7)
  {
    objc_storeStrong(v7 + 2, a3);
    v9 = v8;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end