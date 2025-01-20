@interface VerifyDirectDatabaseAccessEntitlementPresence
@end

@implementation VerifyDirectDatabaseAccessEntitlementPresence

uint64_t ___VerifyDirectDatabaseAccessEntitlementPresence_block_invoke()
{
  uint64_t result = _CurrentProcessHasDirectDatabaseAccessEntitlement();
  if ((result & 1) == 0)
  {
    v1 = (void *)[MEMORY[0x1E4F29060] callStackSymbols];
    char v2 = _CallStackSymbolsIncludeFrameworkWithName(v1, @"Contacts");
    uint64_t result = _CallStackSymbolsIncludeFrameworkWithName(v1, @"IMCore");
    if ((v2 & 1) == 0 && (result & 1) == 0)
    {
      uint64_t result = _CallStackSymbolsIncludeFrameworkWithName(v1, @"AddressBook");
      if ((result & 1) == 0)
      {
        ABDiagnosticsEnabled();
        _ABLog2(3, (uint64_t)"void _VerifyDirectDatabaseAccessEntitlementPresence(void)_block_invoke", 185, 0, @"AddressBookLegacy.framework requires BOOLean entitlement: com.apple.Contacts.database-allow", v3, v4, v5, v6);
        return (uint64_t)ABLogSimulateCrashReport(@"AddressBookLegacy.framework requires BOOLean entitlement: com.apple.Contacts.database-allow");
      }
    }
  }
  return result;
}

@end