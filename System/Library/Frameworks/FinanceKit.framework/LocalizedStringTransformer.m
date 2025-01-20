@interface LocalizedStringTransformer
+ (NSArray)allowedTopLevelClasses;
- (_TtC10FinanceKit26LocalizedStringTransformer)init;
@end

@implementation LocalizedStringTransformer

+ (NSArray)allowedTopLevelClasses
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B0C8E40);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_24395EAE0;
  *(void *)(v2 + 32) = type metadata accessor for LocalizedString();
  __swift_instantiateConcreteTypeFromMangledName(qword_26B0C9150);
  v3 = (void *)sub_243958630();
  swift_bridgeObjectRelease();

  return (NSArray *)v3;
}

- (_TtC10FinanceKit26LocalizedStringTransformer)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(LocalizedStringTransformer *)&v3 init];
}

@end