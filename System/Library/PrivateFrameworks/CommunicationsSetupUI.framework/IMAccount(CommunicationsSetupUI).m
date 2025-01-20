@interface IMAccount(CommunicationsSetupUI)
- (BOOL)isAccountKeyCDPSyncingOrWaitingForUser;
- (id)loginDisplayString;
@end

@implementation IMAccount(CommunicationsSetupUI)

- (id)loginDisplayString
{
  v1 = [a1 login];
  v2 = MEMORY[0x223C3A250]();

  if ([v2 _appearsToBePhoneNumber])
  {
    uint64_t v3 = CNFRegFormattedPhoneNumberForString(v2);

    v2 = (void *)v3;
  }
  return v2;
}

- (BOOL)isAccountKeyCDPSyncingOrWaitingForUser
{
  return ([a1 registrationFailureReason] & 0xFFFFFFFELL) == 28;
}

@end