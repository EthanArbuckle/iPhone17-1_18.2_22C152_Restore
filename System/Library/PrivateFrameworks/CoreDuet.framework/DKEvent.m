@interface DKEvent
@end

@implementation DKEvent

void __63___DKEvent_INInteraction__relatedContactIdentifiersFromIntent___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 contactIdentifier];
    if (v5) {
      [v6 addObject:v5];
    }
  }
}

uint64_t __54___DKEvent_CSSearchableItem__allowedWebpageURLSchemes__block_invoke()
{
  uint64_t v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"http", @"https", 0);
  uint64_t v1 = allowedWebpageURLSchemes_result;
  allowedWebpageURLSchemes_result = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void __95___DKEvent_CSSearchableItem__eventRepresentingUserActivityWithSearchableItem_bundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __65___DKEvent_INInteraction__fetchInteractionWithPopulatedKeyImage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  v7 = a3;
  if ([a2 isEqual:v5]) {
    uint64_t v6 = *(void *)(a1 + 40);
  }
  else {
    uint64_t v6 = 0;
  }
  v7[2](v7, v6);
}

void __65___DKEvent_INInteraction__fetchInteractionWithPopulatedKeyImage___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 _keyImage];
  int v5 = [v4 isEqual:*(void *)(a1 + 32)];

  if (v5)
  {
    uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    v7 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __65___DKEvent_INInteraction__fetchInteractionWithPopulatedKeyImage___block_invoke_2_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);
    }

    uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v6();
}

uint64_t __84___DKEvent_MOConversion__metadataFromStructuredMetadata_excludedMetadataKeys_cache___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) metadataFromStructuredMetadata:*(void *)(a1 + 40) excludedMetadataKeys:*(void *)(a1 + 48)];
}

uint64_t __59___DKEvent_MOConversion__metadataFromCustomMetadata_cache___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) metadataFromCustomMetadata:*(void *)(a1 + 40)];
}

uint64_t __90___DKEvent_MOConversion__objectFromManagedObject_readMetadata_excludedMetadataKeys_cache___block_invoke(uint64_t a1)
{
  uint64_t v1 = (void *)MEMORY[0x1E4F1C9C8];
  [*(id *)(a1 + 32) startDate];
  return objc_msgSend(v1, "dateWithTimeIntervalSinceReferenceDate:");
}

uint64_t __90___DKEvent_MOConversion__objectFromManagedObject_readMetadata_excludedMetadataKeys_cache___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = (void *)MEMORY[0x1E4F1C9C8];
  [*(id *)(a1 + 32) endDate];
  return objc_msgSend(v1, "dateWithTimeIntervalSinceReferenceDate:");
}

uint64_t __90___DKEvent_MOConversion__objectFromManagedObject_readMetadata_excludedMetadataKeys_cache___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = (void *)MEMORY[0x1E4F1CAF0];
  uint64_t v2 = [*(id *)(a1 + 32) secondsFromGMT];
  return [v1 timeZoneForSecondsFromGMT:v2];
}

uint64_t __105___DKEvent_MOConversion__eventValueFromManagedObject_streamName_readMetadata_excludedMetadataKeys_cache___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 56) uncachedEventValueFromManagedObject:*(void *)(a1 + 32) readMetadata:*(unsigned __int8 *)(a1 + 64) excludedMetadataKeys:*(void *)(a1 + 40) cache:*(void *)(a1 + 48)];
}

void __72___DKEvent_MOConversion__fetchCustomMetadataWithName_valueHash_context___block_invoke(void *a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
  id v3 = [MEMORY[0x1E4F1C0A8] entityForName:@"CustomMetadata" inManagedObjectContext:a1[4]];
  [v2 setEntity:v3];

  id v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"name == %@ AND valueHash == %@", a1[5], a1[6]];
  [v2 setPredicate:v4];

  int v5 = (void *)a1[4];
  id v12 = 0;
  uint64_t v6 = [v5 executeFetchRequest:v2 error:&v12];
  id v7 = v12;
  uint64_t v8 = [v6 lastObject];
  uint64_t v9 = *(void *)(a1[7] + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  if (v7)
  {
    uint64_t v11 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __72___DKEvent_MOConversion__fetchCustomMetadataWithName_valueHash_context___block_invoke_cold_1();
    }
  }
}

uint64_t __23___DKEvent_description__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = _DKStringContainsPrivacySensitiveMetadataKey(v2) ^ 1;
  }
  else {
    uint64_t v3 = 1;
  }

  return v3;
}

void __65___DKEvent_INInteraction__fetchInteractionWithPopulatedKeyImage___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __72___DKEvent_MOConversion__fetchCustomMetadataWithName_valueHash_context___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_18ECEB000, v0, OS_LOG_TYPE_ERROR, "Error during fetch request: %@", v1, 0xCu);
}

@end