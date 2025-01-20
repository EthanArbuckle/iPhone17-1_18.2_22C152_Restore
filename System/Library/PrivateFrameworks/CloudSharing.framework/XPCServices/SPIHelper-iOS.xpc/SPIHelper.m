@interface SPIHelper
- (_TtC13SPIHelper_iOS9SPIHelper)init;
- (void)addParticipantsToShare:(id)a3 containerSetupInfo:(id)a4 emailAddresses:(id)a5 phoneNumbers:(id)a6 permissionType:(int64_t)a7 allowOthersToInvite:(BOOL)a8 withReply:(id)aBlock;
- (void)addParticipantsToShare:(id)a3 containerSetupInfo:(id)a4 emailAddresses:(id)a5 phoneNumbers:(id)a6 withReply:(id)a7;
- (void)addParticipantsToShareWithURLWrapper:(id)a3 share:(id)a4 emailAddresses:(id)a5 phoneNumbers:(id)a6 permissionType:(int64_t)a7 allowOthersToInvite:(BOOL)a8 withReply:(id)aBlock;
- (void)addToCloudKitSharing:(id)a3 containerSetupInfo:(id)a4 emailAddresses:(id)a5 phoneNumbers:(id)a6 accessType:(int64_t)a7 permissionType:(int64_t)a8 allowOthersToInvite:(BOOL)a9 withReply:(id)aBlock;
- (void)addToShareFromSharingURL:(id)a3 containerSetupInfo:(id)a4 emailAddresses:(id)a5 phoneNumbers:(id)a6 accessType:(int64_t)a7 permissionType:(int64_t)a8 allowOthersToInvite:(BOOL)a9 withReply:(id)a10;
- (void)currentUserSharingStatusFor:(id)a3 withReply:(id)a4;
- (void)existingShareForFile:(id)a3 withReply:(id)a4;
- (void)forciblyShareFolder:(id)a3 emailAddresses:(id)a4 phoneNumbers:(id)a5 accessType:(int64_t)a6 permissionType:(int64_t)a7 allowOthersToInvite:(BOOL)a8 withReply:(id)a9;
- (void)getMetadataFromShareFromSharingURL:(id)a3 containerSetupInfo:(id)a4 withReply:(id)a5;
- (void)mailContentFromSharingURL:(id)a3 share:(id)a4 fileURL:(id)a5 appName:(id)a6 appIconData:(id)a7 withReply:(id)a8;
- (void)removeFromShare:(id)a3 containerSetupInfo:(id)a4 withReply:(id)a5;
- (void)removeFromShareForFileURL:(id)a3 withReply:(id)a4;
- (void)removeFromShareFromSharingURL:(id)a3 containerSetupInfo:(id)a4 withReply:(id)a5;
- (void)sharingStatusFor:(id)a3 withReply:(id)a4;
- (void)startFileSharing:(id)a3 emailAddresses:(id)a4 phoneNumbers:(id)a5 accessType:(int64_t)a6 permissionType:(int64_t)a7 allowOthersToInvite:(BOOL)a8 withReply:(id)a9;
- (void)updateShare:(id)a3 containerSetupInfo:(id)a4 withReply:(id)a5;
- (void)userNameAndEmail:(id)a3 containerSetupInfo:(id)a4 withReply:(id)a5;
@end

@implementation SPIHelper

- (void)sharingStatusFor:(id)a3 withReply:(id)a4
{
}

- (void)startFileSharing:(id)a3 emailAddresses:(id)a4 phoneNumbers:(id)a5 accessType:(int64_t)a6 permissionType:(int64_t)a7 allowOthersToInvite:(BOOL)a8 withReply:(id)a9
{
}

- (void)addToCloudKitSharing:(id)a3 containerSetupInfo:(id)a4 emailAddresses:(id)a5 phoneNumbers:(id)a6 accessType:(int64_t)a7 permissionType:(int64_t)a8 allowOthersToInvite:(BOOL)a9 withReply:(id)aBlock
{
  v15 = _Block_copy(aBlock);
  uint64_t v16 = sub_1000A4910();
  uint64_t v17 = sub_1000A4910();
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v15;
  id v21 = a3;
  id v19 = a4;
  v20 = self;
  sub_10005D81C(v21, v19, v16, v17, a7, a8, a9, (uint64_t)sub_100094F1C, v18);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)addToShareFromSharingURL:(id)a3 containerSetupInfo:(id)a4 emailAddresses:(id)a5 phoneNumbers:(id)a6 accessType:(int64_t)a7 permissionType:(int64_t)a8 allowOthersToInvite:(BOOL)a9 withReply:(id)a10
{
  uint64_t v24 = a7;
  uint64_t v25 = a8;
  BOOL v23 = a9;
  uint64_t v12 = sub_1000A42E0();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = _Block_copy(a10);
  sub_1000A42A0();
  uint64_t v17 = sub_1000A4910();
  uint64_t v18 = sub_1000A4910();
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v16;
  id v20 = a4;
  id v21 = self;
  sub_100060D28((uint64_t)v15, a4, v17, v18, v24, v25, v23, (uint64_t)sub_1000940AC, v19);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

- (void)removeFromShareFromSharingURL:(id)a3 containerSetupInfo:(id)a4 withReply:(id)a5
{
  uint64_t v8 = sub_1000A42E0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  sub_1000A42A0();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v12;
  id v14 = a4;
  v15 = self;
  sub_10006B3D8((uint64_t)v11, a4, (uint64_t)sub_100094E94, v13, 0xD00000000000003DLL, 0x80000001000AD220, (uint64_t)&unk_1000C35F0, (uint64_t)&unk_1000CBB50);
  swift_release();

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)removeFromShare:(id)a3 containerSetupInfo:(id)a4 withReply:(id)a5
{
}

- (void)removeFromShareForFileURL:(id)a3 withReply:(id)a4
{
}

- (void)mailContentFromSharingURL:(id)a3 share:(id)a4 fileURL:(id)a5 appName:(id)a6 appIconData:(id)a7 withReply:(id)a8
{
  v34 = self;
  uint64_t v12 = sub_100008704(&qword_1000CA3B0);
  __chkstk_darwin(v12 - 8);
  id v14 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_1000A42E0();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v31 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = _Block_copy(a8);
  sub_1000A42A0();
  if (a5)
  {
    sub_1000A42A0();
    uint64_t v19 = 0;
  }
  else
  {
    uint64_t v19 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v14, v19, 1, v15);
  uint64_t v20 = sub_1000A4800();
  uint64_t v33 = v15;
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  id v24 = a4;
  id v25 = a7;
  v26 = v34;
  uint64_t v27 = sub_1000A4300();
  unint64_t v29 = v28;

  uint64_t v30 = swift_allocObject();
  *(void *)(v30 + 16) = v32;
  sub_100069844(v18, v24, (uint64_t)v14, v21, v23, v27, v29, (uint64_t)sub_10009373C, v30);
  swift_release();
  sub_10000E60C(v27, v29);
  swift_bridgeObjectRelease();

  sub_10000B988((uint64_t)v14, &qword_1000CA3B0);
  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v33);
}

- (void)getMetadataFromShareFromSharingURL:(id)a3 containerSetupInfo:(id)a4 withReply:(id)a5
{
  uint64_t v8 = sub_1000A42E0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  sub_1000A42A0();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v12;
  id v14 = a4;
  uint64_t v15 = self;
  sub_10006B3D8((uint64_t)v11, a4, (uint64_t)sub_1000935B0, v13, 0xD000000000000042, 0x80000001000ACFE0, (uint64_t)&unk_1000C3398, (uint64_t)&unk_1000CBAF8);
  swift_release();

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)updateShare:(id)a3 containerSetupInfo:(id)a4 withReply:(id)a5
{
}

- (void)currentUserSharingStatusFor:(id)a3 withReply:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v9 = a3;
  uint64_t v8 = self;
  sub_10006F08C(v9, (uint64_t)sub_100094E98, v7);
  swift_release();
}

- (void)addParticipantsToShare:(id)a3 containerSetupInfo:(id)a4 emailAddresses:(id)a5 phoneNumbers:(id)a6 withReply:(id)a7
{
  uint64_t v10 = _Block_copy(a7);
  uint64_t v11 = sub_1000A4910();
  uint64_t v12 = sub_1000A4910();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v10;
  id v16 = a3;
  id v14 = a4;
  uint64_t v15 = self;
  sub_10007007C(v16, a4, v11, v12, (uint64_t)sub_100094F1C, v13);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)addParticipantsToShareWithURLWrapper:(id)a3 share:(id)a4 emailAddresses:(id)a5 phoneNumbers:(id)a6 permissionType:(int64_t)a7 allowOthersToInvite:(BOOL)a8 withReply:(id)aBlock
{
  BOOL v9 = a8;
  id v14 = _Block_copy(aBlock);
  uint64_t v15 = sub_1000A4910();
  uint64_t v16 = sub_1000A4910();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v14;
  id v20 = a3;
  id v18 = a4;
  uint64_t v19 = self;
  sub_100073774(a3, a4, 0, v15, v16, a7, v9, (uint64_t)sub_100094F1C, v17);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)addParticipantsToShare:(id)a3 containerSetupInfo:(id)a4 emailAddresses:(id)a5 phoneNumbers:(id)a6 permissionType:(int64_t)a7 allowOthersToInvite:(BOOL)a8 withReply:(id)aBlock
{
  BOOL v9 = a8;
  id v14 = _Block_copy(aBlock);
  uint64_t v15 = sub_1000A4910();
  uint64_t v16 = sub_1000A4910();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v14;
  id v20 = a3;
  id v18 = a4;
  uint64_t v19 = self;
  sub_100073774(0, a3, a4, v15, v16, a7, v9, (uint64_t)sub_100094F1C, v17);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)existingShareForFile:(id)a3 withReply:(id)a4
{
  uint64_t v6 = sub_1000A42E0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  BOOL v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  sub_1000A42A0();
  _Block_copy(v10);
  uint64_t v11 = self;
  sub_100090D7C((uint64_t)v9, v10);
  _Block_release(v10);
  _Block_release(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)userNameAndEmail:(id)a3 containerSetupInfo:(id)a4 withReply:(id)a5
{
  uint64_t v9 = sub_100008704(&qword_1000CA3B0);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  if (a3)
  {
    sub_1000A42A0();
    uint64_t v13 = sub_1000A42E0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v11, 0, 1, v13);
  }
  else
  {
    uint64_t v14 = sub_1000A42E0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  }
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v12;
  id v16 = a4;
  uint64_t v17 = self;
  sub_1000918EC((uint64_t)v11, a4, (uint64_t)sub_100092850, v15);

  swift_release();
  sub_10000B988((uint64_t)v11, &qword_1000CA3B0);
}

- (void)forciblyShareFolder:(id)a3 emailAddresses:(id)a4 phoneNumbers:(id)a5 accessType:(int64_t)a6 permissionType:(int64_t)a7 allowOthersToInvite:(BOOL)a8 withReply:(id)a9
{
}

- (_TtC13SPIHelper_iOS9SPIHelper)init
{
  result = (_TtC13SPIHelper_iOS9SPIHelper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end