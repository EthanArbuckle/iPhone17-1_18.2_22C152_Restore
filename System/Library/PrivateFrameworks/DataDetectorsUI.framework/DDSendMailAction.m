@interface DDSendMailAction
+ (id)matchingSchemes;
- (BOOL)canBePerformedByOpeningURL;
- (BOOL)menuItemNameCanFallbackToServiceName;
- (id)_serviceIdentifier;
- (id)compactTitle;
- (id)extractedActionSubtitle;
- (id)handleString;
- (id)iconName;
- (id)localizedName;
- (id)notificationIconBundleIdentifier;
- (id)notificationTitle;
- (id)notificationURL;
- (int)interactionType;
- (uint64_t)displayNameForEmails:(void *)a3 phoneNumbers:;
- (void)performFromView:(id)a3;
@end

@implementation DDSendMailAction

+ (id)matchingSchemes
{
  return &unk_1EF510CB0;
}

- (id)handleString
{
  return [(NSURL *)self->super._url absoluteString];
}

- (id)_serviceIdentifier
{
  return @"default.mail.service";
}

- (BOOL)menuItemNameCanFallbackToServiceName
{
  return 1;
}

- (id)extractedActionSubtitle
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (dd_isLSTrusted())
  {
    v2 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    id v9 = 0;
    v3 = [v2 defaultApplicationForCategory:2 error:&v9];
    id v4 = v9;

    if (v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      v5 = [MEMORY[0x1E4F28B50] mainBundle];
      v6 = [v5 bundleIdentifier];
      *(_DWORD *)buf = 138412546;
      v11 = v6;
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Couldn't get default email app from %@. Error: %@", buf, 0x16u);
    }
  }
  else
  {
    id v4 = 0;
    v3 = 0;
  }
  v7 = [v3 localizedName];

  return v7;
}

- (id)localizedName
{
  return DDLocalizedString(@"Email");
}

- (id)iconName
{
  return @"envelope";
}

- (uint64_t)displayNameForEmails:(void *)a3 phoneNumbers:
{
  v47[1] = *MEMORY[0x1E4F143B8];
  id v23 = a2;
  id v22 = a3;
  if (!a1
    || (dd_isDeviceLocked() & 1) != 0
    || [MEMORY[0x1E4F1B980] authorizationStatusForEntityType:0] != 3)
  {
    goto LABEL_22;
  }
  id v26 = objc_alloc_init(MEMORY[0x1E4F1B980]);
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__3;
  v43 = __Block_byref_object_dispose__3;
  id v44 = 0;
  id v5 = objc_alloc(MEMORY[0x1E4F1B908]);
  v6 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
  v47[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:1];
  v8 = (void *)[v5 initWithKeysToFetch:v7];

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  obuint64_t j = v23;
  uint64_t v9 = [obj countByEnumeratingWithState:&v35 objects:v46 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v36;
    uint64_t v11 = MEMORY[0x1E4F143A8];
    v6 = &v39;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v36 != v10) {
          objc_enumerationMutation(obj);
        }
        id v13 = objc_msgSend(MEMORY[0x1E4F1B8F8], "predicateForContactsMatchingEmailAddress:", *(void *)(*((void *)&v35 + 1) + 8 * i), v22);
        [v8 setPredicate:v13];

        v33[4] = &v39;
        uint64_t v34 = 0;
        v33[0] = v11;
        v33[1] = 3221225472;
        v33[2] = __54__DDSendMailAction_displayNameForEmails_phoneNumbers___block_invoke;
        v33[3] = &unk_1E5A85B10;
        [v26 enumerateContactsWithFetchRequest:v8 error:&v34 usingBlock:v33];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v35 objects:v46 count:16];
    }
    while (v9);
  }

  uint64_t v14 = v40[5];
  if (v14) {
    goto LABEL_20;
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obja = v22;
  uint64_t v15 = [obja countByEnumeratingWithState:&v29 objects:v45 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v30;
    uint64_t v17 = MEMORY[0x1E4F143A8];
    v6 = &v39;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v30 != v16) {
          objc_enumerationMutation(obja);
        }
        v19 = objc_msgSend(MEMORY[0x1E4F1B8F8], "predicateForContactsMatchingPhoneNumber:", *(void *)(*((void *)&v29 + 1) + 8 * j), v22);
        [v8 setPredicate:v19];

        v27[4] = &v39;
        uint64_t v28 = 0;
        v27[0] = v17;
        v27[1] = 3221225472;
        v27[2] = __54__DDSendMailAction_displayNameForEmails_phoneNumbers___block_invoke_2;
        v27[3] = &unk_1E5A85B10;
        [v26 enumerateContactsWithFetchRequest:v8 error:&v28 usingBlock:v27];
      }
      uint64_t v15 = [obja countByEnumeratingWithState:&v29 objects:v45 count:16];
    }
    while (v15);
  }

  uint64_t v14 = v40[5];
  if (v14)
  {
LABEL_20:
    objc_msgSend(MEMORY[0x1E4F1B910], "stringFromContact:style:", v14, 0, v22);
    v6 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    char v20 = 0;
  }
  else
  {
    char v20 = 1;
  }

  _Block_object_dispose(&v39, 8);
  if (v20) {
LABEL_22:
  }
    v6 = 0;

  return v6;
}

void __54__DDSendMailAction_displayNameForEmails_phoneNumbers___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
}

void __54__DDSendMailAction_displayNameForEmails_phoneNumbers___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
}

- (id)compactTitle
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v3 = [(NSURL *)self->super._url dd_emailFromMailtoScheme];
  id v4 = objc_msgSend(v3, "dd_userFriendlyEmail");

  if ([v4 length])
  {
    v11[0] = v4;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    v6 = -[DDSendMailAction displayNameForEmails:phoneNumbers:]((uint64_t)self, v5, 0);

    if ([v6 length]) {
      v7 = v6;
    }
    else {
      v7 = v4;
    }
    id v8 = v7;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)DDSendMailAction;
    id v8 = [(DDAction *)&v10 compactTitle];
  }

  return v8;
}

- (id)notificationTitle
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v3 = [(NSURL *)self->super._url dd_emailFromMailtoScheme];
  id v4 = objc_msgSend(v3, "dd_userFriendlyEmail");

  if ([v4 length])
  {
    v13[0] = v4;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    v6 = -[DDSendMailAction displayNameForEmails:phoneNumbers:]((uint64_t)self, v5, 0);

    uint64_t v7 = [v6 length];
    id v8 = NSString;
    if (v7)
    {
      uint64_t v9 = DDLocalizedString(@"Compose an email to %@ (%@) in Mail");
      objc_msgSend(v8, "stringWithFormat:", v9, v6, v4);
    }
    else
    {
      uint64_t v9 = DDLocalizedString(@"Compose an email to “%@” in Mail");
      objc_msgSend(v8, "stringWithFormat:", v9, v4, v12);
    objc_super v10 = };
  }
  else
  {
    objc_super v10 = 0;
  }

  return v10;
}

- (id)notificationIconBundleIdentifier
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (dd_isLSTrusted())
  {
    v2 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    id v11 = 0;
    v3 = [v2 defaultApplicationForCategory:2 error:&v11];
    id v4 = v11;

    if (v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [MEMORY[0x1E4F28B50] mainBundle];
      v6 = [v5 bundleIdentifier];
      *(_DWORD *)buf = 138412546;
      id v13 = v6;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Couldn't get default email app from %@. Error: %@", buf, 0x16u);
    }
  }
  else
  {
    id v4 = 0;
    v3 = 0;
  }
  uint64_t v7 = [v3 bundleIdentifier];
  id v8 = v7;
  if (!v7) {
    uint64_t v7 = @"com.apple.mobilemail";
  }
  uint64_t v9 = v7;

  return v9;
}

- (id)notificationURL
{
  return self->super._url;
}

- (int)interactionType
{
  return 0;
}

- (void)performFromView:(id)a3
{
}

- (BOOL)canBePerformedByOpeningURL
{
  return 1;
}

@end