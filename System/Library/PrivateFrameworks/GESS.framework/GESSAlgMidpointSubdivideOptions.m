@interface GESSAlgMidpointSubdivideOptions
- (GESSAlgMidpointSubdivideOptions)init;
- (unsigned)iterations;
- (void)setIterations:(unsigned int)a3;
@end

@implementation GESSAlgMidpointSubdivideOptions

- (GESSAlgMidpointSubdivideOptions)init
{
  v5.receiver = self;
  v5.super_class = (Class)GESSAlgMidpointSubdivideOptions;
  v2 = [(GESSAlgMidpointSubdivideOptions *)&v5 init];
  v3 = v2;
  if (v2) {
    [(GESSAlgMidpointSubdivideOptions *)v2 setIterations:1];
  }
  return v3;
}

- (unsigned)iterations
{
  return self->iterations;
}

- (void)setIterations:(unsigned int)a3
{
  self->iterations = a3;
}

@end