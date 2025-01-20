@interface LocationService
- (_TtC15FocusSettingsUI15LocationService)init;
- (void)completerDidUpdateResults:(id)a3;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
@end

@implementation LocationService

- (_TtC15FocusSettingsUI15LocationService)init
{
  sub_220D4BF74();
  return result;
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  sub_220D25F48(0, &qword_267F2F578);
  unint64_t v6 = sub_220F32858();
  id v7 = a3;
  v8 = self;
  sub_220D4CE70(v7, v6);

  swift_bridgeObjectRelease();
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  id v7 = self;
  sub_220D4D05C(v6, v8);
}

- (void)completerDidUpdateResults:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = objc_msgSend(v4, sel_results);
  sub_220D25F48(0, &qword_267F2F570);
  sub_220F32858();

  swift_getKeyPath();
  swift_getKeyPath();
  sub_220F309C8();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC15FocusSettingsUI15LocationService__queryFragment;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2F530);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC15FocusSettingsUI15LocationService__status;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2F5A8);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  id v7 = (char *)self + OBJC_IVAR____TtC15FocusSettingsUI15LocationService__searchResults;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2F5A0);
  (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  swift_release();
  swift_release();

  v9 = (char *)self + OBJC_IVAR____TtC15FocusSettingsUI15LocationService__completions;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2F598);
  (*(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  v11 = (char *)self + OBJC_IVAR____TtC15FocusSettingsUI15LocationService__searchCompletion;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2F590);
  (*(void (**)(char *, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  v13 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15FocusSettingsUI15LocationService_locationQueue);
}

@end