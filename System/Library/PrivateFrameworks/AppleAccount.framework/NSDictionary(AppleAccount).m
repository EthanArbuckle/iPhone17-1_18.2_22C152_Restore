@interface NSDictionary(AppleAccount)
- (id)aa_dictionaryByAddingEntriesFromDictionary:()AppleAccount;
@end

@implementation NSDictionary(AppleAccount)

- (id)aa_dictionaryByAddingEntriesFromDictionary:()AppleAccount
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, a1, @"NSDictionary+AppleAccount.m", 20, @"Invalid parameter not satisfying: %@", @"dictionary" object file lineNumber description];
  }
  v6 = (void *)[a1 mutableCopy];
  [v6 addEntriesFromDictionary:v5];
  v7 = (void *)[v6 copy];

  return v7;
}

@end