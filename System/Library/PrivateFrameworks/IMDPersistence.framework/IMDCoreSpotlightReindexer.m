@interface IMDCoreSpotlightReindexer
- (IMDCoreSpotlightReindexer)init;
- (IMDCoreSpotlightReindexer)initWithHandles:(id)a3 batchDeferralTime:(int64_t)a4 messageAge:(double)a5 index:(id)a6;
- (void)reindex;
@end

@implementation IMDCoreSpotlightReindexer

- (IMDCoreSpotlightReindexer)initWithHandles:(id)a3 batchDeferralTime:(int64_t)a4 messageAge:(double)a5 index:(id)a6
{
  uint64_t v8 = sub_1AFC71D88();
  swift_unknownObjectRetain();
  v9 = (IMDCoreSpotlightReindexer *)sub_1AFC60214(v8, a4, (uint64_t)a6);
  swift_unknownObjectRelease();
  return v9;
}

- (void)reindex
{
  v2 = self;
  SpotlightReindexer.reindex()();
}

- (IMDCoreSpotlightReindexer)init
{
  result = (IMDCoreSpotlightReindexer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR___IMDCoreSpotlightReindexer_deferralTime;
  uint64_t v4 = sub_1AFC71C08();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  v5 = (char *)self + OBJC_IVAR___IMDCoreSpotlightReindexer_messageAge;
  uint64_t v6 = sub_1AFC5683C((uint64_t *)&unk_1E9AF74B8);
  v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);
  v7(v5, v6);
}

@end