@interface MPSGraphCropResizeOpDescriptor
+ (id)descriptorWithResizeWidth:(unint64_t)a3 resizeHeight:(unint64_t)a4;
+ (id)descriptorWithResizeWidth:(unint64_t)a3 resizeHeight:(unint64_t)a4 normalizeCoordinates:(BOOL)a5 spatialScale:(float)a6 resizeMode:(unint64_t)a7 samplingMode:(unint64_t)a8 coordinateMode:(unint64_t)a9;
- (BOOL)normalizeCoordinates;
- (float)spatialScale;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)coordinateMode;
- (unint64_t)resizeHeight;
- (unint64_t)resizeMode;
- (unint64_t)resizeWidth;
- (unint64_t)samplingMode;
- (void)setCoordinateMode:(unint64_t)a3;
- (void)setNormalizeCoordinates:(BOOL)a3;
- (void)setResizeHeight:(unint64_t)a3;
- (void)setResizeMode:(unint64_t)a3;
- (void)setResizeWidth:(unint64_t)a3;
- (void)setSamplingMode:(unint64_t)a3;
- (void)setSpatialScale:(float)a3;
@end

@implementation MPSGraphCropResizeOpDescriptor

+ (id)descriptorWithResizeWidth:(unint64_t)a3 resizeHeight:(unint64_t)a4 normalizeCoordinates:(BOOL)a5 spatialScale:(float)a6 resizeMode:(unint64_t)a7 samplingMode:(unint64_t)a8 coordinateMode:(unint64_t)a9
{
  BOOL v13 = a5;
  v16 = objc_alloc_init(MPSGraphCropResizeOpDescriptor);
  [(MPSGraphCropResizeOpDescriptor *)v16 setResizeWidth:a3];
  [(MPSGraphCropResizeOpDescriptor *)v16 setResizeHeight:a4];
  [(MPSGraphCropResizeOpDescriptor *)v16 setNormalizeCoordinates:v13];
  *(float *)&double v17 = a6;
  [(MPSGraphCropResizeOpDescriptor *)v16 setSpatialScale:v17];
  [(MPSGraphCropResizeOpDescriptor *)v16 setResizeMode:a7];
  [(MPSGraphCropResizeOpDescriptor *)v16 setSamplingMode:a8];
  [(MPSGraphCropResizeOpDescriptor *)v16 setCoordinateMode:a9];

  return v16;
}

+ (id)descriptorWithResizeWidth:(unint64_t)a3 resizeHeight:(unint64_t)a4
{
  v6 = objc_alloc_init(MPSGraphCropResizeOpDescriptor);
  [(MPSGraphCropResizeOpDescriptor *)v6 setResizeWidth:a3];
  [(MPSGraphCropResizeOpDescriptor *)v6 setResizeHeight:a4];
  [(MPSGraphCropResizeOpDescriptor *)v6 setNormalizeCoordinates:1];
  LODWORD(v7) = 1.0;
  [(MPSGraphCropResizeOpDescriptor *)v6 setSpatialScale:v7];
  [(MPSGraphCropResizeOpDescriptor *)v6 setResizeMode:1];
  [(MPSGraphCropResizeOpDescriptor *)v6 setSamplingMode:1];
  [(MPSGraphCropResizeOpDescriptor *)v6 setCoordinateMode:0];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [MPSGraphCropResizeOpDescriptor alloc];
  [(MPSGraphCropResizeOpDescriptor *)v4 setResizeWidth:self->_resizeWidth];
  [(MPSGraphCropResizeOpDescriptor *)v4 setResizeHeight:self->_resizeHeight];
  [(MPSGraphCropResizeOpDescriptor *)v4 setNormalizeCoordinates:self->_normalizeCoordinates];
  *(float *)&double v5 = self->_spatialScale;
  [(MPSGraphCropResizeOpDescriptor *)v4 setSpatialScale:v5];
  [(MPSGraphCropResizeOpDescriptor *)v4 setResizeMode:self->_resizeMode];
  [(MPSGraphCropResizeOpDescriptor *)v4 setSamplingMode:self->_samplingMode];
  [(MPSGraphCropResizeOpDescriptor *)v4 setCoordinateMode:self->_coordinateMode];
  [(MPSGraphCropResizeOpDescriptor *)v4 setResizeWidth:self->_resizeWidth];
  return v4;
}

- (unint64_t)resizeWidth
{
  return self->_resizeWidth;
}

- (void)setResizeWidth:(unint64_t)a3
{
  self->_resizeWidth = a3;
}

- (unint64_t)resizeHeight
{
  return self->_resizeHeight;
}

- (void)setResizeHeight:(unint64_t)a3
{
  self->_resizeHeight = a3;
}

- (BOOL)normalizeCoordinates
{
  return self->_normalizeCoordinates;
}

- (void)setNormalizeCoordinates:(BOOL)a3
{
  self->_normalizeCoordinates = a3;
}

- (float)spatialScale
{
  return self->_spatialScale;
}

- (void)setSpatialScale:(float)a3
{
  self->_spatialScale = a3;
}

- (unint64_t)resizeMode
{
  return self->_resizeMode;
}

- (void)setResizeMode:(unint64_t)a3
{
  self->_resizeMode = a3;
}

- (unint64_t)samplingMode
{
  return self->_samplingMode;
}

- (void)setSamplingMode:(unint64_t)a3
{
  self->_samplingMode = a3;
}

- (unint64_t)coordinateMode
{
  return self->_coordinateMode;
}

- (void)setCoordinateMode:(unint64_t)a3
{
  self->_coordinateMode = a3;
}

@end