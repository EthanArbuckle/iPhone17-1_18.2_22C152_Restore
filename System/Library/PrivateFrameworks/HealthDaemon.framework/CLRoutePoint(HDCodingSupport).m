@interface CLRoutePoint(HDCodingSupport)
- (HDCodableRoutePointDatum)codableRepresentationForSync;
@end

@implementation CLRoutePoint(HDCodingSupport)

- (HDCodableRoutePointDatum)codableRepresentationForSync
{
  v2 = objc_alloc_init(HDCodableRoutePointDatum);
  objc_msgSend(a1, "timestamp_s");
  -[HDCodableRoutePointDatum setTimestamp:](v2, "setTimestamp:");
  objc_msgSend(a1, "latitude_deg");
  -[HDCodableRoutePointDatum setLatitude:](v2, "setLatitude:");
  objc_msgSend(a1, "longitude_deg");
  -[HDCodableRoutePointDatum setLongitude:](v2, "setLongitude:");
  objc_msgSend(a1, "altitude_m");
  -[HDCodableRoutePointDatum setAltitude:](v2, "setAltitude:");
  objc_msgSend(a1, "odometer_m");
  -[HDCodableRoutePointDatum setOdometer:](v2, "setOdometer:");
  -[HDCodableRoutePointDatum setSignalEnvironmentType:](v2, "setSignalEnvironmentType:", [a1 signalEnvironmentType]);

  return v2;
}

@end