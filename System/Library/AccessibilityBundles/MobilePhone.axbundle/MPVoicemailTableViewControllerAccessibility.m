@interface MPVoicemailTableViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)voicemailMessageViewModelForVoicemail:(id)a3 isExpanded:(BOOL)a4;
@end

@implementation MPVoicemailTableViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MPVoicemailTableViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MPVoicemailTableViewController", @"voicemailMessageViewModelForVoicemail:isExpanded:", "@", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MPVoicemailTableViewController", @"voicemailController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MPVoicemailController", @"callProviderManager", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MobilePhone.FTMessage", @"receiverDestinationID", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MobilePhone.FTMessage", @"receiverISOCountryCode", "@", 0);
}

- (id)voicemailMessageViewModelForVoicemail:(id)a3 isExpanded:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_opt_class();
  v30.receiver = self;
  v30.super_class = (Class)MPVoicemailTableViewControllerAccessibility;
  v7 = [(MPVoicemailTableViewControllerAccessibility *)&v30 voicemailMessageViewModelForVoicemail:v6 isExpanded:v4];
  v8 = __UIAccessibilityCastAsSafeCategory();

  LOBYTE(v24) = 0;
  objc_opt_class();
  v9 = [(MPVoicemailTableViewControllerAccessibility *)self safeValueForKeyPath:@"voicemailController.callProviderManager"];
  v10 = __UIAccessibilityCastAsClass();

  v11 = [v10 telephonyProvider];
  v12 = [v11 prioritizedSenderIdentities];
  unint64_t v13 = [v12 count];

  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x3032000000;
    v27 = __Block_byref_object_copy_;
    v28 = __Block_byref_object_dispose_;
    id v29 = 0;
    id v14 = v6;
    AXPerformSafeBlock();
    id v15 = (id)v25[5];

    _Block_object_dispose(&v24, 8);
    if (v13 >= 2 && [v15 length])
    {
      v16 = (void *)[objc_alloc(MEMORY[0x263F7E248]) initWithType:2 value:v15];
      uint64_t v24 = 0;
      v25 = &v24;
      uint64_t v26 = 0x3032000000;
      v27 = __Block_byref_object_copy_;
      v28 = __Block_byref_object_dispose_;
      id v29 = 0;
      uint64_t v22 = MEMORY[0x263EF8330];
      id v23 = v14;
      AXPerformSafeBlock();
      id v17 = (id)v25[5];

      _Block_object_dispose(&v24, 8);
      v18 = objc_msgSend(v16, "canonicalHandleForISOCountryCode:", v17, v22, 3221225472, __96__MPVoicemailTableViewControllerAccessibility_voicemailMessageViewModelForVoicemail_isExpanded___block_invoke_2, &unk_265134E58);

      v19 = [v11 senderIdentityForHandle:v18];
      v20 = [v19 localizedName];

      [v8 _axSetLocalizedSenderIdentityFullName:v20];
    }
  }

  return v8;
}

uint64_t __96__MPVoicemailTableViewControllerAccessibility_voicemailMessageViewModelForVoicemail_isExpanded___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) receiverDestinationID];

  return MEMORY[0x270F9A758]();
}

uint64_t __96__MPVoicemailTableViewControllerAccessibility_voicemailMessageViewModelForVoicemail_isExpanded___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) receiverISOCountryCode];

  return MEMORY[0x270F9A758]();
}

@end