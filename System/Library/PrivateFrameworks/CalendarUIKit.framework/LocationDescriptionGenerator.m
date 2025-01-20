@interface LocationDescriptionGenerator
+ (id)conferenceStringFor:(id)a3 conferenceURLIsBroadcast:(BOOL)a4 options:(unint64_t)a5 outImageName:(id *)a6 incomplete:(BOOL *)a7;
+ (id)labelFor:(id)a3;
+ (id)locationStringFor:(id)a3 locationWithoutPrediction:(id)a4 preferredLocation:(id)a5 conferenceURL:(id)a6 conferenceURLIsBroadcast:(BOOL)a7 options:(unint64_t)a8 incomplete:(BOOL *)a9 leadingImageName:(id *)a10;
+ (id)locationStringFor:(id)a3 options:(unint64_t)a4 incomplete:(BOOL *)a5 leadingImageName:(id *)a6;
- (_TtC13CalendarUIKit28LocationDescriptionGenerator)init;
@end

@implementation LocationDescriptionGenerator

- (_TtC13CalendarUIKit28LocationDescriptionGenerator)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for LocationDescriptionGenerator();
  return [(LocationDescriptionGenerator *)&v3 init];
}

+ (id)locationStringFor:(id)a3 options:(unint64_t)a4 incomplete:(BOOL *)a5 leadingImageName:(id *)a6
{
  swift_getObjCClassMetadata();
  id v10 = a3;
  v11 = (void *)static LocationDescriptionGenerator.locationString(for:options:incomplete:leadingImageName:)(a3, a4, a5, a6);

  return v11;
}

+ (id)locationStringFor:(id)a3 locationWithoutPrediction:(id)a4 preferredLocation:(id)a5 conferenceURL:(id)a6 conferenceURLIsBroadcast:(BOOL)a7 options:(unint64_t)a8 incomplete:(BOOL *)a9 leadingImageName:(id *)a10
{
  unint64_t v25 = a8;
  HIDWORD(v24) = a7;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB678020);
  MEMORY[0x1F4188790](v14 - 8);
  v16 = (char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a6)
  {
    sub_1BE06EDE0();
    uint64_t v17 = sub_1BE06EE10();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v16, 0, 1, v17);
  }
  else
  {
    uint64_t v18 = sub_1BE06EE10();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v16, 1, 1, v18);
  }
  swift_getObjCClassMetadata();
  id v19 = a3;
  id v20 = a4;
  id v21 = a5;
  v22 = (void *)static LocationDescriptionGenerator.locationString(for:locationWithoutPrediction:preferredLocation:conferenceURL:conferenceURLIsBroadcast:options:incomplete:leadingImageName:)(a3, a4, a5, (uint64_t)v16, SHIDWORD(v24), v25, a9, a10);

  sub_1BDF8686C((uint64_t)v16, &qword_1EB678020);

  return v22;
}

+ (id)labelFor:(id)a3
{
  id v4 = a3;
  v5 = (void *)_s13CalendarUIKit28LocationDescriptionGeneratorC5label3forSo8NSStringCSgSo012EKStructuredC0CSg_tFZ_0(a3);

  return v5;
}

+ (id)conferenceStringFor:(id)a3 conferenceURLIsBroadcast:(BOOL)a4 options:(unint64_t)a5 outImageName:(id *)a6 incomplete:(BOOL *)a7
{
  char v9 = a5;
  BOOL v10 = a4;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB678020);
  MEMORY[0x1F4188790](v12 - 8);
  uint64_t v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_1BE06EDE0();
    uint64_t v15 = sub_1BE06EE10();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v14, 0, 1, v15);
  }
  else
  {
    uint64_t v16 = sub_1BE06EE10();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v14, 1, 1, v16);
  }
  uint64_t v17 = (void *)static LocationDescriptionGenerator.conferenceString(for:conferenceURLIsBroadcast:options:outImageName:incomplete:)((uint64_t)v14, v10, v9, a6, a7);
  sub_1BDF8686C((uint64_t)v14, &qword_1EB678020);

  return v17;
}

@end