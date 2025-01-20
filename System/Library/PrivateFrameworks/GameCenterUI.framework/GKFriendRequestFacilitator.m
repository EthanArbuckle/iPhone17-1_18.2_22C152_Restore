@interface GKFriendRequestFacilitator
+ (void)makeViewControllerForInviteWithRecipients:(id)a3 chatGUID:(id)a4 resultHandler:(id)a5;
@end

@implementation GKFriendRequestFacilitator

+ (void)makeViewControllerForInviteWithRecipients:(id)a3 chatGUID:(id)a4 resultHandler:(id)a5
{
  id v7 = a5;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __95__GKFriendRequestFacilitator_makeViewControllerForInviteWithRecipients_chatGUID_resultHandler___block_invoke;
  v9[3] = &unk_1E5F63B40;
  id v10 = v7;
  id v8 = v7;
  +[FriendRequestFacilitator makeViewControllerForRemoteInviteWithRecipients:a3 chatGUID:a4 resultHandler:v9];
}

void __95__GKFriendRequestFacilitator_makeViewControllerForInviteWithRecipients_chatGUID_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  if (a2) {
    v4 = a2;
  }
  else {
    v4 = a3;
  }
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(void (**)(uint64_t, void *))(v5 + 16);
  id v7 = a3;
  id v8 = a2;
  v6(v5, v4);
}

@end