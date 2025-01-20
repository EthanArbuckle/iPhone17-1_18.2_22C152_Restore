@interface CKCommSafetyHelper
+ (BOOL)shouldDisableTranscriptCapabilitiesForCKFileTransfer:(id)a3;
+ (BOOL)shouldDisableTranscriptCapabilitiesForFileTransfer:(id)a3;
+ (BOOL)shouldDisableTranscriptCapabilitiesForTransferWithCommSafetyState:(int64_t)a3;
+ (id)defaultLanguageForCountryPairings;
+ (id)validLanguageCountryPairings;
+ (id)waysToGetHelpURL;
@end

@implementation CKCommSafetyHelper

+ (id)waysToGetHelpURL
{
  v2 = +[CKCommSafetyHelper validLanguageCountryPairings];
  v3 = +[CKCommSafetyHelper defaultLanguageForCountryPairings];
  v4 = [MEMORY[0x1E4F6E6D0] sharedManager];
  uint64_t v5 = [v4 enablementGroup];

  if (v5 == 2)
  {
    v6 = @"https://apple.com/go/child-safety/re/";
  }
  else
  {
    v7 = [MEMORY[0x1E4F6E6D0] sharedManager];
    int v8 = [v7 childIsYoungAgeGroup];

    if (v8) {
      v6 = @"https://www.apple.com/go/child-safety/rc-u13/";
    }
    else {
      v6 = @"https://www.apple.com/go/child-safety/rc/";
    }
  }
  v9 = [MEMORY[0x1E4F4EF40] sharedInstance];
  v10 = [v9 primaryAuthKitAccount];
  if (v10)
  {
    v11 = [v9 appleIDCountryCodeForAccount:v10];
    v12 = [v11 lowercaseString];
  }
  else
  {
    v12 = 0;
  }
  v13 = [MEMORY[0x1E4F1CA20] currentLocale];
  v14 = [v13 languageCode];
  v15 = [v14 lowercaseString];

  if (v12 && v15)
  {
    v16 = [v2 objectForKey:v12];
    v17 = v16;
    if (v16)
    {
      int v18 = [v16 containsObject:v15];
      v19 = NSString;
      if (v18)
      {
        v20 = [NSString stringWithFormat:@"%@-%@", v15, v12];
      }
      else
      {
        v21 = [v3 objectForKey:v12];
        v20 = [v19 stringWithFormat:@"%@-%@", v21, v12];
      }
      v6 = [(__CFString *)v6 stringByAppendingString:v20];
    }
  }

  return v6;
}

+ (id)validLanguageCountryPairings
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"br", 0);
  [v2 setValue:v3 forKey:@"br"];

  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"en", @"fr", 0);
  [v2 setValue:v4 forKey:@"ca"];

  uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"en", @"es", 0);
  [v2 setValue:v5 forKey:@"us"];

  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"jp", 0);
  [v2 setValue:v6 forKey:@"jp"];

  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"ko", 0);
  [v2 setValue:v7 forKey:@"kr"];

  int v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"fr", @"nl", 0);
  [v2 setValue:v8 forKey:@"be"];

  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"en", @"fr", 0);
  [v2 setValue:v9 forKey:@"fr"];

  v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"en", @"de", 0);
  [v2 setValue:v10 forKey:@"de"];

  v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"en", 0);
  [v2 setValue:v11 forKey:@"gb"];

  v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"it", 0);
  [v2 setValue:v12 forKey:@"it"];

  v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"nl", 0);
  [v2 setValue:v13 forKey:@"nl"];

  v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"es", 0);
  [v2 setValue:v14 forKey:@"es"];

  v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"sv", 0);
  [v2 setValue:v15 forKey:@"se"];

  v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"en", 0);
  [v2 setValue:v16 forKey:@"au"];

  v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"en", 0);
  [v2 setValue:v17 forKey:@"nz"];

  return v2;
}

+ (id)defaultLanguageForCountryPairings
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v2 setValue:@"br" forKey:@"br"];
  [v2 setValue:@"en" forKey:@"ca"];
  [v2 setValue:@"en" forKey:@"us"];
  [v2 setValue:@"jp" forKey:@"jp"];
  [v2 setValue:@"ko" forKey:@"kr"];
  [v2 setValue:@"fr" forKey:@"be"];
  [v2 setValue:@"fr" forKey:@"fr"];
  [v2 setValue:@"de" forKey:@"de"];
  [v2 setValue:@"en" forKey:@"gb"];
  [v2 setValue:@"it" forKey:@"it"];
  [v2 setValue:@"nl" forKey:@"nl"];
  [v2 setValue:@"es" forKey:@"es"];
  [v2 setValue:@"sv" forKey:@"se"];
  [v2 setValue:@"en" forKey:@"au"];
  [v2 setValue:@"en" forKey:@"nz"];

  return v2;
}

+ (BOOL)shouldDisableTranscriptCapabilitiesForFileTransfer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    char v6 = objc_msgSend(a1, "shouldDisableTranscriptCapabilitiesForTransferWithCommSafetyState:", objc_msgSend(v4, "commSafetySensitive"));
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Tried to check shouldDisableTranscriptCapabilitiesForFileTransfer for a nil fileTransfer. Programming error.", v9, 2u);
      }
    }
    char v6 = 0;
  }

  return v6;
}

+ (BOOL)shouldDisableTranscriptCapabilitiesForCKFileTransfer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    char v6 = objc_msgSend(a1, "shouldDisableTranscriptCapabilitiesForTransferWithCommSafetyState:", objc_msgSend(v4, "commSafetySensitive"));
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Tried to check shouldDisableTranscriptCapabilitiesForCKFileTransfer for a nil ckFileTransfer. Programming error.", v9, 2u);
      }
    }
    char v6 = 0;
  }

  return v6;
}

+ (BOOL)shouldDisableTranscriptCapabilitiesForTransferWithCommSafetyState:(int64_t)a3
{
  id v4 = [MEMORY[0x1E4F6E6D0] sharedManager];
  uint64_t v5 = [v4 enablementGroup];

  if (v5 == 2) {
    return a3 == 1;
  }
  if (v5 == 1) {
    return (unint64_t)(a3 - 1) < 2;
  }
  return 0;
}

@end