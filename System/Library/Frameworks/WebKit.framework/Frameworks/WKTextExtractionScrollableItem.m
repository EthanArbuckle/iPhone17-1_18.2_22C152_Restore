@interface WKTextExtractionScrollableItem
- (CGSize)contentSize;
- (WKTextExtractionScrollableItem)initWithContentSize:(CGSize)a3 rectInWebView:(CGRect)a4 children:(id)a5;
@end

@implementation WKTextExtractionScrollableItem

- (CGSize)contentSize
{
  double v2 = *(double *)((char *)&self->super.super.isa + OBJC_IVAR___WKTextExtractionScrollableItem_contentSize);
  double v3 = *(double *)&self->super.rectInWebView[OBJC_IVAR___WKTextExtractionScrollableItem_contentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (WKTextExtractionScrollableItem)initWithContentSize:(CGSize)a3 rectInWebView:(CGRect)a4 children:(id)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v9 = a3.height;
  CGFloat v10 = a3.width;
  v12 = (objc_class *)type metadata accessor for WKTextExtractionItem();
  v13 = (objc_class *)sub_246426790();
  v14 = (CGFloat *)((char *)self + OBJC_IVAR___WKTextExtractionScrollableItem_contentSize);
  CGFloat *v14 = v10;
  v14[1] = v9;
  v15 = (CGFloat *)((char *)self + OBJC_IVAR___WKTextExtractionItem_rectInWebView);
  CGFloat *v15 = x;
  v15[1] = y;
  v15[2] = width;
  v15[3] = height;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___WKTextExtractionItem_children) = v13;
  v17.receiver = self;
  v17.super_class = v12;
  return [(WKTextExtractionItem *)&v17 init];
}

@end