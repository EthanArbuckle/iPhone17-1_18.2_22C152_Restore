@interface LSStringsFileContent
@end

@implementation LSStringsFileContent

void __32___LSStringsFileContent_IOQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.launchservices.localization-io", v2);
  v1 = (void *)+[_LSStringsFileContent IOQueue]::result;
  +[_LSStringsFileContent IOQueue]::result = (uint64_t)v0;
}

void __41___LSStringsFileContent_debugDescription__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __87___LSStringsFileContent_stringsFileContentFromBundle_forLocaleCode_cacheLocalizations___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 16) objectForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

id __87___LSStringsFileContent_stringsFileContentFromBundle_forLocaleCode_cacheLocalizations___block_invoke_2(uint64_t a1)
{
  -[_LSStringsFileContent loadLoctableIfNecessaryFromBundle:](*(void *)(a1 + 32), *(__CFBundle **)(a1 + 48));
  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v2 = *(__CFBundle **)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 32);

  return -[_LSStringsFileContent getStringsFileContentAfterLocTableLoadedInBundle:forLocale:](v4, v2, v3);
}

void __76___LSStringsFileContent_prewarmAllLocalizationsWithBundle_forLocalizations___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) objectAtIndex:a2];
  uint64_t v4 = -[_LSStringsFileContent getStringsFileContentAfterLocTableLoadedInBundle:forLocale:](*(void *)(a1 + 40), *(__CFBundle **)(a1 + 56), v3);
  [v4 prewarm];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76___LSStringsFileContent_prewarmAllLocalizationsWithBundle_forLocalizations___block_invoke_2;
  block[3] = &unk_1E522DD38;
  v5 = *(NSObject **)(a1 + 48);
  block[4] = *(void *)(a1 + 40);
  id v9 = v3;
  id v10 = v4;
  id v6 = v4;
  id v7 = v3;
  dispatch_sync(v5, block);
}

uint64_t __76___LSStringsFileContent_prewarmAllLocalizationsWithBundle_forLocalizations___block_invoke_2(void *a1)
{
  return [*(id *)(a1[4] + 16) setObject:a1[6] forKeyedSubscript:a1[5]];
}

@end