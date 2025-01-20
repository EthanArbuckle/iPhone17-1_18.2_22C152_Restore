@interface ProcessAssertion.JetRBSAssertion
- (_TtCV9JetEngine16ProcessAssertionP33_DB8C5F477783C81D7997C496FBB2240A15JetRBSAssertion)initWithExplanation:(id)a3 target:(id)a4 attributes:(id)a5;
- (void)dealloc;
@end

@implementation ProcessAssertion.JetRBSAssertion

- (void)dealloc
{
  v2 = self;
  sub_19EEAF7D8();
}

- (_TtCV9JetEngine16ProcessAssertionP33_DB8C5F477783C81D7997C496FBB2240A15JetRBSAssertion)initWithExplanation:(id)a3 target:(id)a4 attributes:(id)a5
{
  sub_19F1DBD7C();
  sub_19EED8600();
  sub_19F1DC16C();
  id v7 = a4;
  v8 = (void *)sub_19F1DBD4C();
  swift_bridgeObjectRelease();
  v9 = (void *)sub_19F1DC14C();
  swift_bridgeObjectRelease();
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for ProcessAssertion.JetRBSAssertion();
  v10 = [(ProcessAssertion.JetRBSAssertion *)&v12 initWithExplanation:v8 target:v7 attributes:v9];

  return v10;
}

@end