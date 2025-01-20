@interface CNMessageToGroup
+ (id)descriptorForRequiredKeys;
+ (id)os_log;
- (CNContactFormatter)contactFormatter;
- (CNMessageToGroup)init;
- (id)emailAddressForContact:(id)a3;
- (id)messageUrlForContacts:(id)a3;
- (id)messagingAddressForContact:(id)a3;
- (id)santizeMessagingAddress:(id)a3;
- (void)setContactFormatter:(id)a3;
@end

@implementation CNMessageToGroup

+ (id)os_log
{
  if (os_log_cn_once_token_1_0 != -1) {
    dispatch_once(&os_log_cn_once_token_1_0, &__block_literal_global_44);
  }
  v2 = (void *)os_log_cn_once_object_1_0;

  return v2;
}

uint64_t __26__CNMessageToGroup_os_log__block_invoke()
{
  os_log_cn_once_object_1_0 = (uint64_t)os_log_create("com.apple.contacts", "CNMessageToGroup");

  return MEMORY[0x1F41817F8]();
}

+ (id)descriptorForRequiredKeys
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v3 = +[CNContactFormatter descriptorForRequiredKeysForStyle:0];
  v8[0] = v3;
  v8[1] = @"emailAddresses";
  v8[2] = @"phoneNumbers";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:3];

  v5 = [a1 description];
  v6 = +[CNContact descriptorWithKeyDescriptors:v4 description:v5];

  return v6;
}

- (CNMessageToGroup)init
{
  v7.receiver = self;
  v7.super_class = (Class)CNMessageToGroup;
  v2 = [(CNMessageToGroup *)&v7 init];
  if (v2)
  {
    v3 = objc_alloc_init(CNContactFormatter);
    contactFormatter = v2->_contactFormatter;
    v2->_contactFormatter = v3;

    [(CNContactFormatter *)v2->_contactFormatter setStyle:0];
    v5 = v2;
  }

  return v2;
}

- (id)messageUrlForContacts:(id)a3
{
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __42__CNMessageToGroup_messageUrlForContacts___block_invoke;
  v16[3] = &unk_1E56B48C0;
  v16[4] = self;
  v3 = objc_msgSend(a3, "_cn_map:", v16);
  v4 = objc_msgSend(v3, "_cn_filter:", *MEMORY[0x1E4F5A280]);

  if ([v4 count])
  {
    v5 = [MEMORY[0x1E4F28E78] stringWithString:@"sms://open?service=iMessage&recipients="];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    v13 = __42__CNMessageToGroup_messageUrlForContacts___block_invoke_8;
    v14 = &unk_1E56B5340;
    id v15 = v5;
    v6 = v5;
    [v4 enumerateObjectsUsingBlock:&v11];
    objc_super v7 = [v6 _cn_stringByAddingPercentEscapesToEntireURL];
    v8 = [MEMORY[0x1E4F29088] componentsWithString:v7];
    v9 = [v8 URL];
  }
  else
  {
    v6 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CNMessageToGroup messageUrlForContacts:](v6);
    }
    v9 = 0;
  }

  return v9;
}

id __42__CNMessageToGroup_messageUrlForContacts___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *MEMORY[0x1E4F5A2A8];
  v3 = [*(id *)(a1 + 32) messagingAddressForContact:a2];
  v4 = (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  return v4;
}

void __42__CNMessageToGroup_messageUrlForContacts___block_invoke_8(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3) {
    [*(id *)(a1 + 32) appendString:@","];
  }
  [*(id *)(a1 + 32) appendString:v5];
}

- (id)emailAddressForContact:(id)a3
{
  v3 = [a3 emailAddresses];
  v4 = objc_msgSend(v3, "_cn_firstObjectPassingTest:", &__block_literal_global_16_0);

  id v5 = [v4 value];

  return v5;
}

uint64_t __43__CNMessageToGroup_emailAddressForContact___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *MEMORY[0x1E4F5A2A0];
  v3 = [a2 value];
  uint64_t v4 = (*(uint64_t (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  return v4;
}

- (id)messagingAddressForContact:(id)a3
{
  id v4 = a3;
  id v5 = [(CNMessageToGroup *)self emailAddressForContact:v4];
  v6 = [v4 phoneNumbers];
  objc_super v7 = [v6 firstObject];
  v8 = [v7 value];
  v9 = [v8 stringValue];

  if (((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A2A0] + 16))() & 1) != 0 || v9)
  {
    if (v9)
    {
      id v12 = v9;
    }
    else
    {
      id v12 = [(CNMessageToGroup *)self santizeMessagingAddress:v5];
    }
    uint64_t v11 = v12;
  }
  else
  {
    v10 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CNMessageToGroup messagingAddressForContact:]((uint64_t)v4, v10);
    }

    uint64_t v11 = 0;
  }

  return v11;
}

- (id)santizeMessagingAddress:(id)a3
{
  id v3 = a3;
  id v4 = [(objc_class *)getECEmailAddressClass() emailAddressWithString:v3];
  id v5 = [v4 emailAddressValue];
  v6 = v5;
  if (!v5) {
    id v5 = v4;
  }
  objc_super v7 = [v5 stringValue];

  if (v7)
  {
    id v8 = v7;
  }
  else
  {
    v9 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CNMessageToGroup santizeMessagingAddress:]((uint64_t)v3, v9);
    }
  }

  return v7;
}

- (CNContactFormatter)contactFormatter
{
  return self->_contactFormatter;
}

- (void)setContactFormatter:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)messageUrlForContacts:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1909E3000, log, OS_LOG_TYPE_ERROR, "Failed to create message URL", v1, 2u);
}

- (void)messagingAddressForContact:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1909E3000, a2, OS_LOG_TYPE_ERROR, "Failed to create messaging address for contact: %@", (uint8_t *)&v2, 0xCu);
}

- (void)santizeMessagingAddress:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1909E3000, a2, OS_LOG_TYPE_ERROR, "Failed to sanitize messaging address: %@", (uint8_t *)&v2, 0xCu);
}

@end