@interface CoreDAVBulkRequestsSetItem
+ (id)copyParseRules;
- (CoreDAVBulkRequestsItem)crudItem;
- (CoreDAVBulkRequestsItem)simpleItem;
- (CoreDAVBulkRequestsSetItem)init;
- (NSDictionary)dictRepresentation;
- (id)description;
- (void)setCrudItem:(id)a3;
- (void)setSimpleItem:(id)a3;
@end

@implementation CoreDAVBulkRequestsSetItem

- (CoreDAVBulkRequestsSetItem)init
{
  return [(CoreDAVItem *)self initWithNameSpace:@"http://me.com/_namespace/" andName:@"bulk-requests"];
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  v8.receiver = self;
  v8.super_class = (Class)CoreDAVBulkRequestsSetItem;
  v4 = [(CoreDAVItem *)&v8 description];
  [v3 appendFormat:@"[%@]", v4];

  v5 = [(CoreDAVBulkRequestsSetItem *)self crudItem];
  v6 = [(CoreDAVBulkRequestsSetItem *)self simpleItem];
  [v3 appendFormat:@"\n  CRUD %@\nSimple %@", v5, v6];

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
    v7 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:@"http://me.com/_namespace/" elementName:@"crud" objectClass:objc_opt_class() setterMethod:sel_setCrudItem_];
    objc_super v8 = [NSString stringWithFormat:@"%@:%@", @"http://me.com/_namespace/", @"crud"];
    v9 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:@"http://me.com/_namespace/" elementName:@"simple" objectClass:objc_opt_class() setterMethod:sel_setSimpleItem_];
    v10 = [NSString stringWithFormat:@"%@:%@", @"http://me.com/_namespace/", @"simple"];
    v5 = objc_msgSend(v6, "initWithObjectsAndKeys:", v7, v8, v9, v10, 0);

    v11 = +[CoreDAVItem parseRuleCache];
    v12 = NSStringFromClass((Class)a1);
    [v11 setObject:v5 forKey:v12];
  }
  return v5;
}

- (NSDictionary)dictRepresentation
{
  if (self->_crudItem || self->_simpleItem)
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v4 = [(CoreDAVBulkRequestsItem *)self->_crudItem dictRepresentation];
    if (v4) {
      [v3 setObject:v4 forKey:@"crud"];
    }
    v5 = [(CoreDAVBulkRequestsItem *)self->_simpleItem dictRepresentation];
    if (v5) {
      [v3 setObject:v5 forKey:@"simple"];
    }
  }
  else
  {
    id v3 = 0;
  }
  return (NSDictionary *)v3;
}

- (CoreDAVBulkRequestsItem)crudItem
{
  return self->_crudItem;
}

- (void)setCrudItem:(id)a3
{
}

- (CoreDAVBulkRequestsItem)simpleItem
{
  return self->_simpleItem;
}

- (void)setSimpleItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_simpleItem, 0);
  objc_storeStrong((id *)&self->_crudItem, 0);
}

@end