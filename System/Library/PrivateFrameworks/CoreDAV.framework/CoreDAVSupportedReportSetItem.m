@interface CoreDAVSupportedReportSetItem
+ (id)copyParseRules;
- (BOOL)supportsReportWithNameSpace:(id)a3 andName:(id)a4;
- (CoreDAVSupportedReportSetItem)init;
- (NSMutableSet)supportedReports;
- (id)description;
- (void)addSupportedReport:(id)a3;
- (void)setSupportedReports:(id)a3;
@end

@implementation CoreDAVSupportedReportSetItem

- (CoreDAVSupportedReportSetItem)init
{
  return [(CoreDAVItem *)self initWithNameSpace:@"DAV:" andName:@"supported-report-set"];
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  v7.receiver = self;
  v7.super_class = (Class)CoreDAVSupportedReportSetItem;
  v4 = [(CoreDAVItem *)&v7 description];
  [v3 appendFormat:@"[%@]", v4];

  v5 = [(CoreDAVSupportedReportSetItem *)self supportedReports];
  objc_msgSend(v3, "appendFormat:", @"\n  Number of supported reports: [%lu]", objc_msgSend(v5, "count"));

  return v3;
}

+ (id)copyParseRules
{
  id v3 = +[CoreDAVItem parseRuleCache];
  v4 = NSStringFromClass((Class)a1);
  v5 = [v3 objectForKey:v4];

  if (!v5)
  {
    id v6 = objc_alloc(NSDictionary);
    objc_super v7 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:0x7FFFFFFFLL nameSpace:@"DAV:" elementName:@"supported-report" objectClass:objc_opt_class() setterMethod:sel_addSupportedReport_];
    v8 = [NSString stringWithFormat:@"%@:%@", @"DAV:", @"supported-report"];
    v5 = objc_msgSend(v6, "initWithObjectsAndKeys:", v7, v8, 0);

    v9 = +[CoreDAVItem parseRuleCache];
    v10 = NSStringFromClass((Class)a1);
    [v9 setObject:v5 forKey:v10];
  }
  return v5;
}

- (void)addSupportedReport:(id)a3
{
  id v4 = a3;
  v5 = [(CoreDAVSupportedReportSetItem *)self supportedReports];

  if (!v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    [(CoreDAVSupportedReportSetItem *)self setSupportedReports:v6];
  }
  id v7 = [(CoreDAVSupportedReportSetItem *)self supportedReports];
  [v7 addObject:v4];
}

- (BOOL)supportsReportWithNameSpace:(id)a3 andName:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v8 = [(CoreDAVSupportedReportSetItem *)self supportedReports];
  uint64_t v25 = [v8 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v25)
  {
    uint64_t v9 = *(void *)v32;
    v26 = v8;
    uint64_t v24 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(v8);
        }
        v11 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        v12 = [v11 report];
        v13 = [v12 extraChildItems];

        uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v28;
          do
          {
            for (uint64_t j = 0; j != v15; ++j)
            {
              if (*(void *)v28 != v16) {
                objc_enumerationMutation(v13);
              }
              v18 = *(void **)(*((void *)&v27 + 1) + 8 * j);
              v19 = [v18 nameSpace];
              if ([v19 isEqualToString:v6])
              {
                v20 = [v18 name];
                char v21 = [v20 isEqualToString:v7];

                if (v21)
                {

                  BOOL v22 = 1;
                  v8 = v26;
                  goto LABEL_21;
                }
              }
              else
              {
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v35 count:16];
          }
          while (v15);
        }

        v8 = v26;
        uint64_t v9 = v24;
      }
      BOOL v22 = 0;
      uint64_t v25 = [v26 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v25);
  }
  else
  {
    BOOL v22 = 0;
  }
LABEL_21:

  return v22;
}

- (NSMutableSet)supportedReports
{
  return self->_supportedReports;
}

- (void)setSupportedReports:(id)a3
{
}

- (void).cxx_destruct
{
}

@end