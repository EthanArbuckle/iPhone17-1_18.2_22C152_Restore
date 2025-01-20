@interface ServiceProductCardView
- (_TtC20StoreDynamicUIPlugin22ServiceProductCardView)init;
- (_TtC20StoreDynamicUIPlugin22ServiceProductCardView)initWithCoder:(id)a3;
- (_TtC20StoreDynamicUIPlugin22ServiceProductCardView)initWithFrame:(CGRect)a3;
- (void)dismissButtonActionWithSender:(id)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation ServiceProductCardView

- (_TtC20StoreDynamicUIPlugin22ServiceProductCardView)initWithFrame:(CGRect)a3
{
  return (_TtC20StoreDynamicUIPlugin22ServiceProductCardView *)sub_DD01C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20StoreDynamicUIPlugin22ServiceProductCardView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_DD188();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_DD2CC();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_DD5BC((uint64_t)a3);
}

- (void)dismissButtonActionWithSender:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_10B110();
  swift_unknownObjectRelease();
  sub_DDBBC((uint64_t)v5);

  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((uint64_t)v5);
}

- (_TtC20StoreDynamicUIPlugin22ServiceProductCardView)init
{
}

- (void).cxx_destruct
{
  uint64_t v3 = *(void *)&self->AMSUICommonView_opaque[OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceProductCardView_dismissAction];

  sub_10950(v3);
}

@end