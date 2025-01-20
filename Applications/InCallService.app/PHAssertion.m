@interface PHAssertion
- (_TtC13InCallService11PHAssertion)init;
- (_TtC13InCallService11PHAssertion)initWithReason:(id)a3;
- (void)releaseAssertion;
@end

@implementation PHAssertion

- (_TtC13InCallService11PHAssertion)initWithReason:(id)a3
{
  return (_TtC13InCallService11PHAssertion *)sub_1001CFC60(a3);
}

- (void)releaseAssertion
{
  v2 = self;
  sub_1001CFDC8();
}

- (_TtC13InCallService11PHAssertion)init
{
}

- (void).cxx_destruct
{
  swift_release();
}

@end