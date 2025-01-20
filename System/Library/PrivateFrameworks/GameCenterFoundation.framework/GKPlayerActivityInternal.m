@interface GKPlayerActivityInternal
+ (id)secureCodedPropertyKeys;
- (GKPlayerActivityInternal)initWithServerResponse:(id)a3;
- (NSArray)sections;
- (NSString)continuationToken;
- (id)description;
- (void)setContinuationToken:(id)a3;
- (void)setSections:(id)a3;
@end

@implementation GKPlayerActivityInternal

- (GKPlayerActivityInternal)initWithServerResponse:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)GKPlayerActivityInternal;
  v5 = [(GKPlayerActivityInternal *)&v20 init];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    v7 = [v4 objectForKeyedSubscript:@"sections"];
    v8 = v7;
    if (v7)
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v17;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v17 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = [[GKPlayerActivitySectionInternal alloc] initWithDictionary:*(void *)(*((void *)&v16 + 1) + 8 * v12)];
            [v6 addObject:v13];

            ++v12;
          }
          while (v10 != v12);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
        }
        while (v10);
      }
    }
    [(GKPlayerActivityInternal *)v5 setSections:v6];
    v14 = [v4 objectForKeyedSubscript:@"continuation-key"];
    [(GKPlayerActivityInternal *)v5 setContinuationToken:v14];
  }
  return v5;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(GKPlayerActivityInternal *)self sections];
  v5 = [(GKPlayerActivityInternal *)self continuationToken];
  v6 = [v3 stringWithFormat:@"sections: %@, continuationKey: %@", v4, v5];

  return v6;
}

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_277_0 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_277_0, &__block_literal_global_279_0);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_276_0;

  return v2;
}

void __51__GKPlayerActivityInternal_secureCodedPropertyKeys__block_invoke()
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v5[0] = @"sections";
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  v2 = objc_msgSend(v0, "setWithObjects:", v1, objc_opt_class(), 0);
  v5[1] = @"continuationToken";
  v6[0] = v2;
  v6[1] = objc_opt_class();
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];

  id v4 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_276_0;
  secureCodedPropertyKeys_sSecureCodedKeys_276_0 = v3;
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
}

- (NSString)continuationToken
{
  return self->_continuationToken;
}

- (void)setContinuationToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_continuationToken, 0);

  objc_storeStrong((id *)&self->_sections, 0);
}

@end