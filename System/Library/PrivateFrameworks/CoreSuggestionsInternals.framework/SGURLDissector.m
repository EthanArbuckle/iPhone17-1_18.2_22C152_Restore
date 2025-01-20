@interface SGURLDissector
- (id)_titleFromMessagesSynthesizedTextContent:(id)a3;
- (id)supportedBundleIdentifiers;
- (id)urlsFromAttributes:(id)a3 handle:(id)a4 bundleIdentifier:(id)a5 domainIdentifier:(id)a6 uniqueIdentifier:(id)a7 documentTitle:(id)a8 documentDate:(id)a9 documentTimeInterval:(double)a10 receivedAt:(id)a11 isOutgoingDocument:(BOOL)a12;
- (id)urlsFromText:(id)a3 handle:(id)a4 dataDetectorMatches:(id)a5 bundleIdentifier:(id)a6 domainIdentifier:(id)a7 uniqueIdentifier:(id)a8 documentTitle:(id)a9 documentDate:(id)a10 documentTimeInterval:(double)a11 receivedAt:(id)a12 isOutgoingDocument:(BOOL)a13;
- (id)urlsFromURLs:(id)a3 handle:(id)a4 bundleIdentifier:(id)a5 domainIdentifier:(id)a6 uniqueIdentifier:(id)a7 documentTitle:(id)a8 documentDate:(id)a9 documentTimeInterval:(double)a10 receivedAt:(id)a11 isOutgoingDocument:(BOOL)a12;
- (unsigned)_flagsForBundleIdentifier:(id)a3 documentDate:(id)a4 documentTimeInterval:(double)a5 isOutgoingDocument:(BOOL)a6;
- (void)dissectMailMessage:(id)a3 entity:(id)a4 context:(id)a5;
@end

@implementation SGURLDissector

- (unsigned)_flagsForBundleIdentifier:(id)a3 documentDate:(id)a4 documentTimeInterval:(double)a5 isOutgoingDocument:(BOOL)a6
{
  id v9 = a3;
  v10 = v9;
  if (a5 > 0.0) {
    a6 |= 0x20u;
  }
  if (((a4 != 0) & [v9 isEqualToString:*MEMORY[0x1E4F937E0]]) != 0) {
    a6 |= 0x40u;
  }
  if (([v10 isEqualToString:*MEMORY[0x1E4F937B0]] & 1) != 0
    || [v10 isEqualToString:*MEMORY[0x1E4F937C0]])
  {
    a6 |= 0x10u;
  }

  return a6;
}

- (id)_titleFromMessagesSynthesizedTextContent:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 rangeOfString:@":" options:2];
  uint64_t v6 = v5;
  unint64_t v7 = objc_msgSend(v3, "rangeOfString:options:", @"("), 6;
  if (v6 && v8)
  {
    if (v7 > v4 + 3)
    {
      id v9 = objc_msgSend(v3, "substringWithRange:", v4 + 2, v7 - v4 - 3);
      goto LABEL_11;
    }
    v10 = sgLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v14 = 0;
      v11 = "urlsFromAttributes found invalid ranges of colon and parenthesis";
      v12 = (uint8_t *)&v14;
      goto LABEL_9;
    }
  }
  else
  {
    v10 = sgLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v15 = 0;
      v11 = "urlsFromAttributes failed to find colon and parenthesis in text";
      v12 = (uint8_t *)&v15;
LABEL_9:
      _os_log_impl(&dword_1CA650000, v10, OS_LOG_TYPE_DEFAULT, v11, v12, 2u);
    }
  }

  id v9 = 0;
LABEL_11:

  return v9;
}

- (id)urlsFromAttributes:(id)a3 handle:(id)a4 bundleIdentifier:(id)a5 domainIdentifier:(id)a6 uniqueIdentifier:(id)a7 documentTitle:(id)a8 documentDate:(id)a9 documentTimeInterval:(double)a10 receivedAt:(id)a11 isOutgoingDocument:(BOOL)a12
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v45 = a4;
  id v20 = a5;
  id v44 = a6;
  id v46 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a11;
  uint64_t v24 = [v19 URL];
  if (!v24) {
    goto LABEL_6;
  }
  v25 = (void *)v24;
  v26 = [v19 URL];
  [v26 absoluteString];
  v27 = id v43 = v21;
  uint64_t v28 = [v27 length];

  id v21 = v43;
  if (v28)
  {
    v29 = [v19 textContent];
    v30 = [(SGURLDissector *)self _titleFromMessagesSynthesizedTextContent:v29];

    unsigned __int8 v31 = [(SGURLDissector *)self _flagsForBundleIdentifier:v20 documentDate:v22 documentTimeInterval:a12 isOutgoingDocument:a10];
    id v32 = objc_alloc(MEMORY[0x1E4F5DB80]);
    v33 = [v19 URL];
    LOBYTE(v41) = v31;
    v34 = (void *)[v32 initWithURL:v33 title:v30 receivedFromHandle:v45 bundleIdentifier:v20 groupIdentifier:v44 documentIdentifier:v46 documentTitle:a10 documentDate:v43 documentTimeInterval:v22 receivedAt:v23 flags:v41];

    v35 = sgLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v42 = [v34 url];
      v36 = [v42 absoluteString];
      uint64_t v37 = [v36 length];
      v38 = [v34 receivedFromHandle];
      *(_DWORD *)buf = 134218754;
      uint64_t v48 = v37;
      __int16 v49 = 2048;
      uint64_t v50 = [v38 length];
      __int16 v51 = 2112;
      id v52 = v20;
      __int16 v53 = 2112;
      id v54 = v46;
      _os_log_impl(&dword_1CA650000, v35, OS_LOG_TYPE_DEFAULT, "SGURLDissector(Attributes) found URL of length %tu, from handle of length %tu, in: (%@, %@)", buf, 0x2Au);

      id v21 = v43;
    }

    v39 = (id *)objc_opt_new();
    [v39[1] addObject:v34];
  }
  else
  {
LABEL_6:
    v30 = sgLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA650000, v30, OS_LOG_TYPE_DEFAULT, "urlsFromAttributes called with no URL attribute", buf, 2u);
    }
    v39 = 0;
  }

  return v39;
}

- (id)urlsFromText:(id)a3 handle:(id)a4 dataDetectorMatches:(id)a5 bundleIdentifier:(id)a6 domainIdentifier:(id)a7 uniqueIdentifier:(id)a8 documentTitle:(id)a9 documentDate:(id)a10 documentTimeInterval:(double)a11 receivedAt:(id)a12 isOutgoingDocument:(BOOL)a13
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v52 = a4;
  id v20 = a5;
  id v54 = a6;
  id v51 = a7;
  id v53 = a8;
  id v50 = a9;
  id v49 = a10;
  id v48 = a12;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v21 = v20;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v57 objects:v69 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    v56 = 0;
    uint64_t v24 = *(void *)v58;
    id v55 = v19;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v58 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        v27 = (void *)MEMORY[0x1CB79B230]();
        if ([v26 matchType] == 5)
        {
          uint64_t v28 = [v26 valueRange];
          v30 = objc_msgSend(v19, "substringWithRange:", v28, v29);
          unsigned __int8 v31 = v30;
          if (v30 && [v30 length])
          {
            if (!v56) {
              v56 = (id *)objc_opt_new();
            }
            id v32 = [MEMORY[0x1E4F1CB10] URLWithString:v31];
            v33 = v32;
            if (v32)
            {
              uint64_t v34 = [v32 absoluteString];
              if (v34)
              {
                v35 = (void *)v34;
                v36 = [v33 absoluteString];
                uint64_t v37 = [v36 length];

                id v19 = v55;
                if (v37)
                {
                  LOBYTE(v43) = [(SGURLDissector *)self _flagsForBundleIdentifier:v54 documentDate:v49 documentTimeInterval:a13 isOutgoingDocument:a11];
                  v38 = (void *)[objc_alloc(MEMORY[0x1E4F5DB80]) initWithURL:v33 title:0 receivedFromHandle:v52 bundleIdentifier:v54 groupIdentifier:v51 documentIdentifier:v53 documentTitle:a11 documentDate:v50 documentTimeInterval:v49 receivedAt:v48 flags:v43];
                  [v56[1] addObject:v38];
                  v39 = sgLogHandle();
                  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
                  {
                    id v46 = [v38 url];
                    id v45 = [v46 absoluteString];
                    uint64_t v44 = [v45 length];
                    v40 = [v38 receivedFromHandle];
                    uint64_t v41 = [v40 length];
                    *(_DWORD *)buf = 134218754;
                    uint64_t v62 = v44;
                    __int16 v63 = 2048;
                    uint64_t v64 = v41;
                    __int16 v65 = 2112;
                    id v66 = v54;
                    __int16 v67 = 2112;
                    id v68 = v53;
                    _os_log_impl(&dword_1CA650000, v39, OS_LOG_TYPE_DEFAULT, "SGURLDissector(Text) found URL of length %tu, from handle of length %tu, in: (%@, %@)", buf, 0x2Au);
                  }
                  id v19 = v55;
                }
              }
            }
          }
        }
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v57 objects:v69 count:16];
    }
    while (v23);
  }
  else
  {
    v56 = 0;
  }

  return v56;
}

- (id)urlsFromURLs:(id)a3 handle:(id)a4 bundleIdentifier:(id)a5 domainIdentifier:(id)a6 uniqueIdentifier:(id)a7 documentTitle:(id)a8 documentDate:(id)a9 documentTimeInterval:(double)a10 receivedAt:(id)a11 isOutgoingDocument:(BOOL)a12
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v49 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  id v47 = a8;
  id v46 = a9;
  id v45 = a11;
  id v48 = (id *)objc_opt_new();
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v23 = v19;
  uint64_t v24 = v21;
  id obj = v23;
  uint64_t v52 = [v23 countByEnumeratingWithState:&v53 objects:v65 count:16];
  if (v52)
  {
    uint64_t v51 = *(void *)v54;
    uint64_t v43 = self;
    do
    {
      for (uint64_t i = 0; i != v52; ++i)
      {
        if (*(void *)v54 != v51) {
          objc_enumerationMutation(obj);
        }
        v26 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        v27 = (void *)MEMORY[0x1CB79B230]();
        uint64_t v28 = [v26 absoluteString];
        if (v28)
        {
          uint64_t v29 = (void *)v28;
          v30 = [v26 absoluteString];
          uint64_t v31 = [v30 length];

          if (v31)
          {
            LOBYTE(v42) = [(SGURLDissector *)self _flagsForBundleIdentifier:v20 documentDate:v46 documentTimeInterval:a12 isOutgoingDocument:a10];
            id v32 = (void *)[objc_alloc(MEMORY[0x1E4F5DB80]) initWithURL:v26 title:0 receivedFromHandle:v49 bundleIdentifier:v20 groupIdentifier:v24 documentIdentifier:v22 documentTitle:a10 documentDate:v47 documentTimeInterval:v46 receivedAt:v45 flags:v42];
            [v48[1] addObject:v32];
            v33 = sgLogHandle();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v44 = [v32 url];
              uint64_t v34 = [v44 absoluteString];
              id v35 = v22;
              v36 = v24;
              id v37 = v20;
              uint64_t v38 = [v34 length];
              v39 = [v32 receivedFromHandle];
              uint64_t v40 = [v39 length];
              *(_DWORD *)buf = 134218754;
              uint64_t v58 = v38;
              id v20 = v37;
              uint64_t v24 = v36;
              id v22 = v35;
              __int16 v59 = 2048;
              uint64_t v60 = v40;
              __int16 v61 = 2112;
              id v62 = v20;
              __int16 v63 = 2112;
              id v64 = v35;
              _os_log_impl(&dword_1CA650000, v33, OS_LOG_TYPE_DEFAULT, "SGURLDissector(URLs) found URL of length %tu, from handle of length %tu, in: (%@, %@)", buf, 0x2Au);

              self = v43;
            }
          }
        }
      }
      uint64_t v52 = [obj countByEnumeratingWithState:&v53 objects:v65 count:16];
    }
    while (v52);
  }

  return v48;
}

- (void)dissectMailMessage:(id)a3 entity:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 bundleIdentifier];
  if (v11)
  {
    v12 = (void *)v11;
    uint64_t v13 = [v8 uniqueIdentifier];
    if (v13)
    {
      __int16 v14 = (void *)v13;
      __int16 v15 = [v8 date];

      if (v15)
      {
        v16 = [(SGURLDissector *)self supportedBundleIdentifiers];
        v17 = [v8 bundleIdentifier];
        int v18 = [v16 containsObject:v17];

        if (v18)
        {
          id v19 = [v8 htmlParser];
          id v20 = [v19 appleAnchorHrefs];

          long long v55 = v20;
          if ([v20 count])
          {
            context = (void *)MEMORY[0x1CB79B230]();
            long long v56 = [v20 allObjects];
            id v49 = [v8 author];
            id v47 = [v49 handles];
            uint64_t v45 = [v47 count];
            if (v45)
            {
              uint64_t v42 = [v8 author];
              uint64_t v41 = [v42 handles];
              long long v53 = [v41 objectAtIndexedSubscript:0];
            }
            else
            {
              long long v53 = 0;
            }
            id v22 = [v8 bundleIdentifier];
            id v23 = [v8 domainIdentifier];
            uint64_t v24 = [v8 uniqueIdentifier];
            v25 = [v8 subject];
            v26 = [v8 date];
            v27 = objc_opt_new();
            LOBYTE(v39) = [v8 isSent];
            uint64_t v43 = [(SGURLDissector *)self urlsFromURLs:v56 handle:v53 bundleIdentifier:v22 domainIdentifier:v23 uniqueIdentifier:v24 documentTitle:v25 documentDate:0.0 documentTimeInterval:v26 receivedAt:v27 isOutgoingDocument:v39];

            if (v45)
            {
            }
            if (v43) {
              [v9 addExternalEnrichment:v43];
            }
          }
          uint64_t v28 = MEMORY[0x1CB79B230]();
          long long v57 = [v8 textContent];
          uint64_t v29 = [v8 author];
          v30 = [v29 handles];
          id v50 = v29;
          contexta = (void *)v28;
          uint64_t v46 = [v30 count];
          id v48 = v30;
          id v44 = v10;
          if (v46)
          {
            uint64_t v43 = [v8 author];
            uint64_t v42 = [v43 handles];
            long long v54 = [v42 objectAtIndexedSubscript:0];
          }
          else
          {
            long long v54 = 0;
          }
          uint64_t v31 = [v8 plainTextDetectedData];
          id v32 = [v8 bundleIdentifier];
          v33 = [v8 domainIdentifier];
          uint64_t v34 = [v8 uniqueIdentifier];
          id v35 = [v8 subject];
          v36 = [v8 date];
          id v37 = objc_opt_new();
          LOBYTE(v40) = [v8 isSent];
          uint64_t v38 = [(SGURLDissector *)self urlsFromText:v57 handle:v54 dataDetectorMatches:v31 bundleIdentifier:v32 domainIdentifier:v33 uniqueIdentifier:v34 documentTitle:0.0 documentDate:v35 documentTimeInterval:v36 receivedAt:v37 isOutgoingDocument:v40];

          if (v46)
          {
          }
          id v10 = v44;
          if (v38) {
            [v9 addExternalEnrichment:v38];
          }
        }
        goto LABEL_12;
      }
    }
    else
    {
    }
  }
  id v21 = sgLogHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA650000, v21, OS_LOG_TYPE_DEFAULT, "SGURLDissector ignoring entity due to missing bundle id, unique id, or date", buf, 2u);
  }

LABEL_12:
}

- (id)supportedBundleIdentifiers
{
  if (supportedBundleIdentifiers__pasOnceToken5 != -1) {
    dispatch_once(&supportedBundleIdentifiers__pasOnceToken5, &__block_literal_global_29931);
  }
  v2 = (void *)supportedBundleIdentifiers__pasExprOnceResult;
  return v2;
}

void __44__SGURLDissector_supportedBundleIdentifiers__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79B230]();
  v1 = (void *)MEMORY[0x1CB79B230]();
  id v2 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v3 = objc_msgSend(v2, "initWithObjects:", *MEMORY[0x1E4F5DC28], 0);
  uint64_t v4 = (void *)supportedBundleIdentifiers__pasExprOnceResult;
  supportedBundleIdentifiers__pasExprOnceResult = v3;
}

@end