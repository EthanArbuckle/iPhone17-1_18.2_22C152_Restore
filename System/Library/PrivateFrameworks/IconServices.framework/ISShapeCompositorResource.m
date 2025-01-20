@interface ISShapeCompositorResource
+ (double)continuousCornerRadiusForSize:(CGSize)a3;
+ (id)circleShape;
+ (id)continuousRoundedRectShape;
+ (id)tvOSRoundedRectShape;
- (IFColor)fillColor;
- (IFColor)lineColor;
- (double)lineWidth;
- (id)_init;
- (id)imageForSize:(CGSize)a3 scale:(double)a4;
- (void)setFillColor:(id)a3;
- (void)setLineColor:(id)a3;
- (void)setLineWidth:(double)a3;
@end

@implementation ISShapeCompositorResource

+ (double)continuousCornerRadiusForSize:(CGSize)a3
{
  if (a3.width >= a3.height) {
    a3.width = a3.height;
  }
  return a3.width * 0.225;
}

+ (id)continuousRoundedRectShape
{
  if (continuousRoundedRectShape_onceToken != -1) {
    dispatch_once(&continuousRoundedRectShape_onceToken, &__block_literal_global_20);
  }
  v2 = (void *)continuousRoundedRectShape_resource;
  return v2;
}

uint64_t __55__ISShapeCompositorResource_continuousRoundedRectShape__block_invoke()
{
  continuousRoundedRectShape_resource = [(ISShapeCompositorResource *)[ISContinuousRoundedRect alloc] _init];
  return MEMORY[0x1F41817F8]();
}

+ (id)circleShape
{
  if (circleShape_onceToken != -1) {
    dispatch_once(&circleShape_onceToken, &__block_literal_global_17_0);
  }
  v2 = (void *)circleShape_resource;
  return v2;
}

uint64_t __40__ISShapeCompositorResource_circleShape__block_invoke()
{
  circleShape_resource = [(ISShapeCompositorResource *)[ISCircle alloc] _init];
  return MEMORY[0x1F41817F8]();
}

+ (id)tvOSRoundedRectShape
{
  if (tvOSRoundedRectShape_onceToken != -1) {
    dispatch_once(&tvOSRoundedRectShape_onceToken, &__block_literal_global_20);
  }
  v2 = (void *)tvOSRoundedRectShape_resource;
  return v2;
}

uint64_t __49__ISShapeCompositorResource_tvOSRoundedRectShape__block_invoke()
{
  tvOSRoundedRectShape_resource = objc_alloc_init(IStvOSRoundedRect);
  return MEMORY[0x1F41817F8]();
}

- (id)_init
{
  v7.receiver = self;
  v7.super_class = (Class)ISShapeCompositorResource;
  v2 = [(ISShapeCompositorResource *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F6F1C8] black];
    fillColor = v2->_fillColor;
    v2->_fillColor = (IFColor *)v3;

    lineColor = v2->_lineColor;
    v2->_lineColor = 0;
    v2->_lineWidth = 0.0;
  }
  return v2;
}

- (id)imageForSize:(CGSize)a3 scale:(double)a4
{
  objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", @"Abstract method called.", 0, 0, a3.width, a3.height, a4);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (IFColor)fillColor
{
  return (IFColor *)objc_getProperty(self, a2, 8, 1);
}

- (void)setFillColor:(id)a3
{
}

- (IFColor)lineColor
{
  return (IFColor *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLineColor:(id)a3
{
}

- (double)lineWidth
{
  return self->_lineWidth;
}

- (void)setLineWidth:(double)a3
{
  self->_lineWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lineColor, 0);
  objc_storeStrong((id *)&self->_fillColor, 0);
}

@end