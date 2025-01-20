@interface PSSpecifier(CNFRegSettings)
- (uint64_t)CNFRegAccount;
- (uint64_t)CNFRegAlias;
- (uint64_t)CNFRegCallerIdAlias;
- (uint64_t)setCNFRegAccount:()CNFRegSettings;
- (uint64_t)setCNFRegAlias:()CNFRegSettings;
- (uint64_t)setCNFRegCallerIdAlias:()CNFRegSettings;
@end

@implementation PSSpecifier(CNFRegSettings)

- (uint64_t)setCNFRegAlias:()CNFRegSettings
{
  return [a1 setProperty:a3 forKey:@"cnfreg-alias"];
}

- (uint64_t)CNFRegAlias
{
  return [a1 propertyForKey:@"cnfreg-alias"];
}

- (uint64_t)setCNFRegCallerIdAlias:()CNFRegSettings
{
  return [a1 setProperty:a3 forKey:@"cnfreg-callerIdAlias"];
}

- (uint64_t)CNFRegCallerIdAlias
{
  return [a1 propertyForKey:@"cnfreg-callerIdAlias"];
}

- (uint64_t)setCNFRegAccount:()CNFRegSettings
{
  if (a3) {
    return [a1 setProperty:a3 forKey:@"cnfreg-account"];
  }
  else {
    return [a1 removePropertyForKey:@"cnfreg-account"];
  }
}

- (uint64_t)CNFRegAccount
{
  return [a1 propertyForKey:@"cnfreg-account"];
}

@end