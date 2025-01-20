@interface SparksCelebration
- (_TtC15ActivityRingsUI17SparksCelebration)init;
- (_TtC3VFX8VFXScene)scene;
- (double)duration;
- (unint64_t)type;
- (void)apply:(id)a3 context:(id)a4;
- (void)updateDeltaTime:(double)a3;
@end

@implementation SparksCelebration

- (_TtC3VFX8VFXScene)scene
{
  return (_TtC3VFX8VFXScene *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                      + OBJC_IVAR____TtC15ActivityRingsUI17SparksCelebration_scene));
}

- (double)duration
{
  return 5.0;
}

- (unint64_t)type
{
  return 0;
}

- (_TtC15ActivityRingsUI17SparksCelebration)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC15ActivityRingsUI17SparksCelebration_duration) = (Class)0x4014000000000000;
  type metadata accessor for Sparks();
  v3 = self;
  *(Class *)((char *)&v3->super.super.isa + OBJC_IVAR____TtC15ActivityRingsUI17SparksCelebration_scene) = (Class)sub_21E18202C();

  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for SparksCelebration();
  return [(SparksCelebration *)&v5 init];
}

- (void)apply:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_21E17F660(v6, v7);
}

- (void)updateDeltaTime:(double)a3
{
  v3 = self;
  sub_21E185EA0();
}

- (void).cxx_destruct
{
}

@end