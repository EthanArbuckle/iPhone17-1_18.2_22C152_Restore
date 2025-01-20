@interface CoreDAVSupportedReportItem
+ (id)copyParseRules;
- (CoreDAVItem)report;
- (CoreDAVSupportedReportItem)init;
- (id)description;
- (void)setReport:(id)a3;
@end

@implementation CoreDAVSupportedReportItem

- (CoreDAVSupportedReportItem)init
{
  return [(CoreDAVItem *)self initWithNameSpace:@"DAV:" andName:@"supported-report"];
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  v7.receiver = self;
  v7.super_class = (Class)CoreDAVSupportedReportItem;
  v4 = [(CoreDAVItem *)&v7 description];
  [v3 appendFormat:@"[%@]", v4];

  v5 = [(CoreDAVSupportedReportItem *)self report];
  [v3 appendFormat:@"\n  Report: [%@]", v5];

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
    objc_super v7 = +[CoreDAVParseRule ruleWithMinimumNumber:1 maximumNumber:1 nameSpace:@"DAV:" elementName:@"report" objectClass:objc_opt_class() setterMethod:sel_setReport_];
    v8 = [NSString stringWithFormat:@"%@:%@", @"DAV:", @"report"];
    v5 = objc_msgSend(v6, "initWithObjectsAndKeys:", v7, v8, 0);

    v9 = +[CoreDAVItem parseRuleCache];
    v10 = NSStringFromClass((Class)a1);
    [v9 setObject:v5 forKey:v10];
  }
  return v5;
}

- (CoreDAVItem)report
{
  return self->_report;
}

- (void)setReport:(id)a3
{
}

- (void).cxx_destruct
{
}

@end