@interface INInteraction(CallHistory)
+ (id)ch_interactionForIdentifier:()CallHistory error:;
@end

@implementation INInteraction(CallHistory)

+ (id)ch_interactionForIdentifier:()CallHistory error:
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"source.itemID == %@", v5];
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2050000000;
  v7 = (void *)get_DKEventQueryClass_softClass;
  uint64_t v29 = get_DKEventQueryClass_softClass;
  if (!get_DKEventQueryClass_softClass)
  {
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    v23 = __get_DKEventQueryClass_block_invoke;
    v24 = &unk_1E61C75B8;
    v25 = &v26;
    __get_DKEventQueryClass_block_invoke((uint64_t)&v21);
    v7 = (void *)v27[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v26, 8);
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2050000000;
  v9 = (void *)get_DKSystemEventStreamsClass_softClass;
  uint64_t v29 = get_DKSystemEventStreamsClass_softClass;
  if (!get_DKSystemEventStreamsClass_softClass)
  {
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    v23 = __get_DKSystemEventStreamsClass_block_invoke;
    v24 = &unk_1E61C75B8;
    v25 = &v26;
    __get_DKSystemEventStreamsClass_block_invoke((uint64_t)&v21);
    v9 = (void *)v27[3];
  }
  id v10 = v9;
  _Block_object_dispose(&v26, 8);
  v11 = [v10 appIntentsStream];
  v30[0] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
  v13 = [v8 eventQueryWithPredicate:v6 eventStreams:v12 offset:0 limit:1 sortDescriptors:0];

  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2050000000;
  v14 = (void *)get_DKKnowledgeStoreClass_softClass;
  uint64_t v29 = get_DKKnowledgeStoreClass_softClass;
  if (!get_DKKnowledgeStoreClass_softClass)
  {
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    v23 = __get_DKKnowledgeStoreClass_block_invoke;
    v24 = &unk_1E61C75B8;
    v25 = &v26;
    __get_DKKnowledgeStoreClass_block_invoke((uint64_t)&v21);
    v14 = (void *)v27[3];
  }
  id v15 = v14;
  _Block_object_dispose(&v26, 8);
  v16 = [v15 knowledgeStore];
  v17 = [v16 executeQuery:v13 error:a4];

  v18 = [v17 firstObject];
  v19 = [v18 interaction];

  return v19;
}

@end