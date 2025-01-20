@interface FINode
+ (BOOL)supportsSecureCoding;
+ (NSSet)protectedAppIdentifiers;
+ (NSString)currentHostAppIdentifier;
+ (id)_allInstances;
+ (id)_allRootInstances;
+ (id)_dataSeparatedICloudDrive;
+ (id)_iCloudDrive;
+ (id)appLibraryNodeForNode:(id)a3;
+ (id)dataSeparatedICloudDefaultContainer;
+ (id)dataSeparatedICloudLibrariesContainer;
+ (id)fiNodeFromItem:(id *)a1 inFPv2Domain:completion:;
+ (id)fiNodeFromItem:inFPv2Domain:completion:;
+ (id)fiNodeFromURL:(id)a3;
+ (id)iCloudDefaultContainer;
+ (id)iCloudLibrariesContainer;
+ (id)nodeFromNodeRef:(OpaqueNodeRef *)a3;
+ (id)providerDomainsContainer;
+ (id)sizeFolder:(id)a3;
+ (id)sizeFolder:(id)a3 forCopyInto:(id)a4 withDelegate:(id)a5;
+ (int)desktopServicesAPIVersion;
+ (void)fiNodeFromItem:(id)a3 inFPv2Domain:(id)a4 completion:(id)a5;
+ (void)setCurrentHostAppIdentifier:(id)a3;
+ (void)setProtectedAppIdentifiers:(id)a3;
- (BOOL)isContainer;
- (BOOL)isFolder;
- (BOOL)isPackage;
- (BOOL)isPopulated;
- (BOOL)isShared;
- (BOOL)isSharedByCurrentUser;
- (BOOL)isTopLevelSharedItem;
- (BOOL)isTrashed;
- (BOOL)isValid;
- (BOOL)isVisible;
- (BOOL)markAsUsed:(id *)a3;
- (BOOL)nodeIsAll:(unint64_t)a3;
- (BOOL)nodeIsAny:(unint64_t)a3;
- (BOOL)propertyAsBool:(unsigned int)a3;
- (BOOL)propertyAsBool:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6;
- (BOOL)requiresForcedSyncing;
- (BOOL)setProperty:(unsigned int)a3 asArray:(id)a4;
- (BOOL)setProperty:(unsigned int)a3 asArray:(id)a4 async:(BOOL)a5 options:(unsigned int)a6 error:(id *)a7;
- (BOOL)setProperty:(unsigned int)a3 asBool:(BOOL)a4;
- (BOOL)setProperty:(unsigned int)a3 asBool:(BOOL)a4 async:(BOOL)a5 options:(unsigned int)a6 error:(id *)a7;
- (BOOL)setProperty:(unsigned int)a3 asData:(id)a4;
- (BOOL)setProperty:(unsigned int)a3 asData:(id)a4 async:(BOOL)a5 options:(unsigned int)a6 error:(id *)a7;
- (BOOL)setProperty:(unsigned int)a3 asDate:(id)a4;
- (BOOL)setProperty:(unsigned int)a3 asDate:(id)a4 async:(BOOL)a5 options:(unsigned int)a6 error:(id *)a7;
- (BOOL)setProperty:(unsigned int)a3 asDictionary:(id)a4;
- (BOOL)setProperty:(unsigned int)a3 asDictionary:(id)a4 async:(BOOL)a5 options:(unsigned int)a6 error:(id *)a7;
- (BOOL)setProperty:(unsigned int)a3 asNumber:(id)a4;
- (BOOL)setProperty:(unsigned int)a3 asNumber:(id)a4 async:(BOOL)a5 options:(unsigned int)a6 error:(id *)a7;
- (BOOL)setProperty:(unsigned int)a3 asString:(id)a4;
- (BOOL)setProperty:(unsigned int)a3 asString:(id)a4 async:(BOOL)a5 options:(unsigned int)a6 error:(id *)a7;
- (BRContainer)brContainer;
- (Class)classForArchiver;
- (FINode)_uiParent;
- (FINode)brContainerDocuments;
- (FINode)fileParent;
- (FINode)initWithCoder:(id)a3;
- (FINode)presentationNode;
- (FIProviderDomain)fiDomain;
- (FPItem)fpItem;
- (FPProviderDomain)fpDomain;
- (NSArray)itemDecorations;
- (NSArray)tags;
- (NSDate)contentModificationDate;
- (NSDate)creationDate;
- (NSDate)lastUsedDate;
- (NSError)enumeratorError;
- (NSNumber)childItemCount;
- (NSNumber)documentSize;
- (NSPersonNameComponents)ownerNameComponents;
- (NSProgress)copyProgress;
- (NSProgress)downloadProgress;
- (NSString)displayName;
- (NSString)fileName;
- (NSString)itemIdentifier;
- (NSString)typeIdentifier;
- (NSURL)fileURL;
- (UTType)contentType;
- (id)_debugChildren;
- (id)fetchLastUsedDate:(BOOL)a3;
- (id)fetchTags:(BOOL)a3;
- (id)iteratorWithOptions:(unsigned int)a3;
- (id)nodesToObserve;
- (id)propertyAsArray:(unsigned int)a3;
- (id)propertyAsArray:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6;
- (id)propertyAsBoolean:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6;
- (id)propertyAsData:(unsigned int)a3;
- (id)propertyAsData:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6;
- (id)propertyAsDate:(unsigned int)a3;
- (id)propertyAsDate:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6;
- (id)propertyAsDictionary:(unsigned int)a3;
- (id)propertyAsDictionary:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6;
- (id)propertyAsNSObject:(unsigned int)a3;
- (id)propertyAsNSObject:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6;
- (id)propertyAsNumber:(unsigned int)a3;
- (id)propertyAsNumber:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6;
- (id)propertyAsString:(unsigned int)a3;
- (id)propertyAsString:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6;
- (id)shortDescription;
- (unint64_t)hash;
- (unint64_t)nodeIs:(unint64_t)a3;
- (unint64_t)nodeIs:(unint64_t)a3 error:(id *)a4;
- (unsigned)bladeRunnerFlags;
- (unsigned)nodePermissions:(unsigned int)a3;
- (unsigned)nodePermissions:(unsigned int)a3 error:(id *)a4;
- (unsigned)volumeIs:(unsigned int)a3;
- (unsigned)volumeIs:(unsigned int)a3 error:(id *)a4;
- (void)synchronize;
@end

@implementation FINode

- (BOOL)isFolder
{
  return [(FINode *)self nodeIsAll:0x200000];
}

- (FINode)_uiParent
{
  v2 = [(FINode *)self fileParent];
  v3 = [v2 presentationNode];

  return (FINode *)v3;
}

- (FINode)presentationNode
{
  v3 = +[FIPresentationNodeMap presentationNodeForKeyNode:self];
  if (!v3) {
    v3 = self;
  }
  return v3;
}

+ (id)nodeFromNodeRef:(OpaqueNodeRef *)a3
{
  return a3;
}

- (unsigned)nodePermissions:(unsigned int)a3
{
  return [(FINode *)self nodePermissions:*(void *)&a3 error:0];
}

- (BOOL)isContainer
{
  return [(FINode *)self nodeIsAll:2];
}

- (id)propertyAsString:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  BOOL v5 = pthread_main_np() != 0;
  return [(FINode *)self propertyAsString:v3 async:v5 options:0 error:0];
}

- (NSString)displayName
{
  return (NSString *)[(FINode *)self propertyAsString:1684955501];
}

- (NSString)fileName
{
  return (NSString *)[(FINode *)self propertyAsString:1886282093];
}

- (unint64_t)hash
{
  return (unint64_t)self >> 4;
}

- (BOOL)nodeIsAll:(unint64_t)a3
{
  return -[FINode nodeIs:](self, "nodeIs:") == a3;
}

- (unint64_t)nodeIs:(unint64_t)a3
{
  return [(FINode *)self nodeIs:a3 error:0];
}

- (id)nodesToObserve
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = self;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)iCloudDefaultContainer
{
  if (ICloudDriveFPFSEnabled()
    && (iCloudDriveDomainIDForDataSeparated(0), (v2 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v3 = v2;
    v6.fString.fRef = &stru_1F2ABD380;
    CFRetain(&stru_1F2ABD380);
    TString::SetStringRefAsImmutable(&v6, v3);

    v4 = DefaultContainerOfDomainWithID(&v6);
    TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v6.fString.fRef);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)fiNodeFromURL:(id)a3
{
  CFURLRef v3 = (const __CFURL *)a3;
  CFURLRef v7 = v3;
  v8 = 0;
  if (TNode::GetNodeFromURL(&v7, (TNodePtr *)&v8, 0) || !TNodeFromFINode(v8))
  {
    v4 = 0;
  }
  else
  {
    BOOL v5 = (const TNode *)TNodeFromFINode(v8);
    v4 = FINodeFromTNode(v5);
  }

  return v4;
}

+ (id)iCloudLibrariesContainer
{
  TGlobalNodes::iCloudLibrariesContainerNode(&v5);
  v2 = (const TNode *)TNodeFromFINode(v5);
  CFURLRef v3 = FINodeFromTNode(v2);

  return v3;
}

+ (id)providerDomainsContainer
{
  TGlobalNodes::AllProvidersNode(&v5);
  v2 = (const TNode *)TNodeFromFINode(v5);
  CFURLRef v3 = FINodeFromTNode(v2);

  return v3;
}

+ (id)appLibraryNodeForNode:(id)a3
{
  CFURLRef v3 = [a3 presentationNode];
  v4 = objc_cast<FIDSNode,FINode * {__strong}>(v3);

  BOOL v5 = [v4 fileURL];
  TString v6 = [v5 URLByStandardizingPath];
  CFURLRef v7 = [v6 path];
  v20.fString.fRef = &stru_1F2ABD380;
  CFRetain(&stru_1F2ABD380);
  TString::SetStringRefAsImmutable(&v20, v7);

  v8 = +[FILocalStorageNode containerNodePathPrefix];
  v19.fString.fRef = &stru_1F2ABD380;
  CFRetain(&stru_1F2ABD380);
  TString::SetStringRefAsImmutable(&v19, v8);

  BOOL v9 = TString::BeginsWith(&v20, &v19);
  TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v19.fString.fRef);

  if (v9)
  {
    v10 = +[FILocalAppContainerCollection sharedInstance];
    if (([v10 isPopulated] & 1) == 0) {
      [v10 synchronizeWithOptions:0x1000000 async:0];
    }
  }
  else
  {
    v11 = iCloudDriveDomainIDForDataSeparated(0);
    if (!v11) {
      goto LABEL_18;
    }
    v14 = +[FIProviderDomain rootURLForProviderDomainID:cachePolicy:error:](FIProviderDomain, "rootURLForProviderDomainID:cachePolicy:error:", v11, 1, 0, v19.fString.fRef, v20.fString.fRef);
    v15 = v14;
    if (!v14)
    {

      goto LABEL_17;
    }
    v16 = [v14 path];
    v19.fString.fRef = &stru_1F2ABD380;
    CFRetain(&stru_1F2ABD380);
    TString::SetStringRefAsImmutable(&v19, v16);

    BOOL v17 = TString::BeginsWith(&v20, &v19);
    TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v19.fString.fRef);

    if (!v17) {
      goto LABEL_17;
    }
  }
  if (!v4)
  {
LABEL_17:
    v11 = 0;
    goto LABEL_18;
  }
  while (1)
  {
    if (v9) {
      objc_cast<FILocalAppContainerNode,FIDSNode * {__strong}>(v4);
    }
    else {
    v11 = objc_cast<FINode_ICloudAppLibrary,FIDSNode * {__strong}>(v4);
    }
    if (v11) {
      break;
    }
    v12 = [v4 parent];
    uint64_t v13 = objc_cast<FIDSNode,FINode * {__strong}>(v12);

    v4 = (void *)v13;
    if (!v13) {
      goto LABEL_17;
    }
  }
LABEL_18:
  TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v20.fString.fRef);

  return v11;
}

+ (NSString)currentHostAppIdentifier
{
  id v2 = a1;
  objc_sync_enter(v2);
  CFURLRef v3 = (void *)sCurrentHostAppIdentifier;
  if (!sCurrentHostAppIdentifier)
  {
    sCurrentHostAppIdentifier = (uint64_t)&stru_1F2ABD380;

    CFURLRef v3 = (void *)sCurrentHostAppIdentifier;
  }
  id v4 = v3;
  objc_sync_exit(v2);

  return (NSString *)v4;
}

+ (void)setCurrentHostAppIdentifier:(id)a3
{
  id v7 = a3;
  id v4 = a1;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 copy];
  TString v6 = (void *)sCurrentHostAppIdentifier;
  sCurrentHostAppIdentifier = v5;

  objc_sync_exit(v4);
}

+ (NSSet)protectedAppIdentifiers
{
  id v2 = a1;
  objc_sync_enter(v2);
  if (sProtectedAppIdentifiers)
  {
    id v3 = (id)sProtectedAppIdentifiers;
  }
  else
  {
    id v3 = [MEMORY[0x1E4F1CAD0] set];
  }
  id v4 = v3;
  objc_sync_exit(v2);

  return (NSSet *)v4;
}

+ (void)setProtectedAppIdentifiers:(id)a3
{
  id v12 = a3;
  id v4 = a1;
  objc_sync_enter(v4);
  if ([(id)sProtectedAppIdentifiers isEqual:v12])
  {
    objc_sync_exit(v4);
LABEL_7:

    goto LABEL_8;
  }
  uint64_t v5 = [v12 copy];
  TString v6 = (void *)sProtectedAppIdentifiers;
  sProtectedAppIdentifiers = v5;

  objc_sync_exit(v4);
  int v7 = pthread_main_np();
  v8 = +[FILocalAppContainerCollection sharedInstanceCreateIfNeeded:0];
  [v8 synchronizeWithOptions:0x1000000 async:v7 != 0];

  BOOL v9 = iCloudDriveDomainIDForDataSeparated(0);

  if (v9)
  {
    v10 = +[FINode iCloudLibrariesContainer];
    [v10 synchronizeWithOptions:0x1000000 async:v7 != 0];
  }
  v11 = iCloudDriveDomainIDForDataSeparated(1);

  if (v11)
  {
    id v4 = +[FINode dataSeparatedICloudLibrariesContainer];
    [v4 synchronizeWithOptions:0x1000000 async:v7 != 0];
    goto LABEL_7;
  }
LABEL_8:
}

- (FINode)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FINode *)self init];
  TString v6 = +[FIDSNode _makeWithCoder:v4];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (Class)classForArchiver
{
  return (Class)objc_opt_class();
}

+ (int)desktopServicesAPIVersion
{
  return 470;
}

+ (void)fiNodeFromItem:(id)a3 inFPv2Domain:(id)a4 completion:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  id v7 = a4;
  v8 = (void (**)(id, void, uint64_t))a5;
  if (v7)
  {
    id v9 = 0;
LABEL_4:
    id v12 = +[FIProviderDomain providerDomainForDomain:v7];
    if ([v12 isFPv2])
    {

      uint64_t v13 = FPItemManagerInstance();
      v14 = [v24 itemID];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3321888768;
      v25[2] = __49__FINode_fiNodeFromItem_inFPv2Domain_completion___block_invoke;
      v25[3] = &__block_descriptor_56_ea8_32c62_ZTSKZ49__FINode_fiNodeFromItem_inFPv2Domain_completion__E3__0_e29_v24__0__NSArray_8__NSError_16l;
      id v15 = v24;
      *(void *)buf = v15;
      id v16 = v7;
      *(void *)&buf[8] = v16;
      BOOL v17 = (void *)MEMORY[0x1D9436FC0](v8);
      *(void *)&buf[16] = v17;
      id v18 = v15;
      id v26 = v18;
      id v19 = v16;
      id v27 = v19;
      id v28 = (id)MEMORY[0x1D9436FC0](v17);
      [v13 fetchParentsForItemID:v14 recursively:1 completionHandler:v25];

      id v12 = v26;
    }
    else
    {
      uint64_t v20 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-8072 userInfo:0];

      v21 = LogObj(4);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "+[FINode fiNodeFromItem:inFPv2Domain:completion:]";
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v7;
        _os_log_impl(&dword_1D343E000, v21, OS_LOG_TYPE_ERROR, "%s expects an item in an FPv2 domain: %{public}@", buf, 0x16u);
      }

      v8[2](v8, 0, v20);
      id v9 = (id)v20;
    }

    goto LABEL_10;
  }
  v10 = (void *)FPProviderDomainClass();
  v11 = [v24 providerDomainID];
  id v29 = 0;
  id v7 = [v10 providerDomainWithID:v11 cachePolicy:1 error:&v29];
  id v9 = v29;

  if (v7) {
    goto LABEL_4;
  }
  v22 = LogObj(4);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    v23 = [v24 providerDomainID];
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v23;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v9;
    _os_log_impl(&dword_1D343E000, v22, OS_LOG_TYPE_ERROR, "Failed to get provider domain for %@: %@", buf, 0x16u);
  }
  id v7 = 0;
  v8[2](v8, 0, (uint64_t)v9);
LABEL_10:
}

void __49__FINode_fiNodeFromItem_inFPv2Domain_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  id v8 = v6;
  id v9 = v7;
  v45 = v8;
  if (v9)
  {
    v10 = LogObj(4);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = [*(id *)(a1 + 32) displayName];
      *(void *)&long long v52 = &stru_1F2ABD380;
      CFRetain(&stru_1F2ABD380);
      TString::SetStringRefAsImmutable((TString *)&v52, v11);

      id v12 = SanitizedStr((TString *)&v52);
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v9;
      _os_log_impl(&dword_1D343E000, v10, OS_LOG_TYPE_ERROR, "Failed to get the parent items for: %{public}@, error: %{public}@", buf, 0x16u);
      TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v52);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    uint64_t v13 = v9;
  }
  else
  {
    uint64_t v14 = [v8 count];
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    *(void *)&long long v52 = *(id *)(a1 + 40);
    v44 = v15;
    *((void *)&v52 + 1) = v44;
    if (v14) {
      id v16 = 0;
    }
    else {
      id v16 = *(void **)(a1 + 32);
    }
    v53[0] = (FPItem *)v16;
    BOOL v17 = +[FINode providerDomainsContainer];
    uint64_t v18 = TNodeFromFINode(v17);
    id v19 = [(FINode *)v17 iteratorWithOptions:4];
    uint64_t v20 = [v19 first];
    if (v20)
    {
      while (1)
      {
        v21 = [(FINode *)v20 fpDomain];
        v22 = v21;
        if (!v21)
        {
          id v3 = [MEMORY[0x1E4F1CA98] null];
          v22 = v3;
        }
        [*((id *)&v52 + 1) setObject:v22 forKeyedSubscript:v20];
        if (!v21) {

        }
        char v23 = [(id)v52 isEqual:v21];
        if (v23) {
          break;
        }
        uint64_t v24 = [v19 next];

        uint64_t v20 = (FINode *)v24;
        if (!v24) {
          goto LABEL_15;
        }
      }
    }
    else
    {
LABEL_15:
      +[FIProviderDomain providerDomainForDomain:](FIProviderDomain, "providerDomainForDomain:", (void)v52, v44);
      v49 = (FIProviderDomain *)objc_claimAutoreleasedReturnValue();
      v60[0] = v53[0] == 0;
      std::allocate_shared[abi:ne180100]<TFSInfo,std::allocator<TFSInfo>,FIProviderDomain * {__strong},FPItem * const {__strong}&,BOOL,void>(&v49, v53, v60, &v50);

      TNodePtr::TNodePtr((TNodePtr *)v60, (const TNode *)v18);
      *(void *)buf = 0;
      *(void *)&buf[8] = 0;
      TNode::CreateNode(v25, (uint64_t)&v50, (uint64_t)buf, &v48);
      if (*(void *)&buf[8]) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&buf[8]);
      }

      TNodePtr::TNodePtr((TNodePtr *)v60, (const TNode *)v18);
      TNode::StPopulating::StPopulating((TNode::StPopulating *)buf, (const TNodePtr *)v60, 0);

      BOOL v47 = 0;
      TChildrenList::AddNewChild(*(TChildrenList **)(v18 + 56), &v48, &v47, &v46);
      if (TNodeFromFINode(v46) && v47) {
        TNode::SendNotification((const TNode *)v18, 3, (id *)&v46, 0, 0);
      }
      id v26 = (const TNode *)TNodeFromFINode(v46);
      FINodeFromTNode(v26);
      uint64_t v20 = (FINode *)objc_claimAutoreleasedReturnValue();
      id v27 = LogObj(4);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v60 = 138543362;
        *(void *)&v60[4] = v20;
        _os_log_impl(&dword_1D343E000, v27, OS_LOG_TYPE_INFO, "Found FPv2 provider from manual lookup %{public}@", v60, 0xCu);
      }

      TNode::StPopulating::~StPopulating((TNode::StPopulating *)buf);
      if (v51) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v51);
      }
    }

    id v28 = [v8 reverseObjectEnumerator];
    id v29 = [v28 allObjects];
    v30 = (void *)[v29 mutableCopy];

    [v30 addObject:*(void *)(a1 + 32)];
    if ([v30 count] == 1)
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      uint64_t v13 = 0;
    }
    else if (v20)
    {
      uint64_t v31 = (TNode *)TNodeFromFINode(v20);
      IDContainerIteratorAdaptor<NSMutableArray<FPItem *>>::NSForwardIterator<NSMutableArray<FPItem *>>::NSForwardIterator((uint64_t)&v52, v30);
      IDContainerIteratorAdaptor<NSMutableArray<FPItem *>>::NSForwardIterator<NSMutableArray<FPItem *>>::NSForwardIterator((uint64_t)buf, (uint64_t)&v52, 1);

      while (1)
      {
        IDContainerIteratorAdaptor<NSMutableArray<FPItem *>>::IDContainerIteratorAdaptor((uint64_t)&v52, -1, v30);
        if (*(void *)buf == (void)v52)
        {
          BOOL v32 = v59 == v53[14];

          if (v32)
          {
            uint64_t v13 = 0;
            goto LABEL_44;
          }
        }
        else
        {
        }
        id v33 = *(id *)(*(void *)&buf[16] + 8 * v58);
        static_objc_cast<NSString,objc_object * {__strong}>(v33);
        v34 = (FPItem *)objc_claimAutoreleasedReturnValue();

        TNode::FindFPv2Child(v31, v34, (TNodePtr *)&v52);
        uint64_t v31 = (TNode *)TNodeFromFINode((FINode *)v52);

        if (!v31) {
          break;
        }

        uint64_t v35 = v58;
        if (v58 >= v57 - 1)
        {
          uint64_t v36 = [*(id *)buf countByEnumeratingWithState:&buf[8] objects:v56 count:4];
          uint64_t v35 = -1;
          uint64_t v57 = v36;
          uint64_t v58 = -1;
        }
        if (v56[4] != *v55)
        {
          objc_enumerationMutation(*(id *)buf);
          uint64_t v35 = v58;
        }
        uint64_t v58 = v35 + 1;
        v59 = (FPItem *)((char *)v59 + 1);
      }
      v37 = LogObj(4);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        v38 = +[FINode fiNodeFromItem:inFPv2Domain:completion:]::$_0::operator() const(NSArray<FPItem *> *,NSError *)::{lambda(NSArray<FPItem *> *,FPItem *)#1}::operator()(v30, v34);
        LODWORD(v52) = 138543362;
        *(void *)((char *)&v52 + 4) = v38;
        _os_log_impl(&dword_1D343E000, v37, OS_LOG_TYPE_ERROR, "Failed to find FINodes in FPItem parent chain: '%{public}@'", (uint8_t *)&v52, 0xCu);
      }
      uint64_t v13 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-8062 userInfo:0];

      uint64_t v31 = 0;
LABEL_44:

      uint64_t v42 = *(void *)(a1 + 48);
      v43 = FINodeFromTNode(v31);
      (*(void (**)(uint64_t, void *, void *))(v42 + 16))(v42, v43, v13);
    }
    else
    {
      uint64_t v13 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-8062 userInfo:0];
      v39 = LogObj(4);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        uint64_t v40 = *(void *)(a1 + 40);
        v41 = +[FINode fiNodeFromItem:inFPv2Domain:completion:]::$_0::operator() const(NSArray<FPItem *> *,NSError *)::{lambda(NSArray<FPItem *> *,FPItem *)#1}::operator()(v30, *(void **)(a1 + 32));
        *(_DWORD *)buf = 138543874;
        *(void *)&buf[4] = v40;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v41;
        *(_WORD *)&buf[22] = 2114;
        v55 = v44;
        _os_log_impl(&dword_1D343E000, v39, OS_LOG_TYPE_ERROR, "Failed to find FINode for the domain. DS doesn't know about it yet: %{public}@. path: %{public}@, known domains: %{public}@", buf, 0x20u);
      }
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
}

+ (id)fiNodeFromItem:(id *)a1 inFPv2Domain:completion:
{
  return a1;
}

+ (id)dataSeparatedICloudLibrariesContainer
{
  TGlobalNodes::DataSeparatedICloudLibrariesContainerNode(&v5);
  id v2 = (const TNode *)TNodeFromFINode(v5);
  id v3 = FINodeFromTNode(v2);

  return v3;
}

+ (id)dataSeparatedICloudDefaultContainer
{
  if (ICloudDriveFPFSEnabled()
    && (iCloudDriveDomainIDForDataSeparated(1), (id v2 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v3 = v2;
    v6.fString.fRef = &stru_1F2ABD380;
    CFRetain(&stru_1F2ABD380);
    TString::SetStringRefAsImmutable(&v6, v3);

    id v4 = DefaultContainerOfDomainWithID(&v6);
    TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v6.fString.fRef);
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

+ (id)_iCloudDrive
{
  id v2 = objc_alloc_init(FIICloudDrive);
  return v2;
}

+ (id)_dataSeparatedICloudDrive
{
  id v2 = objc_alloc_init(FIDataSeparatedICloudDrive);
  return v2;
}

- (NSDate)creationDate
{
  return (NSDate *)[(FINode *)self propertyAsDate:1634952036];
}

- (NSDate)contentModificationDate
{
  return (NSDate *)[(FINode *)self propertyAsDate:1836016740];
}

- (NSString)itemIdentifier
{
  id v3 = [(FINode *)self propertyAsString:1868720740];
  if ([v3 isEqualToString:@"0.0"]) {
    id v4 = (id)[[NSString alloc] initWithFormat:@"%s, %p", object_getClassName(self), self];
  }
  else {
    id v4 = v3;
  }
  uint64_t v5 = v4;

  return (NSString *)v5;
}

- (NSNumber)documentSize
{
  return (NSNumber *)[(FINode *)self propertyAsNumber:1819240307 async:1 options:0 error:0];
}

- (NSURL)fileURL
{
  return 0;
}

- (id)fetchLastUsedDate:(BOOL)a3
{
  return [(FINode *)self propertyAsDate:1819632756 async:!a3 options:0 error:0];
}

- (BOOL)isValid
{
  return 1;
}

- (id)iteratorWithOptions:(unsigned int)a3
{
}

- (unint64_t)nodeIs:(unint64_t)a3 error:(id *)a4
{
  if (a4)
  {
    ErrorWithOSStatus(-8058, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)nodeIsAny:(unint64_t)a3
{
  return [(FINode *)self nodeIs:a3] != 0;
}

- (unsigned)volumeIs:(unsigned int)a3 error:(id *)a4
{
  if (a4)
  {
    ErrorWithOSStatus(-8058, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (unsigned)volumeIs:(unsigned int)a3
{
  return [(FINode *)self volumeIs:*(void *)&a3 error:0];
}

- (unsigned)nodePermissions:(unsigned int)a3 error:(id *)a4
{
  if (a4)
  {
    ErrorWithOSStatus(-8058, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (NSProgress)copyProgress
{
  return 0;
}

- (NSProgress)downloadProgress
{
  return 0;
}

- (NSNumber)childItemCount
{
  BOOL v3 = pthread_main_np() != 0;
  return (NSNumber *)[(FINode *)self propertyAsNumber:1667785588 async:v3 options:4 error:0];
}

- (BOOL)isPopulated
{
  return 1;
}

- (NSArray)itemDecorations
{
  id v2 = [(FINode *)self propertyAsArray:1684366194];
  BOOL v3 = static_objc_cast<NSString,objc_object * {__strong}>(v2);

  return (NSArray *)v3;
}

- (BOOL)isShared
{
  return ([(FINode *)self bladeRunnerFlags] & 0x180) != 0;
}

- (BOOL)isSharedByCurrentUser
{
  return ([(FINode *)self bladeRunnerFlags] >> 8) & 1;
}

- (BOOL)isTopLevelSharedItem
{
  return [(FINode *)self propertyAsBool:1936225392];
}

- (BOOL)isTrashed
{
  return [(FINode *)self nodeIsAll:0x800000];
}

- (unsigned)bladeRunnerFlags
{
  BOOL v3 = [(FINode *)self propertyAsNumber:1969385844];
  id v4 = v3;
  if (v3) {
    unsigned int v2 = [v3 unsignedIntValue];
  }

  if (v4) {
    return v2;
  }
  else {
    return 0;
  }
}

- (NSPersonNameComponents)ownerNameComponents
{
  unsigned int v2 = [(FINode *)self propertyAsNSObject:1769171056];
  BOOL v3 = static_objc_cast<NSString,objc_object * {__strong}>(v2);

  return (NSPersonNameComponents *)v3;
}

- (NSDate)lastUsedDate
{
  return (NSDate *)[(FINode *)self propertyAsDate:1819632756];
}

- (UTType)contentType
{
  unsigned int v2 = [(FINode *)self propertyAsNSObject:1970566256];
  static_objc_cast<NSString,objc_object * {__strong}>(v2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();

  if (!v3) {
    id v3 = (id)*MEMORY[0x1E4F44408];
  }
  return (UTType *)v3;
}

- (BRContainer)brContainer
{
  return 0;
}

- (FINode)brContainerDocuments
{
  return 0;
}

- (FINode)fileParent
{
  return 0;
}

- (NSString)typeIdentifier
{
  return (NSString *)[(FINode *)self propertyAsString:1970563428];
}

- (FPProviderDomain)fpDomain
{
  return 0;
}

- (FIProviderDomain)fiDomain
{
  return 0;
}

- (id)fetchTags:(BOOL)a3
{
  id v3 = [(FINode *)self propertyAsArray:1718903156 async:!a3 options:0 error:0];
  id v4 = static_objc_cast<NSString,objc_object * {__strong}>(v3);

  return v4;
}

- (NSArray)tags
{
  BOOL v3 = pthread_main_np() == 0;
  return (NSArray *)[(FINode *)self fetchTags:v3];
}

- (NSError)enumeratorError
{
  return 0;
}

- (FPItem)fpItem
{
  return 0;
}

- (id)propertyAsNumber:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  if (a6)
  {
    ErrorWithOSStatus(-8051, 0);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)propertyAsNumber:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  BOOL v5 = pthread_main_np() != 0;
  return [(FINode *)self propertyAsNumber:v3 async:v5 options:0 error:0];
}

- (id)propertyAsDate:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  if (a6)
  {
    ErrorWithOSStatus(-8051, 0);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)propertyAsDate:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  BOOL v5 = pthread_main_np() != 0;
  return [(FINode *)self propertyAsDate:v3 async:v5 options:0 error:0];
}

- (id)propertyAsString:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  if (a6)
  {
    ErrorWithOSStatus(-8051, 0);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)propertyAsArray:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  if (a6)
  {
    ErrorWithOSStatus(-8051, 0);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)propertyAsArray:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  BOOL v5 = pthread_main_np() != 0;
  return [(FINode *)self propertyAsArray:v3 async:v5 options:0 error:0];
}

- (id)propertyAsNSObject:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  if (a6)
  {
    ErrorWithOSStatus(-8051, 0);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)propertyAsNSObject:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  BOOL v5 = pthread_main_np() != 0;
  return [(FINode *)self propertyAsNSObject:v3 async:v5 options:0 error:0];
}

- (id)propertyAsDictionary:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  if (a6)
  {
    ErrorWithOSStatus(-8051, 0);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)propertyAsDictionary:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  BOOL v5 = pthread_main_np() != 0;
  return [(FINode *)self propertyAsDictionary:v3 async:v5 options:0 error:0];
}

- (BOOL)propertyAsBool:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  if (a6)
  {
    ErrorWithOSStatus(-8051, 0);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)propertyAsBoolean:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  id v13 = 0;
  BOOL v7 = [(FINode *)self propertyAsBool:*(void *)&a3 async:a4 options:*(void *)&a5 error:&v13];
  id v8 = v13;
  id v9 = v8;
  if (v8)
  {
    id v10 = 0;
    if (a6) {
      *a6 = v8;
    }
  }
  else
  {
    v11 = (void *)MEMORY[0x1E4F1CC28];
    if (v7) {
      v11 = (void *)MEMORY[0x1E4F1CC38];
    }
    id v10 = v11;
  }

  return v10;
}

- (BOOL)propertyAsBool:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  BOOL v5 = pthread_main_np() != 0;
  return [(FINode *)self propertyAsBool:v3 async:v5 options:0 error:0];
}

- (id)propertyAsData:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  if (a6)
  {
    ErrorWithOSStatus(-8051, 0);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)propertyAsData:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  BOOL v5 = pthread_main_np() != 0;
  return [(FINode *)self propertyAsData:v3 async:v5 options:0 error:0];
}

- (BOOL)setProperty:(unsigned int)a3 asNumber:(id)a4 async:(BOOL)a5 options:(unsigned int)a6 error:(id *)a7
{
  id v8 = a4;
  id v9 = v8;
  if (a7)
  {
    if (v8) {
      int v10 = -8051;
    }
    else {
      int v10 = -8072;
    }
    ErrorWithOSStatus(v10, 0);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0;
}

- (BOOL)setProperty:(unsigned int)a3 asNumber:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  LOBYTE(v4) = [(FINode *)self setProperty:v4 asNumber:v6 async:pthread_main_np() != 0 options:0 error:0];

  return v4;
}

- (BOOL)setProperty:(unsigned int)a3 asDate:(id)a4 async:(BOOL)a5 options:(unsigned int)a6 error:(id *)a7
{
  if (a7)
  {
    ErrorWithOSStatus(-8051, 0);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)setProperty:(unsigned int)a3 asDate:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  LOBYTE(v4) = [(FINode *)self setProperty:v4 asDate:v6 async:pthread_main_np() != 0 options:0 error:0];

  return v4;
}

- (BOOL)setProperty:(unsigned int)a3 asString:(id)a4 async:(BOOL)a5 options:(unsigned int)a6 error:(id *)a7
{
  if (a7)
  {
    ErrorWithOSStatus(-8051, 0);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)setProperty:(unsigned int)a3 asString:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  LOBYTE(v4) = [(FINode *)self setProperty:v4 asString:v6 async:pthread_main_np() != 0 options:0 error:0];

  return v4;
}

- (BOOL)setProperty:(unsigned int)a3 asArray:(id)a4 async:(BOOL)a5 options:(unsigned int)a6 error:(id *)a7
{
  if (a7)
  {
    ErrorWithOSStatus(-8051, 0);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)setProperty:(unsigned int)a3 asArray:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  LOBYTE(v4) = [(FINode *)self setProperty:v4 asArray:v6 async:pthread_main_np() != 0 options:0 error:0];

  return v4;
}

- (BOOL)setProperty:(unsigned int)a3 asDictionary:(id)a4 async:(BOOL)a5 options:(unsigned int)a6 error:(id *)a7
{
  if (a7)
  {
    ErrorWithOSStatus(-8051, 0);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)setProperty:(unsigned int)a3 asDictionary:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  LOBYTE(v4) = [(FINode *)self setProperty:v4 asDictionary:v6 async:pthread_main_np() != 0 options:0 error:0];

  return v4;
}

- (BOOL)setProperty:(unsigned int)a3 asBool:(BOOL)a4 async:(BOOL)a5 options:(unsigned int)a6 error:(id *)a7
{
  if (a7)
  {
    ErrorWithOSStatus(-8051, 0);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)setProperty:(unsigned int)a3 asBool:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  BOOL v7 = pthread_main_np() != 0;
  return [(FINode *)self setProperty:v5 asBool:v4 async:v7 options:0 error:0];
}

- (BOOL)setProperty:(unsigned int)a3 asData:(id)a4 async:(BOOL)a5 options:(unsigned int)a6 error:(id *)a7
{
  id v8 = a4;
  id v9 = v8;
  if (a7)
  {
    if (v8) {
      int v10 = -8051;
    }
    else {
      int v10 = -8072;
    }
    ErrorWithOSStatus(v10, 0);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0;
}

- (BOOL)setProperty:(unsigned int)a3 asData:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  LOBYTE(v4) = [(FINode *)self setProperty:v4 asData:v6 async:pthread_main_np() != 0 options:0 error:0];

  return v4;
}

- (BOOL)isPackage
{
  return [(FINode *)self nodeIsAll:128];
}

- (BOOL)isVisible
{
  return [(FINode *)self nodeIsAll:8];
}

+ (id)sizeFolder:(id)a3
{
  uint64_t v3 = [a1 sizeFolder:a3 forCopyInto:0 withDelegate:0];
  return v3;
}

+ (id)sizeFolder:(id)a3 forCopyInto:(id)a4 withDelegate:(id)a5
{
  CFURLRef v7 = (const __CFURL *)a3;
  CFURLRef v8 = (const __CFURL *)a4;
  id v9 = a5;
  bzero(v26, 0x18uLL);
  v26[1] = 0;
  v26[2] = 0;
  v26[0] = v9;
  int v18 = 0;
  long long v16 = xmmword_1F2ABC250;
  BOOL v17 = off_1F2ABC260;
  int v10 = _NodeSizingV2(v7, v8, (uint64_t)&v16, (uint64_t)v26, &v18);
  v11 = objc_alloc_init(FIFolderSize);
  id v12 = v11;
  if (v10)
  {
    uint64_t v13 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v10 userInfo:0];
    error = v12->_error;
    v12->_error = (NSError *)v13;
  }
  else
  {
    v11->_totalItems = v19;
    v11->_userVisibleItems = v20;
    v11->_logicalBytes = v21;
    v11->_compressionAdjustedLogicalBytes = v22;
    v11->_physicalBytes = v23;
    v11->_skippedItemCount = v24;
    v11->_folderCount = v25;
  }

  return v12;
}

- (BOOL)requiresForcedSyncing
{
  return ![(FINode *)self nodeIsAll:0x8000000] && [(FINode *)self volumeIs:128] == 0;
}

- (BOOL)markAsUsed:(id *)a3
{
  if (a3)
  {
    ErrorWithOSStatus(-8058, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (void)synchronize
{
  BOOL v3 = pthread_main_np() != 0;
  [(FINode *)self synchronizeWithOptions:0 async:v3];
}

- (id)shortDescription
{
  v4.receiver = self;
  v4.super_class = (Class)FINode;
  unsigned int v2 = [(FINode *)&v4 description];
  return v2;
}

+ (id)_allInstances
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)_allRootInstances
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)_debugChildren
{
  return 0;
}

+ (id)fiNodeFromItem:inFPv2Domain:completion:
{
  id v3 = a1;
  id v4 = a2;
  TString::TString(&v20, "/", 1uLL);
  IDContainerIteratorAdaptor<NSArray<FPItem *>>::NSForwardIterator<NSArray<FPItem *>>::NSForwardIterator((uint64_t)&obj, v3);
  id v18 = v4;
  int64_t v19 = v3;
  IDContainerIteratorAdaptor<NSArray<FPItem *>>::IDContainerIteratorAdaptor((uint64_t)v22, -1, v3);
  id v5 = v4;
  CFStringRef theString = &stru_1F2ABD380;
  CFRetain(&stru_1F2ABD380);
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  while (obj != v22[0] || v28 != v22[16])
  {
    id v7 = *(id *)(v24[1] + 8 * v27);
    if (objc_msgSend(v7, "isEqualToItem:", v5, v18, v19))
    {
      TString::TString(&v32, "<<< '", 5uLL);
      CFURLRef v8 = [v7 displayName];
      v31.fString.fRef = &stru_1F2ABD380;
      CFRetain(&stru_1F2ABD380);
      TString::SetStringRefAsImmutable(&v31, v8);

      fRef = v32.fString.fRef;
      v33.fString.fRef = &stru_1F2ABD380;
      CFRetain(&stru_1F2ABD380);
      MutableCopy = CFStringCreateMutableCopy(v6, 0, fRef);
      CFRelease(&stru_1F2ABD380);
      v33.fString.fRef = MutableCopy;
      TString::Append(&v33, &v31);
      TString::TString(&v30, "' >>>", 5uLL);
      v11 = v33.fString.fRef;
      v29.fString.fRef = &stru_1F2ABD380;
      CFRetain(&stru_1F2ABD380);
      id v12 = CFStringCreateMutableCopy(v6, 0, v11);
      CFRelease(&stru_1F2ABD380);
      v29.fString.fRef = v12;
      TString::Append(&v29, &v30);
      TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v30.fString.fRef);
      TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v33.fString.fRef);
      TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v31.fString.fRef);

      TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v32.fString.fRef);
    }
    else
    {
      uint64_t v13 = [v7 displayName];
      v29.fString.fRef = &stru_1F2ABD380;
      CFRetain(&stru_1F2ABD380);
      TString::SetStringRefAsImmutable(&v29, v13);
    }
    if (CFStringGetLength(theString) && CFStringGetLength(v29.fString.fRef)) {
      TString::Append((TString *)&theString, &v20);
    }
    TString::Append((TString *)&theString, &v29);
    TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v29.fString.fRef);
    uint64_t v14 = v27;
    if (v27 >= v26 - 1)
    {
      uint64_t v15 = [obj countByEnumeratingWithState:v24 objects:v25 count:4];
      uint64_t v14 = -1;
      uint64_t v26 = v15;
      uint64_t v27 = -1;
    }
    if (v25[4] != *(void *)v24[2])
    {
      objc_enumerationMutation(obj);
      uint64_t v14 = v27;
    }
    uint64_t v27 = v14 + 1;
    ++v28;
  }

  TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v20.fString.fRef);
  long long v16 = SanitizedPath((TString *)&theString);
  TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&theString);

  return v16;
}

@end