@interface _COClusterRealmPair
+ (id)realmForCurrent;
- (id)_identifierForGroupResult:(id)a3;
@end

@implementation _COClusterRealmPair

+ (id)realmForCurrent
{
  v2 = [MEMORY[0x263F54720] predicateForCurrentDevice];
  id v3 = [[_COClusterRealmPair alloc] _initWithPredicate:v2];

  return v3;
}

- (id)_identifierForGroupResult:(id)a3
{
  id v3 = [a3 firstObject];
  v4 = [v3 HomeKitMediaSystemIdentifier];
  v5 = [v4 UUIDString];

  return v5;
}

@end