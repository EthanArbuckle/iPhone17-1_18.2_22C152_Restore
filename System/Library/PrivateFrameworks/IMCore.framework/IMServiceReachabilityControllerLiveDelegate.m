@interface IMServiceReachabilityControllerLiveDelegate
- (NSArray)serviceNamesForSending;
- (id)preconditionsForServiceName:(id)a3;
- (id)preferredAccountIDForServiceName:(id)a3;
- (int64_t)sortOrderForServiceName:(id)a3;
- (int64_t)taskDeadlineSeconds;
- (void)calculateReachabilityWithRequest:(id)a3 responseHandler:(id)a4;
@end

@implementation IMServiceReachabilityControllerLiveDelegate

- (id)preconditionsForServiceName:(id)a3
{
  sub_1A4CBB0CC();
  swift_retain();
  sub_1A4C98A84();
  swift_release();
  swift_bridgeObjectRelease();
  sub_1A4B0C510(0, &qword_1E965B588);
  v3 = (void *)sub_1A4CBB14C();
  swift_bridgeObjectRelease();

  return v3;
}

- (id)preferredAccountIDForServiceName:(id)a3
{
  sub_1A4CBB0CC();
  swift_retain();
  sub_1A4C98D50();
  uint64_t v4 = v3;
  swift_release();
  swift_bridgeObjectRelease();
  if (v4)
  {
    v5 = (void *)sub_1A4CBB0BC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)calculateReachabilityWithRequest:(id)a3 responseHandler:(id)a4
{
  v6 = self;
  id v7 = a3;
  swift_unknownObjectRetain();
  swift_retain();
  id v8 = objc_msgSend(v6, sel_sharedController);
  id v9 = objc_msgSend(v8, sel_remoteDaemon);

  objc_msgSend(v9, sel_calculateReachabilityWithRequest_responseHandler_, v7, a4);
  swift_unknownObjectRelease();
  swift_release();

  swift_unknownObjectRelease();
}

- (int64_t)sortOrderForServiceName:(id)a3
{
  sub_1A4CBB0CC();
  uint64_t v3 = self;
  swift_retain();
  uint64_t v4 = (void *)sub_1A4CBB0BC();
  id v5 = objc_msgSend(v3, sel_serviceWithInternalName_, v4);

  if (v5)
  {
    id v6 = objc_msgSend(v5, sel_serviceForSendingPriority);
    swift_release();
    swift_bridgeObjectRelease();

    return (int64_t)v6;
  }
  else
  {
    swift_release();
    swift_bridgeObjectRelease();
    return -1;
  }
}

- (NSArray)serviceNamesForSending
{
  sub_1A4C98FA0();
  v2 = (void *)sub_1A4CBB14C();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
}

- (int64_t)taskDeadlineSeconds
{
  return IMBagIntValueWithDefault();
}

@end