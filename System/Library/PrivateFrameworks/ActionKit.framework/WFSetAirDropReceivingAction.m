@interface WFSetAirDropReceivingAction
- (WFSetAirDropReceivingAction)init;
- (WFSetAirDropReceivingAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5;
- (id)localizedDescriptionSummaryWithContext:(id)a3;
- (void)runWithInput:(WFContentCollection *)a3 completionHandler:(id)a4;
@end

@implementation WFSetAirDropReceivingAction

- (void)runWithInput:(WFContentCollection *)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  v9 = self;
  sub_23C413EEC((uint64_t)&unk_268BA6998, (uint64_t)v7);
}

- (id)localizedDescriptionSummaryWithContext:(id)a3
{
  return sub_23C3A23EC(self, (uint64_t)a2, a3, (void (*)(id))sub_23C3A2200);
}

- (WFSetAirDropReceivingAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5
{
  uint64_t v7 = sub_23C6D5568();
  uint64_t v9 = v8;
  if (a5)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268BA62F0);
    a5 = (id)sub_23C6D5418();
  }
  id v10 = a4;
  return (WFSetAirDropReceivingAction *)sub_23C3A247C(v7, v9, a4, (uint64_t)a5);
}

- (WFSetAirDropReceivingAction)init
{
  return (WFSetAirDropReceivingAction *)sub_23C3A2630();
}

- (void).cxx_destruct
{
}

@end