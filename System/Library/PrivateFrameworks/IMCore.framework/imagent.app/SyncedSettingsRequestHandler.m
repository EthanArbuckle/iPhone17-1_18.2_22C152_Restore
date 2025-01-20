@interface SyncedSettingsRequestHandler
- (_TtC7imagent28SyncedSettingsRequestHandler)init;
- (void)fetchSettingValueForKey:(int64_t)a3 reply:(id)a4;
- (void)setSettingValue:(id)a3 forKey:(int64_t)a4;
@end

@implementation SyncedSettingsRequestHandler

- (_TtC7imagent28SyncedSettingsRequestHandler)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7imagent28SyncedSettingsRequestHandler_requiredCapabilities) = (Class)0x20000000;
  uint64_t v3 = OBJC_IVAR____TtC7imagent28SyncedSettingsRequestHandler_syncedSettingManager;
  id v4 = objc_allocWithZone((Class)sub_10004CFC0());
  v5 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)[v4 init];

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for SyncedSettingsRequestHandler();
  return [(SyncedSettingsRequestHandler *)&v7 init];
}

- (void)fetchSettingValueForKey:(int64_t)a3 reply:(id)a4
{
  v5 = (void (**)(void *, uint64_t))_Block_copy(a4);
  v6 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0x60);
  objc_super v7 = self;
  uint64_t v8 = v6();
  if (v8)
  {
    v9 = (void *)v8;
    sub_10004CFB0();
  }
  else
  {
    memset(v18, 0, sizeof(v18));
  }
  sub_10003A2A4((uint64_t)v18, (uint64_t)v16);
  uint64_t v10 = v17;
  if (v17)
  {
    v11 = sub_10003408C(v16, v17);
    uint64_t v12 = *(void *)(v10 - 8);
    __chkstk_darwin(v11);
    v14 = (char *)v16 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v12 + 16))(v14);
    uint64_t v15 = sub_10004D4A0();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v10);
    sub_100007168((uint64_t)v16);
  }
  else
  {
    uint64_t v15 = 0;
  }
  v5[2](v5, v15);
  swift_unknownObjectRelease();
  sub_10003A244((uint64_t)v18);
  _Block_release(v5);
}

- (void)setSettingValue:(id)a3 forKey:(int64_t)a4
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_10004D360();
  uint64_t v6 = swift_unknownObjectRelease();
  uint64_t v7 = (*(uint64_t (**)(uint64_t))((swift_isaMask & (uint64_t)v5->super.isa) + 0x60))(v6);
  if (v7)
  {
    uint64_t v8 = (_TtC7imagent28SyncedSettingsRequestHandler *)v7;
    sub_10004CFA0();

    v5 = v8;
  }

  sub_100007168((uint64_t)&v9);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7imagent28SyncedSettingsRequestHandler_syncedSettingManager));
}

@end