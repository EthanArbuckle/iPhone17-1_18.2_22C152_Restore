@interface _WidgetExtensionSession
- (int)pid;
- (void)attachPreviewAgentWithFrameworkPath:(id)a3 endpoint:(id)a4 handler:(id)a5;
- (void)getActivitiesWithRequests:(id)a3 completion:(id)a4;
- (void)getAllCurrentDescriptorsWithCompletion:(id)a3;
- (void)getAppIntentsXPCListenerEndpointWithCompletion:(id)a3;
- (void)getControlTemplatesWithRequests:(id)a3 completion:(id)a4;
- (void)getCurrentDescriptorsWithCompletion:(id)a3;
- (void)getDescriptorsWithCompletion:(id)a3;
- (void)getPlaceholdersForRequests:(id)a3 inEnvironment:(id)a4 completion:(id)a5;
- (void)getPlaceholdersWithEnvironment:(id)a3 for:(id)a4 completion:(id)a5;
- (void)getPlaceholdersWithRequests:(id)a3 completion:(id)a4;
- (void)getTimelineFor:(id)a3 into:(id)a4 environment:(id)a5 isPreview:(BOOL)a6 completion:(id)a7;
- (void)getTimelinesWithRequests:(id)a3 isPreview:(BOOL)a4 completion:(id)a5;
- (void)getWidgetRelevancesWithRequest:(id)a3 completion:(id)a4;
- (void)handleURLSessionEventsFor:(id)a3 completion:(id)a4;
- (void)invalidate;
- (void)pushTokensDidChange:(id)a3 completion:(id)a4;
- (void)setControlState:(id)a3 completion:(id)a4;
@end

@implementation _WidgetExtensionSession

- (void)getDescriptorsWithCompletion:(id)a3
{
  v3 = _Block_copy(a3);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  uint64_t v5 = swift_retain();
  sub_191C7C294(v5, sub_191C7FAFC, v4);
  swift_release();

  swift_release();
}

- (void)getCurrentDescriptorsWithCompletion:(id)a3
{
}

- (void)getAllCurrentDescriptorsWithCompletion:(id)a3
{
}

- (void)getPlaceholdersWithEnvironment:(id)a3 for:(id)a4 completion:(id)a5
{
  v7 = _Block_copy(a5);
  sub_191B016E0(0, (unint64_t *)&unk_1EB44B1F8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB44ABB0);
  sub_191C7F844((unint64_t *)&unk_1EB44A828, (unint64_t *)&unk_1EB44B1F8);
  uint64_t v8 = sub_191CF5248();
  _Block_copy(v7);
  id v9 = a3;
  swift_retain();
  uint64_t v10 = sub_191C813C4(v8);
  sub_191C7D150(v10, v9, (uint64_t)self, v7);
  _Block_release(v7);
  swift_bridgeObjectRelease();
  _Block_release(v7);

  swift_release();

  swift_bridgeObjectRelease();
}

- (void)getPlaceholdersForRequests:(id)a3 inEnvironment:(id)a4 completion:(id)a5
{
  v7 = _Block_copy(a5);
  sub_191B016E0(0, &qword_1EB44C5B0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB44ABB0);
  sub_191C7F844(&qword_1EB449948, &qword_1EB44C5B0);
  uint64_t v8 = sub_191CF5248();
  _Block_copy(v7);
  id v9 = a4;
  swift_retain();
  sub_191C7D150(v8, v9, (uint64_t)self, v7);
  _Block_release(v7);
  _Block_release(v7);

  swift_release();

  swift_bridgeObjectRelease();
}

- (void)getPlaceholdersWithRequests:(id)a3 completion:(id)a4
{
}

- (void)handleURLSessionEventsFor:(id)a3 completion:(id)a4
{
  uint64_t v4 = _Block_copy(a4);
  uint64_t v5 = sub_191CF5338();
  uint64_t v7 = v6;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v4;
  uint64_t v11 = 6;
  char v12 = 4;
  id v9 = (void *)swift_allocObject();
  v9[2] = v5;
  v9[3] = v7;
  v9[4] = sub_191B179FC;
  v9[5] = v8;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = sub_191B179FC;
  *(void *)(v10 + 24) = v8;
  swift_retain_n();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_191C74F1C((uint64_t)&v11, (uint64_t)sub_191C7F6DC, (uint64_t)v9, (uint64_t)sub_191C7FC8C, v10);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  swift_release();
}

- (void)attachPreviewAgentWithFrameworkPath:(id)a3 endpoint:(id)a4 handler:(id)a5
{
  uint64_t v6 = _Block_copy(a5);
  uint64_t v7 = sub_191CF5338();
  uint64_t v9 = v8;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v6;
  uint64_t v13 = 7;
  char v14 = 4;
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = v7;
  v11[3] = v9;
  v11[4] = a4;
  v11[5] = sub_191C7FC88;
  v11[6] = v10;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = sub_191C7FC88;
  *(void *)(v12 + 24) = v10;
  swift_unknownObjectRetain_n();
  swift_retain_n();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_191C74F1C((uint64_t)&v13, (uint64_t)sub_191C7F624, (uint64_t)v11, (uint64_t)sub_191C7F634, v12);
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  swift_release();
}

- (void)pushTokensDidChange:(id)a3 completion:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  uint64_t v11 = 10;
  char v12 = 4;
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = sub_191B179FC;
  v7[4] = v6;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = sub_191B179FC;
  *(void *)(v8 + 24) = v6;
  id v9 = a3;
  swift_retain_n();
  id v10 = v9;
  swift_retain();
  sub_191C74F1C((uint64_t)&v11, (uint64_t)sub_191C7F52C, (uint64_t)v7, (uint64_t)sub_191C7FC8C, v8);

  swift_release();
  swift_release();
  swift_release();

  swift_release();
}

- (void)setControlState:(id)a3 completion:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  uint64_t v11 = 3;
  char v12 = 4;
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = sub_191B179FC;
  v7[4] = v6;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = sub_191B179FC;
  *(void *)(v8 + 24) = v6;
  id v9 = a3;
  swift_retain_n();
  id v10 = v9;
  swift_retain();
  sub_191C74F1C((uint64_t)&v11, (uint64_t)sub_191C7F478, (uint64_t)v7, (uint64_t)sub_191C7FC8C, v8);

  swift_release();
  swift_release();
  swift_release();

  swift_release();
}

- (void)getControlTemplatesWithRequests:(id)a3 completion:(id)a4
{
}

- (void)getTimelinesWithRequests:(id)a3 isPreview:(BOOL)a4 completion:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  type metadata accessor for TimelineRequest();
  unint64_t v8 = sub_191CF5538();
  _Block_copy(v7);
  swift_retain();
  sub_191C7DC70(v8, a4, (uint64_t)self, (void (**)(void, void))v7);
  _Block_release(v7);
  _Block_release(v7);
  swift_release();

  swift_bridgeObjectRelease();
}

- (void)getTimelineFor:(id)a3 into:(id)a4 environment:(id)a5 isPreview:(BOOL)a6 completion:(id)a7
{
  uint64_t v11 = _Block_copy(a7);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v11;
  uint64_t v21 = 8;
  char v22 = 4;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a3;
  *(void *)(v13 + 24) = a5;
  *(void *)(v13 + 32) = a4;
  *(unsigned char *)(v13 + 40) = a6;
  *(void *)(v13 + 48) = sub_191B179FC;
  *(void *)(v13 + 56) = v12;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = sub_191B179FC;
  *(void *)(v14 + 24) = v12;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  swift_retain_n();
  id v18 = v15;
  id v19 = v17;
  id v20 = v16;
  swift_retain();
  sub_191C74F1C((uint64_t)&v21, (uint64_t)sub_191C7F2B0, v13, (uint64_t)sub_191C7FC8C, v14);

  swift_release();
  swift_release();
  swift_release();

  swift_release();
}

- (void)getAppIntentsXPCListenerEndpointWithCompletion:(id)a3
{
  v3 = _Block_copy(a3);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  uint64_t v7 = 9;
  char v8 = 4;
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = sub_191C7F160;
  *(void *)(v5 + 24) = v4;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = sub_191C7F160;
  *(void *)(v6 + 24) = v4;
  swift_retain_n();
  swift_retain();
  sub_191C74F1C((uint64_t)&v7, (uint64_t)sub_191C7F168, v5, (uint64_t)sub_191C7F170, v6);
  swift_release();
  swift_release();
  swift_release();

  swift_release();
}

- (void)getActivitiesWithRequests:(id)a3 completion:(id)a4
{
}

- (void)getWidgetRelevancesWithRequest:(id)a3 completion:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  uint64_t v11 = 12;
  char v12 = 4;
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = sub_191B160E8;
  v7[4] = v6;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = sub_191B160E8;
  *(void *)(v8 + 24) = v6;
  id v9 = a3;
  swift_retain_n();
  id v10 = v9;
  swift_retain();
  sub_191C74F1C((uint64_t)&v11, (uint64_t)sub_191C7F044, (uint64_t)v7, (uint64_t)sub_191C7F050, v8);

  swift_release();
  swift_release();
  swift_release();

  swift_release();
}

- (void)invalidate
{
  swift_retain();
  sub_191C743B0();

  swift_release();
}

- (int)pid
{
  uint64_t v2 = swift_retain();
  uint64_t v12 = MEMORY[0x192FE22F0](v2);
  int v13 = v3;
  int v14 = v4;
  int v15 = v5;
  int v16 = v6;
  int v17 = v7;
  int v18 = v8;
  id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F4F6A8]), sel_initWithAuditToken_, &v12);
  int v10 = objc_msgSend(v9, sel_pid);
  swift_release();

  return v10;
}

@end