@interface LocalAppIntentsDispatcher.PerformActionExecutorDelegate
- (BOOL)executor:(id)a3 shouldRunShowOutputAction:(id)a4;
- (_TtCC18AppIntentsServices25LocalAppIntentsDispatcher29PerformActionExecutorDelegate)init;
- (void)executor:(id)a3 didCompleteExecutionWithResult:(id)a4 error:(id)a5;
- (void)executor:(id)a3 didPerformActionWithResult:(id)a4 error:(id)a5;
- (void)executor:(id)a3 needsActionConfirmationWithRequest:(id)a4;
- (void)executor:(id)a3 needsConfirmationWithRequest:(id)a4;
- (void)executor:(id)a3 needsContinueInAppWithRequest:(id)a4;
- (void)executor:(id)a3 needsDisambiguationWithRequest:(id)a4;
- (void)executor:(id)a3 needsValueWithRequest:(id)a4;
@end

@implementation LocalAppIntentsDispatcher.PerformActionExecutorDelegate

- (void)executor:(id)a3 didPerformActionWithResult:(id)a4 error:(id)a5
{
}

- (void)executor:(id)a3 didCompleteExecutionWithResult:(id)a4 error:(id)a5
{
}

- (void)executor:(id)a3 needsDisambiguationWithRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_247BE5E80();
}

- (void)executor:(id)a3 needsValueWithRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_247BE59C4();
}

- (void)executor:(id)a3 needsConfirmationWithRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_247BE5E80();
}

- (void)executor:(id)a3 needsActionConfirmationWithRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_247BE63E8();
}

- (void)executor:(id)a3 needsContinueInAppWithRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_247BE63E8();
}

- (BOOL)executor:(id)a3 shouldRunShowOutputAction:(id)a4
{
  return 0;
}

- (_TtCC18AppIntentsServices25LocalAppIntentsDispatcher29PerformActionExecutorDelegate)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC18AppIntentsServices25LocalAppIntentsDispatcher29PerformActionExecutorDelegate_actionMetadata));
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692AA3C0);
  OUTLINED_FUNCTION_66();
  v2();
  swift_bridgeObjectRelease();
}

@end