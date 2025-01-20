@interface CharacteristicNotificationManager.StateContainer
- (BOOL)cacheUpToDateWithNotificationsEnabledForCharacteristic:(id)a3 inHome:(id)a4;
- (BOOL)notificationsEnabledForCharacteristic:(id)a3 inHome:(id)a4;
- (_TtCC4Home33CharacteristicNotificationManager14StateContainer)init;
- (id)lastNotificationsEnableRequestDateForCharacteristic:(id)a3 forHome:(id)a4;
@end

@implementation CharacteristicNotificationManager.StateContainer

- (BOOL)notificationsEnabledForCharacteristic:(id)a3 inHome:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676AE0D8);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = a3;
  id v11 = a4;
  v12 = self;
  sub_20BA27DF4(v10, v11, (uint64_t)v9);
  uint64_t v13 = sub_20BCE6540();
  LOBYTE(self) = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48))(v9, 1, v13) != 1;
  sub_20BA1FD90((uint64_t)v9, &qword_2676AE0D8);

  return (char)self;
}

- (id)lastNotificationsEnableRequestDateForCharacteristic:(id)a3 forHome:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676AE0D8);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = a3;
  id v11 = a4;
  v12 = self;
  sub_20BA27DF4(v10, v11, (uint64_t)v9);

  uint64_t v13 = sub_20BCE6540();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v9, 1, v13) != 1)
  {
    uint64_t v15 = (void *)sub_20BCE64D0();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v9, v13);
  }
  return v15;
}

- (BOOL)cacheUpToDateWithNotificationsEnabledForCharacteristic:(id)a3 inHome:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  BOOL v9 = sub_20BA2847C(v6, v7);

  return v9;
}

- (_TtCC4Home33CharacteristicNotificationManager14StateContainer)init
{
  result = (_TtCC4Home33CharacteristicNotificationManager14StateContainer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end