uint64_t AirDropSettingsState.discoverableMode.getter()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_2477EFE20();
  sub_2477F1400();
  swift_release();
  return *(void *)(v0 + OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_effectiveDiscoverableMode);
}

uint64_t sub_2477EFCC0@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_2477EFE20();
  sub_2477F1400();
  uint64_t result = swift_release();
  *a2 = *(void *)(v3 + OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_effectiveDiscoverableMode);
  return result;
}

void *sub_2477EFD40(void *result, void *a2)
{
  if (*(void *)(*a2 + OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_effectiveDiscoverableMode) != *result)
  {
    swift_getKeyPath();
    MEMORY[0x270FA5388]();
    sub_2477EFE20();
    sub_2477F13F0();
    return (void *)swift_release();
  }
  return result;
}

unint64_t sub_2477EFE20()
{
  unint64_t result = qword_26B130B60;
  if (!qword_26B130B60)
  {
    type metadata accessor for AirDropSettingsState();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B130B60);
  }
  return result;
}

uint64_t type metadata accessor for AirDropSettingsState()
{
  uint64_t result = qword_26B130BC0;
  if (!qword_26B130BC0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t AirDropSettingsState.discoverableMode.setter(uint64_t result)
{
  if (*(void *)(v1 + OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_effectiveDiscoverableMode) != result)
  {
    swift_getKeyPath();
    MEMORY[0x270FA5388]();
    sub_2477EFE20();
    sub_2477F13F0();
    return swift_release();
  }
  return result;
}

void (*AirDropSettingsState.discoverableMode.modify(void *a1))(uint64_t **a1, char a2)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[2] = v1;
  swift_getKeyPath();
  v3[3] = OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState___observationRegistrar;
  v3[1] = v1;
  v3[4] = sub_2477EFE20();
  sub_2477F1400();
  swift_release();
  uint64_t v4 = *(void *)(v1 + OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_effectiveDiscoverableMode);
  v3[5] = OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_effectiveDiscoverableMode;
  *uint64_t v3 = v4;
  return sub_2477F0064;
}

void sub_2477F0064(uint64_t **a1, char a2)
{
  v2 = *a1;
  uint64_t v3 = (*a1)[2];
  uint64_t v4 = **a1;
  uint64_t v5 = *(void *)(v3 + (*a1)[5]);
  if (a2)
  {
    if (v5 != v4) {
      goto LABEL_5;
    }
  }
  else if (v5 != v4)
  {
LABEL_5:
    swift_getKeyPath();
    MEMORY[0x270FA5388]();
    v2[1] = v3;
    sub_2477F13F0();
    swift_release();
  }
  free(v2);
}

uint64_t AirDropSettingsState.isNearbySharingEnabled.getter()
{
  return sub_2477F05D4((uint64_t)&unk_2477F1668, &OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_effectiveIsNearbySharingEnabled);
}

uint64_t sub_2477F01CC@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  return sub_2477F0658(a1, &OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_effectiveIsNearbySharingEnabled, a2);
}

unsigned __int8 *sub_2477F01E0(unsigned __int8 *result, void *a2)
{
  if (*result != *(unsigned __int8 *)(*a2
                                     + OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_effectiveIsNearbySharingEnabled))
  {
    swift_getKeyPath();
    MEMORY[0x270FA5388]();
    sub_2477EFE20();
    sub_2477F13F0();
    return (unsigned __int8 *)swift_release();
  }
  return result;
}

uint64_t AirDropSettingsState.isNearbySharingEnabled.setter(uint64_t result)
{
  if (*(unsigned char *)(v1 + OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_effectiveIsNearbySharingEnabled) != (result & 1))
  {
    swift_getKeyPath();
    MEMORY[0x270FA5388]();
    sub_2477EFE20();
    sub_2477F13F0();
    return swift_release();
  }
  return result;
}

void (*AirDropSettingsState.isNearbySharingEnabled.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[1] = v1;
  swift_getKeyPath();
  v3[2] = OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState___observationRegistrar;
  *uint64_t v3 = v1;
  v3[3] = sub_2477EFE20();
  sub_2477F1400();
  swift_release();
  uint64_t v4 = OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_effectiveIsNearbySharingEnabled;
  *((unsigned char *)v3 + 40) = *(unsigned char *)(v1
                                 + OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_effectiveIsNearbySharingEnabled);
  v3[4] = v4;
  return sub_2477F0464;
}

void sub_2477F0464(uint64_t a1, char a2)
{
  v2 = *(void **)a1;
  uint64_t v3 = *(void *)(*(void *)a1 + 8);
  unsigned __int8 v4 = *(unsigned char *)(*(void *)a1 + 40);
  if (a2)
  {
    if ((v4 ^ *(unsigned char *)(v3 + *(void *)(*(void *)a1 + 32)))) {
      goto LABEL_5;
    }
  }
  else if ((v4 ^ *(unsigned char *)(v3 + *(void *)(*(void *)a1 + 32))))
  {
LABEL_5:
    swift_getKeyPath();
    MEMORY[0x270FA5388]();
    void *v2 = v3;
    sub_2477F13F0();
    swift_release();
  }
  free(v2);
}

uint64_t AirDropSettingsState.isCellularUsageEnabled.getter()
{
  return sub_2477F05D4((uint64_t)&unk_2477F1690, &OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_effectiveIsCellularUsageEnabled);
}

uint64_t sub_2477F05D4(uint64_t a1, void *a2)
{
  swift_getKeyPath();
  sub_2477EFE20();
  sub_2477F1400();
  swift_release();
  return *(unsigned __int8 *)(v2 + *a2);
}

uint64_t sub_2477F0644@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  return sub_2477F0658(a1, &OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_effectiveIsCellularUsageEnabled, a2);
}

uint64_t sub_2477F0658@<X0>(uint64_t *a1@<X0>, void *a2@<X4>, unsigned char *a3@<X8>)
{
  uint64_t v5 = *a1;
  swift_getKeyPath();
  sub_2477EFE20();
  sub_2477F1400();
  uint64_t result = swift_release();
  *a3 = *(unsigned char *)(v5 + *a2);
  return result;
}

unsigned __int8 *sub_2477F06DC(unsigned __int8 *result, void *a2)
{
  if (*result != *(unsigned __int8 *)(*a2
                                     + OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_effectiveIsCellularUsageEnabled))
  {
    swift_getKeyPath();
    MEMORY[0x270FA5388]();
    sub_2477EFE20();
    sub_2477F13F0();
    return (unsigned __int8 *)swift_release();
  }
  return result;
}

uint64_t AirDropSettingsState.isCellularUsageEnabled.setter(uint64_t result)
{
  if (*(unsigned char *)(v1 + OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_effectiveIsCellularUsageEnabled) != (result & 1))
  {
    swift_getKeyPath();
    MEMORY[0x270FA5388]();
    sub_2477EFE20();
    sub_2477F13F0();
    return swift_release();
  }
  return result;
}

void (*AirDropSettingsState.isCellularUsageEnabled.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[1] = v1;
  swift_getKeyPath();
  v3[2] = OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState___observationRegistrar;
  *uint64_t v3 = v1;
  v3[3] = sub_2477EFE20();
  sub_2477F1400();
  swift_release();
  uint64_t v4 = OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_effectiveIsCellularUsageEnabled;
  *((unsigned char *)v3 + 40) = *(unsigned char *)(v1
                                 + OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_effectiveIsCellularUsageEnabled);
  v3[4] = v4;
  return sub_2477F0960;
}

void sub_2477F0960(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void *)(*(void *)a1 + 8);
  unsigned __int8 v4 = *(unsigned char *)(*(void *)a1 + 40);
  if (a2)
  {
    if ((v4 ^ *(unsigned char *)(v3 + *(void *)(*(void *)a1 + 32)))) {
      goto LABEL_5;
    }
  }
  else if ((v4 ^ *(unsigned char *)(v3 + *(void *)(*(void *)a1 + 32))))
  {
LABEL_5:
    swift_getKeyPath();
    MEMORY[0x270FA5388]();
    void *v2 = v3;
    sub_2477F13F0();
    swift_release();
  }
  free(v2);
}

id AirDropSettingsState.isNearbySharingSupported.getter()
{
  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_airDropDiscoveryController), sel_isNearbySharingSupported);
}

id AirDropSettingsState.isTimeLimitedEveryoneMode.getter()
{
  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_airDropDiscoveryController), sel_isTimeLimitedEveryoneMode);
}

id sub_2477F0B14()
{
  id result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for AirDropSettingsState()), sel_init);
  qword_26B130C68 = (uint64_t)result;
  return result;
}

id AirDropSettingsState.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id static AirDropSettingsState.shared.getter()
{
  if (qword_26B130BB0 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_26B130C68;
  return v0;
}

id AirDropSettingsState.init()()
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = v0;
  sub_2477F1410();
  id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6C458]), sel_init);
  id v4 = objc_msgSend(v3, sel_discoverableMode);
  *(void *)&v2[OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_effectiveDiscoverableMode] = v4;
  unsigned __int8 v5 = objc_msgSend(v3, sel_isNearbySharingEnabled);
  v2[OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_effectiveIsNearbySharingEnabled] = v5;
  unsigned __int8 v6 = objc_msgSend(v3, sel_isCellularUsageEnabled);
  v2[OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_effectiveIsCellularUsageEnabled] = v6;
  *(void *)&v2[OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_airDropDiscoveryController] = v3;
  id v7 = v3;

  v10.receiver = v2;
  v10.super_class = ObjectType;
  id v8 = objc_msgSendSuper2(&v10, sel_init);
  objc_msgSend(v7, sel_setDelegate_, v8);
  objc_msgSend(v7, sel_startNFCMonitoring);

  return v8;
}

id AirDropSettingsState.__deallocating_deinit()
{
  ObjectType = (objc_class *)swift_getObjectType();
  objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_airDropDiscoveryController], sel_invalidate);
  v3.receiver = v0;
  v3.super_class = ObjectType;
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

id sub_2477F0E68(void *a1)
{
  id v3 = objc_msgSend(a1, sel_discoverableMode);
  if (*(id *)(v1 + OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_effectiveDiscoverableMode) != v3)
  {
    swift_getKeyPath();
    MEMORY[0x270FA5388]();
    sub_2477EFE20();
    sub_2477F13F0();
    swift_release();
  }
  unsigned int v4 = objc_msgSend(a1, sel_isNearbySharingEnabled);
  if (v4 != *(unsigned __int8 *)(v1
                                + OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_effectiveIsNearbySharingEnabled))
  {
    swift_getKeyPath();
    MEMORY[0x270FA5388]();
    sub_2477EFE20();
    sub_2477F13F0();
    swift_release();
  }
  id result = objc_msgSend(a1, sel_isCellularUsageEnabled);
  if (result != *(unsigned __int8 *)(v1
                                            + OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_effectiveIsCellularUsageEnabled))
  {
    swift_getKeyPath();
    MEMORY[0x270FA5388]();
    sub_2477EFE20();
    sub_2477F13F0();
    return (id)swift_release();
  }
  return result;
}

void *_s22AirDropSettingsSupport0abC5StateC019discoveryControllerC9DidChangeyySo05SFAirb9DiscoveryG0CSgF_0(void *a1)
{
  if (a1) {
    return sub_2477F0E68(a1);
  }
  __break(1u);
  return a1;
}

BOOL sub_2477F1144(void *a1, void *a2)
{
  return *a1 == *a2;
}

void *sub_2477F1158@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_2477F1168(void *a1@<X8>)
{
  *a1 = *v1;
}

id sub_2477F1174()
{
  return sub_2477F1378();
}

id sub_2477F118C()
{
  return sub_2477F1304(&OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_effectiveIsNearbySharingEnabled, (SEL *)&selRef_isNearbySharingEnabled, (SEL *)&selRef_setNearbySharingEnabled_);
}

id sub_2477F11BC()
{
  return sub_2477F1304(&OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_effectiveIsCellularUsageEnabled, (SEL *)&selRef_isCellularUsageEnabled, (SEL *)&selRef_setCellularUsageEnabled_);
}

uint64_t sub_2477F11EC()
{
  return type metadata accessor for AirDropSettingsState();
}

uint64_t sub_2477F11F4()
{
  uint64_t result = sub_2477F1420();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

void type metadata accessor for SFAirDropDiscoverableMode()
{
  if (!qword_26B130B70[0])
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, qword_26B130B70);
    }
  }
}

id sub_2477F1304(uint64_t *a1, SEL *a2, SEL *a3)
{
  uint64_t v5 = *(void *)(v3 + 16);
  int v6 = *(unsigned __int8 *)(v3 + 24);
  uint64_t v7 = *a1;
  *(unsigned char *)(v5 + *a1) = v6;
  uint64_t v8 = OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_airDropDiscoveryController;
  id result = [*(id *)(v5 + OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_airDropDiscoveryController) *a2];
  if (v6 != result) {
    return objc_msgSend(*(id *)(v5 + v8), *a3, *(unsigned __int8 *)(v5 + v7));
  }
  return result;
}

id sub_2477F1378()
{
  uint64_t v1 = *(void *)(v0 + 16);
  id v2 = *(id *)(v0 + 24);
  uint64_t v3 = OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_effectiveDiscoverableMode;
  *(void *)(v1 + OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_effectiveDiscoverableMode) = v2;
  uint64_t v4 = OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_airDropDiscoveryController;
  id result = objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC22AirDropSettingsSupport20AirDropSettingsState_airDropDiscoveryController), sel_discoverableMode);
  if (result != v2) {
    return objc_msgSend(*(id *)(v1 + v4), sel_setDiscoverableMode_, *(void *)(v1 + v3));
  }
  return result;
}

uint64_t sub_2477F13F0()
{
  return MEMORY[0x270FA11F8]();
}

uint64_t sub_2477F1400()
{
  return MEMORY[0x270FA1208]();
}

uint64_t sub_2477F1410()
{
  return MEMORY[0x270FA1238]();
}

uint64_t sub_2477F1420()
{
  return MEMORY[0x270FA1250]();
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}