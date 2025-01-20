@interface IMFileTransferCenter
+ (Class)fileTransferClass;
+ (Class)transferCenterClass;
+ (id)sharedInstance;
+ (void)setTransferCenterClass:(Class)a3;
- (BOOL)disconnectionListenerSetUp;
- (BOOL)doesLocalURLRequireArchiving:(id)a3 toHandle:(id)a4;
- (BOOL)hasActiveFileTransfers;
- (BOOL)hasPendingFileTransfers;
- (BOOL)isActiveTransfer:(id)a3;
- (BOOL)isFileTransfer:(id)a3 preauthorizedWithDictionary:(id)a4;
- (BOOL)registerGUID:(id)a3 forNewOutgoingTransferWithLocalURL:(id)a4;
- (BOOL)shouldIssueSandboxEstensionsForTransfers;
- (BOOL)wasFileTransferPreauthorized:(id)a3;
- (IMDaemonMultiplexedConnectionManaging)daemonConnection;
- (NSArray)activeTransferGUIDs;
- (NSArray)orderedTransfers;
- (NSArray)orderedTransfersGUIDs;
- (NSDictionary)transfers;
- (NSMutableArray)preauthorizedGUIDs;
- (NSMutableArray)preauthorizedInfos;
- (NSMutableDictionary)accountIDToTransferGUIDsMap;
- (NSMutableDictionary)fetchHighQualityVariantCompletionHandlers;
- (NSMutableDictionary)guidToRemovedTransferMap;
- (NSMutableDictionary)guidToTransferMap;
- (NSMutableDictionary)localFileURLRetrievalCompletionHandlers;
- (NSMutableDictionary)localFileURLRetrievalWithGuidCompletionHandlers;
- (NSMutableDictionary)redownloadlocalFilesWithURLCompletionHandlers;
- (NSMutableSet)activeTransfers;
- (NSMutableSet)pendingTransfers;
- (id)chatForTransfer:(id)a3;
- (id)createNewOutgoingGroupPhotoTransferWithLocalFileURL:(id)a3;
- (id)createNewOutgoingTransferWithLocalFileURL:(id)a3;
- (id)guidsForStoredAttachmentPayloadData:(id)a3 messageGUID:(id)a4;
- (id)transferForGUID:(id)a3;
- (id)transferForGUID:(id)a3 includeRemoved:(BOOL)a4;
- (id)transfersForAccount:(id)a3;
- (void)_addActiveTransfer:(id)a3;
- (void)_addPendingTransfer:(id)a3;
- (void)_addTransfer:(id)a3;
- (void)_addTransfer:(id)a3 toAccount:(id)a4;
- (void)_clearTransfers;
- (void)_createNewOutgoingFileTransferWithTransferGUID:(id)a3 localFileURL:(id)a4;
- (void)_daemonDisconnected:(id)a3;
- (void)_daemonRestarted:(id)a3;
- (void)_fetchHighQualityVariantForTransferGUID:(id)a3 completion:(id)a4;
- (void)_handleAllFileTransfers:(id)a3;
- (void)_handleFileTransfer:(id)a3 createdWithProperties:(id)a4;
- (void)_handleFileTransfer:(id)a3 explicitDownloadSucceededWithPath:(id)a4 livePhotoBundlePath:(id)a5;
- (void)_handleFileTransfer:(id)a3 highQualityDownloadSucceededWithPath:(id)a4;
- (void)_handleFileTransfer:(id)a3 updatedWithCurrentBytes:(unint64_t)a4 totalBytes:(unint64_t)a5 averageTransferRate:(unint64_t)a6;
- (void)_handleFileTransfer:(id)a3 updatedWithProperties:(id)a4;
- (void)_handleFileTransferDownloadFailedWithLocalURL:(id)a3 error:(id)a4;
- (void)_handleFileTransferDownloadSucceededWithLocalURL:(id)a3;
- (void)_handleFileTransferExplicitDownloadFailed:(id)a3 suggestedRetryGUID:(id)a4 error:(id)a5;
- (void)_handleFileTransferFinishedRemoteIntentDownload:(id)a3;
- (void)_handleFileTransferHighQualityDownloadFailed:(id)a3;
- (void)_handleFileTransfers:(id)a3 createdWithLocalPaths:(id)a4;
- (void)_handleSerializedFileTransfers:(id)a3;
- (void)_initiateHighQualityVariantDownloadWithDaemonForGUID:(id)a3;
- (void)_initiateLocalFileURLRetrievalInDaemonForGUID:(id)a3 options:(int64_t)a4;
- (void)_initiateLocalFileURLRetrievalInDaemonForGUIDs:(id)a3 options:(int64_t)a4;
- (void)_registerDaemonListenerIfNecessary;
- (void)_removeActiveTransfer:(id)a3;
- (void)_removeAllActiveTransfers;
- (void)_removePendingTransfer:(id)a3;
- (void)acceptFileTransferIfPreauthorzed:(id)a3;
- (void)acceptTransfer:(id)a3;
- (void)acceptTransfer:(id)a3 withPath:(id)a4 autoRename:(BOOL)a5 overwrite:(BOOL)a6;
- (void)acknowledgeAllPendingTransfers;
- (void)assignTransfer:(id)a3 toHandle:(id)a4;
- (void)assignTransfer:(id)a3 toMessage:(id)a4 account:(id)a5;
- (void)clearFinishedTransfers;
- (void)createItemForPHAssetWithUUID:(id)a3 parentChatItemGUID:(id)a4 chatGUID:(id)a5;
- (void)dealloc;
- (void)deleteTransfer:(id)a3;
- (void)downloadFileTransferWithLocalURL:(id)a3 completion:(id)a4;
- (void)fetchHighQualityVariantForTransfer:(id)a3 completion:(id)a4;
- (void)preWarmConnection;
- (void)preauthorizeFileTransferFromOtherPerson:(id)a3 account:(id)a4 filename:(id)a5 saveToPath:(id)a6;
- (void)registerTransferWithDaemon:(id)a3;
- (void)removeTransfer:(id)a3;
- (void)retargetTransfer:(id)a3 toPath:(id)a4;
- (void)retrieveLocalFileURLForFileTransferWithGUID:(id)a3 options:(int64_t)a4 completion:(id)a5;
- (void)retrieveLocalFileURLForFileTransferWithGUIDs:(id)a3 options:(int64_t)a4 completion:(id)a5;
- (void)setAccountIDToTransferGUIDsMap:(id)a3;
- (void)setActiveTransfers:(id)a3;
- (void)setAuxImageForTransfer:(id)a3 value:(BOOL)a4;
- (void)setAuxVideoForTransfer:(id)a3 value:(BOOL)a4;
- (void)setCommSafetySensitiveForTransfer:(id)a3 value:(int64_t)a4;
- (void)setDaemonConnection:(id)a3;
- (void)setDisconnectionListenerSetUp:(BOOL)a3;
- (void)setFetchHighQualityVariantCompletionHandlers:(id)a3;
- (void)setGuidToRemovedTransferMap:(id)a3;
- (void)setGuidToTransferMap:(id)a3;
- (void)setIssueSandboxEstensionsForTransfers:(BOOL)a3;
- (void)setLocalFileURLRetrievalCompletionHandlers:(id)a3;
- (void)setLocalFileURLRetrievalWithGuidCompletionHandlers:(id)a3;
- (void)setPendingTransfers:(id)a3;
- (void)setPreauthorizedGUIDs:(id)a3;
- (void)setPreauthorizedInfos:(id)a3;
- (void)setRedownloadlocalFilesWithURLCompletionHandlers:(id)a3;
- (void)stopTransfer:(id)a3;
@end

@implementation IMFileTransferCenter

+ (id)sharedInstance
{
  v5 = (void *)qword_1EB3F2470;
  if (!qword_1EB3F2470)
  {
    id v6 = objc_alloc_init((Class)objc_msgSend_transferCenterClass(a1, a2, v2, v3));
    v7 = (void *)qword_1EB3F2470;
    qword_1EB3F2470 = (uint64_t)v6;

    v5 = (void *)qword_1EB3F2470;
  }

  return v5;
}

+ (Class)transferCenterClass
{
  if (qword_1E965E878)
  {
    id v2 = (id)qword_1E965E878;
  }
  else
  {
    objc_opt_class();
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }

  return (Class)v2;
}

- (void)_removeAllActiveTransfers
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend_copy(self->_activeTransfers, a2, v2, v3);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v5;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v14, (uint64_t)v18, 16);
  if (v8)
  {
    uint64_t v11 = v8;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend__removeActiveTransfer_(self, v9, *(void *)(*((void *)&v14 + 1) + 8 * v13++), v10, (void)v14);
      }
      while (v11 != v13);
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v14, (uint64_t)v18, 16);
    }
    while (v11);
  }
}

- (void)acknowledgeAllPendingTransfers
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend_copy(self->_pendingTransfers, a2, v2, v3);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v5;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v14, (uint64_t)v18, 16);
  if (v8)
  {
    uint64_t v11 = v8;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend__removePendingTransfer_(self, v9, *(void *)(*((void *)&v14 + 1) + 8 * v13++), v10, (void)v14);
      }
      while (v11 != v13);
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v14, (uint64_t)v18, 16);
    }
    while (v11);
  }
}

- (void)_clearTransfers
{
  objc_msgSend__removeAllActiveTransfers(self, a2, v2, v3);
  objc_msgSend_acknowledgeAllPendingTransfers(self, v5, v6, v7);
  objc_msgSend_removeAllObjects(self->_guidToTransferMap, v8, v9, v10);
  objc_msgSend_removeAllObjects(self->_guidToRemovedTransferMap, v11, v12, v13);
  objc_msgSend_removeAllObjects(self->_accountIDToTransferGUIDsMap, v14, v15, v16);
  objc_msgSend_removeAllObjects(self->_preauthorizedInfos, v17, v18, v19);
  objc_msgSend_removeAllObjects(self->_preauthorizedGUIDs, v20, v21, v22);
  objc_msgSend_removeAllObjects(self->_activeTransfers, v23, v24, v25);
  objc_msgSend_removeAllObjects(self->_pendingTransfers, v26, v27, v28);
  if (!objc_msgSend_count(self->_guidToTransferMap, v29, v30, v31))
  {
    guidToTransferMap = self->_guidToTransferMap;
    self->_guidToTransferMap = 0;
  }
  if (!objc_msgSend_count(self->_guidToRemovedTransferMap, v32, v33, v34))
  {
    guidToRemovedTransferMap = self->_guidToRemovedTransferMap;
    self->_guidToRemovedTransferMap = 0;
  }
  if (!objc_msgSend_count(self->_accountIDToTransferGUIDsMap, v36, v37, v38))
  {
    accountIDToTransferGUIDsMap = self->_accountIDToTransferGUIDsMap;
    self->_accountIDToTransferGUIDsMap = 0;
  }
  if (!objc_msgSend_count(self->_preauthorizedInfos, v40, v41, v42))
  {
    preauthorizedInfos = self->_preauthorizedInfos;
    self->_preauthorizedInfos = 0;
  }
  if (!objc_msgSend_count(self->_preauthorizedGUIDs, v44, v45, v46))
  {
    preauthorizedGUIDs = self->_preauthorizedGUIDs;
    self->_preauthorizedGUIDs = 0;
  }
  if (!objc_msgSend_count(self->_activeTransfers, v48, v49, v50))
  {
    activeTransfers = self->_activeTransfers;
    self->_activeTransfers = 0;
  }
  if (!objc_msgSend_count(self->_pendingTransfers, v52, v53, v54))
  {
    pendingTransfers = self->_pendingTransfers;
    self->_pendingTransfers = 0;
  }
}

- (void)_handleAllFileTransfers:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_msgSend__clearTransfers(self, v5, v6, v7);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v11 = objc_msgSend_allKeys(v4, v8, v9, v10, 0);
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v34, (uint64_t)v38, 16);
  if (v13)
  {
    uint64_t v16 = v13;
    uint64_t v17 = *(void *)v35;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v35 != v17) {
          objc_enumerationMutation(v11);
        }
        uint64_t v19 = objc_msgSend_objectForKey_(v4, v14, *(void *)(*((void *)&v34 + 1) + 8 * v18), v15);
        v20 = objc_opt_class();
        id v24 = objc_alloc_init((Class)objc_msgSend_fileTransferClass(v20, v21, v22, v23));
        objc_msgSend__updateWithDictionaryRepresentation_(v24, v25, (uint64_t)v19, v26);
        objc_msgSend__addTransfer_(self, v27, (uint64_t)v24, v28);

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v34, (uint64_t)v38, 16);
    }
    while (v16);
  }

  v32 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v29, v30, v31);
  objc_msgSend___mainThreadPostNotificationName_object_(v32, v33, @"__kIMFileTransferRefreshAllNotification", (uint64_t)v4);
}

- (void)_addTransfer:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v8 = v4;
  if (v4)
  {
    uint64_t v9 = objc_msgSend_guid(v4, v5, v6, v7);

    if (v9)
    {
      guidToTransferMap = self->_guidToTransferMap;
      if (!guidToTransferMap)
      {
        Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        uint64_t v15 = self->_guidToTransferMap;
        self->_guidToTransferMap = Mutable;

        guidToTransferMap = self->_guidToTransferMap;
      }
      uint64_t v16 = objc_msgSend_guid(v8, v10, v11, v12);
      objc_msgSend_setObject_forKey_(guidToTransferMap, v17, (uint64_t)v8, (uint64_t)v16);

      if (IMOSLoggingEnabled())
      {
        uint64_t v21 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          uint64_t v25 = objc_msgSend_guid(v8, v22, v23, v24);
          int v36 = 138412290;
          long long v37 = v25;
          _os_log_impl(&dword_1A4AF7000, v21, OS_LOG_TYPE_INFO, "_addTransfer: %@", (uint8_t *)&v36, 0xCu);
        }
      }
      v29 = objc_msgSend_accountID(v8, v18, v19, v20);
      if (v29) {
        objc_msgSend__addTransfer_toAccount_(self, v26, (uint64_t)v8, (uint64_t)v29);
      }
      if (!objc_msgSend_transferState(v8, v26, v27, v28))
      {
        uint64_t v33 = objc_msgSend_guid(v8, v30, v31, v32);
        objc_msgSend__addPendingTransfer_(self, v34, (uint64_t)v33, v35);
      }
    }
  }
}

+ (Class)fileTransferClass
{
  return (Class)objc_opt_class();
}

+ (void)setTransferCenterClass:(Class)a3
{
  qword_1E965E878 = (uint64_t)a3;
}

- (void)dealloc
{
  v5 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], a2, v2, v3);
  objc_msgSend_removeObserver_(v5, v6, (uint64_t)self, v7);

  v8.receiver = self;
  v8.super_class = (Class)IMFileTransferCenter;
  [(IMFileTransferCenter *)&v8 dealloc];
}

- (BOOL)hasPendingFileTransfers
{
  return objc_msgSend_count(self->_pendingTransfers, a2, v2, v3) != 0;
}

- (void)_addPendingTransfer:(id)a3
{
  id v4 = (const char *)a3;
  pendingTransfers = self->_pendingTransfers;
  uint64_t v9 = (char *)v4;
  if (!pendingTransfers)
  {
    uint64_t v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    objc_super v8 = self->_pendingTransfers;
    self->_pendingTransfers = v7;

    id v4 = v9;
    pendingTransfers = self->_pendingTransfers;
  }
  objc_msgSend_addObject_(pendingTransfers, v4, (uint64_t)v4, v5);
}

- (void)_removePendingTransfer:(id)a3
{
  id v12 = a3;
  if (objc_msgSend_containsObject_(self->_pendingTransfers, v4, (uint64_t)v12, v5))
  {
    objc_msgSend_removeObject_(self->_pendingTransfers, v6, (uint64_t)v12, v7);
    if (!objc_msgSend_count(self->_pendingTransfers, v8, v9, v10))
    {
      pendingTransfers = self->_pendingTransfers;
      self->_pendingTransfers = 0;
    }
  }
}

- (BOOL)hasActiveFileTransfers
{
  return objc_msgSend_count(self->_activeTransfers, a2, v2, v3) != 0;
}

- (void)_addActiveTransfer:(id)a3
{
  id v4 = (const char *)a3;
  activeTransfers = self->_activeTransfers;
  uint64_t v11 = (char *)v4;
  if (!activeTransfers)
  {
    uint64_t v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    objc_super v8 = self->_activeTransfers;
    self->_activeTransfers = v7;

    id v4 = v11;
    activeTransfers = self->_activeTransfers;
  }
  objc_msgSend_addObject_(activeTransfers, v4, (uint64_t)v4, v5);
  objc_msgSend__removePendingTransfer_(self, v9, (uint64_t)v11, v10);
}

- (void)_removeActiveTransfer:(id)a3
{
  id v12 = a3;
  if (objc_msgSend_containsObject_(self->_activeTransfers, v4, (uint64_t)v12, v5))
  {
    objc_msgSend_removeObject_(self->_activeTransfers, v6, (uint64_t)v12, v7);
    if (!objc_msgSend_count(self->_activeTransfers, v8, v9, v10))
    {
      activeTransfers = self->_activeTransfers;
      self->_activeTransfers = 0;
    }
  }
}

- (BOOL)isActiveTransfer:(id)a3
{
  return objc_msgSend_containsObject_(self->_activeTransfers, a2, (uint64_t)a3, v3);
}

- (void)_addTransfer:(id)a3 toAccount:(id)a4
{
  id v20 = a3;
  id v8 = a4;
  if (v8)
  {
    id v12 = objc_msgSend_objectForKey_(self->_accountIDToTransferGUIDsMap, v6, (uint64_t)v8, v7);
    if (!v12)
    {
      id v12 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v9, v10, v11);
      accountIDToTransferGUIDsMap = self->_accountIDToTransferGUIDsMap;
      if (!accountIDToTransferGUIDsMap)
      {
        Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        uint64_t v16 = self->_accountIDToTransferGUIDsMap;
        self->_accountIDToTransferGUIDsMap = Mutable;

        accountIDToTransferGUIDsMap = self->_accountIDToTransferGUIDsMap;
      }
      objc_msgSend_setObject_forKey_(accountIDToTransferGUIDsMap, v13, (uint64_t)v12, (uint64_t)v8);
    }
    uint64_t v17 = objc_msgSend_guid(v20, v9, v10, v11);
    objc_msgSend_addObject_(v12, v18, (uint64_t)v17, v19);
  }
}

- (BOOL)doesLocalURLRequireArchiving:(id)a3 toHandle:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v10 = objc_msgSend_path(v6, v7, v8, v9);
  uint64_t v14 = objc_msgSend_defaultHFSFileManager(MEMORY[0x1E4F6C348], v11, v12, v13);
  uint64_t v30 = 0;
  uint64_t v16 = objc_msgSend_attributesOfItemAtPath_error_((void *)v14, v15, (uint64_t)v10, (uint64_t)&v30);

  LOBYTE(v14) = objc_msgSend__doesLocalURLRequireArchiving_(MEMORY[0x1E4F6E780], v17, (uint64_t)v6, v18);
  char hasCapability = objc_msgSend_hasCapability_(v5, v19, 0x80000000000, v20);

  uint64_t v24 = objc_msgSend_objectForKey_(v16, v22, *MEMORY[0x1E4F283B8], v23);
  char isEqual = objc_msgSend_isEqual_(v24, v25, *MEMORY[0x1E4F283C0], v26);

  if (v14) {
    char v28 = 1;
  }
  else {
    char v28 = isEqual & (hasCapability ^ 1);
  }

  return v28;
}

- (id)createNewOutgoingTransferWithLocalFileURL:(id)a3
{
  id v4 = a3;
  id v5 = IMTemporaryFileTransferGUIDForNewOutgoingTransfer();
  objc_msgSend__createNewOutgoingFileTransferWithTransferGUID_localFileURL_(self, v6, (uint64_t)v5, (uint64_t)v4);

  return v5;
}

- (id)createNewOutgoingGroupPhotoTransferWithLocalFileURL:(id)a3
{
  id v4 = a3;
  id v5 = IMTemporaryFileTransferGUIDForNewOutgoingTransfer();
  id v6 = IMFileTransferGUIDForAttachmentMessagePartAtMessageGUIDAndMessagePartIndex();
  objc_msgSend__createNewOutgoingFileTransferWithTransferGUID_localFileURL_(self, v7, (uint64_t)v6, (uint64_t)v4);

  return v6;
}

- (void)_createNewOutgoingFileTransferWithTransferGUID:(id)a3 localFileURL:(id)a4
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v65 = a3;
  id v6 = a4;
  uint64_t v10 = objc_msgSend_path(v6, v7, v8, v9);
  uint64_t v14 = objc_msgSend_defaultHFSFileManager(MEMORY[0x1E4F6C348], v11, v12, v13);
  id v66 = 0;
  uint64_t v16 = objc_msgSend_attributesOfItemAtPath_error_(v14, v15, (uint64_t)v10, (uint64_t)&v66);
  id v64 = v66;

  uint64_t v19 = objc_msgSend_objectForKey_(v16, v17, *MEMORY[0x1E4F283B8], v18);
  uint64_t isEqual = objc_msgSend_isEqual_(v19, v20, *MEMORY[0x1E4F283C0], v21);

  uint64_t v23 = objc_opt_class();
  id v27 = objc_alloc((Class)objc_msgSend_fileTransferClass(v23, v24, v25, v26));
  uint64_t v31 = objc_msgSend_lastPathComponent(v10, v28, v29, v30);
  uint64_t v35 = objc_msgSend_fileSize(v16, v32, v33, v34);
  LODWORD(v14) = objc_msgSend_fileHFSTypeCode(v16, v36, v37, v38);
  LODWORD(v19) = objc_msgSend_fileHFSCreatorCode(v16, v39, v40, v41);
  BYTE2(v63) = 0;
  LOWORD(v63) = objc_msgSend_fileHFSFlags(v16, v42, v43, v44);
  isIncoming = objc_msgSend__initWithGUID_filename_isDirectory_localURL_account_otherPerson_totalBytes_hfsType_hfsCreator_hfsFlags_isIncoming_(v27, v45, (uint64_t)v65, (uint64_t)v31, isEqual, v6, 0, 0, v35, __PAIR64__(v19, v14), v63);

  if (objc_msgSend_shouldIssueSandboxEstensionsForTransfers(self, v47, v48, v49))
  {
    id v52 = v10;
    objc_msgSend_UTF8String(v52, v53, v54, v55);
    v57 = (void *)sandbox_extension_issue_file();
    if (v57)
    {
      v58 = objc_msgSend_stringWithCString_encoding_(NSString, v56, (uint64_t)v57, 4);
      free(v57);
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v61 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
        {
          int v62 = *__error();
          *(_DWORD *)buf = 138412546;
          id v68 = v52;
          __int16 v69 = 1024;
          int v70 = v62;
          _os_log_impl(&dword_1A4AF7000, v61, OS_LOG_TYPE_INFO, "Failed to issue sandbox extension for path %@, errno %d", buf, 0x12u);
        }
      }
      v58 = 0;
    }
    objc_msgSend_setSandboxToken_(isIncoming, v59, (uint64_t)v58, v60);
  }
  objc_msgSend__addTransfer_(self, v50, (uint64_t)isIncoming, v51);
}

- (BOOL)registerGUID:(id)a3 forNewOutgoingTransferWithLocalURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v14 = objc_msgSend_length(v6, v8, v9, v10);
  if (v14)
  {
    uint64_t v15 = objc_msgSend_path(v7, v11, v12, v13);
    uint64_t v19 = objc_msgSend_defaultHFSFileManager(MEMORY[0x1E4F6C348], v16, v17, v18);
    uint64_t v60 = 0;
    uint64_t v21 = objc_msgSend_attributesOfItemAtPath_error_(v19, v20, (uint64_t)v15, (uint64_t)&v60);

    uint64_t v24 = objc_msgSend_objectForKey_(v21, v22, *MEMORY[0x1E4F283B8], v23);
    uint64_t isEqual = objc_msgSend_isEqual_(v24, v25, *MEMORY[0x1E4F283C0], v26);

    isIncoming = objc_msgSend_transferForGUID_(self, v28, (uint64_t)v6, v29);
    if (!isIncoming)
    {
      uint64_t v33 = objc_opt_class();
      id v59 = objc_alloc((Class)objc_msgSend_fileTransferClass(v33, v34, v35, v36));
      uint64_t v40 = objc_msgSend_lastPathComponent(v15, v37, v38, v39);
      uint64_t v58 = objc_msgSend_fileSize(v21, v41, v42, v43);
      unsigned int v47 = objc_msgSend_fileHFSTypeCode(v21, v44, v45, v46);
      unsigned int v51 = objc_msgSend_fileHFSCreatorCode(v21, v48, v49, v50);
      BYTE2(v57) = 0;
      LOWORD(v57) = objc_msgSend_fileHFSFlags(v21, v52, v53, v54);
      isIncoming = objc_msgSend__initWithGUID_filename_isDirectory_localURL_account_otherPerson_totalBytes_hfsType_hfsCreator_hfsFlags_isIncoming_(v59, v55, (uint64_t)v6, (uint64_t)v40, isEqual, v7, 0, 0, v58, __PAIR64__(v51, v47), v57);
    }
    objc_msgSend__addTransfer_(self, v30, (uint64_t)isIncoming, v31);
  }
  return v14 != 0;
}

- (void)assignTransfer:(id)a3 toMessage:(id)a4 account:(id)a5
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v16 = objc_msgSend_transferForGUID_(self, v11, (uint64_t)v8, v12);
  if (v16)
  {
    uint64_t v17 = objc_msgSend_uniqueID(v10, v13, v14, v15);
    objc_msgSend__setAccount_otherPerson_(v16, v18, (uint64_t)v17, 0);
    uint64_t v22 = objc_msgSend_guid(v9, v19, v20, v21);
    objc_msgSend_setMessageGUID_(v16, v23, (uint64_t)v22, v24);

    objc_msgSend__addTransfer_toAccount_(self, v25, (uint64_t)v16, (uint64_t)v17);
    if (IMOSLoggingEnabled())
    {
      uint64_t v29 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        int v42 = 138412546;
        id v43 = v8;
        __int16 v44 = 2112;
        id v45 = v9;
        _os_log_impl(&dword_1A4AF7000, v29, OS_LOG_TYPE_INFO, "Adding transfer guid: %@ to message: %@", (uint8_t *)&v42, 0x16u);
      }
    }
    uint64_t v30 = objc_msgSend_sharedInstance(IMDaemonController, v26, v27, v28);
    uint64_t v34 = objc_msgSend__dictionaryRepresentation(v16, v31, v32, v33);
    objc_msgSend_fileTransfer_createdWithProperties_(v30, v35, (uint64_t)v8, (uint64_t)v34);

    uint64_t v39 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v36, v37, v38);
    objc_msgSend___mainThreadPostNotificationName_object_(v39, v40, @"__kIMFileTransferCreatedNotification", (uint64_t)v16);
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v41 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      int v42 = 138412290;
      id v43 = v8;
      _os_log_impl(&dword_1A4AF7000, v41, OS_LOG_TYPE_INFO, "Not assigning transfer guid: %@   transfer doesn't exist", (uint8_t *)&v42, 0xCu);
    }
  }
}

- (void)assignTransfer:(id)a3 toHandle:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v13 = objc_msgSend_transferForGUID_(self, v8, (uint64_t)v6, v9);
  if (v13)
  {
    uint64_t v14 = objc_msgSend_account(v7, v10, v11, v12);
    uint64_t v18 = objc_msgSend_uniqueID(v14, v15, v16, v17);

    uint64_t v22 = objc_msgSend_localURL(v13, v19, v20, v21);
    int doesLocalURLRequireArchiving_toHandle = objc_msgSend_doesLocalURLRequireArchiving_toHandle_(self, v23, (uint64_t)v22, (uint64_t)v7);

    if (doesLocalURLRequireArchiving_toHandle) {
      objc_msgSend__setForceArchive_(v13, v25, 1, v27);
    }
    uint64_t v28 = objc_msgSend_ID(v7, v25, v26, v27);
    objc_msgSend__setAccount_otherPerson_(v13, v29, (uint64_t)v18, (uint64_t)v28);

    objc_msgSend__addTransfer_toAccount_(self, v30, (uint64_t)v13, (uint64_t)v18);
    uint64_t v34 = objc_msgSend_sharedInstance(IMDaemonController, v31, v32, v33);
    uint64_t v38 = objc_msgSend__dictionaryRepresentation(v13, v35, v36, v37);
    objc_msgSend_fileTransfer_createdWithProperties_(v34, v39, (uint64_t)v6, (uint64_t)v38);

    id v43 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v40, v41, v42);
    objc_msgSend___mainThreadPostNotificationName_object_(v43, v44, @"__kIMFileTransferCreatedNotification", (uint64_t)v13);
  }
  else if (IMOSLoggingEnabled())
  {
    id v45 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      int v46 = 138412546;
      id v47 = v6;
      __int16 v48 = 2112;
      id v49 = v7;
      _os_log_impl(&dword_1A4AF7000, v45, OS_LOG_TYPE_INFO, "Not assigning transfer guid: %@ to handle: %@  transfer doesn't exist", (uint8_t *)&v46, 0x16u);
    }
  }
}

- (void)registerTransferWithDaemon:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v10 = objc_msgSend_transferForGUID_(self, v5, (uint64_t)v4, v6);
  if (v10)
  {
    uint64_t v11 = objc_msgSend_sharedInstance(IMDaemonController, v7, v8, v9);
    uint64_t v15 = objc_msgSend__dictionaryRepresentation(v10, v12, v13, v14);
    objc_msgSend_fileTransfer_createdWithProperties_(v11, v16, (uint64_t)v4, (uint64_t)v15);
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v18 = 138412290;
      id v19 = v4;
      _os_log_impl(&dword_1A4AF7000, v17, OS_LOG_TYPE_INFO, "Could not register transfer with daemon %@", (uint8_t *)&v18, 0xCu);
    }
  }
}

- (id)chatForTransfer:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v7 = objc_msgSend_messageGUID(v3, v4, v5, v6);

  if (v7)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v11 = objc_msgSend_sharedRegistry(IMChatRegistry, v8, v9, v10, 0);
    uint64_t v15 = objc_msgSend_cachedChats(v11, v12, v13, v14);

    id v20 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v29, (uint64_t)v33, 16);
    if (v20)
    {
      uint64_t v21 = *(void *)v30;
      while (2)
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v30 != v21) {
            objc_enumerationMutation(v15);
          }
          uint64_t v23 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          uint64_t v24 = objc_msgSend_messageGUID(v3, v17, v18, v19);
          uint64_t v27 = objc_msgSend_messageForGUID_(v23, v25, (uint64_t)v24, v26);

          if (v27)
          {
            id v20 = v23;

            goto LABEL_12;
          }
        }
        id v20 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v17, (uint64_t)&v29, (uint64_t)v33, 16);
        if (v20) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

- (id)transferForGUID:(id)a3
{
  return (id)MEMORY[0x1F4181798](self, sel_transferForGUID_includeRemoved_, a3, 0);
}

- (id)transferForGUID:(id)a3 includeRemoved:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v11 = objc_msgSend_objectForKey_(self->_guidToTransferMap, v7, (uint64_t)v6, v8);
  if (v11) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = !v4;
  }
  if (!v12)
  {
    uint64_t v11 = objc_msgSend_objectForKey_(self->_guidToRemovedTransferMap, v9, (uint64_t)v6, v10);
  }

  return v11;
}

- (void)downloadFileTransferWithLocalURL:(id)a3 completion:(id)a4
{
  uint64_t v106 = *MEMORY[0x1E4F143B8];
  id v95 = a3;
  aBlock = (void (**)(id, uint64_t, void))a4;
  if (v95)
  {
    long long v99 = 0u;
    long long v100 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    uint64_t v9 = objc_msgSend_transfers(self, v6, v7, v8);
    uint64_t v13 = objc_msgSend_allKeys(v9, v10, v11, v12);

    uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v97, (uint64_t)v101, 16);
    if (v17)
    {
      uint64_t v18 = *(void *)v98;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v98 != v18) {
            objc_enumerationMutation(v13);
          }
          id v20 = objc_msgSend_transferForGUID_(self, v15, *(void *)(*((void *)&v97 + 1) + 8 * i), v16);
          uint64_t v24 = v20;
          if (v20)
          {
            uint64_t v25 = objc_msgSend_localPath(v20, v21, v22, v23);
            BOOL v26 = v25 == 0;

            if (!v26)
            {
              long long v30 = objc_msgSend_localPath(v24, v27, v28, v29);
              uint64_t v34 = objc_msgSend_absoluteString(v95, v31, v32, v33);
              unsigned __int8 v37 = objc_msgSend_containsString_(v30, v35, (uint64_t)v34, v36);

              if (((aBlock != 0) & v37) == 1) {
                aBlock[2](aBlock, 1, 0);
              }
            }
          }
        }
        uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v15, (uint64_t)&v97, (uint64_t)v101, 16);
      }
      while (v17);
    }

    if (aBlock)
    {
      if (!self->_disconnectionListenerSetUp)
      {
        uint64_t v41 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v38, v39, v40);
        objc_msgSend_addObserver_selector_name_object_(v41, v42, (uint64_t)self, (uint64_t)sel__daemonDisconnected_, @"__kIMDaemonDidDisconnectNotification", 0);

        self->_disconnectionListenerSetUp = 1;
      }
      redownloadlocalFilesWithURLCompletionHandlers = self->_redownloadlocalFilesWithURLCompletionHandlers;
      if (!redownloadlocalFilesWithURLCompletionHandlers)
      {
        __int16 v44 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        id v45 = self->_redownloadlocalFilesWithURLCompletionHandlers;
        self->_redownloadlocalFilesWithURLCompletionHandlers = v44;

        redownloadlocalFilesWithURLCompletionHandlers = self->_redownloadlocalFilesWithURLCompletionHandlers;
      }
      int v46 = objc_msgSend_absoluteString(v95, v38, v39, v40);
      id v49 = objc_msgSend_objectForKeyedSubscript_(redownloadlocalFilesWithURLCompletionHandlers, v47, (uint64_t)v46, v48);
      BOOL v50 = v49 == 0;

      if (v50)
      {
        uint64_t v54 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v51, v52, v53);
        uint64_t v55 = self->_redownloadlocalFilesWithURLCompletionHandlers;
        id v59 = objc_msgSend_absoluteString(v95, v56, v57, v58);
        objc_msgSend_setObject_forKeyedSubscript_(v55, v60, (uint64_t)v54, (uint64_t)v59);
      }
      v61 = self->_redownloadlocalFilesWithURLCompletionHandlers;
      int v62 = objc_msgSend_absoluteString(v95, v51, v52, v53);
      id v65 = objc_msgSend_objectForKeyedSubscript_(v61, v63, (uint64_t)v62, v64);
      id v66 = _Block_copy(aBlock);
      objc_msgSend_addObject_(v65, v67, (uint64_t)v66, v68);

      objc_msgSend__registerDaemonListenerIfNecessary(self, v69, v70, v71);
      v75 = objc_msgSend_sharedInstance(IMDaemonController, v72, v73, v74);
      objc_msgSend_downloadFileTransferWithLocalURL_(v75, v76, (uint64_t)v95, v77);
      goto LABEL_27;
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v81 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v105 = "-[IMFileTransferCenter downloadFileTransferWithLocalURL:completion:]";
        _os_log_impl(&dword_1A4AF7000, v81, OS_LOG_TYPE_INFO, "%s invalid URL passed", buf, 0xCu);
      }
    }
    if (aBlock)
    {
      v82 = (void *)MEMORY[0x1E4F28C58];
      v102[0] = *MEMORY[0x1E4F28568];
      v83 = objc_msgSend_mainBundle(MEMORY[0x1E4F28B50], v78, v79, v80);
      v85 = objc_msgSend_localizedStringForKey_value_table_(v83, v84, @"File transfer local file url retrieval operation was unsuccessful.", (uint64_t)&stru_1EF8E78C8, 0);
      v103[0] = v85;
      v102[1] = *MEMORY[0x1E4F28588];
      v89 = objc_msgSend_mainBundle(MEMORY[0x1E4F28B50], v86, v87, v88);
      v91 = objc_msgSend_localizedStringForKey_value_table_(v89, v90, @"The given URL was empty.", (uint64_t)&stru_1EF8E78C8, 0);
      v103[1] = v91;
      v93 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v92, (uint64_t)v103, (uint64_t)v102, 2);
      v75 = objc_msgSend_errorWithDomain_code_userInfo_(v82, v94, *MEMORY[0x1E4F6D438], 24, v93);

      ((void (**)(id, uint64_t, void *))aBlock)[2](aBlock, 0, v75);
LABEL_27:
    }
  }
}

- (void)acceptTransfer:(id)a3 withPath:(id)a4 autoRename:(BOOL)a5 overwrite:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = a3;
  id v11 = a4;
  if (!objc_msgSend_isActiveTransfer_(self, v12, (uint64_t)v10, v13))
  {
    uint64_t v16 = objc_msgSend_transferForGUID_(self, v14, (uint64_t)v10, v15);
    objc_msgSend__resetTransferStateIfAttachmentIsMissingAndDownloadable(v16, v17, v18, v19);
    if (v16 && objc_msgSend_transferState(v16, v20, v21, v22) <= 0)
    {
      objc_msgSend__addActiveTransfer_(self, v23, (uint64_t)v10, v24);
      objc_msgSend__setTransferState_(v16, v39, 1, v40);
      if (v11)
      {
        __int16 v44 = objc_msgSend_fileURLWithPath_(MEMORY[0x1E4F1CB10], v41, (uint64_t)v11, v43);
        objc_msgSend__setLocalURL_(v16, v45, (uint64_t)v44, v46);
      }
      id v47 = objc_msgSend_sharedInstance(IMDaemonController, v41, v42, v43);
      unsigned int v51 = v47;
      if (v11)
      {
        objc_msgSend_fileTransfer_acceptedWithPath_autoRename_overwrite_options_(v47, v48, (uint64_t)v10, (uint64_t)v11, v7, v6, 0);
      }
      else
      {
        uint64_t v52 = objc_msgSend_localPath(v16, v48, v49, v50);
        objc_msgSend_fileTransfer_acceptedWithPath_autoRename_overwrite_options_(v51, v53, (uint64_t)v10, (uint64_t)v52, v7, v6, 0);
      }
      uint64_t v57 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v54, v55, v56);
      objc_msgSend___mainThreadPostNotificationName_object_(v57, v58, @"__kIMFileTransferUpdatedNotification", (uint64_t)v16);
    }
    else if (IMIsRunningInAutomation())
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v28 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          uint64_t v32 = NSNumber;
          uint64_t v33 = objc_msgSend_transferState(v16, v29, v30, v31);
          uint64_t v36 = objc_msgSend_numberWithInteger_(v32, v34, v33, v35);
          int v59 = 138412546;
          uint64_t v60 = v16;
          __int16 v61 = 2112;
          int v62 = v36;
          _os_log_impl(&dword_1A4AF7000, v28, OS_LOG_TYPE_INFO, "We tried to accept a file transfer whose transfer state was greater than the accepted state or we got back a nil transfer -- transfer: %@ transfer state: %@", (uint8_t *)&v59, 0x16u);
        }
      }
      unsigned __int8 v37 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6E6E8], v25, v26, v27);
      objc_msgSend_postCoreAutomationNotificationFinishedTapToDownload_downloadedFromCloudKitSuccessfully_(v37, v38, (uint64_t)v10, 0);
    }
    goto LABEL_20;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v59 = 138412290;
      uint64_t v60 = v10;
      _os_log_impl(&dword_1A4AF7000, v16, OS_LOG_TYPE_INFO, "Asked to accept transfer %@ which is already in progress. Returning early.", (uint8_t *)&v59, 0xCu);
    }
LABEL_20:
  }
}

- (void)acceptTransfer:(id)a3
{
}

- (void)stopTransfer:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v7 = objc_msgSend_transferForGUID_(self, v5, (uint64_t)v4, v6);
  if (IMOSLoggingEnabled())
  {
    id v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v39 = 138412290;
      id v40 = v4;
      _os_log_impl(&dword_1A4AF7000, v11, OS_LOG_TYPE_INFO, "stopping transfer to guid %@", (uint8_t *)&v39, 0xCu);
    }
  }
  if (v7 && (objc_msgSend_isFinished(v7, v8, v9, v10) & 1) == 0)
  {
    objc_msgSend__removeActiveTransfer_(self, v12, (uint64_t)v4, v13);
    objc_msgSend__removePendingTransfer_(self, v14, (uint64_t)v4, v15);
    if (objc_msgSend_transferState(v7, v16, v17, v18))
    {
      uint64_t v22 = 10;
    }
    else if (objc_msgSend_isIncoming(v7, v19, v20, v21))
    {
      uint64_t v22 = 12;
    }
    else
    {
      uint64_t v22 = 10;
    }
    uint64_t v23 = objc_msgSend_finalTransferStateForSuccess_(v7, v19, 0, v21);
    objc_msgSend__setTransferState_(v7, v24, v23, v25);
    objc_msgSend__setError_(v7, v26, v22, v27);
    uint64_t v31 = objc_msgSend_sharedInstance(IMDaemonController, v28, v29, v30);
    objc_msgSend_fileTransferStopped_(v31, v32, (uint64_t)v4, v33);

    unsigned __int8 v37 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v34, v35, v36);
    objc_msgSend___mainThreadPostNotificationName_object_(v37, v38, @"__kIMFileTransferUpdatedNotification", (uint64_t)v7);
  }
}

- (void)removeTransfer:(id)a3
{
  id v42 = a3;
  objc_msgSend__removeActiveTransfer_(self, v4, (uint64_t)v42, v5);
  objc_msgSend__removePendingTransfer_(self, v6, (uint64_t)v42, v7);
  uint64_t v13 = objc_msgSend_transferForGUID_(self, v8, (uint64_t)v42, v9);
  if (v13)
  {
    uint64_t v14 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v10, v11, v12);
    objc_msgSend___mainThreadPostNotificationName_object_(v14, v15, @"__kIMFileTransferRemovedNotification", (uint64_t)v13);

    guidToRemovedTransferMap = self->_guidToRemovedTransferMap;
    if (!guidToRemovedTransferMap)
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      uint64_t v19 = self->_guidToRemovedTransferMap;
      self->_guidToRemovedTransferMap = Mutable;

      guidToRemovedTransferMap = self->_guidToRemovedTransferMap;
    }
    objc_msgSend_setObject_forKey_(guidToRemovedTransferMap, v16, (uint64_t)v13, (uint64_t)v42);
    accountIDToTransferGUIDsMap = self->_accountIDToTransferGUIDsMap;
    uint64_t v24 = objc_msgSend_accountID(v13, v21, v22, v23);
    uint64_t v27 = objc_msgSend_objectForKey_(accountIDToTransferGUIDsMap, v25, (uint64_t)v24, v26);
    objc_msgSend_removeObject_(v27, v28, (uint64_t)v42, v29);

    objc_msgSend_removeObjectForKey_(self->_guidToTransferMap, v30, (uint64_t)v42, v31);
    if (!objc_msgSend_count(self->_guidToTransferMap, v32, v33, v34))
    {
      guidToTransferMap = self->_guidToTransferMap;
      self->_guidToTransferMap = 0;
    }
    int v39 = objc_msgSend_sharedInstance(IMDaemonController, v35, v36, v37);
    objc_msgSend_fileTransferRemoved_(v39, v40, (uint64_t)v42, v41);
  }
}

- (void)deleteTransfer:(id)a3
{
  id v48 = a3;
  uint64_t v6 = objc_msgSend_transferForGUID_(self, v4, (uint64_t)v48, v5);
  objc_msgSend__removeActiveTransfer_(self, v7, (uint64_t)v48, v8);
  objc_msgSend__removePendingTransfer_(self, v9, (uint64_t)v48, v10);
  if (v6)
  {
    uint64_t v14 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v11, v12, v13);
    objc_msgSend___mainThreadPostNotificationName_object_(v14, v15, @"__kIMFileTransferRemovedNotification", (uint64_t)v6);

    guidToRemovedTransferMap = self->_guidToRemovedTransferMap;
    if (!guidToRemovedTransferMap)
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      uint64_t v19 = self->_guidToRemovedTransferMap;
      self->_guidToRemovedTransferMap = Mutable;

      guidToRemovedTransferMap = self->_guidToRemovedTransferMap;
    }
    objc_msgSend_setObject_forKey_(guidToRemovedTransferMap, v16, (uint64_t)v6, (uint64_t)v48);
    accountIDToTransferGUIDsMap = self->_accountIDToTransferGUIDsMap;
    uint64_t v24 = objc_msgSend_accountID(v6, v21, v22, v23);
    uint64_t v27 = objc_msgSend_objectForKey_(accountIDToTransferGUIDsMap, v25, (uint64_t)v24, v26);
    objc_msgSend_removeObject_(v27, v28, (uint64_t)v48, v29);

    objc_msgSend_removeObjectForKey_(self->_guidToTransferMap, v30, (uint64_t)v48, v31);
    if (!objc_msgSend_count(self->_guidToTransferMap, v32, v33, v34))
    {
      guidToTransferMap = self->_guidToTransferMap;
      self->_guidToTransferMap = 0;
    }
    int v39 = objc_msgSend_sharedInstance(IMDaemonController, v35, v36, v37);
    objc_msgSend_fileTransferRemoved_(v39, v40, (uint64_t)v48, v41);

    id v45 = objc_msgSend_sharedInstance(IMDaemonController, v42, v43, v44);
    objc_msgSend_deleteFileTransferWithGUID_(v45, v46, (uint64_t)v48, v47);
  }
}

- (void)retargetTransfer:(id)a3 toPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_msgSend_transferForGUID_(self, v8, (uint64_t)v7, v9);
  id v29 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = objc_msgSend_fileURLWithPath_(MEMORY[0x1E4F1CB10], v10, (uint64_t)v6, v11);

  objc_msgSend__setLocalURL_(v29, v13, (uint64_t)v12, v14);
  uint64_t v18 = objc_msgSend_sharedInstance(IMDaemonController, v15, v16, v17);
  uint64_t v22 = objc_msgSend__dictionaryRepresentation(v29, v19, v20, v21);
  objc_msgSend_fileTransfer_updatedWithProperties_(v18, v23, (uint64_t)v7, (uint64_t)v22);

  uint64_t v27 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v24, v25, v26);
  objc_msgSend___mainThreadPostNotificationName_object_(v27, v28, @"__kIMFileTransferUpdatedNotification", (uint64_t)v29);
}

- (id)transfersForAccount:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_uniqueID(a3, a2, (uint64_t)a3, v3);
  uint64_t v8 = objc_msgSend_objectForKey_(self->_accountIDToTransferGUIDsMap, v6, (uint64_t)v5, v7);
  uint64_t v9 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v13 = objc_msgSend_count(v8, v10, v11, v12);
  uint64_t v16 = objc_msgSend_arrayWithCapacity_(v9, v14, v13, v15);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v17 = v8;
  uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v29, (uint64_t)v33, 16);
  if (v19)
  {
    uint64_t v22 = v19;
    uint64_t v23 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v30 != v23) {
          objc_enumerationMutation(v17);
        }
        uint64_t v25 = objc_msgSend_transferForGUID_(self, v20, *(void *)(*((void *)&v29 + 1) + 8 * i), v21, (void)v29);
        objc_msgSend_addObject_(v16, v26, (uint64_t)v25, v27);
      }
      uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v29, (uint64_t)v33, 16);
    }
    while (v22);
  }

  return v16;
}

- (NSDictionary)transfers
{
  return (NSDictionary *)self->_guidToTransferMap;
}

- (NSMutableSet)activeTransfers
{
  return (NSMutableSet *)objc_msgSend_allObjects(self->_activeTransfers, a2, v2, v3);
}

- (NSArray)activeTransferGUIDs
{
  return (NSArray *)objc_msgSend_allObjects(self->_activeTransfers, a2, v2, v3);
}

- (NSArray)orderedTransfers
{
  id v3 = objc_alloc(MEMORY[0x1E4F29008]);
  uint64_t v5 = objc_msgSend_initWithKey_ascending_(v3, v4, @"createdDate", 1);
  id v6 = objc_alloc(MEMORY[0x1E4F29008]);
  uint64_t v8 = objc_msgSend_initWithKey_ascending_(v6, v7, @"filename", 1);
  id v9 = objc_alloc(MEMORY[0x1E4F1C978]);
  uint64_t v12 = objc_msgSend_initWithObjects_(v9, v10, (uint64_t)v5, v11, v8, 0);
  uint64_t v16 = objc_msgSend_allValues(self->_guidToTransferMap, v13, v14, v15);
  uint64_t v19 = objc_msgSend_sortedArrayUsingDescriptors_(v16, v17, (uint64_t)v12, v18);

  return (NSArray *)v19;
}

- (NSArray)orderedTransfersGUIDs
{
  id v3 = objc_alloc(MEMORY[0x1E4F29008]);
  uint64_t v5 = objc_msgSend_initWithKey_ascending_(v3, v4, @"createdDate", 1);
  id v6 = objc_alloc(MEMORY[0x1E4F29008]);
  uint64_t v8 = objc_msgSend_initWithKey_ascending_(v6, v7, @"filename", 1);
  id v9 = objc_alloc(MEMORY[0x1E4F1C978]);
  uint64_t v12 = objc_msgSend_initWithObjects_(v9, v10, (uint64_t)v5, v11, v8, 0);
  uint64_t v16 = objc_msgSend_allValues(self->_guidToTransferMap, v13, v14, v15);
  uint64_t v19 = objc_msgSend_sortedArrayUsingDescriptors_(v16, v17, (uint64_t)v12, v18);

  return (NSArray *)v19;
}

- (void)clearFinishedTransfers
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_count(self->_guidToTransferMap, a2, v2, v3))
  {
    id v5 = objc_alloc(MEMORY[0x1E4F1CA48]);
    id v9 = objc_msgSend_allValues(self->_guidToTransferMap, v6, v7, v8);
    uint64_t v12 = objc_msgSend_initWithArray_(v5, v10, (uint64_t)v9, v11);

    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v13 = v12;
    uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v53, (uint64_t)v57, 16);
    if (v15)
    {
      uint64_t v19 = v15;
      uint64_t v20 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v54 != v20) {
            objc_enumerationMutation(v13);
          }
          uint64_t v22 = *(void **)(*((void *)&v53 + 1) + 8 * i);
          if (objc_msgSend_isFinished(v22, v16, v17, v18, (void)v53))
          {
            uint64_t v23 = objc_msgSend_guid(v22, v16, v17, v18);
            objc_msgSend__removeActiveTransfer_(self, v24, (uint64_t)v23, v25);
            objc_msgSend__removePendingTransfer_(self, v26, (uint64_t)v23, v27);
            long long v31 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v28, v29, v30);
            objc_msgSend___mainThreadPostNotificationName_object_(v31, v32, @"__kIMFileTransferRemovedNotification", (uint64_t)v22);

            guidToRemovedTransferMap = self->_guidToRemovedTransferMap;
            if (!guidToRemovedTransferMap)
            {
              Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
              uint64_t v36 = self->_guidToRemovedTransferMap;
              self->_guidToRemovedTransferMap = Mutable;

              guidToRemovedTransferMap = self->_guidToRemovedTransferMap;
            }
            objc_msgSend_setObject_forKey_(guidToRemovedTransferMap, v33, (uint64_t)v22, (uint64_t)v23);
            accountIDToTransferGUIDsMap = self->_accountIDToTransferGUIDsMap;
            uint64_t v41 = objc_msgSend_accountID(v22, v38, v39, v40);
            uint64_t v44 = objc_msgSend_objectForKey_(accountIDToTransferGUIDsMap, v42, (uint64_t)v41, v43);
            objc_msgSend_removeObject_(v44, v45, (uint64_t)v23, v46);

            objc_msgSend_removeObjectForKey_(self->_guidToTransferMap, v47, (uint64_t)v23, v48);
            if (!objc_msgSend_count(self->_guidToTransferMap, v49, v50, v51))
            {
              guidToTransferMap = self->_guidToTransferMap;
              self->_guidToTransferMap = 0;
            }
          }
        }
        uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v53, (uint64_t)v57, 16);
      }
      while (v19);
    }
  }
}

- (BOOL)isFileTransfer:(id)a3 preauthorizedWithDictionary:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v9 = objc_msgSend_objectForKey_(v6, v7, @"sPreauthorizedTransferDictionaryOtherPersonKey", v8);
  uint64_t v12 = objc_msgSend_objectForKey_(v6, v10, @"sPreauthorizedTransferDictionaryAccountKey", v11);
  uint64_t v15 = objc_msgSend_objectForKey_(v6, v13, @"sPreauthorizedTransferDictionaryFilenameKey", v14);

  if (objc_msgSend_transferState(v5, v16, v17, v18))
  {
    char isEqualToString = 0;
  }
  else
  {
    uint64_t v23 = objc_msgSend_otherPerson(v5, v19, v20, v21);
    if (objc_msgSend_isEqualToString_(v23, v24, (uint64_t)v9, v25))
    {
      uint64_t v29 = objc_msgSend_accountID(v5, v26, v27, v28);
      if (objc_msgSend_isEqualToString_(v29, v30, (uint64_t)v12, v31))
      {
        uint64_t v35 = objc_msgSend_filename(v5, v32, v33, v34);
        char isEqualToString = objc_msgSend_isEqualToString_(v35, v36, (uint64_t)v15, v37);
      }
      else
      {
        char isEqualToString = 0;
      }
    }
    else
    {
      char isEqualToString = 0;
    }
  }
  return isEqualToString;
}

- (void)preauthorizeFileTransferFromOtherPerson:(id)a3 account:(id)a4 filename:(id)a5 saveToPath:(id)a6
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v10 && v11 && v12)
  {
    if (!self->_preauthorizedInfos)
    {
      uint64_t v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      preauthorizedInfos = self->_preauthorizedInfos;
      self->_preauthorizedInfos = v14;
    }
    id v16 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    uint64_t v42 = (uint64_t)v13;
    uint64_t v19 = objc_msgSend_initWithObjectsAndKeys_(v16, v17, (uint64_t)v10, v18, @"sPreauthorizedTransferDictionaryOtherPersonKey", v11, @"sPreauthorizedTransferDictionaryAccountKey", v12, @"sPreauthorizedTransferDictionaryFilenameKey", v13, @"sPreauthorizedTransferDictionarySaveToPathKey", 0);
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    uint64_t v23 = objc_msgSend_allValues(self->_guidToTransferMap, v20, v21, v22);
    uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v43, (uint64_t)v47, 16);
    if (v25)
    {
      uint64_t v27 = v25;
      uint64_t v28 = *(void *)v44;
      while (2)
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v44 != v28) {
            objc_enumerationMutation(v23);
          }
          uint64_t v30 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          if (objc_msgSend_isFileTransfer_preauthorizedWithDictionary_(self, v26, (uint64_t)v30, (uint64_t)v19))
          {
            uint64_t v35 = objc_msgSend_guid(v30, v26, v31, v32);
            id v13 = (id)v42;
            objc_msgSend_acceptTransfer_withPath_autoRename_overwrite_(self, v36, (uint64_t)v35, v42, 1, 0);
            preauthorizedGUIDs = self->_preauthorizedGUIDs;
            if (!preauthorizedGUIDs)
            {
              uint64_t v40 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
              uint64_t v41 = self->_preauthorizedGUIDs;
              self->_preauthorizedGUIDs = v40;

              preauthorizedGUIDs = self->_preauthorizedGUIDs;
            }
            objc_msgSend_addObject_(preauthorizedGUIDs, v37, (uint64_t)v35, v38);

            goto LABEL_18;
          }
        }
        uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v26, (uint64_t)&v43, (uint64_t)v47, 16);
        if (v27) {
          continue;
        }
        break;
      }
    }

    objc_msgSend_addObject_(self->_preauthorizedInfos, v33, (uint64_t)v19, v34);
    id v13 = (id)v42;
LABEL_18:
  }
}

- (BOOL)wasFileTransferPreauthorized:(id)a3
{
  return objc_msgSend_containsObject_(self->_preauthorizedGUIDs, a2, (uint64_t)a3, v3);
}

- (void)acceptFileTransferIfPreauthorzed:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  preauthorizedInfos = self->_preauthorizedInfos;
  id v8 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(preauthorizedInfos, v6, (uint64_t)&v29, (uint64_t)v33, 16);
  if (v8)
  {
    uint64_t v9 = *(void *)v30;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v30 != v9) {
        objc_enumerationMutation(preauthorizedInfos);
      }
      id v11 = *(void **)(*((void *)&v29 + 1) + 8 * v10);
      if (objc_msgSend_isFileTransfer_preauthorizedWithDictionary_(self, v7, (uint64_t)v4, (uint64_t)v11, (void)v29))break; {
      if (v8 == (id)++v10)
      }
      {
        id v8 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(preauthorizedInfos, v7, (uint64_t)&v29, (uint64_t)v33, 16);
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_15;
      }
    }
    id v13 = objc_msgSend_objectForKey_(v11, v7, @"sPreauthorizedTransferDictionarySaveToPathKey", v12);
    uint64_t v17 = objc_msgSend_guid(v4, v14, v15, v16);
    objc_msgSend_acceptTransfer_withPath_autoRename_overwrite_(self, v18, (uint64_t)v17, (uint64_t)v13, 1, 0);
    id v8 = v11;
    preauthorizedGUIDs = self->_preauthorizedGUIDs;
    if (!preauthorizedGUIDs)
    {
      uint64_t v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v23 = self->_preauthorizedGUIDs;
      self->_preauthorizedGUIDs = v22;

      preauthorizedGUIDs = self->_preauthorizedGUIDs;
    }
    objc_msgSend_addObject_(preauthorizedGUIDs, v19, (uint64_t)v17, v20);

    if (v8)
    {
      objc_msgSend_removeObject_(self->_preauthorizedInfos, v24, (uint64_t)v8, v25);
      if (!objc_msgSend_count(self->_preauthorizedInfos, v26, v27, v28))
      {
        preauthorizedInfos = self->_preauthorizedInfos;
        self->_preauthorizedInfos = 0;
        goto LABEL_15;
      }
    }
  }
  else
  {
LABEL_15:
  }
}

- (void)_handleSerializedFileTransfers:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v19, (uint64_t)v23, 16);
  if (v6)
  {
    uint64_t v10 = v6;
    uint64_t v11 = *(void *)v20;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v4);
        }
        id v13 = *(void **)(*((void *)&v19 + 1) + 8 * v12);
        uint64_t v14 = objc_msgSend__dictionaryRepresentationGUIDKey(MEMORY[0x1E4F6E780], v7, v8, v9);
        uint64_t v17 = objc_msgSend_objectForKeyedSubscript_(v13, v15, (uint64_t)v14, v16);

        objc_msgSend__handleFileTransfer_createdWithProperties_(self, v18, (uint64_t)v17, (uint64_t)v13);
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v19, (uint64_t)v23, 16);
    }
    while (v10);
  }
}

- (void)_handleFileTransfer:(id)a3 createdWithProperties:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_msgSend_transferForGUID_(self, v8, (uint64_t)v6, v9);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend__handleFileTransfer_updatedWithProperties_(self, v10, (uint64_t)v6, (uint64_t)v7);
  }
  else
  {
    uint64_t v12 = objc_opt_class();
    id v11 = objc_alloc_init((Class)objc_msgSend_fileTransferClass(v12, v13, v14, v15));
    int v18 = objc_msgSend__updateWithDictionaryRepresentation_(v11, v16, (uint64_t)v7, v17);
    objc_msgSend__addTransfer_(self, v19, (uint64_t)v11, v20);
    int v21 = IMOSLoggingEnabled();
    if (v18)
    {
      if (v21)
      {
        uint64_t v25 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          uint64_t v28 = objc_msgSend_objectForKeyedSubscript_(v7, v26, *MEMORY[0x1E4F6D440], v27);
          int v32 = 138412546;
          id v33 = v11;
          __int16 v34 = 2112;
          uint64_t v35 = v28;
          _os_log_impl(&dword_1A4AF7000, v25, OS_LOG_TYPE_INFO, "Posting transfer created: %@  transferName: %@", (uint8_t *)&v32, 0x16u);
        }
      }
      long long v29 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v22, v23, v24);
      objc_msgSend___mainThreadPostNotificationName_object_(v29, v30, @"__kIMFileTransferCreatedNotification", (uint64_t)v11);
    }
    else if (v21)
    {
      long long v31 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        int v32 = 138412290;
        id v33 = v11;
        _os_log_impl(&dword_1A4AF7000, v31, OS_LOG_TYPE_INFO, "Nothing changed for create, not posting for: %@", (uint8_t *)&v32, 0xCu);
      }
    }
    objc_msgSend_acceptFileTransferIfPreauthorzed_(self, v22, (uint64_t)v11, v24);
  }
}

- (void)_handleFileTransfers:(id)a3 createdWithLocalPaths:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = objc_msgSend_count(v6, v8, v9, v10);
  if (v11 == objc_msgSend_count(v7, v12, v13, v14))
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1A4B8CF84;
    v18[3] = &unk_1E5B7C5C8;
    id v19 = v7;
    uint64_t v20 = self;
    objc_msgSend_enumerateObjectsUsingBlock_(v6, v15, (uint64_t)v18, v16);
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v22 = v6;
      __int16 v23 = 2112;
      id v24 = v7;
      _os_log_impl(&dword_1A4AF7000, v17, OS_LOG_TYPE_INFO, "IMFileTransferCenter: number of new file transfers %@ does not match number of local urls %@.", buf, 0x16u);
    }
  }
}

- (void)_handleFileTransfer:(id)a3 updatedWithProperties:(id)a4
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v10 = objc_msgSend_transferForGUID_(self, v8, (uint64_t)v6, v9);
  uint64_t v14 = v10;
  if (v10)
  {
    uint64_t v15 = objc_msgSend_transferState(v10, v11, v12, v13);
    int isFinished = objc_msgSend_isFinished(v14, v16, v17, v18);
    int v22 = objc_msgSend__updateWithDictionaryRepresentation_(v14, v20, (uint64_t)v7, v21);
    if (objc_msgSend_isFromMomentShare(v14, v23, v24, v25))
    {
      int v29 = objc_msgSend_transferState(v14, v26, v27, v28) == 5 ? isFinished : 0;
      if (v29 == 1)
      {
        if (IMOSLoggingEnabled())
        {
          long long v30 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            int v56 = 138412290;
            id v57 = v14;
            _os_log_impl(&dword_1A4AF7000, v30, OS_LOG_TYPE_INFO, "Overriding changed for CMM transfer %@", (uint8_t *)&v56, 0xCu);
          }
        }
        int v22 = 1;
      }
    }
    uint64_t v34 = objc_msgSend_transferState(v14, v26, v27, v28);
    if ((isFinished & 1) != 0 || !objc_msgSend_isFinished(v14, v31, v32, v33))
    {
      int v37 = 0;
      if (v15 <= 1 && v34 >= 2)
      {
        objc_msgSend__addActiveTransfer_(self, v31, (uint64_t)v6, v33);
        int v37 = 0;
      }
    }
    else
    {
      objc_msgSend__removeActiveTransfer_(self, v31, (uint64_t)v6, v33);
      objc_msgSend__removePendingTransfer_(self, v35, (uint64_t)v6, v36);
      int v37 = 1;
    }
    if (objc_msgSend_isActiveTransfer_(self, v31, (uint64_t)v6, v33)
      && IMFileTransferStateIsNotActive())
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v40 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          uint64_t v41 = IMStringFromTransferState();
          int v56 = 138412546;
          id v57 = v6;
          __int16 v58 = 2112;
          int v59 = v41;
          _os_log_impl(&dword_1A4AF7000, v40, OS_LOG_TYPE_INFO, "Removing %@ from active transfers, as newState is %@", (uint8_t *)&v56, 0x16u);
        }
      }
      objc_msgSend__removeActiveTransfer_(self, v38, (uint64_t)v6, v39);
    }
    int v42 = IMOSLoggingEnabled();
    if (v22)
    {
      if (v42)
      {
        long long v46 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
        {
          int v56 = 138412290;
          id v57 = v6;
          _os_log_impl(&dword_1A4AF7000, v46, OS_LOG_TYPE_INFO, "Posting transfer, guid: %@", (uint8_t *)&v56, 0xCu);
        }
      }
      uint64_t v47 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v43, v44, v45);
      objc_msgSend___mainThreadPostNotificationName_object_(v47, v48, @"__kIMFileTransferUpdatedNotification", (uint64_t)v14);
    }
    else if (v42)
    {
      uint64_t v49 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        int v56 = 138412290;
        id v57 = v6;
        _os_log_impl(&dword_1A4AF7000, v49, OS_LOG_TYPE_INFO, "Nothing changed for update, not posting, guid: %@", (uint8_t *)&v56, 0xCu);
      }
    }
    if (v37)
    {
      if (IMOSLoggingEnabled())
      {
        long long v53 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
        {
          int v56 = 138412290;
          id v57 = v6;
          _os_log_impl(&dword_1A4AF7000, v53, OS_LOG_TYPE_INFO, "Posting transfer, guid: %@  finished", (uint8_t *)&v56, 0xCu);
        }
      }
      long long v54 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v50, v51, v52);
      objc_msgSend___mainThreadPostNotificationName_object_(v54, v55, @"__kIMFileTransferFinishedNotification", (uint64_t)v14);
    }
  }
  else
  {
    objc_msgSend__handleFileTransfer_createdWithProperties_(self, v11, (uint64_t)v6, (uint64_t)v7);
  }
}

- (void)_handleFileTransfer:(id)a3 updatedWithCurrentBytes:(unint64_t)a4 totalBytes:(unint64_t)a5 averageTransferRate:(unint64_t)a6
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  uint64_t v13 = objc_msgSend_transferForGUID_(self, v11, (uint64_t)v10, v12);
  if (objc_msgSend_currentBytes(v13, v14, v15, v16) == a4
    && objc_msgSend_totalBytes(v13, v17, v18, v19) == a5
    && objc_msgSend_averageTransferRate(v13, v20, v21, v22) == a6)
  {
    if (IMOSLoggingEnabled())
    {
      __int16 v23 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        uint64_t v27 = NSNumber;
        uint64_t v28 = objc_msgSend_transferState(v13, v24, v25, v26);
        long long v31 = objc_msgSend_numberWithInteger_(v27, v29, v28, v30);
        uint64_t v34 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v32, a4, v33);
        int v37 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v35, a5, v36);
        int v60 = 138413058;
        id v61 = v10;
        __int16 v62 = 2112;
        uint64_t v63 = v31;
        __int16 v64 = 2112;
        id v65 = v34;
        __int16 v66 = 2112;
        v67 = v37;
        _os_log_impl(&dword_1A4AF7000, v23, OS_LOG_TYPE_INFO, "Ignoring update for transfer guid: %@ state: %@ currentBytes: %@ totalBytes: %@ (values have not changed)", (uint8_t *)&v60, 0x2Au);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v39 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        long long v43 = NSNumber;
        uint64_t v44 = objc_msgSend_transferState(v13, v40, v41, v42);
        uint64_t v47 = objc_msgSend_numberWithInteger_(v43, v45, v44, v46);
        uint64_t v50 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v48, a4, v49);
        long long v53 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v51, a5, v52);
        int v60 = 138413058;
        id v61 = v10;
        __int16 v62 = 2112;
        uint64_t v63 = v47;
        __int16 v64 = 2112;
        id v65 = v50;
        __int16 v66 = 2112;
        v67 = v53;
        _os_log_impl(&dword_1A4AF7000, v39, OS_LOG_TYPE_INFO, "Updating transfer guid: %@ state: %@ currentBytes: %@ totalBytes: %@", (uint8_t *)&v60, 0x2Au);
      }
    }
    objc_msgSend__setCurrentBytes_totalBytes_(v13, v38, a4, a5);
    objc_msgSend__setAveragedTransferRate_lastAveragedInterval_lastAveragedBytes_(v13, v54, a6, 0, 0.0);
    __int16 v58 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v55, v56, v57);
    objc_msgSend___mainThreadPostNotificationName_object_(v58, v59, @"__kIMFileTransferUpdatedNotification", (uint64_t)v13);
  }
}

- (void)_handleFileTransferFinishedRemoteIntentDownload:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v7 = objc_msgSend_transferForGUID_(self, v5, (uint64_t)v4, v6);
  int v8 = IMOSLoggingEnabled();
  if (v7)
  {
    if (v8)
    {
      uint64_t v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v16 = 138412290;
        id v17 = v4;
        _os_log_impl(&dword_1A4AF7000, v12, OS_LOG_TYPE_INFO, "Finished remote intent download for guid: %@. Posting IMFileTransferUpdatedNotification.", (uint8_t *)&v16, 0xCu);
      }
    }
    uint64_t v13 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v9, v10, v11);
    objc_msgSend___mainThreadPostNotificationName_object_(v13, v14, @"__kIMFileTransferUpdatedNotification", (uint64_t)v7);
  }
  else if (v8)
  {
    uint64_t v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412290;
      id v17 = v4;
      _os_log_impl(&dword_1A4AF7000, v15, OS_LOG_TYPE_INFO, "Ignoring finished remote intent download notification for transfer guid: %@", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (void)_handleFileTransfer:(id)a3 highQualityDownloadSucceededWithPath:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v19 = v6;
      __int16 v20 = 2112;
      id v21 = v7;
      _os_log_impl(&dword_1A4AF7000, v10, OS_LOG_TYPE_INFO, "High quality download for transfer %@ succeeded at path %@", buf, 0x16u);
    }
  }
  uint64_t v11 = objc_msgSend_objectForKeyedSubscript_(self->_fetchHighQualityVariantCompletionHandlers, v8, (uint64_t)v6, v9);
  objc_msgSend_setObject_forKeyedSubscript_(self->_fetchHighQualityVariantCompletionHandlers, v12, 0, (uint64_t)v6);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1A4B8DAE4;
  v16[3] = &unk_1E5B7C5F0;
  id v17 = v7;
  id v13 = v7;
  objc_msgSend_enumerateObjectsUsingBlock_(v11, v14, (uint64_t)v16, v15);
}

- (void)_handleFileTransferHighQualityDownloadFailed:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412290;
      id v13 = v4;
      _os_log_impl(&dword_1A4AF7000, v7, OS_LOG_TYPE_INFO, "High quality download for transfer %@ failed", (uint8_t *)&v12, 0xCu);
    }
  }
  int v8 = objc_msgSend_objectForKeyedSubscript_(self->_fetchHighQualityVariantCompletionHandlers, v5, (uint64_t)v4, v6);
  objc_msgSend_setObject_forKeyedSubscript_(self->_fetchHighQualityVariantCompletionHandlers, v9, 0, (uint64_t)v4);
  objc_msgSend_enumerateObjectsUsingBlock_(v8, v10, (uint64_t)&unk_1EF8E52F8, v11);
}

- (void)_handleFileTransfer:(id)a3 explicitDownloadSucceededWithPath:(id)a4 livePhotoBundlePath:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (IMOSLoggingEnabled())
  {
    id v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v37 = v8;
      __int16 v38 = 2112;
      id v39 = v9;
      _os_log_impl(&dword_1A4AF7000, v13, OS_LOG_TYPE_INFO, "Download for transfer %@ succeeded at path %@", buf, 0x16u);
    }
  }
  uint64_t v14 = objc_msgSend_objectForKeyedSubscript_(self->_localFileURLRetrievalCompletionHandlers, v11, (uint64_t)v8, v12);
  objc_msgSend_setObject_forKeyedSubscript_(self->_localFileURLRetrievalCompletionHandlers, v15, 0, (uint64_t)v8);
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = sub_1A4B8DEB0;
  v33[3] = &unk_1E5B7C638;
  id v16 = v9;
  id v34 = v16;
  id v17 = v10;
  id v35 = v17;
  objc_msgSend_enumerateObjectsUsingBlock_(v14, v18, (uint64_t)v33, v19);
  uint64_t v22 = objc_msgSend_objectForKeyedSubscript_(self->_localFileURLRetrievalWithGuidCompletionHandlers, v20, (uint64_t)v8, v21);
  objc_msgSend_setObject_forKeyedSubscript_(self->_localFileURLRetrievalWithGuidCompletionHandlers, v23, 0, (uint64_t)v8);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = sub_1A4B8DED0;
  v29[3] = &unk_1E5B7C660;
  id v30 = v8;
  id v31 = v16;
  id v32 = v17;
  id v24 = v17;
  id v25 = v16;
  id v26 = v8;
  objc_msgSend_enumerateObjectsUsingBlock_(v22, v27, (uint64_t)v29, v28);
}

- (void)_handleFileTransferExplicitDownloadFailed:(id)a3 suggestedRetryGUID:(id)a4 error:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (IMOSLoggingEnabled())
  {
    id v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v37 = v8;
      _os_log_impl(&dword_1A4AF7000, v13, OS_LOG_TYPE_INFO, "Download for transfer %@ failed", buf, 0xCu);
    }
  }
  uint64_t v14 = objc_msgSend_objectForKeyedSubscript_(self->_localFileURLRetrievalCompletionHandlers, v11, (uint64_t)v8, v12);
  objc_msgSend_setObject_forKeyedSubscript_(self->_localFileURLRetrievalCompletionHandlers, v15, 0, (uint64_t)v8);
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = sub_1A4B8E16C;
  v33[3] = &unk_1E5B7C638;
  id v16 = v9;
  id v34 = v16;
  id v17 = v10;
  id v35 = v17;
  objc_msgSend_enumerateObjectsUsingBlock_(v14, v18, (uint64_t)v33, v19);
  uint64_t v22 = objc_msgSend_objectForKeyedSubscript_(self->_localFileURLRetrievalWithGuidCompletionHandlers, v20, (uint64_t)v8, v21);
  objc_msgSend_setObject_forKeyedSubscript_(self->_localFileURLRetrievalWithGuidCompletionHandlers, v23, 0, (uint64_t)v8);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = sub_1A4B8E18C;
  v29[3] = &unk_1E5B7C660;
  id v30 = v8;
  id v31 = v16;
  id v32 = v17;
  id v24 = v17;
  id v25 = v16;
  id v26 = v8;
  objc_msgSend_enumerateObjectsUsingBlock_(v22, v27, (uint64_t)v29, v28);
}

- (void)_handleFileTransferDownloadSucceededWithLocalURL:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v22 = 138412290;
      id v23 = v4;
      _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_INFO, "Re-Download for transfer at URL %@ succeeded", (uint8_t *)&v22, 0xCu);
    }
  }
  redownloadlocalFilesWithURLCompletionHandlers = self->_redownloadlocalFilesWithURLCompletionHandlers;
  id v10 = objc_msgSend_absoluteString(v4, v5, v6, v7);
  id v13 = objc_msgSend_objectForKeyedSubscript_(redownloadlocalFilesWithURLCompletionHandlers, v11, (uint64_t)v10, v12);

  localFileURLRetrievalCompletionHandlers = self->_localFileURLRetrievalCompletionHandlers;
  uint64_t v18 = objc_msgSend_absoluteString(v4, v15, v16, v17);
  objc_msgSend_setObject_forKeyedSubscript_(localFileURLRetrievalCompletionHandlers, v19, 0, (uint64_t)v18);

  objc_msgSend_enumerateObjectsUsingBlock_(v13, v20, (uint64_t)&unk_1EF8E59B8, v21);
}

- (void)_handleFileTransferDownloadFailedWithLocalURL:(id)a3 error:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = objc_msgSend_description(v7, v12, v13, v14);
      *(_DWORD *)buf = 138412546;
      id v33 = v6;
      __int16 v34 = 2112;
      id v35 = v15;
      _os_log_impl(&dword_1A4AF7000, v11, OS_LOG_TYPE_INFO, "Re-Download for transfer at URL %@ failed %@", buf, 0x16u);
    }
  }
  redownloadlocalFilesWithURLCompletionHandlers = self->_redownloadlocalFilesWithURLCompletionHandlers;
  uint64_t v17 = objc_msgSend_absoluteString(v6, v8, v9, v10);
  __int16 v20 = objc_msgSend_objectForKeyedSubscript_(redownloadlocalFilesWithURLCompletionHandlers, v18, (uint64_t)v17, v19);

  localFileURLRetrievalCompletionHandlers = self->_localFileURLRetrievalCompletionHandlers;
  id v25 = objc_msgSend_absoluteString(v6, v22, v23, v24);
  objc_msgSend_setObject_forKeyedSubscript_(localFileURLRetrievalCompletionHandlers, v26, 0, (uint64_t)v25);

  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = sub_1A4B8E4EC;
  v30[3] = &unk_1E5B7C6A8;
  id v31 = v7;
  id v27 = v7;
  objc_msgSend_enumerateObjectsUsingBlock_(v20, v28, (uint64_t)v30, v29);
}

- (void)setAuxImageForTransfer:(id)a3 value:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = @"NO";
      if (v4) {
        uint64_t v10 = @"YES";
      }
      int v28 = 138412546;
      uint64_t v29 = v10;
      __int16 v30 = 2112;
      id v31 = v6;
      _os_log_impl(&dword_1A4AF7000, v9, OS_LOG_TYPE_INFO, "Setting Aux image to %@ for transfer %@", (uint8_t *)&v28, 0x16u);
    }
  }
  uint64_t v11 = objc_msgSend_transferForGUID_(self, v7, (uint64_t)v6, v8);
  objc_msgSend_setIsAuxImage_(v11, v12, v4, v13);
  uint64_t v17 = objc_msgSend_sharedInstance(IMDaemonController, v14, v15, v16);
  uint64_t v21 = objc_msgSend__dictionaryRepresentation(v11, v18, v19, v20);
  objc_msgSend_fileTransfer_updatedWithProperties_(v17, v22, (uint64_t)v6, (uint64_t)v21);

  id v26 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v23, v24, v25);
  objc_msgSend___mainThreadPostNotificationName_object_(v26, v27, @"__kIMFileTransferUpdatedNotification", (uint64_t)v11);
}

- (void)setAuxVideoForTransfer:(id)a3 value:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = @"NO";
      if (v4) {
        uint64_t v10 = @"YES";
      }
      int v28 = 138412546;
      uint64_t v29 = v10;
      __int16 v30 = 2112;
      id v31 = v6;
      _os_log_impl(&dword_1A4AF7000, v9, OS_LOG_TYPE_INFO, "Setting Aux video to %@ for transfer %@", (uint8_t *)&v28, 0x16u);
    }
  }
  uint64_t v11 = objc_msgSend_transferForGUID_(self, v7, (uint64_t)v6, v8);
  objc_msgSend_setIsAuxVideo_(v11, v12, v4, v13);
  uint64_t v17 = objc_msgSend_sharedInstance(IMDaemonController, v14, v15, v16);
  uint64_t v21 = objc_msgSend__dictionaryRepresentation(v11, v18, v19, v20);
  objc_msgSend_fileTransfer_updatedWithProperties_(v17, v22, (uint64_t)v6, (uint64_t)v21);

  id v26 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v23, v24, v25);
  objc_msgSend___mainThreadPostNotificationName_object_(v26, v27, @"__kIMFileTransferUpdatedNotification", (uint64_t)v11);
}

- (void)setCommSafetySensitiveForTransfer:(id)a3 value:(int64_t)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = objc_msgSend_numberWithInteger_(NSNumber, v10, a4, v11);
      int v30 = 138412546;
      id v31 = v12;
      __int16 v32 = 2112;
      id v33 = v6;
      _os_log_impl(&dword_1A4AF7000, v9, OS_LOG_TYPE_INFO, "Setting Communication Safety Sensitivity to %@ for transfer %@", (uint8_t *)&v30, 0x16u);
    }
  }
  uint64_t v13 = objc_msgSend_transferForGUID_(self, v7, (uint64_t)v6, v8);
  objc_msgSend_setCommSafetySensitive_(v13, v14, a4, v15);
  uint64_t v19 = objc_msgSend_sharedInstance(IMDaemonController, v16, v17, v18);
  uint64_t v23 = objc_msgSend__dictionaryRepresentation(v13, v20, v21, v22);
  objc_msgSend_fileTransfer_updatedWithProperties_(v19, v24, (uint64_t)v6, (uint64_t)v23);

  int v28 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v25, v26, v27);
  objc_msgSend___mainThreadPostNotificationName_object_(v28, v29, @"__kIMFileTransferUpdatedNotification", (uint64_t)v13);
}

- (id)guidsForStoredAttachmentPayloadData:(id)a3 messageGUID:(id)a4
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v60 = a4;
  id v61 = v5;
  if (objc_msgSend_count(v5, v6, v7, v8))
  {
    objc_msgSend_array(MEMORY[0x1E4F1CA48], v9, v10, v11);
    uint64_t v12 = (__CFArray *)objc_claimAutoreleasedReturnValue();
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id obj = v61;
    uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v67, (uint64_t)v73, 16);
    if (v17)
    {
      uint64_t v64 = *(void *)v68;
      uint64_t v63 = *MEMORY[0x1E4F6D468];
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v68 != v64) {
            objc_enumerationMutation(obj);
          }
          uint64_t v19 = *(void **)(*((void *)&v67 + 1) + 8 * v18);
          uint64_t v20 = objc_msgSend_stringGUID(NSString, v14, v15, v16);
          uint64_t v23 = objc_msgSend_stringByAppendingPathExtension_(v20, v21, v63, v22);

          if ((IMIsRunningInMessages() & 1) != 0
            || (IMIsRunningInMobileSMS() & 1) != 0
            || (IMIsRunningInIMDPersistenceAgent() & 1) != 0)
          {
            uint64_t v27 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v24, v25, v26);
            int v30 = objc_msgSend_im_randomTemporaryFileURLWithFileName_(v27, v28, (uint64_t)v23, v29);
            uint64_t v34 = objc_msgSend_path(v30, v31, v32, v33);
          }
          else
          {
            uint64_t v27 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v24, v25, v26);
            uint64_t v34 = objc_msgSend__randomTemporaryPathWithSuffix_withAppendedPathComponent_(v27, v57, (uint64_t)v23, @"com.apple.MobileSMS");
          }

          uint64_t v38 = objc_msgSend_stringByResolvingAndStandardizingPath(v34, v35, v36, v37);

          id v66 = 0;
          char v40 = objc_msgSend_writeToFile_options_error_(v19, v39, (uint64_t)v38, 1, &v66);
          id v42 = v66;
          if ((v40 & 1) == 0 && IMOSLoggingEnabled())
          {
            long long v43 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v72 = v42;
              _os_log_impl(&dword_1A4AF7000, v43, OS_LOG_TYPE_INFO, "MessageService Failed writing attachment to disk on incoming: %@", buf, 0xCu);
            }
          }
          uint64_t v44 = objc_msgSend_fileURLWithPath_isDirectory_(MEMORY[0x1E4F1CB10], v41, (uint64_t)v38, 0);
          uint64_t v47 = objc_msgSend_createNewOutgoingTransferWithLocalFileURL_(self, v45, (uint64_t)v44, v46);
          uint64_t v51 = objc_msgSend_sharedInstance(IMFileTransferCenter, v48, v49, v50);
          long long v54 = objc_msgSend_transferForGUID_(v51, v52, (uint64_t)v47, v53);

          if (v54) {
            objc_msgSend_setHideAttachment_(v54, v55, 1, v56);
          }
          if (v12 && v47) {
            CFArrayAppendValue(v12, v47);
          }

          ++v18;
        }
        while (v17 != v18);
        uint64_t v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v67, (uint64_t)v73, 16);
        uint64_t v17 = v58;
      }
      while (v58);
    }
  }
  else
  {
    uint64_t v12 = (__CFArray *)MEMORY[0x1E4F1CBF0];
  }

  return v12;
}

- (void)fetchHighQualityVariantForTransfer:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v10 = a4;
  if (v6)
  {
    uint64_t v11 = objc_msgSend_guid(v6, v7, v8, v9);
    objc_msgSend__fetchHighQualityVariantForTransferGUID_completion_(self, v12, (uint64_t)v11, (uint64_t)v10);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v14 = 0;
        _os_log_impl(&dword_1A4AF7000, v13, OS_LOG_TYPE_INFO, "fetchHighQualityVariantForTransfer:completion: was given no transfer", v14, 2u);
      }
    }
    if (v10) {
      (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
    }
  }
}

- (void)_fetchHighQualityVariantForTransferGUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = (void (**)(void, void, void))v7;
  if (v6)
  {
    if (v7)
    {
      if (!self->_disconnectionListenerSetUp)
      {
        uint64_t v12 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v8, v9, v10);
        objc_msgSend_addObserver_selector_name_object_(v12, v13, (uint64_t)self, (uint64_t)sel__daemonDisconnected_, @"__kIMDaemonDidDisconnectNotification", 0);

        self->_disconnectionListenerSetUp = 1;
      }
      fetchHighQualityVariantCompletionHandlers = self->_fetchHighQualityVariantCompletionHandlers;
      if (!fetchHighQualityVariantCompletionHandlers)
      {
        uint64_t v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        uint64_t v16 = self->_fetchHighQualityVariantCompletionHandlers;
        self->_fetchHighQualityVariantCompletionHandlers = v15;

        fetchHighQualityVariantCompletionHandlers = self->_fetchHighQualityVariantCompletionHandlers;
      }
      uint64_t v17 = objc_msgSend_objectForKeyedSubscript_(fetchHighQualityVariantCompletionHandlers, v8, (uint64_t)v6, v10);

      if (!v17)
      {
        uint64_t v21 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v18, v19, v20);
        objc_msgSend_setObject_forKeyedSubscript_(self->_fetchHighQualityVariantCompletionHandlers, v22, (uint64_t)v21, (uint64_t)v6);
      }
      uint64_t v23 = objc_msgSend_objectForKeyedSubscript_(self->_fetchHighQualityVariantCompletionHandlers, v18, (uint64_t)v6, v20);
      uint64_t v24 = _Block_copy(v11);
      objc_msgSend_addObject_(v23, v25, (uint64_t)v24, v26);
    }
    objc_msgSend__initiateHighQualityVariantDownloadWithDaemonForGUID_(self, v8, (uint64_t)v6, v10);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v27 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)int v28 = 0;
        _os_log_impl(&dword_1A4AF7000, v27, OS_LOG_TYPE_INFO, "fetchHighQualityVariantForTransfer:completion: was given no transfer guid", v28, 2u);
      }
    }
    if (v11) {
      v11[2](v11, 0, 0);
    }
  }
}

- (void)_initiateHighQualityVariantDownloadWithDaemonForGUID:(id)a3
{
  id v3 = a3;
  objc_msgSend_sharedInstance(IMDaemonController, v4, v5, v6);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_downloadHighQualityVariantOfFileTransferWithGUID_(v9, v7, (uint64_t)v3, v8);
}

- (void)_daemonRestarted:(id)a3
{
  fetchHighQualityVariantCompletionHandlers = self->_fetchHighQualityVariantCompletionHandlers;
  self->_fetchHighQualityVariantCompletionHandlers = 0;
  uint64_t v6 = fetchHighQualityVariantCompletionHandlers;

  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v6, v4, (uint64_t)&unk_1EF8E3BB0, v5);
}

- (void)_daemonDisconnected:(id)a3
{
  v35[2] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v6 = *MEMORY[0x1E4F6D430];
  v34[0] = *MEMORY[0x1E4F28568];
  id v7 = objc_msgSend_mainBundle(MEMORY[0x1E4F28B50], a2, (uint64_t)a3, v3);
  id v9 = objc_msgSend_localizedStringForKey_value_table_(v7, v8, @"File transfer local file URL retrieval operation was unsuccessful.", (uint64_t)&stru_1EF8E78C8, 0);
  v35[0] = v9;
  v34[1] = *MEMORY[0x1E4F28588];
  uint64_t v13 = objc_msgSend_mainBundle(MEMORY[0x1E4F28B50], v10, v11, v12);
  uint64_t v15 = objc_msgSend_localizedStringForKey_value_table_(v13, v14, @"The daemon disconnected.", (uint64_t)&stru_1EF8E78C8, 0);
  v35[1] = v15;
  uint64_t v17 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v16, (uint64_t)v35, (uint64_t)v34, 2);
  uint64_t v19 = objc_msgSend_errorWithDomain_code_userInfo_(v5, v18, v6, 24, v17);

  localFileURLRetrievalCompletionHandlers = self->_localFileURLRetrievalCompletionHandlers;
  self->_localFileURLRetrievalCompletionHandlers = 0;
  uint64_t v21 = localFileURLRetrievalCompletionHandlers;

  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = sub_1A4B8F340;
  v32[3] = &unk_1E5B7C718;
  id v22 = v19;
  id v33 = v22;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v21, v23, (uint64_t)v32, v24);
  localFileURLRetrievalWithGuidCompletionHandlers = self->_localFileURLRetrievalWithGuidCompletionHandlers;
  self->_localFileURLRetrievalWithGuidCompletionHandlers = 0;
  uint64_t v26 = localFileURLRetrievalWithGuidCompletionHandlers;

  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = sub_1A4B8F3F0;
  v30[3] = &unk_1E5B7C718;
  id v31 = v22;
  id v27 = v22;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v26, v28, (uint64_t)v30, v29);
}

- (void)preWarmConnection
{
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_1A4AF7000, v5, OS_LOG_TYPE_INFO, "IMTransferCenter is asked for prewarm", v10, 2u);
    }
  }
  uint64_t v6 = objc_msgSend_sharedInstance(IMDaemonController, v2, v3, v4);
  objc_msgSend_preWarm(v6, v7, v8, v9);
}

- (void)retrieveLocalFileURLForFileTransferWithGUID:(id)a3 options:(int64_t)a4 completion:(id)a5
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (objc_msgSend_length(v8, v10, v11, v12))
  {
    uint64_t v15 = objc_msgSend_transferForGUID_(self, v13, (uint64_t)v8, v14);
    if (objc_msgSend_existsAtLocalPath(v15, v16, v17, v18))
    {
      if (v9)
      {
        id v22 = objc_msgSend_localPath(v15, v19, v20, v21);
        uint64_t v26 = objc_msgSend_localPath(v15, v23, v24, v25);
        int v30 = objc_msgSend_im_livePhotoBundlePath(v26, v27, v28, v29);
        (*((void (**)(id, uint64_t, void, void *, void *, void))v9 + 2))(v9, 1, 0, v22, v30, 0);
      }
    }
    else if (objc_msgSend_isInThumbnailState(v15, v19, v20, v21))
    {
      if (v9)
      {
        uint64_t v51 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v52 = objc_msgSend_mainBundle(MEMORY[0x1E4F28B50], v48, v49, v50, *MEMORY[0x1E4F28568]);
        long long v54 = objc_msgSend_localizedStringForKey_value_table_(v52, v53, @"File transfer local file url retrieval operation was unsuccessful.", (uint64_t)&stru_1EF8E78C8, 0);
        v81[0] = v54;
        v80[1] = *MEMORY[0x1E4F28588];
        uint64_t v58 = objc_msgSend_mainBundle(MEMORY[0x1E4F28B50], v55, v56, v57);
        id v60 = objc_msgSend_localizedStringForKey_value_table_(v58, v59, @"The given GUID references an attachment which is in thumbnail state. You don't want to analyze this, Skip and retry later, user did not tap to downloaded.", (uint64_t)&stru_1EF8E78C8, 0);
        v81[1] = v60;
        __int16 v62 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v61, (uint64_t)v81, (uint64_t)v80, 2);
        uint64_t v64 = objc_msgSend_errorWithDomain_code_userInfo_(v51, v63, *MEMORY[0x1E4F6D438], 24, v62);

        (*((void (**)(id, void, void, void, void, void *))v9 + 2))(v9, 0, 0, 0, 0, v64);
      }
    }
    else
    {
      if (v9)
      {
        if (!self->_disconnectionListenerSetUp)
        {
          id v65 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v48, v49, v50);
          objc_msgSend_addObserver_selector_name_object_(v65, v66, (uint64_t)self, (uint64_t)sel__daemonDisconnected_, @"__kIMDaemonDidDisconnectNotification", 0);

          self->_disconnectionListenerSetUp = 1;
        }
        localFileURLRetrievalCompletionHandlers = self->_localFileURLRetrievalCompletionHandlers;
        if (!localFileURLRetrievalCompletionHandlers)
        {
          long long v68 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
          long long v69 = self->_localFileURLRetrievalCompletionHandlers;
          self->_localFileURLRetrievalCompletionHandlers = v68;

          localFileURLRetrievalCompletionHandlers = self->_localFileURLRetrievalCompletionHandlers;
        }
        long long v70 = objc_msgSend_objectForKeyedSubscript_(localFileURLRetrievalCompletionHandlers, v48, (uint64_t)v8, v50);

        if (!v70)
        {
          uint64_t v74 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v71, v72, v73);
          objc_msgSend_setObject_forKeyedSubscript_(self->_localFileURLRetrievalCompletionHandlers, v75, (uint64_t)v74, (uint64_t)v8);
        }
        v76 = objc_msgSend_objectForKeyedSubscript_(self->_localFileURLRetrievalCompletionHandlers, v71, (uint64_t)v8, v73);
        uint64_t v77 = _Block_copy(v9);
        objc_msgSend_addObject_(v76, v78, (uint64_t)v77, v79);
      }
      objc_msgSend__initiateLocalFileURLRetrievalInDaemonForGUID_options_(self, v48, (uint64_t)v8, a4);
    }
    goto LABEL_23;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v34 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v85 = "-[IMFileTransferCenter retrieveLocalFileURLForFileTransferWithGUID:options:completion:]";
      _os_log_impl(&dword_1A4AF7000, v34, OS_LOG_TYPE_INFO, "%s was given no transfer guid", buf, 0xCu);
    }
  }
  if (v9)
  {
    id v35 = (void *)MEMORY[0x1E4F28C58];
    v82[0] = *MEMORY[0x1E4F28568];
    uint64_t v36 = objc_msgSend_mainBundle(MEMORY[0x1E4F28B50], v31, v32, v33);
    uint64_t v38 = objc_msgSend_localizedStringForKey_value_table_(v36, v37, @"File transfer local file url retrieval operation was unsuccessful.", (uint64_t)&stru_1EF8E78C8, 0);
    v83[0] = v38;
    v82[1] = *MEMORY[0x1E4F28588];
    id v42 = objc_msgSend_mainBundle(MEMORY[0x1E4F28B50], v39, v40, v41);
    uint64_t v44 = objc_msgSend_localizedStringForKey_value_table_(v42, v43, @"The given GUID was empty.", (uint64_t)&stru_1EF8E78C8, 0);
    v83[1] = v44;
    uint64_t v46 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v45, (uint64_t)v83, (uint64_t)v82, 2);
    uint64_t v15 = objc_msgSend_errorWithDomain_code_userInfo_(v35, v47, *MEMORY[0x1E4F6D438], 24, v46);

    (*((void (**)(id, void, void, void, void, void *))v9 + 2))(v9, 0, 0, 0, 0, v15);
LABEL_23:
  }
}

- (void)retrieveLocalFileURLForFileTransferWithGUIDs:(id)a3 options:(int64_t)a4 completion:(id)a5
{
  int64_t v82 = a4;
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  v83 = v7;
  if (objc_msgSend_count(v7, v9, v10, v11))
  {
    uint64_t v87 = objc_opt_new();
    long long v91 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    id obj = v7;
    uint64_t v90 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v12, (uint64_t)&v91, (uint64_t)v97, 16);
    if (!v90) {
      goto LABEL_21;
    }
    uint64_t v89 = *(void *)v92;
    uint64_t v84 = *MEMORY[0x1E4F6D438];
    uint64_t v86 = *MEMORY[0x1E4F28568];
    uint64_t v85 = *MEMORY[0x1E4F28588];
    while (1)
    {
      for (uint64_t i = 0; i != v90; ++i)
      {
        if (*(void *)v92 != v89) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v91 + 1) + 8 * i);
        uint64_t v17 = objc_msgSend_transferForGUID_(self, v13, v16, v14);
        if (((v8 != 0) & objc_msgSend_existsAtLocalPath(v17, v18, v19, v20)) == 1)
        {
          uint64_t v24 = objc_msgSend_localPath(v17, v21, v22, v23);
          uint64_t v28 = objc_msgSend_localPath(v17, v25, v26, v27);
          uint64_t v32 = objc_msgSend_im_livePhotoBundlePath(v28, v29, v30, v31);
          (*((void (**)(id, uint64_t, uint64_t, void, void *, void *, void))v8 + 2))(v8, 1, v16, 0, v24, v32, 0);
        }
        else if (objc_msgSend_isInThumbnailState(v17, v21, v22, v23))
        {
          if (!v8) {
            goto LABEL_19;
          }
          uint64_t v36 = (void *)MEMORY[0x1E4F28C58];
          v95[0] = v86;
          uint64_t v37 = objc_msgSend_mainBundle(MEMORY[0x1E4F28B50], v33, v34, v35);
          id v39 = objc_msgSend_localizedStringForKey_value_table_(v37, v38, @"File transfer local file url retrieval operation was unsuccessful.", (uint64_t)&stru_1EF8E78C8, 0);
          v95[1] = v85;
          v96[0] = v39;
          long long v43 = objc_msgSend_mainBundle(MEMORY[0x1E4F28B50], v40, v41, v42);
          uint64_t v45 = objc_msgSend_localizedStringForKey_value_table_(v43, v44, @"The given GUID references an attachment which is in thumbnail state. You don't want to analyze this, Skip and retry later, user did not tap to downloaded.", (uint64_t)&stru_1EF8E78C8, 0);
          v96[1] = v45;
          uint64_t v47 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v46, (uint64_t)v96, (uint64_t)v95, 2);
          uint64_t v24 = objc_msgSend_errorWithDomain_code_userInfo_(v36, v48, v84, 24, v47);

          (*((void (**)(id, void, void, void, void, void, void *))v8 + 2))(v8, 0, 0, 0, 0, 0, v24);
        }
        else
        {
          objc_msgSend_addObject_(v87, v33, v16, v35);
          if (!v8) {
            goto LABEL_19;
          }
          localFileURLRetrievalWithGuidCompletionHandlers = self->_localFileURLRetrievalWithGuidCompletionHandlers;
          if (!localFileURLRetrievalWithGuidCompletionHandlers)
          {
            uint64_t v52 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
            uint64_t v53 = self->_localFileURLRetrievalWithGuidCompletionHandlers;
            self->_localFileURLRetrievalWithGuidCompletionHandlers = v52;

            localFileURLRetrievalWithGuidCompletionHandlers = self->_localFileURLRetrievalWithGuidCompletionHandlers;
          }
          long long v54 = objc_msgSend_objectForKeyedSubscript_(localFileURLRetrievalWithGuidCompletionHandlers, v49, v16, v50, v82, v83);
          BOOL v55 = v54 == 0;

          if (v55)
          {
            int v59 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v56, v57, v58);
            objc_msgSend_setObject_forKeyedSubscript_(self->_localFileURLRetrievalWithGuidCompletionHandlers, v60, (uint64_t)v59, v16);
          }
          uint64_t v24 = objc_msgSend_objectForKeyedSubscript_(self->_localFileURLRetrievalWithGuidCompletionHandlers, v56, v16, v58);
          id v61 = _Block_copy(v8);
          objc_msgSend_addObject_(v24, v62, (uint64_t)v61, v63);
        }
LABEL_19:
      }
      uint64_t v90 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v91, (uint64_t)v97, 16);
      if (!v90)
      {
LABEL_21:

        objc_msgSend__initiateLocalFileURLRetrievalInDaemonForGUIDs_options_(self, v64, (uint64_t)v87, v82);
        goto LABEL_28;
      }
    }
  }
  if (IMOSLoggingEnabled())
  {
    long long v68 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v101 = "-[IMFileTransferCenter retrieveLocalFileURLForFileTransferWithGUIDs:options:completion:]";
      _os_log_impl(&dword_1A4AF7000, v68, OS_LOG_TYPE_INFO, "%s was given no transfer guids", buf, 0xCu);
    }
  }
  if (v8)
  {
    long long v69 = (void *)MEMORY[0x1E4F28C58];
    v98[0] = *MEMORY[0x1E4F28568];
    long long v70 = objc_msgSend_mainBundle(MEMORY[0x1E4F28B50], v65, v66, v67);
    uint64_t v72 = objc_msgSend_localizedStringForKey_value_table_(v70, v71, @"File transfer local file urls retrieval operation was unsuccessful.", (uint64_t)&stru_1EF8E78C8, 0);
    v99[0] = v72;
    v98[1] = *MEMORY[0x1E4F28588];
    v76 = objc_msgSend_mainBundle(MEMORY[0x1E4F28B50], v73, v74, v75);
    v78 = objc_msgSend_localizedStringForKey_value_table_(v76, v77, @"The given GUIDs was empty.", (uint64_t)&stru_1EF8E78C8, 0);
    v99[1] = v78;
    uint64_t v80 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v79, (uint64_t)v99, (uint64_t)v98, 2);
    uint64_t v87 = objc_msgSend_errorWithDomain_code_userInfo_(v69, v81, *MEMORY[0x1E4F6D438], 24, v80);

    (*((void (**)(id, void, void, void, void, void, void *))v8 + 2))(v8, 0, 0, 0, 0, 0, v87);
LABEL_28:
  }
}

- (void)_initiateLocalFileURLRetrievalInDaemonForGUID:(id)a3 options:(int64_t)a4
{
  id v6 = a3;
  objc_msgSend__registerDaemonListenerIfNecessary(self, v7, v8, v9);
  objc_msgSend_sharedInstance(IMDaemonController, v10, v11, v12);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_retrieveLocalFileURLForFileTransferWithGUID_options_(v14, v13, (uint64_t)v6, a4);
}

- (void)_initiateLocalFileURLRetrievalInDaemonForGUIDs:(id)a3 options:(int64_t)a4
{
  id v6 = a3;
  objc_msgSend__registerDaemonListenerIfNecessary(self, v7, v8, v9);
  objc_msgSend_sharedInstance(IMDaemonController, v10, v11, v12);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_retrieveLocalFileURLForFileTransferWithGUIDs_options_(v14, v13, (uint64_t)v6, a4);
}

- (void)createItemForPHAssetWithUUID:(id)a3 parentChatItemGUID:(id)a4 chatGUID:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  objc_msgSend_sharedInstance(IMDaemonController, v10, v11, v12);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_createItemForPHAssetWithUUID_parentChatItemGUID_chatGUID_(v14, v13, (uint64_t)v9, (uint64_t)v8, v7);
}

- (void)_registerDaemonListenerIfNecessary
{
  daemonConnection = self->_daemonConnection;
  if (!daemonConnection)
  {
    id v6 = objc_msgSend_mainBundle(MEMORY[0x1E4F28B50], a2, v2, v3);
    uint64_t v10 = objc_msgSend_bundleIdentifier(v6, v7, v8, v9);

    uint64_t v13 = objc_msgSend_stringWithFormat_(NSString, v11, @"%@-IMFileTransferCenter", v12, v10);
    uint64_t v17 = objc_msgSend_sharedController(IMDaemonController, v14, v15, v16);
    objc_msgSend_multiplexedConnectionWithLabel_capabilities_context_(v17, v18, (uint64_t)v13, 0x10000000, 0);
    uint64_t v19 = (IMDaemonMultiplexedConnectionManaging *)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = self->_daemonConnection;
    self->_daemonConnection = v19;

    daemonConnection = self->_daemonConnection;
  }

  objc_msgSend_waitForSetup(daemonConnection, a2, v2, v3);
}

- (BOOL)shouldIssueSandboxEstensionsForTransfers
{
  return self->_issueSandboxEstensionsForTransfers;
}

- (void)setIssueSandboxEstensionsForTransfers:(BOOL)a3
{
  self->_issueSandboxEstensionsForTransfers = a3;
}

- (IMDaemonMultiplexedConnectionManaging)daemonConnection
{
  return self->_daemonConnection;
}

- (void)setDaemonConnection:(id)a3
{
}

- (NSMutableDictionary)guidToTransferMap
{
  return self->_guidToTransferMap;
}

- (void)setGuidToTransferMap:(id)a3
{
}

- (NSMutableDictionary)guidToRemovedTransferMap
{
  return self->_guidToRemovedTransferMap;
}

- (void)setGuidToRemovedTransferMap:(id)a3
{
}

- (NSMutableDictionary)accountIDToTransferGUIDsMap
{
  return self->_accountIDToTransferGUIDsMap;
}

- (void)setAccountIDToTransferGUIDsMap:(id)a3
{
}

- (NSMutableArray)preauthorizedInfos
{
  return self->_preauthorizedInfos;
}

- (void)setPreauthorizedInfos:(id)a3
{
}

- (NSMutableArray)preauthorizedGUIDs
{
  return self->_preauthorizedGUIDs;
}

- (void)setPreauthorizedGUIDs:(id)a3
{
}

- (void)setActiveTransfers:(id)a3
{
}

- (NSMutableSet)pendingTransfers
{
  return self->_pendingTransfers;
}

- (void)setPendingTransfers:(id)a3
{
}

- (BOOL)disconnectionListenerSetUp
{
  return self->_disconnectionListenerSetUp;
}

- (void)setDisconnectionListenerSetUp:(BOOL)a3
{
  self->_disconnectionListenerSetUp = a3;
}

- (NSMutableDictionary)fetchHighQualityVariantCompletionHandlers
{
  return self->_fetchHighQualityVariantCompletionHandlers;
}

- (void)setFetchHighQualityVariantCompletionHandlers:(id)a3
{
}

- (NSMutableDictionary)localFileURLRetrievalCompletionHandlers
{
  return self->_localFileURLRetrievalCompletionHandlers;
}

- (void)setLocalFileURLRetrievalCompletionHandlers:(id)a3
{
}

- (NSMutableDictionary)localFileURLRetrievalWithGuidCompletionHandlers
{
  return self->_localFileURLRetrievalWithGuidCompletionHandlers;
}

- (void)setLocalFileURLRetrievalWithGuidCompletionHandlers:(id)a3
{
}

- (NSMutableDictionary)redownloadlocalFilesWithURLCompletionHandlers
{
  return self->_redownloadlocalFilesWithURLCompletionHandlers;
}

- (void)setRedownloadlocalFilesWithURLCompletionHandlers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_redownloadlocalFilesWithURLCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_localFileURLRetrievalWithGuidCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_localFileURLRetrievalCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_fetchHighQualityVariantCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_pendingTransfers, 0);
  objc_storeStrong((id *)&self->_activeTransfers, 0);
  objc_storeStrong((id *)&self->_preauthorizedGUIDs, 0);
  objc_storeStrong((id *)&self->_preauthorizedInfos, 0);
  objc_storeStrong((id *)&self->_accountIDToTransferGUIDsMap, 0);
  objc_storeStrong((id *)&self->_guidToRemovedTransferMap, 0);
  objc_storeStrong((id *)&self->_guidToTransferMap, 0);

  objc_storeStrong((id *)&self->_daemonConnection, 0);
}

@end