@interface PrimaryAppleAccountStatusObserver
- (_TtC11SettingsApp33PrimaryAppleAccountStatusObserver)init;
- (void)accountWasAdded:(id)a3;
- (void)accountWasModified:(id)a3;
- (void)accountWasRemoved:(id)a3;
- (void)dealloc;
@end

@implementation PrimaryAppleAccountStatusObserver

- (void)dealloc
{
  v2 = self;
  sub_1000B9CB0();
}

- (void).cxx_destruct
{
  sub_10003CB34(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC11SettingsApp33PrimaryAppleAccountStatusObserver_accountStatus), *(void *)&self->accountStatus[OBJC_IVAR____TtC11SettingsApp33PrimaryAppleAccountStatusObserver_accountStatus], *(void *)&self->accountStatus[OBJC_IVAR____TtC11SettingsApp33PrimaryAppleAccountStatusObserver_accountStatus + 8], *(void *)&self->accountStatus[OBJC_IVAR____TtC11SettingsApp33PrimaryAppleAccountStatusObserver_accountStatus + 16], *(void *)&self->accountStatus[OBJC_IVAR____TtC11SettingsApp33PrimaryAppleAccountStatusObserver_accountStatus + 24], *(void **)&self->accountStatus[OBJC_IVAR____TtC11SettingsApp33PrimaryAppleAccountStatusObserver_accountStatus + 32]);
  sub_100042A1C((uint64_t)self + OBJC_IVAR____TtC11SettingsApp33PrimaryAppleAccountStatusObserver_invalidator);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11SettingsApp33PrimaryAppleAccountStatusObserver_accountStore));
  swift_release();

  swift_bridgeObjectRelease();
}

- (_TtC11SettingsApp33PrimaryAppleAccountStatusObserver)init
{
  result = (_TtC11SettingsApp33PrimaryAppleAccountStatusObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)accountWasAdded:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000BA57C(0xD000000000000013, 0x80000001001289D0);
}

- (void)accountWasRemoved:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000BA57C(0xD000000000000015, 0x80000001001289B0);
}

- (void)accountWasModified:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000BA57C(0xD000000000000016, 0x8000000100128990);
}

@end