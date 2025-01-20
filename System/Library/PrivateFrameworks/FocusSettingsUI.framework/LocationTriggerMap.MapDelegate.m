@interface LocationTriggerMap.MapDelegate
- (_TtCV15FocusSettingsUI18LocationTriggerMap11MapDelegate)init;
- (id)mapView:(id)a3 rendererForOverlay:(id)a4;
- (void)sliderMovedWithSender:(id)a3;
@end

@implementation LocationTriggerMap.MapDelegate

- (id)mapView:(id)a3 rendererForOverlay:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  id v8 = sub_220E18ECC((uint64_t)a4);

  swift_unknownObjectRelease();
  return v8;
}

- (void)sliderMovedWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_msgSend(v4, sel_value);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F32228);
  sub_220F322B8();
}

- (_TtCV15FocusSettingsUI18LocationTriggerMap11MapDelegate)init
{
  result = (_TtCV15FocusSettingsUI18LocationTriggerMap11MapDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV15FocusSettingsUI18LocationTriggerMap11MapDelegate_slider));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV15FocusSettingsUI18LocationTriggerMap11MapDelegate_annotation));
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtCV15FocusSettingsUI18LocationTriggerMap11MapDelegate_circle);
}

@end