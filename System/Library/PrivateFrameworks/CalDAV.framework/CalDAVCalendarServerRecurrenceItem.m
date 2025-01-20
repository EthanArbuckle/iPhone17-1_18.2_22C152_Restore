@interface CalDAVCalendarServerRecurrenceItem
- (BOOL)isMaster;
- (CalDAVCalendarServerChangesItem)changes;
- (CalDAVCalendarServerRecurrenceItem)init;
- (CoreDAVItemWithNoChildren)master;
- (CoreDAVLeafItem)recurrenceID;
- (id)copyParseRules;
- (void)setChanges:(id)a3;
- (void)setMaster:(id)a3;
- (void)setRecurrenceID:(id)a3;
@end

@implementation CalDAVCalendarServerRecurrenceItem

- (CalDAVCalendarServerRecurrenceItem)init
{
  return [(CoreDAVItem *)self initWithNameSpace:*MEMORY[0x263F34DA8] andName:@"recurrence"];
}

- (id)copyParseRules
{
  id v2 = objc_alloc(NSDictionary);
  uint64_t v3 = *MEMORY[0x263F34DA8];
  v4 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:*MEMORY[0x263F34DA8] elementName:@"master" objectClass:objc_opt_class() setterMethod:sel_setMaster_];
  v5 = [NSString stringWithFormat:@"%@:%@", v3, @"master"];
  v6 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:v3 elementName:@"recurrenceid" objectClass:objc_opt_class() setterMethod:sel_setRecurrenceID_];
  v7 = [NSString stringWithFormat:@"%@:%@", v3, @"recurrenceid"];
  v8 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:v3 elementName:@"changes" objectClass:objc_opt_class() setterMethod:sel_setChanges_];
  v9 = [NSString stringWithFormat:@"%@:%@", v3, @"changes"];
  v10 = objc_msgSend(v2, "initWithObjectsAndKeys:", v4, v5, v6, v7, v8, v9, 0);

  return v10;
}

- (BOOL)isMaster
{
  id v2 = [(CalDAVCalendarServerRecurrenceItem *)self master];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CoreDAVItemWithNoChildren)master
{
  return self->_master;
}

- (void)setMaster:(id)a3
{
}

- (CoreDAVLeafItem)recurrenceID
{
  return self->_recurrenceID;
}

- (void)setRecurrenceID:(id)a3
{
}

- (CalDAVCalendarServerChangesItem)changes
{
  return self->_changes;
}

- (void)setChanges:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changes, 0);
  objc_storeStrong((id *)&self->_recurrenceID, 0);
  objc_storeStrong((id *)&self->_master, 0);
}

@end