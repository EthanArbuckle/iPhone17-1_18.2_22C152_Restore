@interface AllFriendsDataSource.FriendDataUpdateDelegate
- (_TtCC12GameCenterUI20AllFriendsDataSourceP33_761C47502D29AA1BE27B103BF361D03024FriendDataUpdateDelegate)init;
- (void)dealloc;
- (void)refreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4;
@end

@implementation AllFriendsDataSource.FriendDataUpdateDelegate

- (void)refreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  sub_1AF7ADFE0();
  v6 = self;
  sub_1AF4DF3FC(v4);

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

- (_TtCC12GameCenterUI20AllFriendsDataSourceP33_761C47502D29AA1BE27B103BF361D03024FriendDataUpdateDelegate)init
{
}

@end