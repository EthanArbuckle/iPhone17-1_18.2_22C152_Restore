@interface ARLocationData
+ (BOOL)isAltitudeValid:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)grabNextFromReader:(id)a3 timestamp:(double *)a4;
- (ARLocationData)initWithCoder:(id)a3;
- (ARLocationData)initWithDictionary:(id)a3;
- (ARLocationData)initWithLocation:(id)a3;
- (ARLocationData)initWithLocation:(id)a3 timestamp:(double)a4 secure:(BOOL)a5;
- (ARLocationData)initWithMetadataWrapper:(id)a3;
- (BOOL)isAltitudeValid;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSecure;
- (BOOL)isUndulationValid;
- (CLLocation)location;
- (NSString)description;
- (__n128)ecefFromlocation;
- (__n128)locationECEF;
- (__n128)locationLLA;
- (double)enuFromLocation:(void *)a1@<X2>;
- (double)timestamp;
- (double)undulation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)encodeToDictionary;
- (id)encodeToMetadataWrapper;
- (void)appendToWriter:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setLocation:(id)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation ARLocationData

- (ARLocationData)initWithLocation:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ARLocationData;
  v5 = [(ARLocationData *)&v11 init];
  if (v5)
  {
    if (initWithLocation__onceToken != -1) {
      dispatch_once(&initWithLocation__onceToken, &__block_literal_global_77);
    }
    double v6 = (double)mach_absolute_time();
    double v7 = *(double *)&initWithLocation__machTimeFactor;
    v8 = [v4 timestamp];
    [v8 timeIntervalSinceNow];
    v5->_timestamp = v9 + v6 * v7;

    v5->_secure = 1;
    [(ARLocationData *)v5 setLocation:v4];
  }

  return v5;
}

double __35__ARLocationData_initWithLocation___block_invoke()
{
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  LODWORD(v1) = info.denom;
  LODWORD(v0) = info.numer;
  double result = (double)v0 / (double)v1 * 0.000000001;
  initWithLocation__machTimeFactor = *(void *)&result;
  return result;
}

- (ARLocationData)initWithLocation:(id)a3 timestamp:(double)a4 secure:(BOOL)a5
{
  double result = [(ARLocationData *)self initWithLocation:a3];
  if (result)
  {
    result->_timestamp = a4;
    result->_secure = a5;
  }
  return result;
}

- (void)setLocation:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (CLLocation *)[v4 copy];
  location = self->_location;
  self->_location = v5;

  [v4 altitudeWgs84];
  long long v32 = v7;
  if ([v4 isAltitudeWgs84Available])
  {
    [v4 altitudeWgs84];
    double v9 = v8;
    [v4 altitude];
    self->_undulation = v9 - v10;
  }
  else
  {
    self->_undulation = NAN;
    if (_ARLogTechnique_onceToken_14 != -1) {
      dispatch_once(&_ARLogTechnique_onceToken_14, &__block_literal_global_205);
    }
    objc_super v11 = (void *)_ARLogTechnique_logObj_14;
    if (os_log_type_enabled((os_log_t)_ARLogTechnique_logObj_14, OS_LOG_TYPE_DEBUG))
    {
      v12 = v11;
      v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      [v4 coordinate];
      uint64_t v16 = v15;
      [v4 coordinate];
      *(_DWORD *)buf = 138544131;
      *(void *)&buf[4] = v14;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = self;
      *(_WORD *)&buf[22] = 2049;
      *(void *)&buf[24] = v16;
      LOWORD(v36) = 2049;
      *(void *)((char *)&v36 + 2) = v17;
      _os_log_impl(&dword_1B88A2000, v12, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Getting fallback undulation for location: %{private}.06f, %{private}.06f", buf, 0x2Au);
    }
    [v4 coordinate];
    double v20 = ARGetFallbackUndulationValue(v18, v19);
    self->_undulation = v20;
    *(double *)&long long v21 = ARMSLToWGS84Altitude(*(double *)&v32, v20);
    long long v32 = v21;
  }
  [v4 coordinate];
  uint64_t v31 = v22;
  [v4 coordinate];
  *(void *)&long long v23 = v31;
  *((void *)&v23 + 1) = v24;
  *(_OWORD *)self->_locationLLA = v23;
  *(_OWORD *)&self->_locationLLA[16] = v32;
  v33[2] = v23;
  v33[3] = v32;
  ARLLAToECEF(v34);
  long long v25 = v34[1];
  *(_OWORD *)self->_locationECEF = v34[0];
  *(_OWORD *)&self->_locationECEF[16] = v25;
  long long v26 = *(_OWORD *)&self->_locationLLA[16];
  v33[0] = *(_OWORD *)self->_locationLLA;
  v33[1] = v26;
  ARAnchorToECEFTransform(v33, buf);
  long long v27 = v39;
  *(_OWORD *)&self[1]._locationLLA[16] = v38;
  *(_OWORD *)self[1]._locationECEF = v27;
  long long v28 = v41;
  *(_OWORD *)&self[1]._locationECEF[16] = v40;
  *(_OWORD *)&self[2].super.isa = v28;
  long long v29 = *(_OWORD *)&buf[16];
  *(_OWORD *)&self[1].super.isa = *(_OWORD *)buf;
  *(_OWORD *)&self[1]._timestamp = v29;
  long long v30 = v37;
  *(_OWORD *)&self[1]._undulation = v36;
  *(_OWORD *)self[1]._locationLLA = v30;
}

- (BOOL)isUndulationValid
{
  return 1;
}

- (BOOL)isAltitudeValid
{
  return +[ARLocationData isAltitudeValid:self->_location];
}

- (double)enuFromLocation:(void *)a1@<X2>
{
  if (a1) {
    [a1 locationECEF];
  }
  ARECEFToENU(v5);
  double result = *(double *)v5;
  long long v4 = v5[1];
  *a2 = v5[0];
  a2[1] = v4;
  return result;
}

+ (BOOL)isAltitudeValid:(id)a3
{
  id v3 = a3;
  [v3 altitude];
  [v3 verticalAccuracy];
  BOOL v5 = v4 >= 0.0;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [(ARLocationData *)self timestamp];
  objc_msgSend(v4, "encodeDouble:forKey:", @"timestamp");
  [v4 encodeObject:self->_location forKey:@"location"];
}

- (ARLocationData)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeDoubleForKey:@"timestamp"];
  double v6 = v5;
  long long v7 = [v4 decodeObjectForKey:@"location"];

  double v8 = [(ARLocationData *)self initWithLocation:v7];
  [(ARLocationData *)v8 setTimestamp:v6];
  v8->_secure = 0;

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)encodeToDictionary
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self->_location requiringSecureCoding:1 error:0];
  id v4 = [v3 base64EncodedStringWithOptions:1];
  v9[0] = @"timestamp";
  double v5 = NSNumber;
  [(ARLocationData *)self timestamp];
  double v6 = objc_msgSend(v5, "numberWithDouble:");
  v9[1] = @"location";
  v10[0] = v6;
  v10[1] = v4;
  long long v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  return v7;
}

- (ARLocationData)initWithDictionary:(id)a3
{
  id v4 = a3;
  double v5 = [v4 objectForKeyedSubscript:@"timestamp"];
  [v5 doubleValue];
  double v7 = v6;

  double v8 = [v4 objectForKeyedSubscript:@"location"];

  double v9 = [v8 stringByReplacingOccurrencesOfString:@"\n" withString:&stru_1F120C8F0];

  double v10 = [v9 stringByReplacingOccurrencesOfString:@"\r" withString:&stru_1F120C8F0];

  objc_super v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v10 options:1];
  v12 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v11 error:0];
  v13 = [(ARLocationData *)self initWithLocation:v12];
  [(ARLocationData *)v13 setTimestamp:v7];
  v13->_secure = 0;

  return v13;
}

- (id)encodeToMetadataWrapper
{
  return (id)[MEMORY[0x1E4F4D5C8] encodeCoreLocationData:self->_location timestamp:0 andAdditionalData:self->_timestamp];
}

- (ARLocationData)initWithMetadataWrapper:(id)a3
{
  double v7 = 0.0;
  id v4 = [MEMORY[0x1E4F4D5C8] decodeCLLocation:a3 timestamp:&v7];
  double v5 = [(ARLocationData *)self initWithLocation:v4];
  [(ARLocationData *)v5 setTimestamp:v7];
  v5->_secure = 0;

  return v5;
}

- (void)appendToWriter:(id)a3
{
}

+ (id)grabNextFromReader:(id)a3 timestamp:(double *)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  double v6 = [MEMORY[0x1E4F1CA48] array];
  double v7 = (void *)MEMORY[0x1BA9C6160]();
  long long v8 = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 16);
  long long v25 = *MEMORY[0x1E4F1FA30];
  long long v26 = v8;
  long long v27 = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 32);
  id v24 = 0;
  double v9 = [v5 grabNextCLLocation:&v25 location:0 timestamps:&v24];
  id v10 = v24;
  uint64_t v11 = [v9 count];
  if (v11 == [v10 count])
  {
    if ([v9 count])
    {
      unint64_t v12 = 0;
      do
      {
        v13 = [v9 objectAtIndex:v12];
        v14 = [v10 objectAtIndex:v12];
        [v14 doubleValue];
        double v16 = v15;

        uint64_t v17 = (void *)[objc_alloc((Class)objc_opt_class()) initWithLocation:v13 timestamp:0 secure:v16];
        [v6 addObject:v17];

        ++v12;
      }
      while ([v9 count] > v12);
    }
    *(_OWORD *)&time.value = v25;
    time.epoch = v26;
    *a4 = CMTimeGetSeconds(&time);

    id v18 = v6;
  }
  else
  {
    double v19 = _ARLogGeneral_30();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      double v20 = (objc_class *)objc_opt_class();
      long long v21 = NSStringFromClass(v20);
      LODWORD(time.value) = 138543362;
      *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v21;
      _os_log_impl(&dword_1B88A2000, v19, OS_LOG_TYPE_ERROR, "%{public}@ error: Couldn't get timestamps for location data.", (uint8_t *)&time, 0xCu);
    }
    id v22 = v6;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[ARLocationData allocWithZone:a3] initWithLocation:self->_location];
  [(ARLocationData *)self timestamp];
  -[ARLocationData setTimestamp:](v4, "setTimestamp:");
  v4->_secure = self->_secure;
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = (CLLocation **)v4;
    if (self->_location == v5[3])
    {
      BOOL v9 = 1;
    }
    else
    {
      [(ARLocationData *)self timestamp];
      double v7 = v6;
      [v5 timestamp];
      BOOL v9 = vabdd_f64(v7, v8) < 2.22044605e-16;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (NSString)description
{
  id v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  double v6 = [v3 stringWithFormat:@"<%@: %p", v5, self];

  [(ARLocationData *)self timestamp];
  objc_msgSend(v6, "appendFormat:", @" timestamp=%f", v7);
  [(CLLocation *)self->_location coordinate];
  uint64_t v9 = v8;
  [(CLLocation *)self->_location coordinate];
  [v6 appendFormat:@" coordinates=(%f, %f)", v9, v10];
  [(CLLocation *)self->_location altitude];
  objc_msgSend(v6, "appendFormat:", @" altitude=%.3f m", v11);
  [(CLLocation *)self->_location horizontalAccuracy];
  objc_msgSend(v6, "appendFormat:", @" horizontalAccuracy=%.1f m", v12);
  [(CLLocation *)self->_location verticalAccuracy];
  objc_msgSend(v6, "appendFormat:", @" verticalAccuracy=%.1fm", v13);
  [(CLLocation *)self->_location altitudeWgs84];
  objc_msgSend(v6, "appendFormat:", @" altitudeWgs84=%.3fm", v14);
  if ([(CLLocation *)self->_location isAltitudeWgs84Available]) {
    double v15 = @"yes";
  }
  else {
    double v15 = @"no";
  }
  [v6 appendFormat:@" wgs84Available=%@", v15];
  [(CLLocation *)self->_location horizontalAccuracy];
  objc_msgSend(v6, "appendFormat:", @" accuracy=%.02fm", v16);
  if ([(CLLocation *)self->_location isCoordinateFused]) {
    uint64_t v17 = @"yes";
  }
  else {
    uint64_t v17 = @"no";
  }
  [v6 appendFormat:@" fused=%@", v17];
  if (self->_secure) {
    id v18 = @"yes";
  }
  else {
    id v18 = @"no";
  }
  [v6 appendFormat:@" isSecure=%@", v18];
  [v6 appendString:@">"];
  return (NSString *)v6;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (CLLocation)location
{
  return self->_location;
}

- (double)undulation
{
  return self->_undulation;
}

- (__n128)locationLLA
{
  __n128 result = *(__n128 *)(a1 + 48);
  long long v3 = *(_OWORD *)(a1 + 64);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v3;
  return result;
}

- (__n128)locationECEF
{
  __n128 result = *(__n128 *)(a1 + 80);
  long long v3 = *(_OWORD *)(a1 + 96);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v3;
  return result;
}

- (__n128)ecefFromlocation
{
  long long v2 = *(_OWORD *)(a1 + 192);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 176);
  *(_OWORD *)(a2 + 80) = v2;
  long long v3 = *(_OWORD *)(a1 + 224);
  *(_OWORD *)(a2 + 96) = *(_OWORD *)(a1 + 208);
  *(_OWORD *)(a2 + 112) = v3;
  long long v4 = *(_OWORD *)(a1 + 128);
  *(_OWORD *)a2 = *(_OWORD *)(a1 + 112);
  *(_OWORD *)(a2 + 16) = v4;
  __n128 result = *(__n128 *)(a1 + 144);
  long long v6 = *(_OWORD *)(a1 + 160);
  *(__n128 *)(a2 + 32) = result;
  *(_OWORD *)(a2 + 48) = v6;
  return result;
}

- (BOOL)isSecure
{
  return self->_secure;
}

- (void).cxx_destruct
{
}

@end