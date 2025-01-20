@interface CallCenter
- (_TtC15ConversationKit10CallCenter)init;
- (void)audioDeviceControllerMutedTalkerDidEnd:(id)a3;
- (void)audioDeviceControllerMutedTalkerDidStart:(id)a3;
- (void)conversationManager:(id)a3 activeRemoteParticipantsChangedForConversation:(id)a4;
- (void)conversationManager:(id)a3 activitySessionsChangedForConversation:(id)a4 fromOldConversation:(id)a5;
- (void)conversationManager:(id)a3 addedActiveConversation:(id)a4;
- (void)conversationManager:(id)a3 avModeChangedForConversation:(id)a4;
- (void)conversationManager:(id)a3 cameraMixedWithScreenDidChangeForConversation:(id)a4;
- (void)conversationManager:(id)a3 collaborationChanged:(id)a4 forConversation:(id)a5 collaborationState:(int64_t)a6;
- (void)conversationManager:(id)a3 conversation:(id)a4 participant:(id)a5 addedCollaborationNotice:(id)a6;
- (void)conversationManager:(id)a3 conversation:(id)a4 participant:(id)a5 addedNotice:(id)a6;
- (void)conversationManager:(id)a3 ignoreLMIRequestsChangedForConversation:(id)a4;
- (void)conversationManager:(id)a3 letMeInRequestStateChangedForConversation:(id)a4;
- (void)conversationManager:(id)a3 linkChangedForConversation:(id)a4;
- (void)conversationManager:(id)a3 linkInvitedMemberHandlesChangedForConversation:(id)a4;
- (void)conversationManager:(id)a3 localVideoToggledForConversation:(id)a4;
- (void)conversationManager:(id)a3 migratingFromConversation:(id)a4 toConversation:(id)a5;
- (void)conversationManager:(id)a3 oneToOneModeChangedForConversation:(id)a4;
- (void)conversationManager:(id)a3 otherInvitedHandlesChangedForConversation:(id)a4;
- (void)conversationManager:(id)a3 pendingMembersChangedForConversation:(id)a4;
- (void)conversationManager:(id)a3 rejectedMembersChangedForConversation:(id)a4;
- (void)conversationManager:(id)a3 remoteMembersChangedForConversation:(id)a4;
- (void)conversationManager:(id)a3 remoteScreenShareAttributesChanged:(id)a4 isLocallySharing:(BOOL)a5;
- (void)conversationManager:(id)a3 removedActiveConversation:(id)a4;
- (void)conversationManager:(id)a3 resolvedAudioVideoModeChangedForConversation:(id)a4;
- (void)conversationManager:(id)a3 screenSharingAvailableChanged:(BOOL)a4;
- (void)conversationManager:(id)a3 screenSharingRequestsChangedForConversation:(id)a4 fromOldConversation:(id)a5;
- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4;
- (void)mediaController:(id)a3 participantMediaPrioritiesChangedForConversation:(id)a4;
- (void)routesChangedForRouteController:(id)a3;
@end

@implementation CallCenter

- (_TtC15ConversationKit10CallCenter)init
{
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC15ConversationKit10CallCenter_delegate;
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)v3);
}

- (void)audioDeviceControllerMutedTalkerDidStart:(id)a3
{
  id v4 = a3;
  v5 = self;
  CallCenter.audioDeviceControllerMutedTalkerDidStart(_:)();
}

- (void)audioDeviceControllerMutedTalkerDidEnd:(id)a3
{
  id v4 = a3;
  v5 = self;
  CallCenter.audioDeviceControllerMutedTalkerDidEnd(_:)();
}

- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  CallCenter.conversationManager(_:stateChangedFor:)();
}

- (void)conversationManager:(id)a3 localVideoToggledForConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  CallCenter.conversationManager(_:localVideoToggledFor:)();
}

- (void)conversationManager:(id)a3 remoteMembersChangedForConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  CallCenter.conversationManager(_:remoteMembersChangedFor:)();
}

- (void)conversationManager:(id)a3 activeRemoteParticipantsChangedForConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  CallCenter.conversationManager(_:activeRemoteParticipantsChangedFor:)((uint64_t)v8, v7);
}

- (void)conversationManager:(id)a3 pendingMembersChangedForConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  CallCenter.conversationManager(_:pendingMembersChangedFor:)();
}

- (void)conversationManager:(id)a3 otherInvitedHandlesChangedForConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  CallCenter.conversationManager(_:otherInvitedHandlesChangedFor:)();
}

- (void)conversationManager:(id)a3 oneToOneModeChangedForConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  CallCenter.conversationManager(_:oneToOneModeChangedFor:)();
}

- (void)conversationManager:(id)a3 avModeChangedForConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  CallCenter.conversationManager(_:avModeChangedFor:)();
}

- (void)conversationManager:(id)a3 resolvedAudioVideoModeChangedForConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  CallCenter.conversationManager(_:resolvedAudioVideoModeChangedFor:)();
}

- (void)conversationManager:(id)a3 removedActiveConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  CallCenter.conversationManager(_:removedActiveConversation:)();
}

- (void)conversationManager:(id)a3 addedActiveConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  CallCenter.conversationManager(_:addedActiveConversation:)();
}

- (void)conversationManager:(id)a3 letMeInRequestStateChangedForConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  CallCenter.conversationManager(_:letMeInRequestStateChangedFor:)();
}

- (void)conversationManager:(id)a3 ignoreLMIRequestsChangedForConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  CallCenter.conversationManager(_:ignoreLMIRequestsChangedFor:)();
}

- (void)conversationManager:(id)a3 rejectedMembersChangedForConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  CallCenter.conversationManager(_:rejectedMembersChangedFor:)();
}

- (void)conversationManager:(id)a3 linkChangedForConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  CallCenter.conversationManager(_:linkChangedFor:)();
}

- (void)conversationManager:(id)a3 screenSharingAvailableChanged:(BOOL)a4
{
  id v5 = a3;
  id v6 = self;
  CallCenter.conversationManager(_:screenSharingAvailableChanged:)();
}

- (void)conversationManager:(id)a3 linkInvitedMemberHandlesChangedForConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  CallCenter.conversationManager(_:linkInvitedMemberHandlesChangedFor:)();
}

- (void)conversationManager:(id)a3 migratingFromConversation:(id)a4 toConversation:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  CallCenter.conversationManager(_:migratingFrom:to:)();
}

- (void)conversationManager:(id)a3 activitySessionsChangedForConversation:(id)a4 fromOldConversation:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  CallCenter.conversationManager(_:activitySessionsChangedFor:fromOldConversation:)();
}

- (void)conversationManager:(id)a3 conversation:(id)a4 participant:(id)a5 addedNotice:(id)a6
{
}

- (void)conversationManager:(id)a3 remoteScreenShareAttributesChanged:(id)a4 isLocallySharing:(BOOL)a5
{
  id v8 = a3;
  swift_unknownObjectRetain();
  id v9 = self;
  CallCenter.conversationManager(_:remoteScreenShareAttributesChanged:isLocallySharing:)((uint64_t)v9, (uint64_t)a4, a5);

  swift_unknownObjectRelease();
}

- (void)conversationManager:(id)a3 collaborationChanged:(id)a4 forConversation:(id)a5 collaborationState:(int64_t)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = self;
  CallCenter.conversationManager(_:collaborationChanged:for:collaborationState:)();
}

- (void)conversationManager:(id)a3 conversation:(id)a4 participant:(id)a5 addedCollaborationNotice:(id)a6
{
}

- (void)conversationManager:(id)a3 cameraMixedWithScreenDidChangeForConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  CallCenter.conversationManager(_:cameraMixedWithScreenDidChangeFor:)();
}

- (void)conversationManager:(id)a3 screenSharingRequestsChangedForConversation:(id)a4 fromOldConversation:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = self;
  CallCenter.conversationManager(_:screenSharingRequestsChangedFor:fromOldConversation:)();
}

- (void)mediaController:(id)a3 participantMediaPrioritiesChangedForConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  CallCenter.mediaController(_:participantMediaPrioritiesChangedFor:)();
}

- (void)routesChangedForRouteController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  CallCenter.routesChanged(for:)();
}

@end