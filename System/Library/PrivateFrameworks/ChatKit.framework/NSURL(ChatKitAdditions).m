@interface NSURL(ChatKitAdditions)
+ (id)ckSMSURLFromBusinessChatURL:()ChatKitAdditions;
+ (id)ckURLForResource:()ChatKitAdditions withExtension:;
+ (uint64_t)ckURLForChatIdentifier:()ChatKitAdditions entryBody:;
- (id)ckCollaborationSceneIdentifier;
- (id)ckCollaborationShareOptions;
- (id)ckFaceTimeConversationUUID;
- (id)ckLaunchURLBalloonPluginBundleID;
- (id)ckLaunchURLBalloonPluginPayload;
- (id)ckLaunchURLPostComposeDismissal;
- (id)ckLaunchURLPresentContentForMessageGUID;
- (id)ckSuggestedReplies;
- (id)ckURLByPercentEncodingFragment;
- (uint64_t)ckAllowRetargeting;
- (uint64_t)ckIsLaunchAppURL;
- (uint64_t)ckIsSMSPrivateURLScheme;
- (uint64_t)ckIsUnitTestingURL;
- (uint64_t)ckShouldInitiateCollaborationWithSend;
- (uint64_t)ckShouldShowComposeUI;
- (uint64_t)ckShouldShowDigitalTouchCanvas;
@end

@implementation NSURL(ChatKitAdditions)

+ (id)ckURLForResource:()ChatKitAdditions withExtension:
{
  id v5 = a4;
  id v6 = a3;
  v7 = CKFrameworkBundle();
  v8 = [v7 URLForResource:v6 withExtension:v5];

  return v8;
}

+ (uint64_t)ckURLForChatIdentifier:()ChatKitAdditions entryBody:
{
  return objc_msgSend(MEMORY[0x1E4F1CB10], "__im_URLForChatIdentifier:entryBody:");
}

+ (id)ckSMSURLFromBusinessChatURL:()ChatKitAdditions
{
  id v3 = a3;
  v4 = [v3 host];
  int v5 = [v4 isEqualToIgnoringCase:@"bcrw.apple.com"];

  if (v5)
  {
    id v6 = [v3 pathComponents];
    if ((unint64_t)[v6 count] >= 2)
    {
      v8 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:v3 resolvingAgainstBaseURL:1];
      if (v8)
      {
        v9 = [MEMORY[0x1E4F1CA48] array];
        v10 = [MEMORY[0x1E4F29088] componentsWithString:@"sms://open"];
        v11 = [MEMORY[0x1E4F290C8] queryItemWithName:@"service" value:*MEMORY[0x1E4F6E1B0]];
        [v9 addObject:v11];
        v12 = [v6 objectAtIndexedSubscript:1];
        v13 = [MEMORY[0x1E4F290C8] queryItemWithName:@"recipient" value:v12];
        [v9 addObject:v13];
        v14 = [v8 queryItems];
        [v9 addObjectsFromArray:v14];

        [v10 setQueryItems:v9];
        v7 = [v10 URL];
      }
      else
      {
        v7 = 0;
      }
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (uint64_t)ckShouldShowComposeUI
{
  v1 = [a1 absoluteString];
  uint64_t v2 = [v1 containsString:@"compose=false"] ^ 1;

  return v2;
}

- (uint64_t)ckShouldInitiateCollaborationWithSend
{
  v1 = [a1 absoluteString];
  uint64_t v2 = [v1 containsString:@"collaboration-initiate-send=true"];

  return v2;
}

- (id)ckCollaborationSceneIdentifier
{
  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
  id v3 = [a1 absoluteString];
  id v4 = (id)ExtractURLQueries();

  int v5 = [v2 objectForKey:@"collaboration-scene-identifier"];

  return v5;
}

- (id)ckCollaborationShareOptions
{
  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
  id v3 = [a1 absoluteString];
  id v4 = (id)ExtractURLQueries();

  int v5 = [v2 objectForKey:@"collaboration-share-options"];
  if (v5)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v5 options:0];
    if (v6)
    {
      uint64_t v11 = 0;
      v7 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:&v11];
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v12 = 0;
          _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Failed to convert data for Collaboration Share Options", v12, 2u);
        }
      }
      v7 = 0;
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "No query object found for Collaboration Share Options", buf, 2u);
      }
    }
    v7 = 0;
  }

  return v7;
}

- (id)ckURLByPercentEncodingFragment
{
  uint64_t v2 = [MEMORY[0x1E4F28B88] URLFragmentAllowedCharacterSet];
  id v3 = (void *)[v2 mutableCopy];

  [v3 removeCharactersInString:@"!"];
  id v4 = [MEMORY[0x1E4F29088] componentsWithURL:a1 resolvingAgainstBaseURL:0];
  int v5 = [v4 fragment];
  id v6 = [v5 stringByAddingPercentEncodingWithAllowedCharacters:v3];
  [v4 setFragment:v6];

  v7 = [v4 URL];

  return v7;
}

- (id)ckFaceTimeConversationUUID
{
  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
  id v3 = [a1 absoluteString];
  id v4 = (id)ExtractURLQueries();

  int v5 = [v2 objectForKey:@"facetime-conversation"];
  if (v5) {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v5];
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (uint64_t)ckShouldShowDigitalTouchCanvas
{
  v1 = [a1 absoluteString];
  uint64_t v2 = [v1 containsString:@"dt-canvas=true"];

  return v2;
}

- (uint64_t)ckIsSMSPrivateURLScheme
{
  v1 = [a1 scheme];
  uint64_t v2 = [v1 lowercaseString];
  uint64_t v3 = [v2 isEqualToString:@"sms-private"];

  return v3;
}

- (id)ckLaunchURLBalloonPluginBundleID
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([a1 ckIsSMSPrivateURLScheme])
  {
    uint64_t v2 = (void *)MEMORY[0x1E4F29088];
    uint64_t v3 = [a1 absoluteString];
    id v4 = [v2 componentsWithString:v3];

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    int v5 = objc_msgSend(v4, "queryItems", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          uint64_t v11 = [v10 name];
          char v12 = [v11 isEqualToString:@"appBundleID"];

          if (v12)
          {
            v13 = [v10 value];
            goto LABEL_13;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    v13 = 0;
LABEL_13:
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)ckLaunchURLBalloonPluginPayload
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ([a1 ckIsSMSPrivateURLScheme])
  {
    uint64_t v2 = (void *)MEMORY[0x1E4F29088];
    uint64_t v3 = [a1 absoluteString];
    id v4 = [v2 componentsWithString:v3];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    int v5 = [v4 queryItems];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      long long v17 = v4;
      uint64_t v8 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          uint64_t v11 = [v10 name];
          int v12 = [v11 isEqualToString:@"appPayload"];

          if (v12)
          {
            v13 = [v10 value];
            v14 = [v13 dataUsingEncoding:4];
            long long v15 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v14 options:0 error:0];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {

              goto LABEL_15;
            }
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v7) {
          continue;
        }
        break;
      }
      long long v15 = 0;
LABEL_15:
      id v4 = v17;
    }
    else
    {
      long long v15 = 0;
    }
  }
  else
  {
    long long v15 = 0;
  }

  return v15;
}

- (uint64_t)ckAllowRetargeting
{
  v1 = [a1 absoluteString];
  uint64_t v2 = [v1 containsString:@"allowRetargeting=true"];

  return v2;
}

- (uint64_t)ckIsLaunchAppURL
{
  v1 = [a1 absoluteString];
  uint64_t v2 = [v1 containsString:@"app?"];

  return v2;
}

- (uint64_t)ckIsUnitTestingURL
{
  uint64_t v2 = [MEMORY[0x1E4F6C360] sharedInstance];
  int v3 = [v2 isInternalInstall];

  if (v3)
  {
    id v4 = [a1 scheme];
    int v5 = [v4 lowercaseString];
    if ([v5 isEqualToString:@"sms"])
    {
LABEL_5:

LABEL_6:
      uint64_t v8 = [a1 absoluteString];
      uint64_t v9 = [v8 containsString:@"runUnitTest?"];

      return v9;
    }
    uint64_t v6 = [a1 scheme];
    uint64_t v7 = [v6 lowercaseString];
    if ([v7 isEqualToString:@"sms-private"])
    {

      goto LABEL_5;
    }
    uint64_t v11 = [a1 scheme];
    int v12 = [v11 lowercaseString];
    char v13 = [v12 isEqualToString:@"imessage"];

    if (v13) {
      goto LABEL_6;
    }
  }
  return 0;
}

- (id)ckLaunchURLPostComposeDismissal
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v1 = (void *)MEMORY[0x1E4F29088];
  uint64_t v2 = [a1 absoluteString];
  int v3 = [v1 componentsWithString:v2];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = objc_msgSend(v3, "queryItems", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v10 = [v9 name];
        char v11 = [v10 isEqualToString:@"launchURLPostComposeDismiss"];

        if (v11)
        {
          int v12 = [v9 value];
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  int v12 = 0;
LABEL_11:

  return v12;
}

- (id)ckSuggestedReplies
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v14 = [MEMORY[0x1E4F29088] componentsWithURL:a1 resolvingAgainstBaseURL:0];
  v1 = [v14 queryItems];
  uint64_t v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v1, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v9 = [v8 name];
        int v10 = [v9 isEqualToString:@"reply"];

        if (v10)
        {
          char v11 = [v8 value];
          if ([v11 length])
          {
            int v12 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v11];
            [v2 addObject:v12];
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }

  return v2;
}

- (id)ckLaunchURLPresentContentForMessageGUID
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v1 = (void *)MEMORY[0x1E4F29088];
  uint64_t v2 = [a1 absoluteString];
  id v3 = [v1 componentsWithString:v2];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = objc_msgSend(v3, "queryItems", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        int v10 = [v9 name];
        char v11 = [v10 isEqualToString:@"presentContentForMessage"];

        if (v11)
        {
          int v12 = [v9 value];
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  int v12 = 0;
LABEL_11:

  return v12;
}

@end