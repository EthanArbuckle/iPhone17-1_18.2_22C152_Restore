@interface WKTextExtractionContainerItem
- (WKTextExtractionContainerItem)initWithContainer:(int64_t)a3 rectInWebView:(CGRect)a4 children:(id)a5;
- (int64_t)container;
@end

@implementation WKTextExtractionContainerItem

- (int64_t)container
{
  return *(int64_t *)((char *)&self->super.super.isa + OBJC_IVAR___WKTextExtractionContainerItem_container);
}

- (WKTextExtractionContainerItem)initWithContainer:(int64_t)a3 rectInWebView:(CGRect)a4 children:(id)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  v11 = (objc_class *)type metadata accessor for WKTextExtractionItem();
  v12 = (objc_class *)sub_246426790();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___WKTextExtractionContainerItem_container) = (Class)a3;
  v13 = (CGFloat *)((char *)self + OBJC_IVAR___WKTextExtractionItem_rectInWebView);
  CGFloat *v13 = x;
  v13[1] = y;
  v13[2] = width;
  v13[3] = height;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___WKTextExtractionItem_children) = v12;
  v15.receiver = self;
  v15.super_class = v11;
  return [(WKTextExtractionItem *)&v15 init];
}

@end