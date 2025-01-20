@interface CKComposition
+ (BOOL)_shouldCreateMediaObjectForUTIType:(id)a3;
+ (BOOL)isRTFDocumentWithItemProvider:(id)a3;
+ (CKComposition)compositionWithMSMessage:(id)a3 appExtensionIdentifier:(id)a4;
+ (CKComposition)compositionWithMediaObject:(id)a3 subject:(id)a4;
+ (CKComposition)compositionWithMediaObjects:(id)a3 subject:(id)a4;
+ (CKComposition)compositionWithPluginDisplayContainer:(id)a3 subject:(id)a4;
+ (CKComposition)compositionWithShelfMediaObject:(id)a3;
+ (CKComposition)compositionWithShelfPluginPayload:(id)a3 completionHandler:(id)a4;
+ (CKComposition)compositionWithText:(id)a3 subject:(id)a4 shelfPluginPayload:(id)a5 completionHandler:(id)a6;
+ (Class)_LPSharedObjectMetadataClass;
+ (id)_attributedStringAfterPostProcessingForRichLinksForText:(id)a3;
+ (id)_attributedStringByTransformingLinksFromAttributedString:(id)a3;
+ (id)_compositionWithShelfPluginPayload:(id)a3;
+ (id)_savedCompositionForGUID:(id)a3 readUsingBlock:(id)a4;
+ (id)_temporaryURLFromURL:(id)a3;
+ (id)_transcoderUserInfoFor:(id)a3 filename:(id)a4 type:(id)a5;
+ (id)_trimUnwantedAttributesFromAttributedString:(id)a3 allowedAttributes:(id)a4;
+ (id)audioCompositionWithMediaObject:(id)a3;
+ (id)composition;
+ (id)compositionForMessageParts:(id)a3 preserveSubject:(BOOL)a4 contextIdentifier:(id)a5;
+ (id)compositionForTUConversationActivity:(id)a3;
+ (id)compositionForWritingToolsText:(id)a3;
+ (id)expirableCompositionWithMediaObject:(id)a3;
+ (id)finalCompositionFromAllCompositions:(id)a3;
+ (id)newExpirableCompositionWithText:(id)a3 subject:(id)a4 shelfPluginPayload:(id)a5;
+ (id)photoPickerCompositionWithMediaObject:(id)a3;
+ (id)photoPickerCompositionWithMediaObjects:(id)a3;
+ (id)quickImageCompositionWithMediaObject:(id)a3;
+ (id)richestMediaTypeForItemProvider:(id)a3;
+ (id)savedCompositionForGUID:(id)a3;
+ (id)stickerCompositionWithMediaObjects:(id)a3;
+ (id)trimUnwantedAttributesFromAttributedString:(id)a3;
+ (void)__ck_valueForItemClass:(Class)a3 forItemProvider:(id)a4 completion:(id)a5;
+ (void)_createPluginPayloadCompositionFromFileItemProvider:(id)a3 builderContext:(id)a4 collaborationShareOptions:(id)a5 completionHandler:(id)a6;
+ (void)_fileNameFromFileURLForItemProvider:(id)a3 fileType:(id)a4 completion:(id)a5;
+ (void)_fileNameFromURLNameForItemProvider:(id)a3 fileType:(id)a4 completion:(id)a5;
+ (void)_pasteAttributedStringWithItemProvider:(id)a3 builderContext:(id)a4 completionHandler:(id)a5;
+ (void)_pasteRTFDocumentWithItemProvider:(id)a3 builderContext:(id)a4 completionHandler:(id)a5;
+ (void)_requestCompositionFromItemProviderForNonCollaboration:(id)a3 builderContext:(id)a4 completion:(id)a5;
+ (void)compositionFromItemProviders:(id)a3 shareOptions:(id)a4 completionHandler:(id)a5;
+ (void)compositionFromNonCollaborationItemProviders:(id)a3 builderContext:(id)a4 completionHandler:(id)a5;
+ (void)createPluginPayloadCompositionFromCloudKitItemProvider:(id)a3 collaborationShareOptions:(id)a4 completionHandler:(id)a5;
+ (void)createPluginPayloadCompositionFromCollaborativeItemProvider:(id)a3 collaborationShareOptions:(id)a4 completionHandler:(id)a5;
+ (void)createPluginPayloadCompositionFromItemProvider:(id)a3 builderContext:(id)a4 shareOptions:(id)a5 completionHandler:(id)a6;
+ (void)dataForPasteboardType:(id)a3 forItemProvider:(id)a4 completion:(id)a5;
+ (void)deleteCompositionWithGUID:(id)a3;
+ (void)filenameForType:(id)a3 forItemProvider:(id)a4 completionHandler:(id)a5;
+ (void)filenameFromURLTypeForType:(id)a3 forItemProvider:(id)a4 completionHandler:(id)a5;
+ (void)mediaObjectForItemProvider:(id)a3 completion:(id)a4;
+ (void)mediaObjectFromItemAtURL:(id)a3 filename:(id)a4 completion:(id)a5;
+ (void)mediaObjectFromPhotosAsset:(id)a3 completion:(id)a4;
+ (void)pluginDisplayContainerForItemProvider:(id)a3 completion:(id)a4;
+ (void)requestCompositionFromItemProvider:(id)a3 builderContext:(id)a4 completion:(id)a5;
+ (void)requestCompositionFromItemProvider:(id)a3 completion:(id)a4;
+ (void)requestCompositionFromItemProvider:(id)a3 shelfMediaObject:(id)a4 builderContext:(id)a5 completion:(id)a6;
+ (void)requestCompositionFromItemProviders:(id)a3 completion:(id)a4;
+ (void)requestFilenameForType:(id)a3 forItemProvider:(id)a4 completion:(id)a5;
+ (void)requestMediaObjectForItemProvider:(id)a3 type:(id)a4 builderContext:(id)a5 completion:(id)a6;
+ (void)requestMediaObjectsForAttributedString:(id)a3 completion:(id)a4;
+ (void)requestPluginDisplayContainerForItemProvider:(id)a3 completion:(id)a4;
- (BOOL)_compositionTextBeginsWithEmbeddedPluginAttachment;
- (BOOL)_saveCompositionData:(id)a3 atURL:(id)a4 forGUID:(id)a5;
- (BOOL)canBundleAttachmentsWithMessageOnService:(id)a3;
- (BOOL)compositionIsCollaboration;
- (BOOL)hasCheckedCommSafety;
- (BOOL)hasContent;
- (BOOL)hasFailedCommSafetyCheck;
- (BOOL)hasNonwhiteSpaceContent;
- (BOOL)hasNotBeenEdited:(id)a3;
- (BOOL)isAudioComposition;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExpirableComposition;
- (BOOL)isFromExternalSource;
- (BOOL)isPlainTextEqual:(id)a3;
- (BOOL)isSaveable;
- (BOOL)isSendAnimated;
- (BOOL)isTextOnly;
- (BOOL)shouldHideClearPluginButton;
- (CKComposition)compositionWithCollaborationShareOptions:(id)a3;
- (CKComposition)compositionWithExpressiveSendStyleID:(id)a3;
- (CKComposition)initWithText:(id)a3 subject:(id)a4;
- (CKComposition)initWithText:(id)a3 subject:(id)a4 shelfPluginPayload:(id)a5;
- (CKComposition)initWithText:(id)a3 subject:(id)a4 shelfPluginPayload:(id)a5 bizIntent:(id)a6;
- (CKComposition)initWithText:(id)a3 subject:(id)a4 shelfPluginPayload:(id)a5 bizIntent:(id)a6 shelfMediaObject:(id)a7 collaborationOptions:(id)a8 proofreadingInfo:(id)a9;
- (CKComposition)initWithText:(id)a3 subject:(id)a4 shelfPluginPayload:(id)a5 bizIntent:(id)a6 shelfMediaObject:(id)a7 collaborationShareOptions:(id)a8 proofreadingInfo:(id)a9;
- (CKComposition)initWithText:(id)a3 subject:(id)a4 shelfPluginPayload:(id)a5 bizIntent:(id)a6 shelfMediaObject:(id)a7 proofreadingInfo:(id)a8;
- (CKComposition)initWithText:(id)a3 subject:(id)a4 shelfPluginPayload:(id)a5 shelfMediaObject:(id)a6;
- (CKMediaObject)shelfMediaObject;
- (CKSendLaterPluginInfo)sendLaterPluginInfo;
- (Class)balloonViewClass;
- (IMPluginPayload)firstEmbeddedPluginPayload;
- (IMPluginPayload)shelfPluginPayload;
- (NSArray)collaborationOptions;
- (NSArray)mediaObjects;
- (NSArray)pasteboardItemProviders;
- (NSArray)pluginDisplayContainers;
- (NSAttributedString)subject;
- (NSAttributedString)text;
- (NSDictionary)bizIntent;
- (NSDictionary)proofreadingInfo;
- (NSString)expressiveSendStyleID;
- (NSString)firstMessageGUIDOverride;
- (NSString)sourceApplicationID;
- (TUConversationActivity)groupActivity;
- (_SWCollaborationShareOptions)collaborationShareOptions;
- (id)_attributedStringByReplacingMediaObjectsWithTransferGUIDsInText:(id)a3 transferGUIDs:(id *)a4 mediaObjects:(id *)a5;
- (id)_attributedStringByTrimmingWhiteSpaceAroundAttachmentsInText:(id)a3;
- (id)_compositionByAppendingText:(id)a3 isExpirable:(BOOL)a4 shelfPluginPayload:(id)a5 shelfMediaObject:(id)a6 addingNewLineIfNedded:(BOOL)a7;
- (id)_compositionParts;
- (id)_messageFromPayload:(id)a3 firstGUID:(id)a4;
- (id)compositionByAppendingCollaborativeComposition:(id)a3;
- (id)compositionByAppendingComposition:(id)a3;
- (id)compositionByAppendingMediaObject:(id)a3;
- (id)compositionByAppendingMediaObjects:(id)a3;
- (id)compositionByAppendingPluginDisplayContainer:(id)a3;
- (id)compositionByAppendingText:(id)a3;
- (id)compositionByAppendingText:(id)a3 addingNewLineIfNedded:(BOOL)a4;
- (id)compositionByAppendingText:(id)a3 shelfPluginPayload:(id)a4 shelfMediaObject:(id)a5 collaborationShareOptions:(id)a6;
- (id)compositionByRemovingMediaObjects:(id)a3;
- (id)compositionByReplacingMediaObject:(id)a3 withMediaObject:(id)a4;
- (id)compositionByReplacingText:(id)a3;
- (id)description;
- (id)externalSourceComposition;
- (id)messageWithGUID:(id)a3;
- (id)messageWithGUID:(id)a3 superFormatText:(id)a4 superFormatSubject:(id)a5 fileTransferGUIDs:(id)a6 mediaObjects:(id)a7 balloonBundleID:(id)a8 payloadData:(id)a9;
- (id)messageWithGUID:(id)a3 superFormatText:(id)a4 superFormatSubject:(id)a5 fileTransferGUIDs:(id)a6 mediaObjects:(id)a7 balloonBundleID:(id)a8 payloadData:(id)a9 messageSummaryInfo:(id)a10;
- (id)messagesFromCompositionFirstGUIDForMessage:(id)a3 sendingService:(id)a4;
- (id)processedPartsForSuggestedReply:(id)a3;
- (id)superFormatSubject;
- (id)superFormatText:(id *)a3;
- (id)superFormatText:(id)a3 transferGUIDs:(id *)a4 mediaObjects:(id *)a5;
- (unint64_t)hash;
- (unint64_t)mediaObjectsFileSize;
- (void)_applyMessagePropertiesTo:(id)a3 pluginPayload:(id)a4;
- (void)_persistTextToComposition:(id)a3 directoryURL:(id)a4;
- (void)cleanupCKShareFromComposition;
- (void)evaluateSendMetricsWithConversation:(id)a3 shareSheetHostBundleIdentifier:(id)a4;
- (void)removeShareURLForComposition:(id)a3;
- (void)saveCompositionWithGUID:(id)a3;
- (void)setBizIntent:(id)a3;
- (void)setCollaborationOptions:(id)a3;
- (void)setCollaborationShareOptions:(id)a3;
- (void)setExpressiveSendStyleID:(id)a3;
- (void)setFirstMessageGUIDOverride:(id)a3;
- (void)setGroupActivity:(id)a3;
- (void)setHasCheckedCommSafety:(BOOL)a3;
- (void)setHasFailedCommSafetyCheck:(BOOL)a3;
- (void)setIsFromExternalSource:(BOOL)a3;
- (void)setProofreadingInfo:(id)a3;
- (void)setSendLaterPluginInfo:(id)a3;
- (void)setShelfMediaObject:(id)a3;
- (void)setShelfPluginPayload:(id)a3;
- (void)setShouldHideClearPluginButton:(BOOL)a3;
- (void)setSourceApplicationID:(id)a3;
- (void)setSubject:(id)a3;
- (void)setText:(id)a3;
@end

@implementation CKComposition

+ (CKComposition)compositionWithShelfPluginPayload:(id)a3 completionHandler:(id)a4
{
  uint64_t v115 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F6C3F8]);
  [v8 startTimingForKey:@"totalTimeInMethod"];
  [v8 startTimingForKey:@"beforeCompletionHandler"];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__CKComposition_compositionWithShelfPluginPayload_completionHandler___block_invoke;
  aBlock[3] = &unk_1E562C878;
  id v9 = v8;
  id v109 = v9;
  id v10 = v7;
  id v110 = v10;
  v11 = _Block_copy(aBlock);
  [v9 startTimingForKey:@"_compositionWithShelfPluginPayload"];
  uint64_t v102 = 0;
  v103 = &v102;
  uint64_t v104 = 0x3032000000;
  v105 = __Block_byref_object_copy__78;
  v106 = __Block_byref_object_dispose__78;
  id v107 = 0;
  id v107 = [a1 _compositionWithShelfPluginPayload:v6];
  [v9 stopTimingForKey:@"_compositionWithShelfPluginPayload"];
  if (!v103[5])
  {
    dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
    uint64_t v93 = 0;
    v94 = &v93;
    uint64_t v95 = 0x3032000000;
    v96 = __Block_byref_object_copy__78;
    v97 = __Block_byref_object_dispose__78;
    id v98 = 0;
    id v98 = [v6 url];
    if ([(id)v94[5] isFileURL])
    {
      [v9 startTimingForKey:@"BRShareCopyShareURLOperation"];
      if (IMOSLoggingEnabled())
      {
        v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "Starting BRShareCopyShareURLOperation", buf, 2u);
        }
      }
      id v15 = objc_alloc(MEMORY[0x1E4F59558]);
      v16 = (void *)[v15 initWithFileURL:v94[5] documentType:*MEMORY[0x1E4F226F8]];
      v89[0] = MEMORY[0x1E4F143A8];
      v89[1] = 3221225472;
      v89[2] = __69__CKComposition_compositionWithShelfPluginPayload_completionHandler___block_invoke_164;
      v89[3] = &unk_1E562C8A0;
      v92 = &v93;
      id v90 = v9;
      v91 = v13;
      [v16 setCopyShareURLCompletionBlock:v89];
      id v17 = objc_alloc_init(MEMORY[0x1E4F28F08]);
      [v17 setMaxConcurrentOperationCount:1];
      [v17 addOperation:v16];
    }
    v83[0] = MEMORY[0x1E4F143A8];
    v83[1] = 3221225472;
    v83[2] = __69__CKComposition_compositionWithShelfPluginPayload_completionHandler___block_invoke_168;
    v83[3] = &unk_1E562C8C8;
    v87 = &v93;
    v12 = v13;
    v84 = v12;
    id v18 = v9;
    id v85 = v18;
    v88 = &v102;
    id v86 = v11;
    v67 = _Block_copy(v83);
    v19 = (void *)MEMORY[0x1E4F30AA8];
    v20 = [v6 data];
    v66 = [v19 linkWithDataRepresentationWithoutSubstitutingAttachments:v20];

    if ([v6 payloadCollaborationType] == 3)
    {
      id v68 = objc_alloc_init(MEMORY[0x1E4F30A78]);
      id v21 = objc_alloc_init(+[CKComposition _LPSharedObjectMetadataClass]);
      if (v21)
      {
        [v18 startTimingForKey:@"IMPayloadCollaborationTypePendingCollaboration"];
        v22 = [v6 collaborationMetadata];
        v23 = [v22 title];
        [v21 setTitle:v23];

        objc_msgSend(v21, "setIsCollaboration:", objc_msgSend(v6, "sendAsCopy") ^ 1);
        dispatch_queue_t v24 = dispatch_queue_create("com.apple.ChatKit.CKComposition.CollaborationHandshakeBundleID", 0);
        v25 = (void *)[objc_alloc(MEMORY[0x1E4FA5608]) initWithTargetSerialQueue:v24 synchronous:1];
        v26 = [v6 collaborationMetadata];
        v76[0] = MEMORY[0x1E4F143A8];
        v76[1] = 3221225472;
        v76[2] = __69__CKComposition_compositionWithShelfPluginPayload_completionHandler___block_invoke_3;
        v76[3] = &unk_1E562C8F0;
        id v77 = v21;
        id v78 = v68;
        id v79 = v18;
        id v82 = v67;
        id v80 = v66;
        id v81 = v6;
        [v25 verifySourceBundleIdentifierFromMetadata:v26 timeout:v76 completion:5.0];
      }
      else
      {
        (*((void (**)(void *, id, void *, id))v67 + 2))(v67, v68, v66, v6);
      }

      goto LABEL_52;
    }
    if ([v6 payloadCollaborationType] != 2)
    {
      if (IMOSLoggingEnabled())
      {
        v38 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18EF18000, v38, OS_LOG_TYPE_INFO, "Starting startFetchingMetadataForURL", buf, 2u);
        }
      }
      [v18 startTimingForKey:@"startFetchingMetadataForURL"];
      id v39 = objc_alloc_init(MEMORY[0x1E4F30AB0]);
      v40 = [v6 url];
      char v41 = [v40 startAccessingSecurityScopedResource];

      v69[0] = MEMORY[0x1E4F143A8];
      v69[1] = 3221225472;
      v69[2] = __69__CKComposition_compositionWithShelfPluginPayload_completionHandler___block_invoke_207;
      v69[3] = &unk_1E5628960;
      id v70 = v39;
      id v71 = v6;
      char v75 = v41;
      id v72 = v66;
      id v73 = v18;
      id v74 = v67;
      id v68 = v39;
      dispatch_async(MEMORY[0x1E4F14428], v69);

      goto LABEL_52;
    }
    id v68 = [v6 cloudKitShare];
    if (IMOSLoggingEnabled())
    {
      v27 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v27, OS_LOG_TYPE_INFO, "Obtaining metadata for LP from CKShare", buf, 2u);
      }
    }
    if (!v68)
    {
      if (IMOSLoggingEnabled())
      {
        v42 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v112 = v6;
          _os_log_impl(&dword_18EF18000, v42, OS_LOG_TYPE_INFO, "Failed to obtain a CKShare from the plugin payload: %@", buf, 0xCu);
        }
      }
      goto LABEL_52;
    }
    [v18 startTimingForKey:@"IMPayloadCollaborationTypeCloudKit"];
    id v65 = objc_alloc_init(MEMORY[0x1E4F30B00]);
    v28 = [v68 objectForKeyedSubscript:*MEMORY[0x1E4F19DC8]];
    [v65 setTitle:v28];

    v29 = [v6 containerSetupInfo];
    v30 = [v29 containerOptions];
    v64 = [v30 applicationBundleIdentifierOverrideForContainerAccess];

    if (![v64 length])
    {
      if (IMOSLoggingEnabled())
      {
        v43 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18EF18000, v43, OS_LOG_TYPE_INFO, "Failed to get a bundleID from pluginPayload", buf, 2u);
        }
      }
LABEL_49:
      v47 = [v68 objectForKeyedSubscript:*MEMORY[0x1E4F19DC0]];
      if (v47)
      {
        v48 = (void *)[objc_alloc(MEMORY[0x1E4F30A38]) initWithData:v47 MIMEType:@"image/png"];
        [v65 setIcon:v48];

        goto LABEL_51;
      }
      if (IMOSLoggingEnabled())
      {
        v53 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v112 = v64;
          _os_log_impl(&dword_18EF18000, v53, OS_LOG_TYPE_INFO, "Falling back to using App Icon for bundleIdentifier:%@", buf, 0xCu);
        }
      }
      if ([v64 length])
      {
        if (([v64 containsString:@"com.apple."] & 1) == 0)
        {
          v63 = (void *)[objc_alloc(MEMORY[0x1E4F6F248]) initWithBundleIdentifier:v64];
          id v55 = objc_alloc(MEMORY[0x1E4F6F258]);
          v56 = +[CKUIBehavior sharedBehaviors];
          [v56 thumbnailSizeForAppIconInCollaborationLinks];
          v61 = objc_msgSend(v55, "initWithSize:scale:");

          v57 = [v63 prepareImageForDescriptor:v61];
          id v58 = objc_alloc(MEMORY[0x1E4F30A38]);
          v59 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42A80]), "initWithCGImage:", objc_msgSend(v57, "CGImage"));
          v60 = (void *)[v58 initWithPlatformImage:v59];
          [v65 setIcon:v60];

          goto LABEL_51;
        }
        if (!IMOSLoggingEnabled())
        {
LABEL_51:
          id v49 = objc_alloc_init(MEMORY[0x1E4F30AC8]);
          [v49 setSpecialization:v65];
          objc_msgSend(v49, "setIsCollaboration:", objc_msgSend(v6, "sendAsCopy") ^ 1);
          id v50 = objc_alloc_init(MEMORY[0x1E4F30A78]);
          v51 = [v6 url];
          [v50 setOriginalURL:v51];

          [v50 setSpecialization:v49];
          [v18 stopTimingForKey:@"IMPayloadCollaborationTypeCloudKit"];
          (*((void (**)(void *, id, void *, id))v67 + 2))(v67, v50, v66, v6);

LABEL_52:
          _Block_object_dispose(&v93, 8);

          goto LABEL_53;
        }
        v54 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v112 = v64;
          _os_log_impl(&dword_18EF18000, v54, OS_LOG_TYPE_INFO, "Not defaulting an icon for %@. Please file a radar!", buf, 0xCu);
        }
      }
      else
      {
        if (!IMOSLoggingEnabled()) {
          goto LABEL_51;
        }
        v54 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18EF18000, v54, OS_LOG_TYPE_INFO, "Failed to set icon on LP since we failed to get a bundleID", buf, 2u);
        }
      }

      goto LABEL_51;
    }
    v31 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v64 allowPlaceholder:1 error:0];
    v32 = [v31 URL];

    if (v32)
    {
      v33 = (void *)MEMORY[0x1E4F28B50];
      v34 = [v31 URL];
      v35 = [v33 bundleWithURL:v34];

      if (v35)
      {
        v62 = [v35 infoDictionary];
        v36 = [v62 objectForKeyedSubscript:@"CFBundleDisplayName"];
        [v65 setApplication:v36];
        if (IMOSLoggingEnabled())
        {
          v37 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            id v112 = v36;
            __int16 v113 = 2112;
            v114 = v64;
            _os_log_impl(&dword_18EF18000, v37, OS_LOG_TYPE_INFO, "Setting application to:%@ for bundleIdentifier: %@", buf, 0x16u);
          }
        }
LABEL_48:

        goto LABEL_49;
      }
    }
    else
    {
      v44 = IMLogHandleForCategory();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
        +[CKComposition compositionWithShelfPluginPayload:completionHandler:]((uint64_t)v31, v44);
      }
    }
    if (IMOSLoggingEnabled())
    {
      v45 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        v46 = [v31 URL];
        *(_DWORD *)buf = 138412290;
        id v112 = v46;
        _os_log_impl(&dword_18EF18000, v45, OS_LOG_TYPE_INFO, "Failed to get a bundle from appRecord.URL: %@", buf, 0xCu);
      }
    }
    goto LABEL_48;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__CKComposition_compositionWithShelfPluginPayload_completionHandler___block_invoke_159;
  block[3] = &unk_1E5626AD0;
  v100 = v11;
  v101 = &v102;
  dispatch_async(MEMORY[0x1E4F14428], block);
  v12 = v100;
LABEL_53:

  _Block_object_dispose(&v102, 8);
  return result;
}

- (void)cleanupCKShareFromComposition
{
  v3 = [(CKComposition *)self shelfPluginPayload];
  uint64_t v4 = [v3 payloadCollaborationType];

  if (v4 == 2)
  {
    v5 = [(CKComposition *)self shelfPluginPayload];
    id v6 = [v5 cloudKitShare];
    int v7 = [v6 isCloudKitShareRemovable];

    if (v7)
    {
      id v8 = [(CKComposition *)self shelfPluginPayload];
      [(CKComposition *)self removeShareURLForComposition:v8];
    }
  }
}

- (void)removeShareURLForComposition:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)MEMORY[0x192FBA860](@"CSCloudSharing", @"CloudSharing");
  if (objc_opt_respondsToSelector())
  {
    v5 = [v3 cloudKitShare];
    id v6 = [v3 containerSetupInfo];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __61__CKComposition_Collaboration__removeShareURLForComposition___block_invoke;
    v7[3] = &unk_1E56211F0;
    id v8 = v3;
    [v4 removeFromShare:v5 containerSetupInfo:v6 completionHandler:v7];
  }
}

void __61__CKComposition_Collaboration__removeShareURLForComposition___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  int v4 = _IMWillLog();
  if (v7)
  {
    if (!v4) {
      goto LABEL_7;
    }
    v5 = [*(id *)(a1 + 32) cloudKitShare];
    _IMAlwaysLog();
  }
  else
  {
    if (!v4) {
      goto LABEL_7;
    }
    v5 = [*(id *)(a1 + 32) url];
    id v6 = [*(id *)(a1 + 32) containerSetupInfo];
    _IMAlwaysLog();
  }
LABEL_7:
}

- (CKComposition)initWithText:(id)a3 subject:(id)a4 shelfPluginPayload:(id)a5 bizIntent:(id)a6 shelfMediaObject:(id)a7 collaborationShareOptions:(id)a8 proofreadingInfo:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  v29.receiver = self;
  v29.super_class = (Class)CKComposition;
  v22 = [(CKComposition *)&v29 init];
  if (v22)
  {
    if ([v15 length]) {
      id v23 = v15;
    }
    else {
      id v23 = 0;
    }
    [(CKComposition *)v22 setText:v23];
    if ([v16 length]) {
      id v24 = v16;
    }
    else {
      id v24 = 0;
    }
    [(CKComposition *)v22 setSubject:v24];
    [(CKComposition *)v22 setShelfPluginPayload:v17];
    v25 = (void *)[v18 copy];
    if ([v25 count])
    {
      v26 = (void *)[v18 copy];
      [(CKComposition *)v22 setBizIntent:v26];
    }
    else
    {
      [(CKComposition *)v22 setBizIntent:0];
    }

    [(CKComposition *)v22 setShelfMediaObject:v19];
    [(CKComposition *)v22 setCollaborationShareOptions:v20];
    v27 = [v20 optionsGroups];
    [(CKComposition *)v22 setCollaborationOptions:v27];

    [(CKComposition *)v22 setProofreadingInfo:v21];
  }

  return v22;
}

- (CKComposition)initWithText:(id)a3 subject:(id)a4 shelfPluginPayload:(id)a5 bizIntent:(id)a6 shelfMediaObject:(id)a7 collaborationOptions:(id)a8 proofreadingInfo:(id)a9
{
  id v16 = (void *)MEMORY[0x1E4F3BE00];
  id v17 = a9;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  id v23 = [v16 shareOptionsWithOptionsGroups:a8];
  id v24 = [(CKComposition *)self initWithText:v22 subject:v21 shelfPluginPayload:v20 bizIntent:v19 shelfMediaObject:v18 collaborationShareOptions:v23 proofreadingInfo:v17];

  return v24;
}

- (BOOL)compositionIsCollaboration
{
  v2 = [(CKComposition *)self shelfPluginPayload];
  id v3 = v2;
  if (v2 && [v2 supportsCollaboration]) {
    int v4 = [v3 sendAsCopy] ^ 1;
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (id)compositionByAppendingText:(id)a3 shelfPluginPayload:(id)a4 shelfMediaObject:(id)a5 collaborationShareOptions:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = v13;
  if (v10 || v11 || v12 || v13)
  {
    id v16 = [(CKComposition *)self text];
    if (v16)
    {
      id v17 = v16;
      if (v10)
      {
        id v18 = (id)[v16 mutableCopy];
        id v19 = [v10 string];
        int v20 = [v19 characterAtIndex:0];

        if (v20 != 10)
        {
          id v21 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"\n"];
          [v18 appendAttributedString:v21];
        }
        [v18 appendAttributedString:v10];
      }
      else
      {
        id v18 = v16;
      }
    }
    else
    {
      id v18 = v10;
    }
    id v22 = [(CKComposition *)self shelfPluginPayload];
    if (v11)
    {
      id v23 = v11;

      id v22 = v23;
    }
    id v24 = [(CKComposition *)self collaborationShareOptions];
    if (v14)
    {
      id v25 = v14;

      id v24 = v25;
    }
    v35 = v14;
    v26 = [(CKComposition *)self shelfMediaObject];
    id v36 = v11;
    id v37 = v10;
    v27 = v18;
    if (v12)
    {
      id v28 = v12;

      v26 = v28;
    }
    objc_super v29 = [CKComposition alloc];
    v30 = [(CKComposition *)self subject];
    v31 = [(CKComposition *)self bizIntent];
    v32 = [(CKComposition *)self proofreadingInfo];
    id v15 = [(CKComposition *)v29 initWithText:v27 subject:v30 shelfPluginPayload:v22 bizIntent:v31 shelfMediaObject:v26 collaborationShareOptions:v24 proofreadingInfo:v32];

    v33 = [(CKComposition *)self expressiveSendStyleID];
    [(CKComposition *)v15 setExpressiveSendStyleID:v33];

    [(CKComposition *)v15 setShouldHideClearPluginButton:[(CKComposition *)self shouldHideClearPluginButton]];
    id v11 = v36;
    id v10 = v37;
    v14 = v35;
  }
  else
  {
    id v15 = self;
  }

  return v15;
}

- (CKComposition)compositionWithCollaborationShareOptions:(id)a3
{
  return (CKComposition *)[(CKComposition *)self compositionByAppendingText:0 shelfPluginPayload:0 shelfMediaObject:0 collaborationShareOptions:a3];
}

- (id)compositionByAppendingCollaborativeComposition:(id)a3
{
  id v4 = a3;
  v5 = [(CKComposition *)self text];
  id v6 = [(CKComposition *)self shelfPluginPayload];
  id v7 = [(CKComposition *)self shelfMediaObject];
  id v8 = [(CKComposition *)self collaborationShareOptions];
  id v9 = [(CKComposition *)self compositionByAppendingText:v5 shelfPluginPayload:v6 shelfMediaObject:v7 collaborationShareOptions:v8];
  id v10 = [v4 text];
  id v11 = [v4 shelfPluginPayload];
  id v12 = [v4 shelfMediaObject];
  id v13 = [v4 collaborationShareOptions];

  v14 = [v9 compositionByAppendingText:v10 shelfPluginPayload:v11 shelfMediaObject:v12 collaborationShareOptions:v13];

  return v14;
}

- (NSArray)pasteboardItemProviders
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [(CKComposition *)self text];
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  uint64_t v6 = [v4 length];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __54__CKComposition_UIPasteboard__pasteboardItemProviders__block_invoke;
  v17[3] = &unk_1E5626210;
  id v21 = &v22;
  id v7 = v5;
  id v18 = v7;
  id v8 = v4;
  id v19 = v8;
  int v20 = self;
  objc_msgSend(v8, "enumerateAttributesInRange:options:usingBlock:", 0, v6, 0, v17);
  if (*((unsigned char *)v23 + 24))
  {
    id v9 = [[CKAttributedStringItemProviderWriter alloc] initWithAttributedString:v7];
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F28D78]) initWithObject:v9];
    [v3 addObject:v10];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __54__CKComposition_UIPasteboard__pasteboardItemProviders__block_invoke_156;
    v15[3] = &unk_1E5626238;
    id v16 = v3;
    objc_msgSend(v8, "enumerateAttributesInRange:options:usingBlock:", 0, v6, 0, v15);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Based on the content of the composition, we do not need to serialize the copied item as an attributed string. Using plain string serialization only.", v14, 2u);
      }
    }
    id v9 = [(CKAttributedStringItemProviderWriter *)[CKPlainStringItemProviderWriter alloc] initWithAttributedString:v7];
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F28D78]) initWithObject:v9];
    [v3 addObject:v10];
  }

  id v12 = v3;
  _Block_object_dispose(&v22, 8);

  return (NSArray *)v12;
}

void __54__CKComposition_UIPasteboard__pasteboardItemProviders__block_invoke(uint64_t a1, void *a2, unint64_t a3, uint64_t a4)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = [v7 objectForKeyedSubscript:@"AdaptiveImageGlyphMediaObject"];
  id v9 = [v7 objectForKeyedSubscript:@"MediaObjectForTextAttachment"];
  id v10 = [v7 objectForKeyedSubscript:@"PluginDisplayContainer"];
  id v11 = [v7 objectForKeyedSubscript:@"EmbeddedRichLinkConfiguration"];
  v31 = v11;
  v32 = v10;
  if (v8)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    if (a3 < a3 + a4)
    {
      uint64_t v12 = MEMORY[0x1E4F1CC08];
      do
      {
        id v13 = [v8 adaptiveImageGlyph];
        if (v13)
        {
          v14 = [MEMORY[0x1E4F28B18] attributedStringWithAdaptiveImageGlyph:v13 attributes:v12];
          [*(id *)(a1 + 32) appendAttributedString:v14];
        }
        else
        {
          v14 = IMLogHandleForCategory();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            __54__CKComposition_UIPasteboard__pasteboardItemProviders__block_invoke_cold_1(&buf, v42, v14);
          }
        }

        --a4;
      }
      while (a4);
    }
    goto LABEL_30;
  }
  if (v9)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    id v15 = objc_msgSend(v9, "rtfDocumentItemsWithFormatString:selectedTextRange:", 0, 0, objc_msgSend(*(id *)(a1 + 40), "length"));
    id v16 = v15;
    if (v15)
    {
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      uint64_t v17 = [v15 countByEnumeratingWithState:&v37 objects:v44 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v38;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v38 != v19) {
              objc_enumerationMutation(v16);
            }
            [*(id *)(a1 + 32) appendAttributedString:*(void *)(*((void *)&v37 + 1) + 8 * i)];
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v37 objects:v44 count:16];
        }
        while (v18);
      }
    }
LABEL_29:

    goto LABEL_30;
  }
  if (v10)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    id v21 = objc_msgSend(v10, "rtfDocumentItemsWithFormatString:selectedTextRange:", 0, 0, objc_msgSend(*(id *)(a1 + 40), "length"));
    id v16 = v21;
    if (v21)
    {
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v33 objects:v43 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v34;
        do
        {
          for (uint64_t j = 0; j != v23; ++j)
          {
            if (*(void *)v34 != v24) {
              objc_enumerationMutation(v16);
            }
            [*(id *)(a1 + 32) appendAttributedString:*(void *)(*((void *)&v33 + 1) + 8 * j)];
          }
          uint64_t v23 = [v16 countByEnumeratingWithState:&v33 objects:v43 count:16];
        }
        while (v23);
      }
    }
    goto LABEL_29;
  }
  if (v11)
  {
    v26 = [v11 url];
    v27 = [v26 absoluteString];

    uint64_t v28 = [objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v27];
  }
  else
  {
    v27 = objc_msgSend(*(id *)(a1 + 40), "attributedSubstringFromRange:", a3, a4);
    uint64_t v29 = objc_msgSend(*(id *)(a1 + 40), "ck_activeTextStylesInRange:", a3, a4);
    if (v29 | objc_msgSend(*(id *)(a1 + 40), "ck_activeTextEffectTypeInRange:", a3, a4)) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    }
    uint64_t v28 = [(id)objc_opt_class() trimUnwantedAttributesFromAttributedString:v27];
  }
  v30 = (void *)v28;
  [*(id *)(a1 + 32) appendAttributedString:v28];

LABEL_30:
}

void __54__CKComposition_UIPasteboard__pasteboardItemProviders__block_invoke_156(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = [v3 objectForKeyedSubscript:@"MediaObjectForTextAttachment"];
  id v4 = [v3 objectForKeyedSubscript:@"PluginDisplayContainer"];

  id v5 = v7;
  if (!v7)
  {
    if (!v4) {
      goto LABEL_7;
    }
    id v5 = v4;
  }
  uint64_t v6 = [v5 pasteboardItemProvider];
  if (v6) {
    [*(id *)(a1 + 32) addObject:v6];
  }

LABEL_7:
}

+ (BOOL)_shouldCreateMediaObjectForUTIType:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = (__CFString *)a3;
  if ([&unk_1EDF15368 containsObject:v3])
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    id v5 = +[CKMediaObjectManager sharedInstance];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v6 = objc_msgSend(v5, "allUTITypes", 0);
    uint64_t v4 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v7 = *(void *)v11;
LABEL_5:
      uint64_t v8 = 0;
      while (1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v6);
        }
        if (UTTypeConformsTo(v3, *(CFStringRef *)(*((void *)&v10 + 1) + 8 * v8))) {
          break;
        }
        if (v4 == ++v8)
        {
          uint64_t v4 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
          if (v4) {
            goto LABEL_5;
          }
          goto LABEL_21;
        }
      }

      if (([(id)*MEMORY[0x1E4F43C20] containsObject:v3] & 1) != 0
        || UTTypeEqual(v3, @"public.url-name")
        || ([(id)*MEMORY[0x1E4F43C18] containsObject:v3] & 1) != 0)
      {
        LOBYTE(v4) = 0;
        goto LABEL_22;
      }
      uint64_t v6 = objc_msgSend(MEMORY[0x1E4F42C50], "__ck_pasteboardTypeListRTFD");
      LOBYTE(v4) = ([v6 containsObject:v3] & 1) == 0
                && !UTTypeEqual(v3, (CFStringRef)*MEMORY[0x1E4F226A8])
                && !UTTypeEqual(v3, (CFStringRef)*MEMORY[0x1E4F225E8])
                && !UTTypeEqual(v3, (CFStringRef)*MEMORY[0x1E4F22730])
                && UTTypeConformsTo(v3, (CFStringRef)*MEMORY[0x1E4F22688]) == 0;
    }
LABEL_21:

LABEL_22:
  }

  return v4;
}

+ (void)mediaObjectForItemProvider:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[CKMediaObjectManager sharedInstance];
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy__31;
  v33[4] = __Block_byref_object_dispose__31;
  id v34 = 0;
  id v34 = [v6 registeredTypeIdentifiers];
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  char v32 = 0;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__31;
  v29[4] = __Block_byref_object_dispose__31;
  id v30 = 0;
  id v9 = (void *)*MEMORY[0x1E4F43C10];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __69__CKComposition_UIPasteboard__mediaObjectForItemProvider_completion___block_invoke;
  v28[3] = &unk_1E5626260;
  v28[4] = v33;
  v28[5] = v29;
  [v9 enumerateObjectsUsingBlock:v28];
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__31;
  v26[4] = __Block_byref_object_dispose__31;
  id v27 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__31;
  v24[4] = __Block_byref_object_dispose__31;
  id v25 = 0;
  uint64_t v10 = objc_opt_class();
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __69__CKComposition_UIPasteboard__mediaObjectForItemProvider_completion___block_invoke_2;
  v14[3] = &unk_1E5626468;
  uint64_t v18 = v29;
  uint64_t v19 = v26;
  int v20 = v24;
  id v21 = v33;
  id v23 = a1;
  id v11 = v8;
  id v15 = v11;
  id v12 = v6;
  id v16 = v12;
  uint64_t v22 = v31;
  id v13 = v7;
  id v17 = v13;
  objc_msgSend(a1, "__ck_valueForItemClass:forItemProvider:completion:", v10, v12, v14);

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(v26, 8);

  _Block_object_dispose(v29, 8);
  _Block_object_dispose(v31, 8);
  _Block_object_dispose(v33, 8);
}

void __69__CKComposition_UIPasteboard__mediaObjectForItemProvider_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  inUTI = a2;
  if (objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "containsObject:"))
  {
    int v7 = UTTypeConformsTo(inUTI, (CFStringRef)*MEMORY[0x1E4F225F8]);
    uint64_t v8 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (v7)
    {
      id v9 = *v8;
      *uint64_t v8 = 0;

      *a4 = 1;
    }
    else
    {
      objc_storeStrong(v8, a2);
    }
  }
}

void __69__CKComposition_UIPasteboard__mediaObjectForItemProvider_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v48 = a3;
  id v49 = v5;
  if (v5 && *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    uint64_t v6 = CKCreatePNGRepresentationFromUIImageFilterTypeNone(v5);
    uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), (id)*MEMORY[0x1E4F22678]);
    uint64_t v9 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) arrayByAddingObject:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
    uint64_t v10 = *(void *)(*(void *)(a1 + 80) + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
  id v12 = objc_alloc_init(CKMultiDict);
  id v13 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
  v102[0] = MEMORY[0x1E4F143A8];
  v102[1] = 3221225472;
  v102[2] = __69__CKComposition_UIPasteboard__mediaObjectForItemProvider_completion___block_invoke_3;
  v102[3] = &unk_1E5626288;
  uint64_t v105 = *(void *)(a1 + 96);
  id v103 = *(id *)(a1 + 32);
  v14 = v12;
  uint64_t v104 = v14;
  [v13 enumerateObjectsUsingBlock:v102];
  v100[0] = 0;
  v100[1] = v100;
  v100[2] = 0x3032000000;
  v100[3] = __Block_byref_object_copy__31;
  v100[4] = __Block_byref_object_dispose__31;
  id v101 = 0;
  if ([(CKMultiDict *)v14 count])
  {
    uint64_t v96 = 0;
    v97 = &v96;
    uint64_t v98 = 0x2050000000;
    uint64_t v99 = 0;
    v46 = [*(id *)(a1 + 32) classes];
    v93[0] = MEMORY[0x1E4F143A8];
    v93[1] = 3221225472;
    v93[2] = __69__CKComposition_UIPasteboard__mediaObjectForItemProvider_completion___block_invoke_4;
    v93[3] = &unk_1E56262B0;
    id v15 = v14;
    v94 = v15;
    uint64_t v95 = &v96;
    [v46 enumerateObjectsUsingBlock:v93];
    uint64_t v16 = v97[3];
    if (v16 == objc_opt_class())
    {
      id v17 = [(CKMultiDict *)v15 objectsForKey:objc_opt_class()];
      if (([v17 containsObject:*MEMORY[0x1E4F22678]] & 1) != 0
        || [v17 containsObject:*MEMORY[0x1E4F22610]])
      {
        uint64_t v83 = 0;
        v84 = &v83;
        uint64_t v85 = 0x2020000000;
        LOBYTE(v86) = 0;
        uint64_t v18 = [(CKMultiDict *)v15 objectsForKey:objc_opt_class()];
        v89[0] = MEMORY[0x1E4F143A8];
        v89[1] = 3221225472;
        v89[2] = __69__CKComposition_UIPasteboard__mediaObjectForItemProvider_completion___block_invoke_5;
        v89[3] = &unk_1E5626300;
        uint64_t v92 = *(void *)(a1 + 96);
        id v90 = *(id *)(a1 + 40);
        v91 = &v83;
        [v18 enumerateObjectsUsingBlock:v89];

        _Block_object_dispose(&v83, 8);
      }
    }
    uint64_t v83 = 0;
    v84 = &v83;
    uint64_t v85 = 0x3032000000;
    id v86 = __Block_byref_object_copy__31;
    v87 = __Block_byref_object_dispose__31;
    id v88 = 0;
    v47 = [(CKMultiDict *)v15 objectsForKey:v97[3]];
    uint64_t v19 = v97[3];
    if (v19 == objc_opt_class())
    {
      v82[0] = MEMORY[0x1E4F143A8];
      v82[1] = 3221225472;
      v82[2] = __69__CKComposition_UIPasteboard__mediaObjectForItemProvider_completion___block_invoke_7;
      v82[3] = &unk_1E5621A30;
      v82[4] = &v83;
      [v47 enumerateObjectsUsingBlock:v82];
      if (v84[5])
      {
LABEL_15:
        v77[0] = 0;
        v77[1] = v77;
        v77[2] = 0x3032000000;
        v77[3] = __Block_byref_object_copy__31;
        v77[4] = __Block_byref_object_dispose__31;
        id v78 = 0;
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __69__CKComposition_UIPasteboard__mediaObjectForItemProvider_completion___block_invoke_9;
        aBlock[3] = &unk_1E5626350;
        uint64_t v76 = *(void *)(a1 + 96);
        id v22 = *(id *)(a1 + 40);
        uint64_t v23 = *(void *)(a1 + 88);
        id v73 = v22;
        uint64_t v75 = v23;
        id v74 = *(id *)(a1 + 48);
        v44 = _Block_copy(aBlock);
        if (v84[5])
        {
          uint64_t v24 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v44];
          id v25 = v24;
          if (v24 && [v24 conformsToType:*MEMORY[0x1E4F443B8]])
          {
            id v26 = [v25 identifier];
LABEL_31:

            long long v39 = *(void **)(a1 + 40);
            v63[0] = MEMORY[0x1E4F143A8];
            v63[1] = 3221225472;
            v63[2] = __69__CKComposition_UIPasteboard__mediaObjectForItemProvider_completion___block_invoke_177;
            v63[3] = &unk_1E56263A0;
            id v40 = v39;
            uint64_t v41 = *(void *)(a1 + 96);
            id v64 = v40;
            uint64_t v67 = v41;
            id v65 = v45;
            id v66 = *(id *)(a1 + 48);
            id v42 = (id)[v40 loadDataRepresentationForTypeIdentifier:v26 completionHandler:v63];

            goto LABEL_32;
          }
        }
        else
        {
          long long v70 = 0u;
          long long v71 = 0u;
          long long v68 = 0u;
          long long v69 = 0u;
          id v25 = *(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
          uint64_t v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v68, v106, 16, v44);
          if (v27)
          {
            uint64_t v28 = *(void *)v69;
            uint64_t v29 = *MEMORY[0x1E4F443B8];
            while (2)
            {
              for (uint64_t i = 0; i != v27; ++i)
              {
                if (*(void *)v69 != v28) {
                  objc_enumerationMutation(v25);
                }
                v31 = *(void **)(*((void *)&v68 + 1) + 8 * i);
                char v32 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v31];
                if ([v32 conformsToType:v29])
                {
                  id v26 = v31;

                  goto LABEL_31;
                }
              }
              uint64_t v27 = [v25 countByEnumeratingWithState:&v68 objects:v106 count:16];
              if (v27) {
                continue;
              }
              break;
            }
          }
        }

        if ([(id)v84[5] isEqualToString:@"com.apple.messages.maputi"])
        {
          v60[0] = MEMORY[0x1E4F143A8];
          v60[1] = 3221225472;
          v60[2] = __69__CKComposition_UIPasteboard__mediaObjectForItemProvider_completion___block_invoke_3_180;
          v60[3] = &unk_1E56263C8;
          long long v33 = *(void **)(a1 + 40);
          id v61 = *(id *)(a1 + 48);
          v62 = v100;
          objc_msgSend(v33, "__ck_loadDataForAppleMapVCard:", v60);
          id v26 = v61;
        }
        else
        {
          id v34 = *(void **)(a1 + 96);
          uint64_t v35 = v84[5];
          uint64_t v36 = *(void *)(a1 + 40);
          v50[0] = MEMORY[0x1E4F143A8];
          v50[1] = 3221225472;
          v50[2] = __69__CKComposition_UIPasteboard__mediaObjectForItemProvider_completion___block_invoke_183;
          v50[3] = &unk_1E5626440;
          uint64_t v38 = *(void *)(a1 + 64);
          uint64_t v37 = *(void *)(a1 + 72);
          v54 = v77;
          uint64_t v55 = v37;
          v56 = &v83;
          uint64_t v57 = v38;
          id v58 = v100;
          v59 = v34;
          id v51 = *(id *)(a1 + 32);
          id v53 = v45;
          id v52 = *(id *)(a1 + 40);
          [v34 filenameForType:v35 forItemProvider:v36 completionHandler:v50];

          id v26 = v51;
        }
LABEL_32:

        _Block_object_dispose(v77, 8);
        _Block_object_dispose(&v83, 8);

        _Block_object_dispose(&v96, 8);
        goto LABEL_33;
      }
      uint64_t v43 = [v47 lastObject];
      id v21 = (void *)v84[5];
      v84[5] = v43;
    }
    else
    {
      int v20 = [(id)v97[3] UTITypes];
      v79[0] = MEMORY[0x1E4F143A8];
      v79[1] = 3221225472;
      v79[2] = __69__CKComposition_UIPasteboard__mediaObjectForItemProvider_completion___block_invoke_8;
      v79[3] = &unk_1E5620C90;
      id v80 = v47;
      id v81 = &v83;
      [v20 enumerateObjectsUsingBlock:v79];

      id v21 = v80;
    }

    goto LABEL_15;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_33:
  _Block_object_dispose(v100, 8);
}

void __69__CKComposition_UIPasteboard__mediaObjectForItemProvider_completion___block_invoke_3(id *a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(a1[6], "_shouldCreateMediaObjectForUTIType:")) {
    objc_msgSend(a1[5], "pushObject:forKey:", v3, objc_msgSend(a1[4], "classForUTIType:", v3));
  }
}

void __69__CKComposition_UIPasteboard__mediaObjectForItemProvider_completion___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v7 = [*(id *)(a1 + 32) peekObjectForKey:a2];

  if (v7)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
    *a4 = 1;
  }
}

uint64_t __69__CKComposition_UIPasteboard__mediaObjectForItemProvider_completion___block_invoke_5(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a1[4];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__CKComposition_UIPasteboard__mediaObjectForItemProvider_completion___block_invoke_6;
  v7[3] = &unk_1E56262D8;
  id v5 = (void *)a1[6];
  void v7[4] = a1[5];
  v7[5] = a4;
  return [v5 dataForPasteboardType:a2 forItemProvider:v4 completion:v7];
}

void __69__CKComposition_UIPasteboard__mediaObjectForItemProvider_completion___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [[CKImageData alloc] initWithData:v3];

  if ([(CKImageData *)v5 count] >= 2)
  {
    uint64_t v4 = *(unsigned char **)(a1 + 40);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *uint64_t v4 = 1;
  }
}

void __69__CKComposition_UIPasteboard__mediaObjectForItemProvider_completion___block_invoke_7(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  if ((CKUTTypeIsDynamic(v8, v7) & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

void __69__CKComposition_UIPasteboard__mediaObjectForItemProvider_completion___block_invoke_8(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:")
    && ([v7 isEqualToString:@"com.apple.icns"] & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

void __69__CKComposition_UIPasteboard__mediaObjectForItemProvider_completion___block_invoke_9(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = (void *)a1[7];
    uint64_t v6 = a1[4];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __69__CKComposition_UIPasteboard__mediaObjectForItemProvider_completion___block_invoke_10;
    v8[3] = &unk_1E5626328;
    id v9 = v3;
    [v5 dataForPasteboardType:@"com.apple.MobileSMS.appendedURL" forItemProvider:v6 completion:v8];
    uint64_t v7 = *(void *)(a1[6] + 8);
    if (!*(unsigned char *)(v7 + 24))
    {
      *(unsigned char *)(v7 + 24) = 1;
      (*(void (**)(void))(a1[5] + 16))();
    }
  }
  else
  {
    (*(void (**)(void))(a1[5] + 16))();
  }
}

void __69__CKComposition_UIPasteboard__mediaObjectForItemProvider_completion___block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v15 = 138412290;
      id v16 = v5;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "appendedData %@", (uint8_t *)&v15, 0xCu);
    }
  }
  if (v5)
  {
    id v8 = (void *)[[NSString alloc] initWithData:v5 encoding:4];
    if (IMOSLoggingEnabled())
    {
      id v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v15 = 138412290;
        id v16 = v8;
        _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "appendedPath %@", (uint8_t *)&v15, 0xCu);
      }
    }
    if (v8)
    {
      uint64_t v10 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v8];
      if (IMOSLoggingEnabled())
      {
        id v11 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          int v15 = 138412290;
          id v16 = v10;
          _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "appendedVideoURL %@", (uint8_t *)&v15, 0xCu);
        }
      }
      if (v10)
      {
        id v12 = [*(id *)(a1 + 32) fileURL];
        id v13 = CKGetTmpPathForAppendedVideoURL(v10, v12);

        v14 = [*(id *)(a1 + 32) transferGUID];
        CKLinkAndCreateAppendedVideoTransfer(v13, v10, v14);
      }
    }
  }
}

void __69__CKComposition_UIPasteboard__mediaObjectForItemProvider_completion___block_invoke_177(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)NSString;
  id v4 = a2;
  id v5 = (void *)[[v3 alloc] initWithData:v4 encoding:4];

  id v6 = [MEMORY[0x1E4F1CB10] URLWithString:v5];
  uint64_t v7 = [*(id *)(a1 + 32) suggestedName];
  if (!v7)
  {
    id v8 = [v6 lastPathComponent];
    uint64_t v7 = [v8 stringByRemovingPercentEncoding];
  }
  id v9 = *(void **)(a1 + 56);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__CKComposition_UIPasteboard__mediaObjectForItemProvider_completion___block_invoke_2_178;
  v10[3] = &unk_1E5626378;
  id v11 = *(id *)(a1 + 40);
  id v12 = *(id *)(a1 + 48);
  [v9 mediaObjectFromItemAtURL:v6 filename:v7 completion:v10];
}

uint64_t __69__CKComposition_UIPasteboard__mediaObjectForItemProvider_completion___block_invoke_2_178(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __69__CKComposition_UIPasteboard__mediaObjectForItemProvider_completion___block_invoke_3_180(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (v8 && v7 && !v9)
  {
    id v11 = +[CKMediaObjectManager sharedInstance];
    uint64_t v12 = [v11 mediaObjectWithData:v7 UTIType:@"com.apple.messages.maputi" filename:v8 transcoderUserInfo:0];
    uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
    v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      int v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        int v16 = 138412290;
        uint64_t v17 = v10;
        _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "Failed to load apple map vCard with error: %@", (uint8_t *)&v16, 0xCu);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __69__CKComposition_UIPasteboard__mediaObjectForItemProvider_completion___block_invoke_183(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
  }
  uint64_t v40 = 0;
  uint64_t v41 = (id *)&v40;
  uint64_t v42 = 0x3032000000;
  uint64_t v43 = __Block_byref_object_copy__31;
  v44 = __Block_byref_object_dispose__31;
  id v45 = 0;
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)
    && objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), "isEqualToString:"))
  {
    objc_storeStrong(v41 + 5, *(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40));
    id v8 = [*(id *)(a1 + 96) _transcoderUserInfoFor:v41[5] filename:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) type:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__CKComposition_UIPasteboard__mediaObjectForItemProvider_completion___block_invoke_2_184;
    block[3] = &unk_1E56263F0;
    uint64_t v36 = *(void *)(a1 + 88);
    id v9 = *(id *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 72);
    uint64_t v37 = &v40;
    uint64_t v38 = v10;
    id v11 = *(void **)(a1 + 48);
    uint64_t v39 = *(void *)(a1 + 56);
    id v33 = v9;
    id v34 = v8;
    id v35 = v11;
    id v12 = v8;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    uint64_t v13 = *(void *)(a1 + 72);
    uint64_t v14 = *(void *)(*(void *)(v13 + 8) + 40);
    if (!v14)
    {
      uint64_t v19 = +[CKMediaObjectManager sharedInstance];
      int v20 = [MEMORY[0x1E4F1CB10] URLWithString:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
      uint64_t v21 = [v19 mediaObjectWithFileURL:v20 filename:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) transcoderUserInfo:0];
      uint64_t v22 = *(void *)(*(void *)(a1 + 88) + 8);
      uint64_t v23 = *(void **)(v22 + 40);
      *(void *)(v22 + 40) = v21;

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      goto LABEL_10;
    }
    int v15 = *(void **)(a1 + 96);
    uint64_t v16 = *(void *)(a1 + 40);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __69__CKComposition_UIPasteboard__mediaObjectForItemProvider_completion___block_invoke_3_186;
    v24[3] = &unk_1E5626418;
    uint64_t v17 = *(void *)(a1 + 56);
    uint64_t v27 = &v40;
    uint64_t v28 = v17;
    uint64_t v18 = *(void *)(a1 + 88);
    uint64_t v29 = v13;
    uint64_t v30 = v18;
    v31 = v15;
    id v25 = *(id *)(a1 + 32);
    id v26 = *(id *)(a1 + 48);
    [v15 dataForPasteboardType:v14 forItemProvider:v16 completion:v24];

    id v12 = v25;
  }

LABEL_10:
  _Block_object_dispose(&v40, 8);
}

uint64_t __69__CKComposition_UIPasteboard__mediaObjectForItemProvider_completion___block_invoke_2_184(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) mediaObjectWithData:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) UTIType:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) filename:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) transcoderUserInfo:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v5();
}

void __69__CKComposition_UIPasteboard__mediaObjectForItemProvider_completion___block_invoke_3_186(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    id v5 = [*(id *)(a1 + 80) _transcoderUserInfoFor:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) filename:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) type:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__CKComposition_UIPasteboard__mediaObjectForItemProvider_completion___block_invoke_4_187;
    block[3] = &unk_1E56263F0;
    uint64_t v13 = *(void *)(a1 + 72);
    id v6 = *(id *)(a1 + 32);
    id v7 = *(void **)(a1 + 40);
    uint64_t v14 = *(void *)(a1 + 48);
    int8x16_t v15 = vextq_s8(*(int8x16_t *)(a1 + 56), *(int8x16_t *)(a1 + 56), 8uLL);
    id v10 = v6;
    id v11 = v5;
    id v12 = v7;
    id v8 = v5;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __69__CKComposition_UIPasteboard__mediaObjectForItemProvider_completion___block_invoke_4_187(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) mediaObjectWithData:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) UTIType:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) filename:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) transcoderUserInfo:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v5();
}

+ (id)_transcoderUserInfoFor:(id)a3 filename:(id)a4 type:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = (__CFString *)a5;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  int v11 = UTTypeConformsTo(v9, (CFStringRef)*MEMORY[0x1E4F22548]);
  if (v7 && v11 && [v7 length])
  {
    int v12 = IMIsHEVCWithAlphaVideoFromData();
    if (IMOSLoggingEnabled())
    {
      uint64_t v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = [v7 length];
        int8x16_t v15 = @"NO";
        if (v12) {
          int8x16_t v15 = @"YES";
        }
        int v17 = 134218242;
        uint64_t v18 = v14;
        __int16 v19 = 2112;
        int v20 = v15;
        _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "Checked data (size=%lu) has alpha video channel: %@", (uint8_t *)&v17, 0x16u);
      }
    }
    if (v12) {
      [(__CFDictionary *)Mutable setObject:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F6D390]];
    }
  }

  return Mutable;
}

+ (void)pluginDisplayContainerForItemProvider:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 registeredTypeIdentifiers];
  if ([v8 containsObject:@"com.apple.MobileSMS.PluginPayload"])
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __80__CKComposition_UIPasteboard__pluginDisplayContainerForItemProvider_completion___block_invoke;
    v9[3] = &unk_1E5624F78;
    id v10 = v7;
    [a1 dataForPasteboardType:@"com.apple.MobileSMS.PluginPayload" forItemProvider:v6 completion:v9];
  }
  else
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

void __80__CKComposition_UIPasteboard__pluginDisplayContainerForItemProvider_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v6 = 0;
  uint64_t v3 = +[CKPluginDisplayContainer unarchiveFromData:a2 error:&v6];
  id v4 = v6;
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void *, id))(v5 + 16))(v5, v3, v4);
  }
}

+ (void)__ck_valueForItemClass:(Class)a3 forItemProvider:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __81__CKComposition_UIPasteboard____ck_valueForItemClass_forItemProvider_completion___block_invoke;
  v12[3] = &unk_1E5626490;
  id v13 = v7;
  id v14 = v8;
  id v9 = v8;
  id v10 = v7;
  id v11 = (id)[v10 loadObjectOfClass:a3 completionHandler:v12];
}

void __81__CKComposition_UIPasteboard____ck_valueForItemClass_forItemProvider_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6 && IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      id v9 = [v6 localizedDescription];
      *(_DWORD *)uint8_t buf = 138412546;
      uint64_t v18 = v8;
      __int16 v19 = 2112;
      int v20 = v9;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Failed to get itemClass for itemProvider: %@, error: %@", buf, 0x16u);
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__CKComposition_UIPasteboard____ck_valueForItemClass_forItemProvider_completion___block_invoke_198;
  block[3] = &unk_1E5622EC8;
  id v10 = *(id *)(a1 + 40);
  id v15 = v6;
  id v16 = v10;
  id v14 = v5;
  id v11 = v6;
  id v12 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __81__CKComposition_UIPasteboard____ck_valueForItemClass_forItemProvider_completion___block_invoke_198(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

+ (void)dataForPasteboardType:(id)a3 forItemProvider:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __80__CKComposition_UIPasteboard__dataForPasteboardType_forItemProvider_completion___block_invoke;
  v12[3] = &unk_1E56264B8;
  id v13 = v7;
  id v14 = v8;
  id v9 = v8;
  id v10 = v7;
  id v11 = (id)[v10 loadDataRepresentationForTypeIdentifier:a3 completionHandler:v12];
}

void __80__CKComposition_UIPasteboard__dataForPasteboardType_forItemProvider_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6 && IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      id v9 = [v6 localizedDescription];
      *(_DWORD *)uint8_t buf = 138412546;
      uint64_t v18 = v8;
      __int16 v19 = 2112;
      int v20 = v9;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Failed to get data for itemProvider: %@, error: %@", buf, 0x16u);
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__CKComposition_UIPasteboard__dataForPasteboardType_forItemProvider_completion___block_invoke_200;
  block[3] = &unk_1E5622EC8;
  id v10 = *(id *)(a1 + 40);
  id v15 = v6;
  id v16 = v10;
  id v14 = v5;
  id v11 = v6;
  id v12 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __80__CKComposition_UIPasteboard__dataForPasteboardType_forItemProvider_completion___block_invoke_200(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

+ (void)filenameForType:(id)a3 forItemProvider:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[CKMediaObjectManager sharedInstance];
  id v12 = [v9 registeredTypeIdentifiers];
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__31;
  v26[4] = __Block_byref_object_dispose__31;
  id v27 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __81__CKComposition_UIPasteboard__filenameForType_forItemProvider_completionHandler___block_invoke;
  v21[3] = &unk_1E5621A30;
  v21[4] = &v22;
  [v12 enumerateObjectsUsingBlock:v21];
  if (*((unsigned char *)v23 + 24))
  {
    uint64_t v13 = objc_opt_class();
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __81__CKComposition_UIPasteboard__filenameForType_forItemProvider_completionHandler___block_invoke_2;
    v14[3] = &unk_1E5626508;
    id v15 = v11;
    id v16 = v8;
    id v20 = a1;
    id v17 = v9;
    id v18 = v10;
    __int16 v19 = v26;
    objc_msgSend(a1, "__ck_valueForItemClass:forItemProvider:completion:", v13, v17, v14);
  }
  else
  {
    (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
  }
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(v26, 8);
}

uint64_t __81__CKComposition_UIPasteboard__filenameForType_forItemProvider_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [(id)*MEMORY[0x1E4F43C18] containsObject:a2];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

void __81__CKComposition_UIPasteboard__filenameForType_forItemProvider_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    CFStringRef v5 = [*(id *)(a1 + 32) UTITypeForFilename:v4];
    id v6 = (__CFString *)v5;
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7)
    {
      if (v5)
      {
        if (UTTypeEqual(v5, *(CFStringRef *)(a1 + 40)))
        {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a2);
          (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_11:

          goto LABEL_12;
        }
        uint64_t v7 = *(void *)(a1 + 40);
      }
      id v11 = *(void **)(a1 + 72);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __81__CKComposition_UIPasteboard__filenameForType_forItemProvider_completionHandler___block_invoke_4;
      v13[3] = &unk_1E56264E0;
      uint64_t v12 = *(void *)(a1 + 48);
      id v14 = *(id *)(a1 + 56);
      [v11 filenameFromURLTypeForType:v7 forItemProvider:v12 completionHandler:v13];
      id v10 = v14;
    }
    else
    {
      id v8 = *(void **)(a1 + 72);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __81__CKComposition_UIPasteboard__filenameForType_forItemProvider_completionHandler___block_invoke_3;
      v15[3] = &unk_1E56264E0;
      uint64_t v9 = *(void *)(a1 + 48);
      id v16 = *(id *)(a1 + 56);
      [v8 filenameFromURLTypeForType:v6 forItemProvider:v9 completionHandler:v15];
      id v10 = v16;
    }

    goto LABEL_11;
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_12:
}

uint64_t __81__CKComposition_UIPasteboard__filenameForType_forItemProvider_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __81__CKComposition_UIPasteboard__filenameForType_forItemProvider_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)filenameFromURLTypeForType:(id)a3 forItemProvider:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __92__CKComposition_UIPasteboard__filenameFromURLTypeForType_forItemProvider_completionHandler___block_invoke;
  v14[3] = &unk_1E5626558;
  id v17 = v10;
  id v18 = a1;
  id v15 = v9;
  id v16 = v8;
  id v11 = v8;
  id v12 = v9;
  id v13 = v10;
  [a1 _fileNameFromURLNameForItemProvider:v12 fileType:v11 completion:v14];
}

void __92__CKComposition_UIPasteboard__filenameFromURLTypeForType_forItemProvider_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v2();
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __92__CKComposition_UIPasteboard__filenameFromURLTypeForType_forItemProvider_completionHandler___block_invoke_2;
    v7[3] = &unk_1E5626530;
    CFStringRef v5 = *(void **)(a1 + 56);
    id v6 = *(id *)(a1 + 48);
    id v8 = 0;
    id v9 = v6;
    [v5 _fileNameFromFileURLForItemProvider:v3 fileType:v4 completion:v7];
  }
}

uint64_t __92__CKComposition_UIPasteboard__filenameFromURLTypeForType_forItemProvider_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (void)_fileNameFromURLNameForItemProvider:(id)a3 fileType:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 registeredTypeIdentifiers];
  if ([v11 containsObject:@"public.url-name"])
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __87__CKComposition_UIPasteboard___fileNameFromURLNameForItemProvider_fileType_completion___block_invoke;
    v12[3] = &unk_1E56264B8;
    id v13 = v9;
    id v14 = v10;
    [a1 dataForPasteboardType:@"public.url-name" forItemProvider:v8 completion:v12];
  }
  else
  {
    (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
  }
}

void __87__CKComposition_UIPasteboard___fileNameFromURLNameForItemProvider_fileType_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a3;
  CFStringRef v5 = (objc_class *)NSString;
  id v6 = a2;
  uint64_t v7 = (void *)[[v5 alloc] initWithData:v6 usedEncoding:0];

  if (v7)
  {
    id v8 = [*(id *)(a1 + 32) pathExtension];
    id v9 = [v7 stringByAppendingPathExtension:v8];

    id v10 = +[CKMediaObjectManager sharedInstance];
    id v11 = [v10 UTITypeForFilename:v9];

    if (!UTTypeEqual(v11, *(CFStringRef *)(a1 + 32)))
    {

      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (void)_fileNameFromFileURLForItemProvider:(id)a3 fileType:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 registeredTypeIdentifiers];
  if ([v11 containsObject:@"public.file-url"])
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __87__CKComposition_UIPasteboard___fileNameFromFileURLForItemProvider_fileType_completion___block_invoke;
    v12[3] = &unk_1E56264B8;
    id v13 = v9;
    id v14 = v10;
    [a1 dataForPasteboardType:@"public.file-url" forItemProvider:v8 completion:v12];
  }
  else
  {
    (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
  }
}

void __87__CKComposition_UIPasteboard___fileNameFromFileURLForItemProvider_fileType_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a3;
  CFStringRef v5 = (objc_class *)NSString;
  id v6 = a2;
  uint64_t v7 = (void *)[[v5 alloc] initWithData:v6 usedEncoding:0];

  if (v7)
  {
    id v8 = +[CKMediaObjectManager sharedInstance];
    id v9 = [v8 UTITypeForFilename:v7];

    if (!UTTypeEqual(v9, *(CFStringRef *)(a1 + 32)))
    {

      uint64_t v7 = 0;
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (id)_attributedStringByTransformingLinksFromAttributedString:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 length];
  CFStringRef v5 = (void *)[v3 mutableCopy];
  uint64_t v6 = *MEMORY[0x1E4FB0720];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = __88__CKComposition_UIPasteboard___attributedStringByTransformingLinksFromAttributedString___block_invoke;
  id v14 = &unk_1E5625D98;
  id v15 = v5;
  id v16 = v3;
  id v7 = v3;
  id v8 = v5;
  objc_msgSend(v7, "enumerateAttribute:inRange:options:usingBlock:", v6, 0, v4, 2, &v11);
  id v9 = objc_msgSend(v8, "copy", v11, v12, v13, v14);

  return v9;
}

void __88__CKComposition_UIPasteboard___attributedStringByTransformingLinksFromAttributedString___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v18 = a2;
  if (v18)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v18;
    }
    else {
      id v7 = 0;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = [v18 absoluteString];

      id v7 = (id)v8;
    }
    if (v7)
    {
      id v9 = [*(id *)(a1 + 40) string];
      id v10 = objc_msgSend(v9, "substringWithRange:", a3, a4);

      uint64_t v11 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
      int v12 = [v11 isRichLinkImprovementsEnabled];

      if (v12)
      {
        id v13 = v10;
      }
      else
      {
        id v13 = [NSString stringWithFormat:@"%@ (%@)", v10, v7];
      }
      id v14 = v13;
      id v15 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
      id v16 = [v14 stringByTrimmingCharactersInSet:v15];

      objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", *MEMORY[0x1E4FB0720], a3, a4);
      id v17 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v16];
      objc_msgSend(*(id *)(a1 + 32), "replaceCharactersInRange:withAttributedString:", a3, a4, v17);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", *MEMORY[0x1E4FB0720], a3, a4);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", *MEMORY[0x1E4FB0720], a3, a4);
  }
}

+ (id)_trimUnwantedAttributesFromAttributedString:(id)a3 allowedAttributes:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _attributedStringByTransformingLinksFromAttributedString:a3];
  uint64_t v8 = (void *)[v7 mutableCopy];

  objc_msgSend(v8, "ck_removeAttributesNotIn:", v6);
  id v9 = (void *)[v8 copy];

  return v9;
}

+ (id)trimUnwantedAttributesFromAttributedString:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F28B18];
  id v5 = a3;
  id v6 = objc_msgSend(v4, "ck_defaultAllowedAttributesForComposition");
  id v7 = [a1 _trimUnwantedAttributesFromAttributedString:v5 allowedAttributes:v6];

  return v7;
}

+ (BOOL)isRTFDocumentWithItemProvider:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  obuint64_t j = [a3 registeredTypeIdentifiers];
  uint64_t v3 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v19;
    id v6 = (void *)*MEMORY[0x1E4F444A0];
    id v7 = (void *)*MEMORY[0x1E4F444A8];
    uint64_t v8 = (void *)*MEMORY[0x1E4F443C0];
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v11 = [v6 identifier];
        if ([v10 isEqualToString:v11]) {
          goto LABEL_14;
        }
        int v12 = [v7 identifier];
        if ([v10 isEqualToString:v12])
        {

LABEL_14:
LABEL_15:
          BOOL v15 = 1;
          goto LABEL_16;
        }
        id v13 = [v8 identifier];
        char v14 = [v10 isEqualToString:v13];

        if (v14) {
          goto LABEL_15;
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
      BOOL v15 = 0;
      if (v4) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v15 = 0;
  }
LABEL_16:

  return v15;
}

+ (void)_pasteAttributedStringWithItemProvider:(id)a3 builderContext:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = objc_opt_class();
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __103__CKComposition_UIPasteboard___pasteAttributedStringWithItemProvider_builderContext_completionHandler___block_invoke;
  v14[3] = &unk_1E56265A8;
  id v16 = v9;
  id v17 = a1;
  id v15 = v8;
  id v12 = v9;
  id v13 = v8;
  objc_msgSend(a1, "__ck_valueForItemClass:forItemProvider:completion:", v11, v10, v14);
}

void __103__CKComposition_UIPasteboard___pasteAttributedStringWithItemProvider_builderContext_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F1CA48] array];
  id v8 = objc_msgSend(MEMORY[0x1E4F28B18], "ck_defaultAllowedAttributesForComposition");
  id v9 = (void *)[v8 mutableCopy];

  if (([*(id *)(a1 + 32) supportsExpressiveText] & 1) == 0)
  {
    [v9 removeObject:*MEMORY[0x1E4F6E400]];
    [v9 removeObject:*MEMORY[0x1E4F6E3F8]];
    [v9 removeObject:*MEMORY[0x1E4F6E408]];
    [v9 removeObject:*MEMORY[0x1E4F6E420]];
    [v9 removeObject:*MEMORY[0x1E4F6E410]];
  }
  id v10 = [*(id *)(a1 + 48) _trimUnwantedAttributesFromAttributedString:v5 allowedAttributes:v9];

  uint64_t v11 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v12 = [v11 isExpressiveTextEnabled];

  if (v12 && [*(id *)(a1 + 32) canUseRichTextAttributes])
  {
    id v13 = (void *)[v10 mutableCopy];
    objc_msgSend(v13, "ck_replaceBIUSWithIMTextStyles");
    uint64_t v14 = [v13 copy];

    id v10 = (void *)v14;
  }
  if ([*(id *)(a1 + 32) wantsInlinedRichLinks])
  {
    uint64_t v15 = objc_msgSend(v10, "ck_attributedStringByPostProcessingURLTextForRichLinks");

    id v10 = (void *)v15;
  }
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  char v26 = 0;
  uint64_t v16 = [v10 length];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __103__CKComposition_UIPasteboard___pasteAttributedStringWithItemProvider_builderContext_completionHandler___block_invoke_2;
  v21[3] = &unk_1E5626580;
  id v17 = v7;
  id v22 = v17;
  id v18 = v10;
  id v23 = v18;
  uint64_t v24 = v25;
  objc_msgSend(v18, "enumerateAttributesInRange:options:usingBlock:", 0, v16, 0, v21);
  long long v19 = [*(id *)(a1 + 48) finalCompositionFromAllCompositions:v17];
  uint64_t v20 = *(void *)(a1 + 40);
  if (v20) {
    (*(void (**)(uint64_t, void *, void))(v20 + 16))(v20, v19, 0);
  }

  _Block_object_dispose(v25, 8);
}

void __103__CKComposition_UIPasteboard___pasteAttributedStringWithItemProvider_builderContext_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = [v7 objectForKey:@"com.apple.messages.mapattribute"];
  id v9 = v8;
  if (v8)
  {
    id v10 = [v8 objectForKey:@"com.apple.messages.mapvcard"];
    uint64_t v11 = [v9 objectForKey:@"com.apple.messages.mapvcard.name"];
    int v12 = [v9 objectForKey:@"com.apple.messages.maputi"];
    id v56 = 0;
    id v13 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v10 options:1 error:&v56];
    id v14 = v56;
    uint64_t v15 = v14;
    if (v13) {
      BOOL v16 = v14 == 0;
    }
    else {
      BOOL v16 = 0;
    }
    if (v16)
    {
      long long v21 = +[CKMediaObjectManager sharedInstance];
      id v22 = [v21 mediaObjectWithData:v13 UTIType:v12 filename:v11 transcoderUserInfo:0];

      id v23 = *(void **)(a1 + 32);
      uint64_t v24 = +[CKComposition compositionWithMediaObject:v22 subject:0];
      [v23 addObject:v24];
    }
    else if (IMOSLoggingEnabled())
    {
      id v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        id v18 = [v15 localizedDescription];
        *(_DWORD *)uint8_t buf = 138413058;
        *(void *)&uint8_t buf[4] = v12;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v11;
        *(_WORD *)&buf[22] = 2112;
        id v58 = v10;
        __int16 v59 = 2112;
        v60 = v18;
        _os_log_impl(&dword_18EF18000, v17, OS_LOG_TYPE_INFO, "Unable to load map vCard data for uti type: %@, mapName: %@, URL: %@ with error: %@", buf, 0x2Au);
      }
    }

    goto LABEL_14;
  }
  id v10 = [v7 objectForKey:*MEMORY[0x1E4FB06B8]];
  uint64_t v11 = [v7 objectForKeyedSubscript:@"EmbeddedRichLinkConfiguration"];
  if (v11)
  {
    long long v19 = objc_msgSend(*(id *)(a1 + 40), "attributedSubstringFromRange:", a3, a4);
    uint64_t v20 = [[CKComposition alloc] initWithText:v19 subject:0];
    [*(id *)(a1 + 32) addObject:v20];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;

    goto LABEL_14;
  }
  if (v10)
  {
    char v25 = [v10 fileType];
    char v26 = [v25 isEqualToString:@"public.url-name"];

    if (v26)
    {
LABEL_27:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
      goto LABEL_14;
    }
    *(void *)uint8_t buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    LOBYTE(v58) = 0;
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __103__CKComposition_UIPasteboard___pasteAttributedStringWithItemProvider_builderContext_completionHandler___block_invoke_208;
    v53[3] = &unk_1E56248B0;
    uint64_t v55 = buf;
    id v27 = *(void **)(a1 + 40);
    id v54 = *(id *)(a1 + 32);
    objc_msgSend(v27, "enumerateAttribute:inRange:options:usingBlock:", @"com.apple.MobileSMS.PluginPayload", a3, a4, 0, v53);
    if (*(unsigned char *)(*(void *)&buf[8] + 24))
    {
LABEL_26:

      _Block_object_dispose(buf, 8);
      goto LABEL_27;
    }
    uint64_t v28 = [v10 contents];

    if (v28)
    {
      id v48 = +[CKMediaObjectManager sharedInstance];
      uint64_t v29 = [v10 contents];
      uint64_t v30 = [v10 fileType];
      v31 = [v48 mediaObjectWithData:v29 UTIType:v30 filename:0 transcoderUserInfo:0];
LABEL_25:

      uint64_t v42 = *(void **)(a1 + 40);
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __103__CKComposition_UIPasteboard___pasteAttributedStringWithItemProvider_builderContext_completionHandler___block_invoke_209;
      v50[3] = &unk_1E5624860;
      id v43 = v31;
      id v51 = v43;
      objc_msgSend(v42, "enumerateAttribute:inRange:options:usingBlock:", @"com.apple.MobileSMS.appendedURL", a3, a4, 0, v50);
      v44 = *(void **)(a1 + 32);
      id v45 = +[CKComposition compositionWithMediaObject:v43 subject:0];
      [v44 addObject:v45];

      goto LABEL_26;
    }
    uint64_t v38 = [v10 fileWrapper];

    if (v38)
    {
      id v48 = [v10 fileWrapper];
      uint64_t v29 = [v48 preferredFilename];
      uint64_t v30 = +[CKMediaObjectManager sharedInstance];
      v47 = [v48 regularFileContents];
      uint64_t v39 = IMUTITypeForFilename();
      uint64_t v40 = [v30 mediaObjectWithData:v47 UTIType:v39 filename:v29 transcoderUserInfo:0];
      uint64_t v41 = (void *)v39;
      v31 = (void *)v40;

      goto LABEL_25;
    }
    if (IMOSLoggingEnabled())
    {
      v46 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v52 = 0;
        _os_log_impl(&dword_18EF18000, v46, OS_LOG_TYPE_INFO, "Pasted text attachment has no content!", v52, 2u);
      }
    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v49 = objc_msgSend(*(id *)(a1 + 40), "attributedSubstringFromRange:", a3, a4);
    char v32 = objc_msgSend(v49, "ck_attributedStringByRemovingUnsupportedCompositionAttributes");
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      id v33 = [*(id *)(a1 + 32) lastObject];
      id v34 = objc_alloc(MEMORY[0x1E4F28E48]);
      id v35 = [v33 text];
      uint64_t v36 = (void *)[v34 initWithAttributedString:v35];

      [v36 appendAttributedString:v32];
      [*(id *)(a1 + 32) removeLastObject];

      char v32 = v36;
    }
    uint64_t v37 = [[CKComposition alloc] initWithText:v32 subject:0];
    [*(id *)(a1 + 32) addObject:v37];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
LABEL_14:
}

void __103__CKComposition_UIPasteboard___pasteAttributedStringWithItemProvider_builderContext_completionHandler___block_invoke_208(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    uint64_t v3 = +[CKPluginDisplayContainer unarchiveFromData:a2 error:0];
    if (v3)
    {
      id v14 = v3;
      uint64_t v4 = [v3 pluginPayload];
      id v5 = [v4 pluginBundleID];
      int v6 = [v5 isEqualToString:*MEMORY[0x1E4F6CC10]];

      if (v6)
      {
        id v7 = [v14 pluginPayload];
        id v8 = [v7 data];
        id v9 = [v14 pluginPayload];
        id v10 = [v9 attachments];
        uint64_t v11 = IMSharedHelperCombinedPluginPayloadDictionaryDataWithAttachmentURLs();

        if (v11)
        {
          int v12 = [v14 pluginPayload];
          [v12 setData:v11];
        }
      }
      id v13 = +[CKComposition compositionWithPluginDisplayContainer:v14 subject:0];
      [*(id *)(a1 + 32) addObject:v13];

      uint64_t v3 = v14;
    }
  }
}

void __103__CKComposition_UIPasteboard___pasteAttributedStringWithItemProvider_builderContext_completionHandler___block_invoke_209(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        int v12 = 138412290;
        id v13 = v3;
        _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "appendedData %@", (uint8_t *)&v12, 0xCu);
      }
    }
    id v5 = [v3 absoluteString];
    if (IMOSLoggingEnabled())
    {
      int v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v12 = 138412290;
        id v13 = v5;
        _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "appendedPath %@", (uint8_t *)&v12, 0xCu);
      }
    }
    if (v5)
    {
      id v7 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5];
      if (IMOSLoggingEnabled())
      {
        id v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          int v12 = 138412290;
          id v13 = v7;
          _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "appendedVideoURL %@", (uint8_t *)&v12, 0xCu);
        }
      }
      if (v7)
      {
        id v9 = [*(id *)(a1 + 32) fileURL];
        id v10 = CKGetTmpPathForAppendedVideoURL(v7, v9);

        uint64_t v11 = [*(id *)(a1 + 32) transferGUID];
        CKLinkAndCreateAppendedVideoTransfer(v10, v7, v11);
      }
    }
  }
}

+ (void)_pasteRTFDocumentWithItemProvider:(id)a3 builderContext:(id)a4 completionHandler:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([a1 isRTFDocumentWithItemProvider:v10]) {
    [a1 _pasteAttributedStringWithItemProvider:v10 builderContext:v8 completionHandler:v9];
  }
}

+ (void)createPluginPayloadCompositionFromItemProvider:(id)a3 builderContext:(id)a4 shareOptions:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (([v10 hasItemConformingToTypeIdentifier:@"com.apple.cloudkit.sharingsupport.pre"] & 1) != 0
    || [v10 hasItemConformingToTypeIdentifier:@"com.apple.cloudkit.sharingsupport.post"])
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __124__CKComposition_UIPasteboard__createPluginPayloadCompositionFromItemProvider_builderContext_shareOptions_completionHandler___block_invoke;
    v19[3] = &unk_1E56261E8;
    id v20 = v13;
    [a1 createPluginPayloadCompositionFromCloudKitItemProvider:v10 collaborationShareOptions:v12 completionHandler:v19];
    uint64_t v14 = v20;
  }
  else if ([v10 hasItemConformingToTypeIdentifier:*MEMORY[0x1E4F3BE60]])
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __124__CKComposition_UIPasteboard__createPluginPayloadCompositionFromItemProvider_builderContext_shareOptions_completionHandler___block_invoke_211;
    v17[3] = &unk_1E56261E8;
    id v18 = v13;
    [a1 createPluginPayloadCompositionFromCollaborativeItemProvider:v10 collaborationShareOptions:v12 completionHandler:v17];
    uint64_t v14 = v18;
  }
  else
  {
    if (![v10 hasItemConformingToTypeIdentifier:*MEMORY[0x1E4F22608]])
    {
      (*((void (**)(id, void, void))v13 + 2))(v13, 0, 0);
      goto LABEL_5;
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __124__CKComposition_UIPasteboard__createPluginPayloadCompositionFromItemProvider_builderContext_shareOptions_completionHandler___block_invoke_212;
    v15[3] = &unk_1E56261E8;
    id v16 = v13;
    [a1 _createPluginPayloadCompositionFromFileItemProvider:v10 builderContext:v11 collaborationShareOptions:v12 completionHandler:v15];
    uint64_t v14 = v16;
  }

LABEL_5:
}

void __124__CKComposition_UIPasteboard__createPluginPayloadCompositionFromItemProvider_builderContext_shareOptions_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = IMOSLoggingEnabled();
  if (v5)
  {
    if (v7)
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint8_t buf = 0;
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Returning composition for CKShare.", buf, 2u);
      }
    }
    id v9 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if (v7)
    {
      id v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v11 = 0;
        _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "CloudKit returned nil composition.", v11, 2u);
      }
    }
    id v9 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v9();
}

void __124__CKComposition_UIPasteboard__createPluginPayloadCompositionFromItemProvider_builderContext_shareOptions_completionHandler___block_invoke_211(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = IMOSLoggingEnabled();
  if (v5)
  {
    if (v7)
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint8_t buf = 0;
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Returning composition for SWShareableContent.", buf, 2u);
      }
    }
    id v9 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if (v7)
    {
      id v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v11 = 0;
        _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Item Provider cannot load any type identifiers we tried. Returning nil composition.", v11, 2u);
      }
    }
    id v9 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v9();
}

void __124__CKComposition_UIPasteboard__createPluginPayloadCompositionFromItemProvider_builderContext_shareOptions_completionHandler___block_invoke_212(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = IMOSLoggingEnabled();
  if (v5)
  {
    if (v7)
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint8_t buf = 0;
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Returning composition for FP.", buf, 2u);
      }
    }
    id v9 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if (v7)
    {
      id v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v11 = 0;
        _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "File Provider returned nil composition.", v11, 2u);
      }
    }
    id v9 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v9();
}

+ (void)_createPluginPayloadCompositionFromFileItemProvider:(id)a3 builderContext:(id)a4 collaborationShareOptions:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (IMOSLoggingEnabled())
  {
    uint64_t v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint8_t buf = 0;
      _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "IN _createPluginPayloadCompositionFromFileItemProvider", buf, 2u);
    }
  }
  uint64_t v15 = [v10 registeredTypeIdentifiersWithFileOptions:1];
  *(void *)uint8_t buf = 0;
  uint64_t v40 = buf;
  uint64_t v41 = 0x3032000000;
  uint64_t v42 = __Block_byref_object_copy__31;
  id v43 = __Block_byref_object_dispose__31;
  id v44 = 0;
  id v44 = [v15 firstObject];
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = __Block_byref_object_copy__31;
  v37[4] = __Block_byref_object_dispose__31;
  id v38 = 0;
  id v38 = [a1 richestMediaTypeForItemProvider:v10];
  if (*((void *)v40 + 5))
  {
    location[0] = 0;
    objc_initWeak(location, a1);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke;
    aBlock[3] = &unk_1E5626710;
    objc_copyWeak(v35, location);
    v35[1] = a1;
    id v16 = v10;
    id v29 = v16;
    id v33 = v37;
    id v30 = v11;
    id v32 = v13;
    id v31 = v12;
    id v34 = buf;
    id v17 = _Block_copy(aBlock);
    if ([*((id *)v40 + 5) isEqualToString:*MEMORY[0x1E4F3BE40]]
      && [v16 hasItemConformingToTypeIdentifier:@"public.file-url"])
    {
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_3_270;
      v26[3] = &unk_1E5626760;
      id v27 = v17;
      [v16 loadItemForTypeIdentifier:@"public.file-url" options:0 completionHandler:v26];
      id v18 = &v27;
    }
    else
    {
      uint64_t v19 = *((void *)v40 + 5);
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_2_275;
      v24[3] = &unk_1E56267B0;
      id v25 = v17;
      id v20 = (id)[v16 loadInPlaceFileRepresentationForTypeIdentifier:v19 completionHandler:v24];
      id v18 = &v25;
    }

    objc_destroyWeak(v35);
    objc_destroyWeak(location);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      long long v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_18EF18000, v21, OS_LOG_TYPE_INFO, "Item is not of type openInPlaceType, so we can't offer Collaboration.", (uint8_t *)location, 2u);
      }
    }
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_277;
    v22[3] = &unk_1E5622840;
    id v23 = v13;
    [a1 _requestCompositionFromItemProviderForNonCollaboration:v10 builderContext:v11 completion:v22];
  }
  _Block_object_dispose(v37, 8);

  _Block_object_dispose(buf, 8);
}

void __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));

  if (WeakRetained)
  {
    if (v7 && !v8 && a3)
    {
      *(void *)uint8_t buf = 0;
      id v33 = buf;
      uint64_t v34 = 0x3032000000;
      id v35 = __Block_byref_object_copy__31;
      uint64_t v36 = __Block_byref_object_dispose__31;
      uint64_t v37 = 0;
      id v10 = *(void **)(a1 + 88);
      uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      id v12 = *(void **)(a1 + 32);
      uint64_t v13 = *(void *)(a1 + 40);
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_2;
      v23[3] = &unk_1E56266E8;
      id v24 = v12;
      objc_copyWeak(&v31, (id *)(a1 + 80));
      id v25 = *(id *)(a1 + 40);
      id v29 = buf;
      id v28 = *(id *)(a1 + 56);
      id v26 = v7;
      id v14 = *(id *)(a1 + 48);
      uint64_t v15 = *(void *)(a1 + 72);
      id v27 = v14;
      uint64_t v30 = v15;
      [v10 requestMediaObjectForItemProvider:v24 type:v11 builderContext:v13 completion:v23];

      objc_destroyWeak(&v31);
      _Block_object_dispose(buf, 8);
      id v16 = v37;
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        id v17 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)uint8_t buf = 0;
          _os_log_impl(&dword_18EF18000, v17, OS_LOG_TYPE_INFO, "Item is not of type openInPlaceType, so we can't offer Collaboration.", buf, 2u);
        }
      }
      id v18 = objc_loadWeakRetained((id *)(a1 + 80));
      uint64_t v19 = *(void *)(a1 + 32);
      uint64_t v20 = *(void *)(a1 + 40);
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_267;
      v21[3] = &unk_1E5622840;
      id v22 = *(id *)(a1 + 56);
      [v18 _requestCompositionFromItemProviderForNonCollaboration:v19 builderContext:v20 completion:v21];

      id v16 = v22;
    }
  }
}

void __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), a2);
    uint64_t v11 = objc_opt_class();
    if (([v11 isEqual:objc_opt_class()] & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        id v12 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)uint8_t buf = 138412290;
          uint64_t v38 = objc_opt_class();
          _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "Class %@ should go through the non collaborative flow", buf, 0xCu);
        }
      }
      uint64_t v13 = *(void *)(a1 + 64);
      id v14 = +[CKComposition compositionWithMediaObject:v8 subject:0];
      (*(void (**)(uint64_t, void *, id))(v13 + 16))(v13, v14, v10);

      goto LABEL_20;
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        uint64_t v16 = *(void *)(a1 + 32);
        id v17 = [v10 localizedDescription];
        *(_DWORD *)uint8_t buf = 138412546;
        uint64_t v38 = v16;
        __int16 v39 = 2112;
        uint64_t v40 = v17;
        _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "Failed to get mediaObject for itemProvider: %@, error: %@", buf, 0x16u);
      }
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
    uint64_t v19 = *(void *)(a1 + 32);
    uint64_t v20 = *(void *)(a1 + 40);
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_213;
    v36[3] = &unk_1E56265D0;
    v36[4] = *(void *)(a1 + 72);
    [WeakRetained _requestCompositionFromItemProviderForNonCollaboration:v19 builderContext:v20 completion:v36];
  }
  long long v21 = +[CKBrowserItemPayload createBrowserItemPayloadWithURL:*(void *)(a1 + 48) data:0];
  int v22 = [*(id *)(a1 + 48) startAccessingSecurityScopedResource];
  if (IMOSLoggingEnabled())
  {
    id v23 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      id v24 = @"NO";
      if (v22) {
        id v24 = @"YES";
      }
      *(_DWORD *)uint8_t buf = 138412290;
      uint64_t v38 = (uint64_t)v24;
      _os_log_impl(&dword_18EF18000, v23, OS_LOG_TYPE_INFO, "File is inPlace and it's from a fileProvider. Start accessing security scoped resource: %@", buf, 0xCu);
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_216;
  block[3] = &unk_1E56266C0;
  objc_copyWeak(&v34, (id *)(a1 + 88));
  id v27 = *(id *)(a1 + 32);
  id v28 = *(id *)(a1 + 40);
  id v32 = *(id *)(a1 + 64);
  id v29 = *(id *)(a1 + 56);
  id v30 = *(id *)(a1 + 48);
  id v31 = v21;
  long long v33 = *(_OWORD *)(a1 + 72);
  char v35 = v22;
  id v25 = v21;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v34);
LABEL_20:
}

void __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_213(uint64_t a1, void *a2)
{
  id v6 = [a2 mediaObjects];
  uint64_t v3 = [v6 firstObject];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_216(uint64_t a1)
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_2_217;
  aBlock[3] = &unk_1E5626698;
  objc_copyWeak(&v25, (id *)(a1 + 96));
  id v17 = *(id *)(a1 + 32);
  id v18 = *(id *)(a1 + 40);
  id v22 = *(id *)(a1 + 72);
  id v19 = *(id *)(a1 + 48);
  id v2 = *(id *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 80);
  id v20 = v2;
  uint64_t v23 = v3;
  id v4 = *(id *)(a1 + 64);
  uint64_t v5 = *(void *)(a1 + 88);
  id v21 = v4;
  uint64_t v24 = v5;
  char v26 = *(unsigned char *)(a1 + 104);
  id v6 = _Block_copy(aBlock);
  if (CKCloudKitPostShareType_block_invoke__pred_SWCollaborationMetadataForDocumentURLSharedWithYouCore != -1) {
    dispatch_once(&CKCloudKitPostShareType_block_invoke__pred_SWCollaborationMetadataForDocumentURLSharedWithYouCore, &__block_literal_global_93);
  }
  if (CKCloudKitPostShareType_block_invoke__pred_FPProviderForShareURLFileProvider != -1) {
    dispatch_once(&CKCloudKitPostShareType_block_invoke__pred_FPProviderForShareURLFileProvider, &__block_literal_global_257_0);
  }
  if (CKCloudKitPostShareType_block_invoke__SWCollaborationMetadataForDocumentURL
    && CKCloudKitPostShareType_block_invoke__FPProviderForShareURL)
  {
    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v15 = 0;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Invoking SWCollaborationMetadataForDocumentURL", v15, 2u);
      }
    }
    id v8 = (void (*)(uint64_t, NSObject *))CKCloudKitPostShareType_block_invoke__SWCollaborationMetadataForDocumentURL;
    uint64_t v9 = *(void *)(a1 + 56);
    id v10 = _Block_copy(v6);
    v8(v9, v10);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v15 = 0;
        _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "CKComposition_UIPasteboard_Collaboration: We're running on a build without SWCollaborationMetadataForDocumentURL, or the dependent FileProvider change from rdar://89285840. Falling back to the legacy SPI flow to retrieve collaboration metadata", v15, 2u);
      }
    }
    if (CKCloudKitPostShareType_block_invoke__pred_FPCollaborationMetadataForDocumentURL_PreliminaryFileProvider != -1) {
      dispatch_once(&CKCloudKitPostShareType_block_invoke__pred_FPCollaborationMetadataForDocumentURL_PreliminaryFileProvider, &__block_literal_global_264);
    }
    if (CKCloudKitPostShareType_block_invoke__FPCollaborationMetadataForDocumentURL_Preliminary)
    {
      if (IMOSLoggingEnabled())
      {
        id v12 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)uint64_t v15 = 0;
          _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "Invoking FPCollaborationMetadataForDocumentURL_Preliminary", v15, 2u);
        }
      }
      uint64_t v13 = (void (*)(uint64_t, NSObject *))CKCloudKitPostShareType_block_invoke__FPCollaborationMetadataForDocumentURL_Preliminary;
      uint64_t v14 = *(void *)(a1 + 56);
      id v10 = _Block_copy(v6);
      v13(v14, v10);
    }
    else
    {
      id v10 = IMLogHandleForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_216_cold_1();
      }
    }
  }

  objc_destroyWeak(&v25);
}

void __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_2_217(uint64_t a1, void *a2, void *a3)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v6;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Error while getting collaborationMetadata: %@.", (uint8_t *)&buf, 0xCu);
      }
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_218;
    v37[3] = &unk_1E5622840;
    id v38 = *(id *)(a1 + 72);
    [WeakRetained _requestCompositionFromItemProviderForNonCollaboration:v9 builderContext:v10 completion:v37];
  }
  else
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v44 = 0x3032000000;
    id v45 = __Block_byref_object_copy__31;
    v46 = __Block_byref_object_dispose__31;
    id v47 = 0;
    uint64_t v11 = *(void **)(a1 + 48);
    if (v11)
    {
      id v12 = v11;
      id v13 = v47;
      id v47 = v12;
    }
    else if (objc_opt_respondsToSelector())
    {
      id v13 = [v5 defaultShareOptions];
      uint64_t v14 = [v13 copy];
      uint64_t v15 = *(void **)(*((void *)&buf + 1) + 40);
      *(void *)(*((void *)&buf + 1) + 40) = v14;
    }
    else
    {
      uint64_t v16 = (void *)MEMORY[0x1E4F3BE00];
      id v13 = [v5 defaultOptions];
      id v17 = (void *)[v13 copy];
      uint64_t v18 = [v16 shareOptionsWithOptionsGroups:v17];
      id v19 = *(void **)(*((void *)&buf + 1) + 40);
      *(void *)(*((void *)&buf + 1) + 40) = v18;
    }
    if (IMOSLoggingEnabled())
    {
      id v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        uint64_t v21 = *(void *)(*((void *)&buf + 1) + 40);
        *(_DWORD *)__int16 v39 = 138412546;
        *(void *)&v39[4] = v5;
        *(_WORD *)&v39[12] = 2112;
        *(void *)&v39[14] = v21;
        _os_log_impl(&dword_18EF18000, v20, OS_LOG_TYPE_INFO, "FileProvider returned collaborationMetadata: %@. Share options: %@", v39, 0x16u);
      }
    }
    *(void *)__int16 v39 = 0;
    *(void *)&v39[8] = v39;
    *(void *)&v39[16] = 0x3032000000;
    uint64_t v40 = __Block_byref_object_copy__31;
    uint64_t v41 = __Block_byref_object_dispose__31;
    id v42 = 0;
    id v42 = v5;
    id v22 = (void *)MEMORY[0x1E4F59BA8];
    uint64_t v23 = *(void *)(a1 + 56);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_223;
    v26[3] = &unk_1E5626670;
    long long v25 = *(_OWORD *)(a1 + 72);
    id v24 = (id)v25;
    long long v31 = v25;
    objc_copyWeak(&v35, (id *)(a1 + 96));
    id v27 = *(id *)(a1 + 32);
    id v28 = *(id *)(a1 + 40);
    id v32 = v39;
    id v29 = *(id *)(a1 + 64);
    p_long long buf = &buf;
    uint64_t v34 = *(void *)(a1 + 88);
    id v30 = *(id *)(a1 + 56);
    char v36 = *(unsigned char *)(a1 + 104);
    [v22 userNameAndEmail:v23 containerSetupInfo:0 completionHandler:v26];

    objc_destroyWeak(&v35);
    _Block_object_dispose(v39, 8);

    _Block_object_dispose(&buf, 8);
  }
}

void __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_218(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_2_219;
  v6[3] = &unk_1E5623828;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_2_219(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_223(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  int v10 = IMOSLoggingEnabled();
  if (v9)
  {
    if (v10)
    {
      uint64_t v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        id v62 = v9;
        _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Error while trying to get the user name and email : %@.", buf, 0xCu);
      }
    }
    if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_224;
      block[3] = &unk_1E56265F8;
      id v12 = *(id *)(a1 + 64);
      uint64_t v13 = *(void *)(a1 + 72);
      v60[0] = v12;
      v60[1] = v13;
      id v9 = v9;
      id v59 = v9;
      dispatch_async(MEMORY[0x1E4F14428], block);

      uint64_t v14 = (id *)v60;
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
      uint64_t v25 = *(void *)(a1 + 32);
      uint64_t v26 = *(void *)(a1 + 40);
      v56[0] = MEMORY[0x1E4F143A8];
      v56[1] = 3221225472;
      v56[2] = __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_2_225;
      v56[3] = &unk_1E5622840;
      id v57 = *(id *)(a1 + 64);
      [WeakRetained _requestCompositionFromItemProviderForNonCollaboration:v25 builderContext:v26 completion:v56];

      uint64_t v14 = &v57;
    }
    id v16 = *v14;
    goto LABEL_46;
  }
  if (v10)
  {
    uint64_t v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v62 = v8;
      _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "Setting initiatorHandle to: %@.", buf, 0xCu);
    }
  }
  [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) setInitiatorHandle:v8];
  id v16 = objc_alloc_init(MEMORY[0x1E4F28F38]);
  id v17 = [v16 personNameComponentsFromString:v7];
  [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) setInitiatorNameComponents:v17];
  [*(id *)(a1 + 48) setCollaborationMetadata:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
  [*(id *)(a1 + 48) setPayloadCollaborationType:0];
  uint64_t v18 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) optionsGroups];

  int v19 = IMOSLoggingEnabled();
  if (!v18)
  {
    if (v19)
    {
      id v27 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_18EF18000, v27, OS_LOG_TYPE_INFO, "FileProvider returned nil options so we don't offer collaboration.", buf, 2u);
      }
    }
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_247;
    v47[3] = &unk_1E56265F8;
    id v28 = *(id *)(a1 + 64);
    uint64_t v29 = *(void *)(a1 + 72);
    id v49 = v28;
    uint64_t v50 = v29;
    id v48 = 0;
    dispatch_async(MEMORY[0x1E4F14428], v47);

    id v9 = 0;
    id v30 = v49;
    goto LABEL_43;
  }
  if (v19)
  {
    id v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = *(void **)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
      *(_DWORD *)long long buf = 138412290;
      id v62 = v21;
      _os_log_impl(&dword_18EF18000, v20, OS_LOG_TYPE_INFO, "Received options from File Provider. Share options: %@", buf, 0xCu);
    }
  }
  if (([*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) containsString:@"com.apple.iwork"] & 1) == 0)
  {
    id v31 = objc_alloc(MEMORY[0x1E4F22408]);
    uint64_t v32 = *(void *)(a1 + 56);
    id v55 = 0;
    long long v33 = (void *)[v31 initWithURL:v32 error:&v55];
    id v22 = v55;
    uint64_t v34 = [v33 claimRecord];
    char v35 = objc_opt_respondsToSelector();

    if (v35)
    {
      char v36 = [v33 claimRecord];
      int v23 = [v36 defaultShareModeCollaboration];

      if (!v22) {
        goto LABEL_33;
      }
    }
    else
    {
      int v23 = 1;
      if (!v22)
      {
LABEL_33:

        goto LABEL_34;
      }
    }
    uint64_t v37 = IMLogHandleForCategory();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_223_cold_1(v22, v37);
    }

    goto LABEL_33;
  }
  id v22 = 0;
  int v23 = 1;
LABEL_34:
  [*(id *)(a1 + 48) setSendAsCopy:v23 ^ 1u];
  if (objc_opt_respondsToSelector())
  {
    id v38 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) summary];
    if (v38)
    {
      [*(id *)(a1 + 48) setCollaborationOptionsSummary:v38];
    }
    else
    {
      __int16 v39 = CKFrameworkBundle();
      uint64_t v40 = [v39 localizedStringForKey:@"DEFAULT_COLLABORATION_OPTIONS_SUMMARY" value:&stru_1EDE4CA38 table:@"ChatKit"];
      [*(id *)(a1 + 48) setCollaborationOptionsSummary:v40];
    }
  }
  uint64_t v41 = [MEMORY[0x1E4F25D38] defaultManager];
  id v42 = [v41 itemForURL:*(void *)(a1 + 56) error:0];
  id v30 = [v42 providerID];

  if (objc_msgSend(v30, "fp_isiCloudDriveOrCloudDocsIdentifier")) {
    uint64_t v43 = 1;
  }
  else {
    uint64_t v43 = 3;
  }
  [*(id *)(a1 + 48) setPayloadCollaborationType:v43];
  uint64_t v44 = *(void *)(a1 + 48);
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_245;
  v51[3] = &unk_1E5626648;
  uint64_t v54 = *(void *)(a1 + 88);
  long long v46 = *(_OWORD *)(a1 + 64);
  id v45 = (id)v46;
  long long v53 = v46;
  id v9 = v22;
  id v52 = v9;
  +[CKComposition compositionWithShelfPluginPayload:v44 completionHandler:v51];

LABEL_43:
  if (*(unsigned char *)(a1 + 112)) {
    [*(id *)(a1 + 56) stopAccessingSecurityScopedResource];
  }

LABEL_46:
}

void __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_224(void *a1)
{
  uint64_t v2 = a1[5];
  id v3 = +[CKComposition compositionWithMediaObject:*(void *)(*(void *)(a1[6] + 8) + 40) subject:0];
  (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v3, a1[4]);
}

void __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_2_225(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_3;
  v6[3] = &unk_1E5623828;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_245(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[CKComposition compositionWithShelfMediaObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_2_246;
  block[3] = &unk_1E5626620;
  id v8 = v3;
  id v9 = v4;
  uint64_t v12 = *(void *)(a1 + 56);
  id v11 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 32);
  id v5 = v4;
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_2_246(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) compositionByAppendingComposition:*(void *)(a1 + 40)];
  id v3 = [v2 compositionWithCollaborationShareOptions:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_247(void *a1)
{
  uint64_t v2 = a1[5];
  id v3 = +[CKComposition compositionWithMediaObject:*(void *)(*(void *)(a1[6] + 8) + 40) subject:0];
  (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v3, a1[4]);
}

void *__142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_2_250()
{
  uint64_t result = (void *)MEMORY[0x192FBA870]("SWCollaborationMetadataForDocumentURL", @"SharedWithYouCore");
  CKCloudKitPostShareType_block_invoke__SWCollaborationMetadataForDocumentURL = result;
  return result;
}

uint64_t __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_3_255()
{
  uint64_t result = MEMORY[0x192FBA870]("FPProviderForShareURL", @"FileProvider");
  CKCloudKitPostShareType_block_invoke__FPProviderForShareURL = result;
  return result;
}

void *__142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_262()
{
  uint64_t result = (void *)MEMORY[0x192FBA870]("FPCollaborationMetadataForDocumentURL_Preliminary", @"FileProvider");
  CKCloudKitPostShareType_block_invoke__FPCollaborationMetadataForDocumentURL_Preliminary = result;
  return result;
}

void __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_267(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_2_268;
  v6[3] = &unk_1E5623828;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_2_268(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_3_270(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412546;
      id v17 = v5;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Loading NSItemProvider URL: %@, error: %@", buf, 0x16u);
    }
  }
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F28CA0]) initWithFilePresenter:0];
  id v15 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_272;
  v12[3] = &unk_1E5626738;
  id v9 = *(id *)(a1 + 32);
  id v13 = v6;
  id v14 = v9;
  id v10 = v6;
  [v8 coordinateReadingItemAtURL:v5 options:1 error:&v15 byAccessor:v12];
  id v11 = v15;
}

uint64_t __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_272(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, 1, *(void *)(a1 + 32));
}

void __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_2_275(uint64_t a1, void *a2, int a3, void *a4)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  if (IMOSLoggingEnabled())
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = @"NO";
      *(_DWORD *)long long buf = 138412802;
      id v21 = v7;
      __int16 v22 = 2112;
      if (a3) {
        id v10 = @"YES";
      }
      int v23 = v10;
      __int16 v24 = 2112;
      id v25 = v8;
      _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Loading NSItemProvider URL: %@, isInPlace:%@, error: %@", buf, 0x20u);
    }
  }
  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F28CA0]) initWithFilePresenter:0];
  id v19 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_276;
  v15[3] = &unk_1E5626788;
  id v12 = *(id *)(a1 + 32);
  char v18 = a3;
  id v16 = v8;
  id v17 = v12;
  id v13 = v8;
  [v11 coordinateReadingItemAtURL:v7 options:1 error:&v19 byAccessor:v15];
  id v14 = v19;
}

uint64_t __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_276(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

void __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_277(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_2_278;
  v6[3] = &unk_1E5623828;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_2_278(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

+ (void)createPluginPayloadCompositionFromCloudKitItemProvider:(id)a3 collaborationShareOptions:(id)a4 completionHandler:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = @"com.apple.cloudkit.sharingsupport.pre";
  if ([v7 hasItemConformingToTypeIdentifier:@"com.apple.cloudkit.sharingsupport.pre"])
  {
    id v11 = @"CKPreSharingContext";
LABEL_5:
    Class v12 = NSClassFromString(&v11->isa);
    if (IMOSLoggingEnabled())
    {
      id v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        id v27 = v10;
        _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "Loading Cloud Kit content for type identifier: %@", buf, 0xCu);
      }
    }
    uint64_t v14 = objc_opt_class();
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __130__CKComposition_UIPasteboard__createPluginPayloadCompositionFromCloudKitItemProvider_collaborationShareOptions_completionHandler___block_invoke;
    v22[3] = &unk_1E5626828;
    id v23 = v8;
    id v24 = v9;
    Class v25 = v12;
    id v15 = v9;
    id v16 = (id)[v7 loadObjectOfClass:v14 completionHandler:v22];

    id v17 = &v23;
    goto LABEL_15;
  }
  id v10 = @"com.apple.cloudkit.sharingsupport.post";
  if ([v7 hasItemConformingToTypeIdentifier:@"com.apple.cloudkit.sharingsupport.post"])
  {
    id v11 = @"CKPostSharingContext";
    goto LABEL_5;
  }
  if (IMOSLoggingEnabled())
  {
    char v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_18EF18000, v18, OS_LOG_TYPE_INFO, "Type identifer is not CKCloudKitPreShareType or CKCloudKitPostShareType. Returning nil composition;",
        buf,
        2u);
    }
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __130__CKComposition_UIPasteboard__createPluginPayloadCompositionFromCloudKitItemProvider_collaborationShareOptions_completionHandler___block_invoke_297;
  v20[3] = &unk_1E5620F48;
  id v17 = &v21;
  id v21 = v9;
  id v19 = v9;
  dispatch_async(MEMORY[0x1E4F14428], v20);
LABEL_15:
}

void __130__CKComposition_UIPasteboard__createPluginPayloadCompositionFromCloudKitItemProvider_collaborationShareOptions_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v43 = a3;
  uint64_t v41 = v4;
  if (v4)
  {
    id v46 = v4;
    id v5 = [v46 share];
    id v47 = [v5 URL];
    uint64_t v34 = [v46 allowedOptions];
    id v6 = *(void **)(a1 + 32);
    if (v6)
    {
      id v7 = v6;
    }
    else
    {
      if (objc_opt_respondsToSelector())
      {
        id v10 = [v34 shareOptions];
        uint64_t v11 = [v10 copy];
      }
      else
      {
        Class v12 = (void *)MEMORY[0x1E4F3BE00];
        id v10 = [v34 optionsGroups];
        uint64_t v11 = [v12 shareOptionsWithOptionsGroups:v10];
      }
      id v7 = (id)v11;
    }
    char v35 = [v47 absoluteString];
    uint64_t v44 = [v47 fragment];
    id v38 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F19DC8]];
    uint64_t v40 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F19DD0]];
    if (v40)
    {
      id v13 = objc_msgSend(MEMORY[0x1E4F442D8], "typeWithIdentifier:");
    }
    else
    {
      id v13 = 0;
    }
    uint64_t v14 = v44;
    if (![v13 conformsToType:*MEMORY[0x1E4F44408]]
      || ![v13 conformsToType:*MEMORY[0x1E4F44378]]
      || ![v13 conformsToType:*MEMORY[0x1E4F44390]]
      || ([v13 conformsToType:*MEMORY[0x1E4F444D8]] & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        id v15 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412290;
          id v56 = v13;
          _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "Setting contentType to nil for a non file type. was: %@", buf, 0xCu);
        }
      }
      id v13 = 0;
      uint64_t v14 = v44;
    }
    if (v14)
    {
      id v16 = [NSString stringWithFormat:@"#%@", v14];
      char v36 = [v35 stringByReplacingOccurrencesOfString:v16 withString:&stru_1EDE4CA38];
    }
    else
    {
      char v36 = &stru_1EDE4CA38;
    }
    __int16 v39 = [v5 currentUserParticipant];
    id v17 = [v39 userIdentity];
    id v42 = [v17 lookupInfo];
    char v18 = [v42 phoneNumber];
    id v19 = v18;
    if (v18)
    {
      id v37 = v18;
    }
    else
    {
      id v37 = [v42 emailAddress];
    }

    uint64_t v20 = [v17 nameComponents];
    int v21 = [MEMORY[0x1E4F3BDE0] instancesRespondToSelector:sel_initWithCollaborationIdentifier_title_defaultShareOptions_creationDate_contentType_initiatorHandle_initiatorNameComponents_containerSetupInfo_sourceProcessData_];
    id v22 = objc_alloc(MEMORY[0x1E4F3BDE0]);
    if (v21)
    {
      id v23 = [v46 containerSetupInfo];
      uint64_t v24 = [v22 initWithCollaborationIdentifier:v36 title:v38 defaultShareOptions:v7 creationDate:0 contentType:v13 initiatorHandle:v37 initiatorNameComponents:v20 containerSetupInfo:v23 sourceProcessData:0];
    }
    else
    {
      id v23 = [v7 optionsGroups];
      uint64_t v24 = [v22 initWithCollaborationIdentifier:v36 title:v38 defaultOptions:v23 creationDate:0 contentType:v13 initiatorHandle:v37 initiatorNameComponents:v20];
    }
    Class v25 = (void *)v24;

    uint64_t v26 = +[CKBrowserItemPayload createBrowserItemPayloadWithURL:v47 data:0];
    [v26 setPayloadCollaborationType:2];
    [v26 setCloudKitShare:v5];
    [v26 setCollaborationMetadata:v25];
    if (objc_opt_respondsToSelector())
    {
      id v27 = [v7 summary];
      if (v27)
      {
        [v26 setCollaborationOptionsSummary:v27];
      }
      else
      {
        uint64_t v28 = CKFrameworkBundle();
        uint64_t v29 = [v28 localizedStringForKey:@"DEFAULT_COLLABORATION_OPTIONS_SUMMARY" value:&stru_1EDE4CA38 table:@"ChatKit"];
        [v26 setCollaborationOptionsSummary:v29];
      }
    }
    if (IMOSLoggingEnabled())
    {
      id v30 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412802;
        id v56 = v47;
        __int16 v57 = 2112;
        id v58 = v7;
        __int16 v59 = 2112;
        v60 = v25;
        _os_log_impl(&dword_18EF18000, v30, OS_LOG_TYPE_INFO, "Received URL:%@ , Sharing Optons: %@, Metadata: %@", buf, 0x20u);
      }
    }
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __130__CKComposition_UIPasteboard__createPluginPayloadCompositionFromCloudKitItemProvider_collaborationShareOptions_completionHandler___block_invoke_294;
    v51[3] = &unk_1E5626800;
    id v52 = v7;
    id v31 = *(id *)(a1 + 40);
    id v53 = v43;
    id v54 = v31;
    id v32 = v43;
    id v33 = v7;
    +[CKComposition compositionWithShelfPluginPayload:v26 completionHandler:v51];
  }
  else
  {
    id v8 = IMLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __130__CKComposition_UIPasteboard__createPluginPayloadCompositionFromCloudKitItemProvider_collaborationShareOptions_completionHandler___block_invoke_cold_1(a1, v43, v8);
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __130__CKComposition_UIPasteboard__createPluginPayloadCompositionFromCloudKitItemProvider_collaborationShareOptions_completionHandler___block_invoke_295;
    block[3] = &unk_1E5623828;
    id v9 = *(id *)(a1 + 40);
    id v49 = v43;
    id v50 = v9;
    id v46 = v43;
    dispatch_async(MEMORY[0x1E4F14428], block);

    id v5 = v50;
  }
}

void __130__CKComposition_UIPasteboard__createPluginPayloadCompositionFromCloudKitItemProvider_collaborationShareOptions_completionHandler___block_invoke_294(id *a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __130__CKComposition_UIPasteboard__createPluginPayloadCompositionFromCloudKitItemProvider_collaborationShareOptions_completionHandler___block_invoke_2;
  v5[3] = &unk_1E56267D8;
  id v6 = v3;
  id v7 = a1[4];
  id v9 = a1[6];
  id v8 = a1[5];
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

void __130__CKComposition_UIPasteboard__createPluginPayloadCompositionFromCloudKitItemProvider_collaborationShareOptions_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) compositionWithCollaborationShareOptions:*(void *)(a1 + 40)];
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "Returning composition for CKShare. Composition.", v4, 2u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

uint64_t __130__CKComposition_UIPasteboard__createPluginPayloadCompositionFromCloudKitItemProvider_collaborationShareOptions_completionHandler___block_invoke_295(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __130__CKComposition_UIPasteboard__createPluginPayloadCompositionFromCloudKitItemProvider_collaborationShareOptions_completionHandler___block_invoke_297(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)createPluginPayloadCompositionFromCollaborativeItemProvider:(id)a3 collaborationShareOptions:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Loading SWY item provider", buf, 2u);
    }
  }
  uint64_t v11 = objc_opt_class();
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __135__CKComposition_UIPasteboard__createPluginPayloadCompositionFromCollaborativeItemProvider_collaborationShareOptions_completionHandler___block_invoke;
  v15[3] = &unk_1E5626490;
  id v16 = v8;
  id v17 = v9;
  id v12 = v9;
  id v13 = v8;
  id v14 = (id)[v7 loadObjectOfClass:v11 completionHandler:v15];
}

void __135__CKComposition_UIPasteboard__createPluginPayloadCompositionFromCollaborativeItemProvider_collaborationShareOptions_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Loading object of class _SWPendingCollaboration.", buf, 2u);
    }
  }
  id v8 = v5;
  id v9 = [v8 collaborationMetadata];
  id v10 = *(void **)(a1 + 32);
  if (v10)
  {
    id v11 = v10;
  }
  else
  {
    if (objc_opt_respondsToSelector())
    {
      id v12 = [v9 defaultShareOptions];
      id v11 = (id)[v12 copy];
    }
    else
    {
      id v13 = (void *)MEMORY[0x1E4F3BE00];
      id v12 = [v9 defaultOptions];
      id v11 = [v13 shareOptionsWithOptionsGroups:v12];
    }
  }
  id v14 = [v8 fileURL];
  id v15 = +[CKBrowserItemPayload createBrowserItemPayloadWithURL:v14 data:0];
  [v15 setCollaborationMetadata:v9];
  [v15 setPayloadCollaborationType:3];
  id v16 = [v11 summary];
  if (v16)
  {
    [v15 setCollaborationOptionsSummary:v16];
  }
  else
  {
    id v17 = CKFrameworkBundle();
    char v18 = [v17 localizedStringForKey:@"DEFAULT_COLLABORATION_OPTIONS_SUMMARY" value:&stru_1EDE4CA38 table:@"ChatKit"];
    [v15 setCollaborationOptionsSummary:v18];
  }
  if (IMOSLoggingEnabled())
  {
    id v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412802;
      uint64_t v28 = v14;
      __int16 v29 = 2112;
      id v30 = v9;
      __int16 v31 = 2112;
      id v32 = v11;
      _os_log_impl(&dword_18EF18000, v19, OS_LOG_TYPE_INFO, "Creating a composition with pluginPayload url: %@, metadata: %@, share options: %@", buf, 0x20u);
    }
  }
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __135__CKComposition_UIPasteboard__createPluginPayloadCompositionFromCollaborativeItemProvider_collaborationShareOptions_completionHandler___block_invoke_299;
  v23[3] = &unk_1E5626800;
  id v24 = v11;
  id v20 = *(id *)(a1 + 40);
  id v25 = v6;
  id v26 = v20;
  id v21 = v6;
  id v22 = v11;
  +[CKComposition compositionWithShelfPluginPayload:v15 completionHandler:v23];
}

void __135__CKComposition_UIPasteboard__createPluginPayloadCompositionFromCollaborativeItemProvider_collaborationShareOptions_completionHandler___block_invoke_299(id *a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __135__CKComposition_UIPasteboard__createPluginPayloadCompositionFromCollaborativeItemProvider_collaborationShareOptions_completionHandler___block_invoke_2;
  v5[3] = &unk_1E56267D8;
  id v6 = v3;
  id v7 = a1[4];
  id v9 = a1[6];
  id v8 = a1[5];
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

void __135__CKComposition_UIPasteboard__createPluginPayloadCompositionFromCollaborativeItemProvider_collaborationShareOptions_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) compositionWithCollaborationShareOptions:*(void *)(a1 + 40)];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

+ (void)compositionFromItemProviders:(id)a3 shareOptions:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![v8 count]) {
    (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __91__CKComposition_UIPasteboard__compositionFromItemProviders_shareOptions_completionHandler___block_invoke;
  v13[3] = &unk_1E5626850;
  id v15 = v10;
  id v16 = a1;
  id v14 = v9;
  id v11 = v10;
  id v12 = v9;
  [v8 enumerateObjectsUsingBlock:v13];
}

void __91__CKComposition_UIPasteboard__compositionFromItemProviders_shareOptions_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __91__CKComposition_UIPasteboard__compositionFromItemProviders_shareOptions_completionHandler___block_invoke_2;
  v5[3] = &unk_1E56261E8;
  id v4 = *(void **)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  [v4 createPluginPayloadCompositionFromItemProvider:a2 builderContext:0 shareOptions:v3 completionHandler:v5];
}

void __91__CKComposition_UIPasteboard__compositionFromItemProviders_shareOptions_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __91__CKComposition_UIPasteboard__compositionFromItemProviders_shareOptions_completionHandler___block_invoke_3;
  v5[3] = &unk_1E5622330;
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __91__CKComposition_UIPasteboard__compositionFromItemProviders_shareOptions_completionHandler___block_invoke_3(uint64_t result)
{
  if (*(void *)(result + 32)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 40) + 16))();
  }
  return result;
}

+ (void)compositionFromNonCollaborationItemProviders:(id)a3 builderContext:(id)a4 completionHandler:(id)a5
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v47 = 0;
  id v48 = &v47;
  uint64_t v49 = 0x2020000000;
  char v50 = 0;
  uint64_t v43 = 0;
  uint64_t v44 = &v43;
  uint64_t v45 = 0x2020000000;
  char v46 = 0;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x2020000000;
  uint64_t v42 = 0;
  uint64_t v42 = [v8 count] - 1;
  if (IMOSLoggingEnabled())
  {
    id v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = [v8 count];
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v12;
      _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Beginning paste resolution for {%ld} given item providers.", (uint8_t *)&buf, 0xCu);
    }
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v54 = 0x3032000000;
  id v55 = __Block_byref_object_copy__31;
  id v56 = __Block_byref_object_dispose__31;
  id v57 = 0;
  id v57 = [MEMORY[0x1E4F1CA48] array];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __109__CKComposition_UIPasteboard__compositionFromNonCollaborationItemProviders_builderContext_completionHandler___block_invoke;
  v40[3] = &unk_1E5626878;
  v40[4] = &buf;
  [v8 enumerateObjectsUsingBlock:v40];
  uint64_t v36 = 0;
  id v37 = &v36;
  uint64_t v38 = 0x2020000000;
  char v39 = 0;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __109__CKComposition_UIPasteboard__compositionFromNonCollaborationItemProviders_builderContext_completionHandler___block_invoke_2;
  void v31[3] = &unk_1E56268A0;
  id v35 = a1;
  id v13 = v9;
  id v32 = v13;
  id v14 = v10;
  id v33 = v14;
  uint64_t v34 = &v36;
  [v8 enumerateObjectsUsingBlock:v31];
  if (IMOSLoggingEnabled())
  {
    id v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      if (*((unsigned char *)v37 + 24)) {
        id v16 = @"YES";
      }
      else {
        id v16 = @"NO";
      }
      *(_DWORD *)id v51 = 138412290;
      id v52 = v16;
      _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "Finished RTF evaluation – isRTF={%@}.", v51, 0xCu);
    }
  }
  if (!*((unsigned char *)v37 + 24))
  {
    id v17 = [MEMORY[0x1E4F1CA80] set];
    char v18 = [v13 wantsInlinedRichLinks];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __109__CKComposition_UIPasteboard__compositionFromNonCollaborationItemProviders_builderContext_completionHandler___block_invoke_301;
    v21[3] = &unk_1E56269B8;
    p_long long buf = &buf;
    id v26 = v41;
    id v29 = a1;
    id v27 = &v43;
    id v24 = v14;
    char v30 = v18;
    id v19 = v17;
    id v22 = v19;
    id v23 = v13;
    uint64_t v28 = &v47;
    [v8 enumerateObjectsUsingBlock:v21];
  }
  if (*((unsigned char *)v48 + 24) && !*((unsigned char *)v44 + 24))
  {
    if (IMOSLoggingEnabled())
    {
      id v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v51 = 0;
        _os_log_impl(&dword_18EF18000, v20, OS_LOG_TYPE_INFO, "Tried all types, unable to resolve entire paste. Calling completion handler with nil.", v51, 2u);
      }
    }
    (*((void (**)(id, void, void))v14 + 2))(v14, 0, 0);
  }

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(v41, 8);
  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v47, 8);
}

void __109__CKComposition_UIPasteboard__compositionFromNonCollaborationItemProviders_builderContext_completionHandler___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v2 = +[CKComposition composition];
  [v1 addObject:v2];
}

void __109__CKComposition_UIPasteboard__compositionFromNonCollaborationItemProviders_builderContext_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if (objc_msgSend(*(id *)(a1 + 56), "isRTFDocumentWithItemProvider:"))
  {
    [*(id *)(a1 + 56) _pasteRTFDocumentWithItemProvider:v6 builderContext:*(void *)(a1 + 32) completionHandler:*(void *)(a1 + 40)];
    *a4 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

void __109__CKComposition_UIPasteboard__compositionFromNonCollaborationItemProviders_builderContext_completionHandler___block_invoke_301(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = [v5 registeredTypeIdentifiers];
      *(_DWORD *)long long buf = 134218242;
      uint64_t v33 = a3;
      __int16 v34 = 2112;
      id v35 = v7;
      _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Resolving itemProvider at idx={%ld} with representations: %@", buf, 0x16u);
    }
  }
  id v8 = *(void **)(a1 + 88);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __109__CKComposition_UIPasteboard__compositionFromNonCollaborationItemProviders_builderContext_completionHandler___block_invoke_302;
  v28[3] = &unk_1E56268C8;
  long long v9 = *(_OWORD *)(a1 + 64);
  uint64_t v31 = a3;
  long long v30 = v9;
  long long v16 = *(_OWORD *)(a1 + 48);
  id v10 = (id)v16;
  long long v29 = v16;
  [v8 pluginDisplayContainerForItemProvider:v5 completion:v28];
  id v11 = *(void **)(a1 + 88);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __109__CKComposition_UIPasteboard__compositionFromNonCollaborationItemProviders_builderContext_completionHandler___block_invoke_304;
  v18[3] = &unk_1E5626990;
  uint64_t v25 = a3;
  long long v23 = *(_OWORD *)(a1 + 64);
  long long v17 = *(_OWORD *)(a1 + 48);
  id v12 = (id)v17;
  long long v22 = v17;
  uint64_t v26 = *(void *)(a1 + 88);
  id v19 = v5;
  char v27 = *(unsigned char *)(a1 + 96);
  id v20 = *(id *)(a1 + 32);
  id v13 = *(id *)(a1 + 40);
  uint64_t v14 = *(void *)(a1 + 80);
  id v21 = v13;
  uint64_t v24 = v14;
  id v15 = v5;
  [v11 mediaObjectForItemProvider:v15 completion:v18];
}

void __109__CKComposition_UIPasteboard__compositionFromNonCollaborationItemProviders_builderContext_completionHandler___block_invoke_302(void *a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  id v8 = v7;
  if (v7)
  {
    long long v9 = [v7 pluginPayload];
    id v10 = [v9 pluginBundleID];
    int v11 = [v10 isEqualToString:*MEMORY[0x1E4F6CC10]];

    if (v11)
    {
      id v12 = [v8 pluginPayload];
      id v13 = [v12 data];
      uint64_t v14 = [v8 pluginPayload];
      id v15 = [v14 attachments];
      long long v16 = IMSharedHelperCombinedPluginPayloadDictionaryDataWithAttachmentURLs();

      if (v16)
      {
        long long v17 = [v8 pluginPayload];
        [v17 setData:v16];
      }
    }
    char v18 = +[CKComposition composition];
    id v19 = [v18 compositionByAppendingPluginDisplayContainer:v8];

    [*(id *)(*(void *)(a1[5] + 8) + 40) insertObject:v19 atIndex:a1[8]];
    uint64_t v20 = *(void *)(a1[6] + 8);
    uint64_t v21 = *(void *)(v20 + 24);
    if (!v21)
    {
      uint64_t v22 = *(void *)(a1[7] + 8);
      if (*(unsigned char *)(v22 + 24))
      {
        uint64_t v21 = 0;
      }
      else
      {
        *(unsigned char *)(v22 + 24) = 1;
        long long v23 = +[CKComposition composition];
        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v24 = *(id *)(*(void *)(a1[5] + 8) + 40);
        uint64_t v25 = [v24 countByEnumeratingWithState:&v31 objects:v37 count:16];
        if (v25)
        {
          uint64_t v26 = *(void *)v32;
          do
          {
            uint64_t v27 = 0;
            uint64_t v28 = v23;
            do
            {
              if (*(void *)v32 != v26) {
                objc_enumerationMutation(v24);
              }
              long long v23 = objc_msgSend(v28, "compositionByAppendingComposition:", *(void *)(*((void *)&v31 + 1) + 8 * v27), (void)v31);

              ++v27;
              uint64_t v28 = v23;
            }
            while (v25 != v27);
            uint64_t v25 = [v24 countByEnumeratingWithState:&v31 objects:v37 count:16];
          }
          while (v25);
        }

        if (IMOSLoggingEnabled())
        {
          long long v29 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            uint64_t v30 = a1[8];
            *(_DWORD *)long long buf = 134217984;
            uint64_t v36 = v30;
            _os_log_impl(&dword_18EF18000, v29, OS_LOG_TYPE_INFO, "> Resolved itemProvider idx={%ld} as Plugin Payload. Calling completion handler.", buf, 0xCu);
          }
        }
        (*(void (**)(void))(a1[4] + 16))();

        uint64_t v20 = *(void *)(a1[6] + 8);
        uint64_t v21 = *(void *)(v20 + 24);
      }
    }
    *(void *)(v20 + 24) = v21 - 1;
  }
}

void __109__CKComposition_UIPasteboard__compositionFromNonCollaborationItemProviders_builderContext_completionHandler___block_invoke_304(uint64_t a1, void *a2, void *a3)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = +[CKComposition compositionWithMediaObject:v5 subject:0];
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) insertObject:v7 atIndex:*(void *)(a1 + 96)];
    uint64_t v8 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v9 = *(void *)(v8 + 24);
    if (!v9)
    {
      uint64_t v10 = *(void *)(*(void *)(a1 + 80) + 8);
      if (*(unsigned char *)(v10 + 24))
      {
        uint64_t v9 = 0;
      }
      else
      {
        *(unsigned char *)(v10 + 24) = 1;
        id v19 = +[CKComposition composition];
        long long v41 = 0u;
        long long v42 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        id v20 = *(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
        uint64_t v21 = [v20 countByEnumeratingWithState:&v39 objects:v48 count:16];
        if (v21)
        {
          uint64_t v22 = *(void *)v40;
          do
          {
            uint64_t v23 = 0;
            id v24 = v19;
            do
            {
              if (*(void *)v40 != v22) {
                objc_enumerationMutation(v20);
              }
              id v19 = [v24 compositionByAppendingComposition:*(void *)(*((void *)&v39 + 1) + 8 * v23)];

              ++v23;
              id v24 = v19;
            }
            while (v21 != v23);
            uint64_t v21 = [v20 countByEnumeratingWithState:&v39 objects:v48 count:16];
          }
          while (v21);
        }

        if (IMOSLoggingEnabled())
        {
          uint64_t v25 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            uint64_t v26 = *(void *)(a1 + 96);
            LODWORD(buf) = 134217984;
            *(void *)((char *)&buf + 4) = v26;
            _os_log_impl(&dword_18EF18000, v25, OS_LOG_TYPE_INFO, "> Resolved itemProvider idx={%ld} as CKMediaObject. Calling completion handler.", (uint8_t *)&buf, 0xCu);
          }
        }
        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

        uint64_t v8 = *(void *)(*(void *)(a1 + 72) + 8);
        uint64_t v9 = *(void *)(v8 + 24);
      }
    }
    *(void *)(v8 + 24) = v9 - 1;
  }
  else
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v44 = 0x3032000000;
    uint64_t v45 = __Block_byref_object_copy__31;
    char v46 = __Block_byref_object_dispose__31;
    id v47 = 0;
    int v11 = *(void **)(a1 + 104);
    uint64_t v12 = objc_opt_class();
    id v13 = *(void **)(a1 + 32);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __109__CKComposition_UIPasteboard__compositionFromNonCollaborationItemProviders_builderContext_completionHandler___block_invoke_305;
    v27[3] = &unk_1E5626968;
    uint64_t v14 = *(void *)(a1 + 104);
    p_long long buf = &buf;
    uint64_t v36 = v14;
    id v28 = v13;
    char v38 = *(unsigned char *)(a1 + 112);
    long long v33 = *(_OWORD *)(a1 + 72);
    uint64_t v37 = *(void *)(a1 + 96);
    id v15 = *(id *)(a1 + 56);
    uint64_t v16 = *(void *)(a1 + 64);
    id v31 = v15;
    uint64_t v34 = v16;
    id v29 = *(id *)(a1 + 40);
    id v17 = *(id *)(a1 + 48);
    uint64_t v18 = *(void *)(a1 + 88);
    id v30 = v17;
    uint64_t v35 = v18;
    objc_msgSend(v11, "__ck_valueForItemClass:forItemProvider:completion:", v12, v28, v27);

    _Block_object_dispose(&buf, 8);
  }
}

void __109__CKComposition_UIPasteboard__compositionFromNonCollaborationItemProviders_builderContext_completionHandler___block_invoke_305(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a2);
  id v4 = a2;
  uint64_t v5 = *MEMORY[0x1E4F309D0];
  uint64_t v6 = *(void *)(a1 + 32);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __109__CKComposition_UIPasteboard__compositionFromNonCollaborationItemProviders_builderContext_completionHandler___block_invoke_2_306;
  v13[3] = &unk_1E5626940;
  char v24 = *(unsigned char *)(a1 + 120);
  long long v18 = *(_OWORD *)(a1 + 72);
  id v7 = *(void **)(a1 + 104);
  uint64_t v22 = *(void *)(a1 + 112);
  id v8 = *(id *)(a1 + 56);
  uint64_t v9 = *(void *)(a1 + 64);
  id v17 = v8;
  uint64_t v10 = *(void *)(a1 + 88);
  uint64_t v23 = *(void *)(a1 + 104);
  uint64_t v19 = v9;
  uint64_t v20 = v10;
  id v14 = *(id *)(a1 + 40);
  id v15 = *(id *)(a1 + 32);
  id v11 = *(id *)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 96);
  id v16 = v11;
  uint64_t v21 = v12;
  [v7 dataForPasteboardType:v5 forItemProvider:v6 completion:v13];
}

void __109__CKComposition_UIPasteboard__compositionFromNonCollaborationItemProviders_builderContext_completionHandler___block_invoke_2_306(uint64_t a1, void *a2, void *a3)
{
  v62[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    if (*(unsigned char *)(a1 + 120))
    {
      id v7 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
      int v8 = [v7 isRichLinkImprovementsEnabled];

      if (v8)
      {
        uint64_t v9 = [MEMORY[0x1E4F30A78] metadataWithDataRepresentation:v5];
        uint64_t v10 = v9;
        if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
          BOOL v11 = 0;
        }
        else {
          BOOL v11 = *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) == 0;
        }
        uint64_t v12 = [v9 originalURL];
        id v13 = v12;
        if (v12)
        {
          id v14 = v12;
        }
        else
        {
          id v14 = [v10 URL];
        }
        id v15 = v14;

        if (v10) {
          BOOL v16 = v15 == 0;
        }
        else {
          BOOL v16 = 1;
        }
        if (!v16 && v11)
        {
          long long v18 = +[CKEmbeddedRichLinkConfiguration richLinkConfigurationWithURL:v15];
          uint64_t v19 = +[CKBrowserItemPayload createBrowserItemPayloadWithRichLinkMetadata:v10];
          [v18 setPluginPayload:v19];

          uint64_t v61 = @"EmbeddedRichLinkConfiguration";
          v62[0] = v18;
          uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v62 forKeys:&v61 count:1];
          id v21 = objc_alloc(MEMORY[0x1E4F28B18]);
          uint64_t v22 = (void *)[v21 initWithString:*MEMORY[0x1E4F6C110] attributes:v20];
          uint64_t v23 = +[CKComposition composition];
          char v24 = [v23 compositionByAppendingText:v22];

          *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
          if (IMOSLoggingEnabled())
          {
            uint64_t v25 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              uint64_t v26 = *(void *)(a1 + 104);
              *(_DWORD *)long long buf = 134217984;
              uint64_t v60 = v26;
              _os_log_impl(&dword_18EF18000, v25, OS_LOG_TYPE_INFO, "> Resolved itemProvider idx={%ld} as LPLinkMetadata. Calling completion handler.", buf, 0xCu);
            }
          }
          (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
          --*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);

          goto LABEL_46;
        }
      }
    }
  }
  uint64_t v27 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
  if (v27)
  {
    id v28 = [v27 scheme];
    if (([v28 isEqualToString:@"tel"] & 1) != 0
      || [v28 isEqualToString:@"mailto"])
    {
      id v29 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) resourceSpecifier];
      uint64_t v10 = [v29 stringByRemovingPercentEncoding];
    }
    else
    {
      uint64_t v10 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) absoluteString];
    }
    if (*(unsigned char *)(a1 + 120))
    {
      uint64_t v37 = [*(id *)(a1 + 112) _attributedStringAfterPostProcessingForRichLinksForText:v10];
      char v38 = +[CKComposition composition];
      long long v39 = [v38 compositionByAppendingText:v37];

      [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) insertObject:v39 atIndex:*(void *)(a1 + 104)];
    }
    else
    {
      long long v40 = +[CKComposition composition];
      if ([v10 length])
      {
        long long v41 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v10];
        uint64_t v37 = [v40 compositionByAppendingText:v41];
      }
      else
      {
        uint64_t v37 = [v40 compositionByAppendingText:0];
      }

      [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) insertObject:v37 atIndex:*(void *)(a1 + 104)];
    }

    if (v10) {
      [*(id *)(a1 + 32) addObject:v10];
    }
    uint64_t v42 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v43 = *(void *)(v42 + 24);
    if (!v43)
    {
      uint64_t v44 = *(void *)(*(void *)(a1 + 72) + 8);
      if (*(unsigned char *)(v44 + 24))
      {
        uint64_t v43 = 0;
      }
      else
      {
        *(unsigned char *)(v44 + 24) = 1;
        uint64_t v45 = [*(id *)(a1 + 112) finalCompositionFromAllCompositions:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)];
        if (IMOSLoggingEnabled())
        {
          char v46 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
          {
            uint64_t v47 = *(void *)(a1 + 104);
            *(_DWORD *)long long buf = 134217984;
            uint64_t v60 = v47;
            _os_log_impl(&dword_18EF18000, v46, OS_LOG_TYPE_INFO, "> Resolved itemProvider idx={%ld} as some form of NSURL. Calling completion handler.", buf, 0xCu);
          }
        }
        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

        uint64_t v42 = *(void *)(*(void *)(a1 + 64) + 8);
        uint64_t v43 = *(void *)(v42 + 24);
      }
    }
    *(void *)(v42 + 24) = v43 - 1;
  }
  else
  {
    uint64_t v30 = *(void *)(a1 + 40);
    uint64_t v31 = *(void *)(a1 + 48);
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __109__CKComposition_UIPasteboard__compositionFromNonCollaborationItemProviders_builderContext_completionHandler___block_invoke_316;
    v48[3] = &unk_1E5626918;
    uint64_t v52 = *(void *)(a1 + 88);
    uint64_t v32 = *(void *)(a1 + 104);
    long long v33 = *(void **)(a1 + 112);
    long long v53 = *(_OWORD *)(a1 + 64);
    uint64_t v56 = v32;
    id v57 = v33;
    id v51 = *(id *)(a1 + 56);
    id v49 = *(id *)(a1 + 40);
    id v34 = *(id *)(a1 + 32);
    uint64_t v35 = *(void *)(a1 + 80);
    id v50 = v34;
    char v58 = *(unsigned char *)(a1 + 120);
    uint64_t v36 = *(void *)(a1 + 96);
    uint64_t v54 = v35;
    uint64_t v55 = v36;
    [v33 _pasteAttributedStringWithItemProvider:v30 builderContext:v31 completionHandler:v48];

    uint64_t v10 = v51;
  }
LABEL_46:
}

void __109__CKComposition_UIPasteboard__compositionFromNonCollaborationItemProviders_builderContext_completionHandler___block_invoke_316(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 text];

  if (v7)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) insertObject:v5 atIndex:*(void *)(a1 + 96)];
    uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v9 = *(void *)(v8 + 24);
    if (!v9)
    {
      uint64_t v10 = *(void *)(*(void *)(a1 + 72) + 8);
      if (*(unsigned char *)(v10 + 24))
      {
        uint64_t v9 = 0;
      }
      else
      {
        *(unsigned char *)(v10 + 24) = 1;
        uint64_t v20 = [*(id *)(a1 + 104) finalCompositionFromAllCompositions:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
        if (IMOSLoggingEnabled())
        {
          id v21 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            uint64_t v22 = *(void *)(a1 + 96);
            *(_DWORD *)long long buf = 134217984;
            uint64_t v34 = v22;
            _os_log_impl(&dword_18EF18000, v21, OS_LOG_TYPE_INFO, "> Resolved itemProvider idx={%ld} as NSAttributedString via _pasteAttributedStringWithItemProvider. Calling completion handler.", buf, 0xCu);
          }
        }
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

        uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
        uint64_t v9 = *(void *)(v8 + 24);
      }
    }
    *(void *)(v8 + 24) = v9 - 1;
  }
  else
  {
    BOOL v11 = *(void **)(a1 + 104);
    uint64_t v12 = objc_opt_class();
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __109__CKComposition_UIPasteboard__compositionFromNonCollaborationItemProviders_builderContext_completionHandler___block_invoke_317;
    v23[3] = &unk_1E56268F0;
    uint64_t v13 = *(void *)(a1 + 32);
    id v14 = *(id *)(a1 + 40);
    uint64_t v16 = *(void *)(a1 + 72);
    uint64_t v15 = *(void *)(a1 + 80);
    id v24 = v14;
    uint64_t v26 = v15;
    char v32 = *(unsigned char *)(a1 + 112);
    uint64_t v17 = *(void *)(a1 + 96);
    uint64_t v30 = *(void *)(a1 + 104);
    uint64_t v31 = v17;
    long long v27 = *(_OWORD *)(a1 + 56);
    uint64_t v28 = v16;
    id v18 = *(id *)(a1 + 48);
    uint64_t v19 = *(void *)(a1 + 88);
    id v25 = v18;
    uint64_t v29 = v19;
    objc_msgSend(v11, "__ck_valueForItemClass:forItemProvider:completion:", v12, v13, v23);
  }
}

void __109__CKComposition_UIPasteboard__compositionFromNonCollaborationItemProviders_builderContext_completionHandler___block_invoke_317(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  if (v7) {
    char v8 = [*(id *)(a1 + 32) containsObject:v7];
  }
  else {
    char v8 = 0;
  }
  uint64_t v9 = [MEMORY[0x1E4F1CB10] URLWithString:v7];
  char v10 = [v9 isFileURL];
  if (v7
    && (char v11 = v10, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) absoluteString],
        uint64_t v12 = objc_claimAutoreleasedReturnValue(),
        char v13 = [v7 isEqualToString:v12] | v8 | v11,
        v12,
        (v13 & 1) == 0))
  {
    [*(id *)(a1 + 32) addObject:v7];
    if (*(unsigned char *)(a1 + 104))
    {
      uint64_t v22 = [*(id *)(a1 + 88) _attributedStringAfterPostProcessingForRichLinksForText:v7];
      uint64_t v23 = +[CKComposition composition];
      id v24 = [v23 compositionByAppendingText:v22];

      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) insertObject:v24 atIndex:*(void *)(a1 + 96)];
    }
    else
    {
      id v25 = +[CKComposition composition];
      if ([v7 length])
      {
        uint64_t v26 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v7];
        uint64_t v22 = [v25 compositionByAppendingText:v26];
      }
      else
      {
        uint64_t v22 = [v25 compositionByAppendingText:0];
      }

      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) insertObject:v22 atIndex:*(void *)(a1 + 96)];
    }

    uint64_t v27 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v19 = *(void *)(v27 + 24);
    if (!v19)
    {
      uint64_t v28 = *(void *)(*(void *)(a1 + 72) + 8);
      if (*(unsigned char *)(v28 + 24))
      {
        uint64_t v19 = 0;
      }
      else
      {
        *(unsigned char *)(v28 + 24) = 1;
        uint64_t v29 = [*(id *)(a1 + 88) finalCompositionFromAllCompositions:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
        if (IMOSLoggingEnabled())
        {
          uint64_t v30 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            uint64_t v31 = *(void *)(a1 + 96);
            int v32 = 134217984;
            uint64_t v33 = v31;
            _os_log_impl(&dword_18EF18000, v30, OS_LOG_TYPE_INFO, "> Resolved itemProvider idx={%ld} as some form of NSString. Calling completion handler.", (uint8_t *)&v32, 0xCu);
          }
        }
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

        uint64_t v27 = *(void *)(*(void *)(a1 + 64) + 8);
        uint64_t v19 = *(void *)(v27 + 24);
      }
    }
    uint64_t v20 = (void *)(v27 + 24);
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
    {
      if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
      {
        uint64_t v14 = *(void *)(*(void *)(a1 + 72) + 8);
        if (!*(unsigned char *)(v14 + 24))
        {
          *(unsigned char *)(v14 + 24) = 1;
          uint64_t v15 = [*(id *)(a1 + 88) finalCompositionFromAllCompositions:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
          if (IMOSLoggingEnabled())
          {
            uint64_t v16 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              uint64_t v17 = *(void *)(a1 + 96);
              int v32 = 134217984;
              uint64_t v33 = v17;
              _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_INFO, "> Tried all types. Returning what we have for itemProvider idx={%ld}. Calling completion handler.", (uint8_t *)&v32, 0xCu);
            }
          }
          (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        }
      }
    }
    uint64_t v18 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v21 = *(void *)(v18 + 24);
    uint64_t v20 = (void *)(v18 + 24);
    uint64_t v19 = v21;
  }
  void *v20 = v19 - 1;
}

+ (id)_attributedStringAfterPostProcessingForRichLinksForText:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F28B18];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithString:v4];

  id v6 = objc_msgSend(v5, "ck_attributedStringByPostProcessingURLTextForRichLinks");

  return v6;
}

+ (id)finalCompositionFromAllCompositions:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[CKComposition composition];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      char v10 = v4;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v4 = objc_msgSend(v10, "compositionByAppendingComposition:", *(void *)(*((void *)&v12 + 1) + 8 * v9), (void)v12);

        ++v9;
        char v10 = v4;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (void)requestPluginDisplayContainerForItemProvider:(id)a3 completion:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __87__CKComposition_UIPasteboard__requestPluginDisplayContainerForItemProvider_completion___block_invoke;
  v9[3] = &unk_1E5624F78;
  id v7 = v6;
  id v10 = v7;
  id v8 = (id)[v5 loadDataRepresentationForTypeIdentifier:@"com.apple.MobileSMS.PluginPayload" completionHandler:v9];
}

void __87__CKComposition_UIPasteboard__requestPluginDisplayContainerForItemProvider_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (v6)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = +[CKPluginDisplayContainer unarchiveFromData:a2 error:0];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)requestFilenameForType:(id)a3 forItemProvider:(id)a4 completion:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = +[CKMediaObjectManager sharedInstance];
  uint64_t v11 = [v8 registeredTypeIdentifiers];
  if ([v8 canLoadObjectOfClass:objc_opt_class()])
  {
    uint64_t v12 = objc_opt_class();
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __81__CKComposition_UIPasteboard__requestFilenameForType_forItemProvider_completion___block_invoke;
    v23[3] = &unk_1E56269E0;
    id v24 = v10;
    id v25 = v7;
    id v26 = v9;
    id v13 = (id)[v8 loadObjectOfClass:v12 completionHandler:v23];
  }
  else
  {
    int v14 = [v11 containsObject:@"public.url-name"];
    int v15 = IMOSLoggingEnabled();
    if (v14)
    {
      if (v15)
      {
        uint64_t v16 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412546;
          id v28 = v8;
          __int16 v29 = 2112;
          uint64_t v30 = @"public.url-name";
          _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_INFO, "Couldn't instantiate NSString from itemProvider: %@ querying data for %@", buf, 0x16u);
        }
      }
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __81__CKComposition_UIPasteboard__requestFilenameForType_forItemProvider_completion___block_invoke_319;
      v19[3] = &unk_1E5626A08;
      id v20 = v10;
      id v21 = v7;
      id v22 = v9;
      id v17 = (id)[v8 loadDataRepresentationForTypeIdentifier:@"public.url-name" completionHandler:v19];
    }
    else
    {
      if (v15)
      {
        uint64_t v18 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412290;
          id v28 = v8;
          _os_log_impl(&dword_18EF18000, v18, OS_LOG_TYPE_INFO, "No associated string data to create filename for itemProvider: %@", buf, 0xCu);
        }
      }
      (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
    }
  }
}

void __81__CKComposition_UIPasteboard__requestFilenameForType_forItemProvider_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v7 = 0;
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) UTITypeForFilename:v8];
    if (UTTypeEqual(v6, *(CFStringRef *)(a1 + 40))) {
      id v7 = v8;
    }
    else {
      id v7 = 0;
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __81__CKComposition_UIPasteboard__requestFilenameForType_forItemProvider_completion___block_invoke_319(uint64_t a1, void *a2, void *a3)
{
  id v10 = a3;
  if (v10)
  {
    id v5 = 0;
  }
  else
  {
    id v6 = (objc_class *)NSString;
    id v7 = a2;
    id v8 = (void *)[[v6 alloc] initWithData:v7 usedEncoding:0];

    if (v8)
    {
      id v9 = [*(id *)(a1 + 32) UTITypeForFilename:v8];
      if (UTTypeEqual(v9, *(CFStringRef *)(a1 + 40))) {
        id v5 = v8;
      }
      else {
        id v5 = 0;
      }
    }
    else
    {
      id v5 = 0;
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

+ (void)requestCompositionFromItemProvider:(id)a3 completion:(id)a4
{
}

+ (void)requestCompositionFromItemProvider:(id)a3 builderContext:(id)a4 completion:(id)a5
{
}

+ (void)_requestCompositionFromItemProviderForNonCollaboration:(id)a3 builderContext:(id)a4 completion:(id)a5
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 registeredTypeIdentifiers];
  if (![v11 containsObject:@"com.apple.MobileSMS.PluginPayload"])
  {
    uint64_t v12 = [a1 richestMediaTypeForItemProvider:v8];
    if (v12)
    {
      v68[0] = MEMORY[0x1E4F143A8];
      v68[1] = 3221225472;
      v68[2] = __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_2;
      v68[3] = &unk_1E5626A58;
      id v69 = v8;
      id v70 = v10;
      [a1 requestMediaObjectForItemProvider:v69 type:v12 builderContext:v9 completion:v68];

      id v13 = &v69;
    }
    else
    {
      int v15 = [v9 wantsInlinedRichLinks];
      uint64_t v16 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
      int v17 = [v16 isRichLinkImprovementsEnabled];

      if (v17
        && ([v8 registeredTypeIdentifiers],
            uint64_t v18 = objc_claimAutoreleasedReturnValue(),
            uint64_t v19 = *MEMORY[0x1E4F309D0],
            int v20 = [v18 containsObject:*MEMORY[0x1E4F309D0]],
            v18,
            (v20 & v15) == 1))
      {
        v65[0] = MEMORY[0x1E4F143A8];
        v65[1] = 3221225472;
        v65[2] = __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_5;
        v65[3] = &unk_1E56264B8;
        id v66 = v8;
        id v67 = v10;
        id v21 = (id)[v66 loadDataRepresentationForTypeIdentifier:v19 completionHandler:v65];

        id v13 = &v66;
      }
      else
      {
        id v22 = [v8 registeredTypeIdentifiers];
        char v23 = [v22 containsObject:@"com.apple.iCal.pasteboard.event"];

        if ((v23 & 1) != 0 || ![v8 canLoadObjectOfClass:objc_opt_class()])
        {
          id v26 = [v8 suggestedName];
          if (!v26) {
            goto LABEL_32;
          }
          uint64_t v27 = [v8 suggestedName];
          uint64_t v28 = [v27 length];

          if (!v28) {
            goto LABEL_32;
          }
          __int16 v29 = [v8 suggestedName];
          uint64_t v30 = [v29 pathExtension];

          if (!v30) {
            goto LABEL_32;
          }
          uint64_t v31 = [v30 length];

          if (!v31) {
            goto LABEL_32;
          }
          if (_requestCompositionFromItemProviderForNonCollaboration_builderContext_completion__onceToken != -1) {
            dispatch_once(&_requestCompositionFromItemProviderForNonCollaboration_builderContext_completion__onceToken, &__block_literal_global_334);
          }
          long long v58 = 0u;
          long long v59 = 0u;
          long long v56 = 0u;
          long long v57 = 0u;
          obuint64_t j = (id)_requestCompositionFromItemProviderForNonCollaboration_builderContext_completion__sFileTypes;
          uint64_t v32 = [obj countByEnumeratingWithState:&v56 objects:v74 count:16];
          if (v32)
          {
            uint64_t v33 = *(void *)v57;
LABEL_22:
            uint64_t v34 = 0;
            while (1)
            {
              if (*(void *)v57 != v33) {
                objc_enumerationMutation(obj);
              }
              uint64_t v35 = *(void **)(*((void *)&v56 + 1) + 8 * v34);
              if ([v8 hasItemConformingToTypeIdentifier:v35]) {
                break;
              }
              if (v32 == ++v34)
              {
                uint64_t v32 = [obj countByEnumeratingWithState:&v56 objects:v74 count:16];
                if (v32) {
                  goto LABEL_22;
                }
                goto LABEL_28;
              }
            }
            id v36 = v35;

            if (v36) {
              goto LABEL_31;
            }
          }
          else
          {
LABEL_28:
          }
          uint64_t v37 = [v8 suggestedName];
          IMUTITypeForFilename();
          id v36 = (id)objc_claimAutoreleasedReturnValue();

          if (v36)
          {
LABEL_31:
            v52[0] = MEMORY[0x1E4F143A8];
            v52[1] = 3221225472;
            v52[2] = __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_3_335;
            v52[3] = &unk_1E5626A08;
            id v53 = v36;
            id v54 = v8;
            id v55 = v10;
            id v14 = v36;
            id v38 = (id)[v54 loadDataRepresentationForTypeIdentifier:v14 completionHandler:v52];
          }
          else
          {
LABEL_32:
            aBlock[0] = MEMORY[0x1E4F143A8];
            aBlock[1] = 3221225472;
            aBlock[2] = __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_337;
            aBlock[3] = &unk_1E5623828;
            id v39 = v10;
            id v51 = v39;
            id v40 = v8;
            id v50 = v40;
            long long v41 = (void (**)(void))_Block_copy(aBlock);
            v47[0] = 0;
            v47[1] = v47;
            v47[2] = 0x3032000000;
            v47[3] = __Block_byref_object_copy__31;
            void v47[4] = __Block_byref_object_dispose__31;
            id v48 = 0;
            if ([a1 isRTFDocumentWithItemProvider:v40])
            {
              v43[0] = MEMORY[0x1E4F143A8];
              v43[1] = 3221225472;
              v43[2] = __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_348;
              v43[3] = &unk_1E5626B20;
              char v46 = v47;
              id v44 = v39;
              uint64_t v45 = v41;
              [a1 _pasteRTFDocumentWithItemProvider:v40 builderContext:v9 completionHandler:v43];
            }
            else
            {
              v41[2](v41);
            }
            _Block_object_dispose(v47, 8);

            id v14 = v51;
          }
          goto LABEL_6;
        }
        uint64_t v24 = objc_opt_class();
        v60[0] = MEMORY[0x1E4F143A8];
        v60[1] = 3221225472;
        void v60[2] = __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_2_330;
        v60[3] = &unk_1E5626A80;
        char v64 = v15;
        id v61 = v8;
        id v63 = a1;
        id v62 = v10;
        id v25 = (id)[v61 loadObjectOfClass:v24 completionHandler:v60];

        id v13 = &v61;
      }
    }
    id v14 = *v13;
LABEL_6:

    goto LABEL_7;
  }
  v71[0] = MEMORY[0x1E4F143A8];
  v71[1] = 3221225472;
  v71[2] = __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke;
  v71[3] = &unk_1E5626A30;
  id v72 = v8;
  id v73 = v10;
  [a1 requestPluginDisplayContainerForItemProvider:v72 completion:v71];

  uint64_t v12 = v72;
LABEL_7:
}

void __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        uint64_t v8 = *(void *)(a1 + 32);
        id v9 = [v6 localizedDescription];
        *(_DWORD *)long long buf = 138412546;
        uint64_t v26 = v8;
        __int16 v27 = 2112;
        uint64_t v28 = v9;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Failed to get pluginDisplayContainer for itemProvider: %@, error: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    id v10 = [v5 pluginPayload];
    uint64_t v11 = [v10 pluginBundleID];
    int v12 = [v11 isEqualToString:*MEMORY[0x1E4F6CC10]];

    if (v12)
    {
      id v13 = [v5 pluginPayload];
      id v14 = [v13 data];
      int v15 = [v5 pluginPayload];
      uint64_t v16 = [v15 attachments];
      int v17 = IMSharedHelperCombinedPluginPayloadDictionaryDataWithAttachmentURLs();

      if (v17)
      {
        uint64_t v18 = [v5 pluginPayload];
        [v18 setData:v17];
      }
    }
    if (v5)
    {
      uint64_t v19 = +[CKComposition compositionWithPluginDisplayContainer:v5 subject:0];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_320;
      v22[3] = &unk_1E5623828;
      id v20 = *(id *)(a1 + 40);
      id v23 = v19;
      id v24 = v20;
      id v21 = v19;
      dispatch_async(MEMORY[0x1E4F14428], v22);
    }
  }
}

uint64_t __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_320(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    if (IMOSLoggingEnabled())
    {
      id v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v11 = *(void *)(a1 + 32);
        int v12 = [v9 localizedDescription];
        *(_DWORD *)long long buf = 138412546;
        uint64_t v43 = v11;
        __int16 v44 = 2112;
        uint64_t v45 = v12;
        _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Failed to get mediaObject for itemProvider: %@, error: %@", buf, 0x16u);
      }
    }
  }
  else if ([v8 length])
  {
    id v13 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v8];
    id v14 = [[CKComposition alloc] initWithText:v13 subject:0];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_321;
    block[3] = &unk_1E5623828;
    id v15 = *(id *)(a1 + 40);
    id v40 = v14;
    id v41 = v15;
    uint64_t v16 = v14;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else if (v7)
  {
    if (![*(id *)(a1 + 32) hasItemConformingToTypeIdentifier:@"com.apple.messages.audioMessage"])
    {
      id v20 = [v7 transfer];
      if ([v20 isSticker])
      {
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          id v22 = [v7 sticker];
          id v23 = +[CKBrowserItemPayload browserItemFromSticker:v22];
          id v24 = +[CKComposition compositionWithShelfPluginPayload:v23];
          v33[0] = MEMORY[0x1E4F143A8];
          v33[1] = 3221225472;
          v33[2] = __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_3;
          v33[3] = &unk_1E5623828;
          id v25 = *(id *)(a1 + 40);
          id v34 = v24;
          id v35 = v25;
          id v26 = v24;
          dispatch_async(MEMORY[0x1E4F14428], v33);

          goto LABEL_8;
        }
      }
      else
      {
      }
      __int16 v27 = +[CKComposition compositionWithMediaObject:v7 subject:0];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_4;
      v30[3] = &unk_1E5623828;
      id v28 = *(id *)(a1 + 40);
      id v31 = v27;
      id v32 = v28;
      id v29 = v27;
      dispatch_async(MEMORY[0x1E4F14428], v30);

      goto LABEL_8;
    }
    int v17 = +[CKComposition audioCompositionWithMediaObject:v7];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_2_325;
    v36[3] = &unk_1E5623828;
    id v18 = *(id *)(a1 + 40);
    id v37 = v17;
    id v38 = v18;
    id v19 = v17;
    dispatch_async(MEMORY[0x1E4F14428], v36);
  }
LABEL_8:
}

uint64_t __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_321(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_2_325(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        uint64_t v8 = *(void *)(a1 + 32);
        id v9 = [v6 localizedDescription];
        *(_DWORD *)long long buf = 138412546;
        uint64_t v29 = v8;
        __int16 v30 = 2112;
        id v31 = v9;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Failed to get LPLinkMetadata representation (as NSData) for itemProvider: %@, error: %@", buf, 0x16u);
      }
    }
  }
  else if (v5)
  {
    id v10 = [MEMORY[0x1E4F30A78] metadataWithDataRepresentation:v5];
    uint64_t v11 = [v10 originalURL];
    int v12 = v11;
    if (v11)
    {
      id v13 = v11;
    }
    else
    {
      id v13 = [v10 URL];
    }
    id v14 = v13;

    id v15 = +[CKEmbeddedRichLinkConfiguration richLinkConfigurationWithURL:v14];
    uint64_t v16 = +[CKBrowserItemPayload createBrowserItemPayloadWithRichLinkMetadata:v10];
    [v15 setPluginPayload:v16];

    id v26 = @"EmbeddedRichLinkConfiguration";
    __int16 v27 = v15;
    int v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    id v18 = objc_alloc(MEMORY[0x1E4F28B18]);
    id v19 = (void *)[v18 initWithString:*MEMORY[0x1E4F6C110] attributes:v17];
    id v20 = [[CKComposition alloc] initWithText:v19 subject:0];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_326;
    v23[3] = &unk_1E5623828;
    id v21 = *(id *)(a1 + 40);
    id v24 = v20;
    id v25 = v21;
    id v22 = v20;
    dispatch_async(MEMORY[0x1E4F14428], v23);
  }
}

uint64_t __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_326(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_2_330(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_17;
    }
    id v10 = v5;
    uint64_t v11 = [v10 scheme];
    if (([v11 isEqualToString:@"tel"] & 1) != 0
      || [v11 isEqualToString:@"mailto"])
    {
      int v12 = [v10 resourceSpecifier];
      id v13 = [v12 stringByRemovingPercentEncoding];
    }
    else
    {
      id v13 = [v10 absoluteString];
    }
    if (*(unsigned char *)(a1 + 56))
    {
      id v14 = [*(id *)(a1 + 48) _attributedStringAfterPostProcessingForRichLinksForText:v13];
      id v15 = [CKComposition alloc];
    }
    else
    {
      uint64_t v16 = [CKComposition alloc];
      if (![v13 length])
      {
        int v17 = [(CKComposition *)v16 initWithText:0 subject:0];
        goto LABEL_16;
      }
      id v14 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v13];
      id v15 = v16;
    }
    int v17 = [(CKComposition *)v15 initWithText:v14 subject:0];

LABEL_16:
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_331;
    v20[3] = &unk_1E5623828;
    id v18 = *(id *)(a1 + 40);
    id v21 = v17;
    id v22 = v18;
    id v19 = v17;
    dispatch_async(MEMORY[0x1E4F14428], v20);

    goto LABEL_17;
  }
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      id v9 = [v6 localizedDescription];
      *(_DWORD *)long long buf = 138412546;
      uint64_t v24 = v8;
      __int16 v25 = 2112;
      id v26 = v9;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Failed to get url for itemProvider: %@, error: %@", buf, 0x16u);
    }
  }
LABEL_17:
}

uint64_t __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_331(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_2_332()
{
  v9[7] = *MEMORY[0x1E4F143B8];
  v0 = [(id)*MEMORY[0x1E4F444A0] identifier];
  v1 = objc_msgSend((id)*MEMORY[0x1E4F444A8], "identifier", v0);
  v9[1] = v1;
  id v2 = [(id)*MEMORY[0x1E4F443C0] identifier];
  v9[2] = v2;
  id v3 = [(id)*MEMORY[0x1E4F44508] identifier];
  v9[3] = v3;
  id v4 = [(id)*MEMORY[0x1E4F44510] identifier];
  void v9[4] = v4;
  id v5 = [(id)*MEMORY[0x1E4F44470] identifier];
  v9[5] = v5;
  id v6 = [(id)*MEMORY[0x1E4F444F0] identifier];
  v9[6] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:7];
  uint64_t v8 = (void *)_requestCompositionFromItemProviderForNonCollaboration_builderContext_completion__sFileTypes;
  _requestCompositionFromItemProviderForNonCollaboration_builderContext_completion__sFileTypes = v7;
}

void __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_3_335(id *a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v5 || v6)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        id v9 = a1[5];
        id v10 = [v7 localizedDescription];
        *(_DWORD *)long long buf = 138412546;
        id v17 = v9;
        __int16 v18 = 2112;
        id v19 = v10;
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Failed to get file data for provider: %@, error: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_4_336;
    v11[3] = &unk_1E5622F40;
    id v12 = v5;
    id v13 = a1[4];
    id v14 = a1[5];
    id v15 = a1[6];
    dispatch_async(MEMORY[0x1E4F14428], v11);
  }
}

void __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_4_336(uint64_t a1)
{
  id v2 = +[CKMediaObjectManager sharedInstance];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = [*(id *)(a1 + 48) suggestedName];
  id v7 = [v2 mediaObjectWithData:v3 UTIType:v4 filename:v5 transcoderUserInfo:0];

  id v6 = +[CKComposition compositionWithMediaObject:v7 subject:0];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_337(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_2_338;
  aBlock[3] = &unk_1E5626AF8;
  id v29 = *(id *)(a1 + 40);
  id v2 = _Block_copy(aBlock);
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = (void *)*MEMORY[0x1E4F443C0];
  id v5 = [(id)*MEMORY[0x1E4F443C0] identifier];
  LODWORD(v3) = [v3 hasItemConformingToTypeIdentifier:v5];

  id v6 = *(void **)(a1 + 32);
  if (v3)
  {
    id v7 = [v4 identifier];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_6;
    void v25[3] = &unk_1E56264B8;
    id v26 = *(id *)(a1 + 32);
    id v27 = v2;
    id v8 = (id)[v6 loadDataRepresentationForTypeIdentifier:v7 completionHandler:v25];
  }
  else
  {
    int v9 = [v6 canLoadObjectOfClass:objc_opt_class()];
    id v10 = *(void **)(a1 + 32);
    if (v9)
    {
      uint64_t v11 = objc_opt_class();
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_345;
      v22[3] = &unk_1E5626490;
      id v23 = *(id *)(a1 + 32);
      id v24 = v2;
      id v12 = (id)[v10 loadObjectOfClass:v11 completionHandler:v22];
    }
    else if ([v10 canLoadObjectOfClass:objc_opt_class()])
    {
      id v13 = *(void **)(a1 + 32);
      uint64_t v14 = objc_opt_class();
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_346;
      v19[3] = &unk_1E5626490;
      id v20 = *(id *)(a1 + 32);
      id v21 = *(id *)(a1 + 40);
      id v15 = (id)[v13 loadObjectOfClass:v14 completionHandler:v19];
    }
    else if (IMOSLoggingEnabled())
    {
      uint64_t v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        id v17 = *(void **)(a1 + 32);
        __int16 v18 = [v17 registeredTypeIdentifiers];
        *(_DWORD *)long long buf = 138412546;
        id v31 = v17;
        __int16 v32 = 2112;
        uint64_t v33 = v18;
        _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_INFO, "MobileSMS could not accept itemProvider: %@  registeredTypes: %@", buf, 0x16u);
      }
    }
  }
}

void __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_2_338(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_3_339;
  v5[3] = &unk_1E5623B20;
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  +[CKComposition requestMediaObjectsForAttributedString:v4 completion:v5];
}

void __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_3_339(uint64_t a1, void *a2)
{
  id v3 = a2;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v19[3] = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__31;
  void v17[4] = __Block_byref_object_dispose__31;
  id v18 = 0;
  id v18 = +[CKComposition composition];
  uint64_t v4 = [v3 count];
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = [v5 length];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_4_340;
  v11[3] = &unk_1E5626AA8;
  uint64_t v14 = v19;
  uint64_t v16 = v4;
  id v7 = v3;
  id v12 = v7;
  id v15 = v17;
  id v13 = *(id *)(a1 + 32);
  objc_msgSend(v5, "enumerateAttributesInRange:options:usingBlock:", 0, v6, 0, v11);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_5_342;
  block[3] = &unk_1E5626AD0;
  id v9 = *(id *)(a1 + 40);
  id v10 = v17;
  dispatch_async(MEMORY[0x1E4F14428], block);

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v19, 8);
}

void __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_4_340(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4FB06B8]];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) >= *(void *)(a1 + 64)) {
      return;
    }
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:");
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "compositionByAppendingMediaObject:");
    uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
  else
  {
    id v12 = objc_msgSend(*(id *)(a1 + 40), "attributedSubstringFromRange:", a3, a4);
    id v19 = [v12 string];

    id v13 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    uint64_t v14 = [v19 length];
    if (v14) {
      id v15 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v19];
    }
    else {
      id v15 = 0;
    }
    uint64_t v16 = [v13 compositionByAppendingText:v15];
    uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
    id v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;

    if (v14) {
  }
    }
}

uint64_t __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_5_342(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        uint64_t v8 = *(void *)(a1 + 32);
        uint64_t v9 = [v6 localizedDescription];
        *(_DWORD *)long long buf = 138412546;
        uint64_t v16 = v8;
        __int16 v17 = 2112;
        id v18 = v9;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Failed to get attributed string for itemProvider: %@, error: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    id v10 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v13 = *MEMORY[0x1E4FB06D8];
    uint64_t v14 = *MEMORY[0x1E4FB0748];
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    id v12 = (void *)[v10 initWithData:v5 options:v11 documentAttributes:0 error:0];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_345(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        uint64_t v8 = *(void *)(a1 + 32);
        uint64_t v9 = [v6 localizedDescription];
        int v10 = 138412546;
        uint64_t v11 = v8;
        __int16 v12 = 2112;
        uint64_t v13 = v9;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Failed to get attributed string for itemProvider: %@, error: %@", (uint8_t *)&v10, 0x16u);
      }
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_346(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        uint64_t v8 = *(void *)(a1 + 32);
        uint64_t v9 = [v6 localizedDescription];
        *(_DWORD *)long long buf = 138412546;
        uint64_t v20 = v8;
        __int16 v21 = 2112;
        id v22 = v9;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Failed to get string for itemProvider: %@, error: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = v5;
      uint64_t v11 = [CKComposition alloc];
      if ([v10 length])
      {
        __int16 v12 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v10];
        uint64_t v13 = [(CKComposition *)v11 initWithText:v12 subject:0];
      }
      else
      {
        uint64_t v13 = [(CKComposition *)v11 initWithText:0 subject:0];
      }
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_347;
      v16[3] = &unk_1E5623828;
      id v14 = *(id *)(a1 + 40);
      __int16 v17 = v13;
      id v18 = v14;
      id v15 = v13;
      dispatch_async(MEMORY[0x1E4F14428], v16);
    }
  }
}

uint64_t __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_347(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_348(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) hasContent])
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_2_349;
    v7[3] = &unk_1E5626AD0;
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 48);
    id v8 = v5;
    uint64_t v9 = v6;
    dispatch_async(MEMORY[0x1E4F14428], v7);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __112__CKComposition_UIPasteboard___requestCompositionFromItemProviderForNonCollaboration_builderContext_completion___block_invoke_2_349(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

+ (void)requestCompositionFromItemProvider:(id)a3 shelfMediaObject:(id)a4 builderContext:(id)a5 completion:(id)a6
{
  id v9 = a6;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __109__CKComposition_UIPasteboard__requestCompositionFromItemProvider_shelfMediaObject_builderContext_completion___block_invoke;
  v11[3] = &unk_1E56261E8;
  id v12 = v9;
  id v10 = v9;
  [a1 createPluginPayloadCompositionFromItemProvider:a3 builderContext:a5 shareOptions:0 completionHandler:v11];
}

void __109__CKComposition_UIPasteboard__requestCompositionFromItemProvider_shelfMediaObject_builderContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __109__CKComposition_UIPasteboard__requestCompositionFromItemProvider_shelfMediaObject_builderContext_completion___block_invoke_2;
  v6[3] = &unk_1E5623828;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __109__CKComposition_UIPasteboard__requestCompositionFromItemProvider_shelfMediaObject_builderContext_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (void)requestCompositionFromItemProviders:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__31;
  void v21[4] = __Block_byref_object_dispose__31;
  id v22 = 0;
  id v22 = +[CKComposition composition];
  id v8 = dispatch_group_create();
  dispatch_group_enter(v8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__CKComposition_UIPasteboard__requestCompositionFromItemProviders_completion___block_invoke;
  block[3] = &unk_1E5626AD0;
  id v9 = v7;
  id v19 = v9;
  uint64_t v20 = v21;
  dispatch_group_notify(v8, MEMORY[0x1E4F14428], block);
  if ((unint64_t)[v6 count] < 2)
  {
    dispatch_group_enter(v8);
    uint64_t v11 = [v6 firstObject];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __78__CKComposition_UIPasteboard__requestCompositionFromItemProviders_completion___block_invoke_4;
    v12[3] = &unk_1E5626B98;
    id v13 = v6;
    id v15 = v21;
    id v14 = v8;
    [a1 requestCompositionFromItemProvider:v11 completion:v12];
    id v10 = &v13;
  }
  else
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __78__CKComposition_UIPasteboard__requestCompositionFromItemProviders_completion___block_invoke_2;
    v16[3] = &unk_1E5626B70;
    v17[0] = v8;
    v17[1] = v21;
    v17[2] = a1;
    [v6 enumerateObjectsUsingBlock:v16];
    id v10 = (id *)v17;
  }

  dispatch_group_leave(v8);
  _Block_object_dispose(v21, 8);
}

uint64_t __78__CKComposition_UIPasteboard__requestCompositionFromItemProviders_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void __78__CKComposition_UIPasteboard__requestCompositionFromItemProviders_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(NSObject **)(a1 + 32);
  id v4 = a2;
  dispatch_group_enter(v3);
  id v5 = *(void **)(a1 + 48);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __78__CKComposition_UIPasteboard__requestCompositionFromItemProviders_completion___block_invoke_3;
  v8[3] = &unk_1E5626B48;
  long long v7 = *(_OWORD *)(a1 + 32);
  id v6 = (id)v7;
  long long v9 = v7;
  [v5 _requestCompositionFromItemProviderForNonCollaboration:v4 builderContext:0 completion:v8];
}

void __78__CKComposition_UIPasteboard__requestCompositionFromItemProviders_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v4 = a2;
  uint64_t v5 = [v3 compositionByAppendingComposition:v4];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  long long v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  id v8 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  long long v9 = [v4 collaborationShareOptions];

  uint64_t v10 = [v8 compositionWithCollaborationShareOptions:v9];
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  id v13 = *(NSObject **)(a1 + 32);

  dispatch_group_leave(v13);
}

void __78__CKComposition_UIPasteboard__requestCompositionFromItemProviders_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v15 = a2;
  id v3 = [*(id *)(a1 + 32) firstObject];
  int v4 = [v3 hasItemConformingToTypeIdentifier:@"com.apple.messages.audioMessage"];

  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  if (v4)
  {
    id v6 = v15;
    long long v7 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v6;
  }
  else
  {
    uint64_t v8 = [*(id *)(v5 + 40) compositionByAppendingComposition:v15];
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    uint64_t v11 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    long long v7 = [v15 collaborationShareOptions];
    uint64_t v12 = [v11 compositionWithCollaborationShareOptions:v7];
    uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

+ (id)richestMediaTypeForItemProvider:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(CKMultiDict);
  id v6 = [v4 registeredTypeIdentifiers];
  long long v7 = +[CKMediaObjectManager sharedInstance];
  uint64_t v43 = 0;
  __int16 v44 = &v43;
  uint64_t v45 = 0x3032000000;
  uint64_t v46 = __Block_byref_object_copy__31;
  uint64_t v47 = __Block_byref_object_dispose__31;
  id v48 = 0;
  if ([v6 containsObject:@"com.apple.sticker.mediaPayload"])
  {
    uint64_t v8 = @"com.apple.sticker.mediaPayload";
    goto LABEL_18;
  }
  if ([v6 containsObject:@"com.apple.sticker"])
  {
    uint64_t v9 = (void *)*MEMORY[0x1E4F44470];
    uint64_t v10 = [(id)*MEMORY[0x1E4F44470] identifier];
    int v11 = [v6 containsObject:v10];

    if (v11)
    {
      uint64_t v8 = [v9 identifier];
      goto LABEL_18;
    }
  }
  uint64_t v12 = MEMORY[0x192FBAB10]();
  if (![v6 containsObject:v12])
  {
    if ([v6 containsObject:@"com.apple.live-photo-bundle"])
    {
      uint64_t v8 = @"com.apple.live-photo-bundle";
      goto LABEL_17;
    }
    if ([v6 containsObject:@"com.apple.private.live-photo-bundle"])
    {
      uint64_t v8 = @"com.apple.private.live-photo-bundle";
      goto LABEL_17;
    }
    if ([v6 containsObject:@"com.apple.photos.object-reference.asset"])
    {
      uint64_t v8 = @"com.apple.photos.object-reference.asset";
      goto LABEL_17;
    }
    if ([v6 containsObject:@"com.apple.mapkit.map-item"])
    {
      uint64_t v8 = @"com.apple.mapkit.map-item";
      goto LABEL_17;
    }
    id v15 = [v6 firstObject];
    uint64_t v16 = (void *)*MEMORY[0x1E4F44450];
    __int16 v17 = [(id)*MEMORY[0x1E4F44450] identifier];
    int v18 = [v15 isEqualToString:v17];

    if (v18)
    {
      uint64_t v13 = [v16 identifier];
      goto LABEL_8;
    }
    if ([v6 containsObject:@"com.apple.messages.maputi"])
    {
      uint64_t v13 = @"com.apple.messages.maputi";
      goto LABEL_8;
    }
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __63__CKComposition_UIPasteboard__richestMediaTypeForItemProvider___block_invoke;
    v39[3] = &unk_1E5626288;
    id v42 = a1;
    id v19 = v7;
    id v40 = v19;
    uint64_t v20 = v5;
    id v41 = v20;
    [v6 enumerateObjectsUsingBlock:v39];
    if (![(CKMultiDict *)v20 count])
    {
LABEL_31:
      uint64_t v8 = (__CFString *)(id)v44[5];

      goto LABEL_17;
    }
    uint64_t v35 = 0;
    id v36 = &v35;
    uint64_t v37 = 0x2050000000;
    uint64_t v38 = 0;
    __int16 v21 = [v19 classes];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __63__CKComposition_UIPasteboard__richestMediaTypeForItemProvider___block_invoke_2;
    v32[3] = &unk_1E56262B0;
    id v22 = v20;
    uint64_t v33 = v22;
    uint64_t v34 = &v35;
    [v21 enumerateObjectsUsingBlock:v32];
    uint64_t v23 = [(CKMultiDict *)v22 objectsForKey:v36[3]];
    uint64_t v24 = v36[3];
    if (v24 == objc_opt_class())
    {
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __63__CKComposition_UIPasteboard__richestMediaTypeForItemProvider___block_invoke_3;
      void v31[3] = &unk_1E5621A30;
      void v31[4] = &v43;
      [v23 enumerateObjectsUsingBlock:v31];
      if (v44[5]) {
        goto LABEL_30;
      }
      uint64_t v27 = [v23 lastObject];
      id v26 = (void *)v44[5];
      v44[5] = v27;
    }
    else
    {
      __int16 v25 = [(id)v36[3] UTITypes];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __63__CKComposition_UIPasteboard__richestMediaTypeForItemProvider___block_invoke_4;
      v28[3] = &unk_1E5620C90;
      id v29 = v23;
      __int16 v30 = &v43;
      [v25 enumerateObjectsUsingBlock:v28];

      id v26 = v29;
    }

LABEL_30:
    _Block_object_dispose(&v35, 8);
    goto LABEL_31;
  }
  uint64_t v13 = v12;
LABEL_8:
  uint64_t v8 = v13;
LABEL_17:

LABEL_18:
  _Block_object_dispose(&v43, 8);

  return v8;
}

void __63__CKComposition_UIPasteboard__richestMediaTypeForItemProvider___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(a1[6], "_shouldCreateMediaObjectForUTIType:")) {
    objc_msgSend(a1[5], "pushObject:forKey:", v3, objc_msgSend(a1[4], "classForUTIType:", v3));
  }
}

void __63__CKComposition_UIPasteboard__richestMediaTypeForItemProvider___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  long long v7 = [*(id *)(a1 + 32) peekObjectForKey:a2];

  if (v7)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
    *a4 = 1;
  }
}

void __63__CKComposition_UIPasteboard__richestMediaTypeForItemProvider___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  if ((CKUTTypeIsDynamic(v8, v7) & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

void __63__CKComposition_UIPasteboard__richestMediaTypeForItemProvider___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:"))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

+ (id)_temporaryURLFromURL:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    uint64_t v25 = 0;
    id v26 = &v25;
    uint64_t v27 = 0x3032000000;
    id v28 = __Block_byref_object_copy__31;
    id v29 = __Block_byref_object_dispose__31;
    id v30 = 0;
    id v5 = v3;
    id v30 = v5;
    id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v7 = [v6 isUbiquitousItemAtURL:v5];

    if (v7)
    {
      id v8 = dispatch_group_create();
      dispatch_group_enter(v8);
      uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F28CA0]) initWithFilePresenter:0];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __52__CKComposition_UIPasteboard___temporaryURLFromURL___block_invoke;
      v20[3] = &unk_1E5626BC0;
      id v21 = 0;
      uint64_t v23 = &v25;
      id v24 = 0;
      uint64_t v10 = v8;
      id v22 = v10;
      [v9 coordinateReadingItemAtURL:v5 options:0 error:&v24 byAccessor:v20];
      id v11 = v24;
      dispatch_group_wait(v10, 0xDF8475800uLL);
    }
    uint64_t v12 = NSString;
    uint64_t v13 = [MEMORY[0x1E4F29128] UUID];
    id v14 = [v13 UUIDString];
    id v15 = [(id)v26[5] lastPathComponent];
    uint64_t v16 = [v12 stringWithFormat:@"%@%@", v14, v15];

    __int16 v17 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v18 = objc_msgSend(v17, "im_randomTemporaryFileURLWithFileName:", v16);

    _Block_object_dispose(&v25, 8);
  }
  else
  {
    int v18 = 0;
  }

  return v18;
}

void __52__CKComposition_UIPasteboard___temporaryURLFromURL___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (*(void *)(a1 + 32))
  {
    if (IMOSLoggingEnabled())
    {
      id v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        id v6 = [*(id *)(a1 + 32) localizedDescription];
        int v7 = 138412290;
        id v8 = v6;
        _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Failed to coordinate reading for ubiquitous item: %@", (uint8_t *)&v7, 0xCu);
      }
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

+ (void)mediaObjectFromItemAtURL:(id)a3 filename:(id)a4 completion:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void, void *))a5;
  id v11 = [a1 _temporaryURLFromURL:v8];
  uint64_t v12 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v13 = v12;
  if (v11)
  {
    id v23 = 0;
    [v12 copyItemAtURL:v8 toURL:v11 error:&v23];
    id v14 = v23;
    if (v14)
    {
      id v15 = v14;
      if (IMOSLoggingEnabled())
      {
        uint64_t v16 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412290;
          id v25 = v15;
          _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_INFO, "Failed copying item to temp location for media object creation: %@", buf, 0xCu);
        }
      }
      v10[2](v10, 0, v15);
    }
    else
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __76__CKComposition_UIPasteboard__mediaObjectFromItemAtURL_filename_completion___block_invoke;
      block[3] = &unk_1E56267D8;
      id v19 = v11;
      id v20 = v9;
      id v22 = v10;
      id v21 = v13;
      dispatch_async(MEMORY[0x1E4F14428], block);

      id v15 = v19;
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      __int16 v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        id v25 = v8;
        _os_log_impl(&dword_18EF18000, v17, OS_LOG_TYPE_INFO, "Failed to generate a tempURL from a pasteboard item url %@", buf, 0xCu);
      }
    }
    id v15 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"com.apple.Messages.CKComposition_UIPasteBoard" code:0 userInfo:0];
    v10[2](v10, 0, v15);
  }
}

void __76__CKComposition_UIPasteboard__mediaObjectFromItemAtURL_filename_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = [[CKRemoteItemForSending alloc] initWithAttachmentURL:*(void *)(a1 + 32) description:0 blockOnPreviewCreation:0];
  id v2 = +[CKMediaObjectManager sharedInstance];
  id v3 = [(CKRemoteItemForSending *)v13 attachmentURL];
  id v4 = [v2 mediaObjectWithFileURL:v3 filename:*(void *)(a1 + 40) transcoderUserInfo:0];

  id v5 = [(CKRemoteItemForSending *)v13 appendedVideoURL];
  id v6 = [v5 path];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    id v8 = [(CKRemoteItemForSending *)v13 appendedVideoURL];
    id v9 = [v4 fileURL];
    uint64_t v10 = CKGetTmpPathForAppendedVideoURL(v8, v9);

    id v11 = [(CKRemoteItemForSending *)v13 appendedVideoURL];
    uint64_t v12 = [v4 transferGUID];
    CKLinkAndCreateAppendedVideoTransfer(v10, v11, v12);
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  [*(id *)(a1 + 48) removeItemAtURL:*(void *)(a1 + 32) error:0];
}

+ (void)mediaObjectFromPhotosAsset:(id)a3 completion:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, id))a4;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  uint64_t v24 = 0;
  uint64_t v24 = [v6 playbackStyle];
  id v22 = 0;
  id v8 = [MEMORY[0x1E4F38F38] exportRequestForAsset:v6 error:&v22];
  id v9 = v22;
  if (v9)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        id v11 = [v9 localizedDescription];
        *(_DWORD *)long long buf = 138412290;
        uint64_t v26 = v11;
        _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Error creating PHAssetExportRequest: %@", buf, 0xCu);
      }
    }
    v7[2](v7, 0, v9);
  }
  else
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F38F40]);
    [v12 setVariant:1];
    [v12 setShouldBundleComplexAssetResources:1];
    if (_os_feature_enabled_impl()
      && [MEMORY[0x1E4F6E730] deviceIsLockedDown])
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v13 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "Lockdown mode is enabled. Excluding location and caption metadata by default.", buf, 2u);
        }
      }
      uint64_t v14 = 1;
      uint64_t v15 = 1;
    }
    else
    {
      uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.photos.shareddefaults"];
      uint64_t v15 = [v16 BOOLForKey:@"ExcludeLocationWhenSharing"];
      if (v15 && IMOSLoggingEnabled())
      {
        __int16 v17 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_18EF18000, v17, OS_LOG_TYPE_INFO, "Photos prefs excludes location when sharing. Excluding location metadata by default.", buf, 2u);
        }
      }
      uint64_t v14 = 0;
    }
    [v12 setShouldStripLocation:v15];
    [v12 setShouldStripCaption:v14];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __69__CKComposition_UIPasteboard__mediaObjectFromPhotosAsset_completion___block_invoke;
    v18[3] = &unk_1E5626BE8;
    id v20 = v23;
    id v21 = a1;
    id v19 = v7;
    [v8 exportWithOptions:v12 completionHandler:v18];
  }
  _Block_object_dispose(v23, 8);
}

void __69__CKComposition_UIPasteboard__mediaObjectFromPhotosAsset_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if ((unint64_t)(v7 - 1) >= 2)
  {
    if ((unint64_t)(v7 - 4) >= 2)
    {
      if (v7 == 3)
      {
        uint64_t v10 = [v5 objectForKey:*MEMORY[0x1E4F393C8]];
        if (v10) {
          goto LABEL_16;
        }
      }
      goto LABEL_9;
    }
    id v8 = [v5 objectForKey:*MEMORY[0x1E4F393C0]];
    if (!v8)
    {
      id v9 = [v5 objectForKey:*MEMORY[0x1E4F393E0]];
      goto LABEL_15;
    }
    goto LABEL_6;
  }
  id v8 = [v5 objectForKey:*MEMORY[0x1E4F393B8]];
  if (v8)
  {
LABEL_6:
    id v9 = v8;
    goto LABEL_15;
  }
  id v9 = [v5 objectForKey:*MEMORY[0x1E4F393D8]];
LABEL_15:
  uint64_t v10 = v9;

  if (v10)
  {
LABEL_16:
    [*(id *)(a1 + 48) mediaObjectFromItemAtURL:v10 filename:0 completion:*(void *)(a1 + 32)];

    goto LABEL_17;
  }
LABEL_9:
  if (IMOSLoggingEnabled())
  {
    id v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412290;
      id v13 = v5;
      _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Unable to deterine URL from fileURLS: %@", (uint8_t *)&v12, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_17:
}

+ (void)requestMediaObjectForItemProvider:(id)a3 type:(id)a4 builderContext:(id)a5 completion:(id)a6
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v42 = a5;
  id v12 = a6;
  if (IMOSLoggingEnabled())
  {
    id v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "requestMediaObjectForItemProvider", buf, 2u);
    }
  }
  if (v11)
  {
    uint64_t v14 = +[CKMediaObjectManager sharedInstance];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke;
    aBlock[3] = &unk_1E5626C10;
    id v40 = v14;
    id v75 = v40;
    id v15 = v11;
    id v76 = v15;
    id v16 = v10;
    id v77 = v16;
    id v17 = v12;
    id v78 = v17;
    int v18 = _Block_copy(aBlock);
    v69[0] = MEMORY[0x1E4F143A8];
    v69[1] = 3221225472;
    v69[2] = __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_394;
    v69[3] = &unk_1E5622FB8;
    id v19 = v16;
    id v70 = v19;
    id v20 = v15;
    id v71 = v20;
    id v73 = a1;
    id v21 = v18;
    id v72 = v21;
    id v41 = (void (**)(void))_Block_copy(v69);
    id v22 = MEMORY[0x192FBAB10]();
    char v23 = [v20 isEqualToString:v22];

    if ((v23 & 1) != 0
      || (objc_msgSend(v20, "isEqualToString:", @"com.apple.live-photo-bundle", v40) & 1) != 0
      || [v20 isEqualToString:@"com.apple.private.live-photo-bundle"])
    {
      v67[0] = MEMORY[0x1E4F143A8];
      v67[1] = 3221225472;
      v67[2] = __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_8;
      v67[3] = &unk_1E5626760;
      id v68 = v17;
      id v24 = (id)[v19 loadFileRepresentationForTypeIdentifier:v20 completionHandler:v67];
    }
    else
    {
      if (![v20 isEqualToString:@"com.apple.sticker.mediaPayload"])
      {
        uint64_t v27 = [(id)*MEMORY[0x1E4F44470] identifier];
        int v28 = [v20 isEqualToString:v27];

        if (v28)
        {
          id v29 = IMLogHandleForCategory();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_18EF18000, v29, OS_LOG_TYPE_INFO, "Loading string representation of dragged item, e.g. for an emoji sticker inserted as text after dragging to the entry view", buf, 2u);
          }

          v62[0] = MEMORY[0x1E4F143A8];
          v62[1] = 3221225472;
          v62[2] = __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_406;
          void v62[3] = &unk_1E5624F78;
          id v63 = v17;
          id v30 = (id)[v19 loadDataRepresentationForTypeIdentifier:v20 completionHandler:v62];

          goto LABEL_10;
        }
        if ([v20 isEqualToString:@"com.apple.mapkit.map-item"])
        {
          if (!MEMORY[0x192FBA860](@"MKMapItem", @"MapKit"))
          {
            if (IMOSLoggingEnabled())
            {
              uint64_t v34 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)long long buf = 138412546;
                id v80 = @"MKMapItem";
                __int16 v81 = 2112;
                id v82 = @"MapKit";
                _os_log_impl(&dword_18EF18000, v34, OS_LOG_TYPE_INFO, "Failed weak linking %@ from %@.", buf, 0x16u);
              }
            }
            goto LABEL_10;
          }
          if ([v19 canLoadObjectOfClass:objc_opt_class()])
          {
            uint64_t v31 = objc_opt_class();
            v58[0] = MEMORY[0x1E4F143A8];
            v58[1] = 3221225472;
            v58[2] = __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_413;
            v58[3] = &unk_1E5626D50;
            id v59 = v19;
            id v60 = v20;
            id v61 = v21;
            id v32 = (id)[v59 loadObjectOfClass:v31 completionHandler:v58];

            goto LABEL_10;
          }
        }
        else
        {
          if ([v20 isEqualToString:@"com.apple.messages.maputi"])
          {
            v55[0] = MEMORY[0x1E4F143A8];
            v55[1] = 3221225472;
            v55[2] = __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_4_417;
            v55[3] = &unk_1E5626D78;
            id v56 = v17;
            id v57 = v21;
            objc_msgSend(v19, "__ck_loadDataForAppleMapVCard:", v55);

            goto LABEL_10;
          }
          if ([v20 isEqualToString:@"com.apple.finder.node"])
          {
            v51[0] = MEMORY[0x1E4F143A8];
            v51[1] = 3221225472;
            v51[2] = __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_421;
            v51[3] = &unk_1E5626DA0;
            id v52 = v19;
            id v54 = a1;
            id v53 = v17;
            id v33 = (id)[v52 loadDataRepresentationForTypeIdentifier:v20 completionHandler:v51];

            goto LABEL_10;
          }
          if ([v20 isEqualToString:@"com.apple.photos.object-reference.asset"])
          {
            v48[0] = MEMORY[0x1E4F143A8];
            v48[1] = 3221225472;
            v48[2] = __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_3_423;
            v48[3] = &unk_1E5626DC8;
            id v49 = v17;
            id v50 = a1;
            id v35 = (id)[v19 loadDataRepresentationForTypeIdentifier:@"com.apple.photos.object-reference.asset" completionHandler:v48];

            goto LABEL_10;
          }
          if ([v20 isEqualToString:@"public.file-url"])
          {
            uint64_t v36 = objc_opt_class();
            v45[0] = MEMORY[0x1E4F143A8];
            v45[1] = 3221225472;
            v45[2] = __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_2_429;
            v45[3] = &unk_1E5626DF0;
            id v47 = a1;
            id v46 = v17;
            id v37 = (id)[v19 loadObjectOfClass:v36 completionHandler:v45];

            goto LABEL_10;
          }
          if (![v20 isEqualToString:@"com.apple.drawing"])
          {
            if ([v20 isEqualToString:@"com.apple.pkpass"])
            {
              block[0] = MEMORY[0x1E4F143A8];
              block[1] = 3221225472;
              block[2] = __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_437;
              block[3] = &unk_1E5620F48;
              __int16 v44 = v41;
              dispatch_async(MEMORY[0x1E4F14428], block);
            }
            else
            {
              v41[2]();
            }
            goto LABEL_10;
          }
          if (IMOSLoggingEnabled())
          {
            uint64_t v38 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl(&dword_18EF18000, v38, OS_LOG_TYPE_INFO, "Ignoring .drawing file", buf, 2u);
            }
          }
        }
        (*((void (**)(id, void, void, void))v17 + 2))(v17, 0, 0, 0);
        goto LABEL_10;
      }
      uint64_t v25 = MEMORY[0x192FBA860](@"_MSMessageMediaPayload", @"Messages");
      v64[0] = MEMORY[0x1E4F143A8];
      v64[1] = 3221225472;
      v64[2] = __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_10;
      v64[3] = &unk_1E5626D00;
      id v66 = v17;
      id v65 = v42;
      id v26 = (id)[v19 loadObjectOfClass:v25 completionHandler:v64];
    }
LABEL_10:

    goto LABEL_46;
  }
  id v39 = IMLogHandleForCategory();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
    +[CKComposition(UIPasteboard) requestMediaObjectForItemProvider:type:builderContext:completion:]();
  }

  (*((void (**)(id, void, void, void))v12 + 2))(v12, 0, 0, 0);
LABEL_46:
}

void __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = [*(id *)(a1 + 32) mediaObjectWithData:a2 UTIType:*(void *)(a1 + 40) filename:a3 transcoderUserInfo:0];
  id v5 = v4;
  if (v4)
  {
    id v6 = *(void **)(a1 + 48);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_2;
    v8[3] = &unk_1E56264B8;
    id v9 = v4;
    id v10 = *(id *)(a1 + 56);
    id v7 = (id)[v6 loadDataRepresentationForTypeIdentifier:@"com.apple.MobileSMS.appendedURL" completionHandler:v8];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v15 = 138412290;
      id v16 = v5;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "appendedData %@", (uint8_t *)&v15, 0xCu);
    }
  }
  if (v5)
  {
    id v8 = (void *)[[NSString alloc] initWithData:v5 encoding:4];
    if (IMOSLoggingEnabled())
    {
      id v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v15 = 138412290;
        id v16 = v8;
        _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "appendedPath %@", (uint8_t *)&v15, 0xCu);
      }
    }
    if (v8)
    {
      id v10 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v8];
      if (IMOSLoggingEnabled())
      {
        id v11 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          int v15 = 138412290;
          id v16 = v10;
          _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "appendedVideoURL %@", (uint8_t *)&v15, 0xCu);
        }
      }
      if (v10)
      {
        id v12 = [*(id *)(a1 + 32) fileURL];
        id v13 = CKGetTmpPathForAppendedVideoURL(v10, v12);

        uint64_t v14 = [*(id *)(a1 + 32) transferGUID];
        CKLinkAndCreateAppendedVideoTransfer(v13, v10, v14);
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_394(uint64_t a1)
{
  id v3 = *(void **)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_2_395;
  v5[3] = &unk_1E5626CB0;
  uint64_t v9 = *(void *)(a1 + 56);
  id v6 = v2;
  id v7 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 48);
  id v4 = (id)[v3 loadDataRepresentationForTypeIdentifier:v6 completionHandler:v5];
}

void __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_2_395(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_3;
  block[3] = &unk_1E5626C88;
  uint64_t v11 = *(void *)(a1 + 56);
  id v7 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v4 = *(id *)(a1 + 48);
  id v9 = v3;
  id v10 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_4;
  v5[3] = &unk_1E5626C60;
  id v4 = *(void **)(a1 + 64);
  id v9 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 32);
  [v4 requestFilenameForType:v2 forItemProvider:v3 completion:v5];
}

void __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_5;
    block[3] = &unk_1E5622EC8;
    id v4 = &v15;
    id v15 = *(id *)(a1 + 56);
    id v5 = &v13;
    id v13 = *(id *)(a1 + 32);
    id v14 = v3;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    id v6 = *(void **)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_6;
    v9[3] = &unk_1E5626C38;
    id v4 = &v11;
    id v11 = *(id *)(a1 + 56);
    id v5 = &v10;
    id v10 = *(id *)(a1 + 32);
    id v8 = (id)[v6 loadFileRepresentationForTypeIdentifier:v7 completionHandler:v9];
  }
}

uint64_t __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_5(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = [a2 lastPathComponent];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_7;
  block[3] = &unk_1E5622EC8;
  id v8 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_7(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_8(uint64_t a1, uint64_t a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_9;
  v3[3] = &unk_1E5626CD8;
  id v4 = *(id *)(a1 + 32);
  +[CKComposition mediaObjectFromItemAtURL:a2 filename:0 completion:v3];
}

uint64_t __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_10(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_11;
  block[3] = &unk_1E5625E70;
  id v6 = v3;
  id v8 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_11(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = [v2 stickerStoreIdentifier];
    if (!v3
      || (+[CKStickersFrameworkInterface uiStickerWithIdentifier:v3], (id v4 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      id v5 = IMLogHandleForCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_11_cold_3();
      }

      id v6 = [MEMORY[0x1E4F6EA58] stickerWithMSMessageMediaPayload:*(void *)(a1 + 32)];
      id v4 = [v6 uiSticker];
    }
    id v7 = objc_msgSend(v4, "_ck_plainStringEmojiText");
    if ([v7 length])
    {
      id v8 = IMLogHandleForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_11_cold_2();
      }

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      int v10 = [*(id *)(a1 + 40) conversationSupportsInlineAdaptiveImageGlyphs];
      int v11 = objc_msgSend(v4, "_ck_shouldInsertInCompositionAsAdaptiveImageGlyph");
      id v12 = IMLogHandleForCategory();
      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
      if (v10 && v11)
      {
        if (v13)
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "Handling sticker drag to entry view as adaptive image glyph", buf, 2u);
        }

        id v14 = _UIStickerCreateAdaptiveImageGlyphFromSticker();
      }
      else
      {
        if (v13)
        {
          *(_WORD *)int v18 = 0;
          _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "Handling sticker drag to entry view as sticker added to shelf", v18, 2u);
        }

        id v14 = 0;
      }
      id v15 = (void *)[objc_alloc(MEMORY[0x1E4F6EA58]) initWithUISticker:v4 adaptiveImageGlyph:v14];
      id v16 = +[CKMediaObjectManager sharedInstance];
      uint64_t v17 = [v16 mediaObjectWithSticker:v15 stickerUserInfo:0];
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else
  {
    id v9 = IMLogHandleForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_11_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_406(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)NSString;
  id v4 = a2;
  id v5 = (id)[[v3 alloc] initWithData:v4 encoding:4];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_413(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 _vCardRepresentation];
  id v5 = [v3 _vCardFilename];

  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_2_414;
  v12[3] = &unk_1E5626D28;
  id v8 = *(id *)(a1 + 48);
  id v14 = v5;
  id v15 = v8;
  id v13 = v4;
  id v9 = v5;
  id v10 = v4;
  id v11 = (id)[v6 loadDataRepresentationForTypeIdentifier:v7 completionHandler:v12];
}

void __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_2_414(id *a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_3_415;
  block[3] = &unk_1E5622EC8;
  id v5 = a1[6];
  id v3 = a1[4];
  id v4 = a1[5];
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_3_415(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_4_417(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v8 && v7 && !v9)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v12 = 138412290;
        id v13 = v10;
        _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Failed to load apple map vCard with error: %@", (uint8_t *)&v12, 0xCu);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_421(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)NSString;
  id v4 = a2;
  id v5 = (void *)[[v3 alloc] initWithData:v4 encoding:4];

  id v6 = [MEMORY[0x1E4F1CB10] URLWithString:v5];
  id v7 = [*(id *)(a1 + 32) suggestedName];
  if (!v7)
  {
    id v8 = [v6 lastPathComponent];
    id v7 = [v8 stringByRemovingPercentEncoding];
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_2_422;
  v10[3] = &unk_1E5626CD8;
  id v9 = *(void **)(a1 + 48);
  id v11 = *(id *)(a1 + 40);
  [v9 mediaObjectFromItemAtURL:v6 filename:v7 completion:v10];
}

uint64_t __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_2_422(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_3_423(uint64_t a1, void *a2, void *a3)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithPlistData:v5];
  id v8 = [v7 objectForKey:@"localIdentifier"];

  if (v8)
  {
    id v9 = (void *)MEMORY[0x1E4F38EB8];
    v20[0] = v8;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    id v11 = [v9 fetchAssetsWithLocalIdentifiers:v10 options:0];
    int v12 = [v11 firstObject];

    if (v12)
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_428;
      v16[3] = &unk_1E5626CD8;
      id v13 = *(void **)(a1 + 40);
      id v17 = *(id *)(a1 + 32);
      [v13 mediaObjectFromPhotosAsset:v12 completion:v16];
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        id v15 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412290;
          id v19 = v8;
          _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "Failed to fetch asset with identifier: %@", buf, 0xCu);
        }
      }
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "Local identifier for photo asset not found in item provider dictionary", buf, 2u);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_428(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_2_429(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [v5 lastPathComponent];
    id v8 = [v7 stringByRemovingPercentEncoding];

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_3_430;
    v11[3] = &unk_1E5626CD8;
    id v9 = *(void **)(a1 + 40);
    id v12 = *(id *)(a1 + 32);
    [v9 mediaObjectFromItemAtURL:v5 filename:v8 completion:v11];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        id v14 = v6;
        _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Failed to fetch URL with error: %@", buf, 0xCu);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_3_430(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_437(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)requestMediaObjectsForAttributedString:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[CKMediaObjectManager sharedInstance];
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__31;
  void v21[4] = __Block_byref_object_dispose__31;
  id v22 = 0;
  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v8 = dispatch_group_create();
  dispatch_group_enter(v8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__CKComposition_UIPasteboard__requestMediaObjectsForAttributedString_completion___block_invoke;
  block[3] = &unk_1E5626AD0;
  id v9 = v6;
  id v19 = v9;
  id v20 = v21;
  dispatch_group_notify(v8, MEMORY[0x1E4F14428], block);
  uint64_t v10 = [v5 length];
  uint64_t v11 = *MEMORY[0x1E4FB06B8];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __81__CKComposition_UIPasteboard__requestMediaObjectsForAttributedString_completion___block_invoke_2;
  v14[3] = &unk_1E5626E40;
  id v12 = v8;
  uint64_t v15 = v12;
  id v13 = v7;
  id v16 = v13;
  id v17 = v21;
  objc_msgSend(v5, "enumerateAttribute:inRange:options:usingBlock:", v11, 0, v10, 0, v14);
  dispatch_group_leave(v12);

  _Block_object_dispose(v21, 8);
}

void __81__CKComposition_UIPasteboard__requestMediaObjectsForAttributedString_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = (id)[*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) copy];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __81__CKComposition_UIPasteboard__requestMediaObjectsForAttributedString_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __81__CKComposition_UIPasteboard__requestMediaObjectsForAttributedString_completion___block_invoke_3;
    v6[3] = &unk_1E5626E18;
    id v7 = *(id *)(a1 + 40);
    id v8 = v4;
    uint64_t v10 = *(void *)(a1 + 48);
    id v9 = *(id *)(a1 + 32);
    id v5 = v4;
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

void __81__CKComposition_UIPasteboard__requestMediaObjectsForAttributedString_completion___block_invoke_3(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) fileWrapper];
  id v4 = [v3 regularFileContents];
  id v5 = [*(id *)(a1 + 40) fileType];
  id v6 = [*(id *)(a1 + 40) fileWrapper];
  id v7 = [v6 filename];
  id v8 = [v2 mediaObjectWithData:v4 UTIType:v5 filename:v7 transcoderUserInfo:0];

  if (v8) {
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v8];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

- (void)evaluateSendMetricsWithConversation:(id)a3 shareSheetHostBundleIdentifier:(id)a4
{
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  id v90 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  id v8 = [(CKComposition *)self mediaObjects];
  id v9 = (void *)[v8 mutableCopy];

  uint64_t v10 = [(CKComposition *)self shelfPluginPayload];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0;
  }
  id v12 = v11;
  id v13 = v12;
  if (v12)
  {
    id v14 = [v12 mediaObjectFromPayload];
    if (v14)
    {
      [v9 addObject:v14];
    }
    else
    {
      uint64_t v15 = objc_msgSend(v13, "__ck_photoCompositionMediaObjects");
      if ([v15 count]) {
        [v9 addObjectsFromArray:v15];
      }
    }
  }
  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  id v16 = v9;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v96 objects:v107 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v97;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v97 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = [*(id *)(*((void *)&v96 + 1) + 8 * i) metricsCollectorMediaType];
        [v7 addObject:v21];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v96 objects:v107 count:16];
    }
    while (v18);
  }

  id v22 = (id)*MEMORY[0x1E4F6D918];
  id v82 = v16;
  if (CKIsRunningInMessagesViewService())
  {
    id v23 = (id)*MEMORY[0x1E4F6D940];

    id v24 = IMBiomeQueue();
    dispatch_async(v24, &__block_literal_global_134);

    if ([v6 isEqualToString:@"com.apple.mobileslideshow"])
    {
      uint64_t v25 = (id *)MEMORY[0x1E4F6D948];
    }
    else
    {
      if (![v6 isEqualToString:@"com.apple.mobilesafari"]) {
        goto LABEL_33;
      }
      uint64_t v25 = (id *)MEMORY[0x1E4F6D950];
    }
    id v29 = *v25;
  }
  else
  {
    if (!v10)
    {
      id v23 = v22;
      goto LABEL_33;
    }
    id v23 = [v10 pluginBundleID];
    if (([v23 isEqualToString:*MEMORY[0x1E4F6CBF8]] & 1) != 0
      || (IMBalloonExtensionIDWithSuffix(),
          id v26 = objc_claimAutoreleasedReturnValue(),
          char v27 = [v23 isEqualToString:v26],
          v26,
          (v27 & 1) != 0))
    {
      int v28 = (id *)MEMORY[0x1E4F6D938];
    }
    else
    {
      int v30 = [v23 hasSuffix:*MEMORY[0x1E4F6CC18]];
      int v28 = (id *)MEMORY[0x1E4F6D930];
      if (v30) {
        int v28 = (id *)MEMORY[0x1E4F6D920];
      }
    }
    id v29 = *v28;
  }
  id v23 = v29;
LABEL_33:
  v91 = v23;
  long long v94 = 0u;
  long long v95 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  uint64_t v31 = [v7 allObjects];
  uint64_t v32 = [v31 countByEnumeratingWithState:&v92 objects:v106 count:16];
  uint64_t v83 = v6;
  if (!v32)
  {
LABEL_45:

    goto LABEL_46;
  }
  uint64_t v33 = v32;
  id v79 = self;
  id v80 = v13;
  __int16 v81 = v10;
  v89 = v7;
  uint64_t v34 = 0;
  uint64_t v35 = *(void *)v93;
  uint64_t v36 = *MEMORY[0x1E4F6D988];
  uint64_t v84 = *MEMORY[0x1E4F6D998];
  uint64_t v88 = *MEMORY[0x1E4F6D908];
  uint64_t v87 = *MEMORY[0x1E4F6D8F8];
  uint64_t v37 = *MEMORY[0x1E4F6D910];
  obuint64_t j = v31;
  uint64_t v86 = *MEMORY[0x1E4F6D928];
  do
  {
    for (uint64_t j = 0; j != v33; ++j)
    {
      if (*(void *)v93 != v35) {
        objc_enumerationMutation(obj);
      }
      id v39 = *(void **)(*((void *)&v92 + 1) + 8 * j);
      uint64_t v40 = [v89 countForObject:v39];
      if (([v39 isEqualToString:v36] & 1) != 0
        || [v39 isEqualToString:v84])
      {
        v34 += v40;
      }
      uint64_t v41 = [v90 recipientCount];
      id v42 = [MEMORY[0x1E4F6E890] sharedInstance];
      v105[0] = v39;
      v104[0] = @"type";
      v104[1] = v87;
      uint64_t v43 = [NSNumber numberWithUnsignedInteger:v40];
      v105[1] = v43;
      v104[2] = v37;
      __int16 v44 = [NSNumber numberWithUnsignedInteger:v41];
      v104[3] = v86;
      v105[2] = v44;
      v105[3] = v91;
      uint64_t v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v105 forKeys:v104 count:4];
      [v42 trackEvent:v88 withDictionary:v45];
    }
    uint64_t v33 = [obj countByEnumeratingWithState:&v92 objects:v106 count:16];
  }
  while (v33);

  id v7 = v89;
  id v13 = v80;
  uint64_t v10 = v81;
  self = v79;
  if (v34)
  {
    uint64_t v31 = [MEMORY[0x1E4F6E890] sharedInstance];
    v103[0] = *MEMORY[0x1E4F6D900];
    v102[0] = @"type";
    v102[1] = v87;
    id v46 = [NSNumber numberWithUnsignedInteger:v34];
    v102[2] = v86;
    v103[1] = v46;
    v103[2] = v91;
    id v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v103 forKeys:v102 count:3];
    [v31 trackEvent:v88 withDictionary:v47];

    goto LABEL_45;
  }
LABEL_46:
  if (v10)
  {
    id v48 = [v10 pluginBundleID];
    char v49 = [v48 containsString:*MEMORY[0x1E4F6CBE8]];

    char v50 = v49 ^ 1;
    if (!v13) {
      goto LABEL_60;
    }
  }
  else
  {
    char v50 = 1;
    if (!v13) {
      goto LABEL_60;
    }
  }
  if ([v13 shouldSendAsMediaObject])
  {
    if (([v13 isSticker] & 1) == 0)
    {
      id v51 = [MEMORY[0x1E4F6E890] sharedInstance];
      [v51 trackEvent:*MEMORY[0x1E4F6DC60]];
    }
    id v52 = [v13 mediaObject];
    int v53 = [v52 needsAnimation];
    id v54 = [MEMORY[0x1E4F6E890] sharedInstance];
    int v55 = [v13 isSticker];
    id v56 = (void *)MEMORY[0x1E4F6DC58];
    if (!v53) {
      id v56 = (void *)MEMORY[0x1E4F6DC80];
    }
    id v57 = (void *)MEMORY[0x1E4F6DC50];
    if (!v53) {
      id v57 = (void *)MEMORY[0x1E4F6DC78];
    }
    if (!v55) {
      id v56 = v57;
    }
    [v54 trackEvent:*v56];

    goto LABEL_64;
  }
LABEL_60:
  if ((v50 & 1) == 0)
  {
    id v52 = [MEMORY[0x1E4F6E890] sharedInstance];
    int v58 = [v10 isUpdate];
    id v59 = (void *)MEMORY[0x1E4F6DC88];
    if (!v58) {
      id v59 = (void *)MEMORY[0x1E4F6DC68];
    }
    [v52 trackEvent:*v59];
LABEL_64:
  }
  id v60 = v13;
  if (v10)
  {
    id v61 = [v10 pluginBundleID];

    if (v61)
    {
      id v62 = [v10 pluginBundleID];
      id v63 = IMBalloonBundleIDFromExtensionID();

      if (v63 && [v63 hasPrefix:@"com.apple."])
      {
        char v64 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
        [v64 setObject:v63 forKeyedSubscript:*MEMORY[0x1E4F6DA48]];
        if ([v63 isEqualToString:*MEMORY[0x1E4F6CC10]])
        {
          id v65 = [v10 url];
          id v66 = [v65 host];

          if ([&unk_1EDF15608 containsObject:v66]) {
            [v64 setObject:v66 forKeyedSubscript:*MEMORY[0x1E4F6DA40]];
          }
        }
        id v67 = [MEMORY[0x1E4F6E890] sharedInstance];
        [v67 trackEvent:*MEMORY[0x1E4F6DCA8] withDictionary:v64];
      }
    }
  }
  MainBundle = CFBundleGetMainBundle();
  CFStringRef Identifier = CFBundleGetIdentifier(MainBundle);
  id v70 = [MEMORY[0x1E4F6E890] sharedInstance];
  uint64_t v71 = *MEMORY[0x1E4F6DBB0];
  uint64_t v72 = *MEMORY[0x1E4F6DD18];
  v101[0] = Identifier;
  uint64_t v73 = *MEMORY[0x1E4F6DD20];
  v100[0] = v72;
  v100[1] = v73;
  id v74 = NSNumber;
  id v75 = [(CKComposition *)self text];
  id v76 = objc_msgSend(v74, "numberWithLong:", objc_msgSend(v75, "length"));
  v101[1] = v76;
  v100[2] = *MEMORY[0x1E4F6DD28];
  id v77 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v90, "recipientCount"));
  v101[2] = v77;
  id v78 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v101 forKeys:v100 count:3];
  [v70 trackEvent:v71 withDictionary:v78];
}

void __93__CKComposition_Metrics__evaluateSendMetricsWithConversation_shareSheetHostBundleIdentifier___block_invoke()
{
  v0 = [MEMORY[0x1E4F504C8] discoverabilitySignal];
  id v3 = [v0 source];

  id v1 = objc_alloc(MEMORY[0x1E4F50318]);
  id v2 = (void *)[v1 initWithIdentifier:@"com.apple.MobileSMS.shared-via-sharesheet" bundleID:@"com.apple.MobileSMS" context:0 userInfo:MEMORY[0x1E4F1CC08]];
  [v3 sendEvent:v2];
}

- (BOOL)isPlainTextEqual:(id)a3
{
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    id v9 = [v8 text];
    uint64_t v10 = [v9 string];
    if (!v10)
    {
      uint64_t v31 = [(CKComposition *)self text];
      uint64_t v11 = [v31 string];
      if (!v11)
      {
        uint64_t v37 = 0;
        uint64_t v32 = 0;
        int v13 = 0;
        goto LABEL_10;
      }
      uint64_t v32 = (void *)v11;
    }
    id v12 = [v8 text];
    id v3 = [v12 string];
    id v4 = [(CKComposition *)self text];
    id v5 = [v4 string];
    if (![v3 isEqual:v5])
    {
      char v14 = 0;
      goto LABEL_19;
    }
    uint64_t v37 = v10;
    int v30 = v12;
    int v13 = 1;
LABEL_10:
    uint64_t v15 = [v8 subject];
    id v16 = [v15 string];
    id v36 = v8;
    if (!v16)
    {
      id v29 = [(CKComposition *)self subject];
      uint64_t v17 = [v29 string];
      if (!v17)
      {
        int v28 = 0;
        char v14 = 1;
        goto LABEL_16;
      }
      uint64_t v27 = v17;
    }
    objc_msgSend(v8, "subject", v27);
    uint64_t v34 = v9;
    uint64_t v18 = v35 = v3;
    [v18 string];
    uint64_t v19 = v33 = v4;
    [(CKComposition *)self subject];
    id v20 = v16;
    id v21 = v15;
    id v23 = v22 = v5;
    [v23 string];
    v25 = int v24 = v13;
    char v14 = [v19 isEqual:v25];

    int v13 = v24;
    id v5 = v22;
    uint64_t v15 = v21;
    id v16 = v20;

    id v4 = v33;
    id v9 = v34;
    id v3 = v35;
    if (v20)
    {
LABEL_17:

      uint64_t v10 = v37;
      if (!v13)
      {
        id v8 = v36;
        if (v37) {
          goto LABEL_21;
        }
        goto LABEL_20;
      }
      id v12 = v30;
      id v8 = v36;
LABEL_19:

      if (v10)
      {
LABEL_21:

        goto LABEL_22;
      }
LABEL_20:

      goto LABEL_21;
    }
LABEL_16:

    goto LABEL_17;
  }
  char v14 = 0;
LABEL_22:

  return v14;
}

- (BOOL)hasNotBeenEdited:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v6 = [v5 isExpressiveTextEnabled];

  if (v6)
  {
    id v7 = [(CKComposition *)self text];
    id v8 = [v4 text];
    char v9 = [v7 isEqualToAttributedString:v8];
  }
  else
  {
    char v9 = [(CKComposition *)self isPlainTextEqual:v4];
  }

  return v9;
}

- (id)description
{
  id v3 = [(CKComposition *)self mediaObjects];
  uint64_t v4 = [v3 firstObject];

  id v5 = (void *)v4;
  id v29 = NSString;
  v33.receiver = self;
  v33.super_class = (Class)CKComposition;
  uint64_t v32 = [(CKComposition *)&v33 description];
  uint64_t v31 = [(CKComposition *)self text];
  if ([v31 length]) {
    int v6 = @"something";
  }
  else {
    int v6 = @"nothing";
  }
  id v26 = v6;
  int v30 = [(CKComposition *)self subject];
  if ([v30 length]) {
    id v7 = @"something";
  }
  else {
    id v7 = @"nothing";
  }
  uint64_t v25 = v7;
  int v28 = [(CKComposition *)self bizIntent];
  if ([v28 count]) {
    id v8 = @"something";
  }
  else {
    id v8 = @"nothing";
  }
  int v24 = v8;
  uint64_t v27 = [(CKComposition *)self shelfMediaObject];
  if (v27) {
    char v9 = @"something";
  }
  else {
    char v9 = @"nothing";
  }
  uint64_t v10 = [(CKComposition *)self shelfPluginPayload];
  if (v10) {
    uint64_t v11 = @"something";
  }
  else {
    uint64_t v11 = @"nothing";
  }
  id v12 = [(CKComposition *)self collaborationShareOptions];
  if (v12) {
    int v13 = @"something";
  }
  else {
    int v13 = @"nothing";
  }
  char v14 = [(CKComposition *)self proofreadingInfo];
  if ([v14 count]) {
    uint64_t v15 = @"something";
  }
  else {
    uint64_t v15 = @"nothing";
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v5 powerLevels];
    id v16 = v23 = v5;
    if ([v16 count]) {
      uint64_t v17 = @"something";
    }
    else {
      uint64_t v17 = @"nothing";
    }
    id v21 = v13;
    uint64_t v18 = (void *)v32;
    uint64_t v19 = [v29 stringWithFormat:@"%@ text: %@ subject: %@ bizIntent: %@, shelfMediaObject:%@, shelfPluginPayload:%@, collaborationShareOptions: %@ proofreadingInfo: %@ powerLevels: %@", v32, v26, v25, v24, v9, v11, v21, v15, v17];

    id v5 = v23;
  }
  else
  {
    id v22 = v13;
    uint64_t v18 = (void *)v32;
    uint64_t v19 = [v29 stringWithFormat:@"%@ text: %@ subject: %@ bizIntent: %@, shelfMediaObject:%@, shelfPluginPayload:%@, collaborationShareOptions: %@ proofreadingInfo: %@ powerLevels: %@", v32, v26, v25, v24, v9, v11, v22, v15, @"nothing"];
  }

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    id v7 = [v6 text];
    if (v7 || ([(CKComposition *)self text], (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v8 = [v6 text];
      char v9 = [(CKComposition *)self text];
      char v10 = [v8 isEqual:v9];

      if (v7)
      {

        if (v10) {
          goto LABEL_6;
        }
      }
      else
      {

        if (v10) {
          goto LABEL_6;
        }
      }
      if (!IMOSLoggingEnabled()) {
        goto LABEL_70;
      }
      uint64_t v40 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v40, OS_LOG_TYPE_INFO)) {
        goto LABEL_69;
      }
      *(_WORD *)uint64_t v43 = 0;
      uint64_t v41 = "composition text is not equal";
      goto LABEL_68;
    }
LABEL_6:
    uint64_t v11 = [v6 subject];
    if (v11 || ([(CKComposition *)self subject], (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v12 = [v6 subject];
      int v13 = [(CKComposition *)self subject];
      char v14 = [v12 isEqual:v13];

      if (v11)
      {

        if (v14) {
          goto LABEL_10;
        }
      }
      else
      {

        if (v14) {
          goto LABEL_10;
        }
      }
      if (!IMOSLoggingEnabled()) {
        goto LABEL_70;
      }
      uint64_t v40 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v40, OS_LOG_TYPE_INFO)) {
        goto LABEL_69;
      }
      *(_WORD *)uint64_t v43 = 0;
      uint64_t v41 = "composition subject is not equal";
      goto LABEL_68;
    }
LABEL_10:
    uint64_t v15 = [v6 shelfPluginPayload];
    if (v15
      || ([(CKComposition *)self shelfPluginPayload],
          (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v16 = [v6 shelfPluginPayload];
      uint64_t v17 = [(CKComposition *)self shelfPluginPayload];
      char v18 = [v16 isEqual:v17];

      if (v15)
      {

        if (v18) {
          goto LABEL_14;
        }
      }
      else
      {

        if (v18) {
          goto LABEL_14;
        }
      }
      if (!IMOSLoggingEnabled()) {
        goto LABEL_70;
      }
      uint64_t v40 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v40, OS_LOG_TYPE_INFO)) {
        goto LABEL_69;
      }
      *(_WORD *)uint64_t v43 = 0;
      uint64_t v41 = "composition shelfPluginPayload is not equal";
      goto LABEL_68;
    }
LABEL_14:
    uint64_t v19 = [v6 bizIntent];
    if (v19
      || ([(CKComposition *)self bizIntent], (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v20 = [v6 bizIntent];
      id v21 = [(CKComposition *)self bizIntent];
      char v22 = [v20 isEqual:v21];

      if (v19)
      {

        if (v22) {
          goto LABEL_18;
        }
      }
      else
      {

        if (v22) {
          goto LABEL_18;
        }
      }
      if (!IMOSLoggingEnabled()) {
        goto LABEL_70;
      }
      uint64_t v40 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v40, OS_LOG_TYPE_INFO)) {
        goto LABEL_69;
      }
      *(_WORD *)uint64_t v43 = 0;
      uint64_t v41 = "composition bizIntent is not equal";
      goto LABEL_68;
    }
LABEL_18:
    id v23 = [v6 shelfMediaObject];
    if (v23
      || ([(CKComposition *)self shelfMediaObject],
          (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      int v24 = [v6 shelfMediaObject];
      uint64_t v25 = [(CKComposition *)self shelfMediaObject];
      char v26 = [v24 isEqual:v25];

      if (v23)
      {

        if (v26) {
          goto LABEL_22;
        }
      }
      else
      {

        if (v26) {
          goto LABEL_22;
        }
      }
      if (!IMOSLoggingEnabled()) {
        goto LABEL_70;
      }
      uint64_t v40 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v40, OS_LOG_TYPE_INFO)) {
        goto LABEL_69;
      }
      *(_WORD *)uint64_t v43 = 0;
      uint64_t v41 = "composition shelfMediaObject is not equal";
      goto LABEL_68;
    }
LABEL_22:
    uint64_t v27 = [v6 proofreadingInfo];
    if (!v27)
    {
      id v3 = [(CKComposition *)self proofreadingInfo];
      if (!v3) {
        goto LABEL_26;
      }
    }
    int v28 = [v6 proofreadingInfo];
    id v29 = [(CKComposition *)self proofreadingInfo];
    char v30 = [v28 isEqual:v29];

    if (v27)
    {

      if (v30) {
        goto LABEL_26;
      }
    }
    else
    {

      if (v30)
      {
LABEL_26:
        uint64_t v31 = [v6 collaborationShareOptions];
        if (!v31)
        {
          id v3 = [(CKComposition *)self collaborationShareOptions];
          if (!v3)
          {
LABEL_30:
            uint64_t v35 = [v6 sendLaterPluginInfo];
            if (!v35)
            {
              id v3 = [(CKComposition *)self sendLaterPluginInfo];
              if (!v3) {
                goto LABEL_34;
              }
            }
            id v36 = [v6 sendLaterPluginInfo];
            uint64_t v37 = [(CKComposition *)self sendLaterPluginInfo];
            char v38 = [v36 isEqual:v37];

            if (v35)
            {

              if (v38)
              {
LABEL_34:
                BOOL v39 = 1;
LABEL_71:

                goto LABEL_72;
              }
            }
            else
            {

              if (v38) {
                goto LABEL_34;
              }
            }
            if (IMOSLoggingEnabled())
            {
              uint64_t v40 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)uint64_t v43 = 0;
                uint64_t v41 = "composition sendLaterPluginInfo is not equal";
                goto LABEL_68;
              }
LABEL_69:
            }
LABEL_70:
            BOOL v39 = 0;
            goto LABEL_71;
          }
        }
        uint64_t v32 = [v6 collaborationShareOptions];
        objc_super v33 = [(CKComposition *)self collaborationShareOptions];
        char v34 = [v32 isEqual:v33];

        if (v31)
        {

          if (v34) {
            goto LABEL_30;
          }
        }
        else
        {

          if (v34) {
            goto LABEL_30;
          }
        }
        if (!IMOSLoggingEnabled()) {
          goto LABEL_70;
        }
        uint64_t v40 = OSLogHandleForIMFoundationCategory();
        if (!os_log_type_enabled(v40, OS_LOG_TYPE_INFO)) {
          goto LABEL_69;
        }
        *(_WORD *)uint64_t v43 = 0;
        uint64_t v41 = "composition collaborationShareOptions are not equal";
LABEL_68:
        _os_log_impl(&dword_18EF18000, v40, OS_LOG_TYPE_INFO, v41, v43, 2u);
        goto LABEL_69;
      }
    }
    if (!IMOSLoggingEnabled()) {
      goto LABEL_70;
    }
    uint64_t v40 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v40, OS_LOG_TYPE_INFO)) {
      goto LABEL_69;
    }
    *(_WORD *)uint64_t v43 = 0;
    uint64_t v41 = "composition proofreadingInfo is not equal";
    goto LABEL_68;
  }
  BOOL v39 = 0;
LABEL_72:

  return v39;
}

- (unint64_t)hash
{
  id v3 = [(CKComposition *)self text];
  uint64_t v4 = [v3 hash];
  id v5 = [(CKComposition *)self subject];
  uint64_t v6 = [v5 hash] + v4;
  id v7 = [(CKComposition *)self shelfPluginPayload];
  uint64_t v8 = [v7 hash];
  char v9 = [(CKComposition *)self bizIntent];
  uint64_t v10 = v6 + v8 + [v9 hash];
  uint64_t v11 = [(CKComposition *)self shelfMediaObject];
  uint64_t v12 = [v11 hash];
  int v13 = [(CKComposition *)self collaborationShareOptions];
  uint64_t v14 = v12 + [v13 hash];
  uint64_t v15 = [(CKComposition *)self proofreadingInfo];
  unint64_t v16 = v10 + v14 + [v15 hash];

  return v16;
}

- (BOOL)isAudioComposition
{
  return objc_opt_isKindOfClass() & 1;
}

+ (id)composition
{
  id v2 = [[CKComposition alloc] initWithText:0 subject:0];

  return v2;
}

+ (Class)_LPSharedObjectMetadataClass
{
  if (_LPSharedObjectMetadataClass_onceToken != -1) {
    dispatch_once(&_LPSharedObjectMetadataClass_onceToken, &__block_literal_global_270);
  }
  id v2 = (void *)_LPSharedObjectMetadataClass___LPSharedObjectMetadataClass;

  return (Class)v2;
}

uint64_t __45__CKComposition__LPSharedObjectMetadataClass__block_invoke()
{
  uint64_t result = MEMORY[0x192FBA860](@"LPSharedObjectMetadata", @"LinkPresentation");
  _LPSharedObjectMetadataClass___LPSharedObjectMetadataClass = result;
  return result;
}

void __69__CKComposition_compositionWithShelfPluginPayload_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) stopTimingForKey:@"beforeCompletionHandler"];
  [*(id *)(a1 + 32) startTimingForKey:@"completionHandler"];
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  [*(id *)(a1 + 32) stopTimingForKey:@"completionHandler"];
  [*(id *)(a1 + 32) stopTimingForKey:@"totalTimeInMethod"];
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v10 = 138412290;
      uint64_t v11 = v9;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "-[CKComposition compositionWithShelfPluginPayload:competionHandler:] perf timer: %@", (uint8_t *)&v10, 0xCu);
    }
  }
}

uint64_t __69__CKComposition_compositionWithShelfPluginPayload_completionHandler___block_invoke_159(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), 0);
}

void __69__CKComposition_compositionWithShelfPluginPayload_completionHandler___block_invoke_164(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = v7;
  if (!v6 || v7)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v13 = 138412290;
        uint64_t v14 = v8;
        _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "CKComposition_Collaboration failed to get url with error: %@", (uint8_t *)&v13, 0xCu);
      }
    }
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = 0;
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
  [*(id *)(a1 + 32) stopTimingForKey:@"BRShareCopyShareURLOperation"];
  if (IMOSLoggingEnabled())
  {
    uint64_t v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "Finished BRShareCopyShareURLOperation", (uint8_t *)&v13, 2u);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __69__CKComposition_compositionWithShelfPluginPayload_completionHandler___block_invoke_168(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  uint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  id v9 = a3;
  id v10 = a2;
  if ([v8 isFileURL])
  {
    uint64_t v11 = *(NSObject **)(a1 + 32);
    dispatch_time_t v12 = dispatch_time(0, 30000000000);
    dispatch_semaphore_wait(v11, v12);
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    [*(id *)(a1 + 40) startTimingForKey:@"updateCollaborationMetadata"];
    int v13 = [v7 collaborationMetadata];
    uint64_t v14 = [v13 updatedCollaborationMetadataAppBundleIDsWithSharingURL:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    [v7 setCollaborationMetadata:v14];

    [*(id *)(a1 + 40) stopTimingForKey:@"updateCollaborationMetadata"];
  }
  uint64_t v15 = [v7 collaborationMetadata];
  [v10 setCollaborationMetadata:v15];

  [v9 setMetadata:v10];
  unint64_t v16 = [v9 dataRepresentationWithOutOfLineAttachments:0];

  [v7 setData:v16];
  uint64_t v17 = [[CKComposition alloc] initWithText:0 subject:0 shelfPluginPayload:v7 shelfMediaObject:0];
  uint64_t v18 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v17;

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __69__CKComposition_compositionWithShelfPluginPayload_completionHandler___block_invoke_2;
  v22[3] = &unk_1E5626AD0;
  id v20 = *(id *)(a1 + 48);
  uint64_t v21 = *(void *)(a1 + 64);
  id v23 = v20;
  uint64_t v24 = v21;
  dispatch_async(MEMORY[0x1E4F14428], v22);
}

uint64_t __69__CKComposition_compositionWithShelfPluginPayload_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), 0);
}

void __69__CKComposition_compositionWithShelfPluginPayload_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 length];
  int v8 = IMOSLoggingEnabled();
  if (v7)
  {
    if (v8)
    {
      id v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v21 = 138412290;
        id v22 = v5;
        _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Obtaining app name and icon for 3rd party collaboration using bundle ID: %@", (uint8_t *)&v21, 0xCu);
      }
    }
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v5 allowPlaceholder:1 error:0];
    uint64_t v11 = [v10 localizedName];
    [*(id *)(a1 + 32) setSubtitle:v11];

    dispatch_time_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F6F248]) initWithBundleIdentifier:v5];
    id v13 = objc_alloc(MEMORY[0x1E4F6F258]);
    uint64_t v14 = +[CKUIBehavior sharedBehaviors];
    [v14 thumbnailSizeForAppIconInCollaborationLinks];
    uint64_t v15 = objc_msgSend(v13, "initWithSize:scale:");

    unint64_t v16 = [v12 prepareImageForDescriptor:v15];
    id v17 = objc_alloc(MEMORY[0x1E4F30A38]);
    uint64_t v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42A80]), "initWithCGImage:", objc_msgSend(v16, "CGImage"));
    uint64_t v19 = (void *)[v17 initWithPlatformImage:v18];
    [*(id *)(a1 + 32) setIcon:v19];
  }
  else if (v8)
  {
    id v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      int v21 = 138412290;
      id v22 = v6;
      _os_log_impl(&dword_18EF18000, v20, OS_LOG_TYPE_INFO, "Failed to obtain app name and icon for 3rd party collaboration. Error from bundle ID lookup: %@", (uint8_t *)&v21, 0xCu);
    }
  }
  [*(id *)(a1 + 40) setSpecialization:*(void *)(a1 + 32)];
  [*(id *)(a1 + 48) stopTimingForKey:@"IMPayloadCollaborationTypePendingCollaboration"];
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
}

void __69__CKComposition_compositionWithShelfPluginPayload_completionHandler___block_invoke_207(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) url];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69__CKComposition_compositionWithShelfPluginPayload_completionHandler___block_invoke_2_208;
  v4[3] = &unk_1E562C918;
  char v9 = *(unsigned char *)(a1 + 72);
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  id v8 = *(id *)(a1 + 64);
  [v2 startFetchingMetadataForURL:v3 completionHandler:v4];
}

void __69__CKComposition_compositionWithShelfPluginPayload_completionHandler___block_invoke_2_208(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (*(unsigned char *)(a1 + 64))
  {
    id v7 = [*(id *)(a1 + 32) url];
    [v7 stopAccessingSecurityScopedResource];
  }
  id v8 = objc_alloc_init(+[CKComposition _LPSharedObjectMetadataClass]);
  if (v8)
  {
    char v9 = [v5 specialization];
    [v8 setSpecialization:v9];

    objc_msgSend(v8, "setIsCollaboration:", objc_msgSend(*(id *)(a1 + 32), "sendAsCopy") ^ 1);
    [v5 setSpecialization:v8];
  }
  else
  {
    [v5 setCollaborationType:2];
    id v10 = [*(id *)(a1 + 40) metadata];
    uint64_t v11 = [v10 specialization];
    [v5 setSpecialization:v11];
  }
  [*(id *)(a1 + 48) stopTimingForKey:@"startFetchingMetadataForURL"];
  if (IMOSLoggingEnabled())
  {
    dispatch_time_t v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "Finished startFetchingMetadataForURL", v13, 2u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

+ (id)_compositionWithShelfPluginPayload:(id)a3
{
  id v3 = a3;
  if ([v3 supportsCollaboration])
  {
    uint64_t v4 = 0;
    goto LABEL_19;
  }
  id v5 = objc_msgSend(v3, "__ck_urlFromTextBodyForRichLink");
  if ([v3 shouldSendAsMediaObject])
  {
    id v6 = (id)[v3 mediaObjectFromPayload];
    id v7 = [CKComposition alloc];
    id v8 = 0;
    id v9 = v3;
  }
  else
  {
    if (([v3 shouldSendAsRichLink] & 1) != 0 || v5)
    {
      if (!v5)
      {
        id v5 = [v3 url];
      }
      id v13 = (void *)[v3 copy];
      uint64_t v14 = [NSString stringGUID];
      [v13 setMessageGUID:v14];

      uint64_t v15 = [v5 absoluteString];
      if ([v15 length])
      {
        id v16 = objc_alloc(MEMORY[0x1E4F28B18]);
        id v17 = [v5 absoluteString];
        uint64_t v18 = (void *)[v16 initWithString:v17];
        [v13 setText:v18];
      }
      else
      {
        [v13 setText:0];
      }

      [v13 setPluginBundleID:*MEMORY[0x1E4F6CC10]];
      [v13 setUrl:v5];
      uint64_t v4 = [[CKComposition alloc] initWithText:0 subject:0 shelfPluginPayload:v13];

      goto LABEL_18;
    }
    int v11 = [v3 shouldSendAsText];
    dispatch_time_t v12 = [CKComposition alloc];
    id v5 = [v3 text];
    id v7 = v12;
    id v8 = v5;
    if (!v11)
    {
      uint64_t v10 = [(CKComposition *)v12 initWithText:v5 subject:0 shelfPluginPayload:v3 shelfMediaObject:0];
      goto LABEL_6;
    }
    id v9 = 0;
  }
  uint64_t v10 = [(CKComposition *)v7 initWithText:v8 subject:0 shelfPluginPayload:v9];
LABEL_6:
  uint64_t v4 = (CKComposition *)v10;
LABEL_18:

LABEL_19:

  return v4;
}

+ (CKComposition)compositionWithText:(id)a3 subject:(id)a4 shelfPluginPayload:(id)a5 completionHandler:(id)a6
{
  id v9 = a6;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  int v21 = __Block_byref_object_copy__78;
  id v22 = __Block_byref_object_dispose__78;
  uint64_t v23 = 0;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [[CKComposition alloc] initWithText:v12 subject:v11 shelfPluginPayload:v10];

  uint64_t v23 = v13;
  if (v19[5])
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __82__CKComposition_compositionWithText_subject_shelfPluginPayload_completionHandler___block_invoke;
    v15[3] = &unk_1E5626AD0;
    id v16 = v9;
    id v17 = &v18;
    dispatch_async(MEMORY[0x1E4F14428], v15);
  }
  _Block_object_dispose(&v18, 8);

  return result;
}

uint64_t __82__CKComposition_compositionWithText_subject_shelfPluginPayload_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), 0);
}

+ (CKComposition)compositionWithMSMessage:(id)a3 appExtensionIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F22458] pluginKitProxyForIdentifier:v6];
  uint64_t v8 = [v7 teamID];
  id v9 = (void *)v8;
  id v10 = @"0000000000";
  if (v8) {
    id v10 = (__CFString *)v8;
  }
  id v11 = v10;

  uint64_t v12 = [v7 bundleIdentifier];
  id v13 = (void *)v12;
  if (v12) {
    uint64_t v14 = (void *)v12;
  }
  else {
    uint64_t v14 = v6;
  }
  id v15 = v14;

  uint64_t v16 = *MEMORY[0x1E4F6CBE8];
  id v17 = [(id)*MEMORY[0x1E4F6CBE8] stringByAppendingFormat:@":%@:%@", v11, v15];

  uint64_t v18 = [MEMORY[0x1E4F6BC18] sharedInstance];
  uint64_t v19 = [v18 balloonPluginForBundleID:v17];

  uint64_t v20 = [v19 identifier];
  LODWORD(v16) = [v20 isEqualToString:v16];

  if (v16)
  {
    id v21 = objc_alloc(MEMORY[0x1E4F6BBF8]);
    id v22 = [v19 pluginBundle];
    uint64_t v23 = [v21 initWithPluginBundle:v22 pluginKitProxy:v7 extension:0];

    uint64_t v19 = (void *)v23;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v24 = [v19 adamID];
    uint64_t v25 = [v19 browserDisplayName];
    char v26 = (void *)[v19 dataSourceClass];
    uint64_t v27 = objc_msgSend(v19, "__ck_statusJPEGImageDataForTransportWithCompressionFactor:", 0.2);
    int v28 = [v26 pluginPayloadFromMessagePayload:v5 appIconData:v27 appName:v25 adamID:v24 allowDataPayloads:0];

    [v28 setIsFromMe:1];
    id v29 = [v19 identifier];
    [v28 setPluginBundleID:v29];

    char v30 = +[CKComposition _compositionWithShelfPluginPayload:v28];
  }
  else
  {
    char v30 = 0;
  }

  return (CKComposition *)v30;
}

- (CKComposition)initWithText:(id)a3 subject:(id)a4 shelfPluginPayload:(id)a5 bizIntent:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = (CKComposition *)[objc_alloc((Class)objc_opt_class()) initWithText:v13 subject:v12 shelfPluginPayload:v11 bizIntent:v10 shelfMediaObject:0 proofreadingInfo:0];

  return v14;
}

- (CKComposition)initWithText:(id)a3 subject:(id)a4 shelfPluginPayload:(id)a5 bizIntent:(id)a6 shelfMediaObject:(id)a7 proofreadingInfo:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v30.receiver = self;
  v30.super_class = (Class)CKComposition;
  uint64_t v20 = [(CKComposition *)&v30 init];
  if (v20)
  {
    if ([v14 length]) {
      id v21 = v14;
    }
    else {
      id v21 = 0;
    }
    [(CKComposition *)v20 setText:v21];
    if ([v15 length]) {
      id v22 = v15;
    }
    else {
      id v22 = 0;
    }
    [(CKComposition *)v20 setSubject:v22];
    [(CKComposition *)v20 setShelfPluginPayload:v16];
    uint64_t v23 = (void *)[v17 copy];
    if ([v23 count])
    {
      uint64_t v24 = (void *)[v17 copy];
      [(CKComposition *)v20 setBizIntent:v24];
    }
    else
    {
      [(CKComposition *)v20 setBizIntent:0];
    }

    [(CKComposition *)v20 setShelfMediaObject:v18];
    [(CKComposition *)v20 setProofreadingInfo:v19];
    if (v16)
    {
      uint64_t v25 = [v16 collaborationMetadata];
      char v26 = [v25 userSelectedShareOptions];

      if (v26
        || ([v16 collaborationMetadata],
            uint64_t v27 = objc_claimAutoreleasedReturnValue(),
            [v27 defaultShareOptions],
            char v26 = objc_claimAutoreleasedReturnValue(),
            v27,
            v26))
      {
        [(CKComposition *)v20 setCollaborationShareOptions:v26];
        int v28 = [v26 optionsGroups];
        [(CKComposition *)v20 setCollaborationOptions:v28];
      }
    }
  }

  return v20;
}

- (CKComposition)initWithText:(id)a3 subject:(id)a4 shelfPluginPayload:(id)a5
{
  return [(CKComposition *)self initWithText:a3 subject:a4 shelfPluginPayload:a5 bizIntent:0];
}

- (CKComposition)initWithText:(id)a3 subject:(id)a4 shelfPluginPayload:(id)a5 shelfMediaObject:(id)a6
{
  return [(CKComposition *)self initWithText:a3 subject:a4 shelfPluginPayload:a5 bizIntent:0 shelfMediaObject:a6 proofreadingInfo:0];
}

- (CKComposition)initWithText:(id)a3 subject:(id)a4
{
  return [(CKComposition *)self initWithText:a3 subject:a4 shelfPluginPayload:0 bizIntent:0];
}

- (BOOL)hasContent
{
  id v3 = [(CKComposition *)self text];
  if ([v3 length])
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = [(CKComposition *)self subject];
    if (v5)
    {
      BOOL v4 = 1;
    }
    else
    {
      id v6 = [(CKComposition *)self shelfPluginPayload];
      BOOL v4 = v6 != 0;
    }
  }

  return v4;
}

- (IMPluginPayload)firstEmbeddedPluginPayload
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__78;
  id v11 = __Block_byref_object_dispose__78;
  id v12 = 0;
  id v2 = [(CKComposition *)self text];
  uint64_t v3 = [v2 length];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__CKComposition_firstEmbeddedPluginPayload__block_invoke;
  v6[3] = &unk_1E562C940;
  void v6[4] = &v7;
  objc_msgSend(v2, "enumerateAttribute:inRange:options:usingBlock:", @"EmbeddedRichLinkConfiguration", 0, v3, 0, v6);
  id v4 = (id)v8[5];

  _Block_object_dispose(&v7, 8);

  return (IMPluginPayload *)v4;
}

void __43__CKComposition_firstEmbeddedPluginPayload__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  if (a2)
  {
    uint64_t v7 = [a2 pluginPayload];
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    *a5 = 1;
  }
}

- (BOOL)_compositionTextBeginsWithEmbeddedPluginAttachment
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  id v2 = [(CKComposition *)self text];
  uint64_t v3 = [v2 length];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__CKComposition__compositionTextBeginsWithEmbeddedPluginAttachment__block_invoke;
  v6[3] = &unk_1E5625DC0;
  void v6[4] = &v7;
  objc_msgSend(v2, "enumerateAttributesInRange:options:usingBlock:", 0, v3, 0, v6);
  char v4 = *((unsigned char *)v8 + 24);

  _Block_object_dispose(&v7, 8);
  return v4;
}

void __67__CKComposition__compositionTextBeginsWithEmbeddedPluginAttachment__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t v7 = [a2 objectForKeyedSubscript:@"EmbeddedRichLinkConfiguration"];
  if (v7) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  *a5 = 1;
}

- (BOOL)hasNonwhiteSpaceContent
{
  if ([(CKComposition *)self hasContent])
  {
    uint64_t v3 = [(CKComposition *)self text];
    char v4 = [v3 string];
    id v5 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    int v6 = objc_msgSend(v4, "__ck_containsOnlyCharactersFromSet:", v5) ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (id)compositionByReplacingText:(id)a3
{
  id v4 = a3;
  [(CKComposition *)self isExpirableComposition];
  id v5 = objc_alloc((Class)objc_opt_class());
  int v6 = [(CKComposition *)self subject];
  uint64_t v7 = [(CKComposition *)self shelfPluginPayload];
  uint64_t v8 = [(CKComposition *)self bizIntent];
  uint64_t v9 = [(CKComposition *)self shelfMediaObject];
  char v10 = [(CKComposition *)self proofreadingInfo];
  id v11 = (void *)[v5 initWithText:v4 subject:v6 shelfPluginPayload:v7 bizIntent:v8 shelfMediaObject:v9 proofreadingInfo:v10];

  id v12 = [(CKComposition *)self expressiveSendStyleID];
  [v11 setExpressiveSendStyleID:v12];

  objc_msgSend(v11, "setShouldHideClearPluginButton:", -[CKComposition shouldHideClearPluginButton](self, "shouldHideClearPluginButton"));
  id v13 = [(CKComposition *)self sendLaterPluginInfo];
  [v11 setSendLaterPluginInfo:v13];

  return v11;
}

- (id)compositionByAppendingText:(id)a3
{
  return [(CKComposition *)self _compositionByAppendingText:a3 isExpirable:0 shelfPluginPayload:0 shelfMediaObject:0 addingNewLineIfNedded:1];
}

- (id)compositionByAppendingText:(id)a3 addingNewLineIfNedded:(BOOL)a4
{
  return [(CKComposition *)self _compositionByAppendingText:a3 isExpirable:0 shelfPluginPayload:0 shelfMediaObject:0 addingNewLineIfNedded:a4];
}

- (id)compositionByAppendingComposition:(id)a3
{
  id v4 = a3;
  id v5 = [v4 subject];
  int v6 = -[CKComposition _compositionByAppendingText:isExpirable:shelfPluginPayload:shelfMediaObject:addingNewLineIfNedded:](self, "_compositionByAppendingText:isExpirable:shelfPluginPayload:shelfMediaObject:addingNewLineIfNedded:", v5, [v4 isExpirableComposition], 0, 0, 1);
  uint64_t v7 = [v4 text];
  uint64_t v8 = [v4 isExpirableComposition];
  uint64_t v9 = [v4 shelfPluginPayload];
  char v10 = [v4 shelfMediaObject];

  id v11 = [v6 _compositionByAppendingText:v7 isExpirable:v8 shelfPluginPayload:v9 shelfMediaObject:v10 addingNewLineIfNedded:1];

  return v11;
}

+ (CKComposition)compositionWithShelfMediaObject:(id)a3
{
  id v3 = a3;
  id v4 = [[CKComposition alloc] initWithText:0 subject:0 shelfPluginPayload:0 bizIntent:0 shelfMediaObject:v3 proofreadingInfo:0];

  return v4;
}

+ (id)compositionForTUConversationActivity:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F30A78]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F30AC0]);
  int v6 = [v3 concatenatedMetadataDescription];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    uint64_t v8 = [v3 concatenatedMetadataDescription];
    [v5 setTitle:v8];
  }
  uint64_t v9 = [v3 bundleIdentifier];
  [v5 setApplicationBundleIdentifier:v9];

  char v10 = [v3 localizedApplicationName];
  if (v10)
  {
    [v5 setApplication:v10];
  }
  else
  {
    id v11 = [v3 fallbackApplicationName];
    [v5 setApplication:v11];
  }
  id v12 = [v3 metadata];
  id v13 = [v12 imageData];

  if (v13)
  {
    id v14 = (void *)MEMORY[0x1E4F42A80];
    id v15 = [v3 metadata];
    id v16 = [v15 imageData];
    id v17 = [v14 imageWithData:v16];

    if (v17)
    {
      id v18 = (void *)[objc_alloc(MEMORY[0x1E4F30A38]) initWithPlatformImage:v17];
      [v5 setIcon:v18];
    }
  }
  [v4 setSpecialization:v5];
  id v19 = objc_alloc_init(MEMORY[0x1E4F30AA8]);
  [v19 setMetadata:v4];
  uint64_t v20 = [v19 dataRepresentationWithOutOfLineAttachments:0];
  id v21 = objc_alloc_init(CKBrowserItemPayload);
  id v22 = [NSString stringGUID];
  [(CKBrowserItemPayload *)v21 setMessageGUID:v22];

  [(CKBrowserItemPayload *)v21 setPluginBundleID:*MEMORY[0x1E4F6CC10]];
  [(CKBrowserItemPayload *)v21 setData:v20];
  uint64_t v23 = [[CKComposition alloc] initWithText:0 subject:0 shelfPluginPayload:v21];
  uint64_t v24 = [(CKComposition *)v23 shelfPluginPayload];
  [v24 setGroupActivity:v3];

  return v23;
}

- (BOOL)isSendAnimated
{
  id v3 = [(CKComposition *)self shelfPluginPayload];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [(CKComposition *)self shelfPluginPayload];
  }
  else
  {
    id v4 = 0;
  }

  char v5 = [v4 useDirectSend] ^ 1;
  return v5;
}

- (BOOL)isSaveable
{
  return 1;
}

- (Class)balloonViewClass
{
  id v3 = [(CKComposition *)self mediaObjects];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    char v5 = [(CKComposition *)self mediaObjects];
    int v6 = [v5 lastObject];

    switch([v6 mediaType])
    {
      case 1u:
      case 4u:
      case 5u:
      case 6u:
      case 7u:
      case 8u:
      case 9u:
      case 0xAu:
      case 0xBu:
        goto LABEL_29;
      case 2u:
      case 3u:
        id v16 = [MEMORY[0x1E4F6E6D0] sharedManager];
        int v17 = [v16 isFeatureEnabled];

        if (v17 && ([v6 commSafetySensitive] != 1 || objc_msgSend(v6, "isFromMe"))) {
          [v6 commSafetySensitive];
        }
        goto LABEL_29;
      default:

        goto LABEL_24;
    }
  }
  uint64_t v7 = [(CKComposition *)self pluginDisplayContainers];
  uint64_t v8 = [v7 count];

  if (v8) {
    goto LABEL_4;
  }
  char v10 = [(CKComposition *)self text];
  uint64_t v11 = [v10 length];

  if (v11)
  {
    id v12 = [(CKComposition *)self subject];
    uint64_t v13 = [v12 length];

    if (v13
      || ([(CKComposition *)self text],
          id v14 = objc_claimAutoreleasedReturnValue(),
          uint64_t v15 = objc_msgSend(v14, "__ck_bigEmojiStyle"),
          v14,
          (unint64_t)(v15 - 1) > 2))
    {
      [(CKComposition *)self _compositionTextBeginsWithEmbeddedPluginAttachment];
    }
LABEL_4:
    uint64_t v9 = objc_opt_class();
    goto LABEL_30;
  }
  id v18 = [(CKComposition *)self shelfPluginPayload];
  if (!v18)
  {
LABEL_24:
    uint64_t v9 = 0;
    goto LABEL_30;
  }
  int v6 = v18;
  id v19 = [v18 pluginBundleID];
  if ([v19 isEqualToString:*MEMORY[0x1E4F6CBF8]]) {
    goto LABEL_18;
  }
  uint64_t v20 = [v6 pluginBundleID];
  id v21 = IMBalloonExtensionIDWithSuffix();
  if ([v20 isEqualToString:v21])
  {

LABEL_18:
    goto LABEL_19;
  }
  uint64_t v27 = [v6 mediaObjectFromPayload];

  if (!v27) {
    goto LABEL_29;
  }
LABEL_19:
  id v22 = [MEMORY[0x1E4F6E6D0] sharedManager];
  int v23 = [v22 isFeatureEnabled];

  if (v23)
  {
    uint64_t v24 = [v6 mediaObjectFromPayload];
    if ([v24 commSafetySensitive] == 1)
    {
      uint64_t v25 = [v6 mediaObjectFromPayload];
      int v26 = [v25 isFromMe];

      if (!v26) {
        goto LABEL_29;
      }
    }
    else
    {
    }
    int v28 = [v6 mediaObjectFromPayload];
    [v28 commSafetySensitive];
  }
LABEL_29:
  uint64_t v9 = objc_opt_class();

LABEL_30:

  return (Class)v9;
}

- (NSAttributedString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (NSAttributedString)subject
{
  return self->_subject;
}

- (void)setSubject:(id)a3
{
}

- (IMPluginPayload)shelfPluginPayload
{
  return self->_shelfPluginPayload;
}

- (void)setShelfPluginPayload:(id)a3
{
}

- (NSString)expressiveSendStyleID
{
  return self->_expressiveSendStyleID;
}

- (void)setExpressiveSendStyleID:(id)a3
{
}

- (NSDictionary)bizIntent
{
  return self->_bizIntent;
}

- (void)setBizIntent:(id)a3
{
}

- (CKMediaObject)shelfMediaObject
{
  return self->_shelfMediaObject;
}

- (void)setShelfMediaObject:(id)a3
{
}

- (_SWCollaborationShareOptions)collaborationShareOptions
{
  return self->_collaborationShareOptions;
}

- (void)setCollaborationShareOptions:(id)a3
{
}

- (NSArray)collaborationOptions
{
  return self->_collaborationOptions;
}

- (void)setCollaborationOptions:(id)a3
{
}

- (NSString)sourceApplicationID
{
  return self->_sourceApplicationID;
}

- (void)setSourceApplicationID:(id)a3
{
}

- (NSString)firstMessageGUIDOverride
{
  return self->_firstMessageGUIDOverride;
}

- (void)setFirstMessageGUIDOverride:(id)a3
{
}

- (NSDictionary)proofreadingInfo
{
  return self->_proofreadingInfo;
}

- (void)setProofreadingInfo:(id)a3
{
}

- (BOOL)shouldHideClearPluginButton
{
  return self->_shouldHideClearPluginButton;
}

- (void)setShouldHideClearPluginButton:(BOOL)a3
{
  self->_shouldHideClearPluginButton = a3;
}

- (TUConversationActivity)groupActivity
{
  return self->_groupActivity;
}

- (void)setGroupActivity:(id)a3
{
}

- (BOOL)hasFailedCommSafetyCheck
{
  return self->_hasFailedCommSafetyCheck;
}

- (void)setHasFailedCommSafetyCheck:(BOOL)a3
{
  self->_hasFailedCommSafetyCheck = a3;
}

- (BOOL)hasCheckedCommSafety
{
  return self->_hasCheckedCommSafety;
}

- (void)setHasCheckedCommSafety:(BOOL)a3
{
  self->_hasCheckedCommSafety = a3;
}

- (CKSendLaterPluginInfo)sendLaterPluginInfo
{
  return self->_sendLaterPluginInfo;
}

- (void)setSendLaterPluginInfo:(id)a3
{
}

- (BOOL)isFromExternalSource
{
  return self->_isFromExternalSource;
}

- (void)setIsFromExternalSource:(BOOL)a3
{
  self->_isFromExternalSource = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendLaterPluginInfo, 0);
  objc_storeStrong((id *)&self->_groupActivity, 0);
  objc_storeStrong((id *)&self->_proofreadingInfo, 0);
  objc_storeStrong((id *)&self->_firstMessageGUIDOverride, 0);
  objc_storeStrong((id *)&self->_sourceApplicationID, 0);
  objc_storeStrong((id *)&self->_collaborationOptions, 0);
  objc_storeStrong((id *)&self->_collaborationShareOptions, 0);
  objc_storeStrong((id *)&self->_shelfMediaObject, 0);
  objc_storeStrong((id *)&self->_bizIntent, 0);
  objc_storeStrong((id *)&self->_expressiveSendStyleID, 0);
  objc_storeStrong((id *)&self->_shelfPluginPayload, 0);
  objc_storeStrong((id *)&self->_subject, 0);

  objc_storeStrong((id *)&self->_text, 0);
}

+ (CKComposition)compositionWithPluginDisplayContainer:(id)a3 subject:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    id v12 = @"PluginDisplayContainer";
    v13[0] = v5;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    id v8 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v9 = (void *)[v8 initWithString:*MEMORY[0x1E4F6C110] attributes:v7];
  }
  else
  {
    uint64_t v9 = 0;
  }
  char v10 = [[CKComposition alloc] initWithText:v9 subject:v6];

  return v10;
}

- (id)compositionByAppendingPluginDisplayContainer:(id)a3
{
  uint64_t v4 = +[CKComposition compositionWithPluginDisplayContainer:a3 subject:0];
  id v5 = [(CKComposition *)self compositionByAppendingComposition:v4];

  return v5;
}

+ (CKComposition)compositionWithMediaObject:(id)a3 subject:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v17 = @"AdaptiveImageGlyphMediaObject";
    v18[0] = v5;
    uint64_t v7 = (void *)MEMORY[0x1E4F1C9E8];
    id v8 = (id *)v18;
    uint64_t v9 = &v17;
LABEL_5:
    char v10 = [v7 dictionaryWithObjects:v8 forKeys:v9 count:1];
    id v11 = objc_alloc(MEMORY[0x1E4F28B18]);
    id v12 = (void *)[v11 initWithString:*MEMORY[0x1E4F6C110] attributes:v10];

    goto LABEL_6;
  }
  if (v5)
  {
    uint64_t v15 = @"MediaObjectForTextAttachment";
    id v16 = v5;
    uint64_t v7 = (void *)MEMORY[0x1E4F1C9E8];
    id v8 = &v16;
    uint64_t v9 = &v15;
    goto LABEL_5;
  }
  id v12 = 0;
LABEL_6:
  uint64_t v13 = [[CKComposition alloc] initWithText:v12 subject:v6];

  return v13;
}

+ (CKComposition)compositionWithMediaObjects:(id)a3 subject:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [[CKComposition alloc] initWithText:0 subject:v5];

  id v8 = [(CKComposition *)v7 compositionByAppendingMediaObjects:v6];

  return (CKComposition *)v8;
}

- (id)compositionByAppendingMediaObject:(id)a3
{
  uint64_t v4 = +[CKComposition compositionWithMediaObject:a3 subject:0];
  id v5 = [(CKComposition *)self compositionByAppendingComposition:v4];

  return v5;
}

- (id)compositionByAppendingMediaObjects:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      char v10 = v5;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        id v5 = [(CKComposition *)v10 compositionByAppendingMediaObject:*(void *)(*((void *)&v12 + 1) + 8 * v9)];

        ++v9;
        char v10 = v5;
      }
      while (v7 != v9);
      uint64_t v7 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v5;
}

- (id)compositionByReplacingMediaObject:(id)a3 withMediaObject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(CKComposition *)self text];
  uint64_t v9 = [v8 length];
  char v10 = (void *)[v8 mutableCopy];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __82__CKComposition_CKMediaObject__compositionByReplacingMediaObject_withMediaObject___block_invoke;
  v29[3] = &unk_1E562C968;
  id v11 = v6;
  id v30 = v11;
  id v12 = v10;
  id v31 = v12;
  id v13 = v7;
  id v32 = v13;
  objc_msgSend(v8, "enumerateAttribute:inRange:options:usingBlock:", @"MediaObjectForTextAttachment", 0, v9, 0, v29);
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  uint64_t v24 = __82__CKComposition_CKMediaObject__compositionByReplacingMediaObject_withMediaObject___block_invoke_2;
  uint64_t v25 = &unk_1E562C990;
  id v26 = v11;
  id v27 = v12;
  id v28 = v13;
  id v14 = v13;
  id v15 = v12;
  id v16 = v11;
  objc_msgSend(v8, "enumerateAttribute:inRange:options:usingBlock:", @"AdaptiveImageGlyphMediaObject", 0, v9, 0, &v22);
  uint64_t v17 = [CKComposition alloc];
  id v18 = [(CKComposition *)self subject];
  id v19 = [(CKComposition *)self shelfPluginPayload];
  uint64_t v20 = [(CKComposition *)v17 initWithText:v15 subject:v18 shelfPluginPayload:v19];

  return v20;
}

uint64_t __82__CKComposition_CKMediaObject__compositionByReplacingMediaObject_withMediaObject___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (*(void *)(result + 32) == a2) {
    return objc_msgSend(*(id *)(result + 40), "addAttribute:value:range:", @"MediaObjectForTextAttachment", *(void *)(result + 48), a3, a4);
  }
  return result;
}

uint64_t __82__CKComposition_CKMediaObject__compositionByReplacingMediaObject_withMediaObject___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (*(void *)(result + 32) == a2) {
    return objc_msgSend(*(id *)(result + 40), "addAttribute:value:range:", @"AdaptiveImageGlyphMediaObject", *(void *)(result + 48), a3, a4);
  }
  return result;
}

- (id)compositionByRemovingMediaObjects:(id)a3
{
  id v4 = a3;
  id v5 = [(CKComposition *)self text];
  id v6 = (void *)[v5 mutableCopy];
  uint64_t v7 = [v5 length];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __66__CKComposition_CKMediaObject__compositionByRemovingMediaObjects___block_invoke;
  id v18 = &unk_1E562C9B8;
  id v19 = v4;
  id v20 = v6;
  id v8 = v6;
  id v9 = v4;
  objc_msgSend(v5, "enumerateAttribute:inRange:options:usingBlock:", @"MediaObjectForTextAttachment", 0, v7, 2, &v15);
  char v10 = [CKComposition alloc];
  id v11 = [(CKComposition *)self subject];
  id v12 = [(CKComposition *)self shelfPluginPayload];
  id v13 = [(CKComposition *)v10 initWithText:v8 subject:v11 shelfPluginPayload:v12];

  return v13;
}

uint64_t __66__CKComposition_CKMediaObject__compositionByRemovingMediaObjects___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = [*(id *)(a1 + 32) containsObject:a2];
  if (result)
  {
    objc_msgSend(*(id *)(a1 + 40), "removeAttribute:range:", @"MediaObjectForTextAttachment", a3, a4);
    if (a3
      && ([*(id *)(a1 + 40) string],
          id v8 = objc_claimAutoreleasedReturnValue(),
          int v9 = [v8 characterAtIndex:a3 - 1],
          v8,
          v9 == 10))
    {
      char v10 = *(void **)(a1 + 40);
      uint64_t v11 = a4 + 1;
      uint64_t v12 = a3 - 1;
    }
    else
    {
      char v10 = *(void **)(a1 + 40);
      uint64_t v12 = a3;
      uint64_t v11 = a4;
    }
    return objc_msgSend(v10, "deleteCharactersInRange:", v12, v11);
  }
  return result;
}

- (NSArray)mediaObjects
{
  id v2 = [(CKComposition *)self text];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = [v2 length];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __44__CKComposition_CKMediaObject__mediaObjects__block_invoke;
  v14[3] = &unk_1E562C9E0;
  id v5 = v3;
  id v15 = v5;
  objc_msgSend(v2, "enumerateAttribute:inRange:options:usingBlock:", @"MediaObjectForTextAttachment", 0, v4, 0, v14);
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __44__CKComposition_CKMediaObject__mediaObjects__block_invoke_2;
  uint64_t v12 = &unk_1E562CA08;
  id v13 = v5;
  id v6 = v5;
  objc_msgSend(v2, "enumerateAttribute:inRange:options:usingBlock:", @"AdaptiveImageGlyphMediaObject", 0, v4, 0, &v9);
  uint64_t v7 = objc_msgSend(v6, "copy", v9, v10, v11, v12);

  return (NSArray *)v7;
}

uint64_t __44__CKComposition_CKMediaObject__mediaObjects__block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) addObject:a2];
  }
  return result;
}

uint64_t __44__CKComposition_CKMediaObject__mediaObjects__block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) addObject:a2];
  }
  return result;
}

- (NSArray)pluginDisplayContainers
{
  id v2 = [(CKComposition *)self text];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = [v2 length];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__CKComposition_CKMediaObject__pluginDisplayContainers__block_invoke;
  v7[3] = &unk_1E5624860;
  id v5 = v3;
  id v8 = v5;
  objc_msgSend(v2, "enumerateAttribute:inRange:options:usingBlock:", @"PluginDisplayContainer", 0, v4, 0, v7);

  return (NSArray *)v5;
}

void __55__CKComposition_CKMediaObject__pluginDisplayContainers__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [*(id *)(a1 + 32) addObject:v3];
    }
  }
}

- (BOOL)isTextOnly
{
  id v2 = [(CKComposition *)self text];
  if (([v2 containsAttribute:@"MediaObjectForTextAttachment"] & 1) != 0
    || ([v2 containsAttribute:@"PluginDisplayContainer"] & 1) != 0)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    int v3 = [v2 containsAttribute:@"AdaptiveImageGlyphMediaObject"] ^ 1;
  }

  return v3;
}

- (unint64_t)mediaObjectsFileSize
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v2 = [(CKComposition *)self mediaObjects];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v18;
    *(void *)&long long v4 = 138412546;
    long long v16 = v4;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v9 = objc_msgSend(v8, "fileURL", v16);
        uint64_t v10 = [v9 absoluteString];
        int v11 = IMFileSizeForItemAtPath();
        id v12 = 0;

        if (!v11)
        {
          id v13 = IMLogHandleForCategory();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            id v14 = [v8 fileURL];
            *(_DWORD *)long long buf = v16;
            uint64_t v22 = v14;
            __int16 v23 = 2112;
            id v24 = v12;
            _os_log_error_impl(&dword_18EF18000, v13, OS_LOG_TYPE_ERROR, "Unable to get file size for file at path: %@, error: %@", buf, 0x16u);
          }
        }
      }
      uint64_t v5 = [v2 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v5);
  }

  return 0;
}

+ (id)expirableCompositionWithMediaObject:(id)a3
{
  return +[_CKExpirableComposition compositionWithMediaObject:a3 subject:0];
}

+ (id)newExpirableCompositionWithText:(id)a3 subject:(id)a4 shelfPluginPayload:(id)a5
{
  return +[_CKExpirableComposition newCompositionWithText:a3 subject:a4 shelfPluginPayload:a5];
}

- (BOOL)isExpirableComposition
{
  return objc_opt_isKindOfClass() & 1;
}

+ (id)audioCompositionWithMediaObject:(id)a3
{
  return +[_CKAudioComposition compositionWithMediaObject:a3 subject:0];
}

+ (id)quickImageCompositionWithMediaObject:(id)a3
{
  return +[_CKQuickImageComposition compositionWithMediaObject:a3 subject:0];
}

+ (id)photoPickerCompositionWithMediaObject:(id)a3
{
  return +[_CKQuickSendMediaComposition compositionWithMediaObject:a3 subject:0];
}

+ (id)photoPickerCompositionWithMediaObjects:(id)a3
{
  return +[_CKQuickSendMediaComposition compositionWithMediaObjects:a3 subject:0];
}

+ (id)stickerCompositionWithMediaObjects:(id)a3
{
  return +[_CKQuickSendMediaComposition compositionWithMediaObjects:a3 subject:0];
}

- (id)externalSourceComposition
{
  uint64_t v3 = [_CKExternalAudioComposition alloc];
  long long v4 = [(CKComposition *)self text];
  uint64_t v5 = [(CKComposition *)self subject];
  uint64_t v6 = [(CKComposition *)v3 initWithText:v4 subject:v5];

  return v6;
}

- (id)superFormatSubject
{
  id v2 = [(CKComposition *)self subject];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F28B18]);
    long long v4 = [v2 string];
    uint64_t v5 = (void *)[v3 initWithString:v4];

    uint64_t v6 = objc_msgSend(v5, "__im_attributedStringByAssigningMessagePartNumbers");
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)_attributedStringByTrimmingWhiteSpaceAroundAttachmentsInText:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  char v15 = 1;
  uint64_t v5 = [v3 length];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __93__CKComposition_IMSuperFormat___attributedStringByTrimmingWhiteSpaceAroundAttachmentsInText___block_invoke;
  v10[3] = &unk_1E562CA30;
  id v6 = v3;
  id v11 = v6;
  id v13 = v14;
  id v7 = v4;
  id v12 = v7;
  objc_msgSend(v6, "enumerateAttribute:inRange:options:usingBlock:", @"MediaObjectForTextAttachment", 0, v5, 0, v10);
  id v8 = (void *)[v7 copy];

  _Block_object_dispose(v14, 8);

  return v8;
}

void __93__CKComposition_IMSuperFormat___attributedStringByTrimmingWhiteSpaceAroundAttachmentsInText___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v8 = [*(id *)(a1 + 32) length];
  BOOL v10 = v8 - 1 >= a3 && v8 - 1 - a3 < a4;
  if (!a2)
  {
    id v11 = [*(id *)(a1 + 32) string];
    id v12 = objc_msgSend(v11, "substringWithRange:", a3, a4);

    id v13 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    if (objc_msgSend(v12, "__ck_containsOnlyCharactersFromSet:", v13))
    {
      int v14 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);

      if (!v14)
      {
        a4 = 0;
        a3 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_18:

        goto LABEL_19;
      }
    }
    else
    {
    }
    char v15 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
      && [v12 rangeOfCharacterFromSet:v15 options:8] != 0x7FFFFFFFFFFFFFFFLL)
    {
      ++a3;
      --a4;
    }
    if (!v10) {
      a4 -= [v12 rangeOfCharacterFromSet:v15 options:12] != 0x7FFFFFFFFFFFFFFFLL;
    }

    goto LABEL_18;
  }
LABEL_19:
  if (a4)
  {
    long long v16 = objc_msgSend(*(id *)(a1 + 32), "attributedSubstringFromRange:", a3, a4);
    [*(id *)(a1 + 40) appendAttributedString:v16];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
}

- (id)_attributedStringByReplacingMediaObjectsWithTransferGUIDsInText:(id)a3 transferGUIDs:(id *)a4 mediaObjects:(id *)a5
{
  id v7 = a3;
  uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
  id v10 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  uint64_t v11 = [v7 length];
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  uint64_t v22 = __123__CKComposition_IMSuperFormat___attributedStringByReplacingMediaObjectsWithTransferGUIDsInText_transferGUIDs_mediaObjects___block_invoke;
  __int16 v23 = &unk_1E5624DF8;
  id v12 = v8;
  id v24 = v12;
  id v13 = v9;
  id v25 = v13;
  id v26 = v10;
  id v27 = v7;
  id v14 = v7;
  id v15 = v10;
  objc_msgSend(v14, "enumerateAttributesInRange:options:usingBlock:", 0, v11, 0, &v20);
  if (a4)
  {
    if (objc_msgSend(v12, "count", v20, v21, v22, v23, v24, v25, v26, v27)) {
      long long v16 = v12;
    }
    else {
      long long v16 = 0;
    }
    *a4 = v16;
  }
  if (a5)
  {
    if ([v13 count]) {
      long long v17 = v13;
    }
    else {
      long long v17 = 0;
    }
    *a5 = v17;
  }
  long long v18 = objc_msgSend(v15, "copy", v20, v21, v22, v23);

  return v18;
}

void __123__CKComposition_IMSuperFormat___attributedStringByReplacingMediaObjectsWithTransferGUIDsInText_transferGUIDs_mediaObjects___block_invoke(id *a1, void *a2, unint64_t a3, uint64_t a4)
{
  id v18 = a2;
  id v7 = [v18 objectForKeyedSubscript:@"MediaObjectForTextAttachment"];
  if (v7
    || ([v18 objectForKeyedSubscript:@"AdaptiveImageGlyphMediaObject"],
        (id v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v8 = [v7 transferGUID];
    [a1[4] addObject:v8];
    [a1[5] addObject:v7];
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v9 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F6C188]];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v9 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F6C108]];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v9 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F6C170]];
    }
    uint64_t v10 = *MEMORY[0x1E4F6E400];
    uint64_t v11 = [v18 objectForKeyedSubscript:*MEMORY[0x1E4F6E400]];
    id v12 = v11;
    if (v11)
    {
      id v13 = (void *)[v11 copy];
      [v9 setObject:v13 forKeyedSubscript:v10];
    }
    if (a3 < a3 + a4)
    {
      uint64_t v14 = *MEMORY[0x1E4F6C110];
      do
      {
        id v15 = objc_alloc(MEMORY[0x1E4F28B18]);
        long long v16 = (void *)[v9 copy];
        long long v17 = (void *)[v15 initWithString:v14 attributes:v16];

        [a1[6] appendAttributedString:v17];
        --a4;
      }
      while (a4);
    }
  }
  else
  {
    id v7 = objc_msgSend(a1[7], "attributedSubstringFromRange:", a3, a4);
    [a1[6] appendAttributedString:v7];
  }
}

- (id)superFormatText:(id)a3 transferGUIDs:(id *)a4 mediaObjects:(id *)a5
{
  uint64_t v8 = [(CKComposition *)self _attributedStringByTrimmingWhiteSpaceAroundAttachmentsInText:a3];
  id v16 = 0;
  id v17 = 0;
  id v9 = [(CKComposition *)self _attributedStringByReplacingMediaObjectsWithTransferGUIDsInText:v8 transferGUIDs:&v17 mediaObjects:&v16];
  id v10 = v17;
  id v11 = v16;
  id v12 = objc_msgSend(v9, "__im_attributedStringByAssigningMessagePartNumbers");
  if (a4)
  {
    if ([v10 count]) {
      id v13 = v10;
    }
    else {
      id v13 = 0;
    }
    *a4 = v13;
  }
  if (a5)
  {
    if ([v11 count]) {
      uint64_t v14 = v11;
    }
    else {
      uint64_t v14 = 0;
    }
    *a5 = v14;
  }

  return v12;
}

- (id)superFormatText:(id *)a3
{
  uint64_t v5 = [(CKComposition *)self text];
  id v11 = 0;
  id v6 = [(CKComposition *)self superFormatText:v5 transferGUIDs:&v11 mediaObjects:0];
  id v7 = v11;
  uint64_t v8 = v7;
  if (a3)
  {
    if ([v7 count]) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
    *a3 = v9;
  }

  return v6;
}

- (id)_messageFromPayload:(id)a3 firstGUID:(id)a4
{
  v51[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v47 = 0;
  id v48 = 0;
  uint64_t v8 = objc_msgSend(v6, "__ck_superFormatStringTransferGUIDs:mediaObjects:", &v48, &v47);
  id v9 = v48;
  id v42 = v47;
  id v10 = [v6 userInfo];
  id v11 = [v10 objectForKey:@"DeviceAction"];

  if (v11)
  {
    uint64_t v50 = *MEMORY[0x1E4F6D648];
    v51[0] = MEMORY[0x1E4F1CC38];
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:&v50 count:1];
  }
  else
  {
    uint64_t v12 = 0;
  }
  id v13 = [v6 data];
  uint64_t v14 = [v6 pluginBundleID];
  if (v7)
  {
    id v15 = v7;
  }
  else
  {
    id v15 = [NSString stringGUID];
  }
  uint64_t v41 = v15;
  if ([v14 isEqualToString:*MEMORY[0x1E4F6CBF8]]) {
    goto LABEL_8;
  }
  id v16 = IMBalloonExtensionIDWithSuffix();
  if (![v14 isEqualToString:v16]) {
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_13;
  }
  int v17 = [v6 shouldSendAsMediaObject];

  if (v17)
  {
LABEL_8:

    id v13 = 0;
    id v16 = v14;
    uint64_t v14 = 0;
LABEL_13:
  }
  uint64_t v40 = (void *)v12;
  if ([v6 isUpdate])
  {
    id v39 = v7;
    id v18 = (void *)MEMORY[0x1E4F6BD18];
    long long v19 = [v6 associatedMessageGUID];
    uint64_t v20 = [v18 breadcrumbMessageWithText:v8 associatedMessageGUID:v19 balloonBundleID:v14 fileTransferGUIDs:v9 payloadData:v13 threadIdentifier:0];

    objc_opt_class();
    id v38 = v9;
    uint64_t v21 = v8;
    if (objc_opt_isKindOfClass())
    {
      uint64_t v22 = objc_msgSend(v20, "_copyWithFlags:", objc_msgSend(v20, "flags") | 0x1000000);

      uint64_t v20 = (void *)v22;
    }
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v23 = v42;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v43 objects:v49 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v44 != v26) {
            objc_enumerationMutation(v23);
          }
          id v28 = [*(id *)(*((void *)&v43 + 1) + 8 * i) transfer];
          [v28 setIMMessage:v20];
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v43 objects:v49 count:16];
      }
      while (v25);
    }

    uint64_t v8 = v21;
    id v9 = v38;
    id v7 = v39;
  }
  else
  {
    uint64_t v20 = [(CKComposition *)self messageWithGUID:v41 superFormatText:v8 superFormatSubject:0 fileTransferGUIDs:v9 mediaObjects:v42 balloonBundleID:v14 payloadData:v13 messageSummaryInfo:v12];
  }
  uint64_t v29 = [v6 datasource];
  if (v29)
  {
    id v30 = (void *)v29;
    char v31 = [v6 isUpdate];

    if ((v31 & 1) == 0)
    {
      id v32 = [v6 datasource];
      objc_super v33 = [v20 guid];
      [v32 datasourceWasMovedToNewGuid:v33];

      char v34 = [MEMORY[0x1E4F6BC18] sharedInstance];
      uint64_t v35 = [v6 datasource];
      id v36 = [v20 guid];
      [v34 insertDataSource:v35 forGUID:v36];
    }
  }

  return v20;
}

- (id)_compositionParts
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [(CKComposition *)self text];
  uint64_t v5 = IMAttributedStringByRemovingTrackingInformation();

  id v6 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  uint64_t v7 = [v5 length];
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = 0;
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  uint64_t v20 = __49__CKComposition_IMSuperFormat___compositionParts__block_invoke;
  uint64_t v21 = &unk_1E5626210;
  uint64_t v25 = &v26;
  id v8 = v5;
  id v22 = v8;
  id v9 = v6;
  id v23 = v9;
  id v10 = v3;
  id v24 = v10;
  objc_msgSend(v8, "enumerateAttributesInRange:options:usingBlock:", 0, v7, 0, &v18);
  unint64_t v11 = v27[3];
  if (v11 < objc_msgSend(v8, "length", v18, v19, v20, v21))
  {
    uint64_t v12 = v27[3];
    uint64_t v13 = [v8 length];
    uint64_t v14 = objc_msgSend(v8, "attributedSubstringFromRange:", v12, v13 - v27[3]);
    [v10 addObject:v14];
  }
  id v15 = v24;
  id v16 = v10;

  _Block_object_dispose(&v26, 8);

  return v16;
}

void __49__CKComposition_IMSuperFormat___compositionParts__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  id v17 = [v7 objectForKeyedSubscript:@"PluginDisplayContainer"];
  id v8 = [v7 objectForKeyedSubscript:@"EmbeddedRichLinkConfiguration"];

  if (v17)
  {
    uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    uint64_t v10 = a3 - v9;
    if (a3 != v9)
    {
      unint64_t v11 = objc_msgSend(*(id *)(a1 + 32), "attributedSubstringFromRange:");
      uint64_t v12 = objc_msgSend(v11, "__ck_attributedStringByTrimmingCharactersInSet:", *(void *)(a1 + 40));
      if ([v12 length]) {
        [*(id *)(a1 + 48) addObject:v12];
      }
    }
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v17, v10);
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a3 + a4;
  }
  else if (v8)
  {
    if (a3 != *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      uint64_t v13 = objc_msgSend(*(id *)(a1 + 32), "attributedSubstringFromRange:");
      uint64_t v14 = objc_msgSend(v13, "__ck_attributedStringByTrimmingCharactersInSet:", *(void *)(a1 + 40));
      if ([v14 length]) {
        [*(id *)(a1 + 48) addObject:v14];
      }
    }
    id v15 = [v8 _makeSendablePluginPayload];
    id v16 = +[CKPluginDisplayContainer pluginDisplayContainerWithPluginPayload:v15 composeImage:0];
    [*(id *)(a1 + 48) addObject:v16];
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a3 + a4 + 1;
  }
}

- (BOOL)canBundleAttachmentsWithMessageOnService:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v5 = [v4 BOOLForKey:@"ForceNoAttachmentsWithMessage"];

  if (v5)
  {
    if (IMOSLoggingEnabled())
    {
      id v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v9 = 0;
        _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Forcing no attachments with messages (1 message per attachment) for RCS compatibility due to default ForceNoAttachmentsWithMessage", v9, 2u);
      }
    }
    char v7 = 0;
  }
  else
  {
    char v7 = [v3 supportsCapability:*MEMORY[0x1E4F6E088]];
  }

  return v7;
}

- (void)_applyMessagePropertiesTo:(id)a3 pluginPayload:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  char v7 = [v6 pluginBundleID];
  if ([v7 containsString:*MEMORY[0x1E4F6CC30]])
  {
  }
  else
  {
    id v8 = [v6 pluginBundleID];
    int v9 = [v8 containsString:*MEMORY[0x1E4F6CC38]];

    if (!v9) {
      goto LABEL_5;
    }
  }
  uint64_t v10 = [v6 pluginBundleID];
  [v16 setAssociatedBalloonBundleID:v10];

LABEL_5:
  unint64_t v11 = [(CKComposition *)self sourceApplicationID];

  if (v11)
  {
    uint64_t v12 = [(CKComposition *)self sourceApplicationID];
    [v16 setSourceApplicationID:v12];
  }
  uint64_t v13 = [v16 guid];
  uint64_t v14 = [(CKComposition *)self firstMessageGUIDOverride];
  int v15 = [v13 isEqualToString:v14];

  if (v15) {
    [v16 setShouldNotifyOnSend:1];
  }
}

- (id)messagesFromCompositionFirstGUIDForMessage:(id)a3 sendingService:(id)a4
{
  v99[1] = *MEMORY[0x1E4F143B8];
  id v59 = a3;
  id v58 = a4;
  id v65 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v89 = 0;
  id v90 = &v89;
  uint64_t v91 = 0x3032000000;
  long long v92 = __Block_byref_object_copy__78;
  long long v93 = __Block_byref_object_dispose__78;
  id v94 = 0;
  uint64_t v6 = [(CKComposition *)self firstMessageGUIDOverride];
  char v7 = (void *)v6;
  id v8 = v59;
  if (v6) {
    id v8 = (void *)v6;
  }
  id v94 = v8;

  int v9 = [(CKComposition *)self _compositionParts];
  uint64_t v10 = [(CKComposition *)self shelfPluginPayload];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v11 = v10;
  }
  else {
    unint64_t v11 = 0;
  }
  id v61 = v11;
  uint64_t v83 = 0;
  uint64_t v84 = &v83;
  uint64_t v85 = 0x3032000000;
  uint64_t v86 = __Block_byref_object_copy__78;
  uint64_t v87 = __Block_byref_object_dispose__78;
  id v88 = 0;
  id v88 = [(CKComposition *)self superFormatSubject];
  uint64_t v12 = [v9 firstObject];
  uint64_t v13 = (void *)v12;
  id v62 = v10;
  if (v84[5] && (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    uint64_t v14 = [(CKComposition *)self subject];
    [v9 insertObject:v14 atIndex:0];
    id v57 = (void *)v14;

    int v15 = (void *)v84[5];
    v84[5] = 0;

    uint64_t v10 = v62;
  }
  else
  {
    id v57 = v13;
  }
  id v16 = [v10 pluginBundleID];
  int v17 = [v16 isEqualToString:*MEMORY[0x1E4F6CBF8]];

  uint64_t v18 = [v61 pluginBundleID];
  uint64_t v19 = IMBalloonExtensionIDWithSuffix();
  if ([v18 isEqualToString:v19]) {
    int v20 = [v61 shouldSendAsMediaObject];
  }
  else {
    int v20 = 0;
  }

  if ((v17 | v20) == 1)
  {
    id v60 = objc_msgSend(v62, "__ck_photoCompositionString");
    goto LABEL_28;
  }
  if (!v61 || ![v61 shouldSendAsMediaObject])
  {
    if (!v62)
    {
LABEL_32:
      id v60 = 0;
      goto LABEL_35;
    }
    uint64_t v25 = [(CKComposition *)self shelfPluginPayload];
    int v26 = [v25 sendAsCopy];

    if (!v26)
    {
      uint64_t v29 = +[CKPluginDisplayContainer pluginDisplayContainerWithPluginPayload:v62 composeImage:0];
      [v9 insertObject:v29 atIndex:0];
      id v60 = 0;
LABEL_34:

      goto LABEL_35;
    }
    uint64_t v27 = [(CKComposition *)self shelfMediaObject];
    id v22 = (void *)v27;
    if (v27)
    {
      long long v96 = @"MediaObjectForTextAttachment";
      uint64_t v97 = v27;
      id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v97 forKeys:&v96 count:1];
      id v28 = objc_alloc(MEMORY[0x1E4F28B18]);
      id v60 = (void *)[v28 initWithString:*MEMORY[0x1E4F6C110] attributes:v23];
      goto LABEL_24;
    }
LABEL_26:
    id v60 = 0;
    goto LABEL_27;
  }
  uint64_t v21 = [v61 mediaObjectFromPayload];
  id v22 = (void *)v21;
  if (!v21) {
    goto LABEL_26;
  }
  long long v98 = @"MediaObjectForTextAttachment";
  v99[0] = v21;
  id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v99 forKeys:&v98 count:1];
  id v24 = objc_alloc(MEMORY[0x1E4F28B18]);
  id v60 = (void *)[v24 initWithString:*MEMORY[0x1E4F6C110] attributes:v23];
LABEL_24:

LABEL_27:
LABEL_28:
  if (!v60) {
    goto LABEL_32;
  }
  if (v57)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v29 = (void *)[v60 mutableCopy];
      [v29 appendAttributedString:v57];
      id v30 = (void *)[v29 copy];
      [v9 replaceObjectAtIndex:0 withObject:v30];

      goto LABEL_34;
    }
  }
  [v9 insertObject:v60 atIndex:0];
LABEL_35:
  BOOL v63 = [(CKComposition *)self canBundleAttachmentsWithMessageOnService:v58];
  char v31 = [(CKComposition *)self processedPartsForSuggestedReply:v9];

  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  obuint64_t j = v31;
  uint64_t v32 = [obj countByEnumeratingWithState:&v79 objects:v95 count:16];
  if (!v32) {
    goto LABEL_59;
  }
  uint64_t v33 = *(void *)v80;
  do
  {
    for (uint64_t i = 0; i != v32; ++i)
    {
      if (*(void *)v80 != v33) {
        objc_enumerationMutation(obj);
      }
      uint64_t v35 = *(void **)(*((void *)&v79 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v77 = 0;
        id v78 = 0;
        id v36 = [(CKComposition *)self superFormatText:v35 transferGUIDs:&v78 mediaObjects:&v77];
        id v37 = v78;
        id v38 = v77;
        if ([v36 length] || objc_msgSend((id)v84[5], "length"))
        {
          if (v63)
          {
            id v39 = [(CKComposition *)self messageWithGUID:v90[5] superFormatText:v36 superFormatSubject:v84[5] fileTransferGUIDs:v37 mediaObjects:v38 balloonBundleID:0 payloadData:0];
            if (v39)
            {
              [(CKComposition *)self _applyMessagePropertiesTo:v39 pluginPayload:v62];
              [v65 addObject:v39];
            }
            uint64_t v40 = (void *)v84[5];
            v84[5] = 0;

            uint64_t v41 = (void *)v90[5];
            v90[5] = 0;

LABEL_49:
          }
          else if ([v36 length])
          {
            aBlock[0] = MEMORY[0x1E4F143A8];
            aBlock[1] = 3221225472;
            aBlock[2] = __90__CKComposition_IMSuperFormat__messagesFromCompositionFirstGUIDForMessage_sendingService___block_invoke;
            aBlock[3] = &unk_1E562CA58;
            id v76 = v38;
            id v42 = _Block_copy(aBlock);
            v73[0] = MEMORY[0x1E4F143A8];
            v73[1] = 3221225472;
            v73[2] = __90__CKComposition_IMSuperFormat__messagesFromCompositionFirstGUIDForMessage_sendingService___block_invoke_2;
            v73[3] = &unk_1E562CA80;
            id v43 = v42;
            id v74 = v43;
            long long v44 = _Block_copy(v73);
            v66[0] = MEMORY[0x1E4F143A8];
            v66[1] = 3221225472;
            v66[2] = __90__CKComposition_IMSuperFormat__messagesFromCompositionFirstGUIDForMessage_sendingService___block_invoke_3;
            v66[3] = &unk_1E562CAA8;
            id v45 = v43;
            id v69 = v45;
            v66[4] = self;
            uint64_t v71 = &v89;
            id v67 = v62;
            id v68 = v65;
            id v46 = v44;
            id v70 = v46;
            uint64_t v72 = &v83;
            objc_msgSend(v36, "__im_visitMessageParts:", v66);

            id v39 = v76;
            goto LABEL_49;
          }
        }
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v47 = v35;
        id v48 = [v47 pluginPayload];
        char v49 = [(CKComposition *)self _messageFromPayload:v48 firstGUID:v90[5]];

        uint64_t v50 = (void *)v90[5];
        v90[5] = 0;

        id v51 = [(CKComposition *)self shelfPluginPayload];
        id v52 = [v51 groupActivity];
        [v49 setGroupActivity:v52];

        int v53 = [(CKComposition *)self sourceApplicationID];

        if (v53)
        {
          id v54 = [(CKComposition *)self sourceApplicationID];
          [v49 setSourceApplicationID:v54];
        }
        if (v49) {
          [v65 addObject:v49];
        }
      }
    }
    uint64_t v32 = [obj countByEnumeratingWithState:&v79 objects:v95 count:16];
  }
  while (v32);
LABEL_59:

  id v55 = v65;
  _Block_object_dispose(&v83, 8);

  _Block_object_dispose(&v89, 8);

  return v55;
}

id __90__CKComposition_IMSuperFormat__messagesFromCompositionFirstGUIDForMessage_sendingService___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = *(id *)(a1 + 32);
  id v5 = (id)[v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        int v9 = objc_msgSend(v8, "transfer", (void)v12);
        uint64_t v10 = [v9 guid];
        if ([v10 isEqualToString:v3])
        {
          id v5 = v8;

          goto LABEL_11;
        }
      }
      id v5 = (id)[v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

uint64_t __90__CKComposition_IMSuperFormat__messagesFromCompositionFirstGUIDForMessage_sendingService___block_invoke_2(uint64_t a1)
{
  id v1 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = [v1 transfer];
  uint64_t v3 = [v2 isAdaptiveImageGlyph];

  return v3;
}

void __90__CKComposition_IMSuperFormat__messagesFromCompositionFirstGUIDForMessage_sendingService___block_invoke_3(uint64_t a1, void *a2)
{
  v65[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 messagePartBody];
  id v5 = [v3 transferGUID];
  if ([v5 length])
  {
    uint64_t v6 = (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    char v7 = (void *)v6;
    id v8 = v5;
    int v9 = v4;
    if (v6)
    {
      v65[0] = v6;
      id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:1];
    }
    else
    {
      id v10 = 0;
    }
    long long v13 = *(void **)(a1 + 32);
    uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    char v64 = v8;
    [MEMORY[0x1E4F1C978] arrayWithObjects:&v64 count:1];
    v16 = uint64_t v15 = a1;
    uint64_t v17 = v14;
    uint64_t v18 = v9;
    uint64_t v19 = [v13 messageWithGUID:v17 superFormatText:v9 superFormatSubject:0 fileTransferGUIDs:v16 mediaObjects:v10 balloonBundleID:0 payloadData:0];

    [*(id *)(v15 + 32) _applyMessagePropertiesTo:v19 pluginPayload:*(void *)(v15 + 40)];
    [*(id *)(v15 + 48) addObject:v19];
    uint64_t v20 = *(void *)(*(void *)(v15 + 72) + 8);
    uint64_t v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = 0;
  }
  else
  {
    id v46 = v5;
    id v47 = v4;
    if (objc_msgSend(v4, "__im_isOnlyAdaptiveImageGlyphFileTransfersAndWhitespaceUsingIsAdaptiveImageGlyphProvider:", *(void *)(a1 + 64)))
    {
      unint64_t v11 = objc_msgSend(v4, "__im_transferGUIDsInAttributedString");
      id v12 = [v11 array];
    }
    else
    {
      uint64_t v22 = *(void *)(a1 + 64);
      id v58 = 0;
      unint64_t v11 = objc_msgSend(v4, "__im_attributedStringByReplacingAdaptiveImageGlyphFileTransfersUsingIsAdaptiveImageGlyphProvider:replacementTextProvider:removedTransferGUIDsOut:", v22, &__block_literal_global_483_1, &v58);
      id v12 = v58;
      id v23 = [*(id *)(a1 + 32) messageWithGUID:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) superFormatText:v11 superFormatSubject:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) fileTransferGUIDs:0 mediaObjects:0 balloonBundleID:0 payloadData:0];
      [*(id *)(a1 + 32) _applyMessagePropertiesTo:v23 pluginPayload:*(void *)(a1 + 40)];
      [*(id *)(a1 + 48) addObject:v23];
      uint64_t v24 = *(void *)(*(void *)(a1 + 80) + 8);
      uint64_t v25 = *(void **)(v24 + 40);
      *(void *)(v24 + 40) = 0;

      uint64_t v26 = *(void *)(*(void *)(a1 + 72) + 8);
      uint64_t v27 = *(void **)(v26 + 40);
      *(void *)(v26 + 40) = 0;
    }
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v10 = v12;
    uint64_t v52 = [v10 countByEnumeratingWithState:&v54 objects:v63 count:16];
    if (v52)
    {
      obuint64_t j = v10;
      id v45 = v3;
      uint64_t v51 = *(void *)v55;
      uint64_t v50 = *MEMORY[0x1E4F6C188];
      uint64_t v49 = *MEMORY[0x1E4F6C110];
      do
      {
        for (uint64_t i = 0; i != v52; ++i)
        {
          if (*(void *)v55 != v51) {
            objc_enumerationMutation(obj);
          }
          uint64_t v29 = *(void *)(*((void *)&v54 + 1) + 8 * i);
          uint64_t v30 = (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
          int v53 = (void *)v30;
          if (v30)
          {
            uint64_t v62 = v30;
            char v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v62 count:1];
          }
          else
          {
            char v31 = 0;
          }
          uint64_t v60 = v50;
          uint64_t v61 = v29;
          uint64_t v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v60 count:1];
          uint64_t v33 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v49 attributes:v32];
          char v34 = *(void **)(a1 + 32);
          uint64_t v35 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
          uint64_t v36 = a1;
          uint64_t v37 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
          uint64_t v59 = v29;
          id v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v59 count:1];
          uint64_t v39 = v37;
          a1 = v36;
          uint64_t v40 = [v34 messageWithGUID:v35 superFormatText:v33 superFormatSubject:v39 fileTransferGUIDs:v38 mediaObjects:v31 balloonBundleID:0 payloadData:0];

          [*(id *)(v36 + 32) _applyMessagePropertiesTo:v40 pluginPayload:*(void *)(v36 + 40)];
          [*(id *)(v36 + 48) addObject:v40];
          uint64_t v41 = *(void *)(*(void *)(v36 + 80) + 8);
          id v42 = *(void **)(v41 + 40);
          *(void *)(v41 + 40) = 0;

          uint64_t v43 = *(void *)(*(void *)(v36 + 72) + 8);
          long long v44 = *(void **)(v43 + 40);
          *(void *)(v43 + 40) = 0;
        }
        uint64_t v52 = [obj countByEnumeratingWithState:&v54 objects:v63 count:16];
      }
      while (v52);
      id v10 = obj;
      char v7 = obj;
      id v3 = v45;
    }
    else
    {
      char v7 = v10;
    }
    id v8 = v46;
    uint64_t v18 = v47;
  }
}

__CFString *__90__CKComposition_IMSuperFormat__messagesFromCompositionFirstGUIDForMessage_sendingService___block_invoke_4()
{
  return @"";
}

- (id)processedPartsForSuggestedReply:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_9;
        }
        unint64_t v11 = objc_msgSend(v10, "pluginPayload", (void)v15);
        id v12 = [v11 userInfo];
        long long v13 = [v12 objectForKey:@"suggestedReplyBody"];

        if (v13)
        {
          [v4 addObject:v13];
        }
        else
        {
LABEL_9:
          objc_msgSend(v4, "addObject:", v10, (void)v15);
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)messageWithGUID:(id)a3 superFormatText:(id)a4 superFormatSubject:(id)a5 fileTransferGUIDs:(id)a6 mediaObjects:(id)a7 balloonBundleID:(id)a8 payloadData:(id)a9
{
  return [(CKComposition *)self messageWithGUID:a3 superFormatText:a4 superFormatSubject:a5 fileTransferGUIDs:a6 mediaObjects:a7 balloonBundleID:a8 payloadData:a9 messageSummaryInfo:0];
}

- (id)messageWithGUID:(id)a3 superFormatText:(id)a4 superFormatSubject:(id)a5 fileTransferGUIDs:(id)a6 mediaObjects:(id)a7 balloonBundleID:(id)a8 payloadData:(id)a9 messageSummaryInfo:(id)a10
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v46 = a5;
  id v47 = a6;
  id v45 = a7;
  id v48 = a8;
  id v49 = a9;
  id v18 = a10;
  uint64_t v19 = [(CKComposition *)self expressiveSendStyleID];
  uint64_t v20 = [v17 string];
  uint64_t v21 = [v20 trimmedString];
  uint64_t v22 = [v21 lowercaseString];
  if ([v22 isEqualToString:@"pew pew"])
  {
    int v23 = [MEMORY[0x1E4F6E730] supportsScreenEffects];

    if (!v23) {
      goto LABEL_6;
    }
    uint64_t v20 = v19;
    uint64_t v19 = @"com.apple.messages.effect.CKLasersEffect";
  }
  else
  {
  }
LABEL_6:
  if ([(CKComposition *)self isAudioComposition]) {
    uint64_t v24 = 2097157;
  }
  else {
    uint64_t v24 = 5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v24 |= 0x1000000uLL;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v25 = v24 | 0x2000000;
  }
  else {
    uint64_t v25 = v24;
  }
  uint64_t v26 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v27 = [v26 isScheduledMessagesEnabled];

  if (v27
    && ([(CKComposition *)self sendLaterPluginInfo],
        id v28 = objc_claimAutoreleasedReturnValue(),
        v28,
        v28))
  {
    uint64_t v29 = [(CKComposition *)self sendLaterPluginInfo];
    uint64_t v30 = [v29 selectedDate];

    uint64_t v31 = 1;
    uint64_t v32 = 2;
  }
  else
  {
    uint64_t v30 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v32 = 0;
    uint64_t v31 = 0;
  }
  uint64_t v55 = 0;
  long long v56 = &v55;
  uint64_t v57 = 0x3032000000;
  id v58 = __Block_byref_object_copy__78;
  uint64_t v59 = __Block_byref_object_dispose__78;
  id v60 = 0;
  id v33 = objc_alloc(MEMORY[0x1E4F6BD18]);
  char v34 = v33;
  if (v16)
  {
    id v60 = (id)[v33 initWithSender:0 time:v30 text:v17 messageSubject:v46 fileTransferGUIDs:v47 flags:v25 error:0 guid:v16 subject:0 balloonBundleID:v48 payloadData:v49 expressiveSendStyleID:v19 threadIdentifier:0 scheduleType:v32 scheduleState:v31 messageSummaryInfo:v18];
  }
  else
  {
    uint64_t v35 = [NSString stringGUID];
    id v60 = (id)[v34 initWithSender:0 time:v30 text:v17 messageSubject:v46 fileTransferGUIDs:v47 flags:v25 error:0 guid:v35 subject:0 balloonBundleID:v48 payloadData:v49 expressiveSendStyleID:v19 threadIdentifier:0 scheduleType:v32 scheduleState:v31 messageSummaryInfo:v18];
  }
  uint64_t v36 = [MEMORY[0x1E4F6BC90] sharedInstance];
  uint64_t v37 = v56[5];
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __161__CKComposition_IMSuperFormat__messageWithGUID_superFormatText_superFormatSubject_fileTransferGUIDs_mediaObjects_balloonBundleID_payloadData_messageSummaryInfo___block_invoke;
  v54[3] = &unk_1E562CAD0;
  v54[4] = &v55;
  [v36 scanMessage:v37 outgoing:1 waitUntilDone:1 completionBlock:v54];

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v38 = v45;
  uint64_t v39 = [v38 countByEnumeratingWithState:&v50 objects:v61 count:16];
  if (v39)
  {
    uint64_t v40 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v39; ++i)
      {
        if (*(void *)v51 != v40) {
          objc_enumerationMutation(v38);
        }
        id v42 = [*(id *)(*((void *)&v50 + 1) + 8 * i) transfer];
        [v42 setIMMessage:v56[5]];
      }
      uint64_t v39 = [v38 countByEnumeratingWithState:&v50 objects:v61 count:16];
    }
    while (v39);
  }

  id v43 = (id)v56[5];
  _Block_object_dispose(&v55, 8);

  return v43;
}

void __161__CKComposition_IMSuperFormat__messageWithGUID_superFormatText_superFormatSubject_fileTransferGUIDs_mediaObjects_balloonBundleID_payloadData_messageSummaryInfo___block_invoke(uint64_t a1, int a2, id obj)
{
}

- (id)messageWithGUID:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v33 = 0;
  id v5 = [(CKComposition *)self superFormatText:&v33];
  id v6 = v33;
  uint64_t v7 = [(CKComposition *)self superFormatSubject];
  uint64_t v8 = [(CKComposition *)self expressiveSendStyleID];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v9 = 2097157;
  }
  else {
    uint64_t v9 = 5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v9 |= 0x1000000uLL;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v9 |= 0x2000000uLL;
  }
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy__78;
  uint64_t v31 = __Block_byref_object_dispose__78;
  id v32 = 0;
  id v10 = objc_alloc(MEMORY[0x1E4F6BD18]);
  unint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
  if (v4)
  {
    id v32 = (id)[v10 initWithSender:0 time:v11 text:v5 messageSubject:v7 fileTransferGUIDs:v6 flags:v9 error:0 guid:v4 subject:0 balloonBundleID:0 payloadData:0 expressiveSendStyleID:v8 threadIdentifier:0];
  }
  else
  {
    id v12 = [NSString stringGUID];
    id v32 = (id)[v10 initWithSender:0 time:v11 text:v5 messageSubject:v7 fileTransferGUIDs:v6 flags:v9 error:0 guid:v12 subject:0 balloonBundleID:0 payloadData:0 expressiveSendStyleID:v8 threadIdentifier:0];
  }
  long long v13 = [MEMORY[0x1E4F6BC90] sharedInstance];
  uint64_t v14 = v28[5];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __48__CKComposition_IMSuperFormat__messageWithGUID___block_invoke;
  v26[3] = &unk_1E562CAD0;
  void v26[4] = &v27;
  [v13 scanMessage:v14 outgoing:1 waitUntilDone:1 completionBlock:v26];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v15 = [(CKComposition *)self mediaObjects];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v34 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v15);
        }
        uint64_t v19 = [*(id *)(*((void *)&v22 + 1) + 8 * i) transfer];
        [v19 setIMMessage:v28[5]];
      }
      uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v34 count:16];
    }
    while (v16);
  }

  id v20 = (id)v28[5];
  _Block_object_dispose(&v27, 8);

  return v20;
}

void __48__CKComposition_IMSuperFormat__messageWithGUID___block_invoke(uint64_t a1, int a2, id obj)
{
}

+ (id)compositionForMessageParts:(id)a3 preserveSubject:(BOOL)a4 contextIdentifier:(id)a5
{
  BOOL v6 = a4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    unint64_t v11 = 0;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v7);
        }
        uint64_t v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (v11)
        {
          long long v15 = [*(id *)(*((void *)&v20 + 1) + 8 * i) compositionWithContext:v8];
          uint64_t v16 = [v11 compositionByAppendingComposition:v15];

          unint64_t v11 = (void *)v16;
        }
        else if (v6)
        {
          unint64_t v11 = [*(id *)(*((void *)&v20 + 1) + 8 * i) compositionWithContext:v8];
        }
        else
        {
          uint64_t v17 = +[CKComposition composition];
          id v18 = [v14 compositionWithContext:v8];
          unint64_t v11 = [v17 compositionByAppendingComposition:v18];
        }
      }
      uint64_t v10 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }
  else
  {
    unint64_t v11 = 0;
  }

  return v11;
}

- (void)saveCompositionWithGUID:(id)a3
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(15);
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 136315394;
      char v64 = "-[CKComposition(CKPersistentComposition) saveCompositionWithGUID:]";
      __int16 v65 = 2112;
      id v66 = v4;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_DEBUG, "%s guid:%@", buf, 0x16u);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    uint64_t v57 = "-[CKComposition(CKPersistentComposition) saveCompositionWithGUID:]";
    id v58 = v4;
    _CKLog();
  }
  if (v4)
  {
    BOOL v6 = objc_msgSend(v4, "im_lastPathComponent");
    char v7 = [v4 isEqualToString:v6];

    if ((v7 & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        id v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          uint64_t v9 = objc_msgSend(v4, "im_lastPathComponent");
          *(_DWORD *)long long buf = 138412546;
          char v64 = (const char *)v4;
          __int16 v65 = 2112;
          id v66 = v9;
          _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "guid has path specifiers %@. using stripped guid instead %@", buf, 0x16u);
        }
      }
      uint64_t v10 = objc_msgSend(v4, "im_lastPathComponent", v57, v58);

      id v4 = (id)v10;
    }
  }
  unint64_t v11 = CKDraftsDirectoryURL();
  id v60 = [v11 URLByAppendingPathComponent:v4 isDirectory:1];

  uint64_t v61 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v61 createDirectoryAtURL:v60 withIntermediateDirectories:1 attributes:0 error:0];
  uint64_t v59 = CKPluginTmpSubDirectoryURL(v4, 0);
  uint64_t v12 = [v59 path];
  int v13 = [v61 fileExistsAtPath:v12];

  if (v13)
  {
    uint64_t v14 = CKPluginDraftDirectoryURL(v4, 0);
    long long v15 = [v14 path];
    int v16 = [v61 fileExistsAtPath:v15];

    if (IMOSLoggingEnabled())
    {
      uint64_t v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        id v18 = @"NO";
        *(_DWORD *)long long buf = 138412802;
        char v64 = (const char *)v14;
        __int16 v65 = 2112;
        if (v16) {
          id v18 = @"YES";
        }
        id v66 = v59;
        __int16 v67 = 2112;
        id v68 = v18;
        _os_log_impl(&dword_18EF18000, v17, OS_LOG_TYPE_INFO, "onSave draft %@ working %@ draftExists %@", buf, 0x20u);
      }
    }
    if (v16) {
      [v61 removeItemAtURL:v14 error:0];
    }
    id v62 = 0;
    objc_msgSend(v61, "copyItemAtURL:toURL:error:", v59, v14, &v62, v57, v58);
    uint64_t v19 = (char *)v62;
    if (v19 && IMOSLoggingEnabled())
    {
      long long v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        char v64 = v19;
        _os_log_impl(&dword_18EF18000, v20, OS_LOG_TYPE_INFO, "Error when backing up working dir to drafts: %@", buf, 0xCu);
      }
    }
  }
  long long v21 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:5];
  long long v22 = objc_msgSend(NSNumber, "numberWithBool:", -[CKComposition isAudioComposition](self, "isAudioComposition"));
  [v21 setObject:v22 forKey:@"audioMessage"];

  if ([(CKComposition *)self isAudioComposition])
  {
    long long v23 = [(CKComposition *)self mediaObjects];
    long long v24 = [v23 firstObject];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v25 = [v24 powerLevels];
      [v21 setObject:v25 forKeyedSubscript:@"audioPowerLevels"];
    }
    else
    {
      uint64_t v25 = IMLogHandleForCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        -[_CKAudioComposition initWithText:subject:powerLevels:](v25, v26, v27, v28, v29, v30, v31, v32);
      }
    }
  }
  id v33 = [(CKComposition *)self shelfPluginPayload];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass) {
    uint64_t v35 = v33;
  }
  else {
    uint64_t v35 = 0;
  }
  id v36 = v35;
  if (v33)
  {
    if (isKindOfClass)
    {
      uint64_t v37 = [v33 mediaObject];
      BOOL v38 = v37 == 0;

      if (v38)
      {
        id v45 = v33;
      }
      else
      {
        uint64_t v39 = [v33 mediaObject];
        uint64_t v40 = (void *)[v33 copy];

        uint64_t v41 = [v60 URLByAppendingPathComponent:@"Attachments" isDirectory:1];
        id v42 = [MEMORY[0x1E4F28CB8] defaultManager];
        id v43 = CKWriteMediaObjectToFileLocation(v39, v41, v42);

        [v40 setFileURL:v43];
        long long v44 = [v39 transcoderUserInfo];
        [v40 setUserInfo:v44];

        id v45 = v40;
        id v33 = v45;
      }
    }
    else
    {
      id v45 = 0;
    }
    id v46 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v33 requiringSecureCoding:1 error:0];
    [v21 setObject:v46 forKey:@"shelfPluginPayload"];
  }
  else
  {
    id v45 = v36;
  }
  [(CKComposition *)self _persistTextToComposition:v21 directoryURL:v60];
  id v47 = [(CKComposition *)self subject];
  if (v47)
  {
    id v48 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v47 requiringSecureCoding:1 error:0];
    [v21 setObject:v48 forKey:@"subject"];
    if (IMOSLoggingEnabled())
    {
      id v49 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_18EF18000, v49, OS_LOG_TYPE_INFO, "-> preserving subject to draft", buf, 2u);
      }
    }
  }
  long long v50 = [(CKComposition *)self bizIntent];
  if (v50)
  {
    long long v51 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v50 requiringSecureCoding:1 error:0];
    [v21 setObject:v51 forKey:@"bizIntent"];
    if (IMOSLoggingEnabled())
    {
      long long v52 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_18EF18000, v52, OS_LOG_TYPE_INFO, "-> preserving bizInent to draft", buf, 2u);
      }
    }
  }
  long long v53 = [(CKComposition *)self sendLaterPluginInfo];
  if (v53)
  {
    long long v54 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v53 requiringSecureCoding:1 error:0];
    [v21 setObject:v54 forKey:@"sendLaterPluginInfo"];
    if (IMOSLoggingEnabled())
    {
      uint64_t v55 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_18EF18000, v55, OS_LOG_TYPE_INFO, "-> preserving sendLaterPluginInfo to draft", buf, 2u);
      }
    }
  }
  long long v56 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v21 format:100 options:0 error:0];
  [(CKComposition *)self _saveCompositionData:v56 atURL:v60 forGUID:v4];
}

- (void)_persistTextToComposition:(id)a3 directoryURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CKComposition *)self text];
  if (v8)
  {
    uint64_t v9 = [v7 URLByAppendingPathComponent:@"Attachments" isDirectory:1];
    uint64_t v10 = [MEMORY[0x1E4F28CB8] defaultManager];
    unint64_t v11 = CKPersistentTextForText(v8, v9, v10);

    if (!v11)
    {
      int v13 = IMLogHandleForCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[CKComposition(CKPersistentComposition) _persistTextToComposition:directoryURL:](v13, v15, v16, v17, v18, v19, v20, v21);
      }
      goto LABEL_13;
    }
    id v23 = 0;
    uint64_t v12 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v11 requiringSecureCoding:1 error:&v23];
    int v13 = v23;
    if (v12)
    {
      [v6 setObject:v12 forKey:@"text"];
      if (!IMOSLoggingEnabled())
      {
LABEL_12:

LABEL_13:
        goto LABEL_14;
      }
      uint64_t v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long v22 = 0;
        _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "-> drafted text preserved", v22, 2u);
      }
    }
    else
    {
      uint64_t v14 = IMLogHandleForCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[CKComposition(CKPersistentComposition) _persistTextToComposition:directoryURL:]((uint64_t)v13, v14);
      }
    }

    goto LABEL_12;
  }
LABEL_14:
}

- (BOOL)_saveCompositionData:(id)a3 atURL:(id)a4 forGUID:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v8 URLByAppendingPathComponent:@"composition.plist" isDirectory:0];
  id v15 = 0;
  char v11 = [v7 writeToURL:v10 options:1073741825 error:&v15];
  id v12 = v15;

  if ((v11 & 1) == 0 && IMOSLoggingEnabled())
  {
    int v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412546;
      id v17 = v9;
      __int16 v18 = 2112;
      id v19 = v12;
      _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "Draft (%@) write failure: %@", buf, 0x16u);
    }
  }
  return v11;
}

+ (void)deleteCompositionWithGUID:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(15);
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 136315394;
      uint64_t v14 = "+[CKComposition(CKPersistentComposition) deleteCompositionWithGUID:]";
      __int16 v15 = 2112;
      id v16 = v3;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_DEBUG, "%s guid:%@", buf, 0x16u);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    char v11 = "+[CKComposition(CKPersistentComposition) deleteCompositionWithGUID:]";
    id v12 = v3;
    _CKLog();
  }
  id v5 = objc_msgSend(v3, "im_lastPathComponent", v11, v12);

  if ([v5 length])
  {
    id v6 = CKDraftsDirectoryURL();
    id v7 = [v6 URLByAppendingPathComponent:v5 isDirectory:1];

    id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v8 removeItemAtURL:v7 error:0];
    id v9 = CKPluginTmpSubDirectoryURL(v5, 0);
    [v8 removeItemAtURL:v9 error:0];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(15);
      uint64_t v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 136315138;
        uint64_t v14 = "+[CKComposition(CKPersistentComposition) deleteCompositionWithGUID:]";
        _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_DEBUG, "%s guid is invalid", buf, 0xCu);
      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog()) {
      _CKLog();
    }
  }
}

+ (id)savedCompositionForGUID:(id)a3
{
  return (id)[a1 _savedCompositionForGUID:a3 readUsingBlock:&__block_literal_global_604_0];
}

id __66__CKComposition_CKPersistentComposition__savedCompositionForGUID___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F1C9B8];
  id v3 = [a2 URLByAppendingPathComponent:@"composition.plist" isDirectory:0];
  id v4 = [v2 dataWithContentsOfURL:v3];

  return v4;
}

+ (id)_savedCompositionForGUID:(id)a3 readUsingBlock:(id)a4
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v78 = a3;
  id v76 = (void (**)(id, void *))a4;
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(15);
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 136315394;
      *(void *)uint64_t v86 = "+[CKComposition(CKPersistentComposition) _savedCompositionForGUID:readUsingBlock:]";
      *(_WORD *)&v86[8] = 2112;
      id v87 = v78;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_DEBUG, "%s guid:%@", buf, 0x16u);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    __int16 v65 = "+[CKComposition(CKPersistentComposition) _savedCompositionForGUID:readUsingBlock:]";
    id v67 = v78;
    _CKLog();
  }
  id v77 = objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager", v65, v67);
  id v6 = objc_msgSend(v78, "im_lastPathComponent");
  if ([v6 length])
  {
    id v7 = CKDraftsDirectoryURL();
    uint64_t v73 = [v7 URLByAppendingPathComponent:v6 isDirectory:1];

    id v75 = CKPluginDraftDirectoryURL(v6, 0);
    id v8 = [v75 path];
    int v9 = [v77 fileExistsAtPath:v8];

    if (v9)
    {
      uint64_t v10 = CKPluginTmpSubDirectoryURL(v6, 0);
      char v11 = [v10 path];
      int v12 = [v77 fileExistsAtPath:v11];

      if (IMOSLoggingEnabled())
      {
        int v13 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          uint64_t v14 = @"NO";
          *(_DWORD *)long long buf = 138412802;
          *(void *)uint64_t v86 = v75;
          *(_WORD *)&v86[8] = 2112;
          if (v12) {
            uint64_t v14 = @"YES";
          }
          id v87 = v10;
          __int16 v88 = 2112;
          uint64_t v89 = v14;
          _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "getSaved draft %@ working %@ workExists %@", buf, 0x20u);
        }
      }
      if (v12) {
        [v77 removeItemAtURL:v10 error:0];
      }
      id v84 = 0;
      [v77 copyItemAtURL:v75 toURL:v10 error:&v84];
      id v15 = v84;
      if (IMOSLoggingEnabled())
      {
        id v16 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412290;
          *(void *)uint64_t v86 = v15;
          _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_INFO, "Error when restoring draft to working with error %@", buf, 0xCu);
        }
      }
    }
    uint64_t v72 = v76[2](v76, v73);
    uint64_t v17 = (void *)v72;
    if (!v72)
    {
      id v36 = 0;
LABEL_108:
      uint64_t v35 = v36;

      goto LABEL_109;
    }
    __int16 v18 = [MEMORY[0x1E4F28F98] propertyListWithData:v72 options:0 format:0 error:0];
    uint64_t v71 = [v18 objectForKey:@"shelfPluginPayload"];
    if (v71)
    {
      id v19 = (id)[MEMORY[0x1E4F6BC18] sharedInstance];
      id v83 = 0;
      id v74 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v71 error:&v83];
      id v20 = v83;
      if (v74)
      {
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        long long v22 = v74;
        if ((isKindOfClass & 1) == 0) {
          long long v22 = 0;
        }
        id v23 = v22;
        if (isKindOfClass)
        {
          long long v24 = [v74 fileURL];
          BOOL v25 = v24 == 0;

          if (!v25)
          {
            uint64_t v26 = +[CKMediaObjectManager sharedInstance];
            uint64_t v27 = [v74 fileURL];
            uint64_t v28 = [v74 userInfo];
            uint64_t v29 = [v74 attributionInfo];
            LOBYTE(v66) = [v74 shouldHideAttachments];
            uint64_t v30 = [v26 mediaObjectWithFileURL:v27 filename:0 transcoderUserInfo:v28 attributionInfo:v29 adaptiveImageGlyphContentIdentifier:0 adaptiveImageGlyphContentDescription:0 hideAttachment:v66];

            if (v30)
            {
              [v74 setMediaObject:v30];
              uint64_t v31 = [v30 fileURL];
              [v74 setFileURL:v31];
            }
          }
        }
        if (IMOSLoggingEnabled())
        {
          uint64_t v32 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            id v33 = [v74 pluginBundleID];
            *(_DWORD *)long long buf = 138412290;
            *(void *)uint64_t v86 = v33;
            _os_log_impl(&dword_18EF18000, v32, OS_LOG_TYPE_INFO, "-> shelf:\n'NSDATA'->'%@'", buf, 0xCu);
          }
        }
      }
      else if (IMOSLoggingEnabled())
      {
        BOOL v38 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412290;
          *(void *)uint64_t v86 = v20;
          _os_log_impl(&dword_18EF18000, v38, OS_LOG_TYPE_INFO, "Error decoding composition shelf data: %@", buf, 0xCu);
        }
      }
      char v37 = [v74 shouldHideAttachments];
    }
    else
    {
      id v74 = 0;
      char v37 = 0;
    }
    id v70 = [v18 objectForKey:@"text"];
    if (v70)
    {
      id v82 = 0;
      uint64_t v39 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v70 error:&v82];
      id v40 = v82;
      if (v39)
      {
        uint64_t v41 = +[CKMediaObjectManager sharedInstance];
        id v68 = CKTextForPersistentText(v39, v41, v37);

        if (IMOSLoggingEnabled())
        {
          id v42 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 67109376;
            *(_DWORD *)uint64_t v86 = v68 != 0;
            *(_WORD *)&v86[4] = 1024;
            *(_DWORD *)&v86[6] = 1;
            _os_log_impl(&dword_18EF18000, v42, OS_LOG_TYPE_INFO, "-> has retrieved text:%{BOOL}d for persistentText:%{BOOL}d", buf, 0xEu);
          }
        }
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          id v43 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 138412290;
            *(void *)uint64_t v86 = v40;
            _os_log_impl(&dword_18EF18000, v43, OS_LOG_TYPE_INFO, "Error decoding composition text data: %@", buf, 0xCu);
          }
        }
        id v68 = 0;
      }
    }
    else
    {
      id v68 = 0;
    }
    uint64_t v69 = [v18 objectForKey:@"subject"];
    if (!v69)
    {
      long long v44 = 0;
      goto LABEL_78;
    }
    id v81 = 0;
    long long v44 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v69 error:&v81];
    id v45 = v81;
    int v46 = IMOSLoggingEnabled();
    if (v44)
    {
      if (v46)
      {
        id v47 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_18EF18000, v47, OS_LOG_TYPE_INFO, "-> Subject retrieved and unarchived.", buf, 2u);
        }
LABEL_76:
      }
    }
    else if (v46)
    {
      id v47 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        *(void *)uint64_t v86 = v45;
        _os_log_impl(&dword_18EF18000, v47, OS_LOG_TYPE_INFO, "Error decoding composition subject data: %@", buf, 0xCu);
      }
      goto LABEL_76;
    }

LABEL_78:
    id v48 = [v18 objectForKey:@"bizIntent"];
    if (!v48)
    {
      long long v51 = 0;
      goto LABEL_92;
    }
    id v49 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v50 = objc_opt_class();
    id v80 = 0;
    long long v51 = [v49 unarchivedDictionaryWithKeysOfClass:v50 objectsOfClass:objc_opt_class() fromData:v48 error:&v80];
    id v52 = v80;
    int v53 = IMOSLoggingEnabled();
    if (v51)
    {
      if (v53)
      {
        long long v54 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
        {
          uint64_t v55 = [v51 count];
          long long v56 = @"something";
          if (!v55) {
            long long v56 = @"nothing";
          }
          *(_DWORD *)long long buf = 138412290;
          *(void *)uint64_t v86 = v56;
          _os_log_impl(&dword_18EF18000, v54, OS_LOG_TYPE_INFO, "-> bizIntent:%@", buf, 0xCu);
        }
LABEL_90:
      }
    }
    else if (v53)
    {
      long long v54 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        *(void *)uint64_t v86 = v52;
        _os_log_impl(&dword_18EF18000, v54, OS_LOG_TYPE_INFO, "Error decoding composition bizIntent data: %@", buf, 0xCu);
      }
      goto LABEL_90;
    }

LABEL_92:
    uint64_t v57 = [v18 objectForKey:@"sendLaterPluginInfo"];
    if (!v57)
    {
      id v58 = 0;
LABEL_104:
      id v62 = [v18 objectForKey:@"audioMessage"];
      if ([v62 BOOLValue])
      {
        BOOL v63 = [v18 objectForKeyedSubscript:@"audioPowerLevels"];
        id v36 = [[_CKAudioComposition alloc] initWithText:v68 subject:v44 powerLevels:v63];
      }
      else
      {
        id v36 = [[CKComposition alloc] initWithText:v68 subject:v44 shelfPluginPayload:v74 bizIntent:v51];
        [(CKComposition *)v36 setSendLaterPluginInfo:v58];
      }

      uint64_t v17 = (void *)v72;
      goto LABEL_108;
    }
    id v79 = 0;
    id v58 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v57 error:&v79];
    id v59 = v79;
    int v60 = IMOSLoggingEnabled();
    if (v58)
    {
      if (v60)
      {
        uint64_t v61 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412290;
          *(void *)uint64_t v86 = v58;
          _os_log_impl(&dword_18EF18000, v61, OS_LOG_TYPE_INFO, "-> sendLaterPluginInfo:%@", buf, 0xCu);
        }
LABEL_102:
      }
    }
    else if (v60)
    {
      uint64_t v61 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        *(void *)uint64_t v86 = v59;
        _os_log_impl(&dword_18EF18000, v61, OS_LOG_TYPE_INFO, "Error decoding composition sendLaterPluginInfo data: %@", buf, 0xCu);
      }
      goto LABEL_102;
    }

    goto LABEL_104;
  }
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(15);
    char v34 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 136315138;
      *(void *)uint64_t v86 = "+[CKComposition(CKPersistentComposition) _savedCompositionForGUID:readUsingBlock:]";
      _os_log_impl(&dword_18EF18000, v34, OS_LOG_TYPE_DEBUG, "%s guid is invalid", buf, 0xCu);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog()) {
    _CKLog();
  }
  uint64_t v35 = 0;
LABEL_109:

  return v35;
}

- (id)_compositionByAppendingText:(id)a3 isExpirable:(BOOL)a4 shelfPluginPayload:(id)a5 shelfMediaObject:(id)a6 addingNewLineIfNedded:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = v13;
  if (!v11 && !v12 && !v13)
  {
    id v15 = self;
    goto LABEL_39;
  }
  id v16 = [(CKComposition *)self text];
  id v49 = v14;
  if (v16)
  {
    uint64_t v17 = v16;
    if (v11)
    {
      uint64_t v18 = [v16 mutableCopy];
      id v19 = (id)v18;
      if (!v7)
      {
LABEL_33:
        [v19 appendAttributedString:v11];

        goto LABEL_34;
      }
      id v47 = (void *)v18;
      id v20 = [v11 string];
      int v46 = [v20 characterAtIndex:0];

      if ([v17 length])
      {
        uint64_t v21 = [v17 string];
        BOOL v22 = objc_msgSend(v21, "characterAtIndex:", objc_msgSend(v17, "length") - 1) != 10;
      }
      else
      {
        BOOL v22 = 1;
      }
      int v48 = objc_msgSend(v11, "__ck_isOnlyAdaptiveImageGlyphs");
      if ([v17 length])
      {
        id v23 = objc_msgSend(v17, "attributesAtIndex:effectiveRange:", objc_msgSend(v17, "length") - 1, 0);
      }
      else
      {
        id v23 = (void *)MEMORY[0x1E4F1CC08];
      }
      long long v24 = [v23 objectForKeyedSubscript:@"MediaObjectForTextAttachment"];

      uint64_t v25 = [v23 objectForKeyedSubscript:@"PluginDisplayContainer"];

      uint64_t v26 = v23;
      uint64_t v27 = [v23 objectForKeyedSubscript:@"EmbeddedRichLinkConfiguration"];

      int v28 = v48;
      if (v24) {
        int v28 = 0;
      }
      if (v28 == 1)
      {
        if (v25 | v27) {
          BOOL v29 = v46 == 10;
        }
        else {
          BOOL v29 = 1;
        }
        BOOL v30 = !v29 && v22;
        id v19 = v47;
        uint64_t v14 = v49;
        if (!v30) {
          goto LABEL_32;
        }
      }
      else
      {
        BOOL v31 = v46 != 10 && v22;
        id v19 = v47;
        uint64_t v14 = v49;
        if (!v31) {
          goto LABEL_32;
        }
      }
      uint64_t v32 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"\n"];
      [v19 appendAttributedString:v32];

LABEL_32:
      goto LABEL_33;
    }
    id v19 = v16;
  }
  else
  {
    id v19 = v11;
  }
LABEL_34:
  [(CKComposition *)self isExpirableComposition];
  id v33 = (objc_class *)objc_opt_class();
  char v34 = [(CKComposition *)self shelfPluginPayload];
  if (v12)
  {
    id v35 = v12;

    char v34 = v35;
  }
  id v36 = [(CKComposition *)self shelfMediaObject];
  char v37 = v19;
  if (v14)
  {
    id v38 = v14;

    id v36 = v38;
  }
  id v39 = [v33 alloc];
  id v40 = [(CKComposition *)self subject];
  uint64_t v41 = [(CKComposition *)self bizIntent];
  id v42 = [(CKComposition *)self proofreadingInfo];
  id v15 = (CKComposition *)[v39 initWithText:v37 subject:v40 shelfPluginPayload:v34 bizIntent:v41 shelfMediaObject:v36 proofreadingInfo:v42];

  id v43 = [(CKComposition *)self expressiveSendStyleID];
  [(CKComposition *)v15 setExpressiveSendStyleID:v43];

  [(CKComposition *)v15 setShouldHideClearPluginButton:[(CKComposition *)self shouldHideClearPluginButton]];
  long long v44 = [(CKComposition *)self sendLaterPluginInfo];
  [(CKComposition *)v15 setSendLaterPluginInfo:v44];

  uint64_t v14 = v49;
LABEL_39:

  return v15;
}

- (CKComposition)compositionWithExpressiveSendStyleID:(id)a3
{
  return self;
}

+ (id)compositionForWritingToolsText:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = (void *)static CKComposition.composition(forWritingToolsText:)(v4);

  return v5;
}

void __54__CKComposition_UIPasteboard__pasteboardItemProviders__block_invoke_cold_1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *long long buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_18EF18000, log, OS_LOG_TYPE_ERROR, "Did not have NSAdaptiveImageGlyph for CKEmojiImageMediaObject in CKComposition", buf, 2u);
}

void __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_216_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Failed to weak link either SWCollaborationMetadataForDocumentURL or FPCollaborationMetadataForDocumentURL_Preliminary. Cannot retrieve collaboration metadata.", v2, v3, v4, v5, v6);
}

void __142__CKComposition_UIPasteboard___createPluginPayloadCompositionFromFileItemProvider_builderContext_collaborationShareOptions_completionHandler___block_invoke_223_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 localizedDescription];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_18EF18000, a2, OS_LOG_TYPE_ERROR, "Received an error from LSClaimBinding: %@", (uint8_t *)&v4, 0xCu);
}

void __130__CKComposition_UIPasteboard__createPluginPayloadCompositionFromCloudKitItemProvider_collaborationShareOptions_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  BOOL v7 = [a2 localizedDescription];
  int v8 = 138412546;
  int v9 = v6;
  __int16 v10 = 2112;
  id v11 = v7;
  _os_log_error_impl(&dword_18EF18000, a3, OS_LOG_TYPE_ERROR, "Failed to load object of class %@ with error: %@", (uint8_t *)&v8, 0x16u);
}

void __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_11_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Could not load media payload from item provider", v2, v3, v4, v5, v6);
}

void __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_11_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Emoji sticker dragged to entry view, inserting emoji text instead of sticker", v2, v3, v4, v5, v6);
}

void __96__CKComposition_UIPasteboard__requestMediaObjectForItemProvider_type_builderContext_completion___block_invoke_11_cold_3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Did not find sticker in sticker store, using in-memory sticker representation instead (some representations may be missing).", v2, v3, v4, v5, v6);
}

+ (void)compositionWithShelfPluginPayload:(uint64_t)a1 completionHandler:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18EF18000, a2, OS_LOG_TYPE_ERROR, "Failed to get a URL appRecord : %@", (uint8_t *)&v2, 0xCu);
}

@end