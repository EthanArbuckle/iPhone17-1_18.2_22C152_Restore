@interface CNUIStaticIdentity
+ (BOOL)addStaticKeyWithPublicIDString:(id)a3 contact:(id)a4;
+ (BOOL)isHandleInStore:(id)a3;
+ (BOOL)isValidStaticKeyString:(id)a3;
+ (BOOL)removeAccountKeyFromContact:(id)a3;
+ (id)findStoreEntryByContact:(id)a3;
+ (id)ktStore;
+ (id)makeKTPublicIDWithString:(id)a3;
- (BOOL)isHandleInStore:(id)a3;
- (CNContact)contact;
- (CNUIStaticIdentity)initWithContact:(id)a3;
- (KTIDStaticKeyStoreEntry)storeEntry;
- (id)verificationCode;
@end

@implementation CNUIStaticIdentity

- (CNUIStaticIdentity)initWithContact:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v6 = [(id)objc_opt_class() findStoreEntryByContact:v5];
    if (v6
      && (v10.receiver = self,
          v10.super_class = (Class)CNUIStaticIdentity,
          v7 = [(CNUIStaticIdentity *)&v10 init],
          (self = v7) != 0))
    {
      objc_storeStrong((id *)&v7->_contact, a3);
      objc_storeStrong((id *)&self->_storeEntry, v6);
      self = self;
      v8 = self;
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)verificationCode
{
  v2 = [(CNUIStaticIdentity *)self storeEntry];
  v3 = [v2 publicKeyID];
  v4 = [v3 publicAccountIdentity];

  return v4;
}

- (BOOL)isHandleInStore:(id)a3
{
  id v4 = a3;
  id v5 = [(CNUIStaticIdentity *)self storeEntry];
  v6 = [v5 handles];
  v7 = [v6 objectForKeyedSubscript:v4];

  if (v7)
  {
    char v8 = [v7 valid];
  }
  else
  {
    v9 = +[CNUICoreLogProvider static_identity_os_log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      [(CNUIStaticIdentity *)(uint64_t)v4 isHandleInStore:v9];
    }

    char v8 = 0;
  }

  return v8;
}

+ (id)ktStore
{
  if (ktStore_onceToken != -1) {
    dispatch_once(&ktStore_onceToken, &__block_literal_global_45);
  }
  v2 = (void *)ktStore_ktStore;
  return v2;
}

uint64_t __29__CNUIStaticIdentity_ktStore__block_invoke()
{
  ktStore_ktStore = (uint64_t)objc_alloc_init(MEMORY[0x263F80D18]);
  return MEMORY[0x270F9A758]();
}

+ (BOOL)isHandleInStore:(id)a3
{
  id v4 = a3;
  if ((*(unsigned int (**)(void))(*MEMORY[0x263F334E8] + 16))())
  {
    id v5 = [a1 ktStore];

    if (v5)
    {
      v6 = [a1 ktStore];
      id v14 = 0;
      v7 = [v6 findKeyByHandle:v4 error:&v14];
      id v8 = v14;

      if (v7)
      {
        v9 = [v7 handles];
        objc_super v10 = [v9 objectForKeyedSubscript:v4];

        if (v10)
        {
          char v11 = [v10 valid];
LABEL_13:

          goto LABEL_14;
        }
        v12 = +[CNUICoreLogProvider static_identity_os_log];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          +[CNUIStaticIdentity isHandleInStore:]((uint64_t)v4, v12);
        }
      }
      else
      {
        objc_super v10 = +[CNUICoreLogProvider static_identity_os_log];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          +[CNUIStaticIdentity isHandleInStore:]();
        }
      }
      char v11 = 0;
      goto LABEL_13;
    }
  }
  char v11 = 0;
LABEL_14:

  return v11;
}

+ (id)findStoreEntryByContact:(id)a3
{
  id v4 = a3;
  id v5 = [a1 ktStore];

  if (v5)
  {
    v6 = [a1 ktStore];
    id v11 = 0;
    v7 = [v6 findByContact:v4 error:&v11];
    id v8 = v11;

    if (!v7)
    {
      v9 = +[CNUICoreLogProvider static_identity_os_log];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        +[CNUIStaticIdentity findStoreEntryByContact:]();
      }
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)makeKTPublicIDWithString:(id)a3
{
  id v4 = a3;
  id v5 = [a1 ktStore];

  if (v5)
  {
    id v9 = 0;
    id v5 = [MEMORY[0x263F80D08] ktAccountPublicIDWithString:v4 error:&v9];
    id v6 = v9;
    if (!v5)
    {
      v7 = +[CNUICoreLogProvider static_identity_os_log];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        +[CNUIStaticIdentity makeKTPublicIDWithString:]();
      }
    }
  }

  return v5;
}

+ (BOOL)isValidStaticKeyString:(id)a3
{
  id v4 = a3;
  id v5 = [a1 ktStore];

  if (v5)
  {
    id v6 = +[CNUIStaticIdentity makeKTPublicIDWithString:v4];
    LOBYTE(v5) = v6 != 0;
  }
  return (char)v5;
}

+ (BOOL)addStaticKeyWithPublicIDString:(id)a3 contact:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [a1 ktStore];

  if (v8)
  {
    id v9 = +[CNUIStaticIdentity makeKTPublicIDWithString:v6];
    if (v9)
    {
      objc_super v10 = [a1 ktStore];
      id v16 = 0;
      char v11 = [v10 updateStaticKeyEntry:v9 contact:v7 error:&v16];
      id v12 = v16;

      if (v11)
      {
        BOOL v13 = 1;
      }
      else
      {
        id v14 = +[CNUICoreLogProvider static_identity_os_log];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          +[CNUIStaticIdentity addStaticKeyWithPublicIDString:contact:]((uint64_t)v12, v14);
        }

        BOOL v13 = 0;
      }
    }
    else
    {
      BOOL v13 = 0;
      id v12 = 0;
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

+ (BOOL)removeAccountKeyFromContact:(id)a3
{
  id v4 = a3;
  id v5 = [a1 findStoreEntryByContact:v4];
  if (v5)
  {
    id v6 = [a1 ktStore];
    id v7 = [v5 publicKeyID];
    id v12 = 0;
    char v8 = [v6 removeEntryByKDID:v7 error:&v12];
    id v9 = v12;

    if ((v8 & 1) == 0)
    {
      objc_super v10 = +[CNUICoreLogProvider static_identity_os_log];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        +[CNUIStaticIdentity removeAccountKeyFromContact:v10];
      }
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (CNContact)contact
{
  return self->_contact;
}

- (KTIDStaticKeyStoreEntry)storeEntry
{
  return self->_storeEntry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeEntry, 0);
  objc_storeStrong((id *)&self->_contact, 0);
}

- (void)isHandleInStore:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = [a2 contact];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_debug_impl(&dword_20B704000, a3, OS_LOG_TYPE_DEBUG, "Unable to find store handle for handle in contact %@: %@", (uint8_t *)&v6, 0x16u);
}

+ (void)isHandleInStore:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_20B704000, v0, v1, "Unable to find store entry for handle %@: %@");
}

+ (void)isHandleInStore:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_20B704000, a2, OS_LOG_TYPE_DEBUG, "Unable to find store handle for handle %@", (uint8_t *)&v2, 0xCu);
}

+ (void)findStoreEntryByContact:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_20B704000, v0, v1, "Unable to find store entry for contact %@: %@");
}

+ (void)makeKTPublicIDWithString:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_20B704000, v0, OS_LOG_TYPE_ERROR, "Error creating public id with verification code %@: %@", v1, 0x16u);
}

+ (void)addStaticKeyWithPublicIDString:(uint64_t)a1 contact:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20B704000, a2, OS_LOG_TYPE_ERROR, "Error saving static id: %@", (uint8_t *)&v2, 0xCu);
}

+ (void)removeAccountKeyFromContact:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = [a1 identifier];
  int v6 = 138412546;
  uint64_t v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_20B704000, a3, OS_LOG_TYPE_ERROR, "Error removing verification code from contact %@: %@", (uint8_t *)&v6, 0x16u);
}

@end