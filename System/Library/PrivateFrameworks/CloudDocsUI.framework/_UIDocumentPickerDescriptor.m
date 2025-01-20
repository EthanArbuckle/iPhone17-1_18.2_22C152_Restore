@interface _UIDocumentPickerDescriptor
+ ($115C4C562B26FF47E01F9F4EA65B5887)hostAuditToken;
+ (BOOL)isContentManaged;
+ (BOOL)isInAddToiCloudDrive;
+ (char)cloudEnabledStatus;
+ (char)cloudMigrationStatus;
+ (id)allPickers;
+ (id)allPickersForMode:(unint64_t)a3 documentTypes:(id)a4;
+ (id)defaultPickerIdentifierForMode:(unint64_t)a3 documentTypes:(id)a4;
+ (id)descriptorWithIdentifier:(id)a3;
+ (id)enabledPickersForMode:(unint64_t)a3 documentTypes:(id)a4;
+ (id)filteredPickersForPickers:(id)a3 filter:(unint64_t)a4;
+ (id)hostBundleID;
+ (id)manageablePickersForMode:(unint64_t)a3 documentTypes:(id)a4;
+ (id)pickerOrder;
+ (void)__updateCloudEnabledStatus;
+ (void)_updateCloudEnabledStatus;
+ (void)cloudMigrationStatus;
+ (void)setHostAuditToken:(id *)a3;
+ (void)setHostBundleID:(id)a3;
+ (void)setIsContentManaged:(BOOL)a3;
+ (void)setOrderFromPickers:(id)a3;
- (BOOL)enabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNewlyAdded;
- (BOOL)pickerEnabledForMode:(unint64_t)a3 documentTypes:(id)a4 reason:(id *)a5;
- (BOOL)supportsPickerMode:(unint64_t)a3;
- (NSArray)supportedContentTypes;
- (NSExtension)extension;
- (NSString)fileProviderDocumentGroup;
- (NSString)identifier;
- (NSString)localizedName;
- (NSString)nonUIIdentifier;
- (id)_extensionValueOfClass:(Class)a3 forKey:(id)a4;
- (id)_ownBundle;
- (id)_parentApp;
- (id)description;
- (id)imageWithScale:(double)a3;
- (id)nonUIBundle;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
- (void)setEnabled:(BOOL)a3;
- (void)setExtension:(id)a3;
- (void)setNewlyAdded:(BOOL)a3;
@end

@implementation _UIDocumentPickerDescriptor

+ (void)setHostBundleID:(id)a3
{
  if ((id)sHostBundleID != a3)
  {
    uint64_t v3 = [a3 copy];
    uint64_t v4 = sHostBundleID;
    sHostBundleID = v3;
    MEMORY[0x270F9A758](v3, v4);
  }
}

+ (id)hostBundleID
{
  return (id)sHostBundleID;
}

+ (void)setHostAuditToken:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0[4];
  sHostAuditToken = *(_OWORD *)a3->var0;
  *(_OWORD *)algn_2684E1FF0 = v3;
}

+ ($115C4C562B26FF47E01F9F4EA65B5887)hostAuditToken
{
  long long v3 = *(_OWORD *)algn_2684E1FF0;
  *(_OWORD *)retstr->var0 = sHostAuditToken;
  *(_OWORD *)&retstr->var0[4] = v3;
  return result;
}

+ (void)setIsContentManaged:(BOOL)a3
{
  sIsContentManaged = a3;
}

+ (BOOL)isContentManaged
{
  return sIsContentManaged;
}

+ (BOOL)isInAddToiCloudDrive
{
  v2 = [a1 hostBundleID];
  char v3 = [v2 isEqualToString:@"com.apple.CloudDocsUI.AddToiCloudDrive"];

  return v3;
}

+ (id)allPickers
{
  v57[1] = *MEMORY[0x263EF8340];
  int v34 = [a1 isInAddToiCloudDrive];
  v32 = [a1 pickerOrder];
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__0;
  v48 = __Block_byref_object_dispose__0;
  id v49 = 0;
  uint64_t v4 = (void *)MEMORY[0x263F08800];
  uint64_t v56 = *MEMORY[0x263F07FF8];
  v57[0] = @"com.apple.fileprovider-ui";
  v5 = [NSDictionary dictionaryWithObjects:v57 forKeys:&v56 count:1];
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __41___UIDocumentPickerDescriptor_allPickers__block_invoke;
  v41[3] = &unk_26492D2E8;
  v43 = &v44;
  dispatch_semaphore_t dsema = v3;
  dispatch_semaphore_t v42 = dsema;
  [v4 extensionsWithMatchingAttributes:v5 completion:v41];

  dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
  id v6 = (id)v45[5];
  v7 = [v6 valueForKeyPath:@"identifier"];
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x2050000000;
  v8 = (void *)getMCProfileConnectionClass_softClass;
  uint64_t v54 = getMCProfileConnectionClass_softClass;
  if (!getMCProfileConnectionClass_softClass)
  {
    v50[0] = MEMORY[0x263EF8330];
    v50[1] = 3221225472;
    v50[2] = __getMCProfileConnectionClass_block_invoke;
    v50[3] = &unk_26492CDB0;
    v50[4] = &v51;
    __getMCProfileConnectionClass_block_invoke((uint64_t)v50);
    v8 = (void *)v52[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v51, 8);
  v10 = [v9 sharedConnection];
  v11 = [a1 hostBundleID];
  v12 = objc_msgSend(v10, "allowedAppBundleIDsForBidirectionalDataMovementAfterApplyingFilterToBundleIDs:localAppBundleID:localAccountIsManaged:", v7, v11, objc_msgSend(a1, "isContentManaged"));

  id v33 = [MEMORY[0x263EFF980] array];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v13 = v6;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v37 objects:v55 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v38;
    uint64_t v16 = *MEMORY[0x263F1D878];
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v38 != v15) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        v19 = [v18 identifier];
        int v20 = [v12 containsObject:v19];

        if (v20)
        {
          v21 = [v18 identifier];
          char v22 = [v21 isEqualToString:@"com.apple.UIKit.fileprovider.default"];

          if ((v22 & 1) == 0)
          {
            if (!v34
              || ([v18 identifier],
                  v23 = objc_claimAutoreleasedReturnValue(),
                  int v24 = [v23 isEqualToString:v16],
                  v23,
                  v24))
            {
              v25 = objc_alloc_init(_UIDocumentPickerDescriptor);
              [(_UIDocumentPickerDescriptor *)v25 setExtension:v18];
              v26 = [(_UIDocumentPickerDescriptor *)v25 identifier];
              int v27 = [v26 isEqualToString:v16];

              if (v27)
              {
                [(_UIDocumentPickerDescriptor *)v25 setNewlyAdded:0];
              }
              else
              {
                v28 = [(_UIDocumentPickerDescriptor *)v25 identifier];
                -[_UIDocumentPickerDescriptor setNewlyAdded:](v25, "setNewlyAdded:", [v32 containsObject:v28] ^ 1);
              }
              [v33 addObject:v25];
            }
          }
        }
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v37 objects:v55 count:16];
    }
    while (v14);
  }

  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __41___UIDocumentPickerDescriptor_allPickers__block_invoke_2;
  v35[3] = &unk_26492D310;
  id v29 = v32;
  id v36 = v29;
  [v33 sortUsingComparator:v35];

  _Block_object_dispose(&v44, 8);

  return v33;
}

- (BOOL)pickerEnabledForMode:(unint64_t)a3 documentTypes:(id)a4 reason:(id *)a5
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v8 = a4;
  if ([(_UIDocumentPickerDescriptor *)self supportsPickerMode:a3])
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v9 = [(_UIDocumentPickerDescriptor *)self supportedContentTypes];
    uint64_t v28 = [v9 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v28)
    {
      uint64_t v10 = *(void *)v34;
      v26 = a5;
      uint64_t v27 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v34 != v10) {
            objc_enumerationMutation(v9);
          }
          CFStringRef v12 = *(const __CFString **)(*((void *)&v33 + 1) + 8 * i);
          long long v29 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          id v13 = v8;
          id v14 = v8;
          uint64_t v15 = [v14 countByEnumeratingWithState:&v29 objects:v37 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v30;
            while (2)
            {
              for (uint64_t j = 0; j != v16; ++j)
              {
                if (*(void *)v30 != v17) {
                  objc_enumerationMutation(v14);
                }
                CFStringRef v19 = *(const __CFString **)(*((void *)&v29 + 1) + 8 * j);
                if (a3 <= 1 && UTTypeConformsTo(v12, *(CFStringRef *)(*((void *)&v29 + 1) + 8 * j))
                  || UTTypeConformsTo(v19, v12))
                {

                  BOOL v23 = 1;
                  id v8 = v13;
                  goto LABEL_30;
                }
              }
              uint64_t v16 = [v14 countByEnumeratingWithState:&v29 objects:v37 count:16];
              if (v16) {
                continue;
              }
              break;
            }
          }

          id v8 = v13;
          uint64_t v10 = v27;
        }
        a5 = v26;
        uint64_t v28 = [v9 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v28);
    }

    int v20 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    v21 = v20;
    char v22 = @"Doesn’t support the file type";
LABEL_26:
    id v24 = [v20 localizedStringForKey:v22 value:v22 table:@"Localizable"];
    if (a5) {
      *a5 = v24;
    }
  }
  else
  {
    switch(a3)
    {
      case 0uLL:
        int v20 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
        v21 = v20;
        char v22 = @"Doesn’t support importing files";
        goto LABEL_26;
      case 1uLL:
        int v20 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
        v21 = v20;
        char v22 = @"Doesn’t support opening files";
        goto LABEL_26;
      case 2uLL:
        int v20 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
        v21 = v20;
        char v22 = @"Doesn’t support exporting files";
        goto LABEL_26;
      case 3uLL:
        int v20 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
        v21 = v20;
        char v22 = @"Doesn’t support moving files";
        goto LABEL_26;
      default:
        break;
    }
  }
  BOOL v23 = 0;
LABEL_30:

  return v23;
}

+ (id)allPickersForMode:(unint64_t)a3 documentTypes:(id)a4
{
  id v6 = a4;
  v7 = [a1 allPickers];
  id v8 = (void *)MEMORY[0x263F08A98];
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __63___UIDocumentPickerDescriptor_allPickersForMode_documentTypes___block_invoke;
  uint64_t v16 = &unk_26492D338;
  id v17 = v6;
  unint64_t v18 = a3;
  id v9 = v6;
  uint64_t v10 = [v8 predicateWithBlock:&v13];
  v11 = objc_msgSend(v7, "filteredArrayUsingPredicate:", v10, v13, v14, v15, v16);

  return v11;
}

+ (id)filteredPickersForPickers:(id)a3 filter:(unint64_t)a4
{
  id v5 = a3;
  if (!a4)
  {
    id v6 = &__block_literal_global_6;
    goto LABEL_5;
  }
  if (a4 == 1)
  {
    id v6 = &__block_literal_global_56;
LABEL_5:
    v7 = [MEMORY[0x263F08A98] predicateWithBlock:v6];
    id v8 = [v5 filteredArrayUsingPredicate:v7];

    goto LABEL_7;
  }
  id v8 = 0;
LABEL_7:

  return v8;
}

+ (id)enabledPickersForMode:(unint64_t)a3 documentTypes:(id)a4
{
  id v5 = [a1 allPickersForMode:a3 documentTypes:a4];
  id v6 = [a1 filteredPickersForPickers:v5 filter:0];

  return v6;
}

+ (id)manageablePickersForMode:(unint64_t)a3 documentTypes:(id)a4
{
  id v5 = [a1 allPickersForMode:a3 documentTypes:a4];
  id v6 = [a1 filteredPickersForPickers:v5 filter:1];

  return v6;
}

+ (id)defaultPickerIdentifierForMode:(unint64_t)a3 documentTypes:(id)a4
{
  uint64_t v4 = [a1 enabledPickersForMode:a3 documentTypes:a4];
  id v5 = [v4 firstObject];
  id v6 = [v5 identifier];

  return v6;
}

+ (id)descriptorWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [a1 allPickers];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __56___UIDocumentPickerDescriptor_descriptorWithIdentifier___block_invoke;
  v10[3] = &unk_26492D3A0;
  id v6 = v4;
  id v11 = v6;
  uint64_t v7 = [v5 indexOfObjectPassingTest:v10];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = 0;
  }
  else
  {
    id v8 = [v5 objectAtIndex:v7];
  }

  return v8;
}

+ (void)__updateCloudEnabledStatus
{
  _UIDocumentPickerCloudEnabledStatus = BRGetCloudEnabledStatusForAuditToken();
}

+ (void)_updateCloudEnabledStatus
{
  int v3 = _UIDocumentPickerCloudEnabledStatus;
  objc_msgSend(a1, "__updateCloudEnabledStatus");
  if (v3 != _UIDocumentPickerCloudEnabledStatus)
  {
    id v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 postNotificationName:@"_UIDocumentPickerDescriptorCloudEnabledStatusDidChange" object:a1];
  }
}

+ (char)cloudEnabledStatus
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49___UIDocumentPickerDescriptor_cloudEnabledStatus__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (cloudEnabledStatus_onceToken != -1) {
    dispatch_once(&cloudEnabledStatus_onceToken, block);
  }
  return _UIDocumentPickerCloudEnabledStatus;
}

+ (char)cloudMigrationStatus
{
  v2 = BRPrimaryiCloudAccountCopyStatus();
  id v3 = 0;
  if (!v2)
  {
    id v4 = cdui_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      +[_UIDocumentPickerDescriptor cloudMigrationStatus];
    }
  }
  id v5 = [v2 objectForKeyedSubscript:*MEMORY[0x263F322F8]];
  char v6 = [v5 integerValue];

  return v6;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIDocumentPickerDescriptor *)self identifier];
  uint64_t v6 = *MEMORY[0x263F1D878];
  char v7 = [v5 isEqualToString:*MEMORY[0x263F1D878]];

  if (v7)
  {
    int64_t v8 = -1;
  }
  else
  {
    id v9 = [v4 identifier];
    char v10 = [v9 isEqualToString:v6];

    if (v10)
    {
      int64_t v8 = 1;
    }
    else
    {
      id v11 = [(_UIDocumentPickerDescriptor *)self localizedName];
      CFStringRef v12 = [v4 localizedName];
      int64_t v8 = [v11 localizedCaseInsensitiveCompare:v12];
    }
  }

  return v8;
}

- (BOOL)supportsPickerMode:(unint64_t)a3
{
  if (a3 > 3) {
    id v3 = 0;
  }
  else {
    id v3 = off_26492D3D8[a3];
  }
  id v4 = [(_UIDocumentPickerDescriptor *)self _extensionValueOfClass:objc_opt_class() forKey:@"UIDocumentPickerModes"];
  char v5 = [v4 containsObject:v3];

  return v5;
}

- (id)_ownBundle
{
  v2 = (void *)MEMORY[0x263F018C0];
  id v3 = [(_UIDocumentPickerDescriptor *)self extension];
  id v4 = [v3 identifier];
  char v5 = [v2 pluginKitProxyForIdentifier:v4];

  return v5;
}

- (id)_parentApp
{
  v2 = [(_UIDocumentPickerDescriptor *)self _ownBundle];
  id v3 = [v2 containingBundle];

  return v3;
}

- (NSString)identifier
{
  id v3 = [(_UIDocumentPickerDescriptor *)self extension];
  id v4 = [v3 identifier];
  char v5 = (void *)*MEMORY[0x263F1D878];
  int v6 = [v4 isEqual:*MEMORY[0x263F1D878]];

  if (v6)
  {
    id v7 = v5;
  }
  else
  {
    int64_t v8 = [(_UIDocumentPickerDescriptor *)self _parentApp];
    id v7 = [v8 bundleIdentifier];
  }

  return (NSString *)v7;
}

- (id)nonUIBundle
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F01868];
  id v3 = [(_UIDocumentPickerDescriptor *)self _parentApp];
  id v4 = [v3 bundleURL];
  char v5 = [v2 applicationProxyForBundleURL:v4];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int v6 = objc_msgSend(v5, "plugInKitPlugins", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        CFStringRef v12 = [v11 objectForInfoDictionaryKey:@"NSExtensionPointIdentifier" ofClass:objc_opt_class() inScope:1];
        if ([v12 isEqualToString:@"com.apple.fileprovider-nonui"])
        {
          id v13 = v11;

          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  id v13 = 0;
LABEL_11:

  return v13;
}

- (NSString)fileProviderDocumentGroup
{
  v2 = [(_UIDocumentPickerDescriptor *)self nonUIBundle];
  id v3 = [v2 objectForInfoDictionaryKey:@"NSExtensionFileProviderDocumentGroup" ofClass:objc_opt_class() inScope:1];

  return (NSString *)v3;
}

- (NSString)nonUIIdentifier
{
  v2 = [(_UIDocumentPickerDescriptor *)self nonUIBundle];
  id v3 = [v2 bundleIdentifier];

  return (NSString *)v3;
}

- (NSString)localizedName
{
  id v3 = [(_UIDocumentPickerDescriptor *)self _ownBundle];
  id v4 = [v3 localizedName];

  if (!v4
    || ([(_UIDocumentPickerDescriptor *)self _ownBundle],
        char v5 = objc_claimAutoreleasedReturnValue(),
        [v5 bundleIdentifier],
        int v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v4 isEqualToString:v6],
        v6,
        v5,
        v7))
  {
    uint64_t v8 = [(_UIDocumentPickerDescriptor *)self _parentApp];
    uint64_t v9 = [v8 localizedName];

    id v4 = (void *)v9;
  }

  return (NSString *)v4;
}

- (id)imageWithScale:(double)a3
{
  char v5 = [(_UIDocumentPickerDescriptor *)self identifier];
  int v6 = [v5 isEqualToString:*MEMORY[0x263F1D878]];

  int v7 = (void *)MEMORY[0x263F1C6B0];
  if (v6)
  {
    uint64_t v8 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    uint64_t v9 = [v7 imageNamed:@"OpeniCloud" inBundle:v8];
    [v9 imageWithRenderingMode:2];
  }
  else
  {
    uint64_t v8 = [(_UIDocumentPickerDescriptor *)self _parentApp];
    uint64_t v9 = [v8 bundleIdentifier];
    [v7 _applicationIconImageForBundleIdentifier:v9 format:0 scale:a3];
  char v10 = };

  return v10;
}

- (id)_extensionValueOfClass:(Class)a3 forKey:(id)a4
{
  id v5 = a4;
  int v6 = [(_UIDocumentPickerDescriptor *)self extension];
  int v7 = [v6 attributes];
  uint64_t v8 = [v7 objectForKey:v5];

  if (v8 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __61___UIDocumentPickerDescriptor__extensionValueOfClass_forKey___block_invoke;
    v11[3] = &unk_26492CCC8;
    v11[4] = self;
    id v12 = v5;
    if (_extensionValueOfClass_forKey__onceToken != -1) {
      dispatch_once(&_extensionValueOfClass_forKey__onceToken, v11);
    }

    id v9 = 0;
  }
  else
  {
    id v9 = v8;
  }

  return v9;
}

- (NSArray)supportedContentTypes
{
  v7[1] = *MEMORY[0x263EF8340];
  v2 = [(_UIDocumentPickerDescriptor *)self _extensionValueOfClass:objc_opt_class() forKey:@"UIDocumentPickerSupportedFileTypes"];
  id v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    v7[0] = *MEMORY[0x263F01A00];
    id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  }
  id v5 = v4;

  return (NSArray *)v5;
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(_UIDocumentPickerDescriptor *)self extension];
  id v5 = v4;
  if (v3) {
    [v4 attemptOptIn:0];
  }
  else {
    [v4 attemptOptOut:0];
  }
}

- (BOOL)enabled
{
  BOOL v3 = [(_UIDocumentPickerDescriptor *)self identifier];
  int v4 = [v3 isEqualToString:*MEMORY[0x263F1D878]];

  if (v4)
  {
    if ([(id)objc_opt_class() cloudEnabledStatus] != 1) {
      return 0;
    }
    id v5 = [MEMORY[0x263F32588] allContainersByContainerID];
    int v6 = [v5 objectForKey:*MEMORY[0x263F324E8]];

    char v7 = v6 != 0;
  }
  else
  {
    int v6 = [(_UIDocumentPickerDescriptor *)self extension];
    char v7 = [v6 optedIn];
  }

  return v7;
}

+ (id)pickerOrder
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.UIKit"];
  BOOL v3 = [v2 objectForKey:@"_UIDocumentPickerSettings"];
  int v4 = [v3 objectForKey:@"order"];
  id v5 = (void *)[v4 mutableCopy];
  int v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [MEMORY[0x263EFF980] array];
  }
  uint64_t v8 = v7;

  uint64_t v9 = *MEMORY[0x263F1D878];
  [v8 removeObject:*MEMORY[0x263F1D878]];
  [v8 insertObject:v9 atIndex:0];

  return v8;
}

+ (void)setOrderFromPickers:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = [a1 allPickers];
  }
  id v12 = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.UIKit"];
  int v6 = [v5 objectForKey:@"_UIDocumentPickerSettings"];
  id v7 = (void *)[v6 mutableCopy];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [MEMORY[0x263EFF9A0] dictionary];
  }
  char v10 = v9;

  id v11 = [v12 valueForKey:@"identifier"];
  [v10 setObject:v11 forKey:@"order"];
  [v5 setObject:v10 forKey:@"_UIDocumentPickerSettings"];
}

- (unint64_t)hash
{
  v2 = [(_UIDocumentPickerDescriptor *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(_UIDocumentPickerDescriptor *)self identifier];
    int v6 = [v4 identifier];
    if (v5 == v6) {
      char v7 = 1;
    }
    else {
      char v7 = [v5 isEqualToString:v6];
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(_UIDocumentPickerDescriptor *)self localizedName];
  BOOL v6 = [(_UIDocumentPickerDescriptor *)self enabled];
  char v7 = @"disabled";
  if (v6) {
    char v7 = @"enabled";
  }
  uint64_t v8 = [v3 stringWithFormat:@"<%@: %p> %@, %@", v4, self, v5, v7];

  return v8;
}

- (BOOL)isNewlyAdded
{
  return self->_newlyAdded;
}

- (void)setNewlyAdded:(BOOL)a3
{
  self->_newlyAdded = a3;
}

- (NSExtension)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (void)cloudMigrationStatus
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_22CA47000, a2, OS_LOG_TYPE_FAULT, "[ERROR] Could not get iCloud account status: %@", (uint8_t *)&v2, 0xCu);
}

@end