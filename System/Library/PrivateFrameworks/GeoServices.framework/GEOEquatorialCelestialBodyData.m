@interface GEOEquatorialCelestialBodyData
- (GEOEquatorialCelestialBodyData)initWithDate:(id)a3 body:(int64_t)a4;
- (GEOEquatorialCelestialBodyData)initWithDate:(id)a3 body:(int64_t)a4 useHighPrecision:(BOOL)a5;
- (GEOEquatorialCelestialBodyData)initWithJulianDay:(double)a3 body:(int64_t)a4;
- (GEOEquatorialCelestialBodyData)initWithJulianDay:(double)a3 body:(int64_t)a4 useHighPrecision:(BOOL)a5;
- (double)declination;
- (double)rightAscension;
@end

@implementation GEOEquatorialCelestialBodyData

- (double)declination
{
  return self->_declination;
}

- (double)rightAscension
{
  return self->_rightAscension;
}

- (GEOEquatorialCelestialBodyData)initWithJulianDay:(double)a3 body:(int64_t)a4 useHighPrecision:(BOOL)a5
{
  BOOL v5 = a5;
  v20.receiver = self;
  v20.super_class = (Class)GEOEquatorialCelestialBodyData;
  v8 = [(GEOEquatorialCelestialBodyData *)&v20 init];
  v9 = v8;
  if (v8)
  {
    if (a4 == 3)
    {
      v8->_rightAscension = 0.0;
      v8->_declination = 0.0;
    }
    else
    {
      double v10 = CAADynamicalTime::UTC2TT((CAADynamicalTime *)v8, a3);
      _GEOEclipticLongitude((CAAMoon *)a4, (CAASun *)v5, v10);
      double v12 = v11;
      _GEOEclipticLatitude((CAAMoon *)a4, (CAASun *)v5, v10);
      double v14 = v13;
      double v16 = CAANutation::TrueObliquityOfEcliptic(v15, v10);
      v9->_rightAscension = CAACoordinateTransformation::Ecliptic2Equatorial(v17, v12, v14, v16);
      v9->_declination = v18;
    }
  }
  return v9;
}

- (GEOEquatorialCelestialBodyData)initWithDate:(id)a3 body:(int64_t)a4
{
  return [(GEOEquatorialCelestialBodyData *)self initWithDate:a3 body:a4 useHighPrecision:0];
}

- (GEOEquatorialCelestialBodyData)initWithDate:(id)a3 body:(int64_t)a4 useHighPrecision:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  objc_msgSend(v8, "geo_julianDay");
  v9 = -[GEOEquatorialCelestialBodyData initWithJulianDay:body:useHighPrecision:](self, "initWithJulianDay:body:useHighPrecision:", a4, v5);

  return v9;
}

- (GEOEquatorialCelestialBodyData)initWithJulianDay:(double)a3 body:(int64_t)a4
{
  return [(GEOEquatorialCelestialBodyData *)self initWithJulianDay:a4 body:0 useHighPrecision:a3];
}

@end