@interface BlastDoorMorphology
- (BlastDoorMorphology)init;
- (NSArray)customPronouns;
- (NSString)description;
- (int64_t)grammaticalGender;
- (int64_t)number;
- (int64_t)partOfSpeech;
@end

@implementation BlastDoorMorphology

- (NSString)description
{
  swift_bridgeObjectRetain();
  sub_1B196A850();
  v2 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (int64_t)grammaticalGender
{
  return sub_1B178F440();
}

- (int64_t)partOfSpeech
{
  int64_t result = sub_1B17B31E0(*((unsigned __int8 *)&self->super.isa + OBJC_IVAR___BlastDoorMorphology_morphology + 1));
  if (v3) {
    __break(1u);
  }
  return result;
}

- (int64_t)number
{
  return sub_1B178F4FC();
}

- (NSArray)customPronouns
{
  return (NSArray *)sub_1B17A0558(self, (uint64_t)a2, (void (*)(void))sub_1B178F564, (void (*)(void))type metadata accessor for _ObjCMorphologyCustomPronounPairWrapper);
}

- (BlastDoorMorphology)init
{
  int64_t result = (BlastDoorMorphology *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end