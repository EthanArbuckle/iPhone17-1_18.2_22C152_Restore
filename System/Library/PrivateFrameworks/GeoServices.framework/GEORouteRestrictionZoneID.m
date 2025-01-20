@interface GEORouteRestrictionZoneID
+ (BOOL)supportsSecureCoding;
- (GEORouteRestrictionZoneID)init;
- (GEORouteRestrictionZoneID)initWithCoder:(id)a3;
- (GEORouteRestrictionZoneID)initWithGeoRestrictedZoneId:(id)a3;
- (int64_t)restrictionType;
- (unint64_t)identifier;
- (unint64_t)version;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GEORouteRestrictionZoneID

- (GEORouteRestrictionZoneID)init
{
  result = (GEORouteRestrictionZoneID *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEORouteRestrictionZoneID)initWithGeoRestrictedZoneId:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEORouteRestrictionZoneID;
  v5 = [(GEORouteRestrictionZoneID *)&v9 init];
  if (v5)
  {
    v5->_identifier = [v4 identifier];
    v5->_version = [v4 version];
    unsigned int v6 = [v4 type];
    if (v6 <= 2) {
      v5->_restrictionType = v6;
    }
    v7 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEORouteRestrictionZoneID)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GEORouteRestrictionZoneID;
  v5 = [(GEORouteRestrictionZoneID *)&v8 init];
  if (v5)
  {
    v5->_identifier = [v4 decodeIntegerForKey:@"_identifier"];
    v5->_version = [v4 decodeIntegerForKey:@"_version"];
    v5->_restrictionType = [v4 decodeIntegerForKey:@"_restrictionType"];
    unsigned int v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeInteger:identifier forKey:@"_identifier"];
  [v5 encodeInteger:self->_version forKey:@"_version"];
  [v5 encodeInteger:self->_restrictionType forKey:@"_restrictionType"];
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (unint64_t)version
{
  return self->_version;
}

- (int64_t)restrictionType
{
  return self->_restrictionType;
}

@end