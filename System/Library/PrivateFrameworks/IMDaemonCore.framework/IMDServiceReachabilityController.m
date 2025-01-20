@interface IMDServiceReachabilityController
+ (IMDServiceReachabilityController)sharedController;
- (IMDServiceReachabilityController)init;
- (id)reachabilityContextForChat:(id)a3;
- (int64_t)sortOrderForServiceName:(id)a3;
- (int64_t)taskDeadlineSeconds;
- (void)calculateServiceForSendingToChat:(id)a3 accounts:(id)a4 completionBlock:(id)a5;
- (void)calculateServiceForSendingToHandles:(id)a3 accounts:(id)a4 context:(id)a5 completionBlock:(id)a6;
@end

@implementation IMDServiceReachabilityController

+ (IMDServiceReachabilityController)sharedController
{
  if (qword_1EA8C7FC0 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1EA8C9690;

  return (IMDServiceReachabilityController *)v2;
}

- (int64_t)taskDeadlineSeconds
{
  return IMBagIntValueWithDefault();
}

- (int64_t)sortOrderForServiceName:(id)a3
{
  sub_1D9906DA0();
  v4 = self;
  int64_t v5 = sub_1D98B1B08();

  swift_bridgeObjectRelease();
  return v5;
}

- (id)reachabilityContextForChat:(id)a3
{
  id v5 = a3;
  v6 = self;
  id v7 = sub_1D98B1CF8(a3);

  return v7;
}

- (void)calculateServiceForSendingToChat:(id)a3 accounts:(id)a4 completionBlock:(id)a5
{
  id v7 = _Block_copy(a5);
  sub_1D968E084(0, &qword_1EA8C9580);
  uint64_t v8 = sub_1D9906F20();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v7;
  id v10 = a3;
  v11 = self;
  sub_1D98B0338(v10, v8, (uint64_t)sub_1D98B1F3C, v9);

  swift_bridgeObjectRelease();

  swift_release();
}

- (void)calculateServiceForSendingToHandles:(id)a3 accounts:(id)a4 context:(id)a5 completionBlock:(id)a6
{
  uint64_t v8 = _Block_copy(a6);
  uint64_t v9 = sub_1D9906F20();
  sub_1D968E084(0, &qword_1EA8C9580);
  unint64_t v10 = sub_1D9906F20();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v8;
  id v12 = a5;
  v13 = self;
  sub_1D98B0568(v9, v10, v12, (uint64_t)sub_1D98B0E48, v11);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
}

- (IMDServiceReachabilityController)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMDServiceReachabilityController_tasks) = (Class)MEMORY[0x1E4FBC870];
  v3.receiver = self;
  v3.super_class = (Class)IMDServiceReachabilityController;
  return [(IMDServiceReachabilityController *)&v3 init];
}

- (void).cxx_destruct
{
}

@end