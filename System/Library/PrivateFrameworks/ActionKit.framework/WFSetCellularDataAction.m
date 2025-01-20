@interface WFSetCellularDataAction
- (NSArray)disabledOnPlatforms;
- (WFSetCellularDataAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5 schema:(id)a6 intent:(id)a7 resolvedIntentDescriptor:(id)a8 stringLocalizer:(id)a9;
@end

@implementation WFSetCellularDataAction

- (NSArray)disabledOnPlatforms
{
  v2 = self;
  sub_23C37AA4C();

  type metadata accessor for WFExecutionPlatform(0);
  v3 = (void *)sub_23C6D5698();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (WFSetCellularDataAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5 schema:(id)a6 intent:(id)a7 resolvedIntentDescriptor:(id)a8 stringLocalizer:(id)a9
{
  uint64_t v14 = sub_23C6D5568();
  uint64_t v16 = v15;
  if (a5)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268BA62F0);
    a5 = (id)sub_23C6D5418();
  }
  id v17 = a8;
  id v18 = a9;
  id v19 = a7;
  id v20 = a6;
  id v21 = a4;
  return (WFSetCellularDataAction *)sub_23C37AB58(v14, v16, a4, (uint64_t)a5, a6, a7, v17, a9);
}

@end