@interface ICCameraDevice
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)uuidStringFromFileProviderIdentifier:(id)a3;
- (BOOL)addMediaFiles:(id)a3;
- (BOOL)allowsSyncingClock;
- (BOOL)basicMediaModel;
- (BOOL)batteryLevelAvailable;
- (BOOL)beingEjected;
- (BOOL)containsRestrictedStorage;
- (BOOL)contentReceived;
- (BOOL)iCloudPhotosEnabled;
- (BOOL)isAccessRestrictedAppleDevice;
- (BOOL)isEjectable;
- (BOOL)isEnumeratingContent;
- (BOOL)isLocked;
- (BOOL)legacyDevice;
- (BOOL)notifyDelegateRestrictionChanged;
- (BOOL)setDefaultMediaPresentation:(unint64_t)a3;
- (BOOL)supportsMediaFormatCatalog;
- (BOOL)tetheredCaptureEnabled;
- (BOOL)updateAppleProperties:(id)a3;
- (BOOL)updateMediaPresentation;
- (CGImage)cameraDeviceIcon;
- (CGImage)icon;
- (ICCameraDevice)initWithDictionary:(id)a3;
- (ICMediaPresentation)mediaPresentation;
- (ICOrderedMediaSet)indexedMediaSet;
- (NSArray)contents;
- (NSArray)filesOfType:(NSString *)fileUTType;
- (NSArray)mediaFiles;
- (NSMutableArray)devContents;
- (NSMutableArray)devMediaFiles;
- (NSMutableDictionary)mobdevProperties;
- (NSMutableSet)devCapabilities;
- (NSNumber)devicePairedState;
- (NSProgress)deleteProgress;
- (NSProgress)downloadProgress;
- (NSProgress)requestDeleteFiles:(NSArray *)files deleteFailed:(void *)deleteFailed completion:(void *)completion;
- (NSString)appleSerialNumber;
- (NSString)buildVersion;
- (NSString)devProductType;
- (NSString)deviceClass;
- (NSString)deviceColor;
- (NSString)deviceEnclosureColor;
- (NSString)mountPoint;
- (NSString)productVersion;
- (NSTimeInterval)timeOffset;
- (NSUInteger)batteryLevel;
- (NSUInteger)contentCatalogPercentCompleted;
- (NSXPCConnection)devConnection;
- (NSXPCListenerEndpoint)devEndpoint;
- (OS_dispatch_queue)devCommandQueue;
- (OS_dispatch_queue)devNotificationQueue;
- (OS_dispatch_queue)devWriteQueue;
- (OS_dispatch_queue)deviceCommandQueue;
- (OS_dispatch_queue)deviceNotificationQueue;
- (OS_dispatch_queue)deviceWriteQueue;
- (id)cameraFileWithObjectID:(unint64_t)a3;
- (id)cameraFolderWithObjectID:(unint64_t)a3;
- (id)description;
- (id)ownerMedia:(id)a3 withMedia:(id)a4;
- (id)relateGroupedMedia:(id)a3;
- (id)relateLegacyMedia:(id)a3;
- (id)relateMedia:(id)a3;
- (id)remoteCamera;
- (id)remoteCameraWithFailureBlock:(id)a3;
- (int64_t)cameraFilesContentSizeInBytes;
- (int64_t)enumerationOrder;
- (int64_t)preflightCountOfObjects;
- (int64_t)stitchMedia:(id)a3 withMedia:(id)a4;
- (os_unfair_lock_s)mediaLock;
- (unint64_t)appleRelatedUUIDSupport;
- (unint64_t)countOfObjects;
- (unint64_t)devAccessRestriction;
- (unint64_t)devContentCatalogPercentCompleted;
- (unint64_t)devFailureCount;
- (unint64_t)devMediaPresentation;
- (unint64_t)deviceAccessRestriction;
- (unint64_t)estimatedNumberOfDownloadableItems;
- (unint64_t)iCloudPhotosOptimizeStorageState;
- (unint64_t)mediaObjectCount;
- (unint64_t)numberOfDownloadableItems;
- (unint64_t)previouslyIndexed;
- (void)addCameraFileToIndex:(id)a3;
- (void)addCameraFolderToIndex:(id)a3;
- (void)addCapability:(id)a3;
- (void)addFolder:(id)a3;
- (void)addItems:(id)a3;
- (void)addNumberOfDownloadableItems:(int64_t)a3;
- (void)blendMedia:(id)a3[10] ofLength:(int)a4 withMedia:(id)a5[10] ofLength:(int)a6;
- (void)cancelDelete;
- (void)cancelDownload;
- (void)dealloc;
- (void)dispatchAsyncForOperationType:(int64_t)a3 block:(id)a4;
- (void)dumpPTPPassthruCommand:(id)a3 andData:(id)a4;
- (void)grindMedia:(id)a3[10] index:(int *)a4 file:(id)a5;
- (void)handlePtpEvent:(id)a3;
- (void)handleStatusNotification:(id)a3;
- (void)lockMedia;
- (void)ptpEventHandler;
- (void)removeCameraFileFromIndex:(id)a3;
- (void)removeCameraFolderFromIndex:(id)a3;
- (void)removeFolder:(id)a3;
- (void)removeItems:(id)a3;
- (void)requestCloseSession;
- (void)requestCloseSessionWithOptions:(id)a3 completion:(id)a4;
- (void)requestDeleteFiles:(NSArray *)files;
- (void)requestDownloadFile:(ICCameraFile *)file options:(NSDictionary *)options downloadDelegate:(id)downloadDelegate didDownloadSelector:(SEL)selector contextInfo:(void *)contextInfo;
- (void)requestEject;
- (void)requestEnumerateContentWithOptions:(id)a3 completion:(id)a4;
- (void)requestOpenSession;
- (void)requestOpenSessionWithOptions:(id)a3 completion:(id)a4;
- (void)requestReadDataFromFile:(ICCameraFile *)file atOffset:(off_t)offset length:(off_t)length readDelegate:(id)readDelegate didReadDataSelector:(SEL)selector contextInfo:(void *)contextInfo;
- (void)requestSendPTPCommand:(NSData *)command outData:(NSData *)data sendCommandDelegate:(id)sendCommandDelegate didSendCommandSelector:(SEL)selector contextInfo:(void *)contextInfo;
- (void)requestSendPTPCommand:(NSData *)ptpCommand outData:(NSData *)ptpData completion:(void *)completion;
- (void)requestSyncClock;
- (void)requestTakePicture;
- (void)requestUploadFile:(NSURL *)fileURL options:(NSDictionary *)options uploadDelegate:(id)uploadDelegate didUploadSelector:(SEL)selector contextInfo:(void *)contextInfo;
- (void)resetAccessRestriction;
- (void)setAccessRestrictedAppleDevice:(BOOL)a3;
- (void)setAccessRestriction:(unint64_t)a3;
- (void)setAllowsSyncingClock:(BOOL)a3;
- (void)setAppleRelatedUUIDSupport:(unint64_t)a3;
- (void)setBasicMediaModel:(BOOL)a3;
- (void)setBatteryLevel:(unint64_t)a3;
- (void)setBatteryLevelAvailable:(BOOL)a3;
- (void)setBeingEjected:(BOOL)a3;
- (void)setCameraDeviceIcon:(CGImage *)a3;
- (void)setContentCatalogPercentCompleted:(unint64_t)a3;
- (void)setContentReceived:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDeleteProgress:(id)a3;
- (void)setDevAccessRestriction:(unint64_t)a3;
- (void)setDevCapabilities:(id)a3;
- (void)setDevCommandQueue:(id)a3;
- (void)setDevConnection:(id)a3;
- (void)setDevContentCatalogPercentCompleted:(unint64_t)a3;
- (void)setDevContents:(id)a3;
- (void)setDevEndpoint:(id)a3;
- (void)setDevFailureCount:(unint64_t)a3;
- (void)setDevMediaFiles:(id)a3;
- (void)setDevMediaPresentation:(unint64_t)a3;
- (void)setDevNotificationQueue:(id)a3;
- (void)setDevProductType:(id)a3;
- (void)setDevWriteQueue:(id)a3;
- (void)setDeviceAccessRestriction:(unint64_t)a3;
- (void)setDownloadProgress:(id)a3;
- (void)setEjectable:(BOOL)a3;
- (void)setEnumerationOrder:(int64_t)a3;
- (void)setICloudPhotosEnabled:(BOOL)a3;
- (void)setICloudPhotosOptimizeStorageState:(unint64_t)a3;
- (void)setIndexedMediaSet:(id)a3;
- (void)setIsAccessRestrictedAppleDevice:(BOOL)a3;
- (void)setLocked:(BOOL)a3;
- (void)setMediaLock:(os_unfair_lock_s)a3;
- (void)setMediaObjectCount:(unint64_t)a3;
- (void)setMediaPresentation:(ICMediaPresentation)mediaPresentation;
- (void)setMobdevProperties:(id)a3;
- (void)setMountPoint:(id)a3;
- (void)setNotifyDelegateRestrictionChanged:(BOOL)a3;
- (void)setPreflightCountOfObjects:(int64_t)a3;
- (void)setPreviouslyIndexed:(unint64_t)a3;
- (void)setPtpEventForwarding:(BOOL)a3;
- (void)setPtpEventHandler:(void *)ptpEventHandler;
- (void)setTimeOffset:(double)a3;
- (void)storageAvailable;
- (void)unlockMedia;
- (void)updateAccessRestriction;
- (void)updateContentCatalogPercentCompleted;
- (void)updateEnumeratingErrorStatus;
- (void)updateLockedErrorStatus;
- (void)updateMediaFilesCount:(id)a3;
@end

@implementation ICCameraDevice

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"mediaFiles"])
  {
    unsigned __int8 v5 = 0;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___ICCameraDevice;
    unsigned __int8 v5 = objc_msgSendSuper2(&v7, sel_automaticallyNotifiesObserversForKey_, v4);
  }

  return v5;
}

+ (id)uuidStringFromFileProviderIdentifier:(id)a3
{
  __src[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = v3;
  __src[0] = 0;
  __src[1] = 0;
  unint64_t v30 = 0;
  if (!v3) {
    goto LABEL_10;
  }
  uint64_t v5 = [v3 smallestEncoding];
  [v4 length];
  uint64_t v6 = [v4 length] - 16;
  [v4 length];
  int v7 = objc_msgSend(v4, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", __src, 16, &v30, v5, 1, v6, 16, 0);
  v8 = 0;
  if (!v7) {
    goto LABEL_11;
  }
  UInt8 byte15 = 0;
  UInt8 v10 = 0;
  UInt8 v11 = 0;
  UInt8 v12 = 0;
  UInt8 v13 = 0;
  UInt8 v14 = 0;
  UInt8 v15 = 0;
  UInt8 v16 = 0;
  UInt8 byte7 = 0;
  UInt8 v18 = 0;
  UInt8 v19 = 0;
  UInt8 v20 = 0;
  UInt8 v21 = 0;
  UInt8 v22 = 0;
  UInt8 v23 = 0;
  UInt8 v24 = 0;
  *(void *)byte6 = 0;
  uint64_t v32 = 0;
  if (v30 >= 0x10) {
    int v25 = 0;
  }
  else {
    int v25 = 16 - v30;
  }
  if (v25 <= 15)
  {
    memcpy(&byte6[v25], __src, (15 - v25) + 1);
    UInt8 v24 = byte6[0];
    UInt8 v23 = byte6[1];
    UInt8 v22 = byte6[2];
    UInt8 v21 = byte6[3];
    UInt8 v20 = byte6[4];
    UInt8 v19 = byte6[5];
    UInt8 v18 = byte6[6];
    UInt8 byte7 = byte6[7];
    UInt8 v16 = v32;
    UInt8 v15 = BYTE1(v32);
    UInt8 v14 = BYTE2(v32);
    UInt8 v13 = BYTE3(v32);
    UInt8 v12 = BYTE4(v32);
    UInt8 v11 = BYTE5(v32);
    UInt8 v10 = BYTE6(v32);
    UInt8 byte15 = HIBYTE(v32);
  }
  CFAllocatorRef v26 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFUUIDRef v27 = CFUUIDCreateWithBytes((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v24, v23, v22, v21, v20, v19, v18, byte7, v16, v15, v14, v13, v12, v11, v10, byte15);
  if (v27)
  {
    CFUUIDRef v28 = v27;
    v8 = (__CFString *)CFUUIDCreateString(v26, v27);
    CFRelease(v28);
  }
  else
  {
LABEL_10:
    v8 = 0;
  }
LABEL_11:

  return v8;
}

- (id)relateLegacyMedia:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __36__ICCameraDevice_relateLegacyMedia___block_invoke;
  v10[3] = &unk_1E63D7D48;
  id v11 = v6;
  id v7 = v6;
  [v4 enumerateKeysAndObjectsUsingBlock:v10];

  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
  [v5 setObject:v8 forKeyedSubscript:@"universalFilesCount"];

  [v5 setObject:v7 forKeyedSubscript:@"newMedia"];

  return v5;
}

void __36__ICCameraDevice_relateLegacyMedia___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v18 = a3;
  unint64_t v4 = [v18 count];
  uFiles = 0u;
  *(_OWORD *)&qword_1EA138570 = 0u;
  xmmword_1EA138580 = 0u;
  unk_1EA138590 = 0u;
  xmmword_1EA1385A0 = 0u;
  if (v4 < 2)
  {
    UInt8 v10 = *(void **)(a1 + 32);
    id v11 = [v18 objectAtIndexedSubscript:0];
    [v10 addObject:v11];
    goto LABEL_38;
  }
  int v5 = 0;
  unint64_t v6 = v4 - 1;
  do
  {
    id v7 = [v18 objectAtIndexedSubscript:v6];
    if (([v7 isJPEG] & 1) != 0 || objc_msgSend(v7, "isHEIC"))
    {
      if ((void)uFiles) {
        goto LABEL_8;
      }
      *(void *)&uFiles = v7;
    }
    else
    {
      if ([v7 isNonRawImage]) {
        goto LABEL_8;
      }
      if ([v7 isRaw])
      {
        *((void *)&uFiles + 1) = v7;
        goto LABEL_9;
      }
      if ([v7 isMovie])
      {
        if (!qword_1EA138570)
        {
          qword_1EA138570 = (uint64_t)v7;
          goto LABEL_9;
        }
LABEL_8:
        [*(id *)(a1 + 32) addObject:v7];
        goto LABEL_9;
      }
      if ([v7 isAudio])
      {
        qword_1EA138578 = (uint64_t)v7;
      }
      else
      {
        v9 = (char *)&uFiles + 8 * v5++;
        *((void *)v9 + 4) = v7;
      }
    }
LABEL_9:

    BOOL v8 = v6-- != 0;
  }
  while (v8 && v5 < 10);
  id v11 = (id)uFiles;
  id v12 = *((id *)&uFiles + 1);
  id v13 = v12;
  if (v11)
  {
    if (v12)
    {
      [v11 setPairedRawImage:v12];
      unint64_t v14 = 2;
      UInt8 v15 = v13;
    }
    else
    {
      UInt8 v15 = 0;
      unint64_t v14 = 2;
    }
    do
    {
LABEL_32:
      if (*((void *)&uFiles + v14)) {
        objc_msgSend(v11, "addSidecarFile:");
      }
      BOOL v8 = v14++ >= 7;
    }
    while (!v8);
    [*(id *)(a1 + 32) addObject:v11];
    if (v15)
    {
      [*(id *)(a1 + 32) addObject:v15];
    }
  }
  else
  {
    if (v12)
    {
      UInt8 v15 = 0;
      unint64_t v14 = 2;
      id v11 = v12;
      goto LABEL_32;
    }
    id v16 = (id)qword_1EA138570;
    if (v16)
    {
      id v11 = v16;
      UInt8 v15 = 0;
      unint64_t v14 = 3;
      goto LABEL_32;
    }
    id v17 = (id)qword_1EA138578;
    UInt8 v15 = 0;
    if (v17)
    {
      id v11 = v17;
      unint64_t v14 = 4;
      goto LABEL_32;
    }
    id v11 = 0;
  }
LABEL_38:
}

- (id)relateGroupedMedia:(id)a3
{
  unint64_t v4 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = __37__ICCameraDevice_relateGroupedMedia___block_invoke;
  unint64_t v14 = &unk_1E63D7D70;
  UInt8 v15 = self;
  id v16 = v7;
  id v8 = v7;
  [v5 enumerateKeysAndObjectsUsingBlock:&v11];

  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "count", v11, v12, v13, v14, v15));
  [v6 setObject:v9 forKeyedSubscript:@"universalFilesCount"];

  [v6 setObject:v8 forKeyedSubscript:@"newMedia"];

  return v6;
}

void __37__ICCameraDevice_relateGroupedMedia___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [v4 count];
  int v10 = 0;
  uFiles = 0u;
  *(_OWORD *)&qword_1EA138570 = 0u;
  xmmword_1EA138580 = 0u;
  unk_1EA138590 = 0u;
  xmmword_1EA1385A0 = 0u;
  if (v5)
  {
    uint64_t v6 = v5 - 1;
    do
    {
      id v7 = [v4 objectAtIndexedSubscript:v6];
      if ([v7 universalFamily]) {
        [*(id *)(a1 + 32) grindMedia:&uFiles index:&v10 file:v7];
      }

      --v6;
    }
    while (v6 != -1);
    uint64_t v8 = v10;
  }
  else
  {
    uint64_t v8 = 0;
  }
  [*(id *)(a1 + 32) blendMedia:&uFiles ofLength:v8 withMedia:&uFiles ofLength:v8];
  if (v10 >= 1)
  {
    for (uint64_t i = 0; i < v10; ++i)
    {
      if (([*((id *)&uFiles + i) isSidecar] & 1) == 0
        && ([*((id *)&uFiles + i) isDataUniversal] & 1) == 0)
      {
        [*(id *)(a1 + 40) addObject:*((void *)&uFiles + i)];
      }
    }
  }
}

- (id)ownerMedia:(id)a3 withMedia:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isImage] && objc_msgSend(v6, "isMovie"))
  {
    id v7 = v5;
    [v7 addSidecarFile:v6];
    uint64_t v8 = v6;
LABEL_7:
    [v8 flagAsSidecar];
    goto LABEL_9;
  }
  if ([v5 isMovie] && objc_msgSend(v6, "isImage"))
  {
    id v7 = v6;
    [v7 addSidecarFile:v5];
    uint64_t v8 = v5;
    goto LABEL_7;
  }
  id v7 = 0;
LABEL_9:

  return v7;
}

- (int64_t)stitchMedia:(id)a3 withMedia:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 objectID];
  if (v8 != [v7 objectID])
  {
    if ([v6 isImage] && objc_msgSend(v7, "isMovie")
      || (([v6 isMovie] & 1) != 0 || objc_msgSend(v6, "isImage"))
      && [v7 isDataUniversal])
    {
      [v6 addSidecarFile:v7];
      [v7 flagAsSidecar];
    }
    else if (([v7 isImage] && (objc_msgSend(v6, "isImage") & 1) != 0 {
            || [v7 isMovie] && objc_msgSend(v6, "isMovie"))
    }
           && ([v7 isOriginal] && (objc_msgSend(v6, "isConverted") & 1) != 0
            || [v6 isOriginal] && objc_msgSend(v7, "isConverted")))
    {
      objc_msgSend(v7, "setTwinID:", objc_msgSend(v6, "objectID"));
      objc_msgSend(v6, "setTwinID:", objc_msgSend(v7, "objectID"));
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v20 = v6;
      id obj = [v6 sidecarFiles];
      uint64_t v9 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v27;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v27 != v11) {
              objc_enumerationMutation(obj);
            }
            uint64_t v13 = *(void *)(*((void *)&v26 + 1) + 8 * v12);
            long long v22 = 0u;
            long long v23 = 0u;
            long long v24 = 0u;
            long long v25 = 0u;
            unint64_t v14 = [v7 sidecarFiles];
            uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
            if (v15)
            {
              uint64_t v16 = v15;
              uint64_t v17 = *(void *)v23;
              do
              {
                uint64_t v18 = 0;
                do
                {
                  if (*(void *)v23 != v17) {
                    objc_enumerationMutation(v14);
                  }
                  [(ICCameraDevice *)self stitchMedia:v13 withMedia:*(void *)(*((void *)&v22 + 1) + 8 * v18++)];
                }
                while (v16 != v18);
                uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
              }
              while (v16);
            }

            ++v12;
          }
          while (v12 != v10);
          uint64_t v10 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
        }
        while (v10);
      }

      id v6 = v20;
    }
  }

  return 0;
}

- (void)blendMedia:(id)a3[10] ofLength:(int)a4 withMedia:(id)a5[10] ofLength:(int)a6
{
  if (a4 >= 1)
  {
    uint64_t v8 = 0;
    uint64_t v20 = a4;
    do
    {
      uint64_t v9 = a6;
      uint64_t v10 = a5;
      if (a6 >= 1)
      {
        do
        {
          id v11 = a3[v8];
          uint64_t v12 = [v11 mediaBase];
          size_t v13 = [v12 length];

          unint64_t v14 = [*v10 mediaBase];
          uint64_t v15 = [v14 length];

          if (v15 == v13)
          {
            id v16 = [v11 mediaBase];
            uint64_t v17 = (const char *)[v16 UTF8String];
            id v18 = [*v10 mediaBase];
            int v19 = strncmp(v17, (const char *)[v18 UTF8String], v13);

            if (!v19) {
              [(ICCameraDevice *)self stitchMedia:v11 withMedia:*v10];
            }
          }

          ++v10;
          --v9;
        }
        while (v9);
      }
      ++v8;
    }
    while (v8 != v20);
  }
}

- (void)grindMedia:(id)a3[10] index:(int *)a4 file:(id)a5
{
  id v8 = a5;
  uint64_t v9 = *a4;
  if ((int)v9 < 1)
  {
LABEL_7:
    a3[v9] = v8;
    ++*a4;
  }
  else
  {
    uint64_t v10 = 0;
    id v20 = v8;
    while (1)
    {
      id v11 = [v8 mediaBase];
      size_t v12 = [v11 length];

      size_t v13 = [a3[v10] mediaBase];
      uint64_t v14 = [v13 length];

      if (v14 == v12)
      {
        id v15 = [a3[v10] mediaBase];
        id v16 = (const char *)[v15 UTF8String];
        id v17 = [v20 mediaBase];
        int v18 = strncmp(v16, (const char *)[v17 UTF8String], v12);

        if (!v18)
        {
          int v19 = [(ICCameraDevice *)self ownerMedia:a3[v10] withMedia:v20];
          if (v19) {
            break;
          }
        }
      }
      ++v10;
      uint64_t v9 = *a4;
      id v8 = v20;
      if (v10 >= v9) {
        goto LABEL_7;
      }
    }
    a3[v10] = v19;

    id v8 = v20;
  }
}

- (id)relateMedia:(id)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(ICCameraDevice *)self legacyDevice]) {
    id v5 = @"mediaBase";
  }
  else {
    id v5 = @"relatedUUID";
  }
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:v5 ascending:1];
  v25[0] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  UInt8 v21 = v4;
  id v8 = [v4 sortedArrayUsingDescriptors:v7];
  uint64_t v9 = (void *)[v8 mutableCopy];

  if ([v9 count])
  {
    uint64_t v10 = (void *)*MEMORY[0x1E4F443C8];
    do
    {
      id v11 = [v9 objectAtIndexedSubscript:0];
      size_t v12 = [v11 UTI];
      size_t v13 = [v10 identifier];
      int v14 = [v12 isEqualToString:v13];

      if (!v14) {
        break;
      }
      [v9 removeObjectAtIndex:0];
    }
    while ([v9 count]);
  }
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v16 = (void *)[v9 copyGroupIntoDictionary:&__block_literal_global_7];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __30__ICCameraDevice_relateMedia___block_invoke_2;
  v22[3] = &unk_1E63D7D70;
  long long v23 = v5;
  id v17 = v15;
  id v24 = v17;
  [v16 enumerateKeysAndObjectsUsingBlock:v22];
  if ([(ICCameraDevice *)self legacyDevice]) {
    [(ICCameraDevice *)self relateLegacyMedia:v17];
  }
  else {
  int v18 = [(ICCameraDevice *)self relateGroupedMedia:v17];
  }
  [(ICCameraDevice *)self addCapability:@"ICCameraDeviceSupportsHEIF"];
  int v19 = [v18 objectForKeyedSubscript:@"newMedia"];

  return v19;
}

uint64_t __30__ICCameraDevice_relateMedia___block_invoke(uint64_t a1, void *a2)
{
  return [a2 valueForKey:@"parentID"];
}

void __30__ICCameraDevice_relateMedia___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __30__ICCameraDevice_relateMedia___block_invoke_3;
  v11[3] = &unk_1E63D7DB8;
  id v12 = *(id *)(a1 + 32);
  uint64_t v6 = [a3 copyGroupIntoDictionary:v11];
  if (v6)
  {
    id v7 = (void *)v6;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __30__ICCameraDevice_relateMedia___block_invoke_4;
    v8[3] = &unk_1E63D7DE0;
    id v9 = *(id *)(a1 + 40);
    id v10 = v5;
    [v7 enumerateKeysAndObjectsUsingBlock:v8];
  }
}

uint64_t __30__ICCameraDevice_relateMedia___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 valueForKey:*(void *)(a1 + 32)];
}

void __30__ICCameraDevice_relateMedia___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4 = NSString;
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void **)(a1 + 40);
  id v7 = a3;
  id v8 = a2;
  id v9 = [v4 stringWithFormat:@"%d%@", objc_msgSend(v6, "intValue"), v8];

  [v5 setObject:v7 forKeyedSubscript:v9];
}

- (void)setIsAccessRestrictedAppleDevice:(BOOL)a3
{
  id obj = self;
  objc_sync_enter(obj);
  obj->_accessRestrictedAppleDevice = a3;
  objc_sync_exit(obj);
}

- (BOOL)isAccessRestrictedAppleDevice
{
  v2 = self;
  objc_sync_enter(v2);
  if ([(ICDevice *)v2 isAppleDevice]) {
    BOOL v3 = ![(ICDevice *)v2 hasOpenSession] || v2->_accessRestrictedAppleDevice;
  }
  else {
    BOOL v3 = 0;
  }
  objc_sync_exit(v2);

  return v3;
}

- (void)updateAccessRestriction
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if ([(ICDevice *)self isAppleDevice]
    && (self->_devAccessRestriction != 8
     || [(ICCameraDevice *)self notifyDelegateRestrictionChanged]))
  {
    char v3 = [(ICCameraDevice *)self devAccessRestriction];
    char v4 = [(ICCameraDevice *)self devAccessRestriction];
    char v5 = [(ICCameraDevice *)self devAccessRestriction];
    char v6 = [(ICCameraDevice *)self devAccessRestriction];
    id v7 = [(ICDevice *)self delegate];

    if (v7)
    {
      if ((v3 & 8) != 0 || (v4 & 6) == 6 || (v5 & 3) == 3 || (v6 & 5) == 5)
      {
        [(ICCameraDevice *)self setDevAccessRestriction:8];
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __41__ICCameraDevice_updateAccessRestriction__block_invoke;
        v26[3] = &unk_1E63D72A8;
        v26[4] = self;
        ICPerformBlockOnMainThread(v26);
      }
      else
      {
        id v8 = [(ICDevice *)self delegate];
        id v9 = (objc_class *)objc_opt_class();
        id v10 = NSStringFromClass(v9);

        __ICOSLogCreate();
        id v11 = [(ICDevice *)self name];
        if ((unint64_t)[v11 length] >= 0x15)
        {
          id v12 = objc_msgSend(v11, "substringWithRange:", 0, 18);
          uint64_t v13 = [v12 stringByAppendingString:@".."];

          id v11 = (void *)v13;
        }
        int v14 = [NSString stringWithFormat:@"⛔️ Notifying Access Restricted: %@", v10];
        id v15 = (void *)_gICOSLog;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        {
          id v16 = v11;
          id v17 = v15;
          *(_DWORD *)buf = 136446466;
          uint64_t v28 = [v16 UTF8String];
          __int16 v29 = 2114;
          unint64_t v30 = v14;
          _os_log_impl(&dword_1BEEFF000, v17, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
        }
        [(ICCameraDevice *)self setDevAccessRestriction:0];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __41__ICCameraDevice_updateAccessRestriction__block_invoke_148;
        block[3] = &unk_1E63D72A8;
        block[4] = self;
        ICPerformBlockOnMainThread(block);
      }
    }
    else
    {
      [(ICCameraDevice *)self setNotifyDelegateRestrictionChanged:1];
      __ICOSLogCreate();
      int v18 = [(ICDevice *)self name];
      if ((unint64_t)[v18 length] >= 0x15)
      {
        int v19 = objc_msgSend(v18, "substringWithRange:", 0, 18);
        uint64_t v20 = [v19 stringByAppendingString:@".."];

        int v18 = (void *)v20;
      }
      UInt8 v21 = [NSString stringWithFormat:@"🟡 Queueing Access Restriction Changed: (delegate is nil)"];
      long long v22 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        id v23 = v18;
        id v24 = v22;
        *(_DWORD *)buf = 136446466;
        uint64_t v28 = [v23 UTF8String];
        __int16 v29 = 2114;
        unint64_t v30 = v21;
        _os_log_impl(&dword_1BEEFF000, v24, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }
    }
  }
}

void __41__ICCameraDevice_updateAccessRestriction__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) delegate];
  char v3 = (objc_class *)objc_opt_class();
  char v4 = NSStringFromClass(v3);

  __ICOSLogCreate();
  char v5 = [*(id *)(a1 + 32) name];
  if ((unint64_t)[v5 length] >= 0x15)
  {
    char v6 = objc_msgSend(v5, "substringWithRange:", 0, 18);
    uint64_t v7 = [v6 stringByAppendingString:@".."];

    char v5 = (void *)v7;
  }
  id v8 = [NSString stringWithFormat:@"✅ Notifying Access Unrestricted: %@", v4];
  id v9 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = v5;
    id v11 = v9;
    *(_DWORD *)buf = 136446466;
    uint64_t v14 = [v10 UTF8String];
    __int16 v15 = 2114;
    id v16 = v8;
    _os_log_impl(&dword_1BEEFF000, v11, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  [*(id *)(a1 + 32) willChangeValueForKey:@"isAccessRestrictedAppleDevice"];
  [*(id *)(a1 + 32) setIsAccessRestrictedAppleDevice:0];
  [*(id *)(a1 + 32) didChangeValueForKey:@"isAccessRestrictedAppleDevice"];
  [*(id *)(a1 + 32) updateLockedErrorStatus];
  id v12 = [*(id *)(a1 + 32) delegate];
  if (v12 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v12 performSelector:sel_cameraDeviceDidRemoveAccessRestriction_ withObject:*(void *)(a1 + 32)];
  }
}

uint64_t __41__ICCameraDevice_updateAccessRestriction__block_invoke_148(uint64_t a1)
{
  [*(id *)(a1 + 32) willChangeValueForKey:@"isAccessRestrictedAppleDevice"];
  [*(id *)(a1 + 32) setIsAccessRestrictedAppleDevice:1];
  [*(id *)(a1 + 32) didChangeValueForKey:@"isAccessRestrictedAppleDevice"];
  [*(id *)(a1 + 32) updateLockedErrorStatus];
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  if (v2)
  {
    char v4 = (void *)v2;
    if (objc_opt_respondsToSelector()) {
      [v4 performSelector:sel_cameraDeviceDidEnableAccessRestriction_ withObject:*(void *)(a1 + 32)];
    }
  }

  return MEMORY[0x1F41817F8]();
}

- (void)setAccessRestriction:(unint64_t)a3
{
  if ([(ICDevice *)self isAppleDevice])
  {
    if ((a3 & ~[(ICCameraDevice *)self devAccessRestriction]) != 0)
    {
      unint64_t devAccessRestriction = self->_devAccessRestriction;
      if (devAccessRestriction != 8)
      {
        self->_unint64_t devAccessRestriction = devAccessRestriction | a3;
        [(ICCameraDevice *)self updateAccessRestriction];
      }
    }
  }
}

- (id)remoteCamera
{
  devConnection = self->_devConnection;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__ICCameraDevice_remoteCamera__block_invoke;
  v5[3] = &unk_1E63D7280;
  v5[4] = self;
  char v3 = [(NSXPCConnection *)devConnection remoteObjectProxyWithErrorHandler:v5];

  return v3;
}

void __30__ICCameraDevice_remoteCamera__block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    __ICOSLogCreate();
    char v4 = @"remoteCamera";
    if ((unint64_t)[@"remoteCamera" length] >= 0x15)
    {
      char v5 = objc_msgSend(@"remoteCamera", "substringWithRange:", 0, 18);
      char v4 = [v5 stringByAppendingString:@".."];
    }
    char v6 = NSString;
    uint64_t v7 = [*(id *)(a1 + 32) name];
    id v8 = [v6 stringWithFormat:@"%@ - %@", v7, v3];

    id v9 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
      -[PTPObjectInfoDataset content:](v4, v9);
    }
  }
}

- (id)remoteCameraWithFailureBlock:(id)a3
{
  id v4 = a3;
  devConnection = self->_devConnection;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47__ICCameraDevice_remoteCameraWithFailureBlock___block_invoke;
  v10[3] = &unk_1E63D7E08;
  void v10[4] = self;
  char v6 = (void (**)(void))v4;
  id v11 = v6;
  uint64_t v7 = [(NSXPCConnection *)devConnection remoteObjectProxyWithErrorHandler:v10];
  id v8 = (void *)v7;
  if (v6 && !v7) {
    v6[2](v6);
  }

  return v8;
}

void __47__ICCameraDevice_remoteCameraWithFailureBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    __ICOSLogCreate();
    id v4 = @"remoteCamera";
    if ((unint64_t)[@"remoteCamera" length] >= 0x15)
    {
      char v5 = objc_msgSend(@"remoteCamera", "substringWithRange:", 0, 18);
      id v4 = [v5 stringByAppendingString:@".."];
    }
    char v6 = NSString;
    uint64_t v7 = [*(id *)(a1 + 32) name];
    id v8 = [v6 stringWithFormat:@"%@ - %@", v7, v3];

    id v9 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
      -[PTPObjectInfoDataset content:](v4, v9);
    }
  }
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(void))(v10 + 16))();
  }
}

- (ICMediaPresentation)mediaPresentation
{
  return self->_devMediaPresentation;
}

- (void)setMediaPresentation:(ICMediaPresentation)mediaPresentation
{
  char v5 = [(ICDevice *)self capabilities];
  if ([v5 containsObject:@"ICCameraDeviceSupportsHEIF"]) {
    BOOL v6 = [(ICDevice *)self hasOpenSession];
  }
  else {
    BOOL v6 = 0;
  }

  if (mediaPresentation - 1 > 1)
  {
    __ICOSLogCreate();
    uint64_t v7 = [NSString stringWithFormat:@"Camera device does not support changing the media presentation"];
    id v8 = _gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
      +[ICPrefManager defaultAuthManager];
    }
  }
  else if (self->_devMediaPresentation != mediaPresentation)
  {
    [(ICCameraDevice *)self willChangeValueForKey:@"mediaPresentation"];
    self->_devMediaPresentation = mediaPresentation;
    [(ICCameraDevice *)self didChangeValueForKey:@"mediaPresentation"];
    if (v6)
    {
      [(ICCameraDevice *)self updateMediaPresentation];
    }
  }
}

- (BOOL)updateMediaPresentation
{
  return 1;
}

- (void)resetAccessRestriction
{
  if ([(ICDevice *)self isAppleDevice])
  {
    [(ICCameraDevice *)self setDevAccessRestriction:0];
    if ([(ICDevice *)self hasOpenSession])
    {
      [(ICCameraDevice *)self updateAccessRestriction];
    }
  }
}

- (BOOL)isEnumeratingContent
{
  return self->_isEnumeratingContent;
}

- (NSString)buildVersion
{
  uint64_t v2 = [(ICCameraDevice *)self mobdevProperties];
  id v3 = [v2 objectForKeyedSubscript:@"BuildVersion"];

  return (NSString *)v3;
}

- (NSString)deviceClass
{
  uint64_t v2 = [(ICCameraDevice *)self mobdevProperties];
  id v3 = [v2 objectForKeyedSubscript:@"DeviceClass"];

  return (NSString *)v3;
}

- (NSString)deviceColor
{
  uint64_t v2 = [(ICCameraDevice *)self mobdevProperties];
  id v3 = [v2 objectForKeyedSubscript:@"DeviceColor"];

  return (NSString *)v3;
}

- (NSString)deviceEnclosureColor
{
  uint64_t v2 = [(ICCameraDevice *)self mobdevProperties];
  id v3 = [v2 objectForKeyedSubscript:@"DeviceEnclosureColor"];

  return (NSString *)v3;
}

- (NSNumber)devicePairedState
{
  uint64_t v2 = [(ICCameraDevice *)self mobdevProperties];
  id v3 = [v2 objectForKeyedSubscript:@"DevicePairedState"];

  return (NSNumber *)v3;
}

- (id)description
{
  id v3 = (void *)MEMORY[0x1E4F28E78];
  v10.receiver = self;
  v10.super_class = (Class)ICCameraDevice;
  id v4 = [(ICDevice *)&v10 description];
  char v5 = [v3 stringWithString:v4];

  [(ICCameraDevice *)self timeOffset];
  objc_msgSend(v5, "appendFormat:", @"  timeOffset                    : %f\n", v6);
  objc_msgSend(v5, "appendFormat:", @"  hasConfigurableWiFiInterface  : %s\n", "N/A");
  BOOL v7 = [(ICCameraDevice *)self isAccessRestrictedAppleDevice];
  id v8 = "NO";
  if (v7) {
    id v8 = "YES";
  }
  objc_msgSend(v5, "appendFormat:", @"  isAccessRestrictedAppleDevice : %s\n", v8);
  [v5 appendString:@"\n"];

  return v5;
}

- (OS_dispatch_queue)deviceNotificationQueue
{
  return self->_devNotificationQueue;
}

- (OS_dispatch_queue)deviceCommandQueue
{
  return self->_devCommandQueue;
}

- (OS_dispatch_queue)deviceWriteQueue
{
  return self->_devWriteQueue;
}

- (BOOL)iCloudPhotosEnabled
{
  return self->_iCloudPhotosEnabled;
}

- (void)setICloudPhotosEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  [(ICCameraDevice *)self willChangeValueForKey:@"iCloudPhotosEnabled"];
  self->_iCloudPhotosEnabled = v3;
  if (v3) {
    [(ICDevice *)self removeCapability:@"ICCameraDeviceCanDeleteOneFile"];
  }
  [(ICCameraDevice *)self didChangeValueForKey:@"iCloudPhotosEnabled"];

  [(ICCameraDevice *)self setLocked:v3];
}

- (unint64_t)iCloudPhotosOptimizeStorageState
{
  return self->_iCloudPhotosOptimizeStorageState;
}

- (void)setICloudPhotosOptimizeStorageState:(unint64_t)a3
{
  [(ICCameraDevice *)self willChangeValueForKey:@"iCloudPhotosOptimizeStorageState"];
  self->_iCloudPhotosOptimizeStorageState = a3;

  [(ICCameraDevice *)self didChangeValueForKey:@"iCloudPhotosOptimizeStorageState"];
}

- (void)addCapability:(id)a3
{
  id v4 = a3;
  if (![(ICCameraDevice *)self iCloudPhotosEnabled]
    || ([v4 isEqualToString:@"ICCameraDeviceCanDeleteOneFile"] & 1) == 0)
  {
    v5.receiver = self;
    v5.super_class = (Class)ICCameraDevice;
    [(ICDevice *)&v5 addCapability:v4];
  }
}

- (unint64_t)countOfObjects
{
  uint64_t v2 = [(ICCameraDevice *)self indexedMediaSet];
  unint64_t v3 = [v2 mediaItemCount];

  return v3;
}

- (NSUInteger)contentCatalogPercentCompleted
{
  return self->_devContentCatalogPercentCompleted;
}

- (void)updateMediaFilesCount:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:@"ICANumberOfPreflightObjectsKey"];
  objc_super v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 unsignedIntegerValue];
    if (v6 != [(ICCameraDevice *)self preflightCountOfObjects])
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __40__ICCameraDevice_updateMediaFilesCount___block_invoke;
      v7[3] = &unk_1E63D7E30;
      v7[4] = self;
      v7[5] = v6;
      ICPerformBlockOnMainThread(v7);
    }
  }
}

uint64_t __40__ICCameraDevice_updateMediaFilesCount___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) willChangeValueForKey:@"preflightCountOfObjects"];
  [*(id *)(a1 + 32) setPreflightCountOfObjects:*(void *)(a1 + 40)];
  __ICOSLogCreate();
  uint64_t v2 = @"                ◺◺◺◺";
  if ((unint64_t)[@"                ◺◺◺◺" length] >= 0x15)
  {
    unint64_t v3 = objc_msgSend(@"                ◺◺◺◺", "substringWithRange:", 0, 18);
    uint64_t v2 = [v3 stringByAppendingString:@".."];
  }
  id v4 = objc_msgSend(NSString, "stringWithFormat:", @"Preflighted: %ld", objc_msgSend(*(id *)(a1 + 32), "preflightCountOfObjects"));
  objc_super v5 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v2;
    BOOL v7 = v5;
    *(_DWORD *)buf = 136446466;
    uint64_t v10 = [(__CFString *)v6 UTF8String];
    __int16 v11 = 2114;
    id v12 = v4;
    _os_log_impl(&dword_1BEEFF000, v7, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  [*(id *)(a1 + 32) didChangeValueForKey:@"preflightCountOfObjects"];
  return [*(id *)(a1 + 32) updateContentCatalogPercentCompleted];
}

- (void)updateContentCatalogPercentCompleted
{
  if ([(ICCameraDevice *)self preflightCountOfObjects] == -1
    || [(ICCameraDevice *)self containsRestrictedStorage])
  {
    return;
  }
  if (![(ICCameraDevice *)self preflightCountOfObjects]
    && ![(ICCameraDevice *)self isAccessRestrictedAppleDevice])
  {
    goto LABEL_10;
  }
  if ([(ICCameraDevice *)self preflightCountOfObjects] >= 1
    && [(ICCameraDevice *)self countOfObjects])
  {
    unint64_t v3 = [(ICCameraDevice *)self countOfObjects];
    unint64_t v4 = [(ICCameraDevice *)self preflightCountOfObjects];
    unint64_t v5 = [(ICCameraDevice *)self countOfObjects];
    if (v3 <= v4)
    {
      double v6 = (double)v5 * 100.0 / (double)[(ICCameraDevice *)self preflightCountOfObjects];
LABEL_15:
      if (v6 > (double)[(ICCameraDevice *)self contentCatalogPercentCompleted])
      {
        [(ICCameraDevice *)self setContentCatalogPercentCompleted:(unint64_t)v6];
      }
      return;
    }
    [(ICCameraDevice *)self setPreflightCountOfObjects:v5];
LABEL_10:
    double v6 = 100.0;
    goto LABEL_15;
  }

  [(ICCameraDevice *)self contentCatalogPercentCompleted];
}

- (void)setContentCatalogPercentCompleted:(unint64_t)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ((a3 != 100 || [(ICDevice *)self ready])
    && self->_devContentCatalogPercentCompleted != 100
    && ![(ICCameraDevice *)self containsRestrictedStorage])
  {
    [(ICCameraDevice *)self willChangeValueForKey:@"contentCatalogPercentCompleted"];
    self->_devContentCatalogPercentCompleted = a3;
    [(ICCameraDevice *)self didChangeValueForKey:@"contentCatalogPercentCompleted"];
    __ICOSLogCreate();
    unint64_t v5 = [(ICDevice *)self name];
    if ((unint64_t)[v5 length] >= 0x15)
    {
      double v6 = objc_msgSend(v5, "substringWithRange:", 0, 18);
      uint64_t v7 = [v6 stringByAppendingString:@".."];

      unint64_t v5 = (void *)v7;
    }
    id v8 = objc_msgSend(NSString, "stringWithFormat:", @"(Enumerated:%lu/Preflighted:%ld)", -[ICCameraDevice countOfObjects](self, "countOfObjects"), -[ICCameraDevice preflightCountOfObjects](self, "preflightCountOfObjects"));
    id v9 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = v5;
      __int16 v11 = v9;
      *(_DWORD *)buf = 136446466;
      uint64_t v24 = [v10 UTF8String];
      __int16 v25 = 2114;
      long long v26 = v8;
      _os_log_impl(&dword_1BEEFF000, v11, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    if ([(ICDevice *)self ready]
      && [(ICCameraDevice *)self contentCatalogPercentCompleted] == 100)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __52__ICCameraDevice_setContentCatalogPercentCompleted___block_invoke;
      block[3] = &unk_1E63D72A8;
      block[4] = self;
      ICPerformBlockOnMainThread(block);
    }
    else
    {
      __ICOSLogCreate();
      id v12 = [(ICDevice *)self name];
      if ((unint64_t)[v12 length] >= 0x15)
      {
        uint64_t v13 = objc_msgSend(v12, "substringWithRange:", 0, 18);
        uint64_t v14 = [v13 stringByAppendingString:@".."];

        id v12 = (void *)v14;
      }
      __int16 v15 = NSString;
      if ([(ICDevice *)self ready]) {
        id v16 = "YES";
      }
      else {
        id v16 = "NO";
      }
      uint64_t v17 = [v15 stringWithFormat:@"Ready: %s, Percent:%lu%%", v16, -[ICCameraDevice contentCatalogPercentCompleted](self, "contentCatalogPercentCompleted")];
      int v18 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        id v19 = v12;
        uint64_t v20 = v18;
        uint64_t v21 = [v19 UTF8String];
        *(_DWORD *)buf = 136446466;
        uint64_t v24 = v21;
        __int16 v25 = 2114;
        long long v26 = v17;
        _os_log_impl(&dword_1BEEFF000, v20, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }
    }
  }
}

void __52__ICCameraDevice_setContentCatalogPercentCompleted___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  if (v2 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v2 performSelector:sel_deviceDidBecomeReadyWithCompleteContentCatalog_ withObject:*(void *)(a1 + 32) withObject:0];
  }
  __ICOSLogCreate();
  unint64_t v3 = [*(id *)(a1 + 32) name];
  if ((unint64_t)[v3 length] >= 0x15)
  {
    unint64_t v4 = objc_msgSend(v3, "substringWithRange:", 0, 18);
    uint64_t v5 = [v4 stringByAppendingString:@".."];

    unint64_t v3 = (void *)v5;
  }
  double v6 = NSString;
  uint64_t v7 = [*(id *)(a1 + 32) devMediaFiles];
  id v8 = objc_msgSend(v6, "stringWithFormat:", @"💯 Content Catalog Complete: %lu", objc_msgSend(v7, "count"));

  id v9 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = v3;
    __int16 v11 = v9;
    *(_DWORD *)buf = 136446466;
    uint64_t v21 = [v10 UTF8String];
    __int16 v22 = 2114;
    id v23 = v8;
    _os_log_impl(&dword_1BEEFF000, v11, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  if ([*(id *)(a1 + 32) previouslyIndexed])
  {
    __ICOSLogCreate();
    id v12 = [*(id *)(a1 + 32) name];
    if ((unint64_t)[v12 length] >= 0x15)
    {
      uint64_t v13 = objc_msgSend(v12, "substringWithRange:", 0, 18);
      uint64_t v14 = [v13 stringByAppendingString:@".."];

      id v12 = (void *)v14;
    }
    __int16 v15 = objc_msgSend(NSString, "stringWithFormat:", @"  Previously Indexed: %5lu", objc_msgSend(*(id *)(a1 + 32), "previouslyIndexed"));
    id v16 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = v12;
      int v18 = v16;
      uint64_t v19 = [v17 UTF8String];
      *(_DWORD *)buf = 136446466;
      uint64_t v21 = v19;
      __int16 v22 = 2114;
      id v23 = v15;
      _os_log_impl(&dword_1BEEFF000, v18, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
  }
}

- (id)cameraFolderWithObjectID:(unint64_t)a3
{
  unint64_t v3 = (void *)a3;
  if (a3)
  {
    unint64_t v4 = [(ICCameraDevice *)self indexedMediaSet];
    unint64_t v3 = [v4 mediaItemWithHandle:v3 inTypes:&unk_1F1A2C628];
  }

  return v3;
}

- (id)cameraFileWithObjectID:(unint64_t)a3
{
  unint64_t v3 = (void *)a3;
  if (a3)
  {
    unint64_t v4 = [(ICCameraDevice *)self indexedMediaSet];
    unint64_t v3 = [v4 mediaItemWithHandle:v3 inTypes:&unk_1F1A2C640];
  }

  return v3;
}

- (void)requestOpenSession
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  __ICOSLogCreate();
  unint64_t v3 = @"openSession";
  if ((unint64_t)[@"openSession" length] >= 0x15)
  {
    unint64_t v4 = objc_msgSend(@"openSession", "substringWithRange:", 0, 18);
    unint64_t v3 = [v4 stringByAppendingString:@".."];
  }
  uint64_t v5 = NSString;
  double v6 = [(ICDevice *)self name];
  uint64_t v7 = [v5 stringWithFormat:@"requestOpenSession: %@", v6];

  id v8 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v3;
    id v10 = v8;
    *(_DWORD *)buf = 136446466;
    uint64_t v13 = [(__CFString *)v9 UTF8String];
    __int16 v14 = 2114;
    __int16 v15 = v7;
    _os_log_impl(&dword_1BEEFF000, v10, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __36__ICCameraDevice_requestOpenSession__block_invoke;
  v11[3] = &unk_1E63D7280;
  void v11[4] = self;
  [(ICCameraDevice *)self requestOpenSessionWithOptions:MEMORY[0x1E4F1CC08] completion:v11];
}

void __36__ICCameraDevice_requestOpenSession__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = [*(id *)(a1 + 32) delegate];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__ICCameraDevice_requestOpenSession__block_invoke_2;
  block[3] = &unk_1E63D7700;
  uint64_t v5 = *(void *)(a1 + 32);
  id v9 = v4;
  uint64_t v10 = v5;
  id v11 = v3;
  id v6 = v3;
  id v7 = v4;
  ICPerformBlockOnMainThread(block);
}

uint64_t __36__ICCameraDevice_requestOpenSession__block_invoke_2(uint64_t *a1)
{
  uint64_t result = a1[4];
  if (result)
  {
    uint64_t result = objc_opt_respondsToSelector();
    if (result) {
      uint64_t result = [(id)a1[4] performSelector:sel_device_didOpenSessionWithError_ withObject:a1[5] withObject:a1[6]];
    }
  }
  if (a1[6])
  {
    uint64_t result = objc_opt_respondsToSelector();
    if (result)
    {
      id v3 = (void *)a1[4];
      uint64_t v4 = a1[5];
      uint64_t v5 = a1[6];
      return [v3 performSelector:sel_device_didEncounterError_ withObject:v4 withObject:v5];
    }
  }
  return result;
}

- (void)requestOpenSessionWithOptions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  if (v6)
  {
    id v8 = [v6 objectForKeyedSubscript:@"ICEnumerationChronologicalOrder"];
    self->_enumerationOrder = (int)[v8 intValue];
  }
  if ([(ICDevice *)self hasOpenSession])
  {
    v7[2](v7, 0);
  }
  else if ([(ICDevice *)self hasOpenSession] || [(ICCameraDevice *)self beingEjected])
  {
    id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.ImageCaptureCore" code:-9927 userInfo:0];
    ((void (**)(id, void *))v7)[2](v7, v9);
  }
  else
  {
    [(ICDevice *)self setSessionState:0];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __59__ICCameraDevice_requestOpenSessionWithOptions_completion___block_invoke;
    v10[3] = &unk_1E63D7750;
    void v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    [(ICCameraDevice *)self dispatchAsyncForOperationType:0 block:v10];
  }
}

void __59__ICCameraDevice_requestOpenSessionWithOptions_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setDevContentCatalogPercentCompleted:0];
  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
  id v3 = v2;
  if (*(void *)(a1 + 40)) {
    objc_msgSend(v2, "addEntriesFromDictionary:");
  }
  uint64_t v4 = [*(id *)(a1 + 32) deviceManager];
  uint64_t v5 = *(void *)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__ICCameraDevice_requestOpenSessionWithOptions_completion___block_invoke_2;
  v6[3] = &unk_1E63D7E58;
  v6[4] = v5;
  id v7 = *(id *)(a1 + 48);
  [v4 openSession:v5 withOptions:v3 completion:v6];
}

uint64_t __59__ICCameraDevice_requestOpenSessionWithOptions_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = [a3 objectForKeyedSubscript:@"errCode"];
  int v5 = [v4 intValue];

  if (v5 == -21347)
  {
    ICMakeLocalizedErrorWithCodeAndString(-21347, @"ICReturnConnectionSessionAlreadyOpen");
    objc_claimAutoreleasedReturnValue();
  }
  else if (v5)
  {
    if (v5 == -9943)
    {
      id v6 = [MEMORY[0x1E4F1CA60] dictionary];
      id v7 = NSString;
      id v8 = ICLocalizedString(@"ICReturnDeviceUnlockRequest");
      id v9 = [*(id *)(a1 + 32) name];
      uint64_t v10 = objc_msgSend(v7, "stringWithFormat:", v8, v9);

      if (v10) {
        [v6 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F28568]];
      }
      if ([*(id *)(a1 + 32) devAccessRestriction] != 8)
      {
        [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.ImageCaptureCore" code:-9943 userInfo:v6];
        objc_claimAutoreleasedReturnValue();
      }
      [*(id *)(a1 + 32) setSessionState:1];
    }
    else
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.ImageCaptureCore" code:v5 userInfo:0];
      objc_claimAutoreleasedReturnValue();
      [*(id *)(a1 + 32) setSessionState:-1];
    }
  }
  else
  {
    [*(id *)(a1 + 32) setSessionState:1];
  }
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(void))(v11 + 16))();
  }

  return MEMORY[0x1F41817F8]();
}

- (void)requestEnumerateContentWithOptions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [v6 objectForKeyedSubscript:@"ICEnumerationChronologicalOrder"];
    self->_enumerationOrder = (int)[v8 intValue];
  }
  if ([(ICDevice *)self hasOpenSession])
  {
    if ([(ICCameraDevice *)self beingEjected])
    {
      id v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v10 = -9922;
    }
    else
    {
      if (!self->_devContentCatalogPercentCompleted)
      {
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __64__ICCameraDevice_requestEnumerateContentWithOptions_completion___block_invoke;
        v12[3] = &unk_1E63D7750;
        id v13 = v6;
        __int16 v14 = self;
        id v15 = v7;
        [(ICCameraDevice *)self dispatchAsyncForOperationType:0 block:v12];

        goto LABEL_10;
      }
      id v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v10 = -9954;
    }
  }
  else
  {
    id v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = -9958;
  }
  uint64_t v11 = [v9 errorWithDomain:@"com.apple.ImageCaptureCore" code:v10 userInfo:0];
  (*((void (**)(id, void *))v7 + 2))(v7, v11);

LABEL_10:
}

void __64__ICCameraDevice_requestEnumerateContentWithOptions_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
  id v3 = v2;
  if (*(void *)(a1 + 32)) {
    objc_msgSend(v2, "addEntriesFromDictionary:");
  }
  uint64_t v4 = [*(id *)(a1 + 40) deviceManager];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__ICCameraDevice_requestEnumerateContentWithOptions_completion___block_invoke_2;
  v6[3] = &unk_1E63D7E80;
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  [v4 enumerateContent:v5 withOptions:v3 completion:v6];
}

uint64_t __64__ICCameraDevice_requestEnumerateContentWithOptions_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)addCameraFolderToIndex:(id)a3
{
  id v4 = a3;
  id v5 = [(ICCameraDevice *)self indexedMediaSet];
  [v5 addMediaItemToIndex:v4];
}

- (void)removeCameraFolderFromIndex:(id)a3
{
  id v4 = a3;
  id v5 = [(ICCameraDevice *)self indexedMediaSet];
  [v5 removeMediaItemFromIndex:v4];
}

- (void)addCameraFileToIndex:(id)a3
{
  id v4 = a3;
  id v5 = [(ICCameraDevice *)self indexedMediaSet];
  [v5 addMediaItemToIndex:v4];
}

- (void)removeCameraFileFromIndex:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v5 addObject:v4];
      if ([v4 twinID])
      {
        uint64_t v6 = -[ICCameraDevice cameraFileWithObjectID:](self, "cameraFileWithObjectID:", [v4 twinID]);
        if (v6)
        {
          id v7 = (void *)v6;
          [v5 addObject:v6];
        }
      }
      os_unfair_lock_t lock = &self->_mediaLock;
      os_unfair_lock_lock(&self->_mediaLock);
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      uint64_t v20 = v5;
      id v8 = v5;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = 0;
        uint64_t v12 = *(void *)v22;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v22 != v12) {
              objc_enumerationMutation(v8);
            }
            __int16 v14 = *(void **)(*((void *)&v21 + 1) + 8 * v13);
            id v15 = objc_msgSend(v4, "sidecarFiles", lock);
            uint64_t v16 = v15;
            if (v15 && [v15 count])
            {
              v11 += [v16 count];
              id v17 = [(ICCameraDevice *)self indexedMediaSet];
              [v17 removeMediaItemsFromIndex:v16];
            }
            v11 += [v14 universalFamily];
            int v18 = [(ICCameraDevice *)self indexedMediaSet];
            [v18 removeMediaItemFromIndex:v14];

            [(ICCameraDevice *)self addNumberOfDownloadableItems:-v11];
            ++v13;
          }
          while (v10 != v13);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v10);
      }

      os_unfair_lock_unlock(lock);
      id v5 = v20;
    }
  }
}

- (BOOL)supportsMediaFormatCatalog
{
  id v3 = [(ICDevice *)self transportType];
  BOOL v4 = ([v3 isEqualToString:@"ICTransportTypeMassStorage"] & 1) == 0
    && [(ICCameraDevice *)self appleRelatedUUIDSupport] != 0;

  return v4;
}

- (void)setAppleRelatedUUIDSupport:(unint64_t)a3
{
  if ([(ICCameraDevice *)self appleRelatedUUIDSupport] != a3
    && (a3 == 2 || a3 == 1)
    && ![(ICCameraDevice *)self appleRelatedUUIDSupport])
  {
    self->_appleRelatedUUIDSupport = a3;
  }
}

- (unint64_t)appleRelatedUUIDSupport
{
  return self->_appleRelatedUUIDSupport;
}

- (BOOL)legacyDevice
{
  id v3 = [(ICDevice *)self transportType];
  BOOL v4 = ([v3 isEqualToString:@"ICTransportTypeMassStorage"] & 1) != 0
    || [(ICCameraDevice *)self appleRelatedUUIDSupport] != 1;

  return v4;
}

- (void)addItems:(id)a3
{
  id v4 = a3;
  if ([(ICDevice *)self hasOpenSession])
  {
    if (v4)
    {
      id v5 = (void *)[v4 count];
      if (v5)
      {
        id v5 = [(ICCameraDevice *)self relateMedia:v4];
      }
    }
    else
    {
      id v5 = 0;
    }
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __27__ICCameraDevice_addItems___block_invoke;
    v7[3] = &unk_1E63D72D0;
    id v8 = v5;
    uint64_t v9 = self;
    id v6 = v5;
    ICPerformBlockOnMainThread(v7);
  }
}

uint64_t __27__ICCameraDevice_addItems___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    objc_msgSend(*(id *)(a1 + 40), "addMediaFiles:");
  }
  uint64_t v2 = *(void **)(a1 + 40);

  return [v2 updateContentCatalogPercentCompleted];
}

- (NSArray)contents
{
  p_mediaLock = &self->_mediaLock;
  os_unfair_lock_lock(&self->_mediaLock);
  id v4 = [MEMORY[0x1E4F1C978] arrayWithArray:self->_devContents];
  os_unfair_lock_unlock(p_mediaLock);

  return (NSArray *)v4;
}

- (NSArray)mediaFiles
{
  p_mediaLock = &self->_mediaLock;
  os_unfair_lock_lock(&self->_mediaLock);
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = [(ICCameraDevice *)self devMediaFiles];
  id v6 = [v4 arrayWithArray:v5];

  os_unfair_lock_unlock(p_mediaLock);

  return (NSArray *)v6;
}

- (NSArray)filesOfType:(NSString *)fileUTType
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = fileUTType;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = self->_devContents;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(v5, "addItemsMatchingType:fromFolder:", v4, *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  if (![v5 count])
  {

    id v5 = 0;
  }

  return (NSArray *)v5;
}

- (void)addNumberOfDownloadableItems:(int64_t)a3
{
  self->_mediaObjectCount += a3;
}

- (unint64_t)numberOfDownloadableItems
{
  return self->_mediaObjectCount;
}

- (unint64_t)estimatedNumberOfDownloadableItems
{
  return self->_mediaObjectCount;
}

- (BOOL)containsRestrictedStorage
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (![(ICDevice *)self isAppleDevice]) {
    return 0;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = self->_devContents;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v13;
LABEL_4:
    uint64_t v8 = 0;
    v6 += v5;
    while (1)
    {
      if (*(void *)v13 != v7) {
        objc_enumerationMutation(v3);
      }
      uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v8), "name", (void)v12);
      char v10 = [v9 isEqualToString:@"0xFEEDFACE"];

      if (v10) {
        break;
      }
      if (v5 == ++v8)
      {
        uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v5) {
          goto LABEL_4;
        }

        return !v6;
      }
    }
  }

  return 1;
}

- (void)storageAvailable
{
  if (![(ICCameraDevice *)self containsRestrictedStorage])
  {
    [(ICCameraDevice *)self setAccessRestriction:5];
  }
}

- (BOOL)addMediaFiles:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && [v4 count])
  {
    [(ICCameraDevice *)self willChangeValueForKey:@"mediaFiles"];
    [(ICCameraDevice *)self willChangeValueForKey:@"contents"];
    uint64_t v6 = [(ICCameraDevice *)self devMediaFiles];
    [v6 addObjectsFromArray:v5];

    uint64_t v7 = [(ICDevice *)self delegate];
    char v8 = objc_opt_respondsToSelector();
    int v9 = objc_opt_respondsToSelector();
    if (v7 && (v8 & 1) != 0)
    {
      [v7 performSelector:sel_cameraDevice_didAddItems_ withObject:self withObject:v5];
    }
    else if (v7)
    {
      if (((v9 ^ 1) & 1) == 0)
      {
        uint64_t v10 = [v5 count];
        if (v10)
        {
          uint64_t v11 = v10;
          for (uint64_t i = 0; i != v11; ++i)
          {
            long long v13 = [v5 objectAtIndexedSubscript:i];
            [v7 performSelector:sel_cameraDevice_didAddItem_ withObject:self withObject:v13];
          }
        }
      }
    }
    [(ICCameraDevice *)self didChangeValueForKey:@"contents"];
    [(ICCameraDevice *)self didChangeValueForKey:@"mediaFiles"];
  }
  return 0;
}

- (void)handleStatusNotification:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"ICDeviceStatus"];
  if ([v5 isEqualToString:@"ICDeviceIsReady"])
  {
    uint64_t v6 = [(ICCameraDevice *)self deviceNotificationQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__ICCameraDevice_handleStatusNotification___block_invoke;
    block[3] = &unk_1E63D72D0;
    void block[4] = self;
    id v31 = v4;
    dispatch_async(v6, block);
  }
  else if ([v5 isEqualToString:@"ICAppleDeviceUnlocked"])
  {
    __ICOSLogCreate();
    uint64_t v7 = [(ICDevice *)self name];
    if ((unint64_t)[v7 length] >= 0x15)
    {
      char v8 = objc_msgSend(v7, "substringWithRange:", 0, 18);
      uint64_t v9 = [v8 stringByAppendingString:@".."];

      uint64_t v7 = (void *)v9;
    }
    uint64_t v10 = [NSString stringWithFormat:@"🔓 Device Is Unlocked"];
    uint64_t v11 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = v7;
      long long v13 = v11;
      *(_DWORD *)buf = 136446466;
      uint64_t v33 = [v12 UTF8String];
      __int16 v34 = 2114;
      v35 = v10;
      _os_log_impl(&dword_1BEEFF000, v13, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    [(ICCameraDevice *)self setAccessRestriction:6];
  }
  else if ([v5 isEqualToString:@"ICDeviceIsEnumerating"])
  {
    int isEnumeratingContent = self->_isEnumeratingContent;
    long long v15 = [v4 objectForKeyedSubscript:@"deviceIsEnumerating"];
    int v16 = [v15 BOOLValue];

    if (isEnumeratingContent != v16)
    {
      uint64_t v17 = [v4 objectForKeyedSubscript:@"deviceIsEnumerating"];
      int v18 = [v17 BOOLValue];

      if (v18) {
        [(ICCameraDevice *)self setAccessRestriction:6];
      }
      __ICOSLogCreate();
      uint64_t v19 = [(ICDevice *)self name];
      if ((unint64_t)[v19 length] >= 0x15)
      {
        uint64_t v20 = objc_msgSend(v19, "substringWithRange:", 0, 18);
        uint64_t v21 = [v20 stringByAppendingString:@".."];

        uint64_t v19 = (void *)v21;
      }
      long long v22 = NSString;
      long long v23 = [v4 objectForKeyedSubscript:@"deviceIsEnumerating"];
      int v24 = [v23 BOOLValue];
      __int16 v25 = @"NO";
      if (v24) {
        __int16 v25 = @"YES";
      }
      uint64_t v26 = [v22 stringWithFormat:@"♻️ Device Is Enumerating: %@", v25];

      uint64_t v27 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        id v28 = v19;
        __int16 v29 = v27;
        *(_DWORD *)buf = 136446466;
        uint64_t v33 = [v28 UTF8String];
        __int16 v34 = 2114;
        v35 = v26;
        _os_log_impl(&dword_1BEEFF000, v29, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }
      [(ICCameraDevice *)self willChangeValueForKey:@"isEnumeratingContent"];
      self->_int isEnumeratingContent = v18;
      [(ICCameraDevice *)self updateEnumeratingErrorStatus];
      [(ICCameraDevice *)self didChangeValueForKey:@"isEnumeratingContent"];
    }
  }
}

void __43__ICCameraDevice_handleStatusNotification___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__ICCameraDevice_handleStatusNotification___block_invoke_2;
  block[3] = &unk_1E63D7700;
  id v3 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v6 = v2;
  id v7 = v3;
  id v4 = v2;
  ICPerformBlockOnMainThread(block);
}

uint64_t __43__ICCameraDevice_handleStatusNotification___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 32) ready] & 1) != 0
    || ![*(id *)(a1 + 32) hasOpenSession])
  {
    uint64_t v10 = *(void **)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 48);
    return [v10 updateMediaFilesCount:v11];
  }
  else
  {
    [*(id *)(a1 + 32) setReady:1];
    __ICOSLogCreate();
    uint64_t v2 = [*(id *)(a1 + 32) name];
    if ((unint64_t)[v2 length] >= 0x15)
    {
      id v3 = objc_msgSend(v2, "substringWithRange:", 0, 18);
      uint64_t v4 = [v3 stringByAppendingString:@".."];

      uint64_t v2 = (void *)v4;
    }
    uint64_t v5 = [NSString stringWithFormat:@"🏁 Device Did Become Ready"];
    id v6 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = v2;
      char v8 = v6;
      int v12 = 136446466;
      uint64_t v13 = [v7 UTF8String];
      __int16 v14 = 2114;
      long long v15 = v5;
      _os_log_impl(&dword_1BEEFF000, v8, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v12, 0x16u);
    }
    if (*(void *)(a1 + 40))
    {
      if (objc_opt_respondsToSelector()) {
        [*(id *)(a1 + 40) performSelector:sel_deviceDidBecomeReady_ withObject:*(void *)(a1 + 32)];
      }
    }
    return [*(id *)(a1 + 32) updateMediaFilesCount:*(void *)(a1 + 48)];
  }
}

- (void)updateLockedErrorStatus
{
  if ([(ICDevice *)self isAppleDevice])
  {
    id v3 = [(ICDevice *)self delegate];
    if ([(ICCameraDevice *)self devAccessRestriction] == 8)
    {
      uint64_t v4 = 0;
    }
    else
    {
      uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
      id v6 = NSString;
      id v7 = ICLocalizedString(@"ICReturnDeviceUnlockRequest");
      char v8 = [(ICDevice *)self name];
      uint64_t v9 = objc_msgSend(v6, "stringWithFormat:", v7, v8);

      if (v9) {
        [v5 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F28568]];
      }
      uint64_t v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.ImageCaptureCore" code:-9943 userInfo:v5];
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__ICCameraDevice_updateLockedErrorStatus__block_invoke;
    block[3] = &unk_1E63D7700;
    id v13 = v3;
    __int16 v14 = self;
    id v15 = v4;
    id v10 = v4;
    id v11 = v3;
    ICPerformBlockOnMainThread(block);
  }
}

uint64_t __41__ICCameraDevice_updateLockedErrorStatus__block_invoke(void *a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    id v3 = (void *)a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    return [v3 performSelector:sel_device_didEncounterError_ withObject:v4 withObject:v5];
  }
  return result;
}

- (void)updateEnumeratingErrorStatus
{
  if ([(ICDevice *)self isAppleDevice]
    && ![(ICCameraDevice *)self isAccessRestrictedAppleDevice])
  {
    id v3 = [(ICDevice *)self delegate];
    if (self->_isEnumeratingContent)
    {
      uint64_t v4 = [(ICDevice *)self name];
      uint64_t v5 = ICMakeFormattedLocalizedError(-9954, v4);
    }
    else
    {
      uint64_t v5 = 0;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__ICCameraDevice_updateEnumeratingErrorStatus__block_invoke;
    block[3] = &unk_1E63D7700;
    id v9 = v3;
    id v10 = self;
    id v11 = v5;
    id v6 = v5;
    id v7 = v3;
    ICPerformBlockOnMainThread(block);
  }
}

uint64_t __46__ICCameraDevice_updateEnumeratingErrorStatus__block_invoke(void *a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    id v3 = (void *)a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    return [v3 performSelector:sel_device_didEncounterError_ withObject:v4 withObject:v5];
  }
  return result;
}

- (void)removeItems:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  __int16 v14 = [MEMORY[0x1E4F1CA48] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = -[ICCameraDevice cameraFileWithObjectID:](self, "cameraFileWithObjectID:", objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v8), "integerValue", v14));
        id v10 = v9;
        if (v9)
        {
          id v11 = [v9 parentFolder];
          if (v11)
          {
            id v12 = v10;
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [(ICCameraDevice *)self willChangeValueForKey:@"contents"];
              [(ICCameraDevice *)self willChangeValueForKey:@"mediaFiles"];
              [v11 deleteItem:v12];
              [(ICCameraDevice *)self removeCameraFileFromIndex:v12];
              os_unfair_lock_lock(&self->_mediaLock);
              [(NSMutableArray *)self->_devMediaFiles removeObject:v12];
              os_unfair_lock_unlock(&self->_mediaLock);
              [(ICCameraDevice *)self didChangeValueForKey:@"contents"];
              [(ICCameraDevice *)self didChangeValueForKey:@"mediaFiles"];
            }
            else
            {
              os_unfair_lock_lock(&self->_mediaLock);
              [(ICCameraDevice *)self willChangeValueForKey:@"contents"];
              [(ICCameraDevice *)self willChangeValueForKey:@"mediaFiles"];
              [v11 deleteItem:v12];
              [(ICCameraDevice *)self removeCameraFolderFromIndex:v12];
              [(ICCameraDevice *)self didChangeValueForKey:@"contents"];
              [(ICCameraDevice *)self didChangeValueForKey:@"mediaFiles"];
              os_unfair_lock_unlock(&self->_mediaLock);
            }
            [v14 addObject:v12];
          }
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__ICCameraDevice_removeItems___block_invoke;
  block[3] = &unk_1E63D72D0;
  void block[4] = self;
  id v17 = v14;
  id v13 = v14;
  ICPerformBlockOnMainThread(block);
}

uint64_t __30__ICCameraDevice_removeItems___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  if ([*(id *)(a1 + 40) count]) {
    BOOL v2 = v4 == 0;
  }
  else {
    BOOL v2 = 1;
  }
  if (!v2 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v4 performSelector:sel_cameraDevice_didRemoveItems_ withObject:*(void *)(a1 + 32) withObject:*(void *)(a1 + 40)];
  }

  return MEMORY[0x1F41817F8]();
}

- (void)requestCloseSession
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __37__ICCameraDevice_requestCloseSession__block_invoke;
  v2[3] = &unk_1E63D7280;
  v2[4] = self;
  [(ICCameraDevice *)self requestCloseSessionWithOptions:0 completion:v2];
}

void __37__ICCameraDevice_requestCloseSession__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__ICCameraDevice_requestCloseSession__block_invoke_2;
  v5[3] = &unk_1E63D72D0;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  ICPerformBlockOnMainThread(v5);
}

uint64_t __37__ICCameraDevice_requestCloseSession__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  if (v2)
  {
    id v4 = (void *)v2;
    if (objc_opt_respondsToSelector()) {
      [v4 performSelector:sel_device_didCloseSessionWithError_ withObject:*(void *)(a1 + 32) withObject:*(void *)(a1 + 40)];
    }
  }

  return MEMORY[0x1F41817F8]();
}

- (void)requestCloseSessionWithOptions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(ICDevice *)self sessionState] == 1)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __60__ICCameraDevice_requestCloseSessionWithOptions_completion___block_invoke;
    v9[3] = &unk_1E63D7750;
    id v10 = v6;
    id v11 = self;
    id v12 = v7;
    [(ICCameraDevice *)self dispatchAsyncForOperationType:1 block:v9];
  }
  else
  {
    uint64_t v8 = ICMakeLocalizedError(-9958);
    (*((void (**)(id, void *))v7 + 2))(v7, v8);
  }
}

void __60__ICCameraDevice_requestCloseSessionWithOptions_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
  id v3 = v2;
  if (*(void *)(a1 + 32)) {
    objc_msgSend(v2, "addEntriesFromDictionary:");
  }
  id v4 = [*(id *)(a1 + 40) deviceManager];
  uint64_t v5 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__ICCameraDevice_requestCloseSessionWithOptions_completion___block_invoke_2;
  v6[3] = &unk_1E63D7E58;
  void v6[4] = v5;
  id v7 = *(id *)(a1 + 48);
  [v4 closeSession:v5 withOptions:v3 completion:v6];
}

uint64_t __60__ICCameraDevice_requestCloseSessionWithOptions_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 objectForKeyedSubscript:@"errCode"];
  int v5 = [v4 intValue];

  if (v5)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.ImageCaptureCore" code:v5 userInfo:0];
    objc_claimAutoreleasedReturnValue();
  }
  [*(id *)(a1 + 32) willChangeValueForKey:@"hasOpenSession"];
  [*(id *)(a1 + 32) setSessionState:-1];
  [*(id *)(a1 + 32) didChangeValueForKey:@"hasOpenSession"];
  [*(id *)(a1 + 32) willChangeValueForKey:@"contents"];
  id v6 = [*(id *)(a1 + 32) devContents];
  [v6 removeAllObjects];

  [*(id *)(a1 + 32) didChangeValueForKey:@"contents"];
  [*(id *)(a1 + 32) lockMedia];
  [*(id *)(a1 + 32) willChangeValueForKey:@"mediaFiles"];
  id v7 = [*(id *)(a1 + 32) devMediaFiles];
  [v7 removeAllObjects];

  [*(id *)(a1 + 32) didChangeValueForKey:@"mediaFiles"];
  [*(id *)(a1 + 32) unlockMedia];
  [*(id *)(a1 + 32) lockMedia];
  uint64_t v8 = [*(id *)(a1 + 32) indexedMediaSet];
  [v8 removeAllItems];

  [*(id *)(a1 + 32) resetAccessRestriction];
  [*(id *)(a1 + 32) setDevContentCatalogPercentCompleted:0];
  [*(id *)(a1 + 32) setPreflightCountOfObjects:-1];
  [*(id *)(a1 + 32) setMediaObjectCount:0];
  [*(id *)(a1 + 32) setPreviouslyIndexed:0];
  [*(id *)(a1 + 32) setReady:0];
  [*(id *)(a1 + 32) unlockMedia];
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(void))(v9 + 16))();
  }

  return MEMORY[0x1F41817F8]();
}

- (void)lockMedia
{
}

- (void)unlockMedia
{
}

- (void)handlePtpEvent:(id)a3
{
  id v7 = a3;
  id v4 = [(ICDevice *)self delegate];
  if (v7)
  {
    int v5 = [(ICCameraDevice *)self ptpEventHandler];

    if (v5)
    {
      id v6 = [(ICCameraDevice *)self ptpEventHandler];
      ((void (**)(void, id))v6)[2](v6, v7);
    }
    else if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      [v4 performSelector:sel_cameraDevice_didReceivePTPEvent_ withObject:self withObject:v7];
    }
  }
}

- (void)setPtpEventHandler:(void *)ptpEventHandler
{
  id v6 = ptpEventHandler;
  if (v6)
  {
    [(ICCameraDevice *)self setPtpEventForwarding:1];
    id v4 = (void *)MEMORY[0x1C18A01C0](v6);
    id v5 = self->_ptpEventHandler;
    self->_ptpEventHandler = v4;
  }
  else
  {
    id v5 = self->_ptpEventHandler;
    self->_ptpEventHandler = 0;
  }
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)ICCameraDevice;
  [(ICDevice *)&v5 setDelegate:v4];
  if (v4)
  {
    if (objc_opt_respondsToSelector()) {
      [(ICCameraDevice *)self setPtpEventForwarding:1];
    }
    if ([(ICCameraDevice *)self notifyDelegateRestrictionChanged]) {
      [(ICCameraDevice *)self updateAccessRestriction];
    }
  }
}

- (void)requestSyncClock
{
  if ([(ICDevice *)self hasOpenSession]
    && [(ICCameraDevice *)self allowsSyncingClock])
  {
    id v3 = [(ICDevice *)self deviceManager];
    [v3 syncClock:self completion:&__block_literal_global_322];
  }
}

void __34__ICCameraDevice_requestSyncClock__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_super v5 = [a3 objectForKeyedSubscript:@"errCode"];
  uint64_t v6 = [v5 intValue];

  if (v6)
  {
    __ICOSLogCreate();
    id v7 = NSString;
    uint64_t v8 = [v4 name];
    uint64_t v9 = [v7 stringWithFormat:@"%@ - Sync Clock: %d", v8, v6];

    uint64_t v10 = __ICLogTypeEnabled(2);
    id v11 = _gICOSLog;
    if (v10)
    {
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v13 = v9;
        _os_log_impl(&dword_1BEEFF000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEBUG))
    {
      -[ICCameraDeviceBrowser handleImageCaptureEventNotification:]((uint64_t)v9, v11);
    }
  }
}

- (void)dispatchAsyncForOperationType:(int64_t)a3 block:(id)a4
{
  objc_super v5 = objc_msgSend(a4, "copy", a3);
  devCommandQueue = self->_devCommandQueue;
  bos_unfair_lock_t lock = v5;
  if (devCommandQueue)
  {
    dispatch_async(devCommandQueue, v5);
  }
  else
  {
    id v7 = dispatch_get_global_queue(25, 0);
    dispatch_async(v7, block);
  }
}

- (void)requestDeleteFiles:(NSArray *)files
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__ICCameraDevice_requestDeleteFiles___block_invoke_2;
  v4[3] = &unk_1E63D7EE8;
  v4[4] = self;
  id v3 = [(ICCameraDevice *)self requestDeleteFiles:files deleteFailed:&__block_literal_global_328 completion:v4];
}

void __37__ICCameraDevice_requestDeleteFiles___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__ICCameraDevice_requestDeleteFiles___block_invoke_3;
  v6[3] = &unk_1E63D72D0;
  void v6[4] = *(void *)(a1 + 32);
  id v7 = v4;
  id v5 = v4;
  ICPerformBlockOnMainThread(v6);
}

void __37__ICCameraDevice_requestDeleteFiles___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 performSelector:sel_cameraDevice_didCompleteDeleteFilesWithError_ withObject:*(void *)(a1 + 32) withObject:*(void *)(a1 + 40)];
  }
}

- (NSProgress)requestDeleteFiles:(NSArray *)files deleteFailed:(void *)deleteFailed completion:(void *)completion
{
  uint64_t v8 = files;
  uint64_t v9 = deleteFailed;
  uint64_t v10 = completion;
  if (![(ICDevice *)self hasOpenSession]
    || [(ICCameraDevice *)self beingEjected]
    || [(ICCameraDevice *)self isLocked]
    || ![(NSArray *)v8 count])
  {
    id v13 = ICMakeLocalizedError(-9941);
    v10[2](v10, MEMORY[0x1E4F1CC08], v13);

    id v12 = 0;
  }
  else
  {
    id v11 = objc_msgSend(MEMORY[0x1E4F28F90], "progressWithTotalUnitCount:", -[NSArray count](v8, "count"));
    [v11 setCancellable:1];
    [v11 setPausable:0];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __61__ICCameraDevice_requestDeleteFiles_deleteFailed_completion___block_invoke;
    v15[3] = &unk_1E63D7F60;
    v15[4] = self;
    id v12 = v11;
    id v16 = v12;
    id v17 = v8;
    long long v18 = v10;
    id v19 = v9;
    [(ICCameraDevice *)self dispatchAsyncForOperationType:5 block:v15];
  }

  return (NSProgress *)v12;
}

void __61__ICCameraDevice_requestDeleteFiles_deleteFailed_completion___block_invoke(id *a1)
{
  [a1[4] setDeleteProgress:a1[5]];
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__3;
  v28[4] = __Block_byref_object_dispose__3;
  id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__3;
  v26[4] = __Block_byref_object_dispose__3;
  id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__3;
  v24[4] = __Block_byref_object_dispose__3;
  id v25 = (id)[a1[6] mutableCopy];
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  long long v21 = __Block_byref_object_copy__333;
  long long v22 = __Block_byref_object_dispose__334;
  id v23 = 0;
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  uint64_t v8 = __61__ICCameraDevice_requestDeleteFiles_deleteFailed_completion___block_invoke_335;
  uint64_t v9 = &unk_1E63D7F38;
  id v10 = a1[5];
  uint64_t v14 = v24;
  id v15 = v28;
  id v16 = v26;
  id v2 = a1[7];
  id v11 = a1[4];
  id v12 = v2;
  id v13 = a1[8];
  id v17 = &v18;
  id v3 = (void (**)(void))MEMORY[0x1C18A01C0](&v6);
  uint64_t v4 = objc_msgSend(v3, "copy", v6, v7, v8, v9);
  id v5 = (void *)v19[5];
  v19[5] = v4;

  v3[2](v3);
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(v26, 8);

  _Block_object_dispose(v28, 8);
}

void __61__ICCameraDevice_requestDeleteFiles_deleteFailed_completion___block_invoke_335(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isCancelled] & 1) != 0
    || ![*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) count])
  {
    id v12 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) count])
    {
      [v12 setObject:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) forKeyedSubscript:@"ICDeleteFailed"];
      id v10 = ICMakeLocalizedError(-9941);
    }
    else
    {
      id v10 = 0;
    }
    if ([*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) count]) {
      [v12 setObject:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) forKeyedSubscript:@"ICDeleteSuccessful"];
    }
    if ([*(id *)(a1 + 32) isCancelled]
      && [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) count])
    {
      [v12 setObject:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) forKeyedSubscript:@"ICDeleteCanceled"];
      uint64_t v11 = ICMakeLocalizedError(-9942);

      id v10 = (void *)v11;
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    [*(id *)(a1 + 40) setDeleteProgress:0];
  }
  else
  {
    id v2 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) lastObject];
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
    uint64_t v4 = [*(id *)(a1 + 40) deviceManager];
    uint64_t v5 = *(void *)(a1 + 40);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __61__ICCameraDevice_requestDeleteFiles_deleteFailed_completion___block_invoke_2;
    v14[3] = &unk_1E63D7F10;
    id v6 = *(id *)(a1 + 56);
    dispatch_semaphore_t v16 = v3;
    id v17 = v6;
    long long v18 = *(_OWORD *)(a1 + 72);
    uint64_t v19 = *(void *)(a1 + 64);
    id v15 = v2;
    uint64_t v7 = v3;
    id v8 = v2;
    [v4 deleteFile:v8 fromDevice:v5 completion:v14];

    dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
    objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "completedUnitCount") + 1);
    uint64_t v9 = dispatch_get_global_queue(25, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__ICCameraDevice_requestDeleteFiles_deleteFailed_completion___block_invoke_344;
    block[3] = &unk_1E63D7B28;
    void block[4] = *(void *)(a1 + 88);
    dispatch_async(v9, block);
  }
}

void __61__ICCameraDevice_requestDeleteFiles_deleteFailed_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  __ICOSLogCreate();
  uint64_t v5 = @"iccameradevice";
  if ((unint64_t)[@"iccameradevice" length] >= 0x15)
  {
    id v6 = objc_msgSend(@"iccameradevice", "substringWithRange:", 0, 18);
    uint64_t v5 = [v6 stringByAppendingString:@".."];
  }
  uint64_t v7 = NSString;
  id v8 = [v4 objectForKeyedSubscript:@"file"];
  uint64_t v9 = [v7 stringWithFormat:@"delete file reply: %@", v8];

  id v10 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = v5;
    id v12 = v10;
    *(_DWORD *)buf = 136446466;
    uint64_t v31 = [(__CFString *)v11 UTF8String];
    __int16 v32 = 2114;
    uint64_t v33 = v9;
    _os_log_impl(&dword_1BEEFF000, v12, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  id v13 = [v4 objectForKeyedSubscript:@"errCode"];
  int v14 = [v13 intValue];

  if (v14 <= -9923)
  {
    if (v14 == -9942)
    {
      uint64_t v15 = *(void *)(a1 + 48);
      uint64_t v21 = *(void *)(a1 + 32);
      id v28 = @"ICDeleteErrorCanceled";
      uint64_t v29 = v21;
      id v17 = (void *)MEMORY[0x1E4F1C9E8];
      long long v18 = &v29;
      uint64_t v19 = &v28;
      goto LABEL_14;
    }
    if (v14 == -9941)
    {
      uint64_t v15 = *(void *)(a1 + 48);
      uint64_t v16 = *(void *)(a1 + 32);
      int v24 = @"ICDeleteErrorReadOnly";
      uint64_t v25 = v16;
      id v17 = (void *)MEMORY[0x1E4F1C9E8];
      long long v18 = &v25;
      uint64_t v19 = &v24;
LABEL_14:
      id v23 = [v17 dictionaryWithObjects:v18 forKeys:v19 count:1];
      (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v23);
    }
LABEL_15:
    uint64_t v20 = *(void *)(a1 + 56);
    goto LABEL_16;
  }
  if (v14 == -9922)
  {
    uint64_t v15 = *(void *)(a1 + 48);
    uint64_t v22 = *(void *)(a1 + 32);
    uint64_t v26 = @"ICDeleteErrorFileMissing";
    uint64_t v27 = v22;
    id v17 = (void *)MEMORY[0x1E4F1C9E8];
    long long v18 = &v27;
    uint64_t v19 = &v26;
    goto LABEL_14;
  }
  if (v14) {
    goto LABEL_15;
  }
  uint64_t v20 = *(void *)(a1 + 64);
LABEL_16:
  [*(id *)(*(void *)(v20 + 8) + 40) addObject:*(void *)(a1 + 32)];
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) removeLastObject];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t __61__ICCameraDevice_requestDeleteFiles_deleteFailed_completion___block_invoke_344(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) + 16))();
}

- (void)requestEject
{
  if ([(ICCameraDevice *)self isEjectable])
  {
    if (![(ICCameraDevice *)self beingEjected])
    {
      [(ICCameraDevice *)self setBeingEjected:1];
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __30__ICCameraDevice_requestEject__block_invoke;
      v4[3] = &unk_1E63D7280;
      v4[4] = self;
      v3.receiver = self;
      v3.super_class = (Class)ICCameraDevice;
      [(ICDevice *)&v3 requestEjectWithCompletion:v4];
    }
  }
}

uint64_t __30__ICCameraDevice_requestEject__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setBeingEjected:0];
}

- (void)requestSendPTPCommand:(NSData *)ptpCommand outData:(NSData *)ptpData completion:(void *)completion
{
  id v8 = completion;
  if (ptpCommand)
  {
    uint64_t v9 = ptpData;
    id v10 = ptpCommand;
    uint64_t v11 = [(ICDevice *)self deviceManager];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __59__ICCameraDevice_requestSendPTPCommand_outData_completion___block_invoke;
    v12[3] = &unk_1E63D7A00;
    id v13 = v8;
    [v11 sendDevice:self ptpCommand:v10 andPayload:v9 completion:v12];
  }
}

void __59__ICCameraDevice_requestSendPTPCommand_outData_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"errCode"];
  int v6 = [v5 intValue];

  if (v6)
  {
    id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.ImageCaptureCore" code:v6 userInfo:0];
  }
  else
  {
    id v9 = 0;
  }
  uint64_t v7 = [v4 objectForKeyedSubscript:@"ICPTPDataInBuffer"];
  id v8 = [v4 objectForKeyedSubscript:@"ICPTPResponseBuffer"];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setPtpEventForwarding:(BOOL)a3
{
  BOOL v3 = a3;
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(ICDevice *)self deviceManager];
  if (v3)
  {
    v8[0] = @"ICNotificationTypeDeviceForwardPTPEvents";
    int v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    [v5 registerDevice:self forImageCaptureEventNotifications:v6];
  }
  else
  {
    uint64_t v7 = @"ICNotificationTypeDeviceForwardPTPEvents";
    int v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v7 count:1];
    [v5 unregisterDevice:self forImageCaptureEventNotifications:v6];
  }
}

- (void)cancelDelete
{
  BOOL v3 = [(ICCameraDevice *)self deleteProgress];

  if (v3)
  {
    id v4 = [(ICCameraDevice *)self deleteProgress];
    [v4 cancel];
  }
}

- (void)requestDownloadFile:(ICCameraFile *)file options:(NSDictionary *)options downloadDelegate:(id)downloadDelegate didDownloadSelector:(SEL)selector contextInfo:(void *)contextInfo
{
  uint64_t v11 = file;
  id v12 = options;
  id v13 = downloadDelegate;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __95__ICCameraDevice_requestDownloadFile_options_downloadDelegate_didDownloadSelector_contextInfo___block_invoke;
  v18[3] = &unk_1E63D7FB0;
  uint64_t v19 = v12;
  id v20 = v13;
  uint64_t v21 = v11;
  SEL v22 = selector;
  id v23 = contextInfo;
  int v14 = v11;
  id v15 = v13;
  uint64_t v16 = v12;
  id v17 = [(ICCameraFile *)v14 requestDownloadWithOptions:v16 completion:v18];
}

void __95__ICCameraDevice_requestDownloadFile_options_downloadDelegate_didDownloadSelector_contextInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)[*(id *)(a1 + 32) mutableCopy];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __95__ICCameraDevice_requestDownloadFile_options_downloadDelegate_didDownloadSelector_contextInfo___block_invoke_2;
  block[3] = &unk_1E63D7F88;
  id v15 = v5;
  id v16 = v7;
  id v8 = *(id *)(a1 + 40);
  id v10 = *(void **)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 56);
  id v17 = v8;
  uint64_t v20 = v9;
  id v18 = v10;
  id v19 = v6;
  uint64_t v21 = *(void *)(a1 + 64);
  id v11 = v6;
  id v12 = v7;
  id v13 = v5;
  ICPerformBlockOnMainThread(block);
}

id __95__ICCameraDevice_requestDownloadFile_options_downloadDelegate_didDownloadSelector_contextInfo___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    [*(id *)(a1 + 40) setObject:v2 forKeyedSubscript:@"ICSavedFilename"];
  }
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 64);
  uint64_t v6 = *(void *)(a1 + 40);
  id v5 = *(void **)(a1 + 48);
  uint64_t v7 = *(const char **)(a1 + 72);
  uint64_t v8 = *(void *)(a1 + 80);

  return objc_msgSend(v5, v7, v3, v4, v6, v8);
}

- (void)addFolder:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_mediaLock);
    __ICOSLogCreate();
    id v5 = [(ICDevice *)self name];
    if ((unint64_t)[v5 length] >= 0x15)
    {
      uint64_t v6 = objc_msgSend(v5, "substringWithRange:", 0, 18);
      uint64_t v7 = [v6 stringByAppendingString:@".."];

      id v5 = (void *)v7;
    }
    uint64_t v8 = NSString;
    id v9 = [v4 name];
    id v10 = objc_msgSend(v8, "stringWithFormat:", @"🗄 Store Added  - %04d - [%8s]", 1, objc_msgSend(v9, "UTF8String"));

    id v11 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = v5;
      id v13 = v11;
      *(_DWORD *)buf = 136446466;
      uint64_t v15 = [v12 UTF8String];
      __int16 v16 = 2114;
      id v17 = v10;
      _os_log_impl(&dword_1BEEFF000, v13, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    [(NSMutableArray *)self->_devContents addObject:v4];
    os_unfair_lock_unlock(&self->_mediaLock);
    [(ICCameraDevice *)self addCameraFolderToIndex:v4];
    [(ICCameraDevice *)self storageAvailable];
  }
}

- (void)removeFolder:(id)a3
{
  if (a3)
  {
    devContents = self->_devContents;
    id v5 = a3;
    [(NSMutableArray *)devContents removeObject:v5];
    uint64_t v6 = [(ICCameraDevice *)self indexedMediaSet];
    [v6 removeMediaItemFromIndex:v5];

    [(ICCameraDevice *)self storageAvailable];
  }
}

- (void)cancelDownload
{
  uint64_t v3 = [(ICCameraDevice *)self downloadProgress];

  if (v3)
  {
    id v4 = [(ICCameraDevice *)self downloadProgress];
    [v4 cancel];
  }
}

- (int64_t)cameraFilesContentSizeInBytes
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(ICCameraDevice *)self indexedMediaSet];
  uint64_t v3 = [v2 orderedSetForType:@"file"];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    int64_t v7 = 0;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v4);
        }
        v7 += 5120 + objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "fileSize", (void)v11);
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (CGImage)icon
{
  uint64_t v3 = [(ICDevice *)self systemSymbolName];

  if (!v3) {
    [(ICDevice *)self setSystemSymbolName:@"camera"];
  }
  uint64_t v4 = [(ICDevice *)self systemSymbolName];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    uint64_t v6 = [(ICCameraDevice *)self cameraDeviceIcon];

    if (!v6)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F6F220]);
      [v7 setSymbolWeight:3];
      [v7 setPointSize:24.0];
      uint64_t v8 = [(ICCameraDevice *)self mobdevProperties];
      id v9 = [v8 objectForKeyedSubscript:@"ProductType"];

      if (v9)
      {
        id v10 = [MEMORY[0x1E4F442D8] _typeWithDeviceModelCode:v9];
        long long v11 = (void *)MEMORY[0x1E4F6F260];
        long long v12 = [v10 identifier];
        uint64_t v22 = 0;
        long long v13 = [v11 symbolForTypeIdentifier:v12 withResolutionStrategy:1 variantOptions:1 error:&v22];

        long long v14 = [v13 imageForDescriptor:v7];
        uint64_t v15 = v14;
        if (v14) {
          -[ICCameraDevice setCameraDeviceIcon:](self, "setCameraDeviceIcon:", [v14 CGImage]);
        }
      }
      if (![(ICCameraDevice *)self cameraDeviceIcon])
      {
        id v16 = objc_alloc(MEMORY[0x1E4F6F260]);
        id v17 = [(ICDevice *)self systemSymbolName];
        uint64_t v18 = (void *)[v16 initWithSymbolName:v17 bundleURL:0];

        id v19 = [v18 imageForDescriptor:v7];
        uint64_t v20 = v19;
        if (v19) {
          -[ICCameraDevice setCameraDeviceIcon:](self, "setCameraDeviceIcon:", [v19 CGImage]);
        }
      }
    }
  }
  return [(ICCameraDevice *)self cameraDeviceIcon];
}

- (BOOL)setDefaultMediaPresentation:(unint64_t)a3
{
  ICMediaPresentation v5 = [(ICCameraDevice *)self mediaPresentation];
  if (v5 != a3) {
    [(ICCameraDevice *)self setMediaPresentation:a3];
  }
  return v5 != a3;
}

- (ICCameraDevice)initWithDictionary:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)ICCameraDevice;
  uint64_t v3 = [(ICDevice *)&v17 initWithDictionary:a3];
  uint64_t v4 = v3;
  if (v3)
  {
    [(ICDevice *)v3 setProductKind:@"Camera"];
    [(ICDevice *)v4 setType:1];
    ICMediaPresentation v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
    [(ICCameraDevice *)v4 setDevContents:v5];

    uint64_t v6 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
    [(ICCameraDevice *)v4 setDevMediaFiles:v6];

    v4->_mediaLock._os_unfair_lock_opaque = 0;
    id v7 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v8 = dispatch_queue_create("ICDeviceNotificationQueue", v7);
    devNotificationQueue = v4->_devNotificationQueue;
    v4->_devNotificationQueue = (OS_dispatch_queue *)v8;

    dispatch_queue_t v10 = dispatch_queue_create("ICDeviceCommandQueue", v7);
    devCommandQueue = v4->_devCommandQueue;
    v4->_devCommandQueue = (OS_dispatch_queue *)v10;

    dispatch_queue_t v12 = dispatch_queue_create("ICDeviceWriteQueue", v7);
    devWriteQueue = v4->_devWriteQueue;
    v4->_devWriteQueue = (OS_dispatch_queue *)v12;

    v4->_devContentCatalogPercentCompleted = 0;
    v4->_preflightCountOfObjects = -1;
    v4->_int isEnumeratingContent = 0;
    [(ICCameraDevice *)v4 setDevMediaPresentation:1];
    long long v14 = [[ICOrderedMediaSet alloc] initWithTypes:&unk_1F1A2C658];
    indexedMediaSet = v4->_indexedMediaSet;
    v4->_indexedMediaSet = v14;

    [(ICCameraDevice *)v4 setAppleRelatedUUIDSupport:0];
    [(ICCameraDevice *)v4 setEnumerationOrder:1];
    [(ICDevice *)v4 setType:[(ICDevice *)v4 type] | 0x100];
    [(ICCameraDevice *)v4 resetAccessRestriction];
    [(ICCameraDevice *)v4 addObserver:v4 forKeyPath:@"ready" options:3 context:0];
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  __ICOSLogCreate();
  uint64_t v3 = [(ICDevice *)self name];
  if ((unint64_t)[v3 length] >= 0x15)
  {
    uint64_t v4 = objc_msgSend(v3, "substringWithRange:", 0, 18);
    uint64_t v5 = [v4 stringByAppendingString:@".."];

    uint64_t v3 = (void *)v5;
  }
  uint64_t v6 = [NSString stringWithFormat:@" --- Deallocating Device"];
  id v7 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v3;
    id v9 = v7;
    *(_DWORD *)buf = 136446466;
    uint64_t v13 = [v8 UTF8String];
    __int16 v14 = 2114;
    uint64_t v15 = v6;
    _os_log_impl(&dword_1BEEFF000, v9, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  [(ICCameraDevice *)self removeObserver:self forKeyPath:@"ready"];
  [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:self];
  dispatch_queue_t v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v10 removeObserver:self];

  v11.receiver = self;
  v11.super_class = (Class)ICCameraDevice;
  [(ICCameraDevice *)&v11 dealloc];
}

- (void)requestReadDataFromFile:(ICCameraFile *)file atOffset:(off_t)offset length:(off_t)length readDelegate:(id)readDelegate didReadDataSelector:(SEL)selector contextInfo:(void *)contextInfo
{
  __int16 v14 = file;
  id v15 = readDelegate;
  SEL v16 = sel_registerName("didReadData:fromFile:error:contextInfo:");
  if ([(ICDevice *)self hasOpenSession]
    && (BOOL v17 = [(ICCameraDevice *)self beingEjected], selector)
    && v15
    && v14
    && !v17)
  {
    if (length + offset <= [(ICCameraFile *)v14 fileSize]
      && ![(ICCameraFile *)v14 isConverted])
    {
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __103__ICCameraDevice_requestReadDataFromFile_atOffset_length_readDelegate_didReadDataSelector_contextInfo___block_invoke;
      v26[3] = &unk_1E63D8000;
      id v27 = v15;
      SEL v29 = v16;
      SEL v30 = selector;
      id v28 = v14;
      uint64_t v31 = contextInfo;
      [(ICCameraFile *)v28 requestReadDataAtOffset:offset length:length completion:v26];

      id v18 = v27;
LABEL_12:

      goto LABEL_13;
    }
  }
  else if (!v15)
  {
    goto LABEL_13;
  }
  if (objc_opt_respondsToSelector())
  {
    id v19 = ICMakeLocalizedError(-9922);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __103__ICCameraDevice_requestReadDataFromFile_atOffset_length_readDelegate_didReadDataSelector_contextInfo___block_invoke_3;
    v20[3] = &unk_1E63D8028;
    id v21 = v15;
    SEL v24 = selector;
    uint64_t v22 = v14;
    id v23 = v19;
    uint64_t v25 = contextInfo;
    id v18 = v19;
    ICPerformBlockOnMainThread(v20);

    goto LABEL_12;
  }
LABEL_13:
}

void __103__ICCameraDevice_requestReadDataFromFile_atOffset_length_readDelegate_didReadDataSelector_contextInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __103__ICCameraDevice_requestReadDataFromFile_atOffset_length_readDelegate_didReadDataSelector_contextInfo___block_invoke_2;
  block[3] = &unk_1E63D7FD8;
  id v7 = *(id *)(a1 + 32);
  long long v15 = *(_OWORD *)(a1 + 48);
  id v11 = v7;
  id v12 = v5;
  id v13 = *(id *)(a1 + 40);
  id v14 = v6;
  uint64_t v16 = *(void *)(a1 + 64);
  id v8 = v6;
  id v9 = v5;
  ICPerformBlockOnMainThread(block);
}

uint64_t __103__ICCameraDevice_requestReadDataFromFile_atOffset_length_readDelegate_didReadDataSelector_contextInfo___block_invoke_2(void *a1)
{
  uint64_t result = a1[4];
  if (result)
  {
    uint64_t result = objc_opt_respondsToSelector();
    if (result)
    {
      uint64_t v3 = (void *)a1[4];
      uint64_t v4 = a1[5];
      uint64_t v5 = a1[6];
      uint64_t v6 = a1[7];
      id v7 = (const char *)a1[9];
      uint64_t v8 = a1[10];
      return (uint64_t)objc_msgSend(v3, v7, v4, v5, v6, v8);
    }
  }
  return result;
}

id __103__ICCameraDevice_requestReadDataFromFile_atOffset_length_readDelegate_didReadDataSelector_contextInfo___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), *(SEL *)(a1 + 56), 0, *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 64));
}

- (void)dumpPTPPassthruCommand:(id)a3 andData:(id)a4
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  unsigned int v92 = 0;
  unsigned __int16 v91 = 0;
  objc_msgSend(v5, "getBytes:range:", &v92, 0, 4);
  objc_msgSend(v5, "getBytes:range:", &v91, 6, 2);
  if (v91 != 37142 && v91 != 37203)
  {
    __ICOSLogCreate();
    uint64_t v8 = @"--cmd--";
    if ((unint64_t)[@"--cmd--" length] >= 0x15)
    {
      id v9 = objc_msgSend(@"--cmd--", "substringWithRange:", 0, 18);
      uint64_t v8 = [v9 stringByAppendingString:@".."];
    }
    dispatch_queue_t v10 = [NSString stringWithFormat:@"************************"];
    id v11 = (id)_gICOSLog;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [(__CFString *)v8 UTF8String];
      *(_DWORD *)buf = 136446466;
      uint64_t v94 = v12;
      __int16 v95 = 2114;
      v96 = v10;
      _os_log_impl(&dword_1BEEFF000, v11, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }

    __ICOSLogCreate();
    id v13 = @"length";
    if ((unint64_t)[@"length" length] >= 0x15)
    {
      id v14 = objc_msgSend(@"length", "substringWithRange:", 0, 18);
      id v13 = [v14 stringByAppendingString:@".."];
    }
    long long v15 = objc_msgSend(NSString, "stringWithFormat:", @"0x%X", v92);
    uint64_t v16 = (id)_gICOSLog;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = [(__CFString *)v13 UTF8String];
      *(_DWORD *)buf = 136446466;
      uint64_t v94 = v17;
      __int16 v95 = 2114;
      v96 = v15;
      _os_log_impl(&dword_1BEEFF000, v16, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }

    objc_msgSend(v5, "getBytes:range:", &v91, 4, 2);
    __ICOSLogCreate();
    id v18 = @"type";
    if ((unint64_t)[@"type" length] >= 0x15)
    {
      id v19 = objc_msgSend(@"type", "substringWithRange:", 0, 18);
      id v18 = [v19 stringByAppendingString:@".."];
    }
    uint64_t v20 = objc_msgSend(NSString, "stringWithFormat:", @"0x%X", v91);
    id v21 = (id)_gICOSLog;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = [(__CFString *)v18 UTF8String];
      *(_DWORD *)buf = 136446466;
      uint64_t v94 = v22;
      __int16 v95 = 2114;
      v96 = v20;
      _os_log_impl(&dword_1BEEFF000, v21, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }

    objc_msgSend(v5, "getBytes:range:", &v91, 6, 2);
    id v23 = objc_msgSend(NSString, "stringWithFormat:", @"%u", v91);
    __ICOSLogCreate();
    SEL v24 = @"op";
    if ((unint64_t)[@"op" length] >= 0x15)
    {
      uint64_t v25 = objc_msgSend(@"op", "substringWithRange:", 0, 18);
      SEL v24 = [v25 stringByAppendingString:@".."];
    }
    uint64_t v26 = NSString;
    id v27 = v23;
    id v28 = objc_msgSend(v26, "stringWithFormat:", @"%s", objc_msgSend(v27, "UTF8String"));
    SEL v29 = (id)_gICOSLog;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v30 = [(__CFString *)v24 UTF8String];
      *(_DWORD *)buf = 136446466;
      uint64_t v94 = v30;
      __int16 v95 = 2114;
      v96 = v28;
      _os_log_impl(&dword_1BEEFF000, v29, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }

    objc_msgSend(v5, "getBytes:range:", &v92, 8, 4);
    __ICOSLogCreate();
    uint64_t v31 = @"tid";
    if ((unint64_t)[@"tid" length] >= 0x15)
    {
      __int16 v32 = objc_msgSend(@"tid", "substringWithRange:", 0, 18);
      uint64_t v31 = [v32 stringByAppendingString:@".."];
    }
    uint64_t v33 = objc_msgSend(NSString, "stringWithFormat:", @"0x%X", v92);
    uint64_t v34 = (id)_gICOSLog;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v35 = [(__CFString *)v31 UTF8String];
      *(_DWORD *)buf = 136446466;
      uint64_t v94 = v35;
      __int16 v95 = 2114;
      v96 = v33;
      _os_log_impl(&dword_1BEEFF000, v34, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }

    if ((unint64_t)[v5 length] >= 0x10)
    {
      __ICOSLogCreate();
      uint64_t v36 = @"|---------pars--";
      if ((unint64_t)[@"|---------pars--" length] >= 0x15)
      {
        v37 = objc_msgSend(@"|---------pars--", "substringWithRange:", 0, 18);
        uint64_t v36 = [v37 stringByAppendingString:@".."];
      }
      v38 = [NSString stringWithFormat:@"---------"];
      v39 = (id)_gICOSLog;
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v40 = [(__CFString *)v36 UTF8String];
        *(_DWORD *)buf = 136446466;
        uint64_t v94 = v40;
        __int16 v95 = 2114;
        v96 = v38;
        _os_log_impl(&dword_1BEEFF000, v39, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }

      objc_msgSend(v5, "getBytes:range:", &v92, 12, 4);
      __ICOSLogCreate();
      v41 = @"(p1)";
      if ((unint64_t)[@"(p1)" length] >= 0x15)
      {
        v42 = objc_msgSend(@"(p1)", "substringWithRange:", 0, 18);
        v41 = [v42 stringByAppendingString:@".."];
      }
      v43 = objc_msgSend(NSString, "stringWithFormat:", @"0x%X", v92);
      v44 = (id)_gICOSLog;
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v45 = [(__CFString *)v41 UTF8String];
        *(_DWORD *)buf = 136446466;
        uint64_t v94 = v45;
        __int16 v95 = 2114;
        v96 = v43;
        _os_log_impl(&dword_1BEEFF000, v44, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }
    }
    if ((unint64_t)[v5 length] >= 0x14)
    {
      objc_msgSend(v5, "getBytes:range:", &v92, 16, 4);
      __ICOSLogCreate();
      v46 = @"(p2)";
      if ((unint64_t)[@"(p2)" length] >= 0x15)
      {
        v47 = objc_msgSend(@"(p2)", "substringWithRange:", 0, 18);
        v46 = [v47 stringByAppendingString:@".."];
      }
      v48 = objc_msgSend(NSString, "stringWithFormat:", @"0x%X", v92);
      v49 = (id)_gICOSLog;
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v50 = [(__CFString *)v46 UTF8String];
        *(_DWORD *)buf = 136446466;
        uint64_t v94 = v50;
        __int16 v95 = 2114;
        v96 = v48;
        _os_log_impl(&dword_1BEEFF000, v49, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }
    }
    if ((unint64_t)[v5 length] >= 0x18)
    {
      objc_msgSend(v5, "getBytes:range:", &v92, 20, 4);
      __ICOSLogCreate();
      v51 = @"(p3)";
      if ((unint64_t)[@"(p3)" length] >= 0x15)
      {
        v52 = objc_msgSend(@"(p3)", "substringWithRange:", 0, 18);
        v51 = [v52 stringByAppendingString:@".."];
      }
      v53 = objc_msgSend(NSString, "stringWithFormat:", @"0x%X", v92);
      v54 = (id)_gICOSLog;
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v55 = [(__CFString *)v51 UTF8String];
        *(_DWORD *)buf = 136446466;
        uint64_t v94 = v55;
        __int16 v95 = 2114;
        v96 = v53;
        _os_log_impl(&dword_1BEEFF000, v54, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }
    }
    if ((unint64_t)[v5 length] >= 0x1C)
    {
      objc_msgSend(v5, "getBytes:range:", &v92, 24, 4);
      __ICOSLogCreate();
      v56 = @"(p4)";
      if ((unint64_t)[@"(p4)" length] >= 0x15)
      {
        v57 = objc_msgSend(@"(p4)", "substringWithRange:", 0, 18);
        v56 = [v57 stringByAppendingString:@".."];
      }
      v58 = objc_msgSend(NSString, "stringWithFormat:", @"0x%X", v92);
      v59 = (id)_gICOSLog;
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v60 = [(__CFString *)v56 UTF8String];
        *(_DWORD *)buf = 136446466;
        uint64_t v94 = v60;
        __int16 v95 = 2114;
        v96 = v58;
        _os_log_impl(&dword_1BEEFF000, v59, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }
    }
    if ((unint64_t)[v5 length] >= 0x20)
    {
      objc_msgSend(v5, "getBytes:range:", &v92, 28, 4);
      __ICOSLogCreate();
      v61 = @"(p5)";
      if ((unint64_t)[@"(p5)" length] >= 0x15)
      {
        v62 = objc_msgSend(@"(p5)", "substringWithRange:", 0, 18);
        v61 = [v62 stringByAppendingString:@".."];
      }
      v63 = objc_msgSend(NSString, "stringWithFormat:", @"0x%X", v92);
      v64 = (id)_gICOSLog;
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v65 = [(__CFString *)v61 UTF8String];
        *(_DWORD *)buf = 136446466;
        uint64_t v94 = v65;
        __int16 v95 = 2114;
        v96 = v63;
        _os_log_impl(&dword_1BEEFF000, v64, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }
    }
    if (v6 && [v6 length] == 12)
    {
      __ICOSLogCreate();
      v66 = @"|---------data--";
      if ((unint64_t)[@"|---------data--" length] >= 0x15)
      {
        v67 = objc_msgSend(@"|---------data--", "substringWithRange:", 0, 18);
        v66 = [v67 stringByAppendingString:@".."];
      }
      v68 = [NSString stringWithFormat:@"---------"];
      v69 = (id)_gICOSLog;
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v70 = [(__CFString *)v66 UTF8String];
        *(_DWORD *)buf = 136446466;
        uint64_t v94 = v70;
        __int16 v95 = 2114;
        v96 = v68;
        _os_log_impl(&dword_1BEEFF000, v69, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }

      unsigned int v90 = 0;
      objc_msgSend(v6, "getBytes:range:", &v90, 0, 4);
      __ICOSLogCreate();
      v71 = @"|-->      length";
      if ((unint64_t)[@"|-->      length" length] >= 0x15)
      {
        v72 = objc_msgSend(@"|-->      length", "substringWithRange:", 0, 18);
        v71 = [v72 stringByAppendingString:@".."];
      }
      v73 = objc_msgSend(NSString, "stringWithFormat:", @"0x%X", v90);
      v74 = (id)_gICOSLog;
      if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v75 = [(__CFString *)v71 UTF8String];
        *(_DWORD *)buf = 136446466;
        uint64_t v94 = v75;
        __int16 v95 = 2114;
        v96 = v73;
        _os_log_impl(&dword_1BEEFF000, v74, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }

      objc_msgSend(v6, "getBytes:range:", &v90, 4, 4);
      __ICOSLogCreate();
      v76 = @"|-->  propertyID";
      if ((unint64_t)[@"|-->  propertyID" length] >= 0x15)
      {
        v77 = objc_msgSend(@"|-->  propertyID", "substringWithRange:", 0, 18);
        v76 = [v77 stringByAppendingString:@".."];
      }
      v78 = objc_msgSend(NSString, "stringWithFormat:", @"0x%X", v90);
      v79 = (id)_gICOSLog;
      if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v80 = [(__CFString *)v76 UTF8String];
        *(_DWORD *)buf = 136446466;
        uint64_t v94 = v80;
        __int16 v95 = 2114;
        v96 = v78;
        _os_log_impl(&dword_1BEEFF000, v79, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }

      objc_msgSend(v6, "getBytes:range:", &v90, 8, 4);
      __ICOSLogCreate();
      v81 = @"|--> propertyVal";
      if ((unint64_t)[@"|--> propertyVal" length] >= 0x15)
      {
        v82 = objc_msgSend(@"|--> propertyVal", "substringWithRange:", 0, 18);
        v81 = [v82 stringByAppendingString:@".."];
      }
      v83 = objc_msgSend(NSString, "stringWithFormat:", @"0x%X", v90);
      v84 = (id)_gICOSLog;
      if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v85 = [(__CFString *)v81 UTF8String];
        *(_DWORD *)buf = 136446466;
        uint64_t v94 = v85;
        __int16 v95 = 2114;
        v96 = v83;
        _os_log_impl(&dword_1BEEFF000, v84, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }
    }
    __ICOSLogCreate();
    v86 = [NSString stringWithFormat:@"\n"];
    uint64_t v87 = __ICLogTypeEnabled(2);
    v88 = (id)_gICOSLog;
    v89 = v88;
    if (v87)
    {
      if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v94 = (uint64_t)v86;
        _os_log_impl(&dword_1BEEFF000, v89, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v88, OS_LOG_TYPE_DEBUG))
    {
      -[ICCameraDeviceBrowser handleImageCaptureEventNotification:]((uint64_t)v86, v89);
    }
  }
}

- (void)requestSendPTPCommand:(NSData *)command outData:(NSData *)data sendCommandDelegate:(id)sendCommandDelegate didSendCommandSelector:(SEL)selector contextInfo:(void *)contextInfo
{
  uint64_t v12 = command;
  id v13 = data;
  id v14 = sendCommandDelegate;
  BOOL v15 = [(ICDevice *)self hasOpenSession];
  if (selector && v14 && v12 && v15)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __103__ICCameraDevice_requestSendPTPCommand_outData_sendCommandDelegate_didSendCommandSelector_contextInfo___block_invoke;
    v16[3] = &unk_1E63D8050;
    id v17 = v14;
    SEL v19 = selector;
    id v18 = v12;
    uint64_t v20 = contextInfo;
    [(ICCameraDevice *)self requestSendPTPCommand:v18 outData:v13 completion:v16];
  }
}

void __103__ICCameraDevice_requestSendPTPCommand_outData_sendCommandDelegate_didSendCommandSelector_contextInfo___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __103__ICCameraDevice_requestSendPTPCommand_outData_sendCommandDelegate_didSendCommandSelector_contextInfo___block_invoke_2;
  block[3] = &unk_1E63D7F88;
  id v10 = *(id *)(a1 + 32);
  uint64_t v12 = *(void **)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 48);
  id v17 = v10;
  uint64_t v22 = v11;
  id v18 = v12;
  id v19 = v7;
  id v20 = v8;
  id v21 = v9;
  uint64_t v23 = *(void *)(a1 + 56);
  id v13 = v9;
  id v14 = v8;
  id v15 = v7;
  ICPerformBlockOnMainThread(block);
}

id __103__ICCameraDevice_requestSendPTPCommand_outData_sendCommandDelegate_didSendCommandSelector_contextInfo___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), *(SEL *)(a1 + 72), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 80));
}

- (NSString)productVersion
{
  uint64_t v2 = [(ICCameraDevice *)self mobdevProperties];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"ProductVersion"];

  return (NSString *)v3;
}

- (NSString)appleSerialNumber
{
  uint64_t v2 = [(ICCameraDevice *)self mobdevProperties];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"AppleSerialNumber"];

  return (NSString *)v3;
}

- (BOOL)updateAppleProperties:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(ICDevice *)self isAppleDevice])
  {
    BOOL v17 = 0;
    goto LABEL_47;
  }
  id v5 = [v4 objectForKeyedSubscript:@"mobdevProps"];

  if (v5)
  {
    __ICOSLogCreate();
    if (__ICLogTypeEnabled(4))
    {
      id v6 = @"mobdev";
      if ((unint64_t)[@"mobdev" length] >= 0x15)
      {
        id v7 = objc_msgSend(@"mobdev", "substringWithRange:", 0, 18);
        id v6 = [v7 stringByAppendingString:@".."];
      }
      id v8 = NSString;
      id v9 = [v4 objectForKeyedSubscript:@"mobdevProps"];
      id v10 = [v8 stringWithFormat:@"%@", v9];

      uint64_t v11 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = v6;
        id v13 = v11;
        *(_DWORD *)buf = 136446466;
        uint64_t v43 = [(__CFString *)v12 UTF8String];
        __int16 v44 = 2114;
        uint64_t v45 = v10;
        _os_log_impl(&dword_1BEEFF000, v13, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }
    }
  }
  id v14 = [v4 objectForKeyedSubscript:@"mobdevProps"];
  if (v14
    && ([(ICCameraDevice *)self mobdevProperties],
        id v15 = objc_claimAutoreleasedReturnValue(),
        char v16 = [v14 isEqualToDictionary:v15],
        v15,
        (v16 & 1) == 0))
  {
    [(ICCameraDevice *)self willChangeValueForKey:@"mobdevProperties"];
    [(ICCameraDevice *)self setMobdevProperties:v14];
    [(ICCameraDevice *)self didChangeValueForKey:@"mobdevProperties"];
    BOOL v17 = 1;
  }
  else
  {
    BOOL v17 = 0;
  }
  id v18 = [v4 objectForKeyedSubscript:@"iCloudPhotosEnabled"];

  if (v18)
  {
    uint64_t v19 = [v18 unsignedIntegerValue];
    if (v19 != [(ICCameraDevice *)self iCloudPhotosEnabled]) {
      [(ICCameraDevice *)self setICloudPhotosEnabled:v19 != 0];
    }
  }
  id v20 = [(ICCameraDevice *)self mobdevProperties];

  if (v20
    && ([(ICCameraDevice *)self mobdevProperties],
        id v21 = objc_claimAutoreleasedReturnValue(),
        [v21 objectForKeyedSubscript:@"DevicePairedState"],
        uint64_t v22 = objc_claimAutoreleasedReturnValue(),
        v21,
        v22))
  {
    if ([v22 BOOLValue]) {
      uint64_t v23 = 0;
    }
    else {
      uint64_t v23 = 4;
    }
  }
  else
  {
    SEL v24 = [v4 objectForKeyedSubscript:@"deviceIsPairedWithThisHost"];
    if (!v24)
    {
      uint64_t v23 = 0;
      goto LABEL_28;
    }
    uint64_t v22 = v24;
    if ([v24 BOOLValue]) {
      uint64_t v23 = 4;
    }
    else {
      uint64_t v23 = 0;
    }
  }

LABEL_28:
  uint64_t v25 = [v4 objectForKeyedSubscript:@"deviceIsEnumerating"];
  uint64_t v26 = [v4 objectForKeyedSubscript:@"deviceIsPasscodeLocked"];
  id v27 = v26;
  if (v26 && ![v26 BOOLValue])
  {
    v23 |= 2uLL;
LABEL_34:
    [(ICCameraDevice *)self setAccessRestriction:v23];
    if (!v25) {
      goto LABEL_43;
    }
LABEL_35:
    int v28 = [v25 BOOLValue];
    if (v28 != [(ICCameraDevice *)self isEnumeratingContent])
    {
      __ICOSLogCreate();
      SEL v29 = @"library";
      if ((unint64_t)[@"library" length] >= 0x15)
      {
        uint64_t v30 = objc_msgSend(@"library", "substringWithRange:", 0, 18);
        SEL v29 = [v30 stringByAppendingString:@".."];
      }
      uint64_t v31 = NSString;
      int v32 = [v25 BOOLValue];
      uint64_t v33 = @"√ Complete";
      if (v32) {
        uint64_t v33 = @"- Enumerating";
      }
      uint64_t v34 = [v31 stringWithFormat:@"%@", v33];
      uint64_t v35 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v36 = v29;
        v37 = v35;
        uint64_t v38 = [(__CFString *)v36 UTF8String];
        *(_DWORD *)buf = 136446466;
        uint64_t v43 = v38;
        __int16 v44 = 2114;
        uint64_t v45 = v34;
        _os_log_impl(&dword_1BEEFF000, v37, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }
      [(ICCameraDevice *)self willChangeValueForKey:@"isEnumeratingContent"];
      self->_int isEnumeratingContent = [v25 BOOLValue];
      [(ICCameraDevice *)self didChangeValueForKey:@"isEnumeratingContent"];
      BOOL v17 = 1;
    }
    goto LABEL_43;
  }
  if (v23) {
    goto LABEL_34;
  }
  if (v25) {
    goto LABEL_35;
  }
LABEL_43:
  v39 = [v4 objectForKeyedSubscript:@"deviceMediaPresentation"];

  if (v39)
  {
    int v40 = [v39 intValue];
    if ([(ICCameraDevice *)self mediaPresentation] != v40) {
      [(ICCameraDevice *)self setDefaultMediaPresentation:v40];
    }
  }

LABEL_47:
  return v17;
}

- (void)requestUploadFile:(NSURL *)fileURL options:(NSDictionary *)options uploadDelegate:(id)uploadDelegate didUploadSelector:(SEL)selector contextInfo:(void *)contextInfo
{
  id v10 = fileURL;
  id v11 = uploadDelegate;
  uint64_t v12 = v11;
  if (v11 && selector)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __89__ICCameraDevice_requestUploadFile_options_uploadDelegate_didUploadSelector_contextInfo___block_invoke;
    v13[3] = &unk_1E63D8078;
    id v14 = v11;
    SEL v16 = selector;
    id v15 = v10;
    BOOL v17 = contextInfo;
    ICPerformBlockOnMainThread(v13);
  }
}

void __89__ICCameraDevice_requestUploadFile_options_uploadDelegate_didUploadSelector_contextInfo___block_invoke(uint64_t a1)
{
  ICMakeLocalizedError(-9935);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), *(SEL *)(a1 + 48), *(void *)(a1 + 40), v2, *(void *)(a1 + 56));
}

- (void)requestTakePicture
{
  if ([(ICDevice *)self hasOpenSession])
  {
    if ([(ICCameraDevice *)self tetheredCaptureEnabled])
    {
      uint64_t v3 = [[PTPOperationRequestPacket alloc] initWithOperationCode:4110 transactionID:0 dataPhaseInfo:1 parameter1:0 parameter2:0];
      id v4 = [(PTPOperationRequestPacket *)v3 contentForUSB];
      id v5 = [v4 data];
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __36__ICCameraDevice_requestTakePicture__block_invoke;
      v6[3] = &unk_1E63D80A0;
      void v6[4] = self;
      [(ICCameraDevice *)self requestSendPTPCommand:v5 outData:0 completion:v6];
    }
  }
}

void __36__ICCameraDevice_requestTakePicture__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    id v10 = -[PTPOperationResponsePacket initWithUSBBuffer:]([PTPOperationResponsePacket alloc], "initWithUSBBuffer:", [v8 bytes]);
    id v11 = v10;
    if (v10 && [(PTPOperationResponsePacket *)v10 responseCode] == 8193)
    {
      __ICOSLogCreate();
      uint64_t v12 = [*(id *)(a1 + 32) name];
      if ((unint64_t)[v12 length] >= 0x15)
      {
        id v13 = objc_msgSend(v12, "substringWithRange:", 0, 18);
        uint64_t v14 = [v13 stringByAppendingString:@".."];

        uint64_t v12 = (void *)v14;
      }
      id v15 = [NSString stringWithFormat:@"Issued a PTP capture event successfully."];
      SEL v16 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = v12;
        id v18 = v16;
        int v19 = 136446466;
        uint64_t v20 = [v17 UTF8String];
        __int16 v21 = 2114;
        uint64_t v22 = v15;
        _os_log_impl(&dword_1BEEFF000, v18, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v19, 0x16u);
      }
    }
  }
  else
  {
    id v11 = 0;
  }
}

- (BOOL)isEjectable
{
  return self->_ejectable;
}

- (void)setEjectable:(BOOL)a3
{
  self->_ejectable = a3;
}

- (BOOL)isLocked
{
  return self->_locked;
}

- (void)setLocked:(BOOL)a3
{
  self->_locked = a3;
}

- (void)setAccessRestrictedAppleDevice:(BOOL)a3
{
  self->_accessRestrictedAppleDevice = a3;
}

- (NSString)mountPoint
{
  return self->_mountPoint;
}

- (void)setMountPoint:(id)a3
{
}

- (NSTimeInterval)timeOffset
{
  return self->_timeOffset;
}

- (void)setTimeOffset:(double)a3
{
  self->_timeOffset = a3;
}

- (BOOL)batteryLevelAvailable
{
  return self->_batteryLevelAvailable;
}

- (void)setBatteryLevelAvailable:(BOOL)a3
{
  self->_batteryLevelAvailable = a3;
}

- (NSUInteger)batteryLevel
{
  return self->_batteryLevel;
}

- (void)setBatteryLevel:(unint64_t)a3
{
  self->_batteryLevel = a3;
}

- (BOOL)tetheredCaptureEnabled
{
  return self->_tetheredCaptureEnabled;
}

- (void)ptpEventHandler
{
  return self->_ptpEventHandler;
}

- (BOOL)contentReceived
{
  return self->_contentReceived;
}

- (void)setContentReceived:(BOOL)a3
{
  self->_contentReceived = a3;
}

- (int64_t)preflightCountOfObjects
{
  return self->_preflightCountOfObjects;
}

- (void)setPreflightCountOfObjects:(int64_t)a3
{
  self->_preflightCountOfObjects = a3;
}

- (ICOrderedMediaSet)indexedMediaSet
{
  return self->_indexedMediaSet;
}

- (void)setIndexedMediaSet:(id)a3
{
}

- (NSMutableArray)devContents
{
  return self->_devContents;
}

- (void)setDevContents:(id)a3
{
}

- (NSMutableArray)devMediaFiles
{
  return self->_devMediaFiles;
}

- (void)setDevMediaFiles:(id)a3
{
}

- (unint64_t)devMediaPresentation
{
  return self->_devMediaPresentation;
}

- (void)setDevMediaPresentation:(unint64_t)a3
{
  self->_devMediaPresentation = a3;
}

- (unint64_t)devFailureCount
{
  return self->_devFailureCount;
}

- (void)setDevFailureCount:(unint64_t)a3
{
  self->_devFailureCount = a3;
}

- (NSMutableSet)devCapabilities
{
  return self->_devCapabilities;
}

- (void)setDevCapabilities:(id)a3
{
}

- (unint64_t)devAccessRestriction
{
  return self->_devAccessRestriction;
}

- (void)setDevAccessRestriction:(unint64_t)a3
{
  self->_unint64_t devAccessRestriction = a3;
}

- (unint64_t)devContentCatalogPercentCompleted
{
  return self->_devContentCatalogPercentCompleted;
}

- (void)setDevContentCatalogPercentCompleted:(unint64_t)a3
{
  self->_devContentCatalogPercentCompleted = a3;
}

- (BOOL)notifyDelegateRestrictionChanged
{
  return self->_notifyDelegateRestrictionChanged;
}

- (void)setNotifyDelegateRestrictionChanged:(BOOL)a3
{
  self->_notifyDelegateRestrictionChanged = a3;
}

- (unint64_t)mediaObjectCount
{
  return self->_mediaObjectCount;
}

- (void)setMediaObjectCount:(unint64_t)a3
{
  self->_mediaObjectCount = a3;
}

- (os_unfair_lock_s)mediaLock
{
  return self->_mediaLock;
}

- (void)setMediaLock:(os_unfair_lock_s)a3
{
  self->_mediaLock = a3;
}

- (BOOL)basicMediaModel
{
  return self->_basicMediaModel;
}

- (void)setBasicMediaModel:(BOOL)a3
{
  self->_basicMediaModel = a3;
}

- (NSString)devProductType
{
  return self->_devProductType;
}

- (void)setDevProductType:(id)a3
{
}

- (OS_dispatch_queue)devNotificationQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 448, 1);
}

- (void)setDevNotificationQueue:(id)a3
{
}

- (OS_dispatch_queue)devCommandQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 456, 1);
}

- (void)setDevCommandQueue:(id)a3
{
}

- (OS_dispatch_queue)devWriteQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 464, 1);
}

- (void)setDevWriteQueue:(id)a3
{
}

- (NSXPCConnection)devConnection
{
  return self->_devConnection;
}

- (void)setDevConnection:(id)a3
{
}

- (NSXPCListenerEndpoint)devEndpoint
{
  return self->_devEndpoint;
}

- (void)setDevEndpoint:(id)a3
{
}

- (unint64_t)deviceAccessRestriction
{
  return self->_deviceAccessRestriction;
}

- (void)setDeviceAccessRestriction:(unint64_t)a3
{
  self->_deviceAccessRestriction = a3;
}

- (CGImage)cameraDeviceIcon
{
  return self->_cameraDeviceIcon;
}

- (void)setCameraDeviceIcon:(CGImage *)a3
{
}

- (NSMutableDictionary)mobdevProperties
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 504, 1);
}

- (void)setMobdevProperties:(id)a3
{
}

- (unint64_t)previouslyIndexed
{
  return self->_previouslyIndexed;
}

- (void)setPreviouslyIndexed:(unint64_t)a3
{
  self->_previouslyIndexed = a3;
}

- (BOOL)allowsSyncingClock
{
  return self->_allowsSyncingClock;
}

- (void)setAllowsSyncingClock:(BOOL)a3
{
  self->_allowsSyncingCos_unfair_lock_t lock = a3;
}

- (BOOL)beingEjected
{
  return self->_beingEjected;
}

- (void)setBeingEjected:(BOOL)a3
{
  self->_beingEjected = a3;
}

- (int64_t)enumerationOrder
{
  return self->_enumerationOrder;
}

- (void)setEnumerationOrder:(int64_t)a3
{
  self->_enumerationOrder = a3;
}

- (NSProgress)deleteProgress
{
  return self->_deleteProgress;
}

- (void)setDeleteProgress:(id)a3
{
}

- (NSProgress)downloadProgress
{
  return self->_downloadProgress;
}

- (void)setDownloadProgress:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadProgress, 0);
  objc_storeStrong((id *)&self->_deleteProgress, 0);
  objc_storeStrong((id *)&self->_mobdevProperties, 0);
  objc_storeStrong((id *)&self->_devEndpoint, 0);
  objc_storeStrong((id *)&self->_devConnection, 0);
  objc_storeStrong((id *)&self->_devWriteQueue, 0);
  objc_storeStrong((id *)&self->_devCommandQueue, 0);
  objc_storeStrong((id *)&self->_devNotificationQueue, 0);
  objc_storeStrong((id *)&self->_devProductType, 0);
  objc_storeStrong((id *)&self->_devCapabilities, 0);
  objc_storeStrong((id *)&self->_devMediaFiles, 0);
  objc_storeStrong((id *)&self->_devContents, 0);
  objc_storeStrong((id *)&self->_indexedMediaSet, 0);
  objc_storeStrong(&self->_ptpEventHandler, 0);

  objc_storeStrong((id *)&self->_mountPoint, 0);
}

@end