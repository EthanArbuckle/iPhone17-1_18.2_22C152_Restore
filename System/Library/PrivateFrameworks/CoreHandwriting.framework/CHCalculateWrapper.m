@interface CHCalculateWrapper
+ (BOOL)isLatexTranscriptionValidExpression:(id)a3;
+ (BOOL)isTextTranscriptionUnitConversion:(id)a3 locales:(id)a4;
+ (id)textTranscriptionForLatex:(id)a3;
- (CHCalculateWrapper)init;
@end

@implementation CHCalculateWrapper

+ (id)textTranscriptionForLatex:(id)a3
{
  sub_1C4C2B578();
  sub_1C4930BB8();
  swift_bridgeObjectRelease();
  v3 = (void *)sub_1C4C2B548();
  swift_bridgeObjectRelease();
  return v3;
}

+ (BOOL)isTextTranscriptionUnitConversion:(id)a3 locales:(id)a4
{
  uint64_t v4 = sub_1C4C2B578();
  uint64_t v6 = v5;
  sub_1C4C2B378();
  uint64_t v7 = sub_1C4C2B5B8();
  LOBYTE(v4) = sub_1C4930DCC(v4, v6, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v4 & 1;
}

+ (BOOL)isLatexTranscriptionValidExpression:(id)a3
{
  sub_1C4C2B578();
  char v3 = sub_1C4930F80();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

- (CHCalculateWrapper)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CHCalculateWrapper();
  return [(CHCalculateWrapper *)&v3 init];
}

@end