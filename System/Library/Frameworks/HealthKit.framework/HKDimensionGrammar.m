@interface HKDimensionGrammar
@end

@implementation HKDimensionGrammar

void ___HKDimensionGrammar_block_invoke()
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v0 = +[_HKCFGNonTerminal nonTerminalWithLabel:@"D"];
  for (uint64_t i = 0; i != 84; i += 4)
  {
    v2 = [NSString stringWithUTF8String:(&__DimensionDefinitions)[i]];
    v11[0] = v2;
    v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = ___HKDimensionGrammar_block_invoke_2;
    v8[3] = &unk_1E58C2C98;
    id v9 = v2;
    id v4 = v2;
    [v0 addReplacementRuleWithExpressions:v3 nodeEvaluator:v8];
  }
  v10 = @"(null)";
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
  [v0 addReplacementRuleWithExpressions:v5 nodeEvaluator:&__block_literal_global_251];

  uint64_t v6 = +[_HKContextFreeGrammar grammarWithRootNonTerminal:v0];
  v7 = (void *)_HKDimensionGrammar___grammar;
  _HKDimensionGrammar___grammar = v6;
}

id ___HKDimensionGrammar_block_invoke_2(uint64_t a1)
{
  return +[_HKBaseDimension _uniquedDefinedDimensionWithName:*(void *)(a1 + 32)];
}

id ___HKDimensionGrammar_block_invoke_3()
{
  return +[_HKBaseDimension nullDimension];
}

@end