@interface CoreDAVSyncReportItem
+ (id)copyParseRules;
- (NSString)syncToken;
- (id)description;
- (void)_setSyncTokenItem:(id)a3;
@end

@implementation CoreDAVSyncReportItem

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  v7.receiver = self;
  v7.super_class = (Class)CoreDAVSyncReportItem;
  v4 = [(CoreDAVMultiStatusItem *)&v7 description];
  [v3 appendFormat:@"[%@]", v4];

  v5 = [(CoreDAVSyncReportItem *)self syncToken];
  [v3 appendFormat:@"\n  Sync token: [%@]", v5];

  return v3;
}

+ (id)copyParseRules
{
  id v3 = +[CoreDAVItem parseRuleCache];
  v4 = NSStringFromClass((Class)a1);
  v5 = [v3 objectForKey:v4];

  if (!v5)
  {
    v14.receiver = a1;
    v14.super_class = (Class)&OBJC_METACLASS___CoreDAVSyncReportItem;
    id v6 = objc_msgSendSuper2(&v14, sel_copyParseRules);
    v5 = (void *)[v6 mutableCopy];
    id v7 = objc_alloc(NSDictionary);
    v8 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:@"DAV:" elementName:@"sync-token" objectClass:objc_opt_class() setterMethod:sel__setSyncTokenItem_];
    v9 = [NSString stringWithFormat:@"%@:%@", @"DAV:", @"sync-token"];
    v10 = objc_msgSend(v7, "initWithObjectsAndKeys:", v8, v9, 0);

    [v5 setValuesForKeysWithDictionary:v10];
    v11 = +[CoreDAVItem parseRuleCache];
    v12 = NSStringFromClass((Class)a1);
    [v11 setObject:v5 forKey:v12];
  }
  return v5;
}

- (void)_setSyncTokenItem:(id)a3
{
  v4 = [a3 payloadAsString];
  syncToken = self->_syncToken;
  self->_syncToken = v4;
  MEMORY[0x270F9A758](v4, syncToken);
}

- (NSString)syncToken
{
  return self->_syncToken;
}

- (void).cxx_destruct
{
}

@end