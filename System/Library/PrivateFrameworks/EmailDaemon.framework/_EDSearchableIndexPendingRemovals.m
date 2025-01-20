@interface _EDSearchableIndexPendingRemovals
- (NSArray)deletedIdentifiers;
- (NSArray)identifiers;
- (NSArray)purgedIdentifiers;
- (NSSet)exclusionReasons;
- (NSSet)purgeReasons;
- (_EDSearchableIndexPendingRemovals)initWithPurgeReasons:(id)a3 exclusionReasons:(id)a4;
- (id)_identifiersPassingReasonsTest:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)count;
- (void)addIdentifiers:(id)a3 withReasons:(id)a4;
- (void)removeAllIdentifiers;
- (void)removeIdentifier:(id)a3;
- (void)setExclusionReasons:(id)a3;
- (void)setPurgeReasons:(id)a3;
@end

@implementation _EDSearchableIndexPendingRemovals

- (unint64_t)count
{
  return [(NSMutableDictionary *)self->_reasonsByIdentifier count];
}

- (_EDSearchableIndexPendingRemovals)initWithPurgeReasons:(id)a3 exclusionReasons:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_EDSearchableIndexPendingRemovals;
  v8 = [(_EDSearchableIndexPendingRemovals *)&v16 init];
  if (v8)
  {
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    reasonsByIdentifier = v8->_reasonsByIdentifier;
    v8->_reasonsByIdentifier = v9;

    uint64_t v11 = [v6 copy];
    purgeReasons = v8->_purgeReasons;
    v8->_purgeReasons = (NSSet *)v11;

    uint64_t v13 = [v7 copy];
    exclusionReasons = v8->_exclusionReasons;
    v8->_exclusionReasons = (NSSet *)v13;
  }
  return v8;
}

- (NSArray)identifiers
{
  return (NSArray *)[(NSMutableDictionary *)self->_reasonsByIdentifier allKeys];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exclusionReasons, 0);
  objc_storeStrong((id *)&self->_purgeReasons, 0);

  objc_storeStrong((id *)&self->_reasonsByIdentifier, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithPurgeReasons:self->_purgeReasons exclusionReasons:self->_exclusionReasons];
  uint64_t v5 = [(NSMutableDictionary *)self->_reasonsByIdentifier mutableCopy];
  id v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (id)_identifiersPassingReasonsTest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_EDSearchableIndexPendingRemovals *)self purgeReasons];
  id v6 = [(_EDSearchableIndexPendingRemovals *)self exclusionReasons];
  id v7 = [MEMORY[0x1E4F1CA48] array];
  reasonsByIdentifier = self->_reasonsByIdentifier;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __68___EDSearchableIndexPendingRemovals__identifiersPassingReasonsTest___block_invoke;
  v16[3] = &unk_1E6C05D98;
  id v9 = v4;
  id v20 = v9;
  id v10 = v5;
  id v17 = v10;
  id v11 = v6;
  id v18 = v11;
  id v12 = v7;
  id v19 = v12;
  [(NSMutableDictionary *)reasonsByIdentifier enumerateKeysAndObjectsUsingBlock:v16];
  uint64_t v13 = v19;
  id v14 = v12;

  return v14;
}

- (NSArray)purgedIdentifiers
{
  return (NSArray *)[(_EDSearchableIndexPendingRemovals *)self _identifiersPassingReasonsTest:&__block_literal_global_152];
}

- (NSArray)deletedIdentifiers
{
  return (NSArray *)[(_EDSearchableIndexPendingRemovals *)self _identifiersPassingReasonsTest:&__block_literal_global_154];
}

- (void)addIdentifiers:(id)a3 withReasons:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = -[NSMutableDictionary objectForKeyedSubscript:](self->_reasonsByIdentifier, "objectForKeyedSubscript:", *(void *)(*((void *)&v14 + 1) + 8 * v11), (void)v14);
        uint64_t v13 = v12;
        if (v12)
        {
          [v12 unionSet:v7];
        }
        else
        {
          uint64_t v13 = [MEMORY[0x1E4F1CA80] setWithSet:v7];
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_reasonsByIdentifier, "setObject:forKeyedSubscript:");
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

- (void)removeIdentifier:(id)a3
{
}

- (void)removeAllIdentifiers
{
}

- (NSSet)purgeReasons
{
  return self->_purgeReasons;
}

- (void)setPurgeReasons:(id)a3
{
}

- (NSSet)exclusionReasons
{
  return self->_exclusionReasons;
}

- (void)setExclusionReasons:(id)a3
{
}

@end