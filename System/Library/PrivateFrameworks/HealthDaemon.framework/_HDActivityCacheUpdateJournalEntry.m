@interface _HDActivityCacheUpdateJournalEntry
+ (BOOL)supportsSecureCoding;
+ (void)applyEntries:(id)a3 withProfile:(id)a4;
- (_HDActivityCacheUpdateJournalEntry)initWithCoder:(id)a3;
@end

@implementation _HDActivityCacheUpdateJournalEntry

+ (void)applyEntries:(id)a3 withProfile:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v4 = (void *)*MEMORY[0x1E4F29F18];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    int v7 = 138543362;
    id v8 = (id)objc_opt_class();
    id v6 = v8;
    _os_log_error_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_ERROR, "Unsupported journal entry %{public}@", (uint8_t *)&v7, 0xCu);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HDActivityCacheUpdateJournalEntry)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_HDActivityCacheUpdateJournalEntry;
  return [(_HDActivityCacheUpdateJournalEntry *)&v4 init];
}

@end