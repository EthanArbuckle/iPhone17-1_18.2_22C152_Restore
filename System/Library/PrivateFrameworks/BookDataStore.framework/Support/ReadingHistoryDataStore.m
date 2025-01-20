@interface ReadingHistoryDataStore
- (void)_handleSignificantDateChange:(id)a3;
@end

@implementation ReadingHistoryDataStore

- (void)_handleSignificantDateChange:(id)a3
{
  uint64_t v3 = sub_1001EACA0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1001EAC80();
  swift_retain();
  ReadingHistoryDataStore.handleSignificantDateChange()();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

@end