@interface SwitchCellViewController
- (_TtC18HealthExperienceUI24SwitchCellViewController)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI24SwitchCellViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)switchTapped;
@end

@implementation SwitchCellViewController

- (void)switchTapped
{
  v2 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.super.super.super.isa) + 0xF0);
  v12 = self;
  uint64_t v3 = v2();
  if (v3)
  {
    v5 = (_TtC18HealthExperienceUI24SwitchCellViewController *)v3;
    uint64_t v6 = v4;
    id v7 = sub_1AD2DE964();
    if (!v7)
    {
      __break(1u);
      return;
    }
    v8 = v7;
    uint64_t ObjectType = swift_getObjectType();
    id v10 = objc_msgSend(v8, sel_isOn);

    (*(void (**)(id, uint64_t, uint64_t))(v6 + 16))(v10, ObjectType, v6);
    v11 = v5;
  }
  else
  {
    v11 = v12;
  }
}

- (_TtC18HealthExperienceUI24SwitchCellViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC18HealthExperienceUI24SwitchCellViewController *)SwitchCellViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC18HealthExperienceUI24SwitchCellViewController)initWithCoder:(id)a3
{
  *(void *)((char *)&self->super.super.super._responderFlags
            + OBJC_IVAR____TtC18HealthExperienceUI24SwitchCellViewController_delegate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI24SwitchCellViewController____lazy_storage___switchView) = (Class)1;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI24SwitchCellViewController____lazy_storage___cellAccessoryView) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SwitchCellViewController();
  return [(CellWithAccessoryViewController *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
  sub_1AD24D3D8((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI24SwitchCellViewController_delegate);
  sub_1AD1ACD5C(*(id *)((char *)&self->super.super.super.super.isa
                      + OBJC_IVAR____TtC18HealthExperienceUI24SwitchCellViewController____lazy_storage___switchView));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI24SwitchCellViewController____lazy_storage___cellAccessoryView);
}

@end