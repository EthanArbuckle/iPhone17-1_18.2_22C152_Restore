@interface GKLocalPlayer(Friends)
- (uint64_t)canSendFriendRequest;
- (uint64_t)presentFriendRequestCreatorFromViewController:()Friends error:;
- (void)openMessagesWith:()Friends recipient:groupId:;
- (void)sendFriendInviteTo:()Friends groupId:;
@end

@implementation GKLocalPlayer(Friends)

- (uint64_t)canSendFriendRequest
{
  return 1;
}

- (void)sendFriendInviteTo:()Friends groupId:
{
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:&unk_1F0812810];
  if (v6)
  {
    v9 = [v6 identifier];
    [v8 setObject:v9 forKeyedSubscript:@"recipient"];
    v10 = [v6 identifier];
    [v8 setObject:v10 forKeyedSubscript:@"recipientContactIdentifier"];
  }
  else
  {
    v9 = 0;
  }
  v11 = [MEMORY[0x1E4F637E8] shared];
  int v12 = [v11 fetchFriendCodeInExtensionEnabled];

  if (v12)
  {
    [a1 openMessagesWith:v8 recipient:v9 groupId:v7];
  }
  else
  {
    v13 = [MEMORY[0x1E4F63760] localPlayer];
    v14 = [MEMORY[0x1E4F29128] UUID];
    v15 = [v14 UUIDString];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __53__GKLocalPlayer_Friends__sendFriendInviteTo_groupId___block_invoke;
    v16[3] = &unk_1E5F669B0;
    id v17 = v8;
    v18 = a1;
    id v19 = v9;
    id v20 = v7;
    [v13 createFriendRequestWithIdentifier:v15 handler:v16];
  }
}

- (void)openMessagesWith:()Friends recipient:groupId:
{
  v29[5] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  id v27 = 0;
  uint64_t v9 = [MEMORY[0x1E4F28D90] dataWithJSONObject:a3 options:1 error:&v27];
  id v25 = v27;
  v26 = (void *)v9;
  v10 = (void *)[[NSString alloc] initWithData:v9 encoding:4];
  id v11 = objc_alloc_init(MEMORY[0x1E4F29088]);
  [v11 setScheme:@"sms-private"];
  [v11 setPath:@"open"];
  uint64_t v12 = [objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"service" value:@"iMessage"];
  v13 = (void *)v12;
  if (v8)
  {
    v29[0] = v12;
    v14 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"groupid" value:v8];
    v29[1] = v14;
    v15 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"chatGUID" value:v8];
    v29[2] = v15;
    id v16 = objc_alloc(MEMORY[0x1E4F290C8]);
    id v17 = (void *)[v16 initWithName:@"appBundleID" value:*MEMORY[0x1E4F63198]];
    v29[3] = v17;
    v18 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"appPayload" value:v10];
    v29[4] = v18;
    [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:5];
    v20 = id v19 = v7;
    [v11 setQueryItems:v20];
  }
  else
  {
    v28[0] = v12;
    v14 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"recipient" value:v7];
    v28[1] = v14;
    id v21 = objc_alloc(MEMORY[0x1E4F290C8]);
    v15 = (void *)[v21 initWithName:@"appBundleID" value:*MEMORY[0x1E4F63198]];
    v28[2] = v15;
    id v17 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"appPayload" value:v10];
    v28[3] = v17;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:4];
    [v11 setQueryItems:v18];
    id v19 = v7;
  }

  v22 = [v11 URL];
  v23 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  v24 = objc_opt_new();
  [v23 openURL:v22 configuration:v24 completionHandler:&__block_literal_global_49];
}

- (uint64_t)presentFriendRequestCreatorFromViewController:()Friends error:
{
  id v6 = a3;
  uint64_t v7 = [a1 canSendFriendRequest];
  if (v7)
  {
    +[GKFriendRequestViewController addFriends:v6];
  }
  else
  {
    *a4 = [MEMORY[0x1E4F28C58] userErrorForCode:103 underlyingError:0];
  }

  return v7;
}

@end