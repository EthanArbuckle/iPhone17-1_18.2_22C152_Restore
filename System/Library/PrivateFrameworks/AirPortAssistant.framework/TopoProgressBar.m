@interface TopoProgressBar
+ (int)initImageCache;
+ (void)deallocImageCache;
- (CGImage)composeProgressBar;
- (CGSize)preferredFrameSize;
- (TopoProgressBar)initWithOwningView:(id)a3;
- (float)progressValue;
- (id)owningView;
- (void)dealloc;
- (void)layoutSublayers;
- (void)setOwningView:(id)a3;
- (void)setProgressValue:(float)a3;
@end

@implementation TopoProgressBar

+ (int)initImageCache
{
  if (qword_268148350) {
    return 0;
  }
  v3 = (void *)MEMORY[0x263F086E0];
  uint64_t v4 = objc_opt_class();
  uint64_t v6 = objc_msgSend_bundleForClass_(v3, v5, v4);
  v8 = objc_msgSend_imageNamed_inBundle_(ImageStore, v7, @"TopoProgressFill", v6);
  if (!v8) {
    return -6729;
  }
  qword_268148350 = (uint64_t)(id)objc_msgSend_resizableImageWithCapInsets_(v8, v9, v10, 0.0, 5.0, 0.0, 5.0);
  if (qword_268148350
    && (v11 = (void *)MEMORY[0x263F086E0],
        uint64_t v12 = objc_opt_class(),
        uint64_t v14 = objc_msgSend_bundleForClass_(v11, v13, v12),
        (v16 = objc_msgSend_imageNamed_inBundle_(ImageStore, v15, @"TopoProgressTrack", v14)) != 0)&& (qword_268148358 = (uint64_t)(id)objc_msgSend_resizableImageWithCapInsets_(v16, v17, v18, 0.0, 5.0, 0.0, 5.0)) != 0)
  {
    return 0;
  }
  else
  {
    return -6729;
  }
}

+ (void)deallocImageCache
{
  qword_268148350 = 0;
  qword_268148358 = 0;
}

- (TopoProgressBar)initWithOwningView:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)TopoProgressBar;
  uint64_t v4 = [(TopoProgressBar *)&v11 init];
  uint64_t v6 = v4;
  if (v4)
  {
    objc_msgSend_setOwningView_(v4, v5, (uint64_t)a3);
    objc_msgSend_setNeedsDisplayOnBoundsChange_(v6, v7, 1);
    objc_msgSend_initImageCache(TopoProgressBar, v8, v9);
  }
  return v6;
}

- (void)setOwningView:(id)a3
{
  self->_owningView = a3;
  uint64_t v4 = objc_msgSend_mainScreen(MEMORY[0x263F1C920], a2, (uint64_t)a3);
  objc_msgSend_scale(v4, v5, v6);

  MEMORY[0x270F9A6D0](self, sel_setContentsScale_, v7);
}

- (id)owningView
{
  return self->_owningView;
}

- (CGSize)preferredFrameSize
{
  double v2 = *(double *)(MEMORY[0x263F001B0] + 8);
  if (self->_progressValue != 0.0) {
    double v2 = 12.0;
  }
  double v3 = 100.0;
  if (self->_progressValue == 0.0) {
    double v3 = *MEMORY[0x263F001B0];
  }
  result.height = v2;
  result.width = v3;
  return result;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)TopoProgressBar;
  [(TopoProgressBar *)&v2 dealloc];
}

- (void)setProgressValue:(float)a3
{
  if (self->_progressValue != a3)
  {
    double v4 = a3;
    if (v4 < 0.0) {
      double v4 = 0.0;
    }
    float v5 = fmin(v4, 1.0);
    self->_progressValue = v5;
    objc_msgSend_setNeedsLayout(self, a2, v3);
  }
}

- (void)layoutSublayers
{
  uint64_t v5 = objc_msgSend_composeProgressBar(self, a2, v2);

  objc_msgSend_setContents_(self, v4, v5);
}

- (CGImage)composeProgressBar
{
  objc_msgSend_bounds(self, a2, v2);
  if (CGRectIsEmpty(v29))
  {
    ImageFromCurrentImageContext = 0;
  }
  else
  {
    objc_msgSend_bounds(self, v4, v5);
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    objc_msgSend_scale((void *)qword_268148358, v11, v12);
    CGFloat v14 = v13;
    v28.width = v8;
    v28.height = v10;
    UIGraphicsBeginImageContextWithOptions(v28, 0, v14);
    v15 = (void *)qword_268148358;
    objc_msgSend_bounds(self, v16, v17);
    objc_msgSend_drawInRect_(v15, v18, v19);
    objc_msgSend_bounds(self, v20, v21);
    float v23 = (v22 + -2.0) * self->_progressValue;
    objc_msgSend_drawInRect_((void *)qword_268148350, v24, v25, 1.0, 1.0, roundf(v23), 9.0);
    ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
  }

  return (CGImage *)objc_msgSend_CGImage(ImageFromCurrentImageContext, v4, v5);
}

- (float)progressValue
{
  return self->_progressValue;
}

@end