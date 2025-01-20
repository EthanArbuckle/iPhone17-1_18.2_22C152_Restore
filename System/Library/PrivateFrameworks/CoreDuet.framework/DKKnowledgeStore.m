@interface DKKnowledgeStore
@end

@implementation DKKnowledgeStore

void __70___DKKnowledgeStore_saveObjects_tracker_responseQueue_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  +[_DKKnowledgeStore knowledgeStoreDisabledError]();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

uint64_t __70___DKKnowledgeStore_saveObjects_tracker_responseQueue_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __64___DKKnowledgeStore_deleteObjects_responseQueue_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  +[_DKKnowledgeStore knowledgeStoreDisabledError]();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

uint64_t __64___DKKnowledgeStore_deleteObjects_responseQueue_withCompletion___block_invoke_14(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __63___DKKnowledgeStore_executeQuery_responseQueue_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  +[_DKKnowledgeStore knowledgeStoreDisabledError]();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __79___DKKnowledgeStore_deleteAllEventsInEventStream_responseQueue_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  +[_DKKnowledgeStore knowledgeStoreDisabledError]();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __83___DKKnowledgeStore_deleteAllEventsMatchingPredicate_responseQueue_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  +[_DKKnowledgeStore knowledgeStoreDisabledError]();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __76___DKKnowledgeStore_synchronizeWithUrgency_client_responseQueue_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  +[_DKKnowledgeStore knowledgeStoreDisabledError]();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

uint64_t __76___DKKnowledgeStore_synchronizeWithUrgency_client_responseQueue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

@end