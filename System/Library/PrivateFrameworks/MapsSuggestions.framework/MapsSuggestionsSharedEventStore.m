@interface MapsSuggestionsSharedEventStore
+ (id)sharedEventStore;
@end

@implementation MapsSuggestionsSharedEventStore

+ (id)sharedEventStore
{
  if (qword_1EB6F08B8 != -1) {
    dispatch_once(&qword_1EB6F08B8, &__block_literal_global_40);
  }
  v2 = (void *)_MergedGlobals_52;
  return v2;
}

void __51__MapsSuggestionsSharedEventStore_sharedEventStore__block_invoke()
{
  v0 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A70DF000, v0, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "EKEventStoreInit", "", buf, 2u);
  }

  id v1 = objc_alloc_init(MEMORY[0x1E4F25550]);
  v2 = (void *)_MergedGlobals_52;
  _MergedGlobals_52 = (uint64_t)v1;

  v3 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)v4 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A70DF000, v3, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "EKEventStoreInit", "", v4, 2u);
  }
}

@end