@interface WFSetHotspotPasswordAction
- (WFSetHotspotPasswordAction)init;
- (WFSetHotspotPasswordAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5;
- (id)contentDestinationWithError:(id *)a3;
- (id)localizedDescriptionNoteWithContext:(id)a3;
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (void)runWithInput:(WFContentCollection *)a3 completionHandler:(id)a4;
@end

@implementation WFSetHotspotPasswordAction

- (void)runWithInput:(WFContentCollection *)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  v9 = self;
  sub_23C413EEC((uint64_t)&unk_268BA6EA8, (uint64_t)v7);
}

- (id)localizedDescriptionNoteWithContext:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_23C3BFC28(v4);
  uint64_t v7 = v6;

  if (v7)
  {
    v8 = (void *)sub_23C6D5528();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)contentDestinationWithError:(id *)a3
{
  v3 = self;
  id v4 = sub_23C3BFF54();

  return v4;
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  if (a3)
  {
    uint64_t v6 = sub_23C6D5568();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  uint64_t v9 = sub_23C6D5568();
  uint64_t v11 = v10;
  uint64_t v12 = sub_23C6D5568();
  uint64_t v14 = v13;
  v15 = self;
  sub_23C3C0034(v6, v8, v9, v11, v12, v14);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v16 = (void *)sub_23C6D5528();
  swift_bridgeObjectRelease();
  return v16;
}

- (WFSetHotspotPasswordAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5
{
  uint64_t v7 = sub_23C6D5568();
  uint64_t v9 = v8;
  if (a5)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268BA62F0);
    a5 = (id)sub_23C6D5418();
  }
  id v10 = a4;
  return (WFSetHotspotPasswordAction *)sub_23C3C029C(v7, v9, a4, (uint64_t)a5);
}

- (WFSetHotspotPasswordAction)init
{
  return (WFSetHotspotPasswordAction *)sub_23C3C0408();
}

@end