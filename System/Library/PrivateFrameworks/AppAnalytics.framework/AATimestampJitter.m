@interface AATimestampJitter
+ (AATimestampJitter)default;
- (AATimestampJitter)init;
- (BOOL)enabled;
- (double)lowerBound;
- (double)upperBound;
- (id)withEnabled:(BOOL)a3;
- (id)withLowerBound:(double)a3;
- (id)withUpperBound:(double)a3;
@end

@implementation AATimestampJitter

+ (AATimestampJitter)default
{
  if (qword_1EB686FB8 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1EB686FB0;

  return (AATimestampJitter *)v2;
}

- (BOOL)enabled
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___AATimestampJitter_enabled);
}

- (double)lowerBound
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR___AATimestampJitter_lowerBound);
}

- (double)upperBound
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR___AATimestampJitter_upperBound);
}

- (id)withEnabled:(BOOL)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___AATimestampJitter_lowerBound);
  uint64_t v7 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___AATimestampJitter_upperBound);
  v8 = objc_allocWithZone(ObjectType);
  v8[OBJC_IVAR___AATimestampJitter_enabled] = a3;
  *(void *)&v8[OBJC_IVAR___AATimestampJitter_lowerBound] = v6;
  *(void *)&v8[OBJC_IVAR___AATimestampJitter_upperBound] = v7;
  v11.receiver = v8;
  v11.super_class = ObjectType;
  v9 = [(AATimestampJitter *)&v11 init];

  return v9;
}

- (id)withLowerBound:(double)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  char v6 = *((unsigned char *)&self->super.isa + OBJC_IVAR___AATimestampJitter_enabled);
  uint64_t v7 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___AATimestampJitter_upperBound);
  v8 = objc_allocWithZone(ObjectType);
  v8[OBJC_IVAR___AATimestampJitter_enabled] = v6;
  *(double *)&v8[OBJC_IVAR___AATimestampJitter_lowerBound] = a3;
  *(void *)&v8[OBJC_IVAR___AATimestampJitter_upperBound] = v7;
  v11.receiver = v8;
  v11.super_class = ObjectType;
  v9 = [(AATimestampJitter *)&v11 init];

  return v9;
}

- (id)withUpperBound:(double)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  char v6 = *((unsigned char *)&self->super.isa + OBJC_IVAR___AATimestampJitter_enabled);
  uint64_t v7 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___AATimestampJitter_lowerBound);
  v8 = objc_allocWithZone(ObjectType);
  v8[OBJC_IVAR___AATimestampJitter_enabled] = v6;
  *(void *)&v8[OBJC_IVAR___AATimestampJitter_lowerBound] = v7;
  *(double *)&v8[OBJC_IVAR___AATimestampJitter_upperBound] = a3;
  v11.receiver = v8;
  v11.super_class = ObjectType;
  v9 = [(AATimestampJitter *)&v11 init];

  return v9;
}

- (AATimestampJitter)init
{
  result = (AATimestampJitter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end