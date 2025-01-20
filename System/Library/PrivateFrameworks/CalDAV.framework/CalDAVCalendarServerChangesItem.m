@interface CalDAVCalendarServerChangesItem
- (CalDAVCalendarServerChangesItem)init;
- (CalDAVCalendarServerChangesItem)initWithNameSpace:(id)a3 andName:(id)a4;
- (NSMutableSet)changedProperties;
- (id)copyParseRules;
- (void)addChangedProperty:(id)a3;
- (void)setChangedProperties:(id)a3;
@end

@implementation CalDAVCalendarServerChangesItem

- (CalDAVCalendarServerChangesItem)init
{
  return [(CalDAVCalendarServerChangesItem *)self initWithNameSpace:*MEMORY[0x263F34DA8] andName:@"changes"];
}

- (CalDAVCalendarServerChangesItem)initWithNameSpace:(id)a3 andName:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CalDAVCalendarServerChangesItem;
  v4 = [(CoreDAVItem *)&v8 initWithNameSpace:a3 andName:a4];
  if (v4)
  {
    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    changedProperties = v4->_changedProperties;
    v4->_changedProperties = v5;
  }
  return v4;
}

- (void)addChangedProperty:(id)a3
{
  id v4 = a3;
  id v5 = [(CalDAVCalendarServerChangesItem *)self changedProperties];
  [v5 addObject:v4];
}

- (id)copyParseRules
{
  id v2 = objc_alloc(NSDictionary);
  uint64_t v3 = *MEMORY[0x263F34DA8];
  id v4 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:0x7FFFFFFFLL nameSpace:*MEMORY[0x263F34DA8] elementName:@"changed-property" objectClass:objc_opt_class() setterMethod:sel_addChangedProperty_];
  id v5 = [NSString stringWithFormat:@"%@:%@", v3, @"changed-property"];
  v6 = objc_msgSend(v2, "initWithObjectsAndKeys:", v4, v5, 0);

  return v6;
}

- (NSMutableSet)changedProperties
{
  return self->_changedProperties;
}

- (void)setChangedProperties:(id)a3
{
}

- (void).cxx_destruct
{
}

@end