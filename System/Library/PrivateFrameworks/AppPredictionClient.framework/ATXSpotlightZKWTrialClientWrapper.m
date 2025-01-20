@interface ATXSpotlightZKWTrialClientWrapper
+ (id)sharedInstance;
- (ATXSpotlightZKWTrialClientWrapper)initWithClientIdentifier:(int)a3;
- (BOOL)matchesAlternateRecentsControlCodePath;
- (BOOL)matchesAlternateRecentsTreatmentCodePath;
- (BOOL)matchesSuggestionsMaxCount;
- (BOOL)nsuaSuggestions;
- (BOOL)showNSUASuggestionsAsAppLaunches;
- (id)codePathForAlternateRecentsControl;
- (id)codePathForAlternateRecentsTreatment;
- (id)codePathIdForSuggestionsMaxCount;
- (id)codepathIDs;
- (int64_t)alternateRecentsRanking;
- (int64_t)suggestionsMaxCount;
- (void)updateFactors;
@end

@implementation ATXSpotlightZKWTrialClientWrapper

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken2_2 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken2_2, &__block_literal_global_79);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_13;

  return v2;
}

void __51__ATXSpotlightZKWTrialClientWrapper_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1AD0D3C30]();
  v1 = [[ATXSpotlightZKWTrialClientWrapper alloc] initWithClientIdentifier:232];
  v2 = (void *)sharedInstance__pasExprOnceResult_13;
  sharedInstance__pasExprOnceResult_13 = (uint64_t)v1;
}

- (ATXSpotlightZKWTrialClientWrapper)initWithClientIdentifier:(int)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ATXSpotlightZKWTrialClientWrapper;
  v3 = [(ATXTrialClientWrapper *)&v9 initWithClientIdentifier:*(void *)&a3 namespaceName:@"SPOTLIGHT_UI"];
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F93B70]);
    v5 = objc_opt_new();
    uint64_t v6 = [v4 initWithGuardedData:v5];
    lock = v3->_lock;
    v3->_lock = (_PASLock *)v6;

    [(ATXSpotlightZKWTrialClientWrapper *)v3 updateFactors];
  }
  return v3;
}

- (void)updateFactors
{
  lock = self->_lock;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __50__ATXSpotlightZKWTrialClientWrapper_updateFactors__block_invoke;
  v3[3] = &unk_1E5D09B10;
  v3[4] = self;
  [(_PASLock *)lock runWithLockAcquired:v3];
}

void __50__ATXSpotlightZKWTrialClientWrapper_updateFactors__block_invoke(uint64_t a1, void *a2)
{
  v3 = a2;
  id v4 = __atxlog_handle_default();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_1A790D000, v4, OS_LOG_TYPE_INFO, "ATXSpotlightZKWTrialClientWrapper: Updating factors", v14, 2u);
  }

  [*(id *)(a1 + 32) refreshEnrollmentInformation];
  v5 = [*(id *)(a1 + 32) stringForFactor:@"codepathIDs"];
  uint64_t v6 = [v5 uppercaseString];
  v7 = (void *)v3[1];
  v3[1] = v6;

  v8 = [*(id *)(a1 + 32) longForFactor:@"ZKWSuggestionsMaxCount"];
  uint64_t v9 = [v8 longValue];
  uint64_t v10 = 4;
  if (v9) {
    uint64_t v10 = v9;
  }
  v3[2] = v10;

  v11 = [*(id *)(a1 + 32) BOOLForFactor:@"ZKWNSUASuggestions"];
  *((unsigned char *)v3 + 24) = [v11 BOOLValue];

  v12 = [*(id *)(a1 + 32) BOOLForFactor:@"ZKWShowNSUASuggestionsAsAppLaunches"];
  *((unsigned char *)v3 + 25) = [v12 BOOLValue];

  v13 = [*(id *)(a1 + 32) longForFactor:@"ZKWAlternateRecentsRanking"];
  v3[4] = [v13 longValue];
}

- (id)codePathIdForSuggestionsMaxCount
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"9FDF73BF-DFFD-48E8-81C9-13570F689942"];

  return v2;
}

- (BOOL)matchesSuggestionsMaxCount
{
  v3 = [(ATXSpotlightZKWTrialClientWrapper *)self codepathIDs];
  id v4 = [(ATXSpotlightZKWTrialClientWrapper *)self codePathIdForSuggestionsMaxCount];
  v5 = [v4 UUIDString];
  char v6 = [v3 containsString:v5];

  return v6;
}

- (id)codePathForAlternateRecentsControl
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"060589A5-DF6F-4C6A-A954-1E87CE792C96"];

  return v2;
}

- (id)codePathForAlternateRecentsTreatment
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"A0E6F9C0-EC33-4884-88D8-36ED11E3E541"];

  return v2;
}

- (BOOL)matchesAlternateRecentsControlCodePath
{
  v3 = [(ATXSpotlightZKWTrialClientWrapper *)self codepathIDs];
  id v4 = [(ATXSpotlightZKWTrialClientWrapper *)self codePathForAlternateRecentsControl];
  v5 = [v4 UUIDString];
  char v6 = [v3 containsString:v5];

  return v6;
}

- (BOOL)matchesAlternateRecentsTreatmentCodePath
{
  v3 = [(ATXSpotlightZKWTrialClientWrapper *)self codepathIDs];
  id v4 = [(ATXSpotlightZKWTrialClientWrapper *)self codePathForAlternateRecentsTreatment];
  v5 = [v4 UUIDString];
  char v6 = [v3 containsString:v5];

  return v6;
}

- (id)codepathIDs
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__18;
  uint64_t v10 = __Block_byref_object_dispose__18;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__ATXSpotlightZKWTrialClientWrapper_codepathIDs__block_invoke;
  v5[3] = &unk_1E5D09B38;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __48__ATXSpotlightZKWTrialClientWrapper_codepathIDs__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (int64_t)suggestionsMaxCount
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__ATXSpotlightZKWTrialClientWrapper_suggestionsMaxCount__block_invoke;
  v5[3] = &unk_1E5D09B38;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __56__ATXSpotlightZKWTrialClientWrapper_suggestionsMaxCount__block_invoke(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(void *)(a2 + 16);
  return result;
}

- (BOOL)nsuaSuggestions
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__ATXSpotlightZKWTrialClientWrapper_nsuaSuggestions__block_invoke;
  v5[3] = &unk_1E5D09B38;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __52__ATXSpotlightZKWTrialClientWrapper_nsuaSuggestions__block_invoke(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(unsigned char *)(a2 + 24);
  return result;
}

- (BOOL)showNSUASuggestionsAsAppLaunches
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__ATXSpotlightZKWTrialClientWrapper_showNSUASuggestionsAsAppLaunches__block_invoke;
  v5[3] = &unk_1E5D09B38;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __69__ATXSpotlightZKWTrialClientWrapper_showNSUASuggestionsAsAppLaunches__block_invoke(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(unsigned char *)(a2 + 25);
  return result;
}

- (int64_t)alternateRecentsRanking
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__ATXSpotlightZKWTrialClientWrapper_alternateRecentsRanking__block_invoke;
  v5[3] = &unk_1E5D09B38;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __60__ATXSpotlightZKWTrialClientWrapper_alternateRecentsRanking__block_invoke(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(void *)(a2 + 32);
  return result;
}

- (void).cxx_destruct
{
}

@end