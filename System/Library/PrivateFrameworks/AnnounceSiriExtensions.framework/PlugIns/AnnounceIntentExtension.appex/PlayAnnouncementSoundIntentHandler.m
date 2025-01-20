@interface PlayAnnouncementSoundIntentHandler
- (_TtC23AnnounceIntentExtension34PlayAnnouncementSoundIntentHandler)init;
- (void)handlePlayAnnouncementSound:(INPlayAnnouncementSoundIntent *)a3 completion:(id)a4;
@end

@implementation PlayAnnouncementSoundIntentHandler

- (void)handlePlayAnnouncementSound:(INPlayAnnouncementSoundIntent *)a3 completion:(id)a4
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
  v13[4] = &unk_100025B58;
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

- (_TtC23AnnounceIntentExtension34PlayAnnouncementSoundIntentHandler)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PlayAnnouncementSoundIntentHandler();
  return [(PlayAnnouncementSoundIntentHandler *)&v3 init];
}

@end