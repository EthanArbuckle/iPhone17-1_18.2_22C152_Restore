@interface ScreenSharingInteraction
- (UIView)view;
- (_TtC15ConversationKit24ScreenSharingInteraction)init;
- (void)didMoveToView:(id)a3;
- (void)setView:(id)a3;
- (void)willMoveToView:(id)a3;
@end

@implementation ScreenSharingInteraction

- (UIView)view
{
  v2 = (void *)ScreenSharingInteraction.view.getter();
  return (UIView *)v2;
}

- (void)setView:(id)a3
{
  id v5 = a3;
  v6 = self;
  ScreenSharingInteraction.view.setter(a3);
}

- (_TtC15ConversationKit24ScreenSharingInteraction)init
{
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit24ScreenSharingInteraction_captureInteraction));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC15ConversationKit24ScreenSharingInteraction_interactionController);
}

- (void)willMoveToView:(id)a3
{
  id v4 = a3;
  id v5 = self;
  ScreenSharingInteraction.willMove(to:)((UIView_optional *)v5);
}

- (void)didMoveToView:(id)a3
{
  id v5 = a3;
  v6 = self;
  ScreenSharingInteraction.didMove(to:)((UIView_optional *)a3);
}

@end