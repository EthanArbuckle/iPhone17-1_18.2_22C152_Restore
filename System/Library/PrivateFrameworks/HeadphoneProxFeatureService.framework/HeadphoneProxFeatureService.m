uint64_t sub_250D2E47C()
{
  uint64_t v0;

  v0 = sub_250D3BE90();
  __swift_allocate_value_buffer(v0, qword_26B205168);
  __swift_project_value_buffer(v0, (uint64_t)qword_26B205168);
  return sub_250D3BE80();
}

HeadphoneProxFeatureService::HeadphoneProxFeatureManager::HeadphoneProxFeature_optional __swiftcall HeadphoneProxFeatureManager.HeadphoneProxFeature.init(rawValue:)(Swift::String rawValue)
{
  v2 = v1;
  unint64_t v3 = sub_250D3C060();
  result.value = swift_bridgeObjectRelease();
  char v5 = 5;
  if (v3 < 5) {
    char v5 = v3;
  }
  char *v2 = v5;
  return result;
}

unint64_t HeadphoneProxFeatureManager.HeadphoneProxFeature.rawValue.getter()
{
  unint64_t result = 0xD000000000000014;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x7473654764616568;
      break;
    case 2:
      return result;
    case 3:
      unint64_t result = 0xD000000000000010;
      break;
    case 4:
      unint64_t result = 0x6C65646F79;
      break;
    default:
      unint64_t result = 0x77654E7374616877;
      break;
  }
  return result;
}

uint64_t sub_250D2E618(char *a1, char *a2)
{
  return sub_250D2E624(*a1, *a2);
}

uint64_t sub_250D2E624(char a1, char a2)
{
  unint64_t v3 = 0xD000000000000014;
  unint64_t v4 = 0x8000000250D3C830;
  switch(a1)
  {
    case 1:
      unint64_t v4 = 0xEC00000073657275;
      unint64_t v3 = 0x7473654764616568;
      break;
    case 2:
      break;
    case 3:
      unint64_t v4 = 0x8000000250D3C850;
      unint64_t v3 = 0xD000000000000010;
      break;
    case 4:
      unint64_t v4 = 0xE500000000000000;
      unint64_t v3 = 0x6C65646F79;
      break;
    default:
      unint64_t v4 = 0xE800000000000000;
      unint64_t v3 = 0x77654E7374616877;
      break;
  }
  unint64_t v5 = 0xD000000000000014;
  unint64_t v6 = 0x8000000250D3C830;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xEC00000073657275;
      if (v3 == 0x7473654764616568) {
        goto LABEL_13;
      }
      goto LABEL_16;
    case 2:
      goto LABEL_12;
    case 3:
      unint64_t v6 = 0x8000000250D3C850;
      unint64_t v5 = 0xD000000000000010;
LABEL_12:
      if (v3 == v5) {
        goto LABEL_13;
      }
      goto LABEL_16;
    case 4:
      unint64_t v6 = 0xE500000000000000;
      if (v3 != 0x6C65646F79) {
        goto LABEL_16;
      }
      goto LABEL_13;
    default:
      unint64_t v6 = 0xE800000000000000;
      if (v3 != 0x77654E7374616877) {
        goto LABEL_16;
      }
LABEL_13:
      if (v4 == v6) {
        char v7 = 1;
      }
      else {
LABEL_16:
      }
        char v7 = sub_250D3C080();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_250D2E7FC()
{
  return sub_250D2E804();
}

uint64_t sub_250D2E804()
{
  return sub_250D3C0C0();
}

uint64_t sub_250D2E90C()
{
  return sub_250D2E914();
}

uint64_t sub_250D2E914()
{
  sub_250D3BF30();
  return swift_bridgeObjectRelease();
}

uint64_t sub_250D2EA08()
{
  return sub_250D2EA10();
}

uint64_t sub_250D2EA10()
{
  return sub_250D3C0C0();
}

HeadphoneProxFeatureService::HeadphoneProxFeatureManager::HeadphoneProxFeature_optional sub_250D2EB14(Swift::String *a1)
{
  return HeadphoneProxFeatureManager.HeadphoneProxFeature.init(rawValue:)(*a1);
}

unint64_t sub_250D2EB20@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = HeadphoneProxFeatureManager.HeadphoneProxFeature.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_250D2EB48()
{
  type metadata accessor for HeadphoneProxFeatureManager();
  uint64_t v0 = swift_allocObject();
  uint64_t v1 = MEMORY[0x263F8EE80];
  *(void *)(v0 + 16) = MEMORY[0x263F8EE80];
  *(void *)(v0 + 24) = v1;
  *(void *)(v0 + 32) = objc_msgSend(objc_allocWithZone(MEMORY[0x263F28940]), sel_init);
  *(void *)(v0 + 40) = objc_msgSend(objc_allocWithZone(MEMORY[0x263F28928]), sel_init);
  *(void *)(v0 + 56) = 0;
  swift_unknownObjectWeakInit();
  *(_DWORD *)(v0 + 72) = -1;
  *(void *)(v0 + 80) = objc_msgSend(objc_allocWithZone(MEMORY[0x263F472F8]), sel_init);
  if (qword_26B205160 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_250D3BE90();
  __swift_project_value_buffer(v2, (uint64_t)qword_26B205168);
  unint64_t v3 = sub_250D3BE70();
  os_log_type_t v4 = sub_250D3BF80();
  if (os_log_type_enabled(v3, v4))
  {
    unint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v5 = 0;
    _os_log_impl(&dword_250D2C000, v3, v4, "HeadphoneProxFeatureService: Init", v5, 2u);
    MEMORY[0x253387320](v5, -1, -1);
  }

  id v6 = objc_allocWithZone(MEMORY[0x263F28948]);
  char v7 = (void *)sub_250D3BEF0();
  id v8 = objc_msgSend(v6, sel_initWithBluetoothAddress_, v7);

  objc_msgSend(v8, sel_setHeadGesturesVersion_, 1);
  objc_msgSend(v8, sel_setVoiceQualityVersion_, 1);
  objc_msgSend(v8, sel_setWhatsNewVersion_, 2);
  objc_msgSend(v8, sel_setHeartRateVersion_, 1);
  objc_msgSend(v8, sel_setHearingAssistVersion_, 1);
  *(void *)(v0 + 64) = v8;
  sub_250D2F9D0();
  HeadphoneProxFeatureManager.configHearingModeClient()();
  swift_beginAccess();
  if (*(_DWORD *)(v0 + 72) == -1)
  {
    sub_250D3BC08(0, &qword_26B204F30);
    v9 = sub_250D3BFA0();
    uint64_t v10 = swift_allocObject();
    swift_weakInit();
    v22 = sub_250D3BC44;
    uint64_t v23 = v10;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v19 = 1107296256;
    v20 = sub_250D2F718;
    v21 = &block_descriptor_100;
    v11 = _Block_copy(&aBlock);
    swift_release();
    swift_beginAccess();
    notify_register_dispatch("com.apple.AudioAccessory.daemonStarted", (int *)(v0 + 72), v9, v11);
    swift_endAccess();
    _Block_release(v11);
  }
  v12 = *(void **)(v0 + 40);
  v22 = sub_250D2F76C;
  uint64_t v23 = 0;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v19 = 1107296256;
  v20 = sub_250D2F778;
  v21 = &block_descriptor_93;
  v13 = _Block_copy(&aBlock);
  id v14 = v12;
  objc_msgSend(v14, sel_setInterruptionHandler_, v13);
  _Block_release(v13);

  v15 = *(void **)(v0 + 40);
  v22 = sub_250D2F7BC;
  uint64_t v23 = 0;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v19 = 1107296256;
  v20 = sub_250D2F778;
  v21 = &block_descriptor_96;
  v16 = _Block_copy(&aBlock);
  id v17 = v15;
  objc_msgSend(v17, sel_setInvalidationHandler_, v16);
  _Block_release(v16);

  qword_26B205140 = v0;
}

uint64_t static HeadphoneProxFeatureManager.shared.getter()
{
  if (qword_26B205158 != -1) {
    swift_once();
  }
  return swift_retain();
}

uint64_t sub_250D2EFEC@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  *a2 = *(void *)(v3 + 16);
  return swift_bridgeObjectRetain();
}

uint64_t sub_250D2F038(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  swift_beginAccess();
  *(void *)(v3 + 16) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_250D2F098()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_250D2F0D0@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  *a2 = *(void *)(v3 + 24);
  return swift_bridgeObjectRetain();
}

uint64_t sub_250D2F11C(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  swift_beginAccess();
  *(void *)(v3 + 24) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_250D2F17C()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_250D2F1B4@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *a1 + 48;
  swift_beginAccess();
  uint64_t result = MEMORY[0x253387380](v4);
  uint64_t v6 = *(void *)(v3 + 56);
  *a2 = result;
  a2[1] = v6;
  return result;
}

uint64_t sub_250D2F210(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *a2;
  swift_beginAccess();
  *(void *)(v3 + 56) = v2;
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_250D2F26C()
{
  swift_beginAccess();
  return MEMORY[0x253387380](v0 + 48);
}

uint64_t sub_250D2F2B4(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(void *)(v2 + 56) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*sub_250D2F318(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[5] = v1;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x253387380](v1 + 48);
  uint64_t v5 = *(void *)(v1 + 56);
  v3[3] = v4;
  v3[4] = v5;
  return sub_250D2F398;
}

void sub_250D2F398(uint64_t a1, char a2)
{
  uint64_t v3 = *(void **)a1;
  *(void *)(*(void *)(*(void *)a1 + 40) + 56) = *(void *)(*(void *)a1 + 32);
  swift_unknownObjectWeakAssign();
  if (a2)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }
  free(v3);
}

Swift::Void __swiftcall HeadphoneProxFeatureManager.configHearingModeClient()()
{
  uint64_t v1 = *(void **)(v0 + 80);
  uint64_t v2 = swift_allocObject();
  swift_weakInit();
  uint64_t v19 = sub_250D37FC0;
  uint64_t v20 = v2;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v16 = 1107296256;
  id v17 = (uint64_t (*)())sub_250D2F778;
  v18 = &block_descriptor;
  uint64_t v3 = _Block_copy(&aBlock);
  id v4 = v1;
  swift_release();
  objc_msgSend(v4, sel_setInterruptionHandler_, v3);
  _Block_release(v3);

  uint64_t v5 = *(void **)(v0 + 80);
  swift_weakInit();
  id v6 = v5;
  swift_weakDestroy();
  uint64_t v19 = sub_250D381F8;
  uint64_t v20 = 0;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v16 = 1107296256;
  id v17 = (uint64_t (*)())sub_250D2F778;
  v18 = &block_descriptor_3;
  char v7 = _Block_copy(&aBlock);
  objc_msgSend(v6, sel_setInvalidationHandler_, v7);
  _Block_release(v7);

  id v8 = *(void **)(v0 + 80);
  uint64_t v9 = swift_allocObject();
  swift_weakInit();
  uint64_t v19 = sub_250D383BC;
  uint64_t v20 = v9;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v16 = 1107296256;
  id v17 = sub_250D304D0;
  v18 = &block_descriptor_7;
  uint64_t v10 = _Block_copy(&aBlock);
  id v11 = v8;
  swift_release();
  objc_msgSend(v11, sel_setDeviceRecordChangedHandler_, v10);
  _Block_release(v10);

  v12 = *(void **)(v0 + 80);
  uint64_t v19 = sub_250D38750;
  uint64_t v20 = 0;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v16 = 1107296256;
  id v17 = (uint64_t (*)())sub_250D30764;
  v18 = &block_descriptor_10;
  v13 = _Block_copy(&aBlock);
  id v14 = v12;
  objc_msgSend(v14, sel_activateWithCompletion_, v13);
  _Block_release(v13);
}

uint64_t sub_250D2F6E0()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_250D2F718(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

void sub_250D2F76C()
{
}

uint64_t sub_250D2F778(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_250D2F7BC()
{
}

void sub_250D2F7C8(const char *a1)
{
  if (qword_26B205160 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_250D3BE90();
  __swift_project_value_buffer(v2, (uint64_t)qword_26B205168);
  oslog = sub_250D3BE70();
  os_log_type_t v3 = sub_250D3BF80();
  if (os_log_type_enabled(oslog, v3))
  {
    id v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_250D2C000, oslog, v3, a1, v4, 2u);
    MEMORY[0x253387320](v4, -1, -1);
  }
}

unint64_t sub_250D2F8B8(uint64_t a1, uint64_t *a2)
{
  if (!*(void *)(a1 + 16))
  {
    os_log_type_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  os_log_type_t v3 = (void *)sub_250D3C040();
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  swift_retain();
  uint64_t v5 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v6 = (uint64_t)*(v5 - 2);
    uint64_t v7 = (uint64_t)*(v5 - 1);
    id v8 = *v5;
    swift_bridgeObjectRetain();
    id v9 = v8;
    unint64_t result = sub_250D39810(v6, v7);
    if (v11) {
      break;
    }
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v12 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v12 = v6;
    v12[1] = v7;
    *(void *)(v3[7] + 8 * result) = v9;
    uint64_t v13 = v3[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v3[2] = v15;
    v5 += 3;
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

void sub_250D2F9D0()
{
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F28940]), sel_init);
  uint64_t v2 = *(void **)(v0 + 32);
  *(void *)(v0 + 32) = v1;

  os_log_type_t v3 = *(void **)(v0 + 32);
  uint64_t v4 = swift_allocObject();
  swift_weakInit();
  v24 = sub_250D3ABDC;
  uint64_t v25 = v4;
  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 1107296256;
  v22 = (uint64_t (*)())sub_250D2F778;
  uint64_t v23 = &block_descriptor_68;
  uint64_t v5 = _Block_copy(&v20);
  id v6 = v3;
  swift_release();
  objc_msgSend(v6, sel_setInterruptionHandler_, v5);
  _Block_release(v5);

  uint64_t v7 = *(void **)(v0 + 32);
  uint64_t v8 = swift_allocObject();
  swift_weakInit();
  v24 = sub_250D3ABE8;
  uint64_t v25 = v8;
  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 1107296256;
  v22 = (uint64_t (*)())sub_250D2F778;
  uint64_t v23 = &block_descriptor_72;
  id v9 = _Block_copy(&v20);
  id v10 = v7;
  swift_release();
  objc_msgSend(v10, sel_setInvalidationHandler_, v9);
  _Block_release(v9);

  char v11 = *(void **)(v0 + 32);
  v24 = sub_250D3AD44;
  uint64_t v25 = v0;
  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 1107296256;
  v22 = sub_250D304D0;
  uint64_t v23 = &block_descriptor_75;
  v12 = _Block_copy(&v20);
  id v13 = v11;
  swift_retain();
  swift_release();
  objc_msgSend(v13, sel_setDeviceFoundHandler_, v12);
  _Block_release(v12);

  BOOL v14 = *(void **)(v0 + 32);
  v24 = sub_250D3AD4C;
  uint64_t v25 = v0;
  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 1107296256;
  v22 = sub_250D304D0;
  uint64_t v23 = &block_descriptor_78;
  uint64_t v15 = _Block_copy(&v20);
  swift_retain();
  id v16 = v14;
  swift_release();
  objc_msgSend(v16, sel_setDeviceLostHandler_, v15);
  _Block_release(v15);

  id v17 = *(void **)(v0 + 32);
  v24 = sub_250D304D4;
  uint64_t v25 = 0;
  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 1107296256;
  v22 = (uint64_t (*)())sub_250D30764;
  uint64_t v23 = &block_descriptor_81;
  v18 = _Block_copy(&v20);
  id v19 = v17;
  objc_msgSend(v19, sel_activateWithCompletion_, v18);
  _Block_release(v18);
}

void sub_250D2FD4C(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_250D3BE90();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = ((char *)&v60 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v8 = 0x265358000uLL;
  id v9 = objc_msgSend(a1, sel_bluetoothAddress);
  if (!v9)
  {
    if (qword_26B205160 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v4, (uint64_t)qword_26B205168);
    os_log_t v65 = (os_log_t)sub_250D3BE70();
    os_log_type_t v17 = sub_250D3BF70();
    if (os_log_type_enabled(v65, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_250D2C000, v65, v17, "HeadphoneProxFeatureService: AADevice has no address", v18, 2u);
      MEMORY[0x253387320](v18, -1, -1);
    }
    os_log_t v19 = v65;

    return;
  }
  id v10 = v9;
  uint64_t v64 = v4;
  os_log_t v65 = v7;
  sub_250D3BF00();

  uint64_t v11 = sub_250D3BF20();
  uint64_t v13 = v12;
  swift_bridgeObjectRelease();
  BOOL v14 = (uint64_t *)(a2 + 16);
  swift_beginAccess();
  if (*(void *)(*(void *)(a2 + 16) + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_250D39810(v11, v13);
    char v16 = v15 ^ 1;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    char v16 = 1;
  }
  uint64_t v20 = *v14;
  if (!*(void *)(*v14 + 16)) {
    goto LABEL_16;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v21 = sub_250D39810(v11, v13);
  if ((v22 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_16:
    objc_msgSend(a1, sel_bobbleCapability);
    BOOL v27 = 0;
    goto LABEL_17;
  }
  uint64_t v23 = a2;
  uint64_t v24 = v5;
  id v25 = *(id *)(*(void *)(v20 + 56) + 8 * v21);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unsigned int v26 = objc_msgSend(v25, sel_bobbleCapability);

  uint64_t v5 = v24;
  a2 = v23;
  unint64_t v8 = 0x265358000;
  BOOL v27 = v26 == objc_msgSend(a1, sel_bobbleCapability);
LABEL_17:
  swift_beginAccess();
  id v28 = a1;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v67 = *v14;
  *BOOL v14 = 0x8000000000000000;
  sub_250D39F28((uint64_t)v28, v11, v13, isUniquelyReferenced_nonNull_native, &qword_269B01CA8);
  *BOOL v14 = v67;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_endAccess();
  if (v16 & 1 | !v27)
  {
    uint64_t v30 = a2 + 48;
    swift_beginAccess();
    uint64_t v31 = MEMORY[0x253387380](a2 + 48);
    swift_unknownObjectRelease();
    if (v31)
    {
      if (qword_26B205160 != -1) {
        swift_once();
      }
      uint64_t v32 = v64;
      uint64_t v33 = __swift_project_value_buffer(v64, (uint64_t)qword_26B205168);
      os_log_t v34 = v65;
      (*(void (**)(os_log_t, uint64_t, uint64_t))(v5 + 16))(v65, v33, v32);
      swift_retain_n();
      v35 = sub_250D3BE70();
      os_log_type_t v36 = sub_250D3BF80();
      int v62 = v36;
      if (os_log_type_enabled(v35, v36))
      {
        uint64_t v37 = swift_slowAlloc();
        uint64_t v63 = a2 + 48;
        uint64_t v38 = v37;
        uint64_t v60 = swift_slowAlloc();
        uint64_t v67 = v60;
        *(_DWORD *)uint64_t v38 = 136315650;
        if (v16) {
          uint64_t v39 = 5457241;
        }
        else {
          uint64_t v39 = 20302;
        }
        uint64_t v61 = v5;
        if (v16) {
          unint64_t v40 = 0xE300000000000000;
        }
        else {
          unint64_t v40 = 0xE200000000000000;
        }
        uint64_t v66 = sub_250D38FF4(v39, v40, &v67);
        sub_250D3BFB0();
        swift_bridgeObjectRelease();
        *(_WORD *)(v38 + 12) = 2080;
        if (v27) {
          uint64_t v41 = 20302;
        }
        else {
          uint64_t v41 = 5457241;
        }
        if (v27) {
          unint64_t v42 = 0xE200000000000000;
        }
        else {
          unint64_t v42 = 0xE300000000000000;
        }
        uint64_t v66 = sub_250D38FF4(v41, v42, &v67);
        sub_250D3BFB0();
        swift_bridgeObjectRelease();
        *(_WORD *)(v38 + 22) = 2080;
        uint64_t v43 = MEMORY[0x253387380](v63);
        swift_unknownObjectRelease();
        if (v43) {
          uint64_t v44 = 5457241;
        }
        else {
          uint64_t v44 = 20302;
        }
        if (v43) {
          unint64_t v45 = 0xE300000000000000;
        }
        else {
          unint64_t v45 = 0xE200000000000000;
        }
        uint64_t v66 = sub_250D38FF4(v44, v45, &v67);
        sub_250D3BFB0();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_250D2C000, v35, (os_log_type_t)v62, "HeadphoneProxFeatureService: Device Found: First Time of Connection: %s, Capability Ready: %s, Delegate Set: %s", (uint8_t *)v38, 0x20u);
        uint64_t v46 = v60;
        swift_arrayDestroy();
        MEMORY[0x253387320](v46, -1, -1);
        uint64_t v47 = v38;
        uint64_t v30 = v63;
        MEMORY[0x253387320](v47, -1, -1);

        (*(void (**)(os_log_t, uint64_t))(v61 + 8))(v65, v64);
      }
      else
      {

        swift_release_n();
        (*(void (**)(os_log_t, uint64_t))(v5 + 8))(v34, v32);
      }
      id v48 = objc_msgSend(v28, *(SEL *)(v8 + 1024), v60);
      if (v48)
      {
        v49 = v48;
        uint64_t v50 = sub_250D3BF00();
        unint64_t v52 = v51;
      }
      else
      {
        uint64_t v50 = 0;
        unint64_t v52 = 0;
      }
      char v53 = sub_250D347B4(v50, v52);
      swift_bridgeObjectRelease();
      if (v53)
      {
        v54 = sub_250D38DE8(0, 1, 1, MEMORY[0x263F8EE78]);
        unint64_t v56 = v54[2];
        unint64_t v55 = v54[3];
        if (v56 >= v55 >> 1) {
          v54 = sub_250D38DE8((void *)(v55 > 1), v56 + 1, 1, v54);
        }
        v54[2] = v56 + 1;
        v57 = &v54[2 * v56];
        v57[4] = 0x77654E7374616877;
        v57[5] = 0xE800000000000000;
      }
      else
      {
        v54 = (void *)MEMORY[0x263F8EE78];
        if (!*(void *)(MEMORY[0x263F8EE78] + 16))
        {
LABEL_52:
          swift_bridgeObjectRelease();
          return;
        }
      }
      if (MEMORY[0x253387380](v30))
      {
        uint64_t v58 = *(void *)(a2 + 56);
        uint64_t ObjectType = swift_getObjectType();
        (*(void (**)(id, void *, uint64_t, uint64_t))(v58 + 8))(v28, v54, ObjectType, v58);
        swift_bridgeObjectRelease();
        swift_unknownObjectRelease();
        return;
      }
      goto LABEL_52;
    }
  }
}

uint64_t sub_250D304D4(void *a1)
{
  uint64_t v2 = sub_250D3BE90();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B205160 != -1) {
    swift_once();
  }
  uint64_t v6 = __swift_project_value_buffer(v2, (uint64_t)qword_26B205168);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  id v7 = a1;
  id v8 = a1;
  id v9 = sub_250D3BE70();
  os_log_type_t v10 = sub_250D3BF80();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v18 = v12;
    *(_DWORD *)uint64_t v11 = 136315138;
    uint64_t v20 = v12;
    if (a1) {
      uint64_t v13 = 0x64656C696146;
    }
    else {
      uint64_t v13 = 0x6564656563637553;
    }
    if (a1) {
      unint64_t v14 = 0xE600000000000000;
    }
    else {
      unint64_t v14 = 0xE900000000000064;
    }
    uint64_t v19 = sub_250D38FF4(v13, v14, &v20);
    sub_250D3BFB0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_250D2C000, v9, v10, "HeadphoneProxFeatureService: Device Manager Activation %s", v11, 0xCu);
    uint64_t v15 = v18;
    swift_arrayDestroy();
    MEMORY[0x253387320](v15, -1, -1);
    MEMORY[0x253387320](v11, -1, -1);
  }
  else
  {
  }
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

void sub_250D30764(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

void sub_250D307D0(uint64_t a1, unint64_t a2, uint64_t a3)
{
  if (a2)
  {
    os_log_t v4 = v3;
    uint64_t v5 = a3;
    unint64_t v6 = a2;
    uint64_t v7 = *(void *)(a3 + 16);
    uint64_t v8 = qword_26B205160;
    swift_bridgeObjectRetain();
    uint64_t v97 = v7;
    if (v7)
    {
      if (v8 != -1) {
LABEL_55:
      }
        swift_once();
      uint64_t v96 = sub_250D3BE90();
      __swift_project_value_buffer(v96, (uint64_t)qword_26B205168);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      id v9 = sub_250D3BE70();
      os_log_type_t v10 = sub_250D3BF80();
      BOOL v11 = os_log_type_enabled(v9, v10);
      uint64_t v12 = MEMORY[0x263F8EE58];
      unint64_t v92 = v6;
      uint64_t v93 = v5;
      if (v11)
      {
        uint64_t v13 = swift_slowAlloc();
        uint64_t v14 = swift_slowAlloc();
        aBlock[0] = v14;
        *(_DWORD *)uint64_t v13 = 136315394;
        swift_bridgeObjectRetain();
        id v101 = (id)sub_250D38FF4(a1, v6, aBlock);
        sub_250D3BFB0();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v13 + 12) = 2080;
        uint64_t v15 = MEMORY[0x253386D30](v93, &type metadata for HeadphoneProxFeatureManager.HeadphoneProxFeature);
        id v101 = (id)sub_250D38FF4(v15, v16, aBlock);
        sub_250D3BFB0();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_250D2C000, v9, v10, "HeadphoneProxFeatureService: [%s] setProxCardShowedFeatures: %s", (uint8_t *)v13, 0x16u);
        swift_arrayDestroy();
        uint64_t v17 = v14;
        uint64_t v5 = v93;
        MEMORY[0x253387320](v17, -1, -1);
        MEMORY[0x253387320](v13, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
      }
      id v26 = objc_allocWithZone(MEMORY[0x263F28948]);
      swift_bridgeObjectRetain();
      BOOL v27 = (void *)sub_250D3BEF0();
      swift_bridgeObjectRelease();
      id v28 = objc_msgSend(v26, sel_initWithBluetoothAddress_, v27);

      objc_msgSend(v28, sel_setHeadGesturesVersion_, 0);
      objc_msgSend(v28, sel_setVoiceQualityVersion_, 0);
      objc_msgSend(v28, sel_setWhatsNewVersion_, 0);
      objc_msgSend(v28, sel_setHeartRateVersion_, 0);
      objc_msgSend(v28, sel_setHearingAssistVersion_, 0);
      swift_bridgeObjectRetain();
      uint64_t v29 = 0;
      uint64_t v86 = v12 + 8;
      os_log_t osloga = v4;
      id v95 = v28;
      do
      {
        uint64_t v32 = v29 + 1;
        if (__OFADD__(v29, 1))
        {
          __break(1u);
          goto LABEL_55;
        }
        switch(*(unsigned char *)(v5 + v29 + 32))
        {
          case 1:
            if (qword_26B205160 != -1) {
              swift_once();
            }
            __swift_project_value_buffer(v96, (uint64_t)qword_26B205168);
            swift_bridgeObjectRetain_n();
            id v43 = v28;
            swift_retain_n();
            id v44 = v43;
            unint64_t v45 = sub_250D3BE70();
            os_log_type_t v46 = sub_250D3BF80();
            if (os_log_type_enabled(v45, v46))
            {
              uint64_t v47 = swift_slowAlloc();
              uint64_t v88 = swift_slowAlloc();
              aBlock[0] = v88;
              *(_DWORD *)uint64_t v47 = 136315650;
              swift_bridgeObjectRetain();
              id v101 = (id)sub_250D38FF4(a1, v6, aBlock);
              sub_250D3BFB0();
              swift_bridgeObjectRelease_n();
              *(_WORD *)(v47 + 12) = 2080;
              id v101 = objc_msgSend(v44, sel_headGesturesVersion);
              sub_250D397BC();
              uint64_t v48 = sub_250D3BFD0();
              id v101 = (id)sub_250D38FF4(v48, v49, aBlock);
              unint64_t v6 = v92;
              sub_250D3BFB0();
              swift_bridgeObjectRelease();

              *(_WORD *)(v47 + 22) = 2080;
              id v101 = [(objc_class *)osloga[8].isa headGesturesVersion];
              uint64_t v50 = sub_250D3BFD0();
              id v101 = (id)sub_250D38FF4(v50, v51, aBlock);
              sub_250D3BFB0();
              swift_bridgeObjectRelease();
              swift_release_n();
              _os_log_impl(&dword_250D2C000, v45, v46, "HeadphoneProxFeatureService: [%s] setProxCardShowedFeatures: Head Gestures: %s -> %s", (uint8_t *)v47, 0x20u);
              swift_arrayDestroy();
              uint64_t v5 = v93;
              MEMORY[0x253387320](v88, -1, -1);
              uint64_t v52 = v47;
              os_log_t v4 = osloga;
              MEMORY[0x253387320](v52, -1, -1);
            }
            else
            {
              swift_bridgeObjectRelease_n();

              swift_release_n();
            }

            uint64_t v30 = &selRef_headGesturesVersion;
            uint64_t v31 = &selRef_setHeadGesturesVersion_;
            break;
          case 2:
            if (qword_26B205160 != -1) {
              swift_once();
            }
            __swift_project_value_buffer(v96, (uint64_t)qword_26B205168);
            swift_bridgeObjectRetain_n();
            id v53 = v28;
            swift_retain_n();
            id v54 = v53;
            unint64_t v55 = sub_250D3BE70();
            os_log_type_t v56 = sub_250D3BF80();
            if (os_log_type_enabled(v55, v56))
            {
              uint64_t v57 = swift_slowAlloc();
              uint64_t v89 = swift_slowAlloc();
              aBlock[0] = v89;
              *(_DWORD *)uint64_t v57 = 136315650;
              swift_bridgeObjectRetain();
              id v101 = (id)sub_250D38FF4(a1, v6, aBlock);
              sub_250D3BFB0();
              swift_bridgeObjectRelease_n();
              *(_WORD *)(v57 + 12) = 2080;
              id v101 = objc_msgSend(v54, sel_voiceQualityVersion);
              sub_250D397BC();
              uint64_t v58 = sub_250D3BFD0();
              id v101 = (id)sub_250D38FF4(v58, v59, aBlock);
              sub_250D3BFB0();
              swift_bridgeObjectRelease();

              *(_WORD *)(v57 + 22) = 2080;
              id v101 = [(objc_class *)osloga[8].isa voiceQualityVersion];
              unint64_t v6 = v92;
              uint64_t v60 = sub_250D3BFD0();
              id v101 = (id)sub_250D38FF4(v60, v61, aBlock);
              sub_250D3BFB0();
              swift_bridgeObjectRelease();
              swift_release_n();
              _os_log_impl(&dword_250D2C000, v55, v56, "HeadphoneProxFeatureService: [%s] setProxCardShowedFeatures: Voice Quality: %s -> %s", (uint8_t *)v57, 0x20u);
              swift_arrayDestroy();
              uint64_t v5 = v93;
              MEMORY[0x253387320](v89, -1, -1);
              uint64_t v62 = v57;
              os_log_t v4 = osloga;
              MEMORY[0x253387320](v62, -1, -1);
            }
            else
            {
              swift_bridgeObjectRelease_n();

              swift_release_n();
            }

            uint64_t v30 = &selRef_voiceQualityVersion;
            uint64_t v31 = &selRef_setVoiceQualityVersion_;
            break;
          case 3:
            if (qword_26B205160 != -1) {
              swift_once();
            }
            __swift_project_value_buffer(v96, (uint64_t)qword_26B205168);
            swift_bridgeObjectRetain_n();
            id v63 = v28;
            swift_retain_n();
            id v64 = v63;
            os_log_t v65 = sub_250D3BE70();
            os_log_type_t v66 = sub_250D3BF80();
            if (os_log_type_enabled(v65, v66))
            {
              uint64_t v67 = swift_slowAlloc();
              uint64_t v90 = swift_slowAlloc();
              aBlock[0] = v90;
              *(_DWORD *)uint64_t v67 = 136315650;
              swift_bridgeObjectRetain();
              id v101 = (id)sub_250D38FF4(a1, v6, aBlock);
              sub_250D3BFB0();
              swift_bridgeObjectRelease_n();
              *(_WORD *)(v67 + 12) = 2080;
              id v101 = objc_msgSend(v64, sel_heartRateVersion);
              sub_250D397BC();
              uint64_t v68 = sub_250D3BFD0();
              id v101 = (id)sub_250D38FF4(v68, v69, aBlock);
              sub_250D3BFB0();
              swift_bridgeObjectRelease();

              *(_WORD *)(v67 + 22) = 2080;
              id v101 = [(objc_class *)osloga[8].isa heartRateVersion];
              unint64_t v6 = v92;
              uint64_t v70 = sub_250D3BFD0();
              id v101 = (id)sub_250D38FF4(v70, v71, aBlock);
              sub_250D3BFB0();
              swift_bridgeObjectRelease();
              swift_release_n();
              _os_log_impl(&dword_250D2C000, v65, v66, "HeadphoneProxFeatureService: [%s] setProxCardShowedFeatures: heartRateMonitor: %s -> %s", (uint8_t *)v67, 0x20u);
              swift_arrayDestroy();
              uint64_t v5 = v93;
              MEMORY[0x253387320](v90, -1, -1);
              uint64_t v72 = v67;
              os_log_t v4 = osloga;
              MEMORY[0x253387320](v72, -1, -1);
            }
            else
            {
              swift_bridgeObjectRelease_n();

              swift_release_n();
            }

            uint64_t v30 = &selRef_heartRateVersion;
            uint64_t v31 = &selRef_setHeartRateVersion_;
            break;
          case 4:
            if (qword_26B205160 != -1) {
              swift_once();
            }
            __swift_project_value_buffer(v96, (uint64_t)qword_26B205168);
            swift_bridgeObjectRetain_n();
            id v73 = v28;
            swift_retain_n();
            id v74 = v73;
            v75 = sub_250D3BE70();
            os_log_type_t v76 = sub_250D3BF80();
            if (os_log_type_enabled(v75, v76))
            {
              uint64_t v77 = swift_slowAlloc();
              uint64_t v91 = swift_slowAlloc();
              aBlock[0] = v91;
              *(_DWORD *)uint64_t v77 = 136315650;
              swift_bridgeObjectRetain();
              id v101 = (id)sub_250D38FF4(a1, v6, aBlock);
              sub_250D3BFB0();
              swift_bridgeObjectRelease_n();
              *(_WORD *)(v77 + 12) = 2080;
              id v101 = objc_msgSend(v74, sel_hearingAssistVersion);
              sub_250D397BC();
              uint64_t v78 = sub_250D3BFD0();
              id v101 = (id)sub_250D38FF4(v78, v79, aBlock);
              sub_250D3BFB0();
              swift_bridgeObjectRelease();

              *(_WORD *)(v77 + 22) = 2080;
              id v101 = [(objc_class *)osloga[8].isa hearingAssistVersion];
              unint64_t v6 = v92;
              uint64_t v80 = sub_250D3BFD0();
              id v101 = (id)sub_250D38FF4(v80, v81, aBlock);
              sub_250D3BFB0();
              swift_bridgeObjectRelease();
              swift_release_n();
              _os_log_impl(&dword_250D2C000, v75, v76, "HeadphoneProxFeatureService: [%s] setProxCardShowedFeatures: Yodel: %s -> %s", (uint8_t *)v77, 0x20u);
              swift_arrayDestroy();
              uint64_t v5 = v93;
              MEMORY[0x253387320](v91, -1, -1);
              uint64_t v82 = v77;
              os_log_t v4 = osloga;
              MEMORY[0x253387320](v82, -1, -1);
            }
            else
            {
              swift_bridgeObjectRelease_n();

              swift_release_n();
            }

            uint64_t v30 = &selRef_hearingAssistVersion;
            uint64_t v31 = &selRef_setHearingAssistVersion_;
            break;
          default:
            if (qword_26B205160 != -1) {
              swift_once();
            }
            __swift_project_value_buffer(v96, (uint64_t)qword_26B205168);
            swift_bridgeObjectRetain_n();
            id v33 = v28;
            swift_retain_n();
            id v34 = v33;
            v35 = sub_250D3BE70();
            os_log_type_t v36 = sub_250D3BF80();
            if (os_log_type_enabled(v35, v36))
            {
              uint64_t v37 = swift_slowAlloc();
              uint64_t v87 = swift_slowAlloc();
              aBlock[0] = v87;
              *(_DWORD *)uint64_t v37 = 136315650;
              swift_bridgeObjectRetain();
              id v101 = (id)sub_250D38FF4(a1, v6, aBlock);
              sub_250D3BFB0();
              swift_bridgeObjectRelease_n();
              *(_WORD *)(v37 + 12) = 2080;
              id v101 = objc_msgSend(v34, sel_whatsNewVersion);
              sub_250D397BC();
              uint64_t v38 = sub_250D3BFD0();
              id v101 = (id)sub_250D38FF4(v38, v39, aBlock);
              sub_250D3BFB0();
              swift_bridgeObjectRelease();

              *(_WORD *)(v37 + 22) = 2080;
              id v101 = [(objc_class *)osloga[8].isa whatsNewVersion];
              unint64_t v6 = v92;
              uint64_t v40 = sub_250D3BFD0();
              id v101 = (id)sub_250D38FF4(v40, v41, aBlock);
              sub_250D3BFB0();
              swift_bridgeObjectRelease();
              swift_release_n();
              _os_log_impl(&dword_250D2C000, v35, v36, "HeadphoneProxFeatureService: [%s] setProxCardShowedFeatures: Whats New: %s -> %s", (uint8_t *)v37, 0x20u);
              swift_arrayDestroy();
              uint64_t v5 = v93;
              MEMORY[0x253387320](v87, -1, -1);
              uint64_t v42 = v37;
              os_log_t v4 = osloga;
              MEMORY[0x253387320](v42, -1, -1);
            }
            else
            {
              swift_bridgeObjectRelease_n();

              swift_release_n();
            }

            uint64_t v30 = &selRef_whatsNewVersion;
            uint64_t v31 = &selRef_setWhatsNewVersion_;
            break;
        }
        id v28 = v95;
        objc_msgSend(v95, *v31, objc_msgSend(v4[8].isa, *v30, v86));
        ++v29;
      }
      while (v32 != v97);
      swift_bridgeObjectRelease();
      Class isa = v4[5].isa;
      uint64_t v84 = swift_allocObject();
      *(void *)(v84 + 16) = a1;
      *(void *)(v84 + 24) = v6;
      aBlock[4] = (uint64_t)sub_250D38A40;
      aBlock[5] = v84;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_250D30764;
      aBlock[3] = (uint64_t)&block_descriptor_16;
      v85 = _Block_copy(aBlock);
      swift_release();
      [(objc_class *)isa modifyAAProxCardsInfo:v95 completion:v85];
      _Block_release(v85);
    }
    else
    {
      if (v8 != -1) {
        swift_once();
      }
      uint64_t v21 = sub_250D3BE90();
      __swift_project_value_buffer(v21, (uint64_t)qword_26B205168);
      swift_bridgeObjectRetain();
      char v22 = sub_250D3BE70();
      os_log_type_t v23 = sub_250D3BF80();
      if (os_log_type_enabled(v22, v23))
      {
        uint64_t v24 = (uint8_t *)swift_slowAlloc();
        uint64_t v25 = swift_slowAlloc();
        aBlock[0] = v25;
        *(_DWORD *)uint64_t v24 = 136315138;
        swift_bridgeObjectRetain();
        id v101 = (id)sub_250D38FF4(a1, v6, aBlock);
        sub_250D3BFB0();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_250D2C000, v22, v23, "HeadphoneProxFeatureService: [%s] setProxCardShowedFeatures: Showed Feature Empty, Return", v24, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x253387320](v25, -1, -1);
        MEMORY[0x253387320](v24, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
    }
  }
  else
  {
    if (qword_26B205160 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_250D3BE90();
    __swift_project_value_buffer(v18, (uint64_t)qword_26B205168);
    oslog = sub_250D3BE70();
    os_log_type_t v19 = sub_250D3BF80();
    if (os_log_type_enabled(oslog, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl(&dword_250D2C000, oslog, v19, "HeadphoneProxFeatureService: setProxCardShowedFeatures: Invalid Device, Return", v20, 2u);
      MEMORY[0x253387320](v20, -1, -1);
    }
  }
}

BOOL sub_250D31B04(uint64_t a1, unint64_t a2)
{
  uint64_t v5 = sub_250D3BE90();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  id v9 = (char *)&v93 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v104 = v6;
  if (!a2) {
    goto LABEL_24;
  }
  v102 = (char *)&v93 - v10;
  uint64_t v11 = sub_250D3BF20();
  unint64_t v13 = v12;
  LOBYTE(v110[0]) = 4;
  swift_bridgeObjectRetain();
  uint64_t v101 = v11;
  uint64_t v14 = v2;
  id v15 = sub_250D37870(v11, v13, (unsigned __int8 *)v110);
  uint64_t v17 = v16;
  swift_bridgeObjectRelease();
  if (!v15)
  {
    swift_bridgeObjectRelease();
    uint64_t v6 = v104;
LABEL_24:
    if (qword_26B205160 != -1) {
      swift_once();
    }
    uint64_t v46 = __swift_project_value_buffer(v5, (uint64_t)qword_26B205168);
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, v46, v5);
    swift_bridgeObjectRetain_n();
    swift_retain_n();
    uint64_t v47 = sub_250D3BE70();
    os_log_type_t v48 = sub_250D3BF80();
    if (os_log_type_enabled(v47, v48))
    {
      uint64_t v49 = swift_slowAlloc();
      uint64_t v50 = swift_slowAlloc();
      v111[0] = v50;
      *(_DWORD *)uint64_t v49 = 136315394;
      if (a2)
      {
        unint64_t v51 = a2;
      }
      else
      {
        a1 = 4999502;
        unint64_t v51 = 0xE300000000000000;
      }
      uint64_t v103 = v5;
      swift_bridgeObjectRetain();
      v110[0] = sub_250D38FF4(a1, v51, v111);
      sub_250D3BFB0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v49 + 12) = 2080;
      swift_beginAccess();
      sub_250D3BC08(0, &qword_269B01C80);
      swift_bridgeObjectRetain();
      uint64_t v52 = sub_250D3BEE0();
      unint64_t v54 = v53;
      swift_bridgeObjectRelease();
      uint64_t v109 = sub_250D38FF4(v52, v54, v111);
      sub_250D3BFB0();
      swift_bridgeObjectRelease();
      swift_release_n();
      _os_log_impl(&dword_250D2C000, v47, v48, "HeadphoneProxFeatureService: shouldShowYodelCard: Invalid Device, Return false address: %s %s", (uint8_t *)v49, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x253387320](v50, -1, -1);
      MEMORY[0x253387320](v49, -1, -1);

      (*(void (**)(char *, uint64_t))(v104 + 8))(v9, v103);
    }
    else
    {
      swift_bridgeObjectRelease_n();
      swift_release_n();

      (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    }
    return 0;
  }
  unint64_t v99 = v13;
  long long v105 = xmmword_250D3C680;
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v15;
  *(void *)(v18 + 24) = v17;
  v106[0] = sub_250D3968C;
  v106[1] = v18;
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v15;
  *(void *)(v19 + 24) = v17;
  v106[2] = sub_250D396EC;
  v106[3] = v19;
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = v15;
  *(void *)(v20 + 24) = v17;
  v107 = sub_250D39700;
  uint64_t v108 = v20;
  id v21 = v15;
  id v22 = v17;
  id v23 = v21;
  id v24 = v22;
  id v25 = v23;
  id v98 = v24;
  swift_retain();
  unsigned int v26 = objc_msgSend(v25, sel_hearingProtectionCapability);
  uint64_t v103 = v5;
  if (v26 == 2 && objc_msgSend(v25, sel_hearingAidCapability) == 2)
  {
    v110[0] = MEMORY[0x263F8EE78];
    sub_250D3A25C(0, 1, 1);
    uint64_t v27 = v110[0];
    unint64_t v29 = *(void *)(v110[0] + 16);
    unint64_t v28 = *(void *)(v110[0] + 24);
    if (v29 >= v28 >> 1)
    {
      sub_250D3A25C(v28 > 1, v29 + 1, 1);
      uint64_t v27 = v110[0];
    }
    *(void *)(v27 + 16) = v29 + 1;
    uint64_t v30 = v27 + 16 * v29;
    *(void *)(v30 + 32) = sub_250D3968C;
    *(void *)(v30 + 40) = v18;
  }
  else
  {
    swift_release();
    uint64_t v27 = MEMORY[0x263F8EE78];
  }
  id v97 = v25;
  v100 = v106;
  uint64_t v31 = *(void **)(v19 + 16);
  uint64_t v32 = *(void **)(v19 + 24);
  swift_retain();
  if (objc_msgSend(v32, sel_hearingAssistRegionStatus) == 2
    && objc_msgSend(v31, sel_hearingAidCapability) == 2)
  {
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v110[0] = v27;
    uint64_t v34 = v14;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_250D3A25C(0, *(void *)(v27 + 16) + 1, 1);
      uint64_t v27 = v110[0];
    }
    v35 = v102;
    unint64_t v37 = *(void *)(v27 + 16);
    unint64_t v36 = *(void *)(v27 + 24);
    unint64_t v38 = v99;
    if (v37 >= v36 >> 1)
    {
      sub_250D3A25C(v36 > 1, v37 + 1, 1);
      uint64_t v27 = v110[0];
    }
    *(void *)(v27 + 16) = v37 + 1;
    uint64_t v39 = v27 + 16 * v37;
    *(void *)(v39 + 32) = sub_250D396EC;
    *(void *)(v39 + 40) = v19;
    uint64_t v40 = v107;
    uint64_t v20 = v108;
  }
  else
  {
    swift_release();
    uint64_t v40 = sub_250D39700;
    uint64_t v34 = v14;
    v35 = v102;
    unint64_t v38 = v99;
  }
  uint64_t v41 = swift_retain();
  ((void (*)(uint64_t *__return_ptr, uint64_t))v40)(v111, v41);
  if (LOBYTE(v111[0]) == 1)
  {
    char v42 = swift_isUniquelyReferenced_nonNull_native();
    v110[0] = v27;
    if ((v42 & 1) == 0)
    {
      sub_250D3A25C(0, *(void *)(v27 + 16) + 1, 1);
      uint64_t v27 = v110[0];
    }
    unint64_t v44 = *(void *)(v27 + 16);
    unint64_t v43 = *(void *)(v27 + 24);
    if (v44 >= v43 >> 1)
    {
      sub_250D3A25C(v43 > 1, v44 + 1, 1);
      uint64_t v27 = v110[0];
    }
    *(void *)(v27 + 16) = v44 + 1;
    uint64_t v45 = v27 + 16 * v44;
    *(void *)(v45 + 32) = v40;
    *(void *)(v45 + 40) = v20;
  }
  else
  {
    swift_release();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B01C88);
  swift_arrayDestroy();
  uint64_t v56 = *(void *)(v27 + 16);
  swift_release();
  uint64_t v57 = v103;
  if (!v56)
  {
    swift_bridgeObjectRelease();
    if (qword_26B205160 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v57, (uint64_t)qword_26B205168);
    swift_retain_n();
    os_log_type_t v76 = sub_250D3BE70();
    os_log_type_t v77 = sub_250D3BF80();
    if (os_log_type_enabled(v76, v77))
    {
      uint64_t v78 = (uint8_t *)swift_slowAlloc();
      uint64_t v79 = swift_slowAlloc();
      v111[0] = v79;
      *(_DWORD *)uint64_t v78 = 136315138;
      swift_beginAccess();
      sub_250D3BC08(0, &qword_269B01C80);
      swift_bridgeObjectRetain();
      uint64_t v80 = sub_250D3BEE0();
      unint64_t v82 = v81;
      swift_bridgeObjectRelease();
      uint64_t v109 = sub_250D38FF4(v80, v82, v111);
      sub_250D3BFB0();
      swift_bridgeObjectRelease();
      swift_release_n();
      _os_log_impl(&dword_250D2C000, v76, v77, "HeadphoneProxFeatureService: shouldShowYodelCard: device does not support Yodel, Return false %s", v78, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x253387320](v79, -1, -1);
      MEMORY[0x253387320](v78, -1, -1);
    }
    else
    {

      swift_release_n();
    }
    return 0;
  }
  id v58 = sub_250D36EE8(v101, v38);
  unint64_t v59 = objc_msgSend(v58, sel_hearingAssistVersion);
  v100 = objc_msgSend(*(id *)(v34 + 64), sel_hearingAssistVersion);
  if (qword_26B205160 != -1) {
    swift_once();
  }
  uint64_t v60 = __swift_project_value_buffer(v57, (uint64_t)qword_26B205168);
  uint64_t v61 = v104;
  (*(void (**)(char *, uint64_t, uint64_t))(v104 + 16))(v35, v60, v57);
  swift_bridgeObjectRetain_n();
  id v62 = v58;
  swift_retain_n();
  id v63 = v62;
  id v64 = v35;
  os_log_t v65 = sub_250D3BE70();
  os_log_type_t v66 = sub_250D3BF80();
  LODWORD(v99) = v66;
  if (os_log_type_enabled(v65, v66))
  {
    uint64_t v67 = swift_slowAlloc();
    uint64_t v95 = v60;
    uint64_t v68 = v67;
    uint64_t v94 = swift_slowAlloc();
    v110[0] = v94;
    *(_DWORD *)uint64_t v68 = 136315906;
    swift_bridgeObjectRetain();
    v111[0] = sub_250D38FF4(v101, v38, v110);
    sub_250D3BFB0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v68 + 12) = 2080;
    if (v59 >= v100) {
      uint64_t v69 = 20302;
    }
    else {
      uint64_t v69 = 5457241;
    }
    if (v59 >= v100) {
      unint64_t v70 = 0xE200000000000000;
    }
    else {
      unint64_t v70 = 0xE300000000000000;
    }
    uint64_t v96 = v59;
    v111[0] = sub_250D38FF4(v69, v70, v110);
    sub_250D3BFB0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v68 + 22) = 2080;
    v111[0] = (uint64_t)objc_msgSend(v63, sel_hearingAssistVersion);
    sub_250D397BC();
    uint64_t v71 = sub_250D3BFD0();
    v111[0] = sub_250D38FF4(v71, v72, v110);
    sub_250D3BFB0();
    swift_bridgeObjectRelease();

    *(_WORD *)(v68 + 32) = 2080;
    v111[0] = (uint64_t)objc_msgSend(*(id *)(v34 + 64), sel_hearingAssistVersion);
    unint64_t v59 = v96;
    uint64_t v73 = sub_250D3BFD0();
    v111[0] = sub_250D38FF4(v73, v74, v110);
    sub_250D3BFB0();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_250D2C000, v65, (os_log_type_t)v99, "HeadphoneProxFeatureService: [%s] shouldShowYodelCard: %s, Current Version: %s, Taget Version: %s", (uint8_t *)v68, 0x2Au);
    uint64_t v75 = v94;
    swift_arrayDestroy();
    MEMORY[0x253387320](v75, -1, -1);
    MEMORY[0x253387320](v68, -1, -1);

    (*(void (**)(char *, uint64_t))(v61 + 8))(v102, v103);
  }
  else
  {
    swift_bridgeObjectRelease_n();

    swift_release_n();
    (*(void (**)(char *, uint64_t))(v61 + 8))(v64, v57);
  }
  v83 = (__CFString *)sub_250D3BEF0();
  CFPreferencesAppSynchronize(v83);

  uint64_t v84 = (__CFString *)sub_250D3BEF0();
  v85 = (__CFString *)sub_250D3BEF0();
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(v84, v85, 0);

  if (AppBooleanValue)
  {
    swift_bridgeObjectRetain();
    uint64_t v87 = sub_250D3BE70();
    os_log_type_t v88 = sub_250D3BF80();
    if (os_log_type_enabled(v87, v88))
    {
      uint64_t v89 = (uint8_t *)swift_slowAlloc();
      uint64_t v90 = v63;
      uint64_t v91 = swift_slowAlloc();
      v110[0] = v91;
      *(_DWORD *)uint64_t v89 = 136315138;
      swift_bridgeObjectRetain();
      v111[0] = sub_250D38FF4(v101, v38, v110);
      sub_250D3BFB0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_250D2C000, v87, v88, "HeadphoneProxFeatureService: [%s] shouldShowYodelCard: Force Show!", v89, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x253387320](v91, -1, -1);
      MEMORY[0x253387320](v89, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
  else
  {

    swift_bridgeObjectRelease();
  }
  return v59 < v100 || AppBooleanValue != 0;
}

void sub_250D329F0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(void), uint64_t a7)
{
  uint64_t v8 = v7;
  swift_beginAccess();
  uint64_t v16 = *(void *)(v7 + 16);
  if (!*(void *)(v16 + 16))
  {
LABEL_7:
    if (qword_26B205160 != -1) {
      swift_once();
    }
    uint64_t v24 = sub_250D3BE90();
    __swift_project_value_buffer(v24, (uint64_t)qword_26B205168);
    swift_bridgeObjectRetain_n();
    swift_retain_n();
    id v25 = sub_250D3BE70();
    os_log_type_t v26 = sub_250D3BF80();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = swift_slowAlloc();
      uint64_t v32 = swift_slowAlloc();
      *(_DWORD *)uint64_t v27 = 136315394;
      aBlock[0] = v32;
      sub_250D3BC08(0, &qword_269B01C80);
      id v33 = a6;
      swift_bridgeObjectRetain();
      uint64_t v28 = sub_250D3BEE0();
      uint64_t v29 = a2;
      unint64_t v31 = v30;
      swift_bridgeObjectRelease();
      uint64_t v35 = sub_250D38FF4(v28, v31, aBlock);
      sub_250D3BFB0();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v27 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v35 = sub_250D38FF4(v29, a3, aBlock);
      a6 = v33;
      sub_250D3BFB0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_250D2C000, v25, v26, "HeadphoneProxFeatureService: setYodelConfig: Invalid Device, Return %s %s", (uint8_t *)v27, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x253387320](v32, -1, -1);
      MEMORY[0x253387320](v27, -1, -1);

      if (!v33) {
        return;
      }
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_release_n();
      if (!a6) {
        return;
      }
    }
    a6();
    return;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v17 = sub_250D39810(a2, a3);
  if ((v18 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  id v19 = *(id *)(*(void *)(v16 + 56) + 8 * v17);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v20 = *(id *)(v8 + 32);
  id v21 = objc_msgSend(v19, sel_identifier);
  if (!v21)
  {
    sub_250D3BF00();
    id v21 = (id)sub_250D3BEF0();
    swift_bridgeObjectRelease();
  }
  id v22 = (void *)swift_allocObject();
  v22[2] = a4;
  v22[3] = a5;
  v22[4] = a6;
  v22[5] = a7;
  aBlock[4] = (uint64_t)sub_250D3A280;
  aBlock[5] = (uint64_t)v22;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_250D30764;
  aBlock[3] = (uint64_t)&block_descriptor_31;
  id v23 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  sub_250D3A294((uint64_t)a6);
  swift_release();
  objc_msgSend(v20, sel_sendDeviceConfig_identifier_completion_, a1, v21, v23);
  _Block_release(v23);
}

void sub_250D32E14(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(void), uint64_t a7)
{
  uint64_t v8 = v7;
  swift_beginAccess();
  uint64_t v16 = *(void *)(v7 + 24);
  if (!*(void *)(v16 + 16))
  {
LABEL_7:
    if (qword_26B205160 != -1) {
      swift_once();
    }
    uint64_t v24 = sub_250D3BE90();
    __swift_project_value_buffer(v24, (uint64_t)qword_26B205168);
    swift_bridgeObjectRetain_n();
    swift_retain_n();
    id v25 = sub_250D3BE70();
    os_log_type_t v26 = sub_250D3BF80();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = swift_slowAlloc();
      uint64_t v28 = swift_slowAlloc();
      uint64_t v35 = v28;
      *(_DWORD *)uint64_t v27 = 136315394;
      swift_beginAccess();
      sub_250D3BC08(0, &qword_269B01C80);
      id v33 = a6;
      swift_bridgeObjectRetain();
      uint64_t v29 = sub_250D3BEE0();
      uint64_t v30 = a2;
      unint64_t v32 = v31;
      swift_bridgeObjectRelease();
      sub_250D38FF4(v29, v32, &v35);
      sub_250D3BFB0();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v27 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t aBlock[6] = sub_250D38FF4(v30, a3, &v35);
      a6 = v33;
      sub_250D3BFB0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_250D2C000, v25, v26, "HeadphoneProxFeatureService: updateRecord: Invalid Device, Return %s %s", (uint8_t *)v27, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x253387320](v28, -1, -1);
      MEMORY[0x253387320](v27, -1, -1);

      if (!v33) {
        return;
      }
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_release_n();
      if (!a6) {
        return;
      }
    }
    a6();
    return;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v17 = sub_250D39810(a2, a3);
  if ((v18 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  id v19 = *(id *)(*(void *)(v16 + 56) + 8 * v17);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v20 = *(id *)(v8 + 80);
  id v21 = objc_msgSend(v19, sel_bluetoothUUID);
  if (!v21)
  {
    sub_250D3BF00();
    id v21 = (id)sub_250D3BEF0();
    swift_bridgeObjectRelease();
  }
  id v22 = (void *)swift_allocObject();
  v22[2] = a4;
  v22[3] = a5;
  v22[4] = a6;
  v22[5] = a7;
  aBlock[4] = sub_250D3A2F0;
  aBlock[5] = v22;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_250D30764;
  aBlock[3] = &block_descriptor_37;
  id v23 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  sub_250D3A294((uint64_t)a6);
  swift_release();
  objc_msgSend(v20, sel_modifyDeviceConfig_identifier_completion_, a1, v21, v23);
  _Block_release(v23);
}

BOOL sub_250D33250(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_250D3BE90();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v66 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  unint64_t v12 = (char *)&v66 - v11;
  if (!a2) {
    goto LABEL_18;
  }
  uint64_t v13 = sub_250D3BF20();
  unint64_t v15 = v14;
  swift_beginAccess();
  uint64_t v16 = *(void *)(v2 + 16);
  if (!*(void *)(v16 + 16))
  {
LABEL_17:
    swift_bridgeObjectRelease();
LABEL_18:
    if (qword_26B205160 != -1) {
      swift_once();
    }
    uint64_t v38 = __swift_project_value_buffer(v6, (uint64_t)qword_26B205168);
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v38, v6);
    swift_bridgeObjectRetain_n();
    swift_retain_n();
    uint64_t v39 = sub_250D3BE70();
    os_log_type_t v40 = sub_250D3BF80();
    if (os_log_type_enabled(v39, v40))
    {
      uint64_t v41 = swift_slowAlloc();
      id v42 = (id)swift_slowAlloc();
      uint64_t v75 = v7;
      id v43 = v42;
      id v78 = v42;
      *(_DWORD *)uint64_t v41 = 136315394;
      if (a2)
      {
        unint64_t v44 = a2;
      }
      else
      {
        a1 = 4999502;
        unint64_t v44 = 0xE300000000000000;
      }
      uint64_t v74 = v6;
      swift_bridgeObjectRetain();
      v77[0] = sub_250D38FF4(a1, v44, (uint64_t *)&v78);
      sub_250D3BFB0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v41 + 12) = 2080;
      swift_beginAccess();
      sub_250D3BC08(0, &qword_269B01C80);
      swift_bridgeObjectRetain();
      uint64_t v45 = sub_250D3BEE0();
      unint64_t v47 = v46;
      swift_bridgeObjectRelease();
      uint64_t v76 = sub_250D38FF4(v45, v47, (uint64_t *)&v78);
      sub_250D3BFB0();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_250D2C000, v39, v40, "HeadphoneProxFeatureService: shouldShowHeadGesturesCard: Invalid Device, Return false address: %s %s", (uint8_t *)v41, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x253387320](v43, -1, -1);
      MEMORY[0x253387320](v41, -1, -1);

      (*(void (**)(char *, uint64_t))(v75 + 8))(v10, v74);
    }
    else
    {

      swift_release_n();
      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    }
    return 0;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v17 = sub_250D39810(v13, v15);
  if ((v18 & 1) == 0)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_17;
  }
  id v19 = *(id *)(*(void *)(v16 + 56) + 8 * v17);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (objc_msgSend(v19, sel_bobbleCapability) != 2)
  {
    swift_bridgeObjectRelease();
    if (qword_26B205160 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v6, (uint64_t)qword_26B205168);
    swift_retain_n();
    uint64_t v49 = sub_250D3BE70();
    os_log_type_t v50 = sub_250D3BF80();
    if (os_log_type_enabled(v49, v50))
    {
      unint64_t v51 = (uint8_t *)swift_slowAlloc();
      uint64_t v52 = swift_slowAlloc();
      v77[0] = v52;
      id v71 = v19;
      *(_DWORD *)unint64_t v51 = 136315138;
      sub_250D3BC08(0, &qword_269B01C80);
      swift_bridgeObjectRetain();
      uint64_t v53 = sub_250D3BEE0();
      unint64_t v55 = v54;
      swift_bridgeObjectRelease();
      id v78 = (id)sub_250D38FF4(v53, v55, v77);
      sub_250D3BFB0();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_250D2C000, v49, v50, "HeadphoneProxFeatureService: shouldShowHeadGesturesCard: device does not support head gesture, Return false %s", v51, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x253387320](v52, -1, -1);
      MEMORY[0x253387320](v51, -1, -1);
    }
    else
    {

      swift_release_n();
    }
    return 0;
  }
  id v20 = sub_250D36EE8(v13, v15);
  id v73 = objc_msgSend(v20, sel_headGesturesVersion);
  id v72 = objc_msgSend(*(id *)(v3 + 64), sel_headGesturesVersion);
  if (qword_26B205160 != -1) {
    swift_once();
  }
  uint64_t v21 = __swift_project_value_buffer(v6, (uint64_t)qword_26B205168);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v12, v21, v6);
  swift_bridgeObjectRetain_n();
  id v22 = v20;
  swift_retain_n();
  id v23 = v22;
  uint64_t v24 = sub_250D3BE70();
  os_log_type_t v25 = sub_250D3BF80();
  int v69 = v25;
  BOOL v26 = os_log_type_enabled(v24, v25);
  id v70 = v23;
  if (v26)
  {
    uint64_t v27 = swift_slowAlloc();
    id v71 = v19;
    uint64_t v28 = v27;
    uint64_t v67 = swift_slowAlloc();
    v77[0] = v67;
    *(_DWORD *)uint64_t v28 = 136315906;
    os_log_t v66 = v24;
    swift_bridgeObjectRetain();
    id v78 = (id)sub_250D38FF4(v13, v15, v77);
    uint64_t v75 = v7;
    sub_250D3BFB0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v28 + 12) = 2080;
    if (v73 >= v72) {
      uint64_t v29 = 20302;
    }
    else {
      uint64_t v29 = 5457241;
    }
    if (v73 >= v72) {
      unint64_t v30 = 0xE200000000000000;
    }
    else {
      unint64_t v30 = 0xE300000000000000;
    }
    uint64_t v68 = v21;
    id v78 = (id)sub_250D38FF4(v29, v30, v77);
    sub_250D3BFB0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v28 + 22) = 2080;
    id v78 = objc_msgSend(v23, sel_headGesturesVersion);
    sub_250D397BC();
    uint64_t v74 = v6;
    uint64_t v31 = sub_250D3BFD0();
    id v78 = (id)sub_250D38FF4(v31, v32, v77);
    sub_250D3BFB0();

    swift_bridgeObjectRelease();
    *(_WORD *)(v28 + 32) = 2080;
    id v78 = objc_msgSend(*(id *)(v3 + 64), sel_headGesturesVersion);
    uint64_t v33 = sub_250D3BFD0();
    id v78 = (id)sub_250D38FF4(v33, v34, v77);
    sub_250D3BFB0();
    swift_release_n();
    swift_bridgeObjectRelease();
    os_log_t v35 = v66;
    _os_log_impl(&dword_250D2C000, v66, (os_log_type_t)v69, "HeadphoneProxFeatureService: [%s] shouldShowHeadGesturesCard: %s, Current Version: %s, Taget Version: %s", (uint8_t *)v28, 0x2Au);
    uint64_t v36 = v67;
    swift_arrayDestroy();
    MEMORY[0x253387320](v36, -1, -1);
    uint64_t v37 = v28;
    id v19 = v71;
    MEMORY[0x253387320](v37, -1, -1);

    (*(void (**)(char *, uint64_t))(v75 + 8))(v12, v74);
  }
  else
  {

    swift_release_n();
    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
  }
  uint64_t v56 = (__CFString *)sub_250D3BEF0();
  CFPreferencesAppSynchronize(v56);

  uint64_t v57 = (__CFString *)sub_250D3BEF0();
  id v58 = (__CFString *)sub_250D3BEF0();
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(v57, v58, 0);

  if (!AppBooleanValue)
  {
    swift_bridgeObjectRelease();

LABEL_38:
    return v73 < v72 || AppBooleanValue != 0;
  }
  swift_bridgeObjectRetain();
  uint64_t v60 = sub_250D3BE70();
  os_log_type_t v61 = sub_250D3BF80();
  if (!os_log_type_enabled(v60, v61))
  {

    swift_bridgeObjectRelease_n();
    goto LABEL_38;
  }
  id v62 = (uint8_t *)swift_slowAlloc();
  id v63 = v19;
  uint64_t v64 = swift_slowAlloc();
  v77[0] = v64;
  *(_DWORD *)id v62 = 136315138;
  swift_bridgeObjectRetain();
  id v78 = (id)sub_250D38FF4(v13, v15, v77);
  sub_250D3BFB0();
  swift_bridgeObjectRelease_n();
  _os_log_impl(&dword_250D2C000, v60, v61, "HeadphoneProxFeatureService: [%s] shouldShowHeadGesturesCard: Force Show!", v62, 0xCu);
  swift_arrayDestroy();
  MEMORY[0x253387320](v64, -1, -1);
  MEMORY[0x253387320](v62, -1, -1);

  return v73 < v72 || AppBooleanValue != 0;
}

void sub_250D33DA4(uint64_t a1, unint64_t a2, int a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_250D3BE90();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  unint64_t v12 = (char *)&v49 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  unint64_t v14 = (char *)&v49 - v13;
  if (a2)
  {
    LODWORD(v53) = a3;
    uint64_t v15 = a1;
    uint64_t v16 = sub_250D3BF20();
    unint64_t v18 = v17;
    swift_beginAccess();
    uint64_t v19 = *(void *)(v4 + 16);
    if (*(void *)(v19 + 16))
    {
      swift_bridgeObjectRetain();
      unint64_t v20 = sub_250D39810(v16, v18);
      if (v21)
      {
        uint64_t v52 = v4;
        id v22 = (void (**)(char *, void))*(id *)(*(void *)(v19 + 56) + 8 * v20);
        swift_bridgeObjectRelease();
        if (qword_26B205160 != -1) {
          swift_once();
        }
        uint64_t v23 = __swift_project_value_buffer(v8, (uint64_t)qword_26B205168);
        (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v14, v23, v8);
        swift_bridgeObjectRetain();
        uint64_t v24 = sub_250D3BE70();
        os_log_type_t v25 = sub_250D3BF80();
        BOOL v26 = os_log_type_enabled(v24, v25);
        char v27 = v53;
        if (v26)
        {
          uint64_t v28 = swift_slowAlloc();
          unint64_t v51 = v22;
          uint64_t v29 = v28;
          uint64_t v50 = swift_slowAlloc();
          aBlock[0] = v50;
          *(_DWORD *)uint64_t v29 = 136315394;
          swift_bridgeObjectRetain();
          uint64_t v56 = sub_250D38FF4(v16, v18, aBlock);
          sub_250D3BFB0();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v29 + 12) = 2080;
          if (v27) {
            uint64_t v30 = 0x64656C62616E45;
          }
          else {
            uint64_t v30 = 0x64656C6261736944;
          }
          if (v27) {
            unint64_t v31 = 0xE700000000000000;
          }
          else {
            unint64_t v31 = 0xE800000000000000;
          }
          uint64_t v56 = sub_250D38FF4(v30, v31, aBlock);
          sub_250D3BFB0();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_250D2C000, v24, v25, "HeadphoneProxFeatureService: [%s] setHeadGesturesConfig: %s", (uint8_t *)v29, 0x16u);
          uint64_t v32 = v50;
          swift_arrayDestroy();
          MEMORY[0x253387320](v32, -1, -1);
          uint64_t v33 = v29;
          id v22 = v51;
          MEMORY[0x253387320](v33, -1, -1);
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
        uint64_t v44 = v52;
        if (v27)
        {
          id v45 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F28938]), sel_init);
          objc_msgSend(v45, sel_setHeadGestureToggle_, 1);
          id v46 = *(id *)(v44 + 32);
          id v47 = objc_msgSend(v22, sel_identifier);
          if (!v47)
          {
            sub_250D3BF00();
            id v47 = (id)sub_250D3BEF0();
            swift_bridgeObjectRelease();
          }
          aBlock[4] = (uint64_t)sub_250D344F0;
          aBlock[5] = 0;
          aBlock[0] = MEMORY[0x263EF8330];
          aBlock[1] = 1107296256;
          aBlock[2] = (uint64_t)sub_250D30764;
          aBlock[3] = (uint64_t)&block_descriptor_40;
          os_log_type_t v48 = _Block_copy(aBlock);
          objc_msgSend(v46, sel_sendDeviceConfig_identifier_completion_, v45, v47, v48);
          _Block_release(v48);
        }
        else
        {
        }
        return;
      }
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    a1 = v15;
  }
  if (qword_26B205160 != -1) {
    swift_once();
  }
  uint64_t v34 = __swift_project_value_buffer(v8, (uint64_t)qword_26B205168);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, v34, v8);
  swift_bridgeObjectRetain_n();
  swift_retain_n();
  os_log_t v35 = sub_250D3BE70();
  os_log_type_t v36 = sub_250D3BF80();
  if (os_log_type_enabled(v35, v36))
  {
    uint64_t v37 = swift_slowAlloc();
    uint64_t v52 = swift_slowAlloc();
    uint64_t v56 = v52;
    *(_DWORD *)uint64_t v37 = 136315394;
    uint64_t v50 = v37 + 4;
    swift_beginAccess();
    sub_250D3BC08(0, &qword_269B01C80);
    uint64_t v53 = v8;
    swift_bridgeObjectRetain();
    uint64_t v38 = sub_250D3BEE0();
    unint64_t v51 = (void (**)(char *, void))v9;
    unint64_t v40 = v39;
    swift_bridgeObjectRelease();
    uint64_t v55 = sub_250D38FF4(v38, v40, &v56);
    sub_250D3BFB0();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v37 + 12) = 2080;
    if (a2) {
      uint64_t v41 = a1;
    }
    else {
      uint64_t v41 = 4999502;
    }
    if (a2) {
      unint64_t v42 = a2;
    }
    else {
      unint64_t v42 = 0xE300000000000000;
    }
    swift_bridgeObjectRetain();
    uint64_t v55 = sub_250D38FF4(v41, v42, &v56);
    sub_250D3BFB0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_250D2C000, v35, v36, "HeadphoneProxFeatureService: setHeadGesturesConfig: Invalid Device, Return %s %s", (uint8_t *)v37, 0x16u);
    uint64_t v43 = v52;
    swift_arrayDestroy();
    MEMORY[0x253387320](v43, -1, -1);
    MEMORY[0x253387320](v37, -1, -1);

    v51[1](v12, v53);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_release_n();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  }
}

void sub_250D344F0(void *a1)
{
  if (a1)
  {
    id v2 = a1;
    if (qword_26B205160 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_250D3BE90();
    __swift_project_value_buffer(v3, (uint64_t)qword_26B205168);
    id v4 = a1;
    id v5 = a1;
    oslog = sub_250D3BE70();
    os_log_type_t v6 = sub_250D3BF70();
    if (os_log_type_enabled(oslog, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v8 = swift_slowAlloc();
      uint64_t v16 = v8;
      *(_DWORD *)uint64_t v7 = 136315138;
      id v9 = a1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_269B01CC0);
      uint64_t v10 = sub_250D3BF10();
      sub_250D38FF4(v10, v11, &v16);
      sub_250D3BFB0();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_250D2C000, oslog, v6, "HeadphoneProxFeatureService:  Failed to update AAD Device Config for Bobble, Error: %s ", v7, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x253387320](v8, -1, -1);
      MEMORY[0x253387320](v7, -1, -1);

      return;
    }
  }
  else
  {
    if (qword_26B205160 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_250D3BE90();
    __swift_project_value_buffer(v12, (uint64_t)qword_26B205168);
    oslog = sub_250D3BE70();
    os_log_type_t v13 = sub_250D3BF80();
    if (os_log_type_enabled(oslog, v13))
    {
      unint64_t v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v14 = 0;
      _os_log_impl(&dword_250D2C000, oslog, v13, "HeadphoneProxFeatureService: Successfully Updated AAD Device Config for Bobble", v14, 2u);
      MEMORY[0x253387320](v14, -1, -1);
    }
  }
}

uint64_t sub_250D347B4(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_250D3BE90();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v66 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v66 - v11;
  if (a2)
  {
    uint64_t v13 = sub_250D3BF20();
    unint64_t v15 = v14;
    swift_beginAccess();
    uint64_t v16 = *(void *)(v2 + 16);
    if (*(void *)(v16 + 16))
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v17 = sub_250D39810(v13, v15);
      if (v18)
      {
        id v71 = *(id *)(*(void *)(v16 + 56) + 8 * v17);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        id v19 = sub_250D36EE8(v13, v15);
        unint64_t v20 = (unint64_t)objc_msgSend(v19, sel_whatsNewVersion);
        BOOL v21 = v20 < (unint64_t)objc_msgSend(*(id *)(v3 + 64), sel_whatsNewVersion);
        swift_bridgeObjectRetain();
        BOOL v22 = sub_250D33250(v13, v15);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        LODWORD(v20) = sub_250D31B04(v13, v15);
        swift_bridgeObjectRelease();
        int v23 = v22 | v20;
        if (qword_26B205160 != -1) {
          swift_once();
        }
        unsigned int v24 = v21 & v23;
        uint64_t v25 = __swift_project_value_buffer(v6, (uint64_t)qword_26B205168);
        BOOL v26 = *(void (**)(char *))(v7 + 16);
        uint64_t v70 = v25;
        v26(v12);
        id v27 = v19;
        swift_retain_n();
        id v28 = v27;
        swift_bridgeObjectRetain_n();
        id v29 = v28;
        uint64_t v30 = sub_250D3BE70();
        os_log_type_t v31 = sub_250D3BF80();
        int v32 = v31;
        if (os_log_type_enabled(v30, v31))
        {
          uint64_t v33 = swift_slowAlloc();
          int v67 = v32;
          uint64_t v34 = v33;
          uint64_t v68 = swift_slowAlloc();
          v75[0] = v68;
          *(_DWORD *)uint64_t v34 = 136316418;
          os_log_t v66 = v30;
          swift_bridgeObjectRetain();
          id v76 = (id)sub_250D38FF4(v13, v15, v75);
          uint64_t v73 = v7;
          sub_250D3BFB0();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v34 + 12) = 2080;
          if (v24) {
            uint64_t v35 = 5457241;
          }
          else {
            uint64_t v35 = 20302;
          }
          if (v24) {
            unint64_t v36 = 0xE300000000000000;
          }
          else {
            unint64_t v36 = 0xE200000000000000;
          }
          unsigned int v69 = v24;
          id v76 = (id)sub_250D38FF4(v35, v36, v75);
          sub_250D3BFB0();
          swift_bridgeObjectRelease();
          *(_WORD *)(v34 + 22) = 2080;
          id v76 = objc_msgSend(v29, sel_whatsNewVersion);
          sub_250D397BC();
          uint64_t v72 = v6;
          uint64_t v37 = sub_250D3BFD0();
          id v76 = (id)sub_250D38FF4(v37, v38, v75);
          sub_250D3BFB0();

          swift_bridgeObjectRelease();
          *(_WORD *)(v34 + 32) = 2080;
          id v76 = objc_msgSend(*(id *)(v3 + 64), sel_whatsNewVersion);
          uint64_t v39 = sub_250D3BFD0();
          id v76 = (id)sub_250D38FF4(v39, v40, v75);
          sub_250D3BFB0();
          swift_release_n();
          swift_bridgeObjectRelease();
          *(_WORD *)(v34 + 42) = 2080;
          id v76 = objc_msgSend(v29, sel_headGesturesVersion);
          uint64_t v41 = sub_250D3BFD0();
          id v76 = (id)sub_250D38FF4(v41, v42, v75);
          sub_250D3BFB0();

          swift_bridgeObjectRelease();
          *(_WORD *)(v34 + 52) = 2080;
          id v76 = objc_msgSend(*(id *)(v3 + 64), sel_headGesturesVersion);
          uint64_t v43 = sub_250D3BFD0();
          id v76 = (id)sub_250D38FF4(v43, v44, v75);
          unsigned int v24 = v69;
          sub_250D3BFB0();
          swift_release_n();
          swift_bridgeObjectRelease();
          os_log_t v45 = v66;
          _os_log_impl(&dword_250D2C000, v66, (os_log_type_t)v67, "HeadphoneProxFeatureService: [%s] shouldShowWhatsNewCard: %s, WN Current: %s, WN Taget: %s | HG Current: %s, HG Taget: %s", (uint8_t *)v34, 0x3Eu);
          uint64_t v46 = v68;
          swift_arrayDestroy();
          MEMORY[0x253387320](v46, -1, -1);
          MEMORY[0x253387320](v34, -1, -1);

          (*(void (**)(char *, uint64_t))(v73 + 8))(v12, v72);
        }
        else
        {

          swift_release_n();
          swift_bridgeObjectRelease_n();
          (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
        }
        id v58 = (__CFString *)sub_250D3BEF0();
        CFPreferencesAppSynchronize(v58);

        unint64_t v59 = (__CFString *)sub_250D3BEF0();
        uint64_t v60 = (__CFString *)sub_250D3BEF0();
        int AppBooleanValue = CFPreferencesGetAppBooleanValue(v59, v60, 0);

        if (AppBooleanValue)
        {
          swift_bridgeObjectRetain();
          id v62 = sub_250D3BE70();
          os_log_type_t v63 = sub_250D3BF80();
          if (os_log_type_enabled(v62, v63))
          {
            unsigned int v69 = v24;
            uint64_t v64 = (uint8_t *)swift_slowAlloc();
            uint64_t v65 = swift_slowAlloc();
            v75[0] = v65;
            *(_DWORD *)uint64_t v64 = 136315138;
            swift_bridgeObjectRetain();
            id v76 = (id)sub_250D38FF4(v13, v15, v75);
            unsigned int v24 = v69;
            sub_250D3BFB0();
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_250D2C000, v62, v63, "HeadphoneProxFeatureService: [%s] shouldShowWhatsNewCard: Force Show!", v64, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x253387320](v65, -1, -1);
            MEMORY[0x253387320](v64, -1, -1);

            goto LABEL_36;
          }

          swift_bridgeObjectRelease_n();
        }
        else
        {
          swift_bridgeObjectRelease();
        }
LABEL_36:
        if (AppBooleanValue) {
          return 1;
        }
        else {
          return v24;
        }
      }
      swift_bridgeObjectRelease_n();
    }
    swift_bridgeObjectRelease();
  }
  if (qword_26B205160 != -1) {
    swift_once();
  }
  uint64_t v47 = __swift_project_value_buffer(v6, (uint64_t)qword_26B205168);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v47, v6);
  swift_bridgeObjectRetain_n();
  swift_retain_n();
  os_log_type_t v48 = sub_250D3BE70();
  os_log_type_t v49 = sub_250D3BF80();
  if (os_log_type_enabled(v48, v49))
  {
    uint64_t v50 = swift_slowAlloc();
    id v71 = (id)swift_slowAlloc();
    id v76 = v71;
    *(_DWORD *)uint64_t v50 = 136315394;
    uint64_t v70 = v50 + 4;
    swift_beginAccess();
    uint64_t v72 = v6;
    sub_250D3BC08(0, &qword_269B01C80);
    uint64_t v73 = v7;
    swift_bridgeObjectRetain();
    uint64_t v51 = sub_250D3BEE0();
    unint64_t v53 = v52;
    swift_bridgeObjectRelease();
    uint64_t v74 = sub_250D38FF4(v51, v53, (uint64_t *)&v76);
    sub_250D3BFB0();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v50 + 12) = 2080;
    if (a2) {
      uint64_t v54 = a1;
    }
    else {
      uint64_t v54 = 4999502;
    }
    if (a2) {
      unint64_t v55 = a2;
    }
    else {
      unint64_t v55 = 0xE300000000000000;
    }
    swift_bridgeObjectRetain();
    uint64_t v74 = sub_250D38FF4(v54, v55, (uint64_t *)&v76);
    sub_250D3BFB0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_250D2C000, v48, v49, "HeadphoneProxFeatureService: shouldShowWhatsNewCard: Invalid Device, Return %s %s", (uint8_t *)v50, 0x16u);
    id v56 = v71;
    swift_arrayDestroy();
    MEMORY[0x253387320](v56, -1, -1);
    MEMORY[0x253387320](v50, -1, -1);

    (*(void (**)(char *, uint64_t))(v73 + 8))(v10, v72);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_release_n();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  return 0;
}

BOOL sub_250D3526C(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  v80[1] = *MEMORY[0x263EF8340];
  uint64_t v6 = sub_250D3BE90();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v69 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v69 - v11;
  if (!a2) {
    goto LABEL_21;
  }
  uint64_t v13 = sub_250D3BF20();
  unint64_t v15 = v14;
  swift_beginAccess();
  uint64_t v16 = *(void *)(v2 + 16);
  if (!*(void *)(v16 + 16))
  {
LABEL_20:
    swift_bridgeObjectRelease();
LABEL_21:
    if (qword_26B205160 != -1) {
      swift_once();
    }
    uint64_t v44 = __swift_project_value_buffer(v6, (uint64_t)qword_26B205168);
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v44, v6);
    swift_bridgeObjectRetain_n();
    swift_retain_n();
    os_log_t v45 = sub_250D3BE70();
    os_log_type_t v46 = sub_250D3BF80();
    if (os_log_type_enabled(v45, v46))
    {
      uint64_t v47 = swift_slowAlloc();
      uint64_t v75 = (void *)swift_slowAlloc();
      v80[0] = (uint64_t)v75;
      *(_DWORD *)uint64_t v47 = 136315394;
      id v74 = (id)(v47 + 4);
      swift_beginAccess();
      id v76 = (id)v6;
      sub_250D3BC08(0, &qword_269B01C80);
      uint64_t v77 = v7;
      swift_bridgeObjectRetain();
      uint64_t v48 = sub_250D3BEE0();
      uint64_t v49 = a1;
      unint64_t v51 = v50;
      swift_bridgeObjectRelease();
      uint64_t v78 = sub_250D38FF4(v48, v51, v80);
      sub_250D3BFB0();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v47 + 12) = 2080;
      if (a2) {
        uint64_t v52 = v49;
      }
      else {
        uint64_t v52 = 4999502;
      }
      if (a2) {
        unint64_t v53 = a2;
      }
      else {
        unint64_t v53 = 0xE300000000000000;
      }
      swift_bridgeObjectRetain();
      uint64_t v78 = sub_250D38FF4(v52, v53, v80);
      sub_250D3BFB0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_250D2C000, v45, v46, "HeadphoneProxFeatureService: shouldShowHeartRateMonitor: Invalid Device, Return %s %s", (uint8_t *)v47, 0x16u);
      uint64_t v54 = v75;
      swift_arrayDestroy();
      MEMORY[0x253387320](v54, -1, -1);
      MEMORY[0x253387320](v47, -1, -1);

      (*(void (**)(char *, id))(v77 + 8))(v10, v76);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_release_n();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    }
    return 0;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v17 = sub_250D39810(v13, v15);
  if ((v18 & 1) == 0)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_20;
  }
  id v19 = *(id *)(*(void *)(v16 + 56) + 8 * v17);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v20 = v19;
  if ((objc_msgSend(v20, sel_respondsToSelector_, sel_coreBluetoothDevice) & 1) == 0
    || (objc_msgSend(v20, sel_respondsToSelector_, sel_coreBluetoothDevice) & 1) == 0)
  {
    swift_bridgeObjectRelease();

    goto LABEL_35;
  }
  id v21 = objc_msgSend(v20, sel_coreBluetoothDevice);

  if (!v21)
  {
LABEL_47:
    swift_bridgeObjectRelease();
LABEL_35:
    if (qword_26B205160 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v6, (uint64_t)qword_26B205168);
    id v56 = v20;
    swift_retain_n();
    id v57 = v56;
    id v58 = sub_250D3BE70();
    int v59 = sub_250D3BF80();
    if (!os_log_type_enabled(v58, (os_log_type_t)v59))
    {

      swift_release_n();
      return 0;
    }
    LODWORD(v76) = v59;
    uint64_t v60 = swift_slowAlloc();
    uint64_t v75 = (void *)swift_slowAlloc();
    uint64_t v77 = swift_slowAlloc();
    v79[0] = v77;
    *(_DWORD *)uint64_t v60 = 136315394;
    sub_250D3BC08(0, &qword_269B01C80);
    swift_bridgeObjectRetain();
    uint64_t v61 = sub_250D3BEE0();
    unint64_t v63 = v62;
    swift_bridgeObjectRelease();
    v80[0] = sub_250D38FF4(v61, v63, v79);
    sub_250D3BFB0();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v60 + 12) = 2112;
    id v64 = v57;
    if (objc_msgSend(v64, sel_respondsToSelector_, sel_coreBluetoothDevice)
      && (objc_msgSend(v64, sel_respondsToSelector_, 0x26535868EuLL) & 1) != 0)
    {
      id v65 = [v64 (SEL)0x26535868ELL];

      if (v65)
      {
        v80[0] = (uint64_t)v65;
        sub_250D3BFB0();
LABEL_45:
        os_log_t v66 = v75;
        void *v75 = v65;

        _os_log_impl(&dword_250D2C000, v58, (os_log_type_t)v76, "HeadphoneProxFeatureService: shouldShowWhatsNewCard: device does not support head gesture, Return false %s cbDevice: %@", (uint8_t *)v60, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B205130);
        swift_arrayDestroy();
        MEMORY[0x253387320](v66, -1, -1);
        uint64_t v67 = v77;
        swift_arrayDestroy();
        MEMORY[0x253387320](v67, -1, -1);
        MEMORY[0x253387320](v60, -1, -1);

        return 0;
      }
    }
    else
    {
    }
    v80[0] = 0;
    sub_250D3BFB0();
    id v65 = 0;
    goto LABEL_45;
  }
  if (objc_msgSend(v21, sel_productID) != 8221)
  {

    goto LABEL_47;
  }
  uint64_t v75 = v21;
  id v22 = sub_250D36EE8(v13, v15);
  id v23 = objc_msgSend(v22, sel_heartRateVersion);
  id v24 = objc_msgSend(*(id *)(v3 + 64), sel_heartRateVersion);
  id v76 = v23;
  id v72 = v24;
  BOOL v25 = v23 < v24;
  if (qword_26B205160 != -1) {
    swift_once();
  }
  uint64_t v26 = __swift_project_value_buffer(v6, (uint64_t)qword_26B205168);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v12, v26, v6);
  id v27 = v22;
  swift_retain_n();
  swift_bridgeObjectRetain();
  id v74 = v27;
  id v28 = sub_250D3BE70();
  os_log_type_t v29 = sub_250D3BF80();
  int v73 = v29;
  BOOL v30 = os_log_type_enabled(v28, v29);
  id v31 = v75;
  if (v30)
  {
    uint64_t v32 = swift_slowAlloc();
    uint64_t v77 = v7;
    uint64_t v33 = v32;
    uint64_t v71 = swift_slowAlloc();
    v79[0] = v71;
    *(_DWORD *)uint64_t v33 = 136315906;
    os_log_t v70 = v28;
    swift_bridgeObjectRetain();
    v80[0] = sub_250D38FF4(v13, v15, v79);
    sub_250D3BFB0();
    swift_bridgeObjectRelease_n();
    uint64_t v34 = v3;
    *(_WORD *)(v33 + 12) = 2080;
    if (v76 >= v72) {
      uint64_t v35 = 20302;
    }
    else {
      uint64_t v35 = 5457241;
    }
    if (v76 >= v72) {
      unint64_t v36 = 0xE200000000000000;
    }
    else {
      unint64_t v36 = 0xE300000000000000;
    }
    v80[0] = sub_250D38FF4(v35, v36, v79);
    sub_250D3BFB0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v33 + 22) = 2080;
    id v37 = v74;
    v80[0] = (uint64_t)objc_msgSend(v74, sel_heartRateVersion);
    sub_250D397BC();
    id v76 = (id)v6;
    uint64_t v38 = sub_250D3BFD0();
    v80[0] = sub_250D38FF4(v38, v39, v79);
    sub_250D3BFB0();

    swift_bridgeObjectRelease();
    *(_WORD *)(v33 + 32) = 2080;
    v80[0] = (uint64_t)objc_msgSend(*(id *)(v34 + 64), sel_heartRateVersion);
    uint64_t v40 = sub_250D3BFD0();
    v80[0] = sub_250D38FF4(v40, v41, v79);
    sub_250D3BFB0();
    swift_release_n();
    swift_bridgeObjectRelease();
    os_log_t v42 = v70;
    _os_log_impl(&dword_250D2C000, v70, (os_log_type_t)v73, "HeadphoneProxFeatureService: [%s] shouldShowHeartRateMonitor: %s, Current Version: %s, Taget Version: %s", (uint8_t *)v33, 0x2Au);
    uint64_t v43 = v71;
    swift_arrayDestroy();
    MEMORY[0x253387320](v43, -1, -1);
    MEMORY[0x253387320](v33, -1, -1);

    (*(void (**)(char *, id))(v77 + 8))(v12, v76);
  }
  else
  {

    swift_release_n();
    swift_bridgeObjectRelease_n();
    id v68 = v74;

    (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
  }
  return v25;
}

id AudioAccessoryDevice.cbDevice.getter()
{
  id v1 = v0;
  if (objc_msgSend(v1, sel_respondsToSelector_, sel_coreBluetoothDevice)
    && (objc_msgSend(v1, sel_respondsToSelector_, sel_coreBluetoothDevice) & 1) != 0)
  {
    id v2 = objc_msgSend(v1, sel_coreBluetoothDevice);
  }
  else
  {

    return 0;
  }
  return v2;
}

char *sub_250D35E54(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_250D3BE90();
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  MEMORY[0x270FA5388](v8);
  uint64_t v13 = (char *)&v103 - v12;
  v116 = (char *)MEMORY[0x263F8EE78];
  if (a2)
  {
    uint64_t v107 = v11;
    uint64_t v108 = v10;
    uint64_t v113 = v9;
    swift_bridgeObjectRetain();
    uint64_t v111 = a1;
    id v14 = sub_250D36EE8(a1, a2);
    id v15 = objc_msgSend(v14, sel_headGesturesVersion);
    id v16 = objc_msgSend(*(id *)(v2 + 64), sel_headGesturesVersion);
    unint64_t v109 = 0xD000000000000015;
    unint64_t v17 = (__CFString *)sub_250D3BEF0();
    v112 = "v16@?0@\"NSError\"8";
    char v18 = (__CFString *)sub_250D3BEF0();
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(v17, v18, 0);

    if (v15 < v16 || AppBooleanValue)
    {
      if (qword_26B205160 != -1) {
        swift_once();
      }
      uint64_t v19 = __swift_project_value_buffer(v6, (uint64_t)qword_26B205168);
      uint64_t v20 = v113;
      (*(void (**)(char *, uint64_t, uint64_t))(v113 + 16))(v13, v19, v6);
      swift_bridgeObjectRetain_n();
      id v21 = v14;
      swift_retain_n();
      id v22 = v21;
      uint64_t v23 = v6;
      id v24 = sub_250D3BE70();
      os_log_type_t v25 = sub_250D3BF80();
      int v26 = v25;
      if (os_log_type_enabled(v24, v25))
      {
        uint64_t v27 = swift_slowAlloc();
        uint64_t v105 = swift_slowAlloc();
        v115[0] = v105;
        *(_DWORD *)uint64_t v27 = 136315906;
        uint64_t v106 = v23;
        swift_bridgeObjectRetain();
        id v114 = (id)sub_250D38FF4(v111, a2, v115);
        sub_250D3BFB0();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v27 + 12) = 2080;
        id v114 = objc_msgSend(v22, sel_headGesturesVersion);
        sub_250D397BC();
        LODWORD(v104) = v26;
        uint64_t v28 = sub_250D3BFD0();
        id v114 = (id)sub_250D38FF4(v28, v29, v115);
        sub_250D3BFB0();

        swift_bridgeObjectRelease();
        *(_WORD *)(v27 + 22) = 2080;
        id v114 = objc_msgSend(*(id *)(v3 + 64), sel_headGesturesVersion);
        uint64_t v30 = sub_250D3BFD0();
        id v114 = (id)sub_250D38FF4(v30, v31, v115);
        sub_250D3BFB0();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v27 + 32) = 2080;
        if (AppBooleanValue) {
          uint64_t v32 = 5457241;
        }
        else {
          uint64_t v32 = 20302;
        }
        if (AppBooleanValue) {
          unint64_t v33 = 0xE300000000000000;
        }
        else {
          unint64_t v33 = 0xE200000000000000;
        }
        id v114 = (id)sub_250D38FF4(v32, v33, v115);
        sub_250D3BFB0();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_250D2C000, v24, (os_log_type_t)v104, "HeadphoneProxFeatureService: [%s] getWhatsNewNotShowedFeatures: Head Gestures: Yes, Current Version: %s, Target Version: %s, Force Show: %s", (uint8_t *)v27, 0x2Au);
        uint64_t v34 = v105;
        swift_arrayDestroy();
        MEMORY[0x253387320](v34, -1, -1);
        MEMORY[0x253387320](v27, -1, -1);

        uint64_t v6 = v106;
        (*(void (**)(char *, uint64_t))(v113 + 8))(v13, v106);
      }
      else
      {

        swift_release_n();
        swift_bridgeObjectRelease_n();
        (*(void (**)(char *, uint64_t))(v20 + 8))(v13, v23);
        uint64_t v6 = v23;
      }
      unint64_t v39 = v116;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v39 = sub_250D38EF8(0, *((void *)v39 + 2) + 1, 1, v39);
      }
      unint64_t v41 = *((void *)v39 + 2);
      unint64_t v40 = *((void *)v39 + 3);
      if (v41 >= v40 >> 1) {
        unint64_t v39 = sub_250D38EF8((char *)(v40 > 1), v41 + 1, 1, v39);
      }
      *((void *)v39 + 2) = v41 + 1;
      v39[v41 + 32] = 1;
      v116 = v39;
    }
    id v42 = objc_msgSend(v14, sel_hearingAssistVersion);
    id v43 = objc_msgSend(*(id *)(v3 + 64), sel_hearingAssistVersion);
    uint64_t v44 = (__CFString *)sub_250D3BEF0();
    os_log_t v45 = (__CFString *)sub_250D3BEF0();
    int v46 = CFPreferencesGetAppBooleanValue(v44, v45, 0);

    if (v42 < v43 || v46)
    {
      if (qword_26B205160 != -1) {
        swift_once();
      }
      uint64_t v47 = __swift_project_value_buffer(v6, (uint64_t)qword_26B205168);
      uint64_t v48 = v113;
      uint64_t v49 = v107;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v113 + 16))(v107, v47, v6);
      swift_bridgeObjectRetain_n();
      id v50 = v14;
      swift_retain_n();
      id v51 = v50;
      uint64_t v52 = v6;
      id v53 = v51;
      uint64_t v54 = sub_250D3BE70();
      os_log_type_t v55 = sub_250D3BF80();
      int v56 = v55;
      if (os_log_type_enabled(v54, v55))
      {
        uint64_t v57 = swift_slowAlloc();
        HIDWORD(v103) = v56;
        uint64_t v58 = v57;
        uint64_t v104 = swift_slowAlloc();
        v115[0] = v104;
        *(_DWORD *)uint64_t v58 = 136315906;
        swift_bridgeObjectRetain();
        id v114 = (id)sub_250D38FF4(v111, a2, v115);
        sub_250D3BFB0();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v58 + 12) = 2080;
        uint64_t v105 = (uint64_t)v14;
        id v114 = objc_msgSend(v53, sel_hearingAssistVersion);
        sub_250D397BC();
        uint64_t v106 = v52;
        uint64_t v59 = sub_250D3BFD0();
        id v114 = (id)sub_250D38FF4(v59, v60, v115);
        sub_250D3BFB0();

        swift_bridgeObjectRelease();
        *(_WORD *)(v58 + 22) = 2080;
        id v114 = objc_msgSend(*(id *)(v3 + 64), sel_hearingAssistVersion);
        uint64_t v61 = sub_250D3BFD0();
        id v114 = (id)sub_250D38FF4(v61, v62, v115);
        sub_250D3BFB0();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v58 + 32) = 2080;
        if (AppBooleanValue) {
          uint64_t v63 = 5457241;
        }
        else {
          uint64_t v63 = 20302;
        }
        if (AppBooleanValue) {
          unint64_t v64 = 0xE300000000000000;
        }
        else {
          unint64_t v64 = 0xE200000000000000;
        }
        id v114 = (id)sub_250D38FF4(v63, v64, v115);
        id v14 = (id)v105;
        sub_250D3BFB0();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_250D2C000, v54, BYTE4(v103), "HeadphoneProxFeatureService: [%s] getWhatsNewNotShowedFeatures: Yodel: Yes, Current Version: %s, Target Version: %s, Force Show: %s", (uint8_t *)v58, 0x2Au);
        uint64_t v65 = v104;
        swift_arrayDestroy();
        MEMORY[0x253387320](v65, -1, -1);
        MEMORY[0x253387320](v58, -1, -1);

        uint64_t v6 = v106;
        (*(void (**)(uint64_t, uint64_t))(v113 + 8))(v107, v106);
      }
      else
      {

        swift_release_n();
        swift_bridgeObjectRelease_n();
        (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v49, v52);
        uint64_t v6 = v52;
      }
      os_log_t v66 = v116;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        os_log_t v66 = sub_250D38EF8(0, *((void *)v66 + 2) + 1, 1, v66);
      }
      unint64_t v68 = *((void *)v66 + 2);
      unint64_t v67 = *((void *)v66 + 3);
      if (v68 >= v67 >> 1) {
        os_log_t v66 = sub_250D38EF8((char *)(v67 > 1), v68 + 1, 1, v66);
      }
      *((void *)v66 + 2) = v68 + 1;
      v66[v68 + 32] = 4;
      v116 = v66;
    }
    id v69 = objc_msgSend(v14, sel_voiceQualityVersion);
    id v70 = objc_msgSend(*(id *)(v3 + 64), sel_voiceQualityVersion);
    uint64_t v71 = (__CFString *)sub_250D3BEF0();
    id v72 = (__CFString *)sub_250D3BEF0();
    int v73 = CFPreferencesGetAppBooleanValue(v71, v72, 0);

    if (v69 < v70 || v73)
    {
      if (qword_26B205160 != -1) {
        swift_once();
      }
      uint64_t v74 = __swift_project_value_buffer(v6, (uint64_t)qword_26B205168);
      uint64_t v75 = v113;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v113 + 16))(v108, v74, v6);
      swift_bridgeObjectRetain_n();
      id v76 = v14;
      swift_retain_n();
      id v77 = v76;
      uint64_t v78 = v6;
      id v79 = v77;
      uint64_t v80 = sub_250D3BE70();
      os_log_type_t v81 = sub_250D3BF80();
      int v82 = v81;
      if (os_log_type_enabled(v80, v81))
      {
        uint64_t v83 = swift_slowAlloc();
        uint64_t v105 = (uint64_t)v14;
        uint64_t v84 = v83;
        v112 = (const char *)swift_slowAlloc();
        v115[0] = (uint64_t)v112;
        *(_DWORD *)uint64_t v84 = 136315906;
        int AppBooleanValue = v82;
        swift_bridgeObjectRetain();
        id v114 = (id)sub_250D38FF4(v111, a2, v115);
        sub_250D3BFB0();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v84 + 12) = 2080;
        uint64_t v106 = v78;
        id v114 = objc_msgSend(v79, sel_voiceQualityVersion);
        sub_250D397BC();
        uint64_t v85 = sub_250D3BFD0();
        id v114 = (id)sub_250D38FF4(v85, v86, v115);
        sub_250D3BFB0();

        swift_bridgeObjectRelease();
        *(_WORD *)(v84 + 22) = 2080;
        id v114 = objc_msgSend(*(id *)(v3 + 64), sel_voiceQualityVersion);
        uint64_t v87 = sub_250D3BFD0();
        id v114 = (id)sub_250D38FF4(v87, v88, v115);
        sub_250D3BFB0();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v84 + 32) = 2080;
        if (v73) {
          uint64_t v89 = 5457241;
        }
        else {
          uint64_t v89 = 20302;
        }
        if (v73) {
          unint64_t v90 = 0xE300000000000000;
        }
        else {
          unint64_t v90 = 0xE200000000000000;
        }
        id v114 = (id)sub_250D38FF4(v89, v90, v115);
        sub_250D3BFB0();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_250D2C000, v80, (os_log_type_t)AppBooleanValue, "HeadphoneProxFeatureService: [%s] getWhatsNewNotShowedFeatures: Voice Quality: Yes, Current Version: %s, Target Version: %s, Force Show: %s", (uint8_t *)v84, 0x2Au);
        uint64_t v91 = v112;
        swift_arrayDestroy();
        MEMORY[0x253387320](v91, -1, -1);
        uint64_t v92 = v84;
        id v14 = (id)v105;
        MEMORY[0x253387320](v92, -1, -1);

        uint64_t v6 = v106;
        (*(void (**)(uint64_t, uint64_t))(v113 + 8))(v108, v106);
      }
      else
      {

        swift_release_n();
        swift_bridgeObjectRelease_n();
        (*(void (**)(uint64_t, uint64_t))(v75 + 8))(v108, v78);
        uint64_t v6 = v78;
      }
      uint64_t v93 = v116;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v93 = sub_250D38EF8(0, *((void *)v93 + 2) + 1, 1, v93);
      }
      unint64_t v95 = *((void *)v93 + 2);
      unint64_t v94 = *((void *)v93 + 3);
      if (v95 >= v94 >> 1) {
        uint64_t v93 = sub_250D38EF8((char *)(v94 > 1), v95 + 1, 1, v93);
      }
      *((void *)v93 + 2) = v95 + 1;
      v93[v95 + 32] = 2;
      v116 = v93;
    }
    if (qword_26B205160 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v6, (uint64_t)qword_26B205168);
    uint64_t v96 = v116;
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    id v97 = sub_250D3BE70();
    os_log_type_t v98 = sub_250D3BF80();
    if (os_log_type_enabled(v97, v98))
    {
      uint64_t v99 = swift_slowAlloc();
      uint64_t v100 = swift_slowAlloc();
      v115[0] = v100;
      *(_DWORD *)uint64_t v99 = 136315394;
      swift_bridgeObjectRetain();
      id v114 = (id)sub_250D38FF4(v111, a2, v115);
      sub_250D3BFB0();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v99 + 12) = 2080;
      uint64_t v101 = MEMORY[0x253386D30](v96, &type metadata for HeadphoneProxFeatureManager.HeadphoneProxFeature);
      id v114 = (id)sub_250D38FF4(v101, v102, v115);
      sub_250D3BFB0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_250D2C000, v97, v98, "HeadphoneProxFeatureService: [%s] getWhatsNewNotShowedFeatures: notShowedFeatureSet: %s", (uint8_t *)v99, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x253387320](v100, -1, -1);
      MEMORY[0x253387320](v99, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
    swift_beginAccess();
    return v116;
  }
  else
  {
    if (qword_26B205160 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v6, (uint64_t)qword_26B205168);
    uint64_t v35 = sub_250D3BE70();
    os_log_type_t v36 = sub_250D3BF80();
    if (os_log_type_enabled(v35, v36))
    {
      id v37 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v37 = 0;
      _os_log_impl(&dword_250D2C000, v35, v36, "HeadphoneProxFeatureService: getWhatsNewNotShowedFeatures: Invalid Device, Return", v37, 2u);
      MEMORY[0x253387320](v37, -1, -1);
    }

    return (char *)MEMORY[0x263F8EE78];
  }
}

id sub_250D36EE8(uint64_t a1, unint64_t a2)
{
  uint64_t v32 = sub_250D3BEC0();
  uint64_t v5 = *(void *)(v32 - 8);
  uint64_t v6 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v30 - v9;
  uint64_t v11 = swift_allocObject();
  id v12 = objc_allocWithZone(MEMORY[0x263F28948]);
  swift_bridgeObjectRetain();
  uint64_t v13 = (void *)sub_250D3BEF0();
  swift_bridgeObjectRelease();
  id v14 = objc_msgSend(v12, sel_initWithBluetoothAddress_, v13);

  objc_msgSend(v14, sel_setHeadGesturesVersion_, 1);
  objc_msgSend(v14, sel_setVoiceQualityVersion_, 1);
  objc_msgSend(v14, sel_setWhatsNewVersion_, 2);
  objc_msgSend(v14, sel_setHeartRateVersion_, 1);
  objc_msgSend(v14, sel_setHearingAssistVersion_, 1);
  *(void *)(v11 + 16) = v14;
  uint64_t v33 = v11 + 16;
  id v15 = dispatch_group_create();
  dispatch_group_enter(v15);
  id v16 = *(void **)(v2 + 40);
  unint64_t v17 = (void *)sub_250D3BEF0();
  char v18 = (void *)swift_allocObject();
  uint64_t v31 = a1;
  v18[2] = a1;
  v18[3] = a2;
  v18[4] = v11;
  v18[5] = v15;
  aBlock[4] = (uint64_t)sub_250D3B48C;
  aBlock[5] = (uint64_t)v18;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_250D377E4;
  aBlock[3] = (uint64_t)&block_descriptor_90;
  uint64_t v19 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  uint64_t v34 = v11;
  swift_retain();
  uint64_t v20 = v15;
  swift_release();
  objc_msgSend(v16, sel_fetchAAProxCardsInfoForDeviceWithAddress_completion_, v17, v19);
  _Block_release(v19);

  sub_250D3BEB0();
  MEMORY[0x253386CA0](v8, 1.0);
  id v21 = *(void (**)(char *, uint64_t))(v5 + 8);
  uint64_t v22 = v32;
  v21(v8, v32);
  sub_250D3BF90();
  v21(v10, v22);
  if ((sub_250D3BEA0() & 1) == 0) {
    goto LABEL_7;
  }
  if (qword_26B205160 != -1) {
    swift_once();
  }
  uint64_t v23 = sub_250D3BE90();
  __swift_project_value_buffer(v23, (uint64_t)qword_26B205168);
  swift_bridgeObjectRetain_n();
  id v24 = sub_250D3BE70();
  os_log_type_t v25 = sub_250D3BF80();
  if (!os_log_type_enabled(v24, v25))
  {

    swift_bridgeObjectRelease_n();
LABEL_7:

    goto LABEL_8;
  }
  int v26 = (uint8_t *)swift_slowAlloc();
  uint64_t v27 = swift_slowAlloc();
  aBlock[0] = v27;
  *(_DWORD *)int v26 = 136315138;
  swift_bridgeObjectRetain();
  uint64_t v35 = sub_250D38FF4(v31, a2, aBlock);
  sub_250D3BFB0();
  swift_bridgeObjectRelease_n();
  _os_log_impl(&dword_250D2C000, v24, v25, "HeadphoneProxFeatureService: [%s] getProxCardInfoForDevice: Timed Out", v26, 0xCu);
  swift_arrayDestroy();
  MEMORY[0x253387320](v27, -1, -1);
  MEMORY[0x253387320](v26, -1, -1);

LABEL_8:
  swift_beginAccess();
  id v28 = *(id *)(v34 + 16);
  swift_release();
  return v28;
}

void sub_250D37394()
{
  objc_msgSend(v0, sel_whatsNewVersion);
  sub_250D3C070();
  uint64_t v15 = 0x654E207374616857;
  unint64_t v16 = 0xEB00000000203A77;
  sub_250D3BF40();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_voiceQualityVersion);
  sub_250D3C070();
  sub_250D3BF40();
  swift_bridgeObjectRelease();
  sub_250D3BF40();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_headGesturesVersion);
  sub_250D3C070();
  sub_250D3BF40();
  swift_bridgeObjectRelease();
  sub_250D3BF40();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_heartRateVersion);
  sub_250D3C070();
  strcpy((char *)v14, ", Heart Rate: ");
  sub_250D3BF40();
  swift_bridgeObjectRelease();
  sub_250D3BF40();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_hearingAssistVersion);
  sub_250D3C070();
  strcpy((char *)v14, ", Yodel: ");
  WORD1(v14[1]) = 0;
  HIDWORD(v14[1]) = -385875968;
  sub_250D3BF40();
  swift_bridgeObjectRelease();
  sub_250D3BF40();
  swift_bridgeObjectRelease();
  if (qword_26B205160 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_250D3BE90();
  __swift_project_value_buffer(v1, (uint64_t)qword_26B205168);
  uint64_t v3 = v15;
  unint64_t v2 = v16;
  id v4 = v0;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_250D3BE70();
  os_log_type_t v6 = sub_250D3BF80();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    v14[0] = v8;
    *(_DWORD *)uint64_t v7 = 136315394;
    id v9 = objc_msgSend(v4, sel_bluetoothAddress);
    uint64_t v10 = sub_250D3BF00();
    uint64_t v13 = v3;
    unint64_t v12 = v11;

    sub_250D38FF4(v10, v12, v14);
    sub_250D3BFB0();

    swift_bridgeObjectRelease();
    *(_WORD *)(v7 + 12) = 2080;
    swift_bridgeObjectRetain();
    sub_250D38FF4(v13, v2, v14);
    sub_250D3BFB0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_250D2C000, v5, v6, "HeadphoneProxFeatureService: [%s] printProxCardInfo: %s", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x253387320](v8, -1, -1);
    MEMORY[0x253387320](v7, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
}

void sub_250D377E4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

id sub_250D37870(uint64_t a1, unint64_t a2, unsigned __int8 *a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_250D3BE90();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  unint64_t v11 = (char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *a3;
  if (a2)
  {
    uint64_t v13 = sub_250D3BF20();
    uint64_t v15 = v14;
    swift_beginAccess();
    uint64_t v16 = *(void *)(v4 + 24);
    if (*(void *)(v16 + 16))
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v17 = sub_250D39810(v13, v15);
      if (v18)
      {
        uint64_t v44 = v12;
        id v19 = *(id *)(*(void *)(v16 + 56) + 8 * v17);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_beginAccess();
        uint64_t v20 = *(void *)(v4 + 16);
        if (*(void *)(v20 + 16))
        {
          swift_bridgeObjectRetain();
          unint64_t v21 = sub_250D39810(v13, v15);
          if (v22)
          {
            id v23 = *(id *)(*(void *)(v20 + 56) + 8 * v21);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            return v23;
          }

          swift_bridgeObjectRelease();
        }
        else
        {
        }
        swift_bridgeObjectRelease();
        uint64_t v12 = v44;
      }
      else
      {
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  if (qword_26B205160 != -1) {
    swift_once();
  }
  uint64_t v24 = __swift_project_value_buffer(v8, (uint64_t)qword_26B205168);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v24, v8);
  swift_bridgeObjectRetain_n();
  swift_retain_n();
  os_log_type_t v25 = sub_250D3BE70();
  int v26 = sub_250D3BF70();
  if (os_log_type_enabled(v25, (os_log_type_t)v26))
  {
    int v43 = v26;
    uint64_t v27 = a1;
    uint64_t v44 = v9;
    uint64_t v28 = swift_slowAlloc();
    uint64_t v42 = swift_slowAlloc();
    uint64_t v48 = v42;
    *(_DWORD *)uint64_t v28 = 136315906;
    uint64_t v29 = 0xD000000000000014;
    unint64_t v30 = 0x8000000250D3C830;
    switch(v12)
    {
      case 1:
        unint64_t v30 = 0xEC00000073657275;
        uint64_t v29 = 0x7473654764616568;
        break;
      case 2:
        break;
      case 3:
        unint64_t v30 = 0x8000000250D3C850;
        uint64_t v29 = 0xD000000000000010;
        break;
      case 4:
        unint64_t v30 = 0xE500000000000000;
        uint64_t v29 = 0x6C65646F79;
        break;
      default:
        unint64_t v30 = 0xE800000000000000;
        uint64_t v29 = 0x77654E7374616877;
        break;
    }
    uint64_t v47 = sub_250D38FF4(v29, v30, &v48);
    sub_250D3BFB0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v28 + 12) = 2080;
    if (a2) {
      uint64_t v31 = v27;
    }
    else {
      uint64_t v31 = 4999502;
    }
    if (a2) {
      unint64_t v32 = a2;
    }
    else {
      unint64_t v32 = 0xE300000000000000;
    }
    swift_bridgeObjectRetain();
    uint64_t v47 = sub_250D38FF4(v31, v32, &v48);
    sub_250D3BFB0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v28 + 22) = 2080;
    swift_beginAccess();
    sub_250D3BC08(0, &qword_269B01C80);
    swift_bridgeObjectRetain();
    uint64_t v33 = sub_250D3BEE0();
    unint64_t v35 = v34;
    swift_bridgeObjectRelease();
    uint64_t v46 = sub_250D38FF4(v33, v35, &v48);
    sub_250D3BFB0();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v28 + 32) = 2080;
    swift_beginAccess();
    sub_250D3BC08(0, &qword_269B01C98);
    swift_bridgeObjectRetain();
    uint64_t v36 = sub_250D3BEE0();
    unint64_t v38 = v37;
    swift_bridgeObjectRelease();
    uint64_t v45 = sub_250D38FF4(v36, v38, &v48);
    sub_250D3BFB0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_250D2C000, v25, (os_log_type_t)v43, "HeadphoneProxFeatureService: hearingRecordWithDevice: %s %s %s %s", (uint8_t *)v28, 0x2Au);
    uint64_t v39 = v42;
    swift_arrayDestroy();
    MEMORY[0x253387320](v39, -1, -1);
    MEMORY[0x253387320](v28, -1, -1);

    (*(void (**)(char *, uint64_t))(v44 + 8))(v11, v8);
  }
  else
  {

    swift_release_n();
    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  return 0;
}

id *HeadphoneProxFeatureManager.deinit()
{
  objc_msgSend(v0[4], sel_invalidate);
  objc_msgSend(v0[5], sel_invalidate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_250D3A6E8((uint64_t)(v0 + 6));
  return v0;
}

uint64_t HeadphoneProxFeatureManager.__deallocating_deinit()
{
  objc_msgSend(v0[4], sel_invalidate);
  objc_msgSend(v0[5], sel_invalidate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_250D3A6E8((uint64_t)(v0 + 6));
  return MEMORY[0x270FA0228](v0, 88, 7);
}

uint64_t sub_250D37FC0()
{
  if (qword_26B205160 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_250D3BE90();
  __swift_project_value_buffer(v0, (uint64_t)qword_26B205168);
  uint64_t v1 = sub_250D3BE70();
  os_log_type_t v2 = sub_250D3BF70();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = swift_slowAlloc();
    uint64_t v4 = swift_slowAlloc();
    v10[0] = v4;
    *(_DWORD *)uint64_t v3 = 136315394;
    sub_250D38FF4(0xD000000000000019, 0x8000000250D3CD60, v10);
    sub_250D3BFB0();
    *(_WORD *)(v3 + 12) = 2048;
    sub_250D3BFB0();
    _os_log_impl(&dword_250D2C000, v1, v2, "HeadphoneProxFeatureManager: %s: %ld hearing client interrupted! Retrying to standup discovery stack", (uint8_t *)v3, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x253387320](v4, -1, -1);
    MEMORY[0x253387320](v3, -1, -1);
  }

  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v6 = Strong;
    id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F472F8]), sel_init);
    uint64_t v8 = *(void **)(v6 + 80);
    *(void *)(v6 + 80) = v7;

    swift_release();
  }
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    HeadphoneProxFeatureManager.configHearingModeClient()();
    return swift_release();
  }
  return result;
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

void sub_250D381F8()
{
  if (qword_26B205160 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_250D3BE90();
  __swift_project_value_buffer(v0, (uint64_t)qword_26B205168);
  oslog = sub_250D3BE70();
  os_log_type_t v1 = sub_250D3BF70();
  if (os_log_type_enabled(oslog, v1))
  {
    uint64_t v2 = swift_slowAlloc();
    uint64_t v3 = swift_slowAlloc();
    uint64_t v5 = v3;
    *(_DWORD *)uint64_t v2 = 136315394;
    sub_250D38FF4(0xD000000000000019, 0x8000000250D3CD60, &v5);
    sub_250D3BFB0();
    *(_WORD *)(v2 + 12) = 2048;
    sub_250D3BFB0();
    _os_log_impl(&dword_250D2C000, oslog, v1, "HeadphoneProxFeatureManager: %s: %ld hearing client invalidated! Retrying to standup discovery stack", (uint8_t *)v2, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x253387320](v3, -1, -1);
    MEMORY[0x253387320](v2, -1, -1);
  }
  else
  {
  }
}

void sub_250D383BC(void *a1)
{
  id v2 = objc_msgSend(a1, sel_bluetoothAddress);
  sub_250D3BF00();

  uint64_t v3 = sub_250D3BF20();
  uint64_t v5 = v4;
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v7 = Strong;
    swift_beginAccess();
    id v8 = a1;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v18 = *(void *)(v7 + 24);
    *(void *)(v7 + 24) = 0x8000000000000000;
    sub_250D39F28((uint64_t)v8, v3, v5, isUniquelyReferenced_nonNull_native, (uint64_t *)&unk_269B01CD0);
    *(void *)(v7 + 24) = v18;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  if (qword_26B205160 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_250D3BE90();
  __swift_project_value_buffer(v10, (uint64_t)qword_26B205168);
  id v11 = a1;
  uint64_t v12 = sub_250D3BE70();
  os_log_type_t v13 = sub_250D3BF80();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v15 = (void *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    v19[0] = v16;
    *(_DWORD *)uint64_t v14 = 136315650;
    sub_250D38FF4(0xD000000000000019, 0x8000000250D3CD60, v19);
    sub_250D3BFB0();
    *(_WORD *)(v14 + 12) = 2048;
    sub_250D3BFB0();
    *(_WORD *)(v14 + 22) = 2112;
    id v17 = v11;
    sub_250D3BFB0();
    void *v15 = v11;

    _os_log_impl(&dword_250D2C000, v12, v13, "HeadphoneProxFeatureManager: %s: %ld record received %@", (uint8_t *)v14, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B205130);
    swift_arrayDestroy();
    MEMORY[0x253387320](v15, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x253387320](v16, -1, -1);
    MEMORY[0x253387320](v14, -1, -1);
  }
  else
  {
  }
}

void sub_250D386E8(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

void sub_250D38750(void *a1)
{
  if (a1)
  {
    if (qword_26B205160 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_250D3BE90();
    __swift_project_value_buffer(v2, (uint64_t)qword_26B205168);
    id v3 = a1;
    id v4 = a1;
    oslog = sub_250D3BE70();
    os_log_type_t v5 = sub_250D3BF70();
    if (os_log_type_enabled(oslog, v5))
    {
      uint64_t v6 = swift_slowAlloc();
      uint64_t v7 = (void *)swift_slowAlloc();
      uint64_t v8 = swift_slowAlloc();
      uint64_t v12 = v8;
      *(_DWORD *)uint64_t v6 = 136315650;
      sub_250D38FF4(0xD000000000000019, 0x8000000250D3CD60, &v12);
      sub_250D3BFB0();
      *(_WORD *)(v6 + 12) = 2048;
      sub_250D3BFB0();
      *(_WORD *)(v6 + 22) = 2112;
      id v9 = a1;
      uint64_t v11 = _swift_stdlib_bridgeErrorToNSError();
      sub_250D3BFB0();
      *uint64_t v7 = v11;

      _os_log_impl(&dword_250D2C000, oslog, v5, "HeadphoneProxFeatureManager: %s: %ld failed to acitivate HMServiceClient %@", (uint8_t *)v6, 0x20u);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B205130);
      swift_arrayDestroy();
      MEMORY[0x253387320](v7, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x253387320](v8, -1, -1);
      MEMORY[0x253387320](v6, -1, -1);
    }
    else
    {
    }
  }
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_250D38A08()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_250D38A40(void *a1)
{
  uint64_t v3 = *(void *)(v1 + 16);
  unint64_t v2 = *(void *)(v1 + 24);
  if (a1)
  {
    if (qword_26B205160 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_250D3BE90();
    __swift_project_value_buffer(v5, (uint64_t)qword_26B205168);
    swift_bridgeObjectRetain();
    id v6 = a1;
    swift_bridgeObjectRetain();
    id v7 = a1;
    oslog = sub_250D3BE70();
    os_log_type_t v8 = sub_250D3BF80();
    if (os_log_type_enabled(oslog, v8))
    {
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = swift_slowAlloc();
      uint64_t v20 = v10;
      *(_DWORD *)uint64_t v9 = 136315394;
      swift_bridgeObjectRetain();
      uint64_t v19 = sub_250D38FF4(v3, v2, &v20);
      sub_250D3BFB0();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v9 + 12) = 2080;
      swift_getErrorValue();
      uint64_t v11 = sub_250D3C0A0();
      sub_250D38FF4(v11, v12, &v20);
      sub_250D3BFB0();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_250D2C000, oslog, v8, "HeadphoneProxFeatureService: [%s] setProxCardShowedFeatures: Failed: %s", (uint8_t *)v9, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x253387320](v10, -1, -1);
      uint64_t v13 = v9;
LABEL_10:
      MEMORY[0x253387320](v13, -1, -1);

      return;
    }
    swift_bridgeObjectRelease_n();
  }
  else
  {
    if (qword_26B205160 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_250D3BE90();
    __swift_project_value_buffer(v14, (uint64_t)qword_26B205168);
    swift_bridgeObjectRetain_n();
    oslog = sub_250D3BE70();
    os_log_type_t v15 = sub_250D3BF80();
    if (os_log_type_enabled(oslog, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      uint64_t v19 = v17;
      *(_DWORD *)uint64_t v16 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v20 = sub_250D38FF4(v3, v2, &v19);
      sub_250D3BFB0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_250D2C000, oslog, v15, "HeadphoneProxFeatureService: [%s] setProxCardShowedFeatures: Succeeded", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x253387320](v17, -1, -1);
      uint64_t v13 = (uint64_t)v16;
      goto LABEL_10;
    }
    swift_bridgeObjectRelease_n();
  }
}

void *sub_250D38DE8(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_269B01CB0);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      uint64_t v10[3] = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_250D3B22C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_250D38EF8(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    int64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  int64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      int64_t v7 = a2;
    }
LABEL_8:
    int64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      int64_t v9 = *((void *)a4 + 2);
    }
    else {
      int64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_269B01CB8);
      uint64_t v10 = (char *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * v11 - 64;
      uint64_t v12 = v10 + 32;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[v8 + 32]) {
          memmove(v12, a4 + 32, v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (char *)MEMORY[0x263F8EE78];
      uint64_t v12 = (char *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_250D3B324(0, v8, v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_250D38FF4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_250D390C8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_250D3BB48((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_250D3BB48((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_250D390C8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_250D3BFC0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_250D39284(a5, a6);
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
  uint64_t v8 = sub_250D3C000();
  if (!v8)
  {
    sub_250D3C010();
    __break(1u);
LABEL_17:
    uint64_t result = sub_250D3C050();
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

uint64_t sub_250D39284(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_250D3931C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_250D394FC(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_250D394FC(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_250D3931C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_250D39494(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_250D3BFF0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_250D3C010();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_250D3BF50();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_250D3C050();
    __break(1u);
LABEL_14:
    uint64_t result = sub_250D3C010();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_250D39494(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B204F38);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_250D394FC(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B204F38);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
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
  uint64_t result = sub_250D3C050();
  __break(1u);
  return result;
}

uint64_t sub_250D3964C()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

id sub_250D3968C@<X0>(BOOL *a1@<X8>)
{
  unint64_t v3 = *(void **)(v1 + 16);
  id result = objc_msgSend(v3, sel_hearingProtectionCapability);
  if (result == 2)
  {
    id result = objc_msgSend(v3, sel_hearingAidCapability);
    BOOL v5 = result == 2;
  }
  else
  {
    BOOL v5 = 0;
  }
  *a1 = v5;
  return result;
}

id sub_250D396EC@<X0>(BOOL *a1@<X8>)
{
  return sub_250D39714((SEL *)&selRef_hearingAssistRegionStatus, (SEL *)&selRef_hearingAidCapability, a1);
}

id sub_250D39700@<X0>(BOOL *a1@<X8>)
{
  return sub_250D39714((SEL *)&selRef_hearingTestRegionStatus, (SEL *)&selRef_hearingTestCapability, a1);
}

id sub_250D39714@<X0>(SEL *a1@<X0>, SEL *a2@<X1>, BOOL *a3@<X8>)
{
  unint64_t v6 = *(void **)(v3 + 16);
  id result = [*(id *)(v3 + 24) *a1];
  if (result == 2)
  {
    id result = [v6 *a2];
    BOOL v8 = result == 2;
  }
  else
  {
    BOOL v8 = 0;
  }
  *a3 = v8;
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_250D397BC()
{
  unint64_t result = qword_269B01C90;
  if (!qword_269B01C90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B01C90);
  }
  return result;
}

unint64_t sub_250D39810(uint64_t a1, uint64_t a2)
{
  sub_250D3C0B0();
  sub_250D3BF30();
  uint64_t v4 = sub_250D3C0C0();
  return sub_250D39888(a1, a2, v4);
}

unint64_t sub_250D39888(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_250D3C080() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_250D3C080() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_250D3996C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_250D39810(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  uint64_t v12 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_250D3A0B0(&qword_269B01CA8);
    uint64_t v9 = v12;
  }
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(*(void *)(v9 + 56) + 8 * v6);
  sub_250D39D50(v6, v9);
  *uint64_t v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_250D39A44(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  char v39 = a2;
  uint64_t v7 = sub_250D3C030();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16)) {
    goto LABEL_40;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v38 = v6 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & *(void *)(v6 + 64);
  uint64_t v36 = v3;
  int64_t v37 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v12 = v7 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v11)
    {
      unint64_t v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v37) {
      break;
    }
    id v23 = (void *)(v6 + 64);
    unint64_t v24 = *(void *)(v38 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v37) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v38 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v37)
        {
LABEL_33:
          swift_release();
          uint64_t v4 = v36;
          if ((v39 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v38 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v37) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v38 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v25;
      }
    }
LABEL_30:
    unint64_t v11 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    unint64_t v30 = (uint64_t *)(*(void *)(v6 + 48) + 16 * v21);
    uint64_t v32 = *v30;
    uint64_t v31 = v30[1];
    uint64_t v33 = *(void **)(*(void *)(v6 + 56) + 8 * v21);
    if ((v39 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v34 = v33;
    }
    sub_250D3C0B0();
    sub_250D3BF30();
    uint64_t result = sub_250D3C0C0();
    uint64_t v15 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = (void *)(*(void *)(v8 + 48) + 16 * v18);
    *uint64_t v19 = v32;
    v19[1] = v31;
    *(void *)(*(void *)(v8 + 56) + 8 * v18) = v33;
    ++*(void *)(v8 + 16);
  }
  swift_release();
  uint64_t v4 = v36;
  id v23 = (void *)(v6 + 64);
  if ((v39 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v35 = 1 << *(unsigned char *)(v6 + 32);
  if (v35 >= 64) {
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *id v23 = -1 << v35;
  }
  *(void *)(v6 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v4 = v8;
  return result;
}

unint64_t sub_250D39D50(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_250D3BFE0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_250D3C0B0();
        swift_bridgeObjectRetain();
        sub_250D3BF30();
        uint64_t v9 = sub_250D3C0C0();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(a2 + 48);
          uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          uint64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            _OWORD *v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          uint64_t v15 = (void *)(v14 + 8 * v3);
          unint64_t v16 = (void *)(v14 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            void *v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  *unint64_t v17 = v19 & v18;
  uint64_t v20 = *(void *)(a2 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void sub_250D39F28(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t *a5)
{
  uint64_t v7 = v5;
  uint64_t v12 = *v5;
  unint64_t v14 = sub_250D39810(a2, a3);
  uint64_t v15 = *(void *)(v12 + 16);
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v18 = v13;
  uint64_t v19 = *(void *)(v12 + 24);
  if (v19 >= v17 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v19 >= v17 && (a4 & 1) == 0)
  {
    sub_250D3A0B0(a5);
LABEL_7:
    uint64_t v20 = (void *)*v7;
    if (v18)
    {
LABEL_8:
      uint64_t v21 = v20[7];

      *(void *)(v21 + 8 * v14) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_250D39A44(v17, a4 & 1, a5);
  unint64_t v22 = sub_250D39810(a2, a3);
  if ((v18 & 1) != (v23 & 1))
  {
LABEL_17:
    sub_250D3C090();
    __break(1u);
    return;
  }
  unint64_t v14 = v22;
  uint64_t v20 = (void *)*v7;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  v20[(v14 >> 6) + 8] |= 1 << v14;
  unint64_t v24 = (uint64_t *)(v20[6] + 16 * v14);
  uint64_t *v24 = a2;
  v24[1] = a3;
  *(void *)(v20[7] + 8 * v14) = a1;
  uint64_t v25 = v20[2];
  BOOL v26 = __OFADD__(v25, 1);
  uint64_t v27 = v25 + 1;
  if (v26)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v20[2] = v27;
  swift_bridgeObjectRetain();
}

id sub_250D3A0B0(uint64_t *a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_250D3C020();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    uint64_t *v2 = v5;
    return result;
  }
  id result = (id)(v4 + 64);
  uint64_t v7 = v3 + 64;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8) {
    id result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  }
  int64_t v10 = 0;
  *(void *)(v5 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    int64_t v23 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v14) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v7 + 8 * v23);
    ++v10;
    if (!v24)
    {
      int64_t v10 = v23 + 1;
      if (v23 + 1 >= v14) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v7 + 8 * v10);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = 16 * v16;
    char v18 = (void *)(*(void *)(v3 + 48) + 16 * v16);
    uint64_t v19 = v18[1];
    uint64_t v20 = 8 * v16;
    uint64_t v21 = *(void **)(*(void *)(v3 + 56) + v20);
    unint64_t v22 = (void *)(*(void *)(v5 + 48) + v17);
    void *v22 = *v18;
    v22[1] = v19;
    *(void *)(*(void *)(v5 + 56) + v20) = v21;
    swift_bridgeObjectRetain();
    id result = v21;
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v14) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v7 + 8 * v25);
  if (v24)
  {
    int64_t v10 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v10 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v7 + 8 * v10);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_250D3A25C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_250D3B0A0(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

void sub_250D3A280(void *a1)
{
}

uint64_t sub_250D3A294(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t objectdestroy_27Tm()
{
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + 32)) {
    swift_release();
  }
  return MEMORY[0x270FA0238](v0, 48, 7);
}

void sub_250D3A2F0(void *a1)
{
}

void sub_250D3A304(void *a1, const char *a2, const char *a3)
{
  uint64_t v5 = v3[2];
  unint64_t v4 = v3[3];
  unint64_t v6 = (void (*)(void))v3[4];
  if (!a1)
  {
    if (qword_26B205160 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_250D3BE90();
    __swift_project_value_buffer(v21, (uint64_t)qword_26B205168);
    swift_bridgeObjectRetain_n();
    unint64_t v13 = sub_250D3BE70();
    os_log_type_t v22 = sub_250D3BF80();
    if (os_log_type_enabled(v13, v22))
    {
      int64_t v23 = (uint8_t *)swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      uint64_t v25 = v24;
      *(_DWORD *)int64_t v23 = 136315138;
      swift_bridgeObjectRetain();
      sub_250D38FF4(v5, v4, &v25);
      sub_250D3BFB0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_250D2C000, v13, v22, a3, v23, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x253387320](v24, -1, -1);
      MEMORY[0x253387320](v23, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }
LABEL_13:

    if (!v6) {
      return;
    }
    goto LABEL_14;
  }
  id v9 = a1;
  if (qword_26B205160 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_250D3BE90();
  __swift_project_value_buffer(v10, (uint64_t)qword_26B205168);
  swift_bridgeObjectRetain();
  id v11 = a1;
  swift_bridgeObjectRetain();
  id v12 = a1;
  unint64_t v13 = sub_250D3BE70();
  os_log_type_t v14 = sub_250D3BF70();
  if (!os_log_type_enabled(v13, v14))
  {

    swift_bridgeObjectRelease_n();
    goto LABEL_13;
  }
  uint64_t v15 = swift_slowAlloc();
  uint64_t v16 = swift_slowAlloc();
  uint64_t v25 = v16;
  *(_DWORD *)uint64_t v15 = 136315394;
  swift_bridgeObjectRetain();
  sub_250D38FF4(v5, v4, &v25);
  sub_250D3BFB0();
  swift_bridgeObjectRelease_n();
  *(_WORD *)(v15 + 12) = 2080;
  id v17 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B01CC0);
  uint64_t v18 = sub_250D3BF10();
  sub_250D38FF4(v18, v19, &v25);
  sub_250D3BFB0();
  swift_bridgeObjectRelease();

  _os_log_impl(&dword_250D2C000, v13, v14, a2, (uint8_t *)v15, 0x16u);
  swift_arrayDestroy();
  MEMORY[0x253387320](v16, -1, -1);
  MEMORY[0x253387320](v15, -1, -1);

  if (v6) {
LABEL_14:
  }
    v6();
}

uint64_t sub_250D3A6E8(uint64_t a1)
{
  return a1;
}

unint64_t sub_250D3A714()
{
  unint64_t result = qword_269B01CA0;
  if (!qword_269B01CA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B01CA0);
  }
  return result;
}

uint64_t dispatch thunk of HeadphoneProxFeatureDeviceDelegate.readyToShow(device:features:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t type metadata accessor for HeadphoneProxFeatureManager()
{
  return self;
}

uint64_t method lookup function for HeadphoneProxFeatureManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HeadphoneProxFeatureManager);
}

uint64_t dispatch thunk of HeadphoneProxFeatureManager.connectedDevices.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of HeadphoneProxFeatureManager.connectedRecords.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of HeadphoneProxFeatureManager.delegate.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 216))();
}

uint64_t dispatch thunk of HeadphoneProxFeatureManager.delegate.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

uint64_t dispatch thunk of HeadphoneProxFeatureManager.delegate.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 232))();
}

uint64_t dispatch thunk of HeadphoneProxFeatureManager.setProxCardShowedFeatures(deviceAddress:showedFeatures:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 336))();
}

uint64_t dispatch thunk of HeadphoneProxFeatureManager.shouldShowYodelCard(deviceAddress:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 344))();
}

uint64_t dispatch thunk of HeadphoneProxFeatureManager.updateDevice(for:deviceAddress:usecase:completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 352))();
}

uint64_t dispatch thunk of HeadphoneProxFeatureManager.updateRecord(configs:deviceAddress:usecase:completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 360))();
}

uint64_t dispatch thunk of HeadphoneProxFeatureManager.shouldShowHeadGesturesCard(deviceAddress:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 368))();
}

uint64_t dispatch thunk of HeadphoneProxFeatureManager.setHeadGesturesConfig(deviceAddress:enabled:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 376))();
}

uint64_t dispatch thunk of HeadphoneProxFeatureManager.shouldShowWhatsNewCard(deviceAddress:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 384))();
}

uint64_t dispatch thunk of HeadphoneProxFeatureManager.shouldShowHeartRateMonitor(deviceAddress:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 392))();
}

uint64_t dispatch thunk of HeadphoneProxFeatureManager.getWhatsNewNotShowedFeatures(deviceAddress:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 400))();
}

uint64_t dispatch thunk of HeadphoneProxFeatureManager.hearingRecordWithDevice(for:feature:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 424))();
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for HeadphoneProxFeatureManager.HeadphoneProxFeature(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
  if (a2 + 4 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 4) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 4;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for HeadphoneProxFeatureManager.HeadphoneProxFeature(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *unint64_t result = a2 + 4;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x250D3AB90);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

uint64_t sub_250D3ABB8(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_250D3ABC4(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for HeadphoneProxFeatureManager.HeadphoneProxFeature()
{
  return &type metadata for HeadphoneProxFeatureManager.HeadphoneProxFeature;
}

uint64_t sub_250D3ABDC()
{
  return sub_250D3ABF4("HeadphoneProxFeatureService: Device Manager Interrupted");
}

uint64_t sub_250D3ABE8()
{
  return sub_250D3ABF4("HeadphoneProxFeatureService: Device Manager Invalidated");
}

uint64_t sub_250D3ABF4(const char *a1)
{
  if (qword_26B205160 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_250D3BE90();
  __swift_project_value_buffer(v2, (uint64_t)qword_26B205168);
  int v3 = sub_250D3BE70();
  os_log_type_t v4 = sub_250D3BF80();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_250D2C000, v3, v4, a1, v5, 2u);
    MEMORY[0x253387320](v5, -1, -1);
  }

  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v7 = result;
    unint64_t v8 = sub_250D2F8B8(MEMORY[0x263F8EE78], &qword_269B01CA8);
    swift_beginAccess();
    *(void *)(v7 + 16) = v8;
    swift_bridgeObjectRelease();
    return swift_release();
  }
  return result;
}

void sub_250D3AD44(void *a1)
{
  sub_250D2FD4C(a1, v1);
}

void sub_250D3AD4C(void *a1)
{
  if (qword_26B205160 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_250D3BE90();
  __swift_project_value_buffer(v2, (uint64_t)qword_26B205168);
  id v3 = a1;
  os_log_type_t v4 = sub_250D3BE70();
  os_log_type_t v5 = sub_250D3BF80();
  if (os_log_type_enabled(v4, v5))
  {
    unsigned int v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    int64_t v23 = v7;
    *(_DWORD *)unsigned int v6 = 136315138;
    id v8 = objc_msgSend(v3, sel_description);
    uint64_t v9 = sub_250D3BF00();
    unint64_t v11 = v10;

    sub_250D38FF4(v9, v11, (uint64_t *)&v23);
    sub_250D3BFB0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_250D2C000, v4, v5, "HeadphoneProxFeatureService: Device Lost: %s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253387320](v7, -1, -1);
    MEMORY[0x253387320](v6, -1, -1);
  }
  else
  {
  }
  id v12 = objc_msgSend(v3, sel_bluetoothAddress);
  if (v12)
  {
    unint64_t v13 = v12;
    uint64_t v14 = sub_250D3BF00();
    uint64_t v16 = v15;

    swift_beginAccess();
    id v17 = sub_250D3996C(v14, v16);
    swift_endAccess();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v18 = v3;
    id v17 = sub_250D3BE70();
    os_log_type_t v19 = sub_250D3BF70();
    if (os_log_type_enabled(v17, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      uint64_t v21 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v20 = 138412290;
      int64_t v23 = v18;
      os_log_type_t v22 = v18;
      sub_250D3BFB0();
      void *v21 = v18;

      _os_log_impl(&dword_250D2C000, v17, v19, "HeadphoneProxFeatureService: aad has no address %@", v20, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B205130);
      swift_arrayDestroy();
      MEMORY[0x253387320](v21, -1, -1);
      MEMORY[0x253387320](v20, -1, -1);
    }
    else
    {

      id v17 = v18;
    }
  }
}

uint64_t sub_250D3B0A0(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B01CC8);
    unint64_t v10 = (void *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    v10[2] = v8;
    uint64_t v10[3] = 2 * (v12 >> 4);
  }
  else
  {
    unint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = (unint64_t)(v10 + 4);
  unint64_t v14 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v13 >= v14 + 16 * v8) {
      memmove(v10 + 4, a4 + 4, 16 * v8);
    }
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 16 * v8 || v13 >= v14 + 16 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B01C88);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_250D3C050();
  __break(1u);
  return result;
}

uint64_t sub_250D3B22C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_250D3C050();
  __break(1u);
  return result;
}

char *sub_250D3B324(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  size_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = (char *)(a4 + a1 + 32);
    unint64_t v6 = &__dst[v4];
    if (v5 >= &__dst[v4] || &v5[v4] <= __dst)
    {
      memcpy(__dst, v5, v4);
      return v6;
    }
  }
  uint64_t result = (char *)sub_250D3C050();
  __break(1u);
  return result;
}

uint64_t sub_250D3B40C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_250D3B444()
{
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

void sub_250D3B48C(void *a1, uint64_t a2)
{
  uint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  unint64_t v5 = v2[5];
  unint64_t v6 = (id *)(v2[4] + 16);
  if (a2)
  {
    if (qword_26B205160 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_250D3BE90();
    __swift_project_value_buffer(v7, (uint64_t)qword_26B205168);
    swift_bridgeObjectRetain_n();
    uint64_t v8 = sub_250D3BE70();
    os_log_type_t v9 = sub_250D3BF80();
    if (os_log_type_enabled(v8, v9))
    {
      unint64_t v10 = (uint8_t *)swift_slowAlloc();
      uint64_t v11 = swift_slowAlloc();
      v32[0] = v11;
      *(_DWORD *)unint64_t v10 = 136315138;
      swift_bridgeObjectRetain();
      sub_250D38FF4(v4, v3, v32);
      sub_250D3BFB0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_250D2C000, v8, v9, "HeadphoneProxFeatureService: [%s] getProxCardInfoForDevice: Failed, Go with Target Info", v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x253387320](v11, -1, -1);
      MEMORY[0x253387320](v10, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    id v18 = objc_allocWithZone(MEMORY[0x263F28948]);
    swift_bridgeObjectRetain();
    os_log_type_t v19 = (void *)sub_250D3BEF0();
    swift_bridgeObjectRelease();
    id v20 = objc_msgSend(v18, sel_initWithBluetoothAddress_, v19);

    objc_msgSend(v20, sel_setHeadGesturesVersion_, 1);
    objc_msgSend(v20, sel_setVoiceQualityVersion_, 1);
    objc_msgSend(v20, sel_setWhatsNewVersion_, 2);
    objc_msgSend(v20, sel_setHeartRateVersion_, 1);
    objc_msgSend(v20, sel_setHearingAssistVersion_, 1);
    swift_beginAccess();
    id v21 = *v6;
    *unint64_t v6 = v20;
  }
  else if (a1)
  {
    if (qword_26B205160 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_250D3BE90();
    __swift_project_value_buffer(v13, (uint64_t)qword_26B205168);
    swift_bridgeObjectRetain_n();
    unint64_t v14 = sub_250D3BE70();
    os_log_type_t v15 = sub_250D3BF80();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      v32[0] = v17;
      *(_DWORD *)uint64_t v16 = 136315138;
      swift_bridgeObjectRetain();
      sub_250D38FF4(v4, v3, v32);
      sub_250D3BFB0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_250D2C000, v14, v15, "HeadphoneProxFeatureService: [%s] getProxCardInfoForDevice: Prox Card Info Retrieved", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x253387320](v17, -1, -1);
      MEMORY[0x253387320](v16, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    swift_beginAccess();
    id v21 = *v6;
    *unint64_t v6 = a1;
    id v27 = a1;
  }
  else
  {
    if (qword_26B205160 != -1) {
      swift_once();
    }
    uint64_t v22 = sub_250D3BE90();
    __swift_project_value_buffer(v22, (uint64_t)qword_26B205168);
    swift_bridgeObjectRetain_n();
    int64_t v23 = sub_250D3BE70();
    os_log_type_t v24 = sub_250D3BF80();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      uint64_t v26 = swift_slowAlloc();
      v32[0] = v26;
      *(_DWORD *)uint64_t v25 = 136315138;
      swift_bridgeObjectRetain();
      sub_250D38FF4(v4, v3, v32);
      sub_250D3BFB0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_250D2C000, v23, v24, "HeadphoneProxFeatureService: [%s] getProxCardInfoForDevice: Prox Card Info NOT Existing, Go with Default Info", v25, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x253387320](v26, -1, -1);
      MEMORY[0x253387320](v25, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    id v28 = objc_allocWithZone(MEMORY[0x263F28948]);
    swift_bridgeObjectRetain();
    uint64_t v29 = (void *)sub_250D3BEF0();
    swift_bridgeObjectRelease();
    id v30 = objc_msgSend(v28, sel_initWithBluetoothAddress_, v29);

    objc_msgSend(v30, sel_setHeadGesturesVersion_, 0);
    objc_msgSend(v30, sel_setVoiceQualityVersion_, 0);
    objc_msgSend(v30, sel_setWhatsNewVersion_, 0);
    objc_msgSend(v30, sel_setHeartRateVersion_, 0);
    objc_msgSend(v30, sel_setHearingAssistVersion_, 0);
    swift_beginAccess();
    id v21 = *v6;
    *unint64_t v6 = v30;
  }

  swift_beginAccess();
  id v31 = *v6;
  sub_250D37394();

  dispatch_group_leave(v5);
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_250D3BB48(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_250D3BC08(uint64_t a1, unint64_t *a2)
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

uint64_t sub_250D3BC44()
{
  if (qword_26B205160 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_250D3BE90();
  __swift_project_value_buffer(v0, (uint64_t)qword_26B205168);
  uint64_t v1 = sub_250D3BE70();
  os_log_type_t v2 = sub_250D3BF80();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_250D2C000, v1, v2, "HeadphoneProxFeatureService: audioaccessoryd started", v3, 2u);
    MEMORY[0x253387320](v3, -1, -1);
  }

  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = MEMORY[0x263F8EE78];
    unint64_t v7 = sub_250D2F8B8(MEMORY[0x263F8EE78], &qword_269B01CA8);
    swift_beginAccess();
    *(void *)(v5 + 16) = v7;
    swift_bridgeObjectRelease();
    unint64_t v8 = sub_250D2F8B8(v6, (uint64_t *)&unk_269B01CD0);
    swift_beginAccess();
    *(void *)(v5 + 24) = v8;
    swift_bridgeObjectRelease();
    objc_msgSend(*(id *)(v5 + 80), sel_invalidate);
    objc_msgSend(*(id *)(v5 + 32), sel_invalidate);
    sub_250D2F9D0();
    HeadphoneProxFeatureManager.configHearingModeClient()();
    return swift_release();
  }
  return result;
}

uint64_t sub_250D3BE70()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_250D3BE80()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_250D3BE90()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_250D3BEA0()
{
  return MEMORY[0x270FA0988]();
}

uint64_t sub_250D3BEB0()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_250D3BEC0()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_250D3BED0()
{
  return MEMORY[0x270FA0BC8]();
}

uint64_t sub_250D3BEE0()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_250D3BEF0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_250D3BF00()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_250D3BF10()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_250D3BF20()
{
  return MEMORY[0x270F9D610]();
}

uint64_t sub_250D3BF30()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_250D3BF40()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_250D3BF50()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_250D3BF60()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_250D3BF70()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_250D3BF80()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_250D3BF90()
{
  return MEMORY[0x270FA0C08]();
}

uint64_t sub_250D3BFA0()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_250D3BFB0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_250D3BFC0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_250D3BFD0()
{
  return MEMORY[0x270F9E658]();
}

uint64_t sub_250D3BFE0()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_250D3BFF0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_250D3C000()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_250D3C010()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_250D3C020()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_250D3C030()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_250D3C040()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_250D3C050()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_250D3C060()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_250D3C070()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_250D3C080()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_250D3C090()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_250D3C0A0()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_250D3C0B0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_250D3C0C0()
{
  return MEMORY[0x270F9FC90]();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x270EE4C90](applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

void bzero(void *a1, size_t a2)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x270FA0648]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x270FA0650]();
}