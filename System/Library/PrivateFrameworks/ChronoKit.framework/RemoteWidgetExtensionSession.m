@interface RemoteWidgetExtensionSession
- (uint64_t)handleURLSessionEventsFor:(int)a3 completion:(void *)aBlock;
- (uint64_t)pushTokensDidChange:(void *)a3 completion:(void *)aBlock;
- (void)attachPreviewAgentWithFrameworkPath:(id)a3 endpoint:(id)a4 handler:(id)a5;
- (void)getAllCurrentDescriptorsWithCompletion:(id)a3;
- (void)getAppIntentsXPCListenerEndpointWithCompletion:(id)a3;
- (void)getCurrentDescriptorsWithCompletion:(id)a3;
- (void)getDescriptorsWithCompletion:(id)a3;
- (void)getPlaceholdersForRequests:(id)a3 inEnvironment:(id)a4 completion:(id)a5;
- (void)getPlaceholdersWithEnvironment:(id)a3 for:(id)a4 completion:(id)a5;
- (void)getTimelineFor:(id)a3 into:(id)a4 environment:(id)a5 isPreview:(BOOL)a6 completion:(id)a7;
- (void)getTimelinesWithRequests:(id)a3 isPreview:(BOOL)a4 completion:(id)a5;
- (void)invalidate;
@end

@implementation RemoteWidgetExtensionSession

- (void)getAppIntentsXPCListenerEndpointWithCompletion:(id)a3
{
  v3 = _Block_copy(a3);
  v4 = (void (*)(void *, void, void, void))v3[2];
  swift_retain();
  v4(v3, 0, 0, 0);
  _Block_release(v3);

  swift_release();
}

- (void)getCurrentDescriptorsWithCompletion:(id)a3
{
}

- (void)getAllCurrentDescriptorsWithCompletion:(id)a3
{
}

- (void)attachPreviewAgentWithFrameworkPath:(id)a3 endpoint:(id)a4 handler:(id)a5
{
  v5 = _Block_copy(a5);
  v6 = (void (*)(void *, void, void))v5[2];
  swift_unknownObjectRetain();
  swift_retain();
  v6(v5, 0, 0);
  _Block_release(v5);
  swift_unknownObjectRelease();

  swift_release();
}

- (void)getTimelinesWithRequests:(id)a3 isPreview:(BOOL)a4 completion:(id)a5
{
  v5 = _Block_copy(a5);
  v6 = (void (*)(void *, void))v5[2];
  swift_retain();
  v6(v5, 0);
  _Block_release(v5);

  swift_release();
}

- (uint64_t)handleURLSessionEventsFor:(int)a3 completion:(void *)aBlock
{
  v4 = _Block_copy(aBlock);
  v5 = (void (*)(void *, void))v4[2];
  swift_retain();
  v5(v4, 0);
  _Block_release(v4);

  return swift_release();
}

- (void)invalidate
{
  swift_retain();
  RemoteWidgetExtensionSession.invalidate()();

  swift_release();
}

- (void)getDescriptorsWithCompletion:(id)a3
{
  v3 = (void (**)(void *, void *, void))_Block_copy(a3);
  sub_1DA7A1A08(0, &qword_1EBE58EF8);
  swift_retain();
  v4 = (void *)sub_1DA98C268();
  v3[2](v3, v4, 0);

  _Block_release(v3);

  swift_release();
}

- (void)getPlaceholdersWithEnvironment:(id)a3 for:(id)a4 completion:(id)a5
{
  v6 = _Block_copy(a5);
  v7 = (void (*)(void *, void))v6[2];
  id v8 = a3;
  swift_retain();
  v7(v6, 0);
  _Block_release(v6);

  swift_release();
}

- (void)getPlaceholdersForRequests:(id)a3 inEnvironment:(id)a4 completion:(id)a5
{
  v6 = _Block_copy(a5);
  v7 = (void (*)(void *, void))v6[2];
  id v8 = a4;
  swift_retain();
  v7(v6, 0);
  _Block_release(v6);

  swift_release();
}

- (void)getTimelineFor:(id)a3 into:(id)a4 environment:(id)a5 isPreview:(BOOL)a6 completion:(id)a7
{
  v10 = _Block_copy(a7);
  v11 = (void (*)(void *, void))v10[2];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  swift_retain();
  v11(v10, 0);
  _Block_release(v10);

  swift_release();
}

- (uint64_t)pushTokensDidChange:(void *)a3 completion:(void *)aBlock
{
  v5 = _Block_copy(aBlock);
  v6 = (void (*)(void *, void))v5[2];
  id v7 = a3;
  swift_retain();
  v6(v5, 0);
  _Block_release(v5);

  return swift_release();
}

@end