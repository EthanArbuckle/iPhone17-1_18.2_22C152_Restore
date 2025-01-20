@interface LPiCloudSharingMetadataProviderSpecialization
+ (id)normalizeKind:(id)a3 forApplication:(id)a4;
+ (id)specializedMetadataProviderForURLWithContext:(id)a3;
+ (unint64_t)specialization;
- (BOOL)canRetrieveThumbnailForApplication:(id)a3;
- (BOOL)canUseCloudKit;
- (LPiCloudSharingMetadataProviderSpecialization)initWithContext:(id)a3 applicationFromURL:(id)a4 kindFromURL:(id)a5 titleFromURL:(id)a6;
- (id)applicationFromBundleIdentifiers:(id)a3 containerIdentifier:(id)a4;
- (id)iconFromShare:(id)a3;
- (void)cancel;
- (void)completeRetrievingThumbnailForShareMetadata:(id)a3 application:(id)a4 kind:(id)a5 title:(id)a6;
- (void)completeUsingApplication:(id)a3 kind:(id)a4 title:(id)a5 thumbnail:(id)a6;
- (void)completeWithShareMetadata:(id)a3 bundleIDs:(id)a4;
- (void)fail;
- (void)start;
@end

@implementation LPiCloudSharingMetadataProviderSpecialization

+ (unint64_t)specialization
{
  return 4;
}

+ (id)specializedMetadataProviderForURLWithContext:(id)a3
{
  id v3 = a3;
  v4 = [v3 postRedirectURL];
  BOOL v5 = +[LPPresentationSpecializations isiCloudSharingURL:v4];

  if (v5)
  {
    v6 = [v3 postRedirectURL];
    v7 = +[LPiCloudSharingMetadata extractApplicationFromURL:v6];

    if (objc_msgSend(v7, "_lp_isEqualIgnoringCase:", @"photos"))
    {
      v8 = 0;
    }
    else
    {
      v9 = [v3 postRedirectURL];
      v10 = +[LPiCloudSharingMetadata extractKindFromURL:v9];

      v11 = [v3 postRedirectURL];
      v12 = +[LPiCloudSharingMetadata extractTitleFromURL:v11];

      v8 = [[LPiCloudSharingMetadataProviderSpecialization alloc] initWithContext:v3 applicationFromURL:v7 kindFromURL:v10 titleFromURL:v12];
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)canUseCloudKit
{
  id v3 = +[LPiCloudSharingMetadata _applicationNameMap];
  v4 = [v3 objectForKeyedSubscript:self->_applicationFromURL];

  BOOL v5 = [(id)objc_opt_class() normalizeKind:self->_kindFromURL forApplication:v4];
  if (([v5 isEqualToString:@"Template"] & 1) != 0
    || [v4 isEqualToString:@"Freeform"]
    && ([v5 isEqualToString:@"Copy"] & 1) != 0)
  {
    BOOL v6 = 0;
  }
  else
  {
    v7 = LPValueForEntitlement((void *)*MEMORY[0x1E4F1A598]);
    objc_opt_class();
    BOOL v6 = (objc_opt_isKindOfClass() & 1) != 0 && ([v7 containsObject:*MEMORY[0x1E4F1A590]] & 1) != 0;
  }
  return v6;
}

- (LPiCloudSharingMetadataProviderSpecialization)initWithContext:(id)a3 applicationFromURL:(id)a4 kindFromURL:(id)a5 titleFromURL:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)LPiCloudSharingMetadataProviderSpecialization;
  v14 = [(LPMetadataProviderSpecialization *)&v20 initWithContext:v10];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_applicationFromURL, a4);
    objc_storeStrong((id *)&v15->_kindFromURL, a5);
    objc_storeStrong((id *)&v15->_titleFromURL, a6);
    if ([(LPiCloudSharingMetadataProviderSpecialization *)v15 canUseCloudKit])
    {
      uint64_t v16 = [MEMORY[0x1E4F19EC8] containerWithIdentifier:@"com.apple.cloudkit"];
      baseContainer = v15->_baseContainer;
      v15->_baseContainer = (CKContainer *)v16;
    }
    v18 = v15;
  }

  return v15;
}

- (id)applicationFromBundleIdentifiers:(id)a3 containerIdentifier:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = +[LPiCloudSharingMetadata _bundleIdentifierMap];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __102__LPiCloudSharingMetadataProviderSpecialization_applicationFromBundleIdentifiers_containerIdentifier___block_invoke;
  v28[3] = &unk_1E5B06AF0;
  id v8 = v5;
  id v29 = v8;
  v9 = [v7 keysOfEntriesPassingTest:v28];
  id v10 = [v9 anyObject];

  if (v10)
  {
    id v11 = v10;
  }
  else
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v12 = v8;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v30 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v12);
          }
          uint64_t v16 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          id v17 = objc_alloc(MEMORY[0x1E4F223C8]);
          v18 = objc_msgSend(v17, "initWithBundleIdentifier:allowPlaceholder:error:", v16, 1, 0, (void)v24);
          v19 = [v18 localizedName];
          if (v19)
          {
            id v11 = v19;

            goto LABEL_15;
          }
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v30 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

    objc_super v20 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v6 allowPlaceholder:1 error:0];
    v21 = [v20 localizedName];
    id v11 = v21;
    if (v21) {
      id v22 = v21;
    }
  }
LABEL_15:

  return v11;
}

uint64_t __102__LPiCloudSharingMetadataProviderSpecialization_applicationFromBundleIdentifiers_containerIdentifier___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "containsObject:");
  if (result) {
    *a4 = 1;
  }
  return result;
}

+ (id)normalizeKind:(id)a3 forApplication:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (![v6 isEqualToString:@"Reminders"]) {
    goto LABEL_14;
  }
  if (!v5)
  {
    v7 = @"Shared List";
    goto LABEL_11;
  }
  if (objc_msgSend(v5, "_lp_isEqualIgnoringCase:", @"template"))
  {
    v7 = @"Template";
  }
  else
  {
LABEL_14:
    if ([v6 isEqualToString:@"Freeform"])
    {
      if (objc_msgSend(v5, "_lp_isEqualIgnoringCase:", @"copy")) {
        v7 = @"Copy";
      }
      else {
        v7 = 0;
      }
    }
    else
    {
      v7 = 0;
    }
  }
LABEL_11:

  return v7;
}

- (id)iconFromShare:(id)a3
{
  id v3 = a3;
  uint64_t v4 = *MEMORY[0x1E4F19DC0];
  id v5 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F19DC0]];
  if (v5)
  {
    id v6 = [LPImage alloc];
    v7 = [v3 objectForKeyedSubscript:v4];
    id v8 = [(LPImage *)v6 initWithData:v7 MIMEType:@"image/png"];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)start
{
}

uint64_t __54__LPiCloudSharingMetadataProviderSpecialization_start__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeUsingApplication:*(void *)(a1 + 40) kind:*(void *)(a1 + 48) title:*(void *)(*(void *)(a1 + 32) + 40) thumbnail:0];
}

void __54__LPiCloudSharingMetadataProviderSpecialization_start__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__LPiCloudSharingMetadataProviderSpecialization_start__block_invoke_3;
  block[3] = &unk_1E5B05AF8;
  block[4] = *(void *)(a1 + 32);
  id v10 = v6;
  id v11 = v5;
  id v7 = v5;
  id v8 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __54__LPiCloudSharingMetadataProviderSpecialization_start__block_invoke_3(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 64))
  {
    uint64_t v2 = a1 + 40;
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = LPLogChannelFetching();
    id v5 = v4;
    if (v3)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
        __54__LPiCloudSharingMetadataProviderSpecialization_start__block_invoke_3_cold_2(v2, v5, v6, v7, v8, v9, v10, v11);
      }
      [*(id *)(a1 + 32) fail];
    }
    else
    {
      id v12 = v4;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v13 = [*(id *)(a1 + 48) containerIdentifier];
        __54__LPiCloudSharingMetadataProviderSpecialization_start__block_invoke_3_cold_1(v13, buf, v12);
      }

      uint64_t v14 = (void *)MEMORY[0x1E4F19EC8];
      v15 = [*(id *)(a1 + 48) containerIdentifier];
      uint64_t v16 = [v14 containerWithIdentifier:v15];
      uint64_t v17 = *(void *)(a1 + 32);
      v18 = *(void **)(v17 + 56);
      *(void *)(v17 + 56) = v16;

      id v19 = objc_alloc_init(MEMORY[0x1E4F1A108]);
      uint64_t v20 = MEMORY[0x1E4F143A8];
      uint64_t v21 = 3221225472;
      id v22 = __54__LPiCloudSharingMetadataProviderSpecialization_start__block_invoke_43;
      v23 = &unk_1E5B06B18;
      uint64_t v24 = *(void *)(a1 + 32);
      id v25 = *(id *)(a1 + 48);
      [v19 setFetchWhitelistedBundleIDsCompletionBlock:&v20];
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "addOperation:", v19, v20, v21, v22, v23, v24);
    }
  }
}

void __54__LPiCloudSharingMetadataProviderSpecialization_start__block_invoke_43(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__LPiCloudSharingMetadataProviderSpecialization_start__block_invoke_2_44;
  v10[3] = &unk_1E5B05470;
  uint64_t v7 = *(void **)(a1 + 40);
  v10[4] = *(void *)(a1 + 32);
  id v11 = v6;
  id v12 = v5;
  id v13 = v7;
  id v8 = v5;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v10);
}

uint64_t __54__LPiCloudSharingMetadataProviderSpecialization_start__block_invoke_2_44(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(result + 32) + 64))
  {
    uint64_t v1 = result;
    uint64_t v2 = result + 40;
    uint64_t v3 = *(void *)(result + 40);
    uint64_t v4 = LPLogChannelFetching();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
    if (v3)
    {
      if (v5) {
        __54__LPiCloudSharingMetadataProviderSpecialization_start__block_invoke_2_44_cold_2(v2, v4, v6, v7, v8, v9, v10, v11);
      }
      return [*(id *)(v1 + 32) fail];
    }
    else
    {
      if (v5) {
        __54__LPiCloudSharingMetadataProviderSpecialization_start__block_invoke_2_44_cold_1(v1, v4, v6, v7, v8, v9, v10, v11);
      }
      return [*(id *)(v1 + 32) completeWithShareMetadata:*(void *)(v1 + 56) bundleIDs:*(void *)(v1 + 48)];
    }
  }
  return result;
}

- (void)completeWithShareMetadata:(id)a3 bundleIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = LPLogChannelFetching();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[LPiCloudSharingMetadataProviderSpecialization completeWithShareMetadata:bundleIDs:](v8, v9, v10, v11, v12, v13, v14, v15);
  }
  uint64_t v16 = +[LPiCloudSharingMetadata _applicationNameMap];
  uint64_t v17 = [v16 objectForKeyedSubscript:self->_applicationFromURL];

  v18 = [(id)objc_opt_class() normalizeKind:self->_kindFromURL forApplication:v17];
  id v19 = [v6 share];
  uint64_t v20 = [v19 objectForKeyedSubscript:*MEMORY[0x1E4F19DC8]];

  if (v17)
  {
    if ([(LPiCloudSharingMetadataProviderSpecialization *)self canRetrieveThumbnailForApplication:v17])
    {
      [(LPiCloudSharingMetadataProviderSpecialization *)self completeRetrievingThumbnailForShareMetadata:v6 application:v17 kind:v18 title:v20];
    }
    else
    {
      [(LPiCloudSharingMetadataProviderSpecialization *)self completeUsingApplication:v17 kind:v18 title:v20 thumbnail:0];
    }
  }
  else
  {
    uint64_t v21 = objc_alloc_init(LPiCloudSharingMetadata);
    id v22 = [v6 containerIdentifier];
    v23 = [(LPiCloudSharingMetadataProviderSpecialization *)self applicationFromBundleIdentifiers:v7 containerIdentifier:v22];
    [(LPiCloudSharingMetadata *)v21 setApplication:v23];

    [(LPiCloudSharingMetadata *)v21 setKind:v18];
    if (self->_titleFromURL) {
      titleFromURL = self->_titleFromURL;
    }
    else {
      titleFromURL = v20;
    }
    [(LPiCloudSharingMetadata *)v21 setTitle:titleFromURL];
    id v25 = [v6 share];
    long long v26 = [(LPiCloudSharingMetadataProviderSpecialization *)self iconFromShare:v25];
    [(LPiCloudSharingMetadata *)v21 setIcon:v26];

    uint64_t v27 = [(LPMetadataProviderSpecialization *)self createMetadataWithSpecialization:v21];
    v28 = [(LPMetadataProviderSpecialization *)self delegate];
    [v28 metadataProviderSpecialization:self didCompleteWithMetadata:v27];
  }
}

- (void)completeUsingApplication:(id)a3 kind:(id)a4 title:(id)a5 thumbnail:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = LPLogChannelFetching();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[LPiCloudSharingMetadataProviderSpecialization completeUsingApplication:kind:title:thumbnail:]((uint64_t)v10, (uint64_t)v12, v14);
  }
  uint64_t v15 = objc_alloc_init(LPiCloudSharingMetadata);
  [(LPiCloudSharingMetadata *)v15 setApplication:v10];
  [(LPiCloudSharingMetadata *)v15 setKind:v11];
  [(LPiCloudSharingMetadata *)v15 setTitle:v12];
  [(LPiCloudSharingMetadata *)v15 setThumbnail:v13];
  uint64_t v16 = [(LPMetadataProviderSpecialization *)self createMetadataWithSpecialization:v15];
  uint64_t v17 = [(LPMetadataProviderSpecialization *)self delegate];
  [v17 metadataProviderSpecialization:self didCompleteWithMetadata:v16];
}

- (void)fail
{
  [(LPiCloudSharingMetadataProviderSpecialization *)self cancel];
  id v3 = [(LPMetadataProviderSpecialization *)self delegate];
  [v3 metadataProviderSpecializationDidFail:self];
}

- (void)cancel
{
  self->_canceled = 1;
}

- (BOOL)canRetrieveThumbnailForApplication:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"Notes"] & 1) != 0
    || ([v3 isEqualToString:@"Reminders"] & 1) != 0)
  {
    char v4 = 0;
LABEL_14:

    return v4;
  }
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  BOOL v5 = (void **)getBREntitlementSharingPrivateInterfaceSymbolLoc_ptr;
  uint64_t v19 = getBREntitlementSharingPrivateInterfaceSymbolLoc_ptr;
  if (!getBREntitlementSharingPrivateInterfaceSymbolLoc_ptr)
  {
    id v6 = CloudDocsLibrary();
    v17[3] = (uint64_t)dlsym(v6, "BREntitlementSharingPrivateInterface");
    getBREntitlementSharingPrivateInterfaceSymbolLoc_ptr = v17[3];
    BOOL v5 = (void **)v17[3];
  }
  _Block_object_dispose(&v16, 8);
  if (v5)
  {
    id v7 = LPValueForEntitlement(*v5);
    if (([v7 BOOLValue] & 1) == 0)
    {
      char v4 = 0;
      goto LABEL_13;
    }
    uint64_t v16 = 0;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x2020000000;
    uint64_t v8 = (void **)getBRContainerProxyEntitlementSymbolLoc_ptr;
    uint64_t v19 = getBRContainerProxyEntitlementSymbolLoc_ptr;
    if (!getBRContainerProxyEntitlementSymbolLoc_ptr)
    {
      uint64_t v9 = CloudDocsLibrary();
      v17[3] = (uint64_t)dlsym(v9, "BRContainerProxyEntitlement");
      getBRContainerProxyEntitlementSymbolLoc_ptr = v17[3];
      uint64_t v8 = (void **)v17[3];
    }
    _Block_object_dispose(&v16, 8);
    if (v8)
    {
      id v10 = LPValueForEntitlement(*v8);
      char v4 = [v10 BOOLValue];

LABEL_13:
      goto LABEL_14;
    }
  }
  else
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    id v13 = [NSString stringWithUTF8String:"NSString *getBREntitlementSharingPrivateInterface(void)"];
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, @"LPiCloudSharingMetadataProviderSpecialization.m", 24, @"%s", dlerror());

    __break(1u);
  }
  uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v15 = [NSString stringWithUTF8String:"NSString *getBRContainerProxyEntitlement(void)"];
  objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, @"LPiCloudSharingMetadataProviderSpecialization.m", 25, @"%s", dlerror());

  __break(1u);
  return result;
}

- (void)completeRetrievingThumbnailForShareMetadata:(id)a3 application:(id)a4 kind:(id)a5 title:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __116__LPiCloudSharingMetadataProviderSpecialization_completeRetrievingThumbnailForShareMetadata_application_kind_title___block_invoke;
  aBlock[3] = &unk_1E5B06BB8;
  aBlock[4] = self;
  id v14 = v11;
  id v34 = v14;
  id v15 = v12;
  id v35 = v15;
  id v16 = v13;
  id v36 = v16;
  uint64_t v17 = _Block_copy(aBlock);
  id v18 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __116__LPiCloudSharingMetadataProviderSpecialization_completeRetrievingThumbnailForShareMetadata_application_kind_title___block_invoke_2_57;
  v25[3] = &unk_1E5B06BE0;
  id v19 = v10;
  id v26 = v19;
  uint64_t v27 = self;
  id v20 = v14;
  id v28 = v20;
  id v21 = v15;
  id v29 = v21;
  id v22 = v16;
  id v30 = v22;
  id v23 = v17;
  id v31 = v18;
  id v32 = v23;
  id v24 = v18;
  [v24 addOperationWithBlock:v25];
}

void __116__LPiCloudSharingMetadataProviderSpecialization_completeRetrievingThumbnailForShareMetadata_application_kind_title___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    id v13 = LPLogChannelFetching();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __116__LPiCloudSharingMetadataProviderSpecialization_completeRetrievingThumbnailForShareMetadata_application_kind_title___block_invoke_cold_1((uint64_t)v7, v13);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __116__LPiCloudSharingMetadataProviderSpecialization_completeRetrievingThumbnailForShareMetadata_application_kind_title___block_invoke_50;
    block[3] = &unk_1E5B05470;
    id v14 = *(void **)(a1 + 40);
    block[4] = *(void *)(a1 + 32);
    id v22 = v14;
    id v23 = *(id *)(a1 + 48);
    id v24 = *(id *)(a1 + 56);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    [v5 startAccessingSecurityScopedResource];
    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F3A6C0]), "initWithFileAtURL:size:scale:representationTypes:", v5, 4, 300.0, 600.0, 3.0);
    uint64_t v9 = [MEMORY[0x1E4F3A6C8] sharedGenerator];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __116__LPiCloudSharingMetadataProviderSpecialization_completeRetrievingThumbnailForShareMetadata_application_kind_title___block_invoke_2;
    v15[3] = &unk_1E5B06B90;
    id v10 = v5;
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = *(void **)(a1 + 40);
    id v16 = v10;
    uint64_t v17 = v11;
    id v18 = v12;
    id v19 = *(id *)(a1 + 48);
    id v20 = *(id *)(a1 + 56);
    [v9 generateBestRepresentationForRequest:v8 completionHandler:v15];
  }
}

uint64_t __116__LPiCloudSharingMetadataProviderSpecialization_completeRetrievingThumbnailForShareMetadata_application_kind_title___block_invoke_50(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeUsingApplication:*(void *)(a1 + 40) kind:*(void *)(a1 + 48) title:*(void *)(a1 + 56) thumbnail:0];
}

void __116__LPiCloudSharingMetadataProviderSpecialization_completeRetrievingThumbnailForShareMetadata_application_kind_title___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) stopAccessingSecurityScopedResource];
  if (v6)
  {
    id v7 = LPLogChannelFetching();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __116__LPiCloudSharingMetadataProviderSpecialization_completeRetrievingThumbnailForShareMetadata_application_kind_title___block_invoke_2_cold_1((uint64_t)v6, v7);
    }
  }
  else if ([v5 CGImage])
  {
    id v8 = -[LPImage _initWithCGImage:]([LPImage alloc], "_initWithCGImage:", [v5 CGImage]);
    goto LABEL_7;
  }
  id v8 = 0;
LABEL_7:
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __116__LPiCloudSharingMetadataProviderSpecialization_completeRetrievingThumbnailForShareMetadata_application_kind_title___block_invoke_53;
  block[3] = &unk_1E5B06B68;
  uint64_t v9 = *(void **)(a1 + 48);
  block[4] = *(void *)(a1 + 40);
  id v12 = v9;
  id v13 = *(id *)(a1 + 56);
  id v14 = *(id *)(a1 + 64);
  id v15 = v8;
  id v10 = v8;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __116__LPiCloudSharingMetadataProviderSpecialization_completeRetrievingThumbnailForShareMetadata_application_kind_title___block_invoke_53(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeUsingApplication:*(void *)(a1 + 40) kind:*(void *)(a1 + 48) title:*(void *)(a1 + 56) thumbnail:*(void *)(a1 + 64)];
}

void __116__LPiCloudSharingMetadataProviderSpecialization_completeRetrievingThumbnailForShareMetadata_application_kind_title___block_invoke_2_57(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v3 = [*(id *)(a1 + 32) containerIdentifier];
  char v4 = [v2 URLForUbiquityContainerIdentifier:v3];

  if (v4)
  {
    uint64_t v17 = 0;
    id v18 = &v17;
    uint64_t v19 = 0x2050000000;
    id v5 = (void *)getBRShareCopyDocumentURLForRecordIDClass_softClass;
    uint64_t v20 = getBRShareCopyDocumentURLForRecordIDClass_softClass;
    if (!getBRShareCopyDocumentURLForRecordIDClass_softClass)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      uint64_t v22 = 3221225472;
      id v23 = __getBRShareCopyDocumentURLForRecordIDClass_block_invoke;
      id v24 = &unk_1E5B04EB8;
      id v25 = &v17;
      __getBRShareCopyDocumentURLForRecordIDClass_block_invoke((uint64_t)buf);
      id v5 = (void *)v18[3];
    }
    id v6 = v5;
    _Block_object_dispose(&v17, 8);
    id v7 = [v6 alloc];
    id v8 = [*(id *)(a1 + 32) hierarchicalRootRecordID];
    uint64_t v9 = (void *)[v7 initWithRecordID:v8 fileURL:v4 withServerLookup:1];

    [v9 setCopyDocumentURLCompletionBlock:*(void *)(a1 + 80)];
    [*(id *)(a1 + 72) addOperation:v9];
  }
  else
  {
    id v10 = (id)LPLogChannelFetching();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = [*(id *)(a1 + 32) containerIdentifier];
      __116__LPiCloudSharingMetadataProviderSpecialization_completeRetrievingThumbnailForShareMetadata_application_kind_title___block_invoke_2_57_cold_1(v11, buf, v10);
    }

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __116__LPiCloudSharingMetadataProviderSpecialization_completeRetrievingThumbnailForShareMetadata_application_kind_title___block_invoke_59;
    v13[3] = &unk_1E5B05470;
    id v12 = *(void **)(a1 + 48);
    v13[4] = *(void *)(a1 + 40);
    id v14 = v12;
    id v15 = *(id *)(a1 + 56);
    id v16 = *(id *)(a1 + 64);
    dispatch_async(MEMORY[0x1E4F14428], v13);
  }
}

uint64_t __116__LPiCloudSharingMetadataProviderSpecialization_completeRetrievingThumbnailForShareMetadata_application_kind_title___block_invoke_59(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeUsingApplication:*(void *)(a1 + 40) kind:*(void *)(a1 + 48) title:*(void *)(a1 + 56) thumbnail:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationContainer, 0);
  objc_storeStrong((id *)&self->_baseContainer, 0);
  objc_storeStrong((id *)&self->_titleFromURL, 0);
  objc_storeStrong((id *)&self->_kindFromURL, 0);

  objc_storeStrong((id *)&self->_applicationFromURL, 0);
}

void __54__LPiCloudSharingMetadataProviderSpecialization_start__block_invoke_3_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_1A35DC000, log, OS_LOG_TYPE_DEBUG, "LPiCloudSharingMetadata: starting fetch bundleIDs (container=%@)", buf, 0xCu);
}

void __54__LPiCloudSharingMetadataProviderSpecialization_start__block_invoke_3_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __54__LPiCloudSharingMetadataProviderSpecialization_start__block_invoke_2_44_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __54__LPiCloudSharingMetadataProviderSpecialization_start__block_invoke_2_44_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)completeWithShareMetadata:(uint64_t)a3 bundleIDs:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)completeUsingApplication:(os_log_t)log kind:title:thumbnail:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_1A35DC000, log, OS_LOG_TYPE_DEBUG, "LPiCloudSharingMetadata: completed using application name (%@) and title (%@)", (uint8_t *)&v3, 0x16u);
}

void __116__LPiCloudSharingMetadataProviderSpecialization_completeRetrievingThumbnailForShareMetadata_application_kind_title___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A35DC000, a2, OS_LOG_TYPE_ERROR, "LPiCloudSharingMetadata: failed to retrieve a documentURL from a shareURL (%@)", (uint8_t *)&v2, 0xCu);
}

void __116__LPiCloudSharingMetadataProviderSpecialization_completeRetrievingThumbnailForShareMetadata_application_kind_title___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A35DC000, a2, OS_LOG_TYPE_ERROR, "LPiCloudSharingMetadata: failed to retrieve a thumbnail from QuickLookThumbnailing (%@)", (uint8_t *)&v2, 0xCu);
}

void __116__LPiCloudSharingMetadataProviderSpecialization_completeRetrievingThumbnailForShareMetadata_application_kind_title___block_invoke_2_57_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1A35DC000, log, OS_LOG_TYPE_ERROR, "LPiCloudSharingMetadata: failed to retrieve a containerURL (container=%@)", buf, 0xCu);
}

@end