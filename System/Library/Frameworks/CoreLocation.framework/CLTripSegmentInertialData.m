@interface CLTripSegmentInertialData
+ (BOOL)supportsSecureCoding;
- (BOOL)isValid;
- (CLTripSegmentInertialData)initWithCoder:(id)a3;
- (CLTripSegmentInertialData)initWithTime:(id)a3 dataPeriodSec:(double)a4 deltaCourseRad:(double)a5 deltaSpeedMps:(double)a6 deltaCourseVarRad2:(double)a7 deltaSpeedVarMps2:(double)a8 deltaCourseSpeedCovarRadMps:(double)a9;
- (NSDate)timestamp;
- (double)dataPeriod_s;
- (double)deltaCourseSpeedCovar_radmps;
- (double)deltaCourseVar_rad2;
- (double)deltaCourse_rad;
- (double)deltaSpeedVar_mps2;
- (double)deltaSpeed_mps;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setDataPeriod_s:(double)a3;
- (void)setDeltaCourseSpeedCovar_radmps:(double)a3;
- (void)setDeltaCourseVar_rad2:(double)a3;
- (void)setDeltaCourse_rad:(double)a3;
- (void)setDeltaSpeedVar_mps2:(double)a3;
- (void)setDeltaSpeed_mps:(double)a3;
@end

@implementation CLTripSegmentInertialData

- (CLTripSegmentInertialData)initWithTime:(id)a3 dataPeriodSec:(double)a4 deltaCourseRad:(double)a5 deltaSpeedMps:(double)a6 deltaCourseVarRad2:(double)a7 deltaSpeedVarMps2:(double)a8 deltaCourseSpeedCovarRadMps:(double)a9
{
  v18.receiver = self;
  v18.super_class = (Class)CLTripSegmentInertialData;
  v16 = [(CLTripSegmentInertialData *)&v18 init];
  if (v16)
  {
    v16->_timestamp = (NSDate *)a3;
    v16->_dataPeriod_s = a4;
    v16->_deltaCourse_rad = a5;
    v16->_deltaSpeed_mps = a6;
    v16->_deltaCourseVar_rad2 = a7;
    v16->_deltaSpeedVar_mps2 = a8;
    v16->_deltaCourseSpeedCovar_radmps = a9;
  }
  return v16;
}

- (BOOL)isValid
{
  return self->_timestamp
      && self->_dataPeriod_s > 0.0
      && self->_deltaCourseVar_rad2 > 0.0
      && self->_deltaSpeedVar_mps2 > 0.0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(CLTripSegmentInertialData *)self timestamp];
  [(CLTripSegmentInertialData *)self dataPeriod_s];
  double v7 = v6;
  [(CLTripSegmentInertialData *)self deltaCourse_rad];
  double v9 = v8;
  [(CLTripSegmentInertialData *)self deltaSpeed_mps];
  double v11 = v10;
  [(CLTripSegmentInertialData *)self deltaSpeedVar_mps2];
  double v13 = v12;
  [(CLTripSegmentInertialData *)self deltaSpeedVar_mps2];
  double v15 = v14;
  [(CLTripSegmentInertialData *)self deltaCourseSpeedCovar_radmps];

  return (id)[v4 initWithTime:v5 dataPeriodSec:v7 deltaCourseRad:v9 deltaSpeedMps:v11 deltaCourseVarRad2:v13 deltaSpeedVarMps2:v15 deltaCourseSpeedCovarRadMps:v16];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLTripSegmentInertialData;
  [(CLTripSegmentInertialData *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [(NSDate *)[(CLTripSegmentInertialData *)self timestamp] timeIntervalSinceReferenceDate];
  uint64_t v7 = v6;
  [(CLTripSegmentInertialData *)self dataPeriod_s];
  uint64_t v9 = v8;
  [(CLTripSegmentInertialData *)self deltaCourse_rad];
  uint64_t v11 = v10;
  [(CLTripSegmentInertialData *)self deltaSpeed_mps];
  uint64_t v13 = v12;
  [(CLTripSegmentInertialData *)self deltaCourseVar_rad2];
  uint64_t v15 = v14;
  [(CLTripSegmentInertialData *)self deltaSpeedVar_mps2];
  uint64_t v17 = v16;
  [(CLTripSegmentInertialData *)self deltaCourseSpeedCovar_radmps];
  return (id)[v3 stringWithFormat:@"%@,timestamp,%.2f,dataperiod,%.2f,deltaCourse,%.6f,deltaSpeed,%.4f,courseVar,%.6f,speedVar,%.6lf,courseSpeedCovar,%.6lf", v5, v7, v9, v11, v13, v15, v17, v18];
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", -[CLTripSegmentInertialData timestamp](self, "timestamp"), @"timestamp");
  [(CLTripSegmentInertialData *)self dataPeriod_s];
  objc_msgSend(a3, "encodeDouble:forKey:", @"dataPeriod");
  [(CLTripSegmentInertialData *)self deltaCourse_rad];
  objc_msgSend(a3, "encodeDouble:forKey:", @"deltaCourse");
  [(CLTripSegmentInertialData *)self deltaSpeed_mps];
  objc_msgSend(a3, "encodeDouble:forKey:", @"deltaSpeed");
  [(CLTripSegmentInertialData *)self deltaCourseVar_rad2];
  objc_msgSend(a3, "encodeDouble:forKey:", @"deltaCourseVar");
  [(CLTripSegmentInertialData *)self deltaSpeedVar_mps2];
  objc_msgSend(a3, "encodeDouble:forKey:", @"deltaSpeedVar");
  [(CLTripSegmentInertialData *)self deltaCourseSpeedCovar_radmps];

  objc_msgSend(a3, "encodeDouble:forKey:", @"deltaCourseSpeedCovar");
}

- (CLTripSegmentInertialData)initWithCoder:(id)a3
{
  v4 = [CLTripSegmentInertialData alloc];
  uint64_t v5 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"timestamp"];
  [a3 decodeDoubleForKey:@"dataPeriod"];
  double v7 = v6;
  [a3 decodeDoubleForKey:@"deltaCourse"];
  double v9 = v8;
  [a3 decodeDoubleForKey:@"deltaSpeed"];
  double v11 = v10;
  [a3 decodeDoubleForKey:@"deltaCourseVar"];
  double v13 = v12;
  [a3 decodeDoubleForKey:@"deltaSpeedVar"];
  double v15 = v14;
  [a3 decodeDoubleForKey:@"deltaCourseSpeedCovar"];

  return [(CLTripSegmentInertialData *)v4 initWithTime:v5 dataPeriodSec:v7 deltaCourseRad:v9 deltaSpeedMps:v11 deltaCourseVarRad2:v13 deltaSpeedVarMps2:v15 deltaCourseSpeedCovarRadMps:v16];
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (double)dataPeriod_s
{
  return self->_dataPeriod_s;
}

- (void)setDataPeriod_s:(double)a3
{
  self->_dataPeriod_s = a3;
}

- (double)deltaCourse_rad
{
  return self->_deltaCourse_rad;
}

- (void)setDeltaCourse_rad:(double)a3
{
  self->_deltaCourse_rad = a3;
}

- (double)deltaSpeed_mps
{
  return self->_deltaSpeed_mps;
}

- (void)setDeltaSpeed_mps:(double)a3
{
  self->_deltaSpeed_mps = a3;
}

- (double)deltaCourseVar_rad2
{
  return self->_deltaCourseVar_rad2;
}

- (void)setDeltaCourseVar_rad2:(double)a3
{
  self->_deltaCourseVar_rad2 = a3;
}

- (double)deltaSpeedVar_mps2
{
  return self->_deltaSpeedVar_mps2;
}

- (void)setDeltaSpeedVar_mps2:(double)a3
{
  self->_deltaSpeedVar_mps2 = a3;
}

- (double)deltaCourseSpeedCovar_radmps
{
  return self->_deltaCourseSpeedCovar_radmps;
}

- (void)setDeltaCourseSpeedCovar_radmps:(double)a3
{
  self->_deltaCourseSpeedCovar_radmps = a3;
}

@end