@interface AXAuditCategoryResult
- (AXAuditCategoryResult)init;
- (AXAuditCategoryResultDelegate)delegate;
- (NSArray)caseResults;
- (NSMutableArray)_mutableCases;
- (NSMutableString)_mutableLog;
- (NSString)title;
- (id)allIssues;
- (id)description;
- (id)issueSummaryStrings;
- (id)log;
- (int64_t)issueCount;
- (void)addCaseResult:(id)a3;
- (void)appendLog:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setTitle:(id)a3;
- (void)set_mutableCases:(id)a3;
- (void)set_mutableLog:(id)a3;
@end

@implementation AXAuditCategoryResult

- (AXAuditCategoryResult)init
{
  v8.receiver = self;
  v8.super_class = (Class)AXAuditCategoryResult;
  v2 = [(AXAuditCategoryResult *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    mutableLog = v2->__mutableLog;
    v2->__mutableLog = (NSMutableString *)v3;

    uint64_t v5 = objc_opt_new();
    mutableCases = v2->__mutableCases;
    v2->__mutableCases = (NSMutableArray *)v5;
  }
  return v2;
}

- (void)addCaseResult:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    v4 = [(AXAuditCategoryResult *)self _mutableCases];
    [v4 addObject:v5];

    [v5 setResult:self];
  }
}

- (NSArray)caseResults
{
  v2 = [(AXAuditCategoryResult *)self _mutableCases];
  uint64_t v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (void)appendLog:(id)a3
{
  v4 = (objc_class *)NSString;
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithFormat:v5 arguments:&v10];

  v7 = [v6 axAuditStringForLog];

  objc_super v8 = [(AXAuditCategoryResult *)self delegate];
  [v8 auditCategoryResult:self didAppendLogWithMessage:v7];

  v9 = [(AXAuditCategoryResult *)self _mutableLog];
  [v9 appendString:v7];
}

- (id)log
{
  v2 = [(AXAuditCategoryResult *)self _mutableLog];
  uint64_t v3 = (void *)[v2 copy];

  return v3;
}

- (int64_t)issueCount
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(AXAuditCategoryResult *)self _mutableCases];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int64_t v5 = 0;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        objc_super v8 = [*(id *)(*((void *)&v10 + 1) + 8 * i) auditIssues];
        v5 += [v8 count];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (id)allIssues
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263EFF980] array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v4 = [(AXAuditCategoryResult *)self _mutableCases];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v10 = objc_msgSend(v9, "auditIssues", 0);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v18;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v18 != v13) {
                objc_enumerationMutation(v10);
              }
              [v3 addObject:*(void *)(*((void *)&v17 + 1) + 8 * j)];
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
          }
          while (v12);
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v6);
  }

  uint64_t v15 = (void *)[v3 copy];

  return v15;
}

- (id)issueSummaryStrings
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263EFF980] array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v4 = [(AXAuditCategoryResult *)self _mutableCases];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v10 = objc_msgSend(v9, "auditIssues", 0);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v19;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v19 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = [*(id *)(*((void *)&v18 + 1) + 8 * j) foundLogMessage];
              if ([v15 length]) {
                [v3 addObject:v15];
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
          }
          while (v12);
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v6);
  }

  v16 = (void *)[v3 copy];

  return v16;
}

- (id)description
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [(AXAuditCategoryResult *)self issueSummaryStrings];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 appendFormat:@"%@\n", *(void *)(*((void *)&v13 + 1) + 8 * i)];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  v12.receiver = self;
  v12.super_class = (Class)AXAuditCategoryResult;
  v9 = [(AXAuditCategoryResult *)&v12 description];
  long long v10 = [v9 stringByAppendingString:v3];

  return v10;
}

- (AXAuditCategoryResultDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AXAuditCategoryResultDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSMutableArray)_mutableCases
{
  return self->__mutableCases;
}

- (void)set_mutableCases:(id)a3
{
}

- (NSMutableString)_mutableLog
{
  return self->__mutableLog;
}

- (void)set_mutableLog:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__mutableLog, 0);
  objc_storeStrong((id *)&self->__mutableCases, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end