@interface AppleSilicon
- (BOOL)isRosettaAvailable;
- (BOOL)isSupportEnabled;
- (_TtC19AppStoreKitInternal12AppleSilicon)init;
- (void)setIsSupportEnabled:(BOOL)a3;
@end

@implementation AppleSilicon

- (BOOL)isSupportEnabled
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC19AppStoreKitInternal12AppleSilicon_isSupportEnabled;
  swift_beginAccess();
  return *v2;
}

- (void)setIsSupportEnabled:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR____TtC19AppStoreKitInternal12AppleSilicon_isSupportEnabled;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)isRosettaAvailable
{
  v2 = self;
  char v3 = AppleSilicon.isRosettaAvailable.getter();

  return v3 & 1;
}

- (_TtC19AppStoreKitInternal12AppleSilicon)init
{
  result = (_TtC19AppStoreKitInternal12AppleSilicon *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  char v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC19AppStoreKitInternal12AppleSilicon_rosettaAvailabilityConditionLock);
}

@end