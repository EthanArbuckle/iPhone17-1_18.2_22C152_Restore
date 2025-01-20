@interface DAContactsAccountProvider
+ (id)providerWithAddressBook:(void *)a3;
+ (id)providerWithContactStore:(id)a3;
- (id)accountByCreatingAccountWithExternalIdentifier:(id)a3;
- (id)accountForContainerWithIdentifier:(id)a3;
- (id)allAccounts;
- (id)fetchedAccountWithExternalIdentifier:(id)a3;
@end

@implementation DAContactsAccountProvider

+ (id)providerWithContactStore:(id)a3
{
  id v3 = a3;
  v4 = [[_DAContactsAccountContactsProvider alloc] initWithContactStore:v3];

  return v4;
}

+ (id)providerWithAddressBook:(void *)a3
{
  id v3 = [[_DAContactsAccountABLegacyProvider alloc] initWithAddressBook:a3];
  return v3;
}

- (id)fetchedAccountWithExternalIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"fetchedAccountWithExternalIdentifier: is abstract" userInfo:0];
  objc_exception_throw(v4);
}

- (id)accountByCreatingAccountWithExternalIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"accountByCreatingAccountWithExternalIdentifier: is abstract" userInfo:0];
  objc_exception_throw(v4);
}

- (id)allAccounts
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"allAccounts: is abstract" userInfo:0];
  objc_exception_throw(v2);
}

- (id)accountForContainerWithIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"accountForContainerWithIdentifier: is abstract" userInfo:0];
  objc_exception_throw(v4);
}

@end