@interface ATXTimeEventLocation
+ (BOOL)supportsSecureCoding;
- (ATXTimeEventLocation)initWithCoder:(id)a3;
- (ATXTimeEventLocation)initWithLocation:(id)a3 title:(id)a4 type:(int64_t)a5;
- (BOOL)isApproximatelyEqualTo:(id)a3;
- (CLLocation)geoLocation;
- (NSString)title;
- (int64_t)destinationLOIType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXTimeEventLocation

- (ATXTimeEventLocation)initWithLocation:(id)a3 title:(id)a4 type:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ATXTimeEventLocation;
  v10 = [(ATXTimeEventLocation *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    geoLocation = v10->_geoLocation;
    v10->_geoLocation = (CLLocation *)v11;

    uint64_t v13 = [v9 copy];
    title = v10->_title;
    v10->_title = (NSString *)v13;

    v10->_destinationLOIType = a5;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  geoLocation = self->_geoLocation;
  id v5 = a3;
  [v5 encodeObject:geoLocation forKey:@"geoLocation"];
  [v5 encodeObject:self->_title forKey:@"locationTitle"];
  [v5 encodeInteger:self->_destinationLOIType forKey:@"LOIType"];
}

- (ATXTimeEventLocation)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXTimeEventLocation;
  id v5 = [(ATXTimeEventLocation *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"geoLocation"];
    geoLocation = v5->_geoLocation;
    v5->_geoLocation = (CLLocation *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"locationTitle"];
    title = v5->_title;
    v5->_title = (NSString *)v8;

    v5->_destinationLOIType = [v4 decodeIntegerForKey:@"LOIType"];
  }

  return v5;
}

- (BOOL)isApproximatelyEqualTo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 geoLocation];
  if (v5
    && (uint64_t v6 = (void *)v5,
        [(ATXTimeEventLocation *)self geoLocation],
        v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    uint64_t v8 = [v4 geoLocation];
    id v9 = [(ATXTimeEventLocation *)self geoLocation];
    [v8 distanceFromLocation:v9];
    BOOL v11 = v10 < 1000.0;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (CLLocation)geoLocation
{
  return self->_geoLocation;
}

- (NSString)title
{
  return self->_title;
}

- (int64_t)destinationLOIType
{
  return self->_destinationLOIType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_geoLocation, 0);
}

@end