@interface DNDModeAssertionExplicitRegionLifetime
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CLCircularRegion)region;
- (DNDModeAssertionExplicitRegionLifetime)initWithCoder:(id)a3;
- (DNDModeAssertionExplicitRegionLifetime)initWithRegion:(id)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)lifetimeType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DNDModeAssertionExplicitRegionLifetime

- (DNDModeAssertionExplicitRegionLifetime)initWithRegion:(id)a3
{
  id v5 = a3;
  v6 = [(DNDModeAssertionLifetime *)self _init];
  v7 = (DNDModeAssertionExplicitRegionLifetime *)v6;
  if (v6) {
    objc_storeStrong(v6 + 1, a3);
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(DNDModeAssertionExplicitRegionLifetime *)self region];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (DNDModeAssertionExplicitRegionLifetime *)a3;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v6 = [(DNDModeAssertionExplicitRegionLifetime *)self region];
      v7 = [(DNDModeAssertionExplicitRegionLifetime *)v5 region];
      if (v6 == v7)
      {
        char v12 = 1;
      }
      else
      {
        v8 = [(DNDModeAssertionExplicitRegionLifetime *)self region];
        if (v8)
        {
          v9 = [(DNDModeAssertionExplicitRegionLifetime *)v5 region];
          if (v9)
          {
            v10 = [(DNDModeAssertionExplicitRegionLifetime *)self region];
            v11 = [(DNDModeAssertionExplicitRegionLifetime *)v5 region];
            char v12 = [v10 isEqual:v11];
          }
          else
          {
            char v12 = 0;
          }
        }
        else
        {
          char v12 = 0;
        }
      }
    }
    else
    {
      char v12 = 0;
    }
  }

  return v12;
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(DNDModeAssertionExplicitRegionLifetime *)self region];
  v6 = [v3 stringWithFormat:@"<%@: %p; region: '%@'>", v4, self, v5];

  return v6;
}

- (unint64_t)lifetimeType
{
  return 5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDModeAssertionExplicitRegionLifetime)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"region"];

  v6 = [(DNDModeAssertionExplicitRegionLifetime *)self initWithRegion:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(DNDModeAssertionExplicitRegionLifetime *)self region];
  [v4 encodeObject:v5 forKey:@"region"];
}

- (CLCircularRegion)region
{
  return self->_region;
}

- (void).cxx_destruct
{
}

@end