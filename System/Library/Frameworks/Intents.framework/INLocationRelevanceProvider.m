@interface INLocationRelevanceProvider
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CLRegion)region;
- (INLocationRelevanceProvider)initWithCoder:(id)a3;
- (INLocationRelevanceProvider)initWithRegion:(CLRegion *)region;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INLocationRelevanceProvider

- (void).cxx_destruct
{
}

- (CLRegion)region
{
  return self->_region;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (INLocationRelevanceProvider *)a3;
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

- (INLocationRelevanceProvider)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"region"];

  if (v5)
  {
    self = [(INLocationRelevanceProvider *)self initWithRegion:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
}

- (INLocationRelevanceProvider)initWithRegion:(CLRegion *)region
{
  v5 = region;
  v10.receiver = self;
  v10.super_class = (Class)INLocationRelevanceProvider;
  v6 = [(INRelevanceProvider *)&v10 _init];
  BOOL v7 = (INLocationRelevanceProvider *)v6;
  if (v6)
  {
    objc_storeStrong(v6 + 1, region);
    v8 = v7;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end