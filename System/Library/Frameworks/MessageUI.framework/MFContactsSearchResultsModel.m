@interface MFContactsSearchResultsModel
- (BOOL)_didFinishSearchForType:(unint64_t)a3;
- (BOOL)_isResetting;
- (BOOL)_shouldProcessResultsAfterFinishingType:(unint64_t)a3;
- (MFContactsSearchResultsModel)init;
- (MFContactsSearchResultsModel)initWithFavorMobileNumbers:(BOOL)a3;
- (MFContactsSearchResultsModel)initWithResultTypeSortOrderComparator:(void *)a3 resultTypePriorityComparator:(void *)a4 favorMobileNumbers:(BOOL)a5;
- (NSArray)enteredRecipients;
- (id)_bestRecipientForAddress:(id)a3 fallback:(id)a4;
- (id)_dictionaryForResultType:(unint64_t)a3;
- (void)_addBestRecipientsForRecipients:(id)a3 excluding:(id)a4 toArray:(id)a5;
- (void)_addResults:(id)a3 ofType:(unint64_t)a4;
- (void)_appendSortedResultsOfType:(unint64_t)a3 excluding:(id)a4 toResults:(id)a5;
- (void)_enumerateSearchResultTypesInSortOrderUsingBlock:(id)a3;
- (void)_finishSearchOfType:(unint64_t)a3;
- (void)addResults:(id)a3 ofType:(unint64_t)a4;
- (void)dealloc;
- (void)processAddedResultsOfType:(unint64_t)a3 completion:(id)a4;
- (void)reset;
- (void)setEnteredRecipients:(id)a3;
@end

@implementation MFContactsSearchResultsModel

- (MFContactsSearchResultsModel)init
{
  return [(MFContactsSearchResultsModel *)self initWithFavorMobileNumbers:0];
}

- (MFContactsSearchResultsModel)initWithFavorMobileNumbers:(BOOL)a3
{
  return [(MFContactsSearchResultsModel *)self initWithResultTypeSortOrderComparator:0 resultTypePriorityComparator:0 favorMobileNumbers:a3];
}

- (MFContactsSearchResultsModel)initWithResultTypeSortOrderComparator:(void *)a3 resultTypePriorityComparator:(void *)a4 favorMobileNumbers:(BOOL)a5
{
  v25.receiver = self;
  v25.super_class = (Class)MFContactsSearchResultsModel;
  v8 = [(MFContactsSearchResultsModel *)&v25 init];
  if (v8)
  {
    v9 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    queue = v8->_queue;
    v8->_queue = v9;

    [(NSOperationQueue *)v8->_queue setMaxConcurrentOperationCount:1];
    v8->_favorMobileNumbers = a5;
    v8->_resultTypesSortOrder = _CopySortedArrayWithValues((CFComparisonResult (__cdecl *)(const void *, const void *, void *))a3, (const void *)1, v11, v12, v13, v14, v15, v16, 2);
    v8->_resultTypesPriorityOrder = _CopySortedArrayWithValues((CFComparisonResult (__cdecl *)(const void *, const void *, void *))a4, (const void *)2, v17, v18, v19, v20, v21, v22, 1);
    CFIndex Count = CFArrayGetCount(v8->_resultTypesSortOrder);
    v8->_finishedResultTypes = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], Count, 0);
    v8->_preferredType = (unint64_t)CFArrayGetValueAtIndex(v8->_resultTypesPriorityOrder, 0);
  }
  return v8;
}

- (void)dealloc
{
  [(NSOperationQueue *)self->_queue cancelAllOperations];
  [(NSOperationQueue *)self->_queue waitUntilAllOperationsAreFinished];
  resultTypesSortOrder = self->_resultTypesSortOrder;
  if (resultTypesSortOrder) {
    CFRelease(resultTypesSortOrder);
  }
  resultTypesPriorityOrder = self->_resultTypesPriorityOrder;
  if (resultTypesPriorityOrder) {
    CFRelease(resultTypesPriorityOrder);
  }
  finishedResultTypes = self->_finishedResultTypes;
  if (finishedResultTypes) {
    CFRelease(finishedResultTypes);
  }
  v6.receiver = self;
  v6.super_class = (Class)MFContactsSearchResultsModel;
  [(MFContactsSearchResultsModel *)&v6 dealloc];
}

- (void)reset
{
  atomic_fetch_add(&self->_resetCount, 1u);
  queue = self->_queue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __37__MFContactsSearchResultsModel_reset__block_invoke;
  v3[3] = &unk_1E5F79088;
  v3[4] = self;
  [(NSOperationQueue *)queue addOperationWithBlock:v3];
}

void __37__MFContactsSearchResultsModel_reset__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = 0;

  uint64_t v6 = *(void *)(a1 + 32);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;

  uint64_t v8 = *(void *)(a1 + 32);
  v9 = *(void **)(v8 + 48);
  *(void *)(v8 + 48) = 0;

  CFSetRemoveAllValues(*(CFMutableSetRef *)(*(void *)(a1 + 32) + 72));
  atomic_fetch_add((atomic_uint *volatile)(*(void *)(a1 + 32) + 92), 0xFFFFFFFF);
}

- (BOOL)_isResetting
{
  return self->_resetCount > 0;
}

- (void)_addResults:(id)a3 ofType:(unint64_t)a4
{
  id v18 = a3;
  switch(a4)
  {
    case 1uLL:
      uint64_t v6 = _filterOutExistingRecipientsFromResults(v18, self->_enteredRecipients);

      objc_storeStrong((id *)&self->_recentSearchResults, v6);
      recentRecipientsByAddress = self->_recentRecipientsByAddress;
      if (!recentRecipientsByAddress)
      {
        uint64_t v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        v9 = self->_recentRecipientsByAddress;
        self->_recentRecipientsByAddress = v8;

        recentRecipientsByAddress = self->_recentRecipientsByAddress;
      }
      goto LABEL_4;
    case 2uLL:
      localSearchResultsByAddress = self->_localSearchResultsByAddress;
      if (localSearchResultsByAddress)
      {
        uint64_t v11 = 0;
      }
      else
      {
        uint64_t v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        uint64_t v17 = self->_localSearchResultsByAddress;
        self->_localSearchResultsByAddress = v16;

        uint64_t v11 = 0;
        localSearchResultsByAddress = self->_localSearchResultsByAddress;
      }
      goto LABEL_14;
    case 4uLL:
      uint64_t v6 = _filterOutExistingRecipientsFromResults(v18, self->_enteredRecipients);

      objc_storeStrong((id *)&self->_infrequentRecentSearchResults, v6);
      recentRecipientsByAddress = self->_recentRecipientsByAddress;
      if (!recentRecipientsByAddress)
      {
        uint64_t v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        uint64_t v13 = self->_recentRecipientsByAddress;
        self->_recentRecipientsByAddress = v12;

        recentRecipientsByAddress = self->_recentRecipientsByAddress;
      }
LABEL_4:
      id v18 = v6;
      addEntriesForRecipientsIfNotInDictionary(v6, 0, recentRecipientsByAddress);
      break;
    case 8uLL:
      localSearchResultsByAddress = self->_serverSearchResultsByAddress;
      if (!localSearchResultsByAddress)
      {
        uint64_t v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        serverSearchResultsByAddress = self->_serverSearchResultsByAddress;
        self->_serverSearchResultsByAddress = v14;

        localSearchResultsByAddress = self->_serverSearchResultsByAddress;
      }
      uint64_t v11 = self->_localSearchResultsByAddress;
LABEL_14:
      addEntriesForRecipientsIfNotInDictionary(v18, v11, localSearchResultsByAddress);
      break;
    default:
      break;
  }
}

- (void)addResults:(id)a3 ofType:(unint64_t)a4
{
  id v5 = +[_MFSearchAddResultsOperation operationWithResults:a3 ofType:a4 consumer:self];
  -[NSOperationQueue addOperation:](self->_queue, "addOperation:");
}

- (void)_finishSearchOfType:(unint64_t)a3
{
}

- (BOOL)_shouldProcessResultsAfterFinishingType:(unint64_t)a3
{
  CFSetAddValue(self->_finishedResultTypes, (const void *)a3);
  if (!CFSetContainsValue(self->_finishedResultTypes, (const void *)self->_preferredType)) {
    return 0;
  }
  CFIndex Count = CFArrayGetCount(self->_resultTypesSortOrder);
  ValueAtIndex = CFArrayGetValueAtIndex(self->_resultTypesSortOrder, 0);
  if (ValueAtIndex == (const void *)a3 || Count < 1) {
    return 1;
  }
  v9 = ValueAtIndex;
  CFIndex v10 = 1;
  do
  {
    int v11 = CFSetContainsValue(self->_finishedResultTypes, v9);
    BOOL v8 = v11 != 0;
    if (!v11) {
      break;
    }
    v9 = CFArrayGetValueAtIndex(self->_resultTypesSortOrder, v10);
  }
  while (v9 != (const void *)a3 && v10++ < Count);
  return v8;
}

- (BOOL)_didFinishSearchForType:(unint64_t)a3
{
  return CFSetContainsValue(self->_finishedResultTypes, (const void *)a3) != 0;
}

- (void)_enumerateSearchResultTypesInSortOrderUsingBlock:(id)a3
{
  v7 = (void (**)(id, const void *))a3;
  CFIndex Count = CFArrayGetCount(self->_resultTypesSortOrder);
  if (Count >= 1)
  {
    for (CFIndex i = 0; i != Count; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(self->_resultTypesSortOrder, i);
      v7[2](v7, ValueAtIndex);
    }
  }
}

- (id)_bestRecipientForAddress:(id)a3 fallback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CFIndex Count = CFArrayGetCount(self->_resultTypesPriorityOrder);
  v9 = v7;
  if (Count >= 1)
  {
    CFIndex v10 = 0;
    while (1)
    {
      int v11 = [(MFContactsSearchResultsModel *)self _dictionaryForResultType:CFArrayGetValueAtIndex(self->_resultTypesPriorityOrder, v10)];
      uint64_t v12 = v11;
      if (v11)
      {
        v9 = [v11 objectForKey:v6];
        if (v9) {
          break;
        }
      }

      if (Count == ++v10)
      {
        v9 = v7;
        goto LABEL_8;
      }
    }
  }
LABEL_8:

  return v9;
}

- (void)_addBestRecipientsForRecipients:(id)a3 excluding:(id)a4 toArray:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v15, "isGroup", (void)v18)) {
          [v15 address];
        }
        else {
        uint64_t v16 = [v15 normalizedAddress];
        }
        if (([v9 containsObject:v16] & 1) == 0)
        {
          uint64_t v17 = [(MFContactsSearchResultsModel *)self _bestRecipientForAddress:v16 fallback:v15];
          [v10 addObject:v17];
          [v9 addObject:v16];
        }
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }
}

- (void)_appendSortedResultsOfType:(unint64_t)a3 excluding:(id)a4 toResults:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (a3 == 4)
  {
    infrequentRecentSearchResults = self->_infrequentRecentSearchResults;
LABEL_5:
    id v11 = infrequentRecentSearchResults;
    if (!v11) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if (a3 == 1)
  {
    infrequentRecentSearchResults = self->_recentSearchResults;
    goto LABEL_5;
  }
  uint64_t v12 = [(MFContactsSearchResultsModel *)self _dictionaryForResultType:a3];
  uint64_t v13 = [v12 allValues];

  ABPersonSortOrdering SortOrdering = ABPersonGetSortOrdering();
  BOOL favorMobileNumbers = self->_favorMobileNumbers;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __79__MFContactsSearchResultsModel__appendSortedResultsOfType_excluding_toResults___block_invoke;
  v16[3] = &__block_descriptor_40_e11_q24__0_8_16l;
  ABPersonSortOrdering v17 = SortOrdering;
  BOOL v18 = favorMobileNumbers;
  id v11 = [v13 sortedArrayWithOptions:1 usingComparator:v16];

  if (v11) {
LABEL_8:
  }
    [(MFContactsSearchResultsModel *)self _addBestRecipientsForRecipients:v11 excluding:v8 toArray:v9];
LABEL_9:
}

uint64_t __79__MFContactsSearchResultsModel__appendSortedResultsOfType_excluding_toResults___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  id v8 = v6;
  int v9 = [v7 property];
  int v10 = [v8 property];
  int v11 = v10;
  if (v9 != v10)
  {
    if (*MEMORY[0x1E4F49CC8] == v9)
    {
      uint64_t v12 = -1;
      goto LABEL_45;
    }
    if (*MEMORY[0x1E4F49CC8] == v10)
    {
      uint64_t v12 = 1;
      goto LABEL_45;
    }
  }
  uint64_t v13 = (const void *)[v7 record];
  uint64_t v14 = (const void *)[v8 record];
  if (!v13 || !v14) {
    __assert_rtn("compareComposeRecipients", "MFContactsSearchResultsModel.m", 335, "false");
  }
  CFComparisonResult v15 = ABPersonComparePeopleByName(v13, v14, *(_DWORD *)(a1 + 32));
  if (*(_DWORD *)(a1 + 36)) {
    BOOL v16 = v15 == kCFCompareEqualTo;
  }
  else {
    BOOL v16 = 0;
  }
  char v17 = !v16;
  if (v16) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = v15;
  }
  if (v9 == v11 && (v17 & 1) == 0)
  {
    if (v9 != *MEMORY[0x1E4F49CC8])
    {
      uint64_t v12 = 0;
      goto LABEL_45;
    }
    BOOL v18 = [v7 unlocalizedLabel];
    uint64_t v19 = [v8 unlocalizedLabel];
    long long v20 = (__CFString *)v19;
    if (v18)
    {
      if (([(__CFString *)v18 isEqualToString:v19] & 1) == 0)
      {
        CFStringRef v21 = (const __CFString *)*MEMORY[0x1E4F49CA0];
        if (CFEqual((CFStringRef)*MEMORY[0x1E4F49CA0], v18))
        {
          uint64_t v12 = -1;
          goto LABEL_44;
        }
        if (!v20)
        {
          char v22 = 1;
          goto LABEL_31;
        }
        goto LABEL_28;
      }
    }
    else if (v19)
    {
      CFStringRef v21 = (const __CFString *)*MEMORY[0x1E4F49CA0];
LABEL_28:
      if (CFStringCompare(v21, v20, 0))
      {
        if (!v18)
        {
          CFStringRef v23 = (const __CFString *)*MEMORY[0x1E4F49CB0];
LABEL_43:
          uint64_t v12 = CFEqual(v23, v20);
          goto LABEL_44;
        }
        char v22 = 0;
LABEL_31:
        CFStringRef v23 = (const __CFString *)*MEMORY[0x1E4F49CB0];
        CFComparisonResult v24 = CFStringCompare((CFStringRef)*MEMORY[0x1E4F49CB0], v18, 0);
        if (v24) {
          char v25 = v22;
        }
        else {
          char v25 = 1;
        }
        if (v24) {
          uint64_t v12 = 0;
        }
        else {
          uint64_t v12 = -1;
        }
        if (v25) {
          goto LABEL_44;
        }
        goto LABEL_43;
      }
      uint64_t v12 = 1;
LABEL_44:

      goto LABEL_45;
    }
    uint64_t v12 = 0;
    goto LABEL_44;
  }
LABEL_45:

  return v12;
}

- (void)processAddedResultsOfType:(unint64_t)a3 completion:(id)a4
{
  id v5 = +[_MFSearchProcessResultsOperation operationWithResultsOfType:a3 completion:a4 consumer:self];
  -[NSOperationQueue addOperation:](self->_queue, "addOperation:");
}

- (id)_dictionaryForResultType:(unint64_t)a3
{
  unint64_t v4 = a3 - 1;
  if (a3 - 1 <= 7 && ((0x8Bu >> v4) & 1) != 0)
  {
    id v5 = *(id *)((char *)&self->super.isa + qword_1AFA90740[v4]);
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (NSArray)enteredRecipients
{
  return self->_enteredRecipients;
}

- (void)setEnteredRecipients:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enteredRecipients, 0);
  objc_storeStrong((id *)&self->_recentRecipientsByAddress, 0);
  objc_storeStrong((id *)&self->_serverSearchResultsByAddress, 0);
  objc_storeStrong((id *)&self->_localSearchResultsByAddress, 0);
  objc_storeStrong((id *)&self->_infrequentRecentSearchResults, 0);
  objc_storeStrong((id *)&self->_recentSearchResults, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end