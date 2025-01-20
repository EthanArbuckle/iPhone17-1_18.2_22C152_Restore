@interface _MFMailCompositionContext
+ (id)log;
+ (id)processMessageBody:(id)a3 asHTML:(BOOL)a4;
- (BOOL)ckShareAllowOthersToInvite;
- (BOOL)hasDuetDonationContext;
- (BOOL)includeAttachments;
- (BOOL)includeAttachmentsWhenAdding;
- (BOOL)isHTML;
- (BOOL)isLoadingMessageData;
- (BOOL)isQuickReply;
- (BOOL)isUsingDefaultAccount;
- (BOOL)loadRest;
- (BOOL)originatingFromAttachmentMarkup;
- (BOOL)prefersFirstLineSelection;
- (BOOL)showContentImmediately;
- (BOOL)showKeyboardImmediately;
- (CKContainerSetupInfo)ckContainerSetupInfo;
- (CKShare)ckShare;
- (EFFuture)rawContentRepresentation;
- (EFScheduler)observationScheduler;
- (EMMessage)originalMessage;
- (FPSandboxingURLWrapper)sharingSandboxingURLWrapper;
- (MFAttachmentCompositionContext)attachmentContext;
- (MFAttachmentManager)attachmentManager;
- (MFComposeWebView)composeWebView;
- (MFMailCompositionValues)compositionValues;
- (MFMailMessage)legacyMessage;
- (MFMessageLoadingContext)loadingContext;
- (NSArray)UTITypes;
- (NSArray)bccRecipients;
- (NSArray)ccRecipients;
- (NSArray)cloudPhotoIDs;
- (NSArray)contentText;
- (NSArray)contentURLs;
- (NSArray)originalContent;
- (NSArray)photoIDs;
- (NSArray)toRecipients;
- (NSData)serializedMailboxObjectID;
- (NSData)serializedMessageObjectID;
- (NSDate)sendLaterDate;
- (NSDictionary)deferredActionUserInfo;
- (NSMutableArray)contentVariations;
- (NSMutableArray)deferredAttachments;
- (NSString)attachmentToMarkupContentID;
- (NSString)autosaveIdentifier;
- (NSString)contentVariationAttachmentCID;
- (NSString)contextID;
- (NSString)draftSubject;
- (NSString)from;
- (NSString)hideMyEmailFrom;
- (NSString)messageBody;
- (NSString)originatingBundleID;
- (NSString)preferredSendingEmailAddress;
- (NSString)remoteDelegateIdentifier;
- (NSString)shareSheetSessionID;
- (NSString)subject;
- (NSURL)mailtoURL;
- (_MFMailCompositionContext)init;
- (_MFMailCompositionContext)initWithComposeType:(int64_t)a3;
- (_MFMailCompositionContext)initWithComposeType:(int64_t)a3 RFC822Data:(id)a4;
- (_MFMailCompositionContext)initWithComposeType:(int64_t)a3 objectID:(id)a4 mailboxID:(id)a5 subject:(id)a6 autosaveID:(id)a7 messageRepository:(id)a8 mailboxProvider:(id)a9;
- (_MFMailCompositionContext)initWithComposeType:(int64_t)a3 originalMessage:(id)a4 legacyMessage:(id)a5;
- (_MFMailCompositionContext)initWithComposeType:(int64_t)a3 originalMessage:(id)a4 legacyMessage:(id)a5 isEML:(BOOL)a6;
- (_MFMailCompositionContext)initWithCompositionValueRepresentation:(id)a3 hostApplicationBundleIdentifier:(id)a4;
- (_MFMailCompositionContext)initWithCompositionValues:(id)a3 hostApplicationBundleIdentifier:(id)a4;
- (_MFMailCompositionContext)initWithCompositionValues:(id)a3 hostApplicationBundleIdentifier:(id)a4 messageRepository:(id)a5 mailboxProvider:(id)a6;
- (_MFMailCompositionContext)initWithHandoffActivityPayload:(id)a3;
- (_MFMailCompositionContext)initWithOpenMailComposeContext:(id)a3;
- (_MFMailCompositionContext)initWithURL:(id)a3;
- (_MFMailCompositionContext)initWithURL:(id)a3 composeType:(int64_t)a4 originalMessage:(id)a5 legacyMessage:(id)a6;
- (_MFMailCompositionContext)initWithURL:(id)a3 composeType:(int64_t)a4 originalMessage:(id)a5 legacyMessage:(id)a6 isEML:(BOOL)a7;
- (_MFMailCompositionContextDelegate)delegate;
- (id)addAttachmentData:(id)a3 mimeType:(id)a4 fileName:(id)a5;
- (id)addAttachmentData:(id)a3 mimeType:(id)a4 fileName:(id)a5 contentID:(id)a6;
- (id)addAttachmentDataItemProvider:(id)a3 mimeType:(id)a4 filename:(id)a5 contentID:(id)a6;
- (id)attachments;
- (id)initDraftRestoreOfMessage:(id)a3 legacyMessage:(id)a4;
- (id)initDraftRestoreOfMessage:(id)a3 legacyMessage:(id)a4 draftSubject:(id)a5;
- (id)initForwardOfMessage:(id)a3 legacyMessage:(id)a4;
- (id)initForwardOfMessage:(id)a3 legacyMessage:(id)a4 isEML:(BOOL)a5;
- (id)initOutboxRestoreOfMessage:(id)a3 legacyMessage:(id)a4;
- (id)initRecoveredAutosavedMessageWithIdentifier:(id)a3 draftSubject:(id)a4 composeType:(int64_t)a5 messageRepository:(id)a6 originalMessageObjectID:(id)a7;
- (id)initRecoveredAutosavedMessageWithIdentifier:(id)a3 draftSubject:(id)a4 messageRepository:(id)a5 originalMessageObjectID:(id)a6;
- (id)initReplyAllToMessage:(id)a3 legacyMessage:(id)a4;
- (id)initReplyAllToMessage:(id)a3 legacyMessage:(id)a4 isEML:(BOOL)a5;
- (id)initReplyToMessage:(id)a3 legacyMessage:(id)a4;
- (id)initReplyToMessage:(id)a3 legacyMessage:(id)a4 isEML:(BOOL)a5;
- (id)initSendAgainDraftOfMessage:(id)a3 legacyMessage:(id)a4;
- (int)sourceAccountManagement;
- (int64_t)ckSharePermissionType;
- (int64_t)composeType;
- (int64_t)defaultContentVariationIndex;
- (int64_t)deferredAction;
- (unint64_t)caretPosition;
- (unint64_t)sendLaterContext;
- (unint64_t)signpostID;
- (void)_loadMessageWithAutosaveIdentifier:(id)a3 messageRepository:(id)a4 originalMessageObjectID:(id)a5;
- (void)_loadMessageWithObjectID:(id)a3 mailboxObjectID:(id)a4 messageRepository:(id)a5 mailboxProvider:(id)a6;
- (void)_notifyDidFinishLoadingWithLegacyMessage:(id)a3;
- (void)collection:(id)a3 replacedExistingItemID:(id)a4 withNewItemID:(id)a5;
- (void)dealloc;
- (void)insertAttachmentWithData:(id)a3 fileName:(id)a4 mimeType:(id)a5 contentID:(id)a6;
- (void)insertAttachmentWithURL:(id)a3;
- (void)insertDeferredAttachmentsIntoComposeWebView:(id)a3;
- (void)removeAttachment:(id)a3;
- (void)setAttachmentToMarkupContentID:(id)a3;
- (void)setAutosaveIdentifier:(id)a3;
- (void)setBccRecipients:(id)a3;
- (void)setCaretPosition:(unint64_t)a3;
- (void)setCcRecipients:(id)a3;
- (void)setCkContainerSetupInfo:(id)a3;
- (void)setCkShare:(id)a3;
- (void)setCkShareAllowOthersToInvite:(BOOL)a3;
- (void)setCkSharePermissionType:(int64_t)a3;
- (void)setCloudPhotoIDs:(id)a3;
- (void)setComposeType:(int64_t)a3;
- (void)setComposeWebView:(id)a3;
- (void)setCompositionValues:(id)a3;
- (void)setContentText:(id)a3;
- (void)setContentURLs:(id)a3;
- (void)setContentVariationAttachmentCID:(id)a3;
- (void)setContentVariations:(id)a3;
- (void)setDefaultContentVariationIndex:(int64_t)a3;
- (void)setDeferredAction:(int64_t)a3;
- (void)setDeferredActionUserInfo:(id)a3;
- (void)setDeferredAttachments:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFrom:(id)a3;
- (void)setHideMyEmailFrom:(id)a3;
- (void)setIncludeAttachments:(BOOL)a3;
- (void)setIncludeAttachmentsWhenAdding:(BOOL)a3;
- (void)setIsHTML:(BOOL)a3;
- (void)setIsUsingDefaultAccount:(BOOL)a3;
- (void)setLoadRest:(BOOL)a3;
- (void)setLoadingContext:(id)a3;
- (void)setMailtoURL:(id)a3;
- (void)setMessageBody:(id)a3;
- (void)setMessageBody:(id)a3 isHTML:(BOOL)a4;
- (void)setObservationScheduler:(id)a3;
- (void)setOriginalContent:(id)a3;
- (void)setOriginalMessage:(id)a3;
- (void)setOriginatingBundleID:(id)a3;
- (void)setOriginatingFromAttachmentMarkup:(BOOL)a3;
- (void)setPhotoIDs:(id)a3;
- (void)setPreferredSendingEmailAddress:(id)a3;
- (void)setPrefersFirstLineSelection:(BOOL)a3;
- (void)setQuickReply:(BOOL)a3;
- (void)setRawContentRepresentation:(id)a3;
- (void)setRemoteDelegateIdentifier:(id)a3;
- (void)setSendLaterContext:(unint64_t)a3;
- (void)setSendLaterDate:(id)a3;
- (void)setSerializedMailboxObjectID:(id)a3;
- (void)setSerializedMessageObjectID:(id)a3;
- (void)setShareSheetSessionID:(id)a3;
- (void)setSharingSandboxingURLWrapper:(id)a3;
- (void)setShowContentImmediately:(BOOL)a3;
- (void)setShowKeyboardImmediately:(BOOL)a3;
- (void)setSourceAccountManagement:(int)a3;
- (void)setSubject:(id)a3;
- (void)setToRecipients:(id)a3;
- (void)setUTITypes:(id)a3;
- (void)switchToReplyAllWithDelegate:(id)a3;
- (void)switchToReplyWithDelegate:(id)a3;
@end

@implementation _MFMailCompositionContext

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32___MFMailCompositionContext_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_5 != -1) {
    dispatch_once(&log_onceToken_5, block);
  }
  v2 = (void *)log_log_5;

  return v2;
}

- (_MFMailCompositionContext)init
{
  return [(_MFMailCompositionContext *)self initWithComposeType:0];
}

- (_MFMailCompositionContext)initWithURL:(id)a3
{
  return [(_MFMailCompositionContext *)self initWithURL:a3 composeType:0 originalMessage:0 legacyMessage:0];
}

- (_MFMailCompositionContext)initWithComposeType:(int64_t)a3
{
  return [(_MFMailCompositionContext *)self initWithComposeType:a3 originalMessage:0 legacyMessage:0];
}

- (_MFMailCompositionContext)initWithComposeType:(int64_t)a3 originalMessage:(id)a4 legacyMessage:(id)a5 isEML:(BOOL)a6
{
  return [(_MFMailCompositionContext *)self initWithURL:0 composeType:a3 originalMessage:a4 legacyMessage:a5 isEML:a6];
}

- (_MFMailCompositionContext)initWithComposeType:(int64_t)a3 originalMessage:(id)a4 legacyMessage:(id)a5
{
  return [(_MFMailCompositionContext *)self initWithURL:0 composeType:a3 originalMessage:a4 legacyMessage:a5];
}

- (_MFMailCompositionContext)initWithComposeType:(int64_t)a3 RFC822Data:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    v7 = [MEMORY[0x1E4F77BD8] messageWithRFC822Data:v6];
  }
  else
  {
    v7 = 0;
  }
  v8 = [(_MFMailCompositionContext *)self initWithURL:0 composeType:a3 originalMessage:0 legacyMessage:v7];
  v9 = v8;
  if (v7 && v8)
  {
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F77C40]) initWithMessageData:v6 parentPart:0];
    attachmentManager = v9->_attachmentManager;
    v12 = [v7 messageURL];
    [(MFAttachmentComposeManager *)attachmentManager addProvider:v10 forBaseURL:v12];
  }
  return v9;
}

- (_MFMailCompositionContext)initWithURL:(id)a3 composeType:(int64_t)a4 originalMessage:(id)a5 legacyMessage:(id)a6
{
  return [(_MFMailCompositionContext *)self initWithURL:a3 composeType:a4 originalMessage:a5 legacyMessage:a6 isEML:0];
}

- (_MFMailCompositionContext)initWithURL:(id)a3 composeType:(int64_t)a4 originalMessage:(id)a5 legacyMessage:(id)a6 isEML:(BOOL)a7
{
  v64[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  v63.receiver = self;
  v63.super_class = (Class)_MFMailCompositionContext;
  v15 = [(_MFMailCompositionContext *)&v63 init];
  v16 = v15;
  v17 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_legacyMessage, a6);
    objc_storeStrong((id *)&v16->_originalMessage, a5);
    [(_MFMailCompositionContext *)v17 setComposeType:a4];
    v18 = [v13 objectID];
    v19 = [v18 serializedRepresentation];
    [(_MFMailCompositionContext *)v17 setSerializedMessageObjectID:v19];

    v20 = MFMessageComposeLoadingSignpostLog();
    v17->_signpostID = os_signpost_id_generate(v20);

    if (v13 && !a7)
    {
      v21 = objc_msgSend(MEMORY[0x1E4F60390], "predicateForMessagesInConversation:", objc_msgSend(v13, "conversationID"));
      id v22 = objc_alloc(MEMORY[0x1E4F60418]);
      uint64_t v23 = objc_opt_class();
      v24 = [MEMORY[0x1E4F60390] sortDescriptorForDateAscending:0];
      v64[0] = v24;
      v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:1];
      v26 = (void *)[v22 initWithTargetClass:v23 predicate:v21 sortDescriptors:v25 queryOptions:0 label:@"MFMailCompositionContext"];

      id v27 = objc_alloc(MEMORY[0x1E4F60380]);
      v28 = [v13 repository];
      uint64_t v29 = [v27 initWithQuery:v26 repository:v28];
      messageList = v17->_messageList;
      v17->_messageList = (EMMessageList *)v29;

      [(EMMessageList *)v17->_messageList beginObserving:v17];
    }
    if (v14 && (unint64_t)a4 <= 9 && ((1 << a4) & 0x274) != 0)
    {
      if ([v14 sourceIsManaged]) {
        uint64_t v31 = 2;
      }
      else {
        uint64_t v31 = 1;
      }
      [(_MFMailCompositionContext *)v17 setSourceAccountManagement:v31];
    }
    if (v12)
    {
      v32 = (void *)[objc_alloc(MEMORY[0x1E4F60300]) initWithURL:v12];
      v33 = [v32 toRecipients];
      v34 = objc_msgSend(v33, "ef_map:", &__block_literal_global_25);
      [(_MFMailCompositionContext *)v17 setToRecipients:v34];

      v35 = [v32 ccRecipients];
      v36 = objc_msgSend(v35, "ef_map:", &__block_literal_global_62);
      [(_MFMailCompositionContext *)v17 setCcRecipients:v36];

      v37 = [v32 bccRecipients];
      v38 = objc_msgSend(v37, "ef_map:", &__block_literal_global_64);
      [(_MFMailCompositionContext *)v17 setBccRecipients:v38];

      v39 = [v32 subject];
      [(_MFMailCompositionContext *)v17 setSubject:v39];

      v40 = [v32 from];

      if (v40)
      {
        v41 = [v32 from];
        [(_MFMailCompositionContext *)v17 setHideMyEmailFrom:v41];
      }
      v42 = [v32 body];
      [(_MFMailCompositionContext *)v17 setMessageBody:v42 isHTML:1];
    }
    uint64_t v43 = [MEMORY[0x1E4F77B78] defaultManager];
    attachmentManager = v17->_attachmentManager;
    v17->_attachmentManager = (MFAttachmentComposeManager *)v43;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v45 = (MFAttachmentComposeManager *)objc_alloc_init(MEMORY[0x1E4F77B68]);
      v46 = v17->_attachmentManager;
      v17->_attachmentManager = v45;
    }
    if (v14)
    {
      v47 = (void *)[objc_alloc(MEMORY[0x1E4F77C40]) initWithMessage:v14];
      v48 = v17->_attachmentManager;
      v49 = [v14 messageURL];
      [(MFAttachmentComposeManager *)v48 addProvider:v47 forBaseURL:v49];
    }
    v50 = (MFAttachmentCompositionContext *)objc_alloc_init(MEMORY[0x1E4F77B70]);
    attachmentContext = v17->_attachmentContext;
    v17->_attachmentContext = v50;

    v52 = [(MFMailMessage *)v17->_legacyMessage messageURL];
    [(MFAttachmentCompositionContext *)v17->_attachmentContext setAttachmentsBaseURL:v52];

    [(MFAttachmentCompositionContext *)v17->_attachmentContext setAttachmentsManager:v17->_attachmentManager];
    [(_MFMailCompositionContext *)v17 setShowContentImmediately:1];
    [(_MFMailCompositionContext *)v17 setCaretPosition:0x7FFFFFFFFFFFFFFFLL];
    [(_MFMailCompositionContext *)v17 setDefaultContentVariationIndex:0x7FFFFFFFFFFFFFFFLL];
    id v53 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(_MFMailCompositionContext *)v17 setDeferredAttachments:v53];

    v54 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
    v55 = [v54 objectForKey:@"IncludeAttachmentReplies"];
    v56 = [v55 stringValue];

    if (v56) {
      char v57 = [v56 isEqualToString:@"IncludeAttachmentRepliesWhenAdding"];
    }
    else {
      char v57 = 1;
    }
    v17->_includeAttachmentsWhenAdding = v57;
    v58 = (void *)MEMORY[0x1E4F60F28];
    v59 = [NSString stringWithFormat:@"com.apple.mail.MFMailCompositionContext.observationScheduler"];
    uint64_t v60 = [v58 serialDispatchQueueSchedulerWithName:v59];
    observationScheduler = v17->_observationScheduler;
    v17->_observationScheduler = (EFScheduler *)v60;

    v17->_isQuickReply = 0;
  }

  return v17;
}

- (id)initRecoveredAutosavedMessageWithIdentifier:(id)a3 draftSubject:(id)a4 messageRepository:(id)a5 originalMessageObjectID:(id)a6
{
  return [(_MFMailCompositionContext *)self initRecoveredAutosavedMessageWithIdentifier:a3 draftSubject:a4 composeType:7 messageRepository:a5 originalMessageObjectID:a6];
}

- (id)initRecoveredAutosavedMessageWithIdentifier:(id)a3 draftSubject:(id)a4 composeType:(int64_t)a5 messageRepository:(id)a6 originalMessageObjectID:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v16 = [(_MFMailCompositionContext *)self initWithURL:0 composeType:a5 originalMessage:0 legacyMessage:0];
  v17 = v16;
  if (v16)
  {
    v16->_isLoadingMessageData = 1;
    objc_storeStrong((id *)&v16->_draftSubject, a4);
    [(_MFMailCompositionContext *)v17 setAutosaveIdentifier:v12];
    [(_MFMailCompositionContext *)v17 _loadMessageWithAutosaveIdentifier:v12 messageRepository:v14 originalMessageObjectID:v15];
  }

  return v17;
}

- (id)initReplyToMessage:(id)a3 legacyMessage:(id)a4
{
  return [(_MFMailCompositionContext *)self initWithComposeType:4 originalMessage:a3 legacyMessage:a4 isEML:0];
}

- (id)initReplyAllToMessage:(id)a3 legacyMessage:(id)a4
{
  return [(_MFMailCompositionContext *)self initWithComposeType:5 originalMessage:a3 legacyMessage:a4 isEML:0];
}

- (id)initForwardOfMessage:(id)a3 legacyMessage:(id)a4
{
  return [(_MFMailCompositionContext *)self initWithComposeType:6 originalMessage:a3 legacyMessage:a4 isEML:0];
}

- (id)initReplyToMessage:(id)a3 legacyMessage:(id)a4 isEML:(BOOL)a5
{
  return [(_MFMailCompositionContext *)self initWithComposeType:4 originalMessage:a3 legacyMessage:a4 isEML:a5];
}

- (id)initReplyAllToMessage:(id)a3 legacyMessage:(id)a4 isEML:(BOOL)a5
{
  return [(_MFMailCompositionContext *)self initWithComposeType:5 originalMessage:a3 legacyMessage:a4 isEML:a5];
}

- (id)initForwardOfMessage:(id)a3 legacyMessage:(id)a4 isEML:(BOOL)a5
{
  return [(_MFMailCompositionContext *)self initWithComposeType:6 originalMessage:a3 legacyMessage:a4 isEML:a5];
}

- (id)initDraftRestoreOfMessage:(id)a3 legacyMessage:(id)a4
{
  return [(_MFMailCompositionContext *)self initWithComposeType:2 originalMessage:a3 legacyMessage:a4];
}

- (id)initDraftRestoreOfMessage:(id)a3 legacyMessage:(id)a4 draftSubject:(id)a5
{
  id v9 = a5;
  v10 = [(_MFMailCompositionContext *)self initWithURL:0 composeType:2 originalMessage:a3 legacyMessage:a4];
  v11 = v10;
  if (v10)
  {
    v10->_isLoadingMessageData = 0;
    objc_storeStrong((id *)&v10->_draftSubject, a5);
  }

  return v11;
}

- (id)initSendAgainDraftOfMessage:(id)a3 legacyMessage:(id)a4
{
  return [(_MFMailCompositionContext *)self initWithComposeType:8 originalMessage:a3 legacyMessage:a4];
}

- (id)initOutboxRestoreOfMessage:(id)a3 legacyMessage:(id)a4
{
  return [(_MFMailCompositionContext *)self initWithComposeType:3 originalMessage:a3 legacyMessage:a4];
}

- (_MFMailCompositionContext)initWithHandoffActivityPayload:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F73D70]];
  id v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F73D80]];
  v7 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F73D60]];
  v8 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F73D58]];
  id v9 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F73D78]];
  v10 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F73D68]];
  v11 = [[_MFMailCompositionContext alloc] initWithComposeType:0];

  [(_MFMailCompositionContext *)v11 setShowKeyboardImmediately:1];
  if (v5) {
    [(_MFMailCompositionContext *)v11 setPreferredSendingEmailAddress:v5];
  }
  [(_MFMailCompositionContext *)v11 setToRecipients:v6];
  [(_MFMailCompositionContext *)v11 setCcRecipients:v7];
  [(_MFMailCompositionContext *)v11 setBccRecipients:v8];
  [(_MFMailCompositionContext *)v11 setSubject:v9];
  [(_MFMailCompositionContext *)v11 setMessageBody:v10 isHTML:0];

  return v11;
}

- (_MFMailCompositionContext)initWithCompositionValueRepresentation:(id)a3 hostApplicationBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [[MFMailCompositionValues alloc] initWithDictionaryRepresentation:v6];
  id v9 = [(MFMailCompositionValues *)v8 autosaveIdentifier];
  v10 = [(MFMailCompositionValues *)v8 mailtoURL];
  v11 = [(MFMailCompositionValues *)v8 subject];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v12 = [(_MFMailCompositionContext *)self initRecoveredAutosavedMessageWithIdentifier:v9 draftSubject:v11 messageRepository:0 originalMessageObjectID:0];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v12 = [(_MFMailCompositionContext *)self initWithURL:v10];
    }
    else {
      id v12 = [(_MFMailCompositionContext *)self initWithCompositionValues:v8 hostApplicationBundleIdentifier:v7];
    }
  }
  id v13 = v12;

  return v13;
}

- (_MFMailCompositionContext)initWithCompositionValues:(id)a3 hostApplicationBundleIdentifier:(id)a4
{
  return [(_MFMailCompositionContext *)self initWithCompositionValues:a3 hostApplicationBundleIdentifier:a4 messageRepository:0 mailboxProvider:0];
}

- (_MFMailCompositionContext)initWithCompositionValues:(id)a3 hostApplicationBundleIdentifier:(id)a4 messageRepository:(id)a5 mailboxProvider:(id)a6
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = -[_MFMailCompositionContext initWithComposeType:](self, "initWithComposeType:", [v12 composeType]);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_compositionValues, a3);
    objc_storeStrong((id *)&v17->_originatingBundleID, a4);
    v18 = [v12 serializedMessageObjectID];
    if (v18)
    {
      if (!v14)
      {
        v25 = [MEMORY[0x1E4F28B00] currentHandler];
        [v25 handleFailureInMethod:a2 object:v17 file:@"MFMailCompositionContext.m" lineNumber:319 description:@"Expected repository to load message"];
      }
      v19 = [MEMORY[0x1E4F603A0] objectIDFromSerializedRepresentation:v18];
      v20 = [v12 serializedMailboxObjectID];
      if (v20)
      {
        v21 = [MEMORY[0x1E4F60310] objectIDFromSerializedRepresentation:v20];
      }
      else
      {
        id v22 = MFComposeLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AF945000, v22, OS_LOG_TYPE_DEFAULT, "Mailbox object ID is not available, fallback to default", buf, 2u);
        }

        v21 = 0;
      }
      uint64_t v23 = [v12 deferredAttachments];
      [(_MFMailCompositionContext *)v17 setDeferredAttachments:v23];

      [(_MFMailCompositionContext *)v17 _loadMessageWithObjectID:v19 mailboxObjectID:v21 messageRepository:v14 mailboxProvider:v15];
    }
  }
  return v17;
}

- (_MFMailCompositionContext)initWithComposeType:(int64_t)a3 objectID:(id)a4 mailboxID:(id)a5 subject:(id)a6 autosaveID:(id)a7 messageRepository:(id)a8 mailboxProvider:(id)a9
{
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  if (v16)
  {
    if (v20) {
      goto LABEL_3;
    }
  }
  else
  {
    id v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"MFMailCompositionContext.m", 339, @"Invalid parameter not satisfying: %@", @"objectID" object file lineNumber description];

    if (v20) {
      goto LABEL_3;
    }
  }
  v28 = [MEMORY[0x1E4F28B00] currentHandler];
  [v28 handleFailureInMethod:a2, self, @"MFMailCompositionContext.m", 340, @"Invalid parameter not satisfying: %@", @"messageRepository" object file lineNumber description];

LABEL_3:
  id v22 = [(_MFMailCompositionContext *)self initWithURL:0 composeType:a3 originalMessage:0 legacyMessage:0];
  if (v22)
  {
    uint64_t v23 = +[MFComposeTypeFactory subjectFromSubject:v18 withComposeType:a3];
    [(_MFMailCompositionContext *)v22 setSubject:v23];

    [(_MFMailCompositionContext *)v22 setAutosaveIdentifier:v19];
    v24 = [v16 serializedRepresentation];
    [(_MFMailCompositionContext *)v22 setSerializedMessageObjectID:v24];

    v25 = [v17 serializedRepresentation];
    [(_MFMailCompositionContext *)v22 setSerializedMailboxObjectID:v25];

    [(_MFMailCompositionContext *)v22 _loadMessageWithObjectID:v16 mailboxObjectID:v17 messageRepository:v20 mailboxProvider:v21];
  }

  return v22;
}

- (void)_loadMessageWithObjectID:(id)a3 mailboxObjectID:(id)a4 messageRepository:(id)a5 mailboxProvider:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  self->_isLoadingMessageData = 1;
  id v12 = [a5 messageForObjectID:a3];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v13 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __104___MFMailCompositionContext__loadMessageWithObjectID_mailboxObjectID_messageRepository_mailboxProvider___block_invoke;
  v19[3] = &unk_1E5F7C518;
  objc_copyWeak(&v22, &location);
  id v14 = v11;
  id v20 = v14;
  id v15 = v10;
  id v21 = v15;
  [v12 onScheduler:v13 addSuccessBlock:v19];

  id v16 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __104___MFMailCompositionContext__loadMessageWithObjectID_mailboxObjectID_messageRepository_mailboxProvider___block_invoke_99;
  v17[3] = &unk_1E5F7C540;
  objc_copyWeak(&v18, &location);
  [v12 onScheduler:v16 addFailureBlock:v17];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

- (void)_loadMessageWithAutosaveIdentifier:(id)a3 messageRepository:(id)a4 originalMessageObjectID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v21 = v9;
  id v11 = [MEMORY[0x1E4F73B48] autosave];
  id v12 = [v11 autosavedMessageDataWithIdentifier:v8];

  id v13 = [MEMORY[0x1E4F60D70] nullFuture];
  if (_os_feature_enabled_impl()
    && EMIsGreymatterSupportedWithOverride()
    && (*(unsigned int (**)(void))(*MEMORY[0x1E4F60CE8] + 16))())
  {
    uint64_t v14 = [v9 messageForObjectID:v10];

    id v13 = (void *)v14;
  }
  id v15 = [MEMORY[0x1E4F60F28] globalAsyncSchedulerWithQualityOfService:33];
  id v16 = MFComposeLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    -[_MFMailCompositionContext _loadMessageWithAutosaveIdentifier:messageRepository:originalMessageObjectID:]((uint64_t)v8, (uint64_t)self, v16);
  }

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __106___MFMailCompositionContext__loadMessageWithAutosaveIdentifier_messageRepository_originalMessageObjectID___block_invoke;
  v25[3] = &unk_1E5F7C5E0;
  objc_copyWeak(&v28, &location);
  id v17 = v8;
  id v26 = v17;
  id v18 = v13;
  id v27 = v18;
  [v12 onScheduler:v15 addSuccessBlock:v25];
  id v19 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __106___MFMailCompositionContext__loadMessageWithAutosaveIdentifier_messageRepository_originalMessageObjectID___block_invoke_2_108;
  v22[3] = &unk_1E5F7C590;
  objc_copyWeak(&v24, &location);
  id v20 = v17;
  id v23 = v20;
  [v12 onScheduler:v19 addFailureBlock:v22];

  objc_destroyWeak(&v24);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
}

- (void)_notifyDidFinishLoadingWithLegacyMessage:(id)a3
{
  objc_storeStrong((id *)&self->_legacyMessage, a3);
  id v5 = a3;
  self->_isLoadingMessageData = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained mailCompositionContext:self didFinishLoadingMessage:0 legacyMessage:v5 error:0];
}

- (_MFMailCompositionContext)initWithOpenMailComposeContext:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v29 = a3;
  id v4 = [v29 compositionValues];
  id v5 = [v29 hostApplicationBundleIdentifier];
  id v6 = [(_MFMailCompositionContext *)self initWithCompositionValueRepresentation:v4 hostApplicationBundleIdentifier:v5];

  if (v6)
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v7 = [v29 attachments];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v34 objects:v40 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v35;
      id obj = v7;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v35 != v9) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          id v12 = [v11 data];

          if (v12)
          {
            id v13 = [v11 data];
            uint64_t v14 = [v11 mimeType];
            id v15 = [v11 fileName];
            id v16 = [(_MFMailCompositionContext *)v6 addAttachmentData:v13 mimeType:v14 fileName:v15];
          }
          else
          {
            id v17 = [v11 fileURL];

            if (v17)
            {
              id v18 = (void *)MEMORY[0x1E4F77B90];
              id v19 = [v11 fileURL];
              id v13 = [v18 securityScopedURL:v19];

              id v20 = [v13 startReadAccess];
              id v21 = [v20 lastPathComponent];
              if (![v21 length])
              {
                uint64_t v22 = [v11 fileName];

                id v21 = (void *)v22;
              }
              id v33 = 0;
              id v23 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v20 options:0 error:&v33];
              id v24 = v33;
              if (v23)
              {
                v25 = [v11 mimeType];
                id v26 = [(_MFMailCompositionContext *)v6 addAttachmentData:v23 mimeType:v25 fileName:v21];
              }
              else
              {
                v25 = MFComposeLog();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                {
                  id v27 = objc_msgSend(v24, "ef_publicDescription");
                  -[_MFMailCompositionContext initWithOpenMailComposeContext:](v27, v38, &v39, v25);
                }
              }

              [v13 stopAccess];
            }
            else
            {
              id v13 = MFComposeLog();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
                [(_MFMailCompositionContext *)&v31 initWithOpenMailComposeContext:v13];
              }
            }
          }
        }
        id v7 = obj;
        uint64_t v8 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
      }
      while (v8);
    }
  }
  return v6;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(EMMessageList *)self->_messageList stopObserving:self];
  v4.receiver = self;
  v4.super_class = (Class)_MFMailCompositionContext;
  [(_MFMailCompositionContext *)&v4 dealloc];
}

- (void)switchToReplyAllWithDelegate:(id)a3
{
  id v4 = a3;
  if ([(_MFMailCompositionContext *)self composeType] == 4)
  {
    [(_MFMailCompositionContext *)self setComposeType:5];
    +[MFComposeTypeFactory setupSwitchToReplyAllWithModel:self delegate:v4];
  }
}

- (void)switchToReplyWithDelegate:(id)a3
{
  id v4 = a3;
  if ([(_MFMailCompositionContext *)self composeType] == 5)
  {
    [(_MFMailCompositionContext *)self setComposeType:4];
    +[MFComposeTypeFactory setupSwitchToReplyWithModel:self delegate:v4];
  }
}

- (MFAttachmentManager)attachmentManager
{
  return self->_attachmentManager;
}

+ (id)processMessageBody:(id)a3 asHTML:(BOOL)a4
{
  id v5 = a3;
  id v6 = v5;
  if (v5 && !a4)
  {
    uint64_t v7 = objc_msgSend(v5, "ef_stringByEscapingForMessageBody");

    id v6 = (void *)v7;
  }

  return v6;
}

- (void)setMessageBody:(id)a3 isHTML:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  id v6 = [(id)objc_opt_class() processMessageBody:v7 asHTML:v4];
  [(_MFMailCompositionContext *)self setMessageBody:v6];

  [(_MFMailCompositionContext *)self setIsHTML:v4];
}

- (NSString)contextID
{
  return (NSString *)[(MFAttachmentCompositionContext *)self->_attachmentContext contextID];
}

- (id)addAttachmentData:(id)a3 mimeType:(id)a4 fileName:(id)a5
{
  id v5 = [(_MFMailCompositionContext *)self addAttachmentData:a3 mimeType:a4 fileName:a5 contentID:0];

  return v5;
}

- (id)addAttachmentData:(id)a3 mimeType:(id)a4 fileName:(id)a5 contentID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  attachmentManager = self->_attachmentManager;
  id v15 = [(_MFMailCompositionContext *)self contextID];
  id v16 = [(MFAttachmentComposeManager *)attachmentManager attachmentForData:v10 mimeType:v11 fileName:v12 contentID:v13 context:v15];

  return v16;
}

- (id)addAttachmentDataItemProvider:(id)a3 mimeType:(id)a4 filename:(id)a5 contentID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  attachmentManager = self->_attachmentManager;
  id v15 = [(_MFMailCompositionContext *)self contextID];
  id v16 = [(MFAttachmentComposeManager *)attachmentManager attachmentForItemProvider:v10 mimeType:v11 fileName:v12 contentID:v13 context:v15];

  return v16;
}

- (void)removeAttachment:(id)a3
{
  attachmentManager = self->_attachmentManager;
  id v4 = [a3 url];
  -[MFAttachmentComposeManager removeAttachmentForURL:](attachmentManager, "removeAttachmentForURL:");
}

- (id)attachments
{
  return (id)[(MFAttachmentCompositionContext *)self->_attachmentContext attachments];
}

- (void)insertAttachmentWithURL:(id)a3
{
  id v6 = a3;
  id v4 = [(_MFMailCompositionContext *)self composeWebView];

  if (v4)
  {
    id v5 = [(_MFMailCompositionContext *)self composeWebView];
    [v5 insertDocumentWithURL:v6 isDrawingFile:0];
  }
  else
  {
    id v5 = [(_MFMailCompositionContext *)self deferredAttachments];
    [v5 addObject:v6];
  }
}

- (void)insertAttachmentWithData:(id)a3 fileName:(id)a4 mimeType:(id)a5 contentID:(id)a6
{
  id v16 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(_MFMailCompositionContext *)self composeWebView];

  if (v13)
  {
    uint64_t v14 = [(_MFMailCompositionContext *)self composeWebView];
    [v14 insertDocumentWithData:v16 fileName:v10 mimeType:v11 contentID:v12];
  }
  else
  {
    uint64_t v14 = [(_MFMailCompositionContext *)self deferredAttachments];
    id v15 = [MEMORY[0x1E4F77B88] attachmentData:v16 fileName:v10 mimeType:v11 contentID:v12];
    [v14 addObject:v15];
  }
}

- (void)insertDeferredAttachmentsIntoComposeWebView:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(_MFMailCompositionContext *)self setComposeWebView:v4];
  id v15 = [(_MFMailCompositionContext *)self deferredAttachments];
  if ([v15 count])
  {
    [v4 setCaretPosition:0];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id obj = v15;
    uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v23 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v18 != v6) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v9 = v8;
            [v4 insertDocumentWithURL:v9 isDrawingFile:0];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v9 = v8;
              id v10 = [v9 data];
              id v11 = [v9 fileName];
              id v12 = [v9 mimeType];
              id v13 = [v9 contentID];
              [v4 insertDocumentWithData:v10 fileName:v11 mimeType:v12 contentID:v13];
            }
            else
            {
              uint64_t v9 = MFLogGeneral();
              if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v14 = [v8 className];
                -[_MFMailCompositionContext insertDeferredAttachmentsIntoComposeWebView:](v14, buf, &v22, v9);
              }
            }
          }
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v23 count:16];
      }
      while (v5);
    }
  }
}

- (BOOL)hasDuetDonationContext
{
  v3 = [(_MFMailCompositionContext *)self UTITypes];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    uint64_t v5 = [(_MFMailCompositionContext *)self photoIDs];
    if (v5)
    {
      BOOL v4 = 1;
    }
    else
    {
      uint64_t v6 = [(_MFMailCompositionContext *)self cloudPhotoIDs];
      if (v6)
      {
        BOOL v4 = 1;
      }
      else
      {
        id v7 = [(_MFMailCompositionContext *)self contentURLs];
        if (v7)
        {
          BOOL v4 = 1;
        }
        else
        {
          uint64_t v8 = [(_MFMailCompositionContext *)self contentText];
          BOOL v4 = v8 != 0;
        }
      }
    }
  }

  return v4;
}

- (void)collection:(id)a3 replacedExistingItemID:(id)a4 withNewItemID:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [(_MFMailCompositionContext *)self originalMessage];
  id v10 = [v9 itemID];
  int v11 = [v10 isEqual:v7];

  if (v11)
  {
    id v12 = MFComposeLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v17 = v7;
      __int16 v18 = 2114;
      id v19 = v8;
      _os_log_impl(&dword_1AF945000, v12, OS_LOG_TYPE_DEFAULT, "Updating message itemID for Composition Context. Old itemID: %{public}@. New itemID:%{public}@", buf, 0x16u);
    }

    id v13 = [(EMMessageList *)self->_messageList messageListItemForItemID:v8];
    uint64_t v14 = [(_MFMailCompositionContext *)self observationScheduler];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __77___MFMailCompositionContext_collection_replacedExistingItemID_withNewItemID___block_invoke;
    v15[3] = &unk_1E5F7C608;
    v15[4] = self;
    [v13 onScheduler:v14 addSuccessBlock:v15];
  }
}

- (NSURL)mailtoURL
{
  v2 = [(_MFMailCompositionContext *)self compositionValues];
  v3 = [v2 mailtoURL];

  return (NSURL *)v3;
}

- (void)setMailtoURL:(id)a3
{
  id v5 = a3;
  BOOL v4 = [(_MFMailCompositionContext *)self compositionValues];
  [v4 setMailtoURL:v5];
}

- (NSString)messageBody
{
  v2 = [(_MFMailCompositionContext *)self compositionValues];
  v3 = [v2 messageBody];

  return (NSString *)v3;
}

- (void)setMessageBody:(id)a3
{
  id v5 = a3;
  BOOL v4 = [(_MFMailCompositionContext *)self compositionValues];
  [v4 setMessageBody:v5];
}

- (NSString)from
{
  v2 = [(_MFMailCompositionContext *)self compositionValues];
  v3 = [v2 from];

  return (NSString *)v3;
}

- (void)setFrom:(id)a3
{
  id v5 = a3;
  BOOL v4 = [(_MFMailCompositionContext *)self compositionValues];
  [v4 setFrom:v5];
}

- (NSString)hideMyEmailFrom
{
  v2 = [(_MFMailCompositionContext *)self compositionValues];
  v3 = [v2 hideMyEmailFrom];

  return (NSString *)v3;
}

- (void)setHideMyEmailFrom:(id)a3
{
  id v5 = a3;
  BOOL v4 = [(_MFMailCompositionContext *)self compositionValues];
  [v4 setHideMyEmailFrom:v5];
}

- (BOOL)isHTML
{
  v2 = [(_MFMailCompositionContext *)self compositionValues];
  char v3 = [v2 isHTML];

  return v3;
}

- (void)setIsHTML:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(_MFMailCompositionContext *)self compositionValues];
  [v4 setIsHTML:v3];
}

- (NSArray)toRecipients
{
  v2 = [(_MFMailCompositionContext *)self compositionValues];
  BOOL v3 = [v2 toRecipients];

  return (NSArray *)v3;
}

- (void)setToRecipients:(id)a3
{
  id v5 = a3;
  id v4 = [(_MFMailCompositionContext *)self compositionValues];
  [v4 setToRecipients:v5];
}

- (NSArray)ccRecipients
{
  v2 = [(_MFMailCompositionContext *)self compositionValues];
  BOOL v3 = [v2 ccRecipients];

  return (NSArray *)v3;
}

- (void)setCcRecipients:(id)a3
{
  id v5 = a3;
  id v4 = [(_MFMailCompositionContext *)self compositionValues];
  [v4 setCcRecipients:v5];
}

- (NSArray)bccRecipients
{
  v2 = [(_MFMailCompositionContext *)self compositionValues];
  BOOL v3 = [v2 bccRecipients];

  return (NSArray *)v3;
}

- (void)setBccRecipients:(id)a3
{
  id v5 = a3;
  id v4 = [(_MFMailCompositionContext *)self compositionValues];
  [v4 setBccRecipients:v5];
}

- (NSString)preferredSendingEmailAddress
{
  v2 = [(_MFMailCompositionContext *)self compositionValues];
  BOOL v3 = [v2 preferredSendingEmailAddress];

  return (NSString *)v3;
}

- (void)setPreferredSendingEmailAddress:(id)a3
{
  id v5 = a3;
  id v4 = [(_MFMailCompositionContext *)self compositionValues];
  [v4 setPreferredSendingEmailAddress:v5];
}

- (BOOL)showKeyboardImmediately
{
  v2 = [(_MFMailCompositionContext *)self compositionValues];
  char v3 = [v2 showKeyboardImmediately];

  return v3;
}

- (void)setShowKeyboardImmediately:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(_MFMailCompositionContext *)self compositionValues];
  [v4 setShowKeyboardImmediately:v3];
}

- (BOOL)showContentImmediately
{
  v2 = [(_MFMailCompositionContext *)self compositionValues];
  char v3 = [v2 showContentImmediately];

  return v3;
}

- (void)setShowContentImmediately:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(_MFMailCompositionContext *)self compositionValues];
  [v4 setShowContentImmediately:v3];
}

- (int)sourceAccountManagement
{
  v2 = [(_MFMailCompositionContext *)self compositionValues];
  int v3 = [v2 sourceAccountManagement];

  return v3;
}

- (void)setSourceAccountManagement:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(_MFMailCompositionContext *)self compositionValues];
  [v4 setSourceAccountManagement:v3];
}

- (unint64_t)caretPosition
{
  v2 = [(_MFMailCompositionContext *)self compositionValues];
  unint64_t v3 = [v2 caretPosition];

  return v3;
}

- (void)setCaretPosition:(unint64_t)a3
{
  id v4 = [(_MFMailCompositionContext *)self compositionValues];
  [v4 setCaretPosition:a3];
}

- (NSArray)UTITypes
{
  v2 = [(_MFMailCompositionContext *)self compositionValues];
  unint64_t v3 = [v2 UTITypes];

  return (NSArray *)v3;
}

- (void)setUTITypes:(id)a3
{
  id v5 = a3;
  id v4 = [(_MFMailCompositionContext *)self compositionValues];
  [v4 setUTITypes:v5];
}

- (NSArray)photoIDs
{
  v2 = [(_MFMailCompositionContext *)self compositionValues];
  unint64_t v3 = [v2 photoIDs];

  return (NSArray *)v3;
}

- (void)setPhotoIDs:(id)a3
{
  id v5 = a3;
  id v4 = [(_MFMailCompositionContext *)self compositionValues];
  [v4 setPhotoIDs:v5];
}

- (NSArray)cloudPhotoIDs
{
  v2 = [(_MFMailCompositionContext *)self compositionValues];
  unint64_t v3 = [v2 cloudPhotoIDs];

  return (NSArray *)v3;
}

- (void)setCloudPhotoIDs:(id)a3
{
  id v5 = a3;
  id v4 = [(_MFMailCompositionContext *)self compositionValues];
  [v4 setCloudPhotoIDs:v5];
}

- (NSArray)contentText
{
  v2 = [(_MFMailCompositionContext *)self compositionValues];
  unint64_t v3 = [v2 contentText];

  return (NSArray *)v3;
}

- (void)setContentText:(id)a3
{
  id v5 = a3;
  id v4 = [(_MFMailCompositionContext *)self compositionValues];
  [v4 setContentText:v5];
}

- (NSArray)contentURLs
{
  v2 = [(_MFMailCompositionContext *)self compositionValues];
  unint64_t v3 = [v2 contentURLs];

  return (NSArray *)v3;
}

- (void)setContentURLs:(id)a3
{
  id v5 = a3;
  id v4 = [(_MFMailCompositionContext *)self compositionValues];
  [v4 setContentURLs:v5];
}

- (NSArray)originalContent
{
  v2 = [(_MFMailCompositionContext *)self compositionValues];
  unint64_t v3 = [v2 originalContent];

  return (NSArray *)v3;
}

- (void)setOriginalContent:(id)a3
{
  id v5 = a3;
  id v4 = [(_MFMailCompositionContext *)self compositionValues];
  [v4 setOriginalContent:v5];
}

- (NSMutableArray)contentVariations
{
  v2 = [(_MFMailCompositionContext *)self compositionValues];
  unint64_t v3 = [v2 contentVariations];

  return (NSMutableArray *)v3;
}

- (void)setContentVariations:(id)a3
{
  id v5 = a3;
  id v4 = [(_MFMailCompositionContext *)self compositionValues];
  [v4 setContentVariations:v5];
}

- (int64_t)defaultContentVariationIndex
{
  v2 = [(_MFMailCompositionContext *)self compositionValues];
  int64_t v3 = [v2 defaultContentVariationIndex];

  return v3;
}

- (void)setDefaultContentVariationIndex:(int64_t)a3
{
  id v4 = [(_MFMailCompositionContext *)self compositionValues];
  [v4 setDefaultContentVariationIndex:a3];
}

- (NSString)shareSheetSessionID
{
  v2 = [(_MFMailCompositionContext *)self compositionValues];
  int64_t v3 = [v2 shareSheetSessionID];

  return (NSString *)v3;
}

- (void)setShareSheetSessionID:(id)a3
{
  id v5 = a3;
  id v4 = [(_MFMailCompositionContext *)self compositionValues];
  [v4 setShareSheetSessionID:v5];
}

- (BOOL)isUsingDefaultAccount
{
  v2 = [(_MFMailCompositionContext *)self compositionValues];
  char v3 = [v2 isUsingDefaultAccount];

  return v3;
}

- (void)setIsUsingDefaultAccount:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(_MFMailCompositionContext *)self compositionValues];
  [v4 setIsUsingDefaultAccount:v3];
}

- (int64_t)composeType
{
  v2 = [(_MFMailCompositionContext *)self compositionValues];
  int64_t v3 = [v2 composeType];

  return v3;
}

- (void)setComposeType:(int64_t)a3
{
  id v4 = [(_MFMailCompositionContext *)self compositionValues];
  [v4 setComposeType:a3];
}

- (BOOL)prefersFirstLineSelection
{
  v2 = [(_MFMailCompositionContext *)self compositionValues];
  char v3 = [v2 prefersFirstLineSelection];

  return v3;
}

- (void)setPrefersFirstLineSelection:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(_MFMailCompositionContext *)self compositionValues];
  [v4 setPrefersFirstLineSelection:v3];
}

- (NSData)serializedMessageObjectID
{
  v2 = [(_MFMailCompositionContext *)self compositionValues];
  BOOL v3 = [v2 serializedMessageObjectID];

  return (NSData *)v3;
}

- (void)setSerializedMessageObjectID:(id)a3
{
  id v5 = a3;
  id v4 = [(_MFMailCompositionContext *)self compositionValues];
  [v4 setSerializedMessageObjectID:v5];
}

- (BOOL)includeAttachments
{
  v2 = [(_MFMailCompositionContext *)self compositionValues];
  char v3 = [v2 includeAttachments];

  return v3;
}

- (void)setIncludeAttachments:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(_MFMailCompositionContext *)self compositionValues];
  [v4 setIncludeAttachments:v3];
}

- (NSData)serializedMailboxObjectID
{
  v2 = [(_MFMailCompositionContext *)self compositionValues];
  BOOL v3 = [v2 serializedMailboxObjectID];

  return (NSData *)v3;
}

- (void)setSerializedMailboxObjectID:(id)a3
{
  id v5 = a3;
  id v4 = [(_MFMailCompositionContext *)self compositionValues];
  [v4 setSerializedMailboxObjectID:v5];
}

- (NSMutableArray)deferredAttachments
{
  v2 = [(_MFMailCompositionContext *)self compositionValues];
  BOOL v3 = [v2 deferredAttachments];

  return (NSMutableArray *)v3;
}

- (void)setDeferredAttachments:(id)a3
{
  id v5 = a3;
  id v4 = [(_MFMailCompositionContext *)self compositionValues];
  [v4 setDeferredAttachments:v5];
}

- (NSDate)sendLaterDate
{
  v2 = [(_MFMailCompositionContext *)self compositionValues];
  BOOL v3 = [v2 sendLaterDate];

  return (NSDate *)v3;
}

- (void)setSendLaterDate:(id)a3
{
  id v5 = a3;
  id v4 = [(_MFMailCompositionContext *)self compositionValues];
  [v4 setSendLaterDate:v5];
}

- (unint64_t)sendLaterContext
{
  v2 = [(_MFMailCompositionContext *)self compositionValues];
  unint64_t v3 = [v2 sendLaterContext];

  return v3;
}

- (void)setSendLaterContext:(unint64_t)a3
{
  id v4 = [(_MFMailCompositionContext *)self compositionValues];
  [v4 setSendLaterContext:a3];
}

- (FPSandboxingURLWrapper)sharingSandboxingURLWrapper
{
  v2 = [(_MFMailCompositionContext *)self compositionValues];
  unint64_t v3 = [v2 sharingSandboxingURLWrapper];

  return (FPSandboxingURLWrapper *)v3;
}

- (void)setSharingSandboxingURLWrapper:(id)a3
{
  id v5 = a3;
  id v4 = [(_MFMailCompositionContext *)self compositionValues];
  [v4 setSharingSandboxingURLWrapper:v5];
}

- (CKShare)ckShare
{
  v2 = [(_MFMailCompositionContext *)self compositionValues];
  unint64_t v3 = [v2 ckShare];

  return (CKShare *)v3;
}

- (void)setCkShare:(id)a3
{
  id v5 = a3;
  id v4 = [(_MFMailCompositionContext *)self compositionValues];
  [v4 setCkShare:v5];
}

- (CKContainerSetupInfo)ckContainerSetupInfo
{
  v2 = [(_MFMailCompositionContext *)self compositionValues];
  unint64_t v3 = [v2 ckContainerSetupInfo];

  return (CKContainerSetupInfo *)v3;
}

- (void)setCkContainerSetupInfo:(id)a3
{
  id v5 = a3;
  id v4 = [(_MFMailCompositionContext *)self compositionValues];
  [v4 setCkContainerSetupInfo:v5];
}

- (int64_t)ckSharePermissionType
{
  v2 = [(_MFMailCompositionContext *)self compositionValues];
  int64_t v3 = [v2 ckSharePermissionType];

  return v3;
}

- (void)setCkSharePermissionType:(int64_t)a3
{
  id v4 = [(_MFMailCompositionContext *)self compositionValues];
  [v4 setCkSharePermissionType:a3];
}

- (BOOL)ckShareAllowOthersToInvite
{
  v2 = [(_MFMailCompositionContext *)self compositionValues];
  char v3 = [v2 ckShareAllowOthersToInvite];

  return v3;
}

- (void)setCkShareAllowOthersToInvite:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(_MFMailCompositionContext *)self compositionValues];
  [v4 setCkShareAllowOthersToInvite:v3];
}

- (MFMailCompositionValues)compositionValues
{
  compositionValues = self->_compositionValues;
  if (!compositionValues)
  {
    id v4 = objc_alloc_init(MFMailCompositionValues);
    id v5 = self->_compositionValues;
    self->_compositionValues = v4;

    compositionValues = self->_compositionValues;
  }

  return compositionValues;
}

- (NSString)subject
{
  v2 = [(_MFMailCompositionContext *)self compositionValues];
  BOOL v3 = [v2 subject];

  return (NSString *)v3;
}

- (void)setSubject:(id)a3
{
  id v11 = a3;
  id v4 = [(_MFMailCompositionContext *)self compositionValues];
  id v5 = [v4 subject];
  char v6 = [v11 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    id v7 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
    id v8 = [v11 componentsSeparatedByCharactersInSet:v7];

    uint64_t v9 = [v8 componentsJoinedByString:@" "];
    id v10 = [(_MFMailCompositionContext *)self compositionValues];
    [v10 setSubject:v9];
  }
}

- (NSString)autosaveIdentifier
{
  BOOL v3 = [(_MFMailCompositionContext *)self compositionValues];
  id v4 = [v3 autosaveIdentifier];

  if (!v4)
  {
    id v5 = [(_MFMailCompositionContext *)self legacyMessage];
    char v6 = [v5 documentID];
    if (v6)
    {
    }
    else
    {
      id v7 = [(_MFMailCompositionContext *)self originalMessage];
      char v6 = [v7 documentID];

      if (!v6) {
        goto LABEL_6;
      }
    }
    id v8 = objc_alloc_init(MEMORY[0x1E4F29088]);
    [v8 setScheme:*MEMORY[0x1E4F5FC68]];
    [v8 setHost:@"document"];
    uint64_t v9 = NSString;
    id v10 = [v6 UUIDString];
    id v11 = [v9 stringWithFormat:@"/%@", v10];
    [v8 setPath:v11];

    id v12 = [v8 URL];
    id v13 = [v12 absoluteString];
    uint64_t v14 = [(_MFMailCompositionContext *)self compositionValues];
    [v14 setAutosaveIdentifier:v13];
  }
LABEL_6:
  id v15 = [(_MFMailCompositionContext *)self compositionValues];
  id v16 = [v15 autosaveIdentifier];

  return (NSString *)v16;
}

- (void)setAutosaveIdentifier:(id)a3
{
  id v8 = a3;
  id v4 = [(_MFMailCompositionContext *)self compositionValues];
  id v5 = [v4 autosaveIdentifier];
  char v6 = [v5 isEqualToString:v8];

  if ((v6 & 1) == 0)
  {
    id v7 = [(_MFMailCompositionContext *)self compositionValues];
    [v7 setAutosaveIdentifier:v8];
  }
}

- (void)setOriginalMessage:(id)a3
{
  id v5 = (EMMessage *)a3;
  id v8 = v5;
  if (self->_originalMessage != v5 || ([(EMMessage *)v5 isEqual:v5] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_originalMessage, a3);
    char v6 = [(EMMessage *)v8 objectID];
    id v7 = [v6 serializedRepresentation];
    [(_MFMailCompositionContext *)self setSerializedMessageObjectID:v7];
  }

  MEMORY[0x1F4181820]();
}

- (NSString)draftSubject
{
  return self->_draftSubject;
}

- (NSString)attachmentToMarkupContentID
{
  return self->_attachmentToMarkupContentID;
}

- (void)setAttachmentToMarkupContentID:(id)a3
{
}

- (BOOL)loadRest
{
  return self->_loadRest;
}

- (void)setLoadRest:(BOOL)a3
{
  self->_loadRest = a3;
}

- (BOOL)includeAttachmentsWhenAdding
{
  return self->_includeAttachmentsWhenAdding;
}

- (void)setIncludeAttachmentsWhenAdding:(BOOL)a3
{
  self->_includeAttachmentsWhenAdding = a3;
}

- (BOOL)isLoadingMessageData
{
  return self->_isLoadingMessageData;
}

- (MFMessageLoadingContext)loadingContext
{
  return self->_loadingContext;
}

- (void)setLoadingContext:(id)a3
{
}

- (BOOL)originatingFromAttachmentMarkup
{
  return self->_originatingFromAttachmentMarkup;
}

- (void)setOriginatingFromAttachmentMarkup:(BOOL)a3
{
  self->_originatingFromAttachmentMarkup = a3;
}

- (NSString)contentVariationAttachmentCID
{
  return self->_contentVariationAttachmentCID;
}

- (void)setContentVariationAttachmentCID:(id)a3
{
}

- (MFMailMessage)legacyMessage
{
  return self->_legacyMessage;
}

- (NSString)originatingBundleID
{
  return self->_originatingBundleID;
}

- (void)setOriginatingBundleID:(id)a3
{
}

- (EMMessage)originalMessage
{
  return self->_originalMessage;
}

- (EFFuture)rawContentRepresentation
{
  return self->_rawContentRepresentation;
}

- (void)setRawContentRepresentation:(id)a3
{
}

- (MFAttachmentCompositionContext)attachmentContext
{
  return self->_attachmentContext;
}

- (_MFMailCompositionContextDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_MFMailCompositionContextDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)remoteDelegateIdentifier
{
  return self->_remoteDelegateIdentifier;
}

- (void)setRemoteDelegateIdentifier:(id)a3
{
}

- (BOOL)isQuickReply
{
  return self->_quickReply;
}

- (void)setQuickReply:(BOOL)a3
{
  self->_quickReply = a3;
}

- (unint64_t)signpostID
{
  return self->_signpostID;
}

- (int64_t)deferredAction
{
  return self->_deferredAction;
}

- (void)setDeferredAction:(int64_t)a3
{
  self->_deferredAction = a3;
}

- (NSDictionary)deferredActionUserInfo
{
  return self->_deferredActionUserInfo;
}

- (void)setDeferredActionUserInfo:(id)a3
{
}

- (void)setCompositionValues:(id)a3
{
}

- (MFComposeWebView)composeWebView
{
  return self->_composeWebView;
}

- (void)setComposeWebView:(id)a3
{
  self->_composeWebView = (MFComposeWebView *)a3;
}

- (EFScheduler)observationScheduler
{
  return self->_observationScheduler;
}

- (void)setObservationScheduler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observationScheduler, 0);
  objc_storeStrong((id *)&self->_compositionValues, 0);
  objc_storeStrong((id *)&self->_deferredActionUserInfo, 0);
  objc_storeStrong((id *)&self->_remoteDelegateIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_rawContentRepresentation, 0);
  objc_storeStrong((id *)&self->_originalMessage, 0);
  objc_storeStrong((id *)&self->_originatingBundleID, 0);
  objc_storeStrong((id *)&self->_contentVariationAttachmentCID, 0);
  objc_storeStrong((id *)&self->_draftSubject, 0);
  objc_storeStrong((id *)&self->_messageList, 0);
  objc_storeStrong((id *)&self->_attachmentManager, 0);
  objc_storeStrong((id *)&self->_attachmentContext, 0);
  objc_storeStrong((id *)&self->_loadingContext, 0);
  objc_storeStrong(&self->_originalContent, 0);
  objc_storeStrong((id *)&self->_attachmentToMarkupContentID, 0);

  objc_storeStrong((id *)&self->_legacyMessage, 0);
}

- (void)_loadMessageWithAutosaveIdentifier:(uint64_t)a1 messageRepository:(uint64_t)a2 originalMessageObjectID:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_1AF945000, log, OS_LOG_TYPE_DEBUG, "Starting autosave fetch for %{public}@, self = %p", (uint8_t *)&v3, 0x16u);
}

- (void)initWithOpenMailComposeContext:(os_log_t)log .cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1AF945000, log, OS_LOG_TYPE_ERROR, "Attachment wrapper has neither data nor fileURL. Skipping attachment.", buf, 2u);
}

- (void)initWithOpenMailComposeContext:(void *)a3 .cold.2(void *a1, uint8_t *buf, void *a3, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *a3 = a1;
  _os_log_error_impl(&dword_1AF945000, log, OS_LOG_TYPE_ERROR, "Could not create attachment data: %{public}@", buf, 0xCu);
}

- (void)insertDeferredAttachmentsIntoComposeWebView:(void *)a3 .cold.1(void *a1, uint8_t *buf, void *a3, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *a3 = a1;
  _os_log_debug_impl(&dword_1AF945000, log, OS_LOG_TYPE_DEBUG, "[Attachment] Unknown deferred attachment class [%@]", buf, 0xCu);
}

@end