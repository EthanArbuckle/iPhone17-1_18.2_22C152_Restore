@interface SpriteKitViewCoordinator
- (_TtC18_SpriteKit_SwiftUIP33_4A29C38A751B2448A1E2FA85CDDEAA5324SpriteKitViewCoordinator)init;
- (_TtC18_SpriteKit_SwiftUIP33_4A29C38A751B2448A1E2FA85CDDEAA5324SpriteKitViewCoordinator)initWithCoder:(id)a3;
- (_TtC18_SpriteKit_SwiftUIP33_4A29C38A751B2448A1E2FA85CDDEAA5324SpriteKitViewCoordinator)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SpriteKitViewCoordinator

- (_TtC18_SpriteKit_SwiftUIP33_4A29C38A751B2448A1E2FA85CDDEAA5324SpriteKitViewCoordinator)init
{
  v3 = (char *)self
     + OBJC_IVAR____TtC18_SpriteKit_SwiftUIP33_4A29C38A751B2448A1E2FA85CDDEAA5324SpriteKitViewCoordinator_deferredState;
  *(_OWORD *)v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  *((_OWORD *)v3 + 2) = 0u;
  *((void *)v3 + 6) = 0;
  outlined consume of SpriteKitViewState?(0, 0);
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SpriteKitViewCoordinator();
  return -[SKView initWithFrame:](&v5, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
}

- (_TtC18_SpriteKit_SwiftUIP33_4A29C38A751B2448A1E2FA85CDDEAA5324SpriteKitViewCoordinator)initWithCoder:(id)a3
{
  v4 = (char *)self
     + OBJC_IVAR____TtC18_SpriteKit_SwiftUIP33_4A29C38A751B2448A1E2FA85CDDEAA5324SpriteKitViewCoordinator_deferredState;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_OWORD *)v4 + 2) = 0u;
  *((void *)v4 + 6) = 0;
  id v5 = a3;
  outlined consume of SpriteKitViewState?(0, 0);
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for SpriteKitViewCoordinator();
  v6 = [(SKView *)&v8 initWithCoder:v5];

  return v6;
}

- (void)layoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)type metadata accessor for SpriteKitViewCoordinator();
  v2 = (char *)v19.receiver;
  [(SKView *)&v19 layoutSubviews];
  v3 = &v2[OBJC_IVAR____TtC18_SpriteKit_SwiftUIP33_4A29C38A751B2448A1E2FA85CDDEAA5324SpriteKitViewCoordinator_deferredState];
  v4 = *(void **)&v2[OBJC_IVAR____TtC18_SpriteKit_SwiftUIP33_4A29C38A751B2448A1E2FA85CDDEAA5324SpriteKitViewCoordinator_deferredState];
  if (v4)
  {
    uint64_t v6 = *((void *)v3 + 5);
    uint64_t v5 = *((void *)v3 + 6);
    uint64_t v8 = *((void *)v3 + 3);
    uint64_t v7 = *((void *)v3 + 4);
    v10 = (void *)*((void *)v3 + 1);
    uint64_t v9 = *((void *)v3 + 2);
    v13[0] = *(void *)&v2[OBJC_IVAR____TtC18_SpriteKit_SwiftUIP33_4A29C38A751B2448A1E2FA85CDDEAA5324SpriteKitViewCoordinator_deferredState];
    v13[1] = v10;
    char v14 = v9 & 1;
    uint64_t v15 = v8;
    uint64_t v16 = v7;
    uint64_t v17 = v6;
    uint64_t v18 = v5;
    swift_unknownObjectRetain();
    id v11 = v4;
    id v12 = v10;
    SKView.assignState(state:)((uint64_t)v13);
    outlined consume of SpriteKitViewState?(v4, v10);
  }
}

- (_TtC18_SpriteKit_SwiftUIP33_4A29C38A751B2448A1E2FA85CDDEAA5324SpriteKitViewCoordinator)initWithFrame:(CGRect)a3
{
  result = (_TtC18_SpriteKit_SwiftUIP33_4A29C38A751B2448A1E2FA85CDDEAA5324SpriteKitViewCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end