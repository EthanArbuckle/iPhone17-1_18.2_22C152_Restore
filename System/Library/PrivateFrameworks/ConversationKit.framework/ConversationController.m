@interface ConversationController
- (NSString)description;
- (_TtC15ConversationKit22ConversationController)init;
- (void)dealloc;
- (void)frequencyController:(id)a3 audioPowerChanged:(float)a4 forParticipantWithStreamToken:(int64_t)a5;
- (void)handleAudioUplinkChange:(id)a3;
- (void)handleBluetoothAudioFormatChanged:(id)a3;
- (void)handleCallConnected:(id)a3;
- (void)handleCallStartedConnecting:(id)a3;
- (void)handleCallStatusDidChange:(id)a3;
- (void)handleCameraBlurEnabledChanged:(id)a3;
- (void)handleCameraCinematicFramingAvailabilityChanged:(id)a3;
- (void)handleCameraCinematicFramingEnabledChanged:(id)a3;
- (void)handleCameraListDidChange:(id)a3;
- (void)handleCameraReactionEffectsEnabledChanged:(id)a3;
- (void)handleCameraStudioLightEnabledChanged:(id)a3;
- (void)handleCameraZoomBecameAvailable:(id)a3;
- (void)handleCameraZoomBecameUnavailable:(id)a3;
- (void)handleHoldMusicDidChange:(id)a3;
- (void)handleLocalPreviewChanged:(id)a3;
- (void)handleLocalVideoAttributesChanged:(id)a3;
- (void)handleLocalVideoPreviewFirstFrameArrived:(id)a3;
- (void)handlePTTCallStatusDidChange:(id)a3;
- (void)handleScreenConnectionDidUpdate:(id)a3;
- (void)handleScreenSharingAttributesChanged:(id)a3;
- (void)handleScreenSharingDidChange:(id)a3;
- (void)handleSendingVideoChanged:(id)a3;
- (void)handleSystemPreferredCameraChanged:(id)a3;
- (void)handleVideoCallStatusDidChange:(id)a3;
- (void)handleWindowDidFinishResize:(id)a3;
- (void)handlelocalCameraUIDDidChange:(id)a3;
- (void)momentsController:(id)a3 didUpdateCapabilities:(id)a4 forProvider:(id)a5;
- (void)momentsController:(id)a3 willCaptureRemoteRequestFromIdentifier:(id)a4;
- (void)remoteVideoClient:(id)a3 networkQualityDidDegrade:(BOOL)a4 info:(id)a5;
- (void)remoteVideoClient:(id)a3 remoteMediaDidStall:(BOOL)a4;
- (void)remoteVideoClient:(id)a3 remoteScreenAttributesDidChange:(id)a4;
- (void)remoteVideoClient:(id)a3 remoteVideoAttributesDidChange:(id)a4;
- (void)remoteVideoClient:(id)a3 remoteVideoDidPause:(BOOL)a4;
- (void)remoteVideoClient:(id)a3 videoDidDegrade:(BOOL)a4;
- (void)remoteVideoClient:(id)a3 videoDidSuspend:(BOOL)a4;
- (void)remoteVideoClientDidReceiveFirstFrame:(id)a3;
- (void)toggleStudioLight;
@end

@implementation ConversationController

- (NSString)description
{
  v2 = self;
  ConversationController.description.getter();
  uint64_t v4 = v3;
  uint64_t v6 = v5;

  v7 = (void *)MEMORY[0x1C87730B0](v4, v6);
  swift_bridgeObjectRelease();
  return (NSString *)v7;
}

- (void)dealloc
{
  v2 = self;
  ConversationController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  _s15ConversationKit11ParticipantVWOhTm_13((uint64_t)self + OBJC_IVAR____TtC15ConversationKit22ConversationController_localParticipant, (void (*)(void))type metadata accessor for Participant);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit22ConversationController_audioFrequencyController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit22ConversationController_audioCallbackQueue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit22ConversationController____lazy_storage___momentsController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit22ConversationController_lastRegisteredMomentsProvider));
  swift_bridgeObjectRelease();
  outlined destroy of SystemUpdateNotice?((uint64_t)self+ OBJC_IVAR____TtC15ConversationKit22ConversationController_pendingNoticeWaitingForRemoteScreenShareAttributes, (uint64_t *)&demangling cache variable for type metadata for (activeConversation: Conversation, participant: Participant, notice: TUConversationNotice)?);
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit22ConversationController_videoMessageController));
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_didAddVisibleParticipant);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_didRemoveVisibleParticipant);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_didRemoveAllVisibleParticipants);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_didFinishMigratingConversations);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_didUpdateVisibleParticipant);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_visibleParticipantDidBecomeActive);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_visibleParticipantDidBecomeInactive);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_visibleParticipantKickableStatusDidChange);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_didStartVideoForVisibleParticipant);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_didUpdateVisibleParticipantScreenInfo);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_participantsMediaPrioritiesDidChange);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_participantDidReact);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_participantDidStopReacting);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_participantAudioPowerDidChange);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_mutedTalkerDidChange);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_audioRouteDidChange);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_cameraBlurEnabledDidChange);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_cameraZoomAvailabiltyDidChange);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_localCameraUIDDidChange);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_cameraListDidChange);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_cameraOrientationUpdateDidGetSnapshot);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_cameraCinematicFramingAvailabilityDidChange);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_cameraCinematicFramingEnabledDidChange);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_cameraReactionEffectsEnabledDidChange);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_cameraStudioLightEnabledDidChange);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_carPlayConnectedDidChange);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_oneToOneModeDidChange);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_isTrackingActiveConversationDidChange);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_avModeDidChange);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_resolvedAudioVideoModeDidChange);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_isWaitingOnFirstRemoteFrameDidChange);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_activitiesDidChange);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_collaborationNoticePosted);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_screenSharingRequestsChanged);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_audioPausedDidChange);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_bluetoothAudioFormatChanged);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_didUpdateLocalParticipant);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_didUpdateLocalMemberAuthorizedToChangeGroupMembership);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_didUpdateLocalParticipantCameraPosition);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_didUpdateRecordingLocalVideo);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_didFinishWindowResize);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_didUpdateLocalScreenSharing);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_didUpdateHasRingingCalls);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_didUpdateWantsHoldMusic);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_didStartVideoForLocalParticipant);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_conversationStateDidChange);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_conversationLetMeInRequestStateDidChange);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_conversationIgnoreLetMeInRequestsDidChange);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_conversationRejectedParticipantsCountDidChange);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_didAddPendingParticipant);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_didRemovePendingParticipant);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_didApprovePendingParticipant);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_didUpdateParticipantAVMode);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_didInviteOtherParticipants);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_cameraPositionDidChange);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_groupNameAndPhotoDidChange);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_sessionActionNoticePosted);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_appLaunchStateChanged);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_willTakeMoment);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_shouldPauseOnFirstLocalVideoFrame);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_conversationLinkDidChange);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_didFailToStartCamera);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_callStatusDidChange);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_greenTea3PCallStatusChanged);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_pttCallStatusDidChange);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_localParticipantRequestedVideoUpgrade);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_didUpdateCaptions);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_didToggleCaptions);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_didUpdateIDSCapabilities);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_videoMessageErrorOccured);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_screenSharingAvailabilityDidChange);
  OUTLINED_FUNCTION_250(OBJC_IVAR____TtC15ConversationKit22ConversationController_isRemoteParticipantEligibleForVideoMessagingBlock);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC15ConversationKit22ConversationController_participantMediaProviderCreator);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC15ConversationKit22ConversationController_participantCaptionsProviderCreator);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC15ConversationKit22ConversationController_callCenter);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  outlined destroy of SystemUpdateNotice?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit22ConversationController_conversationUUID, (uint64_t *)&demangling cache variable for type metadata for UUID?);
  outlined destroy of SystemUpdateNotice?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit22ConversationController_videoMessageConversationUUID, (uint64_t *)&demangling cache variable for type metadata for UUID?);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of SystemUpdateNotice?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit22ConversationController_callUUIDResolvingCroppedAspectRatio, (uint64_t *)&demangling cache variable for type metadata for UUID?);
  swift_bridgeObjectRelease();
  outlined destroy of SystemUpdateNotice?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit22ConversationController_screenSharingSession, (uint64_t *)&demangling cache variable for type metadata for ScreenSharingSessionProvider?);
  swift_release();
}

- (void)toggleStudioLight
{
  v2 = self;
  ConversationController.toggleStudioLight()();
}

- (_TtC15ConversationKit22ConversationController)init
{
}

- (void)frequencyController:(id)a3 audioPowerChanged:(float)a4 forParticipantWithStreamToken:(int64_t)a5
{
  id v6 = a3;
  v7 = self;
  ConversationController.frequencyController(_:audioPowerChanged:forParticipantWithStreamToken:)();
}

- (void)momentsController:(id)a3 didUpdateCapabilities:(id)a4 forProvider:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  ConversationController.momentsController(_:didUpdate:for:)((uint64_t)v11, v9, v10);
}

- (void)momentsController:(id)a3 willCaptureRemoteRequestFromIdentifier:(id)a4
{
  if (a4) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v6 = a3;
  v7 = self;
  ConversationController.momentsController(_:willCaptureRemoteRequestFromIdentifier:)();

  swift_bridgeObjectRelease();
}

- (void)remoteVideoClientDidReceiveFirstFrame:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  ConversationController.remoteVideoClientDidReceiveFirstFrame(_:)();
}

- (void)remoteVideoClient:(id)a3 videoDidSuspend:(BOOL)a4
{
  id v5 = a3;
  id v6 = self;
  ConversationController.remoteVideoClient(_:videoDidSuspend:)();
}

- (void)remoteVideoClient:(id)a3 remoteVideoDidPause:(BOOL)a4
{
  id v5 = a3;
  id v6 = self;
  ConversationController.remoteVideoClient(_:remoteVideoDidPause:)();
}

- (void)remoteVideoClient:(id)a3 networkQualityDidDegrade:(BOOL)a4 info:(id)a5
{
  if (a5) {
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v7 = a3;
  id v8 = self;
  ConversationController.remoteVideoClient(_:networkQualityDidDegrade:info:)();

  swift_bridgeObjectRelease();
}

- (void)remoteVideoClient:(id)a3 videoDidDegrade:(BOOL)a4
{
  id v5 = a3;
  id v6 = self;
  ConversationController.remoteVideoClient(_:videoDidDegrade:)();
}

- (void)remoteVideoClient:(id)a3 remoteMediaDidStall:(BOOL)a4
{
  id v5 = a3;
  id v6 = self;
  ConversationController.remoteVideoClient(_:remoteMediaDidStall:)();
}

- (void)remoteVideoClient:(id)a3 remoteVideoAttributesDidChange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  ConversationController.remoteVideoClient(_:remoteVideoAttributesDidChange:)();
}

- (void)remoteVideoClient:(id)a3 remoteScreenAttributesDidChange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  ConversationController.remoteVideoClient(_:remoteScreenAttributesDidChange:)();
}

- (void)handleCameraZoomBecameAvailable:(id)a3
{
}

- (void)handleCameraZoomBecameUnavailable:(id)a3
{
}

- (void)handlelocalCameraUIDDidChange:(id)a3
{
}

- (void)handleCameraListDidChange:(id)a3
{
}

- (void)handleSystemPreferredCameraChanged:(id)a3
{
}

- (void)handleAudioUplinkChange:(id)a3
{
}

- (void)handleCameraCinematicFramingAvailabilityChanged:(id)a3
{
}

- (void)handleCameraCinematicFramingEnabledChanged:(id)a3
{
}

- (void)handleCameraReactionEffectsEnabledChanged:(id)a3
{
}

- (void)handleCameraStudioLightEnabledChanged:(id)a3
{
}

- (void)handleCameraBlurEnabledChanged:(id)a3
{
}

- (void)handleLocalPreviewChanged:(id)a3
{
}

- (void)handleLocalVideoPreviewFirstFrameArrived:(id)a3
{
}

- (void)handleLocalVideoAttributesChanged:(id)a3
{
}

- (void)handleSendingVideoChanged:(id)a3
{
}

- (void)handleWindowDidFinishResize:(id)a3
{
}

- (void)handleScreenConnectionDidUpdate:(id)a3
{
}

- (void)handleScreenSharingDidChange:(id)a3
{
}

- (void)handleScreenSharingAttributesChanged:(id)a3
{
}

- (void)handleCallStartedConnecting:(id)a3
{
}

- (void)handleCallConnected:(id)a3
{
}

- (void)handleVideoCallStatusDidChange:(id)a3
{
}

- (void)handleCallStatusDidChange:(id)a3
{
}

- (void)handleHoldMusicDidChange:(id)a3
{
}

- (void)handleBluetoothAudioFormatChanged:(id)a3
{
}

- (void)handlePTTCallStatusDidChange:(id)a3
{
}

@end