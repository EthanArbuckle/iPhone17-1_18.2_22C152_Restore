@interface CardViewPersistentCell
- (_TtC11Diagnostics22CardViewPersistentCell)initWithCoder:(id)a3;
- (_TtC11Diagnostics22CardViewPersistentCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)handleLaunchURLWithNotification:(id)a3;
@end

@implementation CardViewPersistentCell

- (void)handleLaunchURLWithNotification:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  sub_10008C95C();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC11Diagnostics22CardViewPersistentCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC11Diagnostics22CardViewPersistentCell *)sub_10008CCB8(a3, (uint64_t)a4, v6);
}

- (_TtC11Diagnostics22CardViewPersistentCell)initWithCoder:(id)a3
{
  return (_TtC11Diagnostics22CardViewPersistentCell *)sub_10008CE2C(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics22CardViewPersistentCell____lazy_storage___persistentEnrollingPrompt));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics22CardViewPersistentCell____lazy_storage___persistentEnrollFinishedPrompt));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics22CardViewPersistentCell____lazy_storage___persistentRunningPrompt));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics22CardViewPersistentCell____lazy_storage___persistentFinishedPrompt));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics22CardViewPersistentCell____lazy_storage___persistentUploadingPrompt));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics22CardViewPersistentCell____lazy_storage___persistentUnenrollingPrompt));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics22CardViewPersistentCell____lazy_storage___enhancedLoggingConsentNavigationController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics22CardViewPersistentCell__completeUploadConsentController));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC11Diagnostics22CardViewPersistentCell____lazy_storage___reviewFilesController);
}

@end