@interface EMGroupedSenderChange
+ (BOOL)supportsSecureCoding;
+ (id)changeForKeyPaths:(id)a3 ofItem:(id)a4;
+ (id)changeFrom:(id)a3 to:(id)a4;
- (BOOL)applyToMessageListItem:(id)a3;
- (EMGroupedSenderChange)initWithCoder:(id)a3;
- (NSNumber)unreadCount;
- (NSNumber)unseenCount;
- (id)changeDescriptionsForInternal:(BOOL)a3 useDebugDescriptions:(BOOL)a4;
- (void)addChange:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setUnreadCount:(id)a3;
- (void)setUnseenCount:(id)a3;
@end

@implementation EMGroupedSenderChange

+ (id)changeFrom:(id)a3 to:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)a1);
  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    id v9 = v6;
    id v10 = v7;
    uint64_t v11 = [v10 unreadCount];
    uint64_t v12 = [v9 unreadCount];
    BOOL v13 = v11 != v12;
    if (v11 != v12)
    {
      v14 = [NSNumber numberWithUnsignedInteger:v11];
      [v8 setUnreadCount:v14];
    }
    uint64_t v15 = [v10 unseenCount];
    if (v15 != [v9 unseenCount])
    {
      v16 = [NSNumber numberWithUnsignedInteger:v15];
      [v8 setUnseenCount:v16];

      BOOL v13 = 1;
    }
  }
  else
  {
    BOOL v13 = 0;
  }
  v17 = +[EMMessageListItemChange changeFrom:v6 to:v7 with:v8 hasChanges:v13];

  return v17;
}

+ (id)changeForKeyPaths:(id)a3 ofItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 containsObject:@"unseenCount"]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v8 = objc_alloc_init((Class)a1);
    id v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "unseenCount"));
    [v8 setUnseenCount:v9];

    id v10 = (void *)[v6 mutableCopy];
    [v10 removeObject:@"unseenCount"];

    id v6 = v10;
  }
  else
  {
    id v8 = 0;
  }
  v16.receiver = a1;
  v16.super_class = (Class)&OBJC_METACLASS___EMGroupedSenderChange;
  uint64_t v11 = objc_msgSendSuper2(&v16, sel_changeForKeyPaths_ofItem_, v6, v7);
  uint64_t v12 = (void *)v11;
  if (v8 && v11) {
    [v8 addChange:v11];
  }
  if (v8) {
    BOOL v13 = v8;
  }
  else {
    BOOL v13 = v12;
  }
  id v14 = v13;

  return v14;
}

- (void)addChange:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)EMGroupedSenderChange;
  [(EMMessageListItemChange *)&v10 addChange:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [v5 unreadCount];

    if (v6)
    {
      id v7 = [v5 unreadCount];
      [(EMGroupedSenderChange *)self setUnreadCount:v7];
    }
    id v8 = [v5 unseenCount];

    if (v8)
    {
      id v9 = [v5 unseenCount];
      [(EMGroupedSenderChange *)self setUnseenCount:v9];
    }
  }
}

- (BOOL)applyToMessageListItem:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)EMGroupedSenderChange;
  BOOL v5 = [(EMMessageListItemChange *)&v13 applyToMessageListItem:v4];
  id v6 = [(EMGroupedSenderChange *)self unreadCount];
  if (v6)
  {
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = [(EMGroupedSenderChange *)self unreadCount];
      objc_msgSend(v4, "setUnreadCount:", objc_msgSend(v8, "unsignedIntegerValue"));

      BOOL v5 = 1;
    }
  }
  id v9 = [(EMGroupedSenderChange *)self unreadCount];
  if (v9)
  {
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      uint64_t v11 = [(EMGroupedSenderChange *)self unseenCount];
      objc_msgSend(v4, "setUnseenCount:", objc_msgSend(v11, "unsignedIntegerValue"));

      BOOL v5 = 1;
    }
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMGroupedSenderChange)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EMGroupedSenderChange;
  BOOL v5 = [(EMMessageListItemChange *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_unreadCount"];
    unreadCount = v5->_unreadCount;
    v5->_unreadCount = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_unseenCount"];
    unseenCount = v5->_unseenCount;
    v5->_unseenCount = (NSNumber *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)EMGroupedSenderChange;
  [(EMMessageListItemChange *)&v7 encodeWithCoder:v4];
  BOOL v5 = [(EMGroupedSenderChange *)self unreadCount];
  [v4 encodeObject:v5 forKey:@"EFPropertyKey_unreadCount"];

  uint64_t v6 = [(EMGroupedSenderChange *)self unseenCount];
  [v4 encodeObject:v6 forKey:@"EFPropertyKey_unseenCount"];
}

- (id)changeDescriptionsForInternal:(BOOL)a3 useDebugDescriptions:(BOOL)a4
{
  BOOL v4 = a4;
  v25.receiver = self;
  v25.super_class = (Class)EMGroupedSenderChange;
  uint64_t v6 = -[EMMessageListItemChange changeDescriptionsForInternal:useDebugDescriptions:](&v25, sel_changeDescriptionsForInternal_useDebugDescriptions_, a3);
  objc_super v7 = (void *)[v6 mutableCopy];

  uint64_t v8 = [(EMGroupedSenderChange *)self unreadCount];

  if (v8)
  {
    if (v4)
    {
      id v9 = [(EMGroupedSenderChange *)self unreadCount];
      uint64_t v10 = [v9 debugDescription];
    }
    else
    {
      objc_super v11 = [(EMGroupedSenderChange *)self unreadCount];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        objc_super v13 = (void *)MEMORY[0x1E4F60E00];
        id v9 = [(EMGroupedSenderChange *)self unreadCount];
        [v13 partiallyRedactedStringForString:v9];
      }
      else
      {
        id v9 = [(EMGroupedSenderChange *)self unreadCount];
        [v9 description];
      uint64_t v10 = };
    }
    id v14 = (void *)v10;

    uint64_t v15 = (void *)[[NSString alloc] initWithFormat:@"unreadCount: %@", v14];
    [v7 addObject:v15];
  }
  objc_super v16 = [(EMGroupedSenderChange *)self unseenCount];

  if (v16)
  {
    if (v4)
    {
      v17 = [(EMGroupedSenderChange *)self unseenCount];
      uint64_t v18 = [v17 debugDescription];
    }
    else
    {
      v19 = [(EMGroupedSenderChange *)self unseenCount];
      objc_opt_class();
      char v20 = objc_opt_isKindOfClass();

      if (v20)
      {
        v21 = (void *)MEMORY[0x1E4F60E00];
        v17 = [(EMGroupedSenderChange *)self unseenCount];
        [v21 partiallyRedactedStringForString:v17];
      }
      else
      {
        v17 = [(EMGroupedSenderChange *)self unseenCount];
        [v17 description];
      uint64_t v18 = };
    }
    v22 = (void *)v18;

    v23 = (void *)[[NSString alloc] initWithFormat:@"unseenCount: %@", v22];
    [v7 addObject:v23];
  }
  return v7;
}

- (NSNumber)unreadCount
{
  return self->_unreadCount;
}

- (void)setUnreadCount:(id)a3
{
}

- (NSNumber)unseenCount
{
  return self->_unseenCount;
}

- (void)setUnseenCount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unseenCount, 0);
  objc_storeStrong((id *)&self->_unreadCount, 0);
}

@end