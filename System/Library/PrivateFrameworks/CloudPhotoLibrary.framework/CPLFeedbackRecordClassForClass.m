@interface CPLFeedbackRecordClassForClass
@end

@implementation CPLFeedbackRecordClassForClass

void ___CPLFeedbackRecordClassForClass_block_invoke_28(uint64_t a1)
{
  uint64_t v2 = [(id)_CPLFeedbackRecordClassForClass_mapping objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    v5 = NSStringFromClass(*(Class *)(a1 + 40));
    v6 = (void *)[v5 mutableCopy];

    objc_msgSend(v6, "replaceOccurrencesOfString:withString:options:range:", @"Change", &stru_1F0D5F858, 0, 0, objc_msgSend(v6, "length"));
    [(id)_CPLFeedbackRecordClassForClass_mapping setObject:v6 forKeyedSubscript:*(void *)(a1 + 40)];
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

uint64_t ___CPLFeedbackRecordClassForClass_block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.quarantinefeedback", 0);
  v1 = (void *)_CPLFeedbackRecordClassForClass_queue;
  _CPLFeedbackRecordClassForClass_queue = (uint64_t)v0;

  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v3 = _CPLFeedbackRecordClassForClass_mapping;
  _CPLFeedbackRecordClassForClass_mapping = (uint64_t)v2;
  return MEMORY[0x1F41817F8](v2, v3);
}

@end