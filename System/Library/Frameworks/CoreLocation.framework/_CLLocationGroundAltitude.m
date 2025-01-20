@interface _CLLocationGroundAltitude
+ (BOOL)supportsSecureCoding;
- (BOOL)isAltitudeWgs84Available;
- (_CLLocationGroundAltitude)initWithCoder:(id)a3;
- (_CLLocationGroundAltitude)initWithEstimate:(double)a3 uncertainty:(double)a4;
- (_CLLocationGroundAltitude)initWithEstimate:(double)a3 uncertainty:(double)a4 undulation:(double)a5 undulationModel:(int)a6;
- (double)altitude;
- (double)altitudeWgs84;
- (double)estimate;
- (double)uncertainty;
- (double)uncertaintyWgs84;
- (double)undulation;
- (int)undulationModel;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _CLLocationGroundAltitude

- (_CLLocationGroundAltitude)initWithEstimate:(double)a3 uncertainty:(double)a4
{
  return [(_CLLocationGroundAltitude *)self initWithEstimate:0xFFFFFFFFLL uncertainty:a3 undulation:a4 undulationModel:0.0];
}

- (_CLLocationGroundAltitude)initWithEstimate:(double)a3 uncertainty:(double)a4 undulation:(double)a5 undulationModel:(int)a6
{
  v13.receiver = self;
  v13.super_class = (Class)_CLLocationGroundAltitude;
  result = [(_CLLocationGroundAltitude *)&v13 init];
  if (result)
  {
    result->_estimate = a3;
    result->_uncertainty = a4;
    result->_undulationModel = a6;
    double v11 = sqrt(a4 * a4 + 900.0);
    if (a6 != -1) {
      double v11 = a4;
    }
    if (a4 <= 0.0) {
      double v11 = a4;
    }
    double v12 = -0.0;
    if (a4 > 0.0 && a6 != -1) {
      double v12 = a5;
    }
    result->_isAltitudeWgs84Available = a4 > 0.0 && a6 != -1;
    result->_undulation = a5;
    result->_altitudeWgs84 = v12 + a3;
    result->_uncertaintyWgs84 = v11;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    [a3 encodeDouble:@"kCLLocationCodingKeyGroundAltitudeEstimate" forKey:self->_estimate];
    [a3 encodeDouble:@"kCLLocationCodingKeyGroundAltitudeUncertainty" forKey:self->_uncertainty];
    [a3 encodeDouble:@"kCLLocationCodingKeyGroundAltitudeUndulation" forKey:self->_undulation];
    uint64_t undulationModel = self->_undulationModel;
    [a3 encodeInt:undulationModel forKey:@"kCLLocationCodingKeyGroundAltitudeUndulationModel"];
  }
  else
  {
    [a3 encodeValueOfObjCType:"d" at:&self->_estimate];
    [a3 encodeValueOfObjCType:"d" at:&self->_uncertainty];
    [a3 encodeValueOfObjCType:"d" at:&self->_undulation];
    [a3 encodeValueOfObjCType:"i" at:&self->_undulationModel];
  }
}

- (_CLLocationGroundAltitude)initWithCoder:(id)a3
{
  *(double *)&unint64_t v15 = -1.0;
  double v16 = 0.0;
  double v14 = 0.0;
  unsigned int v13 = -1;
  if ([a3 allowsKeyedCoding])
  {
    [a3 decodeDoubleForKey:@"kCLLocationCodingKeyGroundAltitudeEstimate"];
    double v6 = v5;
    double v16 = v5;
    [a3 decodeDoubleForKey:@"kCLLocationCodingKeyGroundAltitudeUncertainty"];
    double v8 = v7;
    *(double *)&unint64_t v15 = v7;
    [a3 decodeDoubleForKey:@"kCLLocationCodingKeyGroundAltitudeUndulation"];
    double v10 = v9;
    double v14 = v9;
    uint64_t v11 = [a3 decodeIntForKey:@"kCLLocationCodingKeyGroundAltitudeUndulationModel"];
    unsigned int v13 = v11;
  }
  else
  {
    [a3 decodeValueOfObjCType:"d" at:&v16];
    [a3 decodeValueOfObjCType:"d" at:&v15];
    [a3 decodeValueOfObjCType:"d" at:&v14];
    [a3 decodeValueOfObjCType:"i" at:&v13];
    double v8 = *(double *)&v15;
    double v6 = v16;
    double v10 = v14;
    uint64_t v11 = v13;
  }
  return [(_CLLocationGroundAltitude *)self initWithEstimate:v11 uncertainty:v6 undulation:v8 undulationModel:v10];
}

- (double)altitude
{
  MEMORY[0x1F4181798](self, sel_estimate);
  return result;
}

- (double)estimate
{
  return self->_estimate;
}

- (double)uncertainty
{
  return self->_uncertainty;
}

- (double)undulation
{
  return self->_undulation;
}

- (int)undulationModel
{
  return self->_undulationModel;
}

- (BOOL)isAltitudeWgs84Available
{
  return self->_isAltitudeWgs84Available;
}

- (double)altitudeWgs84
{
  return self->_altitudeWgs84;
}

- (double)uncertaintyWgs84
{
  return self->_uncertaintyWgs84;
}

@end