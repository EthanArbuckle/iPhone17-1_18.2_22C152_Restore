@interface HDSourceOrderTransactionCache
@end

@implementation HDSourceOrderTransactionCache

id __86___HDSourceOrderTransactionCache__orderedSourceIDsForBundleIdentifier_database_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v2, "persistentID"));

  return v3;
}

@end