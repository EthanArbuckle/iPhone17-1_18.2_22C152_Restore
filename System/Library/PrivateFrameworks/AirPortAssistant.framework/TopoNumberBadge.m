@interface TopoNumberBadge
+ (id)imageBadgeForCount:(int64_t)a3;
+ (int)initImageCache;
+ (void)deallocImageCache;
- (CGImage)newNumberBadge;
- (CGSize)preferredFrameSize;
- (TopoNumberBadge)initWithOwningView:(id)a3;
- (id)owningView;
- (int64_t)count;
- (void)calculateBadgeMetrics;
- (void)dealloc;
- (void)layoutSublayers;
- (void)setCount:(int64_t)a3;
- (void)setOwningView:(id)a3;
@end

@implementation TopoNumberBadge

+ (int)initImageCache
{
  if (qword_268148360) {
    return 0;
  }
  v3 = (void *)MEMORY[0x263F086E0];
  uint64_t v4 = objc_opt_class();
  uint64_t v6 = objc_msgSend_bundleForClass_(v3, v5, v4);
  v8 = objc_msgSend_imageNamed_inBundle_(ImageStore, v7, @"TopoBadgeBG", v6);
  if (v8
    && (qword_268148360 = (uint64_t)(id)objc_msgSend_resizableImageWithCapInsets_(v8, v9, v10, 0.0, 14.0, 0.0, 14.0)) != 0)
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
  qword_268148360 = 0;
}

- (TopoNumberBadge)initWithOwningView:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)TopoNumberBadge;
  uint64_t v4 = [(TopoNumberBadge *)&v15 init];
  uint64_t v6 = v4;
  if (v4)
  {
    objc_msgSend_setOwningView_(v4, v5, (uint64_t)a3);
    v9 = (UIFont *)objc_msgSend_boldSystemFontOfSize_(MEMORY[0x263F1C658], v7, v8, 17.0);
    v6->_font = v9;
    uint64_t v10 = v9;
    objc_msgSend_setNeedsDisplayOnBoundsChange_(v6, v11, 1);
    objc_msgSend_initImageCache(TopoNumberBadge, v12, v13);
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
  double width = self->_imageSize.width;
  double height = self->_imageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)dealloc
{
  font = self->_font;
  if (font) {

  }
  self->_font = 0;
  v4.receiver = self;
  v4.super_class = (Class)TopoNumberBadge;
  [(TopoNumberBadge *)&v4 dealloc];
}

- (void)setCount:(int64_t)a3
{
  if (self->_count != a3)
  {
    self->_count = a3;
    MEMORY[0x270F9A6D0](self, sel_calculateBadgeMetrics, a3);
  }
}

- (void)layoutSublayers
{
  objc_super v4 = (CGImage *)objc_msgSend_newNumberBadge(self, a2, v2);
  objc_msgSend_setContents_(self, v5, (uint64_t)v4);

  CGImageRelease(v4);
}

- (void)calculateBadgeMetrics
{
  v28[1] = *MEMORY[0x263EF8340];
  int64_t count = self->_count;
  if (count < 1)
  {
    _Q0 = (CGSize)*MEMORY[0x263F001B0];
  }
  else
  {
    v5 = (void *)sub_22685D698(count, a2);
    uint64_t v8 = objc_msgSend_length(v5, v6, v7);
    font = self->_font;
    uint64_t v27 = *MEMORY[0x263F1C238];
    v28[0] = font;
    uint64_t v11 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v10, (uint64_t)v28, &v27, 1);
    objc_msgSend_sizeWithAttributes_(v5, v12, v11);
    double v14 = v13;
    objc_msgSend_capHeight(self->_font, v15, v16);
    self->_textSize.double width = v14;
    self->_textSize.double height = v17;
    if (v8)
    {
      if (objc_msgSend_characterAtIndex_(v5, a2, 0) == 49) {
        double v14 = v14 + 1.0;
      }
      if (objc_msgSend_characterAtIndex_(v5, v18, v8 - 1) == 49) {
        double v14 = v14 + -1.0;
      }
    }
    float v19 = v14 + 20.0;
    float v20 = floorf(v19);
    if (v20 <= 23.0) {
      float v20 = 23.0;
    }
    CGFloat v21 = v20;
    __asm { FMOV            V0.2D, #31.0 }
    _Q0.double width = v21;
  }
  self->_imageSize = _Q0;
  objc_msgSend_setNeedsLayout(self, a2, v2);
}

+ (id)imageBadgeForCount:(int64_t)a3
{
  v3 = (void *)a3;
  if (a3)
  {
    objc_super v4 = objc_alloc_init(TopoNumberBadge);
    uint64_t v6 = v4;
    if (v4)
    {
      objc_msgSend_setCount_(v4, v5, (uint64_t)v3);
      double v7 = *MEMORY[0x263F00148];
      double v8 = *(double *)(MEMORY[0x263F00148] + 8);
      objc_msgSend_preferredFrameSize(v6, v9, v10);
      objc_msgSend_setFrame_(v6, v11, v12, v7, v8, v13, v14);
      CGFloat v17 = (CGImage *)objc_msgSend_newNumberBadge(v6, v15, v16);
      v3 = objc_msgSend_imageWithCGImage_(MEMORY[0x263F1C6B0], v18, (uint64_t)v17);
      CGImageRelease(v17);
    }
    else
    {
      v3 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v3;
}

- (CGImage)newNumberBadge
{
  v63[2] = *MEMORY[0x263EF8340];
  objc_msgSend_bounds(self, a2, v2);
  if (CGRectIsEmpty(v65)) {
    return 0;
  }
  objc_msgSend_bounds(self, v4, v5);
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  objc_msgSend_scale((void *)qword_268148360, v11, v12);
  CGFloat v14 = v13;
  v64.double width = v8;
  v64.double height = v10;
  UIGraphicsBeginImageContextWithOptions(v64, 0, v14);
  objc_super v15 = (void *)qword_268148360;
  objc_msgSend_bounds(self, v16, v17);
  objc_msgSend_drawInRect_(v15, v18, v19);
  CGFloat v21 = (void *)sub_22685D698(self->_count, v20);
  objc_msgSend_bounds(self, v22, v23);
  float v25 = (v24 - self->_textSize.height) * 0.5 + -4.0;
  float v26 = floorf(v25);
  objc_msgSend_leading(self->_font, v27, v28);
  double v30 = v29;
  objc_msgSend_ascender(self->_font, v31, v32);
  double v34 = v33;
  objc_msgSend_descender(self->_font, v35, v36);
  double v38 = v30 - (v34 - v37);
  objc_msgSend_ascender(self->_font, v39, v40);
  double v42 = v41;
  objc_msgSend_capHeight(self->_font, v43, v44);
  *(float *)&double v45 = v38 + v42 - v45;
  *(float *)&double v38 = v26 - floorf(*(float *)&v45);
  objc_msgSend_bounds(self, v46, v47);
  float v49 = (v48 - self->_textSize.width) * 0.5;
  double v50 = roundf(v49);
  font = self->_font;
  uint64_t v52 = *MEMORY[0x263F1C240];
  v62[0] = *MEMORY[0x263F1C238];
  v62[1] = v52;
  v63[0] = font;
  v63[1] = objc_msgSend_whiteColor(MEMORY[0x263F1C550], v53, v54);
  uint64_t v56 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v55, (uint64_t)v63, v62, 2);
  objc_msgSend_drawAtPoint_withAttributes_(v21, v57, v56, v50, *(float *)&v38);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  if (ImageFromCurrentImageContext)
  {
    v60 = (CGImage *)objc_msgSend_CGImage(ImageFromCurrentImageContext, v58, v59);
    ImageFromCurrentImageContext = (UIImage *)v60;
    if (v60) {
      CGImageRetain(v60);
    }
  }
  return (CGImage *)ImageFromCurrentImageContext;
}

- (int64_t)count
{
  return self->_count;
}

@end