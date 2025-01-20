@interface _GEOCollectionPublisherAttribution
- (NSString)applicationAdamId;
- (NSString)displayName;
- (NSString)subtitle;
- (NSString)themeColorDarkMode;
- (NSString)themeColorLightMode;
- (NSURL)websiteURL;
- (_GEOCollectionPublisherAttribution)initWithPublisherAttributionSource:(id)a3 preferredLanguages:(id)a4;
- (unsigned)iconIdentifier;
- (unsigned)logoCenteredColorizedIdentifier;
- (unsigned)logoCenteredIdentifier;
- (unsigned)logoIdentifier;
- (unsigned)logoWithoutPaddingIdentifier;
@end

@implementation _GEOCollectionPublisherAttribution

- (unsigned)logoWithoutPaddingIdentifier
{
  return self->_logoWithoutPaddingIdentifier;
}

- (unsigned)logoIdentifier
{
  return self->_logoIdentifier;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (_GEOCollectionPublisherAttribution)initWithPublisherAttributionSource:(id)a3 preferredLanguages:(id)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v52.receiver = self;
  v52.super_class = (Class)_GEOCollectionPublisherAttribution;
  v8 = [(_GEOCollectionPublisherAttribution *)&v52 init];
  if (!v8) {
    goto LABEL_36;
  }
  v9 = (void *)MEMORY[0x1E4F1CB10];
  v10 = [v6 websiteURL];
  uint64_t v11 = [v9 URLWithString:v10];
  websiteURL = v8->_websiteURL;
  v8->_websiteURL = (NSURL *)v11;

  uint64_t v13 = [v6 appAdamID];
  applicationAdamId = v8->_applicationAdamId;
  v47 = v8;
  v8->_applicationAdamId = (NSString *)v13;

  id v48 = v6;
  id v15 = [v6 localizedAttributions];
  id v50 = v7;
  id v16 = v7;
  v17 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v15, "count"));
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v18 = v15;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v57 objects:v62 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    id v21 = 0;
    uint64_t v22 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v58 != v22) {
          objc_enumerationMutation(v18);
        }
        v24 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        if ([v24 hasLanguage])
        {
          v25 = [v24 language];
          [v17 addObject:v25];
        }
        else if (!v21)
        {
          id v21 = v24;
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v57 objects:v62 count:16];
    }
    while (v20);
  }
  else
  {
    id v21 = 0;
  }

  v49 = v16;
  v26 = [MEMORY[0x1E4F1CA20] mostPreferredLanguageOf:v17 withPreferredLanguages:v16 forUsage:1 options:0];
  if (v26)
  {
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id obj = v18;
    uint64_t v27 = [obj countByEnumeratingWithState:&v53 objects:v61 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v54;
LABEL_18:
      uint64_t v30 = 0;
      while (1)
      {
        if (*(void *)v54 != v29) {
          objc_enumerationMutation(obj);
        }
        v31 = *(void **)(*((void *)&v53 + 1) + 8 * v30);
        v32 = [v31 language];
        char v33 = [v32 isEqualToString:v26];

        if (v33) {
          break;
        }
        if (v28 == ++v30)
        {
          uint64_t v28 = [obj countByEnumeratingWithState:&v53 objects:v61 count:16];
          if (v28) {
            goto LABEL_18;
          }
          goto LABEL_24;
        }
      }
      id v34 = v31;

      if (v34) {
        BOOL v36 = v21 == 0;
      }
      else {
        BOOL v36 = 1;
      }
      if (!v36)
      {
        id v46 = (id)[v21 copy];
        [v46 mergeFrom:v34];
        v8 = v47;
        id v6 = v48;
        goto LABEL_35;
      }
      if (v34) {
        v35 = v34;
      }
      else {
        v35 = v21;
      }
      goto LABEL_34;
    }
LABEL_24:
  }
  id v34 = 0;
  v35 = v21;
LABEL_34:
  v8 = v47;
  id v6 = v48;
  id v46 = v35;
LABEL_35:

  uint64_t v37 = [v46 displayName];
  displayName = v8->_displayName;
  v8->_displayName = (NSString *)v37;

  uint64_t v39 = [v46 subtitle];
  subtitle = v8->_subtitle;
  v8->_subtitle = (NSString *)v39;

  v8->_iconIdentifier = [v46 iconIdentifier];
  v8->_logoIdentifier = [v46 logoIdentifier];
  v8->_logoWithoutPaddingIdentifier = [v46 logoWithoutPaddingIdentifier];
  v8->_logoCenteredIdentifier = [v46 logoCenteredIdentifier];
  v8->_logoCenteredColorizedIdentifier = [v46 logoCenteredColorizedIdentifier];
  uint64_t v41 = [v46 themeColorLightMode];
  themeColorLightMode = v8->_themeColorLightMode;
  v8->_themeColorLightMode = (NSString *)v41;

  uint64_t v43 = [v46 themeColorDarkMode];
  themeColorDarkMode = v8->_themeColorDarkMode;
  v8->_themeColorDarkMode = (NSString *)v43;

  id v7 = v50;
LABEL_36:

  return v8;
}

- (NSURL)websiteURL
{
  return self->_websiteURL;
}

- (NSString)applicationAdamId
{
  return self->_applicationAdamId;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (unsigned)iconIdentifier
{
  return self->_iconIdentifier;
}

- (unsigned)logoCenteredIdentifier
{
  return self->_logoCenteredIdentifier;
}

- (unsigned)logoCenteredColorizedIdentifier
{
  return self->_logoCenteredColorizedIdentifier;
}

- (NSString)themeColorLightMode
{
  return self->_themeColorLightMode;
}

- (NSString)themeColorDarkMode
{
  return self->_themeColorDarkMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_themeColorDarkMode, 0);
  objc_storeStrong((id *)&self->_themeColorLightMode, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_applicationAdamId, 0);

  objc_storeStrong((id *)&self->_websiteURL, 0);
}

@end