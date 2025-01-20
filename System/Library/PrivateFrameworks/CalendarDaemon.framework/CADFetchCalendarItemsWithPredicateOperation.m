@interface CADFetchCalendarItemsWithPredicateOperation
@end

@implementation CADFetchCalendarItemsWithPredicateOperation

uint64_t __138___CADFetchCalendarItemsWithPredicateOperation_performSynchronouslyWithPredicate_entityType_connection_fetchIdentifier_cancellationToken___block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  v6 = objc_opt_class();
  uint64_t v7 = a1[4];
  uint64_t v8 = a1[5];
  uint64_t v9 = a1[6];
  uint64_t v10 = a1[7];
  return [v6 queryDatabase:a3 withID:a2 predicate:v7 connection:v8 serializer:v9 cancellationToken:v10];
}

uint64_t __138___CADFetchCalendarItemsWithPredicateOperation_performSynchronouslyWithPredicate_entityType_connection_fetchIdentifier_cancellationToken___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __138___CADFetchCalendarItemsWithPredicateOperation_performSynchronouslyWithPredicate_entityType_connection_fetchIdentifier_cancellationToken___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end