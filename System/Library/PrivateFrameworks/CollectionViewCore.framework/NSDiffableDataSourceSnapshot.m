@interface NSDiffableDataSourceSnapshot
- (BOOL)isEqual:(id)a3;
- (NSArray)itemIdentifiers;
- (NSArray)itemIdentifiersInSectionWithIdentifier:(id)sectionIdentifier;
- (NSArray)reconfiguredItemIdentifiers;
- (NSArray)reloadedItemIdentifiers;
- (NSArray)reloadedSectionIdentifiers;
- (NSArray)sectionIdentifiers;
- (NSDiffableDataSourceSnapshot)init;
- (NSDiffableDataSourceSnapshot)initWithImpl:(id)a3;
- (NSDiffableDataSourceSnapshot)initWithState:(id)a3;
- (NSInteger)indexOfItemIdentifier:(id)itemIdentifier;
- (NSInteger)indexOfSectionIdentifier:(id)sectionIdentifier;
- (NSInteger)numberOfItems;
- (NSInteger)numberOfItemsInSection:(id)sectionIdentifier;
- (NSInteger)numberOfSections;
- (_NSRange)sectionGlobalItemRangeForSection:(int64_t)a3;
- (__UIDiffableDataSourceSnapshot)impl;
- (id)_identifierAfterIdentifier:(id)a3;
- (id)_identifierBeforeIdentifier:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)identifierForIndexPath:(id)a3;
- (id)indexPathForIdentifier:(id)a3;
- (id)sectionIdentifierForSectionContainingItemIdentifier:(id)itemIdentifier;
- (id)state;
- (void)appendItemsWithIdentifiers:(NSArray *)identifiers;
- (void)appendItemsWithIdentifiers:(NSArray *)identifiers intoSectionWithIdentifier:(id)sectionIdentifier;
- (void)appendSectionsWithIdentifiers:(NSArray *)sectionIdentifiers;
- (void)deleteAllItems;
- (void)deleteItemsWithIdentifiers:(NSArray *)identifiers;
- (void)deleteSectionsWithIdentifiers:(NSArray *)sectionIdentifiers;
- (void)insertItemsWithIdentifiers:(NSArray *)identifiers afterItemWithIdentifier:(id)itemIdentifier;
- (void)insertItemsWithIdentifiers:(NSArray *)identifiers beforeItemWithIdentifier:(id)itemIdentifier;
- (void)insertSectionsWithIdentifiers:(NSArray *)sectionIdentifiers afterSectionWithIdentifier:(id)toSectionIdentifier;
- (void)insertSectionsWithIdentifiers:(NSArray *)sectionIdentifiers beforeSectionWithIdentifier:(id)toSectionIdentifier;
- (void)moveItemWithIdentifier:(id)fromIdentifier afterItemWithIdentifier:(id)toIdentifier;
- (void)moveItemWithIdentifier:(id)fromIdentifier beforeItemWithIdentifier:(id)toIdentifier;
- (void)moveSectionWithIdentifier:(id)fromSectionIdentifier afterSectionWithIdentifier:(id)toSectionIdentifier;
- (void)moveSectionWithIdentifier:(id)fromSectionIdentifier beforeSectionWithIdentifier:(id)toSectionIdentifier;
- (void)reconfigureItemsWithIdentifiers:(NSArray *)identifiers;
- (void)reloadItemsWithIdentifiers:(NSArray *)identifiers;
- (void)reloadSectionsWithIdentifiers:(NSArray *)sectionIdentifiers;
- (void)validateIdentifiers;
@end

@implementation NSDiffableDataSourceSnapshot

- (void).cxx_destruct
{
}

- (NSArray)sectionIdentifiers
{
  return [(__UIDiffableDataSourceSnapshot *)self->_impl sectionIdentifiers];
}

- (NSArray)itemIdentifiers
{
  return [(__UIDiffableDataSourceSnapshot *)self->_impl itemIdentifiers];
}

- (void)appendSectionsWithIdentifiers:(NSArray *)sectionIdentifiers
{
}

- (NSDiffableDataSourceSnapshot)initWithState:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4) {
    v6 = (_UIDiffableDataSourceState *)v4;
  }
  else {
    v6 = objc_alloc_init(_UIDiffableDataSourceState);
  }
  v7 = v6;
  v8 = [[__UIDiffableDataSourceSnapshot alloc] initWithState:v6];
  v9 = [(NSDiffableDataSourceSnapshot *)self initWithImpl:v8];

  return v9;
}

- (NSDiffableDataSourceSnapshot)initWithImpl:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NSDiffableDataSourceSnapshot;
  v6 = [(NSDiffableDataSourceSnapshot *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_impl, a3);
  }

  return v7;
}

- (NSArray)itemIdentifiersInSectionWithIdentifier:(id)sectionIdentifier
{
  return (NSArray *)[(__UIDiffableDataSourceSnapshot *)self->_impl itemIdentifiersInSectionWithIdentifier:sectionIdentifier];
}

- (void)appendItemsWithIdentifiers:(NSArray *)identifiers intoSectionWithIdentifier:(id)sectionIdentifier
{
}

- (__UIDiffableDataSourceSnapshot)impl
{
  return self->_impl;
}

- (NSInteger)numberOfItemsInSection:(id)sectionIdentifier
{
  return [(__UIDiffableDataSourceSnapshot *)self->_impl numberOfItemsInSection:sectionIdentifier];
}

- (NSDiffableDataSourceSnapshot)init
{
  return [(NSDiffableDataSourceSnapshot *)self initWithState:0];
}

- (NSInteger)indexOfItemIdentifier:(id)itemIdentifier
{
  return [(__UIDiffableDataSourceSnapshot *)self->_impl indexOfItemIdentifier:itemIdentifier];
}

- (NSInteger)numberOfItems
{
  return [(__UIDiffableDataSourceSnapshot *)self->_impl numberOfItems];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(__UIDiffableDataSourceSnapshot *)self->_impl isEqual:v4[1]];

  return v5;
}

- (id)identifierForIndexPath:(id)a3
{
  impl = self->_impl;
  id v4 = a3;
  BOOL v5 = [(__UIDiffableDataSourceSnapshot *)impl state];
  v6 = [v5 itemIdentifierForIndexPath:v4];

  return v6;
}

- (id)indexPathForIdentifier:(id)a3
{
  impl = self->_impl;
  id v4 = a3;
  BOOL v5 = [(__UIDiffableDataSourceSnapshot *)impl state];
  v6 = [v5 indexPathForItemIdentifier:v4];

  return v6;
}

- (id)sectionIdentifierForSectionContainingItemIdentifier:(id)itemIdentifier
{
  return [(__UIDiffableDataSourceSnapshot *)self->_impl sectionIdentifierForSectionContainingItemIdentifier:itemIdentifier];
}

- (void)reconfigureItemsWithIdentifiers:(NSArray *)identifiers
{
}

- (NSInteger)indexOfSectionIdentifier:(id)sectionIdentifier
{
  return [(__UIDiffableDataSourceSnapshot *)self->_impl indexOfSectionIdentifier:sectionIdentifier];
}

- (NSInteger)numberOfSections
{
  return [(__UIDiffableDataSourceSnapshot *)self->_impl numberOfSections];
}

- (void)deleteSectionsWithIdentifiers:(NSArray *)sectionIdentifiers
{
}

- (void)appendItemsWithIdentifiers:(NSArray *)identifiers
{
}

- (void)deleteItemsWithIdentifiers:(NSArray *)identifiers
{
}

- (id)description
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v3 = [(__UIDiffableDataSourceSnapshot *)self->_impl state];
  NSInteger v4 = [(NSDiffableDataSourceSnapshot *)self numberOfSections];
  id v5 = objc_alloc(MEMORY[0x263F089D8]);
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = [NSNumber numberWithInteger:v4];
  objc_super v9 = objc_msgSend(NSNumber, "numberWithInteger:", -[NSDiffableDataSourceSnapshot numberOfItems](self, "numberOfItems"));
  v10 = [v3 generationID];
  v11 = [v3 dataSourceSnapshot];
  v25 = self;
  v12 = objc_msgSend(v5, "initWithFormat:", @"<%@ %p: numberOfSections:%@ numberOfItems:%@; generation=%@; sectionCounts=%@",
                  v7,
                  self,
                  v8,
                  v9,
                  v10,
                  v11);

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obuint64_t j = [v3 sections];
  uint64_t v13 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        [v12 appendFormat:@"\n[%@: {", v17];
        v18 = [(NSDiffableDataSourceSnapshot *)v25 itemIdentifiersInSectionWithIdentifier:v17];
        uint64_t v19 = [v18 count];
        if (v19 >= 1)
        {
          uint64_t v20 = v19;
          for (uint64_t j = 0; j != v20; ++j)
          {
            if (j) {
              [v12 appendString:@" "];
            }
            v22 = [v18 objectAtIndexedSubscript:j];
            [v12 appendFormat:@"%@", v22];
          }
        }
        [v12 appendString:@"}]"];
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v14);
  }

  [v12 appendString:@">"];
  return v12;
}

- (NSArray)reloadedSectionIdentifiers
{
  return [(__UIDiffableDataSourceSnapshot *)self->_impl reloadedSectionIdentifiers];
}

- (NSArray)reloadedItemIdentifiers
{
  return [(__UIDiffableDataSourceSnapshot *)self->_impl reloadedItemIdentifiers];
}

- (NSArray)reconfiguredItemIdentifiers
{
  return [(__UIDiffableDataSourceSnapshot *)self->_impl reconfiguredItemIdentifiers];
}

- (void)insertItemsWithIdentifiers:(NSArray *)identifiers beforeItemWithIdentifier:(id)itemIdentifier
{
}

- (void)insertItemsWithIdentifiers:(NSArray *)identifiers afterItemWithIdentifier:(id)itemIdentifier
{
}

- (void)deleteAllItems
{
}

- (void)moveItemWithIdentifier:(id)fromIdentifier beforeItemWithIdentifier:(id)toIdentifier
{
}

- (void)moveItemWithIdentifier:(id)fromIdentifier afterItemWithIdentifier:(id)toIdentifier
{
}

- (void)reloadItemsWithIdentifiers:(NSArray *)identifiers
{
}

- (void)insertSectionsWithIdentifiers:(NSArray *)sectionIdentifiers beforeSectionWithIdentifier:(id)toSectionIdentifier
{
}

- (void)insertSectionsWithIdentifiers:(NSArray *)sectionIdentifiers afterSectionWithIdentifier:(id)toSectionIdentifier
{
}

- (void)moveSectionWithIdentifier:(id)fromSectionIdentifier beforeSectionWithIdentifier:(id)toSectionIdentifier
{
}

- (void)moveSectionWithIdentifier:(id)fromSectionIdentifier afterSectionWithIdentifier:(id)toSectionIdentifier
{
}

- (void)reloadSectionsWithIdentifiers:(NSArray *)sectionIdentifiers
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSInteger v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v5 = (void *)[(__UIDiffableDataSourceSnapshot *)self->_impl copy];
  v6 = (void *)[v4 initWithImpl:v5];

  return v6;
}

- (_NSRange)sectionGlobalItemRangeForSection:(int64_t)a3
{
  NSInteger v4 = [(__UIDiffableDataSourceSnapshot *)self->_impl state];
  id v5 = [v4 dataSourceSnapshot];
  uint64_t v6 = [v5 rangeForSection:a3];
  NSUInteger v8 = v7;

  NSUInteger v9 = v6;
  NSUInteger v10 = v8;
  result.length = v10;
  result.location = v9;
  return result;
}

- (id)_identifierBeforeIdentifier:(id)a3
{
  impl = self->_impl;
  id v5 = a3;
  uint64_t v6 = [(__UIDiffableDataSourceSnapshot *)impl state];
  uint64_t v7 = [v6 indexOfItemIdentifier:v5];

  uint64_t v8 = v7 - 1;
  if ((unint64_t)(v7 - 1) > 0x7FFFFFFFFFFFFFFDLL)
  {
    v11 = 0;
  }
  else
  {
    NSUInteger v9 = [(__UIDiffableDataSourceSnapshot *)self->_impl state];
    NSUInteger v10 = [v9 identifiers];
    v11 = [v10 objectAtIndexedSubscript:v8];
  }
  return v11;
}

- (id)_identifierAfterIdentifier:(id)a3
{
  impl = self->_impl;
  id v5 = a3;
  uint64_t v6 = [(__UIDiffableDataSourceSnapshot *)impl state];
  uint64_t v7 = [v6 indexOfItemIdentifier:v5];

  if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_4;
  }
  unint64_t v8 = v7 + 1;
  NSUInteger v9 = [(__UIDiffableDataSourceSnapshot *)self->_impl state];
  NSUInteger v10 = [v9 identifiers];
  unint64_t v11 = [v10 count];

  if (v8 >= v11)
  {
LABEL_4:
    uint64_t v14 = 0;
  }
  else
  {
    v12 = [(__UIDiffableDataSourceSnapshot *)self->_impl state];
    uint64_t v13 = [v12 identifiers];
    uint64_t v14 = [v13 objectAtIndexedSubscript:v8];
  }
  return v14;
}

- (id)state
{
  return [(__UIDiffableDataSourceSnapshot *)self->_impl state];
}

- (void)validateIdentifiers
{
  id v4 = [(__UIDiffableDataSourceSnapshot *)self->_impl state];
  if (objc_opt_respondsToSelector())
  {
    [v4 validateIdentifiers];
  }
  else
  {
    v2 = [v4 sections];
    _UIDiffableDataSourceValidateIdentifiers(v2, 0);

    v3 = [v4 identifiers];
    _UIDiffableDataSourceValidateIdentifiers(v3, 1);
  }
}

@end