@interface NSFileProviderSearch
- (NSFileProviderSearch)initWithSpotlightQueryString:(id)a3 scopedToItemIdentifier:(id)a4 searchContainerItemIdentifier:(id)a5 legacySearchQuery:(id)a6;
- (NSFileProviderSearchQuery)legacySearchQuery;
- (NSString)scopedToItemIdentifier;
- (NSString)searchContainerItemIdentifier;
- (NSString)spotlightQueryString;
@end

@implementation NSFileProviderSearch

- (NSString)spotlightQueryString
{
  return self->_spotlightQueryString;
}

- (NSString)scopedToItemIdentifier
{
  return self->_scopedToItemIdentifier;
}

- (NSString)searchContainerItemIdentifier
{
  return self->_searchContainerItemIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacySearchQuery, 0);
  objc_storeStrong((id *)&self->_searchContainerItemIdentifier, 0);
  objc_storeStrong((id *)&self->_scopedToItemIdentifier, 0);

  objc_storeStrong((id *)&self->_spotlightQueryString, 0);
}

- (NSFileProviderSearch)initWithSpotlightQueryString:(id)a3 scopedToItemIdentifier:(id)a4 searchContainerItemIdentifier:(id)a5 legacySearchQuery:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = [(NSFileProviderSearch *)self init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_spotlightQueryString, a3);
    objc_storeStrong((id *)&v16->_scopedToItemIdentifier, a4);
    objc_storeStrong((id *)&v16->_searchContainerItemIdentifier, a5);
    objc_storeStrong((id *)&v16->_legacySearchQuery, a6);
  }

  return v16;
}

- (NSFileProviderSearchQuery)legacySearchQuery
{
  return self->_legacySearchQuery;
}

@end