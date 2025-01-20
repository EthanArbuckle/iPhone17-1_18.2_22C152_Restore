@interface ManualSyncSuccessEvent
+ (NSString)name;
- (_TtC9storekitd22ManualSyncSuccessEvent)init;
- (int64_t)modifiedOrAddedStatusesCount;
- (int64_t)modifiedOrAddedTransactionsCount;
- (int64_t)transactionsCountDifference;
- (void)setModifiedOrAddedStatusesCount:(int64_t)a3;
- (void)setModifiedOrAddedTransactionsCount:(int64_t)a3;
- (void)setTransactionsCountDifference:(int64_t)a3;
@end

@implementation ManualSyncSuccessEvent

+ (NSString)name
{
  return (NSString *)sub_100113798((uint64_t)a1, (uint64_t)a2, (void (*)(void))sub_10011309C);
}

- (int64_t)transactionsCountDifference
{
  return sub_1001130D8();
}

- (void)setTransactionsCountDifference:(int64_t)a3
{
}

- (int64_t)modifiedOrAddedTransactionsCount
{
  return sub_10011313C();
}

- (void)setModifiedOrAddedTransactionsCount:(int64_t)a3
{
}

- (int64_t)modifiedOrAddedStatusesCount
{
  return sub_1001131A0();
}

- (void)setModifiedOrAddedStatusesCount:(int64_t)a3
{
}

- (_TtC9storekitd22ManualSyncSuccessEvent)init
{
  return (_TtC9storekitd22ManualSyncSuccessEvent *)sub_1001131E0();
}

@end