@interface AppSelectionSectionHeaderView
- (_TtC22GuestUserHandoverSetup29AppSelectionSectionHeaderView)initWithCoder:(id)a3;
- (_TtC22GuestUserHandoverSetup29AppSelectionSectionHeaderView)initWithReuseIdentifier:(id)a3;
- (void)performAuxillaryAction;
- (void)prepareForReuse;
@end

@implementation AppSelectionSectionHeaderView

- (_TtC22GuestUserHandoverSetup29AppSelectionSectionHeaderView)initWithReuseIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v4 = 0;
  }
  return (_TtC22GuestUserHandoverSetup29AppSelectionSectionHeaderView *)sub_100004B2C(v3, v4);
}

- (_TtC22GuestUserHandoverSetup29AppSelectionSectionHeaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000057D4();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_100004D30();
}

- (void)performAuxillaryAction
{
  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC22GuestUserHandoverSetup29AppSelectionSectionHeaderView_action);
  if (v2)
  {
    uint64_t v4 = self;
    uint64_t v3 = sub_1000057C4((uint64_t)v2);
    v2(v3);
    sub_1000057B4((uint64_t)v2);
  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22GuestUserHandoverSetup29AppSelectionSectionHeaderView_headerLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22GuestUserHandoverSetup29AppSelectionSectionHeaderView_actionButton));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC22GuestUserHandoverSetup29AppSelectionSectionHeaderView_action);

  sub_1000057B4(v3);
}

@end