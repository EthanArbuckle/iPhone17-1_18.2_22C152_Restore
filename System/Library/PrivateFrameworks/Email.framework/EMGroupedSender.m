@interface EMGroupedSender
+ (BOOL)supportsSecureCoding;
+ (OS_os_log)log;
- (BOOL)isGroupedSender;
- (EFFuture)displayMessage;
- (EMCollectionItemID)displayMessageItemID;
- (EMCollectionItemID)itemID;
- (EMGroupedSender)initWithCoder:(id)a3;
- (EMGroupedSender)initWithObjectID:(id)a3 builder:(id)a4;
- (EMObjectID)displayMessageObjectID;
- (NSString)businessDisplayName;
- (NSURL)brandIndicatorLocation;
- (id)changeFrom:(id)a3;
- (id)preferredSenderDisplayNameWithContactStore:(id)a3;
- (unint64_t)count;
- (unint64_t)unreadCount;
- (unint64_t)unseenCount;
- (void)_commonInitWithBuilder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setBusinessDisplayName:(id)a3;
- (void)setCount:(unint64_t)a3;
- (void)setDisplayMessageItemID:(id)a3;
- (void)setRepository:(id)a3;
- (void)setUnreadCount:(unint64_t)a3;
- (void)setUnseenCount:(unint64_t)a3;
@end

@implementation EMGroupedSender

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __22__EMGroupedSender_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_15 != -1) {
    dispatch_once(&log_onceToken_15, block);
  }
  v2 = (void *)log_log_15;
  return (OS_os_log *)v2;
}

void __22__EMGroupedSender_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_15;
  log_log_15 = (uint64_t)v1;
}

- (EMGroupedSender)initWithObjectID:(id)a3 builder:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"EMGroupedSender-BlackPearlUI.m", 40, @"Invalid parameter not satisfying: %@", @"builderBlock" object file lineNumber description];
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __44__EMGroupedSender_initWithObjectID_builder___block_invoke;
  v14[3] = &unk_1E63E34E8;
  v15 = self;
  id v9 = v8;
  id v16 = v9;
  v13.receiver = v15;
  v13.super_class = (Class)EMGroupedSender;
  v10 = [(EMBaseMessageListItem *)&v13 initWithObjectID:v7 baseBuilder:v14];

  return v10;
}

uint64_t __44__EMGroupedSender_initWithObjectID_builder___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _commonInitWithBuilder:*(void *)(a1 + 40)];
}

- (void)_commonInitWithBuilder:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMGroupedSender)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EMGroupedSender;
  v5 = [(EMBaseMessageListItem *)&v9 initWithCoder:v4];
  if (v5)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __33__EMGroupedSender_initWithCoder___block_invoke;
    v7[3] = &unk_1E63E3510;
    id v8 = v4;
    [(EMGroupedSender *)v5 _commonInitWithBuilder:v7];
  }
  return v5;
}

void __33__EMGroupedSender_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_msgSend(v5, "setUnreadCount:", objc_msgSend(*(id *)(a1 + 32), "decodeIntegerForKey:", @"EFPropertyKey_unreadCount"));
  objc_msgSend(v5, "setUnseenCount:", objc_msgSend(*(id *)(a1 + 32), "decodeIntegerForKey:", @"EFPropertyKey_unseenCount"));
  objc_msgSend(v5, "setCount:", objc_msgSend(*(id *)(a1 + 32), "decodeIntegerForKey:", @"EFPropertyKey_count"));
  id v3 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_businessDisplayName"];
  [v5 setBusinessDisplayName:v3];

  id v4 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_displayMessageItemID"];
  [v5 setDisplayMessageItemID:v4];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)EMGroupedSender;
  [(EMBaseMessageListItem *)&v7 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", -[EMGroupedSender unreadCount](self, "unreadCount"), @"EFPropertyKey_unreadCount");
  objc_msgSend(v4, "encodeInteger:forKey:", -[EMGroupedSender unseenCount](self, "unseenCount"), @"EFPropertyKey_unseenCount");
  objc_msgSend(v4, "encodeInteger:forKey:", -[EMGroupedSender count](self, "count"), @"EFPropertyKey_count");
  id v5 = [(EMGroupedSender *)self businessDisplayName];
  [v4 encodeObject:v5 forKey:@"EFPropertyKey_businessDisplayName"];

  v6 = [(EMGroupedSender *)self displayMessageItemID];
  [v4 encodeObject:v6 forKey:@"EFPropertyKey_displayMessageItemID"];
}

- (id)changeFrom:(id)a3
{
  id v3 = +[EMGroupedSenderChange changeFrom:a3 to:self];
  return v3;
}

- (void)setRepository:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EMGroupedSender;
  [(EMBaseMessageListItem *)&v9 setRepository:v4];
  id v5 = [(EMBaseMessageListItem *)self groupedSenderMessageListItems];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__EMGroupedSender_setRepository___block_invoke;
  v7[3] = &unk_1E63E3538;
  id v6 = v4;
  id v8 = v6;
  [v5 enumerateObjectsUsingBlock:v7];
}

void __33__EMGroupedSender_setRepository___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v3 setRepository:*(void *)(a1 + 32)];
  }
  else
  {
    id v4 = +[EMGroupedSender log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = objc_msgSend(v3, "ef_publicDescription");
      __33__EMGroupedSender_setRepository___block_invoke_cold_1(v5, v6, v4);
    }
  }
}

- (EMCollectionItemID)itemID
{
  v2 = [(EMObject *)self objectID];
  id v3 = [v2 collectionItemID];

  return (EMCollectionItemID *)v3;
}

- (EMObjectID)displayMessageObjectID
{
  id v4 = [(EMGroupedSender *)self displayMessageItemID];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"EMGroupedSender-BlackPearlUI.m" lineNumber:104 description:@"displayMessageItemID is not an EMMessageCollectionItemID"];
  }
  id v5 = [EMMessageObjectID alloc];
  id v6 = [(EMObject *)self objectID];
  uint64_t v7 = [v6 threadScope];
  id v8 = [v7 mailboxScope];
  objc_super v9 = [(EMMessageObjectID *)v5 initWithCollectionItemID:v4 mailboxScope:v8];

  return (EMObjectID *)v9;
}

- (EFFuture)displayMessage
{
  id v3 = [(EMGroupedSender *)self displayMessageObjectID];
  id v4 = [(EMBaseMessageListItem *)self repository];
  id v5 = [v4 messageForObjectID:v3];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __33__EMGroupedSender_displayMessage__block_invoke;
  v13[3] = &unk_1E63E3560;
  v13[4] = self;
  id v6 = v3;
  id v14 = v6;
  uint64_t v7 = [v5 recover:v13];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __33__EMGroupedSender_displayMessage__block_invoke_47;
  v11[3] = &unk_1E63E3588;
  v11[4] = self;
  id v8 = v6;
  id v12 = v8;
  objc_super v9 = [v7 then:v11];

  return (EFFuture *)v9;
}

id __33__EMGroupedSender_displayMessage__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) displayMessageObjectID];
  if (!objc_msgSend(v3, "em_isItemNotFoundError") || *(void **)(a1 + 40) == v4)
  {
    v10 = +[EMGroupedSender log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_super v13 = objc_msgSend(*(id *)(a1 + 32), "ef_publicDescription");
      id v14 = [*(id *)(a1 + 32) displayMessageObjectID];
      v15 = [*(id *)(a1 + 32) displayMessageItemID];
      id v16 = objc_msgSend(v3, "ef_publicDescription");
      int v17 = 138544130;
      v18 = v13;
      __int16 v19 = 2114;
      v20 = v14;
      __int16 v21 = 2114;
      v22 = v15;
      __int16 v23 = 2114;
      v24 = v16;
      _os_log_error_impl(&dword_1BEFDB000, v10, OS_LOG_TYPE_ERROR, "%{public}@\ndisplayMessageObjectID: %{public}@, displayMessageItemID: %{public}@, error: %{public}@", (uint8_t *)&v17, 0x2Au);
    }
    uint64_t v9 = [MEMORY[0x1E4F60D70] futureWithError:v3];
  }
  else
  {
    id v5 = +[EMGroupedSender log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = objc_msgSend(*(id *)(a1 + 32), "ef_publicDescription");
      uint64_t v7 = *(void **)(a1 + 40);
      id v8 = objc_msgSend(v3, "ef_publicDescription");
      int v17 = 138544130;
      v18 = v6;
      __int16 v19 = 2114;
      v20 = v7;
      __int16 v21 = 2114;
      v22 = v4;
      __int16 v23 = 2114;
      v24 = v8;
      _os_log_impl(&dword_1BEFDB000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@\nre-trying request for displayMessage: objectID: %{public}@, updatedObjectID: %{public}@, error: %{public}@", (uint8_t *)&v17, 0x2Au);
    }
    uint64_t v9 = [*(id *)(a1 + 32) displayMessage];
  }
  v11 = (void *)v9;

  return v11;
}

id __33__EMGroupedSender_displayMessage__block_invoke_47(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v7 = [MEMORY[0x1E4F60D70] futureWithResult:v3];
  }
  else
  {
    id v4 = +[EMGroupedSender log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = objc_msgSend(*(id *)(a1 + 32), "ef_publicDescription");
      v10 = [*(id *)(a1 + 32) displayMessageObjectID];
      v11 = [*(id *)(a1 + 32) displayMessageItemID];
      int v12 = 138543874;
      objc_super v13 = v9;
      __int16 v14 = 2114;
      v15 = v10;
      __int16 v16 = 2114;
      int v17 = v11;
      _os_log_error_impl(&dword_1BEFDB000, v4, OS_LOG_TYPE_ERROR, "%{public}@\ndisplayMessageObjectID: %{public}@, displayMessageItemID: %{public}@, message isNull", (uint8_t *)&v12, 0x20u);
    }
    id v5 = (void *)MEMORY[0x1E4F60D70];
    id v6 = objc_msgSend(MEMORY[0x1E4F28C58], "em_itemNotFoundErrorWithItemID:", *(void *)(a1 + 40));
    uint64_t v7 = [v5 futureWithError:v6];
  }
  return v7;
}

- (BOOL)isGroupedSender
{
  return 1;
}

- (id)preferredSenderDisplayNameWithContactStore:(id)a3
{
  id v4 = a3;
  id v5 = [(EMGroupedSender *)self businessDisplayName];
  id v6 = [(EMBaseMessageListItem *)self senderList];
  uint64_t v7 = [v6 firstObject];
  id v8 = [v7 emailAddressValue];

  if (v5)
  {
    id v9 = v5;
LABEL_3:
    id v10 = v9;
    goto LABEL_16;
  }
  if (!v8)
  {
    _EFLocalizedString();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
  v11 = [v8 stringValue];
  int v12 = [v4 displayNameForEmailAddress:v11];

  if (v12)
  {
    id v10 = v12;
  }
  else
  {
    id v13 = v8;
    __int16 v14 = [v13 emailAddressValue];
    v15 = objc_msgSend(v14, "em_displayableString");
    __int16 v16 = v15;
    if (v15)
    {
      id v10 = v15;
    }
    else
    {
      int v17 = [v14 simpleAddress];
      uint64_t v18 = v17;
      if (v17)
      {
        id v19 = v17;
      }
      else
      {
        id v19 = [v13 stringValue];
      }
      id v10 = v19;
    }
  }

LABEL_16:
  return v10;
}

- (NSURL)brandIndicatorLocation
{
  return 0;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (unint64_t)unreadCount
{
  return self->_unreadCount;
}

- (void)setUnreadCount:(unint64_t)a3
{
  self->_unreadCount = a3;
}

- (unint64_t)unseenCount
{
  return self->_unseenCount;
}

- (void)setUnseenCount:(unint64_t)a3
{
  self->_unseenCount = a3;
}

- (EMCollectionItemID)displayMessageItemID
{
  return (EMCollectionItemID *)objc_getProperty(self, a2, 256, 1);
}

- (void)setDisplayMessageItemID:(id)a3
{
}

- (NSString)businessDisplayName
{
  return (NSString *)objc_getProperty(self, a2, 264, 1);
}

- (void)setBusinessDisplayName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_businessDisplayName, 0);
  objc_storeStrong((id *)&self->_displayMessageItemID, 0);
}

void __33__EMGroupedSender_setRepository___block_invoke_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1BEFDB000, log, OS_LOG_TYPE_ERROR, "Attempting to set repository on a non-EMMessage groupedSenderMessageListItem %{public}@", buf, 0xCu);
}

@end