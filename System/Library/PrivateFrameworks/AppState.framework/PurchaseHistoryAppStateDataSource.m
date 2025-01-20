@interface PurchaseHistoryAppStateDataSource
- (void)purchaseHistoryUpdated:(id)a3;
@end

@implementation PurchaseHistoryAppStateDataSource

- (void)purchaseHistoryUpdated:(id)a3
{
  uint64_t v3 = sub_230811EC8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_230811EA8();
  swift_retain();
  sub_2307FF1B8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

@end