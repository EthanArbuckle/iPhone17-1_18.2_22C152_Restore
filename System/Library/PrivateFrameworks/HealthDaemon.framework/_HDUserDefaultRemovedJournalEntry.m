@interface _HDUserDefaultRemovedJournalEntry
+ (BOOL)supportsSecureCoding;
+ (void)applyEntries:(id)a3 withProfile:(id)a4;
- (NSString)bundleIdentifier;
- (NSString)key;
- (_HDUserDefaultRemovedJournalEntry)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _HDUserDefaultRemovedJournalEntry

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

- (_HDUserDefaultRemovedJournalEntry)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_HDUserDefaultRemovedJournalEntry;
  return [(HDJournalEntry *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x1E4F29F18];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
  {
    objc_super v4 = v3;
    int v6 = 138543362;
    id v7 = (id)objc_opt_class();
    id v5 = v7;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "%{public}@: encoding is not supported", (uint8_t *)&v6, 0xCu);
  }
}

- (NSString)key
{
  return self->_key;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);

  objc_storeStrong((id *)&self->_key, 0);
}

@end