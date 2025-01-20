@interface DYMetalLayer
- (BOOL)framebufferOnly;
- (BOOL)wantsExtendedDynamicRangeContent;
- (CATransform3D)transform;
- (CGColorSpace)colorspace;
- (CGPoint)anchorPoint;
- (CGRect)bounds;
- (CGSize)drawableSize;
- (MTLDevice)device;
- (double)contentsScale;
- (id)nextDrawable;
- (id)nextDrawableWithTextureResourceIndex:(unint64_t)a3;
- (unint64_t)pixelFormat;
- (void)setAnchorPoint:(CGPoint)a3;
- (void)setBounds:(CGRect)a3;
- (void)setColorspace:(CGColorSpace *)a3;
- (void)setContentsScale:(double)a3;
- (void)setDevice:(id)a3;
- (void)setDrawableSize:(CGSize)a3;
- (void)setFramebufferOnly:(BOOL)a3;
- (void)setPixelFormat:(unint64_t)a3;
- (void)setTransform:(CATransform3D *)a3;
- (void)setWantsExtendedDynamicRangeContent:(BOOL)a3;
@end

@implementation DYMetalLayer

- (void).cxx_destruct
{
}

- (void)setColorspace:(CGColorSpace *)a3
{
  self->_colorspace = a3;
}

- (CGColorSpace)colorspace
{
  return self->_colorspace;
}

- (void)setContentsScale:(double)a3
{
  self->_contentsScale = a3;
}

- (double)contentsScale
{
  return self->_contentsScale;
}

- (void)setBounds:(CGRect)a3
{
  self->_bounds = a3;
}

- (CGRect)bounds
{
  double x = self->_bounds.origin.x;
  double y = self->_bounds.origin.y;
  double width = self->_bounds.size.width;
  double height = self->_bounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setWantsExtendedDynamicRangeContent:(BOOL)a3
{
  self->_wantsExtendedDynamicRangeContent = a3;
}

- (BOOL)wantsExtendedDynamicRangeContent
{
  return self->_wantsExtendedDynamicRangeContent;
}

- (void)setFramebufferOnly:(BOOL)a3
{
  self->_framebufferOnldouble y = a3;
}

- (BOOL)framebufferOnly
{
  return self->_framebufferOnly;
}

- (void)setAnchorPoint:(CGPoint)a3
{
  self->_anchorPoint = a3;
}

- (CGPoint)anchorPoint
{
  double x = self->_anchorPoint.x;
  double y = self->_anchorPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setDrawableSize:(CGSize)a3
{
  self->_drawableSize = a3;
}

- (CGSize)drawableSize
{
  double width = self->_drawableSize.width;
  double height = self->_drawableSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPixelFormat:(unint64_t)a3
{
  self->_pixelFormat = a3;
}

- (unint64_t)pixelFormat
{
  return self->_pixelFormat;
}

- (void)setTransform:(CATransform3D *)a3
{
  long long v3 = *(_OWORD *)&a3->m11;
  long long v4 = *(_OWORD *)&a3->m13;
  long long v5 = *(_OWORD *)&a3->m23;
  *(_OWORD *)&self->_transform.m21 = *(_OWORD *)&a3->m21;
  *(_OWORD *)&self->_transform.m23 = v5;
  *(_OWORD *)&self->_transform.m11 = v3;
  *(_OWORD *)&self->_transform.m13 = v4;
  long long v6 = *(_OWORD *)&a3->m31;
  long long v7 = *(_OWORD *)&a3->m33;
  long long v8 = *(_OWORD *)&a3->m43;
  *(_OWORD *)&self->_transform.m41 = *(_OWORD *)&a3->m41;
  *(_OWORD *)&self->_transform.m43 = v8;
  *(_OWORD *)&self->_transform.m31 = v6;
  *(_OWORD *)&self->_transform.m33 = v7;
}

- (CATransform3D)transform
{
  long long v3 = *(_OWORD *)&self[1].m31;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&self[1].m23;
  *(_OWORD *)&retstr->m33 = v3;
  long long v4 = *(_OWORD *)&self[1].m41;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&self[1].m33;
  *(_OWORD *)&retstr->m43 = v4;
  long long v5 = *(_OWORD *)&self[1].m11;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self->m43;
  *(_OWORD *)&retstr->m13 = v5;
  long long v6 = *(_OWORD *)&self[1].m21;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&self[1].m13;
  *(_OWORD *)&retstr->m23 = v6;
  return self;
}

- (void)setDevice:(id)a3
{
}

- (MTLDevice)device
{
  return self->_device;
}

- (id)nextDrawableWithTextureResourceIndex:(unint64_t)a3
{
  unint64_t v5 = [(DYMetalLayer *)self pixelFormat];
  [(DYMetalLayer *)self drawableSize];
  unint64_t v7 = (unint64_t)(v6 + 0.5);
  [(DYMetalLayer *)self drawableSize];
  v9 = +[MTLTextureDescriptor texture2DDescriptorWithPixelFormat:v5 width:v7 height:(unint64_t)(v8 + 0.5) mipmapped:0];
  if ([(DYMetalLayer *)self framebufferOnly]) {
    uint64_t v10 = 4;
  }
  else {
    uint64_t v10 = 0;
  }
  [v9 setUsage:v10];
  [v9 setIsDrawable:1];
  [v9 setResourceIndex:a3];
  [v9 setForceResourceIndex:1];
  v11 = [(DYMetalLayer *)self device];
  id v12 = [v11 newTextureWithDescriptor:v9];

  [v12 setLabel:@"CAMetalLayer Drawable"];
  v13 = [[DYMetalDrawable alloc] initWithTexture:v12];

  return v13;
}

- (id)nextDrawable
{
  unint64_t v3 = [(DYMetalLayer *)self pixelFormat];
  [(DYMetalLayer *)self drawableSize];
  unint64_t v5 = (unint64_t)(v4 + 0.5);
  [(DYMetalLayer *)self drawableSize];
  unint64_t v7 = +[MTLTextureDescriptor texture2DDescriptorWithPixelFormat:v3 width:v5 height:(unint64_t)(v6 + 0.5) mipmapped:0];
  if ([(DYMetalLayer *)self framebufferOnly]) {
    uint64_t v8 = 4;
  }
  else {
    uint64_t v8 = 0;
  }
  [v7 setUsage:v8];
  [v7 setIsDrawable:1];
  v9 = [(DYMetalLayer *)self device];
  id v10 = [v9 newTextureWithDescriptor:v7];

  [v10 setLabel:@"CAMetalLayer Drawable"];
  v11 = [[DYMetalDrawable alloc] initWithTexture:v10];

  return v11;
}

@end