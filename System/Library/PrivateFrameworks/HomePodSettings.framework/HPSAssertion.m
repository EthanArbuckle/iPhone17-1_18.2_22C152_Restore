@interface HPSAssertion
- (HPSAssertion)init;
- (HPSAssertion)initWithIdentifier:(id)a3 assertionType:(unint64_t)a4 connectionProvider:(id)a5;
- (NSString)identifier;
- (void)invalidate;
- (void)invalidateWithCompletion:(id)a3;
@end

@implementation HPSAssertion

- (NSString)identifier
{
  sub_23D170A60();
  v2 = (void *)sub_23D244FC8();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (HPSAssertion)initWithIdentifier:(id)a3 assertionType:(unint64_t)a4 connectionProvider:(id)a5
{
  return (HPSAssertion *)Assertion.init(identifier:assertionType:connectionProvider:)();
}

- (void)invalidate
{
  v2 = self;
  sub_23D1714B8();
}

- (void)invalidateWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_23D171518((char *)v5, (void (**)(void, void))v4);
  _Block_release(v4);
}

- (HPSAssertion)init
{
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___HPSAssertion_logger;
  uint64_t v4 = sub_23D2447C8();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  uint64_t v5 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___HPSAssertion_assertionInvalidationHandler);
  sub_23D167A50(v5);
}

@end