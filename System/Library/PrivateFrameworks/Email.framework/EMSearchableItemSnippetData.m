@interface EMSearchableItemSnippetData
- (EMSearchableItemSnippetData)initWithSearchableItemIdentifier:(id)a3 snippetHints:(id)a4;
- (NSDictionary)snippetHints;
- (NSString)searchableItemIdentifier;
- (void)setSearchableItemIdentifier:(id)a3;
- (void)setSnippetHints:(id)a3;
@end

@implementation EMSearchableItemSnippetData

- (EMSearchableItemSnippetData)initWithSearchableItemIdentifier:(id)a3 snippetHints:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)EMSearchableItemSnippetData;
  v8 = [(EMSearchableItemSnippetData *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    searchableItemIdentifier = v8->_searchableItemIdentifier;
    v8->_searchableItemIdentifier = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    snippetHints = v8->_snippetHints;
    v8->_snippetHints = (NSDictionary *)v11;
  }
  return v8;
}

- (NSString)searchableItemIdentifier
{
  return self->_searchableItemIdentifier;
}

- (void)setSearchableItemIdentifier:(id)a3
{
}

- (NSDictionary)snippetHints
{
  return self->_snippetHints;
}

- (void)setSnippetHints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snippetHints, 0);
  objc_storeStrong((id *)&self->_searchableItemIdentifier, 0);
}

@end