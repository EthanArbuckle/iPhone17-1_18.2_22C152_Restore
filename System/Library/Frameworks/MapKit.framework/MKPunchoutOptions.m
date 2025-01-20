@interface MKPunchoutOptions
+ (id)punchoutOptionsForURLStrings:(id)a3 withAttribution:(id)a4;
- (NSString)appBundleIdentifier;
- (NSURL)urlToOpen;
- (int64_t)strategy;
- (void)setAppBundleIdentifier:(id)a3;
- (void)setStrategy:(int64_t)a3;
- (void)setUrlToOpen:(id)a3;
@end

@implementation MKPunchoutOptions

+ (id)punchoutOptionsForURLStrings:(id)a3 withAttribution:(id)a4
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  id v8 = v6;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v60 objects:v69 count:16];
  id v51 = v9;
  if (v10)
  {
    uint64_t v47 = v10;
    uint64_t v11 = *(void *)v61;
    uint64_t v12 = *MEMORY[0x1E4F63E48];
    unint64_t v13 = 0x1E4F1C000uLL;
    do
    {
      uint64_t v14 = 0;
      uint64_t v15 = v47;
      do
      {
        if (*(void *)v61 != v11) {
          objc_enumerationMutation(v9);
        }
        v16 = [*(id *)(v13 + 2832) URLWithString:*(void *)(*((void *)&v60 + 1) + 8 * v14)];
        v17 = [v16 scheme];
        int v18 = [v17 isEqualToString:v12];

        if (v18)
        {
          v19 = [MEMORY[0x1E4F223E0] defaultWorkspace];
          v20 = [v19 applicationsAvailableForOpeningURL:v16];

          long long v58 = 0u;
          long long v59 = 0u;
          long long v56 = 0u;
          long long v57 = 0u;
          v21 = [v8 attributionApps];
          uint64_t v48 = [v21 countByEnumeratingWithState:&v56 objects:&v65 count:16];
          if (v48)
          {
            uint64_t v22 = *(void *)v57;
            v49 = v21;
            id v50 = v8;
            uint64_t v44 = v12;
            uint64_t v45 = v11;
            v43 = v20;
            uint64_t v46 = *(void *)v57;
            do
            {
              uint64_t v23 = 0;
              do
              {
                if (*(void *)v57 != v22) {
                  objc_enumerationMutation(v21);
                }
                v24 = [*(id *)(*((void *)&v56 + 1) + 8 * v23) appBundleIdentifier];
                long long v52 = 0u;
                long long v53 = 0u;
                long long v54 = 0u;
                long long v55 = 0u;
                id v25 = v20;
                uint64_t v26 = [v25 countByEnumeratingWithState:&v52 objects:v64 count:16];
                if (v26)
                {
                  uint64_t v27 = v26;
                  uint64_t v28 = *(void *)v53;
                  while (2)
                  {
                    for (uint64_t i = 0; i != v27; ++i)
                    {
                      if (*(void *)v53 != v28) {
                        objc_enumerationMutation(v25);
                      }
                      v30 = [*(id *)(*((void *)&v52 + 1) + 8 * i) bundleIdentifier];
                      char v31 = [v30 isEqualToString:v24];

                      if (v31)
                      {
                        v33 = objc_alloc_init(MKPunchoutOptions);
                        [(MKPunchoutOptions *)v33 setStrategy:1];
                        [(MKPunchoutOptions *)v33 setAppBundleIdentifier:v24];
                        [(MKPunchoutOptions *)v33 setUrlToOpen:v16];

                        id v8 = v50;
                        id v9 = v51;
                        goto LABEL_28;
                      }
                    }
                    uint64_t v27 = [v25 countByEnumeratingWithState:&v52 objects:v64 count:16];
                    if (v27) {
                      continue;
                    }
                    break;
                  }
                }

                ++v23;
                v21 = v49;
                id v8 = v50;
                id v9 = v51;
                uint64_t v12 = v44;
                uint64_t v11 = v45;
                unint64_t v13 = 0x1E4F1C000;
                v20 = v43;
                uint64_t v22 = v46;
              }
              while (v23 != v48);
              uint64_t v32 = [v49 countByEnumeratingWithState:&v56 objects:&v65 count:16];
              uint64_t v22 = v46;
              uint64_t v15 = v47;
              uint64_t v48 = v32;
            }
            while (v32);
          }
        }
        ++v14;
      }
      while (v14 != v15);
      v33 = 0;
      uint64_t v47 = [v9 countByEnumeratingWithState:&v60 objects:v69 count:16];
    }
    while (v47);
  }
  else
  {
    v33 = 0;
  }
LABEL_28:

  if (!v33)
  {
    id v34 = v9;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v35 = v34;
    uint64_t v36 = [v35 countByEnumeratingWithState:&v65 objects:v69 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v66;
      while (2)
      {
        for (uint64_t j = 0; j != v37; ++j)
        {
          if (*(void *)v66 != v38) {
            objc_enumerationMutation(v35);
          }
          v40 = [MEMORY[0x1E4F1CB10] URLWithString:*(void *)(*((void *)&v65 + 1) + 8 * j)];
          v41 = [v40 scheme];
          if (([v41 isEqualToString:@"http"] & 1) != 0
            || ([v41 isEqualToString:@"https"] & 1) != 0)
          {
            v33 = objc_alloc_init(MKPunchoutOptions);
            [(MKPunchoutOptions *)v33 setStrategy:2];
            [(MKPunchoutOptions *)v33 setUrlToOpen:v40];

            id v9 = v51;
            goto LABEL_41;
          }
        }
        uint64_t v37 = [v35 countByEnumeratingWithState:&v65 objects:v69 count:16];
        v33 = 0;
        id v9 = v51;
        if (v37) {
          continue;
        }
        break;
      }
    }
    else
    {
      v33 = 0;
    }
LABEL_41:
  }

  return v33;
}

- (NSURL)urlToOpen
{
  return self->_urlToOpen;
}

- (void)setUrlToOpen:(id)a3
{
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (void)setAppBundleIdentifier:(id)a3
{
}

- (int64_t)strategy
{
  return self->_strategy;
}

- (void)setStrategy:(int64_t)a3
{
  self->_strategy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);

  objc_storeStrong((id *)&self->_urlToOpen, 0);
}

@end