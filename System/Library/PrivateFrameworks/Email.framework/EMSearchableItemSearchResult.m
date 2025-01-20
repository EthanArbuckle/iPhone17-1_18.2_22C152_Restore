@interface EMSearchableItemSearchResult
- (EMSearchableItemSearchResult)initWithIdentifiers:(id)a3 snippetData:(id)a4;
- (NSArray)identifiers;
- (NSArray)snippetData;
@end

@implementation EMSearchableItemSearchResult

- (EMSearchableItemSearchResult)initWithIdentifiers:(id)a3 snippetData:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)EMSearchableItemSearchResult;
  v9 = [(EMSearchableItemSearchResult *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifiers, a3);
    objc_storeStrong((id *)&v10->_snippetData, a4);
  }

  return v10;
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (NSArray)snippetData
{
  return self->_snippetData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snippetData, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
}

@end