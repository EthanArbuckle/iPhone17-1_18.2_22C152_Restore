@interface NEKeychainItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isModernSystem;
- (NEKeychainItem)initWithCoder:(id)a3;
- (NEKeychainItem)initWithData:(id)a3 domain:(int64_t)a4;
- (NEKeychainItem)initWithData:(id)a3 domain:(int64_t)a4 accessGroup:(id)a5;
- (NEKeychainItem)initWithIdentifier:(id)a3 domain:(int64_t)a4;
- (NEKeychainItem)initWithIdentifier:(id)a3 domain:(int64_t)a4 accessGroup:(id)a5;
- (NEKeychainItem)initWithLegacyIdentifier:(id)a3 domain:(int64_t)a4;
- (NEKeychainItem)initWithLegacyIdentifier:(id)a3 domain:(int64_t)a4 accessGroup:(id)a5;
- (NEKeychainItem)initWithPassword:(id)a3 domain:(int64_t)a4;
- (NEKeychainItem)initWithPassword:(id)a3 domain:(int64_t)a4 accessGroup:(id)a5;
- (NEKeychainItem)initWithPersistentReference:(id)a3 domain:(int64_t)a4;
- (NEKeychainItem)initWithPersistentReference:(id)a3 domain:(int64_t)a4 accessGroup:(id)a5;
- (NEKeychainItem)initWithPersistentReference:(id)a3 keyReference:(id)a4 isModernSystem:(BOOL)a5 domain:(int64_t)a6 accessGroup:(id)a7;
- (NSData)data;
- (NSData)keyPersistentReference;
- (NSData)persistentReference;
- (NSString)accessGroup;
- (NSString)identifier;
- (NSString)password;
- (id)copyData;
- (id)copyPassword;
- (id)copyQueryWithReturnTypes:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (int64_t)domain;
- (uint64_t)copyDataFromKeychainItem:(void *)a1 outData:(const __CFData *)a2 outIdentifier:(void *)a3 outPersistentReference:(void *)a4;
- (void)encodeWithCoder:(id)a3;
- (void)migrateFromPreferences:(__SCPreferences *)a3;
- (void)remove;
- (void)setAccessGroup:(id)a3;
- (void)setData:(id)a3;
- (void)setDomain:(int64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setKeyPersistentReference:(id)a3;
- (void)setPassword:(id)a3;
- (void)setPersistentReference:(id)a3;
- (void)syncUsingConfiguration:(id)a3 accountName:(id)a4 passwordType:(int64_t)a5 identifierSuffix:(id)a6;
@end

@implementation NEKeychainItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oldItem, 0);
  objc_storeStrong((id *)&self->_accessGroup, 0);
  objc_storeStrong((id *)&self->_keyPersistentReference, 0);
  objc_storeStrong((id *)&self->_persistentReference, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_password, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

- (void)setAccessGroup:(id)a3
{
}

- (NSString)accessGroup
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDomain:(int64_t)a3
{
  self->_domain = a3;
}

- (int64_t)domain
{
  return self->_domain;
}

- (BOOL)isModernSystem
{
  return self->_isModernSystem;
}

- (void)setKeyPersistentReference:(id)a3
{
}

- (NSData)keyPersistentReference
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void)migrateFromPreferences:(__SCPreferences *)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = [(NEKeychainItem *)self copyData];
  if (!v4)
  {
    v5 = [(NEKeychainItem *)self identifier];
    id v4 = (id)_SCPreferencesSystemKeychainPasswordItemCopy();

    if (v4)
    {
      v6 = [(NEKeychainItem *)self identifier];
      int v7 = _SCPreferencesSystemKeychainPasswordItemRemove();

      if (v7)
      {
        [(NEKeychainItem *)self setData:v4];
      }
      else
      {
        v8 = ne_log_obj();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          v9 = [(NEKeychainItem *)self identifier];
          int v10 = SCError();
          int v11 = 138412546;
          v12 = v9;
          __int16 v13 = 2080;
          v14 = SCErrorString(v10);
          _os_log_error_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_ERROR, "%@: _SCPreferencesSystemKeychainPasswordItemRemove failed: %s", (uint8_t *)&v11, 0x16u);
        }
      }
    }
  }
}

- (void)syncUsingConfiguration:(id)a3 accountName:(id)a4 passwordType:(int64_t)a5 identifierSuffix:(id)a6
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  id v86 = a3;
  id v84 = a4;
  id v85 = a6;
  int v10 = self;
  objc_sync_enter(v10);
  if (!v10 || !v10->_legacy)
  {
    int v11 = [(NEKeychainItem *)v10 identifier];
    if (v11)
    {
      v12 = [(NEKeychainItem *)v10 identifier];
      __int16 v13 = [v86 identifier];
      v14 = [v13 UUIDString];
      char v15 = [v12 hasPrefix:v14];

      if ((v15 & 1) == 0)
      {
        if (!v10->_data)
        {
          uint64_t v16 = [(NEKeychainItem *)v10 copyData];
          data = v10->_data;
          v10->_data = (NSData *)v16;
        }
        identifier = v10->_identifier;
        v10->_identifier = 0;

        persistentReference = v10->_persistentReference;
        v10->_persistentReference = 0;
      }
    }
  }
  if (!v10->_data)
  {
    v20 = [(NEKeychainItem *)v10 identifier];
    if (v20)
    {
    }
    else
    {
      v21 = [(NEKeychainItem *)v10 persistentReference];

      if (!v21) {
        goto LABEL_63;
      }
    }
  }
  v23 = ne_log_obj();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = [(NEKeychainItem *)v10 identifier];
    v25 = [(NEKeychainItem *)v10 persistentReference];
    v26 = v10->_data;
    *(_DWORD *)buf = 138412802;
    *(void *)&buf[4] = v24;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v25;
    *(_WORD *)&buf[22] = 2048;
    v90 = v26;
    _os_log_impl(&dword_19DDAF000, v23, OS_LOG_TYPE_DEFAULT, "Adding/Updating keychain item with identifier %@, persistentReference %@, data %p", buf, 0x20u);
  }
  id v83 = v86;
  id v27 = v84;
  id v82 = v85;
  v28 = v10;
  objc_sync_enter(v28);
  if (NEInitCFTypes_onceToken != -1) {
    dispatch_once(&NEInitCFTypes_onceToken, &__block_literal_global_24415);
  }
  id v87 = 0;
  id v88 = 0;
  int v29 = -[NEKeychainItem copyDataFromKeychainItem:outData:outIdentifier:outPersistentReference:](v28, 0, &v88, &v87);
  id v30 = v88;
  id v31 = v88;
  v32 = (NSData *)v87;
  if (!v29)
  {
    p_super = ne_log_obj();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      v43 = [(NEKeychainItem *)v28 identifier];
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v43;
      _os_log_error_impl(&dword_19DDAF000, p_super, OS_LOG_TYPE_ERROR, "%@: Failed to retrieve keychain item from the keychain", buf, 0xCu);
    }
    goto LABEL_61;
  }
  if (v10->_data)
  {
    id v33 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v34 = @"VPN Password";
    if (a5 == 1) {
      v34 = @"IPSec XAuth Password";
    }
    if (a5 == 2) {
      v34 = @"IPSec Shared Secret";
    }
    CFDictionaryRef query = (CFDictionaryRef)v34;
    v35 = [(NEKeychainItem *)v28 identifier];
    BOOL v36 = v35 == 0;

    if (v36)
    {
      if ([v82 length])
      {
        id v37 = [NSString alloc];
        v38 = [v83 identifier];
        v39 = [v38 UUIDString];
        uint64_t v40 = [v37 initWithFormat:@"%@.%@", v39, v82];
        v41 = v28->_identifier;
        v28->_identifier = (NSString *)v40;
      }
      else
      {
        v38 = [v83 identifier];
        uint64_t v53 = [v38 UUIDString];
        v39 = v28->_identifier;
        v28->_identifier = (NSString *)v53;
      }
    }
    v54 = [(NEKeychainItem *)v28 identifier];
    v55 = (void *)*MEMORY[0x1E4F3B850];
    [v33 setObject:v54 forKeyedSubscript:*MEMORY[0x1E4F3B850]];

    v56 = [v83 name];
    [v33 setObject:v56 forKeyedSubscript:*MEMORY[0x1E4F3B788]];

    [v33 setObject:query forKeyedSubscript:*MEMORY[0x1E4F3B678]];
    if (v27) {
      [v33 setObject:v27 forKeyedSubscript:*MEMORY[0x1E4F3B5C0]];
    }
    [v33 setObject:v10->_data forKeyedSubscript:*MEMORY[0x1E4F3BD38]];
    [v33 setObject:*MEMORY[0x1E4F3B570] forKeyedSubscript:*MEMORY[0x1E4F3B558]];
    v57 = [(NEKeychainItem *)v28 accessGroup];
    BOOL v58 = v57 == 0;

    if (!v58)
    {
      v59 = [(NEKeychainItem *)v28 accessGroup];
      [v33 setObject:v59 forKeyedSubscript:*MEMORY[0x1E4F3B550]];
    }
    if (v31)
    {
      uint64_t v60 = *MEMORY[0x1E4F3B988];
      CFTypeRef result = (CFTypeRef)*MEMORY[0x1E4F3B978];
      id v95 = v55;
      *(void *)buf = v60;
      *(void *)&buf[8] = v31;
      uint64_t v96 = *MEMORY[0x1E4F3BD20];
      *(void *)&buf[16] = *MEMORY[0x1E4F1CFD0];
      CFDictionaryRef v61 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&result count:3];
      OSStatus v62 = SecItemUpdate(v61, (CFDictionaryRef)v33);
      if (v62)
      {
        v63 = ne_log_obj();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        {
          uint64_t v74 = [(NEKeychainItem *)v28 identifier];
          *(_DWORD *)v93 = 138412546;
          *(void *)&v93[4] = v74;
          *(_WORD *)&v93[12] = 1024;
          *(_DWORD *)&v93[14] = v62;
          v75 = (void *)v74;
          _os_log_error_impl(&dword_19DDAF000, v63, OS_LOG_TYPE_ERROR, "%@: SecItemUpdate failed: %d", v93, 0x12u);
        }
      }
      else
      {
        [(NEKeychainItem *)v28 setData:0];
      }
    }
    else
    {
      CFTypeRef result = 0;

      [v33 setObject:*MEMORY[0x1E4F3B988] forKeyedSubscript:*MEMORY[0x1E4F3B978]];
      [v33 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F3BC78]];
      [v33 setObject:*MEMORY[0x1E4F1CFD0] forKeyedSubscript:*MEMORY[0x1E4F3BD20]];
      OSStatus v64 = SecItemAdd((CFDictionaryRef)v33, &result);
      if (v64)
      {
        v65 = ne_log_obj();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
        {
          v76 = [(NEKeychainItem *)v28 identifier];
          *(_DWORD *)buf = 138412546;
          *(void *)&buf[4] = v76;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v64;
          _os_log_error_impl(&dword_19DDAF000, v65, OS_LOG_TYPE_ERROR, "%@: SecItemAdd failed: %d", buf, 0x12u);
        }
        v32 = 0;
      }
      else
      {
        if (result && (uint64_t v73 = CFDATA_TYPE, CFGetTypeID(result) == v73))
        {
          if (CFDataGetLength((CFDataRef)result) <= 0) {
            v32 = 0;
          }
          else {
            v32 = (NSData *)result;
          }
        }
        else
        {
          v32 = 0;
        }
        [(NEKeychainItem *)v28 setData:0];
      }
    }

LABEL_57:
    if (!v31) {
      goto LABEL_59;
    }
    goto LABEL_58;
  }
  v44 = [(NEKeychainItem *)v28 accessGroup];
  if (v44) {
    BOOL v45 = v31 == 0;
  }
  else {
    BOOL v45 = 1;
  }
  int v46 = !v45;

  if (!v46) {
    goto LABEL_57;
  }
  v47 = (const void *)*MEMORY[0x1E4F3B988];
  uint64_t v48 = *MEMORY[0x1E4F3B850];
  *(void *)v93 = *MEMORY[0x1E4F3B978];
  *(void *)&v93[8] = v48;
  CFTypeRef result = v47;
  id v95 = v31;
  *(void *)&v93[16] = *MEMORY[0x1E4F3BD20];
  uint64_t v96 = *MEMORY[0x1E4F1CFD0];
  CFDictionaryRef querya = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&result forKeys:v93 count:3];
  uint64_t v91 = *MEMORY[0x1E4F3B550];
  v49 = [(NEKeychainItem *)v28 accessGroup];
  v92 = v49;
  CFDictionaryRef v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v92 forKeys:&v91 count:1];

  OSStatus v51 = SecItemUpdate(querya, v50);
  if (v51)
  {
    v52 = ne_log_obj();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      v79 = [(NEKeychainItem *)v28 identifier];
      uint64_t v77 = [(NEKeychainItem *)v28 accessGroup];
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = v79;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v77;
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v90) = v51;
      v78 = (void *)v77;
      _os_log_error_impl(&dword_19DDAF000, v52, OS_LOG_TYPE_ERROR, "%@: SecItemUpdate failed while updating the keychain access group to %@: %d", buf, 0x1Cu);
    }
  }
  [(NEKeychainItem *)v28 setAccessGroup:0];

LABEL_58:
  objc_storeStrong((id *)&v28->_identifier, v30);
LABEL_59:
  if (v32)
  {
    p_super = &v28->_persistentReference->super;
    v28->_persistentReference = v32;
    v32 = v32;
LABEL_61:
  }
  objc_sync_exit(v28);

LABEL_63:
  if (objc_getProperty(v10, v22, 72, 1))
  {
    v66 = ne_log_obj();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      id v68 = objc_getProperty(v10, v67, 72, 1);
      v69 = [v68 identifier];
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v69;
      _os_log_impl(&dword_19DDAF000, v66, OS_LOG_TYPE_DEFAULT, "%@: Removing keychain item", buf, 0xCu);
    }
    id v71 = objc_getProperty(v10, v70, 72, 1);
    [v71 remove];
  }
  [(NEKeychainItem *)v10 setData:0];
  objc_setProperty_atomic_copy(v10, v72, 0, 72);
  objc_sync_exit(v10);
}

- (uint64_t)copyDataFromKeychainItem:(void *)a1 outData:(const __CFData *)a2 outIdentifier:(void *)a3 outPersistentReference:(void *)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  CFTypeRef result = 0;
  v9 = [a1 identifier];
  if (v9)
  {

    goto LABEL_5;
  }
  int v10 = [a1 persistentReference];

  if (v10)
  {
LABEL_5:
    if (a2) {
      [v8 addObject:*MEMORY[0x1E4F3BC70]];
    }
    if (a3) {
      [v8 addObject:*MEMORY[0x1E4F3BC68]];
    }
    if (a4) {
      [v8 addObject:*MEMORY[0x1E4F3BC78]];
    }
    int v11 = (void *)[a1 copyQueryWithReturnTypes:v8];
    [v11 setObject:*MEMORY[0x1E4F3BB90] forKeyedSubscript:*MEMORY[0x1E4F3BB80]];
    OSStatus v12 = SecItemCopyMatching((CFDictionaryRef)v11, &result);
    OSStatus v13 = v12;
    if (v12)
    {
      if (v12 == -25300)
      {
LABEL_56:
        if (result) {
          CFRelease(result);
        }
        if (v13) {
          BOOL v25 = v13 == -25300;
        }
        else {
          BOOL v25 = 1;
        }
        uint64_t v20 = v25;

        goto LABEL_65;
      }
      v14 = ne_log_obj();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        char v15 = [a1 identifier];
        *(_DWORD *)buf = 138412546;
        int v29 = v15;
        __int16 v30 = 1024;
        OSStatus v31 = v13;
        _os_log_error_impl(&dword_19DDAF000, v14, OS_LOG_TYPE_ERROR, "%@: SecItemCopyMatching failed: %d", buf, 0x12u);
      }
    }
    else if ([v8 count] == 1)
    {
      if (a2)
      {
        uint64_t v16 = (id)result;
        if (isa_nsdata(v16))
        {
          if (+[NSData isSensitiveDataInstance:](MEMORY[0x1E4F1C9B8], v16)) {
            CFDataRef v17 = v16;
          }
          else {
            CFDataRef v17 = +[NSData sensitiveDataWithData:](MEMORY[0x1E4F1C9B8], v16);
          }
          *a2 = v17;
        }
      }
      if (a3)
      {
        v21 = (id)result;
        if (isa_nsdictionary(v21))
        {
          v22 = [v21 objectForKeyedSubscript:*MEMORY[0x1E4F3B850]];
          if (isa_nsstring(v22) && [v22 length]) {
            *a3 = (id)[[NSString alloc] initWithString:v22];
          }
        }
      }
      if (!a4) {
        goto LABEL_56;
      }
      v14 = (id)result;
      if (isa_nsdata(v14) && [v14 length]) {
        *a4 = (id)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithData:v14];
      }
    }
    else
    {
      v14 = (id)result;
      if (isa_nsdictionary(v14))
      {
        if (a2)
        {
          v18 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F3BD38]];
          if (isa_nsdata(v18) && [v18 length] && isa_nsdata(v18))
          {
            if (+[NSData isSensitiveDataInstance:](MEMORY[0x1E4F1C9B8], v18)) {
              CFDataRef v19 = v18;
            }
            else {
              CFDataRef v19 = +[NSData sensitiveDataWithData:](MEMORY[0x1E4F1C9B8], v18);
            }
            *a2 = v19;
          }
        }
        if (a3)
        {
          v23 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F3B850]];
          if (isa_nsstring(v23) && [v23 length]) {
            *a3 = (id)[[NSString alloc] initWithString:v23];
          }
        }
        if (a4)
        {
          v24 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F3BD40]];
          if (isa_nsdata(v24) && [v24 length]) {
            *a4 = (id)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithData:v24];
          }
        }
      }
    }

    goto LABEL_56;
  }
  uint64_t v20 = 1;
LABEL_65:

  return v20;
}

- (void)remove
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = [(NEKeychainItem *)self identifier];
  if (v3)
  {
  }
  else
  {
    id v4 = [(NEKeychainItem *)self persistentReference];

    if (!v4) {
      return;
    }
  }
  CFDictionaryRef v5 = [(NEKeychainItem *)self copyQueryWithReturnTypes:0];
  OSStatus v6 = SecItemDelete(v5);
  if (v6)
  {
    OSStatus v7 = v6;
    id v8 = ne_log_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = [(NEKeychainItem *)self identifier];
      int v10 = 138412546;
      int v11 = v9;
      __int16 v12 = 1024;
      OSStatus v13 = v7;
      _os_log_error_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_ERROR, "%@: SecItemDelete failed: %d", (uint8_t *)&v10, 0x12u);
    }
  }
  [(NEKeychainItem *)self setIdentifier:0];
  [(NEKeychainItem *)self setPersistentReference:0];
}

- (id)copyData
{
  id v4 = 0;
  -[NEKeychainItem copyDataFromKeychainItem:outData:outIdentifier:outPersistentReference:](self, (const __CFData **)&v4, 0, 0);
  id v2 = v4;

  return v2;
}

- (id)copyPassword
{
  id v2 = [(NEKeychainItem *)self copyData];
  if (v2) {
    v3 = (void *)[[NSString alloc] initWithData:v2 encoding:4];
  }
  else {
    v3 = 0;
  }

  return v3;
}

- (id)copyQueryWithReturnTypes:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v5 setObject:*MEMORY[0x1E4F3B988] forKeyedSubscript:*MEMORY[0x1E4F3B978]];
  OSStatus v6 = [(NEKeychainItem *)self identifier];

  if (v6)
  {
    OSStatus v7 = [(NEKeychainItem *)self identifier];
    id v8 = (void *)MEMORY[0x1E4F3B850];
  }
  else
  {
    v9 = [(NEKeychainItem *)self persistentReference];

    if (!v9) {
      goto LABEL_6;
    }
    OSStatus v7 = [(NEKeychainItem *)self persistentReference];
    id v8 = (void *)MEMORY[0x1E4F3BD40];
  }
  [v5 setObject:v7 forKeyedSubscript:*v8];

LABEL_6:
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = v4;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    uint64_t v14 = MEMORY[0x1E4F1CC38];
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, *(void *)(*((void *)&v17 + 1) + 8 * v15++), (void)v17);
      }
      while (v12 != v15);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F3BD20]];
  return v5;
}

- (NSData)data
{
  id v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_data;
  objc_sync_exit(v2);

  return v3;
}

- (void)setData:(id)a3
{
  id v8 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  CFDataRef v5 = +[NSData sensitiveDataWithData:](MEMORY[0x1E4F1C9B8], v8);
  data = v4->_data;
  v4->_data = (NSData *)v5;

  password = v4->_password;
  v4->_password = 0;

  objc_sync_exit(v4);
}

- (NSString)password
{
  id v2 = self;
  objc_sync_enter(v2);
  password = (NSData *)v2->_password;
  if (!password)
  {
    password = v2->_data;
    if (password)
    {
      uint64_t v4 = [[NSString alloc] initWithData:v2->_data encoding:4];
      CFDataRef v5 = v2->_password;
      v2->_password = (NSString *)v4;

      password = (NSData *)v2->_password;
    }
  }
  OSStatus v6 = password;
  objc_sync_exit(v2);

  return (NSString *)v6;
}

- (void)setPassword:(id)a3
{
  id v11 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  if ([v11 length])
  {
    CFDataRef v5 = [v11 dataUsingEncoding:4];
    CFDataRef v6 = +[NSData sensitiveDataWithData:](MEMORY[0x1E4F1C9B8], v5);
    data = v4->_data;
    v4->_data = (NSData *)v6;

    uint64_t v8 = [[NSString alloc] initWithString:v11];
    password = v4->_password;
    v4->_password = (NSString *)v8;
  }
  else
  {
    id v10 = v4->_data;
    v4->_data = 0;

    CFDataRef v5 = v4->_password;
    v4->_password = 0;
  }

  objc_sync_exit(v4);
}

- (void)setPersistentReference:(id)a3
{
  id v13 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  persistentReference = v4->_persistentReference;
  if (v13 && !persistentReference)
  {
LABEL_3:
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithData:v13];
LABEL_4:
    OSStatus v7 = v4->_persistentReference;
    v4->_persistentReference = (NSData *)v6;

    identifier = v4->_identifier;
    v4->_identifier = 0;

    data = v4->_data;
    v4->_data = 0;

    password = v4->_password;
    v4->_password = 0;

    goto LABEL_7;
  }
  if (persistentReference && ([(NSData *)persistentReference isEqual:v13] & 1) == 0)
  {
    if (v4->_persistentReference)
    {
      uint64_t v11 = [(NEKeychainItem *)v4 copy];
      oldItem = v4->_oldItem;
      v4->_oldItem = (NEKeychainItem *)v11;
    }
    uint64_t v6 = (uint64_t)v13;
    if (!v13) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
LABEL_7:
  objc_sync_exit(v4);
}

- (NSData)persistentReference
{
  id v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_persistentReference;
  objc_sync_exit(v2);

  return v3;
}

- (void)setIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  CFDataRef v5 = self;
  objc_sync_enter(v5);
  identifier = v5->_identifier;
  if (v4 && !identifier || identifier && ![(NSString *)identifier isEqualToString:v4])
  {
    OSStatus v7 = ne_log_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v15 = v5->_identifier;
      int v16 = 138412546;
      long long v17 = v15;
      __int16 v18 = 2112;
      id v19 = v4;
      _os_log_debug_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_DEBUG, "setIdentifier: old %@, new %@", (uint8_t *)&v16, 0x16u);
    }

    if (v5->_identifier)
    {
      uint64_t v8 = [(NEKeychainItem *)v5 copy];
      oldItem = v5->_oldItem;
      v5->_oldItem = (NEKeychainItem *)v8;
    }
    if (v4) {
      uint64_t v10 = [[NSString alloc] initWithString:v4];
    }
    else {
      uint64_t v10 = 0;
    }
    uint64_t v11 = v5->_identifier;
    v5->_identifier = (NSString *)v10;

    persistentReference = v5->_persistentReference;
    v5->_persistentReference = 0;

    data = v5->_data;
    v5->_data = 0;

    password = v5->_password;
    v5->_password = 0;
  }
  objc_sync_exit(v5);
}

- (NSString)identifier
{
  id v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_identifier;
  objc_sync_exit(v2);

  return v3;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  OSStatus v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:0];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v9 = [(NEKeychainItem *)self identifier];
  [v7 appendPrettyObject:v9 withName:@"identifier" andIndent:v5 options:isKindOfClass & 1 | a4];

  uint64_t v10 = [(NEKeychainItem *)self persistentReference];
  [v7 appendPrettyObject:v10 withName:@"persistentReference" andIndent:v5 options:a4];

  uint64_t v11 = [(NEKeychainItem *)self keyPersistentReference];

  if (v11)
  {
    uint64_t v12 = [(NEKeychainItem *)self keyPersistentReference];
    [v7 appendPrettyObject:v12 withName:@"keyPersistentReference" andIndent:v5 options:a4];
  }
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEKeychainItem isModernSystem](self, "isModernSystem"), @"isModernSystem", v5, a4);
  if ([(NEKeychainItem *)self domain]) {
    id v13 = @"user";
  }
  else {
    id v13 = @"system";
  }
  [v7 appendPrettyObject:v13 withName:@"domain" andIndent:v5 options:a4];
  uint64_t v14 = [(NEKeychainItem *)self accessGroup];
  [v7 appendPrettyObject:v14 withName:@"accessGroup" andIndent:v5 options:a4];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v5 = [(NEKeychainItem *)self identifier];
  int64_t v6 = [(NEKeychainItem *)self domain];
  OSStatus v7 = [(NEKeychainItem *)self accessGroup];
  uint64_t v8 = [v4 initWithIdentifier:v5 domain:v6 accessGroup:v7];

  v9 = [(NEKeychainItem *)self persistentReference];
  uint64_t v10 = [v9 copy];
  uint64_t v11 = *(void **)(v8 + 32);
  *(void *)(v8 + 32) = v10;

  uint64_t v12 = [(NEKeychainItem *)self keyPersistentReference];
  uint64_t v13 = [v12 copy];
  uint64_t v14 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v13;

  *(unsigned char *)(v8 + 48) = [(NEKeychainItem *)self isModernSystem];
  CFDataRef v15 = +[NSData sensitiveDataWithData:](MEMORY[0x1E4F1C9B8], self->_data);
  int v16 = *(void **)(v8 + 8);
  *(void *)(v8 + 8) = v15;

  *(unsigned char *)(v8 + 49) = self->_legacy;
  return (id)v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  id v4 = [(NEKeychainItem *)self identifier];
  [v8 encodeObject:v4 forKey:@"Identifier"];

  uint64_t v5 = [(NEKeychainItem *)self persistentReference];
  [v8 encodeObject:v5 forKey:@"PersistentReference"];

  int64_t v6 = [(NEKeychainItem *)self keyPersistentReference];
  [v8 encodeObject:v6 forKey:@"KeyPersistentReference"];

  objc_msgSend(v8, "encodeBool:forKey:", -[NEKeychainItem isModernSystem](self, "isModernSystem"), @"IsModernSystem");
  objc_msgSend(v8, "encodeInt32:forKey:", -[NEKeychainItem domain](self, "domain"), @"Domain");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [v8 encodeObject:self->_data forKey:@"Data"];
  }
  [v8 encodeObject:self->_oldItem forKey:@"OldItem"];
  OSStatus v7 = [(NEKeychainItem *)self accessGroup];
  [v8 encodeObject:v7 forKey:@"AccessGroup"];
}

- (NEKeychainItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)NEKeychainItem;
  uint64_t v5 = [(NEKeychainItem *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PersistentReference"];
    persistentReference = v5->_persistentReference;
    v5->_persistentReference = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"KeyPersistentReference"];
    keyPersistentReference = v5->_keyPersistentReference;
    v5->_keyPersistentReference = (NSData *)v10;

    v5->_isModernSystem = [v4 decodeBoolForKey:@"IsModernSystem"];
    v5->_domain = (int)[v4 decodeInt32ForKey:@"Domain"];
    if ([v4 containsValueForKey:@"Password"])
    {
      uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Password"];
      uint64_t v13 = [v12 dataUsingEncoding:4];
      CFDataRef v14 = +[NSData sensitiveDataWithData:](MEMORY[0x1E4F1C9B8], v13);
      data = v5->_data;
      v5->_data = (NSData *)v14;

      password = (NSData *)v5->_password;
      v5->_password = (NSString *)v12;
    }
    else
    {
      uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Data"];
      CFDataRef v17 = +[NSData sensitiveDataWithData:](MEMORY[0x1E4F1C9B8], v13);
      password = v5->_data;
      v5->_data = (NSData *)v17;
    }

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"OldItem"];
    oldItem = v5->_oldItem;
    v5->_oldItem = (NEKeychainItem *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AccessGroup"];
    accessGroup = v5->_accessGroup;
    v5->_accessGroup = (NSString *)v20;
  }
  return v5;
}

- (NEKeychainItem)initWithLegacyIdentifier:(id)a3 domain:(int64_t)a4 accessGroup:(id)a5
{
  CFTypeRef result = [(NEKeychainItem *)self initWithIdentifier:a3 domain:a4 accessGroup:a5];
  if (result) {
    result->_legacy = 1;
  }
  return result;
}

- (NEKeychainItem)initWithPersistentReference:(id)a3 keyReference:(id)a4 isModernSystem:(BOOL)a5 domain:(int64_t)a6 accessGroup:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  v23.receiver = self;
  v23.super_class = (Class)NEKeychainItem;
  CFDataRef v15 = [(NEKeychainItem *)&v23 init];
  if (v15)
  {
    uint64_t v16 = [v12 copy];
    persistentReference = v15->_persistentReference;
    v15->_persistentReference = (NSData *)v16;

    uint64_t v18 = [v13 copy];
    keyPersistentReference = v15->_keyPersistentReference;
    v15->_keyPersistentReference = (NSData *)v18;

    v15->_isModernSystem = a5;
    v15->_domain = a6;
    uint64_t v20 = [v14 copy];
    accessGroup = v15->_accessGroup;
    v15->_accessGroup = (NSString *)v20;
  }
  return v15;
}

- (NEKeychainItem)initWithPersistentReference:(id)a3 domain:(int64_t)a4 accessGroup:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)NEKeychainItem;
  uint64_t v10 = [(NEKeychainItem *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    persistentReference = v10->_persistentReference;
    v10->_persistentReference = (NSData *)v11;

    v10->_domain = a4;
    uint64_t v13 = [v9 copy];
    accessGroup = v10->_accessGroup;
    v10->_accessGroup = (NSString *)v13;
  }
  return v10;
}

- (NEKeychainItem)initWithIdentifier:(id)a3 domain:(int64_t)a4 accessGroup:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)NEKeychainItem;
  uint64_t v10 = [(NEKeychainItem *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v11;

    v10->_domain = a4;
    uint64_t v13 = [v9 copy];
    accessGroup = v10->_accessGroup;
    v10->_accessGroup = (NSString *)v13;
  }
  return v10;
}

- (NEKeychainItem)initWithData:(id)a3 domain:(int64_t)a4 accessGroup:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)NEKeychainItem;
  uint64_t v10 = [(NEKeychainItem *)&v16 init];
  if (v10)
  {
    CFDataRef v11 = +[NSData sensitiveDataWithData:](MEMORY[0x1E4F1C9B8], v8);
    data = v10->_data;
    v10->_data = (NSData *)v11;

    v10->_domain = a4;
    uint64_t v13 = [v9 copy];
    accessGroup = v10->_accessGroup;
    v10->_accessGroup = (NSString *)v13;
  }
  return v10;
}

- (NEKeychainItem)initWithPassword:(id)a3 domain:(int64_t)a4 accessGroup:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  CFDataRef v11 = [v9 dataUsingEncoding:4];
  id v12 = [(NEKeychainItem *)self initWithData:v11 domain:a4 accessGroup:v10];

  if (v12) {
    objc_storeStrong((id *)&v12->_password, a3);
  }

  return v12;
}

- (NEKeychainItem)initWithLegacyIdentifier:(id)a3 domain:(int64_t)a4
{
  return [(NEKeychainItem *)self initWithLegacyIdentifier:a3 domain:a4 accessGroup:0];
}

- (NEKeychainItem)initWithPersistentReference:(id)a3 domain:(int64_t)a4
{
  return [(NEKeychainItem *)self initWithPersistentReference:a3 domain:a4 accessGroup:0];
}

- (NEKeychainItem)initWithIdentifier:(id)a3 domain:(int64_t)a4
{
  return [(NEKeychainItem *)self initWithIdentifier:a3 domain:a4 accessGroup:0];
}

- (NEKeychainItem)initWithData:(id)a3 domain:(int64_t)a4
{
  return [(NEKeychainItem *)self initWithData:a3 domain:a4 accessGroup:0];
}

- (NEKeychainItem)initWithPassword:(id)a3 domain:(int64_t)a4
{
  return [(NEKeychainItem *)self initWithPassword:a3 domain:a4 accessGroup:0];
}

@end