@interface EMMailboxScope
+ (BOOL)supportsSecureCoding;
+ (EMMailboxScope)allMailboxesScope;
+ (EMMailboxScope)noMailboxesScope;
+ (id)mailboxScopeForMailboxObjectIDs:(id)a3 forExclusion:(BOOL)a4;
+ (id)mailboxScopeForMailboxType:(int64_t)a3 forExclusion:(BOOL)a4;
+ (id)mailboxScopeForMailboxTypes:(id)a3 forExclusion:(BOOL)a4;
- (BOOL)_scopeContainsMailboxWithObjectID:(id)a3 mailboxTypeBlock:(id)a4;
- (BOOL)containsOnlyInboxType;
- (BOOL)excludeMailboxes;
- (BOOL)excludeTypes;
- (BOOL)isEqual:(id)a3;
- (BOOL)scopeContainsMailbox:(id)a3;
- (BOOL)scopeContainsMailboxObjectID:(id)a3 mailboxTypeResolver:(id)a4;
- (EMMailboxScope)init;
- (EMMailboxScope)initWithCoder:(id)a3;
- (EMMailboxScope)initWithMailboxTypes:(id)a3 excludeTypes:(BOOL)a4 mailboxObjectIDs:(id)a5 excludeMailboxes:(BOOL)a6;
- (EMMailboxScope)initWithMailboxTypes:(id)a3 excludeTypes:(BOOL)a4 mailboxObjectIDs:(id)a5 excludeMailboxes:(BOOL)a6 cached:(BOOL)a7;
- (NSSet)mailboxObjectIDs;
- (NSSet)mailboxTypes;
- (NSString)debugDescription;
- (NSString)ef_publicDescription;
- (id)_mailboxObjectIDsDescription;
- (id)_mailboxObjectIDsForTypesWithMailboxTypeResolver:(id)a3;
- (id)_mailboxTypesDescription;
- (id)allMailboxObjectIDsWithMailboxTypeResolver:(id)a3 forExclusion:(BOOL *)a4;
- (id)cachedSelf;
- (id)mailboxScopeByAddingMailboxes:(id)a3;
- (id)mailboxScopeByRemovingMailboxes:(id)a3;
- (unint64_t)hash;
- (void)_calculateHash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation EMMailboxScope

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailboxObjectIDs, 0);
  objc_storeStrong((id *)&self->_mailboxTypes, 0);
}

- (unint64_t)hash
{
  return self->_hash;
}

+ (EMMailboxScope)noMailboxesScope
{
  if (noMailboxesScope_onceToken != -1) {
    dispatch_once(&noMailboxesScope_onceToken, &__block_literal_global_61);
  }
  v2 = (void *)noMailboxesScope_sMailboxScope;
  return (EMMailboxScope *)v2;
}

+ (EMMailboxScope)allMailboxesScope
{
  if (allMailboxesScope_onceToken != -1) {
    dispatch_once(&allMailboxesScope_onceToken, &__block_literal_global_58);
  }
  v2 = (void *)allMailboxesScope_sMailboxScope;
  return (EMMailboxScope *)v2;
}

- (EMMailboxScope)initWithMailboxTypes:(id)a3 excludeTypes:(BOOL)a4 mailboxObjectIDs:(id)a5 excludeMailboxes:(BOOL)a6 cached:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a5;
  v22.receiver = self;
  v22.super_class = (Class)EMMailboxScope;
  v14 = [(EMMailboxScope *)&v22 init];
  if (v14)
  {
    if ([v12 count])
    {
      uint64_t v15 = [v12 copy];
      mailboxTypes = v14->_mailboxTypes;
      v14->_mailboxTypes = (NSSet *)v15;
    }
    else
    {
      a4 = 0;
      mailboxTypes = v14->_mailboxTypes;
      v14->_mailboxTypes = 0;
    }

    v14->_excludeTypes = a4;
    if ([v13 count])
    {
      uint64_t v17 = [v13 copy];
      mailboxObjectIDs = v14->_mailboxObjectIDs;
      v14->_mailboxObjectIDs = (NSSet *)v17;
    }
    else
    {
      a6 = 0;
      mailboxObjectIDs = v14->_mailboxObjectIDs;
      v14->_mailboxObjectIDs = 0;
    }

    v14->_excludeMailboxes = a6;
    [(EMMailboxScope *)v14 _calculateHash];
  }
  if (v7)
  {
    v19 = [(EMMailboxScope *)v14 cachedSelf];
  }
  else
  {
    v19 = v14;
  }
  v20 = v19;

  return v20;
}

- (void)_calculateHash
{
  v11 = self->_mailboxTypes;
  v3 = self->_mailboxObjectIDs;
  uint64_t v4 = [(NSSet *)v11 count];
  v5 = v11;
  if (v4 == 1)
  {
    v5 = [(NSSet *)v11 anyObject];
  }
  uint64_t v6 = [v5 hash];
  if (v4 == 1) {

  }
  BOOL excludeTypes = self->_excludeTypes;
  uint64_t v8 = [(NSSet *)v3 count];
  v9 = v3;
  if (v8 == 1)
  {
    v9 = [(NSSet *)v3 anyObject];
  }
  uint64_t v10 = [v9 hash];
  if (v8 == 1) {

  }
  self->_hash = 33 * (33 * (33 * v6 + excludeTypes) + v10) + self->_excludeMailboxes + 1185921;
}

- (id)cachedSelf
{
  if (cachedSelf_onceToken_1 != -1) {
    dispatch_once(&cachedSelf_onceToken_1, &__block_literal_global_29);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&cachedSelf_sTableLock_1);
  v3 = objc_msgSend((id)cachedSelf_sUniqueObjectIDs_1, "ef_uniquedObject:", self);
  os_unfair_lock_unlock((os_unfair_lock_t)&cachedSelf_sTableLock_1);
  return v3;
}

+ (id)mailboxScopeForMailboxObjectIDs:(id)a3 forExclusion:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v5];
  BOOL v7 = [[EMMailboxScope alloc] initWithMailboxTypes:0 excludeTypes:0 mailboxObjectIDs:v6 excludeMailboxes:v4];

  return v7;
}

- (EMMailboxScope)initWithMailboxTypes:(id)a3 excludeTypes:(BOOL)a4 mailboxObjectIDs:(id)a5 excludeMailboxes:(BOOL)a6
{
  return [(EMMailboxScope *)self initWithMailboxTypes:a3 excludeTypes:a4 mailboxObjectIDs:a5 excludeMailboxes:a6 cached:1];
}

+ (id)mailboxScopeForMailboxTypes:(id)a3 forExclusion:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v5];
  BOOL v7 = [[EMMailboxScope alloc] initWithMailboxTypes:v6 excludeTypes:v4 mailboxObjectIDs:0 excludeMailboxes:0];

  return v7;
}

- (BOOL)scopeContainsMailboxObjectID:(id)a3 mailboxTypeResolver:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v6;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __67__EMMailboxScope_scopeContainsMailboxObjectID_mailboxTypeResolver___block_invoke;
    v11[3] = &unk_1E63E4578;
    id v12 = v7;
    id v13 = v8;
    BOOL v9 = [(EMMailboxScope *)self _scopeContainsMailboxWithObjectID:v8 mailboxTypeBlock:v11];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)_scopeContainsMailboxWithObjectID:(id)a3 mailboxTypeBlock:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  id v8 = [(EMMailboxScope *)self mailboxObjectIDs];
  uint64_t v9 = [(EMMailboxScope *)self mailboxTypes];
  uint64_t v10 = (void *)v9;
  if (!v8)
  {
    if (!v9)
    {
      LOBYTE(self) = 0;
      goto LABEL_9;
    }
LABEL_7:
    BOOL v11 = [(EMMailboxScope *)self excludeTypes];
    id v12 = [(EMMailboxScope *)self mailboxTypes];
    id v13 = v7[2](v7);
    LODWORD(self) = v11 ^ [v12 containsObject:v13];

    goto LABEL_9;
  }
  if (![v8 containsObject:v6])
  {
    if (!v10)
    {
      LOBYTE(self) = [(EMMailboxScope *)self excludeMailboxes];
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  LODWORD(self) = ![(EMMailboxScope *)self excludeMailboxes];
LABEL_9:

  return (char)self;
}

- (id)allMailboxObjectIDsWithMailboxTypeResolver:(id)a3 forExclusion:(BOOL *)a4
{
  id v6 = a3;
  int v7 = [(EMMailboxScope *)self excludeTypes];
  int v8 = [(EMMailboxScope *)self excludeMailboxes];
  if (v7 == v8)
  {
    uint64_t v9 = [(EMMailboxScope *)self _mailboxObjectIDsForTypesWithMailboxTypeResolver:v6];
    if (v9)
    {
      id v14 = objc_alloc(MEMORY[0x1E4F1CAD0]);
      uint64_t v15 = [(EMMailboxScope *)self mailboxObjectIDs];
      v16 = objc_msgSend(v14, "initWithObjects:", v9, v15, 0);

      objc_msgSend(v16, "ef_flatten");
      id v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v13 = [(EMMailboxScope *)self mailboxObjectIDs];
    }
    *a4 = v8;
  }
  else
  {
    uint64_t v9 = [(EMMailboxScope *)self mailboxObjectIDs];
    if (v9)
    {
      uint64_t v10 = [(EMMailboxScope *)self _mailboxObjectIDsForTypesWithMailboxTypeResolver:v6];
      BOOL v11 = v10;
      if (v10) {
        int v12 = v8;
      }
      else {
        int v12 = 0;
      }
      if (v12 == 1)
      {
        id v13 = (id)[v10 mutableCopy];
        [v13 minusSet:v9];
        LOBYTE(v8) = 0;
      }
      else
      {
        id v13 = v9;
      }
      *a4 = v8;
    }
    else
    {
      id v13 = [(EMMailboxScope *)self _mailboxObjectIDsForTypesWithMailboxTypeResolver:v6];
      *a4 = v7;
    }
  }

  if ([v13 count]) {
    id v17 = v13;
  }
  else {
    id v17 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  }
  v18 = v17;

  return v18;
}

- (id)_mailboxObjectIDsForTypesWithMailboxTypeResolver:(id)a3
{
  id v4 = a3;
  id v5 = [(EMMailboxScope *)self mailboxTypes];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__EMMailboxScope__mailboxObjectIDsForTypesWithMailboxTypeResolver___block_invoke;
  v10[3] = &unk_1E63E4528;
  id v6 = v4;
  id v11 = v6;
  int v7 = objc_msgSend(v5, "ef_compactMap:", v10);
  int v8 = objc_msgSend(v7, "ef_flatten");

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(EMMailboxScope *)self mailboxTypes];
  id v6 = [v5 allObjects];
  int v7 = [v6 sortedArrayUsingSelector:sel_compare_];

  [v4 encodeObject:v7 forKey:@"mailboxTypes"];
  objc_msgSend(v4, "encodeBool:forKey:", -[EMMailboxScope excludeTypes](self, "excludeTypes"), @"EFPropertyKey_excludeTypes");
  int v8 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"url.absoluteString" ascending:1];
  uint64_t v9 = [(EMMailboxScope *)self mailboxObjectIDs];
  v12[0] = v8;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  id v11 = [v9 sortedArrayUsingDescriptors:v10];

  [v4 encodeObject:v11 forKey:@"mailboxObjectIDs"];
  objc_msgSend(v4, "encodeBool:forKey:", -[EMMailboxScope excludeMailboxes](self, "excludeMailboxes"), @"EFPropertyKey_excludeMailboxes");
}

- (NSString)ef_publicDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(EMMailboxScope *)self _mailboxTypesDescription];
  uint64_t v6 = [(EMMailboxScope *)self _mailboxObjectIDsDescription];
  int v7 = (void *)v6;
  int v8 = &stru_1F1A3DFB0;
  if (v5) {
    uint64_t v9 = v5;
  }
  else {
    uint64_t v9 = &stru_1F1A3DFB0;
  }
  if (v6) {
    int v8 = (__CFString *)v6;
  }
  uint64_t v10 = [v3 stringWithFormat:@"%@:%@%@", v4, v9, v8];

  return (NSString *)v10;
}

- (id)_mailboxTypesDescription
{
  v3 = [(EMMailboxScope *)self mailboxTypes];
  uint64_t v4 = objc_msgSend(v3, "ef_compactMap:", &__block_literal_global_77);
  id v5 = [v4 allObjects];
  uint64_t v6 = [v5 componentsJoinedByString:@", "];

  if ([v6 length])
  {
    if ([(EMMailboxScope *)self excludeTypes])
    {
      id v7 = [NSString alloc];
      int v8 = @" excluding types: [%@]";
    }
    else
    {
      id v7 = [NSString alloc];
      int v8 = @" including types: [%@]";
    }
    uint64_t v9 = objc_msgSend(v7, "initWithFormat:", v8, v6);
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)_mailboxObjectIDsDescription
{
  v3 = NSString;
  if ([(EMMailboxScope *)self excludeMailboxes]) {
    uint64_t v4 = @"excluding";
  }
  else {
    uint64_t v4 = @"including";
  }
  id v5 = [(EMMailboxScope *)self mailboxObjectIDs];
  uint64_t v6 = [v5 count];
  id v7 = [(EMMailboxScope *)self mailboxObjectIDs];
  int v8 = [v3 stringWithFormat:@" %@ mailboxes: %ld <%p>", v4, v6, objc_msgSend(v7, "hash")];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (EMMailboxScope *)a3;
  if (v4 == self)
  {
    LOBYTE(v9) = 1;
  }
  else if ([(EMMailboxScope *)v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    uint64_t v6 = [(EMMailboxScope *)self mailboxTypes];
    id v7 = [(EMMailboxScope *)v5 mailboxTypes];
    if (EFSetsAreEqual()
      && (BOOL v8 = [(EMMailboxScope *)self excludeTypes],
          v8 == [(EMMailboxScope *)v5 excludeTypes]))
    {
      uint64_t v10 = [(EMMailboxScope *)self mailboxObjectIDs];
      id v11 = [(EMMailboxScope *)v5 mailboxObjectIDs];
      if (EFSetsAreEqual())
      {
        BOOL v12 = [(EMMailboxScope *)self excludeMailboxes];
        BOOL v9 = v12 ^ [(EMMailboxScope *)v5 excludeMailboxes] ^ 1;
      }
      else
      {
        LOBYTE(v9) = 0;
      }
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (NSSet)mailboxTypes
{
  return self->_mailboxTypes;
}

- (NSSet)mailboxObjectIDs
{
  return self->_mailboxObjectIDs;
}

- (BOOL)excludeTypes
{
  return self->_excludeTypes;
}

- (BOOL)excludeMailboxes
{
  return self->_excludeMailboxes;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __41__EMMailboxScope_EFCacheable__cachedSelf__block_invoke()
{
  cachedSelf_sTableLock_1 = 0;
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:5 capacity:0];
  v1 = (void *)cachedSelf_sUniqueObjectIDs_1;
  cachedSelf_sUniqueObjectIDs_1 = v0;
}

- (EMMailboxScope)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)EMMailboxScope;
  id v5 = [(EMMailboxScope *)&v20 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    BOOL v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    BOOL v9 = [v4 decodeObjectOfClasses:v8 forKey:@"mailboxTypes"];

    if (v9)
    {
      uint64_t v10 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v9];
      mailboxTypes = v5->_mailboxTypes;
      v5->_mailboxTypes = (NSSet *)v10;
    }
    v5->_BOOL excludeTypes = [v4 decodeBoolForKey:@"EFPropertyKey_excludeTypes"];
    BOOL v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    id v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"mailboxObjectIDs"];

    if (v15)
    {
      uint64_t v16 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v15];
      mailboxObjectIDs = v5->_mailboxObjectIDs;
      v5->_mailboxObjectIDs = (NSSet *)v16;
    }
    v5->_excludeMailboxes = [v4 decodeBoolForKey:@"EFPropertyKey_excludeMailboxes"];
    [(EMMailboxScope *)v5 _calculateHash];
  }
  v18 = [(EMMailboxScope *)v5 cachedSelf];

  return v18;
}

void __35__EMMailboxScope_allMailboxesScope__block_invoke()
{
  uint64_t v0 = [[_EMSpecialMailboxScope alloc] initWithIdentifier:@"AllMailboxes"];
  v1 = (void *)allMailboxesScope_sMailboxScope;
  allMailboxesScope_sMailboxScope = (uint64_t)v0;
}

void __34__EMMailboxScope_noMailboxesScope__block_invoke()
{
  uint64_t v0 = [[_EMSpecialMailboxScope alloc] initWithIdentifier:@"NoMailboxes"];
  v1 = (void *)noMailboxesScope_sMailboxScope;
  noMailboxesScope_sMailboxScope = (uint64_t)v0;
}

+ (id)mailboxScopeForMailboxType:(int64_t)a3 forExclusion:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v7 = [NSNumber numberWithInteger:a3];
  BOOL v8 = objc_msgSend(v6, "initWithObjects:", v7, 0);

  BOOL v9 = [[EMMailboxScope alloc] initWithMailboxTypes:v8 excludeTypes:v4 mailboxObjectIDs:0 excludeMailboxes:0];
  return v9;
}

- (EMMailboxScope)init
{
}

- (NSString)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(EMMailboxScope *)self _mailboxTypesDescription];
  uint64_t v6 = [(EMMailboxScope *)self _mailboxObjectIDsDescription];
  uint64_t v7 = (void *)v6;
  BOOL v8 = &stru_1F1A3DFB0;
  if (v5) {
    BOOL v9 = v5;
  }
  else {
    BOOL v9 = &stru_1F1A3DFB0;
  }
  if (v6) {
    BOOL v8 = (__CFString *)v6;
  }
  uint64_t v10 = [v3 stringWithFormat:@"%@:%@%@", v4, v9, v8];

  return (NSString *)v10;
}

id __42__EMMailboxScope__mailboxTypesDescription__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 integerValue];
  v3 = ECNSStringFromMailboxMailboxType();

  return v3;
}

- (id)mailboxScopeByAddingMailboxes:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  uint64_t v4 = [(EMMailboxScope *)self mailboxObjectIDs];
  objc_super v22 = (void *)[v4 mutableCopy];

  v21 = self;
  if ([(EMMailboxScope *)self excludeMailboxes])
  {
    id v5 = objc_msgSend(v20, "ef_mapSelector:", sel_objectID);
    objc_msgSend(v22, "ef_removeObjectsInArray:", v5);

    goto LABEL_16;
  }
  BOOL v6 = [(EMMailboxScope *)self excludeTypes];
  uint64_t v7 = [(EMMailboxScope *)self mailboxTypes];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = v20;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (!v9) {
    goto LABEL_15;
  }
  uint64_t v10 = *(void *)v24;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v24 != v10) {
        objc_enumerationMutation(v8);
      }
      BOOL v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
      uint64_t v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v12, "type"));
      int v14 = [v7 containsObject:v13];

      if (v14)
      {
        if (!v6) {
          continue;
        }
      }
      else if (v6)
      {
        continue;
      }
      uint64_t v15 = [v12 objectID];
      [v22 addObject:v15];
    }
    uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
  }
  while (v9);
LABEL_15:

LABEL_16:
  uint64_t v16 = [EMMailboxScope alloc];
  id v17 = [(EMMailboxScope *)v21 mailboxTypes];
  v18 = [(EMMailboxScope *)v16 initWithMailboxTypes:v17 excludeTypes:[(EMMailboxScope *)v21 excludeTypes] mailboxObjectIDs:v22 excludeMailboxes:[(EMMailboxScope *)v21 excludeMailboxes]];

  return v18;
}

- (id)mailboxScopeByRemovingMailboxes:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  uint64_t v4 = [(EMMailboxScope *)self mailboxObjectIDs];
  objc_super v22 = (void *)[v4 mutableCopy];

  v21 = self;
  if ([(EMMailboxScope *)self excludeMailboxes])
  {
    BOOL v5 = [(EMMailboxScope *)self excludeTypes];
    BOOL v6 = [(EMMailboxScope *)self mailboxTypes];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v7 = v20;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (!v8) {
      goto LABEL_14;
    }
    uint64_t v9 = *(void *)v24;
    while (1)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        BOOL v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v11, "type"));
        int v13 = [v6 containsObject:v12];

        if (v13)
        {
          if (v5) {
            continue;
          }
        }
        else if (!v5)
        {
          continue;
        }
        int v14 = [v11 objectID];
        [v22 addObject:v14];
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (!v8)
      {
LABEL_14:

        goto LABEL_16;
      }
    }
  }
  uint64_t v15 = objc_msgSend(v20, "ef_mapSelector:", sel_objectID);
  objc_msgSend(v22, "ef_removeObjectsInArray:", v15);

LABEL_16:
  uint64_t v16 = [EMMailboxScope alloc];
  id v17 = [(EMMailboxScope *)v21 mailboxTypes];
  v18 = [(EMMailboxScope *)v16 initWithMailboxTypes:v17 excludeTypes:[(EMMailboxScope *)v21 excludeTypes] mailboxObjectIDs:v22 excludeMailboxes:[(EMMailboxScope *)v21 excludeMailboxes]];

  return v18;
}

id __67__EMMailboxScope__mailboxObjectIDsForTypesWithMailboxTypeResolver___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "mailboxObjectIDsForMailboxType:", objc_msgSend(v3, "integerValue"));

  return v4;
}

- (BOOL)scopeContainsMailbox:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 objectID];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__EMMailboxScope_scopeContainsMailbox___block_invoke;
  v8[3] = &unk_1E63E4550;
  id v6 = v4;
  id v9 = v6;
  LOBYTE(self) = [(EMMailboxScope *)self _scopeContainsMailboxWithObjectID:v5 mailboxTypeBlock:v8];

  return (char)self;
}

uint64_t __39__EMMailboxScope_scopeContainsMailbox___block_invoke(uint64_t a1)
{
  v1 = NSNumber;
  uint64_t v2 = [*(id *)(a1 + 32) type];
  return [v1 numberWithInteger:v2];
}

uint64_t __67__EMMailboxScope_scopeContainsMailboxObjectID_mailboxTypeResolver___block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) mailboxTypeForMailboxObjectID:*(void *)(a1 + 40)];
  uint64_t v2 = NSNumber;
  return [v2 numberWithInteger:v1];
}

- (BOOL)containsOnlyInboxType
{
  if ([(EMMailboxScope *)self excludeTypes]) {
    return 0;
  }
  id v4 = [(EMMailboxScope *)self mailboxTypes];
  if ([v4 count] == 1)
  {
    BOOL v5 = [(EMMailboxScope *)self mailboxTypes];
    id v6 = [v5 anyObject];
    BOOL v3 = [v6 integerValue] == 7;
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

@end