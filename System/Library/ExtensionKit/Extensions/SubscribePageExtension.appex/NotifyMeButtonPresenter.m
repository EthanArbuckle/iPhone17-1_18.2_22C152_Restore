@interface NotifyMeButtonPresenter
- (void)appEnteredWhileAppeared;
- (void)appExitedWhileAppeared;
- (void)displayTimeReached;
- (void)userNotificationsDidChangeNotification:(id)a3;
@end

@implementation NotifyMeButtonPresenter

- (void)userNotificationsDidChangeNotification:(id)a3
{
  uint64_t v3 = sub_100755B70();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  v7 = (char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100755B40();
  swift_retain();
  sub_1001E1628();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
}

- (void)appEnteredWhileAppeared
{
  swift_retain();
  sub_1001DFA38();

  swift_release();
}

- (void)appExitedWhileAppeared
{
  uint64_t v3 = OBJC_IVAR____TtC22SubscribePageExtension23NotifyMeButtonPresenter_displayTimeReachedTimer;
  uint64_t v4 = *(void **)&self->_TtCs12_SwiftObject_opaque[OBJC_IVAR____TtC22SubscribePageExtension23NotifyMeButtonPresenter_displayTimeReachedTimer];
  swift_retain();
  if (v4)
  {
    [v4 invalidate];
    id v5 = *(id *)&self->_TtCs12_SwiftObject_opaque[v3];
  }
  else
  {
    id v5 = 0;
  }
  *(void *)&self->_TtCs12_SwiftObject_opaque[v3] = 0;
  swift_release();
}

- (void)displayTimeReached
{
  v2 = &self->_TtCs12_SwiftObject_opaque[OBJC_IVAR____TtC22SubscribePageExtension23NotifyMeButtonPresenter_view];
  swift_beginAccess();
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v3 = *((void *)v2 + 1);
    uint64_t ObjectType = swift_getObjectType();
    id v5 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 40);
    swift_retain();
    v5(1, 1, ObjectType, v3);
    swift_release();
    swift_unknownObjectRelease();
  }
}

@end