@interface GEOResolvedItem
- (BOOL)hasResultIndex;
- (GEOResolvedItem)initWithAutocompleteResolvedItem:(id)a3;
- (GEOResolvedItem)initWithResolvedItem:(id)a3;
- (NSString)extractedTerm;
- (int)itemType;
- (unint64_t)resultIndex;
@end

@implementation GEOResolvedItem

- (GEOResolvedItem)initWithResolvedItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOResolvedItem;
  v6 = [(GEOResolvedItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_resolvedItem, a3);
  }

  return v7;
}

- (GEOResolvedItem)initWithAutocompleteResolvedItem:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GEOResolvedItem;
  id v5 = [(GEOResolvedItem *)&v11 init];
  if (v5)
  {
    v6 = objc_alloc_init(GEOPDResolvedItem);
    resolvedItem = v5->_resolvedItem;
    v5->_resolvedItem = v6;

    if ([v4 hasResolvedItemType])
    {
      int v8 = [v4 resolvedItemType];
      objc_super v9 = v5->_resolvedItem;
      if (v9)
      {
        *(unsigned char *)&v9->_flags |= 1u;
        v9->_resolvedItemType = v8;
      }
    }
  }

  return v5;
}

- (NSString)extractedTerm
{
  uint64_t resolvedItem = (uint64_t)self->_resolvedItem;
  if (resolvedItem)
  {
    if (*(void *)(resolvedItem + 16))
    {
      uint64_t resolvedItem = -[GEOPDResolvedItem extractedTerm]((id *)resolvedItem);
    }
    else
    {
      uint64_t resolvedItem = 0;
    }
  }

  return (NSString *)(id)resolvedItem;
}

- (unint64_t)resultIndex
{
  uint64_t resolvedItem = self->_resolvedItem;
  if (resolvedItem) {
    return resolvedItem->_resultIndex;
  }
  else {
    return 0;
  }
}

- (BOOL)hasResultIndex
{
  uint64_t resolvedItem = self->_resolvedItem;
  if (resolvedItem) {
    return (*(unsigned char *)&resolvedItem->_flags >> 1) & 1;
  }
  else {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (int)itemType
{
  uint64_t resolvedItem = self->_resolvedItem;
  if (!resolvedItem || (*(unsigned char *)&resolvedItem->_flags & 1) == 0) {
    return 0;
  }
  int resolvedItemType = resolvedItem->_resolvedItemType;
  if ((resolvedItemType - 1) >= 6) {
    return 0;
  }
  else {
    return resolvedItemType;
  }
}

- (void).cxx_destruct
{
}

@end