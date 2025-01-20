@interface CLCircularRegion
+ (BOOL)supportsSecureCoding;
- (BOOL)allowMonitoringWhileNearby;
- (BOOL)containsCoordinate:(CLLocationCoordinate2D)coordinate;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLowPower;
- (CLCircularRegion)initWithCenter:(CLLocationCoordinate2D)a3 radius:(double)a4 identifier:(id)a5 nearbyAllowed:(BOOL)a6;
- (CLCircularRegion)initWithCenter:(CLLocationCoordinate2D)a3 radius:(double)a4 identifier:(id)a5 onBehalfOfBundleId:(id)a6;
- (CLCircularRegion)initWithCenter:(CLLocationCoordinate2D)a3 radius:(double)a4 referenceFrame:(int)a5 allowMonitoringWhenNearby:(BOOL)a6 lowPower:(BOOL)a7 identifier:(id)a8 onBehalfOfBundleId:(id)a9 notifyOnEntry:(BOOL)a10 notifyOnExit:(BOOL)a11 conservativeEntry:(BOOL)a12 emergency:(BOOL)a13;
- (CLCircularRegion)initWithCenter:(CLLocationCoordinate2D)a3 radius:(double)a4 referenceFrame:(int)a5 allowMonitoringWhenNearby:(BOOL)a6 lowPower:(BOOL)a7 identifier:(id)a8 onBehalfOfBundleId:(id)a9 notifyOnEntry:(BOOL)a10 notifyOnExit:(BOOL)a11 conservativeEntry:(BOOL)a12 emergency:(BOOL)a13 deviceId:(id)a14 handoffTag:(id)a15;
- (CLCircularRegion)initWithCenter:(CLLocationCoordinate2D)center radius:(CLLocationDistance)radius identifier:(NSString *)identifier;
- (CLCircularRegion)initWithCoder:(id)a3;
- (CLLocationCoordinate2D)center;
- (CLLocationCoordinate2D)geoCenter;
- (CLLocationDistance)radius;
- (double)desiredAccuracy;
- (double)geoRadius;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initForLowPowerWithCenter:(CLLocationCoordinate2D)a3 radius:(double)a4 identifier:(id)a5;
- (id)initLegacyObjectWithCoder:(id)a3;
- (id)initNearbyAllowedWithCenter:(CLLocationCoordinate2D)a3 radius:(double)a4 identifier:(id)a5;
- (int)geoReferenceFrame;
- (int)referenceFrame;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setGeoReferenceFrame:(int)a3;
- (void)setReferenceFrame:(int)a3;
@end

@implementation CLCircularRegion

- (void)setReferenceFrame:(int)a3
{
  self->_geoReferenceFrame = a3;
}

- (CLCircularRegion)initWithCenter:(CLLocationCoordinate2D)center radius:(CLLocationDistance)radius identifier:(NSString *)identifier
{
  BYTE2(v6) = 0;
  LOWORD(v6) = 1;
  return -[CLCircularRegion initWithCenter:radius:referenceFrame:allowMonitoringWhenNearby:lowPower:identifier:onBehalfOfBundleId:notifyOnEntry:notifyOnExit:conservativeEntry:emergency:](self, "initWithCenter:radius:referenceFrame:allowMonitoringWhenNearby:lowPower:identifier:onBehalfOfBundleId:notifyOnEntry:notifyOnExit:conservativeEntry:emergency:", 0, 0, 0, identifier, 0, 1, center.latitude, center.longitude, radius, v6);
}

- (CLCircularRegion)initWithCenter:(CLLocationCoordinate2D)a3 radius:(double)a4 referenceFrame:(int)a5 allowMonitoringWhenNearby:(BOOL)a6 lowPower:(BOOL)a7 identifier:(id)a8 onBehalfOfBundleId:(id)a9 notifyOnEntry:(BOOL)a10 notifyOnExit:(BOOL)a11 conservativeEntry:(BOOL)a12 emergency:(BOOL)a13
{
  *(_WORD *)((char *)&v14 + 1) = __PAIR16__(a13, a12);
  LOBYTE(v14) = a11;
  return -[CLCircularRegion initWithCenter:radius:referenceFrame:allowMonitoringWhenNearby:lowPower:identifier:onBehalfOfBundleId:notifyOnEntry:notifyOnExit:conservativeEntry:emergency:deviceId:handoffTag:](self, "initWithCenter:radius:referenceFrame:allowMonitoringWhenNearby:lowPower:identifier:onBehalfOfBundleId:notifyOnEntry:notifyOnExit:conservativeEntry:emergency:deviceId:handoffTag:", 0, a6, a7, a8, a9, a10, a3.latitude, a3.longitude, a4, v14, 0, 0);
}

- (CLCircularRegion)initWithCenter:(CLLocationCoordinate2D)a3 radius:(double)a4 referenceFrame:(int)a5 allowMonitoringWhenNearby:(BOOL)a6 lowPower:(BOOL)a7 identifier:(id)a8 onBehalfOfBundleId:(id)a9 notifyOnEntry:(BOOL)a10 notifyOnExit:(BOOL)a11 conservativeEntry:(BOOL)a12 emergency:(BOOL)a13 deviceId:(id)a14 handoffTag:(id)a15
{
  CLLocationDegrees longitude = a3.longitude;
  CLLocationDegrees latitude = a3.latitude;
  v23.receiver = self;
  v23.super_class = (Class)CLCircularRegion;
  result = [(CLRegion *)&v23 initWithIdentifier:a8 onBehalfOf:a9 regionType:1 notifyOnEntry:a10 notifyOnExit:a11 conservativeEntry:a12 emergency:a13 deviceId:a14 handoffTag:a15];
  if (result)
  {
    result->_geoCenter.CLLocationDegrees latitude = latitude;
    result->_geoCenter.CLLocationDegrees longitude = longitude;
    result->_geoRadius = a4;
    result->_isLowPower = a7;
    result->_desiredAccuracy = -1.0;
    result->_geoReferenceFrame = a5;
    result->_allowMonitoringWhileNearby = a6;
  }
  return result;
}

- (CLCircularRegion)initWithCenter:(CLLocationCoordinate2D)a3 radius:(double)a4 identifier:(id)a5 onBehalfOfBundleId:(id)a6
{
  BYTE2(v7) = 0;
  LOWORD(v7) = 1;
  return -[CLCircularRegion initWithCenter:radius:referenceFrame:allowMonitoringWhenNearby:lowPower:identifier:onBehalfOfBundleId:notifyOnEntry:notifyOnExit:conservativeEntry:emergency:](self, "initWithCenter:radius:referenceFrame:allowMonitoringWhenNearby:lowPower:identifier:onBehalfOfBundleId:notifyOnEntry:notifyOnExit:conservativeEntry:emergency:", 0, 0, 0, a5, a6, 1, a3.latitude, a3.longitude, a4, v7);
}

- (CLCircularRegion)initWithCenter:(CLLocationCoordinate2D)a3 radius:(double)a4 identifier:(id)a5 nearbyAllowed:(BOOL)a6
{
  result = -[CLCircularRegion initWithCenter:radius:identifier:](self, "initWithCenter:radius:identifier:", a5, a3.latitude, a3.longitude, a4);
  if (result) {
    result->_allowMonitoringWhileNearby = a6;
  }
  return result;
}

- (id)initNearbyAllowedWithCenter:(CLLocationCoordinate2D)a3 radius:(double)a4 identifier:(id)a5
{
  BYTE2(v6) = 0;
  LOWORD(v6) = 1;
  return -[CLCircularRegion initWithCenter:radius:referenceFrame:allowMonitoringWhenNearby:lowPower:identifier:onBehalfOfBundleId:notifyOnEntry:notifyOnExit:conservativeEntry:emergency:](self, "initWithCenter:radius:referenceFrame:allowMonitoringWhenNearby:lowPower:identifier:onBehalfOfBundleId:notifyOnEntry:notifyOnExit:conservativeEntry:emergency:", 0, 1, 0, a5, 0, 1, a3.latitude, a3.longitude, a4, v6);
}

- (id)initForLowPowerWithCenter:(CLLocationCoordinate2D)a3 radius:(double)a4 identifier:(id)a5
{
  BYTE2(v6) = 0;
  LOWORD(v6) = 1;
  return -[CLCircularRegion initWithCenter:radius:referenceFrame:allowMonitoringWhenNearby:lowPower:identifier:onBehalfOfBundleId:notifyOnEntry:notifyOnExit:conservativeEntry:emergency:](self, "initWithCenter:radius:referenceFrame:allowMonitoringWhenNearby:lowPower:identifier:onBehalfOfBundleId:notifyOnEntry:notifyOnExit:conservativeEntry:emergency:", 0, 0, 1, a5, 0, 1, a3.latitude, a3.longitude, a4, v6);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLCircularRegion)initWithCoder:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CLCircularRegion;
  v4 = -[CLRegion initWithCoder:](&v14, sel_initWithCoder_);
  if (v4)
  {
    long long v13 = 0uLL;
    uint64_t v12 = 0;
    int v11 = 0;
    __int16 v10 = 0;
    int v9 = 0;
    if ([a3 allowsKeyedCoding])
    {
      [a3 decodeDoubleForKey:@"kCLCircularRegionCodingKeyCenterLatitude"];
      *(void *)&long long v13 = v5;
      [a3 decodeDoubleForKey:@"kCLCircularRegionCodingKeyCenterLongitude"];
      *((void *)&v13 + 1) = v6;
      [a3 decodeDoubleForKey:@"kCLCircularRegionCodingKeyRadius"];
      uint64_t v12 = v7;
      if ([a3 containsValueForKey:@"reserved"]) {
        int v11 = [a3 decodeIntForKey:@"reserved"];
      }
      if ([a3 containsValueForKey:@"kCLCircularRegionCodingKeyMonitoringNearby"]) {
        HIBYTE(v10) = [a3 decodeBoolForKey:@"kCLCircularRegionCodingKeyMonitoringNearby"];
      }
      if ([a3 containsValueForKey:@"kCLCircularRegionCodingKeyLowPower"]) {
        LOBYTE(v10) = [a3 decodeBoolForKey:@"kCLCircularRegionCodingKeyLowPower"];
      }
      if (_os_feature_enabled_impl()
        && [a3 containsValueForKey:@"kCLCircularRegionEncodedKeyVersion"])
      {
        [a3 decodeIntForKey:@"kCLCircularRegionEncodedKeyVersion"];
      }
    }
    else
    {
      [a3 decodeValueOfObjCType:"d" at:&v13];
      [a3 decodeValueOfObjCType:"d" at:(char *)&v13 + 8];
      [a3 decodeValueOfObjCType:"d" at:&v12];
      [a3 decodeValueOfObjCType:"i" at:&v11];
      [a3 decodeValueOfObjCType:"B" at:(char *)&v10 + 1];
      [a3 decodeValueOfObjCType:"B" at:&v10];
      if (_os_feature_enabled_impl()) {
        [a3 decodeValueOfObjCType:"i" at:&v9];
      }
    }
    *(_OWORD *)(v4 + 104) = v13;
    *((void *)v4 + 11) = v12;
    *((_DWORD *)v4 + 21) = v11;
    *((_WORD *)v4 + 40) = v10;
    *((void *)v4 + 12) = 0xBFF0000000000000;
  }
  return (CLCircularRegion *)v4;
}

- (id)initLegacyObjectWithCoder:(id)a3
{
  unsigned __int8 v27 = 1;
  unsigned __int8 v26 = 1;
  __int16 v25 = 0;
  double v23 = 0.0;
  double v24 = 0.0;
  double v22 = 0.0;
  unsigned int v21 = 0;
  if ([a3 allowsKeyedCoding])
  {
    [a3 decodeDoubleForKey:@"kCLRegionCodingKeyCenterLatitude"];
    double v6 = v5;
    double v23 = v5;
    [a3 decodeDoubleForKey:@"kCLRegionCodingKeyCenterLongitude"];
    double v8 = v7;
    double v24 = v7;
    [a3 decodeDoubleForKey:@"kCLRegionCodingKeyRadius"];
    double v10 = v9;
    double v22 = v9;
    id v11 = (id)[a3 decodeObjectForKey:@"kCLRegionCodingKeyIdentifier"];
    id v12 = (id)[a3 decodeObjectForKey:@"kCLRegionCodingKeyOnBehalfOfBundleId"];
    if ([a3 containsValueForKey:@"kCLRegionCodingKeyNotifyOnEntry"])
    {
      int v13 = [a3 decodeBoolForKey:@"kCLRegionCodingKeyNotifyOnEntry"];
      unsigned __int8 v27 = v13;
    }
    else
    {
      int v13 = 1;
    }
    if ([a3 containsValueForKey:@"kCLRegionCodingKeyNotifyOnExit"])
    {
      int v15 = [a3 decodeBoolForKey:@"kCLRegionCodingKeyNotifyOnExit"];
      unsigned __int8 v26 = v15;
    }
    else
    {
      int v15 = 1;
    }
    if ([a3 containsValueForKey:@"kCLRegionCodingKeyConservativeEntry"])
    {
      int v16 = [a3 decodeBoolForKey:@"kCLRegionCodingKeyConservativeEntry"];
      HIBYTE(v25) = v16;
    }
    else
    {
      int v16 = 0;
    }
    if ([a3 containsValueForKey:@"reserved"])
    {
      uint64_t v14 = [a3 decodeIntForKey:@"reserved"];
      unsigned int v21 = v14;
    }
    else
    {
      uint64_t v14 = 0;
    }
    int v17 = [a3 containsValueForKey:@"kCLRegionCodingKeyEmergency"];
    if (v17)
    {
      LOBYTE(v17) = [a3 decodeBoolForKey:@"kCLRegionCodingKeyEmergency"];
      LOBYTE(v25) = v17;
    }
  }
  else
  {
    [a3 decodeValueOfObjCType:"d" at:&v23];
    [a3 decodeValueOfObjCType:"d" at:&v24];
    [a3 decodeValueOfObjCType:"d" at:&v22];
    id v11 = (id)[a3 decodeObject];
    id v12 = (id)[a3 decodeObject];
    [a3 decodeValueOfObjCType:"B" at:&v27];
    [a3 decodeValueOfObjCType:"B" at:&v26];
    [a3 decodeValueOfObjCType:"B" at:(char *)&v25 + 1];
    [a3 decodeValueOfObjCType:"i" at:&v21];
    [a3 decodeValueOfObjCType:"B" at:&v25];
    double v10 = v22;
    double v6 = v23;
    uint64_t v14 = v21;
    int v13 = v27;
    int v15 = v26;
    int v16 = HIBYTE(v25);
    double v8 = v24;
    LOBYTE(v17) = (_BYTE)v25 != 0;
  }
  BYTE2(v20) = v17;
  BYTE1(v20) = v16 != 0;
  LOBYTE(v20) = v15 != 0;
  v18 = -[CLCircularRegion initWithCenter:radius:referenceFrame:allowMonitoringWhenNearby:lowPower:identifier:onBehalfOfBundleId:notifyOnEntry:notifyOnExit:conservativeEntry:emergency:](self, "initWithCenter:radius:referenceFrame:allowMonitoringWhenNearby:lowPower:identifier:onBehalfOfBundleId:notifyOnEntry:notifyOnExit:conservativeEntry:emergency:", v14, 0, 0, v11, v12, v13 != 0, v6, v8, v10, v20);

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  v21.receiver = self;
  v21.super_class = (Class)CLCircularRegion;
  -[CLRegion encodeWithCoder:](&v21, sel_encodeWithCoder_);
  [(CLCircularRegion *)self center];
  double v6 = v5;
  double v19 = v5;
  [(CLCircularRegion *)self center];
  double v8 = v7;
  double v20 = v7;
  [(CLCircularRegion *)self radius];
  double v10 = v9;
  double v18 = v9;
  uint64_t v11 = [(CLCircularRegion *)self geoReferenceFrame];
  int v17 = v11;
  BOOL v12 = [(CLCircularRegion *)self allowMonitoringWhileNearby];
  BOOL v16 = v12;
  BOOL v13 = [(CLCircularRegion *)self isLowPower];
  BOOL v15 = v13;
  int v14 = 1;
  if ([a3 allowsKeyedCoding])
  {
    [a3 encodeDouble:@"kCLCircularRegionCodingKeyCenterLatitude" forKey:v6];
    [a3 encodeDouble:@"kCLCircularRegionCodingKeyCenterLongitude" forKey:v8];
    [a3 encodeDouble:@"kCLCircularRegionCodingKeyRadius" forKey:v10];
    [a3 encodeInt:v11 forKey:@"reserved"];
    [a3 encodeBool:v12 forKey:@"kCLCircularRegionCodingKeyMonitoringNearby"];
    [a3 encodeBool:v13 forKey:@"kCLCircularRegionCodingKeyLowPower"];
    if (_os_feature_enabled_impl()) {
      [a3 encodeInt:1 forKey:@"kCLCircularRegionEncodedKeyVersion"];
    }
  }
  else
  {
    [a3 encodeValueOfObjCType:"d" at:&v19];
    [a3 encodeValueOfObjCType:"d" at:&v20];
    [a3 encodeValueOfObjCType:"d" at:&v18];
    [a3 encodeValueOfObjCType:"i" at:&v17];
    [a3 encodeValueOfObjCType:"B" at:&v16];
    [a3 encodeValueOfObjCType:"B" at:&v15];
    if (_os_feature_enabled_impl()) {
      [a3 encodeValueOfObjCType:"i" at:&v14];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CLCircularRegion;
  v4 = [(CLRegion *)&v12 copyWithZone:a3];
  double v5 = v4;
  if (v4)
  {
    double v6 = v4 + 104;
    [(CLCircularRegion *)self center];
    *double v6 = v7;
    v5[14] = v8;
    [(CLCircularRegion *)self radius];
    v5[11] = v9;
    [(CLCircularRegion *)self desiredAccuracy];
    v5[12] = v10;
    *((_DWORD *)v5 + 21) = [(CLCircularRegion *)self geoReferenceFrame];
    *((unsigned char *)v5 + 81) = [(CLCircularRegion *)self allowMonitoringWhileNearby];
    *((unsigned char *)v5 + 80) = [(CLCircularRegion *)self isLowPower];
  }
  return v5;
}

- (id)description
{
  v3 = NSString;
  v4 = [(CLRegion *)self identifier];
  [(CLCircularRegion *)self center];
  uint64_t v6 = v5;
  [(CLCircularRegion *)self center];
  uint64_t v8 = v7;
  [(CLCircularRegion *)self radius];
  return (id)[v3 stringWithFormat:@"CLCircularRegion (identifier:'%@', center:<%+.8f,%+.8f>, radius:%.2fm)", v4, v6, v8, v9];
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)CLCircularRegion;
  unint64_t v3 = [(CLRegion *)&v7 hash];
  v6.receiver = self;
  v6.super_class = (Class)CLCircularRegion;
  if ([(CLRegion *)&v6 onBehalfOfBundleId])
  {
    v5.receiver = self;
    v5.super_class = (Class)CLCircularRegion;
    v3 ^= [(NSString *)[(CLRegion *)&v5 onBehalfOfBundleId] hash];
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CLCircularRegion;
  return [(CLRegion *)&v4 isEqual:a3];
}

- (BOOL)containsCoordinate:(CLLocationCoordinate2D)coordinate
{
  double longitude = coordinate.longitude;
  double latitude = coordinate.latitude;
  [(CLCircularRegion *)self center];
  double v7 = v6;
  [(CLCircularRegion *)self center];
  double v9 = sub_1906D7AA4(latitude, longitude, v7, v8);
  [(CLCircularRegion *)self radius];
  return v9 <= v10;
}

- (CLLocationCoordinate2D)center
{
  double latitude = self->_geoCenter.latitude;
  double longitude = self->_geoCenter.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (CLLocationDistance)radius
{
  return self->_geoRadius;
}

- (int)referenceFrame
{
  return self->_geoReferenceFrame;
}

- (CLLocationCoordinate2D)geoCenter
{
  double latitude = self->_geoCenter.latitude;
  double longitude = self->_geoCenter.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (double)geoRadius
{
  return self->_geoRadius;
}

- (int)geoReferenceFrame
{
  return self->_geoReferenceFrame;
}

- (void)setGeoReferenceFrame:(int)a3
{
  self->_geoReferenceFrame = a3;
}

- (BOOL)isLowPower
{
  return self->_isLowPower;
}

- (double)desiredAccuracy
{
  return self->_desiredAccuracy;
}

- (BOOL)allowMonitoringWhileNearby
{
  return self->_allowMonitoringWhileNearby;
}

@end