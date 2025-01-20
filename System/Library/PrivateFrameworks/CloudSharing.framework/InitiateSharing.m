@interface InitiateSharing
- (_TtC12CloudSharing15InitiateSharing)init;
- (void)callForAddParticipantsToShare:(id)a3 containerSetupInfo:(id)a4 emailAddresses:(id)a5 phoneNumbers:(id)a6 permissionType:(int64_t)a7 allowOthersToInvite:(BOOL)a8 reply:(id)a9;
- (void)callForAddParticipantsToShare:(id)a3 containerSetupInfo:(id)a4 emailAddresses:(id)a5 phoneNumbers:(id)a6 reply:(id)a7;
- (void)callForAddParticipantsToShareWithURLWrapper:(id)a3 share:(id)a4 emailAddresses:(id)a5 phoneNumbers:(id)a6 permissionType:(int64_t)a7 allowOthersToInvite:(BOOL)a8 reply:(id)a9;
- (void)callForCloudKitAddToShare:(id)a3 containerSetupInfo:(id)a4 emailAddresses:(id)a5 phoneNumbers:(id)a6 accessType:(int64_t)a7 permissionType:(int64_t)a8 allowOthersToInvite:(BOOL)a9 reply:(id)aBlock;
- (void)callForCurrentUserSharingStatus:(id)a3 reply:(id)a4;
- (void)callForExistingShareForFile:(id)a3 reply:(id)a4;
- (void)callForFileSharing:(id)a3 emailAddresses:(id)a4 phoneNumbers:(id)a5 accessType:(int64_t)a6 permissionType:(int64_t)a7 allowOthersToInvite:(BOOL)a8 reply:(id)a9;
- (void)callForFileURLRemoveShare:(id)a3 reply:(id)a4;
- (void)callForForciblyShareFolder:(id)a3 emailAddresses:(id)a4 phoneNumbers:(id)a5 accessType:(int64_t)a6 permissionType:(int64_t)a7 allowOthersToInvite:(BOOL)a8 reply:(id)a9;
- (void)callForMailContent:(id)a3 share:(id)a4 fileURL:(id)a5 appName:(id)a6 appIconData:(id)a7 reply:(id)a8;
- (void)callForMetadataFromShareURL:(id)a3 containerSetupInfo:(id)a4 reply:(id)a5;
- (void)callForRemoveShare:(id)a3 containerSetupInfo:(id)a4 reply:(id)a5;
- (void)callForSharingStatus:(id)a3 reply:(id)a4;
- (void)callForSharingURLAddToShare:(id)a3 containerSetupInfo:(id)a4 emailAddresses:(id)a5 phoneNumbers:(id)a6 accessType:(int64_t)a7 permissionType:(int64_t)a8 allowOthersToInvite:(BOOL)a9 reply:(id)a10;
- (void)callForSharingURLRemoveShare:(id)a3 containerSetupInfo:(id)a4 reply:(id)a5;
- (void)callForUpdateShare:(id)a3 containerSetupInfo:(id)a4 reply:(id)a5;
- (void)callForUserNameAndEmail:(id)a3 containerSetupInfo:(id)a4 reply:(id)a5;
@end

@implementation InitiateSharing

- (void)callForSharingStatus:(id)a3 reply:(id)a4
{
}

- (void)callForFileSharing:(id)a3 emailAddresses:(id)a4 phoneNumbers:(id)a5 accessType:(int64_t)a6 permissionType:(int64_t)a7 allowOthersToInvite:(BOOL)a8 reply:(id)a9
{
}

- (void)callForCloudKitAddToShare:(id)a3 containerSetupInfo:(id)a4 emailAddresses:(id)a5 phoneNumbers:(id)a6 accessType:(int64_t)a7 permissionType:(int64_t)a8 allowOthersToInvite:(BOOL)a9 reply:(id)aBlock
{
  v15 = _Block_copy(aBlock);
  uint64_t v16 = sub_1C38BCF58();
  uint64_t v17 = sub_1C38BCF58();
  _Block_copy(v15);
  id v18 = a3;
  id v19 = a4;
  v20 = self;
  sub_1C38B3CDC(v18, v19, v16, v17, a7, a8, a9, (void (**)(const void *, void *, void, void *))v15);
  _Block_release(v15);
  _Block_release(v15);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)callForSharingURLAddToShare:(id)a3 containerSetupInfo:(id)a4 emailAddresses:(id)a5 phoneNumbers:(id)a6 accessType:(int64_t)a7 permissionType:(int64_t)a8 allowOthersToInvite:(BOOL)a9 reply:(id)a10
{
  uint64_t v21 = a7;
  uint64_t v22 = a8;
  uint64_t v12 = sub_1C38BCE68();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790](v12);
  v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = _Block_copy(a10);
  sub_1C38BCE58();
  uint64_t v17 = sub_1C38BCF58();
  uint64_t v18 = sub_1C38BCF58();
  _Block_copy(v16);
  id v19 = a4;
  v20 = self;
  sub_1C38B4994((uint64_t)v15, v19, v17, v18, v21, v22, a9, v16);
  _Block_release(v16);
  _Block_release(v16);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

- (void)callForSharingURLRemoveShare:(id)a3 containerSetupInfo:(id)a4 reply:(id)a5
{
}

- (void)callForRemoveShare:(id)a3 containerSetupInfo:(id)a4 reply:(id)a5
{
}

- (void)callForFileURLRemoveShare:(id)a3 reply:(id)a4
{
}

- (void)callForMailContent:(id)a3 share:(id)a4 fileURL:(id)a5 appName:(id)a6 appIconData:(id)a7 reply:(id)a8
{
  v31 = self;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EC0276A8);
  MEMORY[0x1F4188790](v12 - 8);
  uint64_t v14 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_1C38BCE68();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x1F4188790](v15);
  uint64_t v18 = (char *)&v30 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v19 = _Block_copy(a8);
  sub_1C38BCE58();
  if (a5)
  {
    sub_1C38BCE58();
    uint64_t v20 = 0;
  }
  else
  {
    uint64_t v20 = 1;
  }
  uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56);
  uint64_t v30 = v15;
  v21(v14, v20, 1, v15);
  uint64_t v22 = sub_1C38BCF08();
  unint64_t v24 = v23;
  v25 = a4;
  id v26 = a7;
  v31 = v31;
  uint64_t v27 = sub_1C38BCE98();
  unint64_t v29 = v28;

  _Block_copy(v19);
  sub_1C38B6818((uint64_t)v18, v25, (uint64_t)v14, v22, v24, v27, v29, v19);
  _Block_release(v19);
  _Block_release(v19);
  sub_1C38B2500(v27, v29);

  swift_bridgeObjectRelease();
  sub_1C38B2404((uint64_t)v14);
  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v30);
}

- (void)callForMetadataFromShareURL:(id)a3 containerSetupInfo:(id)a4 reply:(id)a5
{
}

- (void)callForUpdateShare:(id)a3 containerSetupInfo:(id)a4 reply:(id)a5
{
}

- (void)callForCurrentUserSharingStatus:(id)a3 reply:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  sub_1C38B8264(v7, (void (**)(void, void, void))v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)callForAddParticipantsToShare:(id)a3 containerSetupInfo:(id)a4 emailAddresses:(id)a5 phoneNumbers:(id)a6 reply:(id)a7
{
  v10 = _Block_copy(a7);
  uint64_t v11 = sub_1C38BCF58();
  uint64_t v12 = sub_1C38BCF58();
  _Block_copy(v10);
  id v13 = a3;
  id v14 = a4;
  uint64_t v15 = self;
  sub_1C38B86EC(v13, v14, v11, v12, (void (**)(const void *, void *, void, void *))v10);
  _Block_release(v10);
  _Block_release(v10);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)callForAddParticipantsToShareWithURLWrapper:(id)a3 share:(id)a4 emailAddresses:(id)a5 phoneNumbers:(id)a6 permissionType:(int64_t)a7 allowOthersToInvite:(BOOL)a8 reply:(id)a9
{
}

- (void)callForAddParticipantsToShare:(id)a3 containerSetupInfo:(id)a4 emailAddresses:(id)a5 phoneNumbers:(id)a6 permissionType:(int64_t)a7 allowOthersToInvite:(BOOL)a8 reply:(id)a9
{
}

- (void)callForExistingShareForFile:(id)a3 reply:(id)a4
{
}

- (void)callForUserNameAndEmail:(id)a3 containerSetupInfo:(id)a4 reply:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EC0276A8);
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  if (a3)
  {
    sub_1C38BCE58();
    uint64_t v13 = sub_1C38BCE68();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v11, 0, 1, v13);
  }
  else
  {
    uint64_t v14 = sub_1C38BCE68();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  }
  _Block_copy(v12);
  id v15 = a4;
  uint64_t v16 = self;
  sub_1C38BAD74((uint64_t)v11, a4, (void (**)(void, void, void, void))v12);
  _Block_release(v12);
  _Block_release(v12);

  sub_1C38B2404((uint64_t)v11);
}

- (void)callForForciblyShareFolder:(id)a3 emailAddresses:(id)a4 phoneNumbers:(id)a5 accessType:(int64_t)a6 permissionType:(int64_t)a7 allowOthersToInvite:(BOOL)a8 reply:(id)a9
{
}

- (_TtC12CloudSharing15InitiateSharing)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for InitiateSharing();
  return [(InitiateSharing *)&v3 init];
}

@end