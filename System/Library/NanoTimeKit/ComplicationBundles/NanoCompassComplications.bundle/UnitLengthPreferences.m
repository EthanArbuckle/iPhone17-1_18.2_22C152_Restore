@interface UnitLengthPreferences
+ (_TtC24NanoCompassComplications21UnitLengthPreferences)shared;
- (BOOL)usesMetric;
- (_TtC24NanoCompassComplications21UnitLengthPreferences)init;
@end

@implementation UnitLengthPreferences

+ (_TtC24NanoCompassComplications21UnitLengthPreferences)shared
{
  if (qword_268920BA8 != -1) {
    swift_once();
  }
  v2 = (void *)static UnitLengthPreferences.shared;

  return (_TtC24NanoCompassComplications21UnitLengthPreferences *)v2;
}

- (_TtC24NanoCompassComplications21UnitLengthPreferences)init
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC24NanoCompassComplications21UnitLengthPreferences_overrideToMetric) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for UnitLengthPreferences();
  return [(UnitLengthPreferences *)&v3 init];
}

- (BOOL)usesMetric
{
  v2 = self;
  Swift::Bool v3 = UnitLengthPreferences.usesMetric()();

  return v3;
}

@end