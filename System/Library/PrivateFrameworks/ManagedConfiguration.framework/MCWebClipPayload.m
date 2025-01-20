@interface MCWebClipPayload
+ (id)localizedPluralForm;
+ (id)localizedSingularForm;
+ (id)typeStrings;
- (BOOL)fullScreen;
- (BOOL)ignoreManifestScope;
- (BOOL)isRemovable;
- (BOOL)precomposed;
- (MCWebClipPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5;
- (NSData)iconData;
- (NSNumber)fullScreenNum;
- (NSNumber)ignoreManifestScopeNum;
- (NSNumber)isRemovableNum;
- (NSNumber)precomposedNum;
- (NSString)contentMode;
- (NSString)label;
- (NSString)savedIdentifier;
- (NSString)targetApplicationBundleIdentifier;
- (NSURL)URL;
- (id)payloadDescriptionKeyValueSections;
- (id)stubDictionary;
- (id)subtitle1Description;
- (id)subtitle1Label;
- (id)subtitle2Description;
- (id)subtitle2Label;
- (id)title;
- (id)verboseDescription;
- (void)setSavedIdentifier:(id)a3;
- (void)setTargetApplicationBundleIdentifier:(id)a3;
@end

@implementation MCWebClipPayload

+ (id)typeStrings
{
  return (id)[MEMORY[0x1E4F1C978] arrayWithObject:@"com.apple.webClip.managed"];
}

+ (id)localizedSingularForm
{
  return MCLocalizedFormat(@"WEBCLIP_DESCRIPTION_SINGULAR_FORMAT", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)localizedPluralForm
{
  return MCLocalizedFormat(@"WEBCLIP_DESCRIPTION_PLURAL_FORMAT", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (MCWebClipPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v93.receiver = self;
  v93.super_class = (Class)MCWebClipPayload;
  v10 = [(MCPayload *)&v93 initWithDictionary:v8 profile:v9 outError:a5];
  if (!v10) {
    goto LABEL_20;
  }
  if ([v9 isStub])
  {
    id v83 = 0;
    v11 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"URL" isRequired:0 outError:&v83];
    id v12 = v83;
    if (!v12)
    {
      if (v11)
      {
        uint64_t v13 = [MEMORY[0x1E4F1CB10] URLWithString:v11];
        URL = v10->_URL;
        v10->_URL = (NSURL *)v13;
      }
      id v82 = 0;
      uint64_t v15 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"Label" isRequired:0 outError:&v82];
      id v16 = v82;
      label = v10->_label;
      v10->_label = (NSString *)v15;

      if (!v16)
      {
        id v81 = 0;
        uint64_t v18 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"FullScreen" isRequired:0 outError:&v81];
        id v16 = v81;
        fullScreenNum = v10->_fullScreenNum;
        v10->_fullScreenNum = (NSNumber *)v18;

        if (!v16)
        {
          v10->_fullScreen = [(NSNumber *)v10->_fullScreenNum BOOLValue];
          id v80 = 0;
          uint64_t v20 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"SavedIdentifier" isRequired:0 outError:&v80];
          id v16 = v80;
          savedIdentifier = v10->_savedIdentifier;
          v10->_savedIdentifier = (NSString *)v20;

          if (!v16)
          {
            id v79 = 0;
            uint64_t v22 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"IsRemovable" isRequired:0 outError:&v79];
            id v16 = v79;
            isRemovableNum = v10->_isRemovableNum;
            v10->_isRemovableNum = (NSNumber *)v22;

            if (!v16)
            {
              v24 = v10->_isRemovableNum;
              BOOL v25 = !v24 || [(NSNumber *)v24 BOOLValue];
              v10->_isRemovable = v25;
              id v78 = 0;
              uint64_t v67 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"IgnoreManifestScope" isRequired:0 outError:&v78];
              id v16 = v78;
              ignoreManifestScopeNum = v10->_ignoreManifestScopeNum;
              v10->_ignoreManifestScopeNum = (NSNumber *)v67;

              if (!v16)
              {
                v10->_ignoreManifestScope = [(NSNumber *)v10->_ignoreManifestScopeNum BOOLValue];
                id v77 = 0;
                uint64_t v69 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"ContentMode" isRequired:0 outError:&v77];
                id v16 = v77;
                contentMode = v10->_contentMode;
                v10->_contentMode = (NSString *)v69;

                if (!v16)
                {
                  id v76 = 0;
                  uint64_t v71 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"TargetApplicationBundleIdentifier" isRequired:0 outError:&v76];
                  id v16 = v76;
                  targetApplicationBundleIdentifier = v10->_targetApplicationBundleIdentifier;
                  v10->_targetApplicationBundleIdentifier = (NSString *)v71;

                  if (!v16) {
                    goto LABEL_46;
                  }
                }
              }
            }
          }
        }
      }
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  id v92 = 0;
  v11 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"URL" isRequired:1 outError:&v92];
  id v12 = v92;
  if (!v12)
  {
    uint64_t v34 = [MEMORY[0x1E4F1CB10] URLWithString:v11];
    v35 = v10->_URL;
    v10->_URL = (NSURL *)v34;

    id v91 = 0;
    uint64_t v36 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"Label" isRequired:1 outError:&v91];
    id v16 = v91;
    v37 = v10->_label;
    v10->_label = (NSString *)v36;

    if (v16) {
      goto LABEL_14;
    }
    id v90 = 0;
    v38 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"Icon" isRequired:0 outError:&v90];
    id v16 = v90;
    if (v16)
    {
LABEL_23:

      goto LABEL_14;
    }
    if (v38)
    {
      uint64_t v39 = MCCGImageSourceCreateWithData((uint64_t)v38, 0);
      if (v39)
      {
        v40 = (const void *)v39;
        if (MCCGImageSourceGetCount(v39))
        {
          ImageAtIndex = (const void *)MCCGImageSourceCreateImageAtIndex((uint64_t)v40, 0, 0);
          if (ImageAtIndex)
          {
            CFRelease(ImageAtIndex);
            CFRelease(v40);
            objc_storeStrong((id *)&v10->_iconData, v38);
            goto LABEL_29;
          }
        }
        CFRelease(v40);
      }
      iconData = v10->_iconData;
      v10->_iconData = v38;
      v47 = v38;

      v48 = (void *)MEMORY[0x1E4F28C58];
      v56 = MCErrorArray(@"ERROR_PROFILE_FIELD_INVALID_P_FIELD", v49, v50, v51, v52, v53, v54, v55, @"Icon");
      id v16 = [v48 MCErrorWithDomain:@"MCProfileErrorDomain" code:1003 descriptionArray:v56 errorType:@"MCFatalError"];

      if (!v16) {
        goto LABEL_20;
      }
      goto LABEL_15;
    }
LABEL_29:
    id v89 = 0;
    uint64_t v42 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"IsRemovable" isRequired:0 outError:&v89];
    id v16 = v89;
    v43 = v10->_isRemovableNum;
    v10->_isRemovableNum = (NSNumber *)v42;

    if (!v16)
    {
      v44 = v10->_isRemovableNum;
      BOOL v45 = !v44 || [(NSNumber *)v44 BOOLValue];
      v10->_isRemovable = v45;
      id v88 = 0;
      uint64_t v57 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"Precomposed" isRequired:0 outError:&v88];
      id v16 = v88;
      precomposedNum = v10->_precomposedNum;
      v10->_precomposedNum = (NSNumber *)v57;

      if (!v16)
      {
        v10->_precomposed = [(NSNumber *)v10->_precomposedNum BOOLValue];
        id v87 = 0;
        uint64_t v59 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"FullScreen" isRequired:0 outError:&v87];
        id v16 = v87;
        v60 = v10->_fullScreenNum;
        v10->_fullScreenNum = (NSNumber *)v59;

        if (!v16)
        {
          v10->_fullScreen = [(NSNumber *)v10->_fullScreenNum BOOLValue];
          id v86 = 0;
          uint64_t v61 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"IgnoreManifestScope" isRequired:0 outError:&v86];
          id v16 = v86;
          v62 = v10->_ignoreManifestScopeNum;
          v10->_ignoreManifestScopeNum = (NSNumber *)v61;

          if (!v16)
          {
            v10->_ignoreManifestScope = [(NSNumber *)v10->_ignoreManifestScopeNum BOOLValue];
            id v85 = 0;
            uint64_t v63 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"ContentMode" isRequired:0 outError:&v85];
            id v16 = v85;
            v64 = v10->_contentMode;
            v10->_contentMode = (NSString *)v63;

            if (!v16)
            {
              id v84 = 0;
              uint64_t v65 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"TargetApplicationBundleIdentifier" isRequired:0 outError:&v84];
              id v16 = v84;
              v66 = v10->_targetApplicationBundleIdentifier;
              v10->_targetApplicationBundleIdentifier = (NSString *)v65;

              if (!v16)
              {

LABEL_46:
                if ([v8 count])
                {
                  v73 = (void *)_MCLogObjects;
                  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
                  {
                    v74 = v73;
                    v75 = [(MCPayload *)v10 friendlyName];
                    *(_DWORD *)buf = 138543618;
                    v95 = v75;
                    __int16 v96 = 2114;
                    id v97 = v8;
                    _os_log_impl(&dword_1A13F0000, v74, OS_LOG_TYPE_INFO, "Payload “%{public}@” has fields that we are ignoring. They are: %{public}@", buf, 0x16u);
                  }
                }
                goto LABEL_20;
              }
            }
          }
        }
      }
    }
    goto LABEL_23;
  }
LABEL_13:
  id v16 = v12;
LABEL_14:

LABEL_15:
  v26 = [(MCPayload *)v10 malformedPayloadErrorWithError:v16];
  v27 = v26;
  if (a5) {
    *a5 = v26;
  }
  v28 = (void *)_MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
  {
    v29 = v28;
    v30 = objc_opt_class();
    id v31 = v30;
    v32 = [v27 MCVerboseDescription];
    *(_DWORD *)buf = 138543618;
    v95 = v30;
    __int16 v96 = 2114;
    id v97 = v32;
    _os_log_impl(&dword_1A13F0000, v29, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);
  }
  v10 = 0;
LABEL_20:

  return v10;
}

- (id)stubDictionary
{
  v13.receiver = self;
  v13.super_class = (Class)MCWebClipPayload;
  uint64_t v3 = [(MCPayload *)&v13 stubDictionary];
  URL = self->_URL;
  if (URL)
  {
    uint64_t v5 = [(NSURL *)URL absoluteString];
    [v3 MCSetObjectIfNotNil:v5 forKey:@"URL"];
  }
  uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_fullScreen];
  [v3 MCSetObjectIfNotNil:v6 forKey:@"FullScreen"];

  [v3 MCSetObjectIfNotNil:self->_label forKey:@"Label"];
  savedIdentifier = self->_savedIdentifier;
  if (savedIdentifier) {
    [v3 setObject:savedIdentifier forKeyedSubscript:@"SavedIdentifier"];
  }
  id v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[MCWebClipPayload isRemovable](self, "isRemovable"));
  [v3 setObject:v8 forKeyedSubscript:@"IsRemovable"];

  id v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[MCWebClipPayload ignoreManifestScope](self, "ignoreManifestScope"));
  [v3 setObject:v9 forKeyedSubscript:@"IgnoreManifestScope"];

  contentMode = self->_contentMode;
  if (contentMode) {
    [v3 setObject:contentMode forKeyedSubscript:@"ContentMode"];
  }
  targetApplicationBundleIdentifier = self->_targetApplicationBundleIdentifier;
  if (targetApplicationBundleIdentifier) {
    [v3 setObject:targetApplicationBundleIdentifier forKeyedSubscript:@"TargetApplicationBundleIdentifier"];
  }
  return v3;
}

- (id)verboseDescription
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28E78];
  v15.receiver = self;
  v15.super_class = (Class)MCWebClipPayload;
  uint64_t v4 = [(MCPayload *)&v15 verboseDescription];
  uint64_t v5 = [v3 stringWithString:v4];

  uint64_t v6 = [(MCPayload *)self profile];
  char v7 = [v6 isStub];

  if ((v7 & 1) == 0)
  {
    if (self->_URL) {
      [v5 appendFormat:@"URL         : %@\n", self->_URL];
    }
    if (self->_label) {
      [v5 appendFormat:@"Label       : %@\n", self->_label];
    }
    if (self->_iconData) {
      [v5 appendFormat:@"Icon        : Present\n"];
    }
    id v8 = MCStringForBool(self->_isRemovable);
    [v5 appendFormat:@"Removable   : %@\n", v8];

    id v9 = MCStringForBool(self->_precomposed);
    [v5 appendFormat:@"Precomposed : %@\n", v9];

    v10 = MCStringForBool(self->_fullScreen);
    [v5 appendFormat:@"Full screen : %@\n", v10];

    v11 = MCStringForBool(self->_ignoreManifestScope);
    [v5 appendFormat:@"Ignore scope: %@\n", v11];

    if (self->_contentMode) {
      [v5 appendFormat:@"Content mode: %@\n", self->_contentMode];
    }
    if (self->_targetApplicationBundleIdentifier) {
      [v5 appendFormat:@"Target App: %@\n", self->_targetApplicationBundleIdentifier];
    }
    id v12 = [(MCWebClipPayload *)self savedIdentifier];

    if (v12)
    {
      objc_super v13 = [(MCWebClipPayload *)self savedIdentifier];
      [v5 appendFormat:@"Identifier  : %@\n", v13];
    }
  }
  return v5;
}

- (id)title
{
  return MCLocalizedString(@"WEBCLIP_HEADING");
}

- (id)subtitle1Label
{
  return MCLocalizedString(@"WEBCLIP_URL_COLON");
}

- (id)subtitle1Description
{
  uint64_t v2 = [(MCWebClipPayload *)self URL];
  uint64_t v3 = [v2 absoluteString];

  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    MCLocalizedString(@"WEBCLIP_URL_MISSING");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v5 = v4;

  return v5;
}

- (id)subtitle2Label
{
  return MCLocalizedString(@"WEBCLIP_LABEL_COLON");
}

- (id)subtitle2Description
{
  uint64_t v2 = [(MCWebClipPayload *)self label];
  uint64_t v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    MCLocalizedString(@"WEBCLIP_LABEL_MISSING");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v5 = v4;

  return v5;
}

- (id)payloadDescriptionKeyValueSections
{
  v35[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  if (self->_label)
  {
    id v4 = [MCKeyValue alloc];
    label = self->_label;
    uint64_t v6 = MCLocalizedString(@"WEB_CLIP_LABEL");
    char v7 = [(MCKeyValue *)v4 initWithLocalizedString:label localizedKey:v6];

    [v3 addObject:v7];
  }
  if (self->_URL)
  {
    id v8 = [MCKeyValue alloc];
    id v9 = [(NSURL *)self->_URL absoluteString];
    v10 = MCLocalizedString(@"URL");
    v11 = [(MCKeyValue *)v8 initWithLocalizedString:v9 localizedKey:v10];

    [v3 addObject:v11];
  }
  if (self->_isRemovableNum)
  {
    id v12 = [MCKeyValue alloc];
    objc_super v13 = MCLocalizedStringForBool([(NSNumber *)self->_isRemovableNum BOOLValue]);
    v14 = MCLocalizedString(@"WEB_CLIP_REMOVABLE");
    objc_super v15 = [(MCKeyValue *)v12 initWithLocalizedString:v13 localizedKey:v14];

    [v3 addObject:v15];
  }
  if (self->_fullScreenNum)
  {
    id v16 = [MCKeyValue alloc];
    v17 = MCLocalizedStringForBool([(NSNumber *)self->_fullScreenNum BOOLValue]);
    uint64_t v18 = MCLocalizedString(@"WEB_CLIP_FULLSCREEN");
    v19 = [(MCKeyValue *)v16 initWithLocalizedString:v17 localizedKey:v18];

    [v3 addObject:v19];
  }
  if ([(NSNumber *)self->_ignoreManifestScopeNum BOOLValue])
  {
    uint64_t v20 = [MCKeyValue alloc];
    v21 = MCLocalizedStringForBool([(NSNumber *)self->_ignoreManifestScopeNum BOOLValue]);
    uint64_t v22 = MCLocalizedString(@"WEB_CLIP_IGNORE_MANIFEST_SCOPE");
    v23 = [(MCKeyValue *)v20 initWithLocalizedString:v21 localizedKey:v22];

    [v3 addObject:v23];
  }
  if (self->_contentMode)
  {
    v24 = [MCKeyValue alloc];
    contentMode = self->_contentMode;
    v26 = MCLocalizedString(@"WEB_CLIP_CONTENT_MODE");
    v27 = [(MCKeyValue *)v24 initWithLocalizedString:contentMode localizedKey:v26];

    [v3 addObject:v27];
  }
  if (self->_targetApplicationBundleIdentifier)
  {
    v28 = [MCKeyValue alloc];
    targetApplicationBundleIdentifier = self->_targetApplicationBundleIdentifier;
    v30 = MCLocalizedString(@"WEB_CLIP_TARGET_APP_BUNDLE_IDENTIFIER");
    id v31 = [(MCKeyValue *)v28 initWithLocalizedString:targetApplicationBundleIdentifier localizedKey:v30];

    [v3 addObject:v31];
  }
  if ([v3 count])
  {
    v32 = +[MCKeyValueSection sectionWithKeyValues:v3];
    v35[0] = v32;
    v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
  }
  else
  {
    v33 = 0;
  }

  return v33;
}

- (NSURL)URL
{
  return self->_URL;
}

- (NSString)label
{
  return self->_label;
}

- (NSData)iconData
{
  return self->_iconData;
}

- (BOOL)isRemovable
{
  return self->_isRemovable;
}

- (BOOL)precomposed
{
  return self->_precomposed;
}

- (BOOL)fullScreen
{
  return self->_fullScreen;
}

- (BOOL)ignoreManifestScope
{
  return self->_ignoreManifestScope;
}

- (NSString)contentMode
{
  return self->_contentMode;
}

- (NSString)targetApplicationBundleIdentifier
{
  return self->_targetApplicationBundleIdentifier;
}

- (void)setTargetApplicationBundleIdentifier:(id)a3
{
}

- (NSString)savedIdentifier
{
  return self->_savedIdentifier;
}

- (void)setSavedIdentifier:(id)a3
{
}

- (NSNumber)isRemovableNum
{
  return self->_isRemovableNum;
}

- (NSNumber)precomposedNum
{
  return self->_precomposedNum;
}

- (NSNumber)fullScreenNum
{
  return self->_fullScreenNum;
}

- (NSNumber)ignoreManifestScopeNum
{
  return self->_ignoreManifestScopeNum;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignoreManifestScopeNum, 0);
  objc_storeStrong((id *)&self->_fullScreenNum, 0);
  objc_storeStrong((id *)&self->_precomposedNum, 0);
  objc_storeStrong((id *)&self->_isRemovableNum, 0);
  objc_storeStrong((id *)&self->_savedIdentifier, 0);
  objc_storeStrong((id *)&self->_targetApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_contentMode, 0);
  objc_storeStrong((id *)&self->_iconData, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end