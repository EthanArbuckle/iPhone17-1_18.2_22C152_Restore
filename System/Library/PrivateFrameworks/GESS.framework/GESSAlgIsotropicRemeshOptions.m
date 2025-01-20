@interface GESSAlgIsotropicRemeshOptions
- (GESSAlgIsotropicRemeshOptions)init;
- (float)collapseRatio;
- (float)smoothIterations;
- (float)smoothLambda;
- (float)splitRatio;
- (unsigned)iterations;
- (void)setCollapseRatio:(float)a3;
- (void)setIterations:(unsigned int)a3;
- (void)setSmoothIterations:(float)a3;
- (void)setSmoothLambda:(float)a3;
- (void)setSplitRatio:(float)a3;
@end

@implementation GESSAlgIsotropicRemeshOptions

- (GESSAlgIsotropicRemeshOptions)init
{
  v9.receiver = self;
  v9.super_class = (Class)GESSAlgIsotropicRemeshOptions;
  v2 = [(GESSAlgIsotropicRemeshOptions *)&v9 init];
  v3 = v2;
  if (v2)
  {
    [(GESSAlgIsotropicRemeshOptions *)v2 setIterations:5];
    LODWORD(v4) = 1068149419;
    [(GESSAlgIsotropicRemeshOptions *)v3 setSplitRatio:v4];
    LODWORD(v5) = 1061997773;
    [(GESSAlgIsotropicRemeshOptions *)v3 setCollapseRatio:v5];
    LODWORD(v6) = 1045220557;
    [(GESSAlgIsotropicRemeshOptions *)v3 setSmoothLambda:v6];
    LODWORD(v7) = 2.0;
    [(GESSAlgIsotropicRemeshOptions *)v3 setSmoothIterations:v7];
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

- (float)splitRatio
{
  return self->splitRatio;
}

- (void)setSplitRatio:(float)a3
{
  self->splitRatio = a3;
}

- (float)collapseRatio
{
  return self->collapseRatio;
}

- (void)setCollapseRatio:(float)a3
{
  self->collapseRatio = a3;
}

- (float)smoothLambda
{
  return self->smoothLambda;
}

- (void)setSmoothLambda:(float)a3
{
  self->smoothLambda = a3;
}

- (float)smoothIterations
{
  return self->smoothIterations;
}

- (void)setSmoothIterations:(float)a3
{
  self->smoothIterations = a3;
}

@end