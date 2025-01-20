@interface GESSAlgSmoothOptions
- (BOOL)enableTangentialRelaxation;
- (BOOL)fixBoundary;
- (GESSAlgSmoothOptions)init;
- (float)lambda;
- (unsigned)iterations;
- (void)setEnableTangentialRelaxation:(BOOL)a3;
- (void)setFixBoundary:(BOOL)a3;
- (void)setIterations:(unsigned int)a3;
- (void)setLambda:(float)a3;
@end

@implementation GESSAlgSmoothOptions

- (GESSAlgSmoothOptions)init
{
  v6.receiver = self;
  v6.super_class = (Class)GESSAlgSmoothOptions;
  v2 = [(GESSAlgSmoothOptions *)&v6 init];
  v4 = v2;
  if (v2)
  {
    LODWORD(v3) = 0.5;
    [(GESSAlgSmoothOptions *)v2 setLambda:v3];
    [(GESSAlgSmoothOptions *)v4 setIterations:1];
    [(GESSAlgSmoothOptions *)v4 setFixBoundary:1];
    [(GESSAlgSmoothOptions *)v4 setEnableTangentialRelaxation:0];
  }
  return v4;
}

- (float)lambda
{
  return self->lambda;
}

- (void)setLambda:(float)a3
{
  self->lambda = a3;
}

- (unsigned)iterations
{
  return self->iterations;
}

- (void)setIterations:(unsigned int)a3
{
  self->iterations = a3;
}

- (BOOL)fixBoundary
{
  return self->fixBoundary;
}

- (void)setFixBoundary:(BOOL)a3
{
  self->fixBoundary = a3;
}

- (BOOL)enableTangentialRelaxation
{
  return self->enableTangentialRelaxation;
}

- (void)setEnableTangentialRelaxation:(BOOL)a3
{
  self->enableTangentialRelaxation = a3;
}

@end