@interface _HDUserDefaultUpdatedJournalEntry
+ (BOOL)supportsSecureCoding;
+ (void)applyEntries:(id)a3 withProfile:(id)a4;
- (HDUserDefault)userDefault;
- (_HDUserDefaultUpdatedJournalEntry)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _HDUserDefaultUpdatedJournalEntry

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

- (_HDUserDefaultUpdatedJournalEntry)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_HDUserDefaultUpdatedJournalEntry;
  return [(HDJournalEntry *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"LegacyProtectedDataJournalSupport.m" lineNumber:38 description:@"Encoding is not supported"];
}

- (HDUserDefault)userDefault
{
  return self->_userDefault;
}

- (void).cxx_destruct
{
}

@end