@interface CalDAVCalendarServerScheduleChangesItem
- (CalDAVCalendarServerActionItem)action;
- (CalDAVCalendarServerScheduleChangesItem)init;
- (CoreDAVLeafItem)dtstamp;
- (id)copyParseRules;
- (void)setAction:(id)a3;
- (void)setDtstamp:(id)a3;
@end

@implementation CalDAVCalendarServerScheduleChangesItem

- (CalDAVCalendarServerScheduleChangesItem)init
{
  return [(CoreDAVItem *)self initWithNameSpace:*MEMORY[0x263F34DA8] andName:@"schedule-changes"];
}

- (id)copyParseRules
{
  id v2 = objc_alloc(NSDictionary);
  uint64_t v3 = *MEMORY[0x263F34DA8];
  v4 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:*MEMORY[0x263F34DA8] elementName:@"dtstamp" objectClass:objc_opt_class() setterMethod:sel_setDtstamp_];
  v5 = [NSString stringWithFormat:@"%@:%@", v3, @"dtstamp"];
  v6 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:v3 elementName:@"action" objectClass:objc_opt_class() setterMethod:sel_setAction_];
  v7 = [NSString stringWithFormat:@"%@:%@", v3, @"action"];
  v8 = objc_msgSend(v2, "initWithObjectsAndKeys:", v4, v5, v6, v7, 0);

  return v8;
}

- (CoreDAVLeafItem)dtstamp
{
  return self->_dtstamp;
}

- (void)setDtstamp:(id)a3
{
}

- (CalDAVCalendarServerActionItem)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_dtstamp, 0);
}

@end