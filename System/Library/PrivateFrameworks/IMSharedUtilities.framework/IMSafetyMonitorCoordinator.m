@interface IMSafetyMonitorCoordinator
+ (id)sharedCoordinator;
- (BOOL)shouldDisallowBasedOnRegulatoryDomain;
- (BOOL)shouldDropIncomingCheckInMessageWithURL:(id)a3 senderHandle:(id)a4 isFromMe:(BOOL)a5;
- (NSDictionary)appPayload;
- (NSString)appPayloadID;
- (int64_t)notificationContentForInitiator:(id)a3 messageURL:(id)a4 content:(id)a5;
- (void)checkPreferredHandlesCacheForInitiatorHandleID:(id)a3 andReceiver:(id)a4 completion:(id)a5;
- (void)checkPreferredHandlesCacheForReceiverWith:(id)a3 completion:(id)a4;
- (void)informOfCancelledScheduledMessageSendWithMessageGUID:(id)a3 sentSuccessfully:(BOOL)a4 error:(id)a5;
- (void)informOfChangedGroupDisplayName:(id)a3;
- (void)informOfChangedGroupMembership:(id)a3;
- (void)informOfChangedGroupPhoto:(id)a3;
- (void)informOfDeletedConversationWithReceiverHandles:(id)a3;
- (void)informOfDeletedMessagesWithMessages:(id)a3;
- (void)informOfIncomingMessageWithMessage:(id)a3;
- (void)informOfKickFromGroup:(id)a3;
- (void)informOfOutgoingMessageWithMessage:(id)a3 sentSuccessfully:(BOOL)a4 error:(id)a5;
- (void)informOfScheduledMessage:(id)a3 sentSuccessfully:(BOOL)a4 error:(id)a5;
- (void)informOfSentScheduledMessage:(id)a3;
- (void)respondToNotificationWithIdentifier:(id)a3 sessionIdentifier:(id)a4 actionIdentifier:(id)a5 completion:(id)a6;
- (void)shouldShowKeyboardSuggestionForInitiator:(id)a3 andReceiver:(id)a4 completion:(id)a5;
- (void)shouldShowTipKitSuggestionForInitiator:(id)a3 andReceiver:(id)a4 completion:(id)a5;
@end

@implementation IMSafetyMonitorCoordinator

+ (id)sharedCoordinator
{
  if (qword_1EB4A6078 != -1) {
    dispatch_once(&qword_1EB4A6078, &unk_1EF2BF6E0);
  }
  v2 = (void *)qword_1EB4A6080;

  return v2;
}

- (NSString)appPayloadID
{
  v2 = +[IMSafetyMonitorCoordinator_Impl sharedCoordinator];
  v3 = [v2 appPayloadID];

  return (NSString *)v3;
}

- (NSDictionary)appPayload
{
  v2 = +[IMSafetyMonitorCoordinator_Impl sharedCoordinator];
  v3 = [v2 appPayload];

  return (NSDictionary *)v3;
}

- (BOOL)shouldDropIncomingCheckInMessageWithURL:(id)a3 senderHandle:(id)a4 isFromMe:(BOOL)a5
{
  uint64_t v5 = a5;
  id v7 = a4;
  id v8 = a3;
  v9 = +[IMSafetyMonitorCoordinator_Impl sharedCoordinator];
  LOBYTE(v5) = [v9 shouldDropIncomingCheckInMessageWithURL:v8 senderHandle:v7 isFromMe:v5];

  return v5;
}

- (void)informOfOutgoingMessageWithMessage:(id)a3 sentSuccessfully:(BOOL)a4 error:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = a3;
  id v9 = +[IMSafetyMonitorCoordinator_Impl sharedCoordinator];
  [v9 informOfOutgoingMessageWithMessage:v8 sentSuccessfully:v5 error:v7];
}

- (void)informOfIncomingMessageWithMessage:(id)a3
{
  id v3 = a3;
  id v4 = +[IMSafetyMonitorCoordinator_Impl sharedCoordinator];
  [v4 informOfIncomingMessageWithMessage:v3];
}

- (void)informOfDeletedMessagesWithMessages:(id)a3
{
  id v3 = a3;
  id v4 = +[IMSafetyMonitorCoordinator_Impl sharedCoordinator];
  [v4 informOfDeletedMessagesWithMessages:v3];
}

- (void)informOfDeletedConversationWithReceiverHandles:(id)a3
{
  id v3 = a3;
  id v4 = +[IMSafetyMonitorCoordinator_Impl sharedCoordinator];
  [v4 informOfDeletedConversationWithReceiverHandles:v3];
}

- (void)informOfScheduledMessage:(id)a3 sentSuccessfully:(BOOL)a4 error:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = a3;
  id v9 = +[IMSafetyMonitorCoordinator_Impl sharedCoordinator];
  [v9 informOfScheduledMessageSendWithMessage:v8 sentSuccessfully:v5 error:v7];
}

- (void)informOfCancelledScheduledMessageSendWithMessageGUID:(id)a3 sentSuccessfully:(BOOL)a4 error:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = a3;
  id v9 = +[IMSafetyMonitorCoordinator_Impl sharedCoordinator];
  [v9 informOfCancelledScheduledMessageSendWithMessageGUID:v8 sentSuccessfully:v5 error:v7];
}

- (void)informOfSentScheduledMessage:(id)a3
{
  id v3 = a3;
  id v4 = +[IMSafetyMonitorCoordinator_Impl sharedCoordinator];
  [v4 informOfTriggeredScheduledMessageSendWithMessage:v3];
}

- (void)informOfChangedGroupMembership:(id)a3
{
  id v3 = a3;
  id v4 = +[IMSafetyMonitorCoordinator_Impl sharedCoordinator];
  [v4 informOfChangedGroupMembershipWithGroupID:v3];
}

- (void)informOfKickFromGroup:(id)a3
{
  id v3 = a3;
  id v4 = +[IMSafetyMonitorCoordinator_Impl sharedCoordinator];
  [v4 informOfKickFromGroupWithGroupID:v3];
}

- (void)informOfChangedGroupDisplayName:(id)a3
{
  id v3 = a3;
  id v4 = +[IMSafetyMonitorCoordinator_Impl sharedCoordinator];
  [v4 informOfChangedGroupDisplayNameWithGroupID:v3];
}

- (void)informOfChangedGroupPhoto:(id)a3
{
  id v3 = a3;
  id v4 = +[IMSafetyMonitorCoordinator_Impl sharedCoordinator];
  [v4 informOfChangedGroupPhotoWithGroupID:v3];
}

- (void)checkPreferredHandlesCacheForReceiverWith:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[IMSafetyMonitorCoordinator_Impl sharedCoordinator];
  [v7 checkPreferredHandlesCacheForReceiverWith:v6 completion:v5];
}

- (void)checkPreferredHandlesCacheForInitiatorHandleID:(id)a3 andReceiver:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[IMSafetyMonitorCoordinator_Impl sharedCoordinator];
  [v10 checkPreferredHandlesCacheForInitiatorHandleID:v9 andReceiver:v8 completion:v7];
}

- (void)shouldShowKeyboardSuggestionForInitiator:(id)a3 andReceiver:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[IMSafetyMonitorCoordinator_Impl sharedCoordinator];
  [v10 shouldShowKeyboardSuggestionForInitiator:v9 andReceiver:v8 completion:v7];
}

- (void)shouldShowTipKitSuggestionForInitiator:(id)a3 andReceiver:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[IMSafetyMonitorCoordinator_Impl sharedCoordinator];
  [v10 shouldShowTipKitSuggestionForInitiator:v9 andReceiver:v8 completion:v7];
}

- (int64_t)notificationContentForInitiator:(id)a3 messageURL:(id)a4 content:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[IMSafetyMonitorCoordinator_Impl sharedCoordinator];
  int64_t v11 = [v10 notificationContentForInitiator:v9 messageURL:v8 content:v7];

  return v11;
}

- (BOOL)shouldDisallowBasedOnRegulatoryDomain
{
  v2 = +[IMSafetyMonitorCoordinator_Impl sharedCoordinator];
  char v3 = [v2 shouldDisallowBasedOnRegulatoryDomain];

  return v3;
}

- (void)respondToNotificationWithIdentifier:(id)a3 sessionIdentifier:(id)a4 actionIdentifier:(id)a5 completion:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = +[IMSafetyMonitorCoordinator_Impl sharedCoordinator];
  [v13 respondToNotificationWithIdentifier:v12 sessionIdentifier:v11 actionIdentifier:v10 completion:v9];
}

@end