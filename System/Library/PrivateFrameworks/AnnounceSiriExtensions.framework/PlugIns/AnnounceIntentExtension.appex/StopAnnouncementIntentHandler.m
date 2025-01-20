@interface StopAnnouncementIntentHandler
- (_TtC23AnnounceIntentExtension29StopAnnouncementIntentHandler)init;
- (void)connectionInterrupted;
- (void)handleStopAnnouncement:(id)a3 completion:(id)a4;
@end

@implementation StopAnnouncementIntentHandler

- (void)handleStopAnnouncement:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  sub_100004DF8(v8, (uint64_t)sub_100006244, v7);

  swift_release();
}

- (_TtC23AnnounceIntentExtension29StopAnnouncementIntentHandler)init
{
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC23AnnounceIntentExtension29StopAnnouncementIntentHandler_localPlaybackSession) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for StopAnnouncementIntentHandler();
  return [(StopAnnouncementIntentHandler *)&v3 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC23AnnounceIntentExtension29StopAnnouncementIntentHandler_localPlaybackSession));
}

- (void)connectionInterrupted
{
  uint64_t v2 = OBJC_IVAR____TtC23AnnounceIntentExtension29StopAnnouncementIntentHandler_localPlaybackSession;
  objc_super v3 = *(void **)&a1[OBJC_IVAR____TtC23AnnounceIntentExtension29StopAnnouncementIntentHandler_localPlaybackSession];
  v4 = a1;
  if (v3)
  {
    [v3 setDelegate:0];
    id v5 = *(id *)&a1[v2];
  }
  else
  {
    id v5 = 0;
  }
  *(void *)&a1[v2] = 0;
}

@end