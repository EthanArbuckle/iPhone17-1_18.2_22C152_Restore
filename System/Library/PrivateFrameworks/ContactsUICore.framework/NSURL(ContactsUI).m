@interface NSURL(ContactsUI)
+ (id)_cnui_dialRequestURLWithHandle:()ContactsUI contact:faceTime:video:ttyType:channelIdentifier:preferDefaultApp:;
+ (id)_cnui_expanseURLFutureWithHandle:()ContactsUI;
+ (id)_cnui_expanseURLWithHandle:()ContactsUI;
+ (id)_cnui_faceTimeAudioURLFutureWithHandle:()ContactsUI contact:;
+ (id)_cnui_faceTimeVideoURLFutureWithHandle:()ContactsUI contact:;
+ (id)_cnui_mailURLFutureWithHandle:()ContactsUI contact:;
+ (id)_cnui_mailURLWithHandle:()ContactsUI contact:;
+ (id)_cnui_messagesURLFutureWithHandle:()ContactsUI contact:;
+ (id)_cnui_messagesURLWithHandle:()ContactsUI contact:;
+ (id)_cnui_messagingURLFutureWithHandle:()ContactsUI contact:;
+ (id)_cnui_messagingURLWithHandle:()ContactsUI contact:;
+ (id)_cnui_skypeTextURLFutureWithHandle:()ContactsUI;
+ (id)_cnui_skypeTextURLWithHandle:()ContactsUI;
+ (id)_cnui_skypeVideoURLFutureWithHandle:()ContactsUI;
+ (id)_cnui_skypeVideoURLWithHandle:()ContactsUI;
+ (id)_cnui_skypeVoiceURLFutureWithHandle:()ContactsUI;
+ (id)_cnui_skypeVoiceURLWithHandle:()ContactsUI;
+ (id)_cnui_telephonyURLFutureWithHandle:()ContactsUI contact:channelIdentifier:preferDefaultApp:;
+ (id)_cnui_telephonyURLFutureWithHandle:()ContactsUI contact:preferDefaultApp:;
+ (id)_cnui_ttyRelayURLFutureWithHandle:()ContactsUI contact:;
+ (id)_cnui_ttyRelayURLFutureWithHandle:()ContactsUI contact:channelIdentifier:;
+ (id)_cnui_ttyURLFutureWithHandle:()ContactsUI contact:;
+ (id)_cnui_ttyURLFutureWithHandle:()ContactsUI contact:channelIdentifier:;
+ (id)_cnui_walletPayURLFutureWithHandle:()ContactsUI;
+ (id)_cnui_walletPayURLWithHandle:()ContactsUI;
+ (id)log;
+ (uint64_t)_cnui_faceTimeAudioURLWithHandle:()ContactsUI contact:;
+ (uint64_t)_cnui_faceTimeVideoURLWithHandle:()ContactsUI contact:;
+ (uint64_t)_cnui_telephonyURLWithHandle:()ContactsUI contact:channelIdentifier:preferDefaultApp:;
+ (uint64_t)_cnui_telephonyURLWithHandle:()ContactsUI contact:preferDefaultApp:;
+ (uint64_t)_cnui_ttyRelayURLWithHandle:()ContactsUI contact:;
+ (uint64_t)_cnui_ttyRelayURLWithHandle:()ContactsUI contact:channelIdentifier:;
+ (uint64_t)_cnui_ttyURLWithHandle:()ContactsUI contact:;
+ (uint64_t)_cnui_ttyURLWithHandle:()ContactsUI contact:channelIdentifier:;
@end

@implementation NSURL(ContactsUI)

+ (id)log
{
  if (log_cn_once_token_3 != -1) {
    dispatch_once(&log_cn_once_token_3, &__block_literal_global_19);
  }
  v0 = (void *)log_cn_once_object_3;
  return v0;
}

+ (id)_cnui_telephonyURLFutureWithHandle:()ContactsUI contact:preferDefaultApp:
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void *)MEMORY[0x263F335E0];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __81__NSURL_ContactsUI___cnui_telephonyURLFutureWithHandle_contact_preferDefaultApp___block_invoke;
  v15[3] = &unk_264017BD8;
  id v17 = v9;
  uint64_t v18 = a1;
  id v16 = v8;
  char v19 = a5;
  id v11 = v9;
  id v12 = v8;
  v13 = [v10 lazyFutureWithBlock:v15];

  return v13;
}

+ (id)_cnui_faceTimeAudioURLFutureWithHandle:()ContactsUI contact:
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x263F335E0];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __68__NSURL_ContactsUI___cnui_faceTimeAudioURLFutureWithHandle_contact___block_invoke;
  v13[3] = &unk_264017C00;
  id v15 = v7;
  uint64_t v16 = a1;
  id v14 = v6;
  id v9 = v7;
  id v10 = v6;
  id v11 = [v8 lazyFutureWithBlock:v13];

  return v11;
}

+ (id)_cnui_faceTimeVideoURLFutureWithHandle:()ContactsUI contact:
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x263F335E0];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __68__NSURL_ContactsUI___cnui_faceTimeVideoURLFutureWithHandle_contact___block_invoke;
  v13[3] = &unk_264017C00;
  id v15 = v7;
  uint64_t v16 = a1;
  id v14 = v6;
  id v9 = v7;
  id v10 = v6;
  id v11 = [v8 lazyFutureWithBlock:v13];

  return v11;
}

+ (id)_cnui_ttyURLFutureWithHandle:()ContactsUI contact:
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x263F335E0];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __58__NSURL_ContactsUI___cnui_ttyURLFutureWithHandle_contact___block_invoke;
  v13[3] = &unk_264017C00;
  id v15 = v7;
  uint64_t v16 = a1;
  id v14 = v6;
  id v9 = v7;
  id v10 = v6;
  id v11 = [v8 lazyFutureWithBlock:v13];

  return v11;
}

+ (id)_cnui_ttyRelayURLFutureWithHandle:()ContactsUI contact:
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x263F335E0];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __63__NSURL_ContactsUI___cnui_ttyRelayURLFutureWithHandle_contact___block_invoke;
  v13[3] = &unk_264017C00;
  id v15 = v7;
  uint64_t v16 = a1;
  id v14 = v6;
  id v9 = v7;
  id v10 = v6;
  id v11 = [v8 lazyFutureWithBlock:v13];

  return v11;
}

+ (id)_cnui_telephonyURLFutureWithHandle:()ContactsUI contact:channelIdentifier:preferDefaultApp:
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void *)MEMORY[0x263F335E0];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __99__NSURL_ContactsUI___cnui_telephonyURLFutureWithHandle_contact_channelIdentifier_preferDefaultApp___block_invoke;
  v19[3] = &unk_264017C28;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  uint64_t v23 = a1;
  char v24 = a6;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  id v17 = [v13 lazyFutureWithBlock:v19];

  return v17;
}

+ (id)_cnui_ttyURLFutureWithHandle:()ContactsUI contact:channelIdentifier:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x263F335E0];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __76__NSURL_ContactsUI___cnui_ttyURLFutureWithHandle_contact_channelIdentifier___block_invoke;
  v17[3] = &unk_264017C50;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  uint64_t v21 = a1;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  id v15 = [v11 lazyFutureWithBlock:v17];

  return v15;
}

+ (id)_cnui_ttyRelayURLFutureWithHandle:()ContactsUI contact:channelIdentifier:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x263F335E0];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __81__NSURL_ContactsUI___cnui_ttyRelayURLFutureWithHandle_contact_channelIdentifier___block_invoke;
  v17[3] = &unk_264017C50;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  uint64_t v21 = a1;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  id v15 = [v11 lazyFutureWithBlock:v17];

  return v15;
}

+ (id)_cnui_skypeTextURLFutureWithHandle:()ContactsUI
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263F335E0];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __56__NSURL_ContactsUI___cnui_skypeTextURLFutureWithHandle___block_invoke;
  v9[3] = &unk_264017C78;
  id v10 = v4;
  uint64_t v11 = a1;
  id v6 = v4;
  id v7 = [v5 lazyFutureWithBlock:v9];

  return v7;
}

+ (id)_cnui_skypeVoiceURLFutureWithHandle:()ContactsUI
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263F335E0];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __57__NSURL_ContactsUI___cnui_skypeVoiceURLFutureWithHandle___block_invoke;
  v9[3] = &unk_264017C78;
  id v10 = v4;
  uint64_t v11 = a1;
  id v6 = v4;
  id v7 = [v5 lazyFutureWithBlock:v9];

  return v7;
}

+ (id)_cnui_skypeVideoURLFutureWithHandle:()ContactsUI
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263F335E0];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __57__NSURL_ContactsUI___cnui_skypeVideoURLFutureWithHandle___block_invoke;
  v9[3] = &unk_264017C78;
  id v10 = v4;
  uint64_t v11 = a1;
  id v6 = v4;
  id v7 = [v5 lazyFutureWithBlock:v9];

  return v7;
}

+ (id)_cnui_messagesURLFutureWithHandle:()ContactsUI contact:
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x263F335E0];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __63__NSURL_ContactsUI___cnui_messagesURLFutureWithHandle_contact___block_invoke;
  v13[3] = &unk_264017C00;
  id v15 = v7;
  uint64_t v16 = a1;
  id v14 = v6;
  id v9 = v7;
  id v10 = v6;
  uint64_t v11 = [v8 lazyFutureWithBlock:v13];

  return v11;
}

+ (id)_cnui_messagingURLFutureWithHandle:()ContactsUI contact:
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x263F335E0];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __64__NSURL_ContactsUI___cnui_messagingURLFutureWithHandle_contact___block_invoke;
  v13[3] = &unk_264017C00;
  id v15 = v7;
  uint64_t v16 = a1;
  id v14 = v6;
  id v9 = v7;
  id v10 = v6;
  uint64_t v11 = [v8 lazyFutureWithBlock:v13];

  return v11;
}

+ (id)_cnui_mailURLFutureWithHandle:()ContactsUI contact:
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x263F335E0];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __59__NSURL_ContactsUI___cnui_mailURLFutureWithHandle_contact___block_invoke;
  v13[3] = &unk_264017C00;
  id v15 = v7;
  uint64_t v16 = a1;
  id v14 = v6;
  id v9 = v7;
  id v10 = v6;
  uint64_t v11 = [v8 lazyFutureWithBlock:v13];

  return v11;
}

+ (id)_cnui_walletPayURLFutureWithHandle:()ContactsUI
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263F335E0];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __56__NSURL_ContactsUI___cnui_walletPayURLFutureWithHandle___block_invoke;
  v9[3] = &unk_264017C78;
  id v10 = v4;
  uint64_t v11 = a1;
  id v6 = v4;
  id v7 = [v5 lazyFutureWithBlock:v9];

  return v7;
}

+ (id)_cnui_expanseURLFutureWithHandle:()ContactsUI
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263F335E0];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __54__NSURL_ContactsUI___cnui_expanseURLFutureWithHandle___block_invoke;
  v9[3] = &unk_264017C78;
  id v10 = v4;
  uint64_t v11 = a1;
  id v6 = v4;
  id v7 = [v5 lazyFutureWithBlock:v9];

  return v7;
}

+ (uint64_t)_cnui_telephonyURLWithHandle:()ContactsUI contact:preferDefaultApp:
{
  LOBYTE(v6) = a5;
  return objc_msgSend(a1, "_cnui_dialRequestURLWithHandle:contact:faceTime:video:ttyType:channelIdentifier:preferDefaultApp:", a3, a4, 0, 0, 0, 0, v6);
}

+ (uint64_t)_cnui_faceTimeAudioURLWithHandle:()ContactsUI contact:
{
  LOBYTE(v5) = 0;
  return objc_msgSend(a1, "_cnui_dialRequestURLWithHandle:contact:faceTime:video:ttyType:channelIdentifier:preferDefaultApp:", a3, a4, 1, 0, 0, 0, v5);
}

+ (uint64_t)_cnui_faceTimeVideoURLWithHandle:()ContactsUI contact:
{
  LOBYTE(v5) = 0;
  return objc_msgSend(a1, "_cnui_dialRequestURLWithHandle:contact:faceTime:video:ttyType:channelIdentifier:preferDefaultApp:", a3, a4, 1, 1, 0, 0, v5);
}

+ (uint64_t)_cnui_ttyURLWithHandle:()ContactsUI contact:
{
  LOBYTE(v5) = 0;
  return objc_msgSend(a1, "_cnui_dialRequestURLWithHandle:contact:faceTime:video:ttyType:channelIdentifier:preferDefaultApp:", a3, a4, 0, 0, 2, 0, v5);
}

+ (uint64_t)_cnui_ttyRelayURLWithHandle:()ContactsUI contact:
{
  LOBYTE(v5) = 0;
  return objc_msgSend(a1, "_cnui_dialRequestURLWithHandle:contact:faceTime:video:ttyType:channelIdentifier:preferDefaultApp:", a3, a4, 0, 0, 3, 0, v5);
}

+ (uint64_t)_cnui_telephonyURLWithHandle:()ContactsUI contact:channelIdentifier:preferDefaultApp:
{
  LOBYTE(v7) = a6;
  return objc_msgSend(a1, "_cnui_dialRequestURLWithHandle:contact:faceTime:video:ttyType:channelIdentifier:preferDefaultApp:", a3, a4, 0, 0, 0, a5, v7);
}

+ (uint64_t)_cnui_ttyURLWithHandle:()ContactsUI contact:channelIdentifier:
{
  LOBYTE(v6) = 0;
  return objc_msgSend(a1, "_cnui_dialRequestURLWithHandle:contact:faceTime:video:ttyType:channelIdentifier:preferDefaultApp:", a3, a4, 0, 0, 2, a5, v6);
}

+ (uint64_t)_cnui_ttyRelayURLWithHandle:()ContactsUI contact:channelIdentifier:
{
  LOBYTE(v6) = 0;
  return objc_msgSend(a1, "_cnui_dialRequestURLWithHandle:contact:faceTime:video:ttyType:channelIdentifier:preferDefaultApp:", a3, a4, 0, 0, 3, a5, v6);
}

+ (id)_cnui_dialRequestURLWithHandle:()ContactsUI contact:faceTime:video:ttyType:channelIdentifier:preferDefaultApp:
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a8;
  id v17 = objc_alloc_init(getTUCallProviderManagerClass());
  id v18 = v17;
  if (a5) {
    [v17 faceTimeProvider];
  }
  else {
  id v19 = [v17 telephonyProvider];
  }
  if (v19)
  {
    id v20 = objc_alloc(getTUDialRequestClass_1());
    uint64_t v21 = objc_msgSend(v20, "cn_initWithProvider:", v19);

    id v22 = +[CNHandle tuHandleForHandle:v14];
    [v21 setHandle:v22];

    if ([v15 hasBeenPersisted])
    {
      uint64_t v23 = [v15 identifier];
      [v21 setContactIdentifier:v23];
    }
    [v21 setVideo:a6];
    [v21 setTtyType:a7];
    char v24 = [v21 provider];
    if ([v24 isTelephonyProvider])
    {
      char v25 = (*(uint64_t (**)(void))(*MEMORY[0x263F334E0] + 16))();

      if (v25)
      {
LABEL_11:
        v26 = [v21 provider];
        int v27 = [v26 isTelephonyProvider];

        if (v27) {
          [v21 setPreferDefaultApp:a9];
        }
        v28 = [v21 URL];

        goto LABEL_17;
      }
      char v24 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v16];
      [v21 setLocalSenderIdentityAccountUUID:v24];
    }

    goto LABEL_11;
  }
  v29 = [NSString stringWithFormat:@"Failed to create TUDialRequest, manager = %@, provider = %@", v18, 0];
  v30 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
    +[NSURL(ContactsUI) _cnui_dialRequestURLWithHandle:contact:faceTime:video:ttyType:channelIdentifier:preferDefaultApp:]((uint64_t)v29, v30);
  }

  [MEMORY[0x263F33670] simulateCrashWithMessage:@"%@", v29];
  softLinkABLogDisplayInternalAlert((uint64_t)v29);

  v28 = 0;
LABEL_17:

  return v28;
}

+ (id)_cnui_skypeTextURLWithHandle:()ContactsUI
{
  v3 = NSString;
  id v4 = [a3 stringValue];
  uint64_t v5 = [v3 stringWithFormat:@"skype:%@?chat", v4];

  uint64_t v6 = [NSURL URLWithString:v5];

  return v6;
}

+ (id)_cnui_skypeVoiceURLWithHandle:()ContactsUI
{
  v3 = NSString;
  id v4 = [a3 stringValue];
  uint64_t v5 = [v3 stringWithFormat:@"skype:%@?call", v4];

  uint64_t v6 = [NSURL URLWithString:v5];

  return v6;
}

+ (id)_cnui_skypeVideoURLWithHandle:()ContactsUI
{
  v3 = NSString;
  id v4 = [a3 stringValue];
  uint64_t v5 = [v3 stringWithFormat:@"skype:%@?call&video=true", v4];

  uint64_t v6 = [NSURL URLWithString:v5];

  return v6;
}

+ (id)_cnui_messagesURLWithHandle:()ContactsUI contact:
{
  v3 = (objc_class *)MEMORY[0x263F08BA0];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setScheme:@"sms"];
  uint64_t v6 = [v4 stringValue];

  [v5 setPath:v6];
  uint64_t v7 = [v5 URL];

  return v7;
}

+ (id)_cnui_messagingURLWithHandle:()ContactsUI contact:
{
  v3 = (objc_class *)MEMORY[0x263F08BA0];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setScheme:@"im"];
  uint64_t v6 = [v4 stringValue];

  [v5 setPath:v6];
  uint64_t v7 = [v5 URL];

  return v7;
}

+ (id)_cnui_mailURLWithHandle:()ContactsUI contact:
{
  v3 = NSString;
  id v4 = [a3 stringValue];
  id v5 = [MEMORY[0x263F08708] URLPathAllowedCharacterSet];
  uint64_t v6 = [v4 stringByAddingPercentEncodingWithAllowedCharacters:v5];
  uint64_t v7 = [v3 stringWithFormat:@"mailto:%@", v6];

  id v8 = [NSURL URLWithString:v7];

  return v8;
}

+ (id)_cnui_walletPayURLWithHandle:()ContactsUI
{
  v3 = [a3 stringValue];
  id v4 = +[CNUIPassKitWrapper urlForPeerPaymentWithHandle:v3];

  return v4;
}

+ (id)_cnui_expanseURLWithHandle:()ContactsUI
{
  v0 = +[CNHandle tuHandleForHandle:](CNHandle, "tuHandleForHandle:");
  v1 = (void *)[objc_alloc(getTUConversationMemberClass()) initWithHandle:v0];
  v2 = [MEMORY[0x263EFFA08] setWithObject:v1];
  v3 = (void *)[objc_alloc(getTUJoinConversationRequestClass()) initWithRemoteMembers:v2];
  [v3 setOriginatingUIType:16];
  id v4 = [v3 URL];

  return v4;
}

+ (void)_cnui_dialRequestURLWithHandle:()ContactsUI contact:faceTime:video:ttyType:channelIdentifier:preferDefaultApp:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20B704000, a2, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v2, 0xCu);
}

@end