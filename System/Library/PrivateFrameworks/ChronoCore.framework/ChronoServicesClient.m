@interface ChronoServicesClient
- (BOOL)reloadRemoteWidgetsWithError:(id *)a3;
- (BOOL)remoteWidgetsEnabled;
- (BOOL)toggleRemoteWidgetsEnabled:(id)a3 error:(id *)a4;
- (BOOL)unpairDeviceWith:(id)a3 error:(id *)a4;
- (_TtC10ChronoCoreP33_2559684BF6D015C60DA4DF344EC1B12920ChronoServicesClient)init;
- (id)_URLSessionDidCompleteForExtensionWithBundleIdentifier:(id)a3 info:(id)a4;
- (id)acquireKeepAliveAssertionForExtensionBundleIdentifier:(id)a3 reason:(id)a4 error:(id *)a5;
- (id)allPairedDevices;
- (id)widgetEnvironmentDataForBundleIdentifier:(id)a3;
- (void)acquireLifetimeAssertionForWidget:(id)a3 metrics:(id)a4 completion:(id)a5;
- (void)allWidgetConfigurationsByHostWithCompletion:(id)a3;
- (void)fetchDescriptorsForContainerBundleIdentifier:(id)a3 completion:(id)a4;
- (void)flushPowerlog;
- (void)getAppIntentsXPCListenerEndpointForBundleIdentifier:(id)a3 completion:(id)a4;
- (void)invalidateRelevancesOfKind:(id)a3 inBundle:(id)a4 completion:(id)a5;
- (void)launchLiveActivityWithID:(id)a3 deviceID:(id)a4 url:(id)a5;
- (void)loadSuggestedWidget:(id)a3 metrics:(id)a4 stackIdentifier:(id)a5 reason:(id)a6 completion:(id)a7;
- (void)modifyDescriptorEnablement:(id)a3 completion:(id)a4;
- (void)pairDeviceWith:(id)a3 completion:(id)a4;
- (void)performDescriptorDiscoveryForHost:(id)a3;
- (void)reloadDescriptorsForContainerBundleIdentifier:(id)a3 completion:(id)a4;
- (void)reloadTimeline:(id)a3 error:(id *)a4;
- (void)reloadWidgetRelevanceForExtensionIdentifier:(id)a3 kind:(id)a4 completion:(id)a5;
- (void)removeWidgetHostWithIdentifier:(id)a3;
- (void)retryStuckRemotePairings;
- (void)setActivationState:(id)a3 forWidgetHostWithIdentifier:(id)a4;
- (void)setWidgetConfiguration:(id)a3 activationState:(id)a4 forWidgetHostWithIdentifier:(id)a5;
- (void)subscribeToActivityPayloadUpdates:(id)a3;
- (void)subscribeToExtensionsWithProviderOptions:(id)a3 completion:(id)a4;
- (void)subscribeToRemoteDevices:(id)a3;
- (void)subscribeToTimelineEntryRelevance:(id)a3;
- (void)subscribeToWidgetRelevance:(id)a3;
- (void)suggestionBudgetsForStackIdentifiers:(id)a3 completion:(id)a4;
@end

@implementation ChronoServicesClient

- (_TtC10ChronoCoreP33_2559684BF6D015C60DA4DF344EC1B12920ChronoServicesClient)init
{
  result = (_TtC10ChronoCoreP33_2559684BF6D015C60DA4DF344EC1B12920ChronoServicesClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self+ OBJC_IVAR____TtC10ChronoCoreP33_2559684BF6D015C60DA4DF344EC1B12920ChronoServicesClient_timelineService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10ChronoCoreP33_2559684BF6D015C60DA4DF344EC1B12920ChronoServicesClient_taskService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self+ OBJC_IVAR____TtC10ChronoCoreP33_2559684BF6D015C60DA4DF344EC1B12920ChronoServicesClient_descriptorService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self+ OBJC_IVAR____TtC10ChronoCoreP33_2559684BF6D015C60DA4DF344EC1B12920ChronoServicesClient_enablementProvider);
  sub_1DA9DD290((uint64_t)self + OBJC_IVAR____TtC10ChronoCoreP33_2559684BF6D015C60DA4DF344EC1B12920ChronoServicesClient_deviceService, qword_1EBE49300);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self+ OBJC_IVAR____TtC10ChronoCoreP33_2559684BF6D015C60DA4DF344EC1B12920ChronoServicesClient_extensionService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self+ OBJC_IVAR____TtC10ChronoCoreP33_2559684BF6D015C60DA4DF344EC1B12920ChronoServicesClient_widgetHostService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self+ OBJC_IVAR____TtC10ChronoCoreP33_2559684BF6D015C60DA4DF344EC1B12920ChronoServicesClient_keybagStateProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self+ OBJC_IVAR____TtC10ChronoCoreP33_2559684BF6D015C60DA4DF344EC1B12920ChronoServicesClient_powerlogSuggestionService);
  sub_1DA9DD290((uint64_t)self+ OBJC_IVAR____TtC10ChronoCoreP33_2559684BF6D015C60DA4DF344EC1B12920ChronoServicesClient_stuckPairedRelationshipRepairer, &qword_1EBE487E0);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self+ OBJC_IVAR____TtC10ChronoCoreP33_2559684BF6D015C60DA4DF344EC1B12920ChronoServicesClient_keepAliveAssertionProvider);
  sub_1DA9DD290((uint64_t)self+ OBJC_IVAR____TtC10ChronoCoreP33_2559684BF6D015C60DA4DF344EC1B12920ChronoServicesClient_widgetRelevanceService, &qword_1EBE484A0);
  sub_1DA9DD290((uint64_t)self+ OBJC_IVAR____TtC10ChronoCoreP33_2559684BF6D015C60DA4DF344EC1B12920ChronoServicesClient_remoteActivityLaunchService, &qword_1EBE48570);
  sub_1DA9DD290((uint64_t)self+ OBJC_IVAR____TtC10ChronoCoreP33_2559684BF6D015C60DA4DF344EC1B12920ChronoServicesClient_activityService, &qword_1EBE4D0B8);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self+ OBJC_IVAR____TtC10ChronoCoreP33_2559684BF6D015C60DA4DF344EC1B12920ChronoServicesClient__duetServiceQueue_duetService);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ChronoCoreP33_2559684BF6D015C60DA4DF344EC1B12920ChronoServicesClient__queue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ChronoCoreP33_2559684BF6D015C60DA4DF344EC1B12920ChronoServicesClient__queue_connection));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ChronoCoreP33_2559684BF6D015C60DA4DF344EC1B12920ChronoServicesClient__queue_providerOptions));

  swift_bridgeObjectRelease();
}

- (void)flushPowerlog
{
  v2 = self;
  BSDispatchQueueAssert();
  v4[4] = sub_1DAB4C248;
  v4[5] = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 1107296256;
  v4[2] = sub_1DA9E19DC;
  v4[3] = &block_descriptor_223;
  v3 = _Block_copy(v4);
  BSDispatchMain();
  _Block_release(v3);
}

- (void)retryStuckRemotePairings
{
  v2 = self;
  sub_1DAB4C374();
}

- (void)modifyDescriptorEnablement:(id)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = sub_1DAD27B38();
  _Block_copy(v5);
  v7 = self;
  sub_1DAB5B6E8(v6, (uint64_t)v7, (void (**)(void, void))v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void)performDescriptorDiscoveryForHost:(id)a3
{
}

- (void)reloadDescriptorsForContainerBundleIdentifier:(id)a3 completion:(id)a4
{
}

- (void)fetchDescriptorsForContainerBundleIdentifier:(id)a3 completion:(id)a4
{
}

- (void)reloadTimeline:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = self;
  sub_1DAB4D164(v6, a4);
}

- (id)widgetEnvironmentDataForBundleIdentifier:(id)a3
{
  sub_1DAD27918();
  v4 = self;
  uint64_t v5 = sub_1DAB4D7BC();
  unint64_t v7 = v6;

  swift_bridgeObjectRelease();
  if (v7 >> 60 == 15)
  {
    v8 = 0;
  }
  else
  {
    v8 = (void *)sub_1DAD21E38();
    sub_1DA9F2030(v5, v7);
  }

  return v8;
}

- (void)removeWidgetHostWithIdentifier:(id)a3
{
}

- (void)setWidgetConfiguration:(id)a3 activationState:(id)a4 forWidgetHostWithIdentifier:(id)a5
{
  sub_1DAD27918();
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  sub_1DAB4E708(v8, v9);

  swift_bridgeObjectRelease();
}

- (void)setActivationState:(id)a3 forWidgetHostWithIdentifier:(id)a4
{
  sub_1DAD27918();
  id v6 = a3;
  unint64_t v7 = self;
  sub_1DAB4EF54(v6);

  swift_bridgeObjectRelease();
}

- (void)allWidgetConfigurationsByHostWithCompletion:(id)a3
{
}

- (void)getAppIntentsXPCListenerEndpointForBundleIdentifier:(id)a3 completion:(id)a4
{
}

- (void)launchLiveActivityWithID:(id)a3 deviceID:(id)a4 url:(id)a5
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE438E0);
  MEMORY[0x1F4188790](v7 - 8);
  id v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1DAD27918();
  unint64_t v12 = v11;
  uint64_t v13 = sub_1DAD27918();
  uint64_t v15 = v14;
  if (a5)
  {
    sub_1DAD21DC8();
    uint64_t v16 = sub_1DAD21E08();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v9, 0, 1, v16);
  }
  else
  {
    uint64_t v17 = sub_1DAD21E08();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v9, 1, 1, v17);
  }
  v18 = self;
  sub_1DAB519B4(v10, v12, v13, v15, (uint64_t)v9);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1DA9DD290((uint64_t)v9, &qword_1EBE438E0);
}

- (void)suggestionBudgetsForStackIdentifiers:(id)a3 completion:(id)a4
{
}

- (void)loadSuggestedWidget:(id)a3 metrics:(id)a4 stackIdentifier:(id)a5 reason:(id)a6 completion:(id)a7
{
  uint64_t v10 = _Block_copy(a7);
  uint64_t v11 = sub_1DAD27918();
  unint64_t v13 = v12;
  uint64_t v14 = sub_1DAD27918();
  unint64_t v16 = v15;
  _Block_copy(v10);
  id v17 = a3;
  id v18 = a4;
  uint64_t v19 = self;
  sub_1DAB5F29C(v17, v18, v11, v13, v14, v16, (char *)v19, (void (**)(void, void, void, void))v10);
  _Block_release(v10);
  _Block_release(v10);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)acquireLifetimeAssertionForWidget:(id)a3 metrics:(id)a4 completion:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = self;
  sub_1DAB600A8(v9, v10, (uint64_t)v11, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);
}

- (void)subscribeToExtensionsWithProviderOptions:(id)a3 completion:(id)a4
{
}

- (id)_URLSessionDidCompleteForExtensionWithBundleIdentifier:(id)a3 info:(id)a4
{
  sub_1DAD27918();
  sub_1DAD277B8();
  uint64_t v5 = self;
  id v6 = (void *)sub_1DAB554FC();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v6;
}

- (id)allPairedDevices
{
  v2 = self;
  id v3 = sub_1DAB56DDC();

  return v3;
}

- (void)pairDeviceWith:(id)a3 completion:(id)a4
{
}

- (BOOL)unpairDeviceWith:(id)a3 error:(id *)a4
{
  uint64_t v5 = sub_1DAD27918();
  uint64_t v7 = v6;
  uint64_t v8 = self;
  sub_1DAB56FFC(v5, v7);
  swift_bridgeObjectRelease();

  return 1;
}

- (BOOL)toggleRemoteWidgetsEnabled:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  BSDispatchQueueAssert();
  id v7 = objc_msgSend(v5, sel_BOOLValue);
  uint64_t v8 = (uint64_t)v6
     + OBJC_IVAR____TtC10ChronoCoreP33_2559684BF6D015C60DA4DF344EC1B12920ChronoServicesClient_enablementProvider;
  swift_beginAccess();
  uint64_t v9 = *(void *)(v8 + 24);
  uint64_t v10 = *(void *)(v8 + 32);
  __swift_mutable_project_boxed_opaque_existential_1(v8, v9);
  (*(void (**)(id, uint64_t, uint64_t))(v10 + 16))(v7, v9, v10);
  swift_endAccess();

  return 1;
}

- (BOOL)reloadRemoteWidgetsWithError:(id *)a3
{
  id v3 = self;
  sub_1DAB57358();

  return 1;
}

- (BOOL)remoteWidgetsEnabled
{
  v2 = self;
  unsigned __int8 v3 = sub_1DAB575A4();

  return v3 & 1;
}

- (void)subscribeToRemoteDevices:(id)a3
{
}

- (void)subscribeToTimelineEntryRelevance:(id)a3
{
}

- (void)subscribeToWidgetRelevance:(id)a3
{
}

- (void)subscribeToActivityPayloadUpdates:(id)a3
{
}

- (id)acquireKeepAliveAssertionForExtensionBundleIdentifier:(id)a3 reason:(id)a4 error:(id *)a5
{
  uint64_t v6 = sub_1DAD27918();
  uint64_t v8 = v7;
  uint64_t v9 = sub_1DAD27918();
  uint64_t v11 = v10;
  unint64_t v12 = self;
  unint64_t v13 = sub_1DAB577C8(v6, v8, v9, v11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v13;
}

- (void)reloadWidgetRelevanceForExtensionIdentifier:(id)a3 kind:(id)a4 completion:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  if (a4)
  {
    uint64_t v9 = sub_1DAD27918();
    a4 = v10;
  }
  else
  {
    uint64_t v9 = 0;
  }
  _Block_copy(v8);
  id v11 = a3;
  unint64_t v12 = self;
  sub_1DAB627A0(v11, v9, (uint64_t)a4, (uint64_t)v12, (void (**)(void, void))v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_bridgeObjectRelease();
}

- (void)invalidateRelevancesOfKind:(id)a3 inBundle:(id)a4 completion:(id)a5
{
  uint64_t v6 = _Block_copy(a5);
  uint64_t v7 = sub_1DAD27918();
  unint64_t v9 = v8;
  uint64_t v10 = sub_1DAD27918();
  unint64_t v12 = v11;
  _Block_copy(v6);
  unint64_t v13 = self;
  sub_1DAB62998(v7, v9, v10, v12, (uint64_t)v13, (void (**)(void, void))v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end