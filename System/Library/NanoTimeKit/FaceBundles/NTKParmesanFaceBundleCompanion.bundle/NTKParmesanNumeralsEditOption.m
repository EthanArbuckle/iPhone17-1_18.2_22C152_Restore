@interface NTKParmesanNumeralsEditOption
+ (id)optionsDescription;
- (NTKParmesanNumeralsEditOption)init;
- (NTKParmesanNumeralsEditOption)initWithCoder:(id)a3;
- (NTKParmesanNumeralsEditOption)initWithDevice:(id)a3;
- (NTKParmesanNumeralsEditOption)initWithJSONObjectRepresentation:(id)a3 forDevice:(id)a4;
@end

@implementation NTKParmesanNumeralsEditOption

+ (id)optionsDescription
{
  sub_246BB6A38();
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  v3 = (void *)sub_246C2CC08();
  v4 = (void *)sub_246C2CC08();
  id v5 = objc_msgSend(ObjCClassFromMetadata, sel_localizedStringForKey_comment_, v3, v4);

  sub_246C2CC48();
  v6 = (void *)sub_246C2CC08();
  swift_bridgeObjectRelease();

  return v6;
}

- (NTKParmesanNumeralsEditOption)initWithDevice:(id)a3
{
  return (NTKParmesanNumeralsEditOption *)sub_246BE69D4(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithDevice_);
}

- (NTKParmesanNumeralsEditOption)initWithJSONObjectRepresentation:(id)a3 forDevice:(id)a4
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
  return (NTKParmesanNumeralsEditOption *)sub_246BE679C((uint64_t)v8, a4);
}

- (NTKParmesanNumeralsEditOption)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ParmesanNumeralsEditOption();
  return [(NTKParmesanNumeralsEditOption *)&v3 init];
}

- (NTKParmesanNumeralsEditOption)initWithCoder:(id)a3
{
  return (NTKParmesanNumeralsEditOption *)sub_246BE69D4(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCoder_);
}

@end