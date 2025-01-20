@interface EDSearchableIndexUpdates
- (BOOL)hasUpdates;
- (EDIndexedItems)indexedItems;
- (EDSearchableIndexUpdates)initWithIndexedItems:(id)a3;
- (EDSearchableIndexUpdates)initWithIndexedItems:(id)a3 removedIdentifiers:(id)a4 removedDomainIdentifiers:(id)a5;
- (EDSearchableIndexUpdates)initWithRemovedDomainIdentifiers:(id)a3;
- (EDSearchableIndexUpdates)initWithRemovedIdentifiers:(id)a3;
- (NSArray)removedDomainIdentifiers;
- (NSArray)removedIdentifiers;
- (NSString)ef_publicDescription;
@end

@implementation EDSearchableIndexUpdates

- (EDIndexedItems)indexedItems
{
  return self->_indexedItems;
}

- (NSArray)removedIdentifiers
{
  return self->_removedIdentifiers;
}

- (NSArray)removedDomainIdentifiers
{
  return self->_removedDomainIdentifiers;
}

- (EDSearchableIndexUpdates)initWithIndexedItems:(id)a3 removedIdentifiers:(id)a4 removedDomainIdentifiers:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)EDSearchableIndexUpdates;
  v11 = [(EDSearchableIndexUpdates *)&v19 init];
  if (v11)
  {
    v12 = [[EDIndexedItems alloc] initWithIndexedItems:v8];
    indexedItems = v11->_indexedItems;
    v11->_indexedItems = v12;

    uint64_t v14 = [v9 copy];
    removedIdentifiers = v11->_removedIdentifiers;
    v11->_removedIdentifiers = (NSArray *)v14;

    uint64_t v16 = [v10 copy];
    removedDomainIdentifiers = v11->_removedDomainIdentifiers;
    v11->_removedDomainIdentifiers = (NSArray *)v16;
  }
  return v11;
}

- (BOOL)hasUpdates
{
  v3 = [(EDSearchableIndexUpdates *)self indexedItems];
  if ([v3 count])
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = [(EDSearchableIndexUpdates *)self removedIdentifiers];
    if ([v5 count])
    {
      BOOL v4 = 1;
    }
    else
    {
      v6 = [(EDSearchableIndexUpdates *)self removedDomainIdentifiers];
      BOOL v4 = [v6 count] != 0;
    }
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedDomainIdentifiers, 0);
  objc_storeStrong((id *)&self->_removedIdentifiers, 0);

  objc_storeStrong((id *)&self->_indexedItems, 0);
}

- (EDSearchableIndexUpdates)initWithIndexedItems:(id)a3
{
  return [(EDSearchableIndexUpdates *)self initWithIndexedItems:a3 removedIdentifiers:MEMORY[0x1E4F1CBF0] removedDomainIdentifiers:MEMORY[0x1E4F1CBF0]];
}

- (EDSearchableIndexUpdates)initWithRemovedIdentifiers:(id)a3
{
  return [(EDSearchableIndexUpdates *)self initWithIndexedItems:MEMORY[0x1E4F1CBF0] removedIdentifiers:a3 removedDomainIdentifiers:MEMORY[0x1E4F1CBF0]];
}

- (EDSearchableIndexUpdates)initWithRemovedDomainIdentifiers:(id)a3
{
  return [(EDSearchableIndexUpdates *)self initWithIndexedItems:MEMORY[0x1E4F1CBF0] removedIdentifiers:MEMORY[0x1E4F1CBF0] removedDomainIdentifiers:a3];
}

- (NSString)ef_publicDescription
{
  return (NSString *)[NSString stringWithFormat:@"<%@: %p> %lu added items, %lu removed items, %lu removed domains", objc_opt_class(), self, -[EDIndexedItems count](self->_indexedItems, "count"), -[NSArray count](self->_removedIdentifiers, "count"), -[NSArray count](self->_removedDomainIdentifiers, "count")];
}

@end