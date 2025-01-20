@interface _CNDonationAccountLogger
- (OS_os_log)log_t;
- (_CNDonationAccountLogger)init;
- (void)accountAdded:(id)a3;
- (void)accountChanged:(id)a3;
- (void)accountRemoved:(id)a3;
- (void)accountsDidNotChange;
- (void)donating:(id)a3;
- (void)donationFailedWithError:(id)a3;
- (void)pluginLoaded;
- (void)pluginUnloaded;
- (void)removalFailedWithError:(id)a3;
- (void)removing:(id)a3;
@end

@implementation _CNDonationAccountLogger

- (_CNDonationAccountLogger)init
{
  v7.receiver = self;
  v7.super_class = (Class)_CNDonationAccountLogger;
  v2 = [(_CNDonationAccountLogger *)&v7 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.contacts.donation", "accounts");
    log_t = v2->_log_t;
    v2->_log_t = (OS_os_log *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)pluginLoaded
{
  v2 = [(_CNDonationAccountLogger *)self log_t];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_log_t v3 = 0;
    _os_log_impl(&dword_214267000, v2, OS_LOG_TYPE_DEFAULT, "Plugin loaded", v3, 2u);
  }
}

- (void)pluginUnloaded
{
  v2 = [(_CNDonationAccountLogger *)self log_t];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_log_t v3 = 0;
    _os_log_impl(&dword_214267000, v2, OS_LOG_TYPE_DEFAULT, "Plugin unloaded", v3, 2u);
  }
}

- (void)accountAdded:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(_CNDonationAccountLogger *)self log_t];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [v4 identifier];
    int v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_214267000, v5, OS_LOG_TYPE_DEFAULT, "Account added: %{public}@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)accountChanged:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(_CNDonationAccountLogger *)self log_t];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [v4 identifier];
    int v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_214267000, v5, OS_LOG_TYPE_DEFAULT, "Account changed: %{public}@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)accountRemoved:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(_CNDonationAccountLogger *)self log_t];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [v4 identifier];
    int v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_214267000, v5, OS_LOG_TYPE_DEFAULT, "Account removed: %{public}@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)donating:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(_CNDonationAccountLogger *)self log_t];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_214267000, v5, OS_LOG_TYPE_DEFAULT, "Creating donation: %{public}@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)removing:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(_CNDonationAccountLogger *)self log_t];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_214267000, v5, OS_LOG_TYPE_DEFAULT, "Removing donation with identifier: %{public}@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)donationFailedWithError:(id)a3
{
  id v4 = a3;
  v5 = [(_CNDonationAccountLogger *)self log_t];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[_CNDonationAccountLogger donationFailedWithError:]((uint64_t)v4, v5);
  }
}

- (void)removalFailedWithError:(id)a3
{
  id v4 = a3;
  v5 = [(_CNDonationAccountLogger *)self log_t];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[_CNDonationAccountLogger removalFailedWithError:]((uint64_t)v4, v5);
  }
}

- (void)accountsDidNotChange
{
  v2 = [(_CNDonationAccountLogger *)self log_t];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)os_log_t v3 = 0;
    _os_log_impl(&dword_214267000, v2, OS_LOG_TYPE_INFO, "Ignoring account changes (no relevant changes)", v3, 2u);
  }
}

- (OS_os_log)log_t
{
  return self->_log_t;
}

- (void).cxx_destruct
{
}

- (void)donationFailedWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_214267000, a2, OS_LOG_TYPE_ERROR, "Could not donate contact information: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)removalFailedWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_214267000, a2, OS_LOG_TYPE_ERROR, "Could not remove donated values: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end