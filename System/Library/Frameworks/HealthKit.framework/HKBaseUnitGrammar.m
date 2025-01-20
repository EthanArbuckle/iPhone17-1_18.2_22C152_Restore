@interface HKBaseUnitGrammar
@end

@implementation HKBaseUnitGrammar

id ___HKBaseUnitGrammar_block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 objectAtIndexedSubscript:0];
  v3 = [v2 evaluate];

  return v3;
}

BOOL ___HKBaseUnitGrammar_block_invoke_4(uint64_t a1, uint64_t a2)
{
  return a2 == 10;
}

id ___HKBaseUnitGrammar_block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 objectAtIndexedSubscript:0];
  v4 = [v3 evaluate];
  v5 = [v2 objectAtIndexedSubscript:1];

  v6 = [v5 evaluate];
  v7 = +[HKBaseUnit _uniquedUnitWithPrefix:v4 rootUnit:v6];

  return v7;
}

void ___HKBaseUnitGrammar_block_invoke()
{
  v70[1] = *MEMORY[0x1E4F143B8];
  v0 = +[_HKCFGNonTerminal nonTerminalWithLabel:@"U"];
  uint64_t v1 = +[_HKCFGNonTerminal nonTerminalWithLabel:@"R"];
  uint64_t v2 = +[_HKCFGNonTerminal nonTerminalWithLabel:@"P"];
  v3 = +[_HKCFGNonTerminal nonTerminalWithLabel:@"Q"];
  [v3 setCharactersToBeSkipped:0];
  v52 = +[_HKCFGNonTerminal nonTerminalWithLabel:@"M"];
  [v52 setCharactersToBeSkipped:0];
  v70[0] = v1;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:1];
  [v0 addReplacementRuleWithExpressions:v4 nodeEvaluator:&__block_literal_global_1022];

  v51 = (void *)v2;
  v69[0] = v2;
  v69[1] = v3;
  v53 = v3;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:2];
  [v0 addReplacementRuleWithExpressions:v5 nodeEvaluator:&__block_literal_global_1025];

  v6 = off_1E58BB000;
  uint64_t v7 = +[_HKCFGTerminal terminalMatchingIntegerWithCondition:&__block_literal_global_1029];
  uint64_t v8 = +[_HKCFGTerminal terminalMatchingIntegerWithCondition:&__block_literal_global_1031];
  v68[0] = v7;
  v68[1] = @"^";
  v68[2] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:3];
  [v0 addReplacementRuleWithExpressions:v9 nodeEvaluator:&__block_literal_global_1036];

  v47 = (void *)v8;
  v48 = (void *)v7;
  v67[0] = v7;
  v67[1] = @"^";
  v67[2] = v8;
  v67[3] = v0;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:4];
  v50 = v0;
  v11 = v0;
  v12 = (void *)v1;
  [v11 addReplacementRuleWithExpressions:v10 nodeEvaluator:&__block_literal_global_1038];

  uint64_t v13 = 0;
  v14 = &__SIUnitDefinitions;
  do
  {
    v15 = *v14;
    v14 += 6;
    v16 = [NSString stringWithUTF8String:v15];
    v17 = [(__objc2_class *)v6[205] terminalMatchingString:v16 caseSensitive:v13 != 2];
    [v17 setIsPrivate:(0x1D080uLL >> v13) & 1];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = ___HKBaseUnitGrammar_block_invoke_8;
    aBlock[3] = &unk_1E58C7500;
    id v59 = v16;
    v18 = v6;
    id v19 = v16;
    v20 = _Block_copy(aBlock);
    v66 = v17;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v66 count:1];
    [v12 addReplacementRuleWithExpressions:v21 nodeEvaluator:v20];

    v65 = v17;
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v65 count:1];
    [v53 addReplacementRuleWithExpressions:v22 nodeEvaluator:v20];

    v6 = v18;
    ++v13;
  }
  while (v13 != 17);
  v64 = v52;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v64 count:1];
  [v12 addReplacementRuleWithExpressions:v23 nodeEvaluator:&__block_literal_global_1040];

  v63 = v52;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v63 count:1];
  [v53 addReplacementRuleWithExpressions:v24 nodeEvaluator:&__block_literal_global_1040];

  for (uint64_t i = 0; i != 222; i += 6)
  {
    v26 = [NSString stringWithUTF8String:(&__OtherUnitDefinitions)[i]];
    v27 = [(__objc2_class *)v18[205] terminalMatchingString:v26 caseSensitive:1];
    [v27 setIsPrivate:i == 192];
    v62 = v27;
    v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v62 count:1];
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = ___HKBaseUnitGrammar_block_invoke_10;
    v56[3] = &unk_1E58C7500;
    id v57 = v26;
    id v29 = v26;
    [v12 addReplacementRuleWithExpressions:v28 nodeEvaluator:v56];
  }
  v49 = v12;
  uint64_t v30 = 0;
  unint64_t v31 = 0x1E4F1C000uLL;
  unint64_t v32 = 0x1E4F29000uLL;
  do
  {
    v33 = [NSString stringWithUTF8String:(&__PrefixDefinitions)[v30]];
    v61 = v33;
    v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v61 count:1];
    [v51 addReplacementRuleWithExpressions:v34 nodeEvaluator:&__block_literal_global_1042];

    v30 += 2;
  }
  while (v30 != 28);
  uint64_t v35 = 0;
  v36 = &__ContextSpecificUnitDefinitions;
  do
  {
    v37 = *v36;
    v36 += 6;
    v38 = [*(id *)(v32 + 24) stringWithUTF8String:v37];
    v39 = [(__objc2_class *)v18[205] terminalMatchingString:v38 caseSensitive:1];
    [v39 setIsPrivate:(0x1D080uLL >> v35) & 1];
    v40 = [(__objc2_class *)v18[205] terminalMatchingDoubleWithCondition:&__block_literal_global_1045];
    [v40 setIsPrivate:v35 != 0];
    v60[0] = v39;
    v60[1] = @"<";
    v60[2] = v40;
    v60[3] = @">";
    [*(id *)(v31 + 2424) arrayWithObjects:v60 count:4];
    unint64_t v41 = v31;
    v43 = unint64_t v42 = v32;
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = ___HKBaseUnitGrammar_block_invoke_13;
    v54[3] = &unk_1E58C2C98;
    id v55 = v38;
    id v44 = v38;
    [v52 addReplacementRuleWithExpressions:v43 nodeEvaluator:v54];

    unint64_t v32 = v42;
    unint64_t v31 = v41;

    ++v35;
  }
  while (v35 != 4);
  uint64_t v45 = +[_HKContextFreeGrammar grammarWithRootNonTerminal:v50 emptyStringEvaluator:&__block_literal_global_1055];
  v46 = (void *)_HKBaseUnitGrammar___grammar;
  _HKBaseUnitGrammar___grammar = v45;
}

BOOL ___HKBaseUnitGrammar_block_invoke_5(uint64_t a1, uint64_t a2)
{
  return a2 > 0;
}

id ___HKBaseUnitGrammar_block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 objectAtIndexedSubscript:0];
  v4 = [v3 evaluate];
  [v4 doubleValue];
  long double v6 = v5;
  uint64_t v7 = [v2 objectAtIndexedSubscript:2];

  uint64_t v8 = [v7 evaluate];
  [v8 doubleValue];
  double v10 = pow(v6, v9);

  v11 = [NSNumber numberWithDouble:v10];
  v12 = +[HKBaseUnit _uniquedRootUnit:@"count"];
  uint64_t v13 = +[HKBaseUnit _uniquedUnitWithPrefix:0 conversionConstant:v11 rootUnit:v12];

  return v13;
}

id ___HKBaseUnitGrammar_block_invoke_7(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 objectAtIndexedSubscript:0];
  v4 = [v3 evaluate];
  [v4 doubleValue];
  long double v6 = v5;
  uint64_t v7 = [v2 objectAtIndexedSubscript:2];
  uint64_t v8 = [v7 evaluate];
  [v8 doubleValue];
  double v10 = pow(v6, v9);

  v11 = [NSNumber numberWithDouble:v10];
  v12 = [v2 objectAtIndexedSubscript:3];

  uint64_t v13 = [v12 evaluate];
  v14 = +[HKBaseUnit _uniquedUnitWithPrefix:0 conversionConstant:v11 rootUnit:v13];

  return v14;
}

id ___HKBaseUnitGrammar_block_invoke_8(uint64_t a1)
{
  return +[HKBaseUnit _uniquedRootUnit:*(void *)(a1 + 32)];
}

id ___HKBaseUnitGrammar_block_invoke_9(uint64_t a1, void *a2)
{
  id v2 = [a2 objectAtIndexedSubscript:0];
  v3 = [v2 evaluate];

  return v3;
}

id ___HKBaseUnitGrammar_block_invoke_10(uint64_t a1)
{
  return +[HKBaseUnit _uniquedRootUnit:*(void *)(a1 + 32)];
}

id ___HKBaseUnitGrammar_block_invoke_11(uint64_t a1, void *a2)
{
  id v2 = [a2 objectAtIndexedSubscript:0];
  v3 = [v2 evaluate];

  return v3;
}

BOOL ___HKBaseUnitGrammar_block_invoke_12(double a1)
{
  return a1 > 0.0;
}

id ___HKBaseUnitGrammar_block_invoke_13(uint64_t a1, void *a2)
{
  v3 = [a2 objectAtIndexedSubscript:2];
  v4 = [v3 evaluate];
  double v5 = +[HKBaseUnit _uniquedRootUnit:*(void *)(a1 + 32)];
  long double v6 = +[HKBaseUnit _uniquedUnitWithPrefix:0 conversionConstant:v4 rootUnit:v5];

  return v6;
}

id ___HKBaseUnitGrammar_block_invoke_14()
{
  return +[HKUnit _nullUnit];
}

@end