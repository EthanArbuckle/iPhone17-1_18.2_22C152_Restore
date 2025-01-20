@interface KeychainWrapper
+ (id)keychainPasswordForMACAddress:(id)a3;
+ (id)keychainWrapperWithMACAddress:(id)a3;
+ (void)removeKeychainPasswordForMACAddress:(id)a3;
- (KeychainWrapper)initWithAccountName:(id)a3 serviceName:(id)a4;
- (NSLock)lock;
- (NSString)accountName;
- (NSString)serviceName;
- (id)genericPassword;
- (id)genericPasswordQuery;
- (id)getGenericPassword;
- (id)getPasswordFromQuery:(id)a3;
- (int)addGenericPassword:(id)a3 withLabel:(id)a4 andDescription:(id)a5;
- (void)dealloc;
- (void)removeGenericPassword;
- (void)setAccountName:(id)a3;
- (void)setLock:(id)a3;
- (void)setServiceName:(id)a3;
@end

@implementation KeychainWrapper

+ (id)keychainWrapperWithMACAddress:(id)a3
{
  if (!a3) {
    return 0;
  }
  v4 = [KeychainWrapper alloc];
  v6 = sub_22685DC10(a3, 0, v5);
  uint64_t v7 = sub_22685D62C(@"keychainBaseStationType", @"AirPortSettings");
  v9 = objc_msgSend_initWithAccountName_serviceName_(v4, v8, (uint64_t)v6, v7);

  return v9;
}

- (KeychainWrapper)initWithAccountName:(id)a3 serviceName:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)KeychainWrapper;
  v6 = [(KeychainWrapper *)&v13 init];
  v8 = v6;
  if (v6)
  {
    objc_msgSend_setAccountName_(v6, v7, (uint64_t)a3);
    objc_msgSend_setServiceName_(v8, v9, (uint64_t)a4);
    id v10 = objc_alloc_init(MEMORY[0x263F08958]);
    objc_msgSend_setLock_(v8, v11, (uint64_t)v10);
  }
  return v8;
}

- (void)dealloc
{
  objc_msgSend_setAccountName_(self, a2, 0);
  objc_msgSend_setServiceName_(self, v3, 0);
  objc_msgSend_setLock_(self, v4, 0);
  v5.receiver = self;
  v5.super_class = (Class)KeychainWrapper;
  [(KeychainWrapper *)&v5 dealloc];
}

+ (id)keychainPasswordForMACAddress:(id)a3
{
  if (!objc_msgSend_length(a3, a2, (uint64_t)a3)) {
    return 0;
  }
  uint64_t v5 = objc_msgSend_keychainWrapperWithMACAddress_(KeychainWrapper, v4, (uint64_t)a3);
  if (!v5) {
    return 0;
  }

  return (id)MEMORY[0x270F9A6D0](v5, sel_genericPassword, v6);
}

+ (void)removeKeychainPasswordForMACAddress:(id)a3
{
  if (objc_msgSend_length(a3, a2, (uint64_t)a3))
  {
    uint64_t v5 = objc_msgSend_keychainWrapperWithMACAddress_(KeychainWrapper, v4, (uint64_t)a3);
    if (v5)
    {
      objc_msgSend_removeGenericPassword(v5, v6, v7);
    }
  }
}

- (id)genericPasswordQuery
{
  id result = (id)objc_msgSend_accountName(self, a2, v2);
  if (result)
  {
    uint64_t v7 = NSDictionary;
    uint64_t v8 = *MEMORY[0x263F171C8];
    uint64_t v9 = *MEMORY[0x263F171B8];
    uint64_t v10 = objc_msgSend_accountName(self, v5, v6);
    return (id)objc_msgSend_dictionaryWithObjectsAndKeys_(v7, v11, v8, v9, v10, *MEMORY[0x263F16ED8], 0, @"sync", 0);
  }
  return result;
}

- (id)getPasswordFromQuery:(id)a3
{
  CFTypeRef result = 0;
  if (!a3) {
    return 0;
  }
  CFDictionaryRef v34 = 0;
  int v12 = sub_22685FC7C((const __CFAllocator *)*MEMORY[0x263EFFB08], (CFTypeRef *)&v34, (uint64_t)"{%##O%kO=%O}", v3, v4, v5, v6, v7, (uint64_t)a3);
  id v13 = 0;
  CFDictionaryRef v14 = v34;
  if (v12) {
    BOOL v15 = 1;
  }
  else {
    BOOL v15 = v34 == 0;
  }
  if (!v15)
  {
    if (dword_268148120 <= 800)
    {
      if (dword_268148120 != -1 || (v16 = sub_226865630((uint64_t)&dword_268148120, 0x320u), CFDictionaryRef v14 = v34, v16))
      {
        sub_226865EB4((uint64_t)&dword_268148120, (uint64_t)"-[KeychainWrapper getPasswordFromQuery:]", 800, (uint64_t)"SecItemCopyMatching tempDict: %@\n", v8, v9, v10, v11, (uint64_t)v14);
        CFDictionaryRef v14 = v34;
      }
    }
    uint64_t v23 = SecItemCopyMatching(v14, &result);
    if (v34)
    {
      CFRelease(v34);
      CFDictionaryRef v34 = 0;
    }
    if (dword_268148120 <= 800 && (dword_268148120 != -1 || sub_226865630((uint64_t)&dword_268148120, 0x320u))) {
      sub_226865EB4((uint64_t)&dword_268148120, (uint64_t)"-[KeychainWrapper getPasswordFromQuery:]", 800, (uint64_t)"SecItemCopyMatching err: %#m\n", v19, v20, v21, v22, v23);
    }
    if (v23 == -25300)
    {
      id v13 = 0;
    }
    else
    {
      id v13 = 0;
      if (objc_msgSend_length((void *)result, v17, v18) && !v23)
      {
        id v24 = [NSString alloc];
        uint64_t v27 = objc_msgSend_bytes((void *)result, v25, v26);
        uint64_t v30 = objc_msgSend_length((void *)result, v28, v29);
        id v13 = (id)objc_msgSend_initWithBytes_length_encoding_(v24, v31, v27, v30, 4);
      }
    }
  }
  if (result) {
    CFRelease(result);
  }
  return v13;
}

- (id)getGenericPassword
{
  id result = (id)objc_msgSend_genericPasswordQuery(self, a2, v2);
  if (result)
  {
    return (id)MEMORY[0x270F9A6D0](self, sel_getPasswordFromQuery_, result);
  }
  return result;
}

- (id)genericPassword
{
  uint64_t v4 = objc_msgSend_lock(self, a2, v2);
  objc_msgSend_lock(v4, v5, v6);
  GenericPassword = objc_msgSend_getGenericPassword(self, v7, v8);
  int v12 = objc_msgSend_lock(self, v10, v11);
  objc_msgSend_unlock(v12, v13, v14);
  return GenericPassword;
}

- (int)addGenericPassword:(id)a3 withLabel:(id)a4 andDescription:(id)a5
{
  CFTypeRef result = 0;
  CFDictionaryRef v10 = (const __CFDictionary *)objc_msgSend_genericPasswordQuery(self, a2, (uint64_t)a3);
  if (dword_268148120 <= 800 && (dword_268148120 != -1 || sub_226865630((uint64_t)&dword_268148120, 0x320u)))
  {
    objc_msgSend_serviceName(self, v8, v9);
    objc_msgSend_accountName(self, v11, v12);
    sub_226865EB4((uint64_t)&dword_268148120, (uint64_t)"-[KeychainWrapper addGenericPassword:withLabel:andDescription:]", 800, (uint64_t)"query: %@ self.serviceName: %@ self.accountName: %@\n", v13, v14, v15, v16, (uint64_t)v10);
  }
  v17 = objc_msgSend_serviceName(self, v8, v9);
  if (!objc_msgSend_length(v17, v18, v19))
  {
    LODWORD(v26) = 0;
    goto LABEL_48;
  }
  uint64_t v22 = objc_msgSend_accountName(self, v20, v21);
  LODWORD(v26) = 0;
  if (objc_msgSend_length(v22, v23, v24) && v10)
  {
    CFDictionaryRef query = 0;
    uint64_t v27 = objc_msgSend_dataUsingEncoding_(a3, v25, 4);
    if (!v27)
    {
      LODWORD(v26) = -6705;
      goto LABEL_48;
    }
    uint64_t v30 = (void *)v27;
    if (dword_268148120 <= 800 && (dword_268148120 != -1 || sub_226865630((uint64_t)&dword_268148120, 0x320u)))
    {
      uint64_t v31 = objc_msgSend_length(v30, v28, v29);
      sub_226865EB4((uint64_t)&dword_268148120, (uint64_t)"-[KeychainWrapper addGenericPassword:withLabel:andDescription:]", 800, (uint64_t)"data (length): %ld\n", v32, v33, v34, v35, v31);
    }
    v36 = objc_msgSend_lock(self, v28, v29);
    objc_msgSend_lock(v36, v37, v38);
    CFAllocatorRef v39 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    LODWORD(v26) = sub_22685FC7C((const __CFAllocator *)*MEMORY[0x263EFFB08], (CFTypeRef *)&query, (uint64_t)"{%##O%kO=%O%kO=%O}", v40, v41, v42, v43, v44, (uint64_t)v10);
    if (v26) {
      goto LABEL_47;
    }
    CFDictionaryRef v51 = query;
    if (query)
    {
      if (dword_268148120 <= 800)
      {
        if (dword_268148120 != -1 || (v52 = sub_226865630((uint64_t)&dword_268148120, 0x320u), CFDictionaryRef v51 = query, v52))
        {
          sub_226865EB4((uint64_t)&dword_268148120, (uint64_t)"-[KeychainWrapper addGenericPassword:withLabel:andDescription:]", 800, (uint64_t)"SecItemCopyMatching tempDict: %@\n", v47, v48, v49, v50, (uint64_t)v51);
          CFDictionaryRef v51 = query;
        }
      }
      uint64_t v26 = SecItemCopyMatching(v51, &result);
      if (query)
      {
        CFRelease(query);
        CFDictionaryRef query = 0;
      }
      if (dword_268148120 <= 800 && (dword_268148120 != -1 || sub_226865630((uint64_t)&dword_268148120, 0x320u))) {
        sub_226865EB4((uint64_t)&dword_268148120, (uint64_t)"-[KeychainWrapper addGenericPassword:withLabel:andDescription:]", 800, (uint64_t)"SecItemCopyMatching err: %#m\n", v55, v56, v57, v58, v26);
      }
      if (v26 == -25300) {
        LODWORD(v26) = 0;
      }
      if (result)
      {
        uint64_t v59 = *MEMORY[0x263F175A8];
        v60 = objc_msgSend_objectForKey_((void *)result, v53, *MEMORY[0x263F175A8]);
        if (objc_msgSend_isEqual_(v60, v61, (uint64_t)v30))
        {
          v68 = objc_msgSend_objectForKey_((void *)result, v62, *MEMORY[0x263F17000]);
          if (objc_msgSend_isEqual_(v68, v69, (uint64_t)a4)) {
            goto LABEL_47;
          }
        }
        LODWORD(v26) = sub_22685FC7C(v39, (CFTypeRef *)&query, (uint64_t)"{%kO=%O%kO=%O}", v63, v64, v65, v66, v67, v59);
        if (v26) {
          goto LABEL_47;
        }
        v45 = (const char *)query;
        if (query)
        {
          uint64_t v26 = SecItemUpdate(v10, query);
          if (dword_268148120 <= 800 && (dword_268148120 != -1 || sub_226865630((uint64_t)&dword_268148120, 0x320u))) {
            sub_226865EB4((uint64_t)&dword_268148120, (uint64_t)"-[KeychainWrapper addGenericPassword:withLabel:andDescription:]", 800, (uint64_t)"SecItemUpdate err: %#m\n", v70, v71, v72, v73, v26);
          }
LABEL_44:
          if (query)
          {
            CFRelease(query);
            CFDictionaryRef query = 0;
          }
          goto LABEL_47;
        }
      }
      else
      {
        objc_msgSend_serviceName(self, v53, v54);
        LODWORD(v26) = sub_22685FC7C(v39, (CFTypeRef *)&query, (uint64_t)"{%##O%kO=%O%kO=%O%kO=%O%kO=%O}", v74, v75, v76, v77, v78, (uint64_t)v10);
        if (v26)
        {
LABEL_47:
          v83 = objc_msgSend_lock(self, v45, v46);
          objc_msgSend_unlock(v83, v84, v85);
          goto LABEL_48;
        }
        if (query)
        {
          uint64_t v26 = SecItemAdd(query, 0);
          if (dword_268148120 <= 800 && (dword_268148120 != -1 || sub_226865630((uint64_t)&dword_268148120, 0x320u))) {
            sub_226865EB4((uint64_t)&dword_268148120, (uint64_t)"-[KeychainWrapper addGenericPassword:withLabel:andDescription:]", 800, (uint64_t)"SecItemAdd err: %#m\n", v79, v80, v81, v82, v26);
          }
          goto LABEL_44;
        }
      }
    }
    LODWORD(v26) = -6728;
    goto LABEL_47;
  }
LABEL_48:
  if (result) {
    CFRelease(result);
  }
  return v26;
}

- (void)removeGenericPassword
{
  uint64_t v4 = objc_msgSend_genericPasswordQuery(self, a2, v2);
  if (v4)
  {
    if ((CFDictionaryRef v7 = (const __CFDictionary *)v4,
          uint64_t v8 = objc_msgSend_lock(self, v5, v6),
          objc_msgSend_lock(v8, v9, v10),
          OSStatus v11 = SecItemDelete(v7),
          (OSStatus v14 = v11) != 0)
      && v11 != -25300
      || (uint64_t v15 = objc_msgSend_lock(self, v12, v13), objc_msgSend_unlock(v15, v16, v17), v14 != -25300) && v14)
    {
      uint64_t v18 = objc_msgSend_lock(self, v12, v13);
      objc_msgSend_unlock(v18, v19, v20);
    }
  }
}

- (NSString)accountName
{
  return self->_accountName;
}

- (void)setAccountName:(id)a3
{
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (NSLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
}

@end