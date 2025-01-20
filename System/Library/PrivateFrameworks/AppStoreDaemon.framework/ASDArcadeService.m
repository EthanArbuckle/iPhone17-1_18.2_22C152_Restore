@interface ASDArcadeService
+ (id)defaultService;
- (ASDArcadeService)init;
- (void)addBadgeIDs:(id)a3 replyHandler:(id)a4;
- (void)allBadgeIDsWithReplyHandler:(id)a3;
- (void)allBadgeMetricsWithReplyHandler:(id)a3;
- (void)badgeCountWithReplyHandler:(id)a3;
- (void)removeAllBadgeIDsWithReplyHandler:(id)a3;
- (void)removeBadgeIDs:(id)a3 replyHandler:(id)a4;
- (void)removeMetricsForBadgeIDs:(id)a3 replyHandler:(id)a4;
@end

@implementation ASDArcadeService

- (void)allBadgeMetricsWithReplyHandler:(id)a3
{
}

- (void)addBadgeIDs:(id)a3 replyHandler:(id)a4
{
}

+ (id)defaultService
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__ASDArcadeService_defaultService__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB4D65C8 != -1) {
    dispatch_once(&qword_1EB4D65C8, block);
  }
  v2 = (void *)_MergedGlobals_48;
  return v2;
}

uint64_t __34__ASDArcadeService_defaultService__block_invoke(uint64_t a1)
{
  _MergedGlobals_48 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x1F41817F8]();
}

- (ASDArcadeService)init
{
  v3 = +[ASDAppStoreService defaultService];
  appstoreService = self->_appstoreService;
  self->_appstoreService = v3;

  return self;
}

- (void)allBadgeIDsWithReplyHandler:(id)a3
{
}

- (void)removeAllBadgeIDsWithReplyHandler:(id)a3
{
}

- (void)removeBadgeIDs:(id)a3 replyHandler:(id)a4
{
}

- (void)removeMetricsForBadgeIDs:(id)a3 replyHandler:(id)a4
{
}

- (void)badgeCountWithReplyHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end