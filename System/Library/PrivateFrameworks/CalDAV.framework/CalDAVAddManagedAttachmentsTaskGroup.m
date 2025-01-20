@interface CalDAVAddManagedAttachmentsTaskGroup
- (BOOL)_postedLastAttachment;
- (BOOL)hadPreconditionFailure;
- (CalDAVAddManagedAttachmentsTaskGroup)initWithAccountInfoProvider:(id)a3 resourceURL:(id)a4 attachments:(id)a5 contentTypes:(id)a6 taskManager:(id)a7;
- (NSData)updatedResourcePayload;
- (NSDictionary)attachments;
- (NSDictionary)contentTypes;
- (NSDictionary)postFailureSizes;
- (NSMutableDictionary)filenamesToServerLocation;
- (NSString)previousETag;
- (NSString)previousScheduleTag;
- (NSString)updatedETag;
- (NSString)updatedScheduleTag;
- (NSURL)resourceURL;
- (id)urlWithQuery;
- (int)state;
- (void)_fetchUpdatedContent;
- (void)_finishWithError:(id)a3 state:(int)a4;
- (void)_handlePostResponse:(id)a3;
- (void)_sendAttachments;
- (void)setAttachments:(id)a3;
- (void)setContentTypes:(id)a3;
- (void)setFilenamesToServerLocation:(id)a3;
- (void)setHadPreconditionFailure:(BOOL)a3;
- (void)setPostFailureSizes:(id)a3;
- (void)setPreviousETag:(id)a3;
- (void)setPreviousScheduleTag:(id)a3;
- (void)setResourceURL:(id)a3;
- (void)setState:(int)a3;
- (void)setUpdatedETag:(id)a3;
- (void)setUpdatedResourcePayload:(id)a3;
- (void)setUpdatedScheduleTag:(id)a3;
- (void)startTaskGroup;
@end

@implementation CalDAVAddManagedAttachmentsTaskGroup

- (CalDAVAddManagedAttachmentsTaskGroup)initWithAccountInfoProvider:(id)a3 resourceURL:(id)a4 attachments:(id)a5 contentTypes:(id)a6 taskManager:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)CalDAVAddManagedAttachmentsTaskGroup;
  v15 = [(CoreDAVTaskGroup *)&v20 initWithAccountInfoProvider:a3 taskManager:a7];
  v16 = v15;
  if (v15)
  {
    [(CalDAVAddManagedAttachmentsTaskGroup *)v15 setState:0];
    [(CalDAVAddManagedAttachmentsTaskGroup *)v16 setResourceURL:v12];
    [(CalDAVAddManagedAttachmentsTaskGroup *)v16 setAttachments:v13];
    [(CalDAVAddManagedAttachmentsTaskGroup *)v16 setContentTypes:v14];
    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    filenamesToServerLocation = v16->_filenamesToServerLocation;
    v16->_filenamesToServerLocation = v17;
  }
  return v16;
}

- (void)_finishWithError:(id)a3 state:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  [(CalDAVAddManagedAttachmentsTaskGroup *)self setState:v4];
  if (v4 == 6)
  {
    v7 = [MEMORY[0x263F34B30] sharedLogging];
    v8 = [v7 logHandleForAccountInfoProvider:0];
    v9 = v8;
    if (v8 && os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      int v12 = 138543362;
      id v13 = v11;
      _os_log_impl(&dword_213CEC000, v9, OS_LOG_TYPE_ERROR, "Finishing %{public}@ early because state machine reached an unexpected state.", (uint8_t *)&v12, 0xCu);
    }
  }
  [(CoreDAVTaskGroup *)self finishCoreDAVTaskGroupWithError:v6 delegateCallbackBlock:0];
}

- (BOOL)_postedLastAttachment
{
  v3 = [(CalDAVAddManagedAttachmentsTaskGroup *)self attachments];
  unint64_t v4 = [v3 count];
  v5 = [(CalDAVAddManagedAttachmentsTaskGroup *)self filenamesToServerLocation];
  LOBYTE(v4) = v4 <= [v5 count];

  return v4;
}

- (id)urlWithQuery
{
  postURLWithQuery = self->_postURLWithQuery;
  if (!postURLWithQuery)
  {
    unint64_t v4 = NSString;
    v5 = [(CalDAVAddManagedAttachmentsTaskGroup *)self resourceURL];
    id v6 = [v4 stringWithFormat:@"%@%@", v5, @"?action=attachment-add"];

    v7 = (NSURL *)[objc_alloc(NSURL) initWithString:v6];
    v8 = self->_postURLWithQuery;
    self->_postURLWithQuery = v7;

    postURLWithQuery = self->_postURLWithQuery;
  }
  return postURLWithQuery;
}

- (void)_fetchUpdatedContent
{
  [(CalDAVAddManagedAttachmentsTaskGroup *)self setState:2];
  id v3 = objc_alloc(MEMORY[0x263F34AE0]);
  unint64_t v4 = [(CalDAVAddManagedAttachmentsTaskGroup *)self resourceURL];
  v5 = (void *)[v3 initWithURL:v4];

  id v6 = [(CoreDAVTaskGroup *)self accountInfoProvider];
  [v5 setAccountInfoProvider:v6];

  objc_initWeak(&location, v5);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __60__CalDAVAddManagedAttachmentsTaskGroup__fetchUpdatedContent__block_invoke;
  v8[3] = &unk_2641EC310;
  v8[4] = self;
  objc_copyWeak(&v9, &location);
  [v5 setCompletionBlock:v8];
  v7 = [(CoreDAVTaskGroup *)self taskManager];
  [v7 submitQueuedCoreDAVTask:v5];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __60__CalDAVAddManagedAttachmentsTaskGroup__fetchUpdatedContent__block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  unint64_t v4 = [WeakRetained responseBodyParser];
  v5 = [v4 octetStreamData];
  [*(id *)(a1 + 32) setUpdatedResourcePayload:v5];

  id v6 = objc_loadWeakRetained(v2);
  v7 = [v6 responseHeaders];
  v8 = [v7 CDVObjectForKeyCaseInsensitive:@"Schedule-Tag"];
  [*(id *)(a1 + 32) setUpdatedScheduleTag:v8];

  id v9 = objc_loadWeakRetained(v2);
  v10 = [v9 responseHeaders];
  v11 = [v10 CDVObjectForKeyCaseInsensitive:*MEMORY[0x263F34A60]];
  [*(id *)(a1 + 32) setUpdatedETag:v11];

  id v12 = objc_loadWeakRetained(v2);
  id v13 = [v12 error];
  if (v13) {
    uint64_t v14 = 3;
  }
  else {
    uint64_t v14 = 7;
  }

  v15 = *(void **)(a1 + 32);
  id v17 = objc_loadWeakRetained(v2);
  v16 = [v17 error];
  [v15 _finishWithError:v16 state:v14];
}

- (void)_handlePostResponse:(id)a3
{
  id v30 = a3;
  unint64_t v4 = [v30 error];

  if (!v4)
  {
    [(CalDAVAddManagedAttachmentsTaskGroup *)self setPreviousScheduleTag:0];
    [(CalDAVAddManagedAttachmentsTaskGroup *)self setPreviousETag:0];
    id v9 = [v30 responseHeaders];
    v10 = [v9 CDVObjectForKeyCaseInsensitive:@"Schedule-Tag"];
    [(CalDAVAddManagedAttachmentsTaskGroup *)self setUpdatedScheduleTag:v10];

    v11 = [v30 responseHeaders];
    id v12 = [v11 CDVObjectForKeyCaseInsensitive:*MEMORY[0x263F34A60]];
    [(CalDAVAddManagedAttachmentsTaskGroup *)self setUpdatedETag:v12];

    id v13 = [v30 responseHeaders];
    uint64_t v14 = [v13 CDVObjectForKeyCaseInsensitive:*MEMORY[0x263F34A78]];
    v15 = v14;
    if (v14)
    {
      id v16 = v14;
    }
    else
    {
      id v16 = [MEMORY[0x263EFF9D0] null];
    }
    v19 = v16;

    filenamesToServerLocation = self->_filenamesToServerLocation;
    v25 = [v30 filename];
    [(NSMutableDictionary *)filenamesToServerLocation setObject:v19 forKey:v25];

    if (![(CalDAVAddManagedAttachmentsTaskGroup *)self _postedLastAttachment])
    {
      [(CalDAVAddManagedAttachmentsTaskGroup *)self _sendAttachments];
      goto LABEL_19;
    }
    v26 = [v30 responseData];
    [(CalDAVAddManagedAttachmentsTaskGroup *)self setUpdatedResourcePayload:v26];

    v27 = [v30 responseData];
    if ([v27 length])
    {
      v28 = [(CalDAVAddManagedAttachmentsTaskGroup *)self updatedScheduleTag];
      if (v28)
      {

LABEL_17:
        [(CalDAVAddManagedAttachmentsTaskGroup *)self _finishWithError:0 state:7];
        goto LABEL_19;
      }
      v29 = [(CalDAVAddManagedAttachmentsTaskGroup *)self updatedETag];

      if (v29) {
        goto LABEL_17;
      }
    }
    else
    {
    }
    [(CalDAVAddManagedAttachmentsTaskGroup *)self _fetchUpdatedContent];
    goto LABEL_19;
  }
  v5 = [v30 error];
  id v6 = [v5 domain];
  if ([v6 isEqualToString:*MEMORY[0x263F34A98]])
  {
    v7 = [v30 error];
    uint64_t v8 = [v7 code];

    if (v8 == 412)
    {
      [(CalDAVAddManagedAttachmentsTaskGroup *)self setHadPreconditionFailure:1];
      [(CalDAVAddManagedAttachmentsTaskGroup *)self setPreviousScheduleTag:0];
      [(CalDAVAddManagedAttachmentsTaskGroup *)self setPreviousETag:0];
      [(CalDAVAddManagedAttachmentsTaskGroup *)self _sendAttachments];
      goto LABEL_20;
    }
  }
  else
  {
  }
  id v17 = NSNumber;
  v18 = [v30 requestDataPayload];
  v19 = objc_msgSend(v17, "numberWithUnsignedLongLong:", objc_msgSend(v18, "length"));

  objc_super v20 = NSDictionary;
  v21 = [v30 filename];
  v22 = [v20 dictionaryWithObject:v19 forKey:v21];
  [(CalDAVAddManagedAttachmentsTaskGroup *)self setPostFailureSizes:v22];

  v23 = [v30 error];
  [(CalDAVAddManagedAttachmentsTaskGroup *)self _finishWithError:v23 state:5];

LABEL_19:
LABEL_20:
}

- (void)_sendAttachments
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  [(CalDAVAddManagedAttachmentsTaskGroup *)self setState:1];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v3 = [(CalDAVAddManagedAttachmentsTaskGroup *)self attachments];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v31;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v31 != v5) {
        objc_enumerationMutation(v3);
      }
      uint64_t v7 = *(void *)(*((void *)&v30 + 1) + 8 * v6);
      uint64_t v8 = [(CalDAVAddManagedAttachmentsTaskGroup *)self filenamesToServerLocation];
      id v9 = [v8 objectForKey:v7];
      BOOL v10 = v9 == 0;

      if (v10) {
        break;
      }
      if (v4 == ++v6)
      {
        uint64_t v4 = [v3 countByEnumeratingWithState:&v30 objects:v34 count:16];
        if (v4) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    v11 = [(CalDAVAddManagedAttachmentsTaskGroup *)self contentTypes];
    id v12 = [v11 objectForKey:v7];

    if (![v12 length])
    {
      [(CalDAVAddManagedAttachmentsTaskGroup *)self _finishWithError:0 state:4];
LABEL_22:

      return;
    }
    id v13 = [(CalDAVAddManagedAttachmentsTaskGroup *)self attachments];
    uint64_t v14 = [v13 objectForKey:v7];

    v15 = [CalDAVPostStreamTask alloc];
    id v16 = [(CalDAVAddManagedAttachmentsTaskGroup *)self urlWithQuery];
    id v17 = [(CoreDAVPostTask *)v15 initWithDataPayload:v14 dataContentType:v12 atURL:v16 previousETag:0];

    if ([(CalDAVAddManagedAttachmentsTaskGroup *)self hadPreconditionFailure]) {
      goto LABEL_12;
    }
    v18 = [(CalDAVAddManagedAttachmentsTaskGroup *)self updatedScheduleTag];
    if (v18)
    {
    }
    else
    {
      v19 = [(CalDAVAddManagedAttachmentsTaskGroup *)self previousScheduleTag];

      if (!v19)
      {
        v24 = [(CalDAVAddManagedAttachmentsTaskGroup *)self updatedETag];
        if (v24)
        {
        }
        else
        {
          v25 = [(CalDAVAddManagedAttachmentsTaskGroup *)self previousETag];

          if (!v25)
          {
LABEL_12:
            [(CoreDAVPostOrPutTask *)v17 setForceToServer:1];
LABEL_21:
            [(CalDAVPostStreamTask *)v17 setFilename:v7];
            v22 = [(CoreDAVTaskGroup *)self accountInfoProvider];
            [(CalDAVPostStreamTask *)v17 setAccountInfoProvider:v22];

            objc_initWeak(&location, v17);
            v27[0] = MEMORY[0x263EF8330];
            v27[1] = 3221225472;
            v27[2] = __56__CalDAVAddManagedAttachmentsTaskGroup__sendAttachments__block_invoke;
            v27[3] = &unk_2641EC310;
            v27[4] = self;
            objc_copyWeak(&v28, &location);
            [(CalDAVPostStreamTask *)v17 setCompletionBlock:v27];
            v23 = [(CoreDAVTaskGroup *)self taskManager];
            [v23 submitQueuedCoreDAVTask:v17];

            objc_destroyWeak(&v28);
            objc_destroyWeak(&location);

            goto LABEL_22;
          }
        }
        objc_super v20 = [(CalDAVAddManagedAttachmentsTaskGroup *)self updatedETag];
        if (v20)
        {
          [(CoreDAVPostOrPutTask *)v17 setPreviousETag:v20];
        }
        else
        {
          v26 = [(CalDAVAddManagedAttachmentsTaskGroup *)self previousETag];
          [(CoreDAVPostOrPutTask *)v17 setPreviousETag:v26];
        }
LABEL_20:

        goto LABEL_21;
      }
    }
    objc_super v20 = [(CalDAVAddManagedAttachmentsTaskGroup *)self updatedScheduleTag];
    if (v20)
    {
      [(CalDAVPostStreamTask *)v17 setPreviousScheduleTag:v20];
    }
    else
    {
      v21 = [(CalDAVAddManagedAttachmentsTaskGroup *)self previousScheduleTag];
      [(CalDAVPostStreamTask *)v17 setPreviousScheduleTag:v21];
    }
    goto LABEL_20;
  }
LABEL_9:

  [(CalDAVAddManagedAttachmentsTaskGroup *)self _finishWithError:0 state:6];
}

void __56__CalDAVAddManagedAttachmentsTaskGroup__sendAttachments__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [v1 _handlePostResponse:WeakRetained];
}

- (void)startTaskGroup
{
  [(CalDAVAddManagedAttachmentsTaskGroup *)self setState:1];
  [(CalDAVAddManagedAttachmentsTaskGroup *)self _sendAttachments];
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (NSString)previousETag
{
  return self->_previousETag;
}

- (void)setPreviousETag:(id)a3
{
}

- (NSString)previousScheduleTag
{
  return self->_previousScheduleTag;
}

- (void)setPreviousScheduleTag:(id)a3
{
}

- (NSData)updatedResourcePayload
{
  return self->_updatedResourcePayload;
}

- (void)setUpdatedResourcePayload:(id)a3
{
}

- (BOOL)hadPreconditionFailure
{
  return self->_hadPreconditionFailure;
}

- (void)setHadPreconditionFailure:(BOOL)a3
{
  self->_hadPreconditionFailure = a3;
}

- (NSString)updatedETag
{
  return self->_updatedETag;
}

- (void)setUpdatedETag:(id)a3
{
}

- (NSString)updatedScheduleTag
{
  return self->_updatedScheduleTag;
}

- (void)setUpdatedScheduleTag:(id)a3
{
}

- (NSDictionary)postFailureSizes
{
  return self->_postFailureSizes;
}

- (void)setPostFailureSizes:(id)a3
{
}

- (NSURL)resourceURL
{
  return self->_resourceURL;
}

- (void)setResourceURL:(id)a3
{
}

- (NSDictionary)attachments
{
  return self->_attachments;
}

- (void)setAttachments:(id)a3
{
}

- (NSDictionary)contentTypes
{
  return self->_contentTypes;
}

- (void)setContentTypes:(id)a3
{
}

- (NSMutableDictionary)filenamesToServerLocation
{
  return self->_filenamesToServerLocation;
}

- (void)setFilenamesToServerLocation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filenamesToServerLocation, 0);
  objc_storeStrong((id *)&self->_contentTypes, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_resourceURL, 0);
  objc_storeStrong((id *)&self->_postFailureSizes, 0);
  objc_storeStrong((id *)&self->_updatedScheduleTag, 0);
  objc_storeStrong((id *)&self->_updatedETag, 0);
  objc_storeStrong((id *)&self->_updatedResourcePayload, 0);
  objc_storeStrong((id *)&self->_previousScheduleTag, 0);
  objc_storeStrong((id *)&self->_previousETag, 0);
  objc_storeStrong((id *)&self->_postURLWithQuery, 0);
}

@end