@interface SHMediaLibrarySnapshot
+ (BOOL)supportsSecureCoding;
+ (id)remapSnapshot:(id)a3 withBundleIdentifier:(id)a4;
- (BOOL)containsLibraryItem:(id)a3;
- (BOOL)evaluateUsingPredicate:(id)a3;
- (BOOL)hasChanges;
- (BOOL)isConflictingChange:(id)a3;
- (BOOL)validateWithBundleIdentifier:(id)a3;
- (NSArray)allItemIdentifiers;
- (NSArray)changes;
- (NSArray)trackChanges;
- (NSMutableOrderedSet)changeset;
- (SHMediaLibrarySnapshot)init;
- (SHMediaLibrarySnapshot)initWithChanges:(id)a3;
- (SHMediaLibrarySnapshot)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)filteredSnapshotUsingPredicate:(id)a3;
- (id)tracksForChangeType:(int64_t)a3;
- (void)addChanges:(id)a3;
- (void)addItem:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)mergeSnapshot:(id)a3;
- (void)removeItem:(id)a3;
- (void)removeSnapshot:(id)a3;
- (void)setChangeset:(id)a3;
@end

@implementation SHMediaLibrarySnapshot

- (SHMediaLibrarySnapshot)init
{
  v3 = [MEMORY[0x263EFF9D8] orderedSet];
  v4 = [(SHMediaLibrarySnapshot *)self initWithChanges:v3];

  return v4;
}

- (SHMediaLibrarySnapshot)initWithChanges:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHMediaLibrarySnapshot;
  v5 = [(SHMediaLibrarySnapshot *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 mutableCopy];
    changeset = v5->_changeset;
    v5->_changeset = (NSMutableOrderedSet *)v6;
  }
  return v5;
}

- (NSArray)changes
{
  v2 = [(SHMediaLibrarySnapshot *)self changeset];
  v3 = [v2 array];

  return (NSArray *)v3;
}

- (BOOL)hasChanges
{
  v2 = [(SHMediaLibrarySnapshot *)self changeset];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (NSArray)trackChanges
{
  BOOL v3 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_5];
  id v4 = [(SHMediaLibrarySnapshot *)self changes];
  v5 = (void *)[v4 mutableCopy];

  uint64_t v6 = (void *)MEMORY[0x22A61F6E0]();
  [v5 filterUsingPredicate:v3];
  v7 = (void *)[v5 copy];

  return (NSArray *)v7;
}

uint64_t __38__SHMediaLibrarySnapshot_trackChanges__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 libraryItem];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (NSArray)allItemIdentifiers
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  BOOL v3 = (void *)MEMORY[0x263EFF980];
  id v4 = [(SHMediaLibrarySnapshot *)self changes];
  v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = [(SHMediaLibrarySnapshot *)self changes];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [*(id *)(*((void *)&v16 + 1) + 8 * i) libraryItem];
        v12 = [v11 identifier];
        v13 = (void *)[v12 copy];
        [v5 addObject:v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  v14 = (void *)[v5 copy];

  return (NSArray *)v14;
}

- (void)addItem:(id)a3
{
  v7[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [[SHMediaLibraryChange alloc] initWithLibraryItem:v4 changeType:1];

  v7[0] = v5;
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  [(SHMediaLibrarySnapshot *)self addChanges:v6];
}

- (void)removeItem:(id)a3
{
  v7[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [[SHMediaLibraryChange alloc] initWithLibraryItem:v4 changeType:3];

  v7[0] = v5;
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  [(SHMediaLibrarySnapshot *)self addChanges:v6];
}

- (void)addChanges:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v19;
    *(void *)&long long v6 = 138412290;
    long long v17 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (-[SHMediaLibrarySnapshot isConflictingChange:](self, "isConflictingChange:", v10, v17))
        {
          v11 = sh_log_object();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            v12 = [v10 libraryItem];
            v13 = [v12 identifier];
            *(_DWORD *)buf = v17;
            v23 = v13;
            _os_log_impl(&dword_224B4B000, v11, OS_LOG_TYPE_ERROR, "Should not try to modify and remove the same library item (%@)", buf, 0xCu);
          }
        }
        else
        {
          v14 = [(SHMediaLibrarySnapshot *)self changeset];
          uint64_t v15 = [v14 indexOfObject:v10];

          long long v16 = [(SHMediaLibrarySnapshot *)self changeset];
          v11 = v16;
          if (v15 == 0x7FFFFFFFFFFFFFFFLL) {
            [v16 addObject:v10];
          }
          else {
            [v16 replaceObjectAtIndex:v15 withObject:v10];
          }
        }
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v7);
  }
}

- (void)mergeSnapshot:(id)a3
{
  if (self != a3)
  {
    id v5 = [a3 changes];
    [(SHMediaLibrarySnapshot *)self addChanges:v5];
  }
}

- (BOOL)containsLibraryItem:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263F08A98];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __46__SHMediaLibrarySnapshot_containsLibraryItem___block_invoke;
  v9[3] = &unk_2646EF8A8;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = [v5 predicateWithBlock:v9];
  LOBYTE(self) = [(SHMediaLibrarySnapshot *)self evaluateUsingPredicate:v7];

  return (char)self;
}

uint64_t __46__SHMediaLibrarySnapshot_containsLibraryItem___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 libraryItem];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (BOOL)isConflictingChange:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263F08A98];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __46__SHMediaLibrarySnapshot_isConflictingChange___block_invoke;
  v9[3] = &unk_2646EF8A8;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = [v5 predicateWithBlock:v9];
  LOBYTE(self) = [(SHMediaLibrarySnapshot *)self evaluateUsingPredicate:v7];

  return (char)self;
}

uint64_t __46__SHMediaLibrarySnapshot_isConflictingChange___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isConflictingChange:*(void *)(a1 + 32)];
}

- (BOOL)evaluateUsingPredicate:(id)a3
{
  id v4 = a3;
  id v5 = [(SHMediaLibrarySnapshot *)self changes];
  id v6 = (void *)[v5 mutableCopy];

  uint64_t v7 = (void *)MEMORY[0x22A61F6E0]();
  [v6 filterUsingPredicate:v4];
  LOBYTE(v7) = [v6 count] != 0;

  return (char)v7;
}

- (BOOL)validateWithBundleIdentifier:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = [(SHMediaLibrarySnapshot *)self changes];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v11 = [v10 libraryItem];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v12 = [v10 changeType];

          if (v12 == 3)
          {
            v13 = [v10 libraryItem];
            v14 = [v13 providerIdentifier];
            char v15 = [v14 isEqualToString:v4];

            if ((v15 & 1) == 0)
            {
              BOOL v16 = 0;
              goto LABEL_14;
            }
          }
        }
        else
        {
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }
  BOOL v16 = 1;
LABEL_14:

  return v16;
}

- (id)tracksForChangeType:(int64_t)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = (void *)MEMORY[0x263EFF980];
  uint64_t v6 = [(SHMediaLibrarySnapshot *)self changes];
  uint64_t v7 = objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v8 = [(SHMediaLibrarySnapshot *)self changes];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v14 = [v13 libraryItem];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        uint64_t v16 = [v13 changeType];
        if ((isKindOfClass & 1) != 0 && v16 == a3)
        {
          long long v17 = [v13 libraryItem];
          [v7 addObject:v17];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }

  long long v18 = (void *)[v7 copy];

  return v18;
}

+ (id)remapSnapshot:(id)a3 withBundleIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)MEMORY[0x263F08A98];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __61__SHMediaLibrarySnapshot_remapSnapshot_withBundleIdentifier___block_invoke;
  v16[3] = &unk_2646EF8A8;
  id v8 = v6;
  id v17 = v8;
  uint64_t v9 = [v7 predicateWithBlock:v16];
  uint64_t v10 = [v5 changes];
  uint64_t v11 = (void *)[v10 mutableCopy];

  uint64_t v12 = (void *)MEMORY[0x22A61F6E0]();
  [v11 filterUsingPredicate:v9];
  v13 = objc_alloc_init(SHMediaLibrarySnapshot);
  v14 = (void *)[v11 copy];
  [(SHMediaLibrarySnapshot *)v13 addChanges:v14];

  return v13;
}

uint64_t __61__SHMediaLibrarySnapshot_remapSnapshot_withBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 libraryItem];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = [v3 libraryItem];
    uint64_t v7 = [v6 providerIdentifier];
    uint64_t v8 = [v7 isEqualToString:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)removeSnapshot:(id)a3
{
  id v4 = a3;
  id v7 = [(SHMediaLibrarySnapshot *)self changeset];
  id v5 = [v4 changeset];

  id v6 = (void *)[v5 copy];
  [v7 minusOrderedSet:v6];
}

- (id)filteredSnapshotUsingPredicate:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x22A61F6E0]();
  id v6 = [(SHMediaLibrarySnapshot *)self changeset];
  id v7 = [v6 filteredOrderedSetUsingPredicate:v4];

  uint64_t v8 = [[SHMediaLibrarySnapshot alloc] initWithChanges:v7];

  return v8;
}

- (SHMediaLibrarySnapshot)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SHMediaLibrarySnapshot;
  id v5 = [(SHMediaLibrarySnapshot *)&v14 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x22A61F6E0]();
    id v7 = (void *)MEMORY[0x263EFFA08];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"SHLibraryDifferenceCodingChanges"];
    uint64_t v11 = [v10 mutableCopy];
    changeset = v5->_changeset;
    v5->_changeset = (NSMutableOrderedSet *)v11;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = (void *)MEMORY[0x22A61F6E0]();
  [v5 encodeObject:self->_changeset forKey:@"SHLibraryDifferenceCodingChanges"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = +[SHMediaLibrarySnapshot allocWithZone:](SHMediaLibrarySnapshot, "allocWithZone:");
  id v6 = [(SHMediaLibrarySnapshot *)self changeset];
  id v7 = (void *)[v6 copyWithZone:a3];
  uint64_t v8 = [(SHMediaLibrarySnapshot *)v5 initWithChanges:v7];

  return v8;
}

- (id)description
{
  v2 = NSString;
  id v3 = [(SHMediaLibrarySnapshot *)self changes];
  id v4 = objc_msgSend(v2, "stringWithFormat:", @"SNAPSHOT: %lu", objc_msgSend(v3, "count"));

  return v4;
}

- (NSMutableOrderedSet)changeset
{
  return self->_changeset;
}

- (void)setChangeset:(id)a3
{
}

- (void).cxx_destruct
{
}

@end