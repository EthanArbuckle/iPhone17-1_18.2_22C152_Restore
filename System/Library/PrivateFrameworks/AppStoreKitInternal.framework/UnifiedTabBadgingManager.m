@interface UnifiedTabBadgingManager
- (_TtC19AppStoreKitInternal24UnifiedTabBadgingManager)init;
- (void)service:(id)a3 didAddBadges:(id)a4;
- (void)service:(id)a3 didRemoveBadges:(id)a4;
@end

@implementation UnifiedTabBadgingManager

- (_TtC19AppStoreKitInternal24UnifiedTabBadgingManager)init
{
  return (_TtC19AppStoreKitInternal24UnifiedTabBadgingManager *)UnifiedTabBadgingManager.init()();
}

- (void)service:(id)a3 didAddBadges:(id)a4
{
}

- (void)service:(id)a3 didRemoveBadges:(id)a4
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal24UnifiedTabBadgingManager_appStoreBadgingService));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC19AppStoreKitInternal24UnifiedTabBadgingManager_rootActionHandler);
  sub_1E160EDD8(v3);
}

@end