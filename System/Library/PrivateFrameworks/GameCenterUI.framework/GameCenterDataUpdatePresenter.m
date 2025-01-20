@interface GameCenterDataUpdatePresenter
- (_TtC12GameCenterUI29GameCenterDataUpdatePresenter)init;
- (void)dealloc;
- (void)refreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4;
- (void)refreshFriendContents:(id)a3;
- (void)refreshFriendSuggestionContents:(id)a3;
@end

@implementation GameCenterDataUpdatePresenter

- (_TtC12GameCenterUI29GameCenterDataUpdatePresenter)init
{
  return (_TtC12GameCenterUI29GameCenterDataUpdatePresenter *)sub_1AF4A0BEC();
}

- (void)dealloc
{
  v2 = self;
  sub_1AF4A0DEC();
}

- (void).cxx_destruct
{
}

- (void)refreshFriendContents:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AF4A0ED0();
}

- (void)refreshFriendSuggestionContents:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AF4A0F98(v4);
}

- (void)refreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4
{
  uint64_t v6 = sub_1AF7ADFE0();
  v7 = self;
  sub_1AF4A1070(a3, v6);

  swift_bridgeObjectRelease();
}

@end