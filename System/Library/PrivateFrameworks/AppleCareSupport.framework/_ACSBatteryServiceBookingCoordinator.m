@interface _ACSBatteryServiceBookingCoordinator
- (_ACSBatteryServiceBookingCoordinator)init;
- (_ACSBatteryServiceBookingCoordinator)initWithOptions:(id)a3;
- (void)launchBatteryServiceBookingFlowWithCompletionHandler:(id)a3;
- (void)prepareBatteryServiceBookingFlowWithCompletionHandler:(id)a3;
@end

@implementation _ACSBatteryServiceBookingCoordinator

- (_ACSBatteryServiceBookingCoordinator)init
{
  sub_247EB2538((uint64_t)&unk_2692D13F8, 0, (uint64_t)sub_247EB2034, 0, v6);
  type metadata accessor for UserDefaultsActor();
  uint64_t v2 = swift_allocObject();
  swift_defaultActor_initialize();
  *(void *)(v2 + 112) = objc_msgSend(self, sel_standardUserDefaults);
  id v3 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for BatteryServiceOptions()), sel_init);
  v4 = sub_247EABCB8((uint64_t)v6, (uint64_t)sub_247EA1880, 0, v2, v3);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return (_ACSBatteryServiceBookingCoordinator *)v4;
}

- (_ACSBatteryServiceBookingCoordinator)initWithOptions:(id)a3
{
  id v3 = a3;
  sub_247EB2538((uint64_t)&unk_2692D13F8, 0, (uint64_t)sub_247EB2034, 0, v7);
  type metadata accessor for UserDefaultsActor();
  uint64_t v4 = swift_allocObject();
  swift_defaultActor_initialize();
  *(void *)(v4 + 112) = objc_msgSend(self, sel_standardUserDefaults);
  v5 = sub_247EABCB8((uint64_t)v7, (uint64_t)sub_247EA1880, 0, v4, v3);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return (_ACSBatteryServiceBookingCoordinator *)v5;
}

- (void)prepareBatteryServiceBookingFlowWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D1158);
  MEMORY[0x270FA5388](v5 - 8, v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a3);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  *(void *)(v10 + 24) = self;
  uint64_t v11 = sub_247EBC540();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2692D11A8;
  v12[5] = v10;
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_2692D11B0;
  v13[5] = v12;
  swift_retain();
  sub_247EAA72C((uint64_t)v8, (uint64_t)&unk_2692D11B8, (uint64_t)v13);
  swift_release();
}

- (void)launchBatteryServiceBookingFlowWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D1158);
  MEMORY[0x270FA5388](v5 - 8, v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a3);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  *(void *)(v10 + 24) = self;
  uint64_t v11 = sub_247EBC540();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2692D1168;
  v12[5] = v10;
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_2692D1178;
  v13[5] = v12;
  swift_retain();
  sub_247EAA72C((uint64_t)v8, (uint64_t)&unk_2692D1188, (uint64_t)v13);
  swift_release();
}

@end