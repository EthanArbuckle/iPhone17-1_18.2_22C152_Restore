@interface IRCandidateWrapper
- (BOOL)enableOrderOfExecutionLogging;
- (BOOL)isConservativeFiltered;
- (BOOL)isFiltered;
- (BOOL)isLockScreenControl;
- (BOOL)isSameSpace;
- (BOOL)logOrderOfExecution:(int64_t)a3 withRuleKey:(id)a4 ruleType:(id)a5 andReturn:(BOOL)a6;
- (BOOL)sameSpaceBasedOnBLE;
- (BOOL)sameSpaceBasedOnBrokeredLOI;
- (BOOL)sameSpaceBasedOnHistory;
- (BOOL)sameSpaceBasedOnMiLo;
- (BOOL)sameSpaceBasedOnPDRFence;
- (BOOL)sameSpaceBasedOnUWB;
- (IRCandidateDO)candidate;
- (IRCandidateResult)candidateResult;
- (IRCandidateWrapper)initWithCandidate:(id)a3;
- (IRCandidateWrapper)initWithCandidate:(id)a3 andDefaultClassification:(int64_t)a4 logOrderOfExecution:(BOOL)a5;
- (IRInspectionOrderOfExectionForCandidate)orderOfExecution;
- (NSMutableDictionary)internalOrderOfExecution;
- (NSMutableDictionary)ruleInspections;
- (NSNumber)bleRange;
- (NSNumber)isCallToAction;
- (NSNumber)sortingHint;
- (NSNumber)uwbRange;
- (NSString)nominatedClassificationDesc;
- (int64_t)nominatedClassification;
- (void)logOrderOfExecution:(int64_t)a3 withRuleKey:(id)a4 ruleType:(id)a5;
- (void)setBleRange:(id)a3;
- (void)setCandidate:(id)a3;
- (void)setCandidateResult:(id)a3;
- (void)setClassification:(int64_t)a3 withDescription:(id)a4;
- (void)setEnableOrderOfExecutionLogging:(BOOL)a3;
- (void)setEvaluation:(id)a3 forRuleKey:(id)a4;
- (void)setInternalOrderOfExecution:(id)a3;
- (void)setIsCallToAction:(id)a3;
- (void)setIsConservativeFiltered:(BOOL)a3;
- (void)setIsFiltered:(BOOL)a3;
- (void)setIsLockScreenControl:(BOOL)a3;
- (void)setIsSameSpace:(BOOL)a3;
- (void)setNominatedClassification:(int64_t)a3;
- (void)setNominatedClassificationDesc:(id)a3;
- (void)setRuleInspections:(id)a3;
- (void)setSameSpaceBasedOnBLE:(BOOL)a3;
- (void)setSameSpaceBasedOnBrokeredLOI:(BOOL)a3;
- (void)setSameSpaceBasedOnHistory:(BOOL)a3;
- (void)setSameSpaceBasedOnMiLo:(BOOL)a3;
- (void)setSameSpaceBasedOnPDRFence:(BOOL)a3;
- (void)setSameSpaceBasedOnUWB:(BOOL)a3;
- (void)setSortingHint:(id)a3;
- (void)setUwbRange:(id)a3;
@end

@implementation IRCandidateWrapper

- (IRCandidateWrapper)initWithCandidate:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IRCandidateWrapper;
  v5 = [(IRCandidateWrapper *)&v11 init];
  v6 = v5;
  if (v5)
  {
    [(IRCandidateWrapper *)v5 setCandidate:v4];
    id v7 = objc_alloc(MEMORY[0x263F500C0]);
    v8 = +[IRCandidateDO candidateFromCandidateDO:v4];
    v9 = (void *)[v7 initWithCandidate:v8 classification:0 andClassificationDescription:@"No classification assigned"];
    [(IRCandidateWrapper *)v6 setCandidateResult:v9];
  }
  return v6;
}

- (IRCandidateWrapper)initWithCandidate:(id)a3 andDefaultClassification:(int64_t)a4 logOrderOfExecution:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)IRCandidateWrapper;
  v9 = [(IRCandidateWrapper *)&v14 init];
  if (v9)
  {
    v10 = (void *)[objc_alloc(MEMORY[0x263F500C0]) initWithCandidate:v8 classification:a4 andClassificationDescription:@"No classification assigned"];
    [(IRCandidateWrapper *)v9 setCandidateResult:v10];

    objc_super v11 = objc_opt_new();
    [(IRCandidateWrapper *)v9 setRuleInspections:v11];

    v12 = objc_opt_new();
    [(IRCandidateWrapper *)v9 setInternalOrderOfExecution:v12];

    [(IRCandidateWrapper *)v9 setEnableOrderOfExecutionLogging:v5];
  }

  return v9;
}

- (void)setEvaluation:(id)a3 forRuleKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v9 = [[IRRuleInspection alloc] initWithRuleName:v6 evaluation:v7];

  id v8 = [(IRCandidateWrapper *)self ruleInspections];
  [v8 setObject:v9 forKeyedSubscript:v6];
}

- (void)setClassification:(int64_t)a3 withDescription:(id)a4
{
  id v6 = a4;
  id v7 = [(IRCandidateWrapper *)self candidateResult];
  [v7 setClassification:a3 withDescription:v6];
}

- (void)logOrderOfExecution:(int64_t)a3 withRuleKey:(id)a4 ruleType:(id)a5
{
  id v16 = a4;
  id v7 = a5;
  if ([(IRCandidateWrapper *)self enableOrderOfExecutionLogging])
  {
    id v8 = IRCandidateClassificationToString();
    v9 = [(IRCandidateWrapper *)self internalOrderOfExecution];
    v10 = [v9 objectForKeyedSubscript:v8];

    if (!v10)
    {
      objc_super v11 = objc_opt_new();
      v12 = [(IRCandidateWrapper *)self internalOrderOfExecution];
      [v12 setObject:v11 forKeyedSubscript:v8];
    }
    v13 = [(IRCandidateWrapper *)self internalOrderOfExecution];
    objc_super v14 = [v13 objectForKeyedSubscript:v8];
    v15 = [[IRInspectionOrderOfExectionElement alloc] initWithRuleName:v16 andRuleType:v7];
    [v14 addObject:v15];
  }
}

- (BOOL)logOrderOfExecution:(int64_t)a3 withRuleKey:(id)a4 ruleType:(id)a5 andReturn:(BOOL)a6
{
  return a6;
}

- (IRInspectionOrderOfExectionForCandidate)orderOfExecution
{
  v3 = objc_opt_new();
  id v4 = objc_opt_new();
  BOOL v5 = [(IRCandidateWrapper *)self internalOrderOfExecution];
  id v6 = [v5 allKeys];
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  objc_super v11 = __38__IRCandidateWrapper_orderOfExecution__block_invoke;
  v12 = &unk_2653A06F0;
  id v13 = v4;
  objc_super v14 = self;
  id v7 = v4;
  [v6 enumerateObjectsUsingBlock:&v9];

  objc_msgSend(v3, "setExecutionOrderForClassification:", v7, v9, v10, v11, v12);

  return (IRInspectionOrderOfExectionForCandidate *)v3;
}

void __38__IRCandidateWrapper_orderOfExecution__block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v6 = [v3 internalOrderOfExecution];
  BOOL v5 = [v6 objectForKeyedSubscript:v4];
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v4];
}

- (IRCandidateResult)candidateResult
{
  return self->_candidateResult;
}

- (void)setCandidateResult:(id)a3
{
}

- (NSMutableDictionary)ruleInspections
{
  return self->_ruleInspections;
}

- (void)setRuleInspections:(id)a3
{
}

- (IRCandidateDO)candidate
{
  return self->_candidate;
}

- (void)setCandidate:(id)a3
{
}

- (BOOL)sameSpaceBasedOnMiLo
{
  return self->_sameSpaceBasedOnMiLo;
}

- (void)setSameSpaceBasedOnMiLo:(BOOL)a3
{
  self->_sameSpaceBasedOnMiLo = a3;
}

- (BOOL)sameSpaceBasedOnBrokeredLOI
{
  return self->_sameSpaceBasedOnBrokeredLOI;
}

- (void)setSameSpaceBasedOnBrokeredLOI:(BOOL)a3
{
  self->_sameSpaceBasedOnBrokeredLOI = a3;
}

- (BOOL)sameSpaceBasedOnUWB
{
  return self->_sameSpaceBasedOnUWB;
}

- (void)setSameSpaceBasedOnUWB:(BOOL)a3
{
  self->_sameSpaceBasedOnUWB = a3;
}

- (BOOL)sameSpaceBasedOnBLE
{
  return self->_sameSpaceBasedOnBLE;
}

- (void)setSameSpaceBasedOnBLE:(BOOL)a3
{
  self->_sameSpaceBasedOnBLE = a3;
}

- (BOOL)sameSpaceBasedOnPDRFence
{
  return self->_sameSpaceBasedOnPDRFence;
}

- (void)setSameSpaceBasedOnPDRFence:(BOOL)a3
{
  self->_sameSpaceBasedOnPDRFence = a3;
}

- (BOOL)sameSpaceBasedOnHistory
{
  return self->_sameSpaceBasedOnHistory;
}

- (void)setSameSpaceBasedOnHistory:(BOOL)a3
{
  self->_sameSpaceBasedOnHistory = a3;
}

- (BOOL)isSameSpace
{
  return self->_isSameSpace;
}

- (void)setIsSameSpace:(BOOL)a3
{
  self->_isSameSpace = a3;
}

- (NSNumber)uwbRange
{
  return self->_uwbRange;
}

- (void)setUwbRange:(id)a3
{
}

- (NSNumber)bleRange
{
  return self->_bleRange;
}

- (void)setBleRange:(id)a3
{
}

- (int64_t)nominatedClassification
{
  return self->_nominatedClassification;
}

- (void)setNominatedClassification:(int64_t)a3
{
  self->_nominatedClassification = a3;
}

- (NSString)nominatedClassificationDesc
{
  return self->_nominatedClassificationDesc;
}

- (void)setNominatedClassificationDesc:(id)a3
{
}

- (NSNumber)sortingHint
{
  return self->_sortingHint;
}

- (void)setSortingHint:(id)a3
{
  self->_sortingHint = (NSNumber *)a3;
}

- (NSNumber)isCallToAction
{
  return self->_isCallToAction;
}

- (void)setIsCallToAction:(id)a3
{
  self->_isCallToAction = (NSNumber *)a3;
}

- (BOOL)isLockScreenControl
{
  return self->_isLockScreenControl;
}

- (void)setIsLockScreenControl:(BOOL)a3
{
  self->_isLockScreenControl = a3;
}

- (BOOL)isConservativeFiltered
{
  return self->_isConservativeFiltered;
}

- (void)setIsConservativeFiltered:(BOOL)a3
{
  self->_isConservativeFiltered = a3;
}

- (BOOL)isFiltered
{
  return self->_isFiltered;
}

- (void)setIsFiltered:(BOOL)a3
{
  self->_isFiltered = a3;
}

- (NSMutableDictionary)internalOrderOfExecution
{
  return self->_internalOrderOfExecution;
}

- (void)setInternalOrderOfExecution:(id)a3
{
}

- (BOOL)enableOrderOfExecutionLogging
{
  return self->_enableOrderOfExecutionLogging;
}

- (void)setEnableOrderOfExecutionLogging:(BOOL)a3
{
  self->_enableOrderOfExecutionLogging = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalOrderOfExecution, 0);
  objc_storeStrong((id *)&self->_nominatedClassificationDesc, 0);
  objc_storeStrong((id *)&self->_bleRange, 0);
  objc_storeStrong((id *)&self->_uwbRange, 0);
  objc_storeStrong((id *)&self->_candidate, 0);
  objc_storeStrong((id *)&self->_ruleInspections, 0);

  objc_storeStrong((id *)&self->_candidateResult, 0);
}

@end