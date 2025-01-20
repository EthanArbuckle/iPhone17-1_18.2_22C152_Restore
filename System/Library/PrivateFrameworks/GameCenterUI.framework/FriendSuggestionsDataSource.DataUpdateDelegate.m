@interface FriendSuggestionsDataSource.DataUpdateDelegate
- (_TtCC12GameCenterUI27FriendSuggestionsDataSourceP33_F815CB2A6384F01E6B425971DC87B4FC18DataUpdateDelegate)init;
- (void)dealloc;
- (void)refreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4;
@end

@implementation FriendSuggestionsDataSource.DataUpdateDelegate

- (void)refreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  sub_1AF7ADFE0();
  v6 = self;
  sub_1AF4DB468(v4);

  swift_bridgeObjectRelease();
}

- (void)dealloc
{
  v2 = self;
  sub_1AF3B8D94();
}

- (void).cxx_destruct
{
}

- (_TtCC12GameCenterUI27FriendSuggestionsDataSourceP33_F815CB2A6384F01E6B425971DC87B4FC18DataUpdateDelegate)init
{
}

@end