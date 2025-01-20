@interface CoreDAVCalendarServerEmailAddressSetItem
+ (id)copyParseRules;
- (CoreDAVCalendarServerEmailAddressSetItem)init;
- (CoreDAVItemWithNoChildren)unauthenticated;
- (NSMutableArray)emailAddresses;
- (id)description;
- (void)addEmailAddress:(id)a3;
- (void)setEmailAddresses:(id)a3;
- (void)setUnauthenticated:(id)a3;
@end

@implementation CoreDAVCalendarServerEmailAddressSetItem

- (CoreDAVCalendarServerEmailAddressSetItem)init
{
  return [(CoreDAVItem *)self initWithNameSpace:@"http://calendarserver.org/ns/" andName:@"email-address-set"];
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  v8.receiver = self;
  v8.super_class = (Class)CoreDAVCalendarServerEmailAddressSetItem;
  v4 = [(CoreDAVItem *)&v8 description];
  [v3 appendFormat:@"[%@]", v4];

  v5 = [(CoreDAVCalendarServerEmailAddressSetItem *)self emailAddresses];
  objc_msgSend(v3, "appendFormat:", @"\n  Number of email addresses: [%lu]", objc_msgSend(v5, "count"));

  v6 = [(CoreDAVCalendarServerEmailAddressSetItem *)self unauthenticated];
  [v3 appendFormat:@"\n  Unauthenticated: [%@]", v6];

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
    v7 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:0x7FFFFFFFLL nameSpace:@"http://calendarserver.org/ns/" elementName:@"email-address" objectClass:objc_opt_class() setterMethod:sel_addEmailAddress_];
    objc_super v8 = [NSString stringWithFormat:@"%@:%@", @"http://calendarserver.org/ns/", @"email-address"];
    v9 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:@"DAV:" elementName:@"unauthenticated" objectClass:objc_opt_class() setterMethod:sel_setUnauthenticated_];
    v10 = [NSString stringWithFormat:@"%@:%@", @"DAV:", @"unauthenticated"];
    v5 = objc_msgSend(v6, "initWithObjectsAndKeys:", v7, v8, v9, v10, 0);

    v11 = +[CoreDAVItem parseRuleCache];
    v12 = NSStringFromClass((Class)a1);
    [v11 setObject:v5 forKey:v12];
  }
  return v5;
}

- (void)addEmailAddress:(id)a3
{
  id v4 = a3;
  v5 = [(CoreDAVCalendarServerEmailAddressSetItem *)self emailAddresses];

  if (!v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
    [(CoreDAVCalendarServerEmailAddressSetItem *)self setEmailAddresses:v6];
  }
  id v7 = [(CoreDAVCalendarServerEmailAddressSetItem *)self emailAddresses];
  [v7 addObject:v4];
}

- (NSMutableArray)emailAddresses
{
  return self->_emailAddresses;
}

- (void)setEmailAddresses:(id)a3
{
}

- (CoreDAVItemWithNoChildren)unauthenticated
{
  return self->_unauthenticated;
}

- (void)setUnauthenticated:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unauthenticated, 0);
  objc_storeStrong((id *)&self->_emailAddresses, 0);
}

@end