@interface ConversationControlsManager
- (BOOL)isConfirmLeavePTTChannelAlertPresented;
- (_TtC15ConversationKit27ConversationControlsManager)init;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (void)acceptCallButtonTappedWithButton:(id)a3;
- (void)acceptNameTappedWithButton:(id)a3;
- (void)acceptRemoteControlRequestTappedWithButton:(id)a3;
- (void)acceptScreenShare;
- (void)acceptScreenShareRequestTappedWithButton:(id)a3;
- (void)acceptScreenShareWithDisplayStyle;
- (void)accessibilityDidAddPendingParticipant:(id)a3;
- (void)avLessContinueButtonTappedWithButton:(id)a3;
- (void)callAgainButtonTappedWithButton:(id)a3;
- (void)cancelRemoteControlRequestTappedWithButton:(id)a3;
- (void)cancelScreenShareRequestTappedWithButton:(id)a3;
- (void)choosePhotoEnhancedEmergencyRequestTappedWithButton:(id)a3;
- (void)collaborateButtonTapped;
- (void)continueHandoffButtonTapped;
- (void)dealloc;
- (void)declineRemoteControlRequestTappedWithButton:(id)a3;
- (void)declineScreenShare;
- (void)declineScreenShareRequestTappedWithButton:(id)a3;
- (void)dismissConfirmLeavePTTChannelAlert;
- (void)dismissEnhancedEmergencyRequestTappedWithButton:(id)a3;
- (void)dismissTappedWithButton:(id)a3;
- (void)endGreenTea3PCallButtonTappedWithButton:(id)a3;
- (void)endRemoteControlSessionTappedWithButton:(id)a3;
- (void)handleDidChangeIsWaitingOnFirstRemoteFrame:(id)a3;
- (void)handleIsScreeningChanged:(id)a3;
- (void)joinButtonTappedWithButton:(id)a3;
- (void)lagunaPullButtonTapped;
- (void)learnMoreNotTrustedContactTappedWithButton:(id)a3;
- (void)leaveButtonTappedWithButton:(id)a3;
- (void)notNowButtonTappedWithButton:(id)a3;
- (void)okAndDismissButtonTappedWithButton:(id)a3;
- (void)openMessagesButtonTapped;
- (void)previewEnhancedEmergencyRequestTappedWithButton:(id)a3;
- (void)pttDoneButtonTappedWithRecognizer:(id)a3;
- (void)pttLeaveButtonTappedWithButton:(id)a3;
- (void)pttTalkButtonGestureChangedWithRecognizer:(id)a3;
- (void)rejectCallButtonTappedWithButton:(id)a3;
- (void)resumeCallButtonTapped;
- (void)shareNameAndPhotoTappedWithButton:(id)a3;
- (void)shareNameTappedWithButton:(id)a3;
- (void)swapButtonTappedWithButton:(id)a3;
- (void)toggleMicButtonTappedWithButton:(id)a3;
- (void)toggleVideoButtonTappedWithButton:(id)a3;
@end

@implementation ConversationControlsManager

- (BOOL)isConfirmLeavePTTChannelAlertPresented
{
  return ConversationControlsManager.isConfirmLeavePTTChannelAlertPresented.getter();
}

- (void)dealloc
{
  v2 = self;
  ConversationControlsManager.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit27ConversationControlsManager_callCenter));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit27ConversationControlsManager_conversationController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit27ConversationControlsManager_coreAnalyticsReporter));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit27ConversationControlsManager_noticeCoordinator));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit27ConversationControlsManager_contentExtractor));
  swift_release();
  swift_unknownObjectRelease();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit27ConversationControlsManager_notificationCenter));
  swift_release();
  swift_unknownObjectWeakDestroy();
  outlined destroy of SystemUpdateNotice?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit27ConversationControlsManager____lazy_storage___callControlsService, &demangling cache variable for type metadata for CallControlsService??);
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit27ConversationControlsManager_systemBannerPresenter);
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit27ConversationControlsManager_systemConversationControlsDelegate);
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self+ OBJC_IVAR____TtC15ConversationKit27ConversationControlsManager_systemAudioConversationControlsDelegate);
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit27ConversationControlsManager_inCallConversationControlsDelegate);
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit27ConversationControlsManager_inCallDetailsViewControllerDelegate);
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit27ConversationControlsManager_audioRoutingDelegate);
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit27ConversationControlsManager_localAudioTogglingDelegate);
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit27ConversationControlsManager_handoffCompletedDelegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit27ConversationControlsManager_approvalDelegate));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit27ConversationControlsManager_conduitLagunaNoticeManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit27ConversationControlsManager_lagunaQueue));
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Published<Bool>);
  OUTLINED_FUNCTION_0();
  v4 = *(void (**)(void))(v3 + 8);
  OUTLINED_FUNCTION_1_19();
  v4();
  OUTLINED_FUNCTION_1_19();
  v4();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit27ConversationControlsManager_activityManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit27ConversationControlsManager_bannerActivityManager));
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<TURoute?>);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_26_2();
  v5();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<TUCallBluetoothAudioFormat?>);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_26_2();
  v6();
  OUTLINED_FUNCTION_1_19();
  v4();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<ControlsActionState>);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_26_2();
  v7();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Published<ConversationControlsManager.PushToTalkChannelState>);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_26_2();
  v8();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Published<TUCallTransmissionMode>);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_26_2();
  v9();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Published<ForegroundApp?>);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_26_2();
  v10();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Cache<String, [ConversationControlsManager.CollaborationPrompt]>);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_26_2();
  v11();
  _s15ConversationKit11ParticipantVWOhTm_4();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Published<EphemeralAlert?>);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_26_2();
  v12();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC15ConversationKit27ConversationControlsManager_entitlementsChecker);
  outlined destroy of SystemUpdateNotice?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit27ConversationControlsManager_avLessLeaveConfirmationPresentedDate, (uint64_t *)&demangling cache variable for type metadata for Date?);
  swift_bridgeObjectRelease();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<ConversationControlsAppLaunchButtonType>);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_26_2();
  v13();
  swift_unknownObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit27ConversationControlsManager_screenShareCountdownTimer));
  swift_release();
}

- (_TtC15ConversationKit27ConversationControlsManager)init
{
}

- (void)joinButtonTappedWithButton:(id)a3
{
  id v4 = a3;
  v5 = self;
  ConversationControlsManager.joinButtonTapped(button:)((UIControl *)v5);
}

- (void)leaveButtonTappedWithButton:(id)a3
{
  id v4 = a3;
  v5 = self;
  ConversationControlsManager.leaveButtonTapped(button:)((UIControl *)v5);
}

- (void)dismissTappedWithButton:(id)a3
{
  id v4 = a3;
  v5 = self;
  ConversationControlsManager.dismissTapped(button:)((UIControl *)v5);
}

- (void)openMessagesButtonTapped
{
  v2 = self;
  ConversationControlsManager.openMessagesButtonTapped()();
}

- (void)toggleMicButtonTappedWithButton:(id)a3
{
  id v4 = (UIControl *)a3;
  v5 = self;
  ConversationControlsManager.toggleMicButtonTapped(button:)(v4);
}

- (void)toggleVideoButtonTappedWithButton:(id)a3
{
  id v4 = (UIControl *)a3;
  v5 = self;
  ConversationControlsManager.toggleVideoButtonTapped(button:)(v4);
}

- (void)collaborateButtonTapped
{
  v2 = self;
  ConversationControlsManager.collaborateButtonTapped()();
}

- (void)notNowButtonTappedWithButton:(id)a3
{
  id v4 = a3;
  v5 = self;
  ConversationControlsManager.notNowButtonTapped(button:)((UIControl *)v5);
}

- (void)okAndDismissButtonTappedWithButton:(id)a3
{
  id v4 = a3;
  v5 = self;
  ConversationControlsManager.okAndDismissButtonTapped(button:)((UIControl *)v5);
}

- (void)swapButtonTappedWithButton:(id)a3
{
  id v4 = a3;
  v5 = self;
  ConversationControlsManager.swapButtonTapped(button:)((UIControl *)v5);
}

- (void)resumeCallButtonTapped
{
  v2 = self;
  ConversationControlsManager.resumeCallButtonTapped()();
}

- (void)shareNameAndPhotoTappedWithButton:(id)a3
{
  id v4 = a3;
  v5 = self;
  ConversationControlsManager.shareNameAndPhotoTapped(button:)((UIControl *)v5);
}

- (void)shareNameTappedWithButton:(id)a3
{
  id v4 = a3;
  v5 = self;
  ConversationControlsManager.shareNameTapped(button:)((UIControl *)v5);
}

- (void)acceptNameTappedWithButton:(id)a3
{
  id v4 = a3;
  v5 = self;
  ConversationControlsManager.acceptNameTapped(button:)((UIControl *)v5);
}

- (void)acceptScreenShareRequestTappedWithButton:(id)a3
{
  id v4 = a3;
  v5 = self;
  ConversationControlsManager.acceptScreenShareRequestTapped(button:)((UIControl *)v5);
}

- (void)cancelScreenShareRequestTappedWithButton:(id)a3
{
  id v4 = a3;
  v5 = self;
  ConversationControlsManager.cancelScreenShareRequestTapped(button:)((UIControl *)v5);
}

- (void)declineScreenShareRequestTappedWithButton:(id)a3
{
  id v4 = a3;
  v5 = self;
  ConversationControlsManager.declineScreenShareRequestTapped(button:)((UIControl *)v5);
}

- (void)acceptRemoteControlRequestTappedWithButton:(id)a3
{
  id v4 = a3;
  v5 = self;
  ConversationControlsManager.acceptRemoteControlRequestTapped(button:)((UIControl *)v5);
}

- (void)declineRemoteControlRequestTappedWithButton:(id)a3
{
  id v4 = a3;
  v5 = self;
  ConversationControlsManager.declineRemoteControlRequestTapped(button:)((UIControl *)v5);
}

- (void)cancelRemoteControlRequestTappedWithButton:(id)a3
{
  id v4 = a3;
  v5 = self;
  ConversationControlsManager.cancelRemoteControlRequestTapped(button:)((UIControl *)v5);
}

- (void)endRemoteControlSessionTappedWithButton:(id)a3
{
  id v4 = a3;
  v5 = self;
  ConversationControlsManager.endRemoteControlSessionTapped(button:)((UIControl *)v5);
}

- (void)learnMoreNotTrustedContactTappedWithButton:(id)a3
{
  id v4 = a3;
  v5 = self;
  ConversationControlsManager.learnMoreNotTrustedContactTapped(button:)((UIControl *)v5);
}

- (void)dismissEnhancedEmergencyRequestTappedWithButton:(id)a3
{
  id v4 = a3;
  v5 = self;
  ConversationControlsManager.dismissEnhancedEmergencyRequestTapped(button:)((UIControl *)v5);
}

- (void)previewEnhancedEmergencyRequestTappedWithButton:(id)a3
{
  id v4 = a3;
  v5 = self;
  ConversationControlsManager.previewEnhancedEmergencyRequestTapped(button:)((UIControl *)v5);
}

- (void)choosePhotoEnhancedEmergencyRequestTappedWithButton:(id)a3
{
  id v4 = a3;
  v5 = self;
  ConversationControlsManager.choosePhotoEnhancedEmergencyRequestTapped(button:)((UIControl *)v5);
}

- (void)pttLeaveButtonTappedWithButton:(id)a3
{
  id v4 = a3;
  v5 = self;
  ConversationControlsManager.pttLeaveButtonTapped(button:)((UIControl *)v5);
}

- (void)dismissConfirmLeavePTTChannelAlert
{
  v2 = self;
  ConversationControlsManager.dismissConfirmLeavePTTChannelAlert()();
}

- (void)pttDoneButtonTappedWithRecognizer:(id)a3
{
  id v4 = (UITapGestureRecognizer *)a3;
  v5 = self;
  ConversationControlsManager.pttDoneButtonTapped(recognizer:)(v4);
}

- (void)pttTalkButtonGestureChangedWithRecognizer:(id)a3
{
  id v4 = a3;
  v5 = self;
  ConversationControlsManager.pttTalkButtonGestureChanged(recognizer:)(v4);
}

- (void)endGreenTea3PCallButtonTappedWithButton:(id)a3
{
  id v4 = a3;
  v5 = self;
  ConversationControlsManager.endGreenTea3PCallButtonTapped(button:)((UIControl *)v5);
}

- (void)avLessContinueButtonTappedWithButton:(id)a3
{
  id v4 = a3;
  v5 = self;
  ConversationControlsManager.avLessContinueButtonTapped(button:)((UIControl *)v5);
}

- (void)continueHandoffButtonTapped
{
  v2 = self;
  ConversationControlsManager.continueHandoffButtonTapped()();
}

- (void)lagunaPullButtonTapped
{
  v2 = self;
  ConversationControlsManager.lagunaPullButtonTapped()();
}

- (void)acceptCallButtonTappedWithButton:(id)a3
{
  id v4 = a3;
  v5 = self;
  ConversationControlsManager.acceptCallButtonTapped(button:)((UIControl *)v5);
}

- (void)rejectCallButtonTappedWithButton:(id)a3
{
  id v4 = a3;
  v5 = self;
  ConversationControlsManager.rejectCallButtonTapped(button:)((UIControl *)v5);
}

- (void)callAgainButtonTappedWithButton:(id)a3
{
  id v4 = a3;
  v5 = self;
  ConversationControlsManager.callAgainButtonTapped(button:)((UIControl *)v5);
}

- (void)acceptScreenShare
{
  v2 = self;
  ConversationControlsManager.acceptScreenShare()();
}

- (void)acceptScreenShareWithDisplayStyle
{
  v2 = self;
  ConversationControlsManager.acceptScreenShareWithDisplayStyle()();
}

- (void)declineScreenShare
{
  v2 = self;
  ConversationControlsManager.declineScreenShare()();
}

- (void)handleDidChangeIsWaitingOnFirstRemoteFrame:(id)a3
{
}

- (void)handleIsScreeningChanged:(id)a3
{
}

- (void)accessibilityDidAddPendingParticipant:(id)a3
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  TPNumberPadCharacter.rawValue.getter(v3);
  swift_bridgeObjectRelease();
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

@end