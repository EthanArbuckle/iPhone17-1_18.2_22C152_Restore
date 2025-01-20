@interface WKTextExtractionImageItem
- (NSString)altText;
- (NSString)name;
- (WKTextExtractionImageItem)initWithName:(id)a3 altText:(id)a4 rectInWebView:(CGRect)a5 children:(id)a6;
@end

@implementation WKTextExtractionImageItem

- (NSString)name
{
  return (NSString *)sub_24642392C();
}

- (NSString)altText
{
  return (NSString *)sub_24642392C();
}

- (WKTextExtractionImageItem)initWithName:(id)a3 altText:(id)a4 rectInWebView:(CGRect)a5 children:(id)a6
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  uint64_t v11 = sub_246426740();
  uint64_t v13 = v12;
  uint64_t v14 = sub_246426740();
  uint64_t v16 = v15;
  v17 = (objc_class *)type metadata accessor for WKTextExtractionItem();
  v18 = (objc_class *)sub_246426790();
  v19 = (uint64_t *)((char *)self + OBJC_IVAR___WKTextExtractionImageItem_name);
  uint64_t *v19 = v11;
  v19[1] = v13;
  v20 = (uint64_t *)((char *)self + OBJC_IVAR___WKTextExtractionImageItem_altText);
  uint64_t *v20 = v14;
  v20[1] = v16;
  v21 = (CGFloat *)((char *)self + OBJC_IVAR___WKTextExtractionItem_rectInWebView);
  CGFloat *v21 = x;
  v21[1] = y;
  v21[2] = width;
  v21[3] = height;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___WKTextExtractionItem_children) = v18;
  v23.receiver = self;
  v23.super_class = v17;
  return [(WKTextExtractionItem *)&v23 init];
}

- (void).cxx_destruct
{
}

@end