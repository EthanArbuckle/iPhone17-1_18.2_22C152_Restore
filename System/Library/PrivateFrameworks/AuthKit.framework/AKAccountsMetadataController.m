@interface AKAccountsMetadataController
- (AKAccountsMetadataController)init;
- (AKAccountsMetadataController)initWithMediaServiceController:(id)a3 localStorageController:(id)a4 metadataService:(id)a5;
- (void)cancelAppIconRequestForClientID:(NSString *)a3 completionHandler:(id)a4;
- (void)fetchAppIconForClientID:(NSString *)a3 iconSize:(CGSize)a4 completionHandler:(id)a5;
- (void)updatePrimaryAppsMetadataWithDeveloperTeams:(NSArray *)a3 forAltDSID:(NSString *)a4 completionHandler:(id)a5;
@end

@implementation AKAccountsMetadataController

- (AKAccountsMetadataController)initWithMediaServiceController:(id)a3 localStorageController:(id)a4 metadataService:(id)a5
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AKAccountsMetadataController_mediaServicesController) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AKAccountsMetadataController_localStorageController) = (Class)a4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AKAccountsMetadataController_metadataService) = (Class)a5;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for AccountsMetadataController();
  id v6 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  return [(AKAccountsMetadataController *)&v8 init];
}

- (void)fetchAppIconForClientID:(NSString *)a3 iconSize:(CGSize)a4 completionHandler:(id)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  uint64_t v10 = sub_1000D70C8(&qword_1002701B0);
  __chkstk_darwin(v10 - 8);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a5);
  v14 = (CGFloat *)swift_allocObject();
  *((void *)v14 + 2) = a3;
  v14[3] = width;
  v14[4] = height;
  *((void *)v14 + 5) = v13;
  *((void *)v14 + 6) = self;
  uint64_t v15 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v12, 1, 1, v15);
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_100271BF0;
  v16[5] = v14;
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_100271198;
  v17[5] = v16;
  v18 = a3;
  v19 = self;
  sub_1001538E0((uint64_t)v12, (uint64_t)&unk_100271C00, (uint64_t)v17);
  swift_release();
}

- (void)cancelAppIconRequestForClientID:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_1000D70C8(&qword_1002701B0);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100271BD0;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100271BD8;
  v14[5] = v13;
  uint64_t v15 = a3;
  v16 = self;
  sub_1001538E0((uint64_t)v9, (uint64_t)&unk_100271BE0, (uint64_t)v14);
  swift_release();
}

- (void)updatePrimaryAppsMetadataWithDeveloperTeams:(NSArray *)a3 forAltDSID:(NSString *)a4 completionHandler:(id)a5
{
  uint64_t v9 = sub_1000D70C8(&qword_1002701B0);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100271BC0;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_10026FD30;
  v16[5] = v15;
  uint64_t v17 = a3;
  v18 = a4;
  v19 = self;
  sub_1001538E0((uint64_t)v11, (uint64_t)&unk_1002701D0, (uint64_t)v16);
  swift_release();
}

- (AKAccountsMetadataController)init
{
  result = (AKAccountsMetadataController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
}

@end