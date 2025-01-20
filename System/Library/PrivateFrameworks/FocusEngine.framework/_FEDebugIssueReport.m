@interface _FEDebugIssueReport
- (NSArray)issues;
- (_FEDebugIssueReport)init;
- (void)addIssue:(id)a3;
@end

@implementation _FEDebugIssueReport

- (_FEDebugIssueReport)init
{
  v6.receiver = self;
  v6.super_class = (Class)_FEDebugIssueReport;
  v2 = [(_FEDebugIssueReport *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mutableIssues = v2->_mutableIssues;
    v2->_mutableIssues = v3;
  }
  return v2;
}

- (NSArray)issues
{
  v2 = (void *)[(NSMutableArray *)self->_mutableIssues copy];
  return (NSArray *)v2;
}

- (void)addIssue:(id)a3
{
  id v5 = a3;
  id v7 = v5;
  if (!v5)
  {
    objc_super v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"_FEDebugIssueReport.m", 91, @"Invalid parameter not satisfying: %@", @"issue" object file lineNumber description];

    id v5 = 0;
  }
  [(NSMutableArray *)self->_mutableIssues addObject:v5];
}

- (void).cxx_destruct
{
}

@end