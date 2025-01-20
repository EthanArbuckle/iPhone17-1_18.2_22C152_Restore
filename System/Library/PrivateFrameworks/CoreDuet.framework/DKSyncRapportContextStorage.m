@interface DKSyncRapportContextStorage
@end

@implementation DKSyncRapportContextStorage

uint64_t __46___DKSyncRapportContextStorage_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedInstance_sharedInstance_364;
  sharedInstance_sharedInstance_364 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void __61___DKSyncRapportContextStorage_registerRequestIDsWithClient___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
}

void __61___DKSyncRapportContextStorage_registerRequestIDsWithClient___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
}

void __61___DKSyncRapportContextStorage_registerRequestIDsWithClient___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
}

void __61___DKSyncRapportContextStorage_registerRequestIDsWithClient___block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
}

void __95___DKSyncRapportContextStorage_fetchContextValuesFromPeer_forKeyPaths_highPriority_completion___block_invoke(void **a1, void *a2, void *a3, void *a4)
{
}

uint64_t __95___DKSyncRapportContextStorage_fetchContextValuesFromPeer_forKeyPaths_highPriority_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __119___DKSyncRapportContextStorage_sendContextValuesToPeer_registrationIdentifier_archivedObjects_highPriority_completion___block_invoke(void **a1, void *a2, void *a3, void *a4)
{
}

uint64_t __119___DKSyncRapportContextStorage_sendContextValuesToPeer_registrationIdentifier_archivedObjects_highPriority_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __140___DKSyncRapportContextStorage_subscribeToContextValueChangeNotificationsFromPeer_registrationIdentifier_predicate_highPriority_completion___block_invoke(void **a1, void *a2, void *a3, void *a4)
{
}

uint64_t __140___DKSyncRapportContextStorage_subscribeToContextValueChangeNotificationsFromPeer_registrationIdentifier_predicate_highPriority_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __144___DKSyncRapportContextStorage_unsubscribeFromContextValueChangeNotificationsFromPeer_registrationIdentifier_predicate_highPriority_completion___block_invoke(void **a1, void *a2, void *a3, void *a4)
{
}

uint64_t __144___DKSyncRapportContextStorage_unsubscribeFromContextValueChangeNotificationsFromPeer_registrationIdentifier_predicate_highPriority_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

@end