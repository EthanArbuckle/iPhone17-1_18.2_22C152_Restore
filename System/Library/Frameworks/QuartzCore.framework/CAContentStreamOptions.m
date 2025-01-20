@interface CAContentStreamOptions
- (BOOL)alwaysScaleToFit;
- (BOOL)preserveAspectRatioKey;
- (BOOL)showCursorKey;
- (CGColor)backgroundColorKey;
- (CGColorSpace)colorSpaceKey;
- (CGRect)destinationRect;
- (CGRect)sourceRect;
- (CGSize)frameSize;
- (double)minimumFrameTime;
- (id)copyWithZone:(_NSZone *)a3;
- (unsigned)ChromaLocation;
- (unsigned)YCbCrMatrix;
- (unsigned)pixelFormat;
- (unsigned)queueDepth;
- (unsigned)targetDisplayId;
- (void)setAlwaysScaleToFit:(BOOL)a3;
- (void)setBackgroundColorKey:(CGColor *)a3;
- (void)setChromaLocation:(unsigned __int8)a3;
- (void)setColorSpaceKey:(CGColorSpace *)a3;
- (void)setDestinationRect:(CGRect)a3;
- (void)setFrameSize:(CGSize)a3;
- (void)setMinimumFrameTime:(double)a3;
- (void)setPixelFormat:(unsigned int)a3;
- (void)setPreserveAspectRatioKey:(BOOL)a3;
- (void)setQueueDepth:(unsigned int)a3;
- (void)setShowCursorKey:(BOOL)a3;
- (void)setSourceRect:(CGRect)a3;
- (void)setTargetDisplayId:(unsigned int)a3;
- (void)setYCbCrMatrix:(unsigned __int8)a3;
@end

@implementation CAContentStreamOptions

- (void)setChromaLocation:(unsigned __int8)a3
{
  self->_ChromaLocation = a3;
}

- (unsigned)ChromaLocation
{
  return self->_ChromaLocation;
}

- (void)setYCbCrMatrix:(unsigned __int8)a3
{
  self->_YCbCrMatrix = a3;
}

- (unsigned)YCbCrMatrix
{
  return self->_YCbCrMatrix;
}

- (void)setShowCursorKey:(BOOL)a3
{
  self->_showCursorKey = a3;
}

- (BOOL)showCursorKey
{
  return self->_showCursorKey;
}

- (void)setBackgroundColorKey:(CGColor *)a3
{
  self->_backgroundColorKey = a3;
}

- (CGColor)backgroundColorKey
{
  return self->_backgroundColorKey;
}

- (void)setColorSpaceKey:(CGColorSpace *)a3
{
  self->_colorSpaceKey = a3;
}

- (CGColorSpace)colorSpaceKey
{
  return self->_colorSpaceKey;
}

- (void)setPreserveAspectRatioKey:(BOOL)a3
{
  self->_preserveAspectRatioKey = a3;
}

- (BOOL)preserveAspectRatioKey
{
  return self->_preserveAspectRatioKey;
}

- (void)setDestinationRect:(CGRect)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  CGRect src = a3;
  objc_copyStruct(&self->_destinationRect, &src, 32, 1, 0);
}

- (CGRect)destinationRect
{
  dest[4] = *MEMORY[0x1E4F143B8];
  objc_copyStruct(dest, &self->_destinationRect, 32, 1, 0);
  double v2 = *(double *)dest;
  double v3 = *(double *)&dest[1];
  double v4 = *(double *)&dest[2];
  double v5 = *(double *)&dest[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setSourceRect:(CGRect)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  CGRect src = a3;
  objc_copyStruct(&self->_sourceRect, &src, 32, 1, 0);
}

- (CGRect)sourceRect
{
  dest[4] = *MEMORY[0x1E4F143B8];
  objc_copyStruct(dest, &self->_sourceRect, 32, 1, 0);
  double v2 = *(double *)dest;
  double v3 = *(double *)&dest[1];
  double v4 = *(double *)&dest[2];
  double v5 = *(double *)&dest[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setAlwaysScaleToFit:(BOOL)a3
{
  self->_alwaysScaleToFit = a3;
}

- (BOOL)alwaysScaleToFit
{
  return self->_alwaysScaleToFit;
}

- (void)setMinimumFrameTime:(double)a3
{
  self->_minimumFrameTime = a3;
}

- (double)minimumFrameTime
{
  return self->_minimumFrameTime;
}

- (void)setQueueDepth:(unsigned int)a3
{
  self->_queueDepth = a3;
}

- (unsigned)queueDepth
{
  return self->_queueDepth;
}

- (void)setFrameSize:(CGSize)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  CGSize src = a3;
  objc_copyStruct(&self->_frameSize, &src, 16, 1, 0);
}

- (CGSize)frameSize
{
  dest[2] = *MEMORY[0x1E4F143B8];
  objc_copyStruct(dest, &self->_frameSize, 16, 1, 0);
  double v2 = *(double *)dest;
  double v3 = *(double *)&dest[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setPixelFormat:(unsigned int)a3
{
  self->_pixelFormat = a3;
}

- (unsigned)pixelFormat
{
  return self->_pixelFormat;
}

- (void)setTargetDisplayId:(unsigned int)a3
{
  self->_targetDisplayId = a3;
}

- (unsigned)targetDisplayId
{
  return self->_targetDisplayId;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    objc_msgSend(v4, "setTargetDisplayId:", -[CAContentStreamOptions targetDisplayId](self, "targetDisplayId"));
    objc_msgSend(v4, "setPixelFormat:", -[CAContentStreamOptions pixelFormat](self, "pixelFormat"));
    [(CAContentStreamOptions *)self frameSize];
    objc_msgSend(v4, "setFrameSize:");
    objc_msgSend(v4, "setQueueDepth:", -[CAContentStreamOptions queueDepth](self, "queueDepth"));
    [(CAContentStreamOptions *)self minimumFrameTime];
    objc_msgSend(v4, "setMinimumFrameTime:");
    objc_msgSend(v4, "setAlwaysScaleToFit:", -[CAContentStreamOptions alwaysScaleToFit](self, "alwaysScaleToFit"));
    [(CAContentStreamOptions *)self sourceRect];
    objc_msgSend(v4, "setSourceRect:");
    [(CAContentStreamOptions *)self destinationRect];
    objc_msgSend(v4, "setDestinationRect:");
    objc_msgSend(v4, "setPreserveAspectRatioKey:", -[CAContentStreamOptions preserveAspectRatioKey](self, "preserveAspectRatioKey"));
    objc_msgSend(v4, "setColorSpaceKey:", -[CAContentStreamOptions colorSpaceKey](self, "colorSpaceKey"));
    objc_msgSend(v4, "setBackgroundColorKey:", -[CAContentStreamOptions backgroundColorKey](self, "backgroundColorKey"));
    objc_msgSend(v4, "setShowCursorKey:", -[CAContentStreamOptions showCursorKey](self, "showCursorKey"));
    objc_msgSend(v4, "setYCbCrMatrix:", -[CAContentStreamOptions YCbCrMatrix](self, "YCbCrMatrix"));
    objc_msgSend(v4, "setChromaLocation:", -[CAContentStreamOptions ChromaLocation](self, "ChromaLocation"));
  }
  return v4;
}

@end