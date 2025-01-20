@interface IMDaemonAutomationRequestHandler
- (void)_automation_markMessagesAsRead:(BOOL)a3 messageGUID:(id)a4 forChatGUID:(id)a5 fromMe:(BOOL)a6 queryID:(id)a7;
- (void)_automation_sendDictionary:(id)a3 options:(id)a4 toHandles:(id)a5;
- (void)beginRecordingMessagesToReplayDatabase:(id)a3;
- (void)debugUpdateGroupParticipantversion:(int64_t)a3 chatIdentifier:(id)a4;
- (void)logDumpAndSendMessageTo:(id)a3 forHours:(int)a4;
- (void)relayMessageGUID:(id)a3 completion:(id)a4;
- (void)relayMessageGUIDSent:(id)a3 onService:(id)a4 interworked:(BOOL)a5;
- (void)replayMessagesFromDatabasePath:(id)a3;
- (void)simulateAppDeletion;
- (void)simulateAppInstallation;
- (void)simulateDowngradeRequestFromID:(id)a3 fromService:(id)a4 toService:(id)a5 expirationDate:(id)a6;
- (void)simulateMessageReceive:(id)a3 serviceName:(id)a4 groupID:(id)a5 handles:(id)a6 sender:(id)a7;
- (void)simulateMessageReceive:(id)a3 serviceName:(id)a4 groupID:(id)a5 handles:(id)a6 sender:(id)a7 date:(id)a8 associatedMessageType:(int64_t)a9 associatedMessageGuid:(id)a10;
- (void)simulateMessages:(id)a3 completion:(id)a4;
- (void)simulateReceivedPendingSatelliteMessageForChatWithGUID:(id)a3;
- (void)stopRecordingMessagesReplayDatabase;
- (void)test_firstUnlockCompleted;
- (void)updateOffGridSummaryOnChatWithGUID:(id)a3 pendingMessageCount:(int64_t)a4;
@end

@implementation IMDaemonAutomationRequestHandler

- (void)simulateMessageReceive:(id)a3 serviceName:(id)a4 groupID:(id)a5 handles:(id)a6 sender:(id)a7
{
}

- (void)simulateMessageReceive:(id)a3 serviceName:(id)a4 groupID:(id)a5 handles:(id)a6 sender:(id)a7 date:(id)a8 associatedMessageType:(int64_t)a9 associatedMessageGuid:(id)a10
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a10;
  if (IMOSLoggingEnabled())
  {
    v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      id v25 = v15;
      __int16 v26 = 2112;
      id v27 = v16;
      __int16 v28 = 2112;
      id v29 = v17;
      __int16 v30 = 2112;
      id v31 = v18;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Received request to simulate receiving a message with content %@ service %@ groupID: %@ handles %@", buf, 0x2Au);
    }
  }
  v23 = +[IMDChatRegistry sharedInstance];
  [v23 simulateMessageReceive:v15 serviceName:v16 groupID:v17 handles:v18 sender:v19 date:v20 associatedMessageType:a9 associatedMessageGuid:v21];
}

- (void)replayMessagesFromDatabasePath:(id)a3
{
  id v3 = a3;
  v4 = +[NSString stringGUID];
  v5 = [v3 lastPathComponent];
  v6 = +[NSString stringWithFormat:@"/tmp/%@-%@", v4, v5];

  v7 = +[NSFileManager defaultManager];
  LODWORD(v5) = [v7 copyItemAtPath:v3 toPath:v6 error:0];

  if (v5)
  {
    v8 = +[NSFileManager defaultManager];
    v9 = [v3 stringByAppendingString:@"-wal"];
    v10 = [v6 stringByAppendingString:@"-wal"];
    [v8 copyItemAtPath:v9 toPath:v10 error:0];

    v11 = +[NSFileManager defaultManager];
    v12 = [v3 stringByAppendingString:@"-shm"];
    v13 = [v6 stringByAppendingString:@"-shm"];
    [v11 copyItemAtPath:v12 toPath:v13 error:0];

    v14 = +[IMDReplayController sharedInstance];
    [v14 overrideStorageControllerWithDatabaseFromPath:v6];

    id v15 = +[IMDReplayController sharedInstance];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10000A89C;
    v16[3] = &unk_100071668;
    id v17 = v6;
    [v15 replayMessagesWithCompletion:v16];
  }
}

- (void)beginRecordingMessagesToReplayDatabase:(id)a3
{
  id v3 = a3;
  v4 = +[IMDReplayController sharedInstance];
  [v4 overrideStorageControllerWithDatabaseFromPath:v3];

  id v5 = +[IMDReplayController sharedInstance];
  [v5 startRecordingReplayDatabase];
}

- (void)stopRecordingMessagesReplayDatabase
{
  v2 = +[IMDReplayController sharedInstance];
  [v2 endRecordingReplayDatabase];

  id v3 = +[IMDReplayController sharedInstance];
  [v3 restoreDefaultStoreControllerInstance];
}

- (void)_automation_sendDictionary:(id)a3 options:(id)a4 toHandles:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = +[IMDAccountController sharedAccountController];
  id v11 = [v10 anySessionForServiceName:IMServiceNameiMessage];

  objc_msgSend(v11, "_automation_sendDictionary:options:toHandles:", v9, v8, v7);
}

- (void)_automation_markMessagesAsRead:(BOOL)a3 messageGUID:(id)a4 forChatGUID:(id)a5 fromMe:(BOOL)a6 queryID:(id)a7
{
  BOOL v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a7;
  v14 = +[IMDClientRequestContext currentContext];
  id v15 = [v14 replyProxy];

  if (IMOSLoggingEnabled())
  {
    id v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      id v17 = +[IMDClientRequestContext currentContext];
      id v18 = [v17 listenerID];
      CFStringRef v19 = @"NO";
      *(_DWORD *)buf = 138413058;
      id v31 = v18;
      if (v10) {
        CFStringRef v19 = @"YES";
      }
      __int16 v32 = 2112;
      CFStringRef v33 = v19;
      __int16 v34 = 2112;
      id v35 = v11;
      __int16 v36 = 2112;
      id v37 = v12;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "AUTOMATION Request from %@ to mark as read: %@ messageGUID %@ chatGUID: %@", buf, 0x2Au);
    }
  }
  if (v10)
  {
    buf[0] = 0;
    IMComponentsFromChatGUID();
    id v20 = 0;
    id v21 = 0;
    if (a6)
    {
      v22 = +[IMDMessageStore sharedInstance];
      id v27 = v12;
      v23 = +[NSArray arrayWithObjects:&v27 count:1];
      v24 = +[NSDate date];
      id v25 = [v22 markMessagesAsReadWithChatGUIDs:v23 upToGUID:v11 readDate:v24 fromMe:1];
    }
    else
    {
      id v29 = v20;
      v22 = +[NSArray arrayWithObjects:&v29 count:1];
      uint64_t v26 = buf[0];
      id v28 = v21;
      v23 = +[NSArray arrayWithObjects:&v28 count:1];
      sub_10001FFE0(v22, v26, v23, 0, 0, 0);
    }
  }
  else
  {
    IMDMessageRecordMarkMessagesAsUnreadWithChatGUIDUpToGUIDFromMe();
  }
  objc_msgSend(v15, "_automation_markAsReadQuery:finishedWithResult:", v13, 1);
}

- (void)logDumpAndSendMessageTo:(id)a3 forHours:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  id v6 = +[IMDCKUtilities sharedInstance];
  [v6 logDumpAndSendMessageTo:v5 forHours:v4 reason:@"IMToolRequest"];
}

- (void)debugUpdateGroupParticipantversion:(int64_t)a3 chatIdentifier:(id)a4
{
  id v18 = a4;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = +[NSNumber numberWithInteger:a3];
      *(_DWORD *)buf = 138412546;
      id v28 = v18;
      __int16 v29 = 2112;
      int64_t v30 = (int64_t)v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "debugUpdateGroupParticipantversion Request to update participant version of chat %@ to %@", buf, 0x16u);
    }
  }
  id v7 = +[IMDChatRegistry sharedInstance];
  id v20 = [v7 allExistingChatsWithIdentifier:v19 style:43];

  if ([v20 count])
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id obj = v20;
    id v8 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v23;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          id v12 = [objc_alloc((Class)NSNumber) initWithUnsignedInteger:a3];
          if (IMOSLoggingEnabled())
          {
            id v13 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              v14 = [v11 guid];
              *(_DWORD *)buf = 138412546;
              id v28 = v14;
              __int16 v29 = 2048;
              int64_t v30 = a3;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Setting participant version of chat %@ to %ld", buf, 0x16u);
            }
          }
          Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          id v16 = Mutable;
          if (v12) {
            CFDictionarySetValue(Mutable, @"pv", v12);
          }
          [v11 updateProperties:v16];
        }
        id v8 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v8);
    }
  }
  else if (IMOSLoggingEnabled())
  {
    id v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v19;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Did not find chat with guid %@ to update version", buf, 0xCu);
    }
  }
}

- (void)test_firstUnlockCompleted
{
  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "imtool requested first unlock simulation", v4, 2u);
    }
  }
  id v3 = +[IMDChatRegistry sharedInstance];
  [v3 systemDidLeaveFirstDataProtectionLock];
}

- (void)simulateMessages:(id)a3 completion:(id)a4
{
  id v5 = _Block_copy(a4);
  sub_1000429C4();
  uint64_t v6 = sub_10004D250();
  _Block_copy(v5);
  id v7 = self;
  sub_100042A04(v6, (uint64_t)v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void)updateOffGridSummaryOnChatWithGUID:(id)a3 pendingMessageCount:(int64_t)a4
{
  uint64_t v6 = sub_10004D210();
  uint64_t v8 = v7;
  uint64_t v9 = self;
  _sSo32IMDaemonAutomationRequestHandlerC7imagentE26updateOffGridSummaryOnChat8withGUID19pendingMessageCountySS_SitF_0(v6, v8, a4);

  swift_bridgeObjectRelease();
}

- (void)simulateReceivedPendingSatelliteMessageForChatWithGUID:(id)a3
{
  sub_10004D210();
  uint64_t v4 = self;
  _sSo32IMDaemonAutomationRequestHandlerC7imagentE46simulateReceivedPendingSatelliteMessageForChat8withGUIDySS_tF_0();

  swift_bridgeObjectRelease();
}

- (void)simulateDowngradeRequestFromID:(id)a3 fromService:(id)a4 toService:(id)a5 expirationDate:(id)a6
{
  id v12 = self;
  uint64_t v6 = sub_10004CEE0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10004D210();
  sub_10004D210();
  sub_10004D210();
  sub_10004CED0();
  BOOL v10 = v12;
  _sSo32IMDaemonAutomationRequestHandlerC7imagentE017simulateDowngradeC06fromID0H7Service02toJ014expirationDateySS_S2S10Foundation0M0VtF_0();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)relayMessageGUID:(id)a3 completion:(id)a4
{
  id v5 = _Block_copy(a4);
  uint64_t v6 = sub_10004D210();
  uint64_t v8 = v7;
  _Block_copy(v5);
  uint64_t v9 = self;
  sub_1000431DC(v6, v8, (void (**)(void, void))v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void)relayMessageGUIDSent:(id)a3 onService:(id)a4 interworked:(BOOL)a5
{
  BOOL v5 = a5;
  sub_10004D210();
  sub_10004D210();
  uint64_t v7 = self;
  uint64_t v8 = self;
  id v9 = [v7 sharedInstance];
  if (v9)
  {
    BOOL v10 = v9;
    NSString v11 = sub_10004D200();
    id v12 = sub_10004D200();
    [v10 messageSent:v11 onService:v12 compatibilityService:0 wasInterworked:v5];

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

- (void)simulateAppDeletion
{
  v2 = self;
  id v3 = (id *)sub_10003D25C();
  uint64_t v4 = *(void (**)(void))((swift_isaMask & *(void *)*v3) + 0xD0);
  id v5 = *v3;
  v4();
}

- (void)simulateAppInstallation
{
  v2 = self;
  id v3 = (id *)sub_10003D25C();
  uint64_t v4 = *(void (**)(void))((swift_isaMask & *(void *)*v3) + 0xC8);
  id v5 = *v3;
  v4();
}

@end