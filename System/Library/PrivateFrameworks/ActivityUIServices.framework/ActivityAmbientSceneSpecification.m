@interface ActivityAmbientSceneSpecification
- (NSArray)defaultExtensions;
- (NSString)uiSceneSessionRole;
- (_TtC18ActivityUIServices33ActivityAmbientSceneSpecification)init;
@end

@implementation ActivityAmbientSceneSpecification

- (NSString)uiSceneSessionRole
{
  return (NSString *)sub_23C953330(self, (uint64_t)a2, &qword_26AF229E8, (id *)&qword_26AF229D8);
}

- (NSArray)defaultExtensions
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBADC0);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_23C993F30;
  *(void *)(v2 + 32) = type metadata accessor for ActivityAmbientSceneExtension();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBADC8);
  v3 = (void *)sub_23C991060();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (_TtC18ActivityUIServices33ActivityAmbientSceneSpecification)init
{
  return (_TtC18ActivityUIServices33ActivityAmbientSceneSpecification *)sub_23C9533B8(self, (uint64_t)a2, type metadata accessor for ActivityAmbientSceneSpecification);
}

@end