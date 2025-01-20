@interface TTRBannerControllerInternal
- (TTRBannerControllerDelegate)delegate;
- (TTRBannerControllerInternal)init;
- (void)buildTTRMessageBubbleRecipientsListWithGroupMessageUUID:(id)a3 with:(id)a4;
- (void)setDelegate:(id)a3;
- (void)showTTRBannerWithFullLogArchive:(BOOL)a3;
@end

@implementation TTRBannerControllerInternal

- (TTRBannerControllerDelegate)delegate
{
  v2 = (void *)TTRBannerController.delegate.getter();
  return (TTRBannerControllerDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  TTRBannerController.delegate.setter();
}

- (TTRBannerControllerInternal)init
{
  return (TTRBannerControllerInternal *)TTRBannerController.init()();
}

- (void)showTTRBannerWithFullLogArchive:(BOOL)a3
{
  v3 = self;
  TTRBannerController.showTTRBanner(useFullLogArchive:)(0);
}

- (void)buildTTRMessageBubbleRecipientsListWithGroupMessageUUID:(id)a3 with:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  uint64_t v8 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = self;
  TTRBannerController.buildTTRMessageBubbleRecipientsList(groupMessageUUID:with:)(v5, v7, v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___TTRBannerControllerInternal_delegate;
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)v3);
}

@end