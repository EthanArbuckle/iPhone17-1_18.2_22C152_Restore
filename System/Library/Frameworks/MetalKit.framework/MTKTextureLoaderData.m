@interface MTKTextureLoaderData
- (MTKTextureLoaderData)init;
- (NSString)imageOrigin;
- (id)getDataForArrayElement:(unint64_t)a3 face:(unint64_t)a4 level:(unint64_t)a5 depthPlane:(unint64_t)a6 bytesPerRow:(unint64_t *)a7 bytesPerImage:(unint64_t *)a8;
- (unint64_t)depth;
- (unint64_t)height;
- (unint64_t)numArrayElements;
- (unint64_t)numFaces;
- (unint64_t)numMipmapLevels;
- (unint64_t)pixelFormat;
- (unint64_t)textureType;
- (unint64_t)width;
- (void)dealloc;
- (void)setDepth:(unint64_t)a3;
- (void)setHeight:(unint64_t)a3;
- (void)setImageOrigin:(id)a3;
- (void)setNumArrayElements:(unint64_t)a3;
- (void)setNumFaces:(unint64_t)a3;
- (void)setNumMipmapLevels:(unint64_t)a3;
- (void)setPixelFormat:(unint64_t)a3;
- (void)setTextureType:(unint64_t)a3;
- (void)setWidth:(unint64_t)a3;
@end

@implementation MTKTextureLoaderData

- (void)setTextureType:(unint64_t)a3
{
  self->_textureType = a3;
}

- (void)setHeight:(unint64_t)a3
{
  self->_height = a3;
}

- (void)setWidth:(unint64_t)a3
{
  self->_width = a3;
}

- (void)setPixelFormat:(unint64_t)a3
{
  self->_pixelFormat = a3;
}

- (unint64_t)pixelFormat
{
  return self->_pixelFormat;
}

- (unint64_t)depth
{
  return self->_depth;
}

- (unint64_t)numFaces
{
  return self->_numFaces;
}

- (unint64_t)textureType
{
  return self->_textureType;
}

- (unint64_t)numMipmapLevels
{
  return self->_numMipmapLevels;
}

- (unint64_t)numArrayElements
{
  return self->_numArrayElements;
}

- (unint64_t)height
{
  return self->_height;
}

- (unint64_t)width
{
  return self->_width;
}

- (NSString)imageOrigin
{
  return self->_imageOrigin;
}

- (void)setNumFaces:(unint64_t)a3
{
  self->_numFaces = a3;
}

- (MTKTextureLoaderData)init
{
  v4.receiver = self;
  v4.super_class = (Class)MTKTextureLoaderData;
  result = [(MTKTextureLoaderData *)&v4 init];
  if (result)
  {
    int64x2_t v3 = vdupq_n_s64(1uLL);
    *(int64x2_t *)&result->_numMipmapLevels = v3;
    *(int64x2_t *)&result->_height = v3;
    *(int64x2_t *)&result->_numArrayElements = v3;
    result->_textureType = 2;
    result->_imageOrigin = (NSString *)@"MTKTextureLoaderOriginTopLeft";
  }
  return result;
}

- (void)setNumMipmapLevels:(unint64_t)a3
{
  self->_numMipmapLevels = a3;
}

- (void)setNumArrayElements:(unint64_t)a3
{
  self->_numArrayElements = a3;
}

- (void)setImageOrigin:(id)a3
{
  self->_imageOrigin = (NSString *)a3;
}

- (void)setDepth:(unint64_t)a3
{
  self->_depth = a3;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)MTKTextureLoaderData;
  [(MTKTextureLoaderData *)&v2 dealloc];
}

- (id)getDataForArrayElement:(unint64_t)a3 face:(unint64_t)a4 level:(unint64_t)a5 depthPlane:(unint64_t)a6 bytesPerRow:(unint64_t *)a7 bytesPerImage:(unint64_t *)a8
{
  return 0;
}

@end