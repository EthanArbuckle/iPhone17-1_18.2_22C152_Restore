@interface EKVirtualConferenceRoomType
+ (void)virtualConferenceRoomTypesWithCompletion:(id)a3 queue:(id)a4;
- (BOOL)isEqual:(id)a3;
- (EKVirtualConferenceRoomType)initWithTitle:(id)a3 identifier:(id)a4 extensionBundleIdentifier:(id)a5;
- (NSString)extensionBundleIdentifier;
- (NSString)identifier;
- (NSString)originatingExtensionIdentifier;
- (NSString)title;
- (id)description;
@end

@implementation EKVirtualConferenceRoomType

- (EKVirtualConferenceRoomType)initWithTitle:(id)a3 identifier:(id)a4 extensionBundleIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)EKVirtualConferenceRoomType;
  v12 = [(EKVirtualConferenceRoomType *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_title, a3);
    objc_storeStrong((id *)&v13->_identifier, a4);
    objc_storeStrong((id *)&v13->_extensionBundleIdentifier, a5);
  }

  return v13;
}

+ (void)virtualConferenceRoomTypesWithCompletion:(id)a3 queue:(id)a4
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__20;
  v19[4] = __Block_byref_object_dispose__20;
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  dispatch_group_t v7 = dispatch_group_create();
  uint64_t v8 = *MEMORY[0x1E4F282B0];
  v21[0] = @"LS:ExtensionPlatforms";
  v21[1] = v8;
  v22[0] = &unk_1EF9531B0;
  v22[1] = @"com.apple.calendar.virtualconference";
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
  id v10 = (void *)MEMORY[0x1E4F28C70];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __78__EKVirtualConferenceRoomType_virtualConferenceRoomTypesWithCompletion_queue___block_invoke;
  v14[3] = &unk_1E5B99460;
  v18 = v19;
  id v11 = v7;
  objc_super v15 = v11;
  id v12 = v6;
  id v16 = v12;
  id v13 = v5;
  id v17 = v13;
  [v10 extensionsWithMatchingAttributes:v9 completion:v14];

  _Block_object_dispose(v19, 8);
}

void __78__EKVirtualConferenceRoomType_virtualConferenceRoomTypesWithCompletion_queue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __78__EKVirtualConferenceRoomType_virtualConferenceRoomTypesWithCompletion_queue___block_invoke_cold_1();
    }
  }
  else
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v7 = [v5 countByEnumeratingWithState:&v32 objects:v39 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v19 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v33 != v19) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          id v11 = [v10 identifier];
          v28[0] = MEMORY[0x1E4F143A8];
          v28[1] = 3221225472;
          v28[2] = __78__EKVirtualConferenceRoomType_virtualConferenceRoomTypesWithCompletion_queue___block_invoke_101;
          v28[3] = &unk_1E5B993A0;
          uint64_t v12 = *(void *)(a1 + 56);
          id v29 = v11;
          uint64_t v31 = v12;
          id v30 = *(id *)(a1 + 32);
          id v13 = v11;
          [v10 setRequestCompletionBlock:v28];
          [v10 setRequestCancellationBlock:&__block_literal_global_66];
          v26[0] = MEMORY[0x1E4F143A8];
          v26[1] = 3221225472;
          v26[2] = __78__EKVirtualConferenceRoomType_virtualConferenceRoomTypesWithCompletion_queue___block_invoke_108;
          v26[3] = &unk_1E5B993E8;
          id v27 = 0;
          [v10 setRequestInterruptionBlock:v26];
          id v14 = objc_alloc_init(MEMORY[0x1E4F28C80]);
          v37 = @"_EKVirtualConferenceRequestTypeKey";
          v38 = @"_EKVirtualConferenceRequestTypeRoomTypes";
          objc_super v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
          [v14 setUserInfo:v15];

          dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
          id v36 = v14;
          id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
          v25[0] = MEMORY[0x1E4F143A8];
          v25[1] = 3221225472;
          v25[2] = __78__EKVirtualConferenceRoomType_virtualConferenceRoomTypesWithCompletion_queue___block_invoke_110;
          v25[3] = &unk_1E5B99410;
          v25[4] = v10;
          [v10 beginExtensionRequestWithOptions:1 inputItems:v16 completion:v25];
        }
        uint64_t v8 = [v5 countByEnumeratingWithState:&v32 objects:v39 count:16];
      }
      while (v8);
    }
    id v17 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __78__EKVirtualConferenceRoomType_virtualConferenceRoomTypesWithCompletion_queue___block_invoke_111;
    block[3] = &unk_1E5B99438;
    id v22 = *(id *)(a1 + 32);
    id v23 = *(id *)(a1 + 40);
    long long v20 = *(_OWORD *)(a1 + 48);
    id v18 = (id)v20;
    long long v24 = v20;
    dispatch_async(v17, block);

    id v6 = 0;
  }
}

void __78__EKVirtualConferenceRoomType_virtualConferenceRoomTypesWithCompletion_queue___block_invoke_101(uint64_t a1, void *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v23 = a2;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = a3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v36 count:16];
  if (v5)
  {
    uint64_t v25 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v27 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v8 = [v7 userInfo];
        id v9 = [v8 objectForKey:@"_EKVirtualConferenceRoomTypeTitleKey"];

        id v10 = [v7 userInfo];
        id v11 = [v10 objectForKey:@"_EKVirtualConferenceRoomTypeIdentifierKey"];

        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v12 = v9;
        }
        else {
          uint64_t v12 = 0;
        }
        id v13 = v12;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v14 = v11;
        }
        else {
          id v14 = 0;
        }
        objc_super v15 = v14;
        id v16 = v15;
        if (v13) {
          BOOL v17 = v15 == 0;
        }
        else {
          BOOL v17 = 1;
        }
        if (v17)
        {
          id v18 = EKLogHandle;
          if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
          {
            uint64_t v19 = @"(nil)";
            if (v16) {
              long long v20 = v16;
            }
            else {
              long long v20 = @"(nil)";
            }
            *(_DWORD *)buf = 138412802;
            uint64_t v31 = v7;
            if (v13) {
              uint64_t v19 = v13;
            }
            __int16 v32 = 2112;
            long long v33 = v20;
            __int16 v34 = 2112;
            long long v35 = v19;
            _os_log_error_impl(&dword_1A4E47000, v18, OS_LOG_TYPE_ERROR, "Skipping extension room type %@ because it has insufficient information. Identifier = %@ title = %@", buf, 0x20u);
          }
        }
        else
        {
          v21 = [[EKVirtualConferenceRoomType alloc] initWithTitle:v13 identifier:v15 extensionBundleIdentifier:*(void *)(a1 + 32)];
          id v22 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
          objc_sync_enter(v22);
          [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v21];
          objc_sync_exit(v22);
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v36 count:16];
    }
    while (v5);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __78__EKVirtualConferenceRoomType_virtualConferenceRoomTypesWithCompletion_queue___block_invoke_106(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
    __78__EKVirtualConferenceRoomType_virtualConferenceRoomTypesWithCompletion_queue___block_invoke_106_cold_1();
  }
}

void __78__EKVirtualConferenceRoomType_virtualConferenceRoomTypesWithCompletion_queue___block_invoke_108(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
    __78__EKVirtualConferenceRoomType_virtualConferenceRoomTypesWithCompletion_queue___block_invoke_108_cold_1();
  }
}

void __78__EKVirtualConferenceRoomType_virtualConferenceRoomTypesWithCompletion_queue___block_invoke_110(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138412802;
      uint64_t v10 = v8;
      __int16 v11 = 2112;
      id v12 = v5;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_error_impl(&dword_1A4E47000, v7, OS_LOG_TYPE_ERROR, "Request for virtual conference room types failed, extension = %@ request = %@ error = %@", (uint8_t *)&v9, 0x20u);
    }
  }
}

void __78__EKVirtualConferenceRoomType_virtualConferenceRoomTypesWithCompletion_queue___block_invoke_111(uint64_t a1)
{
  id v2 = *(NSObject **)(a1 + 32);
  dispatch_time_t v3 = dispatch_time(0, 3000000000);
  if (dispatch_group_wait(v2, v3))
  {
    id v4 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __78__EKVirtualConferenceRoomType_virtualConferenceRoomTypesWithCompletion_queue___block_invoke_111_cold_1(v4);
    }
  }
  id v5 = *(NSObject **)(a1 + 40);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__EKVirtualConferenceRoomType_virtualConferenceRoomTypesWithCompletion_queue___block_invoke_112;
  block[3] = &unk_1E5B99378;
  long long v7 = *(_OWORD *)(a1 + 48);
  id v6 = (id)v7;
  long long v9 = v7;
  dispatch_async(v5, block);
}

uint64_t __78__EKVirtualConferenceRoomType_virtualConferenceRoomTypesWithCompletion_queue___block_invoke_112(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v2();
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (EKVirtualConferenceRoomType *)a3;
  if (v4 == self)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      id v6 = [(EKVirtualConferenceRoomType *)v5 title];
      long long v7 = [(EKVirtualConferenceRoomType *)self title];
      if (CalEqualStrings())
      {
        uint64_t v8 = [(EKVirtualConferenceRoomType *)v5 identifier];
        long long v9 = [(EKVirtualConferenceRoomType *)self identifier];
        if (CalEqualStrings())
        {
          uint64_t v10 = [(EKVirtualConferenceRoomType *)v5 extensionBundleIdentifier];
          __int16 v11 = [(EKVirtualConferenceRoomType *)self extensionBundleIdentifier];
          char v12 = CalEqualStrings();
        }
        else
        {
          char v12 = 0;
        }
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }

  return v12;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"EKVirtualConferenceRoomType title: %@, identifier: %@, extensionBundleIdentifier: %@", self->_title, self->_identifier, self->_extensionBundleIdentifier];
}

- (NSString)title
{
  return self->_title;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)extensionBundleIdentifier
{
  return self->_extensionBundleIdentifier;
}

- (NSString)originatingExtensionIdentifier
{
  return self->_originatingExtensionIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatingExtensionIdentifier, 0);
  objc_storeStrong((id *)&self->_extensionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

void __78__EKVirtualConferenceRoomType_virtualConferenceRoomTypesWithCompletion_queue___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1A4E47000, v0, OS_LOG_TYPE_ERROR, "Failed to find virtual conference extensions. Error = %@", v1, 0xCu);
}

void __78__EKVirtualConferenceRoomType_virtualConferenceRoomTypesWithCompletion_queue___block_invoke_106_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_11(&dword_1A4E47000, v0, v1, "Request for virtual conference room type cancelled, request = %@ error = %@");
}

void __78__EKVirtualConferenceRoomType_virtualConferenceRoomTypesWithCompletion_queue___block_invoke_108_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_11(&dword_1A4E47000, v0, v1, "Request for virtual conference room interrupted, request = %@ error = %@");
}

void __78__EKVirtualConferenceRoomType_virtualConferenceRoomTypesWithCompletion_queue___block_invoke_111_cold_1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1A4E47000, log, OS_LOG_TYPE_ERROR, "Request for virtual conference room types failed,timed out", v1, 2u);
}

@end