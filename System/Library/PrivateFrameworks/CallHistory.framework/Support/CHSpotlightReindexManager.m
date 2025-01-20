@interface CHSpotlightReindexManager
- (CHSpotlightReindexManager)init;
- (CHSpotlightReindexManager)initWithSpotlightIndexManager:(id)a3;
- (void)handleCallDirectoryIdentitiesChanged;
- (void)handleFaceTimeStatusChanged;
- (void)handleLocaleChanges;
@end

@implementation CHSpotlightReindexManager

- (CHSpotlightReindexManager)initWithSpotlightIndexManager:(id)a3
{
  return (CHSpotlightReindexManager *)sub_1000294F4(a3);
}

- (void)handleLocaleChanges
{
  v2 = self;
  sub_100029A78();
}

- (void)handleFaceTimeStatusChanged
{
  v2 = self;
  sub_100029E44();
}

- (void)handleCallDirectoryIdentitiesChanged
{
  v2 = self;
  sub_1000298C8();
}

- (CHSpotlightReindexManager)init
{
  result = (CHSpotlightReindexManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  v3 = (char *)self + OBJC_IVAR___CHSpotlightReindexManager_logger;
  uint64_t v4 = type metadata accessor for Logger();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

@end