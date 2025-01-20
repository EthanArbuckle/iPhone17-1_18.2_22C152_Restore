@interface SwitchComponent
- (_TtC19CoreDynamicUIPlugin15SwitchComponent)init;
- (_TtC19CoreDynamicUIPlugin15SwitchComponent)initWithFrame:(CGRect)a3;
- (void)prepareForReuse;
- (void)switchAction;
@end

@implementation SwitchComponent

- (_TtC19CoreDynamicUIPlugin15SwitchComponent)initWithFrame:(CGRect)a3
{
  return (_TtC19CoreDynamicUIPlugin15SwitchComponent *)sub_85FE4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)prepareForReuse
{
  v2 = self;
  sub_86204();
}

- (void)switchAction
{
  v2 = self;
  sub_8656C();
}

- (_TtC19CoreDynamicUIPlugin15SwitchComponent)init
{
}

- (void).cxx_destruct
{
  swift_release();
  sub_EF88((uint64_t)&self->AMSUICommonCollectionViewCell_opaque[OBJC_IVAR____TtC19CoreDynamicUIPlugin15SwitchComponent_offSegue], &qword_BAAD0);
  sub_EF88((uint64_t)&self->AMSUICommonCollectionViewCell_opaque[OBJC_IVAR____TtC19CoreDynamicUIPlugin15SwitchComponent_onSegue], &qword_BAAD0);

  v3 = *(void **)&self->AMSUICommonCollectionViewCell_opaque[OBJC_IVAR____TtC19CoreDynamicUIPlugin15SwitchComponent_horizontalStackView];
}

@end