@interface ACAccountStore
@end

@implementation ACAccountStore

uint64_t __68__ACAccountStore_BRAdditions__br_allEligibleAppleAccountsWithError___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "br_isEligibleiCloudAccount");
}

uint64_t __90__ACAccountStore_BRAdditions__br_allEnabledAppleAccountsIncludingDataSeparated_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(v3, "br_isEligibleiCloudAccount")
    && objc_msgSend(v3, "br_isEnabledForCloudDocs"))
  {
    if (*(unsigned char *)(a1 + 32)) {
      uint64_t v4 = 1;
    }
    else {
      uint64_t v4 = [v3 isDataSeparatedAccount] ^ 1;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t __52__ACAccountStore_BRAdditions__br_accountForPersona___block_invoke()
{
  _accountForPersona = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

@end