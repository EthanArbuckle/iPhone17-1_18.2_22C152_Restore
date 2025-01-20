@interface WFLogOutUserAction
- (WFLogOutUserAction)init;
- (WFLogOutUserAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5;
@end

@implementation WFLogOutUserAction

- (WFLogOutUserAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5
{
  uint64_t v7 = sub_23C6D5568();
  uint64_t v9 = v8;
  if (a5)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268BA62F0);
    a5 = (id)sub_23C6D5418();
  }
  id v10 = a4;
  return (WFLogOutUserAction *)sub_23C36C230(v7, v9, a4, (uint64_t)a5);
}

- (WFLogOutUserAction)init
{
  return (WFLogOutUserAction *)sub_23C36C39C();
}

@end