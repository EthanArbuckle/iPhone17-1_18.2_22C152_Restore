@interface ACAccountStore(DigitalSeparation)
- (id)ds_deviceOwnerEmails;
- (uint64_t)ds_deviceOwnerPhoneNumbers;
@end

@implementation ACAccountStore(DigitalSeparation)

- (id)ds_deviceOwnerEmails
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = objc_msgSend(a1, "aa_primaryAppleAccount");
  v3 = (void *)MEMORY[0x263EFF9C0];
  v4 = objc_msgSend(v2, "ds_accountEmails");
  v5 = [v3 setWithSet:v4];

  v6 = objc_msgSend(a1, "aa_accountsEnabledForDataclass:", *MEMORY[0x263EFAC50]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "ds_accountEmails");
        [v5 unionSet:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (uint64_t)ds_deviceOwnerPhoneNumbers
{
  return [MEMORY[0x263EFFA08] set];
}

@end