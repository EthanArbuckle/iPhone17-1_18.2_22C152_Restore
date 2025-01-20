@interface BlastDoorMorphologyCustomPronoun
- (BlastDoorMorphologyCustomPronoun)init;
- (NSString)description;
- (NSString)objectForm;
- (NSString)possessiveAdjectiveForm;
- (NSString)possessiveForm;
- (NSString)reflexiveForm;
- (NSString)subjectForm;
@end

@implementation BlastDoorMorphologyCustomPronoun

- (NSString)description
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B196A850();
  v2 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)subjectForm
{
  return (NSString *)sub_1B17AD0C8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorMorphologyCustomPronoun_morphologyCustomPronoun);
}

- (NSString)objectForm
{
  return (NSString *)sub_1B17AD14C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorMorphologyCustomPronoun_morphologyCustomPronoun);
}

- (NSString)possessiveForm
{
  return (NSString *)sub_1B17A78F0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorMorphologyCustomPronoun_morphologyCustomPronoun);
}

- (NSString)possessiveAdjectiveForm
{
  return (NSString *)sub_1B17A7974((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorMorphologyCustomPronoun_morphologyCustomPronoun);
}

- (NSString)reflexiveForm
{
  return (NSString *)sub_1B178E8A4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorMorphologyCustomPronoun_morphologyCustomPronoun);
}

- (BlastDoorMorphologyCustomPronoun)init
{
  result = (BlastDoorMorphologyCustomPronoun *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end