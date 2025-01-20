@interface _EMSectionedMessageListItemID
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isKindOfClass:(Class)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (EMCollectionItemID)underlyingItemID;
- (NSObject)sectionID;
- (NSString)description;
- (_EMSectionedMessageListItemID)initWithCoder:(id)a3;
- (_EMSectionedMessageListItemID)initWithItemID:(id)a3 sectionID:(id)a4;
- (id)cachedSelf;
- (id)forwardingTargetForSelector:(SEL)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _EMSectionedMessageListItemID

- (id)cachedSelf
{
  if (cachedSelf_onceToken_4 != -1) {
    dispatch_once(&cachedSelf_onceToken_4, &__block_literal_global_49);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&cachedSelf_sTableLock_4);
  v3 = objc_msgSend((id)cachedSelf_sUniqueObjectIDs_4, "ef_uniquedObject:", self);
  os_unfair_lock_unlock((os_unfair_lock_t)&cachedSelf_sTableLock_4);
  return v3;
}

- (_EMSectionedMessageListItemID)initWithItemID:(id)a3 sectionID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_EMSectionedMessageListItemID;
  v9 = [(_EMSectionedMessageListItemID *)&v14 init];
  v10 = v9;
  v11 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sectionID, a4);
    objc_storeStrong((id *)&v10->_underlyingItemID, a3);
  }
  v12 = [(_EMSectionedMessageListItemID *)v11 cachedSelf];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_EMSectionedMessageListItemID *)a3;
  if (v4 == self)
  {
    char v10 = 1;
  }
  else if ([(_EMSectionedMessageListItemID *)v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = v4;
    v6 = [(_EMSectionedMessageListItemID *)self sectionID];
    id v7 = [(_EMSectionedMessageListItemID *)v5 sectionID];
    if ([v6 isEqual:v7])
    {
      id v8 = [(_EMSectionedMessageListItemID *)self underlyingItemID];
      v9 = [(_EMSectionedMessageListItemID *)v5 underlyingItemID];
      char v10 = [v8 isEqual:v9];
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  v3 = [(_EMSectionedMessageListItemID *)self sectionID];
  uint64_t v4 = [v3 hash];

  v5 = [(_EMSectionedMessageListItemID *)self underlyingItemID];
  unint64_t v6 = 33 * v4 + [v5 hash] + 1089;

  return v6;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = [(_EMSectionedMessageListItemID *)self sectionID];
  v5 = [(_EMSectionedMessageListItemID *)self underlyingItemID];
  unint64_t v6 = (void *)[v3 initWithFormat:@"SectionID:%@ %@", v4, v5];

  return (NSString *)v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_EMSectionedMessageListItemID)initWithCoder:(id)a3
{
  id v8 = a3;
  id v3 = v8;
  uint64_t v4 = self;
  EFDecodeCacheableInstance();
  v5 = (_EMSectionedMessageListItemID *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  EFEncodeCacheableInstance();
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v5 = [(_EMSectionedMessageListItemID *)self underlyingItemID];
  if (objc_opt_respondsToSelector())
  {
    BOOL v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)_EMSectionedMessageListItemID;
    BOOL v6 = [(_EMSectionedMessageListItemID *)&v8 respondsToSelector:a3];
  }

  return v6;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  id v4 = [(_EMSectionedMessageListItemID *)self underlyingItemID];
  if (objc_opt_respondsToSelector()) {
    v5 = v4;
  }
  else {
    v5 = self;
  }
  BOOL v6 = v5;

  return v6;
}

- (BOOL)isKindOfClass:(Class)a3
{
  v5 = [(_EMSectionedMessageListItemID *)self underlyingItemID];
  if (objc_opt_isKindOfClass())
  {
    BOOL v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)_EMSectionedMessageListItemID;
    BOOL v6 = [(_EMSectionedMessageListItemID *)&v8 isKindOfClass:a3];
  }

  return v6;
}

- (NSObject)sectionID
{
  return self->_sectionID;
}

- (EMCollectionItemID)underlyingItemID
{
  return self->_underlyingItemID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingItemID, 0);
  objc_storeStrong((id *)&self->_sectionID, 0);
}

@end