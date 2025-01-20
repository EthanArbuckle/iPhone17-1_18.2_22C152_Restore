@interface DashboardFilterCategoryCell.ContentView
- (_TtCC6HomeUI27DashboardFilterCategoryCell11ContentView)initWithCoder:(id)a3;
- (_TtCC6HomeUI27DashboardFilterCategoryCell11ContentView)initWithFrame:(CGRect)a3;
- (void)updateConstraints;
@end

@implementation DashboardFilterCategoryCell.ContentView

- (_TtCC6HomeUI27DashboardFilterCategoryCell11ContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1BE411B24();
}

- (void)updateConstraints
{
  v2 = self;
  sub_1BE40FE98();
}

- (_TtCC6HomeUI27DashboardFilterCategoryCell11ContentView)initWithFrame:(CGRect)a3
{
  result = (_TtCC6HomeUI27DashboardFilterCategoryCell11ContentView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3 = *(FBSSceneIdentityToken **)((char *)&self->super.super.__layeringSceneIdentity
                                 + OBJC_IVAR____TtCC6HomeUI27DashboardFilterCategoryCell11ContentView_config);
  v4 = *(NSMutableArray **)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints
                          + OBJC_IVAR____TtCC6HomeUI27DashboardFilterCategoryCell11ContentView_config);
  v5 = *(_UITraitChangeRegistry **)((char *)&self->super._traitChangeRegistry
                                  + OBJC_IVAR____TtCC6HomeUI27DashboardFilterCategoryCell11ContentView_config);
  v6 = *(void **)((char *)&self->super._viewFlags
                + OBJC_IVAR____TtCC6HomeUI27DashboardFilterCategoryCell11ContentView_config
                + 8);
  v7 = *(void **)((char *)&self->super._viewFlags
                + OBJC_IVAR____TtCC6HomeUI27DashboardFilterCategoryCell11ContentView_config
                + 16);
  objc_release(*(id *)((char *)&self->super._layerRetained
                     + OBJC_IVAR____TtCC6HomeUI27DashboardFilterCategoryCell11ContentView_config));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC6HomeUI27DashboardFilterCategoryCell11ContentView_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC6HomeUI27DashboardFilterCategoryCell11ContentView_label));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC6HomeUI27DashboardFilterCategoryCell11ContentView_secondaryLabel));

  swift_bridgeObjectRelease();
}

@end