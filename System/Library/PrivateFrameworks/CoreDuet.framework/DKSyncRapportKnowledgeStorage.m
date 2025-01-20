@interface DKSyncRapportKnowledgeStorage
@end

@implementation DKSyncRapportKnowledgeStorage

void __48___DKSyncRapportKnowledgeStorage_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sharedInstance_224;
  sharedInstance_sharedInstance_224 = v0;

  +[_DKSync2Policy policyForSyncTransportType:](_DKSync2Policy, "policyForSyncTransportType:", [(id)sharedInstance_sharedInstance_224 transportType]);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [(id)sharedInstance_sharedInstance_224 setPolicy:v2];
}

void __63___DKSyncRapportKnowledgeStorage_registerRequestIDsWithClient___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
}

void __63___DKSyncRapportKnowledgeStorage_registerRequestIDsWithClient___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
}

void __115___DKSyncRapportKnowledgeStorage_fetchEventsFromPeer_windows_streamNames_limit_fetchOrder_highPriority_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
}

uint64_t __115___DKSyncRapportKnowledgeStorage_fetchEventsFromPeer_windows_streamNames_limit_fetchOrder_highPriority_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, uint64_t))(result + 16))(result, 0, 0, a2);
  }
  return result;
}

void __115___DKSyncRapportKnowledgeStorage_fetchDeletedEventIDsFromPeer_sinceDate_streamNames_limit_highPriority_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
}

uint64_t __115___DKSyncRapportKnowledgeStorage_fetchDeletedEventIDsFromPeer_sinceDate_streamNames_limit_highPriority_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, uint64_t))(result + 16))(result, 0, 0, a2);
  }
  return result;
}

@end