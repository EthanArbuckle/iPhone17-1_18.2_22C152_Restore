@interface MFNanoServer
- (MFNanoServer)init;
- (id)_createContentLoaderForMessageId:(id)a3 highPriority:(BOOL)a4;
- (id)_filteredMessagesArrayFromLibraryMessages:(id)a3 syncedMailbox:(id)a4;
- (id)_filteredMessagesArrayFromLibraryMessages:(id)a3 syncedMailboxes:(id)a4;
- (id)_libraryMessagesReceivedBefore:(id)a3 count:(unint64_t)a4 inConversationWithId:(id)a5 protectedDataAvailable:(BOOL *)a6 limitDateReceived:(id)a7 syncedMailbox:(id)a8;
- (id)_libraryMessagesReceivedBefore:(id)a3 count:(unint64_t)a4 inConversationWithId:(id)a5 protectedDataAvailable:(BOOL *)a6 limitDateReceived:(id)a7 syncedMailboxes:(id)a8;
- (id)_messageIdsForNanoMessages:(id)a3;
- (id)nanoBulletinFlagsForMessageFromAccount:(id)a3 mailboxURLString:(id)a4 status:(unint64_t)a5 dateReceived:(id)a6;
- (id)watchedMailboxes;
- (void)_addObservers;
- (void)_cancelLoadingContentForLibraryMessageId:(id)a3;
- (void)_conversationFlagsChanged:(id)a3;
- (void)_fetchForMailboxes:(id)a3 growFetchWindow:(BOOL)a4;
- (void)_handleSingleAutoFetchDone:(id)a3;
- (void)_loadContentForLibraryMessageId:(id)a3 highPriority:(BOOL)a4;
- (void)_loadFullMesssagesForMessageIds:(id)a3 messagesAlreadyLoadedByMessageId:(id)a4 libraryMessagesRetrievalBlock:(id)a5 callback:(id)a6;
- (void)_messageFlagsChanged:(id)a3;
- (void)_messagesAdded:(id)a3;
- (void)_messagesCompacted:(id)a3;
- (void)_updateVIPList:(id)a3 requestContext:(id)a4;
- (void)_vipChangedNotification:(id)a3;
- (void)messageContentLoader:(id)a3 receivedAttachmentData:(id)a4 contentId:(id)a5 loadedProtected:(BOOL)a6;
- (void)messageContentLoader:(id)a3 receivedImageAttachment:(id)a4 contentId:(id)a5 loadedProtected:(BOOL)a6;
- (void)messageContentLoader:(id)a3 receivedMailContent:(id)a4 forMessage:(id)a5 loadedProtected:(BOOL)a6;
- (void)messageContentLoaderDidFailLoadingContent:(id)a3;
- (void)messageContentLoaderDidFinishLoading:(id)a3;
- (void)performBlock:(id)a3;
- (void)syncProvider:(id)a3 didFailAuthenticatingAccount:(id)a4;
- (void)syncProvider:(id)a3 didMoveMessageIds:(id)a4 toMailbox:(id)a5;
- (void)syncProvider:(id)a3 didRequestContentForMessageWithId:(id)a4 highPriority:(BOOL)a5;
- (void)syncProvider:(id)a3 didRequestFetchForMailboxes:(id)a4;
- (void)syncProvider:(id)a3 didRequestFirstMessages:(unint64_t)a4 mailboxes:(id)a5;
- (void)syncProvider:(id)a3 didRequestMessagesToSendAsFetchResponseForMessageIds:(id)a4;
- (void)syncProvider:(id)a3 didRequestMessagesWithContext:(id)a4;
- (void)syncProvider:(id)a3 didRequestReauthenticationForAccount:(id)a4;
- (void)syncProvider:(id)a3 didRequestResendAccountWithId:(id)a4;
- (void)syncProvider:(id)a3 didRequestResendMessagesWithIds:(id)a4;
- (void)syncProvider:(id)a3 didRequestSendComposedMessage:(id)a4;
- (void)syncProvider:(id)a3 didRequestStopDownloadingMessageElementsForMessageWithId:(id)a4;
- (void)syncProvider:(id)a3 didRequestVIPSenderListWithRequestContext:(id)a4;
- (void)syncProvider:(id)a3 didUpdateMailboxSelection:(id)a4;
- (void)syncProvider:(id)a3 didUpdateMessagesStatus:(id)a4;
- (void)syncProvider:(id)a3 didUpdateWatchAccounts:(id)a4;
- (void)syncProviderDidRequestAccounts:(id)a3;
- (void)syncProviderDidRequestFetch:(id)a3 forConversationId:(id)a4 mailbox:(id)a5;
- (void)syncProviderDidRequestStopDownloadingAllMessageElements:(id)a3;
@end

@implementation MFNanoServer

- (MFNanoServer)init
{
  if (MFDeviceSupportsNanoCompanion())
  {
    v27.receiver = self;
    v27.super_class = (Class)MFNanoServer;
    v3 = [(MFNanoServer *)&v27 init];
    if (v3)
    {
      v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v5 = dispatch_queue_create("com.apple.MobileMail.NanoServer", v4);
      nanoServerQueue = v3->_nanoServerQueue;
      v3->_nanoServerQueue = (OS_dispatch_queue *)v5;

      v7 = [[MFNanoServerFullMessageLoader alloc] initWithCallbackQueue:v3->_nanoServerQueue];
      id v8 = objc_alloc((Class)MFNanoServerFullMessageLoader2);
      v9 = v3->_nanoServerQueue;
      v10 = +[MFMailMessageLibrary defaultInstance];
      v11 = (MFNanoServerFullMessageLoader2 *)[v8 initWithCallbackQueue:v9 mailMessageLibrary:v10 legacyLoader:v7];
      fullMessageLoader = v3->_fullMessageLoader;
      v3->_fullMessageLoader = v11;

      v13 = objc_alloc_init(MFNanoServerMessageUpdater);
      messageUpdater = v3->_messageUpdater;
      v3->_messageUpdater = v13;

      v15 = objc_alloc_init(MFNanoServerMessageSender);
      messageSender = v3->_messageSender;
      v3->_messageSender = v15;

      v17 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      messageContentLoadersKeyedByMessageId = v3->_messageContentLoadersKeyedByMessageId;
      v3->_messageContentLoadersKeyedByMessageId = v17;

      v19 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      mailboxesWaitingForFetch = v3->_mailboxesWaitingForFetch;
      v3->_mailboxesWaitingForFetch = v19;

      v21 = objc_alloc_init(MFNanoServerMessageFetchService);
      messageFetchService = v3->_messageFetchService;
      v3->_messageFetchService = v21;

      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100086B60;
      v25[3] = &unk_100139C48;
      v26 = v3;
      [(MFNanoServer *)v26 performBlock:v25];
    }
    self = v3;
    v23 = self;
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (void)_addObservers
{
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"_messagesAdded:" name:MailMessageStoreMessagesAdded object:0];
  [v4 addObserver:self selector:"_messageFlagsChanged:" name:MailMessageStoreMessageFlagsChanged object:0];
  [v4 addObserver:self selector:"_conversationFlagsChanged:" name:EDConversationFlagsChanged object:0];
  [v4 addObserver:self selector:"_messagesCompacted:" name:MailMessageStoreMessagesCompacted object:0];
  [v4 addObserver:self selector:"_handleSingleAutoFetchDone:" name:@"AutoFetchPushCompletedNotification" object:0];
  v3 = +[VIPManager defaultInstance];
  [v4 addObserver:self selector:"_vipChangedNotification:" name:EMVIPsDidChangeNotification object:v3];
}

- (id)watchedMailboxes
{
  return [(MFNanoAccountHandler *)self->_accountHandler favoriteMailboxUidList];
}

- (id)nanoBulletinFlagsForMessageFromAccount:(id)a3 mailboxURLString:(id)a4 status:(unint64_t)a5 dateReceived:(id)a6
{
  id v10 = a6;
  v11 = [a3 mailboxUidForURL:a4];
  unint64_t v12 = +[MFLibraryMessage nano_nnmkMailItemStatusFromMSResultsStatus:a5];
  syncProvider = self->_syncProvider;
  v14 = objc_msgSend(v11, "nano_mailbox");
  id v15 = [(NNMKSyncProvider *)syncProvider containsSyncedMailbox:v14];

  v16 = self->_syncProvider;
  v17 = objc_msgSend(v11, "nano_mailboxId");
  v18 = [(NNMKSyncProvider *)v16 bulletinFlagsForMessageStatus:v12 dateReceived:v10 messageWillBeAddedToSyncProvider:v15 mailboxId:v17];

  return v18;
}

- (void)performBlock:(id)a3
{
  id v4 = a3;
  +[EFProcessTransaction transactionWithDescription:@"com.apple.email.NanoServer"];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100086F60;
  v8[3] = &unk_10013B9B8;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = v4;
  id v5 = v9;
  id v6 = v4;
  v7 = objc_retainBlock(v8);
  dispatch_async((dispatch_queue_t)self->_nanoServerQueue, v7);
}

- (void)syncProviderDidRequestAccounts:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100087014;
  v3[3] = &unk_100139C48;
  v3[4] = self;
  [(MFNanoServer *)self performBlock:v3];
}

- (void)syncProvider:(id)a3 didUpdateMailboxSelection:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100087144;
  v5[3] = &unk_100139C20;
  id v6 = self;
  id v7 = a4;
  id v4 = v7;
  [(MFNanoServer *)v6 performBlock:v5];
}

- (void)syncProvider:(id)a3 didUpdateMessagesStatus:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000871FC;
  v5[3] = &unk_100139C20;
  id v6 = self;
  id v7 = a4;
  id v4 = v7;
  [(MFNanoServer *)v6 performBlock:v5];
}

- (void)syncProvider:(id)a3 didMoveMessageIds:(id)a4 toMailbox:(id)a5
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000872EC;
  v8[3] = &unk_10013ABC8;
  id v9 = self;
  id v10 = a4;
  id v11 = a5;
  id v6 = v11;
  id v7 = v10;
  [(MFNanoServer *)v9 performBlock:v8];
}

- (void)syncProvider:(id)a3 didRequestFirstMessages:(unint64_t)a4 mailboxes:(id)a5
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000873B4;
  v6[3] = &unk_10013A8A8;
  id v8 = self;
  unint64_t v9 = a4;
  id v7 = a5;
  id v5 = v7;
  [(MFNanoServer *)v8 performBlock:v6];
}

- (void)syncProvider:(id)a3 didRequestMessagesWithContext:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000877BC;
  v6[3] = &unk_100139C20;
  id v7 = a4;
  id v8 = self;
  id v5 = v7;
  [(MFNanoServer *)self performBlock:v6];
}

- (void)syncProvider:(id)a3 didRequestResendMessagesWithIds:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100087CA0;
  v6[3] = &unk_100139C20;
  id v7 = a4;
  id v8 = self;
  id v5 = v7;
  [(MFNanoServer *)self performBlock:v6];
}

- (void)syncProvider:(id)a3 didRequestMessagesToSendAsFetchResponseForMessageIds:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10008808C;
  v6[3] = &unk_100139C20;
  id v7 = a4;
  id v8 = self;
  id v5 = v7;
  [(MFNanoServer *)self performBlock:v6];
}

- (void)syncProvider:(id)a3 didRequestResendAccountWithId:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000883D4;
  v5[3] = &unk_100139C20;
  id v6 = self;
  id v7 = a4;
  id v4 = v7;
  [(MFNanoServer *)v6 performBlock:v5];
}

- (void)syncProvider:(id)a3 didRequestContentForMessageWithId:(id)a4 highPriority:(BOOL)a5
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000884F8;
  v7[3] = &unk_10013D030;
  id v8 = self;
  id v9 = a4;
  BOOL v10 = a5;
  id v6 = v9;
  [(MFNanoServer *)v8 performBlock:v7];
}

- (void)syncProvider:(id)a3 didRequestStopDownloadingMessageElementsForMessageWithId:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000885B4;
  v5[3] = &unk_100139C20;
  id v6 = self;
  id v7 = a4;
  id v4 = v7;
  [(MFNanoServer *)v6 performBlock:v5];
}

- (void)syncProviderDidRequestStopDownloadingAllMessageElements:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000886D8;
  v3[3] = &unk_100139C48;
  v3[4] = self;
  [(MFNanoServer *)self performBlock:v3];
}

- (void)syncProviderDidRequestFetch:(id)a3 forConversationId:(id)a4 mailbox:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = v8;
  if (v8)
  {
    id v11 = v8;
    BOOL v10 = +[NSArray arrayWithObjects:&v11 count:1];
    [(MFNanoServer *)self syncProvider:v7 didRequestFetchForMailboxes:v10];
  }
}

- (void)syncProvider:(id)a3 didRequestFetchForMailboxes:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100088990;
  v6[3] = &unk_100139C20;
  id v7 = a4;
  id v8 = self;
  id v5 = v7;
  [(MFNanoServer *)self performBlock:v6];
}

- (void)syncProvider:(id)a3 didRequestVIPSenderListWithRequestContext:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100088AF0;
  v5[3] = &unk_100139C20;
  id v6 = self;
  id v7 = a4;
  id v4 = v7;
  [(MFNanoServer *)v6 performBlock:v5];
}

- (void)syncProvider:(id)a3 didRequestSendComposedMessage:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100088C74;
  v9[3] = &unk_10013ABC8;
  v9[4] = self;
  id v10 = a4;
  id v11 = v6;
  id v7 = v6;
  id v8 = v10;
  [(MFNanoServer *)self performBlock:v9];
}

- (void)syncProvider:(id)a3 didUpdateWatchAccounts:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100088E24;
  v4[3] = &unk_100139C48;
  v4[4] = self;
  -[MFNanoServer performBlock:](self, "performBlock:", v4, a4);
}

- (void)syncProvider:(id)a3 didRequestReauthenticationForAccount:(id)a4
{
}

- (void)syncProvider:(id)a3 didFailAuthenticatingAccount:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100088F60;
  v5[3] = &unk_100139C20;
  id v6 = self;
  id v7 = a4;
  id v4 = v7;
  [(MFNanoServer *)v6 performBlock:v5];
}

- (void)_messagesAdded:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100089018;
  v4[3] = &unk_100139C20;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(MFNanoServer *)v5 performBlock:v4];
}

- (void)_messageFlagsChanged:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100089298;
  v4[3] = &unk_100139C20;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(MFNanoServer *)v5 performBlock:v4];
}

- (void)_conversationFlagsChanged:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100089718;
  v4[3] = &unk_100139C20;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(MFNanoServer *)v5 performBlock:v4];
}

- (void)_messagesCompacted:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100089DC4;
  v4[3] = &unk_100139C20;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(MFNanoServer *)v5 performBlock:v4];
}

- (void)_vipChangedNotification:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10008A0AC;
  v5[3] = &unk_100139C20;
  id v6 = a3;
  id v7 = self;
  id v4 = v6;
  [(MFNanoServer *)self performBlock:v5];
}

- (void)_updateVIPList:(id)a3 requestContext:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  if (objc_opt_respondsToSelector())
  {
    id v7 = objc_alloc_init((Class)NSMutableArray);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v8 = v17;
    id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v19;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v8);
          }
          unint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          id v13 = objc_alloc_init((Class)NNMKVIPSender);
          v14 = [v12 name];
          [v13 setName:v14];

          id v15 = [v12 displayName];
          [v13 setDisplayName:v15];

          v16 = [v12 emailAddresses];
          [v13 setEmailAddresses:v16];

          [v7 addObject:v13];
        }
        id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }

    [(NNMKSyncProvider *)self->_syncProvider updateVIPSenderList:v7 requestContext:v6];
  }
}

- (void)_handleSingleAutoFetchDone:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10008A460;
  v5[3] = &unk_100139C20;
  id v6 = a3;
  id v7 = self;
  id v4 = v6;
  [(MFNanoServer *)self performBlock:v5];
}

- (void)messageContentLoader:(id)a3 receivedMailContent:(id)a4 forMessage:(id)a5 loadedProtected:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = MFLogGeneral();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v38 = [v10 messageId];
    v36 = [v12 messageId];
    long long v18 = [v12 serverId];
    long long v19 = [v12 accountId];
    long long v20 = [v12 mailboxId];
    long long v21 = [v12 conversationId];
    *(_DWORD *)buf = 138544642;
    v46 = v38;
    __int16 v47 = 2114;
    v48 = v36;
    __int16 v49 = 2114;
    v50 = v18;
    __int16 v51 = 2114;
    *(void *)v52 = v19;
    *(_WORD *)&v52[8] = 2114;
    v53 = v20;
    *(_WORD *)v54 = 2114;
    *(void *)&v54[2] = v21;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "#Nano [%{public}@] Received mail content. Message ID: '%{public}@', server ID: '%{public}@', account ID: : '%{public}@', mailbox: '%{public}@', conversation: '%{public}@'", buf, 0x3Eu);
  }
  v14 = MFLogGeneral();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v39 = [v10 messageId];
    v35 = [v11 messageId];
    v37 = [v11 externalReferenceId];
    unsigned int v22 = [v11 mainAlternativeValid];
    v34 = [v11 textData];
    unsigned int v23 = [v34 length];
    [v11 htmlContentData];
    unsigned int v31 = v23;
    v33 = unsigned int v32 = v22;
    unsigned int v30 = [v33 length];
    unsigned int v29 = [v11 hasTextData];
    unsigned int v24 = [v11 originalContentSize];
    v25 = [v11 attachments];
    unsigned int v26 = [v25 count];
    unsigned int v27 = [v11 partiallyLoaded];
    unsigned int v28 = [v11 isHTML];
    *(_DWORD *)buf = 138545922;
    v46 = v39;
    __int16 v47 = 2114;
    v48 = v35;
    __int16 v49 = 2114;
    v50 = v37;
    __int16 v51 = 1024;
    *(_DWORD *)v52 = v32;
    *(_WORD *)&v52[4] = 1024;
    *(_DWORD *)&v52[6] = v31;
    LOWORD(v53) = 1024;
    *(_DWORD *)((char *)&v53 + 2) = v30;
    HIWORD(v53) = 1024;
    *(_DWORD *)v54 = v29;
    *(_WORD *)&v54[4] = 1024;
    *(_DWORD *)&v54[6] = v24;
    __int16 v55 = 1024;
    unsigned int v56 = v26;
    __int16 v57 = 1024;
    unsigned int v58 = v27;
    __int16 v59 = 1024;
    unsigned int v60 = v28;
    _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "#Nano [%{public}@] Received mail content. Content: message ID: '%{public}@, ext.ref. ID: '%{public}@, main alt. valid: '%{BOOL}hhu, text: %{iec-bytes}u, html: %{iec-bytes}u, hasText: %{BOOL}hhu, original size: %{iec-bytes}u, attachments: %u, partial: %{BOOL}hhu, is HTML: %{BOOL}hhu", buf, 0x50u);
  }
  [v10 messageId];

  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_10008ABF4;
  v40[3] = &unk_10013D0E0;
  v40[4] = self;
  id v15 = v10;
  id v41 = v15;
  id v16 = v11;
  id v42 = v16;
  id v17 = v12;
  id v43 = v17;
  BOOL v44 = a6;
  [(MFNanoServer *)self performBlock:v40];
}

- (void)messageContentLoader:(id)a3 receivedImageAttachment:(id)a4 contentId:(id)a5 loadedProtected:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = MFLogGeneral();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    id v17 = [v10 messageId];
    [v11 size];
    double v19 = v18;
    [v11 size];
    *(_DWORD *)buf = 138544386;
    unsigned int v27 = v17;
    __int16 v28 = 2114;
    id v29 = v12;
    __int16 v30 = 1024;
    unsigned int v31 = v19;
    __int16 v32 = 1024;
    unsigned int v33 = v20;
    __int16 v34 = 1024;
    BOOL v35 = v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "#Nano [%{public}@] Received image attachment. Content ID: '%{public}@', %u x %u, loaded protected %{BOOL}hhu", buf, 0x28u);
  }
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10008AF28;
  v21[3] = &unk_10013D0E0;
  v21[4] = self;
  id v14 = v10;
  id v22 = v14;
  id v15 = v11;
  id v23 = v15;
  id v16 = v12;
  id v24 = v16;
  BOOL v25 = v6;
  [(MFNanoServer *)self performBlock:v21];
}

- (void)messageContentLoader:(id)a3 receivedAttachmentData:(id)a4 contentId:(id)a5 loadedProtected:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = MFLogGeneral();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    id v17 = [v10 messageId];
    *(_DWORD *)buf = 138544130;
    id v24 = v17;
    __int16 v25 = 2114;
    id v26 = v12;
    __int16 v27 = 1024;
    unsigned int v28 = [v11 length];
    __int16 v29 = 1024;
    BOOL v30 = v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "#Nano [%{public}@] Received attachment. Content ID: '%{public}@', %{iec-bytes}u bytes, loaded protected %{BOOL}hhu", buf, 0x22u);
  }
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10008B238;
  v18[3] = &unk_10013D0E0;
  v18[4] = self;
  id v14 = v10;
  id v19 = v14;
  id v15 = v11;
  id v20 = v15;
  id v16 = v12;
  id v21 = v16;
  BOOL v22 = v6;
  [(MFNanoServer *)self performBlock:v18];
}

- (void)messageContentLoaderDidFinishLoading:(id)a3
{
  id v4 = a3;
  id v5 = MFLogGeneral();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    BOOL v6 = [v4 messageId];
    sub_1000C2048(v6, buf, v5);
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10008B468;
  v8[3] = &unk_100139C20;
  void v8[4] = self;
  id v7 = v4;
  id v9 = v7;
  [(MFNanoServer *)self performBlock:v8];
}

- (void)messageContentLoaderDidFailLoadingContent:(id)a3
{
  id v4 = a3;
  id v5 = MFLogGeneral();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    BOOL v6 = [v4 messageId];
    sub_1000C20A0(v6, buf, v5);
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10008B65C;
  v8[3] = &unk_100139C20;
  void v8[4] = self;
  id v7 = v4;
  id v9 = v7;
  [(MFNanoServer *)self performBlock:v8];
}

- (void)_loadContentForLibraryMessageId:(id)a3 highPriority:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  BOOL v6 = -[NSMutableDictionary objectForKeyedSubscript:](self->_messageContentLoadersKeyedByMessageId, "objectForKeyedSubscript:");
  id v7 = v6;
  if (v6)
  {
    if (v4 && ([v6 highPriority] & 1) == 0) {
      [v7 setHighPriority:1];
    }
  }
  else
  {
    id v7 = [(MFNanoServer *)self _createContentLoaderForMessageId:v8 highPriority:v4];
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_messageContentLoadersKeyedByMessageId, "setObject:forKeyedSubscript:");
  }
}

- (id)_createContentLoaderForMessageId:(id)a3 highPriority:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(NNMKSyncProvider *)self->_syncProvider pairedDeviceInfo];
  [v7 screenWidth];
  double v9 = v8;
  id v10 = [(NNMKSyncProvider *)self->_syncProvider pairedDeviceInfo];
  [v10 screenScale];
  double v12 = v11;

  id v13 = objc_alloc((Class)MFNanoServerMessageContentLoader2);
  id v14 = +[MFMailMessageLibrary defaultInstance];
  double v15 = v9 * v12;
  if (qword_10016BD18 != -1) {
    dispatch_once(&qword_10016BD18, &stru_10013D218);
  }
  id v16 = (MFNanoServerMessageContentLoader *)[v13 initWithMessageId:v6 highPriority:v4 mailMessageLibrary:v14 maximumImageWidth:qword_10016BD10 workQueue:self delegate:v15];

  if (v16)
  {
    [(MFNanoServerMessageContentLoader *)v16 start];
  }
  else
  {
    id v17 = [MFNanoServerMessageContentLoader alloc];
    double v18 = [(NNMKSyncProvider *)self->_syncProvider pairedDeviceInfo];
    id v16 = [(MFNanoServerMessageContentLoader *)v17 initWithMessageId:v6 highPriority:v4 pairedDeviceInfo:v18 delegate:self];
  }

  return v16;
}

- (void)_cancelLoadingContentForLibraryMessageId:(id)a3
{
  id v6 = a3;
  BOOL v4 = -[NSMutableDictionary objectForKeyedSubscript:](self->_messageContentLoadersKeyedByMessageId, "objectForKeyedSubscript:");
  id v5 = v4;
  if (v4)
  {
    [v4 cancel];
    [(NSMutableDictionary *)self->_messageContentLoadersKeyedByMessageId removeObjectForKey:v6];
  }
}

- (void)_loadFullMesssagesForMessageIds:(id)a3 messagesAlreadyLoadedByMessageId:(id)a4 libraryMessagesRetrievalBlock:(id)a5 callback:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  fullMessageLoader = self->_fullMessageLoader;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10008BB74;
  v17[3] = &unk_10013D130;
  id v18 = v10;
  id v19 = self;
  id v20 = v11;
  id v21 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  [(MFNanoServerFullMessageLoader2 *)fullMessageLoader loadFullMessagesForMessageIds:a3 completion:v17];
}

- (id)_messageIdsForNanoMessages:(id)a3
{
  id v3 = objc_msgSend(a3, "ef_map:", &stru_10013D170);

  return v3;
}

- (id)_libraryMessagesReceivedBefore:(id)a3 count:(unint64_t)a4 inConversationWithId:(id)a5 protectedDataAvailable:(BOOL *)a6 limitDateReceived:(id)a7 syncedMailbox:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  id v18 = v17;
  if (v17)
  {
    id v22 = v17;
    id v19 = +[NSArray arrayWithObjects:&v22 count:1];
    id v20 = [(MFNanoServer *)self _libraryMessagesReceivedBefore:v14 count:a4 inConversationWithId:v15 protectedDataAvailable:a6 limitDateReceived:v16 syncedMailboxes:v19];
  }
  else
  {
    id v20 = &__NSArray0__struct;
  }

  return v20;
}

- (id)_libraryMessagesReceivedBefore:(id)a3 count:(unint64_t)a4 inConversationWithId:(id)a5 protectedDataAvailable:(BOOL *)a6 limitDateReceived:(id)a7 syncedMailboxes:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  id v18 = objc_alloc_init(MFNanoServerFetchParam);
  [(MFNanoServerFetchParam *)v18 setBeforeDateReceived:v14];
  [(MFNanoServerFetchParam *)v18 setConversationId:v15];
  [(MFNanoServerFetchParam *)v18 setDateReceivedLimit:v16];
  [(MFNanoServerFetchParam *)v18 setCount:a4];
  id v19 = [(MFNanoServerMessageFetchService *)self->_messageFetchService messagesForMailboxes:v17 param:v18];
  if ([v19 count])
  {
    id v20 = [v19 count];
    if (a4 != 0xFFFFFFFF && (unint64_t)v20 < a4) {
      [(MFNanoServer *)self _fetchForMailboxes:v17 growFetchWindow:1];
    }
  }
  if (a6) {
    *a6 = [(MFNanoServerFetchParam *)v18 protectedDataAvailable];
  }

  return v19;
}

- (id)_filteredMessagesArrayFromLibraryMessages:(id)a3 syncedMailbox:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = v7;
  if (v7)
  {
    id v12 = v7;
    double v9 = +[NSArray arrayWithObjects:&v12 count:1];
    id v10 = [(MFNanoServer *)self _filteredMessagesArrayFromLibraryMessages:v6 syncedMailboxes:v9];
  }
  else
  {
    id v10 = &__NSArray0__struct;
  }

  return v10;
}

- (id)_filteredMessagesArrayFromLibraryMessages:(id)a3 syncedMailboxes:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10008C534;
  v6[3] = &unk_10013D198;
  void v6[4] = self;
  BOOL v4 = objc_msgSend(a3, "ef_compactMap:", v6, a4);

  return v4;
}

- (void)_fetchForMailboxes:(id)a3 growFetchWindow:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = a3;
  id v5 = objc_msgSend(v10, "ef_map:", &stru_10013D1D8);
  id v6 = objc_msgSend(v5, "ef_filter:", &stru_10013D1F8);

  if ([v10 count])
  {
    id v7 = +[AutoFetchController sharedController];
    double v8 = v7;
    if (v4) {
      int v9 = 131200;
    }
    else {
      int v9 = 0x20000;
    }
    [v7 fetchNow:EMFetchTypeForcedAll | v9 withMailboxes:v6];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailboxesWaitingForFetch, 0);
  objc_storeStrong((id *)&self->_messageFetchService, 0);
  objc_storeStrong((id *)&self->_accountHandler, 0);
  objc_storeStrong((id *)&self->_mailboxListeningForNotificationsTo, 0);
  objc_storeStrong((id *)&self->_messageSender, 0);
  objc_storeStrong((id *)&self->_messageUpdater, 0);
  objc_storeStrong((id *)&self->_fullMessageLoader, 0);
  objc_storeStrong((id *)&self->_messageContentLoadersKeyedByMessageId, 0);
  objc_storeStrong((id *)&self->_syncProvider, 0);

  objc_storeStrong((id *)&self->_nanoServerQueue, 0);
}

@end