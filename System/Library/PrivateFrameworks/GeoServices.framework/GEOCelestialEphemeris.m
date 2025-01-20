@interface GEOCelestialEphemeris
- (BOOL)isTransitAboveHorizon;
- (GEOCelestialEphemeris)initWithLocation:(id)a3 date:(id)a4 body:(int64_t)a5;
- (GEOCelestialEphemeris)initWithLocation:(id)a3 date:(id)a4 body:(int64_t)a5 useHighPrecision:(BOOL)a6;
- (GEOCelestialEphemeris)initWithLocation:(id)a3 julianDay:(double)a4 body:(int64_t)a5 altitude:(double)a6 useHighPrecision:(BOOL)a7;
- (GEOEquatorialCelestialBodyData)equatorialCoord;
- (GEOHorizontalCelestialBodyData)horizontalCoord;
- (GEOSolarEclipticCelestialBodyData)eclipticCoord;
- (NSDate)rise;
- (NSDate)set;
- (NSDate)transit;
- (double)elongation;
- (double)illuminatedFraction;
- (double)librationPositionAngle;
- (double)parallacticAngle;
- (double)phaseAngle;
- (double)radiusVector;
- (double)topocentricParallacticAngle;
- (double)topocentricRadiusVector;
- (id)description;
@end

@implementation GEOCelestialEphemeris

- (double)parallacticAngle
{
  return self->_parallacticAngle;
}

- (double)phaseAngle
{
  return self->_phaseAngle;
}

- (GEOCelestialEphemeris)initWithLocation:(id)a3 date:(id)a4 body:(int64_t)a5
{
  return -[GEOCelestialEphemeris initWithLocation:date:body:useHighPrecision:](self, "initWithLocation:date:body:useHighPrecision:", a4, a5, 0, a3.var0, a3.var1);
}

- (GEOEquatorialCelestialBodyData)equatorialCoord
{
  equatorialCoord = self->_equatorialCoord;
  if (!equatorialCoord)
  {
    v4 = [[GEOEquatorialCelestialBodyData alloc] initWithJulianDay:self->_body body:self->_highPrecision useHighPrecision:self->_julianDay];
    v5 = self->_equatorialCoord;
    self->_equatorialCoord = v4;

    equatorialCoord = self->_equatorialCoord;
  }

  return equatorialCoord;
}

- (GEOCelestialEphemeris)initWithLocation:(id)a3 julianDay:(double)a4 body:(int64_t)a5 altitude:(double)a6 useHighPrecision:(BOOL)a7
{
  BOOL v7 = a7;
  double var1 = a3.var1;
  double var0 = a3.var0;
  v52.receiver = self;
  v52.super_class = (Class)GEOCelestialEphemeris;
  v13 = [(GEOCelestialEphemeris *)&v52 init];
  v14 = v13;
  if (v13)
  {
    v15 = 0;
    v13->_julianDay = a4;
    v13->_coordinate.latitude = var0;
    v13->_coordinate.longitude = var1;
    v13->_body = a5;
    v13->_highPrecision = v7;
    double v16 = floor(a4 * 1440.0);
    double v17 = a4 + -0.014;
    double v18 = -var1;
    do
    {
      double v51 = 0.0;
      double v49 = 0.0;
      double v50 = 0.0;
      double v47 = 0.0;
      double v48 = 0.0;
      double v46 = 0.0;
      getRightAscension((CAADynamicalTime *)&v51, &v50, a5, v7, v17 + -1.0);
      getRightAscension((CAADynamicalTime *)&v49, &v48, a5, v7, v17);
      getRightAscension((CAADynamicalTime *)&v47, &v46, a5, v7, v17 + 1.0);
      CAARiseTransitSet::Calculate(v19, v17, v51, v50, v49, v48, v47, v46, v18, (uint64_t)v45, var0, a6);
      v20 = [GEOCelestialRiseTransitSet alloc];
      v44[0] = v45[0];
      v44[1] = v45[1];
      v44[2] = v45[2];
      v21 = [(GEOCelestialRiseTransitSet *)v20 initWithJulianDay:v44 riseTransitSet:v17];
      int v22 = [(GEOCelestialRiseTransitSet *)v21 _numberOfEvents];
      if (v22 >= 1)
      {
        [(GEOCelestialRiseTransitSet *)v21 _oldestEventInJulianDay];
        if (ceil(v23 * 1440.0) >= v16)
        {
          if (v15)
          {
            if ([(GEOCelestialRiseTransitSet *)v15 _numberOfEvents] < v22)
            {
              v24 = v21;

              v15 = v24;
            }
          }
          else
          {
            v15 = v21;
          }
        }
      }

      int v25 = [(GEOCelestialRiseTransitSet *)v15 _numberOfEvents];
      double v17 = v17 + 0.014;
    }
    while (v17 < a4 + -0.014 + 0.25 && v25 != 3);
    objc_storeStrong((id *)&v14->_riseTransitSet, v15);
    if (a5 == 4)
    {
      *(void *)&v45[0] = 0;
      double v51 = 0.0;
      getRightAscension((CAADynamicalTime *)v45, &v51, 4, v7, a4);
      double v49 = 0.0;
      double v50 = 0.0;
      getRightAscension((CAADynamicalTime *)&v50, &v49, 0, v7, a4);
      double v42 = v51;
      double v43 = *(double *)v45;
      double v28 = v49;
      double v27 = v50;
      double v29 = *(double *)v45 * 15.0 * 0.0174532925;
      double v30 = v50 * 15.0 * 0.0174532925;
      double v31 = v51 * 0.0174532925;
      __double2 v32 = __sincos_stret(v49 * 0.0174532925);
      __double2 v33 = __sincos_stret(v31);
      long double v34 = cos(v30 - v29);
      long double v35 = acos(v33.__cosval * v32.__cosval * v34 + v32.__sinval * v33.__sinval) * 57.2957795;
      v14->_elongation = v35;
      CAAMoonIlluminatedFraction::PositionAngle(v36, v27, v28, v43, v42);
      v14->_parallacticAngle = v37;
      __double2 v38 = __sincos_stret(v35 * 0.0174532925);
      long double v39 = atan2(v38.__sinval * 149971520.0, v38.__cosval * -149971520.0 + 368410.0);
      double v40 = fmod(v39 * 57.2957795, 360.0);
      if (v40 < 0.0) {
        double v40 = v40 + 360.0;
      }
      v14->_phaseAngle = v40;
      v14->_illuminatedFraction = (cos(v40 * 0.0174532925) + 1.0) * 0.5;
    }
  }
  return v14;
}

- (double)illuminatedFraction
{
  return self->_illuminatedFraction;
}

- (GEOCelestialEphemeris)initWithLocation:(id)a3 date:(id)a4 body:(int64_t)a5 useHighPrecision:(BOOL)a6
{
  BOOL v6 = a6;
  double var1 = a3.var1;
  double var0 = a3.var0;
  v11 = (CAADynamicalTime *)objc_msgSend(a4, "geo_julianDay");
  double v13 = v12;
  if (a5)
  {
    if (a5 == 4)
    {
      double v14 = CAADynamicalTime::UTC2TT(v11, v12);
      double v16 = CAAMoon::RadiusVector(v15, v14);
      double v17 = asin(6378.14 / v16) * 57.2957795 * 0.7275 + -0.5666;
    }
    else
    {
      double v17 = -0.5667;
    }
  }
  else
  {
    double v17 = -0.8333;
  }

  return -[GEOCelestialEphemeris initWithLocation:julianDay:body:altitude:useHighPrecision:](self, "initWithLocation:julianDay:body:altitude:useHighPrecision:", a5, v6, var0, var1, v13, v17);
}

- (double)elongation
{
  return self->_elongation;
}

- (double)librationPositionAngle
{
  if (self->_body != 4) {
    return 0.0;
  }
  librationPositionAngle = self->_librationPositionAngle;
  if (!librationPositionAngle)
  {
    double v4 = CAADynamicalTime::UTC2TT(0, self->_julianDay);
    CAAPhysicalMoon::CalculateTopocentric(v4, -self->_coordinate.longitude, self->_coordinate.latitude, v9);
    id v5 = objc_alloc(NSNumber);
    BOOL v6 = (NSNumber *)[v5 initWithDouble:v9[6]];
    BOOL v7 = self->_librationPositionAngle;
    self->_librationPositionAngle = v6;

    librationPositionAngle = self->_librationPositionAngle;
  }

  [(NSNumber *)librationPositionAngle doubleValue];
  return result;
}

- (double)topocentricParallacticAngle
{
  if (self->_body != 4) {
    return 0.0;
  }
  topocentricParallacticAngle = self->_topocentricParallacticAngle;
  if (!topocentricParallacticAngle)
  {
    double v4 = CAADynamicalTime::UTC2TT(0, self->_julianDay);
    [(GEOCelestialEphemeris *)self radiusVector];
    double v6 = v5;
    BOOL v7 = [(GEOCelestialEphemeris *)self equatorialCoord];
    [v7 rightAscension];
    double v9 = v8;
    v10 = (CAAParallax *)[v7 declination];
    double v12 = CAAParallax::Equatorial2Topocentric(v10, v9, v11, v6 / 149597871.0, -self->_coordinate.longitude, self->_coordinate.latitude, 0.0, v4);
    CAASidereal::ApparentGreenwichSiderealTime(v13, self->_julianDay);
    double v15 = v14;
    double latitude = self->_coordinate.latitude;
    double longitude = self->_coordinate.longitude;
    [v7 declination];
    double v19 = v18;
    id v20 = objc_alloc(NSNumber);
    v21 = (NSNumber *)objc_msgSend(v20, "initWithDouble:", (double)CAAParallactic::ParallacticAngle((CAAParallactic *)v20, v15 + longitude / 15.0 - v12, latitude, v19));
    int v22 = self->_topocentricParallacticAngle;
    self->_topocentricParallacticAngle = v21;

    topocentricParallacticAngle = self->_topocentricParallacticAngle;
  }

  [(NSNumber *)topocentricParallacticAngle doubleValue];
  return result;
}

- (double)radiusVector
{
  radiusVector = self->_radiusVector;
  if (!radiusVector)
  {
    double v4 = (NSNumber *)objc_msgSend(objc_alloc(NSNumber), "initWithDouble:", _GEORadiusVector((CAAMoon *)self->_body, (CAAUranus *)self->_highPrecision, self->_julianDay));
    double v5 = self->_radiusVector;
    self->_radiusVector = v4;

    radiusVector = self->_radiusVector;
  }

  [(NSNumber *)radiusVector doubleValue];
  return result;
}

- (GEOHorizontalCelestialBodyData)horizontalCoord
{
  horizontalCoord = self->_horizontalCoord;
  if (!horizontalCoord)
  {
    double v4 = -[GEOHorizontalCelestialBodyData initWithLocation:julianDay:body:useHighPrecision:]([GEOHorizontalCelestialBodyData alloc], "initWithLocation:julianDay:body:useHighPrecision:", self->_body, self->_highPrecision, self->_coordinate.latitude, self->_coordinate.longitude, self->_julianDay);
    double v5 = self->_horizontalCoord;
    self->_horizontalCoord = v4;

    horizontalCoord = self->_horizontalCoord;
  }

  return horizontalCoord;
}

- (NSDate)rise
{
  return [(GEOCelestialRiseTransitSet *)self->_riseTransitSet rise];
}

- (NSDate)transit
{
  return [(GEOCelestialRiseTransitSet *)self->_riseTransitSet transit];
}

- (BOOL)isTransitAboveHorizon
{
  return [(GEOCelestialRiseTransitSet *)self->_riseTransitSet isTransitAboveHorizon];
}

- (NSDate)set
{
  return [(GEOCelestialRiseTransitSet *)self->_riseTransitSet set];
}

- (GEOSolarEclipticCelestialBodyData)eclipticCoord
{
  eclipticCoord = self->_eclipticCoord;
  if (!eclipticCoord)
  {
    double v4 = [[GEOSolarEclipticCelestialBodyData alloc] initWithJulianDay:self->_body body:self->_highPrecision useHighPrecision:self->_julianDay];
    double v5 = self->_eclipticCoord;
    self->_eclipticCoord = v4;

    eclipticCoord = self->_eclipticCoord;
  }

  return eclipticCoord;
}

- (double)topocentricRadiusVector
{
  if (self->_body == 4)
  {
    topocentricRadiusVector = self->_topocentricRadiusVector;
    if (!topocentricRadiusVector)
    {
      double v4 = CAADynamicalTime::UTC2TT(0, self->_julianDay);
      CAASidereal::ApparentGreenwichSiderealTime(v5, v4);
      double v27 = v6;
      BOOL v7 = [(GEOCelestialEphemeris *)self equatorialCoord];
      [v7 declination];
      __double2 v9 = __sincos_stret(v8 * 0.0174532925);
      double v10 = self->_coordinate.latitude * 0.0174532925;
      long double v11 = tan(v10);
      double v12 = atan(v11 * 0.99664719);
      __double2 v13 = __sincos_stret(v12);
      __double2 v14 = __sincos_stret(v10);
      [(GEOCelestialEphemeris *)self radiusVector];
      double v16 = v15;
      double longitude = self->_coordinate.longitude;
      [v7 rightAscension];
      double v19 = v18;
      id v20 = objc_alloc(NSNumber);
      long double v21 = asin(0.0000426345151 / (v16 / 149597871.0));
      double v22 = sin(v21);
      __double2 v23 = __sincos_stret((v27 + longitude / 15.0 - v19) * 0.261799388);
      v24 = (NSNumber *)[v20 initWithDouble:v16* sqrt((v9.__cosval * v23.__cosval - (v13.__cosval + v14.__cosval * 0.0) * v22)* (v9.__cosval * v23.__cosval - (v13.__cosval + v14.__cosval * 0.0) * v22)+ v9.__cosval * v23.__sinval * (v9.__cosval * v23.__sinval)+ (v9.__sinval - (v14.__sinval * 0.0 + v13.__sinval * 0.99664719) * v22)* (v9.__sinval - (v14.__sinval * 0.0 + v13.__sinval * 0.99664719) * v22))];
      int v25 = self->_topocentricRadiusVector;
      self->_topocentricRadiusVector = v24;

      topocentricRadiusVector = self->_topocentricRadiusVector;
    }
    [(NSNumber *)topocentricRadiusVector doubleValue];
  }
  else
  {
    [(GEOCelestialEphemeris *)self radiusVector];
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  double v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  double v6 = [(GEOCelestialEphemeris *)self rise];
  BOOL v7 = [(GEOCelestialEphemeris *)self transit];
  double v8 = [(GEOCelestialEphemeris *)self set];
  __double2 v9 = [v3 stringWithFormat:@"<%@: %p rise / transit / set:  %@ / %@ / %@>", v5, self, v6, v7, v8];

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topocentricRadiusVector, 0);
  objc_storeStrong((id *)&self->_radiusVector, 0);
  objc_storeStrong((id *)&self->_librationPositionAngle, 0);
  objc_storeStrong((id *)&self->_topocentricParallacticAngle, 0);
  objc_storeStrong((id *)&self->_horizontalCoord, 0);
  objc_storeStrong((id *)&self->_equatorialCoord, 0);
  objc_storeStrong((id *)&self->_eclipticCoord, 0);

  objc_storeStrong((id *)&self->_riseTransitSet, 0);
}

@end