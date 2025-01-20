@interface DataMetadataDelegate
- (HKHealthStore)healthStore;
- (_TtC18HealthExperienceUIP33_32BBCFBB356028961E4520309C3A50C420DataMetadataDelegate)init;
- (id)displayTypeController;
- (id)unitController;
@end

@implementation DataMetadataDelegate

- (HKHealthStore)healthStore
{
  return (HKHealthStore *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                  + OBJC_IVAR____TtC18HealthExperienceUIP33_32BBCFBB356028961E4520309C3A50C420DataMetadataDelegate_healthStore));
}

- (id)displayTypeController
{
  v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC18HealthExperienceUIP33_32BBCFBB356028961E4520309C3A50C420DataMetadataDelegate_healthStore);
  v3 = self;
  id result = objc_msgSend(v2, sel_displayTypeController);
  if (result)
  {
    id v5 = result;

    return v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (id)unitController
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC18HealthExperienceUIP33_32BBCFBB356028961E4520309C3A50C420DataMetadataDelegate_unitPreferencesController));
}

- (_TtC18HealthExperienceUIP33_32BBCFBB356028961E4520309C3A50C420DataMetadataDelegate)init
{
  id result = (_TtC18HealthExperienceUIP33_32BBCFBB356028961E4520309C3A50C420DataMetadataDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUIP33_32BBCFBB356028961E4520309C3A50C420DataMetadataDelegate_healthStore));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC18HealthExperienceUIP33_32BBCFBB356028961E4520309C3A50C420DataMetadataDelegate_unitPreferencesController);
}

@end