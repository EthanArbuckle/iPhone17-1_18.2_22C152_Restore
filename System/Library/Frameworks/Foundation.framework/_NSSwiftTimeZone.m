@interface _NSSwiftTimeZone
+ (BOOL)supportsSecureCoding;
- (BOOL)isDaylightSavingTime;
- (BOOL)isDaylightSavingTimeForDate:(id)a3;
- (Class)classForCoder;
- (NSData)data;
- (NSDate)nextDaylightSavingTimeTransition;
- (NSString)abbreviation;
- (NSString)name;
- (_NSSwiftTimeZone)init;
- (_NSSwiftTimeZone)initWithCoder:(id)a3;
- (_NSSwiftTimeZone)initWithName:(id)a3;
- (_NSSwiftTimeZone)initWithName:(id)a3 data:(id)a4;
- (double)daylightSavingTimeOffset;
- (double)daylightSavingTimeOffsetForDate:(id)a3;
- (id)abbreviationForDate:(id)a3;
- (id)localizedName:(int64_t)a3 locale:(id)a4;
- (id)nextDaylightSavingTimeTransitionAfterDate:(id)a3;
- (id)replacementObjectForKeyedArchiver:(id)a3;
- (int64_t)secondsFromGMT;
- (int64_t)secondsFromGMTForDate:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _NSSwiftTimeZone

- (id)replacementObjectForKeyedArchiver:(id)a3
{
  id v4 = a3;
  v5 = self;
  _NSSwiftTimeZone.replacementObject(for:)(v13);

  uint64_t v6 = v14;
  if (v14)
  {
    v7 = __swift_project_boxed_opaque_existential_1(v13, v14);
    uint64_t v8 = *(void *)(v6 - 8);
    MEMORY[0x1F4188790](v7);
    v10 = (char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v8 + 16))(v10);
    v11 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v6);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  [(NSTimeZone *)&v4 encodeWithCoder:a3];
}

- (Class)classForCoder
{
  type metadata accessor for NSMorphologyPronoun(0, (unint64_t *)&lazy cache variable for type metadata for NSTimeZone);

  return (Class)swift_getObjCClassFromMetadata();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  swift_release();
}

- (int64_t)secondsFromGMT
{
  v2 = self;
  int64_t v3 = _NSSwiftTimeZone.secondsFromGMT.getter();

  return v3;
}

- (NSString)name
{
  uint64_t v3 = *(void *)&self->timeZone[OBJC_IVAR____NSSwiftTimeZone_timeZone];
  uint64_t ObjectType = swift_getObjectType();
  v5 = *(void (**)(uint64_t, uint64_t))(v3 + 32);
  uint64_t v6 = self;
  swift_unknownObjectRetain();
  v5(ObjectType, v3);

  swift_unknownObjectRelease();
  v7 = (void *)String._bridgeToObjectiveCImpl()();
  swift_bridgeObjectRelease();

  return (NSString *)v7;
}

- (NSData)data
{
  v2 = self;
  uint64_t v3 = _NSSwiftTimeZone.data.getter();
  unint64_t v5 = v4;

  v6.super.isa = Data._Representation.bridgedReference()().super.isa;
  outlined consume of Data._Representation(v3, v5);

  return (NSData *)v6.super.isa;
}

- (int64_t)secondsFromGMTForDate:(id)a3
{
  objc_msgSend(a3, sel_timeIntervalSinceReferenceDate);
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)&self->timeZone[OBJC_IVAR____NSSwiftTimeZone_timeZone];
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v12 = v5;
  uint64_t v8 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(v6 + 40);
  uint64_t v9 = self;
  swift_unknownObjectRetain();
  int64_t v10 = v8(&v12, ObjectType, v6);

  swift_unknownObjectRelease();
  return v10;
}

- (NSString)abbreviation
{
  v2 = self;
  _NSSwiftTimeZone.abbreviation.getter();
  uint64_t v4 = v3;

  if (v4)
  {
    uint64_t v5 = (void *)String._bridgeToObjectiveCImpl()();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = 0;
  }

  return (NSString *)v5;
}

- (BOOL)isDaylightSavingTime
{
  v2 = self;
  char v3 = _NSSwiftTimeZone.isDaylightSavingTime.getter();

  return v3 & 1;
}

- (id)nextDaylightSavingTimeTransitionAfterDate:(id)a3
{
  void (*v8)(double *__return_ptr, uint64_t *, uint64_t, uint64_t);
  _NSSwiftTimeZone *v9;
  id v10;
  uint64_t v12;
  double v13;
  char v14;
  uint64_t vars8;

  objc_msgSend(a3, sel_timeIntervalSinceReferenceDate);
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)&self->timeZone[OBJC_IVAR____NSSwiftTimeZone_timeZone];
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v12 = v5;
  uint64_t v8 = *(void (**)(double *__return_ptr, uint64_t *, uint64_t, uint64_t))(v6 + 80);
  uint64_t v9 = self;
  swift_unknownObjectRetain();
  v8(&v13, &v12, ObjectType, v6);

  swift_unknownObjectRelease();
  if (v14) {
    int64_t v10 = 0;
  }
  else {
    int64_t v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1C9C8]), sel_initWithTimeIntervalSinceReferenceDate_, v13);
  }

  return v10;
}

- (double)daylightSavingTimeOffset
{
  v2 = self;
  double v3 = _NSSwiftTimeZone.daylightSavingTimeOffset.getter();

  return v3;
}

- (double)daylightSavingTimeOffsetForDate:(id)a3
{
  objc_msgSend(a3, sel_timeIntervalSinceReferenceDate);
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)&self->timeZone[OBJC_IVAR____NSSwiftTimeZone_timeZone];
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v12 = v5;
  uint64_t v8 = *(double (**)(uint64_t *, uint64_t, uint64_t))(v6 + 72);
  uint64_t v9 = self;
  swift_unknownObjectRetain();
  double v10 = v8(&v12, ObjectType, v6);

  swift_unknownObjectRelease();
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_NSSwiftTimeZone)initWithCoder:(id)a3
{
  result = (_NSSwiftTimeZone *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (id)abbreviationForDate:(id)a3
{
  objc_msgSend(a3, sel_timeIntervalSinceReferenceDate);
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)&self->timeZone[OBJC_IVAR____NSSwiftTimeZone_timeZone];
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v14 = v5;
  uint64_t v8 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v6 + 56);
  uint64_t v9 = self;
  swift_unknownObjectRetain();
  v8(&v14, ObjectType, v6);
  uint64_t v11 = v10;

  swift_unknownObjectRelease();
  if (v11)
  {
    uint64_t v12 = (void *)String._bridgeToObjectiveCImpl()();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (BOOL)isDaylightSavingTimeForDate:(id)a3
{
  objc_msgSend(a3, sel_timeIntervalSinceReferenceDate);
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)&self->timeZone[OBJC_IVAR____NSSwiftTimeZone_timeZone];
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v11 = v5;
  uint64_t v8 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(v6 + 64);
  uint64_t v9 = self;
  swift_unknownObjectRetain();
  LOBYTE(v6) = v8(&v11, ObjectType, v6);

  swift_unknownObjectRelease();
  return v6 & 1;
}

- (NSDate)nextDaylightSavingTimeTransition
{
  v2 = self;
  _NSSwiftTimeZone.nextDaylightSavingTimeTransition.getter();

  if (v6) {
    id v3 = 0;
  }
  else {
    id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1C9C8]), sel_initWithTimeIntervalSinceReferenceDate_, v5);
  }

  return (NSDate *)v3;
}

- (id)localizedName:(int64_t)a3 locale:(id)a4
{
  if (a4)
  {
    type metadata accessor for _NSSwiftLocale();
    uint64_t v7 = swift_dynamicCastClass();
    if (v7)
    {
      uint64_t v8 = *(void *)(v7 + OBJC_IVAR____NSSwiftLocale_locale);
      uint64_t v9 = *(void *)(v7 + OBJC_IVAR____NSSwiftLocale_locale + 8);
      swift_unknownObjectRetain();
    }
    else
    {
      type metadata accessor for _LocaleBridged();
      uint64_t v8 = swift_allocObject();
      *(void *)(v8 + 16) = a4;
      uint64_t v9 = lazy protocol witness table accessor for type _LocaleBridged and conformance _LocaleBridged((unint64_t *)&lazy protocol witness table cache variable for type _LocaleBridged and conformance _LocaleBridged, (void (*)(uint64_t))type metadata accessor for _LocaleBridged);
      id v10 = a4;
    }
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v9 = 0;
  }
  uint64_t v11 = *(void *)&self->timeZone[OBJC_IVAR____NSSwiftTimeZone_timeZone];
  uint64_t ObjectType = swift_getObjectType();
  v19[0] = v8;
  v19[1] = v9;
  v13 = *(void (**)(int64_t, void *, uint64_t, uint64_t))(v11 + 88);
  uint64_t v14 = self;
  swift_unknownObjectRetain();
  v13(a3, v19, ObjectType, v11);
  uint64_t v16 = v15;

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  if (v16)
  {
    v17 = (void *)String._bridgeToObjectiveCImpl()();
    swift_bridgeObjectRelease();
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (_NSSwiftTimeZone)init
{
  result = (_NSSwiftTimeZone *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_NSSwiftTimeZone)initWithName:(id)a3
{
  result = (_NSSwiftTimeZone *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_NSSwiftTimeZone)initWithName:(id)a3 data:(id)a4
{
  if (a4)
  {
    id v4 = a4;
    specialized Data.init(referencing:)(v4);
  }
  result = (_NSSwiftTimeZone *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end