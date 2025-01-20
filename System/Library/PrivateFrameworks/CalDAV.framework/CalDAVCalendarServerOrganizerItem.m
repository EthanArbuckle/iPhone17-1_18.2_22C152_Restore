@interface CalDAVCalendarServerOrganizerItem
- (CalDAVCalendarServerOrganizerItem)init;
- (CoreDAVHrefItem)href;
- (CoreDAVLeafItem)commonName;
- (id)copyParseRules;
- (void)setCommonName:(id)a3;
- (void)setHref:(id)a3;
@end

@implementation CalDAVCalendarServerOrganizerItem

- (CalDAVCalendarServerOrganizerItem)init
{
  return [(CoreDAVItem *)self initWithNameSpace:*MEMORY[0x263F34DA8] andName:@"organizer"];
}

- (id)copyParseRules
{
  id v2 = objc_alloc(NSDictionary);
  uint64_t v3 = *MEMORY[0x263F34E10];
  uint64_t v4 = *MEMORY[0x263F34E50];
  v5 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:1 maximumNumber:1 nameSpace:*MEMORY[0x263F34E10] elementName:*MEMORY[0x263F34E50] objectClass:objc_opt_class() setterMethod:sel_setHref_];
  v6 = [NSString stringWithFormat:@"%@:%@", v3, v4];
  uint64_t v7 = *MEMORY[0x263F34DA8];
  v8 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:*MEMORY[0x263F34DA8] elementName:@"common-name" objectClass:objc_opt_class() setterMethod:sel_setCommonName_];
  v9 = [NSString stringWithFormat:@"%@:%@", v7, @"common-name"];
  v10 = objc_msgSend(v2, "initWithObjectsAndKeys:", v5, v6, v8, v9, 0);

  return v10;
}

- (CoreDAVHrefItem)href
{
  return self->_href;
}

- (void)setHref:(id)a3
{
}

- (CoreDAVLeafItem)commonName
{
  return self->_commonName;
}

- (void)setCommonName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commonName, 0);
  objc_storeStrong((id *)&self->_href, 0);
}

@end