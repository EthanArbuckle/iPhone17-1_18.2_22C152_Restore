@interface IMServiceForSendingTask
- (IMServiceForSendingTask)init;
- (IMServiceForSendingTask)initWithDelegate:(id)a3 updateHandler:(id)a4;
- (IMServiceForSendingTaskDelegate)delegate;
- (NSArray)requestIDs;
- (NSString)taskID;
- (void)allRequestsSubmitted;
- (void)beganRequestWithID:(id)a3;
- (void)cancelledRequestWithID:(id)a3;
- (void)reachabilityRequest:(id)a3 updatedWithResult:(id)a4;
- (void)setDelegate:(id)a3;
- (void)submitRequestWithID:(id)a3 serviceName:(id)a4 preconditions:(id)a5 clearanceHandler:(id)a6;
@end

@implementation IMServiceForSendingTask

- (NSString)taskID
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A09F3DE8();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (IMServiceForSendingTaskDelegate)delegate
{
  v2 = (void *)MEMORY[0x1A6228D10]((char *)self + OBJC_IVAR___IMServiceForSendingTask_delegate, a2);

  return (IMServiceForSendingTaskDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
}

- (IMServiceForSendingTask)initWithDelegate:(id)a3 updateHandler:(id)a4
{
  v4 = _Block_copy(a4);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = swift_unknownObjectRetain();
  return (IMServiceForSendingTask *)sub_1A09A8FD4(v6, (uint64_t)sub_1A09AEEA8, v5);
}

- (void)reachabilityRequest:(id)a3 updatedWithResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1A09A9938(v6, v7);
}

- (IMServiceForSendingTask)init
{
  result = (IMServiceForSendingTask *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1A0875BDC((uint64_t)self + OBJC_IVAR___IMServiceForSendingTask_delegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMServiceForSendingTask_latestBestResult);
}

- (NSArray)requestIDs
{
  swift_beginAccess();
  v3 = self;
  uint64_t v4 = swift_bridgeObjectRetain();
  sub_1A08DCDFC(v4);

  swift_bridgeObjectRelease();
  uint64_t v5 = (void *)sub_1A09F4068();
  swift_release();

  return (NSArray *)v5;
}

- (void)submitRequestWithID:(id)a3 serviceName:(id)a4 preconditions:(id)a5 clearanceHandler:(id)a6
{
  id v7 = _Block_copy(a6);
  uint64_t v8 = sub_1A09F3E18();
  uint64_t v10 = v9;
  uint64_t v11 = sub_1A09F3E18();
  uint64_t v13 = v12;
  sub_1A078231C(0, &qword_1E94F75F8);
  uint64_t v14 = sub_1A09F4078();
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v7;
  v16 = self;
  sub_1A09ABCE4(v8, v10, v11, v13, v14, (uint64_t)sub_1A09AD2E8, v15);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
}

- (void)allRequestsSubmitted
{
  v2 = self;
  sub_1A09AC4DC();
}

- (void)beganRequestWithID:(id)a3
{
  uint64_t v4 = sub_1A09F3E18();
  uint64_t v6 = v5;
  id v7 = (uint64_t *)((char *)self + OBJC_IVAR___IMServiceForSendingTask_requestIDToResults);
  swift_beginAccess();
  uint64_t v8 = self;
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v10 = *v7;
  *id v7 = 0x8000000000000000;
  sub_1A08DA18C(MEMORY[0x1E4FBC860], v4, v6, isUniquelyReferenced_nonNull_native);
  *id v7 = v10;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_endAccess();

  swift_bridgeObjectRelease();
}

- (void)cancelledRequestWithID:(id)a3
{
  uint64_t v4 = sub_1A09F3E18();
  uint64_t v6 = v5;
  swift_beginAccess();
  id v7 = self;
  sub_1A09EDAAC(v4, v6);
  swift_endAccess();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end