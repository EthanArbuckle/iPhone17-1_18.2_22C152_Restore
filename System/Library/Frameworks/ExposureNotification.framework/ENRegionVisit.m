@interface ENRegionVisit
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (ENRegion)region;
- (ENRegionVisit)initWithCoder:(id)a3;
- (ENRegionVisit)initWithRegion:(id)a3 date:(id)a4;
- (NSDate)date;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ENRegionVisit

- (ENRegion)region
{
  return self->_region;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);

  objc_storeStrong((id *)&self->_region, 0);
}

- (ENRegionVisit)initWithRegion:(id)a3 date:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"ENRegionVisit.m", 23, @"Invalid parameter not satisfying: %@", @"region" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v17 = [MEMORY[0x263F08690] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"ENRegionVisit.m", 24, @"Invalid parameter not satisfying: %@", @"date" object file lineNumber description];

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)ENRegionVisit;
  v10 = [(ENRegionVisit *)&v18 init];
  if (v10)
  {
    uint64_t v11 = [v7 copy];
    region = v10->_region;
    v10->_region = (ENRegion *)v11;

    uint64_t v13 = [v9 copy];
    date = v10->_date;
    v10->_date = (NSDate *)v13;
  }
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ENRegionVisit)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reg"];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
    if (v6)
    {
      self = [(ENRegionVisit *)self initWithRegion:v5 date:v6];
      id v7 = self;
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  region = self->_region;
  id v5 = a3;
  [v5 encodeObject:region forKey:@"reg"];
  [v5 encodeObject:self->_date forKey:@"date"];
}

- (unint64_t)hash
{
  unint64_t v3 = [(ENRegion *)self->_region hash];
  return [(NSDate *)self->_date hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v11 = 0;
    goto LABEL_14;
  }
  id v5 = v4;
  v6 = (void *)v5[1];
  id v7 = self->_region;
  id v8 = v6;
  if (v7 == v8)
  {

    goto LABEL_7;
  }
  v9 = v8;
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_11;
  }
  BOOL v10 = [(ENRegion *)v7 isEqual:v8];

  if (v10)
  {
LABEL_7:
    date = self->_date;
    uint64_t v13 = (void *)v5[2];
    id v7 = date;
    v14 = v13;
    v9 = v14;
    if (v7 == v14)
    {
      char v11 = 1;
      goto LABEL_12;
    }
    if ((v7 == 0) != (v14 != 0))
    {
      char v11 = [(ENRegion *)v7 isEqual:v14];
LABEL_12:

      goto LABEL_13;
    }
LABEL_11:
    char v11 = 0;
    goto LABEL_12;
  }
  char v11 = 0;
LABEL_13:

LABEL_14:
  return v11;
}

- (id)description
{
  unint64_t v3 = NSString;
  id v4 = [(ENRegion *)self->_region countryCode];
  id v5 = [(ENRegion *)self->_region subdivisionCode];
  v6 = [v3 stringWithFormat:@"countryCode, %@, subdivisionCode, %@, date, %@", v4, v5, self->_date];

  return v6;
}

@end