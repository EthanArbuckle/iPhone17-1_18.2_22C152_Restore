@interface EMFEmojiPreferences
+ (BOOL)deviceStateIsLocked;
+ (id)_allRecentStrings;
+ (id)_cacheDomain;
+ (id)_cachedFlagCategoryEmoji:(id)a3;
+ (id)_recentEmojiStrings;
+ (id)_recentStringsInCharacterSet:(id)a3;
+ (id)defaultsDomain;
- (BOOL)hasDisplayedSkinToneHelp;
- (BOOL)hasLastUsedVariantForEmoji:(id)a3;
- (BOOL)isDefaultDirty;
- (BOOL)recordEmojiEngagement:(id)a3 keyword:(id)a4 localeIdentifier:(id)a5;
- (BOOL)shouldCountEmojiStringForUsageHistory:(id)a3;
- (EMFEmojiPreferences)init;
- (NSArray)allRecents;
- (NSArray)recentEmojis;
- (NSMutableDictionary)defaults;
- (NSString)previouslyUsedCategory;
- (double)scoreForEmojiString:(id)a3;
- (double)scoreForEmojiStringUnsafe:(id)a3;
- (double)scoreForSequence:(int64_t)a3;
- (double)scoreForSequenceUnsafe:(int64_t)a3;
- (id).cxx_construct;
- (id)copySortedEmojis:(id)a3 keyword:(id)a4 localeIdentifier:(id)a5;
- (id)lastUsedVariantEmojiForEmoji:(id)a3;
- (id)recentEmojisByFillingWithPrepopulatedEmojisUpTo:(unint64_t)a3;
- (id)recentVariantEmojiForEmoji:(id)a3;
- (id)recentsInCharacterSet:(id)a3;
- (id)typingNameForEmoji:(id)a3;
- (id)valueForKeyInLocalCachedDefaultsThreadsafe:(id)a3;
- (unint64_t)maximumRecentsCount;
- (unint64_t)previouslyUsedIndexInCategory:(id)a3;
- (void)_checkForDingbatDuplicates;
- (void)_cleanUpOldFlagsCaches;
- (void)_forceReadEmojiDefaults;
- (void)_pruneInvalidEmojiFromHistory;
- (void)_pruneOldestEmojiUsageFromHistory;
- (void)_readPreferencesFromDefaults;
- (void)_setRecentStrings:(id)a3;
- (void)adaptationControllerForLocaleIdentifier:(id)a3;
- (void)dealloc;
- (void)didDisplaySkinToneHelp;
- (void)didUseEmoji:(id)a3;
- (void)didUseEmoji:(id)a3 usageMode:(id)a4;
- (void)didUseEmoji:(id)a3 usageMode:(id)a4 typingName:(id)a5;
- (void)didUseEmoji:(id)a3 usageMode:(id)a4 typingName:(id)a5 replacementContext:(id)a6;
- (void)didUseEmoji:(id)a3 usageSource:(unint64_t)a4 replacementContext:(id)a5 searchQuery:(id)a6 resultPosition:(id)a7 numberSearchQueriesRun:(id)a8 wasPositiveEngagement:(BOOL)a9;
- (void)didUseEmojiInCharacterPickerExtended:(id)a3 finalQuery:(id)a4 resultIndex:(id)a5;
- (void)didUseEmojiInCharacterPickerLightweight:(id)a3 replacementContext:(id)a4;
- (void)didUseEmojiInCharacterPickerPopover:(id)a3 finalQuery:(id)a4 resultIndex:(id)a5;
- (void)didUseEmojiInDFRBar:(id)a3 replacementContext:(id)a4;
- (void)didUseEmojiInDictation:(id)a3 replacementContext:(id)a4;
- (void)didUseEmojiInEmojiKeyboardPalette:(id)a3 wasFromRecentsSection:(BOOL)a4;
- (void)didUseEmojiInEmojiKeyboardSearch:(id)a3 finalQuery:(id)a4 resultIndex:(id)a5;
- (void)didUseEmojiInHandwriting:(id)a3 replacementContext:(id)a4;
- (void)didUseEmojiInKeyboardCandidateBar:(id)a3 candidatePosition:(id)a4 replacementContext:(id)a5;
- (void)didUseEmojiInKeyboardCandidateBar:(id)a3 replacementContext:(id)a4;
- (void)didViewEmojiIndex:(int64_t)a3 forCategory:(id)a4;
- (void)loadDefaultsIfNecessaryThreadSafe;
- (void)migrateFromMajorOSVersion:(int64_t)a3;
- (void)migrateInDidDisplaySkinToneHelp:(BOOL)a3;
- (void)migrateInPreviouslyUsedCategory:(id)a3;
- (void)migrateInPreviouslyUsedCategoryIndexes:(id)a3;
- (void)migrateInRecentEmoji:(id)a3 usages:(id)a4 typingNames:(id)a5;
- (void)migrateInSkinTonePreferences:(id)a3;
- (void)readEmojiDefaults;
- (void)resetEmojiDefaults;
- (void)setDefaults:(id)a3;
- (void)setIsDefaultDirty:(BOOL)a3;
- (void)setMaximumRecentsCount:(unint64_t)a3;
- (void)sortedEmojis:(id)a3 keyword:(id)a4 localeIdentifier:(id)a5 handler:(id)a6;
- (void)writeEmojiDefaults;
- (void)writeEmojiDefaultsThreadSafeAndNotify:(BOOL)a3;
@end

@implementation EMFEmojiPreferences

- (id).cxx_construct
{
  *((void *)self + 7) = 0;
  return self;
}

- (EMFEmojiPreferences)init
{
  v5.receiver = self;
  v5.super_class = (Class)EMFEmojiPreferences;
  id v2 = [(EMFEmojiPreferences *)&v5 init];
  v3 = (EMFEmojiPreferences *)v2;
  if (v2) {
    *((void *)v2 + 9) = 30;
  }
  std::unique_ptr<CEM::AdaptationDatabaseController>::reset[abi:ne180100]((CEM::AdaptationDatabaseController **)v2 + 7, 0);
  return v3;
}

- (void)dealloc
{
  std::unique_ptr<CEM::AdaptationDatabaseController>::reset[abi:ne180100]((CEM::AdaptationDatabaseController **)&self->_adaptationController, 0);
  v3.receiver = self;
  v3.super_class = (Class)EMFEmojiPreferences;
  [(EMFEmojiPreferences *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);
  std::unique_ptr<CEM::AdaptationDatabaseController>::reset[abi:ne180100]((CEM::AdaptationDatabaseController **)&self->_adaptationController, 0);
  objc_storeStrong((id *)&self->_categoryIndexes, 0);
  objc_storeStrong((id *)&self->_skinToneBaseKeyPreferences, 0);
  objc_storeStrong((id *)&self->_typingNames, 0);
  objc_storeStrong((id *)&self->_recents, 0);
  objc_storeStrong((id *)&self->_usageHistory, 0);
}

+ (id)defaultsDomain
{
  return @"com.apple.EmojiPreferences";
}

+ (id)_cacheDomain
{
  return @"com.apple.EmojiCache";
}

+ (id)_recentEmojiStrings
{
  objc_super v3 = [MEMORY[0x1E4F28B88] _emojiCharacterSet];
  v4 = [a1 _recentStringsInCharacterSet:v3];

  return v4;
}

+ (id)_allRecentStrings
{
  return (id)[a1 _recentStringsInCharacterSet:0];
}

+ (id)_recentStringsInCharacterSet:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([a1 deviceStateIsLocked])
  {
    objc_super v5 = +[EMFEmojiCategory _emojiSetForIdentifier:@"EMFEmojiCategoryPrepopulated"];
  }
  else
  {
    v6 = objc_alloc_init(EMFEmojiPreferences);
    [(EMFEmojiPreferences *)v6 loadDefaultsIfNecessaryThreadSafe];
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSMutableArray count](v6->_recents, "count"));
      objc_super v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      v7 = (void *)[(NSMutableArray *)v6->_recents copy];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v14;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v14 != v9) {
              objc_enumerationMutation(v7);
            }
            v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
            if ([v11 rangeOfCharacterFromSet:v4] != 0x7FFFFFFFFFFFFFFFLL) {
              [(NSMutableArray *)v5 addObject:v11];
            }
          }
          uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v8);
      }
    }
    else
    {
      objc_super v5 = v6->_recents;
    }
  }
  return v5;
}

- (id)recentEmojisByFillingWithPrepopulatedEmojisUpTo:(unint64_t)a3
{
  if (a3) {
    unint64_t v3 = a3;
  }
  else {
    unint64_t v3 = 500;
  }
  id v4 = [(EMFEmojiPreferences *)self recentEmojis];
  objc_super v5 = (void *)[v4 copy];

  if (v3 <= [v5 count])
  {
    long long v13 = objc_msgSend(v5, "subarrayWithRange:", 0, v3);
  }
  else
  {
    v6 = +[EMFEmojiCategory _emojiSetForIdentifier:@"EMFEmojiCategoryPrepopulated"];
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v3];
    [v7 addObjectsFromArray:v5];
    unint64_t v8 = [v6 count];
    uint64_t v9 = [v7 count];
    if (v3 >= v8) {
      unint64_t v10 = v8;
    }
    else {
      unint64_t v10 = v3;
    }
    unint64_t v11 = v10 - v9;
    if (v10 == v9)
    {
      v12 = 0;
    }
    else
    {
      uint64_t v14 = 0;
      long long v15 = 0;
      do
      {
        long long v16 = [v6 objectAtIndexedSubscript:v14];
        v12 = +[EMFEmojiToken emojiTokenWithString:v16 localeData:0];

        [v7 addObject:v12];
        ++v14;
        long long v15 = v12;
      }
      while (v11 != v14);
    }
    long long v13 = (void *)[v7 copy];
  }
  return v13;
}

- (NSArray)recentEmojis
{
  unint64_t v3 = [MEMORY[0x1E4F28B88] _emojiCharacterSet];
  id v4 = [(EMFEmojiPreferences *)self recentsInCharacterSet:v3];

  return (NSArray *)v4;
}

- (NSArray)allRecents
{
  return (NSArray *)[(EMFEmojiPreferences *)self recentsInCharacterSet:0];
}

- (id)recentsInCharacterSet:(id)a3
{
  id v4 = a3;
  [(EMFEmojiPreferences *)self loadDefaultsIfNecessaryThreadSafe];
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  long long v16 = __Block_byref_object_copy__5;
  v17 = __Block_byref_object_dispose__5;
  id v18 = 0;
  objc_super v5 = _getSharedSerialOperationQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__EMFEmojiPreferences_recentsInCharacterSet___block_invoke;
  block[3] = &unk_1E61A9B80;
  id v11 = v4;
  v12 = &v13;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  v7 = (void *)v14[5];
  if (!v7) {
    v7 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v8 = v7;

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __45__EMFEmojiPreferences_recentsInCharacterSet___block_invoke(void *a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (+[EMFEmojiPreferences deviceStateIsLocked])
  {
    id v2 = +[EMFEmojiCategory _emojiSetForIdentifier:@"EMFEmojiCategoryPrepopulated"];
    unint64_t v3 = (void *)[v2 copy];
  }
  else
  {
    unint64_t v3 = (void *)[*(id *)(a1[4] + 16) copy];
  }
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  uint64_t v5 = *(void *)(a1[6] + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * v10);
        if (!a1[5]
          || [*(id *)(*((void *)&v14 + 1) + 8 * v10) rangeOfCharacterFromSet:(void)v14] != 0x7FFFFFFFFFFFFFFFLL)
        {
          v12 = *(void **)(*(void *)(a1[6] + 8) + 40);
          uint64_t v13 = +[EMFEmojiToken emojiTokenWithString:localeData:](EMFEmojiToken, "emojiTokenWithString:localeData:", v11, 0, (void)v14);
          [v12 addObject:v13];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

- (id)valueForKeyInLocalCachedDefaultsThreadsafe:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  long long v15 = __Block_byref_object_copy__5;
  long long v16 = __Block_byref_object_dispose__5;
  id v17 = 0;
  uint64_t v5 = _getSharedSerialOperationQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__EMFEmojiPreferences_valueForKeyInLocalCachedDefaultsThreadsafe___block_invoke;
  block[3] = &unk_1E61A9BA8;
  id v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __66__EMFEmojiPreferences_valueForKeyInLocalCachedDefaultsThreadsafe___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) defaults];
  uint64_t v2 = [v5 objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSString)previouslyUsedCategory
{
  [(EMFEmojiPreferences *)self loadDefaultsIfNecessaryThreadSafe];
  return (NSString *)[(EMFEmojiPreferences *)self valueForKeyInLocalCachedDefaultsThreadsafe:@"EMFPreviouslyUsedCategoryKey"];
}

- (BOOL)hasDisplayedSkinToneHelp
{
  [(EMFEmojiPreferences *)self loadDefaultsIfNecessaryThreadSafe];
  uint64_t v3 = [(EMFEmojiPreferences *)self valueForKeyInLocalCachedDefaultsThreadsafe:@"EMFDidDisplaySkinToneHelpKey"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void)adaptationControllerForLocaleIdentifier:(id)a3
{
  char v4 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:a3];
  id v5 = [v4 languageCode];
  std::string::basic_string[abi:ne180100]<0>(v14, (char *)[v5 UTF8String]);

  value = self->_adaptationController.__ptr_.__value_;
  p_adaptationController = &self->_adaptationController;
  uint64_t v6 = (uint64_t)value;
  if (!value)
  {
    getEmojiAdaptationDatabasePath(0, &__p);
    operator new();
  }
  if ((v15 & 0x80u) == 0) {
    uint64_t v9 = v14;
  }
  else {
    uint64_t v9 = (void **)v14[0];
  }
  if ((v15 & 0x80u) == 0) {
    size_t v10 = v15;
  }
  else {
    size_t v10 = (size_t)v14[1];
  }
  CEM::AdaptationDatabaseController::setLocale(v6, (const std::string::value_type *)v9, v10);
  uint64_t v11 = p_adaptationController->__ptr_.__value_;
  if ((char)v15 < 0) {
    operator delete(v14[0]);
  }

  return v11;
}

- (BOOL)recordEmojiEngagement:(id)a3 keyword:(id)a4 localeIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    uint64_t v11 = [(EMFEmojiPreferences *)self adaptationControllerForLocaleIdentifier:v10];
    std::string::basic_string[abi:ne180100]<0>(v22, (char *)[v8 UTF8String]);
    uint64_t v12 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v10];
    id v13 = [v9 lowercaseStringWithLocale:v12];
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v13 UTF8String]);

    if ((v21 & 0x80u) == 0) {
      uint64_t v14 = __p;
    }
    else {
      uint64_t v14 = (void **)__p[0];
    }
    if ((v21 & 0x80u) == 0) {
      size_t v15 = v21;
    }
    else {
      size_t v15 = (size_t)__p[1];
    }
    if ((v23 & 0x80u) == 0) {
      long long v16 = v22;
    }
    else {
      long long v16 = (void **)v22[0];
    }
    if ((v23 & 0x80u) == 0) {
      size_t v17 = v23;
    }
    else {
      size_t v17 = (size_t)v22[1];
    }
    BOOL v18 = CEM::AdaptationDatabaseController::recordEmojiEngagement((uint64_t)v11, v14, v15, v16, v17) != 0;
    if ((char)v21 < 0) {
      operator delete(__p[0]);
    }

    if ((char)v23 < 0) {
      operator delete(v22[0]);
    }
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (id)copySortedEmojis:(id)a3 keyword:(id)a4 localeIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(EMFEmojiPreferences *)self adaptationControllerForLocaleIdentifier:v10];
  uint64_t v12 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v10];
  id v13 = [v9 lowercaseStringWithLocale:v12];
  std::string::basic_string[abi:ne180100]<0>(v36, (char *)[v13 UTF8String]);

  if ((v37 & 0x80u) == 0) {
    uint64_t v14 = v36;
  }
  else {
    uint64_t v14 = (void **)v36[0];
  }
  if ((v37 & 0x80u) == 0) {
    size_t v15 = v37;
  }
  else {
    size_t v15 = (size_t)v36[1];
  }
  CEM::AdaptationDatabaseController::getRecentEmojisForString(v11, v14, v15, (uint64_t *)&v34);
  if (v34 == v35)
  {
    uint64_t v19 = (void *)[v8 copy];
  }
  else
  {
    unint64_t v16 = 0;
    memset(v32, 0, sizeof(v32));
    int v33 = 1065353216;
    while (1)
    {
      unint64_t v31 = v16;
      if (v16 >= [v8 count]) {
        break;
      }
      size_t v17 = [v8 objectAtIndexedSubscript:v31];
      id v18 = [v17 string];
      std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v18 UTF8String]);

      std::__hash_table<std::__hash_value_type<std::string,unsigned long>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned long>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned long>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned long>>>::__emplace_unique_key_args<std::string,std::string&,long &>((uint64_t)v32, (unsigned __int8 *)__p, (uint64_t)__p, &v31);
      if (v30 < 0) {
        operator delete(__p[0]);
      }

      unint64_t v16 = v31 + 1;
    }
    uint64_t v19 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    v20 = v34;
    unsigned __int8 v21 = v35;
    while (v20 != v21)
    {
      v22 = std::__hash_table<std::__hash_value_type<std::string,std::weak_ptr<CEM::AdaptationDatabase>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::weak_ptr<CEM::AdaptationDatabase>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::weak_ptr<CEM::AdaptationDatabase>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::weak_ptr<CEM::AdaptationDatabase>>>>::find<std::string>(v32, v20);
      unsigned __int8 v23 = (uint64_t *)v22;
      if (v22)
      {
        v24 = [v8 objectAtIndexedSubscript:*((void *)v22 + 5)];
        [v19 addObject:v24];

        std::__hash_table<std::__hash_value_type<std::string,unsigned long>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned long>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned long>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned long>>>::erase(v32, v23);
      }
      v20 += 24;
    }
    for (unint64_t i = 0; i < [v8 count]; ++i)
    {
      v26 = [v8 objectAtIndexedSubscript:i];
      id v27 = [v26 string];
      std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v27 UTF8String]);

      if (std::__hash_table<std::__hash_value_type<std::string,std::weak_ptr<CEM::AdaptationDatabase>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::weak_ptr<CEM::AdaptationDatabase>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::weak_ptr<CEM::AdaptationDatabase>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::weak_ptr<CEM::AdaptationDatabase>>>>::find<std::string>(v32, (unsigned __int8 *)__p))
      {
        [v19 addObject:v26];
      }
      if (v30 < 0) {
        operator delete(__p[0]);
      }
    }
    std::__hash_table<std::__hash_value_type<std::string,unsigned long>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned long>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned long>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned long>>>::~__hash_table((uint64_t)v32);
  }
  *(void *)&v32[0] = &v34;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v32);
  if ((char)v37 < 0) {
    operator delete(v36[0]);
  }

  return v19;
}

- (void)sortedEmojis:(id)a3 keyword:(id)a4 localeIdentifier:(id)a5 handler:(id)a6
{
  uint64_t v11 = (void (**)(id, id))a6;
  id v10 = [(EMFEmojiPreferences *)self copySortedEmojis:a3 keyword:a4 localeIdentifier:a5];
  v11[2](v11, v10);
}

- (void)readEmojiDefaults
{
  uint64_t v3 = _getSharedSerialOperationQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__EMFEmojiPreferences_readEmojiDefaults__block_invoke;
  block[3] = &unk_1E61A9BD0;
  block[4] = self;
  dispatch_sync(v3, block);

  [(EMFEmojiPreferences *)self _readPreferencesFromDefaults];
  [(EMFEmojiPreferences *)self _pruneInvalidEmojiFromHistory];
}

void __40__EMFEmojiPreferences_readEmojiDefaults__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) defaults];

  if (!v2)
  {
    CFStringRef v3 = (const __CFString *)[(id)objc_opt_class() defaultsDomain];
    char v4 = (void *)CFPreferencesCopyAppValue(@"EMFDefaultsKey", v3);
    DeepCopy = (void *)CFPropertyListCreateDeepCopy(0, v4, 2uLL);
    [*(id *)(a1 + 32) setDefaults:DeepCopy];

    [*(id *)(a1 + 32) setIsDefaultDirty:0];
  }
  uint64_t v6 = [*(id *)(a1 + 32) defaults];

  if (!v6)
  {
    id v7 = [MEMORY[0x1E4F1CA60] dictionary];
    [*(id *)(a1 + 32) setDefaults:v7];

    id v8 = *(void **)(a1 + 32);
    [v8 setIsDefaultDirty:1];
  }
}

- (void)_readPreferencesFromDefaults
{
  if (!+[EMFEmojiPreferences deviceStateIsLocked])
  {
    CFStringRef v3 = _getSharedSerialOperationQueue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__EMFEmojiPreferences__readPreferencesFromDefaults__block_invoke;
    block[3] = &unk_1E61A9BD0;
    block[4] = self;
    dispatch_sync(v3, block);
  }
}

void __51__EMFEmojiPreferences__readPreferencesFromDefaults__block_invoke(uint64_t a1)
{
  id v18 = [*(id *)(a1 + 32) defaults];
  uint64_t v2 = [v18 objectForKey:@"EMFRecentsKey"];
  uint64_t v3 = *(void *)(a1 + 32);
  char v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v2;

  id v19 = [*(id *)(a1 + 32) defaults];
  uint64_t v5 = [v19 objectForKey:@"EMFUsageHistoryKey"];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v5;

  id v20 = [*(id *)(a1 + 32) defaults];
  uint64_t v8 = [v20 objectForKey:@"EMFTypingNamesKey"];
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(v9 + 24);
  *(void *)(v9 + 24) = v8;

  id v21 = [*(id *)(a1 + 32) defaults];
  uint64_t v11 = [v21 objectForKey:@"EMFSkinToneBaseKeyPreferences"];
  uint64_t v12 = *(void *)(a1 + 32);
  id v13 = *(void **)(v12 + 32);
  *(void *)(v12 + 32) = v11;

  id v22 = [*(id *)(a1 + 32) defaults];
  uint64_t v14 = [v22 objectForKey:@"EMFViewedInCategoryKey"];
  uint64_t v15 = *(void *)(a1 + 32);
  unint64_t v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;

  id v23 = [*(id *)(a1 + 32) defaults];
  size_t v17 = [v23 objectForKey:@"EMFRecentSequenceNumberKey"];
  *(void *)(*(void *)(a1 + 32) + 48) = [v17 integerValue];
}

- (void)writeEmojiDefaults
{
}

- (void)writeEmojiDefaultsThreadSafeAndNotify:(BOOL)a3
{
  if (!+[EMFEmojiPreferences deviceStateIsLocked])
  {
    uint64_t v12 = 0;
    id v13 = &v12;
    uint64_t v14 = 0x2020000000;
    char v15 = 0;
    uint64_t v5 = _getSharedSerialOperationQueue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__EMFEmojiPreferences_writeEmojiDefaultsThreadSafeAndNotify___block_invoke;
    block[3] = &unk_1E61A9BF8;
    block[4] = self;
    void block[5] = &v12;
    dispatch_sync(v5, block);

    if (*((unsigned char *)v13 + 24))
    {
      uint64_t v6 = _getSharedSerialOperationQueue();
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __61__EMFEmojiPreferences_writeEmojiDefaultsThreadSafeAndNotify___block_invoke_2;
      v10[3] = &unk_1E61A9BD0;
      v10[4] = self;
      dispatch_sync(v6, v10);

      [(EMFEmojiPreferences *)self _pruneOldestEmojiUsageFromHistory];
      id v7 = _getSharedSerialOperationQueue();
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __61__EMFEmojiPreferences_writeEmojiDefaultsThreadSafeAndNotify___block_invoke_3;
      v8[3] = &unk_1E61A9C20;
      v8[4] = self;
      BOOL v9 = a3;
      dispatch_sync(v7, v8);
    }
    _Block_object_dispose(&v12, 8);
  }
}

uint64_t __61__EMFEmojiPreferences_writeEmojiDefaultsThreadSafeAndNotify___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) defaults];
  if (v2) {
    LOBYTE(v2) = [*(id *)(a1 + 32) isDefaultDirty];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2;
  return MEMORY[0x1F41817F8]();
}

void __61__EMFEmojiPreferences_writeEmojiDefaultsThreadSafeAndNotify___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2[1])
  {
    id v4 = [v2 defaults];
    [v4 setObject:*(void *)(*(void *)(a1 + 32) + 8) forKey:@"EMFUsageHistoryKey"];

    uint64_t v2 = *(void **)(a1 + 32);
  }
  if (v2[6])
  {
    id v5 = [v2 defaults];
    uint64_t v3 = [NSNumber numberWithInteger:*(void *)(*(void *)(a1 + 32) + 48)];
    [v5 setObject:v3 forKey:@"EMFRecentSequenceNumberKey"];

    uint64_t v2 = *(void **)(a1 + 32);
  }
  if (v2[2])
  {
    id v6 = [v2 defaults];
    [v6 setObject:*(void *)(*(void *)(a1 + 32) + 16) forKey:@"EMFRecentsKey"];

    uint64_t v2 = *(void **)(a1 + 32);
  }
  if (v2[4])
  {
    id v7 = [v2 defaults];
    [v7 setObject:*(void *)(*(void *)(a1 + 32) + 32) forKey:@"EMFSkinToneBaseKeyPreferences"];

    uint64_t v2 = *(void **)(a1 + 32);
  }
  if (v2[5])
  {
    id v8 = [v2 defaults];
    [v8 setObject:*(void *)(*(void *)(a1 + 32) + 40) forKey:@"EMFViewedInCategoryKey"];
  }
}

void __61__EMFEmojiPreferences_writeEmojiDefaultsThreadSafeAndNotify___block_invoke_3(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isDefaultDirty])
  {
    uint64_t v2 = [*(id *)(a1 + 32) defaults];
    CFStringRef v3 = (const __CFString *)[(id)objc_opt_class() defaultsDomain];
    CFPreferencesSetAppValue(@"EMFDefaultsKey", v2, v3);

    CFStringRef v4 = (const __CFString *)[(id)objc_opt_class() defaultsDomain];
    CFPreferencesAppSynchronize(v4);
    [*(id *)(a1 + 32) setIsDefaultDirty:0];
    if (*(unsigned char *)(a1 + 40))
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, @"AppleKeyboardsEmojiChangedNotification", 0, 0, 1u);
    }
  }
}

- (void)resetEmojiDefaults
{
  [(EMFEmojiPreferences *)self loadDefaultsIfNecessaryThreadSafe];
  CFStringRef v3 = _getSharedSerialOperationQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__EMFEmojiPreferences_resetEmojiDefaults__block_invoke;
  block[3] = &unk_1E61A9BD0;
  block[4] = self;
  dispatch_sync(v3, block);
}

uint64_t __41__EMFEmojiPreferences_resetEmojiDefaults__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 8) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 24) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 32) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 40) removeAllObjects];
  uint64_t v2 = [*(id *)(a1 + 32) defaults];
  [v2 removeAllObjects];

  CFStringRef v3 = *(void **)(a1 + 32);
  return [v3 setIsDefaultDirty:1];
}

- (void)loadDefaultsIfNecessaryThreadSafe
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  CFStringRef v3 = _getSharedSerialOperationQueue();
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__EMFEmojiPreferences_loadDefaultsIfNecessaryThreadSafe__block_invoke;
  v4[3] = &unk_1E61A9BF8;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(v3, v4);

  if (*((unsigned char *)v6 + 24)) {
    [(EMFEmojiPreferences *)self readEmojiDefaults];
  }
  _Block_object_dispose(&v5, 8);
}

void __56__EMFEmojiPreferences_loadDefaultsIfNecessaryThreadSafe__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) defaults];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2 == 0;
}

- (void)_forceReadEmojiDefaults
{
  CFStringRef v3 = _getSharedSerialOperationQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__EMFEmojiPreferences__forceReadEmojiDefaults__block_invoke;
  block[3] = &unk_1E61A9BD0;
  block[4] = self;
  dispatch_sync(v3, block);

  [(EMFEmojiPreferences *)self readEmojiDefaults];
}

uint64_t __46__EMFEmojiPreferences__forceReadEmojiDefaults__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDefaults:0];
}

- (void)migrateFromMajorOSVersion:(int64_t)a3
{
  [(EMFEmojiPreferences *)self _checkForDingbatDuplicates];
  [(EMFEmojiPreferences *)self _cleanUpOldFlagsCaches];
  id v4 = +[EMFEmojiCategory _emojiSetForIdentifier:@"EMFEmojiCategoryFlags"];
}

- (void)_checkForDingbatDuplicates
{
  [(EMFEmojiPreferences *)self loadDefaultsIfNecessaryThreadSafe];
  CFStringRef v3 = _getSharedSerialOperationQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__EMFEmojiPreferences__checkForDingbatDuplicates__block_invoke;
  block[3] = &unk_1E61A9BD0;
  block[4] = self;
  dispatch_sync(v3, block);

  [(EMFEmojiPreferences *)self writeEmojiDefaultsThreadSafeAndNotify:0];
}

void __49__EMFEmojiPreferences__checkForDingbatDuplicates__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1 + 32;
  CFStringRef v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = *(id *)(*(void *)v2 + 16);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        char v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        BOOL v9 = +[EMFStringUtilities _preferenceIndexString:](EMFStringUtilities, "_preferenceIndexString:", v8, (void)v10);
        if (v9 != v8) {
          [*(id *)(a1 + 32) setIsDefaultDirty:1];
        }
        if ([v3 containsObject:v9])
        {
          [*(id *)(*(void *)(a1 + 32) + 8) removeObjectForKey:v8];
          [*(id *)(*(void *)(a1 + 32) + 24) removeObjectForKey:v8];
        }
        else
        {
          [v3 addObject:v9];
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  if ([*(id *)(a1 + 32) isDefaultDirty]) {
    [*(id *)(*(void *)(a1 + 32) + 16) setArray:v3];
  }
}

- (void)_pruneInvalidEmojiFromHistory
{
  [(EMFEmojiPreferences *)self loadDefaultsIfNecessaryThreadSafe];
  CFStringRef v3 = _getSharedSerialOperationQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__EMFEmojiPreferences__pruneInvalidEmojiFromHistory__block_invoke;
  block[3] = &unk_1E61A9BD0;
  block[4] = self;
  dispatch_sync(v3, block);
}

void __52__EMFEmojiPreferences__pruneInvalidEmojiFromHistory__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1 + 32;
  CFStringRef v3 = [MEMORY[0x1E4F1CA48] arrayWithArray:*(void *)(*(void *)(a1 + 32) + 16)];
  [MEMORY[0x1E4F1C978] arrayWithArray:*(void *)(*(void *)v2 + 16)];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v9 + 1) + 8 * i);
        if ((objc_msgSend(*(id *)(a1 + 32), "shouldCountEmojiStringForUsageHistory:", v8, (void)v9) & 1) == 0)
        {
          [*(id *)(a1 + 32) setIsDefaultDirty:1];
          [v3 removeObject:v8];
          [*(id *)(*(void *)(a1 + 32) + 8) removeObjectForKey:v8];
          [*(id *)(*(void *)(a1 + 32) + 24) removeObjectForKey:v8];
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  if ([*(id *)(a1 + 32) isDefaultDirty]) {
    [*(id *)(*(void *)(a1 + 32) + 16) setArray:v3];
  }
}

- (void)_pruneOldestEmojiUsageFromHistory
{
  [(EMFEmojiPreferences *)self loadDefaultsIfNecessaryThreadSafe];
  CFStringRef v3 = _getSharedSerialOperationQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__EMFEmojiPreferences__pruneOldestEmojiUsageFromHistory__block_invoke;
  block[3] = &unk_1E61A9BD0;
  block[4] = self;
  dispatch_sync(v3, block);
}

void __56__EMFEmojiPreferences__pruneOldestEmojiUsageFromHistory__block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 8) && *(uint64_t *)(v1 + 48) >= 1001)
  {
    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(v3 + 48);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    obuint64_t j = *(id *)(v3 + 8);
    uint64_t v5 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    uint64_t v22 = a1;
    uint64_t v6 = v4 - 500;
    if (v5)
    {
      uint64_t v21 = *(void *)v30;
      do
      {
        uint64_t v23 = v5;
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v30 != v21) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          v24 = [*(id *)(*(void *)(v22 + 32) + 8) objectForKey:v8];
          id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          long long v27 = 0u;
          long long v28 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          id v10 = v24;
          uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v33 count:16];
          if (v11)
          {
            uint64_t v12 = *(void *)v26;
            do
            {
              for (uint64_t j = 0; j != v11; ++j)
              {
                if (*(void *)v26 != v12) {
                  objc_enumerationMutation(v10);
                }
                uint64_t v14 = [*(id *)(*((void *)&v25 + 1) + 8 * j) integerValue] - v6;
                if (v14 >= 0)
                {
                  uint64_t v15 = [NSNumber numberWithInteger:v14];
                  [v9 addObject:v15];
                }
              }
              uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v33 count:16];
            }
            while (v11);
          }

          if ([v9 count]) {
            [v20 setObject:v9 forKey:v8];
          }
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v5);
    }

    objc_storeStrong((id *)(*(void *)(v22 + 32) + 8), v20);
    *(void *)(*(void *)(v22 + 32) + 48) -= v6;
    unint64_t v16 = [*(id *)(v22 + 32) defaults];
    [v16 setObject:*(void *)(*(void *)(v22 + 32) + 8) forKey:@"EMFUsageHistoryKey"];

    size_t v17 = [*(id *)(v22 + 32) defaults];
    id v18 = [NSNumber numberWithInteger:*(void *)(*(void *)(v22 + 32) + 48)];
    [v17 setObject:v18 forKey:@"EMFRecentSequenceNumberKey"];
  }
}

- (void)_cleanUpOldFlagsCaches
{
  uint64_t v3 = _getSharedSerialOperationQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__EMFEmojiPreferences__cleanUpOldFlagsCaches__block_invoke;
  block[3] = &unk_1E61A9BD0;
  block[4] = self;
  dispatch_sync(v3, block);
}

void __45__EMFEmojiPreferences__cleanUpOldFlagsCaches__block_invoke()
{
  v38[3] = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc(MEMORY[0x1E4F1CB18]);
  uint64_t v1 = [(id)objc_opt_class() defaultsDomain];
  uint64_t v2 = (void *)[v0 initWithSuiteName:v1];

  uint64_t v3 = [v2 dictionaryRepresentation];
  uint64_t v4 = [v3 allKeys];
  uint64_t v5 = (void *)[v4 mutableCopy];

  v38[0] = @"EMFDefaultsKey";
  v38[1] = @"DidMigrateToEMF";
  v38[2] = @"com.apple.stickerkit.onboarding.shown";
  [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:3];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v32;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v32 != v8) {
          objc_enumerationMutation(v6);
        }
        [v5 removeObject:*(void *)(*((void *)&v31 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v7);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v10 = v5;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v36 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v28;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(v10);
        }
        [v2 removeObjectForKey:*(void *)(*((void *)&v27 + 1) + 8 * v13++)];
      }
      while (v11 != v13);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v36 count:16];
    }
    while (v11);
  }

  [v2 synchronize];
  id v14 = objc_alloc(MEMORY[0x1E4F1CB18]);
  uint64_t v15 = [(id)objc_opt_class() _cacheDomain];
  unint64_t v16 = (void *)[v14 initWithSuiteName:v15];

  size_t v17 = [v16 dictionaryRepresentation];
  id v18 = [v17 allKeys];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v19 = v18;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v23 objects:v35 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v24;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v24 != v21) {
          objc_enumerationMutation(v19);
        }
        objc_msgSend(v16, "removeObjectForKey:", *(void *)(*((void *)&v23 + 1) + 8 * v22++), (void)v23);
      }
      while (v20 != v22);
      uint64_t v20 = [v19 countByEnumeratingWithState:&v23 objects:v35 count:16];
    }
    while (v20);
  }

  [v16 synchronize];
}

- (void)migrateInRecentEmoji:(id)a3 usages:(id)a4 typingNames:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = _getSharedSerialOperationQueue();
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __63__EMFEmojiPreferences_migrateInRecentEmoji_usages_typingNames___block_invoke;
  v15[3] = &unk_1E61A9C48;
  id v16 = v9;
  size_t v17 = self;
  id v18 = v8;
  id v19 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_sync(v11, v15);
}

void __63__EMFEmojiPreferences_migrateInRecentEmoji_usages_typingNames___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v2 count])
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v3 = v2;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v35;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v35 != v5) {
            objc_enumerationMutation(v3);
          }
          uint64_t v7 = *(void **)(*((void *)&v34 + 1) + 8 * v6);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && objc_msgSend(v7, "integerValue", (void)v34) > *(void *)(*(void *)(a1 + 40) + 48))
          {
            *(void *)(*(void *)(a1 + 40) + 48) = [v7 integerValue];
          }
          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [v3 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v4);
    }
  }
  else
  {
    id v8 = (void *)MEMORY[0x1E4F1CA48];
    id v9 = NSNumber;
    ++*(void *)(*(void *)(a1 + 40) + 48);
    id v10 = objc_msgSend(v9, "numberWithInteger:");
    uint64_t v11 = [v8 arrayWithObject:v10];

    id v3 = (id)v11;
  }
  id v12 = +[EMFStringUtilities _preferenceIndexString:](EMFStringUtilities, "_preferenceIndexString:", *(void *)(a1 + 48), (void)v34);
  id v13 = *(void **)(a1 + 40);
  if (v13[1]) {
    BOOL v14 = 1;
  }
  else {
    BOOL v14 = v3 == 0;
  }
  if (!v14)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
    uint64_t v16 = *(void *)(a1 + 40);
    size_t v17 = *(void **)(v16 + 8);
    *(void *)(v16 + 8) = v15;

    id v18 = [*(id *)(a1 + 40) defaults];
    [v18 setObject:*(void *)(*(void *)(a1 + 40) + 8) forKey:@"EMFUsageHistoryKey"];

    id v13 = *(void **)(a1 + 40);
  }
  if (!v13[2] && v12)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
    uint64_t v20 = *(void *)(a1 + 40);
    uint64_t v21 = *(void **)(v20 + 16);
    *(void *)(v20 + 16) = v19;

    uint64_t v22 = [*(id *)(a1 + 40) defaults];
    [v22 setObject:*(void *)(*(void *)(a1 + 40) + 16) forKey:@"EMFRecentsKey"];

    id v13 = *(void **)(a1 + 40);
  }
  if (!v13[3] && *(void *)(a1 + 56))
  {
    uint64_t v23 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
    uint64_t v24 = *(void *)(a1 + 40);
    long long v25 = *(void **)(v24 + 24);
    *(void *)(v24 + 24) = v23;

    long long v26 = [*(id *)(a1 + 40) defaults];
    [v26 setObject:*(void *)(*(void *)(a1 + 40) + 24) forKey:@"EMFTypingNamesKey"];
  }
  if (v3 && v12)
  {
    long long v27 = [*(id *)(*(void *)(a1 + 40) + 8) objectForKey:v12];
    BOOL v28 = v27 == 0;

    if (v28)
    {
      long long v29 = *(void **)(*(void *)(a1 + 40) + 8);
      long long v30 = (void *)[v3 mutableCopy];
      [v29 setObject:v30 forKey:v12];
    }
  }
  else if (!v12)
  {
    goto LABEL_37;
  }
  if (([*(id *)(*(void *)(a1 + 40) + 16) containsObject:v12] & 1) == 0) {
    [*(id *)(*(void *)(a1 + 40) + 16) addObject:v12];
  }
  if (*(void *)(a1 + 56))
  {
    long long v31 = [*(id *)(*(void *)(a1 + 40) + 24) objectForKey:v12];
    BOOL v32 = v31 == 0;

    if (v32) {
      [*(id *)(*(void *)(a1 + 40) + 24) setObject:*(void *)(a1 + 56) forKey:v12];
    }
  }
LABEL_37:
  if ([*(id *)(a1 + 40) maximumRecentsCount])
  {
    unint64_t v33 = [*(id *)(*(void *)(a1 + 40) + 16) count];
    if (v33 > [*(id *)(a1 + 40) maximumRecentsCount]) {
      objc_msgSend(*(id *)(*(void *)(a1 + 40) + 16), "removeObjectsInRange:", objc_msgSend(*(id *)(a1 + 40), "maximumRecentsCount"), objc_msgSend(*(id *)(*(void *)(a1 + 40) + 16), "count")- objc_msgSend(*(id *)(a1 + 40), "maximumRecentsCount"));
    }
  }
  [*(id *)(a1 + 40) setIsDefaultDirty:1];
}

- (void)migrateInSkinTonePreferences:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _getSharedSerialOperationQueue();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__EMFEmojiPreferences_migrateInSkinTonePreferences___block_invoke;
  v7[3] = &unk_1E61A9C70;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

uint64_t __52__EMFEmojiPreferences_migrateInSkinTonePreferences___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) mutableCopy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;

  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = v5[4];
  uint64_t v7 = [v5 defaults];
  id v8 = v7;
  if (v6) {
    [v7 setObject:*(void *)(*(void *)(a1 + 32) + 32) forKey:@"EMFSkinToneBaseKeyPreferences"];
  }
  else {
    [v7 removeObjectForKey:@"EMFSkinToneBaseKeyPreferences"];
  }

  id v9 = *(void **)(a1 + 32);
  return [v9 setIsDefaultDirty:1];
}

- (void)migrateInPreviouslyUsedCategory:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _getSharedSerialOperationQueue();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__EMFEmojiPreferences_migrateInPreviouslyUsedCategory___block_invoke;
  v7[3] = &unk_1E61A9C70;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

uint64_t __55__EMFEmojiPreferences_migrateInPreviouslyUsedCategory___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) defaults];
  id v4 = v3;
  if (v2) {
    [v3 setObject:*(void *)(a1 + 32) forKey:@"EMFPreviouslyUsedCategoryKey"];
  }
  else {
    [v3 removeObjectForKey:@"EMFPreviouslyUsedCategoryKey"];
  }

  uint64_t v5 = *(void **)(a1 + 40);
  return [v5 setIsDefaultDirty:1];
}

- (void)migrateInPreviouslyUsedCategoryIndexes:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _getSharedSerialOperationQueue();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__EMFEmojiPreferences_migrateInPreviouslyUsedCategoryIndexes___block_invoke;
  v7[3] = &unk_1E61A9C70;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

uint64_t __62__EMFEmojiPreferences_migrateInPreviouslyUsedCategoryIndexes___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) mutableCopy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = v5[5];
  uint64_t v7 = [v5 defaults];
  id v8 = v7;
  if (v6) {
    [v7 setObject:*(void *)(*(void *)(a1 + 32) + 40) forKey:@"EMFViewedInCategoryKey"];
  }
  else {
    [v7 removeObjectForKey:@"EMFViewedInCategoryKey"];
  }

  id v9 = *(void **)(a1 + 32);
  return [v9 setIsDefaultDirty:1];
}

- (void)migrateInDidDisplaySkinToneHelp:(BOOL)a3
{
  uint64_t v5 = _getSharedSerialOperationQueue();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__EMFEmojiPreferences_migrateInDidDisplaySkinToneHelp___block_invoke;
  v6[3] = &unk_1E61A9C20;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_sync(v5, v6);
}

uint64_t __55__EMFEmojiPreferences_migrateInDidDisplaySkinToneHelp___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) defaults];
  uint64_t v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  [v2 setObject:v3 forKey:@"EMFDidDisplaySkinToneHelpKey"];

  id v4 = *(void **)(a1 + 32);
  return [v4 setIsDefaultDirty:1];
}

- (double)scoreForSequenceUnsafe:(int64_t)a3
{
  int64_t v3 = self->_currentSequence - a3;
  if (v3 < 1) {
    return 0.0;
  }
  else {
    return 1.0 / ((double)v3 * 0.1 + 1.0);
  }
}

- (double)scoreForSequence:(int64_t)a3
{
  uint64_t v9 = 0;
  id v10 = (double *)&v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  uint64_t v5 = _getSharedSerialOperationQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__EMFEmojiPreferences_scoreForSequence___block_invoke;
  block[3] = &unk_1E61A9C98;
  void block[5] = &v9;
  void block[6] = a3;
  block[4] = self;
  dispatch_sync(v5, block);

  double v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

void *__40__EMFEmojiPreferences_scoreForSequence___block_invoke(void *result)
{
  uint64_t v1 = *(void *)(result[4] + 48) - result[6];
  if (v1 < 1) {
    double v2 = 0.0;
  }
  else {
    double v2 = 1.0 / ((double)v1 * 0.1 + 1.0);
  }
  *(double *)(*(void *)(result[5] + 8) + 24) = v2;
  return result;
}

- (double)scoreForEmojiStringUnsafe:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = [(NSMutableDictionary *)self->_usageHistory objectForKey:a3];
  uint64_t v5 = v4;
  if (v4)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v14;
      double v9 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v6);
          }
          -[EMFEmojiPreferences scoreForSequenceUnsafe:](self, "scoreForSequenceUnsafe:", objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "integerValue", (void)v13));
          double v9 = v9 + v11;
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
    else
    {
      double v9 = 0.0;
    }
  }
  else
  {
    double v9 = 0.0;
  }

  return v9;
}

- (double)scoreForEmojiString:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  long long v25 = __Block_byref_object_copy__5;
  long long v26 = __Block_byref_object_dispose__5;
  id v27 = 0;
  uint64_t v5 = _getSharedSerialOperationQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__EMFEmojiPreferences_scoreForEmojiString___block_invoke;
  block[3] = &unk_1E61A9BA8;
  uint64_t v21 = &v22;
  block[4] = self;
  id v6 = v4;
  id v20 = v6;
  dispatch_sync(v5, block);

  uint64_t v7 = (void *)v23[5];
  if (v7)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v28 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v16;
      double v11 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v8);
          }
          -[EMFEmojiPreferences scoreForSequence:](self, "scoreForSequence:", objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "integerValue", (void)v15));
          double v11 = v11 + v13;
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v28 count:16];
      }
      while (v9);
    }
    else
    {
      double v11 = 0.0;
    }
  }
  else
  {
    double v11 = 0.0;
  }

  _Block_object_dispose(&v22, 8);
  return v11;
}

uint64_t __43__EMFEmojiPreferences_scoreForEmojiString___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 8) objectForKey:a1[5]];
  return MEMORY[0x1F41817F8]();
}

- (void)didUseEmoji:(id)a3 usageSource:(unint64_t)a4 replacementContext:(id)a5 searchQuery:(id)a6 resultPosition:(id)a7 numberSearchQueriesRun:(id)a8 wasPositiveEngagement:(BOOL)a9
{
  id v25 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  uint64_t v19 = objc_alloc_init(EMFDPEventDispatcher);
  LOBYTE(v24) = a9;
  [(EMFDPEventDispatcher *)v19 didUseEmoji:v25 usageSource:a4 replacementContext:v15 searchQuery:v16 resultPosition:v17 numberSearchQueriesRun:v18 wasPositiveEngagement:v24];
  if (v15) {
    id v20 = v15;
  }
  else {
    id v20 = v16;
  }
  id v21 = v20;
  if (v21)
  {
    uint64_t v22 = [v25 string];
    uint64_t v23 = [v25 localeIdentifier];
    [(EMFEmojiPreferences *)self recordEmojiEngagement:v22 keyword:v21 localeIdentifier:v23];
  }
  [(EMFEmojiPreferences *)self didUseEmoji:v25 usageMode:0];
}

- (void)didUseEmojiInKeyboardCandidateBar:(id)a3 replacementContext:(id)a4
{
  LOBYTE(v4) = 1;
  [(EMFEmojiPreferences *)self didUseEmoji:a3 usageSource:4 replacementContext:a4 searchQuery:0 resultPosition:0 numberSearchQueriesRun:0 wasPositiveEngagement:v4];
}

- (void)didUseEmojiInKeyboardCandidateBar:(id)a3 candidatePosition:(id)a4 replacementContext:(id)a5
{
  LOBYTE(v5) = 1;
  [(EMFEmojiPreferences *)self didUseEmoji:a3 usageSource:4 replacementContext:a5 searchQuery:0 resultPosition:a4 numberSearchQueriesRun:0 wasPositiveEngagement:v5];
}

- (void)didUseEmojiInDictation:(id)a3 replacementContext:(id)a4
{
  LOBYTE(v4) = 1;
  [(EMFEmojiPreferences *)self didUseEmoji:a3 usageSource:6 replacementContext:a4 searchQuery:0 resultPosition:0 numberSearchQueriesRun:0 wasPositiveEngagement:v4];
}

- (void)didUseEmojiInHandwriting:(id)a3 replacementContext:(id)a4
{
  LOBYTE(v4) = 1;
  [(EMFEmojiPreferences *)self didUseEmoji:a3 usageSource:5 replacementContext:a4 searchQuery:0 resultPosition:0 numberSearchQueriesRun:0 wasPositiveEngagement:v4];
}

- (void)didUseEmojiInDFRBar:(id)a3 replacementContext:(id)a4
{
  LOBYTE(v4) = 1;
  [(EMFEmojiPreferences *)self didUseEmoji:a3 usageSource:10 replacementContext:a4 searchQuery:0 resultPosition:0 numberSearchQueriesRun:0 wasPositiveEngagement:v4];
}

- (void)didUseEmojiInCharacterPickerLightweight:(id)a3 replacementContext:(id)a4
{
  LOBYTE(v4) = 1;
  [(EMFEmojiPreferences *)self didUseEmoji:a3 usageSource:7 replacementContext:a4 searchQuery:0 resultPosition:0 numberSearchQueriesRun:0 wasPositiveEngagement:v4];
}

- (void)didUseEmojiInCharacterPickerPopover:(id)a3 finalQuery:(id)a4 resultIndex:(id)a5
{
  LOBYTE(v5) = 1;
  [(EMFEmojiPreferences *)self didUseEmoji:a3 usageSource:8 replacementContext:0 searchQuery:a4 resultPosition:0 numberSearchQueriesRun:0 wasPositiveEngagement:v5];
}

- (void)didUseEmojiInCharacterPickerExtended:(id)a3 finalQuery:(id)a4 resultIndex:(id)a5
{
  LOBYTE(v5) = 1;
  [(EMFEmojiPreferences *)self didUseEmoji:a3 usageSource:9 replacementContext:0 searchQuery:a4 resultPosition:0 numberSearchQueriesRun:0 wasPositiveEngagement:v5];
}

- (void)didUseEmojiInEmojiKeyboardPalette:(id)a3 wasFromRecentsSection:(BOOL)a4
{
  if (a4) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 1;
  }
  LOBYTE(v5) = 1;
  [(EMFEmojiPreferences *)self didUseEmoji:a3 usageSource:v4 replacementContext:0 searchQuery:0 resultPosition:0 numberSearchQueriesRun:0 wasPositiveEngagement:v5];
}

- (void)didUseEmojiInEmojiKeyboardSearch:(id)a3 finalQuery:(id)a4 resultIndex:(id)a5
{
  LOBYTE(v5) = 1;
  [(EMFEmojiPreferences *)self didUseEmoji:a3 usageSource:3 replacementContext:0 searchQuery:a4 resultPosition:a5 numberSearchQueriesRun:0 wasPositiveEngagement:v5];
}

- (void)didUseEmoji:(id)a3
{
}

- (void)didUseEmoji:(id)a3 usageMode:(id)a4
{
}

- (void)didUseEmoji:(id)a3 usageMode:(id)a4 typingName:(id)a5 replacementContext:(id)a6
{
  id v15 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    double v13 = [v15 string];
    long long v14 = [v15 localeIdentifier];
    [(EMFEmojiPreferences *)self recordEmojiEngagement:v13 keyword:v12 localeIdentifier:v14];
  }
  [(EMFEmojiPreferences *)self didUseEmoji:v15 usageMode:v10 typingName:v11];
}

- (void)didUseEmoji:(id)a3 usageMode:(id)a4 typingName:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (!+[EMFEmojiPreferences deviceStateIsLocked])
  {
    [(EMFEmojiPreferences *)self loadDefaultsIfNecessaryThreadSafe];
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x3032000000;
    v14[3] = __Block_byref_object_copy__5;
    v14[4] = __Block_byref_object_dispose__5;
    id v15 = 0;
    uint64_t v9 = _getSharedSerialOperationQueue();
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __56__EMFEmojiPreferences_didUseEmoji_usageMode_typingName___block_invoke;
    v10[3] = &unk_1E61A9CC0;
    v10[4] = self;
    id v11 = v8;
    double v13 = v14;
    id v12 = v7;
    dispatch_sync(v9, v10);

    _Block_object_dispose(v14, 8);
  }
}

void __56__EMFEmojiPreferences_didUseEmoji_usageMode_typingName___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setIsDefaultDirty:1];
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 16))
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = v3;

    id v50 = [*(id *)(a1 + 32) defaults];
    [v50 setObject:*(void *)(*(void *)(a1 + 32) + 16) forKey:@"EMFRecentsKey"];

    uint64_t v2 = *(void *)(a1 + 32);
  }
  if (!*(void *)(v2 + 8))
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 8);
    *(void *)(v7 + 8) = v6;

    id v51 = [*(id *)(a1 + 32) defaults];
    [v51 setObject:*(void *)(*(void *)(a1 + 32) + 8) forKey:@"EMFUsageHistoryKey"];
  }
  if ([*(id *)(a1 + 40) length] && !*(void *)(*(void *)(a1 + 32) + 24))
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = *(void **)(v10 + 24);
    *(void *)(v10 + 24) = v9;

    id v52 = [*(id *)(a1 + 32) defaults];
    [v52 setObject:*(void *)(*(void *)(a1 + 32) + 24) forKey:@"EMFTypingNamesKey"];
  }
  id v53 = [*(id *)(a1 + 48) string];
  uint64_t v12 = +[EMFStringUtilities _preferenceIndexString:](EMFStringUtilities, "_preferenceIndexString:");
  uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
  long long v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

  if ([*(id *)(a1 + 32) shouldCountEmojiStringForUsageHistory:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)])
  {
    if ([*(id *)(a1 + 48) supportsSkinToneVariants])
    {
      if (!*(void *)(*(void *)(a1 + 32) + 32))
      {
        uint64_t v15 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
        uint64_t v16 = *(void *)(a1 + 32);
        id v17 = *(void **)(v16 + 32);
        *(void *)(v16 + 32) = v15;

        id v54 = [*(id *)(a1 + 32) defaults];
        [v54 setObject:*(void *)(*(void *)(a1 + 32) + 32) forKey:@"EMFSkinToneBaseKeyPreferences"];
      }
      id v55 = [*(id *)(a1 + 48) string];
      id v18 = +[EMFStringUtilities _baseStringForEmojiString:](EMFStringUtilities, "_baseStringForEmojiString:");

      if (+[EMFEmojiCategory _supportsCoupleSkinToneSelection:v18])
      {
        uint64_t v19 = +[EMFEmojiToken emojiTokenWithString:v18 localeData:0];
      }
      else
      {
        uint64_t v19 = [*(id *)(a1 + 48) copyWithSkinToneVariant:0];
      }
      id v56 = (id)v19;
      if (v19)
      {
        id v20 = *(void **)(*(void *)(a1 + 32) + 32);
        id v21 = [*(id *)(a1 + 48) string];
        uint64_t v22 = [v56 string];
        [v20 setObject:v21 forKey:v22];
      }
    }
    uint64_t v23 = NSNumber;
    ++*(void *)(*(void *)(a1 + 32) + 48);
    objc_msgSend(v23, "numberWithInteger:");
    id v57 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v24 = [*(id *)(a1 + 32) defaults];
    [v24 setObject:v57 forKey:@"EMFRecentSequenceNumberKey"];

    id v25 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKey:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    long long v26 = v25;
    if (v25)
    {
      [v25 addObject:v57];
    }
    else
    {
      long long v26 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
      [v26 addObject:v57];
    }
    [*(id *)(*(void *)(a1 + 32) + 8) setObject:v26 forKey:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    [*(id *)(a1 + 32) scoreForEmojiStringUnsafe:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    double v28 = v27;
    if ([*(id *)(*(void *)(a1 + 32) + 16) count]
      && (uint64_t v29 = [*(id *)(*(void *)(a1 + 32) + 16) indexOfObject:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)], v29 != 0x7FFFFFFFFFFFFFFFLL))
    {
      [*(id *)(*(void *)(a1 + 32) + 16) removeObjectAtIndex:v29];
    }
    else
    {
      unint64_t v30 = [*(id *)(*(void *)(a1 + 32) + 16) count];
      if (v30 >= [*(id *)(a1 + 32) maximumRecentsCount])
      {
        long long v31 = *(id **)(a1 + 32);
        BOOL v32 = [v31[2] lastObject];
        [v31 scoreForEmojiStringUnsafe:v32];
        double v34 = v33;

        if (v34 < v28)
        {
          uint64_t v35 = *(void *)(a1 + 32);
          long long v36 = *(void **)(v35 + 24);
          long long v37 = [*(id *)(v35 + 16) lastObject];
          [v36 removeObjectForKey:v37];

          [*(id *)(*(void *)(a1 + 32) + 16) removeLastObject];
        }
      }
    }
    uint64_t v38 = 0;
    do
    {
      uint64_t v39 = v38;
      if (v38 == [*(id *)(*(void *)(a1 + 32) + 16) count]) {
        break;
      }
      v40 = *(id **)(a1 + 32);
      v41 = [v40[2] objectAtIndex:v39];
      [v40 scoreForEmojiStringUnsafe:v41];
      double v43 = v42;

      uint64_t v38 = v39 + 1;
    }
    while (v43 >= v28);
    [*(id *)(*(void *)(a1 + 32) + 16) insertObject:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) atIndex:v39];
    v44 = [*(id *)(a1 + 48) localeIdentifier];
    if (v44)
    {
      uint64_t v45 = [*(id *)(a1 + 40) length];

      if (v45)
      {
        v46 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKey:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
        v47 = (void *)[v46 mutableCopy];

        if (!v47)
        {
          v47 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
          objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "setObject:forKey:");
        }
        uint64_t v48 = *(void *)(a1 + 40);
        v49 = [*(id *)(a1 + 48) localeIdentifier];
        [v47 setObject:v48 forKey:v49];
      }
    }
  }
}

- (BOOL)shouldCountEmojiStringForUsageHistory:(id)a3
{
  id v3 = a3;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  uint64_t v4 = [v3 length];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__EMFEmojiPreferences_shouldCountEmojiStringForUsageHistory___block_invoke;
  v7[3] = &unk_1E61A9CE8;
  void v7[4] = &v8;
  objc_msgSend(v3, "_enumerateEmojiTokensInRange:block:", 0, v4, v7);
  BOOL v5 = v9[3] == 1;
  _Block_object_dispose(&v8, 8);

  return v5;
}

uint64_t __61__EMFEmojiPreferences_shouldCountEmojiStringForUsageHistory___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a3 != 0x7FFFFFFFFFFFFFFFLL) {
    ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24);
  }
  return result;
}

- (void)didViewEmojiIndex:(int64_t)a3 forCategory:(id)a4
{
  id v6 = a4;
  [(EMFEmojiPreferences *)self loadDefaultsIfNecessaryThreadSafe];
  uint64_t v7 = _getSharedSerialOperationQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__EMFEmojiPreferences_didViewEmojiIndex_forCategory___block_invoke;
  block[3] = &unk_1E61A9D10;
  id v10 = v6;
  int64_t v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_sync(v7, block);
}

uint64_t __53__EMFEmojiPreferences_didViewEmojiIndex_forCategory___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 40);
  if (!v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v4 = *(void *)(a1 + 32);
    BOOL v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    id v6 = [*(id *)(a1 + 32) defaults];
    [v6 setObject:*(void *)(*(void *)(a1 + 32) + 40) forKey:@"EMFViewedInCategoryKey"];

    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 40);
  }
  uint64_t v7 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
  [v2 setObject:v7 forKey:*(void *)(a1 + 40)];

  id v8 = [*(id *)(a1 + 32) defaults];
  [v8 setObject:*(void *)(a1 + 40) forKey:@"EMFPreviouslyUsedCategoryKey"];

  uint64_t v9 = *(void **)(a1 + 32);
  return [v9 setIsDefaultDirty:1];
}

- (void)didDisplaySkinToneHelp
{
  [(EMFEmojiPreferences *)self loadDefaultsIfNecessaryThreadSafe];
  uint64_t v3 = _getSharedSerialOperationQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__EMFEmojiPreferences_didDisplaySkinToneHelp__block_invoke;
  block[3] = &unk_1E61A9BD0;
  block[4] = self;
  dispatch_sync(v3, block);
}

uint64_t __45__EMFEmojiPreferences_didDisplaySkinToneHelp__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) defaults];
  [v2 setObject:MEMORY[0x1E4F1CC38] forKey:@"EMFDidDisplaySkinToneHelpKey"];

  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 setIsDefaultDirty:1];
}

- (BOOL)hasLastUsedVariantForEmoji:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  BOOL v5 = _getSharedSerialOperationQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__EMFEmojiPreferences_hasLastUsedVariantForEmoji___block_invoke;
  block[3] = &unk_1E61A9B80;
  id v10 = self;
  int64_t v11 = &v12;
  id v9 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return (char)v4;
}

void __50__EMFEmojiPreferences_hasLastUsedVariantForEmoji___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) supportsSkinToneVariants] & 1) == 0) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
  id v5 = [*(id *)(a1 + 32) string];
  if ([*(id *)(a1 + 32) skinTone])
  {
    uint64_t v2 = +[EMFStringUtilities _baseStringForEmojiString:v5];

    id v3 = (id)v2;
  }
  else
  {
    id v3 = v5;
  }
  id v6 = v3;
  id v4 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 32), "objectForKey:");

  if (v4) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (id)recentVariantEmojiForEmoji:(id)a3
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  char v15 = __Block_byref_object_copy__5;
  uint64_t v16 = __Block_byref_object_dispose__5;
  id v4 = a3;
  id v17 = v4;
  id v5 = _getSharedSerialOperationQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__EMFEmojiPreferences_recentVariantEmojiForEmoji___block_invoke;
  block[3] = &unk_1E61A9D38;
  void block[4] = self;
  id v10 = v4;
  int64_t v11 = &v12;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __50__EMFEmojiPreferences_recentVariantEmojiForEmoji___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "recentEmojis", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v7 + 1) + 8 * i);
        if ([v6 isEqualIgnoringModifiers:*(void *)(a1 + 40)])
        {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v6);
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (id)lastUsedVariantEmojiForEmoji:(id)a3
{
  v31[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [v4 supportsSkinToneVariants];
  id v6 = v4;
  long long v7 = v6;
  id v8 = v6;
  if (v5)
  {
    long long v9 = [v6 string];
    long long v10 = +[EMFStringUtilities _baseStringForEmojiString:v9];

    if (+[EMFEmojiCategory _isCoupleMultiSkinToneEmoji:v10])
    {
      v31[0] = @"EMFSkinToneSpecifierTypeFitzpatrickNone";
      v31[1] = @"EMFSkinToneSpecifierTypeFitzpatrickNone";
      int64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
      uint64_t v12 = (void *)[v7 copyWithSkinToneVariantSpecifier:v11];
    }
    else
    {
      uint64_t v12 = v7;
      if ([v7 skinTone])
      {
        uint64_t v12 = (void *)[v7 copyWithSkinToneVariant:0];
      }
    }
    uint64_t v25 = 0;
    long long v26 = &v25;
    uint64_t v27 = 0x3032000000;
    double v28 = __Block_byref_object_copy__5;
    uint64_t v29 = __Block_byref_object_dispose__5;
    id v30 = 0;
    uint64_t v13 = _getSharedSerialOperationQueue();
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    id v20 = __52__EMFEmojiPreferences_lastUsedVariantEmojiForEmoji___block_invoke;
    id v21 = &unk_1E61A9BA8;
    uint64_t v24 = &v25;
    uint64_t v22 = self;
    id v14 = v12;
    id v23 = v14;
    dispatch_sync(v13, &v18);

    uint64_t v15 = v26[5];
    if (v15)
    {
      uint64_t v16 = objc_msgSend(v7, "localeData", v18, v19, v20, v21, v22);
      id v8 = +[EMFEmojiToken emojiTokenWithString:v15 localeData:v16];
    }
    else
    {
      id v8 = v7;
    }

    _Block_object_dispose(&v25, 8);
  }

  return v8;
}

void __52__EMFEmojiPreferences_lastUsedVariantEmojiForEmoji___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v6 = [*(id *)(a1 + 40) string];
  uint64_t v3 = objc_msgSend(v2, "objectForKey:");
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  char v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (unint64_t)previouslyUsedIndexInCategory:(id)a3
{
  id v4 = a3;
  [(EMFEmojiPreferences *)self loadDefaultsIfNecessaryThreadSafe];
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  char v5 = _getSharedSerialOperationQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__EMFEmojiPreferences_previouslyUsedIndexInCategory___block_invoke;
  block[3] = &unk_1E61A9D38;
  void block[4] = self;
  id v10 = v4;
  int64_t v11 = &v12;
  id v6 = v4;
  dispatch_sync(v5, block);

  unint64_t v7 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v7;
}

void __53__EMFEmojiPreferences_previouslyUsedIndexInCategory___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 40) objectForKey:a1[5]];
  if (v2)
  {
    id v3 = v2;
    *(void *)(*(void *)(a1[6] + 8) + 24) = [v2 unsignedIntegerValue];
    uint64_t v2 = v3;
  }
}

- (id)typingNameForEmoji:(id)a3
{
  id v4 = a3;
  [(EMFEmojiPreferences *)self loadDefaultsIfNecessaryThreadSafe];
  char v5 = [v4 string];
  id v6 = +[EMFStringUtilities _preferenceIndexString:v5];

  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__5;
  uint64_t v22 = __Block_byref_object_dispose__5;
  id v23 = 0;
  unint64_t v7 = _getSharedSerialOperationQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__EMFEmojiPreferences_typingNameForEmoji___block_invoke;
  block[3] = &unk_1E61A9BA8;
  id v17 = &v18;
  void block[4] = self;
  id v8 = v6;
  id v16 = v8;
  dispatch_sync(v7, block);

  long long v9 = [v4 localeIdentifier];

  if (!v9
    || (id v10 = (void *)v19[5],
        [v4 localeIdentifier],
        int64_t v11 = objc_claimAutoreleasedReturnValue(),
        [v10 objectForKey:v11],
        uint64_t v12 = objc_claimAutoreleasedReturnValue(),
        v11,
        !v12))
  {
    uint64_t v13 = [(id)v19[5] allValues];
    uint64_t v12 = [v13 firstObject];
  }
  _Block_object_dispose(&v18, 8);

  return v12;
}

uint64_t __42__EMFEmojiPreferences_typingNameForEmoji___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 24) objectForKey:a1[5]];
  return MEMORY[0x1F41817F8]();
}

+ (BOOL)deviceStateIsLocked
{
  int v2 = MKBGetDeviceLockState();
  return v2 != 3 && v2 != 0;
}

+ (id)_cachedFlagCategoryEmoji:(id)a3
{
  id v4 = (void (**)(void))a3;
  char v5 = NSString;
  id v6 = EMFGetDeviceBuildVersion();
  unint64_t v7 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v8 = [v7 objectForKey:*MEMORY[0x1E4F1C3F8]];
  long long v9 = [v5 stringWithFormat:@"%@_%@", v6, v8];

  CFPropertyListRef v10 = CFPreferencesCopyAppValue(v9, (CFStringRef)[a1 _cacheDomain]);
  int64_t v11 = (void *)v10;
  if (v4)
  {
    if (!v10)
    {
      int64_t v11 = v4[2](v4);
      if (v11)
      {
        CFPreferencesSetAppValue(v9, v11, (CFStringRef)[a1 _cacheDomain]);
        CFPreferencesAppSynchronize((CFStringRef)[a1 _cacheDomain]);
      }
    }
  }

  return v11;
}

- (unint64_t)maximumRecentsCount
{
  return self->_maximumRecentsCount;
}

- (void)setMaximumRecentsCount:(unint64_t)a3
{
  self->_maximumRecentsCount = a3;
}

- (NSMutableDictionary)defaults
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDefaults:(id)a3
{
}

- (BOOL)isDefaultDirty
{
  return self->_isDefaultDirty;
}

- (void)setIsDefaultDirty:(BOOL)a3
{
  self->_isDefaultDirty = a3;
}

- (void)_setRecentStrings:(id)a3
{
  id v4 = a3;
  if (!+[EMFEmojiPreferences deviceStateIsLocked])
  {
    [(EMFEmojiPreferences *)self loadDefaultsIfNecessaryThreadSafe];
    char v5 = _getSharedSerialOperationQueue();
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __50__EMFEmojiPreferences_Testing___setRecentStrings___block_invoke;
    v6[3] = &unk_1E61A9C70;
    v6[4] = self;
    id v7 = v4;
    dispatch_sync(v5, v6);
  }
}

uint64_t __50__EMFEmojiPreferences_Testing___setRecentStrings___block_invoke(uint64_t a1)
{
  int v2 = *(void **)(*(void *)(a1 + 32) + 16);
  if (!v2)
  {
    if (*(void *)(a1 + 40))
    {
      uint64_t v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
      uint64_t v4 = *(void *)(a1 + 32);
      char v5 = *(void **)(v4 + 16);
      *(void *)(v4 + 16) = v3;

      id v6 = [*(id *)(a1 + 32) defaults];
      [v6 setObject:*(void *)(*(void *)(a1 + 32) + 16) forKey:@"EMFRecentsKey"];

      int v2 = *(void **)(*(void *)(a1 + 32) + 16);
    }
    else
    {
      int v2 = 0;
    }
  }
  uint64_t v7 = *(void *)(a1 + 40);
  return [v2 setArray:v7];
}

@end