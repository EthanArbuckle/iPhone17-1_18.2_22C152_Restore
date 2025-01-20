@interface WFAirDropVisibilityParameter
- (NSArray)possibleStates;
- (WFAirDropVisibilityParameter)initWithDefinition:(id)a3;
- (WFPropertyListObject)defaultSerializedRepresentation;
- (id)localizedLabelForPossibleState:(id)a3;
@end

@implementation WFAirDropVisibilityParameter

- (NSArray)possibleStates
{
  v2 = self;
  uint64_t v3 = sub_23C3A17AC();

  if (v3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AEEE438);
    v4 = (void *)sub_23C6D5698();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSArray *)v4;
}

- (id)localizedLabelForPossibleState:(id)a3
{
  return sub_23C3A23EC(self, (uint64_t)a2, a3, (void (*)(id))sub_23C3A1944);
}

- (WFPropertyListObject)defaultSerializedRepresentation
{
  v2 = self;
  uint64_t v3 = (void *)sub_23C3A1BD4();

  return (WFPropertyListObject *)v3;
}

- (WFAirDropVisibilityParameter)initWithDefinition:(id)a3
{
  return (WFAirDropVisibilityParameter *)sub_23C3A1BEC(a3);
}

@end