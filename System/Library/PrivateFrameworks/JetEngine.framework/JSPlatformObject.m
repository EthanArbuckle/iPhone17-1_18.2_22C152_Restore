@interface JSPlatformObject
- (_TtC9JetEngine16JSPlatformObject)init;
- (id)lookup:(id)a3;
@end

@implementation JSPlatformObject

- (id)lookup:(id)a3
{
  v5 = self;
  id v6 = a3;
  v7 = self;
  id v8 = objc_msgSend(v5, sel_currentContext);
  if (v8)
  {
    v9 = v8;
    id v10 = v6;
    v11 = v7;
    v12 = (void *)sub_19EFA59E4((uint64_t)v9, (uint64_t)v10, (uint64_t)v11);

    return v12;
  }
  else
  {
    id result = (id)sub_19F1DCFCC();
    __break(1u);
  }
  return result;
}

- (_TtC9JetEngine16JSPlatformObject)init
{
  id result = (_TtC9JetEngine16JSPlatformObject *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9JetEngine16JSPlatformObject_process);
}

@end