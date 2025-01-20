@interface MCGeofenceInfo
- (NSNumber)latitude;
- (NSNumber)longitude;
- (NSNumber)radius;
- (NSString)geofenceId;
- (id)description;
- (void)setGeofenceId:(id)a3;
- (void)setLatitude:(id)a3;
- (void)setLongitude:(id)a3;
- (void)setRadius:(id)a3;
@end

@implementation MCGeofenceInfo

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  v4 = v3;
  if (self->_longitude) {
    [v3 appendFormat:@"Longitude : %@\n", self->_longitude];
  }
  if (self->_latitude) {
    [v4 appendFormat:@"Latitude  : %@\n", self->_latitude];
  }
  if (self->_radius) {
    [v4 appendFormat:@"Radius    : %@\n", self->_radius];
  }
  if (self->_geofenceId) {
    [v4 appendFormat:@"Id        : %@\n", self->_geofenceId];
  }
  return v4;
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