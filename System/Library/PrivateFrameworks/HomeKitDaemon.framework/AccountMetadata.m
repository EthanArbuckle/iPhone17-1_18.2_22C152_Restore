@interface AccountMetadata
- (NSString)firstName;
- (NSString)iCloudAltDSID;
- (NSString)lastName;
- (_TtC13HomeKitDaemon15AccountMetadata)init;
- (void)profilePhotoWithCompletionHandler:(id)a3;
- (void)setFirstName:(id)a3;
- (void)setICloudAltDSID:(id)a3;
- (void)setLastName:(id)a3;
- (void)updateAccountMetadata;
@end

@implementation AccountMetadata

- (NSString)iCloudAltDSID
{
  return (NSString *)sub_22F5EA7CC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC13HomeKitDaemon15AccountMetadata_iCloudAltDSID);
}

- (void)setICloudAltDSID:(id)a3
{
}

- (NSString)firstName
{
  return (NSString *)sub_22F5EA7CC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC13HomeKitDaemon15AccountMetadata_firstName);
}

- (void)setFirstName:(id)a3
{
}

- (NSString)lastName
{
  return (NSString *)sub_22F5EA7CC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC13HomeKitDaemon15AccountMetadata_lastName);
}

- (void)setLastName:(id)a3
{
}

- (_TtC13HomeKitDaemon15AccountMetadata)init
{
  return (_TtC13HomeKitDaemon15AccountMetadata *)AccountMetadata.init()();
}

- (void)updateAccountMetadata
{
  v2 = self;
  AccountMetadata.update()();
}

- (void)profilePhotoWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686D95D0);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_2302DDE70();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_2686D86B8;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2686D8770;
  v12[5] = v11;
  v13 = self;
  sub_22F6C83BC((uint64_t)v7, (uint64_t)&unk_2686D98D0, (uint64_t)v12);
  swift_release();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13HomeKitDaemon15AccountMetadata_accountStore);
}

@end