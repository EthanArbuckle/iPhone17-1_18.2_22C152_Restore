@interface IMDFileTransferCenter
+ (id)fileTransferErrorWithReason:(int64_t)a3 description:(id)a4;
+ (id)localFileURLRetrievalErrorWithReason:(int64_t)a3 description:(id)a4;
+ (id)localFileURLRetrievalErrorWithReason:(int64_t)a3 underlyingReason:(int64_t)a4 description:(id)a5;
+ (id)sharedInstance;
- (BOOL)_hasActiveTransferWithGUID:(id)a3;
- (BOOL)_shouldDownloadAssetForTransfer:(id)a3 forMessageItem:(id)a4;
- (BOOL)markAttachment:(id)a3 sender:(id)a4 recipients:(id)a5 isIncoming:(BOOL)a6;
- (BOOL)populateLocalURLsForTransfer:(id)a3 fromCKRecord:(id)a4;
- (BOOL)registerGUID:(id)a3 forNewOutgoingTransferWithLocalURL:(id)a4;
- (IMDFileTransferCenter)init;
- (NSMutableArray)transferringTransfers;
- (NSMutableDictionary)guidToTransferMap;
- (NSMutableDictionary)localFileURLRetrievalWithGuidCompletionHandlers;
- (NSMutableSet)activeHubbleRequestedTransfers;
- (NSMutableSet)activeTransfers;
- (NSMutableSet)messagesToReindexForPreviewGeneration;
- (NSString)contextStamp;
- (NSTimer)transferTimer;
- (id)_allFileTransfers;
- (id)_attachmentStoreSharedInstance;
- (id)_createWrapperForTransfer:(id)a3;
- (id)_dictionaryRepresentationsForFileTransfers:(id)a3 toSave:(BOOL)a4;
- (id)_findTransferGUIDMatchingSpotlightDonatedSpeculativeTransferGUID:(id)a3;
- (id)_getNewFileTransferForStoredAttachmentPayloadDataWithTransferGUID:(id)a3 messageGUID:(id)a4;
- (id)_messageStoreSharedInstance;
- (id)_progressForTransferGUID:(id)a3 allowCreate:(BOOL)a4 path:(id)a5;
- (id)_removeWrapperForTransfer:(id)a3;
- (id)_retrieveLocalFileURLForFileTransferWithGUID:(id)a3 options:(int64_t)a4 outTransfer:(id *)a5 outError:(id *)a6;
- (id)createNewOutgoingTransferWithLocalFileURL:(id)a3;
- (id)guidForNewIncomingTransferWithFilename:(id)a3 isDirectory:(BOOL)a4 totalBytes:(unint64_t)a5 hfsType:(unsigned int)a6 hfsCreator:(unsigned int)a7 hfsFlags:(unsigned __int16)a8;
- (id)guidForNewOutgoingTransferWithFilename:(id)a3 isDirectory:(BOOL)a4 totalBytes:(unint64_t)a5 hfsType:(unsigned int)a6 hfsCreator:(unsigned int)a7 hfsFlags:(unsigned __int16)a8;
- (id)guidsForStoredAttachmentBlastDoorPayloadData:(id)a3 messageGUID:(id)a4;
- (id)guidsForStoredAttachmentPayloadData:(id)a3 messageGUID:(id)a4;
- (id)guidsForStoredAttachmentPayloadDataURLs:(id)a3 messageGUID:(id)a4;
- (id)transferForGUID:(id)a3;
- (id)updateTransfersWithCKRecord:(id)a3 recordWasFetched:(BOOL)a4 downloadAsset:(BOOL *)a5;
- (void)_addActiveTransfer:(id)a3;
- (void)_addGatekeeperProperties:(id)a3 toDirectory:(id)a4;
- (void)_addTransfer:(id)a3 forGUID:(id)a4 shouldNotify:(BOOL)a5;
- (void)_addTransferringTransfer:(id)a3;
- (void)_completeHubbleDownloadForTransfer:(id)a3;
- (void)_flushMessagesToReindexForPreviewGeneration;
- (void)_handleFileTransfer:(id)a3 acceptedWithPath:(id)a4 autoRename:(BOOL)a5 overwrite:(BOOL)a6 options:(int64_t)a7 postNotification:(BOOL)a8;
- (void)_handleFileTransfer:(id)a3 createdWithProperties:(id)a4 withAuditToken:(id *)a5;
- (void)_handleFileTransfer:(id)a3 updatedWithProperties:(id)a4;
- (void)_handleFileTransfer:(id)a3 updatedWithProperties:(id)a4 isStickerReposition:(BOOL)a5 repositionedLocally:(BOOL)a6;
- (void)_handleFileTransferForStickerRepositionWithGUID:(id)a3 updatedWithProperties:(id)a4 fromLocalChange:(BOOL)a5;
- (void)_handleFileTransferRemoved:(id)a3;
- (void)_handleFileTransferStopped:(id)a3;
- (void)_handleFileTransfers:(id)a3 autoRename:(BOOL)a4 overwrite:(BOOL)a5 options:(int64_t)a6 postNotification:(BOOL)a7;
- (void)_hubbleTransferCompleted:(id)a3 withGUID:(id)a4 error:(id)a5 suggestedRetryGUID:(id)a6;
- (void)_postHubbleDownloadFailedForTransfer:(id)a3 error:(id)a4;
- (void)_postUpdated:(id)a3;
- (void)_previewGenerationFailedNotification:(id)a3;
- (void)_previewGenerationSucceededNotification:(id)a3;
- (void)_reindexTransferIfNeededForPreviewGenerationStateChange:(id)a3 originalPreviewGenerationState:(int64_t)a4;
- (void)_removeActiveTransfer:(id)a3;
- (void)_removeHubbleRequestedTransfer:(id)a3;
- (void)_removeTransferringTransfer:(id)a3;
- (void)_transferTimerTick:(id)a3;
- (void)_updateAndPostCachedTransfer:(id)a3;
- (void)_updateContextStamp;
- (void)_updateTransferGUID:(id)a3 toGUID:(id)a4;
- (void)_updateTransferPreviewGenerationState:(id)a3 newState:(int64_t)a4;
- (void)acceptTransfer:(id)a3 path:(id)a4;
- (void)addHubbleRequestedTransfer:(id)a3;
- (void)addTransfer:(id)a3 forGUID:(id)a4;
- (void)assignTransfer:(id)a3 toAccount:(id)a4 otherPerson:(id)a5;
- (void)broadcastTransfersWithGUIDs:(id)a3 atLocalPaths:(id)a4;
- (void)deleteTransferForGUID:(id)a3;
- (void)endTransfer:(id)a3;
- (void)endTransfer:(id)a3 endState:(int64_t)a4 updateByteCounts:(BOOL)a5;
- (void)failTransfer:(id)a3 error:(id)a4;
- (void)failTransfer:(id)a3 reason:(int64_t)a4;
- (void)failTransferPreviewGeneration:(id)a3;
- (void)generatePreviewForTransfer:(id)a3 messageItem:(id)a4 senderContext:(id)a5;
- (void)makeNewIncomingTransferWithGUID:(id)a3 filename:(id)a4 isDirectory:(BOOL)a5 totalBytes:(unint64_t)a6 hfsType:(unsigned int)a7 hfsCreator:(unsigned int)a8 hfsFlags:(unsigned __int16)a9;
- (void)makeNewOutgoingTransferWithGUID:(id)a3 filename:(id)a4 isDirectory:(BOOL)a5 totalBytes:(unint64_t)a6 hfsType:(unsigned int)a7 hfsCreator:(unsigned int)a8 hfsFlags:(unsigned __int16)a9;
- (void)markTransferAsNotSuccessfullyDownloadedFromCloud:(id)a3;
- (void)markTransferAsNotSyncedSuccessfully:(id)a3;
- (void)postHubbleDownloadFailedIfNeededForTransfer:(id)a3 error:(id)a4;
- (void)postHubbleDownloadFinishedIfNeededForTransfer:(id)a3;
- (void)rejectTransfer:(id)a3;
- (void)removeFinishedTransfers;
- (void)removeTransferForGUID:(id)a3;
- (void)resetSyncStateForRecord:(id)a3 toState:(int64_t)a4;
- (void)resetTransfer:(id)a3 andPostError:(id)a4;
- (void)resetTransfer:(id)a3 andPostReason:(int64_t)a4;
- (void)retrieveLocalFileURLForFileTransferWithGUIDs:(id)a3 options:(int64_t)a4 completion:(id)a5;
- (void)setActiveHubbleRequestedTransfers:(id)a3;
- (void)setActiveTransfers:(id)a3;
- (void)setContextStamp:(id)a3;
- (void)setGuidToTransferMap:(id)a3;
- (void)setLocalFileURLRetrievalWithGuidCompletionHandlers:(id)a3;
- (void)setMessagesToReindexForPreviewGeneration:(id)a3;
- (void)setRecoverableErrorForTransfer:(id)a3 error:(int64_t)a4;
- (void)setTransferTimer:(id)a3;
- (void)setTransferringTransfers:(id)a3;
- (void)setUpdatedStickerUserInfo:(id)a3 forTransfer:(id)a4 repositioningFromLocalChange:(BOOL)a5;
- (void)startFinalizingTransfer:(id)a3;
- (void)startFinalizingTransfer:(id)a3 updateByteCounts:(BOOL)a4;
- (void)startTransfer:(id)a3;
- (void)successfullyGeneratedPreviewForTransfer:(id)a3;
- (void)successfullyGeneratedPreviewForTransfer:(id)a3 withPreviewSize:(CGSize)a4;
- (void)updateTransfer:(id)a3;
- (void)updateTransfer:(id)a3 currentBytes:(unint64_t)a4 totalBytes:(unint64_t)a5;
- (void)updateTransferAsWaitingForAccept:(id)a3;
- (void)updateTransferGUID:(id)a3 toGUID:(id)a4;
@end

@implementation IMDFileTransferCenter

- (id)_dictionaryRepresentationsForFileTransfers:(id)a3 toSave:(BOOL)a4
{
  id v5 = a3;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1D96859E4;
  v8[3] = &unk_1E6B75058;
  BOOL v9 = a4;
  v8[4] = v10;
  v6 = objc_msgSend(v5, "__imArrayByApplyingBlock:", v8);
  _Block_object_dispose(v10, 8);

  return v6;
}

- (id)_allFileTransfers
{
  v3 = [(IMDFileTransferCenter *)self guidToTransferMap];
  v4 = [v3 allValues];

  id v5 = [v4 arrayByApplyingSelector:sel_guid];
  v6 = [(IMDFileTransferCenter *)self _dictionaryRepresentationsForFileTransfers:v4 toSave:0];
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5];

  return v7;
}

+ (id)sharedInstance
{
  if (qword_1EBE2B838 != -1) {
    dispatch_once(&qword_1EBE2B838, &unk_1F3390DA0);
  }
  v2 = (void *)qword_1EBE2B968;

  return v2;
}

- (NSMutableDictionary)guidToTransferMap
{
  return self->_guidToTransferMap;
}

- (NSString)contextStamp
{
  return self->_contextStamp;
}

- (void)addHubbleRequestedTransfer:(id)a3
{
  id v5 = [a3 guid];
  if ([v5 length])
  {
    v4 = [(IMDFileTransferCenter *)self activeHubbleRequestedTransfers];
    [v4 addObject:v5];
  }
}

- (void)_removeHubbleRequestedTransfer:(id)a3
{
  id v7 = [a3 guid];
  if ([v7 length])
  {
    v4 = [(IMDFileTransferCenter *)self activeHubbleRequestedTransfers];
    int v5 = [v4 containsObject:v7];

    if (v5)
    {
      v6 = [(IMDFileTransferCenter *)self activeHubbleRequestedTransfers];
      [v6 removeObject:v7];
    }
  }
}

- (void)postHubbleDownloadFinishedIfNeededForTransfer:(id)a3
{
  id v8 = a3;
  v4 = [v8 guid];
  if (v4)
  {
    int v5 = [(IMDFileTransferCenter *)self activeHubbleRequestedTransfers];
    int v6 = [v5 containsObject:v4];

    if (v6)
    {
      [(IMDFileTransferCenter *)self _removeHubbleRequestedTransfer:v8];
      if ([v8 existsAtLocalPath])
      {
        [(IMDFileTransferCenter *)self _completeHubbleDownloadForTransfer:v8];
      }
      else
      {
        id v7 = +[IMDFileTransferCenter localFileURLRetrievalErrorWithReason:2 description:@"The file transfer does not exist on disk, but the transfer was explicitly ended."];
        [(IMDFileTransferCenter *)self _postHubbleDownloadFailedForTransfer:v8 error:v7];
      }
    }
  }
}

- (void)postHubbleDownloadFailedIfNeededForTransfer:(id)a3 error:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [v10 guid];
  if (v7)
  {
    id v8 = [(IMDFileTransferCenter *)self activeHubbleRequestedTransfers];
    int v9 = [v8 containsObject:v7];

    if (v9)
    {
      [(IMDFileTransferCenter *)self _removeHubbleRequestedTransfer:v10];
      [(IMDFileTransferCenter *)self _postHubbleDownloadFailedForTransfer:v10 error:v6];
    }
  }
}

- (void)_completeHubbleDownloadForTransfer:(id)a3
{
  id v4 = a3;
  id v5 = [v4 guid];
  [(IMDFileTransferCenter *)self _hubbleTransferCompleted:v4 withGUID:v5 error:0 suggestedRetryGUID:0];
}

- (void)_postHubbleDownloadFailedForTransfer:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 guid];
  [(IMDFileTransferCenter *)self _hubbleTransferCompleted:v7 withGUID:v8 error:v6 suggestedRetryGUID:0];
}

- (IMDFileTransferCenter)init
{
  v12.receiver = self;
  v12.super_class = (Class)IMDFileTransferCenter;
  v2 = [(IMDFileTransferCenter *)&v12 init];
  if (v2)
  {
    v3 = [NSString stringGUID];
    [(IMDFileTransferCenter *)v2 setContextStamp:v3];

    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(IMDFileTransferCenter *)v2 setGuidToTransferMap:v4];

    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    [(IMDFileTransferCenter *)v2 setActiveTransfers:v5];

    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(IMDFileTransferCenter *)v2 setTransferringTransfers:v6];

    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    [(IMDFileTransferCenter *)v2 setActiveHubbleRequestedTransfers:v7];

    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    [(IMDFileTransferCenter *)v2 setMessagesToReindexForPreviewGeneration:v8];

    int v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:v2 selector:sel__previewGenerationSucceededNotification_ name:*MEMORY[0x1E4F6EBB8] object:0];

    id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v2 selector:sel__previewGenerationFailedNotification_ name:*MEMORY[0x1E4F6EBB0] object:0];
  }
  return v2;
}

- (id)_progressForTransferGUID:(id)a3 allowCreate:(BOOL)a4 path:(id)a5
{
  return 0;
}

- (void)_updateContextStamp
{
  id v3 = [NSString stringGUID];
  [(IMDFileTransferCenter *)self setContextStamp:v3];
}

- (void)_postUpdated:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    [(IMDFileTransferCenter *)self _updateContextStamp];
    id v5 = +[IMDBroadcastController sharedProvider];
    id v6 = [v5 broadcasterForFileTransferListeners];
    id v7 = [v4 guid];
    id v8 = [v4 _dictionaryRepresentation];
    [v6 fileTransfer:v7 updatedWithProperties:v8];

    id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    objc_msgSend(v9, "__mainThreadPostNotificationName:object:", @"__kIMDFileTransferUpdatedNotification", v4);
  }
}

+ (id)fileTransferErrorWithReason:(int64_t)a3 description:(id)a4
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v6 = *MEMORY[0x1E4F6D430];
  v16[0] = *MEMORY[0x1E4F28568];
  id v7 = (void *)MEMORY[0x1E4F28B50];
  id v8 = a4;
  id v9 = [v7 mainBundle];
  id v10 = [v9 localizedStringForKey:@"File transfer operation was unsuccessful." value:&stru_1F3398578 table:0];
  v17[0] = v10;
  v16[1] = *MEMORY[0x1E4F28588];
  v11 = [MEMORY[0x1E4F28B50] mainBundle];
  objc_super v12 = [v11 localizedStringForKey:v8 value:&stru_1F3398578 table:0];

  v17[1] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  v14 = [v5 errorWithDomain:v6 code:a3 userInfo:v13];

  return v14;
}

+ (id)localFileURLRetrievalErrorWithReason:(int64_t)a3 description:(id)a4
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v6 = *MEMORY[0x1E4F6D438];
  v16[0] = *MEMORY[0x1E4F28568];
  id v7 = (void *)MEMORY[0x1E4F28B50];
  id v8 = a4;
  id v9 = [v7 mainBundle];
  id v10 = [v9 localizedStringForKey:@"File transfer local file URL retrieval operation was unsuccessful." value:&stru_1F3398578 table:0];
  v17[0] = v10;
  v16[1] = *MEMORY[0x1E4F28588];
  v11 = [MEMORY[0x1E4F28B50] mainBundle];
  objc_super v12 = [v11 localizedStringForKey:v8 value:&stru_1F3398578 table:0];

  v17[1] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  v14 = [v5 errorWithDomain:v6 code:a3 userInfo:v13];

  return v14;
}

+ (id)localFileURLRetrievalErrorWithReason:(int64_t)a3 underlyingReason:(int64_t)a4 description:(id)a5
{
  v21[3] = *MEMORY[0x1E4F143B8];
  id v8 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = *MEMORY[0x1E4F6D438];
  v20[0] = *MEMORY[0x1E4F28568];
  id v10 = (void *)MEMORY[0x1E4F28B50];
  id v11 = a5;
  objc_super v12 = [v10 mainBundle];
  v13 = [v12 localizedStringForKey:@"File transfer local file URL retrieval operation was unsuccessful." value:&stru_1F3398578 table:0];
  v21[0] = v13;
  v20[1] = *MEMORY[0x1E4F28588];
  v14 = [MEMORY[0x1E4F28B50] mainBundle];
  v15 = [v14 localizedStringForKey:v11 value:&stru_1F3398578 table:0];

  v21[1] = v15;
  v20[2] = *MEMORY[0x1E4F28A50];
  v16 = [a1 fileTransferErrorWithReason:a4 description:@"See error code and compare against IMFileTransferErrorReason."];
  v21[2] = v16;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:3];
  v18 = [v8 errorWithDomain:v9 code:a3 userInfo:v17];

  return v18;
}

- (void)_addGatekeeperProperties:(id)a3 toDirectory:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(IMDFileTransferCenter *)self _addGatekeeperProperties:v6 toFileAtPath:v7];
  id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v9 = [v8 enumeratorAtPath:v7];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = objc_msgSend(v7, "stringByAppendingPathComponent:", *(void *)(*((void *)&v16 + 1) + 8 * v14), (void)v16);
        [(IMDFileTransferCenter *)self _addGatekeeperProperties:v6 toFileAtPath:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v12);
  }
}

- (id)_createWrapperForTransfer:(id)a3
{
  id v4 = a3;
  int v5 = [v4 _needsWrapper];
  id v6 = [v4 localURL];
  id v7 = v6;
  if (v5)
  {
    id v8 = [v6 path];

    uint64_t v9 = [v8 stringByDeletingLastPathComponent];
    id v10 = [v8 lastPathComponent];
    uint64_t v11 = [v10 stringByDeletingPathExtension];
    uint64_t v12 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v13 = [v12 createUniqueDirectoryWithName:v11 atPath:v9 ofType:*MEMORY[0x1E4F6D470]];

    if (v13)
    {
      uint64_t v14 = [v13 stringByAppendingPathComponent:*MEMORY[0x1E4F6D478]];
      v15 = [v4 guid];
      uint64_t v19 = 0;
      [v15 writeToFile:v14 atomically:1 encoding:4 error:&v19];
      uint64_t v16 = v19;

      if (v16)
      {

        uint64_t v13 = 0;
      }
    }
    long long v17 = [v13 stringByAppendingPathComponent:v10];
    [(IMDFileTransferCenter *)self _updateContextStamp];
    if (v17)
    {
      id v7 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v17];
    }
    else
    {
      id v7 = 0;
    }
  }

  return v7;
}

- (id)_removeWrapperForTransfer:(id)a3
{
  id v4 = a3;
  [(IMDFileTransferCenter *)self _updateContextStamp];
  int v5 = [v4 localURL];

  return v5;
}

- (void)_addActiveTransfer:(id)a3
{
  id v5 = a3;
  if ([v5 length])
  {
    id v4 = [(IMDFileTransferCenter *)self activeTransfers];
    [v4 addObject:v5];

    [(IMDFileTransferCenter *)self _updateContextStamp];
  }
}

- (BOOL)_hasActiveTransferWithGUID:(id)a3
{
  id v4 = a3;
  id v5 = [(IMDFileTransferCenter *)self activeTransfers];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (void)_removeActiveTransfer:(id)a3
{
  id v7 = a3;
  if ([v7 length])
  {
    id v4 = [(IMDFileTransferCenter *)self activeTransfers];
    int v5 = [v4 containsObject:v7];

    if (v5)
    {
      char v6 = [(IMDFileTransferCenter *)self activeTransfers];
      [v6 removeObject:v7];
    }
    [(IMDFileTransferCenter *)self _updateContextStamp];
  }
}

- (void)_addTransferringTransfer:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    int v5 = [(IMDFileTransferCenter *)self transferringTransfers];
    uint64_t v6 = [v5 count];

    if (!v6)
    {
      id v7 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__transferTimerTick_ selector:0 userInfo:1 repeats:0.25];
      [(IMDFileTransferCenter *)self setTransferTimer:v7];
    }
    id v8 = [(IMDFileTransferCenter *)self transferringTransfers];
    [v8 addObject:v4];
  }
}

- (void)_removeTransferringTransfer:(id)a3
{
  id v10 = a3;
  if (v10)
  {
    id v4 = [(IMDFileTransferCenter *)self transferringTransfers];
    int v5 = [v4 containsObject:v10];

    if (v5)
    {
      uint64_t v6 = [(IMDFileTransferCenter *)self transferringTransfers];
      [v6 removeObject:v10];

      id v7 = [(IMDFileTransferCenter *)self transferringTransfers];
      uint64_t v8 = [v7 count];

      if (!v8)
      {
        uint64_t v9 = [(IMDFileTransferCenter *)self transferTimer];
        [v9 invalidate];

        [(IMDFileTransferCenter *)self setTransferTimer:0];
      }
    }
  }
}

- (void)_transferTimerTick:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v3 = [(IMDFileTransferCenter *)self transferringTransfers];
  id v4 = (void *)[v3 _copyForEnumerating];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        unint64_t v10 = [v9 averageTransferRate];
        unint64_t v11 = [v9 currentBytes];
        uint64_t v12 = [MEMORY[0x1E4F1C9C8] date];
        [v12 timeIntervalSince1970];
        double v14 = v13;

        [v9 _lastAveragedInterval];
        if (v14 - v15 > 1.0)
        {
          double v16 = (double)(unint64_t)[v9 averageTransferRate];
          unint64_t v10 = (unint64_t)(v16
                                 + ((double)v11 - (double)(unint64_t)[v9 _lastAveragedBytes] - v16)
                                 * 0.333333333);
          [v9 _setAveragedTransferRate:v10 lastAveragedInterval:v11 lastAveragedBytes:v14];
        }
        [v9 _setLastUpdatedInterval:v14];
        long long v17 = +[IMDBroadcastController sharedProvider];
        long long v18 = [v17 broadcasterForFileTransferListeners];
        uint64_t v19 = [v9 guid];
        objc_msgSend(v18, "fileTransfer:updatedWithCurrentBytes:totalBytes:averageTransferRate:", v19, v11, objc_msgSend(v9, "totalBytes"), v10);
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v6);
  }
}

- (void)makeNewIncomingTransferWithGUID:(id)a3 filename:(id)a4 isDirectory:(BOOL)a5 totalBytes:(unint64_t)a6 hfsType:(unsigned int)a7 hfsCreator:(unsigned int)a8 hfsFlags:(unsigned __int16)a9
{
  BOOL v12 = a5;
  id v21 = a3;
  id v15 = a4;
  if ([v21 length])
  {
    id v16 = objc_alloc(MEMORY[0x1E4F6E780]);
    long long v17 = [v15 lastPathComponent];
    BYTE2(v20) = 1;
    LOWORD(v20) = a9;
    long long v18 = objc_msgSend(v16, "_initWithGUID:filename:isDirectory:localURL:account:otherPerson:totalBytes:hfsType:hfsCreator:hfsFlags:isIncoming:", v21, v17, v12, 0, 0, 0, a6, __PAIR64__(a8, a7), v20);

    uint64_t v19 = [(IMDFileTransferCenter *)self guidToTransferMap];
    [v19 setObject:v18 forKeyedSubscript:v21];
  }
}

- (id)createNewOutgoingTransferWithLocalFileURL:(id)a3
{
  id v3 = NSString;
  id v4 = a3;
  uint64_t v5 = [v3 stringGUID];
  uint64_t v6 = [v4 path];
  uint64_t v7 = [MEMORY[0x1E4F6C348] defaultHFSFileManager];
  uint64_t v21 = 0;
  uint64_t v8 = [v7 attributesOfItemAtPath:v6 error:&v21];

  uint64_t v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F283B8]];
  uint64_t v10 = [v9 isEqual:*MEMORY[0x1E4F283C0]];

  id v11 = objc_alloc(MEMORY[0x1E4F6E780]);
  BOOL v12 = [v6 lastPathComponent];
  uint64_t v13 = [v8 fileSize];
  unsigned int v14 = [v8 fileHFSTypeCode];
  unsigned int v15 = [v8 fileHFSCreatorCode];
  BYTE2(v19) = 0;
  LOWORD(v19) = [v8 fileHFSFlags];
  id v16 = objc_msgSend(v11, "_initWithGUID:filename:isDirectory:localURL:account:otherPerson:totalBytes:hfsType:hfsCreator:hfsFlags:isIncoming:", v5, v12, v10, v4, 0, 0, v13, __PAIR64__(v15, v14), v19);

  long long v17 = [(IMDFileTransferCenter *)self guidToTransferMap];
  [v17 setObject:v16 forKeyedSubscript:v5];

  return v5;
}

- (void)broadcastTransfersWithGUIDs:(id)a3 atLocalPaths:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v8 = +[IMDBroadcastController sharedProvider];
  uint64_t v7 = [v8 broadcasterForFileTransferListeners];
  [v7 fileTransfers:v6 createdWithLocalPaths:v5];
}

- (void)makeNewOutgoingTransferWithGUID:(id)a3 filename:(id)a4 isDirectory:(BOOL)a5 totalBytes:(unint64_t)a6 hfsType:(unsigned int)a7 hfsCreator:(unsigned int)a8 hfsFlags:(unsigned __int16)a9
{
  BOOL v12 = a5;
  id v19 = a3;
  id v15 = a4;
  if ([v19 length])
  {
    BYTE2(v18) = 0;
    LOWORD(v18) = a9;
    id v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F6E780]), "_initWithGUID:filename:isDirectory:localURL:account:otherPerson:totalBytes:hfsType:hfsCreator:hfsFlags:isIncoming:", v19, v15, v12, 0, 0, 0, a6, __PAIR64__(a8, a7), v18);
    long long v17 = [(IMDFileTransferCenter *)self guidToTransferMap];
    [v17 setObject:v16 forKeyedSubscript:v19];
  }
}

- (id)guidForNewIncomingTransferWithFilename:(id)a3 isDirectory:(BOOL)a4 totalBytes:(unint64_t)a5 hfsType:(unsigned int)a6 hfsCreator:(unsigned int)a7 hfsFlags:(unsigned __int16)a8
{
  uint64_t v9 = *(void *)&a7;
  uint64_t v10 = *(void *)&a6;
  BOOL v12 = a4;
  unsigned int v14 = NSString;
  id v15 = a3;
  id v16 = [v14 stringGUID];
  long long v17 = [v15 lastPathComponent];

  LOWORD(v19) = a8;
  [(IMDFileTransferCenter *)self makeNewIncomingTransferWithGUID:v16 filename:v17 isDirectory:v12 totalBytes:a5 hfsType:v10 hfsCreator:v9 hfsFlags:v19];

  return v16;
}

- (id)guidForNewOutgoingTransferWithFilename:(id)a3 isDirectory:(BOOL)a4 totalBytes:(unint64_t)a5 hfsType:(unsigned int)a6 hfsCreator:(unsigned int)a7 hfsFlags:(unsigned __int16)a8
{
  uint64_t v9 = *(void *)&a7;
  uint64_t v10 = *(void *)&a6;
  BOOL v12 = a4;
  unsigned int v14 = NSString;
  id v15 = a3;
  id v16 = [v14 stringGUID];
  LOWORD(v18) = a8;
  [(IMDFileTransferCenter *)self makeNewOutgoingTransferWithGUID:v16 filename:v15 isDirectory:v12 totalBytes:a5 hfsType:v10 hfsCreator:v9 hfsFlags:v18];

  return v16;
}

- (BOOL)registerGUID:(id)a3 forNewOutgoingTransferWithLocalURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 length];
  if (v8)
  {
    uint64_t v9 = [v7 path];
    uint64_t v10 = [MEMORY[0x1E4F6C348] defaultHFSFileManager];
    uint64_t v23 = 0;
    id v11 = [v10 attributesOfItemAtPath:v9 error:&v23];

    BOOL v12 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F283B8]];
    uint64_t v13 = [v12 isEqual:*MEMORY[0x1E4F283C0]];

    unsigned int v14 = [(IMDFileTransferCenter *)self transferForGUID:v6];
    if (!v14)
    {
      id v22 = objc_alloc(MEMORY[0x1E4F6E780]);
      id v15 = [v9 lastPathComponent];
      uint64_t v21 = [v11 fileSize];
      unsigned int v16 = [v11 fileHFSTypeCode];
      unsigned int v17 = [v11 fileHFSCreatorCode];
      BYTE2(v20) = 0;
      LOWORD(v20) = [v11 fileHFSFlags];
      unsigned int v14 = objc_msgSend(v22, "_initWithGUID:filename:isDirectory:localURL:account:otherPerson:totalBytes:hfsType:hfsCreator:hfsFlags:isIncoming:", v6, v15, v13, v7, 0, 0, v21, __PAIR64__(v17, v16), v20);
    }
    uint64_t v18 = [(IMDFileTransferCenter *)self guidToTransferMap];
    [v18 setObject:v14 forKeyedSubscript:v6];
  }
  return v8 != 0;
}

- (void)assignTransfer:(id)a3 toAccount:(id)a4 otherPerson:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v16 length])
  {
    uint64_t v10 = [(IMDFileTransferCenter *)self transferForGUID:v16];
    id v11 = v10;
    if (v10)
    {
      [v10 _setAccount:v8 otherPerson:v9];
      BOOL v12 = +[IMDBroadcastController sharedProvider];
      uint64_t v13 = [v12 broadcasterForFileTransferListeners];
      unsigned int v14 = [v11 guid];
      id v15 = [v11 _dictionaryRepresentation];
      [v13 fileTransfer:v14 createdWithProperties:v15];

      [(IMDFileTransferCenter *)self _updateContextStamp];
    }
  }
}

- (void)addTransfer:(id)a3 forGUID:(id)a4
{
}

- (void)_addTransfer:(id)a3 forGUID:(id)a4 shouldNotify:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  if (v8)
  {
    if (a4)
    {
      id v17 = v8;
      id v9 = a4;
      uint64_t v10 = [(IMDFileTransferCenter *)self guidToTransferMap];
      id v11 = [v10 objectForKeyedSubscript:v9];

      BOOL v12 = [(IMDFileTransferCenter *)self guidToTransferMap];
      [v12 setObject:v17 forKeyedSubscript:v9];

      id v8 = v17;
      if (v5)
      {
        if (v11)
        {
          [(IMDFileTransferCenter *)self _postUpdated:v17];
        }
        else
        {
          uint64_t v13 = +[IMDBroadcastController sharedProvider];
          unsigned int v14 = [v13 broadcasterForFileTransferListeners];
          id v15 = [v17 guid];
          id v16 = [v17 _dictionaryRepresentation];
          [v14 fileTransfer:v15 createdWithProperties:v16];
        }
        id v8 = v17;
      }
    }
  }
}

- (id)transferForGUID:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    BOOL v5 = [(IMDFileTransferCenter *)self guidToTransferMap];
    id v6 = [v5 objectForKeyedSubscript:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)removeTransferForGUID:(id)a3
{
  id v5 = a3;
  if ([v5 length])
  {
    id v4 = [(IMDFileTransferCenter *)self guidToTransferMap];
    [v4 setObject:0 forKeyedSubscript:v5];
  }
}

- (void)deleteTransferForGUID:(id)a3
{
  id v5 = a3;
  if ([v5 length])
  {
    [(IMDFileTransferCenter *)self _handleFileTransferRemoved:v5];
    id v4 = +[IMDAttachmentStore sharedInstance];
    [v4 deleteAttachmentWithGUID:v5];
  }
}

- (void)updateTransferGUID:(id)a3 toGUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    [(IMDFileTransferCenter *)self _updateTransferGUID:v6 toGUID:v7];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1D971CA14;
    block[3] = &unk_1E6B73BC8;
    block[4] = self;
    id v9 = v6;
    id v10 = v7;
    dispatch_sync(MEMORY[0x1E4F14428], block);
  }
}

- (void)_updateTransferGUID:(id)a3 toGUID:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IMDFileTransferCenter *)self guidToTransferMap];
  id v9 = [v8 objectForKeyedSubscript:v6];

  if (v9)
  {
    id v10 = IMLogHandleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412546;
      id v15 = v6;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_DEFAULT, "FileTransferCenter updating guid for transfer in cache map:%@ to %@", (uint8_t *)&v14, 0x16u);
    }

    uint64_t v11 = [v7 copy];
    [v9 setGuid:v11];
    BOOL v12 = [(IMDFileTransferCenter *)self guidToTransferMap];
    [v12 setObject:0 forKeyedSubscript:v6];

    uint64_t v13 = [(IMDFileTransferCenter *)self guidToTransferMap];
    [v13 setObject:v9 forKeyedSubscript:v11];

    id v7 = (id)v11;
  }
}

- (void)startTransfer:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [v9 length];
  id v5 = v9;
  if (v4)
  {
    id v6 = [(IMDFileTransferCenter *)self transferForGUID:v9];
    id v7 = v6;
    if (v6 && ([v6 transferState] < 2 || objc_msgSend(v7, "transferState") == 6))
    {
      [(IMDFileTransferCenter *)self _addActiveTransfer:v9];
      [v7 _setTransferState:2];
      [v7 _setError:-1];
      [(IMDFileTransferCenter *)self _postUpdated:v7];
      if ([v7 isIncoming])
      {
        id v8 = [(IMDFileTransferCenter *)self _createWrapperForTransfer:v7];
        if (v8)
        {
          [v7 _setLocalURL:v8];
          [(IMDFileTransferCenter *)self _postUpdated:v7];
        }
        else
        {
          [(IMDFileTransferCenter *)self resetTransfer:v9 andPostReason:20];
        }
      }
      [(IMDFileTransferCenter *)self _updateContextStamp];
    }

    id v5 = v9;
  }
}

- (void)updateTransfer:(id)a3 currentBytes:(unint64_t)a4 totalBytes:(unint64_t)a5
{
  id v13 = a3;
  uint64_t v8 = [v13 length];
  id v9 = v13;
  if (v8)
  {
    id v10 = [(IMDFileTransferCenter *)self transferForGUID:v13];
    uint64_t v11 = v10;
    if (v10)
    {
      if ([v10 transferState] > 2)
      {
        [v11 _setCurrentBytes:a4 totalBytes:a5];
      }
      else
      {
        [v11 _setTransferState:3];
        BOOL v12 = [MEMORY[0x1E4F1C9C8] date];
        [v11 _setStartDate:v12];

        [(IMDFileTransferCenter *)self _addTransferringTransfer:v11];
        [v11 _setCurrentBytes:a4 totalBytes:a5];
        [(IMDFileTransferCenter *)self _postUpdated:v11];
      }
      [(IMDFileTransferCenter *)self _updateContextStamp];
    }

    id v9 = v13;
  }
}

- (void)updateTransfer:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [v7 length];
  id v5 = v7;
  if (v4)
  {
    id v6 = [(IMDFileTransferCenter *)self transferForGUID:v7];
    if (v6)
    {
      [(IMDFileTransferCenter *)self _postUpdated:v6];
      [(IMDFileTransferCenter *)self _updateContextStamp];
    }

    id v5 = v7;
  }
}

- (void)updateTransferAsWaitingForAccept:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v9 = v4;
    [v4 _setTransferState:0];
    id v5 = [v9 guid];
    id v6 = [(IMDFileTransferCenter *)self transferForGUID:v5];

    if (v6)
    {
      [v6 _setTransferState:0];
      id v7 = [(IMDFileTransferCenter *)self _attachmentStoreSharedInstance];
      [v7 updateAttachment:v6];
      id v8 = v6;
    }
    else
    {
      id v7 = [(IMDFileTransferCenter *)self _attachmentStoreSharedInstance];
      [v7 updateAttachment:v9];
      id v8 = v9;
    }

    [(IMDFileTransferCenter *)self _postUpdated:v8];
    id v4 = v9;
  }
}

- (void)startFinalizingTransfer:(id)a3
{
}

- (void)startFinalizingTransfer:(id)a3 updateByteCounts:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 length])
  {
    id v7 = [(IMDFileTransferCenter *)self transferForGUID:v6];
    id v8 = v7;
    if (v7)
    {
      if ([v7 transferState] <= 3)
      {
        [v8 _setTransferState:4];
        if (v4) {
          objc_msgSend(v8, "_setCurrentBytes:totalBytes:", objc_msgSend(v8, "totalBytes"), objc_msgSend(v8, "totalBytes"));
        }
        [(IMDFileTransferCenter *)self _postUpdated:v8];
        if ([v8 isIncoming])
        {
          id v9 = [(IMDFileTransferCenter *)self _removeWrapperForTransfer:v8];
          if (v9)
          {
            [v8 _setLocalURL:v9];
            id v10 = [v9 path];
            uint64_t v11 = [MEMORY[0x1E4F6C348] defaultHFSFileManager];
            uint64_t v17 = 0;
            BOOL v12 = [v11 attributesOfItemAtPath:v10 error:&v17];

            if (v12)
            {
              id v13 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F283B8]];
              uint64_t v14 = [v13 isEqual:*MEMORY[0x1E4F283C0]];

              objc_msgSend(v8, "_setDirectory:hfsType:hfsCreator:hfsFlags:", v14, objc_msgSend(v12, "fileHFSTypeCode"), objc_msgSend(v12, "fileHFSCreatorCode"), objc_msgSend(v12, "fileHFSFlags"));
              if (v4)
              {
                id v15 = [v12 objectForKey:*MEMORY[0x1E4F28390]];
                if (v15)
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    uint64_t v16 = [v15 unsignedLongLongValue];
                    [v8 _setCurrentBytes:v16 totalBytes:v16];
                  }
                }
              }
            }
            [(IMDFileTransferCenter *)self _postUpdated:v8];
          }
          else
          {
            [(IMDFileTransferCenter *)self resetTransfer:v6 andPostReason:20];
          }
        }
        [(IMDFileTransferCenter *)self _removeActiveTransfer:v6];
        [(IMDFileTransferCenter *)self _removeTransferringTransfer:v8];
      }
      [(IMDFileTransferCenter *)self _updateContextStamp];
    }
  }
}

- (void)endTransfer:(id)a3
{
}

- (void)endTransfer:(id)a3 endState:(int64_t)a4 updateByteCounts:(BOOL)a5
{
  BOOL v5 = a5;
  id v11 = a3;
  if ([v11 length])
  {
    [(IMDFileTransferCenter *)self startFinalizingTransfer:v11 updateByteCounts:v5];
    id v8 = [(IMDFileTransferCenter *)self transferForGUID:v11];
    if ([v8 thumbnailMode]) {
      objc_msgSend(v8, "setThumbnailMode:", objc_msgSend(v8, "thumbnailModeAfterDownloadSuccess:", 1));
    }
    if (([v8 isFinished] & 1) == 0)
    {
      [v8 setCloudKitSyncState:0];
      [v8 _setTransferState:a4];
      [(IMDFileTransferCenter *)self _postUpdated:v8];
      if ((IMIsRunningInUnitTesting() & 1) == 0)
      {
        id v9 = +[IMDAttachmentStore sharedInstance];
        [v9 storeAttachment:v8 associateWithMessageWithGUID:0];
      }
      id v10 = [v8 localPath];
      [(IMDFileTransferCenter *)self _addSpotlightPropertiesFromFileTransfer:v8 toDirectory:v10];
    }
    [(IMDFileTransferCenter *)self _updateContextStamp];
    [(IMDFileTransferCenter *)self _completeProgressForTransferGUID:v11];
    [(IMDFileTransferCenter *)self postHubbleDownloadFinishedIfNeededForTransfer:v8];
  }
}

- (void)failTransfer:(id)a3 reason:(int64_t)a4
{
  id v12 = a3;
  if ([v12 length])
  {
    id v6 = [(IMDFileTransferCenter *)self transferForGUID:v12];
    if ([v6 thumbnailMode]) {
      objc_msgSend(v6, "setThumbnailMode:", objc_msgSend(v6, "thumbnailModeAfterDownloadSuccess:", 0));
    }
    if (v6 && [v6 transferState] != 6)
    {
      [(IMDFileTransferCenter *)self _removeActiveTransfer:v12];
      [(IMDFileTransferCenter *)self _removeTransferringTransfer:v6];
      if (a4 == -1) {
        a4 = 15;
      }
      [v6 _setTransferState:6];
      [v6 _setError:a4];
      [(IMDFileTransferCenter *)self _postUpdated:v6];
      id v7 = +[IMDAttachmentStore sharedInstance];
      [v7 storeAttachment:v6 associateWithMessageWithGUID:0];
    }
    [(IMDFileTransferCenter *)self _clearProgressForTransferGUID:v12];
    id v8 = NSString;
    id v9 = [v6 errorDescription];
    id v10 = [v8 stringWithFormat:@"Transfer failed. See underlying error. transfer.errorDescription:%@", v9];
    id v11 = +[IMDFileTransferCenter localFileURLRetrievalErrorWithReason:3 underlyingReason:a4 description:v10];
    [(IMDFileTransferCenter *)self postHubbleDownloadFailedIfNeededForTransfer:v6 error:v11];
  }
}

- (void)resetTransfer:(id)a3 andPostReason:(int64_t)a4
{
  id v12 = a3;
  if ([v12 length])
  {
    id v6 = [(IMDFileTransferCenter *)self transferForGUID:v12];
    id v7 = NSString;
    id v8 = [v6 errorDescription];
    id v9 = [v7 stringWithFormat:@"Transfer was reset. See underlying error. transfer.errorDescription:%@", v8];
    id v10 = +[IMDFileTransferCenter localFileURLRetrievalErrorWithReason:4 underlyingReason:a4 description:v9];

    id v11 = [v6 guid];
    [(IMDFileTransferCenter *)self resetTransfer:v11 andPostError:v10];
  }
}

- (void)resetTransfer:(id)a3 andPostError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    id v8 = [(IMDFileTransferCenter *)self transferForGUID:v6];
    uint64_t v9 = [v8 finalTransferStateForSuccess:0];
    uint64_t v10 = [v8 thumbnailMode];
    if (v10) {
      [v8 setThumbnailMode:v10 - 1];
    }
    if (v8 && [v8 transferState] != 6)
    {
      id v11 = IMLogHandleForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_DEFAULT, "IMDFileTransfer posting recoverable error state for IMFileTransfer", buf, 2u);
      }

      [v8 _setTransferState:7];
      id v12 = v7;
      id v13 = [v12 domain];
      char v14 = [v13 isEqualToString:*MEMORY[0x1E4F6DEF8]];

      if (v14)
      {
        uint64_t v15 = 15;
      }
      else if (v12)
      {
        uint64_t v16 = [v12 code];
        uint64_t v17 = 26;
        if (v16 != 9) {
          uint64_t v17 = 15;
        }
        if ((unint64_t)(v16 - 26) >= 2) {
          uint64_t v15 = v17;
        }
        else {
          uint64_t v15 = 13;
        }
      }
      else
      {
        uint64_t v15 = -1;
      }

      [v8 _setError:v15];
      [(IMDFileTransferCenter *)self _postUpdated:v8];
      uint64_t v18 = IMLogHandleForCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v20 = 0;
        _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_DEFAULT, "IMDFileTransfer reset file transfer to waiting state", v20, 2u);
      }

      [v8 _setTransferState:v9];
      [v8 _setError:-1];
      [(IMDFileTransferCenter *)self _postUpdated:v8];
      uint64_t v19 = +[IMDAttachmentStore sharedInstance];
      [v19 storeAttachment:v8 associateWithMessageWithGUID:0];
    }
    [(IMDFileTransferCenter *)self _clearProgressForTransferGUID:v6];
    [(IMDFileTransferCenter *)self postHubbleDownloadFailedIfNeededForTransfer:v8 error:v7];
  }
}

- (void)_updateTransferPreviewGenerationState:(id)a3 newState:(int64_t)a4
{
  id v6 = [(IMDFileTransferCenter *)self transferForGUID:a3];
  if (v6)
  {
    id v9 = v6;
    uint64_t v7 = [v6 previewGenerationState];
    [v9 setPreviewGenerationState:a4];
    [v9 setPreviewGenerationVersion:*MEMORY[0x1E4F6EBC8]];
    id v8 = +[IMDAttachmentStore sharedInstance];
    [v8 updateAttachment:v9];

    [(IMDFileTransferCenter *)self _reindexTransferIfNeededForPreviewGenerationStateChange:v9 originalPreviewGenerationState:v7];
    [(IMDFileTransferCenter *)self _postUpdated:v9];
    id v6 = v9;
  }
}

- (void)_reindexTransferIfNeededForPreviewGenerationStateChange:(id)a3 originalPreviewGenerationState:(int64_t)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 type];
  [v5 previewGenerationState];
  int v7 = IMShouldReindexUTITypeWithPreviewGenerationState();

  if (v7)
  {
    id v8 = [v5 guid];
    id v9 = (void *)IMDAttachmentRecordCopyMessageForAttachmentGUID();

    uint64_t v10 = [v9 guid];

    int v11 = IMOSLoggingEnabled();
    if (v10)
    {
      if (v11)
      {
        id v12 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          id v13 = [v5 guid];
          char v14 = [v9 guid];
          int v19 = 138412546;
          uint64_t v20 = v13;
          __int16 v21 = 2112;
          id v22 = v14;
          _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Transfer GUID %@ from message %@ should be re-indexed due to preview generation state change", (uint8_t *)&v19, 0x16u);
        }
      }
      uint64_t v15 = [(IMDFileTransferCenter *)self messagesToReindexForPreviewGeneration];
      uint64_t v16 = [v9 guid];
      [v15 addObject:v16];

      [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__flushMessagesToReindexForPreviewGeneration object:0];
      [(IMDFileTransferCenter *)self performSelector:sel__flushMessagesToReindexForPreviewGeneration withObject:0 afterDelay:3.0];
    }
    else if (v11)
    {
      uint64_t v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        uint64_t v18 = [v5 guid];
        int v19 = 138412290;
        uint64_t v20 = v18;
        _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "Transfer GUID %@ should be re-indexed due to preview generation state change, but has not been persisted to the database yet. It will be indexed once the message is stored.", (uint8_t *)&v19, 0xCu);
      }
    }
  }
}

- (void)_flushMessagesToReindexForPreviewGeneration
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = [(IMDFileTransferCenter *)self messagesToReindexForPreviewGeneration];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = [(IMDFileTransferCenter *)self messagesToReindexForPreviewGeneration];
    id v6 = [v5 allObjects];

    int v7 = [(IMDFileTransferCenter *)self messagesToReindexForPreviewGeneration];
    [v7 removeAllObjects];

    if (IMOSLoggingEnabled())
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v12 = [v6 count];
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Re-indexing %ld messages due to preview generation state change", buf, 0xCu);
      }
    }
    uint64_t v10 = v6;
    id v9 = v6;
    IMDCoreSpotlightReindexMessagesWhileBlocking();
  }
}

- (void)failTransferPreviewGeneration:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = IMLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_DEFAULT, "Marking transfer %@ as failing preview generation", (uint8_t *)&v6, 0xCu);
  }

  [(IMDFileTransferCenter *)self _updateTransferPreviewGenerationState:v4 newState:2];
}

- (void)successfullyGeneratedPreviewForTransfer:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = IMLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_DEFAULT, "Marking transfer %@ as succeeding preview generation", (uint8_t *)&v6, 0xCu);
  }

  [(IMDFileTransferCenter *)self _updateTransferPreviewGenerationState:v4 newState:1];
}

- (void)_previewGenerationSucceededNotification:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 object];
  if ([MEMORY[0x1E4F6E700] ignorePreviewGenerationNotifications])
  {
    if (IMOSLoggingEnabled())
    {
      int v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        LODWORD(v12) = 138412290;
        *(void *)((char *)&v12 + 4) = v5;
        _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "Preview generation succeeded for transfer %@, but ignoring due to override", (uint8_t *)&v12, 0xCu);
      }
    }
  }
  else
  {
    id v7 = [v4 userInfo];
    uint64_t v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F6EBC0]];
    id v9 = v8;
    long long v12 = 0uLL;
    if (v8)
    {
      [v8 getValue:&v12 size:16];
      double v10 = *((double *)&v12 + 1);
      double v11 = *(double *)&v12;
    }
    else
    {
      double v10 = 0.0;
      double v11 = 0.0;
    }

    -[IMDFileTransferCenter successfullyGeneratedPreviewForTransfer:withPreviewSize:](self, "successfullyGeneratedPreviewForTransfer:withPreviewSize:", v5, v11, v10);
  }
}

- (void)_previewGenerationFailedNotification:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 object];
  if ([MEMORY[0x1E4F6E700] ignorePreviewGenerationNotifications])
  {
    if (IMOSLoggingEnabled())
    {
      int v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v7 = 138412290;
        uint64_t v8 = v5;
        _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "Preview generation failed for transfer %@, but ignoring due to override", (uint8_t *)&v7, 0xCu);
      }
    }
  }
  else
  {
    [(IMDFileTransferCenter *)self failTransferPreviewGeneration:v5];
  }
}

- (void)rejectTransfer:(id)a3
{
  id v10 = a3;
  if ([v10 length])
  {
    id v4 = [(IMDFileTransferCenter *)self transferForGUID:v10];
    if (v4)
    {
      [(IMDFileTransferCenter *)self _removeActiveTransfer:v10];
      [(IMDFileTransferCenter *)self _removeTransferringTransfer:v4];
      [v4 _setTransferState:8];
      [(IMDFileTransferCenter *)self _postUpdated:v4];
      id v5 = +[IMDAttachmentStore sharedInstance];
      [v5 storeAttachment:v4 associateWithMessageWithGUID:0];
    }
    [(IMDFileTransferCenter *)self _clearProgressForTransferGUID:v10];
    int v6 = NSString;
    int v7 = [v4 errorDescription];
    uint64_t v8 = [v6 stringWithFormat:@"Transfer failed. See underlying error. transfer.errorDescription:%@", v7];
    uint64_t v9 = +[IMDFileTransferCenter localFileURLRetrievalErrorWithReason:3 underlyingReason:28 description:v8];
    [(IMDFileTransferCenter *)self postHubbleDownloadFailedIfNeededForTransfer:v4 error:v9];
  }
}

- (void)successfullyGeneratedPreviewForTransfer:(id)a3 withPreviewSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = IMLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = IMStringFromCGSize();
    *(_DWORD *)buf = 138412546;
    id v21 = v7;
    __int16 v22 = 2112;
    uint64_t v23 = v9;
    _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_DEFAULT, "Updating transfer %@ with size %@", buf, 0x16u);
  }
  id v10 = [(IMDFileTransferCenter *)self transferForGUID:v7];
  double v11 = v10;
  if (v10)
  {
    uint64_t v12 = [v10 previewGenerationState];
    if (width == *MEMORY[0x1E4F1DB30] && height == *(double *)(MEMORY[0x1E4F1DB30] + 8))
    {
      int v19 = [(IMDFileTransferCenter *)self _attachmentStoreSharedInstance];
      [v19 updateAttachment:v11];

      [(IMDFileTransferCenter *)self _reindexTransferIfNeededForPreviewGenerationStateChange:v11 originalPreviewGenerationState:v12];
    }
    else
    {
      char v14 = [v11 attributionInfo];
      IMClientPreviewConstraints();
      uint64_t v15 = IMUpdateTransferConstraintAndSizeKeys();

      uint64_t v16 = IMLogHandleForCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v21 = v15;
        _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_DEFAULT, "New attribution info is %@", buf, 0xCu);
      }

      [v11 setAttributionInfo:v15];
      [v11 setPreviewGenerationState:1];

      uint64_t v17 = [(IMDFileTransferCenter *)self _attachmentStoreSharedInstance];
      [v17 updateAttachment:v11];

      [(IMDFileTransferCenter *)self _reindexTransferIfNeededForPreviewGenerationStateChange:v11 originalPreviewGenerationState:v12];
      [(IMDFileTransferCenter *)self _postUpdated:v11];
    }
  }
  else
  {
    uint64_t v18 = IMLogHandleForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_1D9900150((uint64_t)v7, v18);
    }
  }
}

- (void)generatePreviewForTransfer:(id)a3 messageItem:(id)a4 senderContext:(id)a5
{
  id v7 = (void *)MEMORY[0x1E4F6EBF8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v13 = [v7 sharedInstance];
  double v11 = [v10 localPath];
  uint64_t v12 = [v9 balloonBundleID];

  [v13 generatePreviewForTransfer:v10 attachmentPath:v11 balloonBundleID:v12 senderContext:v8 completionBlock:&unk_1F3390DC0];
}

- (void)setRecoverableErrorForTransfer:(id)a3 error:(int64_t)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([v6 length])
  {
    id v7 = [(IMDFileTransferCenter *)self transferForGUID:v6];
    id v8 = v7;
    if (v7 && [v7 transferState] != 6)
    {
      id v9 = IMLogHandleForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 134218242;
        int64_t v12 = a4;
        __int16 v13 = 2112;
        id v14 = v6;
        _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_DEFAULT, "IMDFileTransfer posting recoverable error state (%zd) for IMFileTransfer %@", (uint8_t *)&v11, 0x16u);
      }

      [v8 _setTransferState:7];
      [v8 _setError:a4];
      [(IMDFileTransferCenter *)self _postUpdated:v8];
      id v10 = +[IMDAttachmentStore sharedInstance];
      [v10 storeAttachment:v8 associateWithMessageWithGUID:0];
    }
  }
}

- (void)failTransfer:(id)a3 error:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if ([v10 length])
  {
    id v7 = [(IMDFileTransferCenter *)self transferForGUID:v10];
    id v8 = [v6 localizedDescription];
    [v7 _setErrorDescription:v8];

    [(IMDFileTransferCenter *)self failTransfer:v10 reason:24];
    [(IMDFileTransferCenter *)self _clearProgressForTransferGUID:v10];
    [(IMDFileTransferCenter *)self _updateContextStamp];
    id v9 = +[IMDAttachmentStore sharedInstance];
    [v9 storeAttachment:v7 associateWithMessageWithGUID:0];

    [(IMDFileTransferCenter *)self postHubbleDownloadFailedIfNeededForTransfer:v7 error:v6];
  }
}

- (void)acceptTransfer:(id)a3 path:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if ([v7 length])
  {
    [(IMDFileTransferCenter *)self _handleFileTransfer:v7 acceptedWithPath:v6 autoRename:1 overwrite:0 options:0 postNotification:0];
    [(IMDFileTransferCenter *)self _updateContextStamp];
  }
}

- (void)_handleFileTransfer:(id)a3 createdWithProperties:(id)a4 withAuditToken:(id *)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([v8 length])
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F6E780]);
    if (!a5 || ([v10 localPath], (uint64_t v11 = [v10 _updateWithDictionaryRepresentation:v9];
    {
LABEL_19:
      uint64_t v24 = [(IMDFileTransferCenter *)self guidToTransferMap];
      uint64_t v25 = [v24 objectForKeyedSubscript:v8];

      v26 = [(IMDFileTransferCenter *)self guidToTransferMap];
      [v26 setObject:v10 forKeyedSubscript:v8];

      v27 = [MEMORY[0x1E4F28EB8] defaultCenter];
      objc_msgSend(v27, "__mainThreadPostNotificationName:object:", @"__kIMDFileTransferCreatedNotification", v10);

      [(IMDFileTransferCenter *)self _updateContextStamp];
      if (v10)
      {
        if (v25)
        {
          [(IMDFileTransferCenter *)self _postUpdated:v10];
        }
        else
        {
          v28 = +[IMDBroadcastController sharedProvider];
          v29 = [v28 broadcasterForFileTransferListeners];
          v30 = [v10 guid];
          v31 = [v10 _dictionaryRepresentation];
          [v29 fileTransfer:v30 createdWithProperties:v31];
        }
      }
LABEL_23:

      goto LABEL_24;
    }
    int64_t v12 = (void *)v11;
    __int16 v13 = [v10 sandboxToken];
    id v14 = v13;
    if (v13)
    {
      id v15 = v13;
      [v15 UTF8String];
      if (sandbox_extension_consume() != -1)
      {
        if (sandbox_extension_release() == -1)
        {
          uint64_t v16 = IMLogHandleForCategory();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            sub_1D9900230();
          }
        }
LABEL_18:

        goto LABEL_19;
      }
      uint64_t v17 = IMLogHandleForCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_1D99001C8();
      }
    }
    id v18 = v12;
    uint64_t v19 = [v18 UTF8String];
    long long v20 = *(_OWORD *)&a5->var0[4];
    *(_OWORD *)buf = *(_OWORD *)a5->var0;
    long long v35 = v20;
    uint64_t v33 = v19;
    int v21 = sandbox_check_by_audit_token();
    if (v21)
    {
      int v22 = v21;
      uint64_t v23 = IMLogHandleForCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        int v32 = *__error();
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)&uint8_t buf[4] = v22;
        *(_WORD *)&buf[8] = 1024;
        *(_DWORD *)&buf[10] = v32;
        *(_WORD *)&buf[14] = 1024;
        LODWORD(v35) = a5;
        WORD2(v35) = 2112;
        *(void *)((char *)&v35 + 6) = v18;
        _os_log_error_impl(&dword_1D967A000, v23, OS_LOG_TYPE_ERROR, "Denying transfer, (check %d, errno %d) client with audit token:%u not allowed to access request path:%@", buf, 0x1Eu);
      }

      goto LABEL_23;
    }
    id v15 = v14;
    goto LABEL_18;
  }
LABEL_24:
}

- (void)_updateAndPostCachedTransfer:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v10 = v4;
    id v5 = [v4 guid];
    uint64_t v6 = [v5 length];

    id v4 = v10;
    if (v6)
    {
      id v7 = [v10 guid];
      id v8 = [(IMDFileTransferCenter *)self transferForGUID:v7];

      [(IMDFileTransferCenter *)self _updateContextStamp];
      if (v8)
      {
        if (v8 != v10)
        {
          id v9 = [v10 _dictionaryRepresentation];
          [v8 _updateWithDictionaryRepresentation:v9];
        }
        [(IMDFileTransferCenter *)self _postUpdated:v8];
      }

      id v4 = v10;
    }
  }
}

- (void)_handleFileTransferForStickerRepositionWithGUID:(id)a3 updatedWithProperties:(id)a4 fromLocalChange:(BOOL)a5
{
}

- (void)_handleFileTransfer:(id)a3 updatedWithProperties:(id)a4
{
}

- (void)_handleFileTransfer:(id)a3 updatedWithProperties:(id)a4 isStickerReposition:(BOOL)a5 repositionedLocally:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v17 = a3;
  id v10 = a4;
  if ([v17 length])
  {
    uint64_t v11 = [(IMDFileTransferCenter *)self transferForGUID:v17];
    int64_t v12 = v11;
    if (v11)
    {
      __int16 v13 = [v11 transferredFilename];
      id v14 = (void *)[v13 copy];

      [v12 _updateWithDictionaryRepresentation:v10];
      if (v7)
      {
        if (v6) {
          uint64_t v15 = 1;
        }
        else {
          uint64_t v15 = 2;
        }
        [v12 setUpdateReason:v15];
      }
      if (v14) {
        [v12 setTransferredFilename:v14];
      }
      uint64_t v16 = [(IMDFileTransferCenter *)self _attachmentStoreSharedInstance];
      [v16 updateAttachment:v12];

      [(IMDFileTransferCenter *)self _updateContextStamp];
      if (!v7) {
        [(IMDFileTransferCenter *)self _postUpdated:v12];
      }
    }
    else
    {
      [(IMDFileTransferCenter *)self _updateContextStamp];
    }
  }
}

- (void)_handleFileTransfer:(id)a3 acceptedWithPath:(id)a4 autoRename:(BOOL)a5 overwrite:(BOOL)a6 options:(int64_t)a7 postNotification:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  if ([v12 length])
  {
    id v14 = [(IMDFileTransferCenter *)self guidToTransferMap];
    uint64_t v15 = [v14 objectForKeyedSubscript:v12];

    uint64_t v16 = IMLogHandleForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v37 = v12;
      _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_DEFAULT, "_handleFileTransfer accepted %@", buf, 0xCu);
    }

    [v15 _resetTransferStateIfAttachmentIsMissingAndDownloadable];
    id v17 = +[IMDCKCacheDeleteManager sharedInstance];
    char v18 = objc_msgSend(v17, "shouldDownloadAssetsOfSize:refreshCachedValue:", objc_msgSend(v15, "totalBytes"), 1);

    if (v18)
    {
      if ([v15 transferState] <= 0)
      {
        if (IMGetAppBoolForKey())
        {
          [(IMDFileTransferCenter *)self failTransfer:v12 reason:25];
        }
        else
        {
          [(IMDFileTransferCenter *)self _addActiveTransfer:v12];
          if (!v13)
          {
            v30 = [v15 filename];
            v31 = [v30 lastPathComponent];

            int v32 = [MEMORY[0x1E4F28CB8] defaultManager];
            uint64_t v33 = objc_msgSend(v32, "im_randomTemporaryFileURLWithFileName:", v31);
            id v13 = [v33 path];
          }
          [v15 _setTransferState:1];
          [v15 _setFetchOptions:a7];
          if (v13)
          {
            v34 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v13];
            [v15 _setLocalURL:v34];
          }
          if (v8)
          {
            long long v35 = [MEMORY[0x1E4F28EB8] defaultCenter];
            objc_msgSend(v35, "__mainThreadPostNotificationName:object:", @"__kIMDFileTransferAcceptedNotification", v15);
          }
          [(IMDFileTransferCenter *)self _updateContextStamp];
          if (v15) {
            [(IMDFileTransferCenter *)self _postUpdated:v15];
          }
        }
      }
      else
      {
        uint64_t v19 = NSString;
        [v15 transferState];
        long long v20 = IMStringFromTransferState();
        [v15 cloudKitSyncState];
        int v21 = IMStringFromCKSyncState();
        int v22 = [v15 existsAtLocalPath];
        uint64_t v23 = @"NO";
        if (v22) {
          uint64_t v23 = @"YES";
        }
        uint64_t v24 = [v19 stringWithFormat:@"Invalid transfer state. transferState:%@ cloudKitSyncState:%@ existsAtLocalPath:%@", v20, v21, v23];
        uint64_t v25 = +[IMDFileTransferCenter localFileURLRetrievalErrorWithReason:11 description:v24];
        [(IMDFileTransferCenter *)self postHubbleDownloadFailedIfNeededForTransfer:v15 error:v25];
      }
    }
    else
    {
      v26 = NSString;
      v27 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v15, "totalBytes"));
      v28 = [v26 stringWithFormat:@"Not enough diskspace to download file transfer with guid: %@, transfer: %@, total bytes: %@", v12, v15, v27];
      v29 = +[IMDFileTransferCenter localFileURLRetrievalErrorWithReason:12 description:v28];
      [(IMDFileTransferCenter *)self postHubbleDownloadFailedIfNeededForTransfer:v15 error:v29];
    }
  }
}

- (void)_handleFileTransfers:(id)a3 autoRename:(BOOL)a4 overwrite:(BOOL)a5 options:(int64_t)a6 postNotification:(BOOL)a7
{
  BOOL v39 = a7;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v41 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v42 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v48 objects:v55 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v49;
    id v40 = v9;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v49 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v48 + 1) + 8 * v13);
        if ([v14 length])
        {
          uint64_t v15 = [(NSMutableDictionary *)self->_guidToTransferMap objectForKey:v14];
          uint64_t v16 = IMLogHandleForCategory();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v54 = v14;
            _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_DEFAULT, "_handleFileTransfers accepted %@", buf, 0xCu);
          }

          [v15 _resetTransferStateIfAttachmentIsMissingAndDownloadable];
          if ([v15 transferState] > 0)
          {
            id v17 = NSString;
            [v15 transferState];
            char v18 = IMStringFromTransferState();
            [v15 cloudKitSyncState];
            uint64_t v19 = IMStringFromCKSyncState();
            int v20 = [v15 existsAtLocalPath];
            int v21 = @"NO";
            if (v20) {
              int v21 = @"YES";
            }
            int v22 = [v17 stringWithFormat:@"Invalid transfer state. transferState: %@ cloudKitSyncState: %@ existsAtLocalPath: %@", v18, v19, v21];
            uint64_t v23 = +[IMDFileTransferCenter localFileURLRetrievalErrorWithReason:11 description:v22];
            [(IMDFileTransferCenter *)self postHubbleDownloadFailedIfNeededForTransfer:v15 error:v23];

            goto LABEL_13;
          }
          if (IMGetAppBoolForKey())
          {
            [(IMDFileTransferCenter *)self failTransfer:v14 reason:25];
          }
          else
          {
            [(IMDFileTransferCenter *)self _addActiveTransfer:v14];
            uint64_t v24 = [v9 objectForKeyedSubscript:v14];
            char v18 = [v24 localPath];

            if (!v18)
            {
              uint64_t v25 = [v15 filename];
              v26 = [v25 lastPathComponent];

              v27 = [MEMORY[0x1E4F28CB8] defaultManager];
              v28 = objc_msgSend(v27, "im_randomTemporaryFileURLWithFileName:", v26);
              char v18 = [v28 path];

              id v9 = v40;
            }
            [v15 _setTransferState:1];
            [v15 _setFetchOptions:a6];
            if (v18)
            {
              v29 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v18];
              [v15 _setLocalURL:v29];
            }
            if (v15)
            {
              [v42 setObject:v15 forKeyedSubscript:v14];
              [v41 setObject:v18 forKeyedSubscript:v14];
            }
LABEL_13:
          }
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v30 = [v9 countByEnumeratingWithState:&v48 objects:v55 count:16];
      uint64_t v11 = v30;
    }
    while (v30);
  }

  if ([v42 count])
  {
    if (v39)
    {
      v31 = [MEMORY[0x1E4F28EB8] defaultCenter];
      int v32 = [v42 allValues];
      objc_msgSend(v31, "__mainThreadPostNotificationName:object:", @"__kIMDFileTransferBatchAcceptedNotification", v32);
    }
    [(IMDFileTransferCenter *)self _updateContextStamp];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v33 = v42;
    uint64_t v34 = [v33 countByEnumeratingWithState:&v44 objects:v52 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v35; ++i)
        {
          if (*(void *)v45 != v36) {
            objc_enumerationMutation(v33);
          }
          uint64_t v38 = [v33 objectForKeyedSubscript:*(void *)(*((void *)&v44 + 1) + 8 * i)];
          if (v38) {
            [(IMDFileTransferCenter *)self _postUpdated:v38];
          }
        }
        uint64_t v35 = [v33 countByEnumeratingWithState:&v44 objects:v52 count:16];
      }
      while (v35);
    }
  }
}

- (void)_handleFileTransferStopped:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = IMLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_DEFAULT, "stopping transfer to guid", v12, 2u);
    }

    BOOL v6 = [(IMDFileTransferCenter *)self guidToTransferMap];
    BOOL v7 = [v6 objectForKeyedSubscript:v4];

    [v7 _setFetchOptions:0];
    if (([v7 isFinished] & 1) == 0)
    {
      [(IMDFileTransferCenter *)self _removeActiveTransfer:v4];
      [(IMDFileTransferCenter *)self _removeTransferringTransfer:v7];
      if ([v7 transferState] || !objc_msgSend(v7, "isIncoming"))
      {
        uint64_t v8 = 10;
      }
      else if ([v7 error] == -1)
      {
        uint64_t v8 = 12;
      }
      else
      {
        uint64_t v8 = 10;
      }
      [v7 _setTransferState:6];
      [v7 _setError:v8];
      id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
      objc_msgSend(v9, "__mainThreadPostNotificationName:object:", @"__kIMDFileTransferStoppedNotification", v7);

      [(IMDFileTransferCenter *)self _updateContextStamp];
      [(IMDFileTransferCenter *)self _clearProgressForTransferGUID:v4];
      uint64_t v10 = +[IMDFileTransferCenter localFileURLRetrievalErrorWithReason:5 description:@"File transfer stopped locally."];
      [(IMDFileTransferCenter *)self postHubbleDownloadFailedIfNeededForTransfer:v7 error:v10];

      if (v7) {
        [(IMDFileTransferCenter *)self _postUpdated:v7];
      }
      uint64_t v11 = +[IMDAttachmentStore sharedInstance];
      [v11 storeAttachment:v7 associateWithMessageWithGUID:0];
    }
  }
}

- (void)_handleFileTransferRemoved:(id)a3
{
  id v9 = a3;
  if ([v9 length])
  {
    id v4 = [(IMDFileTransferCenter *)self guidToTransferMap];
    id v5 = [v4 objectForKeyedSubscript:v9];

    [v5 _setFetchOptions:0];
    if (([v5 isFinished] & 1) == 0
      && ([v5 transferState]
       || [(IMDFileTransferCenter *)self _hasActiveTransferWithGUID:v9]))
    {
      [(IMDFileTransferCenter *)self _handleFileTransferStopped:v9];
    }
    BOOL v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    objc_msgSend(v6, "__mainThreadPostNotificationName:object:", @"__kIMDFileTransferRemovedNotification", v5);

    BOOL v7 = [(IMDFileTransferCenter *)self guidToTransferMap];
    [v7 setObject:0 forKeyedSubscript:v9];

    [(IMDFileTransferCenter *)self _updateContextStamp];
    if (v5) {
      [(IMDFileTransferCenter *)self _postUpdated:v5];
    }
    [(IMDFileTransferCenter *)self _clearProgressForTransferGUID:v9];
    uint64_t v8 = +[IMDFileTransferCenter localFileURLRetrievalErrorWithReason:6 description:@"File transfer removed."];
    [(IMDFileTransferCenter *)self postHubbleDownloadFailedIfNeededForTransfer:v5 error:v8];
  }
}

- (id)_getNewFileTransferForStoredAttachmentPayloadDataWithTransferGUID:(id)a3 messageGUID:(id)a4
{
  id v6 = a4;
  BOOL v7 = [(IMDFileTransferCenter *)self transferForGUID:a3];
  [v7 setMessageGUID:v6];

  [v7 setHideAttachment:1];

  return v7;
}

- (id)guidsForStoredAttachmentBlastDoorPayloadData:(id)a3 messageGUID:(id)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  BOOL v7 = [a3 contents];
  if ([v7 count])
  {
    id v47 = [MEMORY[0x1E4F1CA48] array];
    long long v46 = [MEMORY[0x1E4F1CA48] array];
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v41 = v7;
    id obj = v7;
    uint64_t v48 = [obj countByEnumeratingWithState:&v54 objects:v60 count:16];
    if (v48)
    {
      uint64_t v45 = *(void *)v55;
      uint64_t v44 = *MEMORY[0x1E4F6D468];
      uint64_t v42 = *MEMORY[0x1E4F6DF38];
      do
      {
        for (uint64_t i = 0; i != v48; ++i)
        {
          if (*(void *)v55 != v45) {
            objc_enumerationMutation(obj);
          }
          id v9 = *(void **)(*((void *)&v54 + 1) + 8 * i);
          uint64_t v10 = [NSString stringGUID];
          uint64_t v11 = [v10 stringByAppendingPathExtension:v44];

          uint64_t v12 = [MEMORY[0x1E4F28CB8] defaultManager];
          objc_msgSend(v12, "im_randomTemporaryFileURLWithFileName:", v11);
          CFURLRef v13 = (const __CFURL *)objc_claimAutoreleasedReturnValue();

          id v14 = [v9 content];
          uint64_t v15 = [v14 type];

          if (v15 == 1)
          {
            v27 = IMLogHandleForCategory();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
              sub_1D99002D8(&v50, v51, v27);
            }

            uint64_t v28 = [v9 content];
            v29 = [(id)v28 other];
            uint64_t v30 = [v29 data];

            id v49 = 0;
            LOBYTE(v28) = [v30 writeToURL:v13 options:1 error:&v49];
            CFURLRef v25 = (const __CFURL *)v49;
            if ((v28 & 1) == 0)
            {
              v31 = IMLogHandleForCategory();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                CFURLRef v59 = v25;
                _os_log_error_impl(&dword_1D967A000, v31, OS_LOG_TYPE_ERROR, "MessageService Failed writing attachment to disk on incoming:%@", buf, 0xCu);
              }
            }
          }
          else if (v15)
          {
            CFURLRef v25 = 0;
          }
          else
          {
            uint64_t v16 = IMLogHandleForCategory();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
              sub_1D9900298(&v52, v53, v16);
            }

            id v17 = [v9 content];
            char v18 = [v17 astc];
            uint64_t v19 = [v18 image];
            int v20 = (CGImage *)[v19 cgImage];

            int v21 = [v9 content];
            int v22 = [v21 astc];
            uint64_t v23 = [v22 originalUTIType];
            uint64_t v24 = CGImageDestinationCreateWithURL(v13, v23, 1uLL, 0);

            if (v24)
            {
              CGImageDestinationAddImage(v24, v20, 0);
              CFURLRef v25 = 0;
              if (!CGImageDestinationFinalize(v24))
              {
                CFURLRef v25 = (const __CFURL *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:v42 code:9 userInfo:0];
                v26 = IMLogHandleForCategory();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  CFURLRef v59 = v25;
                  _os_log_error_impl(&dword_1D967A000, v26, OS_LOG_TYPE_ERROR, "MessageService Failed writing astc encoded image attachment to disk on incoming:%@", buf, 0xCu);
                }
              }
              CFRelease(v24);
            }
            else
            {
              CFURLRef v25 = (const __CFURL *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:v42 code:9 userInfo:0];
              int v32 = IMLogHandleForCategory();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                CFURLRef v59 = v13;
                _os_log_error_impl(&dword_1D967A000, v32, OS_LOG_TYPE_ERROR, "MessageService Failed to create CGImageDestination for %@", buf, 0xCu);
              }
            }
          }
          id v33 = [(IMDFileTransferCenter *)self createNewOutgoingTransferWithLocalFileURL:v13];
          uint64_t v34 = [(IMDFileTransferCenter *)self _getNewFileTransferForStoredAttachmentPayloadDataWithTransferGUID:v33 messageGUID:v6];
          uint64_t v35 = +[IMDAttachmentStore sharedInstance];
          [v35 storeAttachment:v34 associateWithMessageWithGUID:v6];

          uint64_t v36 = [(IMDFileTransferCenter *)self transferForGUID:v33];
          [v47 addObject:v33];
          uint64_t v37 = [v36 localPath];
          uint64_t v38 = (void *)v37;
          if (v37) {
            BOOL v39 = (__CFString *)v37;
          }
          else {
            BOOL v39 = &stru_1F3398578;
          }
          [v46 addObject:v39];
        }
        uint64_t v48 = [obj countByEnumeratingWithState:&v54 objects:v60 count:16];
      }
      while (v48);
    }

    [(IMDFileTransferCenter *)self broadcastTransfersWithGUIDs:v47 atLocalPaths:v46];
    BOOL v7 = v41;
  }
  else
  {
    id v47 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v47;
}

- (id)guidsForStoredAttachmentPayloadData:(id)a3 messageGUID:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v31 = a4;
  if ([v6 count])
  {
    id v32 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v30 = [MEMORY[0x1E4F1CA48] array];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v26 = v6;
    id obj = v6;
    uint64_t v33 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
    if (v33)
    {
      uint64_t v29 = *(void *)v36;
      uint64_t v28 = *MEMORY[0x1E4F6D468];
      do
      {
        for (uint64_t i = 0; i != v33; ++i)
        {
          if (*(void *)v36 != v29) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          id v9 = [NSString stringGUID];
          uint64_t v10 = [v9 stringByAppendingPathExtension:v28];

          uint64_t v11 = [MEMORY[0x1E4F28CB8] defaultManager];
          uint64_t v12 = objc_msgSend(v11, "im_randomTemporaryFileURLWithFileName:", v10);
          CFURLRef v13 = [v12 path];

          id v14 = [v13 stringByResolvingAndStandardizingPath];

          id v34 = 0;
          LOBYTE(v8) = [v8 writeToFile:v14 options:1 error:&v34];
          id v15 = v34;
          if ((v8 & 1) == 0)
          {
            uint64_t v16 = IMLogHandleForCategory();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v40 = v15;
              _os_log_error_impl(&dword_1D967A000, v16, OS_LOG_TYPE_ERROR, "MessageService Failed writing attachment to disk on incoming:%@", buf, 0xCu);
            }
          }
          id v17 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v14 isDirectory:0];
          char v18 = [(IMDFileTransferCenter *)self createNewOutgoingTransferWithLocalFileURL:v17];
          uint64_t v19 = [(IMDFileTransferCenter *)self _getNewFileTransferForStoredAttachmentPayloadDataWithTransferGUID:v18 messageGUID:v31];
          int v20 = +[IMDAttachmentStore sharedInstance];
          [v20 storeAttachment:v19 associateWithMessageWithGUID:v31];

          int v21 = [(IMDFileTransferCenter *)self transferForGUID:v18];
          [v32 addObject:v18];
          uint64_t v22 = [v21 localPath];
          uint64_t v23 = (void *)v22;
          if (v22) {
            uint64_t v24 = (__CFString *)v22;
          }
          else {
            uint64_t v24 = &stru_1F3398578;
          }
          [v30 addObject:v24];
        }
        uint64_t v33 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
      }
      while (v33);
    }

    [(IMDFileTransferCenter *)self broadcastTransfersWithGUIDs:v32 atLocalPaths:v30];
    id v6 = v26;
  }
  else
  {
    id v32 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v32;
}

- (id)guidsForStoredAttachmentPayloadDataURLs:(id)a3 messageGUID:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    id v23 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v21 = v6;
    id obj = v6;
    uint64_t v9 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v25 != v11) {
            objc_enumerationMutation(obj);
          }
          CFURLRef v13 = [(IMDFileTransferCenter *)self createNewOutgoingTransferWithLocalFileURL:*(void *)(*((void *)&v24 + 1) + 8 * i)];
          id v14 = [(IMDFileTransferCenter *)self _getNewFileTransferForStoredAttachmentPayloadDataWithTransferGUID:v13 messageGUID:v7];
          id v15 = +[IMDAttachmentStore sharedInstance];
          [v15 storeAttachment:v14 associateWithMessageWithGUID:v7];

          uint64_t v16 = [(IMDFileTransferCenter *)self transferForGUID:v13];
          [v23 addObject:v13];
          uint64_t v17 = [v16 localPath];
          char v18 = (void *)v17;
          if (v17) {
            uint64_t v19 = (__CFString *)v17;
          }
          else {
            uint64_t v19 = &stru_1F3398578;
          }
          [v8 addObject:v19];
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v10);
    }

    [(IMDFileTransferCenter *)self broadcastTransfersWithGUIDs:v23 atLocalPaths:v8];
    id v6 = v21;
  }
  else
  {
    id v23 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v23;
}

- (BOOL)markAttachment:(id)a3 sender:(id)a4 recipients:(id)a5 isIncoming:(BOOL)a6
{
  return 0;
}

- (void)retrieveLocalFileURLForFileTransferWithGUIDs:(id)a3 options:(int64_t)a4 completion:(id)a5
{
  v96[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  id v69 = v8;
  if ([v7 count])
  {
    v70 = objc_opt_new();
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    id v64 = v7;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v81 objects:v94 count:16];
    if (!v10) {
      goto LABEL_31;
    }
    uint64_t v11 = v10;
    uint64_t v73 = *(void *)v82;
    uint64_t v67 = *MEMORY[0x1E4F6D438];
    uint64_t v66 = *MEMORY[0x1E4F28568];
    uint64_t v65 = *MEMORY[0x1E4F28588];
    v74 = self;
    id v68 = v9;
    while (1)
    {
      uint64_t v12 = 0;
      uint64_t v71 = v11;
      do
      {
        if (*(void *)v82 != v73) {
          objc_enumerationMutation(v9);
        }
        CFURLRef v13 = *(void **)(*((void *)&v81 + 1) + 8 * v12);
        id v14 = -[IMDFileTransferCenter transferForGUID:](self, "transferForGUID:", v13, v64);
        if ([v14 existsAtLocalPath])
        {
          id v15 = IMLogHandleForCategory();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v16 = [v14 localPath];
            *(_DWORD *)buf = 136446722;
            v89 = "-[IMDFileTransferCenter retrieveLocalFileURLForFileTransferWithGUIDs:options:completion:]";
            __int16 v90 = 2112;
            uint64_t v91 = (uint64_t)v13;
            __int16 v92 = 2112;
            v93 = v16;
            _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s File transfer %@ exists at local path %@, no need to move further", buf, 0x20u);

            self = v74;
          }

          if (v8)
          {
            uint64_t v17 = [v14 localPath];
            char v18 = [v14 localPath];
            uint64_t v19 = objc_msgSend(v18, "im_livePhotoBundlePath");
            (*((void (**)(id, uint64_t, void *, void, void *, void *, void))v8 + 2))(v8, 1, v13, 0, v17, v19, 0);

LABEL_28:
            self = v74;
          }
        }
        else if ([v14 isInThumbnailState])
        {
          int v20 = IMLogHandleForCategory();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446466;
            v89 = "-[IMDFileTransferCenter retrieveLocalFileURLForFileTransferWithGUIDs:options:completion:]";
            __int16 v90 = 2112;
            uint64_t v91 = (uint64_t)v13;
            _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_DEFAULT, "%{public}s File transfer %@ is in thumbnail state, not retrieving", buf, 0x16u);
          }

          if (v8)
          {
            id v21 = (void *)MEMORY[0x1E4F28C58];
            v86[0] = v66;
            uint64_t v22 = [MEMORY[0x1E4F28B50] mainBundle];
            id v23 = [v22 localizedStringForKey:@"File transfer local file url retrieval operation was unsuccessful." value:&stru_1F3398578 table:0];
            v86[1] = v65;
            v87[0] = v23;
            long long v24 = [MEMORY[0x1E4F28B50] mainBundle];
            long long v25 = [v24 localizedStringForKey:@"The given GUID references an attachment which is in thumbnail state. You don't want to analyze this, Skip and retry later, user did not tap to downloaded.", &stru_1F3398578, 0 value table];
            v87[1] = v25;
            long long v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v87 forKeys:v86 count:2];
            uint64_t v17 = [v21 errorWithDomain:v67 code:24 userInfo:v26];

            uint64_t v11 = v71;
            id v8 = v69;

            id v9 = v68;
            (*((void (**)(id, void, void *, void, void, void, void *))v8 + 2))(v8, 0, v13, 0, 0, 0, v17);
            goto LABEL_28;
          }
        }
        else
        {
          long long v27 = IMLogHandleForCategory();
          BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
          if (v14)
          {
            if (v28)
            {
              uint64_t v29 = [v14 localPath];
              *(_DWORD *)buf = 136446722;
              v89 = "-[IMDFileTransferCenter retrieveLocalFileURLForFileTransferWithGUIDs:options:completion:]";
              __int16 v90 = 2112;
              uint64_t v91 = (uint64_t)v13;
              __int16 v92 = 2112;
              v93 = v29;
              _os_log_impl(&dword_1D967A000, v27, OS_LOG_TYPE_DEFAULT, "%{public}s File transfer %@ does not exist at local path (%@) and is not in thumbnail state, retrieving", buf, 0x20u);

              uint64_t v11 = v71;
            }
          }
          else if (v28)
          {
            *(_DWORD *)buf = 136446466;
            v89 = "-[IMDFileTransferCenter retrieveLocalFileURLForFileTransferWithGUIDs:options:completion:]";
            __int16 v90 = 2112;
            uint64_t v91 = (uint64_t)v13;
            _os_log_impl(&dword_1D967A000, v27, OS_LOG_TYPE_DEFAULT, "%{public}s File transfer guid %@ does not exist or is not cached, retrieving", buf, 0x16u);
          }

          [v70 addObject:v13];
          self = v74;
          if (v8)
          {
            localFileURLRetrievalWithGuidCompletionHandlers = v74->_localFileURLRetrievalWithGuidCompletionHandlers;
            if (!localFileURLRetrievalWithGuidCompletionHandlers)
            {
              id v31 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
              id v32 = v74->_localFileURLRetrievalWithGuidCompletionHandlers;
              v74->_localFileURLRetrievalWithGuidCompletionHandlers = v31;

              localFileURLRetrievalWithGuidCompletionHandlers = v74->_localFileURLRetrievalWithGuidCompletionHandlers;
            }
            uint64_t v33 = [(NSMutableDictionary *)localFileURLRetrievalWithGuidCompletionHandlers objectForKeyedSubscript:v13];

            if (!v33)
            {
              id v34 = [MEMORY[0x1E4F1CA48] array];
              [(NSMutableDictionary *)v74->_localFileURLRetrievalWithGuidCompletionHandlers setObject:v34 forKeyedSubscript:v13];
            }
            uint64_t v17 = [(NSMutableDictionary *)v74->_localFileURLRetrievalWithGuidCompletionHandlers objectForKeyedSubscript:v13];
            long long v35 = _Block_copy(v8);
            [v17 addObject:v35];

            uint64_t v11 = v71;
            goto LABEL_28;
          }
        }

        ++v12;
      }
      while (v11 != v12);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v81 objects:v94 count:16];
      if (!v11)
      {
LABEL_31:

        id v36 = v70;
        if ([v70 count])
        {
          long long v37 = IMLogHandleForCategory();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v38 = [v70 count];
            *(_DWORD *)buf = 136446722;
            v89 = "-[IMDFileTransferCenter retrieveLocalFileURLForFileTransferWithGUIDs:options:completion:]";
            __int16 v90 = 2048;
            uint64_t v91 = v38;
            __int16 v92 = 2112;
            v93 = v70;
            _os_log_impl(&dword_1D967A000, v37, OS_LOG_TYPE_DEFAULT, "%{public}s Retrieving %llu file transfers (%@)", buf, 0x20u);
          }

          BOOL v39 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v70, "count"));
          long long v77 = 0u;
          long long v78 = 0u;
          long long v79 = 0u;
          long long v80 = 0u;
          id v36 = v70;
          uint64_t v40 = [v36 countByEnumeratingWithState:&v77 objects:v85 count:16];
          if (v40)
          {
            uint64_t v41 = v40;
            uint64_t v42 = *(void *)v78;
            do
            {
              uint64_t v43 = 0;
              do
              {
                if (*(void *)v78 != v42) {
                  objc_enumerationMutation(v36);
                }
                uint64_t v44 = *(void *)(*((void *)&v77 + 1) + 8 * v43);
                id v75 = 0;
                id v76 = 0;
                uint64_t v45 = -[IMDFileTransferCenter _retrieveLocalFileURLForFileTransferWithGUID:options:outTransfer:outError:](self, "_retrieveLocalFileURLForFileTransferWithGUID:options:outTransfer:outError:", v44, a4, &v76, &v75, v64);
                id v46 = v76;
                id v47 = v75;
                if (v47)
                {
                  uint64_t v48 = self;
                  id v49 = v46;
                  uint64_t v50 = v44;
                  id v51 = v47;
                  uint8_t v52 = v45;
LABEL_43:
                  [(IMDFileTransferCenter *)v48 _hubbleTransferCompleted:v49 withGUID:v50 error:v51 suggestedRetryGUID:v52];
                  goto LABEL_44;
                }
                if ([v46 existsAtLocalPath])
                {
                  uint64_t v48 = self;
                  id v49 = v46;
                  uint64_t v50 = v44;
                  id v51 = 0;
                  uint8_t v52 = 0;
                  goto LABEL_43;
                }
                if (v46) {
                  [v39 setObject:v46 forKeyedSubscript:v44];
                }
LABEL_44:

                ++v43;
              }
              while (v41 != v43);
              uint64_t v53 = [v36 countByEnumeratingWithState:&v77 objects:v85 count:16];
              uint64_t v41 = v53;
            }
            while (v53);
          }

          id v7 = v64;
          id v8 = v69;
          if ([v39 count])
          {
            [(IMDFileTransferCenter *)self _handleFileTransfers:v39 autoRename:1 overwrite:0 options:a4 postNotification:1];
            long long v54 = IMLogHandleForCategory();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
            {
              long long v55 = [v39 allKeys];
              *(_DWORD *)buf = 136446466;
              v89 = "-[IMDFileTransferCenter retrieveLocalFileURLForFileTransferWithGUIDs:options:completion:]";
              __int16 v90 = 2112;
              uint64_t v91 = (uint64_t)v55;
              _os_log_impl(&dword_1D967A000, v54, OS_LOG_TYPE_DEFAULT, "%{public}s Successfully started explicit download for local file url retrieval of transfer with GUIDs %@", buf, 0x16u);
            }
          }
        }
        else
        {
          id v7 = v64;
        }
LABEL_59:

        goto LABEL_60;
      }
    }
  }
  long long v56 = IMLogHandleForCategory();
  if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
    sub_1D9900318(v56);
  }

  if (v8)
  {
    long long v57 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v58 = *MEMORY[0x1E4F6D438];
    v95[0] = *MEMORY[0x1E4F28568];
    CFURLRef v59 = [MEMORY[0x1E4F28B50] mainBundle];
    v60 = [v59 localizedStringForKey:@"File transfer local file urls retrieval operation was unsuccessful." value:&stru_1F3398578 table:0];
    v96[0] = v60;
    v95[1] = *MEMORY[0x1E4F28588];
    uint64_t v61 = [MEMORY[0x1E4F28B50] mainBundle];
    v62 = [v61 localizedStringForKey:@"The given GUIDs was empty." value:&stru_1F3398578 table:0];
    v96[1] = v62;
    v63 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v96 forKeys:v95 count:2];
    id v36 = [v57 errorWithDomain:v58 code:24 userInfo:v63];

    id v8 = v69;
    (*((void (**)(id, void, void, void, void, void, id))v8 + 2))(v8, 0, 0, 0, 0, 0, v36);
    goto LABEL_59;
  }
LABEL_60:
}

- (void)_hubbleTransferCompleted:(id)a3 withGUID:(id)a4 error:(id)a5 suggestedRetryGUID:(id)a6
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  uint64_t v11 = (char *)a4;
  id v12 = a5;
  id v37 = a6;
  uint64_t v38 = v12;
  CFURLRef v13 = IMLogHandleForCategory();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v14)
    {
      *(_DWORD *)buf = 136446722;
      long long v54 = "-[IMDFileTransferCenter _hubbleTransferCompleted:withGUID:error:suggestedRetryGUID:]";
      __int16 v55 = 2112;
      long long v56 = v11;
      __int16 v57 = 2112;
      id v58 = v12;
      _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s Failed to retrieve local file URL for %@: %@", buf, 0x20u);
    }
  }
  else if (v14)
  {
    id v15 = [v10 localPath];
    *(_DWORD *)buf = 136446722;
    long long v54 = "-[IMDFileTransferCenter _hubbleTransferCompleted:withGUID:error:suggestedRetryGUID:]";
    __int16 v55 = 2112;
    long long v56 = v11;
    __int16 v57 = 2112;
    id v58 = v15;
    _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s Successfully retrieved local file URL for %@ at path %@", buf, 0x20u);
  }
  uint64_t v16 = [(NSMutableDictionary *)self->_localFileURLRetrievalWithGuidCompletionHandlers objectForKeyedSubscript:v11];
  [(NSMutableDictionary *)self->_localFileURLRetrievalWithGuidCompletionHandlers removeObjectForKey:v11];
  unsigned __int8 v17 = [v10 existsAtLocalPath];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = v16;
  uint64_t v18 = [obj countByEnumeratingWithState:&v40 objects:v52 count:16];
  if (v18)
  {
    int v19 = (v12 == 0) & v17;
    uint64_t v20 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v41 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = *(void *)(*((void *)&v40 + 1) + 8 * i);
        if (v19)
        {
          id v23 = [v10 localPath];
          long long v24 = [v10 createAndPersistLivePhotoBundleIfNecessary];
          (*(void (**)(uint64_t, uint64_t, char *, void, void *, void *, void))(v22 + 16))(v22, 1, v11, 0, v23, v24, 0);
        }
        else
        {
          (*(void (**)(void, void, char *, id, void, void, void *))(v22 + 16))(*(void *)(*((void *)&v40 + 1) + 8 * i), 0, v11, v37, 0, 0, v38);
        }
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v40 objects:v52 count:16];
    }
    while (v18);
  }

  unsigned __int8 v25 = [v10 existsAtLocalPath];
  long long v26 = IMLogHandleForCategory();
  BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
  if (((v38 == 0) & v25) != 0)
  {
    if (v27)
    {
      BOOL v28 = [v10 guid];
      *(_DWORD *)buf = 138412290;
      long long v54 = v28;
      _os_log_impl(&dword_1D967A000, v26, OS_LOG_TYPE_DEFAULT, "Sending completion notification for explicit download of transfer: %@", buf, 0xCu);
    }
    uint64_t v50 = @"__kIMDFileTransferExplicitDownloadCompletedSuccessKey";
    uint64_t v29 = MEMORY[0x1E4F1CC38];
    uint64_t v51 = MEMORY[0x1E4F1CC38];
    uint64_t v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
    id v31 = [v10 localURL];

    if (v31)
    {
      v48[0] = @"__kIMDFileTransferExplicitDownloadCompletedSuccessKey";
      v48[1] = @"__kIMDFileTransferExplicitDownloadCompletedFileURLKey";
      v49[0] = v29;
      id v32 = [v10 localURL];
      v49[1] = v32;
      uint64_t v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:v48 count:2];

      uint64_t v30 = (void *)v33;
    }
  }
  else
  {
    if (v27)
    {
      *(_DWORD *)buf = 138412290;
      long long v54 = v11;
      _os_log_impl(&dword_1D967A000, v26, OS_LOG_TYPE_DEFAULT, "Sending completion notification for explicit download of transfer with guid %@", buf, 0xCu);
    }

    id v46 = @"__kIMDFileTransferExplicitDownloadCompletedSuccessKey";
    uint64_t v34 = MEMORY[0x1E4F1CC28];
    uint64_t v47 = MEMORY[0x1E4F1CC28];
    uint64_t v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
    if (v38)
    {
      v44[0] = @"__kIMDFileTransferExplicitDownloadCompletedSuccessKey";
      v44[1] = @"__kIMDFileTransferExplicitDownloadCompletedErrorKey";
      v45[0] = v34;
      v45[1] = v38;
      uint64_t v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:2];

      uint64_t v30 = (void *)v35;
    }
  }
  id v36 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v36 postNotificationName:@"__kIMDFileTransferExplicitDownloadCompletedNotification" object:v10 userInfo:v30];
}

- (id)_findTransferGUIDMatchingSpotlightDonatedSpeculativeTransferGUID:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = IMMessageGuidFromIMFileTransferGuid();
  uint64_t v5 = [v4 length];
  id v6 = IMLogHandleForCategory();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      int v11 = 136446722;
      id v12 = "-[IMDFileTransferCenter _findTransferGUIDMatchingSpotlightDonatedSpeculativeTransferGUID:]";
      __int16 v13 = 2112;
      id v14 = v3;
      __int16 v15 = 2112;
      uint64_t v16 = v4;
      _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s Decomposed attachment guid %@ to messageGUID: %@", (uint8_t *)&v11, 0x20u);
    }

    id v8 = +[IMDMessageStore sharedInstance];
    id v6 = [v8 messageWithGUID:v4 registerAttachments:0];

    id v9 = [v6 findTransferGUIDMatchingSpotlightDonatedSpeculativeTransferGUID:v3];
  }
  else
  {
    if (v7)
    {
      int v11 = 136446466;
      id v12 = "-[IMDFileTransferCenter _findTransferGUIDMatchingSpotlightDonatedSpeculativeTransferGUID:]";
      __int16 v13 = 2112;
      id v14 = v3;
      _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s Failed to decompose attachment GUID %@, to get message GUID", (uint8_t *)&v11, 0x16u);
    }
    id v9 = 0;
  }

  return v9;
}

- (id)_retrieveLocalFileURLForFileTransferWithGUID:(id)a3 options:(int64_t)a4 outTransfer:(id *)a5 outError:(id *)a6
{
  char v8 = a4;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  if ([v10 length])
  {
    int v11 = +[IMDAttachmentStore sharedInstance];
    id v12 = [v11 attachmentWithGUID:v10];

    if (v12)
    {
      __int16 v13 = v10;
      if (!a5)
      {
LABEL_5:
        if ([v12 existsAtLocalPath])
        {
          id v14 = [v12 localPath];
          __int16 v15 = IMLogHandleForCategory();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446722;
            id v36 = "-[IMDFileTransferCenter _retrieveLocalFileURLForFileTransferWithGUID:options:outTransfer:outError:]";
            __int16 v37 = 2112;
            id v38 = v13;
            __int16 v39 = 2112;
            long long v40 = v14;
            _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s Transfer with guid %@ already exists on disk at path %@", buf, 0x20u);
          }

          id v10 = v13;
LABEL_32:
          uint64_t v18 = v10;
          goto LABEL_45;
        }
        if ([v12 isInThumbnailState])
        {
          id v21 = IMLogHandleForCategory();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446466;
            id v36 = "-[IMDFileTransferCenter _retrieveLocalFileURLForFileTransferWithGUID:options:outTransfer:outError:]";
            __int16 v37 = 2112;
            id v38 = v13;
            _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_DEFAULT, "%{public}s Transfer with guid %@ is in thumbnail state, skipping retrieve", buf, 0x16u);
          }

          uint64_t v22 = [NSString stringWithFormat:@"File transfer associated with GUID %@ was not auto-downloaded, we only have a thumbnail.", v13];
          uint64_t v23 = 11;
LABEL_29:
          long long v26 = +[IMDFileTransferCenter localFileURLRetrievalErrorWithReason:v23 description:v22];

          if (a6) {
            *a6 = v26;
          }
          id v10 = v13;

          goto LABEL_32;
        }
        long long v24 = IMLogHandleForCategory();
        BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
        if ((v8 & 1) == 0)
        {
          if (v25)
          {
            *(_DWORD *)buf = 136446722;
            id v36 = "-[IMDFileTransferCenter _retrieveLocalFileURLForFileTransferWithGUID:options:outTransfer:outError:]";
            __int16 v37 = 2112;
            id v38 = v13;
            __int16 v39 = 2112;
            long long v40 = @"NO";
            _os_log_impl(&dword_1D967A000, v24, OS_LOG_TYPE_DEFAULT, "%{public}s File transfer associated with GUID %@ needs downloading but allowDownload was %@, failing local file url retrieval", buf, 0x20u);
          }

          uint64_t v22 = [NSString stringWithFormat:@"File transfer associated with GUID %@ needs downloading but allowDownload was %@.", v13, @"NO"];
          uint64_t v23 = 10;
          goto LABEL_29;
        }
        if (v25)
        {
          uint64_t v30 = [v12 guid];
          *(_DWORD *)buf = 136446466;
          id v36 = "-[IMDFileTransferCenter _retrieveLocalFileURLForFileTransferWithGUID:options:outTransfer:outError:]";
          __int16 v37 = 2112;
          id v38 = v30;
          _os_log_impl(&dword_1D967A000, v24, OS_LOG_TYPE_DEFAULT, "%{public}s Transfer %@ does not already exist on disk. Starting explicit download for local file url retrieval.", buf, 0x16u);
        }
        id v31 = [v12 guid];
        id v32 = [(IMDFileTransferCenter *)self transferForGUID:v31];

        if (!v32)
        {
          uint64_t v33 = [v12 guid];
          [(IMDFileTransferCenter *)self _addTransfer:v12 forGUID:v33 shouldNotify:0];
        }
        [(IMDFileTransferCenter *)self addHubbleRequestedTransfer:v12];
        id v29 = v13;
        goto LABEL_44;
      }
LABEL_4:
      *a5 = v12;
      goto LABEL_5;
    }
    if ((IMFileTransferGUIDIsTemporary() & 1) == 0)
    {
      __int16 v13 = [(IMDFileTransferCenter *)self _findTransferGUIDMatchingSpotlightDonatedSpeculativeTransferGUID:v10];
      if ([v13 length])
      {
        int v19 = +[IMDAttachmentStore sharedInstance];
        id v12 = [v19 attachmentWithGUID:v13];

        if (v12)
        {
          uint64_t v20 = IMLogHandleForCategory();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v36 = (const char *)v13;
            __int16 v37 = 2112;
            id v38 = v10;
            _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_DEFAULT, "Found a file transfer %@ that matches donated guid %@", buf, 0x16u);
          }

          if (!a5) {
            goto LABEL_5;
          }
          goto LABEL_4;
        }
      }
    }
    BOOL v27 = IMLogHandleForCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      id v36 = "-[IMDFileTransferCenter _retrieveLocalFileURLForFileTransferWithGUID:options:outTransfer:outError:]";
      __int16 v37 = 2112;
      id v38 = v10;
      _os_log_impl(&dword_1D967A000, v27, OS_LOG_TYPE_DEFAULT, "%{public}s No file transfer associated with GUID %@, failing local file url retrieval", buf, 0x16u);
    }

    BOOL v28 = [NSString stringWithFormat:@"There was no file transfer associated with GUID %@.", v10];
    id v12 = +[IMDFileTransferCenter localFileURLRetrievalErrorWithReason:9 description:v28];

    if (a6) {
      *a6 = v12;
    }
    id v29 = v10;
LABEL_44:
    id v10 = v29;
    uint64_t v18 = v29;
    goto LABEL_45;
  }
  uint64_t v16 = IMLogHandleForCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    id v36 = "-[IMDFileTransferCenter _retrieveLocalFileURLForFileTransferWithGUID:options:outTransfer:outError:]";
    _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s Empty guid passed, failing local file url retrieval", buf, 0xCu);
  }

  uint64_t v17 = +[IMDFileTransferCenter localFileURLRetrievalErrorWithReason:8 description:@"The given transfer GUID was empty."];
  id v12 = v17;
  if (a6)
  {
    id v12 = v17;
    uint64_t v18 = 0;
    *a6 = v12;
  }
  else
  {
    uint64_t v18 = 0;
  }
LABEL_45:

  return v18;
}

- (id)_attachmentStoreSharedInstance
{
  return +[IMDAttachmentStore sharedInstance];
}

- (void)removeFinishedTransfers
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = [(IMDFileTransferCenter *)self guidToTransferMap];
  uint64_t v5 = [v4 allValues];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1D9721F4C;
  v8[3] = &unk_1E6B750A0;
  id v9 = v3;
  id v6 = v3;
  [v5 enumerateObjectsUsingBlock:v8];

  BOOL v7 = [(IMDFileTransferCenter *)self guidToTransferMap];
  [v7 removeObjectsForKeys:v6];
}

- (void)setUpdatedStickerUserInfo:(id)a3 forTransfer:(id)a4 repositioningFromLocalChange:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a3;
  id v10 = IMLogHandleForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v8;
    _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_DEFAULT, "Updating sticker user info for transfer %@", (uint8_t *)&v13, 0xCu);
  }

  int v11 = [(IMDFileTransferCenter *)self transferForGUID:v8];
  [v11 setStickerUserInfo:v9];

  id v12 = [v11 _dictionaryRepresentation];
  [(IMDFileTransferCenter *)self _handleFileTransferForStickerRepositionWithGUID:v8 updatedWithProperties:v12 fromLocalChange:v5];
}

- (void)setContextStamp:(id)a3
{
}

- (NSMutableDictionary)localFileURLRetrievalWithGuidCompletionHandlers
{
  return self->_localFileURLRetrievalWithGuidCompletionHandlers;
}

- (void)setLocalFileURLRetrievalWithGuidCompletionHandlers:(id)a3
{
}

- (NSMutableSet)messagesToReindexForPreviewGeneration
{
  return self->_messagesToReindexForPreviewGeneration;
}

- (void)setMessagesToReindexForPreviewGeneration:(id)a3
{
}

- (void)setGuidToTransferMap:(id)a3
{
}

- (NSMutableSet)activeTransfers
{
  return self->_activeTransfers;
}

- (void)setActiveTransfers:(id)a3
{
}

- (NSTimer)transferTimer
{
  return self->_transferTimer;
}

- (void)setTransferTimer:(id)a3
{
}

- (NSMutableArray)transferringTransfers
{
  return self->_transferringTransfers;
}

- (void)setTransferringTransfers:(id)a3
{
}

- (NSMutableSet)activeHubbleRequestedTransfers
{
  return self->_activeHubbleRequestedTransfers;
}

- (void)setActiveHubbleRequestedTransfers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeHubbleRequestedTransfers, 0);
  objc_storeStrong((id *)&self->_transferringTransfers, 0);
  objc_storeStrong((id *)&self->_transferTimer, 0);
  objc_storeStrong((id *)&self->_activeTransfers, 0);
  objc_storeStrong((id *)&self->_guidToTransferMap, 0);
  objc_storeStrong((id *)&self->_messagesToReindexForPreviewGeneration, 0);
  objc_storeStrong((id *)&self->_localFileURLRetrievalWithGuidCompletionHandlers, 0);

  objc_storeStrong((id *)&self->_contextStamp, 0);
}

- (id)_messageStoreSharedInstance
{
  return +[IMDMessageStore sharedInstance];
}

- (BOOL)_shouldDownloadAssetForTransfer:(id)a3 forMessageItem:(id)a4
{
  id v5 = a3;
  if (([a4 isAudioMessage] & 1) != 0
    || ([v5 isSticker] & 1) != 0
    || ([v5 hideAttachment] & 1) != 0
    || ([v5 isLocation] & 1) != 0)
  {
    char v6 = 1;
  }
  else
  {
    char v6 = [v5 isContact];
  }

  return v6;
}

- (id)updateTransfersWithCKRecord:(id)a3 recordWasFetched:(BOOL)a4 downloadAsset:(BOOL *)a5
{
  BOOL v6 = a4;
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (v8)
  {
    long long v54 = a5;
    __int16 v57 = [MEMORY[0x1E4F6E780] transferGUIDOfRecord:v8];
    IMMessageGuidFromIMFileTransferGuid();
    id v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    int v10 = [MEMORY[0x1E4F6E780] attachmentRecordHasAsset:v8];
    if (IMOSLoggingEnabled())
    {
      int v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        id v12 = @"NO";
        *(_DWORD *)buf = 138412802;
        uint64_t v59 = v9;
        __int16 v60 = 2112;
        if (v10) {
          id v12 = @"YES";
        }
        uint64_t v61 = v57;
        __int16 v62 = 2112;
        uint64_t v63 = (uint64_t)v12;
        _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Found message GUId %@ from IMFileTransferGUID %@ so that we can upadte the transfer. Record hasAsset %@", buf, 0x20u);
      }
    }
    int v13 = [(IMDFileTransferCenter *)self _messageStoreSharedInstance];
    uint64_t v14 = [v13 messageWithGUID:v9];

    uint64_t v15 = [(IMDFileTransferCenter *)self _messageStoreSharedInstance];
    long long v56 = [v15 itemWithGUID:v9];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v56 actionIsGroupPhoto]) {
      unint64_t v16 = v56;
    }
    else {
      unint64_t v16 = 0;
    }
    __int16 v55 = (void *)v16;
    BOOL v17 = (v16 | v14) != 0;
    uint64_t v18 = [(IMDFileTransferCenter *)self _attachmentStoreSharedInstance];
    [v18 updateTemporaryTransferGUIDsOnMessageIfNeeded:v14];

    int v19 = [(IMDFileTransferCenter *)self _attachmentStoreSharedInstance];
    uint64_t v20 = [v19 attachmentWithGUID:v57];

    if (!v20)
    {
      if (!v6 && IMOSLoggingEnabled())
      {
        long long v24 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v59 = v57;
          _os_log_impl(&dword_1D967A000, v24, OS_LOG_TYPE_INFO, "IMDFileTransferCenter - Update from CKRecord found no existing attachment for %@, but was on the write path", buf, 0xCu);
        }
      }
      BOOL v25 = (__CFString *)[objc_alloc(MEMORY[0x1E4F6E780]) initWithCKRecord:v8 writeAssetToDisk:1];
      long long v26 = v25;
      if (v10) {
        uint64_t v27 = 5;
      }
      else {
        uint64_t v27 = 0;
      }
      [(__CFString *)v25 _setTransferState:v27];
      [(__CFString *)v26 setCloudKitSyncState:1];
      if (IMOSLoggingEnabled())
      {
        BOOL v28 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          id v29 = @"NO";
          *(_DWORD *)buf = 138412802;
          uint64_t v59 = v26;
          __int16 v60 = 2112;
          if (v10) {
            id v29 = @"YES";
          }
          uint64_t v61 = v9;
          __int16 v62 = 2112;
          uint64_t v63 = (uint64_t)v29;
          _os_log_impl(&dword_1D967A000, v28, OS_LOG_TYPE_INFO, "Fetched from CK. Created new transfer %@ from CKRecord. Associating with message guid %@ hasAsset: %@", buf, 0x20u);
        }
      }
      if (v17)
      {
        uint64_t v30 = [(IMDFileTransferCenter *)self _attachmentStoreSharedInstance];
        [v30 storeAttachment:v26 associateWithMessageWithGUID:v9];

        [(IMDFileTransferCenter *)self _updateAndPostCachedTransfer:v26];
        unsigned int v31 = (v55 != 0) | [(IMDFileTransferCenter *)self _shouldDownloadAssetForTransfer:v26 forMessageItem:v14];
        if (IMOSLoggingEnabled())
        {
          id v32 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            uint64_t v33 = @"YES";
            if (v54) {
              uint64_t v34 = @"YES";
            }
            else {
              uint64_t v34 = @"NO";
            }
            if (v31) {
              uint64_t v35 = @"YES";
            }
            else {
              uint64_t v35 = @"NO";
            }
            *(_DWORD *)buf = 138412802;
            uint64_t v59 = v34;
            __int16 v60 = 2112;
            uint64_t v61 = v35;
            if (!v10) {
              uint64_t v33 = @"NO";
            }
            __int16 v62 = 2112;
            uint64_t v63 = (uint64_t)v33;
            _os_log_impl(&dword_1D967A000, v32, OS_LOG_TYPE_INFO, "Do we want to download the transfer later? downloadAsset: %@, shouldDownloadAssetForTransfer: %@, hasAsset: %@", buf, 0x20u);
          }
        }
        int v36 = v31 ^ 1;
        if (!v54) {
          int v36 = 1;
        }
        if (((v36 | v10) & 1) == 0)
        {
          __int16 v37 = [(__CFString *)v26 guid];
          id v38 = [(IMDFileTransferCenter *)self transferForGUID:v37];

          if (IMOSLoggingEnabled())
          {
            __int16 v39 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138413058;
              uint64_t v59 = v26;
              __int16 v60 = 2112;
              uint64_t v61 = v38;
              __int16 v62 = 2112;
              uint64_t v63 = v14;
              __int16 v64 = 2112;
              uint64_t v65 = v55;
              _os_log_impl(&dword_1D967A000, v39, OS_LOG_TYPE_INFO, "Going to auto downloading asset at the end of batch fetch for transfer: %@ addedTransfer %@ for messageItem: %@ groupPhotoUpdate: %@", buf, 0x2Au);
            }
          }
          BOOL *v54 = 1;
          if (!v38)
          {
            long long v40 = [(__CFString *)v26 guid];
            [(IMDFileTransferCenter *)self addTransfer:v26 forGUID:v40];
          }
        }
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v51 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v59 = v57;
            __int16 v60 = 2112;
            uint64_t v61 = v9;
            _os_log_impl(&dword_1D967A000, v51, OS_LOG_TYPE_INFO, "Storing attachment %@ with no associate-able message %@", buf, 0x16u);
          }
        }
        uint8_t v52 = [(IMDFileTransferCenter *)self _attachmentStoreSharedInstance];
        [v52 storeAttachment:v26 associateWithMessageWithGUID:0];

        [(IMDFileTransferCenter *)self _updateAndPostCachedTransfer:0];
      }
      uint64_t v46 = [(__CFString *)v26 guid];
      goto LABEL_87;
    }
    if (v6)
    {
      if (v10)
      {
        if ([(__CFString *)v20 wantsAssetFromRecord:v8])
        {
          if (IMOSLoggingEnabled())
          {
            id v21 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v59 = v57;
              _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_INFO, "Taking asset from CKRecord for %@", buf, 0xCu);
            }
          }
          [(__CFString *)v20 _setTransferState:5];
          [(__CFString *)v20 moveAssetFromRecord:v8];
        }
        else
        {
          int v47 = [(__CFString *)v20 hasPreferredAssetOverRecord:v8];
          int v48 = IMOSLoggingEnabled();
          if (v47)
          {
            if (v48)
            {
              id v49 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v59 = v57;
                _os_log_impl(&dword_1D967A000, v49, OS_LOG_TYPE_INFO, "Setting local record to upload asset for %@", buf, 0xCu);
              }
            }
            uint64_t v41 = 0;
            goto LABEL_66;
          }
          if (v48)
          {
            uint64_t v50 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v59 = v57;
              _os_log_impl(&dword_1D967A000, v50, OS_LOG_TYPE_INFO, "Keeping local asset and sync state for %@", buf, 0xCu);
            }
          }
        }
      }
      else
      {
        [(__CFString *)v20 _setTransferState:-1];
      }
      uint64_t v41 = 1;
    }
    else
    {
      uint64_t v41 = 4;
    }
LABEL_66:
    [(__CFString *)v20 setCloudKitSyncState:v41];
    long long v42 = [v8 recordID];
    long long v43 = [v42 recordName];
    [(__CFString *)v20 setCloudKitRecordID:v43];

    long long v26 = (__CFString *)[v8 copyEncodedSystemFields];
    [(__CFString *)v20 setCloudKitServerChangeTokenBlob:v26];
    if (IMOSLoggingEnabled())
    {
      uint64_t v44 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v59 = v20;
        __int16 v60 = 2112;
        uint64_t v61 = v9;
        _os_log_impl(&dword_1D967A000, v44, OS_LOG_TYPE_INFO, "Fetched from CK. Updating existing transfer %@ for message GUID %@", buf, 0x16u);
      }
    }
    uint64_t v45 = [(IMDFileTransferCenter *)self _attachmentStoreSharedInstance];
    [v45 storeAttachment:v20 associateWithMessageWithGUID:v9];

    [(IMDFileTransferCenter *)self _updateAndPostCachedTransfer:v20];
    uint64_t v46 = [(__CFString *)v20 guid];
LABEL_87:
    uint64_t v23 = (void *)v46;

    goto LABEL_88;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "Nil CKRecord", buf, 2u);
    }
  }
  uint64_t v23 = 0;
LABEL_88:

  return v23;
}

- (void)markTransferAsNotSyncedSuccessfully:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "markTransferAsNotSyncedSuccessfullyUsingCKRecord transferGUID %@", (uint8_t *)&v10, 0xCu);
    }
  }
  BOOL v6 = [(IMDFileTransferCenter *)self _attachmentStoreSharedInstance];
  BOOL v7 = [v6 attachmentWithGUID:v4];

  if (v7)
  {
    [v7 setCloudKitSyncState:2];
    id v8 = [(IMDFileTransferCenter *)self _attachmentStoreSharedInstance];
    [v8 updateAttachment:v7];
  }
  else if (IMOSLoggingEnabled())
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Could not find transferGUID %@ to mark as not synced successfully", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)markTransferAsNotSuccessfullyDownloadedFromCloud:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    if (IMOSLoggingEnabled())
    {
      id v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        BOOL v6 = [v4 guid];
        int v8 = 138412290;
        id v9 = v6;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "markTransferAsNotSyncSuccessfullyDownloadedFromCloud transfer %@", (uint8_t *)&v8, 0xCu);
      }
    }
    [v4 setCloudKitSyncState:5];
    BOOL v7 = [(IMDFileTransferCenter *)self _attachmentStoreSharedInstance];
    [v7 updateAttachment:v4];
  }
}

- (void)resetSyncStateForRecord:(id)a3 toState:(int64_t)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = [MEMORY[0x1E4F6E780] transferGUIDOfRecord:v6];
  if (IMOSLoggingEnabled())
  {
    int v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412546;
      uint64_t v14 = v7;
      __int16 v15 = 2048;
      int64_t v16 = a4;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "resetSyncStateForRecord transfer %@ toNewState:%ld", (uint8_t *)&v13, 0x16u);
    }
  }
  id v9 = [(IMDFileTransferCenter *)self _attachmentStoreSharedInstance];
  uint64_t v10 = [v9 attachmentWithGUID:v7];

  if (v10)
  {
    [v10 setCloudKitServerChangeTokenBlob:0];
    [v10 setCloudKitSyncState:a4];
    [v10 setCloudKitRecordID:0];
    id v11 = [(IMDFileTransferCenter *)self _attachmentStoreSharedInstance];
    [v11 updateAttachment:v10];
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412546;
      uint64_t v14 = v7;
      __int16 v15 = 2112;
      int64_t v16 = (int64_t)v6;
      _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Tried to clear the sync state for a transfer we don't have on disk transfer: %@ record: %@", (uint8_t *)&v13, 0x16u);
    }
  }
}

- (BOOL)populateLocalURLsForTransfer:(id)a3 fromCKRecord:(id)a4
{
  v68[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = [v6 _assetForKey:@"lqa"];
  int v8 = v7;
  if (v7)
  {
    id v9 = [v7 fileURL];
    BOOL v53 = v9 != 0;
    if (v9)
    {
      [v5 _setLocalURL:v9];
      uint64_t v10 = [v9 path];
      [v5 _setLocalPath:v10];

      id v11 = [MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v67 = *MEMORY[0x1E4F28370];
      v68[0] = *MEMORY[0x1E4F28358];
      uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v68 forKeys:&v67 count:1];
      int v13 = [v9 path];
      id v56 = 0;
      char v14 = [v11 setAttributes:v12 ofItemAtPath:v13 error:&v56];
      id v15 = v56;

      if ((v14 & 1) == 0 && IMOSLoggingEnabled())
      {
        int64_t v16 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          uint64_t v17 = [v9 path];
          *(_DWORD *)buf = 138412546;
          uint64_t v60 = (uint64_t)v17;
          __int16 v61 = 2112;
          id v62 = v15;
          _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "Failed making file class C: %@ with error %@", buf, 0x16u);
        }
      }
    }
    else if (IMOSLoggingEnabled())
    {
      uint64_t v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        int v19 = [v6 _stringForKey:@"aguid"];
        *(_DWORD *)buf = 138412290;
        uint64_t v60 = (uint64_t)v19;
        _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "Couldn't get local asset URL from CKRecord: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    BOOL v53 = 0;
  }
  uint64_t v20 = [v6 _assetForKey:@"avid"];
  if (v20)
  {
    id v49 = [MEMORY[0x1E4F6E780] transferMetaDataFromRecord:v6];
    id v21 = JWDecodeDictionary();
    uint64_t v22 = [v21 objectForKeyedSubscript:@"pathc"];
    uint8_t v52 = objc_msgSend(v22, "im_lastPathComponent");

    uint64_t v50 = [v5 mimeType];
    uint64_t v51 = [v5 type];
    uint64_t v23 = [v5 guid];
    long long v24 = (void *)IMDCopyAttachmentPersistentPath();
    if ([v24 length])
    {
      BOOL v25 = [v21 objectForKeyedSubscript:@"pathc"];
      int v48 = objc_msgSend(v25, "im_lastPathComponent");

      if ([v48 length])
      {
        long long v26 = [v20 fileURL];
        int v47 = [v26 path];

        if ([v47 length])
        {
          uint64_t v27 = [v24 stringByDeletingLastPathComponent];
          uint64_t v46 = [v27 stringByAppendingPathComponent:v48];

          uint64_t v28 = [v46 stringByDeletingLastPathComponent];
          IMSharedHelperEnsureDirectoryExistsAtPath();

          id v29 = [MEMORY[0x1E4F28CB8] defaultManager];
          id v55 = 0;
          LOBYTE(v28) = [v29 moveItemAtPath:v47 toPath:v46 error:&v55];
          id v45 = v55;

          int v30 = IMOSLoggingEnabled();
          if (v28)
          {
            if (v30)
            {
              unsigned int v31 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                uint64_t v60 = (uint64_t)v23;
                __int16 v61 = 2112;
                id v62 = v46;
                _os_log_impl(&dword_1D967A000, v31, OS_LOG_TYPE_INFO, "Stored aux video for transfer %@, finalAssetPath %@", buf, 0x16u);
              }
            }
            id v32 = [MEMORY[0x1E4F28CB8] defaultManager];
            uint64_t v57 = *MEMORY[0x1E4F28370];
            uint64_t v58 = *MEMORY[0x1E4F28358];
            uint64_t v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v58 forKeys:&v57 count:1];
            id v54 = 0;
            char v34 = [v32 setAttributes:v33 ofItemAtPath:v46 error:&v54];
            id v43 = v54;

            if ((v34 & 1) == 0 && IMOSLoggingEnabled())
            {
              uint64_t v35 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                uint64_t v60 = (uint64_t)v46;
                __int16 v61 = 2112;
                id v62 = v43;
                _os_log_impl(&dword_1D967A000, v35, OS_LOG_TYPE_INFO, "Failed making file class C: %@ with error %@", buf, 0x16u);
              }
            }
          }
          else
          {
            if (v30)
            {
              __int16 v39 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
              {
                long long v40 = [v20 fileURL];
                uint64_t v41 = [v40 path];
                *(_DWORD *)buf = 138412802;
                uint64_t v44 = (void *)v41;
                uint64_t v60 = v41;
                __int16 v61 = 2112;
                id v62 = v46;
                __int16 v63 = 2112;
                id v64 = v45;
                _os_log_impl(&dword_1D967A000, v39, OS_LOG_TYPE_INFO, "Failed to move file from %@ to %@ error %@", buf, 0x20u);
              }
            }
            [MEMORY[0x1E4F6E780] cleanUpAsset:v20];
          }
        }
        else
        {
          if (IMOSLoggingEnabled())
          {
            id v38 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v60 = (uint64_t)v52;
              __int16 v61 = 2112;
              id v62 = v48;
              _os_log_impl(&dword_1D967A000, v38, OS_LOG_TYPE_INFO, "Failed to get aux video asset fileURL for aux video copy dest, bad transfer/data (assetPath %@ auxAssetPath %@)", buf, 0x16u);
            }
          }
          [MEMORY[0x1E4F6E780] cleanUpAsset:v20];
        }
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          __int16 v37 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v60 = (uint64_t)v48;
            _os_log_impl(&dword_1D967A000, v37, OS_LOG_TYPE_INFO, "Failed to get valid attachment aux filename for aux video copy dest, bad transfer/data (auxAssetPath %@)", buf, 0xCu);
          }
        }
        [MEMORY[0x1E4F6E780] cleanUpAsset:v20];
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        int v36 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138413058;
          uint64_t v60 = (uint64_t)v52;
          __int16 v61 = 2112;
          id v62 = v50;
          __int16 v63 = 2112;
          id v64 = v51;
          __int16 v65 = 2112;
          uint64_t v66 = v23;
          _os_log_impl(&dword_1D967A000, v36, OS_LOG_TYPE_INFO, "Failed to create attachment persistent path for aux video source, bad transfer/data (assetPath %@ mimeType %@ utiType %@ guid %@)", buf, 0x2Au);
        }
      }
      [MEMORY[0x1E4F6E780] cleanUpAsset:v20];
    }
  }
  return v53;
}

@end