@interface BubbleTextLayer
+ (BOOL)needsDisplayForKey:(id)a3;
- (BOOL)isAnnotationBubble;
- (BubbleTextLayer)initWithOwningView:(id)a3;
- (CALayer)rightAccessoryLayer;
- (CGImage)image;
- (CGRect)textFrame;
- (CGSize)boundsSizeConstraint;
- (CGSize)calculatePreferredSubframeSizes;
- (CGSize)getImagePreferredSize;
- (CGSize)getRightAccessoryLayerPreferredSize;
- (CGSize)preferredFrameSize;
- (CGSize)textPreferredFrameSizeForLayerSize:(CGSize)a3;
- (double)textBaselineOffset;
- (id)owningView;
- (void)addAnnotationPoint:(CGPoint)a3;
- (void)dealloc;
- (void)drawInContext:(CGContext *)a3;
- (void)layoutSublayers;
- (void)setBoundsSizeConstraint:(CGSize)a3;
- (void)setFont:(id)a3;
- (void)setImage:(CGImage *)a3;
- (void)setOwningView:(id)a3;
- (void)setRightAccessoryLayer:(id)a3;
@end

@implementation BubbleTextLayer

- (BubbleTextLayer)initWithOwningView:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)BubbleTextLayer;
  v4 = [(BubbleTextLayer *)&v17 init];
  v6 = v4;
  if (v4)
  {
    objc_msgSend_setOwningView_(v4, v5, (uint64_t)a3);
    objc_msgSend_setNeedsDisplayOnBoundsChange_(v6, v7, 1);
    v8 = sub_2268EF290(0.0, 0.0, 0.0, 0.0);
    objc_msgSend_setFillColor_(v6, v9, (uint64_t)v8);
    CGColorRelease(v8);
    if (sub_2269050C4(v10, v11, v12)) {
      CGColorRef v15 = 0;
    }
    else {
      CGColorRef v15 = sub_2268EF290(1.0, 1.0, 1.0, 1.0);
    }
    v6->_whiteShadowColor = v15;
    v6->_generalShadowColor = 0;
    objc_msgSend_setFontSize_(v6, v13, v14, 17.0);
  }
  return v6;
}

- (void)dealloc
{
  theLine = self->_theLine;
  if (theLine)
  {
    CFRelease(theLine);
    self->_theLine = 0;
  }
  curCTFont = self->_curCTFont;
  if (curCTFont)
  {
    CFRelease(curCTFont);
    self->_curCTFont = 0;
  }
  generalShadowColor = self->_generalShadowColor;
  if (generalShadowColor)
  {
    CFRelease(generalShadowColor);
    self->_generalShadowColor = 0;
  }
  whiteShadowColor = self->_whiteShadowColor;
  if (whiteShadowColor)
  {
    CFRelease(whiteShadowColor);
    self->_whiteShadowColor = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)BubbleTextLayer;
  [(BubbleTextLayer *)&v7 dealloc];
}

- (void)addAnnotationPoint:(CGPoint)a3
{
  CFDictionaryRef DictionaryRepresentation = CGPointCreateDictionaryRepresentation(a3);
  objc_msgSend_addObject_(self->_annotationPoints, v5, (uint64_t)DictionaryRepresentation);

  objc_msgSend_setNeedsLayout(self, v6, v7);
}

- (void)setOwningView:(id)a3
{
  self->_owningView = a3;
  v4 = objc_msgSend_mainScreen(MEMORY[0x263F1C920], a2, (uint64_t)a3);
  objc_msgSend_scale(v4, v5, v6);

  MEMORY[0x270F9A6D0](self, sel_setContentsScale_, v7);
}

- (id)owningView
{
  return self->_owningView;
}

- (CGImage)image
{
  result = (CGImage *)self->_leftImageLayer;
  if (result) {
    return (CGImage *)objc_msgSend_contents(result, a2, v2);
  }
  return result;
}

- (void)setImage:(CGImage *)a3
{
  if (!self->_leftImageLayer)
  {
    v5 = (CALayer *)objc_msgSend_layer(MEMORY[0x263F157E8], a2, (uint64_t)a3);
    self->_leftImageLayer = v5;
    objc_msgSend_addSublayer_(self, v6, (uint64_t)v5);
  }
  objc_msgSend_begin(MEMORY[0x263F158F8], a2, (uint64_t)a3);
  uint64_t v7 = (void *)MEMORY[0x263F158F8];
  uint64_t v10 = objc_msgSend_numberWithFloat_(NSNumber, v8, v9, 0.0);
  objc_msgSend_setValue_forKey_(v7, v11, v10, *MEMORY[0x263F15FC0]);
  objc_msgSend_setContents_(self->_leftImageLayer, v12, (uint64_t)a3);
  objc_msgSend_setNeedsLayout(self, v13, v14);
  uint64_t v16 = MEMORY[0x263F158F8];

  MEMORY[0x270F9A6D0](v16, sel_commit, v15);
}

- (CALayer)rightAccessoryLayer
{
  return self->_rightAccessoryLayer;
}

- (void)setRightAccessoryLayer:(id)a3
{
  if (a3 && self->_rightAccessoryLayer != a3) {
    objc_msgSend_addSublayer_(self, a2, (uint64_t)a3);
  }
  rightAccessoryLayer = self->_rightAccessoryLayer;
  if (rightAccessoryLayer) {
    BOOL v6 = rightAccessoryLayer == a3;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6) {
    objc_msgSend_removeFromSuperlayer(rightAccessoryLayer, a2, (uint64_t)a3);
  }
  self->_rightAccessoryLayer = (CALayer *)a3;

  objc_msgSend_setNeedsLayout(self, a2, (uint64_t)a3);
}

- (void)setFont:(id)a3
{
  if (dword_268147DB8 <= 800)
  {
    if (dword_268147DB8 != -1 || sub_226865630((uint64_t)&dword_268147DB8, 0x320u)) {
      sub_226865EB4((uint64_t)&dword_268147DB8, (uint64_t)"-[BubbleTextLayer setFont:]", 800, (uint64_t)"%@\n", v3, v4, v5, v6, (uint64_t)self);
    }
    if (dword_268147DB8 <= 800 && (dword_268147DB8 != -1 || sub_226865630((uint64_t)&dword_268147DB8, 0x320u))) {
      sub_226865EB4((uint64_t)&dword_268147DB8, (uint64_t)"-[BubbleTextLayer setFont:]", 800, (uint64_t)"%@\n", v3, v4, v5, v6, (uint64_t)a3);
    }
  }
  CFTypeID v9 = CFGetTypeID(a3);
  if (v9 == CGFontGetTypeID())
  {
    objc_msgSend_fontSize(self, v10, v11);
    v13 = CTFontCreateWithGraphicsFont((CGFontRef)a3, v12, 0, 0);
  }
  else if (v9 == CFStringGetTypeID())
  {
    objc_msgSend_fontSize(self, v16, v17);
    v13 = CTFontCreateWithName((CFStringRef)a3, v18, 0);
  }
  else
  {
    if (v9 != CTFontGetTypeID()) {
      return;
    }
    v13 = (__CTFont *)CFRetain(a3);
  }
  v19 = v13;
  if (v13)
  {
    curCTFont = self->_curCTFont;
    if (curCTFont) {
      CFRelease(curCTFont);
    }
    self->_curCTFont = v19;
    objc_msgSend_setNeedsLayout(self, v14, v15);
  }
}

- (void)setBoundsSizeConstraint:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  if (dword_268147DB8 <= 800 && (dword_268147DB8 != -1 || sub_226865630((uint64_t)&dword_268147DB8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147DB8, (uint64_t)"-[BubbleTextLayer setBoundsSizeConstraint:]", 800, (uint64_t)"%@  constraint = (w = %.2f h = %.2f)\n", v4, v5, v6, v7, (uint64_t)self);
  }
  self->_boundsSizeConstraint.CGFloat width = width;
  self->_boundsSizeConstraint.CGFloat height = height;

  objc_msgSend_layoutSublayers(self, a2, v3);
}

- (CGSize)boundsSizeConstraint
{
  double width = self->_boundsSizeConstraint.width;
  double height = self->_boundsSizeConstraint.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)getImagePreferredSize
{
  if (dword_268147DB8 <= 800 && (dword_268147DB8 != -1 || sub_226865630((uint64_t)&dword_268147DB8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147DB8, (uint64_t)"-[BubbleTextLayer getImagePreferredSize]", 800, (uint64_t)"%@\n", v3, v4, v5, v6, (uint64_t)self);
  }
  v8 = (CGImage *)objc_msgSend_contents(self->_leftImageLayer, a2, v2);
  if (v8)
  {
    v13 = v8;
    double Width = (double)CGImageGetWidth(v8);
    objc_msgSend_contentsScale(self, v15, v16);
    double v18 = Width / v17;
    double Height = (double)CGImageGetHeight(v13);
    objc_msgSend_contentsScale(self, v20, v21);
    double v23 = Height / v22;
  }
  else
  {
    double v18 = *MEMORY[0x263F001B0];
    double v23 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  if (dword_268147DB8 <= 800 && (dword_268147DB8 != -1 || sub_226865630((uint64_t)&dword_268147DB8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147DB8, (uint64_t)"-[BubbleTextLayer getImagePreferredSize]", 800, (uint64_t)"image layer size w = %.1f h = %.1f\n", v9, v10, v11, v12, *(uint64_t *)&v18);
  }
  double v24 = v18;
  double v25 = v23;
  result.double height = v25;
  result.double width = v24;
  return result;
}

- (CGSize)getRightAccessoryLayerPreferredSize
{
  rightAccessoryLayer = self->_rightAccessoryLayer;
  if (rightAccessoryLayer)
  {
    objc_msgSend_preferredFrameSize(rightAccessoryLayer, a2, v2);
  }
  else
  {
    double v4 = *MEMORY[0x263F001B0];
    double v5 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  result.double height = v5;
  result.double width = v4;
  return result;
}

- (BOOL)isAnnotationBubble
{
  annotationPoints = self->_annotationPoints;
  if (annotationPoints) {
    LOBYTE(annotationPoints) = objc_msgSend_count(annotationPoints, a2, v2) != 0;
  }
  return (char)annotationPoints;
}

- (CGSize)textPreferredFrameSizeForLayerSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  objc_msgSend_string(self, a2, v3);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v10 = (uint64_t *)MEMORY[0x263F039A0];
  uint64_t v11 = (void *)MEMORY[0x263F03C60];
  if (isKindOfClass)
  {
    theLine = self->_theLine;
    if (theLine) {
      CFRelease(theLine);
    }
    CFAttributedStringRef v13 = (const __CFAttributedString *)objc_msgSend_string(self, v8, v9);
    self->_theLine = CTLineCreateWithAttributedString(v13);
  }
  else
  {
    id v14 = objc_alloc(NSDictionary);
    curCTFont = self->_curCTFont;
    uint64_t v16 = *v10;
    uint64_t v19 = objc_msgSend_foregroundColor(self, v17, v18);
    CFDictionaryRef v21 = (const __CFDictionary *)objc_msgSend_initWithObjectsAndKeys_(v14, v20, (uint64_t)curCTFont, v16, v19, *v11, 0);
    CFStringRef v24 = (const __CFString *)objc_msgSend_string(self, v22, v23);
    CFAttributedStringRef v25 = CFAttributedStringCreate(0, v24, v21);
    v26 = self->_theLine;
    if (v26) {
      CFRelease(v26);
    }
    self->_theLine = CTLineCreateWithAttributedString(v25);
    CFRelease(v21);
    CFRelease(v25);
  }
  if (width == *MEMORY[0x263F001B0] && height == *(double *)(MEMORY[0x263F001B0] + 8))
  {
    TruncatedLine = self->_theLine;
  }
  else
  {
    id v28 = objc_alloc(NSDictionary);
    v29 = self->_curCTFont;
    uint64_t v30 = *v10;
    uint64_t v33 = objc_msgSend_foregroundColor(self, v31, v32);
    CFDictionaryRef v35 = (const __CFDictionary *)objc_msgSend_initWithObjectsAndKeys_(v28, v34, (uint64_t)v29, v30, v33, *v11, 0);
    CFAttributedStringRef v36 = CFAttributedStringCreate(0, @"…", v35);
    v37 = CTLineCreateWithAttributedString(v36);
    TruncatedLine = CTLineCreateTruncatedLine(self->_theLine, width, kCTLineTruncationMiddle, v37);
    if (v35) {
      CFRelease(v35);
    }
    if (v36) {
      CFRelease(v36);
    }
    if (v37) {
      CFRelease(v37);
    }
    v39 = self->_theLine;
    if (v39) {
      CFRelease(v39);
    }
    self->_theLine = TruncatedLine;
  }
  float TypographicBounds = CTLineGetTypographicBounds(TruncatedLine, &self->_ascent, &self->_descent, &self->_leading);
  *(double *)&uint64_t v45 = ceilf(TypographicBounds);
  float v46 = self->_ascent + self->_descent;
  double v47 = ceilf(v46);
  if (dword_268147DB8 <= 800 && (dword_268147DB8 != -1 || sub_226865630((uint64_t)&dword_268147DB8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147DB8, (uint64_t)"-[BubbleTextLayer textPreferredFrameSizeForLayerSize:]", 800, (uint64_t)"width = %.2f  double height = %.2f  ascent = %.2f  descent = %.2f  leading = %.2f\n", v40, v41, v42, v43, v45);
  }
  double v48 = *(double *)&v45;
  double v49 = v47;
  result.double height = v49;
  result.double width = v48;
  return result;
}

- (CGSize)calculatePreferredSubframeSizes
{
  if (dword_268147DB8 <= 800 && (dword_268147DB8 != -1 || sub_226865630((uint64_t)&dword_268147DB8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147DB8, (uint64_t)"-[BubbleTextLayer calculatePreferredSubframeSizes]", 800, (uint64_t)"\n", v3, v4, v5, v6, v47);
  }
  objc_msgSend_boundsSizeConstraint(self, a2, v2);
  double v9 = v8;
  double v11 = v10;
  p_leftImageLayerSize = (uint64_t *)&self->_leftImageLayerSize;
  objc_msgSend_getImagePreferredSize(self, v13, v14);
  self->_leftImageLayerSize.double width = v15;
  self->_leftImageLayerSize.double height = v16;
  p_rightAccessoryLayerSize = (uint64_t *)&self->_rightAccessoryLayerSize;
  objc_msgSend_getRightAccessoryLayerPreferredSize(self, v18, v19);
  self->_rightAccessoryLayerSize.double width = v22;
  self->_rightAccessoryLayerSize.double height = v23;
  if (v9 != *MEMORY[0x263F001B0] || v11 != *(double *)(MEMORY[0x263F001B0] + 8))
  {
    if (self->_leftImageLayer) {
      double v9 = v9 - (*(double *)p_leftImageLayerSize + 7.0);
    }
    double v25 = v22 + 7.0;
    if (!self->_rightAccessoryLayer) {
      double v25 = 0.0;
    }
    double v9 = v9 - v25 + -16.0;
  }
  p_textSize = &self->_textSize;
  objc_msgSend_textPreferredFrameSizeForLayerSize_(self, v20, v21, v9, v11);
  self->_textSize.double width = width;
  self->_textSize.double height = v34;
  if (dword_268147DB8 <= 800)
  {
    if (dword_268147DB8 == -1)
    {
      if (!sub_226865630((uint64_t)&dword_268147DB8, 0x320u)) {
        goto LABEL_19;
      }
      double width = p_textSize->width;
    }
    sub_226865EB4((uint64_t)&dword_268147DB8, (uint64_t)"-[BubbleTextLayer calculatePreferredSubframeSizes]", 800, (uint64_t)"text area size w = %.1f h = %.1f\n", v29, v30, v31, v32, *(uint64_t *)&width);
LABEL_19:
    if (dword_268147DB8 <= 800)
    {
      if (dword_268147DB8 != -1 || sub_226865630((uint64_t)&dword_268147DB8, 0x320u)) {
        sub_226865EB4((uint64_t)&dword_268147DB8, (uint64_t)"-[BubbleTextLayer calculatePreferredSubframeSizes]", 800, (uint64_t)"image layer size w = %.1f h = %.1f\n", v29, v30, v31, v32, *p_leftImageLayerSize);
      }
      if (dword_268147DB8 <= 800 && (dword_268147DB8 != -1 || sub_226865630((uint64_t)&dword_268147DB8, 0x320u))) {
        sub_226865EB4((uint64_t)&dword_268147DB8, (uint64_t)"-[BubbleTextLayer calculatePreferredSubframeSizes]", 800, (uint64_t)"right accessory layer size w = %.1f h = %.1f\n", v29, v30, v31, v32, *p_rightAccessoryLayerSize);
      }
    }
  }
  double v35 = p_textSize->width;
  if (self->_leftImageLayer) {
    double v35 = v35 + *(double *)p_leftImageLayerSize + 7.0;
  }
  if (self->_rightAccessoryLayer) {
    double v35 = v35 + *(double *)p_rightAccessoryLayerSize + 7.0;
  }
  double height = self->_textSize.height;
  self->_contentSize.double width = v35;
  self->_contentSize.double height = height;
  double v37 = height + 12.0;
  double v38 = v35 + 16.0;
  if (objc_msgSend_isAnnotationBubble(self, v27, v28)) {
    double v37 = v37 + 16.0;
  }
  if (dword_268147DB8 <= 800 && (dword_268147DB8 != -1 || sub_226865630((uint64_t)&dword_268147DB8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147DB8, (uint64_t)"-[BubbleTextLayer calculatePreferredSubframeSizes]", 800, (uint64_t)"final bubble size w = %.1f h = %.1f\n", v39, v40, v41, v42, *(uint64_t *)&v38);
  }
  self->_bubbleSize.double width = v38;
  self->_bubbleSize.double height = v37;
  float v43 = v37 + 4.0;
  double v44 = ceilf(v43);
  float v45 = v38 + 2.0;
  double v46 = ceilf(v45);
  result.double height = v44;
  result.double width = v46;
  return result;
}

- (CGSize)preferredFrameSize
{
  if (dword_268147DB8 <= 800 && (dword_268147DB8 != -1 || sub_226865630((uint64_t)&dword_268147DB8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147DB8, (uint64_t)"-[BubbleTextLayer preferredFrameSize]", 800, (uint64_t)"\n", v3, v4, v5, v6, v10);
  }

  objc_msgSend_calculatePreferredSubframeSizes(self, a2, v2);
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (CGRect)textFrame
{
  double x = self->_textFrame.origin.x;
  double y = self->_textFrame.origin.y;
  double width = self->_textFrame.size.width;
  double height = self->_textFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)textBaselineOffset
{
  double result = 0.0;
  if (self->_textSize.width != *MEMORY[0x263F001B0] || self->_textSize.height != *(double *)(MEMORY[0x263F001B0] + 8))
  {
    if (dword_268147DB8 <= 800 && (dword_268147DB8 != -1 || sub_226865630((uint64_t)&dword_268147DB8, 0x320u))) {
      sub_226865EB4((uint64_t)&dword_268147DB8, (uint64_t)"-[BubbleTextLayer textBaselineOffset]", 800, (uint64_t)"returning %.2f\n", v2, v3, v4, v5, *(void *)&self->_ascent);
    }
    return self->_ascent;
  }
  return result;
}

- (void)layoutSublayers
{
  if (dword_268147DB8 <= 800)
  {
    if (dword_268147DB8 != -1 || sub_226865630((uint64_t)&dword_268147DB8, 0x320u)) {
      sub_226865EB4((uint64_t)&dword_268147DB8, (uint64_t)"-[BubbleTextLayer layoutSublayers]", 800, (uint64_t)"%@\n", v3, v4, v5, v6, (uint64_t)self);
    }
    if (dword_268147DB8 <= 800)
    {
      if (dword_268147DB8 != -1 || sub_226865630((uint64_t)&dword_268147DB8, 0x320u))
      {
        objc_msgSend_frame(self, a2, v2);
        uint64_t v9 = v8;
        objc_msgSend_frame(self, v10, v11);
        objc_msgSend_frame(self, v12, v13);
        objc_msgSend_frame(self, v14, v15);
        sub_226865EB4((uint64_t)&dword_268147DB8, (uint64_t)"-[BubbleTextLayer layoutSublayers]", 800, (uint64_t)"bubble layer frame=(double x = %.1f, y = %.1f, w = %.1f, h = %.1f)\n", v16, v17, v18, v19, v9);
      }
      if (dword_268147DB8 <= 800 && (dword_268147DB8 != -1 || sub_226865630((uint64_t)&dword_268147DB8, 0x320u)))
      {
        objc_msgSend_boundsSizeConstraint(self, a2, v2);
        uint64_t v21 = v20;
        objc_msgSend_boundsSizeConstraint(self, v22, v23);
        sub_226865EB4((uint64_t)&dword_268147DB8, (uint64_t)"-[BubbleTextLayer layoutSublayers]", 800, (uint64_t)"constraint = (w = %.2f h = %.2f)\n", v24, v25, v26, v27, v21);
      }
    }
  }
  objc_msgSend_frame(self, a2, v2);
  if (v31 != *MEMORY[0x263F001B0] || v30 != *(double *)(MEMORY[0x263F001B0] + 8))
  {
    objc_msgSend_calculatePreferredSubframeSizes(self, v28, v29);
    objc_msgSend_bounds(self, v33, v34);
    double v36 = v35;
    objc_msgSend_bounds(self, v37, v38);
    self->_bubbleFrame.origin.double y = 0.0;
    CGSize bubbleSize = self->_bubbleSize;
    self->_bubbleFrame.origin.double x = ceil(v36 + (v40 - bubbleSize.width) * 0.5);
    self->_bubbleFrame.size = bubbleSize;
    objc_msgSend_bounds(self, v41, v42);
    float v46 = (v45 - self->_contentSize.width) * 0.5;
    double v47 = floorf(v46);
    p_textFrame = (uint64_t *)&self->_textFrame;
    self->_textFrame.origin.double x = v47;
    if (self->_leftImageLayer) {
      *(double *)p_textFrame = self->_leftImageLayerSize.width + 7.0 + -1.0 + v47;
    }
    objc_msgSend_bounds(self, v43, v44);
    double v50 = v49 - self->_ascent;
    objc_msgSend_bounds(self, v51, v52);
    CGFloat width = self->_textSize.width;
    double height = self->_textSize.height;
    float v62 = v50 + (v61 - height) * -0.5;
    self->_textFrame.origin.double y = ceilf(v62);
    self->_textFrame.size.CGFloat width = width;
    self->_textFrame.size.double height = height;
    if (dword_268147DB8 <= 800 && (dword_268147DB8 != -1 || sub_226865630((uint64_t)&dword_268147DB8, 0x320u))) {
      sub_226865EB4((uint64_t)&dword_268147DB8, (uint64_t)"-[BubbleTextLayer layoutSublayers]", 800, (uint64_t)"_textFrame placed at frame=(double x = %.1f, y = %.1f, w = %.1f, h = %.1f)\n", v55, v56, v57, v58, *p_textFrame);
    }
    if (self->_leftImageLayer)
    {
      objc_msgSend_bounds(self, v53, v54);
      float v64 = (v63 - self->_contentSize.width) * 0.5;
      *(double *)&uint64_t v65 = ceilf(v64);
      float v66 = (self->_bubbleSize.height - self->_leftImageLayerSize.height) * 0.5;
      objc_msgSend_setFrame_(self->_leftImageLayer, v67, v68, *(double *)&v65, ceilf(v66), self->_leftImageLayerSize.width, self->_leftImageLayerSize.height);
      if (dword_268147DB8 <= 800 && (dword_268147DB8 != -1 || sub_226865630((uint64_t)&dword_268147DB8, 0x320u))) {
        sub_226865EB4((uint64_t)&dword_268147DB8, (uint64_t)"-[BubbleTextLayer layoutSublayers]", 800, (uint64_t)"_leftImageLayer placed at frame=(double x = %.1f, y = %.1f, w = %.1f, h = %.1f)\n", v69, v70, v71, v72, v65);
      }
    }
    if (self->_rightAccessoryLayer)
    {
      *(void *)&v84.origin.double x = *p_textFrame;
      v84.origin.double y = self->_textFrame.origin.y;
      v84.size.CGFloat width = self->_textFrame.size.width;
      v84.size.double height = self->_textFrame.size.height;
      double v73 = CGRectGetMaxX(v84) + 7.0;
      objc_msgSend_bounds(self, v74, v75);
      CGFloat MaxY = CGRectGetMaxY(v85);
      objc_msgSend_setFrame_(self->_rightAccessoryLayer, v77, v78, v73, MaxY - self->_rightAccessoryLayerSize.height, self->_rightAccessoryLayerSize.width, self->_rightAccessoryLayerSize.height);
      if (dword_268147DB8 <= 800 && (dword_268147DB8 != -1 || sub_226865630((uint64_t)&dword_268147DB8, 0x320u))) {
        sub_226865EB4((uint64_t)&dword_268147DB8, (uint64_t)"-[BubbleTextLayer layoutSublayers]", 800, (uint64_t)"_rightAccessoryLayer placed at frame=(double x = %.1f, y = %.1f, w = %.1f, h = %.1f)\n", v79, v80, v81, v82, *(uint64_t *)&v73);
      }
    }
    objc_msgSend_setNeedsDisplay(self, v53, v54);
  }
}

- (void)drawInContext:(CGContext *)a3
{
  if (dword_268147DB8 <= 800 && (dword_268147DB8 != -1 || sub_226865630((uint64_t)&dword_268147DB8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147DB8, (uint64_t)"-[BubbleTextLayer drawInContext:]", 800, (uint64_t)"\n", v3, v4, v5, v6, v47);
  }
  CGContextSaveGState(a3);
  if (objc_msgSend_isAnnotationBubble(self, v9, v10)) {
    sub_2268EF474(a3, self->_bubbleFrame.origin.x, self->_bubbleFrame.origin.y, self->_bubbleFrame.size.width, self->_bubbleFrame.size.height, self->_bubbleFrame.size.height * 0.5, 16.0);
  }
  else {
    sub_2268EF690(a3, self->_bubbleFrame.origin.x, self->_bubbleFrame.origin.y, self->_bubbleFrame.size.width, self->_bubbleFrame.size.height, self->_bubbleFrame.size.height * 0.5);
  }
  CGContextClosePath(a3);
  generalShadowColor = self->_generalShadowColor;
  if (generalShadowColor)
  {
    v48.CGFloat width = 0.0;
    v48.double height = 1.0;
    CGContextSetShadowWithColor(a3, v48, 1.0, generalShadowColor);
  }
  p_bubbleFrame = &self->_bubbleFrame;
  CGContextBeginTransparencyLayerWithRect(a3, self->_bubbleFrame, 0);
  if (objc_msgSend_fillColor(self, v13, v14) && objc_msgSend_fillColor2(self, v15, v16))
  {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    uint64_t v18 = (void *)MEMORY[0x263EFF8C0];
    uint64_t v21 = objc_msgSend_fillColor(self, v19, v20);
    uint64_t v24 = objc_msgSend_fillColor2(self, v22, v23);
    CFArrayRef v26 = (const __CFArray *)objc_msgSend_arrayWithObjects_(v18, v25, v21, v24, 0);
    uint64_t v27 = CGGradientCreateWithColors(DeviceRGB, v26, 0);
    CGContextClip(a3);
    v55.origin.double x = p_bubbleFrame->origin.x;
    v55.origin.double y = self->_bubbleFrame.origin.y;
    v55.size.CGFloat width = self->_bubbleFrame.size.width;
    v55.size.double height = self->_bubbleFrame.size.height;
    CGFloat MidX = CGRectGetMidX(v55);
    v56.origin.double x = p_bubbleFrame->origin.x;
    v56.origin.double y = self->_bubbleFrame.origin.y;
    v56.size.CGFloat width = self->_bubbleFrame.size.width;
    v56.size.double height = self->_bubbleFrame.size.height;
    CGFloat v29 = CGRectGetMidX(v56);
    v57.origin.double x = p_bubbleFrame->origin.x;
    v57.origin.double y = self->_bubbleFrame.origin.y;
    v57.size.CGFloat width = self->_bubbleFrame.size.width;
    v57.size.double height = self->_bubbleFrame.size.height;
    v54.double y = CGRectGetMaxY(v57);
    v49.double y = 0.0;
    v49.double x = MidX;
    v54.double x = v29;
    CGContextDrawLinearGradient(a3, v27, v49, v54, 0);
    CGGradientRelease(v27);
    CGColorSpaceRelease(DeviceRGB);
  }
  else
  {
    double v30 = (CGColor *)objc_msgSend_fillColor(self, v15, v16);
    CGContextSetFillColorWithColor(a3, v30);
    CGContextDrawPath(a3, kCGPathFill);
  }
  CGContextEndTransparencyLayer(a3);
  v50.CGFloat width = 0.0;
  v50.double height = 0.0;
  CGContextSetShadowWithColor(a3, v50, 0.0, 0);
  objc_msgSend_frameWidth(self, v31, v32);
  if (v35 != 0.0 && objc_msgSend_frameColor(self, v33, v34))
  {
    objc_msgSend_frameWidth(self, v36, v37);
    CGContextSetLineWidth(a3, v38);
    uint64_t v41 = (CGColor *)objc_msgSend_frameColor(self, v39, v40);
    CGContextSetStrokeColorWithColor(a3, v41);
    CGContextDrawPath(a3, kCGPathStroke);
  }
  CGContextSetShouldSmoothFonts(a3, 0);
  CGContextSetAllowsFontSmoothing(a3, 0);
  CGContextSetTextPosition(a3, self->_textFrame.origin.x, self->_textFrame.origin.y);
  objc_msgSend_bounds(self, v42, v43);
  CGContextTranslateCTM(a3, 0.0, v44);
  CGContextScaleCTM(a3, 1.0, -1.0);
  double v45 = self->_generalShadowColor;
  if (v45)
  {
    v51.CGFloat width = 0.0;
    v51.double height = -1.0;
    CGContextSetShadowWithColor(a3, v51, 1.0, v45);
  }
  whiteShadowColor = self->_whiteShadowColor;
  if (whiteShadowColor)
  {
    v52.CGFloat width = 0.0;
    v52.double height = 1.0;
    CGContextSetShadowWithColor(a3, v52, 0.0, whiteShadowColor);
  }
  CTLineDraw(self->_theLine, a3);
  v53.CGFloat width = 0.0;
  v53.double height = 0.0;
  CGContextSetShadowWithColor(a3, v53, 0.0, 0);
  CGContextRestoreGState(a3);
}

+ (BOOL)needsDisplayForKey:(id)a3
{
  if ((objc_msgSend_isEqualToString_(a3, a2, @"foregroundColor") & 1) != 0
    || (objc_msgSend_isEqualToString_(a3, v5, @"fillColor") & 1) != 0
    || (objc_msgSend_isEqualToString_(a3, v6, @"fillColor2") & 1) != 0
    || (objc_msgSend_isEqualToString_(a3, v7, @"frameColor") & 1) != 0
    || (objc_msgSend_isEqualToString_(a3, v8, @"frameWidth") & 1) != 0
    || (objc_msgSend_isEqualToString_(a3, v9, @"fontSize") & 1) != 0
    || (objc_msgSend_isEqualToString_(a3, v10, @"string") & 1) != 0)
  {
    return 1;
  }
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___BubbleTextLayer;
  return objc_msgSendSuper2(&v12, sel_needsDisplayForKey_, a3);
}

@end