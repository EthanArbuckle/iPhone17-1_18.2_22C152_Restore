@interface NTKParmesanShuffleSelection
+ (id)peopleDetailTitleFor:(id)a3;
- (NSArray)manualSelection;
- (NSArray)personIdentifiers;
- (NSString)collectionIdentifier;
- (NSString)description;
- (NSString)shuffleName;
- (NTKParmesanShuffleSelection)init;
- (NTKParmesanShuffleSelection)initWithCollection:(id)a3;
- (NTKParmesanShuffleSelection)initWithManualSelection:(id)a3;
- (NTKParmesanShuffleSelection)initWithShuffleTypesAsNSNumbers:(id)a3 personIdentifiers:(id)a4;
- (id)shuffleTypesAsNSNumbers;
@end

@implementation NTKParmesanShuffleSelection

- (NSArray)personIdentifiers
{
  return (NSArray *)sub_246BECC6C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___NTKParmesanShuffleSelection_personIdentifiers);
}

- (NSString)collectionIdentifier
{
  if (*(void *)&self->shuffleTypes[OBJC_IVAR___NTKParmesanShuffleSelection_collectionIdentifier])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_246C2CC08();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }

  return (NSString *)v2;
}

- (NSArray)manualSelection
{
  return (NSArray *)sub_246BECC6C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___NTKParmesanShuffleSelection_manualSelection);
}

- (NSString)description
{
  return (NSString *)sub_246BED54C(self, (uint64_t)a2, (void (*)(void))sub_246BECCE8);
}

- (NTKParmesanShuffleSelection)initWithCollection:(id)a3
{
  uint64_t v4 = sub_246C2CC48();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanShuffleSelection_shuffleTypes) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanShuffleSelection_personIdentifiers) = 0;
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___NTKParmesanShuffleSelection_collectionIdentifier);
  uint64_t *v5 = v4;
  v5[1] = v6;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanShuffleSelection_manualSelection) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ParmesanShuffleSelection();
  return [(NTKParmesanShuffleSelection *)&v8 init];
}

- (NTKParmesanShuffleSelection)initWithManualSelection:(id)a3
{
  uint64_t v4 = (objc_class *)sub_246C2CD38();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanShuffleSelection_shuffleTypes) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanShuffleSelection_personIdentifiers) = 0;
  v5 = (Class *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanShuffleSelection_collectionIdentifier);
  void *v5 = 0;
  v5[1] = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanShuffleSelection_manualSelection) = v4;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ParmesanShuffleSelection();
  return [(NTKParmesanShuffleSelection *)&v7 init];
}

- (NTKParmesanShuffleSelection)init
{
  result = (NTKParmesanShuffleSelection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (NTKParmesanShuffleSelection)initWithShuffleTypesAsNSNumbers:(id)a3 personIdentifiers:(id)a4
{
  sub_246B8F1E0(0, (unint64_t *)&qword_2691D7120);
  unint64_t v5 = sub_246C2CD38();
  if (a4) {
    uint64_t v6 = sub_246C2CD38();
  }
  else {
    uint64_t v6 = 0;
  }
  return (NTKParmesanShuffleSelection *)sub_246BED0BC(v5, v6);
}

- (id)shuffleTypesAsNSNumbers
{
  v2 = self;
  sub_246BED384();

  sub_246B8F1E0(0, (unint64_t *)&qword_2691D7120);
  v3 = (void *)sub_246C2CD28();
  swift_bridgeObjectRelease();

  return v3;
}

- (NSString)shuffleName
{
  return (NSString *)sub_246BED54C(self, (uint64_t)a2, (void (*)(void))sub_246BED5BC);
}

+ (id)peopleDetailTitleFor:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_246C2CD38();
  }
  else {
    uint64_t v3 = 0;
  }
  sub_246BEF974(v3);
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)sub_246C2CC08();
  swift_bridgeObjectRelease();

  return v4;
}

@end