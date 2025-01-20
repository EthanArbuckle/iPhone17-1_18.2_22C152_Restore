@interface CNChangeHistoryTriageLogger
+ (CNChangeHistoryTriageLogger)fetchLogger;
+ (CNChangeHistoryTriageLogger)saveLogger;
+ (OS_os_log)log;
- (CNChangeHistoryTriageLogger)init;
- (CNChangeHistoryTriageLogger)initWithOSLog:(id)a3 defaultLogType:(unsigned __int8)a4 destructiveLogType:(unsigned __int8)a5;
- (OS_os_log)os_log;
- (unsigned)defaultLogType;
- (unsigned)destructiveLogType;
- (void)didExecuteSaveRequest;
- (void)didFetchHistoryEvents:(id)a3 anchor:(id)a4;
- (void)didFetchHistoryEventsCount:(int64_t)a3 anchor:(id)a4 truncated:(BOOL)a5;
- (void)fetchDidFailToTranslateWithError:(id)a3;
- (void)fetchDidFailWithError:(id)a3;
- (void)visitAddContactEvent:(id)a3;
- (void)visitAddGroupEvent:(id)a3;
- (void)visitAddMemberToGroupEvent:(id)a3;
- (void)visitAddSubgroupToGroupEvent:(id)a3;
- (void)visitDeleteContactEvent:(id)a3;
- (void)visitDeleteGroupEvent:(id)a3;
- (void)visitDifferentMeCardEvent:(id)a3;
- (void)visitDropEverythingEvent:(id)a3;
- (void)visitLinkContactsEvent:(id)a3;
- (void)visitPreferredContactForImageEvent:(id)a3;
- (void)visitPreferredContactForNameEvent:(id)a3;
- (void)visitRemoveMemberFromGroupEvent:(id)a3;
- (void)visitRemoveSubgroupFromGroupEvent:(id)a3;
- (void)visitUnlinkContactEvent:(id)a3;
- (void)visitUpdateContactEvent:(id)a3;
- (void)visitUpdateGroupEvent:(id)a3;
- (void)willExecuteSaveRequest;
- (void)willFetchHistoryWithRequest:(id)a3;
@end

@implementation CNChangeHistoryTriageLogger

+ (CNChangeHistoryTriageLogger)saveLogger
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__CNChangeHistoryTriageLogger_saveLogger__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (saveLogger_cn_once_token_0 != -1) {
    dispatch_once(&saveLogger_cn_once_token_0, block);
  }
  v2 = (void *)saveLogger_cn_once_object_0;

  return (CNChangeHistoryTriageLogger *)v2;
}

void __41__CNChangeHistoryTriageLogger_saveLogger__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) log];
  uint64_t v3 = [objc_alloc(*(Class *)(a1 + 32)) initWithOSLog:v2 defaultLogType:1 destructiveLogType:0];

  v4 = (void *)saveLogger_cn_once_object_0;
  saveLogger_cn_once_object_0 = v3;
}

+ (CNChangeHistoryTriageLogger)fetchLogger
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__CNChangeHistoryTriageLogger_fetchLogger__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (fetchLogger_cn_once_token_1 != -1) {
    dispatch_once(&fetchLogger_cn_once_token_1, block);
  }
  v2 = (void *)fetchLogger_cn_once_object_1;

  return (CNChangeHistoryTriageLogger *)v2;
}

void __42__CNChangeHistoryTriageLogger_fetchLogger__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) log];
  uint64_t v3 = [objc_alloc(*(Class *)(a1 + 32)) initWithOSLog:v2 defaultLogType:1 destructiveLogType:1];

  v4 = (void *)fetchLogger_cn_once_object_1;
  fetchLogger_cn_once_object_1 = v3;
}

+ (OS_os_log)log
{
  if (log_cn_once_token_2 != -1) {
    dispatch_once(&log_cn_once_token_2, &__block_literal_global_51);
  }
  v2 = (void *)log_cn_once_object_2;

  return (OS_os_log *)v2;
}

uint64_t __34__CNChangeHistoryTriageLogger_log__block_invoke()
{
  log_cn_once_object_2 = (uint64_t)os_log_create("com.apple.contacts", "change-history-triage");

  return MEMORY[0x1F41817F8]();
}

- (CNChangeHistoryTriageLogger)init
{
  os_log_t v3 = os_log_create("com.apple.contacts", "change-history-triage");
  v4 = [(CNChangeHistoryTriageLogger *)self initWithOSLog:v3 defaultLogType:1 destructiveLogType:0];

  return v4;
}

- (CNChangeHistoryTriageLogger)initWithOSLog:(id)a3 defaultLogType:(unsigned __int8)a4 destructiveLogType:(unsigned __int8)a5
{
  id v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CNChangeHistoryTriageLogger;
  v10 = [(CNChangeHistoryTriageLogger *)&v14 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_os_log, a3);
    v11->_defaultLogType = a4;
    v11->_destructiveLogType = a5;
    v12 = v11;
  }

  return v11;
}

- (void)willExecuteSaveRequest
{
  os_log = self->_os_log;
  os_log_type_t defaultLogType = self->_defaultLogType;
  if (os_log_type_enabled(os_log, defaultLogType))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1909E3000, os_log, defaultLogType, "Will execute save request", v4, 2u);
  }
}

- (void)didExecuteSaveRequest
{
  os_log = self->_os_log;
  os_log_type_t defaultLogType = self->_defaultLogType;
  if (os_log_type_enabled(os_log, defaultLogType))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1909E3000, os_log, defaultLogType, "Did execute save request", v4, 2u);
  }
}

- (void)willFetchHistoryWithRequest:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 startingToken];

  if (!v5)
  {
    os_log = self->_os_log;
    if (!os_log_type_enabled(os_log, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    v15 = "Will fetch complete history (nil starting token)";
LABEL_10:
    _os_log_impl(&dword_1909E3000, os_log, OS_LOG_TYPE_DEFAULT, v15, buf, 2u);
    goto LABEL_14;
  }
  v6 = [v4 startingToken];
  uint64_t v7 = [v6 length];

  if (!v7)
  {
    os_log = self->_os_log;
    if (!os_log_type_enabled(os_log, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    v15 = "Will fetch complete history (empty starting token)";
    goto LABEL_10;
  }
  v8 = [CNChangeHistoryAnchor alloc];
  id v9 = [v4 startingToken];
  id v16 = 0;
  v10 = [(CNChangeHistoryAnchor *)v8 initWithHistoryToken:v9 error:&v16];
  id v11 = v16;

  v12 = self->_os_log;
  if (v10)
  {
    os_log_type_t defaultLogType = self->_defaultLogType;
    if (os_log_type_enabled(v12, defaultLogType))
    {
      *(_DWORD *)buf = 138543362;
      v18 = v10;
      _os_log_impl(&dword_1909E3000, v12, defaultLogType, "Will fetch history from anchor: %{public}@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)self->_os_log, OS_LOG_TYPE_ERROR))
  {
    [(CNChangeHistoryTriageLogger *)(uint64_t)v11 willFetchHistoryWithRequest:v4];
  }

LABEL_14:
}

- (void)didFetchHistoryEvents:(id)a3 anchor:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  os_log = self->_os_log;
  os_log_type_t defaultLogType = self->_defaultLogType;
  if (os_log_type_enabled(os_log, defaultLogType))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1909E3000, os_log, defaultLogType, "Did fetch history events:", buf, 2u);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "acceptEventVisitor:", self, (void)v17);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v12);
  }

  v15 = self->_os_log;
  os_log_type_t v16 = self->_defaultLogType;
  if (os_log_type_enabled(v15, v16))
  {
    *(_DWORD *)buf = 138543362;
    id v22 = v7;
    _os_log_impl(&dword_1909E3000, v15, v16, "Latest change anchor: %{public}@", buf, 0xCu);
  }
}

- (void)didFetchHistoryEventsCount:(int64_t)a3 anchor:(id)a4 truncated:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  os_log = self->_os_log;
  os_log_type_t defaultLogType = self->_defaultLogType;
  if (os_log_type_enabled(os_log, defaultLogType))
  {
    uint64_t v11 = NSNumber;
    uint64_t v12 = os_log;
    uint64_t v13 = [v11 numberWithBool:v5];
    int v14 = 134349570;
    int64_t v15 = a3;
    __int16 v16 = 2114;
    id v17 = v8;
    __int16 v18 = 2114;
    long long v19 = v13;
    _os_log_impl(&dword_1909E3000, v12, defaultLogType, "Did fetch history events count: %{public}lu, latest change anchor: %{public}@, truncated: %{public}@", (uint8_t *)&v14, 0x20u);
  }
}

- (void)fetchDidFailWithError:(id)a3
{
  id v4 = a3;
  os_log = self->_os_log;
  if (os_log_type_enabled(os_log, OS_LOG_TYPE_ERROR)) {
    -[CNChangeHistoryTriageLogger fetchDidFailWithError:]((uint64_t)v4, os_log);
  }
}

- (void)fetchDidFailToTranslateWithError:(id)a3
{
  id v4 = a3;
  os_log = self->_os_log;
  if (os_log_type_enabled(os_log, OS_LOG_TYPE_ERROR)) {
    -[CNChangeHistoryTriageLogger fetchDidFailToTranslateWithError:]((uint64_t)v4, os_log);
  }
}

- (void)visitDropEverythingEvent:(id)a3
{
  os_log = self->_os_log;
  os_log_type_t destructiveLogType = self->_destructiveLogType;
  if (os_log_type_enabled(os_log, destructiveLogType))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_log_impl(&dword_1909E3000, os_log, destructiveLogType, " - Drop everything", v5, 2u);
  }
}

- (void)visitAddContactEvent:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [v4 containerIdentifier];

  os_log = self->_os_log;
  os_log_type_t defaultLogType = self->_defaultLogType;
  BOOL v8 = os_log_type_enabled(os_log, defaultLogType);
  if (v5)
  {
    if (v8)
    {
      id v9 = os_log;
      id v10 = [v4 contact];
      uint64_t v11 = [v10 identifier];
      uint64_t v12 = [v4 containerIdentifier];
      int v13 = 138543618;
      int v14 = v11;
      __int16 v15 = 2114;
      __int16 v16 = v12;
      _os_log_impl(&dword_1909E3000, v9, defaultLogType, " - Add %{public}@ (container: %{public}@", (uint8_t *)&v13, 0x16u);

LABEL_6:
    }
  }
  else if (v8)
  {
    id v9 = os_log;
    id v10 = [v4 contact];
    uint64_t v11 = [v10 identifier];
    int v13 = 138543362;
    int v14 = v11;
    _os_log_impl(&dword_1909E3000, v9, defaultLogType, " - Add %{public}@", (uint8_t *)&v13, 0xCu);
    goto LABEL_6;
  }
}

- (void)visitUpdateContactEvent:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  os_log = self->_os_log;
  os_log_type_t defaultLogType = self->_defaultLogType;
  if (os_log_type_enabled(os_log, defaultLogType))
  {
    id v6 = os_log;
    id v7 = [a3 contact];
    BOOL v8 = [v7 identifier];
    int v9 = 138543362;
    id v10 = v8;
    _os_log_impl(&dword_1909E3000, v6, defaultLogType, " - Update %{public}@", (uint8_t *)&v9, 0xCu);
  }
}

- (void)visitDeleteContactEvent:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  os_log = self->_os_log;
  os_log_type_t destructiveLogType = self->_destructiveLogType;
  if (os_log_type_enabled(os_log, destructiveLogType))
  {
    id v6 = os_log;
    id v7 = [a3 contactIdentifier];
    int v8 = 138543362;
    int v9 = v7;
    _os_log_impl(&dword_1909E3000, v6, destructiveLogType, " - Delete %{public}@", (uint8_t *)&v8, 0xCu);
  }
}

- (void)visitAddGroupEvent:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [v4 containerIdentifier];

  os_log = self->_os_log;
  os_log_type_t defaultLogType = self->_defaultLogType;
  BOOL v8 = os_log_type_enabled(os_log, defaultLogType);
  if (v5)
  {
    if (v8)
    {
      int v9 = os_log;
      uint64_t v10 = [v4 group];
      uint64_t v11 = [v10 identifier];
      uint64_t v12 = [v4 containerIdentifier];
      int v13 = 138543618;
      int v14 = v11;
      __int16 v15 = 2114;
      __int16 v16 = v12;
      _os_log_impl(&dword_1909E3000, v9, defaultLogType, " - Add %{public}@ (container: %{public}@", (uint8_t *)&v13, 0x16u);

LABEL_6:
    }
  }
  else if (v8)
  {
    int v9 = os_log;
    uint64_t v10 = [v4 group];
    uint64_t v11 = [v10 identifier];
    int v13 = 138543362;
    int v14 = v11;
    _os_log_impl(&dword_1909E3000, v9, defaultLogType, " - Add %{public}@", (uint8_t *)&v13, 0xCu);
    goto LABEL_6;
  }
}

- (void)visitUpdateGroupEvent:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  os_log = self->_os_log;
  os_log_type_t defaultLogType = self->_defaultLogType;
  if (os_log_type_enabled(os_log, defaultLogType))
  {
    id v6 = os_log;
    id v7 = [a3 group];
    BOOL v8 = [v7 identifier];
    int v9 = 138543362;
    uint64_t v10 = v8;
    _os_log_impl(&dword_1909E3000, v6, defaultLogType, " - Update %{public}@", (uint8_t *)&v9, 0xCu);
  }
}

- (void)visitDeleteGroupEvent:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  os_log = self->_os_log;
  os_log_type_t destructiveLogType = self->_destructiveLogType;
  if (os_log_type_enabled(os_log, destructiveLogType))
  {
    id v6 = os_log;
    id v7 = [a3 groupIdentifier];
    int v8 = 138543362;
    int v9 = v7;
    _os_log_impl(&dword_1909E3000, v6, destructiveLogType, " - Delete %{public}@", (uint8_t *)&v8, 0xCu);
  }
}

- (void)visitAddMemberToGroupEvent:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  os_log = self->_os_log;
  os_log_type_t defaultLogType = self->_defaultLogType;
  if (os_log_type_enabled(os_log, defaultLogType))
  {
    id v6 = os_log;
    id v7 = a3;
    int v8 = [v7 member];
    int v9 = [v8 identifier];
    uint64_t v10 = [v7 group];

    uint64_t v11 = [v10 identifier];
    int v12 = 138543618;
    int v13 = v9;
    __int16 v14 = 2114;
    __int16 v15 = v11;
    _os_log_impl(&dword_1909E3000, v6, defaultLogType, " - Add %{public}@ to %{public}@", (uint8_t *)&v12, 0x16u);
  }
}

- (void)visitRemoveMemberFromGroupEvent:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  os_log = self->_os_log;
  os_log_type_t defaultLogType = self->_defaultLogType;
  if (os_log_type_enabled(os_log, defaultLogType))
  {
    id v6 = os_log;
    id v7 = a3;
    int v8 = [v7 member];
    int v9 = [v8 identifier];
    uint64_t v10 = [v7 group];

    uint64_t v11 = [v10 identifier];
    int v12 = 138543618;
    int v13 = v9;
    __int16 v14 = 2114;
    __int16 v15 = v11;
    _os_log_impl(&dword_1909E3000, v6, defaultLogType, " - Remove %{public}@ from %{public}@", (uint8_t *)&v12, 0x16u);
  }
}

- (void)visitAddSubgroupToGroupEvent:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  os_log = self->_os_log;
  os_log_type_t defaultLogType = self->_defaultLogType;
  if (os_log_type_enabled(os_log, defaultLogType))
  {
    id v6 = os_log;
    id v7 = a3;
    int v8 = [v7 subgroup];
    int v9 = [v8 identifier];
    uint64_t v10 = [v7 group];

    uint64_t v11 = [v10 identifier];
    int v12 = 138543618;
    int v13 = v9;
    __int16 v14 = 2114;
    __int16 v15 = v11;
    _os_log_impl(&dword_1909E3000, v6, defaultLogType, " - Add %{public}@ to %{public}@", (uint8_t *)&v12, 0x16u);
  }
}

- (void)visitRemoveSubgroupFromGroupEvent:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  os_log = self->_os_log;
  os_log_type_t defaultLogType = self->_defaultLogType;
  if (os_log_type_enabled(os_log, defaultLogType))
  {
    id v6 = os_log;
    id v7 = a3;
    int v8 = [v7 subgroup];
    int v9 = [v8 identifier];
    uint64_t v10 = [v7 group];

    uint64_t v11 = [v10 identifier];
    int v12 = 138543618;
    int v13 = v9;
    __int16 v14 = 2114;
    __int16 v15 = v11;
    _os_log_impl(&dword_1909E3000, v6, defaultLogType, " - Remove %{public}@ from %{public}@", (uint8_t *)&v12, 0x16u);
  }
}

- (void)visitLinkContactsEvent:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  os_log = self->_os_log;
  os_log_type_t defaultLogType = self->_defaultLogType;
  if (os_log_type_enabled(os_log, defaultLogType))
  {
    id v6 = os_log;
    id v7 = a3;
    int v8 = [v7 fromContact];
    int v9 = [v8 identifier];
    uint64_t v10 = [v7 toContact];

    uint64_t v11 = [v10 identifier];
    int v12 = 138543618;
    int v13 = v9;
    __int16 v14 = 2114;
    __int16 v15 = v11;
    _os_log_impl(&dword_1909E3000, v6, defaultLogType, " - Link %{public}@ with %{public}@", (uint8_t *)&v12, 0x16u);
  }
}

- (void)visitUnlinkContactEvent:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  os_log = self->_os_log;
  os_log_type_t defaultLogType = self->_defaultLogType;
  if (os_log_type_enabled(os_log, defaultLogType))
  {
    id v6 = os_log;
    id v7 = [a3 contact];
    int v8 = [v7 identifier];
    int v9 = 138543362;
    uint64_t v10 = v8;
    _os_log_impl(&dword_1909E3000, v6, defaultLogType, " - Unlink %{public}@", (uint8_t *)&v9, 0xCu);
  }
}

- (void)visitPreferredContactForNameEvent:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  os_log = self->_os_log;
  os_log_type_t defaultLogType = self->_defaultLogType;
  if (os_log_type_enabled(os_log, defaultLogType))
  {
    id v6 = os_log;
    id v7 = [a3 preferredContact];
    int v8 = [v7 identifier];
    int v9 = 138543362;
    uint64_t v10 = v8;
    _os_log_impl(&dword_1909E3000, v6, defaultLogType, " - Prefer %{public}@ for name", (uint8_t *)&v9, 0xCu);
  }
}

- (void)visitPreferredContactForImageEvent:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  os_log = self->_os_log;
  os_log_type_t defaultLogType = self->_defaultLogType;
  if (os_log_type_enabled(os_log, defaultLogType))
  {
    id v6 = os_log;
    id v7 = [a3 preferredContact];
    int v8 = [v7 identifier];
    int v9 = 138543362;
    uint64_t v10 = v8;
    _os_log_impl(&dword_1909E3000, v6, defaultLogType, " - Prefer %{public}@ for images", (uint8_t *)&v9, 0xCu);
  }
}

- (void)visitDifferentMeCardEvent:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  os_log = self->_os_log;
  os_log_type_t destructiveLogType = self->_destructiveLogType;
  if (os_log_type_enabled(os_log, destructiveLogType))
  {
    id v6 = os_log;
    id v7 = [a3 contactIdentifier];
    int v8 = 138543362;
    int v9 = v7;
    _os_log_impl(&dword_1909E3000, v6, destructiveLogType, " - Set Me Card to %{public}@", (uint8_t *)&v8, 0xCu);
  }
}

- (OS_os_log)os_log
{
  return (OS_os_log *)objc_getProperty(self, a2, 16, 1);
}

- (unsigned)defaultLogType
{
  return self->_defaultLogType;
}

- (unsigned)destructiveLogType
{
  return self->_destructiveLogType;
}

- (void).cxx_destruct
{
}

- (void)willFetchHistoryWithRequest:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  BOOL v5 = a2;
  id v6 = [a3 startingToken];
  int v7 = 138543618;
  uint64_t v8 = a1;
  __int16 v9 = 2114;
  uint64_t v10 = v6;
  _os_log_error_impl(&dword_1909E3000, v5, OS_LOG_TYPE_ERROR, "Will fetch history from invalid anchor: %{public}@ (token: %{public}@)", (uint8_t *)&v7, 0x16u);
}

- (void)fetchDidFailWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1909E3000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch change history: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)fetchDidFailToTranslateWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1909E3000, a2, OS_LOG_TYPE_ERROR, "Failed to translate change history: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end