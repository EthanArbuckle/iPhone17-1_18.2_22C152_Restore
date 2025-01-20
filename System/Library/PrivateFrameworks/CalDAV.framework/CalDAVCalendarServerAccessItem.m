@interface CalDAVCalendarServerAccessItem
- (CalDAVCalendarServerAccessItem)init;
- (CalDAVCalendarServerAccessItem)initWithAccess:(int)a3;
- (CoreDAVItemWithNoChildren)accessLevel;
- (id)copyParseRules;
- (void)setAccessLevel:(id)a3;
@end

@implementation CalDAVCalendarServerAccessItem

- (CalDAVCalendarServerAccessItem)init
{
  return [(CoreDAVItem *)self initWithNameSpace:*MEMORY[0x263F34DA8] andName:@"access"];
}

- (CalDAVCalendarServerAccessItem)initWithAccess:(int)a3
{
  v4 = [(CalDAVCalendarServerAccessItem *)self init];
  if (v4)
  {
    if ((a3 - 1) > 2)
    {
      v7 = 0;
    }
    else
    {
      v5 = off_2641EC018[a3 - 1];
      id v6 = objc_alloc(MEMORY[0x263F34B20]);
      v7 = (void *)[v6 initWithNameSpace:*MEMORY[0x263F34DA8] andName:*v5];
    }
    [(CalDAVCalendarServerAccessItem *)v4 setAccessLevel:v7];
  }
  return v4;
}

- (id)copyParseRules
{
  id v11 = objc_alloc(NSDictionary);
  uint64_t v2 = *MEMORY[0x263F34DA8];
  v3 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:*MEMORY[0x263F34DA8] elementName:@"read" objectClass:objc_opt_class() setterMethod:sel_setAccessLevel_];
  v4 = [NSString stringWithFormat:@"%@:%@", v2, @"read"];
  v5 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:v2 elementName:@"read-write" objectClass:objc_opt_class() setterMethod:sel_setAccessLevel_];
  id v6 = [NSString stringWithFormat:@"%@:%@", v2, @"read-write"];
  v7 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:v2 elementName:@"read-write-schedule" objectClass:objc_opt_class() setterMethod:sel_setAccessLevel_];
  v8 = [NSString stringWithFormat:@"%@:%@", v2, @"read-write-schedule"];
  v9 = objc_msgSend(v11, "initWithObjectsAndKeys:", v3, v4, v5, v6, v7, v8, 0);

  return v9;
}

- (CoreDAVItemWithNoChildren)accessLevel
{
  return self->_accessLevel;
}

- (void)setAccessLevel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end