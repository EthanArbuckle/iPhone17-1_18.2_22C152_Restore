@interface _LSStringsFileContent
+ (id)IOQueue;
- (id)_queryLoadedPlist:(void *)a3 forRawKey:(void *)a4 locale:;
- (id)debugDescription;
- (id)getStringsFileContentAfterLocTableLoadedInBundle:(void *)a3 forLocale:;
- (id)getStringsFileContentInBundle:(void *)a3 forLocale:(const __CFString *)a4 withExtension:;
- (id)initWithStringsFile:(id)a1;
- (id)stringForString:(void *)a3 forLocale:(uint64_t)a4 fromBundle:(void *)a5 cacheLocalizations:;
- (id)subscriptLoctableWithLocale:(uint64_t)a1;
- (void)loadLoctableIfNecessaryFromBundle:(uint64_t)a1;
- (void)prewarmAllLocalizationsWithBundle:(void *)a3 forLocalizations:;
- (void)stringsFileContentFromBundle:(void *)a3 forLocaleCode:(void *)a4 cacheLocalizations:;
- (void)uncheckedObjectsForKeys:(void *)a3 forLocaleCode:(uint64_t)a4 fromBundle:(void *)a5 cacheLocalizations:;
@end

@implementation _LSStringsFileContent

- (id)initWithStringsFile:(id)a1
{
  id v3 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)_LSStringsFileContent;
    a1 = objc_msgSendSuper2(&v9, sel_init);
    if (a1)
    {
      uint64_t v4 = [v3 copy];
      v5 = (void *)*((void *)a1 + 1);
      *((void *)a1 + 1) = v4;

      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v7 = (void *)*((void *)a1 + 2);
      *((void *)a1 + 2) = v6;

      *((unsigned char *)a1 + 32) = 0;
    }
  }

  return a1;
}

- (void)uncheckedObjectsForKeys:(void *)a3 forLocaleCode:(uint64_t)a4 fromBundle:(void *)a5 cacheLocalizations:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  if (a1)
  {
    v12 = -[_LSStringsFileContent stringsFileContentFromBundle:forLocaleCode:cacheLocalizations:](a1, a4, v10, v11);
    v13 = v12;
    if (v12)
    {
      if (v12 == (void *)a1[3])
      {
        uint64_t v14 = -[_LSStringsFileContent subscriptLoctableWithLocale:]((uint64_t)a1, v10);
        v15 = (void *)v14;
        v16 = (void *)MEMORY[0x1E4F1CC08];
        if (v14) {
          v16 = (void *)v14;
        }
        a1 = v16;
      }
      else
      {
        if (v9) {
          [v12 uncheckedObjectsForKeys:v9];
        }
        else {
        a1 = -[_LSLazyPropertyList propertyList](v12);
        }
      }
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (id)stringForString:(void *)a3 forLocale:(uint64_t)a4 fromBundle:(void *)a5 cacheLocalizations:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  if (a1)
  {
    v12 = -[_LSStringsFileContent stringsFileContentFromBundle:forLocaleCode:cacheLocalizations:](a1, a4, v10, v11);
    if (v12)
    {
      if (![(id)__LSDefaultsGetSharedInstance() isRegionChina]
        || ([v9 stringByAppendingString:@"#CH"],
            v13 = objc_claimAutoreleasedReturnValue(),
            -[_LSStringsFileContent _queryLoadedPlist:forRawKey:locale:]((uint64_t)a1, v12, v13, v10),
            uint64_t v14 = objc_claimAutoreleasedReturnValue(),
            v13,
            !v14))
      {
        uint64_t v14 = -[_LSStringsFileContent _queryLoadedPlist:forRawKey:locale:]((uint64_t)a1, v12, v9, v10);
      }
    }
    else
    {
      uint64_t v14 = 0;
    }
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

+ (id)IOQueue
{
  if (+[_LSStringsFileContent IOQueue]::once != -1) {
    dispatch_once(&+[_LSStringsFileContent IOQueue]::once, &__block_literal_global_168);
  }
  v2 = (void *)+[_LSStringsFileContent IOQueue]::result;

  return v2;
}

- (id)debugDescription
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__48;
  v17 = __Block_byref_object_dispose__48;
  id v18 = 0;
  id v3 = [(id)objc_opt_class() IOQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41___LSStringsFileContent_debugDescription__block_invoke;
  block[3] = &unk_1E522DAF8;
  block[4] = self;
  block[5] = &v13;
  dispatch_sync(v3, block);

  uint64_t v4 = NSString;
  v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  uint64_t v7 = [(id)v14[5] count];
  v8 = [(id)v14[5] allKeys];
  id v9 = [v8 componentsJoinedByString:@", "];
  id v10 = [v4 stringWithFormat:@"<%@ %p> { %lu localizations loaded: %@ }", v6, self, v7, v9];

  _Block_object_dispose(&v13, 8);

  return v10;
}

- (void)loadLoctableIfNecessaryFromBundle:(uint64_t)a1
{
  if (a1)
  {
    if ((*(unsigned char *)(a1 + 32) & 1) == 0)
    {
      uint64_t v3 = -[_LSStringsFileContent getStringsFileContentInBundle:forLocale:withExtension:](a1, a2, 0, @"loctable");
      uint64_t v4 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v3;

      *(unsigned char *)(a1 + 32) |= 1u;
    }
  }
}

- (id)getStringsFileContentInBundle:(void *)a3 forLocale:(const __CFString *)a4 withExtension:
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = a3;
  if (a1)
  {
    CFURLRef v8 = CFBundleCopyResourceURLForLocalization(a2, *(CFStringRef *)(a1 + 8), a4, 0, v7);
    if (v8)
    {
      id v9 = _LSDefaultLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        id v10 = [(__CFURL *)v8 lastPathComponent];
        -[_LSStringsFileContent getStringsFileContentInBundle:forLocale:withExtension:](v10, (uint64_t)v7, v13, v9);
      }

      id v11 = +[_LSLazyPropertyList lazyPropertyListWithPropertyListURL:]((uint64_t)_LSLazyPropertyList, v8);
    }
    else
    {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)getStringsFileContentAfterLocTableLoadedInBundle:(void *)a3 forLocale:
{
  id v5 = a3;
  id v6 = v5;
  if (!a1)
  {
    id v7 = 0;
    goto LABEL_7;
  }
  if (!a2)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    id v10 = [NSString stringWithUTF8String:"-[_LSStringsFileContent getStringsFileContentAfterLocTableLoadedInBundle:forLocale:]"];
    [v9 handleFailureInFunction:v10, @"LSStringLocalizer.mm", 1158, @"Invalid parameter not satisfying: %@", @"bundle != NULL" file lineNumber description];

    if (v6) {
      goto LABEL_4;
    }
LABEL_11:
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    v12 = [NSString stringWithUTF8String:"-[_LSStringsFileContent getStringsFileContentAfterLocTableLoadedInBundle:forLocale:]"];
    [v11 handleFailureInFunction:v12, @"LSStringLocalizer.mm", 1159, @"Invalid parameter not satisfying: %@", @"localeCode != nil" file lineNumber description];

    goto LABEL_4;
  }
  if (!v5) {
    goto LABEL_11;
  }
LABEL_4:
  -[_LSStringsFileContent getStringsFileContentInBundle:forLocale:withExtension:](a1, a2, v6, @"strings");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    id v7 = *(id *)(a1 + 24);
    if (!v7)
    {
      _LSLazyPropertyListGetSharedEmptyPropertyList();
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
LABEL_7:

  return v7;
}

- (void)stringsFileContentFromBundle:(void *)a3 forLocaleCode:(void *)a4 cacheLocalizations:
{
  id v7 = a3;
  id v8 = a4;
  if (a1)
  {
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__48;
    v34 = __Block_byref_object_dispose__48;
    id v35 = 0;
    id v9 = [(id)objc_opt_class() IOQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __87___LSStringsFileContent_stringsFileContentFromBundle_forLocaleCode_cacheLocalizations___block_invoke;
    block[3] = &unk_1E522DD10;
    v29 = &v30;
    block[4] = a1;
    id v10 = v7;
    id v28 = v10;
    dispatch_sync(v9, block);

    id v11 = (void *)v31[5];
    if (!v11)
    {
      uint64_t v20 = MEMORY[0x1E4F143A8];
      uint64_t v21 = 3221225472;
      v22 = __87___LSStringsFileContent_stringsFileContentFromBundle_forLocaleCode_cacheLocalizations___block_invoke_2;
      v23 = &unk_1E5230BF8;
      v24 = a1;
      uint64_t v26 = a2;
      id v12 = v10;
      id v25 = v12;
      uint64_t v13 = (void (**)(void))MEMORY[0x18530F950](&v20);
      if (objc_msgSend(v8, "containsObject:", v12, v20, v21, v22, v23, v24))
      {
        uint64_t v14 = (void *)a1[2];
        uint64_t v15 = [(id)objc_opt_class() IOQueue];
        uint64_t v16 = _LSLazyLoadObjectForKey(v14, v12, v15, v13);
        v17 = (void *)v31[5];
        v31[5] = v16;
      }
      else
      {
        uint64_t v18 = v13[2](v13);
        uint64_t v15 = (void *)v31[5];
        v31[5] = v18;
      }

      id v11 = (void *)v31[5];
    }
    a1 = v11;

    _Block_object_dispose(&v30, 8);
  }

  return a1;
}

- (void)prewarmAllLocalizationsWithBundle:(void *)a3 forLocalizations:
{
  id v5 = a3;
  if (a1 && a2)
  {
    -[_LSStringsFileContent loadLoctableIfNecessaryFromBundle:](a1, a2);
    id v6 = [(id)objc_opt_class() IOQueue];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __76___LSStringsFileContent_prewarmAllLocalizationsWithBundle_forLocalizations___block_invoke;
    uint64_t v15 = &unk_1E5230C20;
    id v7 = v5;
    id v16 = v7;
    uint64_t v17 = a1;
    v19 = a2;
    id v8 = v6;
    id v18 = v8;
    id v9 = (void (**)(void, void))MEMORY[0x18530F950](&v12);
    id v10 = *(void **)(a1 + 24);
    if (v10)
    {
      objc_msgSend(v10, "prewarm", v12, v13, v14, v15, v16, v17);
    }
    else if (_LSContextIsCurrentThreadInitializing() || _LSDatabaseGetNoServerLock())
    {
      for (unint64_t i = 0; i < objc_msgSend(v7, "count", v12, v13, v14, v15, v16, v17); ++i)
        v9[2](v9, i);
    }
    else
    {
      dispatch_apply(objc_msgSend(v7, "count", v12, v13, v14, v15, v16, v17), 0, v9);
    }
  }
}

- (id)subscriptLoctableWithLocale:(uint64_t)a1
{
  v15[5] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = _LSGetProductNameSuffix();
    id v5 = _LSGetPlatformNameSuffix();
    CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CFB0];
    CFStringRef cf = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CFB0], 0, @"%@%@%@", v3, v4, v5);
    CFStringRef v7 = CFStringCreateWithFormat(v6, 0, @"%@%@%@", v3, v5, v4);
    CFStringRef v8 = CFStringCreateWithFormat(v6, 0, @"%@%@", v3, v5);
    CFStringRef v9 = CFStringCreateWithFormat(v6, 0, @"%@%@", v3, v4);
    uint64_t v10 = 0;
    v15[0] = cf;
    v15[1] = v7;
    v15[2] = v8;
    v15[3] = v9;
    v15[4] = v3;
    do
    {
      id v11 = [*(id *)(a1 + 24) objectForKey:v15[v10] ofClass:objc_opt_class()];
      if (v11) {
        break;
      }
    }
    while (v10++ != 4);
    if (v9) {
      CFRelease(v9);
    }
    if (v8) {
      CFRelease(v8);
    }
    if (v7) {
      CFRelease(v7);
    }
    if (cf) {
      CFRelease(cf);
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)_queryLoadedPlist:(void *)a3 forRawKey:(void *)a4 locale:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    if (*(id *)(a1 + 24) == v7)
    {
      id v11 = -[_LSStringsFileContent subscriptLoctableWithLocale:](a1, v9);
      uint64_t v12 = objc_opt_class();
      uint64_t v13 = [v11 objectForKey:v8];
      uint64_t v10 = (void *)v13;
      if (v12 && v13 && (objc_opt_isKindOfClass() & 1) == 0)
      {

        uint64_t v10 = 0;
      }
    }
    else
    {
      uint64_t v10 = [v7 objectForKey:v8 ofClass:objc_opt_class()];
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loctable, 0);
  objc_storeStrong((id *)&self->_stringsFileContent, 0);

  objc_storeStrong((id *)&self->_stringsFile, 0);
}

- (void)getStringsFileContentInBundle:(uint8_t *)buf forLocale:(os_log_t)log withExtension:.cold.1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_182959000, log, OS_LOG_TYPE_DEBUG, "reading %@ for %@", buf, 0x16u);
}

@end