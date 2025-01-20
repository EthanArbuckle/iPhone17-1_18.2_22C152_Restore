@interface IMIDSUtilities
+ (int)verifyFromID:(id)a3 comesFromAccount:(id)a4;
+ (void)findCommonCapabilitiesAcrossRecipients:(id)a3 serviceName:(id)a4 capsToCheck:(id)a5 completion:(id)a6;
@end

@implementation IMIDSUtilities

+ (int)verifyFromID:(id)a3 comesFromAccount:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v17 = 0;
  v5 = (void *)[a3 _stripPotentialTokenURIWithToken:&v17];
  if (![v5 length] || !objc_msgSend(v17, "length")) {
    return 128;
  }
  if (objc_msgSend((id)objc_msgSend(a4, "vettedAliases"), "indexOfObject:", objc_msgSend(v5, "_stripFZIDPrefix")) == 0x7FFFFFFFFFFFFFFFLL) {
    return 1;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v7 = objc_msgSend(a4, "devices", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (!v8) {
    return 2;
  }
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)v14;
  while (2)
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v14 != v10) {
        objc_enumerationMutation(v7);
      }
      v12 = (void *)[*(id *)(*((void *)&v13 + 1) + 8 * i) pushToken];
      if ([v12 isEqualToData:v17]) {
        return 0;
      }
    }
    uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
    int result = 2;
    if (v9) {
      continue;
    }
    break;
  }
  return result;
}

+ (void)findCommonCapabilitiesAcrossRecipients:(id)a3 serviceName:(id)a4 capsToCheck:(id)a5 completion:(id)a6
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a6)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218242;
        uint64_t v14 = [a3 count];
        __int16 v15 = 2112;
        id v16 = a5;
        _os_log_impl(&dword_1A0772000, v10, OS_LOG_TYPE_INFO, "FindCommonCaps: Looking across %lu recips for common caps: %@", buf, 0x16u);
      }
    }
    uint64_t v11 = [a5 count];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = sub_1A07E5F30;
    v12[3] = &unk_1E5A11E88;
    v12[5] = a6;
    v12[6] = v11;
    v12[4] = a5;
    if (!+[IMIDSIDQueryController currentRemoteDevicesForDestinations:a3 service:a4 listenerID:@"IMIDSUtilities" queue:MEMORY[0x1E4F14428] completionBlock:v12])(*((void (**)(id, void))a6 + 2))(a6, 0); {
  }
    }
}

@end