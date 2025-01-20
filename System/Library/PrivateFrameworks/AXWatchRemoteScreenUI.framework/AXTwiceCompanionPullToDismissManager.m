@interface AXTwiceCompanionPullToDismissManager
- (_TtC21AXWatchRemoteScreenUI36AXTwiceCompanionPullToDismissManager)init;
- (id)animationControllerForDismissedController:(id)a3;
- (id)interactionControllerForDismissal:(id)a3;
@end

@implementation AXTwiceCompanionPullToDismissManager

- (id)animationControllerForDismissedController:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = sub_22C052DF4(v4);

  return v6;
}

- (id)interactionControllerForDismissal:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  v5 = sub_22C05301C();
  swift_unknownObjectRelease();

  return v5;
}

- (_TtC21AXWatchRemoteScreenUI36AXTwiceCompanionPullToDismissManager)init
{
  *((unsigned char *)&self->super.isa
  + OBJC_IVAR____TtC21AXWatchRemoteScreenUI36AXTwiceCompanionPullToDismissManager_isInteractive) = 0;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC21AXWatchRemoteScreenUI36AXTwiceCompanionPullToDismissManager_percentDrivenInteractive) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AXTwiceCompanionPullToDismissManager();
  return [(AXTwiceCompanionPullToDismissManager *)&v3 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21AXWatchRemoteScreenUI36AXTwiceCompanionPullToDismissManager_percentDrivenInteractive));
}

@end