@interface CTGeofenceInfo
+ (BOOL)supportsSecureCoding;
- (CTGeofenceInfo)init;
- (CTGeofenceInfo)initWithCoder:(id)a3;
- (NSNumber)latitude;
- (NSNumber)longitude;
- (NSNumber)radius;
- (NSString)geofenceId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setGeofenceId:(id)a3;
- (void)setLatitude:(id)a3;
- (void)setLongitude:(id)a3;
- (void)setRadius:(id)a3;
@end

@implementation CTGeofenceInfo

- (CTGeofenceInfo)init
{
  v3.receiver = self;
  v3.super_class = (Class)CTGeofenceInfo;
  return [(CTGeofenceInfo *)&v3 init];
}

- (id)description
{
  objc_super v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTGeofenceInfo *)self longitude];
  [v3 appendFormat:@", longitude=%@", v4];

  v5 = [(CTGeofenceInfo *)self latitude];
  [v3 appendFormat:@", latitude=%@", v5];

  v6 = [(CTGeofenceInfo *)self radius];
  [v3 appendFormat:@", radius=%@", v6];

  v7 = [(CTGeofenceInfo *)self geofenceId];
  [v3 appendFormat:@", geofenceId=%@", v7];

  [v3 appendString:@">"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(CTGeofenceInfo *)self longitude];
  v6 = (void *)[v5 copy];
  [v4 setLongitude:v6];

  v7 = [(CTGeofenceInfo *)self latitude];
  v8 = (void *)[v7 copy];
  [v4 setLatitude:v8];

  v9 = [(CTGeofenceInfo *)self radius];
  v10 = (void *)[v9 copy];
  [v4 setRadius:v10];

  v11 = [(CTGeofenceInfo *)self geofenceId];
  v12 = (void *)[v11 copy];
  [v4 setGeofenceId:v12];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CTGeofenceInfo *)self longitude];
  [v4 encodeObject:v5 forKey:@"longitude"];

  v6 = [(CTGeofenceInfo *)self latitude];
  [v4 encodeObject:v6 forKey:@"latitude"];

  v7 = [(CTGeofenceInfo *)self radius];
  [v4 encodeObject:v7 forKey:@"radius"];

  id v8 = [(CTGeofenceInfo *)self geofenceId];
  [v4 encodeObject:v8 forKey:@"geofenceId"];
}

- (CTGeofenceInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CTGeofenceInfo;
  v5 = [(CTGeofenceInfo *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"longitude"];
    longitude = v5->_longitude;
    v5->_longitude = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"latitude"];
    latitude = v5->_latitude;
    v5->_latitude = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"radius"];
    radius = v5->_radius;
    v5->_radius = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"geofenceId"];
    geofenceId = v5->_geofenceId;
    v5->_geofenceId = (NSString *)v12;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)longitude
{
  return self->_longitude;
}

- (void)setLongitude:(id)a3
{
}

- (NSNumber)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(id)a3
{
}

- (NSNumber)radius
{
  return self->_radius;
}

- (void)setRadius:(id)a3
{
}

- (NSString)geofenceId
{
  return self->_geofenceId;
}

- (void)setGeofenceId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geofenceId, 0);
  objc_storeStrong((id *)&self->_radius, 0);
  objc_storeStrong((id *)&self->_latitude, 0);

  objc_storeStrong((id *)&self->_longitude, 0);
}

@end