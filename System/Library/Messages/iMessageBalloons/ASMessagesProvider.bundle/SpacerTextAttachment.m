@interface SpacerTextAttachment
- (CGRect)attachmentBoundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(int64_t)a6;
- (_TtC18ASMessagesProviderP33_75E758F81AC50D744B9F822CE8FE04E120SpacerTextAttachment)initWithCoder:(id)a3;
- (_TtC18ASMessagesProviderP33_75E758F81AC50D744B9F822CE8FE04E120SpacerTextAttachment)initWithData:(id)a3 ofType:(id)a4;
@end

@implementation SpacerTextAttachment

- (_TtC18ASMessagesProviderP33_75E758F81AC50D744B9F822CE8FE04E120SpacerTextAttachment)initWithCoder:(id)a3
{
  result = (_TtC18ASMessagesProviderP33_75E758F81AC50D744B9F822CE8FE04E120SpacerTextAttachment *)sub_77EB20();
  __break(1u);
  return result;
}

- (CGRect)attachmentBoundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(int64_t)a6
{
  double v6 = *(double *)((char *)&self->super.super.isa
                 + OBJC_IVAR____TtC18ASMessagesProviderP33_75E758F81AC50D744B9F822CE8FE04E120SpacerTextAttachment_width);
  double v7 = 0.0;
  double v8 = 0.0;
  double v9 = 0.0;
  result.size.height = v9;
  result.size.width = v6;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (_TtC18ASMessagesProviderP33_75E758F81AC50D744B9F822CE8FE04E120SpacerTextAttachment)initWithData:(id)a3 ofType:(id)a4
{
  if (a3)
  {
    id v5 = a4;
    id v6 = a3;
    sub_76BC50();
  }
  CGRect result = (_TtC18ASMessagesProviderP33_75E758F81AC50D744B9F822CE8FE04E120SpacerTextAttachment *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end