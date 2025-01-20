@interface AppDownloadDoneTask
- (_TtC9appstored19AppDownloadDoneTask)init;
- (_TtC9appstored19AppDownloadDoneTask)initWithoutKeepAlive;
- (void)mainWithCompletionHandler:(id)a3;
@end

@implementation AppDownloadDoneTask

- (_TtC9appstored19AppDownloadDoneTask)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  self;
  id v3 = sub_10030B11C();
  self;
  id v4 = sub_1003E0BA4();
  v5 = (char *)objc_allocWithZone(ObjectType);
  *(void *)&v5[OBJC_IVAR____TtC9appstored19AppDownloadDoneTask_bag] = v3;
  *(void *)&v5[OBJC_IVAR____TtC9appstored19AppDownloadDoneTask_store] = v4;
  v8.receiver = v5;
  v8.super_class = ObjectType;
  v6 = [(Task *)&v8 init];
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v6;
}

- (void)mainWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10001644C(&qword_1005A4640);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_super v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1005A55B8;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1005A35A0;
  v12[5] = v11;
  v13 = self;
  sub_1000DFAB0((uint64_t)v7, (uint64_t)&unk_1005A4930, (uint64_t)v12);
  swift_release();
}

- (_TtC9appstored19AppDownloadDoneTask)initWithoutKeepAlive
{
  result = (_TtC9appstored19AppDownloadDoneTask *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC9appstored19AppDownloadDoneTask_store);
}

@end