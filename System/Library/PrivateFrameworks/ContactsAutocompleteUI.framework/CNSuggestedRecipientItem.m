@interface CNSuggestedRecipientItem
+ (id)os_log;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSelected;
- (BOOL)isSelectedForHandles:(id)a3;
- (BOOL)shouldDeselectForHandles:(id)a3;
- (CNComposeRecipient)recipient;
- (CNSuggestedRecipientItem)initWithRecipient:(id)a3;
- (NSMutableSet)handles;
- (NSString)title;
- (id)description;
- (unint64_t)hash;
- (void)loadHandles;
- (void)setHandles:(id)a3;
- (void)setIsSelected:(BOOL)a3;
- (void)setRecipient:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation CNSuggestedRecipientItem

+ (id)os_log
{
  if (os_log_cn_once_token_1 != -1) {
    dispatch_once(&os_log_cn_once_token_1, &__block_literal_global);
  }
  v2 = (void *)os_log_cn_once_object_1;

  return v2;
}

uint64_t __34__CNSuggestedRecipientItem_os_log__block_invoke()
{
  os_log_cn_once_object_1 = (uint64_t)os_log_create("com.apple.contacts.autocomplete.ui", "suggestions");

  return MEMORY[0x1F41817F8]();
}

- (CNSuggestedRecipientItem)initWithRecipient:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CNSuggestedRecipientItem;
  v6 = [(CNSuggestedRecipientItem *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_recipient, a3);
    uint64_t v8 = [v5 compositeName];
    title = v7->_title;
    v7->_title = (NSString *)v8;

    v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    handles = v7->_handles;
    v7->_handles = v10;

    [(CNSuggestedRecipientItem *)v7 loadHandles];
    v12 = v7;
  }

  return v7;
}

- (void)loadHandles
{
  recipient = self->_recipient;
  if (recipient)
  {
    BOOL v4 = [(CNComposeRecipient *)recipient isGroup];
    handles = self->_handles;
    v6 = self->_recipient;
    if (v4)
    {
      id v8 = [(CNComposeRecipient *)v6 children];
      v7 = objc_msgSend(v8, "_cn_map:", &__block_literal_global_5);
      [(NSMutableSet *)handles addObjectsFromArray:v7];
    }
    else
    {
      id v8 = [(CNComposeRecipient *)v6 normalizedAddress];
      -[NSMutableSet addObject:](handles, "addObject:");
    }
  }
}

- (BOOL)isSelectedForHandles:(id)a3
{
  id v4 = a3;
  if ([(NSMutableSet *)self->_handles isSubsetOfSet:v4])
  {
    char v5 = 1;
  }
  else if ([(CNComposeRecipient *)self->_recipient isGroup])
  {
    v6 = [(CNComposeRecipient *)self->_recipient children];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __49__CNSuggestedRecipientItem_isSelectedForHandles___block_invoke;
    v9[3] = &unk_1E6128188;
    id v10 = v4;
    char v7 = objc_msgSend(v6, "_cn_any:", v9);

    char v5 = v7 ^ 1;
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

uint64_t __49__CNSuggestedRecipientItem_isSelectedForHandles___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  char v5 = [v3 normalizedAddress];
  LOBYTE(v4) = [v4 containsObject:v5];

  if (v4)
  {
    uint64_t v6 = 0;
  }
  else
  {
    char v7 = *(void **)(a1 + 32);
    id v8 = [v3 unifiedHandles];
    uint64_t v6 = [v7 intersectsSet:v8] ^ 1;
  }
  return v6;
}

- (BOOL)shouldDeselectForHandles:(id)a3
{
  id v4 = a3;
  if ([(NSMutableSet *)self->_handles intersectsSet:v4])
  {
    char v5 = 1;
  }
  else if ([(CNComposeRecipient *)self->_recipient isGroup])
  {
    uint64_t v6 = [(CNComposeRecipient *)self->_recipient children];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __53__CNSuggestedRecipientItem_shouldDeselectForHandles___block_invoke;
    v8[3] = &unk_1E6128188;
    id v9 = v4;
    char v5 = objc_msgSend(v6, "_cn_any:", v8);
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

uint64_t __53__CNSuggestedRecipientItem_shouldDeselectForHandles___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  char v5 = [v3 normalizedAddress];
  LOBYTE(v4) = [v4 containsObject:v5];

  if (v4)
  {
    uint64_t v6 = 1;
  }
  else
  {
    char v7 = *(void **)(a1 + 32);
    id v8 = [v3 unifiedHandles];
    uint64_t v6 = [v7 intersectsSet:v8];
  }
  return v6;
}

- (unint64_t)hash
{
  v2 = [(CNSuggestedRecipientItem *)self recipient];
  id v3 = [v2 autocompleteResult];
  unint64_t v4 = [v3 hash];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    unint64_t v8 = [(CNSuggestedRecipientItem *)self hash];
    BOOL v9 = v8 == [v7 hash];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"title" object:self->_title];
  id v5 = (id)[v3 appendName:@"handles" object:self->_handles];
  id v6 = (id)[v3 appendName:@"recipient" object:self->_recipient];
  id v7 = [v3 build];

  return v7;
}

- (CNComposeRecipient)recipient
{
  return self->_recipient;
}

- (void)setRecipient:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSMutableSet)handles
{
  return self->_handles;
}

- (void)setHandles:(id)a3
{
}

- (BOOL)isSelected
{
  return self->_isSelected;
}

- (void)setIsSelected:(BOOL)a3
{
  self->_isSelected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handles, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_recipient, 0);
}

@end