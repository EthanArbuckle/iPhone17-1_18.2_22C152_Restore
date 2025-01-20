@interface GESSAlgSplitLongEdgesOptions
- (GESSAlgSplitLongEdgesOptions)init;
- (float)ratio;
- (unsigned)iterations;
- (void)setIterations:(unsigned int)a3;
- (void)setRatio:(float)a3;
@end

@implementation GESSAlgSplitLongEdgesOptions

- (GESSAlgSplitLongEdgesOptions)init
{
  v6.receiver = self;
  v6.super_class = (Class)GESSAlgSplitLongEdgesOptions;
  v2 = [(GESSAlgSplitLongEdgesOptions *)&v6 init];
  v4 = v2;
  if (v2)
  {
    LODWORD(v3) = 1068149419;
    [(GESSAlgSplitLongEdgesOptions *)v2 setRatio:v3];
    [(GESSAlgSplitLongEdgesOptions *)v4 setIterations:1];
  }
  return v4;
}

- (float)ratio
{
  return self->ratio;
}

- (void)setRatio:(float)a3
{
  self->ratio = a3;
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