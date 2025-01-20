@interface DOCNamedLocationResolver
- (_TtC33com_apple_DocumentManager_Service24DOCNamedLocationResolver)init;
- (_TtC33com_apple_DocumentManager_Service24DOCNamedLocationResolver)initWithConfiguration:(id)a3 defaultSourceUIManager:(id)a4;
@end

@implementation DOCNamedLocationResolver

- (_TtC33com_apple_DocumentManager_Service24DOCNamedLocationResolver)initWithConfiguration:(id)a3 defaultSourceUIManager:(id)a4
{
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC33com_apple_DocumentManager_Service24DOCNamedLocationResolver_iCloudSource) = 0;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC33com_apple_DocumentManager_Service24DOCNamedLocationResolver_configuration) = (Class)a3;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC33com_apple_DocumentManager_Service24DOCNamedLocationResolver_defaultSourceUIManager) = (Class)a4;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for DOCNamedLocationResolver();
  id v6 = a3;
  id v7 = a4;
  return [(DOCNamedLocationResolver *)&v9 init];
}

- (_TtC33com_apple_DocumentManager_Service24DOCNamedLocationResolver)init
{
  result = (_TtC33com_apple_DocumentManager_Service24DOCNamedLocationResolver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_Service24DOCNamedLocationResolver_configuration));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_Service24DOCNamedLocationResolver_defaultSourceUIManager));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC33com_apple_DocumentManager_Service24DOCNamedLocationResolver_iCloudSource);
}

@end