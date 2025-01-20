@interface CalDAVCalendarServerResourceChangedItem
- (CalDAVCalendarServerResourceChangedItem)init;
- (ICSDateValue)dtstamp;
- (NSMutableSet)collectionChanges;
- (NSMutableSet)collectionUpdates;
- (NSMutableSet)created;
- (NSMutableSet)deleted;
- (NSMutableSet)updated;
- (id)copyParseRules;
- (void)addCollectionChanges:(id)a3;
- (void)addCollectionUpdates:(id)a3;
- (void)addCreated:(id)a3;
- (void)addDeleted:(id)a3;
- (void)addUpdated:(id)a3;
- (void)setCollectionChanges:(id)a3;
- (void)setCollectionUpdates:(id)a3;
- (void)setCreated:(id)a3;
- (void)setDeleted:(id)a3;
- (void)setDtstamp:(id)a3;
- (void)setDtstampItem:(id)a3;
- (void)setUpdated:(id)a3;
@end

@implementation CalDAVCalendarServerResourceChangedItem

- (CalDAVCalendarServerResourceChangedItem)init
{
  return [(CoreDAVItem *)self initWithNameSpace:*MEMORY[0x263F34DA8] andName:@"resource-changed"];
}

- (void)addCreated:(id)a3
{
  id v4 = a3;
  v5 = [(CalDAVCalendarServerResourceChangedItem *)self created];

  if (!v5)
  {
    v6 = [MEMORY[0x263EFF9C0] setWithCapacity:1];
    [(CalDAVCalendarServerResourceChangedItem *)self setCreated:v6];
  }
  id v7 = [(CalDAVCalendarServerResourceChangedItem *)self created];
  [v7 addObject:v4];
}

- (void)addUpdated:(id)a3
{
  id v4 = a3;
  v5 = [(CalDAVCalendarServerResourceChangedItem *)self updated];

  if (!v5)
  {
    v6 = [MEMORY[0x263EFF9C0] setWithCapacity:1];
    [(CalDAVCalendarServerResourceChangedItem *)self setUpdated:v6];
  }
  id v7 = [(CalDAVCalendarServerResourceChangedItem *)self updated];
  [v7 addObject:v4];
}

- (void)addDeleted:(id)a3
{
  id v4 = a3;
  v5 = [(CalDAVCalendarServerResourceChangedItem *)self deleted];

  if (!v5)
  {
    v6 = [MEMORY[0x263EFF9C0] setWithCapacity:1];
    [(CalDAVCalendarServerResourceChangedItem *)self setDeleted:v6];
  }
  id v7 = [(CalDAVCalendarServerResourceChangedItem *)self deleted];
  [v7 addObject:v4];
}

- (void)addCollectionChanges:(id)a3
{
  id v4 = a3;
  v5 = [(CalDAVCalendarServerResourceChangedItem *)self collectionChanges];

  if (!v5)
  {
    v6 = [MEMORY[0x263EFF9C0] setWithCapacity:1];
    [(CalDAVCalendarServerResourceChangedItem *)self setCollectionChanges:v6];
  }
  id v7 = [(CalDAVCalendarServerResourceChangedItem *)self collectionChanges];
  [v7 addObject:v4];
}

- (void)addCollectionUpdates:(id)a3
{
  id v4 = a3;
  v5 = [(CalDAVCalendarServerResourceChangedItem *)self collectionUpdates];

  if (!v5)
  {
    v6 = [MEMORY[0x263EFF9C0] setWithCapacity:1];
    [(CalDAVCalendarServerResourceChangedItem *)self setCollectionUpdates:v6];
  }
  id v7 = [(CalDAVCalendarServerResourceChangedItem *)self collectionUpdates];
  [v7 addObject:v4];
}

- (void)setDtstampItem:(id)a3
{
  id v4 = (void *)MEMORY[0x263F886E0];
  id v6 = [a3 payloadAsString];
  v5 = [v4 dateFromICSString:v6];
  [(CalDAVCalendarServerResourceChangedItem *)self setDtstamp:v5];
}

- (id)copyParseRules
{
  id v15 = objc_alloc(NSDictionary);
  uint64_t v2 = *MEMORY[0x263F34DA8];
  v17 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:0x7FFFFFFFLL nameSpace:*MEMORY[0x263F34DA8] elementName:@"created" objectClass:objc_opt_class() setterMethod:sel_addCreated_];
  v14 = [NSString stringWithFormat:@"%@:%@", v2, @"created"];
  v13 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:0x7FFFFFFFLL nameSpace:v2 elementName:@"updated" objectClass:objc_opt_class() setterMethod:sel_addUpdated_];
  v12 = [NSString stringWithFormat:@"%@:%@", v2, @"updated"];
  v11 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:0x7FFFFFFFLL nameSpace:v2 elementName:@"deleted" objectClass:objc_opt_class() setterMethod:sel_addDeleted_];
  v3 = [NSString stringWithFormat:@"%@:%@", v2, @"deleted"];
  id v4 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:0x7FFFFFFFLL nameSpace:v2 elementName:@"collection-changes" objectClass:objc_opt_class() setterMethod:sel_addCollectionChanges_];
  v5 = [NSString stringWithFormat:@"%@:%@", v2, @"collection-changes"];
  v10 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:0x7FFFFFFFLL nameSpace:v2 elementName:@"collection-update" objectClass:objc_opt_class() setterMethod:sel_addCollectionUpdates_];
  id v6 = [NSString stringWithFormat:@"%@:%@", v2, @"collection-update"];
  id v7 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:v2 elementName:@"dtstamp" objectClass:objc_opt_class() setterMethod:sel_setDtstampItem_];
  v8 = [NSString stringWithFormat:@"%@:%@", v2, @"dtstamp"];
  v16 = objc_msgSend(v15, "initWithObjectsAndKeys:", v17, v14, v13, v12, v11, v3, v4, v5, v10, v6, v7, v8, 0);

  return v16;
}

- (NSMutableSet)created
{
  return self->_created;
}

- (void)setCreated:(id)a3
{
}

- (NSMutableSet)updated
{
  return self->_updated;
}

- (void)setUpdated:(id)a3
{
}

- (NSMutableSet)deleted
{
  return self->_deleted;
}

- (void)setDeleted:(id)a3
{
}

- (NSMutableSet)collectionChanges
{
  return self->_collectionChanges;
}

- (void)setCollectionChanges:(id)a3
{
}

- (NSMutableSet)collectionUpdates
{
  return self->_collectionUpdates;
}

- (void)setCollectionUpdates:(id)a3
{
}

- (ICSDateValue)dtstamp
{
  return self->_dtstamp;
}

- (void)setDtstamp:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dtstamp, 0);
  objc_storeStrong((id *)&self->_collectionUpdates, 0);
  objc_storeStrong((id *)&self->_collectionChanges, 0);
  objc_storeStrong((id *)&self->_deleted, 0);
  objc_storeStrong((id *)&self->_updated, 0);
  objc_storeStrong((id *)&self->_created, 0);
}

@end