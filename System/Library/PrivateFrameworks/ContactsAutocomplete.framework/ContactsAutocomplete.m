void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  uint64_t v4;
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x2Au);
}

id sRecentContactLogDescription_block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F1CA48];
  id v3 = a2;
  v4 = [v2 array];
  v5 = NSString;
  v6 = [v3 description];
  v7 = [v5 stringWithFormat:@"%@", v6];
  [v4 addObject:v7];

  v8 = NSString;
  uint64_t v9 = [v3 lastSendingAddress];
  uint64_t v10 = [v8 stringWithFormat:@"%@", v9];
  [v4 addObject:v10];

  v11 = NSString;
  v12 = [v3 mostRecentDate];

  v13 = [v11 stringWithFormat:@"%@", v12];
  [v4 addObject:v13];

  v14 = [v4 componentsJoinedByString:@", "];

  return v14;
}

void sub_1BEF5ACE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v14 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_1BEF5B15C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a15, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1BEF5B57C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1BEF5BD88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

Class init_PSSuggester()
{
  if (LoadPeopleSuggester_loadPredicate != -1) {
    dispatch_once(&LoadPeopleSuggester_loadPredicate, &__block_literal_global_0);
  }
  Class result = objc_getClass("_PSSuggester");
  class_PSSuggester = (uint64_t)result;
  get_PSSuggesterClass = (uint64_t (*)())_PSSuggesterFunction;
  return result;
}

id _PSSuggesterFunction()
{
  return (id)class_PSSuggester;
}

void __LoadPeopleSuggester_block_invoke()
{
  LoadPeopleSuggester_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/PeopleSuggester.framework/PeopleSuggester", 1);
  if (!LoadPeopleSuggester_frameworkLibrary && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __LoadPeopleSuggester_block_invoke_cold_1();
  }
}

uint64_t _CNAInternalBuild()
{
  v0 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  uint64_t v1 = [v0 isInternalBuild];

  return v1;
}

uint64_t CNAutocompleteIsDebugLoggingEnabled()
{
  int v0 = _CNAInternalBuild();
  uint64_t v1 = [MEMORY[0x1E4F5A568] standardPreferences];
  v2 = v1;
  if (v0) {
    uint64_t v3 = [v1 userHasOptedOutOfPreference:@"CNAutocompleteLogEnabled"] ^ 1;
  }
  else {
    uint64_t v3 = [v1 userHasOptedInToPreference:@"CNAutocompleteLogEnabled"];
  }

  return v3;
}

uint64_t CNAutocompleteIsSortingLoggingEnabled()
{
  int v0 = [MEMORY[0x1E4F5A568] standardPreferences];
  uint64_t v1 = [v0 userHasOptedInToPreference:@"CNAutocompleteSortingLogEnabled"];

  return v1;
}

uint64_t CNAutocompleteIsProbesLoggingEnabled()
{
  int v0 = [MEMORY[0x1E4F5A568] standardPreferences];
  uint64_t v1 = [v0 BOOLForKey:@"CNAutocompleteProbesLogEnabled"];

  return v1;
}

id CNALoggingContextPerformance()
{
  if (CNALoggingContextPerformance_cn_once_token_0 != -1) {
    dispatch_once(&CNALoggingContextPerformance_cn_once_token_0, &__block_literal_global_1);
  }
  int v0 = (void *)CNALoggingContextPerformance_cn_once_object_0;
  return v0;
}

uint64_t __CNALoggingContextPerformance_block_invoke()
{
  CNALoggingContextPerformance_cn_once_object_0 = (uint64_t)os_log_create("com.apple.contacts.autocomplete", "performance");
  return MEMORY[0x1F41817F8]();
}

id CNALoggingContextSorting()
{
  if (CNALoggingContextSorting_cn_once_token_1 != -1) {
    dispatch_once(&CNALoggingContextSorting_cn_once_token_1, &__block_literal_global_12);
  }
  int v0 = (void *)CNALoggingContextSorting_cn_once_object_1;
  return v0;
}

uint64_t __CNALoggingContextSorting_block_invoke()
{
  CNALoggingContextSorting_cn_once_object_1 = (uint64_t)os_log_create("com.apple.contacts.autocomplete", "sorting");
  return MEMORY[0x1F41817F8]();
}

id CNALoggingContextDebug()
{
  if (CNALoggingContextDebug_cn_once_token_2 != -1) {
    dispatch_once(&CNALoggingContextDebug_cn_once_token_2, &__block_literal_global_15);
  }
  int v0 = (void *)CNALoggingContextDebug_cn_once_object_2;
  return v0;
}

uint64_t __CNALoggingContextDebug_block_invoke()
{
  CNALoggingContextDebug_cn_once_object_2 = (uint64_t)os_log_create("com.apple.contacts.autocomplete", "debug");
  return MEMORY[0x1F41817F8]();
}

id CNALoggingContextProbes()
{
  if (CNALoggingContextProbes_cn_once_token_3 != -1) {
    dispatch_once(&CNALoggingContextProbes_cn_once_token_3, &__block_literal_global_18);
  }
  int v0 = (void *)CNALoggingContextProbes_cn_once_object_3;
  return v0;
}

uint64_t __CNALoggingContextProbes_block_invoke()
{
  CNALoggingContextProbes_cn_once_object_3 = (uint64_t)os_log_create("com.apple.contacts.autocomplete", "probes");
  return MEMORY[0x1F41817F8]();
}

id CNALoggingContextTriage()
{
  if (CNALoggingContextTriage_cn_once_token_4 != -1) {
    dispatch_once(&CNALoggingContextTriage_cn_once_token_4, &__block_literal_global_21);
  }
  int v0 = (void *)CNALoggingContextTriage_cn_once_object_4;
  return v0;
}

uint64_t __CNALoggingContextTriage_block_invoke()
{
  CNALoggingContextTriage_cn_once_object_4 = (uint64_t)os_log_create("com.apple.contacts.autocomplete", "triage");
  return MEMORY[0x1F41817F8]();
}

void sub_1BEF5D234(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class initSGSuggestionsService()
{
  if (LoadCoreSuggestions_loadPredicate != -1) {
    dispatch_once(&LoadCoreSuggestions_loadPredicate, &__block_literal_global_106);
  }
  Class result = objc_getClass("SGSuggestionsService");
  classSGSuggestionsService = (uint64_t)result;
  getSGSuggestionsServiceClass = (uint64_t (*)())SGSuggestionsServiceFunction;
  return result;
}

id SGSuggestionsServiceFunction()
{
  return (id)classSGSuggestionsService;
}

void __LoadCoreSuggestions_block_invoke()
{
  LoadCoreSuggestions_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/CoreSuggestions.framework/CoreSuggestions", 1);
  if (!LoadCoreSuggestions_frameworkLibrary && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __LoadCoreSuggestions_block_invoke_cold_1();
  }
}

__CFString *sBackspaceRepresentation_block_invoke()
{
  return @"^H";
}

Class initEKDirectorySearchOperation()
{
  if (LoadEventKit_loadPredicate != -1) {
    dispatch_once(&LoadEventKit_loadPredicate, &__block_literal_global_4);
  }
  Class result = objc_getClass("EKDirectorySearchOperation");
  classEKDirectorySearchOperation = (uint64_t)result;
  getEKDirectorySearchOperationClass = (uint64_t (*)())EKDirectorySearchOperationFunction;
  return result;
}

id EKDirectorySearchOperationFunction()
{
  return (id)classEKDirectorySearchOperation;
}

void __LoadEventKit_block_invoke()
{
  LoadEventKit_frameworkLibrary = (uint64_t)dlopen("/System/Library/Frameworks/EventKit.framework/EventKit", 1);
  if (!LoadEventKit_frameworkLibrary && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __LoadEventKit_block_invoke_cold_1();
  }
}

void sub_1BEF5FA98(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 48));
  objc_destroyWeak((id *)(v3 - 40));
  _Unwind_Resume(a1);
}

void sub_1BEF5FB94(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1BEF626FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sNameComponentsFromContact_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 contactType] == 1)
  {
    uint64_t v3 = 0;
  }
  else
  {
    v4 = [v2 givenName];
    v5 = [v2 familyName];
    v6 = [v2 nickname];
    v7 = [v2 nameSuffix];
    uint64_t v3 = +[CNAutocompleteNameComponents nameComponentsWithFirstName:v4 lastName:v5 nickname:v6 nameSuffix:v7];
  }
  return v3;
}

void sub_1BEF66D4C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

uint64_t sIsContact_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t sContainsAlphanumericCharacters_block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F28B88];
  id v3 = a2;
  v4 = [v2 alphanumericCharacterSet];
  uint64_t v5 = objc_msgSend(v3, "_cn_containsCharacterInSet:", v4);

  return v5;
}

Class init_PSSuggester_0()
{
  if (LoadPeopleSuggester_loadPredicate_0 != -1) {
    dispatch_once(&LoadPeopleSuggester_loadPredicate_0, &__block_literal_global_33);
  }
  Class result = objc_getClass("_PSSuggester");
  class_PSSuggester_0 = (uint64_t)result;
  get_PSSuggesterClass_0 = (uint64_t (*)())_PSSuggesterFunction_0;
  return result;
}

id _PSSuggesterFunction_0()
{
  return (id)class_PSSuggester_0;
}

void __LoadPeopleSuggester_block_invoke_0()
{
  LoadPeopleSuggester_frameworkLibrary_0 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/PeopleSuggester.framework/PeopleSuggester", 1);
  if (!LoadPeopleSuggester_frameworkLibrary_0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __LoadPeopleSuggester_block_invoke_cold_1();
  }
}

Class init_PSCNAutocompleteFeedback()
{
  if (LoadPeopleSuggester_loadPredicate_0 != -1) {
    dispatch_once(&LoadPeopleSuggester_loadPredicate_0, &__block_literal_global_33);
  }
  Class result = objc_getClass("_PSCNAutocompleteFeedback");
  class_PSCNAutocompleteFeedback = (uint64_t)result;
  get_PSCNAutocompleteFeedbackClass = (uint64_t (*)())_PSCNAutocompleteFeedbackFunction;
  return result;
}

id _PSCNAutocompleteFeedbackFunction()
{
  return (id)class_PSCNAutocompleteFeedback;
}

Class initEKEventStore()
{
  if (LoadEventKit_loadPredicate_0 != -1) {
    dispatch_once(&LoadEventKit_loadPredicate_0, &__block_literal_global_15);
  }
  Class result = objc_getClass("EKEventStore");
  classEKEventStore = (uint64_t)result;
  getEKEventStoreClass = (uint64_t (*)())EKEventStoreFunction;
  return result;
}

id EKEventStoreFunction()
{
  return (id)classEKEventStore;
}

void __LoadEventKit_block_invoke_0()
{
  LoadEventKit_frameworkLibrary_0 = (uint64_t)dlopen("/System/Library/Frameworks/EventKit.framework/EventKit", 1);
  if (!LoadEventKit_frameworkLibrary_0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __LoadEventKit_block_invoke_cold_1();
  }
}

BOOL _block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = a2;
  v7 = [v4 array];
  v8 = [v6 displayName];
  uint64_t v9 = +[CNAutocompleteTokenMatcher tokensForNameString:v8];
  [v7 addObjectsFromArray:v9];

  uint64_t v10 = [v6 address];

  objc_msgSend(v7, "_cn_addNonNilObject:", v10);
  v11 = +[CNAutocompleteTokenMatcher tokensForNameString:v5];

  BOOL v12 = +[CNAutocompleteTokenMatcher doSearchTokens:v11 matchNameTokens:v7];
  return v12;
}

uint64_t _block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 kind];
  uint64_t v3 = [v2 isEqual:*MEMORY[0x1E4F5CC68]] ^ 1;

  return v3;
}

void sub_1BEF6FA98(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

id sForkJoinCleanup_block_invoke(uint64_t a1, void *a2)
{
  id v2 = objc_msgSend(a2, "_cn_filter:", *MEMORY[0x1E4F5A280]);
  uint64_t v3 = objc_msgSend(v2, "_cn_flatten");

  return v3;
}

void sub_1BEF708CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_1BEF71230(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BEF71644(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BEF71770(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BEF71E30(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BEF71FB8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BEF720D8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BEF721FC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BEF730B0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 104));
  _Unwind_Resume(a1);
}

void sub_1BEF73F98(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_1BEF7461C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BEF74B58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void CNAutocompleteDelegateMultipleCallbacks(void *a1)
{
  id v1 = a1;
  id v2 = CNALoggingContextTriage();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
    CNAutocompleteDelegateMultipleCallbacks_cold_1(v1, v2);
  }
}

id contactSearchLog()
{
  if (contactSearchLog_cn_once_token_0 != -1) {
    dispatch_once(&contactSearchLog_cn_once_token_0, &__block_literal_global_126);
  }
  int v0 = (void *)contactSearchLog_cn_once_object_0;
  return v0;
}

void sub_1BEF76478(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BEF764E4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BEF76694(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BEF766F4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t __CNGuardOSLog_block_invoke()
{
  CNGuardOSLog_cn_once_object_0 = (uint64_t)os_log_create("com.apple.contacts", "api");
  return MEMORY[0x1F41817F8]();
}

uint64_t __contactSearchLog_block_invoke()
{
  contactSearchLog_cn_once_object_0 = (uint64_t)os_log_create("com.apple.contacts.autocomplete", "contactsearch");
  return MEMORY[0x1F41817F8]();
}

Class init_PSSuggestion()
{
  if (LoadPeopleSuggester_loadPredicate_1 != -1) {
    dispatch_once(&LoadPeopleSuggester_loadPredicate_1, &__block_literal_global_94);
  }
  Class result = objc_getClass("_PSSuggestion");
  class_PSSuggestion = (uint64_t)result;
  get_PSSuggestionClass = (uint64_t (*)())_PSSuggestionFunction;
  return result;
}

id _PSSuggestionFunction()
{
  return (id)class_PSSuggestion;
}

void __LoadPeopleSuggester_block_invoke_1()
{
  LoadPeopleSuggester_frameworkLibrary_1 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/PeopleSuggester.framework/PeopleSuggester", 1);
  if (!LoadPeopleSuggester_frameworkLibrary_1 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __LoadPeopleSuggester_block_invoke_cold_1();
  }
}

Class init_PSRecipient()
{
  if (LoadPeopleSuggester_loadPredicate_1 != -1) {
    dispatch_once(&LoadPeopleSuggester_loadPredicate_1, &__block_literal_global_94);
  }
  Class result = objc_getClass("_PSRecipient");
  class_PSRecipient = (uint64_t)result;
  get_PSRecipientClass = (uint64_t (*)())_PSRecipientFunction;
  return result;
}

id _PSRecipientFunction()
{
  return (id)class_PSRecipient;
}

uint64_t CNAutocompleteProbeBuildKey(void *a1, const char *a2)
{
  return [a1 componentsJoinedByString:@"."];
}

id CNAutocompleteProbeBatchKey(uint64_t a1)
{
  id v1 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a1];
  id v2 = [v1 description];
  uint64_t v3 = [@"batch" stringByAppendingString:v2];

  return v3;
}

__CFString *CNAutocompleteProbeBoolKey(int a1)
{
  if (a1) {
    return @"YES";
  }
  else {
    return @"NO";
  }
}

__CFString *CNAutocompleteProbeSourceTypeKey(uint64_t a1)
{
  char v1 = a1;
  BOOL v2 = +[CNAutocompleteResult isSourceTypeConsideredSuggestion:a1];
  uint64_t v3 = @"Duet Promoted";
  if ((v1 & 0x10) == 0) {
    uint64_t v3 = @"Other";
  }
  if (v2) {
    return @"Pure Suggestions";
  }
  else {
    return v3;
  }
}

id CNAutocompleteProbeDuetModelID()
{
  int v0 = [MEMORY[0x1E4F5B428] loggingTagForAutocompleteFeedback];
  char v1 = [@"Duet" stringByAppendingString:v0];

  return v1;
}

void sub_1BEF797C4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

Class init_PSAutocompleteSuggestion()
{
  if (LoadPeopleSuggester_loadPredicate_2 != -1) {
    dispatch_once(&LoadPeopleSuggester_loadPredicate_2, &__block_literal_global_103);
  }
  Class result = objc_getClass("_PSAutocompleteSuggestion");
  class_PSAutocompleteSuggestion = (uint64_t)result;
  get_PSAutocompleteSuggestionClass = (uint64_t (*)())_PSAutocompleteSuggestionFunction;
  return result;
}

id _PSAutocompleteSuggestionFunction()
{
  return (id)class_PSAutocompleteSuggestion;
}

void __LoadPeopleSuggester_block_invoke_2()
{
  LoadPeopleSuggester_frameworkLibrary_2 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/PeopleSuggester.framework/PeopleSuggester", 1);
  if (!LoadPeopleSuggester_frameworkLibrary_2 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __LoadPeopleSuggester_block_invoke_cold_1();
  }
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

uint64_t __CNResultWithQoS_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  return MEMORY[0x1F41817F8]();
}

Class init_PSSuggester_1()
{
  if (LoadPeopleSuggester_loadPredicate_2 != -1) {
    dispatch_once(&LoadPeopleSuggester_loadPredicate_2, &__block_literal_global_103);
  }
  Class result = objc_getClass("_PSSuggester");
  class_PSSuggester_1 = (uint64_t)result;
  get_PSSuggesterClass_1 = (uint64_t (*)())_PSSuggesterFunction_1;
  return result;
}

id _PSSuggesterFunction_1()
{
  return (id)class_PSSuggester_1;
}

Class init_PSPredictionContext()
{
  if (LoadPeopleSuggester_loadPredicate_2 != -1) {
    dispatch_once(&LoadPeopleSuggester_loadPredicate_2, &__block_literal_global_103);
  }
  Class result = objc_getClass("_PSPredictionContext");
  class_PSPredictionContext = (uint64_t)result;
  get_PSPredictionContextClass = (uint64_t (*)())_PSPredictionContextFunction;
  return result;
}

id _PSPredictionContextFunction()
{
  return (id)class_PSPredictionContext;
}

id sNormalizeSearchToken_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
  if (objc_msgSend(v2, "_cn_containsCharacterInSet:", v3))
  {
    uint64_t v4 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
    id v5 = [v2 componentsSeparatedByCharactersInSet:v4];
    uint64_t v6 = [v5 componentsJoinedByString:&stru_1F1A2F2D8];

    id v2 = (id)v6;
  }

  return v2;
}

Class init_PSPredictionContext_0()
{
  if (LoadPeopleSuggester_loadPredicate_3 != -1) {
    dispatch_once(&LoadPeopleSuggester_loadPredicate_3, &__block_literal_global_139);
  }
  Class result = objc_getClass("_PSPredictionContext");
  class_PSPredictionContext_0 = (uint64_t)result;
  get_PSPredictionContextClass_0 = (uint64_t (*)())_PSPredictionContextFunction_0;
  return result;
}

id _PSPredictionContextFunction_0()
{
  return (id)class_PSPredictionContext_0;
}

void __LoadPeopleSuggester_block_invoke_3()
{
  LoadPeopleSuggester_frameworkLibrary_3 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/PeopleSuggester.framework/PeopleSuggester", 1);
  if (!LoadPeopleSuggester_frameworkLibrary_3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __LoadPeopleSuggester_block_invoke_cold_1();
  }
}

uint64_t sSortByPassingTest_block_invoke(uint64_t a1, void *a2, void *a3, uint64_t (**a4)(id, id))
{
  uint64_t v6 = a4 + 2;
  v7 = a4[2];
  v8 = a4;
  id v9 = a3;
  int v10 = v7(v8, a2);
  unsigned int v11 = (*v6)(v8, v9);

  if (v10 ^ 1 | v11) {
    return (v10 ^ 1) & v11;
  }
  else {
    return -1;
  }
}

uint64_t sResultHasPreferredDomain_block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 hasPreferredDomain];
}

uint64_t sSortResultsByPreferredDomain_block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = CNALoggingContextSorting();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sSortResultsByPreferredDomain_block_invoke_3_cold_1();
  }

  uint64_t v8 = sSortByPassingTest_block_invoke(v7, v4, v5, __block_literal_global_3);
  return v8;
}

uint64_t sSortResultsByCategory_block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [(id)objc_opt_class() category];
  unint64_t v7 = [(id)objc_opt_class() category];
  uint64_t v8 = CNALoggingContextSorting();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138478595;
    id v12 = v4;
    __int16 v13 = 2048;
    unint64_t v14 = v6;
    __int16 v15 = 2113;
    id v16 = v5;
    __int16 v17 = 2048;
    unint64_t v18 = v7;
    _os_log_debug_impl(&dword_1BEF57000, v8, OS_LOG_TYPE_DEBUG, "Comparing type of %{private}@ (%lu) with %{private}@ (%lu)", (uint8_t *)&v11, 0x2Au);
  }

  if (v6 < v7) {
    uint64_t v9 = -1;
  }
  else {
    uint64_t v9 = v6 > v7;
  }

  return v9;
}

uint64_t sSortResultsByDisplayName_block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = CNALoggingContextSorting();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sSortResultsByDisplayName_block_invoke_5_cold_1();
  }

  unint64_t v7 = [v4 displayName];
  uint64_t v8 = [v5 displayName];
  uint64_t v9 = [v7 localizedCaseInsensitiveCompare:v8];

  return v9;
}

uint64_t sSortResultsByAddress_block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 value];
  unint64_t v7 = [v6 stringForSorting];

  uint64_t v8 = [v5 value];
  uint64_t v9 = [v8 stringForSorting];

  int v10 = CNALoggingContextSorting();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 138478595;
    id v14 = v4;
    __int16 v15 = 2113;
    id v16 = v7;
    __int16 v17 = 2113;
    id v18 = v5;
    __int16 v19 = 2113;
    v20 = v9;
    _os_log_debug_impl(&dword_1BEF57000, v10, OS_LOG_TYPE_DEBUG, "Comparing address of %{private}@ (%{private}@) with %{private}@ (%{private}@)", (uint8_t *)&v13, 0x2Au);
  }

  uint64_t v11 = [v7 localizedCaseInsensitiveCompare:v9];
  return v11;
}

uint64_t sRecentResultMatchesLastSendingAccount_block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 matchesSendingAddress];
}

uint64_t sSortRecentResultsBySendingAddressMatch_block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = CNALoggingContextSorting();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sSortRecentResultsBySendingAddressMatch_block_invoke_8_cold_1();
  }

  uint64_t v8 = sSortByPassingTest_block_invoke(v7, v4, v5, __block_literal_global_15_0);
  return v8;
}

uint64_t sRecentResultCompletesChosenGroup_block_invoke_9(uint64_t a1, void *a2)
{
  return [a2 completesChosenGroup];
}

uint64_t sSortRecentResultsByCompletingChosenGroup_block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = CNALoggingContextSorting();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sSortRecentResultsByCompletingChosenGroup_block_invoke_10_cold_1();
  }

  uint64_t v8 = sSortByPassingTest_block_invoke(v7, v4, v5, __block_literal_global_20_1);
  return v8;
}

uint64_t sSortRecentResultsByDate_block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 date];
  uint64_t v7 = [v5 date];
  uint64_t v8 = [v6 compare:v7];

  uint64_t v9 = CNALoggingContextSorting();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sSortRecentResultsByDate_block_invoke_11_cold_1();
  }

  if (v8 == 1) {
    uint64_t v10 = -1;
  }
  else {
    uint64_t v10 = 0;
  }
  if (v8 == -1) {
    uint64_t v11 = 1;
  }
  else {
    uint64_t v11 = v10;
  }

  return v11;
}

uint64_t sSortRecentResultsByDateCount_block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 dateCount];
  unint64_t v7 = [v5 dateCount];
  uint64_t v8 = CNALoggingContextSorting();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138478595;
    id v12 = v4;
    __int16 v13 = 2048;
    unint64_t v14 = v6;
    __int16 v15 = 2113;
    id v16 = v5;
    __int16 v17 = 2048;
    unint64_t v18 = v7;
    _os_log_debug_impl(&dword_1BEF57000, v8, OS_LOG_TYPE_DEBUG, "Comparing date count of %{private}@ (%lu) with %{private}@ (%lu)", (uint8_t *)&v11, 0x2Au);
  }

  if (v6 > v7) {
    uint64_t v9 = -1;
  }
  else {
    uint64_t v9 = v6 < v7;
  }

  return v9;
}

void sub_1BEF844C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id location)
{
  objc_destroyWeak(v32);
  objc_destroyWeak(&location);
  _Block_object_dispose((const void *)(v33 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void sub_1BEF84A8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class initEKDirectorySearchOperation_0()
{
  if (LoadEventKit_loadPredicate_1 != -1) {
    dispatch_once(&LoadEventKit_loadPredicate_1, &__block_literal_global_105);
  }
  Class result = objc_getClass("EKDirectorySearchOperation");
  classEKDirectorySearchOperation_0 = (uint64_t)result;
  getEKDirectorySearchOperationClass_0 = (uint64_t (*)())EKDirectorySearchOperationFunction_0;
  return result;
}

id EKDirectorySearchOperationFunction_0()
{
  return (id)classEKDirectorySearchOperation_0;
}

void __LoadEventKit_block_invoke_1()
{
  LoadEventKit_frameworkLibrary_1 = (uint64_t)dlopen("/System/Library/Frameworks/EventKit.framework/EventKit", 1);
  if (!LoadEventKit_frameworkLibrary_1 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __LoadEventKit_block_invoke_cold_1();
  }
}

Class initEKEphemeralCacheEventStoreProvider()
{
  if (LoadEventKit_loadPredicate_1 != -1) {
    dispatch_once(&LoadEventKit_loadPredicate_1, &__block_literal_global_105);
  }
  Class result = objc_getClass("EKEphemeralCacheEventStoreProvider");
  classEKEphemeralCacheEventStoreProvider = (uint64_t)result;
  getEKEphemeralCacheEventStoreProviderClass = (uint64_t (*)())EKEphemeralCacheEventStoreProviderFunction;
  return result;
}

id EKEphemeralCacheEventStoreProviderFunction()
{
  return (id)classEKEphemeralCacheEventStoreProvider;
}

Class initEKEventStore_0()
{
  if (LoadEventKit_loadPredicate_1 != -1) {
    dispatch_once(&LoadEventKit_loadPredicate_1, &__block_literal_global_105);
  }
  Class result = objc_getClass("EKEventStore");
  classEKEventStore_0 = (uint64_t)result;
  getEKEventStoreClass_0 = (uint64_t (*)())EKEventStoreFunction_0;
  return result;
}

id EKEventStoreFunction_0()
{
  return (id)classEKEventStore_0;
}

Class initEKDirectorySearchQuery()
{
  if (LoadEventKit_loadPredicate_1 != -1) {
    dispatch_once(&LoadEventKit_loadPredicate_1, &__block_literal_global_105);
  }
  Class result = objc_getClass("EKDirectorySearchQuery");
  classEKDirectorySearchQuery = (uint64_t)result;
  getEKDirectorySearchQueryClass = (uint64_t (*)())EKDirectorySearchQueryFunction;
  return result;
}

id EKDirectorySearchQueryFunction()
{
  return (id)classEKDirectorySearchQuery;
}

void sub_1BEF857F0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t CNAutocompleteResultStringForHashingTransform_block_invoke(uint64_t a1, void *a2)
{
  return [a2 stringForHashing];
}

id sNormalizeCaseDiactriticsAndCharacterWidth_block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = +[CNAutocompleteResult localeForHashing];
  id v4 = [v2 stringByFoldingWithOptions:385 locale:v3];

  return v4;
}

id sNormalizePhoneNumberFormatting_block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = +[CNAutocompleteResult localeForHashing];
  [v3 objectForKey:*MEMORY[0x1E4F1C400]];

  uint64_t v4 = CFPhoneNumberCreate();
  if (v4)
  {
    id v5 = (const void *)v4;
    String = (const void *)CFPhoneNumberCreateString();
    id v7 = v2;
    if (String)
    {
      uint64_t v8 = [NSString stringWithString:String];

      CFRelease(String);
      id v7 = (id)v8;
    }
    CFRelease(v5);
  }
  else
  {
    id v7 = v2;
  }

  return v7;
}

id CNAutocompleteResultAddressStringForHashingEmailTransform_block_invoke_4(uint64_t a1, void *a2)
{
  return (*((id (**)(uint64_t, void *))sNormalizeCaseDiactriticsAndCharacterWidth + 2))((uint64_t)sNormalizeCaseDiactriticsAndCharacterWidth, a2);
}

id CNAutocompleteResultAddressStringForHashingPhoneNumberTransform_block_invoke_5(uint64_t a1, void *a2)
{
  return (*((id (**)(uint64_t, void *))sNormalizePhoneNumberFormatting + 2))((uint64_t)sNormalizePhoneNumberFormatting, a2);
}

id CNAutocompleteResultAddressStringForHashingTransform_block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = (*((void (**)(uint64_t, void *))sNormalizeCaseDiactriticsAndCharacterWidth + 2))((uint64_t)sNormalizeCaseDiactriticsAndCharacterWidth, a2);
  uint64_t v3 = (*((void (**)(uint64_t, void *))sNormalizePhoneNumberFormatting + 2))((uint64_t)sNormalizePhoneNumberFormatting, v2);

  return v3;
}

id CNAutocompleteResultUserInfoDescriptionTransform_block_invoke_7(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 allKeys];
  uint64_t v4 = [v3 sortedArrayUsingSelector:sel_localizedCaseInsensitiveCompare_];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = CNAutocompleteResultUserInfoDescriptionTransform_block_invoke_8;
  v9[3] = &unk_1E63DE820;
  id v10 = v2;
  id v5 = v2;
  unint64_t v6 = objc_msgSend(v4, "_cn_map:", v9);
  id v7 = [v6 componentsJoinedByString:@","];

  return v7;
}

id CNAutocompleteResultUserInfoDescriptionTransform_block_invoke_8(uint64_t a1, void *a2)
{
  id v2 = NSString;
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 objectForKeyedSubscript:v4];
  unint64_t v6 = [v2 stringWithFormat:@"%@:%@", v4, v5];

  return v6;
}

uint64_t sub_1BEF8A878(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ComposeRecipient.Identifier(0);
  uint64_t v48 = *(void *)(v2 - 8);
  uint64_t v3 = ((uint64_t (*)(void))MEMORY[0x1F4188790])();
  id v5 = (char *)v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v3);
  id v7 = (char *)v47 - v6;
  uint64_t v8 = type metadata accessor for ComposeRecipient(0);
  uint64_t v9 = MEMORY[0x1F4188790](v8);
  int v11 = (char *)v47 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  unint64_t v14 = (char *)v47 - v13;
  uint64_t v15 = *(void *)(a1 + 16);
  if (!v15)
  {
    v45 = (void *)MEMORY[0x1E4FBC860];
LABEL_31:
    swift_bridgeObjectRelease();
    return (uint64_t)v45;
  }
  v47[0] = v2;
  v47[1] = a1;
  unint64_t v52 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  uint64_t v16 = a1 + v52;
  uint64_t v17 = *(void *)(v12 + 72);
  swift_bridgeObjectRetain();
  v54 = (void *)MEMORY[0x1E4FBC860];
  unint64_t v18 = (void *)MEMORY[0x1E4FBC868];
  v49 = v7;
  uint64_t v50 = v8;
  uint64_t v51 = v17;
  while (1)
  {
    sub_1BEF8ADB8(v16, (uint64_t)v14, type metadata accessor for ComposeRecipient);
    sub_1BEF8ADB8((uint64_t)&v14[*(int *)(v8 + 28)], (uint64_t)v7, type metadata accessor for ComposeRecipient.Identifier);
    if (!v18[2]) {
      break;
    }
    unint64_t v20 = sub_1BEF8AF30((uint64_t)v7);
    if ((v21 & 1) == 0) {
      break;
    }
    unint64_t v22 = *(void *)(v18[7] + 8 * v20);
    uint64_t v53 = *(void *)&v14[*(int *)(v8 + 24)];
    swift_bridgeObjectRetain();
    if (swift_isUniquelyReferenced_nonNull_native())
    {
      v23 = v54;
      if ((v22 & 0x8000000000000000) != 0) {
        goto LABEL_28;
      }
    }
    else
    {
      v23 = (void *)sub_1BEF8BB0C(v54);
      if ((v22 & 0x8000000000000000) != 0)
      {
LABEL_28:
        __break(1u);
LABEL_29:
        swift_bridgeObjectRelease();
        v45 = v54;
        goto LABEL_31;
      }
    }
    if (v22 >= v23[2]) {
      goto LABEL_34;
    }
    v54 = v23;
    v24 = v11;
    uint64_t v25 = v51;
    sub_1BEF8AE20(v53);
    uint64_t v19 = v25;
    int v11 = v24;
LABEL_4:
    sub_1BEF8BAAC((uint64_t)v7, type metadata accessor for ComposeRecipient.Identifier);
    sub_1BEF8BAAC((uint64_t)v14, type metadata accessor for ComposeRecipient);
    v16 += v19;
    if (!--v15) {
      goto LABEL_29;
    }
  }
  uint64_t v53 = v15;
  uint64_t v26 = (uint64_t)v11;
  uint64_t v27 = v54[2];
  sub_1BEF8ADB8((uint64_t)v7, (uint64_t)v5, type metadata accessor for ComposeRecipient.Identifier);
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v55 = v18;
  uint64_t v29 = (uint64_t)v5;
  unint64_t v31 = sub_1BEF8AF30((uint64_t)v5);
  uint64_t v32 = v18[2];
  BOOL v33 = (v30 & 1) == 0;
  uint64_t v34 = v32 + v33;
  if (!__OFADD__(v32, v33))
  {
    char v35 = v30;
    if (v18[3] < v34)
    {
      sub_1BEF8B2A4(v34, isUniquelyReferenced_nonNull_native);
      unint64_t v36 = sub_1BEF8AF30(v29);
      if ((v35 & 1) != (v37 & 1)) {
        goto LABEL_35;
      }
      unint64_t v31 = v36;
      unint64_t v18 = v55;
      if ((v35 & 1) == 0) {
        goto LABEL_20;
      }
LABEL_18:
      *(void *)(v18[7] + 8 * v31) = v27;
      id v5 = (char *)v29;
LABEL_22:
      swift_bridgeObjectRelease();
      sub_1BEF8BAAC((uint64_t)v5, type metadata accessor for ComposeRecipient.Identifier);
      int v11 = (char *)v26;
      sub_1BEF8ADB8((uint64_t)v14, v26, type metadata accessor for ComposeRecipient);
      char v41 = swift_isUniquelyReferenced_nonNull_native();
      id v7 = v49;
      uint64_t v8 = v50;
      if (v41)
      {
        uint64_t v15 = v53;
        v42 = v54;
      }
      else
      {
        v42 = (void *)sub_1BEF8AFB4(0, v54[2] + 1, 1, v54);
        uint64_t v15 = v53;
      }
      unint64_t v44 = v42[2];
      unint64_t v43 = v42[3];
      if (v44 >= v43 >> 1) {
        v42 = (void *)sub_1BEF8AFB4(v43 > 1, v44 + 1, 1, v42);
      }
      v42[2] = v44 + 1;
      v54 = v42;
      uint64_t v19 = v51;
      sub_1BEF8BB8C((uint64_t)v11, (uint64_t)v42 + v52 + v44 * v51, type metadata accessor for ComposeRecipient);
      goto LABEL_4;
    }
    if (isUniquelyReferenced_nonNull_native)
    {
      unint64_t v18 = v55;
      if (v30) {
        goto LABEL_18;
      }
    }
    else
    {
      sub_1BEF8B830();
      unint64_t v18 = v55;
      if (v35) {
        goto LABEL_18;
      }
    }
LABEL_20:
    v18[(v31 >> 6) + 8] |= 1 << v31;
    id v5 = (char *)v29;
    sub_1BEF8ADB8(v29, v18[6] + *(void *)(v48 + 72) * v31, type metadata accessor for ComposeRecipient.Identifier);
    *(void *)(v18[7] + 8 * v31) = v27;
    uint64_t v38 = v18[2];
    BOOL v39 = __OFADD__(v38, 1);
    uint64_t v40 = v38 + 1;
    if (v39) {
      goto LABEL_33;
    }
    v18[2] = v40;
    goto LABEL_22;
  }
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  uint64_t result = sub_1BEFB29D8();
  __break(1u);
  return result;
}

uint64_t sub_1BEF8ADB8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1BEF8AE20(uint64_t result)
{
  uint64_t v2 = *(void *)(result + 16);
  uint64_t v3 = *v1;
  int64_t v4 = *(void *)(*v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v6 = result;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if (result && v5 <= *(void *)(v3 + 24) >> 1)
  {
    if (*(void *)(v6 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
  if (v4 <= v5) {
    int64_t v10 = v4 + v2;
  }
  else {
    int64_t v10 = v4;
  }
  uint64_t result = (uint64_t)sub_1BEF8B188((char *)result, v10, 1, (char *)v3);
  uint64_t v3 = result;
  if (!*(void *)(v6 + 16))
  {
LABEL_13:
    if (!v2) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }
LABEL_5:
  if ((*(void *)(v3 + 24) >> 1) - *(void *)(v3 + 16) < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t result = swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_14:
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v1 = v3;
    return result;
  }
  uint64_t v7 = *(void *)(v3 + 16);
  BOOL v8 = __OFADD__(v7, v2);
  uint64_t v9 = v7 + v2;
  if (!v8)
  {
    *(void *)(v3 + 16) = v9;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_1BEF8AF10()
{
  return MEMORY[0x1F4186488](v0, 16, 7);
}

uint64_t sub_1BEF8AF20()
{
  return swift_allocObject();
}

unint64_t sub_1BEF8AF30(uint64_t a1)
{
  type metadata accessor for ComposeRecipient.Identifier(0);
  sub_1BEF8BBF4(&qword_1EA1393F8);
  uint64_t v2 = sub_1BEFB2628();
  return sub_1BEF8B690(a1, v2);
}

size_t sub_1BEF8AFB4(size_t result, int64_t a2, char a3, void *a4)
{
  char v5 = result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v13 = (void *)MEMORY[0x1E4FBC860];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139400);
  uint64_t v10 = *(void *)(type metadata accessor for ComposeRecipient(0) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  uint64_t result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_29;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(type metadata accessor for ComposeRecipient(0) - 8);
  if (v5)
  {
    if (v13 < a4
      || (unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(void *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return (size_t)v13;
}

char *sub_1BEF8B188(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA1393E8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 48);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  unint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[48 * v8]) {
      memmove(v12, v13, 48 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1BEF8B2A4(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = type metadata accessor for ComposeRecipient.Identifier(0);
  uint64_t v39 = *(void *)(v5 - 8);
  uint64_t v40 = v5;
  MEMORY[0x1F4188790]();
  int64_t v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA1393F0);
  int v41 = a2;
  uint64_t v9 = sub_1BEFB2958();
  uint64_t v10 = v9;
  if (!*(void *)(v8 + 16)) {
    goto LABEL_41;
  }
  unint64_t v36 = v2;
  uint64_t v11 = 1 << *(unsigned char *)(v8 + 32);
  uint64_t v12 = *(void *)(v8 + 64);
  uint64_t v38 = (void *)(v8 + 64);
  if (v11 < 64) {
    uint64_t v13 = ~(-1 << v11);
  }
  else {
    uint64_t v13 = -1;
  }
  unint64_t v14 = v13 & v12;
  int64_t v37 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v15 = v9 + 64;
  uint64_t result = swift_retain();
  int64_t v17 = 0;
  while (1)
  {
    if (v14)
    {
      unint64_t v19 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v20 = v19 | (v17 << 6);
      goto LABEL_22;
    }
    int64_t v21 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v21 >= v37) {
      break;
    }
    unint64_t v22 = v38;
    unint64_t v23 = v38[v21];
    ++v17;
    if (!v23)
    {
      int64_t v17 = v21 + 1;
      if (v21 + 1 >= v37) {
        goto LABEL_34;
      }
      unint64_t v23 = v38[v17];
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v37)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v36;
          if ((v41 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v23 = v38[v24];
        if (!v23)
        {
          while (1)
          {
            int64_t v17 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_43;
            }
            if (v17 >= v37) {
              goto LABEL_34;
            }
            unint64_t v23 = v38[v17];
            ++v24;
            if (v23) {
              goto LABEL_21;
            }
          }
        }
        int64_t v17 = v24;
      }
    }
LABEL_21:
    unint64_t v14 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v17 << 6);
LABEL_22:
    uint64_t v25 = *(void *)(v39 + 72);
    uint64_t v26 = *(void *)(v8 + 48) + v25 * v20;
    if (v41) {
      sub_1BEF8BB8C(v26, (uint64_t)v7, type metadata accessor for ComposeRecipient.Identifier);
    }
    else {
      sub_1BEF8ADB8(v26, (uint64_t)v7, type metadata accessor for ComposeRecipient.Identifier);
    }
    uint64_t v27 = *(void *)(*(void *)(v8 + 56) + 8 * v20);
    sub_1BEF8BBF4(&qword_1EA1393F8);
    uint64_t result = sub_1BEFB2628();
    uint64_t v28 = -1 << *(unsigned char *)(v10 + 32);
    unint64_t v29 = result & ~v28;
    unint64_t v30 = v29 >> 6;
    if (((-1 << v29) & ~*(void *)(v15 + 8 * (v29 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v29) & ~*(void *)(v15 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v31 = 0;
      unint64_t v32 = (unint64_t)(63 - v28) >> 6;
      do
      {
        if (++v30 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v33 = v30 == v32;
        if (v30 == v32) {
          unint64_t v30 = 0;
        }
        v31 |= v33;
        uint64_t v34 = *(void *)(v15 + 8 * v30);
      }
      while (v34 == -1);
      unint64_t v18 = __clz(__rbit64(~v34)) + (v30 << 6);
    }
    *(void *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t result = sub_1BEF8BB8C((uint64_t)v7, *(void *)(v10 + 48) + v25 * v18, type metadata accessor for ComposeRecipient.Identifier);
    *(void *)(*(void *)(v10 + 56) + 8 * v18) = v27;
    ++*(void *)(v10 + 16);
  }
  swift_release();
  uint64_t v3 = v36;
  unint64_t v22 = v38;
  if ((v41 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v35 = 1 << *(unsigned char *)(v8 + 32);
  if (v35 >= 64) {
    bzero(v22, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v22 = -1 << v35;
  }
  *(void *)(v8 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v10;
  return result;
}

unint64_t sub_1BEF8B690(uint64_t a1, uint64_t a2)
{
  type metadata accessor for ComposeRecipient.Identifier(0);
  MEMORY[0x1F4188790]();
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v8 = a2 & ~v7;
  if ((*(void *)(v2 + 64 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
  {
    uint64_t v9 = ~v7;
    uint64_t v10 = *(void *)(v4 + 72);
    do
    {
      sub_1BEF8ADB8(*(void *)(v2 + 48) + v10 * v8, (uint64_t)v6, type metadata accessor for ComposeRecipient.Identifier);
      sub_1BEF8BBF4((unint64_t *)&qword_1EA139408);
      char v11 = sub_1BEFB2658();
      sub_1BEF8BAAC((uint64_t)v6, type metadata accessor for ComposeRecipient.Identifier);
      if (v11) {
        break;
      }
      unint64_t v8 = (v8 + 1) & v9;
    }
    while (((*(void *)(v2 + 64 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) != 0);
  }
  return v8;
}

void *sub_1BEF8B830()
{
  uint64_t v1 = v0;
  uint64_t v25 = *(void *)(type metadata accessor for ComposeRecipient.Identifier(0) - 8);
  MEMORY[0x1F4188790]();
  uint64_t v3 = (char *)&v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA1393F0);
  uint64_t v4 = *v0;
  uint64_t v5 = sub_1BEFB2948();
  uint64_t v6 = v5;
  if (!*(void *)(v4 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_25:
    *uint64_t v1 = v6;
    return result;
  }
  unint64_t v23 = v1;
  uint64_t result = (void *)(v5 + 64);
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v6 + 32)) + 63) >> 6;
  if (v6 != v4 || (unint64_t)result >= v4 + 64 + 8 * v8) {
    uint64_t result = memmove(result, (const void *)(v4 + 64), 8 * v8);
  }
  uint64_t v24 = v4 + 64;
  int64_t v9 = 0;
  *(void *)(v6 + 16) = *(void *)(v4 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v4 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v4 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_9;
    }
    int64_t v19 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v19 >= v13) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v19);
    ++v9;
    if (!v20)
    {
      int64_t v9 = v19 + 1;
      if (v19 + 1 >= v13) {
        goto LABEL_23;
      }
      unint64_t v20 = *(void *)(v24 + 8 * v9);
      if (!v20) {
        break;
      }
    }
LABEL_22:
    unint64_t v12 = (v20 - 1) & v20;
    unint64_t v15 = __clz(__rbit64(v20)) + (v9 << 6);
LABEL_9:
    unint64_t v16 = *(void *)(v25 + 72) * v15;
    sub_1BEF8ADB8(*(void *)(v4 + 48) + v16, (uint64_t)v3, type metadata accessor for ComposeRecipient.Identifier);
    uint64_t v17 = 8 * v15;
    uint64_t v18 = *(void *)(*(void *)(v4 + 56) + v17);
    uint64_t result = (void *)sub_1BEF8BB8C((uint64_t)v3, *(void *)(v6 + 48) + v16, type metadata accessor for ComposeRecipient.Identifier);
    *(void *)(*(void *)(v6 + 56) + v17) = v18;
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v13)
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v23;
    goto LABEL_25;
  }
  unint64_t v20 = *(void *)(v24 + 8 * v21);
  if (v20)
  {
    int64_t v9 = v21;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v9 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v9);
    ++v21;
    if (v20) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_1BEF8BAAC(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

size_t sub_1BEF8BB0C(void *a1)
{
  return sub_1BEF8AFB4(0, a1[2], 0, a1);
}

uint64_t type metadata accessor for CombinesRecipients()
{
  return self;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1BEF8BB8C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1BEF8BBF4(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for ComposeRecipient.Identifier(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t ComposeRecipient.Source.rawValue.getter()
{
  return *(void *)v0;
}

uint64_t ComposeRecipient.Source.init(rawValue:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

void static ComposeRecipient.Source.unknown.getter(void *a1@<X8>)
{
  *a1 = 0;
}

void static ComposeRecipient.Source.recent.getter(void *a1@<X8>)
{
  *a1 = 1;
}

void static ComposeRecipient.Source.contact.getter(void *a1@<X8>)
{
  *a1 = 2;
}

void static ComposeRecipient.Source.suggestion.getter(void *a1@<X8>)
{
  *a1 = 4;
}

void static ComposeRecipient.Source.directoryServer.getter(void *a1@<X8>)
{
  *a1 = 8;
}

void static ComposeRecipient.Source.prediction.getter(void *a1@<X8>)
{
  *a1 = 16;
}

void static ComposeRecipient.Source.supplemental.getter(void *a1@<X8>)
{
  *a1 = 32;
}

void static ComposeRecipient.Source.calendarServer.getter(void *a1@<X8>)
{
  *a1 = 64;
}

void static ComposeRecipient.Source.managedAppleID.getter(void *a1@<X8>)
{
  *a1 = 128;
}

void static ComposeRecipient.Source.extension.getter(void *a1@<X8>)
{
  *a1 = 256;
}

void static ComposeRecipient.Source.emergencyServices.getter(void *a1@<X8>)
{
  *a1 = 512;
}

void *sub_1BEF8BCC8@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_1BEF8BCD4(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_1BEF8BCDC@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_1BEF8BCF0@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_1BEF8BD04@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_1BEF8BD18(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_1BEF8BD48@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_1BEF8BD74@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_1BEF8BD98(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_1BEF8BDAC(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_1BEF8BDC0(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_1BEF8BDD4@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_1BEF8BDE8(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_1BEF8BDFC(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_1BEF8BE10(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_1BEF8BE24()
{
  return *v0 == 0;
}

uint64_t sub_1BEF8BE34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x1F4184B08](a1, a4, a2, a5, a3);
}

void *sub_1BEF8BE4C(void *result)
{
  *v1 &= ~*result;
  return result;
}

void *sub_1BEF8BE60@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_1BEF8BE70(void *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_1BEF8BE7C(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1BEF8BE94@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = 0;
    uint64_t v5 = (uint64_t *)(a1 + 32);
    do
    {
      uint64_t v7 = *v5++;
      uint64_t v6 = v7;
      if ((v7 & ~v4) == 0) {
        uint64_t v6 = 0;
      }
      v4 |= v6;
      --v3;
    }
    while (v3);
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v4;
  return result;
}

uint64_t ComposeRecipient.Source.description.getter()
{
  uint64_t v1 = *v0;
  if ((*v0 & 1) == 0)
  {
    uint64_t v2 = (char *)MEMORY[0x1E4FBC860];
    if ((v1 & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_7;
  }
  uint64_t v2 = sub_1BEF8C5C0(0, 1, 1, MEMORY[0x1E4FBC860]);
  unint64_t v4 = *((void *)v2 + 2);
  unint64_t v3 = *((void *)v2 + 3);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1BEF8C5C0((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v4 + 1;
  uint64_t v5 = &v2[16 * v4];
  *((void *)v5 + 4) = 0x746E656365722ELL;
  *((void *)v5 + 5) = 0xE700000000000000;
  if ((v1 & 2) != 0)
  {
LABEL_7:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v2 = sub_1BEF8C5C0(0, *((void *)v2 + 2) + 1, 1, v2);
    }
    unint64_t v7 = *((void *)v2 + 2);
    unint64_t v6 = *((void *)v2 + 3);
    if (v7 >= v6 >> 1) {
      uint64_t v2 = sub_1BEF8C5C0((char *)(v6 > 1), v7 + 1, 1, v2);
    }
    *((void *)v2 + 2) = v7 + 1;
    unint64_t v8 = &v2[16 * v7];
    *((void *)v8 + 4) = 0x746361746E6F632ELL;
    *((void *)v8 + 5) = 0xE800000000000000;
  }
LABEL_12:
  if ((v1 & 4) != 0)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v2 = sub_1BEF8C5C0(0, *((void *)v2 + 2) + 1, 1, v2);
    }
    unint64_t v10 = *((void *)v2 + 2);
    unint64_t v9 = *((void *)v2 + 3);
    if (v10 >= v9 >> 1) {
      uint64_t v2 = sub_1BEF8C5C0((char *)(v9 > 1), v10 + 1, 1, v2);
    }
    *((void *)v2 + 2) = v10 + 1;
    uint64_t v11 = &v2[16 * v10];
    *((void *)v11 + 4) = 0x747365676775732ELL;
    *((void *)v11 + 5) = 0xEB000000006E6F69;
  }
  if ((v1 & 8) != 0)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v2 = sub_1BEF8C5C0(0, *((void *)v2 + 2) + 1, 1, v2);
    }
    unint64_t v14 = *((void *)v2 + 2);
    unint64_t v13 = *((void *)v2 + 3);
    if (v14 >= v13 >> 1) {
      uint64_t v2 = sub_1BEF8C5C0((char *)(v13 > 1), v14 + 1, 1, v2);
    }
    *((void *)v2 + 2) = v14 + 1;
    unint64_t v15 = &v2[16 * v14];
    *((void *)v15 + 4) = 0xD000000000000010;
    *((void *)v15 + 5) = 0x80000001BEFBF7B0;
    if ((v1 & 0x10) == 0)
    {
LABEL_20:
      if ((v1 & 0x20) == 0) {
        goto LABEL_21;
      }
      goto LABEL_37;
    }
  }
  else if ((v1 & 0x10) == 0)
  {
    goto LABEL_20;
  }
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1BEF8C5C0(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v17 = *((void *)v2 + 2);
  unint64_t v16 = *((void *)v2 + 3);
  if (v17 >= v16 >> 1) {
    uint64_t v2 = sub_1BEF8C5C0((char *)(v16 > 1), v17 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v17 + 1;
  uint64_t v18 = &v2[16 * v17];
  *((void *)v18 + 4) = 0x746369646572702ELL;
  *((void *)v18 + 5) = 0xEB000000006E6F69;
  if ((v1 & 0x20) == 0)
  {
LABEL_21:
    if ((v1 & 0x40) == 0) {
      goto LABEL_22;
    }
    goto LABEL_42;
  }
LABEL_37:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1BEF8C5C0(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v20 = *((void *)v2 + 2);
  unint64_t v19 = *((void *)v2 + 3);
  if (v20 >= v19 >> 1) {
    uint64_t v2 = sub_1BEF8C5C0((char *)(v19 > 1), v20 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v20 + 1;
  int64_t v21 = &v2[16 * v20];
  strcpy(v21 + 32, ".supplemental");
  *((_WORD *)v21 + 23) = -4864;
  if ((v1 & 0x40) == 0)
  {
LABEL_22:
    if ((v1 & 0x80) == 0) {
      goto LABEL_23;
    }
    goto LABEL_47;
  }
LABEL_42:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1BEF8C5C0(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v23 = *((void *)v2 + 2);
  unint64_t v22 = *((void *)v2 + 3);
  if (v23 >= v22 >> 1) {
    uint64_t v2 = sub_1BEF8C5C0((char *)(v22 > 1), v23 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v23 + 1;
  uint64_t v24 = &v2[16 * v23];
  *((void *)v24 + 4) = 0x61646E656C61632ELL;
  *((void *)v24 + 5) = 0xEF72657672655372;
  if ((v1 & 0x80) == 0)
  {
LABEL_23:
    if ((v1 & 0x100) == 0) {
      goto LABEL_24;
    }
    goto LABEL_52;
  }
LABEL_47:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1BEF8C5C0(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v26 = *((void *)v2 + 2);
  unint64_t v25 = *((void *)v2 + 3);
  if (v26 >= v25 >> 1) {
    uint64_t v2 = sub_1BEF8C5C0((char *)(v25 > 1), v26 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v26 + 1;
  uint64_t v27 = &v2[16 * v26];
  *((void *)v27 + 4) = 0x646567616E616D2ELL;
  *((void *)v27 + 5) = 0xEF4449656C707041;
  if ((v1 & 0x100) == 0)
  {
LABEL_24:
    if ((v1 & 0x200) == 0) {
      goto LABEL_25;
    }
LABEL_57:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v2 = sub_1BEF8C5C0(0, *((void *)v2 + 2) + 1, 1, v2);
    }
    unint64_t v32 = *((void *)v2 + 2);
    unint64_t v31 = *((void *)v2 + 3);
    if (v32 >= v31 >> 1) {
      uint64_t v2 = sub_1BEF8C5C0((char *)(v31 > 1), v32 + 1, 1, v2);
    }
    *((void *)v2 + 2) = v32 + 1;
    BOOL v33 = &v2[16 * v32];
    *((void *)v33 + 4) = 0xD000000000000012;
    *((void *)v33 + 5) = 0x80000001BEFBF790;
    goto LABEL_62;
  }
LABEL_52:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1BEF8C5C0(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v29 = *((void *)v2 + 2);
  unint64_t v28 = *((void *)v2 + 3);
  if (v29 >= v28 >> 1) {
    uint64_t v2 = sub_1BEF8C5C0((char *)(v28 > 1), v29 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v29 + 1;
  unint64_t v30 = &v2[16 * v29];
  *((void *)v30 + 4) = 0x69736E657478652ELL;
  *((void *)v30 + 5) = 0xEA00000000006E6FLL;
  if ((v1 & 0x200) != 0) {
    goto LABEL_57;
  }
LABEL_25:
  if (!*((void *)v2 + 2))
  {
    swift_bridgeObjectRelease();
    return 23899;
  }
LABEL_62:
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA139D20);
  sub_1BEF8C518();
  sub_1BEFB2648();
  swift_bridgeObjectRelease();
  sub_1BEFB26D8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1BEFB26D8();
  swift_bridgeObjectRelease();
  return 8283;
}

unint64_t sub_1BEF8C518()
{
  unint64_t result = qword_1EA139410;
  if (!qword_1EA139410)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_1EA139D20);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA139410);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

char *sub_1BEF8C5C0(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139E90);
    unint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    unint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  unint64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

unint64_t sub_1BEF8C6C8()
{
  unint64_t result = qword_1EA139418;
  if (!qword_1EA139418)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA139418);
  }
  return result;
}

unint64_t sub_1BEF8C720()
{
  unint64_t result = qword_1EA139420;
  if (!qword_1EA139420)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA139420);
  }
  return result;
}

unint64_t sub_1BEF8C778()
{
  unint64_t result = qword_1EA139428;
  if (!qword_1EA139428)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA139428);
  }
  return result;
}

unint64_t sub_1BEF8C7D0()
{
  unint64_t result = qword_1EA139430;
  if (!qword_1EA139430)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA139430);
  }
  return result;
}

ValueMetadata *type metadata accessor for ComposeRecipient.Source()
{
  return &type metadata for ComposeRecipient.Source;
}

uint64_t ComposeRecipient.id.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1BEFB2308();
  unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t ComposeRecipient.name.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for ComposeRecipient(0) + 20));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t type metadata accessor for ComposeRecipient(uint64_t a1)
{
  return sub_1BEF8CABC(a1, (uint64_t *)&unk_1EA13A4B0);
}

uint64_t ComposeRecipient.name.setter(uint64_t a1, uint64_t a2)
{
  char v5 = (void *)(v2 + *(int *)(type metadata accessor for ComposeRecipient(0) + 20));
  uint64_t result = swift_bridgeObjectRelease();
  void *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*ComposeRecipient.name.modify())()
{
  return nullsub_1;
}

uint64_t ComposeRecipient.handles.getter()
{
  type metadata accessor for ComposeRecipient(0);
  return swift_bridgeObjectRetain();
}

uint64_t ComposeRecipient.handles.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for ComposeRecipient(0) + 24);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v3) = a1;
  return result;
}

uint64_t (*ComposeRecipient.handles.modify())()
{
  return nullsub_1;
}

uint64_t ComposeRecipient.contactIdentifier.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for ComposeRecipient(0);
  return sub_1BEF8F53C(v1 + *(int *)(v3 + 28), a1, type metadata accessor for ComposeRecipient.Identifier);
}

uint64_t type metadata accessor for ComposeRecipient.Identifier(uint64_t a1)
{
  return sub_1BEF8CABC(a1, (uint64_t *)&unk_1EA13A4C0);
}

uint64_t sub_1BEF8CABC(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t ComposeRecipient.contactIdentifier.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ComposeRecipient(0) + 28);
  return sub_1BEF8CB38(a1, v3);
}

uint64_t sub_1BEF8CB38(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ComposeRecipient.Identifier(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*ComposeRecipient.contactIdentifier.modify())()
{
  return nullsub_1;
}

uint64_t ComposeRecipient.source.getter@<X0>(void *a1@<X8>)
{
  uint64_t result = type metadata accessor for ComposeRecipient(0);
  *a1 = *(void *)(v1 + *(int *)(result + 32));
  return result;
}

uint64_t ComposeRecipient.source.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t result = type metadata accessor for ComposeRecipient(0);
  *(void *)(v1 + *(int *)(result + 32)) = v2;
  return result;
}

uint64_t (*ComposeRecipient.source.modify())()
{
  return nullsub_1;
}

uint64_t ComposeRecipient.init(id:name:handles:contactIdentifier:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  sub_1BEFB22F8();
  uint64_t v12 = (int *)type metadata accessor for ComposeRecipient(0);
  unint64_t v13 = (void *)(a6 + v12[5]);
  void *v13 = a2;
  v13[1] = a3;
  *(void *)(a6 + v12[6]) = a4;
  sub_1BEF8F53C(a5, a6 + v12[7], type metadata accessor for ComposeRecipient.Identifier);
  sub_1BEF8CDA4();
  sub_1BEFB2A58();
  sub_1BEF8BAAC(a5, type metadata accessor for ComposeRecipient.Identifier);
  uint64_t v14 = sub_1BEFB2308();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(a1, v14);
  *(void *)(a6 + v12[8]) = v16;
  return result;
}

unint64_t sub_1BEF8CDA4()
{
  unint64_t result = qword_1EA139438;
  if (!qword_1EA139438)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA139438);
  }
  return result;
}

uint64_t sub_1BEF8CDF8()
{
  return sub_1BEFB22F8();
}

uint64_t ComposeRecipient.init(id:name:handles:contactIdentifier:source:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v13 = *a6;
  sub_1BEFB22F8();
  uint64_t v14 = sub_1BEFB2308();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(a1, v14);
  unint64_t v15 = (int *)type metadata accessor for ComposeRecipient(0);
  uint64_t v16 = (void *)(a7 + v15[5]);
  *uint64_t v16 = a2;
  v16[1] = a3;
  *(void *)(a7 + v15[6]) = a4;
  uint64_t result = sub_1BEF8CED4(a5, a7 + v15[7]);
  *(void *)(a7 + v15[8]) = v13;
  return result;
}

uint64_t sub_1BEF8CED4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ComposeRecipient.Identifier(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

double ComposeRecipient.handle.getter@<D0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + *(int *)(type metadata accessor for ComposeRecipient(0) + 24));
  if (*(void *)(v3 + 16))
  {
    uint64_t v4 = *(void *)(v3 + 32);
    uint64_t v5 = *(void *)(v3 + 40);
    uint64_t v6 = *(void *)(v3 + 56);
    unint64_t v7 = *(void *)(v3 + 64);
    uint64_t v8 = *(void *)(v3 + 72);
    *(void *)a1 = v4;
    *(void *)(a1 + 8) = v5;
    unsigned __int8 v9 = *(unsigned char *)(v3 + 48);
    *(unsigned char *)(a1 + 16) = v9;
    *(void *)(a1 + 24) = v6;
    *(void *)(a1 + 32) = v7;
    *(void *)(a1 + 40) = v8;
    sub_1BEF8CFD8(v4, v5, v9);
    sub_1BEF8CFF0(v6, v7);
    swift_bridgeObjectRetain();
  }
  else
  {
    double result = 0.0;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)a1 = 0u;
  }
  return result;
}

uint64_t sub_1BEF8CFD8(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 2u) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_1BEF8CFF0(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xD) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t ComposeRecipient.aliases.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for ComposeRecipient(0) + 24));
  uint64_t v2 = *(void *)(v1 + 16);
  sub_1BEFB29C8();
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain_n();
  uint64_t v3 = swift_dynamicCastClass();
  if (!v3)
  {
    swift_bridgeObjectRelease();
    uint64_t v3 = MEMORY[0x1E4FBC860];
  }
  uint64_t v4 = *(void *)(v3 + 16);
  swift_release();
  if (v4 == v2 - (v2 != 0))
  {
    uint64_t v5 = swift_dynamicCastClass();
    if (!v5)
    {
      swift_bridgeObjectRelease();
      uint64_t v5 = MEMORY[0x1E4FBC860];
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v5 = sub_1BEF8DB88(v1, v1 + 32, v2 != 0, (2 * v2) | 1);
  }
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1BEF8D0F4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1BEFB2308();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

void sub_1BEF8D15C(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = type metadata accessor for ComposeRecipient.Identifier(0);
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (uint64_t *)((char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = sub_1BEFB25A8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BEFB22F8();
  uint64_t v13 = sub_1BEFB0284();
  uint64_t v43 = v10;
  uint64_t v44 = v9;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v13, v9);
  os_log_type_t v14 = sub_1BEFB27B8();
  unint64_t v15 = a1;
  uint64_t v16 = sub_1BEFB2588();
  BOOL v17 = os_log_type_enabled(v16, v14);
  uint64_t v40 = v8;
  uint64_t v41 = v6;
  uint64_t v42 = a2;
  if (v17)
  {
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    uint64_t v39 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v18 = 138477827;
    v45 = v15;
    unint64_t v19 = v15;
    sub_1BEFB2828();
    unint64_t v20 = v39;
    *uint64_t v39 = v15;

    _os_log_impl(&dword_1BEF57000, v16, v14, "Converting result for %{private}@", v18, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139440);
    swift_arrayDestroy();
    MEMORY[0x1C18A1630](v20, -1, -1);
    MEMORY[0x1C18A1630](v18, -1, -1);
  }
  else
  {

    uint64_t v16 = v15;
  }
  int64_t v21 = v15;

  (*(void (**)(char *, uint64_t))(v43 + 8))(v12, v44);
  id v22 = [v15 displayName];
  if (v22)
  {
    unint64_t v23 = v22;
    uint64_t v24 = sub_1BEFB2698();
    unint64_t v26 = v25;
  }
  else
  {
    uint64_t v24 = 0;
    unint64_t v26 = 0xE000000000000000;
  }
  uint64_t v27 = (uint64_t *)(a3 + *(int *)(type metadata accessor for ComposeRecipient(0) + 20));
  *uint64_t v27 = v24;
  v27[1] = v26;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA1393E8);
  uint64_t v28 = swift_allocObject();
  *(_OWORD *)(v28 + 16) = xmmword_1BEFB7570;
  id v29 = [v15 value];
  if (v29)
  {
    ComposeRecipient.Handle.init(autocompleteValue:availability:)(v29, v42, v28 + 32);
    unint64_t v30 = (int *)type metadata accessor for ComposeRecipient(0);
    *(void *)(a3 + v30[6]) = v28;
    id v31 = [v15 identifier];
    if (v31)
    {
      unint64_t v32 = v31;
      uint64_t v33 = sub_1BEFB2698();
      uint64_t v35 = v34;

      uint64_t v36 = (uint64_t)v40;
      *uint64_t v40 = v33;
      *(void *)(v36 + 8) = v35;
    }
    else
    {
      uint64_t v36 = (uint64_t)v40;
      sub_1BEFB22F8();
    }
    swift_storeEnumTagMultiPayload();
    sub_1BEF8CED4(v36, a3 + v30[7]);
    uint64_t v37 = (uint64_t)[v21 sourceType];
    if ((v37 & 0x8000000000000000) == 0)
    {
      ComposeRecipient.Source.init(rawValue:)(v37, &v45);

      *(void *)(a3 + v30[8]) = v45;
      return;
    }
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_1BEF8D534(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 == *(void *)(a2 + 16))
  {
    if (!v2 || a1 == a2)
    {
      char v5 = 1;
    }
    else
    {
      sub_1BEF8F5A4();
      uint64_t v3 = 0;
      uint64_t v4 = v2 - 1;
      do
      {
        char v5 = sub_1BEFB2658();
        BOOL v7 = v4-- != 0;
        if ((v5 & 1) == 0) {
          break;
        }
        v3 += 48;
      }
      while (v7);
    }
  }
  else
  {
    char v5 = 0;
  }
  return v5 & 1;
}

uint64_t ComposeRecipient.Identifier.hash(into:)()
{
  uint64_t v1 = type metadata accessor for ComposeRecipient.Identifier(0);
  MEMORY[0x1F4188790](v1);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BEF8F53C(v0, (uint64_t)v3, type metadata accessor for ComposeRecipient.Identifier);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_1BEFB2308();
    uint64_t v5 = *(void *)(v4 - 8);
    MEMORY[0x1F4188790](v4);
    BOOL v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v3, v4);
    sub_1BEFB2A38();
    sub_1BEF8E300();
    sub_1BEFB2638();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  else
  {
    sub_1BEFB2A38();
    sub_1BEFB26C8();
    return swift_bridgeObjectRelease();
  }
}

uint64_t ComposeRecipient.Identifier.hashValue.getter()
{
  uint64_t v1 = type metadata accessor for ComposeRecipient.Identifier(0);
  MEMORY[0x1F4188790](v1);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BEFB2A28();
  sub_1BEF8F53C(v0, (uint64_t)v3, type metadata accessor for ComposeRecipient.Identifier);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_1BEFB2308();
    uint64_t v5 = *(void *)(v4 - 8);
    MEMORY[0x1F4188790](v4);
    BOOL v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v3, v4);
    sub_1BEFB2A38();
    sub_1BEF8E300();
    sub_1BEFB2638();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  else
  {
    sub_1BEFB2A38();
    sub_1BEFB26C8();
    swift_bridgeObjectRelease();
  }
  return sub_1BEFB2A48();
}

uint64_t sub_1BEF8D9C0(uint64_t a1)
{
  MEMORY[0x1F4188790](a1);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BEFB2A28();
  sub_1BEF8F53C(v1, (uint64_t)v3, type metadata accessor for ComposeRecipient.Identifier);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_1BEFB2308();
    uint64_t v5 = *(void *)(v4 - 8);
    MEMORY[0x1F4188790](v4);
    BOOL v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v3, v4);
    sub_1BEFB2A38();
    sub_1BEF8E300();
    sub_1BEFB2638();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  else
  {
    sub_1BEFB2A38();
    sub_1BEFB26C8();
    swift_bridgeObjectRelease();
  }
  return sub_1BEFB2A48();
}

uint64_t sub_1BEF8DB88(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (!__OFSUB__(a4 >> 1, a3))
  {
    if (!v5) {
      return MEMORY[0x1E4FBC860];
    }
    if (v5 <= 0)
    {
      uint64_t v8 = (void *)MEMORY[0x1E4FBC860];
      if (v4 != a3)
      {
LABEL_5:
        if (v5 < 0) {
          goto LABEL_17;
        }
        unint64_t v10 = a2 + 48 * a3;
        if (v10 < (unint64_t)&v8[6 * v5 + 4] && (unint64_t)(v8 + 4) < v10 + 48 * v5) {
          goto LABEL_17;
        }
        swift_arrayInitWithCopy();
        return (uint64_t)v8;
      }
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA1393E8);
      uint64_t v8 = (void *)swift_allocObject();
      size_t v9 = _swift_stdlib_malloc_size(v8);
      v8[2] = v5;
      v8[3] = 2 * ((uint64_t)(v9 - 32) / 48);
      if (v4 != a3) {
        goto LABEL_5;
      }
    }
    __break(1u);
  }
  __break(1u);
LABEL_17:
  uint64_t result = sub_1BEFB2978();
  __break(1u);
  return result;
}

uint64_t _s20ContactsAutocomplete16ComposeRecipientV10IdentifierO2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ComposeRecipient.Identifier(0);
  uint64_t v5 = MEMORY[0x1F4188790](v4);
  BOOL v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  size_t v9 = (uint64_t *)((char *)&v30 - v8);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139450);
  uint64_t v11 = MEMORY[0x1F4188790](v10 - 8);
  uint64_t v13 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  os_log_type_t v14 = &v13[*(int *)(v11 + 56)];
  sub_1BEF8F53C(a1, (uint64_t)v13, type metadata accessor for ComposeRecipient.Identifier);
  sub_1BEF8F53C(a2, (uint64_t)v14, type metadata accessor for ComposeRecipient.Identifier);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    sub_1BEF8F53C((uint64_t)v13, (uint64_t)v9, type metadata accessor for ComposeRecipient.Identifier);
    uint64_t v24 = *v9;
    uint64_t v23 = v9[1];
    if (swift_getEnumCaseMultiPayload() != 1)
    {
      uint64_t v25 = *(void *)v14;
      uint64_t v26 = *((void *)v14 + 1);
      if (v24 == v25 && v23 == v26)
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        char v28 = sub_1BEFB29B8();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v28 & 1) == 0)
        {
          sub_1BEF8BAAC((uint64_t)v13, type metadata accessor for ComposeRecipient.Identifier);
          goto LABEL_8;
        }
      }
      sub_1BEF8BAAC((uint64_t)v13, type metadata accessor for ComposeRecipient.Identifier);
      char v21 = 1;
      return v21 & 1;
    }
    swift_bridgeObjectRelease();
LABEL_7:
    sub_1BEF8F4DC((uint64_t)v13);
LABEL_8:
    char v21 = 0;
    return v21 & 1;
  }
  sub_1BEF8F53C((uint64_t)v13, (uint64_t)v7, type metadata accessor for ComposeRecipient.Identifier);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  uint64_t v16 = sub_1BEFB2308();
  uint64_t v17 = v16;
  uint64_t v18 = *(void *)(v16 - 8);
  if (EnumCaseMultiPayload != 1)
  {
    (*(void (**)(char *, uint64_t))(*(void *)(v16 - 8) + 8))(v7, v16);
    goto LABEL_7;
  }
  MEMORY[0x1F4188790](v16);
  unint64_t v20 = (char *)&v30 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v20, v14, v17);
  char v21 = sub_1BEFB22E8();
  id v22 = *(void (**)(char *, uint64_t))(v18 + 8);
  v22(v20, v17);
  v22(v7, v17);
  sub_1BEF8BAAC((uint64_t)v13, type metadata accessor for ComposeRecipient.Identifier);
  return v21 & 1;
}

uint64_t _s20ContactsAutocomplete16ComposeRecipientV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ComposeRecipient(0);
  uint64_t v5 = MEMORY[0x1F4188790](v4);
  BOOL v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x1F4188790](v5);
  uint64_t v10 = (char *)&v26 - v9;
  uint64_t v11 = MEMORY[0x1F4188790](v8);
  uint64_t v13 = (char *)&v26 - v12;
  uint64_t v14 = MEMORY[0x1F4188790](v11);
  uint64_t v16 = (char *)&v26 - v15;
  uint64_t v17 = *(int *)(v14 + 20);
  uint64_t v18 = *(void *)(a1 + v17);
  uint64_t v19 = *(void *)(a1 + v17 + 8);
  unint64_t v20 = (void *)(a2 + v17);
  if (v18 == *v20 && v19 == v20[1])
  {
    sub_1BEF8F53C(a1, (uint64_t)&v26 - v15, type metadata accessor for ComposeRecipient);
    sub_1BEF8F53C(a2, (uint64_t)v13, type metadata accessor for ComposeRecipient);
  }
  else
  {
    char v22 = sub_1BEFB29B8();
    sub_1BEF8F53C(a1, (uint64_t)v16, type metadata accessor for ComposeRecipient);
    sub_1BEF8F53C(a2, (uint64_t)v13, type metadata accessor for ComposeRecipient);
    if ((v22 & 1) == 0)
    {
      sub_1BEF8BAAC((uint64_t)v16, type metadata accessor for ComposeRecipient);
      sub_1BEF8BAAC((uint64_t)v13, type metadata accessor for ComposeRecipient);
      sub_1BEF8F53C(a1, (uint64_t)v10, type metadata accessor for ComposeRecipient);
      sub_1BEF8F53C(a2, (uint64_t)v7, type metadata accessor for ComposeRecipient);
LABEL_10:
      char v24 = 0;
      goto LABEL_11;
    }
  }
  char v23 = sub_1BEF8D534(*(void *)&v16[*(int *)(v4 + 24)], *(void *)&v13[*(int *)(v4 + 24)]);
  sub_1BEF8BAAC((uint64_t)v16, type metadata accessor for ComposeRecipient);
  sub_1BEF8BAAC((uint64_t)v13, type metadata accessor for ComposeRecipient);
  sub_1BEF8F53C(a1, (uint64_t)v10, type metadata accessor for ComposeRecipient);
  sub_1BEF8F53C(a2, (uint64_t)v7, type metadata accessor for ComposeRecipient);
  if ((v23 & 1) == 0) {
    goto LABEL_10;
  }
  char v24 = _s20ContactsAutocomplete16ComposeRecipientV10IdentifierO2eeoiySbAE_AEtFZ_0((uint64_t)&v10[*(int *)(v4 + 28)], (uint64_t)&v7[*(int *)(v4 + 28)]);
LABEL_11:
  sub_1BEF8BAAC((uint64_t)v7, type metadata accessor for ComposeRecipient);
  sub_1BEF8BAAC((uint64_t)v10, type metadata accessor for ComposeRecipient);
  return v24 & 1;
}

unint64_t sub_1BEF8E300()
{
  unint64_t result = qword_1EA139448;
  if (!qword_1EA139448)
  {
    sub_1BEFB2308();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA139448);
  }
  return result;
}

unint64_t sub_1BEF8E354()
{
  unint64_t result = qword_1EA139408;
  if (!qword_1EA139408)
  {
    type metadata accessor for ComposeRecipient.Identifier(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA139408);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for ComposeRecipient(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v18 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1BEFB2308();
    uint64_t v8 = (void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16);
    char v21 = *v8;
    (*v8)(a1, a2, v7);
    uint64_t v9 = a3[5];
    uint64_t v10 = a3[6];
    uint64_t v11 = (uint64_t *)((char *)a1 + v9);
    uint64_t v12 = (uint64_t *)((char *)a2 + v9);
    uint64_t v13 = v12[1];
    uint64_t v14 = *(uint64_t *)((char *)a2 + v10);
    void *v11 = *v12;
    v11[1] = v13;
    *(uint64_t *)((char *)a1 + v10) = v14;
    uint64_t v15 = a3[7];
    uint64_t v16 = (uint64_t *)((char *)a1 + v15);
    uint64_t v17 = (uint64_t *)((char *)a2 + v15);
    type metadata accessor for ComposeRecipient.Identifier(0);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v21(v16, v17, v7);
    }
    else
    {
      uint64_t v19 = v17[1];
      *uint64_t v16 = *v17;
      v16[1] = v19;
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
    *(uint64_t *)((char *)a1 + a3[8]) = *(uint64_t *)((char *)a2 + a3[8]);
  }
  return a1;
}

uint64_t destroy for ComposeRecipient(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1BEFB2308();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v7(a1, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v5 = a1 + *(int *)(a2 + 28);
  type metadata accessor for ComposeRecipient.Identifier(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    return ((uint64_t (*)(uint64_t, uint64_t))v7)(v5, v4);
  }
  else
  {
    return swift_bridgeObjectRelease();
  }
}

uint64_t initializeWithCopy for ComposeRecipient(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1BEFB2308();
  uint64_t v7 = (void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  uint64_t v19 = *v7;
  (*v7)(a1, a2, v6);
  uint64_t v8 = a3[5];
  uint64_t v9 = a3[6];
  uint64_t v10 = (void *)(a1 + v8);
  uint64_t v11 = (void *)(a2 + v8);
  uint64_t v12 = v11[1];
  uint64_t v13 = *(void *)(a2 + v9);
  *uint64_t v10 = *v11;
  v10[1] = v12;
  *(void *)(a1 + v9) = v13;
  uint64_t v14 = a3[7];
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (void *)(a2 + v14);
  type metadata accessor for ComposeRecipient.Identifier(0);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v19((uint64_t)v15, (uint64_t)v16, v6);
  }
  else
  {
    uint64_t v17 = v16[1];
    *uint64_t v15 = *v16;
    v15[1] = v17;
    swift_bridgeObjectRetain();
  }
  swift_storeEnumTagMultiPayload();
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  return a1;
}

uint64_t assignWithCopy for ComposeRecipient(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1BEFB2308();
  uint64_t v7 = *(void *)(v6 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 24))(a1, a2, v6);
  uint64_t v8 = a3[5];
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (void *)(a2 + v8);
  void *v9 = *v10;
  v9[1] = v10[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    uint64_t v11 = a3[7];
    uint64_t v12 = (void *)(a1 + v11);
    uint64_t v13 = (void *)(a2 + v11);
    sub_1BEF8BAAC(a1 + v11, type metadata accessor for ComposeRecipient.Identifier);
    type metadata accessor for ComposeRecipient.Identifier(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 16))(v12, v13, v6);
    }
    else
    {
      void *v12 = *v13;
      v12[1] = v13[1];
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  return a1;
}

char *initializeWithTake for ComposeRecipient(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_1BEFB2308();
  uint64_t v7 = *(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  uint64_t v8 = a3[6];
  *(_OWORD *)&a1[a3[5]] = *(_OWORD *)&a2[a3[5]];
  *(void *)&a1[v8] = *(void *)&a2[v8];
  uint64_t v9 = a3[7];
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  uint64_t v12 = type metadata accessor for ComposeRecipient.Identifier(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7(v10, v11, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v10, v11, *(void *)(*(void *)(v12 - 8) + 64));
  }
  *(void *)&a1[a3[8]] = *(void *)&a2[a3[8]];
  return a1;
}

uint64_t assignWithTake for ComposeRecipient(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1BEFB2308();
  uint64_t v7 = *(void *)(v6 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 40))(a1, a2, v6);
  uint64_t v8 = a3[5];
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (uint64_t *)(a2 + v8);
  uint64_t v12 = *v10;
  uint64_t v11 = v10[1];
  void *v9 = v12;
  v9[1] = v11;
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    uint64_t v13 = a3[7];
    uint64_t v14 = (void *)(a1 + v13);
    uint64_t v15 = (const void *)(a2 + v13);
    sub_1BEF8BAAC(a1 + v13, type metadata accessor for ComposeRecipient.Identifier);
    uint64_t v16 = type metadata accessor for ComposeRecipient.Identifier(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      (*(void (**)(void *, const void *, uint64_t))(v7 + 32))(v14, v15, v6);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64));
    }
  }
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  return a1;
}

uint64_t getEnumTagSinglePayload for ComposeRecipient(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1BEF8EBD4);
}

uint64_t sub_1BEF8EBD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1BEFB2308();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else if (a2 == 0x7FFFFFFF)
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
  else
  {
    uint64_t v11 = type metadata accessor for ComposeRecipient.Identifier(0);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a3 + 28);
    return v12(v14, a2, v13);
  }
}

uint64_t storeEnumTagSinglePayload for ComposeRecipient(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1BEF8ED18);
}

uint64_t sub_1BEF8ED18(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_1BEFB2308();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v11 = type metadata accessor for ComposeRecipient.Identifier(0);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 28);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

uint64_t sub_1BEF8EE48()
{
  uint64_t result = sub_1BEFB2308();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for ComposeRecipient.Identifier(319);
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for ComposeRecipient.Identifier(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v7 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v7 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_1BEFB2308();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      uint64_t v8 = a2[1];
      *a1 = *a2;
      a1[1] = v8;
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for ComposeRecipient.Identifier(uint64_t a1)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v2 = sub_1BEFB2308();
    uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
    return v3(a1, v2);
  }
  else
  {
    return swift_bridgeObjectRelease();
  }
}

void *initializeWithCopy for ComposeRecipient.Identifier(void *a1, void *a2)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_1BEFB2308();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    swift_bridgeObjectRetain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *assignWithCopy for ComposeRecipient.Identifier(void *a1, void *a2)
{
  if (a1 != a2)
  {
    sub_1BEF8BAAC((uint64_t)a1, type metadata accessor for ComposeRecipient.Identifier);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v4 = sub_1BEFB2308();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
    }
    else
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *initializeWithTake for ComposeRecipient.Identifier(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_1BEFB2308();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithTake for ComposeRecipient.Identifier(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_1BEF8BAAC((uint64_t)a1, type metadata accessor for ComposeRecipient.Identifier);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_1BEFB2308();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for ComposeRecipient.Identifier(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for ComposeRecipient.Identifier(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_1BEF8F438()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_1BEF8F448()
{
  uint64_t result = sub_1BEFB2308();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_1BEF8F4DC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139450);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1BEF8F53C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_1BEF8F5A4()
{
  unint64_t result = qword_1EA139458[0];
  if (!qword_1EA139458[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1EA139458);
  }
  return result;
}

uint64_t HandleAvailability.Status.debugDescription.getter()
{
  return *(void *)&asc_1BEFB7AB0[8 * *v0];
}

BOOL static HandleAvailability.Status.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t HandleAvailability.Status.hash(into:)()
{
  return sub_1BEFB2A38();
}

BOOL sub_1BEF8F660(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1BEF8F678()
{
  return sub_1BEFB2A38();
}

uint64_t HandleAvailability.Service.debugDescription.getter()
{
  return *(void *)&aImessagercs[8 * *v0];
}

uint64_t _s20ContactsAutocomplete18HandleAvailabilityV6StatusO9hashValueSivg_0()
{
  return sub_1BEFB2A48();
}

uint64_t sub_1BEF8F71C()
{
  return sub_1BEFB2A48();
}

uint64_t sub_1BEF8F764(uint64_t a1)
{
  return sub_1BEF8F7E8(a1, qword_1EA13F730);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_1BEF8F7C4(uint64_t a1)
{
  return sub_1BEF8F7E8(a1, qword_1EA13F748);
}

uint64_t sub_1BEF8F7E8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1BEFB25A8();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_1BEFB2598();
}

uint64_t HandleAvailability.LastKnownIDStatusLookup.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t HandleAvailability.LastKnownIDStatusLookup.init()()
{
  return v0;
}

uint64_t sub_1BEF8F878(uint64_t a1, unsigned char *a2)
{
  *(void *)(v2 + 32) = a1;
  *(unsigned char *)(v2 + 73) = *a2;
  return MEMORY[0x1F4188298](sub_1BEF8F8A0, 0, 0);
}

id sub_1BEF8F8A0()
{
  if (qword_1EA13A4D0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_1BEFB25A8();
  *(void *)(v0 + 40) = __swift_project_value_buffer(v1, (uint64_t)qword_1EA13F730);
  os_log_type_t v2 = sub_1BEFB27A8();
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_1BEFB2588();
  os_log_type_t v4 = v2;
  BOOL v5 = os_log_type_enabled(v3, v2);
  uint64_t v6 = *(void *)(v0 + 32);
  if (v5)
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 134217984;
    *(void *)(v0 + 24) = *(void *)(v6 + 16);
    sub_1BEFB2828();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BEF57000, v3, v4, "Looking up last known status for %ld handles (currentIDStatus).", v7, 0xCu);
    MEMORY[0x1C18A1630](v7, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  id result = objc_msgSend(self, sel_sharedInstance);
  if (result)
  {
    uint64_t v9 = result;
    char v10 = *(unsigned char *)(v0 + 73);
    sub_1BEFB25F8();
    uint64_t v11 = swift_task_alloc();
    sub_1BEFB25E8();
    type metadata accessor for IDSLookup();
    swift_allocObject();
    uint64_t v12 = sub_1BEF96964(v9, 0xD00000000000001FLL, 0x80000001BEFBF880, v11);
    *(void *)(v0 + 48) = v12;

    swift_task_dealloc();
    *(unsigned char *)(v0 + 72) = v10;
    uint64_t v15 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(*v12 + 112) + **(int **)(*v12 + 112));
    uint64_t v13 = (void *)swift_task_alloc();
    *(void *)(v0 + 56) = v13;
    void *v13 = v0;
    v13[1] = sub_1BEF8FB84;
    uint64_t v14 = *(void *)(v0 + 32);
    return (id)v15(v14, v0 + 72);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1BEF8FB84(uint64_t a1)
{
  *(void *)(*(void *)v1 + 64) = a1;
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_1BEF8FC84, 0, 0);
}

uint64_t sub_1BEF8FC84()
{
  uint64_t v13 = v0;
  os_log_type_t v1 = sub_1BEFB27A8();
  swift_bridgeObjectRetain_n();
  os_log_type_t v2 = sub_1BEFB2588();
  os_log_type_t v3 = v1;
  if (os_log_type_enabled(v2, v1))
  {
    os_log_type_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    uint64_t v12 = v5;
    *(_DWORD *)os_log_type_t v4 = 136380675;
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_1BEFB2618();
    unint64_t v8 = v7;
    swift_bridgeObjectRelease();
    v0[2] = sub_1BEF946CC(v6, v8, &v12);
    sub_1BEFB2828();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1BEF57000, v2, v3, "Status from helper: %{private}s.", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C18A1630](v5, -1, -1);
    MEMORY[0x1C18A1630](v4, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }
  swift_release();

  uint64_t v9 = (uint64_t (*)(uint64_t))v0[1];
  uint64_t v10 = v0[8];
  return v9(v10);
}

void *sub_1BEF8FE70(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  swift_allocObject();
  unint64_t v8 = sub_1BEF96964(a1, a2, a3, a4);

  return v8;
}

uint64_t type metadata accessor for IDSLookup()
{
  return self;
}

uint64_t HandleAvailability.LastKnownIDStatusLookup.deinit()
{
  return v0;
}

uint64_t sub_1BEF8FF0C(uint64_t a1, uint64_t a2)
{
  unint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(**(void **)v2 + 88)
                                                + **(int **)(**(void **)v2 + 88));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  void *v6 = v3;
  v6[1] = sub_1BEF983E8;
  return v8(a1, a2);
}

uint64_t HandleAvailability.UncachedIDStatusLookup.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t HandleAvailability.UncachedIDStatusLookup.init()()
{
  return v0;
}

uint64_t sub_1BEF90034(uint64_t a1, unsigned char *a2)
{
  *(void *)(v2 + 24) = a1;
  *(unsigned char *)(v2 + 57) = *a2;
  return MEMORY[0x1F4188298](sub_1BEF9005C, 0, 0);
}

id sub_1BEF9005C()
{
  if (qword_1EA13A4D0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_1BEFB25A8();
  __swift_project_value_buffer(v1, (uint64_t)qword_1EA13F730);
  os_log_type_t v2 = sub_1BEFB27A8();
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_1BEFB2588();
  os_log_type_t v4 = v2;
  BOOL v5 = os_log_type_enabled(v3, v2);
  uint64_t v6 = *(void *)(v0 + 24);
  if (v5)
  {
    unint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)unint64_t v7 = 134217984;
    *(void *)(v0 + 16) = *(void *)(v6 + 16);
    sub_1BEFB2828();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BEF57000, v3, v4, "Looking up uncached status for %ld handles (refreshIDStatus).", v7, 0xCu);
    MEMORY[0x1C18A1630](v7, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  id result = objc_msgSend(self, sel_sharedInstance);
  if (result)
  {
    uint64_t v9 = result;
    char v10 = *(unsigned char *)(v0 + 57);
    sub_1BEFB25F8();
    uint64_t v11 = swift_task_alloc();
    sub_1BEFB25E8();
    type metadata accessor for IDSLookup();
    swift_allocObject();
    uint64_t v12 = sub_1BEF96964(v9, 0xD00000000000001FLL, 0x80000001BEFBF880, v11);
    *(void *)(v0 + 32) = v12;

    swift_task_dealloc();
    *(unsigned char *)(v0 + 56) = v10;
    uint64_t v15 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(*v12 + 120) + **(int **)(*v12 + 120));
    uint64_t v13 = (void *)swift_task_alloc();
    *(void *)(v0 + 40) = v13;
    void *v13 = v0;
    v13[1] = sub_1BEF9033C;
    uint64_t v14 = *(void *)(v0 + 24);
    return (id)v15(v14, v0 + 56);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1BEF9033C(uint64_t a1)
{
  *(void *)(*(void *)v1 + 48) = a1;
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_1BEF9043C, 0, 0);
}

uint64_t sub_1BEF9043C()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v2 = *(void *)(v0 + 48);
  return v1(v2);
}

uint64_t HandleAvailability.UncachedIDStatusLookup.deinit()
{
  return v0;
}

uint64_t sub_1BEF904A8(uint64_t a1, uint64_t a2)
{
  unint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(**(void **)v2 + 88)
                                                + **(int **)(**(void **)v2 + 88));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  void *v6 = v3;
  v6[1] = sub_1BEF983E8;
  return v8(a1, a2);
}

unint64_t sub_1BEF905B8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139550);
  uint64_t v2 = (void *)sub_1BEFB2968();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (char *)(a1 + 49);
  while (1)
  {
    uint64_t v5 = *(void *)(v4 - 17);
    uint64_t v6 = *(void *)(v4 - 9);
    unsigned __int8 v7 = *(v4 - 1);
    char v8 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_1BEF94D9C(v5, v6, v7);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = v2[6] + 24 * result;
    *(void *)uint64_t v11 = v5;
    *(void *)(v11 + 8) = v6;
    *(unsigned char *)(v11 + 16) = v7;
    *(unsigned char *)(v2[7] + result) = v8;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v4 += 24;
    v2[2] = v14;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_1BEF906F0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139540);
  uint64_t v2 = (void *)sub_1BEFB2968();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_1BEF94D24(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    char v10 = (uint64_t *)(v2[6] + 16 * result);
    *char v10 = v5;
    v10[1] = v6;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
    v4 += 3;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_1BEF9080C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139558);
  uint64_t v2 = (void *)sub_1BEFB2968();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (unsigned char *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *((void *)v4 - 2);
    uint64_t v6 = *((void *)v4 - 1);
    char v7 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_1BEF94D24(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    char v10 = (uint64_t *)(v2[6] + 16 * result);
    *char v10 = v5;
    v10[1] = v6;
    *(unsigned char *)(v2[7] + result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v4 += 24;
    v2[2] = v13;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_1BEF90920()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BEF90958(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 56) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BEF909A0(long long *a1)
{
  uint64_t v2 = swift_allocObject();
  uint64_t v3 = MEMORY[0x1E4FBC860];
  *(void *)(v2 + 56) = sub_1BEF905B8(MEMORY[0x1E4FBC860]);
  *(void *)(v2 + 64) = sub_1BEF906F0(v3);
  sub_1BEF96BE4(a1, v2 + 16);
  return v2;
}

uint64_t sub_1BEF90A0C(uint64_t a1, unsigned char *a2)
{
  *(void *)(v3 + 48) = a1;
  *(void *)(v3 + 56) = v2;
  *(unsigned char *)(v3 + 108) = *a2;
  return MEMORY[0x1F4188298](sub_1BEF90A34, 0, 0);
}

uint64_t sub_1BEF90A34()
{
  uint64_t v64 = v0;
  v59 = (void *)sub_1BEF9080C(MEMORY[0x1E4FBC860]);
  if (qword_1EA13A4D8 != -1) {
LABEL_41:
  }
    swift_once();
  uint64_t v1 = sub_1BEFB25A8();
  uint64_t v2 = __swift_project_value_buffer(v1, (uint64_t)qword_1EA13F748);
  *(void *)(v0 + 64) = v2;
  uint64_t v3 = sub_1BEFB2588();
  os_log_type_t v4 = sub_1BEFB27B8();
  uint64_t v60 = v0;
  uint64_t v57 = v2;
  if (os_log_type_enabled(v3, v4))
  {
    char v5 = *(unsigned char *)(v0 + 108);
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    v63 = (void *)v7;
    *(_DWORD *)uint64_t v6 = 136315138;
    *(unsigned char *)(v60 + 107) = v5;
    uint64_t v8 = sub_1BEFB26B8();
    *(void *)(v60 + 40) = sub_1BEF946CC(v8, v9, (uint64_t *)&v63);
    sub_1BEFB2828();
    uint64_t v0 = v60;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BEF57000, v3, v4, "Looking up status of handles for service .%s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C18A1630](v7, -1, -1);
    MEMORY[0x1C18A1630](v6, -1, -1);
  }

  uint64_t v10 = *(void *)(*(void *)(v0 + 48) + 16);
  if (v10)
  {
    v56 = (unsigned char *)(v0 + 106);
    v62 = *(uint64_t (**)(uint64_t))(**(void **)(v0 + 56) + 104);
    uint64_t v11 = (unint64_t *)(swift_bridgeObjectRetain() + 40);
    BOOL v12 = (char *)MEMORY[0x1E4FBC860];
    while (1)
    {
      uint64_t v13 = *(v11 - 1);
      unint64_t v14 = *v11;
      uint64_t v15 = swift_bridgeObjectRetain_n();
      uint64_t v16 = v62(v15);
      if (*(void *)(v16 + 16) && (unint64_t v17 = sub_1BEF94D9C(v13, v14, *(unsigned char *)(v0 + 108)), (v18 & 1) != 0))
      {
        uint64_t v19 = *(unsigned __int8 *)(*(void *)(v16 + 56) + v17);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain_n();
        unint64_t v20 = sub_1BEFB2588();
        os_log_type_t v21 = sub_1BEFB27B8();
        v58 = v12;
        if (os_log_type_enabled(v20, v21))
        {
          uint64_t v22 = swift_slowAlloc();
          uint64_t v23 = swift_slowAlloc();
          v63 = (void *)v23;
          *(_DWORD *)uint64_t v22 = 136380931;
          swift_bridgeObjectRetain();
          *(void *)(v22 + 4) = sub_1BEF946CC(v13, v14, (uint64_t *)&v63);
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v22 + 12) = 2080;
          unsigned char *v56 = v19;
          uint64_t v24 = sub_1BEFB26B8();
          uint64_t v0 = v19;
          *(void *)(v22 + 14) = sub_1BEF946CC(v24, v25, (uint64_t *)&v63);
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_1BEF57000, v20, v21, " - %{private}s: .%s", (uint8_t *)v22, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x1C18A1630](v23, -1, -1);
          MEMORY[0x1C18A1630](v22, -1, -1);
        }
        else
        {
          swift_bridgeObjectRelease_n();
        }

        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v63 = v59;
        unint64_t v38 = sub_1BEF94D24(v13, v14);
        uint64_t v39 = v59[2];
        BOOL v40 = (v37 & 1) == 0;
        uint64_t v41 = v39 + v40;
        if (__OFADD__(v39, v40))
        {
          __break(1u);
LABEL_40:
          __break(1u);
          goto LABEL_41;
        }
        char v42 = v37;
        if (v59[3] >= v41)
        {
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            sub_1BEF9612C();
            v59 = v63;
          }
        }
        else
        {
          sub_1BEF95114(v41, isUniquelyReferenced_nonNull_native);
          uint64_t v43 = (uint64_t)v63;
          unint64_t v44 = sub_1BEF94D24(v13, v14);
          if ((v42 & 1) != (v45 & 1))
          {
            return sub_1BEFB29D8();
          }
          unint64_t v38 = v44;
          v59 = (void *)v43;
        }
        uint64_t v0 = v60;
        uint64_t v2 = v57;
        if (v42)
        {
          *(unsigned char *)(v59[7] + v38) = v19;
        }
        else
        {
          v59[(v38 >> 6) + 8] |= 1 << v38;
          v46 = (uint64_t *)(v59[6] + 16 * v38);
          uint64_t *v46 = v13;
          v46[1] = v14;
          *(unsigned char *)(v59[7] + v38) = v19;
          uint64_t v47 = v59[2];
          BOOL v48 = __OFADD__(v47, 1);
          uint64_t v49 = v47 + 1;
          if (v48) {
            goto LABEL_40;
          }
          v59[2] = v49;
          swift_bridgeObjectRetain();
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        BOOL v12 = v58;
      }
      else
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain_n();
        uint64_t v26 = sub_1BEFB2588();
        os_log_type_t v27 = sub_1BEFB27B8();
        if (os_log_type_enabled(v26, v27))
        {
          uint64_t v28 = swift_slowAlloc();
          uint64_t v29 = v2;
          uint64_t v30 = v12;
          uint64_t v31 = swift_slowAlloc();
          v63 = (void *)v31;
          *(_DWORD *)uint64_t v28 = 136380675;
          swift_bridgeObjectRetain();
          *(void *)(v28 + 4) = sub_1BEF946CC(v13, v14, (uint64_t *)&v63);
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_1BEF57000, v26, v27, " - %{private}s: cache miss", (uint8_t *)v28, 0xCu);
          swift_arrayDestroy();
          uint64_t v32 = v31;
          BOOL v12 = v30;
          uint64_t v2 = v29;
          uint64_t v0 = v60;
          MEMORY[0x1C18A1630](v32, -1, -1);
          MEMORY[0x1C18A1630](v28, -1, -1);
        }
        else
        {
          swift_bridgeObjectRelease_n();
        }

        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          BOOL v12 = sub_1BEF8C5C0(0, *((void *)v12 + 2) + 1, 1, v12);
        }
        unint64_t v34 = *((void *)v12 + 2);
        unint64_t v33 = *((void *)v12 + 3);
        if (v34 >= v33 >> 1) {
          BOOL v12 = sub_1BEF8C5C0((char *)(v33 > 1), v34 + 1, 1, v12);
        }
        *((void *)v12 + 2) = v34 + 1;
        uint64_t v35 = &v12[16 * v34];
        *((void *)v35 + 4) = v13;
        *((void *)v35 + 5) = v14;
      }
      v11 += 2;
      if (!--v10)
      {
        swift_bridgeObjectRelease();
        goto LABEL_33;
      }
    }
  }
  BOOL v12 = (char *)MEMORY[0x1E4FBC860];
LABEL_33:
  *(void *)(v0 + 72) = v59;
  *(void *)(v0 + 80) = v12;
  char v50 = *(unsigned char *)(v0 + 108);
  uint64_t v51 = *(void **)(v0 + 56);
  uint64_t v52 = v51[5];
  uint64_t v53 = v51[6];
  __swift_project_boxed_opaque_existential_1(v51 + 2, v52);
  *(unsigned char *)(v0 + 104) = v50;
  v61 = (uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v53 + 8) + **(int **)(v53 + 8));
  v54 = (void *)swift_task_alloc();
  *(void *)(v0 + 88) = v54;
  void *v54 = v0;
  v54[1] = sub_1BEF911E0;
  return v61(v12, v0 + 104, v52, v53);
}

uint64_t sub_1BEF911E0(uint64_t a1)
{
  *(void *)(*(void *)v1 + 96) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4188298](sub_1BEF91300, 0, 0);
}

void sub_1BEF91300()
{
  v62 = v0;
  int64_t v1 = 0;
  uint64_t v2 = v0[12];
  uint64_t v3 = *(void *)(v2 + 64);
  v55 = (char *)v0 + 105;
  uint64_t v56 = v2 + 64;
  uint64_t v58 = v2;
  uint64_t v4 = -1;
  uint64_t v5 = -1 << *(unsigned char *)(v58 + 32);
  if (-v5 < 64) {
    uint64_t v4 = ~(-1 << -(char)v5);
  }
  unint64_t v6 = v4 & v3;
  uint64_t v7 = (uint64_t *)(v0[7] + 56);
  int64_t v57 = (unint64_t)(63 - v5) >> 6;
  uint64_t v8 = (void *)v0[9];
  while (1)
  {
    if (v6)
    {
      uint64_t v59 = (v6 - 1) & v6;
      int64_t v9 = v1;
      unint64_t v10 = __clz(__rbit64(v6)) | (v1 << 6);
      goto LABEL_22;
    }
    int64_t v11 = v1 + 1;
    if (__OFADD__(v1, 1)) {
      goto LABEL_56;
    }
    if (v11 >= v57) {
      break;
    }
    unint64_t v12 = *(void *)(v56 + 8 * v11);
    int64_t v13 = v1 + 1;
    if (!v12)
    {
      int64_t v13 = v1 + 2;
      if (v1 + 2 >= v57) {
        break;
      }
      unint64_t v12 = *(void *)(v56 + 8 * v13);
      if (!v12)
      {
        int64_t v13 = v1 + 3;
        if (v1 + 3 >= v57) {
          break;
        }
        unint64_t v12 = *(void *)(v56 + 8 * v13);
        if (!v12)
        {
          uint64_t v14 = v1 + 4;
          if (v1 + 4 >= v57) {
            break;
          }
          unint64_t v12 = *(void *)(v56 + 8 * v14);
          if (!v12)
          {
            while (1)
            {
              int64_t v13 = v14 + 1;
              if (__OFADD__(v14, 1)) {
                goto LABEL_57;
              }
              if (v13 >= v57) {
                goto LABEL_46;
              }
              unint64_t v12 = *(void *)(v56 + 8 * v13);
              ++v14;
              if (v12) {
                goto LABEL_21;
              }
            }
          }
          int64_t v13 = v1 + 4;
        }
      }
    }
LABEL_21:
    uint64_t v59 = (v12 - 1) & v12;
    int64_t v9 = v13;
    unint64_t v10 = __clz(__rbit64(v12)) + (v13 << 6);
LABEL_22:
    uint64_t v15 = (uint64_t *)(*(void *)(v58 + 48) + 16 * v10);
    uint64_t v17 = *v15;
    unint64_t v16 = v15[1];
    char v18 = *(unsigned char *)(*(void *)(v58 + 56) + v10);
    unsigned __int8 v19 = *(unsigned char *)(v60 + 108);
    swift_beginAccess();
    swift_bridgeObjectRetain_n();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v61 = (void *)*v7;
    os_log_type_t v21 = v61;
    uint64_t *v7 = 0x8000000000000000;
    unint64_t v23 = sub_1BEF94D9C(v17, v16, v19);
    uint64_t v24 = v21[2];
    BOOL v25 = (v22 & 1) == 0;
    uint64_t v26 = v24 + v25;
    if (__OFADD__(v24, v25))
    {
      __break(1u);
LABEL_53:
      __break(1u);
LABEL_54:
      __break(1u);
LABEL_55:
      __break(1u);
LABEL_56:
      __break(1u);
LABEL_57:
      __break(1u);
      return;
    }
    char v27 = v22;
    if (v21[3] >= v26)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        if (v22) {
          goto LABEL_29;
        }
      }
      else
      {
        sub_1BEF962D8();
        os_log_type_t v21 = v61;
        if (v27) {
          goto LABEL_29;
        }
      }
    }
    else
    {
      unsigned __int8 v28 = *(unsigned char *)(v60 + 108);
      sub_1BEF95420(v26, isUniquelyReferenced_nonNull_native);
      os_log_type_t v21 = v61;
      unint64_t v29 = sub_1BEF94D9C(v17, v16, v28);
      if ((v27 & 1) != (v30 & 1)) {
        goto LABEL_49;
      }
      unint64_t v23 = v29;
      if (v27)
      {
LABEL_29:
        *(unsigned char *)(v21[7] + v23) = v18;
        goto LABEL_33;
      }
    }
    char v31 = *(unsigned char *)(v60 + 108);
    v21[(v23 >> 6) + 8] |= 1 << v23;
    uint64_t v32 = v21[6] + 24 * v23;
    *(void *)uint64_t v32 = v17;
    *(void *)(v32 + 8) = v16;
    *(unsigned char *)(v32 + 16) = v31;
    *(unsigned char *)(v21[7] + v23) = v18;
    uint64_t v33 = v21[2];
    BOOL v34 = __OFADD__(v33, 1);
    uint64_t v35 = v33 + 1;
    if (v34) {
      goto LABEL_54;
    }
    v21[2] = v35;
    swift_bridgeObjectRetain();
LABEL_33:
    uint64_t *v7 = (uint64_t)v21;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    swift_bridgeObjectRetain();
    char v36 = swift_isUniquelyReferenced_nonNull_native();
    v61 = v8;
    unint64_t v38 = sub_1BEF94D24(v17, v16);
    uint64_t v39 = v8[2];
    BOOL v40 = (v37 & 1) == 0;
    uint64_t v41 = v39 + v40;
    if (__OFADD__(v39, v40)) {
      goto LABEL_53;
    }
    char v42 = v37;
    if (v8[3] >= v41)
    {
      if (v36)
      {
        if (v37) {
          goto LABEL_40;
        }
      }
      else
      {
        sub_1BEF9612C();
        uint64_t v8 = v61;
        if (v42) {
          goto LABEL_40;
        }
      }
    }
    else
    {
      sub_1BEF95114(v41, v36);
      uint64_t v8 = v61;
      unint64_t v43 = sub_1BEF94D24(v17, v16);
      if ((v42 & 1) != (v44 & 1))
      {
LABEL_49:
        sub_1BEFB29D8();
        return;
      }
      unint64_t v38 = v43;
      if (v42)
      {
LABEL_40:
        *(unsigned char *)(v8[7] + v38) = v18;
        goto LABEL_44;
      }
    }
    v8[(v38 >> 6) + 8] |= 1 << v38;
    char v45 = (uint64_t *)(v8[6] + 16 * v38);
    uint64_t *v45 = v17;
    v45[1] = v16;
    *(unsigned char *)(v8[7] + v38) = v18;
    uint64_t v46 = v8[2];
    BOOL v34 = __OFADD__(v46, 1);
    uint64_t v47 = v46 + 1;
    if (v34) {
      goto LABEL_55;
    }
    v8[2] = v47;
    swift_bridgeObjectRetain();
LABEL_44:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    BOOL v48 = sub_1BEFB2588();
    os_log_type_t v49 = sub_1BEFB27B8();
    if (os_log_type_enabled(v48, v49))
    {
      uint64_t v50 = swift_slowAlloc();
      uint64_t v51 = swift_slowAlloc();
      v61 = (void *)v51;
      *(_DWORD *)uint64_t v50 = 136315395;
      unsigned char *v55 = v18;
      uint64_t v52 = sub_1BEFB26B8();
      *(void *)(v50 + 4) = sub_1BEF946CC(v52, v53, (uint64_t *)&v61);
      swift_bridgeObjectRelease();
      *(_WORD *)(v50 + 12) = 2081;
      swift_bridgeObjectRetain();
      *(void *)(v50 + 14) = sub_1BEF946CC(v17, v16, (uint64_t *)&v61);
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1BEF57000, v48, v49, "Caching status .%s for %{private}s", (uint8_t *)v50, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1C18A1630](v51, -1, -1);
      MEMORY[0x1C18A1630](v50, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    int64_t v1 = v9;
    unint64_t v6 = v59;
  }
LABEL_46:
  swift_release();
  v54 = *(void (**)(void *))(v60 + 8);
  v54(v8);
}

uint64_t sub_1BEF918E4()
{
  return sub_1BEFB2A48();
}

uint64_t sub_1BEF91958()
{
  return sub_1BEFB2A38();
}

uint64_t sub_1BEF919B4()
{
  return sub_1BEFB2A48();
}

BOOL sub_1BEF91A24(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 16);
  int v3 = *(unsigned __int8 *)(a2 + 16);
  if (*(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8)) {
    return v2 == v3;
  }
  char v5 = sub_1BEFB29B8();
  BOOL result = 0;
  if (v5) {
    return v2 == v3;
  }
  return result;
}

uint64_t sub_1BEF91A84()
{
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186488](v0, 72, 7);
}

uint64_t sub_1BEF91ACC(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(**(void **)v2 + 160)
                                                + **(int **)(**(void **)v2 + 160));
  unint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  void *v6 = v3;
  v6[1] = sub_1BEF983E8;
  return v8(a1, a2);
}

uint64_t sub_1BEF91BDC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 96))();
  *a2 = result;
  return result;
}

uint64_t sub_1BEF91C28(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  swift_beginAccess();
  *(void *)(v3 + 56) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BEF91C88(long long *a1)
{
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 56) = MEMORY[0x1E4FBC860];
  sub_1BEF96BE4(a1, v2 + 16);
  return v2;
}

uint64_t sub_1BEF91CD8(uint64_t a1, unsigned char *a2)
{
  *(void *)(v3 + 40) = a1;
  *(void *)(v3 + 48) = v2;
  *(unsigned char *)(v3 + 73) = *a2;
  return MEMORY[0x1F4188298](sub_1BEF91D00, 0, 0);
}

uint64_t sub_1BEF91D00()
{
  char v1 = *(unsigned char *)(v0 + 73);
  uint64_t v2 = *(void **)(v0 + 48);
  uint64_t v3 = v2[5];
  uint64_t v4 = v2[6];
  __swift_project_boxed_opaque_existential_1(v2 + 2, v3);
  *(unsigned char *)(v0 + 72) = v1;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 + 8) + **(int **)(v4 + 8));
  char v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v5;
  void *v5 = v0;
  v5[1] = sub_1BEF91E24;
  uint64_t v6 = *(void *)(v0 + 40);
  return v8(v6, v0 + 72, v3, v4);
}

uint64_t sub_1BEF91E24(uint64_t a1)
{
  *(void *)(*(void *)v1 + 64) = a1;
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_1BEF91F24, 0, 0);
}

uint64_t sub_1BEF91F24()
{
  uint64_t v1 = (void **)(*(void *)(v0 + 48) + 56);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v2 = sub_1BEF945A4(0, v2[2] + 1, 1, v2);
    *uint64_t v1 = v2;
  }
  unint64_t v5 = v2[2];
  unint64_t v4 = v2[3];
  if (v5 >= v4 >> 1)
  {
    uint64_t v2 = sub_1BEF945A4((void *)(v4 > 1), v5 + 1, 1, v2);
    *uint64_t v1 = v2;
  }
  uint64_t v6 = *(void *)(v0 + 64);
  char v7 = *(unsigned char *)(v0 + 73);
  uint64_t v8 = *(void *)(v0 + 40);
  v2[2] = v5 + 1;
  uint64_t v9 = &v2[3 * v5];
  void v9[4] = v8;
  *((unsigned char *)v9 + 40) = v7;
  v9[6] = v6;
  swift_endAccess();
  unint64_t v10 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v11 = *(void *)(v0 + 64);
  return v10(v11);
}

uint64_t sub_1BEF9205C()
{
  swift_beginAccess();
  *(void *)(v0 + 56) = MEMORY[0x1E4FBC860];
  return swift_bridgeObjectRelease();
}

uint64_t static HandleAvailability.LookupSpy.StatusCallDescription.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  int v4 = *(unsigned __int8 *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  if ((sub_1BEF92120(*(void **)a1, *(void **)a2) & 1) == 0 || v2 != v4) {
    return 0;
  }
  return sub_1BEF921E8(v3, v5);
}

uint64_t sub_1BEF92120(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  if (v2 != a2[2]) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  BOOL v5 = a1[4] == a2[4] && a1[5] == a2[5];
  if (v5 || (v6 = sub_1BEFB29B8(), uint64_t result = 0, (v6 & 1) != 0))
  {
    uint64_t v8 = v2 - 1;
    if (!v8) {
      return 1;
    }
    uint64_t v9 = a1 + 7;
    for (i = a2 + 7; ; i += 2)
    {
      BOOL v11 = *(v9 - 1) == *(i - 1) && *v9 == *i;
      if (!v11 && (sub_1BEFB29B8() & 1) == 0) {
        break;
      }
      v9 += 2;
      if (!--v8) {
        return 1;
      }
    }
    return 0;
  }
  return result;
}

uint64_t sub_1BEF921E8(uint64_t result, uint64_t a2)
{
  if (result == a2) {
    return 1;
  }
  uint64_t v3 = result;
  if (*(void *)(result + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v4 = 0;
  uint64_t v5 = result + 64;
  uint64_t v6 = 1 << *(unsigned char *)(result + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(result + 64);
  int64_t v9 = (unint64_t)(v6 + 63) >> 6;
  while (1)
  {
    if (v8)
    {
      unint64_t v10 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v11 = v10 | (v4 << 6);
      goto LABEL_24;
    }
    int64_t v12 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v12 >= v9) {
      return 1;
    }
    unint64_t v13 = *(void *)(v5 + 8 * v12);
    ++v4;
    if (!v13)
    {
      int64_t v4 = v12 + 1;
      if (v12 + 1 >= v9) {
        return 1;
      }
      unint64_t v13 = *(void *)(v5 + 8 * v4);
      if (!v13)
      {
        int64_t v4 = v12 + 2;
        if (v12 + 2 >= v9) {
          return 1;
        }
        unint64_t v13 = *(void *)(v5 + 8 * v4);
        if (!v13)
        {
          int64_t v4 = v12 + 3;
          if (v12 + 3 >= v9) {
            return 1;
          }
          unint64_t v13 = *(void *)(v5 + 8 * v4);
          if (!v13) {
            break;
          }
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v13 - 1) & v13;
    unint64_t v11 = __clz(__rbit64(v13)) + (v4 << 6);
LABEL_24:
    uint64_t v15 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v11);
    uint64_t v16 = *v15;
    uint64_t v17 = v15[1];
    int v18 = *(unsigned __int8 *)(*(void *)(v3 + 56) + v11);
    swift_bridgeObjectRetain();
    unint64_t v19 = sub_1BEF94D24(v16, v17);
    char v21 = v20;
    uint64_t result = swift_bridgeObjectRelease();
    if ((v21 & 1) == 0 || *(unsigned __int8 *)(*(void *)(a2 + 56) + v19) != v18) {
      return 0;
    }
  }
  int64_t v14 = v12 + 4;
  if (v14 >= v9) {
    return 1;
  }
  unint64_t v13 = *(void *)(v5 + 8 * v14);
  if (v13)
  {
    int64_t v4 = v14;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v4 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v4 >= v9) {
      return 1;
    }
    unint64_t v13 = *(void *)(v5 + 8 * v4);
    ++v14;
    if (v13) {
      goto LABEL_23;
    }
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_1BEF92394(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  int v4 = *(unsigned __int8 *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  if ((sub_1BEF92120(*(void **)a1, *(void **)a2) & 1) == 0 || v2 != v4) {
    return 0;
  }
  return sub_1BEF921E8(v3, v5);
}

uint64_t HandleAvailability.LookupSpy.deinit()
{
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t HandleAvailability.LookupSpy.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186488](v0, 64, 7);
}

uint64_t sub_1BEF9247C(uint64_t a1, uint64_t a2)
{
  unint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(**(void **)v2 + 128)
                                                + **(int **)(**(void **)v2 + 128));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  void *v6 = v3;
  v6[1] = sub_1BEF983E8;
  return v8(a1, a2);
}

uint64_t sub_1BEF9258C(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return MEMORY[0x1F4188298](sub_1BEF925AC, 0, 0);
}

uint64_t sub_1BEF925AC()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = (void *)sub_1BEF9080C(MEMORY[0x1E4FBC860]);
  uint64_t v3 = *(void *)(v1 + 16);
  if (!v3)
  {
LABEL_17:
    unint64_t v19 = *(uint64_t (**)(void *))(v0 + 8);
    return v19(v2);
  }
  int v4 = (uint64_t *)(swift_bridgeObjectRetain() + 40);
  while (1)
  {
    uint64_t v6 = *(v4 - 1);
    uint64_t v5 = *v4;
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v9 = sub_1BEF94D24(v6, v5);
    uint64_t v10 = v2[2];
    BOOL v11 = (v8 & 1) == 0;
    uint64_t result = v10 + v11;
    if (__OFADD__(v10, v11))
    {
      __break(1u);
LABEL_24:
      __break(1u);
      return result;
    }
    char v13 = v8;
    if (v2[3] < result) {
      break;
    }
    if (isUniquelyReferenced_nonNull_native)
    {
      if (v8) {
        goto LABEL_3;
      }
    }
    else
    {
      uint64_t result = (uint64_t)sub_1BEF9612C();
      if (v13)
      {
LABEL_3:
        *(unsigned char *)(v2[7] + v9) = 2;
        goto LABEL_4;
      }
    }
LABEL_12:
    v2[(v9 >> 6) + 8] |= 1 << v9;
    uint64_t v15 = (uint64_t *)(v2[6] + 16 * v9);
    *uint64_t v15 = v6;
    v15[1] = v5;
    *(unsigned char *)(v2[7] + v9) = 2;
    uint64_t v16 = v2[2];
    BOOL v17 = __OFADD__(v16, 1);
    uint64_t v18 = v16 + 1;
    if (v17) {
      goto LABEL_24;
    }
    v2[2] = v18;
    swift_bridgeObjectRetain();
LABEL_4:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v4 += 2;
    if (!--v3)
    {
      swift_bridgeObjectRelease();
      goto LABEL_17;
    }
  }
  sub_1BEF95114(result, isUniquelyReferenced_nonNull_native);
  uint64_t result = sub_1BEF94D24(v6, v5);
  if ((v13 & 1) == (v14 & 1))
  {
    unint64_t v9 = result;
    if (v13) {
      goto LABEL_3;
    }
    goto LABEL_12;
  }
  return sub_1BEFB29D8();
}

uint64_t HandleAvailability.LookupStub.deinit()
{
  return v0;
}

uint64_t HandleAvailability.LookupStub.__deallocating_deinit()
{
  return MEMORY[0x1F4186488](v0, 16, 7);
}

uint64_t sub_1BEF927CC(uint64_t a1, uint64_t a2)
{
  char v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(**(void **)v2 + 80)
                                                + **(int **)(**(void **)v2 + 80));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  void *v6 = v3;
  v6[1] = sub_1BEF983E8;
  return v8(a1, a2);
}

uint64_t sub_1BEF928DC(char *a1, uint64_t a2, uint64_t a3, unsigned __int8 *a4)
{
  char v7 = *a1;
  unsigned __int8 v8 = *a4;
  uint64_t v9 = (uint64_t *)(v4 + 16);
  swift_beginAccess();
  if (*(void *)(*(void *)(v4 + 16) + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1BEF94D24(a2, a3);
    if (v10)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      sub_1BEF96000(v7, v8, isUniquelyReferenced_nonNull_native);
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  __swift_instantiateConcreteTypeFromMangledName(qword_1EA139488);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1BEFB7570;
  *(unsigned char *)(inited + 32) = v8;
  *(unsigned char *)(inited + 33) = v7;
  unint64_t v14 = sub_1BEF96C40(inited);
  swift_setDeallocating();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  char v15 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v16 = *v9;
  uint64_t *v9 = 0x8000000000000000;
  sub_1BEF95E90(v14, a2, a3, v15);
  uint64_t *v9 = v16;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_endAccess();
}

uint64_t sub_1BEF92A78(uint64_t a1, unsigned char *a2)
{
  *(void *)(v3 + 40) = a1;
  *(void *)(v3 + 48) = v2;
  *(unsigned char *)(v3 + 56) = *a2;
  return MEMORY[0x1F4188298](sub_1BEF92AA0, 0, 0);
}

uint64_t sub_1BEF92AA0()
{
  uint64_t v1 = v0[5];
  uint64_t v2 = (void *)sub_1BEF9080C(MEMORY[0x1E4FBC860]);
  uint64_t v3 = *(void *)(v1 + 16);
  if (!v3)
  {
LABEL_26:
    unint64_t v29 = (uint64_t (*)(void *))v0[1];
    return v29(v2);
  }
  uint64_t v4 = v0[5];
  char v30 = v0;
  uint64_t v5 = v0[6] + 16;
  swift_bridgeObjectRetain();
  uint64_t v31 = v5;
  swift_beginAccess();
  uint64_t v6 = (uint64_t *)(v4 + 40);
  while (1)
  {
    uint64_t v8 = *(v6 - 1);
    uint64_t v7 = *v6;
    uint64_t v9 = *(void *)v31;
    uint64_t v10 = *(void *)(*(void *)v31 + 16);
    swift_bridgeObjectRetain_n();
    if (v10)
    {
      swift_bridgeObjectRetain();
      unint64_t v11 = sub_1BEF94D24(v8, v7);
      if (v12)
      {
        uint64_t v13 = *(void *)(*(void *)(v9 + 56) + 8 * v11);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        if (*(void *)(v13 + 16) && (unint64_t v14 = sub_1BEF94E40(*((unsigned char *)v30 + 56)), (v15 & 1) != 0)) {
          char v16 = *(unsigned char *)(*(void *)(v13 + 56) + v14);
        }
        else {
          char v16 = 1;
        }
      }
      else
      {
        char v16 = 1;
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      char v16 = 1;
    }
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v19 = sub_1BEF94D24(v8, v7);
    uint64_t v20 = v2[2];
    BOOL v21 = (v18 & 1) == 0;
    uint64_t result = v20 + v21;
    if (__OFADD__(v20, v21))
    {
      __break(1u);
LABEL_33:
      __break(1u);
      return result;
    }
    char v23 = v18;
    if (v2[3] < result) {
      break;
    }
    if (isUniquelyReferenced_nonNull_native)
    {
      if (v18) {
        goto LABEL_3;
      }
    }
    else
    {
      uint64_t result = (uint64_t)sub_1BEF9612C();
      if (v23)
      {
LABEL_3:
        *(unsigned char *)(v2[7] + v19) = v16;
        goto LABEL_4;
      }
    }
LABEL_21:
    v2[(v19 >> 6) + 8] |= 1 << v19;
    BOOL v25 = (uint64_t *)(v2[6] + 16 * v19);
    uint64_t *v25 = v8;
    v25[1] = v7;
    *(unsigned char *)(v2[7] + v19) = v16;
    uint64_t v26 = v2[2];
    BOOL v27 = __OFADD__(v26, 1);
    uint64_t v28 = v26 + 1;
    if (v27) {
      goto LABEL_33;
    }
    v2[2] = v28;
    swift_bridgeObjectRetain();
LABEL_4:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    v6 += 2;
    if (!--v3)
    {
      uint64_t v0 = v30;
      swift_bridgeObjectRelease();
      goto LABEL_26;
    }
  }
  sub_1BEF95114(result, isUniquelyReferenced_nonNull_native);
  uint64_t result = sub_1BEF94D24(v8, v7);
  if ((v23 & 1) == (v24 & 1))
  {
    unint64_t v19 = result;
    if (v23) {
      goto LABEL_3;
    }
    goto LABEL_21;
  }
  return sub_1BEFB29D8();
}

uint64_t HandleAvailability.LookupTestDouble.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t HandleAvailability.LookupTestDouble.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186488](v0, 24, 7);
}

uint64_t sub_1BEF92DC0()
{
  uint64_t v0 = swift_allocObject();
  *(void *)(v0 + 16) = sub_1BEF906F0(MEMORY[0x1E4FBC860]);
  return v0;
}

uint64_t sub_1BEF92E04(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(**(void **)v2 + 120)
                                                + **(int **)(**(void **)v2 + 120));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  void *v6 = v3;
  v6[1] = sub_1BEF983E8;
  return v8(a1, a2);
}

uint64_t sub_1BEF92F14(uint64_t a1, unsigned char *a2)
{
  *(void *)(v3 + 24) = a1;
  *(void *)(v3 + 32) = v2;
  *(unsigned char *)(v3 + 56) = *a2;
  return MEMORY[0x1F4188298](sub_1BEF92F3C, 0, 0);
}

uint64_t sub_1BEF92F3C()
{
  char v1 = *(unsigned char *)(v0 + 56);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v4 = swift_task_alloc();
  *(void *)(v0 + 40) = v4;
  *(void *)(v4 + 16) = v3;
  *(unsigned char *)(v4 + 24) = v1;
  *(void *)(v4 + 32) = v2;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA1394A0);
  void *v5 = v0;
  v5[1] = sub_1BEF93054;
  return MEMORY[0x1F41880D8](v0 + 16, 0, 0, 0xD000000000000029, 0x80000001BEFBF8A0, sub_1BEF96D18, v4, v6);
}

uint64_t sub_1BEF93054()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_1BEF9316C, 0, 0);
}

uint64_t sub_1BEF9316C()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 16));
}

void sub_1BEF93184(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139530);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x1F4188790](v8);
  if (*(void *)(a2 + 16))
  {
    uint64_t v29 = a1;
    uint64_t v11 = v8;
    switch(a3)
    {
      case 1:
        if (qword_1EA13A4D0 != -1) {
          swift_once();
        }
        uint64_t v23 = sub_1BEFB25A8();
        __swift_project_value_buffer(v23, (uint64_t)qword_1EA13F730);
        uint64_t v20 = sub_1BEFB2588();
        os_log_type_t v24 = sub_1BEFB27C8();
        if (os_log_type_enabled(v20, v24))
        {
          BOOL v25 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)BOOL v25 = 0;
          _os_log_impl(&dword_1BEF57000, v20, v24, "Invalid service name. Continuing with empty status.", v25, 2u);
          MEMORY[0x1C18A1630](v25, -1, -1);
        }
        goto LABEL_13;
      default:
        sub_1BEFB2698();
        id v28 = *(id *)(a4 + 16);
        sub_1BEF935D4(a2);
        char v12 = (void *)sub_1BEFB2708();
        swift_bridgeObjectRelease();
        uint64_t v13 = (void *)sub_1BEFB2688();
        swift_bridgeObjectRelease();
        unint64_t v14 = (void *)sub_1BEFB2688();
        uint64_t v27 = *(void *)(a4 + 40);
        uint64_t v15 = v11;
        (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v29, v11);
        unint64_t v16 = (*(unsigned __int8 *)(v9 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
        uint64_t v17 = swift_allocObject();
        *(void *)(v17 + 16) = a4;
        (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v17 + v16, (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v15);
        aBlock[4] = sub_1BEF97FEC;
        aBlock[5] = v17;
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 1107296256;
        aBlock[2] = sub_1BEF936FC;
        aBlock[3] = &block_descriptor_72;
        char v18 = _Block_copy(aBlock);
        swift_retain();
        swift_release();
        objc_msgSend(v28, sel_currentIDStatusForDestinations_service_listenerID_queue_completionBlock_, v12, v13, v14, v27, v18);
        _Block_release(v18);

        break;
    }
  }
  else
  {
    if (qword_1EA13A4D0 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_1BEFB25A8();
    __swift_project_value_buffer(v19, (uint64_t)qword_1EA13F730);
    uint64_t v20 = sub_1BEFB2588();
    os_log_type_t v21 = sub_1BEFB27B8();
    if (os_log_type_enabled(v20, v21))
    {
      char v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v22 = 0;
      _os_log_impl(&dword_1BEF57000, v20, v21, "No destinations; bypassing IDS check.", v22, 2u);
      MEMORY[0x1C18A1630](v22, -1, -1);
    }
LABEL_13:

    sub_1BEF9080C(MEMORY[0x1E4FBC860]);
    sub_1BEFB2748();
  }
}

uint64_t sub_1BEF935D4(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x1E4FBC860];
  if (v1)
  {
    uint64_t v9 = MEMORY[0x1E4FBC860];
    sub_1BEF967D4(0, v1, 0);
    uint64_t v2 = v9;
    uint64_t v4 = a1 + 40;
    do
    {
      swift_bridgeObjectRetain();
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1BEF967D4(0, *(void *)(v2 + 16) + 1, 1);
        uint64_t v2 = v9;
      }
      unint64_t v6 = *(void *)(v2 + 16);
      unint64_t v5 = *(void *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_1BEF967D4(v5 > 1, v6 + 1, 1);
        uint64_t v2 = v9;
      }
      v4 += 16;
      *(void *)(v2 + 16) = v6 + 1;
      sub_1BEF97F84(&v8, (_OWORD *)(v2 + 32 * v6 + 32));
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_1BEF936FC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void (**)(uint64_t))(a1 + 32);
  if (a2) {
    uint64_t v3 = sub_1BEFB2608();
  }
  else {
    uint64_t v3 = 0;
  }
  swift_retain();
  v2(v3);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BEF9378C(uint64_t a1, unsigned char *a2)
{
  *(void *)(v3 + 24) = a1;
  *(void *)(v3 + 32) = v2;
  *(unsigned char *)(v3 + 56) = *a2;
  return MEMORY[0x1F4188298](sub_1BEF937B4, 0, 0);
}

uint64_t sub_1BEF937B4()
{
  char v1 = *(unsigned char *)(v0 + 56);
  uint64_t v2 = swift_task_alloc();
  *(void *)(v0 + 40) = v2;
  int8x16_t v3 = *(int8x16_t *)(v0 + 24);
  *(unsigned char *)(v2 + 16) = v1;
  *(int8x16_t *)(v2 + 24) = vextq_s8(v3, v3, 8uLL);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA1394A0);
  void *v4 = v0;
  v4[1] = sub_1BEF938C4;
  return MEMORY[0x1F41880D8](v0 + 16, 0, 0, 0xD000000000000029, 0x80000001BEFBF8D0, sub_1BEF96D28, v2, v5);
}

uint64_t sub_1BEF938C4()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_1BEF983EC, 0, 0);
}

void sub_1BEF939DC(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139530);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x1F4188790](v8);
  switch(a2)
  {
    case 1:
      if (qword_1EA13A4D0 != -1) {
        swift_once();
      }
      uint64_t v19 = sub_1BEFB25A8();
      __swift_project_value_buffer(v19, (uint64_t)qword_1EA13F730);
      uint64_t v20 = sub_1BEFB2588();
      os_log_type_t v21 = sub_1BEFB27C8();
      if (os_log_type_enabled(v20, v21))
      {
        char v22 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)char v22 = 0;
        _os_log_impl(&dword_1BEF57000, v20, v21, "Invalid service name. Continuing with empty status.", v22, 2u);
        MEMORY[0x1C18A1630](v22, -1, -1);
      }

      sub_1BEF9080C(MEMORY[0x1E4FBC860]);
      sub_1BEFB2748();
      break;
    default:
      sub_1BEFB2698();
      uint64_t v11 = v8;
      id v24 = *(id *)(a3 + 16);
      sub_1BEF935D4(a4);
      uint64_t v23 = sub_1BEFB2708();
      swift_bridgeObjectRelease();
      char v12 = (void *)sub_1BEFB2688();
      swift_bridgeObjectRelease();
      uint64_t v13 = (void *)sub_1BEFB2688();
      uint64_t v14 = *(void *)(a3 + 40);
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v11);
      unint64_t v15 = (*(unsigned __int8 *)(v9 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
      uint64_t v16 = swift_allocObject();
      *(void *)(v16 + 16) = a3;
      (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v16 + v15, (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v11);
      aBlock[4] = sub_1BEF97FEC;
      aBlock[5] = v16;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1BEF936FC;
      aBlock[3] = &block_descriptor;
      uint64_t v17 = _Block_copy(aBlock);
      swift_retain();
      swift_release();
      char v18 = (void *)v23;
      objc_msgSend(v24, sel_refreshIDStatusForDestinations_service_listenerID_queue_completionBlock_, v23, v12, v13, v14, v17);
      _Block_release(v17);

      break;
  }
}

unint64_t sub_1BEF93D48(uint64_t a1)
{
  if (a1)
  {
    uint64_t v1 = a1;
    uint64_t v2 = qword_1EA13A4D0;
    swift_bridgeObjectRetain();
    if (v2 != -1) {
LABEL_52:
    }
      swift_once();
    uint64_t v45 = sub_1BEFB25A8();
    __swift_project_value_buffer(v45, (uint64_t)qword_1EA13F730);
    swift_bridgeObjectRetain();
    int8x16_t v3 = sub_1BEFB2588();
    os_log_type_t v4 = sub_1BEFB27B8();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v5 = 134217984;
      *(void *)&v57[0] = *(void *)(v1 + 16);
      sub_1BEFB2828();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1BEF57000, v3, v4, "Received %ld statuses", v5, 0xCu);
      MEMORY[0x1C18A1630](v5, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease();
    }
    unint64_t v12 = sub_1BEF9080C(MEMORY[0x1E4FBC860]);
    uint64_t v43 = v1 + 64;
    uint64_t v13 = 1 << *(unsigned char *)(v1 + 32);
    uint64_t v14 = -1;
    if (v13 < 64) {
      uint64_t v14 = ~(-1 << v13);
    }
    unint64_t v15 = v14 & *(void *)(v1 + 64);
    int64_t v44 = (unint64_t)(v13 + 63) >> 6;
    swift_bridgeObjectRetain();
    int64_t v16 = 0;
    uint64_t v42 = v1;
    while (1)
    {
      if (v15)
      {
        uint64_t v47 = (v15 - 1) & v15;
        unint64_t v20 = __clz(__rbit64(v15)) | (v16 << 6);
      }
      else
      {
        int64_t v21 = v16 + 1;
        if (__OFADD__(v16, 1))
        {
          __break(1u);
LABEL_51:
          __break(1u);
          goto LABEL_52;
        }
        if (v21 >= v44) {
          goto LABEL_46;
        }
        unint64_t v22 = *(void *)(v43 + 8 * v21);
        ++v16;
        if (!v22)
        {
          int64_t v16 = v21 + 1;
          if (v21 + 1 >= v44) {
            goto LABEL_46;
          }
          unint64_t v22 = *(void *)(v43 + 8 * v16);
          if (!v22)
          {
            int64_t v16 = v21 + 2;
            if (v21 + 2 >= v44) {
              goto LABEL_46;
            }
            unint64_t v22 = *(void *)(v43 + 8 * v16);
            if (!v22)
            {
              int64_t v16 = v21 + 3;
              if (v21 + 3 >= v44) {
                goto LABEL_46;
              }
              unint64_t v22 = *(void *)(v43 + 8 * v16);
              if (!v22)
              {
                int64_t v23 = v21 + 4;
                if (v23 >= v44)
                {
LABEL_46:
                  swift_release();
                  swift_bridgeObjectRetain();
                  BOOL v34 = sub_1BEFB2588();
                  os_log_type_t v35 = sub_1BEFB27A8();
                  if (os_log_type_enabled(v34, v35))
                  {
                    unint64_t v48 = v12;
                    char v36 = (uint8_t *)swift_slowAlloc();
                    uint64_t v37 = swift_slowAlloc();
                    *(void *)&v57[0] = v37;
                    *(_DWORD *)char v36 = 136380675;
                    swift_bridgeObjectRetain();
                    uint64_t v38 = sub_1BEFB2618();
                    unint64_t v40 = v39;
                    swift_bridgeObjectRelease();
                    *(void *)&v52[0] = sub_1BEF946CC(v38, v40, (uint64_t *)v57);
                    sub_1BEFB2828();
                    swift_bridgeObjectRelease_n();
                    swift_bridgeObjectRelease();
                    _os_log_impl(&dword_1BEF57000, v34, v35, "Status: %{private}s", v36, 0xCu);
                    swift_arrayDestroy();
                    MEMORY[0x1C18A1630](v37, -1, -1);
                    uint64_t v41 = v36;
                    unint64_t v12 = v48;
                    MEMORY[0x1C18A1630](v41, -1, -1);
                  }
                  else
                  {

                    swift_bridgeObjectRelease_n();
                  }
                  return v12;
                }
                unint64_t v22 = *(void *)(v43 + 8 * v23);
                if (!v22)
                {
                  while (1)
                  {
                    int64_t v16 = v23 + 1;
                    if (__OFADD__(v23, 1)) {
                      goto LABEL_51;
                    }
                    if (v16 >= v44) {
                      goto LABEL_46;
                    }
                    unint64_t v22 = *(void *)(v43 + 8 * v16);
                    ++v23;
                    if (v22) {
                      goto LABEL_41;
                    }
                  }
                }
                int64_t v16 = v23;
              }
            }
          }
        }
LABEL_41:
        uint64_t v47 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v16 << 6);
      }
      int64_t v46 = v16;
      sub_1BEF96D34(*(void *)(v1 + 48) + 40 * v20, (uint64_t)v52);
      sub_1BEF96D90(*(void *)(v1 + 56) + 32 * v20, (uint64_t)v53 + 8);
      v50[0] = v53[0];
      v50[1] = v53[1];
      uint64_t v51 = v54;
      v49[0] = v52[0];
      v49[1] = v52[1];
      sub_1BEF96D34((uint64_t)v49, (uint64_t)v57);
      sub_1BEF96D90((uint64_t)v50 + 8, (uint64_t)v59);
      v60[0] = v57[0];
      v60[1] = v57[1];
      uint64_t v61 = v58;
      swift_dynamicCast();
      uint64_t v24 = v55;
      unint64_t v25 = v56;
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v59);
      sub_1BEF96D34((uint64_t)v49, (uint64_t)v57);
      sub_1BEF96D90((uint64_t)v50 + 8, (uint64_t)v59);
      sub_1BEF97F84(v59, v60);
      swift_dynamicCast();
      uint64_t v26 = v55;
      sub_1BEF97F94((uint64_t)v57);
      if (qword_1EA13A4D0 != -1) {
        swift_once();
      }
      __swift_project_value_buffer(v45, (uint64_t)qword_1EA13F730);
      swift_bridgeObjectRetain_n();
      uint64_t v27 = sub_1BEFB2588();
      os_log_type_t v28 = sub_1BEFB27A8();
      if (os_log_type_enabled(v27, v28))
      {
        uint64_t v29 = swift_slowAlloc();
        unint64_t v30 = v12;
        uint64_t v31 = swift_slowAlloc();
        *(void *)&v57[0] = v31;
        *(_DWORD *)uint64_t v29 = 136380931;
        swift_bridgeObjectRetain();
        *(void *)&v60[0] = sub_1BEF946CC(v24, v25, (uint64_t *)v57);
        sub_1BEFB2828();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v29 + 12) = 2048;
        *(void *)&v60[0] = v26;
        sub_1BEFB2828();
        _os_log_impl(&dword_1BEF57000, v27, v28, "Status of handle %{private}s: %ld", (uint8_t *)v29, 0x16u);
        swift_arrayDestroy();
        uint64_t v32 = v31;
        unint64_t v12 = v30;
        MEMORY[0x1C18A1630](v32, -1, -1);
        uint64_t v33 = v29;
        uint64_t v1 = v42;
        MEMORY[0x1C18A1630](v33, -1, -1);
      }
      else
      {
        swift_bridgeObjectRelease_n();
      }

      int64_t v16 = v46;
      if (v26 == 2) {
        char v17 = 1;
      }
      else {
        char v17 = 2;
      }
      if (v26 == 1) {
        char v18 = 0;
      }
      else {
        char v18 = v17;
      }
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *(void *)&v57[0] = v12;
      sub_1BEF95D2C(v18, v24, v25, isUniquelyReferenced_nonNull_native);
      unint64_t v12 = *(void *)&v57[0];
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_1BEF96DEC((uint64_t)v49);
      unint64_t v15 = v47;
    }
  }
  if (qword_1EA13A4D0 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_1BEFB25A8();
  __swift_project_value_buffer(v6, (uint64_t)qword_1EA13F730);
  uint64_t v7 = sub_1BEFB2588();
  os_log_type_t v8 = sub_1BEFB27C8();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_1BEF57000, v7, v8, "Reply received with no status", v9, 2u);
    MEMORY[0x1C18A1630](v9, -1, -1);
  }

  uint64_t v10 = MEMORY[0x1E4FBC860];
  return sub_1BEF9080C(v10);
}

uint64_t sub_1BEF9455C()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186488](v0, 48, 7);
}

void *sub_1BEF945A4(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139548);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
      unint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[3 * v8 + 4]) {
          memmove(v12, a4 + 4, 24 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x1E4FBC860];
      unint64_t v12 = (void *)(MEMORY[0x1E4FBC860] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_1BEF9819C(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1BEF946CC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1BEF947A0(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1BEF96D90((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x1E4FBB9B0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_1BEF96D90((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_1BEF947A0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_1BEFB2838();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1BEF9495C(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_1BEFB28B8();
  if (!v8)
  {
    sub_1BEFB2918();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1BEFB2978();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_1BEF9495C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_1BEF949F4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1BEF94BD4(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1BEF94BD4(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1BEF949F4(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_1BEF94B6C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1BEFB2888();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_1BEFB2918();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1BEFB26E8();
      if (!v2) {
        return MEMORY[0x1E4FBC860];
      }
    }
    sub_1BEFB2978();
    __break(1u);
LABEL_14:
    uint64_t result = sub_1BEFB2918();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E4FBC860];
  }
  return result;
}

void *sub_1BEF94B6C(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139560);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1BEF94BD4(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139560);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_1BEFB2978();
  __break(1u);
  return result;
}

unint64_t sub_1BEF94D24(uint64_t a1, uint64_t a2)
{
  sub_1BEFB2A28();
  sub_1BEFB26C8();
  uint64_t v4 = sub_1BEFB2A48();
  return sub_1BEF94EAC(a1, a2, v4);
}

unint64_t sub_1BEF94D9C(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  sub_1BEFB2A28();
  swift_bridgeObjectRetain();
  sub_1BEFB26C8();
  swift_bridgeObjectRelease();
  sub_1BEFB2A38();
  uint64_t v6 = sub_1BEFB2A48();
  return sub_1BEF94F90(a1, a2, a3, v6);
}

unint64_t sub_1BEF94E40(unsigned __int8 a1)
{
  sub_1BEFB2A28();
  sub_1BEFB2A38();
  uint64_t v2 = sub_1BEFB2A48();
  return sub_1BEF95074(a1, v2);
}

unint64_t sub_1BEF94EAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1BEFB29B8() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_1BEFB29B8() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_1BEF94F90(uint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
{
  uint64_t v5 = v4 + 64;
  uint64_t v6 = -1 << *(unsigned char *)(v4 + 32);
  unint64_t v7 = a4 & ~v6;
  if ((*(void *)(v4 + 64 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7))
  {
    int v10 = a3;
    uint64_t v11 = ~v6;
    uint64_t v12 = *(void *)(v4 + 48);
    do
    {
      uint64_t v13 = v12 + 24 * v7;
      int v14 = *(unsigned __int8 *)(v13 + 16);
      BOOL v15 = *(void *)v13 == a1 && *(void *)(v13 + 8) == a2;
      if (v15 || (sub_1BEFB29B8()) && v14 == v10) {
        break;
      }
      unint64_t v7 = (v7 + 1) & v11;
    }
    while (((*(void *)(v5 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7) & 1) != 0);
  }
  return v7;
}

unint64_t sub_1BEF95074(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(unsigned __int8 *)(v7 + result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(unsigned __int8 *)(v7 + result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

uint64_t sub_1BEF95114(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139558);
  char v37 = a2;
  uint64_t v6 = sub_1BEFB2958();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  BOOL v34 = v2;
  int64_t v35 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v35) {
      break;
    }
    unint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v36 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v35) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v36 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v35)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v34;
          if ((v37 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v35) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v36 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    char v32 = *(unsigned char *)(*(void *)(v5 + 56) + v20);
    if ((v37 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    sub_1BEFB2A28();
    sub_1BEFB26C8();
    uint64_t result = sub_1BEFB2A48();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    char v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *char v18 = v31;
    v18[1] = v30;
    *(unsigned char *)(*(void *)(v7 + 56) + v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v34;
  unint64_t v22 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_1BEF95420(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139550);
  char v36 = a2;
  uint64_t v6 = sub_1BEFB2958();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    int64_t v35 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v34 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v19 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v20 = v19 | (v13 << 6);
      }
      else
      {
        int64_t v21 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v21 >= v34) {
          goto LABEL_33;
        }
        unint64_t v22 = v35[v21];
        ++v13;
        if (!v22)
        {
          int64_t v13 = v21 + 1;
          if (v21 + 1 >= v34) {
            goto LABEL_33;
          }
          unint64_t v22 = v35[v13];
          if (!v22)
          {
            int64_t v23 = v21 + 2;
            if (v23 >= v34)
            {
LABEL_33:
              swift_release();
              uint64_t v3 = v2;
              if (v36)
              {
                uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
                if (v33 >= 64) {
                  bzero(v35, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *int64_t v35 = -1 << v33;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v22 = v35[v23];
            if (!v22)
            {
              while (1)
              {
                int64_t v13 = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_40;
                }
                if (v13 >= v34) {
                  goto LABEL_33;
                }
                unint64_t v22 = v35[v13];
                ++v23;
                if (v22) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v13 = v23;
          }
        }
LABEL_30:
        unint64_t v10 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v13 << 6);
      }
      uint64_t v28 = *(void *)(v5 + 48) + 24 * v20;
      uint64_t v30 = *(void *)v28;
      uint64_t v29 = *(void *)(v28 + 8);
      char v31 = *(unsigned char *)(v28 + 16);
      char v32 = *(unsigned char *)(*(void *)(v5 + 56) + v20);
      if ((v36 & 1) == 0) {
        swift_bridgeObjectRetain();
      }
      sub_1BEFB2A28();
      swift_bridgeObjectRetain();
      sub_1BEFB26C8();
      swift_bridgeObjectRelease();
      sub_1BEFB2A38();
      uint64_t result = sub_1BEFB2A48();
      uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v15 = result & ~v14;
      unint64_t v16 = v15 >> 6;
      if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          BOOL v26 = v16 == v25;
          if (v16 == v25) {
            unint64_t v16 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v11 + 8 * v16);
        }
        while (v27 == -1);
        unint64_t v17 = __clz(__rbit64(~v27)) + (v16 << 6);
      }
      *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      uint64_t v18 = *(void *)(v7 + 48) + 24 * v17;
      *(void *)uint64_t v18 = v30;
      *(void *)(v18 + 8) = v29;
      *(unsigned char *)(v18 + 16) = v31;
      *(unsigned char *)(*(void *)(v7 + 56) + v17) = v32;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_1BEF9574C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139540);
  char v36 = a2;
  uint64_t v6 = sub_1BEFB2958();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34) {
      break;
    }
    unint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v34) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v35 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v34) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v35 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_1BEFB2A28();
    sub_1BEFB26C8();
    uint64_t result = sub_1BEFB2A48();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *uint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  unint64_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_1BEF95A64(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA139E80);
  uint64_t result = sub_1BEFB2958();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    char v30 = a2;
    int64_t v8 = 0;
    uint64_t v31 = (void *)(v5 + 64);
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v12 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v13 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v15 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v16 = v15 | (v8 << 6);
      }
      else
      {
        int64_t v17 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        uint64_t result = v5 + 64;
        if (v17 >= v12) {
          goto LABEL_31;
        }
        unint64_t v18 = v31[v17];
        ++v8;
        if (!v18)
        {
          int64_t v8 = v17 + 1;
          if (v17 + 1 >= v12) {
            goto LABEL_31;
          }
          unint64_t v18 = v31[v8];
          if (!v18)
          {
            int64_t v19 = v17 + 2;
            if (v19 >= v12)
            {
LABEL_31:
              if ((v30 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v2;
                goto LABEL_38;
              }
              uint64_t v29 = 1 << *(unsigned char *)(v5 + 32);
              if (v29 >= 64) {
                bzero(v31, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *uint64_t v31 = -1 << v29;
              }
              uint64_t v3 = v2;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v18 = v31[v19];
            if (!v18)
            {
              while (1)
              {
                int64_t v8 = v19 + 1;
                if (__OFADD__(v19, 1)) {
                  goto LABEL_40;
                }
                if (v8 >= v12) {
                  goto LABEL_31;
                }
                unint64_t v18 = v31[v8];
                ++v19;
                if (v18) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v8 = v19;
          }
        }
LABEL_21:
        unint64_t v11 = (v18 - 1) & v18;
        unint64_t v16 = __clz(__rbit64(v18)) + (v8 << 6);
      }
      char v20 = *(unsigned char *)(*(void *)(v5 + 48) + v16);
      char v21 = *(unsigned char *)(*(void *)(v5 + 56) + v16);
      sub_1BEFB2A28();
      sub_1BEFB2A38();
      uint64_t result = sub_1BEFB2A48();
      uint64_t v22 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v13 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1 << v23) & ~*(void *)(v13 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v13 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v14 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v13 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      *(unsigned char *)(*(void *)(v7 + 48) + v14) = v20;
      *(unsigned char *)(*(void *)(v7 + 56) + v14) = v21;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_38:
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_1BEF95D2C(char a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_1BEF94D24(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t result = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= result && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= result && (a4 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_1BEF9612C();
LABEL_7:
    unint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      *(unsigned char *)(v18[7] + v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_1BEF95114(result, a4 & 1);
  uint64_t result = sub_1BEF94D24(a2, a3);
  if ((v16 & 1) != (v19 & 1))
  {
LABEL_17:
    uint64_t result = sub_1BEFB29D8();
    __break(1u);
    return result;
  }
  unint64_t v12 = result;
  unint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  char v20 = (uint64_t *)(v18[6] + 16 * v12);
  uint64_t *v20 = a2;
  v20[1] = a3;
  *(unsigned char *)(v18[7] + v12) = a1;
  uint64_t v21 = v18[2];
  BOOL v22 = __OFADD__(v21, 1);
  uint64_t v23 = v21 + 1;
  if (v22)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v23;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BEF95E90(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_1BEF94D24(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_1BEF96490();
LABEL_7:
    unint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t result = swift_bridgeObjectRelease();
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_1BEF9574C(v15, a4 & 1);
  unint64_t v21 = sub_1BEF94D24(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = sub_1BEFB29D8();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  unint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  uint64_t v23 = (uint64_t *)(v18[6] + 16 * v12);
  uint64_t *v23 = a2;
  v23[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v24 = v18[2];
  BOOL v25 = __OFADD__(v24, 1);
  uint64_t v26 = v24 + 1;
  if (v25)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v26;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BEF96000(char a1, unsigned __int8 a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_1BEF94E40(a2);
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = *(void *)(v8 + 24);
  if (v15 >= result && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v15 >= result && (a3 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_1BEF96648();
LABEL_7:
    char v16 = (void *)*v4;
    if (v14)
    {
LABEL_8:
      *(unsigned char *)(v16[7] + v10) = a1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    *(unsigned char *)(v16[6] + v10) = a2;
    *(unsigned char *)(v16[7] + v10) = a1;
    uint64_t v18 = v16[2];
    BOOL v19 = __OFADD__(v18, 1);
    uint64_t v20 = v18 + 1;
    if (!v19)
    {
      v16[2] = v20;
      return result;
    }
    goto LABEL_14;
  }
  sub_1BEF95A64(result, a3 & 1);
  uint64_t result = sub_1BEF94E40(a2);
  if ((v14 & 1) == (v17 & 1))
  {
    unint64_t v10 = result;
    char v16 = (void *)*v4;
    if (v14) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  uint64_t result = sub_1BEFB29D8();
  __break(1u);
  return result;
}

void *sub_1BEF9612C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139558);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1BEFB2948();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    char v16 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = *v16;
    uint64_t v17 = v16[1];
    LOBYTE(v16) = *(unsigned char *)(*(void *)(v2 + 56) + v15);
    BOOL v19 = (void *)(*(void *)(v4 + 48) + 16 * v15);
    *BOOL v19 = v18;
    v19[1] = v17;
    *(unsigned char *)(*(void *)(v4 + 56) + v15) = (_BYTE)v16;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v13) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1BEF962D8()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139550);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1BEFB2948();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      int64_t v9 = v21 + 1;
      if (v21 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v22 = *(void *)(v6 + 8 * v9);
      if (!v22) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v22 - 1) & v22;
    unint64_t v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = *(void *)(v2 + 48) + 24 * v15;
    uint64_t v18 = *(void *)v16;
    uint64_t v17 = *(void *)(v16 + 8);
    LOBYTE(v16) = *(unsigned char *)(v16 + 16);
    char v19 = *(unsigned char *)(*(void *)(v2 + 56) + v15);
    uint64_t v20 = *(void *)(v4 + 48) + 24 * v15;
    *(void *)uint64_t v20 = v18;
    *(void *)(v20 + 8) = v17;
    *(unsigned char *)(v20 + 16) = v16;
    *(unsigned char *)(*(void *)(v4 + 56) + v15) = v19;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v23 = v21 + 2;
  if (v23 >= v13) {
    goto LABEL_26;
  }
  unint64_t v22 = *(void *)(v6 + 8 * v23);
  if (v22)
  {
    int64_t v9 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v9);
    ++v23;
    if (v22) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1BEF96490()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139540);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1BEFB2948();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    int64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1BEF96648()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA139E80);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1BEFB2948();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v17 >= v13) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18) {
        break;
      }
    }
LABEL_25:
    unint64_t v20 = __clz(__rbit64(v18));
    unint64_t v12 = (v18 - 1) & v18;
    unint64_t v15 = v20 + (v9 << 6);
LABEL_12:
    char v16 = *(unsigned char *)(*(void *)(v2 + 56) + v15);
    *(unsigned char *)(*(void *)(v4 + 48) + v15) = *(unsigned char *)(*(void *)(v2 + 48) + v15);
    *(unsigned char *)(*(void *)(v4 + 56) + v15) = v16;
  }
  int64_t v19 = v17 + 2;
  if (v19 >= v13) {
    goto LABEL_26;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
    int64_t v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_1BEF967D4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1BEF967F4(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_1BEF967F4(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139538);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  int64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_1BEFB2978();
  __break(1u);
  return result;
}

void *sub_1BEF96964(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  v5[2] = a1;
  v5[3] = a2;
  v5[4] = a3;
  sub_1BEF98294();
  uint64_t v8 = sub_1BEFB25F8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a4, v8);
  uint64_t v11 = sub_1BEFB27E8();
  MEMORY[0x1F4188790](v11);
  v18[1] = MEMORY[0x1E4FBC860];
  sub_1BEF982D4();
  id v12 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139578);
  sub_1BEF98320();
  sub_1BEFB2868();
  uint64_t v13 = sub_1BEFB27F8();
  MEMORY[0x1F4188790](v13);
  (*(void (**)(char *, void))(v15 + 104))((char *)v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x1E4FBCC50]);
  uint64_t v16 = sub_1BEFB2808();
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a4, v8);
  v5[5] = v16;
  return v5;
}

uint64_t sub_1BEF96BE4(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_1BEF96C40(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA139E80);
    long long v3 = (void *)sub_1BEFB2968();
    for (i = (char *)(a1 + 33); ; i += 2)
    {
      unsigned __int8 v5 = *(i - 1);
      char v6 = *i;
      unint64_t result = sub_1BEF94E40(v5);
      if (v8) {
        break;
      }
      *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(unsigned char *)(v3[6] + result) = v5;
      *(unsigned char *)(v3[7] + result) = v6;
      uint64_t v9 = v3[2];
      BOOL v10 = __OFADD__(v9, 1);
      uint64_t v11 = v9 + 1;
      if (v10) {
        goto LABEL_10;
      }
      v3[2] = v11;
      if (!--v1) {
        return (unint64_t)v3;
      }
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E4FBC868];
  }
  return result;
}

void sub_1BEF96D18(uint64_t a1)
{
  sub_1BEF93184(a1, *(void *)(v1 + 16), *(unsigned char *)(v1 + 24), *(void *)(v1 + 32));
}

void sub_1BEF96D28(uint64_t a1)
{
  sub_1BEF939DC(a1, *(unsigned char *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_1BEF96D34(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1BEF96D90(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1BEF96DEC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA1394B0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1BEF96E50()
{
  unint64_t result = qword_1EA1394B8;
  if (!qword_1EA1394B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA1394B8);
  }
  return result;
}

unint64_t sub_1BEF96EA8()
{
  unint64_t result = qword_1EA1394C0;
  if (!qword_1EA1394C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA1394C0);
  }
  return result;
}

unint64_t sub_1BEF96F00()
{
  unint64_t result = qword_1EA1394D8;
  if (!qword_1EA1394D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA1394D8);
  }
  return result;
}

ValueMetadata *type metadata accessor for HandleAvailability()
{
  return &type metadata for HandleAvailability;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for HandleAvailability.Status(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for HandleAvailability.Status(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1BEF970D0);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_1BEF970F8(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1BEF97100(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for HandleAvailability.Status()
{
  return &type metadata for HandleAvailability.Status;
}

uint64_t getEnumTagSinglePayload for HandleAvailability.Service(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
  if (a2 + 3 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 3) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 3;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for HandleAvailability.Service(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *unint64_t result = a2 + 3;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1BEF97274);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HandleAvailability.Service()
{
  return &type metadata for HandleAvailability.Service;
}

ValueMetadata *type metadata accessor for HandleAvailability.Logs()
{
  return &type metadata for HandleAvailability.Logs;
}

uint64_t dispatch thunk of HandleAvailability.Lookup.status(for:on:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 8) + **(int **)(a4 + 8));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  void *v9 = v4;
  v9[1] = sub_1BEF983E8;
  return v11(a1, a2, a3, a4);
}

uint64_t type metadata accessor for HandleAvailability.LastKnownIDStatusLookup()
{
  return self;
}

uint64_t method lookup function for HandleAvailability.LastKnownIDStatusLookup(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for HandleAvailability.LastKnownIDStatusLookup);
}

uint64_t dispatch thunk of HandleAvailability.LastKnownIDStatusLookup.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of HandleAvailability.LastKnownIDStatusLookup.status(for:on:)(uint64_t a1, uint64_t a2)
{
  int v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(*(void *)v2 + 88) + **(int **)(*(void *)v2 + 88));
  unsigned int v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  void *v6 = v3;
  v6[1] = sub_1BEF983E8;
  return v8(a1, a2);
}

uint64_t type metadata accessor for HandleAvailability.UncachedIDStatusLookup()
{
  return self;
}

uint64_t method lookup function for HandleAvailability.UncachedIDStatusLookup(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for HandleAvailability.UncachedIDStatusLookup);
}

uint64_t dispatch thunk of HandleAvailability.UncachedIDStatusLookup.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of HandleAvailability.UncachedIDStatusLookup.status(for:on:)(uint64_t a1, uint64_t a2)
{
  int v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(*(void *)v2 + 88) + **(int **)(*(void *)v2 + 88));
  unsigned int v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  void *v6 = v3;
  v6[1] = sub_1BEF983E8;
  return v8(a1, a2);
}

uint64_t type metadata accessor for HandleAvailability.CachingLookup()
{
  return self;
}

uint64_t destroy for HandleAvailability.CachingLookup.CacheKey()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s20ContactsAutocomplete18HandleAvailabilityV13CachingLookupC8CacheKeyVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for HandleAvailability.CachingLookup.CacheKey(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for HandleAvailability.CachingLookup.CacheKey(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for HandleAvailability.CachingLookup.CacheKey(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 17)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HandleAvailability.CachingLookup.CacheKey(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 17) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HandleAvailability.CachingLookup.CacheKey()
{
  return &type metadata for HandleAvailability.CachingLookup.CacheKey;
}

uint64_t type metadata accessor for HandleAvailability.LookupSpy()
{
  return self;
}

uint64_t method lookup function for HandleAvailability.LookupSpy(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for HandleAvailability.LookupSpy);
}

uint64_t dispatch thunk of HandleAvailability.LookupSpy.callsToStatus.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96))();
}

uint64_t dispatch thunk of HandleAvailability.LookupSpy.status(for:on:)(uint64_t a1, uint64_t a2)
{
  int v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(*(void *)v2 + 128) + **(int **)(*(void *)v2 + 128));
  unsigned int v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  void *v6 = v3;
  v6[1] = sub_1BEF983E8;
  return v8(a1, a2);
}

uint64_t destroy for HandleAvailability.LookupSpy.StatusCallDescription()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t _s20ContactsAutocomplete18HandleAvailabilityV9LookupSpyC21StatusCallDescriptionVwCP_0(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for HandleAvailability.LookupSpy.StatusCallDescription(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for HandleAvailability.LookupSpy.StatusCallDescription(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for HandleAvailability.LookupSpy.StatusCallDescription(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HandleAvailability.LookupSpy.StatusCallDescription(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HandleAvailability.LookupSpy.StatusCallDescription()
{
  return &type metadata for HandleAvailability.LookupSpy.StatusCallDescription;
}

uint64_t type metadata accessor for HandleAvailability.LookupStub()
{
  return self;
}

uint64_t method lookup function for HandleAvailability.LookupStub(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for HandleAvailability.LookupStub);
}

uint64_t dispatch thunk of HandleAvailability.LookupStub.status(for:on:)(uint64_t a1, uint64_t a2)
{
  int v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(*(void *)v2 + 80) + **(int **)(*(void *)v2 + 80));
  unsigned int v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  void *v6 = v3;
  v6[1] = sub_1BEF97CCC;
  return v8(a1, a2);
}

uint64_t sub_1BEF97CCC(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t type metadata accessor for HandleAvailability.LookupTestDouble()
{
  return self;
}

uint64_t method lookup function for HandleAvailability.LookupTestDouble(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for HandleAvailability.LookupTestDouble);
}

uint64_t dispatch thunk of HandleAvailability.LookupTestDouble.setStatus(_:for:on:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of HandleAvailability.LookupTestDouble.status(for:on:)(uint64_t a1, uint64_t a2)
{
  int v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(*(void *)v2 + 120) + **(int **)(*(void *)v2 + 120));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  void *v6 = v3;
  v6[1] = sub_1BEF983E8;
  return v8(a1, a2);
}

uint64_t __swift_destroy_boxed_opaque_existential_1Tm(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

_OWORD *sub_1BEF97F84(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1BEF97F94(uint64_t a1)
{
  return a1;
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t objectdestroyTm()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139530);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x1F4186498](v0, v5, v6);
}

uint64_t sub_1BEF980DC(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139530);
  (*(void (**)(uint64_t))(**(void **)(v1 + 16) + 128))(a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139530);
  return sub_1BEFB2748();
}

uint64_t sub_1BEF9819C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 24 * a1 + 32;
    unint64_t v6 = a3 + 24 * v4;
    if (v5 >= v6 || v5 + 24 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_1BEFB2978();
  __break(1u);
  return result;
}

unint64_t sub_1BEF98294()
{
  unint64_t result = qword_1EA139568;
  if (!qword_1EA139568)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EA139568);
  }
  return result;
}

unint64_t sub_1BEF982D4()
{
  unint64_t result = qword_1EA139570;
  if (!qword_1EA139570)
  {
    sub_1BEFB27E8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA139570);
  }
  return result;
}

unint64_t sub_1BEF98320()
{
  unint64_t result = qword_1EA139580;
  if (!qword_1EA139580)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA139578);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA139580);
  }
  return result;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_1BEF98410()
{
  uint64_t v0 = sub_1BEFB25A8();
  __swift_allocate_value_buffer(v0, qword_1EA13F760);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EA13F760);
  return sub_1BEFB2598();
}

uint64_t sub_1BEF9848C()
{
  return 0;
}

uint64_t sub_1BEF98498@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = type metadata accessor for HandleAvailability.LookupStub();
  uint64_t result = sub_1BEF8AF20();
  a1[3] = v2;
  a1[4] = (uint64_t)&protocol witness table for HandleAvailability.LookupStub;
  *a1 = result;
  return result;
}

uint64_t sub_1BEF984D8(unsigned char *a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, long long *a6)
{
  uint64_t v12 = swift_allocObject();
  *(unsigned char *)(v12 + 16) = *a1;
  *(void *)(v12 + 24) = a2;
  *(void *)(v12 + 32) = a3;
  uint64_t v13 = HIBYTE(a5) & 0xF;
  if ((a5 & 0x2000000000000000) == 0) {
    uint64_t v13 = a4 & 0xFFFFFFFFFFFFLL;
  }
  if (!v13)
  {
    swift_bridgeObjectRelease();
    a4 = sub_1BEFB07AC();
    a5 = v14;
  }
  *(void *)(v12 + 40) = a4;
  *(void *)(v12 + 48) = a5;
  sub_1BEF96BE4(a6, v12 + 56);
  return v12;
}

uint64_t sub_1BEF98594()
{
  *(void *)(v1 + 56) = v0;
  return MEMORY[0x1F4188298](sub_1BEF985B4, 0, 0);
}

uint64_t sub_1BEF985B4()
{
  id v1 = objc_msgSend(self, sel_defaultEnvironment);
  unint64_t v2 = sub_1BEF9A32C();
  uint64_t v3 = MEMORY[0x1E4F4AD10];
  v0[5] = v2;
  v0[6] = v3;
  v0[2] = v1;
  uint64_t v4 = sub_1BEFB24D8();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = swift_task_alloc();
  uint64_t v7 = *(void *)(sub_1BEFB24A8() - 8);
  swift_task_alloc();
  (*(void (**)(void))(v7 + 104))();
  sub_1BEFB24C8();
  swift_task_dealloc();
  uint64_t v8 = sub_1BEFB24B8();
  uint64_t v10 = v9;
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v6, v4);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 2));
  swift_task_dealloc();
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t))v0[1];
  return v11(v8, v10);
}

uint64_t sub_1BEF987B8(uint64_t *a1)
{
  *(void *)(v2 + 80) = v1;
  *(void *)(v2 + 88) = *(void *)(type metadata accessor for ComposeRecipient(0) - 8);
  *(void *)(v2 + 96) = swift_task_alloc();
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = *a1;
  *(void *)(v2 + 104) = v4;
  *(void *)(v2 + 112) = v5;
  *(unsigned char *)(v2 + 233) = *((unsigned char *)a1 + 8);
  return MEMORY[0x1F4188298](sub_1BEF98894, 0, 0);
}

uint64_t sub_1BEF98894()
{
  if (*(void *)(v0[14] + 16))
  {
    uint64_t v1 = (void *)swift_task_alloc();
    v0[15] = v1;
    *uint64_t v1 = v0;
    v1[1] = sub_1BEF98A58;
    v1[7] = v0[10];
    return MEMORY[0x1F4188298](sub_1BEF985B4, 0, 0);
  }
  else
  {
    if (qword_1EA13A960 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_1BEFB25A8();
    __swift_project_value_buffer(v2, (uint64_t)qword_1EA13F760);
    os_log_type_t v3 = sub_1BEFB27B8();
    uint64_t v4 = sub_1BEFB2588();
    if (os_log_type_enabled(v4, v3))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_1BEF57000, v4, v3, "No names requested, so no results returned", v5, 2u);
      MEMORY[0x1C18A1630](v5, -1, -1);
    }

    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = (uint64_t (*)(uint64_t))v0[1];
    uint64_t v7 = MEMORY[0x1E4FBC860];
    return v6(v7);
  }
}

uint64_t sub_1BEF98A58(uint64_t a1, uint64_t a2)
{
  os_log_type_t v3 = (void *)*v2;
  v3[2] = v2;
  v3[3] = a1;
  v3[4] = a2;
  v3[16] = a1;
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_1BEF98B60, 0, 0);
}

uint64_t sub_1BEF98B60()
{
  uint64_t v35 = v0;
  if (*(void *)(v0 + 128))
  {
    uint64_t v33 = *(void *)(v0 + 32);
    unsigned int v1 = 0x30201u >> (8 * *(unsigned char *)(v0 + 233));
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_1BEF9D398();
    uint64_t v4 = v3;
    *(void *)(v0 + 136) = v2;
    *(void *)(v0 + 144) = v3;
    if (qword_1EA13A960 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_1BEFB25A8();
    *(void *)(v0 + 152) = __swift_project_value_buffer(v5, (uint64_t)qword_1EA13F760);
    os_log_type_t v6 = sub_1BEFB27D8();
    uint64_t v7 = sub_1BEFB2588();
    os_log_type_t v8 = v6;
    if (os_log_type_enabled(v7, v6))
    {
      uint64_t v32 = v4;
      uint64_t v9 = v2;
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      uint64_t v11 = swift_slowAlloc();
      uint64_t v34 = v11;
      *(_DWORD *)uint64_t v10 = 136315138;
      *(unsigned char *)(v0 + 232) = v1;
      sub_1BEF99EEC();
      uint64_t v12 = sub_1BEFB2998();
      *(void *)(v0 + 72) = sub_1BEF946CC(v12, v13, &v34);
      sub_1BEFB2828();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1BEF57000, v7, v8, "Searching for client: %s", v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C18A1630](v11, -1, -1);
      unint64_t v14 = v10;
      uint64_t v2 = v9;
      uint64_t v4 = v32;
      MEMORY[0x1C18A1630](v14, -1, -1);
    }

    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139598);
    *(void *)(v0 + 160) = v15;
    *(void *)(v0 + 168) = *(void *)(v15 - 8);
    uint64_t v16 = swift_task_alloc();
    *(void *)(v0 + 176) = v16;
    uint64_t ObjectType = swift_getObjectType();
    *(void *)(v0 + 40) = v2;
    *(void *)(v0 + 48) = v4;
    uint64_t v18 = sub_1BEFB2488();
    *(void *)(v0 + 184) = v18;
    *(void *)(v0 + 192) = *(void *)(v18 - 8);
    uint64_t v19 = swift_task_alloc();
    *(void *)(v0 + 200) = v19;
    unint64_t v20 = sub_1BEF99D00();
    unint64_t v21 = sub_1BEF99D54();
    sub_1BEF9990C();
    sub_1BEFB2348();
    swift_allocObject();
    uint64_t v22 = sub_1BEFB2338();
    *(void *)(v0 + 208) = v22;
    unint64_t v23 = (void *)swift_task_alloc();
    *(void *)(v0 + 216) = v23;
    void *v23 = v0;
    v23[1] = sub_1BEF99038;
    unint64_t v37 = v20;
    unint64_t v38 = v21;
    uint64_t v24 = MEMORY[0x1E4F4AC80];
    return MEMORY[0x1F4108A60](v16, v0 + 40, v19, v22, v24, ObjectType, &type metadata for CompleteNameAppIntentRepresentation, v33);
  }
  else
  {
    if (qword_1EA13A960 != -1) {
      swift_once();
    }
    uint64_t v25 = sub_1BEFB25A8();
    __swift_project_value_buffer(v25, (uint64_t)qword_1EA13F760);
    os_log_type_t v26 = sub_1BEFB27C8();
    BOOL v27 = sub_1BEFB2588();
    if (os_log_type_enabled(v27, v26))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v28 = 0;
      _os_log_impl(&dword_1BEF57000, v27, v26, "Could not create intent dispatcher", v28, 2u);
      MEMORY[0x1C18A1630](v28, -1, -1);
    }

    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v29 = *(uint64_t (**)(uint64_t))(v0 + 8);
    uint64_t v30 = MEMORY[0x1E4FBC860];
    return v29(v30);
  }
}

uint64_t sub_1BEF99038()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 224) = v0;
  swift_task_dealloc();
  (*(void (**)(void, void))(v2[24] + 8))(v2[25], v2[23]);
  swift_release();
  if (v0)
  {
    uint64_t v3 = sub_1BEF9971C;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v3 = sub_1BEF991A0;
  }
  return MEMORY[0x1F4188298](v3, 0, 0);
}

uint64_t sub_1BEF991A0()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA1395C0);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = swift_task_alloc();
  sub_1BEFB2448();
  sub_1BEFB24E8();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v3, v1);
  unint64_t v4 = v0[8];
  if (v4)
  {
    swift_task_dealloc();
    if (v4 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_1BEFB2938();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    uint64_t v6 = MEMORY[0x1E4FBC860];
    if (v5)
    {
      uint64_t v42 = MEMORY[0x1E4FBC860];
      uint64_t result = sub_1BEF99E68(0, v5 & ~(v5 >> 63), 0);
      if (v5 < 0)
      {
        __break(1u);
        return result;
      }
      uint64_t v6 = v42;
      uint64_t v8 = v0[11];
      if ((v4 & 0xC000000000000001) != 0)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          uint64_t v10 = v0[13];
          uint64_t v11 = (void *)MEMORY[0x1C18A0B20](i, v4);
          sub_1BEFA13B8(v11, v10);
          unint64_t v13 = *(void *)(v42 + 16);
          unint64_t v12 = *(void *)(v42 + 24);
          if (v13 >= v12 >> 1) {
            sub_1BEF99E68(v12 > 1, v13 + 1, 1);
          }
          uint64_t v14 = v0[13];
          *(void *)(v42 + 16) = v13 + 1;
          sub_1BEF99E88(v14, v42+ ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))+ *(void *)(v8 + 72) * v13);
        }
      }
      else
      {
        unint64_t v31 = v4 + 32;
        do
        {
          uint64_t v32 = v0[12];
          uint64_t v33 = (void *)swift_retain();
          sub_1BEFA13B8(v33, v32);
          unint64_t v35 = *(void *)(v42 + 16);
          unint64_t v34 = *(void *)(v42 + 24);
          if (v35 >= v34 >> 1) {
            sub_1BEF99E68(v34 > 1, v35 + 1, 1);
          }
          uint64_t v36 = v0[12];
          *(void *)(v42 + 16) = v35 + 1;
          sub_1BEF99E88(v36, v42+ ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))+ *(void *)(v8 + 72) * v35);
          v31 += 8;
          --v5;
        }
        while (v5);
      }
    }
    uint64_t v38 = v0[21];
    uint64_t v37 = v0[22];
    uint64_t v39 = v0[20];
    swift_release();
    swift_release();
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v37, v39);
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v40 = (uint64_t (*)(uint64_t))v0[1];
    return v40(v6);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v15 = sub_1BEFB27C8();
    uint64_t v16 = sub_1BEFB2588();
    if (os_log_type_enabled(v16, (os_log_type_t)v15))
    {
      int64_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)int64_t v17 = 0;
      _os_log_impl(&dword_1BEF57000, v16, (os_log_type_t)v15, "No value returned from execution", v17, 2u);
      MEMORY[0x1C18A1630](v17, -1, -1);
    }
    uint64_t v19 = v0[21];
    uint64_t v18 = v0[22];
    uint64_t v20 = v0[20];

    sub_1BEF99E14();
    unint64_t v21 = (void *)swift_allocError();
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v20);
    swift_task_dealloc();
    os_log_type_t v22 = sub_1BEFB27C8();
    id v23 = v21;
    id v24 = v21;
    uint64_t v25 = sub_1BEFB2588();
    os_log_type_t v26 = v22;
    if (os_log_type_enabled(v25, v22))
    {
      BOOL v27 = (uint8_t *)swift_slowAlloc();
      uint64_t v41 = (void *)swift_slowAlloc();
      *(_DWORD *)BOOL v27 = 138412290;
      id v28 = v21;
      uint64_t v29 = _swift_stdlib_bridgeErrorToNSError();
      v0[7] = v29;
      sub_1BEFB2828();
      *uint64_t v41 = v29;

      _os_log_impl(&dword_1BEF57000, v25, v26, "Error performing intent: %@", v27, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139440);
      swift_arrayDestroy();
      MEMORY[0x1C18A1630](v41, -1, -1);
      MEMORY[0x1C18A1630](v27, -1, -1);
    }
    else
    {
    }
    swift_willThrow();
    swift_unknownObjectRelease();
    swift_release();
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v30 = (uint64_t (*)(void))v0[1];
    return v30();
  }
}

uint64_t sub_1BEF9971C()
{
  swift_task_dealloc();
  uint64_t v1 = (void *)v0[28];
  swift_task_dealloc();
  os_log_type_t v2 = sub_1BEFB27C8();
  id v3 = v1;
  id v4 = v1;
  uint64_t v5 = sub_1BEFB2588();
  os_log_type_t v6 = v2;
  if (os_log_type_enabled(v5, v2))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 138412290;
    id v9 = v1;
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
    v0[7] = v10;
    sub_1BEFB2828();
    void *v8 = v10;

    _os_log_impl(&dword_1BEF57000, v5, v6, "Error performing intent: %@", v7, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139440);
    swift_arrayDestroy();
    MEMORY[0x1C18A1630](v8, -1, -1);
    MEMORY[0x1C18A1630](v7, -1, -1);
  }
  else
  {
  }
  swift_willThrow();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_1BEF9990C()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA1395E8);
  MEMORY[0x1F4188790](v0 - 8);
  os_log_type_t v2 = (char *)&v5 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1BEFB2578();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v2, 1, 1, v3);
  sub_1BEFB2478();
  return sub_1BEFB2468();
}

uint64_t sub_1BEF999EC()
{
  return 1;
}

uint64_t sub_1BEF999F4()
{
  return sub_1BEFB2A48();
}

uint64_t sub_1BEF99A38()
{
  return sub_1BEFB2A38();
}

uint64_t sub_1BEF99A60()
{
  return sub_1BEFB2A48();
}

uint64_t sub_1BEF99AB0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 56);
  return MEMORY[0x1F4186488](v0, 96, 7);
}

uint64_t sub_1BEF99AF8(uint64_t a1)
{
  os_log_type_t v6 = (uint64_t (*)(uint64_t))(*(void *)(**(void **)v1 + 128) + **(int **)(**(void **)v1 + 128));
  id v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_1BEF99C00;
  return v6(a1);
}

uint64_t sub_1BEF99C00(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

unint64_t sub_1BEF99D00()
{
  unint64_t result = qword_1EA1395A0;
  if (!qword_1EA1395A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA1395A0);
  }
  return result;
}

unint64_t sub_1BEF99D54()
{
  unint64_t result = qword_1EA1395A8;
  if (!qword_1EA1395A8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA1395B0);
    sub_1BEF99DBC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA1395A8);
  }
  return result;
}

unint64_t sub_1BEF99DBC()
{
  unint64_t result = qword_1EA1395B8;
  if (!qword_1EA1395B8)
  {
    type metadata accessor for ComposeRecipientAppEntityRepresentation();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA1395B8);
  }
  return result;
}

unint64_t sub_1BEF99E14()
{
  unint64_t result = qword_1EA1395C8;
  if (!qword_1EA1395C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA1395C8);
  }
  return result;
}

uint64_t sub_1BEF99E68(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1BEF9A0EC(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_1BEF99E88(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ComposeRecipient(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_1BEF99EEC()
{
  unint64_t result = qword_1EA1395D0;
  if (!qword_1EA1395D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA1395D0);
  }
  return result;
}

unint64_t sub_1BEF99F44()
{
  unint64_t result = qword_1EA1395D8;
  if (!qword_1EA1395D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA1395D8);
  }
  return result;
}

uint64_t _s13AppIntentImplCMa()
{
  return self;
}

uint64_t _s13AppIntentImplC32AutocompleteRemoteExecutionErrorOwet(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *_s13AppIntentImplC32AutocompleteRemoteExecutionErrorOwst(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x1BEF9A0ACLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1BEF9A0D4()
{
  return 0;
}

ValueMetadata *_s13AppIntentImplC32AutocompleteRemoteExecutionErrorOMa()
{
  return &_s13AppIntentImplC32AutocompleteRemoteExecutionErrorON;
}

uint64_t sub_1BEF9A0EC(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v13 = (void *)MEMORY[0x1E4FBC860];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139400);
  uint64_t v10 = *(void *)(type metadata accessor for ComposeRecipient(0) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_34;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(type metadata accessor for ComposeRecipient(0) - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v18 = (char *)v13 + v17;
  uint64_t v19 = (char *)a4 + v17;
  if (a1)
  {
    if (v13 < a4 || v18 >= &v19[*(void *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v20 = *(void *)(v16 + 72) * v8;
  unint64_t v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = sub_1BEFB2978();
  __break(1u);
  return result;
}

unint64_t sub_1BEF9A32C()
{
  unint64_t result = qword_1EA1395F0;
  if (!qword_1EA1395F0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EA1395F0);
  }
  return result;
}

uint64_t static ComposeRecipientHandleValueAppEntityRepresentation.bundleIdentifier.getter()
{
  return sub_1BEF9A3F4((uint64_t *)&unk_1EA1395F8);
}

uint64_t static ComposeRecipientHandleValueAppEntityRepresentation.bundleIdentifier.setter(uint64_t a1, uint64_t a2)
{
  return sub_1BEF9A458(a1, a2, qword_1EA1395F8, &qword_1EA1395F8[1]);
}

uint64_t (*static ComposeRecipientHandleValueAppEntityRepresentation.bundleIdentifier.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t static ComposeRecipientHandleValueAppEntityRepresentation.typeIdentifier.getter()
{
  return sub_1BEF9A3F4((uint64_t *)&unk_1EA139608);
}

uint64_t sub_1BEF9A3F4(uint64_t *a1)
{
  swift_beginAccess();
  uint64_t v2 = *a1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t static ComposeRecipientHandleValueAppEntityRepresentation.typeIdentifier.setter(uint64_t a1, uint64_t a2)
{
  return sub_1BEF9A458(a1, a2, qword_1EA139608, &qword_1EA139608[1]);
}

uint64_t sub_1BEF9A458(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  *a3 = a1;
  *a4 = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*static ComposeRecipientHandleValueAppEntityRepresentation.typeIdentifier.modify())()
{
  return j__swift_endAccess;
}

uint64_t sub_1BEF9A514@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(class metadata base offset for ComposeRecipientHandleValueAppEntityRepresentation
                                + **a1
                                + 24))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_1BEF9A57C(uint64_t *a1, void **a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(class metadata base offset for ComposeRecipientHandleValueAppEntityRepresentation
                                                  + **a2
                                                  + 32);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

uint64_t sub_1BEF9A600()
{
  return sub_1BEF9A918();
}

uint64_t sub_1BEF9A60C()
{
  return sub_1BEF9A96C();
}

uint64_t (*sub_1BEF9A618(void *a1))()
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(void *)(v1 + qword_1EA139620);
  swift_retain();
  v3[5] = sub_1BEFB2508();
  return sub_1BEF9A68C;
}

uint64_t sub_1BEF9A690()
{
  return sub_1BEF9AA88();
}

uint64_t sub_1BEF9A69C@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(class metadata base offset for ComposeRecipientHandleValueAppEntityRepresentation
                                + **a1
                                + 56))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_1BEF9A704(uint64_t *a1, void **a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(class metadata base offset for ComposeRecipientHandleValueAppEntityRepresentation
                                                  + **a2
                                                  + 64);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

uint64_t sub_1BEF9A788()
{
  return sub_1BEF9A918();
}

uint64_t sub_1BEF9A794()
{
  return sub_1BEF9A96C();
}

uint64_t (*sub_1BEF9A7A0(void *a1))()
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(void *)(v1 + qword_1EA139628);
  swift_retain();
  v3[5] = sub_1BEFB2508();
  return sub_1BEF9A68C;
}

uint64_t sub_1BEF9A814()
{
  return sub_1BEF9AA88();
}

uint64_t sub_1BEF9A820@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(class metadata base offset for ComposeRecipientHandleValueAppEntityRepresentation
                                + **a1
                                + 88))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_1BEF9A888(uint64_t *a1, void **a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(class metadata base offset for ComposeRecipientHandleValueAppEntityRepresentation
                                                  + **a2
                                                  + 96);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

uint64_t sub_1BEF9A90C()
{
  return sub_1BEF9A918();
}

uint64_t sub_1BEF9A918()
{
  swift_retain();
  sub_1BEFB2518();
  swift_release();
  return v1;
}

uint64_t sub_1BEF9A960()
{
  return sub_1BEF9A96C();
}

uint64_t sub_1BEF9A96C()
{
  return swift_release();
}

uint64_t (*sub_1BEF9A9B4(void *a1))()
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(void *)(v1 + qword_1EA139630);
  swift_retain();
  v3[5] = sub_1BEFB2508();
  return sub_1BEF9A68C;
}

void sub_1BEF9AA28(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 40))(*a1, 0);
  swift_release();
  free(v1);
}

uint64_t sub_1BEF9AA7C()
{
  return sub_1BEF9AA88();
}

uint64_t sub_1BEF9AA88()
{
  swift_retain();
  uint64_t v0 = sub_1BEFB2538();
  swift_release();
  return v0;
}

uint64_t ComposeRecipientHandleValueAppEntityRepresentation.__allocating_init(_:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  uint64_t v3 = qword_1EA139620;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139618);
  swift_allocObject();
  swift_retain();
  *(void *)(v2 + v3) = sub_1BEFB24F8();
  uint64_t v4 = qword_1EA139628;
  swift_allocObject();
  *(void *)(v2 + v4) = sub_1BEFB24F8();
  uint64_t v5 = qword_1EA139630;
  swift_allocObject();
  *(void *)(v2 + v5) = sub_1BEFB24F8();
  swift_release();
  uint64_t v6 = sub_1BEFB2398();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  uint64_t v9 = sub_1BEFB23F8();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
  return v9;
}

uint64_t ComposeRecipientHandleValueAppEntityRepresentation.init(_:)(uint64_t a1)
{
  uint64_t v3 = qword_1EA139620;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139618);
  swift_allocObject();
  swift_retain();
  *(void *)(v1 + v3) = sub_1BEFB24F8();
  uint64_t v4 = qword_1EA139628;
  swift_allocObject();
  *(void *)(v1 + v4) = sub_1BEFB24F8();
  uint64_t v5 = qword_1EA139630;
  swift_allocObject();
  *(void *)(v1 + v5) = sub_1BEFB24F8();
  swift_release();
  uint64_t v6 = sub_1BEFB2398();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  uint64_t v9 = sub_1BEFB23F8();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
  return v9;
}

uint64_t sub_1BEF9AE10()
{
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t ComposeRecipientHandleValueAppEntityRepresentation.deinit()
{
  uint64_t v0 = sub_1BEFB23E8();
  swift_release();
  swift_release();
  swift_release();
  return v0;
}

uint64_t ComposeRecipientHandleValueAppEntityRepresentation.__deallocating_deinit()
{
  uint64_t v0 = sub_1BEFB23E8();
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x1F4186488](v0, 40, 7);
}

uint64_t sub_1BEF9AF28()
{
  return sub_1BEFB2358();
}

uint64_t sub_1BEF9AF4C()
{
  return sub_1BEFB2368();
}

uint64_t sub_1BEF9AF70()
{
  return sub_1BEFB2388() & 1;
}

uint64_t sub_1BEF9AF98()
{
  return sub_1BEFB2378();
}

uint64_t sub_1BEF9AFBC(uint64_t a1, uint64_t a2)
{
  return sub_1BEF9AFDC(a1, a2, qword_1EA1395F8);
}

uint64_t sub_1BEF9AFCC(uint64_t a1, uint64_t a2)
{
  return sub_1BEF9AFDC(a1, a2, qword_1EA139608);
}

uint64_t sub_1BEF9AFDC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  swift_beginAccess();
  uint64_t v4 = *a3;
  swift_bridgeObjectRetain();
  return v4;
}

uint64_t sub_1BEF9B034()
{
  return sub_1BEFB2568() & 1;
}

uint64_t sub_1BEF9B08C()
{
  return sub_1BEFB2458();
}

uint64_t sub_1BEF9B0D4()
{
  return sub_1BEFB23D8();
}

uint64_t sub_1BEF9B0F8()
{
  return sub_1BEFB2558() & 1;
}

uint64_t sub_1BEF9B150@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1BEFB23B8();
  *a1 = result;
  return result;
}

uint64_t sub_1BEF9B178()
{
  return sub_1BEFB23C8();
}

uint64_t sub_1BEF9B19C()
{
  return sub_1BEFB23A8();
}

unint64_t ComposeRecipientHandleValueAppEntityRepresentation.description.getter()
{
  (*(void (**)(void))(class metadata base offset for ComposeRecipientHandleValueAppEntityRepresentation + *v0 + 24))();
  if (v1)
  {
    sub_1BEFB2878();
    swift_bridgeObjectRelease();
    strcpy((char *)v20, ".phoneNumber(");
    HIWORD(v20[1]) = -4864;
    sub_1BEFB26D8();
    swift_bridgeObjectRelease();
    sub_1BEFB26D8();
    uint64_t v2 = v20[0];
    uint64_t v3 = v20[1];
    uint64_t v4 = sub_1BEF8C5C0(0, 1, 1, MEMORY[0x1E4FBC860]);
    unint64_t v6 = *((void *)v4 + 2);
    unint64_t v5 = *((void *)v4 + 3);
    if (v6 >= v5 >> 1) {
      uint64_t v4 = sub_1BEF8C5C0((char *)(v5 > 1), v6 + 1, 1, v4);
    }
    *((void *)v4 + 2) = v6 + 1;
    uint64_t v7 = &v4[16 * v6];
    *((void *)v7 + 4) = v2;
    *((void *)v7 + 5) = v3;
  }
  else
  {
    uint64_t v4 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t isUniquelyReferenced_nonNull_native = (*(uint64_t (**)(void))(class metadata base offset for ComposeRecipientHandleValueAppEntityRepresentation
                                                             + *v0
                                                             + 56))();
  if (v9)
  {
    sub_1BEFB2878();
    swift_bridgeObjectRelease();
    strcpy((char *)v20, ".emailAddress(");
    HIBYTE(v20[1]) = -18;
    sub_1BEFB26D8();
    swift_bridgeObjectRelease();
    sub_1BEFB26D8();
    uint64_t v10 = v20[0];
    uint64_t v11 = v20[1];
    uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)sub_1BEF8C5C0(0, *((void *)v4 + 2) + 1, 1, v4);
      uint64_t v4 = (char *)isUniquelyReferenced_nonNull_native;
    }
    unint64_t v13 = *((void *)v4 + 2);
    unint64_t v12 = *((void *)v4 + 3);
    if (v13 >= v12 >> 1)
    {
      uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)sub_1BEF8C5C0((char *)(v12 > 1), v13 + 1, 1, v4);
      uint64_t v4 = (char *)isUniquelyReferenced_nonNull_native;
    }
    *((void *)v4 + 2) = v13 + 1;
    size_t v14 = &v4[16 * v13];
    *((void *)v14 + 4) = v10;
    *((void *)v14 + 5) = v11;
  }
  (*(void (**)(uint64_t))(class metadata base offset for ComposeRecipientHandleValueAppEntityRepresentation
                                  + *v0
                                  + 88))(isUniquelyReferenced_nonNull_native);
  if (v15)
  {
    sub_1BEFB2878();
    swift_bridgeObjectRelease();
    v20[0] = 0xD000000000000014;
    v20[1] = 0x80000001BEFBFE80;
    sub_1BEFB26D8();
    swift_bridgeObjectRelease();
    sub_1BEFB26D8();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v4 = sub_1BEF8C5C0(0, *((void *)v4 + 2) + 1, 1, v4);
    }
    unint64_t v17 = *((void *)v4 + 2);
    unint64_t v16 = *((void *)v4 + 3);
    if (v17 >= v16 >> 1) {
      uint64_t v4 = sub_1BEF8C5C0((char *)(v16 > 1), v17 + 1, 1, v4);
    }
    *((void *)v4 + 2) = v17 + 1;
    uint64_t v18 = &v4[16 * v17];
    *((void *)v18 + 4) = 0xD000000000000014;
    *((void *)v18 + 5) = 0x80000001BEFBFE80;
    goto LABEL_19;
  }
  if (*((void *)v4 + 2))
  {
LABEL_19:
    sub_1BEFB2878();
    swift_bridgeObjectRelease();
    v20[1] = 0x80000001BEFBFE20;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA139D20);
    sub_1BEF8C518();
    sub_1BEFB2648();
    swift_bridgeObjectRelease();
    sub_1BEFB26D8();
    swift_bridgeObjectRelease();
    sub_1BEFB26D8();
    return 0xD000000000000025;
  }
  swift_bridgeObjectRelease();
  return 0xD000000000000026;
}

unint64_t sub_1BEF9B620()
{
  return ComposeRecipientHandleValueAppEntityRepresentation.description.getter();
}

uint64_t sub_1BEF9B644()
{
  return sub_1BEF9B864(&qword_1EA139638);
}

uint64_t type metadata accessor for ComposeRecipientHandleValueAppEntityRepresentation()
{
  uint64_t result = qword_1EA13B070;
  if (!qword_1EA13B070) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1BEF9B6C4()
{
  return sub_1BEF9B864(&qword_1EA139640);
}

uint64_t sub_1BEF9B6F8()
{
  return sub_1BEF9B864(&qword_1EA139648);
}

uint64_t sub_1BEF9B72C()
{
  return sub_1BEF9B864(&qword_1EA139650);
}

uint64_t sub_1BEF9B760()
{
  return sub_1BEF9B864(&qword_1EA139658);
}

uint64_t sub_1BEF9B794()
{
  return sub_1BEF9B864(&qword_1EA139660);
}

uint64_t sub_1BEF9B7C8()
{
  return sub_1BEF9B864(&qword_1EA139668);
}

uint64_t sub_1BEF9B7FC()
{
  return sub_1BEF9B864(&qword_1EA139670);
}

uint64_t sub_1BEF9B830()
{
  return sub_1BEF9B864(&qword_1EA139678);
}

uint64_t sub_1BEF9B864(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for ComposeRecipientHandleValueAppEntityRepresentation();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1BEF9B8A8()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for ComposeRecipientHandleValueAppEntityRepresentation(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for ComposeRecipientHandleValueAppEntityRepresentation);
}

uint64_t dispatch thunk of ComposeRecipientHandleValueAppEntityRepresentation.phoneNumber.getter()
{
  return (*(uint64_t (**)(void))(class metadata base offset for ComposeRecipientHandleValueAppEntityRepresentation
                              + *v0
                              + 24))();
}

uint64_t dispatch thunk of ComposeRecipientHandleValueAppEntityRepresentation.phoneNumber.setter()
{
  return (*(uint64_t (**)(void))(class metadata base offset for ComposeRecipientHandleValueAppEntityRepresentation
                              + *v0
                              + 32))();
}

uint64_t dispatch thunk of ComposeRecipientHandleValueAppEntityRepresentation.phoneNumber.modify()
{
  return (*(uint64_t (**)(void))(class metadata base offset for ComposeRecipientHandleValueAppEntityRepresentation
                              + *v0
                              + 40))();
}

uint64_t dispatch thunk of ComposeRecipientHandleValueAppEntityRepresentation.$phoneNumber.getter()
{
  return (*(uint64_t (**)(void))(class metadata base offset for ComposeRecipientHandleValueAppEntityRepresentation
                              + *v0
                              + 48))();
}

uint64_t dispatch thunk of ComposeRecipientHandleValueAppEntityRepresentation.emailAddress.getter()
{
  return (*(uint64_t (**)(void))(class metadata base offset for ComposeRecipientHandleValueAppEntityRepresentation
                              + *v0
                              + 56))();
}

uint64_t dispatch thunk of ComposeRecipientHandleValueAppEntityRepresentation.emailAddress.setter()
{
  return (*(uint64_t (**)(void))(class metadata base offset for ComposeRecipientHandleValueAppEntityRepresentation
                              + *v0
                              + 64))();
}

uint64_t dispatch thunk of ComposeRecipientHandleValueAppEntityRepresentation.emailAddress.modify()
{
  return (*(uint64_t (**)(void))(class metadata base offset for ComposeRecipientHandleValueAppEntityRepresentation
                              + *v0
                              + 72))();
}

uint64_t dispatch thunk of ComposeRecipientHandleValueAppEntityRepresentation.$emailAddress.getter()
{
  return (*(uint64_t (**)(void))(class metadata base offset for ComposeRecipientHandleValueAppEntityRepresentation
                              + *v0
                              + 80))();
}

uint64_t dispatch thunk of ComposeRecipientHandleValueAppEntityRepresentation.applicationDefined.getter()
{
  return (*(uint64_t (**)(void))(class metadata base offset for ComposeRecipientHandleValueAppEntityRepresentation
                              + *v0
                              + 88))();
}

uint64_t dispatch thunk of ComposeRecipientHandleValueAppEntityRepresentation.applicationDefined.setter()
{
  return (*(uint64_t (**)(void))(class metadata base offset for ComposeRecipientHandleValueAppEntityRepresentation
                              + *v0
                              + 96))();
}

uint64_t dispatch thunk of ComposeRecipientHandleValueAppEntityRepresentation.applicationDefined.modify()
{
  return (*(uint64_t (**)(void))(class metadata base offset for ComposeRecipientHandleValueAppEntityRepresentation
                              + *v0
                              + 104))();
}

uint64_t dispatch thunk of ComposeRecipientHandleValueAppEntityRepresentation.$applicationDefined.getter()
{
  return (*(uint64_t (**)(void))(class metadata base offset for ComposeRecipientHandleValueAppEntityRepresentation
                              + *v0
                              + 112))();
}

uint64_t sub_1BEF9BC14()
{
  return type metadata accessor for ComposeRecipientHandleValueAppEntityRepresentation();
}

ContactsAutocomplete::ComposeRecipientHandleAvailabilityAppEnumRepresentation_optional __swiftcall ComposeRecipientHandleAvailabilityAppEnumRepresentation.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_1BEFB2988();
  result.value = swift_bridgeObjectRelease();
  char v5 = 3;
  if (v3 < 3) {
    char v5 = v3;
  }
  char *v2 = v5;
  return result;
}

uint64_t ComposeRecipientHandleAvailabilityAppEnumRepresentation.rawValue.getter()
{
  uint64_t v1 = 0x616C696176616E75;
  if (*v0 != 1) {
    uint64_t v1 = 0x6E776F6E6B6E75;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x6C62616C69617661;
  }
}

ContactsAutocomplete::ComposeRecipientHandleAvailabilityAppEnumRepresentation_optional sub_1BEF9BCE4(Swift::String *a1)
{
  return ComposeRecipientHandleAvailabilityAppEnumRepresentation.init(rawValue:)(*a1);
}

void sub_1BEF9BCF0(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xE900000000000065;
  unint64_t v4 = 0xEB00000000656C62;
  uint64_t v5 = 0x616C696176616E75;
  if (v2 != 1)
  {
    uint64_t v5 = 0x6E776F6E6B6E75;
    unint64_t v4 = 0xE700000000000000;
  }
  BOOL v6 = v2 == 0;
  if (*v1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0x6C62616C69617661;
  }
  if (!v6) {
    unint64_t v3 = v4;
  }
  *a1 = v7;
  a1[1] = v3;
}

uint64_t sub_1BEF9BD5C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1BEF9BD68(*a1, *a2);
}

uint64_t sub_1BEF9BD68(unsigned __int8 a1, unsigned __int8 a2)
{
  unint64_t v2 = 0xE900000000000065;
  uint64_t v3 = 0x6C62616C69617661;
  int v4 = a1;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v5 = 0x616C696176616E75;
    }
    else {
      uint64_t v5 = 0x6E776F6E6B6E75;
    }
    if (v4 == 1) {
      unint64_t v6 = 0xEB00000000656C62;
    }
    else {
      unint64_t v6 = 0xE700000000000000;
    }
    int v7 = a2;
    if (!a2) {
      goto LABEL_15;
    }
    goto LABEL_9;
  }
  uint64_t v5 = 0x6C62616C69617661;
  unint64_t v6 = 0xE900000000000065;
  int v7 = a2;
  if (a2)
  {
LABEL_9:
    if (v7 == 1) {
      uint64_t v3 = 0x616C696176616E75;
    }
    else {
      uint64_t v3 = 0x6E776F6E6B6E75;
    }
    if (v7 == 1) {
      unint64_t v2 = 0xEB00000000656C62;
    }
    else {
      unint64_t v2 = 0xE700000000000000;
    }
  }
LABEL_15:
  if (v5 == v3 && v6 == v2) {
    char v8 = 1;
  }
  else {
    char v8 = sub_1BEFB29B8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_1BEF9BE94()
{
  return sub_1BEFB2A48();
}

uint64_t sub_1BEF9BF44()
{
  sub_1BEFB26C8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BEF9BFE0()
{
  return sub_1BEFB2A48();
}

uint64_t static ComposeRecipientHandleAvailabilityAppEnumRepresentation.enumIdentifier.getter()
{
  swift_beginAccess();
  uint64_t v0 = qword_1EA139680;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t static ComposeRecipientHandleAvailabilityAppEnumRepresentation.enumIdentifier.setter(uint64_t a1, char *a2)
{
  qword_1EA139680 = a1;
  off_1EA139688 = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*static ComposeRecipientHandleAvailabilityAppEnumRepresentation.enumIdentifier.modify())()
{
  return j__swift_endAccess;
}

void *static ComposeRecipientHandleAvailabilityAppEnumRepresentation.allCases.getter()
{
  return &unk_1F1A2E708;
}

uint64_t sub_1BEF9C1A0()
{
  swift_beginAccess();
  uint64_t v0 = qword_1EA139680;
  swift_bridgeObjectRetain();
  return v0;
}

void sub_1BEF9C1F4(void *a1@<X8>)
{
  *a1 = &unk_1F1A2E730;
}

uint64_t sub_1BEF9C204()
{
  return sub_1BEFB2418();
}

uint64_t sub_1BEF9C234()
{
  return sub_1BEFB2438();
}

uint64_t sub_1BEF9C264()
{
  return sub_1BEFB2558() & 1;
}

uint64_t sub_1BEF9C2A8()
{
  return sub_1BEFB2428();
}

uint64_t sub_1BEF9C300()
{
  return sub_1BEFB2568() & 1;
}

uint64_t ComposeRecipientHandleAvailabilityAppEnumRepresentation.description.getter()
{
  return 46;
}

uint64_t sub_1BEF9C3F0()
{
  return 46;
}

unsigned char *sub_1BEF9C49C@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X8>)
{
  *a2 = 0x2020100u >> (8 * *result);
  return result;
}

unint64_t sub_1BEF9C4BC()
{
  unint64_t result = qword_1EA139690;
  if (!qword_1EA139690)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA139690);
  }
  return result;
}

unint64_t sub_1BEF9C514()
{
  unint64_t result = qword_1EA139698;
  if (!qword_1EA139698)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA139698);
  }
  return result;
}

unint64_t sub_1BEF9C56C()
{
  unint64_t result = qword_1EA1396A0;
  if (!qword_1EA1396A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA1396A0);
  }
  return result;
}

unint64_t sub_1BEF9C5C4()
{
  unint64_t result = qword_1EA1396A8;
  if (!qword_1EA1396A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA1396A8);
  }
  return result;
}

unint64_t sub_1BEF9C61C()
{
  unint64_t result = qword_1EA1396B0;
  if (!qword_1EA1396B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA1396B0);
  }
  return result;
}

uint64_t sub_1BEF9C670()
{
  return MEMORY[0x1E4FBB210];
}

unint64_t sub_1BEF9C680()
{
  unint64_t result = qword_1EA1396B8;
  if (!qword_1EA1396B8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA1396C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA1396B8);
  }
  return result;
}

unint64_t sub_1BEF9C6E0()
{
  unint64_t result = qword_1EA1396C8;
  if (!qword_1EA1396C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA1396C8);
  }
  return result;
}

unint64_t sub_1BEF9C738()
{
  unint64_t result = qword_1EA1396D0;
  if (!qword_1EA1396D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA1396D0);
  }
  return result;
}

unint64_t sub_1BEF9C790()
{
  unint64_t result = qword_1EA1396D8;
  if (!qword_1EA1396D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA1396D8);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for ComposeRecipientHandleAvailabilityAppEnumRepresentation(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1BEF9C8B0);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ComposeRecipientHandleAvailabilityAppEnumRepresentation()
{
  return &type metadata for ComposeRecipientHandleAvailabilityAppEnumRepresentation;
}

unint64_t sub_1BEF9C8E8()
{
  unint64_t result = qword_1EA1396E0;
  if (!qword_1EA1396E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA1396E0);
  }
  return result;
}

uint64_t sub_1BEF9C93C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1BEF9C948(*a1, *a2);
}

uint64_t sub_1BEF9C948(unsigned __int8 a1, unsigned __int8 a2)
{
  unint64_t v2 = 0xEA00000000006465;
  unint64_t v3 = 0x766C6F7365726E75;
  int v4 = a1;
  if (a1)
  {
    if (a1 == 1) {
      unint64_t v5 = 0xD000000000000011;
    }
    else {
      unint64_t v5 = 0x736552796C6C7566;
    }
    if (v4 == 1) {
      unint64_t v6 = 0x80000001BEFBFFB0;
    }
    else {
      unint64_t v6 = 0xED00006465766C6FLL;
    }
    int v7 = a2;
    if (!a2) {
      goto LABEL_15;
    }
    goto LABEL_9;
  }
  unint64_t v5 = 0x766C6F7365726E75;
  unint64_t v6 = 0xEA00000000006465;
  int v7 = a2;
  if (a2)
  {
LABEL_9:
    if (v7 == 1) {
      unint64_t v3 = 0xD000000000000011;
    }
    else {
      unint64_t v3 = 0x736552796C6C7566;
    }
    if (v7 == 1) {
      unint64_t v2 = 0x80000001BEFBFFB0;
    }
    else {
      unint64_t v2 = 0xED00006465766C6FLL;
    }
  }
LABEL_15:
  if (v5 == v3 && v6 == v2) {
    char v8 = 1;
  }
  else {
    char v8 = sub_1BEFB29B8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_1BEF9CA7C()
{
  return sub_1BEFB2A48();
}

uint64_t sub_1BEF9CB34()
{
  sub_1BEFB26C8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BEF9CBD8()
{
  return sub_1BEFB2A48();
}

uint64_t sub_1BEF9CC8C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1BEF9CED4();
  *a1 = result;
  return result;
}

void sub_1BEF9CCBC(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xEA00000000006465;
  unint64_t v4 = 0x80000001BEFBFFB0;
  unint64_t v5 = 0xD000000000000011;
  if (v2 != 1)
  {
    unint64_t v5 = 0x736552796C6C7566;
    unint64_t v4 = 0xED00006465766C6FLL;
  }
  BOOL v6 = v2 == 0;
  if (*v1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0x766C6F7365726E75;
  }
  if (!v6) {
    unint64_t v3 = v4;
  }
  *a1 = v7;
  a1[1] = v3;
}

uint64_t sub_1BEF9CD30()
{
  swift_beginAccess();
  uint64_t v0 = qword_1EA1396E8;
  swift_bridgeObjectRetain();
  return v0;
}

void sub_1BEF9CD84(void *a1@<X8>)
{
  *a1 = &unk_1F1A2E850;
}

uint64_t sub_1BEF9CD94()
{
  return sub_1BEFB2418();
}

uint64_t sub_1BEF9CDC4()
{
  return sub_1BEFB2438();
}

uint64_t sub_1BEF9CDF4()
{
  return sub_1BEFB2558() & 1;
}

uint64_t sub_1BEF9CE38()
{
  return sub_1BEFB2428();
}

uint64_t sub_1BEF9CE90()
{
  return sub_1BEFB2568() & 1;
}

uint64_t sub_1BEF9CED4()
{
  unint64_t v0 = sub_1BEFB2988();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3;
  }
  else {
    return v0;
  }
}

unint64_t sub_1BEF9CF24()
{
  unint64_t result = qword_1EA1396F8;
  if (!qword_1EA1396F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA1396F8);
  }
  return result;
}

unint64_t sub_1BEF9CF7C()
{
  unint64_t result = qword_1EA139700;
  if (!qword_1EA139700)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA139700);
  }
  return result;
}

unint64_t sub_1BEF9CFD4()
{
  unint64_t result = qword_1EA139708;
  if (!qword_1EA139708)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA139708);
  }
  return result;
}

unint64_t sub_1BEF9D02C()
{
  unint64_t result = qword_1EA139710;
  if (!qword_1EA139710)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA139710);
  }
  return result;
}

unint64_t sub_1BEF9D084()
{
  unint64_t result = qword_1EA139718;
  if (!qword_1EA139718)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA139718);
  }
  return result;
}

unint64_t sub_1BEF9D0DC()
{
  unint64_t result = qword_1EA139720;
  if (!qword_1EA139720)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA139728);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA139720);
  }
  return result;
}

unint64_t sub_1BEF9D13C()
{
  unint64_t result = qword_1EA139730;
  if (!qword_1EA139730)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA139730);
  }
  return result;
}

unint64_t sub_1BEF9D194()
{
  unint64_t result = qword_1EA139738;
  if (!qword_1EA139738)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA139738);
  }
  return result;
}

unint64_t sub_1BEF9D1EC()
{
  unint64_t result = qword_1EA139740;
  if (!qword_1EA139740)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA139740);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for ComposeRecipientStatusEnumRepresentation(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1BEF9D30CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ComposeRecipientStatusEnumRepresentation()
{
  return &type metadata for ComposeRecipientStatusEnumRepresentation;
}

unint64_t sub_1BEF9D344()
{
  unint64_t result = qword_1EA139748;
  if (!qword_1EA139748)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA139748);
  }
  return result;
}

uint64_t sub_1BEF9D398()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139750);
  swift_allocObject();
  uint64_t v0 = sub_1BEFB2548();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139758);
  swift_allocObject();
  sub_1BEFB2548();
  return v0;
}

unint64_t sub_1BEF9D424()
{
  return 0xD000000000000032;
}

unint64_t sub_1BEF9D440()
{
  return 0xD000000000000012;
}

uint64_t sub_1BEF9D45C()
{
  return sub_1BEFB2498();
}

uint64_t destroy for CompleteNameAppIntentRepresentation()
{
  swift_release();
  return swift_release();
}

void *_s20ContactsAutocomplete35CompleteNameAppIntentRepresentationVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for CompleteNameAppIntentRepresentation(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *assignWithTake for CompleteNameAppIntentRepresentation(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for CompleteNameAppIntentRepresentation(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CompleteNameAppIntentRepresentation(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CompleteNameAppIntentRepresentation()
{
  return &type metadata for CompleteNameAppIntentRepresentation;
}

uint64_t static ComposeRecipientHandleServiceAppEnumRepresentation.enumIdentifier.getter()
{
  swift_beginAccess();
  uint64_t v0 = qword_1EA139760;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t static ComposeRecipientHandleServiceAppEnumRepresentation.enumIdentifier.setter(uint64_t a1, char *a2)
{
  qword_1EA139760 = a1;
  off_1EA139768 = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*static ComposeRecipientHandleServiceAppEnumRepresentation.enumIdentifier.modify())()
{
  return j__swift_endAccess;
}

ContactsAutocomplete::ComposeRecipientHandleServiceAppEnumRepresentation_optional __swiftcall ComposeRecipientHandleServiceAppEnumRepresentation.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_1BEFB2988();
  result.value = swift_bridgeObjectRelease();
  char v5 = 4;
  if (v3 < 4) {
    char v5 = v3;
  }
  char *v2 = v5;
  return result;
}

void *static ComposeRecipientHandleServiceAppEnumRepresentation.allCases.getter()
{
  return &unk_1F1A2EA08;
}

uint64_t ComposeRecipientHandleServiceAppEnumRepresentation.rawValue.getter()
{
  uint64_t result = 0x6567617373654D69;
  switch(*v0)
  {
    case 1:
      uint64_t result = 5456722;
      break;
    case 2:
    case 3:
      uint64_t result = 0x656D695465636166;
      break;
    default:
      return result;
  }
  return result;
}

ContactsAutocomplete::ComposeRecipientHandleServiceAppEnumRepresentation_optional sub_1BEF9D824(Swift::String *a1)
{
  return ComposeRecipientHandleServiceAppEnumRepresentation.init(rawValue:)(*a1);
}

void sub_1BEF9D830(uint64_t *a1@<X8>)
{
  unint64_t v2 = 0xE800000000000000;
  uint64_t v3 = 0x6567617373654D69;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xE300000000000000;
      uint64_t v3 = 5456722;
      goto LABEL_3;
    case 2:
      unsigned int v4 = 1701079382;
      goto LABEL_6;
    case 3:
      unsigned int v4 = 1768191297;
LABEL_6:
      *a1 = 0x656D695465636166;
      a1[1] = v4 | 0xED00006F00000000;
      break;
    default:
LABEL_3:
      *a1 = v3;
      a1[1] = v2;
      break;
  }
}

uint64_t sub_1BEF9D8C0()
{
  swift_beginAccess();
  uint64_t v0 = qword_1EA139760;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_1BEF9D914(unsigned __int8 *a1, char *a2)
{
  return sub_1BEF9D920(*a1, *a2);
}

uint64_t sub_1BEF9D920(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 0x6567617373654D69;
  unint64_t v3 = 0xE800000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 0x6567617373654D69;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE300000000000000;
      uint64_t v5 = 5456722;
      break;
    case 2:
      uint64_t v5 = 0x656D695465636166;
      unsigned int v6 = 1701079382;
      goto LABEL_5;
    case 3:
      uint64_t v5 = 0x656D695465636166;
      unsigned int v6 = 1768191297;
LABEL_5:
      unint64_t v3 = v6 | 0xED00006F00000000;
      break;
    default:
      break;
  }
  unint64_t v7 = 0xE800000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v7 = 0xE300000000000000;
      if (v5 == 5456722) {
        goto LABEL_13;
      }
      goto LABEL_15;
    case 2:
      uint64_t v2 = 0x656D695465636166;
      unint64_t v7 = 0xED00006F65646956;
      goto LABEL_10;
    case 3:
      unint64_t v7 = 0xED00006F69647541;
      if (v5 == 0x656D695465636166) {
        goto LABEL_13;
      }
      goto LABEL_15;
    default:
LABEL_10:
      if (v5 != v2) {
        goto LABEL_15;
      }
LABEL_13:
      if (v3 == v7) {
        char v8 = 1;
      }
      else {
LABEL_15:
      }
        char v8 = sub_1BEFB29B8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v8 & 1;
  }
}

uint64_t sub_1BEF9DAC8()
{
  return sub_1BEFB2A48();
}

uint64_t sub_1BEF9DB9C()
{
  sub_1BEFB26C8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BEF9DC58()
{
  return sub_1BEFB2A48();
}

void sub_1BEF9DD28(void *a1@<X8>)
{
  *a1 = &unk_1F1A2EA30;
}

uint64_t sub_1BEF9DD38()
{
  return sub_1BEFB2418();
}

uint64_t sub_1BEF9DD68()
{
  return sub_1BEFB2438();
}

uint64_t sub_1BEF9DD98()
{
  return sub_1BEFB2558() & 1;
}

uint64_t sub_1BEF9DDDC()
{
  return sub_1BEFB2428();
}

uint64_t sub_1BEF9DE34()
{
  return sub_1BEFB2568() & 1;
}

uint64_t ComposeRecipientHandleServiceAppEnumRepresentation.description.getter()
{
  return 46;
}

uint64_t sub_1BEF9DF44()
{
  return 46;
}

unsigned char *sub_1BEF9E010@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X8>)
{
  *a2 = 0x3020100uLL >> (8 * *result);
  return result;
}

unint64_t sub_1BEF9E030()
{
  unint64_t result = qword_1EA139770;
  if (!qword_1EA139770)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA139770);
  }
  return result;
}

unint64_t sub_1BEF9E088()
{
  unint64_t result = qword_1EA139778;
  if (!qword_1EA139778)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA139778);
  }
  return result;
}

unint64_t sub_1BEF9E0E0()
{
  unint64_t result = qword_1EA139780;
  if (!qword_1EA139780)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA139780);
  }
  return result;
}

unint64_t sub_1BEF9E138()
{
  unint64_t result = qword_1EA139788;
  if (!qword_1EA139788)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA139788);
  }
  return result;
}

unint64_t sub_1BEF9E190()
{
  unint64_t result = qword_1EA139790;
  if (!qword_1EA139790)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA139790);
  }
  return result;
}

unint64_t sub_1BEF9E1E8()
{
  unint64_t result = qword_1EA139798;
  if (!qword_1EA139798)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA1397A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA139798);
  }
  return result;
}

unint64_t sub_1BEF9E248()
{
  unint64_t result = qword_1EA1397A8;
  if (!qword_1EA1397A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA1397A8);
  }
  return result;
}

unint64_t sub_1BEF9E2A0()
{
  unint64_t result = qword_1EA1397B0;
  if (!qword_1EA1397B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA1397B0);
  }
  return result;
}

unint64_t sub_1BEF9E2F8()
{
  unint64_t result = qword_1EA1397B8;
  if (!qword_1EA1397B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA1397B8);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for ComposeRecipientHandleServiceAppEnumRepresentation(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *unint64_t result = a2 + 3;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1BEF9E418);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ComposeRecipientHandleServiceAppEnumRepresentation()
{
  return &type metadata for ComposeRecipientHandleServiceAppEnumRepresentation;
}

unint64_t sub_1BEF9E450()
{
  unint64_t result = qword_1EA1397C0;
  if (!qword_1EA1397C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA1397C0);
  }
  return result;
}

uint64_t sub_1BEF9E4A4(unsigned __int8 *a1, char *a2)
{
  return sub_1BEF9E4B0(*a1, *a2);
}

uint64_t sub_1BEF9E4B0(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 0x636972656E6567;
  unint64_t v3 = 0xE700000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 0x636972656E6567;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE800000000000000;
      uint64_t v5 = 0x736567617373656DLL;
      break;
    case 2:
      unint64_t v3 = 0xE800000000000000;
      uint64_t v5 = 0x656D695465636166;
      break;
    case 3:
      unint64_t v3 = 0xE800000000000000;
      uint64_t v5 = 0x7261646E656C6163;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE700000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE800000000000000;
      if (v5 == 0x736567617373656DLL) {
        goto LABEL_12;
      }
      goto LABEL_14;
    case 2:
      unint64_t v6 = 0xE800000000000000;
      uint64_t v2 = 0x656D695465636166;
      goto LABEL_9;
    case 3:
      unint64_t v6 = 0xE800000000000000;
      if (v5 == 0x7261646E656C6163) {
        goto LABEL_12;
      }
      goto LABEL_14;
    default:
LABEL_9:
      if (v5 != v2) {
        goto LABEL_14;
      }
LABEL_12:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_14:
      }
        char v7 = sub_1BEFB29B8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_1BEF9E640()
{
  return sub_1BEFB2A48();
}

uint64_t sub_1BEF9E71C()
{
  sub_1BEFB26C8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BEF9E7E0()
{
  return sub_1BEFB2A48();
}

uint64_t sub_1BEF9E8B8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1BEF9EBFC();
  *a1 = result;
  return result;
}

void sub_1BEF9E8E8(uint64_t *a1@<X8>)
{
  unint64_t v2 = 0xE700000000000000;
  uint64_t v3 = 0x636972656E6567;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xE800000000000000;
      uint64_t v3 = 0x736567617373656DLL;
      goto LABEL_3;
    case 2:
      *a1 = 0x656D695465636166;
      a1[1] = 0xE800000000000000;
      break;
    case 3:
      *a1 = 0x7261646E656C6163;
      a1[1] = 0xE800000000000000;
      break;
    default:
LABEL_3:
      *a1 = v3;
      a1[1] = v2;
      break;
  }
}

uint64_t sub_1BEF9E984()
{
  swift_beginAccess();
  uint64_t v0 = *(void *)aClientappenum;
  swift_bridgeObjectRetain();
  return v0;
}

void sub_1BEF9E9D8(void *a1@<X8>)
{
  *a1 = &unk_1F1A2EB68;
}

uint64_t sub_1BEF9E9E8()
{
  return sub_1BEFB2418();
}

uint64_t sub_1BEF9EA18()
{
  return sub_1BEFB2438();
}

uint64_t sub_1BEF9EA48()
{
  return sub_1BEFB2558() & 1;
}

uint64_t sub_1BEF9EA8C()
{
  return sub_1BEFB2428();
}

uint64_t sub_1BEF9EAE4()
{
  return sub_1BEFB2568() & 1;
}

uint64_t sub_1BEF9EB28()
{
  return 46;
}

uint64_t sub_1BEF9EBFC()
{
  unint64_t v0 = sub_1BEFB2988();
  swift_bridgeObjectRelease();
  if (v0 >= 4) {
    return 4;
  }
  else {
    return v0;
  }
}

unint64_t sub_1BEF9EC4C()
{
  unint64_t result = qword_1EA1397D8;
  if (!qword_1EA1397D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA1397D8);
  }
  return result;
}

unint64_t sub_1BEF9ECA4()
{
  unint64_t result = qword_1EA1397E0;
  if (!qword_1EA1397E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA1397E0);
  }
  return result;
}

unint64_t sub_1BEF9ECFC()
{
  unint64_t result = qword_1EA1397E8;
  if (!qword_1EA1397E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA1397E8);
  }
  return result;
}

unint64_t sub_1BEF9ED54()
{
  unint64_t result = qword_1EA1397F0;
  if (!qword_1EA1397F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA1397F0);
  }
  return result;
}

unint64_t sub_1BEF9EDAC()
{
  unint64_t result = qword_1EA1397F8;
  if (!qword_1EA1397F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA1397F8);
  }
  return result;
}

unint64_t sub_1BEF9EE04()
{
  unint64_t result = qword_1EA139800;
  if (!qword_1EA139800)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA139808);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA139800);
  }
  return result;
}

unint64_t sub_1BEF9EE64()
{
  unint64_t result = qword_1EA139810;
  if (!qword_1EA139810)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA139810);
  }
  return result;
}

unint64_t sub_1BEF9EEBC()
{
  unint64_t result = qword_1EA139818;
  if (!qword_1EA139818)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA139818);
  }
  return result;
}

unint64_t sub_1BEF9EF14()
{
  unint64_t result = qword_1EA139820;
  if (!qword_1EA139820)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA139820);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for ComposeRecipientHandleClientAppEnumRepresentation(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *unint64_t result = a2 + 3;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1BEF9F034);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ComposeRecipientHandleClientAppEnumRepresentation()
{
  return &type metadata for ComposeRecipientHandleClientAppEnumRepresentation;
}

unint64_t sub_1BEF9F06C()
{
  unint64_t result = qword_1EA139828;
  if (!qword_1EA139828)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA139828);
  }
  return result;
}

uint64_t static ComposeRecipientHandleServiceAvailabilityAppEntityRepresentation.bundleIdentifier.getter()
{
  return sub_1BEF9A3F4((uint64_t *)&unk_1EA139830);
}

uint64_t static ComposeRecipientHandleServiceAvailabilityAppEntityRepresentation.bundleIdentifier.setter(uint64_t a1, uint64_t a2)
{
  return sub_1BEF9A458(a1, a2, qword_1EA139830, &qword_1EA139830[1]);
}

uint64_t (*static ComposeRecipientHandleServiceAvailabilityAppEntityRepresentation.bundleIdentifier.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t static ComposeRecipientHandleServiceAvailabilityAppEntityRepresentation.typeIdentifier.getter()
{
  return sub_1BEF9A3F4((uint64_t *)&unk_1EA139840);
}

uint64_t static ComposeRecipientHandleServiceAvailabilityAppEntityRepresentation.typeIdentifier.setter(uint64_t a1, uint64_t a2)
{
  return sub_1BEF9A458(a1, a2, qword_1EA139840, &qword_1EA139840[1]);
}

uint64_t (*static ComposeRecipientHandleServiceAvailabilityAppEntityRepresentation.typeIdentifier.modify())()
{
  return j__swift_endAccess;
}

void *sub_1BEF9F1B0@<X0>(void **a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = (*(void *(**)(uint64_t *__return_ptr))(class metadata base offset for ComposeRecipientHandleServiceAvailabilityAppEntityRepresentation
                                                            + **a1
                                                            + 16))(&v4);
  *a2 = v4;
  return result;
}

uint64_t sub_1BEF9F228(char *a1, void **a2)
{
  unint64_t v2 = *a2;
  char v4 = *a1;
  return (*(uint64_t (**)(char *))(class metadata base offset for ComposeRecipientHandleServiceAvailabilityAppEntityRepresentation
                                           + *v2
                                           + 24))(&v4);
}

uint64_t sub_1BEF9F29C()
{
  return sub_1BEF9F42C();
}

uint64_t sub_1BEF9F2A8()
{
  return sub_1BEF9F484();
}

uint64_t (*sub_1BEF9F2B4(void *a1))()
{
  int v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(void *)(v1 + qword_1EA139858);
  swift_retain();
  v3[5] = sub_1BEFB2508();
  return sub_1BEF9A68C;
}

uint64_t sub_1BEF9F328()
{
  return sub_1BEF9AA88();
}

void *sub_1BEF9F334@<X0>(void **a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = (*(void *(**)(uint64_t *__return_ptr))(class metadata base offset for ComposeRecipientHandleServiceAvailabilityAppEntityRepresentation
                                                            + **a1
                                                            + 48))(&v4);
  *a2 = v4;
  return result;
}

uint64_t sub_1BEF9F3AC(char *a1, void **a2)
{
  unint64_t v2 = *a2;
  char v4 = *a1;
  return (*(uint64_t (**)(char *))(class metadata base offset for ComposeRecipientHandleServiceAvailabilityAppEntityRepresentation
                                           + *v2
                                           + 56))(&v4);
}

uint64_t sub_1BEF9F420()
{
  return sub_1BEF9F42C();
}

uint64_t sub_1BEF9F42C()
{
  swift_retain();
  sub_1BEFB2518();
  return swift_release();
}

uint64_t sub_1BEF9F478()
{
  return sub_1BEF9F484();
}

uint64_t sub_1BEF9F484()
{
  return swift_release();
}

uint64_t (*sub_1BEF9F4D0(void *a1))()
{
  int v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(void *)(v1 + qword_1EA139868);
  swift_retain();
  v3[5] = sub_1BEFB2508();
  return sub_1BEF9A68C;
}

uint64_t sub_1BEF9F544()
{
  return sub_1BEF9AA88();
}

uint64_t ComposeRecipientHandleServiceAvailabilityAppEntityRepresentation.__allocating_init(_:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  uint64_t v3 = qword_1EA139858;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139850);
  swift_allocObject();
  swift_retain();
  *(void *)(v2 + v3) = sub_1BEFB24F8();
  uint64_t v4 = qword_1EA139868;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139860);
  swift_allocObject();
  *(void *)(v2 + v4) = sub_1BEFB24F8();
  swift_release();
  uint64_t v5 = sub_1BEFB2398();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v5);
  uint64_t v8 = sub_1BEFB23F8();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
  return v8;
}

uint64_t ComposeRecipientHandleServiceAvailabilityAppEntityRepresentation.init(_:)(uint64_t a1)
{
  uint64_t v3 = qword_1EA139858;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139850);
  swift_allocObject();
  swift_retain();
  *(void *)(v1 + v3) = sub_1BEFB24F8();
  uint64_t v4 = qword_1EA139868;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139860);
  swift_allocObject();
  *(void *)(v1 + v4) = sub_1BEFB24F8();
  swift_release();
  uint64_t v5 = sub_1BEFB2398();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v5);
  uint64_t v8 = sub_1BEFB23F8();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
  return v8;
}

uint64_t sub_1BEF9F848()
{
  swift_release();
  return swift_release();
}

uint64_t ComposeRecipientHandleServiceAvailabilityAppEntityRepresentation.deinit()
{
  uint64_t v0 = sub_1BEFB23E8();
  swift_release();
  swift_release();
  return v0;
}

uint64_t ComposeRecipientHandleServiceAvailabilityAppEntityRepresentation.__deallocating_deinit()
{
  uint64_t v0 = sub_1BEFB23E8();
  swift_release();
  swift_release();
  return MEMORY[0x1F4186488](v0, 32, 7);
}

uint64_t sub_1BEF9F930(uint64_t a1, uint64_t a2)
{
  return sub_1BEF9AFDC(a1, a2, qword_1EA139830);
}

uint64_t sub_1BEF9F940(uint64_t a1, uint64_t a2)
{
  return sub_1BEF9AFDC(a1, a2, qword_1EA139840);
}

uint64_t sub_1BEF9F950()
{
  return sub_1BEFB2568() & 1;
}

uint64_t sub_1BEF9F9A8()
{
  return sub_1BEFB2458();
}

uint64_t sub_1BEF9F9F0()
{
  return sub_1BEFB2558() & 1;
}

uint64_t ComposeRecipientHandleServiceAvailabilityAppEntityRepresentation.description.getter()
{
  uint64_t v1 = (*(void *(**)(void *__return_ptr))(class metadata base offset for ComposeRecipientHandleServiceAvailabilityAppEntityRepresentation
                                                       + *v0
                                                       + 16))(v6);
  if (LOBYTE(v6[0]) == 4)
  {
    unint64_t v2 = 0xEC00000029656369;
    uint64_t v3 = 0x76726573206F6E28;
  }
  else
  {
    uint64_t v1 = (void *)ComposeRecipientHandleServiceAppEnumRepresentation.description.getter();
    uint64_t v3 = (uint64_t)v1;
    unint64_t v2 = v4;
  }
  (*(void (**)(void *__return_ptr, void *))(class metadata base offset for ComposeRecipientHandleServiceAvailabilityAppEntityRepresentation
                                                         + *v0
                                                         + 48))(v6, v1);
  if (LOBYTE(v6[0]) != 3) {
    ComposeRecipientHandleAvailabilityAppEnumRepresentation.description.getter();
  }
  v6[0] = v3;
  v6[1] = v2;
  sub_1BEFB26D8();
  sub_1BEFB26D8();
  swift_bridgeObjectRelease();
  return v6[0];
}

uint64_t sub_1BEF9FBB8()
{
  return sub_1BEF9FDD8(&qword_1EA139870);
}

uint64_t type metadata accessor for ComposeRecipientHandleServiceAvailabilityAppEntityRepresentation()
{
  uint64_t result = qword_1EA13CC00;
  if (!qword_1EA13CC00) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1BEF9FC38()
{
  return sub_1BEF9FDD8(&qword_1EA139878);
}

uint64_t sub_1BEF9FC6C()
{
  return sub_1BEF9FDD8(&qword_1EA139880);
}

uint64_t sub_1BEF9FCA0()
{
  return sub_1BEF9FDD8(&qword_1EA139888);
}

uint64_t sub_1BEF9FCD4()
{
  return sub_1BEF9FDD8(&qword_1EA139890);
}

uint64_t sub_1BEF9FD08()
{
  return sub_1BEF9FDD8(&qword_1EA139898);
}

uint64_t sub_1BEF9FD3C()
{
  return sub_1BEF9FDD8(&qword_1EA1398A0);
}

uint64_t sub_1BEF9FD70()
{
  return sub_1BEF9FDD8(&qword_1EA1398A8);
}

uint64_t sub_1BEF9FDA4()
{
  return sub_1BEF9FDD8(&qword_1EA1398B0);
}

uint64_t sub_1BEF9FDD8(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for ComposeRecipientHandleServiceAvailabilityAppEntityRepresentation();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1BEF9FE1C()
{
  return ComposeRecipientHandleServiceAvailabilityAppEntityRepresentation.description.getter();
}

uint64_t sub_1BEF9FE40()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for ComposeRecipientHandleServiceAvailabilityAppEntityRepresentation(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for ComposeRecipientHandleServiceAvailabilityAppEntityRepresentation);
}

uint64_t dispatch thunk of ComposeRecipientHandleServiceAvailabilityAppEntityRepresentation.service.getter()
{
  return (*(uint64_t (**)(void))(class metadata base offset for ComposeRecipientHandleServiceAvailabilityAppEntityRepresentation
                              + *v0
                              + 16))();
}

uint64_t dispatch thunk of ComposeRecipientHandleServiceAvailabilityAppEntityRepresentation.service.setter()
{
  return (*(uint64_t (**)(void))(class metadata base offset for ComposeRecipientHandleServiceAvailabilityAppEntityRepresentation
                              + *v0
                              + 24))();
}

uint64_t dispatch thunk of ComposeRecipientHandleServiceAvailabilityAppEntityRepresentation.service.modify()
{
  return (*(uint64_t (**)(void))(class metadata base offset for ComposeRecipientHandleServiceAvailabilityAppEntityRepresentation
                              + *v0
                              + 32))();
}

uint64_t dispatch thunk of ComposeRecipientHandleServiceAvailabilityAppEntityRepresentation.$service.getter()
{
  return (*(uint64_t (**)(void))(class metadata base offset for ComposeRecipientHandleServiceAvailabilityAppEntityRepresentation
                              + *v0
                              + 40))();
}

uint64_t dispatch thunk of ComposeRecipientHandleServiceAvailabilityAppEntityRepresentation.availability.getter()
{
  return (*(uint64_t (**)(void))(class metadata base offset for ComposeRecipientHandleServiceAvailabilityAppEntityRepresentation
                              + *v0
                              + 48))();
}

uint64_t dispatch thunk of ComposeRecipientHandleServiceAvailabilityAppEntityRepresentation.availability.setter()
{
  return (*(uint64_t (**)(void))(class metadata base offset for ComposeRecipientHandleServiceAvailabilityAppEntityRepresentation
                              + *v0
                              + 56))();
}

uint64_t dispatch thunk of ComposeRecipientHandleServiceAvailabilityAppEntityRepresentation.availability.modify()
{
  return (*(uint64_t (**)(void))(class metadata base offset for ComposeRecipientHandleServiceAvailabilityAppEntityRepresentation
                              + *v0
                              + 64))();
}

uint64_t dispatch thunk of ComposeRecipientHandleServiceAvailabilityAppEntityRepresentation.$availability.getter()
{
  return (*(uint64_t (**)(void))(class metadata base offset for ComposeRecipientHandleServiceAvailabilityAppEntityRepresentation
                              + *v0
                              + 72))();
}

uint64_t sub_1BEFA00A8()
{
  return type metadata accessor for ComposeRecipientHandleServiceAvailabilityAppEntityRepresentation();
}

uint64_t sub_1BEFA00B0()
{
  return sub_1BEF9A918();
}

uint64_t sub_1BEFA00BC()
{
  return sub_1BEF9A96C();
}

uint64_t (*sub_1BEFA00C8(void *a1))()
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(void *)(v1 + qword_1EA1398D8);
  swift_retain();
  v3[5] = sub_1BEFB2508();
  return sub_1BEF9A68C;
}

uint64_t sub_1BEFA013C()
{
  return sub_1BEF9AA88();
}

uint64_t sub_1BEFA0148()
{
  return sub_1BEF9A918();
}

uint64_t sub_1BEFA0154()
{
  return sub_1BEF9A96C();
}

uint64_t (*sub_1BEFA0160(void *a1))()
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(void *)(v1 + qword_1EA1398E0);
  swift_retain();
  v3[5] = sub_1BEFB2508();
  return sub_1BEF9A68C;
}

uint64_t sub_1BEFA01D4()
{
  return sub_1BEF9AA88();
}

uint64_t sub_1BEFA01E0(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  uint64_t v3 = qword_1EA1398D8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139618);
  swift_allocObject();
  swift_retain();
  *(void *)(v2 + v3) = sub_1BEFB24F8();
  uint64_t v4 = qword_1EA1398E0;
  swift_allocObject();
  *(void *)(v2 + v4) = sub_1BEFB24F8();
  swift_release();
  uint64_t v5 = sub_1BEFB2398();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v5);
  uint64_t v8 = sub_1BEFB23F8();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
  return v8;
}

uint64_t sub_1BEFA0360()
{
  swift_release();
  return swift_release();
}

uint64_t sub_1BEFA03A0()
{
  uint64_t v0 = sub_1BEFB23E8();
  swift_release();
  swift_release();
  return MEMORY[0x1F4186488](v0, 32, 7);
}

uint64_t sub_1BEFA0400()
{
  return sub_1BEFA06E0(&qword_1EA1398E8);
}

uint64_t type metadata accessor for ComposeRecipientContactIdentifierAppEntityRepresentation()
{
  uint64_t result = qword_1EA13D110;
  if (!qword_1EA13D110) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1BEFA0480()
{
  return sub_1BEFA06E0(&qword_1EA1398F0);
}

uint64_t sub_1BEFA04B4()
{
  return sub_1BEFA06E0(&qword_1EA1398F8);
}

uint64_t sub_1BEFA04E8()
{
  return sub_1BEFA06E0(&qword_1EA139900);
}

uint64_t sub_1BEFA051C()
{
  return sub_1BEFA06E0(&qword_1EA139908);
}

uint64_t sub_1BEFA0550()
{
  return sub_1BEFA06E0(&qword_1EA139910);
}

uint64_t sub_1BEFA0584()
{
  return sub_1BEFA06E0(&qword_1EA139918);
}

uint64_t sub_1BEFA05B8(uint64_t a1, uint64_t a2)
{
  return sub_1BEF9AFDC(a1, a2, (uint64_t *)&unk_1EA1398B8);
}

uint64_t sub_1BEFA05C8(uint64_t a1, uint64_t a2)
{
  return sub_1BEF9AFDC(a1, a2, (uint64_t *)&unk_1EA1398C8);
}

uint64_t sub_1BEFA05D8()
{
  return sub_1BEFB2568() & 1;
}

uint64_t sub_1BEFA0630()
{
  return sub_1BEFA06E0(&qword_1EA139920);
}

uint64_t sub_1BEFA0664()
{
  return sub_1BEFB2458();
}

uint64_t sub_1BEFA06AC()
{
  return sub_1BEFA06E0(&qword_1EA139928);
}

uint64_t sub_1BEFA06E0(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for ComposeRecipientContactIdentifierAppEntityRepresentation();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1BEFA0724()
{
  return sub_1BEFB2558() & 1;
}

uint64_t sub_1BEFA077C()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1BEFA07CC()
{
  return type metadata accessor for ComposeRecipientContactIdentifierAppEntityRepresentation();
}

uint64_t sub_1BEFA07D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139950);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BEFA083C()
{
  swift_retain();
  sub_1BEFB2518();
  return swift_release();
}

uint64_t sub_1BEFA088C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139950);
  MEMORY[0x1F4188790](v2 - 8);
  sub_1BEFA07D4(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  swift_retain();
  sub_1BEFB2528();
  swift_release();
  return sub_1BEFA135C(a1, &qword_1EA139950);
}

uint64_t (*sub_1BEFA0940(void *a1))()
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(void *)(v1 + qword_1EA139960);
  swift_retain();
  v3[5] = sub_1BEFB2508();
  return sub_1BEF9A68C;
}

uint64_t sub_1BEFA09B4()
{
  return sub_1BEF9AA88();
}

uint64_t sub_1BEFA09C0()
{
  return sub_1BEFA0D90();
}

uint64_t sub_1BEFA09CC()
{
  return sub_1BEFA0CAC();
}

uint64_t (*sub_1BEFA09D8(void *a1))()
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(void *)(v1 + qword_1EA139970);
  swift_retain();
  v3[5] = sub_1BEFB2508();
  return sub_1BEF9A68C;
}

uint64_t sub_1BEFA0A4C()
{
  return sub_1BEF9AA88();
}

uint64_t sub_1BEFA0A58()
{
  swift_retain();
  sub_1BEFB2518();
  swift_release();
  return v1;
}

uint64_t sub_1BEFA0AA8()
{
  return swift_release();
}

uint64_t (*sub_1BEFA0AFC(void *a1))()
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(void *)(v1 + qword_1EA139980);
  swift_retain();
  v3[5] = sub_1BEFB2508();
  return sub_1BEF9A68C;
}

uint64_t sub_1BEFA0B70()
{
  return sub_1BEF9AA88();
}

uint64_t sub_1BEFA0B7C()
{
  swift_retain();
  sub_1BEFB2518();
  swift_release();
  return v1;
}

uint64_t sub_1BEFA0BC8()
{
  return swift_release();
}

uint64_t (*sub_1BEFA0C14(void *a1))()
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(void *)(v1 + qword_1EA139990);
  swift_retain();
  v3[5] = sub_1BEFB2508();
  return sub_1BEF9A68C;
}

uint64_t sub_1BEFA0C88()
{
  return sub_1BEF9AA88();
}

uint64_t sub_1BEFA0C94()
{
  return sub_1BEFA0D90();
}

uint64_t sub_1BEFA0CA0()
{
  return sub_1BEFA0CAC();
}

uint64_t sub_1BEFA0CAC()
{
  return swift_release();
}

uint64_t (*sub_1BEFA0D04(void *a1))()
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(void *)(v1 + qword_1EA1399A0);
  swift_retain();
  v3[5] = sub_1BEFB2508();
  return sub_1BEF9A68C;
}

uint64_t sub_1BEFA0D78()
{
  return sub_1BEF9AA88();
}

uint64_t sub_1BEFA0D84()
{
  return sub_1BEFA0D90();
}

uint64_t sub_1BEFA0D90()
{
  swift_retain();
  sub_1BEFB2518();
  swift_release();
  return v1;
}

uint64_t sub_1BEFA0DD8()
{
  return swift_release();
}

uint64_t (*sub_1BEFA0E24(void *a1))()
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(void *)(v1 + qword_1EA1399B0);
  swift_retain();
  v3[5] = sub_1BEFB2508();
  return sub_1BEF9A68C;
}

uint64_t sub_1BEFA0E98()
{
  return sub_1BEF9AA88();
}

uint64_t sub_1BEFA0EA4(uint64_t a1)
{
  return sub_1BEFA0EE0(a1);
}

uint64_t sub_1BEFA0EE0(uint64_t a1)
{
  uint64_t v3 = qword_1EA139960;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139958);
  swift_allocObject();
  swift_retain();
  *(void *)(v1 + v3) = sub_1BEFB24F8();
  uint64_t v4 = qword_1EA139970;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139968);
  swift_allocObject();
  *(void *)(v1 + v4) = sub_1BEFB24F8();
  uint64_t v5 = qword_1EA139980;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139978);
  swift_allocObject();
  *(void *)(v1 + v5) = sub_1BEFB24F8();
  uint64_t v6 = qword_1EA139990;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139988);
  swift_allocObject();
  *(void *)(v1 + v6) = sub_1BEFB24F8();
  uint64_t v7 = qword_1EA1399A0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139998);
  swift_allocObject();
  *(void *)(v1 + v7) = sub_1BEFB24F8();
  uint64_t v8 = qword_1EA1399B0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA1399A8);
  swift_allocObject();
  *(void *)(v1 + v8) = sub_1BEFB24F8();
  swift_release();
  uint64_t v9 = sub_1BEFB2398();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v14 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v9);
  uint64_t v12 = sub_1BEFB23F8();
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a1, v9);
  return v12;
}

uint64_t sub_1BEFA1124()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_1BEFA11A4()
{
  uint64_t v0 = sub_1BEFB23E8();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x1F4186488](v0, 64, 7);
}

uint64_t sub_1BEFA1244(uint64_t a1, uint64_t a2)
{
  return sub_1BEF9AFDC(a1, a2, (uint64_t *)&unk_1EA139930);
}

uint64_t sub_1BEFA1254(uint64_t a1, uint64_t a2)
{
  return sub_1BEF9AFDC(a1, a2, (uint64_t *)&unk_1EA139940);
}

uint64_t sub_1BEFA1264()
{
  return sub_1BEFB2568() & 1;
}

uint64_t sub_1BEFA12BC()
{
  return sub_1BEFB2458();
}

uint64_t sub_1BEFA1304()
{
  return sub_1BEFB2558() & 1;
}

uint64_t sub_1BEFA135C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_1BEFA13B8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v96 = a2;
  uint64_t v3 = sub_1BEFB25A8();
  uint64_t v97 = *(void *)(v3 - 8);
  uint64_t v98 = v3;
  MEMORY[0x1F4188790](v3);
  v100 = (char *)&v91 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v92 = type metadata accessor for ComposeRecipient.Identifier(0);
  uint64_t v5 = MEMORY[0x1F4188790](v92);
  uint64_t v95 = (uint64_t)&v91 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  v99 = (uint64_t *)((char *)&v91 - v7);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139950);
  uint64_t v9 = MEMORY[0x1F4188790](v8 - 8);
  uint64_t v11 = (char *)&v91 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = &unk_1EA13F000;
  (*(void (**)(uint64_t))(qword_1EA13F7A8 + *a1 + 48))(v9);
  uint64_t v13 = sub_1BEFA1E0C((uint64_t)v11);
  uint64_t v93 = v14;
  uint64_t v94 = v13;
  uint64_t v15 = sub_1BEFA135C((uint64_t)v11, &qword_1EA139950);
  uint64_t v16 = (*(uint64_t (**)(uint64_t))(qword_1EA13F7A8 + *a1 + 176))(v15);
  if (v16)
  {
    unint64_t v17 = (void *)swift_retain();
    sub_1BEFA3660(v17, (uint64_t)&v103);
    uint64_t v18 = v103;
    uint64_t v19 = v104;
    char v20 = v105;
    uint64_t v21 = v106;
    uint64_t v102 = v107;
    uint64_t v22 = v108;
    id v23 = sub_1BEF8B188(0, 1, 1, MEMORY[0x1E4FBC860]);
    unint64_t v25 = *((void *)v23 + 2);
    unint64_t v24 = *((void *)v23 + 3);
    os_log_type_t v26 = v23;
    if (v25 >= v24 >> 1) {
      os_log_type_t v26 = sub_1BEF8B188((char *)(v24 > 1), v25 + 1, 1, v23);
    }
    *((void *)v26 + 2) = v25 + 1;
    BOOL v27 = &v26[48 * v25];
    *((void *)v27 + 4) = v18;
    *((void *)v27 + 5) = v19;
    v27[48] = v20;
    uint64_t v28 = v102;
    *((void *)v27 + 7) = v21;
    *((void *)v27 + 8) = v28;
    *((void *)v27 + 9) = v22;
    uint64_t v16 = swift_release();
    uint64_t v12 = (void *)&unk_1EA13F000;
  }
  else
  {
    os_log_type_t v26 = (char *)MEMORY[0x1E4FBC860];
  }
  unint64_t result = (*(uint64_t (**)(uint64_t))(v12[245] + *a1 + 208))(v16);
  if (result)
  {
    unint64_t v30 = result;
    if (result >> 62)
    {
      unint64_t result = sub_1BEFB2938();
      uint64_t v31 = result;
    }
    else
    {
      uint64_t v31 = *(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    v91 = a1;
    unint64_t v101 = v30;
    if (v31)
    {
      if (v31 < 1)
      {
        __break(1u);
        goto LABEL_43;
      }
      if ((v30 & 0xC000000000000001) != 0)
      {
        uint64_t v32 = 0;
        uint64_t v102 = v31;
        do
        {
          MEMORY[0x1C18A0B20](v32, v101);
          uint64_t v33 = (void *)swift_retain();
          sub_1BEFA3660(v33, (uint64_t)&v103);
          uint64_t v35 = v103;
          uint64_t v34 = v104;
          char v36 = v105;
          uint64_t v38 = v106;
          uint64_t v37 = v107;
          uint64_t v39 = v108;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            os_log_type_t v26 = sub_1BEF8B188(0, *((void *)v26 + 2) + 1, 1, v26);
          }
          unint64_t v41 = *((void *)v26 + 2);
          unint64_t v40 = *((void *)v26 + 3);
          uint64_t v42 = v26;
          if (v41 >= v40 >> 1) {
            uint64_t v42 = sub_1BEF8B188((char *)(v40 > 1), v41 + 1, 1, v26);
          }
          ++v32;
          *((void *)v42 + 2) = v41 + 1;
          os_log_type_t v26 = v42;
          uint64_t v43 = &v42[48 * v41];
          *((void *)v43 + 4) = v35;
          *((void *)v43 + 5) = v34;
          v43[48] = v36;
          *((void *)v43 + 7) = v38;
          *((void *)v43 + 8) = v37;
          *((void *)v43 + 9) = v39;
          swift_unknownObjectRelease();
        }
        while (v102 != v32);
      }
      else
      {
        unint64_t v44 = v30 + 32;
        do
        {
          uint64_t v45 = (void *)swift_retain_n();
          sub_1BEFA3660(v45, (uint64_t)&v103);
          uint64_t v46 = v104;
          uint64_t v102 = v103;
          char v47 = v105;
          uint64_t v48 = v106;
          uint64_t v49 = v107;
          uint64_t v50 = v108;
          uint64_t v51 = v31;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            os_log_type_t v26 = sub_1BEF8B188(0, *((void *)v26 + 2) + 1, 1, v26);
          }
          unint64_t v53 = *((void *)v26 + 2);
          unint64_t v52 = *((void *)v26 + 3);
          uint64_t v54 = v26;
          if (v53 >= v52 >> 1) {
            uint64_t v54 = sub_1BEF8B188((char *)(v52 > 1), v53 + 1, 1, v26);
          }
          *((void *)v54 + 2) = v53 + 1;
          os_log_type_t v26 = v54;
          uint64_t v55 = &v54[48 * v53];
          *((void *)v55 + 4) = v102;
          *((void *)v55 + 5) = v46;
          v55[48] = v47;
          *((void *)v55 + 7) = v48;
          *((void *)v55 + 8) = v49;
          *((void *)v55 + 9) = v50;
          swift_release();
          v44 += 8;
          uint64_t v31 = v51 - 1;
        }
        while (v51 != 1);
      }
    }
    swift_bridgeObjectRelease();
    a1 = v91;
    uint64_t v12 = &unk_1EA13F000;
  }
  unint64_t v56 = (void *)(*(uint64_t (**)(void))(v12[245] + *a1 + 80))();
  if (!v56)
  {
    sub_1BEFB22F8();
    uint64_t v66 = swift_storeEnumTagMultiPayload();
    goto LABEL_34;
  }
  int64_t v57 = v56;
  uint64_t v58 = v26;
  uint64_t v59 = *(uint64_t (**)(uint64_t))(qword_1EA13F798 + *v56 + 16);
  uint64_t v60 = swift_retain();
  uint64_t v61 = v59(v60);
  if (!v62)
  {
    (*(void (**)(uint64_t))(qword_1EA13F798 + *v57 + 48))(v61);
    if (!v67)
    {
      sub_1BEFB22F8();
      swift_release();
      goto LABEL_29;
    }
    uint64_t v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA1399C8);
    MEMORY[0x1F4188790](v68 - 8);
    v70 = (char *)&v91 - ((v69 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_1BEFB22D8();
    swift_bridgeObjectRelease();
    uint64_t v71 = sub_1BEFB2308();
    uint64_t v72 = *(void *)(v71 - 8);
    unint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v72 + 48))(v70, 1, v71);
    if (result != 1)
    {
      swift_release();
      (*(void (**)(uint64_t *, char *, uint64_t))(v72 + 32))(v99, v70, v71);
      swift_storeEnumTagMultiPayload();
      uint64_t v66 = swift_release();
      uint64_t v12 = &unk_1EA13F000;
      goto LABEL_34;
    }
LABEL_43:
    __break(1u);
    return result;
  }
  uint64_t v63 = v61;
  uint64_t v64 = v62;
  swift_release();
  uint64_t v65 = v99;
  uint64_t *v99 = v63;
  v65[1] = v64;
LABEL_29:
  swift_storeEnumTagMultiPayload();
  uint64_t v66 = swift_release();
  os_log_type_t v26 = v58;
LABEL_34:
  v73 = *(uint64_t (**)(void))(v12[245] + *a1 + 112);
  uint64_t v74 = ((uint64_t (*)(uint64_t))v73)(v66);
  if (v75) {
    uint64_t v74 = 0;
  }
  ComposeRecipient.Source.init(rawValue:)(v74, &v103);
  uint64_t v76 = v103;
  sub_1BEFB2598();
  swift_retain_n();
  v77 = sub_1BEFB2588();
  os_log_type_t v78 = sub_1BEFB27D8();
  if (os_log_type_enabled(v77, v78))
  {
    uint64_t v79 = swift_slowAlloc();
    uint64_t v80 = swift_slowAlloc();
    v109[0] = v80;
    *(_DWORD *)uint64_t v79 = 136315394;
    uint64_t v102 = (uint64_t)v26;
    uint64_t v103 = v73();
    LOBYTE(v104) = v81 & 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA1399B8);
    uint64_t v82 = sub_1BEFB26B8();
    uint64_t v103 = sub_1BEF946CC(v82, v83, v109);
    sub_1BEFB2828();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v79 + 12) = 2080;
    uint64_t v103 = v76;
    sub_1BEFA24D0();
    uint64_t v84 = sub_1BEFB2998();
    uint64_t v103 = sub_1BEF946CC(v84, v85, v109);
    os_log_type_t v26 = (char *)v102;
    sub_1BEFB2828();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BEF57000, v77, v78, "Representation (%s) --> Recipient (%s)", (uint8_t *)v79, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1C18A1630](v80, -1, -1);
    MEMORY[0x1C18A1630](v79, -1, -1);
  }
  else
  {
    swift_release_n();
  }

  v86 = v99;
  uint64_t v87 = v95;
  sub_1BEFA2410((uint64_t)v99, v95);
  uint64_t v103 = v76;
  uint64_t v88 = sub_1BEFB2308();
  MEMORY[0x1F4188790](v88 - 8);
  v90 = (char *)&v91 - ((v89 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BEF8CDF8();
  ComposeRecipient.init(id:name:handles:contactIdentifier:source:)((uint64_t)v90, v94, v93, (uint64_t)v26, v87, &v103, v96);
  swift_release();
  (*(void (**)(char *, uint64_t))(v97 + 8))(v100, v98);
  return sub_1BEFA2474((uint64_t)v86);
}

uint64_t sub_1BEFA1E0C(uint64_t a1)
{
  uint64_t v2 = sub_1BEFB2278();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139950);
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v8 = (char *)v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BEFA07D4(a1, (uint64_t)v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 1, v2) == 1)
  {
    sub_1BEFA135C((uint64_t)v8, &qword_1EA139950);
    return 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, v8, v2);
  uint64_t v9 = sub_1BEFB2258();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BEFB2268();
  int v13 = (*(uint64_t (**)(char *, uint64_t))(v10 + 88))(v12, v9);
  if (MEMORY[0x1E4F18300] && v13 == *MEMORY[0x1E4F18300])
  {
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    (*(void (**)(char *, uint64_t))(v10 + 96))(v12, v9);
    return *(void *)v12;
  }
  else if (MEMORY[0x1E4F18308] && v13 == *MEMORY[0x1E4F18308])
  {
    (*(void (**)(char *, uint64_t))(v10 + 96))(v12, v9);
    uint64_t v15 = sub_1BEFB2298();
    uint64_t v16 = *(void *)(v15 - 8);
    MEMORY[0x1F4188790](v15);
    uint64_t v18 = (char *)v26 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v18, v12, v15);
    uint64_t v14 = sub_1BEFB2288();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  else
  {
    if (!MEMORY[0x1E4F18318] || v13 != *MEMORY[0x1E4F18318])
    {
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
      return 0;
    }
    uint64_t v19 = sub_1BEFB22B8();
    v26[2] = v26;
    MEMORY[0x1F4188790](v19 - 8);
    uint64_t v20 = sub_1BEFB2678();
    v26[1] = v26;
    MEMORY[0x1F4188790](v20 - 8);
    sub_1BEFB2668();
    uint64_t v21 = sub_1BEFB2328();
    MEMORY[0x1F4188790](v21 - 8);
    sub_1BEFB2318();
    uint64_t v22 = sub_1BEFB22A8();
    MEMORY[0x1F4188790](v22);
    (*(void (**)(char *, void))(v24 + 104))((char *)v26 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x1E4F275D8]);
    sub_1BEFB22C8();
    uint64_t v14 = sub_1BEFB26A8();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return v14;
}

uint64_t sub_1BEFA2410(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ComposeRecipient.Identifier(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BEFA2474(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ComposeRecipient.Identifier(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1BEFA24D0()
{
  unint64_t result = qword_1EA1399C0;
  if (!qword_1EA1399C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA1399C0);
  }
  return result;
}

uint64_t sub_1BEFA2524()
{
  return sub_1BEFA2744(&qword_1EA1399D0);
}

uint64_t type metadata accessor for ComposeRecipientAppEntityRepresentation()
{
  uint64_t result = qword_1EA13D620;
  if (!qword_1EA13D620) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1BEFA25A4()
{
  return sub_1BEFA2744(&qword_1EA1399D8);
}

uint64_t sub_1BEFA25D8()
{
  return sub_1BEFA2744(&qword_1EA1399E0);
}

uint64_t sub_1BEFA260C()
{
  return sub_1BEFA2744(&qword_1EA1399E8);
}

uint64_t sub_1BEFA2640()
{
  return sub_1BEFA2744(&qword_1EA1399F0);
}

uint64_t sub_1BEFA2674()
{
  return sub_1BEFA2744(&qword_1EA1399F8);
}

uint64_t sub_1BEFA26A8()
{
  return sub_1BEFA2744(&qword_1EA139A00);
}

uint64_t sub_1BEFA26DC()
{
  return sub_1BEFA2744((unint64_t *)&qword_1EA1395B8);
}

uint64_t sub_1BEFA2710()
{
  return sub_1BEFA2744(&qword_1EA139A08);
}

uint64_t sub_1BEFA2744(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for ComposeRecipientAppEntityRepresentation();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1BEFA2788()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1BEFA27E0()
{
  return type metadata accessor for ComposeRecipientAppEntityRepresentation();
}

uint64_t static ComposeRecipientHandleAppEntityRepresentation.bundleIdentifier.getter()
{
  return sub_1BEF9A3F4((uint64_t *)&unk_1EA139A10);
}

uint64_t static ComposeRecipientHandleAppEntityRepresentation.bundleIdentifier.setter(uint64_t a1, uint64_t a2)
{
  return sub_1BEF9A458(a1, a2, qword_1EA139A10, &qword_1EA139A10[1]);
}

uint64_t (*static ComposeRecipientHandleAppEntityRepresentation.bundleIdentifier.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t static ComposeRecipientHandleAppEntityRepresentation.typeIdentifier.getter()
{
  return sub_1BEF9A3F4((uint64_t *)&unk_1EA139A20);
}

uint64_t static ComposeRecipientHandleAppEntityRepresentation.typeIdentifier.setter(uint64_t a1, uint64_t a2)
{
  return sub_1BEF9A458(a1, a2, qword_1EA139A20, &qword_1EA139A20[1]);
}

uint64_t (*static ComposeRecipientHandleAppEntityRepresentation.typeIdentifier.modify())()
{
  return j__swift_endAccess;
}

uint64_t sub_1BEFA28D8@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(class metadata base offset for ComposeRecipientHandleAppEntityRepresentation
                                + **a1
                                + 24))();
  *a2 = result;
  return result;
}

uint64_t sub_1BEFA2940(uint64_t a1, void **a2)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))(class metadata base offset for ComposeRecipientHandleAppEntityRepresentation
                                         + **a2
                                         + 32);
  uint64_t v3 = swift_retain();
  return v2(v3);
}

uint64_t sub_1BEFA29B0()
{
  return sub_1BEFA0D90();
}

uint64_t sub_1BEFA29BC()
{
  return swift_release();
}

uint64_t (*sub_1BEFA2A18(void *a1))()
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(void *)(v1 + qword_1EA139A38);
  swift_retain();
  v3[5] = sub_1BEFB2508();
  return sub_1BEF9A68C;
}

uint64_t sub_1BEFA2A8C()
{
  return sub_1BEF9AA88();
}

uint64_t sub_1BEFA2A98@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(class metadata base offset for ComposeRecipientHandleAppEntityRepresentation
                                + **a1
                                + 56))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_1BEFA2B00(uint64_t *a1, void **a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(class metadata base offset for ComposeRecipientHandleAppEntityRepresentation
                                                  + **a2
                                                  + 64);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

uint64_t sub_1BEFA2B84()
{
  swift_retain();
  sub_1BEFB2518();
  swift_release();
  return v1;
}

uint64_t sub_1BEFA2BD0()
{
  return swift_release();
}

uint64_t (*sub_1BEFA2C1C(void *a1))()
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(void *)(v1 + qword_1EA139A40);
  swift_retain();
  v3[5] = sub_1BEFB2508();
  return sub_1BEF9A68C;
}

uint64_t sub_1BEFA2C90()
{
  return sub_1BEF9AA88();
}

uint64_t sub_1BEFA2C9C@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(class metadata base offset for ComposeRecipientHandleAppEntityRepresentation
                                + **a1
                                + 88))();
  *a2 = result;
  return result;
}

uint64_t sub_1BEFA2D04(uint64_t a1, void **a2)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))(class metadata base offset for ComposeRecipientHandleAppEntityRepresentation
                                         + **a2
                                         + 96);
  uint64_t v3 = swift_bridgeObjectRetain();
  return v2(v3);
}

uint64_t sub_1BEFA2D74()
{
  return sub_1BEFA0D90();
}

uint64_t sub_1BEFA2D80()
{
  return swift_release();
}

uint64_t (*sub_1BEFA2DCC(void *a1))()
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(void *)(v1 + qword_1EA139A50);
  swift_retain();
  v3[5] = sub_1BEFB2508();
  return sub_1BEF9A68C;
}

uint64_t sub_1BEFA2E40()
{
  return sub_1BEF9AA88();
}

uint64_t ComposeRecipientHandleAppEntityRepresentation.__allocating_init(_:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  uint64_t v3 = qword_1EA139A38;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139A30);
  swift_allocObject();
  swift_retain();
  *(void *)(v2 + v3) = sub_1BEFB24F8();
  uint64_t v4 = qword_1EA139A40;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139618);
  swift_allocObject();
  *(void *)(v2 + v4) = sub_1BEFB24F8();
  uint64_t v5 = qword_1EA139A50;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139A48);
  swift_allocObject();
  *(void *)(v2 + v5) = sub_1BEFB24F8();
  swift_release();
  uint64_t v6 = sub_1BEFB2398();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  uint64_t v9 = sub_1BEFB23F8();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
  return v9;
}

uint64_t ComposeRecipientHandleAppEntityRepresentation.init(_:)(uint64_t a1)
{
  uint64_t v3 = qword_1EA139A38;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139A30);
  swift_allocObject();
  swift_retain();
  *(void *)(v1 + v3) = sub_1BEFB24F8();
  uint64_t v4 = qword_1EA139A40;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139618);
  swift_allocObject();
  *(void *)(v1 + v4) = sub_1BEFB24F8();
  uint64_t v5 = qword_1EA139A50;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139A48);
  swift_allocObject();
  *(void *)(v1 + v5) = sub_1BEFB24F8();
  swift_release();
  uint64_t v6 = sub_1BEFB2398();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  uint64_t v9 = sub_1BEFB23F8();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
  return v9;
}

uint64_t sub_1BEFA31AC()
{
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t ComposeRecipientHandleAppEntityRepresentation.deinit()
{
  uint64_t v0 = sub_1BEFB23E8();
  swift_release();
  swift_release();
  swift_release();
  return v0;
}

uint64_t ComposeRecipientHandleAppEntityRepresentation.__deallocating_deinit()
{
  uint64_t v0 = sub_1BEFB23E8();
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x1F4186488](v0, 40, 7);
}

uint64_t sub_1BEFA32C4(uint64_t a1, uint64_t a2)
{
  return sub_1BEF9AFDC(a1, a2, qword_1EA139A10);
}

uint64_t sub_1BEFA32D4(uint64_t a1, uint64_t a2)
{
  return sub_1BEF9AFDC(a1, a2, qword_1EA139A20);
}

uint64_t sub_1BEFA32E4()
{
  return sub_1BEFB2568() & 1;
}

uint64_t sub_1BEFA333C()
{
  return sub_1BEFB2458();
}

uint64_t sub_1BEFA3384()
{
  return sub_1BEFB2558() & 1;
}

uint64_t ComposeRecipientHandleAppEntityRepresentation.description.getter()
{
  uint64_t v8 = sub_1BEFB2A68();
  uint64_t v1 = sub_1BEFB26D8();
  if ((*(uint64_t (**)(uint64_t))(class metadata base offset for ComposeRecipientHandleAppEntityRepresentation
                                          + *v0
                                          + 24))(v1))
  {
    ComposeRecipientHandleValueAppEntityRepresentation.description.getter();
    swift_release();
  }
  sub_1BEFB26D8();
  swift_bridgeObjectRelease();
  uint64_t v2 = sub_1BEFB26D8();
  (*(void (**)(uint64_t))(class metadata base offset for ComposeRecipientHandleAppEntityRepresentation
                                  + *v0
                                  + 56))(v2);
  sub_1BEFB26D8();
  swift_bridgeObjectRelease();
  uint64_t v3 = sub_1BEFB26D8();
  uint64_t v4 = (*(uint64_t (**)(uint64_t))(class metadata base offset for ComposeRecipientHandleAppEntityRepresentation
                                          + *v0
                                          + 88))(v3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = type metadata accessor for ComposeRecipientHandleServiceAvailabilityAppEntityRepresentation();
    MEMORY[0x1C18A09B0](v5, v6);
    swift_bridgeObjectRelease();
  }
  sub_1BEFB26D8();
  swift_bridgeObjectRelease();
  sub_1BEFB26D8();
  return v8;
}

uint64_t sub_1BEFA363C()
{
  return ComposeRecipientHandleAppEntityRepresentation.description.getter();
}

uint64_t sub_1BEFA3660@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_1BEFA9388();
  uint64_t v4 = (void *)(*(uint64_t (**)(void))(class metadata base offset for ComposeRecipientHandleAppEntityRepresentation
                                      + *a1
                                      + 24))();
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = (*(uint64_t (**)(void))(class metadata base offset for ComposeRecipientHandleValueAppEntityRepresentation
                              + *v4
                              + 24))();
    if (v7)
    {
      uint64_t v8 = v6;
      uint64_t v9 = v7;
      unsigned __int8 v10 = 0;
LABEL_7:
      swift_release();
      goto LABEL_8;
    }
    uint64_t v11 = (*(uint64_t (**)(uint64_t))(class metadata base offset for ComposeRecipientHandleValueAppEntityRepresentation
                                             + *v5
                                             + 56))(v6);
    if (v12)
    {
      uint64_t v8 = v11;
      uint64_t v9 = v12;
      unsigned __int8 v10 = 1;
      goto LABEL_7;
    }
    uint64_t v8 = (*(uint64_t (**)(uint64_t))(class metadata base offset for ComposeRecipientHandleValueAppEntityRepresentation
                                            + *v5
                                            + 88))(v11);
    uint64_t v9 = v24;
    swift_release();
    if (!v9)
    {
      uint64_t v8 = 0;
      uint64_t v9 = 0xE000000000000000;
    }
    unsigned __int8 v10 = 2;
  }
  else
  {
    uint64_t v8 = 0;
    unsigned __int8 v10 = 2;
    uint64_t v9 = 0xE000000000000000;
  }
LABEL_8:
  int v13 = *(uint64_t (**)(uint64_t))(class metadata base offset for ComposeRecipientHandleAppEntityRepresentation
                                          + *a1
                                          + 56);
  uint64_t v14 = sub_1BEF8CFD8(v8, v9, v10);
  uint64_t v15 = v13(v14);
  sub_1BEFA3970(v15, v16, &v25);
  swift_bridgeObjectRelease();
  uint64_t v17 = v25;
  unint64_t v18 = v26;
  uint64_t v19 = *(uint64_t (**)(uint64_t))(class metadata base offset for ComposeRecipientHandleAppEntityRepresentation
                                          + *a1
                                          + 88);
  uint64_t v20 = sub_1BEF8CFF0(v25, v26);
  unint64_t v21 = v19(v20);
  unint64_t v22 = sub_1BEFA3EE0(v21);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_1BEF8CFD8(v8, v9, v10);
  sub_1BEF8CFF0(v17, v18);
  sub_1BEFA41E0(v17, v18);
  sub_1BEFA41F4(v8, v9, v10);
  sub_1BEFA41F4(v8, v9, v10);
  sub_1BEFA41E0(v17, v18);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a2 = v8;
  *(void *)(a2 + 8) = v9;
  *(unsigned char *)(a2 + 16) = v10;
  *(void *)(a2 + 24) = v17;
  *(void *)(a2 + 32) = v18;
  *(void *)(a2 + 40) = v22;
  return result;
}

uint64_t sub_1BEFA3970@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  if (a2)
  {
    uint64_t v5 = result;
    sub_1BEFA420C();
    swift_bridgeObjectRetain();
    if (!sub_1BEFB2848())
    {
      uint64_t result = swift_bridgeObjectRelease();
      *a3 = 0;
      a3[1] = 0;
      return result;
    }
    if (sub_1BEFB2848())
    {
      if (sub_1BEFB2848())
      {
        if (sub_1BEFB2848())
        {
          if (sub_1BEFB2848())
          {
            if (sub_1BEFB2848())
            {
              if (sub_1BEFB2848())
              {
                if (sub_1BEFB2848())
                {
                  if (sub_1BEFB2848())
                  {
                    if (sub_1BEFB2848())
                    {
                      if (sub_1BEFB2848())
                      {
                        if (sub_1BEFB2848())
                        {
                          uint64_t result = sub_1BEFB2848();
                          if (result)
                          {
                            *a3 = v5;
                            a3[1] = a2;
                            return result;
                          }
                          uint64_t result = swift_bridgeObjectRelease();
                          long long v6 = xmmword_1BEFB9030;
                        }
                        else
                        {
                          uint64_t result = swift_bridgeObjectRelease();
                          long long v6 = xmmword_1BEFB9040;
                        }
                      }
                      else
                      {
                        uint64_t result = swift_bridgeObjectRelease();
                        long long v6 = xmmword_1BEFB9050;
                      }
                    }
                    else
                    {
                      uint64_t result = swift_bridgeObjectRelease();
                      long long v6 = xmmword_1BEFB9060;
                    }
                  }
                  else
                  {
                    uint64_t result = swift_bridgeObjectRelease();
                    long long v6 = xmmword_1BEFB9070;
                  }
                }
                else
                {
                  uint64_t result = swift_bridgeObjectRelease();
                  long long v6 = xmmword_1BEFB9080;
                }
              }
              else
              {
                uint64_t result = swift_bridgeObjectRelease();
                long long v6 = xmmword_1BEFB9090;
              }
            }
            else
            {
              uint64_t result = swift_bridgeObjectRelease();
              long long v6 = xmmword_1BEFB90A0;
            }
          }
          else
          {
            uint64_t result = swift_bridgeObjectRelease();
            long long v6 = xmmword_1BEFB90B0;
          }
        }
        else
        {
          uint64_t result = swift_bridgeObjectRelease();
          long long v6 = xmmword_1BEFB90C0;
        }
      }
      else
      {
        uint64_t result = swift_bridgeObjectRelease();
        long long v6 = xmmword_1BEFB90D0;
      }
    }
    else
    {
      uint64_t result = swift_bridgeObjectRelease();
      long long v6 = xmmword_1BEFB90E0;
    }
  }
  else
  {
    long long v6 = xmmword_1BEFB90F0;
  }
  *(_OWORD *)a3 = v6;
  return result;
}

unint64_t sub_1BEFA3DE4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA139E80);
  uint64_t v2 = (void *)sub_1BEFB2968();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (char *)(a1 + 33);
  while (1)
  {
    unsigned __int8 v5 = *(v4 - 1);
    char v6 = *v4;
    unint64_t result = sub_1BEF94E40(v5);
    if (v8) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(unsigned char *)(v2[6] + result) = v5;
    *(unsigned char *)(v2[7] + result) = v6;
    uint64_t v9 = v2[2];
    BOOL v10 = __OFADD__(v9, 1);
    uint64_t v11 = v9 + 1;
    if (v10) {
      goto LABEL_11;
    }
    v4 += 2;
    v2[2] = v11;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_1BEFA3EE0(unint64_t a1)
{
  if (a1)
  {
    unint64_t v1 = a1;
    swift_bridgeObjectRetain();
    uint64_t v2 = (void *)sub_1BEFA3DE4(MEMORY[0x1E4FBC860]);
    if (v1 >> 62)
    {
LABEL_29:
      swift_bridgeObjectRetain();
      uint64_t v3 = sub_1BEFB2938();
      swift_bridgeObjectRelease();
      if (v3) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v3 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v3)
      {
LABEL_4:
        unint64_t v24 = v1;
        unint64_t v25 = v1 & 0xC000000000000001;
        uint64_t v4 = 4;
        do
        {
          uint64_t v5 = v4 - 4;
          if (v25)
          {
            char v6 = (void *)MEMORY[0x1C18A0B20](v4 - 4, v1);
            uint64_t v7 = v4 - 3;
            if (__OFADD__(v5, 1)) {
              goto LABEL_26;
            }
          }
          else
          {
            char v6 = *(void **)(v1 + 8 * v4);
            swift_retain();
            uint64_t v7 = v4 - 3;
            if (__OFADD__(v5, 1))
            {
LABEL_26:
              __break(1u);
LABEL_27:
              __break(1u);
LABEL_28:
              __break(1u);
              goto LABEL_29;
            }
          }
          uint64_t v26 = v7;
          (*(void (**)(char *__return_ptr))(class metadata base offset for ComposeRecipientHandleServiceAvailabilityAppEntityRepresentation
                                                     + *v6
                                                     + 16))((char *)&v27 + 2);
          char v8 = sub_1BEF9E010((unsigned char *)&v27 + 2, (unsigned char *)&v27 + 3);
          unsigned __int8 v9 = BYTE3(v27);
          (*(void (**)(uint64_t *__return_ptr, unsigned char *))(class metadata base offset for ComposeRecipientHandleServiceAvailabilityAppEntityRepresentation
                                                                 + *v6
                                                                 + 48))(&v27, v8);
          sub_1BEF9C49C(&v27, (unsigned char *)&v27 + 1);
          unint64_t v1 = BYTE1(v27);
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          unint64_t v12 = sub_1BEF94E40(v9);
          uint64_t v13 = v2[2];
          BOOL v14 = (v11 & 1) == 0;
          uint64_t v15 = v13 + v14;
          if (__OFADD__(v13, v14)) {
            goto LABEL_27;
          }
          char v16 = v11;
          if (v2[3] >= v15)
          {
            if (isUniquelyReferenced_nonNull_native)
            {
              if (v11) {
                goto LABEL_5;
              }
            }
            else
            {
              sub_1BEF96648();
              if (v16) {
                goto LABEL_5;
              }
            }
          }
          else
          {
            sub_1BEF95A64(v15, isUniquelyReferenced_nonNull_native);
            unint64_t v17 = sub_1BEF94E40(v9);
            if ((v16 & 1) != (v18 & 1))
            {
              unint64_t result = sub_1BEFB29D8();
              __break(1u);
              return result;
            }
            unint64_t v12 = v17;
            if (v16)
            {
LABEL_5:
              *(unsigned char *)(v2[7] + v12) = v1;
              goto LABEL_6;
            }
          }
          v2[(v12 >> 6) + 8] |= 1 << v12;
          *(unsigned char *)(v2[6] + v12) = v9;
          *(unsigned char *)(v2[7] + v12) = v1;
          uint64_t v19 = v2[2];
          BOOL v20 = __OFADD__(v19, 1);
          uint64_t v21 = v19 + 1;
          if (v20) {
            goto LABEL_28;
          }
          v2[2] = v21;
LABEL_6:
          swift_release();
          swift_bridgeObjectRelease();
          ++v4;
          unint64_t v1 = v24;
        }
        while (v26 != v3);
      }
    }
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  uint64_t v22 = MEMORY[0x1E4FBC860];
  return sub_1BEFA3DE4(v22);
}

uint64_t sub_1BEFA41E0(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xD) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1BEFA41F4(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 2u) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_1BEFA420C()
{
  unint64_t result = qword_1EA139A58;
  if (!qword_1EA139A58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA139A58);
  }
  return result;
}

uint64_t sub_1BEFA4260()
{
  return sub_1BEFA4480(&qword_1EA139A60);
}

uint64_t type metadata accessor for ComposeRecipientHandleAppEntityRepresentation()
{
  uint64_t result = qword_1EA13DBB0;
  if (!qword_1EA13DBB0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1BEFA42E0()
{
  return sub_1BEFA4480(&qword_1EA139A68);
}

uint64_t sub_1BEFA4314()
{
  return sub_1BEFA4480(&qword_1EA139A70);
}

uint64_t sub_1BEFA4348()
{
  return sub_1BEFA4480(&qword_1EA139A78);
}

uint64_t sub_1BEFA437C()
{
  return sub_1BEFA4480(&qword_1EA139A80);
}

uint64_t sub_1BEFA43B0()
{
  return sub_1BEFA4480(&qword_1EA139A88);
}

uint64_t sub_1BEFA43E4()
{
  return sub_1BEFA4480(&qword_1EA139A90);
}

uint64_t sub_1BEFA4418()
{
  return sub_1BEFA4480(&qword_1EA139A98);
}

uint64_t sub_1BEFA444C()
{
  return sub_1BEFA4480(&qword_1EA139AA0);
}

uint64_t sub_1BEFA4480(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for ComposeRecipientHandleAppEntityRepresentation();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1BEFA44C4()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for ComposeRecipientHandleAppEntityRepresentation(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for ComposeRecipientHandleAppEntityRepresentation);
}

uint64_t dispatch thunk of ComposeRecipientHandleAppEntityRepresentation.value.getter()
{
  return (*(uint64_t (**)(void))(class metadata base offset for ComposeRecipientHandleAppEntityRepresentation + *v0 + 24))();
}

uint64_t dispatch thunk of ComposeRecipientHandleAppEntityRepresentation.value.setter()
{
  return (*(uint64_t (**)(void))(class metadata base offset for ComposeRecipientHandleAppEntityRepresentation + *v0 + 32))();
}

uint64_t dispatch thunk of ComposeRecipientHandleAppEntityRepresentation.value.modify()
{
  return (*(uint64_t (**)(void))(class metadata base offset for ComposeRecipientHandleAppEntityRepresentation + *v0 + 40))();
}

uint64_t dispatch thunk of ComposeRecipientHandleAppEntityRepresentation.$value.getter()
{
  return (*(uint64_t (**)(void))(class metadata base offset for ComposeRecipientHandleAppEntityRepresentation + *v0 + 48))();
}

uint64_t dispatch thunk of ComposeRecipientHandleAppEntityRepresentation.label.getter()
{
  return (*(uint64_t (**)(void))(class metadata base offset for ComposeRecipientHandleAppEntityRepresentation + *v0 + 56))();
}

uint64_t dispatch thunk of ComposeRecipientHandleAppEntityRepresentation.label.setter()
{
  return (*(uint64_t (**)(void))(class metadata base offset for ComposeRecipientHandleAppEntityRepresentation + *v0 + 64))();
}

uint64_t dispatch thunk of ComposeRecipientHandleAppEntityRepresentation.label.modify()
{
  return (*(uint64_t (**)(void))(class metadata base offset for ComposeRecipientHandleAppEntityRepresentation + *v0 + 72))();
}

uint64_t dispatch thunk of ComposeRecipientHandleAppEntityRepresentation.$label.getter()
{
  return (*(uint64_t (**)(void))(class metadata base offset for ComposeRecipientHandleAppEntityRepresentation + *v0 + 80))();
}

uint64_t dispatch thunk of ComposeRecipientHandleAppEntityRepresentation.availability.getter()
{
  return (*(uint64_t (**)(void))(class metadata base offset for ComposeRecipientHandleAppEntityRepresentation + *v0 + 88))();
}

uint64_t dispatch thunk of ComposeRecipientHandleAppEntityRepresentation.availability.setter()
{
  return (*(uint64_t (**)(void))(class metadata base offset for ComposeRecipientHandleAppEntityRepresentation + *v0 + 96))();
}

uint64_t dispatch thunk of ComposeRecipientHandleAppEntityRepresentation.availability.modify()
{
  return (*(uint64_t (**)(void))(class metadata base offset for ComposeRecipientHandleAppEntityRepresentation + *v0 + 104))();
}

uint64_t dispatch thunk of ComposeRecipientHandleAppEntityRepresentation.$availability.getter()
{
  return (*(uint64_t (**)(void))(class metadata base offset for ComposeRecipientHandleAppEntityRepresentation + *v0 + 112))();
}

uint64_t sub_1BEFA4830()
{
  return type metadata accessor for ComposeRecipientHandleAppEntityRepresentation();
}

unint64_t sub_1BEFA4838()
{
  unint64_t result = qword_1EA139AA8;
  if (!qword_1EA139AA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA139AA8);
  }
  return result;
}

uint64_t HandleAvailability.HandleStatus.handle.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t HandleAvailability.HandleStatus.handle.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*HandleAvailability.HandleStatus.handle.modify())()
{
  return nullsub_1;
}

void HandleAvailability.HandleStatus.service.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 16);
}

unsigned char *HandleAvailability.HandleStatus.service.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 16) = *result;
  return result;
}

uint64_t (*HandleAvailability.HandleStatus.service.modify())()
{
  return nullsub_1;
}

void HandleAvailability.HandleStatus.status.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 17);
}

unsigned char *HandleAvailability.HandleStatus.status.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 17) = *result;
  return result;
}

uint64_t (*HandleAvailability.HandleStatus.status.modify())()
{
  return nullsub_1;
}

uint64_t HandleAvailability.RemoteIntentLookup.__allocating_init(clientLabel:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  sub_1BEFB2598();
  uint64_t v5 = (void *)(v4 + OBJC_IVAR____TtCV20ContactsAutocomplete18HandleAvailability18RemoteIntentLookup_clientLabel);
  void *v5 = a1;
  v5[1] = a2;
  return v4;
}

uint64_t HandleAvailability.RemoteIntentLookup.init(clientLabel:)(uint64_t a1, uint64_t a2)
{
  sub_1BEFB2598();
  uint64_t v5 = (void *)(v2 + OBJC_IVAR____TtCV20ContactsAutocomplete18HandleAvailability18RemoteIntentLookup_clientLabel);
  void *v5 = a1;
  v5[1] = a2;
  return v2;
}

uint64_t sub_1BEFA4A90()
{
  *(void *)(v1 + 56) = v0;
  return MEMORY[0x1F4188298](sub_1BEFA4AB0, 0, 0);
}

uint64_t sub_1BEFA4AB0()
{
  id v1 = objc_msgSend(self, sel_defaultEnvironment);
  unint64_t v2 = sub_1BEF9A32C();
  uint64_t v3 = MEMORY[0x1E4F4AD10];
  v0[5] = v2;
  v0[6] = v3;
  v0[2] = v1;
  uint64_t v4 = sub_1BEFB24D8();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = swift_task_alloc();
  uint64_t v7 = *(void *)(sub_1BEFB24A8() - 8);
  swift_task_alloc();
  (*(void (**)(void))(v7 + 104))();
  sub_1BEFB24C8();
  swift_task_dealloc();
  uint64_t v8 = sub_1BEFB24B8();
  uint64_t v10 = v9;
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v6, v4);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 2));
  swift_task_dealloc();
  char v11 = (uint64_t (*)(uint64_t, uint64_t))v0[1];
  return v11(v8, v10);
}

uint64_t sub_1BEFA4CC0(uint64_t a1, uint64_t a2, char a3)
{
  *(void *)(v4 + 104) = a2;
  *(void *)(v4 + 112) = v3;
  *(unsigned char *)(v4 + 233) = a3;
  *(void *)(v4 + 96) = a1;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 120) = v5;
  void *v5 = v4;
  v5[1] = sub_1BEFA4D74;
  v5[7] = v3;
  return MEMORY[0x1F4188298](sub_1BEFA4AB0, 0, 0);
}

uint64_t sub_1BEFA4D74(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)*v2;
  v3[5] = v2;
  v3[6] = a1;
  v3[7] = a2;
  v3[16] = a1;
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_1BEFA4E7C, 0, 0);
}

uint64_t sub_1BEFA4E7C()
{
  if (*(void *)(v0 + 128))
  {
    uint64_t v27 = *(void *)(v0 + 56);
    char v1 = *(unsigned char *)(v0 + 233);
    uint64_t v2 = *(void *)(v0 + 104);
    int64_t v3 = *(void *)(v2 + 16);
    uint64_t v4 = MEMORY[0x1E4FBC860];
    if (v3)
    {
      uint64_t v28 = MEMORY[0x1E4FBC860];
      sub_1BEFA6FD8(0, v3, 0);
      uint64_t v4 = v28;
      uint64_t v5 = (char *)(v2 + 32);
      do
      {
        char v7 = *v5++;
        char v6 = v7;
        unint64_t v9 = *(void *)(v28 + 16);
        unint64_t v8 = *(void *)(v28 + 24);
        if (v9 >= v8 >> 1) {
          sub_1BEFA6FD8(v8 > 1, v9 + 1, 1);
        }
        *(void *)(v28 + 16) = v9 + 1;
        *(unsigned char *)(v28 + v9 + 32) = 0x2030100u >> (8 * v6);
        --v3;
      }
      while (v3);
    }
    *(void *)(v0 + 64) = *(void *)(v0 + 96);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139750);
    swift_allocObject();
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_1BEFB2548();
    *(void *)(v0 + 136) = v10;
    *(void *)(v0 + 72) = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139B10);
    swift_allocObject();
    uint64_t v11 = sub_1BEFB2548();
    *(void *)(v0 + 144) = v11;
    *(unsigned char *)(v0 + 232) = v1 ^ 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139B18);
    swift_allocObject();
    uint64_t v12 = sub_1BEFB2548();
    *(void *)(v0 + 152) = v12;
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139B20);
    *(void *)(v0 + 160) = v13;
    *(void *)(v0 + 168) = *(void *)(v13 - 8);
    uint64_t v14 = swift_task_alloc();
    *(void *)(v0 + 176) = v14;
    uint64_t ObjectType = swift_getObjectType();
    *(void *)(v0 + 16) = v10;
    *(void *)(v0 + 24) = v11;
    *(void *)(v0 + 32) = v12;
    uint64_t v16 = sub_1BEFB2488();
    *(void *)(v0 + 184) = v16;
    *(void *)(v0 + 192) = *(void *)(v16 - 8);
    uint64_t v17 = swift_task_alloc();
    *(void *)(v0 + 200) = v17;
    sub_1BEFA6FF8();
    sub_1BEFA704C();
    sub_1BEF9990C();
    sub_1BEFB2348();
    swift_allocObject();
    uint64_t v18 = sub_1BEFB2338();
    *(void *)(v0 + 208) = v18;
    uint64_t v19 = (void *)swift_task_alloc();
    *(void *)(v0 + 216) = v19;
    *uint64_t v19 = v0;
    v19[1] = sub_1BEFA52C4;
    uint64_t v20 = MEMORY[0x1E4F4AC80];
    return MEMORY[0x1F4108A60](v14, v0 + 16, v17, v18, v20, ObjectType, &_s18RemoteIntentLookupC43FetchHandleAvailabilityIntentRepresentationVN, v27);
  }
  else
  {
    os_log_type_t v21 = sub_1BEFB27C8();
    uint64_t v22 = sub_1BEFB2588();
    if (os_log_type_enabled(v22, v21))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v23 = 0;
      _os_log_impl(&dword_1BEF57000, v22, v21, "Could not create intent dispatcher", v23, 2u);
      MEMORY[0x1C18A1630](v23, -1, -1);
    }

    unint64_t v24 = *(uint64_t (**)(uint64_t))(v0 + 8);
    uint64_t v25 = MEMORY[0x1E4FBC860];
    return v24(v25);
  }
}

uint64_t sub_1BEFA52C4()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 200);
  uint64_t v3 = *(void *)(*(void *)v1 + 192);
  uint64_t v4 = *(void *)(*(void *)v1 + 184);
  *(void *)(*(void *)v1 + 224) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_release();
  if (v0)
  {
    uint64_t v5 = sub_1BEFA5940;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v5 = sub_1BEFA5460;
  }
  return MEMORY[0x1F4188298](v5, 0, 0);
}

uint64_t sub_1BEFA5460()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139B48);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = swift_task_alloc();
  sub_1BEFB2448();
  sub_1BEFB24E8();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v3, v1);
  unint64_t v4 = v0[11];
  if (v4)
  {
    swift_task_dealloc();
    if (v4 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_1BEFB2938();
      swift_bridgeObjectRelease();
      if (v5)
      {
LABEL_4:
        uint64_t v35 = MEMORY[0x1E4FBC860];
        sub_1BEFA6FB8(0, v5 & ~(v5 >> 63), 0);
        if (v5 < 0)
        {
          __break(1u);
        }
        else
        {
          uint64_t v6 = 0;
          uint64_t v7 = v35;
          uint64_t v32 = v0;
          unint64_t v33 = v4 & 0xC000000000000001;
          unint64_t v8 = &unk_1EA13F000;
          while (2)
          {
            if (v33)
            {
              unint64_t v9 = (void *)MEMORY[0x1C18A0B20](v6, v4);
            }
            else
            {
              unint64_t v9 = *(void **)(v4 + 8 * v6 + 32);
              swift_retain();
            }
            uint64_t v10 = (*(uint64_t (**)(void))(v8[249] + *v9 + 24))();
            if (v11)
            {
              uint64_t v12 = v10;
              uint64_t v13 = v11;
              uint64_t v34 = v6 + 1;
              char v14 = (*(uint64_t (**)(void))(v8[249] + *v9 + 56))();
              unint64_t v15 = v4;
              switch(v14)
              {
                case 1:
                  char v14 = 1;
                  goto LABEL_14;
                case 2:
                  char v14 = 3;
                  goto LABEL_14;
                case 3:
                  char v14 = 2;
                  goto LABEL_14;
                case 4:
                  goto LABEL_31;
                default:
LABEL_14:
                  uint64_t v16 = v8;
                  char v17 = (*(uint64_t (**)(void))(v8[249] + *v9 + 88))();
                  if (v17 == 3) {
                    goto LABEL_30;
                  }
                  char v18 = v17;
                  swift_release();
                  unint64_t v20 = *(void *)(v7 + 16);
                  unint64_t v19 = *(void *)(v7 + 24);
                  uint64_t v21 = v7;
                  if (v20 >= v19 >> 1)
                  {
                    sub_1BEFA6FB8(v19 > 1, v20 + 1, 1);
                    uint64_t v21 = v7;
                  }
                  *(void *)(v21 + 16) = v20 + 1;
                  uint64_t v22 = v21 + 24 * v20;
                  *(void *)(v22 + 32) = v12;
                  *(void *)(v22 + 40) = v13;
                  *(unsigned char *)(v22 + 48) = v14;
                  *(unsigned char *)(v22 + 49) = v18;
                  uint64_t v6 = v34;
                  unint64_t v4 = v15;
                  uint64_t v7 = v21;
                  unint64_t v8 = v16;
                  if (v5 != v34) {
                    continue;
                  }
                  uint64_t v0 = v32;
                  swift_release();
                  swift_release();
                  swift_release();
                  swift_unknownObjectRelease();
                  break;
              }
              goto LABEL_24;
            }
            break;
          }
        }
        __break(1u);
LABEL_30:
        __break(1u);
LABEL_31:
        __break(1u);
        JUMPOUT(0x1BEFA592CLL);
      }
    }
    else
    {
      uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v5) {
        goto LABEL_4;
      }
    }
    swift_release();
    swift_release();
    swift_release();
    swift_unknownObjectRelease();
    uint64_t v7 = MEMORY[0x1E4FBC860];
LABEL_24:
    (*(void (**)(void, void))(v0[21] + 8))(v0[22], v0[20]);
    swift_bridgeObjectRelease();
    goto LABEL_25;
  }
  swift_task_dealloc();
  os_log_type_t v23 = sub_1BEFB27A8();
  unint64_t v24 = sub_1BEFB2588();
  os_log_type_t v25 = v23;
  if (os_log_type_enabled(v24, v23))
  {
    uint64_t v26 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v26 = 0;
    _os_log_impl(&dword_1BEF57000, v24, v25, "No values were returned from the intent execution", v26, 2u);
    MEMORY[0x1C18A1630](v26, -1, -1);
  }
  uint64_t v28 = v0[21];
  uint64_t v27 = v0[22];
  uint64_t v29 = v0[20];

  swift_release();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v27, v29);
  uint64_t v7 = MEMORY[0x1E4FBC860];
LABEL_25:
  swift_task_dealloc();
  unint64_t v30 = (uint64_t (*)(uint64_t))v0[1];
  return v30(v7);
}

uint64_t sub_1BEFA5940()
{
  uint64_t v1 = *(void **)(v0 + 224);
  swift_release();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  id v2 = v1;
  id v3 = v1;
  unint64_t v4 = sub_1BEFB2588();
  os_log_type_t v5 = sub_1BEFB27C8();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = *(void **)(v0 + 224);
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    unint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 138412290;
    id v9 = v6;
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 80) = v10;
    sub_1BEFB2828();
    void *v8 = v10;

    _os_log_impl(&dword_1BEF57000, v4, v5, "Error executing intent: %@", v7, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139440);
    swift_arrayDestroy();
    MEMORY[0x1C18A1630](v8, -1, -1);
    MEMORY[0x1C18A1630](v7, -1, -1);
  }
  else
  {
    uint64_t v11 = *(void **)(v0 + 224);
  }
  uint64_t v12 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v13 = MEMORY[0x1E4FBC860];
  return v12(v13);
}

unint64_t sub_1BEFA5B3C()
{
  return 0xD00000000000001DLL;
}

uint64_t sub_1BEFA5B58(char a1)
{
  return *(void *)&aImessagercs_0[8 * a1];
}

uint64_t sub_1BEFA5B78(char *a1, char *a2)
{
  return sub_1BEFA5B84(*a1, *a2);
}

uint64_t sub_1BEFA5B84(char a1, char a2)
{
  if (*(void *)&aImessagercs_0[8 * a1] == *(void *)&aImessagercs_0[8 * a2]
    && *(void *)&aFacetimefaceti_0[8 * a1 + 16] == *(void *)&aFacetimefaceti_0[8 * a2 + 16])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_1BEFB29B8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_1BEFA5C0C(char a1, char a2)
{
  if (*(void *)&aAvailablunavai[8 * a1] == *(void *)&aAvailablunavai[8 * a2]
    && *(void *)&aE[8 * a1] == *(void *)&aE[8 * a2])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_1BEFB29B8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_1BEFA5C94(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    unint64_t v3 = 0xD00000000000001BLL;
  }
  else {
    unint64_t v3 = 0xD000000000000019;
  }
  if (v2) {
    unint64_t v4 = 0x80000001BEFC0410;
  }
  else {
    unint64_t v4 = 0x80000001BEFC0430;
  }
  if (a2) {
    unint64_t v5 = 0xD00000000000001BLL;
  }
  else {
    unint64_t v5 = 0xD000000000000019;
  }
  if (a2) {
    unint64_t v6 = 0x80000001BEFC0430;
  }
  else {
    unint64_t v6 = 0x80000001BEFC0410;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_1BEFB29B8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_1BEFA5D40()
{
  return sub_1BEFA5D48();
}

uint64_t sub_1BEFA5D48()
{
  return sub_1BEFB2A48();
}

uint64_t sub_1BEFA5DB4()
{
  return sub_1BEFB2A48();
}

uint64_t sub_1BEFA5E3C()
{
  return sub_1BEFB2A48();
}

uint64_t sub_1BEFA5EA8()
{
  return sub_1BEFA5EB0();
}

uint64_t sub_1BEFA5EB0()
{
  sub_1BEFB26C8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BEFA5F04()
{
  sub_1BEFB26C8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BEFA5F58()
{
  return sub_1BEFA604C();
}

uint64_t sub_1BEFA5F60()
{
  return sub_1BEFB2A48();
}

uint64_t sub_1BEFA5FE4()
{
  return sub_1BEFB2A48();
}

uint64_t sub_1BEFA604C()
{
  return sub_1BEFB2A48();
}

uint64_t sub_1BEFA60B4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1BEFA73BC();
  *a1 = result;
  return result;
}

uint64_t sub_1BEFA60E4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1BEFA5B58(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1BEFA6110(uint64_t a1, uint64_t a2)
{
  return sub_1BEF9AFDC(a1, a2, (uint64_t *)&unk_1EA139AB0);
}

void sub_1BEFA6120(void *a1@<X8>)
{
  *a1 = &unk_1F1A2ECA0;
}

uint64_t sub_1BEFA6130()
{
  return sub_1BEFB2418();
}

uint64_t sub_1BEFA6160()
{
  return sub_1BEFB2438();
}

uint64_t sub_1BEFA6190()
{
  return sub_1BEFB2558() & 1;
}

uint64_t sub_1BEFA61D4()
{
  return sub_1BEFB2428();
}

uint64_t sub_1BEFA622C()
{
  return sub_1BEFB2568() & 1;
}

uint64_t sub_1BEFA6270(char *a1, char *a2)
{
  return sub_1BEFA5C94(*a1, *a2);
}

uint64_t sub_1BEFA627C()
{
  return sub_1BEFA5DB4();
}

uint64_t sub_1BEFA6284()
{
  sub_1BEFB26C8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BEFA62F8()
{
  return sub_1BEFA5F60();
}

uint64_t sub_1BEFA6300@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_1BEFB2988();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

void sub_1BEFA6360(unint64_t *a1@<X8>)
{
  if (*v1) {
    unint64_t v2 = 0xD00000000000001BLL;
  }
  else {
    unint64_t v2 = 0xD000000000000019;
  }
  unint64_t v3 = 0x80000001BEFC0410;
  if (*v1) {
    unint64_t v3 = 0x80000001BEFC0430;
  }
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_1BEFA63A4(uint64_t a1, uint64_t a2)
{
  return sub_1BEF9AFDC(a1, a2, (uint64_t *)&unk_1EA139AC0);
}

void sub_1BEFA63B4(void *a1@<X8>)
{
  *a1 = &unk_1F1A2ED18;
}

uint64_t sub_1BEFA63C4()
{
  return sub_1BEFB2418();
}

uint64_t sub_1BEFA63F4()
{
  return sub_1BEFB2438();
}

uint64_t sub_1BEFA6424()
{
  return sub_1BEFB2558() & 1;
}

uint64_t sub_1BEFA6468()
{
  return sub_1BEFB2428();
}

uint64_t sub_1BEFA64C0()
{
  return sub_1BEFB2568() & 1;
}

uint64_t sub_1BEFA6504()
{
  swift_retain();
  sub_1BEFB2518();
  swift_release();
  return v1;
}

uint64_t sub_1BEFA6550()
{
  return swift_release();
}

uint64_t (*sub_1BEFA659C(void *a1))()
{
  unint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(void *)(v1 + qword_1EA139B50);
  swift_retain();
  v3[5] = sub_1BEFB2508();
  return sub_1BEF9A68C;
}

uint64_t sub_1BEFA6610()
{
  return sub_1BEF9AA88();
}

uint64_t sub_1BEFA661C()
{
  return sub_1BEFA66C0();
}

uint64_t sub_1BEFA6628()
{
  return sub_1BEFA6714();
}

uint64_t (*sub_1BEFA6634(void *a1))()
{
  unint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(void *)(v1 + qword_1EA139B60);
  swift_retain();
  v3[5] = sub_1BEFB2508();
  return sub_1BEF9A68C;
}

uint64_t sub_1BEFA66A8()
{
  return sub_1BEF9AA88();
}

uint64_t sub_1BEFA66B4()
{
  return sub_1BEFA66C0();
}

uint64_t sub_1BEFA66C0()
{
  swift_retain();
  sub_1BEFB2518();
  swift_release();
  return v1;
}

uint64_t sub_1BEFA6708()
{
  return sub_1BEFA6714();
}

uint64_t sub_1BEFA6714()
{
  return swift_release();
}

uint64_t (*sub_1BEFA675C(void *a1))()
{
  unint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(void *)(v1 + qword_1EA139B70);
  swift_retain();
  v3[5] = sub_1BEFB2508();
  return sub_1BEF9A68C;
}

uint64_t sub_1BEFA67D0()
{
  return sub_1BEF9AA88();
}

uint64_t sub_1BEFA67DC(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  uint64_t v3 = qword_1EA139B50;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139618);
  swift_allocObject();
  swift_retain();
  *(void *)(v2 + v3) = sub_1BEFB24F8();
  uint64_t v4 = qword_1EA139B60;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139B58);
  swift_allocObject();
  *(void *)(v2 + v4) = sub_1BEFB24F8();
  uint64_t v5 = qword_1EA139B70;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139B68);
  swift_allocObject();
  *(void *)(v2 + v5) = sub_1BEFB24F8();
  swift_release();
  uint64_t v6 = sub_1BEFB2398();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  uint64_t v9 = sub_1BEFB23F8();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
  return v9;
}

uint64_t sub_1BEFA6994()
{
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_1BEFA69E4()
{
  uint64_t v0 = sub_1BEFB23E8();
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x1F4186488](v0, 40, 7);
}

uint64_t sub_1BEFA6A54(uint64_t a1, uint64_t a2)
{
  return sub_1BEF9AFDC(a1, a2, (uint64_t *)&unk_1EA139AD0);
}

uint64_t sub_1BEFA6A64(uint64_t a1, uint64_t a2)
{
  return sub_1BEF9AFDC(a1, a2, (uint64_t *)&unk_1EA139AE0);
}

uint64_t sub_1BEFA6A74()
{
  return sub_1BEFB2568() & 1;
}

uint64_t sub_1BEFA6ACC()
{
  return sub_1BEFB2458();
}

uint64_t sub_1BEFA6B14()
{
  return sub_1BEFB2558() & 1;
}

uint64_t sub_1BEFA6B6C(char a1)
{
  return *(void *)&aAvailablunavai[8 * a1];
}

uint64_t sub_1BEFA6B8C(char *a1, char *a2)
{
  return sub_1BEFA5C0C(*a1, *a2);
}

uint64_t sub_1BEFA6B98()
{
  return sub_1BEFA5E3C();
}

uint64_t sub_1BEFA6BA0()
{
  return sub_1BEFA5F04();
}

uint64_t sub_1BEFA6BA8()
{
  return sub_1BEFA5FE4();
}

uint64_t sub_1BEFA6BB0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1BEFA7408();
  *a1 = result;
  return result;
}

uint64_t sub_1BEFA6BE0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1BEFA6B6C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1BEFA6C0C(uint64_t a1, uint64_t a2)
{
  return sub_1BEF9AFDC(a1, a2, qword_1EA139AF0);
}

void sub_1BEFA6C1C(void *a1@<X8>)
{
  *a1 = &unk_1F1A2EDA8;
}

uint64_t sub_1BEFA6C2C()
{
  return sub_1BEFB2418();
}

uint64_t sub_1BEFA6C5C()
{
  return sub_1BEFB2438();
}

uint64_t sub_1BEFA6C8C()
{
  return sub_1BEFB2558() & 1;
}

uint64_t sub_1BEFA6CD0()
{
  return sub_1BEFB2428();
}

uint64_t sub_1BEFA6D28()
{
  return sub_1BEFB2568() & 1;
}

uint64_t HandleAvailability.RemoteIntentLookup.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtCV20ContactsAutocomplete18HandleAvailability18RemoteIntentLookup_logger;
  uint64_t v2 = sub_1BEFB25A8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t HandleAvailability.RemoteIntentLookup.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtCV20ContactsAutocomplete18HandleAvailability18RemoteIntentLookup_logger;
  uint64_t v2 = sub_1BEFB25A8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x1F4186488](v0, v3, v4);
}

uint64_t sub_1BEFA6E98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(**(void **)v3 + 112)
                                                          + **(int **)(**(void **)v3 + 112));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  void *v8 = v4;
  v8[1] = sub_1BEF983E8;
  return v10(a1, a2, a3);
}

uint64_t sub_1BEFA6FB8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1BEFA70F0(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_1BEFA6FD8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1BEFA726C(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

unint64_t sub_1BEFA6FF8()
{
  unint64_t result = qword_1EA139B28;
  if (!qword_1EA139B28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA139B28);
  }
  return result;
}

unint64_t sub_1BEFA704C()
{
  unint64_t result = qword_1EA139B30;
  if (!qword_1EA139B30)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA139B38);
    sub_1BEFA7A58(&qword_1EA139B40);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA139B30);
  }
  return result;
}

uint64_t _s18RemoteIntentLookupC32HandleAvailabilityRepresentationCMa(uint64_t a1)
{
  return sub_1BEF8CABC(a1, qword_1EA13F060);
}

uint64_t sub_1BEFA70F0(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139CD8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  size_t v14 = 24 * v8;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v14]) {
      memmove(v12, v13, v14);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v14] || v12 >= &v13[v14])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_1BEFB2978();
  __break(1u);
  return result;
}

uint64_t sub_1BEFA726C(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139CE0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_1BEFB2978();
  __break(1u);
  return result;
}

uint64_t sub_1BEFA73BC()
{
  unint64_t v0 = sub_1BEFB2988();
  swift_bridgeObjectRelease();
  if (v0 >= 4) {
    return 4;
  }
  else {
    return v0;
  }
}

uint64_t sub_1BEFA7408()
{
  unint64_t v0 = sub_1BEFB2988();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3;
  }
  else {
    return v0;
  }
}

unint64_t sub_1BEFA7458()
{
  unint64_t result = qword_1EA139B78;
  if (!qword_1EA139B78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA139B78);
  }
  return result;
}

unint64_t sub_1BEFA74B0()
{
  unint64_t result = qword_1EA139B80;
  if (!qword_1EA139B80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA139B80);
  }
  return result;
}

unint64_t sub_1BEFA7508()
{
  unint64_t result = qword_1EA139B88;
  if (!qword_1EA139B88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA139B88);
  }
  return result;
}

unint64_t sub_1BEFA7560()
{
  unint64_t result = qword_1EA139B90;
  if (!qword_1EA139B90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA139B90);
  }
  return result;
}

unint64_t sub_1BEFA75B8()
{
  unint64_t result = qword_1EA139B98;
  if (!qword_1EA139B98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA139B98);
  }
  return result;
}

uint64_t sub_1BEFA760C()
{
  return sub_1BEFA7E1C(&qword_1EA139BA0, &qword_1EA139BA8);
}

unint64_t sub_1BEFA7638()
{
  unint64_t result = qword_1EA139BB0;
  if (!qword_1EA139BB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA139BB0);
  }
  return result;
}

unint64_t sub_1BEFA7690()
{
  unint64_t result = qword_1EA139BB8;
  if (!qword_1EA139BB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA139BB8);
  }
  return result;
}

unint64_t sub_1BEFA76E8()
{
  unint64_t result = qword_1EA139BC0;
  if (!qword_1EA139BC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA139BC0);
  }
  return result;
}

unint64_t sub_1BEFA7740()
{
  unint64_t result = qword_1EA139BC8;
  if (!qword_1EA139BC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA139BC8);
  }
  return result;
}

unint64_t sub_1BEFA7798()
{
  unint64_t result = qword_1EA139BD0;
  if (!qword_1EA139BD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA139BD0);
  }
  return result;
}

unint64_t sub_1BEFA77F0()
{
  unint64_t result = qword_1EA139BD8;
  if (!qword_1EA139BD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA139BD8);
  }
  return result;
}

unint64_t sub_1BEFA7848()
{
  unint64_t result = qword_1EA139BE0;
  if (!qword_1EA139BE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA139BE0);
  }
  return result;
}

unint64_t sub_1BEFA78A0()
{
  unint64_t result = qword_1EA139BE8;
  if (!qword_1EA139BE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA139BE8);
  }
  return result;
}

uint64_t sub_1BEFA78F4()
{
  return sub_1BEFA7E1C(&qword_1EA139BF0, &qword_1EA139BF8);
}

unint64_t sub_1BEFA7920()
{
  unint64_t result = qword_1EA139C00;
  if (!qword_1EA139C00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA139C00);
  }
  return result;
}

unint64_t sub_1BEFA7978()
{
  unint64_t result = qword_1EA139C08;
  if (!qword_1EA139C08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA139C08);
  }
  return result;
}

unint64_t sub_1BEFA79D0()
{
  unint64_t result = qword_1EA139C10;
  if (!qword_1EA139C10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA139C10);
  }
  return result;
}

uint64_t sub_1BEFA7A24()
{
  return sub_1BEFA7A58(&qword_1EA139C18);
}

uint64_t sub_1BEFA7A58(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    _s18RemoteIntentLookupC32HandleAvailabilityRepresentationCMa(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1BEFA7A9C()
{
  return sub_1BEFA7A58(&qword_1EA139C20);
}

uint64_t sub_1BEFA7AD0()
{
  return sub_1BEFA7A58(&qword_1EA139C28);
}

uint64_t sub_1BEFA7B04()
{
  return sub_1BEFA7A58(&qword_1EA139C30);
}

uint64_t sub_1BEFA7B38()
{
  return sub_1BEFA7A58(&qword_1EA139C38);
}

uint64_t sub_1BEFA7B6C()
{
  return sub_1BEFA7A58(&qword_1EA139C40);
}

uint64_t sub_1BEFA7BA0()
{
  return sub_1BEFA7A58(&qword_1EA139C48);
}

uint64_t sub_1BEFA7BD4()
{
  return sub_1BEFA7A58(&qword_1EA139B40);
}

uint64_t sub_1BEFA7C08()
{
  return sub_1BEFA7A58(&qword_1EA139C50);
}

unint64_t sub_1BEFA7C40()
{
  unint64_t result = qword_1EA139C58;
  if (!qword_1EA139C58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA139C58);
  }
  return result;
}

unint64_t sub_1BEFA7C98()
{
  unint64_t result = qword_1EA139C60;
  if (!qword_1EA139C60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA139C60);
  }
  return result;
}

unint64_t sub_1BEFA7CF0()
{
  unint64_t result = qword_1EA139C68;
  if (!qword_1EA139C68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA139C68);
  }
  return result;
}

unint64_t sub_1BEFA7D48()
{
  unint64_t result = qword_1EA139C70;
  if (!qword_1EA139C70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA139C70);
  }
  return result;
}

unint64_t sub_1BEFA7DA0()
{
  unint64_t result = qword_1EA139C78;
  if (!qword_1EA139C78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA139C78);
  }
  return result;
}

uint64_t sub_1BEFA7DF4()
{
  return sub_1BEFA7E1C(&qword_1EA139C80, &qword_1EA139C88);
}

uint64_t sub_1BEFA7E1C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1BEFA7E70()
{
  unint64_t result = qword_1EA139C90;
  if (!qword_1EA139C90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA139C90);
  }
  return result;
}

unint64_t sub_1BEFA7EC8()
{
  unint64_t result = qword_1EA139C98;
  if (!qword_1EA139C98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA139C98);
  }
  return result;
}

unint64_t sub_1BEFA7F20()
{
  unint64_t result = qword_1EA139CA0;
  if (!qword_1EA139CA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA139CA0);
  }
  return result;
}

uint64_t dispatch thunk of HandleAvailability.IntentLookup.status(for:on:useCachedAvailabilityOnly:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a5 + 8) + **(int **)(a5 + 8));
  size_t v11 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v11;
  void *v11 = v5;
  v11[1] = sub_1BEF97CCC;
  return v13(a1, a2, a3, a4, a5);
}

uint64_t sub_1BEFA8094(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s12HandleStatusVwca(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  return a1;
}

__n128 __swift_memcpy18_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u16[0] = a2[1].n128_u16[0];
  *a1 = result;
  return result;
}

uint64_t _s12HandleStatusVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  return a1;
}

uint64_t _s12HandleStatusVwet(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 18)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s12HandleStatusVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_WORD *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 18) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 18) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HandleAvailability.HandleStatus()
{
  return &type metadata for HandleAvailability.HandleStatus;
}

uint64_t sub_1BEFA8218()
{
  return type metadata accessor for HandleAvailability.RemoteIntentLookup(0);
}

uint64_t type metadata accessor for HandleAvailability.RemoteIntentLookup(uint64_t a1)
{
  return sub_1BEF8CABC(a1, (uint64_t *)&unk_1EA13F050);
}

uint64_t sub_1BEFA8240()
{
  uint64_t result = sub_1BEFB25A8();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for HandleAvailability.RemoteIntentLookup(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for HandleAvailability.RemoteIntentLookup);
}

uint64_t dispatch thunk of HandleAvailability.RemoteIntentLookup.__allocating_init(clientLabel:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of HandleAvailability.RemoteIntentLookup.status(for:on:useCachedAvailabilityOnly:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)v3 + 112)
                                                          + **(int **)(*(void *)v3 + 112));
  int64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  void *v8 = v4;
  v8[1] = sub_1BEF983E8;
  return v10(a1, a2, a3);
}

uint64_t _s18RemoteIntentLookupC43FetchHandleAvailabilityIntentRepresentationVwxx()
{
  swift_release();
  swift_release();
  return swift_release();
}

void *_s18RemoteIntentLookupC43FetchHandleAvailabilityIntentRepresentationVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void *_s18RemoteIntentLookupC43FetchHandleAvailabilityIntentRepresentationVwca(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  return a1;
}

uint64_t _s18RemoteIntentLookupC43FetchHandleAvailabilityIntentRepresentationVwta(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_release();
  return a1;
}

ValueMetadata *_s18RemoteIntentLookupC43FetchHandleAvailabilityIntentRepresentationVMa()
{
  return &_s18RemoteIntentLookupC43FetchHandleAvailabilityIntentRepresentationVN;
}

unsigned char *_s18RemoteIntentLookupC32ServiceNameAppEnumRepresentationOwst(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *uint64_t result = a2 + 3;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1BEFA865CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *_s18RemoteIntentLookupC32ServiceNameAppEnumRepresentationOMa()
{
  return &_s18RemoteIntentLookupC32ServiceNameAppEnumRepresentationON;
}

uint64_t _s18RemoteIntentLookupC44AvailabilityCachePolicyAppEnumRepresentationOwet(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s18RemoteIntentLookupC44AvailabilityCachePolicyAppEnumRepresentationOwst(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *uint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1BEFA87F0);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

unsigned char *sub_1BEFA8818(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *_s18RemoteIntentLookupC44AvailabilityCachePolicyAppEnumRepresentationOMa()
{
  return &_s18RemoteIntentLookupC44AvailabilityCachePolicyAppEnumRepresentationON;
}

uint64_t sub_1BEFA8834()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1BEFA8888()
{
  return _s18RemoteIntentLookupC32HandleAvailabilityRepresentationCMa(0);
}

unsigned char *_s18RemoteIntentLookupC20StatusRepresentationOwst(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *uint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1BEFA895CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *_s18RemoteIntentLookupC20StatusRepresentationOMa()
{
  return &_s18RemoteIntentLookupC20StatusRepresentationON;
}

unint64_t sub_1BEFA8994()
{
  unint64_t result = qword_1EA139CC0;
  if (!qword_1EA139CC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA139CC0);
  }
  return result;
}

unint64_t sub_1BEFA89E8()
{
  unint64_t result = qword_1EA139CC8;
  if (!qword_1EA139CC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA139CC8);
  }
  return result;
}

unint64_t sub_1BEFA8A3C()
{
  unint64_t result = qword_1EA139CD0;
  if (!qword_1EA139CD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA139CD0);
  }
  return result;
}

ContactsAutocomplete::ComposeRecipientFetchRequest __swiftcall ComposeRecipientFetchRequest.init(names:client:)(Swift::OpaquePointer names, ContactsAutocomplete::ComposeRecipientFetchRequest::Client client)
{
  char v3 = *(unsigned char *)client;
  *(Swift::OpaquePointer *)uint64_t v2 = names;
  *(unsigned char *)(v2 + 8) = v3;
  *(unsigned char *)(v2 + 9) = 1;
  *(void *)(v2 + 16) = 20;
  *(unsigned char *)(v2 + 24) = 0;
  result.names = names;
  result.client = client;
  return result;
}

void *ComposeRecipientFetchRequest.Client.services.getter()
{
  unint64_t v1 = (void *)MEMORY[0x1E4FBC860];
  if (*v0 == 1) {
    unint64_t v1 = &unk_1F1A2F0C8;
  }
  if (*v0) {
    return v1;
  }
  else {
    return &unk_1F1A2F0A0;
  }
}

BOOL static ComposeRecipientFetchRequest.Client.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t ComposeRecipientFetchRequest.Client.hash(into:)()
{
  return sub_1BEFB2A38();
}

uint64_t ComposeRecipientFetchRequest.Client.hashValue.getter()
{
  return sub_1BEFB2A48();
}

unint64_t sub_1BEFA8B70()
{
  unint64_t result = qword_1EA139CE8;
  if (!qword_1EA139CE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA139CE8);
  }
  return result;
}

uint64_t _s6HandleVwCP(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for ComposeRecipientFetchRequest()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ComposeRecipientFetchRequest(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_WORD *)(a1 + 8) = *(_WORD *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ComposeRecipientFetchRequest(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(unsigned char *)(a1 + 9) = *(unsigned char *)(a2 + 9);
  uint64_t v4 = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 16) = v4;
  return a1;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for ComposeRecipientFetchRequest(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(unsigned char *)(a1 + 9) = *(unsigned char *)(a2 + 9);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for ComposeRecipientFetchRequest(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 25)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ComposeRecipientFetchRequest(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 25) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 25) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ComposeRecipientFetchRequest()
{
  return &type metadata for ComposeRecipientFetchRequest;
}

unsigned char *storeEnumTagSinglePayload for ComposeRecipientFetchRequest.Client(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *__n128 result = a2 + 3;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1BEFA8E84);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *__n128 result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ComposeRecipientFetchRequest.Client()
{
  return &type metadata for ComposeRecipientFetchRequest.Client;
}

uint64_t ComposeRecipient.Handle.Value.hash(into:)()
{
  sub_1BEFB2A38();
  return sub_1BEFB26C8();
}

uint64_t ComposeRecipient.Handle.Value.hashValue.getter()
{
  return sub_1BEFB2A48();
}

uint64_t sub_1BEFA8F7C()
{
  return sub_1BEFB2A48();
}

uint64_t sub_1BEFA8FE0()
{
  sub_1BEFB2A38();
  return sub_1BEFB26C8();
}

uint64_t sub_1BEFA9034()
{
  return sub_1BEFB2A48();
}

uint64_t ComposeRecipient.Handle.Label.hash(into:)()
{
  switch(*(void *)(v0 + 8))
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 0xALL:
    case 0xBLL:
    case 0xCLL:
      uint64_t result = sub_1BEFB2A38();
      break;
    default:
      sub_1BEFB2A38();
      uint64_t result = sub_1BEFB26C8();
      break;
  }
  return result;
}

uint64_t ComposeRecipient.Handle.Label.hashValue.getter()
{
  return sub_1BEFB2A48();
}

uint64_t sub_1BEFA921C()
{
  return sub_1BEFB2A48();
}

uint64_t sub_1BEFA926C()
{
  return sub_1BEFB2A48();
}

uint64_t ComposeRecipient.Handle.value.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)v1;
  uint64_t v3 = *(void *)(v1 + 8);
  *(void *)a1 = *(void *)v1;
  *(void *)(a1 + 8) = v3;
  unsigned __int8 v4 = *(unsigned char *)(v1 + 16);
  *(unsigned char *)(a1 + 16) = v4;
  return sub_1BEF8CFD8(v2, v3, v4);
}

uint64_t ComposeRecipient.Handle.value.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  char v4 = *((unsigned char *)a1 + 16);
  uint64_t result = sub_1BEFA41F4(*(void *)v1, *(void *)(v1 + 8), *(unsigned char *)(v1 + 16));
  *(void *)uint64_t v1 = v2;
  *(void *)(v1 + 8) = v3;
  *(unsigned char *)(v1 + 16) = v4;
  return result;
}

uint64_t (*ComposeRecipient.Handle.value.modify())()
{
  return nullsub_1;
}

uint64_t ComposeRecipient.Handle.label.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 24);
  unint64_t v3 = *(void *)(v1 + 32);
  *a1 = v2;
  a1[1] = v3;
  return sub_1BEF8CFF0(v2, v3);
}

uint64_t ComposeRecipient.Handle.label.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t result = sub_1BEFA41E0(*(void *)(v1 + 24), *(void *)(v1 + 32));
  *(void *)(v1 + 24) = v2;
  *(void *)(v1 + 32) = v3;
  return result;
}

uint64_t (*ComposeRecipient.Handle.label.modify())()
{
  return nullsub_1;
}

unint64_t sub_1BEFA9388()
{
  return sub_1BEFA3DE4(MEMORY[0x1E4FBC860]);
}

uint64_t ComposeRecipient.Handle.availability.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ComposeRecipient.Handle.availability.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 40) = a1;
  return result;
}

uint64_t (*ComposeRecipient.Handle.availability.modify())()
{
  return nullsub_1;
}

uint64_t ComposeRecipient.Handle.init(_:label:availability:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v8 = *a2;
  unint64_t v9 = a2[1];
  unsigned __int8 v10 = *(unsigned char *)(a1 + 16);
  sub_1BEFA3DE4(MEMORY[0x1E4FBC860]);
  sub_1BEF8CFD8(v6, v7, v10);
  sub_1BEF8CFF0(v8, v9);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_1BEF8CFD8(v6, v7, v10);
  sub_1BEF8CFF0(v8, v9);
  sub_1BEFA41E0(v8, v9);
  sub_1BEFA41F4(v6, v7, v10);
  sub_1BEFA41F4(v6, v7, v10);
  sub_1BEFA41E0(v8, v9);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a4 = v6;
  *(void *)(a4 + 8) = v7;
  *(unsigned char *)(a4 + 16) = v10;
  *(void *)(a4 + 24) = v8;
  *(void *)(a4 + 32) = v9;
  *(void *)(a4 + 40) = a3;
  return result;
}

uint64_t ComposeRecipient.Handle.init(phoneNumber:label:availability:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  return sub_1BEFA94E8(a1, a2, a3, a4, 0, a5);
}

uint64_t ComposeRecipient.Handle.init(emailAddress:label:availability:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  return sub_1BEFA94E8(a1, a2, a3, a4, 1u, a5);
}

uint64_t sub_1BEFA94E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X3>, unsigned __int8 a5@<W4>, uint64_t a6@<X8>)
{
  uint64_t v11 = *a3;
  unint64_t v12 = a3[1];
  sub_1BEFA3DE4(MEMORY[0x1E4FBC860]);
  swift_bridgeObjectRetain();
  sub_1BEF8CFF0(v11, v12);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_1BEF8CFD8(a1, a2, a5);
  sub_1BEF8CFF0(v11, v12);
  sub_1BEFA41E0(v11, v12);
  swift_bridgeObjectRelease();
  sub_1BEFA41F4(a1, a2, a5);
  sub_1BEFA41E0(v11, v12);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a6 = a1;
  *(void *)(a6 + 8) = a2;
  *(unsigned char *)(a6 + 16) = a5;
  *(void *)(a6 + 24) = v11;
  *(void *)(a6 + 32) = v12;
  *(void *)(a6 + 40) = a4;
  return result;
}

uint64_t ComposeRecipient.Handle.init(applicationDefined:label:availability:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  sub_1BEFA3DE4(MEMORY[0x1E4FBC860]);
  if (!a4)
  {
    a3 = 0;
    a4 = 11;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_1BEF8CFD8(a1, a2, 2u);
  sub_1BEF8CFF0(a3, a4);
  swift_bridgeObjectRelease();
  sub_1BEFA41F4(a1, a2, 2u);
  sub_1BEFA41E0(a3, a4);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a6 = a1;
  *(void *)(a6 + 8) = a2;
  *(unsigned char *)(a6 + 16) = 2;
  *(void *)(a6 + 24) = a3;
  *(void *)(a6 + 32) = a4;
  *(void *)(a6 + 40) = a5;
  return result;
}

uint64_t ComposeRecipient.Handle.init(autocompleteValue:availability:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_1BEFA3DE4(MEMORY[0x1E4FBC860]);
  id v6 = a1;
  sub_1BEFA97C4(v6, (uint64_t)&v13);
  uint64_t v7 = v13;
  uint64_t v8 = v14;
  unsigned __int8 v9 = v15;
  sub_1BEF8CFD8(v13, v14, v15);
  sub_1BEFA9968(v6, &v13);
  uint64_t v10 = v13;
  unint64_t v11 = v14;
  sub_1BEF8CFF0(v13, v14);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_1BEF8CFD8(v7, v8, v9);
  sub_1BEF8CFF0(v10, v11);
  sub_1BEFA41E0(v10, v11);
  sub_1BEFA41F4(v7, v8, v9);
  sub_1BEFA41F4(v7, v8, v9);
  sub_1BEFA41E0(v10, v11);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a3 = v7;
  *(void *)(a3 + 8) = v8;
  *(unsigned char *)(a3 + 16) = v9;
  *(void *)(a3 + 24) = v10;
  *(void *)(a3 + 32) = v11;
  *(void *)(a3 + 40) = a2;
  return result;
}

void sub_1BEFA97C4(void *a1@<X0>, uint64_t a2@<X8>)
{
  switch((unint64_t)objc_msgSend(a1, sel_addressType))
  {
    case 0uLL:
      id v4 = objc_msgSend(a1, sel_address);
      if (v4) {
        goto LABEL_9;
      }
      __break(1u);
LABEL_4:
      id v4 = objc_msgSend(a1, sel_address);
      if (v4)
      {
LABEL_9:
        id v6 = v4;
        char v7 = 2;
      }
      else
      {
        __break(1u);
LABEL_6:
        id v5 = objc_msgSend(a1, sel_address);
        if (!v5)
        {
          __break(1u);
LABEL_14:
          __break(1u);
LABEL_15:
          __break(1u);
LABEL_16:
          sub_1BEFB2928();
          __break(1u);
          JUMPOUT(0x1BEFA9954);
        }
        id v6 = v5;
        char v7 = 0;
      }
      break;
    case 1uLL:
      id v8 = objc_msgSend(a1, sel_address);
      if (!v8) {
        goto LABEL_15;
      }
      id v6 = v8;
      char v7 = 1;
      break;
    case 2uLL:
      goto LABEL_6;
    case 3uLL:
      id v4 = objc_msgSend(a1, sel_address);
      if (v4) {
        goto LABEL_9;
      }
      goto LABEL_14;
    case 4uLL:
      goto LABEL_4;
    default:
      goto LABEL_16;
  }
  uint64_t v9 = sub_1BEFB2698();
  uint64_t v11 = v10;

  *(void *)a2 = v9;
  *(void *)(a2 + 8) = v11;
  *(unsigned char *)(a2 + 16) = v7;
}

void sub_1BEFA9968(void *a1@<X0>, uint64_t *a2@<X8>)
{
  id v4 = objc_msgSend(a1, sel_label);
  if (!v4) {
    goto LABEL_29;
  }
  id v5 = v4;
  uint64_t v6 = sub_1BEFB2698();
  uint64_t v8 = v7;

  if (v6 == sub_1BEFB2698() && v8 == v9)
  {

    swift_bridgeObjectRelease_n();
    goto LABEL_9;
  }
  char v11 = sub_1BEFB29B8();
  swift_bridgeObjectRelease();
  if (v11)
  {
    swift_bridgeObjectRelease();

LABEL_9:
    uint64_t v6 = 0;
    uint64_t v8 = 0;
    goto LABEL_31;
  }
  if (v6 == sub_1BEFB2698() && v8 == v12)
  {

    swift_bridgeObjectRelease_n();
    goto LABEL_17;
  }
  char v14 = sub_1BEFB29B8();
  swift_bridgeObjectRelease();
  if (v14)
  {
    swift_bridgeObjectRelease();

LABEL_17:
    uint64_t v6 = 0;
    uint64_t v8 = 1;
    goto LABEL_31;
  }
  if (v6 == sub_1BEFB2698() && v8 == v15)
  {

    swift_bridgeObjectRelease_n();
LABEL_23:
    uint64_t v6 = 0;
    uint64_t v8 = 12;
    goto LABEL_31;
  }
  char v16 = sub_1BEFB29B8();
  swift_bridgeObjectRelease();
  if (v16)
  {
    swift_bridgeObjectRelease();

    goto LABEL_23;
  }
  if (v6 == sub_1BEFB2698() && v8 == v17)
  {

    swift_bridgeObjectRelease_n();
LABEL_30:
    uint64_t v6 = 0;
    uint64_t v8 = 11;
    goto LABEL_31;
  }
  char v18 = sub_1BEFB29B8();
  swift_bridgeObjectRelease();
  if (v18)
  {
    swift_bridgeObjectRelease();
LABEL_29:

    goto LABEL_30;
  }
  if (v6 == sub_1BEFB2698() && v8 == v19)
  {

    swift_bridgeObjectRelease_n();
LABEL_37:
    uint64_t v6 = 0;
    uint64_t v8 = 4;
    goto LABEL_31;
  }
  char v20 = sub_1BEFB29B8();
  swift_bridgeObjectRelease();
  if (v20)
  {
    swift_bridgeObjectRelease();

    goto LABEL_37;
  }
  if (v6 == sub_1BEFB2698() && v8 == v21)
  {

    swift_bridgeObjectRelease_n();
LABEL_43:
    uint64_t v6 = 0;
    uint64_t v8 = 6;
    goto LABEL_31;
  }
  char v22 = sub_1BEFB29B8();
  swift_bridgeObjectRelease();
  if (v22)
  {
    swift_bridgeObjectRelease();

    goto LABEL_43;
  }
  if (v6 == sub_1BEFB2698() && v8 == v23)
  {

    swift_bridgeObjectRelease_n();
LABEL_49:
    uint64_t v6 = 0;
    uint64_t v8 = 3;
    goto LABEL_31;
  }
  char v24 = sub_1BEFB29B8();
  swift_bridgeObjectRelease();
  if (v24)
  {
    swift_bridgeObjectRelease();

    goto LABEL_49;
  }
  if (v6 == sub_1BEFB2698() && v8 == v25)
  {

    swift_bridgeObjectRelease_n();
LABEL_55:
    uint64_t v6 = 0;
    uint64_t v8 = 5;
    goto LABEL_31;
  }
  char v26 = sub_1BEFB29B8();
  swift_bridgeObjectRelease();
  if (v26)
  {
    swift_bridgeObjectRelease();

    goto LABEL_55;
  }
  if (v6 == sub_1BEFB2698() && v8 == v27)
  {

    swift_bridgeObjectRelease_n();
LABEL_61:
    uint64_t v6 = 0;
    uint64_t v8 = 2;
    goto LABEL_31;
  }
  char v28 = sub_1BEFB29B8();
  swift_bridgeObjectRelease();
  if (v28)
  {
    swift_bridgeObjectRelease();

    goto LABEL_61;
  }
  if (v6 == sub_1BEFB2698() && v8 == v29)
  {

    swift_bridgeObjectRelease_n();
LABEL_67:
    uint64_t v6 = 0;
    uint64_t v8 = 7;
    goto LABEL_31;
  }
  char v30 = sub_1BEFB29B8();
  swift_bridgeObjectRelease();
  if (v30)
  {
    swift_bridgeObjectRelease();

    goto LABEL_67;
  }
  if (v6 == sub_1BEFB2698() && v8 == v31)
  {

    swift_bridgeObjectRelease_n();
LABEL_73:
    uint64_t v6 = 0;
    uint64_t v8 = 8;
    goto LABEL_31;
  }
  char v32 = sub_1BEFB29B8();
  swift_bridgeObjectRelease();
  if (v32)
  {
    swift_bridgeObjectRelease();

    goto LABEL_73;
  }
  if (v6 == sub_1BEFB2698() && v8 == v33)
  {

    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v34 = sub_1BEFB29B8();
    swift_bridgeObjectRelease();
    if ((v34 & 1) == 0)
    {
      if (v6 == sub_1BEFB2698() && v8 == v35)
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        char v36 = sub_1BEFB29B8();
        swift_bridgeObjectRelease();

        if ((v36 & 1) == 0) {
          goto LABEL_31;
        }
        swift_bridgeObjectRelease();
      }
      uint64_t v6 = 0;
      uint64_t v8 = 10;
      goto LABEL_31;
    }
    swift_bridgeObjectRelease();
  }
  uint64_t v6 = 0;
  uint64_t v8 = 9;
LABEL_31:
  *a2 = v6;
  a2[1] = v8;
}

ContactsAutocomplete::HandleAvailability::Status __swiftcall ComposeRecipient.Handle.availability(for:)(ContactsAutocomplete::HandleAvailability::Status result)
{
  uint64_t v3 = v1;
  uint64_t v4 = *(void *)(v2 + 40);
  if (*(void *)(v4 + 16) && (*(void *)&uint64_t result = sub_1BEF94E40(*(unsigned char *)result), (v5 & 1) != 0)) {
    char v6 = *(unsigned char *)(*(void *)(v4 + 56) + result);
  }
  else {
    char v6 = 2;
  }
  *uint64_t v3 = v6;
  return result;
}

uint64_t ComposeRecipient.Handle.Value.stringValue.getter()
{
  uint64_t v1 = *(void *)v0;
  sub_1BEF8CFD8(*(void *)v0, *(void *)(v0 + 8), *(unsigned char *)(v0 + 16));
  return v1;
}

uint64_t ComposeRecipient.Handle.Label.stringValue.getter()
{
  uint64_t v1 = *v0;
  unint64_t v2 = v0[1];
  uint64_t v3 = 1701670760;
  switch(v2)
  {
    case 0uLL:
      break;
    case 1uLL:
      uint64_t v3 = 1802661751;
      break;
    case 2uLL:
      uint64_t v3 = 0x656E6F685069;
      break;
    case 3uLL:
      uint64_t v3 = 0x615720656C707041;
      break;
    case 4uLL:
      uint64_t v3 = 0x64756F6C4369;
      break;
    case 5uLL:
      uint64_t v3 = 0x656C69626F6DLL;
      break;
    case 6uLL:
      uint64_t v3 = 1852399981;
      break;
    case 7uLL:
      unsigned int v4 = 1701670760;
      goto LABEL_11;
    case 8uLL:
      unsigned int v4 = 1802661751;
LABEL_11:
      uint64_t v3 = v4 | 0x7861662000000000;
      break;
    case 9uLL:
      uint64_t v3 = 0x616620726568746FLL;
      break;
    case 0xAuLL:
      uint64_t v3 = 0x7265676170;
      break;
    case 0xBuLL:
      uint64_t v3 = 0x726568746FLL;
      break;
    case 0xCuLL:
      uint64_t v3 = 0x6C6F6F686373;
      break;
    default:
      uint64_t v3 = v1;
      break;
  }
  sub_1BEF8CFF0(v1, v2);
  return v3;
}

uint64_t sub_1BEFAA1FC(uint64_t result, uint64_t a2)
{
  if (result == a2) {
    return 1;
  }
  uint64_t v2 = result;
  if (*(void *)(result + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v3 = 0;
  uint64_t v4 = result + 64;
  uint64_t v5 = 1 << *(unsigned char *)(result + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(result + 64);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  while (1)
  {
    if (v7)
    {
      unint64_t v9 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v10 = v9 | (v3 << 6);
      goto LABEL_24;
    }
    int64_t v11 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v11 >= v8) {
      return 1;
    }
    unint64_t v12 = *(void *)(v4 + 8 * v11);
    ++v3;
    if (!v12)
    {
      int64_t v3 = v11 + 1;
      if (v11 + 1 >= v8) {
        return 1;
      }
      unint64_t v12 = *(void *)(v4 + 8 * v3);
      if (!v12)
      {
        int64_t v3 = v11 + 2;
        if (v11 + 2 >= v8) {
          return 1;
        }
        unint64_t v12 = *(void *)(v4 + 8 * v3);
        if (!v12)
        {
          int64_t v3 = v11 + 3;
          if (v11 + 3 >= v8) {
            return 1;
          }
          unint64_t v12 = *(void *)(v4 + 8 * v3);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_23:
    unint64_t v7 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v3 << 6);
LABEL_24:
    sub_1BEF94E40(*(unsigned char *)(*(void *)(v2 + 48) + v10));
    if (v14)
    {
      sub_1BEF96E50();
      uint64_t result = sub_1BEFB2658();
      if (result) {
        continue;
      }
    }
    return 0;
  }
  int64_t v13 = v11 + 4;
  if (v13 >= v8) {
    return 1;
  }
  unint64_t v12 = *(void *)(v4 + 8 * v13);
  if (v12)
  {
    int64_t v3 = v13;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v3 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      break;
    }
    if (v3 >= v8) {
      return 1;
    }
    unint64_t v12 = *(void *)(v4 + 8 * v3);
    ++v13;
    if (v12) {
      goto LABEL_23;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t ComposeRecipient.Handle.description.getter()
{
  return 0;
}

uint64_t ComposeRecipient.Handle.debugDescription.getter()
{
  return 0;
}

uint64_t _s20ContactsAutocomplete16ComposeRecipientV6HandleV5ValueO2eeoiySbAG_AGtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)a1;
  uint64_t v3 = *(void *)(a1 + 8);
  int v4 = *(unsigned __int8 *)(a1 + 16);
  uint64_t v5 = *(void *)a2;
  uint64_t v6 = *(void *)(a2 + 8);
  int v7 = *(unsigned __int8 *)(a2 + 16);
  if (!*(unsigned char *)(a1 + 16))
  {
    if (!*(unsigned char *)(a2 + 16))
    {
      if (v2 != v5 || v3 != v6) {
        goto LABEL_23;
      }
      LOBYTE(v7) = 0;
      LOBYTE(v4) = 0;
      goto LABEL_17;
    }
LABEL_24:
    char v10 = 0;
    goto LABEL_25;
  }
  if (v4 != 1)
  {
    if (v7 == 2)
    {
      if (v2 == v5 && v3 == v6)
      {
        char v10 = 1;
        LOBYTE(v7) = 2;
        LOBYTE(v4) = 2;
        goto LABEL_25;
      }
      goto LABEL_23;
    }
    goto LABEL_24;
  }
  if (v7 != 1) {
    goto LABEL_24;
  }
  if (v2 != v5 || v3 != v6)
  {
LABEL_23:
    char v10 = sub_1BEFB29B8();
    LOBYTE(v7) = v4;
    goto LABEL_25;
  }
  LOBYTE(v7) = 1;
  LOBYTE(v4) = 1;
LABEL_17:
  char v10 = 1;
LABEL_25:
  sub_1BEF8CFD8(v5, v6, v7);
  sub_1BEF8CFD8(v2, v3, v4);
  sub_1BEFA41F4(v2, v3, v4);
  sub_1BEFA41F4(v5, v6, v7);
  return v10 & 1;
}

uint64_t _s20ContactsAutocomplete16ComposeRecipientV6HandleV5LabelO2eeoiySbAG_AGtFZ_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  uint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  switch(v3)
  {
    case 0uLL:
      if (v5) {
        goto LABEL_34;
      }
      unint64_t v3 = 0;
      char v6 = 1;
      break;
    case 1uLL:
      if (v5 != 1) {
        goto LABEL_34;
      }
      unint64_t v3 = 1;
      char v6 = 1;
      break;
    case 2uLL:
      if (v5 != 2) {
        goto LABEL_34;
      }
      char v6 = 1;
      unint64_t v3 = 2;
      break;
    case 3uLL:
      if (v5 != 3) {
        goto LABEL_34;
      }
      char v6 = 1;
      unint64_t v3 = 3;
      break;
    case 4uLL:
      if (v5 != 4) {
        goto LABEL_34;
      }
      char v6 = 1;
      unint64_t v3 = 4;
      break;
    case 5uLL:
      if (v5 != 5) {
        goto LABEL_34;
      }
      char v6 = 1;
      unint64_t v3 = 5;
      break;
    case 6uLL:
      if (v5 != 6) {
        goto LABEL_34;
      }
      char v6 = 1;
      unint64_t v3 = 6;
      break;
    case 7uLL:
      if (v5 != 7) {
        goto LABEL_34;
      }
      char v6 = 1;
      unint64_t v3 = 7;
      break;
    case 8uLL:
      if (v5 != 8) {
        goto LABEL_34;
      }
      char v6 = 1;
      unint64_t v3 = 8;
      break;
    case 9uLL:
      if (v5 != 9) {
        goto LABEL_34;
      }
      char v6 = 1;
      unint64_t v3 = 9;
      break;
    case 0xAuLL:
      if (v5 != 10) {
        goto LABEL_34;
      }
      char v6 = 1;
      unint64_t v3 = 10;
      break;
    case 0xBuLL:
      if (v5 != 11) {
        goto LABEL_34;
      }
      char v6 = 1;
      unint64_t v3 = 11;
      break;
    case 0xCuLL:
      if (v5 != 12) {
        goto LABEL_34;
      }
      char v6 = 1;
      unint64_t v3 = 12;
      break;
    default:
      if (v5 < 0xD)
      {
LABEL_34:
        char v6 = 0;
      }
      else if (v2 == v4 && v3 == v5)
      {
        char v6 = 1;
      }
      else
      {
        char v6 = sub_1BEFB29B8();
      }
      sub_1BEF8CFF0(v4, v5);
      sub_1BEF8CFF0(v2, v3);
      break;
  }
  sub_1BEFA41E0(v2, v3);
  sub_1BEFA41E0(v4, v5);
  return v6 & 1;
}

uint64_t _s20ContactsAutocomplete16ComposeRecipientV6HandleV2eeoiySbAE_AEtFZ_0(long long *a1, long long *a2)
{
  char v2 = *((unsigned char *)a1 + 16);
  uint64_t v3 = *((void *)a1 + 3);
  uint64_t v4 = *((void *)a1 + 4);
  uint64_t v5 = *((void *)a1 + 5);
  char v6 = *((unsigned char *)a2 + 16);
  uint64_t v7 = *((void *)a2 + 3);
  uint64_t v8 = *((void *)a2 + 4);
  uint64_t v9 = *((void *)a2 + 5);
  long long v13 = *a1;
  char v14 = v2;
  long long v11 = *a2;
  char v12 = v6;
  if ((_s20ContactsAutocomplete16ComposeRecipientV6HandleV5ValueO2eeoiySbAG_AGtFZ_0((uint64_t)&v13, (uint64_t)&v11) & 1) == 0) {
    return 0;
  }
  *(void *)&long long v13 = v3;
  *((void *)&v13 + 1) = v4;
  *(void *)&long long v11 = v7;
  *((void *)&v11 + 1) = v8;
  if ((_s20ContactsAutocomplete16ComposeRecipientV6HandleV5LabelO2eeoiySbAG_AGtFZ_0((uint64_t *)&v13, (uint64_t *)&v11) & 1) == 0) {
    return 0;
  }
  return sub_1BEFAA1FC(v5, v9);
}

unint64_t sub_1BEFAAA30()
{
  unint64_t result = qword_1EA139CF0;
  if (!qword_1EA139CF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA139CF0);
  }
  return result;
}

unint64_t sub_1BEFAAA88()
{
  unint64_t result = qword_1EA139CF8;
  if (!qword_1EA139CF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA139CF8);
  }
  return result;
}

uint64_t _s6HandleVwxx(uint64_t a1)
{
  sub_1BEFA41F4(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
  if (*(void *)(a1 + 32) >= 0xDuLL) {
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

uint64_t _s6HandleVwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  unsigned __int8 v6 = *(unsigned char *)(a2 + 16);
  sub_1BEF8CFD8(*(void *)a2, v5, v6);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6;
  uint64_t v7 = (void *)(a2 + 24);
  unint64_t v8 = *(void *)(a2 + 32);
  if (v8 >= 0xD)
  {
    *(void *)(a1 + 24) = *v7;
    *(void *)(a1 + 32) = v8;
    swift_bridgeObjectRetain();
  }
  else
  {
    *(_OWORD *)(a1 + 24) = *(_OWORD *)v7;
  }
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s6HandleVwca(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  unsigned __int8 v6 = *(unsigned char *)(a2 + 16);
  sub_1BEF8CFD8(*(void *)a2, v5, v6);
  uint64_t v7 = *(void *)a1;
  uint64_t v8 = *(void *)(a1 + 8);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  unsigned __int8 v9 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v6;
  sub_1BEFA41F4(v7, v8, v9);
  unint64_t v10 = *(void *)(a2 + 32);
  if (*(void *)(a1 + 32) >= 0xDuLL)
  {
    if (v10 >= 0xD)
    {
      *(void *)(a1 + 24) = *(void *)(a2 + 24);
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_8;
    }
    sub_1BEFAACAC(a1 + 24);
    goto LABEL_6;
  }
  if (v10 < 0xD)
  {
LABEL_6:
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
    goto LABEL_8;
  }
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
LABEL_8:
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1BEFAACAC(uint64_t a1)
{
  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t _s6HandleVwta(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + 16);
  uint64_t v5 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v7 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v4;
  sub_1BEFA41F4(v5, v6, v7);
  uint64_t v8 = (void *)(a2 + 24);
  if (*(void *)(a1 + 32) >= 0xDuLL)
  {
    unint64_t v9 = *(void *)(a2 + 32);
    if (v9 >= 0xD)
    {
      *(void *)(a1 + 24) = *v8;
      *(void *)(a1 + 32) = v9;
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    sub_1BEFAACAC(a1 + 24);
  }
  *(_OWORD *)(a1 + 24) = *(_OWORD *)v8;
LABEL_6:
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s6HandleVwet(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 40);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s6HandleVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 48) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 40) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ComposeRecipient.Handle()
{
  return &type metadata for ComposeRecipient.Handle;
}

uint64_t _s6HandleV5ValueOwxx(uint64_t a1)
{
  return sub_1BEFA41F4(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t _s6HandleV5ValueOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_1BEF8CFD8(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t _s6HandleV5ValueOwca(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_1BEF8CFD8(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_1BEFA41F4(v6, v7, v8);
  return a1;
}

uint64_t _s6HandleV5ValueOwta(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_1BEFA41F4(v4, v5, v6);
  return a1;
}

uint64_t _s6HandleV5ValueOwet(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t _s6HandleV5ValueOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 254;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_1BEFAAFE4(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_1BEFAAFEC(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for ComposeRecipient.Handle.Value()
{
  return &type metadata for ComposeRecipient.Handle.Value;
}

unint64_t _s6HandleV5LabelOwxx(uint64_t a1)
{
  unint64_t result = *(void *)(a1 + 8);
  if (result >= 0xFFFFFFFF) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s6HandleV5LabelOwCP_0(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if (v3 < 0xFFFFFFFF)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v3;
    swift_bridgeObjectRetain();
  }
  return a1;
}

void *_s6HandleV5LabelOwca(void *a1, void *a2)
{
  unint64_t v4 = a2[1];
  if (a1[1] < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s6HandleV5LabelOwta(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 8) < 0xFFFFFFFFuLL) {
    goto LABEL_5;
  }
  unint64_t v4 = *(void *)(a2 + 8);
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s6HandleV5LabelOwet(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 > 0x7FFFFFF2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 2147483635);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 12;
  if (v4 >= 0xE) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t _s6HandleV5LabelOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFF3)
  {
    *(void *)unint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)unint64_t result = a2 - 2147483635;
    if (a3 >= 0x7FFFFFF3) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFF3) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2 + 12;
    }
  }
  return result;
}

uint64_t sub_1BEFAB21C(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_1BEFAB234(void *result, int a2)
{
  if (a2 < 0)
  {
    *unint64_t result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for ComposeRecipient.Handle.Label()
{
  return &type metadata for ComposeRecipient.Handle.Label;
}

unint64_t sub_1BEFAB264(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    unint64_t v2 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139E40);
  unint64_t v2 = (void *)sub_1BEFB2968();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  unsigned int v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v8 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_1BEF94D24(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    long long v11 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v11 = v5;
    v11[1] = v6;
    char v12 = (void *)(v2[7] + 16 * result);
    void *v12 = v8;
    v12[1] = v7;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4 += 4;
    v2[2] = v15;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_1BEFAB388()
{
  uint64_t v0 = sub_1BEFB25A8();
  __swift_allocate_value_buffer(v0, qword_1EA13F7D8);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EA13F7D8);
  return sub_1BEFB2598();
}

id sub_1BEFAB404()
{
  id v0 = objc_allocWithZone((Class)CNAutocompleteStore);
  return objc_msgSend(v0, sel_init);
}

uint64_t sub_1BEFAB43C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t KnownIDStatusLookup = type metadata accessor for HandleAvailability.LastKnownIDStatusLookup();
  uint64_t result = HandleAvailability.LastKnownIDStatusLookup.__allocating_init()();
  a1[3] = KnownIDStatusLookup;
  a1[4] = (uint64_t)&protocol witness table for HandleAvailability.LastKnownIDStatusLookup;
  *a1 = result;
  return result;
}

uint64_t sub_1BEFAB47C(uint64_t a1, long long *a2)
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 64) = sub_1BEFAB264(MEMORY[0x1E4FBC860]);
  *(void *)(v4 + 16) = a1;
  sub_1BEF96BE4(a2, v4 + 24);
  return v4;
}

uint64_t sub_1BEFAB4E0(uint64_t *a1)
{
  *(void *)(v2 + 176) = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139D08);
  *(void *)(v2 + 184) = v4;
  *(void *)(v2 + 192) = *(void *)(v4 - 8);
  *(void *)(v2 + 200) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139D10);
  *(void *)(v2 + 208) = swift_task_alloc();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139D18);
  *(void *)(v2 + 216) = v5;
  *(void *)(v2 + 224) = *(void *)(v5 - 8);
  uint64_t v6 = swift_task_alloc();
  uint64_t v7 = *a1;
  *(void *)(v2 + 232) = v6;
  *(void *)(v2 + 240) = v7;
  *(unsigned char *)(v2 + 425) = *((unsigned char *)a1 + 8);
  *(unsigned char *)(v2 + 426) = *((unsigned char *)a1 + 9);
  *(void *)(v2 + 248) = a1[2];
  *(unsigned char *)(v2 + 427) = *((unsigned char *)a1 + 24);
  return MEMORY[0x1F4188298](sub_1BEFAB65C, 0, 0);
}

uint64_t sub_1BEFAB65C()
{
  uint64_t v60 = v0;
  uint64_t v1 = *(void *)(v0 + 240);
  if (*(void *)(v1 + 16))
  {
    uint64_t v2 = sub_1BEFB2308();
    *(void *)(v0 + 256) = v2;
    uint64_t v3 = *(void *)(v2 - 8);
    uint64_t v4 = v3;
    *(void *)(v0 + 264) = v3;
    *(void *)(v0 + 272) = *(void *)(v3 + 64);
    uint64_t v5 = swift_task_alloc();
    *(void *)(v0 + 280) = v5;
    sub_1BEFB22F8();
    *(void *)(v0 + 88) = v1;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA139D20);
    sub_1BEFB0158((unint64_t *)&qword_1EA139410, (uint64_t *)&unk_1EA139D20);
    uint64_t v6 = sub_1BEFB2648();
    unint64_t v8 = v7;
    swift_bridgeObjectRelease();
    if (qword_1EA13F4F0 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_1BEFB25A8();
    *(void *)(v0 + 288) = __swift_project_value_buffer(v9, (uint64_t)qword_1EA13F7D8);
    uint64_t v10 = swift_task_alloc();
    long long v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
    *(void *)(v0 + 296) = v11;
    *(void *)(v0 + 304) = (v4 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    uint64_t v57 = v5;
    unint64_t v56 = v11;
    v11(v10, v5, v2);
    swift_bridgeObjectRetain();
    char v12 = sub_1BEFB2588();
    os_log_type_t v13 = sub_1BEFB27B8();
    uint64_t v58 = v2;
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = swift_slowAlloc();
      uint64_t v54 = swift_slowAlloc();
      uint64_t v59 = v54;
      *(_DWORD *)uint64_t v14 = 136380931;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 168) = sub_1BEF946CC(v6, v8, &v59);
      sub_1BEFB2828();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v14 + 12) = 2080;
      sub_1BEFAFDB0();
      uint64_t v15 = sub_1BEFB2998();
      *(void *)(v0 + 104) = sub_1BEF946CC(v15, v16, &v59);
      sub_1BEFB2828();
      swift_bridgeObjectRelease();
      uint64_t v17 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
      v17(v10, v2);
      _os_log_impl(&dword_1BEF57000, v12, v13, "Preparing request for “%{private}s” (%s)", (uint8_t *)v14, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1C18A1630](v54, -1, -1);
      MEMORY[0x1C18A1630](v14, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
      uint64_t v17 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
      v17(v10, v2);
    }

    *(void *)(v0 + 312) = v17;
    uint64_t v21 = *(char *)(v0 + 425);
    swift_task_dealloc();
    id v22 = objc_msgSend(objc_allocWithZone((Class)CNAutocompleteFetchRequest), sel_init);
    *(void *)(v0 + 320) = v22;
    uint64_t v23 = (void *)sub_1BEFB2708();
    objc_msgSend(v22, sel_setSearchNames_, v23);

    uint64_t v24 = qword_1BEFBA080[v21];
    LOBYTE(v21) = *(unsigned char *)(v0 + 427);
    objc_msgSend(v22, sel_setSearchType_, v24);
    if ((v21 & 1) == 0) {
      objc_msgSend(v22, sel_setMaximumResultsCount_, *(void *)(v0 + 248));
    }
    id v53 = v22;
    uint64_t v25 = swift_task_alloc();
    v56(v25, v57, v58);
    char v26 = sub_1BEFB2588();
    os_log_type_t v27 = sub_1BEFB27B8();
    uint64_t v55 = v17;
    if (os_log_type_enabled(v26, v27))
    {
      char v28 = (uint8_t *)swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      uint64_t v59 = v29;
      *(_DWORD *)char v28 = 136315138;
      sub_1BEFAFDB0();
      uint64_t v30 = sub_1BEFB2998();
      *(void *)(v0 + 160) = sub_1BEF946CC(v30, v31, &v59);
      sub_1BEFB2828();
      swift_bridgeObjectRelease();
      v17(v25, v58);
      _os_log_impl(&dword_1BEF57000, v26, v27, "Executing request (%s)", v28, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C18A1630](v29, -1, -1);
      MEMORY[0x1C18A1630](v28, -1, -1);
    }
    else
    {
      v17(v25, v58);
    }

    uint64_t v32 = *(void *)(v0 + 216);
    uint64_t v33 = *(void *)(v0 + 224);
    uint64_t v34 = *(void *)(v0 + 208);
    swift_task_dealloc();
    id v35 = objc_allocWithZone((Class)type metadata accessor for StoreSpy());
    uint64_t v36 = swift_unknownObjectRetain();
    uint64_t v37 = (char *)sub_1BEFADC4C(v36);
    *(void *)(v0 + 328) = v37;
    id v38 = objc_msgSend(*(id *)&v37[OBJC_IVAR____TtC20ContactsAutocompleteP33_EBE34D4C21093596BE6E4DA9F1A7E5D28StoreSpy_store], sel_executeFetchRequest_delegate_, v53, v37);
    uint64_t v39 = (uint64_t)&v37[OBJC_IVAR____TtC20ContactsAutocompleteP33_EBE34D4C21093596BE6E4DA9F1A7E5D28StoreSpy_results];
    swift_beginAccess();
    sub_1BEFAFF68(v39, v34, &qword_1EA139D10);
    uint64_t v40 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v33 + 48))(v34, 1, v32);
    if (v40 == 1)
    {
      __break(1u);
    }
    else
    {
      (*(void (**)(void, void, void))(*(void *)(v0 + 224) + 32))(*(void *)(v0 + 232), *(void *)(v0 + 208), *(void *)(v0 + 216));
      *(void *)(swift_allocObject() + 16) = v38;
      sub_1BEFB25C8();
      swift_allocObject();
      *(void *)(v0 + 336) = sub_1BEFB25D8();
      uint64_t v45 = swift_task_alloc();
      v56(v45, v57, v58);
      uint64_t v46 = sub_1BEFB2588();
      os_log_type_t v47 = sub_1BEFB27B8();
      if (os_log_type_enabled(v46, v47))
      {
        uint64_t v48 = (uint8_t *)swift_slowAlloc();
        uint64_t v49 = swift_slowAlloc();
        uint64_t v59 = v49;
        *(_DWORD *)uint64_t v48 = 136315138;
        sub_1BEFAFDB0();
        uint64_t v50 = sub_1BEFB2998();
        *(void *)(v0 + 152) = sub_1BEF946CC(v50, v51, &v59);
        sub_1BEFB2828();
        swift_bridgeObjectRelease();
        v55(v45, v58);
        _os_log_impl(&dword_1BEF57000, v46, v47, "Waiting for query to complete (%s)", v48, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1C18A1630](v49, -1, -1);
        MEMORY[0x1C18A1630](v48, -1, -1);
      }
      else
      {
        v55(v45, v58);
      }

      swift_task_dealloc();
      *(void *)(v0 + 64) = MEMORY[0x1E4FBC860];
      sub_1BEFB2778();
      unint64_t v52 = (void *)swift_task_alloc();
      *(void *)(v0 + 344) = v52;
      *unint64_t v52 = v0;
      v52[1] = sub_1BEFABFB8;
      uint64_t v43 = *(void *)(v0 + 184);
      uint64_t v40 = v0 + 72;
      uint64_t v41 = 0;
      uint64_t v42 = 0;
      uint64_t v44 = v0 + 80;
    }
    return MEMORY[0x1F4187ED8](v40, v41, v42, v43, v44);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    char v18 = *(uint64_t (**)(uint64_t))(v0 + 8);
    uint64_t v19 = MEMORY[0x1E4FBC860];
    return v18(v19);
  }
}

uint64_t sub_1BEFABFB8()
{
  *(void *)(*(void *)v1 + 352) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    uint64_t v2 = sub_1BEFAD234;
  }
  else
  {
    uint64_t v2 = sub_1BEFAC0D4;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1BEFAC0D4()
{
  uint64_t v85 = v0;
  uint64_t v2 = v0 + 72;
  unint64_t v1 = *(void *)(v0 + 72);
  uint64_t v3 = (unint64_t *)(v0 + 144);
  if (v1)
  {
    *uint64_t v3 = MEMORY[0x1E4FBC860];
    if (v1 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v4 = sub_1BEFB2938();
      swift_bridgeObjectRelease();
      if (v4) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v4 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v4)
      {
LABEL_4:
        if (v4 >= 1)
        {
          for (uint64_t i = 0; i != v4; ++i)
          {
            if ((v1 & 0xC000000000000001) != 0) {
              id v6 = (id)MEMORY[0x1C18A0B20](i, v1);
            }
            else {
              id v6 = *(id *)(v1 + 8 * i + 32);
            }
            unint64_t v7 = v6;
            if (objc_msgSend(v6, sel_resultType))
            {
            }
            else
            {
              sub_1BEFB28C8();
              sub_1BEFB28E8();
              sub_1BEFB28F8();
              sub_1BEFB28D8();
            }
          }
          swift_bridgeObjectRelease();
          unint64_t v8 = *v3;
          uint64_t v2 = v0 + 72;
          goto LABEL_40;
        }
        __break(1u);
        goto LABEL_44;
      }
    }
    swift_bridgeObjectRelease();
    unint64_t v8 = MEMORY[0x1E4FBC860];
LABEL_40:
    sub_1BEFAD358(v8);
    uint64_t v72 = (void *)swift_task_alloc();
    *(void *)(v0 + 344) = v72;
    *uint64_t v72 = v0;
    v72[1] = sub_1BEFABFB8;
    uint64_t v73 = *(void *)(v0 + 184);
    return MEMORY[0x1F4187ED8](v2, 0, 0, v73, v0 + 80);
  }
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 296);
  uint64_t v10 = *(void *)(v0 + 280);
  uint64_t v11 = *(void *)(v0 + 256);
  (*(void (**)(void, void))(*(void *)(v0 + 192) + 8))(*(void *)(v0 + 200), *(void *)(v0 + 184));
  uint64_t v12 = swift_task_alloc();
  v9(v12, v10, v11);
  unint64_t v13 = *(void *)(v0 + 64);
  swift_bridgeObjectRetain_n();
  uint64_t v14 = sub_1BEFB2588();
  os_log_type_t v15 = sub_1BEFB27D8();
  BOOL v16 = os_log_type_enabled(v14, v15);
  uint64_t v17 = *(void (**)(uint64_t, uint64_t))(v0 + 312);
  uint64_t v18 = *(void *)(v0 + 256);
  uint64_t v79 = v0 + 72;
  if (v16)
  {
    os_log_type_t v77 = v15;
    log = v14;
    uint64_t v74 = *(void (**)(uint64_t, uint64_t))(v0 + 312);
    unint64_t v1 = swift_slowAlloc();
    uint64_t v76 = swift_slowAlloc();
    v84[0] = v76;
    *(_DWORD *)unint64_t v1 = 136315394;
    sub_1BEFAFDB0();
    uint64_t v19 = sub_1BEFB2998();
    *(void *)(v0 + 128) = sub_1BEF946CC(v19, v20, v84);
    char v75 = (uint64_t *)(v0 + 136);
    sub_1BEFB2828();
    swift_bridgeObjectRelease();
    v74(v12, v18);
    *(_WORD *)(v1 + 12) = 2048;
    if (!(v13 >> 62))
    {
      uint64_t v21 = *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_17:
      swift_bridgeObjectRelease();
      *char v75 = v21;
      sub_1BEFB2828();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1BEF57000, log, v77, "Query is complete (%s) with: %ld items", (uint8_t *)v1, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1C18A1630](v76, -1, -1);
      MEMORY[0x1C18A1630](v1, -1, -1);

      goto LABEL_19;
    }
LABEL_44:
    swift_bridgeObjectRetain();
    uint64_t v21 = sub_1BEFB2938();
    swift_bridgeObjectRelease();
    goto LABEL_17;
  }
  swift_bridgeObjectRelease();
  v17(v12, v18);
  swift_bridgeObjectRelease();

LABEL_19:
  uint64_t v22 = *(void *)(v0 + 352);
  swift_task_dealloc();
  sub_1BEFB25B8();
  swift_beginAccess();
  swift_retain();
  unint64_t v23 = swift_bridgeObjectRetain();
  *(void *)(v0 + 360) = sub_1BEFAF444(v23);
  *(void *)(v0 + 368) = v22;
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain_n();
  uint64_t v24 = sub_1BEFB2588();
  os_log_type_t v25 = sub_1BEFB27B8();
  if (os_log_type_enabled(v24, v25))
  {
    char v26 = (uint8_t *)swift_slowAlloc();
    uint64_t v27 = swift_slowAlloc();
    v84[0] = v27;
    *(_DWORD *)char v26 = 136380675;
    uint64_t v28 = swift_bridgeObjectRetain();
    uint64_t v29 = MEMORY[0x1C18A09B0](v28, MEMORY[0x1E4FBB1A0]);
    unint64_t v31 = v30;
    swift_bridgeObjectRelease();
    *(void *)(v79 + 48) = sub_1BEF946CC(v29, v31, v84);
    sub_1BEFB2828();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1BEF57000, v24, v25, "Will query for IDS status for handles: %{private}s", v26, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C18A1630](v27, -1, -1);
    MEMORY[0x1C18A1630](v26, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  char v32 = *(unsigned char *)(v0 + 425);
  uint64_t v33 = MEMORY[0x1E4FBC868];
  *(void *)(v0 + 96) = MEMORY[0x1E4FBC868];
  LOBYTE(v84[0]) = v32;
  uint64_t v34 = ComposeRecipientFetchRequest.Client.services.getter();
  *(void *)(v0 + 376) = v34;
  uint64_t v35 = v34[2];
  *(void *)(v0 + 384) = v35;
  if (v35)
  {
    uint64_t v36 = *(void **)(v0 + 176);
    *(void *)(v0 + 392) = v33;
    *(void *)(v0 + 400) = 0;
    char v37 = *((unsigned char *)v34 + 32);
    *(unsigned char *)(v0 + 428) = v37;
    uint64_t v38 = v36[6];
    uint64_t v39 = v36[7];
    __swift_project_boxed_opaque_existential_1(v36 + 3, v38);
    *(unsigned char *)(v0 + 424) = v37;
    uint64_t v80 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v39 + 8) + **(int **)(v39 + 8));
    uint64_t v40 = (void *)swift_task_alloc();
    *(void *)(v0 + 408) = v40;
    *uint64_t v40 = v0;
    v40[1] = sub_1BEFACB48;
    uint64_t v41 = *(void *)(v0 + 360);
    return v80(v41, v0 + 424, v38, v39);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v43 = sub_1BEFB2588();
    os_log_type_t v44 = sub_1BEFB27B8();
    if (os_log_type_enabled(v43, v44))
    {
      uint64_t v45 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v45 = 0;
      _os_log_impl(&dword_1BEF57000, v43, v44, "Did query for IDS status", v45, 2u);
      MEMORY[0x1C18A1630](v45, -1, -1);
    }
    int v46 = *(unsigned __int8 *)(v0 + 426);
    uint64_t v47 = *(void *)(v0 + 176);

    swift_retain();
    unint64_t v48 = swift_bridgeObjectRetain();
    sub_1BEFAF6A8(v48, v47, (uint64_t *)(v79 + 24));
    uint64_t v50 = v49;
    swift_release();
    swift_bridgeObjectRelease_n();
    if (v46 == 1)
    {
      unint64_t v51 = sub_1BEFB2588();
      os_log_type_t v52 = sub_1BEFB27B8();
      if (os_log_type_enabled(v51, v52))
      {
        id v53 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v53 = 0;
        _os_log_impl(&dword_1BEF57000, v51, v52, "Will unify results", v53, 2u);
        MEMORY[0x1C18A1630](v53, -1, -1);
      }

      type metadata accessor for CombinesRecipients();
      uint64_t v54 = sub_1BEF8AF20();
      uint64_t v82 = (*(uint64_t (**)(uint64_t))(*(void *)v54 + 80))(v50);
      swift_bridgeObjectRelease();
      swift_release();
      uint64_t v55 = sub_1BEFB2588();
      os_log_type_t v56 = sub_1BEFB27B8();
      if (os_log_type_enabled(v55, v56))
      {
        uint64_t v57 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v57 = 0;
        _os_log_impl(&dword_1BEF57000, v55, v56, "Did unify results", v57, 2u);
        MEMORY[0x1C18A1630](v57, -1, -1);
      }
      uint64_t v58 = *(void **)(v0 + 328);
      char v81 = *(void (**)(uint64_t, uint64_t))(v0 + 312);
      uint64_t v59 = *(void *)(v0 + 280);
      uint64_t v60 = *(void *)(v0 + 256);
      uint64_t v62 = *(void *)(v0 + 224);
      uint64_t v61 = *(void *)(v0 + 232);
      uint64_t v63 = *(void *)(v0 + 216);

      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v62 + 8))(v61, v63);
      v81(v59, v60);
      uint64_t v50 = v82;
    }
    else
    {
      uint64_t v64 = *(void **)(v0 + 328);
      uint64_t v65 = *(void **)(v0 + 320);
      unint64_t v83 = *(void (**)(uint64_t, uint64_t))(v0 + 312);
      uint64_t v66 = *(void *)(v0 + 280);
      uint64_t v67 = *(void *)(v0 + 256);
      uint64_t v69 = *(void *)(v0 + 224);
      uint64_t v68 = *(void *)(v0 + 232);
      uint64_t v70 = *(void *)(v0 + 216);
      swift_release();

      (*(void (**)(uint64_t, uint64_t))(v69 + 8))(v68, v70);
      v83(v66, v67);
    }
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v71 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return v71(v50);
  }
}

uint64_t sub_1BEFACB48(uint64_t a1)
{
  *(void *)(*(void *)v1 + 416) = a1;
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_1BEFACC48, 0, 0);
}

uint64_t sub_1BEFACC48()
{
  uint64_t v1 = *(void *)(v0 + 392);
  unsigned __int8 v2 = *(unsigned char *)(v0 + 428);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(v0 + 96) = 0x8000000000000000;
  *(void *)(v0 + 112) = v1;
  unint64_t v5 = sub_1BEF94E40(v2);
  uint64_t v6 = *(void *)(v1 + 16);
  BOOL v7 = (v4 & 1) == 0;
  uint64_t result = v6 + v7;
  if (__OFADD__(v6, v7))
  {
    __break(1u);
    goto LABEL_31;
  }
  char v9 = v4;
  if (*(void *)(*(void *)(v0 + 392) + 24) >= result)
  {
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      uint64_t result = (uint64_t)sub_1BEFAECF4();
    }
  }
  else
  {
    unsigned __int8 v10 = *(unsigned char *)(v0 + 428);
    sub_1BEFAE53C(result, isUniquelyReferenced_nonNull_native);
    uint64_t result = sub_1BEF94E40(v10);
    if ((v9 & 1) != (v11 & 1))
    {
      return sub_1BEFB29D8();
    }
    unint64_t v5 = result;
  }
  uint64_t v12 = *(void **)(v0 + 112);
  uint64_t v13 = *(void *)(v0 + 416);
  if (v9)
  {
    uint64_t v14 = v12[7];
    swift_bridgeObjectRelease();
    *(void *)(v14 + 8 * v5) = v13;
    goto LABEL_14;
  }
  char v15 = *(unsigned char *)(v0 + 428);
  v12[(v5 >> 6) + 8] |= 1 << v5;
  *(unsigned char *)(v12[6] + v5) = v15;
  *(void *)(v12[7] + 8 * v5) = v13;
  uint64_t v16 = v12[2];
  BOOL v17 = __OFADD__(v16, 1);
  uint64_t v18 = v16 + 1;
  if (v17)
  {
LABEL_31:
    __break(1u);
    return result;
  }
  v12[2] = v18;
LABEL_14:
  uint64_t v19 = *(void *)(v0 + 384);
  uint64_t v20 = *(void *)(v0 + 400) + 1;
  *(void *)(v0 + 96) = v12;
  swift_bridgeObjectRelease();
  if (v20 == v19)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v21 = sub_1BEFB2588();
    os_log_type_t v22 = sub_1BEFB27B8();
    if (os_log_type_enabled(v21, v22))
    {
      unint64_t v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v23 = 0;
      _os_log_impl(&dword_1BEF57000, v21, v22, "Did query for IDS status", v23, 2u);
      MEMORY[0x1C18A1630](v23, -1, -1);
    }
    int v24 = *(unsigned __int8 *)(v0 + 426);
    uint64_t v25 = *(void *)(v0 + 176);

    swift_retain();
    unint64_t v26 = swift_bridgeObjectRetain();
    sub_1BEFAF6A8(v26, v25, (uint64_t *)(v0 + 96));
    uint64_t v28 = v27;
    swift_release();
    swift_bridgeObjectRelease_n();
    if (v24 == 1)
    {
      uint64_t v29 = sub_1BEFB2588();
      os_log_type_t v30 = sub_1BEFB27B8();
      if (os_log_type_enabled(v29, v30))
      {
        unint64_t v31 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v31 = 0;
        _os_log_impl(&dword_1BEF57000, v29, v30, "Will unify results", v31, 2u);
        MEMORY[0x1C18A1630](v31, -1, -1);
      }

      type metadata accessor for CombinesRecipients();
      uint64_t v32 = sub_1BEF8AF20();
      uint64_t v59 = (*(uint64_t (**)(uint64_t))(*(void *)v32 + 80))(v28);
      swift_bridgeObjectRelease();
      swift_release();
      uint64_t v33 = sub_1BEFB2588();
      os_log_type_t v34 = sub_1BEFB27B8();
      if (os_log_type_enabled(v33, v34))
      {
        uint64_t v35 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v35 = 0;
        _os_log_impl(&dword_1BEF57000, v33, v34, "Did unify results", v35, 2u);
        MEMORY[0x1C18A1630](v35, -1, -1);
      }
      uint64_t v36 = *(void **)(v0 + 328);
      uint64_t v57 = *(void (**)(uint64_t, uint64_t))(v0 + 312);
      uint64_t v37 = *(void *)(v0 + 280);
      uint64_t v38 = *(void *)(v0 + 256);
      uint64_t v40 = *(void *)(v0 + 224);
      uint64_t v39 = *(void *)(v0 + 232);
      uint64_t v41 = *(void *)(v0 + 216);

      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v39, v41);
      v57(v37, v38);
      uint64_t v28 = v59;
    }
    else
    {
      uint64_t v49 = *(void **)(v0 + 328);
      uint64_t v50 = *(void **)(v0 + 320);
      uint64_t v60 = *(void (**)(uint64_t, uint64_t))(v0 + 312);
      uint64_t v51 = *(void *)(v0 + 280);
      uint64_t v52 = *(void *)(v0 + 256);
      uint64_t v54 = *(void *)(v0 + 224);
      uint64_t v53 = *(void *)(v0 + 232);
      uint64_t v55 = *(void *)(v0 + 216);
      swift_release();

      (*(void (**)(uint64_t, uint64_t))(v54 + 8))(v53, v55);
      v60(v51, v52);
    }
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    os_log_type_t v56 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return v56(v28);
  }
  else
  {
    uint64_t v42 = *(void *)(v0 + 400) + 1;
    *(void *)(v0 + 392) = v12;
    *(void *)(v0 + 400) = v42;
    uint64_t v43 = *(void **)(v0 + 176);
    char v44 = *(unsigned char *)(*(void *)(v0 + 376) + v42 + 32);
    *(unsigned char *)(v0 + 428) = v44;
    uint64_t v45 = v43[6];
    uint64_t v46 = v43[7];
    __swift_project_boxed_opaque_existential_1(v43 + 3, v45);
    *(unsigned char *)(v0 + 424) = v44;
    uint64_t v58 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v46 + 8) + **(int **)(v46 + 8));
    uint64_t v47 = (void *)swift_task_alloc();
    *(void *)(v0 + 408) = v47;
    *uint64_t v47 = v0;
    v47[1] = sub_1BEFACB48;
    uint64_t v48 = *(void *)(v0 + 360);
    return v58(v48, v0 + 424, v45, v46);
  }
}

uint64_t sub_1BEFAD234()
{
  uint64_t v1 = (void *)v0[41];
  unsigned __int8 v2 = (void *)v0[40];
  uint64_t v3 = v0[35];
  uint64_t v12 = v0[32];
  uint64_t v13 = (void (*)(uint64_t, uint64_t))v0[39];
  uint64_t v4 = v0[28];
  uint64_t v5 = v0[29];
  uint64_t v6 = v0[27];
  uint64_t v7 = v0[24];
  uint64_t v8 = v0[25];
  uint64_t v9 = v0[23];
  swift_release();

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v8, v9);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v5, v6);
  v13(v3, v12);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unsigned __int8 v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_1BEFAD358(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_1BEFB2938();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_1BEFB2938();
    swift_bridgeObjectRelease();
    uint64_t v6 = v5 + v3;
    if (!__OFADD__(v5, v3)) {
      goto LABEL_5;
    }
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3)) {
    goto LABEL_25;
  }
LABEL_5:
  unint64_t v4 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v1 = v4;
  uint64_t v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_15;
    }
    uint64_t v5 = 1;
  }
  if (v4 >> 62) {
    goto LABEL_27;
  }
  uint64_t v9 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6) {
      uint64_t v9 = v6;
    }
    swift_bridgeObjectRetain();
    unint64_t v4 = MEMORY[0x1C18A0B30](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *uint64_t v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    uint64_t v10 = sub_1BEFAF054(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_1BEFB2938();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return MEMORY[0x1F4183E98](v10);
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
  }
  uint64_t v10 = swift_bridgeObjectRelease();
  return MEMORY[0x1F4183E98](v10);
}

uint64_t sub_1BEFAD524(uint64_t a1, unint64_t a2)
{
  if (sub_1BEFB26F8())
  {
    if (qword_1EA13F4F0 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_1BEFB25A8();
    __swift_project_value_buffer(v5, (uint64_t)qword_1EA13F7D8);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = sub_1BEFB2588();
    os_log_type_t v7 = sub_1BEFB27B8();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      v37[0] = v9;
      *(_DWORD *)uint64_t v8 = 136380675;
      swift_bridgeObjectRetain();
      v36[0] = sub_1BEF946CC(a1, a2, v37);
      sub_1BEFB2828();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1BEF57000, v6, v7, "Assuming '%{private}s' is already formatted", v8, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C18A1630](v9, -1, -1);
      MEMORY[0x1C18A1630](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    goto LABEL_17;
  }
  uint64_t v10 = (uint64_t *)(v2 + 64);
  swift_beginAccess();
  uint64_t v11 = *(void *)(v2 + 64);
  if (*(void *)(v11 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v12 = sub_1BEF94D24(a1, a2);
    if (v13)
    {
      a1 = *(void *)(*(void *)(v11 + 56) + 16 * v12);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return a1;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  id v14 = objc_msgSend(self, sel_currentEnvironment);
  id v15 = objc_msgSend(v14, sel_defaultCountryCode);

  sub_1BEFB2698();
  id v16 = objc_allocWithZone(MEMORY[0x1E4F1BA70]);
  swift_bridgeObjectRetain();
  BOOL v17 = (void *)sub_1BEFB2688();
  swift_bridgeObjectRelease();
  uint64_t v18 = (void *)sub_1BEFB2688();
  swift_bridgeObjectRelease();
  id v19 = objc_msgSend(v16, sel_initWithStringValue_countryCode_, v17, v18);

  id v20 = objc_msgSend(v19, sel_unformattedInternationalStringValue);
  if (!v20)
  {

LABEL_17:
    swift_bridgeObjectRetain();
    return a1;
  }
  uint64_t v21 = v20;
  uint64_t v22 = sub_1BEFB2698();
  unint64_t v24 = v23;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v35 = *v10;
  *uint64_t v10 = 0x8000000000000000;
  sub_1BEFAEB6C(v22, v24, a1, a2, isUniquelyReferenced_nonNull_native);
  *uint64_t v10 = v35;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_endAccess();
  if (qword_1EA13F4F0 != -1) {
    swift_once();
  }
  uint64_t v26 = sub_1BEFB25A8();
  __swift_project_value_buffer(v26, (uint64_t)qword_1EA13F7D8);
  swift_bridgeObjectRetain_n();
  id v27 = v19;
  uint64_t v28 = sub_1BEFB2588();
  os_log_type_t v29 = sub_1BEFB27B8();
  if (os_log_type_enabled(v28, v29))
  {
    uint64_t v30 = swift_slowAlloc();
    unint64_t v31 = (void *)swift_slowAlloc();
    uint64_t v34 = swift_slowAlloc();
    v36[0] = v34;
    *(_DWORD *)uint64_t v30 = 138478083;
    id v32 = v27;
    sub_1BEFB2828();
    *unint64_t v31 = v27;

    *(_WORD *)(v30 + 12) = 2081;
    swift_bridgeObjectRetain();
    a1 = v22;
    sub_1BEF946CC(v22, v24, v36);
    sub_1BEFB2828();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1BEF57000, v28, v29, "Normalized %{private}@ --> %{private}s", (uint8_t *)v30, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139440);
    swift_arrayDestroy();
    MEMORY[0x1C18A1630](v31, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x1C18A1630](v34, -1, -1);
    MEMORY[0x1C18A1630](v30, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    return v22;
  }
  return a1;
}

uint64_t sub_1BEFADAFC()
{
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 24);
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186488](v0, 72, 7);
}

uint64_t sub_1BEFADB44(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(**(void **)v1 + 136) + **(int **)(**(void **)v1 + 136));
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_1BEF99C00;
  return v6(a1);
}

id sub_1BEFADC4C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v21 = a1;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139E98);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139D10);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = &v2[OBJC_IVAR____TtC20ContactsAutocompleteP33_EBE34D4C21093596BE6E4DA9F1A7E5D28StoreSpy_results];
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139D18);
  char v13 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
  v13(v11, 1, 1, v12);
  id v14 = &v2[OBJC_IVAR____TtC20ContactsAutocompleteP33_EBE34D4C21093596BE6E4DA9F1A7E5D28StoreSpy_streamContinuation];
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139E18);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v14, 1, 1, v15);
  *(void *)&v2[OBJC_IVAR____TtC20ContactsAutocompleteP33_EBE34D4C21093596BE6E4DA9F1A7E5D28StoreSpy_store] = v21;
  v23.receiver = v2;
  v23.super_class = ObjectType;
  swift_unknownObjectRetain();
  id v16 = objc_msgSendSuper2(&v23, sel_init);
  id v22 = v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139E48);
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E4FBD120], v4);
  id v17 = v16;
  sub_1BEFB2798();

  swift_unknownObjectRelease();
  v13(v10, 0, 1, v12);
  uint64_t v18 = (uint64_t)v17 + OBJC_IVAR____TtC20ContactsAutocompleteP33_EBE34D4C21093596BE6E4DA9F1A7E5D28StoreSpy_results;
  swift_beginAccess();
  sub_1BEFB01A4((uint64_t)v10, v18, &qword_1EA139D10);
  swift_endAccess();
  return v17;
}

uint64_t sub_1BEFADF14(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139E20);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139E18);
  uint64_t v8 = *(void *)(v7 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v6, a1, v7);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
  uint64_t v9 = a2 + OBJC_IVAR____TtC20ContactsAutocompleteP33_EBE34D4C21093596BE6E4DA9F1A7E5D28StoreSpy_streamContinuation;
  swift_beginAccess();
  sub_1BEFB01A4((uint64_t)v6, v9, &qword_1EA139E20);
  return swift_endAccess();
}

id sub_1BEFAE498()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1BEFAE53C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA139E60);
  char v33 = a2;
  uint64_t v6 = sub_1BEFB2958();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v32 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v31 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v18 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v19 = v18 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v20 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v20 >= v31) {
      break;
    }
    uint64_t v21 = (void *)(v5 + 64);
    unint64_t v22 = *(void *)(v32 + 8 * v20);
    ++v13;
    if (!v22)
    {
      int64_t v13 = v20 + 1;
      if (v20 + 1 >= v31) {
        goto LABEL_33;
      }
      unint64_t v22 = *(void *)(v32 + 8 * v13);
      if (!v22)
      {
        int64_t v23 = v20 + 2;
        if (v23 >= v31)
        {
LABEL_33:
          swift_release();
          if ((v33 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v22 = *(void *)(v32 + 8 * v23);
        if (!v22)
        {
          while (1)
          {
            int64_t v13 = v23 + 1;
            if (__OFADD__(v23, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v31) {
              goto LABEL_33;
            }
            unint64_t v22 = *(void *)(v32 + 8 * v13);
            ++v23;
            if (v22) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v23;
      }
    }
LABEL_30:
    unint64_t v10 = (v22 - 1) & v22;
    unint64_t v19 = __clz(__rbit64(v22)) + (v13 << 6);
LABEL_31:
    char v28 = *(unsigned char *)(*(void *)(v5 + 48) + v19);
    uint64_t v29 = *(void *)(*(void *)(v5 + 56) + 8 * v19);
    if ((v33 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    sub_1BEFA4838();
    uint64_t result = sub_1BEFB2628();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v26 = v16 == v25;
        if (v16 == v25) {
          unint64_t v16 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v11 + 8 * v16);
      }
      while (v27 == -1);
      unint64_t v17 = __clz(__rbit64(~v27)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    *(unsigned char *)(*(void *)(v7 + 48) + v17) = v28;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v29;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v21 = (void *)(v5 + 64);
  if ((v33 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v30 = 1 << *(unsigned char *)(v5 + 32);
  if (v30 >= 64) {
    bzero(v21, ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v21 = -1 << v30;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_1BEFAE844(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139E40);
  char v42 = a2;
  uint64_t v6 = sub_1BEFB2958();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v41 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v39 = v2;
  int64_t v40 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v22 = v21 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v23 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v40) {
      break;
    }
    char v24 = (void *)(v5 + 64);
    unint64_t v25 = *(void *)(v41 + 8 * v23);
    ++v13;
    if (!v25)
    {
      int64_t v13 = v23 + 1;
      if (v23 + 1 >= v40) {
        goto LABEL_33;
      }
      unint64_t v25 = *(void *)(v41 + 8 * v13);
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v39;
          if ((v42 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v25 = *(void *)(v41 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            int64_t v13 = v26 + 1;
            if (__OFADD__(v26, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v40) {
              goto LABEL_33;
            }
            unint64_t v25 = *(void *)(v41 + 8 * v13);
            ++v26;
            if (v25) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v26;
      }
    }
LABEL_30:
    unint64_t v10 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v13 << 6);
LABEL_31:
    uint64_t v31 = 16 * v22;
    uint64_t v32 = (uint64_t *)(*(void *)(v5 + 48) + v31);
    uint64_t v34 = *v32;
    uint64_t v33 = v32[1];
    uint64_t v35 = (uint64_t *)(*(void *)(v5 + 56) + v31);
    uint64_t v36 = *v35;
    uint64_t v37 = v35[1];
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_1BEFB2A28();
    sub_1BEFB26C8();
    uint64_t result = sub_1BEFB2A48();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v29 = v16 == v28;
        if (v16 == v28) {
          unint64_t v16 = 0;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v11 + 8 * v16);
      }
      while (v30 == -1);
      unint64_t v17 = __clz(__rbit64(~v30)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = 16 * v17;
    unint64_t v19 = (void *)(*(void *)(v7 + 48) + v18);
    *unint64_t v19 = v34;
    v19[1] = v33;
    int64_t v20 = (void *)(*(void *)(v7 + 56) + v18);
    void *v20 = v36;
    v20[1] = v37;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v39;
  char v24 = (void *)(v5 + 64);
  if ((v42 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v38 = 1 << *(unsigned char *)(v5 + 32);
  if (v38 >= 64) {
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v24 = -1 << v38;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_1BEFAEB6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v6 = v5;
  uint64_t v12 = *v5;
  unint64_t v14 = sub_1BEF94D24(a3, a4);
  uint64_t v15 = *(void *)(v12 + 16);
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v18 = v13;
  uint64_t v19 = *(void *)(v12 + 24);
  if (v19 >= v17 && (a5 & 1) != 0) {
    goto LABEL_7;
  }
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_1BEFAEE98();
LABEL_7:
    int64_t v20 = (void *)*v6;
    if (v18)
    {
LABEL_8:
      unint64_t v21 = (void *)(v20[7] + 16 * v14);
      uint64_t result = swift_bridgeObjectRelease();
      *unint64_t v21 = a1;
      v21[1] = a2;
      return result;
    }
    goto LABEL_11;
  }
  sub_1BEFAE844(v17, a5 & 1);
  unint64_t v23 = sub_1BEF94D24(a3, a4);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_17:
    uint64_t result = sub_1BEFB29D8();
    __break(1u);
    return result;
  }
  unint64_t v14 = v23;
  int64_t v20 = (void *)*v6;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  v20[(v14 >> 6) + 8] |= 1 << v14;
  unint64_t v25 = (uint64_t *)(v20[6] + 16 * v14);
  uint64_t *v25 = a3;
  v25[1] = a4;
  int64_t v26 = (void *)(v20[7] + 16 * v14);
  *int64_t v26 = a1;
  v26[1] = a2;
  uint64_t v27 = v20[2];
  BOOL v28 = __OFADD__(v27, 1);
  uint64_t v29 = v27 + 1;
  if (v28)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  void v20[2] = v29;
  return swift_bridgeObjectRetain();
}

void *sub_1BEFAECF4()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA139E60);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1BEFB2948();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v17 >= v13) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v18 - 1) & v18;
    unint64_t v15 = __clz(__rbit64(v18)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = *(void *)(*(void *)(v2 + 56) + 8 * v15);
    *(unsigned char *)(*(void *)(v4 + 48) + v15) = *(unsigned char *)(*(void *)(v2 + 48) + v15);
    *(void *)(*(void *)(v4 + 56) + 8 * v15) = v16;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v19 = v17 + 2;
  if (v19 >= v13) {
    goto LABEL_26;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
    int64_t v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1BEFAEE98()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139E40);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1BEFB2948();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      int64_t v9 = v25 + 1;
      if (v25 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v26 = *(void *)(v6 + 8 * v9);
      if (!v26) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v26 - 1) & v26;
    unint64_t v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    int64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    int64_t v20 = (uint64_t *)(*(void *)(v2 + 56) + v16);
    uint64_t v21 = *v20;
    uint64_t v22 = v20[1];
    unint64_t v23 = (void *)(*(void *)(v4 + 48) + v16);
    void *v23 = v19;
    v23[1] = v18;
    char v24 = (void *)(*(void *)(v4 + 56) + v16);
    void *v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v27 = v25 + 2;
  if (v27 >= v13) {
    goto LABEL_26;
  }
  unint64_t v26 = *(void *)(v6 + 8 * v27);
  if (v26)
  {
    int64_t v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v9);
    ++v27;
    if (v26) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_1BEFAF054(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_1BEFB2938();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_1BEFB2938();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_1BEFB0158((unint64_t *)&unk_1EA139E50, &qword_1EA139E48);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139E48);
          unint64_t v12 = sub_1BEFAF278(v16, i, a3);
          id v14 = *v13;
          ((void (*)(void (**)(id *), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_1BEFB0118();
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_1BEFB2978();
  __break(1u);
  return result;
}

void (*sub_1BEFAF278(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_1BEFAF328(v6, a2, a3);
  return sub_1BEFAF2E0;
}

void sub_1BEFAF2E0(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_1BEFAF328(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)MEMORY[0x1C18A0B20](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)uint64_t v3 = v4;
    return sub_1BEFAF3A8;
  }
  __break(1u);
  return result;
}

void sub_1BEFAF3A8(id *a1)
{
}

uint64_t type metadata accessor for StoreSpy()
{
  uint64_t result = qword_1EA13F510;
  if (!qword_1EA13F510) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1BEFAF3FC()
{
  swift_unknownObjectRelease();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

id sub_1BEFAF434()
{
  return objc_msgSend(*(id *)(v0 + 16), sel_cancel);
}

char *sub_1BEFAF444(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62)
  {
LABEL_24:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_1BEFB2938();
    if (v2) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v2)
    {
LABEL_3:
      unint64_t v25 = v1 & 0xC000000000000001;
      uint64_t v3 = (char *)MEMORY[0x1E4FBC860];
      uint64_t v4 = 4;
      uint64_t v23 = v2;
      unint64_t v24 = v1;
      while (1)
      {
        if (v25) {
          id v5 = (id)MEMORY[0x1C18A0B20](v4 - 4, v1);
        }
        else {
          id v5 = *(id *)(v1 + 8 * v4);
        }
        unint64_t v6 = v5;
        uint64_t v7 = v4 - 3;
        if (__OFADD__(v4 - 4, 1))
        {
          __break(1u);
          goto LABEL_24;
        }
        id v8 = objc_msgSend(v5, sel_value);
        if (v8)
        {
          unint64_t v26 = v3;
          id v9 = v8;
          id v10 = objc_msgSend(v9, sel_addressType);
          uint64_t result = (char *)objc_msgSend(v9, sel_address);
          unint64_t v12 = result;
          if (v10 == (id)2)
          {
            if (!result)
            {
              __break(1u);
              return result;
            }
            uint64_t v13 = sub_1BEFB2698();
            unint64_t v15 = v14;

            uint64_t v16 = sub_1BEFAD524(v13, v15);
            uint64_t v18 = v17;

            swift_bridgeObjectRelease();
            if (v18) {
              goto LABEL_17;
            }
            uint64_t v2 = v23;
            unint64_t v1 = v24;
            uint64_t v3 = v26;
          }
          else
          {
            if (result)
            {
              uint64_t v16 = sub_1BEFB2698();
              uint64_t v18 = v19;

LABEL_17:
              uint64_t v3 = v26;
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                uint64_t v3 = sub_1BEF8C5C0(0, *((void *)v26 + 2) + 1, 1, v26);
              }
              unint64_t v21 = *((void *)v3 + 2);
              unint64_t v20 = *((void *)v3 + 3);
              if (v21 >= v20 >> 1) {
                uint64_t v3 = sub_1BEF8C5C0((char *)(v20 > 1), v21 + 1, 1, v3);
              }
              *((void *)v3 + 2) = v21 + 1;
              uint64_t v22 = &v3[16 * v21];
              *((void *)v22 + 4) = v16;
              *((void *)v22 + 5) = v18;
              uint64_t v2 = v23;
              unint64_t v1 = v24;
              goto LABEL_5;
            }

            uint64_t v3 = v26;
          }
        }
        else
        {
        }
LABEL_5:
        ++v4;
        if (v7 == v2) {
          goto LABEL_26;
        }
      }
    }
  }
  uint64_t v3 = (char *)MEMORY[0x1E4FBC860];
LABEL_26:
  swift_bridgeObjectRelease();
  return v3;
}

void sub_1BEFAF6A8(unint64_t a1, uint64_t a2, uint64_t *a3)
{
  int64_t v4 = v3;
  uint64_t v68 = a3;
  v63[1] = a2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA139E70);
  MEMORY[0x1F4188790](v6 - 8);
  id v8 = (void *)((char *)v63 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v76 = type metadata accessor for ComposeRecipient(0);
  uint64_t v70 = *(void *)(v76 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](v76);
  uint64_t v74 = (uint64_t)v63 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  uint64_t v69 = (uint64_t)v63 - v11;
  if (a1 >> 62) {
    goto LABEL_75;
  }
  uint64_t v12 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v12)
  {
LABEL_76:
    swift_bridgeObjectRelease();
    return;
  }
LABEL_3:
  uint64_t v13 = 0;
  unint64_t v75 = a1 & 0xC000000000000001;
  unint64_t v67 = a1 + 32;
  uint64_t v73 = (void (**)(void *, uint64_t, uint64_t, uint64_t))(v70 + 56);
  uint64_t v71 = (unsigned int (**)(void *, uint64_t, uint64_t))(v70 + 48);
  os_log_type_t v77 = (void *)MEMORY[0x1E4FBC860];
  unint64_t v65 = a1;
  int64_t v66 = v4;
  uint64_t v64 = v8;
  uint64_t v72 = v12;
  while (1)
  {
    if (v75)
    {
      id v14 = (id)MEMORY[0x1C18A0B20](v13, a1);
      BOOL v15 = __OFADD__(v13, 1);
      uint64_t v16 = v13 + 1;
      if (v15) {
        goto LABEL_74;
      }
    }
    else
    {
      id v14 = *(id *)(v67 + 8 * v13);
      BOOL v15 = __OFADD__(v13, 1);
      uint64_t v16 = v13 + 1;
      if (v15) {
        goto LABEL_74;
      }
    }
    uint64_t v78 = v16;
    id v79 = v14;
    id v17 = objc_msgSend(v14, sel_value);
    if (!v17) {
      goto LABEL_59;
    }
    id v18 = v17;
    id v19 = objc_msgSend(v18, sel_addressType);
    id v20 = objc_msgSend(v18, sel_address);
    unint64_t v21 = v20;
    if (v19 == (id)2) {
      break;
    }
    if (v20)
    {
      uint64_t v80 = sub_1BEFB2698();
      uint64_t v84 = v27;

LABEL_18:
      uint64_t v28 = *v68;
      uint64_t v29 = *(void *)(*v68 + 64);
      uint64_t v81 = *v68 + 64;
      uint64_t v30 = 1 << *(unsigned char *)(v28 + 32);
      if (v30 < 64) {
        uint64_t v31 = ~(-1 << v30);
      }
      else {
        uint64_t v31 = -1;
      }
      unint64_t v32 = v31 & v29;
      int64_t v82 = (unint64_t)(v30 + 63) >> 6;
      uint64_t v83 = v28;
      swift_bridgeObjectRetain();
      int64_t v4 = 0;
      id v8 = (void *)MEMORY[0x1E4FBC868];
      while (2)
      {
        if (v32)
        {
          unint64_t v33 = __clz(__rbit64(v32));
          v32 &= v32 - 1;
          unint64_t v34 = v33 | (v4 << 6);
        }
        else
        {
          int64_t v35 = v4 + 1;
          if (__OFADD__(v4, 1)) {
            goto LABEL_72;
          }
          if (v35 >= v82)
          {
LABEL_57:
            swift_release();
            swift_bridgeObjectRelease();
            id v54 = v79;
            uint64_t v55 = (uint64_t)v8;
            id v8 = v64;
            sub_1BEF8D15C(v54, v55, (uint64_t)v64);
            uint64_t v56 = 0;
            a1 = v65;
            int64_t v4 = v66;
            goto LABEL_60;
          }
          unint64_t v36 = *(void *)(v81 + 8 * v35);
          ++v4;
          if (!v36)
          {
            int64_t v4 = v35 + 1;
            if (v35 + 1 >= v82) {
              goto LABEL_57;
            }
            unint64_t v36 = *(void *)(v81 + 8 * v4);
            if (!v36)
            {
              int64_t v4 = v35 + 2;
              if (v35 + 2 >= v82) {
                goto LABEL_57;
              }
              unint64_t v36 = *(void *)(v81 + 8 * v4);
              if (!v36)
              {
                int64_t v37 = v35 + 3;
                if (v37 >= v82) {
                  goto LABEL_57;
                }
                unint64_t v36 = *(void *)(v81 + 8 * v37);
                if (!v36)
                {
                  while (1)
                  {
                    int64_t v4 = v37 + 1;
                    if (__OFADD__(v37, 1)) {
                      goto LABEL_73;
                    }
                    if (v4 >= v82) {
                      goto LABEL_57;
                    }
                    unint64_t v36 = *(void *)(v81 + 8 * v4);
                    ++v37;
                    if (v36) {
                      goto LABEL_39;
                    }
                  }
                }
                int64_t v4 = v37;
              }
            }
          }
LABEL_39:
          unint64_t v32 = (v36 - 1) & v36;
          unint64_t v34 = __clz(__rbit64(v36)) + (v4 << 6);
        }
        unsigned __int8 v38 = *(unsigned char *)(*(void *)(v83 + 48) + v34);
        uint64_t v39 = *(void *)(*(void *)(v83 + 56) + 8 * v34);
        if (*(void *)(v39 + 16))
        {
          swift_bridgeObjectRetain();
          uint64_t v40 = v84;
          swift_bridgeObjectRetain();
          unint64_t v41 = sub_1BEF94D24(v80, v40);
          if (v42) {
            char v43 = *(unsigned char *)(*(void *)(v39 + 56) + v41);
          }
          else {
            char v43 = 2;
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        else
        {
          char v43 = 2;
        }
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v85 = v8;
        a1 = sub_1BEF94E40(v38);
        uint64_t v46 = v8[2];
        BOOL v47 = (v45 & 1) == 0;
        uint64_t v48 = v46 + v47;
        if (__OFADD__(v46, v47))
        {
          __break(1u);
LABEL_71:
          __break(1u);
LABEL_72:
          __break(1u);
LABEL_73:
          __break(1u);
LABEL_74:
          __break(1u);
LABEL_75:
          swift_bridgeObjectRetain();
          uint64_t v12 = sub_1BEFB2938();
          if (!v12) {
            goto LABEL_76;
          }
          goto LABEL_3;
        }
        char v49 = v45;
        if (v8[3] >= v48)
        {
          if (isUniquelyReferenced_nonNull_native)
          {
            if ((v45 & 1) == 0) {
              goto LABEL_53;
            }
          }
          else
          {
            sub_1BEF96648();
            id v8 = v85;
            if ((v49 & 1) == 0) {
              goto LABEL_53;
            }
          }
        }
        else
        {
          sub_1BEF95A64(v48, isUniquelyReferenced_nonNull_native);
          id v8 = v85;
          unint64_t v50 = sub_1BEF94E40(v38);
          if ((v49 & 1) != (v51 & 1)) {
            goto LABEL_78;
          }
          a1 = v50;
          if ((v49 & 1) == 0)
          {
LABEL_53:
            v8[(a1 >> 6) + 8] |= 1 << a1;
            *(unsigned char *)(v8[6] + a1) = v38;
            *(unsigned char *)(v8[7] + a1) = v43;
            uint64_t v52 = v8[2];
            BOOL v15 = __OFADD__(v52, 1);
            uint64_t v53 = v52 + 1;
            if (v15) {
              goto LABEL_71;
            }
            v8[2] = v53;
            goto LABEL_23;
          }
        }
        *(unsigned char *)(v8[7] + a1) = v43;
LABEL_23:
        swift_bridgeObjectRelease();
        continue;
      }
    }

LABEL_59:
    swift_bridgeObjectRelease();
    uint64_t v56 = 1;
LABEL_60:
    uint64_t v57 = v76;
    (*v73)(v8, v56, 1, v76);
    if (v4)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      return;
    }

    if ((*v71)(v8, 1, v57) == 1)
    {
      sub_1BEFA135C((uint64_t)v8, (uint64_t *)&unk_1EA139E70);
    }
    else
    {
      uint64_t v58 = v69;
      sub_1BEF99E88((uint64_t)v8, v69);
      sub_1BEF99E88(v58, v74);
      if (swift_isUniquelyReferenced_nonNull_native()) {
        uint64_t v59 = v77;
      }
      else {
        uint64_t v59 = (void *)sub_1BEF8AFB4(0, v77[2] + 1, 1, v77);
      }
      unint64_t v61 = v59[2];
      unint64_t v60 = v59[3];
      if (v61 >= v60 >> 1) {
        uint64_t v59 = (void *)sub_1BEF8AFB4(v60 > 1, v61 + 1, 1, v59);
      }
      _OWORD v59[2] = v61 + 1;
      unint64_t v62 = (*(unsigned __int8 *)(v70 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v70 + 80);
      os_log_type_t v77 = v59;
      sub_1BEF99E88(v74, (uint64_t)v59 + v62 + *(void *)(v70 + 72) * v61);
    }
    uint64_t v13 = v78;
    if (v78 == v72) {
      goto LABEL_76;
    }
  }
  if (v20)
  {
    uint64_t v22 = sub_1BEFB2698();
    unint64_t v24 = v23;

    uint64_t v80 = sub_1BEFAD524(v22, v24);
    uint64_t v26 = v25;
    swift_bridgeObjectRelease();

    uint64_t v84 = v26;
    if (v26) {
      goto LABEL_18;
    }
    goto LABEL_59;
  }
  __break(1u);
LABEL_78:
  sub_1BEFB29D8();
  __break(1u);
}

unint64_t sub_1BEFAFDB0()
{
  unint64_t result = qword_1EA139D90;
  if (!qword_1EA139D90)
  {
    sub_1BEFB2308();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA139D90);
  }
  return result;
}

uint64_t _s10DirectImplCMa()
{
  return self;
}

uint64_t sub_1BEFAFE20()
{
  return type metadata accessor for StoreSpy();
}

void sub_1BEFAFE28()
{
  sub_1BEFAFF18(319, &qword_1EA139E08, &qword_1EA139D18);
  if (v0 <= 0x3F)
  {
    sub_1BEFAFF18(319, &qword_1EA139E10, &qword_1EA139E18);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_1BEFAFF18(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  if (!*a2)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    unint64_t v4 = sub_1BEFB2818();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_1BEFAFF68(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1BEFAFFCC(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139E18);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = v1 + OBJC_IVAR____TtC20ContactsAutocompleteP33_EBE34D4C21093596BE6E4DA9F1A7E5D28StoreSpy_streamContinuation;
  swift_beginAccess();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v7, 1, v3);
  if (!result)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v7, v3);
    uint64_t v10 = a1;
    id v9 = a1;
    sub_1BEFB2768();
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  return result;
}

unint64_t sub_1BEFB0118()
{
  unint64_t result = qword_1EA139E30;
  if (!qword_1EA139E30)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EA139E30);
  }
  return result;
}

uint64_t sub_1BEFB0158(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1BEFB019C(uint64_t a1)
{
  return sub_1BEFADF14(a1, *(void *)(v1 + 16));
}

uint64_t sub_1BEFB01A4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t sub_1BEFB0208()
{
  uint64_t v0 = sub_1BEFB25A8();
  __swift_allocate_value_buffer(v0, qword_1EA13F7F0);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EA13F7F0);
  return sub_1BEFB2598();
}

uint64_t sub_1BEFB0284()
{
  if (qword_1EA13F520 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1BEFB25A8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EA13F7F0);
}

void *AutocompleteStore.__allocating_init()()
{
  uint64_t v0 = (void *)swift_allocObject();
  uint64_t v1 = _s10DirectImplCMa();
  id v2 = sub_1BEFAB404();
  sub_1BEFAB43C((uint64_t *)v5);
  uint64_t v3 = sub_1BEFAB47C((uint64_t)v2, v5);
  v0[5] = v1;
  v0[6] = &off_1F1A2F1A8;
  v0[2] = v3;
  return v0;
}

void *AutocompleteStore.init()()
{
  uint64_t v1 = v0;
  uint64_t v2 = _s10DirectImplCMa();
  id v3 = sub_1BEFAB404();
  sub_1BEFAB43C((uint64_t *)v6);
  uint64_t v4 = sub_1BEFAB47C((uint64_t)v3, v6);
  v1[5] = v2;
  v1[6] = &off_1F1A2F1A8;
  v1[2] = v4;
  return v1;
}

uint64_t AutocompleteStore.__allocating_init(strategy:)(unsigned char *a1)
{
  uint64_t v2 = swift_allocObject();
  AutocompleteStore.init(strategy:)(a1);
  return v2;
}

void *AutocompleteStore.init(strategy:)(unsigned char *a1)
{
  uint64_t v2 = v1;
  if (*a1)
  {
    uint64_t v3 = _s13AppIntentImplCMa();
    char v12 = 0;
    uint64_t v4 = sub_1BEF9848C();
    unint64_t v6 = v5;
    sub_1BEF98498((uint64_t *)v11);
    uint64_t v7 = sub_1BEF984D8(&v12, 0, 0xE000000000000000, v4, v6, v11);
    id v8 = &off_1F1A2E600;
  }
  else
  {
    uint64_t v3 = _s10DirectImplCMa();
    id v9 = sub_1BEFAB404();
    sub_1BEFAB43C((uint64_t *)v11);
    uint64_t v7 = sub_1BEFAB47C((uint64_t)v9, v11);
    id v8 = &off_1F1A2F1A8;
  }
  v2[5] = v3;
  v2[6] = v8;
  v2[2] = v7;
  return v2;
}

uint64_t AutocompleteStore.__allocating_init(client:strategy:)(char *a1, unsigned char *a2)
{
  uint64_t v4 = swift_allocObject();
  AutocompleteStore.init(client:strategy:)(a1, a2);
  return v4;
}

void *AutocompleteStore.init(client:strategy:)(char *a1, unsigned char *a2)
{
  uint64_t v3 = v2;
  if (*a2)
  {
    char v4 = *a1;
    uint64_t v5 = _s13AppIntentImplCMa();
    char v14 = v4;
    uint64_t v6 = sub_1BEF9848C();
    unint64_t v8 = v7;
    sub_1BEF98498((uint64_t *)v13);
    uint64_t v9 = sub_1BEF984D8(&v14, 0, 0xE000000000000000, v6, v8, v13);
    uint64_t v10 = &off_1F1A2E600;
  }
  else
  {
    uint64_t v5 = _s10DirectImplCMa();
    id v11 = sub_1BEFAB404();
    sub_1BEFAB43C((uint64_t *)v13);
    uint64_t v9 = sub_1BEFAB47C((uint64_t)v11, v13);
    uint64_t v10 = &off_1F1A2F1A8;
  }
  v3[5] = v5;
  v3[6] = v10;
  v3[2] = v9;
  return v3;
}

uint64_t sub_1BEFB05E4(long long *a1)
{
  uint64_t v2 = swift_allocObject();
  sub_1BEF96BE4(a1, v2 + 16);
  return v2;
}

BOOL static AutocompleteStore.Client.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t AutocompleteStore.Client.hash(into:)()
{
  return sub_1BEFB2A38();
}

uint64_t AutocompleteStore.Client.hashValue.getter()
{
  return sub_1BEFB2A48();
}

uint64_t AutocompleteStore.Strategy.hash(into:)()
{
  return sub_1BEFB2A38();
}

BOOL static AutocompleteStore.Strategy.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t AutocompleteStore.Strategy.hashValue.getter()
{
  return sub_1BEFB2A48();
}

BOOL sub_1BEFB073C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t AutocompleteStore.deinit()
{
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  return v0;
}

uint64_t AutocompleteStore.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  return MEMORY[0x1F4186488](v0, 56, 7);
}

uint64_t sub_1BEFB07AC()
{
  sub_1BEFB2878();
  swift_bridgeObjectRelease();
  strcpy((char *)v1, "Autocomplete(");
  sub_1BEFB26D8();
  swift_bridgeObjectRelease();
  sub_1BEFB26D8();
  return v1[0];
}

uint64_t AutocompleteStore.execute(_:)(uint64_t *a1)
{
  uint64_t v3 = *a1;
  *(void *)(v2 + 48) = v1;
  *(void *)(v2 + 56) = v3;
  *(unsigned char *)(v2 + 41) = *((unsigned char *)a1 + 8);
  *(unsigned char *)(v2 + 42) = *((unsigned char *)a1 + 9);
  *(void *)(v2 + 64) = a1[2];
  *(unsigned char *)(v2 + 43) = *((unsigned char *)a1 + 24);
  return MEMORY[0x1F4188298](sub_1BEFB0914, 0, 0);
}

uint64_t sub_1BEFB0914()
{
  char v1 = *(unsigned char *)(v0 + 43);
  uint64_t v3 = *(void *)(v0 + 56);
  uint64_t v2 = *(void *)(v0 + 64);
  char v4 = *(unsigned char *)(v0 + 42);
  char v5 = *(unsigned char *)(v0 + 41);
  uint64_t v6 = *(void **)(v0 + 48);
  uint64_t v7 = v6[5];
  uint64_t v8 = v6[6];
  __swift_project_boxed_opaque_existential_1(v6 + 2, v7);
  *(void *)(v0 + 16) = v3;
  *(unsigned char *)(v0 + 24) = v5;
  *(unsigned char *)(v0 + 25) = v4;
  *(void *)(v0 + 32) = v2;
  *(unsigned char *)(v0 + 40) = v1;
  id v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 + 8) + **(int **)(v8 + 8));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v9;
  void *v9 = v0;
  v9[1] = sub_1BEFB0A5C;
  return v11(v0 + 16, v7, v8);
}

uint64_t sub_1BEFB0A5C(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(v4 + 80) = v1;
  swift_task_dealloc();
  if (v1)
  {
    return MEMORY[0x1F4188298](sub_1BEFB0B98, 0, 0);
  }
  else
  {
    char v5 = *(uint64_t (**)(uint64_t))(v4 + 8);
    return v5(a1);
  }
}

uint64_t sub_1BEFB0B98()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_1BEFB0BB4()
{
  unint64_t result = qword_1EA139F08;
  if (!qword_1EA139F08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA139F08);
  }
  return result;
}

unint64_t sub_1BEFB0C0C()
{
  unint64_t result = qword_1EA139F10;
  if (!qword_1EA139F10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA139F10);
  }
  return result;
}

uint64_t sub_1BEFB0C60(uint64_t *a1)
{
  uint64_t v3 = *a1;
  *(void *)(v2 + 48) = *v1;
  *(void *)(v2 + 56) = v3;
  *(unsigned char *)(v2 + 41) = *((unsigned char *)a1 + 8);
  *(unsigned char *)(v2 + 42) = *((unsigned char *)a1 + 9);
  *(void *)(v2 + 64) = a1[2];
  *(unsigned char *)(v2 + 43) = *((unsigned char *)a1 + 24);
  return MEMORY[0x1F4188298](sub_1BEFB0914, 0, 0);
}

uint64_t dispatch thunk of AutocompleteStoreProtocol.execute(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 8) + **(int **)(a3 + 8));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_1BEFB0DAC;
  return v9(a1, a2, a3);
}

uint64_t sub_1BEFB0DAC(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t type metadata accessor for AutocompleteStore()
{
  return self;
}

uint64_t method lookup function for AutocompleteStore(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for AutocompleteStore);
}

uint64_t dispatch thunk of AutocompleteStore.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of AutocompleteStore.__allocating_init(strategy:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of AutocompleteStore.__allocating_init(client:strategy:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

unsigned char *storeEnumTagSinglePayload for AutocompleteStore.Client(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *unint64_t result = a2 + 3;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1BEFB0FECLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AutocompleteStore.Client()
{
  return &type metadata for AutocompleteStore.Client;
}

unsigned char *storeEnumTagSinglePayload for AutocompleteStore.Strategy(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *unint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1BEFB10F0);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AutocompleteStore.Strategy()
{
  return &type metadata for AutocompleteStore.Strategy;
}

void __LoadPeopleSuggester_block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = *__error();
  v1[0] = 67109120;
  v1[1] = v0;
  _os_log_error_impl(&dword_1BEF57000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to Soft Link: /System/Library/PrivateFrameworks/PeopleSuggester.framework/PeopleSuggester (%d)", (uint8_t *)v1, 8u);
}

void __LoadCoreSuggestions_block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = *__error();
  v1[0] = 67109120;
  v1[1] = v0;
  _os_log_error_impl(&dword_1BEF57000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to Soft Link: /System/Library/PrivateFrameworks/CoreSuggestions.framework/CoreSuggestions (%d)", (uint8_t *)v1, 8u);
}

void __LoadEventKit_block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = *__error();
  v1[0] = 67109120;
  v1[1] = v0;
  _os_log_error_impl(&dword_1BEF57000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to Soft Link: /System/Library/Frameworks/EventKit.framework/EventKit (%d)", (uint8_t *)v1, 8u);
}

void CNAutocompleteDelegateMultipleCallbacks_cold_1(void *a1, NSObject *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  unsigned int v4 = [a1 delegate];
  uint64_t v5 = (objc_class *)objc_opt_class();
  unsigned int v6 = NSStringFromClass(v5);
  int v7 = 138412802;
  uint64_t v8 = v6;
  __int16 v9 = 2112;
  uint64_t v10 = a1;
  __int16 v11 = 2080;
  uint64_t v12 = "CNAutocompleteDelegateMultipleCallbacks";
  _os_log_fault_impl(&dword_1BEF57000, a2, OS_LOG_TYPE_FAULT, "Error: Delegate of class %@ called completion handler multiple times for query %@. This is contributing to a degradation of system performance. In the future, this will be a hard error. Break on %s() to debug.", (uint8_t *)&v7, 0x20u);
}

void sSortResultsByPreferredDomain_block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_2();
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(v1, "hasPreferredDomain"));
  int v3 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(v0, "hasPreferredDomain"));
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1BEF57000, v4, v5, "Comparing preferred domain of %{private}@ (%@) with %{private}@ (%@)", v6, v7, v8, v9, v10);
}

void sSortResultsByDisplayName_block_invoke_5_cold_1()
{
  OUTLINED_FUNCTION_2();
  uint64_t v2 = [v1 displayName];
  uint64_t v9 = [v0 displayName];
  OUTLINED_FUNCTION_1_0(&dword_1BEF57000, v3, v4, "Comparing display name of %{private}@ (%{private}@) with %{private}@ (%{private}@)", v5, v6, v7, v8, 3u);
}

void sSortRecentResultsBySendingAddressMatch_block_invoke_8_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_1BEF57000, v0, v1, "Comparing sending address match of %{private}@ with %{private}@");
}

void sSortRecentResultsByCompletingChosenGroup_block_invoke_10_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_1BEF57000, v0, v1, "Comparing completes current group for %{private}@ and %{private}@");
}

void sSortRecentResultsByDate_block_invoke_11_cold_1()
{
  OUTLINED_FUNCTION_2();
  uint64_t v2 = [v1 date];
  uint64_t v3 = [v0 date];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1BEF57000, v4, v5, "Comparing recent date of %{private}@ (%@) with %{private}@ (%@)", v6, v7, v8, v9, v10);
}

uint64_t sub_1BEFB2258()
{
  return MEMORY[0x1F40D3DD8]();
}

uint64_t sub_1BEFB2268()
{
  return MEMORY[0x1F40D3DE0]();
}

uint64_t sub_1BEFB2278()
{
  return MEMORY[0x1F40D3E50]();
}

uint64_t sub_1BEFB2288()
{
  return MEMORY[0x1F40E43B0]();
}

uint64_t sub_1BEFB2298()
{
  return MEMORY[0x1F40E43C8]();
}

uint64_t sub_1BEFB22A8()
{
  return MEMORY[0x1F40E4580]();
}

uint64_t sub_1BEFB22B8()
{
  return MEMORY[0x1F40E45B0]();
}

uint64_t sub_1BEFB22C8()
{
  return MEMORY[0x1F40E45D0]();
}

uint64_t sub_1BEFB22D8()
{
  return MEMORY[0x1F40E5398]();
}

uint64_t sub_1BEFB22E8()
{
  return MEMORY[0x1F40E53F0]();
}

uint64_t sub_1BEFB22F8()
{
  return MEMORY[0x1F40E5440]();
}

uint64_t sub_1BEFB2308()
{
  return MEMORY[0x1F40E5450]();
}

uint64_t sub_1BEFB2318()
{
  return MEMORY[0x1F40E5730]();
}

uint64_t sub_1BEFB2328()
{
  return MEMORY[0x1F40E5888]();
}

uint64_t sub_1BEFB2338()
{
  return MEMORY[0x1F4108908]();
}

uint64_t sub_1BEFB2348()
{
  return MEMORY[0x1F4108918]();
}

uint64_t sub_1BEFB2358()
{
  return MEMORY[0x1F4108938]();
}

uint64_t sub_1BEFB2368()
{
  return MEMORY[0x1F4108940]();
}

uint64_t sub_1BEFB2378()
{
  return MEMORY[0x1F4108958]();
}

uint64_t sub_1BEFB2388()
{
  return MEMORY[0x1F4108960]();
}

uint64_t sub_1BEFB2398()
{
  return MEMORY[0x1F4108978]();
}

uint64_t sub_1BEFB23A8()
{
  return MEMORY[0x1F4108980]();
}

uint64_t sub_1BEFB23B8()
{
  return MEMORY[0x1F4108990]();
}

uint64_t sub_1BEFB23C8()
{
  return MEMORY[0x1F41089A8]();
}

uint64_t sub_1BEFB23D8()
{
  return MEMORY[0x1F41089B0]();
}

uint64_t sub_1BEFB23E8()
{
  return MEMORY[0x1F41089C8]();
}

uint64_t sub_1BEFB23F8()
{
  return MEMORY[0x1F41089D0]();
}

uint64_t sub_1BEFB2418()
{
  return MEMORY[0x1F4108A68]();
}

uint64_t sub_1BEFB2428()
{
  return MEMORY[0x1F4108A70]();
}

uint64_t sub_1BEFB2438()
{
  return MEMORY[0x1F4108A78]();
}

uint64_t sub_1BEFB2448()
{
  return MEMORY[0x1F4108AC0]();
}

uint64_t sub_1BEFB2458()
{
  return MEMORY[0x1F4108AD0]();
}

uint64_t sub_1BEFB2468()
{
  return MEMORY[0x1F4108AD8]();
}

uint64_t sub_1BEFB2478()
{
  return MEMORY[0x1F4108AE8]();
}

uint64_t sub_1BEFB2488()
{
  return MEMORY[0x1F4108B00]();
}

uint64_t sub_1BEFB2498()
{
  return MEMORY[0x1F4108B10]();
}

uint64_t sub_1BEFB24A8()
{
  return MEMORY[0x1F4108B20]();
}

uint64_t sub_1BEFB24B8()
{
  return MEMORY[0x1F4108B40]();
}

uint64_t sub_1BEFB24C8()
{
  return MEMORY[0x1F4108B58]();
}

uint64_t sub_1BEFB24D8()
{
  return MEMORY[0x1F4108B68]();
}

uint64_t sub_1BEFB24E8()
{
  return MEMORY[0x1F4108BC8]();
}

uint64_t sub_1BEFB24F8()
{
  return MEMORY[0x1F4108C10]();
}

uint64_t sub_1BEFB2508()
{
  return MEMORY[0x1F4108C18]();
}

uint64_t sub_1BEFB2518()
{
  return MEMORY[0x1F4108C20]();
}

uint64_t sub_1BEFB2528()
{
  return MEMORY[0x1F4108C30]();
}

uint64_t sub_1BEFB2538()
{
  return MEMORY[0x1F4108C38]();
}

uint64_t sub_1BEFB2548()
{
  return MEMORY[0x1F4108C40]();
}

uint64_t sub_1BEFB2558()
{
  return MEMORY[0x1F4108D38]();
}

uint64_t sub_1BEFB2568()
{
  return MEMORY[0x1F4108D48]();
}

uint64_t sub_1BEFB2578()
{
  return MEMORY[0x1F4187A18]();
}

uint64_t sub_1BEFB2588()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1BEFB2598()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1BEFB25A8()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1BEFB25B8()
{
  return MEMORY[0x1F40D6950]();
}

uint64_t sub_1BEFB25C8()
{
  return MEMORY[0x1F40D6960]();
}

uint64_t sub_1BEFB25D8()
{
  return MEMORY[0x1F40D6988]();
}

uint64_t sub_1BEFB25E8()
{
  return MEMORY[0x1F4186D20]();
}

uint64_t sub_1BEFB25F8()
{
  return MEMORY[0x1F4186D68]();
}

uint64_t sub_1BEFB2608()
{
  return MEMORY[0x1F40E6028]();
}

uint64_t sub_1BEFB2618()
{
  return MEMORY[0x1F4183318]();
}

uint64_t sub_1BEFB2628()
{
  return MEMORY[0x1F41835C0]();
}

uint64_t sub_1BEFB2638()
{
  return MEMORY[0x1F41835C8]();
}

uint64_t sub_1BEFB2648()
{
  return MEMORY[0x1F4183730]();
}

uint64_t sub_1BEFB2658()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1BEFB2668()
{
  return MEMORY[0x1F40E60B0]();
}

uint64_t sub_1BEFB2678()
{
  return MEMORY[0x1F40E6150]();
}

uint64_t sub_1BEFB2688()
{
  return MEMORY[0x1F40E6198]();
}

uint64_t sub_1BEFB2698()
{
  return MEMORY[0x1F40E61D0]();
}

uint64_t sub_1BEFB26A8()
{
  return MEMORY[0x1F40E62D8]();
}

uint64_t sub_1BEFB26B8()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1BEFB26C8()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1BEFB26D8()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1BEFB26E8()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1BEFB26F8()
{
  return MEMORY[0x1F4183B30]();
}

uint64_t sub_1BEFB2708()
{
  return MEMORY[0x1F40E6340]();
}

uint64_t sub_1BEFB2718()
{
  return MEMORY[0x1F40E6368]();
}

uint64_t sub_1BEFB2728()
{
  return MEMORY[0x1F4183E90]();
}

uint64_t sub_1BEFB2748()
{
  return MEMORY[0x1F4187C08]();
}

uint64_t sub_1BEFB2758()
{
  return MEMORY[0x1F4187EB8]();
}

uint64_t sub_1BEFB2768()
{
  return MEMORY[0x1F4187EC0]();
}

uint64_t sub_1BEFB2778()
{
  return MEMORY[0x1F4187ED0]();
}

uint64_t sub_1BEFB2798()
{
  return MEMORY[0x1F4187F00]();
}

uint64_t sub_1BEFB27A8()
{
  return MEMORY[0x1F41886C0]();
}

uint64_t sub_1BEFB27B8()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_1BEFB27C8()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1BEFB27D8()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1BEFB27E8()
{
  return MEMORY[0x1F4186FE0]();
}

uint64_t sub_1BEFB27F8()
{
  return MEMORY[0x1F41870A8]();
}

uint64_t sub_1BEFB2808()
{
  return MEMORY[0x1F41870F8]();
}

uint64_t sub_1BEFB2818()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1BEFB2828()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1BEFB2838()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1BEFB2848()
{
  return MEMORY[0x1F40E6CA8]();
}

uint64_t sub_1BEFB2868()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1BEFB2878()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1BEFB2888()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1BEFB2898()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1BEFB28A8()
{
  return MEMORY[0x1F4184D88]();
}

uint64_t sub_1BEFB28B8()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1BEFB28C8()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t sub_1BEFB28D8()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t sub_1BEFB28E8()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t sub_1BEFB28F8()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t sub_1BEFB2908()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_1BEFB2918()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1BEFB2928()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1BEFB2938()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1BEFB2948()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1BEFB2958()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1BEFB2968()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1BEFB2978()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1BEFB2988()
{
  return MEMORY[0x1F41854C8]();
}

uint64_t sub_1BEFB2998()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1BEFB29B8()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1BEFB29C8()
{
  return MEMORY[0x1F4185B98]();
}

uint64_t sub_1BEFB29D8()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1BEFB29E8()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1BEFB29F8()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1BEFB2A08()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1BEFB2A18()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1BEFB2A28()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1BEFB2A38()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1BEFB2A48()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1BEFB2A58()
{
  return MEMORY[0x1F41862B8]();
}

uint64_t sub_1BEFB2A68()
{
  return MEMORY[0x1F4186318]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1F41138B8]();
}

uint64_t CFPhoneNumberCreate()
{
  return MEMORY[0x1F4114220]();
}

uint64_t CFPhoneNumberCreateString()
{
  return MEMORY[0x1F4114228]();
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1F40D8458](alloc, cStr, *(void *)&encoding, contentsDeallocator);
}

uint64_t CNObserverCancelableCompletionHandler()
{
  return MEMORY[0x1F4112C98]();
}

uint64_t CNRunWithLock()
{
  return MEMORY[0x1F4112CB8]();
}

uint64_t CNStringContainsChineseJapaneseKoreanCharacters()
{
  return MEMORY[0x1F4112CD0]();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

uint64_t PNCopyBestGuessNormalizedNumberForCountry()
{
  return MEMORY[0x1F4114240]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1F4186370]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

void bzero(void *a1, size_t a2)
{
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C8](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1F40CD558](log);
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1F4186420]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1F4186428]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1F4186458]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1F41864C0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1F4186570]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1F4186670]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1F4186688]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1F4186690]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1F41866F8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1F4186760]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1F4186778]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1F4186790]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1F41867B8]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1F4188250]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1F4188260]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1F41867F8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}