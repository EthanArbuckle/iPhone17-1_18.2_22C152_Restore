@interface CHSWidgetConfigurationReader
- (CHSWidgetConfigurationReader)init;
- (id)_transformResults:(id)a3;
- (void)allConfiguredWidgetsWithCompletion:(id)a3;
@end

@implementation CHSWidgetConfigurationReader

- (CHSWidgetConfigurationReader)init
{
  v6.receiver = self;
  v6.super_class = (Class)CHSWidgetConfigurationReader;
  v2 = [(CHSWidgetConfigurationReader *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[CHSChronoServicesConnection sharedInstance];
    connection = v2->_connection;
    v2->_connection = (CHSChronoServicesConnection *)v3;
  }
  return v2;
}

- (void)allConfiguredWidgetsWithCompletion:(id)a3
{
  id v4 = a3;
  connection = self->_connection;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__CHSWidgetConfigurationReader_allConfiguredWidgetsWithCompletion___block_invoke;
  v7[3] = &unk_1E56C8EF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(CHSChronoServicesConnection *)connection allWidgetConfigurationsByHostWithCompletion:v7];
}

void __67__CHSWidgetConfigurationReader_allConfiguredWidgetsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a3;
  v5 = [a2 configurationsByHost];
  uint64_t v6 = *(void *)(a1 + 40);
  if (v5)
  {
    v7 = [*(id *)(a1 + 32) _transformResults:v5];
  }
  else
  {
    v7 = 0;
  }
  (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v7, v8);
  if (v5) {
}
  }

- (id)_transformResults:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"CHSWidgetConfigurationReader.m" lineNumber:43 description:@"Must have results to parse results."];
  }
  uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__CHSWidgetConfigurationReader__transformResults___block_invoke;
  v10[3] = &unk_1E56C8F18;
  id v7 = v6;
  id v11 = v7;
  [v5 enumerateKeysAndObjectsUsingBlock:v10];

  return v7;
}

void __50__CHSWidgetConfigurationReader__transformResults___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F1CA48] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = objc_msgSend(v6, "containerDescriptors", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v17;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = [*(id *)(*((void *)&v16 + 1) + 8 * v11) widgets];
        [v7 addObjectsFromArray:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  v13 = [_CHSWidgetConfigurationHost alloc];
  v14 = [v6 metricsSpecification];
  v15 = [(_CHSWidgetConfigurationHost *)v13 initWithIdentifier:v5 configurations:v7 metricsSpecification:v14];

  [*(id *)(a1 + 32) addObject:v15];
}

- (void).cxx_destruct
{
}

@end