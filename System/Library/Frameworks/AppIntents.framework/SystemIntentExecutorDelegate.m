@interface SystemIntentExecutorDelegate
- (_TtC10AppIntents28SystemIntentExecutorDelegate)init;
- (void)executor:(id)a3 didCompleteExecutionWithResult:(id)a4 error:(id)a5;
- (void)executor:(id)a3 needsValueWithRequest:(id)a4;
@end

@implementation SystemIntentExecutorDelegate

- (void)executor:(id)a3 didCompleteExecutionWithResult:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  id v11 = a5;
  sub_236299748((uint64_t)v11, a4, a5);
}

- (void)executor:(id)a3 needsValueWithRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_2362999AC();
}

- (_TtC10AppIntents28SystemIntentExecutorDelegate)init
{
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC10AppIntents28SystemIntentExecutorDelegate_continuation;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26885C4D8);
  v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

@end