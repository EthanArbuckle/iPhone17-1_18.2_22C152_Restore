@interface CHSControlConfigurationReader
- (CHSControlConfigurationReader)init;
- (id)_transformResults:(id)a3;
- (void)allConfiguredControlsWithCompletion:(id)a3;
@end

@implementation CHSControlConfigurationReader

- (CHSControlConfigurationReader)init
{
  v6.receiver = self;
  v6.super_class = (Class)CHSControlConfigurationReader;
  v2 = [(CHSControlConfigurationReader *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[CHSControlService sharedInstance];
    connection = v2->_connection;
    v2->_connection = (CHSControlService *)v3;
  }
  return v2;
}

- (void)allConfiguredControlsWithCompletion:(id)a3
{
  id v4 = a3;
  connection = self->_connection;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__CHSControlConfigurationReader_allConfiguredControlsWithCompletion___block_invoke;
  v7[3] = &unk_1E56C8E78;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(CHSControlService *)connection allControlConfigurationsByHostWithCompletion:v7];
}

void __69__CHSControlConfigurationReader_allConfiguredControlsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 40);
  if (v8)
  {
    v7 = objc_msgSend(*(id *)(a1 + 32), "_transformResults:");
  }
  else
  {
    v7 = 0;
  }
  (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v7, v5);
  if (v8) {
}
  }

- (id)_transformResults:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"CHSControlConfigurationReader.m" lineNumber:44 description:@"Must have results to parse results."];
  }
  uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__CHSControlConfigurationReader__transformResults___block_invoke;
  v10[3] = &unk_1E56C8EA0;
  id v7 = v6;
  id v11 = v7;
  [v5 enumerateKeysAndObjectsUsingBlock:v10];

  return v7;
}

void __51__CHSControlConfigurationReader__transformResults___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v17 = a2;
  id v16 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v6 = [v16 controlItems];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v19;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v18 + 1) + 8 * v9);
        id v11 = [_CHSControlConfigurationReference alloc];
        v12 = [v10 controlIdentity];
        v13 = [v10 uniqueIdentifier];
        v14 = [(_CHSControlConfigurationReference *)v11 initWithControlIdentity:v12 uniqueIdentifier:v13];
        [v5 addObject:v14];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  v15 = [[_CHSControlConfigurationHost alloc] initWithIdentifier:v17 configurations:v5];
  [*(id *)(a1 + 32) addObject:v15];
}

- (void).cxx_destruct
{
}

@end