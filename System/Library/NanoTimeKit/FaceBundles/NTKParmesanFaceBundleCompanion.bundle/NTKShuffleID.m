@interface NTKShuffleID
- (BOOL)cityscape;
- (BOOL)nature;
- (BOOL)pets;
- (NSSet)people;
- (NSString)description;
- (NSString)uuidString;
- (_TtC30NTKParmesanFaceBundleCompanion12NTKShuffleID)init;
- (_TtC30NTKParmesanFaceBundleCompanion12NTKShuffleID)initWithPeople:(id)a3 pets:(BOOL)a4 nature:(BOOL)a5 cityscape:(BOOL)a6 uuidString:(id)a7;
- (void)setCityscape:(BOOL)a3;
- (void)setNature:(BOOL)a3;
- (void)setPeople:(id)a3;
- (void)setPets:(BOOL)a3;
- (void)setUuidString:(id)a3;
@end

@implementation NTKShuffleID

- (NSSet)people
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_246C2CE88();
  swift_bridgeObjectRelease();

  return (NSSet *)v2;
}

- (void)setPeople:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion12NTKShuffleID_people) = (Class)sub_246C2CE98();

  swift_bridgeObjectRelease();
}

- (BOOL)pets
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion12NTKShuffleID_pets);
}

- (void)setPets:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion12NTKShuffleID_pets) = a3;
}

- (BOOL)nature
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion12NTKShuffleID_nature);
}

- (void)setNature:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion12NTKShuffleID_nature) = a3;
}

- (BOOL)cityscape
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion12NTKShuffleID_cityscape);
}

- (void)setCityscape:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion12NTKShuffleID_cityscape) = a3;
}

- (NSString)uuidString
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_246C2CC08();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setUuidString:(id)a3
{
  uint64_t v4 = sub_246C2CC48();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion12NTKShuffleID_uuidString);
  uint64_t *v5 = v4;
  v5[1] = v6;

  swift_bridgeObjectRelease();
}

- (_TtC30NTKParmesanFaceBundleCompanion12NTKShuffleID)initWithPeople:(id)a3 pets:(BOOL)a4 nature:(BOOL)a5 cityscape:(BOOL)a6 uuidString:(id)a7
{
  v11 = (objc_class *)sub_246C2CE98();
  uint64_t v12 = sub_246C2CC48();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion12NTKShuffleID_people) = v11;
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion12NTKShuffleID_pets) = a4;
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion12NTKShuffleID_nature) = a5;
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion12NTKShuffleID_cityscape) = a6;
  v13 = (uint64_t *)((char *)self + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion12NTKShuffleID_uuidString);
  uint64_t *v13 = v12;
  v13[1] = v14;
  v16.receiver = self;
  v16.super_class = (Class)type metadata accessor for NTKShuffleID();
  return [(NTKShuffleID *)&v16 init];
}

- (NSString)description
{
  v2 = self;
  sub_246C0CBB0();

  v3 = (void *)sub_246C2CC08();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_TtC30NTKParmesanFaceBundleCompanion12NTKShuffleID)init
{
  result = (_TtC30NTKParmesanFaceBundleCompanion12NTKShuffleID *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end