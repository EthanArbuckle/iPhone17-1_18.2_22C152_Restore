@interface INInteraction(IntentsCore)
- (uint64_t)inc_associateFileURLsWithAuditToken:()IntentsCore;
@end

@implementation INInteraction(IntentsCore)

- (uint64_t)inc_associateFileURLsWithAuditToken:()IntentsCore
{
  uint64_t v5 = objc_opt_class();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__INInteraction_IntentsCore__inc_associateFileURLsWithAuditToken___block_invoke;
  v8[3] = &__block_descriptor_64_e15_B16__0__NSURL_8l;
  long long v6 = a3[1];
  long long v9 = *a3;
  long long v10 = v6;
  return objc_msgSend(a1, "_intents_enumerateObjectsOfClass:withBlock:", v5, v8);
}

@end