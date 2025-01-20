@interface WatchFaceSettingsManager
- (_TtC15FocusSettingsUI24WatchFaceSettingsManager)init;
- (void)faceCollectionDidLoad:(id)a3;
@end

@implementation WatchFaceSettingsManager

- (void)faceCollectionDidLoad:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_220E50D5C();
}

- (_TtC15FocusSettingsUI24WatchFaceSettingsManager)init
{
  return (_TtC15FocusSettingsUI24WatchFaceSettingsManager *)sub_220E4EB68();
}

- (void).cxx_destruct
{
  sub_220D67630(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC15FocusSettingsUI24WatchFaceSettingsManager_onLoad));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15FocusSettingsUI24WatchFaceSettingsManager____lazy_storage___watchNPSManager));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC15FocusSettingsUI24WatchFaceSettingsManager__watchFaceDomainAccessor);
}

@end