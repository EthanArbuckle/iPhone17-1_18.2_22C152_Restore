@interface DocumentUnderstandingServer
- (void)pingWithReply:(id)a3;
- (void)triggerIncrementalPoemUpdate;
- (void)triggerPoemOnBoarding;
- (void)triggerSpotlightFileUpdateNoArgsWithReply:(id)a3;
- (void)triggerSpotlightFileUpdateWithItems:(id)a3 bundleID:(id)a4 completion:(id)a5;
@end

@implementation DocumentUnderstandingServer

- (void)pingWithReply:(id)a3
{
}

- (void)triggerSpotlightFileUpdateWithItems:(id)a3 bundleID:(id)a4 completion:(id)a5
{
  v5 = _Block_copy(a5);
  sub_1000033A4(0, &qword_1000088A8);
  sub_1000034A0();
  sub_100003490();
  *(void *)(swift_allocObject() + 16) = v5;
  swift_retain();
  sub_100002B54();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)triggerSpotlightFileUpdateNoArgsWithReply:(id)a3
{
}

- (void)triggerPoemOnBoarding
{
}

- (void)triggerIncrementalPoemUpdate
{
}

@end