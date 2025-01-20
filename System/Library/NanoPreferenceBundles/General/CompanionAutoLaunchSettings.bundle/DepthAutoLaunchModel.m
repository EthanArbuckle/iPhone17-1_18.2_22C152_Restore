@interface DepthAutoLaunchModel
- (_TtC27CompanionAutoLaunchSettings20DepthAutoLaunchModel)init;
- (void)depthAutoLaunchAppSettingDidUpdate:(id)a3;
@end

@implementation DepthAutoLaunchModel

- (_TtC27CompanionAutoLaunchSettings20DepthAutoLaunchModel)init
{
  result = (_TtC27CompanionAutoLaunchSettings20DepthAutoLaunchModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC27CompanionAutoLaunchSettings20DepthAutoLaunchModel_autoLaunchSettings));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC27CompanionAutoLaunchSettings20DepthAutoLaunchModel_stingSettingsModel));
  sub_F300((uint64_t)self + OBJC_IVAR____TtC27CompanionAutoLaunchSettings20DepthAutoLaunchModel_installedAppsDataSource);
  swift_bridgeObjectRelease();

  swift_release();
}

- (void)depthAutoLaunchAppSettingDidUpdate:(id)a3
{
  type metadata accessor for DepthAutoLaunchModel();
  sub_20658((unint64_t *)&qword_3C500, v5, (void (*)(uint64_t))type metadata accessor for DepthAutoLaunchModel);
  id v6 = a3;
  v7 = self;
  sub_279C0();
  sub_279D0();

  swift_release();
}

@end