@interface CarrySettings.MessageChannel
- (_TtCO15HomePodSettings13CarrySettings14MessageChannel)init;
- (void)channel:(id)a3 didAddConsumer:(id)a4;
- (void)channel:(id)a3 didAddProducer:(id)a4;
- (void)channel:(id)a3 didFailToAddConsumerWithSubTopic:(id)a4 error:(id)a5;
- (void)channel:(id)a3 didFailToAddProducerWithSubTopic:(id)a4 error:(id)a5;
- (void)consumer:(COMessageSessionConsumer *)a3 shouldStartSessionWithMember:(COClusterMemberRoleSnapshot *)a4 request:(COMessageSessionRequest *)a5 completionHandler:(id)a6;
- (void)consumer:(id)a3 didStartSession:(id)a4;
- (void)consumer:(id)a3 didStopSession:(id)a4 initiator:(id)a5 notice:(id)a6 error:(id)a7;
- (void)producer:(COMessageSessionProducer *)a3 shouldStartSessionWithMember:(COClusterMemberRoleSnapshot *)a4 completionHandler:(id)a5;
- (void)producer:(id)a3 didFailToStartSessionWithMember:(id)a4 error:(id)a5;
- (void)producer:(id)a3 didStartSession:(id)a4 member:(id)a5 response:(id)a6;
- (void)producer:(id)a3 didStopSession:(id)a4 initiator:(id)a5 notice:(id)a6 error:(id)a7;
@end

@implementation CarrySettings.MessageChannel

- (void)channel:(id)a3 didAddConsumer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_23D15AD50();
}

- (void)channel:(id)a3 didFailToAddConsumerWithSubTopic:(id)a4 error:(id)a5
{
}

- (void)consumer:(id)a3 didStartSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_23D15B0A4();
}

- (void)consumer:(id)a3 didStopSession:(id)a4 initiator:(id)a5 notice:(id)a6 error:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = self;
  id v17 = a7;
  sub_23D15B398();
}

- (void)consumer:(COMessageSessionConsumer *)a3 shouldStartSessionWithMember:(COClusterMemberRoleSnapshot *)a4 request:(COMessageSessionRequest *)a5 completionHandler:(id)a6
{
  v10 = _Block_copy(a6);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = a4;
  v11[4] = a5;
  v11[5] = v10;
  v11[6] = self;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = self;
  sub_23D20101C((uint64_t)&unk_268BEC250, (uint64_t)v11);
}

- (void)channel:(id)a3 didAddProducer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_23D15BEBC();
}

- (void)channel:(id)a3 didFailToAddProducerWithSubTopic:(id)a4 error:(id)a5
{
}

- (void)producer:(id)a3 didFailToStartSessionWithMember:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v11 = a5;
  v10 = self;
  sub_23D15C490();
}

- (void)producer:(id)a3 didStartSession:(id)a4 member:(id)a5 response:(id)a6
{
  id v14 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = self;
  sub_23D15C7C8();
}

- (void)producer:(id)a3 didStopSession:(id)a4 initiator:(id)a5 notice:(id)a6 error:(id)a7
{
  id v17 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = self;
  id v16 = a7;
  sub_23D15CD70();
}

- (void)producer:(COMessageSessionProducer *)a3 shouldStartSessionWithMember:(COClusterMemberRoleSnapshot *)a4 completionHandler:(id)a5
{
  id v8 = _Block_copy(a5);
  id v9 = (void *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  id v10 = a3;
  id v11 = a4;
  id v12 = self;
  sub_23D20101C((uint64_t)&unk_268BEC240, (uint64_t)v9);
}

- (_TtCO15HomePodSettings13CarrySettings14MessageChannel)init
{
}

- (void).cxx_destruct
{
  sub_23D1551BC((uint64_t)self + OBJC_IVAR____TtCO15HomePodSettings13CarrySettings14MessageChannel_role);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCO15HomePodSettings13CarrySettings14MessageChannel_dispatchQueue));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_23D2447C8();
  OUTLINED_FUNCTION_44();
  uint64_t v3 = OUTLINED_FUNCTION_113();
  v4(v3);
}

@end