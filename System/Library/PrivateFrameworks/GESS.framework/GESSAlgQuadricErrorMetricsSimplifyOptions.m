@interface GESSAlgQuadricErrorMetricsSimplifyOptions
- (BOOL)fixBoundary;
- (GESSAlgQuadricErrorMetricsSimplifyOptions)init;
- (float)strength;
- (void)setFixBoundary:(BOOL)a3;
- (void)setStrength:(float)a3;
@end

@implementation GESSAlgQuadricErrorMetricsSimplifyOptions

- (GESSAlgQuadricErrorMetricsSimplifyOptions)init
{
  v6.receiver = self;
  v6.super_class = (Class)GESSAlgQuadricErrorMetricsSimplifyOptions;
  v2 = [(GESSAlgQuadricErrorMetricsSimplifyOptions *)&v6 init];
  v4 = v2;
  if (v2)
  {
    LODWORD(v3) = 1058944319;
    [(GESSAlgQuadricErrorMetricsSimplifyOptions *)v2 setStrength:v3];
    [(GESSAlgQuadricErrorMetricsSimplifyOptions *)v4 setFixBoundary:1];
  }
  return v4;
}

- (float)strength
{
  return self->strength;
}

- (void)setStrength:(float)a3
{
  self->strength = a3;
}

- (BOOL)fixBoundary
{
  return self->fixBoundary;
}

- (void)setFixBoundary:(BOOL)a3
{
  self->fixBoundary = a3;
}

@end