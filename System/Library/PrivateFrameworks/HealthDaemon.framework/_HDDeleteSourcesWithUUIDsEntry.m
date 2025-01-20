@interface _HDDeleteSourcesWithUUIDsEntry
+ (BOOL)supportsSecureCoding;
+ (void)applyEntries:(id)a3 withProfile:(id)a4;
- (NSSet)UUIDs;
- (NSString)bundleIdentifier;
- (_HDDeleteSourcesWithUUIDsEntry)initWithCoder:(id)a3;
- (_HDDeleteSourcesWithUUIDsEntry)initWithUUIDs:(id)a3 bundleIdentifier:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setUUIDs:(id)a3;
@end

@implementation _HDDeleteSourcesWithUUIDsEntry

- (_HDDeleteSourcesWithUUIDsEntry)initWithUUIDs:(id)a3 bundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_HDDeleteSourcesWithUUIDsEntry;
  v8 = [(_HDDeleteSourcesWithUUIDsEntry *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    UUIDs = v8->_UUIDs;
    v8->_UUIDs = (NSSet *)v9;

    uint64_t v11 = [v7 copy];
    bundleIdentifier = v8->_bundleIdentifier;
    v8->_bundleIdentifier = (NSString *)v11;
  }
  return v8;
}

+ (void)applyEntries:(id)a3 withProfile:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v29;
    *(void *)&long long v8 = 138543362;
    long long v21 = v8;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v29 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "UUIDs", v21);
        objc_super v14 = [v12 bundleIdentifier];
        v15 = [v6 database];
        id v27 = 0;
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __59___HDDeleteSourcesWithUUIDsEntry_applyEntries_withProfile___block_invoke;
        v23[3] = &unk_1E62F5A88;
        id v24 = v6;
        id v16 = v13;
        id v25 = v16;
        id v17 = v14;
        id v26 = v17;
        BOOL v18 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v15 error:&v27 block:v23];
        id v19 = v27;

        if (!v18)
        {
          _HKInitializeLogging();
          v20 = *MEMORY[0x1E4F29F18];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v21;
            id v33 = v19;
            _os_log_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_DEFAULT, "Unable to delete source/samples for journaled source: %{public}@", buf, 0xCu);
          }
          if (objc_msgSend(v19, "hk_isTransactionInterruptedError"))
          {

            goto LABEL_14;
          }
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_14:
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HDDeleteSourcesWithUUIDsEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  long long v8 = [v4 decodeObjectOfClasses:v7 forKey:@"UUIDs"];

  if (v8)
  {
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BundleIdentifier"];
    self = [(_HDDeleteSourcesWithUUIDsEntry *)self initWithUUIDs:v8 bundleIdentifier:v9];

    uint64_t v10 = self;
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  UUIDs = self->_UUIDs;
  id v5 = a3;
  [v5 encodeObject:UUIDs forKey:@"UUIDs"];
  [v5 encodeObject:self->_bundleIdentifier forKey:@"BundleIdentifier"];
}

- (NSSet)UUIDs
{
  return self->_UUIDs;
}

- (void)setUUIDs:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);

  objc_storeStrong((id *)&self->_UUIDs, 0);
}

@end