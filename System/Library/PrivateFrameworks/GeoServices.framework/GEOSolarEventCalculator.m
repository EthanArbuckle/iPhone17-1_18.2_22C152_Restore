@interface GEOSolarEventCalculator
+ (double)nextEventOfType:(unsigned int)a3 after:(double)a4 forLocation:(id)a5;
+ (double)nextEventOfType:(unsigned int)a3 after:(double)a4 forLocation:(id)a5 altitudeInDegrees:(double)a6 accuracy:(double)a7;
+ (double)prevEventOfType:(unsigned int)a3 before:(double)a4 forLocation:(id)a5 altitudeInDegrees:(double)a6 accuracy:(double)a7;
- (GEOSolarEventCalculator)initWithLocation:(id)a3 time:(double)a4;
- (GEOSolarEventCalculator)initWithLocation:(id)a3 time:(double)a4 altitudeInDegrees:(double)a5 accuracy:(double)a6;
- (GEOSolarEventCalculator)initWithLocation:(id)a3 time:(double)a4 altitudeInDegrees:(double)a5 accuracy:(double)a6 after:(BOOL)a7;
- (double)nextEventOfType:(unsigned int)a3;
- (id)description;
- (void)dealloc;
@end

@implementation GEOSolarEventCalculator

- (GEOSolarEventCalculator)initWithLocation:(id)a3 time:(double)a4 altitudeInDegrees:(double)a5 accuracy:(double)a6
{
  return -[GEOSolarEventCalculator initWithLocation:time:altitudeInDegrees:accuracy:after:](self, "initWithLocation:time:altitudeInDegrees:accuracy:after:", 1, a3.var0, a3.var1, a4, a5, a6);
}

- (double)nextEventOfType:(unsigned int)a3
{
  GEORiseTransitSet::eventOfType((GEORiseTransitSet *)self->_rts, a3);
  double v4 = -(*MEMORY[0x1E4F1CF78] - (v3 + -2440587.5) * 86400.0);
  BOOL v5 = v3 <= 0.0;
  double result = 0.0;
  if (!v5) {
    return v4;
  }
  return result;
}

- (void)dealloc
{
  rts = self->_rts;
  if (rts)
  {
    std::__function::__value_func<double ()(double)>::~__value_func[abi:ne180100](rts + 39);
    MEMORY[0x18C11F580](rts, 0x1020C40CBE26B1DLL);
  }
  v4.receiver = self;
  v4.super_class = (Class)GEOSolarEventCalculator;
  [(GEOSolarEventCalculator *)&v4 dealloc];
}

- (GEOSolarEventCalculator)initWithLocation:(id)a3 time:(double)a4 altitudeInDegrees:(double)a5 accuracy:(double)a6 after:(BOOL)a7
{
  $F24F406B2B787EFB06265DBA3D28CBD5 v12 = a3;
  double v10 = a6;
  double v11 = a5;
  BOOL v9 = a7;
  v8.receiver = self;
  v8.super_class = (Class)GEOSolarEventCalculator;
  if ([(GEOSolarEventCalculator *)&v8 init]) {
    operator new();
  }
  return 0;
}

+ (double)nextEventOfType:(unsigned int)a3 after:(double)a4 forLocation:(id)a5
{
  +[GEOSolarEventCalculator nextEventOfType:after:forLocation:altitudeInDegrees:accuracy:](GEOSolarEventCalculator, "nextEventOfType:after:forLocation:altitudeInDegrees:accuracy:", *(void *)&a3, a4, a5.var0, a5.var1, -3.0, 60.0);
  return result;
}

+ (double)nextEventOfType:(unsigned int)a3 after:(double)a4 forLocation:(id)a5 altitudeInDegrees:(double)a6 accuracy:(double)a7
{
  uint64_t v7 = *(void *)&a3;
  objc_super v8 = -[GEOSolarEventCalculator initWithLocation:time:altitudeInDegrees:accuracy:]([GEOSolarEventCalculator alloc], "initWithLocation:time:altitudeInDegrees:accuracy:", a5.var0, a5.var1, a4, a6, a7);
  [(GEOSolarEventCalculator *)v8 nextEventOfType:v7];
  double v10 = v9;

  return v10;
}

+ (double)prevEventOfType:(unsigned int)a3 before:(double)a4 forLocation:(id)a5 altitudeInDegrees:(double)a6 accuracy:(double)a7
{
  uint64_t v7 = *(void *)&a3;
  objc_super v8 = -[GEOSolarEventCalculator initWithLocation:time:altitudeInDegrees:accuracy:after:]([GEOSolarEventCalculator alloc], "initWithLocation:time:altitudeInDegrees:accuracy:after:", 0, a5.var0, a5.var1, a4, a6, a7);
  [(GEOSolarEventCalculator *)v8 nextEventOfType:v7];
  double v10 = v9;

  return v10;
}

- (GEOSolarEventCalculator)initWithLocation:(id)a3 time:(double)a4
{
  return -[GEOSolarEventCalculator initWithLocation:time:altitudeInDegrees:accuracy:](self, "initWithLocation:time:altitudeInDegrees:accuracy:", a3.var0, a3.var1, a4, -3.0, 60.0);
}

- (id)description
{
  double v3 = [MEMORY[0x1E4F28E78] string];
  objc_super v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@: %p> all events: {\n", v5, self];

  for (uint64_t i = 0; i != 10; ++i)
  {
    int v7 = allEvents[i];
    objc_super v8 = StringFromGEOSolarEventType(v7);
    GEORiseTransitSet::eventOfType((GEORiseTransitSet *)self->_rts, v7);
    [v3 appendFormat:@"  %@: %f\n", v8, v9];
  }
  [v3 appendString:@"}"];

  return v3;
}

@end