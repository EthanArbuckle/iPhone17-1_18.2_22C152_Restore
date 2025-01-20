@interface _FEDebugIssue
+ (id)issueWithDescription:(id)a3;
+ (id)issueWithFormat:(id)a3;
- (NSArray)subissues;
- (NSString)description;
- (NSString)prefix;
- (_FEDebugIssue)init;
- (_FEDebugIssueReport)_subissueReport;
- (void)addIssue:(id)a3;
- (void)setDescription:(id)a3;
- (void)setPrefix:(id)a3;
@end

@implementation _FEDebugIssue

- (_FEDebugIssue)init
{
  v8.receiver = self;
  v8.super_class = (Class)_FEDebugIssue;
  v2 = [(_FEDebugIssue *)&v8 init];
  v3 = v2;
  if (v2)
  {
    description = v2->_description;
    v2->_description = (NSString *)&stru_2700CBC00;

    v5 = objc_alloc_init(_FEDebugIssueReport);
    subissueReport = v3->_subissueReport;
    v3->_subissueReport = v5;
  }
  return v3;
}

+ (id)issueWithDescription:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    objc_super v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"_FEDebugIssueReport.m", 33, @"Invalid parameter not satisfying: %@", @"description" object file lineNumber description];
  }
  v6 = objc_alloc_init(_FEDebugIssue);
  [(_FEDebugIssue *)v6 setDescription:v5];

  return v6;
}

+ (id)issueWithFormat:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2, a1, @"_FEDebugIssueReport.m", 42, @"Invalid parameter not satisfying: %@", @"descriptionFormat" object file lineNumber description];
  }
  v6 = (void *)[[NSString alloc] initWithFormat:v5 arguments:&v11];
  v7 = [a1 issueWithDescription:v6];

  return v7;
}

- (NSArray)subissues
{
  return [(_FEDebugIssueReport *)self->_subissueReport issues];
}

- (void)addIssue:(id)a3
{
  id v5 = a3;
  id v7 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"_FEDebugIssueReport.m", 62, @"Invalid parameter not satisfying: %@", @"issue" object file lineNumber description];

    id v5 = 0;
  }
  [(_FEDebugIssueReport *)self->_subissueReport addIssue:v5];
}

- (NSString)description
{
  return self->_description;
}

- (void)setDescription:(id)a3
{
}

- (NSString)prefix
{
  return self->_prefix;
}

- (void)setPrefix:(id)a3
{
}

- (_FEDebugIssueReport)_subissueReport
{
  return self->_subissueReport;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subissueReport, 0);
  objc_storeStrong((id *)&self->_prefix, 0);
  objc_storeStrong((id *)&self->_description, 0);
}

@end