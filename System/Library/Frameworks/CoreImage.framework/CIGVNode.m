@interface CIGVNode
+ (__CFDictionary)textAttributesForLabel;
+ (__CFDictionary)textAttributesForTitle;
- (CGRect)badgeFrame;
- (CGRect)contentFrame;
- (CGRect)extent;
- (CGRect)imagesFrame;
- (CGRect)labelFrame;
- (CGRect)roisFrame;
- (CGRect)titleFrame;
- (CGSize)contentCornerSize;
- (CGSize)contentInsertSize;
- (CIGVNode)init;
- (CIGVNode)initWithCINode:(void *)a3 extent:(CGRect)a4;
- (__CFArray)images;
- (__CFArray)rois;
- (__CFString)label;
- (__CFString)title;
- (id)description;
- (int)color;
- (int)shape;
- (void)addImage:(CGImage *)a3;
- (void)addRoi:(CGRect)a3;
- (void)contentCornerSize;
- (void)contentInsertSize;
- (void)dealloc;
- (void)setColor:(int)a3;
- (void)setLabel:(__CFString *)a3;
- (void)setShape:(int)a3;
- (void)setTitle:(__CFString *)a3;
- (void)updateBadgeSize;
- (void)updateContentSize;
- (void)updateSize;
@end

@implementation CIGVNode

+ (__CFDictionary)textAttributesForTitle
{
  if (textAttributesForTitle_onceToken != -1) {
    dispatch_once(&textAttributesForTitle_onceToken, &__block_literal_global_31);
  }
  return (__CFDictionary *)textAttributesForTitle_attributes;
}

void __34__CIGVNode_textAttributesForTitle__block_invoke()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  CTFontRef UIFontForLanguage = CTFontCreateUIFontForLanguage(kCTFontUIFontUserFixedPitch, 12.0, 0);
  char v3 = 2;
  settings.spec = kCTParagraphStyleSpecifierAlignment;
  settings.valueSize = 1;
  settings.value = &v3;
  CTParagraphStyleRef v1 = CTParagraphStyleCreate(&settings, 1uLL);
  uint64_t v2 = *MEMORY[0x1E4F24790];
  v4[0] = *MEMORY[0x1E4F243F0];
  v4[1] = v2;
  v5[0] = UIFontForLanguage;
  v5[1] = v1;
  textAttributesForTitle_attributes = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];
  CFRetain((CFTypeRef)textAttributesForTitle_attributes);
  CFRelease(v1);
  CFRelease(UIFontForLanguage);
}

+ (__CFDictionary)textAttributesForLabel
{
  if (textAttributesForLabel_onceToken != -1) {
    dispatch_once(&textAttributesForLabel_onceToken, &__block_literal_global_2);
  }
  return (__CFDictionary *)textAttributesForLabel_attributes;
}

void __34__CIGVNode_textAttributesForLabel__block_invoke()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  CTFontRef UIFontForLanguage = CTFontCreateUIFontForLanguage(kCTFontUIFontUserFixedPitch, 12.0, 0);
  uint64_t v3 = 0x3FF4000000000000;
  settings.spec = kCTParagraphStyleSpecifierLineHeightMultiple;
  settings.valueSize = 8;
  settings.value = &v3;
  CTParagraphStyleRef v1 = CTParagraphStyleCreate(&settings, 1uLL);
  uint64_t v2 = *MEMORY[0x1E4F24790];
  v4[0] = *MEMORY[0x1E4F243F0];
  v4[1] = v2;
  v5[0] = UIFontForLanguage;
  v5[1] = v1;
  textAttributesForLabel_attributes = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];
  CFRetain((CFTypeRef)textAttributesForLabel_attributes);
  CFRelease(v1);
  CFRelease(UIFontForLanguage);
}

- (CIGVNode)init
{
  v6.receiver = self;
  v6.super_class = (Class)CIGVNode;
  uint64_t v2 = [(GVNode *)&v6 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->color = 0;
    v2->shape = 0;
    v2->images = (NSMutableArray *)[MEMORY[0x1E4F1CA48] array];
    v3->rois = (NSMutableArray *)[MEMORY[0x1E4F1CA48] array];
    CGSize v4 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    v3->extent.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    v3->extent.size = v4;
  }
  return v3;
}

- (CIGVNode)initWithCINode:(void *)a3 extent:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  v8 = [(CIGVNode *)self init];
  v9 = v8;
  if (v8)
  {
    p_extent = &v8->extent;
    CGAffineTransform v13 = *(CGAffineTransform *)contentScale;
    v14.origin.CGFloat x = x;
    v14.origin.CGFloat y = y;
    v14.size.CGFloat width = width;
    v14.size.CGFloat height = height;
    CGRect v15 = CGRectApplyAffineTransform(v14, &v13);
    CGRect *p_extent = v15;
    if (CGRectIsInfinite(v15))
    {
      CGSize v11 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
      p_extent->origin = (CGPoint)*MEMORY[0x1E4F1DB20];
      v9->extent.size = v11;
    }
  }
  return v9;
}

- (void)dealloc
{
  title = self->title;
  if (title) {
    CFRelease(title);
  }
  label = self->label;
  if (label) {
    CFRelease(label);
  }
  v5.receiver = self;
  v5.super_class = (Class)CIGVNode;
  [(GVNode *)&v5 dealloc];
}

- (CGRect)extent
{
  double x = self->extent.origin.x;
  double y = self->extent.origin.y;
  double width = self->extent.size.width;
  double height = self->extent.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (__CFArray)images
{
  return (__CFArray *)self->images;
}

- (__CFArray)rois
{
  return (__CFArray *)self->rois;
}

- (void)setShape:(int)a3
{
  self->shape = a3;
  [(CIGVNode *)self updateSize];
}

- (void)setColor:(int)a3
{
  self->color = a3;
}

- (void)setTitle:(__CFString *)a3
{
  title = self->title;
  if (title) {
    CFRelease(title);
  }
  objc_super v6 = (__CFString *)CFRetain(a3);
  self->title = v6;
  self->titleSize.double width = sizeForStringWithAttributes(v6, +[CIGVNode textAttributesForTitle]);
  self->titleSize.double height = v7;

  [(CIGVNode *)self updateBadgeSize];
}

- (void)setLabel:(__CFString *)a3
{
  label = self->label;
  if (label) {
    CFRelease(label);
  }
  objc_super v6 = (__CFString *)CFRetain(a3);
  self->label = v6;
  self->labelSize.double width = sizeForStringWithAttributes(v6, +[CIGVNode textAttributesForLabel]);
  self->labelSize.double height = v7;

  [(CIGVNode *)self updateContentSize];
}

- (void)addImage:(CGImage *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    -[NSMutableArray addObject:](self->images, "addObject:");
    images = self->images;
    double v6 = *MEMORY[0x1E4F1DB30];
    double v5 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v7 = [(NSMutableArray *)images countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(images);
          }
          CGSize v11 = *(CGImage **)(*((void *)&v14 + 1) + 8 * i);
          double v12 = (double)CGImageGetWidth(v11) * 0.5;
          size_t Height = CGImageGetHeight(v11);
          double v6 = v6 + v12;
          if (v5 <= (double)Height * 0.5) {
            double v5 = (double)Height * 0.5;
          }
        }
        uint64_t v8 = [(NSMutableArray *)images countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
    self->imagesSize.double width = v6 + (double)(unint64_t)([(NSMutableArray *)images count] - 1) * 5.0;
    self->imagesSize.double height = v5;
    [(CIGVNode *)self updateContentSize];
  }
}

- (void)addRoi:(CGRect)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  CGAffineTransform v20 = *(CGAffineTransform *)contentScale;
  CGRect v22 = CGRectApplyAffineTransform(a3, &v20);
  [(NSMutableArray *)self->rois addObject:valueWithRect(v22.origin.x, v22.origin.y, v22.size.width, v22.size.height)];
  rois = self->rois;
  CGFloat x = self->extent.origin.x;
  CGFloat y = self->extent.origin.y;
  CGFloat width = self->extent.size.width;
  CGFloat height = self->extent.size.height;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v9 = [(NSMutableArray *)rois countByEnumeratingWithState:&v16 objects:&v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(rois);
        }
        v25.origin.CGFloat x = rectFromValue(*(void **)(*((void *)&v16 + 1) + 8 * v12));
        v25.origin.CGFloat y = v13;
        v25.size.CGFloat width = v14;
        v25.size.CGFloat height = v15;
        v23.origin.CGFloat x = x;
        v23.origin.CGFloat y = y;
        v23.size.CGFloat width = width;
        v23.size.CGFloat height = height;
        CGRect v24 = CGRectUnion(v23, v25);
        CGFloat x = v24.origin.x;
        CGFloat y = v24.origin.y;
        CGFloat width = v24.size.width;
        CGFloat height = v24.size.height;
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)rois countByEnumeratingWithState:&v16 objects:&v20 count:16];
    }
    while (v10);
  }
  self->roisSize.CGFloat width = width;
  self->roisSize.CGFloat height = height;
  [(CIGVNode *)self updateContentSize];
}

- (CGRect)titleFrame
{
  [(GVNode *)self size];
  double v4 = (v3 - self->titleSize.width) * 0.5;
  double v6 = v5 - self->badgeSize.height + (self->badgeSize.height - self->titleSize.height) * 0.5;
  [(GVNode *)self origin];
  double v8 = v4 + v7;
  [(GVNode *)self origin];
  double v10 = v9 + v6;
  double width = self->titleSize.width;
  double height = self->titleSize.height;
  double v13 = v8;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.CGFloat y = v10;
  result.origin.CGFloat x = v13;
  return result;
}

- (CGRect)badgeFrame
{
  [(GVNode *)self size];
  double v4 = (v3 - self->badgeSize.width) * 0.5;
  double v6 = v5 - self->badgeSize.height;
  [(GVNode *)self origin];
  double v8 = v4 + v7;
  [(GVNode *)self origin];
  double v10 = v6 + v9;
  double width = self->badgeSize.width;
  double height = self->badgeSize.height;
  double v13 = v8;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.CGFloat y = v10;
  result.origin.CGFloat x = v13;
  return result;
}

- (CGSize)contentInsertSize
{
  unsigned int shape = self->shape;
  double v3 = 4.0;
  if (shape >= 3)
  {
    if (shape != 3) {
      -[CIGVNode contentInsertSize]();
    }
    double width = self->contentSize.width;
    if (width >= self->contentSize.height) {
      double width = self->contentSize.height;
    }
    double v3 = width * 0.1 + 4.0;
  }
  double v5 = 4.0;
  result.double height = v5;
  result.double width = v3;
  return result;
}

- (CGSize)contentCornerSize
{
  int shape = self->shape;
  if ((shape - 1) < 2)
  {
    double v3 = 8.0;
    double v4 = 8.0;
  }
  else
  {
    double v3 = 0.0;
    double v4 = 0.0;
    if (shape)
    {
      if (shape != 3) {
        -[CIGVNode contentCornerSize]();
      }
      double width = self->contentSize.width;
      if (width >= self->contentSize.height) {
        double width = self->contentSize.height;
      }
      double v4 = width * 0.1;
      double v3 = 4.0;
    }
  }
  result.double height = v3;
  result.double width = v4;
  return result;
}

- (CGRect)labelFrame
{
  [(GVNode *)self size];
  double v4 = v3;
  [(CIGVNode *)self contentInsertSize];
  double v5 = (v4 - self->labelSize.width) * 0.5;
  double v7 = v6 + 5.0;
  [(GVNode *)self origin];
  double v9 = v8 + v5;
  [(GVNode *)self origin];
  double v11 = v7 + v10;
  double width = self->labelSize.width;
  double height = self->labelSize.height;
  double v14 = v9;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.CGFloat y = v11;
  result.origin.CGFloat x = v14;
  return result;
}

- (CGRect)imagesFrame
{
  [(GVNode *)self size];
  double v4 = v3;
  [(CIGVNode *)self contentInsertSize];
  double v5 = (v4 - self->imagesSize.width) * 0.5;
  double v7 = v6 + self->labelSize.height + 10.0;
  [(GVNode *)self origin];
  double v9 = v5 + v8;
  [(GVNode *)self origin];
  double v11 = v7 + v10;
  double width = self->imagesSize.width;
  double height = self->imagesSize.height;
  double v14 = v9;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.CGFloat y = v11;
  result.origin.CGFloat x = v14;
  return result;
}

- (CGRect)roisFrame
{
  [(GVNode *)self size];
  double v4 = v3;
  [(CIGVNode *)self contentInsertSize];
  double width = self->roisSize.width;
  double v7 = v6 + self->labelSize.height + 10.0;
  if ([(NSMutableArray *)self->images count]) {
    double v7 = v7 + self->imagesSize.height + 10.0;
  }
  [(GVNode *)self origin];
  double v9 = (v4 - width) * 0.5 + v8;
  [(GVNode *)self origin];
  double v11 = v7 + v10;
  double v12 = self->roisSize.width;
  double height = self->roisSize.height;
  double v14 = v9;
  result.size.double height = height;
  result.size.double width = v12;
  result.origin.CGFloat y = v11;
  result.origin.CGFloat x = v14;
  return result;
}

- (CGRect)contentFrame
{
  [(GVNode *)self size];
  double v4 = v3;
  double v6 = v5;
  [(GVNode *)self origin];
  double v8 = v7;
  [(GVNode *)self origin];
  double v10 = v6 + self->badgeSize.height * -0.5;
  double v11 = v8;
  double v12 = v4;
  result.size.double height = v10;
  result.size.double width = v12;
  result.origin.CGFloat y = v9;
  result.origin.CGFloat x = v11;
  return result;
}

- (void)updateSize
{
  CGFloat v3 = self->contentSize.width + 10.0;
  CGFloat v4 = self->contentSize.height + self->badgeSize.height + 10.0;
  [(CIGVNode *)self contentInsertSize];
  double v6 = v3 + v5 * 2.0;
  double v8 = v4 + v7 * 2.0;

  -[GVNode setSize:](self, "setSize:", v6, v8);
}

- (void)updateBadgeSize
{
  self->badgeSize = self->titleSize;
  self->badgeSize = (CGSize)vaddq_f64((float64x2_t)self->badgeSize, (float64x2_t)xmmword_193953400);
  [(CIGVNode *)self updateSize];
}

- (void)updateContentSize
{
  p_contentSize = &self->contentSize;
  self->contentSize = self->labelSize;
  if ([(NSMutableArray *)self->images count])
  {
    double width = self->imagesSize.width;
    if (p_contentSize->width > width) {
      double width = p_contentSize->width;
    }
    CGFloat v5 = p_contentSize->height + self->imagesSize.height + 10.0;
    p_contentSize->double width = width;
    p_contentSize->double height = v5;
  }
  if ([(NSMutableArray *)self->rois count])
  {
    double v6 = self->roisSize.width;
    if (p_contentSize->width > v6) {
      double v6 = p_contentSize->width;
    }
    CGFloat v7 = p_contentSize->height + self->roisSize.height + 10.0;
    p_contentSize->double width = v6;
    p_contentSize->double height = v7;
  }

  [(CIGVNode *)self updateSize];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p, label=%@, color=%d shape=%d>", objc_opt_class(), self, -[CIGVNode label](self, "label"), self->color, self->shape];
}

- (int)color
{
  return self->color;
}

- (int)shape
{
  return self->shape;
}

- (__CFString)title
{
  return self->title;
}

- (__CFString)label
{
  return self->label;
}

- (void)contentInsertSize
{
}

- (void)contentCornerSize
{
}

@end