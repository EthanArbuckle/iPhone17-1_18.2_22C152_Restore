@interface CPLPlaceAnnotation
+ (BOOL)supportsSecureCoding;
- (CPLPlaceAnnotation)initWithCoder:(id)a3;
- (NSNumber)placeLevel;
- (NSString)placeName;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setPlaceLevel:(id)a3;
- (void)setPlaceName:(id)a3;
@end

@implementation CPLPlaceAnnotation

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 cplCopyPropertiesFromObject:self withCopyBlock:0];
  return v4;
}

- (CPLPlaceAnnotation)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CPLPlaceAnnotation;
  v5 = [(CPLPlaceAnnotation *)&v8 init];
  v6 = v5;
  if (v5) {
    [v5 cplDecodePropertiesFromCoder:v4];
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeName, 0);
  objc_storeStrong((id *)&self->_placeLevel, 0);
}

- (void)setPlaceName:(id)a3
{
}

- (NSString)placeName
{
  return self->_placeName;
}

- (void)setPlaceLevel:(id)a3
{
}

- (NSNumber)placeLevel
{
  return self->_placeLevel;
}

@end