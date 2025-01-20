@interface _EMSectionedMessageListItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isKindOfClass:(Class)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (EFFuture)displayMessage;
- (EMCollectionItemID)displayMessageItemID;
- (EMCollectionItemID)itemID;
- (EMMessageListItem)underlyingItem;
- (EMObjectID)displayMessageObjectID;
- (EMObjectID)objectID;
- (NSObject)sectionID;
- (_EMSectionedMessageListItem)initWithCoder:(id)a3;
- (_EMSectionedMessageListItem)initWithMessageListItem:(id)a3 sectionID:(id)a4;
- (id)cachedSelf;
- (id)changeFrom:(id)a3;
- (id)forwardingTargetForSelector:(SEL)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _EMSectionedMessageListItem

- (id)cachedSelf
{
  if (cachedSelf_onceToken_49 != -1) {
    dispatch_once(&cachedSelf_onceToken_49, &__block_literal_global_51_0);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&cachedSelf_sTableLock_47);
  v3 = objc_msgSend((id)cachedSelf_sUniqueObjectIDs_48, "ef_uniquedObject:", self);
  os_unfair_lock_unlock((os_unfair_lock_t)&cachedSelf_sTableLock_47);
  return v3;
}

- (_EMSectionedMessageListItem)initWithMessageListItem:(id)a3 sectionID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_EMSectionedMessageListItem;
  v9 = [(_EMSectionedMessageListItem *)&v14 init];
  v10 = v9;
  v11 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sectionID, a4);
    objc_storeStrong((id *)&v10->_underlyingItem, a3);
  }
  v12 = [(_EMSectionedMessageListItem *)v11 cachedSelf];

  return v12;
}

- (id)changeFrom:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"EMSectionedMessageListObjectConverter.m" lineNumber:308 description:@"Not supported"];

  return 0;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_EMSectionedMessageListItem *)a3;
  if (v4 == self)
  {
    char v10 = 1;
  }
  else if ([(_EMSectionedMessageListItem *)v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = v4;
    v6 = [(_EMSectionedMessageListItem *)self sectionID];
    id v7 = [(_EMSectionedMessageListItem *)v5 sectionID];
    if ([v6 isEqual:v7])
    {
      id v8 = [(_EMSectionedMessageListItem *)self underlyingItem];
      v9 = [(_EMSectionedMessageListItem *)v5 underlyingItem];
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
  v3 = [(_EMSectionedMessageListItem *)self sectionID];
  uint64_t v4 = [v3 hash];

  v5 = [(_EMSectionedMessageListItem *)self underlyingItem];
  unint64_t v6 = 33 * v4 + [v5 hash] + 1089;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_EMSectionedMessageListItem)initWithCoder:(id)a3
{
  id v8 = a3;
  id v3 = v8;
  uint64_t v4 = self;
  EFDecodeCacheableInstance();
  v5 = (_EMSectionedMessageListItem *)objc_claimAutoreleasedReturnValue();

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
  v5 = [(_EMSectionedMessageListItem *)self underlyingItem];
  if (objc_opt_respondsToSelector())
  {
    BOOL v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)_EMSectionedMessageListItem;
    BOOL v6 = [(_EMSectionedMessageListItem *)&v8 respondsToSelector:a3];
  }

  return v6;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  id v4 = [(_EMSectionedMessageListItem *)self underlyingItem];
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
  v5 = [(_EMSectionedMessageListItem *)self underlyingItem];
  if (objc_opt_isKindOfClass())
  {
    BOOL v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)_EMSectionedMessageListItem;
    BOOL v6 = [(_EMSectionedMessageListItem *)&v8 isKindOfClass:a3];
  }

  return v6;
}

- (EMObjectID)objectID
{
  id v3 = [(_EMSectionedMessageListItem *)self underlyingItem];
  id v4 = [v3 objectID];
  v5 = [(_EMSectionedMessageListItem *)self sectionID];
  BOOL v6 = +[EMSectionedMessageListObjectConverter objectIDForObjectID:v4 inSection:v5];

  return (EMObjectID *)v6;
}

- (EMCollectionItemID)itemID
{
  id v3 = [(_EMSectionedMessageListItem *)self underlyingItem];
  id v4 = [v3 itemID];
  v5 = [(_EMSectionedMessageListItem *)self sectionID];
  BOOL v6 = +[EMSectionedMessageListObjectConverter itemIDForItemID:v4 inSection:v5];

  return (EMCollectionItemID *)v6;
}

- (EMCollectionItemID)displayMessageItemID
{
  id v3 = [(_EMSectionedMessageListItem *)self underlyingItem];
  id v4 = [v3 displayMessageItemID];
  v5 = [(_EMSectionedMessageListItem *)self sectionID];
  BOOL v6 = +[EMSectionedMessageListObjectConverter itemIDForItemID:v4 inSection:v5];

  return (EMCollectionItemID *)v6;
}

- (EMObjectID)displayMessageObjectID
{
  id v3 = [(_EMSectionedMessageListItem *)self underlyingItem];
  id v4 = [v3 displayMessageObjectID];
  v5 = [(_EMSectionedMessageListItem *)self sectionID];
  BOOL v6 = +[EMSectionedMessageListObjectConverter objectIDForObjectID:v4 inSection:v5];

  return (EMObjectID *)v6;
}

- (EFFuture)displayMessage
{
  id v3 = [(_EMSectionedMessageListItem *)self underlyingItem];
  id v4 = [v3 displayMessage];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45___EMSectionedMessageListItem_displayMessage__block_invoke;
  v7[3] = &unk_1E63E6618;
  v7[4] = self;
  v5 = [v4 then:v7];

  return (EFFuture *)v5;
}

- (NSObject)sectionID
{
  return self->_sectionID;
}

- (EMMessageListItem)underlyingItem
{
  return self->_underlyingItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingItem, 0);
  objc_storeStrong((id *)&self->_sectionID, 0);
}

@end