@interface IDSAccount
- (BOOL)_validateIDSAccount;
- (BOOL)isBizAccount;
- (unsigned)serviceType;
@end

@implementation IDSAccount

- (BOOL)_validateIDSAccount
{
  return [(IDSAccount *)self canSend];
}

- (unsigned)serviceType
{
  id v3 = [(IDSAccount *)self serviceName];
  if ([v3 isEqualToString:IDSServiceNameiMessage]) {
    return 0;
  }
  id v5 = [(IDSAccount *)self serviceName];
  if ([v5 isEqualToString:IDSServiceNameiMessageForBusiness]) {
    return 1;
  }
  unsigned int result = IMOSLoggingEnabled();
  if (result)
  {
    v6 = OSLogHandleForIMFoundationCategory();
    unsigned int result = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
    if (result)
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "IDSAccount (iMessageAdditions) -serviceType - Did not find serviceType. Using default.", v7, 2u);
      return 0;
    }
  }
  return result;
}

- (BOOL)isBizAccount
{
  id v2 = [(IDSAccount *)self serviceName];
  uint64_t v3 = IDSServiceNameiMessageForBusiness;

  return [v2 isEqualToString:v3];
}

@end