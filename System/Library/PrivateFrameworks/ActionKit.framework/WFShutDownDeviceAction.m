@interface WFShutDownDeviceAction
- (BOOL)setParameterState:(id)a3 forKey:(id)a4;
- (NSString)iconSymbolName;
- (WFShutDownDeviceAction)init;
- (WFShutDownDeviceAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFShutDownDeviceAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_23C3F93E0();
}

- (NSString)iconSymbolName
{
  v2 = self;
  sub_23C3F9D9C();
  uint64_t v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_23C6D5528();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (BOOL)setParameterState:(id)a3 forKey:(id)a4
{
  sub_23C6D5568();
  swift_unknownObjectRetain();
  v6 = self;
  unsigned __int8 v7 = sub_23C3FA028((uint64_t)a3);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  return v7 & 1;
}

- (WFShutDownDeviceAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5
{
  uint64_t v7 = sub_23C6D5568();
  uint64_t v9 = v8;
  if (a5)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268BA62F0);
    a5 = (id)sub_23C6D5418();
  }
  id v10 = a4;
  return (WFShutDownDeviceAction *)sub_23C3FA120(v7, v9, a4, (uint64_t)a5);
}

- (WFShutDownDeviceAction)init
{
  return (WFShutDownDeviceAction *)sub_23C3FA2E4();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end