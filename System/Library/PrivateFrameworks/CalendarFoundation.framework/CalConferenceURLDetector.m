@interface CalConferenceURLDetector
+ (BOOL)_hasDisallowedPathExtension:(id)a3;
+ (BOOL)_hasValidPath:(id)a3;
+ (BOOL)_isGoogleMeetURL:(id)a3;
+ (BOOL)_isValidTelURL:(id)a3;
+ (BOOL)isPreferredURL:(id)a3;
+ (BOOL)isTUConversationLink:(id)a3;
+ (id)_URLDataDetector;
+ (id)_URLsInSource:(id)a3;
+ (id)_dataDetector;
+ (id)_firstPhoneNumberInSource:(id)a3;
+ (id)_googleMeetSuffix;
+ (id)_linksInSource:(id)a3;
+ (id)_microsoftSafeLinkPrefix;
+ (id)_phoneNumberDataDetector;
+ (id)_preferredHostSuffixes;
+ (id)conferenceURLFromSources:(id)a3;
+ (id)decodeIfSafeLink:(id)a3;
+ (id)googleMeetURLsAndPhoneNumbersFromSource:(id)a3;
+ (id)logHandle;
@end

@implementation CalConferenceURLDetector

+ (id)conferenceURLFromSources:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    v7 = 0;
    unint64_t v8 = 0;
    uint64_t v9 = *(void *)v34;
    v27 = v4;
    uint64_t v25 = *(void *)v34;
    do
    {
      uint64_t v10 = 0;
      uint64_t v26 = v6;
      do
      {
        if (*(void *)v34 != v9) {
          objc_enumerationMutation(v4);
        }
        v11 = *(void **)(*((void *)&v33 + 1) + 8 * v10);
        if (objc_msgSend(v11, "length", v25))
        {
          unint64_t v28 = (unint64_t)v7;
          v12 = [a1 _URLsInSource:v11];
          long long v29 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          id v13 = v12;
          uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v37 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v30;
            while (2)
            {
              for (uint64_t i = 0; i != v15; ++i)
              {
                if (*(void *)v30 != v16) {
                  objc_enumerationMutation(v13);
                }
                v18 = *(void **)(*((void *)&v29 + 1) + 8 * i);
                if ([v18 resultType] == 32)
                {
                  v19 = [v18 URL];
                  id v20 = [a1 decodeIfSafeLink:v19];

                  if ([(id)objc_opt_class() isPreferredURL:v20])
                  {

                    id v4 = v27;
                    v7 = (void *)v28;
                    goto LABEL_36;
                  }
                  if (!v8)
                  {
                    if ([a1 _isValidTelURL:v20]) {
                      unint64_t v8 = (unint64_t)v20;
                    }
                    else {
                      unint64_t v8 = 0;
                    }
                  }
                }
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v37 count:16];
              if (v15) {
                continue;
              }
              break;
            }
          }

          id v4 = v27;
          v7 = (void *)v28;
          uint64_t v6 = v26;
          if (!(v8 | v28))
          {
            v21 = [a1 _firstPhoneNumberInSource:v11];
            if ([v21 resultType] == 2048)
            {
              v22 = [v21 phoneNumber];
              v7 = [v22 phoneURL];

              uint64_t v6 = v26;
            }
            else
            {
              v7 = 0;
            }
          }
          uint64_t v9 = v25;
        }
        ++v10;
      }
      while (v10 != v6);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v6);
  }
  else
  {
    v7 = 0;
    unint64_t v8 = 0;
  }

  if (v8) {
    v23 = (void *)v8;
  }
  else {
    v23 = v7;
  }
  id v20 = v23;
LABEL_36:

  return v20;
}

+ (id)googleMeetURLsAndPhoneNumbersFromSource:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v6 = [a1 _linksInSource:v4];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v39 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        if ([v11 resultType] == 32)
        {
          v12 = [v11 URL];
          if ([(id)objc_opt_class() _isGoogleMeetURL:v12]) {
            [v5 addObject:v11];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v38 objects:v44 count:16];
    }
    while (v8);
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v13 = v6;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v34 objects:v43 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v35 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v34 + 1) + 8 * j);
        if ([v18 resultType] == 32)
        {
          v19 = [v18 URL];
          if ([(id)objc_opt_class() isPreferredURL:v19]
            && ([(id)objc_opt_class() _isGoogleMeetURL:v19] & 1) == 0)
          {
            [v5 addObject:v18];
          }
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v34 objects:v43 count:16];
    }
    while (v15);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v20 = v13;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v30 objects:v42 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v31;
    do
    {
      for (uint64_t k = 0; k != v22; ++k)
      {
        if (*(void *)v31 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void **)(*((void *)&v30 + 1) + 8 * k);
        if (objc_msgSend(v25, "resultType", (void)v30) == 32)
        {
          uint64_t v26 = [v25 URL];
          if ([a1 _isValidTelURL:v26]) {
            [v5 addObject:v25];
          }
        }
        else if ([v25 resultType] == 2048)
        {
          v27 = [v25 phoneNumber];
          unint64_t v28 = [v27 phoneURL];

          if (v28) {
            [v5 addObject:v25];
          }
        }
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v30 objects:v42 count:16];
    }
    while (v22);
  }

  return v5;
}

+ (id)_linksInSource:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() _dataDetector];
  uint64_t v5 = objc_msgSend(v4, "matchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));

  return v5;
}

+ (id)_URLsInSource:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__6;
  uint64_t v21 = __Block_byref_object_dispose__6;
  id v22 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__6;
  uint64_t v15 = __Block_byref_object_dispose__6;
  id v16 = 0;
  uint64_t v5 = [(id)objc_opt_class() _URLDataDetector];
  uint64_t v6 = [v4 length];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __42__CalConferenceURLDetector__URLsInSource___block_invoke;
  v10[3] = &unk_1E56CDF50;
  v10[4] = &v11;
  v10[5] = &v17;
  v10[6] = a1;
  objc_msgSend(v5, "enumerateMatchesInString:options:range:usingBlock:", v4, 2, 0, v6, v10);

  if (v12[5])
  {
    objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObject:");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = (id)v18[5];
  }
  uint64_t v8 = v7;
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);

  return v8;
}

void __42__CalConferenceURLDetector__URLsInSource___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if (v7)
  {
    id v11 = v7;
    BOOL v8 = [v7 resultType] == 32;
    id v7 = v11;
    if (v8)
    {
      uint64_t v9 = [v11 URL];
      uint64_t v10 = [*(id *)(a1 + 48) decodeIfSafeLink:v9];

      if ([*(id *)(a1 + 48) isPreferredURL:v10])
      {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
        *a4 = 1;
      }
      else
      {
        [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v11];
      }

      id v7 = v11;
    }
  }
}

+ (id)_firstPhoneNumberInSource:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 _phoneNumberDataDetector];
  uint64_t v6 = objc_msgSend(v5, "firstMatchInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));

  return v6;
}

+ (id)decodeIfSafeLink:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (!v4)
  {
    id v18 = 0;
    goto LABEL_18;
  }
  uint64_t v6 = [v4 host];
  id v7 = [a1 _microsoftSafeLinkPrefix];
  int v8 = [v6 containsString:v7];

  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F29088] componentsWithURL:v5 resolvingAgainstBaseURL:0];
    if (!v9)
    {
      id v18 = 0;
      goto LABEL_17;
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v21 = v9;
    uint64_t v10 = [v9 queryItems];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v23;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          id v16 = [v15 name];
          char v17 = [v16 isEqualToString:@"url"];

          if (v17)
          {
            uint64_t v19 = [v15 value];
            id v18 = [MEMORY[0x1E4F1CB10] URLWithString:v19];

            goto LABEL_17;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
  }
  id v18 = v5;
LABEL_17:

LABEL_18:

  return v18;
}

+ (BOOL)isPreferredURL:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4
    && ([a1 _hasDisallowedPathExtension:v4] & 1) == 0
    && [a1 _hasValidPath:v4])
  {
    uint64_t v5 = objc_msgSend(v4, "cal_hostAfterGoogleRedirects");
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v6 = objc_msgSend(a1, "_preferredHostSuffixes", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          if ([v5 hasSuffix:*(void *)(*((void *)&v13 + 1) + 8 * i)])
          {

            char v11 = 1;
            goto LABEL_16;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    char v11 = [a1 isTUConversationLink:v4];
LABEL_16:
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

+ (BOOL)isTUConversationLink:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v3 = [a3 host];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = objc_msgSend(MEMORY[0x1E4FADB70], "baseURLs", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v4);
          }
          uint64_t v8 = [*(id *)(*((void *)&v11 + 1) + 8 * i) host];
          char v9 = [v8 isEqualToString:v3];

          if (v9)
          {
            LOBYTE(v5) = 1;
            goto LABEL_12;
          }
        }
        uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

+ (BOOL)_isGoogleMeetURL:(id)a3
{
  id v4 = a3;
  if (v4
    && ([a1 _hasDisallowedPathExtension:v4] & 1) == 0
    && [a1 _hasValidPath:v4])
  {
    uint64_t v5 = objc_msgSend(v4, "cal_hostAfterGoogleRedirects");
    uint64_t v6 = [a1 _googleMeetSuffix];
    char v7 = [v5 hasSuffix:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

+ (BOOL)_isValidTelURL:(id)a3
{
  id v3 = a3;
  if (objc_msgSend(v3, "cal_hasSchemeTel"))
  {
    id v4 = [v3 resourceSpecifier];
    uint64_t v5 = [v4 stringByReplacingOccurrencesOfString:@"/" withString:&stru_1EE0C39E0];
    BOOL v6 = [v5 length] != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (BOOL)_hasValidPath:(id)a3
{
  id v3 = [a3 path];
  id v4 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  uint64_t v5 = [v3 stringByTrimmingCharactersInSet:v4];

  BOOL v6 = [v5 length]
    && ([v5 length] != 1 || (objc_msgSend(v5, "hasPrefix:", @"/") & 1) == 0);

  return v6;
}

+ (BOOL)_hasDisallowedPathExtension:(id)a3
{
  id v3 = a3;
  if (_hasDisallowedPathExtension__onceToken != -1) {
    dispatch_once(&_hasDisallowedPathExtension__onceToken, &__block_literal_global_19);
  }
  id v4 = [v3 pathExtension];
  if ([v4 length]) {
    char v5 = [(id)_hasDisallowedPathExtension__disallowedPathExtensions containsObject:v4];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

uint64_t __56__CalConferenceURLDetector__hasDisallowedPathExtension___block_invoke()
{
  _hasDisallowedPathExtension__disallowedPathExtensions = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EE0D45A0];

  return MEMORY[0x1F41817F8]();
}

+ (id)_googleMeetSuffix
{
  if (_googleMeetSuffix_onceToken != -1) {
    dispatch_once(&_googleMeetSuffix_onceToken, &__block_literal_global_46);
  }
  v2 = (void *)_googleMeetSuffix_suffix;

  return v2;
}

void __45__CalConferenceURLDetector__googleMeetSuffix__block_invoke()
{
  v0 = (void *)_googleMeetSuffix_suffix;
  _googleMeetSuffix_suffix = @"meet.google.com";
}

+ (id)_microsoftSafeLinkPrefix
{
  if (_microsoftSafeLinkPrefix_onceToken != -1) {
    dispatch_once(&_microsoftSafeLinkPrefix_onceToken, &__block_literal_global_51_0);
  }
  v2 = (void *)_microsoftSafeLinkPrefix_prefix;

  return v2;
}

void __52__CalConferenceURLDetector__microsoftSafeLinkPrefix__block_invoke()
{
  v0 = (void *)_microsoftSafeLinkPrefix_prefix;
  _microsoftSafeLinkPrefix_prefix = @"safelinks.protection.outlook.com";
}

+ (id)_preferredHostSuffixes
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__CalConferenceURLDetector__preferredHostSuffixes__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_preferredHostSuffixes_onceToken != -1) {
    dispatch_once(&_preferredHostSuffixes_onceToken, block);
  }
  v2 = (void *)_preferredHostSuffixes_preferredSuffixes;

  return v2;
}

void __50__CalConferenceURLDetector__preferredHostSuffixes__block_invoke(uint64_t a1)
{
  v4[22] = *MEMORY[0x1E4F143B8];
  v4[0] = @".webex.com";
  v4[1] = @".webex.com.cn";
  v4[2] = @".dmz.webex.com";
  v4[3] = @"web.ciscospark.com";
  v4[4] = @".skype.com";
  v4[5] = @"meetings.ringcentral.com";
  v1 = [*(id *)(a1 + 32) _googleMeetSuffix];
  v4[6] = v1;
  v4[7] = @"zoom.us";
  v4[8] = @"teams.microsoft.com";
  v4[9] = @"teams.microsoft.us";
  v4[10] = @"teams.live.com";
  v4[11] = @"teams.microsoftonline.cn";
  v4[12] = @"messenger.com";
  v4[13] = @"msngr.com";
  v4[14] = @"line.me";
  v4[15] = @"telegram.me";
  v4[16] = @"duo.app.goo.gl";
  v4[17] = @"transcripts.gotomeeting.com";
  v4[18] = @"gotomeet.me";
  v4[19] = @"bluejeans.com";
  v4[20] = @"join.me";
  v4[21] = @"call.whatsapp.com";
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:22];
  id v3 = (void *)_preferredHostSuffixes_preferredSuffixes;
  _preferredHostSuffixes_preferredSuffixes = v2;
}

+ (id)_dataDetector
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__CalConferenceURLDetector__dataDetector__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_dataDetector_onceToken != -1) {
    dispatch_once(&_dataDetector_onceToken, block);
  }
  uint64_t v2 = (void *)_dataDetector_dataDetector;

  return v2;
}

void __41__CalConferenceURLDetector__dataDetector__block_invoke()
{
  id v6 = 0;
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F28BE8]) initWithTypes:2080 error:&v6];
  id v1 = v6;
  uint64_t v2 = (void *)_dataDetector_dataDetector;
  _dataDetector_dataDetector = v0;

  if (_dataDetector_dataDetector) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = v1 == 0;
  }
  if (!v3)
  {
    id v4 = [(id)objc_opt_class() logHandle];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)char v5 = 0;
      _os_log_impl(&dword_190D88000, v4, OS_LOG_TYPE_DEFAULT, "Error initializing the data detector.", v5, 2u);
    }
  }
}

+ (id)_URLDataDetector
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__CalConferenceURLDetector__URLDataDetector__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_URLDataDetector_onceToken != -1) {
    dispatch_once(&_URLDataDetector_onceToken, block);
  }
  uint64_t v2 = (void *)_URLDataDetector_dataDetector;

  return v2;
}

void __44__CalConferenceURLDetector__URLDataDetector__block_invoke()
{
  id v6 = 0;
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F28BE8]) initWithTypes:32 error:&v6];
  id v1 = v6;
  uint64_t v2 = (void *)_URLDataDetector_dataDetector;
  _URLDataDetector_dataDetector = v0;

  if (_URLDataDetector_dataDetector) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = v1 == 0;
  }
  if (!v3)
  {
    id v4 = [(id)objc_opt_class() logHandle];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)char v5 = 0;
      _os_log_impl(&dword_190D88000, v4, OS_LOG_TYPE_DEFAULT, "Error initializing the data detector.", v5, 2u);
    }
  }
}

+ (id)_phoneNumberDataDetector
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__CalConferenceURLDetector__phoneNumberDataDetector__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_phoneNumberDataDetector_onceToken != -1) {
    dispatch_once(&_phoneNumberDataDetector_onceToken, block);
  }
  uint64_t v2 = (void *)_phoneNumberDataDetector_dataDetector;

  return v2;
}

void __52__CalConferenceURLDetector__phoneNumberDataDetector__block_invoke()
{
  id v6 = 0;
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F28BE8]) initWithTypes:2048 error:&v6];
  id v1 = v6;
  uint64_t v2 = (void *)_phoneNumberDataDetector_dataDetector;
  _phoneNumberDataDetector_dataDetector = v0;

  if (_phoneNumberDataDetector_dataDetector) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = v1 == 0;
  }
  if (!v3)
  {
    id v4 = [(id)objc_opt_class() logHandle];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)char v5 = 0;
      _os_log_impl(&dword_190D88000, v4, OS_LOG_TYPE_DEFAULT, "Error initializing the data detector.", v5, 2u);
    }
  }
}

+ (id)logHandle
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__CalConferenceURLDetector_logHandle__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (logHandle_onceToken_1 != -1) {
    dispatch_once(&logHandle_onceToken_1, block);
  }
  uint64_t v2 = (void *)logHandle_logHandle_1;

  return v2;
}

void __37__CalConferenceURLDetector_logHandle__block_invoke()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.CalendarFoundation", (const char *)[v3 UTF8String]);
  uint64_t v2 = (void *)logHandle_logHandle_1;
  logHandle_logHandle_1 = (uint64_t)v1;
}

@end