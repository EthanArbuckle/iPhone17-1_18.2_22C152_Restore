@interface _CNDonationPreferencesLogger
- (OS_os_log)log_t;
- (_CNDonationPreferencesLogger)init;
- (void)isDonationsEnabled:(BOOL)a3;
- (void)setDonationsEnabled:(BOOL)a3;
@end

@implementation _CNDonationPreferencesLogger

- (_CNDonationPreferencesLogger)init
{
  v7.receiver = self;
  v7.super_class = (Class)_CNDonationPreferencesLogger;
  v2 = [(_CNDonationPreferencesLogger *)&v7 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.contacts.donation", "preferences");
    log_t = v2->_log_t;
    v2->_log_t = (OS_os_log *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)isDonationsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v6 = *MEMORY[0x263EF8340];
  v4 = [(_CNDonationPreferencesLogger *)self log_t];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl(&dword_214267000, v4, OS_LOG_TYPE_INFO, "-isDonationsEnabled: %d", (uint8_t *)v5, 8u);
  }
}

- (void)setDonationsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v6 = *MEMORY[0x263EF8340];
  v4 = [(_CNDonationPreferencesLogger *)self log_t];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl(&dword_214267000, v4, OS_LOG_TYPE_INFO, "-setDonationsEnabled: %d", (uint8_t *)v5, 8u);
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