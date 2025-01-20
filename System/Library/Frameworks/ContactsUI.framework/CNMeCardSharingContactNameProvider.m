@interface CNMeCardSharingContactNameProvider
+ (id)descriptorForRequiredKeys;
- (CNContact)contact;
- (CNMeCardSharingContactNameProvider)initWithContact:(id)a3;
- (id)familyName;
- (id)givenName;
- (id)middleName;
- (id)nickname;
@end

@implementation CNMeCardSharingContactNameProvider

- (void).cxx_destruct
{
}

- (CNContact)contact
{
  return self->_contact;
}

- (id)nickname
{
  return [(CNContact *)self->_contact nickname];
}

- (id)middleName
{
  return [(CNContact *)self->_contact middleName];
}

- (id)givenName
{
  return [(CNContact *)self->_contact givenName];
}

- (id)familyName
{
  return [(CNContact *)self->_contact familyName];
}

- (CNMeCardSharingContactNameProvider)initWithContact:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNMeCardSharingContactNameProvider;
  v6 = [(CNMeCardSharingContactNameProvider *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contact, a3);
    v8 = v7;
  }

  return v7;
}

+ (id)descriptorForRequiredKeys
{
  if (descriptorForRequiredKeys_cn_once_token_1_48220 != -1) {
    dispatch_once(&descriptorForRequiredKeys_cn_once_token_1_48220, &__block_literal_global_48221);
  }
  v2 = (void *)descriptorForRequiredKeys_cn_once_object_1_48222;

  return v2;
}

void __63__CNMeCardSharingContactNameProvider_descriptorForRequiredKeys__block_invoke()
{
  v7[4] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F1AEA0];
  v7[0] = *MEMORY[0x1E4F1ADF0];
  v7[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F1AEC0];
  v7[2] = *MEMORY[0x1E4F1ADE0];
  v7[3] = v1;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:4];
  v3 = (void *)MEMORY[0x1E4F1B8F8];
  v4 = [NSString stringWithUTF8String:"+[CNMeCardSharingContactNameProvider descriptorForRequiredKeys]_block_invoke"];
  uint64_t v5 = [v3 descriptorWithKeyDescriptors:v2 description:v4];

  v6 = (void *)descriptorForRequiredKeys_cn_once_object_1_48222;
  descriptorForRequiredKeys_cn_once_object_1_48222 = v5;
}

@end