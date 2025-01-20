@interface CalDAVCalendarServerCollectionChangesElement
- (CalDAVCalendarServerCollectionChangesElement)init;
- (id)copyParseRules;
- (int64_t)created;
- (int64_t)deleted;
- (int64_t)updated;
- (void)setCreated:(int64_t)a3;
- (void)setCreatedItem:(id)a3;
- (void)setDeleted:(int64_t)a3;
- (void)setDeletedItem:(id)a3;
- (void)setUpdated:(int64_t)a3;
- (void)setUpdatedItem:(id)a3;
@end

@implementation CalDAVCalendarServerCollectionChangesElement

- (CalDAVCalendarServerCollectionChangesElement)init
{
  return [(CoreDAVItem *)self initWithNameSpace:*MEMORY[0x263F34DA8] andName:@"collection-changes"];
}

- (void)setCreatedItem:(id)a3
{
  id v4 = [a3 payloadAsString];
  -[CalDAVCalendarServerCollectionChangesElement setCreated:](self, "setCreated:", [v4 integerValue]);
}

- (void)setUpdatedItem:(id)a3
{
  id v4 = [a3 payloadAsString];
  -[CalDAVCalendarServerCollectionChangesElement setUpdated:](self, "setUpdated:", [v4 integerValue]);
}

- (void)setDeletedItem:(id)a3
{
  id v4 = [a3 payloadAsString];
  -[CalDAVCalendarServerCollectionChangesElement setDeleted:](self, "setDeleted:", [v4 integerValue]);
}

- (id)copyParseRules
{
  v14.receiver = self;
  v14.super_class = (Class)CalDAVCalendarServerCollectionChangesElement;
  id v13 = [(CalDAVCalendarServerResourceChangeElement *)&v14 copyParseRules];
  v12 = (void *)[v13 mutableCopy];
  id v11 = objc_alloc(NSDictionary);
  uint64_t v2 = *MEMORY[0x263F34DA8];
  v3 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:*MEMORY[0x263F34DA8] elementName:@"child-created" objectClass:objc_opt_class() setterMethod:sel_setCreatedItem_];
  id v4 = [NSString stringWithFormat:@"%@:%@", v2, @"child-created"];
  v5 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:v2 elementName:@"child-updated" objectClass:objc_opt_class() setterMethod:sel_setUpdatedItem_];
  v6 = [NSString stringWithFormat:@"%@:%@", v2, @"child-updated"];
  v7 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:v2 elementName:@"child-deleted" objectClass:objc_opt_class() setterMethod:sel_setDeletedItem_];
  v8 = [NSString stringWithFormat:@"%@:%@", v2, @"child-deleted"];
  v9 = objc_msgSend(v11, "initWithObjectsAndKeys:", v3, v4, v5, v6, v7, v8, 0);

  [v12 addEntriesFromDictionary:v9];
  return v12;
}

- (int64_t)created
{
  return self->_created;
}

- (void)setCreated:(int64_t)a3
{
  self->_created = a3;
}

- (int64_t)updated
{
  return self->_updated;
}

- (void)setUpdated:(int64_t)a3
{
  self->_updated = a3;
}

- (int64_t)deleted
{
  return self->_deleted;
}

- (void)setDeleted:(int64_t)a3
{
  self->_deleted = a3;
}

@end