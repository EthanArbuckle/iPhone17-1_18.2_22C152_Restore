@interface CNHandleExpander
+ (id)contactStoreForFetchingContacts;
- (CNHandleExpander)initWithHandles:(id)a3;
- (NSArray)expandedAddresses;
- (NSArray)incomingAddresses;
- (id)expandedHandles;
- (void)expandHandles;
- (void)setExpandedAddresses:(id)a3;
- (void)setIncomingAddresses:(id)a3;
@end

@implementation CNHandleExpander

- (CNHandleExpander)initWithHandles:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNHandleExpander;
  v6 = [(CNHandleExpander *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_incomingAddresses, a3);
    v8 = v7;
  }

  return v7;
}

- (id)expandedHandles
{
  expandedAddresses = self->_expandedAddresses;
  if (!expandedAddresses)
  {
    [(CNHandleExpander *)self expandHandles];
    expandedAddresses = self->_expandedAddresses;
  }

  return expandedAddresses;
}

- (void)expandHandles
{
  v16[2] = *MEMORY[0x1E4F143B8];
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A258] + 16))())
  {
    expandedAddresses = self->_expandedAddresses;
    self->_expandedAddresses = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v4 = [(id)objc_opt_class() contactStoreForFetchingContacts];
    id v5 = +[CNContact predicateForContactsMatchingHandleStrings:self->_incomingAddresses];
    v16[0] = @"emailAddresses";
    v16[1] = @"phoneNumbers";
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
    v7 = [[CNContactFetchRequest alloc] initWithKeysToFetch:v6];
    [(CNContactFetchRequest *)v7 setPredicate:v5];
    v8 = [MEMORY[0x1E4F1CA48] array];
    id v15 = 0;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __33__CNHandleExpander_expandHandles__block_invoke;
    v13[3] = &unk_1E56B6498;
    v9 = v8;
    v14 = v9;
    [v4 enumerateContactsWithFetchRequest:v7 error:&v15 usingBlock:v13];
    id v10 = v15;
    v11 = self->_expandedAddresses;
    self->_expandedAddresses = v9;
    v12 = v9;
  }
}

void __33__CNHandleExpander_expandHandles__block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v4 emailAddresses];
  v6 = objc_msgSend(v5, "_cn_map:", &__block_literal_global_8_1);
  [v3 addObjectsFromArray:v6];

  v7 = *(void **)(a1 + 32);
  id v9 = [v4 phoneNumbers];

  v8 = objc_msgSend(v9, "_cn_map:", &__block_literal_global_10_0);
  [v7 addObjectsFromArray:v8];
}

+ (id)contactStoreForFetchingContacts
{
  if (contactStoreForFetchingContacts_cn_once_token_0 != -1) {
    dispatch_once(&contactStoreForFetchingContacts_cn_once_token_0, &__block_literal_global_70);
  }
  v2 = (void *)contactStoreForFetchingContacts_cn_once_object_0;

  return v2;
}

uint64_t __51__CNHandleExpander_contactStoreForFetchingContacts__block_invoke()
{
  contactStoreForFetchingContacts_cn_once_object_0 = objc_alloc_init(CNContactStore);

  return MEMORY[0x1F41817F8]();
}

- (NSArray)incomingAddresses
{
  return self->_incomingAddresses;
}

- (void)setIncomingAddresses:(id)a3
{
}

- (NSArray)expandedAddresses
{
  return self->_expandedAddresses;
}

- (void)setExpandedAddresses:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expandedAddresses, 0);

  objc_storeStrong((id *)&self->_incomingAddresses, 0);
}

@end