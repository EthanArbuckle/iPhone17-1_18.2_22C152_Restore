@interface CalDAVCalendarServerCollectionUpdatesElement
- (id)copyParseRules;
- (int)state;
- (void)setPublish:(id)a3;
- (void)setUnpublish:(id)a3;
@end

@implementation CalDAVCalendarServerCollectionUpdatesElement

- (void)setPublish:(id)a3
{
  self->_state = 2;
}

- (void)setUnpublish:(id)a3
{
  self->_state = 1;
}

- (id)copyParseRules
{
  v12.receiver = self;
  v12.super_class = (Class)CalDAVCalendarServerCollectionUpdatesElement;
  id v2 = [(CalDAVCalendarServerResourceChangeElement *)&v12 copyParseRules];
  v3 = (void *)[v2 mutableCopy];
  id v11 = objc_alloc(NSDictionary);
  uint64_t v4 = *MEMORY[0x263F34DA8];
  v5 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:*MEMORY[0x263F34DA8] elementName:@"collection-publish" objectClass:objc_opt_class() setterMethod:sel_setPublish_];
  v6 = [NSString stringWithFormat:@"%@:%@", v4, @"collection-publish"];
  v7 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:v4 elementName:@"collection-unpublish" objectClass:objc_opt_class() setterMethod:sel_setUnpublish_];
  v8 = [NSString stringWithFormat:@"%@:%@", v4, @"collection-unpublish"];
  v9 = objc_msgSend(v11, "initWithObjectsAndKeys:", v5, v6, v7, v8, 0);

  [v3 addEntriesFromDictionary:v9];
  return v3;
}

- (int)state
{
  return self->_state;
}

@end