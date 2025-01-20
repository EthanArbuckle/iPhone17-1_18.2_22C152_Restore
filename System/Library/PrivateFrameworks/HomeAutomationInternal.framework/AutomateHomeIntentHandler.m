@interface AutomateHomeIntentHandler
- (_TtC22HomeAutomationInternal25AutomateHomeIntentHandler)init;
- (void)confirmAutomateHome:(id)a3 completion:(id)a4;
- (void)handleAutomateHome:(id)a3 completion:(id)a4;
- (void)resolveAutomatableTaskForAutomateHome:(id)a3 withCompletion:(id)a4;
- (void)resolveTriggerForAutomateHome:(id)a3 withCompletion:(id)a4;
@end

@implementation AutomateHomeIntentHandler

- (void)resolveTriggerForAutomateHome:(id)a3 withCompletion:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  sub_22E67E90C(v7, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)resolveAutomatableTaskForAutomateHome:(id)a3 withCompletion:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  sub_22E67FBF4(v7, (uint64_t)v8, (void (**)(void, id))v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)confirmAutomateHome:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  sub_22E681CB8((uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)handleAutomateHome:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  sub_22E67B9D8(v8, (uint64_t)sub_22E561214, v7);

  swift_release();
}

- (_TtC22HomeAutomationInternal25AutomateHomeIntentHandler)init
{
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC22HomeAutomationInternal25AutomateHomeIntentHandler_climateAttributes) = (Class)&unk_26E2092C8;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AutomateHomeIntentHandler();
  return [(AutomateHomeIntentHandler *)&v3 init];
}

- (void).cxx_destruct
{
}

@end