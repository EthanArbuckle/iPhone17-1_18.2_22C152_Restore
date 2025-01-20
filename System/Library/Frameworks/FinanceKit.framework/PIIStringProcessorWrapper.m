@interface PIIStringProcessorWrapper
+ (id)makeProcessor;
- (_TtC10FinanceKit25PIIStringProcessorWrapper)init;
- (id)redactFromString:(id)a3;
- (id)redactFromString:(id)a3 forCountryCodes:(id)a4;
@end

@implementation PIIStringProcessorWrapper

+ (id)makeProcessor
{
  id v2 = _s10FinanceKit25PIIStringProcessorWrapperC04makeD0ACyFZ_0();

  return v2;
}

- (id)redactFromString:(id)a3
{
  uint64_t v4 = sub_2439582D0();
  uint64_t v6 = v5;
  v7 = self;
  PIIStringProcessor.redact(from:forCountryCodes:)(v4, v6, MEMORY[0x263F8EE88], (uint64_t)&v10);
  if (v11)
  {

    swift_bridgeObjectRelease();
  }
  else
  {
    sub_2433B5EB0();
  }
  v8 = (void *)sub_2439582A0();
  swift_bridgeObjectRelease();

  return v8;
}

- (id)redactFromString:(id)a3 forCountryCodes:(id)a4
{
  uint64_t v5 = sub_2439582D0();
  uint64_t v7 = v6;
  uint64_t v8 = sub_2439588E0();
  v9 = self;
  PIIStringProcessor.redact(from:forCountryCodes:)(v5, v7, v8, (uint64_t)&v12);
  if ((v13 & 1) == 0)
  {
    swift_bridgeObjectRetain();
    sub_2433B5EB0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  uint64_t v10 = (void *)sub_2439582A0();
  swift_bridgeObjectRelease();

  return v10;
}

- (_TtC10FinanceKit25PIIStringProcessorWrapper)init
{
  result = (_TtC10FinanceKit25PIIStringProcessorWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end