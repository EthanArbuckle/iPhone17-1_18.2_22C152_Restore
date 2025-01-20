@interface CNAggregateContactStore(Spotlight)
@end

@implementation CNAggregateContactStore(Spotlight)

- (void)reindexSearchableItemsWithIdentifiers:()Spotlight .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1909E3000, log, OS_LOG_TYPE_ERROR, "Error reindexing searchable items: no supported stores", v1, 2u);
}

@end