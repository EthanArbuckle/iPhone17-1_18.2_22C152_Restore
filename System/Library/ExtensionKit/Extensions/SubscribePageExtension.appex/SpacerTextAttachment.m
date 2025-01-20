@interface SpacerTextAttachment
- (CGRect)attachmentBoundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(int64_t)a6;
- (_TtC22SubscribePageExtensionP33_6837BF917F8C839CA68F136674C7E50F20SpacerTextAttachment)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtensionP33_6837BF917F8C839CA68F136674C7E50F20SpacerTextAttachment)initWithData:(id)a3 ofType:(id)a4;
@end

@implementation SpacerTextAttachment

- (_TtC22SubscribePageExtensionP33_6837BF917F8C839CA68F136674C7E50F20SpacerTextAttachment)initWithCoder:(id)a3
{
  result = (_TtC22SubscribePageExtensionP33_6837BF917F8C839CA68F136674C7E50F20SpacerTextAttachment *)sub_100768A40();
  __break(1u);
  return result;
}

- (CGRect)attachmentBoundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(int64_t)a6
{
  double v6 = *(double *)((char *)&self->super.super.isa
                 + OBJC_IVAR____TtC22SubscribePageExtensionP33_6837BF917F8C839CA68F136674C7E50F20SpacerTextAttachment_width);
  double v7 = 0.0;
  double v8 = 0.0;
  double v9 = 0.0;
  result.size.height = v9;
  result.size.width = v6;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (_TtC22SubscribePageExtensionP33_6837BF917F8C839CA68F136674C7E50F20SpacerTextAttachment)initWithData:(id)a3 ofType:(id)a4
{
  if (a3)
  {
    id v5 = a4;
    id v6 = a3;
    sub_100755EB0();
  }
  CGRect result = (_TtC22SubscribePageExtensionP33_6837BF917F8C839CA68F136674C7E50F20SpacerTextAttachment *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end