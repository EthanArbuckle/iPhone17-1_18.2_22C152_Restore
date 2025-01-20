@interface CalDAVItemWithRecurrenceChildren
- (NSMutableSet)recurrences;
- (id)copyParseRules;
- (void)addRecurrence:(id)a3;
- (void)setRecurrences:(id)a3;
@end

@implementation CalDAVItemWithRecurrenceChildren

- (void)addRecurrence:(id)a3
{
  id v4 = a3;
  v5 = [(CalDAVItemWithRecurrenceChildren *)self recurrences];

  if (!v5)
  {
    v6 = (void *)[objc_alloc(MEMORY[0x263EFF9C0]) initWithCapacity:1];
    [(CalDAVItemWithRecurrenceChildren *)self setRecurrences:v6];
  }
  id v7 = [(CalDAVItemWithRecurrenceChildren *)self recurrences];
  [v7 addObject:v4];
}

- (id)copyParseRules
{
  id v2 = objc_alloc(NSDictionary);
  uint64_t v3 = *MEMORY[0x263F34DA8];
  id v4 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:1 maximumNumber:0x7FFFFFFFLL nameSpace:*MEMORY[0x263F34DA8] elementName:@"recurrence" objectClass:objc_opt_class() setterMethod:sel_addRecurrence_];
  v5 = [NSString stringWithFormat:@"%@:%@", v3, @"recurrence"];
  v6 = objc_msgSend(v2, "initWithObjectsAndKeys:", v4, v5, 0);

  return v6;
}

- (NSMutableSet)recurrences
{
  return self->_recurrences;
}

- (void)setRecurrences:(id)a3
{
}

- (void).cxx_destruct
{
}

@end