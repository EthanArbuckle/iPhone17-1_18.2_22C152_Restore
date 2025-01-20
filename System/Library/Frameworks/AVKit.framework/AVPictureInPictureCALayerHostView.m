@interface AVPictureInPictureCALayerHostView
+ (Class)layerClass;
- (AVPictureInPictureCALayerHostView)initWithFrame:(CGRect)a3;
@end

@implementation AVPictureInPictureCALayerHostView

- (AVPictureInPictureCALayerHostView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AVPictureInPictureCALayerHostView;
  v3 = -[AVPictureInPictureCALayerHostView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(AVPictureInPictureCALayerHostView *)v3 layer];
    [v5 setInheritsTiming:0];
  }
  return v4;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end