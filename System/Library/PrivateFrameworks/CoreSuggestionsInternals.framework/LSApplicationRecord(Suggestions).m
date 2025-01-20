@interface LSApplicationRecord(Suggestions)
+ (id)sg_applicationRecordForDefaultWebBrowser;
+ (id)sg_preferredApplicationRecordForURL:()Suggestions;
+ (id)sg_preferredApplicationRecordForUserActivityType:()Suggestions withTeamIdentifier:preferredBundleIdentifier:;
- (uint64_t)sg_isAppleBundleIdentifier;
@end

@implementation LSApplicationRecord(Suggestions)

- (uint64_t)sg_isAppleBundleIdentifier
{
  v1 = [a1 bundleIdentifier];
  uint64_t v2 = [v1 hasPrefix:@"com.apple."];

  return v2;
}

+ (id)sg_applicationRecordForDefaultWebBrowser
{
  v4 = [MEMORY[0x1E4F1CB10] URLWithString:@"http://"];
  if (!v4)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:a1 file:@"LSApplicationRecord+Suggestions.m" lineNumber:112 description:@"HTTP URL should always construct"];
  }
  uint64_t v10 = 0;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F22408]) initWithURL:v4 error:&v10];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 bundleRecord];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_7;
    }
  }
  v7 = 0;
LABEL_7:

  return v7;
}

+ (id)sg_preferredApplicationRecordForURL:()Suggestions
{
  id v3 = a3;
  id v11 = 0;
  v4 = [MEMORY[0x1E4F22398] appLinksWithURL:v3 limit:1 includeLinksForCurrentApplication:1 error:&v11];
  id v5 = v11;
  if ([v4 count])
  {
    v6 = [v4 firstObject];
    v7 = [v6 targetApplicationRecord];
    goto LABEL_8;
  }
  id v10 = v5;
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F22408]) initWithURL:v3 error:&v10];
  id v8 = v10;

  if (!v6) {
    goto LABEL_6;
  }
  v7 = [v6 bundleRecord];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_6:
    v7 = 0;
  }
  id v5 = v8;
LABEL_8:

  return v7;
}

+ (id)sg_preferredApplicationRecordForUserActivityType:()Suggestions withTeamIdentifier:preferredBundleIdentifier:
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v9 hasPrefix:@"com.apple."])
  {
    id v10 = (id)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v9 allowPlaceholder:0 error:0];
  }
  else if (v8)
  {
    id v11 = (void *)_LSCopyAdvertisementStringForTeamIdentifierAndActivityType();
    if (v11)
    {
      id v55 = 0;
      v12 = [MEMORY[0x1E4F223C8] applicationRecordsForUserActivityType:v11 limit:5 error:&v55];
      id v13 = v55;
      v53[0] = MEMORY[0x1E4F143A8];
      v53[1] = 3221225472;
      v53[2] = __130__LSApplicationRecord_Suggestions__sg_preferredApplicationRecordForUserActivityType_withTeamIdentifier_preferredBundleIdentifier___block_invoke;
      v53[3] = &unk_1E65B7AE8;
      id v14 = v8;
      id v54 = v14;
      v15 = objc_msgSend(v12, "_pas_filteredArrayWithTest:", v53);
      v16 = sgEventsLogHandle();
      id v44 = v13;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = [v12 count];
        uint64_t v18 = [v15 count];
        *(_DWORD *)buf = 134219010;
        uint64_t v59 = v17;
        __int16 v60 = 2048;
        uint64_t v61 = v18;
        __int16 v62 = 2112;
        id v63 = v14;
        __int16 v64 = 2112;
        v65 = v12;
        __int16 v66 = 2112;
        v67 = v15;
        _os_log_impl(&dword_1CA650000, v16, OS_LOG_TYPE_DEFAULT, "Filtered event records from %tu to %tu filtering for teamIdentifier %@: %@ -> %@", buf, 0x34u);
      }

      if ([v15 count] == 1
        && ([v15 firstObject],
            v19 = objc_claimAutoreleasedReturnValue(),
            [v19 applicationState],
            v20 = objc_claimAutoreleasedReturnValue(),
            int v21 = [v20 isInstalled],
            v20,
            v19,
            v21))
      {
        id v10 = [v15 firstObject];
      }
      else if ([v15 count])
      {
        v43 = v15;
        if (v9)
        {
          v41 = v12;
          v42 = v11;
          id v40 = v7;
          long long v51 = 0u;
          long long v52 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          id v22 = v15;
          uint64_t v23 = [v22 countByEnumeratingWithState:&v49 objects:v57 count:16];
          if (v23)
          {
            uint64_t v24 = v23;
            uint64_t v25 = *(void *)v50;
            do
            {
              for (uint64_t i = 0; i != v24; ++i)
              {
                if (*(void *)v50 != v25) {
                  objc_enumerationMutation(v22);
                }
                v27 = *(void **)(*((void *)&v49 + 1) + 8 * i);
                v28 = [v27 applicationState];
                if ([v28 isInstalled])
                {
                  v29 = [v27 bundleIdentifier];
                  char v30 = [v29 isEqualToString:v9];

                  if (v30)
                  {
                    id v10 = v27;

                    goto LABEL_36;
                  }
                }
                else
                {
                }
              }
              uint64_t v24 = [v22 countByEnumeratingWithState:&v49 objects:v57 count:16];
            }
            while (v24);
          }

          id v10 = 0;
LABEL_36:
          id v7 = v40;
LABEL_38:
          v12 = v41;
          id v11 = v42;
          id v13 = v44;
        }
        else
        {
          long long v47 = 0u;
          long long v48 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          id v31 = v15;
          uint64_t v32 = [v31 countByEnumeratingWithState:&v45 objects:v56 count:16];
          if (v32)
          {
            uint64_t v33 = v32;
            uint64_t v34 = *(void *)v46;
            v41 = v12;
            v42 = v11;
            while (2)
            {
              for (uint64_t j = 0; j != v33; ++j)
              {
                if (*(void *)v46 != v34) {
                  objc_enumerationMutation(v31);
                }
                v36 = *(void **)(*((void *)&v45 + 1) + 8 * j);
                v37 = [v36 applicationState];
                char v38 = [v37 isInstalled];

                if (v38)
                {
                  id v10 = v36;

                  goto LABEL_38;
                }
              }
              uint64_t v33 = [v31 countByEnumeratingWithState:&v45 objects:v56 count:16];
              v12 = v41;
              id v11 = v42;
              id v13 = v44;
              if (v33) {
                continue;
              }
              break;
            }
          }

          id v10 = 0;
        }
        v15 = v43;
      }
      else
      {
        id v10 = 0;
      }
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

@end