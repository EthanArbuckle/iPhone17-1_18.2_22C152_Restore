@interface StringParamsTransformer
+ (NSArray)allowedTopLevelClasses;
- (_TtC10FinanceKit23StringParamsTransformer)init;
@end

@implementation StringParamsTransformer

+ (NSArray)allowedTopLevelClasses
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B0C8E40);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_24395EAE0;
  *(void *)(v2 + 32) = type metadata accessor for StringParams();
  __swift_instantiateConcreteTypeFromMangledName(qword_26B0C9150);
  v3 = (void *)sub_243958630();
  swift_bridgeObjectRelease();

  return (NSArray *)v3;
}

- (_TtC10FinanceKit23StringParamsTransformer)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(StringParamsTransformer *)&v3 init];
}

@end