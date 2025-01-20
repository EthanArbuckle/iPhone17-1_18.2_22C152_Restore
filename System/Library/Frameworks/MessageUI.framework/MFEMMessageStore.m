@interface MFEMMessageStore
+ (id)headersForDraftRestoration;
- (BOOL)_isDisplayableImageContentItem:(id)a3;
- (BOOL)bodyFetchRequiresNetworkActivity;
- (BOOL)shouldDownloadBodyDataForMessage:(id)a3;
- (BOOL)skipAttachmentDownload;
- (Class)messageClass;
- (EMContentRepresentation)bodyRepresentation;
- (EMMessage)message;
- (MFEMMessageStore)initWithEMMessage:(id)a3 messageClass:(Class)a4 mailboxUid:(id)a5 skipAttachmentDownload:(BOOL)a6;
- (MFMailMessage)legacyMessage;
- (MFMailboxUid)mailbox;
- (MailAccount)account;
- (NSData)bodyHTMLData;
- (NSMutableDictionary)contentIDsToContentItems;
- (NSMutableDictionary)contentIDsToRepresentations;
- (NSString)mimeBoundary;
- (id)_markupStringForDisplayForContentItem:(id)a3;
- (id)_requestMessageContentRepresentationFetchIfNotAvailable:(BOOL)a3;
- (id)bodyForMessage:(id)a3 fetchIfNotAvailable:(BOOL)a4 updateFlags:(BOOL)a5;
- (id)dataForMimePart:(id)a3 inRange:(_NSRange)a4 isComplete:(BOOL *)a5 downloadIfNecessary:(BOOL)a6 didDownload:(BOOL *)a7;
- (id)headerDataForMessage:(id)a3 downloadIfNecessary:(BOOL)a4;
- (id)storageLocationForAttachment:(id)a3 withMessage:(id)a4;
- (id)storeData:(id)a3 forMimePart:(id)a4 isComplete:(BOOL)a5;
- (void)contentObjectID:(id)a3 generateHTMLSnippetsForMailDropContentItems:(id)a4 completionHandler:(id)a5;
- (void)contentObjectID:(id)a3 generateHTMLSnippetsForRelatedContentItems:(id)a4 completionHandler:(id)a5;
- (void)contentObjectID:(id)a3 placeholderHTMLForEmptyContentWithCompletionHandler:(id)a4;
- (void)dealloc;
- (void)setBodyHTMLData:(id)a3;
- (void)setBodyRepresentation:(id)a3;
- (void)setContentIDsToContentItems:(id)a3;
- (void)setContentIDsToRepresentations:(id)a3;
- (void)setMessage:(id)a3;
- (void)setMessageClass:(Class)a3;
- (void)setMimeBoundary:(id)a3;
- (void)setSkipAttachmentDownload:(BOOL)a3;
@end

@implementation MFEMMessageStore

+ (id)headersForDraftRestoration
{
  if (headersForDraftRestoration_onceToken != -1) {
    dispatch_once(&headersForDraftRestoration_onceToken, &__block_literal_global_17);
  }
  v2 = (void *)headersForDraftRestoration_headerKeys;

  return v2;
}

void __46__MFEMMessageStore_headersForDraftRestoration__block_invoke()
{
  v4[4] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F60768];
  v4[0] = *MEMORY[0x1E4F60778];
  v4[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F606B8];
  v4[2] = *MEMORY[0x1E4F606B0];
  v4[3] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:4];
  v3 = (void *)headersForDraftRestoration_headerKeys;
  headersForDraftRestoration_headerKeys = v2;
}

- (MFEMMessageStore)initWithEMMessage:(id)a3 messageClass:(Class)a4 mailboxUid:(id)a5 skipAttachmentDownload:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)MFEMMessageStore;
  v12 = [(MFEMMessageStore *)&v18 init];
  v13 = v12;
  if (v12)
  {
    [(MFEMMessageStore *)v12 setMessageClass:a4];
    [(MFEMMessageStore *)v13 setMessage:v10];
    objc_storeStrong((id *)&v13->_mailbox, a5);
    [(MFEMMessageStore *)v13 setSkipAttachmentDownload:v6];
    v14 = (void *)[MEMORY[0x1E4F73520] copyNewMimeBoundary];
    [(MFEMMessageStore *)v13 setMimeBoundary:v14];

    v15 = [MEMORY[0x1E4F1CA60] dictionary];
    [(MFEMMessageStore *)v13 setContentIDsToContentItems:v15];

    v16 = [MEMORY[0x1E4F1CA60] dictionary];
    [(MFEMMessageStore *)v13 setContentIDsToRepresentations:v16];
  }
  return v13;
}

- (void)dealloc
{
  v3 = [(NSMutableDictionary *)self->_contentIDsToRepresentations allValues];
  [v3 makeObjectsPerformSelector:sel_cancel];

  v4.receiver = self;
  v4.super_class = (Class)MFEMMessageStore;
  [(MFEMMessageStore *)&v4 dealloc];
}

- (MFMailMessage)legacyMessage
{
  messageClass = self->_messageClass;
  if (!messageClass)
  {
    objc_opt_class();
    objc_super v4 = (objc_class *)objc_claimAutoreleasedReturnValue();
    Class v5 = self->_messageClass;
    self->_messageClass = v4;

    messageClass = self->_messageClass;
  }
  id v6 = objc_alloc_init(messageClass);
  [v6 setMessageStore:self];

  return (MFMailMessage *)v6;
}

- (id)_requestMessageContentRepresentationFetchIfNotAvailable:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = [(MFEMMessageStore *)self bodyRepresentation];

  if (v6)
  {
    v7 = EMLogCategoryMessageLoading();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF945000, v7, OS_LOG_TYPE_DEFAULT, "Returning cached body repsentation", buf, 2u);
    }

    v8 = [(MFEMMessageStore *)self bodyRepresentation];
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
    id v9 = objc_alloc(MEMORY[0x1E4F60250]);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __76__MFEMMessageStore__requestMessageContentRepresentationFetchIfNotAvailable___block_invoke;
    v24[3] = &__block_descriptor_40_e42_v16__0___EMContentRequestOptionsBuilder__8l;
    v24[4] = v3;
    id v10 = (void *)[v9 initWithBuilder:v24];
    id v11 = [MEMORY[0x1E4F60E18] promise];
    message = self->_message;
    v13 = [v11 completionHandlerAdapter];
    id v14 = (id)[(EMMessage *)message requestRepresentationWithOptions:v10 delegate:self completionHandler:v13];

    v15 = [v11 future];
    id v23 = 0;
    v8 = [v15 result:&v23];
    id v16 = v23;

    if (v8)
    {
      os_unfair_lock_lock(p_lock);
      v17 = (void *)MEMORY[0x1E4F1C9B8];
      objc_super v18 = [v8 contentURL];
      v19 = [v17 dataWithContentsOfURL:v18 options:8 error:0];
      [(MFEMMessageStore *)self setBodyHTMLData:v19];

      [(MFEMMessageStore *)self setBodyRepresentation:v8];
      os_unfair_lock_unlock(p_lock);
    }
    else
    {
      v20 = EMLogCategoryMessageLoading();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = objc_msgSend(v16, "ef_publicDescription");
        [(MFEMMessageStore *)v21 _requestMessageContentRepresentationFetchIfNotAvailable:v20];
      }
    }
  }

  return v8;
}

void __76__MFEMMessageStore__requestMessageContentRepresentationFetchIfNotAvailable___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setRequestedRepresentation:*MEMORY[0x1E4F5FCA0]];
  [v4 setNetworkUsage:*(void *)(a1 + 32)];
  BOOL v3 = +[MFEMMessageStore headersForDraftRestoration];
  [v4 setRequestedHeaderKeys:v3];
}

- (id)headerDataForMessage:(id)a3 downloadIfNecessary:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = objc_alloc_init(MEMORY[0x1E4F73550]);
  v7 = NSString;
  v8 = [(MFEMMessageStore *)self mimeBoundary];
  id v9 = [v7 stringWithFormat:@"multipart/related boundary=\"%@\"", v8];;
  [v6 setHeader:v9 forKey:*MEMORY[0x1E4F60698]];

  id v10 = [(EMMessage *)self->_message subject];
  uint64_t v11 = [v10 subjectString];

  v37 = (void *)v11;
  if (v11) {
    [v6 setHeader:v11 forKey:*MEMORY[0x1E4F60738]];
  }
  v38 = [(MFEMMessageStore *)self _requestMessageContentRepresentationFetchIfNotAvailable:v4];
  if (v38)
  {
    v12 = [v38 publicMessageURL];
    v13 = [v12 resourceSpecifier];
    id v14 = [v13 stringByRemovingPercentEncoding];
    [v6 setHeader:v14 forKey:*MEMORY[0x1E4F606F0]];

    v15 = [v38 requestedHeaders];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v16 = [v15 headerKeys];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v40 != v18) {
            objc_enumerationMutation(v16);
          }
          uint64_t v20 = *(void *)(*((void *)&v39 + 1) + 8 * i);
          v21 = [v15 headersForKey:v20];
          if (v21) {
            [v6 setHeader:v21 forKey:v20];
          }
        }
        uint64_t v17 = [v16 countByEnumeratingWithState:&v39 objects:v43 count:16];
      }
      while (v17);
    }
  }
  v22 = [(EMMessage *)self->_message senderList];
  id v23 = objc_msgSend(v22, "ef_map:", &__block_literal_global_33);
  [v6 setAddressListForSender:v23];

  v24 = [(EMMessage *)self->_message toList];
  v25 = objc_msgSend(v24, "ef_map:", &__block_literal_global_33);
  [v6 setAddressListForTo:v25];

  uint64_t v26 = [(EMMessage *)self->_message ccList];
  v27 = objc_msgSend(v26, "ef_map:", &__block_literal_global_33);
  [v6 setAddressListForCc:v27];

  v28 = [(EMMessage *)self->_message bccList];
  v29 = objc_msgSend(v28, "ef_map:", &__block_literal_global_33);
  [v6 setAddressListForBcc:v29];

  v30 = [v38 replyToList];
  [v6 setAddressListForReplyTo:v30];

  v31 = [(EMMessage *)self->_message date];
  v32 = objc_msgSend(v31, "ec_descriptionForMimeHeaders");
  [v6 setHeader:v32 forKey:*MEMORY[0x1E4F606A0]];

  v33 = [(EMMessage *)self->_message documentID];
  v34 = [v33 UUIDString];

  if (v34) {
    [v6 setHeader:v34 forKey:*MEMORY[0x1E4F60780]];
  }
  v35 = [v6 encodedHeaders];

  return v35;
}

id __61__MFEMMessageStore_headerDataForMessage_downloadIfNecessary___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 stringValue];

  return v2;
}

- (id)bodyForMessage:(id)a3 fetchIfNotAvailable:(BOOL)a4 updateFlags:(BOOL)a5
{
  BOOL v5 = a4;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v23 = a3;
  id v25 = objc_alloc_init(MEMORY[0x1E4F73520]);
  id v31 = objc_alloc_init(MEMORY[0x1E4F77BE0]);
  [v25 setMessage:v23];
  [v25 setTopLevelPart:v31];
  [v31 setMimeBody:v25];
  uint64_t v26 = [(MFEMMessageStore *)self _requestMessageContentRepresentationFetchIfNotAvailable:v5];
  v24 = [(MFEMMessageStore *)self mimeBoundary];
  [v31 setType:@"multipart"];
  [v31 setSubtype:@"related"];
  [v31 setBodyParameter:v24 forKey:@"boundary"];
  id v27 = objc_alloc_init(MEMORY[0x1E4F77BE0]);
  [v27 setType:@"text"];
  [v27 setSubtype:@"html"];
  v7 = [(MFEMMessageStore *)self bodyHTMLData];
  objc_msgSend(v27, "setRange:", 0, objc_msgSend(v7, "length"));

  [v31 addSubpart:v27];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  [v26 relatedContentItems];
  v30 = self;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v8)
  {
    uint64_t v29 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v33 != v29) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        id v11 = objc_alloc_init(MEMORY[0x1E4F77BE0]);
        v12 = [v10 type];
        v13 = [v12 preferredMIMEType];

        if (!v13
          || (uint64_t v14 = [v13 rangeOfString:@"/"], v14 == 0x7FFFFFFFFFFFFFFFLL)
          || [v13 length] <= (unint64_t)(v14 + 1))
        {
          v15 = @"application";
          id v16 = @"octet-stream";
        }
        else
        {
          v15 = [v13 substringToIndex:v14];
          id v16 = [v13 substringFromIndex:v14 + 1];
        }
        [v11 setType:v15];
        [v11 setSubtype:v16];
        uint64_t v17 = [v10 contentID];
        [v11 setContentID:v17];

        [v11 setDisposition:@"attachment"];
        uint64_t v18 = [v10 displayName];
        [v11 setDispositionParameter:v18 forKey:@"filename"];

        objc_msgSend(v11, "setRange:", 0, objc_msgSend(v10, "dataTransferByteCount"));
        [v11 setContentTransferEncoding:@"binary"];
        [v31 addSubpart:v11];
        v19 = [(MFEMMessageStore *)v30 contentIDsToContentItems];
        uint64_t v20 = [v10 contentID];
        [v19 setObject:v10 forKeyedSubscript:v20];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v8);
  }

  v21 = [v26 securityInformation];
  objc_msgSend(v25, "setIsEncrypted:", objc_msgSend(v21, "isEncrypted"));

  return v25;
}

- (id)dataForMimePart:(id)a3 inRange:(_NSRange)a4 isComplete:(BOOL *)a5 downloadIfNecessary:(BOOL)a6 didDownload:(BOOL *)a7
{
  BOOL v7 = a6;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  if ([v10 isAttachment])
  {
    if ((v7 & ~[(MFEMMessageStore *)self skipAttachmentDownload]) != 0) {
      uint64_t v11 = 2;
    }
    else {
      uint64_t v11 = 0;
    }
    v12 = [v10 contentID];
    v13 = [(MFEMMessageStore *)self contentIDsToContentItems];
    uint64_t v14 = [v13 objectForKeyedSubscript:v12];

    v15 = EMLogCategoryMessageLoading();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = objc_msgSend(v14, "ef_publicDescription");
      uint64_t v17 = [v14 mailDropMetadata];
      *(_DWORD *)buf = 138544130;
      long long v42 = v16;
      __int16 v43 = 1024;
      BOOL v44 = v7;
      __int16 v45 = 1024;
      BOOL v46 = v17 != 0;
      __int16 v47 = 2048;
      uint64_t v48 = v11;
      _os_log_impl(&dword_1AF945000, v15, OS_LOG_TYPE_DEFAULT, "Attempting to request content representation for contentItem: %{public}@, download: %{BOOL}d, isMaildrop: %{BOOL}d, networkUsage: %ld", buf, 0x22u);
    }
    if (v14
      && ([v14 mailDropMetadata],
          uint64_t v18 = objc_claimAutoreleasedReturnValue(),
          BOOL v19 = v18 == 0,
          v18,
          v19))
    {
      p_lock = &self->_lock;
      os_unfair_lock_lock(&self->_lock);
      v24 = [(MFEMMessageStore *)self contentIDsToRepresentations];
      id v25 = [v24 objectForKeyedSubscript:v12];

      if (!v25)
      {
        id v26 = objc_alloc(MEMORY[0x1E4F60250]);
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __87__MFEMMessageStore_dataForMimePart_inRange_isComplete_downloadIfNecessary_didDownload___block_invoke;
        v40[3] = &__block_descriptor_40_e42_v16__0___EMContentRequestOptionsBuilder__8l;
        v40[4] = v11;
        id v27 = (void *)[v26 initWithBuilder:v40];
        v28 = [MEMORY[0x1E4F60E18] promise];
        uint64_t v29 = [v28 completionHandlerAdapter];
        id v30 = (id)[v14 requestRepresentationWithOptions:v27 completionHandler:v29];

        id v25 = [v28 future];
        id v31 = [(MFEMMessageStore *)self contentIDsToRepresentations];
        [v31 setObject:v25 forKeyedSubscript:v12];
      }
      os_unfair_lock_unlock(p_lock);
      id v39 = 0;
      long long v32 = [v25 result:&v39];
      id v33 = v39;
      if (v32)
      {
        char v34 = [v32 hasMoreContent];
        long long v35 = (void *)MEMORY[0x1E4F1C9B8];
        v36 = [v32 contentURL];
        uint64_t v20 = [v35 dataWithContentsOfURL:v36 options:8 error:0];
        char v21 = v34 ^ 1;
      }
      else
      {
        v36 = EMLogCategoryMessageLoading();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          uint64_t v37 = objc_msgSend(v33, "ef_publicDescription");
          -[MFEMMessageStore dataForMimePart:inRange:isComplete:downloadIfNecessary:didDownload:](v37, buf, v36);
        }
        uint64_t v20 = 0;
        char v21 = 1;
      }
    }
    else
    {
      uint64_t v20 = 0;
      char v21 = 1;
    }
    if (a5) {
      *a5 = v21;
    }
  }
  else
  {
    if (a5)
    {
      v22 = [(MFEMMessageStore *)self bodyRepresentation];
      *a5 = [v22 hasMoreContent] ^ 1;
    }
    uint64_t v20 = [(MFEMMessageStore *)self bodyHTMLData];
  }

  return v20;
}

void __87__MFEMMessageStore_dataForMimePart_inRange_isComplete_downloadIfNecessary_didDownload___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setRequestedRepresentation:*MEMORY[0x1E4F5FCB0]];
  [v4 setNetworkUsage:*(void *)(a1 + 32)];
  BOOL v3 = +[MFEMMessageStore headersForDraftRestoration];
  [v4 setRequestedHeaderKeys:v3];
}

- (BOOL)bodyFetchRequiresNetworkActivity
{
  return 1;
}

- (void)contentObjectID:(id)a3 generateHTMLSnippetsForRelatedContentItems:(id)a4 completionHandler:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  uint64_t v8 = (void (**)(id, void *, void))a5;
  id v9 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v15 = -[MFEMMessageStore _markupStringForDisplayForContentItem:](self, "_markupStringForDisplayForContentItem:", v14, (void)v17);
        id v16 = [v14 contentID];
        [v9 setObject:v15 forKeyedSubscript:v16];
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  v8[2](v8, v9, 0);
}

- (void)contentObjectID:(id)a3 generateHTMLSnippetsForMailDropContentItems:(id)a4 completionHandler:(id)a5
{
}

- (void)contentObjectID:(id)a3 placeholderHTMLForEmptyContentWithCompletionHandler:(id)a4
{
}

- (id)_markupStringForDisplayForContentItem:(id)a3
{
  v34[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [v4 contentID];
  if ((int)[v4 exchangeEventUID] <= 0)
  {
    if (([v4 isAvailableLocally] & 1) != 0
      || ![(MFEMMessageStore *)self skipAttachmentDownload])
    {
      if ([(MFEMMessageStore *)self _isDisplayableImageContentItem:v4])
      {
        v33[0] = @"src";
        uint64_t v11 = (void *)MFCreateURLForContentID();
        v33[1] = @"id";
        v34[0] = v11;
        v34[1] = v5;
        uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];

        id v6 = [MEMORY[0x1E4F60D78] htmlSnippetWithTag:@"img" includeTrailingTag:0 attributes:v12];
      }
      else
      {
        uint64_t v12 = [v4 displayName];
        v13 = [MEMORY[0x1E4F28B50] mainBundle];
        uint64_t v14 = [v13 localizedStringForKey:@"UNAVAILABLE" value:&stru_1F0817A00 table:@"Main"];

        uint64_t v15 = MFCreateURLForContentID();
        id v16 = (void *)v15;
        if (v12 && v14 && v5 && v15)
        {
          v31[0] = @"title";
          v31[1] = @"subtitle";
          v32[0] = v12;
          v32[1] = v14;
          v31[2] = @"id";
          v31[3] = @"src";
          v32[2] = v5;
          v32[3] = v15;
          long long v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:4];
          id v6 = [MEMORY[0x1E4F60D78] htmlSnippetWithTag:@"attachment" includeTrailingTag:1 attributes:v17];
        }
        else
        {
          long long v17 = EMLogCategoryMessageLoading();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
          {
            long long v19 = [MEMORY[0x1E4F60E00] partiallyRedactedStringForString:v12];
            long long v20 = objc_msgSend(v4, "ef_publicDescription");
            *(_DWORD *)buf = 138544386;
            uint64_t v22 = v19;
            __int16 v23 = 2114;
            v24 = v14;
            __int16 v25 = 2114;
            id v26 = v5;
            __int16 v27 = 2114;
            v28 = v16;
            __int16 v29 = 2114;
            id v30 = v20;
            _os_log_fault_impl(&dword_1AF945000, v17, OS_LOG_TYPE_FAULT, "Error creating markup string: title: %{public}@, subtitle: %{public}@, id: %{public}@, URL: %{public}@, contentItem: %{public}@", buf, 0x34u);
          }
          id v6 = @"<span></span>";
        }
      }
    }
    else
    {
      id v7 = NSString;
      uint64_t v8 = [v4 displayName];
      id v9 = [v7 stringWithFormat:@"<%@>", v8];
      id v10 = objc_msgSend(v9, "ef_stringByEscapingForXML");
      id v6 = [v7 stringWithFormat:@"<DIV>%@</DIV>", v10];
    }
  }
  else
  {
    id v6 = @"<span></span>";
  }

  return v6;
}

- (BOOL)_isDisplayableImageContentItem:(id)a3
{
  BOOL v3 = [a3 type];
  if (([v3 conformsToType:*MEMORY[0x1E4F44410]] & 1) != 0
    || ([v3 conformsToType:*MEMORY[0x1E4F44460]] & 1) != 0
    || ([v3 conformsToType:*MEMORY[0x1E4F443D0]] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 conformsToType:*MEMORY[0x1E4F44400]];
  }

  return v4;
}

- (MailAccount)account
{
  uint64_t v2 = [(MFEMMessageStore *)self legacyMessage];
  BOOL v3 = [v2 account];

  return (MailAccount *)v3;
}

- (id)storageLocationForAttachment:(id)a3 withMessage:(id)a4
{
  return 0;
}

- (BOOL)shouldDownloadBodyDataForMessage:(id)a3
{
  return 0;
}

- (id)storeData:(id)a3 forMimePart:(id)a4 isComplete:(BOOL)a5
{
  id v5 = a3;

  return v5;
}

- (MFMailboxUid)mailbox
{
  return self->_mailbox;
}

- (EMMessage)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (NSString)mimeBoundary
{
  return self->_mimeBoundary;
}

- (void)setMimeBoundary:(id)a3
{
}

- (NSData)bodyHTMLData
{
  return self->_bodyHTMLData;
}

- (void)setBodyHTMLData:(id)a3
{
}

- (Class)messageClass
{
  return self->_messageClass;
}

- (void)setMessageClass:(Class)a3
{
}

- (EMContentRepresentation)bodyRepresentation
{
  return self->_bodyRepresentation;
}

- (void)setBodyRepresentation:(id)a3
{
}

- (BOOL)skipAttachmentDownload
{
  return self->_skipAttachmentDownload;
}

- (void)setSkipAttachmentDownload:(BOOL)a3
{
  self->_skipAttachmentDownload = a3;
}

- (NSMutableDictionary)contentIDsToRepresentations
{
  return self->_contentIDsToRepresentations;
}

- (void)setContentIDsToRepresentations:(id)a3
{
}

- (NSMutableDictionary)contentIDsToContentItems
{
  return self->_contentIDsToContentItems;
}

- (void)setContentIDsToContentItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentIDsToContentItems, 0);
  objc_storeStrong((id *)&self->_contentIDsToRepresentations, 0);
  objc_storeStrong((id *)&self->_bodyRepresentation, 0);
  objc_storeStrong((id *)&self->_messageClass, 0);
  objc_storeStrong((id *)&self->_bodyHTMLData, 0);
  objc_storeStrong((id *)&self->_mimeBoundary, 0);
  objc_storeStrong((id *)&self->_message, 0);

  objc_storeStrong((id *)&self->_mailbox, 0);
}

- (void)_requestMessageContentRepresentationFetchIfNotAvailable:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1AF945000, log, OS_LOG_TYPE_ERROR, "Error getting message content representation: %{public}@", buf, 0xCu);
}

- (void)dataForMimePart:(os_log_t)log inRange:isComplete:downloadIfNecessary:didDownload:.cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1AF945000, log, OS_LOG_TYPE_ERROR, "Error getting attachment content representation: %{public}@", buf, 0xCu);
}

@end