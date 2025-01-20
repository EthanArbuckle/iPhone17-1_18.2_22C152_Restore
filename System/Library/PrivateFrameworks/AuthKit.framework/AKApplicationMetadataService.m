@interface AKApplicationMetadataService
- (AKApplicationMetadataService)init;
- (AKApplicationMetadataService)initWithServiceController:(id)a3;
- (void)fetchAuthorizationHTMLResponseTemplateWithCompletion:(id)a3;
- (void)performFetchPrimaryApplicationInformationForClientBundleID:(NSString *)a3 completion:(id)a4;
@end

@implementation AKApplicationMetadataService

- (AKApplicationMetadataService)initWithServiceController:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AKApplicationMetadataService_serviceController) = (Class)a3;
  v7.receiver = self;
  v7.super_class = ObjectType;
  swift_unknownObjectRetain();
  return [(AKApplicationMetadataService *)&v7 init];
}

- (void)performFetchPrimaryApplicationInformationForClientBundleID:(NSString *)a3 completion:(id)a4
{
  uint64_t v7 = sub_1000D70C8(&qword_1002701B0);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1002709E8;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1002709F0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_1001538E0((uint64_t)v9, (uint64_t)&unk_1002709F8, (uint64_t)v14);
  swift_release();
}

- (void)fetchAuthorizationHTMLResponseTemplateWithCompletion:(id)a3
{
  uint64_t v5 = sub_1000D70C8(&qword_1002701B0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1002709C0;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_10026FD30;
  v12[5] = v11;
  v13 = self;
  sub_1001538E0((uint64_t)v7, (uint64_t)&unk_1002701D0, (uint64_t)v12);
  swift_release();
}

- (AKApplicationMetadataService)init
{
  result = (AKApplicationMetadataService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end