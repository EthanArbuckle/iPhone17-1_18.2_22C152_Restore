@interface DiagnosticStateDictionary
@end

@implementation DiagnosticStateDictionary

id ___DiagnosticStateDictionary_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 observer];
  v4 = [v2 queue];
  id v5 = [NSString alloc];
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = (void *)[v5 initWithFormat:@"<%@:%p> (%s)", v7, v3, dispatch_queue_get_label(v4)];

  return v8;
}

@end