@interface _EMSpecialMailboxScope
+ (BOOL)supportsSecureCoding;
- (BOOL)excludeMailboxes;
- (BOOL)excludeTypes;
- (BOOL)isEqual:(id)a3;
- (BOOL)scopeContainsMailbox:(id)a3;
- (BOOL)scopeContainsMailboxObjectID:(id)a3 mailboxTypeResolver:(id)a4;
- (NSString)identifier;
- (_EMSpecialMailboxScope)initWithCoder:(id)a3;
- (_EMSpecialMailboxScope)initWithIdentifier:(id)a3;
- (id)allMailboxObjectIDsWithMailboxTypeResolver:(id)a3 forExclusion:(BOOL *)a4;
- (id)cachedSelf;
- (id)ef_publicDescription;
- (id)mailboxObjectIDs;
- (id)mailboxScopeByAddingMailboxes:(id)a3;
- (id)mailboxScopeByRemovingMailboxes:(id)a3;
- (id)mailboxTypes;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _EMSpecialMailboxScope

- (unint64_t)hash
{
  v2 = [(_EMSpecialMailboxScope *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)mailboxTypes
{
  return 0;
}

- (id)mailboxObjectIDs
{
  return 0;
}

- (BOOL)excludeTypes
{
  return 0;
}

- (BOOL)excludeMailboxes
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)ef_publicDescription
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(_EMSpecialMailboxScope *)self identifier];
  v6 = [v3 stringWithFormat:@"<%@: %p> %@", v4, self, v5];

  return v6;
}

- (void).cxx_destruct
{
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  EFEncodeCacheableInstance();
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_EMSpecialMailboxScope *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(_EMSpecialMailboxScope *)self identifier];
      v6 = [(_EMSpecialMailboxScope *)v4 identifier];
      char v7 = [v5 isEqualToString:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (_EMSpecialMailboxScope)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_EMSpecialMailboxScope;
  v5 = [(EMMailboxScope *)&v10 initWithMailboxTypes:0 excludeTypes:0 mailboxObjectIDs:0 excludeMailboxes:0 cached:0];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;
  }
  v8 = [(_EMSpecialMailboxScope *)v5 cachedSelf];

  return v8;
}

- (id)cachedSelf
{
  if (cachedSelf_onceToken_54 != -1) {
    dispatch_once(&cachedSelf_onceToken_54, &__block_literal_global_56);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&cachedSelf_sTableLock_52);
  id v3 = objc_msgSend((id)cachedSelf_sUniqueObjectIDs_53, "ef_uniquedObject:", self);
  os_unfair_lock_unlock((os_unfair_lock_t)&cachedSelf_sTableLock_52);
  return v3;
}

- (_EMSpecialMailboxScope)initWithCoder:(id)a3
{
  id v8 = a3;
  v9 = self;
  id v4 = self;
  id v5 = v8;
  EFDecodeCacheableInstance();
  uint64_t v6 = (_EMSpecialMailboxScope *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)mailboxScopeByAddingMailboxes:(id)a3
{
  id v4 = a3;
  id v5 = [(_EMSpecialMailboxScope *)self identifier];
  int v6 = [v5 isEqualToString:@"AllMailboxes"];

  if (v6)
  {
    char v7 = self;
  }
  else
  {
    id v8 = objc_msgSend(v4, "ef_mapSelector:", sel_objectID);
    char v7 = +[EMMailboxScope mailboxScopeForMailboxObjectIDs:v8 forExclusion:0];
  }
  return v7;
}

- (id)mailboxScopeByRemovingMailboxes:(id)a3
{
  id v4 = a3;
  id v5 = [(_EMSpecialMailboxScope *)self identifier];
  int v6 = [v5 isEqualToString:@"AllMailboxes"];

  if (v6)
  {
    char v7 = objc_msgSend(v4, "ef_mapSelector:", sel_objectID);
    id v8 = +[EMMailboxScope mailboxScopeForMailboxObjectIDs:v7 forExclusion:1];
  }
  else
  {
    id v8 = self;
  }

  return v8;
}

- (id)allMailboxObjectIDsWithMailboxTypeResolver:(id)a3 forExclusion:(BOOL *)a4
{
  id v6 = a3;
  *a4 = 0;
  char v7 = [(_EMSpecialMailboxScope *)self identifier];
  LODWORD(self) = [v7 isEqualToString:@"AllMailboxes"];

  if (self)
  {
    id v8 = [v6 allMailboxObjectIDs];
  }
  else
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  }
  v9 = v8;

  return v9;
}

- (BOOL)scopeContainsMailbox:(id)a3
{
  id v3 = [(_EMSpecialMailboxScope *)self identifier];
  char v4 = [v3 isEqualToString:@"AllMailboxes"];

  return v4;
}

- (BOOL)scopeContainsMailboxObjectID:(id)a3 mailboxTypeResolver:(id)a4
{
  char v4 = [(_EMSpecialMailboxScope *)self identifier];
  char v5 = [v4 isEqualToString:@"AllMailboxes"];

  return v5;
}

@end