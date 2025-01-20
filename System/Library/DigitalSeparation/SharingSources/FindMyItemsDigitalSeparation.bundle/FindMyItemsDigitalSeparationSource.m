@interface FindMyItemsDigitalSeparationSource
- (NSString)name;
- (_TtC28FindMyItemsDigitalSeparation34FindMyItemsDigitalSeparationSource)init;
- (void)fetchSharedResourcesWithCompletion:(id)a3;
- (void)stopAllSharingWithCompletion:(id)a3;
- (void)stopSharing:(DSSharedResource *)a3 withCompletion:(id)a4;
- (void)stopSharingWithParticipant:(DSParticipation *)a3 completion:(id)a4;
@end

@implementation FindMyItemsDigitalSeparationSource

- (NSString)name
{
  return (NSString *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC28FindMyItemsDigitalSeparation34FindMyItemsDigitalSeparationSource_name));
}

- (_TtC28FindMyItemsDigitalSeparation34FindMyItemsDigitalSeparationSource)init
{
  return (_TtC28FindMyItemsDigitalSeparation34FindMyItemsDigitalSeparationSource *)sub_32D8();
}

- (void)fetchSharedResourcesWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_33FC((uint64_t (*)(void *, void))sub_11F7C, v5);
  swift_release();
}

- (void)stopSharing:(DSSharedResource *)a3 withCompletion:(id)a4
{
  sub_DCC4(&qword_1F6F0);
  __chkstk_darwin();
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  v10 = (void *)swift_allocObject();
  v10[2] = a3;
  v10[3] = v9;
  v10[4] = self;
  uint64_t v11 = sub_132F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1F820;
  v12[5] = v10;
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1F828;
  v13[5] = v12;
  swift_unknownObjectRetain();
  v14 = self;
  sub_BFA0((uint64_t)v8, (uint64_t)&unk_1F830, (uint64_t)v13);
  swift_release();
}

- (void)stopSharingWithParticipant:(DSParticipation *)a3 completion:(id)a4
{
  sub_DCC4(&qword_1F6F0);
  __chkstk_darwin();
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  v10 = (void *)swift_allocObject();
  v10[2] = a3;
  v10[3] = v9;
  v10[4] = self;
  uint64_t v11 = sub_132F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1F800;
  v12[5] = v10;
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1F808;
  v13[5] = v12;
  swift_unknownObjectRetain();
  v14 = self;
  sub_BFA0((uint64_t)v8, (uint64_t)&unk_1F810, (uint64_t)v13);
  swift_release();
}

- (void)stopAllSharingWithCompletion:(id)a3
{
  uint64_t v5 = sub_DCC4(&qword_1F6F0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_132F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1F760;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1F770;
  v12[5] = v11;
  v13 = self;
  sub_BFA0((uint64_t)v7, (uint64_t)&unk_1F780, (uint64_t)v12);
  swift_release();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC28FindMyItemsDigitalSeparation34FindMyItemsDigitalSeparationSource_name));
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
}

@end