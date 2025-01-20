@interface AXAuditCaseResult
- (AXAuditCaseResult)init;
- (AXAuditCategoryResult)result;
- (NSArray)auditIssues;
- (NSMutableArray)_mutableIssues;
- (NSString)caseTitle;
- (id)description;
- (void)addAuditIssue:(id)a3;
- (void)setAuditIssues:(id)a3;
- (void)setCaseTitle:(id)a3;
- (void)setResult:(id)a3;
- (void)set_mutableIssues:(id)a3;
@end

@implementation AXAuditCaseResult

- (AXAuditCaseResult)init
{
  v6.receiver = self;
  v6.super_class = (Class)AXAuditCaseResult;
  v2 = [(AXAuditCaseResult *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    mutableIssues = v2->__mutableIssues;
    v2->__mutableIssues = (NSMutableArray *)v3;
  }
  return v2;
}

- (NSArray)auditIssues
{
  v2 = [(AXAuditCaseResult *)self _mutableIssues];
  uint64_t v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (void)setAuditIssues:(id)a3
{
  id v4 = (id)[a3 mutableCopy];
  [(AXAuditCaseResult *)self set_mutableIssues:v4];
}

- (void)addAuditIssue:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v8 = v4;
    if ([v4 issueClassification])
    {
      v5 = [(AXAuditCaseResult *)self result];
      objc_super v6 = [v8 foundLogMessage];
      [v5 appendLog:v6];

      v7 = [(AXAuditCaseResult *)self _mutableIssues];
      [v7 addObject:v8];
    }
  }

  MEMORY[0x270F9A758]();
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)AXAuditCaseResult;
  uint64_t v3 = [(AXAuditCaseResult *)&v7 description];
  id v4 = [(AXAuditCaseResult *)self auditIssues];
  v5 = [v3 stringByAppendingFormat:@"AuditIssues:%@", v4];

  return v5;
}

- (NSString)caseTitle
{
  return self->_caseTitle;
}

- (void)setCaseTitle:(id)a3
{
}

- (AXAuditCategoryResult)result
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_result);

  return (AXAuditCategoryResult *)WeakRetained;
}

- (void)setResult:(id)a3
{
}

- (NSMutableArray)_mutableIssues
{
  return self->__mutableIssues;
}

- (void)set_mutableIssues:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__mutableIssues, 0);
  objc_destroyWeak((id *)&self->_result);

  objc_storeStrong((id *)&self->_caseTitle, 0);
}

@end