@interface _ASActivitySharingFriendQuery
- (_ASActivitySharingFriendQuery)init;
- (_ASActivitySharingFriendQuery)initWithActivitySharingClient:(id)a3 updateHandler:(id)a4;
- (void)fitnessAppsStateObserver:(id)a3 applicationInstallStateDidChangeForBundleIdentifiers:(id)a4;
- (void)handleFriendListUpdate;
@end

@implementation _ASActivitySharingFriendQuery

- (_ASActivitySharingFriendQuery)initWithActivitySharingClient:(id)a3 updateHandler:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  id v7 = a3;
  v8 = sub_24749B0A0(v7, (uint64_t)sub_24749B654, v6);

  swift_release();
  return (_ASActivitySharingFriendQuery *)v8;
}

- (void)handleFriendListUpdate
{
  uint64_t v2 = qword_26B12CCD0;
  v4 = self;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_2474B0EC0();
  __swift_project_value_buffer(v3, (uint64_t)qword_26B12CCE8);
  sub_24743FD94(0xD00000000000006CLL, 0x80000002474B7880, 0xD000000000000018, 0x80000002474B78F0);
  _s21ActivitySharingClient0aB11FriendQueryC24fitnessAppsStateObserver_018applicationInstallH29DidChangeForBundleIdentifiersySo09FIFitnessghI0C_SaySSGtF_0();
}

- (_ASActivitySharingFriendQuery)init
{
  result = (_ASActivitySharingFriendQuery *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)fitnessAppsStateObserver:(id)a3 applicationInstallStateDidChangeForBundleIdentifiers:(id)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  _s21ActivitySharingClient0aB11FriendQueryC24fitnessAppsStateObserver_018applicationInstallH29DidChangeForBundleIdentifiersySo09FIFitnessghI0C_SaySSGtF_0();
}

@end