@interface ContactsIntegrationConsentView
- (_TtC12GameCenterUI30ContactsIntegrationConsentView)initWithCoder:(id)a3;
- (void)primaryAction;
- (void)secondaryAction;
@end

@implementation ContactsIntegrationConsentView

- (_TtC12GameCenterUI30ContactsIntegrationConsentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF48C0D4();
}

- (void)primaryAction
{
  v2 = self;
  sub_1AF48C280(1, (uint64_t)sub_1AF48C658);
}

- (void)secondaryAction
{
  v2 = self;
  sub_1AF48C280(0, (uint64_t)sub_1AF48C658);
}

- (void).cxx_destruct
{
  sub_1AF3E32DC((uint64_t)self + OBJC_IVAR____TtC12GameCenterUI30ContactsIntegrationConsentView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI30ContactsIntegrationConsentView_iconImage));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI30ContactsIntegrationConsentView_detailView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI30ContactsIntegrationConsentView_primaryTrayButton));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC12GameCenterUI30ContactsIntegrationConsentView_secondaryTrayButton);
}

@end