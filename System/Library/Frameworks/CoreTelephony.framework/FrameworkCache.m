@interface FrameworkCache
+ (SEL)getCacheableSelectorForNotification:(id)a3;
+ (unsigned)getCachePolicyForSelector:(SEL)a3;
- (FrameworkCache)init;
- (id)valueForSelector:(SEL)a3;
- (void)handleDisconnection;
- (void)handleNotification:(id)a3;
- (void)handleValue:(id)a3 forSelector:(SEL)a4;
@end

@implementation FrameworkCache

- (void)handleNotification:(id)a3
{
  v11[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(id)objc_opt_class() getCacheableSelectorForNotification:v4];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F29238] valueWithPointer:v5];
    v7 = self;
    objc_sync_enter(v7);
    v8 = [(NSMutableDictionary *)v7->_selectorValueDict objectForKey:v6];

    if (v8)
    {
      v9 = CTLogClientCache();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v10 = NSStringFromSelector((SEL)[v4 selector]);
        [(FrameworkCache *)v10 handleNotification:v9];
      }
      [(NSMutableDictionary *)v7->_selectorValueDict removeObjectForKey:v6];
    }
    objc_sync_exit(v7);
  }
}

+ (SEL)getCacheableSelectorForNotification:(id)a3
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  {
    v16[0] = (unint64_t)sel_currentDataServiceDescriptorChanged_;
    v16[1] = (unint64_t)sel_getCurrentDataServiceDescriptor_;
    std::map<objc_selector *,objc_selector *>::map[abi:nn180100]((uint64_t)&v13, v16, 1);
    v12 = (void *)v14;
    +[FrameworkCache getCacheableSelectorForNotification:]::notificationSelectors = (uint64_t)v13;
    qword_1EB2879B0 = v14;
    qword_1EB2879B8 = v15;
    if (v15)
    {
      *(void *)(v14 + 16) = &qword_1EB2879B0;
      v13 = &v14;
      uint64_t v14 = 0;
      uint64_t v15 = 0;
      v12 = 0;
    }
    else
    {
      +[FrameworkCache getCacheableSelectorForNotification:]::notificationSelectors = (uint64_t)&qword_1EB2879B0;
    }
    std::__tree<std::__value_type<objc_selector *,objc_selector *>,std::__map_value_compare<objc_selector *,std::__value_type<objc_selector *,objc_selector *>,std::less<objc_selector *>,true>,std::allocator<std::__value_type<objc_selector *,objc_selector *>>>::destroy((uint64_t)&v13, v12);
  }
  unint64_t v4 = [v3 selector];
  uint64_t v5 = qword_1EB2879B0;
  if (!qword_1EB2879B0) {
    goto LABEL_13;
  }
  v6 = &qword_1EB2879B0;
  do
  {
    unint64_t v7 = *(void *)(v5 + 32);
    BOOL v8 = v7 >= v4;
    if (v7 >= v4) {
      v9 = (uint64_t *)v5;
    }
    else {
      v9 = (uint64_t *)(v5 + 8);
    }
    if (v8) {
      v6 = (uint64_t *)v5;
    }
    uint64_t v5 = *v9;
  }
  while (*v9);
  if (v6 != &qword_1EB2879B0 && v4 >= v6[4]) {
    v10 = (const char *)v6[5];
  }
  else {
LABEL_13:
  }
    v10 = 0;

  return v10;
}

- (FrameworkCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)FrameworkCache;
  v2 = [(FrameworkCache *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
    selectorValueDict = v2->_selectorValueDict;
    v2->_selectorValueDict = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void).cxx_destruct
{
}

- (id)valueForSelector:(SEL)a3
{
  v11[3] = *MEMORY[0x1E4F143B8];
  unint64_t v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [MEMORY[0x1E4F29238] valueWithPointer:a3];
  objc_super v6 = [(NSMutableDictionary *)v4->_selectorValueDict objectForKey:v5];
  if (v6)
  {
    unint64_t v7 = CTLogClientCache();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      BOOL v8 = NSStringFromSelector(a3);
      [(FrameworkCache *)v8 valueForSelector:(uint64_t)v11];
    }
    id v9 = v6;
  }

  objc_sync_exit(v4);

  return v6;
}

- (void)handleDisconnection
{
  *(_DWORD *)a2 = 138412290;
  *a3 = a1;
  OUTLINED_FUNCTION_5(&dword_18444A000, a4, (uint64_t)a3, "[XXX] Purging value for selector '%@'", a2);
}

- (void)handleValue:(id)a3 forSelector:(SEL)a4
{
  v14[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(id)objc_opt_class() getCachePolicyForSelector:a4])
  {
    unint64_t v7 = [MEMORY[0x1E4F29238] valueWithPointer:a4];
    BOOL v8 = self;
    objc_sync_enter(v8);
    if (v6)
    {
      id v9 = CTLogClientCache();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v10 = NSStringFromSelector(a4);
        -[FrameworkCache handleValue:forSelector:](v10, (uint64_t)v6, (uint64_t)v14);
      }
      [(NSMutableDictionary *)v8->_selectorValueDict setObject:v6 forKey:v7];
    }
    else
    {
      v11 = [(NSMutableDictionary *)v8->_selectorValueDict objectForKey:v7];

      if (v11)
      {
        v12 = CTLogClientCache();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          v13 = NSStringFromSelector(a4);
          -[FrameworkCache handleValue:forSelector:](v13, (uint64_t)v14, v12);
        }
        [(NSMutableDictionary *)v8->_selectorValueDict removeObjectForKey:v7];
      }
    }
    objc_sync_exit(v8);
  }
}

+ (unsigned)getCachePolicyForSelector:(SEL)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  {
    v10 = a3;
    uint64_t v14 = sel_getCurrentDataServiceDescriptor_;
    char v15 = 2;
    id v9 = (void *)v12;
    +[FrameworkCache getCachePolicyForSelector:]::cacheableSelectors = (uint64_t)v11;
    qword_1EB286C20 = v12;
    qword_1EB286C28 = v13;
    if (v13)
    {
      *(void *)(v12 + 16) = &qword_1EB286C20;
      v11 = &v12;
      uint64_t v12 = 0;
      uint64_t v13 = 0;
      id v9 = 0;
    }
    else
    {
      +[FrameworkCache getCachePolicyForSelector:]::cacheableSelectors = (uint64_t)&qword_1EB286C20;
    }
    a3 = v10;
  }
  uint64_t v3 = qword_1EB286C20;
  if (!qword_1EB286C20) {
    return 0;
  }
  unint64_t v4 = &qword_1EB286C20;
  do
  {
    unint64_t v5 = *(void *)(v3 + 32);
    BOOL v6 = v5 >= (unint64_t)a3;
    if (v5 >= (unint64_t)a3) {
      unint64_t v7 = (uint64_t *)v3;
    }
    else {
      unint64_t v7 = (uint64_t *)(v3 + 8);
    }
    if (v6) {
      unint64_t v4 = (uint64_t *)v3;
    }
    uint64_t v3 = *v7;
  }
  while (*v7);
  if (v4 != &qword_1EB286C20 && v4[4] <= (unint64_t)a3) {
    return *((unsigned char *)v4 + 40);
  }
  else {
    return 0;
  }
}

- (void)handleValue:(NSObject *)a3 forSelector:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_5(&dword_18444A000, a3, (uint64_t)a3, "Removing value for selector '%@'", (uint8_t *)a2);
}

- (void)handleValue:(uint64_t)a3 forSelector:.cold.2(void *a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_4((uint64_t)a1, a2, a3, 5.778e-34);
  _os_log_debug_impl(&dword_18444A000, v5, OS_LOG_TYPE_DEBUG, "Caching value for selector '%@': %@", v4, 0x16u);
}

- (void)handleNotification:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_5(&dword_18444A000, a3, (uint64_t)a3, "Purging value due to notification for selector '%@'", (uint8_t *)a2);
}

- (void)valueForSelector:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_4((uint64_t)a1, a2, a3, 5.778e-34);
  _os_log_debug_impl(&dword_18444A000, v5, OS_LOG_TYPE_DEBUG, "Found cached value for selector '%@': %@", v4, 0x16u);
}

@end