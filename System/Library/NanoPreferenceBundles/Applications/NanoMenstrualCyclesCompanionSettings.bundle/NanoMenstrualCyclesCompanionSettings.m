void *sub_3640()
{
  void *v0;
  void *v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t inited;
  unint64_t v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  id v41;

  v1 = v0;
  sub_6B40(0, &qword_105E8, (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.SchedulerOptions, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin();
  v3 = (char *)&v34 - v2;
  sub_6274();
  v5 = v4;
  v6 = *(void *)(v4 - 8);
  __chkstk_darwin();
  v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_6374();
  v10 = v9;
  v11 = *(void *)(v9 - 8);
  __chkstk_darwin();
  v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = [objc_allocWithZone((Class)HKHealthStore) init];
  v1[2] = v14;
  v39 = v11;
  v40 = v10;
  v37 = v5;
  v38 = v13;
  v35 = v3;
  v36 = v6;
  v34 = v8;
  if (((unint64_t)&_swiftEmptyArrayStorage & 0xC000000000000000) != 0 && sub_A2F8()) {
    v15 = (void *)sub_8E84((unint64_t)&_swiftEmptyArrayStorage);
  }
  else {
    v15 = &_swiftEmptySetSingleton;
  }
  v1[8] = v15;
  v16 = [objc_allocWithZone((Class)HKFeatureStatusManager) initWithFeatureIdentifier:HKFeatureIdentifierMenstrualCycles healthStore:v14];
  v1[3] = v16;
  v17 = [objc_allocWithZone((Class)HKFeatureAvailabilityStore) initWithFeatureIdentifier:HKFeatureIdentifierMenstrualCyclesHeartRateInput healthStore:v14];
  v1[4] = v17;
  v18 = [objc_allocWithZone((Class)HKFeatureStatusManager) initWithFeatureAvailabilityProviding:v17 healthDataSource:v14 currentCountryCode:0];
  v1[5] = v18;
  v19 = [objc_allocWithZone((Class)HKFeatureAvailabilityStore) initWithFeatureIdentifier:HKFeatureIdentifierMenstrualCyclesWristTemperatureInput healthStore:v14];
  v1[6] = v19;
  v20 = [objc_allocWithZone((Class)HKFeatureStatusManager) initWithFeatureAvailabilityProviding:v19 healthDataSource:v14 currentCountryCode:0];
  v1[7] = v20;
  sub_6BCC(0, &qword_10628, (uint64_t)&type metadata for Swift.AnyObject + 8, (uint64_t (*)(void, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_A8F0;
  *(void *)(inited + 32) = v16;
  *(void *)(inited + 40) = v18;
  *(void *)(inited + 48) = v20;
  v41 = (id)inited;
  sub_A158();
  v22 = (unint64_t)v41;
  v23 = v16;
  v24 = v18;
  v25 = v20;
  v26 = sub_3CA8(v22);
  swift_bridgeObjectRelease();
  v41 = v26;
  sub_630C();
  sub_6B40(0, &qword_10630, (uint64_t (*)(uint64_t))sub_630C, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Array);
  sub_6444(&qword_10600, 255, (void (*)(uint64_t))sub_630C);
  sub_64F4();
  v27 = v34;
  sub_9FB8();
  sub_68EC(0, &qword_10610);
  v41 = (id)sub_A1F8();
  v28 = sub_A1E8();
  v29 = (uint64_t)v35;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v35, 1, 1, v28);
  sub_6444(&qword_10618, 255, (void (*)(uint64_t))sub_6274);
  sub_648C();
  v30 = v37;
  v31 = v38;
  sub_A038();
  sub_6698(v29, &qword_105E8, (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.SchedulerOptions);

  (*(void (**)(char *, uint64_t))(v36 + 8))(v27, v30);
  swift_allocObject();
  swift_weakInit();
  sub_6444(&qword_10640, 255, (void (*)(uint64_t))sub_6374);
  v32 = v40;
  sub_A048();
  swift_release();
  (*(void (**)(char *, uint64_t))(v39 + 8))(v31, v32);
  swift_beginAccess();
  sub_9FE8();
  swift_endAccess();
  swift_release();
  return v1;
}

uint64_t sub_3C5C@<X0>(uint64_t *a1@<X8>)
{
  sub_68EC(0, &qword_10650);
  uint64_t result = sub_9F68();
  *a1 = result;
  return result;
}

void *sub_3CA8(unint64_t a1)
{
  if (a1 >> 62) {
    goto LABEL_14;
  }
  uint64_t v2 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  while (1)
  {
    uint64_t result = &_swiftEmptyArrayStorage;
    if (!v2) {
      break;
    }
    uint64_t result = (void *)sub_A2A8();
    if (v2 < 0)
    {
      __break(1u);
      return result;
    }
    uint64_t v4 = 0;
    while (v2 != v4)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v5 = (id)sub_A268();
      }
      else {
        id v5 = *(id *)(a1 + 8 * v4 + 32);
      }
      v6 = v5;
      ++v4;
      swift_getKeyPath();
      id v7 = v6;
      swift_getAtKeyPath();
      swift_release();

      sub_A288();
      sub_A2B8();
      sub_A2C8();
      sub_A298();
      if (v2 == v4) {
        return &_swiftEmptyArrayStorage;
      }
    }
    __break(1u);
LABEL_14:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_A2F8();
    swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_3E1C()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    type metadata accessor for SettingsModel();
    sub_6444(&qword_10648, v1, (void (*)(uint64_t))type metadata accessor for SettingsModel);
    sub_A008();
    swift_release();
    sub_A018();
    return swift_release();
  }
  return result;
}

id sub_3ECC()
{
  id v1 = [*(id *)(v0 + 24) featureAvailabilityProviding];
  id v7 = 0;
  id v2 = [v1 isCurrentOnboardingVersionCompletedWithError:&v7];
  swift_unknownObjectRelease();
  if (v2)
  {
    id v3 = v7;
    id v4 = [v2 BOOLValue];
  }
  else
  {
    id v5 = v7;
    sub_9EC8();

    swift_willThrow();
    swift_errorRelease();
    return 0;
  }
  return v4;
}

uint64_t sub_3FC0()
{
  sub_6B40(0, &qword_106B0, (uint64_t (*)(uint64_t))&type metadata accessor for FeatureStatus, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin();
  id v1 = &v15[-v0];
  uint64_t v2 = sub_9F38();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  id v5 = &v15[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_68EC(0, &qword_10650);
  sub_9F58();
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v3 + 56))(v1, 0, 1, v2);
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v3 + 32))(v5, v1, v2);
  v6 = (void *)sub_9F48();
  unsigned int v7 = [v6 areAllRequirementsSatisfied];

  v8 = (void *)sub_9F48();
  unsigned int v9 = [v8 areAllRequirementsSatisfied];

  v10 = (void *)sub_9F48();
  unsigned int v11 = [v10 areAllRequirementsSatisfied];

  (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
  if (v11) {
    int v12 = 0;
  }
  else {
    int v12 = 0x10000;
  }
  if (v9) {
    int v13 = 256;
  }
  else {
    int v13 = 0;
  }
  return v13 | v7 | v12;
}

uint64_t sub_4264()
{
  sub_6B40(0, &qword_106B0, (uint64_t (*)(uint64_t))&type metadata accessor for FeatureStatus, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin();
  id v1 = &v15[-v0];
  uint64_t v2 = sub_9F38();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  id v5 = &v15[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_68EC(0, &qword_10650);
  sub_9F58();
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v3 + 56))(v1, 0, 1, v2);
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v3 + 32))(v5, v1, v2);
  v6 = (void *)sub_9F48();
  unsigned int v7 = [v6 areAllRequirementsSatisfied];

  v8 = (void *)sub_9F48();
  unsigned int v9 = [v8 areAllRequirementsSatisfied];

  v10 = (void *)sub_9F48();
  unsigned int v11 = [v10 areAllRequirementsSatisfied];

  (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
  if (v11) {
    int v12 = 0;
  }
  else {
    int v12 = 0x10000;
  }
  if (v9) {
    int v13 = 256;
  }
  else {
    int v13 = 0;
  }
  return v13 | v7 | v12;
}

uint64_t sub_4508(char a1)
{
  return sub_4D48(a1, (uint64_t)&unk_C9A0, (uint64_t)&unk_106A8);
}

uint64_t sub_4528(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6)
{
  *(unsigned char *)(v6 + 120) = a5;
  *(void *)(v6 + 40) = a4;
  *(void *)(v6 + 48) = a6;
  uint64_t v7 = sub_9F98();
  *(void *)(v6 + 56) = v7;
  *(void *)(v6 + 64) = *(void *)(v7 - 8);
  *(void *)(v6 + 72) = swift_task_alloc();
  sub_6BCC(0, &qword_10680, (uint64_t)&type metadata for Bool, (uint64_t (*)(void, uint64_t))&type metadata accessor for HKFeatureSettings.Key);
  *(void *)(v6 + 80) = v8;
  *(void *)(v6 + 88) = *(void *)(v8 - 8);
  *(void *)(v6 + 96) = swift_task_alloc();
  return _swift_task_switch(sub_466C, 0, 0);
}

uint64_t sub_466C()
{
  sub_A1D8();
  id v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 104) = v1;
  uint64_t v2 = sub_68EC(0, &qword_10688);
  *id v1 = v0;
  v1[1] = sub_4734;
  uint64_t v3 = *(void *)(v0 + 96);
  uint64_t v4 = *(unsigned __int8 *)(v0 + 120);
  return HKFeatureAvailabilityProviding.setFeatureSetting(_:forKey:)(v4, v3, v2);
}

uint64_t sub_4734()
{
  uint64_t v2 = *(void *)(*v1 + 96);
  uint64_t v3 = *(void *)(*v1 + 88);
  uint64_t v4 = *(void *)(*v1 + 80);
  uint64_t v5 = *v1;
  *(void *)(v5 + 112) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  if (v0)
  {
    return _swift_task_switch(sub_48E8, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
}

uint64_t sub_48E8()
{
  v18 = v0;
  sub_9F78();
  swift_errorRetain();
  swift_errorRetain();
  id v1 = sub_9F88();
  os_log_type_t v2 = sub_A1C8();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = v0[14];
    uint64_t v4 = v0[8];
    uint64_t v15 = v0[7];
    uint64_t v16 = v0[9];
    uint64_t v5 = swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136446466;
    uint64_t v6 = sub_A398();
    v0[2] = sub_5BDC(v6, v7, &v17);
    sub_A218();
    swift_bridgeObjectRelease();
    *(_WORD *)(v5 + 12) = 2082;
    v0[3] = v3;
    swift_errorRetain();
    sub_6928();
    uint64_t v8 = sub_A108();
    v0[4] = sub_5BDC(v8, v9, &v17);
    sub_A218();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v1, v2, "[%{public}s] Error updating HR feature setting: %{public}s", (uint8_t *)v5, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v16, v15);
  }
  else
  {
    uint64_t v11 = v0[8];
    uint64_t v10 = v0[9];
    uint64_t v12 = v0[7];
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();

    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  int v13 = (uint64_t (*)(void))v0[1];
  return v13();
}

uint64_t sub_4B68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_A1B8();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_A1A8();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_6698(a1, &qword_10658, (uint64_t (*)(uint64_t))&type metadata accessor for TaskPriority);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_A198();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_4D28(char a1)
{
  return sub_4D48(a1, (uint64_t)&unk_C950, (uint64_t)&unk_10668);
}

uint64_t sub_4D48(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *v3;
  sub_6B40(0, &qword_10658, (uint64_t (*)(uint64_t))&type metadata accessor for TaskPriority, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin();
  uint64_t v8 = (char *)&v12 - v7;
  uint64_t v9 = sub_A1B8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = 0;
  *(void *)(v10 + 24) = 0;
  *(void *)(v10 + 32) = v3;
  *(unsigned char *)(v10 + 40) = a1;
  *(void *)(v10 + 48) = v6;
  swift_retain();
  sub_4B68((uint64_t)v8, a3, v10);
  return swift_release();
}

uint64_t sub_4E9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6)
{
  *(unsigned char *)(v6 + 120) = a5;
  *(void *)(v6 + 40) = a4;
  *(void *)(v6 + 48) = a6;
  uint64_t v7 = sub_9F98();
  *(void *)(v6 + 56) = v7;
  *(void *)(v6 + 64) = *(void *)(v7 - 8);
  *(void *)(v6 + 72) = swift_task_alloc();
  sub_6BCC(0, &qword_10680, (uint64_t)&type metadata for Bool, (uint64_t (*)(void, uint64_t))&type metadata accessor for HKFeatureSettings.Key);
  *(void *)(v6 + 80) = v8;
  *(void *)(v6 + 88) = *(void *)(v8 - 8);
  *(void *)(v6 + 96) = swift_task_alloc();
  return _swift_task_switch(sub_4FE0, 0, 0);
}

uint64_t sub_4FE0()
{
  sub_A1D8();
  id v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 104) = v1;
  uint64_t v2 = sub_68EC(0, &qword_10688);
  *id v1 = v0;
  v1[1] = sub_50A8;
  uint64_t v3 = *(void *)(v0 + 96);
  uint64_t v4 = *(unsigned __int8 *)(v0 + 120);
  return HKFeatureAvailabilityProviding.setFeatureSetting(_:forKey:)(v4, v3, v2);
}

uint64_t sub_50A8()
{
  uint64_t v2 = *(void *)(*v1 + 96);
  uint64_t v3 = *(void *)(*v1 + 88);
  uint64_t v4 = *(void *)(*v1 + 80);
  uint64_t v5 = *v1;
  *(void *)(v5 + 112) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  if (v0)
  {
    return _swift_task_switch(sub_525C, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
}

uint64_t sub_525C()
{
  v18 = v0;
  sub_9F78();
  swift_errorRetain();
  swift_errorRetain();
  id v1 = sub_9F88();
  os_log_type_t v2 = sub_A1C8();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = v0[14];
    uint64_t v4 = v0[8];
    uint64_t v15 = v0[7];
    uint64_t v16 = v0[9];
    uint64_t v5 = swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136446466;
    uint64_t v6 = sub_A398();
    v0[2] = sub_5BDC(v6, v7, &v17);
    sub_A218();
    swift_bridgeObjectRelease();
    *(_WORD *)(v5 + 12) = 2082;
    v0[3] = v3;
    swift_errorRetain();
    sub_6928();
    uint64_t v8 = sub_A108();
    v0[4] = sub_5BDC(v8, v9, &v17);
    sub_A218();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v1, v2, "[%{public}s] Error updating wrist temperature feature setting: %{public}s", (uint8_t *)v5, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v16, v15);
  }
  else
  {
    uint64_t v11 = v0[8];
    uint64_t v10 = v0[9];
    uint64_t v12 = v0[7];
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();

    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  int v13 = (uint64_t (*)(void))v0[1];
  return v13();
}

id *sub_54DC()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_552C()
{
  sub_54DC();

  return _swift_deallocClassInstance(v0, 72, 7);
}

uint64_t type metadata accessor for SettingsModel()
{
  return self;
}

void *sub_5584()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_5590@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for SettingsModel();
  uint64_t result = sub_A008();
  *a1 = result;
  return result;
}

uint64_t sub_55CC(uint64_t a1, uint64_t a2)
{
  return sub_5738(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_55E4(uint64_t a1, id *a2)
{
  uint64_t result = sub_A0C8();
  *a2 = 0;
  return result;
}

uint64_t sub_565C(uint64_t a1, id *a2)
{
  char v3 = sub_A0D8();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_56DC@<X0>(void *a1@<X8>)
{
  sub_A0E8();
  NSString v2 = sub_A0A8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_5720(uint64_t a1, uint64_t a2)
{
  return sub_5738(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_5738(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_A0E8();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_577C()
{
  sub_A0E8();
  sub_A118();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_57D0()
{
  sub_A0E8();
  sub_A378();
  sub_A118();
  Swift::Int v0 = sub_A388();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_5844()
{
  uint64_t v0 = sub_A0E8();
  uint64_t v2 = v1;
  if (v0 == sub_A0E8() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_A368();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_58D0@<X0>(void *a1@<X8>)
{
  NSString v2 = sub_A0A8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_5918@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_A0E8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_5944(uint64_t a1)
{
  uint64_t v2 = sub_6444(&qword_106D8, 255, type metadata accessor for OpenExternalURLOptionsKey);
  uint64_t v3 = sub_6444(&qword_106E0, 255, type metadata accessor for OpenExternalURLOptionsKey);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_5A08(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_5AE4;
  return v6(a1);
}

uint64_t sub_5AE4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_5BDC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_5CB0(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_69D0((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_69D0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_6980((uint64_t)v12);
  return v7;
}

uint64_t sub_5CB0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_A228();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_5E6C(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_A278();
  if (!v8)
  {
    sub_A2D8();
    __break(1u);
LABEL_17:
    uint64_t result = sub_A328();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_5E6C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_5F04(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_6104(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_6104(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_5F04(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_607C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_A258();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_A2D8();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_A128();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_A328();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_A2D8();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_607C(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_6BCC(0, &qword_10698, (uint64_t)&type metadata for UInt8, (uint64_t (*)(void, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_6104(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_6BCC(0, &qword_10698, (uint64_t)&type metadata for UInt8, (uint64_t (*)(void, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  int v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_A328();
  __break(1u);
  return result;
}

void sub_6274()
{
  if (!qword_105F0)
  {
    sub_630C();
    sub_6444(&qword_10600, 255, (void (*)(uint64_t))sub_630C);
    unint64_t v0 = sub_9FA8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_105F0);
    }
  }
}

void sub_630C()
{
  if (!qword_105F8)
  {
    sub_9F38();
    unint64_t v0 = sub_9FD8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_105F8);
    }
  }
}

void sub_6374()
{
  if (!qword_10608)
  {
    sub_6274();
    sub_68EC(255, &qword_10610);
    sub_6444(&qword_10618, 255, (void (*)(uint64_t))sub_6274);
    sub_648C();
    unint64_t v0 = sub_9FC8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10608);
    }
  }
}

uint64_t sub_6444(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_648C()
{
  unint64_t result = qword_10620;
  if (!qword_10620)
  {
    sub_68EC(255, &qword_10610);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10620);
  }
  return result;
}

unint64_t sub_64F4()
{
  unint64_t result = qword_10638;
  if (!qword_10638)
  {
    sub_6B40(255, &qword_10630, (uint64_t (*)(uint64_t))sub_630C, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Array);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10638);
  }
  return result;
}

uint64_t sub_657C()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_65B4()
{
  return sub_3E1C();
}

void *sub_65BC()
{
  return &protocol witness table for HKFeatureStatusManager;
}

uint64_t sub_65CC(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  char v7 = *(unsigned char *)(v1 + 40);
  uint64_t v8 = *(void *)(v1 + 48);
  int64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *int64_t v9 = v2;
  v9[1] = sub_6CFC;
  return sub_4E9C(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_6698(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  sub_6B40(0, a2, a3, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t sub_6708()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_6740(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_67F8;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_10670 + dword_10670);
  return v6(a1, v4);
}

uint64_t sub_67F8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_68EC(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

unint64_t sub_6928()
{
  unint64_t result = qword_10690;
  if (!qword_10690)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_10690);
  }
  return result;
}

uint64_t sub_6980(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_69D0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_6A34()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_6A74(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  char v7 = *(unsigned char *)(v1 + 40);
  uint64_t v8 = *(void *)(v1 + 48);
  int64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *int64_t v9 = v2;
  v9[1] = sub_67F8;
  return sub_4528(a1, v4, v5, v6, v7, v8);
}

void sub_6B40(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

void type metadata accessor for OpenExternalURLOptionsKey(uint64_t a1)
{
}

void sub_6BCC(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

uint64_t sub_6C18()
{
  return sub_6444(&qword_106C0, 255, type metadata accessor for OpenExternalURLOptionsKey);
}

uint64_t sub_6C64()
{
  return sub_6444(&qword_106C8, 255, type metadata accessor for OpenExternalURLOptionsKey);
}

uint64_t sub_6CB0()
{
  return sub_6444(&qword_106D0, 255, type metadata accessor for OpenExternalURLOptionsKey);
}

id sub_6D00(uint64_t a1, uint64_t a2, void *a3)
{
  swift_bridgeObjectRelease();
  uint64_t v5 = OBJC_IVAR____TtC36NanoMenstrualCyclesCompanionSettings22SettingsViewController_model;
  type metadata accessor for SettingsModel();
  swift_allocObject();
  uint64_t v6 = v3;
  *(void *)&v3[v5] = sub_3640();
  if (((unint64_t)&_swiftEmptyArrayStorage & 0xC000000000000000) != 0 && sub_A2F8()) {
    uint64_t v7 = (void *)sub_8E84((unint64_t)&_swiftEmptyArrayStorage);
  }
  else {
    uint64_t v7 = &_swiftEmptySetSingleton;
  }
  *(void *)&v6[OBJC_IVAR____TtC36NanoMenstrualCyclesCompanionSettings22SettingsViewController_subscriptions] = v7;

  v11.receiver = v6;
  v11.super_class = (Class)type metadata accessor for SettingsViewController();
  id v8 = objc_msgSendSuper2(&v11, "initWithNibName:bundle:", 0, 0);
  sub_9E0C(&qword_10648, (void (*)(uint64_t))type metadata accessor for SettingsModel);
  id v9 = v8;
  sub_A008();
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_A028();
  sub_A048();
  swift_release();
  swift_release();
  swift_beginAccess();
  sub_9FE8();
  swift_endAccess();
  swift_release();

  return v9;
}

void sub_6EF0()
{
  swift_beginAccess();
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = Strong;
    [Strong reloadSpecifiers];
  }
}

void sub_7038()
{
  uint64_t v1 = v0;
  sub_9F18();
  __chkstk_darwin();
  sub_A088();
  __chkstk_darwin();
  unint64_t v56 = (unint64_t)&_swiftEmptyArrayStorage;
  sub_8038();
  sub_A138();
  if (*(void *)((char *)&dword_10 + (v56 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                 + (v56 & 0xFFFFFFFFFFFFFF8)) >> 1)
    sub_A168();
  sub_A178();
  sub_A158();
  uint64_t v2 = &SettingsModel;
  if (sub_3ECC())
  {
    uint64_t v3 = self;
    NSString v4 = sub_A0A8();
    v51 = v3;
    id v5 = [v3 groupSpecifierWithID:v4];

    if (!v5)
    {
LABEL_30:
      __break(1u);
      goto LABEL_31;
    }
    sub_A098();
    uint64_t v50 = type metadata accessor for SettingsViewController();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    uint64_t v7 = self;
    id v8 = [v7 bundleForClass:ObjCClassFromMetadata];
    sub_9F08();
    sub_A0F8();
    NSString v9 = sub_A0A8();
    swift_bridgeObjectRelease();
    v53 = v5;
    uint64_t v49 = PSFooterTextGroupKey;
    objc_msgSend(v5, "setProperty:forKey:", v9);

    int v10 = sub_3FC0();
    v52 = v7;
    if ((v10 & 0x100) != 0)
    {
      int v11 = v10;
      v53;
      sub_A138();
      if (*(void *)((char *)&dword_10 + (v56 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                     + (v56 & 0xFFFFFFFFFFFFFF8)) >> 1)
        sub_A168();
      sub_A178();
      sub_A158();
      sub_A098();
      id v12 = [v7 bundleForClass:ObjCClassFromMetadata];
      sub_9F08();
      uint64_t v13 = sub_A0F8();
      sub_83C4(v13, v14, (uint64_t)"setWithUseHeartRate:specifier:", (uint64_t)"useHeartRateWithSpecifier:");
      uint64_t v16 = v15;
      swift_bridgeObjectRelease();
      id v17 = v16;
      sub_A138();
      if (*(void *)((char *)&dword_10 + (v56 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                     + (v56 & 0xFFFFFFFFFFFFFF8)) >> 1)
        sub_A168();
      sub_A178();
      sub_A158();
      if ((v11 & 0x10000) != 0)
      {
        sub_A098();
        id v18 = [v7 bundleForClass:ObjCClassFromMetadata];
        sub_9F08();
        uint64_t v19 = sub_A0F8();
        uint64_t v21 = v20;
        uint64_t v55 = v50;
        v54[0] = v1;
        id v22 = v1;
        sub_7988(v19, v21, v54, "openHeartRateLearnMore");
        swift_bridgeObjectRelease();

        sub_6980((uint64_t)v54);
        uint64_t v2 = &SettingsModel;
      }
      else
      {

        uint64_t v2 = &SettingsModel;
      }
    }
    int v23 = sub_4264();
    v24 = v53;
    if ((v23 & 0x100) != 0)
    {
      int v25 = v23;
      NSString v26 = sub_A0A8();
      id v27 = objc_msgSend(v51, *(SEL *)&v2[11].flags, v26);

      if (!v27)
      {
LABEL_31:
        __break(1u);
        return;
      }
      sub_A098();
      id v28 = [v7 bundleForClass:ObjCClassFromMetadata];
      sub_9F08();
      sub_A0F8();
      NSString v29 = sub_A0A8();
      swift_bridgeObjectRelease();
      [v27 setProperty:v29 forKey:v49];

      uint64_t v30 = ObjCClassFromMetadata;
      id v31 = v27;
      sub_A138();
      if (*(void *)((char *)&dword_10 + (v56 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                     + (v56 & 0xFFFFFFFFFFFFFF8)) >> 1)
        sub_A168();
      sub_A178();
      sub_A158();
      sub_A098();
      id v32 = [v52 bundleForClass:v30];
      sub_9F08();
      uint64_t v33 = sub_A0F8();
      sub_83C4(v33, v34, (uint64_t)"setWithUseWristTemperature:specifier:", (uint64_t)"useWristTemperatureWithSpecifier:");
      v36 = v35;
      swift_bridgeObjectRelease();
      if ((v25 & 0x10000) != 0)
      {
        sub_A098();
        id v37 = [v52 bundleForClass:v30];
        sub_9F08();
        uint64_t v38 = sub_A0F8();
        uint64_t v40 = v39;
        uint64_t v55 = v50;
        v54[0] = v1;
        id v41 = v1;
        sub_7988(v38, v40, v54, "openWristTemperatureLearnMore");
        swift_bridgeObjectRelease();
        sub_6980((uint64_t)v54);
      }
      id v42 = v36;
      sub_A138();
      uint64_t v2 = &SettingsModel;
      v24 = v53;
      if (*(void *)((char *)&dword_10 + (v56 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                     + (v56 & 0xFFFFFFFFFFFFFF8)) >> 1)
        sub_A168();
      sub_A178();
      sub_A158();
    }
  }
  v43 = self;
  NSString v44 = sub_A0A8();
  id v45 = objc_msgSend(v43, *(SEL *)&v2[11].flags, v44);

  if (!v45)
  {
    __break(1u);
    goto LABEL_30;
  }
  sub_A138();
  if (*(void *)((char *)&dword_10 + (v56 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                 + (v56 & 0xFFFFFFFFFFFFFF8)) >> 1)
    sub_A168();
  sub_A178();
  sub_A158();
  sub_84D8();
  sub_A138();
  if (*(void *)((char *)&dword_10 + (v56 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                 + (v56 & 0xFFFFFFFFFFFFFF8)) >> 1)
    sub_A168();
  sub_A178();
  sub_A158();
  unint64_t v46 = v56;
  unint64_t v47 = swift_bridgeObjectRetain();
  sub_7D64(v47);
  swift_bridgeObjectRelease();
  Class isa = sub_A148().super.isa;
  swift_bridgeObjectRelease();
  [v1 setSpecifiers:isa];

  sub_7D64(v46);
  swift_bridgeObjectRelease();
}

void sub_7988(uint64_t a1, uint64_t a2, void *a3, const char *a4)
{
  sub_9F18();
  __chkstk_darwin();
  sub_A088();
  __chkstk_darwin();
  sub_A098();
  type metadata accessor for SettingsViewController();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v8 = [self bundleForClass:ObjCClassFromMetadata];
  sub_9F08();
  uint64_t v9 = sub_A0F8();
  uint64_t v11 = v10;
  sub_9BC8(0, &qword_10738, (uint64_t (*)(uint64_t))sub_9C2C, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_ABB0;
  *(void *)(v12 + 56) = &type metadata for String;
  *(void *)(v12 + 64) = sub_9C84();
  *(void *)(v12 + 32) = v9;
  *(void *)(v12 + 40) = v11;
  swift_bridgeObjectRetain();
  sub_A0B8();
  swift_bridgeObjectRelease();
  NSString v13 = sub_A0A8();
  swift_bridgeObjectRelease();
  NSString v14 = sub_A0A8();
  swift_bridgeObjectRelease();
  id v15 = [v13 rangeOfString:v14];
  NSUInteger v17 = v16;

  v24.location = (NSUInteger)v15;
  v24.length = v17;
  id v18 = NSStringFromRange(v24);
  if (!v18)
  {
    sub_A0E8();
    id v18 = (NSString *)sub_A0A8();
    swift_bridgeObjectRelease();
  }
  sub_68EC(0, &qword_10750);
  uint64_t v19 = (objc_class *)swift_getObjCClassFromMetadata();
  uint64_t v20 = NSStringFromClass(v19);
  if (!v20)
  {
    sub_A0E8();
    uint64_t v20 = (NSString *)sub_A0A8();
    swift_bridgeObjectRelease();
  }
  [v4 setProperty:v20 forKey:PSFooterCellClassGroupKey];

  [v4 setProperty:v13 forKey:PSFooterHyperlinkViewTitleKey];
  [v4 setProperty:v18 forKey:PSFooterHyperlinkViewLinkRangeKey];

  sub_9CD8(a3, a3[3]);
  uint64_t v21 = sub_A358();
  id v22 = [self valueWithNonretainedObject:v21];
  swift_unknownObjectRelease();
  [v4 setProperty:v22 forKey:PSFooterHyperlinkViewTargetKey];

  int v23 = NSStringFromSelector(a4);
  if (!v23)
  {
    sub_A0E8();
    int v23 = (NSString *)sub_A0A8();
    swift_bridgeObjectRelease();
  }
  [v4 setProperty:v23 forKey:PSFooterHyperlinkViewActionKey];
}

uint64_t sub_7D64(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_A2F8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  }
  uint64_t v3 = &_swiftEmptyArrayStorage;
  if (!v2) {
    return (uint64_t)v3;
  }
  NSString v13 = &_swiftEmptyArrayStorage;
  uint64_t result = sub_8AEC(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        sub_A268();
        sub_68EC(0, &qword_10758);
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_8AEC(0, v3[2] + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v7 = v3[2];
        unint64_t v6 = v3[3];
        if (v7 >= v6 >> 1)
        {
          sub_8AEC(v6 > 1, v7 + 1, 1);
          uint64_t v3 = v13;
        }
        v3[2] = v7 + 1;
        sub_9BB8(v12, &v3[4 * v7 + 4]);
      }
    }
    else
    {
      id v8 = (id *)(a1 + 32);
      sub_68EC(0, &qword_10758);
      do
      {
        id v9 = *v8;
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_8AEC(0, v3[2] + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v11 = v3[2];
        unint64_t v10 = v3[3];
        if (v11 >= v10 >> 1)
        {
          sub_8AEC(v10 > 1, v11 + 1, 1);
          uint64_t v3 = v13;
        }
        v3[2] = v11 + 1;
        sub_9BB8(v12, &v3[4 * v11 + 4]);
        ++v8;
        --v2;
      }
      while (v2);
    }
    return (uint64_t)v3;
  }
  __break(1u);
  return result;
}

void sub_8038()
{
  swift_getObjectType();
  sub_9F18();
  __chkstk_darwin();
  sub_A088();
  __chkstk_darwin();
  uint64_t v0 = self;
  NSString v1 = sub_A0A8();
  id v2 = [v0 groupSpecifierWithID:v1];

  if (v2)
  {
    sub_9F28();
    uint64_t ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
    NSString v4 = NSStringFromClass(ObjCClassFromMetadata);
    if (!v4)
    {
      sub_A0E8();
      NSString v4 = (NSString *)sub_A0A8();
      swift_bridgeObjectRelease();
    }
    [v2 setProperty:v4 forKey:PSHeaderCellClassGroupKey];

    uint64_t v5 = swift_getObjCClassFromMetadata();
    unint64_t v6 = self;
    id v7 = [v6 bundleForClass:v5];
    NSString v8 = sub_A0A8();
    id v9 = [self imageNamed:v8 inBundle:v7];

    [v2 setProperty:v9 forKey:PSIconImageKey];
    sub_A098();
    type metadata accessor for SettingsViewController();
    uint64_t v10 = swift_getObjCClassFromMetadata();
    id v11 = [v6 bundleForClass:v10];
    sub_9F08();
    sub_A0F8();
    NSString v12 = sub_A0A8();
    swift_bridgeObjectRelease();
    [v2 setProperty:v12 forKey:PSTitleKey];

    sub_A098();
    id v13 = [v6 bundleForClass:v10];
    sub_9F08();
    sub_A0F8();
    NSString v14 = sub_A0A8();
    swift_bridgeObjectRelease();
    [v2 setProperty:v14 forKey:PSStaticHeaderTextKey];
  }
  else
  {
    __break(1u);
  }
}

void sub_83C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7 = self;
  NSString v8 = sub_A0A8();
  id v9 = [v7 preferenceSpecifierNamed:v8 target:v4 set:a3 get:a4 detail:0 cell:6 edit:0];

  if (v9)
  {
    Class isa = sub_A188().super.super.isa;
    [v9 setProperty:isa forKey:PSAllowMultilineTitleKey];

    Class v11 = sub_A188().super.super.isa;
    [v9 setProperty:v11 forKey:PSEnabledKey];
  }
  else
  {
    __break(1u);
  }
}

void sub_84D8()
{
  uint64_t v1 = v0;
  sub_9F18();
  __chkstk_darwin();
  sub_A088();
  __chkstk_darwin();
  unsigned __int8 v2 = sub_3ECC();
  uint64_t v3 = self;
  swift_bridgeObjectRetain();
  sub_A098();
  type metadata accessor for SettingsViewController();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v5 = [self bundleForClass:ObjCClassFromMetadata];
  sub_9F08();
  sub_A0F8();
  swift_bridgeObjectRelease();
  NSString v6 = sub_A0A8();
  swift_bridgeObjectRelease();
  id v7 = [v3 preferenceSpecifierNamed:v6 target:v1 set:0 get:0 detail:0 cell:13 edit:0];

  if (v7)
  {
    Class isa = sub_A188().super.super.isa;
    [v7 setProperty:isa forKey:PSAllowMultilineTitleKey];

    id v9 = &selRef_openHealthAppOnboarding;
    if (v2) {
      id v9 = &selRef_openHealthAppSettings;
    }
    [v7 setButtonAction:*v9];
  }
  else
  {
    __break(1u);
  }
}

void sub_87A0(void *a1, uint64_t a2, void *a3, void *a4, void (*a5)(id))
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a1;
  a5([v8 BOOLValue]);
}

Class sub_8850(void *a1, uint64_t a2, void *a3, void (*a4)(void))
{
  id v6 = a3;
  id v7 = a1;
  a4();
  v8.super.super.Class isa = sub_A188().super.super.isa;

  return v8.super.super.isa;
}

unint64_t sub_88C8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_9A48();
  uint64_t v2 = sub_A308();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_9AE8(v6, (uint64_t)&v13);
    uint64_t v7 = v13;
    unint64_t result = sub_8C78(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_9BB8(&v14, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v3[2] = v12;
    v6 += 40;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

id sub_8A48()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SettingsViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SettingsViewController()
{
  return self;
}

uint64_t sub_8AEC(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_8B0C(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_8B0C(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_9D1C();
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  long long v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_A328();
  __break(1u);
  return result;
}

unint64_t sub_8C78(uint64_t a1)
{
  sub_A0E8();
  sub_A378();
  sub_A118();
  Swift::Int v2 = sub_A388();
  swift_bridgeObjectRelease();

  return sub_8D0C(a1, v2);
}

unint64_t sub_8D0C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_A0E8();
    uint64_t v8 = v7;
    if (v6 == sub_A0E8() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_A368();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = sub_A0E8();
          uint64_t v15 = v14;
          if (v13 == sub_A0E8() && v15 == v16) {
            break;
          }
          char v18 = sub_A368();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

unint64_t sub_8E84(unint64_t result)
{
  unint64_t v1 = result;
  unint64_t v2 = result >> 62;
  if (result >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_A2F8();
    uint64_t result = swift_bridgeObjectRelease();
    if (v6)
    {
LABEL_3:
      sub_9D78();
      uint64_t result = sub_A238();
      uint64_t v3 = (unsigned char *)result;
      uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
      if (!v2) {
        goto LABEL_4;
      }
LABEL_8:
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_A2F8();
      uint64_t result = swift_bridgeObjectRelease();
      if (!v5) {
        return (unint64_t)v3;
      }
      goto LABEL_9;
    }
  }
  else if (*(void *)((char *)&dword_10 + (result & 0xFFFFFFFFFFFFFF8)))
  {
    goto LABEL_3;
  }
  uint64_t v3 = &_swiftEmptySetSingleton;
  uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
  if (v2) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = *(void *)(v4 + 16);
  if (!v5) {
    return (unint64_t)v3;
  }
LABEL_9:
  unint64_t v7 = 0;
  uint64_t v8 = v3 + 56;
  unint64_t v21 = v1 & 0xC000000000000001;
  unint64_t v19 = v1 + 32;
  uint64_t v20 = v1 & 0xFFFFFFFFFFFFFF8;
  while (v21)
  {
    uint64_t result = sub_A268();
    unint64_t v9 = result;
    BOOL v10 = __OFADD__(v7++, 1);
    if (v10) {
      goto LABEL_25;
    }
LABEL_18:
    sub_9FF8();
    sub_9E0C(&qword_10770, (void (*)(uint64_t))&type metadata accessor for AnyCancellable);
    uint64_t result = sub_A068();
    uint64_t v11 = -1 << v3[32];
    unint64_t v12 = result & ~v11;
    unint64_t v13 = v12 >> 6;
    uint64_t v14 = *(void *)&v8[8 * (v12 >> 6)];
    uint64_t v15 = 1 << v12;
    if (((1 << v12) & v14) != 0)
    {
      uint64_t v16 = ~v11;
      sub_9E0C(&qword_10778, (void (*)(uint64_t))&type metadata accessor for AnyCancellable);
      while (1)
      {
        uint64_t result = sub_A078();
        if (result) {
          break;
        }
        unint64_t v12 = (v12 + 1) & v16;
        unint64_t v13 = v12 >> 6;
        uint64_t v14 = *(void *)&v8[8 * (v12 >> 6)];
        uint64_t v15 = 1 << v12;
        if ((v14 & (1 << v12)) == 0) {
          goto LABEL_22;
        }
      }
      uint64_t result = swift_release();
    }
    else
    {
LABEL_22:
      *(void *)&v8[8 * v13] = v15 | v14;
      *(void *)(*((void *)v3 + 6) + 8 * v12) = v9;
      uint64_t v17 = *((void *)v3 + 2);
      BOOL v10 = __OFADD__(v17, 1);
      uint64_t v18 = v17 + 1;
      if (v10) {
        goto LABEL_26;
      }
      *((void *)v3 + 2) = v18;
    }
    if (v7 == v5) {
      return (unint64_t)v3;
    }
  }
  if (v7 >= *(void *)(v20 + 16)) {
    goto LABEL_27;
  }
  unint64_t v9 = *(void *)(v19 + 8 * v7);
  uint64_t result = swift_retain();
  BOOL v10 = __OFADD__(v7++, 1);
  if (!v10) {
    goto LABEL_18;
  }
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

void sub_9134()
{
  uint64_t v1 = OBJC_IVAR____TtC36NanoMenstrualCyclesCompanionSettings22SettingsViewController_model;
  type metadata accessor for SettingsModel();
  swift_allocObject();
  *(void *)&v0[v1] = sub_3640();
  if (((unint64_t)&_swiftEmptyArrayStorage & 0xC000000000000000) != 0 && sub_A2F8()) {
    unint64_t v2 = (void *)sub_8E84((unint64_t)&_swiftEmptyArrayStorage);
  }
  else {
    unint64_t v2 = &_swiftEmptySetSingleton;
  }
  *(void *)&v0[OBJC_IVAR____TtC36NanoMenstrualCyclesCompanionSettings22SettingsViewController_subscriptions] = v2;

  sub_A2E8();
  __break(1u);
}

uint64_t sub_9840()
{
  sub_9BC8(0, &qword_10720, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin();
  uint64_t v1 = (char *)&v10 - v0;
  sub_9EE8();
  uint64_t v2 = sub_9EF8();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    id v5 = [self sharedApplication];
    sub_9ED8(v6);
    uint64_t v8 = v7;
    sub_88C8((uint64_t)&_swiftEmptyArrayStorage);
    type metadata accessor for OpenExternalURLOptionsKey(0);
    sub_9E0C(&qword_106D8, type metadata accessor for OpenExternalURLOptionsKey);
    Class isa = sub_A058().super.isa;
    swift_bridgeObjectRelease();
    [v5 openURL:v8 options:isa completionHandler:0];

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v1, v2);
  }
  return result;
}

void sub_9A48()
{
  if (!qword_10728)
  {
    type metadata accessor for OpenExternalURLOptionsKey(255);
    sub_9E0C(&qword_106D8, type metadata accessor for OpenExternalURLOptionsKey);
    unint64_t v0 = sub_A318();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10728);
    }
  }
}

uint64_t sub_9AE8(uint64_t a1, uint64_t a2)
{
  sub_9B4C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_9B4C()
{
  if (!qword_10730)
  {
    type metadata accessor for OpenExternalURLOptionsKey(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_10730);
    }
  }
}

_OWORD *sub_9BB8(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void sub_9BC8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

unint64_t sub_9C2C()
{
  unint64_t result = qword_10740;
  if (!qword_10740)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_10740);
  }
  return result;
}

unint64_t sub_9C84()
{
  unint64_t result = qword_10748;
  if (!qword_10748)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10748);
  }
  return result;
}

void *sub_9CD8(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

void sub_9D1C()
{
  if (!qword_10760)
  {
    unint64_t v0 = sub_A348();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10760);
    }
  }
}

void sub_9D78()
{
  if (!qword_10768)
  {
    sub_9FF8();
    sub_9E0C(&qword_10770, (void (*)(uint64_t))&type metadata accessor for AnyCancellable);
    unint64_t v0 = sub_A248();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10768);
    }
  }
}

uint64_t sub_9E0C(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_9E54()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_9E8C()
{
}

uint64_t sub_9E94()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_9EC8()
{
  return _convertNSErrorToError(_:)();
}

void sub_9ED8(NSURL *retstr@<X8>)
{
}

uint64_t sub_9EE8()
{
  return URL.init(string:)();
}

uint64_t sub_9EF8()
{
  return type metadata accessor for URL();
}

uint64_t sub_9F08()
{
  return static Locale.current.getter();
}

uint64_t sub_9F18()
{
  return type metadata accessor for Locale();
}

uint64_t sub_9F28()
{
  return type metadata accessor for BridgePreferencesHeaderView();
}

uint64_t sub_9F38()
{
  return type metadata accessor for FeatureStatus();
}

uint64_t sub_9F48()
{
  return FeatureStatus.subscript.getter();
}

uint64_t sub_9F58()
{
  return FeatureStatusProviding<>.featureStatus()();
}

uint64_t sub_9F68()
{
  return FeatureStatusProviding<>.publisher.getter();
}

uint64_t sub_9F78()
{
  return static Logger.menstrualCycles.getter();
}

uint64_t sub_9F88()
{
  return Logger.logObject.getter();
}

uint64_t sub_9F98()
{
  return type metadata accessor for Logger();
}

uint64_t sub_9FA8()
{
  return type metadata accessor for Publishers.MergeMany();
}

uint64_t sub_9FB8()
{
  return Publishers.MergeMany.init<A>(_:)();
}

uint64_t sub_9FC8()
{
  return type metadata accessor for Publishers.ReceiveOn();
}

uint64_t sub_9FD8()
{
  return type metadata accessor for AnyPublisher();
}

uint64_t sub_9FE8()
{
  return AnyCancellable.store(in:)();
}

uint64_t sub_9FF8()
{
  return type metadata accessor for AnyCancellable();
}

uint64_t sub_A008()
{
  return ObservableObject<>.objectWillChange.getter();
}

void sub_A018()
{
}

uint64_t sub_A028()
{
  return type metadata accessor for ObservableObjectPublisher();
}

uint64_t sub_A038()
{
  return Publisher.receive<A>(on:options:)();
}

uint64_t sub_A048()
{
  return Publisher<>.sink(receiveValue:)();
}

NSDictionary sub_A058()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_A068()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t sub_A078()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

uint64_t sub_A088()
{
  return type metadata accessor for String.LocalizationValue();
}

uint64_t sub_A098()
{
  return String.LocalizationValue.init(_:)();
}

NSString sub_A0A8()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_A0B8()
{
  return static String.localizedStringWithFormat(_:_:)();
}

uint64_t sub_A0C8()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_A0D8()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_A0E8()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_A0F8()
{
  return String.init(localized:table:bundle:locale:comment:)();
}

uint64_t sub_A108()
{
  return String.init<A>(describing:)();
}

uint64_t sub_A118()
{
  return String.hash(into:)();
}

Swift::Int sub_A128()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_A138()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_A148()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_A158()
{
  return specialized Array._endMutation()();
}

uint64_t sub_A168()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_A178()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

NSNumber sub_A188()
{
  return Bool._bridgeToObjectiveC()();
}

uint64_t sub_A198()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_A1A8()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_A1B8()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_A1C8()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_A1D8()
{
  return static HKFeatureSettings.Key<A>.enabled.getter();
}

uint64_t sub_A1E8()
{
  return type metadata accessor for OS_dispatch_queue.SchedulerOptions();
}

uint64_t sub_A1F8()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_A218()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_A228()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_A238()
{
  return static _SetStorage.allocate(capacity:)();
}

uint64_t sub_A248()
{
  return type metadata accessor for _SetStorage();
}

uint64_t sub_A258()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_A268()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_A278()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_A288()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_A298()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_A2A8()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_A2B8()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_A2C8()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_A2D8()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_A2E8()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_A2F8()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_A308()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_A318()
{
  return type metadata accessor for _DictionaryStorage();
}

uint64_t sub_A328()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_A348()
{
  return type metadata accessor for _ContiguousArrayStorage();
}

uint64_t sub_A358()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t sub_A368()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_A378()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_A388()
{
  return Hasher._finalize()();
}

uint64_t sub_A398()
{
  return _typeName(_:qualified:)();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return _NSStringFromRange(range);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return _swift_getExistentialTypeMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return _swift_getTupleTypeMetadata2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

uint64_t swift_weakDestroy()
{
  return _swift_weakDestroy();
}

uint64_t swift_weakInit()
{
  return _swift_weakInit();
}

uint64_t swift_weakLoadStrong()
{
  return _swift_weakLoadStrong();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}