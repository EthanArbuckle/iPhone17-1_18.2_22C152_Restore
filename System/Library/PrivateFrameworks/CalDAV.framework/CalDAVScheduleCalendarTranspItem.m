@interface CalDAVScheduleCalendarTranspItem
- (BOOL)isScheduleTransparent;
- (CalDAVScheduleCalendarTranspItem)init;
- (CoreDAVItemWithNoChildren)transparent;
- (id)copyParseRules;
- (void)setTransparent:(id)a3;
@end

@implementation CalDAVScheduleCalendarTranspItem

- (CalDAVScheduleCalendarTranspItem)init
{
  uint64_t v2 = *MEMORY[0x263F34E10];
  uint64_t v3 = *MEMORY[0x263F34F10];
  v5.receiver = self;
  v5.super_class = (Class)CalDAVScheduleCalendarTranspItem;
  return [(CoreDAVItem *)&v5 initWithNameSpace:v2 andName:v3];
}

- (BOOL)isScheduleTransparent
{
  uint64_t v2 = [(CalDAVScheduleCalendarTranspItem *)self transparent];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)copyParseRules
{
  id v2 = objc_alloc(NSDictionary);
  uint64_t v3 = *MEMORY[0x263F34CD8];
  uint64_t v4 = *MEMORY[0x263F34F58];
  objc_super v5 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:*MEMORY[0x263F34CD8] elementName:*MEMORY[0x263F34F58] objectClass:objc_opt_class() setterMethod:sel_setTransparent_];
  v6 = [NSString stringWithFormat:@"%@:%@", v3, v4];
  v7 = objc_msgSend(v2, "initWithObjectsAndKeys:", v5, v6, 0);

  return v7;
}

- (CoreDAVItemWithNoChildren)transparent
{
  return self->_transparent;
}

- (void)setTransparent:(id)a3
{
}

- (void).cxx_destruct
{
}

@end