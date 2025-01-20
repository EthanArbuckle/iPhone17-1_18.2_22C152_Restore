@interface MedicalIDDataSourceItem
- (_TtC18HealthExperienceUI23MedicalIDDataSourceItem)init;
- (void)medicalIDViewControllerDidCancel:(void *)a3;
- (void)medicalIDViewControllerDidDelete:(id)a3;
@end

@implementation MedicalIDDataSourceItem

- (_TtC18HealthExperienceUI23MedicalIDDataSourceItem)init
{
  result = (_TtC18HealthExperienceUI23MedicalIDDataSourceItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI23MedicalIDDataSourceItem_medicalIDViewController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI23MedicalIDDataSourceItem_healthStore));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI23MedicalIDDataSourceItem_medicalIDCache));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI23MedicalIDDataSourceItem_presentingViewController));
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI23MedicalIDDataSourceItem_currentMedicalIDDataResultPresented);
  sub_1AD40E6F4(v3);
}

- (void)medicalIDViewControllerDidDelete:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AD40F080();
}

- (void)medicalIDViewControllerDidCancel:(void *)a3
{
  if (a3)
  {
    id v7 = a1;
    id v4 = a3;
    id v5 = objc_msgSend(v4, sel_navigationController);
    if (v5)
    {
      id v6 = v5;
      objc_msgSend(v5, sel_dismissViewControllerAnimated_completion_, 1, 0);

      id v4 = v7;
      id v7 = v6;
    }
  }
  else
  {
    __break(1u);
  }
}

@end