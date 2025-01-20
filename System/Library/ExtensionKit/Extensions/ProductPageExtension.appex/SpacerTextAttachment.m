@interface SpacerTextAttachment
- (CGRect)attachmentBoundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(int64_t)a6;
- (_TtC20ProductPageExtensionP33_BBE9CE4405D81F204470D7CB156CD67520SpacerTextAttachment)initWithCoder:(id)a3;
- (_TtC20ProductPageExtensionP33_BBE9CE4405D81F204470D7CB156CD67520SpacerTextAttachment)initWithData:(id)a3 ofType:(id)a4;
@end

@implementation SpacerTextAttachment

- (_TtC20ProductPageExtensionP33_BBE9CE4405D81F204470D7CB156CD67520SpacerTextAttachment)initWithCoder:(id)a3
{
  result = (_TtC20ProductPageExtensionP33_BBE9CE4405D81F204470D7CB156CD67520SpacerTextAttachment *)sub_10077D120();
  __break(1u);
  return result;
}

- (CGRect)attachmentBoundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(int64_t)a6
{
  double v6 = *(double *)((char *)&self->super.super.isa
                 + OBJC_IVAR____TtC20ProductPageExtensionP33_BBE9CE4405D81F204470D7CB156CD67520SpacerTextAttachment_width);
  double v7 = 0.0;
  double v8 = 0.0;
  double v9 = 0.0;
  result.size.height = v9;
  result.size.width = v6;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (_TtC20ProductPageExtensionP33_BBE9CE4405D81F204470D7CB156CD67520SpacerTextAttachment)initWithData:(id)a3 ofType:(id)a4
{
  if (a3)
  {
    id v5 = a4;
    id v6 = a3;
    sub_10076A060();
  }
  CGRect result = (_TtC20ProductPageExtensionP33_BBE9CE4405D81F204470D7CB156CD67520SpacerTextAttachment *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end