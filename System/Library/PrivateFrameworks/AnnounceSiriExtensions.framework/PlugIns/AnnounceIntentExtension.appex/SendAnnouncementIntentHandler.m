@interface SendAnnouncementIntentHandler
- (_TtC23AnnounceIntentExtension29SendAnnouncementIntentHandler)init;
- (void)connectionInterrupted;
- (void)dealloc;
- (void)handleSendAnnouncement:(INSendAnnouncementIntent *)a3 completion:(id)a4;
- (void)resolveAnnouncementForSendAnnouncement:(INSendAnnouncementIntent *)a3 withCompletion:(id)a4;
- (void)resolveRecipientsForSendAnnouncement:(INSendAnnouncementIntent *)a3 withCompletion:(id)a4;
@end

@implementation SendAnnouncementIntentHandler

- (_TtC23AnnounceIntentExtension29SendAnnouncementIntentHandler)init
{
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC23AnnounceIntentExtension29SendAnnouncementIntentHandler_announce) = 0;
  v3 = (char *)self + OBJC_IVAR____TtC23AnnounceIntentExtension29SendAnnouncementIntentHandler____lazy_storage___logger;
  uint64_t v4 = sub_10001B0B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SendAnnouncementIntentHandler();
  return [(SendAnnouncementIntentHandler *)&v6 init];
}

- (void)dealloc
{
  uint64_t v3 = OBJC_IVAR____TtC23AnnounceIntentExtension29SendAnnouncementIntentHandler_announce;
  uint64_t v4 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC23AnnounceIntentExtension29SendAnnouncementIntentHandler_announce);
  v5 = self;
  if (v4)
  {
    [v4 setDelegate:0];
    objc_super v6 = *(Class *)((char *)&self->super.super.isa + v3);
  }
  else
  {
    objc_super v6 = 0;
  }
  *(Class *)((char *)&self->super.super.isa + v3) = 0;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for SendAnnouncementIntentHandler();
  [(SendAnnouncementIntentHandler *)&v7 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC23AnnounceIntentExtension29SendAnnouncementIntentHandler_announce));
  sub_10000E34C((uint64_t)self + OBJC_IVAR____TtC23AnnounceIntentExtension29SendAnnouncementIntentHandler____lazy_storage___logger, (uint64_t *)&unk_100025A60);
}

- (void)resolveAnnouncementForSendAnnouncement:(INSendAnnouncementIntent *)a3 withCompletion:(id)a4
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
  v13[4] = &unk_100025AA8;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100025AB0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_100019B78((uint64_t)v9, (uint64_t)&unk_100025AB8, (uint64_t)v14);
  swift_release();
}

- (void)resolveRecipientsForSendAnnouncement:(INSendAnnouncementIntent *)a3 withCompletion:(id)a4
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
  v13[4] = &unk_100025A88;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100025A90;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_100019B78((uint64_t)v9, (uint64_t)&unk_100025A98, (uint64_t)v14);
  swift_release();
}

- (void)handleSendAnnouncement:(INSendAnnouncementIntent *)a3 completion:(id)a4
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
  v13[4] = &unk_100025A78;
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

- (void)connectionInterrupted
{
  uint64_t v2 = OBJC_IVAR____TtC23AnnounceIntentExtension29SendAnnouncementIntentHandler_announce;
  uint64_t v3 = *(void **)&a1[OBJC_IVAR____TtC23AnnounceIntentExtension29SendAnnouncementIntentHandler_announce];
  uint64_t v4 = a1;
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