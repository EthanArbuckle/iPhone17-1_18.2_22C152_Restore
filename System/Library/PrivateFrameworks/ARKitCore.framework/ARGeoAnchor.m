@interface ARGeoAnchor
+ (BOOL)supportsSecureCoding;
- (ARAltitudeSource)altitudeSource;
- (ARGeoAnchor)initWithAnchor:(id)a3;
- (ARGeoAnchor)initWithCoder:(id)a3;
- (ARGeoAnchor)initWithCoordinate:(CLLocationCoordinate2D)a3 altitude:(double)a4 altitudeSource:(int64_t)a5 isAltitudeAvailable:(BOOL)a6 undulation:(double)a7;
- (ARGeoAnchor)initWithCoordinate:(CLLocationCoordinate2D)coordinate;
- (ARGeoAnchor)initWithCoordinate:(CLLocationCoordinate2D)coordinate altitude:(CLLocationDistance)altitude;
- (ARGeoAnchor)initWithName:(NSString *)name coordinate:(CLLocationCoordinate2D)coordinate;
- (ARGeoAnchor)initWithName:(NSString *)name coordinate:(CLLocationCoordinate2D)coordinate altitude:(CLLocationDistance)altitude;
- (BOOL)isAltitudeAvailable;
- (BOOL)isAltitudeLookupInProgress;
- (BOOL)isTracked;
- (CLLocationCoordinate2D)coordinate;
- (CLLocationDistance)altitude;
- (NSString)description;
- (__n128)ecefFromAnchor;
- (__n128)locationECEF;
- (__n128)locationLLA;
- (double)undulation;
- (void)encodeWithCoder:(id)a3;
- (void)setIsAltitudeLookupInProgress:(BOOL)a3;
- (void)setIsTracked:(BOOL)a3;
@end

@implementation ARGeoAnchor

- (ARGeoAnchor)initWithCoordinate:(CLLocationCoordinate2D)coordinate
{
  double longitude = coordinate.longitude;
  double latitude = coordinate.latitude;
  v8.receiver = self;
  v8.super_class = (Class)ARGeoAnchor;
  v5 = -[ARAnchor initWithTransform:](&v8, sel_initWithTransform_, *MEMORY[0x1E4F149A0], *(double *)(MEMORY[0x1E4F149A0] + 16), *(double *)(MEMORY[0x1E4F149A0] + 32), *(double *)(MEMORY[0x1E4F149A0] + 48));
  v6 = v5;
  if (v5) {
    -[ARGeoAnchor initWithCoordinate:altitude:altitudeSource:isAltitudeAvailable:undulation:](v5, "initWithCoordinate:altitude:altitudeSource:isAltitudeAvailable:undulation:", 0, 0, latitude, longitude, 0.0, 0.0);
  }
  return v6;
}

- (ARGeoAnchor)initWithCoordinate:(CLLocationCoordinate2D)coordinate altitude:(CLLocationDistance)altitude
{
  double longitude = coordinate.longitude;
  double latitude = coordinate.latitude;
  v10.receiver = self;
  v10.super_class = (Class)ARGeoAnchor;
  v7 = -[ARAnchor initWithTransform:](&v10, sel_initWithTransform_, *MEMORY[0x1E4F149A0], *(double *)(MEMORY[0x1E4F149A0] + 16), *(double *)(MEMORY[0x1E4F149A0] + 32), *(double *)(MEMORY[0x1E4F149A0] + 48));
  objc_super v8 = v7;
  if (v7) {
    -[ARGeoAnchor initWithCoordinate:altitude:altitudeSource:isAltitudeAvailable:undulation:](v7, "initWithCoordinate:altitude:altitudeSource:isAltitudeAvailable:undulation:", 3, 0, latitude, longitude, altitude, 0.0);
  }
  return v8;
}

- (ARGeoAnchor)initWithName:(NSString *)name coordinate:(CLLocationCoordinate2D)coordinate
{
  double longitude = coordinate.longitude;
  double latitude = coordinate.latitude;
  v9.receiver = self;
  v9.super_class = (Class)ARGeoAnchor;
  v6 = -[ARAnchor initWithName:transform:](&v9, sel_initWithName_transform_, name, *MEMORY[0x1E4F149A0], *(double *)(MEMORY[0x1E4F149A0] + 16), *(double *)(MEMORY[0x1E4F149A0] + 32), *(double *)(MEMORY[0x1E4F149A0] + 48));
  v7 = v6;
  if (v6) {
    -[ARGeoAnchor initWithCoordinate:altitude:altitudeSource:isAltitudeAvailable:undulation:](v6, "initWithCoordinate:altitude:altitudeSource:isAltitudeAvailable:undulation:", 0, 0, latitude, longitude, 0.0, 0.0);
  }
  return v7;
}

- (ARGeoAnchor)initWithName:(NSString *)name coordinate:(CLLocationCoordinate2D)coordinate altitude:(CLLocationDistance)altitude
{
  double longitude = coordinate.longitude;
  double latitude = coordinate.latitude;
  v11.receiver = self;
  v11.super_class = (Class)ARGeoAnchor;
  objc_super v8 = -[ARAnchor initWithName:transform:](&v11, sel_initWithName_transform_, name, *MEMORY[0x1E4F149A0], *(double *)(MEMORY[0x1E4F149A0] + 16), *(double *)(MEMORY[0x1E4F149A0] + 32), *(double *)(MEMORY[0x1E4F149A0] + 48));
  objc_super v9 = v8;
  if (v8) {
    -[ARGeoAnchor initWithCoordinate:altitude:altitudeSource:isAltitudeAvailable:undulation:](v8, "initWithCoordinate:altitude:altitudeSource:isAltitudeAvailable:undulation:", 3, 0, latitude, longitude, altitude, 0.0);
  }
  return v9;
}

- (ARGeoAnchor)initWithCoordinate:(CLLocationCoordinate2D)a3 altitude:(double)a4 altitudeSource:(int64_t)a5 isAltitudeAvailable:(BOOL)a6 undulation:(double)a7
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  self->_altitudeSource = a5;
  self->_isAltitudeAvailable = a6;
  self->_undulation = a7;
  self->_coordinate = a3;
  CLLocationDegrees latitude = a3.latitude;
  CLLocationDegrees longitude = a3.longitude;
  CLLocationDegrees v10 = a3.longitude;
  *(CLLocationCoordinate2D *)self->_locationLLA = a3;
  *(_OWORD *)&self->_locationLLA[16] = *(_OWORD *)&a4;
  if (_ARLogTechnique_onceToken_11 != -1) {
    dispatch_once(&_ARLogTechnique_onceToken_11, &__block_literal_global_65);
  }
  objc_super v11 = (void *)_ARLogTechnique_logObj_11;
  if (os_log_type_enabled((os_log_t)_ARLogTechnique_logObj_11, OS_LOG_TYPE_INFO))
  {
    v12 = v11;
    v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    *(_DWORD *)buf = 138544387;
    *(void *)&buf[4] = v14;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = self;
    *(_WORD *)&buf[22] = 2049;
    *(CLLocationDegrees *)&buf[24] = latitude;
    *(_WORD *)v33 = 2049;
    *(CLLocationDegrees *)&v33[2] = longitude;
    *(_WORD *)&v33[10] = 2048;
    *(void *)&v33[12] = a5;
    _os_log_impl(&dword_1B88A2000, v12, OS_LOG_TYPE_INFO, "%{public}@ <%p>: GeoAnchor<- %{private}.8f,%{private}.8f,%li", buf, 0x34u);
  }
  long long v26 = *(_OWORD *)self->_locationLLA;
  long long v28 = *(_OWORD *)&self->_locationLLA[16];
  double v15 = ARMSLToWGS84Altitude(a4, a7);
  *((void *)&v16 + 1) = *((void *)&v28 + 1);
  *(double *)&long long v16 = v15;
  long long v29 = v16;
  v30[2] = v26;
  v30[3] = v16;
  ARLLAToECEF(v31);
  long long v17 = v31[1];
  *(_OWORD *)self->_locationECEF = v31[0];
  *(_OWORD *)&self->_locationECEF[16] = v17;
  v18 = self + 1;
  v30[0] = v26;
  v30[1] = v29;
  ARAnchorToECEFTransform(v30, buf);
  long long v20 = v35;
  *(_OWORD *)&v18->super._anon_30[16] = v34;
  *(_OWORD *)&v18->super._anon_30[32] = v20;
  long long v21 = v37;
  *(_OWORD *)&v18->super._anon_30[48] = v36;
  *(_OWORD *)v18->_anon_70 = v21;
  long long v22 = *(_OWORD *)&buf[16];
  *(_OWORD *)&v18->super.super.isa = *(_OWORD *)buf;
  *(_OWORD *)&v18->super._identifier = v22;
  long long v23 = *(_OWORD *)&v33[16];
  *(_OWORD *)&v18->super._sessionIdentifier = *(_OWORD *)v33;
  *(_OWORD *)v18->super._anon_30 = v23;
  return result;
}

- (CLLocationDistance)altitude
{
  return *(double *)&self->_locationLLA[16];
}

- (NSString)description
{
  v17.receiver = self;
  v17.super_class = (Class)ARGeoAnchor;
  v3 = [(ARAnchor *)&v17 description];
  uint64_t v4 = [v3 length];
  v5 = NSString;
  CLLocationDegrees latitude = self->_coordinate.latitude;
  CLLocationDegrees longitude = self->_coordinate.longitude;
  [(ARGeoAnchor *)self altitude];
  uint64_t v9 = v8;
  ARAltitudeSource v10 = [(ARGeoAnchor *)self altitudeSource];
  if ((unint64_t)v10 > ARAltitudeSourceUserDefined) {
    objc_super v11 = @"???";
  }
  else {
    objc_super v11 = off_1E61870E8[v10];
  }
  BOOL v12 = [(ARGeoAnchor *)self isAltitudeAvailable];
  [(ARGeoAnchor *)self undulation];
  v14 = [v5 stringWithFormat:@" coordinate=(%f,%f,%f) altitudeSource=%@ isAltitudeAvailable=%d undulation=%f>", *(void *)&latitude, *(void *)&longitude, v9, v11, v12, v13];
  double v15 = objc_msgSend(v3, "stringByReplacingCharactersInRange:withString:", v4 - 1, 1, v14);

  return (NSString *)v15;
}

- (ARGeoAnchor)initWithAnchor:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ARGeoAnchor;
  v5 = [(ARAnchor *)&v16 initWithAnchor:v4];
  if (v5)
  {
    [v4 coordinate];
    double v7 = v6;
    double v9 = v8;
    [v4 altitude];
    double v11 = v10;
    uint64_t v12 = [v4 altitudeSource];
    uint64_t v13 = [v4 isAltitudeAvailable];
    [v4 undulation];
    -[ARGeoAnchor initWithCoordinate:altitude:altitudeSource:isAltitudeAvailable:undulation:](v5, "initWithCoordinate:altitude:altitudeSource:isAltitudeAvailable:undulation:", v12, v13, v7, v9, v11, v14);
    -[ARGeoAnchor setIsTracked:](v5, "setIsTracked:", [v4 isTracked]);
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ARGeoAnchor;
  id v4 = a3;
  [(ARAnchor *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeDouble:forKey:", @"latitude", self->_coordinate.latitude, v5.receiver, v5.super_class);
  [v4 encodeDouble:@"longitude" forKey:self->_coordinate.longitude];
  [(ARGeoAnchor *)self altitude];
  objc_msgSend(v4, "encodeDouble:forKey:", @"altitude");
  [v4 encodeInteger:self->_altitudeSource forKey:@"altitudeSource"];
  [v4 encodeBool:self->_isAltitudeAvailable forKey:@"isAltitudeAvailable"];
  [v4 encodeDouble:@"undulation" forKey:self->_undulation];
  [v4 encodeBool:self->_isTracked forKey:@"tracked"];
}

- (ARGeoAnchor)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ARGeoAnchor;
  objc_super v5 = [(ARAnchor *)&v16 initWithCoder:v4];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"latitude"];
    double v7 = v6;
    [v4 decodeDoubleForKey:@"longitude"];
    double v9 = v8;
    [v4 decodeDoubleForKey:@"altitude"];
    double v11 = v10;
    uint64_t v12 = [v4 decodeIntegerForKey:@"altitudeSource"];
    uint64_t v13 = [v4 decodeBoolForKey:@"isAltitudeAvailable"];
    [v4 decodeDoubleForKey:@"undulation"];
    -[ARGeoAnchor initWithCoordinate:altitude:altitudeSource:isAltitudeAvailable:undulation:](v5, "initWithCoordinate:altitude:altitudeSource:isAltitudeAvailable:undulation:", v12, v13, v7, v9, v11, v14);
    v5->_isTracked = [v4 decodeBoolForKey:@"tracked"];
  }

  return v5;
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude = self->_coordinate.latitude;
  double longitude = self->_coordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (ARAltitudeSource)altitudeSource
{
  return self->_altitudeSource;
}

- (BOOL)isAltitudeAvailable
{
  return self->_isAltitudeAvailable;
}

- (BOOL)isAltitudeLookupInProgress
{
  return self->_isAltitudeLookupInProgress;
}

- (void)setIsAltitudeLookupInProgress:(BOOL)a3
{
  self->_isAltitudeLookupInProgress = a3;
}

- (double)undulation
{
  return self->_undulation;
}

- (BOOL)isTracked
{
  return self->_isTracked;
}

- (void)setIsTracked:(BOOL)a3
{
  self->_isTracked = a3;
}

- (__n128)locationLLA
{
  __n128 result = *(__n128 *)(a1 + 224);
  long long v3 = *(_OWORD *)(a1 + 240);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v3;
  return result;
}

- (__n128)locationECEF
{
  __n128 result = *(__n128 *)(a1 + 256);
  long long v3 = *(_OWORD *)(a1 + 272);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v3;
  return result;
}

- (__n128)ecefFromAnchor
{
  long long v2 = *(_OWORD *)(a1 + 368);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 352);
  *(_OWORD *)(a2 + 80) = v2;
  long long v3 = *(_OWORD *)(a1 + 400);
  *(_OWORD *)(a2 + 96) = *(_OWORD *)(a1 + 384);
  *(_OWORD *)(a2 + 112) = v3;
  long long v4 = *(_OWORD *)(a1 + 304);
  *(_OWORD *)a2 = *(_OWORD *)(a1 + 288);
  *(_OWORD *)(a2 + 16) = v4;
  __n128 result = *(__n128 *)(a1 + 320);
  long long v6 = *(_OWORD *)(a1 + 336);
  *(__n128 *)(a2 + 32) = result;
  *(_OWORD *)(a2 + 48) = v6;
  return result;
}

@end