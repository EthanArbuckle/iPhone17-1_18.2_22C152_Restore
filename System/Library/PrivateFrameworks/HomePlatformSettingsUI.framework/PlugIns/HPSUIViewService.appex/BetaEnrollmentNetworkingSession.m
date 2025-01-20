@interface BetaEnrollmentNetworkingSession
- (_TtC16HPSUIViewService31BetaEnrollmentNetworkingSession)init;
- (void)channel:(id)a3 didAddProducer:(id)a4;
- (void)channel:(id)a3 didFailToAddProducerWithSubTopic:(id)a4 error:(id)a5;
- (void)producer:(COMessageSessionProducer *)a3 shouldStartSessionWithMember:(COClusterMemberRoleSnapshot *)a4 completionHandler:(id)a5;
- (void)producer:(id)a3 didFailToStartSessionWithMember:(id)a4 error:(id)a5;
- (void)producer:(id)a3 didStartSession:(id)a4 member:(id)a5 response:(id)a6;
- (void)producer:(id)a3 didStopSession:(id)a4 initiator:(id)a5 notice:(id)a6 error:(id)a7;
@end

@implementation BetaEnrollmentNetworkingSession

- (void)channel:(id)a3 didAddProducer:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  swift_retain();
  sub_10003B3B0(v5, v6);

  swift_release();
}

- (void)channel:(id)a3 didFailToAddProducerWithSubTopic:(id)a4 error:(id)a5
{
  uint64_t v7 = sub_100084D10();
  v9 = v8;
  id v10 = a3;
  id v11 = a5;
  swift_retain();
  sub_10003DD94(v10, v7, v9);

  swift_release();
  swift_bridgeObjectRelease();
}

- (void)producer:(id)a3 didFailToStartSessionWithMember:(id)a4 error:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  swift_retain();
  sub_10003DFB0(v7, v8);

  swift_release();
}

- (void)producer:(id)a3 didStartSession:(id)a4 member:(id)a5 response:(id)a6
{
  uint64_t v11 = sub_100004BB0(&qword_1000A7070);
  __chkstk_darwin(v11 - 8);
  v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100084FF0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = self;
  v15[5] = a3;
  v15[6] = a4;
  v15[7] = a5;
  v15[8] = a6;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  swift_retain_n();
  id v20 = v16;
  id v21 = v17;
  id v22 = v18;
  id v23 = v19;
  sub_100015B60((uint64_t)v13, (uint64_t)&unk_1000A7128, (uint64_t)v15);

  swift_release();
  swift_release();
}

- (void)producer:(id)a3 didStopSession:(id)a4 initiator:(id)a5 notice:(id)a6 error:(id)a7
{
  uint64_t v13 = sub_100004BB0(&qword_1000A7070);
  __chkstk_darwin(v13 - 8);
  v15 = (char *)&v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_100084FF0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v15, 1, 1, v16);
  id v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = self;
  v17[5] = a3;
  v17[6] = a4;
  v17[7] = a5;
  v17[8] = a6;
  v17[9] = a7;
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  swift_retain_n();
  id v22 = a7;
  id v23 = v18;
  id v24 = v19;
  id v25 = v20;
  id v26 = v21;
  id v27 = v22;
  sub_100015B60((uint64_t)v15, (uint64_t)&unk_1000A70C8, (uint64_t)v17);

  swift_release();
  swift_release();
}

- (void)producer:(COMessageSessionProducer *)a3 shouldStartSessionWithMember:(COClusterMemberRoleSnapshot *)a4 completionHandler:(id)a5
{
  uint64_t v9 = sub_100004BB0(&qword_1000A7070);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_100084FF0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1000A7080;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1000A7090;
  v16[5] = v15;
  id v17 = a3;
  id v18 = a4;
  swift_retain();
  sub_10003D580((uint64_t)v11, (uint64_t)&unk_1000A70A0, (uint64_t)v16);
  swift_release();
}

- (_TtC16HPSUIViewService31BetaEnrollmentNetworkingSession)init
{
  return (_TtC16HPSUIViewService31BetaEnrollmentNetworkingSession *)sub_10005D6FC();
}

@end