@interface CAContentStreamFrame
- (BOOL)fastPath;
- (CGRect)contentRect;
- (__IOSurface)surface;
- (double)contentScaleX;
- (double)contentScaleY;
- (double)displayResolution;
- (int)status;
- (unint64_t)displayTime;
- (unint64_t)dropCount;
- (unsigned)surfaceId;
- (void)setContentRect:(CGRect)a3;
- (void)setContentScaleX:(double)a3;
- (void)setContentScaleY:(double)a3;
- (void)setDisplayResolution:(double)a3;
- (void)setDisplayTime:(unint64_t)a3;
- (void)setDropCount:(unint64_t)a3;
- (void)setFastPath:(BOOL)a3;
- (void)setStatus:(int)a3;
- (void)setSurface:(__IOSurface *)a3;
- (void)setSurfaceId:(unsigned int)a3;
@end

@implementation CAContentStreamFrame

- (void)setFastPath:(BOOL)a3
{
  self->_fastPath = a3;
}

- (BOOL)fastPath
{
  return self->_fastPath;
}

- (void)setContentRect:(CGRect)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  CGRect src = a3;
  objc_copyStruct(&self->_contentRect, &src, 32, 1, 0);
}

- (CGRect)contentRect
{
  dest[4] = *MEMORY[0x1E4F143B8];
  objc_copyStruct(dest, &self->_contentRect, 32, 1, 0);
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

- (void)setContentScaleY:(double)a3
{
  self->_contentScaleY = a3;
}

- (double)contentScaleY
{
  return self->_contentScaleY;
}

- (void)setContentScaleX:(double)a3
{
  self->_contentScaleX = a3;
}

- (double)contentScaleX
{
  return self->_contentScaleX;
}

- (void)setDisplayResolution:(double)a3
{
  self->_displayResolution = a3;
}

- (double)displayResolution
{
  return self->_displayResolution;
}

- (void)setDropCount:(unint64_t)a3
{
  self->_dropCount = a3;
}

- (unint64_t)dropCount
{
  return self->_dropCount;
}

- (void)setSurfaceId:(unsigned int)a3
{
  self->_surfaceId = a3;
}

- (unsigned)surfaceId
{
  return self->_surfaceId;
}

- (void)setSurface:(__IOSurface *)a3
{
  self->_surface = a3;
}

- (__IOSurface)surface
{
  return self->_surface;
}

- (void)setDisplayTime:(unint64_t)a3
{
  self->_displayTime = a3;
}

- (unint64_t)displayTime
{
  return self->_displayTime;
}

- (void)setStatus:(int)a3
{
  self->_status = a3;
}

- (int)status
{
  return self->_status;
}

@end