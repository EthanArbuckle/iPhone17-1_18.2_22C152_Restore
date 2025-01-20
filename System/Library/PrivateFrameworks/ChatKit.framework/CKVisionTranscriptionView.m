@interface CKVisionTranscriptionView
- (_TtC7ChatKit25CKVisionTranscriptionView)initWithCoder:(id)a3;
- (_TtC7ChatKit25CKVisionTranscriptionView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation CKVisionTranscriptionView

- (void)layoutSubviews
{
  v2 = self;
  sub_18F6C48B8();
}

- (_TtC7ChatKit25CKVisionTranscriptionView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = OBJC_IVAR____TtC7ChatKit25CKVisionTranscriptionView_textViewTrailingAnchorConstraintToExpansionButton;
  id v9 = objc_allocWithZone(MEMORY[0x1E4F28DC8]);
  v10 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v8) = (Class)objc_msgSend(v9, sel_init);
  uint64_t v11 = OBJC_IVAR____TtC7ChatKit25CKVisionTranscriptionView_textViewTrailingAnchorConstraintToContainer;
  *(Class *)((char *)&v10->super.super.super.super.isa + v11) = (Class)objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28DC8]), sel_init);

  v13.receiver = v10;
  v13.super_class = (Class)type metadata accessor for CKVisionTranscriptionView();
  return -[CKTranscriptionView initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
}

- (_TtC7ChatKit25CKVisionTranscriptionView)initWithCoder:(id)a3
{
  return (_TtC7ChatKit25CKVisionTranscriptionView *)sub_18F6C4F8C(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit25CKVisionTranscriptionView_textViewTrailingAnchorConstraintToExpansionButton));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC7ChatKit25CKVisionTranscriptionView_textViewTrailingAnchorConstraintToContainer);
}

@end