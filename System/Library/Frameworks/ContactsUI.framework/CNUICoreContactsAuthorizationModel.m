@interface CNUICoreContactsAuthorizationModel
+ (BOOL)supportsSecureCoding;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (CNUICoreContactsAuthorizationModel)init;
- (CNUICoreContactsAuthorizationModel)initWithCoder:(id)a3;
- (CNUICoreContactsAuthorizationModel)initWithItems:(id)a3;
- (NSArray)bundleIdentifiers;
- (NSArray)changedItems;
- (NSArray)items;
- (NSArray)remoteItems;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)itemWithMatchingBundleIdentifier:(id)a3;
- (id)modelByCopyingIconsOfRemoteItemsFromModel:(id)a3;
- (id)modelByCopyingItemsWithBundleIdentifier:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNUICoreContactsAuthorizationModel

- (void).cxx_destruct
{
}

- (NSArray)items
{
  return self->_items;
}

- (id)modelByCopyingIconsOfRemoteItemsFromModel:(id)a3
{
  id v4 = a3;
  v5 = [(CNUICoreContactsAuthorizationModel *)self items];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __80__CNUICoreContactsAuthorizationModel_modelByCopyingIconsOfRemoteItemsFromModel___block_invoke;
  v10[3] = &unk_1E5496A78;
  id v11 = v4;
  id v6 = v4;
  v7 = objc_msgSend(v5, "_cn_map:", v10);

  v8 = [[CNUICoreContactsAuthorizationModel alloc] initWithItems:v7];

  return v8;
}

id __80__CNUICoreContactsAuthorizationModel_modelByCopyingIconsOfRemoteItemsFromModel___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v5 = [v3 bundleIdentifier];
  id v6 = [v4 itemWithMatchingBundleIdentifier:v5];

  if (v6)
  {
    v7 = [v6 icon];
    id v8 = [v3 itemBySettingIcon:v7];
  }
  else
  {
    id v8 = v3;
  }

  return v8;
}

- (id)modelByCopyingItemsWithBundleIdentifier:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(CNUICoreContactsAuthorizationModel *)self itemWithMatchingBundleIdentifier:a3];
  id v4 = [CNUICoreContactsAuthorizationModel alloc];
  v5 = v4;
  if (v3)
  {
    id v6 = (void *)[v3 copy];
    v10[0] = v6;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    id v8 = [(CNUICoreContactsAuthorizationModel *)v5 initWithItems:v7];
  }
  else
  {
    id v8 = [(CNUICoreContactsAuthorizationModel *)v4 initWithItems:MEMORY[0x1E4F1CBF0]];
  }

  return v8;
}

- (id)itemWithMatchingBundleIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(CNUICoreContactsAuthorizationModel *)self items];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__CNUICoreContactsAuthorizationModel_itemWithMatchingBundleIdentifier___block_invoke;
  v9[3] = &unk_1E54966B8;
  id v10 = v4;
  id v6 = v4;
  v7 = objc_msgSend(v5, "_cn_firstObjectPassingTest:", v9);

  return v7;
}

uint64_t __71__CNUICoreContactsAuthorizationModel_itemWithMatchingBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 bundleIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (BOOL)isEmpty
{
  uint64_t v2 = *MEMORY[0x1E4F5A258];
  id v3 = [(CNUICoreContactsAuthorizationModel *)self items];
  LOBYTE(v2) = (*(uint64_t (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  return v2;
}

- (NSArray)bundleIdentifiers
{
  uint64_t v2 = [(CNUICoreContactsAuthorizationModel *)self items];
  id v3 = objc_msgSend(v2, "_cn_map:", &__block_literal_global_23);

  return (NSArray *)v3;
}

uint64_t __55__CNUICoreContactsAuthorizationModel_bundleIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  return [a2 bundleIdentifier];
}

- (NSArray)remoteItems
{
  uint64_t v2 = [(CNUICoreContactsAuthorizationModel *)self items];
  id v3 = objc_msgSend(v2, "_cn_filter:", &__block_literal_global_20);

  return (NSArray *)v3;
}

BOOL __49__CNUICoreContactsAuthorizationModel_remoteItems__block_invoke(uint64_t a1, void *a2)
{
  return [a2 deviceType] == 1;
}

- (NSArray)changedItems
{
  uint64_t v2 = [(CNUICoreContactsAuthorizationModel *)self items];
  id v3 = objc_msgSend(v2, "_cn_filter:", &__block_literal_global_18);

  return (NSArray *)v3;
}

uint64_t __50__CNUICoreContactsAuthorizationModel_changedItems__block_invoke(uint64_t a1, void *a2)
{
  return [a2 hasChanges];
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  uint64_t v4 = [(CNUICoreContactsAuthorizationModel *)self items];
  id v5 = (id)[v3 appendObject:v4 withName:@"items"];

  id v6 = [v3 build];

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2 = (void *)MEMORY[0x1E4F5A418];
  id v3 = [(CNUICoreContactsAuthorizationModel *)self items];
  unint64_t v4 = [v2 arrayHash:v3] + 527;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (CNUICoreContactsAuthorizationModel *)a3;
  BOOL v7 = 1;
  if (self != v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (unint64_t v5 = (unint64_t)[(CNUICoreContactsAuthorizationModel *)self items],
          unint64_t v6 = (unint64_t)[(CNUICoreContactsAuthorizationModel *)v4 items],
          v5 | v6)
      && ![(id)v5 isEqual:v6])
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = [(CNUICoreContactsAuthorizationModel *)self items];
  unint64_t v4 = objc_msgSend(v3, "_cn_map:", &__block_literal_global_357);

  unint64_t v5 = [[CNUICoreContactsAuthorizationModel alloc] initWithItems:v4];
  return v5;
}

id __51__CNUICoreContactsAuthorizationModel_copyWithZone___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)[a2 copy];

  return v2;
}

- (void)encodeWithCoder:(id)a3
{
}

- (CNUICoreContactsAuthorizationModel)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CNUICoreContactsAuthorizationModel;
  unint64_t v5 = [(CNUICoreContactsAuthorizationModel *)&v14 init];
  if (v5)
  {
    unint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    id v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"_items"];
    uint64_t v10 = [v9 copy];
    items = v5->_items;
    v5->_items = (NSArray *)v10;

    v12 = v5;
  }

  return v5;
}

- (CNUICoreContactsAuthorizationModel)initWithItems:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v11 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"parameter ‘items’ must be nonnull" userInfo:0];
    objc_exception_throw(v11);
  }
  unint64_t v6 = v5;
  v12.receiver = self;
  v12.super_class = (Class)CNUICoreContactsAuthorizationModel;
  uint64_t v7 = [(CNUICoreContactsAuthorizationModel *)&v12 init];
  id v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_items, a3);
    v9 = v8;
  }

  return v8;
}

- (CNUICoreContactsAuthorizationModel)init
{
  uint64_t v2 = self;
  CNInitializerUnavailableException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end