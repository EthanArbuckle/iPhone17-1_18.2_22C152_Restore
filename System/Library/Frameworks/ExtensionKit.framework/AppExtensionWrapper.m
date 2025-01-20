@interface AppExtensionWrapper
- (BOOL)shouldAcceptConnection:(id)a3;
- (_TtC12ExtensionKit19AppExtensionWrapper)init;
@end

@implementation AppExtensionWrapper

- (BOOL)shouldAcceptConnection:(id)a3
{
  sub_2156F96F8((uint64_t)&self->super._strongDelegate + OBJC_IVAR____TtC12ExtensionKit19AppExtensionWrapper_configurationScene, (uint64_t)v9);
  if (v10)
  {
    __swift_project_boxed_opaque_existential_1(v9, v10);
    id v5 = a3;
    v6 = self;
    char v7 = sub_21570DAD8();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  }
  else
  {
    sub_2156F9760((uint64_t)v9);
    char v7 = 0;
  }
  return v7 & 1;
}

- (_TtC12ExtensionKit19AppExtensionWrapper)init
{
  result = (_TtC12ExtensionKit19AppExtensionWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end