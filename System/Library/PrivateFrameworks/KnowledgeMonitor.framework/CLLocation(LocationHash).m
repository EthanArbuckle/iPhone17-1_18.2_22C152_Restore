@interface CLLocation(LocationHash)
- (uint64_t)cd_locationHashWithLevel:()LocationHash;
- (unint64_t)cd_privacyPreservingLocationHashWithLevel:()LocationHash;
@end

@implementation CLLocation(LocationHash)

- (unint64_t)cd_privacyPreservingLocationHashWithLevel:()LocationHash
{
  uint64_t v2 = objc_msgSend(a1, "cd_locationHashWithLevel:");
  return -[CLLocation preservePrivacyForGeoHash:](a1, v2);
}

- (uint64_t)cd_locationHashWithLevel:()LocationHash
{
  [a1 coordinate];
  double latitude = v14.latitude;
  double longitude = v14.longitude;
  if (!CLLocationCoordinate2DIsValid(v14)) {
    return 0;
  }
  uint64_t v6 = a3 >= 0x20 ? 32 : a3;
  if (!v6) {
    return 0;
  }
  uint64_t result = 0;
  double v8 = 180.0;
  double v9 = -90.0;
  double v10 = -180.0;
  double v11 = 90.0;
  do
  {
    double v12 = (v11 + v9) * 0.5;
    double v13 = (v10 + v8) * 0.5;
    if (latitude > v12) {
      double v9 = (v11 + v9) * 0.5;
    }
    else {
      double v11 = (v11 + v9) * 0.5;
    }
    if (longitude <= v13) {
      double v8 = (v10 + v8) * 0.5;
    }
    else {
      double v10 = (v10 + v8) * 0.5;
    }
    uint64_t result = (longitude > v13) | (2 * (latitude <= v12)) | (4 * result);
    --v6;
  }
  while (v6);
  return result;
}

@end