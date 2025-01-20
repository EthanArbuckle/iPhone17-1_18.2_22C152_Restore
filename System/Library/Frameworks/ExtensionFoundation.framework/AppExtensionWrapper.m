@interface AppExtensionWrapper
- (BOOL)shouldAcceptConnection:(id)a3;
- (_TtC19ExtensionFoundation19AppExtensionWrapper)init;
- (void)handleConnection:(id)a3;
@end

@implementation AppExtensionWrapper

- (void)handleConnection:(id)a3
{
  v5 = *(void (**)(id))((char *)&self->super.super.isa
                                 + OBJC_IVAR____TtC19ExtensionFoundation19AppExtensionWrapper__handleConnection);
  swift_unknownObjectRetain();
  v6 = self;
  v5(a3);
  swift_unknownObjectRelease();
}

- (BOOL)shouldAcceptConnection:(id)a3
{
  v4 = *(uint64_t (**)(id))((char *)&self->super.super.isa
                                    + OBJC_IVAR____TtC19ExtensionFoundation19AppExtensionWrapper__accept);
  id v5 = a3;
  v6 = self;
  char v7 = v4(v5);

  return v7 & 1;
}

- (_TtC19ExtensionFoundation19AppExtensionWrapper)init
{
  result = (_TtC19ExtensionFoundation19AppExtensionWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  swift_release();
}

@end