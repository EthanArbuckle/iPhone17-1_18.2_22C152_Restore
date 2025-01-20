@interface CalDAVCalendarServerResourceChangeUpdatedElement
- (BOOL)content;
- (CalDAVCalendarServerResourceChangeUpdatedElement)init;
- (CoreDAVItem)prop;
- (NSMutableSet)calendarChanges;
- (id)copyParseRules;
- (void)addCalendarChange:(id)a3;
- (void)addContentItem:(id)a3;
- (void)setCalendarChanges:(id)a3;
- (void)setContent:(BOOL)a3;
- (void)setProp:(id)a3;
@end

@implementation CalDAVCalendarServerResourceChangeUpdatedElement

- (CalDAVCalendarServerResourceChangeUpdatedElement)init
{
  return [(CoreDAVItem *)self initWithNameSpace:*MEMORY[0x263F34DA8] andName:@"updated"];
}

- (void)addContentItem:(id)a3
{
}

- (void)addCalendarChange:(id)a3
{
  id v4 = a3;
  v5 = [(CalDAVCalendarServerResourceChangeUpdatedElement *)self calendarChanges];

  if (!v5)
  {
    v6 = [MEMORY[0x263EFF9C0] setWithCapacity:1];
    [(CalDAVCalendarServerResourceChangeUpdatedElement *)self setCalendarChanges:v6];
  }
  id v7 = [(CalDAVCalendarServerResourceChangeUpdatedElement *)self calendarChanges];
  [v7 addObject:v4];
}

- (id)copyParseRules
{
  v16.receiver = self;
  v16.super_class = (Class)CalDAVCalendarServerResourceChangeUpdatedElement;
  id v15 = [(CalDAVCalendarServerResourceChangeElement *)&v16 copyParseRules];
  v2 = (void *)[v15 mutableCopy];
  id v14 = objc_alloc(NSDictionary);
  uint64_t v3 = *MEMORY[0x263F34DA8];
  id v4 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:*MEMORY[0x263F34DA8] elementName:@"content" objectClass:objc_opt_class() setterMethod:sel_addContentItem_];
  v5 = [NSString stringWithFormat:@"%@:%@", v3, @"content"];
  uint64_t v6 = *MEMORY[0x263F34E10];
  uint64_t v7 = *MEMORY[0x263F34EE0];
  v8 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:*MEMORY[0x263F34E10] elementName:*MEMORY[0x263F34EE0] objectClass:objc_opt_class() setterMethod:sel_setProp_];
  v9 = [NSString stringWithFormat:@"%@:%@", v6, v7];
  v10 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:v3 elementName:@"calendar-changes" objectClass:objc_opt_class() setterMethod:sel_addCalendarChange_];
  v11 = [NSString stringWithFormat:@"%@:%@", v3, @"calendar-changes"];
  v12 = objc_msgSend(v14, "initWithObjectsAndKeys:", v4, v5, v8, v9, v10, v11, 0);

  [v2 addEntriesFromDictionary:v12];
  return v2;
}

- (BOOL)content
{
  return self->_content;
}

- (void)setContent:(BOOL)a3
{
  self->_content = a3;
}

- (CoreDAVItem)prop
{
  return self->_prop;
}

- (void)setProp:(id)a3
{
}

- (NSMutableSet)calendarChanges
{
  return self->_calendarChanges;
}

- (void)setCalendarChanges:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarChanges, 0);
  objc_storeStrong((id *)&self->_prop, 0);
}

@end