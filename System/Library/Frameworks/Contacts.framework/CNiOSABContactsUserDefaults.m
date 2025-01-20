@interface CNiOSABContactsUserDefaults
- (BOOL)isShortNameFormatEnabled;
- (BOOL)shortNameFormatPrefersNicknames;
- (CNiOSABContactsUserDefaults)init;
- (CNiOSABContactsUserDefaults)initWithABWrapper:(id)a3;
- (CNiOSABContactsUserDefaultsABWrapper)abWrapper;
- (NSCache)valueCache;
- (NSMutableDictionary)observerCountPerKey;
- (id)countryCode;
- (id)filteredGroupAndContainerIDs;
- (int64_t)displayNameOrder;
- (int64_t)lastIgnoredNewDuplicatesCount;
- (int64_t)newContactDisplayNameOrder;
- (int64_t)shortNameFormat;
- (int64_t)sortOrder;
- (void)_registerObserverForKey:(id)a3;
- (void)_unregisterObserverForKey:(id)a3;
- (void)addObserver:(id)a3 forKeyPath:(id)a4 options:(unint64_t)a5 context:(void *)a6;
- (void)dealloc;
- (void)flushCache;
- (void)removeObserver:(id)a3 forKeyPath:(id)a4;
- (void)setDisplayNameOrder:(int64_t)a3;
- (void)setFilteredGroupAndContainerIDs:(id)a3;
- (void)setLastIgnoredNewDuplicatesCount:(int64_t)a3;
- (void)setObserverCountPerKey:(id)a3;
- (void)setShortNameFormat:(int64_t)a3;
- (void)setShortNameFormatEnabled:(BOOL)a3;
- (void)setShortNameFormatPrefersNicknames:(BOOL)a3;
- (void)setValueCache:(id)a3;
@end

@implementation CNiOSABContactsUserDefaults

- (CNiOSABContactsUserDefaults)initWithABWrapper:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CNiOSABContactsUserDefaults;
  v6 = [(CNContactsUserDefaults *)&v14 init];
  if (v6)
  {
    ABInitialize();
    objc_storeStrong((id *)&v6->_abWrapper, a3);
    v7 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    valueCache = v6->_valueCache;
    v6->_valueCache = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    observerCountPerKey = v6->_observerCountPerKey;
    v6->_observerCountPerKey = v9;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v6, (CFNotificationCallback)__PreferencesChanged, @"com.apple.AddressBook.PreferenceChanged", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v12 = v6;
  }

  return v6;
}

- (CNiOSABContactsUserDefaults)init
{
  v3 = objc_alloc_init(CNiOSABContactsUserDefaultsABWrapper);
  v4 = [(CNiOSABContactsUserDefaults *)self initWithABWrapper:v3];

  return v4;
}

- (BOOL)shortNameFormatPrefersNicknames
{
  v3 = [(NSCache *)self->_valueCache objectForKey:@"shortNameFormatPrefersNicknames"];
  uint64_t v4 = [v3 integerValue];
  if (v3)
  {
    uint64_t v5 = v4;
  }
  else
  {
    v6 = [(CNiOSABContactsUserDefaults *)self abWrapper];
    uint64_t v5 = [v6 ABPersonGetShortNamePreferNicknames];

    valueCache = self->_valueCache;
    v8 = [NSNumber numberWithInteger:v5];
    [(NSCache *)valueCache setObject:v8 forKey:@"shortNameFormatPrefersNicknames"];
  }
  return v5 != 0;
}

- (BOOL)isShortNameFormatEnabled
{
  v3 = [(NSCache *)self->_valueCache objectForKey:@"shortNameFormatEnabled"];
  uint64_t v4 = [v3 integerValue];
  if (v3)
  {
    uint64_t v5 = v4;
  }
  else
  {
    v6 = [(CNiOSABContactsUserDefaults *)self abWrapper];
    uint64_t v5 = [v6 ABPersonGetShortNameFormatEnabled];

    valueCache = self->_valueCache;
    v8 = [NSNumber numberWithInteger:v5];
    [(NSCache *)valueCache setObject:v8 forKey:@"shortNameFormatEnabled"];
  }
  return v5 != 0;
}

- (int64_t)displayNameOrder
{
  v3 = [(NSCache *)self->_valueCache objectForKey:@"displayNameOrder"];
  uint64_t v4 = [v3 integerValue];
  if (v3)
  {
    int64_t v5 = v4;
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __47__CNiOSABContactsUserDefaults_displayNameOrder__block_invoke;
    v9[3] = &unk_1E56B52C8;
    v9[4] = self;
    int64_t v5 = __47__CNiOSABContactsUserDefaults_displayNameOrder__block_invoke((uint64_t)v9);
    valueCache = self->_valueCache;
    v7 = [NSNumber numberWithInteger:v5];
    [(NSCache *)valueCache setObject:v7 forKey:@"displayNameOrder"];
  }
  return v5;
}

- (int64_t)sortOrder
{
  v3 = [(NSCache *)self->_valueCache objectForKey:@"sortOrder"];
  uint64_t v4 = [v3 integerValue];
  if (v3)
  {
    int64_t v5 = v4;
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __40__CNiOSABContactsUserDefaults_sortOrder__block_invoke;
    v9[3] = &unk_1E56B52C8;
    v9[4] = self;
    int64_t v5 = __40__CNiOSABContactsUserDefaults_sortOrder__block_invoke((uint64_t)v9);
    valueCache = self->_valueCache;
    v7 = [NSNumber numberWithInteger:v5];
    [(NSCache *)valueCache setObject:v7 forKey:@"sortOrder"];
  }
  return v5;
}

uint64_t __40__CNiOSABContactsUserDefaults_sortOrder__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) abWrapper];
  uint64_t v2 = [v1 ABPersonGetSortOrdering];

  v3 = +[CNiOSABConstantsMapping ABToCNContactSortOrderConstantsMapping];
  uint64_t v4 = [NSNumber numberWithUnsignedInt:v2];
  int64_t v5 = [v3 mappedConstant:v4];
  uint64_t v6 = [v5 unsignedIntegerValue];

  return v6;
}

uint64_t __47__CNiOSABContactsUserDefaults_displayNameOrder__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) abWrapper];
  uint64_t v2 = [v1 ABPersonGetCompositeNameFormatForRecord:0];

  v3 = +[CNiOSABConstantsMapping ABtoCNContactDisplayNameOrderConstantsMapping];
  uint64_t v4 = [NSNumber numberWithUnsignedInt:v2];
  int64_t v5 = [v3 mappedConstant:v4];
  uint64_t v6 = [v5 unsignedIntegerValue];

  return v6;
}

id __59__CNiOSABContactsUserDefaults_filteredGroupAndContainerIDs__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) abWrapper];
  uint64_t v2 = [v1 displayedContactsFilterRepresentationPref];

  return v2;
}

- (CNiOSABContactsUserDefaultsABWrapper)abWrapper
{
  return self->_abWrapper;
}

- (void)addObserver:(id)a3 forKeyPath:(id)a4 options:(unint64_t)a5 context:(void *)a6
{
  id v10 = a4;
  id v11 = a3;
  [(CNiOSABContactsUserDefaults *)self _registerObserverForKey:v10];
  v12.receiver = self;
  v12.super_class = (Class)CNiOSABContactsUserDefaults;
  [(CNiOSABContactsUserDefaults *)&v12 addObserver:v11 forKeyPath:v10 options:a5 context:a6];
}

- (void)_registerObserverForKey:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CNiOSABContactsUserDefaults *)self observerCountPerKey];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "unsignedIntegerValue") + 1);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  v7 = [(CNiOSABContactsUserDefaults *)self observerCountPerKey];
  [v7 setObject:v8 forKeyedSubscript:v4];
}

- (NSMutableDictionary)observerCountPerKey
{
  return self->_observerCountPerKey;
}

- (id)filteredGroupAndContainerIDs
{
  v3 = [(NSCache *)self->_valueCache objectForKey:@"filteredGroupAndContainerIDs"];
  if (!v3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __59__CNiOSABContactsUserDefaults_filteredGroupAndContainerIDs__block_invoke;
    v5[3] = &unk_1E56B5318;
    v5[4] = self;
    v3 = __59__CNiOSABContactsUserDefaults_filteredGroupAndContainerIDs__block_invoke((uint64_t)v5);
    if (v3) {
      [(NSCache *)self->_valueCache setObject:v3 forKey:@"filteredGroupAndContainerIDs"];
    }
  }

  return v3;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.AddressBook.PreferenceChanged", 0);
  v4.receiver = self;
  v4.super_class = (Class)CNiOSABContactsUserDefaults;
  [(CNiOSABContactsUserDefaults *)&v4 dealloc];
}

- (void)flushCache
{
  id v2 = [(CNiOSABContactsUserDefaults *)self valueCache];
  [v2 removeAllObjects];
}

- (void)_unregisterObserverForKey:(id)a3
{
  id v9 = a3;
  objc_super v4 = [(CNiOSABContactsUserDefaults *)self observerCountPerKey];
  int64_t v5 = [v4 objectForKeyedSubscript:v9];

  uint64_t v6 = [v5 unsignedIntegerValue];
  if (v6 == 1)
  {
    v7 = 0;
  }
  else
  {
    v7 = [NSNumber numberWithUnsignedInteger:v6 - 1];
  }

  id v8 = [(CNiOSABContactsUserDefaults *)self observerCountPerKey];
  [v8 setObject:v7 forKeyedSubscript:v9];
}

- (void)removeObserver:(id)a3 forKeyPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(CNiOSABContactsUserDefaults *)self _unregisterObserverForKey:v6];
  v8.receiver = self;
  v8.super_class = (Class)CNiOSABContactsUserDefaults;
  [(CNiOSABContactsUserDefaults *)&v8 removeObserver:v7 forKeyPath:v6];
}

- (int64_t)newContactDisplayNameOrder
{
  v3 = [(NSCache *)self->_valueCache objectForKey:@"newContactDisplayNameOrder"];
  uint64_t v4 = [v3 integerValue];
  if (v3)
  {
    int64_t v5 = v4;
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __57__CNiOSABContactsUserDefaults_newContactDisplayNameOrder__block_invoke;
    v9[3] = &unk_1E56B52C8;
    v9[4] = self;
    int64_t v5 = __57__CNiOSABContactsUserDefaults_newContactDisplayNameOrder__block_invoke((uint64_t)v9);
    valueCache = self->_valueCache;
    id v7 = [NSNumber numberWithInteger:v5];
    [(NSCache *)valueCache setObject:v7 forKey:@"newContactDisplayNameOrder"];
  }
  return v5;
}

uint64_t __57__CNiOSABContactsUserDefaults_newContactDisplayNameOrder__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) abWrapper];
  int v3 = [v2 ABPersonGetEditNameFormat];

  if (v3)
  {
    BOOL v4 = v3 == 1;
  }
  else
  {
    int64_t v5 = [*(id *)(a1 + 32) abWrapper];
    int v6 = [v5 ABPersonGetCompositeNameFormatForRecord:0];

    BOOL v4 = v6 == 0;
  }
  if (v4) {
    return 1;
  }
  else {
    return 2;
  }
}

- (void)setDisplayNameOrder:(int64_t)a3
{
  [(NSCache *)self->_valueCache removeObjectForKey:@"displayNameOrder"];
  int64_t v5 = +[CNiOSABConstantsMapping CNToABCompositeNameFormatConstantsMapping];
  int v6 = [NSNumber numberWithInteger:a3];
  id v7 = [v5 mappedConstant:v6];
  uint64_t v8 = [v7 unsignedIntValue];

  id v9 = [(CNiOSABContactsUserDefaults *)self abWrapper];
  [v9 ABPersonSetCompositeNameFormat:v8];
}

- (void)setShortNameFormat:(int64_t)a3
{
  [(NSCache *)self->_valueCache removeObjectForKey:@"shortNameFormat"];
  int64_t v5 = +[CNiOSABConstantsMapping CNToABPersonShortNameFormatConstantsMapping];
  int v6 = [NSNumber numberWithInteger:a3];
  id v11 = [v5 mappedConstant:v6];

  id v7 = [MEMORY[0x1E4F1CA98] null];

  uint64_t v8 = v11;
  if (v11 != v7)
  {
    uint64_t v9 = [v11 unsignedIntValue];
    id v10 = [(CNiOSABContactsUserDefaults *)self abWrapper];
    [v10 ABPersonSetShortNameFormat:v9];

    uint64_t v8 = v11;
  }
}

- (int64_t)shortNameFormat
{
  int v3 = [(NSCache *)self->_valueCache objectForKey:@"shortNameFormat"];
  uint64_t v4 = [v3 integerValue];
  if (v3)
  {
    int64_t v5 = v4;
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __46__CNiOSABContactsUserDefaults_shortNameFormat__block_invoke;
    v9[3] = &unk_1E56B52C8;
    v9[4] = self;
    int64_t v5 = __46__CNiOSABContactsUserDefaults_shortNameFormat__block_invoke((uint64_t)v9);
    valueCache = self->_valueCache;
    id v7 = [NSNumber numberWithInteger:v5];
    [(NSCache *)valueCache setObject:v7 forKey:@"shortNameFormat"];
  }
  return v5;
}

uint64_t __46__CNiOSABContactsUserDefaults_shortNameFormat__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) abWrapper];
  uint64_t v2 = [v1 ABPersonGetShortNameFormat];

  int v3 = +[CNiOSABConstantsMapping ABToCNContactShortNameFormatConstantsMapping];
  uint64_t v4 = [NSNumber numberWithUnsignedInt:v2];
  int64_t v5 = [v3 mappedConstant:v4];

  uint64_t v6 = [v5 integerValue];
  return v6;
}

- (void)setShortNameFormatEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  [(NSCache *)self->_valueCache removeObjectForKey:@"shortNameFormatEnabled"];
  id v5 = [(CNiOSABContactsUserDefaults *)self abWrapper];
  [v5 ABPersonSetShortNameFormatEnabled:v3];
}

uint64_t __55__CNiOSABContactsUserDefaults_isShortNameFormatEnabled__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) abWrapper];
  uint64_t v2 = [v1 ABPersonGetShortNameFormatEnabled];

  return v2;
}

- (void)setShortNameFormatPrefersNicknames:(BOOL)a3
{
  BOOL v3 = a3;
  [(NSCache *)self->_valueCache removeObjectForKey:@"shortNameFormatPrefersNicknames"];
  id v5 = [(CNiOSABContactsUserDefaults *)self abWrapper];
  [v5 ABPersonSetShortNamePreferNicknames:v3];
}

uint64_t __62__CNiOSABContactsUserDefaults_shortNameFormatPrefersNicknames__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) abWrapper];
  uint64_t v2 = [v1 ABPersonGetShortNamePreferNicknames];

  return v2;
}

- (id)countryCode
{
  BOOL v3 = [(NSCache *)self->_valueCache objectForKey:@"countryCode"];
  if (!v3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __42__CNiOSABContactsUserDefaults_countryCode__block_invoke;
    v5[3] = &unk_1E56B52F0;
    v5[4] = self;
    BOOL v3 = __42__CNiOSABContactsUserDefaults_countryCode__block_invoke((uint64_t)v5);
    if (v3) {
      [(NSCache *)self->_valueCache setObject:v3 forKey:@"countryCode"];
    }
  }

  return v3;
}

id __42__CNiOSABContactsUserDefaults_countryCode__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) abWrapper];
  uint64_t v2 = [v1 abDefaultCountryCode];

  return v2;
}

- (void)setFilteredGroupAndContainerIDs:(id)a3
{
  valueCache = self->_valueCache;
  id v5 = a3;
  [(NSCache *)valueCache removeObjectForKey:@"filteredGroupAndContainerIDs"];
  id v6 = [(CNiOSABContactsUserDefaults *)self abWrapper];
  [v6 setDisplayedContactsFilterRepresentationPref:v5];
}

- (int64_t)lastIgnoredNewDuplicatesCount
{
  BOOL v3 = [(NSCache *)self->_valueCache objectForKey:@"lastIgnoredNewDuplicatesCount"];
  uint64_t v4 = [v3 integerValue];
  if (v3)
  {
    int64_t v5 = v4;
  }
  else
  {
    id v6 = [(CNiOSABContactsUserDefaults *)self abWrapper];
    int64_t v5 = [v6 lastIgnoredNewDuplicatesCount];

    valueCache = self->_valueCache;
    uint64_t v8 = [NSNumber numberWithInteger:v5];
    [(NSCache *)valueCache setObject:v8 forKey:@"lastIgnoredNewDuplicatesCount"];
  }
  return v5;
}

uint64_t __60__CNiOSABContactsUserDefaults_lastIgnoredNewDuplicatesCount__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) abWrapper];
  uint64_t v2 = [v1 lastIgnoredNewDuplicatesCount];

  return v2;
}

- (void)setLastIgnoredNewDuplicatesCount:(int64_t)a3
{
  [(NSCache *)self->_valueCache removeObjectForKey:@"lastIgnoredNewDuplicatesCount"];
  id v5 = [(CNiOSABContactsUserDefaults *)self abWrapper];
  [v5 setLastIgnoredNewDuplicatesCount:a3];
}

- (void)setObserverCountPerKey:(id)a3
{
}

- (NSCache)valueCache
{
  return self->_valueCache;
}

- (void)setValueCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_abWrapper, 0);
  objc_storeStrong((id *)&self->_valueCache, 0);

  objc_storeStrong((id *)&self->_observerCountPerKey, 0);
}

@end