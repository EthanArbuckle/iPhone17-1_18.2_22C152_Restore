@interface NSURL(LPInternal)
- (BOOL)_lp_isFaceTimeInviteURL;
- (BOOL)_lp_isNewsPuzzleURL;
- (BOOL)_lp_isNewsSportsEventURL;
- (id)_lp_components;
- (id)_lp_componentsNoCopy;
- (id)_lp_faceTimeInviteLink;
- (id)_lp_faceTimeInviteTitle;
- (id)_lp_pathComponentAtIndex:()LPInternal;
- (id)_lp_requestWithAttribution:()LPInternal;
- (id)_lp_valueForQueryKey:()LPInternal;
- (uint64_t)_lp_fileSize;
- (uint64_t)_lp_formattedTelephoneNumber;
- (uint64_t)_lp_hasAllowedNonHTTPSchemeForMetadataDecoding;
- (uint64_t)_lp_hasWalletRelatedScheme;
- (uint64_t)_lp_isTelephoneURL;
- (void)_lp_fileSize;
@end

@implementation NSURL(LPInternal)

- (BOOL)_lp_isNewsPuzzleURL
{
  if ([a1 isFileURL]) {
    return 0;
  }
  NewsCoreLibrary();
  return (unint64_t)(objc_msgSend(a1, "fc_newsURLType") - 5) < 2;
}

- (BOOL)_lp_isNewsSportsEventURL
{
  if ([a1 isFileURL]) {
    return 0;
  }
  NewsCoreLibrary();
  return objc_msgSend(a1, "fc_newsURLType") == 4;
}

- (uint64_t)_lp_isTelephoneURL
{
  if (objc_msgSend(a1, "_lp_isHTTPFamilyURL") & 1) != 0 || (objc_msgSend(a1, "isFileURL")) {
    return 0;
  }
  TelephonyUtilitiesLibrary();

  return [a1 isTelephonyURL];
}

- (uint64_t)_lp_formattedTelephoneNumber
{
  TelephonyUtilitiesLibrary();

  return [a1 formattedPhoneNumber];
}

- (id)_lp_faceTimeInviteLink
{
  if (objc_msgSend(a1, "_lp_isHTTPFamilyURL") && (objc_msgSend(a1, "isFileURL") & 1) == 0)
  {
    TelephonyUtilitiesLibrary();
    uint64_t v7 = 0;
    v8 = &v7;
    uint64_t v9 = 0x2050000000;
    v3 = (void *)getTUConversationLinkClass(void)::softClass;
    uint64_t v10 = getTUConversationLinkClass(void)::softClass;
    if (!getTUConversationLinkClass(void)::softClass)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = ___ZL26getTUConversationLinkClassv_block_invoke;
      v6[3] = &unk_1E5B04EB8;
      v6[4] = &v7;
      ___ZL26getTUConversationLinkClassv_block_invoke((uint64_t)v6);
      v3 = (void *)v8[3];
    }
    id v4 = v3;
    _Block_object_dispose(&v7, 8);
    v2 = [v4 conversationLinkForURL:a1];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (BOOL)_lp_isFaceTimeInviteURL
{
  v1 = objc_msgSend(a1, "_lp_faceTimeInviteLink");
  BOOL v2 = v1 != 0;

  return v2;
}

- (id)_lp_faceTimeInviteTitle
{
  v1 = objc_msgSend(a1, "_lp_faceTimeInviteLink");
  BOOL v2 = [v1 linkName];

  return v2;
}

- (id)_lp_components
{
  v1 = objc_msgSend(a1, "_lp_componentsNoCopy");
  BOOL v2 = (void *)[v1 copy];

  return v2;
}

- (id)_lp_componentsNoCopy
{
  id v4 = objc_getAssociatedObject(a1, a2);
  if (!v4)
  {
    id v4 = [MEMORY[0x1E4F29088] componentsWithURL:a1 resolvingAgainstBaseURL:0];
    objc_setAssociatedObject(a1, a2, v4, (void *)1);
  }

  return v4;
}

- (id)_lp_pathComponentAtIndex:()LPInternal
{
  id v4 = [a1 pathComponents];
  if ([v4 count] <= a3)
  {
    v5 = 0;
  }
  else
  {
    v5 = [v4 objectAtIndexedSubscript:a3];
  }

  return v5;
}

- (id)_lp_valueForQueryKey:()LPInternal
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_msgSend(a1, "_lp_componentsNoCopy");
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v6 = objc_msgSend(v5, "queryItems", 0);
  uint64_t v7 = (void *)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v11 = [v10 name];
        int v12 = objc_msgSend(v11, "_lp_isEqualIgnoringCase:", v4);

        if (v12)
        {
          uint64_t v7 = [v10 value];
          goto LABEL_11;
        }
      }
      uint64_t v7 = (void *)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (uint64_t)_lp_hasWalletRelatedScheme
{
  v1 = [a1 scheme];
  uint64_t v2 = objc_msgSend(v1, "_lp_isEqualToAnyIgnoringCase:", &unk_1EF712A08);

  return v2;
}

- (uint64_t)_lp_hasAllowedNonHTTPSchemeForMetadataDecoding
{
  if (objc_msgSend(a1, "_lp_hasAllowedNonHTTPScheme")) {
    return 1;
  }
  v3 = [a1 scheme];
  uint64_t v2 = objc_msgSend(v3, "_lp_isEqualIgnoringCase:", @"tel");

  return v2;
}

- (id)_lp_requestWithAttribution:()LPInternal
{
  id v4 = [MEMORY[0x1E4F18D50] requestWithURL:a1];
  [v4 setAttribution:a3];

  return v4;
}

- (uint64_t)_lp_fileSize
{
  uint64_t v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  v3 = [a1 path];
  id v9 = 0;
  id v4 = [v2 attributesOfItemAtPath:v3 error:&v9];
  id v5 = v9;
  uint64_t v6 = [v4 fileSize];

  if (v5)
  {
    uint64_t v7 = LPLogChannelFilesystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      [(NSURL(LPInternal) *)(uint64_t)v5 _lp_fileSize];
    }
  }

  return v6;
}

- (void)_lp_fileSize
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A35DC000, a2, OS_LOG_TYPE_ERROR, "Failed to read size of file: %@", (uint8_t *)&v2, 0xCu);
}

@end