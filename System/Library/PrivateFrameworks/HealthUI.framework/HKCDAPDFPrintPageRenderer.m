@interface HKCDAPDFPrintPageRenderer
- (CGRect)paperRect;
- (CGRect)printableRect;
- (HKCDAPDFPrintPageRenderer)initWithPaperRect:(CGRect)a3 horizontalMargin:(double)a4 verticalMargin:(double)a5;
- (void)drawFooterForPageAtIndex:(int64_t)a3 inRect:(CGRect)a4;
@end

@implementation HKCDAPDFPrintPageRenderer

- (HKCDAPDFPrintPageRenderer)initWithPaperRect:(CGRect)a3 horizontalMargin:(double)a4 verticalMargin:(double)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v15.receiver = self;
  v15.super_class = (Class)HKCDAPDFPrintPageRenderer;
  v11 = [(HKCDAPDFPrintPageRenderer *)&v15 init];
  v12 = v11;
  if (v11)
  {
    v11->_paperRectOverride.origin.CGFloat x = x;
    v11->_paperRectOverride.origin.CGFloat y = y;
    v11->_paperRectOverride.size.CGFloat width = width;
    v11->_paperRectOverride.size.CGFloat height = height;
    p_CGFloat x = &v11->_printableRectOverride.origin.x;
    v16.origin.CGFloat x = x;
    v16.origin.CGFloat y = y;
    v16.size.CGFloat width = width;
    v16.size.CGFloat height = height;
    CGRect v17 = CGRectInset(v16, a4, a5);
    *p_CGFloat x = v17.origin.x;
    v12->_printableRectOverride.origin.CGFloat y = v17.origin.y;
    v12->_printableRectOverride.size.CGFloat width = v17.size.width;
    v12->_printableRectOverride.size.CGFloat height = v17.size.height + a5;
    [(UIPrintPageRenderer *)v12 setFooterHeight:a5];
  }
  return v12;
}

- (CGRect)paperRect
{
  double x = self->_paperRectOverride.origin.x;
  double y = self->_paperRectOverride.origin.y;
  double width = self->_paperRectOverride.size.width;
  double height = self->_paperRectOverride.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)printableRect
{
  double x = self->_printableRectOverride.origin.x;
  double y = self->_printableRectOverride.origin.y;
  double width = self->_printableRectOverride.size.width;
  double height = self->_printableRectOverride.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)drawFooterForPageAtIndex:(int64_t)a3 inRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  v16[3] = *MEMORY[0x1E4F143B8];
  v8 = objc_msgSend(MEMORY[0x1E4FB08E0], "systemFontOfSize:", a3, 8.0);
  v9 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v10 = [v9 localizedStringForKey:@"CLINICAL_DOCUMENT_CDA_DISCLOSURE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

  id v11 = objc_alloc_init(MEMORY[0x1E4FB0848]);
  [v11 setAlignment:0];
  uint64_t v12 = *MEMORY[0x1E4FB0738];
  v15[0] = *MEMORY[0x1E4FB06F8];
  v15[1] = v12;
  v16[0] = v8;
  v16[1] = v11;
  v15[2] = *MEMORY[0x1E4FB0700];
  v13 = [MEMORY[0x1E4FB1618] grayColor];
  v16[2] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];

  objc_msgSend(v10, "boundingRectWithSize:options:attributes:context:", 1, v14, 0, width + -20.0, height);
  objc_msgSend(v10, "drawInRect:withAttributes:", v14, x + 20.0, y + 10.0);
}

@end