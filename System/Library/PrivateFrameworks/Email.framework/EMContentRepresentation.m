@interface EMContentRepresentation
+ (BOOL)supportsSecureCoding;
+ (NSObject)_temporaryURLForClientIdentifier:(void *)a3 preferredFilename:(void *)a4 pathExtension:(void *)a5 cleanupInvocable:(void *)a6 error:;
+ (NSXPCInterface)contentRequestDelegateInterface;
+ (NSXPCInterface)distantContentRepresentationInterface;
+ (id)temporaryURLWithData:(id)a3 clientIdentifier:(id)a4 preferredFilename:(id)a5 pathExtension:(id)a6 cleanupInvocable:(id *)a7 error:(id *)a8;
+ (id)temporaryURLWithOriginalFileURL:(id)a3 clientIdentifier:(id)a4 preferredFilename:(id)a5 pathExtension:(id)a6 cleanupInvocable:(id *)a7 error:(id *)a8;
- (BOOL)hasMoreContent;
- (BOOL)showRemoteImages;
- (BOOL)skipMessageReformatting;
- (CSSearchableItem)searchableItem;
- (EMContentItem)contentItem;
- (EMContentRepresentation)initWithCoder:(id)a3;
- (EMContentRepresentation)initWithContentMessage:(id)a3 data:(id)a4 clientIdentifier:(id)a5 preferredFilename:(id)a6 extension:(id)a7;
- (EMContentRepresentation)initWithContentURL:(id)a3 relatedItems:(id)a4 securityInformation:(id)a5;
- (EMContentRepresentation)initWithData:(id)a3 clientIdentifier:(id)a4 extension:(id)a5 relatedItems:(id)a6 securityInformation:(id)a7;
- (EMContentRepresentation)initWithData:(id)a3 clientIdentifier:(id)a4 preferredFilename:(id)a5 extension:(id)a6 relatedItems:(id)a7 securityInformation:(id)a8;
- (EMContentRepresentation)initWithOriginalFileURL:(id)a3 clientIdentifier:(id)a4 preferredFilename:(id)a5 extension:(id)a6 relatedItems:(id)a7 securityInformation:(id)a8;
- (EMListUnsubscribeCommand)unsubscribeCommand;
- (EMMessage)contentMessage;
- (EMMessageHeaders)requestedHeaders;
- (EMSecurityInformation)securityInformation;
- (NSArray)relatedContentItems;
- (NSArray)replyToList;
- (NSData)cachedMetadataJSON;
- (NSString)debugDescription;
- (NSString)ef_publicDescription;
- (NSURL)contentURL;
- (NSURL)publicMessageURL;
- (_EMDistantContentRepresentation)distantContentRepresentation;
- (id)_distantLoaderBlockForContentItem:(void *)a1;
- (id)_initWithRelatedItems:(void *)a3 securityInformation:;
- (id)_initWithSandboxedURLWrapper:(void *)a3 relatedItems:(void *)a4 securityInformation:;
- (id)listUnsubscribeBlock;
- (id)performUnsubscribeAction:(unint64_t)a3 completion:(id)a4;
- (id)requestAdditionalContentWithCompletion:(id)a3;
- (id)requestMoreContentBlock;
- (id)requestOriginalContentMessagesInReplyToContentItemBlock;
- (int64_t)remainingByteCount;
- (int64_t)transportType;
- (void)addInvalidationHandler:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
- (void)mergeUpdatedRepresentation:(id)a3;
- (void)requestOriginalContentMessagesInReplyToContentItemWithCompletion:(id)a3;
- (void)setCachedMetadataJSON:(id)a3;
- (void)setContentItem:(id)a3;
- (void)setContentMessage:(id)a3;
- (void)setDistantContentRepresentation:(id)a3;
- (void)setHasMoreContent:(BOOL)a3;
- (void)setListUnsubscribeBlock:(id)a3;
- (void)setPublicMessageURL:(id)a3;
- (void)setRelatedContentItems:(id)a3;
- (void)setRemainingByteCount:(int64_t)a3;
- (void)setReplyToList:(id)a3;
- (void)setRequestMoreContentBlock:(id)a3;
- (void)setRequestOriginalContentMessagesInReplyToContentItemBlock:(id)a3;
- (void)setRequestedHeaders:(id)a3;
- (void)setSearchableItem:(id)a3;
- (void)setSecurityInformation:(id)a3;
- (void)setShowRemoteImages:(BOOL)a3;
- (void)setSkipMessageReformatting:(BOOL)a3;
- (void)setTransportType:(int64_t)a3;
- (void)setUnsubscribeCommand:(id)a3;
@end

@implementation EMContentRepresentation

void __64__EMContentRepresentation_distantContentRepresentationInterface__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1A86918];
  v3 = (void *)distantContentRepresentationInterface_interface;
  distantContentRepresentationInterface_interface = v2;

  [(id)distantContentRepresentationInterface_interface setInterface:distantContentRepresentationInterface_interface forSelector:sel_requestRepresentationForItemWithObjectID_options_delegate_completionHandler_ argumentIndex:0 ofReply:1];
  v4 = (void *)distantContentRepresentationInterface_interface;
  id v8 = [*(id *)(a1 + 32) contentRequestDelegateInterface];
  objc_msgSend(v4, "setInterface:forSelector:argumentIndex:ofReply:");

  if (_os_feature_enabled_impl() && (EMIsGreymatterSupportedWithOverride() & 1) != 0
    || _os_feature_enabled_impl() && EMIsGreymatterSupportedWithOverride())
  {
    v5 = (void *)distantContentRepresentationInterface_interface;
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:");
  }
}

void __58__EMContentRepresentation_contentRequestDelegateInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1A868B8];
  v1 = (void *)contentRequestDelegateInterface_contentRequestDelegateInterface;
  contentRequestDelegateInterface_contentRequestDelegateInterface = v0;

  uint64_t v2 = (void *)contentRequestDelegateInterface_contentRequestDelegateInterface;
  objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:");

  v3 = (void *)contentRequestDelegateInterface_contentRequestDelegateInterface;
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:");

  v6 = (void *)contentRequestDelegateInterface_contentRequestDelegateInterface;
  objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:");

  uint64_t v7 = (void *)contentRequestDelegateInterface_contentRequestDelegateInterface;
  id v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v9 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:");
}

+ (NSXPCInterface)contentRequestDelegateInterface
{
  if (contentRequestDelegateInterface_onceToken != -1) {
    dispatch_once(&contentRequestDelegateInterface_onceToken, &__block_literal_global_5);
  }
  uint64_t v2 = (void *)contentRequestDelegateInterface_contentRequestDelegateInterface;
  return (NSXPCInterface *)v2;
}

+ (NSXPCInterface)distantContentRepresentationInterface
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__EMContentRepresentation_distantContentRepresentationInterface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (distantContentRepresentationInterface_onceToken != -1) {
    dispatch_once(&distantContentRepresentationInterface_onceToken, block);
  }
  uint64_t v2 = (void *)distantContentRepresentationInterface_interface;
  return (NSXPCInterface *)v2;
}

+ (NSObject)_temporaryURLForClientIdentifier:(void *)a3 preferredFilename:(void *)a4 pathExtension:(void *)a5 cleanupInvocable:(void *)a6 error:
{
  v42[4] = *MEMORY[0x1E4F143B8];
  id v32 = a2;
  id v33 = a3;
  id v31 = a4;
  self;
  id v10 = NSTemporaryDirectory();
  v42[0] = v10;
  id v11 = (objc_class *)objc_opt_class();
  id v12 = NSStringFromClass(v11);
  v42[1] = v12;
  v42[2] = v32;
  id v13 = objc_msgSend(NSString, "ef_UUID");
  v42[3] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:4];

  v15 = [NSString pathWithComponents:v14];
  v16 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v38 = 0;
  LOBYTE(a4) = [v16 createDirectoryAtPath:v15 withIntermediateDirectories:1 attributes:0 error:&v38];
  id v17 = v38;
  v18 = v17;
  if (a4)
  {
    if ([v33 length])
    {
      v19 = v33;
    }
    else
    {
      uint64_t v24 = objc_msgSend(NSString, "ef_UUID");

      v19 = (void *)v24;
    }
    v25 = (void *)MEMORY[0x1E4F1CB10];
    v39[0] = v15;
    id v33 = v19;
    v26 = [v19 stringByAppendingPathExtension:v31];
    v27 = [v26 stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
    v39[1] = v27;
    v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
    v23 = [v25 fileURLWithPathComponents:v28];

    if (!a5) {
      goto LABEL_13;
    }
    v29 = (void *)MEMORY[0x1E4F60D80];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __115__EMContentRepresentation__temporaryURLForClientIdentifier_preferredFilename_pathExtension_cleanupInvocable_error___block_invoke;
    v34[3] = &unk_1E63E2848;
    v23 = v23;
    v35 = v23;
    id v36 = v16;
    id v37 = v15;
    *a5 = [v29 tokenWithInvocationBlock:v34];

    v22 = v35;
  }
  else
  {
    if (a6)
    {
      v20 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v40 = *MEMORY[0x1E4F28A50];
      id v41 = v17;
      v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
      *a6 = [v20 errorWithDomain:@"EMErrorDomain" code:2048 userInfo:v21];
    }
    v22 = EMLogCategoryMessageLoading();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v18, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      +[EMContentRepresentation _temporaryURLForClientIdentifier:preferredFilename:pathExtension:cleanupInvocable:error:]();
    }
    v23 = 0;
  }

LABEL_13:
  return v23;
}

void __115__EMContentRepresentation__temporaryURLForClientIdentifier_preferredFilename_pathExtension_cleanupInvocable_error___block_invoke(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = EMLogCategoryMessageLoading();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = a1[4];
    *(_DWORD *)buf = 138412290;
    uint64_t v11 = v3;
    _os_log_impl(&dword_1BEFDB000, v2, OS_LOG_TYPE_INFO, "Cleaning up representation URL %@", buf, 0xCu);
  }

  v4 = (void *)a1[5];
  uint64_t v5 = a1[6];
  id v9 = 0;
  char v6 = [v4 removeItemAtPath:v5 error:&v9];
  id v7 = v9;
  if ((v6 & 1) == 0)
  {
    id v8 = EMLogCategoryMessageLoading();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __115__EMContentRepresentation__temporaryURLForClientIdentifier_preferredFilename_pathExtension_cleanupInvocable_error___block_invoke_cold_1();
    }
  }
}

+ (id)temporaryURLWithData:(id)a3 clientIdentifier:(id)a4 preferredFilename:(id)a5 pathExtension:(id)a6 cleanupInvocable:(id *)a7 error:(id *)a8
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v18 = +[EMContentRepresentation _temporaryURLForClientIdentifier:preferredFilename:pathExtension:cleanupInvocable:error:]((uint64_t)a1, v15, v16, v17, a7, a8);
  if (v18)
  {
    id v27 = 0;
    char v19 = [v14 writeToURL:v18 options:1073741825 error:&v27];
    id v20 = v27;
    v21 = v20;
    if (v19)
    {
      id v22 = v18;
    }
    else
    {
      if (a8)
      {
        v23 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v28 = *MEMORY[0x1E4F28A50];
        v29[0] = v20;
        uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
        *a8 = [v23 errorWithDomain:@"EMErrorDomain" code:2048 userInfo:v24];
      }
      v25 = EMLogCategoryMessageLoading();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v21, "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        +[EMContentRepresentation temporaryURLWithData:clientIdentifier:preferredFilename:pathExtension:cleanupInvocable:error:]();
      }

      id v22 = 0;
    }
  }
  else
  {
    id v22 = 0;
  }

  return v22;
}

+ (id)temporaryURLWithOriginalFileURL:(id)a3 clientIdentifier:(id)a4 preferredFilename:(id)a5 pathExtension:(id)a6 cleanupInvocable:(id *)a7 error:(id *)a8
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v18 = +[EMContentRepresentation _temporaryURLForClientIdentifier:preferredFilename:pathExtension:cleanupInvocable:error:]((uint64_t)a1, v15, v16, v17, a7, a8);
  if (v18)
  {
    char v19 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v28 = 0;
    char v20 = [v19 copyItemAtURL:v14 toURL:v18 error:&v28];
    id v21 = v28;

    if (v20)
    {
      id v22 = v18;
    }
    else
    {
      if (a8)
      {
        v23 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v35 = *MEMORY[0x1E4F28A50];
        v36[0] = v21;
        uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v35 count:1];
        *a8 = [v23 errorWithDomain:@"EMErrorDomain" code:2048 userInfo:v24];
      }
      v25 = EMLogCategoryMessageLoading();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        id v27 = objc_msgSend(v21, "ef_publicDescription");
        *(_DWORD *)buf = 138412802;
        id v30 = v14;
        __int16 v31 = 2112;
        id v32 = v18;
        __int16 v33 = 2114;
        v34 = v27;
        _os_log_error_impl(&dword_1BEFDB000, v25, OS_LOG_TYPE_ERROR, "failed to copy data from %@ to URL %@: %{public}@", buf, 0x20u);
      }
      id v22 = 0;
    }
  }
  else
  {
    id v22 = 0;
  }

  return v22;
}

- (id)_initWithRelatedItems:(void *)a3 securityInformation:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v15.receiver = a1;
    v15.super_class = (Class)EMContentRepresentation;
    a1 = (id *)objc_msgSendSuper2(&v15, sel_init);
    if (a1)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F60D80]);
      id v8 = a1[1];
      a1[1] = v7;

      uint64_t v9 = [v5 copy];
      id v10 = (void *)v9;
      if (v9) {
        uint64_t v11 = (void *)v9;
      }
      else {
        uint64_t v11 = (void *)MEMORY[0x1E4F1CBF0];
      }
      objc_storeStrong(a1 + 7, v11);

      objc_storeStrong(a1 + 8, a3);
      uint64_t v12 = [[EMMessageContentCachedMetadata alloc] initWithDelegate:a1];
      id v13 = a1[16];
      a1[16] = v12;
    }
  }

  return a1;
}

- (id)_initWithSandboxedURLWrapper:(void *)a3 relatedItems:(void *)a4 securityInformation:
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (a1 && v8)
  {
    uint64_t v11 = -[EMContentRepresentation _initWithRelatedItems:securityInformation:](a1, v9, v10);
    uint64_t v12 = v11;
    if (v11)
    {
      objc_storeStrong(v11 + 15, a2);
      id v13 = [v12[15] url];
      *((unsigned char *)v12 + 16) = [v13 startAccessingSecurityScopedResource];

      id v14 = [[EMMessageContentCachedMetadata alloc] initWithDelegate:v12];
      id v15 = v12[16];
      v12[16] = v14;
    }
    a1 = v12;
    id v16 = a1;
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (EMContentRepresentation)initWithContentURL:(id)a3 relatedItems:(id)a4 securityInformation:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F60F20]) initWithFileURL:v8 readOnly:1];
  uint64_t v12 = (EMContentRepresentation *)-[EMContentRepresentation _initWithSandboxedURLWrapper:relatedItems:securityInformation:]((id *)&self->super.isa, v11, v9, v10);

  return v12;
}

- (EMContentRepresentation)initWithData:(id)a3 clientIdentifier:(id)a4 preferredFilename:(id)a5 extension:(id)a6 relatedItems:(id)a7 securityInformation:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v26 = 0;
  char v20 = [(id)objc_opt_class() temporaryURLWithData:v14 clientIdentifier:v15 preferredFilename:v16 pathExtension:v17 cleanupInvocable:&v26 error:0];
  id v21 = v26;
  if (v20)
  {
    id v22 = [(EMContentRepresentation *)self initWithContentURL:v20 relatedItems:v18 securityInformation:v19];
    v23 = v22;
    if (v22) {
      [(EFInvocationToken *)v22->_invocable addInvocable:v21];
    }
    else {
      [v21 invoke];
    }
    self = v23;
    uint64_t v24 = self;
  }
  else
  {
    uint64_t v24 = 0;
  }

  return v24;
}

- (EMContentRepresentation)initWithOriginalFileURL:(id)a3 clientIdentifier:(id)a4 preferredFilename:(id)a5 extension:(id)a6 relatedItems:(id)a7 securityInformation:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v26 = 0;
  char v20 = [(id)objc_opt_class() temporaryURLWithOriginalFileURL:v14 clientIdentifier:v15 preferredFilename:v16 pathExtension:v17 cleanupInvocable:&v26 error:0];
  id v21 = v26;
  if (v20)
  {
    id v22 = [(EMContentRepresentation *)self initWithContentURL:v20 relatedItems:v18 securityInformation:v19];
    v23 = v22;
    if (v22) {
      [(EFInvocationToken *)v22->_invocable addInvocable:v21];
    }
    else {
      [v21 invoke];
    }
    self = v23;
    uint64_t v24 = self;
  }
  else
  {
    uint64_t v24 = 0;
  }

  return v24;
}

- (EMContentRepresentation)initWithData:(id)a3 clientIdentifier:(id)a4 extension:(id)a5 relatedItems:(id)a6 securityInformation:(id)a7
{
  return [(EMContentRepresentation *)self initWithData:a3 clientIdentifier:a4 preferredFilename:0 extension:a5 relatedItems:a6 securityInformation:a7];
}

- (EMContentRepresentation)initWithContentMessage:(id)a3 data:(id)a4 clientIdentifier:(id)a5 preferredFilename:(id)a6 extension:(id)a7
{
  id v13 = a3;
  id v14 = [(EMContentRepresentation *)self initWithData:a4 clientIdentifier:a5 preferredFilename:a6 extension:a7 relatedItems:MEMORY[0x1E4F1CBF0] securityInformation:0];
  id v15 = v14;
  if (v14) {
    objc_storeStrong((id *)&v14->_contentMessage, a3);
  }

  return v15;
}

- (void)dealloc
{
  if (self->_claimedScopedResource)
  {
    uint64_t v3 = [(EFSandboxedURLWrapper *)self->_urlWrapper url];
    [v3 stopAccessingSecurityScopedResource];
  }
  [(EMContentRepresentation *)self invalidate];
  v4.receiver = self;
  v4.super_class = (Class)EMContentRepresentation;
  [(EMContentRepresentation *)&v4 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMContentRepresentation)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_urlWrapper"];
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  id v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  id v9 = [v4 decodeObjectOfClasses:v8 forKey:@"EFPropertyKey_relatedContentItems"];

  id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_securityInformation"];
  uint64_t v11 = (EMContentRepresentation *)-[EMContentRepresentation _initWithSandboxedURLWrapper:relatedItems:securityInformation:]((id *)&self->super.isa, v5, v9, v10);
  if (v11)
  {
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_searchableItem"];
    searchableItem = v11->_searchableItem;
    v11->_searchableItem = (CSSearchableItem *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_unsubscribeCommand"];
    unsubscribeCommand = v11->_unsubscribeCommand;
    v11->_unsubscribeCommand = (EMListUnsubscribeCommand *)v14;

    v11->_hasMoreContent = [v4 decodeBoolForKey:@"EFPropertyKey_hasMoreContent"];
    v11->_remainingByteCount = [v4 decodeInt64ForKey:@"EFPropertyKey_remainingByteCount"];
    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_publicMessageURL"];
    publicMessageURL = v11->_publicMessageURL;
    v11->_publicMessageURL = (NSURL *)v16;

    id v18 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    id v21 = objc_msgSend(v18, "setWithObjects:", v19, v20, objc_opt_class(), 0);
    uint64_t v22 = [v4 decodeObjectOfClasses:v21 forKey:@"EFPropertyKey_replyToList"];
    replyToList = v11->_replyToList;
    v11->_replyToList = (NSArray *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_contentMessage"];
    contentMessage = v11->_contentMessage;
    v11->_contentMessage = (EMMessage *)v24;

    v11->_transportType = [v4 decodeIntegerForKey:@"EFPropertyKey_transportType"];
    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_requestedHeaders"];
    requestedHeaders = v11->_requestedHeaders;
    v11->_requestedHeaders = (EMMessageHeaders *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_cachedMetadataJSON"];
    cachedMetadataJSON = v11->_cachedMetadataJSON;
    v11->_cachedMetadataJSON = (NSData *)v28;
  }
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if (self) {
    urlWrapper = self->_urlWrapper;
  }
  else {
    urlWrapper = 0;
  }
  id v15 = v4;
  [v4 encodeObject:urlWrapper forKey:@"EFPropertyKey_urlWrapper"];
  id v6 = [(EMContentRepresentation *)self contentMessage];
  [v15 encodeObject:v6 forKey:@"EFPropertyKey_contentMessage"];

  uint64_t v7 = [(EMContentRepresentation *)self relatedContentItems];
  [v15 encodeObject:v7 forKey:@"EFPropertyKey_relatedContentItems"];

  id v8 = [(EMContentRepresentation *)self securityInformation];
  [v15 encodeObject:v8 forKey:@"EFPropertyKey_securityInformation"];

  id v9 = [(EMContentRepresentation *)self searchableItem];
  [v15 encodeObject:v9 forKey:@"EFPropertyKey_searchableItem"];

  id v10 = [(EMContentRepresentation *)self unsubscribeCommand];
  [v15 encodeObject:v10 forKey:@"EFPropertyKey_unsubscribeCommand"];

  objc_msgSend(v15, "encodeBool:forKey:", -[EMContentRepresentation hasMoreContent](self, "hasMoreContent"), @"EFPropertyKey_hasMoreContent");
  objc_msgSend(v15, "encodeInt64:forKey:", -[EMContentRepresentation remainingByteCount](self, "remainingByteCount"), @"EFPropertyKey_remainingByteCount");
  uint64_t v11 = [(EMContentRepresentation *)self publicMessageURL];
  [v15 encodeObject:v11 forKey:@"EFPropertyKey_publicMessageURL"];

  uint64_t v12 = [(EMContentRepresentation *)self replyToList];
  [v15 encodeObject:v12 forKey:@"EFPropertyKey_replyToList"];

  objc_msgSend(v15, "encodeInteger:forKey:", -[EMContentRepresentation transportType](self, "transportType"), @"EFPropertyKey_transportType");
  id v13 = [(EMContentRepresentation *)self requestedHeaders];
  [v15 encodeObject:v13 forKey:@"EFPropertyKey_requestedHeaders"];

  uint64_t v14 = [(EMContentRepresentation *)self cachedMetadataJSON];
  [v15 encodeObject:v14 forKey:@"EFPropertyKey_cachedMetadataJSON"];
}

- (NSString)debugDescription
{
  uint64_t v16 = NSString;
  uint64_t v15 = objc_opt_class();
  uint64_t v19 = [(EMContentRepresentation *)self publicMessageURL];
  if (self) {
    urlWrapper = self->_urlWrapper;
  }
  else {
    urlWrapper = 0;
  }
  id v18 = urlWrapper;
  if (self->_claimedScopedResource) {
    id v4 = @"YES";
  }
  else {
    id v4 = @"NO";
  }
  if (self->_hasMoreContent) {
    id v5 = @"YES";
  }
  else {
    id v5 = @"NO";
  }
  int64_t remainingByteCount = self->_remainingByteCount;
  invocable = self->_invocable;
  id v17 = [(EMContentRepresentation *)self relatedContentItems];
  int64_t v8 = [(EMContentRepresentation *)self transportType];
  id v9 = [(EMContentRepresentation *)self securityInformation];
  id v10 = [(EMContentRepresentation *)self searchableItem];
  uint64_t v11 = [(EMContentRepresentation *)self unsubscribeCommand];
  uint64_t v12 = [(EMContentRepresentation *)self replyToList];
  id v13 = [v16 stringWithFormat:@"<%@: %p> publicMessageURL=%@, wrappedURL=%@, extended-sandbox=%@, hasMoreContent=%@ (%lld bytes), invocable=%@, related-items=%@, transport=%d, security-information=%@, searchableItem=%@, unsubscribeCommand=%@, replyToList=%@", v15, self, v19, v18, v4, v5, remainingByteCount, invocable, v17, v8, v9, v10, v11, v12];

  return (NSString *)v13;
}

- (NSString)ef_publicDescription
{
  uint64_t v3 = [MEMORY[0x1E4F60D58] currentDevice];
  int v4 = [v3 isInternal];

  if (v4)
  {
    if (self) {
      urlWrapper = self->_urlWrapper;
    }
    else {
      urlWrapper = 0;
    }
    id v6 = (void *)MEMORY[0x1E4F60E00];
    uint64_t v7 = [(EFSandboxedURLWrapper *)urlWrapper url];
    int64_t v8 = [v7 absoluteString];
    id v9 = [v6 partiallyRedactedStringForString:v8];

    uint64_t v28 = NSString;
    uint64_t v27 = objc_opt_class();
    id v30 = [(EMContentRepresentation *)self publicMessageURL];
    if (self->_claimedScopedResource) {
      id v10 = @"YES";
    }
    else {
      id v10 = @"NO";
    }
    uint64_t v26 = v10;
    if (self->_hasMoreContent) {
      uint64_t v11 = @"YES";
    }
    else {
      uint64_t v11 = @"NO";
    }
    int64_t remainingByteCount = self->_remainingByteCount;
    id v13 = [(EMContentRepresentation *)self relatedContentItems];
    int64_t v14 = [(EMContentRepresentation *)self transportType];
    uint64_t v15 = [(EMContentRepresentation *)self securityInformation];
    uint64_t v16 = [(EMContentRepresentation *)self searchableItem];
    id v17 = [(EMContentRepresentation *)self unsubscribeCommand];
    id v18 = [(EMContentRepresentation *)self cachedMetadataJSON];
    uint64_t v19 = [v28 stringWithFormat:@"<%@: %p> publicMessageURL=%@, URL=%@, extended-sandbox=%@, hasMoreContent=%@ (%lld bytes), related-items=%@, transport=%d, security-information=%@, searchableItem=%@, unsubscribeCommand=%@, cachedMetadataJSON=%{BOOL}d", v27, self, v30, v9, v26, v11, remainingByteCount, v13, v14, v15, v16, v17, v18 != 0];
  }
  else
  {
    v29 = NSString;
    uint64_t v20 = objc_opt_class();
    if (self->_claimedScopedResource) {
      id v21 = @"YES";
    }
    else {
      id v21 = @"NO";
    }
    if (self->_hasMoreContent) {
      uint64_t v22 = @"YES";
    }
    else {
      uint64_t v22 = @"NO";
    }
    int64_t v23 = self->_remainingByteCount;
    id v9 = [(EMContentRepresentation *)self relatedContentItems];
    int64_t v24 = [(EMContentRepresentation *)self transportType];
    id v30 = [(EMContentRepresentation *)self securityInformation];
    id v13 = [(EMContentRepresentation *)self searchableItem];
    uint64_t v15 = [(EMContentRepresentation *)self unsubscribeCommand];
    uint64_t v16 = [(EMContentRepresentation *)self cachedMetadataJSON];
    uint64_t v19 = [v29 stringWithFormat:@"<%@: %p> extended-sandbox=%@, hasMoreContent=%@ (%lld bytes), related-items=%@, transport=%d, security-information=%@, searchableItem=%@, unsubscribeCommand=%@, cachedMetadataJSON=%{BOOL}d", v20, self, v21, v22, v23, v9, v24, v30, v13, v15, v16 != 0];
  }

  return (NSString *)v19;
}

- (NSURL)contentURL
{
  return (NSURL *)[(EFSandboxedURLWrapper *)self->_urlWrapper url];
}

- (void)addInvalidationHandler:(id)a3
{
}

- (void)invalidate
{
}

- (id)_distantLoaderBlockForContentItem:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    int v4 = [a1 distantContentRepresentation];
    id v5 = [v3 objectID];
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, a1);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __61__EMContentRepresentation__distantLoaderBlockForContentItem___block_invoke;
    v10[3] = &unk_1E63E2DB8;
    objc_copyWeak(&v13, &location);
    id v11 = v5;
    id v12 = v4;
    id v6 = v4;
    id v7 = v5;
    int64_t v8 = (void *)MEMORY[0x1C18A2160](v10);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else
  {
    int64_t v8 = 0;
  }

  return v8;
}

id __61__EMContentRepresentation__distantLoaderBlockForContentItem___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v12 = EMLogCategoryMessageLoading();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [v7 requestedRepresentation];
    uint64_t v14 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v25 = v13;
    __int16 v26 = 2114;
    uint64_t v27 = v14;
    _os_log_impl(&dword_1BEFDB000, v12, OS_LOG_TYPE_DEFAULT, "requesting representation %{public}@ for objectID %{public}@", buf, 0x16u);
  }
  uint64_t v17 = a1 + 32;
  uint64_t v15 = *(void *)(a1 + 32);
  uint64_t v16 = *(void **)(v17 + 8);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __61__EMContentRepresentation__distantLoaderBlockForContentItem___block_invoke_157;
  v21[3] = &unk_1E63E2D90;
  objc_copyWeak(&v23, v10);
  id v18 = v9;
  id v22 = v18;
  uint64_t v19 = [v16 requestRepresentationForItemWithObjectID:v15 options:v7 delegate:v8 completionHandler:v21];

  objc_destroyWeak(&v23);
  return v19;
}

void __61__EMContentRepresentation__distantLoaderBlockForContentItem___block_invoke_157(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7 && v8)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __61__EMContentRepresentation__distantLoaderBlockForContentItem___block_invoke_2;
    v12[3] = &unk_1E63E26B0;
    id v11 = v8;
    id v13 = v11;
    [WeakRetained addInvalidationHandler:v12];
    [v11 setDistantContentRepresentation:v7];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

id __61__EMContentRepresentation__distantLoaderBlockForContentItem___block_invoke_2()
{
  return self;
}

- (void)setDistantContentRepresentation:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = (EMContentRepresentation *)a3;
  if (self->_distantContentRepresentation)
  {
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"EMContentRepresentation.m" lineNumber:366 description:@"distantContentRepresentation should only be set once"];
  }
  if (v6 != self)
  {
    objc_storeStrong((id *)&self->_distantContentRepresentation, a3);
    urlWrapper = self->_urlWrapper;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __59__EMContentRepresentation_setDistantContentRepresentation___block_invoke;
    v33[3] = &unk_1E63E26B0;
    id v8 = v6;
    v34 = v8;
    [(EFSandboxedURLWrapper *)urlWrapper addInvalidationHandler:v33];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v9 = [(EMContentRepresentation *)self relatedContentItems];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v35 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v30 != v11) {
            objc_enumerationMutation(v9);
          }
          id v13 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          uint64_t v14 = -[EMContentRepresentation _distantLoaderBlockForContentItem:](self, v13);
          [v13 setLoaderBlock:v14];
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v35 count:16];
      }
      while (v10);
    }

    uint64_t v15 = [(EMContentRepresentation *)self contentMessage];
    if (v15)
    {
      uint64_t v16 = -[EMContentRepresentation _distantLoaderBlockForContentItem:](self, v15);
      [v15 setLoaderBlock:v16];
    }
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __59__EMContentRepresentation_setDistantContentRepresentation___block_invoke_2;
    v25[3] = &unk_1E63E2DE0;
    objc_copyWeak(&v27, &location);
    uint64_t v17 = v8;
    __int16 v26 = v17;
    [(EMContentRepresentation *)self setRequestMoreContentBlock:v25];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __59__EMContentRepresentation_setDistantContentRepresentation___block_invoke_3;
    v22[3] = &unk_1E63E2E08;
    objc_copyWeak(&v24, &location);
    id v18 = v17;
    id v23 = v18;
    [(EMContentRepresentation *)self setListUnsubscribeBlock:v22];
    if (_os_feature_enabled_impl() && (EMIsGreymatterSupportedWithOverride() & 1) != 0
      || _os_feature_enabled_impl() && EMIsGreymatterSupportedWithOverride())
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __59__EMContentRepresentation_setDistantContentRepresentation___block_invoke_4;
      v20[3] = &unk_1E63E2E30;
      id v21 = v18;
      [(EMContentRepresentation *)self setRequestOriginalContentMessagesInReplyToContentItemBlock:v20];
    }
    objc_destroyWeak(&v24);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
}

uint64_t __59__EMContentRepresentation_setDistantContentRepresentation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

id __59__EMContentRepresentation_setDistantContentRepresentation___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ([WeakRetained hasMoreContent])
  {
    id v5 = [*(id *)(a1 + 32) requestUpdatedRepresentationWithCompletion:v3];
  }
  else
  {
    v3[2](v3, WeakRetained, 0);
    id v5 = 0;
  }

  return v5;
}

id __59__EMContentRepresentation_setDistantContentRepresentation___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = [WeakRetained unsubscribeCommand];

  if (v7)
  {
    id v8 = [*(id *)(a1 + 32) performUnsubscribeAction:a2 completion:v5];
  }
  else
  {
    v5[2](v5, 0);
    id v8 = 0;
  }

  return v8;
}

uint64_t __59__EMContentRepresentation_setDistantContentRepresentation___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) requestOriginalContentMessagesInReplyToContentItemWithCompletion:a2];
}

- (id)requestAdditionalContentWithCompletion:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v5 = EMLogCategoryMessageLoading();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(EMContentRepresentation *)self ef_publicDescription];
    *(_DWORD *)buf = 138543362;
    uint64_t v16 = v6;
    _os_log_impl(&dword_1BEFDB000, v5, OS_LOG_TYPE_DEFAULT, "requesting additional content for content representation %{public}@", buf, 0xCu);
  }
  id v7 = [(EMContentRepresentation *)self requestMoreContentBlock];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__EMContentRepresentation_requestAdditionalContentWithCompletion___block_invoke;
  v11[3] = &unk_1E63E2E58;
  objc_copyWeak(&v13, &location);
  id v8 = v4;
  id v12 = v8;
  id v9 = ((void (**)(void, void *))v7)[2](v7, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v9;
}

void __66__EMContentRepresentation_requestAdditionalContentWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (v7)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained mergeUpdatedRepresentation:v7];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)mergeUpdatedRepresentation:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = (EMContentRepresentation *)a3;
  id v5 = v4;
  if (v4 != self)
  {
    id v6 = [(EMContentRepresentation *)v4 relatedContentItems];
    [(EMContentRepresentation *)self setRelatedContentItems:v6];

    id v7 = [(EMContentRepresentation *)v5 securityInformation];
    [(EMContentRepresentation *)self setSecurityInformation:v7];

    [(EMContentRepresentation *)self setHasMoreContent:[(EMContentRepresentation *)v5 hasMoreContent]];
    [(EMContentRepresentation *)self setRemainingByteCount:[(EMContentRepresentation *)v5 remainingByteCount]];
    id v8 = [(EMContentRepresentation *)self distantContentRepresentation];
    if (v8)
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v9 = [(EMContentRepresentation *)self relatedContentItems];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v16;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v16 != v11) {
              objc_enumerationMutation(v9);
            }
            id v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
            uint64_t v14 = -[EMContentRepresentation _distantLoaderBlockForContentItem:](self, v13);
            [v13 setLoaderBlock:v14];
          }
          uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v10);
      }
    }
  }
}

- (id)performUnsubscribeAction:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(EMContentRepresentation *)self listUnsubscribeBlock];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__EMContentRepresentation_performUnsubscribeAction_completion___block_invoke;
  v11[3] = &unk_1E63E2C40;
  id v8 = v6;
  id v12 = v8;
  id v9 = ((void (**)(void, unint64_t, void *))v7)[2](v7, a3, v11);

  return v9;
}

uint64_t __63__EMContentRepresentation_performUnsubscribeAction_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestOriginalContentMessagesInReplyToContentItemWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(EMContentRepresentation *)self requestOriginalContentMessagesInReplyToContentItemBlock];

  if (v5)
  {
    id v6 = [(EMContentRepresentation *)self requestOriginalContentMessagesInReplyToContentItemBlock];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __92__EMContentRepresentation_requestOriginalContentMessagesInReplyToContentItemWithCompletion___block_invoke;
    v7[3] = &unk_1E63E2E80;
    id v8 = v4;
    ((void (**)(void, void *))v6)[2](v6, v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "em_internalErrorWithReason:", @"Unable to retrieve original contents");
    id v6 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, void (**)(void, void)))v4 + 2))(v4, 0, v6);
  }
}

uint64_t __92__EMContentRepresentation_requestOriginalContentMessagesInReplyToContentItemWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)showRemoteImages
{
  if (self) {
    self = (EMContentRepresentation *)self->_cachedMetadata;
  }
  return [(EMContentRepresentation *)self showRemoteImages];
}

- (void)setShowRemoteImages:(BOOL)a3
{
  if (self) {
    self = (EMContentRepresentation *)self->_cachedMetadata;
  }
  [(EMContentRepresentation *)self setShowRemoteImages:a3];
}

- (BOOL)skipMessageReformatting
{
  if (self) {
    self = (EMContentRepresentation *)self->_cachedMetadata;
  }
  return [(EMContentRepresentation *)self skipMessageReformatting];
}

- (void)setSkipMessageReformatting:(BOOL)a3
{
  if (self) {
    self = (EMContentRepresentation *)self->_cachedMetadata;
  }
  [(EMContentRepresentation *)self setSkipMessageReformatting:a3];
}

- (EMContentItem)contentItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentItem);
  return (EMContentItem *)WeakRetained;
}

- (void)setContentItem:(id)a3
{
}

- (NSURL)publicMessageURL
{
  return self->_publicMessageURL;
}

- (void)setPublicMessageURL:(id)a3
{
}

- (NSArray)replyToList
{
  return self->_replyToList;
}

- (void)setReplyToList:(id)a3
{
}

- (EMMessage)contentMessage
{
  return self->_contentMessage;
}

- (void)setContentMessage:(id)a3
{
}

- (NSArray)relatedContentItems
{
  return self->_relatedContentItems;
}

- (void)setRelatedContentItems:(id)a3
{
}

- (EMSecurityInformation)securityInformation
{
  return self->_securityInformation;
}

- (void)setSecurityInformation:(id)a3
{
}

- (CSSearchableItem)searchableItem
{
  return self->_searchableItem;
}

- (void)setSearchableItem:(id)a3
{
}

- (EMListUnsubscribeCommand)unsubscribeCommand
{
  return self->_unsubscribeCommand;
}

- (void)setUnsubscribeCommand:(id)a3
{
}

- (BOOL)hasMoreContent
{
  return self->_hasMoreContent;
}

- (void)setHasMoreContent:(BOOL)a3
{
  self->_hasMoreContent = a3;
}

- (int64_t)remainingByteCount
{
  return self->_remainingByteCount;
}

- (void)setRemainingByteCount:(int64_t)a3
{
  self->_int64_t remainingByteCount = a3;
}

- (int64_t)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(int64_t)a3
{
  self->_transportType = a3;
}

- (EMMessageHeaders)requestedHeaders
{
  return self->_requestedHeaders;
}

- (void)setRequestedHeaders:(id)a3
{
}

- (NSData)cachedMetadataJSON
{
  return self->_cachedMetadataJSON;
}

- (void)setCachedMetadataJSON:(id)a3
{
}

- (_EMDistantContentRepresentation)distantContentRepresentation
{
  return self->_distantContentRepresentation;
}

- (id)requestMoreContentBlock
{
  return self->_requestMoreContentBlock;
}

- (void)setRequestMoreContentBlock:(id)a3
{
}

- (id)listUnsubscribeBlock
{
  return self->_listUnsubscribeBlock;
}

- (void)setListUnsubscribeBlock:(id)a3
{
}

- (id)requestOriginalContentMessagesInReplyToContentItemBlock
{
  return self->_requestOriginalContentMessagesInReplyToContentItemBlock;
}

- (void)setRequestOriginalContentMessagesInReplyToContentItemBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_requestOriginalContentMessagesInReplyToContentItemBlock, 0);
  objc_storeStrong(&self->_listUnsubscribeBlock, 0);
  objc_storeStrong(&self->_requestMoreContentBlock, 0);
  objc_storeStrong((id *)&self->_distantContentRepresentation, 0);
  objc_storeStrong((id *)&self->_cachedMetadata, 0);
  objc_storeStrong((id *)&self->_urlWrapper, 0);
  objc_storeStrong((id *)&self->_cachedMetadataJSON, 0);
  objc_storeStrong((id *)&self->_requestedHeaders, 0);
  objc_storeStrong((id *)&self->_unsubscribeCommand, 0);
  objc_storeStrong((id *)&self->_searchableItem, 0);
  objc_storeStrong((id *)&self->_securityInformation, 0);
  objc_storeStrong((id *)&self->_relatedContentItems, 0);
  objc_storeStrong((id *)&self->_contentMessage, 0);
  objc_storeStrong((id *)&self->_replyToList, 0);
  objc_storeStrong((id *)&self->_publicMessageURL, 0);
  objc_destroyWeak((id *)&self->_contentItem);
  objc_storeStrong((id *)&self->_invocable, 0);
}

+ (void)_temporaryURLForClientIdentifier:preferredFilename:pathExtension:cleanupInvocable:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_0(&dword_1BEFDB000, "failed to create directory %@: %{public}@", v4, v5);
}

void __115__EMContentRepresentation__temporaryURLForClientIdentifier_preferredFilename_pathExtension_cleanupInvocable_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_0(&dword_1BEFDB000, "failed to remove URL %@: %{public}@", v4, v5);
}

+ (void)temporaryURLWithData:clientIdentifier:preferredFilename:pathExtension:cleanupInvocable:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_0(&dword_1BEFDB000, "failed to write data to URL %@: %{public}@", v4, v5);
}

@end