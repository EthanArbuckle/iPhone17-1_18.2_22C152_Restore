@interface IMDServiceReachabilityBaseDelegate
- (BOOL)hasValidDowngradeRequestForHandleID:(id)a3;
- (BOOL)isInternationalSpamFilteringEnabled;
- (BOOL)isMMSEnabledForContext:(id)a3;
- (BOOL)isSMSEnabledForContext:(id)a3;
- (BOOL)isUsableForSending;
- (BOOL)networkDataAvailable;
- (BOOL)shouldDowngradeToRecipient:(id)a3 fromSender:(id)a4 withContext:(id)a5;
- (IMDServiceReachabilityBaseDelegate)init;
- (IMDServiceReachabilityBaseDelegate)initWithServiceSession:(id)a3;
- (IMDServiceSession)serviceSession;
- (NSArray)idsRegisteredSIMIDs;
- (NSArray)phoneNumbersOfActiveSubscriptions;
- (NSString)internalServiceName;
- (id)phoneNumberOnSubscriptionWithSIMID:(id)a3;
- (int64_t)maxChatParticipantsForContext:(id)a3;
- (void)setServiceSession:(id)a3;
@end

@implementation IMDServiceReachabilityBaseDelegate

- (IMDServiceSession)serviceSession
{
  v2 = (void *)MEMORY[0x1E016AE80]((char *)self + OBJC_IVAR___IMDServiceReachabilityBaseDelegate_serviceSession, a2);

  return (IMDServiceSession *)v2;
}

- (void)setServiceSession:(id)a3
{
}

- (IMDServiceReachabilityBaseDelegate)initWithServiceSession:(id)a3
{
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  v5.receiver = self;
  v5.super_class = (Class)IMDServiceReachabilityBaseDelegate;
  return [(IMDServiceReachabilityBaseDelegate *)&v5 init];
}

- (BOOL)networkDataAvailable
{
  v3 = self;
  v4 = self;
  id v5 = objc_msgSend(v3, sel_sharedAccountController);
  if (v5)
  {
    v6 = v5;
    unsigned __int8 v7 = objc_msgSend(v5, sel_networkDataAvailable);

    LOBYTE(v5) = v7;
  }
  else
  {
    __break(1u);
  }
  return (char)v5;
}

- (BOOL)isUsableForSending
{
  v2 = self;
  v3 = [(IMDServiceReachabilityBaseDelegate *)v2 serviceSession];
  if (v3)
  {
    v4 = (IMDServiceReachabilityBaseDelegate *)v3;
    unsigned __int8 v5 = [(IMDServiceSession *)v3 isActive];

    v2 = v4;
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (NSArray)idsRegisteredSIMIDs
{
  v3 = self;
  v4 = self;
  id v5 = objc_msgSend(v3, sel_sharedInstance);
  id v6 = objc_msgSend(v5, sel_registeredSIMIDs);

  sub_1D9906F20();
  unsigned __int8 v7 = (void *)sub_1D9906F00();
  swift_bridgeObjectRelease();

  return (NSArray *)v7;
}

- (NSString)internalServiceName
{
  v2 = self;
  result = [(IMDServiceReachabilityBaseDelegate *)v2 serviceSession];
  if (result)
  {
    v4 = result;
    id v5 = [(NSString *)result service];

    id v6 = objc_msgSend(v5, sel_internalName);
    sub_1D9906DA0();

    unsigned __int8 v7 = (void *)sub_1D9906D70();
    swift_bridgeObjectRelease();
    return (NSString *)v7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (int64_t)maxChatParticipantsForContext:(id)a3
{
  return 32;
}

- (id)phoneNumberOnSubscriptionWithSIMID:(id)a3
{
  sub_1D9906DA0();
  v4 = self;
  sub_1D98F8A98();
  uint64_t v6 = v5;

  swift_bridgeObjectRelease();
  if (v6)
  {
    unsigned __int8 v7 = (void *)sub_1D9906D70();
    swift_bridgeObjectRelease();
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (NSArray)phoneNumbersOfActiveSubscriptions
{
  v3 = self;
  v4 = self;
  id v5 = objc_msgSend(v3, sel_sharedInstance);
  id v6 = objc_msgSend(v5, sel_ctSubscriptionInfo);

  if (v6)
  {
    unsigned __int8 v7 = (IMDServiceReachabilityBaseDelegate *)objc_msgSend(v6, sel_phoneNumbersOfActiveSubscriptions);

    sub_1D9906F20();
    v4 = v7;
  }

  v8 = (void *)sub_1D9906F00();
  swift_bridgeObjectRelease();

  return (NSArray *)v8;
}

- (BOOL)hasValidDowngradeRequestForHandleID:(id)a3
{
  sub_1D9906DA0();
  v4 = self;
  id v5 = [(IMDServiceReachabilityBaseDelegate *)v4 serviceSession];
  if (v5)
  {
    id v6 = v5;
    unsigned __int8 v7 = (void *)sub_1D9906D70();
    unsigned __int8 v8 = [(IMDServiceSession *)v6 hasValidDowngradeRequestForHandleID:v7];

    swift_bridgeObjectRelease();
    return v8;
  }
  else
  {

    swift_bridgeObjectRelease();
    return 0;
  }
}

- (IMDServiceReachabilityBaseDelegate)init
{
  result = (IMDServiceReachabilityBaseDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (BOOL)isSMSEnabledForContext:(id)a3
{
  id v5 = self;
  id v6 = a3;
  unsigned __int8 v7 = self;
  id v8 = objc_msgSend(v5, sel_sharedInstance);
  if (v8)
  {
    v9 = v8;
    unsigned __int8 v10 = objc_msgSend(v8, sel_supportsSMS);

    if (v10) {
      unsigned __int8 v11 = 1;
    }
    else {
      unsigned __int8 v11 = sub_1D98F8C8C();
    }

    LOBYTE(v8) = v11 & 1;
  }
  else
  {
    __break(1u);
  }
  return (char)v8;
}

- (BOOL)isMMSEnabledForContext:(id)a3
{
  id v5 = self;
  id v6 = a3;
  unsigned __int8 v7 = self;
  id v8 = objc_msgSend(v6, sel_senderLastAddressedHandle);
  id v9 = objc_msgSend(v6, sel_senderLastAddressedSIMID);
  LOBYTE(v5) = objc_msgSend(v5, sel_IMMMSEnabledForPhoneNumber_simID_, v8, v9);

  return (char)v5;
}

- (BOOL)shouldDowngradeToRecipient:(id)a3 fromSender:(id)a4 withContext:(id)a5
{
  uint64_t v7 = sub_1D9906DA0();
  uint64_t v9 = v8;
  uint64_t v10 = sub_1D9906DA0();
  uint64_t v12 = v11;
  id v13 = a5;
  v14 = self;
  LOBYTE(v10) = sub_1D98F8858(v7, v9, v10, v12, v13);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v10 & 1;
}

- (BOOL)isInternationalSpamFilteringEnabled
{
  v2 = self;

  return objc_msgSend(v2, sel_isInternationalSpamFilteringEnabled);
}

@end