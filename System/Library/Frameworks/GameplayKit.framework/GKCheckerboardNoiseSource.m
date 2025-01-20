@interface GKCheckerboardNoiseSource
+ (GKCheckerboardNoiseSource)checkerboardNoiseWithSquareSize:(double)squareSize;
- (GKCheckerboardNoiseSource)init;
- (GKCheckerboardNoiseSource)initWithSquareSize:(double)squareSize;
- (double)squareSize;
- (double)valueAt:(GKCheckerboardNoiseSource *)self;
- (id)cloneModule;
- (void)setSquareSize:(double)squareSize;
@end

@implementation GKCheckerboardNoiseSource

+ (GKCheckerboardNoiseSource)checkerboardNoiseWithSquareSize:(double)squareSize
{
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithSquareSize:squareSize];

  return (GKCheckerboardNoiseSource *)v3;
}

- (GKCheckerboardNoiseSource)init
{
  return [(GKCheckerboardNoiseSource *)self initWithSquareSize:1.0];
}

- (GKCheckerboardNoiseSource)initWithSquareSize:(double)squareSize
{
  v7.receiver = self;
  v7.super_class = (Class)GKCheckerboardNoiseSource;
  v4 = [(GKCheckerboardNoiseSource *)&v7 init];
  v5 = v4;
  if (v4) {
    [(GKCheckerboardNoiseSource *)v4 setSquareSize:squareSize];
  }
  return v5;
}

- (double)valueAt:(GKCheckerboardNoiseSource *)self
{
  long long v12 = *(_OWORD *)v2;
  double v4 = v2[2];
  [(GKCheckerboardNoiseSource *)self squareSize];
  unsigned int v6 = vcvtmd_s64_f64(*(double *)&v12 / v5);
  [(GKCheckerboardNoiseSource *)self squareSize];
  unsigned int v8 = vcvtmd_s64_f64(*((double *)&v12 + 1) / v7);
  [(GKCheckerboardNoiseSource *)self squareSize];
  unsigned int v10 = v8 + v6 + vcvtmd_s64_f64(v4 / v9);
  double result = -1.0;
  if ((v10 & 1) == 0) {
    return 1.0;
  }
  return result;
}

- (id)cloneModule
{
  [(GKCheckerboardNoiseSource *)self squareSize];

  return +[GKCheckerboardNoiseSource checkerboardNoiseWithSquareSize:](GKCheckerboardNoiseSource, "checkerboardNoiseWithSquareSize:");
}

- (double)squareSize
{
  return self->_squareSize;
}

- (void)setSquareSize:(double)squareSize
{
  self->_squareSize = squareSize;
}

@end