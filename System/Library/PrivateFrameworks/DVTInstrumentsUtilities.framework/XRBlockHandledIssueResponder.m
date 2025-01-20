@interface XRBlockHandledIssueResponder
- (XRBlockHandledIssueResponder)initWithHandler:(id)a3;
- (void)handleIssue:(id)a3 type:(signed __int16)a4 from:(id)a5;
@end

@implementation XRBlockHandledIssueResponder

- (XRBlockHandledIssueResponder)initWithHandler:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)XRBlockHandledIssueResponder;
  v5 = [(XRBlockHandledIssueResponder *)&v9 init];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x237DC1050](v4);
    id handler = v5->_handler;
    v5->_id handler = (id)v6;
  }
  return v5;
}

- (void)handleIssue:(id)a3 type:(signed __int16)a4 from:(id)a5
{
}

- (void).cxx_destruct
{
}

@end