@interface Plugin
- (_TtC22DonationAccountWatcher6Plugin)init;
- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6;
- (void)dealloc;
@end

@implementation Plugin

- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v13 = self;
  sub_24059582C(a3, a6);
}

- (_TtC22DonationAccountWatcher6Plugin)init
{
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F33468]), sel_init);
  id v3 = objc_allocWithZone((Class)type metadata accessor for Plugin());
  v4 = (_TtC22DonationAccountWatcher6Plugin *)sub_24059574C(v2);

  swift_getObjectType();
  swift_deallocPartialClassInstance();
  objc_msgSend(*(id *)((char *)&v4->super.isa + OBJC_IVAR____TtC22DonationAccountWatcher6Plugin_logger), sel_pluginLoaded);
  return v4;
}

- (void)dealloc
{
  id v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC22DonationAccountWatcher6Plugin_logger);
  id v3 = self;
  objc_msgSend(v2, sel_pluginUnloaded);
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for Plugin();
  [(Plugin *)&v4 dealloc];
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

@end