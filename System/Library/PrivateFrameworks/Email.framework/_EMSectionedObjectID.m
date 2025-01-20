@interface _EMSectionedObjectID
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isKindOfClass:(Class)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (EMObjectID)underlyingObjectID;
- (NSObject)sectionID;
- (_EMSectionedObjectID)initWithCoder:(id)a3;
- (_EMSectionedObjectID)initWithObjectID:(id)a3 sectionID:(id)a4;
- (id)cachedSelf;
- (id)collectionItemID;
- (id)forwardingTargetForSelector:(SEL)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _EMSectionedObjectID

- (id)cachedSelf
{
  if (cachedSelf_onceToken_44 != -1) {
    dispatch_once(&cachedSelf_onceToken_44, &__block_literal_global_46);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&cachedSelf_sTableLock_42);
  v3 = objc_msgSend((id)cachedSelf_sUniqueObjectIDs_43, "ef_uniquedObject:", self);
  os_unfair_lock_unlock((os_unfair_lock_t)&cachedSelf_sTableLock_42);
  return v3;
}

- (_EMSectionedObjectID)initWithObjectID:(id)a3 sectionID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_EMSectionedObjectID;
  v9 = [(EMObjectID *)&v14 initAsEphemeralID:0];
  v10 = v9;
  v11 = v9;
  if (v9)
  {
    objc_storeStrong(v9 + 5, a4);
    objc_storeStrong(v10 + 6, a3);
  }
  v12 = [v11 cachedSelf];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_EMSectionedObjectID *)a3;
  if (v4 == self)
  {
    char v10 = 1;
  }
  else if ([(_EMSectionedObjectID *)v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = v4;
    v6 = [(_EMSectionedObjectID *)self sectionID];
    id v7 = [(_EMSectionedObjectID *)v5 sectionID];
    if ([v6 isEqual:v7])
    {
      id v8 = [(_EMSectionedObjectID *)self underlyingObjectID];
      v9 = [(_EMSectionedObjectID *)v5 underlyingObjectID];
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
  v3 = [(_EMSectionedObjectID *)self sectionID];
  uint64_t v4 = [v3 hash];

  v5 = [(_EMSectionedObjectID *)self underlyingObjectID];
  unint64_t v6 = 33 * v4 + [v5 hash] + 1089;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_EMSectionedObjectID)initWithCoder:(id)a3
{
  id v8 = a3;
  v9 = self;
  uint64_t v4 = self;
  id v5 = v8;
  EFDecodeCacheableInstance();
  unint64_t v6 = (_EMSectionedObjectID *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  EFEncodeCacheableInstance();
}

- (BOOL)respondsToSelector:(SEL)a3
{
  id v5 = [(_EMSectionedObjectID *)self underlyingObjectID];
  if (objc_opt_respondsToSelector())
  {
    BOOL v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)_EMSectionedObjectID;
    BOOL v6 = [(_EMSectionedObjectID *)&v8 respondsToSelector:a3];
  }

  return v6;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  id v4 = [(_EMSectionedObjectID *)self underlyingObjectID];
  if (objc_opt_respondsToSelector()) {
    id v5 = v4;
  }
  else {
    id v5 = self;
  }
  BOOL v6 = v5;

  return v6;
}

- (BOOL)isKindOfClass:(Class)a3
{
  id v5 = [(_EMSectionedObjectID *)self underlyingObjectID];
  if (objc_opt_isKindOfClass())
  {
    BOOL v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)_EMSectionedObjectID;
    BOOL v6 = [(_EMSectionedObjectID *)&v8 isKindOfClass:a3];
  }

  return v6;
}

- (id)collectionItemID
{
  id v3 = [(_EMSectionedObjectID *)self underlyingObjectID];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(_EMSectionedObjectID *)self underlyingObjectID];
    BOOL v6 = [v5 collectionItemID];
    id v7 = [(_EMSectionedObjectID *)self sectionID];
    objc_super v8 = +[EMSectionedMessageListObjectConverter itemIDForItemID:v6 inSection:v7];
  }
  else
  {
    objc_super v8 = 0;
  }
  return v8;
}

- (NSObject)sectionID
{
  return self->_sectionID;
}

- (EMObjectID)underlyingObjectID
{
  return self->_underlyingObjectID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingObjectID, 0);
  objc_storeStrong((id *)&self->_sectionID, 0);
}

@end