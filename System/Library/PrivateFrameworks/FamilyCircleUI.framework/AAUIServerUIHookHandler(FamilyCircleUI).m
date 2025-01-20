@interface AAUIServerUIHookHandler(FamilyCircleUI)
+ (id)fcui_defaultFresnoServerHooks;
@end

@implementation AAUIServerUIHookHandler(FamilyCircleUI)

+ (id)fcui_defaultFresnoServerHooks
{
  v15[13] = *MEMORY[0x263EF8340];
  v14 = objc_alloc_init(FAInvokeMessageHook);
  v15[0] = v14;
  v13 = objc_alloc_init(FALaunchServicesHook);
  v15[1] = v13;
  v12 = objc_alloc_init(FABuyStorageHook);
  v15[2] = v12;
  v11 = objc_alloc_init(FALocationSharingHook);
  v15[3] = v11;
  v0 = objc_alloc_init(FALaunchScreenTimeSetupHook);
  v15[4] = v0;
  v1 = objc_alloc_init(FACreateChildAccountHook);
  v15[5] = v1;
  v2 = objc_alloc_init(FAShowFamilyScreenTimeHook);
  v15[6] = v2;
  id v3 = objc_alloc_init(MEMORY[0x263F25CF8]);
  v15[7] = v3;
  v4 = objc_alloc_init(FAShowSubscriptionsHook);
  v15[8] = v4;
  v5 = objc_alloc_init(FAShowAccountDetailsHook);
  v15[9] = v5;
  v6 = objc_alloc_init(FAResendFamilyInviteHook);
  v15[10] = v6;
  v7 = objc_alloc_init(_TtC14FamilyCircleUI37FAPrivacyDisclosureAcknowledgmentHook);
  v15[11] = v7;
  v8 = objc_alloc_init(FAPeerPaymentHook);
  v15[12] = v8;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:13];

  return v9;
}

@end