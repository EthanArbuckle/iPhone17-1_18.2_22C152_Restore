@interface HearingTestOptions
+ (_TtC13HearingTestUI18HearingTestOptions)none;
+ (_TtC13HearingTestUI18HearingTestOptions)showAudiogramImport;
- (BOOL)isEqual:(id)a3;
- (_TtC13HearingTestUI18HearingTestOptions)init;
- (_TtC13HearingTestUI18HearingTestOptions)initWithRawValue:(int64_t)a3;
- (int64_t)rawValue;
@end

@implementation HearingTestOptions

- (int64_t)rawValue
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13HearingTestUI18HearingTestOptions_rawValue);
}

+ (_TtC13HearingTestUI18HearingTestOptions)showAudiogramImport
{
  return (_TtC13HearingTestUI18HearingTestOptions *)sub_2513F4D60((uint64_t)a1, (uint64_t)a2, &qword_269B36330, (void **)&qword_269B37460);
}

+ (_TtC13HearingTestUI18HearingTestOptions)none
{
  return (_TtC13HearingTestUI18HearingTestOptions *)sub_2513F4D60((uint64_t)a1, (uint64_t)a2, &qword_269B36338, (void **)&qword_269B37468);
}

- (_TtC13HearingTestUI18HearingTestOptions)initWithRawValue:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13HearingTestUI18HearingTestOptions_rawValue) = (Class)a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for HearingTestOptions();
  return [(HearingTestOptions *)&v4 init];
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    objc_super v4 = self;
    swift_unknownObjectRetain();
    sub_251445230();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  BOOL v6 = sub_2513F4E60((uint64_t)v8);

  sub_2513BAF04((uint64_t)v8);
  return v6;
}

- (_TtC13HearingTestUI18HearingTestOptions)init
{
  result = (_TtC13HearingTestUI18HearingTestOptions *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end