@interface FriendRequestFacilitator
+ (void)makeViewControllerForRemoteInviteWithRecipients:(id)a3 chatGUID:(id)a4 resultHandler:(id)a5;
+ (void)makeViewControllerWithRecipients:(NSArray *)a3 chatGUID:(NSString *)a4 completionHandler:(id)a5;
- (_TtC12GameCenterUI24FriendRequestFacilitator)init;
@end

@implementation FriendRequestFacilitator

- (_TtC12GameCenterUI24FriendRequestFacilitator)init
{
  return (_TtC12GameCenterUI24FriendRequestFacilitator *)FriendRequestFacilitator.init()();
}

+ (void)makeViewControllerWithRecipients:(NSArray *)a3 chatGUID:(NSString *)a4 completionHandler:(id)a5
{
  v8 = _Block_copy(a5);
  v9 = (void *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = a1;
  v10 = a3;
  v11 = a4;

  sub_1AF68221C((uint64_t)&unk_1E9ACD230, (uint64_t)v9);
}

+ (void)makeViewControllerForRemoteInviteWithRecipients:(id)a3 chatGUID:(id)a4 resultHandler:(id)a5
{
  v6 = _Block_copy(a5);
  sub_1AF36A648(0, (unint64_t *)&qword_1E9AC74C0);
  uint64_t v7 = sub_1AF7AE2B0();
  if (a4)
  {
    uint64_t v8 = sub_1AF7AE0E0();
    a4 = v9;
  }
  else
  {
    uint64_t v8 = 0;
  }
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v6;
  swift_getObjCClassMetadata();
  static FriendRequestFacilitator.makeViewControllerForRemoteInvite(recipients:chatGUID:resultHandler:)(v7, v8, (uint64_t)a4, (uint64_t)sub_1AF686610, v10);
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end