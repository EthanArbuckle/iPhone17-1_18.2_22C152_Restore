@interface CLLocationValueTransformer
+ (NSArray)allowedTopLevelClasses;
- (_TtC10FinanceKit26CLLocationValueTransformer)init;
@end

@implementation CLLocationValueTransformer

+ (NSArray)allowedTopLevelClasses
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B0C8E40);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_24395EAE0;
  *(void *)(v2 + 32) = sub_2434404E8();
  __swift_instantiateConcreteTypeFromMangledName(qword_26B0C9150);
  v3 = (void *)sub_243958630();
  swift_bridgeObjectRelease();

  return (NSArray *)v3;
}

- (_TtC10FinanceKit26CLLocationValueTransformer)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(CLLocationValueTransformer *)&v3 init];
}

@end