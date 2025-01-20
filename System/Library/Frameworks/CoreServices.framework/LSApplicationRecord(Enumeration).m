@interface LSApplicationRecord(Enumeration)
+ (uint64_t)displayOrderEnumeratorForViableDefaultAppsForCategory:()Enumeration options:;
+ (void)displayOrderEnumeratorForViableDefaultAppsForCategory:()Enumeration options:;
@end

@implementation LSApplicationRecord(Enumeration)

+ (void)displayOrderEnumeratorForViableDefaultAppsForCategory:()Enumeration options:
{
  *(_DWORD *)v3 = 134218242;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1(&dword_182959000, a2, a3, "Couldn't lookup unit %llx to find its localized name: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

+ (uint64_t)displayOrderEnumeratorForViableDefaultAppsForCategory:()Enumeration options:
{
  v5 = (uint64_t **)(a1 + 2);
  uint64_t v4 = a1[2];
  if (!v4) {
    goto LABEL_12;
  }
  v6 = (uint64_t **)(a1 + 2);
  do
  {
    unsigned int v7 = *(_DWORD *)(v4 + 32);
    BOOL v8 = v7 >= a2;
    if (v7 >= a2) {
      v9 = (uint64_t *)v4;
    }
    else {
      v9 = (uint64_t *)(v4 + 8);
    }
    if (v8) {
      v6 = (uint64_t **)v4;
    }
    uint64_t v4 = *v9;
  }
  while (*v9);
  if (v6 != v5 && *((_DWORD *)v6 + 8) <= a2)
  {
    v15 = v6[5];
  }
  else
  {
LABEL_12:
    v10 = [LSApplicationRecord alloc];
    uint64_t v11 = *a1;
    id v19 = 0;
    id v12 = [(LSApplicationRecord *)v10 _initWithContext:v11 bundleID:a2 bundleData:0 error:&v19];
    id v13 = v19;
    if (!v12)
    {
      v14 = _LSDefaultLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        +[LSApplicationRecord(Enumeration) displayOrderEnumeratorForViableDefaultAppsForCategory:options:]::$_0::getAndCacheName(a2, (uint64_t)v13, v14);
      }
    }
    [v12 localizedName];
    unsigned int v17 = a2;
    v15 = (uint64_t *)(id)objc_claimAutoreleasedReturnValue();
    v18 = v15;
    std::__tree<std::__value_type<unsigned int,NSString * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,NSString * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,NSString * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::pair<unsigned int,NSString * {__strong}>>(v5 - 1, &v17, (uint64_t)&v17);
  }

  return v15;
}

@end