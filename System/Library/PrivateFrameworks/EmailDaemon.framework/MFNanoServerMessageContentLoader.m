@interface MFNanoServerMessageContentLoader
- (BOOL)highPriority;
- (BOOL)wantsContentsOfType:(int64_t)a3;
- (MFNanoServerMessageContentLoader)initWithMessageId:(id)a3 highPriority:(BOOL)a4 pairedDeviceInfo:(id)a5 delegate:(id)a6;
- (NSString)messageId;
- (double)ordering;
- (id)_attachmentForURL:(id)a3 mimePart:(id)a4;
- (id)_attemptToLoadLibraryMessageWithContentFromDatabase;
- (id)_libraryMessageForMessageId:(id)a3;
- (id)_monitoredOperationWithBlock:(id)a3;
- (id)_nanoAttachmentForURL:(id)a3 mimePart:(id)a4;
- (id)message;
- (int64_t)priority;
- (void)_downloadContent;
- (void)_notifyDelegateDidFinish;
- (void)_notifyDelegateOfFailure;
- (void)_notifyDelegateThatReceivedAttachment:(id)a3 forContentId:(id)a4 loadedProtected:(BOOL)a5;
- (void)_notifyDelegateThatReceivedImageAttachment:(id)a3 forContentId:(id)a4 loadedProtected:(BOOL)a5;
- (void)_notifyDelegateThatReceivedMailContent:(id)a3 forMessage:(id)a4 loadedProtected:(BOOL)a5;
- (void)_parseContentFromMessageAndNotifyDelegate:(id)a3 loadedProtected:(BOOL)a4;
- (void)_startContentLoadProcess;
- (void)_startLoadingAttachments:(id)a3 messageBody:(id)a4 loadedProtected:(BOOL)a5;
- (void)cancel;
- (void)dealloc;
- (void)notifyContentsAvailable:(id)a3 forMessage:(id)a4;
- (void)notifyContentsUnavailableForMessage:(id)a3 error:(id)a4;
- (void)setHighPriority:(BOOL)a3;
@end

@implementation MFNanoServerMessageContentLoader

- (MFNanoServerMessageContentLoader)initWithMessageId:(id)a3 highPriority:(BOOL)a4 pairedDeviceInfo:(id)a5 delegate:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)MFNanoServerMessageContentLoader;
  v14 = [(MFNanoServerMessageContentLoader *)&v26 init];
  v15 = v14;
  v16 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_messageId, a3);
    uint64_t v17 = +[NSDate date];
    requestDate = v16->_requestDate;
    v16->_requestDate = (NSDate *)v17;

    v16->_highPriority = a4;
    objc_storeStrong((id *)&v15->_pairedDeviceInfo, a5);
    objc_storeStrong((id *)&v15->_delegate, a6);
    v19 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    monitoredOperations = v16->_monitoredOperations;
    v16->_monitoredOperations = v19;

    v21 = (NSLock *)objc_alloc_init((Class)NSLock);
    monitoredOperationsLock = v16->_monitoredOperationsLock;
    v16->_monitoredOperationsLock = v21;

    v23 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    currentContentParsers = v16->_currentContentParsers;
    v16->_currentContentParsers = v23;

    if (qword_10016BD38 != -1) {
      dispatch_once(&qword_10016BD38, &stru_10013D2D8);
    }
    [(MFNanoServerMessageContentLoader *)v16 _startContentLoadProcess];
  }

  return v16;
}

- (void)dealloc
{
  delegate = self->_delegate;
  self->_delegate = 0;

  [(NSLock *)self->_monitoredOperationsLock lock];
  [(NSMutableSet *)self->_monitoredOperations makeObjectsPerformSelector:"cancel"];
  [(NSLock *)self->_monitoredOperationsLock unlock];
  v4.receiver = self;
  v4.super_class = (Class)MFNanoServerMessageContentLoader;
  [(MFNanoServerMessageContentLoader *)&v4 dealloc];
}

- (void)cancel
{
  delegate = self->_delegate;
  self->_delegate = 0;

  [(NSLock *)self->_monitoredOperationsLock lock];
  [(NSMutableSet *)self->_monitoredOperations makeObjectsPerformSelector:"cancel"];
  [(NSLock *)self->_monitoredOperationsLock unlock];
  id v5 = [(MFLibraryMessage *)self->_messageForDownload account];
  objc_super v4 = +[MessageBodyLoader loaderForAccount:](MessageBodyLoader, "loaderForAccount:");
  [v4 removeSingleMessageClient:self];
}

- (void)setHighPriority:(BOOL)a3
{
  if (self->_highPriority != a3)
  {
    BOOL v3 = a3;
    id v5 = MFLogGeneral();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      messageId = self->_messageId;
      v12[0] = 67109378;
      v12[1] = v3;
      __int16 v13 = 2114;
      v14 = messageId;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#Nano Setting MFNanoServerMessageContentLoader to high priority: %d, messageId: %{public}@", (uint8_t *)v12, 0x12u);
    }

    if (self->_contentQueuedForDownload)
    {
      v7 = [(MFLibraryMessage *)self->_messageForDownload account];
      v8 = +[MessageBodyLoader loaderForAccount:v7];
      [v8 removeSingleMessageClient:self];

      BOOL contentQueuedForDownload = self->_contentQueuedForDownload;
      self->_highPriority = v3;
      if (contentQueuedForDownload)
      {
        v10 = [(MFLibraryMessage *)self->_messageForDownload account];
        id v11 = +[MessageBodyLoader loaderForAccount:v10];

        [v11 addSingleMessageClient:self];
        if (self->_highPriority) {
          [v11 resume];
        }
      }
    }
    else
    {
      self->_highPriority = v3;
    }
  }
}

- (int64_t)priority
{
  if (self->_highPriority) {
    return 101;
  }
  else {
    return 0;
  }
}

- (double)ordering
{
  [(NSDate *)self->_requestDate timeIntervalSince1970];
  return result;
}

- (id)message
{
  return self->_messageForDownload;
}

- (BOOL)wantsContentsOfType:(int64_t)a3
{
  return a3 == 0;
}

- (void)notifyContentsAvailable:(id)a3 forMessage:(id)a4
{
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = MFLogGeneral();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      messageId = self->_messageId;
      int v9 = 138543362;
      v10 = messageId;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#Nano MessageBodyLoader returned content for: %{public}@", (uint8_t *)&v9, 0xCu);
    }

    [(MFNanoServerMessageContentLoader *)self _parseContentFromMessageAndNotifyDelegate:v5 loadedProtected:0];
  }
  else
  {
    v8 = MFLogGeneral();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000C21D8((uint64_t)self, v8);
    }
  }
  self->_BOOL contentQueuedForDownload = 0;
}

- (void)notifyContentsUnavailableForMessage:(id)a3 error:(id)a4
{
  self->_BOOL contentQueuedForDownload = 0;
}

- (void)_startContentLoadProcess
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = sub_100090840;
  int v9 = sub_100090850;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100090858;
  v4[3] = &unk_10013B160;
  v4[4] = self;
  v4[5] = &v5;
  uint64_t v2 = [(MFNanoServerMessageContentLoader *)self _monitoredOperationWithBlock:v4];
  BOOL v3 = (void *)v6[5];
  v6[5] = v2;

  [(id)qword_10016BD20 addOperation:v6[5]];
  _Block_object_dispose(&v5, 8);
}

- (id)_attemptToLoadLibraryMessageWithContentFromDatabase
{
  uint64_t v2 = +[NSURL URLWithString:self->_messageId];
  BOOL v3 = objc_msgSend(v2, "mf_messageCriterion");
  objc_super v4 = +[MFMailMessageLibrary defaultInstance];
  uint64_t v5 = [v4 messagesMatchingCriterion:v3 options:36872];

  v6 = [v5 firstObject];
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = [v6 summary];

    if (v8)
    {
      int v9 = [v7 mailbox];
      id v10 = [v9 store];
      [v7 setMessageStore:v10];
      id v8 = v7;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)_downloadContent
{
  BOOL v3 = [(MFNanoServerMessageContentLoader *)self _libraryMessageForMessageId:self->_messageId];
  messageForDownload = self->_messageForDownload;
  self->_messageForDownload = v3;

  uint64_t v5 = MFLogGeneral();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    messageId = self->_messageId;
    uint64_t v7 = [(MFLibraryMessage *)self->_messageForDownload remoteID];
    id v8 = [(MFLibraryMessage *)self->_messageForDownload globalMessageID];
    int v11 = 138543874;
    id v12 = messageId;
    __int16 v13 = 2114;
    v14 = v7;
    __int16 v15 = 2048;
    id v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#Nano Attempting to download message with id: %{public}@, remoteId: %{public}@, globalMessageId: %lld", (uint8_t *)&v11, 0x20u);
  }
  int v9 = [(MFLibraryMessage *)self->_messageForDownload account];
  id v10 = +[MessageBodyLoader loaderForAccount:v9];

  [v10 addSingleMessageClient:self];
  if (self->_highPriority) {
    [v10 resume];
  }
  self->_BOOL contentQueuedForDownload = 1;
}

- (void)_parseContentFromMessageAndNotifyDelegate:(id)a3 loadedProtected:(BOOL)a4
{
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_100090840;
  v20 = sub_100090850;
  id v21 = 0;
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  id v10 = sub_100090D78;
  int v11 = &unk_10013D328;
  v14 = &v16;
  id v12 = self;
  id v5 = a3;
  id v13 = v5;
  BOOL v15 = a4;
  uint64_t v6 = [(MFNanoServerMessageContentLoader *)v12 _monitoredOperationWithBlock:&v8];
  uint64_t v7 = (void *)v17[5];
  v17[5] = v6;

  objc_msgSend((id)qword_10016BD28, "addOperation:", v17[5], v8, v9, v10, v11, v12);
  _Block_object_dispose(&v16, 8);
}

- (void)_startLoadingAttachments:(id)a3 messageBody:(id)a4 loadedProtected:(BOOL)a5
{
  id v8 = a3;
  id v16 = a4;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  id v35 = (id)0xAAAAAAAAAAAAAAAALL;
  id v35 = [v8 count];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v8;
  id v9 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v31;
    do
    {
      int v11 = 0;
      do
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v30 + 1) + 8 * (void)v11);
        uint64_t v24 = 0;
        v25 = &v24;
        uint64_t v26 = 0x3032000000;
        v27 = sub_100090840;
        v28 = sub_100090850;
        id v29 = 0;
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_100091544;
        v17[3] = &unk_10013D350;
        id v21 = &v24;
        id v18 = v16;
        uint64_t v19 = v12;
        BOOL v23 = a5;
        v20 = self;
        v22 = v34;
        uint64_t v13 = [(MFNanoServerMessageContentLoader *)self _monitoredOperationWithBlock:v17];
        v14 = (void *)v25[5];
        v25[5] = v13;

        [(id)qword_10016BD30 addOperation:v25[5]];
        _Block_object_dispose(&v24, 8);

        int v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v9);
  }

  _Block_object_dispose(v34, 8);
}

- (void)_notifyDelegateThatReceivedMailContent:(id)a3 forMessage:(id)a4 loadedProtected:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = MFLogGeneral();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = [v9 messageId];
    v14 = [v9 accountId];
    BOOL v15 = [v9 mailboxId];
    *(_DWORD *)buf = 138543874;
    id v21 = v13;
    __int16 v22 = 2114;
    BOOL v23 = v14;
    __int16 v24 = 2114;
    v25 = v15;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "#Nano Sending message, ID: '%{public}@', account: '%{public}@', mailbox: '%{public}@'.", buf, 0x20u);
  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100091AD4;
  v16[3] = &unk_10013A980;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  BOOL v19 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v16);
}

- (void)_notifyDelegateThatReceivedImageAttachment:(id)a3 forContentId:(id)a4 loadedProtected:(BOOL)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100091BB8;
  v9[3] = &unk_10013A980;
  v9[4] = self;
  id v10 = a3;
  id v11 = a4;
  BOOL v12 = a5;
  id v7 = v11;
  id v8 = v10;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);
}

- (void)_notifyDelegateThatReceivedAttachment:(id)a3 forContentId:(id)a4 loadedProtected:(BOOL)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100091C9C;
  v9[3] = &unk_10013A980;
  v9[4] = self;
  id v10 = a3;
  id v11 = a4;
  BOOL v12 = a5;
  id v7 = v11;
  id v8 = v10;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);
}

- (void)_notifyDelegateDidFinish
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100091D28;
  block[3] = &unk_100139C48;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_notifyDelegateOfFailure
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100091DA8;
  block[3] = &unk_100139C48;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (id)_nanoAttachmentForURL:(id)a3 mimePart:(id)a4
{
  id v6 = a4;
  id v7 = [(MFNanoServerMessageContentLoader *)self _attachmentForURL:a3 mimePart:v6];
  unsigned int v8 = [v7 isImageFile];
  id v9 = (Class *)NNMKImageAttachment_ptr;
  if (!v8) {
    id v9 = (Class *)NNMKAttachment_ptr;
  }
  id v10 = objc_alloc_init(*v9);
  id v11 = [v7 contentID];
  [v10 setContentId:v11];

  BOOL v12 = [v7 fileName];
  [v10 setFileName:v12];

  objc_msgSend(v10, "setFileSize:", 3 * ((unint64_t)objc_msgSend(v7, "encodedFileSize") >> 2));
  uint64_t v13 = [v6 partNumber];
  [v10 setMimePartNumber:v13];

  objc_msgSend(v10, "setType:", objc_msgSend(v7, "nanoAttachmentType"));

  return v10;
}

- (id)_attachmentForURL:(id)a3 mimePart:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[DaemonAppController sharedController];
  unsigned int v8 = [v7 defaultAttachmentManager];
  id v9 = [v8 attachmentForURL:v5 error:0];

  [v9 setPart:v6];
  id v10 = [v6 type];
  id v11 = [v6 subtype];
  BOOL v12 = +[NSString stringWithFormat:@"%@/%@", v10, v11];
  [v9 setMimeType:v12];

  uint64_t v13 = [v6 attachmentFilename];
  [v9 setFileName:v13];

  objc_msgSend(v9, "setEncodedFileSize:", objc_msgSend(v6, "approximateRawSize"));
  v14 = [v6 disposition];
  [v9 setDisposition:v14];

  return v9;
}

- (id)_libraryMessageForMessageId:(id)a3
{
  BOOL v3 = +[NSURL URLWithString:a3];
  objc_super v4 = objc_msgSend(v3, "mf_messageCriterion");
  id v5 = +[MFMailMessageLibrary defaultInstance];
  id v6 = [v5 messagesMatchingCriterion:v4 options:6144];

  id v7 = [v6 firstObject];
  unsigned int v8 = [v7 mailbox];
  id v9 = [v8 store];
  [v7 setMessageStore:v9];

  return v7;
}

- (id)_monitoredOperationWithBlock:(id)a3
{
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_100090840;
  id v17 = sub_100090850;
  id v18 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000923E8;
  v10[3] = &unk_10013D378;
  id v4 = a3;
  v10[4] = self;
  id v11 = v4;
  BOOL v12 = &v13;
  uint64_t v5 = +[NSBlockOperation blockOperationWithBlock:v10];
  id v6 = (void *)v14[5];
  v14[5] = v5;

  [(id)v14[5] setQueuePriority:8 * self->_highPriority];
  if (self->_highPriority) {
    uint64_t v7 = 25;
  }
  else {
    uint64_t v7 = 17;
  }
  [(id)v14[5] setQualityOfService:v7];
  [(NSLock *)self->_monitoredOperationsLock lock];
  [(NSMutableSet *)self->_monitoredOperations addObject:v14[5]];
  [(NSLock *)self->_monitoredOperationsLock unlock];
  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (NSString)messageId
{
  return self->_messageId;
}

- (BOOL)highPriority
{
  return self->_highPriority;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageId, 0);
  objc_storeStrong((id *)&self->_currentContentParsers, 0);
  objc_storeStrong((id *)&self->_monitoredOperationsLock, 0);
  objc_storeStrong((id *)&self->_monitoredOperations, 0);
  objc_storeStrong((id *)&self->_pairedDeviceInfo, 0);
  objc_storeStrong((id *)&self->_messageForDownload, 0);
  objc_storeStrong((id *)&self->_delegate, 0);

  objc_storeStrong((id *)&self->_requestDate, 0);
}

@end