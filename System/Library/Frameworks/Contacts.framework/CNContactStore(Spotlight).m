@interface CNContactStore(Spotlight)
@end

@implementation CNContactStore(Spotlight)

- (void)reindexSearchableItemsWithIdentifiers:()Spotlight .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1909E3000, log, OS_LOG_TYPE_DEBUG, "Unable to fulfill request to reindex searchable items: this store does not support spotlight indexing", v1, 2u);
}

@end