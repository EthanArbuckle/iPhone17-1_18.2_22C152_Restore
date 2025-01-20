@interface ReadAnnouncementIntentHandler
- (_TtC23AnnounceIntentExtension29ReadAnnouncementIntentHandler)init;
- (void)confirmReadAnnouncement:(INReadAnnouncementIntent *)a3 completion:(id)a4;
- (void)connectionInterrupted;
- (void)dealloc;
- (void)handleReadAnnouncement:(INReadAnnouncementIntent *)a3 completion:(id)a4;
@end

@implementation ReadAnnouncementIntentHandler

- (void)dealloc
{
  v2 = self;
  sub_10000A524();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for ReadAnnouncementIntentHandler();
  [(ReadAnnouncementIntentHandler *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC23AnnounceIntentExtension29ReadAnnouncementIntentHandler_announce));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC23AnnounceIntentExtension29ReadAnnouncementIntentHandler_localPlaybackSession));
  sub_10000E34C((uint64_t)self + OBJC_IVAR____TtC23AnnounceIntentExtension29ReadAnnouncementIntentHandler_endpointIdentifier, (uint64_t *)&unk_1000256A0);
  sub_10000E34C((uint64_t)self + OBJC_IVAR____TtC23AnnounceIntentExtension29ReadAnnouncementIntentHandler____lazy_storage___logger, (uint64_t *)&unk_100025A60);
}

- (void)confirmReadAnnouncement:(INReadAnnouncementIntent *)a3 completion:(id)a4
{
  uint64_t v7 = sub_100005EF8((uint64_t *)&unk_100025888);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_10001B1E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100025918;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100025920;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_100019B78((uint64_t)v9, (uint64_t)&unk_100025928, (uint64_t)v14);
  swift_release();
}

- (void)handleReadAnnouncement:(INReadAnnouncementIntent *)a3 completion:(id)a4
{
  uint64_t v7 = sub_100005EF8((uint64_t *)&unk_100025888);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_10001B1E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1000258F8;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100025900;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_100019B78((uint64_t)v9, (uint64_t)&unk_100025908, (uint64_t)v14);
  swift_release();
}

- (_TtC23AnnounceIntentExtension29ReadAnnouncementIntentHandler)init
{
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC23AnnounceIntentExtension29ReadAnnouncementIntentHandler_playbackOptions) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC23AnnounceIntentExtension29ReadAnnouncementIntentHandler_announce) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC23AnnounceIntentExtension29ReadAnnouncementIntentHandler_localPlaybackSession) = 0;
  objc_super v3 = (char *)self + OBJC_IVAR____TtC23AnnounceIntentExtension29ReadAnnouncementIntentHandler_endpointIdentifier;
  uint64_t v4 = sub_10001B080();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  v5 = (char *)self + OBJC_IVAR____TtC23AnnounceIntentExtension29ReadAnnouncementIntentHandler____lazy_storage___logger;
  uint64_t v6 = sub_10001B0B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ReadAnnouncementIntentHandler();
  return [(ReadAnnouncementIntentHandler *)&v8 init];
}

- (void)connectionInterrupted
{
  v2 = self;
  sub_10000A524();
}

@end