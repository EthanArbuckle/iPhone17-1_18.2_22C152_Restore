@interface CDMCcqrAerCbROverridesProxy
- (_TtC13CDMFoundation27CDMCcqrAerCbROverridesProxy)initWithUseTrie:(BOOL)a3 useMemory:(BOOL)a4;
- (_TtC13CDMFoundation27CDMCcqrAerCbROverridesProxy)initWithUseTrie:(BOOL)a3 useMemory:(BOOL)a4 templatePattern:(id)a5;
- (id)getRewriteHypothesisWithOverrideUtterance:(id)a3;
- (id)matchWithInputs:(id)a3;
@end

@implementation CDMCcqrAerCbROverridesProxy

- (_TtC13CDMFoundation27CDMCcqrAerCbROverridesProxy)initWithUseTrie:(BOOL)a3 useMemory:(BOOL)a4 templatePattern:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  if (a5)
  {
    uint64_t v7 = sub_2265FB0A0();
    unint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    unint64_t v9 = 0;
  }
  return (_TtC13CDMFoundation27CDMCcqrAerCbROverridesProxy *)CDMCcqrAerCbROverridesProxy.init(useTrie:useMemory:templatePattern:)(v6, v5, v7, v9);
}

- (id)matchWithInputs:(id)a3
{
  sub_2263BDC3C(0, (unint64_t *)&unk_26ABD4E70);
  sub_2265FB380();
  swift_bridgeObjectRelease();
  return 0;
}

- (id)getRewriteHypothesisWithOverrideUtterance:(id)a3
{
  sub_2265FB0A0();
  v4 = self;
  BOOL v5 = (void *)sub_226431120();

  swift_bridgeObjectRelease();
  return v5;
}

- (_TtC13CDMFoundation27CDMCcqrAerCbROverridesProxy)initWithUseTrie:(BOOL)a3 useMemory:(BOOL)a4
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC13CDMFoundation27CDMCcqrAerCbROverridesProxy____lazy_storage___captureGroupExpression);
  sub_226432374(v3);
}

@end