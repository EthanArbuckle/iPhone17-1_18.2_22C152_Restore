@interface CalDAVCalendarServerDeletedDetailsItem
- (BOOL)hadMoreInstances;
- (CalDAVCalendarServerDeletedDetailsItem)init;
- (ICSDateValue)nextInstance;
- (NSString)componentType;
- (NSString)displayName;
- (NSString)summary;
- (id)copyParseRules;
- (void)setComponentType:(id)a3;
- (void)setComponentTypeItem:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setDisplayNameItem:(id)a3;
- (void)setHadMoreInstances:(BOOL)a3;
- (void)setHadMoreInstancesItem:(id)a3;
- (void)setNextInstance:(id)a3;
- (void)setNextInstanceItem:(id)a3;
- (void)setSummary:(id)a3;
- (void)setSummaryItem:(id)a3;
@end

@implementation CalDAVCalendarServerDeletedDetailsItem

- (CalDAVCalendarServerDeletedDetailsItem)init
{
  return [(CoreDAVItem *)self initWithNameSpace:*MEMORY[0x263F34DA8] andName:@"deleted-details"];
}

- (void)setComponentTypeItem:(id)a3
{
  id v4 = [a3 payloadAsString];
  [(CalDAVCalendarServerDeletedDetailsItem *)self setComponentType:v4];
}

- (void)setSummaryItem:(id)a3
{
  id v4 = [a3 payloadAsString];
  [(CalDAVCalendarServerDeletedDetailsItem *)self setSummary:v4];
}

- (void)setDisplayNameItem:(id)a3
{
  id v4 = [a3 payloadAsString];
  [(CalDAVCalendarServerDeletedDetailsItem *)self setDisplayName:v4];
}

- (void)setNextInstanceItem:(id)a3
{
  id v4 = (void *)MEMORY[0x263F886E0];
  id v6 = [a3 payloadAsString];
  v5 = [v4 dateFromICSString:v6];
  [(CalDAVCalendarServerDeletedDetailsItem *)self setNextInstance:v5];
}

- (void)setHadMoreInstancesItem:(id)a3
{
}

- (id)copyParseRules
{
  id v14 = objc_alloc(NSDictionary);
  uint64_t v2 = *MEMORY[0x263F34DA8];
  v13 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:*MEMORY[0x263F34DA8] elementName:@"deleted-component" objectClass:objc_opt_class() setterMethod:sel_setComponentTypeItem_];
  v12 = [NSString stringWithFormat:@"%@:%@", v2, @"deleted-component"];
  v11 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:v2 elementName:@"deleted-summary" objectClass:objc_opt_class() setterMethod:sel_setSummaryItem_];
  v10 = [NSString stringWithFormat:@"%@:%@", v2, @"deleted-summary"];
  v3 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:v2 elementName:@"deleted-next-instance" objectClass:objc_opt_class() setterMethod:sel_setNextInstanceItem_];
  id v4 = [NSString stringWithFormat:@"%@:%@", v2, @"deleted-next-instance"];
  v5 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:v2 elementName:@"deleted-had-more-instances" objectClass:objc_opt_class() setterMethod:sel_setHadMoreInstancesItem_];
  id v6 = [NSString stringWithFormat:@"%@:%@", v2, @"deleted-had-more-instances"];
  v7 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:v2 elementName:@"deleted-displayname" objectClass:objc_opt_class() setterMethod:sel_setDisplayNameItem_];
  v8 = [NSString stringWithFormat:@"%@:%@", v2, @"deleted-displayname"];
  v15 = objc_msgSend(v14, "initWithObjectsAndKeys:", v13, v12, v11, v10, v3, v4, v5, v6, v7, v8, 0);

  return v15;
}

- (NSString)componentType
{
  return *(NSString **)&self->_hadMoreInstances;
}

- (void)setComponentType:(id)a3
{
}

- (NSString)summary
{
  return self->_componentType;
}

- (void)setSummary:(id)a3
{
}

- (NSString)displayName
{
  return self->_summary;
}

- (void)setDisplayName:(id)a3
{
}

- (ICSDateValue)nextInstance
{
  return (ICSDateValue *)self->_displayName;
}

- (void)setNextInstance:(id)a3
{
}

- (BOOL)hadMoreInstances
{
  return *(&self->super._useCDATA + 1);
}

- (void)setHadMoreInstances:(BOOL)a3
{
  *(&self->super._useCDATA + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_componentType, 0);
  objc_storeStrong((id *)&self->_hadMoreInstances, 0);
}

@end