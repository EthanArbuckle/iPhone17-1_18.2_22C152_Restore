@interface _EXExtensionAvailablility
+ (BOOL)supportsSecureCoding;
+ (id)addChangeObserver:(id)a3;
+ (void)removeChangeObserver:(id)a3;
- (_EXExtensionAvailablility)init;
- (_EXExtensionAvailablility)initWithCoder:(id)a3;
- (int64_t)disabledCount;
- (int64_t)enabledCount;
- (int64_t)unelectedCount;
- (void)encodeWithCoder:(id)a3;
- (void)setDisabledCount:(int64_t)a3;
- (void)setEnabledCount:(int64_t)a3;
- (void)setUnelectedCount:(int64_t)a3;
@end

@implementation _EXExtensionAvailablility

- (_EXExtensionAvailablility)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXExtensionAvailablility_enabledCount) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXExtensionAvailablility_disabledCount) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXExtensionAvailablility_unelectedCount) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for _EXExtensionAvailablility();
  return [(_EXExtensionAvailablility *)&v3 init];
}

- (int64_t)enabledCount
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____EXExtensionAvailablility_enabledCount);
}

- (void)setEnabledCount:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXExtensionAvailablility_enabledCount) = (Class)a3;
}

- (int64_t)disabledCount
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____EXExtensionAvailablility_disabledCount);
}

- (void)setDisabledCount:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXExtensionAvailablility_disabledCount) = (Class)a3;
}

- (int64_t)unelectedCount
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____EXExtensionAvailablility_unelectedCount);
}

- (void)setUnelectedCount:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXExtensionAvailablility_unelectedCount) = (Class)a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_191F94B24(v4);
}

- (_EXExtensionAvailablility)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (_EXExtensionAvailablility *)sub_191F97F10(v3);

  return v4;
}

+ (id)addChangeObserver:(id)a3
{
  id v3 = _Block_copy(a3);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  sub_191F95804((uint64_t)sub_191F98308, v4, v7);
  swift_release();
  __swift_project_boxed_opaque_existential_2Tm(v7, v7[3]);
  v5 = (void *)sub_191FBA588();
  __swift_destroy_boxed_opaque_existential_2Tm((uint64_t)v7);

  return v5;
}

+ (void)removeChangeObserver:(id)a3
{
  swift_unknownObjectRetain();
  sub_191FBA1E8();
  swift_unknownObjectRelease();
  sub_191F4EC08((uint64_t)v4, (uint64_t)v3);
  type metadata accessor for _EXExtensionAvailablilityObserver();
  if (swift_dynamicCast())
  {
    sub_191F953A0();
    swift_release();
    __swift_destroy_boxed_opaque_existential_2Tm((uint64_t)v4);
  }
  else
  {
    sub_191FBA458();
    __break(1u);
  }
}

@end