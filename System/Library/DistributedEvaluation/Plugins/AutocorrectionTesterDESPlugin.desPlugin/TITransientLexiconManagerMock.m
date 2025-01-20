@interface TITransientLexiconManagerMock
+ (id)getEntries:(_LXLexicon *)a3;
+ (id)tokenizeEntity:(id)a3;
- (BOOL)isSupplementalLexiconSearchEnabled;
- (BOOL)searchForWord:(id)a3;
- (BOOL)searchForWordCaseInsensitive:(id)a3;
- (BOOL)searchHelper:(_LXLexicon *)a3 forWord:(__CFString *)a4 caseSensitive:(BOOL)a5;
- (NSArray)observers;
- (TITransientLexiconManagerMock)init;
- (TITransientLexiconManagerMock)initWithTransientData:(id)a3 namedEntities:(id)a4;
- (_LXLexicon)addressBookLexiconForLocale:(const char *)a3;
- (_LXLexicon)appNameLexiconForLocale:(const char *)a3;
- (_LXLexicon)namedEntityLexicon;
- (_LXLexicon)namedEntityLexiconForLocale:(const char *)a3;
- (_LXLexicon)namedEntityPhraseLexicon;
- (_LXLexicon)namedEntityPhraseLexiconForLocale:(const char *)a3;
- (id)addContactObserver:(id)a3;
- (id)ensureSupplementalLexicons;
- (id)supplementalLexicons;
- (int)acceptedCount;
- (int)offeredCount;
- (void)addEntry:(id)a3 toLexicon:(_LXLexicon *)a4;
- (void)dealloc;
- (void)debugLogEntities;
- (void)getOnce:(id)a3;
- (void)provideFeedbackForString:(id)a3 type:(unsigned __int8)a4 style:(unsigned __int8)a5;
- (void)removeContactObserver:(id)a3;
- (void)setAcceptedCount:(int)a3;
- (void)setNewContactCollection:(id)a3;
- (void)setOfferedCount:(int)a3;
- (void)setSupplementalLexiconSearchEnabled:(BOOL)a3;
@end

@implementation TITransientLexiconManagerMock

- (TITransientLexiconManagerMock)init
{
  v4.receiver = self;
  v4.super_class = (Class)TITransientLexiconManagerMock;
  v2 = [(TITransientLexiconManagerMock *)&v4 init];
  if (v2)
  {
    v2->_namedEntityLexiconRef = 0;
    v2->_namedEntityPhraseLexiconRef = 0;
    operator new();
  }

  return 0;
}

- (void)addEntry:(id)a3 toLexicon:(_LXLexicon *)a4
{
  id v5 = a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  v6 = (void (*)(_LXLexicon *, id, void))off_AE410;
  v13 = off_AE410;
  if (!off_AE410)
  {
    v7 = (void *)sub_29B2C();
    v11[3] = (uint64_t)dlsym(v7, "LXLexiconAdd");
    off_AE410 = (_UNKNOWN *)v11[3];
    v6 = (void (*)(_LXLexicon *, id, void))v11[3];
  }
  _Block_object_dispose(&v10, 8);
  if (!v6) {
    goto LABEL_8;
  }
  v6(a4, v5, 0);
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  v8 = (void (*)(_LXLexicon *, id, uint64_t))off_AE420;
  v13 = off_AE420;
  if (!off_AE420)
  {
    v9 = (void *)sub_29B2C();
    v11[3] = (uint64_t)dlsym(v9, "LXLexiconIncrementUsageCount");
    off_AE420 = (_UNKNOWN *)v11[3];
    v8 = (void (*)(_LXLexicon *, id, uint64_t))v11[3];
  }
  _Block_object_dispose(&v10, 8);
  if (v8)
  {
    v8(a4, v5, 1);
  }
  else
  {
LABEL_8:
    dlerror();
    abort_report_np();
    __break(1u);
  }
}

+ (id)tokenizeEntity:(id)a3
{
  id v3 = a3;
  objc_super v4 = +[NSMutableArray array];
  id v5 = [v3 stringByAppendingString:@" "];

  id v6 = [v5 length];
  id v7 = [v5 length];
  __chkstk_darwin();
  id v13 = [v5 length];
  objc_msgSend(v5, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", (char *)v11 - ((4 * (void)v6 + 15) & 0xFFFFFFFFFFFFFFF0), 4 * (void)v6, &v13, 4, 0, 0, v7, 0);
  CFLocaleRef v8 = CFLocaleCreate(0, @"en_US");
  LMStreamTokenizerCreate();
  v11[1] = _NSConcreteStackBlock;
  v11[2] = 3221225472;
  v11[3] = sub_27E08;
  v11[4] = &unk_8D248;
  id v9 = v4;
  id v12 = v9;
  LMStreamTokenizerPushBytes();
  LMStreamTokenizerRelease();
  CFRelease(v8);

  return v9;
}

- (TITransientLexiconManagerMock)initWithTransientData:(id)a3 namedEntities:(id)a4
{
  id v27 = a3;
  id v28 = a4;
  v40.receiver = self;
  v40.super_class = (Class)TITransientLexiconManagerMock;
  id v7 = [(TITransientLexiconManagerMock *)&v40 init];
  CFLocaleRef v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_contactCollection, a3);
    Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    id v10 = sub_283D0();
    CFDictionaryAddValue(Mutable, v10, @"InputContext-NamedEntityWords");
    id v11 = sub_284D8();
    CFDictionaryAddValue(Mutable, v11, @"en_US");
    CFTypeRef cf = 0;
    v8->_namedEntityLexiconRef = (_LXLexicon *)sub_285E0((uint64_t)Mutable, (uint64_t)&cf);
    CFRelease(Mutable);
    if (cf)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v44 = "-[TITransientLexiconManagerMock initWithTransientData:namedEntities:]";
        __int16 v45 = 2112;
        CFTypeRef v46 = cf;
        _os_log_impl(&def_3B118, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s  Error: Unable to create transient mutable lexicon for named entities: %@", buf, 0x16u);
      }
      CFRelease(cf);
    }
    id v12 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    id v13 = sub_283D0();
    CFDictionaryAddValue(v12, v13, @"InputContext-NamedEntityPhrases");
    id v14 = sub_284D8();
    CFDictionaryAddValue(v12, v14, @"en_US");
    CFTypeRef v38 = 0;
    v8->_namedEntityPhraseLexiconRef = (_LXLexicon *)sub_285E0((uint64_t)v12, (uint64_t)&v38);
    CFRelease(v12);
    if (v38)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v44 = "-[TITransientLexiconManagerMock initWithTransientData:namedEntities:]";
        __int16 v45 = 2112;
        CFTypeRef v46 = v38;
        _os_log_impl(&def_3B118, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s  Error: Unable to create transient mutable lexicon for named entity phrases: %@", buf, 0x16u);
      }
      CFRelease(v38);
    }
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id obj = v28;
    id v15 = [obj countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v35;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v35 != v16) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = *(void *)(*((void *)&v34 + 1) + 8 * i);
          v19 = +[TITransientLexiconManagerMock tokenizeEntity:v18];
          if ((unint64_t)[v19 count] >= 2) {
            [(TITransientLexiconManagerMock *)v8 addEntry:v18 toLexicon:v8->_namedEntityPhraseLexiconRef];
          }
          long long v32 = 0u;
          long long v33 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          id v20 = v19;
          id v21 = [v20 countByEnumeratingWithState:&v30 objects:v41 count:16];
          if (v21)
          {
            uint64_t v22 = *(void *)v31;
            do
            {
              for (j = 0; j != v21; j = (char *)j + 1)
              {
                if (*(void *)v31 != v22) {
                  objc_enumerationMutation(v20);
                }
                [(TITransientLexiconManagerMock *)v8 addEntry:*(void *)(*((void *)&v30 + 1) + 8 * (void)j) toLexicon:v8->_namedEntityLexiconRef];
              }
              id v21 = [v20 countByEnumeratingWithState:&v30 objects:v41 count:16];
            }
            while (v21);
          }
        }
        id v15 = [obj countByEnumeratingWithState:&v34 objects:v42 count:16];
      }
      while (v15);
    }

    v24 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    observers = v8->_observers;
    v8->_observers = v24;

    operator new();
  }

  return 0;
}

- (void)dealloc
{
  namedEntityPhraseLexiconRef = self->_namedEntityPhraseLexiconRef;
  if (namedEntityPhraseLexiconRef) {
    CFRelease(namedEntityPhraseLexiconRef);
  }
  namedEntityLexiconRef = self->_namedEntityLexiconRef;
  if (namedEntityLexiconRef) {
    CFRelease(namedEntityLexiconRef);
  }
  addressBookLexicons = self->_addressBookLexicons;
  if (addressBookLexicons)
  {
    sub_29EF4((uint64_t)addressBookLexicons);
    operator delete();
  }
  appNameLexicons = self->_appNameLexicons;
  if (appNameLexicons)
  {
    sub_29EF4((uint64_t)appNameLexicons);
    operator delete();
  }
  v7.receiver = self;
  v7.super_class = (Class)TITransientLexiconManagerMock;
  [(TITransientLexiconManagerMock *)&v7 dealloc];
}

- (id)addContactObserver:(id)a3
{
  id v4 = a3;
  id v5 = [v4 copy];
  id v6 = self;
  objc_sync_enter(v6);
  observers = v6->_observers;
  id v8 = objc_retainBlock(v5);
  [(NSMutableArray *)observers addObject:v8];

  objc_sync_exit(v6);
  (*((void (**)(id, NSDictionary *))v5 + 2))(v5, v6->_contactCollection);
  id v9 = objc_retainBlock(v5);

  return v9;
}

- (void)setNewContactCollection:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_contactCollection, a3);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v6 = self->_observers;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * (void)v9) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * (void)v9));
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)removeContactObserver:(id)a3
{
  id obj = self;
  id v4 = a3;
  objc_sync_enter(obj);
  observers = obj->_observers;
  id v6 = objc_retainBlock(v4);

  [(NSMutableArray *)observers removeObjectIdenticalTo:v6];
  objc_sync_exit(obj);
}

- (void)getOnce:(id)a3
{
}

- (NSArray)observers
{
  return (NSArray *)self->_observers;
}

- (BOOL)searchHelper:(_LXLexicon *)a3 forWord:(__CFString *)a4 caseSensitive:(BOOL)a5
{
  if (!a3) {
    return 0;
  }
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_28CA0;
  v13[3] = &unk_8D270;
  BOOL v14 = a5;
  v13[4] = &v15;
  v13[5] = a4;
  id v7 = v13;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v8 = (void (*)(_LXLexicon *, __CFString *, void *))off_AE440;
  id v27 = off_AE440;
  if (!off_AE440)
  {
    v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472;
    id v21 = sub_29DE0;
    uint64_t v22 = &unk_8D298;
    v23 = &v24;
    id v9 = (void *)sub_29B2C();
    long long v10 = dlsym(v9, "LXLexiconEnumerateEntriesForString");
    *(void *)(v23[1] + 24) = v10;
    off_AE440 = *(_UNKNOWN **)(v23[1] + 24);
    uint64_t v8 = (void (*)(_LXLexicon *, __CFString *, void *))v25[3];
  }
  _Block_object_dispose(&v24, 8);
  if (v8)
  {
    v8(a3, a4, v7);

    BOOL v11 = *((unsigned char *)v16 + 24) != 0;
    _Block_object_dispose(&v15, 8);
    return v11;
  }
  dlerror();
  BOOL result = abort_report_np();
  __break(1u);
  return result;
}

- (BOOL)searchForWord:(id)a3
{
  id v4 = a3;
  LOBYTE(self) = [(TITransientLexiconManagerMock *)self searchHelper:[(TITransientLexiconManagerMock *)self namedEntityLexicon] forWord:v4 caseSensitive:1];

  return (char)self;
}

- (BOOL)searchForWordCaseInsensitive:(id)a3
{
  id v4 = a3;
  LOBYTE(self) = [(TITransientLexiconManagerMock *)self searchHelper:[(TITransientLexiconManagerMock *)self namedEntityLexicon] forWord:v4 caseSensitive:0];

  return (char)self;
}

- (_LXLexicon)namedEntityLexicon
{
  return self->_namedEntityLexiconRef;
}

- (_LXLexicon)namedEntityPhraseLexicon
{
  return self->_namedEntityPhraseLexiconRef;
}

- (_LXLexicon)namedEntityLexiconForLocale:(const char *)a3
{
  return self->_namedEntityLexiconRef;
}

- (_LXLexicon)namedEntityPhraseLexiconForLocale:(const char *)a3
{
  return self->_namedEntityPhraseLexiconRef;
}

- (_LXLexicon)addressBookLexiconForLocale:(const char *)a3
{
  KB::String::String((KB::String *)&v28, a3);
  if (!sub_29F74((void *)self->_addressBookLexicons, &v28, v4))
  {
    id v6 = v29;
    if (!v29) {
      id v6 = (const char *)&v30;
    }
    if ((_WORD)v28) {
      id v7 = v6;
    }
    else {
      id v7 = "";
    }
    uint64_t v8 = +[NSString stringWithUTF8String:v7];
    UIKeyboardStaticUnigramsFile();
    id v9 = (KB *)objc_claimAutoreleasedReturnValue();
    KB::utf8_string(v27, v9, v10);

    BOOL v11 = +[TIInputMode inputModeWithIdentifier:v8];
    UIKeyboardDeltaLexiconPathForInputMode();
    long long v12 = (KB *)objc_claimAutoreleasedReturnValue();
    KB::utf8_string(v26, v12, v13);

    KB::String::String((KB::String *)v25, (const KB::String *)&v28);
    KB::String::String((KB::String *)v24, (const KB::String *)v27);
    KB::String::String((KB::String *)v23, (const KB::String *)v26);
    KB::AddressBookTrieLoader::create();
    KB::String::~String((KB::String *)v23);
    KB::String::~String((KB::String *)v24);
    KB::String::~String((KB::String *)v25);
    addressBookLexicons = self->_addressBookLexicons;
    KB::String::String((KB::String *)v20, (const KB::String *)&v28);
    uint64_t v21 = v18;
    uint64_t v22 = v19;
    if (v19) {
      atomic_fetch_add_explicit(&v19->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    sub_2A08C((uint64_t)addressBookLexicons, v20, v20);
    if (v22) {
      sub_29E80(v22);
    }
    KB::String::~String((KB::String *)v20);
    if (v19) {
      sub_29E80(v19);
    }
    KB::String::~String((KB::String *)v26);
    KB::String::~String((KB::String *)v27);
  }
  uint64_t v15 = sub_29F74((void *)self->_addressBookLexicons, &v28, v5);
  if (!v15) {
    abort();
  }
  (*(void (**)(__n128 *__return_ptr))(*(void *)v15[6] + 16))(v20);
  uint64_t v16 = *(_LXLexicon **)v20[0].n128_u64[0];
  if (v20[0].n128_u64[1]) {
    sub_29E80((std::__shared_weak_count *)v20[0].n128_u64[1]);
  }
  KB::String::~String((KB::String *)&v28);
  return v16;
}

- (_LXLexicon)appNameLexiconForLocale:(const char *)a3
{
  KB::String::String((KB::String *)&v28, a3);
  if (!sub_29F74((void *)self->_appNameLexicons, &v28, v4))
  {
    id v6 = v29;
    if (!v29) {
      id v6 = (const char *)&v30;
    }
    if ((_WORD)v28) {
      id v7 = v6;
    }
    else {
      id v7 = "";
    }
    uint64_t v8 = +[NSString stringWithUTF8String:v7];
    UIKeyboardStaticUnigramsFile();
    id v9 = (KB *)objc_claimAutoreleasedReturnValue();
    KB::utf8_string(v27, v9, v10);

    BOOL v11 = +[TIInputMode inputModeWithIdentifier:v8];
    UIKeyboardDeltaLexiconPathForInputMode();
    long long v12 = (KB *)objc_claimAutoreleasedReturnValue();
    KB::utf8_string(v26, v12, v13);

    KB::String::String((KB::String *)v25, (const KB::String *)&v28);
    KB::String::String((KB::String *)v24, (const KB::String *)v27);
    KB::String::String((KB::String *)v23, (const KB::String *)v26);
    KB::AppTrieLoader::create();
    KB::String::~String((KB::String *)v23);
    KB::String::~String((KB::String *)v24);
    KB::String::~String((KB::String *)v25);
    appNameLexicons = self->_appNameLexicons;
    KB::String::String((KB::String *)v20, (const KB::String *)&v28);
    uint64_t v21 = v18;
    uint64_t v22 = v19;
    if (v19) {
      atomic_fetch_add_explicit(&v19->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    sub_2A65C((uint64_t)appNameLexicons, v20, v20);
    if (v22) {
      sub_29E80(v22);
    }
    KB::String::~String((KB::String *)v20);
    if (v19) {
      sub_29E80(v19);
    }
    KB::String::~String((KB::String *)v26);
    KB::String::~String((KB::String *)v27);
  }
  uint64_t v15 = sub_29F74((void *)self->_appNameLexicons, &v28, v5);
  if (!v15) {
    abort();
  }
  (*(void (**)(__n128 *__return_ptr))(*(void *)v15[6] + 16))(v20);
  uint64_t v16 = *(_LXLexicon **)v20[0].n128_u64[0];
  if (v20[0].n128_u64[1]) {
    sub_29E80((std::__shared_weak_count *)v20[0].n128_u64[1]);
  }
  KB::String::~String((KB::String *)&v28);
  return v16;
}

- (id)ensureSupplementalLexicons
{
  return 0;
}

- (id)supplementalLexicons
{
  return 0;
}

+ (id)getEntries:(_LXLexicon *)a3
{
  return +[NSMutableArray array];
}

- (void)debugLogEntities
{
  if (self->_namedEntityLexiconRef)
  {
    +[TITransientLexiconManagerMock getEntries:](TITransientLexiconManagerMock, "getEntries:");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    if ([v5 count])
    {
      id v3 = [v5 componentsJoinedByString:@"|"];
      NSLog(@"Named entities %@", v3);
    }
    else
    {
      NSLog(@"Named entities empty");
    }
  }
  if (self->_namedEntityPhraseLexiconRef)
  {
    +[TITransientLexiconManagerMock getEntries:](TITransientLexiconManagerMock, "getEntries:");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if ([v6 count])
    {
      unsigned int v4 = [v6 componentsJoinedByString:@"|"];
      NSLog(@"Named phrase entities %@", v4);
    }
    else
    {
      NSLog(@"Named phrase entities empty");
    }
  }
}

- (void)provideFeedbackForString:(id)a3 type:(unsigned __int8)a4 style:(unsigned __int8)a5
{
  if (a4 == 3)
  {
    uint64_t v5 = 60;
  }
  else
  {
    if (a4 != 1) {
      return;
    }
    uint64_t v5 = 64;
  }
  ++*(_DWORD *)((char *)&self->super.isa + v5);
}

- (int)offeredCount
{
  return self->_offeredCount;
}

- (void)setOfferedCount:(int)a3
{
  self->_offeredCount = a3;
}

- (int)acceptedCount
{
  return self->_acceptedCount;
}

- (void)setAcceptedCount:(int)a3
{
  self->_acceptedCount = a3;
}

- (BOOL)isSupplementalLexiconSearchEnabled
{
  return self->_supplementalLexiconSearchEnabled;
}

- (void)setSupplementalLexiconSearchEnabled:(BOOL)a3
{
  self->_supplementalLexiconSearchEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactCollection, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end