@interface UIAccessibilityPDFElement
- (CGRect)accessibilityFrame;
- (CGRect)frame;
- (int64_t)page;
- (int64_t)pageCount;
- (void)setPage:(int64_t)a3;
- (void)setPageCount:(int64_t)a3;
@end

@implementation UIAccessibilityPDFElement

- (CGRect)frame
{
  v3 = [(UIAccessibilityPDFElement *)self accessibilityContainer];
  v4 = [v3 accessibilityContainer];

  v5 = [v4 safeValueForKey:@"_scroller"];
  v6 = v5;
  if (v5)
  {
    [v5 bounds];
    double v8 = v7;
    [v6 _accessibilityContentSize];
    double v10 = v9;
    double v12 = v11 / (double)[(UIAccessibilityPDFElement *)self pageCount];
    double v13 = v12 * (double)[(UIAccessibilityPDFElement *)self page];
  }
  else
  {
    double v8 = *MEMORY[0x263F001A8];
    double v13 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v10 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v12 = *(double *)(MEMORY[0x263F001A8] + 24);
  }

  double v14 = v8;
  double v15 = v13;
  double v16 = v10;
  double v17 = v12;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGRect)accessibilityFrame
{
  [(UIAccessibilityPDFElement *)self frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(UIAccessibilityPDFElement *)self accessibilityContainer];
  double v12 = [v11 accessibilityContainer];

  double v13 = [v12 safeValueForKey:@"_scroller"];
  double v14 = [v13 window];
  objc_msgSend(v13, "convertRect:toView:", v14, v4, v6, v8, v10);
  objc_msgSend(v14, "convertRect:toWindow:", 0);
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;

  double v23 = v16;
  double v24 = v18;
  double v25 = v20;
  double v26 = v22;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (int64_t)page
{
  return self->_page;
}

- (void)setPage:(int64_t)a3
{
  self->_page = a3;
}

- (int64_t)pageCount
{
  return self->_pageCount;
}

- (void)setPageCount:(int64_t)a3
{
  self->_pageCount = a3;
}

@end