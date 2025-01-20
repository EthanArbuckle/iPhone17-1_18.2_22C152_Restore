@interface FindMyPeopleDigitalSeparationSource
- (NSString)name;
- (_TtC29FindMyPeopleDigitalSeparation35FindMyPeopleDigitalSeparationSource)init;
- (void)fetchSharedResourcesWithCompletion:(id)a3;
- (void)stopAllSharingWithCompletion:(id)a3;
- (void)stopSharing:(DSSharedResource *)a3 withCompletion:(id)a4;
- (void)stopSharingWithParticipant:(DSParticipation *)a3 completion:(id)a4;
@end

@implementation FindMyPeopleDigitalSeparationSource

- (NSString)name
{
  return (NSString *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC29FindMyPeopleDigitalSeparation35FindMyPeopleDigitalSeparationSource_name));
}

- (void)fetchSharedResourcesWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_3338((uint64_t)sub_9198, v5);

  swift_release();
}

- (void)stopSharing:(DSSharedResource *)a3 withCompletion:(id)a4
{
  sub_6DF4(&qword_11D70);
  __chkstk_darwin();
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  v10 = (void *)swift_allocObject();
  v10[2] = a3;
  v10[3] = v9;
  v10[4] = self;
  uint64_t v11 = sub_9628();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_11E68;
  v12[5] = v10;
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_11E70;
  v13[5] = v12;
  swift_unknownObjectRetain();
  v14 = self;
  sub_71DC((uint64_t)v8, (uint64_t)&unk_11E78, (uint64_t)v13);
  swift_release();
}

- (void)stopSharingWithParticipant:(DSParticipation *)a3 completion:(id)a4
{
  sub_6DF4(&qword_11D70);
  __chkstk_darwin();
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  v10 = (void *)swift_allocObject();
  v10[2] = a3;
  v10[3] = v9;
  v10[4] = self;
  uint64_t v11 = sub_9628();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_11E48;
  v12[5] = v10;
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_11E50;
  v13[5] = v12;
  swift_unknownObjectRetain();
  v14 = self;
  sub_71DC((uint64_t)v8, (uint64_t)&unk_11E58, (uint64_t)v13);
  swift_release();
}

- (void)stopAllSharingWithCompletion:(id)a3
{
  sub_6DF4(&qword_11D70);
  __chkstk_darwin();
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = _Block_copy(a3);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  *(void *)(v8 + 24) = self;
  uint64_t v9 = sub_9628();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v6, 1, 1, v9);
  v10 = (void *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = &unk_11E08;
  v10[5] = v8;
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_11E18;
  v11[5] = v10;
  v12 = self;
  sub_71DC((uint64_t)v6, (uint64_t)&unk_11E28, (uint64_t)v11);
  swift_release();
}

- (_TtC29FindMyPeopleDigitalSeparation35FindMyPeopleDigitalSeparationSource)init
{
  uint64_t v3 = sub_9448();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_9458();
  __chkstk_darwin();
  uint64_t v7 = (void *)DSSourceNameFindMy;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC29FindMyPeopleDigitalSeparation35FindMyPeopleDigitalSeparationSource_name) = (Class)DSSourceNameFindMy;
  uint64_t v8 = OBJC_IVAR____TtC29FindMyPeopleDigitalSeparation35FindMyPeopleDigitalSeparationSource_session;
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, enum case for ClientOrigin.other(_:), v3);
  uint64_t v9 = self;
  id v10 = v7;
  sub_9468();
  sub_94F8();
  swift_allocObject();
  *(Class *)((char *)&self->super.isa + v8) = (Class)sub_9508();

  MyPeopleDigitalSeparationSource = (objc_class *)type metadata accessor for FindMyPeopleDigitalSeparationSource();
  v13.receiver = v9;
  v13.super_class = MyPeopleDigitalSeparationSource;
  return [(FindMyPeopleDigitalSeparationSource *)&v13 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC29FindMyPeopleDigitalSeparation35FindMyPeopleDigitalSeparationSource_name));

  swift_release();
}

@end