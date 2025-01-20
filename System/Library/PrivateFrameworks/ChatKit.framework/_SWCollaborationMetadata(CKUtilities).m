@interface _SWCollaborationMetadata(CKUtilities)
+ (id)appBundleIDsFromSharingURL:()CKUtilities;
+ (id)contentTypeFromCKShare:()CKUtilities;
+ (uint64_t)_contentTypeIsNotFileType:()CKUtilities;
- (id)updatedCollaborationMetadataAppBundleIDsWithSharingURL:()CKUtilities;
- (id)updatedCollaborationMetadataContentTypeWithCKShare:()CKUtilities;
- (id)updatedCollaborationMetadataWithSharingURL:()CKUtilities ckShare:localIdentifier:collaborationIdentifier:title:defaultShareOptions:creationDate:contentType:ckAppBundleIDs:initiatorHandle:initiatorNameComponents:containerSetupInfo:sourceProcessData:;
- (id)updatedCollaborationMetadataWithUpdatedMetadata:()CKUtilities ckShare:sharingURL:;
- (uint64_t)checkSendReadiness;
- (uint64_t)updatedCollaborationMetadataWithAppBundleIDs:()CKUtilities;
- (uint64_t)updatedCollaborationMetadataWithTitle:()CKUtilities contentType:ckAppBundleIDs:;
- (void)_logSelf;
- (void)checkSendReadiness;
- (void)updateInitiatorName:()CKUtilities email:;
@end

@implementation _SWCollaborationMetadata(CKUtilities)

- (void)_logSelf
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v2 = IMLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = [a1 localIdentifier];
    int v31 = 138412290;
    v32 = v3;
    _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "    localIdentifier: %@", (uint8_t *)&v31, 0xCu);
  }
  v4 = IMLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = [a1 collaborationIdentifier];
    int v31 = 138412290;
    v32 = v5;
    _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "    collaborationIdentifier: %@", (uint8_t *)&v31, 0xCu);
  }
  v6 = IMLogHandleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = [a1 title];
    int v31 = 138412290;
    v32 = v7;
    _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "    title: %@", (uint8_t *)&v31, 0xCu);
  }
  v8 = IMLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = [a1 defaultShareOptions];
    int v31 = 138412290;
    v32 = v9;
    _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "    defaultShareOptions: %@", (uint8_t *)&v31, 0xCu);
  }
  v10 = IMLogHandleForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = [a1 creationDate];
    int v31 = 138412290;
    v32 = v11;
    _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "    creationDate: %@", (uint8_t *)&v31, 0xCu);
  }
  v12 = IMLogHandleForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = [a1 contentType];
    int v31 = 138412290;
    v32 = v13;
    _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "    contentType: %@", (uint8_t *)&v31, 0xCu);
  }
  v14 = IMLogHandleForCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = [a1 ckAppBundleIDs];
    v16 = [v15 componentsJoinedByString:@", "];
    int v31 = 138412290;
    v32 = v16;
    _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "    ckAppBundleIDs: %@", (uint8_t *)&v31, 0xCu);
  }
  v17 = IMLogHandleForCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v18 = [a1 initiatorHandle];
    int v31 = 138412290;
    v32 = v18;
    _os_log_impl(&dword_18EF18000, v17, OS_LOG_TYPE_INFO, "    initiatorHandle: %@", (uint8_t *)&v31, 0xCu);
  }
  v19 = IMLogHandleForCategory();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = [a1 initiatorHandle];
    int v31 = 138412290;
    v32 = v20;
    _os_log_impl(&dword_18EF18000, v19, OS_LOG_TYPE_INFO, "    initiatorNameComponents: %@", (uint8_t *)&v31, 0xCu);
  }
  v21 = IMLogHandleForCategory();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    v22 = [a1 containerSetupInfo];
    int v31 = 138412290;
    v32 = v22;
    _os_log_impl(&dword_18EF18000, v21, OS_LOG_TYPE_INFO, "    containerSetupInfo: %@", (uint8_t *)&v31, 0xCu);
  }
  v23 = IMLogHandleForCategory();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    v24 = [a1 sourceProcessData];
    int v31 = 138412290;
    v32 = v24;
    _os_log_impl(&dword_18EF18000, v23, OS_LOG_TYPE_INFO, "    sourceProcessData: %@", (uint8_t *)&v31, 0xCu);
  }
  v25 = IMLogHandleForCategory();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    v26 = [a1 userSelectedShareOptions];
    int v31 = 138412290;
    v32 = v26;
    _os_log_impl(&dword_18EF18000, v25, OS_LOG_TYPE_INFO, "    userSelectedShareOptions: %@", (uint8_t *)&v31, 0xCu);
  }
  v27 = IMLogHandleForCategory();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    v28 = [a1 defaultOptions];
    int v31 = 138412290;
    v32 = v28;
    _os_log_impl(&dword_18EF18000, v27, OS_LOG_TYPE_INFO, "    defaultOptions: %@", (uint8_t *)&v31, 0xCu);
  }
  v29 = IMLogHandleForCategory();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    v30 = [a1 defaultShareOptions];
    int v31 = 138412290;
    v32 = v30;
    _os_log_impl(&dword_18EF18000, v29, OS_LOG_TYPE_INFO, "    defaultShareOptions: %@", (uint8_t *)&v31, 0xCu);
  }
}

+ (uint64_t)_contentTypeIsNotFileType:()CKUtilities
{
  id v3 = a3;
  if ([v3 conformsToType:*MEMORY[0x1E4F44408]]
    && [v3 conformsToType:*MEMORY[0x1E4F44378]]
    && [v3 conformsToType:*MEMORY[0x1E4F44390]])
  {
    uint64_t v4 = [v3 conformsToType:*MEMORY[0x1E4F444D8]] ^ 1;
  }
  else
  {
    uint64_t v4 = 1;
  }

  return v4;
}

+ (id)contentTypeFromCKShare:()CKUtilities
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v5 = IMLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[_SWCollaborationMetadata(CKUtilities) contentTypeFromCKShare:]();
    }
    goto LABEL_14;
  }
  uint64_t v4 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F19DD0]];
  v5 = v4;
  if (v4 && [v4 length])
  {
    v6 = [MEMORY[0x1E4F442D8] typeWithFilenameExtension:v5];
  }
  else
  {
    v7 = IMLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[_SWCollaborationMetadata(CKUtilities) contentTypeFromCKShare:]();
    }

    v6 = 0;
  }
  if ([a1 _contentTypeIsNotFileType:v6])
  {
    v8 = IMLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412290;
      v11 = v6;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Setting contentType to nil for a non file type. was: %@", (uint8_t *)&v10, 0xCu);
    }

LABEL_14:
    v6 = 0;
  }

  return v6;
}

- (id)updatedCollaborationMetadataContentTypeWithCKShare:()CKUtilities
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(id)objc_opt_class() contentTypeFromCKShare:v4];
    v6 = [a1 updatedCollaborationMetadataWithSharingURL:0 ckShare:v4 localIdentifier:0 collaborationIdentifier:0 title:0 defaultShareOptions:0 creationDate:0 contentType:v5 ckAppBundleIDs:0 initiatorHandle:0 initiatorNameComponents:0 containerSetupInfo:0 sourceProcessData:0];
  }
  else
  {
    v7 = IMLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[_SWCollaborationMetadata(CKUtilities) updatedCollaborationMetadataContentTypeWithCKShare:]();
    }

    v6 = 0;
  }

  return v6;
}

+ (id)appBundleIDsFromSharingURL:()CKUtilities
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F6EA70]);
    v5 = [v4 bundleIDsForShareBearURL:v3];
    v6 = v5;
    if (!v5 || ![v5 count])
    {
      uint64_t v7 = [v4 bundleIDsForCollaborationURL:v3];

      v6 = (void *)v7;
    }
  }
  else
  {
    v8 = IMLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[_SWCollaborationMetadata(CKUtilities) appBundleIDsFromSharingURL:]();
    }

    v6 = 0;
  }

  return v6;
}

- (id)updatedCollaborationMetadataWithSharingURL:()CKUtilities ckShare:localIdentifier:collaborationIdentifier:title:defaultShareOptions:creationDate:contentType:ckAppBundleIDs:initiatorHandle:initiatorNameComponents:containerSetupInfo:sourceProcessData:
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v55 = a3;
  id v56 = a4;
  id v21 = a5;
  id v22 = a6;
  id v23 = a7;
  id v58 = a8;
  id v57 = a9;
  v24 = a1;
  id v25 = a10;
  uint64_t v26 = (uint64_t)v21;
  id v27 = a11;
  id v28 = a12;
  id v29 = a13;
  id v30 = a14;
  id v52 = a15;
  if (v26)
  {
    if (v22) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v26 = [v24 localIdentifier];
    if (v22) {
      goto LABEL_3;
    }
  }
  id v22 = [v24 collaborationIdentifier];
LABEL_3:
  uint64_t v53 = (uint64_t)v29;
  v54 = v22;
  if (v23 && [v23 length]
    || ([v24 title], uint64_t v31 = objc_claimAutoreleasedReturnValue(), v23, (v23 = (id)v31) != 0))
  {
    uint64_t v32 = [v23 length];
    if (v56 && !v32) {
      goto LABEL_8;
    }
  }
  else if (v56)
  {
LABEL_8:
    uint64_t v33 = [v56 objectForKeyedSubscript:*MEMORY[0x1E4F19DC8]];

    id v23 = (id)v33;
  }
  if (!v58)
  {
    id v58 = [v24 defaultShareOptions];
  }
  if (!v57)
  {
    id v57 = [v24 creationDate];
  }
  uint64_t v34 = (uint64_t)v30;
  if (v25)
  {
    BOOL v35 = v55 != 0;
  }
  else
  {
    uint64_t v36 = [v24 contentType];
    id v25 = (id)v36;
    BOOL v35 = v55 != 0;
    if (v55 && !v36)
    {
      id v25 = [(id)objc_opt_class() contentTypeFromCKShare:v56];
      BOOL v35 = 1;
    }
  }
  if (v27 && [v27 count])
  {
    uint64_t v37 = v34;
  }
  else
  {
    uint64_t v38 = [v24 ckAppBundleIDs];

    char v39 = !v35;
    if (v38) {
      char v39 = 1;
    }
    id v27 = (id)v38;
    uint64_t v37 = v34;
    if ((v39 & 1) == 0)
    {
      id v27 = [(id)objc_opt_class() appBundleIDsFromSharingURL:v55];
    }
  }
  if (!v28 || ![v28 length])
  {
    uint64_t v40 = [v24 initiatorHandle];

    id v28 = (id)v40;
  }
  uint64_t v41 = v53;
  if (v53)
  {
    if (v37) {
      goto LABEL_32;
    }
  }
  else
  {
    uint64_t v41 = [v24 initiatorNameComponents];
    if (v37) {
      goto LABEL_32;
    }
  }
  uint64_t v37 = [v24 containerSetupInfo];
LABEL_32:
  uint64_t v42 = (uint64_t)v52;
  if (!v52)
  {
    uint64_t v42 = [v24 sourceProcessData];
  }
  v43 = (void *)v42;
  uint64_t v50 = v37;
  uint64_t v51 = v42;
  v44 = (void *)v37;
  v45 = (void *)v41;
  v46 = (void *)v26;
  v47 = (void *)[objc_alloc(MEMORY[0x1E4F3BDE0]) initWithLocalIdentifier:v26 collaborationIdentifier:v54 title:v23 defaultShareOptions:v58 creationDate:v57 contentType:v25 ckAppBundleIDs:v27 initiatorHandle:v28 initiatorNameComponents:v41 containerSetupInfo:v50 sourceProcessData:v51];
  v48 = IMLogHandleForCategory();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v60 = v55;
    _os_log_impl(&dword_18EF18000, v48, OS_LOG_TYPE_INFO, "Updating collaboration metadata for sharing url %@:", buf, 0xCu);
  }

  [v47 _logSelf];

  return v47;
}

- (id)updatedCollaborationMetadataWithUpdatedMetadata:()CKUtilities ckShare:sharingURL:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    id v25 = [v8 localIdentifier];
    id v23 = [v8 collaborationIdentifier];
    id v22 = [v8 title];
    id v21 = [v8 defaultShareOptions];
    v20 = [v8 creationDate];
    v19 = [v8 contentType];
    v18 = [v8 ckAppBundleIDs];
    v11 = [v8 initiatorHandle];
    uint64_t v12 = [v8 initiatorNameComponents];
    v13 = [v8 containerSetupInfo];
    v14 = [v8 sourceProcessData];
    uint64_t v24 = [a1 updatedCollaborationMetadataWithSharingURL:v10 ckShare:v9 localIdentifier:v25 collaborationIdentifier:v23 title:v22 defaultShareOptions:v21 creationDate:v20 contentType:v19 ckAppBundleIDs:v18 initiatorHandle:v11 initiatorNameComponents:v12 containerSetupInfo:v13 sourceProcessData:v14];

    id v15 = (id)v24;
  }
  else
  {
    v16 = IMLogHandleForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[_SWCollaborationMetadata(CKUtilities) updatedCollaborationMetadataWithUpdatedMetadata:ckShare:sharingURL:]();
    }

    id v15 = a1;
  }

  return v15;
}

- (id)updatedCollaborationMetadataAppBundleIDsWithSharingURL:()CKUtilities
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() appBundleIDsFromSharingURL:v4];
  v6 = v5;
  if (v5 && [v5 count])
  {
    uint64_t v7 = [a1 updatedCollaborationMetadataWithAppBundleIDs:v6];
  }
  else
  {
    id v8 = IMLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[_SWCollaborationMetadata(CKUtilities) updatedCollaborationMetadataAppBundleIDsWithSharingURL:]((uint64_t)v4, v8);
    }

    uint64_t v7 = 0;
  }

  return v7;
}

- (void)updateInitiatorName:()CKUtilities email:
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7 && [v7 length]) {
    [a1 setInitiatorHandle:v8];
  }
  if (v6 && [v6 length])
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F28F38]);
    id v10 = [v9 personNameComponentsFromString:v6];
    [a1 setInitiatorNameComponents:v10];
  }
  v11 = IMLogHandleForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = [a1 initiatorHandle];
    v13 = [a1 initiatorNameComponents];
    int v14 = 138412546;
    id v15 = v12;
    __int16 v16 = 2112;
    v17 = v13;
    _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Updated initiator name: %@, components: %@", (uint8_t *)&v14, 0x16u);
  }
}

- (uint64_t)updatedCollaborationMetadataWithAppBundleIDs:()CKUtilities
{
  return [a1 updatedCollaborationMetadataWithSharingURL:0 ckShare:0 localIdentifier:0 collaborationIdentifier:0 title:0 defaultShareOptions:0 creationDate:0 contentType:0 ckAppBundleIDs:a3 initiatorHandle:0 initiatorNameComponents:0 containerSetupInfo:0 sourceProcessData:0];
}

- (uint64_t)updatedCollaborationMetadataWithTitle:()CKUtilities contentType:ckAppBundleIDs:
{
  return [a1 updatedCollaborationMetadataWithSharingURL:0 ckShare:0 localIdentifier:0 collaborationIdentifier:0 title:a3 defaultShareOptions:0 creationDate:0 contentType:a4 ckAppBundleIDs:a5 initiatorHandle:0 initiatorNameComponents:0 containerSetupInfo:0 sourceProcessData:0];
}

- (uint64_t)checkSendReadiness
{
  v2 = [a1 collaborationIdentifier];
  BOOL v3 = v2 != 0;

  if (!v2)
  {
    id v4 = IMLogHandleForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[_SWCollaborationMetadata(CKUtilities) checkSendReadiness].cold.8();
    }
  }
  v5 = [a1 localIdentifier];

  if (!v5)
  {
    id v6 = IMLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[_SWCollaborationMetadata(CKUtilities) checkSendReadiness].cold.7();
    }

    BOOL v3 = 0;
  }
  uint64_t v7 = [a1 title];
  if (!v7
    || (id v8 = (void *)v7,
        [a1 title],
        id v9 = objc_claimAutoreleasedReturnValue(),
        uint64_t v10 = [v9 length],
        v9,
        v8,
        !v10))
  {
    v11 = IMLogHandleForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[_SWCollaborationMetadata(CKUtilities) checkSendReadiness].cold.6();
    }

    BOOL v3 = 0;
  }
  uint64_t v12 = [a1 defaultShareOptions];

  if (!v12)
  {
    v13 = IMLogHandleForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[_SWCollaborationMetadata(CKUtilities) checkSendReadiness].cold.5();
    }

    BOOL v3 = 0;
  }
  uint64_t v14 = [a1 ckAppBundleIDs];
  if (!v14
    || (id v15 = (void *)v14,
        [a1 ckAppBundleIDs],
        __int16 v16 = objc_claimAutoreleasedReturnValue(),
        uint64_t v17 = [v16 count],
        v16,
        v15,
        !v17))
  {
    uint64_t v18 = IMLogHandleForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[_SWCollaborationMetadata(CKUtilities) checkSendReadiness].cold.4();
    }

    BOOL v3 = 0;
  }
  uint64_t v19 = [a1 initiatorHandle];
  if (!v19
    || (v20 = (void *)v19,
        [a1 initiatorHandle],
        id v21 = objc_claimAutoreleasedReturnValue(),
        uint64_t v22 = [v21 length],
        v21,
        v20,
        !v22))
  {
    id v23 = IMLogHandleForCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[_SWCollaborationMetadata(CKUtilities) checkSendReadiness]();
    }

    BOOL v3 = 0;
  }
  uint64_t v24 = [a1 initiatorNameComponents];

  if (v24)
  {
    if (v3)
    {
      id v25 = IMLogHandleForCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v28 = 0;
        _os_log_impl(&dword_18EF18000, v25, OS_LOG_TYPE_INFO, "CollaborationMetadata is ready to send:", v28, 2u);
      }
      goto LABEL_37;
    }
  }
  else
  {
    uint64_t v26 = IMLogHandleForCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[_SWCollaborationMetadata(CKUtilities) checkSendReadiness]();
    }
  }
  id v25 = IMLogHandleForCategory();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
    -[_SWCollaborationMetadata(CKUtilities) checkSendReadiness]();
  }
LABEL_37:

  return [a1 _logSelf];
}

+ (void)contentTypeFromCKShare:()CKUtilities .cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "contentTypeFromCKShare", v2, v3, v4, v5, v6);
}

+ (void)contentTypeFromCKShare:()CKUtilities .cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "typeIndentifier is nil", v2, v3, v4, v5, v6);
}

- (void)updatedCollaborationMetadataContentTypeWithCKShare:()CKUtilities .cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "share cannot be nil in updatedCollaborationMetadataContentTypeWithCKShare", v2, v3, v4, v5, v6);
}

+ (void)appBundleIDsFromSharingURL:()CKUtilities .cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "sharingURL cannot be nil in appBundleIDsFromSharingURL", v2, v3, v4, v5, v6);
}

- (void)updatedCollaborationMetadataWithUpdatedMetadata:()CKUtilities ckShare:sharingURL:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Passed in nil updated CollaborationMetadata", v2, v3, v4, v5, v6);
}

- (void)updatedCollaborationMetadataAppBundleIDsWithSharingURL:()CKUtilities .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18EF18000, a2, OS_LOG_TYPE_ERROR, "no bundle ids found for sharing URL: %@", (uint8_t *)&v2, 0xCu);
}

- (void)checkSendReadiness
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "CollaborationMetadata is missing collaborationIdentifier", v2, v3, v4, v5, v6);
}

@end