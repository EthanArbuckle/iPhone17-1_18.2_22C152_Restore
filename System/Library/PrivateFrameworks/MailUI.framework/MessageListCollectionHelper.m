@interface MessageListCollectionHelper
+ (OS_os_log)log;
+ (id)signpostLog;
- (EMObjectID)sectionObjectID;
- (MessageListCollectionHelper)initWithLog:(id)a3 updateQueueName:(id)a4 sectionObjectID:(id)a5;
- (MessageListCollectionHelper)initWithLoggableClient:(id)a3 updateQueueName:(id)a4 sectionObjectID:(id)a5;
- (NSMutableDictionary)pendingReadTimeoutCancelables;
- (OS_dispatch_queue)updateQueue;
- (OS_os_log)clientLog;
- (id)_filterExistingItemIDFromItemIDs:(void *)a3 validExistingItemID:;
- (id)changeItemIDs:(id)a3 snapshot:(id)a4;
- (int64_t)addItemIDs:(id)a3 after:(id)a4 snapshot:(id)a5 section:(id)a6 validateOtherSections:(BOOL)a7;
- (int64_t)addItemIDs:(id)a3 before:(id)a4 snapshot:(id)a5 section:(id)a6 validateOtherSections:(BOOL)a7;
- (int64_t)destructiveActionConversationID;
- (int64_t)moveItemID:(id)a3 after:(id)a4 snapshot:(id)a5 section:(id)a6;
- (int64_t)moveItemID:(id)a3 before:(id)a4 snapshot:(id)a5 section:(id)a6;
- (void)_insertItemIDs:(void *)a3 beforeFirstItemOfSnapshot:(void *)a4 section:(void *)a5 errorString:;
- (void)_removeItemsIDsFromOtherSections:(void *)a3 currentSection:(void *)a4 snapshot:;
- (void)_reportChangedItemIDs:(void *)a1;
- (void)didScheduleReadInteractionForItemID:(id)a3;
- (void)removePendingReadCancelablesForItemID:(id)a3;
- (void)setClientLog:(id)a3;
- (void)setDestructiveActionConversationID:(int64_t)a3;
- (void)setPendingReadTimeoutCancelables:(id)a3;
- (void)setUpdateQueue:(id)a3;
@end

@implementation MessageListCollectionHelper

uint64_t __88__MessageListCollectionHelper__removeItemsIDsFromOtherSections_currentSection_snapshot___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

- (int64_t)addItemIDs:(id)a3 before:(id)a4 snapshot:(id)a5 section:(id)a6 validateOtherSections:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  int64_t v16 = [v12 count];
  if (v7) {
    -[MessageListCollectionHelper _removeItemsIDsFromOtherSections:currentSection:snapshot:](self, v12, v15, v14);
  }
  if (v13)
  {
    v17 = objc_msgSend(v14, "mui_validItemIDFromExistingItemID:updateReason:", v13, @"Adding items before existing item");
    if (v17)
    {
      v18 = -[MessageListCollectionHelper _filterExistingItemIDFromItemIDs:validExistingItemID:](self, v12, v17);

      v19 = [(MessageListCollectionHelper *)self clientLog];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        int v37 = 134349314;
        uint64_t v38 = [v18 count];
        __int16 v39 = 2114;
        v40 = v17;
        _os_log_impl(&dword_1DDCDB000, v19, OS_LOG_TYPE_DEFAULT, "Inserting %{public}ld identifiers before %{public}@", (uint8_t *)&v37, 0x16u);
      }

      v20 = [(MessageListCollectionHelper *)self clientLog];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        -[MessageListCollectionHelper addItemIDs:before:snapshot:section:validateOtherSections:]((uint64_t)v18, v20, v21, v22, v23, v24, v25, v26);
      }

      [v14 insertItemsWithIdentifiers:v18 beforeItemWithIdentifier:v17];
      id v12 = v18;
    }
    else
    {
      v35 = [(MessageListCollectionHelper *)self clientLog];
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        -[MessageListCollectionHelper addItemIDs:before:snapshot:section:validateOtherSections:](v12);
      }

      int64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    v27 = [(MessageListCollectionHelper *)self clientLog];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      int v37 = 134349056;
      uint64_t v38 = [v12 count];
      _os_log_impl(&dword_1DDCDB000, v27, OS_LOG_TYPE_DEFAULT, "Appending %{public}ld identifiers", (uint8_t *)&v37, 0xCu);
    }

    v28 = [(MessageListCollectionHelper *)self clientLog];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
      -[MessageListCollectionHelper addItemIDs:before:snapshot:section:validateOtherSections:]((uint64_t)v12, v28, v29, v30, v31, v32, v33, v34);
    }

    [v14 appendItemsWithIdentifiers:v12 intoSectionWithIdentifier:v15];
  }

  return v16;
}

- (OS_os_log)clientLog
{
  return self->_clientLog;
}

- (void)_removeItemsIDsFromOtherSections:(void *)a3 currentSection:(void *)a4 snapshot:
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v26 = a2;
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  uint64_t v25 = a1;
  if (a1)
  {
    v10 = objc_msgSend(v8, "mui_validSectionIdentifiers");
    if ((unint64_t)[v10 count] >= 2 && objc_msgSend(v26, "count"))
    {
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      uint64_t v24 = v10;
      id v11 = v10;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v29 objects:v39 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v30;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v30 != v14) {
              objc_enumerationMutation(v11);
            }
            int64_t v16 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            if (([v16 isEqual:v7] & 1) == 0)
            {
              v17 = (void *)MEMORY[0x1E4F1CAD0];
              v18 = [v9 itemIdentifiersInSectionWithIdentifier:v16];
              v19 = [v17 setWithArray:v18];

              v27[0] = MEMORY[0x1E4F143A8];
              v27[1] = 3221225472;
              v27[2] = __88__MessageListCollectionHelper__removeItemsIDsFromOtherSections_currentSection_snapshot___block_invoke;
              v27[3] = &unk_1E6D11860;
              id v20 = v19;
              id v28 = v20;
              uint64_t v21 = objc_msgSend(v26, "ef_filter:", v27);
              if ([v21 count])
              {
                uint64_t v22 = [v25 clientLog];
                if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v23 = [v21 count];
                  *(_DWORD *)buf = 134218498;
                  uint64_t v34 = v23;
                  __int16 v35 = 2048;
                  v36 = v16;
                  __int16 v37 = 2114;
                  uint64_t v38 = v21;
                  _os_log_impl(&dword_1DDCDB000, v22, OS_LOG_TYPE_DEFAULT, "Remove %ld item ids from other section (%p): %{public}@", buf, 0x20u);
                }

                [v9 deleteItemsWithIdentifiers:v21];
              }
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v29 objects:v39 count:16];
        }
        while (v13);
      }

      v10 = v24;
    }
  }
}

- (MessageListCollectionHelper)initWithLog:(id)a3 updateQueueName:(id)a4 sectionObjectID:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)MessageListCollectionHelper;
  uint64_t v12 = [(MessageListCollectionHelper *)&v22 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_clientLog, a3);
    if ([v10 length])
    {
      uint64_t v14 = (const char *)[v10 UTF8String];
      id v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      int64_t v16 = dispatch_queue_attr_make_with_qos_class(v15, QOS_CLASS_USER_INTERACTIVE, 0);
      dispatch_queue_t v17 = dispatch_queue_create(v14, v16);
      updateQueue = v13->_updateQueue;
      v13->_updateQueue = (OS_dispatch_queue *)v17;
    }
    if (v11) {
      v19 = (EMObjectID *)v11;
    }
    else {
      v19 = (EMObjectID *)[objc_alloc(MEMORY[0x1E4F60400]) initAsEphemeralID:1];
    }
    sectionObjectID = v13->_sectionObjectID;
    v13->_sectionObjectID = v19;
  }
  return v13;
}

- (MessageListCollectionHelper)initWithLoggableClient:(id)a3 updateQueueName:(id)a4 sectionObjectID:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(id)objc_opt_class() log];
  id v10 = [(MessageListCollectionHelper *)self initWithLog:v9 updateQueueName:v8 sectionObjectID:v7];

  return v10;
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__MessageListCollectionHelper_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_1 != -1) {
    dispatch_once(&log_onceToken_1, block);
  }
  v2 = (void *)log_log_1;
  return (OS_os_log *)v2;
}

void __34__MessageListCollectionHelper_log__block_invoke(uint64_t a1)
{
  id v6 = [NSString mailUISubsystem];
  v2 = (const char *)[v6 UTF8String];
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v4 = os_log_create(v2, (const char *)[v3 UTF8String]);
  v5 = (void *)log_log_1;
  log_log_1 = (uint64_t)v4;
}

+ (id)signpostLog
{
  uint64_t v0 = self;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__MessageListCollectionHelper_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v0;
  if (signpostLog_onceToken != -1) {
    dispatch_once(&signpostLog_onceToken, block);
  }
  v1 = (void *)signpostLog_log;
  return v1;
}

void __42__MessageListCollectionHelper_signpostLog__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email.signposts", (const char *)[v3 UTF8String]);
  v2 = (void *)signpostLog_log;
  signpostLog_log = (uint64_t)v1;
}

- (id)_filterExistingItemIDFromItemIDs:(void *)a3 validExistingItemID:
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    if ([v5 indexOfObject:v6] == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v7 = v5;
    }
    else
    {
      id v7 = [MEMORY[0x1E4F1CA48] arrayWithArray:v5];
      [v7 removeObject:v6];
      id v8 = [a1 clientLog];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[MessageListCollectionHelper _filterExistingItemIDFromItemIDs:validExistingItemID:](v5);
      }

      memset(__b, 170, sizeof(__b));
      __b[8] = 0;
      *(void *)uint64_t v12 = 0xE00000001;
      int v13 = 1;
      pid_t v14 = getpid();
      size_t v10 = 648;
      if (!sysctl(v12, 4u, __b, &v10, 0, 0) && (__b[8] & 0x800) != 0) {
        __debugbreak();
      }
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (int64_t)addItemIDs:(id)a3 after:(id)a4 snapshot:(id)a5 section:(id)a6 validateOtherSections:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  int64_t v16 = [v12 count];
  if (v7) {
    -[MessageListCollectionHelper _removeItemsIDsFromOtherSections:currentSection:snapshot:](self, v12, v15, v14);
  }
  if (v13)
  {
    dispatch_queue_t v17 = objc_msgSend(v14, "mui_validItemIDFromExistingItemID:updateReason:", v13, @"Adding items after existing item");
    if (v17)
    {
      v18 = -[MessageListCollectionHelper _filterExistingItemIDFromItemIDs:validExistingItemID:](self, v12, v17);

      v19 = [(MessageListCollectionHelper *)self clientLog];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        int v29 = 134349314;
        uint64_t v30 = [v18 count];
        __int16 v31 = 2114;
        long long v32 = v17;
        _os_log_impl(&dword_1DDCDB000, v19, OS_LOG_TYPE_DEFAULT, "Inserting %{public}ld identifiers after %{public}@", (uint8_t *)&v29, 0x16u);
      }

      id v20 = [(MessageListCollectionHelper *)self clientLog];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        -[MessageListCollectionHelper addItemIDs:before:snapshot:section:validateOtherSections:]((uint64_t)v18, v20, v21, v22, v23, v24, v25, v26);
      }

      [v14 insertItemsWithIdentifiers:v18 afterItemWithIdentifier:v17];
      id v12 = v18;
    }
    else
    {
      v27 = [(MessageListCollectionHelper *)self clientLog];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        -[MessageListCollectionHelper addItemIDs:after:snapshot:section:validateOtherSections:](v12);
      }

      int64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    -[MessageListCollectionHelper _insertItemIDs:beforeFirstItemOfSnapshot:section:errorString:](self, v12, v14, v15, 0);
  }

  return v16;
}

- (void)_insertItemIDs:(void *)a3 beforeFirstItemOfSnapshot:(void *)a4 section:(void *)a5 errorString:
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a1)
  {
    id v13 = [v10 itemIdentifiersInSectionWithIdentifier:v11];
    id v14 = [v13 firstObject];

    id v15 = [a1 clientLog];
    int64_t v16 = v15;
    if (v14)
    {
      if (v12)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          int v17 = 134349826;
          uint64_t v18 = [v9 count];
          __int16 v19 = 2112;
          id v20 = v9;
          __int16 v21 = 2114;
          uint64_t v22 = v14;
          __int16 v23 = 2114;
          id v24 = v12;
          _os_log_error_impl(&dword_1DDCDB000, v16, OS_LOG_TYPE_ERROR, "Inserting identifiers (%{public}ld) %@ before first item %{public}@ due to: %{public}@", (uint8_t *)&v17, 0x2Au);
        }
      }
      else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 134349570;
        uint64_t v18 = [v9 count];
        __int16 v19 = 2112;
        id v20 = v9;
        __int16 v21 = 2114;
        uint64_t v22 = v14;
        _os_log_impl(&dword_1DDCDB000, v16, OS_LOG_TYPE_DEFAULT, "Inserting identifiers (%{public}ld) %@ before first item %{public}@", (uint8_t *)&v17, 0x20u);
      }

      [v10 insertItemsWithIdentifiers:v9 beforeItemWithIdentifier:v14];
    }
    else
    {
      if (v12)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          -[MessageListCollectionHelper _insertItemIDs:beforeFirstItemOfSnapshot:section:errorString:](v9);
        }
      }
      else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 134349314;
        uint64_t v18 = [v9 count];
        __int16 v19 = 2112;
        id v20 = v9;
        _os_log_impl(&dword_1DDCDB000, v16, OS_LOG_TYPE_DEFAULT, "Appending identifiers (%{public}ld) %@ to empty list", (uint8_t *)&v17, 0x16u);
      }

      [v10 appendItemsWithIdentifiers:v9 intoSectionWithIdentifier:v11];
    }
  }
}

- (int64_t)moveItemID:(id)a3 before:(id)a4 snapshot:(id)a5 section:(id)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a4;
  id v15 = objc_msgSend(v12, "mui_validItemIDFromExistingItemID:updateReason:", v11, @"Moving item before - itemID");
  int64_t v16 = objc_msgSend(v12, "mui_validItemIDFromExistingItemID:updateReason:", v14, @"Moving item before - existingItemID");

  if (!v15)
  {
    int64_t v18 = 0;
    goto LABEL_24;
  }
  if ([v15 isEqual:v16])
  {
    int v17 = [(MessageListCollectionHelper *)self clientLog];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[MessageListCollectionHelper moveItemID:before:snapshot:section:]((uint64_t)v11, v12);
    }

    memset(__b, 170, sizeof(__b));
    __b[8] = 0;
    *(void *)int v29 = 0xE00000001;
    int v30 = 1;
    pid_t v31 = getpid();
    size_t v27 = 648;
    int64_t v18 = 0;
    if (!sysctl(v29, 4u, __b, &v27, 0, 0) && (__b[8] & 0x800) != 0)
    {
      __debugbreak();
      JUMPOUT(0x1DDCFB0F8);
    }
    goto LABEL_24;
  }
  if (!v16)
  {
    id v20 = [v12 itemIdentifiersInSectionWithIdentifier:v13];
    __int16 v21 = [v20 lastObject];

    if (v21)
    {
      int v22 = [v21 isEqual:v15];
      __int16 v23 = [(MessageListCollectionHelper *)self clientLog];
      BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
      if (!v22)
      {
        if (v24)
        {
          __b[0] = 138543618;
          *(void *)&__b[1] = v15;
          LOWORD(__b[3]) = 2114;
          *(void *)((char *)&__b[3] + 2) = v21;
          _os_log_impl(&dword_1DDCDB000, v23, OS_LOG_TYPE_DEFAULT, "Moving identifier %{public}@ after last item %{public}@", (uint8_t *)__b, 0x16u);
        }

        [v12 moveItemWithIdentifier:v15 afterItemWithIdentifier:v21];
        int64_t v18 = 1;
        goto LABEL_23;
      }
      if (v24)
      {
        __b[0] = 138543362;
        *(void *)&__b[1] = v15;
        _os_log_impl(&dword_1DDCDB000, v23, OS_LOG_TYPE_DEFAULT, "Identifier %{public}@ is already last item", (uint8_t *)__b, 0xCu);
      }
    }
    else
    {
      uint64_t v25 = [MEMORY[0x1E4F28B00] currentHandler];
      [v25 handleFailureInMethod:a2 object:self file:@"MessageListCollectionHelper.m" lineNumber:201 description:@"Attempted to move an item to the end of a snapshot which has no items."];
    }
    int64_t v18 = 0;
LABEL_23:

    goto LABEL_24;
  }
  __int16 v19 = [(MessageListCollectionHelper *)self clientLog];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    __b[0] = 138543618;
    *(void *)&__b[1] = v15;
    LOWORD(__b[3]) = 2114;
    *(void *)((char *)&__b[3] + 2) = v16;
    _os_log_impl(&dword_1DDCDB000, v19, OS_LOG_TYPE_DEFAULT, "Moving identifier %{public}@ before %{public}@", (uint8_t *)__b, 0x16u);
  }

  [v12 moveItemWithIdentifier:v15 beforeItemWithIdentifier:v16];
  int64_t v18 = 1;
LABEL_24:

  return v18;
}

- (int64_t)moveItemID:(id)a3 after:(id)a4 snapshot:(id)a5 section:(id)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a4;
  id v15 = objc_msgSend(v12, "mui_validItemIDFromExistingItemID:updateReason:", v11, @"Moving item after - itemID");
  int64_t v16 = objc_msgSend(v12, "mui_validItemIDFromExistingItemID:updateReason:", v14, @"Moving item after - existingItemID");

  if (!v15)
  {
    int64_t v18 = 0;
    goto LABEL_29;
  }
  if ([v15 isEqual:v16])
  {
    int v17 = [(MessageListCollectionHelper *)self clientLog];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[MessageListCollectionHelper moveItemID:before:snapshot:section:]((uint64_t)v11, v12);
    }

    memset(__b, 170, sizeof(__b));
    LODWORD(__b[4]) = 0;
    *(void *)uint64_t v34 = 0xE00000001;
    int v35 = 1;
    pid_t v36 = getpid();
    size_t v30 = 648;
    int64_t v18 = 0;
    if (!sysctl(v34, 4u, __b, &v30, 0, 0) && (__b[4] & 0x800) != 0)
    {
      __debugbreak();
      JUMPOUT(0x1DDCFB460);
    }
    goto LABEL_29;
  }
  if (!v16)
  {
    id v20 = [v12 itemIdentifiersInSectionWithIdentifier:v13];
    __int16 v21 = [v20 firstObject];

    if (v21)
    {
      int v22 = [v21 isEqual:v15];
      __int16 v23 = [(MessageListCollectionHelper *)self clientLog];
      BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
      if (v22)
      {
        if (v24)
        {
          LODWORD(__b[0]) = 138543362;
          *(void *)((char *)__b + 4) = v15;
          _os_log_impl(&dword_1DDCDB000, v23, OS_LOG_TYPE_DEFAULT, "Identifier %{public}@ is already first item", (uint8_t *)__b, 0xCu);
        }

        goto LABEL_27;
      }
      if (v24)
      {
        LODWORD(__b[0]) = 138543618;
        *(void *)((char *)__b + 4) = v15;
        WORD2(__b[1]) = 2114;
        *(void *)((char *)&__b[1] + 6) = v21;
        _os_log_impl(&dword_1DDCDB000, v23, OS_LOG_TYPE_DEFAULT, "Moving identifier %{public}@ before first item %{public}@", (uint8_t *)__b, 0x16u);
      }

      [v12 moveItemWithIdentifier:v15 beforeItemWithIdentifier:v21];
    }
    else
    {
      if (!EMBlackPearlIsFeatureEnabled())
      {
        id v28 = [MEMORY[0x1E4F28B00] currentHandler];
        [v28 handleFailureInMethod:a2 object:self file:@"MessageListCollectionHelper.m" lineNumber:245 description:@"Attempted to move an item to the beginning of a snapshot which has no items."];

LABEL_27:
        int64_t v18 = 0;
        goto LABEL_28;
      }
      uint64_t v32 = v15;
      uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
      [v12 deleteItemsWithIdentifiers:v25];

      pid_t v31 = v15;
      uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
      [v12 appendItemsWithIdentifiers:v26 intoSectionWithIdentifier:v13];

      size_t v27 = [(MessageListCollectionHelper *)self clientLog];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        LODWORD(__b[0]) = 138543874;
        *(void *)((char *)__b + 4) = v15;
        WORD2(__b[1]) = 2114;
        *(void *)((char *)&__b[1] + 6) = v13;
        HIWORD(__b[2]) = 2114;
        __b[3] = v12;
        _os_log_impl(&dword_1DDCDB000, v27, OS_LOG_TYPE_INFO, "Moving identifier %{public}@ as first item into section:%{public}@ snapshot:%{public}@", (uint8_t *)__b, 0x20u);
      }
    }
    int64_t v18 = 1;
LABEL_28:

    goto LABEL_29;
  }
  __int16 v19 = [(MessageListCollectionHelper *)self clientLog];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(__b[0]) = 138543618;
    *(void *)((char *)__b + 4) = v15;
    WORD2(__b[1]) = 2114;
    *(void *)((char *)&__b[1] + 6) = v16;
    _os_log_impl(&dword_1DDCDB000, v19, OS_LOG_TYPE_DEFAULT, "Moving identifier %{public}@ after %{public}@", (uint8_t *)__b, 0x16u);
  }

  [v12 moveItemWithIdentifier:v15 afterItemWithIdentifier:v16];
  int64_t v18 = 1;
LABEL_29:

  return v18;
}

- (id)changeItemIDs:(id)a3 snapshot:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MessageListCollectionHelper *)self clientLog];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v6;
    _os_log_impl(&dword_1DDCDB000, v8, OS_LOG_TYPE_DEFAULT, "changedItemIDs: %@", (uint8_t *)&v11, 0xCu);
  }

  -[MessageListCollectionHelper _reportChangedItemIDs:](self, v6);
  id v9 = objc_msgSend(v7, "mui_validItemIDsFromExistingItemIDs:updateReason:", v6, @"Changing itemIDs");

  return v9;
}

- (void)_reportChangedItemIDs:(void *)a1
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  os_log_t v4 = v3;
  if (a1)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (v5)
    {
      uint64_t v7 = v5;
      uint64_t v8 = *(void *)v19;
      *(void *)&long long v6 = 67240192;
      long long v17 = v6;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(v4);
          }
          id v10 = *(const void **)(*((void *)&v18 + 1) + 8 * v9);
          int v11 = objc_msgSend(a1, "pendingReadTimeoutCancelables", v17);
          id v12 = [v11 objectForKeyedSubscript:v10];

          if (v12)
          {
            [a1 removePendingReadCancelablesForItemID:v10];
            uint64_t v13 = +[MessageListCollectionHelper signpostLog]();
            os_signpost_id_t v14 = os_signpost_id_make_with_pointer(v13, v10);

            id v15 = +[MessageListCollectionHelper signpostLog]();
            int64_t v16 = v15;
            if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
            {
              *(_DWORD *)buf = v17;
              int v23 = 0;
              _os_signpost_emit_with_name_impl(&dword_1DDCDB000, v16, OS_SIGNPOST_INTERVAL_END, v14, "EMMessageListItemReadUnread", "TimedOut=%{public,signpost.telemetry:number1}u enableTelemetry=YES ", buf, 8u);
            }
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v4 countByEnumeratingWithState:&v18 objects:v24 count:16];
      }
      while (v7);
    }
  }
}

- (void)didScheduleReadInteractionForItemID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[MessageListCollectionHelper signpostLog]();
  os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, v4);

  uint64_t v7 = +[MessageListCollectionHelper signpostLog]();
  uint64_t v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DDCDB000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "EMMessageListItemReadUnread", "", buf, 2u);
  }

  uint64_t v9 = [MEMORY[0x1E4F60F28] globalAsyncScheduler];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __67__MessageListCollectionHelper_didScheduleReadInteractionForItemID___block_invoke;
  v17[3] = &unk_1E6D11888;
  os_signpost_id_t v19 = v6;
  v17[4] = self;
  id v10 = v4;
  id v18 = v10;
  int v11 = [v9 afterDelay:v17 performBlock:2.0];

  id v12 = [(MessageListCollectionHelper *)self pendingReadTimeoutCancelables];
  uint64_t v13 = [v12 objectForKeyedSubscript:v10];

  if (!v13)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CAD0] set];
  }
  os_signpost_id_t v14 = [v13 setByAddingObject:v11];

  p_pendingReadCancelableLock = &self->pendingReadCancelableLock;
  os_unfair_lock_lock(&self->pendingReadCancelableLock);
  int64_t v16 = [(MessageListCollectionHelper *)self pendingReadTimeoutCancelables];
  [v16 setObject:v14 forKeyedSubscript:v10];

  os_unfair_lock_unlock(p_pendingReadCancelableLock);
}

uint64_t __67__MessageListCollectionHelper_didScheduleReadInteractionForItemID___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = +[MessageListCollectionHelper signpostLog]();
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 48);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    v6[0] = 67240192;
    v6[1] = 1;
    _os_signpost_emit_with_name_impl(&dword_1DDCDB000, v3, OS_SIGNPOST_INTERVAL_END, v4, "EMMessageListItemReadUnread", "TimedOut=%{public,signpost.telemetry:number1}u enableTelemetry=YES ", (uint8_t *)v6, 8u);
  }

  return [*(id *)(a1 + 32) removePendingReadCancelablesForItemID:*(void *)(a1 + 40)];
}

- (void)removePendingReadCancelablesForItemID:(id)a3
{
  id v8 = a3;
  p_pendingReadCancelableLock = &self->pendingReadCancelableLock;
  os_unfair_lock_lock(&self->pendingReadCancelableLock);
  uint64_t v5 = [(MessageListCollectionHelper *)self pendingReadTimeoutCancelables];
  os_signpost_id_t v6 = [v5 objectForKeyedSubscript:v8];

  [v6 makeObjectsPerformSelector:sel_cancel];
  uint64_t v7 = [(MessageListCollectionHelper *)self pendingReadTimeoutCancelables];
  [v7 removeObjectForKey:v8];

  os_unfair_lock_unlock(p_pendingReadCancelableLock);
}

- (EMObjectID)sectionObjectID
{
  return self->_sectionObjectID;
}

- (OS_dispatch_queue)updateQueue
{
  return self->_updateQueue;
}

- (void)setUpdateQueue:(id)a3
{
}

- (int64_t)destructiveActionConversationID
{
  return self->_destructiveActionConversationID;
}

- (void)setDestructiveActionConversationID:(int64_t)a3
{
  self->_destructiveActionConversationID = a3;
}

- (void)setClientLog:(id)a3
{
}

- (NSMutableDictionary)pendingReadTimeoutCancelables
{
  return self->_pendingReadTimeoutCancelables;
}

- (void)setPendingReadTimeoutCancelables:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingReadTimeoutCancelables, 0);
  objc_storeStrong((id *)&self->_clientLog, 0);
  objc_storeStrong((id *)&self->_updateQueue, 0);
  objc_storeStrong((id *)&self->_sectionObjectID, 0);
}

- (void)addItemIDs:(uint64_t)a3 before:(uint64_t)a4 snapshot:(uint64_t)a5 section:(uint64_t)a6 validateOtherSections:(uint64_t)a7 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)addItemIDs:(void *)a1 before:snapshot:section:validateOtherSections:.cold.2(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1DDCDB000, v1, v2, "Failed to insert %{public}ld identifiers before %{public}@. Could not find validExistingItemId", v3, v4, v5, v6, v7);
}

- (void)addItemIDs:(uint64_t)a3 before:(uint64_t)a4 snapshot:(uint64_t)a5 section:(uint64_t)a6 validateOtherSections:(uint64_t)a7 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_filterExistingItemIDFromItemIDs:(void *)a1 validExistingItemID:.cold.1(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5(&dword_1DDCDB000, v1, v2, "Inserting existing identifiers (%{public}ld) %@ before or after %{public}@", v3, v4, v5, v6, v7);
}

- (void)addItemIDs:(void *)a1 after:snapshot:section:validateOtherSections:.cold.1(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1DDCDB000, v1, v2, "Failed to insert %{public}ld identifiers after %{public}@. Could not find validExistingItemId", v3, v4, v5, v6, v7);
}

- (void)_insertItemIDs:(void *)a1 beforeFirstItemOfSnapshot:section:errorString:.cold.1(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5(&dword_1DDCDB000, v1, v2, "Appending identifiers (%{public}ld) %@ to empty list due to: %{public}@", v3, v4, v5, v6, v7);
}

- (void)moveItemID:(uint64_t)a1 before:(void *)a2 snapshot:section:.cold.1(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 itemIdentifiers];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1DDCDB000, v3, v4, "Moving existing identifiers %{public}@ before or after snapshot %{public}@", v5, v6, v7, v8, v9);
}

@end