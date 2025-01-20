@interface SpriteKitViewDelegate
- (BOOL)view:(id)a3 shouldRenderAtTime:(double)a4;
- (_TtC18_SpriteKit_SwiftUIP33_4A29C38A751B2448A1E2FA85CDDEAA5321SpriteKitViewDelegate)init;
@end

@implementation SpriteKitViewDelegate

- (BOOL)view:(id)a3 shouldRenderAtTime:(double)a4
{
  v6 = *(uint64_t (**)(uint64_t, double))((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC18_SpriteKit_SwiftUIP33_4A29C38A751B2448A1E2FA85CDDEAA5321SpriteKitViewDelegate_callback);
  id v7 = a3;
  v8 = self;
  uint64_t v9 = swift_retain();
  LOBYTE(v6) = v6(v9, a4);

  swift_release();
  return v6 & 1;
}

- (_TtC18_SpriteKit_SwiftUIP33_4A29C38A751B2448A1E2FA85CDDEAA5321SpriteKitViewDelegate)init
{
  result = (_TtC18_SpriteKit_SwiftUIP33_4A29C38A751B2448A1E2FA85CDDEAA5321SpriteKitViewDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end