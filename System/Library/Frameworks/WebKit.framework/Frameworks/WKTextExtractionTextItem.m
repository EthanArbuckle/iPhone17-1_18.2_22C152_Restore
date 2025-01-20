@interface WKTextExtractionTextItem
- (NSArray)links;
- (NSString)content;
- (WKTextExtractionEditable)editable;
- (WKTextExtractionTextItem)initWithContent:(id)a3 selectedRange:(_NSRange)a4 links:(id)a5 editable:(id)a6 rectInWebView:(CGRect)a7 children:(id)a8;
- (_NSRange)selectedRange;
@end

@implementation WKTextExtractionTextItem

- (NSString)content
{
  return (NSString *)sub_24642392C();
}

- (_NSRange)selectedRange
{
  v2 = (char *)self + OBJC_IVAR___WKTextExtractionTextItem_selectedRange;
  NSUInteger v3 = *(NSUInteger *)((char *)&self->super.super.isa + OBJC_IVAR___WKTextExtractionTextItem_selectedRange);
  NSUInteger v4 = *((void *)v2 + 1);
  result.length = v4;
  result.location = v3;
  return result;
}

- (NSArray)links
{
  return (NSArray *)sub_246423238((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___WKTextExtractionTextItem_links, (void (*)(void))type metadata accessor for WKTextExtractionLink);
}

- (WKTextExtractionEditable)editable
{
  return (WKTextExtractionEditable *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                             + OBJC_IVAR___WKTextExtractionTextItem_editable));
}

- (WKTextExtractionTextItem)initWithContent:(id)a3 selectedRange:(_NSRange)a4 links:(id)a5 editable:(id)a6 rectInWebView:(CGRect)a7 children:(id)a8
{
  CGFloat height = a7.size.height;
  CGFloat width = a7.size.width;
  CGFloat y = a7.origin.y;
  CGFloat x = a7.origin.x;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v16 = sub_246426740();
  uint64_t v18 = v17;
  type metadata accessor for WKTextExtractionLink();
  v19 = (objc_class *)sub_246426790();
  v20 = (objc_class *)type metadata accessor for WKTextExtractionItem();
  v21 = (objc_class *)sub_246426790();
  v22 = (uint64_t *)((char *)self + OBJC_IVAR___WKTextExtractionTextItem_content);
  uint64_t *v22 = v16;
  v22[1] = v18;
  v23 = (NSUInteger *)((char *)self + OBJC_IVAR___WKTextExtractionTextItem_selectedRange);
  NSUInteger *v23 = location;
  v23[1] = length;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___WKTextExtractionTextItem_links) = v19;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___WKTextExtractionTextItem_editable) = (Class)a6;
  v24 = (CGFloat *)((char *)self + OBJC_IVAR___WKTextExtractionItem_rectInWebView);
  CGFloat *v24 = x;
  v24[1] = y;
  v24[2] = width;
  v24[3] = height;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___WKTextExtractionItem_children) = v21;
  v27.receiver = self;
  v27.super_class = v20;
  id v25 = a6;
  return [(WKTextExtractionItem *)&v27 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  NSUInteger v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___WKTextExtractionTextItem_editable);
}

@end