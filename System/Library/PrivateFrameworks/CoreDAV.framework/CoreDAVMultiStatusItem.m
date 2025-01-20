@interface CoreDAVMultiStatusItem
+ (id)copyParseRules;
- (CoreDAVLeafItem)responseDescription;
- (CoreDAVMultiStatusItem)init;
- (NSMutableArray)orderedResponses;
- (NSSet)responses;
- (id)description;
- (void)addResponse:(id)a3;
- (void)setOrderedResponses:(id)a3;
- (void)setResponseDescription:(id)a3;
@end

@implementation CoreDAVMultiStatusItem

- (CoreDAVMultiStatusItem)init
{
  return [(CoreDAVItem *)self initWithNameSpace:@"DAV:" andName:@"multistatus"];
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  v8.receiver = self;
  v8.super_class = (Class)CoreDAVMultiStatusItem;
  v4 = [(CoreDAVItem *)&v8 description];
  [v3 appendFormat:@"[%@]", v4];

  v5 = [(CoreDAVMultiStatusItem *)self orderedResponses];
  objc_msgSend(v3, "appendFormat:", @"\n  Number of responses: [%lu]", objc_msgSend(v5, "count"));

  v6 = [(CoreDAVMultiStatusItem *)self responseDescription];
  [v3 appendFormat:@"\n  Response description: [%@]", v6];

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
    v7 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:0x7FFFFFFFLL nameSpace:@"DAV:" elementName:@"response" objectClass:objc_opt_class() setterMethod:sel_addResponse_];
    objc_super v8 = [NSString stringWithFormat:@"%@:%@", @"DAV:", @"response"];
    v9 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:@"DAV:" elementName:@"responsedescription" objectClass:objc_opt_class() setterMethod:sel_setResponseDescription_];
    v10 = [NSString stringWithFormat:@"%@:%@", @"DAV:", @"responsedescription"];
    v5 = objc_msgSend(v6, "initWithObjectsAndKeys:", v7, v8, v9, v10, 0);

    v11 = +[CoreDAVItem parseRuleCache];
    v12 = NSStringFromClass((Class)a1);
    [v11 setObject:v5 forKey:v12];
  }
  return v5;
}

- (void)addResponse:(id)a3
{
  id v4 = a3;
  v5 = [(CoreDAVMultiStatusItem *)self orderedResponses];

  if (!v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
    [(CoreDAVMultiStatusItem *)self setOrderedResponses:v6];
  }
  id v7 = [(CoreDAVMultiStatusItem *)self orderedResponses];
  [v7 addObject:v4];
}

- (NSSet)responses
{
  v2 = (void *)MEMORY[0x263EFFA08];
  id v3 = [(CoreDAVMultiStatusItem *)self orderedResponses];
  id v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

- (NSMutableArray)orderedResponses
{
  return self->_orderedResponses;
}

- (void)setOrderedResponses:(id)a3
{
}

- (CoreDAVLeafItem)responseDescription
{
  return self->_responseDescription;
}

- (void)setResponseDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseDescription, 0);
  objc_storeStrong((id *)&self->_orderedResponses, 0);
}

@end