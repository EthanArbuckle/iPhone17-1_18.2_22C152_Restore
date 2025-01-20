@interface CRKASMPreemptiveIDSMessagingRosterProvider
+ (id)appleIDsFromData:(id)a3 error:(id *)a4;
+ (id)dataForAppleIDs:(id)a3 error:(id *)a4;
+ (id)observedKeyPaths;
+ (id)trustedUserAppleIDsFromRoster:(id)a3;
- (BOOL)isObservingRoster;
- (BOOL)persistAppleIDs:(id)a3 withError:(id *)a4;
- (CRKASMPreemptiveIDSMessagingRosterProvider)initWithRosterProvider:(id)a3 IDSPrimitives:(id)a4 IDSAddressTranslator:(id)a5 dataStore:(id)a6;
- (CRKIDSAddressTranslator)IDSAddressTranslator;
- (CRKIDSPrimitives)IDSPrimitives;
- (CRKKeyedDataStoreProtocol)dataStore;
- (NSSet)messagedAppleIDs;
- (NSURL)messagedAppleIDsURL;
- (id)fetchMessagedAppleIDsWitherror:(id *)a3;
- (void)beginObservingRoster;
- (void)dealloc;
- (void)endObservingRoster;
- (void)messageAppleID:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)rosterDidChange;
- (void)setMessagedAppleIDs:(id)a3;
- (void)setObservingRoster:(BOOL)a3;
@end

@implementation CRKASMPreemptiveIDSMessagingRosterProvider

- (void)dealloc
{
  [(CRKASMPreemptiveIDSMessagingRosterProvider *)self endObservingRoster];
  v3.receiver = self;
  v3.super_class = (Class)CRKASMPreemptiveIDSMessagingRosterProvider;
  [(CRKASMPreemptiveIDSMessagingRosterProvider *)&v3 dealloc];
}

- (CRKASMPreemptiveIDSMessagingRosterProvider)initWithRosterProvider:(id)a3 IDSPrimitives:(id)a4 IDSAddressTranslator:(id)a5 dataStore:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)CRKASMPreemptiveIDSMessagingRosterProvider;
  v14 = [(CRKASMRosterProviderDecoratorBase *)&v17 initWithRosterProvider:a3];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_IDSPrimitives, a4);
    objc_storeStrong((id *)&v15->_IDSAddressTranslator, a5);
    objc_storeStrong((id *)&v15->_dataStore, a6);
    [(CRKASMPreemptiveIDSMessagingRosterProvider *)v15 beginObservingRoster];
    [(CRKASMPreemptiveIDSMessagingRosterProvider *)v15 rosterDidChange];
  }

  return v15;
}

- (void)rosterDidChange
{
  v1 = [a1 verboseDescription];
  OUTLINED_FUNCTION_0_1(&dword_224C00000, v2, v3, "Failed to persist new set of messaged Apple Accounts. Error: %{public}@", v4, v5, v6, v7, 2u);
}

- (id)fetchMessagedAppleIDsWitherror:(id *)a3
{
  uint64_t v5 = [(CRKASMPreemptiveIDSMessagingRosterProvider *)self messagedAppleIDs];

  if (v5)
  {
    uint64_t v6 = [(CRKASMPreemptiveIDSMessagingRosterProvider *)self messagedAppleIDs];
  }
  else
  {
    uint64_t v7 = [(CRKASMPreemptiveIDSMessagingRosterProvider *)self dataStore];
    id v16 = 0;
    v8 = [v7 dataForKey:@"PreemptiveMessageHistory" error:&v16];
    id v9 = v16;

    if (v9)
    {
      uint64_t v6 = 0;
      if (a3) {
        *a3 = v9;
      }
    }
    else if (v8)
    {
      id v15 = 0;
      v10 = [(id)objc_opt_class() appleIDsFromData:v8 error:&v15];
      id v11 = v15;
      id v12 = v11;
      if (v11)
      {
        uint64_t v6 = 0;
        if (a3) {
          *a3 = v11;
        }
      }
      else
      {
        [(CRKASMPreemptiveIDSMessagingRosterProvider *)self setMessagedAppleIDs:v10];
        uint64_t v6 = [(CRKASMPreemptiveIDSMessagingRosterProvider *)self messagedAppleIDs];
      }
    }
    else
    {
      id v13 = objc_opt_new();
      [(CRKASMPreemptiveIDSMessagingRosterProvider *)self setMessagedAppleIDs:v13];

      uint64_t v6 = [(CRKASMPreemptiveIDSMessagingRosterProvider *)self messagedAppleIDs];
    }
  }

  return v6;
}

- (BOOL)persistAppleIDs:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  if ([v6 count])
  {
    id v20 = 0;
    uint64_t v7 = [(id)objc_opt_class() dataForAppleIDs:v6 error:&v20];
    id v8 = v20;
    id v9 = v8;
    if (v6)
    {
      v10 = [(CRKASMPreemptiveIDSMessagingRosterProvider *)self dataStore];
      id v19 = 0;
      char v11 = [v10 removeDataForKey:@"PreemptiveMessageHistory" error:&v19];
      id v12 = v19;

      if (v11)
      {
        id v13 = [(CRKASMPreemptiveIDSMessagingRosterProvider *)self dataStore];
        id v18 = 0;
        char v14 = [v13 setData:v7 forKey:@"PreemptiveMessageHistory" error:&v18];
        id v15 = v18;

        if (v14)
        {
          [(CRKASMPreemptiveIDSMessagingRosterProvider *)self setMessagedAppleIDs:v6];
        }
        else if (a4)
        {
          *a4 = v15;
        }
      }
      else
      {
        char v14 = 0;
        if (a4) {
          *a4 = v12;
        }
      }
    }
    else
    {
      char v14 = 0;
      if (a4) {
        *a4 = v8;
      }
    }
  }
  else
  {
    [(CRKASMPreemptiveIDSMessagingRosterProvider *)self setMessagedAppleIDs:v6];
    id v16 = [(CRKASMPreemptiveIDSMessagingRosterProvider *)self dataStore];
    char v14 = [v16 removeAllDataWithError:a4];
  }
  return v14;
}

- (void)messageAppleID:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = _CRKLogASM_16();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v20 = v4;
    _os_log_impl(&dword_224C00000, v5, OS_LOG_TYPE_DEFAULT, "Preemptively messaging %{public}@", buf, 0xCu);
  }

  id v6 = [[CRKYoIDSMessage alloc] initWithMessage:@"new-trusted-user-checkin"];
  uint64_t v7 = [(CRKASMPreemptiveIDSMessagingRosterProvider *)self IDSAddressTranslator];
  id v8 = [v7 destinationAddressForAppleID:v4];

  id v9 = [(CRKASMRosterProviderDecoratorBase *)self underlyingRosterProvider];
  v10 = [v9 roster];
  char v11 = [v10 user];
  id v12 = [v11 appleID];

  id v13 = objc_opt_new();
  char v14 = [(CRKASMPreemptiveIDSMessagingRosterProvider *)self IDSPrimitives];
  id v15 = [(CRKYoIDSMessage *)v6 dictionaryValue];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __61__CRKASMPreemptiveIDSMessagingRosterProvider_messageAppleID___block_invoke;
  v17[3] = &unk_2646F3438;
  id v18 = v4;
  id v16 = v4;
  [v14 sendMessage:v15 destinationAddress:v8 sourceAppleID:v12 options:v13 completion:v17];
}

void __61__CRKASMPreemptiveIDSMessagingRosterProvider_messageAppleID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = _CRKLogASM_16();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __61__CRKASMPreemptiveIDSMessagingRosterProvider_messageAppleID___block_invoke_cold_1(a1, v3, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138543362;
    uint64_t v8 = v6;
    _os_log_impl(&dword_224C00000, v5, OS_LOG_TYPE_DEFAULT, "Successfully preemptively messaged %{public}@.", (uint8_t *)&v7, 0xCu);
  }
}

+ (id)dataForAppleIDs:(id)a3 error:(id *)a4
{
  return (id)[MEMORY[0x263F08910] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:a4];
}

+ (id)appleIDsFromData:(id)a3 error:(id *)a4
{
  v12[2] = *MEMORY[0x263EF8340];
  uint64_t v5 = (void *)MEMORY[0x263F08928];
  uint64_t v6 = (void *)MEMORY[0x263EFFA08];
  id v7 = a3;
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];
  uint64_t v9 = [v6 setWithArray:v8];
  v10 = [v5 unarchivedObjectOfClasses:v9 fromData:v7 error:a4];

  return v10;
}

+ (id)trustedUserAppleIDsFromRoster:(id)a3
{
  id v3 = (void *)MEMORY[0x263EFFA08];
  if (a3)
  {
    id v4 = [a3 courses];
    uint64_t v5 = objc_msgSend(v4, "crk_flatMapUsingBlock:", &__block_literal_global_83);
    uint64_t v6 = [v3 setWithArray:v5];
  }
  else
  {
    uint64_t v6 = objc_opt_new();
  }

  return v6;
}

id __76__CRKASMPreemptiveIDSMessagingRosterProvider_trustedUserAppleIDsFromRoster___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 trustedUsers];
  id v3 = objc_msgSend(v2, "crk_mapUsingBlock:", &__block_literal_global_22_1);

  return v3;
}

uint64_t __76__CRKASMPreemptiveIDSMessagingRosterProvider_trustedUserAppleIDsFromRoster___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 appleID];
}

+ (id)observedKeyPaths
{
  v4[2] = *MEMORY[0x263EF8340];
  v4[0] = @"roster";
  v4[1] = @"populated";
  uint64_t v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:2];

  return v2;
}

- (void)beginObservingRoster
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (![(CRKASMPreemptiveIDSMessagingRosterProvider *)self isObservingRoster])
  {
    [(CRKASMPreemptiveIDSMessagingRosterProvider *)self setObservingRoster:1];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v3 = objc_msgSend((id)objc_opt_class(), "observedKeyPaths", 0);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v11;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * v7);
          uint64_t v9 = [(CRKASMRosterProviderDecoratorBase *)self underlyingRosterProvider];
          [v9 addObserver:self forKeyPath:v8 options:0 context:@"KVOContext"];

          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v5);
    }
  }
}

- (void)endObservingRoster
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ([(CRKASMPreemptiveIDSMessagingRosterProvider *)self isObservingRoster])
  {
    [(CRKASMPreemptiveIDSMessagingRosterProvider *)self setObservingRoster:0];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v3 = objc_msgSend((id)objc_opt_class(), "observedKeyPaths", 0);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v11;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * v7);
          uint64_t v9 = [(CRKASMRosterProviderDecoratorBase *)self underlyingRosterProvider];
          [v9 removeObserver:self forKeyPath:v8 context:@"KVOContext"];

          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v5);
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == @"KVOContext")
  {
    [(CRKASMPreemptiveIDSMessagingRosterProvider *)self rosterDidChange];
  }
  else
  {
    uint64_t v9 = v6;
    uint64_t v10 = v7;
    v8.receiver = self;
    v8.super_class = (Class)CRKASMPreemptiveIDSMessagingRosterProvider;
    -[CRKASMPreemptiveIDSMessagingRosterProvider observeValueForKeyPath:ofObject:change:context:](&v8, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (CRKIDSPrimitives)IDSPrimitives
{
  return self->_IDSPrimitives;
}

- (CRKIDSAddressTranslator)IDSAddressTranslator
{
  return self->_IDSAddressTranslator;
}

- (CRKKeyedDataStoreProtocol)dataStore
{
  return self->_dataStore;
}

- (NSURL)messagedAppleIDsURL
{
  return self->_messagedAppleIDsURL;
}

- (NSSet)messagedAppleIDs
{
  return self->_messagedAppleIDs;
}

- (void)setMessagedAppleIDs:(id)a3
{
}

- (BOOL)isObservingRoster
{
  return self->_observingRoster;
}

- (void)setObservingRoster:(BOOL)a3
{
  self->_observingRoster = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messagedAppleIDs, 0);
  objc_storeStrong((id *)&self->_messagedAppleIDsURL, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_IDSAddressTranslator, 0);

  objc_storeStrong((id *)&self->_IDSPrimitives, 0);
}

void __61__CRKASMPreemptiveIDSMessagingRosterProvider_messageAppleID___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = [a2 verboseDescription];
  int v6 = 138543618;
  uint64_t v7 = v4;
  __int16 v8 = 2114;
  uint64_t v9 = v5;
  _os_log_error_impl(&dword_224C00000, a3, OS_LOG_TYPE_ERROR, "Failed to preemptively message %{public}@. Error: %{public}@", (uint8_t *)&v6, 0x16u);
}

@end