@interface CMOdometerData
+ (BOOL)supportsSecureCoding;
- (CLLocationAccuracy)deltaDistanceAccuracy;
- (CLLocationAccuracy)verticalAccuracy;
- (CLLocationDistance)deltaAltitude;
- (CLLocationDistance)deltaDistance;
- (CLLocationSpeed)speed;
- (CLLocationSpeedAccuracy)speedAccuracy;
- (CMOdometerData)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5;
- (CMOdometerData)initWithCoder:(id)a3;
- (CMOdometerData)initWithDeltaDistance:(double)a3 startDate:(id)a4 endDate:(id)a5 accuracy:(id)a6 rawSpeed:(id)a7 gpsSpeedAccuracy:(id)a8 timestampGps:(id)a9 deltaGroundAltitude:(id)a10 groundAltitudeUncertainty:(id)a11 originDevice:(int64_t)a12 slope:(id)a13 maxAbsSlope:(id)a14;
- (CMOdometerData)initWithDistance:(id)a3 startDate:(id)a4 endDate:(id)a5 currentSpeed:(id)a6 averageSpeed:(id)a7;
- (CMOdometerOriginDevice)originDevice;
- (NSDate)endDate;
- (NSDate)gpsDate;
- (NSDate)startDate;
- (NSNumber)accuracy;
- (NSNumber)averageSpeed;
- (NSNumber)currentSpeed;
- (NSNumber)deltaGroundAltitude;
- (NSNumber)distance;
- (NSNumber)gpsAltitude;
- (NSNumber)gpsCourseAccuracy;
- (NSNumber)gpsCourseRadians;
- (NSNumber)gpsSpeedAccuracy;
- (NSNumber)groundAltitude;
- (NSNumber)groundAltitudeUncertainty;
- (NSNumber)maxAbsSlope;
- (NSNumber)odometer;
- (NSNumber)rawSpeed;
- (NSNumber)slope;
- (NSNumber)smoothedGPSAltitude;
- (NSNumber)smoothedGPSAltitudeUncertainty;
- (NSNumber)timestampGps;
- (NSString)description;
- (id)binarySampleRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)relativeTimestampGps;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAccuracy:(id)a3;
- (void)setAverageSpeed:(id)a3;
- (void)setCurrentSpeed:(id)a3;
- (void)setDeltaGroundAltitude:(id)a3;
- (void)setDistance:(id)a3;
- (void)setGpsAltitude:(id)a3;
- (void)setGpsCourseAccuracy:(id)a3;
- (void)setGpsCourseRadians:(id)a3;
- (void)setGpsSpeedAccuracy:(id)a3;
- (void)setGroundAltitude:(id)a3;
- (void)setGroundAltitudeUncertainty:(id)a3;
- (void)setOdometer:(id)a3;
- (void)setRawSpeed:(id)a3;
- (void)setSmoothedGPSAltitude:(id)a3;
- (void)setSmoothedGPSAltitudeUncertainty:(id)a3;
- (void)setTimestampGps:(id)a3;
- (void)updateStartDate:(id)a3;
@end

@implementation CMOdometerData

- (CMOdometerData)initWithDistance:(id)a3 startDate:(id)a4 endDate:(id)a5 currentSpeed:(id)a6 averageSpeed:(id)a7
{
  v15.receiver = self;
  v15.super_class = (Class)CMOdometerData;
  v12 = [(CMOdometerData *)&v15 init];
  if (v12)
  {
    *((void *)v12 + 3) = a4;
    *((void *)v12 + 4) = a5;
    *((void *)v12 + 7) = a6;
    *((void *)v12 + 8) = a7;
    id v13 = a3;
    *((void *)v12 + 5) = 0;
    *((void *)v12 + 6) = v13;
    *((void *)v12 + 1) = 0;
    *((void *)v12 + 2) = 0;
    *(_OWORD *)(v12 + 72) = 0u;
    *(_OWORD *)(v12 + 88) = 0u;
    *(_OWORD *)(v12 + 104) = 0u;
    *(_OWORD *)(v12 + 120) = 0u;
    *(_OWORD *)(v12 + 136) = 0u;
    *(_OWORD *)(v12 + 152) = 0u;
    *((void *)v12 + 21) = 0;
  }
  return (CMOdometerData *)v12;
}

- (CMOdometerData)initWithCoder:(id)a3
{
  v47.receiver = self;
  v47.super_class = (Class)CMOdometerData;
  v4 = [(CMOdometerData *)&v47 init];
  if (v4)
  {
    uint64_t v5 = objc_opt_class();
    v4->_startDate = (NSDate *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, @"kCMOdometerDataCodingKeyStartDate");
    uint64_t v7 = objc_opt_class();
    v4->_endDate = (NSDate *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v8, v7, @"kCMOdometerDataCodingKeyEndDate");
    uint64_t v9 = objc_opt_class();
    v4->_distance = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v10, v9, @"kCMOdometerDataCodingKeyDistance");
    uint64_t v11 = objc_opt_class();
    v4->_currentSpeed = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v12, v11, @"kCMOdometerDataCodingKeyCurrentSpeed");
    uint64_t v13 = objc_opt_class();
    v4->_averageSpeed = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v14, v13, @"kCMOdometerDataCodingKeyAverageSpeed");
    uint64_t v15 = objc_opt_class();
    v4->_accuracy = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v16, v15, @"kCMOdometerDataCodingKeyAccuracy");
    uint64_t v17 = objc_opt_class();
    v4->_gpsAltitude = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v18, v17, @"kCMOdometerDataCodingKeyGPSAltitude");
    uint64_t v19 = objc_opt_class();
    v4->_rawSpeed = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v20, v19, @"kCMOdometerDataCodingKeyRawSpeed");
    uint64_t v21 = objc_opt_class();
    v4->_odometer = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v22, v21, @"kCMOdometerDataCodingKeyOdometer");
    uint64_t v23 = objc_opt_class();
    v4->_gpsSpeedAccuracy = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v24, v23, @"kCMOdometerDataCodingKeyGPSSpeedAccuracy");
    uint64_t v25 = objc_opt_class();
    v4->_timestampGps = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v26, v25, @"kCMOdometerDataCodingKeyTimestampGPS");
    uint64_t v27 = objc_opt_class();
    v4->_groundAltitude = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v28, v27, @"kCMOdometerDataCodingKeyGroundAltitude");
    uint64_t v29 = objc_opt_class();
    v4->_groundAltitudeUncertainty = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v30, v29, @"kCMOdometerDataCodingKeyGroundAltitudeUncertainty");
    uint64_t v31 = objc_opt_class();
    v4->_smoothedGPSAltitude = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v32, v31, @"kCMOdometerDataCodingKeySmoothedGPSAltitude");
    uint64_t v33 = objc_opt_class();
    v4->_smoothedGPSAltitudeUncertainty = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v34, v33, @"kCMOdometerDataCodingKeySmoothedGPSAltitudeUncertainty");
    uint64_t v35 = objc_opt_class();
    v4->_gpsCourseRadians = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v36, v35, @"kCMOdometerDataCodingKeyGPSCourseRadians");
    uint64_t v37 = objc_opt_class();
    v4->_gpsCourseAccuracy = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v38, v37, @"kCMOdometerDataCodingKeyGPSCourseAccuracy");
    v4->_originDevice = objc_msgSend_decodeIntegerForKey_(a3, v39, @"kCMOdometerDataCodingKeyOriginDevice");
    uint64_t v40 = objc_opt_class();
    v4->_deltaGroundAltitude = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v41, v40, @"kCMOdometerDataCodingKeyDeltaGroundAltitude");
    uint64_t v42 = objc_opt_class();
    v4->_slope = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v43, v42, @"kCMOdometerDataCodingKeySlope");
    uint64_t v44 = objc_opt_class();
    v4->_maxAbsSlope = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v45, v44, @"kCMOdometerDataCodingKeyMaxAbsSlope");
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  started = objc_msgSend_initWithDistance_startDate_endDate_currentSpeed_averageSpeed_(v7, v8, (uint64_t)self->_distance, self->_startDate, self->_endDate, self->_currentSpeed, self->_averageSpeed);
  started[9] = objc_msgSend_copy(self->_accuracy, v10, v11);
  started[10] = objc_msgSend_copy(self->_gpsAltitude, v12, v13);
  started[11] = objc_msgSend_copy(self->_rawSpeed, v14, v15);
  started[12] = objc_msgSend_copy(self->_odometer, v16, v17);
  started[13] = objc_msgSend_copy(self->_gpsSpeedAccuracy, v18, v19);
  started[14] = objc_msgSend_copy(self->_timestampGps, v20, v21);
  started[15] = objc_msgSend_copy(self->_groundAltitude, v22, v23);
  started[16] = objc_msgSend_copy(self->_groundAltitudeUncertainty, v24, v25);
  started[17] = objc_msgSend_copy(self->_smoothedGPSAltitude, v26, v27);
  started[18] = objc_msgSend_copy(self->_smoothedGPSAltitudeUncertainty, v28, v29);
  started[19] = objc_msgSend_copy(self->_gpsCourseRadians, v30, v31);
  started[20] = objc_msgSend_copy(self->_gpsCourseAccuracy, v32, v33);
  started[5] = self->_originDevice;
  started[21] = objc_msgSend_copy(self->_deltaGroundAltitude, v34, v35);
  started[1] = objc_msgSend_copy(self->_slope, v36, v37);
  started[2] = objc_msgSend_copy(self->_maxAbsSlope, v38, v39);
  return started;
}

- (CMOdometerData)initWithDeltaDistance:(double)a3 startDate:(id)a4 endDate:(id)a5 accuracy:(id)a6 rawSpeed:(id)a7 gpsSpeedAccuracy:(id)a8 timestampGps:(id)a9 deltaGroundAltitude:(id)a10 groundAltitudeUncertainty:(id)a11 originDevice:(int64_t)a12 slope:(id)a13 maxAbsSlope:(id)a14
{
  v25.receiver = self;
  v25.super_class = (Class)CMOdometerData;
  uint64_t v21 = [(CMOdometerData *)&v25 init];
  if (v21)
  {
    *((void *)v21 + 3) = a4;
    *((void *)v21 + 4) = a5;
    *((void *)v21 + 6) = (id)objc_msgSend_numberWithDouble_(NSNumber, v22, v23, a3);
    *((void *)v21 + 9) = a6;
    *((void *)v21 + 11) = a7;
    *((void *)v21 + 13) = a8;
    *((void *)v21 + 14) = a9;
    *((void *)v21 + 21) = a10;
    *((void *)v21 + 16) = a11;
    *((void *)v21 + 5) = a12;
    *((void *)v21 + 1) = a13;
    *((void *)v21 + 2) = a14;
    *((void *)v21 + 10) = 0;
    *((void *)v21 + 15) = 0;
    *((void *)v21 + 7) = 0;
    *((void *)v21 + 8) = 0;
    *(_OWORD *)(v21 + 136) = 0u;
    *(_OWORD *)(v21 + 152) = 0u;
  }
  return (CMOdometerData *)v21;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMOdometerData;
  [(CMOdometerData *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_startDate, @"kCMOdometerDataCodingKeyStartDate");
  objc_msgSend_encodeObject_forKey_(a3, v5, (uint64_t)self->_endDate, @"kCMOdometerDataCodingKeyEndDate");
  objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)self->_distance, @"kCMOdometerDataCodingKeyDistance");
  objc_msgSend_encodeObject_forKey_(a3, v7, (uint64_t)self->_currentSpeed, @"kCMOdometerDataCodingKeyCurrentSpeed");
  objc_msgSend_encodeObject_forKey_(a3, v8, (uint64_t)self->_averageSpeed, @"kCMOdometerDataCodingKeyAverageSpeed");
  objc_msgSend_encodeObject_forKey_(a3, v9, (uint64_t)self->_accuracy, @"kCMOdometerDataCodingKeyAccuracy");
  objc_msgSend_encodeObject_forKey_(a3, v10, (uint64_t)self->_gpsAltitude, @"kCMOdometerDataCodingKeyGPSAltitude");
  objc_msgSend_encodeObject_forKey_(a3, v11, (uint64_t)self->_rawSpeed, @"kCMOdometerDataCodingKeyRawSpeed");
  objc_msgSend_encodeObject_forKey_(a3, v12, (uint64_t)self->_odometer, @"kCMOdometerDataCodingKeyOdometer");
  objc_msgSend_encodeObject_forKey_(a3, v13, (uint64_t)self->_gpsSpeedAccuracy, @"kCMOdometerDataCodingKeyGPSSpeedAccuracy");
  objc_msgSend_encodeObject_forKey_(a3, v14, (uint64_t)self->_timestampGps, @"kCMOdometerDataCodingKeyTimestampGPS");
  objc_msgSend_encodeObject_forKey_(a3, v15, (uint64_t)self->_groundAltitude, @"kCMOdometerDataCodingKeyGroundAltitude");
  objc_msgSend_encodeObject_forKey_(a3, v16, (uint64_t)self->_groundAltitudeUncertainty, @"kCMOdometerDataCodingKeyGroundAltitudeUncertainty");
  objc_msgSend_encodeObject_forKey_(a3, v17, (uint64_t)self->_smoothedGPSAltitude, @"kCMOdometerDataCodingKeySmoothedGPSAltitude");
  objc_msgSend_encodeObject_forKey_(a3, v18, (uint64_t)self->_smoothedGPSAltitudeUncertainty, @"kCMOdometerDataCodingKeySmoothedGPSAltitudeUncertainty");
  objc_msgSend_encodeObject_forKey_(a3, v19, (uint64_t)self->_gpsCourseRadians, @"kCMOdometerDataCodingKeyGPSCourseRadians");
  objc_msgSend_encodeObject_forKey_(a3, v20, (uint64_t)self->_gpsCourseAccuracy, @"kCMOdometerDataCodingKeyGPSCourseAccuracy");
  objc_msgSend_encodeInteger_forKey_(a3, v21, self->_originDevice, @"kCMOdometerDataCodingKeyOriginDevice");
  objc_msgSend_encodeObject_forKey_(a3, v22, (uint64_t)self->_deltaGroundAltitude, @"kCMOdometerDataCodingKeyDeltaGroundAltitude");
  objc_msgSend_encodeObject_forKey_(a3, v23, (uint64_t)self->_slope, @"kCMOdometerDataCodingKeySlope");
  maxAbsSlope = self->_maxAbsSlope;

  objc_msgSend_encodeObject_forKey_(a3, v24, (uint64_t)maxAbsSlope, @"kCMOdometerDataCodingKeyMaxAbsSlope");
}

- (CLLocationDistance)deltaDistance
{
  objc_msgSend_doubleValue(self->_distance, a2, v2);
  return result;
}

- (CLLocationAccuracy)deltaDistanceAccuracy
{
  accuracy = self->_accuracy;
  if (!accuracy) {
    return -1.0;
  }
  objc_msgSend_doubleValue(accuracy, a2, v2);
  return result;
}

- (CLLocationSpeed)speed
{
  rawSpeed = self->_rawSpeed;
  if (!rawSpeed) {
    return -1.0;
  }
  objc_msgSend_doubleValue(rawSpeed, a2, v2);
  return result;
}

- (CLLocationSpeedAccuracy)speedAccuracy
{
  gpsSpeedAccuracy = self->_gpsSpeedAccuracy;
  if (!gpsSpeedAccuracy) {
    return -1.0;
  }
  objc_msgSend_doubleValue(gpsSpeedAccuracy, a2, v2);
  return result;
}

- (NSDate)gpsDate
{
  timestampGps = self->_timestampGps;
  v4 = (void *)MEMORY[0x1E4F1C9C8];
  if (timestampGps)
  {
    objc_msgSend_doubleValue(timestampGps, a2, v2);
    return (NSDate *)objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(v4, v5, v6);
  }
  else
  {
    v8 = (void *)MEMORY[0x1E4F1C9C8];
    return (NSDate *)objc_msgSend_date(v8, a2, v2);
  }
}

- (CLLocationDistance)deltaAltitude
{
  deltaGroundAltitude = self->_deltaGroundAltitude;
  if (!deltaGroundAltitude) {
    return 0.0;
  }
  objc_msgSend_doubleValue(deltaGroundAltitude, a2, v2);
  return result;
}

- (CLLocationAccuracy)verticalAccuracy
{
  if (!self->_deltaGroundAltitude) {
    return -1.0;
  }
  groundAltitudeUncertainty = self->_groundAltitudeUncertainty;
  if (!groundAltitudeUncertainty) {
    return -1.0;
  }
  objc_msgSend_doubleValue(groundAltitudeUncertainty, a2, v2);
  return result;
}

- (NSNumber)slope
{
  CLLocationAccuracy result = self->_groundAltitudeUncertainty;
  if (result)
  {
    objc_msgSend_doubleValue(result, a2, v2);
    if (v5 <= 0.0) {
      return 0;
    }
    else {
      return self->_slope;
    }
  }
  return result;
}

- (NSNumber)maxAbsSlope
{
  CLLocationAccuracy result = self->_groundAltitudeUncertainty;
  if (result)
  {
    objc_msgSend_doubleValue(result, a2, v2);
    if (v5 <= 0.0) {
      return 0;
    }
    else {
      return self->_maxAbsSlope;
    }
  }
  return result;
}

- (NSString)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  uint64_t started = objc_msgSend_startDate(self, v6, v7);
  uint64_t v11 = objc_msgSend_endDate(self, v9, v10);
  objc_msgSend_deltaDistance(self, v12, v13);
  uint64_t v15 = v14;
  objc_msgSend_deltaDistanceAccuracy(self, v16, v17);
  uint64_t v19 = v18;
  objc_msgSend_speed(self, v20, v21);
  uint64_t v23 = v22;
  objc_msgSend_speedAccuracy(self, v24, v25);
  uint64_t v27 = v26;
  uint64_t v30 = objc_msgSend_gpsDate(self, v28, v29);
  objc_msgSend_deltaAltitude(self, v31, v32);
  uint64_t v34 = v33;
  objc_msgSend_verticalAccuracy(self, v35, v36);
  uint64_t v38 = v37;
  uint64_t v41 = objc_msgSend_originDevice(self, v39, v40);
  uint64_t v44 = objc_msgSend_deltaGroundAltitude(self, v42, v43);
  uint64_t v47 = objc_msgSend_slope(self, v45, v46);
  uint64_t v50 = objc_msgSend_maxAbsSlope(self, v48, v49);
  return (NSString *)objc_msgSend_stringWithFormat_(v3, v51, @"%@,<startDate %@, endDate %@, deltaDistance %f, deltaDistanceAccuracy %f, speed %f, speedAccuracy %f, gpsDate %@, deltaAltitude %f, verticalAccuracy %f, originDevice %d, deltaGroundAltitude %@, currentSlope %@, maxAbsoluteSlope %@>", v5, started, v11, v15, v19, v23, v27, v30, v34, v38, v41, v44, v47, v50);
}

- (id)relativeTimestampGps
{
  if (!objc_msgSend_startDate(self, a2, v2) || !objc_msgSend_timestampGps(self, v4, v5)) {
    return 0;
  }
  uint64_t started = objc_msgSend_startDate(self, v6, v7);
  objc_msgSend_timeIntervalSinceReferenceDate(started, v9, v10);
  double v12 = v11;
  uint64_t v15 = objc_msgSend_timestampGps(self, v13, v14);
  objc_msgSend_doubleValue(v15, v16, v17);
  double v21 = v12 - v20;
  uint64_t v22 = NSNumber;

  return (id)objc_msgSend_numberWithDouble_(v22, v18, v19, v21);
}

- (void)updateStartDate:(id)a3
{
  self->_startDate = (NSDate *)a3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (CMOdometerOriginDevice)originDevice
{
  return self->_originDevice;
}

- (NSNumber)distance
{
  return self->_distance;
}

- (void)setDistance:(id)a3
{
}

- (NSNumber)currentSpeed
{
  return self->_currentSpeed;
}

- (void)setCurrentSpeed:(id)a3
{
}

- (NSNumber)averageSpeed
{
  return self->_averageSpeed;
}

- (void)setAverageSpeed:(id)a3
{
}

- (NSNumber)accuracy
{
  return self->_accuracy;
}

- (void)setAccuracy:(id)a3
{
}

- (NSNumber)gpsAltitude
{
  return self->_gpsAltitude;
}

- (void)setGpsAltitude:(id)a3
{
}

- (NSNumber)rawSpeed
{
  return self->_rawSpeed;
}

- (void)setRawSpeed:(id)a3
{
}

- (NSNumber)odometer
{
  return self->_odometer;
}

- (void)setOdometer:(id)a3
{
}

- (NSNumber)gpsSpeedAccuracy
{
  return self->_gpsSpeedAccuracy;
}

- (void)setGpsSpeedAccuracy:(id)a3
{
}

- (NSNumber)timestampGps
{
  return self->_timestampGps;
}

- (void)setTimestampGps:(id)a3
{
}

- (NSNumber)groundAltitude
{
  return self->_groundAltitude;
}

- (void)setGroundAltitude:(id)a3
{
}

- (NSNumber)groundAltitudeUncertainty
{
  return self->_groundAltitudeUncertainty;
}

- (void)setGroundAltitudeUncertainty:(id)a3
{
}

- (NSNumber)smoothedGPSAltitude
{
  return self->_smoothedGPSAltitude;
}

- (void)setSmoothedGPSAltitude:(id)a3
{
}

- (NSNumber)smoothedGPSAltitudeUncertainty
{
  return self->_smoothedGPSAltitudeUncertainty;
}

- (void)setSmoothedGPSAltitudeUncertainty:(id)a3
{
}

- (NSNumber)gpsCourseRadians
{
  return self->_gpsCourseRadians;
}

- (void)setGpsCourseRadians:(id)a3
{
}

- (NSNumber)gpsCourseAccuracy
{
  return self->_gpsCourseAccuracy;
}

- (void)setGpsCourseAccuracy:(id)a3
{
}

- (NSNumber)deltaGroundAltitude
{
  return self->_deltaGroundAltitude;
}

- (void)setDeltaGroundAltitude:(id)a3
{
}

- (id)binarySampleRepresentation
{
  objc_super v3 = (void *)MEMORY[0x192FCD2F0](self, a2);
  id v5 = (id)objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E4F28DB0], v4, (uint64_t)self, 1, 0);

  return v5;
}

- (CMOdometerData)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  if (objc_msgSend_length(a3, a2, (uint64_t)a3, a4, a5))
  {
    v14.receiver = self;
    v14.super_class = (Class)CMOdometerData;
    uint64_t v7 = [(CMOdometerData *)&v14 init];
    if (v7)
    {
      v8 = (void *)MEMORY[0x1E4F28DC0];
      uint64_t v9 = objc_opt_class();
      uint64_t v11 = objc_msgSend_unarchivedObjectOfClass_fromData_error_(v8, v10, v9, a3, 0);
      if (v11)
      {
        double v12 = (void *)v11;

        return (CMOdometerData *)v12;
      }
    }
  }
  else
  {

    return 0;
  }
  return v7;
}

@end