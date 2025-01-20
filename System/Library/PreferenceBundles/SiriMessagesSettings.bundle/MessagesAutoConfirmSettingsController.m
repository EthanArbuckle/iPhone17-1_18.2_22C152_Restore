@interface MessagesAutoConfirmSettingsController
- (_TtC20SiriMessagesSettings37MessagesAutoConfirmSettingsController)initWithCoder:(id)a3;
- (_TtC20SiriMessagesSettings37MessagesAutoConfirmSettingsController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)getMessageWithoutConfCarPlayEnabledWithSpecifier:(id)a3;
- (id)getMessageWithoutConfEnabledWithSpecifier:(id)a3;
- (id)getMessageWithoutConfHeadphonesEnabledWithSpecifier:(id)a3;
- (id)specifiers;
- (void)setMessageWithoutConfCarPlayEnabled:(id)a3 specifier:(id)a4;
- (void)setMessageWithoutConfEnabled:(id)a3 specifier:(id)a4;
- (void)setMessageWithoutConfHeadphonesEnabled:(id)a3 specifier:(id)a4;
@end

@implementation MessagesAutoConfirmSettingsController

- (id)specifiers
{
  v2 = self;
  sub_1F504();
  uint64_t v4 = v3;

  if (v4)
  {
    v5.super.isa = sub_25410().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v5.super.isa = 0;
  }

  return v5.super.isa;
}

- (void)setMessageWithoutConfEnabled:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1F9A8();
}

- (id)getMessageWithoutConfEnabledWithSpecifier:(id)a3
{
  id v4 = a3;
  NSArray v5 = self;
  v6.super.super.isa = sub_1FE1C().super.super.isa;

  return v6.super.super.isa;
}

- (void)setMessageWithoutConfHeadphonesEnabled:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v9 = self;
  sub_20578((uint64_t)v6, v8);
}

- (id)getMessageWithoutConfHeadphonesEnabledWithSpecifier:(id)a3
{
  id v4 = a3;
  NSArray v5 = self;
  v6.super.super.isa = sub_20604((uint64_t)v5).super.super.isa;

  return v6.super.super.isa;
}

- (void)setMessageWithoutConfCarPlayEnabled:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v9 = self;
  sub_20674((uint64_t)v6, v8);
}

- (id)getMessageWithoutConfCarPlayEnabledWithSpecifier:(id)a3
{
  id v4 = a3;
  NSArray v5 = self;
  v6.super.super.isa = sub_20920((uint64_t)v5).super.super.isa;

  return v6.super.super.isa;
}

- (_TtC20SiriMessagesSettings37MessagesAutoConfirmSettingsController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_253A0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC20SiriMessagesSettings37MessagesAutoConfirmSettingsController *)sub_20B9C(v5, v7, a4);
}

- (_TtC20SiriMessagesSettings37MessagesAutoConfirmSettingsController)initWithCoder:(id)a3
{
  return (_TtC20SiriMessagesSettings37MessagesAutoConfirmSettingsController *)sub_20CB8(a3);
}

- (void).cxx_destruct
{
  uint64_t v3 = *(void **)&self->PSListController_opaque[OBJC_IVAR____TtC20SiriMessagesSettings37MessagesAutoConfirmSettingsController_carPlaySpecifier];
}

@end