@interface NSComparisonPredicate
@end

@implementation NSComparisonPredicate

uint64_t __70__NSComparisonPredicate_EmailFoundationAdditions__ef_containsKeyPath___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 expressionType] == 3)
  {
    v4 = [v3 keyPath];
    uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

void __57__NSComparisonPredicate_EFSQLGeneratorPredicateNode__log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_7;
  log_log_7 = (uint64_t)v1;
}

@end