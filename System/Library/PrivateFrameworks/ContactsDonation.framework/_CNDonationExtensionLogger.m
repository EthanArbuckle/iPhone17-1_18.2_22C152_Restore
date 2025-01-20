@interface _CNDonationExtensionLogger
- (OS_os_log)log_t;
- (_CNDonationExtensionLogger)init;
- (void)couldNotLoadDonorExtensionForIdentifier:(id)a3 error:(id)a4;
- (void)couldNotRedonateValuesWithReason:(unint64_t)a3 error:(id)a4;
- (void)couldNotRenewDonation:(id)a3 error:(id)a4;
- (void)didExpireDonation:(id)a3 withError:(id)a4;
- (void)didRedonateValuesWithReason:(unint64_t)a3;
- (void)didRenewDonation:(id)a3 untilDate:(id)a4;
- (void)loadedDonorExtension:(id)a3 forIdentifier:(id)a4;
- (void)willRedonateValuesWithReason:(unint64_t)a3;
- (void)willRenewDonation:(id)a3;
@end

@implementation _CNDonationExtensionLogger

- (_CNDonationExtensionLogger)init
{
  v7.receiver = self;
  v7.super_class = (Class)_CNDonationExtensionLogger;
  v2 = [(_CNDonationExtensionLogger *)&v7 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.contacts.donation", "extensions");
    log_t = v2->_log_t;
    v2->_log_t = (OS_os_log *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)loadedDonorExtension:(id)a3 forIdentifier:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(_CNDonationExtensionLogger *)self log_t];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    id v10 = v7;
    __int16 v11 = 2114;
    id v12 = v6;
    _os_log_impl(&dword_214267000, v8, OS_LOG_TYPE_DEFAULT, "Loaded extension for donor '%{public}@': %{public}@", (uint8_t *)&v9, 0x16u);
  }
}

- (void)couldNotLoadDonorExtensionForIdentifier:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(_CNDonationExtensionLogger *)self log_t];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[_CNDonationExtensionLogger couldNotLoadDonorExtensionForIdentifier:error:]((uint64_t)v6, (uint64_t)v7, v8);
  }
}

- (void)willRenewDonation:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(_CNDonationExtensionLogger *)self log_t];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_214267000, v5, OS_LOG_TYPE_DEFAULT, "Will renew donation %{public}@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)didRenewDonation:(id)a3 untilDate:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(_CNDonationExtensionLogger *)self log_t];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    id v10 = v6;
    __int16 v11 = 2114;
    id v12 = v7;
    _os_log_impl(&dword_214267000, v8, OS_LOG_TYPE_DEFAULT, "Donation %{public}@ renewed until %{public}@", (uint8_t *)&v9, 0x16u);
  }
}

- (void)didExpireDonation:(id)a3 withError:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(_CNDonationExtensionLogger *)self log_t];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    id v10 = v6;
    __int16 v11 = 2114;
    id v12 = v7;
    _os_log_impl(&dword_214267000, v8, OS_LOG_TYPE_DEFAULT, "Will not renew donation %{public}@: %{public}@", (uint8_t *)&v9, 0x16u);
  }
}

- (void)couldNotRenewDonation:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(_CNDonationExtensionLogger *)self log_t];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[_CNDonationExtensionLogger couldNotRenewDonation:error:]();
  }
}

- (void)willRedonateValuesWithReason:(unint64_t)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = [(_CNDonationExtensionLogger *)self log_t];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [NSNumber numberWithUnsignedInteger:a3];
    int v6 = 138543362;
    id v7 = v5;
    _os_log_impl(&dword_214267000, v4, OS_LOG_TYPE_DEFAULT, "Will redonate values (reason %{public}@)", (uint8_t *)&v6, 0xCu);
  }
}

- (void)didRedonateValuesWithReason:(unint64_t)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = [(_CNDonationExtensionLogger *)self log_t];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [NSNumber numberWithUnsignedInteger:a3];
    int v6 = 138543362;
    id v7 = v5;
    _os_log_impl(&dword_214267000, v4, OS_LOG_TYPE_DEFAULT, "Did redonate values (reason %{public}@)", (uint8_t *)&v6, 0xCu);
  }
}

- (void)couldNotRedonateValuesWithReason:(unint64_t)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = [(_CNDonationExtensionLogger *)self log_t];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[_CNDonationExtensionLogger couldNotRedonateValuesWithReason:error:](a3, (uint64_t)v6, v7);
  }
}

- (OS_os_log)log_t
{
  return self->_log_t;
}

- (void).cxx_destruct
{
}

- (void)couldNotLoadDonorExtensionForIdentifier:(NSObject *)a3 error:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)os_log_t v3 = 138543618;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_3(&dword_214267000, a2, a3, "Could not load extension for donor '%{public}@' : %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

- (void)couldNotRenewDonation:error:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3(&dword_214267000, v0, v1, "Could not renew donation %{public}@: %{public}@");
}

- (void)couldNotRedonateValuesWithReason:(NSObject *)a3 error:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5 = [NSNumber numberWithUnsignedInteger:a1];
  OUTLINED_FUNCTION_0_0();
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_214267000, a3, OS_LOG_TYPE_ERROR, "Could not redonate values (reason %{public}@): %{public}@", v6, 0x16u);
}

@end