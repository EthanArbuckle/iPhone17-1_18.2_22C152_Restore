@interface CSCloudSharing
+ (void)addParticipantsToShare:(id)a3 containerSetupInfo:(id)a4 emailAddresses:(id)a5 phoneNumbers:(id)a6 completionHandler:(id)a7;
+ (void)addParticipantsToShare:(id)a3 containerSetupInfo:(id)a4 emailAddresses:(id)a5 phoneNumbers:(id)a6 permissionType:(int64_t)a7 allowOthersToInvite:(BOOL)a8 completionHandler:(id)a9;
+ (void)addParticipantsToShareWithURLWrapper:(id)a3 share:(id)a4 emailAddresses:(id)a5 phoneNumbers:(id)a6 permissionType:(int64_t)a7 allowOthersToInvite:(BOOL)a8 completionHandler:(id)a9;
+ (void)ckMetadataFromShareURL:(id)a3 containerSetupInfo:(id)a4 completionHandler:(id)a5;
+ (void)completeShare:(id)a3 containerSetupInfo:(id)a4 emailAddresses:(id)a5 phoneNumbers:(id)a6 accessType:(int64_t)a7 permissionType:(int64_t)a8 allowOthersToInvite:(BOOL)a9 completionHandler:(id)a10;
+ (void)completeShare:(id)a3 containerSetupInfo:(id)a4 emailAddresses:(id)a5 phoneNumbers:(id)a6 accessType:(int64_t)a7 permissionType:(int64_t)a8 allowOthersToInvite:(BOOL)a9 keepExistingParticipants:(BOOL)a10 completionHandler:(id)a11;
+ (void)existingShareForFileOrFolderURL:(id)a3 completionHandler:(id)a4;
+ (void)messageContentForMail:(id)a3 share:(id)a4 fileURL:(id)a5 appName:(id)a6 appIconData:(id)a7 completionHandler:(id)a8;
+ (void)removeFromShare:(id)a3 containerSetupInfo:(id)a4 completionHandler:(id)a5;
+ (void)removeFromShareFileURL:(id)a3 completionHandler:(id)a4;
+ (void)removeFromShareURL:(id)a3 containerSetupInfo:(id)a4 completionHandler:(id)a5;
+ (void)shareFileOrFolderShareURL:(id)a3 emailAddresses:(id)a4 phoneNumbers:(id)a5 accessType:(int64_t)a6 permissionType:(int64_t)a7 allowOthersToInvite:(BOOL)a8 keepExistingParticipants:(BOOL)a9 completionHandler:(id)a10;
+ (void)shareFileOrFolderURL:(id)a3 emailAddresses:(id)a4 phoneNumbers:(id)a5 accessType:(int64_t)a6 permissionType:(int64_t)a7 allowOthersToInvite:(BOOL)a8 completionHandler:(id)a9;
+ (void)shareFileOrFolderURL:(id)a3 emailAddresses:(id)a4 phoneNumbers:(id)a5 accessType:(int64_t)a6 permissionType:(int64_t)a7 allowOthersToInvite:(BOOL)a8 keepExistingParticipants:(BOOL)a9 completionHandler:(id)a10;
+ (void)shareFolderRemovingSubshares:(id)a3 emailAddresses:(id)a4 phoneNumbers:(id)a5 accessType:(int64_t)a6 permissionType:(int64_t)a7 allowOthersToInvite:(BOOL)a8 completionHandler:(id)a9;
+ (void)shareOrUpdateShareURL:(id)a3 containerSetupInfo:(id)a4 emailAddresses:(id)a5 phoneNumbers:(id)a6 accessType:(int64_t)a7 permissionType:(int64_t)a8 allowOthersToInvite:(BOOL)a9 completionHandler:(id)a10;
+ (void)sharingStatusForFileOrFolderURL:(id)a3 completionHandler:(id)a4;
+ (void)sharingStatusForShare:(id)a3 completionHandler:(id)a4;
+ (void)updateShare:(id)a3 containerSetupInfo:(id)a4 completionHandler:(id)a5;
+ (void)userNameAndEmail:(id)a3 containerSetupInfo:(id)a4 completionHandler:(id)a5;
@end

@implementation CSCloudSharing

+ (void)sharingStatusForFileOrFolderURL:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(_TtC12CloudSharing15InitiateSharing);
  [(InitiateSharing *)v7 callForSharingStatus:v6 reply:v5];
}

+ (void)shareFileOrFolderURL:(id)a3 emailAddresses:(id)a4 phoneNumbers:(id)a5 accessType:(int64_t)a6 permissionType:(int64_t)a7 allowOthersToInvite:(BOOL)a8 completionHandler:(id)a9
{
  BOOL v9 = a8;
  id v15 = a9;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  v19 = objc_alloc_init(_TtC12CloudSharing15InitiateSharing);
  [(InitiateSharing *)v19 callForFileSharing:v18 emailAddresses:v17 phoneNumbers:v16 accessType:a6 permissionType:a7 allowOthersToInvite:v9 reply:v15];
}

+ (void)completeShare:(id)a3 containerSetupInfo:(id)a4 emailAddresses:(id)a5 phoneNumbers:(id)a6 accessType:(int64_t)a7 permissionType:(int64_t)a8 allowOthersToInvite:(BOOL)a9 completionHandler:(id)a10
{
  id v16 = a10;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  v22 = objc_alloc_init(_TtC12CloudSharing15InitiateSharing);
  LOBYTE(v21) = a9;
  [(InitiateSharing *)v22 callForCloudKitAddToShare:v20 containerSetupInfo:v19 emailAddresses:v18 phoneNumbers:v17 accessType:a7 permissionType:a8 allowOthersToInvite:v21 reply:v16];
}

+ (void)shareOrUpdateShareURL:(id)a3 containerSetupInfo:(id)a4 emailAddresses:(id)a5 phoneNumbers:(id)a6 accessType:(int64_t)a7 permissionType:(int64_t)a8 allowOthersToInvite:(BOOL)a9 completionHandler:(id)a10
{
  id v16 = a10;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  v22 = objc_alloc_init(_TtC12CloudSharing15InitiateSharing);
  LOBYTE(v21) = a9;
  [(InitiateSharing *)v22 callForSharingURLAddToShare:v20 containerSetupInfo:v19 emailAddresses:v18 phoneNumbers:v17 accessType:a7 permissionType:a8 allowOthersToInvite:v21 reply:v16];
}

+ (void)removeFromShareURL:(id)a3 containerSetupInfo:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_alloc_init(_TtC12CloudSharing15InitiateSharing);
  [(InitiateSharing *)v10 callForSharingURLRemoveShare:v9 containerSetupInfo:v8 reply:v7];
}

+ (void)removeFromShare:(id)a3 containerSetupInfo:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_alloc_init(_TtC12CloudSharing15InitiateSharing);
  [(InitiateSharing *)v10 callForRemoveShare:v9 containerSetupInfo:v8 reply:v7];
}

+ (void)removeFromShareFileURL:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(_TtC12CloudSharing15InitiateSharing);
  [(InitiateSharing *)v7 callForFileURLRemoveShare:v6 reply:v5];
}

+ (void)messageContentForMail:(id)a3 share:(id)a4 fileURL:(id)a5 appName:(id)a6 appIconData:(id)a7 completionHandler:(id)a8
{
  id v13 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v19 = objc_alloc_init(_TtC12CloudSharing15InitiateSharing);
  [(InitiateSharing *)v19 callForMailContent:v18 share:v17 fileURL:v16 appName:v15 appIconData:v14 reply:v13];
}

+ (void)ckMetadataFromShareURL:(id)a3 containerSetupInfo:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_alloc_init(_TtC12CloudSharing15InitiateSharing);
  [(InitiateSharing *)v10 callForMetadataFromShareURL:v9 containerSetupInfo:v8 reply:v7];
}

+ (void)updateShare:(id)a3 containerSetupInfo:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_alloc_init(_TtC12CloudSharing15InitiateSharing);
  [(InitiateSharing *)v10 callForUpdateShare:v9 containerSetupInfo:v8 reply:v7];
}

+ (void)sharingStatusForShare:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(_TtC12CloudSharing15InitiateSharing);
  [(InitiateSharing *)v7 callForCurrentUserSharingStatus:v6 reply:v5];
}

+ (void)addParticipantsToShare:(id)a3 containerSetupInfo:(id)a4 emailAddresses:(id)a5 phoneNumbers:(id)a6 completionHandler:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = objc_alloc_init(_TtC12CloudSharing15InitiateSharing);
  [(InitiateSharing *)v16 callForAddParticipantsToShare:v15 containerSetupInfo:v14 emailAddresses:v13 phoneNumbers:v12 reply:v11];
}

+ (void)addParticipantsToShareWithURLWrapper:(id)a3 share:(id)a4 emailAddresses:(id)a5 phoneNumbers:(id)a6 permissionType:(int64_t)a7 allowOthersToInvite:(BOOL)a8 completionHandler:(id)a9
{
  BOOL v9 = a8;
  id v15 = a9;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  id v20 = objc_alloc_init(_TtC12CloudSharing15InitiateSharing);
  [(InitiateSharing *)v20 callForAddParticipantsToShareWithURLWrapper:v19 share:v18 emailAddresses:v17 phoneNumbers:v16 permissionType:a7 allowOthersToInvite:v9 reply:v15];
}

+ (void)addParticipantsToShare:(id)a3 containerSetupInfo:(id)a4 emailAddresses:(id)a5 phoneNumbers:(id)a6 permissionType:(int64_t)a7 allowOthersToInvite:(BOOL)a8 completionHandler:(id)a9
{
  BOOL v9 = a8;
  id v15 = a9;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  id v20 = objc_alloc_init(_TtC12CloudSharing15InitiateSharing);
  [(InitiateSharing *)v20 callForAddParticipantsToShare:v19 containerSetupInfo:v18 emailAddresses:v17 phoneNumbers:v16 permissionType:a7 allowOthersToInvite:v9 reply:v15];
}

+ (void)existingShareForFileOrFolderURL:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(_TtC12CloudSharing15InitiateSharing);
  [(InitiateSharing *)v7 callForExistingShareForFile:v6 reply:v5];
}

+ (void)userNameAndEmail:(id)a3 containerSetupInfo:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_alloc_init(_TtC12CloudSharing15InitiateSharing);
  [(InitiateSharing *)v10 callForUserNameAndEmail:v9 containerSetupInfo:v8 reply:v7];
}

+ (void)shareFolderRemovingSubshares:(id)a3 emailAddresses:(id)a4 phoneNumbers:(id)a5 accessType:(int64_t)a6 permissionType:(int64_t)a7 allowOthersToInvite:(BOOL)a8 completionHandler:(id)a9
{
  BOOL v9 = a8;
  id v15 = a9;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v19 = objc_alloc_init(_TtC12CloudSharing15InitiateSharing);
  [(InitiateSharing *)v19 callForForciblyShareFolder:v18 emailAddresses:v17 phoneNumbers:v16 accessType:a6 permissionType:a7 allowOthersToInvite:v9 reply:v15];
}

+ (void)shareFileOrFolderURL:(id)a3 emailAddresses:(id)a4 phoneNumbers:(id)a5 accessType:(int64_t)a6 permissionType:(int64_t)a7 allowOthersToInvite:(BOOL)a8 keepExistingParticipants:(BOOL)a9 completionHandler:(id)a10
{
  BOOL v10 = a8;
  id v17 = a10;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __156__CSCloudSharing_shareFileOrFolderURL_emailAddresses_phoneNumbers_accessType_permissionType_allowOthersToInvite_keepExistingParticipants_completionHandler___block_invoke;
  v19[3] = &unk_1E648DF28;
  id v20 = v17;
  id v18 = v17;
  [a1 shareFileOrFolderURL:a3 emailAddresses:a4 phoneNumbers:a5 accessType:a6 permissionType:a7 allowOthersToInvite:v10 completionHandler:v19];
}

uint64_t __156__CSCloudSharing_shareFileOrFolderURL_emailAddresses_phoneNumbers_accessType_permissionType_allowOthersToInvite_keepExistingParticipants_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)completeShare:(id)a3 containerSetupInfo:(id)a4 emailAddresses:(id)a5 phoneNumbers:(id)a6 accessType:(int64_t)a7 permissionType:(int64_t)a8 allowOthersToInvite:(BOOL)a9 keepExistingParticipants:(BOOL)a10 completionHandler:(id)a11
{
  id v18 = a11;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __168__CSCloudSharing_completeShare_containerSetupInfo_emailAddresses_phoneNumbers_accessType_permissionType_allowOthersToInvite_keepExistingParticipants_completionHandler___block_invoke;
  v21[3] = &unk_1E648DF28;
  id v22 = v18;
  id v19 = v18;
  LOBYTE(v20) = a9;
  [a1 completeShare:a3 containerSetupInfo:a4 emailAddresses:a5 phoneNumbers:a6 accessType:a7 permissionType:a8 allowOthersToInvite:v20 completionHandler:v21];
}

uint64_t __168__CSCloudSharing_completeShare_containerSetupInfo_emailAddresses_phoneNumbers_accessType_permissionType_allowOthersToInvite_keepExistingParticipants_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)shareFileOrFolderShareURL:(id)a3 emailAddresses:(id)a4 phoneNumbers:(id)a5 accessType:(int64_t)a6 permissionType:(int64_t)a7 allowOthersToInvite:(BOOL)a8 keepExistingParticipants:(BOOL)a9 completionHandler:(id)a10
{
  BOOL v10 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v11 = *MEMORY[0x1E4F592A8];
  id v12 = (void (**)(id, void, id))a10;
  id v13 = [v10 errorWithDomain:v11 code:9 userInfo:0];
  v12[2](v12, 0, v13);
}

@end