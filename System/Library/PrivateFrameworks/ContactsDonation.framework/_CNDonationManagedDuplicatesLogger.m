@interface _CNDonationManagedDuplicatesLogger
- (OS_os_log)log_t;
- (_CNDonationManagedDuplicatesLogger)init;
- (void)didFailRefreshingDuplicates:(id)a3;
- (void)didRefreshDuplicates;
- (void)didSkipRefreshDuplicates:(id)a3;
- (void)managedDuplicateServiceCheckingIn;
- (void)managedDuplicateServiceCriteria:(id)a3;
- (void)willRefreshDuplicates;
@end

@implementation _CNDonationManagedDuplicatesLogger

- (_CNDonationManagedDuplicatesLogger)init
{
  v7.receiver = self;
  v7.super_class = (Class)_CNDonationManagedDuplicatesLogger;
  v2 = [(_CNDonationManagedDuplicatesLogger *)&v7 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.contacts.donation", "deduplication");
    log_t = v2->_log_t;
    v2->_log_t = (OS_os_log *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)managedDuplicateServiceCheckingIn
{
  v2 = [(_CNDonationManagedDuplicatesLogger *)self log_t];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_log_t v3 = 0;
    _os_log_impl(&dword_214267000, v2, OS_LOG_TYPE_DEFAULT, "managed duplicate service checking in", v3, 2u);
  }
}

- (void)managedDuplicateServiceCriteria:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(_CNDonationManagedDuplicatesLogger *)self log_t];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_214267000, v5, OS_LOG_TYPE_DEFAULT, "managed duplicate service has criteria %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)willRefreshDuplicates
{
  v2 = [(_CNDonationManagedDuplicatesLogger *)self log_t];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_log_t v3 = 0;
    _os_log_impl(&dword_214267000, v2, OS_LOG_TYPE_DEFAULT, "Will refresh duplicates", v3, 2u);
  }
}

- (void)didRefreshDuplicates
{
  v2 = [(_CNDonationManagedDuplicatesLogger *)self log_t];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_log_t v3 = 0;
    _os_log_impl(&dword_214267000, v2, OS_LOG_TYPE_DEFAULT, "Did refresh duplicates", v3, 2u);
  }
}

- (void)didSkipRefreshDuplicates:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(_CNDonationManagedDuplicatesLogger *)self log_t];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_214267000, v5, OS_LOG_TYPE_DEFAULT, "Skipping refresh of duplicates due to recent failure. Previous refresh attempted at %{public}@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)didFailRefreshingDuplicates:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(_CNDonationManagedDuplicatesLogger *)self log_t];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_214267000, v5, OS_LOG_TYPE_DEFAULT, "Failed to refresh duplicates. %{public}@", (uint8_t *)&v6, 0xCu);
  }
}

- (OS_os_log)log_t
{
  return self->_log_t;
}

- (void).cxx_destruct
{
}

@end