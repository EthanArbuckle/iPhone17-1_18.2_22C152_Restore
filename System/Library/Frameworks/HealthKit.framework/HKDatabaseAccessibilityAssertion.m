@interface HKDatabaseAccessibilityAssertion
+ (BOOL)supportsSecureCoding;
- (BOOL)isValid;
- (HKDatabaseAccessibilityAssertion)initWithCoder:(id)a3;
- (HKDatabaseAccessibilityAssertion)initWithOwnerIdentifier:(id)a3 uuidString:(id)a4;
- (HKHealthStore)healthStore;
- (NSString)ownerIdentifier;
- (NSUUID)UUID;
- (void)configureAssertion:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
- (void)markInvalid;
@end

@implementation HKDatabaseAccessibilityAssertion

- (HKDatabaseAccessibilityAssertion)initWithOwnerIdentifier:(id)a3 uuidString:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKDatabaseAccessibilityAssertion;
  v9 = [(HKDatabaseAccessibilityAssertion *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_ownerIdentifier, a3);
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v8];
    UUID = v10->_UUID;
    v10->_UUID = (NSUUID *)v11;

    v10->_isValid = 0;
  }

  return v10;
}

- (void)configureAssertion:(id)a3
{
  self->_isValid = 1;
}

- (void)markInvalid
{
  self->_isValid = 0;
}

- (void)invalidate
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19C023000, a2, OS_LOG_TYPE_ERROR, "Attempted to invalidate an invalid assertion %{public}@", (uint8_t *)&v2, 0xCu);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  ownerIdentifier = self->_ownerIdentifier;
  id v7 = v4;
  if (ownerIdentifier)
  {
    [v4 encodeObject:ownerIdentifier forKey:@"OwnerIdentifier"];
    id v4 = v7;
  }
  UUID = self->_UUID;
  if (UUID)
  {
    [v7 encodeObject:UUID forKey:@"UniqueIdentifier"];
    id v4 = v7;
  }
}

- (HKDatabaseAccessibilityAssertion)initWithCoder:(id)a3
{
  id v4 = a3;
  if (![v4 containsValueForKey:@"OwnerIdentifier"])
  {
    _HKInitializeLogging();
    v5 = HKLogAssertions();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[HKDatabaseAccessibilityAssertion initWithCoder:](v5);
    }
    goto LABEL_9;
  }
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"OwnerIdentifier"];
  if (([v4 containsValueForKey:@"UniqueIdentifier"] & 1) == 0)
  {
    _HKInitializeLogging();
    v10 = HKLogAssertions();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[HKDatabaseAccessibilityAssertion initWithCoder:](v10);
    }

LABEL_9:
    v9 = 0;
    goto LABEL_10;
  }
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UniqueIdentifier"];
  UUID = self->_UUID;
  self->_UUID = v6;

  id v8 = [(NSUUID *)self->_UUID UUIDString];
  self = [(HKDatabaseAccessibilityAssertion *)self initWithOwnerIdentifier:v5 uuidString:v8];

  v9 = self;
LABEL_10:

  return v9;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (NSString)ownerIdentifier
{
  return self->_ownerIdentifier;
}

- (HKHealthStore)healthStore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_healthStore);

  return (HKHealthStore *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_healthStore);
  objc_storeStrong((id *)&self->_ownerIdentifier, 0);

  objc_storeStrong((id *)&self->_UUID, 0);
}

- (void)initWithCoder:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19C023000, log, OS_LOG_TYPE_ERROR, "Missing unique identifier", v1, 2u);
}

- (void)initWithCoder:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19C023000, log, OS_LOG_TYPE_ERROR, "Missing ownerIdentifier", v1, 2u);
}

@end