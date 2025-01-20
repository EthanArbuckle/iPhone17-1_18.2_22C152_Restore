@interface FriendRequestsDataSource.FriendRequestDataUpdateDelegate
- (_TtCC12GameCenterUI24FriendRequestsDataSourceP33_EC238EB52926426EF919E35F59F47DC431FriendRequestDataUpdateDelegate)init;
- (void)dealloc;
- (void)refreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4;
@end

@implementation FriendRequestsDataSource.FriendRequestDataUpdateDelegate

- (void)refreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  sub_1AF7ADFE0();
  v6 = self;
  sub_1AF4DDFE4(v4);

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

- (_TtCC12GameCenterUI24FriendRequestsDataSourceP33_EC238EB52926426EF919E35F59F47DC431FriendRequestDataUpdateDelegate)init
{
}

@end