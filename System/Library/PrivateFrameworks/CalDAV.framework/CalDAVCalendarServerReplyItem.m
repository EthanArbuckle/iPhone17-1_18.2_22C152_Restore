@interface CalDAVCalendarServerReplyItem
- (CoreDAVLeafItem)attendee;
- (id)copyParseRules;
- (void)setAttendee:(id)a3;
@end

@implementation CalDAVCalendarServerReplyItem

- (id)copyParseRules
{
  id v2 = objc_alloc(NSDictionary);
  uint64_t v3 = *MEMORY[0x263F34DA8];
  v4 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:*MEMORY[0x263F34DA8] elementName:@"attendee" objectClass:objc_opt_class() setterMethod:sel_setAttendee_];
  v5 = [NSString stringWithFormat:@"%@:%@", v3, @"attendee"];
  v6 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:1 maximumNumber:0x7FFFFFFFLL nameSpace:v3 elementName:@"recurrence" objectClass:objc_opt_class() setterMethod:sel_addRecurrence_];
  v7 = [NSString stringWithFormat:@"%@:%@", v3, @"recurrence"];
  v8 = objc_msgSend(v2, "initWithObjectsAndKeys:", v4, v5, v6, v7, 0);

  return v8;
}

- (CoreDAVLeafItem)attendee
{
  return self->_attendee;
}

- (void)setAttendee:(id)a3
{
}

- (void).cxx_destruct
{
}

@end