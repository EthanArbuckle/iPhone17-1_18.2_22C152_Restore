@interface IMSharedMessage3rdPartySummary
+ (id)_appNameSummary:(id)a3;
+ (id)_displayNameWithID:(id)a3;
+ (id)_handleIdentifierRegex;
+ (id)_handleIdentifiers:(id)a3;
+ (id)_idForHandleIdentifier:(id)a3;
+ (id)_individualPreviewSummary:(id)a3;
+ (id)_replaceHandleWithContactNameInString:(id)a3;
+ (id)pluginPath;
+ (id)previewSummaryWithPluginPayload:(id)a3;
@end

@implementation IMSharedMessage3rdPartySummary

+ (id)pluginPath
{
  return @"/System/Library/Messages/iMessageBalloons/MSMessageExtensionBalloonPlugin.bundle";
}

+ (id)previewSummaryWithPluginPayload:(id)a3
{
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___IMSharedMessage3rdPartySummary;
  id v5 = objc_msgSendSuper2(&v12, sel_previewSummaryWithPluginPayload_);
  uint64_t v6 = [a3 data];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v11 = 0;
    if (objc_opt_respondsToSelector()) {
      uint64_t v8 = [MEMORY[0x1E4F28DC0] _strictlyUnarchivedObjectOfClasses:IMExtensionPayloadUnarchivingClasses() fromData:v7 error:&v11];
    }
    else {
      uint64_t v8 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:IMExtensionPayloadUnarchivingClasses() fromData:v7 error:&v11];
    }
    uint64_t v9 = v8;
    if (v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v5 = (id)[a1 _individualPreviewSummary:v9];
        if (!v5) {
          return (id)[a1 _appNameSummary:v9];
        }
      }
    }
  }
  return v5;
}

+ (id)_individualPreviewSummary:(id)a3
{
  v3 = objc_msgSend(a1, "_replaceHandleWithContactNameInString:", objc_msgSend(a3, "objectForKeyedSubscript:", @"ldtext"));
  uint64_t v4 = objc_msgSend((id)objc_msgSend(v3, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E4F28B88], "whitespaceAndNewlineCharacterSet")), "length");
  uint64_t v5 = [v3 length];
  if (v4) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6) {
    return 0;
  }
  else {
    return v3;
  }
}

+ (id)_replaceHandleWithContactNameInString:(id)a3
{
  id v3 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v5 = (void *)[a1 _handleIdentifiers:a3];
    id v3 = (id)[MEMORY[0x1E4F28E78] stringWithString:v3];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v17 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          v10 = (void *)[a1 _idForHandleIdentifier:v9];
          uint64_t v11 = (__CFString *)[a1 _displayNameWithID:v10];
          if (![(__CFString *)v11 length]
            && ([v10 isEqualToString:@"kIMTranscriptPluginBreadcrumbTextSenderIdentifier"] & 1) == 0
            && ([v10 isEqualToString:@"kIMTranscriptPluginBreadcrumbTextReceiverIdentifier"] & 1) == 0)
          {
            uint64_t v11 = (__CFString *)[v10 _stripFZIDPrefix];
          }
          uint64_t v12 = [(__CFString *)v11 length];
          uint64_t v13 = [v3 length];
          if (v12) {
            v14 = v11;
          }
          else {
            v14 = &stru_1EF2CAD28;
          }
          objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", v9, v14, 0, 0, v13);
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v6);
    }
  }
  return v3;
}

+ (id)_displayNameWithID:(id)a3
{
  [+[IMContactStore sharedInstance] fetchCNContactForHandleWithID:a3];

  return (id)MEMORY[0x1F4181798](IMContactStore, sel_displayNameForContact_);
}

+ (id)_handleIdentifiers:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend((id)objc_msgSend(a1, "_handleIdentifierRegex"), "matchesInString:options:range:", a3, 0, 0, objc_msgSend(a3, "length"));
  uint64_t v5 = (void *)[MEMORY[0x1E4F1CA80] set];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = [*(id *)(*((void *)&v13 + 1) + 8 * v9) range];
        objc_msgSend(v5, "addObject:", objc_msgSend(a3, "substringWithRange:", v10, v11));
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
  return v5;
}

+ (id)_handleIdentifierRegex
{
  return (id)objc_msgSend(MEMORY[0x1E4F28FD8], "regularExpressionWithPattern:options:error:", @"\\$\\(([^\\$]|\\$[^\\(])*?\\)"), 0, 0;
}

+ (id)_idForHandleIdentifier:(id)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend(a1, "_handleIdentifierRegex"), "firstMatchInString:options:range:", a3, 0, 0, objc_msgSend(a3, "length"));
  if (!v4 || [v4 range] || v5 != objc_msgSend(a3, "length")) {
    return 0;
  }
  uint64_t v6 = [a3 length] - 3;

  return (id)objc_msgSend(a3, "substringWithRange:", 2, v6);
}

+ (id)_appNameSummary:(id)a3
{
  id v3 = (void *)[a3 objectForKey:@"an"];
  if (v3 && (uint64_t v4 = v3, ([v3 isEqualToString:&stru_1EF2CAD28] & 1) == 0)) {
    return (id)[NSString localizedStringWithFormat:objc_msgSend((id)IMSharedUtilitiesFrameworkBundle(), "localizedStringForKey:value:table:", @"1 %@ Message", &stru_1EF2CAD28, @"IMSharedUtilities", v4];
  }
  else {
    return 0;
  }
}

@end