@interface DataModel
+ (HMHomeManagerConfiguration)homeManagerConfiguration;
+ (_TtC13HomeDataModel9DataModel)shared;
+ (int64_t)context;
+ (void)setContext:(int64_t)a3;
+ (void)setHomeManagerConfiguration:(id)a3;
- (HMHome)_currentHome;
- (HMHome)currentHome;
- (HMHome)primaryHome;
- (HMHomeManager)homeManager;
- (NSArray)alphabeticalHomes;
- (NSArray)sortedHomes;
- (_TtC13HomeDataModel9DataModel)init;
- (id)accessoryFor:(id)a3;
- (id)accessoryFor:(id)a3 in:(id)a4;
- (id)accessoryFromAnyHomeFor:(id)a3;
- (id)actionSetFor:(id)a3;
- (id)cameraProfileFor:(id)a3;
- (id)characteristicFor:(id)a3;
- (id)homeFor:(id)a3;
- (id)mediaProfileFor:(id)a3;
- (id)mediaSystemFor:(id)a3;
- (id)residentFor:(id)a3;
- (id)roomFor:(id)a3;
- (id)serviceFor:(id)a3;
- (id)serviceGroupFor:(id)a3;
- (id)userFor:(id)a3;
- (void)accessory:(id)a3 didAddProfile:(id)a4;
- (void)accessory:(id)a3 didRemoveProfile:(id)a4;
- (void)accessory:(id)a3 didUpdateApplicationDataForService:(id)a4;
- (void)accessory:(id)a3 didUpdateAssociatedServiceTypeForService:(id)a4;
- (void)accessory:(id)a3 didUpdateFirmwareVersion:(id)a4;
- (void)accessory:(id)a3 didUpdateNameForService:(id)a4;
- (void)accessory:(id)a3 service:(id)a4 didUpdateValueForCharacteristic:(id)a5;
- (void)accessoryDidUpdateApplicationData:(id)a3;
- (void)accessoryDidUpdateName:(id)a3;
- (void)accessoryDidUpdateReachability:(id)a3;
- (void)accessoryDidUpdateServices:(id)a3;
- (void)accessorySettingsDataSource:(id)a3 didReceiveSettingsUpdatesForAccessoryWithIdentifier:(id)a4 settings:(id)a5;
- (void)device:(id)a3 receivedAttributeReport:(id)a4;
- (void)device:(id)a3 receivedEventReport:(id)a4;
- (void)device:(id)a3 stateChanged:(unint64_t)a4;
- (void)deviceBecameActive:(id)a3;
- (void)deviceCachePrimed:(id)a3;
- (void)home:(id)a3 didAddAccessory:(id)a4;
- (void)home:(id)a3 didAddActionSet:(id)a4;
- (void)home:(id)a3 didAddMediaSystem:(id)a4;
- (void)home:(id)a3 didAddRoom:(id)a4;
- (void)home:(id)a3 didAddRoom:(id)a4 toZone:(id)a5;
- (void)home:(id)a3 didAddService:(id)a4 toServiceGroup:(id)a5;
- (void)home:(id)a3 didAddServiceGroup:(id)a4;
- (void)home:(id)a3 didAddTrigger:(id)a4;
- (void)home:(id)a3 didAddZone:(id)a4;
- (void)home:(id)a3 didEncounterError:(id)a4 forAccessory:(id)a5;
- (void)home:(id)a3 didRemoveAccessory:(id)a4;
- (void)home:(id)a3 didRemoveActionSet:(id)a4;
- (void)home:(id)a3 didRemoveMediaSystem:(id)a4;
- (void)home:(id)a3 didRemoveRoom:(id)a4;
- (void)home:(id)a3 didRemoveRoom:(id)a4 fromZone:(id)a5;
- (void)home:(id)a3 didRemoveService:(id)a4 fromServiceGroup:(id)a5;
- (void)home:(id)a3 didRemoveServiceGroup:(id)a4;
- (void)home:(id)a3 didRemoveTrigger:(id)a4;
- (void)home:(id)a3 didRemoveZone:(id)a4;
- (void)home:(id)a3 didUnblockAccessory:(id)a4;
- (void)home:(id)a3 didUpdateActionsForActionSet:(id)a4;
- (void)home:(id)a3 didUpdateApplicationDataForActionSet:(id)a4;
- (void)home:(id)a3 didUpdateApplicationDataForRoom:(id)a4;
- (void)home:(id)a3 didUpdateApplicationDataForServiceGroup:(id)a4;
- (void)home:(id)a3 didUpdateAutomaticSoftwareUpdateEnabled:(BOOL)a4;
- (void)home:(id)a3 didUpdateHomeHubState:(unint64_t)a4;
- (void)home:(id)a3 didUpdateNameForActionSet:(id)a4;
- (void)home:(id)a3 didUpdateNameForRoom:(id)a4;
- (void)home:(id)a3 didUpdateNameForServiceGroup:(id)a4;
- (void)home:(id)a3 didUpdateNameForTrigger:(id)a4;
- (void)home:(id)a3 didUpdateNameForZone:(id)a4;
- (void)home:(id)a3 didUpdateRoom:(id)a4 forAccessory:(id)a5;
- (void)home:(id)a3 didUpdateTrigger:(id)a4;
- (void)homeDidUpdateAccessControlForCurrentUser:(id)a3;
- (void)homeDidUpdateApplicationData:(id)a3;
- (void)homeDidUpdateName:(id)a3;
- (void)homeDidUpdateSupportedFeatures:(id)a3;
- (void)homeDidUpdateSupportsResidentSelection:(void *)a3;
- (void)homeManager:(id)a3 didAddHome:(id)a4;
- (void)homeManager:(id)a3 didRemoveHome:(id)a4;
- (void)homeManager:(void *)a3 didUpdateAuthorizationStatus:;
- (void)homeManagerDidEndBatchNotifications:(id)a3;
- (void)homeManagerDidUpdateCurrentHome:(id)a3;
- (void)homeManagerDidUpdateHomes:(id)a3;
- (void)homeManagerDidUpdatePrimaryHome:(id)a3;
- (void)homeManagerWillStartBatchNotifications:(id)a3;
- (void)lightProfile:(void *)a3 didUpdateSettings:(void *)a4;
- (void)mediaObject:(id)a3 didUpdateSettings:(id)a4;
- (void)residentDevice:(id)a3 didUpdateStatus:(unint64_t)a4;
- (void)setCurrentHome:(id)a3;
- (void)setHomeManager:(id)a3;
- (void)set_currentHome:(id)a3;
- (void)softwareUpdateController:(id)a3 accessory:(id)a4 didFailUpdate:(id)a5 withError:(id)a6 timestamp:(id)a7;
- (void)softwareUpdateController:(id)a3 accessory:(id)a4 didReceiveUpdate:(id)a5;
- (void)softwareUpdateController:(id)a3 accessory:(id)a4 didUpdateProgress:(id)a5;
- (void)symptomsHandler:(id)a3 didUpdateSymptoms:(id)a4;
- (void)userActionPredictionController:(id)a3 didUpdatePredictions:(id)a4;
@end

@implementation DataModel

- (HMHome)primaryHome
{
  v2 = self;
  v3 = DataModel.primaryHome.getter();

  return (HMHome *)v3;
}

- (NSArray)sortedHomes
{
  return (NSArray *)sub_251A96054(self, (uint64_t)a2, (void (*)(void))DataModel.sortedHomes.getter);
}

- (NSArray)alphabeticalHomes
{
  return (NSArray *)sub_251A96054(self, (uint64_t)a2, (void (*)(void))DataModel.alphabeticalHomes.getter);
}

- (id)accessoryFor:(id)a3 in:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B21FF90);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = &v19[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (a3)
  {
    sub_251F34D80();
    uint64_t v10 = sub_251F34DA0();
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 0, 1, v10);
  }
  else
  {
    uint64_t v11 = sub_251F34DA0();
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v9, 1, 1, v11);
  }
  id v12 = a4;
  v13 = self;
  id v14 = objc_msgSend(v12, sel_accessories);
  sub_251A1A568(0, (unint64_t *)&qword_26B21EAF8);
  unint64_t v15 = sub_251F35AC0();

  MEMORY[0x270FA5388](v16);
  *(void *)&v19[-16] = v9;
  v17 = sub_251A95D30(sub_251AA009C, (uint64_t)&v19[-32], v15);

  swift_bridgeObjectRelease();
  sub_251A1B064((uint64_t)v9, &qword_26B21FF90);
  return v17;
}

- (id)accessoryFromAnyHomeFor:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B21FF90);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_251F34D80();
    uint64_t v8 = sub_251F34DA0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = sub_251F34DA0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  uint64_t v10 = self;
  DataModel.accessoryFromAnyHome(for:)((uint64_t)v7);
  id v12 = v11;

  sub_251A1B064((uint64_t)v7, &qword_26B21FF90);
  return v12;
}

- (id)homeFor:(id)a3
{
  uint64_t v4 = sub_251F34DA0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = &v13[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_251F34D80();
  uint64_t v8 = self;
  uint64_t v9 = [(DataModel *)v8 sortedHomes];
  sub_251A1A568(0, (unint64_t *)&qword_26B21F2D0);
  unint64_t v10 = sub_251F35AC0();

  uint64_t v14 = v7;
  uint64_t v11 = sub_251A95D30(sub_251AA0080, (uint64_t)v13, v10);

  swift_bridgeObjectRelease();
  (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
  return v11;
}

- (id)accessoryFor:(id)a3
{
  return sub_251A9D528(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))DataModel.accessory(for:));
}

- (id)actionSetFor:(id)a3
{
  return sub_251A9D528(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))DataModel.actionSet(for:));
}

- (id)cameraProfileFor:(id)a3
{
  return sub_251A9D528(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))DataModel.cameraProfile(for:));
}

- (id)mediaProfileFor:(id)a3
{
  return sub_251A9D528(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))DataModel.mediaProfile(for:));
}

- (id)characteristicFor:(id)a3
{
  return sub_251A9D528(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))DataModel.characteristic(for:));
}

- (id)roomFor:(id)a3
{
  return sub_251A9D528(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))DataModel.room(for:));
}

- (id)serviceFor:(id)a3
{
  return sub_251A9D528(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))DataModel.service(for:));
}

- (id)serviceGroupFor:(id)a3
{
  return sub_251A9D528(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))DataModel.serviceGroup(for:));
}

- (id)mediaSystemFor:(id)a3
{
  return sub_251A9D528(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))DataModel.mediaSystem(for:));
}

- (id)userFor:(id)a3
{
  return sub_251A9D528(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))DataModel.user(for:));
}

- (id)residentFor:(id)a3
{
  return sub_251A9D528(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))DataModel.resident(for:));
}

+ (int64_t)context
{
  return qword_26B21F258;
}

+ (void)setContext:(int64_t)a3
{
  qword_26B21F258 = a3;
}

+ (HMHomeManagerConfiguration)homeManagerConfiguration
{
  return (HMHomeManagerConfiguration *)(id)qword_26B21F248;
}

+ (void)setHomeManagerConfiguration:(id)a3
{
  swift_beginAccess();
  uint64_t v4 = (void *)qword_26B21F248;
  qword_26B21F248 = (uint64_t)a3;
  id v5 = a3;
}

- (HMHomeManager)homeManager
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC13HomeDataModel9DataModel_homeManager);
  swift_beginAccess();
  return (HMHomeManager *)*v2;
}

- (void)setHomeManager:(id)a3
{
  uint64_t v4 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC13HomeDataModel9DataModel_homeManager);
  swift_beginAccess();
  id v5 = *v4;
  *uint64_t v4 = a3;
  id v6 = a3;
}

- (HMHome)_currentHome
{
  return (HMHome *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR____TtC13HomeDataModel9DataModel__currentHome));
}

- (void)set_currentHome:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC13HomeDataModel9DataModel__currentHome;
  id v6 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13HomeDataModel9DataModel__currentHome);
  id v7 = v6;
  id v8 = a3;
  uint64_t v11 = self;
  sub_251B771C0(a3);
  uint64_t v9 = *(Class *)((char *)&self->super.isa + v5);
  *(Class *)((char *)&self->super.isa + v5) = (Class)a3;
  id v10 = v8;

  sub_251B78068(v6);
}

- (HMHome)currentHome
{
  swift_getKeyPath();
  sub_251AD2C08();
  v3 = self;
  sub_251F34F10();
  swift_release();
  uint64_t v4 = (HMHome *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&v3->super.isa
                                                         + OBJC_IVAR____TtC13HomeDataModel9DataModel__currentHome));

  return v4;
}

- (void)setCurrentHome:(id)a3
{
  swift_getKeyPath();
  sub_251AD2C08();
  id v5 = a3;
  id v6 = self;
  sub_251F34F00();

  swift_release();
}

- (_TtC13HomeDataModel9DataModel)init
{
  return (_TtC13HomeDataModel9DataModel *)DataModel.init()();
}

- (void).cxx_destruct
{
  sub_251B81B80((uint64_t)self + OBJC_IVAR____TtC13HomeDataModel9DataModel__currentStateSnapshot, type metadata accessor for StateSnapshot);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  sub_251A1B064((uint64_t)self + OBJC_IVAR____TtC13HomeDataModel9DataModel__initialCharacteristicFetchContinuation, &qword_26B21F5F0);
  swift_release();
  swift_release();
  swift_release();

  v3 = (char *)self + OBJC_IVAR____TtC13HomeDataModel9DataModel___observationRegistrar;
  uint64_t v4 = sub_251F34F50();
  id v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

+ (_TtC13HomeDataModel9DataModel)shared
{
  if (qword_26B2200E0 != -1) {
    swift_once();
  }
  v2 = (void *)qword_26B21FF50;
  return (_TtC13HomeDataModel9DataModel *)v2;
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  id v4 = a3;
  id v5 = self;
  DataModel.homeManagerDidUpdateHomes(_:)((HMHomeManager)v4);
}

- (void)homeManagerDidUpdatePrimaryHome:(id)a3
{
  id v4 = a3;
  id v5 = self;
  DataModel.homeManagerDidUpdatePrimaryHome(_:)((HMHomeManager)v4);
}

- (void)homeManagerDidUpdateCurrentHome:(id)a3
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B220BB0);
  MEMORY[0x270FA5388](v6 - 8);
  id v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_251F35CD0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  sub_251F35C80();
  id v10 = self;
  id v11 = a3;
  uint64_t v12 = sub_251F35C70();
  v13 = (void *)swift_allocObject();
  uint64_t v14 = MEMORY[0x263F8F500];
  v13[2] = v12;
  v13[3] = v14;
  v13[4] = v10;
  v13[5] = ObjectType;
  sub_251ACBB48((uint64_t)v8, (uint64_t)&unk_269BA20D0, (uint64_t)v13);

  swift_release();
}

- (void)homeManager:(id)a3 didAddHome:(id)a4
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B220BB0);
  MEMORY[0x270FA5388](v8 - 8);
  id v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_251F35CD0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
  sub_251F35C80();
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = self;
  id v15 = v13;
  id v16 = v12;
  v17 = v14;
  uint64_t v18 = sub_251F35C70();
  v19 = (void *)swift_allocObject();
  uint64_t v20 = MEMORY[0x263F8F500];
  v19[2] = v18;
  v19[3] = v20;
  v19[4] = v15;
  v19[5] = v16;
  v19[6] = v17;
  v19[7] = ObjectType;
  sub_251ACBB48((uint64_t)v10, (uint64_t)&unk_269BA20C8, (uint64_t)v19);

  swift_release();
}

- (void)homeManager:(id)a3 didRemoveHome:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B220BB0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_251F35CD0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  sub_251F35C80();
  id v11 = a4;
  id v12 = self;
  id v13 = v11;
  uint64_t v14 = v12;
  id v15 = a3;
  uint64_t v16 = sub_251F35C70();
  v17 = (void *)swift_allocObject();
  uint64_t v18 = MEMORY[0x263F8F500];
  v17[2] = v16;
  v17[3] = v18;
  v17[4] = v13;
  v17[5] = v14;
  sub_251ACBB48((uint64_t)v9, (uint64_t)&unk_269BA20C0, (uint64_t)v17);

  swift_release();
}

- (void)homeManagerWillStartBatchNotifications:(id)a3
{
}

- (void)homeManagerDidEndBatchNotifications:(id)a3
{
}

- (void)homeDidUpdateName:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_251CB6F54(v4, 0xD000000000000015, 0x8000000251F70240);
}

- (void)homeDidUpdateAccessControlForCurrentUser:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_251CB6F54(v4, 0xD00000000000002BLL, 0x8000000251F70210);
}

- (void)home:(id)a3 didAddAccessory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  DataModel.home(_:didAdd:)((HMHome)v6, (HMAccessory)v7);
}

- (void)home:(id)a3 didRemoveAccessory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  DataModel.home(_:didRemove:)((HMHome)v6, (HMAccessory)v7);
}

- (void)home:(id)a3 didUpdateRoom:(id)a4 forAccessory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = self;
  _s13HomeDataModel0bC0C4home_9didUpdate3forySo6HMHomeC_So6HMRoomCSo11HMAccessoryCtF_0(v8, v9, v10);
}

- (void)home:(id)a3 didAddRoom:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_251CB8FC4(v6, v7, 0x643A5F28656D6F68, 0xEF293A6464416469, "%s room %@");
}

- (void)home:(id)a3 didRemoveRoom:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_251CB8FC4(v6, v7, 0xD000000000000012, 0x8000000251F6FD60, "%s room %@");
}

- (void)home:(id)a3 didUpdateNameForRoom:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  _s13HomeDataModel0bC0C4home_16didUpdateNameForySo6HMHomeC_So6HMRoomCtF_0(v6, v7);
}

- (void)home:(id)a3 didAddZone:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_251CB8FC4(v6, v7, 0x643A5F28656D6F68, 0xEF293A6464416469, "%s zone %@");
}

- (void)home:(id)a3 didRemoveZone:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_251CB8FC4(v6, v7, 0xD000000000000012, 0x8000000251F6FD60, "%s zone %@");
}

- (void)home:(id)a3 didUpdateNameForZone:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_251CB8FC4(v6, v7, 0xD000000000000019, 0x8000000251F70170, "%s zone %@");
}

- (void)home:(id)a3 didAddRoom:(id)a4 toZone:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = self;
  sub_251CB81A4(v8, v9, v10, 0xD000000000000012, 0x8000000251F701D0, "%s room %@ zone %@");
}

- (void)home:(id)a3 didRemoveRoom:(id)a4 fromZone:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = self;
  sub_251CB81A4(v8, v9, v10, 0xD000000000000017, 0x8000000251F701B0, "%s room %@ zone %@");
}

- (void)home:(id)a3 didAddServiceGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_251CB8FC4(v6, v7, 0x643A5F28656D6F68, 0xEF293A6464416469, "%s group %@)");
}

- (void)home:(id)a3 didRemoveServiceGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_251CB8FC4(v6, v7, 0xD000000000000012, 0x8000000251F6FD60, "%s group %@)");
}

- (void)home:(id)a3 didUpdateNameForServiceGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_251CB8FC4(v6, v7, 0xD000000000000019, 0x8000000251F70170, "%s group %@)");
}

- (void)home:(id)a3 didAddService:(id)a4 toServiceGroup:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = self;
  sub_251CB81A4(v8, v9, v10, 0xD000000000000012, 0x8000000251F701D0, "%s service %@ group %@");
}

- (void)home:(id)a3 didRemoveService:(id)a4 fromServiceGroup:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = self;
  sub_251CB81A4(v8, v9, v10, 0xD000000000000017, 0x8000000251F701B0, "%s service %@ group %@");
}

- (void)home:(id)a3 didAddActionSet:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_251CB8FC4(v6, v7, 0x643A5F28656D6F68, 0xEF293A6464416469, "%s actionSet %@");
}

- (void)home:(id)a3 didRemoveActionSet:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_251CB8FC4(v6, v7, 0xD000000000000012, 0x8000000251F6FD60, "%s actionSet %@");
}

- (void)home:(id)a3 didUpdateNameForActionSet:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_251CB8FC4(v6, v7, 0xD000000000000019, 0x8000000251F70170, "%s actionSet %@");
}

- (void)home:(id)a3 didUpdateActionsForActionSet:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_251CB8FC4(v6, v7, 0xD00000000000001CLL, 0x8000000251F70190, "%s actionSet %@");
}

- (void)home:(id)a3 didAddTrigger:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_251CB8FC4(v6, v7, 0x643A5F28656D6F68, 0xEF293A6464416469, "%s trigger %@");
}

- (void)home:(id)a3 didRemoveTrigger:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_251CB8FC4(v6, v7, 0xD000000000000012, 0x8000000251F6FD60, "%s trigger %@");
}

- (void)home:(id)a3 didUpdateNameForTrigger:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_251CB8FC4(v6, v7, 0xD000000000000019, 0x8000000251F70170, "%s trigger %@");
}

- (void)home:(id)a3 didUpdateTrigger:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_251CB8FC4(v6, v7, 0xD000000000000012, 0x8000000251F70110, "%s trigger %@");
}

- (void)home:(id)a3 didUnblockAccessory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_251CB8FC4(v6, v7, 0xD00000000000001CLL, 0x8000000251F70150, "%s accessory %@");
}

- (void)home:(id)a3 didEncounterError:(id)a4 forAccessory:(id)a5
{
  id v8 = a3;
  id v11 = a4;
  id v9 = a5;
  id v10 = self;
  _s13HomeDataModel0bC0C4home_17didEncounterError3forySo6HMHomeC_s0G0_pSo11HMAccessoryCtF_0(v8, v11, v9);
}

- (void)home:(id)a3 didUpdateHomeHubState:(unint64_t)a4
{
  id v6 = a3;
  id v7 = self;
  _s13HomeDataModel0bC0C4home_9didUpdateySo6HMHomeC_So0G8HubStateVtF_0(v6, a4);
}

- (void)homeDidUpdateSupportedFeatures:(id)a3
{
  id v4 = a3;
  id v5 = self;
  _s13HomeDataModel0bC0C30homeDidUpdateSupportedFeaturesyySo6HMHomeCF_0(v4);
}

- (void)home:(id)a3 didAddMediaSystem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_251CB8FC4(v6, v7, 0x643A5F28656D6F68, 0xEF293A6464416469, "%s %@");
}

- (void)home:(id)a3 didRemoveMediaSystem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_251CB8FC4(v6, v7, 0xD000000000000012, 0x8000000251F6FD60, "%s %@");
}

- (void)home:(id)a3 didUpdateAutomaticSoftwareUpdateEnabled:(BOOL)a4
{
  uint64_t updated = type metadata accessor for StateSnapshot.UpdateType(0);
  MEMORY[0x270FA5388](updated);
  id v8 = (uint64_t *)((char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B220BB8);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  id v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = qword_26B2200D8;
  id v14 = a3;
  id v15 = self;
  if (v13 != -1) {
    swift_once();
  }
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B220BD0);
  __swift_project_value_buffer(v16, (uint64_t)qword_26B21FF20);
  *id v8 = v14;
  swift_storeEnumTagMultiPayload();
  id v17 = v14;
  sub_251F35CF0();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)homeDidUpdateApplicationData:(id)a3
{
  id v4 = a3;
  id v5 = self;
  _s13HomeDataModel0bC0C024homeDidUpdateApplicationB0yySo6HMHomeCF_0(v4);
}

- (void)home:(id)a3 didUpdateApplicationDataForRoom:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_251CB97C0(v6, v7, "%s - new application data for room %s — %s");
}

- (void)home:(id)a3 didUpdateApplicationDataForServiceGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_251CB97C0(v6, v7, "%s - new application data for serviceGroup %s — %s");
}

- (void)home:(id)a3 didUpdateApplicationDataForActionSet:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_251CB97C0(v6, v7, "%s - new application data for actionSet %s — %s");
}

- (void)homeDidUpdateSupportsResidentSelection:(void *)a3
{
  uint64_t updated = type metadata accessor for StateSnapshot.UpdateType(0);
  MEMORY[0x270FA5388](updated);
  id v7 = (uint64_t *)((char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B220BB8);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = qword_26B2200D8;
  id v13 = a3;
  id v14 = a1;
  if (v12 != -1) {
    swift_once();
  }
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B220BD0);
  __swift_project_value_buffer(v15, (uint64_t)qword_26B21FF20);
  *id v7 = v13;
  swift_storeEnumTagMultiPayload();
  id v16 = v13;
  sub_251F35CF0();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)userActionPredictionController:(id)a3 didUpdatePredictions:(id)a4
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B220BB0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_251A1A568(0, &qword_26B21EB20);
  uint64_t v9 = sub_251F35AC0();
  uint64_t v10 = sub_251F35CD0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v8, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = a3;
  v11[5] = v9;
  id v12 = a3;
  id v13 = self;
  swift_bridgeObjectRetain();
  sub_251ACBB48((uint64_t)v8, (uint64_t)&unk_269BA20B8, (uint64_t)v11);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)accessoryDidUpdateName:(id)a3
{
  id v4 = a3;
  id v5 = self;
  _s13HomeDataModel0bC0C22accessoryDidUpdateNameyySo11HMAccessoryCF_0(v4);
}

- (void)accessoryDidUpdateReachability:(id)a3
{
  id v4 = a3;
  id v5 = self;
  DataModel.accessoryDidUpdateReachability(_:)((HMAccessory)v4);
}

- (void)accessoryDidUpdateServices:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_251CBA93C(v4, 0xD00000000000001ELL, 0x8000000251F70040);
}

- (void)accessory:(id)a3 didUpdateNameForService:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  _s13HomeDataModel0bC0C9accessory_16didUpdateNameForySo11HMAccessoryC_So9HMServiceCtF_0(v6, v7);
}

- (void)accessory:(id)a3 service:(id)a4 didUpdateValueForCharacteristic:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = self;
  sub_251CBA7A8((uint64_t)v9, v10);
}

- (void)accessory:(id)a3 didUpdateAssociatedServiceTypeForService:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_251CBA93C(v6, 0xD00000000000002FLL, 0x8000000251F6FFF0);
}

- (void)accessory:(id)a3 didAddProfile:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_251CBA93C(v6, 0xD000000000000014, 0x8000000251F6FFD0);
}

- (void)accessory:(id)a3 didRemoveProfile:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_251CBA93C(v6, 0xD000000000000017, 0x8000000251F6FFB0);
}

- (void)accessory:(id)a3 didUpdateFirmwareVersion:(id)a4
{
  id v5 = a3;
  id v6 = self;
  sub_251CBA93C(v5, 0xD000000000000026, 0x8000000251F6FF80);
}

- (void)accessoryDidUpdateApplicationData:(id)a3
{
  id v4 = a3;
  id v5 = self;
  _s13HomeDataModel0bC0C029accessoryDidUpdateApplicationB0yySo11HMAccessoryCF_0(v4);
}

- (void)accessory:(id)a3 didUpdateApplicationDataForService:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  _s13HomeDataModel0bC0C9accessory_020didUpdateApplicationB3ForySo11HMAccessoryC_So9HMServiceCtF_0(v6, v7);
}

- (void)mediaObject:(id)a3 didUpdateSettings:(id)a4
{
  uint64_t updated = type metadata accessor for StateSnapshot.UpdateType(0);
  MEMORY[0x270FA5388](updated);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B220BB8);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  id v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = qword_26B2200D8;
  swift_unknownObjectRetain();
  id v12 = a4;
  id v13 = self;
  if (v11 != -1) {
    swift_once();
  }
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B220BD0);
  __swift_project_value_buffer(v14, (uint64_t)qword_26B21FF20);
  swift_storeEnumTagMultiPayload();
  sub_251F35CF0();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  swift_unknownObjectRelease();
}

- (void)accessorySettingsDataSource:(id)a3 didReceiveSettingsUpdatesForAccessoryWithIdentifier:(id)a4 settings:(id)a5
{
  uint64_t updated = type metadata accessor for StateSnapshot.UpdateType(0);
  MEMORY[0x270FA5388](updated);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B220BB8);
  uint64_t v7 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_251F34DA0();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  id v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_251F34D80();
  uint64_t v14 = qword_26B2200D8;
  id v15 = a3;
  id v16 = self;
  if (v14 != -1) {
    swift_once();
  }
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B220BD0);
  __swift_project_value_buffer(v17, (uint64_t)qword_26B21FF20);
  swift_storeEnumTagMultiPayload();
  sub_251F35CF0();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v18);

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

- (void)symptomsHandler:(id)a3 didUpdateSymptoms:(id)a4
{
  uint64_t updated = type metadata accessor for StateSnapshot.UpdateType(0);
  MEMORY[0x270FA5388](updated);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B220BB8);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = qword_26B2200D8;
  id v12 = a3;
  id v13 = self;
  if (v11 != -1) {
    swift_once();
  }
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B220BD0);
  __swift_project_value_buffer(v14, (uint64_t)qword_26B21FF20);
  swift_storeEnumTagMultiPayload();
  sub_251F35CF0();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)homeManager:(void *)a3 didUpdateAuthorizationStatus:
{
  uint64_t updated = type metadata accessor for StateSnapshot.UpdateType(0);
  MEMORY[0x270FA5388](updated);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B220BB8);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = qword_26B2200D8;
  id v11 = a3;
  id v12 = a1;
  if (v10 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B220BD0);
  __swift_project_value_buffer(v13, (uint64_t)qword_26B21FF20);
  swift_storeEnumTagMultiPayload();
  sub_251F35CF0();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)lightProfile:(void *)a3 didUpdateSettings:(void *)a4
{
  uint64_t updated = type metadata accessor for StateSnapshot.UpdateType(0);
  MEMORY[0x270FA5388](updated);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B220BB8);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  id v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = qword_26B2200D8;
  id v13 = a3;
  id v14 = a4;
  id v15 = a1;
  if (v12 != -1) {
    swift_once();
  }
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B220BD0);
  __swift_project_value_buffer(v16, (uint64_t)qword_26B21FF20);
  swift_storeEnumTagMultiPayload();
  sub_251F35CF0();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)softwareUpdateController:(id)a3 accessory:(id)a4 didReceiveUpdate:(id)a5
{
  uint64_t v8 = sub_251F34DA0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  id v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_251F34D80();
  id v12 = a3;
  id v13 = a5;
  id v14 = self;
  sub_251CBB828((uint64_t)v11, v13);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)softwareUpdateController:(id)a3 accessory:(id)a4 didFailUpdate:(id)a5 withError:(id)a6 timestamp:(id)a7
{
  uint64_t v23 = sub_251F34DA0();
  uint64_t v11 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23);
  id v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_251F34D80();
  uint64_t v14 = sub_251F34D20();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v22 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_251F34CE0();
  id v18 = a3;
  id v19 = a5;
  id v20 = a6;
  uint64_t v21 = self;
  sub_251CBBB5C((uint64_t)v13, v19, v20);

  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v23);
}

- (void)softwareUpdateController:(id)a3 accessory:(id)a4 didUpdateProgress:(id)a5
{
  uint64_t v8 = sub_251F34DA0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_251F34D80();
  id v12 = a3;
  id v13 = a5;
  uint64_t v14 = self;
  sub_251CBBF24((uint64_t)v11, v13);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)residentDevice:(id)a3 didUpdateStatus:(unint64_t)a4
{
  uint64_t updated = type metadata accessor for StateSnapshot.UpdateType(0);
  MEMORY[0x270FA5388](updated);
  uint64_t v8 = (uint64_t *)((char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B220BB8);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  id v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = qword_26B2200D8;
  id v14 = a3;
  uint64_t v15 = self;
  if (v13 != -1) {
    swift_once();
  }
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B220BD0);
  __swift_project_value_buffer(v16, (uint64_t)qword_26B21FF20);
  *uint64_t v8 = objc_msgSend(v14, sel_home);
  swift_storeEnumTagMultiPayload();
  sub_251F35CF0();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)device:(id)a3 stateChanged:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  _s13HomeDataModel0bC0C6device_12stateChangedySo9MTRDeviceC_So0G5StateVtF_0(v6, a4);
}

- (void)device:(id)a3 receivedAttributeReport:(id)a4
{
}

- (void)device:(id)a3 receivedEventReport:(id)a4
{
}

- (void)deviceBecameActive:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_251ED3AB8(v4, "Received MTRDevice delegate deviceBecameActive for device:%@");
}

- (void)deviceCachePrimed:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_251ED3AB8(v4, "Received MTRDevice delegate deviceCachePrimed for device:%@");
}

@end