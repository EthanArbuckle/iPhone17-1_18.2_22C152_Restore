@interface CalDAVCalendarServerAllowedSharingModesItem
- (CalDAVCalendarServerAllowedSharingModesItem)init;
- (CoreDAVItemWithNoChildren)canBePublished;
- (CoreDAVItemWithNoChildren)canBeShared;
- (CoreDAVItemWithNoChildren)isMarkedImmutableSharees;
- (CoreDAVItemWithNoChildren)isMarkedUndeletable;
- (id)copyParseRules;
- (void)setCanBePublished:(id)a3;
- (void)setCanBeShared:(id)a3;
- (void)setIsMarkedImmutableSharees:(id)a3;
- (void)setIsMarkedUndeletable:(id)a3;
@end

@implementation CalDAVCalendarServerAllowedSharingModesItem

- (CalDAVCalendarServerAllowedSharingModesItem)init
{
  return [(CoreDAVItem *)self initWithNameSpace:*MEMORY[0x263F34DA8] andName:*MEMORY[0x263F34D18]];
}

- (id)copyParseRules
{
  id v17 = objc_alloc(NSDictionary);
  uint64_t v2 = *MEMORY[0x263F34DA8];
  uint64_t v3 = *MEMORY[0x263F34D20];
  v16 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:*MEMORY[0x263F34DA8] elementName:*MEMORY[0x263F34D20] objectClass:objc_opt_class() setterMethod:sel_setCanBePublished_];
  v4 = [NSString stringWithFormat:@"%@:%@", v2, v3];
  uint64_t v5 = *MEMORY[0x263F34D28];
  v6 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:v2 elementName:*MEMORY[0x263F34D28] objectClass:objc_opt_class() setterMethod:sel_setCanBeShared_];
  v7 = [NSString stringWithFormat:@"%@:%@", v2, v5];
  uint64_t v8 = *MEMORY[0x263F34E68];
  v9 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:v2 elementName:*MEMORY[0x263F34E68] objectClass:objc_opt_class() setterMethod:sel_setIsMarkedUndeletable_];
  v10 = [NSString stringWithFormat:@"%@:%@", v2, v8];
  uint64_t v11 = *MEMORY[0x263F34E60];
  v12 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:v2 elementName:*MEMORY[0x263F34E60] objectClass:objc_opt_class() setterMethod:sel_setIsMarkedImmutableSharees_];
  v13 = [NSString stringWithFormat:@"%@:%@", v2, v11];
  v14 = objc_msgSend(v17, "initWithObjectsAndKeys:", v16, v4, v6, v7, v9, v10, v12, v13, 0);

  return v14;
}

- (CoreDAVItemWithNoChildren)canBePublished
{
  return self->_canBePublished;
}

- (void)setCanBePublished:(id)a3
{
}

- (CoreDAVItemWithNoChildren)canBeShared
{
  return self->_canBeShared;
}

- (void)setCanBeShared:(id)a3
{
}

- (CoreDAVItemWithNoChildren)isMarkedUndeletable
{
  return self->_isMarkedUndeletable;
}

- (void)setIsMarkedUndeletable:(id)a3
{
}

- (CoreDAVItemWithNoChildren)isMarkedImmutableSharees
{
  return self->_isMarkedImmutableSharees;
}

- (void)setIsMarkedImmutableSharees:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isMarkedImmutableSharees, 0);
  objc_storeStrong((id *)&self->_isMarkedUndeletable, 0);
  objc_storeStrong((id *)&self->_canBeShared, 0);
  objc_storeStrong((id *)&self->_canBePublished, 0);
}

@end