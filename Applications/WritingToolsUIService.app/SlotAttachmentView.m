@interface SlotAttachmentView
- (_TtC21WritingToolsUIService18SlotAttachmentView)initWithCoder:(id)a3;
- (_TtC21WritingToolsUIService18SlotAttachmentView)initWithFrame:(CGRect)a3;
- (void)didTapCloseButton;
- (void)layoutSubviews;
@end

@implementation SlotAttachmentView

- (_TtC21WritingToolsUIService18SlotAttachmentView)initWithFrame:(CGRect)a3
{
  return (_TtC21WritingToolsUIService18SlotAttachmentView *)sub_10012D694(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC21WritingToolsUIService18SlotAttachmentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10012FF00();
}

- (void)didTapCloseButton
{
  v2 = self;
  sub_10012E02C();
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  v2 = (char *)v8.receiver;
  [(SlotAttachmentView *)&v8 layoutSubviews];
  [self preferredTapRegionSizeForStyle:0];
  double v4 = v3;
  double v6 = v5;
  v7 = *(void **)&v2[OBJC_IVAR____TtC21WritingToolsUIService18SlotAttachmentView_closeButton];
  [v2 bounds];
  [v7 setFrame:CGRectMake(CGRectGetMaxX(v9) - v4, v6 * 0.5, v4, v6)];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC21WritingToolsUIService18SlotAttachmentView_linkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC21WritingToolsUIService18SlotAttachmentView_closeButton));
  sub_10002784C((uint64_t)self + OBJC_IVAR____TtC21WritingToolsUIService18SlotAttachmentView_attachment, &qword_1002049C0);
}

@end