@interface AVTViewCarouselLayout
+ (CGSize)severalItemsSizeForBounds:(CGSize)a3 aspectRatio:(CGSize)a4;
+ (id)adaptativeLayoutWithAVTViewAspectRatio:(CGSize)a3;
- (AVTViewCarouselLayout)initWithAVTViewAspectRatio:(CGSize)a3;
- (BOOL)fillContainer;
- (CGSize)avatarViewSizeForAvailableContentSize:(CGSize)a3;
- (CGSize)avtViewAspectRatio;
- (void)setFillContainer:(BOOL)a3;
@end

@implementation AVTViewCarouselLayout

+ (id)adaptativeLayoutWithAVTViewAspectRatio:(CGSize)a3
{
  v3 = objc_msgSend(objc_alloc((Class)a1), "initWithAVTViewAspectRatio:", a3.width, a3.height);
  return v3;
}

- (AVTViewCarouselLayout)initWithAVTViewAspectRatio:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)AVTViewCarouselLayout;
  result = [(AVTViewCarouselLayout *)&v6 init];
  if (result)
  {
    result->_avtViewAspectRatio.CGFloat width = width;
    result->_avtViewAspectRatio.CGFloat height = height;
    result->_fillContainer = 0;
  }
  return result;
}

- (CGSize)avatarViewSizeForAvailableContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v5 = *MEMORY[0x263F001B0];
  double v6 = *(double *)(MEMORY[0x263F001B0] + 8);
  if (width != *MEMORY[0x263F001B0] || height != v6)
  {
    BOOL v9 = [(AVTViewCarouselLayout *)self fillContainer];
    v10 = objc_opt_class();
    v11 = v10;
    if (v9)
    {
      objc_msgSend(v10, "fullSizeForBounds:", width, height);
    }
    else
    {
      [(AVTViewCarouselLayout *)self avtViewAspectRatio];
      objc_msgSend(v11, "severalItemsSizeForBounds:aspectRatio:", width, height, v12, v13);
    }
  }
  result.double height = v6;
  result.double width = v5;
  return result;
}

+ (CGSize)severalItemsSizeForBounds:(CGSize)a3 aspectRatio:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  _UIScaleTransformForAspectFitOfSizeInTargetSize();
  double v6 = height * v10 + v8 * width;
  double v7 = height * v11 + v9 * width;
  result.double height = v7;
  result.double width = v6;
  return result;
}

- (BOOL)fillContainer
{
  return self->_fillContainer;
}

- (void)setFillContainer:(BOOL)a3
{
  self->_fillContainer = a3;
}

- (CGSize)avtViewAspectRatio
{
  double width = self->_avtViewAspectRatio.width;
  double height = self->_avtViewAspectRatio.height;
  result.double height = height;
  result.double width = width;
  return result;
}

@end