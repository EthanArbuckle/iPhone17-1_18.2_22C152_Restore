@interface AAFlushManager
- (AAFlushManager)init;
- (AAFlushManager)initWithAppSessionManager:(id)a3 client:(id)a4 endpoint:(id)a5 config:(id)a6;
- (void)flushWithCompletion:(id)a3;
@end

@implementation AAFlushManager

- (AAFlushManager)initWithAppSessionManager:(id)a3 client:(id)a4 endpoint:(id)a5 config:(id)a6
{
  ObjectType = (objc_class *)swift_getObjectType();
  type metadata accessor for URLSessionUploadClientFactory();
  uint64_t v12 = swift_allocObject();
  id v13 = a4;
  swift_unknownObjectRetain_n();
  id v14 = a6;
  id v15 = v13;
  id v16 = v14;
  id v17 = a3;
  v18 = self;
  uint64_t v19 = swift_retain();
  v20 = sub_1A90BA194(v19, v15, a5, 0, v16, v12);
  swift_release();
  *(Class *)((char *)&v18->super.isa + OBJC_IVAR___AAFlushManager_flushManager) = (Class)v20;

  v23.receiver = v18;
  v23.super_class = ObjectType;
  v21 = [(AAFlushManager *)&v23 init];

  swift_unknownObjectRelease();
  return v21;
}

- (void)flushWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    v7 = sub_1A90BA534;
  }
  else
  {
    v7 = 0;
    uint64_t v6 = 0;
  }
  v8 = self;
  sub_1A909FFA0(0, 0, (void (*)(void))v7, v6);
  sub_1A909E0EC((uint64_t)v7);
}

- (AAFlushManager)init
{
  result = (AAFlushManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end