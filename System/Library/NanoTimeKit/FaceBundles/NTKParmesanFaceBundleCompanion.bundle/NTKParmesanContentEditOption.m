@interface NTKParmesanContentEditOption
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)optionWithContent:(unint64_t)a3 device:(id)a4;
+ (unint64_t)numberOfOptionsForDevice:(id)a3;
- (NSString)description;
- (NSString)localizedName;
- (NSString)localizedNameForAction;
- (NTKParmesanContentEditOption)init;
- (NTKParmesanContentEditOption)initWithCoder:(id)a3;
- (NTKParmesanContentEditOption)initWithDevice:(id)a3;
- (NTKParmesanContentEditOption)initWithJSONObjectRepresentation:(id)a3 forDevice:(id)a4;
- (id)_valueToFaceBundleStringDict;
- (unint64_t)content;
@end

@implementation NTKParmesanContentEditOption

+ (id)optionWithContent:(unint64_t)a3 device:(id)a4
{
  swift_getObjCClassMetadata();
  id v6 = a4;
  id v7 = sub_246BB9A6C(a3, (uint64_t)v6);

  return v7;
}

- (unint64_t)content
{
  unint64_t result = [(NTKValueEditOption *)self _value];
  if (result != 2) {
    return result == 1;
  }
  return result;
}

- (NSString)localizedName
{
  return (NSString *)sub_246BB9D24(self, (uint64_t)a2, (void (*)(void))sub_246BB9B78);
}

- (NSString)localizedNameForAction
{
  return (NSString *)sub_246BB9D24(self, (uint64_t)a2, (void (*)(void))sub_246BB9DA4);
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  v4 = (void *)sub_246C2CC08();
  swift_bridgeObjectRelease();

  return v4;
}

- (id)_valueToFaceBundleStringDict
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_246C2CBA8();
  swift_bridgeObjectRelease();

  return v2;
}

+ (id)_orderedValuesForDevice:(id)a3
{
  id v3 = a3;
  unint64_t v4 = sub_246BF5DDC();
  sub_246C1DB10(v4);

  swift_bridgeObjectRelease();
  v5 = (void *)sub_246C2CD28();
  swift_bridgeObjectRelease();

  return v5;
}

+ (unint64_t)numberOfOptionsForDevice:(id)a3
{
  return 2;
}

- (NSString)description
{
  v2 = self;
  unint64_t result = [(NTKParmesanContentEditOption *)v2 localizedName];
  if (result)
  {
    unint64_t v4 = result;
    sub_246C2CC48();

    v5 = (void *)sub_246C2CC08();
    swift_bridgeObjectRelease();
    return (NSString *)v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (NTKParmesanContentEditOption)initWithDevice:(id)a3
{
  uint64_t v5 = OBJC_IVAR___NTKParmesanContentEditOption_positionsToFaceBundleStrings;
  id v6 = self;
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)sub_246BB9FFC();

  v10.receiver = v6;
  v10.super_class = (Class)type metadata accessor for ParmesanContentEditOption();
  v8 = [(NTKEditOption *)&v10 initWithDevice:v7];

  return v8;
}

- (NTKParmesanContentEditOption)initWithJSONObjectRepresentation:(id)a3 forDevice:(id)a4
{
  if (a3)
  {
    id v5 = a4;
    swift_unknownObjectRetain();
    sub_246C2D1F8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    id v6 = a4;
  }
  return (NTKParmesanContentEditOption *)sub_246BBA2B8((uint64_t)v8, a4);
}

- (NTKParmesanContentEditOption)init
{
  uint64_t v3 = OBJC_IVAR___NTKParmesanContentEditOption_positionsToFaceBundleStrings;
  unint64_t v4 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v3) = (Class)sub_246BB9FFC();

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for ParmesanContentEditOption();
  return [(NTKParmesanContentEditOption *)&v6 init];
}

- (NTKParmesanContentEditOption)initWithCoder:(id)a3
{
  uint64_t v4 = OBJC_IVAR___NTKParmesanContentEditOption_positionsToFaceBundleStrings;
  id v5 = a3;
  objc_super v6 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v4) = (Class)sub_246BB9FFC();

  v9.receiver = v6;
  v9.super_class = (Class)type metadata accessor for ParmesanContentEditOption();
  id v7 = [(NTKValueEditOption *)&v9 initWithCoder:v5];

  return v7;
}

- (void).cxx_destruct
{
}

@end