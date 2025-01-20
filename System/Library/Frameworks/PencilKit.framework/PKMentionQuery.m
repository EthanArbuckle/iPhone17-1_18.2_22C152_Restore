@interface PKMentionQuery
- (NSSet)validSuffixes;
- (PKMentionQuery)initWithRecognitionSessionManager:(id)a3;
- (void)queryDidUpdateResult:(id)a3;
- (void)setValidSuffixes:(id)a3;
@end

@implementation PKMentionQuery

- (PKMentionQuery)initWithRecognitionSessionManager:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKMentionQuery;
  v5 = [(PKQuery *)&v11 initWithRecognitionSessionManager:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F5C060];
    v7 = -[PKRecognitionSessionManager session](v4);
    v8 = [v6 mentionQueryForRecognitionSession:v7];
    [(PKDetectionQuery *)v5 setQuery:v8];

    v9 = [(PKDetectionQuery *)v5 query];
    [v9 setDelegate:v5];
  }
  return v5;
}

- (void)setValidSuffixes:(id)a3
{
  id v4 = a3;
  id v5 = [(PKDetectionQuery *)self query];
  [v5 setValidSuffixes:v4];
}

- (NSSet)validSuffixes
{
  v2 = [(PKDetectionQuery *)self query];
  v3 = [v2 validSuffixes];

  return (NSSet *)v3;
}

- (void)queryDidUpdateResult:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = (void *)MEMORY[0x1E4F1CA48];
    v7 = [v5 foundItems];
    v8 = objc_msgSend(v6, "arrayWithCapacity:", objc_msgSend(v7, "count"));

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v9 = objc_msgSend(v5, "foundItems", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v20;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = [[PKMentionQueryItem alloc] initWithCoreHandwritingPrefixQueryItem:*(void *)(*((void *)&v19 + 1) + 8 * v13)];
          [v8 addObject:v14];

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v11);
    }

    v15 = [(PKQuery *)self delegate];
    char v16 = objc_opt_respondsToSelector();

    if (v16)
    {
      v17 = [(PKQuery *)self delegate];
      v18 = (void *)[v8 copy];
      [v17 mentionQuery:self foundItems:v18];
    }
  }
}

@end