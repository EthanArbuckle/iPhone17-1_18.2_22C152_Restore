@interface GESSAlgParameterizeOptions
- (BOOL)enableUVUtilizationOptimization;
- (GESSAlgParameterizeOptions)init;
- (float)gutter;
- (int)overlapCheckMode;
- (int)packingMethod;
- (unsigned)numOfTextures;
- (unsigned)textureResolution;
- (void)setEnableUVUtilizationOptimization:(BOOL)a3;
- (void)setGutter:(float)a3;
- (void)setNumOfTextures:(unsigned int)a3;
- (void)setOverlapCheckMode:(int)a3;
- (void)setPackingMethod:(int)a3;
- (void)setTextureResolution:(unsigned int)a3;
@end

@implementation GESSAlgParameterizeOptions

- (GESSAlgParameterizeOptions)init
{
  v6.receiver = self;
  v6.super_class = (Class)GESSAlgParameterizeOptions;
  v2 = [(GESSAlgParameterizeOptions *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(GESSAlgParameterizeOptions *)v2 setPackingMethod:0];
    [(GESSAlgParameterizeOptions *)v3 setOverlapCheckMode:0];
    [(GESSAlgParameterizeOptions *)v3 setEnableUVUtilizationOptimization:1];
    [(GESSAlgParameterizeOptions *)v3 setTextureResolution:4096];
    [(GESSAlgParameterizeOptions *)v3 setNumOfTextures:1];
    LODWORD(v4) = 8.0;
    [(GESSAlgParameterizeOptions *)v3 setGutter:v4];
  }
  return v3;
}

- (int)packingMethod
{
  return self->packingMethod;
}

- (void)setPackingMethod:(int)a3
{
  self->packingMethod = a3;
}

- (int)overlapCheckMode
{
  return self->overlapCheckMode;
}

- (void)setOverlapCheckMode:(int)a3
{
  self->overlapCheckMode = a3;
}

- (BOOL)enableUVUtilizationOptimization
{
  return self->enableUVUtilizationOptimization;
}

- (void)setEnableUVUtilizationOptimization:(BOOL)a3
{
  self->enableUVUtilizationOptimization = a3;
}

- (unsigned)textureResolution
{
  return self->textureResolution;
}

- (void)setTextureResolution:(unsigned int)a3
{
  self->textureResolution = a3;
}

- (unsigned)numOfTextures
{
  return self->numOfTextures;
}

- (void)setNumOfTextures:(unsigned int)a3
{
  self->numOfTextures = a3;
}

- (float)gutter
{
  return self->gutter;
}

- (void)setGutter:(float)a3
{
  self->gutter = a3;
}

@end