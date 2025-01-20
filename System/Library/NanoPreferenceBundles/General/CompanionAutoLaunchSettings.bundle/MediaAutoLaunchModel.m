@interface MediaAutoLaunchModel
- (_TtC27CompanionAutoLaunchSettings20MediaAutoLaunchModel)init;
- (void)twoWaySyncSettingDidUpdate:(id)a3;
@end

@implementation MediaAutoLaunchModel

- (_TtC27CompanionAutoLaunchSettings20MediaAutoLaunchModel)init
{
  return (_TtC27CompanionAutoLaunchSettings20MediaAutoLaunchModel *)MediaAutoLaunchModel.init()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC27CompanionAutoLaunchSettings20MediaAutoLaunchModel_mediaAutoLaunchSetting));
}

- (void)twoWaySyncSettingDidUpdate:(id)a3
{
  type metadata accessor for MediaAutoLaunchModel();
  sub_ECE0();
  id v5 = a3;
  v6 = self;
  sub_279C0();
  sub_279D0();

  swift_release();
}

@end