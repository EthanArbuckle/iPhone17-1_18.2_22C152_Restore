@interface CalDAVCalendarServerNotificationItem
- (CalDAVCalendarServerNotificationItem)init;
- (CoreDAVItem)content;
- (CoreDAVLeafItem)dtstamp;
- (id)copyParseRules;
- (void)setContent:(id)a3;
- (void)setDtstamp:(id)a3;
@end

@implementation CalDAVCalendarServerNotificationItem

- (CalDAVCalendarServerNotificationItem)init
{
  return [(CoreDAVItem *)self initWithNameSpace:*MEMORY[0x263F34DA8] andName:@"notification"];
}

- (id)copyParseRules
{
  id v13 = objc_alloc(NSDictionary);
  uint64_t v2 = *MEMORY[0x263F34DA8];
  v12 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:1 maximumNumber:1 nameSpace:*MEMORY[0x263F34DA8] elementName:@"dtstamp" objectClass:objc_opt_class() setterMethod:sel_setDtstamp_];
  v3 = [NSString stringWithFormat:@"%@:%@", v2, @"dtstamp"];
  v4 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:v2 elementName:@"invite-notification" objectClass:objc_opt_class() setterMethod:sel_setContent_];
  v5 = [NSString stringWithFormat:@"%@:%@", v2, @"invite-notification"];
  v6 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:v2 elementName:@"invite-reply" objectClass:objc_opt_class() setterMethod:sel_setContent_];
  v7 = [NSString stringWithFormat:@"%@:%@", v2, @"invite-reply"];
  v8 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:v2 elementName:@"resource-changed" objectClass:objc_opt_class() setterMethod:sel_setContent_];
  v9 = [NSString stringWithFormat:@"%@:%@", v2, @"resource-changed"];
  v10 = objc_msgSend(v13, "initWithObjectsAndKeys:", v12, v3, v4, v5, v6, v7, v8, v9, 0);

  return v10;
}

- (CoreDAVLeafItem)dtstamp
{
  return self->_dtstamp;
}

- (void)setDtstamp:(id)a3
{
}

- (CoreDAVItem)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_dtstamp, 0);
}

@end