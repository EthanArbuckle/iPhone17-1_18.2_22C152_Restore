@interface NTKParmesanStyleEditOption
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)optionWithStyle:(unint64_t)a3 device:(id)a4;
- (NSString)localizedName;
- (NTKParmesanStyleEditOption)init;
- (NTKParmesanStyleEditOption)initWithCoder:(id)a3;
- (NTKParmesanStyleEditOption)initWithDevice:(id)a3;
- (NTKParmesanStyleEditOption)initWithJSONObjectRepresentation:(id)a3 forDevice:(id)a4;
- (id)_valueToFaceBundleStringDict;
- (int64_t)swatchStyle;
- (unint64_t)style;
@end

@implementation NTKParmesanStyleEditOption

+ (id)optionWithStyle:(unint64_t)a3 device:(id)a4
{
  swift_getObjCClassMetadata();
  id v6 = a4;
  id v7 = sub_246BB9A6C(a3, (uint64_t)v6);

  return v7;
}

- (unint64_t)style
{
  v2 = self;
  v3 = sub_246BF63A0();

  return (unint64_t)v3;
}

- (NSString)localizedName
{
  v2 = self;
  sub_246BF6448();
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
  sub_246BF73C4(a3);
  if (v4)
  {
    v5 = (void *)sub_246C2CC08();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }

  return v5;
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
  unint64_t v4 = sub_246BF6070();
  sub_246C1DB10(v4);

  swift_bridgeObjectRelease();
  v5 = (void *)sub_246C2CD28();
  swift_bridgeObjectRelease();

  return v5;
}

- (NTKParmesanStyleEditOption)initWithDevice:(id)a3
{
  id v4 = a3;
  return (NTKParmesanStyleEditOption *)sub_246BF67A8(a3);
}

- (NTKParmesanStyleEditOption)initWithJSONObjectRepresentation:(id)a3 forDevice:(id)a4
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
  return (NTKParmesanStyleEditOption *)sub_246BF68E0((uint64_t)v8, a4);
}

- (NTKParmesanStyleEditOption)init
{
  return (NTKParmesanStyleEditOption *)sub_246BF6B80();
}

- (NTKParmesanStyleEditOption)initWithCoder:(id)a3
{
  return (NTKParmesanStyleEditOption *)sub_246BF6C90(a3);
}

- (void).cxx_destruct
{
}

- (int64_t)swatchStyle
{
  return 3;
}

@end