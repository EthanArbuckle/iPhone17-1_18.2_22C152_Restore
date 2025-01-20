@interface IRContextWrapper
- (IRContext)context;
- (IRContextWrapper)initWithName:(id)a3 andDefaultClassification:(int64_t)a4 andCandidates:(id)a5;
- (IRContextWrapper)initWithName:(id)a3 defaultClassification:(int64_t)a4;
- (IRPolicyInspection)policyInspection;
- (NSSet)candidates;
- (void)addCandidate:(id)a3 logOrderOfExecution:(BOOL)a4;
@end

@implementation IRContextWrapper

- (IRContextWrapper)initWithName:(id)a3 defaultClassification:(int64_t)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IRContextWrapper;
  v8 = [(IRContextWrapper *)&v13 init];
  v9 = v8;
  if (v8)
  {
    v8->_defaultClassification = a4;
    uint64_t v10 = objc_opt_new();
    candidates = v9->_candidates;
    v9->_candidates = (NSSet *)v10;

    objc_storeStrong((id *)&v9->_name, a3);
  }

  return v9;
}

- (IRContextWrapper)initWithName:(id)a3 andDefaultClassification:(int64_t)a4 andCandidates:(id)a5
{
  id v8 = a5;
  v9 = [(IRContextWrapper *)self initWithName:a3 defaultClassification:a4];
  uint64_t v10 = v9;
  if (v9)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __72__IRContextWrapper_initWithName_andDefaultClassification_andCandidates___block_invoke;
    v12[3] = &unk_2653A0718;
    objc_super v13 = v9;
    [v8 enumerateObjectsUsingBlock:v12];
  }
  return v10;
}

void __72__IRContextWrapper_initWithName_andDefaultClassification_andCandidates___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = +[IRCandidateDO candidateFromCandidateDO:a2];
  [v2 addCandidate:v3 logOrderOfExecution:0];
}

- (void)addCandidate:(id)a3 logOrderOfExecution:(BOOL)a4
{
  BOOL v4 = a4;
  candidates = self->_candidates;
  id v7 = a3;
  uint64_t v10 = [[IRCandidateWrapper alloc] initWithCandidate:v7 andDefaultClassification:self->_defaultClassification logOrderOfExecution:v4];

  id v8 = [(NSSet *)candidates setByAddingObject:v10];
  v9 = self->_candidates;
  self->_candidates = v8;
}

- (IRContext)context
{
  id v3 = objc_alloc_init(MEMORY[0x263F500D0]);
  candidates = self->_candidates;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __27__IRContextWrapper_context__block_invoke;
  v7[3] = &unk_2653A0740;
  id v5 = v3;
  id v8 = v5;
  [(NSSet *)candidates enumerateObjectsUsingBlock:v7];

  return (IRContext *)v5;
}

void __27__IRContextWrapper_context__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = (objc_class *)MEMORY[0x263F500C0];
  id v4 = a2;
  id v5 = [v3 alloc];
  id v12 = [v4 candidateResult];
  v6 = [v12 candidate];
  id v7 = [v4 candidateResult];
  uint64_t v8 = [v7 classification];
  v9 = [v4 candidateResult];

  uint64_t v10 = [v9 classificationDescription];
  v11 = (void *)[v5 initWithCandidate:v6 classification:v8 andClassificationDescription:v10];
  [v2 addCandidateResult:v11];
}

- (IRPolicyInspection)policyInspection
{
  id v3 = [[IRPolicyInspection alloc] initWithName:self->_name];
  candidates = self->_candidates;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __36__IRContextWrapper_policyInspection__block_invoke;
  v7[3] = &unk_2653A0740;
  id v5 = v3;
  uint64_t v8 = v5;
  [(NSSet *)candidates enumerateObjectsUsingBlock:v7];

  return v5;
}

void __36__IRContextWrapper_policyInspection__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v16 = [IRCandidateInspection alloc];
  id v3 = [IRCandidateInspectionServicePackage alloc];
  v14 = [v2 ruleInspections];
  id v4 = [v14 allValues];
  id v5 = (void *)[v4 copy];
  v6 = [v2 candidateResult];
  uint64_t v7 = [v6 classification];
  uint64_t v8 = [v2 orderOfExecution];
  v9 = [v2 candidateResult];
  uint64_t v10 = [v9 classificationDescription];
  v11 = [v2 candidateResult];

  id v12 = [v11 candidate];
  objc_super v13 = [(IRCandidateInspectionServicePackage *)v3 initWithRules:v5 classification:v7 orderOfExecution:v8 andClassificationDescription:v10 forCandidate:v12];
  v17 = [(IRCandidateInspection *)v16 initWithInspectionServicePackage:v13];

  [*(id *)(a1 + 32) addCandidate:v17];
}

- (NSSet)candidates
{
  return self->_candidates;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidates, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end