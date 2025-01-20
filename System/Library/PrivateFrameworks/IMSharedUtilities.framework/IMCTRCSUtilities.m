@interface IMCTRCSUtilities
+ (BOOL)IMCarrierRequiresFirstTimeOnAlert;
+ (BOOL)IMCarrierRequiresFirstTimeOnAlertForPhoneNumber:(id)a3 simID:(id)a4;
+ (BOOL)IMRCSEnabledForPhoneNumber:(id)a3 simID:(id)a4;
+ (BOOL)IMRCSGroupMessagingEnabledForPhoneNumber:(id)a3 simID:(id)a4;
+ (BOOL)IMRCSGroupTextReplicationSupportedForPhoneNumber:(id)a3 simID:(id)a4;
+ (BOOL)IMRCSSupportedForPhoneNumber:(id)a3 simID:(id)a4;
+ (int64_t)IMRCSGroupMessagingMaxGroupSizeForPhoneNumber:(id)a3 simID:(id)a4;
- (IMCTRCSUtilities)init;
@end

@implementation IMCTRCSUtilities

+ (BOOL)IMCarrierRequiresFirstTimeOnAlert
{
  id v2 = objc_msgSend(self, sel_sharedManager);
  unsigned __int8 v3 = objc_msgSend(v2, sel_carrierRequiresFirstTimeOnAlert);

  return v3;
}

+ (BOOL)IMCarrierRequiresFirstTimeOnAlertForPhoneNumber:(id)a3 simID:(id)a4
{
  return sub_1A087D8D4((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (SEL *)&selRef_carrierRequiresFirstTimeOnAlertForPhoneNumber_simID_);
}

+ (BOOL)IMRCSSupportedForPhoneNumber:(id)a3 simID:(id)a4
{
  return sub_1A087D8D4((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (SEL *)&selRef_supportedForPhoneNumber_simID_);
}

+ (BOOL)IMRCSGroupMessagingEnabledForPhoneNumber:(id)a3 simID:(id)a4
{
  return sub_1A087DAA4((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (SEL *)&selRef_groupMessagingEnabledForPhoneNumber_simID_);
}

+ (int64_t)IMRCSGroupMessagingMaxGroupSizeForPhoneNumber:(id)a3 simID:(id)a4
{
  sub_1A09F3E18();
  if (a4)
  {
    sub_1A09F3E18();
    a4 = v5;
  }
  id v6 = objc_msgSend(self, sel_sharedManager);
  v7 = (void *)sub_1A09F3DE8();
  if (a4) {
    v8 = (void *)sub_1A09F3DE8();
  }
  else {
    v8 = 0;
  }
  id v9 = objc_msgSend(v6, sel_groupMessagingMaxGroupSizeForPhoneNumber_simID_, v7, v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return (int64_t)v9;
}

+ (BOOL)IMRCSGroupTextReplicationSupportedForPhoneNumber:(id)a3 simID:(id)a4
{
  return sub_1A087DAA4((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (SEL *)&selRef_groupTextReplicationSupportedForPhoneNumber_simID_);
}

+ (BOOL)IMRCSEnabledForPhoneNumber:(id)a3 simID:(id)a4
{
  id v4 = a4;
  if (!a3)
  {
    uint64_t v5 = 0;
    v7 = 0;
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v8 = 0;
    goto LABEL_6;
  }
  uint64_t v5 = sub_1A09F3E18();
  v7 = v6;
  if (!v4) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v8 = sub_1A09F3E18();
  id v4 = v9;
LABEL_6:
  unsigned __int8 v10 = sub_1A087DD00(v5, v7, v8, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v10 & 1;
}

- (IMCTRCSUtilities)init
{
  v3.receiver = self;
  v3.super_class = (Class)IMCTRCSUtilities;
  return [(IMCTRCSUtilities *)&v3 init];
}

@end