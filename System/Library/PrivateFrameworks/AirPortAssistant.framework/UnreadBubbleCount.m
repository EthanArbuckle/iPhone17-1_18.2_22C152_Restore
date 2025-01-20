@interface UnreadBubbleCount
+ (int)initImageCache;
+ (void)deallocImageCache;
- (BOOL)isHighlighted;
- (BOOL)isSelected;
- (UnreadBubbleCount)initWithFrame:(CGRect)a3;
- (int64_t)count;
- (void)calculateTextMetrics;
- (void)dealloc;
- (void)drawRect:(CGRect)a3;
- (void)layoutSubviews;
- (void)setCount:(int64_t)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setIsSelected:(BOOL)a3;
@end

@implementation UnreadBubbleCount

+ (int)initImageCache
{
  if (qword_268148340) {
    return 0;
  }
  v3 = (void *)MEMORY[0x263F086E0];
  uint64_t v4 = objc_opt_class();
  uint64_t v6 = objc_msgSend_bundleForClass_(v3, v5, v4);
  qword_268148340 = (uint64_t)(id)objc_msgSend_imageNamed_inBundle_(ImageStore, v7, @"UnreadBubble", v6);
  if (!qword_268148340) {
    return -6729;
  }
  v8 = (void *)MEMORY[0x263F086E0];
  uint64_t v9 = objc_opt_class();
  uint64_t v11 = objc_msgSend_bundleForClass_(v8, v10, v9);
  qword_268148348 = (uint64_t)(id)objc_msgSend_imageNamed_inBundle_(ImageStore, v12, @"UnreadBubbleSelected", v11);
  if (qword_268148348) {
    return 0;
  }
  else {
    return -6729;
  }
}

+ (void)deallocImageCache
{
  qword_268148340 = 0;
  qword_268148348 = 0;
}

- (UnreadBubbleCount)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)UnreadBubbleCount;
  v5 = -[UnreadBubbleCount initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    objc_msgSend_initImageCache(UnreadBubbleCount, v3, v4);
    objc_msgSend_setOpaque_(v5, v6, 0);
  }
  return v5;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)UnreadBubbleCount;
  [(UnreadBubbleCount *)&v2 dealloc];
}

- (void)setCount:(int64_t)a3
{
  if (self->_count != a3)
  {
    self->_count = a3;
    objc_msgSend_calculateTextMetrics(self, a2, a3);
    objc_msgSend_setNeedsDisplay(self, v4, v5);
  }
}

- (void)setHighlighted:(BOOL)a3
{
}

- (BOOL)isHighlighted
{
  return self->_isSelected;
}

- (void)setIsSelected:(BOOL)a3
{
  if (self->_isSelected != a3)
  {
    self->_isSelected = a3;
    objc_msgSend_setNeedsDisplay(self, a2, a3);
  }
}

- (void)layoutSubviews
{
  v26.receiver = self;
  v26.super_class = (Class)UnreadBubbleCount;
  [(UnreadBubbleCount *)&v26 layoutSubviews];
  objc_msgSend_frame(self, v3, v4);
  double v6 = v5;
  double v8 = v7;
  objc_msgSend_frame(self, v9, v10);
  double MinX = CGRectGetMinX(v27);
  objc_msgSend_frame(self, v12, v13);
  double v15 = v14;
  objc_msgSend_frame(self, v16, v17);
  double v19 = v18;
  objc_msgSend_bounds(self, v20, v21);
  float v23 = (v19 - v22) * 0.5;
  objc_msgSend_setFrame_(self, v24, v25, MinX, v15 + roundf(v23), v6, v8);
}

- (void)drawRect:(CGRect)a3
{
  v58[2] = *MEMORY[0x263EF8340];
  if (self->_count >= 1)
  {
    if (self->_isSelected)
    {
      double v5 = objc_msgSend_resizableImageWithCapInsets_((void *)qword_268148348, a2, v3, 0.0, 9.0, 0.0, 9.0);
      CGFloat v6 = 0.122;
      CGFloat v7 = 0.357;
      CGFloat v8 = 0.906;
    }
    else
    {
      double v5 = objc_msgSend_resizableImageWithCapInsets_((void *)qword_268148340, a2, v3, 0.0, 9.0, 0.0, 9.0);
      CGFloat v6 = 1.0;
      CGFloat v7 = 1.0;
      CGFloat v8 = 1.0;
    }
    uint64_t v9 = sub_2268EF290(v6, v7, v8, 1.0);
    objc_msgSend_frame(self, v10, v11);
    double v13 = v12;
    objc_msgSend_frame(self, v14, v15);
    objc_msgSend_drawInRect_(v5, v16, v17, 0.0, 0.0, v13);
    v20 = objc_msgSend_boldSystemFontOfSize_(MEMORY[0x263F1C658], v18, v19, 17.0);
    double v22 = (void *)sub_22685D698(self->_count, v21);
    objc_msgSend_bounds(self, v23, v24);
    float v26 = (v25 - self->_textSize.height) * 0.5;
    float v27 = floorf(v26);
    objc_msgSend_leading(v20, v28, v29);
    double v31 = v30;
    objc_msgSend_ascender(v20, v32, v33);
    double v35 = v34;
    objc_msgSend_descender(v20, v36, v37);
    double v39 = v31 - (v35 - v38);
    objc_msgSend_ascender(v20, v40, v41);
    double v43 = v42;
    objc_msgSend_capHeight(v20, v44, v45);
    *(float *)&double v46 = v39 + v43 - v46;
    *(float *)&double v39 = v27 - floorf(*(float *)&v46);
    objc_msgSend_bounds(self, v47, v48);
    float v50 = (v49 - self->_textSize.width) * 0.5;
    double v51 = roundf(v50);
    v58[0] = v20;
    uint64_t v52 = *MEMORY[0x263F1C240];
    v57[0] = *MEMORY[0x263F1C238];
    v57[1] = v52;
    v58[1] = objc_msgSend_colorWithCGColor_(MEMORY[0x263F1C550], v53, (uint64_t)v9);
    uint64_t v55 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v54, (uint64_t)v58, v57, 2);
    objc_msgSend_drawAtPoint_withAttributes_(v22, v56, v55, v51, *(float *)&v39);
    CGColorRelease(v9);
  }
}

- (void)calculateTextMetrics
{
  v24[1] = *MEMORY[0x263EF8340];
  if (self->_count >= 1)
  {
    uint64_t v4 = objc_msgSend_boldSystemFontOfSize_(MEMORY[0x263F1C658], a2, v2, 17.0);
    CGFloat v6 = objc_msgSend_stringWithFormat_(NSString, v5, @"%u", self->_count);
    uint64_t v9 = objc_msgSend_length(v6, v7, v8);
    uint64_t v23 = *MEMORY[0x263F1C238];
    v24[0] = v4;
    uint64_t v11 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v10, (uint64_t)v24, &v23, 1);
    objc_msgSend_sizeWithAttributes_(v6, v12, v11);
    CGFloat v14 = v13;
    objc_msgSend_capHeight(v4, v15, v16);
    self->_textSize.width = v14;
    self->_textSize.height = v19;
    if (v9)
    {
      objc_msgSend_characterAtIndex_(v6, v17, 0);
      objc_msgSend_characterAtIndex_(v6, v20, v9 - 1);
    }
    objc_msgSend_size((void *)qword_268148340, v17, v18);
  }
  objc_msgSend_frame(self, a2, v2);
  objc_msgSend_setFrame_(self, v21, v22);
}

- (int64_t)count
{
  return self->_count;
}

- (BOOL)isSelected
{
  return self->_isSelected;
}

@end