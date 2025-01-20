@interface MicaImage.CAPackageViewLayer
- (_TtCV7HomeUI29MicaImageP33_268EDE8465BB49740E8AD9859354D22018CAPackageViewLayer)init;
- (_TtCV7HomeUI29MicaImageP33_268EDE8465BB49740E8AD9859354D22018CAPackageViewLayer)initWithCoder:(id)a3;
- (_TtCV7HomeUI29MicaImageP33_268EDE8465BB49740E8AD9859354D22018CAPackageViewLayer)initWithLayer:(id)a3;
- (void)layoutSublayers;
@end

@implementation MicaImage.CAPackageViewLayer

- (void)layoutSublayers
{
  v2 = self;
  sub_2526887D0();
}

- (_TtCV7HomeUI29MicaImageP33_268EDE8465BB49740E8AD9859354D22018CAPackageViewLayer)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtCV7HomeUI29MicaImageP33_268EDE8465BB49740E8AD9859354D22018CAPackageViewLayer_packageLayer) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(MicaImage.CAPackageViewLayer *)&v5 init];
}

- (_TtCV7HomeUI29MicaImageP33_268EDE8465BB49740E8AD9859354D22018CAPackageViewLayer)initWithLayer:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectRetain();
  sub_252738B78();
  swift_unknownObjectRelease();
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtCV7HomeUI29MicaImageP33_268EDE8465BB49740E8AD9859354D22018CAPackageViewLayer_packageLayer) = 0;
  __swift_project_boxed_opaque_existential_0(v9, v9[3]);
  uint64_t v5 = sub_252738CC8();
  v8.receiver = self;
  v8.super_class = ObjectType;
  v6 = [(MicaImage.CAPackageViewLayer *)&v8 initWithLayer:v5];
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
  return v6;
}

- (_TtCV7HomeUI29MicaImageP33_268EDE8465BB49740E8AD9859354D22018CAPackageViewLayer)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtCV7HomeUI29MicaImageP33_268EDE8465BB49740E8AD9859354D22018CAPackageViewLayer_packageLayer) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(MicaImage.CAPackageViewLayer *)&v7 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCV7HomeUI29MicaImageP33_268EDE8465BB49740E8AD9859354D22018CAPackageViewLayer_packageLayer));
}

@end