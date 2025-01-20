@interface LSServerSettingsStore
@end

@implementation LSServerSettingsStore

uint64_t __64___LSServerSettingsStore_setUserElection_forExtensionKey_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internalQueue_insertIdentifier:userElection:", *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

uint64_t __54___LSServerSettingsStore_resetUserElectionsWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internalQueue_resetUserElection");
}

@end