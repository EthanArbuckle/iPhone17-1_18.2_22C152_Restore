@interface NTKParmesanTypefaceEditOption
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)optionWithTypeface:(unint64_t)a3 device:(id)a4;
+ (id)optionsDescription;
- (NSString)localizedName;
- (NTKParmesanTypefaceEditOption)init;
- (NTKParmesanTypefaceEditOption)initWithCoder:(id)a3;
- (NTKParmesanTypefaceEditOption)initWithDevice:(id)a3;
- (NTKParmesanTypefaceEditOption)initWithJSONObjectRepresentation:(id)a3 forDevice:(id)a4;
- (id)_valueToFaceBundleStringDict;
- (int64_t)swatchStyle;
- (unint64_t)typeface;
@end

@implementation NTKParmesanTypefaceEditOption

+ (id)optionWithTypeface:(unint64_t)a3 device:(id)a4
{
  swift_getObjCClassMetadata();
  id v6 = a4;
  id v7 = sub_246BB9A6C(a3, (uint64_t)v6);

  return v7;
}

- (unint64_t)typeface
{
  unint64_t result = [(NTKValueEditOption *)self _value];
  if (result != 2) {
    return result == 1;
  }
  return result;
}

- (NSString)localizedName
{
  v2 = self;
  sub_246BC44B4();
  uint64_t v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_246C2CC08();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }

  return (NSString *)v5;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  uint64_t v4 = (void *)sub_246C2CC08();
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

+ (id)optionsDescription
{
  sub_246BB6A38();
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  id v3 = (void *)sub_246C2CC08();
  unint64_t v4 = (void *)sub_246C2CC08();
  id v5 = objc_msgSend(ObjCClassFromMetadata, sel_localizedStringForKey_comment_, v3, v4);

  sub_246C2CC48();
  id v6 = (void *)sub_246C2CC08();
  swift_bridgeObjectRelease();

  return v6;
}

- (NTKParmesanTypefaceEditOption)initWithDevice:(id)a3
{
  uint64_t v5 = OBJC_IVAR___NTKParmesanTypefaceEditOption_positionsToFaceBundleStrings;
  id v6 = self;
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)sub_246BC46D4();

  v10.receiver = v6;
  v10.super_class = (Class)type metadata accessor for ParmesanTypefaceEditOption();
  v8 = [(NTKEditOption *)&v10 initWithDevice:v7];

  return v8;
}

- (NTKParmesanTypefaceEditOption)initWithJSONObjectRepresentation:(id)a3 forDevice:(id)a4
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
  return (NTKParmesanTypefaceEditOption *)sub_246BC49E4((uint64_t)v8, a4);
}

- (NTKParmesanTypefaceEditOption)init
{
  uint64_t v3 = OBJC_IVAR___NTKParmesanTypefaceEditOption_positionsToFaceBundleStrings;
  unint64_t v4 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v3) = (Class)sub_246BC46D4();

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for ParmesanTypefaceEditOption();
  return [(NTKParmesanTypefaceEditOption *)&v6 init];
}

- (NTKParmesanTypefaceEditOption)initWithCoder:(id)a3
{
  uint64_t v4 = OBJC_IVAR___NTKParmesanTypefaceEditOption_positionsToFaceBundleStrings;
  id v5 = a3;
  objc_super v6 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v4) = (Class)sub_246BC46D4();

  v9.receiver = v6;
  v9.super_class = (Class)type metadata accessor for ParmesanTypefaceEditOption();
  id v7 = [(NTKValueEditOption *)&v9 initWithCoder:v5];

  return v7;
}

- (void).cxx_destruct
{
}

- (int64_t)swatchStyle
{
  return 4;
}

@end