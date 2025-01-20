@interface CKBrowserDraggedSticker
- (CGRect)frame;
- (CKAnimatedImage)animatedImage;
- (CKBrowserDraggedSticker)initWithAnimatedImage:(id)a3 frame:(CGRect)a4 scale:(double)a5 rotationAngle:(double)a6;
- (double)rotationAngle;
- (double)scale;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation CKBrowserDraggedSticker

- (CKBrowserDraggedSticker)initWithAnimatedImage:(id)a3 frame:(CGRect)a4 scale:(double)a5 rotationAngle:(double)a6
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v14 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CKBrowserDraggedSticker;
  v15 = [(CKBrowserDraggedSticker *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_animatedImage, a3);
    v16->_frame.origin.CGFloat x = x;
    v16->_frame.origin.CGFloat y = y;
    v16->_frame.size.CGFloat width = width;
    v16->_frame.size.CGFloat height = height;
    v16->_scale = a5;
    v16->_rotationAngle = a6;
  }

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(CKBrowserDraggedSticker *)self animatedImage];
  [(CKBrowserDraggedSticker *)self frame];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  [(CKBrowserDraggedSticker *)self scale];
  double v15 = v14;
  [(CKBrowserDraggedSticker *)self rotationAngle];
  v17 = objc_msgSend(v4, "initWithAnimatedImage:frame:scale:rotationAngle:", v5, v7, v9, v11, v13, v15, v16);

  return v17;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(CKBrowserDraggedSticker *)self animatedImage];
  [(CKBrowserDraggedSticker *)self frame];
  v5 = NSStringFromCGRect(v12);
  [(CKBrowserDraggedSticker *)self rotationAngle];
  uint64_t v7 = v6;
  [(CKBrowserDraggedSticker *)self scale];
  double v9 = [v3 stringWithFormat:@"<CKBrowserDraggedSticker animated image: %@, frame in window: %@, rotation: %f, scale: %f>", v4, v5, v7, v8];

  return v9;
}

- (CKAnimatedImage)animatedImage
{
  return self->_animatedImage;
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

- (double)scale
{
  return self->_scale;
}

- (double)rotationAngle
{
  return self->_rotationAngle;
}

- (void).cxx_destruct
{
}

@end