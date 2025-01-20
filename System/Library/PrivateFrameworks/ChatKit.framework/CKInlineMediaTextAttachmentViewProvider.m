@interface CKInlineMediaTextAttachmentViewProvider
- (CGRect)attachmentBoundsForAttributes:(id)a3 location:(id)a4 textContainer:(id)a5 proposedLineFragment:(CGRect)a6 position:(CGPoint)a7;
- (_TtC7ChatKit39CKInlineMediaTextAttachmentViewProvider)initWithTextAttachment:(id)a3 parentView:(id)a4 textLayoutManager:(id)a5 location:(id)a6;
- (void)loadView;
@end

@implementation CKInlineMediaTextAttachmentViewProvider

- (CGRect)attachmentBoundsForAttributes:(id)a3 location:(id)a4 textContainer:(id)a5 proposedLineFragment:(CGRect)a6 position:(CGPoint)a7
{
  swift_unknownObjectRetain();
  id v9 = a5;
  v10 = self;
  sub_18F4D3E10();
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  swift_unknownObjectRelease();

  double v19 = v12;
  double v20 = v14;
  double v21 = v16;
  double v22 = v18;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (void)loadView
{
}

- (_TtC7ChatKit39CKInlineMediaTextAttachmentViewProvider)initWithTextAttachment:(id)a3 parentView:(id)a4 textLayoutManager:(id)a5 location:(id)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  swift_unknownObjectRetain();
  CGRect result = (_TtC7ChatKit39CKInlineMediaTextAttachmentViewProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7ChatKit39CKInlineMediaTextAttachmentViewProvider_providedView));
}

@end