uint64_t GSSItemGetTypeID()
{
  if (gss_init_once != -1) {
    dispatch_once_f(&gss_init_once, 0, (dispatch_function_t)create_tables);
  }
  return gssitemid;
}

CFURLRef GSSItemAdd(const __CFDictionary *a1, CFErrorRef *a2)
{
  if (gss_init_once == -1)
  {
    if (a1) {
      goto LABEL_3;
    }
  }
  else
  {
    dispatch_once_f(&gss_init_once, 0, (dispatch_function_t)create_tables);
    if (a1)
    {
LABEL_3:
      if (a2) {
        *a2 = 0;
      }
      CFDictionaryRef v4 = copyConfiguration(1, a2);
      if (!v4) {
        return 0;
      }
      v5 = v4;
      CFMutableArrayRef v6 = searchCopyResult(v4, (uint64_t)a1);
      if (v6)
      {
        CFStringRef v7 = (CFStringRef)v6;
      }
      else
      {
        v8 = (CFMutableDictionaryRef *)GSSCreateItem(0);
        if (!v8) {
          goto LABEL_10;
        }
        CFUUIDRef v10 = CFUUIDCreate(0);
        if (v10 && (v11 = v10, CFStringRef v7 = CFUUIDCreateString(0, v10), CFRelease(v11), v7))
        {
          CFDictionarySetValue(v8[2], @"kGSSAttrUUID", v7);
          if ((modifyItem((uint64_t)v8, a1, (CFTypeRef *)a2) & 1) != 0
            && (applyClassItems((uint64_t)v8, v8[2], (void (__cdecl *)(const void *, const void *, void *))validateAttributes, (CFTypeRef *)a2) & 1) != 0)
          {
            updateTransientValues((uint64_t)v8);
            CFDictionarySetValue(v5, v7, v8);
            storeConfiguration(v5);
            goto LABEL_9;
          }
          CFRelease(v8);
        }
        else
        {
          CFStringRef v7 = (CFStringRef)v8;
        }
      }
      v8 = 0;
LABEL_9:
      CFRelease(v7);
LABEL_10:
      CFRelease(v5);
      return (const __CFURL *)v8;
    }
  }
  int v12 = heim_abort();
  return copyConfiguration(v12, v13);
}

CFURLRef copyConfiguration(int a1, CFErrorRef *a2)
{
  CFTypeRef v12 = 0;
  CFTypeRef cf = 0;
  CFURLRef result = copyConfigurationURL();
  if (!result) {
    return result;
  }
  CFURLRef v5 = result;
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFStringRef v7 = CFReadStreamCreateWithFile((CFAllocatorRef)*MEMORY[0x263EFFB08], result);
  CFRelease(v5);
  if (v7)
  {
    if (CFReadStreamOpen(v7))
    {
      CFDictionaryRef v8 = (const __CFDictionary *)CFPropertyListCreateWithStream(v6, v7, 0, 0, 0, a2);
      CFRelease(v7);
      if (v8 && (CFTypeID v9 = CFGetTypeID(v8), v9 == CFDictionaryGetTypeID()))
      {
        initCreateContext((CFMutableDictionaryRef *)&v12);
        CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(v8, @"kGSSConfKeys");
        if (Value)
        {
          CFDictionaryApplyFunction(Value, (CFDictionaryApplierFunction)createItem, &v12);
          CFTypeRef v11 = v12;
          if (!a1) {
            goto LABEL_15;
          }
        }
        else
        {
          CFRelease(v12);
          CFTypeRef v11 = 0;
          CFTypeRef v12 = 0;
          if (!a1) {
            goto LABEL_15;
          }
        }
      }
      else
      {
        CFTypeRef v11 = 0;
        if (!a1) {
          goto LABEL_15;
        }
      }
LABEL_13:
      if (!v11)
      {
        initCreateContext((CFMutableDictionaryRef *)&v12);
        CFTypeRef v11 = v12;
      }
      goto LABEL_15;
    }
    CFRelease(v7);
  }
  CFTypeRef v11 = 0;
  CFDictionaryRef v8 = 0;
  if (a1) {
    goto LABEL_13;
  }
LABEL_15:
  if (v11)
  {
    OM_uint32 min_stat = 0;
    useriter[0] = MEMORY[0x263EF8330];
    useriter[1] = 0x40000000;
    useriter[2] = __addTransientKeys_block_invoke;
    useriter[3] = &__block_descriptor_tmp_89;
    useriter[4] = &v12;
    gss_iter_creds(&min_stat, 0, &__gss_krb5_mechanism_oid_desc, useriter);
  }
  if (cf) {
    CFRelease(cf);
  }
  if (v8) {
    CFRelease(v8);
  }
  return (const __CFURL *)v12;
}

CFMutableArrayRef searchCopyResult(const __CFDictionary *a1, uint64_t a2)
{
  CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
  CFMutableArrayRef v5 = Mutable;
  if (Mutable)
  {
    v7[0] = a2;
    v7[1] = Mutable;
    CFDictionaryApplyFunction(a1, (CFDictionaryApplierFunction)searchFunction, v7);
    if (!CFArrayGetCount(v5))
    {
      CFRelease(v5);
      return 0;
    }
  }
  return v5;
}

uint64_t GSSCreateItem(const __CFDictionary *a1)
{
  uint64_t Instance = _CFRuntimeCreateInstance();
  if (Instance)
  {
    if (a1) {
      CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, a1);
    }
    else {
      CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    }
    *(void *)(Instance + 16) = MutableCopy;
    *(void *)(Instance + 24) = 0;
  }
  return Instance;
}

CFDictionaryRef modifyItem(uint64_t a1, const __CFDictionary *a2, CFTypeRef *a3)
{
  CFDictionaryRef v4 = applyClassItems(a1, a2, (void (__cdecl *)(const void *, const void *, void *))modifyAttributes, a3);
  if (v4)
  {
    CFDictionaryRef Value = CFDictionaryGetValue(a2, @"kGSSAttrCredentialPassword");
    if (Value)
    {
      CFTypeID v6 = CFGetTypeID(Value);
      if (v6 == CFStringGetTypeID())
      {
        CFBooleanRef v7 = (const __CFBoolean *)CFDictionaryGetValue(a2, @"kGSSAttrCredentialStore");
        if (v7)
        {
          CFBooleanRef v8 = v7;
          CFTypeID v9 = CFGetTypeID(v7);
          if (v9 == CFBooleanGetTypeID()) {
            CFBooleanGetValue(v8);
          }
        }
      }
    }
  }
  return v4;
}

gss_buffer_set_desc_struct *updateTransientValues(uint64_t a1)
{
  OM_uint32 minor_status = 0;
  OM_uint32 v13 = 0;
  v2 = itemToGSSCred(a1, &v13, 0);
  buffer.length = 0;
  buffer.value = 0;
  v3 = *(__CFDictionary **)(a1 + 16);
  if (v2)
  {
    CFDictionaryRef v4 = (const void *)*MEMORY[0x263EFFB40];
    CFDictionarySetValue(v3, @"kGSSAttrCredentialExists", (const void *)*MEMORY[0x263EFFB40]);
    if (!__ApplePrivate_gss_cred_label_get(&minor_status, (uint64_t)v2, (uint64_t)"kcm-status", &buffer))
    {
      CFDataRef v5 = CFDataCreate(0, (const UInt8 *)buffer.value, buffer.length);
      if (v5)
      {
        CFDataRef v6 = v5;
        CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 16), @"kGSSAttrStatusAutoAcquireStatus", v5);
        CFRelease(v6);
      }
      gss_release_buffer(&minor_status, &buffer);
    }
    if (v13) {
      double v7 = (double)time(0) + -978307200.0 + (double)(v13 | 0xC1CD27E400000000);
    }
    else {
      double v7 = 0.0;
    }
    CFDateRef v8 = CFDateCreate(0, v7);
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 16), @"kGSSAttrTransientExpire", v8);
    CFRelease(v8);
    gss_buffer_set_t data_set = 0;
    LODWORD(v8) = gss_inquire_cred_by_oid(&minor_status, v2, &__gss_c_cred_get_default_oid_desc, &data_set);
    gss_release_buffer_set(&minor_status, &data_set);
    if (!v8) {
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 16), @"kGSSAttrTransientDefaultInClass", v4);
    }
    CFRelease(v2);
  }
  else
  {
    CFDictionaryRemoveValue(v3, @"kGSSAttrTransientExpire");
  }
  CFURLRef result = (gss_buffer_set_desc_struct *)itemCopyGSSName(a1);
  gss_buffer_set_t data_set = result;
  if (result)
  {
    if (!gss_display_name(&minor_status, (gss_name_t)result, &buffer, 0))
    {
      CFStringRef v10 = CFStringCreateWithFormat(0, 0, @"%.*s", buffer.length, buffer.value, data_set);
      gss_release_buffer(&minor_status, &buffer);
      if (v10)
      {
        CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 16), @"kGSSAttrNameDisplay", v10);
        CFRelease(v10);
      }
    }
    return (gss_buffer_set_desc_struct *)gss_release_name(&minor_status, (gss_name_t *)&data_set);
  }
  return result;
}

void storeConfiguration(const __CFDictionary *a1)
{
  CFURLRef v2 = copyConfigurationURL();
  if (v2)
  {
    CFURLRef v3 = v2;
    CFDictionaryRef v4 = CFWriteStreamCreateWithFile(0, v2);
    CFRelease(v3);
    if (v4)
    {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      if (Mutable)
      {
        CFMutableDictionaryRef v6 = Mutable;
        CFDictionaryApplyFunction(a1, (CFDictionaryApplierFunction)storeItem, Mutable);
        double v7 = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
        if (v7)
        {
          CFDateRef v8 = v7;
          CFDictionarySetValue(v7, @"kGSSConfKeys", v6);
          CFRelease(v6);
          if (CFWriteStreamOpen(v4))
          {
            CFPropertyListWrite(v8, v4, kCFPropertyListBinaryFormat_v1_0, 0, 0);
            CFWriteStreamClose(v4);
          }
          CFMutableDictionaryRef v6 = v4;
        }
        else
        {
          CFDateRef v8 = v4;
        }
        CFRelease(v6);
        CFDictionaryRef v4 = v8;
      }
      CFRelease(v4);
    }
  }
}

uint64_t GSSItemUpdate(uint64_t a1, const __CFDictionary *a2, CFErrorRef *a3)
{
  if (gss_init_once != -1)
  {
    dispatch_once_f(&gss_init_once, 0, (dispatch_function_t)create_tables);
    if (a1) {
      goto LABEL_3;
    }
LABEL_18:
    uint64_t v16 = heim_abort();
    return GSSItemDeleteItem(v16);
  }
  if (!a1) {
    goto LABEL_18;
  }
LABEL_3:
  if (a3) {
    *a3 = 0;
  }
  CFDictionaryRef v6 = copyConfiguration(1, a3);
  if (!v6) {
    return 0;
  }
  CFDictionaryRef v7 = v6;
  CFArrayRef v8 = searchCopyResult(v6, a1);
  if (v8)
  {
    CFArrayRef v9 = v8;
    CFIndex Count = CFArrayGetCount(v8);
    if (Count >= 1)
    {
      CFIndex v11 = Count;
      CFIndex v12 = 0;
      while (1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v9, v12);
        if (modifyItem((uint64_t)ValueAtIndex, a2, (CFTypeRef *)a3)) {
          break;
        }
        if (v11 == ++v12)
        {
          CFRelease(v9);
          goto LABEL_12;
        }
      }
    }
    CFRelease(v9);
    storeConfiguration(v7);
    uint64_t v14 = 1;
  }
  else
  {
LABEL_12:
    uint64_t v14 = 0;
  }
  CFRelease(v7);
  return v14;
}

uint64_t GSSItemDeleteItem(uint64_t a1, CFErrorRef *a2)
{
  CFURLRef v3 = copyConfiguration(0, a2);
  if (!v3) {
    return 0;
  }
  CFDictionaryRef v4 = v3;
  uint64_t v5 = ItemDeleteItem(v3, a1);
  if (v5) {
    storeConfiguration(v4);
  }
  CFRelease(v4);
  return v5;
}

uint64_t ItemDeleteItem(__CFDictionary *a1, uint64_t a2)
{
  uint64_t result = (uint64_t)CFDictionaryGetValue(*(CFDictionaryRef *)(a2 + 16), @"kGSSAttrUUID");
  if (result)
  {
    uint64_t v5 = (const void *)result;
    gss_cred_id_t cred_handle = itemToGSSCred(a2, 0, 0);
    if (cred_handle)
    {
      OM_uint32 min_stat = 0;
      gss_destroy_cred(&min_stat, &cred_handle);
    }
    CFDictionaryRemoveValue(a1, v5);
    return 1;
  }
  return result;
}

uint64_t GSSItemDelete(uint64_t a1, CFErrorRef *a2)
{
  if (gss_init_once == -1)
  {
    if (a1) {
      goto LABEL_3;
    }
  }
  else
  {
    dispatch_once_f(&gss_init_once, 0, (dispatch_function_t)create_tables);
    if (a1)
    {
LABEL_3:
      if (a2) {
        *a2 = 0;
      }
      CFDictionaryRef v4 = copyConfiguration(0, a2);
      if (!v4)
      {
        LOBYTE(v10) = 0;
        return v10;
      }
      uint64_t v5 = v4;
      CFArrayRef v6 = searchCopyResult(v4, a1);
      if (v6)
      {
        CFArrayRef v7 = v6;
        CFIndex Count = CFArrayGetCount(v6);
        if (Count >= 1)
        {
          CFIndex v9 = Count;
          int v10 = 0;
          for (CFIndex i = 0; i != v9; ++i)
          {
            ValueAtIndex = CFArrayGetValueAtIndex(v7, i);
            if (ItemDeleteItem(v5, (uint64_t)ValueAtIndex)) {
              int v10 = 1;
            }
          }
          CFRelease(v7);
          if (v10) {
            storeConfiguration(v5);
          }
          goto LABEL_17;
        }
        CFRelease(v7);
      }
      LOBYTE(v10) = 0;
LABEL_17:
      CFRelease(v5);
      return v10;
    }
  }
  uint64_t v14 = heim_abort();
  return GSSItemCopyMatching(v14);
}

CFArrayRef GSSItemCopyMatching(uint64_t a1, CFErrorRef *a2)
{
  if (gss_init_once == -1)
  {
    if (!a2) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  dispatch_once_f(&gss_init_once, 0, (dispatch_function_t)create_tables);
  if (a2) {
LABEL_3:
  }
    *a2 = 0;
LABEL_4:
  CFDictionaryRef v4 = copyConfiguration(1, a2);
  if (!v4) {
    return 0;
  }
  CFDictionaryRef v5 = v4;
  CFArrayRef v6 = searchCopyResult(v4, a1);
  CFRelease(v5);
  if (v6)
  {
    CFIndex Count = CFArrayGetCount(v6);
    if (Count >= 1)
    {
      CFIndex v8 = Count;
      for (CFIndex i = 0; i != v8; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v6, i);
        updateTransientValues((uint64_t)ValueAtIndex);
      }
    }
  }
  return v6;
}

void itemAcquire(uint64_t a1, const __CFDictionary *a2, NSObject *a3, uint64_t a4)
{
  output_gss_cred_id_t cred_handle = 0;
  CFErrorRef error = 0;
  OM_uint32 minor_status = 0;
  CFIndex v8 = itemCopyGSSName(a1);
  gss_name_t input_name = v8;
  if (v8)
  {
    CFIndex v9 = v8;
    int v10 = itemToMechOID(a1);
    if (!v10) {
      goto LABEL_19;
    }
    CFIndex v11 = v10;
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    if (!Mutable) {
      goto LABEL_19;
    }
    OM_uint32 v13 = Mutable;
    if (a2)
    {
      CFDictionaryRef Value = CFDictionaryGetValue(a2, @"kGSSAttrCredentialPassword");
      if (Value)
      {
        v15 = Value;
        uint64_t v16 = @"kGSSICPassword";
      }
      else
      {
        v17 = CFDictionaryGetValue(a2, @"kGSSAttrCredentialSecIdentity");
        if (!v17) {
          goto LABEL_10;
        }
        v15 = v17;
        uint64_t v16 = @"kGSSICCertificate";
      }
      CFDictionarySetValue(v13, v16, v15);
    }
LABEL_10:
    v18 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"kGSSAttrUUID");
    if (v18)
    {
      CFStringRef v19 = CFStringCreateWithFormat(0, 0, @"API:%@", v18);
      if (!v19)
      {
LABEL_18:
        CFRelease(v13);
LABEL_19:
        gss_release_name(&minor_status, &input_name);
        goto LABEL_20;
      }
      CFStringRef v20 = v19;
      CFDictionarySetValue(v13, @"kGSSICKerberosCacheName", v19);
      CFRelease(v20);
    }
    gss_aapl_initial_cred(v9, v11, v13, &output_cred_handle, &error);
    v21 = *(const void **)(a1 + 24);
    if (v21)
    {
      CFRelease(v21);
      *(void *)(a1 + 24) = 0;
    }
    if (output_cred_handle) {
      *(void *)(a1 + 24) = GSSCredentialCopyUUID(output_cred_handle);
    }
    updateTransientValues(a1);
    goto LABEL_18;
  }
LABEL_20:
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __itemAcquire_block_invoke;
  block[3] = &unk_2641EF8A0;
  block[4] = a4;
  block[5] = output_cred_handle;
  block[6] = error;
  dispatch_async(a3, block);
}

void itemDestroyTransient(uint64_t a1, uint64_t a2, NSObject *a3, uint64_t a4)
{
  CFErrorRef v11 = 0;
  OM_uint32 min_stat = 0;
  gss_cred_id_t cred_handle = itemToGSSCred(a1, 0, &v11);
  if (cred_handle)
  {
    gss_destroy_cred(&min_stat, &cred_handle);
    CFArrayRef v6 = (uint64_t *)MEMORY[0x263EFFB40];
  }
  else
  {
    CFArrayRef v6 = (uint64_t *)MEMORY[0x263EFFB38];
  }
  uint64_t v7 = *v6;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 0x40000000;
  v8[2] = __itemDestroyTransient_block_invoke;
  v8[3] = &unk_2641EF8C8;
  v8[4] = a4;
  v8[5] = v7;
  v8[6] = v11;
  dispatch_async(a3, v8);
}

void itemGetGSSCredential(uint64_t a1, uint64_t a2, NSObject *a3, uint64_t a4)
{
  CFErrorRef v8 = 0;
  gss_cred_id_t v6 = itemToGSSCred(a1, 0, &v8);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 0x40000000;
  void v7[2] = __itemGetGSSCredential_block_invoke;
  v7[3] = &unk_2641EF8F0;
  v7[4] = a4;
  v7[5] = v6;
  v7[6] = v8;
  dispatch_async(a3, v7);
}

void itemCredentialDiagnostics(uint64_t a1, uint64_t a2, NSObject *a3, uint64_t a4)
{
  CFErrorRef v18 = 0;
  OM_uint32 minor_status = 0;
  gss_cred_id_t v6 = itemToGSSCred(a1, 0, &v18);
  if (!v6) {
    goto LABEL_11;
  }
  uint64_t v7 = v6;
  gss_buffer_set_t data_set = 0;
  CFMutableDictionaryRef Mutable = 0;
  if (gss_inquire_cred_by_oid(&minor_status, v6, &__gss_c_cred_diag_oid_desc, &data_set)) {
    goto LABEL_12;
  }
  if (!data_set->count)
  {
LABEL_11:
    CFMutableDictionaryRef Mutable = 0;
    goto LABEL_12;
  }
  CFMutableDictionaryRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
  if (Mutable)
  {
    gss_buffer_set_t v9 = data_set;
    if (data_set->count)
    {
      uint64_t v10 = 0;
      unsigned int v11 = 1;
      do
      {
        CFDataRef v12 = CFDataCreate(0, (const UInt8 *)v9->elements[v10].value, v9->elements[v10].length);
        if (v12)
        {
          CFDataRef v13 = v12;
          CFArrayAppendValue(Mutable, v12);
          CFRelease(v13);
        }
        uint64_t v10 = v11;
        gss_buffer_set_t v9 = data_set;
      }
      while (data_set->count > v11++);
    }
    gss_release_buffer_set(&minor_status, &data_set);
    CFRelease(v7);
  }
LABEL_12:
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 0x40000000;
  v15[2] = __itemCredentialDiagnostics_block_invoke;
  v15[3] = &unk_2641EF918;
  v15[4] = a4;
  v15[5] = Mutable;
  v15[6] = v18;
  dispatch_async(a3, v15);
}

void itemChangePassword(uint64_t a1, CFDictionaryRef theDict, NSObject *a3, uint64_t a4)
{
  CFErrorRef error = 0;
  CFDictionaryRef Value = CFDictionaryGetValue(theDict, @"kGSSOperationChangePasswordOldPassword");
  gss_buffer_set_t v9 = CFDictionaryGetValue(theDict, @"kGSSOperationChangePasswordNewPassword");
  CFErrorRef v10 = 0;
  if (Value) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11)
  {
    CFDataRef v12 = v9;
    CFDataRef v13 = itemToMechOID(a1);
    if (v13
      && (v14 = v13, (CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90])) != 0)
      && (uint64_t v16 = Mutable, (v17 = itemCopyGSSName(a1)) != 0))
    {
      CFErrorRef v18 = v17;
      CFDictionaryAddValue(v16, @"kGSSChangePasswordOldPassword", Value);
      CFDictionaryAddValue(v16, @"kGSSChangePasswordNewPassword", v12);
      gss_aapl_change_password(v18, v14, v16, &error);
      CFRelease(v18);
      CFErrorRef v10 = error;
    }
    else
    {
      CFErrorRef v10 = 0;
    }
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __itemChangePassword_block_invoke;
  block[3] = &unk_2641EF940;
  block[4] = a4;
  block[5] = v10;
  dispatch_async(a3, block);
}

void itemSetDefault(uint64_t a1, uint64_t a2, NSObject *a3, uint64_t a4)
{
  cfCFErrorRef error = 0;
  gss_cred_id_t v6 = itemToGSSCred(a1, 0, &cferror);
  if (v6)
  {
    uint64_t v7 = v6;
    gss_buffer_set_t data_set = 0;
    OM_uint32 minor_status = 0;
    OM_uint32 v10 = 0;
    OM_uint32 v8 = gss_inquire_cred_by_oid(&minor_status, v6, &__gss_c_cred_set_default_oid_desc, &data_set);
    gss_release_buffer_set(&v10, &data_set);
    CFRelease(v7);
    if (v8) {
      cfCFErrorRef error = _gss_mg_create_cferror(v8, minor_status, 0);
    }
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __itemSetDefault_block_invoke;
  block[3] = &unk_2641EF968;
  block[4] = a4;
  block[5] = cferror;
  dispatch_async(a3, block);
}

void itemRenewCredential(uint64_t a1, uint64_t a2, NSObject *a3, uint64_t a4)
{
  cfCFErrorRef error = 0;
  OM_uint32 minor_status = 0;
  gss_cred_id_t v6 = itemToGSSCred(a1, 0, &cferror);
  if (v6)
  {
    uint64_t v7 = v6;
    gss_buffer_set_t data_set = 0;
    OM_uint32 v8 = gss_inquire_cred_by_oid(&minor_status, v6, &__gss_c_cred_renew_oid_desc, &data_set);
    gss_release_buffer_set(&minor_status, &data_set);
    CFRelease(v7);
    if (v8) {
      cfCFErrorRef error = _gss_mg_create_cferror(v8, minor_status, 0);
    }
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __itemRenewCredential_block_invoke;
  block[3] = &unk_2641EF990;
  block[4] = a4;
  block[5] = cferror;
  dispatch_async(a3, block);
}

void itemRemoveBackingCredential(uint64_t a1, uint64_t a2, NSObject *a3, uint64_t a4)
{
  CFDictionaryRef Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"kGSSAttrUUID");
  if (Value)
  {
    uint64_t v7 = Value;
    CFTypeID v8 = CFGetTypeID(Value);
    if (v8 == CFStringGetTypeID())
    {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      if (Mutable)
      {
        OM_uint32 v10 = Mutable;
        CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F171B8], (const void *)*MEMORY[0x263F171C8]);
        CFDictionaryAddValue(v10, (const void *)*MEMORY[0x263F17108], (const void *)kGSSSecPasswordType);
        CFDictionaryAddValue(v10, (const void *)*MEMORY[0x263F16ED8], v7);
        CFDictionaryAddValue(v10, (const void *)*MEMORY[0x263F17090], @"GSS");
        SecItemDelete(v10);
        CFRelease(v10);
      }
    }
  }
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 0x40000000;
  v11[2] = __itemRemoveBackingCredential_block_invoke;
  v11[3] = &unk_2641EF9B8;
  v11[4] = a4;
  v11[5] = 0;
  dispatch_async(a3, v11);
}

uint64_t GSSItemOperation(const void *a1, uint64_t a2, const void *a3, uint64_t a4, void *aBlock)
{
  if (gss_init_once != -1) {
    dispatch_once_f(&gss_init_once, 0, (dispatch_function_t)create_tables);
  }
  OM_uint32 v10 = _Block_copy(aBlock);
  CFRetain(a1);
  if (a3) {
    CFRetain(a3);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __GSSItemOperation_block_invoke;
  block[3] = &unk_2641EF858;
  void block[6] = a1;
  void block[7] = a3;
  block[8] = a4;
  block[4] = v10;
  block[5] = a2;
  dispatch_async((dispatch_queue_t)bgq, block);
  return 1;
}

void __GSSItemOperation_block_invoke(uint64_t a1)
{
  (**(void (***)(void, void, void, void))(a1 + 40))(*(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 32));
  _Block_release(*(const void **)(a1 + 32));
  CFRelease(*(CFTypeRef *)(a1 + 48));
  CFURLRef v2 = *(const void **)(a1 + 56);
  if (v2)
  {
    CFRelease(v2);
  }
}

const void *GSSItemGetValue(uint64_t a1, const void *a2)
{
  int check = 0;
  if (CFDictionaryGetValue((CFDictionaryRef)transient_types, a2))
  {
    if (notify_check(notify_token, &check)) {
      BOOL v4 = 1;
    }
    else {
      BOOL v4 = check == 0;
    }
    if (!v4) {
      updateTransientValues(a1);
    }
  }
  return CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), a2);
}

uint64_t create_tables()
{
  bgq = (uint64_t)dispatch_queue_create("org.h5l.gss.item", MEMORY[0x263EF83A8]);
  if (bgq)
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    if (Mutable)
    {
      v1 = Mutable;
      CFURLRef v2 = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      CFURLRef v3 = (const void *)*MEMORY[0x263EFFB40];
      CFDictionarySetValue(v2, @"kGSSAttrClass", (const void *)*MEMORY[0x263EFFB40]);
      CFDictionarySetValue(v2, @"kGSSAttrNameType", v3);
      CFDictionarySetValue(v2, @"kGSSAttrName", v3);
      CFDictionarySetValue(v2, @"kGSSAttrUUID", v3);
      BOOL v4 = (const void *)*MEMORY[0x263EFFB38];
      CFDictionarySetValue(v2, @"kGSSAttrCredentialPassword", (const void *)*MEMORY[0x263EFFB38]);
      CFDictionarySetValue(v2, @"kGSSAttrCredentialSecIdentity", v4);
      CFDictionarySetValue(v2, @"kGSSAttrStatusPersistant", v4);
      CFDictionarySetValue(v2, @"kGSSAttrStatusAutoAcquire", v4);
      CFDictionarySetValue(v2, @"kGSSAttrStatusTransient", v4);
      CFDictionarySetValue(v1, @"kGSSAttrClassKerberos", v2);
      CFRelease(v2);
      CFDictionaryRef v5 = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      CFDictionarySetValue(v5, @"kGSSAttrClass", v3);
      CFDictionarySetValue(v5, @"kGSSAttrNameType", v3);
      CFDictionarySetValue(v5, @"kGSSAttrName", v3);
      CFDictionarySetValue(v5, @"kGSSAttrUUID", v3);
      CFDictionarySetValue(v5, @"kGSSAttrCredentialPassword", v4);
      CFDictionarySetValue(v5, @"kGSSAttrStatusPersistant", v4);
      CFDictionarySetValue(v5, @"kGSSAttrStatusAutoAcquire", v4);
      CFDictionarySetValue(v5, @"kGSSAttrStatusTransient", v4);
      CFDictionarySetValue(v1, @"kGSSAttrClassNTLM", v5);
      CFRelease(v5);
      valid_set_types = (uint64_t)v1;
      gss_cred_id_t v6 = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      CFDictionarySetValue(v6, @"kGSSAttrTransientExpire", v3);
      transient_types = (uint64_t)v6;
      int valuePtr = 1196643152;
      kGSSSecPasswordType = (uint64_t)CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
      notify_register_check("com.apple.Kerberos.cache.changed", &notify_token);
      uint64_t result = _CFRuntimeRegisterClass();
      gssitemid = result;
      return result;
    }
  }
  else
  {
    heim_abort();
  }
  uint64_t v8 = heim_abort();
  return _gssitem_release(v8);
}

void _gssitem_release(uint64_t a1)
{
  CFURLRef v2 = *(const void **)(a1 + 16);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(a1 + 16) = 0;
  }
  CFURLRef v3 = *(const void **)(a1 + 24);
  if (v3)
  {
    CFRelease(v3);
    *(void *)(a1 + 24) = 0;
  }
}

CFURLRef copyConfigurationURL()
{
  CFURLRef result = (const __CFURL *)CFCopyHomeDirectoryURLForUser();
  if (result)
  {
    CFURLRef v1 = result;
    CFURLRef v2 = CFURLCreateCopyAppendingPathComponent(0, result, @"Library/Preferences/com.apple.GSS.items.plist", 0);
    CFRelease(v1);
    return v2;
  }
  return result;
}

CFMutableDictionaryRef initCreateContext(CFMutableDictionaryRef *a1)
{
  if (*a1)
  {
    heim_abort();
    goto LABEL_6;
  }
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  *a1 = Mutable;
  if (!Mutable)
  {
LABEL_6:
    heim_abort();
    goto LABEL_7;
  }
  CFMutableDictionaryRef result = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  a1[1] = result;
  if (!result)
  {
LABEL_7:
    uint64_t v4 = heim_abort();
    return (CFMutableDictionaryRef)createItem(v4);
  }
  return result;
}

void createItem(const void *a1, const __CFDictionary *a2, CFMutableDictionaryRef *a3)
{
  uint64_t v5 = GSSCreateItem(a2);
  if (v5)
  {
    gss_cred_id_t v6 = (const void *)v5;
    uint64_t v7 = itemToGSSCred(v5, 0, 0);
    if (v7)
    {
      CFUUIDRef v8 = CopyTransientUUID(v7);
      if (v8)
      {
        CFUUIDRef v9 = v8;
        CFDictionarySetValue(a3[1], v8, (const void *)*MEMORY[0x263EFFB40]);
        CFRelease(v9);
      }
    }
    CFDictionarySetValue(*a3, a1, v6);
    CFRelease(v6);
  }
}

gss_cred_id_t itemToGSSCred(uint64_t a1, OM_uint32 *a2, CFErrorRef *a3)
{
  gss_OID_set oid_set = 0;
  OM_uint32 minor_status = 0;
  output_gss_cred_id_t cred_handle = 0;
  CFUUIDRef v5 = *(const __CFUUID **)(a1 + 24);
  if (!v5)
  {
    CFUUIDRef v9 = itemToMechOID(a1);
    if (v9)
    {
      OM_uint32 v10 = v9;
      gss_name_t desired_name = itemCopyGSSName(a1);
      if (desired_name)
      {
        OM_uint32 v11 = gss_create_empty_oid_set(&minor_status, &oid_set);
        if (v11)
        {
          if (a3) {
            *a3 = _gss_mg_create_cferror(v11, minor_status, 0);
          }
        }
        else
        {
          OM_uint32 v12 = gss_add_oid_set_member(&minor_status, v10, &oid_set);
          if (!v12)
          {
            OM_uint32 v14 = gss_acquire_cred(&minor_status, desired_name, 0xFFFFFFFF, oid_set, 1, &output_cred_handle, 0, a2);
            gss_release_oid_set(&minor_status, &oid_set);
            gss_release_name(&minor_status, &desired_name);
            if (!v14)
            {
              *(void *)(a1 + 24) = GSSCredentialCopyUUID(output_cred_handle);
              return output_cred_handle;
            }
            if (a3)
            {
              uint64_t v7 = 0;
              *a3 = _gss_mg_create_cferror(v14, minor_status, v10);
              return v7;
            }
            return 0;
          }
          if (a3) {
            *a3 = _gss_mg_create_cferror(v12, minor_status, 0);
          }
          gss_release_oid_set(&minor_status, &oid_set);
        }
        gss_release_name(&minor_status, &desired_name);
      }
    }
    return 0;
  }
  gss_cred_id_t v6 = GSSCreateCredentialFromUUID(v5);
  uint64_t v7 = v6;
  if (a2 && v6) {
    gss_inquire_cred(&minor_status, v6, 0, a2, 0, 0);
  }
  return v7;
}

CFUUIDRef CopyTransientUUID(gss_cred_id_t_desc_struct *a1)
{
  CFUUIDRef result = GSSCredentialCopyUUID(a1);
  if (result)
  {
    CFUUIDRef v2 = result;
    CFStringRef v3 = CFUUIDCreateString(0, result);
    CFRelease(v2);
    return (const __CFUUID *)v3;
  }
  return result;
}

gss_OID_desc *itemToMechOID(uint64_t a1)
{
  CFUUIDRef result = (gss_OID_desc *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"kGSSAttrClass");
  if (result)
  {
    CFUUIDRef v2 = result;
    if (CFEqual(result, @"kGSSAttrClassKerberos"))
    {
      return &__gss_krb5_mechanism_oid_desc;
    }
    else if (CFEqual(v2, @"kGSSAttrClassNTLM"))
    {
      return &__gss_ntlm_mechanism_oid_desc;
    }
    else if (CFEqual(v2, @"kGSSAttrClassIAKerb"))
    {
      return &__gss_iakerb_mechanism_oid_desc;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

gss_name_t itemCopyGSSName(uint64_t a1)
{
  gss_name_t output_name = 0;
  gss_name_t result = (gss_name_t)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"kGSSAttrNameType");
  if (result)
  {
    gss_name_t v3 = result;
    if (CFEqual(result, @"kGSSAttrNameTypeGSSUsername"))
    {
      uint64_t v4 = &__gss_c_nt_user_name_oid_desc;
    }
    else if (CFEqual(v3, @"kGSSAttrNameTypeGSSHostBasedService"))
    {
      uint64_t v4 = &__gss_c_nt_hostbased_service_oid_desc;
    }
    else
    {
      if (!CFEqual(v3, @"kGSSAttrNameTypeGSSExportedName")) {
        return 0;
      }
      uint64_t v4 = &__gss_c_nt_export_name_oid_desc;
    }
    gss_name_t result = (gss_name_t)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"kGSSAttrName");
    if (!result) {
      return result;
    }
    CFDataRef v5 = result;
    input_name_buffer.length = 0;
    input_name_buffer.value = 0;
    CFTypeID v6 = CFGetTypeID(result);
    if (v6 == CFStringGetTypeID())
    {
      gss_name_t result = (gss_name_t)rk_cfstring2cstring();
      input_name_buffer.value = result;
      if (!result) {
        return result;
      }
      size_t v7 = strlen((const char *)result);
LABEL_15:
      OM_uint32 minor_status = 0;
      input_name_buffer.length = v7;
      gss_import_name(&minor_status, &input_name_buffer, v4, &output_name);
      return output_name;
    }
    if (v6 == CFDataGetTypeID())
    {
      CFIndex Length = CFDataGetLength(v5);
      gss_name_t result = (gss_name_t)malloc_type_malloc(Length, 0x4517E9A0uLL);
      input_name_buffer.value = result;
      if (!result) {
        return result;
      }
      gss_name_t v9 = result;
      BytePtr = CFDataGetBytePtr(v5);
      CFIndex v11 = CFDataGetLength(v5);
      memcpy(v9, BytePtr, v11);
      size_t v7 = CFDataGetLength(v5);
      goto LABEL_15;
    }
    return 0;
  }
  return result;
}

void __addTransientKeys_block_invoke(uint64_t a1, uint64_t a2, gss_cred_id_t_desc_struct *a3)
{
  CFUUIDRef v5 = CopyTransientUUID(a3);
  if (v5)
  {
    CFTypeID v6 = v5;
    if (CFDictionaryGetValue(*(CFDictionaryRef *)(*(void *)(a1 + 32) + 8), v5) || (uint64_t v7 = GSSCreateItem(0)) == 0)
    {
      CFRelease(v6);
    }
    else
    {
      uint64_t v8 = v7;
      OM_uint32 minor_status = 0;
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(v7 + 16), @"kGSSAttrUUID", v6);
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(v8 + 16), @"kGSSAttrClass", @"kGSSAttrClassKerberos");
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(v8 + 16), @"kGSSAttrNameType", @"kGSSAttrNameTypeGSSExportedName");
      gss_name_t v9 = _gss_cred_copy_name((uint64_t)&minor_status, (uint64_t)a3, 0);
      gss_name_t input_name = (gss_name_t)v9;
      if (v9)
      {
        v14.length = 0;
        v14.value = 0;
        OM_uint32 v10 = gss_export_name(&minor_status, (gss_name_t)v9, &v14);
        gss_release_name(&minor_status, &input_name);
        if (v10)
        {
          CFIndex v11 = v6;
          CFTypeID v6 = (const void *)v8;
        }
        else
        {
          CFDataRef v13 = CFDataCreate(0, (const UInt8 *)v14.value, v14.length);
          CFDictionarySetValue(*(CFMutableDictionaryRef *)(v8 + 16), @"kGSSAttrName", v13);
          CFRelease(v13);
          updateTransientValues(v8);
          CFDictionarySetValue(*(CFMutableDictionaryRef *)(v8 + 16), @"kGSSAttrStatusTransient", (const void *)*MEMORY[0x263EFFB40]);
          CFDictionarySetValue(**(CFMutableDictionaryRef **)(a1 + 32), v6, (const void *)v8);
          *(void *)(v8 + 24) = GSSCredentialCopyUUID(a3);
          CFIndex v11 = (const void *)v8;
        }
        CFRelease(v11);
        OM_uint32 v12 = v6;
      }
      else
      {
        CFRelease(v6);
        OM_uint32 v12 = (const void *)v8;
      }
      CFRelease(v12);
    }
  }
}

void searchFunction(int a1, const void *a2, CFDictionaryRef *a3)
{
  if (applyClassItems((uint64_t)a2, *a3, (void (__cdecl *)(const void *, const void *, void *))matchAttr, 0))
  {
    CFUUIDRef v5 = a3[1];
    CFArrayAppendValue(v5, a2);
  }
}

CFDictionaryRef applyClassItems(uint64_t a1, CFDictionaryRef theDict, void (__cdecl *a3)(const void *, const void *, void *), CFTypeRef *a4)
{
  if (a4) {
    *a4 = 0;
  }
  CFDictionaryRef Value = CFDictionaryGetValue(theDict, @"kGSSAttrClass");
  if (Value
    || (CFDictionaryRef result = (const __CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"kGSSAttrClass"),
        (CFDictionaryRef Value = result) != 0))
  {
    CFDictionaryRef result = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)valid_set_types, Value);
    if (result)
    {
      v10[0] = a1;
      v10[1] = theDict;
      CFTypeRef cf = 0;
      uint64_t v12 = 1;
      CFDictionaryApplyFunction(result, a3, v10);
      if (cf)
      {
        if (a4)
        {
          CFDictionaryRef result = 0;
          *a4 = cf;
        }
        else
        {
          CFRelease(cf);
          return 0;
        }
      }
      else
      {
        return (const __CFDictionary *)((_BYTE)v12 != 0);
      }
    }
  }
  return result;
}

uint64_t matchAttr(uint64_t key, uint64_t a2, uint64_t a3)
{
  if (*(unsigned char *)(a3 + 24))
  {
    uint64_t v4 = (const void *)key;
    CFDictionaryRef Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a3 + 8), (const void *)key);
    key = (uint64_t)CFDictionaryGetValue(*(CFDictionaryRef *)(*(void *)a3 + 16), v4);
    if (Value) {
      BOOL v6 = key == 0;
    }
    else {
      BOOL v6 = 1;
    }
    if (!v6)
    {
      key = CFEqual(Value, (CFTypeRef)key);
      if (!key) {
        *(unsigned char *)(a3 + 24) = 0;
      }
    }
  }
  return key;
}

void modifyAttributes(void *key, const __CFBoolean *a2, CFDictionaryRef *a3)
{
  CFDictionaryRef Value = CFDictionaryGetValue(a3[1], key);
  if (CFBooleanGetValue(a2) && Value)
  {
    uint64_t v7 = (__CFDictionary *)*((void *)*a3 + 2);
    CFDictionarySetValue(v7, key, Value);
  }
}

uint64_t validateAttributes(uint64_t result, CFBooleanRef BOOLean, uint64_t a3)
{
  if (!*(void *)(a3 + 16))
  {
    uint64_t v4 = (const void *)result;
    CFDictionaryRef result = CFBooleanGetValue(BOOLean);
    if (result)
    {
      CFDictionaryRef result = (uint64_t)CFDictionaryGetValue(*(CFDictionaryRef *)(a3 + 8), v4);
      if (!result)
      {
        CFDictionaryRef result = (uint64_t)CFErrorCreate(0, @"com.apple.GSS", 22, 0);
        *(void *)(a3 + 16) = result;
      }
    }
  }
  return result;
}

void storeItem(const void *a1, CFDictionaryRef *cf, __CFDictionary *a3)
{
  CFTypeID v6 = CFGetTypeID(cf);
  if (gss_init_once != -1) {
    dispatch_once_f(&gss_init_once, 0, (dispatch_function_t)create_tables);
  }
  if (v6 == gssitemid)
  {
    if (!CFDictionaryGetValue(cf[2], @"kGSSAttrStatusTransient"))
    {
      CFDictionaryRef v7 = cf[2];
      CFDictionarySetValue(a3, a1, v7);
    }
  }
  else
  {
    uint64_t v8 = heim_abort();
    __itemAcquire_block_invoke(v8);
  }
}

void __itemAcquire_block_invoke(void *a1)
{
  (*(void (**)(void))(a1[4] + 16))();
  CFUUIDRef v2 = (const void *)a1[6];
  if (v2) {
    CFRelease(v2);
  }
  gss_name_t v3 = (const void *)a1[5];
  if (v3)
  {
    CFRelease(v3);
  }
}

void __itemDestroyTransient_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  CFUUIDRef v2 = *(const void **)(a1 + 48);
  if (v2)
  {
    CFRelease(v2);
  }
}

void __itemGetGSSCredential_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  CFUUIDRef v2 = *(const void **)(a1 + 48);
  if (v2)
  {
    CFRelease(v2);
  }
}

void __itemCredentialDiagnostics_block_invoke(void *a1)
{
  (*(void (**)(void))(a1[4] + 16))();
  CFUUIDRef v2 = (const void *)a1[5];
  if (v2) {
    CFRelease(v2);
  }
  gss_name_t v3 = (const void *)a1[6];
  if (v3)
  {
    CFRelease(v3);
  }
}

void __itemChangePassword_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  CFUUIDRef v2 = *(const void **)(a1 + 40);
  if (v2)
  {
    CFRelease(v2);
  }
}

void __itemSetDefault_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  CFUUIDRef v2 = *(const void **)(a1 + 40);
  if (v2)
  {
    CFRelease(v2);
  }
}

void __itemRenewCredential_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  CFUUIDRef v2 = *(const void **)(a1 + 40);
  if (v2)
  {
    CFRelease(v2);
  }
}

void __itemRemoveBackingCredential_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  CFUUIDRef v2 = *(const void **)(a1 + 40);
  if (v2)
  {
    CFRelease(v2);
  }
}

uint64_t GSSCheckNTLMReflection()
{
  return MEMORY[0x270F39560]();
}

OM_uint32 gss_aapl_initial_cred(gss_name_t desired_name, gss_const_OID desired_mech, CFDictionaryRef attributes, gss_cred_id_t *output_cred_handle, CFErrorRef *error)
{
  size_t v30 = 0;
  v31 = 0;
  heim_warn_blocking();
  if (error) {
    *CFErrorRef error = 0;
  }
  if (!desired_mech) {
    return 0x10000;
  }
  if (!desired_name) {
    return 0x20000;
  }
  if (!output_cred_handle) {
    return 0x1000000;
  }
  *output_gss_cred_id_t cred_handle = 0;
  unint64_t Value = (unint64_t)CFDictionaryGetValue(attributes, @"kGSSICPassword");
  unint64_t v11 = (unint64_t)CFDictionaryGetValue(attributes, @"kGSSICCertificate");
  if (!(Value | v11)) {
    return 0x1000000;
  }
  gss_buffer_desc_struct v14 = (const void *)v11;
  CFStringRef v15 = (const __CFString *)CFDictionaryGetValue(attributes, @"kGSSCredentialUsage");
  if (v15
    && (CFStringRef v16 = v15, v17 = CFGetTypeID(v15), v17 == CFStringGetTypeID())
    && CFStringCompare(v16, @"kGSS_C_INITIATE", 0))
  {
    if (CFStringCompare(v16, @"kGSS_C_ACCEPT", 0))
    {
      if (CFStringCompare(v16, @"kGSS_C_BOTH", 0)) {
        return 851968;
      }
      unsigned int v18 = 0;
    }
    else
    {
      unsigned int v18 = 2;
    }
  }
  else
  {
    unsigned int v18 = 1;
  }
  if (!gss_oid_equal(desired_mech, &__gss_krb5_mechanism_oid_desc))
  {
    if (Value)
    {
      CFTypeID v20 = CFGetTypeID((CFTypeRef)Value);
      if (v20 == CFStringGetTypeID())
      {
        v21 = (void *)rk_cfstring2cstring();
        if (v21)
        {
          v31 = v21;
          size_t v30 = strlen((const char *)v21);
LABEL_32:
          attributes = (CFDictionaryRef)&v30;
          CFStringRef v19 = &__gss_c_cred_password_oid_desc;
          goto LABEL_20;
        }
        return 851968;
      }
      CFTypeID v22 = CFGetTypeID((CFTypeRef)Value);
      if (v22 == CFDataGetTypeID())
      {
        CFIndex Length = CFDataGetLength((CFDataRef)Value);
        v24 = malloc_type_malloc(Length, 0xE94C9BE7uLL);
        v31 = v24;
        if (v24)
        {
          v25 = v24;
          size_t v30 = CFDataGetLength((CFDataRef)Value);
          BytePtr = CFDataGetBytePtr((CFDataRef)Value);
          CFIndex v27 = CFDataGetLength((CFDataRef)Value);
          memcpy(v25, BytePtr, v27);
          goto LABEL_32;
        }
        return 851968;
      }
    }
    if (v14)
    {
      CFTypeID v28 = CFGetTypeID(v14);
      if (v28 == SecIdentityGetTypeID() || (CFTypeID v29 = CFGetTypeID(v14), v29 == SecCertificateGetTypeID()))
      {
        CFStringRef v19 = &__gss_c_cred_secidentity_oid_desc;
        attributes = (CFDictionaryRef)v14;
        goto LABEL_20;
      }
    }
    return 851968;
  }
  CFStringRef v19 = &__gss_c_cred_heimbase_oid_desc;
LABEL_20:
  OM_uint32 v32 = 0;
  unsigned int v12 = __ApplePrivate_gss_acquire_cred_ext(&v32, (uint64_t)desired_name, v19, (uint64_t)attributes, 0xFFFFFFFF, desired_mech, v18, output_cred_handle);
  if (v30)
  {
    bzero(v31, v30);
    free(v31);
  }
  if (error && v12) {
    *CFErrorRef error = _gss_mg_create_cferror(v12, v32, (gss_OID_desc *)desired_mech);
  }
  return v12;
}

OM_uint32 gss_aapl_change_password(gss_name_t name, gss_const_OID mech, CFDictionaryRef attributes, CFErrorRef *error)
{
  CFTypeID v22 = 0;
  unsigned int v21 = 0;
  _gss_load_mech();
  mechanism = __gss_get_mechanism(mech);
  if (!mechanism)
  {
    unsigned int v12 = 0;
    CFDataRef v13 = 0;
    unsigned int v21 = 0;
    unsigned int v11 = 0x10000;
    goto LABEL_14;
  }
  uint64_t v9 = (uint64_t)mechanism;
  if (!mechanism[63])
  {
    unsigned int v12 = 0;
    CFDataRef v13 = 0;
    unsigned int v21 = 0;
    unsigned int v11 = 0x100000;
    goto LABEL_14;
  }
  unsigned int mn = _gss_find_mn(&v21, (uint64_t)name, mech, &v22);
  if (mn)
  {
    unsigned int v11 = mn;
    unsigned int v12 = 0;
    CFDataRef v13 = 0;
    goto LABEL_14;
  }
  unint64_t Value = CFDictionaryGetValue(attributes, @"kGSSChangePasswordOldPassword");
  CFStringRef v15 = CFDictionaryGetValue(attributes, @"kGSSChangePasswordNewPassword");
  if (!Value)
  {
    heim_abort();
    goto LABEL_22;
  }
  if (!v15)
  {
LABEL_22:
    CFTypeID v20 = (gss_cred_id_t_desc_struct *)heim_abort();
    return GSSCredentialCopyUUID(v20);
  }
  unsigned int v12 = (char *)rk_cfstring2cstring();
  uint64_t v16 = rk_cfstring2cstring();
  CFDataRef v13 = (char *)v16;
  if (!v12 || !v16)
  {
    unsigned int v21 = 0;
    unsigned int v11 = 851968;
LABEL_14:
    if (error) {
      *CFErrorRef error = _gss_mg_create_cferror(v11, v21, (gss_OID_desc *)mech);
    }
    if (!v12) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  unsigned int v11 = (*(uint64_t (**)(unsigned int *, void *, char *, uint64_t))(v9 + 504))(&v21, v22[1].elements, v12, v16);
  if (v11)
  {
    _gss_mg_error(v9, v21);
    goto LABEL_14;
  }
LABEL_17:
  size_t v17 = strlen(v12);
  bzero(v12, v17);
  free(v12);
LABEL_18:
  if (v13)
  {
    size_t v18 = strlen(v13);
    bzero(v13, v18);
    free(v13);
  }
  return v11;
}

CFUUIDRef GSSCredentialCopyUUID(gss_cred_id_t credential)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  OM_uint32 minor_status = 0;
  gss_buffer_set_t data_set = 0;
  *(void *)&v5.byte0 = 0;
  *(void *)&v5.byte8 = 0;
  if (!gss_inquire_cred_by_oid(&minor_status, credential, &__gss_c_nt_uuid_oid_desc, &data_set)
    && data_set->count == 1
    && data_set->elements->length == 36)
  {
    int v1 = krb5_string_to_uuid();
    gss_release_buffer_set(&minor_status, &data_set);
    if (!v1) {
      return CFUUIDCreateFromUUIDBytes(0, v5);
    }
  }
  else
  {
    gss_release_buffer_set(&minor_status, &data_set);
  }
  return 0;
}

gss_cred_id_t GSSCreateCredentialFromUUID(CFUUIDRef uuid)
{
  gss_cred_id_t result = (gss_cred_id_t)CFUUIDCreateString(0, uuid);
  if (result)
  {
    gss_cred_id_t v2 = result;
    gss_name_t v3 = GSSCreateName(result, &__gss_c_nt_uuid_oid_desc, 0);
    gss_name_t input_name = v3;
    CFRelease(v2);
    if (v3)
    {
      OM_uint32 minor_status = 0;
      output_gss_cred_id_t cred_handle = 0;
      OM_uint32 v4 = gss_acquire_cred(&minor_status, v3, 0xFFFFFFFF, 0, 1, &output_cred_handle, 0, 0);
      gss_release_name(&minor_status, &input_name);
      if (v4) {
        return 0;
      }
      else {
        return output_cred_handle;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

gss_name_t GSSCreateName(CFTypeRef name, gss_const_OID name_type, CFErrorRef *error)
{
  if (error) {
    *CFErrorRef error = 0;
  }
  OM_uint32 minor_status = 0;
  input_name_buffer.length = 0;
  input_name_buffer.value = 0;
  gss_name_t v10 = 0;
  CFTypeID v5 = CFGetTypeID(name);
  if (v5 == CFStringGetTypeID())
  {
    uint64_t v6 = (void *)rk_cfstring2cstring();
    input_name_buffer.value = v6;
    if (!v6) {
      return (gss_name_t)851968;
    }
    input_name_buffer.length = strlen((const char *)v6);
    OM_uint32 v7 = gss_import_name(&minor_status, &input_name_buffer, name_type, &v10);
    free(input_name_buffer.value);
  }
  else
  {
    CFTypeID v8 = CFGetTypeID(name);
    if (v8 != CFDataGetTypeID()) {
      return 0;
    }
    input_name_buffer.value = (void *)CFDataGetBytePtr((CFDataRef)name);
    LODWORD(input_name_buffer.length) = CFDataGetLength((CFDataRef)name);
    input_name_buffer.length = LODWORD(input_name_buffer.length);
    OM_uint32 v7 = gss_import_name(&minor_status, &input_name_buffer, name_type, &v10);
  }
  if (v7) {
    return 0;
  }
  else {
    return v10;
  }
}

void GSSRuleAddMatch(const __CFDictionary *a1, const __CFString *a2, const void *a3)
{
  key = 0;
  value = 0;
  CFTypeID v22 = 0;
  if (FoldedHostName(a2, (CFTypeRef *)&value, (__CFString **)&key, (CFTypeRef *)&v22))
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    CFStringRef v6 = (const __CFString *)value;
    if (Mutable)
    {
      OM_uint32 v7 = Mutable;
      CFDictionarySetValue(Mutable, @"scheme", value);
      CFStringRef v8 = (const __CFString *)v22;
      CFDictionarySetValue(v7, @"path", v22);
      CFDictionarySetValue(v7, @"value", a3);
      uint64_t v9 = key;
      CFArrayRef v10 = (const __CFArray *)CFDictionaryGetValue(a1, key);
      if (v10) {
        CFArrayRef MutableCopy = CFArrayCreateMutableCopy(0, 0, v10);
      }
      else {
        CFArrayRef MutableCopy = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
      }
      CFDataRef v13 = MutableCopy;
      if (MutableCopy)
      {
        CFTypeID v20 = v9;
        unsigned int v21 = a1;
        CFIndex Count = CFArrayGetCount(MutableCopy);
        if (Count < 1)
        {
LABEL_14:
          CFArrayAppendValue(v13, v7);
        }
        else
        {
          CFIndex v15 = Count;
          CFIndex v16 = 0;
          while (1)
          {
            CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v13, v16);
            CFStringRef v18 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"path");
            CFStringRef v19 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"scheme");
            if (CFStringCompare(v19, v6, 1uLL) != kCFCompareLessThan)
            {
              if (CFStringHasPrefix(v8, v18)) {
                break;
              }
            }
            if (v15 == ++v16) {
              goto LABEL_14;
            }
          }
          CFArrayInsertValueAtIndex(v13, v16, v7);
        }
        uint64_t v9 = v20;
        CFDictionarySetValue(v21, v20, v13);
        CFRelease(v13);
      }
      CFRelease(v6);
      CFRelease(v9);
      CFRelease(v8);
      unsigned int v12 = v7;
    }
    else
    {
      CFRelease(value);
      CFRelease(key);
      unsigned int v12 = v22;
    }
    CFRelease(v12);
  }
}

uint64_t FoldedHostName(const __CFString *a1, CFTypeRef *a2, __CFString **a3, CFTypeRef *a4)
{
  *a2 = 0;
  *a3 = 0;
  *a4 = 0;
  if (CFStringFind(a1, @":", 0).location == -1) {
    goto LABEL_16;
  }
  CFURLRef v8 = CFURLCreateWithString(0, a1, 0);
  if (!v8) {
    goto LABEL_16;
  }
  CFURLRef v9 = v8;
  CFStringRef v10 = CFURLCopyHostName(v8);
  if (v10)
  {
    CFStringRef v11 = v10;
    *a3 = CopyFoldString(v10);
    CFRelease(v11);
    if (!*a3)
    {
      CFRelease(v9);
      return 0;
    }
  }
  else
  {
    *a3 = &stru_26C4DB438;
  }
  CFStringRef v13 = CFURLCopyScheme(v9);
  if (v13) {
    gss_buffer_desc_struct v14 = (__CFString *)v13;
  }
  else {
    gss_buffer_desc_struct v14 = &stru_26C4DB438;
  }
  *a2 = v14;
  CFStringRef v15 = CFURLCopyPath(v9);
  *a4 = v15;
  if (!v15) {
    goto LABEL_14;
  }
  if (CFEqual(v15, &stru_26C4DB438))
  {
    if (*a4) {
      CFRelease(*a4);
    }
LABEL_14:
    *a4 = @"/";
  }
  CFRelease(v9);
LABEL_16:
  if (!*a3)
  {
    *a3 = CopyFoldString(a1);
    if (*a2) {
      CFRelease(*a2);
    }
    *a2 = @"any";
    *a4 = @"/";
  }
  return 1;
}

const void *GSSRuleGetMatch(const __CFDictionary *a1, const __CFString *a2)
{
  CFStringRef v19 = 0;
  CFTypeID v20 = 0;
  CFTypeRef cf = 0;
  gss_cred_id_t v2 = 0;
  if (FoldedHostName(a2, &cf, &v20, (CFTypeRef *)&v19))
  {
    gss_name_t v3 = v20;
    uint64_t v4 = rk_cfstring2cstring();
    CFRelease(v3);
    if (v4)
    {
      CFStringRef v5 = (const __CFString *)cf;
      if (*(unsigned char *)v4)
      {
        CFStringRef v6 = v19;
        size_t v17 = (void *)v4;
        do
        {
          CFStringRef v7 = CFStringCreateWithCString(0, (const char *)v4, 0x8000100u);
          CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(a1, v7);
          CFRelease(v7);
          if (Value && (CFIndex Count = CFArrayGetCount(Value), Count >= 1))
          {
            CFIndex v10 = Count;
            uint64_t v11 = 1;
            do
            {
              CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(Value, v11 - 1);
              CFStringRef v13 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"scheme");
              if (CFStringCompare(v5, v13, 1uLL) && CFStringCompare(@"any", v13, 1uLL)
                || (CFStringRef v14 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"path"),
                    !CFStringHasPrefix(v6, v14)))
              {
                gss_cred_id_t v2 = 0;
              }
              else
              {
                gss_cred_id_t v2 = CFDictionaryGetValue(ValueAtIndex, @"value");
              }
              if (v11 >= v10) {
                break;
              }
              ++v11;
            }
            while (!v2);
          }
          else
          {
            gss_cred_id_t v2 = 0;
          }
          CFStringRef v15 = strchr((char *)(v4 + 1), 46);
          if (!v15) {
            break;
          }
          uint64_t v4 = (uint64_t)v15;
        }
        while (!v2);
        CFRelease(v5);
        free(v17);
        goto LABEL_22;
      }
      CFRelease(cf);
      free((void *)v4);
    }
    gss_cred_id_t v2 = 0;
    CFStringRef v6 = v19;
LABEL_22:
    CFRelease(v6);
  }
  return v2;
}

gss_name_t GSSCredentialCopyName(gss_cred_id_t cred)
{
  OM_uint32 minor_status = 0;
  gss_name_t v2 = 0;
  if (gss_inquire_cred(&minor_status, cred, &v2, 0, 0, 0)) {
    return 0;
  }
  else {
    return v2;
  }
}

OM_uint32 GSSCredentialGetLifetime(gss_cred_id_t cred)
{
  OM_uint32 minor_status = 0;
  OM_uint32 lifetime = 0;
  if (gss_inquire_cred(&minor_status, cred, 0, &lifetime, 0, 0)) {
    return 0;
  }
  else {
    return lifetime;
  }
}

CFStringRef GSSNameCreateDisplayString(gss_name_t name)
{
  OM_uint32 minor_status = 0;
  output_name_buffer.length = 0;
  output_name_buffer.value = 0;
  CFStringRef v1 = 0;
  if (!gss_display_name(&minor_status, name, &output_name_buffer, 0))
  {
    CFStringRef v1 = CFStringCreateWithBytes(0, (const UInt8 *)output_name_buffer.value, output_name_buffer.length, 0x8000100u, 0);
    gss_release_buffer(&minor_status, &output_name_buffer);
  }
  return v1;
}

CFErrorRef GSSCreateError(gss_const_OID mech, OM_uint32 major_status, OM_uint32 minor_status)
{
  return _gss_mg_create_cferror(major_status, minor_status, (gss_OID_desc *)mech);
}

uint64_t GSSCredGetLifetime(gss_cred_id_t cred_handle)
{
  OM_uint32 minor_status = 0;
  OM_uint32 lifetime = 0;
  if (gss_inquire_cred(&minor_status, cred_handle, 0, &lifetime, 0, 0)) {
    return 0;
  }
  else {
    return lifetime;
  }
}

gss_name_t GSSCredCopyName(gss_cred_id_t cred_handle)
{
  OM_uint32 minor_status = 0;
  gss_name_t v2 = 0;
  if (gss_inquire_cred(&minor_status, cred_handle, &v2, 0, 0, 0)) {
    return 0;
  }
  else {
    return v2;
  }
}

__CFString *CopyFoldString(CFStringRef theString)
{
  CFArrayRef MutableCopy = CFStringCreateMutableCopy(0, 0, theString);
  if (CopyFoldString_once != -1) {
    dispatch_once(&CopyFoldString_once, &__block_literal_global);
  }
  CFStringFold(MutableCopy, 1uLL, (CFLocaleRef)CopyFoldString_locale);
  return MutableCopy;
}

CFLocaleRef __CopyFoldString_block_invoke()
{
  CFLocaleRef result = CFLocaleCreate(0, @"C");
  CopyFoldString_locale = (uint64_t)result;
  return result;
}

uint64_t decode_GSSAPIContextToken(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C0](&asn1_GSSAPIContextToken, 0, a1, a2, a3, a4);
}

uint64_t encode_GSSAPIContextToken(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_GSSAPIContextToken, a1, a2, a3, a4);
}

uint64_t length_GSSAPIContextToken(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_GSSAPIContextToken, a1);
}

uint64_t free_GSSAPIContextToken(uint64_t a1)
{
  return MEMORY[0x270F992D0](&asn1_GSSAPIContextToken, a1);
}

uint64_t decode_IAKERB_HEADER(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C0](&asn1_IAKERB_HEADER, 0, a1, a2, a3, a4);
}

uint64_t encode_IAKERB_HEADER(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_IAKERB_HEADER, a1, a2, a3, a4);
}

uint64_t length_IAKERB_HEADER(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_IAKERB_HEADER, a1);
}

uint64_t free_IAKERB_HEADER(uint64_t a1)
{
  return MEMORY[0x270F992D0](&asn1_IAKERB_HEADER, a1);
}

uint64_t decode_Realm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C0](&asn1_Realm, 0, a1, a2, a3, a4);
}

uint64_t encode_Realm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_Realm, a1, a2, a3, a4);
}

uint64_t length_Realm(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_Realm, a1);
}

uint64_t free_Realm(uint64_t a1)
{
  return MEMORY[0x270F992D0](&asn1_Realm, a1);
}

uint64_t copy_Realm()
{
  return _asn1_copy_top();
}

uint64_t decode_PrincipalName(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C0](&asn1_PrincipalName, 0, a1, a2, a3, a4);
}

uint64_t encode_PrincipalName(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_PrincipalName, a1, a2, a3, a4);
}

uint64_t length_PrincipalName(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_PrincipalName, a1);
}

uint64_t free_PrincipalName(uint64_t a1)
{
  return MEMORY[0x270F992D0](&asn1_PrincipalName, a1);
}

uint64_t copy_PrincipalName()
{
  return _asn1_copy_top();
}

uint64_t TicketFlags2int(uint64_t result)
{
  return (unsigned __int16)result;
}

uint64_t KDCOptions2int(int a1)
{
  if (a1 >= 0) {
    return a1 & 0x5C01817F;
  }
  else {
    return a1 & 0x5C01817F | 0x80000000;
  }
}

uint64_t decode_Checksum(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C0](&asn1_Checksum, 0, a1, a2, a3, a4);
}

uint64_t encode_Checksum(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_Checksum, a1, a2, a3, a4);
}

uint64_t length_Checksum(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_Checksum, a1);
}

uint64_t free_Checksum(uint64_t a1)
{
  return MEMORY[0x270F992D0](&asn1_Checksum, a1);
}

uint64_t copy_Checksum()
{
  return _asn1_copy_top();
}

uint64_t free_AP_REQ(uint64_t a1)
{
  return MEMORY[0x270F992D0](&asn1_AP_REQ, a1);
}

uint64_t free_KRB_ERROR(uint64_t a1)
{
  return MEMORY[0x270F992D0](&asn1_KRB_ERROR, a1);
}

uint64_t decode_KERB_ERROR_DATA(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C0](&asn1_KERB_ERROR_DATA, 0, a1, a2, a3, a4);
}

uint64_t free_KERB_ERROR_DATA(uint64_t a1)
{
  return MEMORY[0x270F992D0](&asn1_KERB_ERROR_DATA, a1);
}

uint64_t decode_KRB5PrincipalName(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C0](&asn1_KRB5PrincipalName, 0, a1, a2, a3, a4);
}

uint64_t free_KRB5PrincipalName(uint64_t a1)
{
  return MEMORY[0x270F992D0](&asn1_KRB5PrincipalName, a1);
}

uint64_t free_MechType(uint64_t a1)
{
  return MEMORY[0x270F992D0](&asn1_MechType, a1);
}

uint64_t encode_MechTypeList(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_MechTypeList, a1, a2, a3, a4);
}

uint64_t length_MechTypeList(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_MechTypeList, a1);
}

uint64_t add_MechTypeList(unsigned int *a1)
{
  gss_name_t v2 = malloc_type_realloc(*((void **)a1 + 1), 16 * *a1 + 16, 0xCCADDF85uLL);
  if (!v2) {
    return 12;
  }
  *((void *)a1 + 1) = v2;
  uint64_t result = _asn1_copy_top();
  if (!result) {
    ++*a1;
  }
  return result;
}

uint64_t decode_NegotiationToken(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C0](&asn1_NegotiationToken, 0, a1, a2, a3, a4);
}

uint64_t encode_NegotiationToken(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_NegotiationToken, a1, a2, a3, a4);
}

uint64_t length_NegotiationToken(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_NegotiationToken, a1);
}

uint64_t free_NegotiationToken(uint64_t a1)
{
  return MEMORY[0x270F992D0](&asn1_NegotiationToken, a1);
}

uint64_t encode_NegotiationTokenWin(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_NegotiationTokenWin, a1, a2, a3, a4);
}

uint64_t length_NegotiationTokenWin(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_NegotiationTokenWin, a1);
}

uint64_t free_NegotiationTokenWin(uint64_t a1)
{
  return MEMORY[0x270F992D0](&asn1_NegotiationTokenWin, a1);
}

uint64_t decode_GSS_KRB5_FINISHED(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C0](&asn1_GSS_KRB5_FINISHED, 0, a1, a2, a3, a4);
}

uint64_t encode_GSS_KRB5_FINISHED(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_GSS_KRB5_FINISHED, a1, a2, a3, a4);
}

uint64_t length_GSS_KRB5_FINISHED(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_GSS_KRB5_FINISHED, a1);
}

uint64_t free_GSS_KRB5_FINISHED(uint64_t a1)
{
  return MEMORY[0x270F992D0](&asn1_GSS_KRB5_FINISHED, a1);
}

uint64_t encode_InitiatorNameAssertion(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F992C8](&asn1_InitiatorNameAssertion, a1, a2, a3, a4);
}

uint64_t length_InitiatorNameAssertion(uint64_t a1)
{
  return MEMORY[0x270F992D8](&asn1_InitiatorNameAssertion, a1);
}

uint64_t free_InitiatorNameAssertion(uint64_t a1)
{
  return MEMORY[0x270F992D0](&asn1_InitiatorNameAssertion, a1);
}

uint64_t _gsskrb5_create_8003_checksum(int *a1, uint64_t a2, uint64_t a3, void *a4, char a5, void *a6, void *a7, _DWORD *a8)
{
  v31[2] = *MEMORY[0x263EF8340];
  OM_uint32 minor_status = 0;
  buffer.length = 0;
  buffer.value = 0;
  uint64_t v15 = krb5_storage_emem();
  if (v15)
  {
    uint64_t v16 = v15;
    krb5_storage_set_byteorder();
    int checksum = krb5_store_int32();
    if (checksum) {
      goto LABEL_3;
    }
    if (a4)
    {
      if (gss_mg_gen_cb(a1, a4, (uint64_t)v31, &buffer))
      {
        int checksum = *a1;
        goto LABEL_3;
      }
    }
    else
    {
      v31[0] = 0;
      v31[1] = 0;
    }
    if (krb5_storage_write() == 16)
    {
      int checksum = krb5_store_int32();
      if (checksum
        || (a5 & 1) != 0 && (int checksum = store_ext(v16, 1, a6)) != 0
        || *a7 && (int checksum = store_ext(v16, 2, a7)) != 0)
      {
LABEL_3:
        gss_release_buffer(&minor_status, &buffer);
        krb5_storage_free();
        if (!checksum) {
          return 0;
        }
        goto LABEL_6;
      }
      if (!a3 || !a4 || !buffer.length)
      {
LABEL_28:
        *a8 = 32771;
        int checksum = krb5_storage_to_data();
        goto LABEL_3;
      }
      uint64_t v26 = 0;
      memset(v28, 0, sizeof(v28));
      int checksum = krb5_create_checksum();
      if (checksum) {
        goto LABEL_3;
      }
      uint64_t v19 = length_Checksum((uint64_t)v28);
      v27[0] = v19;
      CFTypeID v20 = malloc_type_malloc(v19, 0x1BEF2547uLL);
      v27[1] = v20;
      if (v20)
      {
        unsigned int v21 = v20;
        int v22 = encode_Checksum((uint64_t)v20 + v19 - 1, v19, (uint64_t)v28, (uint64_t)&v26);
        if (v22)
        {
          int checksum = v22;
          free(v21);
          goto LABEL_3;
        }
        if (v19 != v26)
        {
          uint64_t v23 = krb5_abortx();
          return store_ext(v23, v24, v25);
        }
        int checksum = store_ext(v16, 0, v27);
        krb5_data_free();
        if (checksum) {
          goto LABEL_3;
        }
        goto LABEL_28;
      }
    }
    int checksum = 12;
    goto LABEL_3;
  }
  gss_release_buffer(&minor_status, &buffer);
  int checksum = 12;
LABEL_6:
  *a1 = checksum;
  return 851968;
}

uint64_t store_ext(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = krb5_store_uint16();
  if (!result)
  {
    uint64_t result = krb5_store_uint16();
    if (!result)
    {
      uint64_t v5 = krb5_storage_write();
      uint64_t result = 12;
      if ((v5 & 0x8000000000000000) == 0)
      {
        if (v5 == *a3) {
          return 0;
        }
        else {
          return 12;
        }
      }
    }
  }
  return result;
}

uint64_t _gsskrb5_verify_8003_checksum(int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  int v13 = 0;
  long long v12 = 0uLL;
  __int16 v11 = 0;
  OM_uint32 minor_status = 0;
  buffer.length = 0;
  buffer.value = 0;
  krb5_data_zero();
  if (*(_DWORD *)a5 == 32771 && *(void *)(a5 + 8) >= 0x18uLL)
  {
    if (!krb5_storage_from_readonly_mem())
    {
      uint64_t result = 851968;
      int v7 = 12;
      goto LABEL_5;
    }
    krb5_storage_set_byteorder();
    int v7 = krb5_ret_uint32();
    if (!v7) {
      int v7 = 12;
    }
    gss_release_buffer(&minor_status, &buffer);
    krb5_data_free();
    krb5_storage_free();
  }
  else
  {
    int v7 = 0;
  }
  uint64_t result = 0x40000;
LABEL_5:
  *a1 = v7;
  return result;
}

uint64_t read_ext(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = krb5_ret_uint16();
  if (!result)
  {
    uint64_t result = krb5_ret_uint16();
    if (!result)
    {
      uint64_t result = krb5_data_alloc();
      if (!result)
      {
        uint64_t v5 = krb5_storage_read();
        if (v5 < 0 || v5 != *a3)
        {
          krb5_data_free();
          return 2314790661;
        }
        else
        {
          return 0;
        }
      }
    }
  }
  return result;
}

uint64_t _gsskrb5_register_acceptor_identity(_DWORD *a1, const char *a2)
{
  krb5_context context = 0;
  *a1 = 0;
  if (__ApplePrivate__gsskrb5_init(&context)) {
    return 851968;
  }
  pthread_mutex_lock(&gssapi_keytab_mutex);
  if (_gsskrb5_keytab)
  {
    krb5_kt_close(context, (krb5_keytab)_gsskrb5_keytab);
    _gsskrb5_keytab = 0;
  }
  if (a2)
  {
    if (!validate_keytab(context, a2))
    {
      pthread_mutex_unlock(&gssapi_keytab_mutex);
      return 0;
    }
    CFStringRef v6 = 0;
    if (asprintf(&v6, "FILE:%s", a2) < 0 || !v6)
    {
      pthread_mutex_unlock(&gssapi_keytab_mutex);
      return 851968;
    }
    int v5 = validate_keytab(context, v6);
    free(v6);
  }
  else
  {
    int v5 = krb5_kt_default(context, (krb5_keytab *)&_gsskrb5_keytab);
  }
  pthread_mutex_unlock(&gssapi_keytab_mutex);
  if (!v5) {
    return 0;
  }
  *a1 = v5;
  return 851968;
}

uint64_t validate_keytab(_krb5_context *a1, const char *a2)
{
  uint64_t have_content = krb5_kt_resolve(a1, a2, (krb5_keytab *)&_gsskrb5_keytab);
  if (!have_content)
  {
    uint64_t have_content = krb5_kt_have_content();
    if (have_content)
    {
      krb5_kt_close(a1, (krb5_keytab)_gsskrb5_keytab);
      _gsskrb5_keytab = 0;
    }
  }
  return have_content;
}

uint64_t _gsskrb5i_is_cfx(_krb5_context *a1, uint64_t a2, int a3)
{
  uint64_t result = krb5_auth_con_getlocalseqnumber(a1, *(krb5_auth_context *)(a2 + 40), (krb5_int32 *)(a2 + 12));
  *(_DWORD *)(a2 + 16) = 0;
  CFStringRef v6 = *(void **)(a2 + 40);
  if (a3)
  {
    int v7 = (_DWORD *)v6[5];
    if (v7) {
      goto LABEL_8;
    }
    CFURLRef v8 = (_DWORD **)(v6 + 6);
  }
  else
  {
    int v7 = (_DWORD *)v6[6];
    if (v7) {
      goto LABEL_8;
    }
    CFURLRef v8 = (_DWORD **)(v6 + 5);
  }
  int v7 = *v8;
  if (!*v8)
  {
    int v7 = (_DWORD *)v6[4];
    if (!v7) {
      return result;
    }
  }
LABEL_8:
  if (*v7 > 0x18u || ((1 << *v7) & 0x18100AE) == 0)
  {
    *(_DWORD *)(a2 + 76) |= 0x40u;
    unsigned int v10 = *(_DWORD *)(a2 + 8) & 0xFFFFFDFB;
    *(_DWORD *)(a2 + 8) = v10;
    if (a3)
    {
      int v11 = v10 | 1;
      *(_DWORD *)(a2 + 8) = v10 | 1;
      if (!v6[5]) {
        goto LABEL_24;
      }
      int v12 = 5;
    }
    else
    {
      if (!v6[6])
      {
        int v11 = v10;
LABEL_24:
        if ((*(unsigned char *)(a2 + 73) & 0x10) != 0) {
          *(_DWORD *)(a2 + 8) = v11 | 0x200;
        }
        goto LABEL_12;
      }
      int v12 = 4;
    }
    int v11 = v10 | v12;
    *(_DWORD *)(a2 + 8) = v10 | v12;
    goto LABEL_24;
  }
LABEL_12:
  if (*(void *)a2) {
    krb5_crypto_destroy();
  }

  return krb5_crypto_init();
}

uint64_t _gsskrb5_error_token(krb5_error_code *a1, const void **a2, krb5_context a3, krb5_error *a4, uint64_t a5, uint64_t a6, size_t *a7)
{
  v13[0] = 0;
  v13[1] = 0;
  krb5_error_code v10 = krb5_mk_error(a3, a4, 0);
  if (v10)
  {
    uint64_t v11 = 851968;
  }
  else
  {
    uint64_t v11 = _gsskrb5_encapsulate(a1, (uint64_t)v13, a7, &word_213D77BF8, a2);
    krb5_data_free();
    if (v11) {
      return v11;
    }
    krb5_error_code v10 = 0;
  }
  *a1 = v10;
  return v11;
}

uint64_t _gsspku2u_accept_sec_context(krb5_error_code *a1, void **a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t *a7, void *a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  return accept_sec_context(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, (uint64_t)&__gss_pku2u_mechanism_oid_desc, (uint64_t)pku2u_acceptor_start);
}

uint64_t accept_sec_context(krb5_error_code *a1, void **a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t *a7, void *a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  krb5_context v32 = 0;
  krb5_error_code v21 = __ApplePrivate__gsskrb5_init(&v32);
  if (v21)
  {
    *a1 = v21;
    return 851968;
  }
  else
  {
    *a8 = 0;
    a8[1] = 0;
    if (a6) {
      *a6 = 0;
    }
    if (a7) {
      *a7 = a12;
    }
    uint64_t v24 = (char *)*a2;
    if (!*a2)
    {
      uint64_t v28 = a3;
      CFTypeID v29 = a7;
      uint64_t ctx = _gsskrb5_create_ctx(a1, a2, v32, a5, a12);
      if (ctx) {
        return ctx;
      }
      uint64_t v24 = (char *)*a2;
      *((_DWORD *)v24 + 2) = *((_DWORD *)*a2 + 2) | 1;
      *((void *)v24 + 10) = a13;
      a7 = v29;
      a3 = v28;
    }
    size_t v30 = (pthread_mutex_t *)(v24 + 128);
    pthread_mutex_lock((pthread_mutex_t *)v24 + 2);
    v25 = (uint64_t (*)())*((void *)v24 + 10);
    while (1)
    {
      uint64_t v26 = ((uint64_t (*)(krb5_error_code *, char *, krb5_context, uint64_t, uint64_t, uint64_t, void *, uint64_t *, void *, uint64_t, uint64_t, uint64_t))v25)(a1, v24, v32, a3, a4, a5, a6, a7, a8, a9, a10, a11);
      if (*a8 || v26 != 0) {
        break;
      }
      v25 = (uint64_t (*)())*((void *)v24 + 10);
      if (v25 == step_acceptor_completed)
      {
        pthread_mutex_unlock(v30);
        return 0;
      }
    }
    uint64_t ctx = v26;
    pthread_mutex_unlock(v30);
    if (ctx >= 0x10000)
    {
      int v31 = 0;
      _gsskrb5_delete_sec_context(&v31, a2, 0);
    }
  }
  return ctx;
}

uint64_t pku2u_acceptor_start(_DWORD *a1, uint64_t *a2, uint64_t a3, uint64_t a4, unint64_t *a5, uint64_t a6, uint64_t a7, uint64_t a8, size_t *a9)
{
  if (!a2[28])
  {
    uint64_t v12 = krb5_storage_emem();
    a2[28] = v12;
    if (!v12)
    {
      *a1 = 12;
      return 851968;
    }
  }
  v18[0] = 0;
  v18[1] = 0;
  v17[0] = 0;
  v17[1] = 0;
  uint64_t v13 = _gsskrb5_decapsulate(a1, a5, v18, (unsigned __int16 *)"\x05\x01", a2[4]);
  if (!v13)
  {
    krb5_storage_write();
    int inited = heim_ipc_init_context();
    if (inited)
    {
      *a1 = inited;
    }
    else
    {
      uint64_t v14 = _gsskrb5_encapsulate(a1, (uint64_t)v17, a9, &word_213D77BFB, (const void **)a2[4]);
      heim_ipc_free_data();
      if (v14) {
        return v14;
      }
      krb5_storage_write();
      *a1 = 0;
    }
    return 851968;
  }
  uint64_t v14 = v13;
  if (v13 == 589824)
  {
    uint64_t v14 = 0;
    a2[10] = (uint64_t)gsskrb5_acceptor_start;
  }
  return v14;
}

uint64_t _gsskrb5_accept_sec_context(krb5_error_code *a1, void **a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t *a7, void *a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  return accept_sec_context(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, (uint64_t)&__gss_krb5_mechanism_oid_desc, (uint64_t)gsskrb5_acceptor_start);
}

uint64_t gsskrb5_acceptor_start(int *a1, uint64_t a2, _krb5_context *a3, const krb5_principal_data **a4, unint64_t *a5, uint64_t a6, krb5_principal *a7, void *a8, size_t *a9, unsigned int *a10, int *a11, void *a12)
{
  memset((char *)&v75.client + 4, 0, 20);
  krb5_error_code v19 = _gsskrb5_decapsulate(a1, a5, &v75.checksum, &word_213D77BFE, *(void *)(a2 + 32));
  if (v19)
  {
    unint64_t v20 = a5[1];
    v75.int checksum = (krb5_checksum *)*a5;
    *(void *)&v75.cusec = v20;
  }
  uint64_t v67 = a6;
  if (!a4)
  {
    int v22 = 0;
    krb5_error_code v21 = 0;
    *(void *)&ctype.magic = 0;
    v73 = 0;
    goto LABEL_10;
  }
  if (!*a4)
  {
    *(void *)&ctype.magic = 0;
    v73 = 0;
    goto LABEL_9;
  }
  *(void *)&ctype.magic = 0;
  v73 = 0;
  if (!krb5_principal_is_gss_hostbased_service())
  {
LABEL_9:
    int v22 = 0;
    krb5_error_code v21 = *a4;
    goto LABEL_10;
  }
  krb5_error_code v21 = 0;
  int v22 = 1;
LABEL_10:
  int ap_req_options = krb5_rd_req_in_ctx_alloc();
  if (ap_req_options) {
    goto LABEL_12;
  }
  int ap_req_options = krb5_rd_req_in_set_keytab();
  if (ap_req_options) {
    goto LABEL_12;
  }
  uint64_t v26 = a9;
  v65 = (krb5_auth_context *)(a2 + 40);
  uint64_t v27 = krb5_rd_req_ctx();
  krb5_rd_req_in_ctx_free();
  if (v19 && _gss_mg_log_level(5))
  {
    error_message = krb5_get_error_message(a3, v19);
    v68 = 0;
    if (v21)
    {
      krb5_unparse_name(a3, v21, &v68);
      v35 = v68;
    }
    else
    {
      v35 = 0;
    }
    if (!v35) {
      v35 = "<not specified>";
    }
    _gss_mg_log(5, "gss-asc: rd_req (server: %s) failed with: %d: %s", v28, v29, v30, v31, v32, v33, (char)v35);
    krb5_free_error_message(a3, error_message);
    if (v68) {
      krb5_xfree();
    }
    uint64_t v26 = a9;
  }
  if ((int)v27 <= -1765328204)
  {
    if (v27 == -1765328351 || v27 == -1765328347)
    {
      v36 = *(const void ***)(a2 + 32);
      p_int checksum = &v75.checksum;
      v37 = a1;
      v38 = a3;
      uint64_t v39 = v27;
      v40 = (krb5_principal_data *)v21;
      return send_error_token(v37, v38, (krb5_error *)v39, v40, (uint64_t)p_checksum, v36, v26);
    }
    if (v27 != -1765328343) {
      goto LABEL_44;
    }
LABEL_31:
    v36 = *(const void ***)(a2 + 32);
    v37 = a1;
    v38 = a3;
    uint64_t v39 = 2529638953;
    v40 = (krb5_principal_data *)v21;
    p_int checksum = 0;
    return send_error_token(v37, v38, (krb5_error *)v39, v40, (uint64_t)p_checksum, v36, v26);
  }
  if ((v27 + 1765328203) < 2) {
    goto LABEL_31;
  }
  if (v27)
  {
LABEL_44:
    *a1 = v27;
    return 851968;
  }
  v42 = v26;
  int ap_req_options = krb5_rd_req_out_get_ap_req_options();
  if (!ap_req_options)
  {
    int ap_req_options = krb5_rd_req_out_get_ticket();
    if (!ap_req_options)
    {
      int ap_req_options = krb5_rd_req_out_get_keyblock();
      if (!ap_req_options)
      {
        if (krb5_rd_req_out_get_flags()) {
          *(_DWORD *)(a2 + 76) |= 0x80u;
        }
        if (!v22) {
          goto LABEL_43;
        }
        uint64_t v43 = *(void *)(*(void *)(a2 + 112) + 144);
        v44 = *a4;
        if (*(_DWORD *)(v43 + 8))
        {
          v45 = **(const char ***)(v43 + 16);
          v46 = *(const char **)v44->realm.data;
          if (!strcmp(v45, v46))
          {
LABEL_43:
            int ap_req_options = 0;
            goto LABEL_47;
          }
        }
        else
        {
          v46 = *(const char **)v44->realm.data;
          v45 = **(const char ***)(v43 + 16);
        }
        krb5_set_error_message(a3, v19, "Expecting service %s but got %s", v46, v45);
        int ap_req_options = -1765328240;
      }
    }
  }
LABEL_47:
  *(void *)(a2 + 120) = *(void *)(*(void *)(a2 + 112) + 104);
  krb5_rd_req_out_ctx_free();
  if (ap_req_options)
  {
LABEL_12:
    *a1 = ap_req_options;
    return 851968;
  }
  int v47 = krb5_copy_principal(a3, *(krb5_const_principal *)(*(void *)(a2 + 112) + 136), (krb5_principal *)(a2 + 56));
  if (v47) {
    goto LABEL_50;
  }
  int v47 = krb5_copy_principal(a3, *(krb5_const_principal *)(*(void *)(a2 + 112) + 144), (krb5_principal *)(a2 + 64));
  if (v47) {
    goto LABEL_50;
  }
  uint64_t mic_compat = _gss_DES3_get_mic_compat(a1, a2, a3);
  if (mic_compat) {
    return mic_compat;
  }
  if (a7)
  {
    int v47 = krb5_copy_principal(a3, *(krb5_const_principal *)(*(void *)(a2 + 112) + 136), a7);
    if (v47) {
      goto LABEL_50;
    }
  }
  *(void *)&v75.magic = 0;
  int v47 = krb5_auth_con_getauthenticator(a3, *v65, (krb5_authenticator **)&v75);
  if (v47) {
    goto LABEL_50;
  }
  v48 = *(_DWORD **)(*(void *)&v75.magic + 40);
  if (!v48)
  {
    krb5_free_authenticator(a3, &v75);
    *a1 = 0;
    return 0x40000;
  }
  if (*v48 != 32771)
  {
    *(void *)&ctype.magic = 0;
    int v49 = krb5_crypto_init();
    if (v49)
    {
      int v51 = v49;
      krb5_free_authenticator(a3, &v75);
LABEL_64:
      uint64_t mic_compat = 851968;
LABEL_75:
      *a1 = v51;
      return mic_compat;
    }
    int v51 = krb5_verify_checksum(a3, ctype.magic, (const krb5_checksum *)0xA, 0, 0, *(krb5_const_pointer *)(*(void *)&v75.magic + 40), v50);
    krb5_free_authenticator(a3, &v75);
    krb5_crypto_destroy();
    if (!v51)
    {
      *(_DWORD *)(a2 + 72) = BYTE4(v75.client) & 2 | 0xC;
      goto LABEL_83;
    }
LABEL_74:
    uint64_t mic_compat = 393216;
    goto LABEL_75;
  }
  v73 = 0;
  uint64_t v74 = 0;
  *(void *)v72 = 0;
  if (*((void *)*v65 + 6))
  {
    int v47 = krb5_crypto_init();
    if (v47) {
      goto LABEL_50;
    }
  }
  krb5_data_zero();
  uint64_t mic_compat = _gsskrb5_verify_8003_checksum(a1, (uint64_t)a3, *(uint64_t *)v72, v67, *(void *)(*(void *)&v75.magic + 40));
  krb5_free_authenticator(a3, &v75);
  if (mic_compat)
  {
    krb5_crypto_destroy();
    return mic_compat;
  }
  if (!v73) {
    goto LABEL_82;
  }
  v68 = 0;
  krb5_const_pointer v69 = 0;
  ctype.data = 0;
  uint64_t v71 = 0;
  *(void *)&ctype.magic = 0;
  if (!*(void *)(a2 + 224))
  {
    krb5_crypto_destroy();
LABEL_73:
    krb5_data_free();
    int v51 = 0;
    goto LABEL_74;
  }
  int v52 = krb5_storage_to_data();
  if (v52)
  {
    int v51 = v52;
    krb5_crypto_destroy();
LABEL_71:
    krb5_data_free();
    goto LABEL_64;
  }
  if (!*((void *)*v65 + 6))
  {
    krb5_crypto_destroy();
    krb5_data_free();
    goto LABEL_73;
  }
  int v51 = decode_GSS_KRB5_FINISHED(v74, (uint64_t)v73, (uint64_t)&ctype, 0);
  krb5_data_free();
  if (v51)
  {
    krb5_crypto_destroy();
    goto LABEL_71;
  }
  int v51 = krb5_verify_checksum(a3, v72[0], (const krb5_checksum *)0x29, v69, (size_t)v68, &ctype, v53);
  free_GSS_KRB5_FINISHED((uint64_t)&ctype);
  krb5_data_free();
  if (v51)
  {
    krb5_crypto_destroy();
    goto LABEL_64;
  }
LABEL_82:
  krb5_crypto_destroy();
LABEL_83:
  if (*(void *)(a2 + 200))
  {
    int v47 = krb5_auth_con_init(a3, (krb5_auth_context *)(a2 + 48));
    if (v47) {
      goto LABEL_50;
    }
    krb5_auth_con_setkey();
    krb5_auth_con_setremotesubkey();
  }
  if (_gss_mg_log_level(10))
  {
    *(void *)&ctype.magic = 0;
    v73 = 0;
    krb5_unparse_name(a3, *(krb5_const_principal *)(a2 + 64), (char **)&ctype);
    krb5_unparse_name(a3, *(krb5_const_principal *)(a2 + 56), (char **)&v73);
    _gss_mg_log(10, "gss-asc: krb5 (server: %s client: %s) using session enctype: %d", v54, v55, v56, v57, v58, v59, ctype.magic);
    if (v73) {
      krb5_xfree();
    }
    if (*(void *)&ctype.magic) {
      krb5_xfree();
    }
  }
  int v60 = *(_DWORD *)(a2 + 72);
  if ((v60 & 2) != 0)
  {
    *(void *)&ctype.magic = 0;
    ctype.data = 0;
    _gsskrb5i_is_cfx(a3, a2, 1);
    if ((*(unsigned char *)(a2 + 76) & 0x40) != 0
      || (BYTE4(v75.client) & 4) != 0
      || (v73 = 0, !krb5_auth_con_getremotesubkey())
      && (int v63 = krb5_auth_con_setlocalsubkey(), krb5_free_keyblock(a3, v73), !v63))
    {
      *(_DWORD *)(a2 + 8) |= 4u;
      krb5_auth_con_addflags();
    }
    int v47 = krb5_mk_rep(a3, *v65, &ctype);
    if (!v47)
    {
      int v60 = *(_DWORD *)(a2 + 72);
      if ((v60 & 0x1000) != 0)
      {
        data = ctype.data;
        size_t *v42 = *(void *)&ctype.magic;
        v42[1] = (size_t)data;
      }
      else
      {
        uint64_t mic_compat = _gsskrb5_encapsulate(a1, (uint64_t)&ctype, v42, word_213D77C01, *(const void ***)(a2 + 32));
        krb5_data_free();
        if (mic_compat) {
          return mic_compat;
        }
        int v60 = *(_DWORD *)(a2 + 72);
      }
      goto LABEL_92;
    }
LABEL_50:
    *a1 = v47;
    return 851968;
  }
LABEL_92:
  int v61 = v60 | 0x100;
  *(_DWORD *)(a2 + 72) = v61;
  uint64_t v62 = *(void *)(*(void *)(a2 + 112) + 104);
  *(void *)(a2 + 120) = v62;
  *(_DWORD *)(a2 + 76) |= 2u;
  if (a8) {
    *a8 = *(void *)(a2 + 32);
  }
  if (a11)
  {
    uint64_t mic_compat = _gsskrb5_lifetime_left(a1, a3, v62, a11);
    if (mic_compat) {
      return mic_compat;
    }
    int v61 = *(_DWORD *)(a2 + 72);
  }
  if ((v61 & 0x1000) != 0)
  {
    if (a10) {
      *a10 = v61 & 0xFFFFFFFE;
    }
    *(void *)(a2 + 80) = acceptor_wait_for_dcestyle;
    return 1;
  }
  else
  {
    uint64_t mic_compat = gsskrb5_acceptor_ready(a1, a2, a3, a12);
    if (a10) {
      *a10 = *(_DWORD *)(a2 + 72);
    }
  }
  return mic_compat;
}

uint64_t _gssiakerb_accept_sec_context(krb5_error_code *a1, void **a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t *a7, void *a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  return accept_sec_context(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, (uint64_t)&__gss_iakerb_mechanism_oid_desc, (uint64_t)iakerb_acceptor_start);
}

uint64_t iakerb_acceptor_start(int *a1, uint64_t a2, _krb5_context *a3, uint64_t a4, unint64_t *a5, uint64_t a6, uint64_t a7, uint64_t a8, size_t *a9)
{
  if (!*(void *)(a2 + 224))
  {
    uint64_t v13 = krb5_storage_emem();
    *(void *)(a2 + 224) = v13;
    if (!v13)
    {
      int v17 = 12;
      goto LABEL_12;
    }
  }
  v21[0] = 0;
  v21[1] = 0;
  v20[0] = 0;
  v20[1] = 0;
  uint64_t v14 = _gsskrb5_iakerb_parse_header(a1, a3, a2, a5, v21);
  if (v14)
  {
    uint64_t header = v14;
    if (v14 == 589824)
    {
      uint64_t header = 0;
      *(void *)(a2 + 80) = gsskrb5_acceptor_start;
    }
    return header;
  }
  krb5_storage_write();
  if (*(void *)(a2 + 272))
  {
    if (krb5_realm_is_lkdc())
    {
      int inited = heim_ipc_init_context();
      if (inited)
      {
        *a1 = inited;
      }
      else
      {
        krb5_error_code v19 = (krb5_error *)heim_ipc_call();
        heim_ipc_free_context();
        if (!v19)
        {
          uint64_t header = _gsskrb5_iakerb_make_header(a1, a3, a2, *(void *)(a2 + 272), (uint64_t)v20, a9);
          heim_ipc_free_data();
          if (!header)
          {
            krb5_storage_write();
            return 1;
          }
          return header;
        }
        _gsskrb5_error_token(a1, *(const void ***)(a2 + 32), a3, v19, 0, 0, a9);
        *a1 = (int)v19;
      }
      return 851968;
    }
    int v17 = 22;
LABEL_12:
    *a1 = v17;
    return 851968;
  }
  heim_abort();
  return step_acceptor_completed();
}

uint64_t step_acceptor_completed()
{
  return 327680;
}

uint64_t send_error_token(krb5_error_code *a1, krb5_context a2, krb5_error *a3, krb5_principal_data *a4, uint64_t a5, const void **a6, size_t *a7)
{
  krb5_principal v9 = a4;
  krb5_principal v19 = 0;
  long long v18 = xmmword_2641F08B8;
  if (!a4 && a5)
  {
    uint64_t v17 = 0;
    memset(v16, 0, sizeof(v16));
    krb5_error_code v13 = krb5_decode_ap_req();
    if (v13 || (krb5_error_code v13 = _krb5_principalname2krb5_principal(), free_AP_REQ((uint64_t)v16), v13))
    {
      *a1 = v13;
      return 851968;
    }
    krb5_principal v9 = v19;
  }
  int v14 = _gsskrb5_error_token(a1, a6, a2, a3, (uint64_t)&v18, (uint64_t)v9, a7);
  if (v19) {
    krb5_free_principal(a2, v19);
  }
  if (v14) {
    return 851968;
  }
  *a1 = 0;
  return 1;
}

uint64_t acceptor_wait_for_dcestyle(int *a1, uint64_t a2, krb5_context a3, int a4, uint64_t *a5, int a6, krb5_principal *a7, int a8, uint64_t a9, _DWORD *a10, _DWORD *a11, void *a12)
{
  uint64_t v16 = *a5;
  uint64_t v17 = (char *)a5[1];
  *(void *)int v22 = 0;
  *(void *)&v23.magic = v16;
  v23.data = v17;
  int v18 = krb5_auth_con_getlocalseqnumber(a3, *(krb5_auth_context *)(a2 + 40), v22);
  if (v18
    || (int v18 = krb5_auth_con_getremoteseqnumber(a3, *(krb5_auth_context *)(a2 + 40), &v22[1])) != 0
    || (int v18 = krb5_auth_con_setremoteseqnumber()) != 0
    || (*(void *)krb5_error_code v21 = 0,
        krb5_int32 v20 = 0,
        krb5_auth_con_removeflags(),
        (int v18 = krb5_rd_rep(a3, *(krb5_auth_context *)(a2 + 40), &v23, (krb5_ap_rep_enc_part **)v21)) != 0))
  {
LABEL_5:
    *a1 = v18;
    return 851968;
  }
  krb5_free_ap_rep_enc_part(a3, *(krb5_ap_rep_enc_part **)v21);
  krb5_auth_con_setflags(a3, *(krb5_auth_context *)(a2 + 40), v20);
  v21[0] = 0;
  uint64_t result = _gsskrb5_lifetime_left(a1, a3, *(void *)(a2 + 120), v21);
  if (!result)
  {
    if (!v21[0]) {
      return 786432;
    }
    if (a11) {
      *a11 = v21[0];
    }
    if (a10) {
      *a10 = *(_DWORD *)(a2 + 72);
    }
    if (!a7 || (int v18 = krb5_copy_principal(a3, *(krb5_const_principal *)(a2 + 56), a7)) == 0)
    {
      krb5_int32 v20 = 0;
      v21[0] = 0;
      int v18 = krb5_auth_con_getremoteseqnumber(a3, *(krb5_auth_context *)(a2 + 40), v21);
      if (!v18)
      {
        int v18 = krb5_auth_con_getlocalseqnumber(a3, *(krb5_auth_context *)(a2 + 40), &v20);
        if (!v18)
        {
          if (v21[0] != v20) {
            return 8;
          }
          int v18 = krb5_auth_con_setremoteseqnumber();
          if (!v18) {
            return gsskrb5_acceptor_ready(a1, a2, a3, a12);
          }
        }
      }
    }
    goto LABEL_5;
  }
  return result;
}

uint64_t gsskrb5_acceptor_ready(int *a1, uint64_t a2, krb5_context a3, void *a4)
{
  krb5_int32 v16 = 0;
  krb5_auth_con_getremoteseqnumber(a3, *(krb5_auth_context *)(a2 + 40), &v16);
  _gsskrb5i_is_cfx(a3, a2, 1);
  int v8 = _gssapi_msg_order_f(*(_DWORD *)(a2 + 72));
  uint64_t v9 = _gssapi_msg_order_create(a1, (void *)(a2 + 24), v8, v16, 0);
  if (v9) {
    return v9;
  }
  int v10 = *(_DWORD *)(a2 + 72);
  if ((v10 & 2) == 0 && _gssapi_msg_order_f(v10)) {
    krb5_auth_con_setlocalseqnumber();
  }
  int v11 = *(_DWORD *)(a2 + 72);
  if (!*(void *)(a2 + 200) || (v11 & 1) == 0)
  {
    *(_DWORD *)(a2 + 72) = v11 & 0xFFFFFFFE;
    goto LABEL_27;
  }
  krb5_ccache id = 0;
  *a1 = 0;
  if (!a4)
  {
    if (!krb5_cc_default(a3, &id)) {
      goto LABEL_12;
    }
LABEL_13:
    uint64_t v9 = 0;
    *(_DWORD *)(a2 + 72) &= ~1u;
    goto LABEL_14;
  }
  *a4 = 0;
  if (krb5_cc_new_unique(a3, (const char *)*MEMORY[0x263F477A8], 0, &id)) {
    goto LABEL_13;
  }
LABEL_12:
  if (krb5_cc_initialize(a3, id, *(krb5_principal *)(a2 + 56))) {
    goto LABEL_13;
  }
  int v13 = krb5_rd_cred2();
  if (!v13)
  {
    uint64_t v12 = id;
    if (a4)
    {
      uint64_t v14 = _gsskrb5_krb5_import_cred(a1, id, 0, 0, a4);
      if (!v14)
      {
        *(_DWORD *)(*a4 + 8) |= 1u;
        krb5_cc_close(a3, id);
        goto LABEL_27;
      }
      uint64_t v9 = v14;
      uint64_t v12 = id;
      if (!id) {
        return v9;
      }
LABEL_16:
      krb5_cc_destroy(a3, v12);
      goto LABEL_26;
    }
    if (id)
    {
      uint64_t v9 = 0;
      goto LABEL_25;
    }
LABEL_27:
    uint64_t v9 = 0;
    *(void *)(a2 + 80) = step_acceptor_completed;
    *(_DWORD *)(a2 + 76) |= 2u;
    return v9;
  }
  *(_DWORD *)(a2 + 72) &= ~1u;
  *a1 = v13;
  uint64_t v9 = 851968;
LABEL_14:
  uint64_t v12 = id;
  if (!id) {
    goto LABEL_26;
  }
  if (a4) {
    goto LABEL_16;
  }
LABEL_25:
  krb5_cc_close(a3, v12);
LABEL_26:
  if (!v9) {
    goto LABEL_27;
  }
  return v9;
}

uint64_t __gsskrb5_ccache_lifetime(_DWORD *a1, _krb5_context *a2, _krb5_ccache *a3, uint64_t a4, void *a5)
{
  memset(&mcreds.client, 0, 112);
  long long v15 = 0u;
  uint64_t v16 = 0;
  *(void *)&mcreds.magic = a4;
  if (!krb5_principal_get_realm())
  {
    _gsskrb5_clear_status();
    *a1 = -1765328238;
    return 851968;
  }
  long long v13 = 0u;
  memset(creds, 0, sizeof(creds));
  int principal = krb5_make_principal();
  if (principal)
  {
    *a1 = principal;
    return 851968;
  }
  krb5_error_code v11 = krb5_cc_retrieve_cred(a2, a3, 0, &mcreds, (krb5_creds *)creds);
  krb5_free_principal(a2, mcreds.client);
  if (v11)
  {
    uint64_t result = 0;
    *a1 = 0;
    *a5 = 0;
  }
  else
  {
    *a5 = *(void *)&creds[56];
    krb5_free_cred_contents(a2, (krb5_creds *)creds);
    return 0;
  }
  return result;
}

uint64_t _gsskrb5_acquire_cred(krb5_error_code *a1, const krb5_principal_data *a2, uint64_t a3, uint64_t a4, unsigned __int16 a5, uint64_t *a6)
{
  unsigned int v7 = a5;
  if (a5 < 3u)
  {
    uint64_t v32 = 0;
    krb5_context v33 = 0;
    int v31 = 0;
    krb5_error_code v12 = __ApplePrivate__gsskrb5_init(&v33);
    if (v12)
    {
      *a1 = v12;
      return 851968;
    }
    *a6 = 0;
    long long v15 = (char *)malloc_type_calloc(1uLL, 0x88uLL, 0x1030040BE4FC7E4uLL);
    uint64_t v32 = v15;
    if (!v15)
    {
      int v8 = 12;
      goto LABEL_3;
    }
    pthread_mutex_init((pthread_mutex_t *)(v15 + 48), 0);
    if (a2)
    {
      if (a2->magic == -1203)
      {
        *(_DWORD *)creds = 0;
        uint64_t v16 = _acquire_uuid_name(a1, v33, (uint64_t)a2, creds, (uint64_t)v32);
        if (*(_DWORD *)creds)
        {
          *a1 = 0;
          uint64_t v13 = 0x20000;
LABEL_33:
          uint64_t v26 = (uint64_t *)&v32;
          goto LABEL_61;
        }
        uint64_t v13 = v16;
        if (v16) {
          goto LABEL_33;
        }
LABEL_59:
        uint64_t v29 = v32;
        *((_DWORD *)v32 + 8) = v7;
        *a1 = 0;
        *a6 = (uint64_t)v29;
        uint64_t v13 = _gsskrb5_inquire_cred(a1);
        if (!v13) {
          return v13;
        }
        uint64_t v26 = a6;
LABEL_61:
        _gsskrb5_release_cred(&v31, v26);
        return v13;
      }
      krb5_error_code v17 = krb5_copy_principal(v33, a2, (krb5_principal *)v32);
      if (v17)
      {
        krb5_error_code v18 = v17;
        _gsskrb5_release_cred(&v31, (uint64_t *)&v32);
        *a1 = v18;
        return 851968;
      }
    }
    if (v7 > 1) {
      goto LABEL_58;
    }
    krb5_int32 v20 = v32;
    krb5_principal v19 = v33;
    opt = 0;
    krb5_principal principal = 0;
    krb5_ccache id = 0;
    memset(creds, 0, sizeof(creds));
    long long v38 = 0u;
    if (!*(void *)v32) {
      goto LABEL_20;
    }
    if (!krb5_cc_cache_match(v33, *(krb5_principal *)v32, &id)) {
      goto LABEL_43;
    }
    krb5_error_code v21 = id;
    if (!id)
    {
LABEL_20:
      default_krb5_principal principal = krb5_cc_default(v19, &id);
      if (default_principal) {
        goto LABEL_40;
      }
      krb5_error_code v21 = id;
    }
    if (krb5_cc_get_principal(v19, v21, &principal))
    {
      krb5_cc_close(v19, id);
      krb5_principal principal = 0;
    }
    else
    {
      if (*(void *)v32)
      {
        if (!krb5_principal_compare(v19, *(krb5_const_principal *)v32, principal))
        {
          krb5_free_principal(v19, principal);
          krb5_principal principal = 0;
          krb5_cc_close(v19, id);
          krb5_ccache id = 0;
        }
      }
      else
      {
        default_krb5_principal principal = krb5_copy_principal(v19, principal, (krb5_principal *)v32);
        if (default_principal) {
          goto LABEL_40;
        }
      }
      if (principal) {
        goto LABEL_43;
      }
    }
    if (!*(void *)v32)
    {
      default_krb5_principal principal = krb5_get_default_principal();
      if (default_principal) {
        goto LABEL_40;
      }
    }
    default_krb5_principal principal = get_keytab(v19, (krb5_keytab *)v32, 0);
    if (default_principal) {
      goto LABEL_40;
    }
    if (krb5_cc_cache_match(v19, *(krb5_principal *)v32, &id))
    {
      default_krb5_principal principal = krb5_get_init_creds_opt_alloc(v19, &opt);
      if (!default_principal)
      {
        krb5_error_code init_creds_keytab = krb5_get_init_creds_keytab(v19, (krb5_creds *)creds, *(krb5_principal *)v32, *((krb5_keytab *)v32 + 2), 0, 0, opt);
        krb5_get_init_creds_opt_free(v19, opt);
        if (init_creds_keytab)
        {
LABEL_41:
          uint64_t v13 = 851968;
LABEL_50:
          if (*(void *)creds) {
            krb5_free_cred_contents(v19, (krb5_creds *)creds);
          }
          if (principal) {
            krb5_free_principal(v19, principal);
          }
          if (v13 && init_creds_keytab)
          {
            *a1 = init_creds_keytab;
            goto LABEL_64;
          }
          if (v13) {
            goto LABEL_64;
          }
LABEL_58:
          if ((a5 & 0xFFFD) != 0) {
            goto LABEL_59;
          }
          uint64_t v30 = acquire_acceptor_cred(a1, v33, (uint64_t)v32);
          if (!v30) {
            goto LABEL_59;
          }
          uint64_t v13 = v30;
LABEL_64:
          pthread_mutex_destroy((pthread_mutex_t *)((char *)v32 + 48));
          krb5_free_principal(v33, *(krb5_principal *)v32);
          free(v32);
          return v13;
        }
        default_krb5_principal principal = krb5_cc_new_unique(v19, (const char *)*MEMORY[0x263F477A8], 0, &id);
        if (!default_principal)
        {
          krb5_error_code v24 = krb5_cc_initialize(v19, id, *(krb5_principal *)creds);
          v25 = id;
          if (v24)
          {
            krb5_error_code init_creds_keytab = v24;
LABEL_47:
            krb5_cc_destroy(v19, v25);
            goto LABEL_41;
          }
          krb5_error_code v28 = krb5_cc_store_cred(v19, id, (krb5_creds *)creds);
          if (v28)
          {
            krb5_error_code init_creds_keytab = v28;
            v25 = id;
            goto LABEL_47;
          }
          *((void *)v32 + 3) = *(void *)&creds[56];
          v20[2] |= 1u;
LABEL_49:
          uint64_t v13 = 0;
          krb5_error_code init_creds_keytab = 0;
          *((void *)v20 + 5) = id;
          goto LABEL_50;
        }
      }
LABEL_40:
      krb5_error_code init_creds_keytab = default_principal;
      goto LABEL_41;
    }
LABEL_43:
    uint64_t v27 = __gsskrb5_ccache_lifetime(a1, v19, id, *(void *)v32, (void *)v32 + 3);
    if (v27)
    {
      uint64_t v13 = v27;
      krb5_cc_close(v19, id);
      krb5_error_code init_creds_keytab = 0;
      goto LABEL_50;
    }
    goto LABEL_49;
  }
  int v8 = 35224071;
LABEL_3:
  *a1 = v8;
  return 851968;
}

uint64_t _acquire_uuid_name(_DWORD *a1, _krb5_context *a2, uint64_t a3, _DWORD *a4, uint64_t a5)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  *a4 = 0;
  if (*(_DWORD *)a3 != -1203) {
    return 196608;
  }
  if (*(_DWORD *)(a3 + 8) != 1) {
    return 0x20000;
  }
  if (strcmp(*(const char **)(a3 + 24), "UUID")) {
    return 0x20000;
  }
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  if (krb5_string_to_uuid()) {
    return 0x20000;
  }
  int principal = krb5_cc_resolve_by_uuid();
  if (principal || (int principal = krb5_cc_get_principal(a2, *(krb5_ccache *)(a5 + 40), (krb5_principal *)a5)) != 0)
  {
    *a1 = principal;
    return 851968;
  }
  else
  {
    *(void *)&v11.magic = 0;
    v11.data = 0;
    if (krb5_cc_get_config(a2, *(krb5_ccache *)(a5 + 40), 0, "iakerb", &v11))
    {
      return __gsskrb5_ccache_lifetime(a1, a2, *(_krb5_ccache **)(a5 + 40), *(void *)a5, (void *)(a5 + 24));
    }
    else
    {
      *a4 = 1;
      *(void *)(a5 + 24) = 0x7FFFFFFFLL;
      krb5_data_free();
      return 0;
    }
  }
}

uint64_t acquire_acceptor_cred(_DWORD *a1, _krb5_context *a2, uint64_t a3)
{
  uint64_t result = get_keytab(a2, (krb5_keytab *)a3, 0);
  if (result)
  {
    int v7 = result;
    int v8 = *(_krb5_kt **)(a3 + 16);
    if (v8)
    {
      krb5_kt_close(a2, v8);
      *(void *)(a3 + 16) = 0;
    }
    *a1 = v7;
    return 851968;
  }
  else
  {
    *(void *)(a3 + 24) = 0x7FFFFFFFLL;
  }
  return result;
}

uint64_t _gssiakerb_acquire_cred(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t *a6)
{
  int v30 = 0;
  krb5_context v29 = 0;
  *(void *)&v27.magic = 0;
  v27.data = 0;
  int v26 = 0;
  int v10 = __ApplePrivate__gsskrb5_init(&v29);
  if (v10)
  {
    *a1 = v10;
    return 851968;
  }
  *a1 = 0;
  *a6 = 0;
  uint64_t v11 = 851968;
  if (a2)
  {
    if (a5 <= 1)
    {
      uint64_t v13 = (char *)malloc_type_calloc(1uLL, 0x88uLL, 0x1030040BE4FC7E4uLL);
      krb5_error_code v28 = v13;
      if (v13)
      {
        uint64_t v14 = (uint64_t)v13;
        pthread_mutex_init((pthread_mutex_t *)(v13 + 48), 0);
        uint64_t v15 = _acquire_uuid_name(a1, v29, a2, &v26, v14);
        if (v15)
        {
          uint64_t v11 = v15;
          _gsskrb5_release_cred(&v30, (uint64_t *)&v28);
          return v11;
        }
        if (!v26)
        {
          _gsskrb5_release_cred(&v30, (uint64_t *)&v28);
          return 0x20000;
        }
        if (!krb5_cc_get_config(v29, *(krb5_ccache *)(v14 + 40), 0, "password", &v27))
        {
          int v16 = asprintf((char **)v28 + 16, "%.*s", v27.magic, v27.data);
          bzero(v27.data, *(size_t *)&v27.magic);
          krb5_data_free();
          if (v16 < 1 || !*((void *)v28 + 16))
          {
            _gsskrb5_release_cred(&v30, (uint64_t *)&v28);
            *a1 = 12;
            return v11;
          }
          goto LABEL_23;
        }
        if (krb5_cc_get_config(v29, *((krb5_ccache *)v28 + 5), 0, "certificate-ref", &v27))
        {
          if (krb5_cc_get_config(v29, *((krb5_ccache *)v28 + 5), 0, "iakerb", &v27))
          {
            _gsskrb5_release_cred(&v30, (uint64_t *)&v28);
LABEL_24:
            *a1 = 0;
            return v11;
          }
          *((_DWORD *)v28 + 2) |= 4u;
          krb5_data_free();
LABEL_23:
          uint64_t v11 = 0;
          uint64_t v19 = (uint64_t)v28;
          *((_DWORD *)v28 + 8) = 1;
          *(void *)(v19 + 24) = 0x7FFFFFFFLL;
          *a6 = v19;
          goto LABEL_24;
        }
        int alloc = hx509_certs_init();
        if (alloc || (int alloc = hx509_query_alloc()) != 0)
        {
          int cert = alloc;
          krb5_data_free();
          hx509_certs_free();
        }
        else
        {
          hx509_query_match_option();
          hx509_query_match_option();
          hx509_query_match_persistent();
          int cert = _krb5_pk_find_cert();
          krb5_data_free();
          hx509_certs_free();
          hx509_query_free();
          if (!cert) {
            goto LABEL_23;
          }
          _gss_mg_log(1, "gss-krb5: failed to find certificate ref %d", v20, v21, v22, v23, v24, v25, cert);
        }
        _gsskrb5_release_cred(&v30, (uint64_t *)&v28);
        *a1 = cert;
      }
    }
  }
  return v11;
}

uint64_t _gss_iakerb_acquire_cred_ext(int *a1, const krb5_principal_data *a2, const gss_OID_desc *a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned int a7, void *a8)
{
  uint64_t v26 = 0;
  if (a7 > 1) {
    return 851968;
  }
  krb5_context context = 0;
  if (__ApplePrivate__gsskrb5_init(&context)) {
    return 851968;
  }
  if (gss_oid_equal(a3, &__gss_c_cred_password_oid_desc))
  {
    if (*(void *)a4 == -1 || !a2) {
      return 851968;
    }
LABEL_11:
    uint64_t v14 = (char *)malloc_type_calloc(1uLL, 0x88uLL, 0x1030040BE4FC7E4uLL);
    if (v14)
    {
      uint64_t v15 = v14;
      int v16 = (pthread_mutex_t *)(v14 + 48);
      pthread_mutex_init((pthread_mutex_t *)(v14 + 48), 0);
      *((_DWORD *)v15 + 8) = 1;
      krb5_error_code v17 = krb5_copy_principal(context, a2, (krb5_principal *)v15);
      if (v17)
      {
        int persistent = v17;
      }
      else
      {
        if (a4)
        {
          uint64_t v20 = malloc_type_malloc(*(void *)a4 + 1, 0x403DB1D6uLL);
          *((void *)v15 + 16) = v20;
          if (!v20)
          {
            krb5_free_principal(context, *(krb5_principal *)v15);
            pthread_mutex_destroy(v16);
            free(v15);
            uint64_t result = 851968;
            int persistent = 12;
            goto LABEL_33;
          }
          memcpy(v20, *(const void **)(a4 + 8), *(void *)a4);
          *(unsigned char *)(*((void *)v15 + 16) + *(void *)a4) = 0;
        }
        if (v26) {
          *((void *)v15 + 15) = heim_retain();
        }
        *((void *)v15 + 5) = 0;
        uint64_t v21 = (krb5_ccache *)(v15 + 40);
        *((void *)v15 + 2) = 0;
        *((void *)v15 + 3) = 0x7FFFFFFFLL;
        if (!krb5_cc_cache_match(context, *(krb5_principal *)v15, (krb5_ccache *)v15 + 5)
          || (int persistent = krb5_cc_new_unique(context, (const char *)*MEMORY[0x263F477A0], 0, (krb5_ccache *)v15 + 5)) == 0)
        {
          int persistent = krb5_cc_initialize(context, *((krb5_ccache *)v15 + 5), *(krb5_principal *)v15);
          if (!persistent)
          {
            *(void *)&v25.magic = 0;
            v25.data = 0;
            krb5_data_zero();
            krb5_cc_set_config(context, *((krb5_ccache *)v15 + 5), 0, "iakerb", &v25);
            uint64_t v24 = (const char *)*((void *)v15 + 16);
            if (!v24
              || (v25.data = (char *)*((void *)v15 + 16),
                  *(void *)&v25.magic = strlen(v24),
                  (int persistent = krb5_cc_set_config(context, *v21, 0, "password", &v25)) == 0))
            {
              if (!*((void *)v15 + 15)
                || (*(void *)&v25.magic = 0, v25.data = 0, (int persistent = hx509_cert_get_persistent()) == 0)
                && (int persistent = krb5_cc_set_config(context, *v21, 0, "certificate-ref", &v25),
                    der_free_octet_string(),
                    !persistent))
              {
                int persistent = 0;
                uint64_t result = 0;
                *a8 = v15;
                goto LABEL_33;
              }
            }
          }
        }
        krb5_free_principal(context, *(krb5_principal *)v15);
        uint64_t v22 = (void *)*((void *)v15 + 16);
        if (v22)
        {
          size_t v23 = strlen(*((const char **)v15 + 16));
          bzero(v22, v23);
          free(*((void **)v15 + 16));
        }
        if (*((void *)v15 + 15)) {
          heim_release();
        }
        if (*v21) {
          krb5_cc_destroy(context, *v21);
        }
      }
      pthread_mutex_destroy(v16);
      free(v15);
      goto LABEL_32;
    }
    return 851968;
  }
  if (gss_oid_equal(a3, &__gss_c_cred_certificate_oid_desc))
  {
    uint64_t v26 = a4;
    goto LABEL_10;
  }
  if (!gss_oid_equal(a3, &__gss_c_cred_secidentity_oid_desc))
  {
    uint64_t result = 851968;
    int persistent = -1765328181;
    goto LABEL_33;
  }
  int inited = hx509_cert_init_SecFramework();
  if (!inited)
  {
LABEL_10:
    a4 = 0;
    if (!a2) {
      return 851968;
    }
    goto LABEL_11;
  }
  int persistent = inited;
LABEL_32:
  uint64_t result = 851968;
LABEL_33:
  *a1 = persistent;
  return result;
}

uint64_t _gss_krb5_acquire_cred_ext(int *a1, const krb5_principal_data *a2, const gss_OID_desc *a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned __int16 a7, void *a8)
{
  uint64_t v90 = *MEMORY[0x263EF8340];
  opt = 0;
  uint64_t v83 = 0;
  krb5_context v81 = 0;
  krb5_ccache cache = 0;
  krb5_ccache id = 0;
  int v14 = __ApplePrivate__gsskrb5_init(&v81);
  if (v14)
  {
    *a1 = v14;
    return 851968;
  }
  int v15 = a7;
  if (a7 >= 2u)
  {
    int v16 = 35224071;
LABEL_5:
    *a1 = v16;
    return 851968;
  }
  if (!a2) {
    return 851968;
  }
  if (!gss_oid_equal(a3, &__gss_c_cred_heimbase_oid_desc))
  {
    if (!gss_oid_equal(a3, &__gss_c_cred_password_oid_desc)) {
      goto LABEL_36;
    }
    uint64_t v21 = malloc_type_malloc(*(void *)a4 + 1, 0xB8F40D19uLL);
    uint64_t v20 = v21;
    if (v21)
    {
      memcpy(v21, *(const void **)(a4 + 8), *(void *)a4);
      BOOL v22 = 0;
      uint64_t v74 = 0;
      krb5_authenticator v75 = 0;
      uint64_t v23 = 0;
      uint64_t v76 = 0;
      uint64_t v77 = 0;
      v78 = 0;
      uint64_t v24 = 0;
      v20[*(void *)a4] = 0;
      goto LABEL_38;
    }
    goto LABEL_19;
  }
  uint64_t v17 = heim_dict_copy_value();
  if (v17)
  {
    CFDataRef v18 = (const __CFData *)v17;
    tkrb5_ccache id = heim_get_tid();
    if (tid == heim_string_get_type_id())
    {
      uint64_t v20 = (unsigned char *)heim_string_copy_utf8();
      if (!v20) {
        goto LABEL_19;
      }
      goto LABEL_21;
    }
    int v25 = heim_get_tid();
    if (v25 != heim_data_get_type_id())
    {
      uint64_t v20 = 0;
      goto LABEL_21;
    }
    CFIndex Length = CFDataGetLength(v18);
    uint64_t v20 = malloc_type_malloc(Length + 1, 0xE570A1E9uLL);
    if (v20)
    {
      BytePtr = CFDataGetBytePtr(v18);
      CFIndex v28 = CFDataGetLength(v18);
      memcpy(v20, BytePtr, v28);
      v20[CFDataGetLength(v18)] = 0;
LABEL_21:
      heim_release();
      goto LABEL_22;
    }
LABEL_19:
    uint64_t v24 = 0;
    krb5_context v29 = 0;
    int v30 = 0;
    int v31 = 12;
LABEL_53:
    if (opt) {
      krb5_get_init_creds_opt_free(v81, opt);
    }
    if (v83) {
      krb5_init_creds_free();
    }
    if (v24) {
      free(v24);
    }
    if (v29) {
      free(v29);
    }
    if (v20)
    {
      size_t v42 = strlen(v20);
      bzero(v20, v42);
      free(v20);
    }
    if (cache) {
      krb5_cc_close(v81, cache);
    }
    if (id) {
      krb5_cc_destroy(v81, id);
    }
    if (v30)
    {
      if (*(void *)v30) {
        krb5_free_principal(v81, *(krb5_principal *)v30);
      }
      pthread_mutex_destroy((pthread_mutex_t *)(v30 + 48));
      free(v30);
    }
    *a1 = v31;
    return 851968;
  }
  uint64_t v20 = 0;
LABEL_22:
  if (heim_dict_copy_value())
  {
    krb5_context v29 = (void *)heim_string_copy_utf8();
    heim_release();
  }
  else
  {
    krb5_context v29 = 0;
  }
  if (heim_dict_copy_value())
  {
    v78 = (void *)heim_string_copy_utf8();
    heim_release();
  }
  else
  {
    v78 = 0;
  }
  uint64_t v76 = heim_dict_copy_value();
  uint64_t v77 = heim_dict_copy_value();
  uint64_t v32 = heim_dict_copy_value();
  heim_dict_copy_value();
  if (v32)
  {
    int inited = hx509_cert_init_SecFrameworkAuth();
    if (inited)
    {
      int v31 = inited;
      int v30 = 0;
      uint64_t v24 = 0;
      goto LABEL_47;
    }
    heim_release();
    heim_release();
  }
  krb5_authenticator v75 = (char *)v29;
  if (heim_dict_copy_value())
  {
    uint64_t v24 = (void *)heim_string_copy_utf8();
    heim_release();
  }
  else
  {
    uint64_t v24 = 0;
  }
  uint64_t v23 = heim_dict_copy_value();
  uint64_t v34 = heim_dict_copy_value();
  BOOL v22 = v20 == 0;
  if (!v20)
  {
LABEL_36:
    int v16 = -1765328181;
    goto LABEL_5;
  }
  uint64_t v74 = v34;
LABEL_38:
  *a8 = 0;
  v35 = (char *)malloc_type_calloc(1uLL, 0x88uLL, 0x1030040BE4FC7E4uLL);
  int v30 = v35;
  if (!v35)
  {
    init_creds_opt_int alloc = krb5_enomem();
LABEL_45:
    int v31 = init_creds_opt_alloc;
LABEL_46:
    krb5_context v29 = v75;
LABEL_47:
    uint64_t v39 = v76;
    uint64_t v40 = v77;
    v41 = v78;
    if (!v78)
    {
LABEL_49:
      if (v39) {
        heim_release();
      }
      if (v40) {
        heim_release();
      }
      goto LABEL_53;
    }
LABEL_48:
    free(v41);
    goto LABEL_49;
  }
  uint64_t v73 = v23;
  pthread_mutex_init((pthread_mutex_t *)(v35 + 48), 0);
  init_creds_opt_int alloc = krb5_copy_principal(v81, a2, (krb5_principal *)v30);
  if (init_creds_opt_alloc) {
    goto LABEL_45;
  }
  uint64_t prefix_ops = krb5_cc_get_prefix_ops();
  if (prefix_ops == MEMORY[0x263F477C8] || prefix_ops == MEMORY[0x263F477B8] || prefix_ops == MEMORY[0x263F477C0]) {
    long long v38 = "XCTEMP";
  }
  else {
    long long v38 = v75;
  }
  int v31 = krb5_cc_new_unique(v81, v38, 0, &id);
  if (v31) {
    goto LABEL_46;
  }
  init_creds_opt_int alloc = krb5_get_init_creds_opt_alloc(v81, &opt);
  if (init_creds_opt_alloc) {
    goto LABEL_45;
  }
  krb5_principal_get_realm();
  krb5_get_init_creds_opt_set_default_flags();
  krb5_get_init_creds_opt_set_forwardable(opt, 1);
  krb5_get_init_creds_opt_set_proxiable(opt, 1);
  krb5_get_init_creds_opt_set_renew_life(opt, 2592000);
  krb5_get_init_creds_opt_set_canonicalize((krb5_get_init_creds_opt *)v81, (int)opt);
  krb5_get_init_creds_opt_set_win2k();
  init_creds_opt_int alloc = krb5_init_creds_init();
  if (init_creds_opt_alloc) {
    goto LABEL_45;
  }
  if (!v22)
  {
    int v31 = krb5_init_creds_set_password();
    size_t v44 = strlen(v20);
    bzero(v20, v44);
    free(v20);
    if (v31)
    {
      uint64_t v20 = 0;
      goto LABEL_46;
    }
  }
  if (v24)
  {
    int v31 = krb5_init_creds_set_kdc_hostname();
    free(v24);
    if (v31)
    {
LABEL_150:
      uint64_t v20 = 0;
      uint64_t v24 = 0;
      goto LABEL_46;
    }
  }
  if (v78)
  {
    int v45 = krb5_init_creds_set_sitename();
    if (v45)
    {
      int v31 = v45;
      uint64_t v24 = 0;
      uint64_t v20 = 0;
      krb5_context v29 = v75;
      uint64_t v39 = v76;
      uint64_t v40 = v77;
      v41 = v78;
      goto LABEL_48;
    }
  }
  if (!v77 || (int v46 = heim_get_tid(), v46 != heim_dict_get_type_id()))
  {
    CFDataRef theData = 0;
    CFDataRef v47 = 0;
    uint64_t v48 = 0;
    int v49 = 0;
    goto LABEL_95;
  }
  long long v89 = 0uLL;
  CFDataRef v47 = (const __CFData *)heim_dict_copy_value();
  CFDataRef theData = (const __CFData *)heim_dict_copy_value();
  uint64_t v48 = heim_dict_copy_value();
  if (v48)
  {
    int v49 = (void *)heim_string_copy_utf8();
    if (!v47)
    {
      uint64_t v50 = NEHelperCacheCopyAppUUIDMapping();
      if (v50)
      {
        size_t v53 = (void *)v50;
        if (MEMORY[0x216698370](v50, v51, v52) == MEMORY[0x263EF86D8] && xpc_array_get_count(v53))
        {
          long long v89 = *(_OWORD *)xpc_array_get_uuid(v53, 0);
          xpc_release(v53);
          uint64_t v62 = "NEHelperCacheCopyAppUUIDMapping";
          goto LABEL_107;
        }
        xpc_release(v53);
      }
      uint64_t v54 = v81;
      v70 = v49;
      uint64_t v55 = "Failed getting app uuid for signing identity: %s";
LABEL_110:
      int v31 = 22;
      krb5_set_error_message(v54, 22, v55, v70);
      goto LABEL_142;
    }
  }
  else
  {
    if (!v47)
    {
      if (!theData)
      {
        int v31 = 22;
        krb5_set_error_message(v81, 22, "No useful app source identity");
        int v49 = 0;
        goto LABEL_142;
      }
      char v63 = 0;
      int v49 = 0;
      uint64_t v71 = "unknown";
      goto LABEL_130;
    }
    int v49 = 0;
  }
  int v59 = heim_get_tid();
  if (v59 != heim_data_get_type_id() || CFDataGetLength(v47) != 16)
  {
    uint64_t v54 = v81;
    uint64_t v55 = "Failed getting app uuid";
    goto LABEL_110;
  }
  long long v89 = *(_OWORD *)CFDataGetBytePtr(v47);
  uint64_t v62 = "passed-in";
LABEL_107:
  LOBYTE(v71) = (_BYTE)v62;
  if (!theData) {
    goto LABEL_137;
  }
  char v63 = 1;
LABEL_130:
  int v66 = heim_get_tid();
  if (v66 != heim_data_get_type_id() || CFDataGetLength(theData) != 32)
  {
    krb5_set_error_message(v81, 22, "Failed getting audittoken");
LABEL_136:
    int v31 = 22;
    goto LABEL_142;
  }
  uint64_t v67 = CFDataGetBytePtr(theData);
  long long v68 = *((_OWORD *)v67 + 1);
  long long v87 = *(_OWORD *)v67;
  long long v88 = v68;
  *(_OWORD *)atoken.val = v87;
  *(_OWORD *)&atoken.val[4] = v68;
  pid_t v69 = audit_token_to_pid(&atoken);
  if (v63) {
    goto LABEL_137;
  }
  uint64_t v86 = 0;
  long long v85 = 0u;
  memset(&atoken, 0, sizeof(atoken));
  if (proc_pidinfo(v69, 17, 1uLL, &atoken, 56) != 56)
  {
    krb5_set_error_message(v81, 22, "Failed getting PROC_PIDUNIQIDENTIFIERINFO");
    goto LABEL_136;
  }
  long long v89 = *(_OWORD *)atoken.val;
  uint64_t v71 = "audit-token";
LABEL_137:
  _gss_mg_log(1, "gss-krb5: setting source app: %s - %s, %d uuid: %02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x", BYTE12(v89), BYTE13(v89), BYTE14(v89), HIBYTE(v89), v60, v61, (char)v71);
  int v56 = krb5_init_creds_set_source_process();
  if (v56) {
    goto LABEL_96;
  }
LABEL_95:
  int v56 = krb5_init_creds_get();
  if (v56) {
    goto LABEL_96;
  }
  *((void *)v30 + 3) = _krb5_init_creds_get_cred_endtime();
  cred_client = (const krb5_principal_data *)_krb5_init_creds_get_cred_client();
  if (cred_client)
  {
    uint64_t v58 = cred_client;
    if (!krb5_principal_compare(v81, cred_client, *(krb5_const_principal *)v30))
    {
      krb5_free_principal(v81, *(krb5_principal *)v30);
      int v56 = krb5_copy_principal(v81, v58, (krb5_principal *)v30);
      if (v56) {
        goto LABEL_96;
      }
    }
  }
  if (v75)
  {
    int v56 = krb5_cc_resolve(v81, v75, &cache);
    if (v56) {
      goto LABEL_96;
    }
  }
  else if (!v74)
  {
    krb5_cc_cache_match(v81, *(krb5_principal *)v30, &cache);
  }
  int v56 = krb5_init_creds_store();
  if (v56) {
    goto LABEL_96;
  }
  int v56 = krb5_init_creds_store_config();
  if (v56) {
    goto LABEL_96;
  }
  if (v76) {
    krb5_cc_set_acl();
  }
  if (v73)
  {
    int v56 = check_credential(v81, v83, *(void *)v30, id);
    if (v56) {
      goto LABEL_96;
    }
  }
  krb5_init_creds_free();
  uint64_t v83 = 0;
  krb5_get_init_creds_opt_free(v81, opt);
  opt = 0;
  uint64_t ops = krb5_cc_get_ops();
  v65 = cache;
  if (ops == MEMORY[0x263F477C8] && !cache)
  {
    int v56 = krb5_cc_new_unique(v81, "XCACHE", 0, &cache);
    if (!v56)
    {
      v65 = cache;
      goto LABEL_123;
    }
LABEL_96:
    int v31 = v56;
LABEL_142:
    if (v47) {
      heim_release();
    }
    if (theData) {
      heim_release();
    }
    if (v48) {
      heim_release();
    }
    if (v49) {
      free(v49);
    }
    goto LABEL_150;
  }
LABEL_123:
  if (!v65)
  {
    *((void *)v30 + 5) = id;
    goto LABEL_153;
  }
  int v56 = krb5_cc_move(v81, id, v65);
  if (v56) {
    goto LABEL_96;
  }
  *((void *)v30 + 5) = cache;
  krb5_ccache cache = 0;
  krb5_ccache id = 0;
LABEL_153:
  *((_DWORD *)v30 + 8) = v15;
  *a1 = 0;
  *a8 = v30;
  if (v75) {
    free(v75);
  }
  if (v78) {
    free(v78);
  }
  if (v77) {
    heim_release();
  }
  if (v47) {
    heim_release();
  }
  if (theData) {
    heim_release();
  }
  if (v48) {
    heim_release();
  }
  if (v49) {
    free(v49);
  }
  heim_release();
  return 0;
}

uint64_t check_credential(_krb5_context *a1, uint64_t a2, uint64_t a3, _krb5_ccache *a4)
{
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  krb5_auth_context v19 = 0;
  uint64_t v20 = 0;
  krb5_principal v17 = 0;
  krb5_principal v18 = 0;
  *(void *)&v16.magic = 0;
  v16.data = 0;
  memset(v21, 0, sizeof(v21));
  memset(&v22, 0, sizeof(v22));
  krb5_data_zero();
  type_krb5_ccache id = heim_dict_get_type_id();
  if (type_id != heim_get_tid() || (uint64_t v8 = heim_dict_copy_value()) == 0)
  {
LABEL_10:
    uint64_t credentials = krb5_sname_to_principal(a1, 0, "host", 3, &v17);
    if (credentials)
    {
LABEL_13:
      uint64_t v10 = credentials;
      goto LABEL_14;
    }
    krb5_principal v11 = v17;
    krb5_principal v18 = v17;
LABEL_12:
    *(void *)uint64_t v21 = a3;
    *(void *)&v21[8] = v11;
    uint64_t credentials = krb5_get_credentials(a1, 0, a4, (krb5_creds *)v21, &v20);
    if (!credentials)
    {
      uint64_t v10 = krb5_mk_req_extended(a1, &v19, 0, 0, v20, &v16);
      krb5_auth_con_free(a1, v19);
      krb5_auth_context v19 = 0;
      if (v10) {
        goto LABEL_14;
      }
      uint64_t v10 = krb5_rd_req_in_ctx_alloc();
      if (v10) {
        return v10;
      }
      uint64_t credentials = krb5_rd_req_in_set_pac_check();
      if (!credentials)
      {
        if (krb5_init_creds_get_as_reply_key()
          || (uint64_t credentials = krb5_rd_req_in_set_as_reply_key(), !credentials))
        {
          uint64_t credentials = krb5_rd_req_ctx();
          if (!credentials)
          {
            uint64_t v13 = krb5_rd_req_out_copy_pac();
            if (v13)
            {
              v15[0] = 0;
              v15[1] = 0;
              if (!krb5_pac_copy_credential_package()) {
                krb5_data_free();
              }
            }
            uint64_t v10 = 0;
            goto LABEL_15;
          }
        }
      }
    }
    goto LABEL_13;
  }
  LODWORD(v15[0]) = 0;
  underlaying_mech_name = _gss_mg_get_underlaying_mech_name(v8, &__gss_krb5_mechanism_oid_desc);
  if (underlaying_mech_name)
  {
    if (_gsskrb5_canon_name(v15, a1, 0, 0, (const krb5_principal_data *)underlaying_mech_name, &v18))
    {
      if (LODWORD(v15[0])) {
        uint64_t v10 = LODWORD(v15[0]);
      }
      else {
        uint64_t v10 = 22;
      }
      goto LABEL_14;
    }
    krb5_principal v11 = v18;
    if (v18) {
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  uint64_t v10 = 22;
LABEL_14:
  uint64_t v13 = 0;
LABEL_15:
  if (v20) {
    krb5_free_creds(a1, v20);
  }
  if (v17) {
    krb5_free_principal(a1, v17);
  }
  if (v23) {
    krb5_rd_req_in_ctx_free();
  }
  if (v24) {
    krb5_rd_req_out_ctx_free();
  }
  if (v13) {
    krb5_pac_free();
  }
  krb5_free_keyblock_contents(a1, &v22);
  krb5_auth_con_free(a1, v19);
  return v10;
}

uint64_t _gsspku2u_principal(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v12 = 0;
  *a3 = 0;
  if (!hx509_cert_find_subjectAltName_otherName())
  {
    if (v13)
    {
      unint64_t v7 = 0;
      unsigned int v8 = 1;
      do
      {
        memset(v11, 0, sizeof(v11));
        if (decode_KRB5PrincipalName(*(void *)(v14 + 16 * v7 + 8), *(void *)(v14 + 16 * v7), (uint64_t)v11, 0))
        {
          BOOL v9 = 0;
        }
        else
        {
          int v10 = _krb5_principalname2krb5_principal();
          free_KRB5PrincipalName((uint64_t)v11);
          BOOL v9 = v10 == 0;
          if (v9) {
            break;
          }
        }
        unint64_t v7 = v8++;
      }
      while (v13 > v7);
      hx509_free_octet_string_list();
      if (v9) {
        return 0;
      }
    }
    else
    {
      hx509_free_octet_string_list();
    }
  }
  if (hx509_cert_get_appleid()
    || (int principal = krb5_make_principal(), MEMORY[0x2166971D0](v12), principal))
  {
    uint64_t result = krb5_make_principal();
    if (result) {
      return result;
    }
    int v6 = 11;
  }
  else
  {
    int v6 = 10;
  }
  uint64_t result = 0;
  *(_DWORD *)*a3 = v6;
  return result;
}

uint64_t _gsspku2u_acquire_cred(_DWORD *a1, const krb5_principal_data *a2, uint64_t a3, uint64_t a4, unsigned __int16 a5, void *a6, void *a7, _DWORD *a8)
{
  unsigned int v9 = a5;
  if (a5 >= 3u)
  {
    *a1 = 35224071;
    return 851968;
  }
  krb5_context context = 0;
  int v15 = __ApplePrivate__gsskrb5_init(&context);
  if (v15)
  {
    *a1 = v15;
    return 851968;
  }
  *a6 = 0;
  if (a8) {
    *a8 = -1;
  }
  if (a7) {
    *a7 = 0;
  }
  if (a2 && !krb5_principal_is_pku2u())
  {
    *a1 = 0;
    return 0x20000;
  }
  else
  {
    krb5_principal v17 = (char *)malloc_type_calloc(1uLL, 0x88uLL, 0x1030040BE4FC7E4uLL);
    if (!v17) {
      return 851968;
    }
    krb5_principal v18 = v17;
    krb5_auth_context v19 = (pthread_mutex_t *)(v17 + 48);
    pthread_mutex_init((pthread_mutex_t *)(v17 + 48), 0);
    *((_DWORD *)v18 + 8) = v9;
    if (v9 <= 1)
    {
      int alloc = hx509_certs_init();
      if (alloc) {
        goto LABEL_24;
      }
      int alloc = hx509_query_alloc();
      if (alloc) {
        goto LABEL_24;
      }
      hx509_query_match_option();
      hx509_query_match_option();
      if (a2) {
        hx509_query_match_cmp_func();
      }
      int alloc = _krb5_pk_find_cert();
      hx509_query_free();
      if (alloc
        || (!a2
          ? (int v21 = _gsspku2u_principal((uint64_t)context, v18[15], v18))
          : (int v21 = krb5_copy_principal(context, a2, (krb5_principal *)v18)),
            (int alloc = v21) != 0))
      {
LABEL_24:
        *a1 = alloc;
LABEL_25:
        krb5_keyblock v22 = (_krb5_kt *)v18[2];
        if (v22) {
          krb5_kt_close(context, v22);
        }
        pthread_mutex_destroy(v19);
        free(v18);
        return 851968;
      }
    }
    if ((a5 & 0xFFFD) == 0)
    {
      int keytab = get_keytab(context, (krb5_keytab *)v18, 1);
      if (keytab)
      {
        *a1 = keytab;
        goto LABEL_25;
      }
    }
    uint64_t result = 0;
    *a6 = v18;
  }
  return result;
}

uint64_t match_pkinit_san(uint64_t a1, uint64_t a2, void *a3)
{
  return MEMORY[0x270F39638](*a3, a3[1], a2, 0);
}

uint64_t get_keytab(_krb5_context *a1, krb5_keytab *a2, int a3)
{
  pthread_mutex_lock(&gssapi_keytab_mutex);
  if (_gsskrb5_keytab)
  {
    *(void *)&entry.magic = 0;
    uint64_t full_name = krb5_kt_get_full_name();
    if (!full_name)
    {
      uint64_t full_name = krb5_kt_resolve(a1, *(const char **)&entry.magic, a2 + 2);
      krb5_xfree();
    }
    if (full_name) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t full_name = krb5_kt_default(a1, a2 + 2);
    if (full_name) {
      goto LABEL_7;
    }
  }
  if (*a2)
  {
    uint64_t v11 = 0;
    memset(&entry, 0, sizeof(entry));
    if (krb5_principal_is_gss_hostbased_service())
    {
      unsigned int v8 = (const char *)**((void **)*a2 + 2);
      if (!check_keytab(a1, (uint64_t)a2, v8, a3))
      {
        uint64_t full_name = 2529639093;
        krb5_set_error_message(a1, -1765328203, "Didn't find service %s in keytab", v8);
        goto LABEL_7;
      }
LABEL_14:
      uint64_t full_name = 0;
      goto LABEL_15;
    }
    uint64_t full_name = krb5_kt_get_entry(a1, a2[2], (krb5_const_principal)*a2, 0, 0, &entry);
    if (!full_name)
    {
      krb5_free_principal(a1, (krb5_principal)*a2);
      uint64_t full_name = krb5_copy_principal(a1, *(krb5_const_principal *)&entry.magic, (krb5_principal *)a2);
      krb5_kt_free_entry();
      if (!full_name) {
        goto LABEL_14;
      }
    }
  }
  else
  {
    if (check_keytab(a1, (uint64_t)a2, 0, a3)) {
      goto LABEL_14;
    }
    uint64_t full_name = 2529639093;
  }
LABEL_7:
  unint64_t v7 = a2[2];
  if (v7)
  {
    krb5_kt_close(a1, v7);
    a2[2] = 0;
  }
LABEL_15:
  pthread_mutex_unlock(&gssapi_keytab_mutex);
  return full_name;
}

uint64_t check_keytab(_krb5_context *a1, uint64_t a2, const char *a3, int a4)
{
  uint64_t v17 = 0;
  memset(&entry, 0, sizeof(entry));
  memset(cursor, 0, sizeof(cursor));
  if (krb5_kt_start_seq_get(a1, *(krb5_keytab *)(a2 + 16), cursor)) {
    return 0;
  }
  while (1)
  {
    while (1)
    {
      if (krb5_kt_next_entry(a1, *(krb5_keytab *)(a2 + 16), &entry, cursor))
      {
        uint64_t v8 = 0;
        goto LABEL_20;
      }
      if (!a3) {
        break;
      }
      if (*(_DWORD *)(*(void *)&entry.magic + 8))
      {
        int v9 = strcmp(**(const char ***)(*(void *)&entry.magic + 16), a3);
        if (v9) {
          BOOL v10 = 1;
        }
        else {
          BOOL v10 = a4 == 0;
        }
        if (!v10) {
          goto LABEL_13;
        }
        int v11 = v9;
        krb5_kt_free_entry();
        if (!v11) {
          goto LABEL_19;
        }
      }
      else
      {
        krb5_kt_free_entry();
      }
    }
    if (!a4) {
      break;
    }
LABEL_13:
    int is_lkdc = krb5_principal_is_lkdc();
    int v13 = krb5_principal_is_pku2u() | is_lkdc;
    krb5_kt_free_entry();
    if (v13) {
      goto LABEL_19;
    }
  }
  krb5_kt_free_entry();
LABEL_19:
  uint64_t v8 = 1;
LABEL_20:
  krb5_kt_end_seq_get(a1, *(krb5_keytab *)(a2 + 16), cursor);
  return v8;
}

uint64_t _gsskrb5_add_cred(krb5_error_code *a1, uint64_t a2, const krb5_principal_data *a3, const gss_OID_desc *a4, int a5, uint64_t a6, uint64_t a7, unint64_t a8, gss_OID_set *a9, _DWORD *a10, _DWORD *a11)
{
  krb5_context context = 0;
  int v40 = 0;
  krb5_error_code v17 = __ApplePrivate__gsskrb5_init(&context);
  if (v17)
  {
    *a1 = v17;
    return 851968;
  }
  if (!gss_oid_equal(a4, &__gss_krb5_mechanism_oid_desc))
  {
    *a1 = 0;
    return 0x10000;
  }
  if (!(a2 | a8) || !a2)
  {
    *a1 = 0;
    return 458752;
  }
  if (a8)
  {
    pthread_mutex_lock((pthread_mutex_t *)(a2 + 48));
    int v20 = *(_DWORD *)(a2 + 32);
    if (v20 != a5)
    {
      if (v20)
      {
        pthread_mutex_unlock((pthread_mutex_t *)(a2 + 48));
        int v21 = 35224071;
LABEL_28:
        *a1 = v21;
        return 851968;
      }
    }
  }
  if (a3 && krb5_principal_compare(context, a3, *(krb5_const_principal *)a2))
  {
    if (a8) {
      pthread_mutex_unlock((pthread_mutex_t *)(a2 + 48));
    }
    *a1 = 0;
    return 0x20000;
  }
  if (!a8)
  {
    uint64_t v23 = 0;
    goto LABEL_24;
  }
  krb5_keyblock v22 = (char *)malloc_type_calloc(1uLL, 0x88uLL, 0x1030040BE4FC7E4uLL);
  if (!v22)
  {
    pthread_mutex_unlock((pthread_mutex_t *)(a2 + 48));
    int v21 = 12;
    goto LABEL_28;
  }
  uint64_t v23 = v22;
  *((_DWORD *)v22 + 8) = a5;
  *((void *)v22 + 3) = *(void *)(a2 + 24);
  *(void *)krb5_keyblock v22 = 0;
  *((void *)v22 + 2) = 0;
  uint64_t v24 = (krb5_keytab *)(v22 + 16);
  *((void *)v22 + 5) = 0;
  int v25 = (krb5_ccache *)(v22 + 40);
  pthread_mutex_init((pthread_mutex_t *)(v22 + 48), 0);
  krb5_error_code v26 = krb5_copy_principal(context, *(krb5_const_principal *)a2, (krb5_principal *)v23);
  if (v26)
  {
    krb5_error_code v27 = v26;
    pthread_mutex_unlock((pthread_mutex_t *)(a2 + 48));
    free(v23);
    *a1 = v27;
    return 851968;
  }
  if (*(void *)(a2 + 16))
  {
    uint64_t v39 = 0;
    krb5_error_code full_name = krb5_kt_get_full_name();
    if (full_name || (krb5_error_code full_name = krb5_kt_resolve(context, v39, v24), krb5_xfree(), full_name))
    {
      *a1 = full_name;
      uint64_t v18 = 851968;
      goto LABEL_52;
    }
  }
  int v30 = *(_krb5_ccache **)(a2 + 40);
  if (v30)
  {
    uint64_t v39 = 0;
    type = krb5_cc_get_type(context, v30);
    if (!type) {
      goto LABEL_48;
    }
    uint64_t v32 = type;
    if (!strcmp(type, "MEMORY"))
    {
      uint64_t v35 = krb5_cc_new_unique(context, v32, 0, v25);
      uint64_t v18 = v35;
      if (v35) {
        goto LABEL_51;
      }
      uint64_t v35 = krb5_cc_copy_cache();
      uint64_t v18 = v35;
      if (v35) {
        goto LABEL_51;
      }
      goto LABEL_24;
    }
    name = krb5_cc_get_name(context, *(krb5_ccache *)(a2 + 40));
    if (!name)
    {
LABEL_48:
      uint64_t v18 = 851968;
      LODWORD(v35) = 12;
      goto LABEL_51;
    }
    int v34 = asprintf(&v39, "%s:%s", v32, name);
    uint64_t v18 = 851968;
    LODWORD(v35) = 12;
    if (v34 < 0 || !v39) {
      goto LABEL_51;
    }
    krb5_error_code v36 = krb5_cc_resolve(context, v39, v25);
    free(v39);
    if (v36)
    {
      LODWORD(v35) = v36;
      uint64_t v18 = 851968;
LABEL_51:
      *a1 = v35;
      goto LABEL_52;
    }
  }
LABEL_24:
  pthread_mutex_unlock((pthread_mutex_t *)(a2 + 48));
  uint64_t v28 = _gsskrb5_inquire_cred(a1, a2, 0, &v40, 0, a9);
  if (v28)
  {
    uint64_t v18 = v28;
    if (!v23)
    {
LABEL_59:
      if (a8) {
        pthread_mutex_unlock((pthread_mutex_t *)(a2 + 48));
      }
      return v18;
    }
LABEL_52:
    if (*(void *)v23) {
      krb5_free_principal(context, *(krb5_principal *)v23);
    }
    v37 = (_krb5_kt *)*((void *)v23 + 2);
    if (v37) {
      krb5_kt_close(context, v37);
    }
    long long v38 = (_krb5_ccache *)*((void *)v23 + 5);
    if (v38) {
      krb5_cc_destroy(context, v38);
    }
    free(v23);
    goto LABEL_59;
  }
  if (a10) {
    *a10 = v40;
  }
  if (a11) {
    *a11 = v40;
  }
  if (a8) {
    *(void *)a8 = v23;
  }
  uint64_t v18 = 0;
  *a1 = 0;
  return v18;
}

uint64_t _gsskrb5i_address_to_krb5addr(uint64_t a1, int a2, uint64_t a3)
{
  if (a3 && (a2 == 24 || a2 == 2) && !krb5_h_addr2sockaddr()) {
    return krb5_sockaddr2address();
  }
  else {
    return 851968;
  }
}

uint64_t _gk_wrap_iov(int *a1, uint64_t a2, int a3, uint64_t a4, _DWORD *a5, unsigned __int16 *a6, int a7)
{
  uint64_t v15 = 0;
  int v13 = __ApplePrivate__gsskrb5_init((krb5_context *)&v15);
  if (v13)
  {
    *a1 = v13;
    return 851968;
  }
  if ((*(unsigned char *)(a2 + 76) & 0x40) == 0) {
    return 851968;
  }
  return _gssapi_wrap_cfx_iov(a1, a2, v15, a3, a5, a6, a7);
}

uint64_t _gk_unwrap_iov(_DWORD *a1, uint64_t a2, int *a3, _DWORD *a4, unsigned __int16 *a5, int a6)
{
  uint64_t v14 = 0;
  int v12 = __ApplePrivate__gsskrb5_init((krb5_context *)&v14);
  if (v12)
  {
    *a1 = v12;
    return 851968;
  }
  if ((*(unsigned char *)(a2 + 76) & 0x40) == 0) {
    return 851968;
  }
  return _gssapi_unwrap_cfx_iov(a1, a2, v14, a3, a4, a5, a6);
}

uint64_t _gk_wrap_iov_length(_DWORD *a1, uint64_t a2, int a3, uint64_t a4, _DWORD *a5, uint64_t a6, int a7)
{
  krb5_context v16 = 0;
  int v14 = __ApplePrivate__gsskrb5_init(&v16);
  if (v14)
  {
    *a1 = v14;
    return 851968;
  }
  if ((*(unsigned char *)(a2 + 76) & 0x40) == 0) {
    return 851968;
  }
  return _gssapi_wrap_iov_length_cfx(a1, a2, v16, a3, a4, a5, a6, a7);
}

uint64_t _gssapi_get_mic_arcfour(int *a1, uint64_t a2, _krb5_context *a3, uint64_t a4, uint64_t a5, size_t *a6, _DWORD *a7)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  krb5_int32 v21 = 0;
  size_t size = 0;
  uint64_t v20 = 0;
  uint64_t v32 = 0;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v22 = 0u;
  _gsskrb5_encap_length(22, &v20, &size, &__gss_krb5_mechanism_oid_desc);
  size_t v13 = size;
  *a6 = size;
  int v14 = malloc_type_malloc(v13, 0xC46D5FDDuLL);
  a6[1] = (size_t)v14;
  if (v14)
  {
    mech_uint64_t header = _gssapi_make_mech_header(v14, v20, (const void **)&__gss_krb5_mechanism_oid_desc);
    *(_DWORD *)mech_uint64_t header = 1114369;
    *((_DWORD *)mech_header + 1) = -1;
    int v16 = arcfour_mic_cksum((uint64_t)a3, (uint64_t)a7, 23, (void *)mech_header + 2, mech_header, *(const void **)(a5 + 8), *(void *)a5, 0, 0);
    if (v16)
    {
      int v17 = v16;
    }
    else
    {
      int v17 = arcfour_mic_key((uint64_t)a3, a7);
      if (!v17)
      {
        pthread_mutex_lock((pthread_mutex_t *)(a2 + 128));
        krb5_auth_con_getlocalseqnumber(a3, *(krb5_auth_context *)(a2 + 40), &v21);
        _gss_mg_encode_be_uint32(v21++, (_DWORD *)mech_header + 2);
        krb5_auth_con_setlocalseqnumber();
        pthread_mutex_unlock((pthread_mutex_t *)(a2 + 128));
        *((_DWORD *)mech_header + 3) = 16843009 * ((*(unsigned char *)(a2 + 76) & 1) - 1);
        hc_EVP_CIPHER_CTX_init();
        hc_EVP_rc4();
        hc_EVP_CipherInit_ex();
        hc_EVP_Cipher();
        hc_EVP_CIPHER_CTX_cleanup();
        uint64_t result = 0;
        goto LABEL_7;
      }
    }
    _gsskrb5_release_buffer(a1, (uint64_t)a6);
    uint64_t result = 851968;
  }
  else
  {
    uint64_t result = 851968;
    int v17 = 12;
  }
LABEL_7:
  *a1 = v17;
  return result;
}

uint64_t arcfour_mic_cksum(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5, const void *a6, size_t a7, const void *a8, size_t a9)
{
  size_t v13 = malloc_type_malloc(a7 + a9 + 8, 0xE8E82A6CuLL);
  if (!v13) {
    return 12;
  }
  int v14 = v13;
  v20[0] = 0;
  v20[1] = 0;
  krb5_int32 v21 = 0;
  void *v13 = *a5;
  uint64_t v15 = v13 + 1;
  memcpy(v13 + 1, a6, a7);
  memcpy((char *)v15 + a7, a8, a9);
  uint64_t v16 = krb5_crypto_init();
  if (v16)
  {
    uint64_t checksum = v16;
    free(v14);
  }
  else
  {
    uint64_t checksum = krb5_create_checksum();
    free(v14);
    if (!checksum)
    {
      *a4 = *v21;
      free_Checksum((uint64_t)v20);
    }
    krb5_crypto_destroy();
  }
  return checksum;
}

uint64_t arcfour_mic_key(uint64_t a1, _DWORD *a2)
{
  if (*a2 == 24)
  {
    uint64_t result = krb5_hmac();
    if (result) {
      return result;
    }
  }
  else
  {
    uint64_t result = krb5_hmac();
    if (result) {
      return result;
    }
  }
  return krb5_hmac();
}

uint64_t _gssapi_verify_mic_arcfour(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t *a5, _DWORD *a6, _DWORD *a7, unsigned __int16 *a8)
{
  v35[1] = *MEMORY[0x263EF8340];
  if (a6) {
    *a6 = 0;
  }
  unsigned int v20 = 0;
  unint64_t v13 = *a5;
  krb5_auth_context v19 = (unsigned char *)a5[1];
  uint64_t v14 = _gsskrb5_verify_header(&v19, v13, a8, (uint64_t)&__gss_krb5_mechanism_oid_desc);
  if (!v14)
  {
    uint64_t v15 = v19;
    if (*(_WORD *)v19 != 17) {
      return 393216;
    }
    v19 += 2;
    if (*(_DWORD *)(v15 + 2) != -1) {
      return 393216;
    }
    krb5_auth_context v19 = v15 + 6;
    int v17 = arcfour_mic_cksum(a3, (uint64_t)a7, 23, &v34, v15 - 2, *(const void **)(a4 + 8), *(void *)a4, 0, 0);
    if (v17 || (int v17 = arcfour_mic_key(a3, a7)) != 0)
    {
      uint64_t v14 = 851968;
    }
    else
    {
      int v17 = ct_memcmp();
      if (v17)
      {
        uint64_t v31 = 0;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        hc_EVP_CIPHER_CTX_init();
        hc_EVP_rc4();
        hc_EVP_CipherInit_ex();
        hc_EVP_Cipher();
        hc_EVP_CIPHER_CTX_cleanup();
        uint64_t v32 = 0;
        uint64_t v33 = 0;
        _gss_mg_decode_be_uint32((unsigned int *)v35, &v20);
        int v18 = ct_memcmp();
        v35[0] = 0;
        if (!v18)
        {
          pthread_mutex_lock((pthread_mutex_t *)(a2 + 128));
          uint64_t v14 = _gssapi_msg_order_check(*(void *)(a2 + 24), v20);
          pthread_mutex_unlock((pthread_mutex_t *)(a2 + 128));
          if (v14) {
            return v14;
          }
          int v17 = 0;
          goto LABEL_11;
        }
        int v17 = 0;
      }
      uint64_t v14 = 393216;
    }
LABEL_11:
    *a1 = v17;
  }
  return v14;
}

uint64_t _gssapi_wrap_arcfour(_DWORD *a1, uint64_t a2, _krb5_context *a3, int a4, uint64_t a5, uint64_t a6, _DWORD *a7, size_t *a8, uint64_t a9)
{
  v48[2] = *MEMORY[0x263EF8340];
  if (a7) {
    *a7 = 0;
  }
  uint64_t v32 = 0;
  size_t v33 = 0;
  uint64_t v30 = 0;
  uint64_t v31 = 0;
  krb5_int32 v29 = 0;
  size_t v16 = *(void *)a6;
  if ((*(unsigned char *)(a2 + 73) & 0x10) != 0)
  {
    uint64_t v34 = 32;
    _gssapi_encap_length(32, &v34, &v33, &__gss_krb5_mechanism_oid_desc);
    size_t v17 = v33 + v16;
    v33 += v16;
  }
  else
  {
    uint64_t v34 = v16 + 33;
    _gssapi_encap_length(v16 + 33, &v34, &v33, &__gss_krb5_mechanism_oid_desc);
    size_t v17 = v33;
    ++v16;
  }
  *a8 = v17;
  int v18 = malloc_type_malloc(v17, 0x34A28917uLL);
  a8[1] = (size_t)v18;
  if (!v18)
  {
    *a1 = 12;
    return 851968;
  }
  mech_uint64_t header = _gssapi_make_mech_header(v18, v34, (const void **)&__gss_krb5_mechanism_oid_desc);
  unsigned int v20 = mech_header;
  *(_DWORD *)mech_uint64_t header = 1114370;
  if (a4) {
    char v21 = 16;
  }
  else {
    char v21 = -1;
  }
  if (a4) {
    char v22 = 0;
  }
  else {
    char v22 = -1;
  }
  mech_header[4] = v21;
  mech_header[5] = v22;
  *((_WORD *)mech_header + 3) = -1;
  pthread_mutex_lock((pthread_mutex_t *)(a2 + 128));
  krb5_auth_con_getlocalseqnumber(a3, *(krb5_auth_context *)(a2 + 40), &v29);
  _gss_mg_encode_be_uint32(v29++, (_DWORD *)v20 + 2);
  krb5_auth_con_setlocalseqnumber();
  pthread_mutex_unlock((pthread_mutex_t *)(a2 + 128));
  *((_DWORD *)v20 + 3) = 16843009 * ((*(unsigned char *)(a2 + 76) & 1) - 1);
  krb5_generate_random_block();
  memcpy(v20 + 32, *(const void **)(a6 + 8), *(void *)a6);
  if ((*(unsigned char *)(a2 + 73) & 0x10) == 0) {
    v20[*(void *)a6 + 32] = 1;
  }
  int v23 = arcfour_mic_cksum((uint64_t)a3, a9, 22, (void *)v20 + 2, v20, v20 + 24, 8uLL, v20 + 32, v16);
  if (v23)
  {
    *a1 = v23;
    _gsskrb5_release_buffer(a1, (uint64_t)a8);
    return 851968;
  }
  uint64_t v24 = 0;
  LODWORD(v30) = *(_DWORD *)a9;
  uint64_t v31 = 16;
  uint64_t v32 = v48;
  uint64_t v25 = *(void *)(a9 + 16);
  do
  {
    *((unsigned char *)v48 + v24) = *(unsigned char *)(v25 + v24) ^ 0xF0;
    ++v24;
  }
  while (v24 != 16);
  int v26 = arcfour_mic_key((uint64_t)a3, &v30);
  v48[0] = 0;
  v48[1] = 0;
  if (v26) {
    goto LABEL_24;
  }
  if (a4)
  {
    uint64_t v45 = 0;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    hc_EVP_CIPHER_CTX_init();
    hc_EVP_rc4();
    hc_EVP_CipherInit_ex();
    hc_EVP_Cipher();
    hc_EVP_CIPHER_CTX_cleanup();
  }
  uint64_t v46 = 0;
  uint64_t v47 = 0;
  int v26 = arcfour_mic_key((uint64_t)a3, (_DWORD *)a9);
  if (v26)
  {
LABEL_24:
    int v27 = v26;
    _gsskrb5_release_buffer(a1, (uint64_t)a8);
    *a1 = v27;
    return 851968;
  }
  uint64_t v45 = 0;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  hc_EVP_CIPHER_CTX_init();
  hc_EVP_rc4();
  hc_EVP_CipherInit_ex();
  hc_EVP_Cipher();
  hc_EVP_CIPHER_CTX_cleanup();
  if (a7) {
    *a7 = a4;
  }
  uint64_t result = 0;
  *a1 = 0;
  return result;
}

uint64_t _gssapi_unwrap_arcfour(int *a1, uint64_t a2, uint64_t a3, unint64_t *a4, uint64_t a5, int *a6, _DWORD *a7, uint64_t a8)
{
  v53[2] = *MEMORY[0x263EF8340];
  uint64_t v32 = 0;
  if (a6) {
    *a6 = 0;
  }
  if (a7) {
    *a7 = 0;
  }
  unint64_t v15 = *a4;
  size_t v33 = (unsigned char *)a4[1];
  if ((*(unsigned char *)(a2 + 73) & 0x10) != 0)
  {
    if (v15 < 0x2D) {
      return 0x10000;
    }
    unint64_t v15 = 45;
  }
  uint64_t v35 = 0;
  uint64_t v36 = 0;
  long long v37 = 0;
  unsigned int v34 = 0;
  uint64_t v16 = _gssapi_verify_mech_header(&v33, v15, (uint64_t)&__gss_krb5_mechanism_oid_desc);
  if (!v16)
  {
    size_t v17 = &v33[-a4[1] + 32];
    size_t v18 = *a4 - (void)v17;
    if (*a4 < (unint64_t)v17) {
      return 0x10000;
    }
    if (*(_WORD *)v33 != 258 || *((_WORD *)v33 + 1) != 17) {
      return 393216;
    }
    int v20 = *((unsigned __int16 *)v33 + 2);
    BOOL v21 = v20 != 16;
    if (v20 == 16)
    {
      int v22 = 1;
    }
    else
    {
      if (*((__int16 *)v33 + 2) != -1) {
        return 393216;
      }
      int v22 = 0;
    }
    if (*((__int16 *)v33 + 3) != -1) {
      return 393216;
    }
    int v23 = arcfour_mic_key(a3, (_DWORD *)a8);
    if (v23) {
      goto LABEL_21;
    }
    uint64_t v48 = 0;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    hc_EVP_CIPHER_CTX_init();
    hc_EVP_rc4();
    hc_EVP_CipherInit_ex();
    hc_EVP_Cipher();
    hc_EVP_CIPHER_CTX_cleanup();
    uint64_t v51 = 0;
    uint64_t v52 = 0;
    _gss_mg_decode_be_uint32(&v50, &v34);
    if (!ct_memcmp())
    {
      uint64_t v24 = 0;
      LODWORD(v35) = *(_DWORD *)a8;
      uint64_t v36 = 16;
      long long v37 = v53;
      uint64_t v25 = *(void *)(a8 + 16);
      do
      {
        *((unsigned char *)v53 + v24) = *(unsigned char *)(v25 + v24) ^ 0xF0;
        ++v24;
      }
      while (v24 != 16);
      int v23 = arcfour_mic_key(a3, &v35);
      v53[0] = 0;
      v53[1] = 0;
      if (v23)
      {
LABEL_21:
        uint64_t v16 = 851968;
LABEL_24:
        *a1 = v23;
        return v16;
      }
      int v26 = malloc_type_malloc(v18, 0x32122FFEuLL);
      *(void *)(a5 + 8) = v26;
      if (!v26)
      {
        uint64_t v16 = 851968;
        int v23 = 12;
        goto LABEL_24;
      }
      *(void *)a5 = v18;
      if (v21)
      {
        uint64_t v49 = *((void *)v33 + 3);
        memcpy(v26, v33 + 32, v18);
      }
      else
      {
        uint64_t v48 = 0;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        hc_EVP_CIPHER_CTX_init();
        hc_EVP_rc4();
        hc_EVP_CipherInit_ex();
        hc_EVP_Cipher();
        hc_EVP_Cipher();
        hc_EVP_CIPHER_CTX_cleanup();
      }
      uint64_t v51 = 0;
      uint64_t v52 = 0;
      if ((*(unsigned char *)(a2 + 73) & 0x10) != 0)
      {
        uint64_t v28 = 0;
        uint64_t v29 = *(void *)a5;
      }
      else
      {
        uint64_t v27 = _gssapi_verify_pad((void *)a5, v18, &v32);
        if (v27)
        {
          uint64_t v16 = v27;
          _gsskrb5_release_buffer(a1, a5);
          int v23 = 0;
          goto LABEL_24;
        }
        uint64_t v28 = v32;
        uint64_t v29 = *(void *)a5 - v32;
        *(void *)a5 = v29;
      }
      int v30 = arcfour_mic_cksum(a3, a8, 22, &v38, v33, &v49, 8uLL, *(const void **)(a5 + 8), v28 + v29);
      if (v30)
      {
        int v31 = v30;
        _gsskrb5_release_buffer(a1, a5);
        uint64_t v16 = 851968;
        int v23 = v31;
        goto LABEL_24;
      }
      if (ct_memcmp())
      {
        pthread_mutex_lock((pthread_mutex_t *)(a2 + 128));
        uint64_t v16 = _gssapi_msg_order_check(*(void *)(a2 + 24), v34);
        pthread_mutex_unlock((pthread_mutex_t *)(a2 + 128));
        if (v16) {
          return v16;
        }
        int v23 = 0;
        uint64_t v16 = 0;
        if (a6) {
          *a6 = v22;
        }
        goto LABEL_24;
      }
      _gsskrb5_release_buffer(a1, a5);
    }
    int v23 = 0;
    uint64_t v16 = 393216;
    goto LABEL_24;
  }
  return v16;
}

uint64_t _gssapi_wrap_size_arcfour(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6, _DWORD *a7)
{
  int v11 = krb5_crypto_init();
  if (v11)
  {
    *a1 = v11;
    return 851968;
  }
  else
  {
    if ((*(unsigned char *)(a2 + 73) & 0x10) != 0)
    {
      uint64_t v14 = 0;
      unint64_t v15 = 32;
      _gssapi_encap_length(32, &v15, &v14, &__gss_krb5_mechanism_oid_desc);
      if (v15 <= a6) {
        int v13 = a6 - v15;
      }
      else {
        int v13 = 0;
      }
    }
    else
    {
      uint64_t v14 = 0;
      unint64_t v15 = a6 + 48;
      _gsskrb5_encap_length(v15, &v15, &v14, &__gss_krb5_mechanism_oid_desc);
      if (v14 - (unint64_t)a6 >= a6) {
        int v13 = 0;
      }
      else {
        int v13 = (a6 - (v14 - a6)) & 0xFFFFFFF8;
      }
    }
    *a7 = v13;
    krb5_crypto_destroy();
    return 0;
  }
}

uint64_t _gsskrb5_canonicalize_name(_DWORD *a1, const krb5_principal_data *a2, uint64_t a3, void *a4)
{
  krb5_principal v9 = 0;
  krb5_context v10 = 0;
  *a4 = 0;
  int v7 = __ApplePrivate__gsskrb5_init(&v10);
  if (v7)
  {
    *a1 = v7;
    return 851968;
  }
  else
  {
    uint64_t result = _gsskrb5_canon_name(a1, v10, 1, 0, a2, &v9);
    if (!result) {
      *a4 = v9;
    }
  }
  return result;
}

uint64_t _gsskrb5cfx_wrap_length_cfx(uint64_t a1, uint64_t a2, int a3, unint64_t a4, unint64_t *a5, void *a6, _WORD *a7)
{
  *a5 = 16;
  *a7 = 0;
  uint64_t result = krb5_crypto_get_checksum_type();
  if (!result)
  {
    uint64_t result = krb5_checksumsize();
    if (!result)
    {
      if (a3)
      {
        if ((*(unsigned char *)(a2 + 9) & 2) != 0)
        {
          uint64_t result = krb5_crypto_getblocksize();
          if (result) {
            return result;
          }
        }
        else
        {
          uint64_t result = krb5_crypto_getpadsize();
          if (result) {
            return result;
          }
        }
        a4 += 16;
        unint64_t v13 = *a5 + krb5_get_wrapped_length();
      }
      else
      {
        unint64_t v13 = *a6 + a4 + *a5;
      }
      *a5 = v13;
      if (v13 <= a4) {
        _gsskrb5cfx_wrap_length_cfx_cold_1();
      }
      return 0;
    }
  }
  return result;
}

uint64_t _gssapi_wrap_size_cfx(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, unsigned int a6, unsigned int *a7)
{
  uint64_t result = 0;
  *a7 = 0;
  unint64_t v8 = a6 - 16;
  if (a6 >= 0x10)
  {
    if (a4)
    {
      unsigned int v10 = a6 - 31;
      uint64_t v11 = a6 - 15 - 1;
      do
      {
        unint64_t wrapped_length = krb5_get_wrapped_length();
        --v10;
        BOOL v13 = v11-- != 0;
      }
      while (v13 && wrapped_length > v8);
      uint64_t result = 0;
      if ((unint64_t)(v11 + 1) >= 0x10) {
        *a7 = v10;
      }
    }
    else
    {
      uint64_t result = krb5_crypto_get_checksum_type();
      if (!result)
      {
        uint64_t result = krb5_checksumsize();
        if (!result)
        {
          uint64_t result = 0;
          *a7 = v8;
        }
      }
    }
  }
  return result;
}

uint64_t _gssapi_wrap_cfx_iov(int *a1, uint64_t a2, uint64_t a3, int a4, _DWORD *a5, unsigned __int16 *a6, int a7)
{
  gss_buffer_desc_struct buffer = _gss_mg_find_buffer(a6, a7, 2);
  if (!buffer) {
    goto LABEL_21;
  }
  uint64_t v14 = (uint64_t)buffer;
  unint64_t v15 = _gss_mg_find_buffer(a6, a7, 9);
  uint64_t v16 = v15;
  if (v15) {
    *((void *)v15 + 1) = 0;
  }
  uint64_t v17 = (uint64_t)_gss_mg_find_buffer(a6, a7, 7);
  uint64_t v18 = v17;
  if ((*(unsigned char *)(a2 + 9) & 2) != 0)
  {
    if ((unint64_t)v16 | v17) {
      goto LABEL_21;
    }
  }
  else if (!v16)
  {
    goto LABEL_21;
  }
  int v69 = 0;
  *a1 = 0;
  if (!a4)
  {
    if ((*(unsigned char *)(a2 + 9) & 2) == 0)
    {
      int v22 = krb5_crypto_length();
      *a1 = v22;
      if (v22) {
        return 851968;
      }
      size_t v23 = 0;
      size_t v24 = 16;
      if (!v18) {
        goto LABEL_33;
      }
      goto LABEL_18;
    }
LABEL_21:
    *a1 = 22;
    return 851968;
  }
  if (a7 >= 1)
  {
    uint64_t v19 = 0;
    uint64_t v20 = a7;
    BOOL v21 = a6 + 4;
    do
    {
      if (*((_WORD *)v21 - 4) == 1) {
        v19 += *v21;
      }
      v21 += 3;
      --v20;
    }
    while (v20);
  }
  int v28 = krb5_crypto_length();
  *a1 = v28;
  if (v28) {
    return 851968;
  }
  int v29 = krb5_crypto_length();
  *a1 = v29;
  if (v29) {
    return 851968;
  }
  int v30 = krb5_crypto_length();
  *a1 = v30;
  if (v30) {
    return 851968;
  }
  if ((*(unsigned char *)(a2 + 9) & 2) != 0)
  {
    int v31 = krb5_crypto_getblocksize();
    *a1 = v31;
    if (v31) {
      return 851968;
    }
  }
  size_t v24 = 16;
  size_t v23 = 16;
  if (!v18)
  {
LABEL_33:
    size_t v25 = v23;
    size_t v24 = v23 + 16;
    goto LABEL_34;
  }
LABEL_18:
  if (*(unsigned char *)(v18 + 2))
  {
    uint64_t v26 = _gk_allocate_buffer(a1, v18, v23);
    if (v26) {
      goto LABEL_82;
    }
    size_t v25 = 0;
    size_t v24 = 16;
  }
  else
  {
    if (*(void *)(v18 + 8) < v23)
    {
LABEL_36:
      int v32 = -1765328194;
LABEL_60:
      *a1 = v32;
LABEL_81:
      uint64_t v26 = 851968;
      goto LABEL_82;
    }
    size_t v25 = 0;
    *(void *)(v18 + 8) = v23;
  }
LABEL_34:
  if (*(unsigned char *)(v14 + 2))
  {
    size_t v68 = v25;
    uint64_t v26 = _gk_allocate_buffer(a1, v14, v24);
    if (!v26) {
      goto LABEL_40;
    }
LABEL_82:
    __ApplePrivate_gss_release_iov_buffer(&v69, (uint64_t)a6, a7);
    return v26;
  }
  if (*(void *)(v14 + 8) < v24) {
    goto LABEL_36;
  }
  size_t v68 = v25;
  *(void *)(v14 + 8) = v24;
LABEL_40:
  uint64_t v33 = *(void *)(v14 + 16);
  *(_DWORD *)uint64_t v33 = -16776187;
  char v34 = *(_DWORD *)(a2 + 8) & 5;
  if (v34) {
    *(unsigned char *)(v33 + 2) = v34;
  }
  if (a4) {
    *(unsigned char *)(v33 + 2) = v34 | 2;
  }
  uint64_t v67 = v33;
  *(unsigned char *)(v33 + 5) = 0;
  uint64_t v35 = v33 + 5;
  *(unsigned char *)(v33 + 4) = 0;
  *(_WORD *)(v33 + 6) = 0;
  _gss_mg_encode_be_uint32(*(unsigned int *)(a2 + 16), (_DWORD *)(v33 + 8));
  int v66 = (unsigned char *)v35;
  _gss_mg_encode_be_uint32(*(unsigned int *)(a2 + 12), (_DWORD *)(v35 + 7));
  int v36 = *(_DWORD *)(a2 + 12);
  *(_DWORD *)(a2 + 12) = v36 + 1;
  if (v36 == -1) {
    ++*(_DWORD *)(a2 + 16);
  }
  long long v37 = malloc_type_calloc(a7 + 3, 0x18uLL, 0x10800404ACF7207uLL);
  if (!v37)
  {
    int v32 = 12;
    goto LABEL_60;
  }
  long long v38 = (char *)v37;
  if (!a4)
  {
    if (a7 < 1)
    {
      unsigned int v56 = 0;
    }
    else
    {
      uint64_t v49 = v37 + 2;
      unsigned int v50 = (uint64_t *)(a6 + 8);
      uint64_t v51 = a7;
      do
      {
        int v52 = *((unsigned __int16 *)v50 - 8);
        if (v52 == 11) {
          int v53 = 3;
        }
        else {
          int v53 = 0;
        }
        if (v52 == 1) {
          int v54 = 2;
        }
        else {
          int v54 = v53;
        }
        *((_DWORD *)v49 - 4) = v54;
        *(v49 - 1) = *(v50 - 1);
        uint64_t v55 = *v50;
        v50 += 3;
        *uint64_t v49 = v55;
        v49 += 3;
        --v51;
      }
      while (v51);
      unsigned int v56 = a7;
    }
    uint64_t v62 = (char *)&v37[3 * v56];
    *(_DWORD *)uint64_t v62 = 2;
    uint64_t v63 = *(void *)(v14 + 16);
    *((void *)v62 + 1) = 16;
    *((void *)v62 + 2) = v63;
    LODWORD(v37[3 * v56 + 3]) = 6;
    if (v18) {
      uint64_t v64 = *(void *)(v18 + 16);
    }
    else {
      uint64_t v64 = v63 + 16;
    }
    v65 = (char *)&v37[3 * v56 + 3];
    *((void *)v65 + 2) = v64;
    *((void *)v65 + 1) = 0;
    int checksum_iov = krb5_create_checksum_iov();
    if (!checksum_iov)
    {
      if (v68) {
        *(_WORD *)(v67 + 6) = bswap32(v68) >> 16;
      }
      *(unsigned char *)(v67 + 4) = 0;
      char v60 = 0;
      uint64_t v61 = v66;
      goto LABEL_86;
    }
LABEL_80:
    *a1 = checksum_iov;
    free(v38);
    goto LABEL_81;
  }
  unsigned int v39 = 1;
  *(_DWORD *)long long v37 = 1;
  uint64_t v40 = *(void *)(v14 + 16);
  uint64_t v41 = v40 + *(void *)(v14 + 8);
  v37[1] = 0;
  v37[2] = v41;
  if (a7 >= 1)
  {
    unint64_t v42 = 0;
    unsigned int v39 = a7 + 1;
    do
    {
      long long v43 = &a6[v42 / 2];
      int v44 = a6[v42 / 2];
      if (v44 == 11) {
        int v45 = 3;
      }
      else {
        int v45 = 0;
      }
      if (v44 == 1) {
        int v46 = 2;
      }
      else {
        int v46 = v45;
      }
      long long v47 = (char *)&v37[v42 / 8];
      *((_DWORD *)v47 + 6) = v46;
      *((void *)v47 + 4) = *((void *)v43 + 1);
      *((void *)v47 + 5) = *((void *)v43 + 2);
      v42 += 24;
    }
    while (24 * (a7 + 1) - 24 != v42);
  }
  LODWORD(v37[3 * v39]) = 2;
  if (v18) {
    uint64_t v48 = *(void *)(v18 + 16);
  }
  else {
    uint64_t v48 = v40 + 16;
  }
  uint64_t v57 = &v38[24 * v39];
  *((void *)v57 + 1) = 16;
  *((void *)v57 + 2) = v48;
  *(_OWORD *)*((void *)v57 + 2) = *(_OWORD *)v67;
  uint64_t v58 = &v38[24 * v39 + 24];
  *(_DWORD *)uint64_t v58 = 5;
  *((void *)v58 + 2) = *((void *)v57 + 2) + 16;
  *((void *)v58 + 1) = 0;
  int checksum_iov = krb5_encrypt_iov_ivec();
  if (checksum_iov) {
    goto LABEL_80;
  }
  char v60 = v68;
  if (v68)
  {
    uint64_t v61 = v66 + 2;
    *(unsigned char *)(v67 + 6) = BYTE1(v68);
LABEL_86:
    *uint64_t v61 = v60;
  }
  if (a5) {
    *a5 = a4;
  }
  free(v38);
  uint64_t v26 = 0;
  *a1 = 0;
  return v26;
}

uint64_t _gk_allocate_buffer(_DWORD *a1, uint64_t a2, size_t size)
{
  if ((*(unsigned char *)(a2 + 2) & 2) != 0)
  {
    if (*(void *)(a2 + 8) == size) {
      return 0;
    }
    free(*(void **)(a2 + 16));
  }
  int v7 = malloc_type_malloc(size, 0x4F581A3BuLL);
  *(void *)(a2 + 8) = size;
  *(void *)(a2 + 16) = v7;
  if (v7)
  {
    uint64_t result = 0;
    *(_DWORD *)a2 |= 0x20000u;
  }
  else
  {
    *a1 = 12;
    return 851968;
  }
  return result;
}

uint64_t _gssapi_unwrap_cfx_iov(_DWORD *a1, uint64_t a2, uint64_t a3, int *a4, _DWORD *a5, unsigned __int16 *a6, int a7)
{
  *a1 = 0;
  gss_buffer_desc_struct buffer = _gss_mg_find_buffer(a6, a7, 2);
  if (!buffer) {
    goto LABEL_18;
  }
  uint64_t v20 = buffer;
  if (*((void *)buffer + 1) <= 0xFuLL)
  {
    _gss_mg_log(5, "cfxunwrap-iov token too short: %ld", v14, v15, v16, v17, v18, v19, *((void *)buffer + 1));
    return 589824;
  }
  int v22 = _gss_mg_find_buffer(a6, a7, 9);
  size_t v23 = v22;
  if (v22)
  {
    if (*((void *)v22 + 1)) {
      goto LABEL_18;
    }
  }
  size_t v24 = _gss_mg_find_buffer(a6, a7, 7);
  if ((*(unsigned char *)(a2 + 9) & 2) == 0)
  {
    if (v23) {
      goto LABEL_9;
    }
LABEL_18:
    *a1 = 22;
    return 851968;
  }
  if ((unint64_t)v23 | (unint64_t)v24) {
    goto LABEL_18;
  }
LABEL_9:
  uint64_t v70 = 0;
  int v69 = 0;
  *a1 = 0;
  uint64_t v30 = *((void *)v20 + 2);
  if (*(unsigned char *)v30 == 5 && *(unsigned char *)(v30 + 1) == 4)
  {
    uint64_t v67 = v24;
    unsigned int v68 = *(unsigned __int8 *)(v30 + 2);
    uint64_t v21 = verify_flags(a2, v68 & 7, (uint64_t)"unwrap-iov", v25, v26, v27, v28, v29);
    if (v21) {
      return v21;
    }
    if (*(unsigned __int8 *)(v30 + 3) == 255)
    {
      if (a4) {
        *a4 = (v68 >> 1) & 1;
      }
      unsigned int v31 = *(unsigned __int16 *)(v30 + 4);
      unsigned int v32 = *(unsigned __int16 *)(v30 + 6);
      _gss_mg_decode_be_uint32((unsigned int *)(v30 + 8), &v70);
      _gss_mg_decode_be_uint32((unsigned int *)(v30 + 12), (_DWORD *)&v70 + 1);
      if (v70)
      {
        *a1 = 34;
        return 8;
      }
      uint64_t v34 = _gssapi_msg_order_check(*(void *)(a2 + 24), HIDWORD(v70));
      if (v34)
      {
        uint64_t v21 = v34;
LABEL_22:
        *a1 = 0;
        return v21;
      }
      uint64_t v35 = malloc_type_calloc(a7 + 3, 0x18uLL, 0x10800404ACF7207uLL);
      if (!v35)
      {
        *a1 = 12;
        uint64_t v21 = 851968;
LABEL_81:
        __ApplePrivate_gss_release_iov_buffer(&v69, (uint64_t)a6, a7);
        return v21;
      }
      uint64_t v36 = __rev16(v31);
      size_t v37 = __rev16(v32);
      int v66 = (char *)v35;
      if ((v68 & 2) == 0)
      {
        if (!v67)
        {
          if (v37 == v36)
          {
            uint64_t v38 = v36 + 16;
LABEL_38:
            if (*((void *)v20 + 1) == v38)
            {
              if (a7 < 1)
              {
                unsigned int v47 = 0;
              }
              else
              {
                uint64_t v40 = v35 + 2;
                uint64_t v41 = (uint64_t *)(a6 + 8);
                uint64_t v42 = a7;
                do
                {
                  int v43 = *((unsigned __int16 *)v41 - 8);
                  if (v43 == 11) {
                    int v44 = 3;
                  }
                  else {
                    int v44 = 0;
                  }
                  if (v43 == 1) {
                    int v45 = 2;
                  }
                  else {
                    int v45 = v44;
                  }
                  *((_DWORD *)v40 - 4) = v45;
                  *(v40 - 1) = *(v41 - 1);
                  uint64_t v46 = *v41;
                  v41 += 3;
                  void *v40 = v46;
                  v40 += 3;
                  --v42;
                }
                while (v42);
                unsigned int v47 = a7;
              }
              uint64_t v62 = (char *)&v35[3 * v47];
              *(_DWORD *)uint64_t v62 = 2;
              uint64_t v63 = *((void *)v20 + 2);
              *((void *)v62 + 1) = 16;
              *((void *)v62 + 2) = v63;
              LODWORD(v35[3 * v47 + 3]) = 6;
              if (v67) {
                uint64_t v64 = *((void *)v67 + 2);
              }
              else {
                uint64_t v64 = v63 + 16;
              }
              v65 = (char *)&v35[3 * v47 + 3];
              *((void *)v65 + 1) = v36;
              *((void *)v65 + 2) = v64;
              *(_DWORD *)(v63 + 4) = 0;
              int v61 = krb5_verify_checksum_iov();
              if (v61)
              {
LABEL_77:
                *a1 = v61;
                goto LABEL_78;
              }
              goto LABEL_82;
            }
            goto LABEL_66;
          }
LABEL_49:
          *a1 = 22;
LABEL_78:
          uint64_t v21 = 851968;
          goto LABEL_79;
        }
        if (*((void *)v67 + 1) == v36)
        {
          if (!v37)
          {
            uint64_t v38 = 16;
            goto LABEL_38;
          }
          goto LABEL_49;
        }
        uint64_t v21 = 589824;
LABEL_80:
        free(v35);
        goto LABEL_81;
      }
      krb5_crypto_length();
      krb5_crypto_length();
      if (v67)
      {
        if (*((void *)v67 + 1) == 16)
        {
          uint64_t v39 = *((void *)v20 + 1);
          if (v39 == 16)
          {
            if (v37)
            {
              uint64_t v21 = unrotate_iov(a1, v37, (uint64_t)a6, a7);
              uint64_t v35 = v66;
              if (v21) {
                goto LABEL_80;
              }
              uint64_t v39 = *((void *)v20 + 1);
            }
LABEL_55:
            unsigned int v49 = 1;
            *(_DWORD *)int v66 = 1;
            uint64_t v50 = *((void *)v20 + 2) + v39;
            *((void *)v66 + 1) = 0;
            *((void *)v66 + 2) = v50;
            if (a7 >= 1)
            {
              uint64_t v51 = 0;
              unsigned int v49 = a7 + 1;
              do
              {
                int v52 = &a6[v51];
                int v53 = a6[v51];
                if (v53 == 11) {
                  int v54 = 3;
                }
                else {
                  int v54 = 0;
                }
                if (v53 == 1) {
                  int v55 = 2;
                }
                else {
                  int v55 = v54;
                }
                unsigned int v56 = &v66[v51 * 2];
                *((_DWORD *)v56 + 6) = v55;
                *((void *)v56 + 4) = *((void *)v52 + 1);
                *((void *)v56 + 5) = *((void *)v52 + 2);
                v51 += 12;
              }
              while (12 * a7 != v51);
            }
            *(_DWORD *)&v66[24 * v49] = 2;
            if (v67) {
              uint64_t v57 = *((void *)v67 + 2);
            }
            else {
              uint64_t v57 = v50 - v36 - 16;
            }
            uint64_t v58 = &v66[24 * v49];
            *((void *)v58 + 1) = v36 + 16;
            *((void *)v58 + 2) = v57;
            int v59 = &v66[24 * v49 + 24];
            *(_DWORD *)int v59 = 5;
            uint64_t v60 = v57 + v36;
            *((void *)v59 + 1) = 0;
            *((void *)v59 + 2) = v57 + v36 + 16;
            int v61 = krb5_decrypt_iov_ivec();
            if (v61) {
              goto LABEL_77;
            }
            *(unsigned char *)(v60 + 6) = *(unsigned char *)(v30 + 6);
            *(unsigned char *)(v60 + 7) = *(unsigned char *)(v30 + 7);
            if (!ct_memcmp())
            {
LABEL_82:
              if (a5) {
                *a5 = 0;
              }
              free(v66);
              uint64_t v21 = 0;
              goto LABEL_22;
            }
            uint64_t v21 = 393216;
LABEL_79:
            uint64_t v35 = v66;
            goto LABEL_80;
          }
        }
      }
      else if (v37 == 16)
      {
        uint64_t v48 = (*(unsigned char *)(a2 + 9) & 2) != 0 ? v36 : 0;
        uint64_t v39 = v48 + 32;
        if (*((void *)v20 + 1) == v48 + 32) {
          goto LABEL_55;
        }
      }
LABEL_66:
      uint64_t v21 = 589824;
      goto LABEL_79;
    }
  }
  return 589824;
}

uint64_t verify_flags(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = *(_DWORD *)(a1 + 8);
  if (a2)
  {
    if (v8)
    {
      _gss_mg_log(5, "cfx%s acceptor token set by initiator", a3, a4, a5, a6, a7, a8, a3);
      return 589824;
    }
  }
  else if ((v8 & 1) == 0)
  {
    _gss_mg_log(5, "cfx%s !acceptor token set by acceptor", a3, a4, a5, a6, a7, a8, a3);
    return 589824;
  }
  if ((v8 & 4) != 0)
  {
    if ((a2 & 4) == 0)
    {
      _gss_mg_log(5, "cfx%s no subkey", a3, a4, a5, a6, a7, a8, a3);
      return 589824;
    }
  }
  else if ((a2 & 4) != 0)
  {
    heim_base_once_f();
  }
  return 0;
}

uint64_t unrotate_iov(_DWORD *a1, size_t a2, uint64_t a3, int a4)
{
  uint64_t v8 = a4;
  if (a4 >= 1)
  {
    size_t v9 = 0;
    unsigned int v10 = (void *)(a3 + 8);
    uint64_t v11 = a4;
    do
    {
      unsigned int v12 = *((unsigned __int16 *)v10 - 4);
      BOOL v13 = v12 > 9;
      int v14 = (1 << v12) & 0x282;
      if (!v13 && v14 != 0) {
        v9 += *v10;
      }
      v10 += 3;
      --v11;
    }
    while (v11);
    uint64_t v16 = (char *)malloc_type_malloc(v9, 0x11D9F028uLL);
    if (v16)
    {
      uint64_t v17 = a3 + 8;
      uint64_t v18 = v16;
      uint64_t v19 = v8;
      __dst = v16;
      do
      {
        unsigned int v20 = *(unsigned __int16 *)(v17 - 8);
        BOOL v13 = v20 > 9;
        int v21 = (1 << v20) & 0x282;
        if (!v13 && v21 != 0)
        {
          memcpy(v18, *(const void **)(v17 + 8), *(void *)v17);
          v18 += *(void *)v17;
        }
        v17 += 24;
        --v19;
      }
      while (v19);
      size_t v23 = __dst;
      goto LABEL_20;
    }
LABEL_44:
    *a1 = 12;
    return 851968;
  }
  size_t v24 = (char *)malloc_type_malloc(0, 0x11D9F028uLL);
  if (!v24) {
    goto LABEL_44;
  }
  size_t v23 = v24;
  size_t v9 = 0;
  uint64_t v18 = v24;
LABEL_20:
  if (v18 - v23 != v9) {
    unrotate_iov_cold_1();
  }
  if (a4 >= 1)
  {
    uint64_t v25 = &v23[a2];
    uint64_t v26 = (void *)(a3 + 8);
    uint64_t v27 = v8;
    size_t v28 = a2;
    do
    {
      unsigned int v29 = *((unsigned __int16 *)v26 - 4);
      BOOL v13 = v29 > 9;
      int v30 = (1 << v29) & 0x282;
      if (!v13 && v30 != 0)
      {
        if (*v26 <= v28)
        {
          v28 -= *v26;
        }
        else
        {
          memcpy((void *)(v26[1] + v28), v25, *v26 - v28);
          size_t v32 = *v26 - v28;
          size_t v28 = 0;
          v25 += v32;
        }
      }
      v26 += 3;
      --v27;
    }
    while (v27);
    uint64_t v33 = a3 + 8;
    uint64_t v34 = v23;
    do
    {
      unsigned int v35 = *(unsigned __int16 *)(v33 - 8);
      BOOL v13 = v35 > 9;
      int v36 = (1 << v35) & 0x282;
      if (!v13 && v36 != 0)
      {
        if (*(void *)v33 >= a2) {
          size_t v38 = a2;
        }
        else {
          size_t v38 = *(void *)v33;
        }
        memcpy(v34, *(const void **)(v33 + 8), v38);
        BOOL v39 = a2 >= *(void *)v33;
        a2 -= *(void *)v33;
        if (!v39) {
          break;
        }
        v34 += *(void *)v33;
      }
      v33 += 24;
      --v8;
    }
    while (v8);
  }
  free(v23);
  return 0;
}

uint64_t _gssapi_wrap_iov_length_cfx(_DWORD *a1, uint64_t a2, _krb5_context *a3, int a4, uint64_t a5, _DWORD *a6, uint64_t a7, int a8)
{
  krb5_context v31 = a3;
  int v14 = __ApplePrivate__gsskrb5_init(&v31);
  if (v14)
  {
    *a1 = v14;
    return 851968;
  }
  *a1 = 0;
  if (a8 < 1) {
    goto LABEL_23;
  }
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = a8;
  do
  {
    uint64_t v20 = v17;
    uint64_t v21 = v16;
    uint64_t v22 = v15;
    switch(*(_WORD *)a7)
    {
      case 0:
      case 0xB:
        break;
      case 1:
        v18 += *(void *)(a7 + 8);
        break;
      case 2:
        uint64_t v17 = a7;
        if (v20) {
          return 851968;
        }
        break;
      case 7:
        uint64_t v15 = a7;
        if (v22) {
          return 851968;
        }
        break;
      case 9:
        uint64_t v16 = a7;
        if (v21) {
          return 851968;
        }
        break;
      default:
        goto LABEL_23;
    }
    a7 += 24;
    --v19;
  }
  while (v19);
  if (!v17) {
    goto LABEL_23;
  }
  if ((*(unsigned char *)(a2 + 9) & 2) == 0)
  {
    if (v16) {
      goto LABEL_16;
    }
LABEL_23:
    *a1 = 22;
    return 851968;
  }
  if (v16 | v15) {
    goto LABEL_23;
  }
LABEL_16:
  if (a4)
  {
    int v23 = krb5_crypto_length();
    *a1 = v23;
    if (v23) {
      return 851968;
    }
    int v24 = krb5_crypto_length();
    *a1 = v24;
    if (v24) {
      return 851968;
    }
    int v25 = krb5_crypto_length();
    *a1 = v25;
    if (v25) {
      return 851968;
    }
    if ((*(unsigned char *)(a2 + 9) & 2) != 0)
    {
      int v30 = krb5_crypto_getblocksize();
      *a1 = v30;
      if (v30) {
        return 851968;
      }
    }
    uint64_t v29 = 16;
    uint64_t v28 = 16;
    if (!v15)
    {
LABEL_31:
      uint64_t v29 = v28 + 16;
      goto LABEL_32;
    }
  }
  else
  {
    int v27 = krb5_crypto_length();
    *a1 = v27;
    if (v27) {
      return 851968;
    }
    uint64_t v28 = 0;
    uint64_t v29 = 16;
    if (!v15) {
      goto LABEL_31;
    }
  }
  *(void *)(v15 + 8) = v28;
LABEL_32:
  *(void *)(v17 + 8) = v29;
  if (v16) {
    *(void *)(v16 + 8) = 0;
  }
  uint64_t result = 0;
  if (a6) {
    *a6 = a4;
  }
  return result;
}

uint64_t _gssapi_wrap_cfx(_DWORD *a1, uint64_t a2, _krb5_context *a3, int a4, uint64_t a5, int *a6, size_t *a7)
{
  size_t ivec = 0;
  unsigned int v47 = 0;
  size_t size = 0;
  memset(__len, 0, sizeof(__len));
  int v14 = _gsskrb5cfx_wrap_length_cfx((uint64_t)a3, a2, a4, *(void *)a5, &size, &__len[1], __len);
  if (v14)
  {
    *a1 = v14;
    return 851968;
  }
  BOOL v39 = a6;
  int v15 = *(_DWORD *)(a2 + 8);
  int v16 = *(_DWORD *)&__len[1];
  size_t v17 = size;
  *a7 = size;
  uint64_t v18 = malloc_type_malloc(v17, 0xFB90309DuLL);
  uint64_t v40 = (uint64_t)a7;
  a7[1] = (size_t)v18;
  if (!v18)
  {
    *a1 = 12;
    return 851968;
  }
  uint64_t v19 = v18;
  *(_DWORD *)uint64_t v18 = -16776187;
  int v20 = *(_DWORD *)(a2 + 8) & 5;
  if (v20) {
    void v18[2] = v20;
  }
  if (a4)
  {
    void v18[2] = v20 | 2;
    char v21 = __len[0];
    char v22 = HIBYTE(__len[0]);
  }
  else
  {
    char v22 = 0;
    char v21 = 0;
  }
  int v23 = v15 << 22;
  int v24 = v16 + 16 * (a4 != 0);
  v18[4] = v22;
  v18[5] = v21;
  *((_WORD *)v18 + 3) = 0;
  _gss_mg_encode_be_uint32(*(unsigned int *)(a2 + 16), (_DWORD *)v18 + 2);
  _gss_mg_encode_be_uint32(*(unsigned int *)(a2 + 12), (_DWORD *)v19 + 3);
  int v25 = *(_DWORD *)(a2 + 12);
  *(_DWORD *)(a2 + 12) = v25 + 1;
  if (v25 == -1) {
    ++*(_DWORD *)(a2 + 16);
  }
  int v26 = v24 & (v23 >> 31);
  if (*(unsigned char *)(a2 + 8)) {
    uint64_t v27 = 22;
  }
  else {
    uint64_t v27 = 24;
  }
  if (a4)
  {
    unsigned int v38 = v26;
    memcpy(v19 + 16, *(const void **)(a5 + 8), *(void *)a5);
    uint64_t v28 = (void *)v27;
    uint64_t v29 = __len[0];
    memset(&v19[*(void *)a5 + 16], 255, __len[0]);
    *(_OWORD *)&v19[*(void *)a5 + 16 + v29] = *(_OWORD *)v19;
    int v30 = krb5_encrypt(a3, *(krb5_const_pointer *)a2, v28, (size_t)(v19 + 16), (krb5_encrypt_block *)(v29 + *(void *)a5 + 16), &ivec);
    if (v30) {
      goto LABEL_19;
    }
    unint64_t v31 = ivec;
    if (ivec + 16 != v17) {
      _gssapi_wrap_cfx_cold_2();
    }
    *((_WORD *)v19 + 3) = bswap32(v38) >> 16;
    int v30 = rrc_rotate((char *)v47, v31, (unsigned __int16)(v38 + (v29 & ((__int16)(*(_WORD *)(a2 + 8) << 6) >> 15))), 0);
    if (v30)
    {
LABEL_19:
      *a1 = v30;
LABEL_24:
      _gsskrb5_release_buffer(a1, v40);
      return 851968;
    }
    memcpy(v19 + 16, v47, ivec);
    krb5_data_free();
  }
  else
  {
    uint64_t v41 = 0;
    size_t v42 = 0;
    __src = 0;
    size_t v32 = (char *)malloc_type_malloc(*(void *)a5 + 16, 0xB8CB1627uLL);
    if (!v32)
    {
      *a1 = 12;
      goto LABEL_24;
    }
    uint64_t v33 = v32;
    memcpy(v32, *(const void **)(a5 + 8), *(void *)a5);
    *(_OWORD *)&v33[*(void *)a5] = *(_OWORD *)v19;
    int checksum = krb5_create_checksum();
    if (checksum)
    {
      *a1 = checksum;
      _gsskrb5_release_buffer(a1, v40);
      free(v33);
      return 851968;
    }
    free(v33);
    size_t v36 = v42;
    if (v42 != *(void *)&__len[1]) {
      _gssapi_wrap_cfx_cold_1();
    }
    v19[4] = BYTE1(v42);
    v19[5] = v36;
    v19[6] = BYTE1(v26);
    v19[7] = v26;
    memcpy(v19 + 16, *(const void **)(a5 + 8), *(void *)a5);
    memcpy(&v19[*(void *)a5 + 16], __src, v36);
    int v37 = rrc_rotate(v19 + 16, v36 + *(void *)a5, (unsigned __int16)v26, 0);
    if (v37)
    {
      *a1 = v37;
      _gsskrb5_release_buffer(a1, v40);
      free_Checksum((uint64_t)&v41);
      return 851968;
    }
    free_Checksum((uint64_t)&v41);
  }
  if (v39) {
    *BOOL v39 = a4;
  }
  uint64_t result = 0;
  *a1 = 0;
  return result;
}

uint64_t rrc_rotate(char *__src, unint64_t a2, unsigned int a3, int a4)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (a2)
  {
    size_t v5 = a3 % a2;
    if (v5)
    {
      if (v5 >= 0x101)
      {
        p_dst = (char *)malloc_type_malloc(a3 % a2, 0x4AFBF41CuLL);
        if (!p_dst) {
          return 12;
        }
      }
      else
      {
        p_dst = &__dst;
      }
      size_t v9 = a2 - v5;
      if (a4)
      {
        memcpy(p_dst, __src, v5);
        memmove(__src, &__src[v5], v9);
        __src += v9;
      }
      else
      {
        memcpy(p_dst, &__src[v9], v5);
        memmove(&__src[v5], __src, v9);
      }
      memcpy(__src, p_dst, v5);
      if (v5 >= 0x101) {
        free(p_dst);
      }
    }
  }
  return 0;
}

uint64_t _gssapi_unwrap_cfx(krb5_error_code *a1, uint64_t a2, _krb5_context *a3, unint64_t *a4, uint64_t a5, int *a6, _DWORD *a7, uint64_t a8)
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  *a1 = 0;
  if (*a4 <= 0xF)
  {
    _gss_mg_log(5, "cfxunwrap token too short: %ld", (uint64_t)a3, (uint64_t)a4, a5, (uint64_t)a6, (uint64_t)a7, a8, *a4);
    return 589824;
  }
  long long v57 = 0uLL;
  unint64_t ivec = 0;
  uint64_t v56 = 0;
  size_t v9 = (_OWORD *)a4[1];
  long long v57 = *v9;
  if (v57 != 5 || BYTE1(v57) != 4)
  {
    _gss_mg_log(5, "cfxunwrap not a WRAP token: 0x%02x%02x", (uint64_t)a3, (uint64_t)a4, a5, (uint64_t)a6, (uint64_t)a7, a8, v57);
    return 589824;
  }
  char v16 = BYTE2(v57);
  uint64_t v23 = verify_flags(a2, BYTE2(v57) & 7, (uint64_t)"unwrap", (uint64_t)a4, a5, (uint64_t)a6, (uint64_t)a7, a8);
  if (!v23)
  {
    if (BYTE3(v57) != 255)
    {
      _gss_mg_log(5, "cfxunwrap filler bad: 0x%02x", v17, v18, v19, v20, v21, v22, SBYTE3(v57));
      return 589824;
    }
    if (a6) {
      *a6 = (BYTE2(v57) >> 1) & 1;
    }
    uint64_t v54 = 0;
    unsigned int v50 = WORD2(v57);
    unsigned int v25 = WORD3(v57);
    _gss_mg_decode_be_uint32((unsigned int *)&v57 + 2, &v54);
    _gss_mg_decode_be_uint32((unsigned int *)((unint64_t)&v57 | 0xC), (_DWORD *)&v54 + 1);
    if (v54)
    {
      *a1 = 34;
      return 8;
    }
    unsigned int v49 = v25;
    uint64_t v26 = _gssapi_msg_order_check(*(void *)(a2 + 24), HIDWORD(v54));
    if (v26)
    {
      uint64_t v23 = v26;
      *a1 = 0;
      _gsskrb5_release_buffer(a1, a5);
      return v23;
    }
    int v27 = *(_DWORD *)(a2 + 8);
    if (v27) {
      uint64_t v28 = 24;
    }
    else {
      uint64_t v28 = 22;
    }
    uint64_t v29 = (char *)(v9 + 1);
    unint64_t v30 = *a4;
    unint64_t v31 = (krb5_encrypt_block *)(a4[1] - (void)v29 + *a4);
    if ((unint64_t)v31 > v30) {
      return 589824;
    }
    uint64_t v32 = __rev16(v50);
    unsigned int v33 = bswap32(v49) >> 16;
    if ((v16 & 2) != 0)
    {
      krb5_error_code v36 = rrc_rotate(v29, (unint64_t)v31, (unsigned __int16)(v33 + (v32 & ((__int16)((_WORD)v27 << 6) >> 15))), 1);
      *a1 = v36;
      if (v36) {
        return 851968;
      }
      krb5_error_code v37 = krb5_decrypt(a3, *(krb5_const_pointer *)a2, (krb5_pointer)v28, (size_t)v29, v31, &ivec);
      if (v37)
      {
        *a1 = v37;
        return 393216;
      }
      if (ivec < v32 + 16)
      {
        krb5_data_free();
        _gss_mg_log(5, "cfxunwrap pad and token not fitting: %lu", v38, v39, v40, v41, v42, v43, ivec);
        return 589824;
      }
      WORD3(v57) = *(_WORD *)(ivec + v56 - 10);
      if (ct_memcmp())
      {
        krb5_data_free();
        return 393216;
      }
      uint64_t v48 = v56;
      *(void *)a5 = ivec - v32 - 16;
      *(void *)(a5 + 8) = v48;
    }
    else
    {
      uint64_t seed = 0;
      uint64_t v52 = 0;
      int v53 = 0;
      krb5_error_code v34 = rrc_rotate(v29, (unint64_t)v31, v33, 1);
      *a1 = v34;
      if (v34) {
        return 851968;
      }
      krb5_error_code checksum_type = krb5_crypto_get_checksum_type();
      if (checksum_type)
      {
        *a1 = checksum_type;
        return 851968;
      }
      uint64_t v52 = v32;
      if ((unint64_t)v31 < v32)
      {
        *a1 = 34;
        return 393216;
      }
      size_t v44 = (size_t)v31 - v32;
      int v53 = &v29[v44];
      *(void *)a5 = v44;
      int v45 = malloc_type_malloc(v44 + 16, 0xFC1C525DuLL);
      *(void *)(a5 + 8) = v45;
      if (!v45)
      {
        *a1 = 12;
        return 851968;
      }
      memcpy(v45, v29, v44);
      *(_OWORD *)(*(void *)(a5 + 8) + v44) = v57;
      *(_DWORD *)(*(void *)(a5 + 8) + v44 + 4) = 0;
      krb5_error_code v47 = krb5_verify_checksum(a3, *(void *)a2, (const krb5_checksum *)v28, *(krb5_const_pointer *)(a5 + 8), v44 + 16, &seed, v46);
      if (v47)
      {
        *a1 = v47;
        _gsskrb5_release_buffer(a1, a5);
        return 393216;
      }
    }
    if (a7) {
      *a7 = 0;
    }
    uint64_t v23 = 0;
    *a1 = 0;
  }
  return v23;
}

uint64_t _gssapi_mic_cfx(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  unsigned int v10 = (char *)malloc_type_malloc(*(void *)a5 + 16, 0xCEFC56F3uLL);
  if (!v10)
  {
    *a1 = 12;
    return 851968;
  }
  uint64_t v11 = v10;
  uint64_t v17 = 0;
  size_t v18 = 0;
  uint64_t v19 = 0;
  *((void *)&v20 + 1) = 0;
  LOWORD(v20) = 1028;
  BYTE2(v20) = *(unsigned char *)(a2 + 8) & 5;
  *(_DWORD *)((char *)&v20 + 3) = -1;
  BYTE7(v20) = -1;
  _gss_mg_encode_be_uint32(*(unsigned int *)(a2 + 16), (_DWORD *)&v20 + 2);
  _gss_mg_encode_be_uint32(*(unsigned int *)(a2 + 12), (_DWORD *)&v20 + 3);
  memcpy(v11, *(const void **)(a5 + 8), *(void *)a5);
  *(_OWORD *)&v11[*(void *)a5] = v20;
  int v12 = *(_DWORD *)(a2 + 12);
  *(_DWORD *)(a2 + 12) = v12 + 1;
  if (v12 == -1) {
    ++*(_DWORD *)(a2 + 16);
  }
  int checksum = krb5_create_checksum();
  if (checksum)
  {
    *a1 = checksum;
LABEL_6:
    free(v11);
    return 851968;
  }
  size_t v15 = v18 + 16;
  *a6 = v18 + 16;
  char v16 = malloc_type_malloc(v15, 0x385913F1uLL);
  a6[1] = v16;
  if (!v16)
  {
    *a1 = 12;
    free_Checksum((uint64_t)&v17);
    goto LABEL_6;
  }
  *char v16 = v20;
  memcpy((void *)(a6[1] + 16), v19, v18);
  free_Checksum((uint64_t)&v17);
  free(v11);
  uint64_t result = 0;
  *a1 = 0;
  return result;
}

uint64_t _gssapi_verify_mic_cfx(krb5_error_code *a1, uint64_t a2, _krb5_context *a3, uint64_t a4, void *a5, _DWORD *a6, uint64_t a7, uint64_t a8)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  *a1 = 0;
  if (*a5 <= 0xFuLL)
  {
    _gss_mg_log(5, "cfxverifymic token too short: %ld", (uint64_t)a3, a4, (uint64_t)a5, (uint64_t)a6, a7, a8, *(void *)a4);
    return 589824;
  }
  uint64_t seed = 0;
  uint64_t v26 = 0;
  int v27 = 0;
  unsigned int v10 = (long long *)a5[1];
  long long v29 = *v10;
  if (v29 != 4 || BYTE1(v29) != 4)
  {
    char v24 = v29;
    char v16 = "cfxverifymic not a MIC token: 0x%02x%02x";
    goto LABEL_9;
  }
  uint64_t result = verify_flags(a2, BYTE2(v29) & 5, (uint64_t)"mic", a4, (uint64_t)a5, (uint64_t)a6, a7, a8);
  if (result) {
    return result;
  }
  uint64_t v28 = 0;
  if (ct_memcmp())
  {
    char v16 = "cfxmic filler bad";
LABEL_9:
    _gss_mg_log(5, v16, (uint64_t)a3, a4, (uint64_t)a5, (uint64_t)a6, a7, a8, v24);
    return 589824;
  }
  _gss_mg_decode_be_uint32((unsigned int *)&v29 + 2, &v28);
  _gss_mg_decode_be_uint32((unsigned int *)((unint64_t)&v29 | 0xC), (_DWORD *)&v28 + 1);
  if (v28)
  {
    *a1 = 34;
    return 8;
  }
  uint64_t result = _gssapi_msg_order_check(*(void *)(a2 + 24), HIDWORD(v28));
  if (result)
  {
    *a1 = 0;
    return result;
  }
  krb5_error_code checksum_type = krb5_crypto_get_checksum_type();
  if (checksum_type)
  {
    *a1 = checksum_type;
    return 851968;
  }
  uint64_t v26 = *a5 - 16;
  int v27 = v10 + 1;
  int v18 = *(_DWORD *)(a2 + 8);
  uint64_t v19 = (char *)malloc_type_malloc(*(void *)a4 + 16, 0x229963E4uLL);
  if (!v19)
  {
    *a1 = 12;
    return 851968;
  }
  long long v20 = v19;
  if (v18) {
    uint64_t v21 = 25;
  }
  else {
    uint64_t v21 = 23;
  }
  memcpy(v19, *(const void **)(a4 + 8), *(void *)a4);
  *(_OWORD *)&v20[*(void *)a4] = v29;
  krb5_error_code v23 = krb5_verify_checksum(a3, *(void *)a2, (const krb5_checksum *)v21, v20, *(void *)a4 + 16, &seed, v22);
  if (v23)
  {
    *a1 = v23;
    free(v20);
    return 393216;
  }
  else
  {
    free(v20);
    uint64_t result = 0;
    if (a6) {
      *a6 = 0;
    }
  }
  return result;
}

void log_broken_acceptor_server(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t _gsskrb5_compare_name(_DWORD *a1, const krb5_principal_data *a2, const krb5_principal_data *a3, krb5_BOOLean *a4)
{
  krb5_context v11 = 0;
  int v8 = __ApplePrivate__gsskrb5_init(&v11);
  if (v8)
  {
    uint64_t result = 851968;
  }
  else
  {
    krb5_BOOLean v10 = krb5_principal_compare(v11, a2, a3);
    uint64_t result = 0;
    *a4 = v10;
  }
  *a1 = v8;
  return result;
}

uint64_t _gss_DES3_get_mic_compat(krb5_error_code *a1, uint64_t a2, _krb5_context *a3)
{
  uint64_t result = 0;
  int v8 = 0;
  if ((*(unsigned char *)(a2 + 76) & 8) == 0)
  {
    uint64_t result = check_compat(a1, a3, *(void *)(a2 + 64), (uint64_t)"broken_des3_mic", &v8, 1);
    if (!result)
    {
      uint64_t result = check_compat(a1, a3, *(void *)(a2 + 64), (uint64_t)"correct_des3_mic", &v8, 0);
      if (!result)
      {
        if (v8) {
          int v7 = *(_DWORD *)(a2 + 76) | 4;
        }
        else {
          int v7 = *(_DWORD *)(a2 + 76);
        }
        *(_DWORD *)(a2 + 76) = v7 | 8;
      }
    }
  }
  return result;
}

uint64_t check_compat(krb5_error_code *a1, _krb5_context *a2, uint64_t a3, uint64_t a4, _DWORD *a5, int a6)
{
  uint64_t result = krb5_config_get_strings();
  if (!result) {
    return result;
  }
  uint64_t v11 = result;
  krb5_principal v15 = 0;
  int v12 = *(const char **)result;
  if (!*(void *)result)
  {
LABEL_7:
    krb5_config_free_strings();
    return 0;
  }
  uint64_t v13 = 8;
  while (1)
  {
    krb5_error_code v14 = krb5_parse_name(a2, v12, &v15);
    if (v14) {
      break;
    }
    if (krb5_principal_match())
    {
      *a5 = a6;
      break;
    }
    krb5_free_principal(a2, v15);
    krb5_principal v15 = 0;
    int v12 = *(const char **)(v11 + v13);
    v13 += 8;
    if (!v12) {
      goto LABEL_7;
    }
  }
  if (v15) {
    krb5_free_principal(a2, v15);
  }
  krb5_config_free_strings();
  if (!v14) {
    return 0;
  }
  if (a1) {
    *a1 = v14;
  }
  return 851968;
}

uint64_t _gsskrb5_lifetime_left(_DWORD *a1, krb5_context a2, uint64_t a3, int *a4)
{
  if (a3 == 0x7FFFFFFF)
  {
    uint64_t result = 0;
    int v6 = -1;
  }
  else
  {
    *(void *)size_t v9 = 0;
    uint64_t result = krb5_timeofday(a2, v9);
    if (result)
    {
      *a1 = result;
      return 851968;
    }
    if (a3 >= *(uint64_t *)v9) {
      int v6 = a3 - v9[0];
    }
    else {
      int v6 = 0;
    }
  }
  *a4 = v6;
  return result;
}

uint64_t _gsskrb5_context_time(_DWORD *a1, uint64_t a2, int *a3)
{
  krb5_context v10 = 0;
  int v6 = __ApplePrivate__gsskrb5_init(&v10);
  if (v6)
  {
    *a1 = v6;
    return 851968;
  }
  else
  {
    int v8 = (pthread_mutex_t *)(a2 + 128);
    pthread_mutex_lock((pthread_mutex_t *)(a2 + 128));
    uint64_t v9 = *(void *)(a2 + 120);
    pthread_mutex_unlock(v8);
    uint64_t result = _gsskrb5_lifetime_left(a1, v10, v9, a3);
    if (!result)
    {
      *a1 = 0;
      if (*a3) {
        return 0;
      }
      else {
        return 786432;
      }
    }
  }
  return result;
}

uint64_t _gsskrb5_krb5_import_cred(int *a1, _krb5_ccache *a2, const krb5_principal_data *a3, uint64_t a4, void *a5)
{
  krb5_context context = 0;
  *a5 = 0;
  int v10 = __ApplePrivate__gsskrb5_init(&context);
  if (!v10)
  {
    uint64_t v13 = (char *)malloc_type_calloc(1uLL, 0x88uLL, 0x1030040BE4FC7E4uLL);
    if (v13)
    {
      krb5_error_code v14 = v13;
      krb5_principal v15 = (pthread_mutex_t *)(v13 + 48);
      pthread_mutex_init((pthread_mutex_t *)(v13 + 48), 0);
      *((_DWORD *)v14 + 8) = 0;
      if (!a2)
      {
LABEL_17:
        if (!a4
          || ((*((_DWORD *)v14 + 8) |= 2u, !a3)
           || *(void *)v14
           || (int full_name = krb5_copy_principal(context, a3, (krb5_principal *)v14)) == 0)
          && (int full_name = krb5_kt_get_full_name()) == 0
          && (int full_name = krb5_kt_resolve(context, 0, (krb5_keytab *)v14 + 2), free(0), !full_name))
        {
          uint64_t v11 = 0;
          *a1 = 0;
          *a5 = v14;
          return v11;
        }
LABEL_25:
        long long v20 = (_krb5_ccache *)*((void *)v14 + 5);
        if (v20) {
          krb5_cc_close(context, v20);
        }
        uint64_t v21 = (_krb5_kt *)*((void *)v14 + 2);
        if (v21) {
          krb5_kt_close(context, v21);
        }
        if (*(void *)v14) {
          krb5_free_principal(context, *(krb5_principal *)v14);
        }
        pthread_mutex_destroy(v15);
        free(v14);
        *a1 = full_name;
        return 851968;
      }
      *((_DWORD *)v14 + 8) = 1;
      krb5_error_code principal = krb5_cc_get_principal(context, a2, (krb5_principal *)v14);
      if (principal)
      {
        krb5_error_code v17 = principal;
        free(v14);
        *a1 = v17;
        return 851968;
      }
      if (!a3 || krb5_principal_compare(context, *(krb5_const_principal *)v14, a3))
      {
        uint64_t v11 = __gsskrb5_ccache_lifetime(a1, context, a2, *(void *)v14, (void *)v14 + 3);
        if (v11)
        {
          krb5_free_principal(context, *(krb5_principal *)v14);
          free(v14);
          return v11;
        }
        int full_name = krb5_cc_get_full_name();
        if (full_name) {
          goto LABEL_25;
        }
        int full_name = krb5_cc_resolve(context, 0, (krb5_ccache *)v14 + 5);
        free(0);
        if (full_name) {
          goto LABEL_25;
        }
        goto LABEL_17;
      }
      krb5_free_principal(context, *(krb5_principal *)v14);
      free(v14);
      _gsskrb5_clear_status();
      int v18 = 22;
    }
    else
    {
      _gsskrb5_clear_status();
      int v18 = 12;
    }
    *a1 = v18;
    return 851968;
  }
  *a1 = v10;
  return 851968;
}

uint64_t _gsskrb5_get_mech(unsigned char *a1, uint64_t a2)
{
  if (!a2) {
    return -1;
  }
  if (*a1 == 96 && !der_get_length()) {
    return -1;
  }
  return -1;
}

uint64_t _gssapi_verify_mech_header(unsigned char **a1, unint64_t a2, uint64_t a3)
{
  size_t mech = _gsskrb5_get_mech(*a1, a2);
  if ((mech & 0x8000000000000000) != 0) {
    return 589824;
  }
  int v7 = (unsigned char *)mech;
  if (a2 < mech || mech != *(_DWORD *)a3) {
    return 0x10000;
  }
  if (-(uint64_t)*a1 > a2 - mech) {
    return 0x10000;
  }
  uint64_t result = memcmp(0, *(const void **)(a3 + 8), mech);
  if (result) {
    return 0x10000;
  }
  *a1 = v7;
  return result;
}

uint64_t _gsskrb5_verify_header(unsigned char **a1, unint64_t a2, unsigned __int16 *a3, uint64_t a4)
{
  int v7 = *a1;
  uint64_t result = _gssapi_verify_mech_header(a1, a2, a4);
  if (!result)
  {
    uint64_t v9 = *a1;
    if ((unint64_t)(&v7[a2] - *a1) >= 2 && *(unsigned __int16 *)v9 == *a3)
    {
      uint64_t result = 0;
      *a1 = v9 + 2;
    }
    else
    {
      return 589824;
    }
  }
  return result;
}

uint64_t _gssapi_decapsulate(_DWORD *a1, unint64_t *a2, _WORD *a3, void *a4, uint64_t a5)
{
  unint64_t v9 = *a2;
  krb5_error_code v14 = (unsigned char *)a2[1];
  uint64_t result = _gssapi_verify_mech_header(&v14, v9, a5);
  if (result)
  {
    *a1 = 0;
  }
  else
  {
    unint64_t v12 = a2[1] - (void)v14 + *a2;
    if (v12 > 1)
    {
      uint64_t result = 0;
      uint64_t v13 = v14 + 2;
      *a3 = *(_WORD *)v14;
      *a4 = v12 - 2;
      a4[1] = v13;
    }
    else
    {
      *a1 = 0;
      return 589824;
    }
  }
  return result;
}

uint64_t _gsskrb5_decapsulate(_DWORD *a1, unint64_t *a2, void *a3, unsigned __int16 *a4, uint64_t a5)
{
  unint64_t v8 = *a2;
  unint64_t v12 = (unsigned char *)a2[1];
  uint64_t result = _gsskrb5_verify_header(&v12, v8, a4, a5);
  if (result)
  {
    *a1 = 0;
  }
  else
  {
    uint64_t v11 = v12;
    *a3 = *a2 - (void)v12 + a2[1];
    a3[1] = v11;
  }
  return result;
}

uint64_t _gssapi_verify_pad(void *a1, unint64_t a2, void *a3)
{
  uint64_t v3 = a1[1] + *a1;
  unsigned int v6 = *(unsigned __int8 *)(v3 - 1);
  uint64_t v4 = (unsigned __int8 *)(v3 - 1);
  uint64_t v5 = v6;
  if (v6 > a2) {
    return 0x10000;
  }
  if (v5)
  {
    uint64_t v8 = v5;
    while (1)
    {
      int v9 = *v4--;
      if (v9 != v5) {
        return 393216;
      }
      if (!--v8) {
        goto LABEL_7;
      }
    }
  }
  else
  {
LABEL_7:
    uint64_t result = 0;
    *a3 = v5;
  }
  return result;
}

uint64_t _gsskrb5_delete_sec_context(_DWORD *a1, void **a2, void *a3)
{
  krb5_context context = 0;
  int v6 = __ApplePrivate__gsskrb5_init(&context);
  if (v6)
  {
    *a1 = v6;
    return 851968;
  }
  else
  {
    *a1 = 0;
    if (a3)
    {
      *a3 = 0;
      a3[1] = 0;
    }
    uint64_t v8 = *a2;
    if (*a2)
    {
      *a2 = 0;
      pthread_mutex_lock((pthread_mutex_t *)v8 + 2);
      int v9 = (_krb5_ccache *)*((void *)v8 + 13);
      if (v9)
      {
        int v10 = *((_DWORD *)v8 + 19);
        if ((v10 & 0x10) != 0)
        {
          krb5_cc_close(context, v9);
        }
        else if ((v10 & 0x20) != 0)
        {
          krb5_cc_destroy(context, v9);
        }
      }
      krb5_auth_con_free(context, *((krb5_auth_context *)v8 + 5));
      krb5_auth_con_free(context, *((krb5_auth_context *)v8 + 6));
      uint64_t v11 = (krb5_creds *)*((void *)v8 + 12);
      if (v11) {
        krb5_free_creds(context, v11);
      }
      unint64_t v12 = (krb5_principal_data *)*((void *)v8 + 7);
      if (v12) {
        krb5_free_principal(context, v12);
      }
      uint64_t v13 = (krb5_principal_data *)*((void *)v8 + 8);
      if (v13) {
        krb5_free_principal(context, v13);
      }
      krb5_error_code v14 = (krb5_ticket *)*((void *)v8 + 14);
      if (v14) {
        krb5_free_ticket(context, v14);
      }
      if (*((void *)v8 + 3)) {
        _gssapi_msg_order_destroy((void **)v8 + 3);
      }
      krb5_principal v15 = (krb5_keyblock *)*((void *)v8 + 24);
      if (v15) {
        krb5_free_keyblock(context, v15);
      }
      krb5_data_free();
      if (*(void *)v8) {
        krb5_crypto_destroy();
      }
      if (*((void *)v8 + 31)) {
        krb5_tkt_creds_free();
      }
      if (*((void *)v8 + 27)) {
        heim_release();
      }
      char v16 = (krb5_get_init_creds_opt *)*((void *)v8 + 29);
      if (v16) {
        krb5_get_init_creds_opt_free(context, v16);
      }
      if (*((void *)v8 + 30)) {
        krb5_init_creds_free();
      }
      krb5_error_code v17 = (void *)*((void *)v8 + 33);
      if (v17)
      {
        size_t v18 = strlen(*((const char **)v8 + 33));
        bzero(v17, v18);
        free(*((void **)v8 + 33));
      }
      uint64_t v19 = (krb5_data *)*((void *)v8 + 32);
      if (v19) {
        krb5_free_data(context, v19);
      }
      long long v20 = (void *)*((void *)v8 + 34);
      if (v20) {
        free(v20);
      }
      if (*((void *)v8 + 28)) {
        krb5_storage_free();
      }
      if (*((void *)v8 + 35)) {
        krb5_data_free();
      }
      if (*((void *)v8 + 37)) {
        krb5_data_free();
      }
      pthread_mutex_unlock((pthread_mutex_t *)v8 + 2);
      pthread_mutex_destroy((pthread_mutex_t *)v8 + 2);
      *(_OWORD *)uint64_t v8 = 0u;
      *((_OWORD *)v8 + 1) = 0u;
      *((_OWORD *)v8 + 2) = 0u;
      *((_OWORD *)v8 + 3) = 0u;
      *((_OWORD *)v8 + 4) = 0u;
      *((_OWORD *)v8 + 5) = 0u;
      *((_OWORD *)v8 + 6) = 0u;
      *((_OWORD *)v8 + 7) = 0u;
      *((_OWORD *)v8 + 8) = 0u;
      *((_OWORD *)v8 + 9) = 0u;
      *((_OWORD *)v8 + 10) = 0u;
      *((_OWORD *)v8 + 11) = 0u;
      *((_OWORD *)v8 + 12) = 0u;
      *((_OWORD *)v8 + 13) = 0u;
      *((_OWORD *)v8 + 14) = 0u;
      *((_OWORD *)v8 + 15) = 0u;
      *((_OWORD *)v8 + 16) = 0u;
      *((_OWORD *)v8 + 17) = 0u;
      *((_OWORD *)v8 + 18) = 0u;
      *((void *)v8 + 38) = 0;
      free(v8);
    }
    return 0;
  }
}

uint64_t _gsskrb5_display_name(_DWORD *a1, const krb5_principal_data *a2, size_t *a3, gss_OID_desc **a4)
{
  __s = 0;
  krb5_context v13 = 0;
  int v8 = __ApplePrivate__gsskrb5_init(&v13);
  if (v8 || (int v8 = krb5_unparse_name_flags(v13, a2, 4, &__s)) != 0)
  {
    uint64_t v9 = 851968;
  }
  else
  {
    uint64_t v11 = __s;
    *a3 = strlen(__s);
    a3[1] = (size_t)v11;
    int v8 = 0;
    uint64_t v9 = 0;
    if (a4) {
      *a4 = &__gss_krb5_nt_principal_name_oid_desc;
    }
  }
  *a1 = v8;
  return v9;
}

void _gsskrb5_clear_status()
{
  krb5_context v0 = 0;
  if (!__ApplePrivate__gsskrb5_init(&v0)) {
    krb5_clear_error_message(v0);
  }
}

void _gsskrb5_set_status(krb5_error_code a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  unint64_t v12 = 0;
  krb5_context v13 = 0;
  uint64_t v11 = 0;
  if (!__ApplePrivate__gsskrb5_init(&v13))
  {
    unint64_t v12 = &a9;
    if ((vasprintf(&v11, a2, &a9) & 0x80000000) == 0)
    {
      if (v11)
      {
        krb5_set_error_message(v13, a1, "%s", v11);
        free(v11);
      }
    }
  }
}

uint64_t _gsskrb5_display_status(_DWORD *a1, krb5_error_code a2, int a3, const gss_OID_desc *a4, _DWORD *a5, size_t *a6)
{
  __s = 0;
  krb5_context v20 = 0;
  int v12 = __ApplePrivate__gsskrb5_init(&v20);
  if (v12)
  {
    *a1 = v12;
    return 851968;
  }
  *a6 = 0;
  a6[1] = 0;
  if (!gss_oid_equal(a4, 0) && !gss_oid_equal(a4, &__gss_krb5_mechanism_oid_desc))
  {
    *a1 = 0;
    return 1;
  }
  if (a3 == 2)
  {
    error_message = krb5_get_error_message(v20, a2);
    if (error_message)
    {
      krb5_principal v15 = error_message;
      __s = strdup(error_message);
      krb5_free_error_message(v20, v15);
      goto LABEL_17;
    }
    int v16 = asprintf(&__s, "unknown mech error-code %u");
  }
  else
  {
    if (a3 != 1)
    {
      *a1 = 22;
      return 327680;
    }
    if ((_WORD)a2) {
      int v16 = asprintf(&__s, "%s");
    }
    else {
      int v16 = asprintf(&__s, "%s %s");
    }
  }
  if (v16 < 0)
  {
LABEL_19:
    *a1 = 12;
    return 851968;
  }
LABEL_17:
  krb5_error_code v17 = __s;
  if (!__s) {
    goto LABEL_19;
  }
  *a5 = 0;
  *a1 = 0;
  size_t v18 = strlen(v17);
  uint64_t result = 0;
  *a6 = v18;
  a6[1] = (size_t)v17;
  return result;
}

uint64_t _gsskrb5_duplicate_name(_DWORD *a1, const krb5_principal_data *a2, void *a3)
{
  krb5_principal v9 = 0;
  krb5_context v10 = 0;
  int v6 = __ApplePrivate__gsskrb5_init(&v10);
  if (v6 || (int v6 = krb5_copy_principal(v10, a2, &v9)) != 0)
  {
    uint64_t v7 = 851968;
  }
  else
  {
    uint64_t v7 = 0;
    *a3 = v9;
  }
  *a1 = v6;
  return v7;
}

uint64_t _gssapi_encap_length(uint64_t a1, void *a2, void *a3, _DWORD *a4)
{
  *a2 = (*a4 + 2) + a1;
  uint64_t result = der_length_len();
  *a3 = result + *a2 + 1;
  return result;
}

uint64_t _gsskrb5_encap_length(uint64_t a1, void *a2, void *a3, _DWORD *a4)
{
  *a2 = a1 + (*a4 + 2) + 2;
  uint64_t result = der_length_len();
  *a3 = result + *a2 + 1;
  return result;
}

char *_gsskrb5_make_header(unsigned char *a1, uint64_t a2, _WORD *a3, const void **a4)
{
  mech_uint64_t header = _gssapi_make_mech_header(a1, a2, a4);
  *(_WORD *)mech_uint64_t header = *a3;
  return mech_header + 2;
}

char *_gssapi_make_mech_header(unsigned char *a1, uint64_t a2, const void **a3)
{
  *a1 = 96;
  uint64_t v5 = der_length_len();
  int v6 = &a1[v5];
  if (der_put_length()) {
    BOOL v7 = 0;
  }
  else {
    BOOL v7 = v5 == 0;
  }
  if (!v7) {
    abort();
  }
  int v8 = v6 + 1;
  v6[1] = 6;
  krb5_principal v9 = v6 + 3;
  v8[1] = *(_DWORD *)a3;
  memcpy(v9, a3[1], *(unsigned int *)a3);
  return &v9[*(unsigned int *)a3];
}

uint64_t _gsskrb5_encapsulate(_DWORD *a1, uint64_t a2, size_t *a3, _WORD *a4, const void **a5)
{
  uint64_t v10 = *(void *)a2 + (*(_DWORD *)a5 + 2) + 2;
  size_t v11 = der_length_len() + v10 + 1;
  *a3 = v11;
  int v12 = malloc_type_malloc(v11, 0xBCEA057CuLL);
  a3[1] = (size_t)v12;
  if (v12)
  {
    mech_uint64_t header = _gssapi_make_mech_header(v12, v10, a5);
    *(_WORD *)mech_uint64_t header = *a4;
    memcpy(mech_header + 2, *(const void **)(a2 + 8), *(void *)a2);
    return 0;
  }
  else
  {
    *a1 = 12;
    return 851968;
  }
}

uint64_t _gsskrb5_export_name(int *a1, const krb5_principal_data *a2, size_t *a3)
{
  return export_name_common(a1, (const void **)&__gss_krb5_mechanism_oid_desc, a2, a3);
}

uint64_t export_name_common(int *a1, const void **a2, const krb5_principal_data *a3, size_t *a4)
{
  __s = 0;
  krb5_context v13 = 0;
  int v8 = __ApplePrivate__gsskrb5_init(&v13);
  if (v8 || (int v8 = krb5_unparse_name(v13, a3, &__s)) != 0)
  {
    *a1 = v8;
    return 851968;
  }
  else
  {
    size_t v11 = strlen(__s);
    uint64_t v9 = gss_mg_export_name(a1, a2, __s, v11, a4);
    krb5_xfree();
  }
  return v9;
}

uint64_t _gsspku2u_export_name(int *a1, const krb5_principal_data *a2, size_t *a3)
{
  return export_name_common(a1, (const void **)&__gss_pku2u_mechanism_oid_desc, a2, a3);
}

uint64_t _gssiakerb_export_name(int *a1, const krb5_principal_data *a2, size_t *a3)
{
  return export_name_common(a1, (const void **)&__gss_krb5_mechanism_oid_desc, a2, a3);
}

uint64_t _gsskrb5_export_sec_context(int *a1, void **a2, size_t *a3)
{
  krb5_context v25 = 0;
  int v6 = (char *)*a2;
  size_t v23 = 0;
  size_t v24 = 0;
  size_t v21 = 0;
  size_t v22 = 0;
  int v20 = 0;
  int v7 = __ApplePrivate__gsskrb5_init(&v25);
  if (v7)
  {
    *a1 = v7;
    return 851968;
  }
  uint64_t v9 = (pthread_mutex_t *)(v6 + 128);
  pthread_mutex_lock((pthread_mutex_t *)v6 + 2);
  if ((v6[73] & 1) == 0)
  {
    pthread_mutex_unlock((pthread_mutex_t *)v6 + 2);
    *a1 = 0;
    return 0x100000;
  }
  uint64_t v10 = krb5_storage_emem();
  if (!v10)
  {
    pthread_mutex_unlock((pthread_mutex_t *)v6 + 2);
    *a1 = 12;
    return 851968;
  }
  uint64_t v11 = v10;
  int v12 = (void *)*((void *)v6 + 5);
  int v13 = krb5_store_int32();
  if (v13) {
    goto LABEL_9;
  }
  int v13 = krb5_store_int32();
  if (v13) {
    goto LABEL_9;
  }
  if (v12[1])
  {
    int v13 = krb5_store_address();
    if (v13) {
      goto LABEL_9;
    }
  }
  if (v12[2])
  {
    int v13 = krb5_store_address();
    if (v13) {
      goto LABEL_9;
    }
  }
  int v13 = krb5_store_int16();
  if (v13) {
    goto LABEL_9;
  }
  int v13 = krb5_store_int16();
  if (v13) {
    goto LABEL_9;
  }
  if (v12[4])
  {
    int v13 = krb5_store_keyblock();
    if (v13) {
      goto LABEL_9;
    }
  }
  if (v12[5])
  {
    int v13 = krb5_store_keyblock();
    if (v13) {
      goto LABEL_9;
    }
  }
  if (v12[6])
  {
    int v13 = krb5_store_keyblock();
    if (v13) {
      goto LABEL_9;
    }
  }
  int v13 = krb5_store_int32();
  if (v13) {
    goto LABEL_9;
  }
  uint64_t v19 = v6;
  int v13 = krb5_store_int32();
  if (v13) {
    goto LABEL_9;
  }
  int v13 = krb5_store_int32();
  if (v13) {
    goto LABEL_9;
  }
  int v13 = krb5_store_int32();
  if (v13) {
    goto LABEL_9;
  }
  uint64_t v8 = _gsskrb5_export_name(a1, *((const krb5_principal_data **)v6 + 7), &v21);
  if (v8) {
    goto LABEL_11;
  }
  int v15 = krb5_store_data();
  _gsskrb5_release_buffer(&v20, (uint64_t)&v21);
  if (v15)
  {
    int v13 = v15;
LABEL_9:
    uint64_t v8 = 0;
LABEL_10:
    *a1 = v13;
LABEL_11:
    pthread_mutex_unlock(v9);
    krb5_storage_free();
    return v8;
  }
  uint64_t v8 = _gsskrb5_export_name(a1, *((const krb5_principal_data **)v19 + 8), &v21);
  if (v8) {
    goto LABEL_11;
  }
  size_t v23 = v21;
  size_t v24 = v22;
  int v16 = krb5_store_data();
  _gsskrb5_release_buffer(&v20, (uint64_t)&v21);
  if (v16)
  {
    int v13 = v16;
LABEL_41:
    uint64_t v8 = 851968;
    goto LABEL_10;
  }
  int v13 = krb5_store_int32();
  if (v13) {
    goto LABEL_41;
  }
  int v13 = krb5_store_int32();
  if (v13) {
    goto LABEL_41;
  }
  int v13 = krb5_store_int32();
  if (v13) {
    goto LABEL_41;
  }
  int v13 = _gssapi_msg_order_export(v11, *((void *)v19 + 3));
  if (v13) {
    goto LABEL_41;
  }
  int v17 = krb5_storage_to_data();
  krb5_storage_free();
  if (v17)
  {
    pthread_mutex_unlock(v9);
    *a1 = v17;
    return 851968;
  }
  size_t v18 = v24;
  *a3 = v23;
  a3[1] = v18;
  pthread_mutex_unlock(v9);
  uint64_t v8 = _gsskrb5_delete_sec_context(a1, a2, 0);
  if (v8) {
    _gsskrb5_release_buffer(0, (uint64_t)a3);
  }
  *a1 = 0;
  return v8;
}

void *__gss_krb5_initialize()
{
  return &krb5_mech;
}

void *__gss_pku2u_initialize()
{
  return &iakerb_mech;
}

void *__gss_iakerb_initialize()
{
  return &pku2u_mech;
}

uint64_t _gsskrb5_get_mic(int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  int v27 = 0;
  krb5_context v28 = 0;
  int v10 = __ApplePrivate__gsskrb5_init(&v28);
  if (!v10)
  {
    if ((*(unsigned char *)(a2 + 76) & 0x40) != 0) {
      return _gssapi_mic_cfx(a1, a2, (uint64_t)v28, a3, a4, (void *)a5);
    }
    pthread_mutex_lock((pthread_mutex_t *)(a2 + 128));
    int token_key = _gsskrb5i_get_token_key(a2, v28, &v27);
    pthread_mutex_unlock((pthread_mutex_t *)(a2 + 128));
    if (token_key)
    {
      *a1 = token_key;
      return 851968;
    }
    krb5_magic magic = v27->magic;
    if ((v27->magic - 23) < 2)
    {
      uint64_t mic_arcfour = _gssapi_get_mic_arcfour(a1, a2, v28, a3, a4, (size_t *)a5, v27);
      goto LABEL_31;
    }
    if (magic != 16 && magic != 5)
    {
      uint64_t mic_arcfour = 851968;
LABEL_31:
      krb5_free_keyblock(v28, v27);
      return mic_arcfour;
    }
    int v15 = v28;
    uint64_t v35 = 0;
    size_t v36 = 0;
    krb5_error_code v37 = 0;
    krb5_int32 v34 = 0;
    size_t size = 0;
    uint64_t v33 = 0;
    uint64_t v30 = 0;
    uint64_t v31 = 0;
    uint64_t v29 = 0;
    _gsskrb5_encap_length(36, &v33, &size, &__gss_krb5_mechanism_oid_desc);
    size_t v16 = size;
    *(void *)a5 = size;
    int v17 = malloc_type_malloc(v16, 0x4E0FEA83uLL);
    *(void *)(a5 + 8) = v17;
    if (v17)
    {
      uint64_t header = _gsskrb5_make_header(v17, v33, "\x01\x01", (const void **)&__gss_krb5_mechanism_oid_desc);
      *(_WORD *)uint64_t header = 4;
      *(_DWORD *)(header + 2) = -1;
      uint64_t v19 = malloc_type_malloc(*(void *)a4 + 8, 0xE1AF8775uLL);
      if (v19)
      {
        int v20 = v19;
        *uint64_t v19 = *(void *)(header - 2);
        memcpy(v19 + 1, *(const void **)(a4 + 8), *(void *)a4);
        int v21 = krb5_crypto_init();
        if (v21)
        {
          int checksum = v21;
          free(*(void **)(a5 + 8));
          *(void *)a5 = 0;
          *(void *)(a5 + 8) = 0;
          free(v20);
        }
        else
        {
          int checksum = krb5_create_checksum();
          free(v20);
          krb5_crypto_destroy();
          if (!checksum)
          {
            memcpy(header + 14, v37, v36);
            pthread_mutex_lock((pthread_mutex_t *)(a2 + 128));
            krb5_auth_con_getlocalseqnumber(v15, *(krb5_auth_context *)(a2 + 40), &v34);
            int v23 = 16843009 * ((*(unsigned char *)(a2 + 76) & 1) - 1);
            krb5_int32 v39 = v34;
            int v40 = v23;
            int v24 = krb5_crypto_init();
            if (v24)
            {
              int checksum = v24;
            }
            else
            {
              if ((*(unsigned char *)(a2 + 76) & 4) != 0) {
                uint64_t v25 = 0;
              }
              else {
                uint64_t v25 = *(void *)(header + 14);
              }
              uint64_t v38 = v25;
              int checksum = krb5_encrypt_ivec();
              krb5_crypto_destroy();
              if (!checksum)
              {
                if (v29 != 8) {
                  _gsskrb5_get_mic_cold_1();
                }
                *(void *)(header + 6) = *v30;
                krb5_data_free();
                ++v34;
                krb5_auth_con_setlocalseqnumber();
                pthread_mutex_unlock((pthread_mutex_t *)(a2 + 128));
                free_Checksum((uint64_t)&v35);
                int checksum = 0;
                uint64_t mic_arcfour = 0;
                goto LABEL_30;
              }
            }
          }
          free(*(void **)(a5 + 8));
          *(void *)a5 = 0;
          *(void *)(a5 + 8) = 0;
        }
        uint64_t mic_arcfour = 851968;
LABEL_30:
        *a1 = checksum;
        goto LABEL_31;
      }
      free(*(void **)(a5 + 8));
      *(void *)(a5 + 8) = 0;
    }
    *(void *)a5 = 0;
    uint64_t mic_arcfour = 851968;
    int checksum = 12;
    goto LABEL_30;
  }
  *a1 = v10;
  return 851968;
}

uint64_t _gsskrb5_canon_name(_DWORD *a1, _krb5_context *a2, int a3, uint64_t a4, const krb5_principal_data *a5, krb5_principal *a6)
{
  *a1 = 0;
  if (krb5_principal_get_type() != -1202)
  {
    uint64_t result = krb5_copy_principal(a2, a5, a6);
    goto LABEL_13;
  }
  if (a3)
  {
    krb5_magic magic = a5->realm.magic;
    if (!magic) {
      return 0x20000;
    }
    if (magic == 1)
    {
      int v13 = 0;
      data = (const char **)a5->realm.data;
    }
    else
    {
      data = (const char **)a5->realm.data;
      int v13 = data[1];
    }
    uint64_t result = krb5_sname_to_principal(a2, v13, *data, 3, a6);
    goto LABEL_13;
  }
  LODWORD(result) = krb5_copy_principal(a2, a5, a6);
  if (!result)
  {
    krb5_principal_set_type();
    if (!a4) {
      return 0;
    }
    uint64_t result = krb5_principal_set_realm();
LABEL_13:
    if (!result) {
      return result;
    }
  }
  *a1 = result;
  return 851968;
}

uint64_t _gsskrb5_import_name(_DWORD *a1, unint64_t *a2, gss_const_OID a, void *a4)
{
  return _gss_mech_import_name(a1, (const void **)&__gss_krb5_mechanism_oid_desc, (uint64_t)&krb5_names, a2, a, a4);
}

uint64_t _gsspku2u_import_name(_DWORD *a1, unint64_t *a2, gss_const_OID a, void *a4)
{
  return _gss_mech_import_name(a1, (const void **)&__gss_pku2u_mechanism_oid_desc, (uint64_t)&pku2u_names, a2, a, a4);
}

uint64_t _gssiakerb_import_name(_DWORD *a1, unint64_t *a2, gss_const_OID a, void *a4)
{
  return _gss_mech_import_name(a1, (const void **)&__gss_iakerb_mechanism_oid_desc, (uint64_t)&iakerb_names, a2, a, a4);
}

uint64_t _gsskrb5_inquire_names_for_mech(OM_uint32 *a1, uint64_t a2, gss_OID_set *a3)
{
  return _gss_mech_inquire_names_for_mech(a1, (uint64_t)&krb5_names, a3);
}

uint64_t _gsspku2u_inquire_names_for_mech(OM_uint32 *a1, uint64_t a2, gss_OID_set *a3)
{
  return _gss_mech_inquire_names_for_mech(a1, (uint64_t)&pku2u_names, a3);
}

uint64_t _gssiakerb_inquire_names_for_mech(OM_uint32 *a1, uint64_t a2, gss_OID_set *a3)
{
  return _gss_mech_inquire_names_for_mech(a1, (uint64_t)&iakerb_names, a3);
}

uint64_t import_hostbased_name(_DWORD *a1, gss_const_OID a, uint64_t a3, uint64_t a4, void *a5)
{
  krb5_context v16 = 0;
  gss_oid_equal(a, &__gss_pku2u_mechanism_oid_desc);
  int v8 = __ApplePrivate__gsskrb5_init(&v16);
  if (v8)
  {
    *a1 = v8;
    return 851968;
  }
  int v10 = (char *)malloc_type_malloc(*(void *)a3 + 1, 0x28DDAD19uLL);
  if (!v10)
  {
    *a1 = 12;
    return 851968;
  }
  uint64_t v11 = v10;
  memcpy(v10, *(const void **)(a3 + 8), *(void *)a3);
  v11[*(void *)a3] = 0;
  int v12 = strchr(v11, 64);
  if (v12)
  {
    int v13 = v12;
    if (v12[1])
    {
      *int v12 = 0;
      size_t v14 = strlen(v12 + 1);
      if (v14)
      {
        if (v13[v14] == 46) {
          v13[v14] = 0;
        }
      }
    }
  }
  int principal = krb5_make_principal();
  free(v11);
  *a1 = principal;
  if ((principal + 1765328251) < 2) {
    return 0x20000;
  }
  if (principal) {
    return 851968;
  }
  krb5_principal_set_type();
  uint64_t result = 0;
  *a5 = 0;
  return result;
}

uint64_t import_krb5_principal(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  krb5_principal v9 = 0;
  krb5_context v10 = 0;
  LODWORD(result) = __ApplePrivate__gsskrb5_init(&v10);
  if (result || (uint64_t result = krb5_copy_principal(v10, **(krb5_const_principal **)(a3 + 8), &v9), result))
  {
    *a1 = result;
    return 851968;
  }
  else
  {
    *a5 = v9;
  }
  return result;
}

uint64_t import_krb5_name(krb5_error_code *a1, const gss_OID_desc *a2, uint64_t a3, const gss_OID_desc *a4, krb5_principal *a5)
{
  krb5_principal v21 = 0;
  krb5_context v22 = 0;
  krb5_error_code v10 = __ApplePrivate__gsskrb5_init(&v22);
  if (v10)
  {
    *a1 = v10;
    return 851968;
  }
  uint64_t v11 = (char *)malloc_type_malloc(*(void *)a3 + 1, 0xEC1F776AuLL);
  if (!v11) {
    goto LABEL_21;
  }
  int v12 = v11;
  memcpy(v11, *(const void **)(a3 + 8), *(void *)a3);
  v12[*(void *)a3] = 0;
  if (*v12 == 64)
  {
    int v13 = (krb5_principal_data *)malloc_type_calloc(1uLL, 0x20uLL, 0x10900408A8AD7E9uLL);
    krb5_principal v21 = v13;
    if (v13)
    {
      size_t v14 = v13;
      int v15 = strdup(v12 + 1);
      v14->data = (krb5_data *)v15;
      if (!v15)
      {
        free(v12);
        free(v14);
        return 851968;
      }
      goto LABEL_12;
    }
    free(v12);
LABEL_21:
    *a1 = 12;
    return 851968;
  }
  krb5_error_code v16 = krb5_parse_name(v22, v12, &v21);
  if (v16)
  {
    krb5_error_code v17 = v16;
    free(v12);
    *a1 = v17;
    if ((v17 + 1765328251) >= 2) {
      return 851968;
    }
    else {
      return 0x20000;
    }
  }
LABEL_12:
  if (a2 && gss_oid_equal(a2, &__gss_pku2u_mechanism_oid_desc) && !strchr(v12, 64)) {
    krb5_principal_set_realm();
  }
  free(v12);
  krb5_principal v19 = v21;
  if (v21->realm.magic == 2)
  {
    int v20 = gss_oid_equal(a4, &__gss_krb5_nt_principal_name_referral_oid_desc);
    krb5_principal v19 = v21;
    if (v20)
    {
      krb5_principal_set_type();
      krb5_principal v19 = v21;
    }
  }
  uint64_t result = 0;
  *a5 = v19;
  return result;
}

uint64_t import_uuid_name(_DWORD *a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  krb5_context v14 = 0;
  int principal = __ApplePrivate__gsskrb5_init(&v14);
  if (principal) {
    goto LABEL_2;
  }
  if (*a3 < 0x24uLL
    || (uint64_t v10 = a3[1],
        int v11 = *(_DWORD *)(v10 + 32),
        long long v12 = *(_OWORD *)(v10 + 16),
        *(_OWORD *)__s = *(_OWORD *)v10,
        long long v16 = v12,
        int v17 = v11,
        char v18 = 0,
        strspn(__s, "0123456789abcdefABCDEF-") != 36))
  {
    int principal = 0;
    uint64_t v9 = 0x20000;
    goto LABEL_8;
  }
  int principal = krb5_make_principal();
  if (principal)
  {
LABEL_2:
    uint64_t v9 = 851968;
  }
  else
  {
    krb5_principal_set_type();
    int principal = 0;
    uint64_t v9 = 0;
    *a5 = 0;
  }
LABEL_8:
  *a1 = principal;
  return v9;
}

uint64_t import_dn_name(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  *a5 = 0;
  *a1 = 0;
  return 851968;
}

uint64_t import_pku2u_export_name(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  *a5 = 0;
  *a1 = 0;
  return 851968;
}

uint64_t _gsskrb5_import_sec_context(int *a1, uint64_t a2, uint64_t *a3)
{
  krb5_context v32 = 0;
  memset(v31, 0, sizeof(v31));
  memset(v30, 0, sizeof(v30));
  unint64_t v28 = 0;
  uint64_t v29 = 0;
  unint64_t v26 = 0;
  uint64_t v27 = 0;
  memset(&v25, 0, sizeof(v25));
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  int v5 = __ApplePrivate__gsskrb5_init(&v32);
  if (v5)
  {
    *a1 = v5;
    return 851968;
  }
  *a3 = 0;
  uint64_t v8 = krb5_storage_from_mem();
  if (!v8)
  {
    *a1 = 12;
    return 851968;
  }
  uint64_t v9 = v8;
  uint64_t v10 = (pthread_mutex_t *)malloc_type_calloc(1uLL, 0x138uLL, 0x10B00402E3E967EuLL);
  if (!v10)
  {
    *a1 = 12;
    krb5_storage_free();
    return 851968;
  }
  uint64_t v11 = (uint64_t)v10;
  long long v12 = v10 + 2;
  pthread_mutex_init(v10 + 2, 0);
  krb5_error_code v13 = krb5_auth_con_init(v32, (krb5_auth_context *)(v11 + 40));
  if (!v13)
  {
    *a1 = 0;
    if (!krb5_ret_int32())
    {
      long long v16 = *(_krb5_auth_context **)(v11 + 40);
      if (!krb5_ret_int32())
      {
        *(_DWORD *)long long v16 = v24;
        char v19 = BYTE4(v24);
        if ((v24 & 0x100000000) != 0)
        {
          krb5_context v14 = (krb5_address *)v31;
          if (krb5_ret_address()) {
            goto LABEL_14;
          }
          krb5_context v14 = (krb5_address *)v31;
          char v19 = BYTE4(v24);
        }
        else
        {
          krb5_context v14 = 0;
        }
        if ((v19 & 2) != 0)
        {
          int v15 = (krb5_address *)v30;
          if (krb5_ret_address()) {
            goto LABEL_15;
          }
        }
        else
        {
          int v15 = 0;
        }
        krb5_auth_con_setaddrs(v32, v16, v14, v15);
        if (v14) {
          krb5_free_address();
        }
        if (v15) {
          krb5_free_address();
        }
        if (!krb5_ret_int16() && !krb5_ret_int16())
        {
          char v20 = BYTE4(v24);
          if ((v24 & 0x400000000) != 0)
          {
            if (krb5_ret_keyblock()) {
              goto LABEL_13;
            }
            krb5_auth_con_setkey();
            krb5_free_keyblock_contents(v32, &v25);
            char v20 = BYTE4(v24);
          }
          if ((v20 & 8) != 0)
          {
            if (krb5_ret_keyblock()) {
              goto LABEL_13;
            }
            krb5_auth_con_setlocalsubkey();
            krb5_free_keyblock_contents(v32, &v25);
            char v20 = BYTE4(v24);
          }
          if ((v20 & 0x10) != 0)
          {
            if (krb5_ret_keyblock()) {
              goto LABEL_13;
            }
            krb5_auth_con_setremotesubkey();
            krb5_free_keyblock_contents(v32, &v25);
          }
          if (!krb5_ret_uint32() && !krb5_ret_uint32() && !krb5_ret_int32())
          {
            *((_DWORD *)v16 + 22) = v24;
            if (!krb5_ret_int32())
            {
              *((_DWORD *)v16 + 23) = v24;
              if (!krb5_ret_data())
              {
                unint64_t v26 = v28;
                uint64_t v27 = v29;
                if (_gsskrb5_import_name(a1, &v26, &__gss_c_nt_export_name_oid_desc, &v23))
                {
                  uint64_t v21 = _gsskrb5_import_name(a1, &v26, 0, &v23);
                  if (v21) {
                    goto LABEL_56;
                  }
                }
                *(void *)(v11 + 56) = v23;
                krb5_data_free();
                if (krb5_ret_data()) {
                  goto LABEL_58;
                }
                unint64_t v26 = v28;
                uint64_t v27 = v29;
                if (_gsskrb5_import_name(a1, &v26, &__gss_c_nt_export_name_oid_desc, &v23))
                {
                  uint64_t v21 = _gsskrb5_import_name(a1, &v26, 0, &v23);
                  if (v21)
                  {
LABEL_56:
                    uint64_t v22 = v21;
                    krb5_data_free();
                    krb5_context v14 = 0;
                    int v15 = 0;
                    uint64_t v6 = v22;
                    goto LABEL_16;
                  }
                }
                *(void *)(v11 + 64) = v23;
                krb5_data_free();
                if (krb5_ret_int32()
                  || (*(_DWORD *)(v11 + 72) = v24, krb5_ret_int32())
                  || (*(_DWORD *)(v11 + 76) = v24, krb5_ret_int32()))
                {
LABEL_58:
                  uint64_t v6 = 0;
                }
                else
                {
                  *(void *)(v11 + 120) = (int)v24;
                  uint64_t v6 = _gssapi_msg_order_import(a1, v9, (void **)(v11 + 24));
                  if (!v6)
                  {
                    krb5_storage_free();
                    _gsskrb5i_is_cfx(v32, v11, (*(_DWORD *)(v11 + 76) & 1) == 0);
                    *a3 = v11;
                    return v6;
                  }
                }
                krb5_context v14 = 0;
                int v15 = 0;
                goto LABEL_16;
              }
            }
          }
        }
      }
    }
LABEL_13:
    krb5_context v14 = 0;
LABEL_14:
    int v15 = 0;
    goto LABEL_15;
  }
  krb5_context v14 = 0;
  int v15 = 0;
  *a1 = v13;
LABEL_15:
  uint64_t v6 = 851968;
LABEL_16:
  krb5_auth_con_free(v32, *(krb5_auth_context *)(v11 + 40));
  int v17 = *(krb5_principal_data **)(v11 + 56);
  if (v17) {
    krb5_free_principal(v32, v17);
  }
  char v18 = *(krb5_principal_data **)(v11 + 64);
  if (v18) {
    krb5_free_principal(v32, v18);
  }
  if (v14) {
    krb5_free_address();
  }
  if (v15) {
    krb5_free_address();
  }
  if (*(void *)(v11 + 24)) {
    _gssapi_msg_order_destroy((void **)(v11 + 24));
  }
  pthread_mutex_destroy(v12);
  krb5_storage_free();
  free((void *)v11);
  *a3 = 0;
  return v6;
}

uint64_t _gsskrb5_create_ctx(krb5_error_code *a1, void *a2, _krb5_context *a3, uint64_t a4, uint64_t a5)
{
  *a2 = 0;
  uint64_t v10 = (char *)malloc_type_calloc(1uLL, 0x138uLL, 0x10B00402E3E967EuLL);
  if (!v10)
  {
    *a1 = 12;
    return 851968;
  }
  uint64_t v11 = v10;
  *(_OWORD *)(v10 + 40) = 0u;
  long long v12 = v10 + 40;
  *((void *)v10 + 4) = a5;
  *((void *)v10 + 24) = 0;
  *(_OWORD *)(v10 + 56) = 0u;
  *((void *)v10 + 9) = 0;
  *((void *)v10 + 13) = 0;
  *((void *)v10 + 14) = 0;
  *((void *)v10 + 12) = 0;
  krb5_data_zero();
  pthread_mutex_init((pthread_mutex_t *)(v12 + 88), 0);
  krb5_error_code v13 = krb5_auth_con_init(a3, (krb5_auth_context *)v12);
  if (v13)
  {
    *a1 = v13;
LABEL_7:
    pthread_mutex_destroy((pthread_mutex_t *)(v12 + 88));
    return 851968;
  }
  krb5_context v14 = (krb5_auth_context *)(v12 + 8);
  krb5_error_code v15 = krb5_auth_con_init(a3, (krb5_auth_context *)v12 + 1);
  if (v15)
  {
    *a1 = v15;
    krb5_auth_con_free(a3, *(krb5_auth_context *)v12);
    goto LABEL_7;
  }
  krb5_error_code v17 = set_addresses(a3, *(_krb5_auth_context **)v12, a4);
  if (v17 || (krb5_error_code v17 = set_addresses(a3, *v14, a4)) != 0)
  {
    *a1 = v17;
    krb5_auth_con_free(a3, *(krb5_auth_context *)v12);
    krb5_auth_con_free(a3, *v14);
    pthread_mutex_destroy((pthread_mutex_t *)(v12 + 88));
    return 0x40000;
  }
  else
  {
    krb5_auth_con_addflags();
    krb5_auth_con_addflags();
    uint64_t result = 0;
    *a2 = v11;
  }
  return result;
}

uint64_t set_addresses(_krb5_context *a1, _krb5_auth_context *a2, uint64_t a3)
{
  if (!a3 || *(void *)(a3 + 48) != 4) {
    return 0;
  }
  memset(&v10, 0, sizeof(v10));
  memset(&v9, 0, sizeof(v9));
  uint64_t v6 = *(_WORD **)(a3 + 56);
  *((_WORD *)a2 + 12) = *v6;
  *((_WORD *)a2 + 13) = v6[1];
  uint64_t v7 = _gsskrb5i_address_to_krb5addr((uint64_t)a1, *(_DWORD *)(a3 + 24), a3 + 32);
  if (!v7)
  {
    uint64_t v7 = _gsskrb5i_address_to_krb5addr((uint64_t)a1, *(_DWORD *)a3, a3 + 8);
    if (!v7)
    {
      uint64_t v7 = krb5_auth_con_setaddrs(a1, a2, &v10, &v9);
      krb5_free_address();
    }
    krb5_free_address();
  }
  return v7;
}

uint64_t _gsskrb5_iakerb_parse_header(_DWORD *a1, _krb5_context *a2, uint64_t a3, unint64_t *a4, uint64_t *a5)
{
  unint64_t v18 = 0;
  uint64_t result = _gssapi_decapsulate(a1, a4, &v19, a5, (uint64_t)&__gss_iakerb_mechanism_oid_desc);
  if (!result)
  {
    if (v19 == 261)
    {
      __s1 = 0;
      krb5_error_code v17 = 0;
      int v11 = decode_IAKERB_HEADER(a5[1], *a5, (uint64_t)&__s1, (uint64_t)&v18);
      if (v11)
      {
        *a1 = v11;
        return 851968;
      }
      else if (*a5 < v18)
      {
        uint64_t v15 = heim_abort();
        return _gsskrb5_iakerb_make_header(v15);
      }
      else
      {
        uint64_t v12 = a5[1] + v18;
        *a5 -= v18;
        a5[1] = v12;
        krb5_error_code v13 = v17;
        if (v17)
        {
          if (*(void *)(a3 + 256))
          {
            krb5_free_data(a2, *(krb5_data **)(a3 + 256));
            krb5_error_code v13 = v17;
          }
          krb5_copy_data(a2, v13, (krb5_data **)(a3 + 256));
        }
        krb5_context v14 = *(void **)(a3 + 272);
        if (v14) {
          free(v14);
        }
        *(void *)(a3 + 272) = strdup(__s1);
        free_IAKERB_HEADER((uint64_t)&__s1);
        return 0;
      }
    }
    else
    {
      int v10 = v19;
      *a1 = 0;
      if (v10 == 3) {
        return 851968;
      }
      else {
        return 589824;
      }
    }
  }
  return result;
}

uint64_t _gsskrb5_iakerb_make_header(int *a1, _krb5_context *a2, uint64_t a3, uint64_t a4, uint64_t a5, size_t *a6)
{
  uint64_t v24 = 0;
  v25[0] = a4;
  v25[1] = *(void *)(a3 + 256);
  uint64_t v11 = length_IAKERB_HEADER((uint64_t)v25);
  uint64_t v12 = malloc_type_malloc(v11, 0x23B8F8D0uLL);
  if (!v12)
  {
    int v15 = 12;
    goto LABEL_5;
  }
  krb5_error_code v13 = v12;
  int v14 = encode_IAKERB_HEADER((uint64_t)v12 + v11 - 1, v11, (uint64_t)v25, (uint64_t)&v24);
  if (v14)
  {
    int v15 = v14;
    free(v13);
LABEL_5:
    *a1 = v15;
    return 851968;
  }
  if (v11 == v24)
  {
    unint64_t v18 = *(krb5_data **)(a3 + 256);
    if (v18)
    {
      krb5_free_data(a2, v18);
      *(void *)(a3 + 256) = 0;
    }
    size_t v22 = *(void *)a5 + v11;
    unsigned __int16 v19 = (char *)malloc_type_malloc(v22, 0xFE310CE9uLL);
    uint64_t v23 = v19;
    if (v19)
    {
      char v20 = v19;
      memcpy(v19, v13, v11);
      memcpy(&v20[v11], *(const void **)(a5 + 8), *(void *)a5);
      free(v13);
      uint64_t v16 = _gsskrb5_encapsulate(a1, (uint64_t)&v22, a6, "\x05\x01", *(const void ***)(a3 + 32));
      free(v23);
      return v16;
    }
    free(v13);
    *a1 = 12;
    return 851968;
  }
  uint64_t v21 = heim_abort();
  return _gsskrb5_init_sec_context(v21);
}

uint64_t _gsskrb5_init_sec_context(krb5_error_code *a1, uint64_t a2, void **a3, const krb5_principal_data *a4, const gss_OID_desc *a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, _DWORD *a12, _DWORD *a13)
{
  krb5_context context = 0;
  krb5_error_code v21 = __ApplePrivate__gsskrb5_init(&context);
  if (v21)
  {
    *a1 = v21;
    return 851968;
  }
  *a11 = 0;
  a11[1] = 0;
  if (!a3)
  {
LABEL_30:
    *a1 = 0;
    return 51183616;
  }
  if (a12) {
    *a12 = 0;
  }
  if (a13) {
    *a13 = 0;
  }
  if (!a4)
  {
    if (a10) {
      *a10 = 0;
    }
    *a1 = 0;
    return 0x20000;
  }
  if (a2 && *(_DWORD *)(a2 + 32) >= 2u)
  {
    krb5_set_error_message(context, 35224071, "ISC: Credentials not of usage type initiator or both");
    *a1 = 35224071;
    return 655360;
  }
  b = &__gss_krb5_mechanism_oid_desc;
  int v23 = gss_oid_equal(a5, &__gss_krb5_mechanism_oid_desc);
  uint64_t v24 = (pthread_mutex_t *)init_krb5_auth;
  if (!v23)
  {
    b = &__gss_iakerb_mechanism_oid_desc;
    int v25 = gss_oid_equal(a5, &__gss_iakerb_mechanism_oid_desc);
    uint64_t v24 = (pthread_mutex_t *)init_iakerb_auth;
    if (!v25)
    {
      b = &__gss_pku2u_mechanism_oid_desc;
      int v26 = gss_oid_equal(a5, &__gss_pku2u_mechanism_oid_desc);
      uint64_t v24 = (pthread_mutex_t *)init_pku2u_auth;
      if (!v26) {
        return 0x10000;
      }
    }
  }
  if (a9 && *a9)
  {
    uint64_t v27 = (char *)*a3;
    if (!*a3) {
      goto LABEL_30;
    }
LABEL_35:
    uint64_t v58 = (pthread_mutex_t *)(v27 + 128);
    pthread_mutex_lock((pthread_mutex_t *)v27 + 2);
    if (a10) {
      *a10 = *((void *)v27 + 4);
    }
    krb5_error_code v37 = (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))*((void *)v27 + 11);
    while (1)
    {
      uint64_t v38 = ((uint64_t (*)(krb5_error_code *, uint64_t, char *, krb5_context, const krb5_principal_data *, gss_OID_desc *, uint64_t, uint64_t, uint64_t, void *, void *, _DWORD *, _DWORD *))v37)(a1, a2, v27, context, a4, b, a6, a7, a8, a9, a11, a12, a13);
      uint64_t ctx = v38;
      if (v38) {
        break;
      }
      krb5_error_code v37 = (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))*((void *)v27 + 11);
      if (v37 == step_completed || *a11) {
        goto LABEL_43;
      }
    }
    if (v38 < 0x10000)
    {
LABEL_43:
      pthread_mutex_unlock(v58);
      return ctx;
    }
    uint64_t v54 = (_krb5_ccache *)*((void *)v27 + 13);
    if (v54 && (v27[76] & 0x10) != 0) {
      krb5_cc_close(context, v54);
    }
    *((void *)v27 + 13) = 0;
    pthread_mutex_unlock(v58);
    check[0] = 0;
    _gsskrb5_delete_sec_context(check, a3, 0);
    return ctx;
  }
  long long v57 = v24;
  unint64_t v28 = context;
  check[0] = 0;
  pthread_mutex_lock(&nc_mutex);
  if (!nc[0])
  {
    notify_register_check("com.apple.Kerberos.cache.changed", &dword_26780376C);
    notify_register_check("com.apple.system.clock_set", &dword_267803770);
    nc[0] = 1;
  }
  notify_check(dword_26780376C, check);
  unsigned int v59 = a6;
  if (check[0] || (notify_check(dword_267803770, check), check[0]))
  {
    uint64_t v29 = 6u;
    do
    {
      free_entry(v28, &nc[v29]);
      v29 += 10;
    }
    while (v29 != 76);
    _gss_mg_log(1, "krb5-isc: got a notification, drop negative cache", v30, v31, v32, v33, v34, v35, v56);
    pthread_mutex_unlock(&nc_mutex);
LABEL_28:
    a6 = v59;
LABEL_29:
    if (*a3) {
      goto LABEL_30;
    }
    uint64_t ctx = _gsskrb5_create_ctx(a1, a3, context, a8, (uint64_t)b);
    if (ctx) {
      return ctx;
    }
    uint64_t v27 = (char *)*a3;
    *((void *)*a3 + 11) = v57;
    goto LABEL_35;
  }
  uint64_t v39 = 0;
  while (1)
  {
    if (!gss_oid_equal(*(gss_const_OID *)&nc[v39 + 6], b)) {
      goto LABEL_54;
    }
    int v40 = *(const krb5_principal_data **)&nc[v39 + 10];
    if (!v40 || !krb5_principal_compare(v28, a4, v40)) {
      goto LABEL_54;
    }
    if (a2 && *(void *)a2) {
      break;
    }
    if (!*(void *)&nc[v39 + 8]) {
      goto LABEL_61;
    }
LABEL_54:
    v39 += 10;
    if (v39 == 70)
    {
      pthread_mutex_unlock(&nc_mutex);
      _gss_mg_log(1, "gss-isc: not negative cache", v48, v49, v50, v51, v52, v53, v56);
      a7 = a7;
      goto LABEL_28;
    }
  }
  krb5_error_code v47 = *(const krb5_principal_data **)&nc[v39 + 8];
  if (!v47 || !krb5_principal_compare(v28, *(krb5_const_principal *)a2, v47)) {
    goto LABEL_54;
  }
LABEL_61:
  int v55 = &nc[v39];
  *a1 = v55[13];
  uint64_t ctx = v55[12];
  _gss_mg_log(1, "gss-isc: negative cache %d/%d - %s", v41, v42, v43, v44, v45, v46, v55[12]);
  krb5_set_error_message(v28, *a1, "%s (negative cache)", *((const char **)v55 + 7));
  pthread_mutex_unlock(&nc_mutex);
  a7 = a7;
  a6 = v59;
  if (!ctx) {
    goto LABEL_29;
  }
  return ctx;
}

uint64_t init_krb5_auth(krb5_error_code *a1, uint64_t a2, uint64_t a3, _krb5_context *a4, const krb5_principal_data *a5, uint64_t a6, uint64_t a7, unsigned int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _DWORD *a13)
{
  *(void *)&v58.krb5_magic magic = 0;
  v58.data = 0;
  uint64_t v56 = 0;
  uint64_t v57 = 0;
  int v55 = 0;
  krb5_data_zero();
  krb5_data_zero();
  *a1 = 0;
  unsigned __int16 v19 = (krb5_ccache *)(a3 + 104);
  if (!*(void *)(a3 + 104))
  {
    if (a2)
    {
      char v20 = *(_krb5_ccache **)(a2 + 40);
      *unsigned __int16 v19 = v20;
    }
    else
    {
      krb5_error_code principal = krb5_cc_default(a4, (krb5_ccache *)(a3 + 104));
      if (principal) {
        goto LABEL_20;
      }
      *(_DWORD *)(a3 + 76) |= 0x10u;
      char v20 = *(_krb5_ccache **)(a3 + 104);
    }
    krb5_error_code principal = krb5_cc_get_principal(a4, v20, (krb5_principal *)(a3 + 56));
    if (!principal) {
      goto LABEL_5;
    }
LABEL_20:
    krb5_error_code v38 = principal;
    *a1 = principal;
    uint64_t full_name = 851968;
    goto LABEL_31;
  }
LABEL_5:
  krb5_set_default_in_tkt_etypes();
  if (krb5_cc_get_config(a4, *v19, 0, "realm-config", &v58))
  {
    BOOL v22 = 1;
  }
  else
  {
    BOOL v22 = *(void *)&v58.magic && (*v58.data & 2) == 0;
    krb5_data_free();
  }
  uint64_t ImpersonateBundle = HeimCredGetImpersonateBundle();
  if (ImpersonateBundle) {
    uint64_t v30 = "gss-krb5: ISC disabled kerberos DNS canonalization";
  }
  else {
    uint64_t v30 = "gss-krb5: ISC no AppVPN";
  }
  _gss_mg_log(1, v30, v23, v24, v25, v26, v27, v28, v52);
  if (!_gss_mg_log_level(1)) {
    goto LABEL_22;
  }
  uint64_t v54 = 0;
  uint64_t full_name = krb5_unparse_name(a4, *(krb5_const_principal *)(a3 + 56), &v54);
  if (!full_name)
  {
    uint64_t full_name = krb5_cc_get_full_name();
    if (full_name)
    {
      krb5_xfree();
      goto LABEL_29;
    }
    _gss_mg_log(1, "gss-krb5: ISC client: %s cache: %s", v32, v33, v34, v35, v36, v37, (char)v54);
    krb5_xfree();
    krb5_xfree();
LABEL_22:
    uint64_t creds = gsskrb5_get_creds(a1, a4, *(_krb5_ccache **)(a3 + 104), a3, a5, 0, a8, a13);
    uint64_t full_name = creds;
    if (v22 && creds && !ImpersonateBundle) {
      uint64_t full_name = gsskrb5_get_creds(a1, a4, *(_krb5_ccache **)(a3 + 104), a3, a5, 1, a8, a13);
    }
    if (!full_name)
    {
      *(void *)(a3 + 120) = *(void *)(*(void *)(a3 + 96) + 56);
      uint64_t full_name = _gss_DES3_get_mic_compat(a1, a3, a4);
      if (!full_name)
      {
        uint64_t full_name = _gsskrb5_lifetime_left(a1, a4, *(void *)(a3 + 120), &v55);
        if (!full_name)
        {
          if (v55)
          {
            uint64_t full_name = 0;
            *(void *)(a3 + 88) = step_setup_keys;
            return full_name;
          }
          _gss_mg_log(1, "gss-krb5: credentials expired", v40, v41, v42, v43, v44, v45, v53);
          krb5_error_code v38 = 0;
          *a1 = 0;
          uint64_t full_name = 786432;
          goto LABEL_31;
        }
      }
    }
  }
LABEL_29:
  if (full_name < 0x10000) {
    return full_name;
  }
  krb5_error_code v38 = *a1;
LABEL_31:
  uint64_t v46 = *(krb5_principal_data **)(a3 + 32);
  pthread_mutex_lock(&nc_mutex);
  free_entry(a4, &qword_267803780[5 * qword_267803778]);
  krb5_error_code v47 = (krb5_principal *)&qword_267803780[5 * qword_267803778];
  *krb5_error_code v47 = v46;
  krb5_copy_principal(a4, a5, v47 + 2);
  if (a2 && *(void *)a2) {
    krb5_copy_principal(a4, *(krb5_const_principal *)a2, (krb5_principal *)&nc[10 * qword_267803778 + 8]);
  }
  uint64_t v48 = (char *)&qword_267803780[5 * qword_267803778];
  *((_DWORD *)v48 + 6) = full_name;
  *((_DWORD *)v48 + 7) = v38;
  error_message = krb5_get_error_message(a4, v38);
  uint64_t v50 = qword_267803778;
  qword_267803780[5 * qword_267803778 + 4] = error_message;
  qword_267803778 = (v50 + 1) % 7uLL;
  pthread_mutex_unlock(&nc_mutex);
  return full_name;
}

uint64_t init_iakerb_auth(int *a1, uint64_t a2, uint64_t a3, _krb5_context *a4, const krb5_principal_data *a5)
{
  uint64_t v10 = krb5_storage_emem();
  *(void *)(a3 + 224) = v10;
  if (!v10) {
    goto LABEL_9;
  }
  if (!a2) {
    return 851968;
  }
  krb5_error_code v11 = krb5_copy_principal(a4, *(krb5_const_principal *)a2, (krb5_principal *)(a3 + 56));
  if (!v11)
  {
    krb5_error_code v11 = krb5_copy_principal(a4, a5, (krb5_principal *)(a3 + 64));
    if (!v11)
    {
      krb5_principal_set_realm();
      int v14 = *(const char **)(a2 + 128);
      if (v14)
      {
        int v15 = strdup(v14);
        *(void *)(a3 + 264) = v15;
        if (!v15)
        {
LABEL_9:
          uint64_t result = 851968;
          int v12 = 12;
          goto LABEL_10;
        }
      }
      else if (*(void *)(a2 + 120))
      {
        *(void *)(a3 + 216) = heim_retain();
      }
      else if ((*(unsigned char *)(a2 + 8) & 4) == 0)
      {
        uint64_t result = 851968;
        int v12 = 22;
        goto LABEL_10;
      }
      uint64_t v16 = *(_krb5_ccache **)(a2 + 40);
      *(void *)(a3 + 104) = v16;
      krb5_cc_get_config(a4, v16, 0, "FriendlyName", (krb5_data *)(a3 + 280));
      krb5_cc_get_config(a4, *(krb5_ccache *)(a3 + 104), 0, "lkdc-hostname", (krb5_data *)(a3 + 296));
      int v12 = 0;
      uint64_t result = 0;
      krb5_error_code v17 = step_iakerb_auth_tgs;
      if ((*(_DWORD *)(a2 + 8) & 4) == 0) {
        krb5_error_code v17 = step_iakerb_auth_as;
      }
      *(void *)(a3 + 88) = v17;
      goto LABEL_10;
    }
  }
  int v12 = v11;
  uint64_t result = 851968;
LABEL_10:
  *a1 = v12;
  return result;
}

uint64_t init_pku2u_auth(krb5_error_code *a1, uint64_t a2, void *a3, _krb5_context *a4)
{
  krb5_principal v41 = 0;
  *a1 = 0;
  uint64_t v8 = krb5_storage_emem();
  a3[28] = v8;
  if (!v8)
  {
    int v10 = 12;
    goto LABEL_11;
  }
  if (a2)
  {
    if (*(void *)(a2 + 120))
    {
      krb5_error_code v9 = krb5_copy_principal(a4, *(krb5_const_principal *)a2, &v41);
      if (v9)
      {
        *a1 = v9;
        return 851968;
      }
      a3[27] = heim_retain();
      goto LABEL_16;
    }
    int v10 = 22;
LABEL_11:
    *a1 = v10;
    return 851968;
  }
  *(void *)&long long v34 = 0;
  uint64_t v11 = _gsspku2u_acquire_cred(a1, 0, 0xFFFFFFFFLL, 0, 1u, &v34, 0, 0);
  if (v11) {
    return v11;
  }
  krb5_error_code v12 = krb5_copy_principal(a4, *(krb5_const_principal *)v34, &v41);
  if (v12)
  {
    krb5_error_code v13 = v12;
    _gsskrb5_release_cred(a1, (uint64_t *)&v34);
    *a1 = v13;
    return 851968;
  }
  a3[27] = heim_retain();
  _gsskrb5_release_cred(a1, (uint64_t *)&v34);
LABEL_16:
  krb5_error_code inited = setup_icc(a4, a3, (uint64_t)v41, v15, v16, v17, v18, v19);
  if (inited || (krb5_error_code inited = krb5_init_creds_set_service()) != 0)
  {
    *a1 = inited;
LABEL_19:
    uint64_t v11 = 851968;
    goto LABEL_20;
  }
  if (!krb5_principal_is_null())
  {
    uint64_t v11 = _krb5_init_creds_set_pku2u();
    if (v11)
    {
LABEL_31:
      *a1 = v11;
      goto LABEL_19;
    }
LABEL_27:
    a3[11] = step_pku2u_auth;
LABEL_20:
    if (v41) {
      krb5_free_principal(a4, v41);
    }
    return v11;
  }
  uint64_t v39 = 0;
  uint64_t v36 = 0;
  v37[0] = 0;
  v40[1] = 0;
  long long v34 = 0u;
  long long v35 = 0u;
  v40[0] = malloc_type_calloc(1uLL, 0x30uLL, 0x10B204088662708uLL);
  if (!v40[0])
  {
    *a1 = 12;
    goto LABEL_19;
  }
  int subject = hx509_cert_get_subject();
  if (subject)
  {
    LODWORD(v11) = subject;
LABEL_30:
    free_InitiatorNameAssertion((uint64_t)v40);
    goto LABEL_31;
  }
  LODWORD(v11) = MEMORY[0x216697170](v39, &v34);
  hx509_name_free();
  if (v11) {
    goto LABEL_30;
  }
  uint64_t v22 = v40[0];
  *(_DWORD *)v40[0] = 2;
  *(_DWORD *)(v22 + 8) = 4;
  *(_DWORD *)(v22 + 16) = 1;
  *(_DWORD *)(v22 + 24) = DWORD2(v35);
  *(void *)(v22 + 32) = v36;
  uint64_t v23 = length_InitiatorNameAssertion((uint64_t)v40);
  v37[1] = v23;
  uint64_t v24 = malloc_type_malloc(v23, 0x40862202uLL);
  krb5_error_code v38 = v24;
  if (!v24)
  {
LABEL_35:
    free_InitiatorNameAssertion((uint64_t)v40);
    goto LABEL_19;
  }
  uint64_t v25 = v24;
  if (encode_InitiatorNameAssertion((uint64_t)v24 + v23 - 1, v23, (uint64_t)v40, (uint64_t)v37))
  {
    free(v25);
    krb5_error_code v38 = 0;
    goto LABEL_35;
  }
  free_InitiatorNameAssertion((uint64_t)v40);
  if (v37[0] == v23)
  {
    uint64_t v11 = _krb5_init_creds_set_pku2u();
    krb5_data_free();
    if (v11) {
      goto LABEL_31;
    }
    goto LABEL_27;
  }
  uint64_t v26 = (_DWORD *)krb5_abortx();
  return step_completed(v26, v27, v28, v29, v30, v31, v32, v33);
}

uint64_t step_completed(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _gsskrb5_set_status(22, "init_sec_context called one time too many", a3, a4, a5, a6, a7, a8, v10);
  *a1 = 22;
  return 327680;
}

uint64_t gsskrb5_get_creds(krb5_error_code *a1, krb5_context a2, _krb5_ccache *a3, uint64_t a4, const krb5_principal_data *a5, int a6, unsigned int a7, _DWORD *a8)
{
  uint64_t v17 = (krb5_principal *)(a4 + 64);
  uint64_t v16 = *(krb5_principal_data **)(a4 + 64);
  if (v16)
  {
    krb5_free_principal(a2, v16);
    krb5_principal *v17 = 0;
  }
  uint64_t v19 = a4 + 96;
  uint64_t v18 = *(krb5_creds **)(a4 + 96);
  if (v18)
  {
    krb5_free_creds(a2, v18);
    *(void *)uint64_t v19 = 0;
  }
  uint64_t result = _gsskrb5_canon_name(a1, a2, a6, *(void *)(a4 + 56), a5, v17);
  if (!result)
  {
    int v50 = 0;
    if (_krb5_have_debug())
    {
      *(void *)uint64_t v51 = 0;
      if (!krb5_unparse_name(a2, *v17, (char **)v51))
      {
        _gss_mg_log(1, "gss-krb5: ISC server %s %s", v21, v22, v23, v24, v25, v26, v51[0]);
        krb5_xfree();
      }
    }
    long long v52 = 0u;
    memset(&v51[16], 0, 112);
    *(_OWORD *)uint64_t v51 = *(_OWORD *)(a4 + 56);
    if (a7 - 1 <= 0xFFFFFFFD)
    {
      *(void *)uint64_t v49 = 0;
      krb5_timeofday(a2, v49);
      *(void *)&v51[56] = *(void *)v49 + a7;
    }
    krb5_error_code credentials = krb5_get_credentials(a2, 0x200000, a3, (krb5_creds *)v51, (krb5_creds **)(a4 + 96));
    if (credentials)
    {
      krb5_error_code v34 = credentials;
      _gss_mg_log(1, "gss-krb5: ISC get cred failed with %d %s", v28, v29, v30, v31, v32, v33, credentials);
      *a1 = v34;
      return 851968;
    }
    else
    {
      if (_krb5_have_debug())
      {
        *(void *)uint64_t v49 = 0;
        if (!krb5_unparse_name(a2, *(krb5_const_principal *)(*(void *)v19 + 8), (char **)v49))
        {
          _gss_mg_log(1, "gss-krb5: ISC will use %s", v35, v36, v37, v38, v39, v40, v49[0]);
          krb5_xfree();
        }
      }
      uint64_t v41 = *(void *)(*(void *)(a4 + 96) + 56);
      *(void *)(a4 + 120) = v41;
      uint64_t result = _gsskrb5_lifetime_left(a1, a2, v41, &v50);
      if (!result)
      {
        if (v50)
        {
          uint64_t result = 0;
          if (a8) {
            *a8 = v50;
          }
        }
        else
        {
          _gss_mg_log(1, "gss-krb5: credentials expired", v42, v43, v44, v45, v46, v47, v48);
          *a1 = 0;
          return 786432;
        }
      }
    }
  }
  return result;
}

uint64_t step_setup_keys(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, unint64_t *a10, size_t *a11, _DWORD *a12, int *a13)
{
  if (*(void *)(a3 + 96))
  {
    krb5_auth_con_setkey();
    krb5_auth_con_setkey();
    uint64_t result = krb5_auth_con_generatelocalsubkey();
    if (result)
    {
      *a1 = result;
      return 851968;
    }
    else
    {
      *(void *)(a3 + 88) = init_auth_step;
    }
  }
  else
  {
    uint64_t v16 = (int *)heim_abort();
    return init_auth_step(v16, v17, v18, v19, v20, v21, v22, v23, a9, a10, a11, a12, a13);
  }
  return result;
}

uint64_t init_auth_step(int *a1, uint64_t a2, uint64_t a3, _krb5_context *a4, uint64_t a5, uint64_t a6, __int16 a7, uint64_t a8, void *a9, unint64_t *a10, size_t *a11, _DWORD *a12, int *a13)
{
  size_t v63 = 0;
  uint64_t v64 = 0;
  size_t v62 = 0;
  v60[0] = 0;
  v60[1] = 0;
  *(void *)&v59.krb5_magic magic = 0;
  v59.data = 0;
  uint64_t v57 = 0;
  krb5_data v58 = 0;
  int v56 = 0;
  krb5_data_zero();
  krb5_data_zero();
  krb5_data_zero();
  memset(v61, 0, sizeof(v61));
  *a1 = 0;
  if ((*(unsigned char *)(*(void *)(a3 + 96) + 137) & 0x20) != 0
    || (uint64_t v18 = *(_krb5_ccache **)(a3 + 104)) == 0
    || (*(void *)&v65.krb5_magic magic = 0, v65.data = 0, krb5_cc_get_config(a4, v18, 0, "realm-config", &v65)))
  {
    if ((a7 & 0x8000) == 0)
    {
LABEL_5:
      unsigned int v19 = 0;
      goto LABEL_11;
    }
  }
  else
  {
    if (!*(void *)&v65.magic || (*v65.data & 1) == 0) {
      a7 &= 0x7FFEu;
    }
    krb5_data_free();
    if ((a7 & 0x8000) == 0) {
      goto LABEL_5;
    }
  }
  unsigned int v19 = (*(unsigned __int8 *)(*(void *)(a3 + 96) + 137) << 26 >> 31) & 0x8001;
LABEL_11:
  if (v19 & 1 | a7 & 1 && (uint64_t v20 = *(_krb5_ccache **)(a3 + 104)) != 0)
  {
    uint64_t v21 = *(void *)(a3 + 64);
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    krb5_data v65 = (krb5_data)0;
    krb5_data_zero();
    int principal = krb5_cc_get_principal(a4, v20, (krb5_principal *)&v65);
    if (!principal)
    {
      uint64_t v54 = *(void *)(*(void *)&v65.magic + 24);
      int principal = krb5_make_principal();
      if (!principal)
      {
        *((void *)&v68 + 1) = 0;
        if (*(_DWORD *)(v21 + 8) > 1u)
        {
          KDCOptions2int(6);
          int principal = krb5_get_forwarded_creds();
        }
        else
        {
          int principal = 35224071;
          krb5_set_error_message(a4, 35224071, "ISC: only support forwarding to services", "krbtgt", v54, 0);
        }
      }
    }
    uint64_t v30 = "ok-as-delegate";
    if (v19 < 0x8000) {
      uint64_t v30 = "delegate";
    }
    _gss_mg_log(1, "gss-krb5: delegation %s -> %s", v22, v23, v24, v25, v26, v27, (char)v30);
    if (principal) {
      int v29 = 0;
    }
    else {
      int v29 = v19 | a7 & 1;
    }
    if (*(void *)&v65.magic) {
      krb5_free_principal(a4, *(krb5_principal *)&v65.magic);
    }
    if (v65.data) {
      krb5_free_principal(a4, (krb5_principal)v65.data);
    }
  }
  else
  {
    int v29 = 0;
  }
  int v31 = a7 & 2;
  if ((a7 & 0x1000) != 0) {
    int v31 = 4098;
  }
  int v32 = a7 & 0x603C | v31 | v29;
  if (!a2 || (*(unsigned char *)(a2 + 8) & 2) == 0) {
    v32 |= 0x30u;
  }
  int v33 = *(_DWORD *)(a3 + 76) | 1;
  *(_DWORD *)(a3 + 72) = v32 | 0x100;
  *(_DWORD *)(a3 + 76) = v33;
  uint64_t checksum = krb5_crypto_init();
  if (checksum) {
    goto LABEL_34;
  }
  if (!*(void *)(a3 + 224)) {
    goto LABEL_47;
  }
  memset(v55, 0, sizeof(v55));
  v65.data = 0;
  *(void *)&long long v66 = 0;
  *(void *)&v65.krb5_magic magic = 0;
  uint64_t checksum = krb5_storage_to_data();
  krb5_storage_free();
  *(void *)(a3 + 224) = 0;
  if (checksum || (uint64_t checksum = krb5_create_checksum(), krb5_data_free(), checksum))
  {
LABEL_34:
    if (v64) {
      krb5_crypto_destroy();
    }
    free_Checksum((uint64_t)v61);
    krb5_data_free();
    krb5_data_free();
    return checksum;
  }
  uint64_t v57 = length_GSS_KRB5_FINISHED((uint64_t)&v65);
  uint64_t v36 = malloc_type_malloc(v57, 0xC5A132BFuLL);
  krb5_data v58 = v36;
  if (!v36)
  {
    uint64_t checksum = 12;
    goto LABEL_45;
  }
  uint64_t v37 = encode_GSS_KRB5_FINISHED((uint64_t)v36 + v57 - 1, v57, (uint64_t)&v65, (uint64_t)v55);
  if (v37)
  {
    uint64_t checksum = v37;
    free(v58);
    krb5_data v58 = 0;
LABEL_45:
    free_GSS_KRB5_FINISHED((uint64_t)&v65);
    goto LABEL_34;
  }
  free_GSS_KRB5_FINISHED((uint64_t)&v65);
  if (v57 == v55[0])
  {
LABEL_47:
    uint64_t checksum = _gsskrb5_create_8003_checksum(a1, (uint64_t)a4, v64, a9, v32, v60, &v57, v61);
    if (checksum) {
      goto LABEL_34;
    }
    uint64_t v38 = *(_krb5_ccache **)(a3 + 104);
    if (v38 && !krb5_cc_get_config(a4, v38, *(krb5_const_principal *)(a3 + 64), "time-offset", &v59))
    {
      if (*(void *)&v59.magic == 4)
      {
        unsigned int v39 = bswap32(*(_DWORD *)v59.data);
        krb5_data_free();
        if (v39)
        {
          krb5_get_kdc_sec_offset();
          krb5_set_kdc_sec_offset();
        }
LABEL_55:
        if ((v32 & 2) != 0)
        {
          int v41 = _krb5_auth_con_setup_pfs();
          if (v41)
          {
            *a1 = v41;
LABEL_68:
            uint64_t checksum = 851968;
            goto LABEL_34;
          }
          uint64_t v40 = a1;
        }
        else
        {
          uint64_t v40 = a1;
        }
        int v42 = _krb5_build_authenticator();
        if (v42)
        {
          int v43 = v42;
          if (v39) {
            krb5_set_kdc_sec_offset();
          }
          int *v40 = v43;
        }
        else
        {
          int v44 = krb5_build_ap_req();
          if (v39) {
            krb5_set_kdc_sec_offset();
          }
          if (!v44)
          {
            if ((v32 & 0x1000) != 0)
            {
              size_t v45 = v63;
              *a11 = v62;
              a11[1] = v45;
            }
            else
            {
              uint64_t checksum = _gsskrb5_encapsulate(v40, (uint64_t)&v62, a11, &word_213D77C53, *(const void ***)(a3 + 32));
              krb5_data_free();
              if (checksum) {
                goto LABEL_34;
              }
            }
            if (v64) {
              krb5_crypto_destroy();
            }
            free_Checksum((uint64_t)v61);
            krb5_data_free();
            krb5_data_free();
            if ((v32 & 2) == 0) {
              return initiator_ready(v40, a3, a4, a12);
            }
            *(void *)(a3 + 88) = wait_repl_mutual;
            return 1;
          }
          int *v40 = v44;
        }
        goto LABEL_68;
      }
      krb5_data_free();
    }
    unsigned int v39 = 0;
    goto LABEL_55;
  }
  uint64_t v46 = (int *)krb5_abortx();
  return wait_repl_mutual(v46, v47, v48, v49, v50, v51, v52, v53, (uint64_t)a9, a10, a11, a12, a13);
}

uint64_t wait_repl_mutual(int *a1, int a2, uint64_t a3, krb5_context a4, int a5, int a6, __int16 a7, int a8, uint64_t a9, unint64_t *a10, void *a11, _DWORD *a12, int *a13)
{
  *(void *)&v26.krb5_magic magic = 0;
  v26.data = 0;
  uint64_t v25 = 0;
  *a11 = 0;
  a11[1] = 0;
  if ((*(unsigned char *)(a3 + 73) & 0x10) != 0)
  {
    uint64_t v18 = (char *)a10[1];
    *(void *)&v26.krb5_magic magic = *a10;
    v26.data = v18;
    krb5_error_code v19 = krb5_rd_rep(a4, *(krb5_auth_context *)(a3 + 40), &v26, &v25);
    if (v19)
    {
      krb5_error_code v20 = v19;
      if (!_gsskrb5_decapsulate(a1, a10, &v26, &word_213D77C50, (uint64_t)&__gss_krb5_mechanism_oid_desc)) {
        return handle_error_packet(a1, a4, a3, *(uint64_t *)&v26.magic, v26.data);
      }
      *a1 = v20;
      return 851968;
    }
    goto LABEL_11;
  }
  uint64_t result = _gsskrb5_decapsulate(a1, a10, &v26, &word_213D77C56, *(void *)(a3 + 32));
  if (!result)
  {
    krb5_error_code v21 = krb5_rd_rep(a4, *(krb5_auth_context *)(a3 + 40), &v26, &v25);
    if (v21)
    {
LABEL_15:
      *a1 = v21;
      return 851968;
    }
LABEL_11:
    krb5_free_ap_rep_enc_part(a4, v25);
    *a1 = 0;
    if (a13)
    {
      uint64_t result = _gsskrb5_lifetime_left(a1, a4, *(void *)(a3 + 120), a13);
      if (result) {
        return result;
      }
    }
    if ((a7 & 0x1000) != 0)
    {
      v23.data = 0;
      *(void *)uint64_t v24 = 0;
      *(void *)&v23.krb5_magic magic = 0;
      krb5_auth_con_getremoteseqnumber(a4, *(krb5_auth_context *)(a3 + 40), v24);
      krb5_auth_con_getlocalseqnumber(a4, *(krb5_auth_context *)(a3 + 40), &v24[1]);
      krb5_auth_con_setlocalseqnumber();
      krb5_error_code v21 = krb5_mk_rep(a4, *(krb5_auth_context *)(a3 + 40), &v23);
      if (v21) {
        goto LABEL_15;
      }
      krb5_auth_con_setlocalseqnumber();
      data = v23.data;
      *a11 = *(void *)&v23.magic;
      a11[1] = data;
    }
    return initiator_ready(a1, a3, a4, a12);
  }
  if (result == 589824)
  {
    uint64_t result = _gsskrb5_decapsulate(a1, a10, &v26, &word_213D77C50, *(void *)(a3 + 32));
    if (!result) {
      return handle_error_packet(a1, a4, a3, *(uint64_t *)&v26.magic, v26.data);
    }
  }
  return result;
}

uint64_t initiator_ready(int *a1, uint64_t a2, krb5_context a3, _DWORD *a4)
{
  uint64_t v8 = *(krb5_creds **)(a2 + 96);
  if (v8)
  {
    krb5_free_creds(a3, v8);
    *(void *)(a2 + 96) = 0;
  }
  if ((*(unsigned char *)(a2 + 76) & 0x10) != 0) {
    krb5_cc_close(a3, *(krb5_ccache *)(a2 + 104));
  }
  krb5_int32 v11 = 0;
  *(void *)(a2 + 104) = 0;
  krb5_auth_con_getremoteseqnumber(a3, *(krb5_auth_context *)(a2 + 40), &v11);
  _gsskrb5i_is_cfx(a3, a2, 0);
  int v9 = _gssapi_msg_order_f(*(_DWORD *)(a2 + 72));
  uint64_t result = _gssapi_msg_order_create(a1, (void *)(a2 + 24), v9, v11, 0);
  if (!result)
  {
    *(void *)(a2 + 88) = step_completed;
    *(_DWORD *)(a2 + 76) |= 2u;
    if (a4) {
      *a4 = *(_DWORD *)(a2 + 72);
    }
  }
  return result;
}

uint64_t handle_error_packet(int *a1, krb5_context a2, uint64_t a3, uint64_t a4, char *a5)
{
  *(void *)&v56.krb5_magic magic = a4;
  v56.data = a5;
  if (*(uint64_t (**)(int, int, int, krb5_context, int, int, int, int, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a3 + 88) != wait_repl_mutual)
  {
    size_t v45 = (_krb5_context *)heim_abort();
    return free_entry(v45);
  }
  int v55 = 0;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  int v8 = krb5_rd_error(a2, &v56, (krb5_error **)&v49);
  if (v8) {
    goto LABEL_15;
  }
  int v8 = krb5_error_from_rd_error();
  _gss_mg_log(1, "gss-krb5: server return KRB-ERROR with error code %d", v9, v10, v11, v12, v13, v14, v8);
  if (v8 == -1765328347)
  {
    if (!*(void *)(a3 + 104)) {
      goto LABEL_14;
    }
LABEL_10:
    int v23 = *(_DWORD *)(a3 + 76);
    if ((v23 & 0x100) == 0)
    {
      uint64_t v24 = *((void *)&v50 + 1);
      uint64_t v25 = v24 - time(0);
      _gss_mg_encode_be_uint32(v25, &v47);
      *(void *)uint64_t creds = 4;
      *(void *)&creds[8] = &v47;
      krb5_cc_set_config(a2, *(krb5_ccache *)(a3 + 104), *(krb5_const_principal *)(a3 + 64), "time-offset", (krb5_data *)creds);
      _gss_mg_log(1, "gss-krb5: time skew of %d", v26, v27, v28, v29, v30, v31, v25);
      *(void *)(a3 + 88) = init_auth_step;
      int v23 = *(_DWORD *)(a3 + 76);
    }
    int v22 = v23 | 0x100;
    goto LABEL_13;
  }
  if (v8 == -1765328343)
  {
    if (*(void *)(a3 + 104))
    {
      int v21 = *(_DWORD *)(a3 + 76);
      if ((v21 & 0x200) == 0)
      {
        memset(creds, 0, sizeof(creds));
        _gss_mg_log(1, "gss-krb5: trying to renew ticket", v15, v16, v17, v18, v19, v20, v46);
        krb5_cc_clear_mcred();
        *(_OWORD *)uint64_t creds = *(_OWORD *)(a3 + 56);
        krb5_cc_remove_cred(a2, *(krb5_ccache *)(a3 + 104), 0, (krb5_creds *)creds);
        *(void *)(a3 + 88) = init_krb5_auth;
        int v21 = *(_DWORD *)(a3 + 76);
      }
      int v22 = v21 | 0x200;
LABEL_13:
      *(_DWORD *)(a3 + 76) = v22;
    }
LABEL_14:
    free_KRB_ERROR((uint64_t)&v49);
LABEL_15:
    if (*(uint64_t (**)(int, int, int, krb5_context, int, int, int, int, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a3 + 88) != wait_repl_mutual) {
      return 0;
    }
    goto LABEL_21;
  }
  if (v8 != -1765328324 || !v55) {
    goto LABEL_14;
  }
  *(void *)uint64_t creds = 0;
  *(void *)&creds[8] = 0;
  _gss_mg_log(1, "gss-krb5: trying to decode a KRB5KRB_ERR_GENERIC", v15, v16, v17, v18, v19, v20, v46);
  if (!decode_KERB_ERROR_DATA(v55[1], *v55, (uint64_t)creds, 0))
  {
    if (*(_DWORD *)creds != 2)
    {
      if (*(_DWORD *)creds == 1)
      {
        if (*(void *)&creds[8] && **(void **)&creds[8] >= 4uLL)
        {
          int v47 = 0;
          _gss_mg_decode_le_uint32(*(_DWORD **)(*(void *)&creds[8] + 8), &v47);
          _gss_mg_log(1, "gss-krb5: got an windows error code: %08x", v39, v40, v41, v42, v43, v44, v47);
        }
      }
      else
      {
        _gss_mg_log(1, "gss-krb5: got an KERB_ERROR_DATA of type %d", v33, v34, v35, v36, v37, v38, creds[0]);
      }
      free_KERB_ERROR_DATA((uint64_t)creds);
      goto LABEL_14;
    }
    free_KERB_ERROR_DATA((uint64_t)creds);
    goto LABEL_10;
  }
  int v8 = -1765328324;
LABEL_21:
  *a1 = v8;
  return 851968;
}

void free_entry(krb5_context a1, void *a2)
{
  uint64_t v4 = (krb5_principal_data *)a2[2];
  if (v4) {
    krb5_free_principal(a1, v4);
  }
  int v5 = (krb5_principal_data *)a2[1];
  if (v5) {
    krb5_free_principal(a1, v5);
  }
  uint64_t v6 = (const char *)a2[4];
  if (v6) {
    krb5_free_error_message(a1, v6);
  }
  a2[4] = 0;
  a2[1] = 0;
  a2[2] = 0;
}

uint64_t step_iakerb_auth_tgs(krb5_error_code *a1, uint64_t a2, uint64_t a3, _krb5_context *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unint64_t *a10, size_t *a11)
{
  uint64_t v35 = 0;
  memset(v36, 0, sizeof(v36));
  uint64_t v34 = 0;
  *a1 = 0;
  krb5_data_zero();
  if (*(void *)(a3 + 248))
  {
    krb5_storage_write();
    uint64_t v14 = _gsskrb5_iakerb_parse_header(a1, a4, a3, a10, v36);
    if (v14) {
      return v14;
    }
  }
  else
  {
    uint64_t v15 = (krb5_error *)krb5_tkt_creds_init();
    if (v15)
    {
      *a1 = (int)v15;
      _gsskrb5_error_token(a1, *(const void ***)(a3 + 32), a4, v15, 0, 0, a11);
      return 851968;
    }
  }
  uint64_t v16 = krb5_tkt_creds_step();
  if (v16)
  {
    int v23 = (krb5_error *)v16;
    _gss_mg_log(1, "gss-iakerb: tkt_creds_step: %d", v17, v18, v19, v20, v21, v22, v16);
LABEL_8:
    _gsskrb5_error_token(a1, *(const void ***)(a3 + 32), a4, v23, 0, 0, a11);
    *a1 = (int)v23;
    return 851968;
  }
  if (!v34)
  {
    _gss_mg_log(1, "gss-iakerb: going to state setup-keys", v17, v18, v19, v20, v21, v22, v33);
    uint64_t creds = krb5_tkt_creds_get_creds();
    if (!creds)
    {
      krb5_tkt_creds_free();
      uint64_t v14 = 0;
      *(void *)(a3 + 248) = 0;
      *(void *)(a3 + 120) = *(void *)(*(void *)(a3 + 96) + 56);
      *(void *)(a3 + 88) = step_setup_keys;
      return v14;
    }
    int v23 = (krb5_error *)creds;
    _gss_mg_log(1, "gss-iakerb: tkt_get_creds: %d", v26, v27, v28, v29, v30, v31, creds);
    goto LABEL_8;
  }
  uint64_t v32 = heim_abort();
  return step_iakerb_auth_as(v32);
}

uint64_t step_iakerb_auth_as(krb5_error_code *a1, uint64_t a2, uint64_t a3, _krb5_context *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unint64_t *a10, size_t *a11)
{
  v43[0] = 0;
  v43[1] = 0;
  uint64_t v41 = 0;
  uint64_t v42 = 0;
  uint64_t v40 = 0;
  int v39 = 0;
  if (*(void *)(a3 + 240))
  {
    krb5_storage_write();
    uint64_t result = _gsskrb5_iakerb_parse_header(a1, a4, a3, a10, v43);
    if (result) {
      return result;
    }
  }
  else
  {
    krb5_error_code persistent = setup_icc(a4, (void *)a3, *(void *)(a3 + 56), (uint64_t)a4, a5, a6, a7, a8);
    if (persistent) {
      goto LABEL_5;
    }
    krb5_data_zero();
  }
  uint64_t inited = krb5_init_creds_step();
  if (inited)
  {
    int v23 = (krb5_error *)inited;
    _gss_mg_log(1, "gss-iakerb: init_creds_step: %d", v17, v18, v19, v20, v21, v22, inited);
    _gsskrb5_error_token(a1, *(const void ***)(a3 + 32), a4, v23, 0, 0, a11);
    *a1 = (int)v23;
    return 851968;
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  *(_OWORD *)int principal = 0u;
  _gss_mg_log(1, "gss-iakerb: going to state auth-tgs", v17, v18, v19, v20, v21, v22, v28);
  uint64_t creds = (krb5_error *)krb5_init_creds_get_creds();
  if (creds)
  {
    *a1 = (int)creds;
    _gsskrb5_error_token(a1, *(const void ***)(a3 + 32), a4, creds, 0, 0, a11);
    return 851968;
  }
  krb5_cc_initialize(a4, *(krb5_ccache *)(a3 + 104), principal[0]);
  krb5_cc_store_cred(a4, *(krb5_ccache *)(a3 + 104), (krb5_creds *)principal);
  uint64_t v25 = *(const char **)(a3 + 264);
  if (v25)
  {
    v29.data = *(char **)(a3 + 264);
    *(void *)&v29.krb5_magic magic = strlen(v25);
    krb5_cc_set_config(a4, *(krb5_ccache *)(a3 + 104), 0, "password", &v29);
  }
  if (*(void *)(a3 + 216))
  {
    *(void *)&v29.krb5_magic magic = 0;
    v29.data = 0;
    krb5_error_code persistent = hx509_cert_get_persistent();
    if (!persistent)
    {
      krb5_cc_set_config(a4, *(krb5_ccache *)(a3 + 104), 0, "certificate-ref", &v29);
      der_free_octet_string();
      goto LABEL_18;
    }
LABEL_5:
    *a1 = persistent;
    return 851968;
  }
LABEL_18:
  if (*(void *)(a3 + 280)) {
    krb5_cc_set_config(a4, *(krb5_ccache *)(a3 + 104), 0, "FriendlyName", (krb5_data *)(a3 + 280));
  }
  if (*(void *)(a3 + 296))
  {
    krb5_data v29 = (krb5_data)xmmword_2641F09C0;
    krb5_cc_set_config(a4, *(krb5_ccache *)(a3 + 104), 0, "lkdc-hostname", (krb5_data *)(a3 + 296));
    krb5_cc_set_config(a4, *(krb5_ccache *)(a3 + 104), 0, "nah-created", &v29);
    krb5_cc_set_config(a4, *(krb5_ccache *)(a3 + 104), 0, "iakerb", &v29);
  }
  uint64_t v27 = *(krb5_principal_data **)(a3 + 56);
  uint64_t v26 = a3 + 56;
  krb5_free_principal(a4, v27);
  krb5_copy_principal(a4, principal[0], (krb5_principal *)v26);
  krb5_free_cred_contents(a4, (krb5_creds *)principal);
  uint64_t result = 0;
  *(void *)(v26 + 32) = step_iakerb_auth_tgs;
  return result;
}

uint64_t setup_icc(_krb5_context *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = (krb5_get_init_creds_opt **)(a2 + 29);
  if (a2[29])
  {
    heim_abort();
    goto LABEL_19;
  }
  if (a2[27]) {
    uint64_t v11 = "yes";
  }
  else {
    uint64_t v11 = "no";
  }
  _gss_mg_log(1, "gss-iakerb: setup_icc: cert: %s passwd: %s", a3, a4, a5, a6, a7, a8, (char)v11);
  uint64_t result = krb5_get_init_creds_opt_alloc(a1, v8);
  if (result) {
    return result;
  }
  krb5_get_init_creds_opt_set_canonicalize((krb5_get_init_creds_opt *)a1, a2[29]);
  if (a2[27])
  {
    uint64_t result = krb5_get_init_creds_opt_set_pkinit();
    if (result) {
      return result;
    }
  }
  uint64_t result = krb5_init_creds_init();
  if (result) {
    return result;
  }
  uint64_t v13 = a2[27];
  if (!a2[33])
  {
    if (v13) {
      goto LABEL_14;
    }
LABEL_19:
    heim_abort();
  }
  if (v13)
  {
LABEL_14:
    uint64_t result = krb5_init_creds_set_pkinit_client_cert();
    if (result) {
      return result;
    }
    if (!a2[33]) {
      return 0;
    }
  }
  uint64_t result = krb5_init_creds_set_password();
  if (!result) {
    return 0;
  }
  return result;
}

uint64_t step_pku2u_auth(int *a1, uint64_t a2, uint64_t a3, _krb5_context *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unint64_t *a10, size_t *a11)
{
  int v20 = 0;
  v19[0] = 0;
  v19[1] = 0;
  v18[0] = 0;
  v18[1] = 0;
  krb5_data_zero();
  if (a10 && *a10)
  {
    krb5_storage_write();
    uint64_t result = _gsskrb5_decapsulate(a1, a10, v19, &word_213D77C59, *(void *)(a3 + 32));
    if (result) {
      return result;
    }
  }
  else
  {
    krb5_data_zero();
  }
  int inited = krb5_init_creds_step();
  if (inited) {
    goto LABEL_7;
  }
  if (v20)
  {
    int creds = _gsskrb5_encapsulate(a1, (uint64_t)v18, a11, &word_213D77C5C, *(const void ***)(a3 + 32));
    if (!creds)
    {
      krb5_storage_write();
      uint64_t result = 1;
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  uint64_t v17 = malloc_type_calloc(1uLL, 0x90uLL, 0x10A0040AAA52FDDuLL);
  *(void *)(a3 + 96) = v17;
  if (!v17)
  {
    int creds = 12;
    goto LABEL_8;
  }
  int creds = krb5_init_creds_get_creds();
  krb5_init_creds_free();
  *(void *)(a3 + 240) = 0;
  if (!creds)
  {
    int inited = krb5_copy_principal(a4, **(krb5_const_principal **)(a3 + 96), (krb5_principal *)(a3 + 56));
    if (inited)
    {
LABEL_7:
      int creds = inited;
      goto LABEL_8;
    }
    uint64_t result = krb5_copy_principal(a4, *(krb5_const_principal *)(*(void *)(a3 + 96) + 8), (krb5_principal *)(a3 + 64));
    int creds = result;
    if (!result)
    {
      *(void *)(a3 + 88) = step_setup_keys;
      goto LABEL_9;
    }
  }
LABEL_8:
  uint64_t result = 851968;
LABEL_9:
  *a1 = creds;
  return result;
}

uint64_t __ApplePrivate__gsskrb5_init(krb5_context *a1)
{
  heim_base_once_f();
  gss_name_t v2 = (_krb5_context *)pthread_getspecific(context_key);
  *a1 = v2;
  if (v2)
  {
    krb5_reload_config();
    return 0;
  }
  else
  {
    uint64_t inited = krb5_init_context(a1);
    if (!inited)
    {
      uint64_t inited = pthread_setspecific(context_key, *a1);
      if (inited)
      {
        heim_release();
        *a1 = 0;
      }
    }
  }
  return inited;
}

uint64_t once_func()
{
  _gsskrb5_kGSSICPassword = heim_string_create();
  _gsskrb5_kGSSICCertificate = heim_string_create();
  _gsskrb5_kGSSICSiteName = heim_string_create();
  _gsskrb5_kGSSICKerberosCacheName = heim_string_create();
  _gsskrb5_kGSSICLKDCHostname = heim_string_create();
  _gsskrb5_kGSSICAppIdentifierACL = heim_string_create();
  _gsskrb5_kGSSICAppleSourceApp = heim_string_create();
  _gsskrb5_kGSSICAppleSourceAppAuditToken = heim_string_create();
  _gsskrb5_kGSSICAppleSourceAppPID = heim_string_create();
  _gsskrb5_kGSSICAppleSourceAppUUID = heim_string_create();
  _gsskrb5_kGSSICAppleSourceAppSigningIdentity = heim_string_create();
  _gsskrb5_kGSSICVerifyCredential = heim_string_create();
  _gsskrb5_kGSSICVerifyCredentialAcceptorName = heim_string_create();
  _gsskrb5_kGSSICCreateNewCredential = heim_string_create();
  _gsskrb5_kGSSICAuthenticationContext = heim_string_create();

  return pthread_key_create((pthread_key_t *)&context_key, (void (__cdecl *)(void *))destroy_context);
}

uint64_t destroy_context(uint64_t result)
{
  if (result) {
    return heim_release();
  }
  return result;
}

uint64_t _gsskrb5_inquire_context(_DWORD *a1, uint64_t a2, krb5_principal_data **a3, krb5_principal_data **a4, int *a5, void *a6, _DWORD *a7, int *a8, int *a9)
{
  if (a3) {
    *a3 = 0;
  }
  if (a4) {
    *a4 = 0;
  }
  krb5_context v22 = 0;
  int v17 = __ApplePrivate__gsskrb5_init(&v22);
  if (v17)
  {
    *a1 = v17;
    return 851968;
  }
  pthread_mutex_lock((pthread_mutex_t *)(a2 + 128));
  if (a3)
  {
    uint64_t v19 = *(const krb5_principal_data **)(a2 + 56);
    if (v19)
    {
      uint64_t v18 = _gsskrb5_duplicate_name(a1, v19, a3);
      if (!v18) {
        goto LABEL_10;
      }
    }
    else
    {
      uint64_t v18 = 2529638933;
    }
LABEL_27:
    _gsskrb5_release_name(0, a3);
    goto LABEL_28;
  }
LABEL_10:
  if (a4)
  {
    int v20 = *(const krb5_principal_data **)(a2 + 64);
    if (!v20)
    {
      uint64_t v18 = 2529638934;
      goto LABEL_26;
    }
    uint64_t v18 = _gsskrb5_duplicate_name(a1, v20, a4);
    if (v18) {
      goto LABEL_26;
    }
  }
  if (!a5 || (uint64_t v18 = _gsskrb5_lifetime_left(a1, v22, *(void *)(a2 + 120), a5), !v18))
  {
    if (a6) {
      *a6 = *(void *)(a2 + 32);
    }
    if (a7) {
      *a7 = *(_DWORD *)(a2 + 72);
    }
    if (a8) {
      *a8 = *(_DWORD *)(a2 + 76) & 1;
    }
    if (a9) {
      *a9 = *(_DWORD *)(a2 + 76) & 2;
    }
    *a1 = 0;
    pthread_mutex_unlock((pthread_mutex_t *)(a2 + 128));
    return 0;
  }
LABEL_26:
  if (a3) {
    goto LABEL_27;
  }
LABEL_28:
  if (a4) {
    _gsskrb5_release_name(0, a4);
  }
  pthread_mutex_unlock((pthread_mutex_t *)(a2 + 128));
  return v18;
}

uint64_t _gsskrb5_inquire_cred_by_mech(krb5_error_code *a1, uint64_t a2, uint64_t a3, krb5_ccache *a4, _DWORD *a5, _DWORD *a6, _DWORD *a7)
{
  uint64_t v13 = 0;
  uint64_t result = _gsskrb5_inquire_cred(a1, a2, a4, (int *)&v13, (int *)&v13 + 1, 0);
  if (!result)
  {
    if (a5)
    {
      if (HIDWORD(v13) >= 2) {
        int v11 = 0;
      }
      else {
        int v11 = v13;
      }
      *a5 = v11;
    }
    if (a6)
    {
      if ((v13 & 0xFFFFFFFD00000000) != 0) {
        int v12 = 0;
      }
      else {
        int v12 = v13;
      }
      *a6 = v12;
    }
    if (a7) {
      *a7 = HIDWORD(v13);
    }
  }
  return result;
}

uint64_t _gsskrb5_inquire_cred_by_oid(OM_uint32 *a1, uint64_t a2, const gss_OID_desc *a3, gss_buffer_set_t *a4)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  member_buffer.value = 0;
  krb5_context context = 0;
  member_buffer.length = 0;
  OM_uint32 v8 = __ApplePrivate__gsskrb5_init(&context);
  if (v8)
  {
    *a1 = v8;
    return 851968;
  }
  if (!gss_oid_equal(a3, &__gss_krb5_copy_ccache_x_oid_desc))
  {
    if (gss_oid_equal(a3, &__gss_c_cred_validate_oid_desc))
    {
      k5_vic_options[0] = 0;
      k5_vic_options[1] = 0;
      krb5_cc_cursor cursor = 0;
      if (!*(void *)(a2 + 40) || !*(void *)a2) {
        return 851968;
      }
      krb5_verify_init_creds_opt_init(k5_vic_options);
      krb5_verify_init_creds_opt_set_ap_req_nofail(k5_vic_options, 1);
      int v12 = (pthread_mutex_t *)(a2 + 48);
      pthread_mutex_lock((pthread_mutex_t *)(a2 + 48));
      int krbtgt = _krb5_get_krbtgt();
      if (krbtgt)
      {
        int inited = krbtgt;
        pthread_mutex_unlock(v12);
        goto LABEL_47;
      }
      int inited = krb5_verify_init_creds(context, (krb5_creds *)cursor, 0, 0, (krb5_ccache *)(a2 + 40), k5_vic_options);
      krb5_free_creds(context, (krb5_creds *)cursor);
      pthread_mutex_unlock(v12);
      if (inited) {
        goto LABEL_47;
      }
      return 0;
    }
    if (gss_oid_equal(a3, &__gss_c_nt_uuid_oid_desc))
    {
      k5_vic_options[0] = 0;
      k5_vic_options[1] = 0;
      uint64_t v15 = (pthread_mutex_t *)(a2 + 48);
      pthread_mutex_lock((pthread_mutex_t *)(a2 + 48));
      if (*(void *)(a2 + 40))
      {
        int inited = krb5_cc_get_uuid();
        pthread_mutex_unlock(v15);
        if (inited) {
          goto LABEL_47;
        }
        uint64_t v16 = (void *)krb5_uuid_to_string();
        if (v16)
        {
          int v17 = v16;
          member_buffer.value = v16;
          member_buffer.length = strlen((const char *)v16);
          OM_uint32 v18 = gss_add_buffer_set_member(a1, &member_buffer, a4);
          free(v17);
          if (v18) {
            _gsskrb5_clear_status();
          }
          return 0;
        }
        int v25 = 12;
LABEL_50:
        *a1 = v25;
        return 851968;
      }
      pthread_mutex_unlock((pthread_mutex_t *)(a2 + 48));
LABEL_49:
      int v25 = 22;
      goto LABEL_50;
    }
    if (gss_oid_equal(a3, &__gss_c_cred_diag_oid_desc))
    {
      __s = 0;
      krb5_cc_cursor cursor = 0;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v45 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      *(_OWORD *)&k5_vic_options[0].flags = 0u;
      *(_OWORD *)uint64_t v40 = 0u;
      if (!*(void *)(a2 + 40))
      {
        int full_name = 22;
        goto LABEL_66;
      }
      int full_name = krb5_cc_get_full_name();
      int v20 = (pthread_mutex_t *)(a2 + 48);
      pthread_mutex_unlock((pthread_mutex_t *)(a2 + 48));
      if (full_name)
      {
LABEL_66:
        *a1 = full_name;
        return 851968;
      }
      member_buffer.value = __s;
      member_buffer.length = strlen(__s);
      OM_uint32 v21 = gss_add_buffer_set_member(a1, &member_buffer, a4);
      free(__s);
      if (v21) {
        _gsskrb5_clear_status();
      }
      if (rtbl_create())
      {
        rtbl_add_column();
        rtbl_add_column();
        rtbl_add_column();
        rtbl_add_column();
        rtbl_set_separator();
        pthread_mutex_lock((pthread_mutex_t *)(a2 + 48));
        int full_name = krb5_cc_start_seq_get(context, *(krb5_ccache *)(a2 + 40), &cursor);
        if (full_name) {
          goto LABEL_44;
        }
        int full_name = krb5_cc_next_cred(context, *(krb5_ccache *)(a2 + 40), &cursor, (krb5_creds *)k5_vic_options);
        if (!full_name)
        {
          do
          {
            if (!krb5_unparse_name(context, *(krb5_const_principal *)&k5_vic_options[1], &__s))
            {
              rtbl_add_column_entry();
              free(__s);
              printable_time(v42);
              rtbl_add_column_entry();
              if (time(0) < *((uint64_t *)&v42 + 1)) {
                printable_time(*((time_t *)&v42 + 1));
              }
              rtbl_add_column_entry();
              if (!krb5_enctype_to_string((krb5_enctype)context, (char *)LODWORD(v40[0]), (size_t)&__s))
              {
                rtbl_add_column_entry();
                free(__s);
              }
            }
            krb5_free_cred_contents(context, (krb5_creds *)k5_vic_options);
            krb5_error_code v22 = krb5_cc_next_cred(context, *(krb5_ccache *)(a2 + 40), &cursor, (krb5_creds *)k5_vic_options);
          }
          while (!v22);
          int full_name = v22;
        }
        krb5_cc_end_seq_get(context, *(krb5_ccache *)(a2 + 40), &cursor);
        if (full_name != -1765328242)
        {
LABEL_44:
          pthread_mutex_unlock(v20);
          rtbl_destroy();
          if (!full_name) {
            return 0;
          }
          goto LABEL_66;
        }
        int v23 = (void *)rtbl_format_str();
        member_buffer.value = v23;
        if (v23)
        {
          member_buffer.length = strlen((const char *)v23);
          OM_uint32 v24 = gss_add_buffer_set_member(a1, &member_buffer, a4);
          free(member_buffer.value);
          if (v24) {
            _gsskrb5_clear_status();
          }
          member_buffer.length = 0;
          member_buffer.value = 0;
          gss_add_buffer_set_member(a1, &member_buffer, a4);
          int full_name = 0;
          goto LABEL_44;
        }
      }
      int full_name = 12;
      goto LABEL_66;
    }
    if (gss_oid_equal(a3, &__gss_c_cred_set_default_oid_desc))
    {
      uint64_t v26 = (pthread_mutex_t *)(a2 + 48);
      pthread_mutex_lock((pthread_mutex_t *)(a2 + 48));
      if (!*(void *)(a2 + 40))
      {
        pthread_mutex_unlock((pthread_mutex_t *)(a2 + 48));
        int inited = 22;
        goto LABEL_47;
      }
      int inited = krb5_cc_switch();
      pthread_mutex_unlock(v26);
      if (inited)
      {
LABEL_47:
        *a1 = inited;
        return 851968;
      }
    }
    else
    {
      if (!gss_oid_equal(a3, &__gss_c_cred_get_default_oid_desc))
      {
        if (!gss_oid_equal(a3, &__gss_c_cred_renew_oid_desc)) {
          goto LABEL_49;
        }
        krb5_cc_cursor cursor = 0;
        *(_OWORD *)&k5_vic_options[0].flags = 0u;
        *(_OWORD *)uint64_t v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        pthread_mutex_lock((pthread_mutex_t *)(a2 + 48));
        krb5_error_code principal = krb5_cc_get_principal(context, *(krb5_ccache *)(a2 + 40), (krb5_principal *)k5_vic_options);
        if (principal)
        {
          OM_uint32 kdc_cred = principal;
          pthread_mutex_unlock((pthread_mutex_t *)(a2 + 48));
        }
        else
        {
          uint64_t realm = krb5_principal_get_realm();
          OM_uint32 credentials = krb5_make_principal();
          if (credentials
            || (OM_uint32 credentials = krb5_get_credentials(context, 1, *(krb5_ccache *)(a2 + 40), (krb5_creds *)k5_vic_options, (krb5_creds **)&cursor)) != 0)
          {
            OM_uint32 kdc_cred = credentials;
            pthread_mutex_unlock((pthread_mutex_t *)(a2 + 48));
            krb5_free_cred_contents(context, (krb5_creds *)k5_vic_options);
          }
          else
          {
            if ((*((_DWORD *)cursor + 34) & 0x100) == 0)
            {
              pthread_mutex_unlock((pthread_mutex_t *)(a2 + 48));
              krb5_free_cred_contents(context, (krb5_creds *)k5_vic_options);
              krb5_free_creds(context, (krb5_creds *)cursor);
              krb5_set_error_message(context, 35224071, "Credential is not renewable", "krbtgt", realm, 0);
              *a1 = 35224071;
              return 851968;
            }
            krb5_free_creds(context, (krb5_creds *)cursor);
            krb5_cc_cursor cursor = 0;
            OM_uint32 kdc_cred = krb5_get_kdc_cred();
            if (!kdc_cred)
            {
              krb5_cc_remove_cred(context, *(krb5_ccache *)(a2 + 40), 0, (krb5_creds *)k5_vic_options);
              OM_uint32 kdc_cred = krb5_cc_store_cred(context, *(krb5_ccache *)(a2 + 40), (krb5_creds *)cursor);
              krb5_free_creds(context, (krb5_creds *)cursor);
            }
            krb5_free_cred_contents(context, (krb5_creds *)k5_vic_options);
            pthread_mutex_unlock((pthread_mutex_t *)(a2 + 48));
            if (!kdc_cred)
            {
              uint64_t v27 = "renewed";
              goto LABEL_56;
            }
          }
        }
        *a1 = kdc_cred;
        return 851968;
      }
      k5_vic_options[0] = 0;
      char v28 = (pthread_mutex_t *)(a2 + 48);
      pthread_mutex_lock((pthread_mutex_t *)(a2 + 48));
      int inited = krb5_cc_get_full_name();
      pthread_mutex_unlock(v28);
      if (inited) {
        goto LABEL_47;
      }
      krb5_data v29 = krb5_cc_default_name(context);
      uint64_t v30 = (void *)k5_vic_options[0];
      if (!v29 || strcmp(*(const char **)k5_vic_options, v29))
      {
        free(v30);
        goto LABEL_49;
      }
      free(v30);
    }
    uint64_t v27 = "default";
LABEL_56:
    member_buffer.length = 7;
    member_buffer.value = v27;
    return gss_add_buffer_set_member(a1, &member_buffer, a4);
  }
  k5_vic_options[0] = 0;
  uint64_t v10 = (pthread_mutex_t *)(a2 + 48);
  pthread_mutex_lock((pthread_mutex_t *)(a2 + 48));
  if (*(void *)(a2 + 40))
  {
    int v11 = krb5_cc_get_full_name();
    pthread_mutex_unlock(v10);
    if (v11)
    {
      uint64_t result = 851968;
    }
    else
    {
      member_buffer.value = (void *)k5_vic_options[0];
      member_buffer.length = strlen(*(const char **)k5_vic_options);
      if (gss_add_buffer_set_member(a1, &member_buffer, a4)) {
        _gsskrb5_clear_status();
      }
      free(*(void **)k5_vic_options);
      int v11 = 0;
      uint64_t result = 0;
    }
  }
  else
  {
    pthread_mutex_unlock((pthread_mutex_t *)(a2 + 48));
    uint64_t result = 851968;
    int v11 = 22;
  }
  *a1 = v11;
  return result;
}

uint64_t printable_time(time_t a1)
{
  time_t v2 = a1;
  ctime(&v2);
  uint64_t result = __strlcpy_chk();
  byte_2678038BC = 0;
  return result;
}

uint64_t _gsskrb5_inquire_cred(krb5_error_code *a1, uint64_t a2, krb5_ccache *a3, int *a4, int *a5, gss_OID_set *a6)
{
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  *a1 = 0;
  if (a3) {
    *a3 = 0;
  }
  if (a6) {
    *a6 = 0;
  }
  krb5_context context = 0;
  krb5_error_code v12 = __ApplePrivate__gsskrb5_init(&context);
  if (v12)
  {
    *a1 = v12;
    return 851968;
  }
  if (a2)
  {
    uint64_t v14 = *(void *)(a2 + 16);
    if (v14) {
      uint64_t v15 = a2;
    }
    else {
      uint64_t v15 = 0;
    }
    if (v14) {
      uint64_t v16 = 0;
    }
    else {
      uint64_t v16 = a2;
    }
    if (*(_DWORD *)(a2 + 32) == 1)
    {
      int v17 = *(krb5_principal_data **)a2;
      if (*(void *)a2)
      {
        krb5_ccache cache = 0;
        krb5_error_code v18 = krb5_cc_cache_match(context, v17, &cache);
        if (v18)
        {
          *a1 = v18;
          return 655360;
        }
        krb5_cc_close(context, cache);
      }
    }
  }
  else
  {
    if (_gsskrb5_acquire_cred(a1, 0, 0xFFFFFFFFLL, 0, 2u, &v29)) {
      uint64_t v15 = 0;
    }
    else {
      uint64_t v15 = v29;
    }
    if (_gsskrb5_acquire_cred(a1, 0, 0xFFFFFFFFLL, 0, 1u, &v30)) {
      uint64_t v16 = 0;
    }
    else {
      uint64_t v16 = v30;
    }
    if (!(v16 | v15))
    {
      *a1 = 0;
      return 458752;
    }
  }
  if (v15) {
    pthread_mutex_lock((pthread_mutex_t *)(v15 + 48));
  }
  if (!v16)
  {
    if (!a3) {
      goto LABEL_45;
    }
    goto LABEL_38;
  }
  pthread_mutex_lock((pthread_mutex_t *)(v16 + 48));
  if (!a3) {
    goto LABEL_45;
  }
  if (!*(void *)v16)
  {
LABEL_38:
    if (v15 && *(_DWORD *)(v15 + 32) == 2)
    {
      krb5_ccache cache = 0;
      krb5_error_code v20 = krb5_sname_to_principal(context, 0, 0, 3, (krb5_principal *)&cache);
      *a1 = v20;
      if (v20)
      {
        empty_gss_OID_set oid_set = 851968;
LABEL_71:
        pthread_mutex_unlock((pthread_mutex_t *)(v15 + 48));
        goto LABEL_72;
      }
      *a3 = cache;
      if (a4) {
        goto LABEL_47;
      }
      goto LABEL_55;
    }
    krb5_ccache cache = 0;
    default_krb5_error_code principal = krb5_get_default_principal();
    *a1 = default_principal;
    if (default_principal)
    {
      empty_gss_OID_set oid_set = 851968;
      goto LABEL_70;
    }
    *a3 = cache;
LABEL_45:
    if (a4)
    {
      if (!v15)
      {
        uint64_t v22 = 0x7FFFFFFFLL;
        if (v16) {
          goto LABEL_48;
        }
        goto LABEL_50;
      }
LABEL_47:
      uint64_t v22 = *(void *)(v15 + 24);
      if (v16)
      {
LABEL_48:
        uint64_t v23 = *(void *)(v16 + 24);
        goto LABEL_51;
      }
LABEL_50:
      uint64_t v23 = 0x7FFFFFFFLL;
LABEL_51:
      if (v22 >= v23) {
        uint64_t v24 = v23;
      }
      else {
        uint64_t v24 = v22;
      }
      empty_gss_OID_set oid_set = _gsskrb5_lifetime_left(a1, context, v24, a4);
      if (empty_oid_set) {
        goto LABEL_70;
      }
    }
LABEL_55:
    if (a5)
    {
      if (!(v15 | v16)) {
        abort();
      }
      if (v16) {
        BOOL v25 = v15 == 0;
      }
      else {
        BOOL v25 = 1;
      }
      if (v25) {
        int v26 = 2;
      }
      else {
        int v26 = 0;
      }
      if (!v15) {
        int v26 = 1;
      }
      *a5 = v26;
    }
    if (!a6
      || (empty_gss_OID_set oid_set = gss_create_empty_oid_set((OM_uint32 *)a1, a6), !empty_oid_set)
      && (empty_gss_OID_set oid_set = gss_add_oid_set_member((OM_uint32 *)a1, &__gss_krb5_mechanism_oid_desc, a6),
          !empty_oid_set))
    {
      empty_gss_OID_set oid_set = 0;
    }
    goto LABEL_70;
  }
  if (!v15 || (uint64_t v19 = *(const krb5_principal_data **)v15) == 0) {
    uint64_t v19 = *(const krb5_principal_data **)v16;
  }
  empty_gss_OID_set oid_set = _gsskrb5_duplicate_name(a1, v19, a3);
  if (!empty_oid_set) {
    goto LABEL_45;
  }
LABEL_70:
  if (v15) {
    goto LABEL_71;
  }
LABEL_72:
  if (v16) {
    pthread_mutex_unlock((pthread_mutex_t *)(v16 + 48));
  }
  if (v30) {
    empty_gss_OID_set oid_set = _gsskrb5_release_cred(a1, &v30);
  }
  if (v29) {
    return _gsskrb5_release_cred(a1, &v29);
  }
  return empty_oid_set;
}

uint64_t _gsskrb5_inquire_mechs_for_name(OM_uint32 *a1, int a2, gss_OID_set *oid_set)
{
  empty_gss_OID_set oid_set = gss_create_empty_oid_set(a1, oid_set);
  if (!empty_oid_set)
  {
    empty_gss_OID_set oid_set = gss_add_oid_set_member(a1, &__gss_krb5_mechanism_oid_desc, oid_set);
    if (empty_oid_set)
    {
      OM_uint32 minor_status = 0;
      gss_release_oid_set(&minor_status, oid_set);
    }
  }
  return empty_oid_set;
}

uint64_t _gsskrb5_inquire_sec_context_by_oid(OM_uint32 *a1, uint64_t a2, const gss_OID_desc *a3, gss_buffer_set_t *a4)
{
  if (a2)
  {
    krb5_context v29 = 0;
    OM_uint32 v8 = __ApplePrivate__gsskrb5_init(&v29);
    if (v8)
    {
      *a1 = v8;
      return 851968;
    }
    if (gss_oid_equal(a3, &__gss_krb5_get_tkt_flags_x_oid_desc))
    {
      uint64_t v10 = (pthread_mutex_t *)(a2 + 128);
      pthread_mutex_lock((pthread_mutex_t *)(a2 + 128));
      int v11 = *(unsigned int **)(a2 + 112);
      if (v11)
      {
        uint64_t v12 = TicketFlags2int(*v11);
        pthread_mutex_unlock(v10);
        _gss_mg_encode_le_uint32(v12, &v31);
        member_buffer.length = 4;
        member_buffer.value = &v31;
        return gss_add_buffer_set_member(a1, &member_buffer, a4);
      }
      else
      {
        pthread_mutex_unlock((pthread_mutex_t *)(a2 + 128));
        _gsskrb5_set_status(22, "No ticket from which to obtain flags", v19, v20, v21, v22, v23, v24, (char)v29);
        *a1 = 22;
        return 0x10000;
      }
    }
    else
    {
      if (!gss_oid_equal(a3, &__gss_c_peer_has_updated_spnego_oid_desc))
      {
        if (gss_oid_equal(a3, &__gss_krb5_get_subkey_x_oid_desc))
        {
          BOOL v25 = v29;
          int v26 = a1;
          uint64_t v27 = (pthread_mutex_t *)a2;
          int v28 = 2;
        }
        else if (gss_oid_equal(a3, &__gss_krb5_get_initiator_subkey_x_oid_desc))
        {
          BOOL v25 = v29;
          int v26 = a1;
          uint64_t v27 = (pthread_mutex_t *)a2;
          int v28 = 1;
        }
        else
        {
          if (!gss_oid_equal(a3, &__gss_krb5_get_acceptor_subkey_x_oid_desc))
          {
            if (gss_oid_equal(a3, &__gss_c_inq_sspi_session_key_oid_desc)) {
              return inquire_sec_context_get_sspi_session_key(a1, (pthread_mutex_t *)a2, v29, a4);
            }
            if (gss_oid_equal(a3, &__gss_krb5_get_authtime_x_oid_desc)) {
              return get_authtime(a1, a2, a4);
            }
            if (gss_oid_equal(a3, &__gss_c_ctx_pfs_x_oid_desc)) {
              return get_pfs_status(a1, a2, a4);
            }
            LODWORD(member_buffer.length) = 0;
            if (oid_prefix_equal((uint64_t)a3, (uint64_t)&__gss_krb5_extract_authz_data_from_sec_context_x_oid_desc, &member_buffer))return inquire_sec_context_authz_data(a1, a2, (uint64_t)v29, member_buffer.length, a4); {
            if (oid_prefix_equal((uint64_t)a3, (uint64_t)&__gss_krb5_export_lucid_context_x_oid_desc, &member_buffer))
            }
            {
              if (LODWORD(member_buffer.length) == 1) {
                return export_lucid_sec_context_v1(a1, a2, v29, a4);
              }
            }
            else if (gss_oid_equal(a3, &__gss_krb5_get_service_keyblock_x_oid_desc))
            {
              return get_service_keyblock(a1, (pthread_mutex_t *)a2, a4);
            }
            *a1 = 0;
            return 851968;
          }
          BOOL v25 = v29;
          int v26 = a1;
          uint64_t v27 = (pthread_mutex_t *)a2;
          int v28 = 0;
        }
        return inquire_sec_context_get_subkey(v26, v27, v25, v28, a4);
      }
      *a1 = 0;
      *a4 = 0;
      uint64_t v13 = (pthread_mutex_t *)(a2 + 128);
      pthread_mutex_lock((pthread_mutex_t *)(a2 + 128));
      if ((*(_DWORD *)(a2 + 76) & 0x40) != 0)
      {
        pthread_mutex_unlock((pthread_mutex_t *)(a2 + 128));
      }
      else
      {
        uint64_t v14 = *(void *)(a2 + 40);
        uint64_t v15 = 48;
        if ((*(_DWORD *)(a2 + 76) & 1) == 0) {
          uint64_t v15 = 40;
        }
        uint64_t v16 = *(int **)(v14 + v15);
        if (!v16)
        {
          pthread_mutex_unlock((pthread_mutex_t *)(a2 + 128));
          return 851968;
        }
        int v17 = *v16;
        int v18 = **(_DWORD **)(v14 + 32);
        pthread_mutex_unlock(v13);
        if (v17 == v18) {
          return 851968;
        }
      }
      return 0;
    }
  }
  else
  {
    *a1 = 22;
    return 0x80000;
  }
}

uint64_t inquire_sec_context_get_subkey(OM_uint32 *a1, pthread_mutex_t *a2, _krb5_context *a3, int a4, gss_buffer_set_t *a5)
{
  v24.value = 0;
  BOOL v25 = 0;
  v24.length = 0;
  krb5_data_zero();
  if (!krb5_storage_emem())
  {
    _gsskrb5_clear_status();
    krb5_data_free();
    int v12 = 12;
LABEL_19:
    *a1 = v12;
    return 851968;
  }
  uint64_t v10 = a2 + 2;
  pthread_mutex_lock(a2 + 2);
  switch(a4)
  {
    case 0:
      int acceptor_subkey = _gsskrb5i_get_acceptor_subkey((uint64_t)a2, a3, &v25);
      goto LABEL_9;
    case 1:
      int acceptor_subkey = _gsskrb5i_get_initiator_subkey((uint64_t)a2, a3, &v25);
LABEL_9:
      int v12 = acceptor_subkey;
      pthread_mutex_unlock(v10);
      if (v12) {
        goto LABEL_17;
      }
      goto LABEL_12;
    case 2:
      int acceptor_subkey = _gsskrb5i_get_token_key((uint64_t)a2, a3, &v25);
      goto LABEL_9;
  }
  pthread_mutex_unlock(a2 + 2);
LABEL_12:
  if (v25)
  {
    gss_buffer_desc_struct v19 = *(gss_buffer_desc_struct *)&v25->magic;
    contents = v25->contents;
    member_gss_buffer_desc_struct buffer = v19;
    int v12 = krb5_store_keyblock();
    krb5_free_keyblock(a3, v25);
    if (!v12)
    {
      int v12 = krb5_storage_to_data();
      if (!v12)
      {
        member_gss_buffer_desc_struct buffer = v24;
        uint64_t v20 = gss_add_buffer_set_member(a1, &member_buffer, a5);
        goto LABEL_18;
      }
    }
  }
  else
  {
    int v12 = 22;
    _gsskrb5_set_status(22, "have no subkey of type %d", v13, v14, v15, v16, v17, v18, a4);
  }
LABEL_17:
  uint64_t v20 = 0;
LABEL_18:
  krb5_data_free();
  krb5_storage_free();
  if (v12) {
    goto LABEL_19;
  }
  return v20;
}

uint64_t inquire_sec_context_get_sspi_session_key(OM_uint32 *a1, pthread_mutex_t *a2, _krb5_context *a3, gss_buffer_set_t *a4)
{
  uint64_t v14 = 0;
  OM_uint32 v8 = a2 + 2;
  pthread_mutex_lock(a2 + 2);
  int token_key = _gsskrb5i_get_token_key((uint64_t)a2, a3, &v14);
  pthread_mutex_unlock(v8);
  if (!token_key)
  {
    if (v14)
    {
      contents = v14->contents;
      member_buffer.length = *(void *)&v14->length;
      member_buffer.value = contents;
      uint64_t v10 = gss_add_buffer_set_member(a1, &member_buffer, a4);
      krb5_free_keyblock(a3, v14);
      return v10;
    }
    int token_key = 22;
  }
  *a1 = token_key;
  return 851968;
}

uint64_t get_authtime(OM_uint32 *a1, uint64_t a2, gss_buffer_set_t *a3)
{
  uint64_t v6 = (pthread_mutex_t *)(a2 + 128);
  pthread_mutex_lock((pthread_mutex_t *)(a2 + 128));
  uint64_t v7 = *(void *)(a2 + 112);
  if (v7)
  {
    uint64_t v8 = *(unsigned int *)(v7 + 88);
    pthread_mutex_unlock(v6);
    _gss_mg_encode_le_uint32(v8, &v17);
    member_buffer.length = 4;
    member_buffer.value = &v17;
    return gss_add_buffer_set_member(a1, &member_buffer, a3);
  }
  else
  {
    pthread_mutex_unlock(v6);
    _gsskrb5_set_status(22, "No ticket to obtain auth time from", v10, v11, v12, v13, v14, v15, v16);
    *a1 = 22;
    return 851968;
  }
}

uint64_t get_pfs_status(OM_uint32 *a1, uint64_t a2, gss_buffer_set_t *a3)
{
  uint64_t v6 = (pthread_mutex_t *)(a2 + 128);
  pthread_mutex_lock((pthread_mutex_t *)(a2 + 128));
  uint64_t v7 = *(int **)(a2 + 40);
  if (v7)
  {
    int v8 = *v7;
    pthread_mutex_unlock(v6);
    if ((v8 & 0x100) != 0)
    {
      _gss_mg_encode_le_uint32(1, &v17);
      member_buffer.length = 4;
      member_buffer.value = &v17;
      return gss_add_buffer_set_member(a1, &member_buffer, a3);
    }
  }
  else
  {
    pthread_mutex_unlock(v6);
  }
  _gsskrb5_set_status(22, "No auth_context or PFS", v9, v10, v11, v12, v13, v14, v16);
  *a1 = 22;
  return 851968;
}

uint64_t oid_prefix_equal(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  *a3 = 0;
  if (!der_get_oid())
  {
    if (!der_get_oid()) {
      der_free_oid();
    }
    der_free_oid();
  }
  return 0;
}

uint64_t inquire_sec_context_authz_data(OM_uint32 *a1, uint64_t a2, uint64_t a3, int a4, gss_buffer_set_t *a5)
{
  *a1 = 0;
  *a5 = 0;
  uint64_t v9 = (pthread_mutex_t *)(a2 + 128);
  pthread_mutex_lock((pthread_mutex_t *)(a2 + 128));
  if (!*(void *)(a2 + 112))
  {
    pthread_mutex_unlock(v9);
    *a1 = 22;
    char v16 = "No ticket to obtain authz data from";
    krb5_error_code v17 = 22;
    goto LABEL_8;
  }
  if (a4 == 128 && (*(unsigned char *)(a2 + 76) & 0x80) == 0)
  {
    pthread_mutex_unlock(v9);
    *a1 = 22;
    char v16 = "pac not valid";
    krb5_error_code v17 = -1980176556;
LABEL_8:
    _gsskrb5_set_status(v17, v16, v10, v11, v12, v13, v14, v15, v21.length);
    return 0x80000;
  }
  v22.length = 0;
  v22.value = 0;
  OM_uint32 authorization_data_type = krb5_ticket_get_authorization_data_type();
  pthread_mutex_unlock(v9);
  if (authorization_data_type)
  {
    *a1 = authorization_data_type;
    return 851968;
  }
  else
  {
    gss_buffer_desc_struct v21 = v22;
    uint64_t v19 = gss_add_buffer_set_member(a1, &v21, a5);
    krb5_data_free();
  }
  return v19;
}

uint64_t export_lucid_sec_context_v1(OM_uint32 *a1, uint64_t a2, _krb5_context *a3, gss_buffer_set_t *a4)
{
  gss_buffer_desc_struct v22 = 0;
  krb5_int32 v21 = 0;
  gss_buffer_desc_struct v20 = (gss_buffer_desc_struct)0;
  int v8 = (pthread_mutex_t *)(a2 + 128);
  *a1 = 0;
  pthread_mutex_lock((pthread_mutex_t *)(a2 + 128));
  int v9 = *(_DWORD *)(a2 + 76);
  uint64_t v10 = krb5_storage_emem();
  if (!v10)
  {
    _gsskrb5_clear_status();
    int token_key = 12;
    goto LABEL_14;
  }
  int token_key = krb5_store_int32();
  if (!token_key)
  {
    int token_key = krb5_store_int32();
    if (!token_key)
    {
      int token_key = krb5_store_int32();
      if (!token_key)
      {
        krb5_auth_con_getlocalseqnumber(a3, *(krb5_auth_context *)(a2 + 40), &v21);
        int token_key = krb5_store_int32();
        if (!token_key)
        {
          int token_key = krb5_store_int32();
          if (!token_key)
          {
            krb5_auth_con_getremoteseqnumber(a3, *(krb5_auth_context *)(a2 + 40), &v21);
            int token_key = krb5_store_int32();
            if (!token_key)
            {
              int token_key = krb5_store_int32();
              if (!token_key)
              {
                int v12 = v9 & 0x40;
                int token_key = krb5_store_int32();
                if (!token_key)
                {
                  int token_key = _gsskrb5i_get_token_key(a2, a3, &v22);
                  if (!token_key)
                  {
                    if (v12)
                    {
                      int v15 = *(_DWORD *)(a2 + 8);
                      int token_key = krb5_store_int32();
                      if (token_key) {
                        goto LABEL_14;
                      }
                      gss_buffer_desc_struct v16 = *(gss_buffer_desc_struct *)&v22->magic;
                      contents = v22->contents;
                      gss_buffer_desc_struct v18 = v16;
                      int token_key = krb5_store_keyblock();
                      if (token_key) {
                        goto LABEL_14;
                      }
                      if ((v15 & 4) == 0) {
                        goto LABEL_29;
                      }
                    }
                    else
                    {
                      int token_key = krb5_store_int32();
                      if (token_key) {
                        goto LABEL_14;
                      }
                      int token_key = krb5_store_int32();
                      if (token_key) {
                        goto LABEL_14;
                      }
                    }
                    gss_buffer_desc_struct v17 = *(gss_buffer_desc_struct *)&v22->magic;
                    contents = v22->contents;
                    gss_buffer_desc_struct v18 = v17;
                    int token_key = krb5_store_keyblock();
                    if (token_key) {
                      goto LABEL_14;
                    }
LABEL_29:
                    int token_key = krb5_storage_to_data();
                    if (!token_key)
                    {
                      gss_buffer_desc_struct v18 = v20;
                      int token_key = gss_add_buffer_set_member(a1, &v18, a4);
                      krb5_data_free();
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_14:
  if (v22) {
    krb5_free_keyblock(a3, v22);
  }
  if (v10) {
    krb5_storage_free();
  }
  if (token_key)
  {
    *a1 = token_key;
    uint64_t v13 = 851968;
  }
  else
  {
    uint64_t v13 = 0;
  }
  pthread_mutex_unlock(v8);
  return v13;
}

uint64_t get_service_keyblock(OM_uint32 *a1, pthread_mutex_t *a2, gss_buffer_set_t *a3)
{
  if (!krb5_storage_emem())
  {
    _gsskrb5_clear_status();
    int v9 = 12;
LABEL_10:
    *a1 = v9;
    return 851968;
  }
  uint64_t v6 = a2 + 2;
  pthread_mutex_lock(a2 + 2);
  if (!a2[3].__sig)
  {
    pthread_mutex_unlock(a2 + 2);
    krb5_storage_free();
    int v9 = 22;
    _gsskrb5_set_status(22, "No service keyblock on gssapi context", v11, v12, v13, v14, v15, v16, v18.length);
    goto LABEL_10;
  }
  gss_buffer_desc_struct v20 = (gss_buffer_desc_struct)0;
  krb5_data_zero();
  sig = (gss_buffer_desc_struct *)a2[3].__sig;
  gss_buffer_desc_struct v8 = *sig;
  size_t length = sig[1].length;
  gss_buffer_desc_struct v18 = v8;
  int v9 = krb5_store_keyblock();
  pthread_mutex_unlock(v6);
  if (v9 || (int v9 = krb5_storage_to_data()) != 0)
  {
    uint64_t v10 = 0;
  }
  else
  {
    gss_buffer_desc_struct v18 = v20;
    uint64_t v10 = gss_add_buffer_set_member(a1, &v18, a3);
  }
  krb5_data_free();
  krb5_storage_free();
  if (v9) {
    goto LABEL_10;
  }
  return v10;
}

uint64_t _gsskrb5_pseudo_random(_DWORD *a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, gss_buffer_desc_struct *a6)
{
  long long v41 = 0;
  if (!a2)
  {
    *a1 = 0;
    return 0x80000;
  }
  size_t v7 = a5;
  if (a5 >= 1 && *(void *)a4 < 0xFFFFFFFFFFFFFFFCLL)
  {
    uint64_t v47 = 0;
    krb5_context v48 = 0;
    size_t v43 = 0;
    long long v44 = 0;
    OM_uint32 minor_status = 0;
    int v13 = __ApplePrivate__gsskrb5_init(&v48);
    if (v13)
    {
      *a1 = v13;
      return 851968;
    }
    if (a3 == 1)
    {
      _gsskrb5i_get_initiator_subkey(a2, v48, &v41);
    }
    else
    {
      if (a3)
      {
        krb5_int32 v21 = "unknown kerberos prf_key";
LABEL_17:
        _gsskrb5_set_status(22, v21, v14, v15, v16, v17, v18, v19, (char)v41);
        *a1 = 22;
        return 851968;
      }
      _gsskrb5i_get_acceptor_subkey(a2, v48, &v41);
    }
    if (v41)
    {
      int v20 = krb5_crypto_init();
      krb5_free_keyblock(v48, v41);
      if (v20)
      {
        *a1 = v20;
      }
      else
      {
        gss_buffer_desc_struct v22 = malloc_type_malloc(v7, 0x5B52FBAFuLL);
        a6->value = v22;
        if (v22)
        {
          a6->size_t length = v7;
          krb5_context v29 = (pthread_mutex_t *)(a2 + 128);
          pthread_mutex_lock(v29);
          size_t v45 = *(void *)a4 + 4;
          uint64_t v30 = (char *)malloc_type_malloc(v45, 0xB59FB0BEuLL);
          long long v46 = v30;
          if (v30)
          {
            memcpy(v30 + 4, *(const void **)(a4 + 8), *(void *)a4);
            uint64_t v37 = 0;
            value = (char *)a6->value;
            while (1)
            {
              _gss_mg_encode_be_uint32(v37, v46);
              int v39 = krb5_crypto_prf();
              if (v39) {
                break;
              }
              if (v7 >= v43) {
                size_t v40 = v43;
              }
              else {
                size_t v40 = v7;
              }
              memcpy(value, v44, v40);
              value += v40;
              v7 -= v40;
              krb5_data_free();
              uint64_t v37 = (v37 + 1);
              if (!v7)
              {
                free(v46);
                krb5_crypto_destroy();
                pthread_mutex_unlock(v29);
                return 0;
              }
            }
            *a1 = v39;
            free(v46);
          }
          else
          {
            _gsskrb5_set_status(35224200, "Out of memory", v31, v32, v33, v34, v35, v36, (char)v41);
            *a1 = 35224200;
          }
          gss_release_buffer(&minor_status, a6);
          krb5_crypto_destroy();
          pthread_mutex_unlock(v29);
        }
        else
        {
          _gsskrb5_set_status(35224200, "Out of memory", v23, v24, v25, v26, v27, v28, (char)v41);
          *a1 = 35224200;
          krb5_crypto_destroy();
        }
      }
      return 851968;
    }
    krb5_int32 v21 = "no prf_key found";
    goto LABEL_17;
  }
  *a1 = 0;
  return 851968;
}

uint64_t _gsskrb5_process_context_token(_DWORD *a1)
{
  *a1 = 0;
  return 0x100000;
}

uint64_t _gsskrb5_release_buffer(_DWORD *a1, uint64_t a2)
{
  *a1 = 0;
  free(*(void **)(a2 + 8));
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  return 0;
}

uint64_t _gsskrb5_release_cred(_DWORD *a1, uint64_t *a2)
{
  *a1 = 0;
  uint64_t v2 = *a2;
  if (*a2)
  {
    krb5_context context = 0;
    *a2 = 0;
    int v4 = __ApplePrivate__gsskrb5_init(&context);
    if (v4)
    {
      *a1 = v4;
      return 851968;
    }
    pthread_mutex_lock((pthread_mutex_t *)(v2 + 48));
    if (*(void *)v2) {
      krb5_free_principal(context, *(krb5_principal *)v2);
    }
    uint64_t v6 = *(_krb5_kt **)(v2 + 16);
    if (v6) {
      krb5_kt_close(context, v6);
    }
    size_t v7 = *(_krb5_ccache **)(v2 + 40);
    if (v7)
    {
      if (*(unsigned char *)(v2 + 8)) {
        krb5_cc_destroy(context, v7);
      }
      else {
        krb5_cc_close(context, v7);
      }
    }
    gss_buffer_desc_struct v8 = *(void **)(v2 + 112);
    if (v8) {
      free(v8);
    }
    if (*(void *)(v2 + 120)) {
      heim_release();
    }
    int v9 = *(void **)(v2 + 128);
    if (v9)
    {
      size_t v10 = strlen(*(const char **)(v2 + 128));
      bzero(v9, v10);
      free(*(void **)(v2 + 128));
    }
    pthread_mutex_unlock((pthread_mutex_t *)(v2 + 48));
    pthread_mutex_destroy((pthread_mutex_t *)(v2 + 48));
    *(_OWORD *)uint64_t v2 = 0u;
    *(_OWORD *)(v2 + 16) = 0u;
    *(_OWORD *)(v2 + 32) = 0u;
    *(_OWORD *)(v2 + 48) = 0u;
    *(_OWORD *)(v2 + 64) = 0u;
    *(_OWORD *)(v2 + 80) = 0u;
    *(_OWORD *)(v2 + 96) = 0u;
    *(_OWORD *)(v2 + 112) = 0u;
    *(void *)(v2 + 128) = 0;
    free((void *)v2);
  }
  return 0;
}

uint64_t _gsskrb5_release_name(_DWORD *a1, krb5_principal_data **a2)
{
  krb5_context v7 = 0;
  int v4 = *a2;
  *a1 = 0;
  int v5 = __ApplePrivate__gsskrb5_init(&v7);
  if (v5)
  {
    *a1 = v5;
    return 851968;
  }
  else
  {
    *a2 = 0;
    krb5_free_principal(v7, v4);
    return 0;
  }
}

uint64_t _gssapi_msg_order_create(int *a1, void *a2, int a3, int a4, unsigned int a5)
{
  if (a5) {
    unsigned int v9 = a5;
  }
  else {
    unsigned int v9 = 20;
  }
  size_t v10 = malloc_type_calloc(1uLL, 4 * v9 + 20, 0xCA1ABE58uLL);
  *a2 = v10;
  if (v10) {
    int v11 = 0;
  }
  else {
    int v11 = 12;
  }
  *a1 = v11;
  if (!v10) {
    return 851968;
  }
  uint64_t v12 = v10;
  uint64_t result = 0;
  *uint64_t v12 = a3;
  v12[2] = 0;
  v12[3] = v9;
  v12[4] = a4;
  v12[5] = a4 - 1;
  *a1 = 0;
  return result;
}

uint64_t _gssapi_msg_order_destroy(void **a1)
{
  *a1 = 0;
  return 0;
}

uint64_t _gssapi_msg_order_check(uint64_t result, unsigned int a2)
{
  if (result)
  {
    int v2 = *(_DWORD *)result & 0xC;
    if (!v2) {
      return 0;
    }
    unsigned int v3 = *(_DWORD *)(result + 20);
    if (v3 == a2 - 1)
    {
      elem_insert((unsigned int *)result, 0, a2);
      return 0;
    }
    if (v3 >= a2 && *(_DWORD *)(result + 16) <= a2 && (int v4 = *(_DWORD *)(result + 8)) != 0)
    {
      uint64_t v5 = (v4 - 1);
      unsigned int v6 = *(_DWORD *)(result + 4 * v5 + 20);
      if (v6 <= a2)
      {
        if (v6 == a2)
        {
          return 2;
        }
        else
        {
          uint64_t v8 = 0;
          while (v5 != v8)
          {
            uint64_t v9 = result + 4 * v8;
            unsigned int v10 = *(_DWORD *)(v9 + 20);
            if (v10 == a2) {
              return 2;
            }
            ++v8;
            unsigned int v11 = *(_DWORD *)(v9 + 24);
            if (v10 < a2 && v11 < a2)
            {
              BOOL v13 = v2 != 4;
              elem_insert((unsigned int *)result, v8 - 1, a2);
              return (8 * v13);
            }
          }
          return 851968;
        }
      }
      else if (v2 == 4)
      {
        return 4;
      }
      else
      {
        return 8;
      }
    }
    else
    {
      BOOL v7 = v2 != 4;
      elem_insert((unsigned int *)result, 0, a2);
      return (16 * v7);
    }
  }
  return result;
}

unsigned int *elem_insert(unsigned int *result, unint64_t a2, unsigned int a3)
{
  unint64_t v3 = result[3];
  if (v3 <= a2) {
    elem_insert_cold_1();
  }
  unsigned int v6 = result;
  unint64_t v7 = result[2];
  if (v7 > a2)
  {
    uint64_t result = (unsigned int *)memmove(&result[a2 + 6], &result[a2 + 5], 4 * (v7 + ~a2));
    LODWORD(v7) = v6[2];
    unint64_t v3 = v6[3];
  }
  v6[a2 % v3 + 5] = a3;
  if (v7 < v3) {
    v6[2] = v7 + 1;
  }
  return result;
}

uint64_t _gssapi_msg_order_f(char a1)
{
  return a1 & 0xC;
}

uint64_t _gssapi_msg_order_export(uint64_t a1, uint64_t a2)
{
  uint64_t result = krb5_store_int32();
  if (!result)
  {
    uint64_t result = krb5_store_int32();
    if (!result)
    {
      uint64_t result = krb5_store_int32();
      if (!result)
      {
        uint64_t result = krb5_store_int32();
        if (!result)
        {
          uint64_t result = krb5_store_int32();
          if (!result)
          {
            if (*(_DWORD *)(a2 + 12))
            {
              unint64_t v4 = 0;
              do
              {
                uint64_t result = krb5_store_int32();
                if (result) {
                  break;
                }
                ++v4;
              }
              while (v4 < *(unsigned int *)(a2 + 12));
            }
            else
            {
              return 0;
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t _gssapi_msg_order_import(int *a1, uint64_t a2, void **a3)
{
  int v5 = krb5_ret_int32();
  if (v5
    || (int v5 = krb5_ret_int32()) != 0
    || (int v5 = krb5_ret_int32()) != 0
    || (int v5 = krb5_ret_int32()) != 0
    || (int v5 = krb5_ret_int32()) != 0)
  {
    free(*a3);
    *a3 = 0;
    uint64_t result = 851968;
    if (!a1) {
      return result;
    }
  }
  else
  {
    unint64_t v7 = malloc_type_calloc(1uLL, 0x14uLL, 0xCA1ABE58uLL);
    *a3 = v7;
    if (v7) {
      int v8 = 0;
    }
    else {
      int v8 = 12;
    }
    *a1 = v8;
    if (!v7) {
      return 851968;
    }
    *unint64_t v7 = 0;
    v7[1] = 0;
    void v7[2] = 0;
    v7[3] = 0;
    v7[4] = 0;
    int v5 = 0;
    uint64_t result = 0;
  }
  *a1 = v5;
  return result;
}

uint64_t _gsskrb5_set_cred_option(int *a1, uint64_t *a2, const gss_OID_desc *a3, unint64_t *a4)
{
  krb5_context v26 = 0;
  int v8 = __ApplePrivate__gsskrb5_init(&v26);
  if (v8)
  {
    *a1 = v8;
    return 851968;
  }
  if (!a4)
  {
LABEL_28:
    int v15 = 22;
LABEL_29:
    *a1 = v15;
    return 851968;
  }
  if (gss_oid_equal(a3, &__gss_krb5_import_cred_x_oid_desc))
  {
    uint64_t v9 = v26;
    krb5_keytab keytab = 0;
    krb5_principal v30 = 0;
    krb5_ccache cache = 0;
    if (a2 && !*a2 && krb5_storage_from_mem())
    {
      uint64_t v27 = 0;
      int v10 = krb5_ret_string();
      if (!v10)
      {
        uint64_t v17 = v27;
        if (*v27)
        {
          int v10 = krb5_cc_resolve(v9, v27, &cache);
          if (v10) {
            goto LABEL_9;
          }
          uint64_t v17 = v27;
        }
        free(v17);
        uint64_t v27 = 0;
        int v10 = krb5_ret_string();
        if (!v10)
        {
          uint64_t v18 = v27;
          if (*v27)
          {
            int v10 = krb5_parse_name(v9, v27, &v30);
            if (v10) {
              goto LABEL_9;
            }
            uint64_t v18 = v27;
          }
          free(v18);
          uint64_t v27 = 0;
          int v10 = krb5_ret_string();
          if (!v10)
          {
            uint64_t v19 = v27;
            if (*v27)
            {
              int v10 = krb5_kt_resolve(v9, v27, &keytab);
              if (v10) {
                goto LABEL_9;
              }
              uint64_t v19 = v27;
            }
            free(v19);
            uint64_t v27 = 0;
            uint64_t v11 = _gsskrb5_krb5_import_cred(a1, cache, v30, (uint64_t)keytab, a2);
            goto LABEL_10;
          }
        }
      }
LABEL_9:
      *a1 = v10;
      uint64_t v11 = 851968;
LABEL_10:
      if (cache) {
        krb5_cc_close(v9, cache);
      }
      if (v30) {
        krb5_free_principal(v9, v30);
      }
      if (keytab) {
        krb5_kt_close(v9, keytab);
      }
      if (v27) {
        free(v27);
      }
      krb5_storage_free();
      return v11;
    }
LABEL_23:
    *a1 = 0;
    return 851968;
  }
  if (!gss_oid_equal(a3, &__gss_krb5_set_allowable_enctypes_x_oid_desc))
  {
    if (gss_oid_equal(a3, &__gss_krb5_cred_no_ci_flags_x_oid_desc))
    {
      if (a2 && (uint64_t v14 = *a2) != 0)
      {
        uint64_t v11 = 0;
        *(_DWORD *)(v14 + 8) |= 2u;
      }
      else
      {
        uint64_t v11 = 851968;
      }
      *a1 = 0;
      return v11;
    }
    goto LABEL_28;
  }
  if (!a2) {
    goto LABEL_23;
  }
  uint64_t v12 = *a2;
  if (!*a2) {
    goto LABEL_23;
  }
  unint64_t v13 = *a4;
  if ((*a4 & 3) != 0) {
    goto LABEL_23;
  }
  int v20 = malloc_type_malloc((v13 & 0xFFFFFFFFFFFFFFFCLL) + 4, 0x29E6E4uLL);
  if (!v20)
  {
    int v15 = 12;
    goto LABEL_29;
  }
  krb5_int32 v21 = v20;
  if (!krb5_storage_from_mem())
  {
    *a1 = 12;
LABEL_63:
    free(v21);
    return 851968;
  }
  if (v13 >= 4)
  {
    uint64_t v22 = 0;
    if (v13 >> 2 <= 1) {
      uint64_t v23 = 1;
    }
    else {
      uint64_t v23 = v13 >> 2;
    }
    while (1)
    {
      LODWORD(v30) = 0;
      int v24 = krb5_ret_uint32();
      if (v24) {
        break;
      }
      if (!krb5_enctype_valid()) {
        *((_DWORD *)v21 + v22++) = v30;
      }
      if (!--v23) {
        goto LABEL_59;
      }
    }
    *a1 = v24;
    krb5_storage_free();
    goto LABEL_63;
  }
  uint64_t v22 = 0;
LABEL_59:
  *((_DWORD *)v21 + v22) = 0;
  uint64_t v25 = *(void **)(v12 + 112);
  if (v25) {
    free(v25);
  }
  *(void *)(v12 + 112) = v21;
  krb5_storage_free();
  return 0;
}

uint64_t _gsskrb5_set_sec_context_option(krb5_error_code *a1, uint64_t *a2, const gss_OID_desc *a3, void *a4)
{
  krb5_context v24 = 0;
  krb5_error_code v8 = __ApplePrivate__gsskrb5_init(&v24);
  if (v8)
  {
    *a1 = v8;
    return 851968;
  }
  if (!a4) {
    goto LABEL_40;
  }
  if (gss_oid_equal(a3, &__gss_krb5_compat_des3_mic_x_oid_desc))
  {
    uint64_t v9 = *a2;
    if (!*a2)
    {
      *a1 = 22;
      return 0x80000;
    }
    int v10 = (unsigned __int8 *)a4[1];
    if (v10 && *a4 == 1)
    {
      BOOL v11 = *v10 != 0;
      pthread_mutex_lock((pthread_mutex_t *)(v9 + 128));
      *(_DWORD *)(v9 + 76) = *(_DWORD *)(v9 + 76) & 0xFFFFFFF3 | (4 * v11) | 8;
      pthread_mutex_unlock((pthread_mutex_t *)(v9 + 128));
      return 0;
    }
    goto LABEL_40;
  }
  if (gss_oid_equal(a3, &__gss_krb5_set_dns_canonicalize_x_oid_desc))
  {
    if (a4[1] && *a4 == 1)
    {
      krb5_set_dns_canonicalize_hostname();
      return 0;
    }
LABEL_40:
    *a1 = 22;
    return 851968;
  }
  if (gss_oid_equal(a3, &__gss_krb5_register_acceptor_identity_x_oid_desc))
  {
    *(void *)uint64_t v23 = 0;
    uint64_t string = get_string(a1, (uint64_t)a4, v23);
    if (!string)
    {
      unint64_t v13 = *(char **)v23;
      uint64_t string = _gsskrb5_register_acceptor_identity(a1, *(const char **)v23);
      free(v13);
    }
    return string;
  }
  if (gss_oid_equal(a3, &__gss_krb5_set_default_realm_x_oid_desc))
  {
    *(void *)uint64_t v23 = 0;
    uint64_t string = get_string(a1, (uint64_t)a4, v23);
    if (string) {
      return string;
    }
    uint64_t v14 = *(char **)v23;
    if (*(void *)v23)
    {
      krb5_set_default_realm(v24, *(const char **)v23);
      free(v14);
      uint64_t string = 0;
    }
    else
    {
      uint64_t string = 0x1000000;
    }
LABEL_33:
    *a1 = 0;
    return string;
  }
  if (gss_oid_equal(a3, &__gss_krb5_ccache_name_x_oid_desc))
  {
    *(void *)uint64_t v23 = 0;
    uint64_t string = get_string(a1, (uint64_t)a4, v23);
    if (!string)
    {
      int v15 = *(char **)v23;
      krb5_error_code v16 = krb5_cc_set_default_name(v24, *(const char **)v23);
      *a1 = v16;
      if (v15)
      {
        free(v15);
        krb5_error_code v16 = *a1;
      }
      if (v16) {
        return 851968;
      }
      else {
        return 0;
      }
    }
  }
  else
  {
    if (gss_oid_equal(a3, &__gss_krb5_set_time_offset_x_oid_desc))
    {
      v23[0] = 0;
      uint64_t string = get_int32(a1, (uint64_t)a4, v23);
      if (string) {
        return string;
      }
      int v17 = time(0);
      krb5_set_real_time(v24, v17 + v23[0], 0);
      goto LABEL_33;
    }
    if (gss_oid_equal(a3, &__gss_krb5_get_time_offset_x_oid_desc))
    {
      *(void *)uint64_t v23 = 0;
      krb5_int32 v22 = 0;
      int v18 = time(0);
      krb5_us_timeofday(v24, v23, &v22);
      krb5_timestamp v19 = v23[0];
      *a1 = 0;
      if (*a4 != 4) {
        return 0x100000;
      }
      uint64_t string = 0;
      *(_DWORD *)a4[1] = v19 - v18;
      goto LABEL_33;
    }
    if (!gss_oid_equal(a3, &__gss_krb5_plugin_register_x_oid_desc)) {
      goto LABEL_40;
    }
    if (*a4 == 24)
    {
      krb5_plugin_register_module();
      int v20 = 0;
      uint64_t string = 0;
    }
    else
    {
      uint64_t string = 851968;
      int v20 = 22;
    }
    *a1 = v20;
  }
  return string;
}

uint64_t get_string(_DWORD *a1, uint64_t a2, void *a3)
{
  if (*(void *)a2)
  {
    unsigned int v6 = malloc_type_malloc(*(void *)a2 + 1, 0x3696FD13uLL);
    *a3 = v6;
    if (v6)
    {
      memcpy(v6, *(const void **)(a2 + 8), *(void *)a2);
      uint64_t result = 0;
      *(unsigned char *)(*a3 + *(void *)a2) = 0;
    }
    else
    {
      *a1 = 0;
      return 0x100000;
    }
  }
  else
  {
    uint64_t result = 0;
    *a3 = 0;
  }
  return result;
}

uint64_t get_int32(_DWORD *a1, uint64_t a2, _DWORD *a3)
{
  *a1 = 0;
  if (*(void *)a2 == 4)
  {
    uint64_t result = 0;
    *a3 = **(_DWORD **)(a2 + 8);
  }
  else if (*(void *)a2)
  {
    return 0x100000;
  }
  else
  {
    uint64_t result = 0;
    *a3 = 0;
  }
  return result;
}

uint64_t _gsskrb5_unwrap(krb5_error_code *a1, uint64_t a2, unint64_t *a3, size_t *a4, int *a5, _DWORD *a6)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  *a4 = 0;
  a4[1] = 0;
  if (a6) {
    *a6 = 0;
  }
  krb5_context v38 = 0;
  int v39 = 0;
  krb5_error_code v12 = __ApplePrivate__gsskrb5_init(&v38);
  if (!v12)
  {
    if ((*(unsigned char *)(a2 + 76) & 0x40) != 0) {
      return _gssapi_unwrap_cfx(a1, a2, v38, a3, (uint64_t)a4, a5, a6, v13);
    }
    pthread_mutex_lock((pthread_mutex_t *)(a2 + 128));
    krb5_error_code token_key = _gsskrb5i_get_token_key(a2, v38, &v39);
    pthread_mutex_unlock((pthread_mutex_t *)(a2 + 128));
    if (token_key)
    {
      *a1 = token_key;
      return 851968;
    }
    *a1 = 0;
    krb5_magic magic = v39->magic;
    if ((v39->magic - 23) < 2)
    {
      uint64_t v14 = _gssapi_unwrap_arcfour(a1, a2, (uint64_t)v38, a3, (uint64_t)a4, a5, a6, (uint64_t)v39);
      goto LABEL_48;
    }
    if (magic != 16 && magic != 5) {
      goto LABEL_47;
    }
    int v18 = v38;
    unint64_t v19 = *a3;
    if ((*(unsigned char *)(a2 + 73) & 0x10) != 0)
    {
      if (v19 < 0x39) {
        goto LABEL_21;
      }
      unint64_t v19 = 57;
    }
    uint64_t v46 = 0;
    uint64_t v47 = 0;
    unsigned int v45 = 0;
    krb5_const_pointer inptr = 0;
    uint64_t v44 = 0;
    uint64_t v41 = 0;
    p_long long ivec = 0;
    uint64_t seed = 0;
    size_t size = a3[1];
    uint64_t v14 = _gsskrb5_verify_header((unsigned char **)&size, v19, (unsigned __int16 *)"\x02\x01", (uint64_t)&__gss_krb5_mechanism_oid_desc);
    if (v14)
    {
LABEL_48:
      krb5_free_keyblock(v38, v39);
      return v14;
    }
    if (size - a3[1] + 42 > *a3)
    {
LABEL_21:
      uint64_t v14 = 0x10000;
      goto LABEL_48;
    }
    if (ct_memcmp())
    {
LABEL_24:
      uint64_t v14 = 393216;
      goto LABEL_48;
    }
    size += 2;
    int v20 = ct_memcmp();
    if (v20)
    {
      if (ct_memcmp()) {
        goto LABEL_24;
      }
      int v21 = 0;
    }
    else
    {
      int v21 = 1;
    }
    size += 2;
    if (a5) {
      *a5 = v21;
    }
    if (ct_memcmp() || (size += 30, size_t v22 = size - a3[1], v22 > *a3))
    {
      uint64_t v14 = 589824;
      goto LABEL_48;
    }
    if (!v20)
    {
      size_t v23 = size - a3[1];
      long long ivec = 0uLL;
      krb5_error_code v24 = krb5_crypto_init();
      if (v24
        || (krb5_error_code v24 = krb5_decrypt(v18, inptr, (krb5_pointer)0x16, size, (krb5_encrypt_block *)(*a3 - v23), &ivec),
            krb5_crypto_destroy(),
            v24))
      {
        *a1 = v24;
        goto LABEL_47;
      }
      if ((void)ivec != *a3 - v23) {
        _gsskrb5_unwrap_cold_1();
      }
      memcpy((void *)size, *((const void **)&ivec + 1), ivec);
      krb5_data_free();
      size_t v22 = v23;
    }
    size_t v37 = v22;
    if ((*(unsigned char *)(a2 + 73) & 0x10) != 0)
    {
      uint64_t v44 = 0;
    }
    else
    {
      uint64_t v14 = _gssapi_verify_pad(a3, *a3 - v22 - 8, &v44);
      if (v14) {
        goto LABEL_48;
      }
    }
    pthread_mutex_lock((pthread_mutex_t *)(a2 + 128));
    size -= 28;
    krb5_error_code v25 = krb5_crypto_init();
    if (v25)
    {
      *a1 = v25;
    }
    else
    {
      *(void *)&long long ivec = *(void *)(size + 8);
      krb5_error_code v26 = krb5_decrypt_ivec();
      krb5_crypto_destroy();
      if (!v26)
      {
        if (v46 == 8)
        {
          _gss_mg_decode_le_uint32(v47, &v45);
          int v28 = ct_memcmp();
          krb5_data_free();
          if (!v28)
          {
            uint64_t v29 = _gssapi_msg_order_check(*(void *)(a2 + 24), v45);
            if (v29)
            {
              uint64_t v14 = v29;
              *a1 = 0;
              pthread_mutex_unlock((pthread_mutex_t *)(a2 + 128));
              goto LABEL_48;
            }
            pthread_mutex_unlock((pthread_mutex_t *)(a2 + 128));
            long long v30 = *(_OWORD *)(size + 8);
            int v50 = *(_DWORD *)(size + 24);
            long long ivec = v30;
            *(void *)(size + 20) = *(void *)(size - 8);
            LODWORD(seed) = 12;
            uint64_t v41 = 20;
            p_long long ivec = &ivec;
            krb5_error_code v31 = krb5_crypto_init();
            if (v31)
            {
              *a1 = v31;
            }
            else
            {
              krb5_error_code v33 = krb5_verify_checksum(v18, (krb5_cksumtype)inptr, (const krb5_checksum *)0x17, (krb5_const_pointer)(size + 20), *a3 - v37 + 8, &seed, v32);
              krb5_crypto_destroy();
              if (!v33)
              {
                size_t v34 = *a3 - v44 - v37 - 8;
                *a4 = v34;
                uint64_t v35 = malloc_type_malloc(v34, 0x7FB4FE03uLL);
                a4[1] = (size_t)v35;
                if (*a4) {
                  BOOL v36 = v35 == 0;
                }
                else {
                  BOOL v36 = 0;
                }
                if (v36) {
                  uint64_t v14 = 851968;
                }
                else {
                  uint64_t v14 = 0;
                }
                if (v35)
                {
                  memcpy(v35, (const void *)(size + 36), *a4);
                  uint64_t v14 = 0;
                }
                goto LABEL_48;
              }
              *a1 = v33;
            }
            goto LABEL_47;
          }
        }
        else
        {
          krb5_data_free();
        }
        *a1 = 0;
        pthread_mutex_unlock((pthread_mutex_t *)(a2 + 128));
        goto LABEL_24;
      }
      *a1 = v26;
    }
    pthread_mutex_unlock((pthread_mutex_t *)(a2 + 128));
LABEL_47:
    uint64_t v14 = 851968;
    goto LABEL_48;
  }
  *a1 = v12;
  return 851968;
}

uint64_t _gsskrb5_verify_mic_internal(krb5_error_code *a1, uint64_t a2, _krb5_context *a3, uint64_t a4, uint64_t a5, _DWORD *a6, unsigned __int16 *a7, uint64_t a8)
{
  v45[2] = *(unsigned char **)MEMORY[0x263EF8340];
  if ((*(unsigned char *)(a2 + 76) & 0x40) == 0)
  {
    size_t v37 = 0;
    int v15 = (pthread_mutex_t *)(a2 + 128);
    pthread_mutex_lock((pthread_mutex_t *)(a2 + 128));
    krb5_error_code token_key = _gsskrb5i_get_token_key(a2, a3, &v37);
    pthread_mutex_unlock((pthread_mutex_t *)(a2 + 128));
    if (token_key)
    {
      *a1 = token_key;
      return 851968;
    }
    *a1 = 0;
    krb5_magic magic = v37->magic;
    if ((v37->magic - 23) < 2)
    {
      uint64_t v17 = _gssapi_verify_mic_arcfour(a1, a2, (uint64_t)a3, a4, (unint64_t *)a5, a6, v37, a7);
      goto LABEL_31;
    }
    if (magic != 16 && magic != 5) {
      goto LABEL_30;
    }
    unsigned int v44 = 0;
    long long v42 = 0;
    *(void *)krb5_data ctype = 0;
    size_t v40 = 0;
    uint64_t v41 = 0;
    uint64_t seed = 0;
    uint64_t v39 = 0;
    unint64_t v21 = *(void *)a5;
    v45[0] = *(unsigned char **)(a5 + 8);
    uint64_t v17 = _gsskrb5_verify_header(v45, v21, a7, (uint64_t)&__gss_krb5_mechanism_oid_desc);
    if (v17)
    {
LABEL_31:
      krb5_free_keyblock(a3, v37);
      return v17;
    }
    size_t v22 = v45[0];
    if (*(_WORD *)v45[0] != 4 || (v45[0] += 2, *(_DWORD *)(v22 + 2) != -1))
    {
LABEL_16:
      uint64_t v17 = 393216;
      goto LABEL_31;
    }
    v45[0] = v22 + 6;
    krb5_error_code v23 = krb5_crypto_init();
    if (v23)
    {
      *a1 = v23;
LABEL_30:
      uint64_t v17 = 851968;
      goto LABEL_31;
    }
    char v24 = 1;
    while (1)
    {
      while (1)
      {
        char v25 = v24;
        krb5_error_code v26 = (v24 & 1) != 0 ? (unsigned char *)*((void *)v45[0] + 1) : 0;
        v45[1] = v26;
        krb5_error_code v27 = krb5_decrypt_ivec();
        if (!v27) {
          break;
        }
        char v24 = 0;
        if ((v25 & 1) == 0)
        {
          krb5_error_code v28 = v27;
          krb5_crypto_destroy();
          *a1 = v28;
          goto LABEL_30;
        }
      }
      if (v41 == 8) {
        break;
      }
      krb5_data_free();
      char v24 = 0;
      if ((v25 & 1) == 0)
      {
        krb5_crypto_destroy();
        goto LABEL_16;
      }
    }
    pthread_mutex_lock((pthread_mutex_t *)(a2 + 128));
    _gss_mg_decode_le_uint32(v42, &v44);
    int v29 = ct_memcmp();
    krb5_data_free();
    if (v29)
    {
      krb5_crypto_destroy();
      *a1 = 0;
    }
    else
    {
      uint64_t v30 = _gssapi_msg_order_check(*(void *)(a2 + 24), v44);
      if (v30)
      {
        uint64_t v17 = v30;
        krb5_crypto_destroy();
        *a1 = 0;
        pthread_mutex_unlock((pthread_mutex_t *)(a2 + 128));
        goto LABEL_31;
      }
      krb5_error_code v31 = malloc_type_malloc(*(void *)a4 + 8, 0x7EF428DFuLL);
      if (!v31)
      {
        krb5_crypto_destroy();
        pthread_mutex_unlock((pthread_mutex_t *)(a2 + 128));
        *a1 = 12;
        goto LABEL_30;
      }
      size_t v32 = v31;
      void *v31 = *((void *)v45[0] - 1);
      memcpy(v31 + 1, *(const void **)(a4 + 8), *(void *)a4);
      krb5_crypto_destroy();
      krb5_error_code v33 = krb5_crypto_init();
      if (v33)
      {
        krb5_error_code v35 = v33;
        free(v32);
        *a1 = v35;
      }
      else
      {
        LODWORD(seed) = 12;
        uint64_t v39 = 20;
        size_t v40 = v45[0] + 8;
        krb5_error_code v36 = krb5_verify_checksum(a3, ctype[0], (const krb5_checksum *)0x17, v32, *(void *)a4 + 8, &seed, v34);
        free(v32);
        if (!v36)
        {
          pthread_mutex_unlock(v15);
          krb5_crypto_destroy();
          uint64_t v17 = 0;
          goto LABEL_31;
        }
        krb5_crypto_destroy();
        *a1 = v36;
      }
    }
    pthread_mutex_unlock(v15);
    goto LABEL_16;
  }

  return _gssapi_verify_mic_cfx(a1, a2, a3, a4, (void *)a5, a6, (uint64_t)a7, a8);
}

uint64_t _gsskrb5_verify_mic(krb5_error_code *a1, uint64_t a2, uint64_t a3, uint64_t a4, _DWORD *a5)
{
  krb5_context v13 = 0;
  krb5_error_code v10 = __ApplePrivate__gsskrb5_init(&v13);
  if (v10)
  {
    *a1 = v10;
    return 851968;
  }
  else
  {
    if (a5) {
      *a5 = 0;
    }
    return _gsskrb5_verify_mic_internal(a1, a2, v13, a3, a4, a5, (unsigned __int16 *)"\x01\x01", v11);
  }
}

uint64_t _gsskrb5i_get_initiator_subkey(uint64_t a1, _krb5_context *a2, krb5_keyblock **a3)
{
  *a3 = 0;
  if (*(unsigned char *)(a1 + 76))
  {
    uint64_t result = krb5_auth_con_getlocalsubkey();
    if (result) {
      return result;
    }
  }
  else
  {
    uint64_t result = krb5_auth_con_getremotesubkey();
    if (result) {
      return result;
    }
  }
  if (*a3) {
    return 0;
  }
  uint64_t result = krb5_auth_con_getkey(a2, *(krb5_auth_context *)(a1 + 40), a3);
  if (!result)
  {
    if (*a3) {
      return 0;
    }
    krb5_set_error_message(a2, 0, "No initiator subkey available");
    return 35224195;
  }
  return result;
}

uint64_t _gsskrb5i_get_acceptor_subkey(uint64_t a1, _krb5_context *a2, void *a3)
{
  *a3 = 0;
  if (*(unsigned char *)(a1 + 76))
  {
    uint64_t result = krb5_auth_con_getremotesubkey();
    if (result) {
      return result;
    }
  }
  else
  {
    uint64_t result = krb5_auth_con_getlocalsubkey();
    if (result) {
      return result;
    }
  }
  if (*a3) {
    return 0;
  }
  krb5_set_error_message(a2, 0, "No acceptor subkey available");
  return 35224195;
}

uint64_t _gsskrb5i_get_token_key(uint64_t a1, _krb5_context *a2, krb5_keyblock **a3)
{
  if (*a3) {
    return 0;
  }
  if ((*(unsigned char *)(a1 + 8) & 4) == 0)
  {
    _gsskrb5i_get_initiator_subkey(a1, a2, a3);
    if (*a3) {
      return 0;
    }
  }
  krb5_set_error_message(a2, 0, "No token key available");
  return 35224195;
}

uint64_t _gsskrb5_wrap_size_limit(_DWORD *a1, pthread_mutex_t *a2, uint64_t a3, uint64_t a4, unsigned int a5, unsigned int *a6)
{
  int v20 = 0;
  krb5_context v21 = 0;
  int v12 = __ApplePrivate__gsskrb5_init(&v21);
  if (v12)
  {
    *a1 = v12;
    return 851968;
  }
  if ((a2[1].__opaque[4] & 0x40) != 0) {
    return _gssapi_wrap_size_cfx((uint64_t)a1, (uint64_t)a2, (uint64_t)v21, a3, a4, a5, a6);
  }
  pthread_mutex_lock(a2 + 2);
  int token_key = _gsskrb5i_get_token_key((uint64_t)a2, v21, &v20);
  pthread_mutex_unlock(a2 + 2);
  if (token_key)
  {
    *a1 = token_key;
    return 851968;
  }
  krb5_magic magic = v20->magic;
  if ((v20->magic - 23) < 2)
  {
    uint64_t v13 = _gssapi_wrap_size_arcfour(a1, (uint64_t)a2, (uint64_t)v21, a3, a4, a5, a6);
  }
  else if (magic == 16 || magic == 5)
  {
    uint64_t v22 = 0;
    uint64_t v23 = a5 + 50;
    _gsskrb5_encap_length(v23, &v23, &v22, &__gss_krb5_mechanism_oid_desc);
    uint64_t v13 = 0;
    unint64_t v17 = v22 - a5;
    if (v17 >= a5) {
      unsigned int v18 = 0;
    }
    else {
      unsigned int v18 = (a5 - v17) & 0xFFFFFFF8;
    }
    *a6 = v18;
  }
  else
  {
    uint64_t v13 = 851968;
  }
  krb5_free_keyblock(v21, v20);
  *a1 = 0;
  return v13;
}

uint64_t _gsskrb5_wrap(_DWORD *a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, int *a6, uint64_t a7)
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  uint64_t v39 = 0;
  krb5_context v40 = 0;
  *(void *)a7 = 0;
  *(void *)(a7 + 8) = 0;
  int v14 = __ApplePrivate__gsskrb5_init(&v40);
  if (!v14)
  {
    if ((*(unsigned char *)(a2 + 76) & 0x40) != 0) {
      return _gssapi_wrap_cfx(a1, a2, v40, a3, a5, a6, (size_t *)a7);
    }
    pthread_mutex_lock((pthread_mutex_t *)(a2 + 128));
    int token_key = _gsskrb5i_get_token_key(a2, v40, &v39);
    pthread_mutex_unlock((pthread_mutex_t *)(a2 + 128));
    if (token_key)
    {
      *a1 = token_key;
      return 851968;
    }
    krb5_magic magic = v39->magic;
    if ((v39->magic - 23) < 2)
    {
      uint64_t v15 = _gssapi_wrap_arcfour(a1, a2, v40, a3, a4, a5, a6, (size_t *)a7, (uint64_t)v39);
LABEL_26:
      krb5_free_keyblock(v40, v39);
      return v15;
    }
    if (magic != 16 && magic != 5) {
      goto LABEL_25;
    }
    krb5_context v38 = v40;
    krb5_int32 v49 = 0;
    krb5_const_pointer inptr = 0;
    size_t v47 = 0;
    uint64_t v43 = 0;
    size_t v44 = 0;
    unsigned int v45 = 0;
    uint64_t v41 = 0;
    long long v42 = 0;
    size_t v19 = *(void *)a5;
    if ((*(unsigned char *)(a2 + 73) & 0x10) != 0)
    {
      size_t v48 = 42;
      _gsskrb5_encap_length(42, &v48, &v47, &__gss_krb5_mechanism_oid_desc);
      uint64_t v20 = 0;
      size_t v21 = v47 + v19;
      v47 += v19;
    }
    else
    {
      uint64_t v20 = 8 - (*(void *)a5 & 7);
      v19 += v20;
      size_t v48 = v19 + 42;
      _gsskrb5_encap_length(v19 + 42, &v48, &v47, &__gss_krb5_mechanism_oid_desc);
      size_t v21 = v47;
    }
    *(void *)a7 = v21;
    uint64_t v22 = malloc_type_malloc(v21, 0xAC28D850uLL);
    *(void *)(a7 + 8) = v22;
    if (!v22)
    {
      *(void *)a7 = 0;
      *a1 = 12;
LABEL_25:
      uint64_t v15 = 851968;
      goto LABEL_26;
    }
    size_t v37 = v19;
    uint64_t header = _gsskrb5_make_header(v22, v48, "\x02\x01", (const void **)&__gss_krb5_mechanism_oid_desc);
    char v24 = header;
    *(_WORD *)uint64_t header = 4;
    if (a3) {
      __int16 v25 = 2;
    }
    else {
      __int16 v25 = -1;
    }
    *((_WORD *)header + 1) = v25;
    *((_WORD *)header + 2) = -1;
    *(void *)(header + 26) = *(void *)(header - 2);
    char __dst = header + 34;
    krb5_generate_random_block();
    memcpy(v24 + 42, *(const void **)(a5 + 8), *(void *)a5);
    memset(&v24[*(void *)a5 + 42], v20, v20);
    int v26 = krb5_crypto_init();
    if (v26)
    {
      int v27 = v26;
      free(*(void **)(a7 + 8));
      *(void *)a7 = 0;
      *(void *)(a7 + 8) = 0;
      uint64_t v15 = 851968;
      *a1 = v27;
      goto LABEL_26;
    }
    int checksum = krb5_create_checksum();
    krb5_crypto_destroy();
    if (checksum)
    {
LABEL_31:
      free(*(void **)(a7 + 8));
      *(void *)a7 = 0;
      *(void *)(a7 + 8) = 0;
      uint64_t v15 = 851968;
      *a1 = checksum;
      goto LABEL_26;
    }
    uint64_t v30 = v24 + 6;
    *(void *)(v24 + 6) = 0;
    *(void *)(v24 + 14) = 0;
    *(void *)(v24 + 22) = 0;
    *(_DWORD *)(v24 + 30) = 0;
    krb5_error_code v31 = (uint64_t *)(v24 + 14);
    memcpy(v31, v45, v44);
    free_Checksum((uint64_t)&v43);
    pthread_mutex_lock((pthread_mutex_t *)(a2 + 128));
    krb5_auth_con_getlocalseqnumber(v38, *(krb5_auth_context *)(a2 + 40), &v49);
    int v32 = 16843009 * ((*(unsigned char *)(a2 + 76) & 1) - 1);
    krb5_int32 v52 = v49;
    int v53 = v32;
    int v33 = krb5_crypto_init();
    if (v33)
    {
      int checksum = v33;
      goto LABEL_31;
    }
    uint64_t ivec = *v31;
    int v34 = krb5_encrypt_ivec();
    krb5_crypto_destroy();
    if (v34)
    {
LABEL_33:
      free(*(void **)(a7 + 8));
      *(void *)a7 = 0;
      *(void *)(a7 + 8) = 0;
      uint64_t v15 = 851968;
      *a1 = v34;
      goto LABEL_26;
    }
    if (v41 != 8) {
      _gsskrb5_wrap_cold_2();
    }
    *uint64_t v30 = *v42;
    krb5_data_free();
    ++v49;
    krb5_auth_con_setlocalseqnumber();
    pthread_mutex_unlock((pthread_mutex_t *)(a2 + 128));
    if (a3)
    {
      uint64_t ivec = 0;
      uint64_t v51 = 0;
      int v34 = krb5_crypto_init();
      if (v34) {
        goto LABEL_33;
      }
      size_t v35 = v37 + 8;
      int v34 = krb5_encrypt(v38, inptr, (krb5_pointer)0x16, (size_t)__dst, (krb5_encrypt_block *)(v37 + 8), &ivec);
      krb5_crypto_destroy();
      if (v34) {
        goto LABEL_33;
      }
      if (ivec != v35) {
        _gsskrb5_wrap_cold_1();
      }
      memcpy(__dst, v51, v35);
      krb5_data_free();
    }
    if (a6) {
      *a6 = a3;
    }
    uint64_t v15 = 0;
    *a1 = 0;
    goto LABEL_26;
  }
  *a1 = v14;
  return 851968;
}

uint64_t _gsskrb5_store_cred(int *a1, uint64_t a2, int a3, gss_const_OID a, uint64_t a5, int a6)
{
  int matched = 35224071;
  *a1 = 0;
  if (a3 != 1)
  {
    uint64_t v11 = 851968;
    goto LABEL_7;
  }
  if (!gss_oid_equal(a, &__gss_krb5_mechanism_oid_desc)) {
    return 0x10000;
  }
  if (!a2) {
    return 458752;
  }
  krb5_ccache v15 = 0;
  krb5_context context = 0;
  int v10 = __ApplePrivate__gsskrb5_init(&context);
  if (!v10)
  {
    pthread_mutex_lock((pthread_mutex_t *)(a2 + 48));
    if (*(_DWORD *)(a2 + 32) <= 1u)
    {
      if (*(void *)a2)
      {
        krb5_error_code v13 = krb5_cc_cache_match(context, *(krb5_principal *)a2, &v15);
        if (v13 && (krb5_error_code v14 = krb5_cc_new_unique(context, 0, 0, &v15)) != 0)
        {
          int matched = v14;
        }
        else
        {
          int matched = krb5_cc_initialize(context, v15, *(krb5_principal *)a2);
          if (!matched)
          {
            int matched = krb5_cc_copy_match_f();
            if (!matched)
            {
              if (a6) {
                krb5_cc_switch();
              }
              krb5_cc_close(context, v15);
              int matched = 0;
              uint64_t v11 = 0;
              goto LABEL_23;
            }
          }
          if (v13) {
            krb5_cc_destroy(context, v15);
          }
          else {
            krb5_cc_close(context, v15);
          }
        }
      }
      else
      {
        int matched = 35224194;
      }
    }
    uint64_t v11 = 851968;
LABEL_23:
    pthread_mutex_unlock((pthread_mutex_t *)(a2 + 48));
    goto LABEL_7;
  }
  uint64_t v11 = 851968;
  int matched = v10;
LABEL_7:
  *a1 = matched;
  return v11;
}

uint64_t _gss_pku2u_iter_creds_f(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, const gss_OID_desc *, char *))
{
  return iter_creds_f(&__gss_pku2u_mechanism_oid_desc, a2, a3);
}

uint64_t iter_creds_f(const gss_OID_desc *a1, uint64_t a2, uint64_t (*a3)(uint64_t, const gss_OID_desc *, char *))
{
  krb5_cccol_cursor cursor = 0;
  krb5_context context = 0;
  ckrb5_ccache cache = 0;
  if (!__ApplePrivate__gsskrb5_init(&context) && !krb5_cccol_cursor_new(context, &cursor))
  {
    if (!krb5_cccol_cursor_next(context, cursor, &ccache))
    {
      unsigned int v6 = ccache;
      if (ccache)
      {
        while (1)
        {
          int v20 = 0;
          v18.data = 0;
          krb5_principal principal = 0;
          *(void *)&v18.krb5_magic magic = 0;
          krb5_error_code v7 = krb5_cc_get_principal(context, v6, &principal);
          krb5_error_code v8 = context;
          if (v7) {
            goto LABEL_6;
          }
          int is_pku2u = krb5_principal_is_pku2u();
          int v10 = &__gss_pku2u_mechanism_oid_desc;
          if (!is_pku2u)
          {
            krb5_error_code config = krb5_cc_get_config(context, ccache, 0, "iakerb", &v18);
            int v10 = &__gss_krb5_mechanism_oid_desc;
            if (!config)
            {
              krb5_data_free();
              int v10 = &__gss_iakerb_mechanism_oid_desc;
            }
          }
          if (!gss_oid_equal(a1, v10)) {
            break;
          }
          int v12 = (char *)malloc_type_calloc(1uLL, 0x88uLL, 0x1030040BE4FC7E4uLL);
          if (!v12)
          {
            krb5_cc_close(context, ccache);
            return a3(a2, 0, 0);
          }
          krb5_error_code v13 = v12;
          pthread_mutex_init((pthread_mutex_t *)(v12 + 48), 0);
          *((_DWORD *)v13 + 8) = 1;
          krb5_principal v14 = principal;
          *(void *)krb5_error_code v13 = principal;
          __gsskrb5_ccache_lifetime(&v20, context, ccache, (uint64_t)v14, (void *)v13 + 3);
          *((void *)v13 + 2) = 0;
          *((void *)v13 + 5) = ccache;
          a3(a2, a1, v13);
LABEL_13:
          krb5_error_code v15 = krb5_cccol_cursor_next(context, cursor, &ccache);
          unsigned int v6 = ccache;
          if (v15) {
            BOOL v16 = 1;
          }
          else {
            BOOL v16 = ccache == 0;
          }
          if (v16) {
            goto LABEL_20;
          }
        }
        krb5_free_principal(context, principal);
        krb5_error_code v8 = context;
LABEL_6:
        krb5_cc_close(v8, ccache);
        goto LABEL_13;
      }
    }
LABEL_20:
    krb5_cccol_cursor_free(context, &cursor);
  }
  return a3(a2, 0, 0);
}

uint64_t _gss_krb5_iter_creds_f(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, const gss_OID_desc *, char *))
{
  return iter_creds_f(&__gss_krb5_mechanism_oid_desc, a2, a3);
}

uint64_t _gss_iakerb_iter_creds_f(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, const gss_OID_desc *, char *))
{
  return iter_creds_f(&__gss_iakerb_mechanism_oid_desc, a2, a3);
}

uint64_t _gsskrb5_export_cred(int *a1, uint64_t a2, void *a3)
{
  krb5_context v12 = 0;
  krb5_data_zero();
  int v6 = __ApplePrivate__gsskrb5_init(&v12);
  if (!v6)
  {
    if (*(_DWORD *)(a2 + 32) >= 2u)
    {
      int v8 = 35224071;
    }
    else
    {
      if (krb5_storage_emem())
      {
        if (!*(void *)(a2 + 40)) {
          goto LABEL_24;
        }
        int krbtgt = krb5_store_int32();
        if (krbtgt
          || (int krbtgt = _krb5_get_krbtgt()) != 0
          || (int krbtgt = krb5_store_creds(), krb5_free_creds(v12, 0), krbtgt))
        {
          krb5_storage_free();
          *a1 = krbtgt;
          return 851968;
        }
        int v9 = krb5_storage_to_data();
        krb5_storage_free();
        if (v9)
        {
LABEL_22:
          *a1 = v9;
          return 851968;
        }
        if (krb5_storage_emem())
        {
          int v10 = krb5_store_data();
          if (v10)
          {
            int v9 = v10;
            krb5_data_free();
LABEL_21:
            krb5_storage_free();
            goto LABEL_22;
          }
          int v9 = krb5_store_data();
          krb5_data_free();
          if (v9) {
            goto LABEL_21;
          }
          int v9 = krb5_storage_to_data();
          krb5_storage_free();
          if (v9) {
            goto LABEL_22;
          }
LABEL_24:
          uint64_t result = 0;
          *a3 = 0;
          a3[1] = 0;
          return result;
        }
        krb5_data_free();
      }
      int v8 = 12;
    }
    *a1 = v8;
    return 851968;
  }
  *a1 = v6;
  return 851968;
}

uint64_t _gsskrb5_import_cred(krb5_error_code *a1, uint64_t a2, void *a3)
{
  krb5_ccache id = 0;
  krb5_context v28 = 0;
  int v26 = 0;
  int v25 = 0;
  *a3 = 0;
  krb5_error_code v5 = __ApplePrivate__gsskrb5_init(&v28);
  if (v5)
  {
    *a1 = v5;
    return 851968;
  }
  if (!krb5_storage_from_mem())
  {
LABEL_25:
    *a1 = 12;
    return 851968;
  }
  krb5_error_code v6 = krb5_ret_uint32();
  if (v6)
  {
    krb5_error_code v7 = v6;
    krb5_storage_free();
LABEL_6:
    *a1 = v7;
    return 851968;
  }
  if (v25 == 1)
  {
    krb5_error_code v7 = krb5_ret_string();
    krb5_storage_free();
    if (v7) {
      goto LABEL_6;
    }
    krb5_error_code v10 = krb5_cc_resolve(v28, v26, &id);
    krb5_xfree();
    if (v10)
    {
      *a1 = v10;
      return 851968;
    }
    int v12 = 0;
  }
  else
  {
    if (v25)
    {
      krb5_storage_free();
      *a1 = 0;
      return 458752;
    }
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    *(_OWORD *)krb5_principal principal = 0u;
    krb5_error_code v7 = krb5_ret_creds();
    krb5_storage_free();
    if (v7) {
      goto LABEL_6;
    }
    krb5_error_code v7 = krb5_cc_new_unique(v28, "API", 0, &id);
    if (v7) {
      goto LABEL_6;
    }
    krb5_error_code v7 = krb5_cc_initialize(v28, id, principal[0]);
    int v9 = id;
    int v8 = v28;
    if (v7) {
      goto LABEL_14;
    }
    krb5_error_code v7 = krb5_cc_store_cred(v28, id, (krb5_creds *)principal);
    krb5_free_cred_contents(v28, (krb5_creds *)principal);
    if (v7)
    {
      int v9 = id;
      int v8 = v28;
LABEL_14:
      krb5_cc_destroy(v8, v9);
      goto LABEL_6;
    }
    int v12 = 1;
  }
  krb5_error_code v13 = malloc_type_calloc(1uLL, 0x88uLL, 0x1030040BE4FC7E4uLL);
  if (!v13)
  {
    krb5_cc_close(v28, id);
    goto LABEL_25;
  }
  krb5_principal v14 = v13;
  v13[8] = 1;
  krb5_cc_get_principal(v28, id, (krb5_principal *)v13);
  krb5_error_code v15 = id;
  *((void *)v14 + 5) = id;
  v14[2] = v12;
  if (*(void *)v14) {
    __gsskrb5_ccache_lifetime(a1, v28, v15, *(void *)v14, (void *)v14 + 3);
  }
  uint64_t result = 0;
  *a3 = v14;
  return result;
}

uint64_t _gsskrb5_destroy_cred(_DWORD *a1, uint64_t *a2)
{
  *(_DWORD *)(*a2 + 8) |= 1u;
  return _gsskrb5_release_cred(a1, a2);
}

uint64_t _gsskrb5_cred_hold(_DWORD *a1, uint64_t a2)
{
  return change_hold(a1, a2, MEMORY[0x263F47798]);
}

uint64_t change_hold(_DWORD *a1, uint64_t a2, uint64_t (*a3)(krb5_context, void))
{
  v7.data = 0;
  krb5_context v8 = 0;
  *(void *)&v7.krb5_magic magic = 0;
  *a1 = 0;
  krb5_data_zero();
  LODWORD(result) = __ApplePrivate__gsskrb5_init(&v8);
  if (result) {
    goto LABEL_2;
  }
  if (!a2) {
    return 0;
  }
  if (*(_DWORD *)(a2 + 32) > 1u)
  {
    LODWORD(result) = 35224071;
LABEL_2:
    *a1 = result;
    return 851968;
  }
  LODWORD(result) = krb5_cc_get_config(v8, *(krb5_ccache *)(a2 + 40), 0, "nah-created", &v7);
  if (result) {
    goto LABEL_2;
  }
  krb5_data_free();
  uint64_t result = a3(v8, *(void *)(a2 + 40));
  if (result) {
    goto LABEL_2;
  }
  return result;
}

uint64_t _gsskrb5_cred_unhold(_DWORD *a1, uint64_t a2)
{
  return change_hold(a1, a2, MEMORY[0x263F477B0]);
}

uint64_t _gsskrb5_cred_label_get(_DWORD *a1, uint64_t a2, const char *a3, void *a4)
{
  v11.data = 0;
  krb5_context v12 = 0;
  *(void *)&v11.krb5_magic magic = 0;
  LODWORD(result) = __ApplePrivate__gsskrb5_init(&v12);
  if (!result)
  {
    if (!a2) {
      return 0;
    }
    int v9 = *(_krb5_ccache **)(a2 + 40);
    if (!v9)
    {
      *a1 = 35224071;
      return 851968;
    }
    uint64_t result = krb5_cc_get_config(v12, v9, 0, a3, &v11);
    if (!result)
    {
      data = v11.data;
      *a4 = *(void *)&v11.magic;
      a4[1] = data;
      return result;
    }
  }
  *a1 = result;
  return 851968;
}

uint64_t _gsskrb5_cred_label_set(_DWORD *a1, uint64_t a2, const char *a3, uint64_t *a4)
{
  uint64_t v13 = 0;
  krb5_context v14 = 0;
  uint64_t v12 = 0;
  LODWORD(result) = __ApplePrivate__gsskrb5_init(&v14);
  if (result) {
    goto LABEL_2;
  }
  if (!a2) {
    return 0;
  }
  int v9 = *(_krb5_ccache **)(a2 + 40);
  if (!v9)
  {
    LODWORD(result) = 35224071;
LABEL_2:
    *a1 = result;
    return 851968;
  }
  if (a4)
  {
    uint64_t v10 = a4[1];
    uint64_t v12 = *a4;
    uint64_t v13 = v10;
    krb5_data v11 = (krb5_data *)&v12;
  }
  else
  {
    krb5_data v11 = 0;
  }
  uint64_t result = krb5_cc_set_config(v14, v9, 0, a3, v11);
  if (result) {
    goto LABEL_2;
  }
  return result;
}

uint64_t _gsskrb5_appl_change_password(krb5_error_code *a1, krb5_principal_data *a2, char *a3, char *a4)
{
  *(void *)&result_code_string.krb5_magic magic = 0;
  result_code_string.data = 0;
  *(void *)&result_string.krb5_magic magic = 0;
  result_string.data = 0;
  krb5_context v13 = 0;
  opt = 0;
  int result_code = 0;
  krb5_error_code v8 = __ApplePrivate__gsskrb5_init(&v13);
  if (v8)
  {
    *a1 = v8;
    return 851968;
  }
  else
  {
    memset(creds, 0, sizeof(creds));
    init_creds_opt_int alloc = krb5_get_init_creds_opt_alloc(v13, &opt);
    if (!init_creds_opt_alloc)
    {
      krb5_get_init_creds_opt_set_tkt_life(opt, 300);
      krb5_get_init_creds_opt_set_forwardable(opt, 0);
      krb5_get_init_creds_opt_set_proxiable(opt, 0);
      init_creds_opt_int alloc = krb5_get_init_creds_password(v13, (krb5_creds *)creds, a2, a3, 0, 0, 0, "kadmin/changepw", opt);
      if (!init_creds_opt_alloc)
      {
        init_creds_opt_int alloc = krb5_set_password(v13, (krb5_creds *)creds, a4, 0, &result_code, &result_code_string, &result_string);
        if (!init_creds_opt_alloc)
        {
          krb5_data_free();
          krb5_data_free();
          if (result_code)
          {
            init_creds_opt_int alloc = -1765328353;
            krb5_set_error_message(v13, -1765328353, "Failed to change invalid password: %d", result_code);
          }
          else
          {
            init_creds_opt_int alloc = 0;
          }
        }
      }
    }
    if (opt) {
      krb5_get_init_creds_opt_free(v13, opt);
    }
    krb5_free_cred_contents(v13, (krb5_creds *)creds);
    *a1 = init_creds_opt_alloc;
    if (init_creds_opt_alloc) {
      return 851968;
    }
    else {
      return 0;
    }
  }
}

uint64_t _gsskrb5_authorize_localname(_DWORD *a1, krb5_principal_data *a2, uint64_t a3, gss_const_OID a)
{
  if (!gss_oid_equal(a, &__gss_c_nt_user_name_oid_desc)) {
    return 196608;
  }
  krb5_context v12 = 0;
  int v7 = __ApplePrivate__gsskrb5_init(&v12);
  if (v7)
  {
    *a1 = v7;
    return 851968;
  }
  int v9 = (char *)malloc_type_malloc(*(void *)a3 + 1, 0x86DB4D11uLL);
  if (!v9)
  {
    *a1 = 12;
    return 851968;
  }
  uint64_t v10 = v9;
  memcpy(v9, *(const void **)(a3 + 8), *(void *)a3);
  v10[*(void *)a3] = 0;
  *a1 = 0;
  krb5_BOOLean v11 = krb5_kuserok(v12, a2, v10);
  free(v10);
  if (v11) {
    return 0;
  }
  else {
    return 983040;
  }
}

uint64_t _gsskrb5_pname_to_uid(_DWORD *a1, const krb5_principal_data *a2, uint64_t a3, uid_t *a4)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  krb5_context v11 = 0;
  int v7 = __ApplePrivate__gsskrb5_init(&v11);
  if (v7 || (*a1 = 0, (int v7 = krb5_aname_to_localname(v11, a2, 256, v12)) != 0))
  {
    *a1 = v7;
  }
  else
  {
    int v9 = getpwnam(v12);
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t result = 0;
      *a4 = v10->pw_uid;
      return result;
    }
    *a1 = -1765328227;
  }
  return 851968;
}

uint64_t __ApplePrivate_gss_acquire_cred_ex(gss_name_t_desc_struct *a1, int a2, unsigned int a3, const gss_OID_desc *a4, unsigned int a5, uint64_t a6, void *aBlock)
{
  krb5_context v12 = _Block_copy(aBlock);
  uint64_t v14 = __ApplePrivate_gss_acquire_cred_ex_f(0, a1, v13, a3, a4, a5, a6, (uint64_t)v12, (void (*)(uint64_t, void, uint64_t, void, void, uint64_t))complete_block);
  if (v14) {
    _Block_release(v12);
  }
  return v14;
}

uint64_t __ApplePrivate_gss_acquire_cred_ex_f(uint64_t a1, gss_name_t_desc_struct *a2, int a3, unsigned int a4, gss_const_OID member, unsigned int a6, uint64_t a7, uint64_t a8, void (*a9)(uint64_t, void, uint64_t, void, void, uint64_t))
{
  gss_name_t input_name = 0;
  if (!a9) {
    return 0x1000000;
  }
  gss_name_t v14 = a2;
  OM_uint32 v25 = 0;
  OM_uint32 minor_status = 0;
  input_name_buffer.size_t length = 0;
  input_name_buffer.value = 0;
  if (a2)
  {
    if (!member)
    {
LABEL_5:
      input_name_buffer.value = *(void **)(a7 + 24);
      input_name_buffer.size_t length = strlen((const char *)input_name_buffer.value);
      *(void *)present = 0;
      uint64_t v16 = __ApplePrivate_gss_acquire_cred_ext(&v25, (uint64_t)v14, &__gss_c_cred_password_oid_desc, (uint64_t)&input_name_buffer, a4, member, a6, present);
      if (input_name) {
        gss_release_name(&minor_status, &input_name);
      }
      if (!v16) {
        a9(a8, 0, a1, *(void *)present, 0, 0xFFFFFFFFLL);
      }
      return v16;
    }
  }
  else
  {
    *(void *)present = 0;
    long long v17 = *(const char **)(a7 + 8);
    if (!v17) {
      return 851968;
    }
    long long v18 = *(const char **)(a7 + 16);
    if (v18)
    {
      asprintf((char **)present, "%s@%s", *(const char **)(a7 + 8), v18);
      long long v19 = *(char **)present;
    }
    else
    {
      long long v19 = strdup(v17);
      *(void *)present = v19;
    }
    input_name_buffer.value = v19;
    input_name_buffer.size_t length = strlen(v19);
    uint64_t v16 = gss_import_name(&v25, &input_name_buffer, &__gss_c_nt_user_name_oid_desc, &input_name);
    free(*(void **)present);
    if (v16) {
      return v16;
    }
    gss_name_t v14 = input_name;
    if (!member) {
      goto LABEL_5;
    }
  }
  present[0] = 0;
  gss_test_oid_set_member(&minor_status, member, (gss_OID_set)_gss_mech_oids, present);
  if (present[0]) {
    goto LABEL_5;
  }
  if (input_name) {
    gss_release_name(&minor_status, &input_name);
  }
  return 0x10000;
}

void complete_block(void (**a1)(void, void, void, void, void), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  a1[2](a1, a3, a4, a5, a6);

  _Block_release(a1);
}

uint64_t _gss_mg_get_error(uint64_t a1, int a2, void *a3)
{
  krb5_error_code v5 = _gss_mechglue_thread();
  if (!v5) {
    return 327680;
  }
  krb5_error_code v6 = v5;
  if (*((_DWORD *)v5 + 2) != a2 || (size_t v7 = v5[2]) == 0)
  {
    if (a3)
    {
      *a3 = 0;
      a3[1] = 0;
    }
    return 327680;
  }
  krb5_error_code v8 = malloc_type_malloc(v7, 0x5698119EuLL);
  a3[1] = v8;
  if (v8)
  {
    int v9 = (const void *)v6[3];
    *a3 = v6[2];
    memcpy(v8, v9, v6[2]);
    return 0;
  }
  else
  {
    *a3 = 0;
    a3[1] = 0;
    return 851968;
  }
}

void *_gss_mechglue_thread()
{
  pthread_mutex_lock(&context_mutex);
  if ((created_key & 1) == 0)
  {
    if (pthread_key_create((pthread_key_t *)&context_key_0, (void (__cdecl *)(void *))destroy_context_0))
    {
      pthread_mutex_unlock(&context_mutex);
      return 0;
    }
    created_key = 1;
  }
  pthread_mutex_unlock(&context_mutex);
  krb5_context v0 = pthread_getspecific(context_key_0);
  if (!v0)
  {
    krb5_context v0 = malloc_type_calloc(1uLL, 0x28uLL, 0x10A0040A9FF75A4uLL);
    if (v0)
    {
      if (!pthread_setspecific(context_key_0, v0))
      {
        v0[4] = os_log_create("org.h5l.gss", "gss");
        return v0;
      }
      free(v0);
      return 0;
    }
  }
  return v0;
}

void _gss_mg_error(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 128))
  {
    unint64_t v4 = (gss_buffer_desc_struct *)_gss_mechglue_thread();
    if (v4)
    {
      krb5_error_code v5 = v4;
      OM_uint32 minor_status = 0;
      krb5_error_code v6 = v4 + 1;
      gss_release_buffer(&minor_status, v4 + 1);
      v5->size_t length = a1 + 16;
      LODWORD(v5->value) = a2;
      if ((*(unsigned int (**)(OM_uint32 *, uint64_t, uint64_t))(a1 + 128))(&minor_status, a2, 2))
      {
        v6->size_t length = 0;
        v6->value = 0;
      }
      else
      {
        _gss_mg_log(5, "_gss_mg_error: captured %.*s (%d) from underlaying mech %s", v7, v8, v9, v10, v11, v12, v5[1].length);
      }
    }
  }
}

void _gss_mg_log(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  gss_name_t v14 = 0;
  if (_gss_mg_log_level(a1))
  {
    uint64_t v11 = _gss_mechglue_thread();
    if (v11)
    {
      uint64_t v12 = v11;
      vasprintf(&v14, a2, &a9);
      int v13 = v12[4];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446210;
        uint64_t v16 = v14;
        _os_log_impl(&dword_213D4C000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }
      free(v14);
      if (log_func) {
        log_func(log_ctx, a1, a2, &a9);
      }
    }
  }
}

void gss_mg_collect_error(const gss_OID_desc *a1, uint64_t a2, uint64_t a3)
{
  mechanism = __gss_get_mechanism(a1);
  if (mechanism)
  {
    _gss_mg_error((uint64_t)mechanism, a3);
  }
}

uint64_t gss_mg_set_error_string(size_t a1, uint64_t a2, int a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  __s = 0;
  int v13 = (gss_buffer_desc_struct *)_gss_mechglue_thread();
  if (v13)
  {
    gss_name_t v14 = v13;
    OM_uint32 minor_status = 0;
    vasprintf(&__s, a4, &a9);
    if (__s)
    {
      gss_release_buffer(&minor_status, v14 + 1);
      v14->size_t length = a1;
      LODWORD(v14->value) = a3;
      krb5_error_code v15 = __s;
      v14[1].value = __s;
      size_t v16 = strlen(v15);
      v14[1].size_t length = v16;
      _gss_mg_log(5, "gss_mg_set_error_string: %.*s (%d/%d)", v17, v18, v19, v20, v21, v22, v16);
    }
  }
  return a2;
}

CFErrorRef _gss_mg_create_cferror(unsigned int a1, unsigned int a2, gss_OID_desc *a3)
{
  userInfoKeys[5] = *(void **)MEMORY[0x263EF8340];
  unsigned int v15 = a2;
  unsigned int valuePtr = a1;
  userInfoKeys[0] = @"kGSSMajorErrorCode";
  userInfoKeys[1] = @"kGSSMinorErrorCode";
  userInfoKeys[2] = @"kGSSMechanismOID";
  userInfoKeys[3] = @"kGSSMechanism";
  userInfoKeys[4] = *(void **)MEMORY[0x263EFFC48];
  CFStringRef v18 = 0;
  CFStringRef v19 = 0;
  CFStringRef v20 = 0;
  oid_str.size_t length = 0;
  oid_str.value = 0;
  OM_uint32 minor_status = 0;
  userInfoValues[0] = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  userInfoValues[1] = CFNumberCreate(0, kCFNumberSInt32Type, &v15);
  if (!a3)
  {
    CFStringRef v18 = CFStringCreateWithFormat(0, 0, @"no-mech");
LABEL_8:
    CFStringRef v5 = CFStringCreateWithFormat(0, 0, @"no mech given", v11);
    goto LABEL_9;
  }
  if (gss_oid_to_str(&minor_status, a3, &oid_str))
  {
    CFStringRef v18 = CFStringCreateWithFormat(0, 0, @"no-mech");
  }
  else
  {
    CFStringRef v18 = CFStringCreateWithFormat(0, 0, @"%.*s", oid_str.length, oid_str.value);
    gss_release_buffer(&minor_status, &oid_str);
  }
  uint64_t v4 = __ApplePrivate_gss_oid_to_name(a3);
  if (!v4) {
    goto LABEL_8;
  }
  CFStringRef v5 = CFStringCreateWithFormat(0, 0, @"%s", v4);
LABEL_9:
  CFStringRef v19 = v5;
  krb5_error_code v6 = _gss_mechglue_thread();
  if (v6 && v15 == *((_DWORD *)v6 + 2) && v6[2]) {
    CFStringRef v7 = CFStringCreateWithFormat(0, 0, @"%.*s", v6[2], v6[3]);
  }
  else {
    CFStringRef v7 = CFStringCreateWithFormat(0, 0, @"Unknown minor status: %d", v15, v12);
  }
  CFStringRef v20 = v7;
  CFErrorRef v8 = CFErrorCreateWithUserInfoKeysAndValues(0, @"org.h5l.GSS", valuePtr, (const void *const *)userInfoKeys, (const void *const *)userInfoValues, 5);
  for (uint64_t i = 0; i != 5; ++i)
    CFRelease(userInfoValues[i]);
  return v8;
}

CFPropertyListRef _gss_mg_copy_key(const __CFString *a1, const __CFString *a2)
{
  CFStringRef v4 = CFStringCreateWithFormat(0, 0, @"/Library/Preferences/%@.plist", a1);
  if (v4)
  {
    CFStringRef v5 = v4;
    krb5_error_code v6 = CopyKeyFromFile(v4, a2);
    CFRelease(v5);
    if (v6) {
      return v6;
    }
  }
  if (!krb5_homedir_access()) {
    return 0;
  }
  krb5_error_code v6 = CFPreferencesCopyAppValue(a2, a1);
  if (v6) {
    return v6;
  }
  CFStringRef v7 = (const __CFString *)*MEMORY[0x263EFFE58];
  CFStringRef v8 = (const __CFString *)*MEMORY[0x263EFFE50];

  return CFPreferencesCopyValue(a2, a1, v7, v8);
}

uint64_t gss_set_log_function(uint64_t result, void *a2)
{
  if (!log_func)
  {
    log_func = a2;
    log_uint64_t ctx = result;
  }
  return result;
}

BOOL _gss_mg_log_level(int a1)
{
  heim_base_once_f();
  if (config_token != -1)
  {
    int check = 0;
    if (notify_check(config_token, &check)) {
      BOOL v2 = 1;
    }
    else {
      BOOL v2 = check == 0;
    }
    if (!v2) {
      init_log();
    }
  }
  return log_level >= a1;
}

uint64_t setup_logging()
{
  init_log();

  return notify_register_check("com.apple.ManagedConfiguration.profileListChanged", &config_token);
}

const void *init_log()
{
  CFPropertyListRef v0 = _gss_mg_copy_key(@"com.apple.GSS", @"DebugLevel");
  if (v0
    || (!geteuid() || !krb5_homedir_access()
      ? (uint64_t result = CopyKeyFromFile(@"/Library/Managed Preferences/mobile/.GlobalPreferences.plist", @"GSSDebugLevel")): (uint64_t result = CFPreferencesCopyAppValue(@"GSSDebugLevel", @".GlobalPreferences")), (v0 = result) != 0))
  {
    pthread_mutex_lock(&log_mutex);
    CFTypeID v2 = CFGetTypeID(v0);
    if (v2 == CFBooleanGetTypeID())
    {
      log_level = CFBooleanGetValue((CFBooleanRef)v0) != 0;
    }
    else
    {
      CFTypeID v3 = CFGetTypeID(v0);
      if (v3 == CFNumberGetTypeID()) {
        CFNumberGetValue((CFNumberRef)v0, kCFNumberIntType, &log_level);
      }
    }
    CFRelease(v0);
    return (const void *)pthread_mutex_unlock(&log_mutex);
  }
  return result;
}

void _gss_mg_log_name(uint64_t a1, uint64_t a2, const gss_OID_desc *a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  OM_uint32 v25 = 0;
  if (_gss_mg_log_level(a1))
  {
    mechanism = __gss_get_mechanism(a3);
    if (mechanism)
    {
      gss_name_t v14 = mechanism;
      OM_uint32 minor_status = 0;
      if (!_gss_find_mn(&minor_status, a2, a3, &v25))
      {
        buffer.size_t length = 0;
        buffer.value = 0;
        if (v25)
        {
          if (((unsigned int (*)(OM_uint32 *, void *, gss_buffer_desc_struct *, void))v14[19])(&minor_status, v25[1].elements, &buffer, 0))
          {
            return;
          }
        }
        else
        {
          buffer.size_t length = 7;
          buffer.value = "no name";
        }
        uint64_t v22 = 0;
        vasprintf(&v22, a4, &a9);
        if (v22)
        {
          _gss_mg_log(a1, "%s %.*s", v15, v16, v17, v18, v19, v20, (char)v22);
          uint64_t v21 = v22;
        }
        else
        {
          uint64_t v21 = 0;
        }
        free(v21);
        if (v25) {
          gss_release_buffer(&minor_status, &buffer);
        }
      }
    }
  }
}

void _gss_mg_log_cred(int a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (_gss_mg_log_level(a1))
  {
    uint64_t v18 = 0;
    vasprintf(&v18, a3, &a9);
    if (a2)
    {
      for (uint64_t i = *(void **)(a2 + 16); i; uint64_t i = (void *)*i)
        _gss_mg_log(1, "%s: %s", v11, v12, v13, v14, v15, v16, (char)v18);
    }
    else
    {
      _gss_mg_log(1, "%s: GSS_C_NO_CREDENTIAL", v11, v12, v13, v14, v15, v16, (char)v18);
    }
    free(v18);
  }
}

uint64_t _gss_load_plugins()
{
  return heim_base_once_f();
}

uint64_t load_plugins()
{
  krb5_context v1 = 0;
  uint64_t result = krb5_init_context(&v1);
  if (!result)
  {
    krb5_load_plugins();
    return heim_release();
  }
  return result;
}

void destroy_context_0(gss_buffer_desc_struct *a1)
{
  if (a1)
  {
    OM_uint32 minor_status = 0;
    gss_release_buffer(&minor_status, a1 + 1);
    size_t length = (void *)a1[2].length;
    if (length) {
      os_release(length);
    }
    free(a1);
  }
}

const void *CopyKeyFromFile(CFStringRef filePath, const void *a2)
{
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFURLRef v4 = CFURLCreateWithFileSystemPath((CFAllocatorRef)*MEMORY[0x263EFFB08], filePath, kCFURLPOSIXPathStyle, 0);
  if (!v4) {
    return 0;
  }
  CFURLRef v5 = v4;
  krb5_error_code v6 = CFReadStreamCreateWithFile(v3, v4);
  CFRelease(v5);
  if (!v6) {
    return 0;
  }
  if (!CFReadStreamOpen(v6))
  {
    uint64_t v11 = v6;
LABEL_11:
    CFRelease(v11);
    return 0;
  }
  CFErrorRef error = 0;
  CFStringRef v7 = (void *)CFPropertyListCreateWithStream(v3, v6, 0, 0, 0, &error);
  CFRelease(v6);
  if (!v7) {
    return 0;
  }
  CFTypeID v8 = CFGetTypeID(v7);
  if (v8 != CFDictionaryGetTypeID())
  {
    uint64_t v11 = (__CFReadStream *)v7;
    goto LABEL_11;
  }
  CFArrayRef Value = CFDictionaryGetValue((CFDictionaryRef)v7, a2);
  uint64_t v10 = Value;
  if (Value) {
    CFRetain(Value);
  }
  CFRelease(v7);
  return v10;
}

OM_uint32 gss_accept_sec_context(OM_uint32 *minor_status, gss_ctx_id_t *context_handle, gss_cred_id_t acceptor_cred_handle, gss_buffer_t input_token, gss_channel_bindings_t input_chan_bindings, gss_name_t *src_name, gss_OID *mech_type, gss_buffer_t output_token, OM_uint32 *ret_flags, OM_uint32 *time_rec, gss_cred_id_t *delegated_cred_handle)
{
  gss_cred_id_t v15 = acceptor_cred_handle;
  gss_ctx_id_t v18 = *context_handle;
  gss_const_OID a = 0;
  *OM_uint32 minor_status = 0;
  if (src_name) {
    *src_name = 0;
  }
  if (mech_type) {
    *mech_type = 0;
  }
  if (ret_flags) {
    *ret_flags = 0;
  }
  if (time_rec) {
    *time_rec = 0;
  }
  if (delegated_cred_handle) {
    *delegated_gss_cred_id_t cred_handle = 0;
  }
  if (output_token)
  {
    output_token->size_t length = 0;
    output_token->value = 0;
  }
  gss_cred_id_t cred_handle = 0;
  *(void *)minor_statusgss_const_OID a = 0;
  uint64_t v79 = 0;
  _gss_mg_check_credential(acceptor_cred_handle);
  if (*context_handle)
  {
    uint64_t v25 = *(void *)v18;
    goto LABEL_15;
  }
  size_t length = input_token->length;
  if (!input_token->length)
  {
LABEL_67:
    krb5_int32 v49 = &__gss_spnego_mechanism_oid_desc;
    goto LABEL_68;
  }
  value = input_token->value;
  if (length == 1)
  {
    OM_uint32 v34 = 589824;
LABEL_65:
    if (*value != 110)
    {
      _gss_mg_log(10, "Don't have client request mech", v19, v20, v21, v22, v23, v24, v76);
      return v34;
    }
    krb5_int32 v49 = &__gss_krb5_mechanism_oid_desc;
    goto LABEL_68;
  }
  *(void *)&v82.size_t length = 0;
  unint64_t v45 = value[1];
  unint64_t v46 = length - 2;
  if ((char)value[1] < 0)
  {
    unint64_t v63 = v45 & 0x7F;
    unint64_t v64 = v46 - v63;
    if (v46 < v63) {
      goto LABEL_59;
    }
    size_t v47 = value + 2;
    unint64_t v45 = 0;
    if (v63)
    {
      unint64_t v73 = v63;
      do
      {
        unsigned int v74 = *v47++;
        unint64_t v45 = v74 | (v45 << 8);
        --v73;
      }
      while (v73);
      size_t v47 = &value[v63 + 2];
      unint64_t v46 = v64;
    }
  }
  else
  {
    size_t v47 = value + 2;
  }
  OM_uint32 v34 = 589824;
  if (v46 < 2 || v45 != v46) {
    goto LABEL_60;
  }
  if (*v47 != 6)
  {
LABEL_59:
    OM_uint32 v34 = 589824;
    goto LABEL_60;
  }
  OM_uint32 v34 = 589824;
  if (((char)v47[1] & 0x80000000) == 0 && v46 - 2 >= v47[1])
  {
    v82.size_t length = v47[1];
    v82.elements = v47 + 2;
    size_t v48 = _gss_mg_support_mechanism(&v82);
    if (v48)
    {
      krb5_int32 v49 = (gss_OID_desc *)v48;
      goto LABEL_68;
    }
    size_t length = input_token->length;
    OM_uint32 v34 = 0x10000;
  }
LABEL_60:
  if (length < 9)
  {
    if (length)
    {
      value = input_token->value;
      goto LABEL_65;
    }
    goto LABEL_67;
  }
  value = input_token->value;
  if (*(void *)value != 0x5053534D4C544ELL) {
    goto LABEL_65;
  }
  krb5_int32 v49 = &__gss_ntlm_mechanism_oid_desc;
LABEL_68:
  krb5_data v65 = (gss_ctx_id_t_desc_struct *)malloc_type_malloc(0x18uLL, 0x20040960023A9uLL);
  if (!v65)
  {
    *OM_uint32 minor_status = 12;
    return 589824;
  }
  gss_ctx_id_t v18 = v65;
  *(void *)krb5_data v65 = 0;
  *((void *)v65 + 1) = 0;
  *((void *)v65 + 2) = 0;
  mechanism = __gss_get_mechanism(v49);
  *(void *)gss_ctx_id_t v18 = mechanism;
  if (!mechanism)
  {
    free(v18);
    _gss_mg_log(10, "mechanism client used is unknown", v67, v68, v69, v70, v71, v72, v76);
    return 0x10000;
  }
  uint64_t v25 = (uint64_t)mechanism;
  *context_handle = v18;
LABEL_15:
  if ((*(unsigned char *)(v25 + 32) & 1) == 0 && v15)
  {
    int v26 = (void *)((char *)v15 + 16);
    int v27 = v26;
    while (1)
    {
      int v27 = (void *)*v27;
      if (!v27) {
        break;
      }
      if (v27[1] == v25)
      {
        gss_cred_id_t v15 = (gss_cred_id_t)v27[3];
        goto LABEL_21;
      }
    }
    gss_delete_sec_context(minor_statusa, context_handle, 0);
    _gss_mg_log(10, "gss-asc: client sent mech %s but no credential was matching", v50, v51, v52, v53, v54, v55, *(void *)(v25 + 8));
    size_t v62 = (void *)*v26;
    if (*v26)
    {
      do
      {
        _gss_mg_log(10, "gss-asc: available creds where %s", v56, v57, v58, v59, v60, v61, *(void *)(v62[1] + 8));
        size_t v62 = (void *)*v62;
      }
      while (v62);
    }
    return 0x10000;
  }
LABEL_21:
  gss_cred_id_t cred_handle = 0;
  minor_statusa[1] = 0;
  OM_uint32 v34 = (*(uint64_t (**)(OM_uint32 *, uint64_t, gss_cred_id_t, gss_buffer_t, gss_channel_bindings_t, uint64_t *, gss_const_OID *, gss_buffer_t, OM_uint32 *, OM_uint32 *, gss_cred_id_t *))(v25 + 64))(minor_status, (uint64_t)v18 + 8, v15, input_token, input_chan_bindings, &v79, &a, output_token, &minor_statusa[1], time_rec, &cred_handle);
  if (v34 >= 2)
  {
    _gss_mg_error(v25, *minor_status);
    gss_delete_sec_context(minor_statusa, context_handle, 0);
    return v34;
  }
  if (mech_type) {
    *mech_type = (gss_OID)a;
  }
  if (src_name && v79)
  {
    name = (gss_name_t_desc_struct *)_gss_create_name(v79, v25);
    if (!name)
    {
      (*(void (**)(OM_uint32 *, uint64_t *))(v25 + 176))(minor_status, &v79);
      goto LABEL_55;
    }
    *src_name = name;
  }
  else if (v79)
  {
    (*(void (**)(OM_uint32 *, uint64_t *))(v25 + 176))(minor_status, &v79);
  }
  if ((minor_statusa[1] & 1) == 0) {
    goto LABEL_84;
  }
  int v38 = *(_DWORD *)(v25 + 32);
  uint64_t v39 = delegated_cred_handle;
  if (!delegated_cred_handle)
  {
    if (v38) {
      gss_release_cred(minor_status, &cred_handle);
    }
    else {
      (*(void (**)(OM_uint32 *, gss_cred_id_t *))(v25 + 48))(minor_status, &cred_handle);
    }
    minor_statusa[1] &= 0xFFFF7FFE;
    goto LABEL_84;
  }
  if (v38)
  {
    gss_cred_id_t v41 = cred_handle;
  }
  else
  {
    int v40 = gss_oid_equal(a, (gss_const_OID)(v25 + 16));
    gss_cred_id_t v41 = cred_handle;
    if (v40)
    {
      if (!cred_handle) {
        goto LABEL_84;
      }
      uint64_t v42 = _gss_mg_alloc_cred();
      if (v42)
      {
        uint64_t v43 = (gss_cred_id_t_desc_struct *)v42;
        size_t v44 = malloc_type_malloc(0x20uLL, 0x20040DC1BFBCFuLL);
        if (v44)
        {
          v44[1] = v25;
          v44[2] = v25 + 16;
          v44[3] = cred_handle;
          void *v44 = *((void *)v43 + 2);
          *((void *)v43 + 2) = v44;
          *delegated_gss_cred_id_t cred_handle = v43;
          goto LABEL_84;
        }
        free(v43);
      }
      *OM_uint32 minor_status = 12;
LABEL_55:
      gss_delete_sec_context(minor_statusa, context_handle, 0);
      return 851968;
    }
    uint64_t v39 = delegated_cred_handle;
  }
  *uint64_t v39 = v41;
LABEL_84:
  _gss_mg_log(10, "gss-asc: return %d/%d", v28, v29, v30, v31, v32, v33, v34);
  if (ret_flags) {
    *ret_flags = minor_statusa[1];
  }
  return v34;
}

OM_uint32 gss_acquire_cred(OM_uint32 *minor_status, gss_name_t desired_name, OM_uint32 time_req, gss_OID_set desired_mechs, gss_cred_usage_t cred_usage, gss_cred_id_t *output_cred_handle, gss_OID_set *actual_mechs, OM_uint32 *time_rec)
{
  *OM_uint32 minor_status = 0;
  if (!output_cred_handle) {
    return 0x1000000;
  }
  CFTypeID v8 = time_rec;
  uint64_t v11 = *(void *)&cred_usage;
  if (actual_mechs) {
    *actual_mechs = 0;
  }
  if (time_rec) {
    *time_rec = 0;
  }
  minor_statusgss_const_OID a = 0;
  uint64_t v52 = 0;
  uint64_t v53 = 0;
  unsigned int v51 = 0;
  _gss_load_mech();
  if (!desired_mechs) {
    goto LABEL_16;
  }
  size_t count = desired_mechs->count;
  if (desired_mechs->count)
  {
    OM_uint32 v48 = time_req;
    uint64_t v17 = 0;
    size_t v18 = 0;
    do
    {
      present[0] = 0;
      gss_test_oid_set_member(minor_status, &desired_mechs->elements[v17], (gss_OID_set)_gss_mech_oids, present);
      size_t v19 = desired_mechs->count;
      if (present[0]) {
        break;
      }
      ++v18;
      ++v17;
    }
    while (v18 < v19);
    BOOL v20 = v18 == v19;
    time_req = v48;
    if (!v20)
    {
LABEL_16:
      if (actual_mechs)
      {
        OM_uint32 result = gss_create_empty_oid_set(minor_status, actual_mechs);
        if (result) {
          return result;
        }
        uint64_t v22 = _gss_mg_alloc_cred();
        if (!v22)
        {
          gss_release_oid_set(minor_status, actual_mechs);
LABEL_45:
          OM_uint32 result = 851968;
          LODWORD(count) = 12;
          goto LABEL_54;
        }
      }
      else
      {
        uint64_t v22 = _gss_mg_alloc_cred();
        if (!v22) {
          goto LABEL_45;
        }
      }
      gss_cred_id_t cred_handle = output_cred_handle;
      uint64_t v44 = v22;
      if (desired_mechs) {
        gss_OID_set v28 = desired_mechs;
      }
      else {
        gss_OID_set v28 = (gss_OID_set)_gss_mech_oids;
      }
      uint64_t v52 = 1;
      if (!v28->count)
      {
        unsigned int v47 = -1;
LABEL_47:
        if (*(void *)(v44 + 16))
        {
          _gss_mg_log_cred(10, v44, "gss_acquire_cred", v23, v24, v25, v26, v27, v42);
          if (v8) {
            OM_uint32 *v8 = v47;
          }
          LODWORD(count) = 0;
          OM_uint32 result = 0;
          *gss_cred_id_t cred_handle = (gss_cred_id_t)v44;
        }
        else
        {
          *gss_cred_id_t cred_handle = (gss_cred_id_t)v44;
          gss_release_cred(&minor_statusa, cred_handle);
          if (actual_mechs) {
            gss_release_oid_set(&minor_statusa, actual_mechs);
          }
          LODWORD(count) = 0;
          OM_uint32 result = 458752;
        }
        goto LABEL_54;
      }
      OM_uint32 v49 = time_req;
      uint64_t v29 = 0;
      size_t v30 = 0;
      unsigned int v47 = -1;
      unint64_t v46 = v8;
      unsigned int v45 = v11;
      while (1)
      {
        *(void *)present = 0;
        mechanism = __gss_get_mechanism(&v28->elements[v29]);
        if (!mechanism) {
          goto LABEL_43;
        }
        uint64_t v32 = mechanism;
        if ((mechanism[4] & 1) != 0
          || desired_name
          && _gss_find_mn(minor_status, (uint64_t)desired_name, &v28->elements[v29], (gss_OID_desc **)present))
        {
          goto LABEL_43;
        }
        uint64_t v33 = (gss_const_OID *)malloc_type_malloc(0x20uLL, 0x20040DC1BFBCFuLL);
        if (!v33) {
          goto LABEL_43;
        }
        OM_uint32 v34 = v33;
        v33[1] = (gss_const_OID)v32;
        v33[2] = (gss_const_OID)(v32 + 2);
        uint64_t v53 = &v28->elements[v29];
        if (*(void *)present) {
          uint64_t v35 = *(void *)(*(void *)present + 24);
        }
        else {
          uint64_t v35 = 0;
        }
        int v36 = ((uint64_t (*)(OM_uint32 *, uint64_t, void, uint64_t *, uint64_t, gss_const_OID *, void, unsigned int *))v32[5])(minor_status, v35, v49, &v52, v11, v33 + 3, 0, &v51);
        _gss_mg_log_name(10, (uint64_t)desired_name, &v28->elements[v29], "gss_acquire_cred %s name: %ld/%ld", v37, v38, v39, v40, v32[1]);
        if (!v36)
        {
          unsigned int v41 = v47;
          if (v51 < v47) {
            unsigned int v41 = v51;
          }
          unsigned int v47 = v41;
          if (!actual_mechs || !gss_add_oid_set_member(minor_status, v34[2], actual_mechs))
          {
            *OM_uint32 v34 = *(gss_const_OID *)(v44 + 16);
            *(void *)(v44 + 16) = v34;
            goto LABEL_42;
          }
          ((void (*)(OM_uint32 *, gss_const_OID *))v32[6])(minor_status, v34 + 3);
        }
        free(v34);
LABEL_42:
        CFTypeID v8 = v46;
        uint64_t v11 = v45;
LABEL_43:
        ++v30;
        ++v29;
        if (v30 >= v28->count) {
          goto LABEL_47;
        }
      }
    }
    LODWORD(count) = 0;
  }
  OM_uint32 result = 0x10000;
LABEL_54:
  *OM_uint32 minor_status = count;
  return result;
}

void *_gss_copy_cred(void *a1)
{
  unsigned int v9 = 0;
  uint64_t v8 = 0;
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  unsigned int v5 = 0;
  uint64_t v2 = a1[1];
  if ((*(unsigned int (**)(unsigned int *, void, void, uint64_t *, char *, uint64_t *, unsigned int *))(v2 + 216))(&v9, a1[3], a1[2], &v8, (char *)&v6 + 4, &v6, &v5)|| (int v3 = (*(uint64_t (**)(unsigned int *, void, uint64_t, void, void, void, void, uint64_t *, void, void, void))(v2 + 208))(&v9, 0, v8, a1[2], v5, HIDWORD(v6), v6, &v7, 0, 0, 0),
        (*(void (**)(unsigned int *, uint64_t *))(v2 + 176))(&v9, &v8),
        v3))
  {
    _gss_mg_error(v2, v9);
  }
  else
  {
    OM_uint32 result = malloc_type_malloc(0x20uLL, 0x20040DC1BFBCFuLL);
    if (result)
    {
      result[1] = v2;
      result[2] = v2 + 16;
      result[3] = v7;
      return result;
    }
    (*(void (**)(unsigned int *, uint64_t *))(v2 + 48))(&v9, &v7);
  }
  return 0;
}

OM_uint32 gss_add_cred(OM_uint32 *minor_status, gss_cred_id_t input_cred_handle, gss_name_t desired_name, gss_OID desired_mech, gss_cred_usage_t cred_usage, OM_uint32 initiator_time_req, OM_uint32 acceptor_time_req, gss_cred_id_t *output_cred_handle, gss_OID_set *actual_mechs, OM_uint32 *initiator_time_rec, OM_uint32 *acceptor_time_rec)
{
  *OM_uint32 minor_status = 0;
  *output_gss_cred_id_t cred_handle = 0;
  if (initiator_time_rec) {
    *initiator_time_rec = 0;
  }
  if (acceptor_time_rec) {
    *acceptor_time_rec = 0;
  }
  if (actual_mechs) {
    *actual_mechs = 0;
  }
  uint64_t v17 = _gss_mg_alloc_cred();
  if (!v17) {
    goto LABEL_27;
  }
  size_t v18 = (gss_cred_id_t_desc_struct *)v17;
  int v36 = 0;
  gss_cred_id_t cred_handle = 0;
  minor_statusgss_const_OID a = 0;
  OM_uint32 v32 = acceptor_time_req;
  if (input_cred_handle)
  {
    for (uint64_t i = (uint64_t **)*((void *)input_cred_handle + 2); i; uint64_t i = (uint64_t **)*i)
    {
      if (gss_oid_equal((gss_const_OID)i[2], desired_mech)) {
        break;
      }
      BOOL v20 = _gss_copy_cred(i);
      if (!v20) {
        goto LABEL_26;
      }
      *BOOL v20 = *((void *)v18 + 2);
      *((void *)v18 + 2) = v20;
    }
  }
  else
  {
    uint64_t i = 0;
  }
  if (!desired_name)
  {
    int v36 = 0;
LABEL_20:
    uint64_t v31 = output_cred_handle;
    mechanism = __gss_get_mechanism(desired_mech);
    if (!mechanism || (uint64_t v25 = (uint64_t)mechanism, (mechanism[4] & 1) != 0))
    {
      gss_cred_id_t cred_handle = v18;
      gss_release_cred(&minor_statusa, &cred_handle);
      *OM_uint32 minor_status = 0;
      return 851968;
    }
    uint64_t v26 = (gss_cred_id_t_desc_struct *)malloc_type_malloc(0x20uLL, 0x20040DC1BFBCFuLL);
    if (v26)
    {
      *((void *)v26 + 1) = v25;
      *((void *)v26 + 2) = v25 + 16;
      if (i) {
        uint64_t v27 = i[3];
      }
      else {
        uint64_t v27 = 0;
      }
      if (desired_name) {
        elements = v36[1].elements;
      }
      else {
        elements = 0;
      }
      size_t v30 = v26;
      OM_uint32 v22 = (*(uint64_t (**)(OM_uint32 *, uint64_t *, void *, gss_OID, void, void, void, void *, gss_OID_set *, OM_uint32 *, OM_uint32 *))(v25 + 208))(minor_status, v27, elements, desired_mech, cred_usage, initiator_time_req, v32, (void *)v26 + 3, actual_mechs, initiator_time_rec, acceptor_time_rec);
      if (!v22)
      {
        *(void *)size_t v30 = *((void *)v18 + 2);
        *((void *)v18 + 2) = v30;
        gss_cred_id_t *v31 = v18;
        return v22;
      }
      _gss_mg_error(v25, *minor_status);
      gss_cred_id_t cred_handle = v18;
      gss_release_cred(&minor_statusa, &cred_handle);
      uint64_t v23 = v30;
      goto LABEL_18;
    }
LABEL_26:
    gss_cred_id_t cred_handle = v18;
    gss_release_cred(&minor_statusa, &cred_handle);
LABEL_27:
    *OM_uint32 minor_status = 12;
    return 851968;
  }
  OM_uint32 mn = _gss_find_mn(minor_status, (uint64_t)desired_name, desired_mech, &v36);
  if (!mn) {
    goto LABEL_20;
  }
  OM_uint32 v22 = mn;
  uint64_t v23 = v18;
LABEL_18:
  free(v23);
  return v22;
}

OM_uint32 gss_add_oid_set_member(OM_uint32 *minor_status, gss_const_OID member_oid, gss_OID_set *oid_set)
{
  int present = 0;
  OM_uint32 result = gss_test_oid_set_member(minor_status, member_oid, *oid_set, &present);
  if (!result)
  {
    if (present)
    {
      OM_uint32 v7 = 0;
      OM_uint32 result = 0;
    }
    else
    {
      size_t count = (*oid_set)->count;
      unsigned int v9 = (gss_OID_desc_struct *)malloc_type_realloc((*oid_set)->elements, 16 * (count + 1), 0x10800407411B482uLL);
      if (v9)
      {
        uint64_t v10 = v9;
        OM_uint32 v7 = 0;
        OM_uint32 result = 0;
        (*oid_set)->elements = v10;
        gss_OID_set v11 = *oid_set;
        v11->size_t count = count + 1;
        v11->elements[count] = *member_oid;
      }
      else
      {
        OM_uint32 result = 851968;
        OM_uint32 v7 = 12;
      }
    }
    *OM_uint32 minor_status = v7;
  }
  return result;
}

uint64_t __ApplePrivate_gss_wrap_iov(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, _DWORD *a5, uint64_t a6, int a7)
{
  if (a1) {
    *a1 = 0;
  }
  if (a5) {
    *a5 = 0;
  }
  if (!a2) {
    return 0x80000;
  }
  if (!a6 && a7) {
    return 0x1000000;
  }
  uint64_t v8 = *(uint64_t (**)(void))(*(void *)a2 + 312);
  if (v8) {
    return v8();
  }
  else {
    return 0x100000;
  }
}

uint64_t __ApplePrivate_gss_unwrap_iov(_DWORD *a1, uint64_t a2, _DWORD *a3, _DWORD *a4, uint64_t a5, int a6)
{
  if (a1) {
    *a1 = 0;
  }
  if (a3) {
    *a3 = 0;
  }
  if (a4) {
    *a4 = 0;
  }
  if (!a2) {
    return 0x80000;
  }
  if (!a5 && a6) {
    return 0x1000000;
  }
  OM_uint32 v7 = *(uint64_t (**)(void))(*(void *)a2 + 320);
  if (v7) {
    return v7();
  }
  else {
    return 0x100000;
  }
}

uint64_t __ApplePrivate_gss_wrap_iov_length(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, _DWORD *a5, uint64_t a6, int a7)
{
  if (a1) {
    *a1 = 0;
  }
  if (a5) {
    *a5 = 0;
  }
  if (!a2) {
    return 0x80000;
  }
  if (!a6 && a7) {
    return 0x1000000;
  }
  uint64_t v8 = *(uint64_t (**)(void))(*(void *)a2 + 328);
  if (v8) {
    return v8();
  }
  else {
    return 0x100000;
  }
}

uint64_t __ApplePrivate_gss_release_iov_buffer(_DWORD *a1, uint64_t a2, int a3)
{
  if (a1) {
    *a1 = 0;
  }
  if (!a2 && a3) {
    return 0x1000000;
  }
  if (a3 >= 1)
  {
    OM_uint32 minor_status = 0;
    uint64_t v4 = a3;
    unsigned int v5 = (gss_buffer_desc_struct *)(a2 + 8);
    do
    {
      if ((BYTE2(v5[-1].value) & 2) != 0)
      {
        gss_release_buffer(&minor_status, v5);
        LODWORD(v5[-1].value) &= ~0x20000u;
      }
      unsigned int v5 = (gss_buffer_desc_struct *)((char *)v5 + 24);
      --v4;
    }
    while (v4);
  }
  return 0;
}

unsigned __int16 *_gss_mg_find_buffer(unsigned __int16 *result, int a2, int a3)
{
  if (a2 < 1) {
    return 0;
  }
  uint64_t v3 = a2;
  while (*result != a3)
  {
    result += 12;
    if (!--v3) {
      return 0;
    }
  }
  return result;
}

uint64_t _gss_mg_allocate_buffer(_DWORD *a1, uint64_t a2, size_t size)
{
  if ((*(unsigned char *)(a2 + 2) & 2) != 0)
  {
    if (*(void *)(a2 + 8) == size) {
      return 0;
    }
    free(*(void **)(a2 + 16));
  }
  OM_uint32 v7 = malloc_type_malloc(size, 0x18EC9FAEuLL);
  *(void *)(a2 + 8) = size;
  *(void *)(a2 + 16) = v7;
  if (v7)
  {
    uint64_t result = 0;
    *(_DWORD *)a2 |= 0x20000u;
  }
  else
  {
    *a1 = 12;
    return 851968;
  }
  return result;
}

uint64_t __ApplePrivate_gss_context_query_attributes(_DWORD *a1, int a2, gss_const_OID b, void *a4, size_t a5)
{
  if (a1) {
    *a1 = 0;
  }
  if (!gss_oid_equal(&__gss_c_attr_stream_sizes_oid_desc, b)) {
    return 851968;
  }
  bzero(a4, a5);
  return 0;
}

OM_uint32 gss_create_empty_buffer_set(OM_uint32 *minor_status, gss_buffer_set_t *buffer_set)
{
  uint64_t v4 = (gss_buffer_set_desc_struct *)malloc_type_malloc(0x10uLL, 0x10200405730B0C9uLL);
  if (v4)
  {
    unsigned int v5 = v4;
    OM_uint32 v6 = 0;
    OM_uint32 result = 0;
    v5->size_t count = 0;
    v5->elements = 0;
    *buffer_set = v5;
  }
  else
  {
    OM_uint32 result = 851968;
    OM_uint32 v6 = 12;
  }
  *OM_uint32 minor_status = v6;
  return result;
}

OM_uint32 gss_add_buffer_set_member(OM_uint32 *minor_status, gss_buffer_t member_buffer, gss_buffer_set_t *buffer_set)
{
  gss_buffer_set_t v5 = *buffer_set;
  if (*buffer_set)
  {
    size_t v6 = 16 * v5->count + 16;
  }
  else
  {
    uint64_t v8 = (gss_buffer_set_desc_struct *)malloc_type_malloc(0x10uLL, 0x10200405730B0C9uLL);
    if (!v8)
    {
LABEL_8:
      OM_uint32 result = 851968;
      OM_uint32 v13 = 12;
      goto LABEL_9;
    }
    gss_buffer_set_t v5 = v8;
    v8->size_t count = 0;
    v8->elements = 0;
    *buffer_set = v8;
    size_t v6 = 16;
    *OM_uint32 minor_status = 0;
  }
  unsigned int v9 = (gss_buffer_desc *)malloc_type_realloc(v5->elements, v6, 0x108004057E67DB5uLL);
  v5->elements = v9;
  if (!v9) {
    goto LABEL_8;
  }
  uint64_t v10 = v9;
  size_t count = v5->count;
  uint64_t v12 = malloc_type_malloc(member_buffer->length, 0xCA4073C5uLL);
  v10[count].value = v12;
  if (!v12) {
    goto LABEL_8;
  }
  memcpy(v12, member_buffer->value, member_buffer->length);
  OM_uint32 v13 = 0;
  OM_uint32 result = 0;
  v10[count].size_t length = member_buffer->length;
  ++v5->count;
LABEL_9:
  *OM_uint32 minor_status = v13;
  return result;
}

OM_uint32 gss_release_buffer_set(OM_uint32 *minor_status, gss_buffer_set_t *buffer_set)
{
  *OM_uint32 minor_status = 0;
  gss_buffer_set_t v2 = *buffer_set;
  if (*buffer_set)
  {
    minor_statusgss_const_OID a = 0;
    if (v2->count)
    {
      uint64_t v4 = 0;
      size_t v5 = 0;
      do
      {
        gss_release_buffer(&minor_statusa, &v2->elements[v4]);
        ++v5;
        gss_buffer_set_t v2 = *buffer_set;
        ++v4;
      }
      while (v5 < (*buffer_set)->count);
    }
    free(v2->elements);
    (*buffer_set)->elements = 0;
    free(*buffer_set);
    *buffer_set = 0;
  }
  return 0;
}

OM_uint32 gss_canonicalize_name(OM_uint32 *minor_status, gss_name_t input_name, gss_OID mech_type, gss_name_t *output_name)
{
  uint64_t v12 = 0;
  OM_uint32 v13 = 0;
  *OM_uint32 minor_status = 0;
  *gss_name_t output_name = 0;
  OM_uint32 mn = _gss_find_mn(minor_status, (uint64_t)input_name, mech_type, &v13);
  if (!mn)
  {
    if (v13)
    {
      elements = (uint64_t (**)(OM_uint32 *, void *, gss_OID, uint64_t *))v13->elements;
      OM_uint32 v10 = elements[32](minor_status, v13[1].elements, mech_type, &v12);
      if (v10)
      {
        OM_uint32 mn = v10;
        _gss_mg_error((uint64_t)elements, *minor_status);
      }
      else
      {
        *OM_uint32 minor_status = 0;
        name = (gss_name_t_desc_struct *)_gss_create_name(v12, (uint64_t)elements);
        if (name)
        {
          OM_uint32 mn = 0;
          *gss_name_t output_name = name;
        }
        else
        {
          ((void (*)(OM_uint32 *, uint64_t *))elements[22])(minor_status, &v12);
          *OM_uint32 minor_status = 12;
          return 851968;
        }
      }
    }
    else
    {
      return 0x20000;
    }
  }
  return mn;
}

OM_uint32 gss_compare_name(OM_uint32 *minor_status, gss_name_t name1_arg, gss_name_t name2_arg, int *name_equal)
{
  if (*((void *)name1_arg + 5) && *((void *)name2_arg + 5))
  {
    *name_equal = 1;
    if (gss_oid_equal((gss_const_OID)name1_arg + 1, (gss_const_OID)name2_arg + 1)
      && *((void *)name1_arg + 4) == *((void *)name2_arg + 4))
    {
      goto LABEL_6;
    }
  }
  else
  {
    gss_OID_set v11 = 0;
    unsigned int v9 = (gss_const_OID *)((char *)name1_arg + 48);
    while (1)
    {
      unsigned int v9 = (gss_const_OID *)*v9;
      if (!v9) {
        break;
      }
      if (_gss_find_mn(minor_status, (uint64_t)name2_arg, v9[2], &v11)) {
        BOOL v10 = 1;
      }
      else {
        BOOL v10 = v11 == 0;
      }
      if (!v10) {
        return (*(uint64_t (**)(OM_uint32 *, gss_const_OID, void *, int *))&v9[1][9].length)(minor_status, v9[3], v11[1].elements, name_equal);
      }
    }
  }
  *name_equal = 0;
LABEL_6:
  OM_uint32 result = 0;
  *OM_uint32 minor_status = 0;
  return result;
}

OM_uint32 gss_context_time(OM_uint32 *minor_status, gss_ctx_id_t context_handle, OM_uint32 *time_rec)
{
  return (*(uint64_t (**)(OM_uint32 *, void, OM_uint32 *))(*(void *)context_handle + 88))(minor_status, *((void *)context_handle + 1), time_rec);
}

OM_uint32 gss_create_empty_oid_set(OM_uint32 *minor_status, gss_OID_set *oid_set)
{
  *OM_uint32 minor_status = 0;
  *gss_OID_set oid_set = 0;
  uint64_t v4 = (gss_OID_set_desc_struct *)malloc_type_malloc(0x10uLL, 0x10200405730B0C9uLL);
  if (v4)
  {
    size_t v5 = v4;
    OM_uint32 result = 0;
    v5->size_t count = 0;
    v5->elements = 0;
    *gss_OID_set oid_set = v5;
  }
  else
  {
    *OM_uint32 minor_status = 12;
    return 851968;
  }
  return result;
}

OM_uint32 gss_decapsulate_token(gss_const_buffer_t input_token, gss_const_OID oid, gss_buffer_t output_token)
{
  if (output_token)
  {
    output_token->size_t length = 0;
    output_token->value = 0;
  }
  long long v7 = 0u;
  gss_buffer_desc_struct v8 = (gss_buffer_desc_struct)0;
  if (!der_get_oid())
  {
    if (!decode_GSSAPIContextToken((uint64_t)input_token->value, input_token->length, (uint64_t)&v7, 0))
    {
      if (!der_heim_oid_cmp())
      {
        *output_token = v8;
        der_free_oid();
        OM_uint32 v5 = 0;
        goto LABEL_9;
      }
      free_GSSAPIContextToken((uint64_t)&v7);
    }
    OM_uint32 v5 = 851968;
LABEL_9:
    der_free_oid();
    return v5;
  }
  return 851968;
}

OM_uint32 gss_delete_sec_context(OM_uint32 *minor_status, gss_ctx_id_t *context_handle, gss_buffer_t output_token)
{
  gss_ctx_id_t v6 = *context_handle;
  if (output_token)
  {
    output_token->size_t length = 0;
    output_token->value = 0;
  }
  *OM_uint32 minor_status = 0;
  if (!v6) {
    return 0;
  }
  minor_statusgss_const_OID a = 0;
  if (*((void *)v6 + 2)) {
    gss_release_cred(&minor_statusa, (gss_cred_id_t *)v6 + 2);
  }
  if (*((void *)v6 + 1)) {
    OM_uint32 v7 = (*(uint64_t (**)(OM_uint32 *, uint64_t, gss_buffer_t))(*(void *)v6 + 80))(minor_status, (uint64_t)v6 + 8, output_token);
  }
  else {
    OM_uint32 v7 = 0;
  }
  free(v6);
  *context_handle = 0;
  return v7;
}

OM_uint32 gss_display_name(OM_uint32 *minor_status, gss_name_t input_name, gss_buffer_t output_name_buffer, gss_OID *output_name_type)
{
  if (output_name_buffer)
  {
    output_name_buffer->size_t length = 0;
    output_name_buffer->value = 0;
  }
  if (output_name_type) {
    *output_name_type = 0;
  }
  if (input_name)
  {
    if (*((void *)input_name + 5))
    {
      gss_buffer_desc_struct v8 = malloc_type_malloc(*((void *)input_name + 4), 0x53EBEDF8uLL);
      output_name_buffer->value = v8;
      if (v8)
      {
        size_t v10 = *((void *)input_name + 4);
        unsigned int v9 = (const void *)*((void *)input_name + 5);
        output_name_buffer->size_t length = v10;
        memcpy(v8, v9, v10);
        OM_uint32 v11 = 0;
        OM_uint32 result = 0;
        if (output_name_type) {
          *output_name_type = (gss_OID)((char *)input_name + 16);
        }
      }
      else
      {
        OM_uint32 result = 851968;
        OM_uint32 v11 = 12;
      }
    }
    else
    {
      OM_uint32 v13 = (void *)((char *)input_name + 48);
      while (1)
      {
        OM_uint32 v13 = (void *)*v13;
        if (!v13) {
          break;
        }
        OM_uint32 result = (*(uint64_t (**)(OM_uint32 *, void, gss_buffer_t, gss_OID *))(v13[1] + 152))(minor_status, v13[3], output_name_buffer, output_name_type);
        if (!result) {
          return result;
        }
      }
      OM_uint32 v11 = 0;
      OM_uint32 result = 851968;
    }
  }
  else
  {
    OM_uint32 v11 = 0;
    OM_uint32 result = 0x20000;
  }
  *OM_uint32 minor_status = v11;
  return result;
}

OM_uint32 gss_display_status(OM_uint32 *minor_status, OM_uint32 status_value, int status_type, gss_OID mech_type, OM_uint32 *message_content, gss_buffer_t status_string)
{
  if (status_string)
  {
    status_string->size_t length = 0;
    status_string->value = 0;
  }
  *message_content = 0;
  *OM_uint32 minor_status = 0;
  if (status_type == 2)
  {
    minor_statusgss_const_OID a = 0;
    oid_str.size_t length = 0;
    oid_str.value = 0;
    __s = 0;
    if (_gss_mg_get_error((uint64_t)mech_type, status_value, status_string))
    {
      if (gss_oid_to_str(&minor_statusa, mech_type, &oid_str))
      {
        oid_str.size_t length = 7;
        oid_str.value = "unknown";
        if (asprintf(&__s, "unknown mech-code %lu for mech %.*s", status_value, 7, "unknown") < 0) {
          goto LABEL_20;
        }
      }
      else
      {
        int v12 = asprintf(&__s, "unknown mech-code %lu for mech %.*s", status_value, SLODWORD(oid_str.length), (const char *)oid_str.value);
        gss_release_buffer(&minor_statusa, &oid_str);
        if (v12 < 0) {
          goto LABEL_20;
        }
      }
      OM_uint32 v13 = __s;
      if (!__s) {
        goto LABEL_20;
      }
      status_string->size_t length = strlen(__s);
      status_string->value = v13;
    }
    else
    {
      *message_content = 0;
      *OM_uint32 minor_status = 0;
    }
    return 0;
  }
  if (status_type == 1)
  {
    oid_str.size_t length = 0;
    int v11 = (_WORD)status_value ? asprintf((char **)&oid_str, "%s") : asprintf((char **)&oid_str, "%s %s");
    if ((v11 & 0x80000000) == 0)
    {
      size_t length = (void *)oid_str.length;
      if (oid_str.length)
      {
        size_t v16 = strlen((const char *)oid_str.length);
        OM_uint32 result = 0;
        status_string->size_t length = v16;
        status_string->value = length;
        return result;
      }
    }
  }
LABEL_20:
  if (status_string)
  {
    status_string->size_t length = 0;
    status_string->value = 0;
  }
  return 327680;
}

OM_uint32 gss_duplicate_name(OM_uint32 *minor_status, gss_name_t src_name, gss_name_t *dest_name)
{
  _gss_mg_check_name(src_name);
  *OM_uint32 minor_status = 0;
  *dest_name = 0;
  if (*((void *)src_name + 5))
  {
    OM_uint32 result = gss_import_name(minor_status, (gss_buffer_t)src_name + 2, (gss_const_OID)src_name + 1, dest_name);
    if (result) {
      return result;
    }
    OM_uint32 v7 = (uint64_t **)*((void *)src_name + 6);
    if (v7)
    {
      gss_name_t v8 = *dest_name;
      do
      {
        uint64_t v14 = 0;
        _gss_find_mn(minor_status, (uint64_t)v8, (gss_const_OID)v7[2], &v14);
        OM_uint32 v7 = (uint64_t **)*v7;
      }
      while (v7);
    }
    return 0;
  }
  name = (gss_name_t_desc_struct *)_gss_create_name(0, 0);
  if (name)
  {
    size_t v10 = name;
    *dest_name = name;
    int v11 = (uint64_t *)*((void *)src_name + 6);
    if (!v11) {
      return 0;
    }
    while (1)
    {
      int v12 = (char *)malloc_type_malloc(0x20uLL, 0x20040DC1BFBCFuLL);
      if (!v12) {
        break;
      }
      OM_uint32 v13 = v12;
      *(_OWORD *)(v12 + 8) = *(_OWORD *)(v11 + 1);
      if ((*(unsigned int (**)(OM_uint32 *, uint64_t, char *))(v11[1] + 264))(minor_status, v11[3], v12 + 24))
      {
        free(v13);
      }
      else
      {
        void *v13 = *((void *)v10 + 6);
        *((void *)v10 + 6) = v13;
      }
      int v11 = (uint64_t *)*v11;
      if (!v11) {
        return 0;
      }
    }
  }
  *OM_uint32 minor_status = 12;
  return 851968;
}

OM_uint32 gss_duplicate_oid(OM_uint32 *minor_status, gss_OID src_oid, gss_OID *dest_oid)
{
  *OM_uint32 minor_status = 0;
  if (src_oid)
  {
    gss_ctx_id_t v6 = (gss_OID_desc_struct *)malloc_type_malloc(0x10uLL, 0x10800407411B482uLL);
    *dest_okrb5_ccache id = v6;
    if (v6)
    {
      (*dest_oid)->elements = malloc_type_malloc(src_oid->length, 0x46A2689AuLL);
      elements = (*dest_oid)->elements;
      if (elements)
      {
        memcpy(elements, src_oid->elements, src_oid->length);
        OM_uint32 result = 0;
        (*dest_oid)->size_t length = src_oid->length;
        *OM_uint32 minor_status = 0;
        return result;
      }
      free(*dest_oid);
      *dest_okrb5_ccache id = 0;
    }
    *OM_uint32 minor_status = 12;
    return 851968;
  }
  else
  {
    OM_uint32 result = 0;
    *dest_okrb5_ccache id = 0;
  }
  return result;
}

OM_uint32 gss_encapsulate_token(gss_const_buffer_t input_token, gss_const_OID oid, gss_buffer_t output_token)
{
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v9 = 0;
  if (der_get_oid())
  {
    if (!output_token) {
      return 851968;
    }
    goto LABEL_8;
  }
  value = input_token->value;
  *(void *)&long long v11 = input_token->length;
  *((void *)&v11 + 1) = value;
  size_t v6 = length_GSSAPIContextToken((uint64_t)&v10);
  output_token->size_t length = v6;
  OM_uint32 v7 = malloc_type_malloc(v6, 0xF5D94972uLL);
  output_token->value = v7;
  if (!v7)
  {
LABEL_7:
    der_free_oid();
LABEL_8:
    output_token->size_t length = 0;
    output_token->value = 0;
    return 851968;
  }
  if (encode_GSSAPIContextToken((uint64_t)((uint64_t)v7 + output_token->length) - 1, output_token->length, (uint64_t)&v10, (uint64_t)&v9))
  {
    free(output_token->value);
    output_token->value = 0;
    goto LABEL_7;
  }
  der_free_oid();
  if (output_token->length != v9) {
    abort();
  }
  return 0;
}

OM_uint32 gss_export_name(OM_uint32 *minor_status, gss_name_t input_name, gss_buffer_t exported_name)
{
  _gss_mg_check_name(input_name);
  if (exported_name)
  {
    exported_name->size_t length = 0;
    exported_name->value = 0;
  }
  uint64_t v6 = *((void *)input_name + 6);
  if (v6)
  {
    OM_uint32 v7 = *(uint64_t (**)(OM_uint32 *, uint64_t, gss_buffer_t))(*(void *)(v6 + 8) + 168);
    uint64_t v8 = *(void *)(v6 + 24);
    return v7(minor_status, v8, exported_name);
  }
  else
  {
    *OM_uint32 minor_status = 0;
    return 1179648;
  }
}

uint64_t gss_mg_export_name(int *a1, const void **a2, const void *a3, size_t a4, size_t *a5)
{
  size_t v10 = a4 + *(unsigned int *)a2 + 10;
  *a5 = v10;
  long long v11 = (char *)malloc_type_malloc(v10, 0x6CD68632uLL);
  a5[1] = (size_t)v11;
  if (v11)
  {
    *(_WORD *)long long v11 = 260;
    _OWORD v11[2] = (unsigned __int16)(*(_WORD *)a2 + 2) >> 8;
    v11[3] = *(unsigned char *)a2 + 2;
    v11[4] = 6;
    v11[5] = *(_DWORD *)a2;
    int v12 = v11 + 6;
    memcpy(v11 + 6, a2[1], *(unsigned int *)a2);
    OM_uint32 v13 = &v12[*(unsigned int *)a2];
    *(_DWORD *)OM_uint32 v13 = bswap32(a4);
    memcpy(v13 + 4, a3, a4);
    int v14 = 0;
    uint64_t result = 0;
  }
  else
  {
    uint64_t result = 851968;
    int v14 = 12;
  }
  *a1 = v14;
  return result;
}

OM_uint32 gss_export_sec_context(OM_uint32 *minor_status, gss_ctx_id_t *context_handle, gss_buffer_t interprocess_token)
{
  *OM_uint32 minor_status = 0;
  if (!interprocess_token) {
    return 0x1000000;
  }
  interprocess_token->size_t length = 0;
  interprocess_token->value = 0;
  if (!context_handle) {
    return 0x80000;
  }
  gss_ctx_id_t v6 = *context_handle;
  if (!*context_handle || (v14.size_t length = 0, v14.value = 0, !*((void *)v6 + 1)))
  {
    *OM_uint32 minor_status = 0;
    return 0x80000;
  }
  uint64_t v7 = *(void *)v6;
  OM_uint32 v8 = (*(uint64_t (**)(OM_uint32 *, uint64_t, gss_buffer_desc_struct *))(*(void *)v6 + 224))(minor_status, (uint64_t)v6 + 8, &v14);
  if (v8)
  {
    OM_uint32 v9 = v8;
    _gss_mg_error(v7, *minor_status);
  }
  else
  {
    free(v6);
    *context_handle = 0;
    size_t v11 = v14.length + *(unsigned int *)(v7 + 16) + 2;
    interprocess_token->size_t length = v11;
    int v12 = malloc_type_malloc(v11, 0x15E2DDD5uLL);
    interprocess_token->value = v12;
    if (v12)
    {
      *int v12 = BYTE1(*(_DWORD *)(v7 + 16));
      v12[1] = *(_DWORD *)(v7 + 16);
      OM_uint32 v13 = v12 + 2;
      memcpy(v12 + 2, *(const void **)(v7 + 24), *(unsigned int *)(v7 + 16));
      memcpy(&v13[*(unsigned int *)(v7 + 16)], v14.value, v14.length);
      gss_release_buffer(minor_status, &v14);
      return 0;
    }
    else
    {
      interprocess_token->size_t length = 0;
      interprocess_token->value = 0;
      *OM_uint32 minor_status = 12;
      return 851968;
    }
  }
  return v9;
}

OM_uint32 gss_get_mic(OM_uint32 *minor_status, gss_ctx_id_t context_handle, gss_qop_t qop_req, gss_buffer_t message_buffer, gss_buffer_t message_token)
{
  if (message_token)
  {
    message_token->size_t length = 0;
    message_token->value = 0;
  }
  if (context_handle) {
    return (*(uint64_t (**)(OM_uint32 *, void, void, gss_buffer_t))(*(void *)context_handle + 96))(minor_status, *((void *)context_handle + 1), *(void *)&qop_req, message_buffer);
  }
  *OM_uint32 minor_status = 0;
  return 0x80000;
}

OM_uint32 gss_import_name(OM_uint32 *minor_status, gss_buffer_t input_name_buffer, gss_const_OID input_name_type, gss_name_t *output_name)
{
  minor_statusgss_const_OID a = 0;
  gss_name_t input_name = 0;
  *gss_name_t output_name = 0;
  _gss_load_mech();
  if (input_name_type) {
    OM_uint32 v8 = (gss_OID_desc *)input_name_type;
  }
  else {
    OM_uint32 v8 = &__gss_c_nt_user_name_oid_desc;
  }
  if (gss_oid_equal(v8, &__gss_c_nt_export_name_oid_desc))
  {
    size_t length = input_name_buffer->length;
    value = (unsigned __int8 *)input_name_buffer->value;
    *OM_uint32 minor_status = 0;
    *gss_name_t output_name = 0;
    if (length < 2) {
      return 0x20000;
    }
    uint64_t v36 = 0;
    *(void *)&present.size_t length = 0;
    if (*value != 4) {
      return 0x20000;
    }
    int v11 = value[1];
    if (v11 != 1)
    {
      if (v11 != 2) {
        return 0x20000;
      }
      int v11 = 0;
    }
    if ((length & 0xFFFFFFFFFFFFFFFELL) != 2 && value[4] == 6)
    {
      uint64_t v12 = __rev16(*((unsigned __int16 *)value + 1));
      OM_uint32 v13 = value[5];
      if ((char)value[5] < 0)
      {
        OM_uint32 v26 = 0;
        gss_buffer_desc_struct v14 = value + 6;
        uint64_t v16 = v12 - 2;
        OM_uint32 v27 = v13 - 1;
        do
        {
          int v28 = *v14++;
          OM_uint32 v26 = v28 | (v26 << 8);
          present.size_t length = v26;
          --v16;
          --v13;
        }
        while (v13);
        unint64_t v15 = length - v27 - 7;
        OM_uint32 v13 = v26;
      }
      else
      {
        present.size_t length = value[5];
        gss_buffer_desc_struct v14 = value + 6;
        unint64_t v15 = length - 6;
        uint64_t v16 = v12 - 2;
      }
      if (v16 == v13)
      {
        present.elements = v14;
        if (v15 >= v16 + 4
          && (!v11
           || v15 - v16 - 4 == ((v14[v16] << 24) | ((unint64_t)v14[v16 + 1] << 16) | ((unint64_t)v14[v16 + 2] << 8) | v14[v16 + 3])))
        {
          mechanism = __gss_get_mechanism(&present);
          if (!mechanism) {
            return 0x10000;
          }
          uint64_t v31 = (uint64_t)mechanism;
          OM_uint32 v32 = ((uint64_t (*)(OM_uint32 *, gss_buffer_t, gss_OID_desc *, uint64_t *))mechanism[20])(minor_status, input_name_buffer, &__gss_c_nt_export_name_oid_desc, &v36);
          if (v32)
          {
            OM_uint32 v20 = v32;
            _gss_mg_error(v31, *minor_status);
            return v20;
          }
          name = (gss_name_t_desc_struct *)_gss_create_name(v36, v31);
          if (name)
          {
            OM_uint32 v20 = 0;
            *gss_name_t output_name = name;
            *OM_uint32 minor_status = 0;
            return v20;
          }
          (*(void (**)(OM_uint32 *, uint64_t *))(v31 + 176))(minor_status, &v36);
          return 851968;
        }
      }
    }
    return 0x20000;
  }
  *OM_uint32 minor_status = 0;
  uint64_t v17 = _gss_create_name(0, 0);
  if (!v17)
  {
    *OM_uint32 minor_status = 12;
    return 851968;
  }
  size_t v18 = v17;
  v17[6] = 0;
  size_t v19 = v17 + 2;
  if (_gss_copy_oid(minor_status, (const void **)v8, (uint64_t)(v17 + 2)))
  {
    gss_name_t input_name = (gss_name_t)v18;
    gss_release_name(&minor_statusa, &input_name);
    return 851968;
  }
  OM_uint32 v20 = _gss_copy_buffer(minor_status, (uint64_t)input_name_buffer, v18 + 4);
  if (v20) {
    goto LABEL_20;
  }
  for (uint64_t i = _gss_mechs; i; uint64_t i = *(void *)i)
  {
    present.size_t length = 0;
    if (gss_test_oid_set_member(minor_status, v8, *(gss_OID_set *)(i + 24), (int *)&present)) {
      BOOL v22 = 1;
    }
    else {
      BOOL v22 = present.length == 0;
    }
    if (!v22)
    {
      uint64_t v23 = malloc_type_malloc(0x20uLL, 0x20040DC1BFBCFuLL);
      if (!v23)
      {
        *OM_uint32 minor_status = 12;
        OM_uint32 v20 = 851968;
LABEL_20:
        gss_name_t input_name = (gss_name_t)v18;
        gss_release_name(&minor_statusa, &input_name);
        return v20;
      }
      uint64_t v24 = v23;
      if (v18[3]) {
        uint64_t v25 = v19;
      }
      else {
        uint64_t v25 = 0;
      }
      if ((*(unsigned int (**)(OM_uint32 *, size_t *, void *, void *))(i + 200))(minor_status, v18 + 4, v25, v23 + 3))
      {
        _gss_mg_error(i + 40, *minor_status);
        free(v24);
      }
      else
      {
        v24[1] = i + 40;
        krb5_int32 v24[2] = i + 8;
        void *v24 = v18[6];
        v18[6] = (size_t)v24;
      }
    }
  }
  if (!v18[6])
  {
    *OM_uint32 minor_status = 0;
    OM_uint32 v20 = 1179648;
    goto LABEL_20;
  }
  OM_uint32 v20 = 0;
  *gss_name_t output_name = (gss_name_t)v18;
  return v20;
}

OM_uint32 gss_import_sec_context(OM_uint32 *minor_status, gss_buffer_t interprocess_token, gss_ctx_id_t *context_handle)
{
  *OM_uint32 minor_status = 0;
  *context_handle = 0;
  size_t length = interprocess_token->length;
  if (interprocess_token->length < 2) {
    return 589824;
  }
  value = (unsigned __int16 *)interprocess_token->value;
  *(void *)&v15.size_t length = 0;
  OM_uint32 v5 = __rev16(*value);
  v15.size_t length = v5;
  if (length < v5 + 2) {
    return 589824;
  }
  v15.elements = value + 1;
  v14[0] = length - v5 - 2;
  v14[1] = (char *)value + v5 + 2;
  mechanism = __gss_get_mechanism(&v15);
  if (!mechanism) {
    return 589824;
  }
  uint64_t v9 = (uint64_t)mechanism;
  size_t v10 = malloc_type_malloc(0x18uLL, 0x20040960023A9uLL);
  if (v10)
  {
    int v11 = v10;
    void v10[2] = 0;
    v10[1] = 0;
    *size_t v10 = v9;
    OM_uint32 v12 = (*(uint64_t (**)(OM_uint32 *, void *, void *))(v9 + 232))(minor_status, v14, v10 + 1);
    if (v12)
    {
      _gss_mg_error(v9, *minor_status);
      free(v11);
    }
    else
    {
      *context_handle = (gss_ctx_id_t)v11;
    }
  }
  else
  {
    *OM_uint32 minor_status = 12;
    return 851968;
  }
  return v12;
}

OM_uint32 gss_indicate_mechs(OM_uint32 *minor_status, gss_OID_set *mech_set)
{
  _gss_load_mech();
  empty_gss_OID_set oid_set = gss_create_empty_oid_set(minor_status, mech_set);
  if (!empty_oid_set)
  {
    uint64_t v5 = _gss_mechs;
    if (_gss_mechs)
    {
      minor_statusgss_const_OID a = 0;
      gss_OID_set v12 = 0;
      do
      {
        gss_ctx_id_t v6 = *(uint64_t (**)(OM_uint32 *, gss_OID_set *))(v5 + 176);
        if (v6)
        {
          empty_gss_OID_set oid_set = v6(minor_status, &v12);
          if (!empty_oid_set)
          {
            gss_OID_set v7 = v12;
            if (v12->count)
            {
              uint64_t v8 = 0;
              size_t v9 = 0;
              while (1)
              {
                OM_uint32 v10 = gss_add_oid_set_member(minor_status, &v7->elements[v8], mech_set);
                if (v10) {
                  break;
                }
                ++v9;
                gss_OID_set v7 = v12;
                ++v8;
                if (v9 >= v12->count) {
                  goto LABEL_10;
                }
              }
              empty_gss_OID_set oid_set = v10;
            }
            else
            {
LABEL_10:
              empty_gss_OID_set oid_set = 0;
            }
            gss_release_oid_set(minor_status, &v12);
            if (empty_oid_set) {
              goto LABEL_17;
            }
          }
        }
        else
        {
          empty_gss_OID_set oid_set = gss_add_oid_set_member(minor_status, (gss_const_OID)(v5 + 8), mech_set);
          if (empty_oid_set) {
            goto LABEL_17;
          }
        }
        uint64_t v5 = *(void *)v5;
      }
      while (v5);
      if (!empty_oid_set) {
        goto LABEL_19;
      }
LABEL_17:
      gss_release_oid_set(&minor_statusa, mech_set);
    }
    else
    {
      empty_gss_OID_set oid_set = 0;
    }
LABEL_19:
    *OM_uint32 minor_status = 0;
  }
  return empty_oid_set;
}

OM_uint32 gss_init_sec_context(OM_uint32 *minor_status, gss_cred_id_t initiator_cred_handle, gss_ctx_id_t *context_handle, gss_name_t target_name, gss_OID input_mech_type, OM_uint32 req_flags, OM_uint32 time_req, gss_channel_bindings_t input_chan_bindings, gss_buffer_t input_token, gss_OID *actual_mech_type, gss_buffer_t output_token, OM_uint32 *ret_flags, OM_uint32 *time_rec)
{
  uint64_t v72 = *(void *)&req_flags;
  gss_ctx_id_t v18 = *context_handle;
  *OM_uint32 minor_status = 0;
  if (output_token)
  {
    output_token->size_t length = 0;
    output_token->value = 0;
  }
  if (actual_mech_type) {
    *actual_mech_type = 0;
  }
  if (ret_flags) {
    *ret_flags = 0;
  }
  if (time_rec) {
    *time_rec = 0;
  }
  unint64_t v73 = 0;
  if (input_mech_type) {
    size_t v19 = input_mech_type;
  }
  else {
    size_t v19 = &__gss_krb5_mechanism_oid_desc;
  }
  heim_warn_blocking();
  _gss_mg_check_name(target_name);
  _gss_mg_check_credential(initiator_cred_handle);
  if (!_gss_mg_log_level(1)) {
    goto LABEL_23;
  }
  if (v18)
  {
    mechanism = *(uint64_t **)v18;
    if (*(void *)v18) {
      goto LABEL_15;
    }
LABEL_23:
    if (!v18) {
      goto LABEL_16;
    }
LABEL_24:
    uint64_t v69 = context_handle;
    uint64_t v46 = *(void *)v18;
    size_t v19 = (const gss_OID_desc *)(*(void *)v18 + 16);
    uint64_t v38 = (gss_cred_id_t *)v18;
    goto LABEL_25;
  }
  mechanism = __gss_get_mechanism(input_mech_type);
  if (!mechanism) {
    goto LABEL_23;
  }
LABEL_15:
  OM_uint32 v27 = (const gss_OID_desc *)(mechanism + 2);
  _gss_mg_log(1, "gss_isc: %s %sfirst flags %08x, %s cred, %stoken", v20, v21, v22, v23, v24, v25, mechanism[1]);
  _gss_mg_log_cred(1, (uint64_t)initiator_cred_handle, "gss_isc cred", v28, v29, v30, v31, v32, v67);
  _gss_mg_log_name(1, (uint64_t)target_name, v27, "gss_isc: target", v33, v34, v35, v36, v68);
  if (v18) {
    goto LABEL_24;
  }
LABEL_16:
  uint64_t v37 = (gss_cred_id_t *)malloc_type_malloc(0x18uLL, 0x20040960023A9uLL);
  if (!v37)
  {
    *OM_uint32 minor_status = 12;
    return 851968;
  }
  uint64_t v38 = v37;
  uint64_t v69 = context_handle;
  gss_cred_id_t *v37 = 0;
  v37[1] = 0;
  void v37[2] = 0;
  uint64_t v39 = __gss_get_mechanism(v19);
  gss_cred_id_t *v38 = (gss_cred_id_t)v39;
  if (!v39)
  {
    free(v38);
    *OM_uint32 minor_status = 0;
    uint64_t v56 = "Asked for mechanism isn'ted supported";
    OM_uint32 v52 = 0x10000;
    size_t v57 = (size_t)v19;
    uint64_t v58 = 0x10000;
    OM_uint32 v55 = 0;
LABEL_43:
    gss_mg_set_error_string(v57, v58, v55, v56, v48, v49, v50, v51, v66);
    return v52;
  }
  uint64_t v46 = (uint64_t)v39;
  _gss_mg_log(1, "gss_isc running replace plugins", v40, v41, v42, v43, v44, v45, v66);
  _gss_load_plugins();
  unsigned int v74 = 0;
  uint64_t v75 = 0;
  uint64_t v76 = 0;
  gss_name_t v77 = target_name;
  v78 = v19;
  gss_cred_id_t v79 = initiator_cred_handle;
  if (!krb5_homedir_access())
  {
    uint64_t v75 = 1;
    LODWORD(v76) = 1;
  }
  krb5_context v80 = 0;
  if (krb5_init_context(&v80))
  {
    v38[2] = 0;
  }
  else
  {
    krb5_plugin_run_f();
    heim_release();
    v38[2] = v74;
  }
LABEL_25:
  if (v38[2]) {
    initiator_gss_cred_id_t cred_handle = v38[2];
  }
  OM_uint32 mn = _gss_find_mn(minor_status, (uint64_t)target_name, v19, &v73);
  if (mn)
  {
    OM_uint32 v52 = mn;
    if (!v18) {
      free(v38);
    }
    return v52;
  }
  if (initiator_cred_handle && (*(_DWORD *)(v46 + 32) & 1) == 0)
  {
    uint64_t v53 = (char *)initiator_cred_handle + 16;
    while (1)
    {
      uint64_t v53 = *(char **)v53;
      if (!v53) {
        break;
      }
      if (gss_oid_equal(v19, *((gss_const_OID *)v53 + 2)))
      {
        initiator_gss_cred_id_t cred_handle = (gss_cred_id_t)*((void *)v53 + 3);
        if (initiator_cred_handle) {
          goto LABEL_36;
        }
        break;
      }
    }
    OM_uint32 v55 = 0;
    *OM_uint32 minor_status = 0;
    if (!v18)
    {
      free(v38);
      OM_uint32 v55 = *minor_status;
    }
    uint64_t v56 = "Credential for asked mech-type mech not found in the credential handle";
    OM_uint32 v52 = 0x100000;
    size_t v57 = (size_t)v19;
    uint64_t v58 = 0x100000;
    goto LABEL_43;
  }
LABEL_36:
  if (v73) {
    elements = v73[1].elements;
  }
  else {
    elements = 0;
  }
  OM_uint32 v52 = (*(uint64_t (**)(OM_uint32 *, gss_cred_id_t, gss_cred_id_t *, void *, const gss_OID_desc *, uint64_t, void, gss_channel_bindings_t, gss_buffer_t, gss_OID *, gss_buffer_t, OM_uint32 *, OM_uint32 *))(v46 + 56))(minor_status, initiator_cred_handle, v38 + 1, elements, v19, v72, time_req, input_chan_bindings, input_token, actual_mech_type, output_token, ret_flags, time_rec);
  if (v52 < 2)
  {
    *uint64_t v69 = (gss_ctx_id_t)v38;
  }
  else
  {
    if (!v18) {
      free(v38);
    }
    if (output_token)
    {
      output_token->size_t length = 0;
      output_token->value = 0;
    }
    _gss_mg_error(v46, *minor_status);
  }
  _gss_mg_log(1, "gss_isc: %s maj_stat: %d/%d", v59, v60, v61, v62, v63, v64, *(void *)(v46 + 8));
  return v52;
}

uint64_t replace_cred_fun(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = 2529639161;
  gss_name_t dest_name = 0;
  if (!*(void *)a4)
  {
    if (*(void *)(a2 + 40))
    {
      if ((*(void *)(a4 + 8) & ~*(void *)(a2 + 32)) == 0)
      {
        OM_uint32 minor_status = 0;
        if (!gss_duplicate_name(&minor_status, *(gss_name_t *)(a4 + 24), &dest_name))
        {
          _gss_mg_log(1, "gss_isc running plugin %s", v8, v9, v10, v11, v12, v13, *(void *)(a2 + 24));
          *(void *)a4 = (*(uint64_t (**)(gss_name_t, void, void, void))(a2 + 40))(dest_name, *(void *)(a4 + 32), *(void *)(a4 + 40), *(unsigned int *)(a4 + 16));
          _gss_mg_log(1, "gss_isc plugin %s done (%s replacement)", v14, v15, v16, v17, v18, v19, *(void *)(a2 + 24));
          gss_release_name(&minor_status, &dest_name);
          if (*(void *)a4)
          {
            _gss_mg_log_cred(1, *(void *)a4, "gss_isc %s replace the credential to", v20, v21, v22, v23, v24, *(void *)(a2 + 24));
            return 0;
          }
        }
      }
    }
  }
  return v4;
}

OM_uint32 gss_inquire_context(OM_uint32 *minor_status, gss_ctx_id_t context_handle, gss_name_t *src_name, gss_name_t *targ_name, OM_uint32 *lifetime_rec, gss_OID *mech_type, OM_uint32 *ctx_flags, int *locally_initiated, int *xopen)
{
  if (locally_initiated) {
    *locally_initiated = 0;
  }
  if (xopen) {
    *xopen = 0;
  }
  if (lifetime_rec) {
    *lifetime_rec = 0;
  }
  if (src_name) {
    *src_name = 0;
  }
  if (targ_name) {
    *targ_name = 0;
  }
  if (mech_type) {
    *mech_type = 0;
  }
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  if (!context_handle || (uint64_t v13 = *((void *)context_handle + 1)) == 0)
  {
    *OM_uint32 minor_status = 0;
    return 0x80000;
  }
  uint64_t v14 = *(void *)context_handle;
  if (src_name) {
    uint64_t v15 = &v23;
  }
  else {
    uint64_t v15 = 0;
  }
  if (targ_name) {
    uint64_t v16 = &v22;
  }
  else {
    uint64_t v16 = 0;
  }
  OM_uint32 v17 = (*(uint64_t (**)(OM_uint32 *, uint64_t, uint64_t *, uint64_t *))(*(void *)context_handle + 192))(minor_status, v13, v15, v16);
  if (!v17)
  {
    if (src_name)
    {
      name = (gss_name_t_desc_struct *)_gss_create_name(v23, v14);
      if (!name)
      {
        if (mech_type) {
          *mech_type = 0;
        }
        (*(void (**)(OM_uint32 *, uint64_t *))(v14 + 176))(minor_status, &v23);
        goto LABEL_40;
      }
      *src_name = name;
    }
    if (!targ_name) {
      return 0;
    }
    uint64_t v21 = (gss_name_t_desc_struct *)_gss_create_name(v22, v14);
    if (v21)
    {
      OM_uint32 v18 = 0;
      *targ_name = v21;
      return v18;
    }
    if (mech_type) {
      *mech_type = 0;
    }
    if (src_name) {
      gss_release_name(minor_status, src_name);
    }
    (*(void (**)(OM_uint32 *, uint64_t *))(v14 + 176))(minor_status, &v22);
LABEL_40:
    *OM_uint32 minor_status = 0;
    return 851968;
  }
  OM_uint32 v18 = v17;
  _gss_mg_error(v14, *minor_status);
  return v18;
}

OM_uint32 gss_inquire_cred_by_mech(OM_uint32 *minor_status, gss_cred_id_t cred_handle, gss_OID mech_type, gss_name_t *cred_name, OM_uint32 *initiator_lifetime, OM_uint32 *acceptor_lifetime, gss_cred_usage_t *cred_usage)
{
  *OM_uint32 minor_status = 0;
  if (cred_name) {
    *cred_name = 0;
  }
  if (initiator_lifetime) {
    *initiator_OM_uint32 lifetime = 0;
  }
  if (acceptor_lifetime) {
    *acceptor_OM_uint32 lifetime = 0;
  }
  if (cred_usage) {
    *cred_usage = 0;
  }
  mechanism = __gss_get_mechanism(mech_type);
  if (!mechanism) {
    return 458752;
  }
  uint64_t v15 = (uint64_t)mechanism;
  uint64_t v16 = (uint64_t (*)(OM_uint32 *, uint64_t, gss_OID, uint64_t *, OM_uint32 *, OM_uint32 *, gss_cred_usage_t *))mechanism[27];
  if (!v16) {
    return 458752;
  }
  uint64_t v23 = 0;
  if (cred_handle)
  {
    OM_uint32 v17 = (void *)((char *)cred_handle + 16);
    while (1)
    {
      OM_uint32 v17 = (void *)*v17;
      if (!v17) {
        return 458752;
      }
      if ((uint64_t *)v17[1] == mechanism)
      {
        uint64_t v18 = v17[3];
        goto LABEL_17;
      }
    }
  }
  uint64_t v18 = 0;
LABEL_17:
  OM_uint32 v19 = v16(minor_status, v18, mech_type, &v23, initiator_lifetime, acceptor_lifetime, cred_usage);
  if (!v19)
  {
    if (!cred_name)
    {
      (*(void (**)(OM_uint32 *, uint64_t *))(v15 + 176))(minor_status, &v23);
      return 0;
    }
    name = (gss_name_t_desc_struct *)_gss_create_name(v23, v15);
    if (name)
    {
      OM_uint32 v20 = 0;
      *cred_name = name;
      return v20;
    }
    (*(void (**)(OM_uint32 *, uint64_t *))(v15 + 176))(minor_status, &v23);
    return 458752;
  }
  OM_uint32 v20 = v19;
  _gss_mg_error(v15, *minor_status);
  return v20;
}

OM_uint32 gss_inquire_cred_by_oid(OM_uint32 *minor_status, gss_cred_id_t cred_handle, gss_OID desired_object, gss_buffer_set_t *data_set)
{
  gss_buffer_set_t buffer_set = 0;
  *OM_uint32 minor_status = 0;
  *gss_buffer_set_t data_set = 0;
  if (!cred_handle) {
    return 458752;
  }
  uint64_t v4 = (void *)*((void *)cred_handle + 2);
  if (!v4) {
    return 851968;
  }
  OM_uint32 v8 = 851968;
  do
  {
    gss_buffer_set_t v17 = 0;
    uint64_t v9 = v4[1];
    if (!v9)
    {
      gss_release_buffer_set(minor_status, &buffer_set);
      *OM_uint32 minor_status = 0;
      return 0x10000;
    }
    uint64_t v10 = *(uint64_t (**)(OM_uint32 *, void, gss_OID, gss_buffer_set_t *))(v9 + 280);
    if (v10)
    {
      OM_uint32 v11 = v10(minor_status, v4[3], desired_object, &v17);
      if (v11)
      {
        OM_uint32 v8 = v11;
        _gss_mg_error(v9, *minor_status);
      }
      else
      {
        gss_buffer_set_t v12 = v17;
        if (v17)
        {
          uint64_t v13 = 0;
          uint64_t v14 = -1;
          do
          {
            if (++v14 >= v12->count) {
              break;
            }
            OM_uint32 v15 = gss_add_buffer_set_member(minor_status, &v12->elements[v13], &buffer_set);
            if (v15)
            {
              OM_uint32 v8 = v15;
              goto LABEL_15;
            }
            ++v13;
            gss_buffer_set_t v12 = v17;
          }
          while (v17);
        }
        OM_uint32 v8 = 0;
LABEL_15:
        gss_release_buffer_set(minor_status, &v17);
      }
    }
    uint64_t v4 = (void *)*v4;
  }
  while (v4);
  if (buffer_set)
  {
    OM_uint32 result = 0;
    *gss_buffer_set_t data_set = buffer_set;
    *OM_uint32 minor_status = 0;
  }
  else if (v8)
  {
    return v8;
  }
  else
  {
    return 851968;
  }
  return result;
}

OM_uint32 gss_inquire_cred(OM_uint32 *minor_status, gss_cred_id_t cred_handle, gss_name_t *name_ret, OM_uint32 *lifetime, gss_cred_usage_t *cred_usage, gss_OID_set *mechanisms)
{
  _gss_load_mech();
  *OM_uint32 minor_status = 0;
  if (name_ret) {
    *name_ret = 0;
  }
  if (lifetime) {
    *OM_uint32 lifetime = 0;
  }
  if (cred_usage) {
    *cred_usage = 0;
  }
  if (mechanisms) {
    *mechanisms = 0;
  }
  if (name_ret)
  {
    name = _gss_create_name(0, 0);
    if (!name)
    {
      *OM_uint32 minor_status = 12;
      return 851968;
    }
    if (!mechanisms) {
      goto LABEL_17;
    }
LABEL_14:
    empty_gss_OID_set oid_set = gss_create_empty_oid_set(minor_status, mechanisms);
    if (empty_oid_set)
    {
      OM_uint32 v14 = empty_oid_set;
      if (name) {
        free(name);
      }
      return v14;
    }
    goto LABEL_17;
  }
  name = 0;
  if (mechanisms) {
    goto LABEL_14;
  }
LABEL_17:
  unsigned int v33 = 0;
  if (cred_handle)
  {
    OM_uint32 v15 = (uint64_t **)*((void *)cred_handle + 2);
    if (v15)
    {
      uint64_t v30 = cred_usage;
      int v16 = 0;
      int v17 = 0;
      OM_uint32 v18 = -1;
      while (1)
      {
        gss_name_t input_name = 0;
        OM_uint32 v31 = 0;
        if (!((unsigned int (*)(OM_uint32 *, uint64_t *, gss_name_t *, OM_uint32 *, unsigned int *, void))v15[1][23])(minor_status, v15[3], &input_name, &v31, &v33, 0))
        {
          unsigned int v19 = 3 - v33;
          if (v33 > 3) {
            unsigned int v19 = 0;
          }
          v17 |= v19;
          if (!name)
          {
            ((void (*)(OM_uint32 *, gss_name_t *))v15[1][22])(minor_status, &input_name);
            goto LABEL_27;
          }
          OM_uint32 v20 = malloc_type_malloc(0x20uLL, 0x20040DC1BFBCFuLL);
          uint64_t v21 = v15[1];
          if (v20)
          {
            v20[1] = v21;
            gss_name_t v22 = input_name;
            void v20[2] = v15[2];
            v20[3] = v22;
            *OM_uint32 v20 = name[6];
            name[6] = v20;
LABEL_27:
            if (v31 < v18) {
              OM_uint32 v18 = v31;
            }
            if (mechanisms) {
              gss_add_oid_set_member(minor_status, (gss_const_OID)v15[2], mechanisms);
            }
            ++v16;
            goto LABEL_33;
          }
          ((void (*)(OM_uint32 *, gss_name_t *))v21[22])(minor_status, &input_name);
        }
LABEL_33:
        OM_uint32 v15 = (uint64_t **)*v15;
        if (!v15) {
          goto LABEL_34;
        }
      }
    }
LABEL_64:
    BOOL v23 = 0;
    goto LABEL_65;
  }
  uint64_t v24 = _gss_mechs;
  if (!_gss_mechs) {
    goto LABEL_64;
  }
  uint64_t v30 = cred_usage;
  int v16 = 0;
  int v17 = 0;
  OM_uint32 v18 = -1;
  do
  {
    gss_name_t input_name = 0;
    OM_uint32 v31 = 0;
    uint64_t v25 = *(unsigned int (**)(OM_uint32 *, void, gss_name_t *, OM_uint32 *, unsigned int *, void))(v24 + 224);
    if (v25 && !v25(minor_status, 0, &input_name, &v31, &v33, 0))
    {
      unsigned int v26 = 3 - v33;
      if (v33 > 3) {
        unsigned int v26 = 0;
      }
      v17 |= v26;
      if (name && input_name)
      {
        OM_uint32 v27 = malloc_type_malloc(0x20uLL, 0x20040DC1BFBCFuLL);
        if (!v27)
        {
          (*(void (**)(OM_uint32 *, gss_name_t *))(v24 + 216))(minor_status, &input_name);
          goto LABEL_61;
        }
        v27[1] = v24 + 40;
        void v27[2] = v24 + 8;
        v27[3] = input_name;
        *OM_uint32 v27 = name[6];
        name[6] = v27;
      }
      else if (input_name)
      {
        (*(void (**)(OM_uint32 *, gss_name_t *))(v24 + 216))(minor_status, &input_name);
      }
      if (v31 < v18) {
        OM_uint32 v18 = v31;
      }
      if (mechanisms) {
        gss_add_oid_set_member(minor_status, (gss_const_OID)(v24 + 8), mechanisms);
      }
      ++v16;
    }
LABEL_61:
    uint64_t v24 = *(void *)v24;
  }
  while (v24);
LABEL_34:
  BOOL v23 = v18 == 0;
  if (v16 && v18)
  {
    *OM_uint32 minor_status = 0;
    if (name_ret) {
      *name_ret = (gss_name_t)name;
    }
    if (lifetime) {
      *OM_uint32 lifetime = v18;
    }
    if (!v30) {
      return 0;
    }
    if ((~v17 & 3) == 0)
    {
      OM_uint32 v14 = 0;
      *uint64_t v30 = 0;
      return v14;
    }
    if ((v17 & 2) != 0)
    {
      OM_uint32 v14 = 0;
      int v29 = 1;
    }
    else
    {
      if ((v17 & 1) == 0) {
        return 0;
      }
      OM_uint32 v14 = 0;
      int v29 = 2;
    }
    *uint64_t v30 = v29;
    return v14;
  }
LABEL_65:
  gss_name_t input_name = (gss_name_t)name;
  if (name) {
    gss_release_name(minor_status, &input_name);
  }
  gss_release_oid_set(minor_status, mechanisms);
  *OM_uint32 minor_status = 0;
  if (v23) {
    return 720896;
  }
  else {
    return 458752;
  }
}

OM_uint32 gss_inquire_mechs_for_name(OM_uint32 *minor_status, gss_name_t input_name, gss_OID_set *mech_types)
{
  *OM_uint32 minor_status = 0;
  _gss_load_mech();
  empty_gss_OID_set oid_set = gss_create_empty_oid_set(minor_status, mech_types);
  if (!empty_oid_set)
  {
    uint64_t v7 = _gss_mechs;
    if (_gss_mechs)
    {
      gss_OID_set name_types = 0;
      int present = 0;
      OM_uint32 v8 = (const gss_OID_desc *)((char *)input_name + 16);
      while (1)
      {
        OM_uint32 v9 = gss_inquire_names_for_mech(minor_status, (gss_const_OID)(v7 + 8), &name_types);
        if (v9) {
          break;
        }
        gss_test_oid_set_member(minor_status, v8, name_types, &present);
        gss_release_oid_set(minor_status, &name_types);
        if (present)
        {
          OM_uint32 v9 = gss_add_oid_set_member(minor_status, (gss_const_OID)(v7 + 8), mech_types);
          if (v9) {
            break;
          }
        }
        uint64_t v7 = *(void *)v7;
        if (!v7) {
          return 0;
        }
      }
      empty_gss_OID_set oid_set = v9;
      gss_release_oid_set(minor_status, mech_types);
    }
    else
    {
      return 0;
    }
  }
  return empty_oid_set;
}

OM_uint32 gss_inquire_names_for_mech(OM_uint32 *minor_status, gss_const_OID mechanism, gss_OID_set *name_types)
{
  gss_ctx_id_t v6 = __gss_get_mechanism(mechanism);
  *OM_uint32 minor_status = 0;
  *gss_OID_set name_types = 0;
  if (!v6) {
    return 0x10000;
  }
  uint64_t v7 = (uint64_t (*)(OM_uint32 *, gss_const_OID, gss_OID_set *))v6[30];
  if (!v7)
  {
    empty_gss_OID_set oid_set = gss_create_empty_oid_set(minor_status, name_types);
    if (!empty_oid_set)
    {
      OM_uint32 v10 = gss_add_oid_set_member(minor_status, &__gss_c_nt_hostbased_service_oid_desc, name_types);
      if (v10)
      {
        empty_gss_OID_set oid_set = v10;
        int v13 = 0;
        p_minor_statusgss_const_OID a = (OM_uint32 *)&v13;
LABEL_12:
        gss_release_oid_set(p_minor_statusa, name_types);
        return empty_oid_set;
      }
      empty_gss_OID_set oid_set = gss_add_oid_set_member(minor_status, &__gss_c_nt_user_name_oid_desc, name_types);
      if (empty_oid_set)
      {
        minor_statusgss_const_OID a = 0;
        p_minor_statusgss_const_OID a = &minor_statusa;
        goto LABEL_12;
      }
    }
    return empty_oid_set;
  }

  return v7(minor_status, mechanism, name_types);
}

OM_uint32 gss_inquire_sec_context_by_oid(OM_uint32 *minor_status, gss_ctx_id_t context_handle, gss_OID desired_object, gss_buffer_set_t *data_set)
{
  *OM_uint32 minor_status = 0;
  *gss_buffer_set_t data_set = 0;
  if (!context_handle) {
    return 0x80000;
  }
  uint64_t v4 = *(void *)context_handle;
  if (!*(void *)context_handle) {
    return 0x10000;
  }
  uint64_t v5 = *(uint64_t (**)(void))(v4 + 272);
  if (!v5) {
    return 0x10000;
  }
  OM_uint32 v7 = v5();
  if (v7) {
    _gss_mg_error(v4, *minor_status);
  }
  return v7;
}

OM_uint32 gss_krb5_copy_ccache(OM_uint32 *minor_status, gss_cred_id_t cred, krb5_ccache_data *out)
{
  krb5_context v12 = 0;
  gss_buffer_set_t data_set = 0;
  OM_uint32 v10 = 0;
  krb5_ccache v11 = 0;
  OM_uint32 result = gss_inquire_cred_by_oid(minor_status, cred, &__gss_krb5_copy_ccache_x_oid_desc, &data_set);
  if (!result)
  {
    if (data_set && data_set->count)
    {
      krb5_error_code inited = krb5_init_context(&v12);
      if (inited)
      {
        *OM_uint32 minor_status = inited;
        gss_release_buffer_set(minor_status, &data_set);
        return 851968;
      }
      int v7 = asprintf(&v10, "%.*s", data_set->elements->length, (const char *)data_set->elements->value);
      gss_release_buffer_set(minor_status, &data_set);
      if ((v7 & 0x80000000) == 0 && v10)
      {
        krb5_error_code v8 = krb5_cc_resolve(v12, v10, &v11);
        free(v10);
        if (v8)
        {
          *OM_uint32 minor_status = v8;
        }
        else
        {
          OM_uint32 v9 = krb5_cc_copy_cache();
          krb5_cc_close(v12, v11);
          heim_release();
          if (!v9) {
            return 0;
          }
          *OM_uint32 minor_status = v9;
        }
        return 851968;
      }
      OM_uint32 v6 = 12;
    }
    else
    {
      gss_release_buffer_set(minor_status, &data_set);
      OM_uint32 v6 = 22;
    }
    *OM_uint32 minor_status = v6;
    return 851968;
  }
  return result;
}

uint64_t __ApplePrivate_gss_krb5_import_cred(OM_uint32 *a1, uint64_t a2, const krb5_principal_data *a3, uint64_t a4, gss_cred_id_t *a5)
{
  value.size_t length = 0;
  value.gss_buffer_desc_struct value = 0;
  v18.gss_buffer_desc_struct value = 0;
  krb5_context v19 = 0;
  int v17 = 0;
  v18.size_t length = 0;
  *a5 = 0;
  krb5_error_code inited = krb5_init_context(&v19);
  if (!inited)
  {
    if (!krb5_storage_emem())
    {
      *a1 = 12;
      uint64_t v11 = 851968;
LABEL_16:
      heim_release();
      return v11;
    }
    if (a2)
    {
      OM_uint32 full_name = krb5_cc_get_full_name();
      if (!full_name)
      {
        OM_uint32 full_name = krb5_store_string();
        free(v17);
        if (!full_name)
        {
LABEL_7:
          if (a3)
          {
            OM_uint32 v13 = krb5_unparse_name(v19, a3, (char **)&v17);
            if (v13 || (OM_uint32 v13 = krb5_store_string(), free(v17), v13))
            {
              *a1 = v13;
              goto LABEL_14;
            }
          }
          else
          {
            krb5_store_string();
          }
          if (a4)
          {
            OM_uint32 v15 = krb5_kt_get_full_name();
            if (v15 || (OM_uint32 v15 = krb5_store_string(), free(v17), v15))
            {
              *a1 = v15;
              goto LABEL_14;
            }
          }
          else
          {
            krb5_store_string();
          }
          OM_uint32 v16 = krb5_storage_to_data();
          if (!v16)
          {
            gss_buffer_desc_struct value = v18;
            uint64_t v11 = gss_set_cred_option(a1, a5, &__gss_krb5_import_cred_x_oid_desc, &value);
            krb5_data_free();
            goto LABEL_15;
          }
          *a1 = v16;
LABEL_14:
          uint64_t v11 = 851968;
LABEL_15:
          krb5_storage_free();
          goto LABEL_16;
        }
      }
    }
    else
    {
      OM_uint32 full_name = krb5_store_string();
      if (!full_name) {
        goto LABEL_7;
      }
    }
    *a1 = full_name;
    goto LABEL_14;
  }
  *a1 = inited;
  return 851968;
}

OM_uint32 gsskrb5_register_acceptor_identity(const char *identity)
{
  _gss_load_mech();
  v6[1] = identity;
  v6[0] = strlen(identity);
  mechanism = __gss_get_mechanism(&__gss_krb5_mechanism_oid_desc);
  if (!mechanism) {
    return 851968;
  }
  uint64_t v3 = (uint64_t (*)(int *, void, gss_OID_desc *, void *))mechanism[36];
  if (!v3) {
    return 851968;
  }
  int v5 = 0;
  return v3(&v5, 0, &__gss_krb5_register_acceptor_identity_x_oid_desc, v6);
}

uint64_t __ApplePrivate_gsskrb5_set_dns_canonicalize(int a1)
{
  BOOL v4 = a1 != 0;
  _gss_load_mech();
  v6[0] = 1;
  v6[1] = &v4;
  krb5_context v1 = (void *)_gss_mechs;
  if (_gss_mechs)
  {
    int v5 = 0;
    do
    {
      gss_buffer_set_t v2 = (void (*)(int *, void, gss_OID_desc *, void *))v1[41];
      if (v2) {
        v2(&v5, 0, &__gss_krb5_set_dns_canonicalize_x_oid_desc, v6);
      }
      krb5_context v1 = (void *)*v1;
    }
    while (v1);
  }
  return 0;
}

OM_uint32 gss_krb5_export_lucid_sec_context(OM_uint32 *minor_status, gss_ctx_id_t *context_handle, OM_uint32 version, void **rctx)
{
  gss_buffer_set_t data_set = 0;
  krb5_context v13 = 0;
  if (context_handle)
  {
    if (version == 1)
    {
      int v5 = *context_handle;
      if (v5)
      {
        int v11 = 0;
        OM_uint32 result = gss_inquire_sec_context_by_oid(minor_status, v5, &__gss_krb5_export_lucid_context_v1_x_oid_desc, &data_set);
        if (result) {
          return result;
        }
        if (data_set && data_set->count == 1)
        {
          krb5_error_code inited = krb5_init_context(&v13);
          if (inited)
          {
            OM_uint32 v8 = inited;
            OM_uint32 v9 = 0;
          }
          else
          {
            OM_uint32 v9 = malloc_type_calloc(1uLL, 0x68uLL, 0x108004058AB55F0uLL);
            if (v9 && krb5_storage_from_mem())
            {
              OM_uint32 v8 = krb5_ret_uint32();
              if (!v8) {
                OM_uint32 v8 = 22;
              }
              gss_release_buffer_set(minor_status, &data_set);
              krb5_storage_free();
              goto LABEL_19;
            }
            OM_uint32 v8 = 12;
          }
          gss_release_buffer_set(minor_status, &data_set);
LABEL_19:
          if (v13) {
            heim_release();
          }
          LODWORD(v10) = 0;
          if (v9) {
            gss_krb5_free_lucid_sec_context((OM_uint32 *)&v10, v9);
          }
          *OM_uint32 minor_status = v8;
          return 851968;
        }
        gss_release_buffer_set(minor_status, &data_set);
      }
    }
  }
  *OM_uint32 minor_status = 22;
  return 851968;
}

uint64_t set_key(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 8);
  *(_DWORD *)a2 = *(_DWORD *)a1;
  *(_DWORD *)(a2 + 4) = v4;
  int v5 = malloc_type_malloc(v4, 0x1219F407uLL);
  *(void *)(a2 + 8) = v5;
  size_t v6 = *(unsigned int *)(a2 + 4);
  if (v5) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v6 == 0;
  }
  if (!v7) {
    return 12;
  }
  memcpy(v5, *(const void **)(a1 + 16), v6);
  return 0;
}

OM_uint32 gss_krb5_free_lucid_sec_context(OM_uint32 *minor_status, void *c)
{
  if (*(_DWORD *)c != 1)
  {
    OM_uint32 v6 = 851968;
    OM_uint32 result = 851968;
    if (!minor_status) {
      return result;
    }
    goto LABEL_6;
  }
  int v4 = *((_DWORD *)c + 8);
  if (v4 == 1)
  {
    free_key((uint64_t)c + 72);
    if (!*((_DWORD *)c + 16)) {
      goto LABEL_11;
    }
    int v5 = (char *)c + 88;
  }
  else
  {
    if (v4) {
      goto LABEL_11;
    }
    int v5 = (char *)c + 48;
  }
  free_key((uint64_t)v5);
LABEL_11:
  free(c);
  OM_uint32 v6 = 0;
  OM_uint32 result = 0;
  if (!minor_status) {
    return result;
  }
LABEL_6:
  *OM_uint32 minor_status = 0;
  return v6;
}

void free_key(uint64_t a1)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
}

OM_uint32 gss_krb5_set_allowable_enctypes(OM_uint32 *minor_status, gss_cred_id_t cred, OM_uint32 num_enctypes, int32_t *enctypes)
{
  LODWORD(v5) = num_enctypes;
  gss_cred_id_t cred_handle = cred;
  if (krb5_storage_emem())
  {
    value.size_t length = 0;
    value.gss_buffer_desc_struct value = 0;
    if (v5)
    {
      uint64_t v5 = v5;
      while (1)
      {
        ++enctypes;
        OM_uint32 v7 = krb5_store_int32();
        if (v7) {
          break;
        }
        if (!--v5) {
          goto LABEL_6;
        }
      }
    }
    else
    {
LABEL_6:
      OM_uint32 v7 = krb5_storage_to_data();
      if (!v7)
      {
        value.size_t length = 0;
        value.gss_buffer_desc_struct value = 0;
        OM_uint32 v8 = gss_set_cred_option(minor_status, &cred_handle, &__gss_krb5_set_allowable_enctypes_x_oid_desc, &value);
        krb5_data_free();
        goto LABEL_10;
      }
    }
    *OM_uint32 minor_status = v7;
    OM_uint32 v8 = 851968;
LABEL_10:
    krb5_storage_free();
    return v8;
  }
  *OM_uint32 minor_status = 12;
  return 851968;
}

OM_uint32 gss_krb5_ccache_name(OM_uint32 *minor_status, const char *name, const char **out_name)
{
  _gss_load_mech();
  if (out_name) {
    *out_name = 0;
  }
  if (name) {
    size_t v5 = strlen(name);
  }
  else {
    size_t v5 = 0;
  }
  v10[0] = v5;
  v10[1] = name;
  OM_uint32 v6 = (void *)_gss_mechs;
  if (_gss_mechs)
  {
    int v9 = 0;
    do
    {
      OM_uint32 v7 = (void (*)(int *, void, gss_OID_desc *, void *))v6[41];
      if (v7) {
        v7(&v9, 0, &__gss_krb5_ccache_name_x_oid_desc, v10);
      }
      OM_uint32 v6 = (void *)*v6;
    }
    while (v6);
  }
  return 0;
}

uint64_t __ApplePrivate_gsskrb5_extract_authtime_from_sec_context(OM_uint32 *minor_status, gss_ctx_id_t_desc_struct *a2, void *a3)
{
  gss_buffer_set_t data_set = 0;
  if (!a2)
  {
    uint64_t v5 = 851968;
    OM_uint32 v7 = 22;
LABEL_10:
    *OM_uint32 minor_status = v7;
    return v5;
  }
  uint64_t v5 = gss_inquire_sec_context_by_oid(minor_status, a2, &__gss_krb5_get_authtime_x_oid_desc, &data_set);
  if (!v5)
  {
    if (data_set && data_set->count == 1 && (elements = data_set->elements, elements->length == 4))
    {
      OM_uint32 v7 = 0;
      uint64_t v5 = 0;
      *a3 = *(int *)elements->value;
    }
    else
    {
      uint64_t v5 = 851968;
      OM_uint32 v7 = 22;
    }
    gss_release_buffer_set(minor_status, &data_set);
    goto LABEL_10;
  }
  return v5;
}

OM_uint32 gsskrb5_extract_authz_data_from_sec_context(OM_uint32 *minor_status, gss_ctx_id_t context_handle, int ad_type, gss_buffer_t ad_data)
{
  gss_buffer_set_t data_set = 0;
  if (!context_handle) {
    goto LABEL_3;
  }
  *(void *)&desired_object.size_t length = 0;
  if (der_get_oid()) {
    goto LABEL_3;
  }
  int v11 = malloc_type_calloc(1uLL, 4uLL, 0x100004052888210uLL);
  gss_buffer_desc_struct v18 = v11;
  if (!v11)
  {
    der_free_oid();
    goto LABEL_12;
  }
  krb5_context v12 = (int *)v11;
  der_free_oid();
  *krb5_context v12 = ad_type;
  desired_object.size_t length = der_length_oid();
  krb5_context v13 = malloc_type_malloc(desired_object.length, 0x8641AD8DuLL);
  desired_object.elements = v13;
  if (!v13)
  {
    free(v18);
    goto LABEL_12;
  }
  OM_uint32 v14 = v13;
  if (der_put_oid())
  {
    free(v18);
    free(v14);
LABEL_3:
    OM_uint32 v8 = 851968;
    OM_uint32 v9 = 22;
LABEL_4:
    *OM_uint32 minor_status = v9;
    return v8;
  }
  if (desired_object.length) {
    abort();
  }
  free(v18);
  OM_uint32 v8 = gss_inquire_sec_context_by_oid(minor_status, context_handle, &desired_object, &data_set);
  free(desired_object.elements);
  if (!v8)
  {
    if (!data_set || data_set->count != 1)
    {
      gss_release_buffer_set(minor_status, &data_set);
      goto LABEL_3;
    }
    OM_uint32 v15 = malloc_type_malloc(data_set->elements->length, 0xECBD9367uLL);
    ad_data->gss_buffer_desc_struct value = v15;
    if (v15)
    {
      elements = data_set->elements;
      size_t length = elements->length;
      ad_data->size_t length = elements->length;
      memcpy(v15, elements->value, length);
      gss_release_buffer_set(minor_status, &data_set);
      OM_uint32 v9 = 0;
      OM_uint32 v8 = 0;
      goto LABEL_4;
    }
    gss_release_buffer_set(minor_status, &data_set);
LABEL_12:
    OM_uint32 v8 = 851968;
    OM_uint32 v9 = 12;
    goto LABEL_4;
  }
  return v8;
}

uint64_t __ApplePrivate_gsskrb5_extract_service_keyblock(OM_uint32 *a1, gss_ctx_id_t_desc_struct *a2, krb5_keyblock **a3)
{
  return gsskrb5_extract_key(a1, a2, &__gss_krb5_get_service_keyblock_x_oid_desc, a3);
}

uint64_t gsskrb5_extract_key(OM_uint32 *a1, gss_ctx_id_t_desc_struct *a2, gss_OID_desc_struct *a3, krb5_keyblock **a4)
{
  krb5_context v11 = 0;
  gss_buffer_set_t data_set = 0;
  if (!a2) {
    goto LABEL_10;
  }
  krb5_error_code inited = krb5_init_context(&v11);
  if (inited)
  {
    *a1 = inited;
    return 851968;
  }
  uint64_t result = gss_inquire_sec_context_by_oid(a1, a2, a3, &data_set);
  if (result) {
    return result;
  }
  if (!data_set || data_set->count != 1)
  {
    gss_release_buffer_set(a1, &data_set);
LABEL_10:
    *a1 = 22;
    return 851968;
  }
  if (krb5_storage_from_mem())
  {
    *a4 = (krb5_keyblock *)malloc_type_calloc(1uLL, 0x18uLL, 0x10800404ACF7207uLL);
    int v10 = krb5_ret_keyblock();
    gss_release_buffer_set(a1, &data_set);
    krb5_storage_free();
  }
  else
  {
    gss_release_buffer_set(a1, &data_set);
    int v10 = 12;
  }
  if (a4 && v10)
  {
    krb5_free_keyblock(v11, *a4);
    *a4 = 0;
  }
  if (v11) {
    heim_release();
  }
  *a1 = v10;
  if (v10) {
    return 851968;
  }
  else {
    return 0;
  }
}

uint64_t __ApplePrivate_gsskrb5_get_initiator_subkey(OM_uint32 *a1, gss_ctx_id_t_desc_struct *a2, krb5_keyblock **a3)
{
  return gsskrb5_extract_key(a1, a2, &__gss_krb5_get_initiator_subkey_x_oid_desc, a3);
}

uint64_t __ApplePrivate_gsskrb5_get_subkey(OM_uint32 *a1, gss_ctx_id_t_desc_struct *a2, krb5_keyblock **a3)
{
  return gsskrb5_extract_key(a1, a2, &__gss_krb5_get_subkey_x_oid_desc, a3);
}

uint64_t __ApplePrivate_gsskrb5_set_default_realm(const char *a1)
{
  _gss_load_mech();
  v6[1] = a1;
  v6[0] = strlen(a1);
  gss_buffer_set_t v2 = (void *)_gss_mechs;
  if (_gss_mechs)
  {
    int v5 = 0;
    do
    {
      uint64_t v3 = (void (*)(int *, void, gss_OID_desc *, void *))v2[41];
      if (v3) {
        v3(&v5, 0, &__gss_krb5_set_default_realm_x_oid_desc, v6);
      }
      gss_buffer_set_t v2 = (void *)*v2;
    }
    while (v2);
  }
  return 0;
}

uint64_t __ApplePrivate_gss_krb5_get_tkt_flags(OM_uint32 *minor_status, gss_ctx_id_t_desc_struct *a2, _DWORD *a3)
{
  gss_buffer_set_t data_set = 0;
  if (a2)
  {
    uint64_t result = gss_inquire_sec_context_by_oid(minor_status, a2, &__gss_krb5_get_tkt_flags_x_oid_desc, &data_set);
    if (result) {
      return result;
    }
    if (data_set)
    {
      if (data_set->count == 1)
      {
        elements = data_set->elements;
        if (elements->length > 3)
        {
          *a3 = *(_DWORD *)elements->value;
          gss_release_buffer_set(minor_status, &data_set);
          return 0;
        }
      }
    }
    gss_release_buffer_set(minor_status, &data_set);
  }
  *OM_uint32 minor_status = 22;
  return 851968;
}

uint64_t __ApplePrivate_gsskrb5_set_time_offset(int a1)
{
  int v4 = a1;
  _gss_load_mech();
  v6[0] = 4;
  v6[1] = &v4;
  krb5_context v1 = (void *)_gss_mechs;
  if (_gss_mechs)
  {
    int v5 = 0;
    do
    {
      gss_buffer_set_t v2 = (void (*)(int *, void, gss_OID_desc *, void *))v1[41];
      if (v2) {
        v2(&v5, 0, &__gss_krb5_set_time_offset_x_oid_desc, v6);
      }
      krb5_context v1 = (void *)*v1;
    }
    while (v1);
  }
  return 0;
}

uint64_t __ApplePrivate_gsskrb5_get_time_offset(_DWORD *a1)
{
  _gss_load_mech();
  v6[0] = 4;
  v6[1] = &v5;
  gss_buffer_set_t v2 = (void *)_gss_mechs;
  if (!_gss_mechs) {
    return 0x100000;
  }
  uint64_t v5 = 0;
  while (1)
  {
    uint64_t v3 = (uint64_t (*)(char *, void, gss_OID_desc *, void *))v2[41];
    if (v3)
    {
      uint64_t result = v3((char *)&v5 + 4, 0, &__gss_krb5_get_time_offset_x_oid_desc, v6);
      if (!result) {
        break;
      }
    }
    gss_buffer_set_t v2 = (void *)*v2;
    if (!v2) {
      return 0x100000;
    }
  }
  *a1 = v5;
  return result;
}

uint64_t _gss_load_mech()
{
  uint64_t v127 = *MEMORY[0x263EF8340];
  pthread_mutex_lock(&_gss_mech_mutex);
  if (_gss_mechs)
  {
    return pthread_mutex_unlock(&_gss_mech_mutex);
  }
  else
  {
    OM_uint32 minor_status = 0;
    if (!gss_create_empty_oid_set(&minor_status, (gss_OID_set *)&_gss_mech_oids))
    {
      krb5_context v1 = __gss_pku2u_initialize();
      add_builtin((uint64_t)v1);
      gss_buffer_set_t v2 = __gss_iakerb_initialize();
      add_builtin((uint64_t)v2);
      uint64_t v3 = __gss_ntlm_initialize();
      add_builtin((uint64_t)v3);
      uint64_t v4 = __gss_scram_initialize();
      add_builtin(v4);
      uint64_t v5 = __gss_netlogon_initialize();
      add_builtin((uint64_t)v5);
      OM_uint32 v6 = __gss_spnego_initialize();
      add_builtin((uint64_t)v6);
      OM_uint32 v7 = __gss_krb5_initialize();
      add_builtin((uint64_t)v7);
      OM_uint32 v125 = 0;
      b.elements = 0;
      __stringp = 0;
      *(void *)&b.size_t length = 0;
      int v122 = 0;
      if (!csops() && (v122 & 0x800) == 0)
      {
        OM_uint32 v8 = fopen("/etc/gss/mech", "r");
        if (v8)
        {
          OM_uint32 v9 = v8;
          rk_cloexec_file();
          if (fgets(v126, 256, v9))
          {
            uint64_t v10 = MEMORY[0x263EF8318];
            v120 = v9;
            do
            {
              if (v126[0] != 35)
              {
                __stringp = v126;
                krb5_context v11 = strsep(&__stringp, "\t\n ");
                if (__stringp)
                {
                  for (uint64_t i = __stringp + 1; ; ++i)
                  {
                    uint64_t v13 = *(i - 1);
                    if (*(i - 1) < 0)
                    {
                      if (!__maskrune(v13, 0x4000uLL)) {
                        break;
                      }
                    }
                    else if ((*(_DWORD *)(v10 + 4 * v13 + 60) & 0x4000) == 0)
                    {
                      break;
                    }
                    __stringp = i;
                  }
                }
                OM_uint32 v14 = strsep(&__stringp, "\t\n ");
                if (__stringp)
                {
                  for (j = __stringp + 1; ; ++j)
                  {
                    uint64_t v16 = *(j - 1);
                    if (*(j - 1) < 0)
                    {
                      if (!__maskrune(v16, 0x4000uLL)) {
                        break;
                      }
                    }
                    else if ((*(_DWORD *)(v10 + 4 * v16 + 60) & 0x4000) == 0)
                    {
                      break;
                    }
                    __stringp = j;
                  }
                }
                int v17 = strsep(&__stringp, "\t\n ");
                if (__stringp)
                {
                  for (k = __stringp + 1; ; ++k)
                  {
                    uint64_t v19 = *(k - 1);
                    if (*(k - 1) < 0)
                    {
                      if (!__maskrune(v19, 0x4000uLL)) {
                        break;
                      }
                    }
                    else if ((*(_DWORD *)(v10 + 4 * v19 + 60) & 0x4000) == 0)
                    {
                      break;
                    }
                    __stringp = k;
                  }
                }
                OM_uint32 v20 = strsep(&__stringp, "\t\n ");
                if (v11)
                {
                  if (v14)
                  {
                    if (v17)
                    {
                      if (v20)
                      {
                        b.size_t length = 0;
                        b.elements = 0;
                        int v21 = 1;
                        gss_name_t v22 = v14;
                        do
                        {
                          BOOL v23 = strchr(v22, 46);
                          gss_name_t v22 = v23 + 1;
                          --v21;
                        }
                        while (v23);
                        if (v21)
                        {
                          uint64_t v24 = 0;
                          char v25 = 1;
                          do
                          {
                            size_t v26 = 0;
                            int v27 = 0;
                            char v28 = v25;
                            int v29 = v14;
                            do
                            {
                              uint64_t v30 = v29;
                              OM_uint32 v31 = strchr(v29, 46);
                              unsigned int v32 = 0;
                              int v29 = v31 + 1;
                              while (1)
                              {
                                int v33 = *v30;
                                if (!*v30 || v33 == 46) {
                                  break;
                                }
                                unsigned int v32 = (char)v33 + 10 * v32 - 48;
                                ++v30;
                              }
                              if (v27)
                              {
                                if (v27 == 1)
                                {
                                  if (v24) {
                                    *v24++ += v32;
                                  }
                                  ++v26;
                                }
                                else
                                {
                                  unsigned int v34 = 0;
                                  if (v32)
                                  {
                                    unsigned int v35 = v32;
                                    do
                                    {
                                      ++v34;
                                      BOOL v36 = v35 > 0x7F;
                                      v35 >>= 7;
                                    }
                                    while (v36);
                                  }
                                  if (v34 <= 1) {
                                    unsigned int v34 = 1;
                                  }
                                  int v37 = 7 * v34 - 7;
                                  do
                                  {
                                    if (v24) {
                                      *v24++ = (v32 >> v37) & 0x7F | ((v37 != 0) << 7);
                                    }
                                    v37 -= 7;
                                  }
                                  while (v37 != -7);
                                  v26 += v34 - 1 + 1;
                                }
                              }
                              else if (v24)
                              {
                                unsigned char *v24 = 40 * v32;
                              }
                              ++v27;
                            }
                            while (v31);
                            if (!v26) {
                              goto LABEL_12;
                            }
                            if (!v24)
                            {
                              uint64_t v38 = malloc_type_malloc(v26, 0xAC0F32ADuLL);
                              if (!v38) {
                                goto LABEL_12;
                              }
                              uint64_t v24 = v38;
                              b.size_t length = v26;
                              b.elements = v38;
                            }
                            char v25 = 0;
                          }
                          while ((v28 & 1) != 0);
                          uint64_t v39 = &_gss_mechs;
                          while (1)
                          {
                            uint64_t v39 = (uint64_t *)*v39;
                            if (!v39) {
                              break;
                            }
                            if (gss_oid_equal((gss_const_OID)(v39 + 7), &b))
                            {
                              free(b.elements);
                              goto LABEL_12;
                            }
                          }
                          uint64_t v40 = dlopen(v17, 5);
                          if (!v40) {
                            goto LABEL_196;
                          }
                          uint64_t v41 = (char *)malloc_type_calloc(1uLL, 0x228uLL, 0x10F00406CEBB635uLL);
                          if (!v41) {
                            goto LABEL_196;
                          }
                          uint64_t v42 = v41;
                          *((void *)v41 + 4) = v40;
                          *(gss_OID_desc *)(v41 + 8) = b;
                          *((void *)v41 + 6) = strdup(v11);
                          *(gss_OID_desc *)(v42 + 7) = b;
                          *((_DWORD *)v42 + 18) = 0;
                          uint64_t v43 = malloc_type_calloc(1uLL, 0x20uLL, 0x8004018A671A6uLL);
                          v42[67] = v43;
                          if (!v43
                            || gss_add_oid_set_member(&v125, (gss_const_OID)(v42 + 7), (gss_OID_set *)&_gss_mech_oids) >> 16)
                          {
                            goto LABEL_195;
                          }
                          uint64_t v44 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_name_t, OM_uint32, gss_OID_set, gss_cred_usage_t, gss_cred_id_t *, gss_OID_set *, OM_uint32 *))dlsym(v40, "gss_acquire_cred");
                          v42[10] = v44;
                          if (!v44 || v44 == gss_acquire_cred)
                          {
                            v108 = (FILE *)*MEMORY[0x263EF8348];
                            v109 = "can't find symbol gss_acquire_cred\n";
                            goto LABEL_193;
                          }
                          uint64_t v45 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_cred_id_t *))dlsym(v40, "gss_release_cred");
                          v42[11] = v45;
                          if (!v45 || v45 == gss_release_cred)
                          {
                            v108 = (FILE *)*MEMORY[0x263EF8348];
                            v109 = "can't find symbol gss_release_cred\n";
                            goto LABEL_193;
                          }
                          uint64_t v46 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_cred_id_t, gss_ctx_id_t *, gss_name_t, gss_OID, OM_uint32, OM_uint32, gss_channel_bindings_t, gss_buffer_t, gss_OID *, gss_buffer_t, OM_uint32 *, OM_uint32 *))dlsym(v40, "gss_init_sec_context");
                          v42[12] = v46;
                          if (!v46 || v46 == gss_init_sec_context)
                          {
                            v108 = (FILE *)*MEMORY[0x263EF8348];
                            v109 = "can't find symbol gss_init_sec_context\n";
                            size_t v110 = 39;
                            goto LABEL_194;
                          }
                          unsigned int v47 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_ctx_id_t *, gss_cred_id_t, gss_buffer_t, gss_channel_bindings_t, gss_name_t *, gss_OID *, gss_buffer_t, OM_uint32 *, OM_uint32 *, gss_cred_id_t *))dlsym(v40, "gss_accept_sec_context");
                          v42[13] = v47;
                          if (!v47 || v47 == gss_accept_sec_context)
                          {
                            v108 = (FILE *)*MEMORY[0x263EF8348];
                            v109 = "can't find symbol gss_accept_sec_context\n";
                            goto LABEL_199;
                          }
                          uint64_t v48 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_ctx_id_t, gss_buffer_t))dlsym(v40, "gss_process_context_token");
                          v42[14] = v48;
                          if (!v48 || v48 == gss_process_context_token)
                          {
                            v108 = (FILE *)*MEMORY[0x263EF8348];
                            v109 = "can't find symbol gss_process_context_token\n";
                            size_t v110 = 44;
                            goto LABEL_194;
                          }
                          uint64_t v49 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_ctx_id_t *, gss_buffer_t))dlsym(v40, "gss_delete_sec_context");
                          v42[15] = v49;
                          if (!v49 || v49 == gss_delete_sec_context)
                          {
                            v108 = (FILE *)*MEMORY[0x263EF8348];
                            v109 = "can't find symbol gss_delete_sec_context\n";
LABEL_199:
                            size_t v110 = 41;
                            goto LABEL_194;
                          }
                          uint64_t v50 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_ctx_id_t, OM_uint32 *))dlsym(v40, "gss_context_time");
                          v42[16] = v50;
                          if (!v50 || v50 == gss_context_time)
                          {
                            v108 = (FILE *)*MEMORY[0x263EF8348];
                            v109 = "can't find symbol gss_context_time\n";
LABEL_193:
                            size_t v110 = 35;
                            goto LABEL_194;
                          }
                          uint64_t v51 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_ctx_id_t, gss_qop_t, gss_buffer_t, gss_buffer_t))dlsym(v40, "gss_get_mic");
                          v42[17] = v51;
                          if (!v51 || v51 == gss_get_mic)
                          {
                            v108 = (FILE *)*MEMORY[0x263EF8348];
                            v109 = "can't find symbol gss_get_mic\n";
                            size_t v110 = 30;
                            goto LABEL_194;
                          }
                          OM_uint32 v52 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_ctx_id_t, gss_buffer_t, gss_buffer_t, gss_qop_t *))dlsym(v40, "gss_verify_mic");
                          v42[18] = v52;
                          if (!v52 || v52 == gss_verify_mic)
                          {
                            v108 = (FILE *)*MEMORY[0x263EF8348];
                            v109 = "can't find symbol gss_verify_mic\n";
                            size_t v110 = 33;
                            goto LABEL_194;
                          }
                          uint64_t v53 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_ctx_id_t, int, gss_qop_t, gss_buffer_t, int *, gss_buffer_t))dlsym(v40, "gss_wrap");
                          v42[19] = v53;
                          if (!v53 || v53 == gss_wrap)
                          {
                            v108 = (FILE *)*MEMORY[0x263EF8348];
                            v109 = "can't find symbol gss_wrap\n";
                            size_t v110 = 27;
                            goto LABEL_194;
                          }
                          uint64_t v54 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_ctx_id_t, gss_buffer_t, gss_buffer_t, int *, gss_qop_t *))dlsym(v40, "gss_unwrap");
                          v42[20] = v54;
                          if (!v54 || v54 == gss_unwrap)
                          {
                            v108 = (FILE *)*MEMORY[0x263EF8348];
                            v109 = "can't find symbol gss_unwrap\n";
                            size_t v110 = 29;
                            goto LABEL_194;
                          }
                          OM_uint32 v55 = (OM_uint32 (__cdecl *)(OM_uint32 *, OM_uint32, int, gss_OID, OM_uint32 *, gss_buffer_t))dlsym(v40, "gss_display_status");
                          v42[21] = v55;
                          if (!v55 || v55 == gss_display_status)
                          {
                            v108 = (FILE *)*MEMORY[0x263EF8348];
                            v109 = "can't find symbol gss_display_status\n";
                            goto LABEL_209;
                          }
                          uint64_t v56 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_OID_set *))dlsym(v40, "gss_indicate_mechs");
                          v42[22] = v56;
                          if (!v56 || v56 == gss_indicate_mechs)
                          {
                            v108 = (FILE *)*MEMORY[0x263EF8348];
                            v109 = "can't find symbol gss_indicate_mechs\n";
                            goto LABEL_209;
                          }
                          size_t v57 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_name_t, gss_name_t, int *))dlsym(v40, "gss_compare_name");
                          v42[23] = v57;
                          if (!v57 || v57 == gss_compare_name)
                          {
                            v108 = (FILE *)*MEMORY[0x263EF8348];
                            v109 = "can't find symbol gss_compare_name\n";
                            goto LABEL_193;
                          }
                          uint64_t v58 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_name_t, gss_buffer_t, gss_OID *))dlsym(v40, "gss_display_name");
                          v42[24] = v58;
                          if (!v58 || v58 == gss_display_name)
                          {
                            v108 = (FILE *)*MEMORY[0x263EF8348];
                            v109 = "can't find symbol gss_display_name\n";
                            goto LABEL_193;
                          }
                          uint64_t v59 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_buffer_t, gss_const_OID, gss_name_t *))dlsym(v40, "gss_import_name");
                          v42[25] = v59;
                          if (!v59 || v59 == gss_import_name)
                          {
                            v108 = (FILE *)*MEMORY[0x263EF8348];
                            v109 = "can't find symbol gss_import_name\n";
LABEL_214:
                            size_t v110 = 34;
                            goto LABEL_194;
                          }
                          uint64_t v60 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_name_t, gss_buffer_t))dlsym(v40, "gss_export_name");
                          v42[26] = v60;
                          if (!v60 || v60 == gss_export_name)
                          {
                            v108 = (FILE *)*MEMORY[0x263EF8348];
                            v109 = "can't find symbol gss_export_name\n";
                            goto LABEL_214;
                          }
                          uint64_t v61 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_name_t *))dlsym(v40, "gss_release_name");
                          v42[27] = v61;
                          if (!v61 || v61 == gss_release_name)
                          {
                            v108 = (FILE *)*MEMORY[0x263EF8348];
                            v109 = "can't find symbol gss_release_name\n";
                            goto LABEL_193;
                          }
                          uint64_t v62 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_cred_id_t, gss_name_t *, OM_uint32 *, gss_cred_usage_t *, gss_OID_set *))dlsym(v40, "gss_inquire_cred");
                          v42[28] = v62;
                          if (!v62 || v62 == gss_inquire_cred)
                          {
                            v108 = (FILE *)*MEMORY[0x263EF8348];
                            v109 = "can't find symbol gss_inquire_cred\n";
                            goto LABEL_193;
                          }
                          uint64_t v63 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_ctx_id_t, gss_name_t *, gss_name_t *, OM_uint32 *, gss_OID *, OM_uint32 *, int *, int *))dlsym(v40, "gss_inquire_context");
                          v42[29] = v63;
                          if (!v63 || v63 == gss_inquire_context)
                          {
                            v108 = (FILE *)*MEMORY[0x263EF8348];
                            v109 = "can't find symbol gss_inquire_context\n";
                            goto LABEL_219;
                          }
                          uint64_t v64 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_ctx_id_t, int, gss_qop_t, OM_uint32, OM_uint32 *))dlsym(v40, "gss_wrap_size_limit");
                          v42[30] = v64;
                          if (!v64 || v64 == gss_wrap_size_limit)
                          {
                            v108 = (FILE *)*MEMORY[0x263EF8348];
                            v109 = "can't find symbol gss_wrap_size_limit\n";
LABEL_219:
                            size_t v110 = 38;
LABEL_194:
                            fwrite(v109, v110, 1uLL, v108);
LABEL_195:
                            free((void *)v42[67]);
                            free((void *)v42[8]);
                            free((void *)v42[6]);
                            free(v42);
LABEL_196:
                            dlclose(v40);
                            goto LABEL_12;
                          }
                          krb5_data v65 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_cred_id_t, gss_name_t, gss_OID, gss_cred_usage_t, OM_uint32, OM_uint32, gss_cred_id_t *, gss_OID_set *, OM_uint32 *, OM_uint32 *))dlsym(v40, "gss_add_cred");
                          v42[31] = v65;
                          if (!v65 || v65 == gss_add_cred)
                          {
                            v108 = (FILE *)*MEMORY[0x263EF8348];
                            v109 = "can't find symbol gss_add_cred\n";
                            size_t v110 = 31;
                            goto LABEL_194;
                          }
                          char v66 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_cred_id_t, gss_OID, gss_name_t *, OM_uint32 *, OM_uint32 *, gss_cred_usage_t *))dlsym(v40, "gss_inquire_cred_by_mech");
                          v42[32] = v66;
                          if (!v66 || v66 == gss_inquire_cred_by_mech)
                          {
                            v108 = (FILE *)*MEMORY[0x263EF8348];
                            v109 = "can't find symbol gss_inquire_cred_by_mech\n";
                            size_t v110 = 43;
                            goto LABEL_194;
                          }
                          char v67 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_ctx_id_t *, gss_buffer_t))dlsym(v40, "gss_export_sec_context");
                          v42[33] = v67;
                          if (!v67 || v67 == gss_export_sec_context)
                          {
                            v108 = (FILE *)*MEMORY[0x263EF8348];
                            v109 = "can't find symbol gss_export_sec_context\n";
                            goto LABEL_199;
                          }
                          char v68 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_buffer_t, gss_ctx_id_t *))dlsym(v40, "gss_import_sec_context");
                          v42[34] = v68;
                          if (!v68 || v68 == gss_import_sec_context)
                          {
                            v108 = (FILE *)*MEMORY[0x263EF8348];
                            v109 = "can't find symbol gss_import_sec_context\n";
                            goto LABEL_199;
                          }
                          uint64_t v69 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_const_OID, gss_OID_set *))dlsym(v40, "gss_inquire_names_for_mech");
                          v42[35] = v69;
                          if (!v69 || v69 == gss_inquire_names_for_mech)
                          {
                            v108 = (FILE *)*MEMORY[0x263EF8348];
                            v109 = "can't find symbol gss_inquire_names_for_mech\n";
                            goto LABEL_226;
                          }
                          uint64_t v70 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_name_t, gss_OID_set *))dlsym(v40, "gss_inquire_mechs_for_name");
                          v42[36] = v70;
                          if (!v70 || v70 == gss_inquire_mechs_for_name)
                          {
                            v108 = (FILE *)*MEMORY[0x263EF8348];
                            v109 = "can't find symbol gss_inquire_mechs_for_name\n";
LABEL_226:
                            size_t v110 = 45;
                            goto LABEL_194;
                          }
                          uint64_t v71 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_name_t, gss_OID, gss_name_t *))dlsym(v40, "gss_canonicalize_name");
                          v42[37] = v71;
                          if (!v71 || v71 == gss_canonicalize_name)
                          {
                            v108 = (FILE *)*MEMORY[0x263EF8348];
                            v109 = "can't find symbol gss_canonicalize_name\n";
                            size_t v110 = 40;
                            goto LABEL_194;
                          }
                          uint64_t v72 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_name_t, gss_name_t *))dlsym(v40, "gss_duplicate_name");
                          v42[38] = v72;
                          if (!v72 || v72 == gss_duplicate_name)
                          {
                            v108 = (FILE *)*MEMORY[0x263EF8348];
                            v109 = "can't find symbol gss_duplicate_name\n";
LABEL_209:
                            size_t v110 = 37;
                            goto LABEL_194;
                          }
                          unint64_t v73 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_cred_id_t, gss_OID, gss_buffer_set_t *))dlsym(v40, "gss_inquire_cred_by_oid");
                          if (v73 == gss_inquire_cred_by_oid) {
                            unsigned int v74 = 0;
                          }
                          else {
                            unsigned int v74 = v73;
                          }
                          v42[40] = v74;
                          uint64_t v75 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_ctx_id_t, gss_OID, gss_buffer_set_t *))dlsym(v40, "gss_inquire_sec_context_by_oid");
                          if (v75 == gss_inquire_sec_context_by_oid) {
                            uint64_t v76 = 0;
                          }
                          else {
                            uint64_t v76 = v75;
                          }
                          v42[39] = v76;
                          gss_name_t v77 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_ctx_id_t *, gss_OID, gss_buffer_t))dlsym(v40, "gss_set_sec_context_option");
                          if (v77 == gss_set_sec_context_option) {
                            v78 = 0;
                          }
                          else {
                            v78 = v77;
                          }
                          v42[41] = v78;
                          v42[42] = dlsym(v40, "gssspi_set_cred_option");
                          gss_cred_id_t v79 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_ctx_id_t, int, gss_buffer_t, ssize_t, gss_buffer_t))dlsym(v40, "gss_pseudo_random");
                          if (v79 == gss_pseudo_random) {
                            krb5_context v80 = 0;
                          }
                          else {
                            krb5_context v80 = v79;
                          }
                          v42[43] = v80;
                          krb5_context v81 = dlsym(v40, "gss_wrap_iov");
                          if (v81 == __ApplePrivate_gss_wrap_iov) {
                            gss_OID_desc v82 = 0;
                          }
                          else {
                            gss_OID_desc v82 = v81;
                          }
                          v42[44] = v82;
                          uint64_t v83 = dlsym(v40, "gss_unwrap_iov");
                          if (v83 == __ApplePrivate_gss_unwrap_iov) {
                            v84 = 0;
                          }
                          else {
                            v84 = v83;
                          }
                          v42[45] = v84;
                          long long v85 = dlsym(v40, "gss_wrap_iov_length");
                          if (v85 == __ApplePrivate_gss_wrap_iov_length) {
                            uint64_t v86 = 0;
                          }
                          else {
                            uint64_t v86 = v85;
                          }
                          v42[46] = v86;
                          long long v87 = (uint64_t (*)(OM_uint32 *, uint64_t, uint64_t, gss_const_OID, uint64_t, uint64_t, gss_OID_set *, _DWORD *))dlsym(v40, "gss_store_cred");
                          if (v87 == gss_store_cred) {
                            long long v88 = 0;
                          }
                          else {
                            long long v88 = v87;
                          }
                          v42[47] = v88;
                          long long v89 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_cred_id_t, gss_buffer_t))dlsym(v40, "gss_export_cred");
                          if (v89 == gss_export_cred) {
                            uint64_t v90 = 0;
                          }
                          else {
                            uint64_t v90 = v89;
                          }
                          v42[48] = v90;
                          v91 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_buffer_t, gss_cred_id_t *))dlsym(v40, "gss_import_cred");
                          if (v91 == gss_import_cred) {
                            v92 = 0;
                          }
                          else {
                            v92 = v91;
                          }
                          v42[49] = v92;
                          v93 = dlsym(v40, "gss_display_name_ext");
                          if (v93 == gss_display_name_ext) {
                            v94 = 0;
                          }
                          else {
                            v94 = v93;
                          }
                          v42[61] = v94;
                          v95 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_name_t, int *, gss_OID *, gss_buffer_set_t *))dlsym(v40, "gss_inquire_name");
                          if (v95 == gss_inquire_name) {
                            v96 = 0;
                          }
                          else {
                            v96 = v95;
                          }
                          v42[62] = v96;
                          v97 = dlsym(v40, "gss_get_name_attribute");
                          if (v97 == gss_get_name_attribute) {
                            v98 = 0;
                          }
                          else {
                            v98 = v97;
                          }
                          v42[63] = v98;
                          v99 = (uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t, uint64_t))dlsym(v40, "gss_set_name_attribute");
                          if (v99 == gss_set_name_attribute) {
                            v100 = 0;
                          }
                          else {
                            v100 = v99;
                          }
                          v42[64] = v100;
                          v101 = (uint64_t (*)(_DWORD *, uint64_t, uint64_t))dlsym(v40, "gss_delete_name_attribute");
                          if (v101 == gss_delete_name_attribute) {
                            v102 = 0;
                          }
                          else {
                            v102 = v101;
                          }
                          v42[65] = v102;
                          v103 = dlsym(v40, "gss_export_name_composite");
                          if (v103 == gss_export_name_composite) {
                            v104 = 0;
                          }
                          else {
                            v104 = v103;
                          }
                          v42[66] = v104;
                          v105 = (uint64_t (*)(unsigned int *, uint64_t, const gss_OID_desc *, uid_t *))dlsym(v40, "gss_pname_to_uid");
                          if (v105 == gss_pname_to_uid) {
                            v106 = 0;
                          }
                          else {
                            v106 = v105;
                          }
                          v42[59] = v106;
                          v42[60] = dlsym(v40, "gssspi_authorize_localname");
                          v107 = dlsym(v40, "gss_mo_init");
                          if (v107)
                          {
                            if (((unsigned int (*)(OM_uint32 *, gss_OID_desc *, void *, void *))v107)(&v125, &b, v42 + 57, v42 + 58) >= 0x10000)goto LABEL_195; {
                          }
                            }
                          else
                          {
                            v111 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_OID, gss_buffer_t, gss_buffer_t, gss_buffer_t))dlsym(v40, "gss_inquire_saslname_for_mech");
                            if (v111 == gss_inquire_saslname_for_mech) {
                              v112 = 0;
                            }
                            else {
                              v112 = v111;
                            }
                            *(void *)v42[67] = v112;
                            v113 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_buffer_t, gss_OID *))dlsym(v40, "gss_inquire_mech_for_saslname");
                            if (v113 == gss_inquire_mech_for_saslname) {
                              v114 = 0;
                            }
                            else {
                              v114 = v113;
                            }
                            *(void *)(v42[67] + 8) = v114;
                            v115 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_const_OID, gss_OID_set *, gss_OID_set *))dlsym(v40, "gss_inquire_attrs_for_mech");
                            if (v115 == gss_inquire_attrs_for_mech) {
                              v116 = 0;
                            }
                            else {
                              v116 = v115;
                            }
                            *(void *)(v42[67] + 16) = v116;
                            v117 = (OM_uint32 (__cdecl *)(OM_uint32 *, gss_name_t, gss_buffer_t, OM_uint32, gss_OID_set, gss_cred_usage_t, gss_cred_id_t *, gss_OID_set *, OM_uint32 *))dlsym(v40, "gssspi_acquire_cred_with_password");
                            if (v117 == gss_acquire_cred_with_password) {
                              v118 = 0;
                            }
                            else {
                              v118 = v117;
                            }
                            *(void *)(v42[67] + 24) = v118;
                          }
                          v119 = (void (*)(OM_uint32 *, void *, void *))v42[35];
                          if (v119) {
                            v119(&v125, v42 + 7, v42 + 3);
                          }
                          if (!v42[3]) {
                            gss_create_empty_oid_set(&v125, (gss_OID_set *)v42 + 3);
                          }
                          void *v42 = _gss_mechs;
                          _gss_mechs = (uint64_t)v42;
                        }
                      }
                    }
                  }
                }
              }
LABEL_12:
              OM_uint32 v9 = v120;
            }
            while (fgets(v126, 256, v120));
          }
          fclose(v9);
        }
      }
    }
    return pthread_mutex_unlock(&_gss_mech_mutex);
  }
}

uint64_t add_builtin(uint64_t result)
{
  if (result)
  {
    krb5_context v1 = (_OWORD *)result;
    uint64_t result = (uint64_t)malloc_type_calloc(1uLL, 0x228uLL, 0x10F00406CEBB635uLL);
    if (result)
    {
      uint64_t v2 = result;
      OM_uint32 minor_status = 0;
      *(void *)(result + 32) = 0;
      memcpy((void *)(result + 40), v1, 0x200uLL);
      *(_OWORD *)(v2 + 8) = v1[1];
      uint64_t result = gss_add_oid_set_member(&minor_status, (gss_const_OID)(v2 + 56), (gss_OID_set *)&_gss_mech_oids);
      uint64_t v3 = *(uint64_t (**)(OM_uint32 *, uint64_t, uint64_t))(v2 + 280);
      if (v3) {
        uint64_t result = v3(&minor_status, v2 + 56, v2 + 24);
      }
      if (!*(void *)(v2 + 24))
      {
        gss_create_empty_oid_set(&minor_status, (gss_OID_set *)(v2 + 24));
        gss_add_oid_set_member(&minor_status, &__gss_c_nt_user_name_oid_desc, (gss_OID_set *)(v2 + 24));
        uint64_t result = gss_add_oid_set_member(&minor_status, &__gss_c_nt_hostbased_service_oid_desc, (gss_OID_set *)(v2 + 24));
      }
      *(void *)uint64_t v2 = _gss_mechs;
      _gss_mechs = v2;
    }
  }
  return result;
}

uint64_t *__gss_get_mechanism(const gss_OID_desc *a1)
{
  _gss_load_mech();
  uint64_t v2 = &_gss_mechs;
  while (1)
  {
    uint64_t v2 = (uint64_t *)*v2;
    if (!v2) {
      break;
    }
    if (gss_oid_equal((gss_const_OID)(v2 + 7), a1)) {
      return v2 + 5;
    }
  }
  return 0;
}

uint64_t *_gss_mg_support_mechanism(const gss_OID_desc *a1)
{
  _gss_load_mech();
  uint64_t v2 = &_gss_mechs;
  while (1)
  {
    uint64_t v2 = (uint64_t *)*v2;
    if (!v2) {
      break;
    }
    if (gss_oid_equal((gss_const_OID)(v2 + 7), a1)) {
      return v2 + 1;
    }
  }
  return 0;
}

uint64_t *_gss_mg_get_underlaying_mech_name(uint64_t a1, gss_const_OID a)
{
  uint64_t v3 = (uint64_t **)(a1 + 48);
  while (1)
  {
    uint64_t v3 = (uint64_t **)*v3;
    if (!v3) {
      break;
    }
    if (gss_oid_equal(a, (gss_const_OID)v3[2])) {
      return v3[3];
    }
  }
  return 0;
}

uint64_t _gss_find_mn(unsigned int *a1, uint64_t a2, gss_const_OID a, gss_OID_desc **a4)
{
  uint64_t v4 = a2;
  *a4 = 0;
  if (a2)
  {
    OM_uint32 v8 = (gss_OID_desc **)(a2 + 48);
    OM_uint32 v9 = (gss_OID_desc *)(a2 + 48);
    while (1)
    {
      OM_uint32 v9 = *(gss_OID_desc **)&v9->length;
      if (!v9) {
        break;
      }
      if (gss_oid_equal(a, *(gss_const_OID *)&v9[1].length)) {
        goto LABEL_5;
      }
    }
    if (*(void *)(v4 + 40))
    {
      mechanism = __gss_get_mechanism(a);
      if (mechanism)
      {
        uint64_t v11 = (uint64_t)mechanism;
        krb5_context v12 = (gss_OID_desc *)malloc_type_malloc(0x20uLL, 0x20040DC1BFBCFuLL);
        if (v12)
        {
          OM_uint32 v9 = v12;
          if (*(void *)(v4 + 24)) {
            uint64_t v13 = v4 + 16;
          }
          else {
            uint64_t v13 = 0;
          }
          uint64_t v14 = (*(uint64_t (**)(unsigned int *, uint64_t, uint64_t, void **))(v11 + 160))(a1, v4 + 32, v13, &v12[1].elements);
          if (!v14)
          {
            *(void *)&v9[1].size_t length = v11 + 16;
            *(void *)&v9->size_t length = *v8;
            v9->elements = (void *)v11;
            FILE *v8 = v9;
LABEL_5:
            uint64_t v4 = 0;
            *a4 = v9;
            return v4;
          }
          uint64_t v4 = v14;
          _gss_mg_error(v11, *a1);
          free(v9);
        }
        else
        {
          return 851968;
        }
      }
      else
      {
        return 0x10000;
      }
    }
    else
    {
      return 0x20000;
    }
  }
  return v4;
}

void *_gss_create_name(uint64_t a1, uint64_t a2)
{
  if (getTypeID_inited != -1) {
    dispatch_once(&getTypeID_inited, &__block_literal_global_0);
  }
  if (!getTypeID_haid) {
    return 0;
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  uint64_t v5 = (void *)Instance;
  if (Instance)
  {
    *(void *)(Instance + 48) = 0;
    if (a1)
    {
      OM_uint32 v6 = malloc_type_malloc(0x20uLL, 0x20040DC1BFBCFuLL);
      if (v6)
      {
        void v6[2] = a2 + 16;
        v6[3] = a1;
        *OM_uint32 v6 = v5[6];
        v6[1] = a2;
        v5[6] = v6;
        return v5;
      }
      CFRelease(v5);
      return 0;
    }
  }
  return v5;
}

uint64_t _gss_mg_release_name(gss_buffer_desc_struct *a1)
{
  OM_uint32 minor_status = 0;
  _gss_free_oid(&minor_status, (uint64_t)&a1[1]);
  while (1)
  {
    size_t length = (size_t *)a1[3].length;
    if (!length) {
      break;
    }
    size_t v3 = length[1];
    a1[3].size_t length = *length;
    (*(void (**)(OM_uint32 *, size_t *))(v3 + 176))(&minor_status, length + 3);
    free(length);
  }
  return gss_release_buffer(&minor_status, a1 + 2);
}

void _gss_mg_check_name(const void *a1)
{
  if (a1)
  {
    CFTypeID v1 = CFGetTypeID(a1);
    if (getTypeID_inited != -1) {
      dispatch_once(&getTypeID_inited, &__block_literal_global_0);
    }
    if (v1 != getTypeID_haid)
    {
      int v2 = heim_abort();
      _gss_mech_import_name(v2, v3, v4, v5, v6);
    }
  }
}

uint64_t _gss_mech_import_name(_DWORD *a1, const void **a2, uint64_t a3, unint64_t *a4, gss_const_OID a, void *a6)
{
  *a1 = 0;
  if (!a6) {
    return 0x2000000;
  }
  unint64_t v19 = 0;
  uint64_t v20 = 0;
  *a6 = 0;
  if (gss_oid_equal(a, &__gss_c_nt_export_name_oid_desc))
  {
    unint64_t v12 = *a4;
    uint64_t v13 = *(unsigned int *)a2;
    if (*a4 < (v13 + 10)) {
      return 0x20000;
    }
    uint64_t v14 = (unsigned __int8 *)a4[1];
    if (*(unsigned __int16 *)v14 ^ 0x104 | v14[2]) {
      return 0x20000;
    }
    if (v13 + 2 != v14[3]) {
      return 0x20000;
    }
    if (__PAIR64__(v13, 6) != __PAIR64__(v14[5], v14[4])) {
      return 0x20000;
    }
    if (memcmp(v14 + 6, a2[1], *(unsigned int *)a2)) {
      return 0x20000;
    }
    unint64_t v15 = bswap32(*(_DWORD *)&v14[v13 + 6]);
    if (v15 > v12 - v13 - 10) {
      return 0x20000;
    }
    unint64_t v19 = v15;
    uint64_t v20 = (uint64_t)&v14[v13 + 10];
    a4 = &v19;
  }
  if (!*(void *)(a3 + 8)) {
    return 196608;
  }
  for (uint64_t i = a3 + 8; !gss_oid_equal(a, *(gss_const_OID *)(i - 8)) && (unint64_t)a | *(void *)(i - 8); i += 16)
  {
    if (!*(void *)(i + 16)) {
      return 196608;
    }
  }
  return (*(uint64_t (**)(_DWORD *, const void **, unint64_t *, gss_const_OID, void *))i)(a1, a2, a4, a, a6);
}

uint64_t _gss_mech_inquire_names_for_mech(OM_uint32 *a1, uint64_t a2, gss_OID_set *oid_set)
{
  uint64_t result = gss_create_empty_oid_set(a1, oid_set);
  if (!result)
  {
    if (*(void *)(a2 + 8))
    {
      while (!*(void *)a2 || !gss_add_oid_set_member(a1, *(gss_const_OID *)a2, oid_set))
      {
        uint64_t v7 = *(void *)(a2 + 24);
        a2 += 16;
        if (!v7) {
          return 0;
        }
      }
      OM_uint32 minor_status = 0;
      gss_release_oid_set(&minor_status, oid_set);
    }
    return 0;
  }
  return result;
}

uint64_t __getTypeID_block_invoke()
{
  uint64_t result = _CFRuntimeRegisterClass();
  getTypeID_hakrb5_ccache id = result;
  return result;
}

CFStringRef _gss_mg_copy_format_string(gss_name_t input_name)
{
  output_name_buffer.size_t length = 0;
  output_name_buffer.gss_buffer_desc_struct value = 0;
  OM_uint32 minor_status = 0;
  CFStringRef v1 = 0;
  if (!gss_display_name(&minor_status, input_name, &output_name_buffer, 0))
  {
    CFStringRef v1 = CFStringCreateWithFormat(0, 0, @"%.*s", output_name_buffer.length, output_name_buffer.value);
    gss_release_buffer(&minor_status, &output_name_buffer);
  }
  return v1;
}

__CFString *_gss_mg_copy_debug_name(gss_name_t_desc_struct *a1)
{
  CFMutableDictionaryRef Mutable = CFStringCreateMutable(0, 0);
  int v3 = Mutable;
  if (Mutable)
  {
    CFStringAppendFormat(Mutable, 0, @"GSSName: %p", a1);
    CFStringRef v4 = _gss_mg_copy_format_string(a1);
    if (v4)
    {
      CFStringRef v5 = v4;
      CFStringAppend(v3, v4);
      CFRelease(v5);
    }
  }
  return v3;
}

int gss_oid_equal(gss_const_OID a, gss_const_OID b)
{
  if (a && a == b) {
    return 1;
  }
  int v2 = 0;
  if (a && b)
  {
    size_t length = a->length;
    return length == b->length && memcmp(a->elements, b->elements, length) == 0;
  }
  return v2;
}

OM_uint32 gss_oid_to_str(OM_uint32 *minor_status, gss_OID oid, gss_buffer_t oid_str)
{
  if (oid_str)
  {
    oid_str->size_t length = 0;
    oid_str->gss_buffer_desc_struct value = 0;
  }
  if (!oid) {
    return 851968;
  }
  OM_uint32 v5 = der_get_oid();
  if (v5)
  {
    OM_uint32 v6 = v5;
  }
  else
  {
    OM_uint32 v6 = der_print_heim_oid();
    der_free_oid();
    if (!v6)
    {
      oid_str->gss_buffer_desc_struct value = 0;
      size_t v8 = strlen(0);
      OM_uint32 result = 0;
      oid_str->size_t length = v8;
      goto LABEL_9;
    }
  }
  OM_uint32 result = 851968;
LABEL_9:
  *OM_uint32 minor_status = v6;
  return result;
}

uint64_t __ApplePrivate_gss_oid_to_name(gss_const_OID a)
{
  CFStringRef v1 = (const gss_OID_desc *)_gss_ont_mech;
  if (!_gss_ont_mech) {
    return 0;
  }
  int v3 = (uint64_t *)off_2678035E0;
  while (!gss_oid_equal(a, v1))
  {
    CFStringRef v1 = (const gss_OID_desc *)v3[2];
    v3 += 4;
    if (!v1) {
      return 0;
    }
  }
  uint64_t result = *v3;
  if (!*v3) {
    return *(v3 - 1);
  }
  return result;
}

uint64_t __ApplePrivate_gss_name_to_oid(const char *a1)
{
  uint64_t v1 = _gss_ont_mech;
  if (_gss_ont_mech)
  {
    int v3 = off_2678035E0[0];
    if (strcasecmp(a1, off_2678035E0[0]))
    {
      CFStringRef v4 = (const char **)off_267803600;
      size_t v5 = strlen(a1);
      uint64_t v6 = 0;
      uint64_t v7 = -1;
      while (1)
      {
        if (!strncasecmp(a1, v3, v5))
        {
          BOOL v8 = v7 == -1;
          uint64_t v7 = v6;
          if (!v8) {
            break;
          }
        }
        uint64_t v1 = (uint64_t)*(v4 - 2);
        if (!v1)
        {
          if (v7 != -1) {
            return *((void *)&_gss_ont_mech + 4 * v7);
          }
          return 0;
        }
        OM_uint32 v9 = *v4;
        v4 += 4;
        int v3 = v9;
        ++v6;
        if (!strcasecmp(a1, v9)) {
          return v1;
        }
      }
      return 0;
    }
  }
  return v1;
}

OM_uint32 gss_process_context_token(OM_uint32 *minor_status, gss_ctx_id_t context_handle, gss_buffer_t token_buffer)
{
  return (*(uint64_t (**)(OM_uint32 *, void, gss_buffer_t))(*(void *)context_handle + 72))(minor_status, *((void *)context_handle + 1), token_buffer);
}

OM_uint32 gss_pseudo_random(OM_uint32 *minor_status, gss_ctx_id_t context, int prf_key, gss_buffer_t prf_in, ssize_t desired_output_len, gss_buffer_t prf_out)
{
  if (prf_out)
  {
    prf_out->size_t length = 0;
    prf_out->gss_buffer_desc_struct value = 0;
  }
  *OM_uint32 minor_status = 0;
  if (!context) {
    return 0x80000;
  }
  uint64_t v7 = *(void *)context;
  BOOL v8 = *(uint64_t (**)(OM_uint32 *, void, void, gss_buffer_t, ssize_t))(*(void *)context + 304);
  if (!v8) {
    return 0x100000;
  }
  OM_uint32 v9 = v8(minor_status, *((void *)context + 1), *(void *)&prf_key, prf_in, desired_output_len);
  if (v9) {
    _gss_mg_error(v7, *minor_status);
  }
  return v9;
}

OM_uint32 gss_release_buffer(OM_uint32 *minor_status, gss_buffer_t buffer)
{
  *OM_uint32 minor_status = 0;
  gss_buffer_desc_struct value = buffer->value;
  if (value) {
    free(value);
  }
  buffer->size_t length = 0;
  buffer->gss_buffer_desc_struct value = 0;
  return 0;
}

OM_uint32 gss_release_cred(OM_uint32 *minor_status, gss_cred_id_t *cred_handle)
{
  if (*cred_handle)
  {
    CFRelease(*cred_handle);
    *OM_uint32 minor_status = 0;
    *gss_cred_id_t cred_handle = 0;
  }
  return 0;
}

OM_uint32 gss_release_name(OM_uint32 *minor_status, gss_name_t *input_name)
{
  *OM_uint32 minor_status = 0;
  if (input_name)
  {
    gss_name_t v2 = *input_name;
    if (*input_name)
    {
      *gss_name_t input_name = 0;
      CFRelease(v2);
    }
  }
  return 0;
}

OM_uint32 gss_release_oid_set(OM_uint32 *minor_status, gss_OID_set *set)
{
  *OM_uint32 minor_status = 0;
  if (set)
  {
    gss_OID_set v3 = *set;
    if (*set)
    {
      if (v3->elements)
      {
        free(v3->elements);
        gss_OID_set v3 = *set;
      }
      free(v3);
      *set = 0;
    }
  }
  return 0;
}

OM_uint32 gss_release_oid(OM_uint32 *minor_status, gss_OID *oid)
{
  gss_OID v2 = *oid;
  *okrb5_ccache id = 0;
  if (minor_status) {
    *OM_uint32 minor_status = 0;
  }
  if (v2)
  {
    gss_OID_set v3 = (gss_OID_desc_struct *)_gss_ont_mech;
    if (_gss_ont_mech)
    {
      CFStringRef v4 = (gss_OID_desc_struct **)&off_2678035F0;
      while (v3 != v2)
      {
        size_t v5 = *v4;
        v4 += 4;
        gss_OID_set v3 = v5;
        if (!v5) {
          goto LABEL_8;
        }
      }
    }
    else
    {
LABEL_8:
      uint64_t v6 = (gss_OID_desc_struct *)_gss_ont_ma;
      if (_gss_ont_ma)
      {
        uint64_t v7 = (gss_OID_desc_struct **)&off_267803210;
        while (v6 != v2)
        {
          BOOL v8 = *v7;
          v7 += 4;
          uint64_t v6 = v8;
          if (!v8) {
            goto LABEL_12;
          }
        }
      }
      else
      {
LABEL_12:
        OM_uint32 v9 = &_gss_mechs;
        while (1)
        {
          OM_uint32 v9 = (uint64_t *)*v9;
          if (!v9) {
            break;
          }
          if (v9 + 7 == (uint64_t *)v2) {
            return 0;
          }
        }
        elements = v2->elements;
        if (elements) {
          free(elements);
        }
        free(v2);
      }
    }
  }
  return 0;
}

OM_uint32 gss_set_cred_option(OM_uint32 *minor_status, gss_cred_id_t *cred_handle, gss_OID object, gss_buffer_t value)
{
  gss_cred_id_t v8 = *cred_handle;
  *OM_uint32 minor_status = 0;
  _gss_load_mech();
  if (v8)
  {
    OM_uint32 v9 = (void *)*((void *)v8 + 2);
    if (v9)
    {
      int v10 = 0;
      OM_uint32 v11 = 0;
      do
      {
        uint64_t v12 = v9[1];
        if (!v12) {
          return 0x10000;
        }
        uint64_t v13 = *(uint64_t (**)(OM_uint32 *, void *, gss_OID, gss_buffer_t))(v12 + 296);
        if (v13)
        {
          OM_uint32 v11 = v13(minor_status, v9 + 3, object, value);
          if (v11) {
            _gss_mg_error(v12, *minor_status);
          }
          else {
            int v10 = 1;
          }
        }
        OM_uint32 v9 = (void *)*v9;
      }
      while (v9);
      if (v10) {
        goto LABEL_22;
      }
    }
    else
    {
      return 0;
    }
  }
  else
  {
    uint64_t v14 = (gss_cred_id_t_desc_struct *)_gss_mg_alloc_cred();
    if (v14)
    {
      unint64_t v15 = v14;
      uint64_t v16 = _gss_mechs;
      if (_gss_mechs)
      {
        int v17 = 0;
        OM_uint32 v11 = 0;
        do
        {
          if (*(void *)(v16 + 336))
          {
            gss_buffer_desc_struct v18 = malloc_type_malloc(0x20uLL, 0x20040DC1BFBCFuLL);
            if (!v18)
            {
              *gss_cred_id_t cred_handle = v15;
              gss_release_cred(minor_status, cred_handle);
              *OM_uint32 minor_status = 12;
              return 851968;
            }
            unint64_t v19 = v18;
            v18[3] = 0;
            v18[1] = v16 + 40;
            void v18[2] = v16 + 8;
            OM_uint32 v11 = (*(uint64_t (**)(OM_uint32 *))(v16 + 336))(minor_status);
            if (v11)
            {
              free(v19);
            }
            else
            {
              *unint64_t v19 = *((void *)v15 + 2);
              *((void *)v15 + 2) = v19;
              int v17 = 1;
            }
          }
          uint64_t v16 = *(void *)v16;
        }
        while (v16);
        *gss_cred_id_t cred_handle = v15;
        if (!v17) {
          goto LABEL_26;
        }
LABEL_22:
        OM_uint32 v11 = 0;
        *OM_uint32 minor_status = 0;
      }
      else
      {
        OM_uint32 v11 = 0;
        *gss_cred_id_t cred_handle = v14;
LABEL_26:
        minor_statusgss_const_OID a = 0;
        gss_release_cred(&minor_statusa, cred_handle);
      }
    }
    else
    {
      return 851968;
    }
  }
  return v11;
}

OM_uint32 gss_set_sec_context_option(OM_uint32 *minor_status, gss_ctx_id_t *context_handle, gss_OID object, gss_buffer_t value)
{
  *OM_uint32 minor_status = 0;
  if (!context_handle) {
    return 0x80000;
  }
  gss_ctx_id_t v4 = *context_handle;
  if (!*context_handle) {
    return 0x80000;
  }
  uint64_t v5 = *(void *)v4;
  if (!*(void *)v4) {
    return 0x10000;
  }
  uint64_t v6 = *(uint64_t (**)(void))(v5 + 288);
  if (!v6) {
    return 0x10000;
  }
  OM_uint32 v8 = v6();
  if (v8) {
    _gss_mg_error(v5, *minor_status);
  }
  return v8;
}

OM_uint32 gss_test_oid_set_member(OM_uint32 *minor_status, gss_const_OID member, gss_OID_set set, int *present)
{
  *int present = 0;
  if (set->count)
  {
    uint64_t v8 = 0;
    size_t v9 = 0;
    do
    {
      if (gss_oid_equal(member, &set->elements[v8])) {
        *int present = 1;
      }
      ++v9;
      ++v8;
    }
    while (v9 < set->count);
  }
  *OM_uint32 minor_status = 0;
  return 0;
}

OM_uint32 gss_unwrap(OM_uint32 *minor_status, gss_ctx_id_t context_handle, gss_buffer_t input_message_buffer, gss_buffer_t output_message_buffer, int *conf_state, gss_qop_t *qop_state)
{
  if (conf_state) {
    *conf_state = 0;
  }
  if (qop_state) {
    *qop_state = 0;
  }
  if (context_handle) {
    return (*(uint64_t (**)(OM_uint32 *, void, gss_buffer_t, gss_buffer_t))(*(void *)context_handle + 120))(minor_status, *((void *)context_handle + 1), input_message_buffer, output_message_buffer);
  }
  *OM_uint32 minor_status = 0;
  return 0x80000;
}

uint64_t _gss_copy_oid(_DWORD *a1, const void **a2, uint64_t a3)
{
  size_t v6 = *(unsigned int *)a2;
  *a1 = 0;
  uint64_t v7 = malloc_type_malloc(v6, 0x24B3A5D8uLL);
  *(void *)(a3 + 8) = v7;
  if (v7)
  {
    *(_DWORD *)a3 = v6;
    memcpy(v7, a2[1], v6);
    return 0;
  }
  else
  {
    *(_DWORD *)a3 = 0;
    *a1 = 12;
    return 851968;
  }
}

uint64_t _gss_free_oid(_DWORD *a1, uint64_t a2)
{
  *a1 = 0;
  gss_OID v2 = *(void **)(a2 + 8);
  if (v2)
  {
    free(v2);
    *(void *)(a2 + 8) = 0;
    *(_DWORD *)a2 = 0;
  }
  return 0;
}

uint64_t _gss_copy_buffer(_DWORD *a1, uint64_t a2, size_t *a3)
{
  size_t v6 = *(void *)a2;
  *a1 = 0;
  uint64_t v7 = malloc_type_malloc(v6, 0x9BED114uLL);
  a3[1] = (size_t)v7;
  if (v7)
  {
    *a3 = v6;
    memcpy(v7, *(const void **)(a2 + 8), v6);
    return 0;
  }
  else
  {
    *a1 = 12;
    *a3 = 0;
    return 851968;
  }
}

uint64_t _gss_mg_encode_le_uint32(uint64_t result, _DWORD *a2)
{
  *a2 = result;
  return result;
}

_DWORD *_gss_mg_decode_le_uint32(_DWORD *result, _DWORD *a2)
{
  *a2 = *result;
  return result;
}

uint64_t _gss_mg_encode_be_uint32(uint64_t result, _DWORD *a2)
{
  *a2 = bswap32(result);
  return result;
}

unsigned int *_gss_mg_decode_be_uint32(unsigned int *result, _DWORD *a2)
{
  *a2 = bswap32(*result);
  return result;
}

OM_uint32 gss_verify_mic(OM_uint32 *minor_status, gss_ctx_id_t context_handle, gss_buffer_t message_buffer, gss_buffer_t token_buffer, gss_qop_t *qop_state)
{
  if (qop_state) {
    *qop_state = 0;
  }
  if (context_handle) {
    return (*(uint64_t (**)(OM_uint32 *, void, gss_buffer_t, gss_buffer_t))(*(void *)context_handle + 104))(minor_status, *((void *)context_handle + 1), message_buffer, token_buffer);
  }
  *OM_uint32 minor_status = 0;
  return 0x80000;
}

OM_uint32 gss_wrap_size_limit(OM_uint32 *minor_status, gss_ctx_id_t context_handle, int conf_req_flag, gss_qop_t qop_req, OM_uint32 req_output_size, OM_uint32 *max_input_size)
{
  *max_input_size_t size = 0;
  if (context_handle) {
    return (*(uint64_t (**)(OM_uint32 *, void, void, void, void))(*(void *)context_handle + 200))(minor_status, *((void *)context_handle + 1), *(void *)&conf_req_flag, *(void *)&qop_req, *(void *)&req_output_size);
  }
  *OM_uint32 minor_status = 0;
  return 0x80000;
}

OM_uint32 gss_wrap(OM_uint32 *minor_status, gss_ctx_id_t context_handle, int conf_req_flag, gss_qop_t qop_req, gss_buffer_t input_message_buffer, int *conf_state, gss_buffer_t output_message_buffer)
{
  if (conf_state) {
    *conf_state = 0;
  }
  if (output_message_buffer)
  {
    output_message_buffer->size_t length = 0;
    output_message_buffer->gss_buffer_desc_struct value = 0;
  }
  if (context_handle) {
    return (*(uint64_t (**)(OM_uint32 *, void, void, void, gss_buffer_t))(*(void *)context_handle
  }
                                                                                        + 112))(minor_status, *((void *)context_handle + 1), *(void *)&conf_req_flag, *(void *)&qop_req, input_message_buffer);
  *OM_uint32 minor_status = 0;
  return 0x80000;
}

uint64_t gss_store_cred(OM_uint32 *minor_status, uint64_t a2, uint64_t a3, gss_const_OID b, uint64_t a5, uint64_t a6, gss_OID_set *oid_set, _DWORD *a8)
{
  if (!minor_status) {
    return 851968;
  }
  if (oid_set) {
    *gss_OID_set oid_set = 0;
  }
  if (a8) {
    *a8 = 0;
  }
  if (!a2) {
    return 0x80000;
  }
  if (!oid_set || (empty_gss_OID_set oid_set = gss_create_empty_oid_set(minor_status, oid_set), !empty_oid_set))
  {
    int v17 = *(void **)(a2 + 16);
    if (v17)
    {
      minor_statusgss_const_OID a = 0;
      do
      {
        uint64_t v18 = v17[1];
        if (!v18) {
          goto LABEL_19;
        }
        unint64_t v19 = *(uint64_t (**)(OM_uint32 *, void, uint64_t, gss_const_OID, uint64_t, uint64_t, void, _DWORD *))(v18 + 336);
        if (!v19) {
          goto LABEL_19;
        }
        if (b)
        {
          if (gss_oid_equal((gss_const_OID)(v18 + 16), b)) {
            goto LABEL_19;
          }
          unint64_t v19 = *(uint64_t (**)(OM_uint32 *, void, uint64_t, gss_const_OID, uint64_t, uint64_t, void, _DWORD *))(v18 + 336);
        }
        uint64_t v20 = v19(minor_status, v17[3], a3, b, a5, a6, 0, a8);
        if (v20)
        {
          empty_gss_OID_set oid_set = v20;
          gss_release_oid_set(&minor_statusa, oid_set);
          return empty_oid_set;
        }
        if (oid_set) {
          gss_add_oid_set_member(&minor_statusa, (gss_const_OID)(v18 + 16), oid_set);
        }
LABEL_19:
        int v17 = (void *)*v17;
      }
      while (v17);
    }
    return 0;
  }
  return empty_oid_set;
}

OM_uint32 gss_iter_creds_f(OM_uint32 *min_stat, OM_uint32 flags, gss_const_OID mech, void *userctx, void (__cdecl *useriter)(void *, gss_OID, gss_cred_id_t))
{
  if (!useriter) {
    return 0x1000000;
  }
  uint64_t v8 = *(void *)&flags;
  _gss_load_mech();
  int v10 = (unint64_t *)_gss_mech_oids;
  OM_uint32 v11 = (pthread_mutex_t *)malloc_type_malloc(0x58uLL, 0x1080040852048A2uLL);
  if (v11)
  {
    uint64_t v12 = (uint64_t)v11;
    pthread_mutex_init(v11, 0);
    *(_DWORD *)(v12 + 64) = 1;
    *(void *)(v12 + 72) = userctx;
    *(void *)(v12 + 80) = useriter;
    if (*v10)
    {
      uint64_t v13 = 0;
      unint64_t v14 = 0;
      do
      {
        if (!mech || gss_oid_equal(mech, (gss_const_OID)(v10[1] + v13)))
        {
          mechanism = __gss_get_mechanism((const gss_OID_desc *)(v10[1] + v13));
          if (mechanism)
          {
            uint64_t v16 = mechanism;
            if (mechanism[46])
            {
              pthread_mutex_lock((pthread_mutex_t *)v12);
              ++*(_DWORD *)(v12 + 64);
              pthread_mutex_unlock((pthread_mutex_t *)v12);
              ((void (*)(uint64_t, uint64_t, void))v16[46])(v8, v12, iterate);
            }
          }
        }
        ++v14;
        v13 += 16;
      }
      while (v14 < *v10);
    }
    iter_deref(v12);
    return 0;
  }
  else
  {
    if (min_stat) {
      *OM_uint32 min_stat = 12;
    }
    return 851968;
  }
}

void iterate(uint64_t a1, const gss_OID_desc *a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v6 = _gss_mg_alloc_cred();
    if (v6)
    {
      uint64_t v7 = (void *)v6;
      uint64_t v8 = malloc_type_malloc(0x20uLL, 0x20040DC1BFBCFuLL);
      if (v8)
      {
        size_t v9 = v8;
        mechanism = __gss_get_mechanism(a2);
        krb5_timestamp v9[2] = a2;
        v9[3] = a3;
        *size_t v9 = v7[2];
        v9[1] = mechanism;
        void v7[2] = v9;
        uint64_t v11 = *(void *)(a1 + 72);
        uint64_t v12 = *(void (**)(uint64_t, const gss_OID_desc *, void *))(a1 + 80);
        v12(v11, a2, v7);
      }
      else
      {
        free(v7);
      }
    }
  }
  else
  {
    iter_deref(a1);
  }
}

void iter_deref(uint64_t a1)
{
  pthread_mutex_lock((pthread_mutex_t *)a1);
  int v2 = *(_DWORD *)(a1 + 64) - 1;
  *(_DWORD *)(a1 + 64) = v2;
  if (v2)
  {
    pthread_mutex_unlock((pthread_mutex_t *)a1);
  }
  else
  {
    (*(void (**)(void, void, void))(a1 + 80))(*(void *)(a1 + 72), 0, 0);
    pthread_mutex_unlock((pthread_mutex_t *)a1);
    pthread_mutex_destroy((pthread_mutex_t *)a1);
    free((void *)a1);
  }
}

OM_uint32 gss_iter_creds(OM_uint32 *min_stat, OM_uint32 flags, gss_const_OID mech, void *useriter)
{
  uint64_t v7 = _Block_copy(useriter);

  return gss_iter_creds_f(min_stat, flags, mech, v7, (void (__cdecl *)(void *, gss_OID, gss_cred_id_t))useriter_block);
}

void useriter_block(void (**a1)(void), uint64_t a2, uint64_t a3)
{
  a1[2]();
  if (!a3)
  {
    _Block_release(a1);
  }
}

OM_uint32 gss_export_cred(OM_uint32 *minor_status, gss_cred_id_t cred_handle, gss_buffer_t token)
{
  if (token)
  {
    token->size_t length = 0;
    token->gss_buffer_desc_struct value = 0;
  }
  if (cred_handle)
  {
    buffer.size_t length = 0;
    buffer.gss_buffer_desc_struct value = 0;
    uint64_t v8 = (void *)((char *)cred_handle + 16);
    size_t v9 = (void *)((char *)cred_handle + 16);
    while (1)
    {
      size_t v9 = (void *)*v9;
      if (!v9) {
        break;
      }
      uint64_t v10 = v9[1];
      if (!*(void *)(v10 + 344))
      {
        *OM_uint32 minor_status = 0;
        size_t v11 = v10 + 16;
        uint64_t v12 = "Credential doesn't support exporting";
        OM_uint32 v13 = 458752;
LABEL_8:
        gss_mg_set_error_string(v11, 458752, 0, v12, v3, v4, v5, v6, 0);
        return v13;
      }
    }
    if (krb5_storage_emem())
    {
      unint64_t v14 = (void *)*v8;
      if (!*v8)
      {
LABEL_17:
        OM_uint32 v17 = krb5_storage_to_data();
        krb5_storage_free();
        if (!v17)
        {
          *OM_uint32 minor_status = 0;
          uint64_t v12 = "Credential was not exportable";
          OM_uint32 v13 = 458752;
          size_t v11 = 0;
          goto LABEL_8;
        }
        *OM_uint32 minor_status = v17;
        return 851968;
      }
      while (1)
      {
        OM_uint32 v15 = (*(uint64_t (**)(OM_uint32 *, void, gss_buffer_desc_struct *))(v14[1] + 344))(minor_status, v14[3], &buffer);
        if (v15)
        {
          OM_uint32 v13 = v15;
          krb5_storage_free();
          return v13;
        }
        if (buffer.length)
        {
          uint64_t v16 = krb5_storage_write();
          if (v16 < 0 || v16 != buffer.length) {
            break;
          }
        }
        gss_release_buffer(minor_status, &buffer);
        unint64_t v14 = (void *)*v14;
        if (!v14) {
          goto LABEL_17;
        }
      }
      gss_release_buffer(minor_status, &buffer);
      krb5_storage_free();
      OM_uint32 v18 = 22;
    }
    else
    {
      OM_uint32 v18 = 12;
    }
    *OM_uint32 minor_status = v18;
    return 851968;
  }
  *OM_uint32 minor_status = 0;
  return 458752;
}

OM_uint32 gss_import_cred(OM_uint32 *minor_status, gss_buffer_t token, gss_cred_id_t *cred_handle)
{
  *gss_cred_id_t cred_handle = 0;
  if (!token->length || !krb5_storage_from_readonly_mem()) {
    goto LABEL_13;
  }
  uint64_t v5 = (gss_cred_id_t_desc_struct *)_gss_mg_alloc_cred();
  if (!v5)
  {
    krb5_storage_free();
LABEL_13:
    *OM_uint32 minor_status = 12;
    return 851968;
  }
  uint64_t v6 = v5;
  minor_statusgss_const_OID a = 0;
  uint64_t v16 = 0;
  OM_uint32 v17 = 0;
  *gss_cred_id_t cred_handle = v5;
  while (1)
  {
    uint64_t v14 = 0;
    OM_uint32 v15 = 0;
    v12.elements = 0;
    uint64_t v13 = 0;
    *(void *)&v12.size_t length = 0;
    OM_uint32 v7 = krb5_ret_data();
    if (v7) {
      break;
    }
    v12.elements = v17;
    v12.size_t length = v16;
    mechanism = __gss_get_mechanism(&v12);
    krb5_data_free();
    if (!mechanism || !mechanism[44])
    {
      OM_uint32 v7 = 0;
      OM_uint32 v9 = 0x10000;
LABEL_20:
      *OM_uint32 minor_status = v7;
LABEL_21:
      krb5_storage_free();
      goto LABEL_22;
    }
    OM_uint32 v7 = krb5_ret_data();
    if (v7) {
      goto LABEL_18;
    }
    uint64_t v14 = v16;
    OM_uint32 v15 = v17;
    OM_uint32 v9 = ((uint64_t (*)(OM_uint32 *, uint64_t *, uint64_t *))mechanism[44])(minor_status, &v14, &v13);
    krb5_data_free();
    if (v9) {
      goto LABEL_21;
    }
    uint64_t v10 = malloc_type_malloc(0x20uLL, 0x20040DC1BFBCFuLL);
    if (!v10)
    {
      OM_uint32 v9 = 851968;
      OM_uint32 v7 = 22;
      goto LABEL_20;
    }
    v10[1] = mechanism;
    void v10[2] = mechanism + 2;
    v10[3] = v13;
    *uint64_t v10 = *((void *)v6 + 2);
    *((void *)v6 + 2) = v10;
  }
  if (v7 != -1980176635)
  {
LABEL_18:
    OM_uint32 v9 = 851968;
    goto LABEL_20;
  }
  krb5_storage_free();
  if (*((void *)v6 + 2)) {
    return 0;
  }
  OM_uint32 v9 = 458752;
LABEL_22:
  gss_release_cred(&minor_statusa, cred_handle);
  return v9;
}

uint64_t __ApplePrivate_gss_cred_label_get(_DWORD *a1, uint64_t a2, uint64_t a3, void *a4)
{
  *a1 = 0;
  if (a4)
  {
    *a4 = 0;
    a4[1] = 0;
  }
  OM_uint32 v7 = *(void **)(a2 + 16);
  if (!v7) {
    return 0x100000;
  }
  while (1)
  {
    uint64_t v8 = *(uint64_t (**)(_DWORD *, void, uint64_t, void *))(v7[1] + 400);
    if (v8)
    {
      uint64_t result = v8(a1, v7[3], a3, a4);
      if (!result) {
        break;
      }
    }
    OM_uint32 v7 = (void *)*v7;
    if (!v7) {
      return 0x100000;
    }
  }
  return result;
}

uint64_t __ApplePrivate_gss_cred_label_set(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *a1 = 0;
  for (uint64_t i = *(void **)(a2 + 16); i; uint64_t i = (void *)*i)
  {
    uint64_t v8 = *(void (**)(_DWORD *, void, uint64_t, uint64_t))(i[1] + 408);
    if (v8) {
      v8(a1, i[3], a3, a4);
    }
  }
  return 0;
}

OM_uint32 gss_destroy_cred(OM_uint32 *min_stat, gss_cred_id_t *cred_handle)
{
  if (!cred_handle) {
    return 0x1000000;
  }
  gss_cred_id_t v2 = *cred_handle;
  if (*cred_handle)
  {
    int v7 = 0;
    *gss_cred_id_t cred_handle = 0;
    while (1)
    {
      uint64_t v3 = (void *)*((void *)v2 + 2);
      if (!v3) {
        break;
      }
      uint64_t v4 = v3[1];
      *((void *)v2 + 2) = *v3;
      uint64_t v5 = *(void (**)(int *, void *))(v4 + 376);
      if (!v5) {
        uint64_t v5 = *(void (**)(int *, void *))(v4 + 48);
      }
      v5(&v7, v3 + 3);
      free(v3);
    }
    free(v2);
  }
  return 0;
}

uint64_t _gss_mo_get_option_1(gss_const_OID a, uint64_t a2, size_t *a3)
{
  return get_option_def(1, a, a2, a3);
}

uint64_t get_option_def(uint64_t a1, gss_const_OID a, uint64_t a3, size_t *a4)
{
  uint64_t v6 = a1;
  unsigned int valuePtr = a1;
  uint64_t v7 = __ApplePrivate_gss_oid_to_name(a);
  CFStringRef v8 = CFStringCreateWithFormat(0, 0, @"com.apple.GSS.%s", v7);
  if (v8)
  {
    CFStringRef v9 = v8;
    CFStringRef v10 = CFStringCreateWithCString(0, *(const char **)(a3 + 16), 0x8000100u);
    if (v10)
    {
      CFStringRef v11 = v10;
      CFPropertyListRef v12 = _gss_mg_copy_key(v9, v10);
      CFRelease(v9);
      CFRelease(v11);
      if (v12)
      {
        CFTypeID v13 = CFGetTypeID(v12);
        if (v13 == CFBooleanGetTypeID())
        {
          unsigned int valuePtr = CFBooleanGetValue((CFBooleanRef)v12);
        }
        else
        {
          CFTypeID v14 = CFGetTypeID(v12);
          if (v14 == CFNumberGetTypeID())
          {
            CFNumberGetValue((CFNumberRef)v12, kCFNumberIntType, &valuePtr);
          }
          else
          {
            CFTypeID v15 = CFGetTypeID(v12);
            if (v15 == CFDictionaryGetTypeID())
            {
              CFArrayRef Value = CFDictionaryGetValue((CFDictionaryRef)v12, @"enable");
              OM_uint32 v17 = CFDictionaryGetValue((CFDictionaryRef)v12, @"data");
              if (Value)
              {
                CFTypeID v18 = CFGetTypeID(Value);
                if (v18 == CFBooleanGetTypeID())
                {
                  unsigned int valuePtr = CFBooleanGetValue((CFBooleanRef)Value);
                }
                else
                {
                  CFTypeID v19 = CFGetTypeID(Value);
                  if (v19 == CFNumberGetTypeID()) {
                    CFNumberGetValue((CFNumberRef)v12, kCFNumberIntType, &valuePtr);
                  }
                }
              }
              if (v17)
              {
                CFTypeID v20 = CFGetTypeID(v17);
                if (v20 == CFDataGetTypeID())
                {
                  CFIndex Length = CFDataGetLength((CFDataRef)v17);
                  gss_name_t v22 = malloc_type_malloc(Length, 0x6E88AE88uLL);
                  a4[1] = (size_t)v22;
                  if (v22)
                  {
                    BOOL v23 = v22;
                    BytePtr = CFDataGetBytePtr((CFDataRef)v17);
                    memcpy(v23, BytePtr, *a4);
                    *a4 = CFDataGetLength((CFDataRef)v17);
                  }
                }
              }
            }
          }
        }
        CFRelease(v12);
        return valuePtr;
      }
    }
    else
    {
      CFRelease(v9);
    }
  }
  return v6;
}

uint64_t _gss_mo_get_option_0(gss_const_OID a, uint64_t a2, size_t *a3)
{
  return get_option_def(0, a, a2, a3);
}

uint64_t _gss_mo_get_ctx_as_string(uint64_t a1, uint64_t a2, size_t *a3)
{
  if (!a3) {
    return 0;
  }
  uint64_t v4 = *(const char **)(a2 + 24);
  uint64_t v5 = strdup(v4);
  a3[1] = (size_t)v5;
  if (!v5) {
    return 851968;
  }
  size_t v6 = strlen(v4);
  uint64_t result = 0;
  *a3 = v6;
  return result;
}

uint64_t __ApplePrivate_gss_mo_set(const gss_OID_desc *a1, const gss_OID_desc *a2)
{
  mechanism = __gss_get_mechanism(a1);
  if (!mechanism) {
    return 0x10000;
  }
  uint64_t v5 = mechanism;
  if (!mechanism[53]) {
    return 0;
  }
  uint64_t v6 = 0;
  unint64_t v7 = 0;
  while (1)
  {
    if (gss_oid_equal(a2, *(gss_const_OID *)(v5[52] + v6)))
    {
      CFStringRef v8 = *(uint64_t (**)(const gss_OID_desc *))(v5[52] + v6 + 40);
      if (v8) {
        break;
      }
    }
    ++v7;
    v6 += 48;
    if (v7 >= v5[53]) {
      return 0;
    }
  }

  return v8(a1);
}

uint64_t __ApplePrivate_gss_mo_get(const gss_OID_desc *a1, const gss_OID_desc *a2, void *a3)
{
  if (a3)
  {
    *a3 = 0;
    a3[1] = 0;
  }
  uint64_t result = (uint64_t)__gss_get_mechanism(a1);
  if (result)
  {
    mechanism = __gss_get_mechanism(a1);
    if (mechanism)
    {
      unint64_t v7 = mechanism;
      if (mechanism[53])
      {
        uint64_t v8 = 0;
        unint64_t v9 = 0;
        while (1)
        {
          if (gss_oid_equal(a2, *(gss_const_OID *)(v7[52] + v8)))
          {
            CFStringRef v10 = *(uint64_t (**)(const gss_OID_desc *))(v7[52] + v8 + 32);
            if (v10) {
              break;
            }
          }
          ++v9;
          v8 += 48;
          if (v9 >= v7[53]) {
            return 0;
          }
        }
        return v10(a1);
      }
      else
      {
        return 0;
      }
    }
    else
    {
      return 0x10000;
    }
  }
  return result;
}

uint64_t *__ApplePrivate_gss_mo_list(uint64_t *result, gss_OID_set *a2)
{
  if (a2)
  {
    *a2 = 0;
    uint64_t result = __gss_get_mechanism((const gss_OID_desc *)result);
    if (result)
    {
      uint64_t v3 = (uint64_t)result;
      OM_uint32 minor_status = 0;
      uint64_t result = (uint64_t *)gss_create_empty_oid_set(&minor_status, a2);
      if (!result) {
        return (uint64_t *)add_all_mo(v3, a2, 0);
      }
    }
  }
  return result;
}

uint64_t add_all_mo(uint64_t result, gss_OID_set *oid_set, int a3)
{
  unint64_t v3 = *(void *)(result + 424);
  if (v3)
  {
    uint64_t v6 = result;
    uint64_t v7 = 0;
    unint64_t v8 = 0;
    OM_uint32 minor_status = 0;
    do
    {
      uint64_t v9 = *(void *)(v6 + 416);
      if ((a3 & ~*(_DWORD *)(v9 + v7 + 8)) == 0)
      {
        uint64_t result = gss_add_oid_set_member(&minor_status, *(gss_const_OID *)(v9 + v7), oid_set);
        unint64_t v3 = *(void *)(v6 + 424);
      }
      ++v8;
      v7 += 48;
    }
    while (v8 < v3);
  }
  return result;
}

uint64_t __ApplePrivate_gss_mo_name(const gss_OID_desc *a1, const gss_OID_desc *a2, gss_buffer_desc_struct *a3)
{
  if (!a3) {
    return 0x20000;
  }
  mechanism = __gss_get_mechanism(a1);
  if (!mechanism) {
    return 0x10000;
  }
  uint64_t v6 = mechanism;
  if (!mechanism[53]) {
    return 0x20000;
  }
  uint64_t v7 = 0;
  unint64_t v8 = 0;
  while (!gss_oid_equal(a2, *(gss_const_OID *)(v6[52] + v7)))
  {
    ++v8;
    v7 += 48;
    if (v8 >= v6[53]) {
      return 0x20000;
    }
  }
  uint64_t v10 = v6[52] + v7;
  CFStringRef v11 = *(const char **)(v10 + 16);
  if (v11)
  {
    CFPropertyListRef v12 = strdup(*(const char **)(v10 + 16));
    a3->gss_buffer_desc_struct value = v12;
    if (v12)
    {
      size_t v13 = strlen(v11);
      uint64_t result = 0;
      a3->size_t length = v13;
      return result;
    }
    return 0x20000;
  }
  OM_uint32 minor_status = 0;
  return gss_display_mech_attr(&minor_status, a2, 0, a3, 0);
}

OM_uint32 gss_display_mech_attr(OM_uint32 *minor_status, gss_const_OID mech_attr, gss_buffer_t name, gss_buffer_t short_desc, gss_buffer_t long_desc)
{
  if (name)
  {
    name->size_t length = 0;
    name->gss_buffer_desc_struct value = 0;
  }
  if (short_desc)
  {
    short_desc->size_t length = 0;
    short_desc->gss_buffer_desc_struct value = 0;
  }
  if (long_desc)
  {
    long_desc->size_t length = 0;
    long_desc->gss_buffer_desc_struct value = 0;
  }
  if (minor_status) {
    *OM_uint32 minor_status = 0;
  }
  p_elements = &__gss_c_ma_ctx_trans_oid_desc.elements;
  do
  {
    CFStringRef v11 = (const gss_OID_desc *)p_elements[1];
    if (!v11) {
      return 1245184;
    }
    p_elements += 4;
  }
  while (!gss_oid_equal(mech_attr, v11));
  if (!name
    || (CFTypeID v14 = (const char *)*(p_elements - 2),
        size_t v13 = strlen(v14),
        (OM_uint32 result = _gss_copy_buffer(minor_status, (uint64_t)&v13, &name->length)) == 0))
  {
    if (!short_desc
      || (CFTypeID v14 = (const char *)*(p_elements - 1),
          size_t v13 = strlen(v14),
          (OM_uint32 result = _gss_copy_buffer(minor_status, (uint64_t)&v13, &short_desc->length)) == 0))
    {
      if (!long_desc) {
        return 0;
      }
      CFTypeID v14 = (const char *)*p_elements;
      size_t v13 = strlen(v14);
      OM_uint32 result = _gss_copy_buffer(minor_status, (uint64_t)&v13, &long_desc->length);
      if (!result) {
        return 0;
      }
    }
  }
  return result;
}

OM_uint32 gss_inquire_saslname_for_mech(OM_uint32 *minor_status, gss_OID desired_mech, gss_buffer_t sasl_mech_name, gss_buffer_t mech_name, gss_buffer_t mech_description)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (sasl_mech_name)
  {
    sasl_mech_name->size_t length = 0;
    sasl_mech_name->gss_buffer_desc_struct value = 0;
  }
  if (mech_name)
  {
    mech_name->size_t length = 0;
    mech_name->gss_buffer_desc_struct value = 0;
  }
  if (mech_description)
  {
    mech_description->size_t length = 0;
    mech_description->gss_buffer_desc_struct value = 0;
  }
  if (minor_status) {
    *OM_uint32 minor_status = 0;
  }
  if (!desired_mech) {
    return 0x10000;
  }
  if (!sasl_mech_name
    || (OM_uint32 result = __ApplePrivate_gss_mo_get(desired_mech, &__gss_c_ma_sasl_mech_name_oid_desc, sasl_mech_name)) == 0)
  {
    if (mech_name)
    {
      OM_uint32 result = __ApplePrivate_gss_mo_get(desired_mech, &__gss_c_ma_mech_name_oid_desc, mech_name);
      OM_uint32 v14 = HIWORD(result);
      if (!HIWORD(result)) {
        OM_uint32 result = 0;
      }
      if (!mech_description || v14) {
        return result;
      }
    }
    else if (!mech_description)
    {
      return 0;
    }
    return __ApplePrivate_gss_mo_get(desired_mech, &__gss_c_ma_mech_description_oid_desc, mech_description);
  }
  if (result >= 0x10000)
  {
    mechanism = __gss_get_mechanism(desired_mech);
    if (!mechanism
      || (CFPropertyListRef v12 = (uint64_t (**)(OM_uint32 *, gss_OID, gss_buffer_t, gss_buffer_t, gss_buffer_t))mechanism[62]) == 0
      || (size_t v13 = *v12) == 0
      || (OM_uint32 result = v13(minor_status, desired_mech, sasl_mech_name, mech_name, mech_description), result >= 0x10000))
    {
      v15[0] = 15;
      v15[1] = v16;
      if (make_sasl_name(desired_mech, (uint64_t)v16) < 0x10000) {
        return _gss_copy_buffer(minor_status, (uint64_t)v15, &sasl_mech_name->length);
      }
      return 0x10000;
    }
  }
  return result;
}

uint64_t make_sasl_name(_DWORD *a1, uint64_t a2)
{
  if (*a1 > 0x7Fu) {
    return 0x10000;
  }
  CCDigestCreate();
  CCDigestUpdate();
  CCDigestUpdate();
  CCDigestFinal();
  CCDigestDestroy();
  uint64_t result = 0;
  *(_DWORD *)a2 = 758272839;
  *(unsigned char *)(a2 + 4) = basis_32[(unint64_t)v4 >> 3];
  *(unsigned char *)(a2 + 5) = basis_32[((unint64_t)v5 >> 6) & 0xFFFFFFFFFFFFFFE3 | (4 * (v4 & 7))];
  *(unsigned char *)(a2 + 6) = basis_32[((unint64_t)v5 >> 1) & 0x1F];
  *(unsigned char *)(a2 + 7) = basis_32[((unint64_t)v6 >> 4) & 0xFFFFFFFFFFFFFFEFLL | (16 * (v5 & 1))];
  *(unsigned char *)(a2 + 8) = basis_32[((unint64_t)v7 >> 7) & 0xFFFFFFFFFFFFFFE1 | (2 * (v6 & 0xF))];
  *(unsigned char *)(a2 + 9) = basis_32[((unint64_t)v7 >> 2) & 0x1F];
  *(unsigned char *)(a2 + 10) = basis_32[((unint64_t)v8 >> 5) & 0xFFFFFFFFFFFFFFE7 | (8 * (v7 & 3))];
  *(unsigned char *)(a2 + 11) = basis_32[v8 & 0x1F];
  *(unsigned char *)(a2 + 12) = basis_32[(unint64_t)v9 >> 3];
  *(unsigned char *)(a2 + 13) = basis_32[((unint64_t)v10 >> 6) & 0xFFFFFFFFFFFFFFE3 | (4 * (v9 & 7))];
  *(_WORD *)(a2 + 14) = basis_32[((unint64_t)v10 >> 1) & 0x1F];
  return result;
}

OM_uint32 gss_inquire_mech_for_saslname(OM_uint32 *minor_status, gss_buffer_t sasl_mech_name, gss_OID *mech_type)
{
  void v18[2] = *MEMORY[0x263EF8340];
  _gss_load_mech();
  *mech_type = 0;
  uint64_t v6 = _gss_mechs;
  if (!_gss_mechs) {
    return 0x10000;
  }
  buffer.size_t length = 0;
  buffer.gss_buffer_desc_struct value = 0;
  minor_statusgss_const_OID a = 0;
  while (1)
  {
    unsigned int v7 = __ApplePrivate_gss_mo_get((const gss_OID_desc *)(v6 + 8), &__gss_c_ma_sasl_mech_name_oid_desc, &buffer);
    if (!v7) {
      break;
    }
    unsigned int v8 = v7;
    gss_release_buffer(&minor_statusa, &buffer);
    if (v8 >= 0x10000)
    {
      uint64_t v9 = *(void *)(v6 + 536);
      if (!v9) {
        goto LABEL_27;
      }
      unsigned __int8 v10 = *(uint64_t (**)(OM_uint32 *, gss_buffer_t, gss_OID *))(v9 + 8);
      if (!v10) {
        goto LABEL_27;
      }
      OM_uint32 result = v10(minor_status, sasl_mech_name, mech_type);
      if (!result) {
        return result;
      }
      if (result >= 0x10000)
      {
LABEL_27:
        if (sasl_mech_name->length == 16 && !make_sasl_name((_DWORD *)(v6 + 8), (uint64_t)v18))
        {
          gss_buffer_desc_struct value = (uint64_t *)sasl_mech_name->value;
          uint64_t v14 = *value;
          uint64_t v13 = value[1];
          if (v18[0] == v14 && v18[1] == v13) {
            goto LABEL_24;
          }
        }
      }
    }
LABEL_20:
    uint64_t v6 = *(void *)v6;
    if (!v6) {
      return 0x10000;
    }
  }
  if (buffer.length != sasl_mech_name->length || memcmp(buffer.value, sasl_mech_name->value, buffer.length))
  {
    gss_release_buffer(&minor_statusa, &buffer);
    goto LABEL_20;
  }
  gss_release_buffer(&minor_statusa, &buffer);
LABEL_24:
  OM_uint32 result = 0;
  *mech_type = (gss_OID)(v6 + 8);
  return result;
}

OM_uint32 gss_indicate_mechs_by_attrs(OM_uint32 *minor_status, gss_const_OID_set desired_mech_attrs, gss_const_OID_set except_mech_attrs, gss_const_OID_set critical_mech_attrs, gss_OID_set *mechs)
{
  gss_OID_set v16 = 0;
  gss_OID_set set = 0;
  empty_gss_OID_set oid_set = gss_create_empty_oid_set(minor_status, mechs);
  if (!HIWORD(empty_oid_set))
  {
    _gss_load_mech();
    for (uint64_t i = _gss_mechs; i; uint64_t i = *(void *)i)
    {
      uint64_t v12 = *(void *)(i + 536);
      minor_statusgss_const_OID a = 0;
      if (v12)
      {
        uint64_t v13 = *(uint64_t (**)(OM_uint32 *, uint64_t, gss_OID_set *, gss_OID_set *))(v12 + 16);
        if (v13)
        {
          empty_gss_OID_set oid_set = v13(minor_status, i + 56, &set, &v16);
          if (HIWORD(empty_oid_set)) {
            continue;
          }
        }
      }
      if (test_mech_attrs(i + 40, &set->count, desired_mech_attrs, 0)
        && test_mech_attrs(i + 40, &set->count, except_mech_attrs, 1)
        && test_mech_attrs(i + 40, &v16->count, critical_mech_attrs, 0))
      {
        empty_gss_OID_set oid_set = gss_add_oid_set_member(minor_status, (gss_const_OID)(i + 56), mechs);
      }
      gss_release_oid_set(&minor_statusa, &set);
      gss_release_oid_set(&minor_statusa, &v16);
      if (empty_oid_set >= 0x10000) {
        break;
      }
    }
  }
  return empty_oid_set;
}

uint64_t test_mech_attrs(uint64_t a1, unint64_t *a2, void *a3, int a4)
{
  if (!a3) {
    return 1;
  }
  if (!*a3) {
    return 1;
  }
  int v8 = 0;
  uint64_t v9 = 0;
  while (1)
  {
    if (*(void *)(a1 + 424))
    {
      uint64_t v10 = 0;
      unint64_t v11 = 0;
      while (1)
      {
        int v8 = gss_oid_equal(*(gss_const_OID *)(*(void *)(a1 + 416) + v10), (gss_const_OID)(a3[1] + 16 * v9));
        if (v8) {
          break;
        }
        ++v11;
        v10 += 48;
        if (v11 >= *(void *)(a1 + 424))
        {
          int v8 = 0;
          break;
        }
      }
    }
    if (a2 && *a2)
    {
      uint64_t v12 = 0;
      unint64_t v13 = 0;
      while (1)
      {
        int v8 = gss_oid_equal((gss_const_OID)(a2[1] + v12), (gss_const_OID)(a3[1] + 16 * v9));
        if (v8) {
          break;
        }
        ++v13;
        v12 += 16;
        if (v13 >= *a2)
        {
          int v8 = 0;
          break;
        }
      }
    }
    if ((v8 == 0) != a4) {
      return 0;
    }
    if ((unint64_t)++v9 >= *a3) {
      return 1;
    }
  }
}

OM_uint32 gss_inquire_attrs_for_mech(OM_uint32 *minor_status, gss_const_OID mech, gss_OID_set *mech_attr, gss_OID_set *known_mech_attrs)
{
  if (known_mech_attrs) {
    *known_mech_attrs = 0;
  }
  if (mech && mech_attr)
  {
    mechanism = __gss_get_mechanism(mech);
    if (!mechanism)
    {
      *OM_uint32 minor_status = 0;
      return 0x10000;
    }
    uint64_t v9 = (uint64_t)mechanism;
    uint64_t v10 = mechanism[62];
    if (v10)
    {
      unint64_t v11 = *(uint64_t (**)(OM_uint32 *, gss_const_OID, gss_OID_set *, gss_OID_set *))(v10 + 16);
      if (v11)
      {
        empty_gss_OID_set oid_set = v11(minor_status, mech, mech_attr, known_mech_attrs);
        goto LABEL_10;
      }
    }
    empty_gss_OID_set oid_set = gss_create_empty_oid_set(minor_status, mech_attr);
    if (empty_oid_set)
    {
LABEL_10:
      if (HIWORD(empty_oid_set)) {
        OM_uint32 v13 = empty_oid_set;
      }
      else {
        OM_uint32 v13 = 0;
      }
      if (!known_mech_attrs || HIWORD(empty_oid_set)) {
        return v13;
      }
      goto LABEL_19;
    }
    add_all_mo(v9, mech_attr, 1);
  }
  if (!known_mech_attrs) {
    return 0;
  }
LABEL_19:
  if (*known_mech_attrs || (OM_uint32 v14 = gss_create_empty_oid_set(minor_status, known_mech_attrs), v14 < 0x10000))
  {
    _gss_load_mech();
    CFTypeID v15 = (void *)_gss_mechs;
    if (_gss_mechs)
    {
      do
      {
        add_all_mo((uint64_t)(v15 + 5), known_mech_attrs, 1);
        CFTypeID v15 = (void *)*v15;
      }
      while (v15);
    }
    return 0;
  }
  OM_uint32 v13 = v14;
  if (mech_attr)
  {
    minor_statusgss_const_OID a = 0;
    gss_release_oid_set(&minor_statusa, mech_attr);
  }
  return v13;
}

uint64_t __ApplePrivate_gss_cred_hold(_DWORD *a1, uint64_t a2)
{
  *a1 = 0;
  if (!a2) {
    return 458752;
  }
  for (uint64_t i = *(void **)(a2 + 16); i; uint64_t i = (void *)*i)
  {
    unsigned __int8 v4 = *(void (**)(_DWORD *, void))(i[1] + 384);
    if (v4) {
      v4(a1, i[3]);
    }
  }
  return 0;
}

uint64_t __ApplePrivate_gss_cred_unhold(_DWORD *a1, uint64_t a2)
{
  *a1 = 0;
  if (!a2) {
    return 458752;
  }
  for (uint64_t i = *(void **)(a2 + 16); i; uint64_t i = (void *)*i)
  {
    unsigned __int8 v4 = *(void (**)(_DWORD *, void))(i[1] + 392);
    if (v4) {
      v4(a1, i[3]);
    }
  }
  return 0;
}

uint64_t gss_mg_gen_cb(int *a1, void *a2, uint64_t a3, void *a4)
{
  krb5_data_zero();
  if (!krb5_storage_emem())
  {
    *a1 = 12;
    return 851968;
  }
  krb5_storage_set_byteorder();
  int v7 = krb5_store_int32();
  if (v7) {
    goto LABEL_18;
  }
  int v7 = krb5_store_int32();
  if (v7) {
    goto LABEL_18;
  }
  uint64_t v8 = krb5_storage_write();
  if (v8 < 0 || v8 != a2[1]) {
    goto LABEL_17;
  }
  int v7 = krb5_store_int32();
  if (v7) {
    goto LABEL_18;
  }
  int v7 = krb5_store_int32();
  if (v7) {
    goto LABEL_18;
  }
  uint64_t v9 = krb5_storage_write();
  if (v9 < 0 || v9 != a2[4]) {
    goto LABEL_17;
  }
  int v7 = krb5_store_int32();
  if (v7)
  {
LABEL_18:
    *a1 = v7;
    krb5_storage_free();
    return 851968;
  }
  uint64_t v10 = krb5_storage_write();
  if (v10 < 0 || v10 != a2[6])
  {
LABEL_17:
    int v7 = 12;
    goto LABEL_18;
  }
  int v7 = krb5_storage_to_data();
  if (v7) {
    goto LABEL_18;
  }
  CCDigest();
  if (a4)
  {
    *a4 = 0;
    a4[1] = 0;
  }
  else
  {
    krb5_data_free();
  }
  uint64_t result = 0;
  *a1 = 0;
  return result;
}

uint64_t gss_mg_validate_cb(int *a1, void *a2, void *a3, gss_buffer_desc_struct *a4)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (!a2 || (*a3 == gss_mg_validate_cb_zeros ? (BOOL v5 = a3[1] == unk_267803980) : (BOOL v5 = 0), v5))
  {
    uint64_t result = 0;
    a4->size_t length = 0;
    a4->gss_buffer_desc_struct value = 0;
  }
  else
  {
    OM_uint32 minor_status = 0;
    uint64_t result = gss_mg_gen_cb(a1, a2, (uint64_t)v9, a4);
    if (!result)
    {
      uint64_t result = ct_memcmp();
      if (result)
      {
        gss_release_buffer(&minor_status, a4);
        *a1 = 0;
        return 0x40000;
      }
    }
  }
  return result;
}

uint64_t _gss_acquire_mech_cred(_DWORD *a1, uint64_t a2, uint64_t a3, const gss_OID_desc *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  *a9 = 0;
  gss_OID_set v16 = (char *)malloc_type_calloc(1uLL, 0x20uLL, 0x20040DC1BFBCFuLL);
  if (v16)
  {
    uint64_t v17 = v16;
    *((void *)v16 + 1) = a2;
    *((void *)v16 + 2) = a2 + 16;
    v27[0] = 1;
    v27[1] = a2 + 16;
    CFTypeID v18 = *(uint64_t (**)(_DWORD *, uint64_t, const gss_OID_desc *, uint64_t, uint64_t))(a2 + 360);
    if (v18)
    {
      if (a3) {
        uint64_t v19 = *(void *)(a3 + 24);
      }
      else {
        uint64_t v19 = 0;
      }
      uint64_t v24 = v18(a1, v19, a4, a5, a6);
    }
    else if (gss_oid_equal(a4, &__gss_c_cred_password_oid_desc) {
           && (uint64_t v21 = *(void *)(a2 + 496)) != 0
    }
           && (gss_name_t v22 = *(uint64_t (**)(_DWORD *, uint64_t, uint64_t, uint64_t, void *, uint64_t, char *, void, void))(v21 + 24)) != 0)
    {
      if (a3) {
        uint64_t v23 = *(void *)(a3 + 24);
      }
      else {
        uint64_t v23 = 0;
      }
      uint64_t v24 = v22(a1, v23, a5, a6, v27, a8, v17 + 24, 0, 0);
    }
    else
    {
      if (a4)
      {
        free(v17);
        uint64_t v17 = 0;
        uint64_t v20 = 0x100000;
LABEL_17:
        *a9 = v17;
        return v20;
      }
      if (a3) {
        uint64_t v26 = *(void *)(a3 + 24);
      }
      else {
        uint64_t v26 = 0;
      }
      uint64_t v24 = (*(uint64_t (**)(_DWORD *, uint64_t, uint64_t, void *, uint64_t, char *, void, void))(a2 + 40))(a1, v26, a6, v27, a8, v17 + 24, 0, 0);
    }
    uint64_t v20 = v24;
    if (v24) {
      _gss_mg_error(a2, *a1);
    }
    goto LABEL_17;
  }
  *a1 = 12;
  return 851968;
}

uint64_t __ApplePrivate_gss_acquire_cred_ext(OM_uint32 *a1, uint64_t a2, const gss_OID_desc *a3, uint64_t a4, unsigned int a5, const gss_OID_desc *a6, unsigned int a7, void *a8)
{
  *a1 = 0;
  if (!a8) {
    return 0x1000000;
  }
  uint64_t v31 = 0;
  unsigned int v32 = 0;
  _gss_load_mech();
  if (a6)
  {
    present[0] = 0;
    gss_test_oid_set_member(a1, a6, (gss_OID_set)_gss_mech_oids, present);
    if (!present[0]) {
      return 0x10000;
    }
    uint64_t v31 = 1;
    unsigned int v32 = a6;
    OM_uint32 v14 = &v31;
  }
  else
  {
    OM_uint32 v14 = (uint64_t *)_gss_mech_oids;
  }
  uint64_t v16 = _gss_mg_alloc_cred();
  if (v16)
  {
    uint64_t v17 = (void *)v16;
    char v25 = a8;
    *a1 = 0;
    if (*v14)
    {
      uint64_t v18 = 0;
      unint64_t v19 = 0;
      uint64_t v15 = 458752;
      do
      {
        int v29 = 0;
        *(void *)int present = 0;
        unsigned int v28 = 0;
        mechanism = __gss_get_mechanism((const gss_OID_desc *)(v14[1] + v18));
        if (mechanism)
        {
          uint64_t v22 = (uint64_t)mechanism;
          if (!a2 || !_gss_find_mn(&v28, a2, (gss_const_OID)(v14[1] + v18), (gss_OID_desc **)present))
          {
            uint64_t v15 = _gss_acquire_mech_cred(a1, v22, *(uint64_t *)present, a3, a4, a5, v21, a7, &v29);
            if (!WORD1(v15))
            {
              uint64_t v23 = v29;
              *int v29 = v17[2];
              void v17[2] = v23;
            }
          }
        }
        ++v19;
        v18 += 16;
      }
      while (v19 < *v14);
    }
    else
    {
      uint64_t v15 = 458752;
    }
    if (v17[2])
    {
      uint64_t v15 = 0;
      void *v25 = v17;
      *a1 = 0;
    }
    else
    {
      free(v17);
    }
  }
  else
  {
    *a1 = 12;
    return 851968;
  }
  return v15;
}

OM_uint32 gss_acquire_cred_with_password(OM_uint32 *minor_status, gss_name_t desired_name, gss_buffer_t password, OM_uint32 time_req, gss_OID_set desired_mechs, gss_cred_usage_t cred_usage, gss_cred_id_t *output_cred_handle, gss_OID_set *actual_mechs, OM_uint32 *time_rec)
{
  uint64_t v10 = output_cred_handle;
  minor_statusgss_const_OID a = 0;
  if (desired_mechs)
  {
    uint64_t v17 = _gss_mg_alloc_cred();
    if (!v17)
    {
      *OM_uint32 minor_status = 12;
      return 851968;
    }
    uint64_t v18 = (void *)v17;
    *(void *)(v17 + 16) = 0;
    if (!desired_mechs->count) {
      goto LABEL_17;
    }
    char v25 = actual_mechs;
    uint64_t v26 = v10;
    uint64_t v19 = 0;
    size_t v20 = 0;
    do
    {
      gss_cred_id_t cred_handle = 0;
      if (!(__ApplePrivate_gss_acquire_cred_ext(minor_status, (uint64_t)desired_name, &__gss_c_cred_password_oid_desc, (uint64_t)password, time_req, &desired_mechs->elements[v19], cred_usage, &cred_handle) >> 16))
      {
        uint64_t v21 = (void *)*((void *)cred_handle + 2);
        if (v21)
        {
          *((void *)cred_handle + 2) = *v21;
          void *v21 = v18[2];
          void v18[2] = v21;
        }
        gss_release_cred(&minor_statusa, &cred_handle);
      }
      ++v20;
      ++v19;
    }
    while (v20 < desired_mechs->count);
    actual_mechs = v25;
    uint64_t v10 = v26;
    if (!v18[2])
    {
LABEL_17:
      free(v18);
      *OM_uint32 minor_status = 0;
      return 458752;
    }
    *uint64_t v26 = (gss_cred_id_t)v18;
  }
  else
  {
    OM_uint32 v22 = __ApplePrivate_gss_acquire_cred_ext(minor_status, (uint64_t)desired_name, &__gss_c_cred_password_oid_desc, (uint64_t)password, time_req, 0, cred_usage, output_cred_handle);
    if (v22 >= 0x10000) {
      return v22;
    }
  }
  if ((unint64_t)actual_mechs | (unint64_t)time_rec
    && (OM_uint32 v23 = gss_inquire_cred(minor_status, *v10, 0, time_rec, 0, actual_mechs), v23 >= 0x10000))
  {
    OM_uint32 v22 = v23;
    gss_release_cred(&minor_statusa, v10);
  }
  else
  {
    OM_uint32 v22 = 0;
    *OM_uint32 minor_status = 0;
  }
  return v22;
}

uint64_t gss_authorize_localname(OM_uint32 *a1, gss_name_t_desc_struct *a2, uint64_t a3)
{
  *a1 = 0;
  uint64_t v3 = 0x1000000;
  if (!a2 || !a3) {
    return v3;
  }
  int v7 = (void *)*((void *)a2 + 6);
  if (!v7)
  {
    int v10 = 1179648;
    goto LABEL_13;
  }
  while (1)
  {
    uint64_t v8 = *(uint64_t (**)(OM_uint32 *, void, uint64_t, uint64_t))(v7[1] + 440);
    if (!v8)
    {
      int v10 = 0x100000;
      goto LABEL_8;
    }
    uint64_t v9 = v8(a1, v7[3], a3 + 32, a3 + 16);
    int v10 = v9;
    if (v9 != 983040) {
      break;
    }
LABEL_8:
    int v7 = (void *)*v7;
    if (!v7) {
      goto LABEL_13;
    }
  }
  if (!v9) {
    return v9;
  }
LABEL_13:
  int v19 = -1;
  if (!gss_oid_equal((gss_const_OID)(a3 + 16), &__gss_c_nt_user_name_oid_desc))
  {
    uint64_t v3 = 196608;
    goto LABEL_27;
  }
  while (1)
  {
    OM_uint32 minor_status = 0;
    __n.size_t length = 0;
    __n.gss_buffer_desc_struct value = 0;
    buffer.size_t length = 0;
    buffer.gss_buffer_desc_struct value = 0;
    uint64_t v15 = 0;
    uint64_t name_attribute = gss_get_name_attribute(a1, a2, (uint64_t)&__gss_c_attr_local_login_user, (_DWORD *)&v15 + 1, &v15, &__n, &buffer, (uint64_t)&v19);
    if (name_attribute >= 0x10000) {
      break;
    }
    if (HIDWORD(v15) && __n.length == *(void *)(a3 + 32) && !memcmp(__n.value, *(const void **)(a3 + 40), __n.length))
    {
      int v12 = 0;
      uint64_t v3 = 0;
    }
    else
    {
      uint64_t v3 = 983040;
      int v12 = 1;
    }
    gss_release_buffer(&minor_status, &__n);
    gss_release_buffer(&minor_status, &buffer);
    if (!v12 || !v19) {
      goto LABEL_25;
    }
  }
  uint64_t v3 = name_attribute;
LABEL_25:
  if (v3 && v3 != 983040)
  {
LABEL_27:
    if (v10 == 0x100000)
    {
      LODWORD(__n.length) = 0;
      OM_uint32 v13 = gss_compare_name(a1, a2, (gss_name_t)a3, (int *)&__n);
      if (v13 | LODWORD(__n.length)) {
        return v13;
      }
      else {
        return 983040;
      }
    }
  }
  return v3;
}

int gss_userok(gss_name_t name, const char *user)
{
  OM_uint32 minor_status = 0;
  uint64_t v6 = 0;
  input_name_buffer.gss_buffer_desc_struct value = (void *)user;
  input_name_buffer.size_t length = strlen(user);
  OM_uint32 v3 = gss_import_name(&minor_status, &input_name_buffer, &__gss_c_nt_user_name_oid_desc, (gss_name_t *)&v6);
  int result = 0;
  if (!HIWORD(v3))
  {
    int v5 = gss_authorize_localname(&minor_status, name, v6);
    gss_release_name(&minor_status, (gss_name_t *)&v6);
    return v5 == 0;
  }
  return result;
}

uint64_t gss_delete_name_attribute(_DWORD *a1, uint64_t a2, uint64_t a3)
{
  *a1 = 0;
  if (!a2) {
    return 0x20000;
  }
  OM_uint32 v3 = *(void **)(a2 + 48);
  if (!v3) {
    return 0x100000;
  }
  uint64_t v6 = 0x100000;
  do
  {
    uint64_t v7 = v3[1];
    uint64_t v8 = *(uint64_t (**)(_DWORD *, void, uint64_t))(v7 + 480);
    if (v8)
    {
      uint64_t v6 = v8(a1, v3[3], a3);
      if (v6 < 0x10000) {
        return v6;
      }
      _gss_mg_error(v7, *a1);
    }
    OM_uint32 v3 = (void *)*v3;
  }
  while (v3);
  return v6;
}

uint64_t gss_display_name_ext(_DWORD *a1, uint64_t a2, uint64_t a3, void *a4)
{
  *a1 = 0;
  if (a4)
  {
    *a4 = 0;
    a4[1] = 0;
  }
  if (!a2) {
    return 0x20000;
  }
  uint64_t v7 = *(void **)(a2 + 48);
  if (!v7) {
    return 0x100000;
  }
  uint64_t v8 = 0x100000;
  do
  {
    uint64_t v9 = v7[1];
    int v10 = *(uint64_t (**)(_DWORD *, void, uint64_t, void *))(v9 + 448);
    if (v10)
    {
      uint64_t v8 = v10(a1, v7[3], a3, a4);
      if (v8 < 0x10000) {
        return v8;
      }
      _gss_mg_error(v9, *a1);
    }
    uint64_t v7 = (void *)*v7;
  }
  while (v7);
  return v8;
}

uint64_t gss_export_name_composite(_DWORD *a1, uint64_t a2, void *a3)
{
  *a1 = 0;
  if (a3)
  {
    *a3 = 0;
    a3[1] = 0;
  }
  if (!a2) {
    return 0x20000;
  }
  int v5 = *(void **)(a2 + 48);
  if (!v5) {
    return 0x100000;
  }
  uint64_t v6 = 0x100000;
  do
  {
    uint64_t v7 = v5[1];
    uint64_t v8 = *(uint64_t (**)(_DWORD *, void, void *))(v7 + 488);
    if (v8)
    {
      uint64_t v6 = v8(a1, v5[3], a3);
      if (v6 < 0x10000) {
        return v6;
      }
      _gss_mg_error(v7, *a1);
    }
    int v5 = (void *)*v5;
  }
  while (v5);
  return v6;
}

uint64_t gss_get_name_attribute(_DWORD *a1, void *a2, uint64_t a3, _DWORD *a4, _DWORD *a5, void *a6, void *a7, uint64_t a8)
{
  *a1 = 0;
  if (a4) {
    *a4 = 0;
  }
  if (a5) {
    *a5 = 0;
  }
  if (a6)
  {
    *a6 = 0;
    a6[1] = 0;
  }
  if (a7)
  {
    *a7 = 0;
    a7[1] = 0;
  }
  if (!a2) {
    return 0x20000;
  }
  _gss_mg_check_name(a2);
  uint64_t v16 = (void *)a2[6];
  if (!v16) {
    return 0x100000;
  }
  uint64_t v17 = 0x100000;
  do
  {
    uint64_t v18 = v16[1];
    int v19 = *(uint64_t (**)(_DWORD *, void, uint64_t, _DWORD *, _DWORD *, void *, void *, uint64_t))(v18 + 464);
    if (v19)
    {
      uint64_t v17 = v19(a1, v16[3], a3, a4, a5, a6, a7, a8);
      if (v17 < 0x10000) {
        return v17;
      }
      _gss_mg_error(v18, *a1);
    }
    uint64_t v16 = (void *)*v16;
  }
  while (v16);
  return v17;
}

OM_uint32 gss_inquire_name(OM_uint32 *minor_status, gss_name_t input_name, int *name_is_MN, gss_OID *MN_mech, gss_buffer_set_t *attrs)
{
  *OM_uint32 minor_status = 0;
  if (name_is_MN) {
    *name_is_MN = 0;
  }
  if (MN_mech) {
    *MN_size_t mech = 0;
  }
  if (attrs) {
    *attrs = 0;
  }
  if (!input_name) {
    return 0x20000;
  }
  uint64_t v9 = (void *)*((void *)input_name + 6);
  if (!v9) {
    return 0x100000;
  }
  OM_uint32 v10 = 0x100000;
  while (1)
  {
    unint64_t v11 = (gss_OID_desc_struct *)v9[1];
    elements = (uint64_t (*)(void, void, void, void, void))v11[28].elements;
    if (elements) {
      break;
    }
LABEL_13:
    uint64_t v9 = (void *)*v9;
    if (!v9) {
      return v10;
    }
  }
  OM_uint32 v13 = elements(minor_status, v9[3], 0, MN_mech, attrs);
  if (v13)
  {
    OM_uint32 v10 = v13;
    _gss_mg_error((uint64_t)v11, *minor_status);
    goto LABEL_13;
  }
  if (name_is_MN) {
    *name_is_MN = 1;
  }
  if (!MN_mech || *MN_mech) {
    return 0;
  }
  OM_uint32 v10 = 0;
  *MN_size_t mech = v11 + 1;
  return v10;
}

uint64_t gss_pname_to_uid(unsigned int *a1, uint64_t a2, const gss_OID_desc *a3, uid_t *a4)
{
  OM_uint32 v10 = 0;
  *a1 = 0;
  if (a3)
  {
    uint64_t mn = _gss_find_mn(a1, a2, a3, &v10);
    if (WORD1(mn)) {
      return mn;
    }
    if (!mech_pname_to_uid(a1, (uint64_t)v10)) {
      return 0;
    }
    uint64_t mn = attr_pname_to_uid(a1, (uint64_t)v10, a4);
    uint64_t i = v10;
    if (!mn) {
      return mn;
    }
    goto LABEL_14;
  }
  for (uint64_t i = *(gss_OID_desc **)(a2 + 48); ; uint64_t i = *(gss_OID_desc **)&i->length)
  {
    OM_uint32 v10 = i;
    if (!i) {
      return 0x100000;
    }
    if (!mech_pname_to_uid(a1, (uint64_t)i)) {
      return 0;
    }
    uint64_t v8 = attr_pname_to_uid(a1, (uint64_t)i, a4);
    if (v8 != 0x100000) {
      break;
    }
  }
  uint64_t mn = v8;
  if (v8)
  {
LABEL_14:
    if (i) {
      _gss_mg_error((uint64_t)i->elements, *a1);
    }
  }
  return mn;
}

uint64_t mech_pname_to_uid(_DWORD *a1, uint64_t a2)
{
  *a1 = 0;
  gss_cred_id_t v2 = *(uint64_t (**)(void))(*(void *)(a2 + 8) + 432);
  if (!v2) {
    return 0x100000;
  }
  uint64_t v5 = v2();
  if (v5 >= 0x10000) {
    _gss_mg_error(*(void *)(a2 + 8), *a1);
  }
  return v5;
}

uint64_t attr_pname_to_uid(_DWORD *a1, uint64_t a2, uid_t *a3)
{
  int v15 = -1;
  *a1 = 0;
  if (!*(void *)(*(void *)(a2 + 8) + 464)) {
    return 0x100000;
  }
  OM_uint32 minor_status = 0;
  while (1)
  {
    buffer.size_t length = 0;
    buffer.gss_buffer_desc_struct value = 0;
    v13.size_t length = 0;
    v13.gss_buffer_desc_struct value = 0;
    uint64_t v12 = 0;
    uint64_t v6 = (*(uint64_t (**)(_DWORD *, void, gss_buffer_desc *, char *, uint64_t *, gss_buffer_desc_struct *, gss_buffer_desc_struct *, int *))(*(void *)(a2 + 8) + 464))(a1, *(void *)(a2 + 24), &__gss_c_attr_local_login_user, (char *)&v12 + 4, &v12, &buffer, &v13, &v15);
    if (v6 >= 0x10000)
    {
      uint64_t v10 = v6;
      _gss_mg_error(*(void *)(a2 + 8), *a1);
      return v10;
    }
    uint64_t v7 = (char *)malloc_type_malloc(buffer.length + 1, 0xF21CBFA9uLL);
    if (!v7)
    {
      *a1 = 12;
      return 851968;
    }
    uint64_t v8 = v7;
    memcpy(v7, buffer.value, buffer.length);
    v8[buffer.length] = 0;
    uint64_t v9 = getpwnam(v8);
    free(v8);
    gss_release_buffer(&minor_status, &buffer);
    gss_release_buffer(&minor_status, &v13);
    if (v9) {
      break;
    }
    if (!v15) {
      return 0x100000;
    }
  }
  uint64_t v10 = 0;
  *a3 = v9->pw_uid;
  *a1 = 0;
  return v10;
}

uint64_t gss_set_name_attribute(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *a1 = 0;
  if (!a2) {
    return 0x20000;
  }
  uint64_t v5 = *(void **)(a2 + 48);
  if (!v5) {
    return 0x100000;
  }
  uint64_t v10 = 0x100000;
  do
  {
    uint64_t v11 = v5[1];
    uint64_t v12 = *(uint64_t (**)(_DWORD *, void, uint64_t, uint64_t, uint64_t))(v11 + 472);
    if (v12)
    {
      uint64_t v10 = v12(a1, v5[3], a3, a4, a5);
      if (v10 < 0x10000) {
        return v10;
      }
      _gss_mg_error(v11, *a1);
    }
    uint64_t v5 = (void *)*v5;
  }
  while (v5);
  return v10;
}

void _gss_mg_release_cred(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 16);
  if (v1)
  {
    int v4 = 0;
    do
    {
      uint64_t v3 = v1[1];
      *(void *)(a1 + 16) = *v1;
      (*(void (**)(int *, void *))(v3 + 48))(&v4, v1 + 3);
      free(v1);
      uint64_t v1 = *(void **)(a1 + 16);
    }
    while (v1);
  }
}

uint64_t _gss_mg_alloc_cred()
{
  if (getTypeID_inited_0 != -1) {
    dispatch_once(&getTypeID_inited_0, &__block_literal_global_1);
  }
  if (!getTypeID_haid_0) {
    return 0;
  }
  uint64_t result = _CFRuntimeCreateInstance();
  if (result) {
    *(void *)(result + 16) = 0;
  }
  return result;
}

void _gss_mg_check_credential(const void *a1)
{
  if (a1)
  {
    CFTypeID v1 = CFGetTypeID(a1);
    if (getTypeID_inited_0 != -1) {
      dispatch_once(&getTypeID_inited_0, &__block_literal_global_1);
    }
    if (v1 != getTypeID_haid_0)
    {
      uint64_t v2 = heim_abort();
      _gss_cred_copy_name(v2);
    }
  }
}

gss_buffer_desc_struct *_gss_cred_copy_name(uint64_t a1, uint64_t a2, const gss_OID_desc *a3)
{
  name = (gss_buffer_desc_struct *)_gss_create_name(0, 0);
  if (name)
  {
    for (uint64_t i = *(uint64_t ***)(a2 + 16); i; uint64_t i = (uint64_t **)*i)
    {
      uint64_t v12 = 0;
      if ((!a3 || gss_oid_equal(a3, (gss_const_OID)i[2]))
        && !((unsigned int (*)(uint64_t, uint64_t *, uint64_t *, void, void, void))i[1][23])(a1, i[3], &v12, 0, 0, 0))
      {
        uint64_t v8 = malloc_type_malloc(0x20uLL, 0x20040DC1BFBCFuLL);
        uint64_t v9 = i[1];
        if (v8)
        {
          uint64_t v10 = v12;
          v8[2] = i[2];
          v8[3] = v10;
          void *v8 = name[3].length;
          v8[1] = v9;
          name[3].size_t length = (size_t)v8;
        }
        else
        {
          ((void (*)(uint64_t, uint64_t *))v9[22])(a1, &v12);
        }
      }
    }
    if (!name[3].length)
    {
      _gss_mg_release_name(name);
      return 0;
    }
  }
  return name;
}

uint64_t __getTypeID_block_invoke_0()
{
  uint64_t result = _CFRuntimeRegisterClass();
  getTypeID_haid_0 = result;
  return result;
}

__CFString *_gss_mg_copy_debug_cred(uint64_t a1)
{
  CFMutableDictionaryRef Mutable = CFStringCreateMutable(0, 0);
  uint64_t v3 = Mutable;
  if (Mutable)
  {
    CFStringAppendFormat(Mutable, 0, @"GSSCred: %p", a1);
    for (uint64_t i = *(uint64_t ***)(a1 + 16); i; uint64_t i = (uint64_t **)*i)
    {
      uint64_t v5 = __ApplePrivate_gss_oid_to_name((gss_const_OID)i[2]);
      buffer.size_t length = 0;
      buffer.gss_buffer_desc_struct value = 0;
      OM_uint32 minor_status = 0;
      uint64_t v9 = 0;
      if (((unsigned int (*)(OM_uint32 *, uint64_t *, uint64_t *, void, void, void))i[1][23])(&minor_status, i[3], &v9, 0, 0, 0))
      {
        gss_buffer_desc_struct value = 0;
        size_t length = 0;
        buffer.size_t length = 0;
        buffer.gss_buffer_desc_struct value = 0;
      }
      else
      {
        ((void (*)(OM_uint32 *, uint64_t, gss_buffer_desc_struct *, void))i[1][19])(&minor_status, v9, &buffer, 0);
        size_t length = buffer.length;
        gss_buffer_desc_struct value = buffer.value;
      }
      CFStringAppendFormat(v3, 0, @" <MC: %s %.*s>", v5, length, value);
      ((void (*)(OM_uint32 *, uint64_t *))i[1][22])(&minor_status, &v9);
      gss_release_buffer(&minor_status, &buffer);
    }
  }
  return v3;
}

uint64_t _gss_spnego_accept_sec_context(_DWORD *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void *a7, void *a8, _DWORD *a9, _DWORD *a10, void *a11)
{
  *a1 = 0;
  *a8 = 0;
  a8[1] = 0;
  if (a6) {
    *a6 = 0;
  }
  if (a7) {
    *a7 = 0;
  }
  if (a9) {
    *a9 = 0;
  }
  if (a10) {
    *a10 = 0;
  }
  if (a11) {
    *a11 = 0;
  }
  uint64_t v11 = acceptor_continue;
  if (!*a2) {
    uint64_t v11 = acceptor_start;
  }
  return ((uint64_t (*)(_DWORD *, void *, uint64_t))v11)(a1, a2, a3);
}

uint64_t acceptor_start(OM_uint32 *minor_status, uint64_t *a2, gss_cred_id_t_desc_struct *a3, const gss_buffer_desc *a4, gss_channel_bindings_struct *a5, void *a6, void *a7, gss_buffer_desc_struct *a8, _DWORD *a9, _DWORD *a10, gss_cred_id_t *a11)
{
  minor_statusgss_const_OID a = 0;
  output_token.gss_buffer_desc_struct value = 0;
  uint64_t v61 = 0;
  buffer.gss_buffer_desc_struct value = 0;
  output_token.size_t length = 0;
  int v58 = 0;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  buffer.size_t length = 0;
  if (!a4->length)
  {
    uint64_t v67 = 0;
    v68.size_t length = 1;
    v68.gss_buffer_desc_struct value = 0;
    uint64_t v69 = 0;
    uint64_t v71 = 0;
    uint64_t v72 = 0;
    uint64_t v70 = 0;
    uint64_t v19 = _gss_spnego_indicate_mechtypelist(minor_status, 0, (unsigned int (*)(uint64_t, uint64_t, gss_cred_id_t, gss_OID_desc *))acceptor_approved, 0, 1, 0, (uint64_t)&v68.value, 0);
    if (!v19)
    {
      uint64_t v72 = (char ***)malloc_type_calloc(1uLL, 0x10uLL, 0xA0040BD48D6D6uLL);
      if (v72 && (OM_uint32 v22 = (char **)malloc_type_calloc(1uLL, 8uLL, 0x10040436913F5uLL), (*v72 = v22) != 0))
      {
        OM_uint32 v23 = *v72;
        *OM_uint32 v23 = strdup("not_defined_in_RFC4178@please_ignore");
        v72[1] = 0;
        uint64_t v24 = length_NegotiationTokenWin((uint64_t)&v68);
        input_token.size_t length = v24;
        char v25 = malloc_type_malloc(v24, 0x5AC0961BuLL);
        input_token.gss_buffer_desc_struct value = v25;
        if (v25)
        {
          uint64_t v26 = v25;
          OM_uint32 v27 = encode_NegotiationTokenWin((uint64_t)v25 + v24 - 1, v24, (uint64_t)&v68, (uint64_t)&v67);
          if (!v27)
          {
            free_NegotiationTokenWin((uint64_t)&v68);
            if (v24 != v67) {
              abort();
            }
            uint64_t v19 = gss_encapsulate_token(&input_token, &__gss_spnego_mechanism_oid_desc, a8);
            free(input_token.value);
            if (!v19)
            {
              *OM_uint32 minor_status = 0;
              return 1;
            }
            return v19;
          }
          OM_uint32 v28 = v27;
          free(v26);
        }
        else
        {
          OM_uint32 v28 = 12;
        }
        free_NegotiationTokenWin((uint64_t)&v68);
        *OM_uint32 minor_status = v28;
      }
      else
      {
        *OM_uint32 minor_status = 12;
        free_NegotiationTokenWin((uint64_t)&v68);
      }
      return 851968;
    }
    return v19;
  }
  uint64_t v19 = _gss_spnego_alloc_sec_context(minor_status, a2);
  if (v19) {
    return v19;
  }
  uint64_t v56 = (uint64_t)a8;
  uint64_t v20 = *a2;
  size_t v57 = (pthread_mutex_t *)(*a2 + 72);
  pthread_mutex_lock(v57);
  uint64_t v19 = gss_decapsulate_token(a4, &__gss_spnego_mechanism_oid_desc, &output_token);
  if (v19)
  {
LABEL_20:
    if (buffer.value) {
      gss_release_buffer(&minor_statusa, &buffer);
    }
    free_NegotiationToken((uint64_t)&v62);
    if (!v19)
    {
      _gss_spnego_fixup_ntlm(v20);
      if (a6)
      {
        if (*(void *)(v20 + 56))
        {
          int v33 = malloc_type_calloc(1uLL, 0x28uLL, 0x10A004092E30F56uLL);
          if (v33)
          {
            v33[4] = *(void *)(v20 + 56);
            *(void *)(v20 + 56) = 0;
            *a6 = v33;
          }
        }
      }
    }
    if (a7) {
      *a7 = *(void *)(v20 + 32);
    }
    if (a9) {
      *a9 = *(_DWORD *)(v20 + 48);
    }
    if (a10) {
      *a10 = *(_DWORD *)(v20 + 52);
    }
    if (v19 > 1) {
      _gss_spnego_internal_delete_sec_context(&minor_statusa, a2, 0);
    }
    else {
      pthread_mutex_unlock(v57);
    }
    return v19;
  }
  OM_uint32 v21 = decode_NegotiationToken((uint64_t)output_token.value, output_token.length, (uint64_t)&v62, (uint64_t)&v61);
  gss_release_buffer(minor_status, &output_token);
  if (v21)
  {
    *OM_uint32 minor_status = v21;
LABEL_19:
    uint64_t v19 = 589824;
    goto LABEL_20;
  }
  if (v62 != 1 || !DWORD2(v62))
  {
    *OM_uint32 minor_status = 0;
    goto LABEL_19;
  }
  v68.size_t length = DWORD2(v62);
  v68.gss_buffer_desc_struct value = (void *)v63;
  size_t v29 = length_MechTypeList((uint64_t)&v68);
  *(void *)uint64_t v20 = v29;
  uint64_t v30 = malloc_type_malloc(v29, 0x5460504AuLL);
  *(void *)(v20 + 8) = v30;
  if (!v30)
  {
    OM_uint32 v32 = 12;
    goto LABEL_44;
  }
  OM_uint32 v31 = encode_MechTypeList((uint64_t)v30 + *(void *)v20 - 1, *(void *)v20, (uint64_t)&v68, (uint64_t)&v61);
  if (v31)
  {
    OM_uint32 v32 = v31;
    free(*(void **)(v20 + 8));
    *(void *)(v20 + 8) = 0;
LABEL_44:
    *OM_uint32 minor_status = v32;
    uint64_t v19 = 851968;
    goto LABEL_20;
  }
  OM_uint32 v55 = (const gss_OID_desc **)(v20 + 16);
  if (select_mech(minor_status, v63, 0, (const gss_OID_desc **)(v20 + 24), (int **)(v20 + 16))
    || !(void)v64)
  {
    *OM_uint32 minor_status = 0;
    pthread_mutex_unlock(v57);
    return gss_mg_set_error_string(0, 0x80000, *minor_status, "SPNEGO acceptor didn't find a prefered mechanism", v35, v36, v37, v38, ret_flags);
  }
  uint64_t v54 = (gss_const_OID *)(v20 + 24);
  v68.gss_buffer_desc_struct value = 0;
  v68.size_t length = 0;
  uint64_t v39 = *(void **)(v64 + 8);
  v68.size_t length = *(void *)v64;
  v68.gss_buffer_desc_struct value = v39;
  if (*(void *)(v20 + 56)) {
    gss_release_name(&minor_statusa, (gss_name_t *)(v20 + 56));
  }
  uint64_t v19 = gss_accept_sec_context(minor_status, (gss_ctx_id_t *)(v20 + 40), a3, &v68, a5, (gss_name_t *)(v20 + 56), (gss_OID *)(v20 + 32), &buffer, (OM_uint32 *)(v20 + 48), (OM_uint32 *)(v20 + 52), a11);
  if (v19 <= 1)
  {
    uint64_t v40 = (void *)(v20 + 16);
    if (!gss_oid_equal(*(gss_const_OID *)(v20 + 32), *v54)) {
      _gss_mg_log(1, "client didn't send the mech they said they would", v44, v45, v46, v47, v48, v49, ret_flagsa);
    }
    if (v19)
    {
      uint64_t v19 = 1;
    }
    else
    {
      uint64_t v19 = acceptor_complete(minor_status, v20, &v58, (uint64_t)&v68, &buffer, *((size_t **)&v64 + 1), v56);
      if (v19) {
        goto LABEL_20;
      }
      *(_WORD *)(v20 + 64) |= 1u;
    }
  }
  else
  {
    gss_mg_collect_error(*v54, v19, *minor_status);
    uint64_t v40 = (void *)(v20 + 16);
    *OM_uint32 v55 = 0;
    if ((void)v64 && DWORD2(v62) >= 2)
    {
      unint64_t v41 = 1;
      uint64_t v42 = 16;
      while (1)
      {
        uint64_t v43 = select_mech(&minor_statusa, v63 + v42, 1, v55, 0);
        if (!v43) {
          break;
        }
        uint64_t v19 = v43;
        ++v41;
        v42 += 16;
        if (v41 >= DWORD2(v62)) {
          goto LABEL_61;
        }
      }
      if (*v55)
      {
        uint64_t v50 = 0;
LABEL_71:
        uint64_t v19 = send_accept(minor_status, v20, &buffer, 1, v50, v56);
        goto LABEL_20;
      }
      goto LABEL_73;
    }
  }
LABEL_61:
  if (*v40)
  {
    if (v58) {
      uint64_t v50 = (gss_buffer_desc_struct *)v20;
    }
    else {
      uint64_t v50 = 0;
    }
    goto LABEL_71;
  }
  if (v19)
  {
    send_reject(minor_status, v56);
    goto LABEL_20;
  }
LABEL_73:
  uint64_t v51 = heim_abort();
  return acceptor_continue(v51);
}

uint64_t acceptor_continue(OM_uint32 *a1, uint64_t *a2, gss_cred_id_t_desc_struct *a3, uint64_t *a4, gss_channel_bindings_struct *a5, void *a6, void *a7, uint64_t a8, _DWORD *a9, _DWORD *a10, gss_cred_id_t *a11)
{
  minor_status[0] = 0;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v35 = 0u;
  uint64_t v34 = 0;
  uint64_t v18 = *a2;
  OM_uint32 v19 = decode_NegotiationToken(a4[1], *a4, (uint64_t)&v35, (uint64_t)&v34);
  if (!v19)
  {
    if (v35 != 2)
    {
      *a1 = 0;
      return 589824;
    }
    if (*((void *)&v35 + 1)) {
      int v20 = **((_DWORD **)&v35 + 1);
    }
    else {
      int v20 = 1;
    }
    int v38 = 0;
    pthread_mutex_lock((pthread_mutex_t *)(v18 + 72));
    output_token.size_t length = 0;
    output_token.gss_buffer_desc_struct value = 0;
    int v31 = 0;
    if (*((void *)&v36 + 1))
    {
      OM_uint32 v23 = *(void **)(*((void *)&v36 + 1) + 8);
      input_token.size_t length = **((void **)&v36 + 1);
      input_token.gss_buffer_desc_struct value = v23;
      if (*(void *)(v18 + 56)) {
        gss_release_name(minor_status, (gss_name_t *)(v18 + 56));
      }
      uint64_t v24 = gss_accept_sec_context(a1, (gss_ctx_id_t *)(v18 + 40), a3, &input_token, a5, (gss_name_t *)(v18 + 56), (gss_OID *)(v18 + 32), &output_token, (OM_uint32 *)(v18 + 48), (OM_uint32 *)(v18 + 52), a11);
      uint64_t v21 = v24;
      if (v24 >= 2) {
        p_gss_buffer_desc_struct output_token = 0;
      }
      else {
        p_gss_buffer_desc_struct output_token = &output_token;
      }
      if (v24 > 1)
      {
        free_NegotiationToken((uint64_t)&v35);
        gss_mg_collect_error(*(const gss_OID_desc **)(v18 + 32), v21, *a1);
        send_reject(&v38, a8);
LABEL_44:
        pthread_mutex_unlock((pthread_mutex_t *)(v18 + 72));
        return v21;
      }
      if (v24)
      {
        uint64_t v27 = 1;
        goto LABEL_23;
      }
      *(_WORD *)(v18 + 64) |= 1u;
      p_gss_buffer_desc_struct input_token = &input_token;
    }
    else
    {
      p_gss_buffer_desc_struct input_token = 0;
      p_gss_buffer_desc_struct output_token = 0;
      input_token.size_t length = 0;
      input_token.gss_buffer_desc_struct value = 0;
    }
    uint64_t v27 = acceptor_complete(a1, v18, &v31, (uint64_t)p_input_token, p_output_token, (size_t *)v37, a8);
LABEL_23:
    if (p_output_token)
    {
      int v28 = v31;
      if (p_output_token->length)
      {
LABEL_29:
        if (v28) {
          size_t v29 = (gss_buffer_desc_struct *)v18;
        }
        else {
          size_t v29 = 0;
        }
        uint64_t v21 = send_accept(a1, v18, p_output_token, 0, v29, a8);
        if (v21)
        {
LABEL_34:
          if (p_output_token) {
            gss_release_buffer(minor_status, p_output_token);
          }
          free_NegotiationToken((uint64_t)&v35);
          if (!v21)
          {
            _gss_spnego_fixup_ntlm(v18);
            if (a6)
            {
              if (*(void *)(v18 + 56))
              {
                uint64_t v30 = malloc_type_calloc(1uLL, 0x28uLL, 0x10A004092E30F56uLL);
                if (v30)
                {
                  v30[4] = *(void *)(v18 + 56);
                  *(void *)(v18 + 56) = 0;
                  *a6 = v30;
                }
              }
            }
          }
          if (a7) {
            *a7 = *(void *)(v18 + 32);
          }
          if (a9) {
            *a9 = *(_DWORD *)(v18 + 48);
          }
          if (a10) {
            *a10 = *(_DWORD *)(v18 + 52);
          }
          if (v21 > 1)
          {
            _gss_spnego_internal_delete_sec_context(minor_status, a2, 0);
            return v21;
          }
          goto LABEL_44;
        }
LABEL_33:
        uint64_t v21 = v27;
        goto LABEL_34;
      }
    }
    else
    {
      int v28 = v31;
    }
    if (!(*(unsigned __int16 *)(v18 + 64) & (v20 == 1) | (v20 != 0) & (*(unsigned __int8 *)(v18 + 49) >> 4)) && !v28) {
      goto LABEL_33;
    }
    goto LABEL_29;
  }
  *a1 = v19;
  return 589824;
}

uint64_t select_mech(OM_uint32 *a1, uint64_t a2, int a3, const gss_OID_desc **a4, int **a5)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v22 = 0;
  *(void *)&a.size_t length = 0;
  OM_uint32 minor_status = 0;
  if (der_put_oid()) {
    return 589824;
  }
  a.size_t length = v22;
  a.elements = &v23[-v22 + 64];
  if (gss_oid_equal(&a, &__gss_spnego_mechanism_oid_desc)) {
    return 0x10000;
  }
  *a1 = 0;
  uint64_t v11 = gss_oid_equal(&a, (gss_const_OID)&_gss_spnego_mskrb_mechanism_oid_desc)
      ? (const gss_OID_desc *)&_gss_spnego_krb5_mechanism_oid_desc
      : &a;
  uint64_t v12 = _gss_mg_support_mechanism(v11);
  *a4 = (const gss_OID_desc *)v12;
  if (!v12) {
    return 0x10000;
  }
  if (a5)
  {
    gss_buffer_desc_struct v13 = &_gss_spnego_mskrb_mechanism_oid_desc;
    if (!gss_oid_equal(&a, (gss_const_OID)&_gss_spnego_mskrb_mechanism_oid_desc)) {
      gss_buffer_desc_struct v13 = (int *)*a4;
    }
    *a5 = v13;
  }
  if (!a3) {
    return 0;
  }
  gss_name_t output_name = 0;
  int v14 = MEMORY[0x2166971E0]();
  int v15 = 0;
  if (!v14) {
    int v15 = getenv("GSSAPI_SPNEGO_NAME");
  }
  if (v15) {
    uint64_t v16 = v15;
  }
  else {
    uint64_t v16 = "host@";
  }
  v18.size_t length = strlen(v16);
  v18.gss_buffer_desc_struct value = v16;
  uint64_t v17 = gss_import_name(a1, &v18, &__gss_c_nt_hostbased_service_oid_desc, &output_name);
  if (v17) {
    return v17;
  }
  uint64_t v9 = acceptor_approved(0, (uint64_t)output_name, 0, *a4);
  gss_release_name(&minor_status, &output_name);
  return v9;
}

uint64_t acceptor_complete(OM_uint32 *a1, uint64_t a2, int *a3, uint64_t a4, void *a5, size_t *a6, uint64_t a7)
{
  char v14 = _gss_spnego_require_mechlist_mic(a2);
  int v15 = *(unsigned __int16 *)(a2 + 64);
  int v16 = v15 | 4;
  unsigned int v17 = v15 & 0xFFFFFFFB | (4 * (v14 & 1));
  if (a6) {
    unsigned int v17 = v16;
  }
  *(_WORD *)(a2 + 64) = v17;
  if ((~v17 & 5) != 0)
  {
    uint64_t v18 = 0;
    *a3 = 0;
    return v18;
  }
  if (a4)
  {
    if (!a5 || *a5)
    {
      uint64_t v18 = 0;
      *a3 = 1;
      return v18;
    }
    int v20 = 1;
  }
  else
  {
    int v20 = 0;
  }
  *a3 = v20;
  if (!a6 && (*(_WORD *)(a2 + 64) & 0x80) != 0) {
    return 0;
  }
  uint64_t v18 = _gss_spnego_verify_mechtypes_mic(a1, (gss_buffer_t)a2, a6);
  if (v18 && *a3) {
    send_reject(a1, a7);
  }
  return v18;
}

_DWORD *send_reject(_DWORD *a1, uint64_t a2)
{
  long long v10 = 0u;
  long long v11 = 0u;
  v9[0] = 2;
  uint64_t result = malloc_type_calloc(1uLL, 4uLL, 0x100004052888210uLL);
  v9[1] = result;
  if (result)
  {
    uint64_t v8 = 0;
    *uint64_t result = 2;
    long long v10 = 0uLL;
    *(void *)&long long v11 = 0;
    size_t v5 = length_NegotiationToken((uint64_t)v9);
    *(void *)a2 = v5;
    uint64_t v6 = malloc_type_malloc(v5, 0x4A659835uLL);
    *(void *)(a2 + 8) = v6;
    if (v6)
    {
      int v7 = encode_NegotiationToken((uint64_t)v6 + *(void *)a2 - 1, *(void *)a2, (uint64_t)v9, (uint64_t)&v8);
      *a1 = v7;
      if (v7)
      {
        free(*(void **)(a2 + 8));
        *(void *)(a2 + 8) = 0;
      }
    }
    else
    {
      *a1 = 12;
    }
    return (_DWORD *)free_NegotiationToken((uint64_t)v9);
  }
  else
  {
    *a1 = 12;
  }
  return result;
}

uint64_t send_accept(OM_uint32 *a1, uint64_t a2, void *a3, int a4, gss_buffer_desc_struct *a5, uint64_t a6)
{
  uint64_t v24 = 2;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v12 = malloc_type_calloc(1uLL, 4uLL, 0x100004052888210uLL);
  char v25 = v12;
  if (v12)
  {
    message_token.size_t length = 0;
    message_token.gss_buffer_desc_struct value = 0;
    uint64_t v22 = 0;
    __int16 v13 = *(_WORD *)(a2 + 64);
    if (v13)
    {
      BOOL v14 = a3 && a5 && *a3;
    }
    else
    {
      BOOL v14 = 1;
      if (a4 && (v13 & 4) != 0)
      {
        *uint64_t v12 = 3;
LABEL_13:
        if (*(void *)(a2 + 16))
        {
          *(void *)&long long v26 = malloc_type_calloc(1uLL, 0x10uLL, 0x1010040466105CCuLL);
          if (!(void)v26 || der_get_oid()) {
            goto LABEL_38;
          }
          if (!a3) {
            goto LABEL_22;
          }
LABEL_19:
          if (*a3)
          {
            int v16 = malloc_type_calloc(1uLL, 0x10uLL, 0x108004057E67DB5uLL);
            *((void *)&v26 + 1) = v16;
            if (!v16) {
              goto LABEL_38;
            }
            *int v16 = *a3;
            *(void *)(*((void *)&v26 + 1) + 8) = a3[1];
            *a3 = 0;
            a3[1] = 0;
LABEL_23:
            if (gss_oid_equal(*(gss_const_OID *)(a2 + 32), &__gss_ntlm_mechanism_oid_desc))
            {
              if (!a5 || (*(_WORD *)(a2 + 64) & 0x80) != 0) {
                goto LABEL_32;
              }
            }
            else if (!a5)
            {
              goto LABEL_32;
            }
            uint64_t mic = gss_get_mic(a1, *(gss_ctx_id_t *)(a2 + 40), 0, a5, &message_token);
            if (mic != 0x100000)
            {
              uint64_t v15 = mic;
              if (mic) {
                goto LABEL_39;
              }
              uint64_t v18 = malloc_type_calloc(1uLL, 0x10uLL, 0x108004057E67DB5uLL);
              *(void *)&long long v27 = v18;
              if (!v18)
              {
                gss_release_buffer(a1, &message_token);
                goto LABEL_38;
              }
              void *v18 = message_token.length;
              *(void *)(v27 + 8) = message_token.value;
LABEL_33:
              size_t v19 = length_NegotiationToken((uint64_t)&v24);
              *(void *)a6 = v19;
              int v20 = malloc_type_malloc(v19, 0xFAF20801uLL);
              *(void *)(a6 + 8) = v20;
              if (v20)
              {
                if (encode_NegotiationToken((uint64_t)v20 + *(void *)a6 - 1, *(void *)a6, (uint64_t)&v24, (uint64_t)&v22))
                {
                  free(*(void **)(a6 + 8));
                  *(void *)(a6 + 8) = 0;
                  goto LABEL_38;
                }
                uint64_t v15 = *v25 != 0;
LABEL_39:
                free_NegotiationToken((uint64_t)&v24);
                return v15;
              }
LABEL_38:
              *a1 = 12;
              uint64_t v15 = 851968;
              goto LABEL_39;
            }
LABEL_32:
            *(void *)&long long v27 = 0;
            goto LABEL_33;
          }
LABEL_22:
          *((void *)&v26 + 1) = 0;
          goto LABEL_23;
        }
LABEL_18:
        *(void *)&long long v26 = 0;
        if (!a3) {
          goto LABEL_22;
        }
        goto LABEL_19;
      }
    }
    *uint64_t v12 = v14;
    if (!a4) {
      goto LABEL_18;
    }
    goto LABEL_13;
  }
  *a1 = 12;
  return 851968;
}

uint64_t acceptor_approved(int a1, uint64_t a2, gss_cred_id_t cred_handle, const gss_OID_desc *a4)
{
  OM_uint32 minor_status = 0;
  gss_OID_set mechanisms = 0;
  if (cred_handle)
  {
    LODWORD(output_cred_handle) = 0;
    uint64_t v5 = gss_inquire_cred(&minor_status, cred_handle, 0, 0, 0, &mechanisms);
    if (v5) {
      return v5;
    }
    OM_uint32 v7 = gss_test_oid_set_member(&minor_status, a4, mechanisms, (int *)&output_cred_handle);
    gss_release_oid_set(&minor_status, &mechanisms);
    uint64_t v6 = 851968;
    if (!v7 && output_cred_handle) {
      return 0;
    }
  }
  else
  {
    uint64_t v6 = a2;
    output_gss_cred_id_t cred_handle = 0;
    if (a2)
    {
      gss_create_empty_oid_set(&minor_status, &mechanisms);
      gss_add_oid_set_member(&minor_status, a4, &mechanisms);
      uint64_t v6 = gss_acquire_cred(&minor_status, (gss_name_t)v6, 0xFFFFFFFF, mechanisms, 2, &output_cred_handle, 0, 0);
      gss_release_oid_set(&minor_status, &mechanisms);
      if (!v6)
      {
        gss_release_cred(&minor_status, &output_cred_handle);
        return 0;
      }
    }
  }
  return v6;
}

uint64_t _gss_spnego_alloc_sec_context(_DWORD *a1, void *a2)
{
  int v4 = (char *)malloc_type_calloc(1uLL, 0x98uLL, 0x10A0040585C2CE9uLL);
  if (v4)
  {
    uint64_t v5 = v4;
    *((void *)v4 + 7) = 0;
    *(_OWORD *)int v4 = 0u;
    *((_OWORD *)v4 + 1) = 0u;
    *((_OWORD *)v4 + 2) = 0u;
    *((_WORD *)v4 + 32) &= 0xFFB0u;
    pthread_mutex_init((pthread_mutex_t *)(v4 + 72), 0);
    uint64_t result = 0;
    *a2 = v5;
  }
  else
  {
    *a1 = 12;
    return 851968;
  }
  return result;
}

uint64_t _gss_spnego_internal_delete_sec_context(OM_uint32 *a1, uint64_t *a2, void *a3)
{
  *a1 = 0;
  if (!a2) {
    return 0x80000;
  }
  if (a3)
  {
    *a3 = 0;
    a3[1] = 0;
  }
  uint64_t v4 = *a2;
  *a2 = 0;
  if (!v4) {
    return 0x80000;
  }
  uint64_t v5 = *(void **)(v4 + 8);
  if (v5) {
    free(v5);
  }
  OM_uint32 minor_status = 0;
  *(void *)(v4 + 24) = 0;
  *(void *)(v4 + 32) = 0;
  gss_release_name(&minor_status, (gss_name_t *)(v4 + 136));
  gss_release_name(&minor_status, (gss_name_t *)(v4 + 56));
  if (*(void *)(v4 + 40))
  {
    uint64_t v6 = gss_delete_sec_context(a1, (gss_ctx_id_t *)(v4 + 40), 0);
    *(void *)(v4 + 40) = 0;
  }
  else
  {
    uint64_t v6 = 0;
  }
  pthread_mutex_unlock((pthread_mutex_t *)(v4 + 72));
  pthread_mutex_destroy((pthread_mutex_t *)(v4 + 72));
  free((void *)v4);
  return v6;
}

uint64_t _gss_spnego_fixup_ntlm(uint64_t a1)
{
  uint64_t result = gss_oid_equal(*(gss_const_OID *)(a1 + 32), &__gss_ntlm_mechanism_oid_desc);
  if (result)
  {
    gss_buffer_set_t data_set = 0;
    OM_uint32 minor_status = 0;
    gss_inquire_sec_context_by_oid(&minor_status, *(gss_ctx_id_t *)(a1 + 40), &__gss_c_ntlm_reset_keys_oid_desc, &data_set);
    return gss_release_buffer_set(&minor_status, &data_set);
  }
  return result;
}

uint64_t _gss_spnego_require_mechlist_mic(uint64_t a1)
{
  gss_buffer_set_t data_set = 0;
  __int16 v1 = *(_WORD *)(a1 + 64);
  if ((v1 & 8) != 0) {
    return 1;
  }
  if ((v1 & 0x10) != 0) {
    return 0;
  }
  OM_uint32 minor_status = 0;
  if (!gss_inquire_sec_context_by_oid(&minor_status, *(gss_ctx_id_t *)(a1 + 40), &__gss_c_peer_has_updated_spnego_oid_desc, &data_set))gss_release_buffer_set(&minor_status, &data_set); {
  BOOL v3 = (*(_WORD *)(a1 + 64) & 2) == 0 || gss_oid_equal(*(gss_const_OID *)(a1 + 32), &__gss_ntlm_mechanism_oid_desc) == 0;
  }
  if (gss_oid_equal(*(gss_const_OID *)(a1 + 32), *(gss_const_OID *)(a1 + 16))
    || gss_oid_equal(*(gss_const_OID *)(a1 + 32), &_gss_spnego_krb5_mechanism_oid_desc)
    && gss_oid_equal(*(gss_const_OID *)(a1 + 16), (gss_const_OID)&_gss_spnego_mskrb_mechanism_oid_desc))
  {
    *(_WORD *)(a1 + 64) |= 0x80u;
  }
  return v3;
}

uint64_t _gss_spnego_indicate_mechtypelist(OM_uint32 *minor_status, uint64_t a2, unsigned int (*a3)(uint64_t, uint64_t, gss_cred_id_t, gss_OID_desc *), uint64_t a4, int a5, gss_cred_id_t cred_handle, uint64_t a7, uint64_t **a8)
{
  *(void *)int present = 0;
  gss_OID_set mechanisms = 0;
  *(_DWORD *)a7 = 0;
  *(void *)(a7 + 8) = 0;
  if (cred_handle) {
    uint64_t v16 = gss_inquire_cred(minor_status, cred_handle, 0, 0, 0, &mechanisms);
  }
  else {
    uint64_t v16 = gss_indicate_mechs(minor_status, &mechanisms);
  }
  uint64_t v17 = v16;
  if (v16) {
    return v17;
  }
  if (!mechanisms->count)
  {
    *OM_uint32 minor_status = 2;
    gss_release_oid_set(minor_status, &mechanisms);
    return 851968;
  }
  size_t v19 = 0;
  if (!gss_test_oid_set_member((OM_uint32 *)&present[1], &__gss_krb5_mechanism_oid_desc, mechanisms, present)
    && present[0])
  {
    if (a3(a4, a2, cred_handle, &__gss_krb5_mechanism_oid_desc))
    {
      size_t v19 = 0;
    }
    else
    {
      unsigned int v20 = add_mech_type(&__gss_krb5_mechanism_oid_desc, a5, (unsigned int *)a7);
      uint64_t v21 = (gss_OID_desc *)&_gss_spnego_mskrb_mechanism_oid_desc;
      if (!a5) {
        uint64_t v21 = &__gss_krb5_mechanism_oid_desc;
      }
      if (v20 >= 0x10000) {
        size_t v19 = 0;
      }
      else {
        size_t v19 = v21;
      }
      add_mech_type(&__gss_appl_lkdc_supported_oid_desc, 0, (unsigned int *)a7);
    }
  }
  gss_OID_set v22 = mechanisms;
  if (!mechanisms->count)
  {
    uint64_t v17 = 0;
    goto LABEL_31;
  }
  int v31 = a8;
  OM_uint32 v32 = (gss_OID_desc_struct *)v19;
  int v30 = a5;
  uint64_t v23 = 0;
  size_t v24 = 0;
  while (1)
  {
    int v25 = gss_oid_equal(&v22->elements[v23], &__gss_spnego_mechanism_oid_desc);
    gss_OID_set v22 = mechanisms;
    if (!v25)
    {
      int v26 = gss_oid_equal(&mechanisms->elements[v23], &__gss_krb5_mechanism_oid_desc);
      gss_OID_set v22 = mechanisms;
      if (!v26)
      {
        int v27 = gss_oid_equal(&mechanisms->elements[v23], &__gss_netlogon_mechanism_oid_desc);
        gss_OID_set v22 = mechanisms;
        if (!v27)
        {
          unsigned int v28 = a3(a4, a2, cred_handle, &mechanisms->elements[v23]);
          gss_OID_set v22 = mechanisms;
          if (!v28) {
            break;
          }
        }
      }
    }
LABEL_27:
    ++v24;
    ++v23;
    if (v24 >= v22->count)
    {
      uint64_t v17 = 0;
      goto LABEL_29;
    }
  }
  OM_uint32 v29 = add_mech_type(&mechanisms->elements[v23], v30, (unsigned int *)a7);
  if (!v29)
  {
    gss_OID_set v22 = mechanisms;
    if (!v32) {
      OM_uint32 v32 = &mechanisms->elements[v23];
    }
    goto LABEL_27;
  }
  *OM_uint32 minor_status = v29;
  uint64_t v17 = 851968;
LABEL_29:
  a8 = v31;
  size_t v19 = v32;
LABEL_31:
  if (*(_DWORD *)a7)
  {
    if (a8) {
      *a8 = _gss_mg_support_mechanism(v19);
    }
    gss_release_oid_set(minor_status, &mechanisms);
  }
  else
  {
    gss_release_oid_set(minor_status, &mechanisms);
    *OM_uint32 minor_status = 0;
    return 0x10000;
  }
  return v17;
}

uint64_t add_mech_type(gss_const_OID a, int a2, unsigned int *a3)
{
  v6[0] = 0;
  v6[1] = 0;
  if (!a2
    || !gss_oid_equal(a, &_gss_spnego_krb5_mechanism_oid_desc)
    || (okrb5_ccache id = der_get_oid(), !oid) && (okrb5_ccache id = add_MechTypeList(a3), free_MechType((uint64_t)v6), !oid))
  {
    okrb5_ccache id = der_get_oid();
    if (!oid)
    {
      okrb5_ccache id = add_MechTypeList(a3);
      free_MechType((uint64_t)v6);
    }
  }
  return oid;
}

uint64_t _gss_spnego_verify_mechtypes_mic(OM_uint32 *minor_status, gss_buffer_t message_buffer, size_t *a3)
{
  if ((message_buffer[4].length & 0x40) != 0)
  {
    *OM_uint32 minor_status = 0;
    return 2;
  }
  else
  {
    uint64_t v5 = (void *)a3[1];
    v14.size_t length = *a3;
    v14.gss_buffer_desc_struct value = v5;
    OM_uint32 v6 = gss_verify_mic(minor_status, (gss_ctx_id_t)message_buffer[2].value, message_buffer, &v14, 0);
    if (!v6)
    {
LABEL_5:
      uint64_t result = 0;
      LOWORD(message_buffer[4].length) |= 0x40u;
      *OM_uint32 minor_status = 0;
      return result;
    }
    if (v6 == 0x100000)
    {
      _gss_mg_log(10, "mech doesn't support MIC, allowing anyway", v7, v8, v9, v10, v11, v12, v14.length);
      goto LABEL_5;
    }
    return gss_mg_set_error_string((size_t)&__gss_spnego_mechanism_oid_desc, 589824, *minor_status, "SPNEGO peer sent invalid mechListMIC", v9, v10, v11, v12, v14.length);
  }
}

uint64_t _gss_spnego_process_context_token(OM_uint32 *a1, uint64_t a2, gss_buffer_desc_struct *a3)
{
  if (!a2) {
    return 0x80000;
  }
  uint64_t v10 = a2;
  OM_uint32 v6 = (pthread_mutex_t *)(a2 + 72);
  pthread_mutex_lock((pthread_mutex_t *)(a2 + 72));
  uint64_t v7 = gss_process_context_token(a1, *(gss_ctx_id_t *)(a2 + 40), a3);
  if (v7)
  {
    uint64_t v8 = v7;
    pthread_mutex_unlock(v6);
  }
  else
  {
    *(void *)(a2 + 40) = 0;
    return _gss_spnego_internal_delete_sec_context(a1, &v10, 0);
  }
  return v8;
}

uint64_t _gss_spnego_delete_sec_context(OM_uint32 *a1, uint64_t *a2, void *a3)
{
  if (!a2 || !*a2) {
    return 0x80000;
  }
  pthread_mutex_lock((pthread_mutex_t *)(*a2 + 72));

  return _gss_spnego_internal_delete_sec_context(a1, a2, a3);
}

uint64_t _gss_spnego_context_time(OM_uint32 *a1, uint64_t a2, OM_uint32 *a3)
{
  *a1 = 0;
  if (a2 && (BOOL v3 = *(gss_ctx_id_t_desc_struct **)(a2 + 40)) != 0) {
    return gss_context_time(a1, v3, a3);
  }
  else {
    return 0x80000;
  }
}

uint64_t _gss_spnego_get_mic(OM_uint32 *a1, uint64_t a2, gss_qop_t a3, gss_buffer_desc_struct *a4, gss_buffer_desc_struct *a5)
{
  *a1 = 0;
  if (a2 && (uint64_t v5 = *(gss_ctx_id_t_desc_struct **)(a2 + 40)) != 0) {
    return gss_get_mic(a1, v5, a3, a4, a5);
  }
  else {
    return 0x80000;
  }
}

uint64_t _gss_spnego_verify_mic(OM_uint32 *a1, uint64_t a2, gss_buffer_desc_struct *a3, gss_buffer_desc_struct *a4, gss_qop_t *a5)
{
  *a1 = 0;
  if (a2 && (uint64_t v5 = *(gss_ctx_id_t_desc_struct **)(a2 + 40)) != 0) {
    return gss_verify_mic(a1, v5, a3, a4, a5);
  }
  else {
    return 0x80000;
  }
}

uint64_t _gss_spnego_wrap(OM_uint32 *a1, uint64_t a2, int a3, gss_qop_t a4, gss_buffer_desc_struct *a5, int *a6, gss_buffer_desc_struct *a7)
{
  *a1 = 0;
  if (a2 && (uint64_t v7 = *(gss_ctx_id_t_desc_struct **)(a2 + 40)) != 0) {
    return gss_wrap(a1, v7, a3, a4, a5, a6, a7);
  }
  else {
    return 0x80000;
  }
}

uint64_t _gss_spnego_unwrap(OM_uint32 *a1, uint64_t a2, gss_buffer_desc_struct *a3, gss_buffer_desc_struct *a4, int *a5, gss_qop_t *a6)
{
  *a1 = 0;
  if (a2 && (OM_uint32 v6 = *(gss_ctx_id_t_desc_struct **)(a2 + 40)) != 0) {
    return gss_unwrap(a1, v6, a3, a4, a5, a6);
  }
  else {
    return 0x80000;
  }
}

uint64_t _gss_spnego_compare_name(int a1, gss_const_OID a, gss_const_OID b, _DWORD *a4)
{
  *a4 = 0;
  if (gss_oid_equal(a, b))
  {
    size_t v7 = *(void *)&a[1].length;
    if (v7 == *(void *)&b[1].length && !memcmp(a[1].elements, b[1].elements, v7)) {
      *a4 = 1;
    }
  }
  return 0;
}

uint64_t _gss_spnego_display_name(OM_uint32 *a1, uint64_t a2, gss_buffer_desc_struct *a3, gss_OID *a4)
{
  *a1 = 0;
  if (a2 && (uint64_t v4 = *(gss_name_t_desc_struct **)(a2 + 32)) != 0) {
    return gss_display_name(a1, v4, a3, a4);
  }
  else {
    return 851968;
  }
}

uint64_t _gss_spnego_import_name(_DWORD *a1, uint64_t a2, const void **a3, size_t **a4)
{
  *a1 = 0;
  uint64_t v8 = (size_t *)malloc_type_calloc(1uLL, 0x28uLL, 0x10A004092E30F56uLL);
  if (v8)
  {
    uint64_t v9 = v8;
    if (_gss_copy_oid(a1, a3, (uint64_t)v8))
    {
      free(v9);
    }
    else
    {
      uint64_t result = _gss_copy_buffer(a1, a2, v9 + 2);
      if (!result)
      {
        v9[4] = 0;
        *a4 = v9;
        return result;
      }
      uint64_t v11 = v9;
      _gss_spnego_release_name(a1, (uint64_t *)&v11);
    }
  }
  else
  {
    *a1 = 12;
  }
  return 851968;
}

uint64_t _gss_spnego_release_name(_DWORD *a1, uint64_t *a2)
{
  *a1 = 0;
  uint64_t v2 = *a2;
  if (*a2)
  {
    OM_uint32 minor_status = 0;
    _gss_free_oid(&minor_status, v2);
    gss_release_buffer(&minor_status, (gss_buffer_t)(v2 + 16));
    if (*(void *)(v2 + 32)) {
      gss_release_name(&minor_status, (gss_name_t *)(v2 + 32));
    }
    free((void *)v2);
    *a2 = 0;
  }
  return 0;
}

uint64_t _gss_spnego_export_name(OM_uint32 *a1, uint64_t a2, gss_buffer_desc_struct *a3)
{
  *a1 = 0;
  if (a2 && (BOOL v3 = *(gss_name_t_desc_struct **)(a2 + 32)) != 0) {
    return gss_export_name(a1, v3, a3);
  }
  else {
    return 0x20000;
  }
}

uint64_t _gss_spnego_inquire_context(OM_uint32 *a1, uint64_t a2, gss_name_t *a3, void *a4, OM_uint32 *a5, gss_OID *a6, OM_uint32 *a7, int *a8, int *xopen)
{
  *a1 = 0;
  if (!a2) {
    return 0x80000;
  }
  uint64_t v9 = *(gss_ctx_id_t_desc_struct **)(a2 + 40);
  if (!v9) {
    return 0x80000;
  }
  OM_uint32 minor_status = 0;
  gss_name_t targ_name = 0;
  gss_name_t src_name = 0;
  uint64_t result = gss_inquire_context(a1, v9, &src_name, &targ_name, a5, a6, a7, a8, xopen);
  if (!result)
  {
    if (a3)
    {
      gss_buffer_desc_struct v14 = (gss_name_t_desc_struct *)malloc_type_calloc(1uLL, 0x28uLL, 0x10A004092E30F56uLL);
      if (!v14)
      {
LABEL_14:
        gss_release_name(&minor_status, &targ_name);
        gss_release_name(&minor_status, &src_name);
        *a1 = 12;
        return 851968;
      }
      *((void *)v14 + 4) = src_name;
      *a3 = v14;
      if (a4)
      {
LABEL_7:
        uint64_t v15 = malloc_type_calloc(1uLL, 0x28uLL, 0x10A004092E30F56uLL);
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t result = 0;
          v16[4] = targ_name;
          *a4 = v16;
          return result;
        }
        gss_release_name(a1, a3);
        goto LABEL_14;
      }
    }
    else
    {
      gss_release_name(&minor_status, &src_name);
      if (a4) {
        goto LABEL_7;
      }
    }
    gss_release_name(&minor_status, &targ_name);
    return 0;
  }
  return result;
}

uint64_t _gss_spnego_wrap_size_limit(OM_uint32 *a1, uint64_t a2, int a3, gss_qop_t a4, OM_uint32 a5, OM_uint32 *a6)
{
  *a1 = 0;
  if (a2 && (OM_uint32 v6 = *(gss_ctx_id_t_desc_struct **)(a2 + 40)) != 0) {
    return gss_wrap_size_limit(a1, v6, a3, a4, a5, a6);
  }
  else {
    return 0x80000;
  }
}

uint64_t _gss_spnego_export_sec_context(OM_uint32 *a1, uint64_t *a2, gss_buffer_desc_struct *a3)
{
  *a1 = 0;
  if (!a2) {
    return 0x80000;
  }
  uint64_t v3 = *a2;
  if (!*a2) {
    return 0x80000;
  }
  OM_uint32 v6 = (pthread_mutex_t *)(v3 + 72);
  pthread_mutex_lock((pthread_mutex_t *)(v3 + 72));
  uint64_t v8 = *(void *)(v3 + 40);
  size_t v7 = (gss_ctx_id_t *)(v3 + 40);
  if (v8) {
    uint64_t v9 = gss_export_sec_context(a1, v7, a3);
  }
  else {
    uint64_t v9 = 0x80000;
  }
  pthread_mutex_unlock(v6);
  return v9;
}

uint64_t _gss_spnego_import_sec_context(OM_uint32 *a1, gss_buffer_desc_struct *a2, uint64_t *a3)
{
  OM_uint32 v11 = 0;
  uint64_t v10 = 0;
  uint64_t v6 = _gss_spnego_alloc_sec_context(a1, &v10);
  if (!v6)
  {
    uint64_t v7 = v10;
    uint64_t v8 = (pthread_mutex_t *)(v10 + 72);
    pthread_mutex_lock((pthread_mutex_t *)(v10 + 72));
    uint64_t v6 = gss_import_sec_context(a1, a2, (gss_ctx_id_t *)(v7 + 40));
    if (v6)
    {
      _gss_spnego_internal_delete_sec_context(&v11, a3, 0);
    }
    else
    {
      *(_WORD *)(v7 + 64) |= 1u;
      pthread_mutex_unlock(v8);
      *a3 = v7;
    }
  }
  return v6;
}

uint64_t _gss_spnego_inquire_mechs_for_name(OM_uint32 *a1, int a2, gss_OID_set *oid_set)
{
  empty_gss_OID_set oid_set = gss_create_empty_oid_set(a1, oid_set);
  if (!empty_oid_set)
  {
    empty_gss_OID_set oid_set = gss_add_oid_set_member(a1, &__gss_spnego_mechanism_oid_desc, oid_set);
    if (empty_oid_set)
    {
      OM_uint32 minor_status = 0;
      gss_release_oid_set(&minor_status, oid_set);
    }
  }
  return empty_oid_set;
}

uint64_t _gss_spnego_canonicalize_name(OM_uint32 *a1, gss_name_t_desc_struct *a2, int a3, gss_name_t *dest_name)
{
  return gss_duplicate_name(a1, a2, dest_name);
}

uint64_t _gss_spnego_wrap_iov(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, _DWORD *a5, uint64_t a6, int a7)
{
  *a1 = 0;
  if (a2 && (uint64_t v7 = *(void *)(a2 + 40)) != 0) {
    return __ApplePrivate_gss_wrap_iov(a1, v7, a3, a4, a5, a6, a7);
  }
  else {
    return 0x80000;
  }
}

uint64_t _gss_spnego_unwrap_iov(_DWORD *a1, uint64_t a2, _DWORD *a3, _DWORD *a4, uint64_t a5, int a6)
{
  *a1 = 0;
  if (a2 && (uint64_t v6 = *(void *)(a2 + 40)) != 0) {
    return __ApplePrivate_gss_unwrap_iov(a1, v6, a3, a4, a5, a6);
  }
  else {
    return 0x80000;
  }
}

uint64_t _gss_spnego_wrap_iov_length(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, _DWORD *a5, uint64_t a6, int a7)
{
  *a1 = 0;
  if (a2 && (uint64_t v7 = *(void *)(a2 + 40)) != 0) {
    return __ApplePrivate_gss_wrap_iov_length(a1, v7, a3, a4, a5, a6, a7);
  }
  else {
    return 0x80000;
  }
}

uint64_t _gss_spnego_inquire_sec_context_by_oid(OM_uint32 *a1, uint64_t a2, gss_OID_desc_struct *a3, gss_buffer_set_t *a4)
{
  *a1 = 0;
  if (a2 && (uint64_t v4 = *(gss_ctx_id_t_desc_struct **)(a2 + 40)) != 0) {
    return gss_inquire_sec_context_by_oid(a1, v4, a3, a4);
  }
  else {
    return 0x80000;
  }
}

uint64_t _gss_spnego_set_sec_context_option(OM_uint32 *a1, uint64_t *a2, gss_OID_desc_struct *a3, gss_buffer_desc_struct *a4)
{
  *a1 = 0;
  if (a2 && (uint64_t v4 = *a2) != 0 && (v6 = *(void *)(v4 + 40), v5 = (gss_ctx_id_t *)(v4 + 40), v6)) {
    return gss_set_sec_context_option(a1, v5, a3, a4);
  }
  else {
    return 0x80000;
  }
}

uint64_t _gss_spnego_pseudo_random(OM_uint32 *a1, uint64_t a2, int a3, gss_buffer_desc_struct *a4, ssize_t a5, gss_buffer_desc_struct *a6)
{
  *a1 = 0;
  if (a2 && (uint64_t v6 = *(gss_ctx_id_t_desc_struct **)(a2 + 40)) != 0) {
    return gss_pseudo_random(a1, v6, a3, a4, a5, a6);
  }
  else {
    return 0x80000;
  }
}

void *__gss_spnego_initialize()
{
  return &spnego_mech;
}

uint64_t _gss_spnego_init_sec_context(_DWORD *a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, unsigned int a6, unsigned int a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, uint64_t a13)
{
  uint64_t v18 = *a3;
  if (!*a3)
  {
    uint64_t v19 = _gss_spnego_alloc_sec_context(a1, a3);
    if (WORD1(v19)) {
      return v19;
    }
    uint64_t v18 = *a3;
    *(void *)(*a3 + 144) = spnego_initial;
  }
  pthread_mutex_lock((pthread_mutex_t *)(v18 + 72));
  unsigned int v20 = *(uint64_t (**)(_DWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char))(v18 + 144);
  while (1)
  {
    uint64_t v21 = ((uint64_t (*)(_DWORD *, uint64_t, uint64_t, uint64_t, uint64_t, void, void, uint64_t, uint64_t, void *, uint64_t, uint64_t))v20)(a1, a2, v18, a4, a5, a6, a7, a8, a9, a11, a12, a13);
    uint64_t v19 = v21;
    if (v21) {
      break;
    }
    unsigned int v20 = *(uint64_t (**)(_DWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char))(v18 + 144);
    if (v20 == step_completed_0 || *a11) {
      goto LABEL_10;
    }
  }
  if (v21 >= 0x10000)
  {
    OM_uint32 v26 = 0;
    _gss_spnego_internal_delete_sec_context(&v26, a3, 0);
    return v19;
  }
LABEL_10:
  pthread_mutex_unlock((pthread_mutex_t *)(v18 + 72));
  if (a10) {
    *a10 = *(void *)(v18 + 32);
  }
  return v19;
}

uint64_t spnego_initial(_DWORD *a1, gss_cred_id_t_desc_struct *a2, uint64_t a3, gss_const_OID input_name_type, int a5, int a6, int a7, uint64_t a8, uint64_t a9, gss_buffer_t output_token, _DWORD *a11, _DWORD *a12)
{
  uint64_t v45 = 0;
  *a1 = 0;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  if (!input_name_type) {
    return 0x20000;
  }
  OM_uint32 minor_status = 0;
  input_token.size_t length = 0;
  input_token.gss_buffer_desc_struct value = 0;
  *(_WORD *)(a3 + 64) |= 2u;
  uint64_t v18 = gss_import_name(&minor_status, (gss_buffer_t)&input_name_type[1], input_name_type, (gss_name_t *)(a3 + 136));
  if (v18 >= 0x10000) {
    goto LABEL_10;
  }
  LODWORD(v48) = 1;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  gss_buffer_desc_struct v41 = (gss_buffer_desc_struct)0;
  long long v42 = 0u;
  uint64_t v43 = 0;
  *((void *)&v38 + 1) = *(void *)(a3 + 136);
  LODWORD(v38) = a6;
  LODWORD(v39) = a7;
  *((void *)&v39 + 1) = a8;
  uint64_t v18 = _gss_spnego_indicate_mechtypelist(&minor_status, *((uint64_t *)&v38 + 1), (unsigned int (*)(uint64_t, uint64_t, gss_cred_id_t, gss_OID_desc *))initiator_approved, (uint64_t)&v38, 0, a2, (uint64_t)&v48 + 8, (uint64_t **)(a3 + 16));
  if (v18 >= 0x10000)
  {
LABEL_10:
    uint64_t v24 = v18;
    *a1 = minor_status;
  }
  else
  {
    *((void *)&v49 + 1) = 0;
    uint64_t v19 = *((void *)&v42 + 1);
    if (*((void *)&v42 + 1))
    {
      gss_buffer_desc_struct buffer = v41;
      *(_DWORD *)(a3 + 48) = v42;
      *(void *)(a3 + 32) = *((void *)&v40 + 1);
      *(void *)(a3 + 40) = v19;
      *(_WORD *)(a3 + 64) = ((v43 & 1) << 8) | *(_WORD *)(a3 + 64) & 0xFEFF;
      size_t length = buffer.length;
      if (buffer.length)
      {
        uint64_t v21 = malloc_type_calloc(1uLL, 0x10uLL, 0x108004057E67DB5uLL);
        *(void *)&long long v50 = v21;
        if (!v21
          || (void *v21 = length,
              gss_OID_set v22 = malloc_type_malloc(length, 0x138100C3uLL),
              *(void *)(v50 + 8) = v22,
              (uint64_t v23 = *(void **)(v50 + 8)) == 0)
          && buffer.length)
        {
          free_NegotiationToken((uint64_t)&v48);
          gss_release_buffer(&minor_status, &buffer);
          *a1 = 12;
          return 851968;
        }
        memcpy(v23, buffer.value, buffer.length);
        gss_release_buffer(&minor_status, &buffer);
      }
      else
      {
        *(void *)&long long v50 = 0;
      }
      *((void *)&v50 + 1) = 0;
      v37[1] = v49;
      v37[0] = DWORD2(v48);
      size_t v29 = length_MechTypeList((uint64_t)v37);
      *(void *)a3 = v29;
      int v30 = malloc_type_malloc(v29, 0x7E4F3EFEuLL);
      *(void *)(a3 + 8) = v30;
      if (!v30)
      {
        int v32 = 12;
        goto LABEL_19;
      }
      int v31 = encode_MechTypeList((uint64_t)v30 + *(void *)a3 - 1, *(void *)a3, (uint64_t)v37, (uint64_t)&v45);
      if (v31)
      {
        int v32 = v31;
        free(*(void **)(a3 + 8));
        *(void *)(a3 + 8) = 0;
LABEL_19:
        *a1 = v32;
LABEL_20:
        free_NegotiationToken((uint64_t)&v48);
        return 851968;
      }
      uint64_t v34 = length_NegotiationToken((uint64_t)&v48);
      input_token.size_t length = v34;
      long long v35 = malloc_type_malloc(v34, 0x23F2496EuLL);
      input_token.gss_buffer_desc_struct value = v35;
      if (!v35) {
        goto LABEL_20;
      }
      long long v36 = v35;
      if (encode_NegotiationToken((uint64_t)v35 + v34 - 1, v34, (uint64_t)&v48, (uint64_t)&v45))
      {
        free(v36);
        goto LABEL_20;
      }
      free_NegotiationToken((uint64_t)&v48);
      if (v34 != v45) {
        abort();
      }
      uint64_t v24 = gss_encapsulate_token(&input_token, &__gss_spnego_mechanism_oid_desc, output_token);
      free(input_token.value);
      if (!v24)
      {
        if (a11) {
          *a11 = *(_DWORD *)(a3 + 48);
        }
        if (a12) {
          *a12 = *(_DWORD *)(a3 + 52);
        }
        *(void *)(a3 + 144) = spnego_reply;
        return 1;
      }
    }
    else
    {
      free_NegotiationToken((uint64_t)&v48);
      *a1 = 0;
      return gss_mg_set_error_string(0, 0x80000, 0, "SPNEGO could not find a prefered mechanism", v25, v26, v27, v28, v37[0]);
    }
  }
  return v24;
}

uint64_t step_completed_0(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  *a1 = 22;
  return gss_mg_set_error_string((size_t)&__gss_spnego_mechanism_oid_desc, 327680, 22, "SPNEGO called got ISC call one too many", a5, a6, a7, a8, a9);
}

uint64_t initiator_approved(uint64_t a1, int a2, gss_cred_id_t initiator_cred_handle, gss_OID input_mech_type)
{
  OM_uint32 minor_status = 0;
  gss_ctx_id_t context_handle = 0;
  buffer.size_t length = 0;
  buffer.gss_buffer_desc_struct value = 0;
  gss_OID actual_mech_type = 0;
  OM_uint32 ret_flags = 0;
  OM_uint32 inited = gss_init_sec_context(&minor_status, initiator_cred_handle, &context_handle, *(gss_name_t *)(a1 + 8), input_mech_type, *(_DWORD *)a1, *(_DWORD *)(a1 + 16), *(gss_channel_bindings_t *)(a1 + 24), 0, &actual_mech_type, &buffer, &ret_flags, 0);
  if (inited >= 0x10000)
  {
    uint64_t v7 = 0x10000;
    gss_mg_collect_error(input_mech_type, 0x10000, minor_status);
  }
  else
  {
    if (*(void *)(a1 + 32))
    {
      gss_release_buffer(&minor_status, &buffer);
      gss_delete_sec_context(&minor_status, &context_handle, 0);
    }
    else
    {
      gss_OID v8 = actual_mech_type;
      *(void *)(a1 + 32) = input_mech_type;
      *(void *)(a1 + 40) = v8;
      *(gss_buffer_desc_struct *)(a1 + 48) = buffer;
      *(_DWORD *)(a1 + 64) = ret_flags;
      *(void *)(a1 + 72) = context_handle;
      if (!inited)
      {
        uint64_t v7 = 0;
        *(_DWORD *)(a1 + 80) = 1;
        return v7;
      }
    }
    return 0;
  }
  return v7;
}

uint64_t spnego_reply(OM_uint32 *a1, gss_cred_id_t_desc_struct *a2, uint64_t a3, uint64_t a4, uint64_t a5, OM_uint32 a6, OM_uint32 a7, gss_channel_bindings_struct *a8, uint64_t *a9, void *a10, _DWORD *a11, _DWORD *a12)
{
  OM_uint32 minor_status = 0;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v42 = 0u;
  *a1 = 0;
  *a10 = 0;
  a10[1] = 0;
  buffer.size_t length = 0;
  buffer.gss_buffer_desc_struct value = 0;
  uint64_t v22 = decode_NegotiationToken(a9[1], *a9, (uint64_t)&v42, 0);
  if (v22) {
    return v22;
  }
  if (v42 != 2)
  {
    free_NegotiationToken((uint64_t)&v42);
    *a1 = 0;
    return 0x10000;
  }
  if (!*((void *)&v42 + 1) || **((_DWORD **)&v42 + 1) == 2)
  {
LABEL_18:
    free_NegotiationToken((uint64_t)&v42);
    return 0x10000;
  }
  uint64_t v23 = *(void *)(a3 + 24);
  if (!v23 && (void)v43)
  {
    *(void *)&b.size_t length = 0;
    b.elements = 0;
    *(_WORD *)(a3 + 64) |= 0x200u;
    b.size_t length = der_length_oid();
    b.elements = malloc_type_malloc(b.length, 0xDCB0767AuLL);
    if (b.elements)
    {
      if (!der_put_oid() && !b.length)
      {
        if (gss_oid_equal(&__gss_spnego_mechanism_oid_desc, &b))
        {
          free(b.elements);
          free_NegotiationToken((uint64_t)&v42);
          *a1 = 22;
          uint64_t v24 = "SPNEGO acceptor picked SPNEGO??";
          return gss_mg_set_error_string((size_t)&__gss_spnego_mechanism_oid_desc, 0x10000, 22, v24, v18, v19, v20, v21, input_token);
        }
        int v36 = gss_oid_equal(*(gss_const_OID *)(a3 + 16), &b);
        long long v37 = *(const gss_OID_desc **)(a3 + 16);
        if (!v36)
        {
          if (!gss_oid_equal(v37, &__gss_krb5_mechanism_oid_desc)
            || !gss_oid_equal(&b, (gss_const_OID)&_gss_spnego_mskrb_mechanism_oid_desc))
          {
            gss_delete_sec_context(&minor_status, (gss_ctx_id_t *)(a3 + 40), 0);
            *(void *)(a3 + 40) = 0;
            long long v38 = _gss_mg_support_mechanism(&b);
            *(void *)(a3 + 24) = v38;
            if (!v38)
            {
              free(b.elements);
              free_NegotiationToken((uint64_t)&v42);
              *a1 = 22;
              uint64_t v24 = "SPNEGO acceptor send supportedMech we don't support";
              return gss_mg_set_error_string((size_t)&__gss_spnego_mechanism_oid_desc, 0x10000, 22, v24, v18, v19, v20, v21, input_token);
            }
            goto LABEL_71;
          }
          long long v37 = *(const gss_OID_desc **)(a3 + 16);
        }
        *(void *)(a3 + 24) = v37;
LABEL_71:
        free(b.elements);
        goto LABEL_14;
      }
      free(b.elements);
    }
    goto LABEL_18;
  }
  if (!v23)
  {
    free_NegotiationToken((uint64_t)&v42);
    *a1 = 22;
    uint64_t v24 = "SPNEGO acceptor didn't send supportedMech";
    return gss_mg_set_error_string((size_t)&__gss_spnego_mechanism_oid_desc, 0x10000, 22, v24, v18, v19, v20, v21, input_token);
  }
LABEL_14:
  if (*((void *)&v43 + 1))
  {
    if (!**((void **)&v43 + 1) && *(void *)(a3 + 40)) {
      goto LABEL_32;
    }
    *(void *)&b.size_t length = **((void **)&v43 + 1);
    b.elements = 0;
    b.elements = *(void **)(*((void *)&v43 + 1) + 8);
LABEL_25:
    uint64_t inited = gss_init_sec_context(&minor_status, a2, (gss_ctx_id_t *)(a3 + 40), *(gss_name_t *)(a3 + 136), *(gss_OID *)(a3 + 24), a6, a7, a8, (gss_buffer_t)&b, (gss_OID *)(a3 + 32), &buffer, (OM_uint32 *)(a3 + 48), (OM_uint32 *)(a3 + 52));
    uint64_t v22 = inited;
    if (WORD1(inited))
    {
      free_NegotiationToken((uint64_t)&v42);
      gss_mg_collect_error(*(const gss_OID_desc **)(a3 + 24), v22, minor_status);
      *a1 = minor_status;
      return v22;
    }
    if (!inited) {
      *(_WORD *)(a3 + 64) |= 1u;
    }
    uint64_t v27 = (int *)*((void *)&v42 + 1);
    goto LABEL_29;
  }
  if (!*(void *)(a3 + 40))
  {
    *(void *)&b.size_t length = 0;
    b.elements = 0;
    goto LABEL_25;
  }
LABEL_32:
  uint64_t v27 = (int *)*((void *)&v42 + 1);
  int v28 = **((_DWORD **)&v42 + 1);
  if (**((_DWORD **)&v42 + 1))
  {
    uint64_t v22 = 0;
    goto LABEL_34;
  }
  __int16 v33 = *(_WORD *)(a3 + 64);
  if ((v33 & 0x100) != 0)
  {
    v33 |= 1u;
    *(_WORD *)(a3 + 64) = v33;
  }
  if ((v33 & 1) == 0)
  {
    *a1 = 22;
    uint64_t v24 = "SPNEGO acceptor send acceptor compete, but we are not complete yet";
    return gss_mg_set_error_string((size_t)&__gss_spnego_mechanism_oid_desc, 0x10000, 22, v24, v18, v19, v20, v21, input_token);
  }
  uint64_t v22 = 0;
LABEL_29:
  int v28 = *v27;
LABEL_34:
  __int16 v29 = *(_WORD *)(a3 + 64);
  if (v28 == 3)
  {
    v29 |= 8u;
    *(_WORD *)(a3 + 64) = v29;
  }
  if ((v29 & 0x41) != 1) {
    goto LABEL_41;
  }
  char v30 = _gss_spnego_require_mechlist_mic(a3);
  __int16 v31 = *(_WORD *)(a3 + 64);
  LOBYTE(v29) = (4 * (v30 & 1)) | v31 & 0xFB;
  *(_WORD *)(a3 + 64) = (4 * (v30 & 1)) | v31 & 0xFFFB;
  if ((void)v44)
  {
    LOBYTE(v29) = v31 | 4;
    *(_WORD *)(a3 + 64) = v31 | 4;
    if ((v31 & 0x80) != 0)
    {
      if (*((void *)&v43 + 1))
      {
        int v32 = der_heim_octet_string_cmp();
        __int16 v29 = *(_WORD *)(a3 + 64);
        if (!v32)
        {
LABEL_41:
          v29 &= ~4u;
          *(_WORD *)(a3 + 64) = v29;
        }
      }
    }
  }
  if ((v29 & 4) != 0 && (void)v44)
  {
    uint64_t v22 = _gss_spnego_verify_mechtypes_mic(a1, (gss_buffer_t)a3, (size_t *)v44);
    if (v22)
    {
      free_NegotiationToken((uint64_t)&v42);
      return v22;
    }
    __int16 v29 = *(_WORD *)(a3 + 64);
  }
  uint64_t v34 = (_DWORD *)*((void *)&v42 + 1);
  if (v29)
  {
    if (((v29 & 0x80) == 0 || **((_DWORD **)&v42 + 1)) && (v29 & 0x44) == 4)
    {
      *(void *)(a3 + 144) = wait_server_mic;
      uint64_t v22 = 1;
    }
    else
    {
      uint64_t v22 = 0;
      *(void *)(a3 + 144) = step_completed_0;
    }
  }
  if (*v34
    || *(uint64_t (**)(_DWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char))(a3 + 144) != step_completed_0
    || buffer.length)
  {
    unsigned int reply = make_reply(a1, (gss_buffer_t)a3, &buffer, (uint64_t)a10);
    if (reply) {
      uint64_t v22 = reply;
    }
    else {
      uint64_t v22 = v22;
    }
  }
  free_NegotiationToken((uint64_t)&v42);
  gss_release_buffer(&minor_status, &buffer);
  if (a11) {
    *a11 = *(_DWORD *)(a3 + 48);
  }
  if (a12) {
    *a12 = *(_DWORD *)(a3 + 52);
  }
  return v22;
}

uint64_t wait_server_mic(OM_uint32 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t *a9, uint64_t a10, _DWORD *a11, _DWORD *a12)
{
  long long v26 = 0u;
  memset(v25, 0, sizeof(v25));
  int v14 = decode_NegotiationToken(a9[1], *a9, (uint64_t)v25, 0);
  if (v14)
  {
    int v19 = v14;
    uint64_t v20 = "Failed to decode NegotiationToken";
    return gss_mg_set_error_string((size_t)&__gss_spnego_mechanism_oid_desc, 0x10000, v19, v20, v15, v16, v17, v18, v25[0]);
  }
  BOOL v21 = LODWORD(v25[0]) != 2 || *((void *)&v25[0] + 1) == 0;
  if (v21 || **((_DWORD **)&v25[0] + 1))
  {
    free_NegotiationToken((uint64_t)v25);
    *a1 = 22;
    uint64_t v20 = "NegToken not accept_completed";
LABEL_9:
    int v19 = 22;
    return gss_mg_set_error_string((size_t)&__gss_spnego_mechanism_oid_desc, 0x10000, v19, v20, v15, v16, v17, v18, v25[0]);
  }
  if ((void)v26)
  {
    uint64_t v22 = _gss_spnego_verify_mechtypes_mic(a1, (gss_buffer_t)a3, (size_t *)v26);
    free_NegotiationToken((uint64_t)v25);
    if (v22) {
      return v22;
    }
  }
  else
  {
    __int16 v24 = *(_WORD *)(a3 + 64);
    free_NegotiationToken((uint64_t)v25);
    if ((v24 & 0x80) == 0)
    {
      *a1 = 22;
      uint64_t v20 = "Waiting for MIC, but its missing in server request";
      goto LABEL_9;
    }
  }
  *(_WORD *)(a3 + 64) |= 0x40u;
  *(void *)(a3 + 144) = step_completed_0;
  if (a11) {
    *a11 = *(_DWORD *)(a3 + 48);
  }
  if (a12) {
    *a12 = *(_DWORD *)(a3 + 52);
  }
  uint64_t v22 = 0;
  *a1 = 0;
  return v22;
}

uint64_t make_reply(OM_uint32 *minor_status, gss_buffer_t message_buffer, void *a3, uint64_t a4)
{
  message_token.__int16 length = 0;
  message_token.gss_buffer_desc_struct value = 0;
  uint64_t v26 = 0;
  long long v30 = 0u;
  long long v28 = 2uLL;
  long long v29 = 0uLL;
  *(void *)a4 = 0;
  *(void *)(a4 + 8) = 0;
  __int16 length = message_buffer[4].length;
  BOOL v9 = (length & 1) == 0 || (length & 0x44) == 4;
  if (*a3)
  {
    OM_uint32 v11 = malloc_type_calloc(1uLL, 0x10uLL, 0x108004057E67DB5uLL);
    *((void *)&v29 + 1) = v11;
    if (!v11) {
      goto LABEL_30;
    }
    *OM_uint32 v11 = *a3;
    *(void *)(*((void *)&v29 + 1) + 8) = a3[1];
    *a3 = 0;
    a3[1] = 0;
    __int16 length = message_buffer[4].length;
  }
  if ((length & 0x21) == 1)
  {
    LOWORD(message_buffer[4].length) = length | 0x20;
    uint64_t mic = gss_get_mic(minor_status, (gss_ctx_id_t)message_buffer[2].value, 0, message_buffer, &message_token);
    if (mic == 0x100000)
    {
      *(void *)&long long v30 = 0;
      LOWORD(message_buffer[4].length) &= ~4u;
    }
    else
    {
      uint64_t v13 = mic;
      if (mic)
      {
        free_NegotiationToken((uint64_t)&v28);
        *OM_uint32 minor_status = 12;
        return gss_mg_set_error_string((size_t)&__gss_spnego_mechanism_oid_desc, v13, 12, "SPNEGO failed to sign MIC", v20, v21, v22, v23, v25);
      }
      int v14 = malloc_type_calloc(1uLL, 0x10uLL, 0x108004057E67DB5uLL);
      *(void *)&long long v30 = v14;
      if (!v14)
      {
        gss_release_buffer(minor_status, &message_token);
        goto LABEL_30;
      }
      *int v14 = message_token.length;
      *(void *)(v30 + 8) = message_token.value;
    }
  }
  else
  {
    *(void *)&long long v30 = 0;
  }
  if (gss_oid_equal((gss_const_OID)message_buffer[2].length, &__gss_ntlm_mechanism_oid_desc)) {
    goto LABEL_20;
  }
  uint64_t v15 = malloc_type_calloc(1uLL, 4uLL, 0x100004052888210uLL);
  *((void *)&v28 + 1) = v15;
  if (!v15)
  {
LABEL_30:
    free_NegotiationToken((uint64_t)&v28);
    *OM_uint32 minor_status = 12;
    return 851968;
  }
  _DWORD *v15 = v9;
LABEL_20:
  size_t v16 = length_NegotiationToken((uint64_t)&v28);
  *(void *)a4 = v16;
  uint64_t v17 = malloc_type_malloc(v16, 0x7168D0A3uLL);
  *(void *)(a4 + 8) = v17;
  if (!v17)
  {
    OM_uint32 v19 = 12;
    goto LABEL_24;
  }
  OM_uint32 v18 = encode_NegotiationToken((uint64_t)v17 + *(void *)a4 - 1, *(void *)a4, (uint64_t)&v28, (uint64_t)&v26);
  if (v18)
  {
    OM_uint32 v19 = v18;
    free(*(void **)(a4 + 8));
    *(void *)(a4 + 8) = 0;
LABEL_24:
    free_NegotiationToken((uint64_t)&v28);
    *OM_uint32 minor_status = v19;
    return 851968;
  }
  free_NegotiationToken((uint64_t)&v28);
  if (v9) {
    return 1;
  }
  _gss_spnego_fixup_ntlm((uint64_t)message_buffer);
  return 0;
}

uint64_t _gss_ntlm_allocate_ctx(int *a1, uint64_t a2, void *a3)
{
  *a3 = 0;
  if (__ApplePrivate_gss_mo_get(&__gss_ntlm_mechanism_oid_desc, &__gss_c_ntlm_v2_oid_desc, 0))
  {
    uint64_t v4 = malloc_type_calloc(1uLL, 0x2A0uLL, 0x10F204024BAB64EuLL);
    if (v4)
    {
      free(v4);
      uint64_t result = 851968;
      int v6 = 22;
    }
    else
    {
      uint64_t result = 851968;
      int v6 = 12;
    }
  }
  else
  {
    int v6 = 0;
    uint64_t result = 0x100000;
  }
  *a1 = v6;
  return result;
}

uint64_t _gss_ntlm_accept_sec_context(int *a1, uint64_t *a2, uint64_t a3, uint64_t *a4, uint64_t a5, void ***a6, gss_OID_desc **a7, void *a8, _DWORD *a9, _DWORD *a10, void *a11)
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  uint64_t v63 = 0;
  uint64_t v64 = 0;
  *a8 = 0;
  a8[1] = 0;
  *a1 = 0;
  uint64_t v11 = 851968;
  if (!a2 || !a4) {
    return v11;
  }
  if (a6) {
    *a6 = 0;
  }
  if (a7) {
    *a7 = 0;
  }
  if (a9) {
    *a9 = 0;
  }
  if (a10) {
    *a10 = 0;
  }
  if (a11) {
    *a11 = 0;
  }
  int v62 = 0;
  uint64_t v18 = *a2;
  if (!*a2) {
    return _gss_ntlm_allocate_ctx(a1, (uint64_t)a2, &v61);
  }
  size_t v59 = 0;
  uint64_t v60 = 0;
  uint64_t v57 = 0;
  int v58 = 0;
  uint64_t v55 = 0;
  uint64_t v56 = 0;
  uint64_t v53 = 0;
  uint64_t v54 = 0;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v65 = 0u;
  uint64_t v61 = v18;
  _gss_mg_log(1, "ntlm-asc-type3", a3, (uint64_t)a4, a5, (uint64_t)a6, (uint64_t)a7, (uint64_t)a8, v50);
  uint64_t v19 = a4[1];
  uint64_t v63 = *a4;
  uint64_t v64 = v19;
  int v20 = heim_ntlm_decode_type3();
  if (v20 || (int v20 = krb5_data_copy()) != 0)
  {
    int v26 = v20;
LABEL_17:
    _gss_ntlm_delete_sec_context((OM_uint32 *)a1, a2, 0);
    *a1 = v26;
    return 851968;
  }
  *a1 = 0;
  unint64_t v28 = *(void *)(v18 + 8);
  if (!v28)
  {
    uint64_t v11 = 851968;
LABEL_31:
    heim_ntlm_free_type3();
    long long v39 = (OM_uint32 *)&v62;
    goto LABEL_32;
  }
  uint64_t v29 = 0;
  unint64_t v30 = 0;
  uint64_t v11 = 851968;
  do
  {
    uint64_t v31 = *(void *)(*(void *)v18 + v29 + 8);
    if (v31)
    {
      uint64_t v11 = (*(uint64_t (**)(int *, uint64_t, uint64_t, long long *, uint64_t, char *, uint64_t *, size_t *, char ***, uint64_t *, uint64_t *))(*(void *)(*(void *)v18 + v29) + 32))(a1, v18, v31, &v65, a3, (char *)&v54 + 4, &v54, &v59, &v53, &v57, &v55);
      _gss_mg_log(10, "ntlm-asc-type3: tried %s -> %d/%d", v32, v33, v34, v35, v36, v37, **(void **)(*(void *)v18 + v29));
      unint64_t v28 = *(void *)(v18 + 8);
      if (!v11) {
        break;
      }
    }
    ++v30;
    v29 += 16;
  }
  while (v30 < v28);
  if (v30 >= v28) {
    goto LABEL_31;
  }
  if ((v54 & 2) != 0 && !*((void *)&v70 + 1))
  {
    _gss_mg_log(1, "ntlm-asc-type3 mic missing from reply", v31, v21, v22, v23, v24, v25, v51);
    int v38 = 80;
LABEL_37:
    *a1 = v38;
    return 851968;
  }
  _gss_ntlm_debug_key(10, (char)"session key");
  if (v59)
  {
    if (*((void *)&v70 + 1))
    {
      long long v40 = (void *)(*(void *)(v18 + 104) + *((void *)&v70 + 1));
      memset(&ctx, 0, sizeof(ctx));
      void *v40 = 0;
      v40[1] = 0;
      CCHmacInit(&ctx, 1u, v60, v59);
      CCHmacUpdate(&ctx, *(const void **)(v18 + 72), *(void *)(v18 + 64));
      CCHmacUpdate(&ctx, *(const void **)(v18 + 88), *(void *)(v18 + 80));
      CCHmacUpdate(&ctx, *(const void **)(v18 + 104), *(void *)(v18 + 96));
      CCHmacFinal(&ctx, v40);
      if (ct_memcmp())
      {
        _gss_ntlm_debug_hex(10, (char)"mic");
        _gss_ntlm_debug_hex(10, (char)"ntlm-asc-type3 mic invalid");
        free(v60);
        int v38 = -1561745650;
        goto LABEL_37;
      }
    }
  }
  if ((v54 & 0x80000000000) != 0) {
    *(_DWORD *)(v18 + 28) |= 0x40u;
  }
  uint64_t v41 = v56;
  *(void *)(v18 + 256) = v55;
  *(void *)(v18 + 264) = v41;
  if (!v53)
  {
    name = _gss_ntlm_create_name(a1, *((const char **)&v65 + 1), (const char *)v66, 0);
    *(void *)(v18 + 216) = name;
    if (name) {
      goto LABEL_43;
    }
    free(v60);
    heim_ntlm_free_type3();
    long long v39 = (OM_uint32 *)a1;
LABEL_32:
    _gss_ntlm_delete_sec_context(v39, a2, 0);
    return v11;
  }
  _gss_ntlm_release_name(&v62, (void ***)(v18 + 216));
  name = v53;
  *(void *)(v18 + 216) = v53;
LABEL_43:
  long long v49 = v58;
  if (v58)
  {
    if (v57 == 16)
    {
      *(_OWORD *)((char *)name + 20) = *(_OWORD *)v58;
      *((_DWORD *)name + 4) |= 4u;
    }
    free(v49);
    name = *(char ***)(v18 + 216);
  }
  _gss_mg_log(1, "ntlm-asc-type3: %s\\%s", v42, v43, v44, v45, v46, v47, (char)name[1]);
  if (a6) {
    _gss_ntlm_duplicate_name(&v62, *(void *)(v18 + 216), a6);
  }
  heim_ntlm_free_type3();
  int v26 = krb5_data_copy();
  free(v60);
  if (v26)
  {
    if (a6) {
      _gss_ntlm_release_name(&v62, a6);
    }
    goto LABEL_17;
  }
  _gss_ntlm_set_keys(v18);
  _gss_ntlm_reset_seq(v18);
  if (a7) {
    *a7 = &__gss_ntlm_mechanism_oid_desc;
  }
  if (a10) {
    *a10 = -1;
  }
  *(_DWORD *)(v18 + 40) |= 1u;
  uint64_t v11 = 0;
  if (a9) {
    *a9 = *(_DWORD *)(v18 + 28);
  }
  return v11;
}

uint64_t _gss_ntlm_have_cred(krb5_error_code *a1, const char **a2, void *a3)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  uint64_t v35 = 0;
  krb5_context v36 = 0;
  memset(uu, 0, sizeof(uu));
  krb5_error_code inited = krb5_init_context(&v36);
  if (inited)
  {
    *a1 = inited;
    return 851968;
  }
  CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFStringRef v10 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], *a2, 0x8000100u);
  if (!v10)
  {
    heim_release();
    return 851968;
  }
  CFStringRef v11 = v10;
  CFStringRef v12 = CFStringCreateWithCString(v9, a2[1], 0x8000100u);
  if (!v12)
  {
    CFArrayRef MutableCopy = 0;
    CFArrayRef v19 = 0;
    goto LABEL_22;
  }
  uint64_t v13 = (void *)*MEMORY[0x263F47768];
  keys[0] = *(void **)MEMORY[0x263F47780];
  keys[1] = v13;
  keys[2] = *(void **)MEMORY[0x263F47758];
  int v14 = (void *)*MEMORY[0x263F47790];
  values[0] = *(void **)MEMORY[0x263F47778];
  values[1] = v14;
  values[2] = *(void **)MEMORY[0x263EFFD08];
  CFDictionaryRef v15 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 3, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!v15) {
    heim_abort();
  }
  CFDictionaryRef v16 = v15;
  CFArrayRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v15);
  CFRelease(v16);
  if (CFStringGetLength(v11) >= 1) {
    CFDictionaryAddValue(MutableCopy, (const void *)*MEMORY[0x263F47750], v11);
  }
  if (CFStringGetLength(v12) >= 1) {
    CFDictionaryAddValue(MutableCopy, (const void *)*MEMORY[0x263F47720], v12);
  }
  CFArrayRef v18 = (const __CFArray *)HeimCredCopyQuery();
  CFArrayRef v19 = v18;
  if (!v18) {
    goto LABEL_22;
  }
  if (!CFArrayGetCount(v18)) {
    goto LABEL_22;
  }
  if (!CFArrayGetValueAtIndex(v19, 0)) {
    goto LABEL_22;
  }
  CFUUIDRef UUID = (const __CFUUID *)HeimCredGetUUID();
  if (!UUID) {
    goto LABEL_22;
  }
  *(CFUUIDBytes *)uu = CFUUIDGetUUIDBytes(UUID);
  memset(out, 0, 37);
  uuid_unparse(uu, out);
  _gss_mg_log(1, "_gss_ntlm_have_cred  UUID(%s)", v21, v22, v23, v24, v25, v26, (char)out);
  if (CFStringGetLength(v11) && CFStringGetLength(v12))
  {
    uint64_t v27 = _gss_ntlm_duplicate_name(a1, (uint64_t)a2, &v35);
    if (v27)
    {
      uint64_t v7 = v27;
      goto LABEL_23;
    }
    uint64_t v29 = v35;
    goto LABEL_38;
  }
  unint64_t v28 = (char *)malloc_type_calloc(1uLL, 0x38uLL, 0x10100405C7453BFuLL);
  uint64_t v35 = v28;
  if (!v28)
  {
LABEL_22:
    uint64_t v7 = 851968;
    goto LABEL_23;
  }
  uint64_t v29 = v28;
  uint64_t v30 = HeimCredCopyAttribute();
  if (v30)
  {
    uint64_t v31 = (const void *)v30;
    *(void *)uint64_t v29 = rk_cfstring2cstring();
    CFRelease(v31);
  }
  uint64_t v32 = HeimCredCopyAttribute();
  if (v32)
  {
    uint64_t v33 = (const void *)v32;
    *((void *)v29 + 1) = rk_cfstring2cstring();
    CFRelease(v33);
  }
  if (!*(void *)v29 || !*((void *)v29 + 1))
  {
    uint64_t v34 = (void **)v29;
    _gss_ntlm_release_name(a1, &v34);
    heim_release();
    *a1 = 12;
    CFRelease(v11);
    uint64_t v7 = 851968;
    goto LABEL_24;
  }
LABEL_38:
  uint64_t v7 = 0;
  *((_DWORD *)v29 + 4) |= 1u;
  *(_OWORD *)(v29 + 36) = *(_OWORD *)uu;
  *a3 = v29;
LABEL_23:
  heim_release();
  CFRelease(v11);
  if (v12) {
LABEL_24:
  }
    CFRelease(v12);
  if (MutableCopy) {
    CFRelease(MutableCopy);
  }
  if (v19) {
    CFRelease(v19);
  }
  return v7;
}

uint64_t _gss_ntlm_acquire_cred(int *a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, void *a6, void *a7, _DWORD *a8)
{
  *a1 = 0;
  *a6 = 0;
  if (a7) {
    *a7 = 0;
  }
  if (a8) {
    *a8 = -1;
  }
  if (!a2) {
    return 458752;
  }
  OM_uint32 v15 = 0;
  uint64_t v14 = 0;
  if ((a5 & 0xFFFFFFFD) == 0)
  {
    uint64_t result = _gss_ntlm_allocate_ctx(a1, *(void *)(a2 + 8), &v14);
    if (result) {
      return result;
    }
    uint64_t v13 = v14;
    _gss_ntlm_delete_sec_context(&v15, &v13, 0);
  }
  if (a5 > 1) {
    return 0;
  }
  uint64_t v13 = 0;
  if ((*(unsigned char *)(a2 + 16) & 2) != 0)
  {
    uint64_t result = _gss_ntlm_duplicate_name(a1, a2, &v13);
    if (result) {
      return result;
    }
  }
  else
  {
    uint64_t result = _gss_ntlm_have_cred(a1, (const char **)a2, &v13);
    if (result) {
      return result;
    }
  }
  uint64_t result = 0;
  *a6 = v13;
  return result;
}

uint64_t _gss_ntlm_acquire_cred_ext(int a1, const char **a2, gss_const_OID a, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  if (!a4) {
    return 851968;
  }
  int v11 = gss_oid_equal(a, &__gss_c_cred_password_oid_desc);
  uint64_t v12 = 851968;
  if (a2)
  {
    if (v11)
    {
      krb5_context v38 = 0;
      memset(uu, 0, sizeof(uu));
      if (!krb5_init_context(&v38))
      {
        uint64_t v13 = (char *)malloc_type_malloc(*(void *)a4 + 1, 0xC3BA1EA5uLL);
        if (!v13) {
          goto LABEL_16;
        }
        uint64_t v14 = v13;
        memcpy(v13, *(const void **)(a4 + 8), *(void *)a4);
        v14[*(void *)a4] = 0;
        heim_ntlm_nt_key();
        size_t v15 = strlen(v14);
        bzero(v14, v15);
        free(v14);
        CFAllocatorRef v16 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
        CFStringRef v17 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], *a2, 0x8000100u);
        if (!v17)
        {
LABEL_16:
          heim_release();
          return v12;
        }
        CFStringRef v18 = v17;
        CFStringRef v19 = CFStringCreateWithCString(v16, a2[1], 0x8000100u);
        if (v19)
        {
          CFDataRef v20 = CFDataCreate(v16, 0, 0);
          CFDataRef v21 = v20;
          if (v20)
          {
            uint64_t v22 = (void *)*MEMORY[0x263F47768];
            keys[0] = *(void **)MEMORY[0x263F47780];
            keys[1] = v22;
            uint64_t v23 = (void *)*MEMORY[0x263F47720];
            keys[2] = *(void **)MEMORY[0x263F47750];
            keys[3] = v23;
            keys[4] = *(void **)MEMORY[0x263F476F8];
            uint64_t v24 = (void *)*MEMORY[0x263F47790];
            values[0] = *(void **)MEMORY[0x263F47778];
            values[1] = v24;
            values[2] = (void *)v18;
            values[3] = (void *)v19;
            values[4] = v20;
            CFDictionaryRef v25 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 5, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
            if (!v25) {
              heim_abort();
            }
            CFDictionaryRef v26 = v25;
            uint64_t v27 = (const void *)HeimCredCreate();
            if (v27)
            {
              CFUUIDRef UUID = (const __CFUUID *)HeimCredGetUUID();
              if (UUID)
              {
                *(CFUUIDBytes *)uu = CFUUIDGetUUIDBytes(UUID);
                memset(out, 0, 37);
                uuid_unparse(uu, out);
                _gss_mg_log(1, "_gss_ntlm_acquire_cred_ext name(%s) domain(%s) UUID(%s)", v29, v30, v31, v32, v33, v34, (char)*a2);
                heim_ntlm_free_buf();
                uint64_t v35 = malloc_type_calloc(1uLL, 0x38uLL, 0x10100405C7453BFuLL);
                if (v35)
                {
                  krb5_context v36 = v35;
                  void *v35 = strdup(*a2);
                  uint64_t v12 = 0;
                  v36[1] = strdup(a2[1]);
                  *((_DWORD *)v36 + 4) = 1;
                  *(_OWORD *)((char *)v36 + 36) = *(_OWORD *)uu;
                  *a8 = v36;
                }
                else
                {
                  uint64_t v12 = 851968;
                }
              }
            }
            goto LABEL_20;
          }
          uint64_t v27 = 0;
        }
        else
        {
          uint64_t v27 = 0;
          CFDataRef v21 = 0;
        }
        CFDictionaryRef v26 = 0;
LABEL_20:
        heim_release();
        CFRelease(v18);
        if (v19) {
          CFRelease(v19);
        }
        if (v21) {
          CFRelease(v21);
        }
        if (v26) {
          CFRelease(v26);
        }
        if (v27) {
          CFRelease(v27);
        }
      }
    }
  }
  return v12;
}

uint64_t _gss_ntlm_add_cred(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, void *a9, _DWORD *a10, _DWORD *a11)
{
  if (a1) {
    *a1 = 0;
  }
  if (a8) {
    *a8 = 0;
  }
  if (a9) {
    *a9 = 0;
  }
  if (a10) {
    *a10 = 0;
  }
  if (a11) {
    *a11 = 0;
  }
  return 0;
}

uint64_t _gss_ntlm_canonicalize_name(_DWORD *a1, uint64_t a2, uint64_t a3, void *a4)
{
  return _gss_ntlm_duplicate_name(a1, a2, a4);
}

uint64_t _gss_ntlm_compare_name(_DWORD *a1)
{
  *a1 = 0;
  return 0;
}

uint64_t _gss_ntlm_context_time(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if (a3) {
    *a3 = -1;
  }
  return 0;
}

uint64_t _gss_ntlm_reset_seq(uint64_t result)
{
  if ((*(unsigned char *)(result + 38) & 8) != 0)
  {
    *(_DWORD *)(result + 272) = 0;
    *(_DWORD *)(result + 472) = 0;
  }
  return result;
}

uint64_t _gss_ntlm_set_keys(uint64_t result)
{
  if (*(void *)(result + 48))
  {
    uint64_t v1 = result;
    int v2 = *(_DWORD *)(result + 36);
    unsigned int v3 = *(_DWORD *)(result + 40);
    *(_DWORD *)(result + 40) = v3 | 4;
    if ((v2 & 0x20) != 0) {
      *(_DWORD *)(result + 28) |= 0x10u;
    }
    if ((v2 & 0x8010) != 0) {
      *(_DWORD *)(result + 28) |= 0x20u;
    }
    if ((v2 & 0x80000) != 0)
    {
      uint64_t v4 = (v3 >> 1) & 1;
      _gss_ntlm_set_key(result + 272, (v3 & 2) == 0, v2 & 0x40000000);
      int v5 = *(_DWORD *)(v1 + 36) & 0x40000000;
      return _gss_ntlm_set_key(v1 + 472, v4, v5);
    }
    else
    {
      hc_EVP_CIPHER_CTX_cleanup();
      hc_EVP_CIPHER_CTX_cleanup();
      hc_EVP_rc4();
      hc_EVP_CipherInit_ex();
      hc_EVP_rc4();
      return hc_EVP_CipherInit_ex();
    }
  }
  return result;
}

uint64_t _gss_ntlm_set_key(uint64_t a1, uint64_t a2, int a3)
{
  CCDigestCreate();
  CCDigestUpdate();
  CCDigestUpdate();
  CCDigestFinal();
  CCDigestReset();
  CCDigestUpdate();
  CCDigestUpdate();
  CCDigestFinal();
  CCDigestDestroy();
  hc_EVP_CIPHER_CTX_cleanup();
  hc_EVP_rc4();
  uint64_t result = hc_EVP_CipherInit_ex();
  if (a3) {
    *(void *)(a1 + 176) = a1 + 8;
  }
  return result;
}

uint64_t _gss_ntlm_destroy_crypto(uint64_t result)
{
  if ((*(unsigned char *)(result + 40) & 4) != 0)
  {
    hc_EVP_CIPHER_CTX_cleanup();
    return hc_EVP_CIPHER_CTX_cleanup();
  }
  return result;
}

uint64_t _gss_ntlm_get_mic(_DWORD *a1, uint64_t a2, uint64_t a3, long long *a4, gss_buffer_desc_struct *a5)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int v11 = 1;
  long long v12 = *a4;
  int v13 = 7;
  v14.__int16 length = 16;
  v14.gss_buffer_desc_struct value = malloc_type_malloc(0x10uLL, 0x6F94655EuLL);
  if (v14.value)
  {
    OM_uint32 minor_status = 0;
    uint64_t mic_iov = get_mic_iov(a1, a2, (uint64_t)&v13, (uint64_t)&v11, 1);
    if (mic_iov) {
      gss_release_buffer(&minor_status, &v14);
    }
    else {
      *a5 = v14;
    }
  }
  else
  {
    *a1 = 12;
    return 851968;
  }
  return mic_iov;
}

uint64_t get_mic_iov(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  *a1 = 0;
  if (*(void *)(a3 + 8) != 16) {
    get_mic_iov_cold_2();
  }
  uint64_t v7 = *(_DWORD **)(a3 + 16);
  if (!v7) {
    get_mic_iov_cold_1();
  }
  LODWORD(v8) = a5;
  int v9 = *(_DWORD *)(a2 + 36);
  if ((~v9 & 0x80010) == 0)
  {
    if ((*(unsigned char *)(a2 + 40) & 4) != 0)
    {
      uint64_t v10 = *(void *)(a2 + 448);
      uint64_t v11 = *(unsigned int *)(a2 + 272);
      *(_DWORD *)(a2 + 272) = v11 + 1;
      v2_sign_message((void *)(a2 + 456), v10, v11, a3, a4, a5);
      return 0;
    }
    return 0x100000;
  }
  if ((v9 & 0x10) == 0)
  {
    if ((v9 & 0x8000) != 0)
    {
      _gss_mg_encode_le_uint32(1, *(_DWORD **)(a3 + 16));
      _gss_mg_encode_le_uint32(0, v7 + 1);
      _gss_mg_encode_le_uint32(0, v7 + 2);
      _gss_mg_encode_le_uint32(0, v7 + 3);
      return 0;
    }
    return 0x100000;
  }
  if ((*(unsigned char *)(a2 + 40) & 4) == 0) {
    return 0x100000;
  }
  uint64_t v13 = *(unsigned int *)(a2 + 272);
  *(_DWORD *)(a2 + 272) = v13 + 1;
  gss_buffer_desc_struct v14 = *(_DWORD **)(a3 + 16);
  _krb5_crc_init_table();
  if ((int)v8 < 1)
  {
    uint64_t v15 = 0;
  }
  else
  {
    uint64_t v15 = 0;
    uint64_t v16 = a4 + 16;
    uint64_t v8 = v8;
    do
    {
      unsigned int v17 = *(unsigned __int16 *)(v16 - 16);
      BOOL v18 = v17 > 0xB;
      int v19 = (1 << v17) & 0xA02;
      if (!v18 && v19 != 0) {
        uint64_t v15 = _krb5_crc_update();
      }
      v16 += 24;
      --v8;
    }
    while (v8);
  }
  _gss_mg_encode_le_uint32(0, &v21);
  _gss_mg_encode_le_uint32(v15, &v22);
  _gss_mg_encode_le_uint32(v13, &v23);
  _gss_mg_encode_le_uint32(1, v14);
  hc_EVP_Cipher();
  return (CCRandomCopyBytes() != 0) << 20;
}

uint64_t _gss_ntlm_verify_mic(_DWORD *a1, uint64_t a2, long long *a3, long long *a4, _DWORD *a5)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v6 = 1;
  long long v7 = *a3;
  int v8 = 7;
  long long v9 = *a4;
  return verify_mic_iov(a1, a2, (uint64_t)&v8, a5, (uint64_t)&v6, 1);
}

uint64_t verify_mic_iov(_DWORD *a1, uint64_t a2, uint64_t a3, _DWORD *a4, uint64_t a5, int a6)
{
  LODWORD(v6) = a6;
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (a4) {
    *a4 = 0;
  }
  *a1 = 0;
  if (*(void *)(a3 + 8) != 16) {
    return 393216;
  }
  int v9 = *(_DWORD *)(a2 + 36);
  if ((~v9 & 0x80010) != 0)
  {
    if ((v9 & 0x10) != 0)
    {
      int v21 = 0;
      if ((*(unsigned char *)(a2 + 40) & 4) == 0) {
        return 0x100000;
      }
      _gss_mg_decode_le_uint32(*(_DWORD **)(a3 + 16), &v21);
      if (v21 == 1)
      {
        hc_EVP_Cipher();
        _krb5_crc_init_table();
        if ((int)v6 < 1)
        {
          int v14 = 0;
        }
        else
        {
          int v14 = 0;
          uint64_t v15 = a5 + 16;
          uint64_t v6 = v6;
          do
          {
            unsigned int v16 = *(unsigned __int16 *)(v15 - 16);
            BOOL v17 = v16 > 0xB;
            int v18 = (1 << v16) & 0xA02;
            if (!v17 && v18 != 0) {
              int v14 = _krb5_crc_update();
            }
            v15 += 24;
            --v6;
          }
          while (v6);
        }
        _gss_mg_decode_le_uint32(&v23, &v21);
        if (v21 == v14)
        {
          _gss_mg_decode_le_uint32(&v24, &v21);
          int v20 = *(_DWORD *)(a2 + 448);
          if (v20 == v21)
          {
            uint64_t v13 = 0;
            *(_DWORD *)(a2 + 448) = v20 + 1;
            return v13;
          }
        }
      }
    }
    else
    {
      if ((v9 & 0x8000) == 0) {
        return 0x100000;
      }
      int v22 = 0;
      long long v12 = *(_DWORD **)(a3 + 16);
      _gss_mg_decode_le_uint32(v12, &v22);
      if (v22 == 1)
      {
        _gss_mg_decode_le_uint32(v12 + 1, &v22);
        if (!v22)
        {
          _gss_mg_decode_le_uint32(v12 + 2, &v22);
          uint64_t v13 = 393216;
          if (!v22)
          {
            _gss_mg_decode_le_uint32(v12 + 3, &v22);
            if (v22) {
              return 393216;
            }
            else {
              return 0;
            }
          }
          return v13;
        }
      }
    }
    return 393216;
  }
  if ((*(unsigned char *)(a2 + 40) & 4) == 0) {
    return 0x100000;
  }
  uint64_t v10 = *(void *)(a2 + 648);

  return v2_verify_message((void *)(a2 + 656), v10, 0, a3, a5, a6);
}

uint64_t _gss_ntlm_wrap_size_limit(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, unsigned int *a6)
{
  *a1 = 0;
  if ((*(unsigned char *)(a2 + 36) & 0x20) == 0) {
    return 0x100000;
  }
  uint64_t result = 0;
  unsigned int v7 = a5 - 16;
  if (a5 < 0x10) {
    unsigned int v7 = 0;
  }
  *a6 = v7;
  return result;
}

uint64_t _gss_ntlm_wrap_iov(_DWORD *a1, _DWORD *a2, uint64_t a3, uint64_t a4, _DWORD *a5, unsigned __int16 *a6, uint64_t a7, uint64_t a8, char a9)
{
  *a1 = 0;
  if (a5) {
    *a5 = 0;
  }
  if (!a6) {
    return 851968;
  }
  gss_buffer_desc_struct buffer = _gss_mg_find_buffer(a6, a7, 7);
  if (buffer || (gss_buffer_desc_struct buffer = _gss_mg_find_buffer(a6, a7, 2)) != 0)
  {
    if (buffer[1])
    {
      uint64_t result = _gss_mg_allocate_buffer(a1, (uint64_t)buffer, 0x10uLL);
      if (result) {
        return result;
      }
    }
    else
    {
      if (*((void *)buffer + 1) <= 0xFuLL)
      {
        *a1 = -1765328194;
        return 851968;
      }
      *((void *)buffer + 1) = 16;
    }
    int v20 = a2[9];
    if ((~v20 & 0x80020) != 0)
    {
      if ((v20 & 0x20) != 0)
      {
        if ((int)a7 >= 1)
        {
          uint64_t v22 = a7;
          int v23 = a6 + 8;
          do
          {
            if ((*(v23 - 8) | 8) == 9) {
              hc_EVP_Cipher();
            }
            v23 += 12;
            --v22;
          }
          while (v22);
        }
        return get_mic_iov(a1, (uint64_t)a2, (uint64_t)buffer, (uint64_t)a6, a7);
      }
      else
      {
        return 0x100000;
      }
    }
    else
    {
      unsigned int v21 = a2[68];
      a2[68] = v21 + 1;
      return v2_seal_message(a2 + 114, v21, (uint64_t)(a2 + 70), (uint64_t)buffer, (uint64_t)a6, a7, a5);
    }
  }
  else
  {
    *a1 = -1561745656;
    return gss_mg_set_error_string((size_t)&__gss_ntlm_mechanism_oid_desc, 851968, -1561745656, "iov header buffer missing", v15, v16, v17, v18, a9);
  }
}

uint64_t v2_seal_message(void *a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _DWORD *a7)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if ((int)a6 < 1) {
    return 851968;
  }
  uint64_t v22 = a1;
  unsigned int v23 = a2;
  uint64_t v25 = &v22;
  uint64_t v26 = a4;
  uint64_t v10 = a6;
  uint64_t v24 = a6;
  uint64_t v11 = 24 * a6;
  MEMORY[0x270FA5388]();
  uint64_t v13 = (char *)&v22 - v12;
  uint64_t v14 = 0;
  do
  {
    uint64_t v15 = &v13[v14];
    *(void *)&v13[v14 + 8] = 0;
    *((void *)v15 + 2) = 0;
    int v16 = *(_DWORD *)(a5 + v14);
    *(_DWORD *)uint64_t v15 = v16;
    if (((unsigned __int16)v16 | 8) == 9)
    {
      size_t v17 = *(void *)(a5 + v14 + 8);
      *(void *)&v13[v14 + 8] = v17;
      *((void *)v15 + 2) = malloc_type_calloc(1uLL, v17, 0xE5D7B905uLL);
      hc_EVP_Cipher();
      if (a7) {
        *a7 = 1;
      }
    }
    v14 += 24;
  }
  while (v11 != v14);
  if (*(void *)(v26 + 8) != 16) {
    v2_seal_message_cold_1();
  }
  v2_sign_message(v22, a3, v23, v26, a5, v24);
  uint64_t v18 = (void **)(a5 + 16);
  int v19 = (const void **)(v13 + 16);
  do
  {
    if ((*((unsigned __int16 *)v18 - 8) | 8) == 9)
    {
      int v20 = (void *)*v19;
      if (*v19)
      {
        memcpy(*v18, *v19, (size_t)*(v19 - 1));
        free(v20);
      }
    }
    v18 += 3;
    v19 += 3;
    --v10;
  }
  while (v10);
  return 0;
}

uint64_t _gss_ntlm_wrap(_DWORD *a1, _DWORD *a2, uint64_t a3, uint64_t a4, size_t *a5, _DWORD *a6, gss_buffer_desc_struct *a7)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  size_t v12 = *a5 + 16;
  a7->__int16 length = v12;
  uint64_t v13 = malloc_type_malloc(v12, 0x9F94BCC0uLL);
  a7->gss_buffer_desc_struct value = v13;
  if (v13)
  {
    int v23 = 1;
    uint64_t v14 = (const void *)a5[1];
    size_t v24 = *a5;
    uint64_t v25 = v13;
    memcpy(v13, v14, v24);
    int v26 = 7;
    uint64_t v15 = (char *)a7->value + *a5;
    uint64_t v27 = 16;
    unint64_t v28 = v15;
    uint64_t v19 = _gss_ntlm_wrap_iov(a1, a2, v16, v17, a6, (unsigned __int16 *)&v23, 2, v18, v21);
    if (v19 >= 0x10000)
    {
      OM_uint32 minor_status = 0;
      gss_release_buffer(&minor_status, a7);
    }
  }
  else
  {
    *a1 = 12;
    return 851968;
  }
  return v19;
}

uint64_t _gss_ntlm_unwrap_iov(_DWORD *a1, uint64_t a2, _DWORD *a3, _DWORD *a4, unsigned __int16 *a5, int a6, uint64_t a7, uint64_t a8, char a9)
{
  *a1 = 0;
  if (a3) {
    *a3 = 0;
  }
  if (a4) {
    *a4 = 0;
  }
  gss_buffer_desc_struct buffer = _gss_mg_find_buffer(a5, a6, 7);
  if (buffer || (gss_buffer_desc_struct buffer = _gss_mg_find_buffer(a5, a6, 2)) != 0)
  {
    if (*((void *)buffer + 1) >= 0x10uLL)
    {
      int v20 = *(_DWORD *)(a2 + 36);
      if ((~v20 & 0x80020) != 0)
      {
        if ((v20 & 0x20) != 0)
        {
          if (a6 >= 1)
          {
            uint64_t v26 = a6;
            uint64_t v27 = a5 + 8;
            do
            {
              if ((*(v27 - 8) | 8) == 9) {
                hc_EVP_Cipher();
              }
              v27 += 12;
              --v26;
            }
            while (v26);
          }
          return verify_mic_iov(a1, a2, (uint64_t)buffer, 0, (uint64_t)a5, a6);
        }
        else
        {
          return 0x100000;
        }
      }
      else
      {
        char v21 = (void *)(a2 + 656);
        unsigned int v22 = *(_DWORD *)(a2 + 472);
        *(_DWORD *)(a2 + 472) = v22 + 1;
        uint64_t v23 = a2 + 480;
        if (a6 >= 1)
        {
          uint64_t v24 = a6;
          uint64_t v25 = a5 + 8;
          do
          {
            if ((*(v25 - 8) | 8) == 9)
            {
              hc_EVP_Cipher();
              if (a3) {
                *a3 = 1;
              }
            }
            v25 += 12;
            --v24;
          }
          while (v24);
        }
        return v2_verify_message(v21, v23, v22, (uint64_t)buffer, (uint64_t)a5, a6);
      }
    }
    else
    {
      return 393216;
    }
  }
  else
  {
    *a1 = -1561745656;
    return gss_mg_set_error_string((size_t)&__gss_ntlm_mechanism_oid_desc, 851968, -1561745656, "iov tailer buffer missing", v15, v16, v17, v18, a9);
  }
}

uint64_t _gss_ntlm_unwrap(_DWORD *a1, uint64_t a2, uint64_t a3, gss_buffer_desc_struct *a4, _DWORD *a5, _DWORD *a6)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  size_t v7 = *(void *)a3 - 16;
  if (*(void *)a3 < 0x10uLL) {
    return 589824;
  }
  a4->__int16 length = v7;
  uint64_t v14 = malloc_type_malloc(v7, 0xEF7A6F95uLL);
  a4->gss_buffer_desc_struct value = v14;
  if (v14)
  {
    memcpy(v14, *(const void **)(a3 + 8), a4->length);
    int v21 = 1;
    gss_buffer_desc_struct v22 = *a4;
    int v23 = 7;
    uint64_t v15 = *(void *)(a3 + 8) + *(void *)a3 - 16;
    uint64_t v24 = 16;
    uint64_t v25 = v15;
    uint64_t v8 = _gss_ntlm_unwrap_iov(a1, a2, a5, a6, (unsigned __int16 *)&v21, 2, v16, v17, v19);
    if (v8 >= 0x10000)
    {
      OM_uint32 minor_status = 0;
      gss_release_buffer(&minor_status, a4);
    }
  }
  else
  {
    *a1 = 12;
    return 851968;
  }
  return v8;
}

uint64_t _gss_ntlm_wrap_iov_length(_DWORD *a1, uint64_t a2, int a3, uint64_t a4, _DWORD *a5, unsigned __int16 *a6, int a7, uint64_t a8, char a9)
{
  gss_buffer_desc_struct buffer = _gss_mg_find_buffer(a6, a7, 7);
  if (buffer)
  {
    int v15 = 2;
LABEL_5:
    *((void *)buffer + 1) = 16;
    int v20 = _gss_mg_find_buffer(a6, a7, 9);
    if (v20) {
      *((void *)v20 + 1) = 0;
    }
    int v21 = _gss_mg_find_buffer(a6, a7, v15);
    if (v21) {
      *((void *)v21 + 1) = 0;
    }
    if (a5) {
      *a5 = a3;
    }
    *a1 = 0;
    return 0;
  }
  gss_buffer_desc_struct buffer = _gss_mg_find_buffer(a6, a7, 2);
  if (buffer)
  {
    int v15 = 7;
    goto LABEL_5;
  }
  *a1 = -1561745656;

  return gss_mg_set_error_string((size_t)&__gss_ntlm_mechanism_oid_desc, 851968, -1561745656, "iov header buffer missing", v16, v17, v18, v19, a9);
}

void _gss_ntlm_debug_hex(uint64_t a1, char a2)
{
  if (_gss_mg_log_level(a1) && (rk_hex_encode() & 0x8000000000000000) == 0)
  {
    _gss_mg_log(a1, "%s %s", v4, v5, v6, v7, v8, v9, a2);
    free(0);
  }
}

void _gss_ntlm_debug_key(uint64_t a1, char a2)
{
  if (_gss_mg_log_level(a1) && (rk_hex_encode() & 0x8000000000000000) == 0)
  {
    _gss_mg_log(a1, "%s %s", v4, v5, v6, v7, v8, v9, a2);
    size_t v10 = strlen(0);
    bzero(0, v10);
    free(0);
  }
}

uint64_t v2_sign_message(void *key, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  data[2] = *MEMORY[0x263EF8340];
  uint64_t v6 = *(void *)(a4 + 16);
  *(void *)uint64_t v6 = 0;
  *(void *)(v6 + 8) = 0;
  data[0] = 0;
  data[1] = 0;
  if (*(void *)(a4 + 8) != 16) {
    v2_sign_message_cold_1();
  }
  LODWORD(v7) = a6;
  memset(&v17, 0, sizeof(v17));
  CCHmacInit(&v17, 1u, key, 0x10uLL);
  _gss_mg_encode_le_uint32(a3, data);
  CCHmacUpdate(&v17, data, 4uLL);
  if ((int)v7 >= 1)
  {
    uint64_t v7 = v7;
    uint64_t v11 = (const void **)(a5 + 16);
    do
    {
      unsigned int v12 = *((unsigned __int16 *)v11 - 8);
      BOOL v13 = v12 > 0xB;
      int v14 = (1 << v12) & 0xA03;
      if (!v13 && v14 != 0) {
        CCHmacUpdate(&v17, *v11, (size_t)*(v11 - 1));
      }
      v11 += 3;
      --v7;
    }
    while (v7);
  }
  CCHmacFinal(&v17, data);
  memset(&v17, 0, sizeof(v17));
  _gss_mg_encode_le_uint32(1, (_DWORD *)v6);
  if (a2) {
    hc_EVP_Cipher();
  }
  else {
    *(void *)(v6 + 4) = data[0];
  }
  return _gss_mg_encode_le_uint32(a3, (_DWORD *)(v6 + 12));
}

uint64_t v2_verify_message(void *a1, uint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5, int a6)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  unsigned int v14 = a3;
  uint64_t v6 = 393216;
  if (*(void *)(a4 + 8) == 16)
  {
    _gss_mg_decode_le_uint32((_DWORD *)(*(void *)(a4 + 16) + 12), &v14);
    long long v12 = xmmword_213D77C20;
    LODWORD(v12) = 7;
    BOOL v13 = &v15;
    v2_sign_message(a1, a2, v14, (uint64_t)&v12, a5, a6);
    if (ct_memcmp()) {
      return 393216;
    }
    else {
      return 0;
    }
  }
  return v6;
}

uint64_t _gss_ntlm_delete_sec_context(OM_uint32 *a1, uint64_t *a2, void *a3)
{
  if (a2)
  {
    uint64_t v5 = *a2;
    long long v12 = *(void ***)(*a2 + 16);
    *a2 = 0;
    uint64_t v6 = *(void **)(v5 + 208);
    if (v6) {
      free(v6);
    }
    if (*(void *)(v5 + 120)) {
      heim_ntlm_free_targetinfo();
    }
    unint64_t v7 = *(void *)(v5 + 8);
    if (v7)
    {
      uint64_t v8 = 0;
      for (unint64_t i = 0; i < v7; ++i)
      {
        if (*(void *)(*(void *)v5 + v8 + 8))
        {
          (*(void (**)(OM_uint32 *))(*(void *)(*(void *)v5 + v8) + 16))(a1);
          unint64_t v7 = *(void *)(v5 + 8);
        }
        v8 += 16;
      }
    }
    if (*(void *)v5) {
      free(*(void **)v5);
    }
    if (*(void *)(v5 + 216)) {
      _gss_ntlm_release_name(0, (void ***)(v5 + 216));
    }
    if (*(void *)(v5 + 224)) {
      _gss_ntlm_release_name(0, (void ***)(v5 + 224));
    }
    size_t v10 = *(void **)(v5 + 232);
    if (v10) {
      free(v10);
    }
    _gss_ntlm_destroy_crypto(v5);
    krb5_data_free();
    krb5_data_free();
    krb5_data_free();
    krb5_data_free();
    gss_release_buffer(a1, (gss_buffer_t)(v5 + 256));
    _gss_ntlm_release_cred(0, &v12);
    bzero((void *)v5, 0x2A0uLL);
    free((void *)v5);
  }
  if (a3)
  {
    *a3 = 0;
    a3[1] = 0;
  }
  *a1 = 0;
  return 0;
}

uint64_t _gss_ntlm_display_name(int *a1, const char **a2, void *a3, gss_OID_desc **a4)
{
  *a1 = 0;
  if (a4) {
    *a4 = &__gss_ntlm_mechanism_oid_desc;
  }
  if (!a3) {
    return 0;
  }
  size_t v10 = 0;
  *a3 = 0;
  a3[1] = 0;
  if (a2)
  {
    unsigned int v6 = asprintf(&v10, "%s@%s", *a2, a2[1]);
    uint64_t result = 851968;
    int v8 = 12;
    if ((v6 & 0x80000000) == 0)
    {
      uint64_t v9 = v10;
      if (v10)
      {
        uint64_t result = 0;
        *a3 = v6;
        a3[1] = v9;
        return result;
      }
    }
  }
  else
  {
    int v8 = 0;
    uint64_t result = 0x20000;
  }
  *a1 = v8;
  return result;
}

uint64_t _gss_ntlm_duplicate_name(_DWORD *a1, uint64_t a2, void *a3)
{
  unsigned int v6 = (char *)malloc_type_calloc(1uLL, 0x38uLL, 0x10100405C7453BFuLL);
  if (!v6) {
    goto LABEL_7;
  }
  unint64_t v7 = strdup(*(const char **)a2);
  *(void *)unsigned int v6 = v7;
  int v8 = strdup(*(const char **)(a2 + 8));
  *((void *)v6 + 1) = v8;
  *((_DWORD *)v6 + 4) = *(_DWORD *)(a2 + 16);
  *(_OWORD *)(v6 + 20) = *(_OWORD *)(a2 + 20);
  *(_OWORD *)(v6 + 36) = *(_OWORD *)(a2 + 36);
  if (!v7 || v8 == 0)
  {
LABEL_7:
    uint64_t v11 = (void **)v6;
    _gss_ntlm_release_name(a1, &v11);
    *a1 = 12;
    return 851968;
  }
  else
  {
    *a3 = v6;
    uint64_t result = 0;
    if (a1) {
      *a1 = 0;
    }
  }
  return result;
}

uint64_t _gss_ntlm_export_name(int *a1, const char **a2, size_t *a3)
{
  __s = 0;
  asprintf(&__s, "%s\\%s", a2[1], *a2);
  if (__s)
  {
    size_t v5 = strlen(__s);
    uint64_t v6 = gss_mg_export_name(a1, (const void **)&__gss_ntlm_mechanism_oid_desc, __s, v5, a3);
    free(__s);
  }
  else
  {
    *a1 = 12;
    return 851968;
  }
  return v6;
}

uint64_t _gss_ntlm_export_sec_context(_DWORD *a1, uint64_t a2, void *a3)
{
  if (a1) {
    *a1 = 0;
  }
  if (a3)
  {
    *a3 = 0;
    a3[1] = 0;
  }
  return 0;
}

void *__gss_ntlm_initialize()
{
  return &ntlm_mech;
}

uint64_t get_signing_supported(gss_const_OID a, uint64_t a2, size_t *a3)
{
  int v10 = 0;
  uint64_t v9 = 0;
  if (__gss_ntlm_is_digest_service) {
    return _gss_mo_get_option_0(a, a2, a3);
  }
  if (_gss_ntlm_allocate_ctx(&v10, 0, &v9)) {
    return _gss_mo_get_option_0(a, a2, a3);
  }
  uint64_t v8 = v9;
  int v6 = *(_DWORD *)(v9 + 24);
  _gss_ntlm_delete_sec_context((OM_uint32 *)&v10, &v8, 0);
  if (v6) {
    return _gss_mo_get_option_0(a, a2, a3);
  }
  else {
    return _gss_mo_get_option_1(a, a2, a3);
  }
}

char **_gss_ntlm_create_name(_DWORD *a1, const char *a2, const char *a3, int a4)
{
  uint64_t v8 = (char **)malloc_type_calloc(1uLL, 0x38uLL, 0x10100405C7453BFuLL);
  if (!v8) {
    goto LABEL_5;
  }
  uint64_t v9 = v8;
  int v10 = strdup(a2);
  *uint64_t v9 = v10;
  uint64_t v11 = strdup(a3);
  long long v12 = v11;
  v9[1] = v11;
  *((_DWORD *)v9 + 4) = a4;
  if (!v10 || !v11)
  {
    free(v10);
    free(v12);
    free(v9);
LABEL_5:
    uint64_t v9 = 0;
    *a1 = 12;
  }
  return v9;
}

uint64_t _gss_ntlm_import_name(_DWORD *a1, unint64_t *a2, gss_const_OID a, void *a4)
{
  return _gss_mech_import_name(a1, (const void **)&__gss_ntlm_mechanism_oid_desc, (uint64_t)&ntlm_names, a2, a, a4);
}

uint64_t _gss_ntlm_inquire_names_for_mech(OM_uint32 *a1, uint64_t a2, gss_OID_set *a3)
{
  return _gss_mech_inquire_names_for_mech(a1, (uint64_t)&ntlm_names, a3);
}

uint64_t anon_name(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, char ***a5)
{
  name = _gss_ntlm_create_name(a1, "", "", 2);
  *a5 = name;
  if (name) {
    return 0;
  }
  else {
    return 851968;
  }
}

uint64_t hostbased_name(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, char ***a5)
{
  uint64_t v8 = (char *)malloc_type_malloc(*(void *)a3 + 1, 0x259A9304uLL);
  if (v8)
  {
    uint64_t v9 = v8;
    memcpy(v8, *(const void **)(a3 + 8), *(void *)a3);
    v9[*(void *)a3] = 0;
    int v10 = strchr(v9, 64);
    if (v10)
    {
      *int v10 = 0;
      uint64_t v11 = v10 + 1;
    }
    else
    {
      uint64_t v11 = "";
    }
    *a5 = _gss_ntlm_create_name(a1, v9, v11, 0);
    free(v9);
    if (*a5) {
      return 0;
    }
    else {
      return 851968;
    }
  }
  else
  {
    *a1 = 12;
    return 851968;
  }
}

uint64_t user_name(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, char ***a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return parse_name(a1, a2, 0, a3, a4, a5, a7, a8, a9);
}

uint64_t parse_ntlm_name(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, char ***a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return parse_name(a1, a2, 1, a3, a4, a5, a7, a8, a9);
}

uint64_t export_name(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, char ***a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return parse_name(a1, a2, 1, a3, a4, a5, a7, a8, a9);
}

uint64_t parse_name(_DWORD *a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, char ***a6, uint64_t a7, uint64_t a8, char a9)
{
  size_t v13 = *(void *)a4;
  if (memchr(*(void **)(a4 + 8), 64, *(void *)a4))
  {
    return hostbased_name(a1, v14, a4, v15, a6);
  }
  CCHmacContext v17 = (char *)malloc_type_malloc(v13 + 1, 0xA267D31AuLL);
  if (!v17)
  {
    *a1 = 12;
    return 851968;
  }
  uint64_t v18 = v17;
  memcpy(v17, *(const void **)(a4 + 8), *(void *)a4);
  v18[*(void *)a4] = 0;
  uint64_t v19 = strchr(v18, 92);
  if (v19)
  {
    *uint64_t v19 = 0;
    int v20 = v19 + 1;
    rk_strupr();
    int v21 = v18;
    goto LABEL_8;
  }
  if (!a3)
  {
    int v21 = "";
    int v20 = v18;
LABEL_8:
    *a6 = _gss_ntlm_create_name(a1, v20, v21, 0);
    free(v18);
    if (*a6) {
      return 0;
    }
    else {
      return 851968;
    }
  }
  free(v18);
  *a1 = -1561745657;

  return gss_mg_set_error_string((size_t)&__gss_ntlm_mechanism_oid_desc, 0x20000, -1561745657, "domain requested but missing name", v22, v23, v24, v25, a9);
}

uint64_t _gss_ntlm_import_sec_context(_DWORD *a1, uint64_t a2, void *a3)
{
  if (a1) {
    *a1 = 0;
  }
  if (a3) {
    *a3 = 0;
  }
  return 851968;
}

uint64_t _gss_ntlm_init_sec_context(int *a1, uint64_t a2, uint64_t *a3, const char **a4, uint64_t a5, char a6, uint64_t a7, void *a8, uint64_t a9, gss_OID_desc **a10, CFIndex *a11, _DWORD *a12, _DWORD *a13)
{
  uint64_t v179 = *MEMORY[0x263EF8340];
  *a1 = 0;
  if (a12) {
    *a12 = 0;
  }
  if (a13) {
    *a13 = 0;
  }
  if (a10) {
    *a10 = 0;
  }
  if (!a4) {
    return 0x20000;
  }
  if (__ApplePrivate_gss_mo_get(&__gss_ntlm_mechanism_oid_desc, &__gss_c_ntlm_v2_oid_desc, 0))
  {
    v162 = a3;
    uint64_t v23 = *a3;
    if (a10) {
      *a10 = &__gss_ntlm_mechanism_oid_desc;
    }
    uint64_t v24 = a11;
    if (a12) {
      *a12 = 0;
    }
    if (v23)
    {
      if ((*(unsigned char *)(v23 + 37) & 8) == 0)
      {
        CFIndex length = 0;
        bytes = 0;
        uint64_t v25 = *(void *)(a9 + 8);
        *(void *)&long long v175 = *(void *)a9;
        *((void *)&v175 + 1) = v25;
        if (a8)
        {
          uint64_t v26 = gss_mg_gen_cb(a1, a8, (uint64_t)v169, 0);
          if (v26) {
            goto LABEL_17;
          }
          CFIndex length = 16;
          bytes = v169;
        }
        else
        {
          krb5_data_zero();
        }
        _gss_mg_log(1, "NTLM: _gss_ntlm_init_sec_context (GSSCred)", v27, v28, v29, v30, v31, v32, v151);
        if ((*(unsigned char *)(*(void *)(v23 + 16) + 16) & 1) == 0)
        {
          _gss_mg_log(1, "NTLM: NTLM_UUID not available", v56, v57, v58, v59, v60, v61, v152);
          _gss_ntlm_delete_sec_context((OM_uint32 *)a1, v162, 0);
          int v62 = "no credentials available";
          uint64_t v63 = 458752;
LABEL_43:
          int v64 = 0;
          return gss_mg_set_error_string((size_t)&__gss_ntlm_mechanism_oid_desc, v63, v64, v62, v19, v20, v21, v22, v151);
        }
        memset(out, 0, 37);
        uuid_unparse((const unsigned __int8 *)(*(void *)(v23 + 16) + 36), (char *)out);
        _gss_mg_log(1, "_gss_ntlm_init_sec_context  UUID(%s)", v65, v66, v67, v68, v69, v70, (char)out);
        CFAllocatorRef v71 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
        CFUUIDRef v72 = CFUUIDCreateFromUUIDBytes((CFAllocatorRef)*MEMORY[0x263EFFB08], *(CFUUIDBytes *)(*(void *)(v23 + 16) + 36));
        uint64_t v73 = HeimCredCopyFromUUID();
        if (!v73) {
          goto LABEL_117;
        }
        unsigned int v74 = (const void *)v73;
        CFStringRef v75 = CFStringCreateWithCString(v71, **(const char ***)(v23 + 16), 0x8000100u);
        if (!v75)
        {
          int v96 = -1765328191;
          goto LABEL_126;
        }
        CFStringRef v76 = v75;
        CFStringRef v77 = CFStringCreateWithCString(v71, *(const char **)(*(void *)(v23 + 16) + 8), 0x8000100u);
        if (!v77)
        {
          CFDictionaryRef v110 = (CFDictionaryRef)v76;
          int v96 = -1765328191;
LABEL_125:
          CFRelease(v110);
          goto LABEL_126;
        }
        CFStringRef cf = v77;
        CFTypeRef v155 = v74;
        if (!*(void *)a9 || (CFDataRef v78 = CFDataCreate(v71, *(const UInt8 **)(a9 + 8), *(void *)a9)) == 0)
        {
          CFDataRef v159 = 0;
          CFDataRef v160 = 0;
          CFDataRef v95 = 0;
          CFDictionaryRef v157 = 0;
          CFStringRef v158 = 0;
          CFNumberRef v156 = 0;
          char v97 = 0;
          int v96 = -1765328191;
          goto LABEL_92;
        }
        CFDataRef v154 = v78;
        CFIndex v84 = length;
        if (!length)
        {
          _gss_mg_log(1, "_gss_ntlm_init_sec_context  UUID(%s) - no channel bindings", 0, v79, v80, v81, v82, v83, (char)out);
          CFIndex v84 = 0;
        }
        CFDataRef v85 = CFDataCreate(v71, bytes, v84);
        if (v85)
        {
          CFDataRef v160 = v85;
          CFIndex v86 = *(void *)(v23 + 64);
          if (v86 && (CFDataRef v87 = CFDataCreate(v71, *(const UInt8 **)(v23 + 72), v86)) != 0)
          {
            CFDataRef v159 = v87;
            CFStringRef v88 = CFStringCreateWithCString(v71, *(const char **)(v23 + 232), 0x8000100u);
            if (v88)
            {
              CFStringRef v158 = v88;
              CFNumberRef v89 = CFNumberCreate(v71, kCFNumberSInt32Type, (const void *)(v23 + 36));
              if (v89)
              {
                uint64_t v90 = (void *)*MEMORY[0x263F47768];
                keys[0] = *(void **)MEMORY[0x263F47780];
                keys[1] = v90;
                v91 = (void *)*MEMORY[0x263F47720];
                keys[2] = *(void **)MEMORY[0x263F47750];
                keys[3] = v91;
                v92 = (void *)*MEMORY[0x263F47708];
                keys[4] = *(void **)MEMORY[0x263F47740];
                keys[5] = v92;
                v93 = (void *)*MEMORY[0x263F47718];
                keys[6] = *(void **)MEMORY[0x263F47738];
                keys[7] = v93;
                keys[8] = *(void **)MEMORY[0x263F47710];
                v94 = (void *)*MEMORY[0x263F47790];
                values[0] = *(void **)MEMORY[0x263F47778];
                values[1] = v94;
                values[2] = (void *)v76;
                values[3] = (void *)cf;
                CFDataRef v95 = v154;
                values[4] = v154;
                values[5] = v160;
                values[6] = v159;
                values[7] = (void *)v158;
                CFNumberRef v156 = v89;
                values[8] = v89;
                CFDictionaryRef v157 = CFDictionaryCreate(v71, (const void **)keys, (const void **)values, 9, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
                int v96 = 0;
                char v97 = 1;
                goto LABEL_92;
              }
              goto LABEL_91;
            }
          }
          else
          {
            CFDataRef v159 = 0;
          }
        }
        else
        {
          CFDataRef v159 = 0;
          CFDataRef v160 = 0;
        }
        CFStringRef v158 = 0;
LABEL_91:
        CFNumberRef v156 = 0;
        CFDictionaryRef v157 = 0;
        char v97 = 0;
        int v96 = -1765328191;
        CFDataRef v95 = v154;
LABEL_92:
        CFRelease(v76);
        CFRelease(cf);
        if (v95) {
          CFRelease(v95);
        }
        if (v160) {
          CFRelease(v160);
        }
        if (v159) {
          CFRelease(v159);
        }
        if (v158) {
          CFRelease(v158);
        }
        if (v156) {
          CFRelease(v156);
        }
        if (v97)
        {
          CFDictionaryRef v111 = (const __CFDictionary *)HeimCredDoAuth();
          CFRelease(v157);
          if (!v111)
          {
            _gss_ntlm_delete_sec_context((OM_uint32 *)a1, v162, 0);
            _gss_mg_log(1, "NTLM: HeimCredCreate failed error(%ld)", v141, v142, v143, v144, v145, v146, 0);
            CFRelease(v155);
            if (v72) {
              CFRelease(v72);
            }
            *a1 = -1765328191;
            int v62 = "HeimCredCreate failed";
            uint64_t v63 = 851968;
            goto LABEL_43;
          }
          _gss_mg_log(1, "ntlm-isc-type3: GSSCred returned", v112, v113, v114, v115, v116, v117, v151);
          CFDataRef Value = (const __CFData *)CFDictionaryGetValue(v111, (const void *)*MEMORY[0x263F47748]);
          CFDataRef v119 = Value;
          if (!Value) {
            goto LABEL_130;
          }
          CFIndex v120 = CFDataGetLength(Value);
          *(void *)&long long v175 = v120;
          if (!v120) {
            goto LABEL_131;
          }
          *((void *)&v175 + 1) = malloc_type_calloc(1uLL, v120, 0x81F2FF23uLL);
          if (*((void *)&v175 + 1))
          {
            v180.CFIndex length = CFDataGetLength(v119);
            v180.location = 0;
            CFDataGetBytes(v119, v180, *((UInt8 **)&v175 + 1));
            CFNumberRef v121 = (const __CFNumber *)CFDictionaryGetValue(v111, (const void *)*MEMORY[0x263F47728]);
            if (!v121 || !CFNumberGetValue(v121, kCFNumberSInt32Type, (void *)(v23 + 32))) {
              goto LABEL_131;
            }
            CFDataRef v122 = (const __CFData *)CFDictionaryGetValue(v111, (const void *)*MEMORY[0x263F47730]);
            CFDataRef v119 = v122;
            if (!v122) {
              goto LABEL_130;
            }
            CFIndex v123 = CFDataGetLength(v122);
            *(void *)(v23 + 48) = v123;
            if (!v123)
            {
LABEL_131:
              OM_uint32 v125 = 0;
              CFDataRef v119 = 0;
              goto LABEL_132;
            }
            v124 = malloc_type_calloc(1uLL, v123, 0x34FAB149uLL);
            *(void *)(v23 + 56) = v124;
            if (v124)
            {
              v181.CFIndex length = CFDataGetLength(v119);
              v181.location = 0;
              CFDataGetBytes(v119, v181, *(UInt8 **)(v23 + 56));
              if (CFDictionaryGetValue(v111, (const void *)*MEMORY[0x263F47750]))
              {
                CFDataRef v119 = (const __CFData *)heim_string_copy_utf8();
                if (CFDictionaryGetValue(v111, (const void *)*MEMORY[0x263F47720]))
                {
                  OM_uint32 v125 = (char *)heim_string_copy_utf8();
                  CFNumberRef v126 = (const __CFNumber *)CFDictionaryGetValue(v111, (const void *)*MEMORY[0x263F47710]);
                  if (CFNumberGetValue(v126, kCFNumberSInt32Type, (void *)(v23 + 36)))
                  {
                    _gss_mg_log(1, "ntlm-isc-type3: %s\\%s", v127, v128, v129, v130, v131, v132, (char)v125);
                    *(void *)(v23 + 216) = _gss_ntlm_create_name(a1, (const char *)v119, v125, 0);
                    free(v119);
                    free(v125);
                    if (*(void *)(v23 + 216))
                    {
                      CFRelease(v155);
                      uint64_t v24 = a11;
LABEL_117:
                      CFRelease(v72);
                      CFIndex v133 = *((void *)&v175 + 1);
                      CFIndex *v24 = v175;
                      v24[1] = v133;
LABEL_118:
                      *(_DWORD *)(v23 + 40) |= 1u;
                      _gss_ntlm_reset_seq(v23);
                      _gss_ntlm_set_keys(v23);
                      if (a12) {
                        *a12 = *(_DWORD *)(v23 + 28);
                      }
                      if (a13)
                      {
                        uint64_t v33 = 0;
                        *a13 = -1;
                        return v33;
                      }
                      return 0;
                    }
                    CFRelease(v157);
                    _gss_ntlm_delete_sec_context((OM_uint32 *)a1, v162, 0);
                    krb5_data_free();
                    return 851968;
                  }
LABEL_132:
                  _gss_ntlm_delete_sec_context((OM_uint32 *)a1, v162, 0);
                  krb5_data_free();
                  free(v119);
                  free(v125);
                  *a1 = -1765328191;
                  int v62 = "failed parse GSSCred reply";
                  uint64_t v63 = 851968;
                  int v64 = -1765328191;
                  return gss_mg_set_error_string((size_t)&__gss_ntlm_mechanism_oid_desc, v63, v64, v62, v19, v20, v21, v22, v151);
                }
LABEL_130:
                OM_uint32 v125 = 0;
                goto LABEL_132;
              }
              goto LABEL_131;
            }
          }
LABEL_122:
          *a1 = 12;
          int v62 = "out of memory";
          uint64_t v63 = 851968;
          int v64 = 12;
          return gss_mg_set_error_string((size_t)&__gss_ntlm_mechanism_oid_desc, v63, v64, v62, v19, v20, v21, v22, v151);
        }
        CFDictionaryRef v110 = v157;
        if (v157) {
          goto LABEL_125;
        }
LABEL_126:
        if (v72) {
          CFRelease(v72);
        }
        _gss_ntlm_delete_sec_context((OM_uint32 *)a1, v162, 0);
        *a1 = v96;
        int v62 = "failed to create ntlm response";
        uint64_t v63 = 851968;
        int v64 = v96;
        return gss_mg_set_error_string((size_t)&__gss_ntlm_mechanism_oid_desc, v63, v64, v62, v19, v20, v21, v22, v151);
      }
      long long v176 = 0u;
      long long v177 = 0u;
      uint64_t v178 = 0;
      memset(out, 0, sizeof(out));
      long long v171 = 0u;
      long long v172 = 0u;
      long long v173 = 0u;
      long long v174 = 0u;
      long long v175 = 0u;
      if (!a9) {
        return 851968;
      }
      lengthgss_OID_desc a = *(void *)a9;
      bytesgss_OID_desc a = *(UInt8 **)(a9 + 8);
      int v54 = heim_ntlm_decode_type2();
      if (v54)
      {
        int v55 = v54;
        _gss_ntlm_delete_sec_context((OM_uint32 *)a1, v162, 0);
        *a1 = v55;
        return 851968;
      }
      LODWORD(out[0]) = *(_DWORD *)(v23 + 36);
      out[1] = "";
      out[2] = "";
      *((void *)&v172 + 1) = "";
      out[3] = (const char *)1;
      out[4] = (const char *)&unk_213D77D78;
      int v99 = heim_ntlm_encode_type3();
      heim_ntlm_free_type2();
      if (!v99)
      {
        *a11 = lengtha;
        a11[1] = (CFIndex)bytesa;
        *(_DWORD *)(v23 + 28) |= 0x40u;
        name = _gss_ntlm_create_name(a1, "", "", 0);
        *(void *)(v23 + 216) = name;
        if (name)
        {
          _gss_mg_log(1, "ntlm-isc-type3: anonymous", v101, v102, v103, v104, v105, v106, v151);
          goto LABEL_118;
        }
        _gss_ntlm_delete_sec_context((OM_uint32 *)a1, v162, 0);
        return 851968;
      }
LABEL_64:
      _gss_ntlm_delete_sec_context((OM_uint32 *)a1, v162, 0);
      *a1 = v99;
      return 851968;
    }
    long long v175 = 0u;
    long long v176 = 0u;
    if (!a4[1]) {
      goto LABEL_59;
    }
    CFArrayRef v34 = (const __CFArray *)_gss_mg_copy_key(@"com.apple.GSS.NTLM", @"AllowedHosts");
    if (!v34)
    {
LABEL_33:
      char v51 = malloc_type_calloc(1uLL, 0x2A0uLL, 0x10F204024BAB64EuLL);
      if (!v51) {
        goto LABEL_122;
      }
      OM_uint32 v52 = v51;
      uint64_t *v162 = (uint64_t)v51;
      v51[10] |= 2u;
      if (a2)
      {
        uint64_t have_cred = _gss_ntlm_duplicate_name(a1, a2, (void *)v51 + 2);
      }
      else
      {
        *(void *)&long long v171 = 0;
        memset(&out[2], 0, 32);
        out[0] = "";
        out[1] = "";
        uint64_t have_cred = _gss_ntlm_have_cred(a1, out, (void *)v51 + 2);
      }
      uint64_t v33 = have_cred;
      if (have_cred) {
        goto LABEL_70;
      }
      uint64_t v26 = _gss_ntlm_duplicate_name(a1, (uint64_t)a4, (void *)v52 + 28);
      if (v26)
      {
LABEL_17:
        uint64_t v33 = v26;
LABEL_70:
        LODWORD(out[0]) = 0;
        _gss_ntlm_delete_sec_context((OM_uint32 *)out, v162, 0);
        return v33;
      }
      if (asprintf((char **)v52 + 29, "%s/%s", *a4, a4[1]) < 0 || !*((void *)v52 + 29))
      {
        LODWORD(out[0]) = 0;
        _gss_ntlm_delete_sec_context((OM_uint32 *)out, v162, 0);
        return 0;
      }
      if ((a6 & 0x40) != 0)
      {
        unsigned int v109 = 33556997;
      }
      else
      {
        if ((*(unsigned char *)(*((void *)v52 + 2) + 16) & 2) != 0)
        {
          LODWORD(out[0]) = 0;
          _gss_ntlm_delete_sec_context((OM_uint32 *)out, v162, 0);
          uint64_t v33 = 458752;
          gss_mg_set_error_string((size_t)&__gss_ntlm_mechanism_oid_desc, 458752, 0, "Cant authenticate with anon name", v147, v148, v149, v150, v153);
          *a1 = 0;
          return v33;
        }
        if ((a6 & 0x10) != 0) {
          int v108 = 33587765;
        }
        else {
          int v108 = 33554949;
        }
        if ((a6 & 0x20) != 0) {
          v108 |= 0x8010u;
        }
        unsigned int v109 = v108 | 0x60880000;
      }
      long long v175 = v109;
      *(void *)&long long v176 = 0;
      *((void *)&v176 + 1) = 0xF0601B01DLL;
      int v134 = heim_ntlm_encode_type1();
      if (!v134)
      {
        CFIndex *v24 = 0;
        v24[1] = 0;
        int v134 = krb5_data_copy();
        if (!v134)
        {
          v52[9] = v109;
          uint64_t v33 = 1;
          _gss_mg_log(1, "ntlm-isc-type1: %s\\%s", v135, v136, v137, v138, v139, v140, *(void *)(*((void *)v52 + 2) + 8));
          return v33;
        }
      }
      int v99 = v134;
      goto LABEL_64;
    }
    CFArrayRef v35 = v34;
    CFTypeID v36 = CFGetTypeID(v34);
    if (v36 == CFArrayGetTypeID())
    {
      CFIndex Count = CFArrayGetCount(v35);
      if (Count >= 1)
      {
        CFIndex v44 = Count;
        uint64_t v45 = 1;
        do
        {
          CFDictionaryRef ValueAtIndex = CFArrayGetValueAtIndex(v35, v45 - 1);
          if (ValueAtIndex
            && (CFTypeID v47 = CFGetTypeID(ValueAtIndex), v47 == CFStringGetTypeID())
            && (long long v48 = (const char *)rk_cfstring2cstring()) != 0)
          {
            long long v49 = (char *)v48;
            BOOL v50 = fnmatch(v48, a4[1], 16) == 0;
            free(v49);
          }
          else
          {
            BOOL v50 = 0;
          }
          if (v45 >= v44) {
            break;
          }
          ++v45;
        }
        while (!v50);
        CFRelease(v35);
        uint64_t v24 = a11;
        if (v50) {
          goto LABEL_33;
        }
LABEL_59:
        *a1 = 80;
        v98 = a4[1];
        if (!v98) {
          v98 = "???";
        }
        char v151 = (char)v98;
        int v62 = "Not allowed to use NTLM to host %s";
        uint64_t v63 = 851968;
        int v64 = 80;
        return gss_mg_set_error_string((size_t)&__gss_ntlm_mechanism_oid_desc, v63, v64, v62, v19, v20, v21, v22, v151);
      }
    }
    else
    {
      _gss_mg_log(1, "NTLM: invalid type of AllowedHosts", v37, v38, v39, v40, v41, v42, v151);
    }
    CFRelease(v35);
    goto LABEL_59;
  }
  *a1 = 0;
  return 0x100000;
}

uint64_t _gss_ntlm_inquire_context(_DWORD *a1, uint64_t a2, void *a3, void *a4, _DWORD *a5, gss_OID_desc **a6, _DWORD *a7, int *a8, int *a9)
{
  *a1 = 0;
  if (!a2) {
    return 50331648;
  }
  if (a3)
  {
    uint64_t v16 = *(void *)(a2 + 216);
    if (!v16) {
      return 0x80000;
    }
    uint64_t result = _gss_ntlm_duplicate_name(a1, v16, a3);
    if (result) {
      return result;
    }
  }
  if (a4)
  {
    uint64_t v18 = *(void *)(a2 + 224);
    if (v18)
    {
      uint64_t result = _gss_ntlm_duplicate_name(a1, v18, a4);
      if (result) {
        return result;
      }
    }
    else
    {
      *a4 = 0;
    }
  }
  if (a5) {
    *a5 = -1;
  }
  if (a6) {
    *a6 = &__gss_ntlm_mechanism_oid_desc;
  }
  if (a7) {
    *a7 = *(_DWORD *)(a2 + 28);
  }
  if (a8) {
    *a8 = (*(_DWORD *)(a2 + 40) >> 1) & 1;
  }
  uint64_t result = 0;
  if (a9) {
    *a9 = *(_DWORD *)(a2 + 40) & 1;
  }
  return result;
}

uint64_t _gss_ntlm_inquire_cred_by_mech(_DWORD *a1, uint64_t a2, uint64_t a3, void *a4, _DWORD *a5, _DWORD *a6, _DWORD *a7)
{
  if (a4)
  {
    if (a2)
    {
      uint64_t result = _gss_ntlm_duplicate_name(a1, a2, a4);
      if (result) {
        return result;
      }
    }
    else
    {
      *a4 = 0;
    }
  }
  if (a5) {
    *a5 = -1;
  }
  if (a6) {
    *a6 = 0;
  }
  if (a7) {
    *a7 = 1;
  }
  uint64_t result = 0;
  if (a1) {
    *a1 = 0;
  }
  return result;
}

uint64_t _gss_ntlm_inquire_cred(OM_uint32 *minor_status, uint64_t a2, void *a3, _DWORD *a4, _DWORD *a5, gss_OID_set *oid_set)
{
  *OM_uint32 minor_status = 0;
  if (!a2) {
    return 458752;
  }
  if (a3)
  {
    empty_gss_OID_set oid_set = _gss_ntlm_duplicate_name(minor_status, a2, a3);
    if (empty_oid_set) {
      goto LABEL_11;
    }
  }
  if (a4) {
    *a4 = -1;
  }
  if (a5) {
    *a5 = 0;
  }
  if (!oid_set) {
    return 0;
  }
  *gss_OID_set oid_set = 0;
  empty_gss_OID_set oid_set = gss_create_empty_oid_set(minor_status, oid_set);
  if (empty_oid_set
    || (empty_gss_OID_set oid_set = gss_add_oid_set_member(minor_status, &__gss_ntlm_mechanism_oid_desc, oid_set),
        empty_oid_set))
  {
LABEL_11:
    minor_statusgss_OID_desc a = 0;
    gss_release_oid_set(&minor_statusa, oid_set);
  }
  return empty_oid_set;
}

uint64_t _gss_ntlm_destroy_cred(_DWORD *a1, void ***a2)
{
  if (!a2) {
    return 0;
  }
  unsigned int v3 = *a2;
  if (!*a2) {
    return 0;
  }
  if ((_BYTE)v3[2])
  {
    CFUUIDRef v5 = CFUUIDCreateFromUUIDBytes((CFAllocatorRef)*MEMORY[0x263EFFB08], *(CFUUIDBytes *)((char *)v3 + 36));
    if (!v5)
    {
      *a1 = -1765328191;
      return 851968;
    }
    CFUUIDRef v6 = v5;
    *a1 = 0;
    HeimCredDeleteByUUID();
    CFRelease(v6);
  }

  return _gss_ntlm_release_cred(a1, a2);
}

uint64_t _gss_ntlm_cred_hold(_DWORD *a1, uint64_t a2)
{
  if ((*(unsigned char *)(a2 + 16) & 1) == 0) {
    return 851968;
  }
  CFUUIDRef v3 = CFUUIDCreateFromUUIDBytes((CFAllocatorRef)*MEMORY[0x263EFFB08], *(CFUUIDBytes *)(a2 + 36));
  if (!v3)
  {
    *a1 = -1765328191;
    return 851968;
  }
  CFUUIDRef v4 = v3;
  *a1 = 0;
  uint64_t v5 = HeimCredCopyFromUUID();
  if (v5)
  {
    CFUUIDRef v6 = (const void *)v5;
    HeimCredRetainTransient();
    CFRelease(v6);
  }
  CFRelease(v4);
  return 0;
}

uint64_t _gss_ntlm_cred_unhold(_DWORD *a1, uint64_t a2)
{
  if ((*(unsigned char *)(a2 + 16) & 1) == 0) {
    return 851968;
  }
  CFUUIDRef v3 = CFUUIDCreateFromUUIDBytes((CFAllocatorRef)*MEMORY[0x263EFFB08], *(CFUUIDBytes *)(a2 + 36));
  if (!v3)
  {
    *a1 = -1765328191;
    return 851968;
  }
  CFUUIDRef v4 = v3;
  *a1 = 0;
  uint64_t v5 = HeimCredCopyFromUUID();
  if (v5)
  {
    CFUUIDRef v6 = (const void *)v5;
    HeimCredReleaseTransient();
    CFRelease(v6);
  }
  CFRelease(v4);
  return 0;
}

uint64_t _gss_ntlm_cred_label_get(_DWORD *a1, uint64_t a2, const char *a3, CFIndex *a4)
{
  keys[4] = *(void **)MEMORY[0x263EF8340];
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFUUIDRef v8 = CFUUIDCreateFromUUIDBytes((CFAllocatorRef)*MEMORY[0x263EFFB08], *(CFUUIDBytes *)(a2 + 36));
  if (v8)
  {
    CFUUIDRef v9 = v8;
    *a1 = 0;
    CFStringRef v10 = CFStringCreateWithCString(v7, a3, 0x8000100u);
    if (v10)
    {
      uint64_t v11 = (void *)*MEMORY[0x263F47768];
      keys[0] = *(void **)MEMORY[0x263F47780];
      keys[1] = v11;
      long long v12 = (void *)*MEMORY[0x263F47760];
      keys[2] = *(void **)MEMORY[0x263F47758];
      keys[3] = v12;
      size_t v13 = (void *)*MEMORY[0x263F47790];
      values[0] = *(void **)MEMORY[0x263F47778];
      values[1] = v13;
      values[2] = v9;
      values[3] = (void *)v10;
      CFDictionaryRef v14 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 4, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      if (!v14) {
        _gss_ntlm_cred_label_get_cold_1();
      }
      CFDictionaryRef v15 = v14;
      CFArrayRef v16 = (const __CFArray *)HeimCredCopyQuery();
      CFRelease(v15);
      if (CFArrayGetCount(v16) <= 0)
      {
        uint64_t v24 = 0;
        if (!v16) {
          return v24;
        }
        goto LABEL_19;
      }
      CFDictionaryRef ValueAtIndex = CFArrayGetValueAtIndex(v16, 0);
      if (!ValueAtIndex)
      {
        uint64_t v24 = 851968;
        if (!v16) {
          return v24;
        }
        goto LABEL_19;
      }
      uint64_t v18 = ValueAtIndex;
      CFRetain(ValueAtIndex);
      if (v16) {
        CFRelease(v16);
      }
      CFArrayRef v16 = (const __CFArray *)HeimCredCopyAttribute();
      CFRelease(v18);
      if (v16)
      {
        CFIndex Length = CFDataGetLength(v16);
        uint64_t v20 = malloc_type_malloc(Length, 0x843B75B6uLL);
        a4[1] = (CFIndex)v20;
        if (v20)
        {
          uint64_t v21 = v20;
          BytePtr = CFDataGetBytePtr(v16);
          CFIndex v23 = CFDataGetLength(v16);
          memcpy(v21, BytePtr, v23);
          uint64_t v24 = 0;
          *a4 = CFDataGetLength(v16);
        }
        else
        {
          uint64_t v24 = 851968;
        }
LABEL_19:
        CFRelease(v16);
        return v24;
      }
    }
    else
    {
      CFRelease(v9);
    }
  }
  else
  {
    *a1 = -1765328191;
  }
  return 851968;
}

uint64_t _gss_ntlm_cred_label_set(_DWORD *a1, uint64_t a2, const char *a3, uint64_t a4)
{
  keys[3] = *(void **)MEMORY[0x263EF8340];
  if ((*(unsigned char *)(a2 + 16) & 1) == 0) {
    return 851968;
  }
  CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFUUIDRef v9 = CFUUIDCreateFromUUIDBytes((CFAllocatorRef)*MEMORY[0x263EFFB08], *(CFUUIDBytes *)(a2 + 36));
  if (!v9)
  {
    *a1 = -1765328191;
    return 851968;
  }
  CFUUIDRef v10 = v9;
  *a1 = 0;
  CFStringRef v11 = CFStringCreateWithCString(v8, a3, 0x8000100u);
  if (!v11)
  {
    CFRelease(v10);
    return 851968;
  }
  CFStringRef v12 = v11;
  size_t v13 = (void *)*MEMORY[0x263F47758];
  CFDictionaryRef v14 = (void *)*MEMORY[0x263F47768];
  keys[0] = *(void **)MEMORY[0x263F47758];
  keys[1] = v14;
  CFDictionaryRef v15 = (void *)*MEMORY[0x263F47760];
  keys[2] = *(void **)MEMORY[0x263F47760];
  CFArrayRef v16 = (void *)*MEMORY[0x263F47790];
  values[0] = v10;
  values[1] = v16;
  values[2] = (void *)v11;
  CFDictionaryRef v17 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 3, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!v17)
  {
    heim_abort();
LABEL_29:
    heim_abort();
  }
  CFDictionaryRef v18 = v17;
  HeimCredDeleteQuery();
  CFRelease(v18);
  if (!a4)
  {
    uint64_t v28 = 0;
LABEL_18:
    CFRelease(v10);
    uint64_t v30 = v12;
LABEL_27:
    CFRelease(v30);
    return v28;
  }
  CFStringRef v19 = CFStringCreateWithCString(v8, *(const char **)a2, 0x8000100u);
  if (!v19)
  {
    uint64_t v28 = 851968;
    goto LABEL_18;
  }
  CFStringRef v20 = v19;
  CFStringRef v21 = CFStringCreateWithCString(v8, *(const char **)(a2 + 8), 0x8000100u);
  if (!v21)
  {
    CFDataRef v23 = 0;
    goto LABEL_20;
  }
  CFDataRef v22 = CFDataCreateWithBytesNoCopy(0, *(const UInt8 **)(a4 + 8), *(void *)a4, (CFAllocatorRef)*MEMORY[0x263EFFB28]);
  CFDataRef v23 = v22;
  if (!v22)
  {
LABEL_20:
    CFDictionaryRef v26 = 0;
LABEL_21:
    CFRelease(v10);
    CFRelease(v20);
    uint64_t v28 = 851968;
    if (!v21) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  v32[0] = *(void **)MEMORY[0x263F47780];
  v32[1] = v14;
  uint64_t v24 = (void *)*MEMORY[0x263F47750];
  v32[2] = v13;
  v32[3] = v24;
  v32[4] = *(void **)MEMORY[0x263F47720];
  v32[5] = v15;
  v32[6] = *(void **)MEMORY[0x263F47700];
  v31[0] = *(void **)MEMORY[0x263F47778];
  v31[1] = v16;
  v31[2] = v10;
  void v31[3] = (void *)v20;
  v31[4] = (void *)v21;
  v31[5] = (void *)v12;
  v31[6] = v22;
  CFDictionaryRef v25 = CFDictionaryCreate(0, (const void **)v32, (const void **)v31, 7, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!v25) {
    goto LABEL_29;
  }
  CFDictionaryRef v26 = v25;
  uint64_t v27 = (const void *)HeimCredCreate();
  if (!v27) {
    goto LABEL_21;
  }
  CFRelease(v27);
  CFRelease(v10);
  CFRelease(v20);
  uint64_t v28 = 0;
LABEL_22:
  CFRelease(v21);
LABEL_23:
  CFRelease(v12);
  if (v23) {
    CFRelease(v23);
  }
  if (v26)
  {
    uint64_t v30 = v26;
    goto LABEL_27;
  }
  return v28;
}

uint64_t _gss_ntlm_inquire_mechs_for_name(_DWORD *a1, uint64_t a2, void *a3)
{
  if (a1) {
    *a1 = 0;
  }
  if (a3) {
    *a3 = 0;
  }
  return 0;
}

uint64_t _gss_ntlm_process_context_token(_DWORD *a1)
{
  *a1 = 0;
  return 0;
}

uint64_t _gss_ntlm_release_cred(_DWORD *a1, void ***a2)
{
  if (a1) {
    *a1 = 0;
  }
  if (!a2 || !*a2) {
    return 0;
  }
  CFUUIDRef v3 = *a2;
  *a2 = 0;
  return _gss_ntlm_release_name(a1, &v3);
}

uint64_t _gss_ntlm_release_name(_DWORD *a1, void ***a2)
{
  if (a1) {
    *a1 = 0;
  }
  if (a2)
  {
    int v2 = *a2;
    if (*a2)
    {
      *a2 = 0;
      free(*v2);
      free(v2[1]);
      free(v2);
    }
  }
  return 0;
}

uint64_t _gss_ntlm_iter_creds_f(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, gss_OID_desc *, void *))
{
  keys[2] = *(void **)MEMORY[0x263EF8340];
  CFUUIDRef v3 = (void *)*MEMORY[0x263F47768];
  keys[0] = *(void **)MEMORY[0x263F47780];
  keys[1] = v3;
  CFUUIDRef v4 = (void *)*MEMORY[0x263F47790];
  values[0] = *(void **)MEMORY[0x263F47778];
  values[1] = v4;
  CFDictionaryRef v5 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 2, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!v5) {
    _gss_ntlm_cred_label_get_cold_1();
  }
  CFDictionaryRef v6 = v5;
  CFArrayRef v7 = (const __CFArray *)HeimCredCopyQuery();
  CFRelease(v6);
  CFIndex Count = CFArrayGetCount(v7);
  if (Count >= 1)
  {
    for (CFIndex i = 0; i != Count; ++i)
    {
      CFArrayGetValueAtIndex(v7, i);
      CFUUIDRef v9 = (const void *)HeimCredCopyAttribute();
      if (v9) {
        CFUUIDRef v10 = (char *)rk_cfstring2cstring();
      }
      else {
        CFUUIDRef v10 = 0;
      }
      CFStringRef v11 = (const void *)HeimCredCopyAttribute();
      if (v11) {
        CFStringRef v12 = (char *)rk_cfstring2cstring();
      }
      else {
        CFStringRef v12 = 0;
      }
      CFUUIDRef UUID = (const __CFUUID *)HeimCredGetUUID();
      CFUUIDRef v14 = UUID;
      if (UUID)
      {
        CFUUIDBytes v15 = CFUUIDGetUUIDBytes(UUID);
        uint64_t v16 = *(void *)&v15.byte0;
        uint64_t v17 = *(void *)&v15.byte8;
      }
      else
      {
        uint64_t v16 = 0;
        uint64_t v17 = 0;
      }
      CFDictionaryRef v18 = malloc_type_calloc(1uLL, 0x38uLL, 0x10100405C7453BFuLL);
      if (v18)
      {
        CFStringRef v19 = v18;
        if (v10 && v12 && v14)
        {
          void *v18 = strdup(v10);
          v19[1] = strdup(v12);
          *((_DWORD *)v19 + 4) = 1;
          *(void *)((char *)v19 + 36) = v16;
          *(void *)((char *)v19 + 44) = v17;
          a3(a2, &__gss_ntlm_mechanism_oid_desc, v19);
        }
        else
        {
          free(v18);
        }
      }
      free(v10);
      free(v12);
      if (v9) {
        CFRelease(v9);
      }
      if (v11) {
        CFRelease(v11);
      }
    }
  }
  if (v7) {
    CFRelease(v7);
  }
  return ((uint64_t (*)(uint64_t, void, void))a3)(a2, 0, 0);
}

uint64_t _gss_ntlm_inquire_sec_context_by_oid(OM_uint32 *a1, uint64_t a2, gss_const_OID a, gss_buffer_set_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  *a1 = 0;
  if (a2)
  {
    *a4 = 0;
    if (gss_oid_equal(a, &__gss_ntlm_get_session_key_x_oid_desc)
      || gss_oid_equal(a, &__gss_c_inq_sspi_session_key_oid_desc))
    {
      size_t v13 = *(void *)(a2 + 48);
      if (v13)
      {
        CFUUIDRef v14 = *(int **)(a2 + 56);
LABEL_6:
        member_buffer.CFIndex length = v13;
        member_buffer.gss_buffer_desc_struct value = v14;
        return gss_add_buffer_set_member(a1, &member_buffer, a4);
      }
      goto LABEL_15;
    }
    if (gss_oid_equal(a, &__gss_c_inq_win2k_pac_x_oid_desc))
    {
      if (!*(void *)(a2 + 256))
      {
LABEL_15:
        *a1 = 2;
        return 851968;
      }
      return gss_add_buffer_set_member(a1, (gss_buffer_t)(a2 + 256), a4);
    }
    else
    {
      if (gss_oid_equal(a, &__gss_c_ntlm_guest_oid_desc))
      {
        int v16 = (*(_DWORD *)(a2 + 32) >> 3) & 1;
        size_t v13 = 4;
        CFUUIDRef v14 = &v16;
        goto LABEL_6;
      }
      if (!gss_oid_equal(a, &__gss_c_peer_has_updated_spnego_oid_desc))
      {
        if (gss_oid_equal(a, &__gss_c_ntlm_reset_keys_oid_desc))
        {
          _gss_ntlm_set_keys(a2);
          return 0;
        }
        *a1 = 0;
        return 851968;
      }
      if ((*(unsigned char *)(a2 + 38) & 8) != 0) {
        return 0;
      }
      else {
        return 851968;
      }
    }
  }
  else
  {
    return gss_mg_set_error_string((size_t)&__gss_ntlm_mechanism_oid_desc, 0x80000, 0, "no context", a5, a6, a7, a8, a9);
  }
}

uint64_t __gss_scram_initialize()
{
  return 0;
}

uint64_t _netlogon_delete_sec_context(OM_uint32 *minor_status, uint64_t *a2, void *a3)
{
  if (a2)
  {
    uint64_t v5 = *a2;
    if (*a2)
    {
      *a2 = 0;
      _netlogon_release_name(minor_status, (gss_buffer_t *)(v5 + 96));
      _netlogon_release_name(minor_status, (gss_buffer_t *)(v5 + 104));
      pthread_mutex_destroy((pthread_mutex_t *)v5);
      *(_OWORD *)uint64_t v5 = 0u;
      *(_OWORD *)(v5 + 16) = 0u;
      *(_OWORD *)(v5 + 32) = 0u;
      *(_OWORD *)(v5 + 48) = 0u;
      *(_OWORD *)(v5 + 64) = 0u;
      *(_OWORD *)(v5 + 80) = 0u;
      *(_OWORD *)(v5 + 96) = 0u;
      *(_OWORD *)(v5 + 112) = 0u;
      free((void *)v5);
    }
  }
  if (a3)
  {
    *a3 = 0;
    a3[1] = 0;
  }
  *OM_uint32 minor_status = 0;
  return 0;
}

uint64_t _netlogon_init_sec_context(OM_uint32 *a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, __int16 a6, uint64_t a7, uint64_t a8, void *a9, gss_OID_desc **a10, size_t *a11, _DWORD *a12, _DWORD *a13)
{
  uint64_t v13 = *a3;
  *a1 = 0;
  *a11 = 0;
  a11[1] = 0;
  if (!a2) {
    return 458752;
  }
  if (!a4) {
    return 0x20000;
  }
  if (!v13)
  {
    if (*a9) {
      return 589824;
    }
    CFStringRef v21 = malloc_type_calloc(1uLL, 0x80uLL, 0x102004039E40906uLL);
    uint64_t v13 = (uint64_t)v21;
    if (v21)
    {
      v21[16] = 0;
      *((unsigned char *)v21 + 72) = 1;
      v21[19] = 1;
      pthread_mutex_init((pthread_mutex_t *)v21, 0);
      pthread_mutex_lock((pthread_mutex_t *)v13);
      *a3 = v13;
      *(_DWORD *)(v13 + 68) = a6 & 0x103E;
      *(_DWORD *)(v13 + 80) = *(_DWORD *)(a2 + 8);
      uint64_t initial_auth_message = _netlogon_duplicate_name(a1, *(void *)a2, (gss_buffer_desc_struct **)(v13 + 96));
      if (!WORD1(initial_auth_message))
      {
        uint64_t initial_auth_message = _netlogon_duplicate_name(a1, a4, (gss_buffer_desc_struct **)(v13 + 104));
        if (!WORD1(initial_auth_message))
        {
          *(_OWORD *)(v13 + 112) = *(_OWORD *)(a2 + 12);
          uint64_t initial_auth_message = _netlogon_make_initial_auth_message((int *)a1, v13, a11);
          if (initial_auth_message < 0x10000) {
            goto LABEL_13;
          }
        }
      }
    }
    else
    {
      *a1 = 12;
      uint64_t initial_auth_message = 851968;
    }
    pthread_mutex_unlock((pthread_mutex_t *)v13);
LABEL_31:
    OM_uint32 minor_status = 0;
    _netlogon_delete_sec_context(&minor_status, a3, 0);
    return initial_auth_message;
  }
  pthread_mutex_lock((pthread_mutex_t *)v13);
  if (*(_DWORD *)(v13 + 64))
  {
    uint64_t initial_auth_message = 851968;
    int v18 = 22;
LABEL_6:
    *a1 = v18;
    goto LABEL_13;
  }
  if (*a9 >= 8uLL)
  {
    CFDataRef v22 = (_DWORD *)a9[1];
    uint64_t v25 = 0;
    _gss_mg_decode_le_uint32(v22, &v25);
    _gss_mg_decode_le_uint32(v22 + 1, (_DWORD *)&v25 + 1);
    uint64_t initial_auth_message = 589824;
    if (v25 == 1)
    {
      int v18 = HIDWORD(v25);
      if (!HIDWORD(v25))
      {
        uint64_t initial_auth_message = 0;
        *(_DWORD *)(v13 + 64) = 1;
        goto LABEL_6;
      }
    }
  }
  else
  {
    uint64_t initial_auth_message = 589824;
  }
LABEL_13:
  if (a12) {
    *a12 = *(_DWORD *)(v13 + 68);
  }
  if (a13) {
    *a13 = -1;
  }
  if (a10) {
    *a10 = &__gss_netlogon_mechanism_oid_desc;
  }
  pthread_mutex_unlock((pthread_mutex_t *)v13);
  if (initial_auth_message >= 2) {
    goto LABEL_31;
  }
  return initial_auth_message;
}

uint64_t _netlogon_make_initial_auth_message(int *a1, uint64_t a2, size_t *a3)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v6 = *(void *)(a2 + 104);
  if (*(void *)v6)
  {
    v30[0] = *(_OWORD *)v6;
    ++*(void *)&v30[0];
    uint64_t v7 = 1;
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
  }
  uint64_t v9 = *(void *)(a2 + 96);
  if (*(void *)v9)
  {
    uint64_t v7 = v7 | 2;
    v30[v8] = *(_OWORD *)v9;
    ++*(void *)&v30[v8++];
  }
  uint64_t v11 = *(void *)(v6 + 16);
  uint64_t v10 = v6 + 16;
  if (v11)
  {
    CFStringRef v12 = &v30[v8];
    *CFStringRef v12 = 512;
    v12[1] = v29;
    uint64_t result = _netlogon_encode_dns_string(a1, v10, (uint64_t)v12);
    if (WORD1(result)) {
      return result;
    }
    uint64_t v7 = v7 | 4;
    ++v8;
    uint64_t v9 = *(void *)(a2 + 96);
    uint64_t v14 = 1;
  }
  else
  {
    uint64_t v14 = 0;
  }
  if (*(void *)(v9 + 16))
  {
    CFUUIDBytes v15 = &v30[v8];
    void *v15 = 512;
    v15[1] = &v29[512 * v14];
    uint64_t result = _netlogon_encode_dns_string(a1, v9 + 16, (uint64_t)v15);
    if (WORD1(result)) {
      return result;
    }
    ++v14;
    uint64_t v7 = v7 | 8;
    ++v8;
    uint64_t v9 = *(void *)(a2 + 96);
  }
  if (*(void *)v9)
  {
    int v16 = &v30[v8];
    *int v16 = 512;
    v16[1] = &v29[512 * v14];
    uint64_t result = _netlogon_encode_dns_string(a1, v9, (uint64_t)v16);
    if (WORD1(result)) {
      return result;
    }
    uint64_t v7 = v7 | 0x10;
    ++v8;
    goto LABEL_17;
  }
  if (v8)
  {
LABEL_17:
    uint64_t v17 = (uint64_t *)v30;
    size_t v18 = 8;
    uint64_t v19 = v8;
    do
    {
      uint64_t v20 = *v17;
      v17 += 2;
      v18 += v20;
      --v19;
    }
    while (v19);
    char v21 = 0;
    goto LABEL_21;
  }
  char v21 = 1;
  size_t v18 = 8;
LABEL_21:
  CFDataRef v22 = malloc_type_malloc(v18, 0x44EB2717uLL);
  a3[1] = (size_t)v22;
  if (v22)
  {
    CFDataRef v23 = v22;
    _gss_mg_encode_le_uint32(0, v22);
    _gss_mg_encode_le_uint32(v7, v23 + 1);
    uint64_t v24 = (char *)(v23 + 2);
    if ((v21 & 1) == 0)
    {
      uint64_t v25 = (const void **)v30 + 1;
      do
      {
        size_t v26 = (size_t)*(v25 - 1);
        if (!v26) {
          _netlogon_make_initial_auth_message_cold_2();
        }
        uint64_t v27 = *v25;
        if (*((char *)*v25 + v26 - 1)) {
          _netlogon_make_initial_auth_message_cold_3();
        }
        v25 += 2;
        memcpy(v24, v27, v26);
        v24 += v26;
        --v8;
      }
      while (v8);
    }
    *a3 = v18;
    if (v24 != (char *)(a3[1] + v18)) {
      _netlogon_make_initial_auth_message_cold_1();
    }
    int v28 = 0;
    uint64_t result = 1;
  }
  else
  {
    uint64_t result = 851968;
    int v28 = 12;
  }
  *a1 = v28;
  return result;
}

uint64_t _netlogon_encode_dns_string(int *a1, uint64_t a2, uint64_t a3)
{
  bzero(*(void **)(a3 + 8), *(void *)a3);
  int v6 = res_9_ns_name_compress(*(const char **)(a2 + 8), *(u_char **)(a3 + 8), *(void *)a3, 0, 0);
  if (v6 < 0)
  {
    int v8 = *__error();
    uint64_t result = 851968;
  }
  else
  {
    unsigned int v7 = v6;
    int v8 = 0;
    uint64_t result = 0;
    *(void *)a3 = v7;
  }
  *a1 = v8;
  return result;
}

void *__gss_netlogon_initialize()
{
  return &netlogon_mech;
}

uint64_t _netlogon_accept_sec_context(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void *a7, void *a8, _DWORD *a9, _DWORD *a10, void *a11)
{
  *a8 = 0;
  a8[1] = 0;
  *a1 = 0;
  if (a2 && a4)
  {
    if (a6) {
      *a6 = 0;
    }
    if (a7) {
      *a7 = 0;
    }
    if (a9) {
      *a9 = 0;
    }
    if (a10) {
      *a10 = 0;
    }
    if (a11) {
      *a11 = 0;
    }
    *a1 = 12;
  }
  return 851968;
}

uint64_t _netlogon_acquire_cred(OM_uint32 *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, void *a6, void *a7, _DWORD *a8)
{
  if (a5 != 1) {
    return 851968;
  }
  if (!a2) {
    return 0x20000;
  }
  uint64_t v13 = malloc_type_calloc(1uLL, 0x20uLL, 0x1080040DCAC275BuLL);
  if (!v13)
  {
    *a1 = 12;
    return 851968;
  }
  uint64_t v14 = v13;
  *((_DWORD *)v13 + 2) = 7995511;
  uint64_t v15 = _netlogon_duplicate_name(a1, a2, (gss_buffer_desc_struct **)v13);
  if (v15 >= 0x10000)
  {
    uint64_t v16 = v15;
    free(v14);
  }
  else
  {
    *a6 = v14;
    if (a7) {
      *a7 = 0;
    }
    uint64_t v16 = 0;
    if (a8) {
      *a8 = -1;
    }
  }
  return v16;
}

uint64_t _netlogon_set_cred_option(int *a1, uint64_t *a2, gss_const_OID a, void *a4)
{
  if (!a4) {
    goto LABEL_18;
  }
  if (gss_oid_equal(a, &__gss_netlogon_set_session_key_x_oid_desc))
  {
    if (*a2)
    {
      if (*a4 == 16)
      {
        int v8 = 0;
        uint64_t result = 0;
        *(_OWORD *)(*a2 + 12) = *(_OWORD *)a4[1];
        goto LABEL_19;
      }
LABEL_20:
      uint64_t result = 851968;
      int v8 = 34;
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (!gss_oid_equal(a, &__gss_netlogon_set_sign_algorithm_x_oid_desc)) {
    goto LABEL_18;
  }
  uint64_t v10 = *a2;
  if (!*a2) {
    goto LABEL_18;
  }
  if (*a4 != 2) {
    goto LABEL_20;
  }
  int v11 = *(unsigned __int16 *)a4[1];
  if (v11 != 119 && v11 != 19)
  {
LABEL_18:
    uint64_t result = 851968;
    int v8 = 22;
    goto LABEL_19;
  }
  int v8 = 0;
  uint64_t result = 0;
  *(_WORD *)(v10 + 8) = v11;
  if (v11 == 19) {
    __int16 v13 = 26;
  }
  else {
    __int16 v13 = 122;
  }
  *(_WORD *)(v10 + 10) = v13;
LABEL_19:
  *a1 = v8;
  return result;
}

uint64_t _netlogon_add_cred(OM_uint32 *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t *a8, void *a9, _DWORD *a10, _DWORD *a11)
{
  int v18 = 0;
  if (a2 && a3)
  {
    uint64_t result = _netlogon_compare_name(a1, a3, *(void *)a2, &v18);
    if (WORD1(result)) {
      return result;
    }
    if (!v18) {
      return 0x20000;
    }
  }
  else if (!a2)
  {
    uint64_t result = _netlogon_acquire_cred(a1, a3, a6, 0, a5, a8, a9, a10);
    if (result >= 0x10000) {
      return result;
    }
    goto LABEL_10;
  }
  uint64_t result = _netlogon_acquire_cred(a1, *(void *)a2, a6, 0, a5, a8, a9, a10);
  if (result >= 0x10000) {
    return result;
  }
  uint64_t v17 = *a8;
  *(_DWORD *)(v17 + 8) = *(_DWORD *)(a2 + 8);
  *(_OWORD *)(v17 + 12) = *(_OWORD *)(a2 + 12);
LABEL_10:
  uint64_t result = 0;
  if (a11) {
    *a11 = 0;
  }
  return result;
}

uint64_t _netlogon_canonicalize_name(OM_uint32 *a1, uint64_t a2, uint64_t a3, gss_buffer_desc_struct **a4)
{
  return _netlogon_duplicate_name(a1, a2, a4);
}

uint64_t _netlogon_compare_name(_DWORD *a1, uint64_t a2, uint64_t a3, _DWORD *a4)
{
  *a4 = 0;
  int v8 = *(const char **)(a2 + 8);
  if (v8)
  {
    uint64_t v9 = *(const char **)(a3 + 8);
    if (v9) {
      *a4 = strcasecmp(v8, v9) == 0;
    }
  }
  uint64_t v10 = *(const char **)(a2 + 24);
  if (v10)
  {
    int v11 = *(const char **)(a3 + 24);
    if (v11) {
      *a4 = strcasecmp(v10, v11) == 0;
    }
  }
  *a1 = 0;
  return 0;
}

uint64_t _netlogon_context_time(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if (a3) {
    *a3 = -1;
  }
  return 0;
}

uint64_t _netlogon_display_name(int *a1, uint64_t a2, void *a3, void *a4)
{
  if (a4) {
    *a4 = 0;
  }
  if (a3)
  {
    uint64_t v6 = *(void *)(a2 + 16);
    BOOL v7 = v6 == 0;
    uint64_t v8 = 16 * (v6 != 0);
    if (v7) {
      uint64_t v9 = a2;
    }
    else {
      uint64_t v9 = a2 + 16;
    }
    uint64_t v10 = malloc_type_malloc(*(void *)(a2 + v8) + 1, 0x984EF18FuLL);
    a3[1] = v10;
    if (v10)
    {
      memcpy(v10, *(const void **)(v9 + 8), *(void *)v9);
      int v11 = 0;
      uint64_t result = 0;
      *(unsigned char *)(a3[1] + *(void *)v9) = 0;
      *a3 = *(void *)v9;
    }
    else
    {
      uint64_t result = 851968;
      int v11 = 12;
    }
  }
  else
  {
    int v11 = 0;
    uint64_t result = 0;
  }
  *a1 = v11;
  return result;
}

uint64_t _netlogon_display_status(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, _DWORD *a5, void *a6)
{
  if (a1) {
    *a1 = 0;
  }
  if (a6)
  {
    *a6 = 0;
    a6[1] = 0;
  }
  if (a5) {
    *a5 = 0;
  }
  return 0;
}

uint64_t _netlogon_duplicate_name(OM_uint32 *a1, uint64_t a2, gss_buffer_desc_struct **a3)
{
  uint64_t v6 = (gss_buffer_desc_struct *)malloc_type_calloc(1uLL, 0x20uLL, 0x10800403AF1B36BuLL);
  gss_buffer_t v14 = v6;
  if (v6)
  {
    BOOL v7 = v6;
    uint64_t v8 = malloc_type_malloc(*(void *)a2 + 1, 0x5811222AuLL);
    v7->gss_buffer_desc_struct value = v8;
    if (v8)
    {
      memcpy(v8, *(const void **)(a2 + 8), *(void *)a2);
      size_t v9 = *(void *)a2;
      v7->CFIndex length = *(void *)a2;
      *((unsigned char *)v7->value + v9) = 0;
      uint64_t v10 = *(void *)(a2 + 16);
      if (!v10)
      {
LABEL_6:
        uint64_t result = 0;
        *a1 = 0;
        *a3 = v7;
        return result;
      }
      int v11 = malloc_type_malloc(v10 + 1, 0xBEE84176uLL);
      v7[1].gss_buffer_desc_struct value = v11;
      if (v11)
      {
        memcpy(v11, *(const void **)(a2 + 24), *(void *)(a2 + 16));
        size_t v12 = *(void *)(a2 + 16);
        v7[1].CFIndex length = v12;
        *((unsigned char *)v7[1].value + v12) = 0;
        goto LABEL_6;
      }
    }
  }
  _netlogon_release_name(a1, &v14);
  *a1 = 12;
  return 851968;
}

uint64_t _netlogon_export_name()
{
  return 0x100000;
}

uint64_t _netlogon_export_sec_context(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3)
  {
    *a3 = 0;
    a3[1] = 0;
  }
  return 0x100000;
}

uint64_t _netlogon_import_name(OM_uint32 *a1, size_t *a2, gss_const_OID a, gss_buffer_desc_struct **a4)
{
  if (gss_oid_equal(a, &__gss_netlogon_nt_netbios_dns_name_oid_desc))
  {
    BOOL v7 = (const char *)a2[1];
    size_t v8 = strlen(v7);
    size_t v9 = *a2;
    uint64_t v10 = (gss_buffer_desc_struct *)malloc_type_calloc(1uLL, 0x20uLL, 0x10800403AF1B36BuLL);
    gss_buffer_t v19 = v10;
    if (v10)
    {
      int v11 = v10;
      size_t v12 = malloc_type_malloc(v8 + 1, 0xF71E659uLL);
      v11->gss_buffer_desc_struct value = v12;
      if (v12)
      {
        memcpy(v12, v7, v8 + 1);
        v11->CFIndex length = v8;
        if (v8)
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            gss_buffer_desc_struct value = v11->value;
            value[i] = __toupper((char)value[i]);
          }
        }
        if (v8 >= v9) {
          goto LABEL_11;
        }
        uint64_t v15 = &v7[v8 + 1];
        if (!*v15) {
          goto LABEL_11;
        }
        uint64_t v16 = strdup(v15);
        v11[1].gss_buffer_desc_struct value = v16;
        if (v16)
        {
          v11[1].CFIndex length = strlen(v15);
LABEL_11:
          int v17 = 0;
          uint64_t result = 0;
          *a4 = v11;
LABEL_13:
          *a1 = v17;
          return result;
        }
      }
    }
    _netlogon_release_name(a1, &v19);
    uint64_t result = 851968;
    int v17 = 12;
    goto LABEL_13;
  }
  return 0x20000;
}

uint64_t _netlogon_import_sec_context(_DWORD *a1, uint64_t a2, void *a3)
{
  *a1 = 0;
  if (a3) {
    *a3 = 0;
  }
  return 0x100000;
}

uint64_t _netlogon_inquire_context(OM_uint32 *a1, uint64_t a2, gss_buffer_desc_struct **a3, gss_buffer_desc_struct **a4, uint64_t a5, gss_OID_desc **a6, _DWORD *a7, _DWORD *a8, _DWORD *a9)
{
  if (!a3 || (uint64_t result = _netlogon_duplicate_name(a1, *(void *)(a2 + 96), a3), !WORD1(result)))
  {
    if (!a4 || (uint64_t result = _netlogon_duplicate_name(a1, *(void *)(a2 + 104), a4), !WORD1(result)))
    {
      if (a6) {
        *a6 = &__gss_netlogon_mechanism_oid_desc;
      }
      if (a7) {
        *a7 = *(_DWORD *)(a2 + 68);
      }
      if (a8) {
        *a8 = *(unsigned __int8 *)(a2 + 72);
      }
      uint64_t result = 0;
      if (a9) {
        *a9 = *(_DWORD *)(a2 + 64) == 1;
      }
    }
  }
  return result;
}

uint64_t _netlogon_inquire_cred_by_mech(OM_uint32 *a1, uint64_t *a2, uint64_t a3, gss_buffer_desc_struct **a4, _DWORD *a5, _DWORD *a6, _DWORD *a7)
{
  if (!a4 || (uint64_t result = _netlogon_duplicate_name(a1, *a2, a4), !WORD1(result)))
  {
    if (a5) {
      *a5 = -1;
    }
    if (a6) {
      *a6 = -1;
    }
    if (a7) {
      *a7 = 1;
    }
    uint64_t result = 0;
    *a1 = 0;
  }
  return result;
}

uint64_t _netlogon_inquire_cred(OM_uint32 *a1, uint64_t *a2, gss_buffer_desc_struct **a3, _DWORD *a4, _DWORD *a5, void *a6)
{
  *a1 = 0;
  if (!a2) {
    return 458752;
  }
  if (!a3 || (uint64_t result = _netlogon_duplicate_name(a1, *a2, a3), !WORD1(result)))
  {
    if (a4) {
      *a4 = -1;
    }
    if (a5) {
      *a5 = 1;
    }
    uint64_t result = 0;
    if (a6) {
      *a6 = 0;
    }
  }
  return result;
}

uint64_t _netlogon_inquire_mechs_for_name(_DWORD *a1, uint64_t a2, void *a3)
{
  if (a3) {
    *a3 = 0;
  }
  *a1 = 0;
  return 0;
}

uint64_t _netlogon_inquire_names_for_mech(OM_uint32 *a1, int a2, gss_OID_set *oid_set)
{
  empty_gss_OID_set oid_set = gss_create_empty_oid_set(a1, oid_set);
  if (!empty_oid_set)
  {
    empty_gss_OID_set oid_set = gss_add_oid_set_member(a1, &__gss_netlogon_nt_netbios_dns_name_oid_desc, oid_set);
    if (empty_oid_set)
    {
      OM_uint32 minor_status = 0;
      gss_release_oid_set(&minor_status, oid_set);
    }
    else
    {
      *a1 = 0;
    }
  }
  return empty_oid_set;
}

uint64_t _netlogon_iter_creds_f(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, void, void))
{
  return a3(a2, 0, 0);
}

uint64_t _netlogon_process_context_token(_DWORD *a1)
{
  *a1 = 0;
  return 0;
}

uint64_t _netlogon_release_cred(OM_uint32 *a1, gss_buffer_t **a2)
{
  int v2 = *a2;
  if (*a2)
  {
    _netlogon_release_name(a1, *a2);
    *(_OWORD *)int v2 = 0u;
    *((_OWORD *)v2 + 1) = 0u;
    free(v2);
    *a2 = 0;
  }
  return 0;
}

uint64_t _netlogon_release_name(OM_uint32 *minor_status, gss_buffer_t *a2)
{
  gss_buffer_t v3 = *a2;
  if (*a2)
  {
    gss_release_buffer(minor_status, *a2);
    gss_release_buffer(minor_status, v3 + 1);
    free(v3);
    *a2 = 0;
  }
  *OM_uint32 minor_status = 0;
  return 0;
}

uint64_t _netlogon_wrap_iov(int *a1, uint64_t a2, int a3, uint64_t a4, _DWORD *a5, unsigned __int16 *a6, int a7)
{
  v23[7] = *MEMORY[0x263EF8340];
  memset((char *)&v23[4] + 2, 0, 22);
  memset((char *)v23 + 2, 0, 32);
  if (*(_DWORD *)(a2 + 64) != 1 || (gss_buffer_desc_struct buffer = _gss_mg_find_buffer(a6, a7, 2)) == 0)
  {
    uint64_t result = 851968;
    int v18 = 22;
    goto LABEL_9;
  }
  gss_buffer_t v14 = buffer;
  uint64_t v15 = 24;
  if (*(_WORD *)(a2 + 80) == 19) {
    uint64_t v15 = 48;
  }
  size_t v16 = v15 + 8 * (a3 != 0);
  if ((buffer[1] & 1) == 0)
  {
    if (*((void *)buffer + 1) < v16)
    {
      uint64_t result = 851968;
      int v18 = -1765328194;
LABEL_9:
      *a1 = v18;
      return result;
    }
    *((void *)buffer + 1) = v16;
LABEL_14:
    bzero(*((void **)v14 + 2), v16);
    LOWORD(v23[0]) = *(_WORD *)(a2 + 80);
    if (a3)
    {
      WORD1(v23[0]) = *(_WORD *)(a2 + 82);
      krb5_generate_random_block();
    }
    else
    {
      WORD1(v23[0]) = -1;
    }
    HIDWORD(v23[0]) = 0xFFFF;
    pthread_mutex_lock((pthread_mutex_t *)a2);
    uint64_t v19 = *(unsigned int *)(a2 + 92);
    int v20 = *(unsigned __int8 *)(a2 + 72);
    _gss_mg_encode_be_uint32(*(unsigned int *)(a2 + 88), &v23[1]);
    _gss_mg_encode_be_uint32(v19, (_DWORD *)&v23[1] + 1);
    if (v20) {
      BYTE4(v23[1]) |= 0x80u;
    }
    ++*(void *)(a2 + 88);
    pthread_mutex_unlock((pthread_mutex_t *)a2);
    _netlogon_digest(a2, (uint64_t)v23, (uint64_t)a6, a7, &v23[2]);
    if (a3) {
      _netlogon_seal((int8x16_t *)a2, (uint64_t)v23, (uint64_t)a6, a7);
    }
    _netlogon_seq(a2, v23);
    unint64_t v22 = *((void *)v14 + 1);
    char v21 = (void *)*((void *)v14 + 2);
    void *v21 = v23[0];
    if (v22 >= 9)
    {
      v21[1] = v23[1];
      if (v22 >= 0x11)
      {
        krb5_int32 v21[2] = v23[2];
        if (SWORD1(v23[0]) != -1) {
          v21[3] = v23[3];
        }
      }
    }
    int v18 = 0;
    uint64_t result = 0;
    if (a5) {
      *a5 = a3;
    }
    goto LABEL_9;
  }
  uint64_t result = _gss_mg_allocate_buffer(a1, (uint64_t)buffer, v16);
  if (!WORD1(result))
  {
    size_t v16 = *((void *)v14 + 1);
    goto LABEL_14;
  }
  return result;
}

void _netlogon_digest(uint64_t a1, uint64_t a2, uint64_t a3, int a4, void *a5)
{
  LODWORD(v6) = a4;
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (*(_WORD *)a2 == 19)
  {
    memset(&ctx, 0, sizeof(ctx));
    data[0] = 19;
    data[1] = *(_WORD *)(a2 + 2);
    int v22 = *(_DWORD *)(a2 + 4);
    CCHmacInit(&ctx, 2u, (const void *)(a1 + 112), 0x10uLL);
    CCHmacUpdate(&ctx, data, 8uLL);
    if (*(__int16 *)(a2 + 2) != -1) {
      CCHmacUpdate(&ctx, (const void *)(a2 + 24), 8uLL);
    }
    if ((int)v6 >= 1)
    {
      uint64_t v10 = (const void **)(a3 + 16);
      uint64_t v6 = v6;
      do
      {
        unsigned int v11 = *((unsigned __int16 *)v10 - 8);
        BOOL v12 = v11 > 0xB;
        int v13 = (1 << v11) & 0xA02;
        if (!v12 && v13 != 0) {
          CCHmacUpdate(&ctx, *v10, (size_t)*(v10 - 1));
        }
        v10 += 3;
        --v6;
      }
      while (v6);
    }
    CCHmacFinal(&ctx, macOut);
    uint64_t v15 = macOut[0];
  }
  else
  {
    macOut[0] = *(void *)a2;
    CCDigestCreate();
    CCDigestUpdate();
    CCDigestUpdate();
    if (*(__int16 *)(a2 + 2) != -1) {
      CCDigestUpdate();
    }
    if ((int)v6 >= 1)
    {
      uint64_t v16 = a3 + 16;
      uint64_t v6 = v6;
      do
      {
        unsigned int v17 = *(unsigned __int16 *)(v16 - 16);
        BOOL v12 = v17 > 0xB;
        int v18 = (1 << v17) & 0xA02;
        if (!v12 && v18 != 0) {
          CCDigestUpdate();
        }
        v16 += 24;
        --v6;
      }
      while (v6);
    }
    CCDigestFinal();
    CCDigestDestroy();
    CCHmac(1u, (const void *)(a1 + 112), 0x10uLL, &ctx, 0x10uLL, &ctx);
    uint64_t v15 = *(void *)ctx.ctx;
  }
  *a5 = v15;
}

uint64_t _netlogon_seal(int8x16_t *a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  hc_EVP_CIPHER_CTX_init();
  v8.i64[0] = 0xF0F0F0F0F0F0F0F0;
  v8.i64[1] = 0xF0F0F0F0F0F0F0F0;
  if (*(_WORD *)(a2 + 2) == 26)
  {
    int8x16_t key = veorq_s8(a1[7], v8);
    hc_EVP_aes_128_cfb8();
    hc_EVP_CipherInit_ex();
  }
  else
  {
    int8x16_t key = veorq_s8(a1[7], v8);
    _netlogon_derive_rc4_hmac_key(&key, (const void *)(a2 + 8));
  }
  hc_EVP_Cipher();
  if (*(_WORD *)(a2 + 2) == 122)
  {
    hc_EVP_CipherFinal_ex();
    v9.i64[0] = 0xF0F0F0F0F0F0F0F0;
    v9.i64[1] = 0xF0F0F0F0F0F0F0F0;
    int8x16_t key = veorq_s8(a1[7], v9);
    _netlogon_derive_rc4_hmac_key(&key, (const void *)(a2 + 8));
  }
  int v12 = 0;
  if (a4 >= 1)
  {
    int v10 = 0;
    do
    {
      if ((*(unsigned __int16 *)(a3 + 24 * v10) | 8) == 9)
      {
        hc_EVP_Cipher();
        int v10 = v12;
      }
      int v12 = ++v10;
    }
    while (v10 < a4);
  }
  hc_EVP_CipherFinal_ex();
  return hc_EVP_CIPHER_CTX_cleanup();
}

uint64_t _netlogon_seq(uint64_t a1, _WORD *a2)
{
  if (*a2 == 19)
  {
    hc_EVP_aes_128_cfb8();
    hc_EVP_CipherInit_ex();
  }
  else
  {
    _netlogon_derive_rc4_hmac_key((void *)(a1 + 112), a2 + 8);
  }
  hc_EVP_Cipher();
  return hc_EVP_CIPHER_CTX_cleanup();
}

uint64_t _netlogon_unwrap_iov(int *a1, int8x16_t *a2, _DWORD *a3, _DWORD *a4, unsigned __int16 *a5, int a6)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  if (a2[4].i32[0] != 1 || (gss_buffer_desc_struct buffer = _gss_mg_find_buffer(a5, a6, 2)) == 0)
  {
    *a1 = 22;
    return 851968;
  }
  long long v33 = 0u;
  long long v34 = 0u;
  unint64_t v13 = *((void *)buffer + 1);
  if (v13 < 0x10) {
    goto LABEL_12;
  }
  uint64_t v14 = (__int16 *)*((void *)buffer + 2);
  __int16 v27 = *v14;
  int v15 = (unsigned __int16)v14[1];
  __int16 v28 = v14[1];
  int v16 = (unsigned __int16)v14[2];
  __int16 v29 = v14[2];
  __int16 v30 = v14[3];
  uint64_t v31 = *((void *)v14 + 1);
  if (v27 == 119)
  {
    unint64_t v17 = 32;
  }
  else
  {
    if (v27 != 19)
    {
      int v19 = 22;
      goto LABEL_13;
    }
    unint64_t v17 = 56;
  }
  if (v15 == 0xFFFF) {
    v17 -= 8;
  }
  if (v17 > v13)
  {
LABEL_12:
    int v19 = -1765328194;
LABEL_13:
    *a1 = v19;
    return 589824;
  }
  uint64_t v32 = *((void *)v14 + 2);
  if (v15 == 0xFFFF)
  {
    if (v27 == a2[5].i16[0])
    {
      if (v16 != 0xFFFF) {
        return 589824;
      }
      goto LABEL_27;
    }
    return 393216;
  }
  *(void *)&long long v33 = *((void *)v14 + 3);
  if (v27 != a2[5].i16[0]) {
    return 393216;
  }
  if (v15 != a2[5].u16[1] || v16 != 0xFFFF) {
    return 589824;
  }
LABEL_27:
  _netlogon_seq((uint64_t)a2, &v27);
  if ((a2[4].i8[8] == 0) != BYTE4(v31) >> 7) {
    return 8;
  }
  unsigned int v25 = 0;
  v26[0] = 0;
  BYTE4(v31) &= ~0x80u;
  _gss_mg_decode_be_uint32((unsigned int *)&v31, v26);
  _gss_mg_decode_be_uint32((unsigned int *)&v31 + 1, &v25);
  uint64_t v23 = v25;
  uint64_t v22 = v26[0];
  if (v28 != -1) {
    _netlogon_seal(a2, (uint64_t)&v27, (uint64_t)a5, a6);
  }
  _netlogon_digest((uint64_t)a2, (uint64_t)&v27, (uint64_t)a5, a6, v26);
  if (v32 != *(void *)v26) {
    return 393216;
  }
  uint64_t v24 = v22 | (v23 << 32);
  pthread_mutex_lock((pthread_mutex_t *)a2);
  if (v24 == a2[5].i64[1])
  {
    uint64_t v18 = 0;
    a2[5].i64[1] = v24 + 1;
  }
  else
  {
    uint64_t v18 = 8;
  }
  pthread_mutex_unlock((pthread_mutex_t *)a2);
  if (a3) {
    *a3 = v28 != -1;
  }
  if (a4) {
    *a4 = 0;
  }
  *a1 = 0;
  return v18;
}

uint64_t _netlogon_wrap_iov_length(int *a1, uint64_t a2, int a3, uint64_t a4, _DWORD *a5, unsigned __int16 *a6, int a7)
{
  gss_buffer_desc_struct buffer = _gss_mg_find_buffer(a6, a7, 2);
  if (buffer)
  {
    uint64_t v14 = 24;
    if (*(_WORD *)(a2 + 80) == 19) {
      uint64_t v14 = 48;
    }
    if (a3) {
      v14 += 8;
    }
    *((void *)buffer + 1) = v14;
    int v15 = _gss_mg_find_buffer(a6, a7, 9);
    if (v15) {
      *((void *)v15 + 1) = 0;
    }
    int v16 = _gss_mg_find_buffer(a6, a7, 7);
    if (v16) {
      *((void *)v16 + 1) = 0;
    }
    int v17 = 0;
    uint64_t result = 0;
    if (a5) {
      *a5 = a3;
    }
  }
  else
  {
    uint64_t result = 851968;
    int v17 = 22;
  }
  *a1 = v17;
  return result;
}

double _netlogon_get_mic(int *a1, uint64_t a2, uint64_t a3, long long *a4, _OWORD *a5)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v7 = 1;
  long long v8 = *a4;
  int v9 = 65538;
  long long v10 = 0uLL;
  if (!_netlogon_wrap_iov(a1, a2, 0, (uint64_t)a4, 0, (unsigned __int16 *)&v7, 2))
  {
    double result = *(double *)&v10;
    *a5 = v10;
  }
  return result;
}

uint64_t _netlogon_verify_mic(int *a1, int8x16_t *a2, long long *a3, long long *a4, _DWORD *a5)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v6 = 1;
  long long v7 = *a3;
  int v8 = 2;
  long long v9 = *a4;
  return _netlogon_unwrap_iov(a1, a2, 0, a5, (unsigned __int16 *)&v6, 2);
}

uint64_t _netlogon_wrap_size_limit(int *a1, uint64_t a2, int a3, uint64_t a4, unsigned int a5, _DWORD *a6)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v10 = 2;
  unint64_t v11 = 0;
  uint64_t result = _netlogon_wrap_iov_length(a1, a2, a3, a4, 0, (unsigned __int16 *)&v10, 1);
  if (!WORD1(result))
  {
    uint64_t result = 0;
    if (v11 <= a5) {
      int v9 = a5 - v11;
    }
    else {
      int v9 = 0;
    }
    *a6 = v9;
  }
  return result;
}

uint64_t _netlogon_derive_rc4_hmac_key(void *key, const void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  CCHmac(1u, key, 0x10uLL, &zeros, 4uLL, macOut);
  CCHmac(1u, macOut, 0x10uLL, a2, 8uLL, v4);
  hc_EVP_rc4();
  return hc_EVP_CipherInit_ex();
}

void _gsskrb5cfx_wrap_length_cfx_cold_1()
{
}

void unrotate_iov_cold_1()
{
  __assert_rtn("unrotate_iov", "cfx.c", 700, "(size_t)(q - p) == len");
}

void _gssapi_wrap_cfx_cold_1()
{
  __assert_rtn("_gssapi_wrap_cfx", "cfx.c", 1360, "cksum.checksum.length == cksumsize");
}

void _gssapi_wrap_cfx_cold_2()
{
  __assert_rtn("_gssapi_wrap_cfx", "cfx.c", 1313, "sizeof(*token) + cipher.length == wrapped_len");
}

void _gsskrb5_get_mic_cold_1()
{
  __assert_rtn("mic_des3", "get_mic.c", 265, "encdata.length == 8");
}

void elem_insert_cold_1()
{
}

void _gsskrb5_unwrap_cold_1()
{
  __assert_rtn("unwrap_des3", "unwrap.c", 292, "tmp.length == input_message_buffer->length - len");
}

void _gsskrb5_wrap_cold_1()
{
  __assert_rtn("wrap_des3", "wrap.c", 528, "tmp.length == datalen");
}

void _gsskrb5_wrap_cold_2()
{
  __assert_rtn("wrap_des3", "wrap.c", 493, "encdata.length == 8");
}

void get_mic_iov_cold_1()
{
  __assert_rtn("get_mic_iov", "crypto.c", 423, "trailer->buffer.value != NULL");
}

void get_mic_iov_cold_2()
{
  __assert_rtn("get_mic_iov", "crypto.c", 422, "trailer->buffer.length == 16");
}

void v2_seal_message_cold_1()
{
  __assert_rtn("v2_seal_message", "crypto.c", 337, "trailer->buffer.length == 16");
}

void v2_sign_message_cold_1()
{
  __assert_rtn("v2_sign_message", "crypto.c", 226, "trailer->buffer.length == 16");
}

void _gss_ntlm_cred_label_get_cold_1()
{
}

void _netlogon_make_initial_auth_message_cold_1()
{
  __assert_rtn("_netlogon_make_initial_auth_message", "init_sec_context.c", 144, "p == (uint8_t *)output_token->value + len");
}

void _netlogon_make_initial_auth_message_cold_2()
{
  __assert_rtn("_netlogon_make_initial_auth_message", "init_sec_context.c", 137, "names[i].length != 0");
}

void _netlogon_make_initial_auth_message_cold_3()
{
  __assert_rtn("_netlogon_make_initial_auth_message", "init_sec_context.c", 138, "((char *)names[i].value)[names[i].length - 1] == '\\0'");
}

uint64_t CCDigest()
{
  return MEMORY[0x270ED7970]();
}

uint64_t CCDigestCreate()
{
  return MEMORY[0x270ED7978]();
}

uint64_t CCDigestDestroy()
{
  return MEMORY[0x270ED7980]();
}

uint64_t CCDigestFinal()
{
  return MEMORY[0x270ED7988]();
}

uint64_t CCDigestReset()
{
  return MEMORY[0x270ED79A8]();
}

uint64_t CCDigestUpdate()
{
  return MEMORY[0x270ED79B0]();
}

void CCHmac(CCHmacAlgorithm algorithm, const void *key, size_t keyLength, const void *data, size_t dataLength, void *macOut)
{
}

void CCHmacFinal(CCHmacContext *ctx, void *macOut)
{
}

void CCHmacInit(CCHmacContext *ctx, CCHmacAlgorithm algorithm, const void *key, size_t keyLength)
{
}

void CCHmacUpdate(CCHmacContext *ctx, const void *data, size_t dataLength)
{
}

uint64_t CCRandomCopyBytes()
{
  return MEMORY[0x270ED7A78]();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4310](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x270EE4348]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

void CFArrayInsertValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

uint64_t CFCopyHomeDirectoryURLForUser()
{
  return MEMORY[0x270EE4798]();
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x270EE47F0](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x270EE4838]();
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x270EE4860](allocator, at);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4928](allocator, capacity, theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x270EE49C0](allocator, domain, code, userInfo);
}

CFErrorRef CFErrorCreateWithUserInfoKeysAndValues(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, const void *const *userInfoKeys, const void *const *userInfoValues, CFIndex numUserInfoValues)
{
  return (CFErrorRef)MEMORY[0x270EE49C8](allocator, domain, code, userInfoKeys, userInfoValues, numUserInfoValues);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x270EE49D0](err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x270EE4A80](allocator, localeIdentifier);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CC0](key, applicationID, userName, hostName);
}

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x270EE4D48](allocator, stream, streamLength, options, format, error);
}

CFIndex CFPropertyListWrite(CFPropertyListRef propertyList, CFWriteStreamRef stream, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return MEMORY[0x270EE4D60](propertyList, stream, format, options, error);
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFReadStreamRef)MEMORY[0x270EE4D90](alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x270EE4DB8](stream);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B0](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B8](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x270EE50D0](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3 = MEMORY[0x270EE5148](theString, stringToFind, compareOptions);
  result.CFIndex length = v4;
  result.location = v3;
  return result;
}

void CFStringFold(CFMutableStringRef theString, CFStringCompareFlags theFlags, CFLocaleRef theLocale)
{
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x270EE5228](theString, prefix);
}

CFStringRef CFURLCopyHostName(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x270EE5330](anURL);
}

CFStringRef CFURLCopyPath(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x270EE5348](anURL);
}

CFStringRef CFURLCopyScheme(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x270EE5368](anURL);
}

CFURLRef CFURLCreateCopyAppendingPathComponent(CFAllocatorRef allocator, CFURLRef url, CFStringRef pathComponent, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x270EE5390](allocator, url, pathComponent, isDirectory);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x270EE53F0](allocator, filePath, pathStyle, isDirectory);
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x270EE5400](allocator, URLString, baseURL);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x270EE5470](alloc);
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return (CFUUIDRef)MEMORY[0x270EE5480](alloc, *(void *)&bytes.byte0, *(void *)&bytes.byte8);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x270EE5488](alloc, uuid);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1 = MEMORY[0x270EE54A8](uuid);
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

void CFWriteStreamClose(CFWriteStreamRef stream)
{
}

CFWriteStreamRef CFWriteStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFWriteStreamRef)MEMORY[0x270EE5538](alloc, fileURL);
}

Boolean CFWriteStreamOpen(CFWriteStreamRef stream)
{
  return MEMORY[0x270EE5558](stream);
}

uint64_t HeimCredCopyAttribute()
{
  return MEMORY[0x270F39568]();
}

uint64_t HeimCredCopyFromUUID()
{
  return MEMORY[0x270F39578]();
}

uint64_t HeimCredCopyQuery()
{
  return MEMORY[0x270F39580]();
}

uint64_t HeimCredCreate()
{
  return MEMORY[0x270F39588]();
}

uint64_t HeimCredDeleteByUUID()
{
  return MEMORY[0x270F39598]();
}

uint64_t HeimCredDeleteQuery()
{
  return MEMORY[0x270F395A0]();
}

uint64_t HeimCredDoAuth()
{
  return MEMORY[0x270F395A8]();
}

uint64_t HeimCredGetImpersonateBundle()
{
  return MEMORY[0x270F395B0]();
}

uint64_t HeimCredGetUUID()
{
  return MEMORY[0x270F395B8]();
}

uint64_t HeimCredReleaseTransient()
{
  return MEMORY[0x270F395C0]();
}

uint64_t HeimCredRetainTransient()
{
  return MEMORY[0x270F395C8]();
}

uint64_t NEHelperCacheCopyAppUUIDMapping()
{
  return MEMORY[0x270ED7C40]();
}

CFTypeID SecCertificateGetTypeID(void)
{
  return MEMORY[0x270EFD828]();
}

CFTypeID SecIdentityGetTypeID(void)
{
  return MEMORY[0x270EFD960]();
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x270EFD980](query);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x270EE56F0]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x270EE5700]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x270ED7E28](*(void *)&a1, a2);
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x270ED7EE0]();
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x270ED7F08](*(void *)&a1);
}

uint64_t _asn1_copy_top()
{
  return MEMORY[0x270F992B8]();
}

uint64_t _krb5_auth_con_setup_pfs()
{
  return MEMORY[0x270F395E8]();
}

uint64_t _krb5_build_authenticator()
{
  return MEMORY[0x270F395F0]();
}

uint64_t _krb5_crc_init_table()
{
  return MEMORY[0x270F395F8]();
}

uint64_t _krb5_crc_update()
{
  return MEMORY[0x270F39600]();
}

uint64_t _krb5_get_krbtgt()
{
  return MEMORY[0x270F39608]();
}

uint64_t _krb5_have_debug()
{
  return MEMORY[0x270F39610]();
}

uint64_t _krb5_init_creds_get_cred_client()
{
  return MEMORY[0x270F39618]();
}

uint64_t _krb5_init_creds_get_cred_endtime()
{
  return MEMORY[0x270F39620]();
}

uint64_t _krb5_init_creds_set_pku2u()
{
  return MEMORY[0x270F39628]();
}

uint64_t _krb5_pk_find_cert()
{
  return MEMORY[0x270F39630]();
}

uint64_t _krb5_principalname2krb5_principal()
{
  return MEMORY[0x270F39640]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x270ED8688](a1, a2);
}

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return MEMORY[0x270F98178](atoken);
}

void bzero(void *a1, size_t a2)
{
}

uint64_t csops()
{
  return MEMORY[0x270ED9150]();
}

uint64_t ct_memcmp()
{
  return MEMORY[0x270F39648]();
}

char *__cdecl ctime(const time_t *a1)
{
  return (char *)MEMORY[0x270ED9168](a1);
}

uint64_t der_free_octet_string()
{
  return MEMORY[0x270F99328]();
}

uint64_t der_free_oid()
{
  return MEMORY[0x270F99330]();
}

uint64_t der_get_length()
{
  return MEMORY[0x270F99340]();
}

uint64_t der_get_oid()
{
  return MEMORY[0x270F99350]();
}

uint64_t der_heim_octet_string_cmp()
{
  return MEMORY[0x270F99370]();
}

uint64_t der_heim_oid_cmp()
{
  return MEMORY[0x270F99378]();
}

uint64_t der_length_len()
{
  return MEMORY[0x270F99390]();
}

uint64_t der_length_oid()
{
  return MEMORY[0x270F99398]();
}

uint64_t der_print_heim_oid()
{
  return MEMORY[0x270F993B0]();
}

uint64_t der_put_length()
{
  return MEMORY[0x270F993D0]();
}

uint64_t der_put_oid()
{
  return MEMORY[0x270F993E0]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

int dlclose(void *__handle)
{
  return MEMORY[0x270ED9618](__handle);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

void errx(int a1, const char *a2, ...)
{
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

char *__cdecl fgets(char *a1, int a2, FILE *a3)
{
  return (char *)MEMORY[0x270ED9968](a1, *(void *)&a2, a3);
}

int fnmatch(const char *a1, const char *a2, int a3)
{
  return MEMORY[0x270ED99E8](a1, a2, *(void *)&a3);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x270ED9BE8](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x270ED9BF0]();
}

passwd *__cdecl getpwnam(const char *a1)
{
  return (passwd *)MEMORY[0x270ED9D28](a1);
}

uint64_t hc_EVP_CIPHER_CTX_cleanup()
{
  return MEMORY[0x270F39660]();
}

uint64_t hc_EVP_CIPHER_CTX_init()
{
  return MEMORY[0x270F39668]();
}

uint64_t hc_EVP_Cipher()
{
  return MEMORY[0x270F39670]();
}

uint64_t hc_EVP_CipherFinal_ex()
{
  return MEMORY[0x270F39678]();
}

uint64_t hc_EVP_CipherInit_ex()
{
  return MEMORY[0x270F39680]();
}

uint64_t hc_EVP_aes_128_cfb8()
{
  return MEMORY[0x270F39688]();
}

uint64_t hc_EVP_rc4()
{
  return MEMORY[0x270F39690]();
}

uint64_t heim_abort()
{
  return MEMORY[0x270F39698]();
}

uint64_t heim_base_once_f()
{
  return MEMORY[0x270F396A0]();
}

uint64_t heim_data_get_bytes()
{
  return MEMORY[0x270F396A8]();
}

uint64_t heim_data_get_length()
{
  return MEMORY[0x270F396B0]();
}

uint64_t heim_data_get_type_id()
{
  return MEMORY[0x270F396B8]();
}

uint64_t heim_dict_copy_value()
{
  return MEMORY[0x270F396C0]();
}

uint64_t heim_dict_get_type_id()
{
  return MEMORY[0x270F396C8]();
}

uint64_t heim_get_tid()
{
  return MEMORY[0x270F396D0]();
}

uint64_t heim_ipc_call()
{
  return MEMORY[0x270F396D8]();
}

uint64_t heim_ipc_free_context()
{
  return MEMORY[0x270F396E0]();
}

uint64_t heim_ipc_free_data()
{
  return MEMORY[0x270F396E8]();
}

uint64_t heim_ipc_init_context()
{
  return MEMORY[0x270F396F0]();
}

uint64_t heim_ntlm_decode_type2()
{
  return MEMORY[0x270F18380]();
}

uint64_t heim_ntlm_decode_type3()
{
  return MEMORY[0x270F18388]();
}

uint64_t heim_ntlm_encode_type1()
{
  return MEMORY[0x270F18390]();
}

uint64_t heim_ntlm_encode_type3()
{
  return MEMORY[0x270F18398]();
}

uint64_t heim_ntlm_free_buf()
{
  return MEMORY[0x270F183A0]();
}

uint64_t heim_ntlm_free_targetinfo()
{
  return MEMORY[0x270F183A8]();
}

uint64_t heim_ntlm_free_type2()
{
  return MEMORY[0x270F183B0]();
}

uint64_t heim_ntlm_free_type3()
{
  return MEMORY[0x270F183B8]();
}

uint64_t heim_ntlm_nt_key()
{
  return MEMORY[0x270F183C0]();
}

uint64_t heim_release()
{
  return MEMORY[0x270F396F8]();
}

uint64_t heim_retain()
{
  return MEMORY[0x270F39700]();
}

uint64_t heim_string_copy_utf8()
{
  return MEMORY[0x270F39708]();
}

uint64_t heim_string_create()
{
  return MEMORY[0x270F39710]();
}

uint64_t heim_string_get_type_id()
{
  return MEMORY[0x270F39718]();
}

uint64_t heim_warn_blocking()
{
  return MEMORY[0x270F39720]();
}

uint64_t hx509_cert_find_subjectAltName_otherName()
{
  return MEMORY[0x270F39728]();
}

uint64_t hx509_cert_free()
{
  return MEMORY[0x270F39730]();
}

uint64_t hx509_cert_get_appleid()
{
  return MEMORY[0x270F39738]();
}

uint64_t hx509_cert_get_persistent()
{
  return MEMORY[0x270F39740]();
}

uint64_t hx509_cert_get_subject()
{
  return MEMORY[0x270F39748]();
}

uint64_t hx509_cert_init_SecFramework()
{
  return MEMORY[0x270F39750]();
}

uint64_t hx509_cert_init_SecFrameworkAuth()
{
  return MEMORY[0x270F39758]();
}

uint64_t hx509_cert_ref()
{
  return MEMORY[0x270F39760]();
}

uint64_t hx509_certs_free()
{
  return MEMORY[0x270F39768]();
}

uint64_t hx509_certs_init()
{
  return MEMORY[0x270F39770]();
}

uint64_t hx509_free_octet_string_list()
{
  return MEMORY[0x270F39778]();
}

uint64_t hx509_name_free()
{
  return MEMORY[0x270F39780]();
}

uint64_t hx509_name_to_Name()
{
  return MEMORY[0x270F39788]();
}

uint64_t hx509_query_alloc()
{
  return MEMORY[0x270F39790]();
}

uint64_t hx509_query_free()
{
  return MEMORY[0x270F39798]();
}

uint64_t hx509_query_match_cmp_func()
{
  return MEMORY[0x270F397A0]();
}

uint64_t hx509_query_match_option()
{
  return MEMORY[0x270F397A8]();
}

uint64_t hx509_query_match_persistent()
{
  return MEMORY[0x270F397B0]();
}

uint64_t hx509_xfree()
{
  return MEMORY[0x270F397B8]();
}

uint64_t issuid()
{
  return MEMORY[0x270F397C0]();
}

uint64_t krb5_abortx()
{
  return MEMORY[0x270F397C8]();
}

krb5_error_code krb5_aname_to_localname(krb5_context a1, krb5_const_principal a2, int a3, char *a4)
{
  return MEMORY[0x270F397D0](a1, a2, *(void *)&a3, a4);
}

uint64_t krb5_auth_con_addflags()
{
  return MEMORY[0x270F397D8]();
}

krb5_error_code krb5_auth_con_free(krb5_context a1, krb5_auth_context a2)
{
  return MEMORY[0x270F397E0](a1, a2);
}

uint64_t krb5_auth_con_generatelocalsubkey()
{
  return MEMORY[0x270F397E8]();
}

krb5_error_code krb5_auth_con_getauthenticator(krb5_context a1, krb5_auth_context a2, krb5_authenticator **a3)
{
  return MEMORY[0x270F397F0](a1, a2, a3);
}

krb5_error_code krb5_auth_con_getkey(krb5_context a1, krb5_auth_context a2, krb5_keyblock **a3)
{
  return MEMORY[0x270F397F8](a1, a2, a3);
}

krb5_error_code krb5_auth_con_getlocalseqnumber(krb5_context a1, krb5_auth_context a2, krb5_int32 *a3)
{
  return MEMORY[0x270F39800](a1, a2, a3);
}

uint64_t krb5_auth_con_getlocalsubkey()
{
  return MEMORY[0x270F39808]();
}

krb5_error_code krb5_auth_con_getremoteseqnumber(krb5_context a1, krb5_auth_context a2, krb5_int32 *a3)
{
  return MEMORY[0x270F39810](a1, a2, a3);
}

uint64_t krb5_auth_con_getremotesubkey()
{
  return MEMORY[0x270F39818]();
}

krb5_error_code krb5_auth_con_init(krb5_context a1, krb5_auth_context *a2)
{
  return MEMORY[0x270F39820](a1, a2);
}

uint64_t krb5_auth_con_removeflags()
{
  return MEMORY[0x270F39828]();
}

krb5_error_code krb5_auth_con_setaddrs(krb5_context a1, krb5_auth_context a2, krb5_address *a3, krb5_address *a4)
{
  return MEMORY[0x270F39830](a1, a2, a3, a4);
}

krb5_error_code krb5_auth_con_setflags(krb5_context a1, krb5_auth_context a2, krb5_int32 a3)
{
  return MEMORY[0x270F39838](a1, a2, *(void *)&a3);
}

uint64_t krb5_auth_con_setkey()
{
  return MEMORY[0x270F39840]();
}

uint64_t krb5_auth_con_setlocalseqnumber()
{
  return MEMORY[0x270F39848]();
}

uint64_t krb5_auth_con_setlocalsubkey()
{
  return MEMORY[0x270F39850]();
}

uint64_t krb5_auth_con_setremoteseqnumber()
{
  return MEMORY[0x270F39858]();
}

uint64_t krb5_auth_con_setremotesubkey()
{
  return MEMORY[0x270F39860]();
}

uint64_t krb5_build_ap_req()
{
  return MEMORY[0x270F39868]();
}

krb5_error_code krb5_cc_cache_match(krb5_context context, krb5_principal client, krb5_ccache *id)
{
  return MEMORY[0x270F39870](context, client, id);
}

uint64_t krb5_cc_clear_mcred()
{
  return MEMORY[0x270F39878]();
}

krb5_error_code krb5_cc_close(krb5_context context, krb5_ccache cache)
{
  return MEMORY[0x270F39880](context, cache);
}

uint64_t krb5_cc_copy_cache()
{
  return MEMORY[0x270F39888]();
}

uint64_t krb5_cc_copy_match_f()
{
  return MEMORY[0x270F39890]();
}

krb5_error_code krb5_cc_default(krb5_context a1, krb5_ccache *a2)
{
  return MEMORY[0x270F39898](a1, a2);
}

const char *__cdecl krb5_cc_default_name(krb5_context a1)
{
  return (const char *)MEMORY[0x270F398A0](a1);
}

krb5_error_code krb5_cc_destroy(krb5_context context, krb5_ccache cache)
{
  return MEMORY[0x270F398A8](context, cache);
}

krb5_error_code krb5_cc_end_seq_get(krb5_context context, krb5_ccache cache, krb5_cc_cursor *cursor)
{
  return MEMORY[0x270F398B0](context, cache, cursor);
}

krb5_error_code krb5_cc_get_config(krb5_context a1, krb5_ccache a2, krb5_const_principal a3, const char *a4, krb5_data *a5)
{
  return MEMORY[0x270F398B8](a1, a2, a3, a4, a5);
}

uint64_t krb5_cc_get_full_name()
{
  return MEMORY[0x270F398C0]();
}

const char *__cdecl krb5_cc_get_name(krb5_context context, krb5_ccache cache)
{
  return (const char *)MEMORY[0x270F398C8](context, cache);
}

uint64_t krb5_cc_get_ops()
{
  return MEMORY[0x270F398D0]();
}

uint64_t krb5_cc_get_prefix_ops()
{
  return MEMORY[0x270F398D8]();
}

krb5_error_code krb5_cc_get_principal(krb5_context context, krb5_ccache cache, krb5_principal *principal)
{
  return MEMORY[0x270F398E0](context, cache, principal);
}

const char *__cdecl krb5_cc_get_type(krb5_context context, krb5_ccache cache)
{
  return (const char *)MEMORY[0x270F398E8](context, cache);
}

uint64_t krb5_cc_get_uuid()
{
  return MEMORY[0x270F398F0]();
}

krb5_error_code krb5_cc_initialize(krb5_context context, krb5_ccache cache, krb5_principal principal)
{
  return MEMORY[0x270F398F8](context, cache, principal);
}

krb5_error_code krb5_cc_move(krb5_context context, krb5_ccache src, krb5_ccache dst)
{
  return MEMORY[0x270F39900](context, src, dst);
}

krb5_error_code krb5_cc_new_unique(krb5_context context, const char *type, const char *hint, krb5_ccache *id)
{
  return MEMORY[0x270F39908](context, type, hint, id);
}

krb5_error_code krb5_cc_next_cred(krb5_context context, krb5_ccache cache, krb5_cc_cursor *cursor, krb5_creds *creds)
{
  return MEMORY[0x270F39910](context, cache, cursor, creds);
}

krb5_error_code krb5_cc_remove_cred(krb5_context context, krb5_ccache cache, krb5_flags flags, krb5_creds *creds)
{
  return MEMORY[0x270F39918](context, cache, *(void *)&flags, creds);
}

krb5_error_code krb5_cc_resolve(krb5_context a1, const char *a2, krb5_ccache *a3)
{
  return MEMORY[0x270F39920](a1, a2, a3);
}

uint64_t krb5_cc_resolve_by_uuid()
{
  return MEMORY[0x270F39928]();
}

krb5_error_code krb5_cc_retrieve_cred(krb5_context context, krb5_ccache cache, krb5_flags flags, krb5_creds *mcreds, krb5_creds *creds)
{
  return MEMORY[0x270F39930](context, cache, *(void *)&flags, mcreds, creds);
}

uint64_t krb5_cc_set_acl()
{
  return MEMORY[0x270F39938]();
}

krb5_error_code krb5_cc_set_config(krb5_context a1, krb5_ccache a2, krb5_const_principal a3, const char *a4, krb5_data *a5)
{
  return MEMORY[0x270F39940](a1, a2, a3, a4, a5);
}

krb5_error_code krb5_cc_set_default_name(krb5_context a1, const char *a2)
{
  return MEMORY[0x270F39948](a1, a2);
}

krb5_error_code krb5_cc_start_seq_get(krb5_context context, krb5_ccache cache, krb5_cc_cursor *cursor)
{
  return MEMORY[0x270F39950](context, cache, cursor);
}

krb5_error_code krb5_cc_store_cred(krb5_context context, krb5_ccache cache, krb5_creds *creds)
{
  return MEMORY[0x270F39958](context, cache, creds);
}

uint64_t krb5_cc_switch()
{
  return MEMORY[0x270F39960]();
}

krb5_error_code krb5_cccol_cursor_free(krb5_context context, krb5_cccol_cursor *cursor)
{
  return MEMORY[0x270F39968](context, cursor);
}

krb5_error_code krb5_cccol_cursor_new(krb5_context context, krb5_cccol_cursor *cursor)
{
  return MEMORY[0x270F39970](context, cursor);
}

krb5_error_code krb5_cccol_cursor_next(krb5_context context, krb5_cccol_cursor cursor, krb5_ccache *ccache)
{
  return MEMORY[0x270F39978](context, cursor, ccache);
}

uint64_t krb5_checksumsize()
{
  return MEMORY[0x270F39980]();
}

void krb5_clear_error_message(krb5_context a1)
{
}

uint64_t krb5_config_free_strings()
{
  return MEMORY[0x270F39990]();
}

uint64_t krb5_config_get_strings()
{
  return MEMORY[0x270F39998]();
}

krb5_error_code krb5_copy_data(krb5_context a1, const krb5_data *a2, krb5_data **a3)
{
  return MEMORY[0x270F399A0](a1, a2, a3);
}

krb5_error_code krb5_copy_principal(krb5_context a1, krb5_const_principal a2, krb5_principal *a3)
{
  return MEMORY[0x270F399A8](a1, a2, a3);
}

uint64_t krb5_create_checksum()
{
  return MEMORY[0x270F399B0]();
}

uint64_t krb5_create_checksum_iov()
{
  return MEMORY[0x270F399B8]();
}

uint64_t krb5_crypto_destroy()
{
  return MEMORY[0x270F399C0]();
}

uint64_t krb5_crypto_get_checksum_type()
{
  return MEMORY[0x270F399C8]();
}

uint64_t krb5_crypto_getblocksize()
{
  return MEMORY[0x270F399D0]();
}

uint64_t krb5_crypto_getpadsize()
{
  return MEMORY[0x270F399D8]();
}

uint64_t krb5_crypto_init()
{
  return MEMORY[0x270F399E0]();
}

uint64_t krb5_crypto_length()
{
  return MEMORY[0x270F399E8]();
}

uint64_t krb5_crypto_prf()
{
  return MEMORY[0x270F399F0]();
}

uint64_t krb5_data_alloc()
{
  return MEMORY[0x270F399F8]();
}

uint64_t krb5_data_copy()
{
  return MEMORY[0x270F39A00]();
}

uint64_t krb5_data_free()
{
  return MEMORY[0x270F39A08]();
}

uint64_t krb5_data_zero()
{
  return MEMORY[0x270F39A10]();
}

uint64_t krb5_decode_ap_req()
{
  return MEMORY[0x270F39A18]();
}

krb5_error_code krb5_decrypt(krb5_context context, krb5_const_pointer inptr, krb5_pointer outptr, size_t size, krb5_encrypt_block *eblock, krb5_pointer ivec)
{
  return MEMORY[0x270F39A20](context, inptr, outptr, size, eblock, ivec);
}

uint64_t krb5_decrypt_iov_ivec()
{
  return MEMORY[0x270F39A28]();
}

uint64_t krb5_decrypt_ivec()
{
  return MEMORY[0x270F39A30]();
}

krb5_error_code krb5_encrypt(krb5_context context, krb5_const_pointer inptr, krb5_pointer outptr, size_t size, krb5_encrypt_block *eblock, krb5_pointer ivec)
{
  return MEMORY[0x270F39A40](context, inptr, outptr, size, eblock, ivec);
}

uint64_t krb5_encrypt_iov_ivec()
{
  return MEMORY[0x270F39A48]();
}

uint64_t krb5_encrypt_ivec()
{
  return MEMORY[0x270F39A50]();
}

krb5_error_code krb5_enctype_to_string(krb5_enctype a1, char *a2, size_t a3)
{
  return MEMORY[0x270F39A58](*(void *)&a1, a2, a3);
}

uint64_t krb5_enctype_valid()
{
  return MEMORY[0x270F39A60]();
}

uint64_t krb5_enomem()
{
  return MEMORY[0x270F39A68]();
}

uint64_t krb5_error_from_rd_error()
{
  return MEMORY[0x270F39A70]();
}

uint64_t krb5_free_address()
{
  return MEMORY[0x270F39A78]();
}

void krb5_free_ap_rep_enc_part(krb5_context a1, krb5_ap_rep_enc_part *a2)
{
}

void krb5_free_authenticator(krb5_context a1, krb5_authenticator *a2)
{
}

void krb5_free_context(krb5_context a1)
{
}

void krb5_free_cred_contents(krb5_context a1, krb5_creds *a2)
{
}

void krb5_free_creds(krb5_context a1, krb5_creds *a2)
{
}

void krb5_free_data(krb5_context a1, krb5_data *a2)
{
}

void krb5_free_error_message(krb5_context a1, const char *a2)
{
}

void krb5_free_keyblock(krb5_context a1, krb5_keyblock *a2)
{
}

void krb5_free_keyblock_contents(krb5_context a1, krb5_keyblock *a2)
{
}

void krb5_free_principal(krb5_context a1, krb5_principal a2)
{
}

void krb5_free_ticket(krb5_context a1, krb5_ticket *a2)
{
}

uint64_t krb5_generate_random_block()
{
  return MEMORY[0x270F39AD8]();
}

krb5_error_code krb5_get_credentials(krb5_context a1, krb5_flags a2, krb5_ccache a3, krb5_creds *a4, krb5_creds **a5)
{
  return MEMORY[0x270F39AE0](a1, *(void *)&a2, a3, a4, a5);
}

uint64_t krb5_get_default_principal()
{
  return MEMORY[0x270F39B18]();
}

const char *__cdecl krb5_get_error_message(krb5_context a1, krb5_error_code a2)
{
  return (const char *)MEMORY[0x270F39B28](a1, *(void *)&a2);
}

uint64_t krb5_get_forwarded_creds()
{
  return MEMORY[0x270F39B30]();
}

krb5_error_code krb5_get_init_creds_keytab(krb5_context context, krb5_creds *creds, krb5_principal client, krb5_keytab arg_keytab, krb5_deltat start_time, char *in_tkt_service, krb5_get_init_creds_opt *k5_gic_options)
{
  return MEMORY[0x270F39B38](context, creds, client, arg_keytab, *(void *)&start_time, in_tkt_service, k5_gic_options);
}

krb5_error_code krb5_get_init_creds_opt_alloc(krb5_context context, krb5_get_init_creds_opt **opt)
{
  return MEMORY[0x270F39B40](context, opt);
}

void krb5_get_init_creds_opt_free(krb5_context context, krb5_get_init_creds_opt *opt)
{
}

void krb5_get_init_creds_opt_set_canonicalize(krb5_get_init_creds_opt *opt, int canonicalize)
{
}

uint64_t krb5_get_init_creds_opt_set_default_flags()
{
  return MEMORY[0x270F39B58]();
}

void krb5_get_init_creds_opt_set_forwardable(krb5_get_init_creds_opt *opt, int forwardable)
{
}

uint64_t krb5_get_init_creds_opt_set_pkinit()
{
  return MEMORY[0x270F39B70]();
}

void krb5_get_init_creds_opt_set_proxiable(krb5_get_init_creds_opt *opt, int proxiable)
{
}

void krb5_get_init_creds_opt_set_renew_life(krb5_get_init_creds_opt *opt, krb5_deltat renew_life)
{
}

void krb5_get_init_creds_opt_set_tkt_life(krb5_get_init_creds_opt *opt, krb5_deltat tkt_life)
{
}

uint64_t krb5_get_init_creds_opt_set_win2k()
{
  return MEMORY[0x270F39B90]();
}

krb5_error_code krb5_get_init_creds_password(krb5_context context, krb5_creds *creds, krb5_principal client, char *password, krb5_prompter_fct prompter, void *data, krb5_deltat start_time, char *in_tkt_service, krb5_get_init_creds_opt *k5_gic_options)
{
  return MEMORY[0x270F39B98](context, creds, client, password, prompter, data, *(void *)&start_time, in_tkt_service);
}

uint64_t krb5_get_kdc_cred()
{
  return MEMORY[0x270F39BA0]();
}

uint64_t krb5_get_kdc_sec_offset()
{
  return MEMORY[0x270F39BA8]();
}

uint64_t krb5_get_wrapped_length()
{
  return MEMORY[0x270F39BB0]();
}

uint64_t krb5_h_addr2sockaddr()
{
  return MEMORY[0x270F39BB8]();
}

uint64_t krb5_hmac()
{
  return MEMORY[0x270F39BC0]();
}

uint64_t krb5_homedir_access()
{
  return MEMORY[0x270F39BC8]();
}

krb5_error_code krb5_init_context(krb5_context *a1)
{
  return MEMORY[0x270F39BD0](a1);
}

uint64_t krb5_init_creds_free()
{
  return MEMORY[0x270F39BD8]();
}

uint64_t krb5_init_creds_get()
{
  return MEMORY[0x270F39BE0]();
}

uint64_t krb5_init_creds_get_as_reply_key()
{
  return MEMORY[0x270F39BE8]();
}

uint64_t krb5_init_creds_get_creds()
{
  return MEMORY[0x270F39BF0]();
}

uint64_t krb5_init_creds_init()
{
  return MEMORY[0x270F39BF8]();
}

uint64_t krb5_init_creds_set_kdc_hostname()
{
  return MEMORY[0x270F39C00]();
}

uint64_t krb5_init_creds_set_password()
{
  return MEMORY[0x270F39C18]();
}

uint64_t krb5_init_creds_set_pkinit_client_cert()
{
  return MEMORY[0x270F39C20]();
}

uint64_t krb5_init_creds_set_service()
{
  return MEMORY[0x270F39C28]();
}

uint64_t krb5_init_creds_set_sitename()
{
  return MEMORY[0x270F39C30]();
}

uint64_t krb5_init_creds_set_source_process()
{
  return MEMORY[0x270F39C38]();
}

uint64_t krb5_init_creds_step()
{
  return MEMORY[0x270F39C40]();
}

uint64_t krb5_init_creds_store()
{
  return MEMORY[0x270F39C48]();
}

uint64_t krb5_init_creds_store_config()
{
  return MEMORY[0x270F39C50]();
}

krb5_error_code krb5_kt_close(krb5_context context, krb5_keytab keytab)
{
  return MEMORY[0x270F39C68](context, keytab);
}

krb5_error_code krb5_kt_default(krb5_context a1, krb5_keytab *a2)
{
  return MEMORY[0x270F39C70](a1, a2);
}

krb5_error_code krb5_kt_end_seq_get(krb5_context context, krb5_keytab keytab, krb5_kt_cursor *cursor)
{
  return MEMORY[0x270F39C78](context, keytab, cursor);
}

uint64_t krb5_kt_free_entry()
{
  return MEMORY[0x270F39C80]();
}

krb5_error_code krb5_kt_get_entry(krb5_context context, krb5_keytab keytab, krb5_const_principal principal, krb5_kvno vno, krb5_enctype enctype, krb5_keytab_entry *entry)
{
  return MEMORY[0x270F39C88](context, keytab, principal, *(void *)&vno, *(void *)&enctype, entry);
}

uint64_t krb5_kt_get_full_name()
{
  return MEMORY[0x270F39C90]();
}

uint64_t krb5_kt_have_content()
{
  return MEMORY[0x270F39C98]();
}

krb5_error_code krb5_kt_next_entry(krb5_context context, krb5_keytab keytab, krb5_keytab_entry *entry, krb5_kt_cursor *cursor)
{
  return MEMORY[0x270F39CA0](context, keytab, entry, cursor);
}

krb5_error_code krb5_kt_resolve(krb5_context a1, const char *a2, krb5_keytab *a3)
{
  return MEMORY[0x270F39CA8](a1, a2, a3);
}

krb5_error_code krb5_kt_start_seq_get(krb5_context context, krb5_keytab keytab, krb5_kt_cursor *cursor)
{
  return MEMORY[0x270F39CB0](context, keytab, cursor);
}

krb5_BOOLean krb5_kuserok(krb5_context a1, krb5_principal a2, const char *a3)
{
  return MEMORY[0x270F39CB8](a1, a2, a3);
}

uint64_t krb5_load_plugins()
{
  return MEMORY[0x270F39CC0]();
}

uint64_t krb5_make_principal()
{
  return MEMORY[0x270F39CC8]();
}

krb5_error_code krb5_mk_error(krb5_context a1, const krb5_error *a2, krb5_data *a3)
{
  return MEMORY[0x270F39CD0](a1, a2, a3);
}

krb5_error_code krb5_mk_rep(krb5_context a1, krb5_auth_context a2, krb5_data *a3)
{
  return MEMORY[0x270F39CD8](a1, a2, a3);
}

krb5_error_code krb5_mk_req_extended(krb5_context a1, krb5_auth_context *a2, krb5_flags a3, krb5_data *a4, krb5_creds *a5, krb5_data *a6)
{
  return MEMORY[0x270F39CE0](a1, a2, *(void *)&a3, a4, a5, a6);
}

uint64_t krb5_pac_copy_credential_package()
{
  return MEMORY[0x270F39CE8]();
}

uint64_t krb5_pac_free()
{
  return MEMORY[0x270F39CF0]();
}

krb5_error_code krb5_parse_name(krb5_context a1, const char *a2, krb5_principal *a3)
{
  return MEMORY[0x270F39D10](a1, a2, a3);
}

uint64_t krb5_plugin_register_module()
{
  return MEMORY[0x270F39D20]();
}

uint64_t krb5_plugin_run_f()
{
  return MEMORY[0x270F39D28]();
}

krb5_BOOLean krb5_principal_compare(krb5_context a1, krb5_const_principal a2, krb5_const_principal a3)
{
  return MEMORY[0x270F39D30](a1, a2, a3);
}

uint64_t krb5_principal_get_realm()
{
  return MEMORY[0x270F39D38]();
}

uint64_t krb5_principal_get_type()
{
  return MEMORY[0x270F39D40]();
}

uint64_t krb5_principal_is_gss_hostbased_service()
{
  return MEMORY[0x270F39D48]();
}

uint64_t krb5_principal_is_lkdc()
{
  return MEMORY[0x270F39D50]();
}

uint64_t krb5_principal_is_null()
{
  return MEMORY[0x270F39D58]();
}

uint64_t krb5_principal_is_pku2u()
{
  return MEMORY[0x270F39D60]();
}

uint64_t krb5_principal_match()
{
  return MEMORY[0x270F39D68]();
}

uint64_t krb5_principal_set_realm()
{
  return MEMORY[0x270F39D70]();
}

uint64_t krb5_principal_set_type()
{
  return MEMORY[0x270F39D78]();
}

uint64_t krb5_rd_cred2()
{
  return MEMORY[0x270F39D80]();
}

krb5_error_code krb5_rd_error(krb5_context a1, const krb5_data *a2, krb5_error **a3)
{
  return MEMORY[0x270F39D88](a1, a2, a3);
}

krb5_error_code krb5_rd_rep(krb5_context a1, krb5_auth_context a2, const krb5_data *a3, krb5_ap_rep_enc_part **a4)
{
  return MEMORY[0x270F39D90](a1, a2, a3, a4);
}

uint64_t krb5_rd_req_ctx()
{
  return MEMORY[0x270F39D98]();
}

uint64_t krb5_rd_req_in_ctx_alloc()
{
  return MEMORY[0x270F39DA0]();
}

uint64_t krb5_rd_req_in_ctx_free()
{
  return MEMORY[0x270F39DA8]();
}

uint64_t krb5_rd_req_in_set_as_reply_key()
{
  return MEMORY[0x270F39DB0]();
}

uint64_t krb5_rd_req_in_set_keytab()
{
  return MEMORY[0x270F39DB8]();
}

uint64_t krb5_rd_req_in_set_pac_check()
{
  return MEMORY[0x270F39DC0]();
}

uint64_t krb5_rd_req_out_copy_pac()
{
  return MEMORY[0x270F39DC8]();
}

uint64_t krb5_rd_req_out_ctx_free()
{
  return MEMORY[0x270F39DD0]();
}

uint64_t krb5_rd_req_out_get_ap_req_options()
{
  return MEMORY[0x270F39DD8]();
}

uint64_t krb5_rd_req_out_get_flags()
{
  return MEMORY[0x270F39DE0]();
}

uint64_t krb5_rd_req_out_get_keyblock()
{
  return MEMORY[0x270F39DE8]();
}

uint64_t krb5_rd_req_out_get_ticket()
{
  return MEMORY[0x270F39DF0]();
}

uint64_t krb5_realm_is_lkdc()
{
  return MEMORY[0x270F39DF8]();
}

uint64_t krb5_reload_config()
{
  return MEMORY[0x270F39E00]();
}

uint64_t krb5_ret_address()
{
  return MEMORY[0x270F39E08]();
}

uint64_t krb5_ret_creds()
{
  return MEMORY[0x270F39E10]();
}

uint64_t krb5_ret_data()
{
  return MEMORY[0x270F39E18]();
}

uint64_t krb5_ret_int16()
{
  return MEMORY[0x270F39E20]();
}

uint64_t krb5_ret_int32()
{
  return MEMORY[0x270F39E28]();
}

uint64_t krb5_ret_keyblock()
{
  return MEMORY[0x270F39E30]();
}

uint64_t krb5_ret_string()
{
  return MEMORY[0x270F39E38]();
}

uint64_t krb5_ret_uint16()
{
  return MEMORY[0x270F39E40]();
}

uint64_t krb5_ret_uint32()
{
  return MEMORY[0x270F39E48]();
}

uint64_t krb5_set_default_in_tkt_etypes()
{
  return MEMORY[0x270F39E50]();
}

krb5_error_code krb5_set_default_realm(krb5_context a1, const char *a2)
{
  return MEMORY[0x270F39E58](a1, a2);
}

uint64_t krb5_set_dns_canonicalize_hostname()
{
  return MEMORY[0x270F39E60]();
}

void krb5_set_error_message(krb5_context a1, krb5_error_code a2, const char *a3, ...)
{
}

uint64_t krb5_set_kdc_sec_offset()
{
  return MEMORY[0x270F39E70]();
}

krb5_error_code krb5_set_password(krb5_context context, krb5_creds *creds, char *newpw, krb5_principal change_password_for, int *result_code, krb5_data *result_code_string, krb5_data *result_string)
{
  return MEMORY[0x270F39E78](context, creds, newpw, change_password_for, result_code, result_code_string, result_string);
}

krb5_error_code krb5_set_real_time(krb5_context a1, krb5_timestamp a2, krb5_int32 a3)
{
  return MEMORY[0x270F39E80](a1, *(void *)&a2, *(void *)&a3);
}

krb5_error_code krb5_sname_to_principal(krb5_context a1, const char *a2, const char *a3, krb5_int32 a4, krb5_principal *a5)
{
  return MEMORY[0x270F39E88](a1, a2, a3, *(void *)&a4, a5);
}

uint64_t krb5_sockaddr2address()
{
  return MEMORY[0x270F39E90]();
}

uint64_t krb5_storage_emem()
{
  return MEMORY[0x270F39E98]();
}

uint64_t krb5_storage_free()
{
  return MEMORY[0x270F39EA0]();
}

uint64_t krb5_storage_from_mem()
{
  return MEMORY[0x270F39EA8]();
}

uint64_t krb5_storage_from_readonly_mem()
{
  return MEMORY[0x270F39EB0]();
}

uint64_t krb5_storage_read()
{
  return MEMORY[0x270F39EB8]();
}

uint64_t krb5_storage_set_byteorder()
{
  return MEMORY[0x270F39EC0]();
}

uint64_t krb5_storage_to_data()
{
  return MEMORY[0x270F39EC8]();
}

uint64_t krb5_storage_write()
{
  return MEMORY[0x270F39ED0]();
}

uint64_t krb5_store_address()
{
  return MEMORY[0x270F39ED8]();
}

uint64_t krb5_store_creds()
{
  return MEMORY[0x270F39EE0]();
}

uint64_t krb5_store_data()
{
  return MEMORY[0x270F39EE8]();
}

uint64_t krb5_store_int16()
{
  return MEMORY[0x270F39EF0]();
}

uint64_t krb5_store_int32()
{
  return MEMORY[0x270F39EF8]();
}

uint64_t krb5_store_keyblock()
{
  return MEMORY[0x270F39F00]();
}

uint64_t krb5_store_string()
{
  return MEMORY[0x270F39F08]();
}

uint64_t krb5_store_uint16()
{
  return MEMORY[0x270F39F10]();
}

uint64_t krb5_store_uint32()
{
  return MEMORY[0x270F39F18]();
}

uint64_t krb5_string_to_uuid()
{
  return MEMORY[0x270F39F20]();
}

uint64_t krb5_ticket_get_authorization_data_type()
{
  return MEMORY[0x270F39F28]();
}

krb5_error_code krb5_timeofday(krb5_context a1, krb5_timestamp *a2)
{
  return MEMORY[0x270F39F30](a1, a2);
}

uint64_t krb5_tkt_creds_free()
{
  return MEMORY[0x270F39F38]();
}

uint64_t krb5_tkt_creds_get_creds()
{
  return MEMORY[0x270F39F40]();
}

uint64_t krb5_tkt_creds_init()
{
  return MEMORY[0x270F39F48]();
}

uint64_t krb5_tkt_creds_step()
{
  return MEMORY[0x270F39F50]();
}

krb5_error_code krb5_unparse_name(krb5_context a1, krb5_const_principal a2, char **a3)
{
  return MEMORY[0x270F39F58](a1, a2, a3);
}

krb5_error_code krb5_unparse_name_flags(krb5_context a1, krb5_const_principal a2, int a3, char **a4)
{
  return MEMORY[0x270F39F60](a1, a2, *(void *)&a3, a4);
}

krb5_error_code krb5_us_timeofday(krb5_context a1, krb5_timestamp *a2, krb5_int32 *a3)
{
  return MEMORY[0x270F39F68](a1, a2, a3);
}

uint64_t krb5_uuid_to_string()
{
  return MEMORY[0x270F39F70]();
}

krb5_error_code krb5_verify_checksum(krb5_context context, krb5_cksumtype ctype, const krb5_checksum *cksum, krb5_const_pointer in, size_t in_length, krb5_const_pointer seed, size_t seed_length)
{
  return MEMORY[0x270F39F78](context, *(void *)&ctype, cksum, in, in_length, seed, seed_length);
}

uint64_t krb5_verify_checksum_iov()
{
  return MEMORY[0x270F39F80]();
}

krb5_error_code krb5_verify_init_creds(krb5_context context, krb5_creds *creds, krb5_principal ap_req_server, krb5_keytab ap_req_keytab, krb5_ccache *ccache, krb5_verify_init_creds_opt *k5_vic_options)
{
  return MEMORY[0x270F39F88](context, creds, ap_req_server, ap_req_keytab, ccache, k5_vic_options);
}

void krb5_verify_init_creds_opt_init(krb5_verify_init_creds_opt *k5_vic_options)
{
}

void krb5_verify_init_creds_opt_set_ap_req_nofail(krb5_verify_init_creds_opt *k5_vic_options, int ap_req_nofail)
{
}

uint64_t krb5_xfree()
{
  return MEMORY[0x270F39FA0]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3A0](ptr, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x270EDA458](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

uint32_t notify_check(int token, int *check)
{
  return MEMORY[0x270EDA740](*(void *)&token, check);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x270EDA768](name, out_token);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_release(void *object)
{
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x270EDAD78](*(void *)&pid, *(void *)&flavor, arg, buffer, *(void *)&buffersize);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x270EDAEF0](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x270EDAF18](a1, a2);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF50](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x270EDAF58](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x270EDB048](a1, a2);
}

int res_9_ns_name_compress(const char *a1, u_char *a2, size_t a3, const u_char **a4, const u_char **a5)
{
  return MEMORY[0x270F9B208](a1, a2, a3, a4, a5);
}

uint64_t rk_cfstring2cstring()
{
  return MEMORY[0x270F39FA8]();
}

uint64_t rk_cloexec_file()
{
  return MEMORY[0x270F39FB0]();
}

uint64_t rk_hex_encode()
{
  return MEMORY[0x270F39FB8]();
}

uint64_t rk_strupr()
{
  return MEMORY[0x270F39FC0]();
}

uint64_t rtbl_add_column()
{
  return MEMORY[0x270F39FC8]();
}

uint64_t rtbl_add_column_entry()
{
  return MEMORY[0x270F39FD0]();
}

uint64_t rtbl_create()
{
  return MEMORY[0x270F39FD8]();
}

uint64_t rtbl_destroy()
{
  return MEMORY[0x270F39FE0]();
}

uint64_t rtbl_format_str()
{
  return MEMORY[0x270F39FE8]();
}

uint64_t rtbl_set_separator()
{
  return MEMORY[0x270F39FF0]();
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x270EDB590](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDB5A8](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x270EDB5D0](__s1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x270EDB620](a1, a2, a3);
}

char *__cdecl strsep(char **__stringp, const char *__delim)
{
  return (char *)MEMORY[0x270EDB688](__stringp, __delim);
}

size_t strspn(const char *__s, const char *__charset)
{
  return MEMORY[0x270EDB698](__s, __charset);
}

time_t time(time_t *a1)
{
  return MEMORY[0x270EDB930](a1);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x270EDBA58](a1, a2, a3);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x270EDBD38](xarray);
}

const uint8_t *__cdecl xpc_array_get_uuid(xpc_object_t xarray, size_t index)
{
  return (const uint8_t *)MEMORY[0x270EDBD80](xarray, index);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}