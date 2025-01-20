@interface AppAlertFooterComponent
- (_TtC19CoreDynamicUIPlugin23AppAlertFooterComponent)init;
- (_TtC19CoreDynamicUIPlugin23AppAlertFooterComponent)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)primaryButtonAction;
- (void)secondaryButtonAction;
@end

@implementation AppAlertFooterComponent

- (_TtC19CoreDynamicUIPlugin23AppAlertFooterComponent)initWithFrame:(CGRect)a3
{
  return (_TtC19CoreDynamicUIPlugin23AppAlertFooterComponent *)sub_125F0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1297C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_12A4C();
}

- (void)primaryButtonAction
{
  v2 = self;
  sub_12D08();
}

- (void)secondaryButtonAction
{
  v2 = self;
  sub_12D5C();
}

- (_TtC19CoreDynamicUIPlugin23AppAlertFooterComponent)init
{
}

- (void).cxx_destruct
{
  sub_1379C((uint64_t)&self->AMSUICommonCollectionViewCell_opaque[OBJC_IVAR____TtC19CoreDynamicUIPlugin23AppAlertFooterComponent_primaryButtonModel], &qword_BAAF0);
  sub_1379C((uint64_t)&self->AMSUICommonCollectionViewCell_opaque[OBJC_IVAR____TtC19CoreDynamicUIPlugin23AppAlertFooterComponent_secondaryButtonModel], &qword_BAAF0);

  swift_release();
}

@end