@interface CUIRenditionLayerReference
- (BOOL)fixedFrame;
- (BOOL)makeOpaqueIfPossible;
- (CGRect)frame;
- (CUIRenditionKey)referenceKey;
- (CUIRenditionLayerReference)init;
- (NSString)layerName;
- (double)opacity;
- (int)blendMode;
- (void)dealloc;
- (void)setBlendMode:(int)a3;
- (void)setFixedFrame:(BOOL)a3;
- (void)setFrame:(CGRect)a3;
- (void)setLayerName:(id)a3;
- (void)setMakeOpaqueIfPossible:(BOOL)a3;
- (void)setOpacity:(double)a3;
- (void)setReferenceKey:(id)a3;
@end

@implementation CUIRenditionLayerReference

- (CUIRenditionLayerReference)init
{
  v3.receiver = self;
  v3.super_class = (Class)CUIRenditionLayerReference;
  result = [(CUIRenditionLayerReference *)&v3 init];
  result->_opacity = 1.0;
  result->_blendMode = 0;
  *(_WORD *)&result->_fixedFrame = 0;
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CUIRenditionLayerReference;
  [(CUIRenditionLayerReference *)&v3 dealloc];
}

- (CGRect)frame
{
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (NSString)layerName
{
  return self->_layerName;
}

- (void)setLayerName:(id)a3
{
}

- (double)opacity
{
  return self->_opacity;
}

- (void)setOpacity:(double)a3
{
  self->_opacitdouble y = a3;
}

- (int)blendMode
{
  return self->_blendMode;
}

- (void)setBlendMode:(int)a3
{
  self->_blendMode = a3;
}

- (CUIRenditionKey)referenceKey
{
  return self->_referenceKey;
}

- (void)setReferenceKey:(id)a3
{
}

- (BOOL)fixedFrame
{
  return self->_fixedFrame;
}

- (void)setFixedFrame:(BOOL)a3
{
  self->_fixedFrame = a3;
}

- (BOOL)makeOpaqueIfPossible
{
  return self->_makeOpaqueIfPossible;
}

- (void)setMakeOpaqueIfPossible:(BOOL)a3
{
  self->_makeOpaqueIfPossible = a3;
}

@end