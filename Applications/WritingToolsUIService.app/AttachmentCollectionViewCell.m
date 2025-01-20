@interface AttachmentCollectionViewCell
- (_TtC21WritingToolsUIService28AttachmentCollectionViewCell)initWithCoder:(id)a3;
- (_TtC21WritingToolsUIService28AttachmentCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)didTapCloseButton;
- (void)layoutSubviews;
@end

@implementation AttachmentCollectionViewCell

- (_TtC21WritingToolsUIService28AttachmentCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC21WritingToolsUIService28AttachmentCollectionViewCell *)sub_100034BA8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC21WritingToolsUIService28AttachmentCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100035E9C();
}

- (void)didTapCloseButton
{
  v2 = self;
  sub_1000357A8();
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  v2 = (char *)v8.receiver;
  [(AttachmentCollectionViewCell *)&v8 layoutSubviews];
  [self preferredTapRegionSizeForStyle:0 v8.receiver, v8.super_class];
  double v4 = v3;
  double v6 = v5;
  v7 = *(void **)&v2[OBJC_IVAR____TtC21WritingToolsUIService28AttachmentCollectionViewCell_closeButton];
  [v2 bounds];
  [v7 setFrame:CGRectMake(CGRectGetMaxX(v9) - v4, 0.0, v4, v6)];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC21WritingToolsUIService28AttachmentCollectionViewCell_linkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC21WritingToolsUIService28AttachmentCollectionViewCell_closeButton));
  sub_10002784C((uint64_t)self + OBJC_IVAR____TtC21WritingToolsUIService28AttachmentCollectionViewCell_attachment, &qword_1002049C0);
}

@end