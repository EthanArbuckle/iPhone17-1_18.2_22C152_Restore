@interface DOCPickerSource
- (BOOL)isEqual:(id)a3;
- (BOOL)isExtensionOptedIn;
- (BOOL)isValidForConfiguration:(id)a3;
- (BOOL)supportsInteractionMode:(unint64_t)a3;
- (BOOL)useEnumeration;
- (DOCPickerSource)initWithPicker:(id)a3 providerDomain:(id)a4;
- (DOCPickerSource)initWithTitle:(id)a3 attributes:(id)a4 optedIn:(BOOL)a5 identifier:(id)a6 providerDomain:(id)a7 pickerExtension:(id)a8;
- (FPProviderDomain)providerDomain;
- (NSArray)supportedInteractionModes;
- (NSExtension)pickerExtension;
- (NSString)fileProviderDocumentGroup;
- (NSString)hostApplicationBundleIdentifier;
- (id)loadIconForSize:(int64_t)a3;
- (unint64_t)status;
- (void)setIsExtensionOptedIn:(BOOL)a3;
- (void)setPickerExtension:(id)a3;
- (void)setProviderDomain:(id)a3;
- (void)setSupportedInteractionModes:(id)a3;
@end

@implementation DOCPickerSource

- (DOCPickerSource)initWithPicker:(id)a3 providerDomain:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc((Class)LSApplicationExtensionRecord);
  v10 = [v7 identifier];
  id v11 = [v9 initWithBundleIdentifier:v10 error:0];

  v12 = [v11 localizedName];
  v13 = [v7 attributes];
  id v14 = [v7 optedIn];
  v15 = [v11 bundleIdentifier];

  if (v15)
  {
    v16 = [v11 bundleIdentifier];
  }
  else
  {
    v17 = +[NSAssertionHandler currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"DOCPickerSource.m" lineNumber:54 description:@"Picker doesn't have an identifier"];

    v16 = 0;
  }
  v18 = [(DOCPickerSource *)self initWithTitle:v12 attributes:v13 optedIn:v14 identifier:v16 providerDomain:v8 pickerExtension:v7];

  return v18;
}

- (DOCPickerSource)initWithTitle:(id)a3 attributes:(id)a4 optedIn:(BOOL)a5 identifier:(id)a6 providerDomain:(id)a7 pickerExtension:(id)a8
{
  uint64_t v11 = a5;
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v48.receiver = self;
  v48.super_class = (Class)DOCPickerSource;
  v19 = [(DOCPickerSource *)&v48 init];
  v20 = v19;
  if (v19)
  {
    [(DOCPickerSource *)v19 setProviderDomain:v17];
    [(DOCPickerSource *)v20 setPickerExtension:v18];
    [(DOCPickerSource *)v20 setDisplayName:v14];
    [(DOCPickerSource *)v20 setProviderName:v14];
    [(DOCPickerSource *)v20 setIdentifier:v16];
    v21 = [v15 objectForKeyedSubscript:@"UIDocumentPickerModes"];
    v22 = v21;
    if (v21)
    {
      unsigned int v40 = v11;
      id v41 = v16;
      id v42 = v15;
      id v43 = v14;
      v23 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v21 count]);
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      v39 = v22;
      id v24 = v22;
      id v25 = [v24 countByEnumeratingWithState:&v44 objects:v50 count:16];
      if (v25)
      {
        id v26 = v25;
        uint64_t v27 = *(void *)v45;
        do
        {
          for (i = 0; i != v26; i = (char *)i + 1)
          {
            if (*(void *)v45 != v27) {
              objc_enumerationMutation(v24);
            }
            v29 = *(void **)(*((void *)&v44 + 1) + 8 * i);
            unsigned __int8 v30 = objc_msgSend(v29, "isEqualToString:", @"UIDocumentPickerModeImport", v39);
            v31 = &off_1005CD430;
            if ((v30 & 1) == 0)
            {
              unsigned __int8 v32 = [v29 isEqualToString:@"UIDocumentPickerModeOpen"];
              v31 = &off_1005CD448;
              if ((v32 & 1) == 0)
              {
                unsigned __int8 v33 = [v29 isEqualToString:@"UIDocumentPickerModeExportToService"];
                v31 = &off_1005CD460;
                if ((v33 & 1) == 0)
                {
                  unsigned int v34 = [v29 isEqualToString:@"UIDocumentPickerModeMoveToService"];
                  v31 = &off_1005CD478;
                  if (!v34) {
                    continue;
                  }
                }
              }
            }
            [v23 addObject:v31];
          }
          id v26 = [v24 countByEnumeratingWithState:&v44 objects:v50 count:16];
        }
        while (v26);
      }

      [(DOCPickerSource *)v20 setSupportedInteractionModes:v23];
      id v15 = v42;
      id v14 = v43;
      id v16 = v41;
      uint64_t v11 = v40;
      v22 = v39;
    }
    else
    {
      [(DOCPickerSource *)v20 setSupportedInteractionModes:&__NSArray0__struct];
    }
    -[DOCPickerSource setIsExtensionOptedIn:](v20, "setIsExtensionOptedIn:", v11, v39);
    v35 = [v15 objectForKeyedSubscript:@"UIDocumentPickerSupportedFileTypes"];
    if (!v35
      || (+[UTType doc_contentTypesForIdentifiers:v35],
          (uint64_t v36 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      v49[0] = UTTypeContent;
      v49[1] = UTTypeItem;
      uint64_t v36 = +[NSArray arrayWithObjects:v49 count:2];
    }
    v37 = (void *)v36;
    [(DOCPickerSource *)v20 setDocumentContentTypes:v36];
  }
  return v20;
}

- (NSString)hostApplicationBundleIdentifier
{
  hostApplicationBundleIdentifier = self->_hostApplicationBundleIdentifier;
  if (!hostApplicationBundleIdentifier)
  {
    v4 = [(DOCPickerSource *)self pickerExtension];
    v5 = [v4 identifier];

    id v6 = [objc_alloc((Class)LSApplicationExtensionRecord) initWithBundleIdentifier:v5 error:0];
    id v7 = [v6 containingBundleRecord];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = [v7 bundleIdentifier];
      id v9 = self->_hostApplicationBundleIdentifier;
      self->_hostApplicationBundleIdentifier = v8;
    }
    hostApplicationBundleIdentifier = self->_hostApplicationBundleIdentifier;
  }
  return hostApplicationBundleIdentifier;
}

- (NSString)fileProviderDocumentGroup
{
  if (!self->_loadedFileProviderDocumentGroup)
  {
    self->_loadedFileProviderDocumentGroup = 1;
    v3 = [(DOCPickerSource *)self providerDomain];
    v4 = [v3 extensionBundleIdentifier];

    id v5 = [objc_alloc((Class)LSApplicationExtensionRecord) initWithBundleIdentifier:v4 error:0];
    id v6 = [v5 infoDictionary];
    id v7 = [v6 objectForKey:@"NSExtensionFileProviderDocumentGroup" ofClass:objc_opt_class()];
    fileProviderDocumentGroup = self->_fileProviderDocumentGroup;
    self->_fileProviderDocumentGroup = v7;
  }
  id v9 = self->_fileProviderDocumentGroup;
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DOCPickerSource;
  if ([(DOCPickerSource *)&v8 isEqual:v4])
  {
    unsigned int v5 = [v4 isExtensionOptedIn];
    unsigned int v6 = v5 ^ [(DOCPickerSource *)self isExtensionOptedIn] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)useEnumeration
{
  return 0;
}

- (id)loadIconForSize:(int64_t)a3
{
  unsigned int v5 = objc_opt_class();
  unsigned int v6 = [(DOCPickerSource *)self hostApplicationBundleIdentifier];
  id v7 = [v5 applicationIconForBundleIdentifier:v6 size:a3];

  return v7;
}

- (BOOL)isValidForConfiguration:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(NSExtension *)self->_pickerExtension attributes];
  unsigned int v6 = [v5 valueForKey:@"UIDocumentPickerVisibilityUserManageable"];

  id v7 = [(DOCPickerSource *)self pickerExtension];
  objc_super v8 = [v7 identifier];
  unsigned __int8 v9 = [v8 isEqualToString:_UIDocumentPickerDefaultIdentifier];

  if ((v9 & 1) != 0
    || [v4 forPickingDocuments]
    && !-[DOCPickerSource supportsInteractionMode:](self, "supportsInteractionMode:", [v4 interactionMode]))
  {
    BOOL v10 = 0;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)DOCPickerSource;
    BOOL v10 = [(DOCPickerSource *)&v12 isValidForConfiguration:v4];
  }

  return v10;
}

- (BOOL)supportsInteractionMode:(unint64_t)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(DOCPickerSource *)self supportedInteractionModes];
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v11 + 1) + 8 * i) unsignedIntegerValue] == (id)a3)
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (unint64_t)status
{
  return [(DOCPickerSource *)self isExtensionOptedIn] ^ 1;
}

- (NSExtension)pickerExtension
{
  return (NSExtension *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPickerExtension:(id)a3
{
}

- (BOOL)isExtensionOptedIn
{
  return self->_isExtensionOptedIn;
}

- (void)setIsExtensionOptedIn:(BOOL)a3
{
  self->_isExtensionOptedIn = a3;
}

- (FPProviderDomain)providerDomain
{
  return (FPProviderDomain *)objc_getProperty(self, a2, 48, 1);
}

- (void)setProviderDomain:(id)a3
{
}

- (NSArray)supportedInteractionModes
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSupportedInteractionModes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedInteractionModes, 0);
  objc_storeStrong((id *)&self->_providerDomain, 0);
  objc_storeStrong((id *)&self->_pickerExtension, 0);
  objc_storeStrong((id *)&self->_fileProviderDocumentGroup, 0);
  objc_storeStrong((id *)&self->_hostApplicationBundleIdentifier, 0);
}

@end