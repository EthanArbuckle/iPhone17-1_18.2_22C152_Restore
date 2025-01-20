uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
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

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
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

void sub_24D1B7DD0(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_24D1B7DD8@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_24D1B7DF4(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_24D1B7E14(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CLLocationCoordinate2D()
{
  if (!qword_26985BAE8)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_26985BAE8);
    }
  }
}

uint64_t EnergySite.identifier.getter()
{
  id v1 = *(id *)(v0 + 16);
  uint64_t v2 = sub_24D218E60();

  return v2;
}

uint64_t EnergySite.name.getter()
{
  id v1 = *(id *)(v0 + 16);
  uint64_t v2 = sub_24D218E90();

  return v2;
}

void sub_24D1B7F24(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = *(id *)(*(void *)a1 + 16);
  uint64_t v4 = sub_24D218E90();
  uint64_t v6 = v5;

  *a2 = v4;
  a2[1] = v6;
}

void sub_24D1B7F70(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(*(void *)a2 + 16);
  swift_bridgeObjectRetain();
  id v3 = v2;
  sub_24D218EA0();
}

void EnergySite.name.setter()
{
  id v1 = *(id *)(v0 + 16);
  sub_24D218EA0();
}

void (*EnergySite.name.modify(uint64_t *a1))(uint64_t a1, char a2)
{
  a1[2] = v1;
  id v3 = *(id *)(v1 + 16);
  uint64_t v4 = sub_24D218E90();
  uint64_t v6 = v5;

  *a1 = v4;
  a1[1] = v6;
  return sub_24D1B80B0;
}

void sub_24D1B80B0(uint64_t a1, char a2)
{
  id v4 = *(id *)(*(void *)(a1 + 16) + 16);
  if (a2)
  {
    swift_bridgeObjectRetain();
    id v2 = v4;
    sub_24D218EA0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v3 = v4;
    sub_24D218EA0();
  }
}

void *EnergySite.location.getter()
{
  id v1 = *(id *)(v0 + 16);
  id v2 = (void *)sub_24D218E80();

  if (v2)
  {
    objc_msgSend(v2, sel_coordinate);
    if (!CLLocationCoordinate2DIsValid(v4))
    {

      return 0;
    }
  }
  return v2;
}

uint64_t EnergySite.timeZone.getter()
{
  id v1 = *(id *)(v0 + 16);
  uint64_t v2 = sub_24D218EB0();

  return v2;
}

uint64_t EnergySite.timezone.getter()
{
  id v1 = *(id *)(v0 + 16);
  uint64_t v2 = sub_24D218EB0();

  return v2;
}

uint64_t EnergySite.gridID.getter()
{
  *(void *)(v1 + 32) = v0;
  return MEMORY[0x270FA2498](sub_24D1B8254, 0, 0);
}

uint64_t sub_24D1B8254()
{
  id v1 = *(id *)(v0[4] + 16);
  uint64_t v2 = (void *)sub_24D218E80();
  v0[5] = v2;

  if (v2)
  {
    objc_msgSend(v2, sel_coordinate);
    if (CLLocationCoordinate2DIsValid(v13))
    {
      if (qword_26B18A590 != -1) {
        swift_once();
      }
      objc_msgSend(v2, sel_coordinate);
      uint64_t v4 = v3;
      uint64_t v6 = v5;
      uint64_t v7 = swift_task_alloc();
      v0[6] = v7;
      *(void *)(v7 + 16) = v4;
      *(void *)(v7 + 24) = v6;
      v8 = (void *)swift_task_alloc();
      v0[7] = v8;
      uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BAF8);
      void *v8 = v0;
      v8[1] = sub_24D1B8424;
      return MEMORY[0x270FA2360](v0 + 2, 0, 0, 0xD000000000000010, 0x800000024D21B600, sub_24D1B8D30, v7, v9);
    }
  }
  v10 = (uint64_t (*)(void, void))v0[1];
  return v10(0, 0);
}

uint64_t sub_24D1B8424()
{
  *(void *)(*(void *)v1 + 64) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_24D1B85AC;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_24D1B8540;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D1B8540()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v1 = *(void *)(v0 + 24);

  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return v3(v2, v1);
}

uint64_t sub_24D1B85AC()
{
  uint64_t v1 = *(void **)(v0 + 40);

  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void, void))(v0 + 8);
  return v2(0, 0);
}

uint64_t EnergySite.ckZoneName.getter()
{
  id v1 = *(id *)(v0 + 16);
  uint64_t v2 = sub_24D218D10();

  return v2;
}

BOOL EnergySite.cloudkitEnabled.getter()
{
  id v1 = *(id *)(v0 + 16);
  uint64_t v2 = sub_24D218D10();
  unint64_t v4 = v3;

  swift_bridgeObjectRelease();
  uint64_t v5 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    uint64_t v5 = v2 & 0xFFFFFFFFFFFFLL;
  }
  return v5 != 0;
}

uint64_t EnergySite.utilitySubscriptionID.getter()
{
  id v1 = *(id *)(v0 + 16);
  uint64_t v2 = sub_24D218D80();
  unint64_t v4 = v3;

  if (v4)
  {
    uint64_t v5 = HIBYTE(v4) & 0xF;
    if ((v4 & 0x2000000000000000) == 0) {
      uint64_t v5 = v2 & 0xFFFFFFFFFFFFLL;
    }
    if (!v5)
    {
      swift_bridgeObjectRelease();
      return 0;
    }
  }
  return v2;
}

BOOL EnergySite.utilityOnboarded.getter()
{
  id v1 = *(id *)(v0 + 16);
  uint64_t v2 = sub_24D218D80();
  unint64_t v4 = v3;

  if (!v4) {
    return 0;
  }
  swift_bridgeObjectRelease();
  uint64_t v5 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    uint64_t v5 = v2 & 0xFFFFFFFFFFFFLL;
  }
  return v5 != 0;
}

uint64_t EnergySite.subscriptionErrorState.getter()
{
  id v1 = *(id *)(v0 + 16);
  uint64_t v2 = sub_24D218E40();

  return v2;
}

uint64_t EnergySite.subscriptionState.getter()
{
  id v1 = *(id *)(v0 + 16);
  uint64_t v2 = sub_24D218E40();

  return v2;
}

void EnergySite.accessTokenExpirationDate.getter()
{
  id v1 = *(id *)(v0 + 16);
  sub_24D218E20();
}

uint64_t EnergySite.accessToken.getter()
{
  id v1 = *(id *)(v0 + 16);
  uint64_t v2 = sub_24D218D20();

  return v2;
}

uint64_t EnergySite.refreshToken.getter()
{
  id v1 = *(id *)(v0 + 16);
  uint64_t v2 = sub_24D218D50();

  return v2;
}

uint64_t EnergySite.ckFunctionToken.getter()
{
  id v1 = *(id *)(v0 + 16);
  uint64_t v2 = sub_24D218D90();

  return v2;
}

uint64_t EnergySite.accountName.getter()
{
  id v1 = *(id *)(v0 + 16);
  uint64_t v2 = sub_24D218D30();

  return v2;
}

uint64_t EnergySite.accountNumber.getter()
{
  id v1 = *(id *)(v0 + 16);
  uint64_t v2 = sub_24D218D60();

  return v2;
}

uint64_t EnergySite.serviceAddress.getter()
{
  id v1 = *(id *)(v0 + 16);
  uint64_t v2 = sub_24D218E70();

  return v2;
}

uint64_t EnergySite.serviceLocationID.getter()
{
  id v1 = *(id *)(v0 + 16);
  uint64_t v2 = sub_24D218DC0();

  return v2;
}

uint64_t EnergySite.utilityID.getter()
{
  id v1 = *(id *)(v0 + 16);
  uint64_t v2 = sub_24D218EC0();

  return v2;
}

uint64_t EnergySite.alternateSupplier.getter()
{
  id v1 = *(id *)(v0 + 16);
  uint64_t v2 = sub_24D218DB0();

  return v2;
}

void EnergySite.utilitySupportedCheckDate.getter()
{
  id v1 = *(id *)(v0 + 16);
  sub_24D218E30();
}

uint64_t EnergySite.hasExportedEnergy.getter()
{
  id v1 = *(id *)(v0 + 16);
  char v2 = sub_24D218D00();

  return v2 & 1;
}

void EnergySite.subscriptionCreationDate.getter()
{
  id v1 = *(id *)(v0 + 16);
  sub_24D218E10();
}

void EnergySite.subscriptionStartDate.getter()
{
  id v1 = *(id *)(v0 + 16);
  sub_24D218E00();
}

void EnergySite.siteTombstone.getter()
{
  id v1 = *(id *)(v0 + 16);
  sub_24D218D70();
}

uint64_t EnergySite.siteVersion.getter()
{
  id v1 = *(id *)(v0 + 16);
  uint64_t v2 = sub_24D218D40();

  return v2;
}

void EnergySite.amiLastRefreshDate.getter()
{
  id v1 = *(id *)(v0 + 16);
  sub_24D218DE0();
}

uint64_t sub_24D1B8D30(uint64_t a1)
{
  return sub_24D1F46BC(a1, *(double *)(v1 + 16), *(double *)(v1 + 24));
}

uint64_t sub_24D1B8D60()
{
  swift_beginAccess();
  return MEMORY[0x253322B70](v0 + 48);
}

uint64_t sub_24D1B8DA8(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(void *)(v2 + 56) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*sub_24D1B8E0C(void *a1))(uint64_t a1, char a2)
{
  unint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[5] = v1;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x253322B70](v1 + 48);
  uint64_t v5 = *(void *)(v1 + 56);
  v3[3] = v4;
  v3[4] = v5;
  return sub_24D1B8E8C;
}

void sub_24D1B8E8C(uint64_t a1, char a2)
{
  unint64_t v3 = *(void **)a1;
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

uint64_t EnergySite.__allocating_init(siteID:)(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_26985BB08 + dword_26985BB08);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24D1B8FC4;
  return v7(a1, a2);
}

uint64_t sub_24D1B8FC4(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  unint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t EnergySite.__allocating_init(clientProvidedID:)(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  uint64_t v3 = sub_24D218B10();
  v2[4] = v3;
  v2[5] = *(void *)(v3 - 8);
  v2[6] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D1B9180, 0, 0);
}

uint64_t sub_24D1B9180()
{
  unint64_t v1 = v0[3];
  uint64_t v2 = HIBYTE(v1) & 0xF;
  if ((v1 & 0x2000000000000000) == 0) {
    uint64_t v2 = v0[2] & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    uint64_t v4 = v0[5];
    uint64_t v3 = v0[6];
    uint64_t v5 = v0[4];
    sub_24D219110();
    sub_24D218ED0();
    sub_24D218DD0();
    sub_24D218AD0();
    uint64_t v6 = sub_24D218AE0();
    uint64_t v8 = v7;
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    swift_bridgeObjectRelease();
    uint64_t v12 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_26985BB08 + dword_26985BB08);
    uint64_t v9 = (void *)swift_task_alloc();
    v0[7] = v9;
    *uint64_t v9 = v0;
    v9[1] = sub_24D1B9318;
    return v12(v6, v8);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    v11 = (uint64_t (*)(void))v0[1];
    return v11(0);
  }
}

uint64_t sub_24D1B9318(uint64_t a1)
{
  *(void *)(*(void *)v1 + 64) = a1;
  swift_task_dealloc();
  swift_retain();
  return MEMORY[0x270FA2498](sub_24D1B9428, 0, 0);
}

uint64_t sub_24D1B9428()
{
  if (*(void *)(v0 + 64))
  {
    swift_release();
    uint64_t v1 = *(void *)(v0 + 64);
  }
  else
  {
    uint64_t v1 = 0;
  }
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t static EnergySite.generateSiteID(clientID:)()
{
  uint64_t v0 = sub_24D218B10();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24D219110();
  sub_24D218ED0();
  sub_24D218DD0();
  sub_24D218AD0();
  uint64_t v4 = sub_24D218AE0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v4;
}

uint64_t sub_24D1B95C0(uint64_t a1)
{
  v2[8] = a1;
  v2[9] = v1;
  uint64_t v3 = sub_24D219020();
  v2[10] = v3;
  v2[11] = *(void *)(v3 - 8);
  v2[12] = swift_task_alloc();
  v2[13] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D1B9690, 0, 0);
}

uint64_t sub_24D1B9690()
{
  v46 = v0;
  if (qword_26B18A2F8 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[4].i64[0];
  uint64_t v2 = v0[6].i64[1];
  uint64_t v3 = v0[5].i64[0];
  uint64_t v4 = v0[5].i64[1];
  uint64_t v5 = __swift_project_value_buffer(v3, (uint64_t)qword_26B18A8F0);
  swift_beginAccess();
  v42 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v42(v2, v5, v3);
  swift_retain_n();
  id v6 = v1;
  log = sub_24D219000();
  os_log_type_t type = sub_24D2192C0();
  BOOL v7 = os_log_type_enabled(log, type);
  uint64_t v8 = v0[6].i64[1];
  uint64_t v10 = v0[5].i64[0];
  uint64_t v9 = v0[5].i64[1];
  v11 = (void *)v0[4].i64[0];
  uint64_t v12 = v0[4].i64[1];
  if (v7)
  {
    uint64_t v13 = swift_slowAlloc();
    v38 = (void *)swift_slowAlloc();
    uint64_t v39 = swift_slowAlloc();
    uint64_t v45 = v39;
    *(_DWORD *)uint64_t v13 = 136315394;
    uint64_t v41 = v9;
    id v14 = *(id *)(v12 + 16);
    uint64_t v40 = v10;
    uint64_t v15 = v5;
    uint64_t v16 = sub_24D218E90();
    unint64_t v18 = v17;

    uint64_t v19 = v16;
    uint64_t v5 = v15;
    v0[3].i64[0] = sub_24D1D0A78(v19, v18, &v45);
    sub_24D219310();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 12) = 2112;
    v0[3].i64[1] = (uint64_t)v11;
    id v20 = v11;
    sub_24D219310();
    void *v38 = v11;

    _os_log_impl(&dword_24D1B6000, log, type, "update location for site %s to %@", (uint8_t *)v13, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(qword_26985BB28);
    swift_arrayDestroy();
    MEMORY[0x253322AA0](v38, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x253322AA0](v39, -1, -1);
    MEMORY[0x253322AA0](v13, -1, -1);

    v21 = *(void (**)(uint64_t, uint64_t))(v41 + 8);
    v21(v8, v40);
  }
  else
  {

    swift_release_n();
    v21 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
    v21(v8, v10);
  }
  id v22 = *(id *)(v0[4].i64[1] + 16);
  uint64_t v23 = sub_24D218E60();
  unint64_t v25 = v24;

  swift_bridgeObjectRelease();
  uint64_t v26 = HIBYTE(v25) & 0xF;
  if ((v25 & 0x2000000000000000) == 0) {
    uint64_t v26 = v23 & 0xFFFFFFFFFFFFLL;
  }
  if (v26)
  {
    v27 = (int8x16_t *)swift_task_alloc();
    v0[7].i64[0] = (uint64_t)v27;
    v27[1] = vextq_s8(v0[4], v0[4], 8uLL);
    v28 = (void *)swift_task_alloc();
    v0[7].i64[1] = (uint64_t)v28;
    uint64_t v29 = sub_24D218ED0();
    void *v28 = v0;
    v28[1] = sub_24D1B9BD8;
    return MEMORY[0x270FA2360](&v0[2].u64[1], 0, 0, 0xD000000000000012, 0x800000024D21B620, sub_24D1D5A60, v27, v29);
  }
  else
  {
    v42(v0[6].i64[0], v5, v0[5].i64[0]);
    v30 = sub_24D219000();
    os_log_type_t v31 = sub_24D2192D0();
    if (os_log_type_enabled(v30, v31))
    {
      v32 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v32 = 0;
      _os_log_impl(&dword_24D1B6000, v30, v31, "Failed to update location. Site ID is empty.", v32, 2u);
      MEMORY[0x253322AA0](v32, -1, -1);
    }
    uint64_t v33 = v0[6].i64[0];
    uint64_t v34 = v0[5].i64[0];

    v21(v33, v34);
    sub_24D1D5A68();
    swift_allocError();
    unsigned char *v35 = 28;
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    v36 = (uint64_t (*)(void))v0->i64[1];
    return v36();
  }
}

uint64_t sub_24D1B9BD8()
{
  *(void *)(*(void *)v1 + 128) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_24D1B9D78;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_24D1B9CF4;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D1B9CF4()
{
  uint64_t v1 = v0[9];
  uint64_t v2 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = v0[5];

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_24D1B9D78()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24D1B9DEC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BE50);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5B0);
  MEMORY[0x270FA5388]();
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_24D219240();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  unint64_t v13 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  unint64_t v14 = (v8 + v13 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = 0;
  *(void *)(v15 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v15 + v13, v9, v6);
  *(void *)(v15 + v14) = a2;
  *(void *)(v15 + ((v14 + 15) & 0xFFFFFFFFFFFFFFF8)) = a3;
  swift_retain();
  id v16 = a3;
  sub_24D1BA610((uint64_t)v11, (uint64_t)&unk_26985BEF0, v15);
  return swift_release();
}

uint64_t sub_24D1B9FEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[19] = a5;
  v6[20] = a6;
  v6[18] = a4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BE50);
  v6[21] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v6[22] = v8;
  v6[23] = *(void *)(v8 + 64);
  v6[24] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D1BA0BC, 0, 0);
}

uint64_t sub_24D1BA0BC()
{
  uint64_t v1 = v0[24];
  uint64_t v3 = v0[21];
  uint64_t v2 = v0[22];
  uint64_t v4 = v0[19];
  uint64_t v13 = v0[20];
  uint64_t v5 = v0[18];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[25] = sub_24D217288();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v5, v3);
  unint64_t v6 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v7 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v2 + 32))(v7 + v6, v1, v3);
  uint64_t v8 = (void *)sub_24D217944((uint64_t)sub_24D1DCD88, v7);
  v0[26] = v8;
  swift_release();
  id v9 = *(id *)(v4 + 16);
  sub_24D218E60();

  uint64_t v10 = sub_24D2190E0();
  v0[27] = v10;
  swift_bridgeObjectRelease();
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_24D1BA2D8;
  uint64_t v11 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_24D1BA550;
  v0[13] = &block_descriptor_241;
  v0[14] = v11;
  objc_msgSend(v8, sel_updateLocationWithSiteID_location_completionHandler_, v10, v13);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_24D1BA2D8()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 224) = v1;
  if (v1) {
    uint64_t v2 = sub_24D1BA49C;
  }
  else {
    uint64_t v2 = sub_24D1BA3E8;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D1BA3E8()
{
  uint64_t v1 = (void *)v0[27];
  uint64_t v2 = v0[25];
  uint64_t v3 = v0[15];
  swift_unknownObjectRelease();

  objc_msgSend(*(id *)(v2 + 16), sel_invalidate);
  v0[17] = v3;
  sub_24D219220();
  swift_release();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_24D1BA49C()
{
  uint64_t v2 = (void *)v0[27];
  uint64_t v1 = v0[28];
  swift_willThrow();
  swift_release();
  swift_unknownObjectRelease();

  v0[16] = v1;
  sub_24D219210();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_24D1BA550(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5D0);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    a1 = v3;
    a2 = (void *)v5;
    return MEMORY[0x270FA2410](a1, a2);
  }
  if (!a2)
  {
    __break(1u);
    return MEMORY[0x270FA2410](a1, a2);
  }
  **(void **)(*(void *)(v3 + 64) + 40) = a2;
  id v8 = a2;

  return swift_continuation_throwingResume();
}

uint64_t sub_24D1BA610(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24D219240();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_24D219230();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_24D1D9A80(a1, &qword_26B18A5B0);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24D219200();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_24D1BA7BC(uint64_t a1, uint64_t a2)
{
  v3[9] = a2;
  v3[10] = v2;
  v3[8] = a1;
  uint64_t v4 = sub_24D219020();
  v3[11] = v4;
  v3[12] = *(void *)(v4 - 8);
  v3[13] = swift_task_alloc();
  v3[14] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D1BA890, 0, 0);
}

uint64_t sub_24D1BA890()
{
  v48 = v0;
  if (qword_26B18A2F8 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[14];
  uint64_t v2 = v0[11];
  uint64_t v3 = v0[12];
  uint64_t v4 = __swift_project_value_buffer(v2, (uint64_t)qword_26B18A8F0);
  swift_beginAccess();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v5(v1, v4, v2);
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v6 = sub_24D219000();
  os_log_type_t type = sub_24D2192C0();
  BOOL v7 = os_log_type_enabled(v6, type);
  uint64_t v8 = v0[14];
  uint64_t v10 = v0[11];
  uint64_t v9 = v0[12];
  unint64_t v12 = v0[9];
  uint64_t v11 = v0[10];
  if (v7)
  {
    uint64_t v41 = v0[8];
    uint64_t v45 = v4;
    uint64_t v13 = swift_slowAlloc();
    uint64_t v42 = swift_slowAlloc();
    v47[0] = v42;
    *(_DWORD *)uint64_t v13 = 136315394;
    uint64_t v44 = v8;
    id v14 = *(id *)(v11 + 16);
    uint64_t v43 = v10;
    uint64_t v15 = v5;
    uint64_t v16 = sub_24D218E90();
    unint64_t v18 = v17;

    uint64_t v19 = v16;
    uint64_t v5 = v15;
    v0[6] = sub_24D1D0A78(v19, v18, v47);
    sub_24D219310();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 12) = 2080;
    swift_bridgeObjectRetain();
    v0[7] = sub_24D1D0A78(v41, v12, v47);
    sub_24D219310();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24D1B6000, v6, type, "update time zone for site %s to %s", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x253322AA0](v42, -1, -1);
    uint64_t v20 = v13;
    uint64_t v4 = v45;
    MEMORY[0x253322AA0](v20, -1, -1);

    v21 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
    v21(v44, v43);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_release_n();
    v21 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
    v21(v8, v10);
  }
  id v22 = *(id *)(v0[10] + 16);
  uint64_t v23 = sub_24D218E60();
  unint64_t v25 = v24;

  swift_bridgeObjectRelease();
  uint64_t v26 = HIBYTE(v25) & 0xF;
  if ((v25 & 0x2000000000000000) == 0) {
    uint64_t v26 = v23 & 0xFFFFFFFFFFFFLL;
  }
  if (v26)
  {
    uint64_t v28 = v0[9];
    uint64_t v27 = v0[10];
    uint64_t v29 = v0[8];
    v30 = (void *)swift_task_alloc();
    v0[15] = v30;
    v30[2] = v27;
    v30[3] = v29;
    v30[4] = v28;
    os_log_type_t v31 = (void *)swift_task_alloc();
    v0[16] = v31;
    uint64_t v32 = sub_24D218ED0();
    *os_log_type_t v31 = v0;
    v31[1] = sub_24D1BAD98;
    return MEMORY[0x270FA2360](v0 + 5, 0, 0, 0xD000000000000012, 0x800000024D21B640, sub_24D1D5ABC, v30, v32);
  }
  else
  {
    v5(v0[13], v4, v0[11]);
    uint64_t v33 = sub_24D219000();
    os_log_type_t v34 = sub_24D2192D0();
    if (os_log_type_enabled(v33, v34))
    {
      v35 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v35 = 0;
      _os_log_impl(&dword_24D1B6000, v33, v34, "Failed to update timezone. Site ID is empty.", v35, 2u);
      MEMORY[0x253322AA0](v35, -1, -1);
    }
    uint64_t v36 = v0[13];
    uint64_t v37 = v0[11];

    v21(v36, v37);
    sub_24D1D5A68();
    swift_allocError();
    unsigned char *v38 = 28;
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v39 = (uint64_t (*)(void))v0[1];
    return v39();
  }
}

uint64_t sub_24D1BAD98()
{
  *(void *)(*(void *)v1 + 136) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_24D1BAF38;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_24D1BAEB4;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D1BAEB4()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = v0[5];

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_24D1BAF38()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24D1BAFAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[20] = a6;
  v7[21] = a7;
  v7[18] = a4;
  v7[19] = a5;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BE50);
  v7[22] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v7[23] = v9;
  v7[24] = *(void *)(v9 + 64);
  v7[25] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D1BB07C, 0, 0);
}

uint64_t sub_24D1BB07C()
{
  uint64_t v1 = v0[25];
  uint64_t v3 = v0[22];
  uint64_t v2 = v0[23];
  uint64_t v4 = v0[19];
  uint64_t v5 = v0[18];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[26] = sub_24D217288();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v5, v3);
  unint64_t v6 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v7 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v2 + 32))(v7 + v6, v1, v3);
  uint64_t v8 = (void *)sub_24D217944((uint64_t)sub_24D1DCA84, v7);
  v0[27] = v8;
  swift_release();
  id v9 = *(id *)(v4 + 16);
  sub_24D218E60();

  uint64_t v10 = sub_24D2190E0();
  v0[28] = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = sub_24D2190E0();
  v0[29] = v11;
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_24D1BB2B0;
  uint64_t v12 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_24D1BA550;
  v0[13] = &block_descriptor_233;
  v0[14] = v12;
  objc_msgSend(v8, sel_updateTimezoneWithSiteID_timezone_completionHandler_, v10, v11);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_24D1BB2B0()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 240) = v1;
  if (v1) {
    uint64_t v2 = sub_24D1DCDC8;
  }
  else {
    uint64_t v2 = sub_24D1DCDCC;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D1BB3C0(uint64_t a1, uint64_t a2)
{
  v3[7] = a2;
  v3[8] = v2;
  v3[6] = a1;
  uint64_t v4 = sub_24D219020();
  v3[9] = v4;
  v3[10] = *(void *)(v4 - 8);
  v3[11] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D1BB484, 0, 0);
}

uint64_t sub_24D1BB484()
{
  id v1 = *(id *)(v0[8] + 16);
  uint64_t v2 = sub_24D218E60();
  unint64_t v4 = v3;

  swift_bridgeObjectRelease();
  uint64_t v5 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    uint64_t v5 = v2 & 0xFFFFFFFFFFFFLL;
  }
  if (v5)
  {
    uint64_t v7 = v0[7];
    uint64_t v6 = v0[8];
    uint64_t v8 = v0[6];
    id v9 = (void *)swift_task_alloc();
    v0[12] = v9;
    v9[2] = v6;
    v9[3] = v8;
    v9[4] = v7;
    uint64_t v10 = (void *)swift_task_alloc();
    v0[13] = v10;
    uint64_t v11 = sub_24D218ED0();
    *uint64_t v10 = v0;
    v10[1] = sub_24D1BB754;
    return MEMORY[0x270FA2360](v0 + 5, 0, 0, 0x7453657461647075, 0xEF293A5F28657461, sub_24D1D5AF8, v9, v11);
  }
  else
  {
    if (qword_26B18A2F8 != -1) {
      swift_once();
    }
    uint64_t v13 = v0[10];
    uint64_t v12 = v0[11];
    uint64_t v14 = v0[9];
    uint64_t v15 = __swift_project_value_buffer(v14, (uint64_t)qword_26B18A8F0);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v12, v15, v14);
    uint64_t v16 = sub_24D219000();
    os_log_type_t v17 = sub_24D2192D0();
    if (os_log_type_enabled(v16, v17))
    {
      unint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v18 = 0;
      _os_log_impl(&dword_24D1B6000, v16, v17, "Failed to update state. Site ID is empty.", v18, 2u);
      MEMORY[0x253322AA0](v18, -1, -1);
    }
    uint64_t v20 = v0[10];
    uint64_t v19 = v0[11];
    uint64_t v21 = v0[9];

    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
    sub_24D1D5A68();
    swift_allocError();
    *id v22 = 28;
    swift_willThrow();
    swift_task_dealloc();
    uint64_t v23 = (uint64_t (*)(void))v0[1];
    return v23();
  }
}

uint64_t sub_24D1BB754()
{
  *(void *)(*(void *)v1 + 112) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_24D1BB8EC;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_24D1BB870;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D1BB870()
{
  uint64_t v1 = v0[8];
  uint64_t v2 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = v0[5];

  swift_task_dealloc();
  unint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_24D1BB8EC()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24D1BB958(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v21 = a3;
  uint64_t v22 = a6;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BE50);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388]();
  uint64_t v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5B0);
  MEMORY[0x270FA5388]();
  uint64_t v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_24D219240();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v14, 1, 1, v15);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a1, v9);
  unint64_t v16 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v17 = (v11 + v16 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = 0;
  *(void *)(v18 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v18 + v16, v12, v9);
  *(void *)(v18 + v17) = a2;
  uint64_t v19 = (void *)(v18 + ((v17 + 15) & 0xFFFFFFFFFFFFFFF8));
  *uint64_t v19 = v21;
  v19[1] = a4;
  swift_retain();
  swift_bridgeObjectRetain();
  sub_24D1BA610((uint64_t)v14, v22, v18);
  return swift_release();
}

uint64_t sub_24D1BBB5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[20] = a6;
  v7[21] = a7;
  v7[18] = a4;
  v7[19] = a5;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BE50);
  v7[22] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v7[23] = v9;
  v7[24] = *(void *)(v9 + 64);
  v7[25] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D1BBC2C, 0, 0);
}

uint64_t sub_24D1BBC2C()
{
  uint64_t v1 = v0[25];
  uint64_t v3 = v0[22];
  uint64_t v2 = v0[23];
  uint64_t v4 = v0[19];
  uint64_t v5 = v0[18];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[26] = sub_24D217288();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v5, v3);
  unint64_t v6 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v7 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v2 + 32))(v7 + v6, v1, v3);
  uint64_t v8 = (void *)sub_24D217944((uint64_t)sub_24D1DC7EC, v7);
  v0[27] = v8;
  swift_release();
  id v9 = *(id *)(v4 + 16);
  sub_24D218E60();

  uint64_t v10 = sub_24D2190E0();
  v0[28] = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = sub_24D2190E0();
  v0[29] = v11;
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_24D1BBE60;
  uint64_t v12 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_24D1BA550;
  v0[13] = &block_descriptor_225;
  v0[14] = v12;
  objc_msgSend(v8, sel_updateStateWithSiteID_state_completionHandler_, v10, v11);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_24D1BBE60()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 240) = v1;
  if (v1) {
    uint64_t v2 = sub_24D1BC028;
  }
  else {
    uint64_t v2 = sub_24D1BBF70;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D1BBF70()
{
  uint64_t v2 = (void *)v0[28];
  uint64_t v1 = (void *)v0[29];
  uint64_t v3 = v0[26];
  uint64_t v4 = v0[15];
  swift_unknownObjectRelease();

  objc_msgSend(*(id *)(v3 + 16), sel_invalidate);
  v0[17] = v4;
  sub_24D219220();
  swift_release();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_24D1BC028()
{
  uint64_t v2 = (void *)v0[29];
  uint64_t v1 = v0[30];
  uint64_t v3 = (void *)v0[28];
  swift_willThrow();
  swift_release();
  swift_unknownObjectRelease();

  v0[16] = v1;
  sub_24D219210();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_24D1BC0EC(uint64_t a1)
{
  v2[6] = a1;
  v2[7] = v1;
  uint64_t v3 = sub_24D219020();
  v2[8] = v3;
  v2[9] = *(void *)(v3 - 8);
  v2[10] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D1BC1AC, 0, 0);
}

uint64_t sub_24D1BC1AC()
{
  id v1 = *(id *)(v0[3].i64[1] + 16);
  uint64_t v2 = sub_24D218E60();
  unint64_t v4 = v3;

  swift_bridgeObjectRelease();
  uint64_t v5 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    uint64_t v5 = v2 & 0xFFFFFFFFFFFFLL;
  }
  if (v5)
  {
    uint64_t v6 = (int8x16_t *)swift_task_alloc();
    v0[5].i64[1] = (uint64_t)v6;
    v6[1] = vextq_s8(v0[3], v0[3], 8uLL);
    uint64_t v7 = (void *)swift_task_alloc();
    v0[6].i64[0] = (uint64_t)v7;
    uint64_t v8 = sub_24D218ED0();
    *uint64_t v7 = v0;
    v7[1] = sub_24D1BC470;
    return MEMORY[0x270FA2360](&v0[2].u64[1], 0, 0, 0xD000000000000013, 0x800000024D21B660, sub_24D1D5B34, v6, v8);
  }
  else
  {
    if (qword_26B18A2F8 != -1) {
      swift_once();
    }
    uint64_t v10 = v0[4].i64[1];
    uint64_t v9 = v0[5].i64[0];
    uint64_t v11 = v0[4].i64[0];
    uint64_t v12 = __swift_project_value_buffer(v11, (uint64_t)qword_26B18A8F0);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v9, v12, v11);
    uint64_t v13 = sub_24D219000();
    os_log_type_t v14 = sub_24D2192D0();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl(&dword_24D1B6000, v13, v14, "Failed to update fields. Site ID is empty.", v15, 2u);
      MEMORY[0x253322AA0](v15, -1, -1);
    }
    uint64_t v17 = v0[4].i64[1];
    uint64_t v16 = v0[5].i64[0];
    uint64_t v18 = v0[4].i64[0];

    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);
    sub_24D1D5A68();
    swift_allocError();
    *uint64_t v19 = 28;
    swift_willThrow();
    swift_task_dealloc();
    uint64_t v20 = (uint64_t (*)(void))v0->i64[1];
    return v20();
  }
}

uint64_t sub_24D1BC470()
{
  *(void *)(*(void *)v1 + 104) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_24D1BC608;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_24D1BC58C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D1BC58C()
{
  uint64_t v1 = v0[7];
  uint64_t v2 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = v0[5];

  swift_task_dealloc();
  unint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_24D1BC608()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24D1BC674(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BE50);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5B0);
  MEMORY[0x270FA5388]();
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_24D219240();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  unint64_t v13 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  unint64_t v14 = (v8 + v13 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = 0;
  *(void *)(v15 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v15 + v13, v9, v6);
  *(void *)(v15 + v14) = a2;
  *(void *)(v15 + ((v14 + 15) & 0xFFFFFFFFFFFFFFF8)) = a3;
  swift_retain();
  swift_bridgeObjectRetain();
  sub_24D1BA610((uint64_t)v11, (uint64_t)&unk_26985BEC0, v15);
  return swift_release();
}

uint64_t sub_24D1BC878(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[19] = a5;
  v6[20] = a6;
  v6[18] = a4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BE50);
  v6[21] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v6[22] = v8;
  v6[23] = *(void *)(v8 + 64);
  v6[24] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D1BC948, 0, 0);
}

uint64_t sub_24D1BC948()
{
  uint64_t v1 = v0[24];
  uint64_t v2 = v0[21];
  uint64_t v3 = v0[22];
  uint64_t v4 = v0[19];
  uint64_t v5 = v0[18];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[25] = sub_24D217288();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v5, v2);
  unint64_t v6 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v7 + v6, v1, v2);
  uint64_t v8 = (void *)sub_24D217944((uint64_t)sub_24D1DC65C, v7);
  v0[26] = v8;
  swift_release();
  id v9 = *(id *)(v4 + 16);
  sub_24D218E60();

  uint64_t v10 = sub_24D2190E0();
  v0[27] = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = sub_24D219030();
  v0[28] = v11;
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_24D1BCB94;
  uint64_t v12 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_24D1BA550;
  v0[13] = &block_descriptor_217;
  v0[14] = v12;
  objc_msgSend(v8, sel_updateFieldsWithSiteID_from_completionHandler_, v10, v11);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_24D1BCB94()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 232) = v1;
  if (v1) {
    uint64_t v2 = sub_24D1BCD5C;
  }
  else {
    uint64_t v2 = sub_24D1BCCA4;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D1BCCA4()
{
  uint64_t v2 = (void *)v0[27];
  uint64_t v1 = (void *)v0[28];
  uint64_t v3 = v0[25];
  uint64_t v4 = v0[15];
  swift_unknownObjectRelease();

  objc_msgSend(*(id *)(v3 + 16), sel_invalidate);
  v0[17] = v4;
  sub_24D219220();
  swift_release();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_24D1BCD5C()
{
  uint64_t v2 = (void *)v0[28];
  uint64_t v1 = v0[29];
  uint64_t v3 = (void *)v0[27];
  swift_willThrow();
  swift_release();
  swift_unknownObjectRelease();

  v0[16] = v1;
  sub_24D219210();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_24D1BCE20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v9 + 208) = v19;
  *(void *)(v9 + 216) = v8;
  *(_OWORD *)(v9 + 176) = v17;
  *(_OWORD *)(v9 + 192) = v18;
  *(_OWORD *)(v9 + 144) = v15;
  *(_OWORD *)(v9 + 160) = v16;
  *(_OWORD *)(v9 + 112) = v13;
  *(_OWORD *)(v9 + 128) = v14;
  *(void *)(v9 + 96) = a7;
  *(void *)(v9 + 104) = a8;
  *(void *)(v9 + 80) = a5;
  *(void *)(v9 + 88) = a6;
  *(void *)(v9 + 64) = a3;
  *(void *)(v9 + 72) = a4;
  *(void *)(v9 + 48) = a1;
  *(void *)(v9 + 56) = a2;
  uint64_t v10 = sub_24D219020();
  *(void *)(v9 + 224) = v10;
  *(void *)(v9 + 232) = *(void *)(v10 - 8);
  *(void *)(v9 + 240) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D1BCF10, 0, 0);
}

uint64_t sub_24D1BCF10()
{
  id v1 = *(id *)(*(void *)(v0 + 216) + 16);
  uint64_t v2 = sub_24D218E60();
  unint64_t v4 = v3;

  swift_bridgeObjectRelease();
  uint64_t v5 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    uint64_t v5 = v2 & 0xFFFFFFFFFFFFLL;
  }
  if (v5)
  {
    uint64_t v7 = *(void *)(v0 + 208);
    uint64_t v6 = *(void *)(v0 + 216);
    uint64_t v8 = *(void *)(v0 + 184);
    long long v35 = *(_OWORD *)(v0 + 168);
    long long v36 = *(_OWORD *)(v0 + 192);
    uint64_t v9 = *(void *)(v0 + 160);
    uint64_t v10 = *(void *)(v0 + 136);
    long long v33 = *(_OWORD *)(v0 + 120);
    long long v34 = *(_OWORD *)(v0 + 144);
    uint64_t v11 = *(void *)(v0 + 112);
    uint64_t v12 = *(void *)(v0 + 88);
    long long v31 = *(_OWORD *)(v0 + 72);
    long long v32 = *(_OWORD *)(v0 + 96);
    uint64_t v13 = *(void *)(v0 + 64);
    long long v30 = *(_OWORD *)(v0 + 48);
    uint64_t v14 = swift_task_alloc();
    *(void *)(v0 + 248) = v14;
    *(void *)(v14 + 16) = v6;
    *(_OWORD *)(v14 + 24) = v30;
    *(void *)(v14 + 40) = v13;
    *(_OWORD *)(v14 + 48) = v31;
    *(void *)(v14 + 64) = v12;
    *(_OWORD *)(v14 + 72) = v32;
    *(void *)(v14 + 88) = v11;
    *(_OWORD *)(v14 + 96) = v33;
    *(void *)(v14 + 112) = v10;
    *(_OWORD *)(v14 + 120) = v34;
    *(void *)(v14 + 136) = v9;
    *(_OWORD *)(v14 + 144) = v35;
    *(void *)(v14 + 160) = v8;
    *(_OWORD *)(v14 + 168) = v36;
    *(void *)(v14 + 184) = v7;
    long long v15 = (void *)swift_task_alloc();
    *(void *)(v0 + 256) = v15;
    uint64_t v16 = sub_24D218ED0();
    *long long v15 = v0;
    v15[1] = sub_24D1BD284;
    return MEMORY[0x270FA2360](v0 + 40, 0, 0, 0xD0000000000000B6, 0x800000024D21B680, sub_24D1D5B3C, v14, v16);
  }
  else
  {
    if (qword_26B18A2F8 != -1) {
      swift_once();
    }
    uint64_t v18 = *(void *)(v0 + 232);
    uint64_t v17 = *(void *)(v0 + 240);
    uint64_t v19 = *(void *)(v0 + 224);
    uint64_t v20 = __swift_project_value_buffer(v19, (uint64_t)qword_26B18A8F0);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v17, v20, v19);
    uint64_t v21 = sub_24D219000();
    os_log_type_t v22 = sub_24D2192D0();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v23 = 0;
      _os_log_impl(&dword_24D1B6000, v21, v22, "Failed to update subscription. Site ID is empty.", v23, 2u);
      MEMORY[0x253322AA0](v23, -1, -1);
    }
    uint64_t v25 = *(void *)(v0 + 232);
    uint64_t v24 = *(void *)(v0 + 240);
    uint64_t v26 = *(void *)(v0 + 224);

    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v24, v26);
    sub_24D1D5A68();
    swift_allocError();
    unsigned char *v27 = 28;
    swift_willThrow();
    swift_task_dealloc();
    uint64_t v28 = *(uint64_t (**)(void))(v0 + 8);
    return v28();
  }
}

uint64_t sub_24D1BD284()
{
  *(void *)(*(void *)v1 + 264) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_24D1BD41C;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_24D1BD3A0;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D1BD3A0()
{
  uint64_t v1 = v0[27];
  uint64_t v2 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = v0[5];

  swift_task_dealloc();
  unint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_24D1BD41C()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24D1BD488(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  uint64_t v83 = a7;
  uint64_t v84 = a8;
  uint64_t v79 = a5;
  uint64_t v80 = a6;
  uint64_t v75 = a3;
  uint64_t v76 = a4;
  uint64_t v89 = a22;
  uint64_t v90 = a2;
  uint64_t v91 = a20;
  uint64_t v87 = a19;
  uint64_t v88 = a21;
  uint64_t v85 = a17;
  uint64_t v86 = a18;
  uint64_t v81 = a15;
  uint64_t v82 = a16;
  uint64_t v77 = a13;
  uint64_t v78 = a14;
  uint64_t v73 = a11;
  uint64_t v74 = a12;
  uint64_t v71 = a9;
  uint64_t v72 = a10;
  unint64_t v69 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B18A610) - 8);
  uint64_t v24 = *(void *)(v69 + 64);
  MEMORY[0x270FA5388]();
  uint64_t v68 = (uint64_t)&v61 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BE50);
  uint64_t v26 = *(void *)(v25 - 8);
  uint64_t v27 = *(void *)(v26 + 64);
  MEMORY[0x270FA5388]();
  v67 = (char *)&v61 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5B0);
  MEMORY[0x270FA5388]();
  uint64_t v29 = (char *)&v61 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v70 = v29;
  uint64_t v30 = sub_24D219240();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v29, 1, 1, v30);
  uint64_t v31 = v25;
  (*(void (**)(char *, uint64_t, uint64_t))(v26 + 16))((char *)&v61 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v25);
  sub_24D1D9D68(a23, (uint64_t)&v61 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_26B18A610);
  unint64_t v32 = (*(unsigned __int8 *)(v26 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80);
  unint64_t v33 = (v27 + v32 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v34 = (v33 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v35 = (v34 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v36 = (v35 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v37 = (v36 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v38 = (v37 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v62 = (v38 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v63 = (v62 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v64 = (v63 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v66 = (v64 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v65 = (v66 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v69 = (*(unsigned __int8 *)(v69 + 80) + v65 + 16) & ~(unint64_t)*(unsigned __int8 *)(v69 + 80);
  uint64_t v39 = swift_allocObject();
  *(void *)(v39 + 16) = 0;
  *(void *)(v39 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v26 + 32))(v39 + v32, v67, v31);
  *(void *)(v39 + v33) = v90;
  uint64_t v40 = (void *)(v39 + v34);
  uint64_t v41 = v76;
  *uint64_t v40 = v75;
  v40[1] = v41;
  uint64_t v42 = (void *)(v39 + v35);
  uint64_t v43 = v80;
  *uint64_t v42 = v79;
  v42[1] = v43;
  uint64_t v44 = (void *)(v39 + v36);
  uint64_t v45 = v84;
  *uint64_t v44 = v83;
  v44[1] = v45;
  v46 = (void *)(v39 + v37);
  uint64_t v47 = v72;
  void *v46 = v71;
  v46[1] = v47;
  v48 = (void *)(v39 + v38);
  uint64_t v49 = v74;
  void *v48 = v73;
  v48[1] = v49;
  v50 = (void *)(v39 + v62);
  uint64_t v51 = v78;
  void *v50 = v77;
  v50[1] = v51;
  v52 = (void *)(v39 + v63);
  uint64_t v53 = v82;
  void *v52 = v81;
  v52[1] = v53;
  v54 = (void *)(v39 + v64);
  uint64_t v55 = v86;
  void *v54 = v85;
  v54[1] = v55;
  v56 = (void *)(v39 + v66);
  uint64_t v57 = v91;
  void *v56 = v87;
  v56[1] = v57;
  v58 = (void *)(v39 + v65);
  uint64_t v59 = v89;
  void *v58 = v88;
  v58[1] = v59;
  sub_24D1DC0B8(v68, v39 + v69, &qword_26B18A610);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_24D1BA610((uint64_t)v70, (uint64_t)&unk_26985BEB0, v39);
  return swift_release();
}

uint64_t sub_24D1BD940(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 312) = v21;
  *(void *)(v8 + 320) = v22;
  *(_OWORD *)(v8 + 296) = v20;
  *(_OWORD *)(v8 + 280) = v19;
  *(_OWORD *)(v8 + 264) = v18;
  *(_OWORD *)(v8 + 248) = v17;
  *(_OWORD *)(v8 + 232) = v16;
  *(_OWORD *)(v8 + 216) = v15;
  *(_OWORD *)(v8 + 200) = v14;
  *(_OWORD *)(v8 + 184) = v13;
  *(void *)(v8 + 168) = a7;
  *(void *)(v8 + 176) = a8;
  *(void *)(v8 + 152) = a5;
  *(void *)(v8 + 160) = a6;
  *(void *)(v8 + 144) = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A610);
  *(void *)(v8 + 328) = swift_task_alloc();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BE50);
  *(void *)(v8 + 336) = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  *(void *)(v8 + 344) = v10;
  *(void *)(v8 + 352) = *(void *)(v10 + 64);
  *(void *)(v8 + 360) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D1BDA8C, 0, 0);
}

uint64_t sub_24D1BDA8C()
{
  uint64_t v1 = v0[45];
  uint64_t v2 = v0[42];
  uint64_t v3 = v0[43];
  uint64_t v4 = v0[21];
  uint64_t v5 = v0[18];
  uint64_t v6 = v0[19];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[46] = sub_24D217288();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v5, v2);
  unint64_t v7 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v8 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v8 + v7, v1, v2);
  unint64_t v35 = (void *)sub_24D217944((uint64_t)sub_24D1DC3E4, v8);
  v0[47] = v35;
  swift_release();
  id v9 = *(id *)(v6 + 16);
  sub_24D218E60();

  uint64_t v34 = sub_24D2190E0();
  v0[48] = v34;
  swift_bridgeObjectRelease();
  if (v4) {
    uint64_t v10 = sub_24D2190E0();
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v33 = v10;
  v0[49] = v10;
  if (v0[23]) {
    uint64_t v11 = sub_24D2190E0();
  }
  else {
    uint64_t v11 = 0;
  }
  uint64_t v32 = v11;
  v0[50] = v11;
  if (v0[25]) {
    uint64_t v12 = sub_24D2190E0();
  }
  else {
    uint64_t v12 = 0;
  }
  uint64_t v31 = v12;
  v0[51] = v12;
  if (v0[27]) {
    uint64_t v13 = sub_24D2190E0();
  }
  else {
    uint64_t v13 = 0;
  }
  uint64_t v30 = v13;
  v0[52] = v13;
  if (v0[29]) {
    uint64_t v14 = sub_24D2190E0();
  }
  else {
    uint64_t v14 = 0;
  }
  uint64_t v29 = v14;
  v0[53] = v14;
  if (v0[31]) {
    uint64_t v15 = sub_24D2190E0();
  }
  else {
    uint64_t v15 = 0;
  }
  uint64_t v28 = v15;
  v0[54] = v15;
  if (v0[33]) {
    uint64_t v16 = sub_24D2190E0();
  }
  else {
    uint64_t v16 = 0;
  }
  v0[55] = v16;
  if (v0[35]) {
    uint64_t v17 = sub_24D2190E0();
  }
  else {
    uint64_t v17 = 0;
  }
  v0[56] = v17;
  if (v0[37]) {
    uint64_t v18 = sub_24D2190E0();
  }
  else {
    uint64_t v18 = 0;
  }
  v0[57] = v18;
  if (v0[39]) {
    uint64_t v19 = sub_24D2190E0();
  }
  else {
    uint64_t v19 = 0;
  }
  v0[58] = v19;
  uint64_t v20 = v0[41];
  sub_24D1D9D68(v0[40], v20, &qword_26B18A610);
  uint64_t v21 = sub_24D218AC0();
  uint64_t v22 = *(void *)(v21 - 8);
  int v23 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21);
  uint64_t v24 = 0;
  if (v23 != 1)
  {
    uint64_t v25 = v0[41];
    uint64_t v24 = sub_24D218A40();
    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v25, v21);
  }
  v0[59] = v24;
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_24D1BDE8C;
  uint64_t v26 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_24D1BA550;
  v0[13] = &block_descriptor_209;
  v0[14] = v26;
  objc_msgSend(v35, sel_updateSubscriptionWithSiteID_utilityID_subscriptionID_accessToken_refreshToken_ckFunctionToken_accountName_accountNumber_address_serviceLocationID_alternateSupplier_accessTokenExpirationDate_completionHandler_, v34, v33, v32, v31, v30, v29, v28, v16, v17, v18, v19, v24, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_24D1BDE8C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 480) = v1;
  if (v1) {
    uint64_t v2 = sub_24D1BE0D8;
  }
  else {
    uint64_t v2 = sub_24D1BDF9C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D1BDF9C()
{
  uint64_t v2 = (void *)v0[58];
  uint64_t v1 = (void *)v0[59];
  uint64_t v3 = (void *)v0[56];
  uint64_t v4 = (void *)v0[57];
  uint64_t v5 = (void *)v0[54];
  uint64_t v6 = (void *)v0[55];
  uint64_t v8 = (void *)v0[52];
  unint64_t v7 = (void *)v0[53];
  uint64_t v12 = (void *)v0[51];
  uint64_t v13 = (void *)v0[50];
  uint64_t v14 = (void *)v0[49];
  uint64_t v15 = (void *)v0[48];
  uint64_t v9 = v0[46];
  uint64_t v16 = v0[15];
  swift_unknownObjectRelease();

  objc_msgSend(*(id *)(v9 + 16), sel_invalidate);
  v0[17] = v16;
  sub_24D219220();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_24D1BE0D8()
{
  uint64_t v2 = (void *)v0[59];
  uint64_t v1 = v0[60];
  uint64_t v4 = (void *)v0[57];
  uint64_t v3 = (void *)v0[58];
  uint64_t v5 = (void *)v0[55];
  uint64_t v6 = (void *)v0[56];
  uint64_t v9 = (void *)v0[54];
  uint64_t v10 = (void *)v0[53];
  uint64_t v11 = (void *)v0[52];
  uint64_t v12 = (void *)v0[51];
  uint64_t v13 = (void *)v0[50];
  uint64_t v14 = (void *)v0[49];
  uint64_t v15 = (void *)v0[48];
  swift_willThrow();
  swift_release();
  swift_unknownObjectRelease();

  v0[16] = v1;
  sub_24D219210();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_24D1BE220(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v9[13] = a8;
  v9[14] = v8;
  v9[11] = a6;
  v9[12] = a7;
  v9[9] = a4;
  v9[10] = a5;
  v9[7] = a2;
  v9[8] = a3;
  v9[6] = a1;
  uint64_t v10 = sub_24D219020();
  v9[15] = v10;
  v9[16] = *(void *)(v10 - 8);
  v9[17] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D1BE2F0, 0, 0);
}

uint64_t sub_24D1BE2F0()
{
  id v1 = *(id *)(*(void *)(v0 + 112) + 16);
  uint64_t v2 = sub_24D218E60();
  unint64_t v4 = v3;

  swift_bridgeObjectRelease();
  uint64_t v5 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    uint64_t v5 = v2 & 0xFFFFFFFFFFFFLL;
  }
  if (v5)
  {
    uint64_t v7 = *(void *)(v0 + 104);
    uint64_t v6 = *(void *)(v0 + 112);
    uint64_t v8 = *(void *)(v0 + 80);
    long long v27 = *(_OWORD *)(v0 + 64);
    long long v28 = *(_OWORD *)(v0 + 88);
    uint64_t v10 = *(void *)(v0 + 48);
    uint64_t v9 = *(void *)(v0 + 56);
    uint64_t v11 = swift_task_alloc();
    *(void *)(v0 + 144) = v11;
    *(void *)(v11 + 16) = v6;
    *(void *)(v11 + 24) = v10;
    *(void *)(v11 + 32) = v9;
    *(_OWORD *)(v11 + 40) = v27;
    *(void *)(v11 + 56) = v8;
    *(_OWORD *)(v11 + 64) = v28;
    *(void *)(v11 + 80) = v7;
    uint64_t v12 = (void *)swift_task_alloc();
    *(void *)(v0 + 152) = v12;
    uint64_t v13 = sub_24D218ED0();
    *uint64_t v12 = v0;
    v12[1] = sub_24D1BE5F0;
    return MEMORY[0x270FA2360](v0 + 40, 0, 0, 0xD000000000000050, 0x800000024D21B740, sub_24D1D5BA0, v11, v13);
  }
  else
  {
    if (qword_26B18A2F8 != -1) {
      swift_once();
    }
    uint64_t v15 = *(void *)(v0 + 128);
    uint64_t v14 = *(void *)(v0 + 136);
    uint64_t v16 = *(void *)(v0 + 120);
    uint64_t v17 = __swift_project_value_buffer(v16, (uint64_t)qword_26B18A8F0);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16))(v14, v17, v16);
    uint64_t v18 = sub_24D219000();
    os_log_type_t v19 = sub_24D2192D0();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl(&dword_24D1B6000, v18, v19, "Failed to create subscription. Site ID is empty.", v20, 2u);
      MEMORY[0x253322AA0](v20, -1, -1);
    }
    uint64_t v22 = *(void *)(v0 + 128);
    uint64_t v21 = *(void *)(v0 + 136);
    uint64_t v23 = *(void *)(v0 + 120);

    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v21, v23);
    sub_24D1D5A68();
    swift_allocError();
    *uint64_t v24 = 28;
    swift_willThrow();
    swift_task_dealloc();
    uint64_t v25 = *(uint64_t (**)(void))(v0 + 8);
    return v25(0);
  }
}

uint64_t sub_24D1BE5F0()
{
  *(void *)(*(void *)v1 + 160) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_24D1BE78C;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_24D1BE70C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D1BE70C()
{
  uint64_t v1 = v0[14];
  uint64_t v2 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = v0[5];

  swift_task_dealloc();
  unint64_t v3 = (uint64_t (*)(uint64_t))v0[1];
  return v3(1);
}

uint64_t sub_24D1BE78C()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1(0);
}

uint64_t sub_24D1BE7FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v42 = a7;
  uint64_t v43 = a8;
  uint64_t v39 = a5;
  uint64_t v40 = a6;
  uint64_t v36 = a3;
  uint64_t v37 = a4;
  uint64_t v35 = a2;
  uint64_t v41 = a10;
  uint64_t v38 = a9;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BE50);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  MEMORY[0x270FA5388]();
  uint64_t v14 = (char *)&v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5B0);
  MEMORY[0x270FA5388]();
  uint64_t v16 = (char *)&v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = v16;
  uint64_t v17 = sub_24D219240();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v16, 1, 1, v17);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a1, v11);
  unint64_t v18 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  unint64_t v19 = (v13 + v18 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v20 = (v19 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v21 = (v20 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v22 = (v21 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = 0;
  *(void *)(v23 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v12 + 32))(v23 + v18, v14, v11);
  uint64_t v24 = v36;
  *(void *)(v23 + v19) = v35;
  uint64_t v25 = (void *)(v23 + v20);
  uint64_t v26 = v37;
  *uint64_t v25 = v24;
  v25[1] = v26;
  long long v27 = (void *)(v23 + v21);
  uint64_t v28 = v40;
  void *v27 = v39;
  v27[1] = v28;
  uint64_t v29 = (void *)(v23 + v22);
  uint64_t v30 = v43;
  *uint64_t v29 = v42;
  v29[1] = v30;
  uint64_t v31 = (void *)(v23 + ((v22 + 23) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v32 = v41;
  *uint64_t v31 = v38;
  v31[1] = v32;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_24D1BA610((uint64_t)v34, (uint64_t)&unk_26985BEA0, v23);
  return swift_release();
}

uint64_t sub_24D1BEA80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 216) = v15;
  *(_OWORD *)(v8 + 200) = v14;
  *(_OWORD *)(v8 + 184) = v13;
  *(void *)(v8 + 168) = a7;
  *(void *)(v8 + 176) = a8;
  *(void *)(v8 + 152) = a5;
  *(void *)(v8 + 160) = a6;
  *(void *)(v8 + 144) = a4;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BE50);
  *(void *)(v8 + 224) = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  *(void *)(v8 + 232) = v10;
  *(void *)(v8 + 240) = *(void *)(v10 + 64);
  *(void *)(v8 + 248) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D1BEB6C, 0, 0);
}

uint64_t sub_24D1BEB6C()
{
  uint64_t v1 = v0[31];
  uint64_t v2 = v0[28];
  uint64_t v3 = v0[29];
  uint64_t v4 = v0[19];
  uint64_t v5 = v0[18];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[32] = sub_24D217288();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v5, v2);
  unint64_t v6 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v7 + v6, v1, v2);
  uint64_t v8 = (void *)sub_24D217944((uint64_t)sub_24D1DBDA8, v7);
  v0[33] = v8;
  swift_release();
  id v9 = *(id *)(v4 + 16);
  sub_24D218E60();

  uint64_t v10 = sub_24D2190E0();
  v0[34] = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = sub_24D2190E0();
  v0[35] = v11;
  uint64_t v12 = sub_24D2190E0();
  v0[36] = v12;
  uint64_t v13 = sub_24D2190E0();
  v0[37] = v13;
  uint64_t v14 = sub_24D2190E0();
  v0[38] = v14;
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_24D1BEE00;
  uint64_t v15 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_24D1BA550;
  v0[13] = &block_descriptor_201;
  v0[14] = v15;
  objc_msgSend(v8, sel_createUtilitySubscriptionWithSiteID_utilityID_serviceLocationID_accessToken_refreshToken_completionHandler_, v10, v11, v12, v13, v14);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_24D1BEE00()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 312) = v1;
  if (v1) {
    uint64_t v2 = sub_24D1BEFEC;
  }
  else {
    uint64_t v2 = sub_24D1BEF10;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D1BEF10()
{
  uint64_t v2 = (void *)v0[37];
  uint64_t v1 = (void *)v0[38];
  uint64_t v4 = (void *)v0[35];
  uint64_t v3 = (void *)v0[36];
  uint64_t v5 = (void *)v0[34];
  uint64_t v6 = v0[32];
  uint64_t v7 = v0[15];
  swift_unknownObjectRelease();

  objc_msgSend(*(id *)(v6 + 16), sel_invalidate);
  v0[17] = v7;
  sub_24D219220();
  swift_release();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_24D1BEFEC()
{
  uint64_t v2 = (void *)v0[38];
  uint64_t v1 = v0[39];
  uint64_t v4 = (void *)v0[36];
  uint64_t v3 = (void *)v0[37];
  uint64_t v5 = (void *)v0[34];
  uint64_t v6 = (void *)v0[35];
  swift_willThrow();
  swift_release();
  swift_unknownObjectRelease();

  v0[16] = v1;
  sub_24D219210();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_24D1BF0C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v9 + 128) = v14;
  *(void *)(v9 + 136) = v8;
  *(_OWORD *)(v9 + 112) = v13;
  *(void *)(v9 + 96) = a7;
  *(void *)(v9 + 104) = a8;
  *(void *)(v9 + 80) = a5;
  *(void *)(v9 + 88) = a6;
  *(void *)(v9 + 64) = a3;
  *(void *)(v9 + 72) = a4;
  *(void *)(v9 + 48) = a1;
  *(void *)(v9 + 56) = a2;
  uint64_t v10 = sub_24D219020();
  *(void *)(v9 + 144) = v10;
  *(void *)(v9 + 152) = *(void *)(v10 - 8);
  *(void *)(v9 + 160) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D1BF1A4, 0, 0);
}

uint64_t sub_24D1BF1A4()
{
  id v1 = *(id *)(*(void *)(v0 + 136) + 16);
  uint64_t v2 = sub_24D218E60();
  unint64_t v4 = v3;

  swift_bridgeObjectRelease();
  uint64_t v5 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    uint64_t v5 = v2 & 0xFFFFFFFFFFFFLL;
  }
  if (v5)
  {
    uint64_t v7 = *(void *)(v0 + 128);
    uint64_t v6 = *(void *)(v0 + 136);
    uint64_t v8 = *(void *)(v0 + 120);
    long long v31 = *(_OWORD *)(v0 + 104);
    uint64_t v10 = *(void *)(v0 + 72);
    uint64_t v9 = *(void *)(v0 + 80);
    uint64_t v12 = *(void *)(v0 + 56);
    uint64_t v11 = *(void *)(v0 + 64);
    uint64_t v13 = *(void *)(v0 + 48);
    uint64_t v14 = swift_task_alloc();
    *(void *)(v0 + 168) = v14;
    long long v15 = *(_OWORD *)(v0 + 88);
    *(void *)(v14 + 16) = v6;
    *(void *)(v14 + 24) = v13;
    *(void *)(v14 + 32) = v12;
    *(void *)(v14 + 40) = v11;
    *(void *)(v14 + 48) = v10;
    *(void *)(v14 + 56) = v9;
    *(_OWORD *)(v14 + 64) = v15;
    *(_OWORD *)(v14 + 80) = v31;
    *(void *)(v14 + 96) = v8;
    *(void *)(v14 + 104) = v7;
    uint64_t v16 = (void *)swift_task_alloc();
    *(void *)(v0 + 176) = v16;
    uint64_t v17 = sub_24D218ED0();
    *uint64_t v16 = v0;
    v16[1] = sub_24D1BF4B4;
    return MEMORY[0x270FA2360](v0 + 40, 0, 0, 0xD00000000000007ELL, 0x800000024D21B7A0, sub_24D1D5BD8, v14, v17);
  }
  else
  {
    if (qword_26B18A2F8 != -1) {
      swift_once();
    }
    uint64_t v19 = *(void *)(v0 + 152);
    uint64_t v18 = *(void *)(v0 + 160);
    uint64_t v20 = *(void *)(v0 + 144);
    uint64_t v21 = __swift_project_value_buffer(v20, (uint64_t)qword_26B18A8F0);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v18, v21, v20);
    unint64_t v22 = sub_24D219000();
    os_log_type_t v23 = sub_24D2192D0();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v24 = 0;
      _os_log_impl(&dword_24D1B6000, v22, v23, "Failed to create subscription. Site ID is empty.", v24, 2u);
      MEMORY[0x253322AA0](v24, -1, -1);
    }
    uint64_t v26 = *(void *)(v0 + 152);
    uint64_t v25 = *(void *)(v0 + 160);
    uint64_t v27 = *(void *)(v0 + 144);

    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v25, v27);
    sub_24D1D5A68();
    swift_allocError();
    unsigned char *v28 = 28;
    swift_willThrow();
    swift_task_dealloc();
    uint64_t v29 = *(uint64_t (**)(void))(v0 + 8);
    return v29(0);
  }
}

uint64_t sub_24D1BF4B4()
{
  *(void *)(*(void *)v1 + 184) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_24D1BF650;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_24D1BF5D0;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D1BF5D0()
{
  uint64_t v1 = v0[17];
  uint64_t v2 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = v0[5];

  swift_task_dealloc();
  unint64_t v3 = (uint64_t (*)(uint64_t))v0[1];
  return v3(1);
}

uint64_t sub_24D1BF650()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1(0);
}

uint64_t sub_24D1BF6C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v54 = a7;
  uint64_t v55 = a8;
  uint64_t v52 = a5;
  uint64_t v53 = a6;
  uint64_t v50 = a3;
  uint64_t v51 = a4;
  uint64_t v58 = a12;
  uint64_t v59 = a13;
  uint64_t v56 = a10;
  uint64_t v57 = a11;
  unint64_t v47 = a9;
  uint64_t v48 = a2;
  uint64_t v14 = sub_24D218AC0();
  uint64_t v45 = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(void *)(v15 + 64);
  MEMORY[0x270FA5388]();
  v46 = (char *)&v43 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BE50);
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = *(void *)(v18 + 64);
  MEMORY[0x270FA5388]();
  uint64_t v44 = (char *)&v43 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5B0);
  MEMORY[0x270FA5388]();
  uint64_t v21 = (char *)&v43 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = v21;
  uint64_t v22 = sub_24D219240();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v21, 1, 1, v22);
  uint64_t v23 = v17;
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))((char *)&v43 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v17);
  uint64_t v43 = v15;
  (*(void (**)(char *, unint64_t, uint64_t))(v15 + 16))((char *)&v43 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), v47, v14);
  unint64_t v24 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  unint64_t v25 = (v19 + v24 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v26 = (v25 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v27 = (v26 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v28 = (v27 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v29 = (*(unsigned __int8 *)(v15 + 80) + v28 + 16) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  unint64_t v30 = (v16 + v29 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v47 = (v30 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = 0;
  *(void *)(v31 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v18 + 32))(v31 + v24, v44, v23);
  *(void *)(v31 + v25) = v48;
  uint64_t v32 = (void *)(v31 + v26);
  uint64_t v33 = v51;
  void *v32 = v50;
  v32[1] = v33;
  uint64_t v34 = (void *)(v31 + v27);
  uint64_t v35 = v53;
  *uint64_t v34 = v52;
  v34[1] = v35;
  uint64_t v36 = (void *)(v31 + v28);
  uint64_t v37 = v55;
  *uint64_t v36 = v54;
  v36[1] = v37;
  (*(void (**)(unint64_t, char *, uint64_t))(v43 + 32))(v31 + v29, v46, v45);
  uint64_t v38 = (void *)(v31 + v30);
  uint64_t v39 = v57;
  void *v38 = v56;
  v38[1] = v39;
  uint64_t v40 = (void *)(v31 + v47);
  uint64_t v41 = v59;
  *uint64_t v40 = v58;
  v40[1] = v41;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_24D1BA610((uint64_t)v49, (uint64_t)&unk_26985BE90, v31);
  return swift_release();
}

uint64_t sub_24D1BFA50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 232) = v16;
  *(void *)(v8 + 240) = v17;
  *(_OWORD *)(v8 + 216) = v15;
  *(_OWORD *)(v8 + 200) = v14;
  *(_OWORD *)(v8 + 184) = v13;
  *(void *)(v8 + 168) = a7;
  *(void *)(v8 + 176) = a8;
  *(void *)(v8 + 152) = a5;
  *(void *)(v8 + 160) = a6;
  *(void *)(v8 + 144) = a4;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BE50);
  *(void *)(v8 + 248) = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  *(void *)(v8 + 256) = v10;
  *(void *)(v8 + 264) = *(void *)(v10 + 64);
  *(void *)(v8 + 272) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D1BFB44, 0, 0);
}

uint64_t sub_24D1BFB44()
{
  uint64_t v1 = v0[34];
  uint64_t v2 = v0[31];
  uint64_t v3 = v0[32];
  uint64_t v19 = v0[30];
  uint64_t v4 = v0[18];
  uint64_t v5 = v0[19];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[35] = sub_24D217288();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  unint64_t v6 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v7 + v6, v1, v2);
  id v18 = (id)sub_24D217944((uint64_t)sub_24D1DBA74, v7);
  v0[36] = v18;
  swift_release();
  id v8 = *(id *)(v5 + 16);
  sub_24D218E60();

  uint64_t v9 = sub_24D2190E0();
  v0[37] = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = sub_24D2190E0();
  v0[38] = v10;
  uint64_t v11 = sub_24D2190E0();
  v0[39] = v11;
  uint64_t v12 = sub_24D2190E0();
  v0[40] = v12;
  uint64_t v13 = sub_24D218A40();
  v0[41] = v13;
  uint64_t v14 = sub_24D2190E0();
  v0[42] = v14;
  if (v19) {
    uint64_t v15 = sub_24D2190E0();
  }
  else {
    uint64_t v15 = 0;
  }
  v0[43] = v15;
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_24D1BFE14;
  uint64_t v16 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_24D1BA550;
  v0[13] = &block_descriptor_193;
  v0[14] = v16;
  objc_msgSend(v18, sel_createUtilitySubscriptionWithSiteID_utilityID_serviceLocationID_accessToken_accessTokenExpirationDate_refreshToken_utilityCustomerName_completionHandler_, v9, v10, v11, v12, v13, v14, v15, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_24D1BFE14()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 352) = v1;
  if (v1) {
    uint64_t v2 = sub_24D1C0010;
  }
  else {
    uint64_t v2 = sub_24D1BFF24;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D1BFF24()
{
  uint64_t v2 = (void *)v0[42];
  uint64_t v1 = (void *)v0[43];
  uint64_t v4 = (void *)v0[40];
  uint64_t v3 = (void *)v0[41];
  unint64_t v6 = (void *)v0[38];
  uint64_t v5 = (void *)v0[39];
  uint64_t v7 = (void *)v0[37];
  uint64_t v8 = v0[35];
  uint64_t v9 = v0[15];
  swift_unknownObjectRelease();

  objc_msgSend(*(id *)(v8 + 16), sel_invalidate);
  v0[17] = v9;
  sub_24D219220();
  swift_release();
  swift_task_dealloc();
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_24D1C0010()
{
  uint64_t v2 = (void *)v0[43];
  uint64_t v1 = v0[44];
  uint64_t v4 = (void *)v0[41];
  uint64_t v3 = (void *)v0[42];
  uint64_t v5 = (void *)v0[39];
  unint64_t v6 = (void *)v0[40];
  uint64_t v9 = (void *)v0[38];
  uint64_t v10 = (void *)v0[37];
  swift_willThrow();
  swift_release();
  swift_unknownObjectRelease();

  v0[16] = v1;
  sub_24D219210();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_24D1C0104(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v9 + 144) = v15;
  *(void *)(v9 + 152) = v8;
  *(_OWORD *)(v9 + 112) = v13;
  *(_OWORD *)(v9 + 128) = v14;
  *(void *)(v9 + 96) = a7;
  *(void *)(v9 + 104) = a8;
  *(void *)(v9 + 80) = a5;
  *(void *)(v9 + 88) = a6;
  *(void *)(v9 + 64) = a3;
  *(void *)(v9 + 72) = a4;
  *(void *)(v9 + 48) = a1;
  *(void *)(v9 + 56) = a2;
  uint64_t v10 = sub_24D219020();
  *(void *)(v9 + 160) = v10;
  *(void *)(v9 + 168) = *(void *)(v10 - 8);
  *(void *)(v9 + 176) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D1C01E4, 0, 0);
}

uint64_t sub_24D1C01E4()
{
  id v1 = *(id *)(*(void *)(v0 + 152) + 16);
  uint64_t v2 = sub_24D218E60();
  unint64_t v4 = v3;

  swift_bridgeObjectRelease();
  uint64_t v5 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    uint64_t v5 = v2 & 0xFFFFFFFFFFFFLL;
  }
  if (v5)
  {
    uint64_t v7 = *(void *)(v0 + 144);
    uint64_t v6 = *(void *)(v0 + 152);
    uint64_t v8 = *(void *)(v0 + 136);
    long long v31 = *(_OWORD *)(v0 + 104);
    long long v32 = *(_OWORD *)(v0 + 120);
    uint64_t v10 = *(void *)(v0 + 72);
    uint64_t v9 = *(void *)(v0 + 80);
    uint64_t v12 = *(void *)(v0 + 56);
    uint64_t v11 = *(void *)(v0 + 64);
    uint64_t v13 = *(void *)(v0 + 48);
    uint64_t v14 = swift_task_alloc();
    *(void *)(v0 + 184) = v14;
    long long v15 = *(_OWORD *)(v0 + 88);
    *(void *)(v14 + 16) = v6;
    *(void *)(v14 + 24) = v13;
    *(void *)(v14 + 32) = v12;
    *(void *)(v14 + 40) = v11;
    *(void *)(v14 + 48) = v10;
    *(void *)(v14 + 56) = v9;
    *(_OWORD *)(v14 + 64) = v15;
    *(_OWORD *)(v14 + 80) = v31;
    *(_OWORD *)(v14 + 96) = v32;
    *(void *)(v14 + 112) = v8;
    *(void *)(v14 + 120) = v7;
    uint64_t v16 = (void *)swift_task_alloc();
    *(void *)(v0 + 192) = v16;
    uint64_t v17 = sub_24D218ED0();
    *uint64_t v16 = v0;
    v16[1] = sub_24D1C0500;
    return MEMORY[0x270FA2360](v0 + 40, 0, 0, 0xD000000000000086, 0x800000024D21B820, sub_24D1D5C1C, v14, v17);
  }
  else
  {
    if (qword_26B18A2F8 != -1) {
      swift_once();
    }
    uint64_t v19 = *(void *)(v0 + 168);
    uint64_t v18 = *(void *)(v0 + 176);
    uint64_t v20 = *(void *)(v0 + 160);
    uint64_t v21 = __swift_project_value_buffer(v20, (uint64_t)qword_26B18A8F0);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v18, v21, v20);
    uint64_t v22 = sub_24D219000();
    os_log_type_t v23 = sub_24D2192D0();
    if (os_log_type_enabled(v22, v23))
    {
      unint64_t v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v24 = 0;
      _os_log_impl(&dword_24D1B6000, v22, v23, "Failed to create subscription. Site ID is empty.", v24, 2u);
      MEMORY[0x253322AA0](v24, -1, -1);
    }
    uint64_t v26 = *(void *)(v0 + 168);
    uint64_t v25 = *(void *)(v0 + 176);
    uint64_t v27 = *(void *)(v0 + 160);

    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v25, v27);
    sub_24D1D5A68();
    swift_allocError();
    unsigned char *v28 = 28;
    swift_willThrow();
    swift_task_dealloc();
    unint64_t v29 = *(uint64_t (**)(void))(v0 + 8);
    return v29(0);
  }
}

uint64_t sub_24D1C0500()
{
  *(void *)(*(void *)v1 + 200) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_24D1C069C;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_24D1C061C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D1C061C()
{
  uint64_t v1 = v0[19];
  uint64_t v2 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = v0[5];

  swift_task_dealloc();
  unint64_t v3 = (uint64_t (*)(uint64_t))v0[1];
  return v3(1);
}

uint64_t sub_24D1C069C()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1(0);
}

uint64_t sub_24D1C070C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  uint64_t v58 = a5;
  uint64_t v59 = a6;
  uint64_t v56 = a3;
  uint64_t v57 = a4;
  uint64_t v66 = a14;
  uint64_t v67 = a15;
  uint64_t v65 = a13;
  uint64_t v63 = a8;
  uint64_t v64 = a12;
  uint64_t v61 = a7;
  uint64_t v62 = a11;
  uint64_t v60 = a10;
  unint64_t v53 = a9;
  uint64_t v54 = a2;
  uint64_t v16 = sub_24D218AC0();
  uint64_t v51 = v16;
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = *(void *)(v17 + 64);
  MEMORY[0x270FA5388]();
  uint64_t v52 = (char *)&v47 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BE50);
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = *(void *)(v20 + 64);
  MEMORY[0x270FA5388]();
  uint64_t v50 = (char *)&v47 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5B0);
  MEMORY[0x270FA5388]();
  os_log_type_t v23 = (char *)&v47 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = v23;
  uint64_t v24 = sub_24D219240();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v23, 1, 1, v24);
  uint64_t v25 = v19;
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))((char *)&v47 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v19);
  uint64_t v49 = v17;
  (*(void (**)(char *, unint64_t, uint64_t))(v17 + 16))((char *)&v47 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0), v53, v16);
  unint64_t v26 = (*(unsigned __int8 *)(v20 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80);
  unint64_t v27 = (v21 + v26 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v28 = (v27 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v29 = (v28 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v30 = (v29 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v31 = (*(unsigned __int8 *)(v17 + 80) + v30 + 16) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
  unint64_t v32 = (v18 + v31 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v48 = (v32 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v53 = (v48 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v33 = swift_allocObject();
  *(void *)(v33 + 16) = 0;
  *(void *)(v33 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v20 + 32))(v33 + v26, v50, v25);
  *(void *)(v33 + v27) = v54;
  uint64_t v34 = (void *)(v33 + v28);
  uint64_t v35 = v57;
  *uint64_t v34 = v56;
  v34[1] = v35;
  uint64_t v36 = (void *)(v33 + v29);
  uint64_t v37 = v59;
  *uint64_t v36 = v58;
  v36[1] = v37;
  uint64_t v38 = (void *)(v33 + v30);
  uint64_t v39 = v63;
  void *v38 = v61;
  v38[1] = v39;
  (*(void (**)(unint64_t, char *, uint64_t))(v49 + 32))(v33 + v31, v52, v51);
  uint64_t v40 = (void *)(v33 + v32);
  uint64_t v41 = v62;
  *uint64_t v40 = v60;
  v40[1] = v41;
  uint64_t v42 = (void *)(v33 + v48);
  uint64_t v43 = v65;
  *uint64_t v42 = v64;
  v42[1] = v43;
  uint64_t v44 = (void *)(v33 + v53);
  uint64_t v45 = v67;
  *uint64_t v44 = v66;
  v44[1] = v45;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_24D1BA610((uint64_t)v55, (uint64_t)&unk_26985BE80, v33);
  return swift_release();
}

uint64_t sub_24D1C0AD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 248) = v17;
  *(void *)(v8 + 256) = v18;
  *(_OWORD *)(v8 + 232) = v16;
  *(_OWORD *)(v8 + 216) = v15;
  *(_OWORD *)(v8 + 200) = v14;
  *(_OWORD *)(v8 + 184) = v13;
  *(void *)(v8 + 168) = a7;
  *(void *)(v8 + 176) = a8;
  *(void *)(v8 + 152) = a5;
  *(void *)(v8 + 160) = a6;
  *(void *)(v8 + 144) = a4;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BE50);
  *(void *)(v8 + 264) = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  *(void *)(v8 + 272) = v10;
  *(void *)(v8 + 280) = *(void *)(v10 + 64);
  *(void *)(v8 + 288) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D1C0BD0, 0, 0);
}

uint64_t sub_24D1C0BD0()
{
  uint64_t v1 = v0[36];
  uint64_t v3 = v0[33];
  uint64_t v2 = v0[34];
  uint64_t v20 = v0[32];
  uint64_t v4 = v0[18];
  uint64_t v5 = v0[19];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[37] = sub_24D217288();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  unint64_t v6 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v7 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v2 + 32))(v7 + v6, v1, v3);
  id v19 = (id)sub_24D217944((uint64_t)sub_24D1DB630, v7);
  v0[38] = v19;
  swift_release();
  id v8 = *(id *)(v5 + 16);
  sub_24D218E60();

  uint64_t v18 = sub_24D2190E0();
  v0[39] = v18;
  swift_bridgeObjectRelease();
  uint64_t v9 = sub_24D2190E0();
  v0[40] = v9;
  uint64_t v10 = sub_24D2190E0();
  v0[41] = v10;
  uint64_t v11 = sub_24D2190E0();
  v0[42] = v11;
  uint64_t v12 = sub_24D218A40();
  v0[43] = v12;
  uint64_t v13 = sub_24D2190E0();
  v0[44] = v13;
  uint64_t v14 = sub_24D2190E0();
  v0[45] = v14;
  if (v20) {
    uint64_t v15 = sub_24D2190E0();
  }
  else {
    uint64_t v15 = 0;
  }
  v0[46] = v15;
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_24D1C0EC8;
  uint64_t v16 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_24D1BA550;
  v0[13] = &block_descriptor_185;
  v0[14] = v16;
  objc_msgSend(v19, sel_createUtilitySubscriptionWithSiteID_utilityID_serviceLocationID_accessToken_accessTokenExpirationDate_refreshToken_address_utilityCustomerName_completionHandler_, v18, v9, v10, v11, v12, v13, v14, v15, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_24D1C0EC8()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 376) = v1;
  if (v1) {
    uint64_t v2 = sub_24D1C10D0;
  }
  else {
    uint64_t v2 = sub_24D1C0FD8;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D1C0FD8()
{
  uint64_t v2 = (void *)v0[45];
  uint64_t v1 = (void *)v0[46];
  uint64_t v4 = (void *)v0[43];
  uint64_t v3 = (void *)v0[44];
  unint64_t v6 = (void *)v0[41];
  uint64_t v5 = (void *)v0[42];
  uint64_t v7 = (void *)v0[39];
  id v8 = (void *)v0[40];
  uint64_t v9 = v0[37];
  uint64_t v12 = v0[15];
  swift_unknownObjectRelease();

  objc_msgSend(*(id *)(v9 + 16), sel_invalidate);
  v0[17] = v12;
  sub_24D219220();
  swift_release();
  swift_task_dealloc();
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_24D1C10D0()
{
  uint64_t v2 = (void *)v0[46];
  uint64_t v1 = v0[47];
  uint64_t v4 = (void *)v0[44];
  uint64_t v3 = (void *)v0[45];
  uint64_t v5 = (void *)v0[42];
  unint64_t v6 = (void *)v0[43];
  uint64_t v9 = (void *)v0[41];
  uint64_t v10 = (void *)v0[40];
  uint64_t v11 = (void *)v0[39];
  swift_willThrow();
  swift_release();
  swift_unknownObjectRelease();

  v0[16] = v1;
  sub_24D219210();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_24D1C11D4()
{
  *(void *)(v1 + 24) = v0;
  return MEMORY[0x270FA2498](sub_24D1C11F4, 0, 0);
}

uint64_t sub_24D1C11F4()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v1;
  uint64_t v2 = sub_24D218ED0();
  *uint64_t v1 = v0;
  v1[1] = sub_24D1C12D4;
  uint64_t v3 = *(void *)(v0 + 24);
  return MEMORY[0x270FA2360](v0 + 16, 0, 0, 0xD00000000000001BLL, 0x800000024D21B8B0, sub_24D1D5C68, v3, v2);
}

uint64_t sub_24D1C12D4()
{
  *(void *)(*(void *)v1 + 40) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24D1C1458;
  }
  else {
    uint64_t v2 = sub_24D1C13E8;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D1C13E8()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = v0[2];

  uint64_t v3 = (uint64_t (*)(uint64_t))v0[1];
  return v3(1);
}

uint64_t sub_24D1C1458()
{
  return (*(uint64_t (**)(void))(v0 + 8))(0);
}

uint64_t sub_24D1C1474(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[18] = a4;
  v5[19] = a5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BE50);
  v5[20] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v5[21] = v7;
  v5[22] = *(void *)(v7 + 64);
  v5[23] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D1C1540, 0, 0);
}

uint64_t sub_24D1C1540()
{
  uint64_t v1 = v0[23];
  uint64_t v2 = v0[20];
  uint64_t v3 = v0[21];
  uint64_t v4 = v0[18];
  uint64_t v5 = v0[19];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[24] = sub_24D217288();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  unint64_t v6 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v7 + v6, v1, v2);
  id v8 = (void *)sub_24D217944((uint64_t)sub_24D1DB1BC, v7);
  v0[25] = v8;
  swift_release();
  id v9 = *(id *)(v5 + 16);
  sub_24D218E60();

  uint64_t v10 = sub_24D2190E0();
  v0[26] = v10;
  swift_bridgeObjectRelease();
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_24D1C1754;
  uint64_t v11 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_24D1BA550;
  v0[13] = &block_descriptor_177;
  v0[14] = v11;
  objc_msgSend(v8, sel_revokeUtilitySubscriptionWithSiteID_completionHandler_, v10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_24D1C1754()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 216) = v1;
  if (v1) {
    uint64_t v2 = sub_24D1DCDC4;
  }
  else {
    uint64_t v2 = sub_24D1DCDD4;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D1C1864()
{
  *(void *)(v1 + 24) = v0;
  return MEMORY[0x270FA2498](sub_24D1C1884, 0, 0);
}

uint64_t sub_24D1C1884()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v1;
  uint64_t v2 = sub_24D218ED0();
  *uint64_t v1 = v0;
  v1[1] = sub_24D1C1964;
  uint64_t v3 = *(void *)(v0 + 24);
  return MEMORY[0x270FA2360](v0 + 16, 0, 0, 0xD000000000000019, 0x800000024D21B8D0, sub_24D1D5CA8, v3, v2);
}

uint64_t sub_24D1C1964()
{
  *(void *)(*(void *)v1 + 40) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24D1C1AE4;
  }
  else {
    uint64_t v2 = sub_24D1C1A78;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D1C1A78()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = v0[2];

  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_24D1C1AE4()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24D1C1AFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[18] = a4;
  v5[19] = a5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BE50);
  v5[20] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v5[21] = v7;
  v5[22] = *(void *)(v7 + 64);
  v5[23] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D1C1BC8, 0, 0);
}

uint64_t sub_24D1C1BC8()
{
  uint64_t v1 = v0[23];
  uint64_t v2 = v0[20];
  uint64_t v3 = v0[21];
  uint64_t v4 = v0[18];
  uint64_t v5 = v0[19];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[24] = sub_24D217288();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  unint64_t v6 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v7 + v6, v1, v2);
  id v8 = (void *)sub_24D217944((uint64_t)sub_24D1DAF60, v7);
  v0[25] = v8;
  swift_release();
  id v9 = *(id *)(v5 + 16);
  sub_24D218E60();

  uint64_t v10 = sub_24D2190E0();
  v0[26] = v10;
  swift_bridgeObjectRelease();
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_24D1C1DDC;
  uint64_t v11 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_24D1BA550;
  v0[13] = &block_descriptor_169;
  v0[14] = v11;
  objc_msgSend(v8, sel_renewUtilityAccessTokenWithSiteID_completionHandler_, v10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_24D1C1DDC()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 216) = v1;
  if (v1) {
    uint64_t v2 = sub_24D1C1FA0;
  }
  else {
    uint64_t v2 = sub_24D1C1EEC;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D1C1EEC()
{
  uint64_t v1 = (void *)v0[26];
  uint64_t v2 = v0[24];
  uint64_t v3 = v0[15];
  swift_unknownObjectRelease();

  objc_msgSend(*(id *)(v2 + 16), sel_invalidate);
  v0[17] = v3;
  sub_24D219220();
  swift_release();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_24D1C1FA0()
{
  uint64_t v2 = (void *)v0[26];
  uint64_t v1 = v0[27];
  swift_willThrow();
  swift_release();
  swift_unknownObjectRelease();

  v0[16] = v1;
  sub_24D219210();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_24D1C2054(void *a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = sub_24D219020();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B18A2F8 != -1) {
    swift_once();
  }
  uint64_t v12 = __swift_project_value_buffer(v8, (uint64_t)qword_26B18A8F0);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v12, v8);
  id v13 = a1;
  id v14 = a1;
  uint64_t v15 = sub_24D219000();
  os_log_type_t v16 = sub_24D2192D0();
  if (os_log_type_enabled(v15, v16))
  {
    unint64_t v17 = a4;
    uint64_t v18 = swift_slowAlloc();
    uint64_t v26 = swift_slowAlloc();
    uint64_t v29 = v26;
    *(_DWORD *)uint64_t v18 = 136315394;
    uint64_t v27 = a2;
    uint64_t v28 = sub_24D1D0A78(a3, v17, &v29);
    sub_24D219310();
    *(_WORD *)(v18 + 12) = 2080;
    uint64_t v28 = (uint64_t)a1;
    id v19 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5D0);
    uint64_t v20 = sub_24D219100();
    uint64_t v28 = sub_24D1D0A78(v20, v21, &v29);
    sub_24D219310();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_24D1B6000, v15, v16, "%s error: %s", (uint8_t *)v18, 0x16u);
    uint64_t v22 = v26;
    swift_arrayDestroy();
    MEMORY[0x253322AA0](v22, -1, -1);
    MEMORY[0x253322AA0](v18, -1, -1);
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v29 = (uint64_t)a1;
  id v23 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985BE50);
  return sub_24D219210();
}

uint64_t sub_24D1C2358()
{
  sub_24D218C80();
  uint64_t v1 = (void *)sub_24D2190E0();
  swift_bridgeObjectRelease();
  uint64_t v2 = (void *)v0[3];
  uint64_t v3 = (void *)v0[5];
  v9[4] = sub_24D1D9D60;
  uint64_t v10 = v0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 1107296256;
  v9[2] = sub_24D1DCDF4;
  v9[3] = &block_descriptor_118_0;
  uint64_t v4 = _Block_copy(v9);
  id v5 = v1;
  id v6 = v3;
  swift_retain();
  swift_release();
  id v7 = objc_msgSend(v2, sel_addObserverForName_object_queue_usingBlock_, v5, 0, v6, v4);
  _Block_release(v4);

  v0[4] = v7;
  return swift_unknownObjectRelease();
}

uint64_t sub_24D1C2484(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_24D219020();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  id v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_24D2189F0();
  if (!v7)
  {
    long long v35 = 0u;
    long long v36 = 0u;
    return sub_24D1D9A80((uint64_t)&v35, &qword_26B18A5D8);
  }
  uint64_t v8 = v7;
  uint64_t v32 = 0xD000000000000011;
  unint64_t v33 = 0x800000024D21BBE0;
  sub_24D2193A0();
  if (*(void *)(v8 + 16) && (unint64_t v9 = sub_24D1D126C((uint64_t)v34), (v10 & 1) != 0))
  {
    sub_24D1D6414(*(void *)(v8 + 56) + 32 * v9, (uint64_t)&v35);
  }
  else
  {
    long long v35 = 0u;
    long long v36 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_24D1D98B8((uint64_t)v34);
  if (!*((void *)&v36 + 1)) {
    return sub_24D1D9A80((uint64_t)&v35, &qword_26B18A5D8);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A608);
  uint64_t result = swift_dynamicCast();
  if (result)
  {
    if (qword_26B18A2F8 != -1) {
      swift_once();
    }
    uint64_t v12 = __swift_project_value_buffer(v3, (uint64_t)qword_26B18A8F0);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v12, v3);
    swift_bridgeObjectRetain();
    id v13 = sub_24D219000();
    os_log_type_t v14 = sub_24D2192E0();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = swift_slowAlloc();
      uint64_t v31 = a2;
      os_log_type_t v16 = (uint8_t *)v15;
      uint64_t v30 = swift_slowAlloc();
      *(void *)&long long v35 = v30;
      *(_DWORD *)os_log_type_t v16 = 136315138;
      uint64_t v29 = v16 + 4;
      uint64_t v17 = swift_bridgeObjectRetain();
      uint64_t v18 = MEMORY[0x253322140](v17, MEMORY[0x263F8D310]);
      unint64_t v20 = v19;
      swift_bridgeObjectRelease();
      uint64_t v32 = sub_24D1D0A78(v18, v20, (uint64_t *)&v35);
      sub_24D219310();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24D1B6000, v13, v14, "Received DidUpdateGuidance for %s", v16, 0xCu);
      uint64_t v21 = v30;
      swift_arrayDestroy();
      MEMORY[0x253322AA0](v21, -1, -1);
      uint64_t v22 = v16;
      a2 = v31;
      MEMORY[0x253322AA0](v22, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    swift_beginAccess();
    uint64_t result = MEMORY[0x253322B70](a2 + 48);
    if (result)
    {
      uint64_t v23 = *(void *)(a2 + 56);
      uint64_t ObjectType = swift_getObjectType();
      id v25 = *(id *)(a2 + 16);
      uint64_t v26 = sub_24D218E60();
      uint64_t v28 = v27;

      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v23 + 8))(v26, v28, ObjectType, v23);
      swift_bridgeObjectRelease();
      return swift_unknownObjectRelease();
    }
  }
  return result;
}

uint64_t static EnergySite.createSite(name:)(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  uint64_t v3 = sub_24D218B10();
  v2[4] = v3;
  v2[5] = *(void *)(v3 - 8);
  v2[6] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D1C2948, 0, 0);
}

uint64_t sub_24D1C2948()
{
  uint64_t v2 = v0[5];
  uint64_t v1 = v0[6];
  uint64_t v3 = v0[4];
  sub_24D218B00();
  uint64_t v4 = sub_24D218AE0();
  uint64_t v6 = v5;
  v0[7] = v5;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v7 = (void *)swift_task_alloc();
  v0[8] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_24D1C2A2C;
  uint64_t v9 = v0[2];
  uint64_t v8 = v0[3];
  return sub_24D1D5CE8(v9, v8, v4, v6);
}

uint64_t sub_24D1C2A2C(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t static EnergySite.createSite(name:clientProvidedID:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  uint64_t v5 = sub_24D218B10();
  v4[6] = v5;
  v4[7] = *(void *)(v5 - 8);
  v4[8] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D1C2C2C, 0, 0);
}

uint64_t sub_24D1C2C2C()
{
  unint64_t v1 = v0[5];
  uint64_t v2 = HIBYTE(v1) & 0xF;
  if ((v1 & 0x2000000000000000) == 0) {
    uint64_t v2 = v0[4] & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v3 = v0[8];
  if (v2)
  {
    uint64_t v4 = v0[6];
    uint64_t v5 = v0[7];
    sub_24D219110();
    sub_24D218ED0();
    sub_24D218DD0();
    sub_24D218AD0();
    uint64_t v6 = sub_24D218AE0();
    uint64_t v8 = v7;
    v0[9] = v6;
    v0[10] = v7;
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
    uint64_t v12 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_26985BB08 + dword_26985BB08);
    swift_bridgeObjectRetain();
    uint64_t v9 = (void *)swift_task_alloc();
    v0[11] = v9;
    *uint64_t v9 = v0;
    v9[1] = sub_24D1C2DBC;
    return v12(v6, v8);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v11 = (uint64_t (*)(void))v0[1];
    return v11(0);
  }
}

uint64_t sub_24D1C2DBC(uint64_t a1)
{
  *(void *)(*(void *)v1 + 96) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24D1C2EBC, 0, 0);
}

uint64_t sub_24D1C2EBC()
{
  uint64_t v1 = v0[12];
  if (v1)
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    uint64_t v2 = (uint64_t (*)(uint64_t))v0[1];
    return v2(v1);
  }
  else
  {
    uint64_t v4 = (void *)swift_task_alloc();
    v0[13] = v4;
    *uint64_t v4 = v0;
    v4[1] = sub_24D1C2FA0;
    uint64_t v5 = v0[9];
    uint64_t v6 = v0[10];
    uint64_t v8 = v0[2];
    uint64_t v7 = v0[3];
    return sub_24D1D5CE8(v8, v7, v5, v6);
  }
}

uint64_t sub_24D1C2FA0(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_24D1C30D8()
{
  v1[5] = v0;
  uint64_t v2 = sub_24D219020();
  v1[6] = v2;
  v1[7] = *(void *)(v2 - 8);
  v1[8] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D1C3198, 0, 0);
}

uint64_t sub_24D1C3198()
{
  id v1 = *(id *)(v0[5] + 16);
  uint64_t v2 = sub_24D218E60();
  unint64_t v4 = v3;

  swift_bridgeObjectRelease();
  uint64_t v5 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    uint64_t v5 = v2 & 0xFFFFFFFFFFFFLL;
  }
  if (v5)
  {
    uint64_t v6 = (void *)swift_task_alloc();
    v0[9] = v6;
    *uint64_t v6 = v0;
    v6[1] = sub_24D1C3434;
    uint64_t v7 = v0[5];
    uint64_t v8 = MEMORY[0x263F8EE60] + 8;
    return MEMORY[0x270FA2360](v6, 0, 0, 0x7265747369676572, 0xEA00000000002928, sub_24D1D990C, v7, v8);
  }
  else
  {
    if (qword_26B18A2F8 != -1) {
      swift_once();
    }
    uint64_t v10 = v0[7];
    uint64_t v9 = v0[8];
    uint64_t v11 = v0[6];
    uint64_t v12 = __swift_project_value_buffer(v11, (uint64_t)qword_26B18A8F0);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v9, v12, v11);
    uint64_t v13 = sub_24D219000();
    os_log_type_t v14 = sub_24D2192D0();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl(&dword_24D1B6000, v13, v14, "Failed to register site. Site ID is empty.", v15, 2u);
      MEMORY[0x253322AA0](v15, -1, -1);
    }
    uint64_t v17 = v0[7];
    uint64_t v16 = v0[8];
    uint64_t v18 = v0[6];

    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);
    sub_24D1D5A68();
    swift_allocError();
    *unint64_t v19 = 28;
    swift_willThrow();
    swift_task_dealloc();
    unint64_t v20 = (uint64_t (*)(void))v0[1];
    return v20();
  }
}

uint64_t sub_24D1C3434()
{
  *(void *)(*(void *)v1 + 80) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24D1C35AC;
  }
  else {
    uint64_t v2 = sub_24D1C3548;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D1C3548()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24D1C35AC()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24D1C3610(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[16] = a4;
  v5[17] = a5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A808);
  v5[18] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v5[19] = v7;
  v5[20] = *(void *)(v7 + 64);
  v5[21] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D1C36DC, 0, 0);
}

uint64_t sub_24D1C36DC()
{
  uint64_t v1 = v0[21];
  uint64_t v2 = v0[18];
  uint64_t v3 = v0[19];
  uint64_t v4 = v0[16];
  uint64_t v5 = v0[17];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[22] = sub_24D217288();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  unint64_t v6 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v7 + v6, v1, v2);
  uint64_t v8 = (void *)sub_24D217944((uint64_t)sub_24D1D9BD8, v7);
  v0[23] = v8;
  swift_release();
  uint64_t v9 = *(void **)(v5 + 16);
  v0[24] = v9;
  v0[2] = v0;
  v0[3] = sub_24D1C38BC;
  uint64_t v10 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_24D1C39CC;
  v0[13] = &block_descriptor;
  v0[14] = v10;
  objc_msgSend(v8, sel_registerEnergySiteWithSite_completionHandler_, v9, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_24D1C38BC()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 200) = v1;
  if (v1) {
    uint64_t v2 = sub_24D1DCDE4;
  }
  else {
    uint64_t v2 = sub_24D1DCDD8;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D1C39CC(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5D0);
    uint64_t v4 = swift_allocError();
    *uint64_t v5 = a2;
    id v6 = a2;
    return MEMORY[0x270FA2410](v2, v4);
  }
  else
  {
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_24D1C3A64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A800);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388]();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5B0);
  MEMORY[0x270FA5388]();
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_24D219240();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  unint64_t v12 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = 0;
  *(void *)(v13 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v13 + v12, (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  os_log_type_t v14 = (void *)(v13 + ((v8 + v12 + 7) & 0xFFFFFFFFFFFFFFF8));
  *os_log_type_t v14 = a2;
  v14[1] = a3;
  swift_bridgeObjectRetain();
  sub_24D1BA610((uint64_t)v10, (uint64_t)&unk_26985BDF0, v13);
  return swift_release();
}

uint64_t sub_24D1C3C58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[19] = a5;
  v6[20] = a6;
  v6[18] = a4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A800);
  v6[21] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v6[22] = v8;
  v6[23] = *(void *)(v8 + 64);
  v6[24] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D1C3D28, 0, 0);
}

uint64_t sub_24D1C3D28()
{
  uint64_t v1 = v0[24];
  uint64_t v2 = v0[21];
  uint64_t v3 = v0[22];
  uint64_t v4 = v0[18];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[25] = sub_24D217288();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v6 + v5, v1, v2);
  uint64_t v7 = (void *)sub_24D217944((uint64_t)sub_24D1DA4DC, v6);
  v0[26] = v7;
  swift_release();
  uint64_t v8 = sub_24D2190E0();
  v0[27] = v8;
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_24D1C3F20;
  uint64_t v9 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_24D1C4030;
  v0[13] = &block_descriptor_136;
  v0[14] = v9;
  objc_msgSend(v7, sel_siteWithSiteID_completionHandler_, v8);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_24D1C3F20()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 224) = v1;
  if (v1) {
    uint64_t v2 = sub_24D1DCDE8;
  }
  else {
    uint64_t v2 = sub_24D1DCDDC;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D1C4030(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5D0);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return MEMORY[0x270FA2410](v3, v5);
  }
  else
  {
    uint64_t v11 = a2;
    uint64_t v8 = *(void *)(*(void *)(v3 + 64) + 40);
    id v9 = a2;
    sub_24D1DC0B8((uint64_t)&v11, v8, qword_26B18A620);
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_24D1C40FC()
{
  *(void *)(v1 + 16) = v0;
  return MEMORY[0x270FA2498](sub_24D1C411C, 0, 0);
}

uint64_t sub_24D1C411C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24D1C41EC;
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = MEMORY[0x263F8EE60] + 8;
  return MEMORY[0x270FA2360](v1, 0, 0, 0x29286574656C6564, 0xE800000000000000, sub_24D1D6244, v2, v3);
}

uint64_t sub_24D1C41EC()
{
  *(void *)(*(void *)v1 + 32) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24D1C4318;
  }
  else {
    uint64_t v2 = sub_24D1C4300;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D1C4300()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24D1C4318()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24D1C4330(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[16] = a4;
  v5[17] = a5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A808);
  v5[18] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v5[19] = v7;
  v5[20] = *(void *)(v7 + 64);
  v5[21] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D1C43FC, 0, 0);
}

uint64_t sub_24D1C43FC()
{
  uint64_t v1 = v0[21];
  uint64_t v2 = v0[18];
  uint64_t v3 = v0[19];
  uint64_t v4 = v0[16];
  uint64_t v5 = v0[17];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[22] = sub_24D217288();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  unint64_t v6 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v7 + v6, v1, v2);
  uint64_t v8 = (void *)sub_24D217944((uint64_t)sub_24D1DADF4, v7);
  v0[23] = v8;
  swift_release();
  uint64_t v9 = *(void **)(v5 + 16);
  v0[24] = v9;
  v0[2] = v0;
  v0[3] = sub_24D1C45DC;
  uint64_t v10 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_24D1C39CC;
  v0[13] = &block_descriptor_160;
  v0[14] = v10;
  objc_msgSend(v8, sel_deleteEnergySiteWithSite_completionHandler_, v9, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_24D1C45DC()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 200) = v1;
  if (v1) {
    uint64_t v2 = sub_24D1C478C;
  }
  else {
    uint64_t v2 = sub_24D1C46EC;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D1C46EC()
{
  uint64_t v1 = (void *)v0[24];
  uint64_t v2 = v0[22];
  swift_unknownObjectRelease();

  objc_msgSend(*(id *)(v2 + 16), sel_invalidate);
  sub_24D219220();
  swift_release();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_24D1C478C()
{
  uint64_t v2 = (void *)v0[24];
  uint64_t v1 = v0[25];
  swift_willThrow();
  swift_release();
  swift_unknownObjectRelease();

  v0[15] = v1;
  sub_24D219210();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_24D1C4840(void *a1, uint64_t a2, const char *a3, uint64_t *a4)
{
  uint64_t v8 = sub_24D219020();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B18A2F8 != -1) {
    swift_once();
  }
  uint64_t v12 = __swift_project_value_buffer(v8, (uint64_t)qword_26B18A8F0);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v12, v8);
  id v13 = a1;
  id v14 = a1;
  uint64_t v15 = sub_24D219000();
  os_log_type_t v16 = sub_24D2192D0();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v27 = a4;
    uint64_t v17 = swift_slowAlloc();
    uint64_t v28 = a2;
    uint64_t v18 = (uint8_t *)v17;
    uint64_t v19 = swift_slowAlloc();
    uint64_t v29 = (uint64_t)a1;
    uint64_t v30 = v19;
    uint64_t v26 = a3;
    *(_DWORD *)uint64_t v18 = 136315138;
    v25[1] = v18 + 4;
    id v20 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5D0);
    uint64_t v21 = sub_24D219100();
    uint64_t v29 = sub_24D1D0A78(v21, v22, &v30);
    sub_24D219310();
    a4 = v27;
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_24D1B6000, v15, v16, v26, v18, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253322AA0](v19, -1, -1);
    MEMORY[0x253322AA0](v18, -1, -1);
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v30 = (uint64_t)a1;
  id v23 = a1;
  __swift_instantiateConcreteTypeFromMangledName(a4);
  return sub_24D219210();
}

uint64_t EnergySite.EnergyUsageTimeInterval.coreAnalyticsEnumKey.getter()
{
  return *v0;
}

EnergyKit::EnergySite::EnergyUsageTimeInterval_optional __swiftcall EnergySite.EnergyUsageTimeInterval.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_24D2194B0();
  result.value = swift_bridgeObjectRelease();
  char v5 = 5;
  if (v3 < 5) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

uint64_t EnergySite.EnergyUsageTimeInterval.rawValue.getter()
{
  return qword_24D219FF0[*v0];
}

EnergyKit::EnergySite::EnergyUsageTimeInterval_optional sub_24D1C4B98(Swift::String *a1)
{
  return EnergySite.EnergyUsageTimeInterval.init(rawValue:)(*a1);
}

uint64_t sub_24D1C4BA4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnergySite.EnergyUsageTimeInterval.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_24D1C4BCC()
{
  return sub_24D1C4BD4();
}

uint64_t sub_24D1C4BD4()
{
  return sub_24D2195B0();
}

uint64_t sub_24D1C4C40()
{
  return sub_24D1C4C48();
}

uint64_t sub_24D1C4C48()
{
  sub_24D219120();

  return swift_bridgeObjectRelease();
}

uint64_t sub_24D1C4C9C()
{
  return sub_24D1C4CA4();
}

uint64_t sub_24D1C4CA4()
{
  return sub_24D2195B0();
}

uint64_t sub_24D1C4D0C(char *a1, char *a2)
{
  return sub_24D20B9B4(*a1, *a2);
}

BOOL static EnergySite.HistoricalEnergyUsageError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t EnergySite.HistoricalEnergyUsageError.hash(into:)()
{
  return sub_24D2195A0();
}

uint64_t EnergySite.HistoricalEnergyUsageError.hashValue.getter()
{
  return sub_24D2195B0();
}

BOOL sub_24D1C4DA0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_24D1C4DB4()
{
  return sub_24D2195B0();
}

uint64_t sub_24D1C4DFC()
{
  return sub_24D2195A0();
}

uint64_t sub_24D1C4E28()
{
  return sub_24D2195B0();
}

double EnergySite.EnergyUsage.net.getter()
{
  return *(double *)(v0 + *(int *)(type metadata accessor for EnergySite.EnergyUsage(0) + 20));
}

double EnergySite.EnergyUsage.imports.getter()
{
  return *(double *)(v0 + *(int *)(type metadata accessor for EnergySite.EnergyUsage(0) + 24));
}

double EnergySite.EnergyUsage.exports.getter()
{
  return *(double *)(v0 + *(int *)(type metadata accessor for EnergySite.EnergyUsage(0) + 28));
}

uint64_t EnergySite.EnergyUsage.netByPricingPeriod.getter()
{
  type metadata accessor for EnergySite.EnergyUsage(0);

  return swift_bridgeObjectRetain();
}

uint64_t EnergySite.EnergyUsage.importsByPricingPeriod.getter()
{
  type metadata accessor for EnergySite.EnergyUsage(0);

  return swift_bridgeObjectRetain();
}

uint64_t EnergySite.EnergyUsage.exportsByPricingPeriod.getter()
{
  type metadata accessor for EnergySite.EnergyUsage(0);

  return swift_bridgeObjectRetain();
}

uint64_t EnergySite.EnergyUsage.netByTOU.getter()
{
  type metadata accessor for EnergySite.EnergyUsage(0);

  return swift_bridgeObjectRetain();
}

uint64_t EnergySite.EnergyUsage.subintervalCount.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for EnergySite.EnergyUsage(0) + 48));
}

uint64_t EnergySite.EnergyUsage.isValid.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for EnergySite.EnergyUsage(0) + 52));
}

unint64_t sub_24D1C5004(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A820);
  uint64_t v2 = sub_24D219490();
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
    sub_24D1D9D68(v6, (uint64_t)v15, &qword_26B18A818);
    unint64_t result = sub_24D1D126C((uint64_t)v15);
    if (v8) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v9 = v3[6] + 40 * result;
    long long v10 = v15[0];
    long long v11 = v15[1];
    *(void *)(v9 + 32) = v16;
    *(_OWORD *)uint64_t v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    unint64_t result = (unint64_t)sub_24D1D97B4(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 72;
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

unint64_t sub_24D1C5148(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985BDA8);
  uint64_t v2 = sub_24D219490();
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
    sub_24D1D9D68(v6, (uint64_t)&v15, &qword_26985BDB0);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_24D1D12EC(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    long long v11 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_24D1D97B4(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
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

uint64_t EnergySite.EnergyUsage.init(startTime:imports:exports:importsByPricingPeriod:exportsByPricingPeriod:subintervalCount:isValid:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X8>, double a7@<D0>, double a8@<D1>)
{
  uint64_t v16 = sub_24D218AC0();
  uint64_t v70 = *(void *)(v16 - 8);
  uint64_t v71 = v16;
  (*(void (**)(uint64_t, uint64_t))(v70 + 16))(a6, a1);
  long long v17 = (int *)type metadata accessor for EnergySite.EnergyUsage(0);
  *(double *)(a6 + v17[5]) = a7 - a8;
  *(double *)(a6 + v17[6]) = a7;
  *(double *)(a6 + v17[7]) = a8;
  *(void *)(a6 + v17[10]) = a3;
  uint64_t v72 = v17;
  uint64_t v73 = a6;
  *(void *)(a6 + v17[9]) = a2;
  if (!*(void *)(a3 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v18 = a2;
    goto LABEL_40;
  }
  uint64_t v68 = a4;
  char v69 = a5;
  unint64_t v18 = sub_24D1D62D4(MEMORY[0x263F8EE78], (uint64_t (*)(uint64_t))sub_24D1D12B0);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  uint64_t v19 = sub_24D1C5834(a2);
  uint64_t v20 = swift_bridgeObjectRetain();
  uint64_t v21 = sub_24D1C5D58(v20, v19);
  int64_t v22 = 0;
  uint64_t v74 = v21 + 56;
  uint64_t v23 = 1 << *(unsigned char *)(v21 + 32);
  uint64_t v24 = -1;
  if (v23 < 64) {
    uint64_t v24 = ~(-1 << v23);
  }
  unint64_t v25 = v24 & *(void *)(v21 + 56);
  int64_t v75 = (unint64_t)(v23 + 63) >> 6;
  uint64_t v76 = v21;
  while (v25)
  {
    unint64_t v26 = __clz(__rbit64(v25));
    v25 &= v25 - 1;
    unint64_t v27 = v26 | (v22 << 6);
LABEL_23:
    uint64_t v31 = *(void *)(*(void *)(v76 + 48) + 8 * v27);
    double v32 = 0.0;
    double v33 = 0.0;
    if (*(void *)(a2 + 16))
    {
      unint64_t v34 = sub_24D1D12B0(v31);
      if (v35) {
        double v33 = *(double *)(*(void *)(a2 + 56) + 8 * v34);
      }
    }
    if (*(void *)(a3 + 16))
    {
      unint64_t v36 = sub_24D1D12B0(v31);
      if (v37) {
        double v32 = *(double *)(*(void *)(a3 + 56) + 8 * v36);
      }
    }
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v40 = sub_24D1D12B0(v31);
    uint64_t v41 = *(void *)(v18 + 16);
    BOOL v42 = (v39 & 1) == 0;
    uint64_t v43 = v41 + v42;
    if (__OFADD__(v41, v42))
    {
      __break(1u);
LABEL_64:
      __break(1u);
LABEL_65:
      __break(1u);
LABEL_66:
      __break(1u);
LABEL_67:
      __break(1u);
      goto LABEL_68;
    }
    char v44 = v39;
    if (*(void *)(v18 + 24) >= v43)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
        sub_24D1D287C();
      }
    }
    else
    {
      sub_24D1D1DD4(v43, isUniquelyReferenced_nonNull_native);
      unint64_t v45 = sub_24D1D12B0(v31);
      if ((v44 & 1) != (v46 & 1)) {
        goto LABEL_70;
      }
      unint64_t v40 = v45;
    }
    double v47 = v33 - v32;
    if (v44)
    {
      *(double *)(*(void *)(v18 + 56) + 8 * v40) = v47;
    }
    else
    {
      *(void *)(v18 + 8 * (v40 >> 6) + 64) |= 1 << v40;
      uint64_t v48 = 8 * v40;
      *(void *)(*(void *)(v18 + 48) + v48) = v31;
      *(double *)(*(void *)(v18 + 56) + v48) = v47;
      uint64_t v49 = *(void *)(v18 + 16);
      BOOL v50 = __OFADD__(v49, 1);
      uint64_t v51 = v49 + 1;
      if (v50) {
        goto LABEL_66;
      }
      *(void *)(v18 + 16) = v51;
    }
    swift_bridgeObjectRelease();
  }
  int64_t v28 = v22 + 1;
  if (__OFADD__(v22, 1)) {
    goto LABEL_67;
  }
  if (v28 >= v75) {
    goto LABEL_38;
  }
  unint64_t v29 = *(void *)(v74 + 8 * v28);
  ++v22;
  if (v29) {
    goto LABEL_22;
  }
  int64_t v22 = v28 + 1;
  if (v28 + 1 >= v75) {
    goto LABEL_38;
  }
  unint64_t v29 = *(void *)(v74 + 8 * v22);
  if (v29) {
    goto LABEL_22;
  }
  int64_t v22 = v28 + 2;
  if (v28 + 2 >= v75) {
    goto LABEL_38;
  }
  unint64_t v29 = *(void *)(v74 + 8 * v22);
  if (v29)
  {
LABEL_22:
    unint64_t v25 = (v29 - 1) & v29;
    unint64_t v27 = __clz(__rbit64(v29)) + (v22 << 6);
    goto LABEL_23;
  }
  int64_t v30 = v28 + 3;
  if (v30 >= v75) {
    goto LABEL_38;
  }
  unint64_t v29 = *(void *)(v74 + 8 * v30);
  if (v29)
  {
    int64_t v22 = v30;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v22 = v30 + 1;
    if (__OFADD__(v30, 1)) {
      goto LABEL_69;
    }
    if (v22 >= v75) {
      break;
    }
    unint64_t v29 = *(void *)(v74 + 8 * v22);
    ++v30;
    if (v29) {
      goto LABEL_22;
    }
  }
LABEL_38:
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  a5 = v69;
  a4 = v68;
LABEL_40:
  *(void *)(v73 + v72[8]) = v18;
  swift_bridgeObjectRetain();
  uint64_t v52 = sub_24D2191D0();
  uint64_t v53 = v52;
  int64_t v54 = 0;
  *(void *)(v52 + 16) = 5;
  *(_OWORD *)(v52 + 32) = 0u;
  *(_OWORD *)(v52 + 48) = 0u;
  *(void *)(v52 + 64) = 0;
  unint64_t v55 = v18 + 64;
  uint64_t v56 = 1 << *(unsigned char *)(v18 + 32);
  uint64_t v57 = -1;
  if (v56 < 64) {
    uint64_t v57 = ~(-1 << v56);
  }
  unint64_t v58 = v57 & *(void *)(v18 + 64);
  int64_t v59 = (unint64_t)(v56 + 63) >> 6;
  while (2)
  {
    if (v58)
    {
      unint64_t v60 = __clz(__rbit64(v58));
      v58 &= v58 - 1;
      unint64_t v61 = v60 | (v54 << 6);
      goto LABEL_59;
    }
    int64_t v62 = v54 + 1;
    if (__OFADD__(v54, 1)) {
      goto LABEL_65;
    }
    if (v62 >= v59)
    {
LABEL_62:
      (*(void (**)(uint64_t, uint64_t))(v70 + 8))(a1, v71);
      uint64_t result = swift_release();
      *(void *)(v73 + v72[11]) = v53;
      *(void *)(v73 + v72[12]) = a4;
      *(unsigned char *)(v73 + v72[13]) = a5 & 1;
      return result;
    }
    unint64_t v63 = *(void *)(v55 + 8 * v62);
    ++v54;
    if (v63) {
      goto LABEL_58;
    }
    int64_t v54 = v62 + 1;
    if (v62 + 1 >= v59) {
      goto LABEL_62;
    }
    unint64_t v63 = *(void *)(v55 + 8 * v54);
    if (v63) {
      goto LABEL_58;
    }
    int64_t v54 = v62 + 2;
    if (v62 + 2 >= v59) {
      goto LABEL_62;
    }
    unint64_t v63 = *(void *)(v55 + 8 * v54);
    if (v63)
    {
LABEL_58:
      unint64_t v58 = (v63 - 1) & v63;
      unint64_t v61 = __clz(__rbit64(v63)) + (v54 << 6);
LABEL_59:
      uint64_t v65 = 8 * v61;
      unint64_t v66 = *(void *)(*(void *)(v18 + 48) + v65);
      if (v66 < 5)
      {
        if (v66 >= *(void *)(v52 + 16)) {
          goto LABEL_64;
        }
        *(void *)(v52 + 32 + 8 * v66) = *(void *)(*(void *)(v18 + 56) + v65);
      }
      continue;
    }
    break;
  }
  int64_t v64 = v62 + 3;
  if (v64 >= v59) {
    goto LABEL_62;
  }
  unint64_t v63 = *(void *)(v55 + 8 * v64);
  if (v63)
  {
    int64_t v54 = v64;
    goto LABEL_58;
  }
  while (1)
  {
    int64_t v54 = v64 + 1;
    if (__OFADD__(v64, 1)) {
      break;
    }
    if (v54 >= v59) {
      goto LABEL_62;
    }
    unint64_t v63 = *(void *)(v55 + 8 * v54);
    ++v64;
    if (v63) {
      goto LABEL_58;
    }
  }
LABEL_68:
  __break(1u);
LABEL_69:
  __break(1u);
LABEL_70:
  uint64_t result = sub_24D219520();
  __break(1u);
  return result;
}

uint64_t sub_24D1C5834(uint64_t a1)
{
  uint64_t result = sub_24D219290();
  int64_t v3 = 0;
  uint64_t v15 = result;
  uint64_t v4 = a1 + 64;
  uint64_t v5 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(a1 + 64);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  while (1)
  {
    if (v7)
    {
      unint64_t v9 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v10 = v9 | (v3 << 6);
      goto LABEL_5;
    }
    int64_t v11 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v11 >= v8) {
      goto LABEL_23;
    }
    unint64_t v12 = *(void *)(v4 + 8 * v11);
    ++v3;
    if (!v12)
    {
      int64_t v3 = v11 + 1;
      if (v11 + 1 >= v8) {
        goto LABEL_23;
      }
      unint64_t v12 = *(void *)(v4 + 8 * v3);
      if (!v12)
      {
        int64_t v3 = v11 + 2;
        if (v11 + 2 >= v8) {
          goto LABEL_23;
        }
        unint64_t v12 = *(void *)(v4 + 8 * v3);
        if (!v12)
        {
          int64_t v3 = v11 + 3;
          if (v11 + 3 >= v8) {
            goto LABEL_23;
          }
          unint64_t v12 = *(void *)(v4 + 8 * v3);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v7 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v3 << 6);
LABEL_5:
    uint64_t result = sub_24D1D1804(&v14, *(void *)(*(void *)(a1 + 48) + 8 * v10));
  }
  int64_t v13 = v11 + 4;
  if (v13 >= v8)
  {
LABEL_23:
    swift_release();
    return v15;
  }
  unint64_t v12 = *(void *)(v4 + 8 * v13);
  if (v12)
  {
    int64_t v3 = v13;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v3 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      break;
    }
    if (v3 >= v8) {
      goto LABEL_23;
    }
    unint64_t v12 = *(void *)(v4 + 8 * v3);
    ++v13;
    if (v12) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_24D1C59A8(uint64_t a1)
{
  uint64_t v2 = sub_24D218AC0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  int64_t v8 = (char *)&v25 - v7;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A610);
  MEMORY[0x270FA5388](v9 - 8);
  int64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24D1DA260(&qword_26985BD88, MEMORY[0x263F07490]);
  uint64_t result = sub_24D219290();
  int64_t v13 = 0;
  uint64_t v31 = a1;
  uint64_t v32 = result;
  uint64_t v16 = *(void *)(a1 + 64);
  uint64_t v15 = a1 + 64;
  uint64_t v14 = v16;
  uint64_t v17 = 1 << *(unsigned char *)(v15 - 32);
  uint64_t v18 = -1;
  if (v17 < 64) {
    uint64_t v18 = ~(-1 << v17);
  }
  unint64_t v19 = v18 & v14;
  uint64_t v26 = v15;
  int64_t v27 = (unint64_t)(v17 + 63) >> 6;
  uint64_t v29 = v3 + 16;
  int64_t v30 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56);
  uint64_t v28 = v3 + 48;
  if ((v18 & v14) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v20 = __clz(__rbit64(v19));
  v19 &= v19 - 1;
  for (unint64_t i = v20 | (v13 << 6); ; unint64_t i = __clz(__rbit64(v23)) + (v13 << 6))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v11, *(void *)(v31 + 48) + *(void *)(v3 + 72) * i, v2);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v3 + 56))(v11, 0, 1, v2);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v11, 1, v2) == 1) {
      goto LABEL_25;
    }
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v6, v11, v2);
    sub_24D1D1900((uint64_t)v8, v6);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v8, v2);
    if (v19) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v22 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v22 >= v27) {
      goto LABEL_24;
    }
    unint64_t v23 = *(void *)(v26 + 8 * v22);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v22 + 1;
      if (v22 + 1 >= v27) {
        goto LABEL_24;
      }
      unint64_t v23 = *(void *)(v26 + 8 * v13);
      if (!v23)
      {
        int64_t v13 = v22 + 2;
        if (v22 + 2 >= v27) {
          goto LABEL_24;
        }
        unint64_t v23 = *(void *)(v26 + 8 * v13);
        if (!v23)
        {
          int64_t v13 = v22 + 3;
          if (v22 + 3 >= v27) {
            goto LABEL_24;
          }
          unint64_t v23 = *(void *)(v26 + 8 * v13);
          if (!v23) {
            break;
          }
        }
      }
    }
LABEL_20:
    unint64_t v19 = (v23 - 1) & v23;
  }
  int64_t v24 = v22 + 4;
  if (v24 >= v27)
  {
LABEL_24:
    (*v30)(v11, 1, 1, v2);
LABEL_25:
    swift_release();
    return v32;
  }
  unint64_t v23 = *(void *)(v26 + 8 * v24);
  if (v23)
  {
    int64_t v13 = v24;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v13 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v13 >= v27) {
      goto LABEL_24;
    }
    unint64_t v23 = *(void *)(v26 + 8 * v13);
    ++v24;
    if (v23) {
      goto LABEL_20;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_24D1C5D58(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result;
  int64_t v3 = 0;
  uint64_t v15 = a2;
  uint64_t v4 = result + 64;
  uint64_t v5 = 1 << *(unsigned char *)(result + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(result + 64);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  while (1)
  {
    if (v7)
    {
      unint64_t v9 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v10 = v9 | (v3 << 6);
      goto LABEL_5;
    }
    int64_t v11 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v11 >= v8) {
      goto LABEL_23;
    }
    unint64_t v12 = *(void *)(v4 + 8 * v11);
    ++v3;
    if (!v12)
    {
      int64_t v3 = v11 + 1;
      if (v11 + 1 >= v8) {
        goto LABEL_23;
      }
      unint64_t v12 = *(void *)(v4 + 8 * v3);
      if (!v12)
      {
        int64_t v3 = v11 + 2;
        if (v11 + 2 >= v8) {
          goto LABEL_23;
        }
        unint64_t v12 = *(void *)(v4 + 8 * v3);
        if (!v12)
        {
          int64_t v3 = v11 + 3;
          if (v11 + 3 >= v8) {
            goto LABEL_23;
          }
          unint64_t v12 = *(void *)(v4 + 8 * v3);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v7 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v3 << 6);
LABEL_5:
    uint64_t result = sub_24D1D1804(&v14, *(void *)(*(void *)(v2 + 48) + 8 * v10));
  }
  int64_t v13 = v11 + 4;
  if (v13 >= v8)
  {
LABEL_23:
    swift_release();
    return v15;
  }
  unint64_t v12 = *(void *)(v4 + 8 * v13);
  if (v12)
  {
    int64_t v3 = v13;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v3 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      break;
    }
    if (v3 >= v8) {
      goto LABEL_23;
    }
    unint64_t v12 = *(void *)(v4 + 8 * v3);
    ++v13;
    if (v12) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_24D1C5EB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24D218AC0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  int64_t v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  unint64_t v10 = (char *)&v27 - v9;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A610);
  uint64_t result = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v15 = 0;
  uint64_t v33 = a1;
  uint64_t v34 = a2;
  uint64_t v18 = *(void *)(a1 + 64);
  uint64_t v17 = a1 + 64;
  uint64_t v16 = v18;
  uint64_t v19 = 1 << *(unsigned char *)(v17 - 32);
  uint64_t v20 = -1;
  if (v19 < 64) {
    uint64_t v20 = ~(-1 << v19);
  }
  unint64_t v21 = v20 & v16;
  uint64_t v28 = v17;
  int64_t v29 = (unint64_t)(v19 + 63) >> 6;
  uint64_t v31 = v5 + 16;
  uint64_t v32 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56);
  uint64_t v30 = v5 + 48;
  if ((v20 & v16) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v22 = __clz(__rbit64(v21));
  v21 &= v21 - 1;
  for (unint64_t i = v22 | (v15 << 6); ; unint64_t i = __clz(__rbit64(v25)) + (v15 << 6))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v5 + 16))(v14, *(void *)(v33 + 48) + *(void *)(v5 + 72) * i, v4);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(v14, 0, 1, v4);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v14, 1, v4) == 1) {
      goto LABEL_25;
    }
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v8, v14, v4);
    sub_24D1D1900((uint64_t)v10, v8);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v10, v4);
    if (v21) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v24 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v24 >= v29) {
      goto LABEL_24;
    }
    unint64_t v25 = *(void *)(v28 + 8 * v24);
    ++v15;
    if (!v25)
    {
      int64_t v15 = v24 + 1;
      if (v24 + 1 >= v29) {
        goto LABEL_24;
      }
      unint64_t v25 = *(void *)(v28 + 8 * v15);
      if (!v25)
      {
        int64_t v15 = v24 + 2;
        if (v24 + 2 >= v29) {
          goto LABEL_24;
        }
        unint64_t v25 = *(void *)(v28 + 8 * v15);
        if (!v25)
        {
          int64_t v15 = v24 + 3;
          if (v24 + 3 >= v29) {
            goto LABEL_24;
          }
          unint64_t v25 = *(void *)(v28 + 8 * v15);
          if (!v25) {
            break;
          }
        }
      }
    }
LABEL_20:
    unint64_t v21 = (v25 - 1) & v25;
  }
  int64_t v26 = v24 + 4;
  if (v26 >= v29)
  {
LABEL_24:
    (*v32)(v14, 1, 1, v4);
LABEL_25:
    swift_release();
    return v34;
  }
  unint64_t v25 = *(void *)(v28 + 8 * v26);
  if (v25)
  {
    int64_t v15 = v26;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v15 = v26 + 1;
    if (__OFADD__(v26, 1)) {
      break;
    }
    if (v15 >= v29) {
      goto LABEL_24;
    }
    unint64_t v25 = *(void *)(v28 + 8 * v15);
    ++v26;
    if (v25) {
      goto LABEL_20;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t EnergySite.EnergyUsage.init(imports:exports:start:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>)
{
  uint64_t v8 = sub_24D218AC0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a1, v8);
  uint64_t v12 = MEMORY[0x263F8EE78];
  unint64_t v13 = sub_24D1D62D4(MEMORY[0x263F8EE78], (uint64_t (*)(uint64_t))sub_24D1DCDE0);
  unint64_t v14 = sub_24D1D62D4(v12, (uint64_t (*)(uint64_t))sub_24D1DCDE0);
  EnergySite.EnergyUsage.init(startTime:imports:exports:importsByPricingPeriod:exportsByPricingPeriod:subintervalCount:isValid:)((uint64_t)v11, v13, v14, 1, 1, a2, a3, a4);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(a1, v8);
}

uint64_t EnergySite.EnergyUsage.init(imports:exports:start:importsByPricingPeriod:exportsByPricingPeriod:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>, double a5@<D0>, double a6@<D1>)
{
  uint64_t v12 = sub_24D218AC0();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  int64_t v15 = (char *)&v17 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, a1, v12);
  EnergySite.EnergyUsage.init(startTime:imports:exports:importsByPricingPeriod:exportsByPricingPeriod:subintervalCount:isValid:)((uint64_t)v15, a2, a3, 1, 1, a4, a5, a6);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v13 + 8))(a1, v12);
}

uint64_t EnergySite.EnergyUsage.description.getter()
{
  return 0;
}

uint64_t _s9EnergyKit0A4SiteC0A5UsageV9startTime10Foundation4DateVvg_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_24D218AC0();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t EnergySite.EnergyUsage.init(energyUsage:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A610);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_24D218AC0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v31 - v12;
  if (!*(void *)(a1 + 16) || (unint64_t v14 = sub_24D1D12EC(0x7472617473, 0xE500000000000000), (v15 & 1) == 0))
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
    goto LABEL_17;
  }
  sub_24D1D6414(*(void *)(a1 + 56) + 32 * v14, (uint64_t)&v31);
  int v16 = swift_dynamicCast();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v6, v16 ^ 1u, 1, v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
LABEL_17:
    swift_bridgeObjectRelease();
    sub_24D1D9A80((uint64_t)v6, &qword_26B18A610);
    sub_24D1D63C0();
    swift_allocError();
    *int64_t v26 = 4;
    return swift_willThrow();
  }
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v13, v6, v7);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
  if (!*(void *)(a1 + 16))
  {
    double v18 = 0.0;
LABEL_19:
    double v21 = 0.0;
LABEL_20:
    unint64_t v25 = sub_24D1D62D4(MEMORY[0x263F8EE78], (uint64_t (*)(uint64_t))sub_24D1D12B0);
    goto LABEL_21;
  }
  unint64_t v17 = sub_24D1D12EC(0x7374726F706D69, 0xE700000000000000);
  double v18 = 0.0;
  if (v19)
  {
    sub_24D1D6414(*(void *)(a1 + 56) + 32 * v17, (uint64_t)&v31);
    if (swift_dynamicCast()) {
      double v18 = v33;
    }
  }
  if (!*(void *)(a1 + 16)) {
    goto LABEL_19;
  }
  unint64_t v20 = sub_24D1D12EC(0x7374726F707865, 0xE700000000000000);
  double v21 = 0.0;
  if (v22)
  {
    sub_24D1D6414(*(void *)(a1 + 56) + 32 * v20, (uint64_t)&v31);
    if (swift_dynamicCast()) {
      double v21 = v33;
    }
  }
  if (!*(void *)(a1 + 16)) {
    goto LABEL_20;
  }
  unint64_t v23 = sub_24D1D12EC(0xD000000000000016, 0x800000024D21B910);
  if ((v24 & 1) == 0) {
    goto LABEL_20;
  }
  sub_24D1D6414(*(void *)(a1 + 56) + 32 * v23, (uint64_t)&v31);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985BBA0);
  if (!swift_dynamicCast()) {
    goto LABEL_20;
  }
  unint64_t v25 = *(void *)&v33;
LABEL_21:
  if (*(void *)(a1 + 16) && (unint64_t v28 = sub_24D1D12EC(0xD000000000000016, 0x800000024D21B930), (v29 & 1) != 0))
  {
    sub_24D1D6414(*(void *)(a1 + 56) + 32 * v28, (uint64_t)&v31);
  }
  else
  {
    long long v31 = 0u;
    long long v32 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v32 + 1))
  {
    sub_24D1D9A80((uint64_t)&v31, &qword_26B18A5D8);
    goto LABEL_29;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985BBA0);
  if (!swift_dynamicCast())
  {
LABEL_29:
    unint64_t v30 = sub_24D1D62D4(MEMORY[0x263F8EE78], (uint64_t (*)(uint64_t))sub_24D1D12B0);
    goto LABEL_30;
  }
  unint64_t v30 = *(void *)&v33;
LABEL_30:
  EnergySite.EnergyUsage.init(startTime:imports:exports:importsByPricingPeriod:exportsByPricingPeriod:subintervalCount:isValid:)((uint64_t)v11, v25, v30, 1, 1, a2, v18, v21);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v13, v7);
}

uint64_t EnergySite.HistoricalEnergyUsage.init(interval:start:usages:)@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unsigned char *a4@<X8>)
{
  char v7 = *a1;
  uint64_t v8 = (int *)type metadata accessor for EnergySite.HistoricalEnergyUsage(0);
  uint64_t v9 = &a4[v8[7]];
  *(void *)uint64_t v9 = 0;
  v9[8] = 1;
  uint64_t v10 = &a4[v8[8]];
  *(void *)uint64_t v10 = 0;
  v10[8] = 1;
  *a4 = v7;
  uint64_t v11 = &a4[v8[5]];
  uint64_t v12 = sub_24D218AC0();
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 32))(v11, a2, v12);
  *(void *)&a4[v8[6]] = a3;
  unint64_t v14 = &a4[v8[9]];
  *(void *)unint64_t v14 = 0;
  v14[8] = 0;
  char v15 = &a4[v8[10]];
  *(void *)char v15 = 0;
  v15[8] = 0;
  return result;
}

unsigned __int8 EnergySite.HistoricalEnergyUsage.init(response:)@<W0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v5 = type metadata accessor for EnergySite.EnergyUsage(0);
  uint64_t v62 = *(void *)(v5 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  uint64_t v8 = (char *)&v57 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v57 - v9;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A610);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v57 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_24D218AC0();
  uint64_t v66 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  int v16 = (char *)&v57 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for EnergySite.HistoricalEnergyUsage(0);
  double v18 = &a2[*(int *)(v17 + 28)];
  *(void *)double v18 = 0;
  v18[8] = 1;
  char v19 = &a2[*(int *)(v17 + 32)];
  *(void *)char v19 = 0;
  v19[8] = 1;
  if (!*(void *)(a1 + 16)
    || (unint64_t v20 = (int *)v17, v21 = sub_24D1D12EC(0x6C61767265746E69, 0xE800000000000000), (v22 & 1) == 0)
    || (sub_24D1D6414(*(void *)(a1 + 56) + 32 * v21, (uint64_t)&v64), (swift_dynamicCast() & 1) == 0))
  {
    swift_bridgeObjectRelease();
LABEL_14:
    sub_24D1D63C0();
    swift_allocError();
    *unint64_t v36 = 4;
    return swift_willThrow();
  }
  unsigned __int8 result = EnergySite.EnergyUsageTimeInterval.init(rawValue:)(v63).value;
  if (v64 == 5)
  {
    __break(1u);
    return result;
  }
  *a2 = v64;
  if (!*(void *)(a1 + 16) || (unint64_t v24 = sub_24D1D12EC(0x7472617473, 0xE500000000000000), (v25 & 1) == 0))
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v66 + 56))(v13, 1, 1, v14);
    goto LABEL_16;
  }
  unint64_t v61 = v16;
  sub_24D1D6414(*(void *)(a1 + 56) + 32 * v24, (uint64_t)&v64);
  int v26 = swift_dynamicCast();
  uint64_t v27 = v66;
  (*(void (**)(char *, void, uint64_t, uint64_t))(v66 + 56))(v13, v26 ^ 1u, 1, v14);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v13, 1, v14) == 1)
  {
LABEL_16:
    swift_bridgeObjectRelease();
    sub_24D1D9A80((uint64_t)v13, &qword_26B18A610);
    goto LABEL_14;
  }
  uint64_t v28 = v66;
  (*(void (**)(char *, char *, uint64_t))(v66 + 32))(v61, v13, v14);
  char v29 = *(void (**)(void))(v28 + 16);
  unint64_t v58 = &a2[v20[5]];
  v29();
  uint64_t countAndFlagsBits = *(void *)(a1 + 16);
  uint64_t v31 = v28;
  if (!countAndFlagsBits)
  {
LABEL_18:
    char v35 = 1;
    goto LABEL_19;
  }
  unint64_t v32 = sub_24D1D12EC(0xD000000000000016, 0x800000024D21B950);
  if ((v33 & 1) == 0)
  {
    uint64_t countAndFlagsBits = 0;
    goto LABEL_18;
  }
  sub_24D1D6414(*(void *)(a1 + 56) + 32 * v32, (uint64_t)&v64);
  int v34 = swift_dynamicCast();
  uint64_t countAndFlagsBits = v63._countAndFlagsBits;
  if (!v34) {
    uint64_t countAndFlagsBits = 0;
  }
  char v35 = v34 ^ 1;
LABEL_19:
  unint64_t v37 = (unint64_t)v61;
  uint64_t v38 = &a2[v20[9]];
  *(void *)uint64_t v38 = countAndFlagsBits;
  v38[8] = v35;
  uint64_t v39 = *(void *)(a1 + 16);
  if (!v39)
  {
LABEL_25:
    char v43 = 1;
    goto LABEL_26;
  }
  unint64_t v40 = sub_24D1D12EC(0xD000000000000016, 0x800000024D21B970);
  if ((v41 & 1) == 0)
  {
    uint64_t v39 = 0;
    goto LABEL_25;
  }
  sub_24D1D6414(*(void *)(a1 + 56) + 32 * v40, (uint64_t)&v64);
  int v42 = swift_dynamicCast();
  uint64_t v39 = v63._countAndFlagsBits;
  if (!v42) {
    uint64_t v39 = 0;
  }
  char v43 = v42 ^ 1;
LABEL_26:
  char v44 = &a2[v20[10]];
  *(void *)char v44 = v39;
  v44[8] = v43;
  if (*(void *)(a1 + 16) && (unint64_t v45 = sub_24D1D12EC(0x736567617375, 0xE600000000000000), (v46 & 1) != 0))
  {
    sub_24D1D6414(*(void *)(a1 + 56) + 32 * v45, (uint64_t)&v64);
  }
  else
  {
    long long v64 = 0u;
    long long v65 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v65 + 1))
  {
    sub_24D1D9A80((uint64_t)&v64, &qword_26B18A5D8);
    goto LABEL_42;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985BBA8);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_42:
    sub_24D1D63C0();
    swift_allocError();
    *unint64_t v55 = 4;
    swift_willThrow();
    uint64_t v56 = *(void (**)(unint64_t, uint64_t))(v31 + 8);
    v56(v37, v14);
    return ((uint64_t (*)(unsigned char *, uint64_t))v56)(v58, v14);
  }
  uint64_t v60 = v63._countAndFlagsBits;
  uint64_t v59 = *(void *)(v63._countAndFlagsBits + 16);
  if (v59)
  {
    uint64_t v47 = 0;
    unint64_t v61 = (char *)MEMORY[0x263F8EE78];
    while (1)
    {
      uint64_t v48 = swift_bridgeObjectRetain();
      EnergySite.EnergyUsage.init(energyUsage:)(v48, (uint64_t)v10);
      if (v2) {
        break;
      }
      sub_24D1D64C8((uint64_t)v10, (uint64_t)v8);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v61 = (char *)sub_24D1D0758(0, *((void *)v61 + 2) + 1, 1, (unint64_t)v61, &qword_26985BE28, type metadata accessor for EnergySite.EnergyUsage, type metadata accessor for EnergySite.EnergyUsage);
      }
      unint64_t v50 = *((void *)v61 + 2);
      unint64_t v49 = *((void *)v61 + 3);
      unint64_t v51 = v50 + 1;
      if (v50 >= v49 >> 1)
      {
        unint64_t v57 = v50 + 1;
        uint64_t v54 = sub_24D1D0758(v49 > 1, v50 + 1, 1, (unint64_t)v61, &qword_26985BE28, type metadata accessor for EnergySite.EnergyUsage, type metadata accessor for EnergySite.EnergyUsage);
        unint64_t v51 = v57;
        unint64_t v61 = (char *)v54;
      }
      ++v47;
      unint64_t v53 = (unint64_t)v61;
      uint64_t v52 = v62;
      *((void *)v61 + 2) = v51;
      sub_24D1D6588((uint64_t)v8, v53+ ((*(unsigned __int8 *)(v52 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v52 + 80))+ *(void *)(v52 + 72) * v50, type metadata accessor for EnergySite.EnergyUsage);
      sub_24D1D652C((uint64_t)v10);
      if (v59 == v47) {
        goto LABEL_45;
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v56 = *(void (**)(unint64_t, uint64_t))(v66 + 8);
    v56(v37, v14);
    return ((uint64_t (*)(unsigned char *, uint64_t))v56)(v58, v14);
  }
  unint64_t v61 = (char *)MEMORY[0x263F8EE78];
LABEL_45:
  swift_bridgeObjectRelease();
  unsigned __int8 result = (*(unint64_t (**)(unint64_t, uint64_t))(v66 + 8))(v37, v14);
  *(void *)&a2[v20[6]] = v61;
  return result;
}

void EnergySite.HistoricalEnergyUsage.interval.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t EnergySite.HistoricalEnergyUsage.start.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for EnergySite.HistoricalEnergyUsage(0) + 20);
  uint64_t v4 = sub_24D218AC0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t EnergySite.HistoricalEnergyUsage.usages.getter()
{
  type metadata accessor for EnergySite.HistoricalEnergyUsage(0);

  return swift_bridgeObjectRetain();
}

uint64_t EnergySite.HistoricalEnergyUsage.totalImports.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for EnergySite.HistoricalEnergyUsage(0) + 28));
}

uint64_t EnergySite.HistoricalEnergyUsage.totalImports.setter(uint64_t a1, char a2)
{
  uint64_t result = type metadata accessor for EnergySite.HistoricalEnergyUsage(0);
  uint64_t v6 = v2 + *(int *)(result + 28);
  *(void *)uint64_t v6 = a1;
  *(unsigned char *)(v6 + 8) = a2 & 1;
  return result;
}

uint64_t (*EnergySite.HistoricalEnergyUsage.totalImports.modify())()
{
  return nullsub_1;
}

uint64_t EnergySite.HistoricalEnergyUsage.totalExports.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for EnergySite.HistoricalEnergyUsage(0) + 32));
}

uint64_t EnergySite.HistoricalEnergyUsage.totalExports.setter(uint64_t a1, char a2)
{
  uint64_t result = type metadata accessor for EnergySite.HistoricalEnergyUsage(0);
  uint64_t v6 = v2 + *(int *)(result + 32);
  *(void *)uint64_t v6 = a1;
  *(unsigned char *)(v6 + 8) = a2 & 1;
  return result;
}

uint64_t (*EnergySite.HistoricalEnergyUsage.totalExports.modify())()
{
  return nullsub_1;
}

uint64_t EnergySite.HistoricalEnergyUsage.validationTotalImports.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for EnergySite.HistoricalEnergyUsage(0) + 36));
}

uint64_t EnergySite.HistoricalEnergyUsage.validationTotalExports.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for EnergySite.HistoricalEnergyUsage(0) + 40));
}

uint64_t static EnergySite.HistoricalEnergyUsage.subintervalFor(_:)@<X0>(unsigned char *a1@<X0>, uint64_t a2@<X8>)
{
  switch(*a1)
  {
    case 1:
    case 2:
      uint64_t v3 = (unsigned int *)MEMORY[0x263F07870];
      break;
    case 3:
      uint64_t v3 = (unsigned int *)MEMORY[0x263F07830];
      break;
    case 4:
      uint64_t v3 = (unsigned int *)MEMORY[0x263F078A8];
      break;
    default:
      uint64_t v3 = (unsigned int *)MEMORY[0x263F07890];
      break;
  }
  uint64_t v4 = *v3;
  uint64_t v5 = sub_24D218B70();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 104);

  return v6(a2, v4, v5);
}

uint64_t sub_24D1C7768(uint64_t a1, unsigned char *a2, uint64_t a3, char a4)
{
  *(void *)(v5 + 24) = a3;
  *(void *)(v5 + 32) = v4;
  *(unsigned char *)(v5 + 113) = a4;
  *(void *)(v5 + 16) = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985BBB8);
  *(void *)(v5 + 40) = swift_task_alloc();
  *(void *)(v5 + 48) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(qword_26985BBC0);
  *(void *)(v5 + 56) = swift_task_alloc();
  uint64_t v7 = sub_24D218BB0();
  *(void *)(v5 + 64) = v7;
  *(void *)(v5 + 72) = *(void *)(v7 - 8);
  *(void *)(v5 + 80) = swift_task_alloc();
  *(unsigned char *)(v5 + 114) = *a2;
  return MEMORY[0x270FA2498](sub_24D1C78AC, 0, 0);
}

uint64_t sub_24D1C78AC()
{
  uint64_t v1 = *(void *)(v0 + 32);
  id v2 = *(id *)(v1 + 16);
  sub_24D218EB0();
  uint64_t v4 = v3;

  if (!v4) {
    goto LABEL_8;
  }
  id v5 = *(id *)(v1 + 16);
  uint64_t v6 = sub_24D218EC0();
  uint64_t v8 = v7;

  *(void *)(v0 + 88) = v8;
  if (!v8)
  {
LABEL_7:
    swift_bridgeObjectRelease();
LABEL_8:
    sub_24D1D63C0();
    swift_allocError();
    *double v18 = 0;
    goto LABEL_9;
  }
  id v9 = *(id *)(v1 + 16);
  uint64_t v10 = sub_24D218D80();
  uint64_t v12 = v11;

  *(void *)(v0 + 96) = v12;
  if (!v12)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  uint64_t v14 = *(void *)(v0 + 64);
  uint64_t v13 = *(void *)(v0 + 72);
  uint64_t v15 = *(void *)(v0 + 56);
  sub_24D218B90();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v15, 1, v14) == 1)
  {
    uint64_t v16 = *(void *)(v0 + 56);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_24D1D9A80(v16, qword_26985BBC0);
    sub_24D1D63C0();
    swift_allocError();
    *uint64_t v17 = 1;
LABEL_9:
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    char v19 = *(uint64_t (**)(void))(v0 + 8);
    return v19();
  }
  char v21 = *(unsigned char *)(v0 + 114);
  (*(void (**)(void, void, void))(*(void *)(v0 + 72) + 32))(*(void *)(v0 + 80), *(void *)(v0 + 56), *(void *)(v0 + 64));
  *(unsigned char *)(v0 + 112) = v21;
  char v22 = (void *)swift_task_alloc();
  *(void *)(v0 + 104) = v22;
  *char v22 = v0;
  v22[1] = sub_24D1C7B58;
  uint64_t v23 = *(void *)(v0 + 80);
  uint64_t v24 = *(void *)(v0 + 48);
  uint64_t v25 = *(void *)(v0 + 24);
  return EnergySite.historicalEnergyUsage(interval:start:timezone:utilityID:subscriptionID:bulk:)(v24, (unsigned char *)(v0 + 112), v25, v23, v6, v8, v10, v12);
}

uint64_t sub_24D1C7B58()
{
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_24D1C7C8C, 0, 0);
}

uint64_t sub_24D1C7C8C()
{
  uint64_t v1 = v0[5];
  sub_24D1D9D68(v0[6], v1, &qword_26985BBB8);
  uint64_t v2 = type metadata accessor for EnergySite.HistoricalEnergyUsage(0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(v1, 1, v2) == 1)
  {
    uint64_t v4 = v0[9];
    uint64_t v3 = v0[10];
    uint64_t v5 = v0[8];
    uint64_t v6 = v0[6];
    sub_24D1D9A80(v0[5], &qword_26985BBB8);
    sub_24D1D63C0();
    swift_allocError();
    *uint64_t v7 = 4;
    swift_willThrow();
    sub_24D1D9A80(v6, &qword_26985BBB8);
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  }
  else
  {
    uint64_t v10 = v0[9];
    uint64_t v9 = v0[10];
    uint64_t v11 = v0[8];
    uint64_t v12 = v0[5];
    uint64_t v13 = v0[2];
    sub_24D1D9A80(v0[6], &qword_26985BBB8);
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
    sub_24D1D6588(v12, v13, type metadata accessor for EnergySite.HistoricalEnergyUsage);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_24D1C7E78(uint64_t a1, unsigned char *a2, uint64_t a3)
{
  *(unsigned char *)(v3 + 32) = *a2;
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *uint64_t v6 = v3;
  v6[1] = sub_24D1C7F34;
  return sub_24D1C7768(a1, (unsigned char *)(v3 + 32), a3, 0);
}

uint64_t sub_24D1C7F34()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 24) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_24D1C8068, 0, 0);
  }
  else
  {
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_24D1C8068()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24D1C8080(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v9[10] = a8;
  v9[11] = v8;
  v9[8] = a6;
  v9[9] = a7;
  v9[6] = a4;
  v9[7] = a5;
  v9[4] = a2;
  void v9[5] = a3;
  v9[3] = a1;
  __swift_instantiateConcreteTypeFromMangledName(qword_26985BBC0);
  v9[12] = swift_task_alloc();
  uint64_t v10 = sub_24D218BB0();
  v9[13] = v10;
  v9[14] = *(void *)(v10 - 8);
  v9[15] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D1C8180, 0, 0);
}

uint64_t sub_24D1C8180()
{
  uint64_t v1 = *(void *)(v0 + 104);
  uint64_t v2 = *(void *)(v0 + 112);
  uint64_t v4 = *(void *)(v0 + 88);
  uint64_t v3 = *(void *)(v0 + 96);
  id v5 = *(id *)(v4 + 16);
  uint64_t v6 = sub_24D218D10();
  uint64_t v8 = v7;

  *(void *)(v0 + 128) = v8;
  sub_24D218B90();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    uint64_t v9 = *(void *)(v0 + 96);
    swift_bridgeObjectRelease();
    sub_24D1D9A80(v9, qword_26985BBC0);
LABEL_10:
    sub_24D1D63C0();
    swift_allocError();
    unsigned char *v30 = 4;
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v31 = *(uint64_t (**)(void))(v0 + 8);
    return v31();
  }
  (*(void (**)(void, void, void))(*(void *)(v0 + 112) + 32))(*(void *)(v0 + 120), *(void *)(v0 + 96), *(void *)(v0 + 104));
  id v10 = *(id *)(v4 + 16);
  uint64_t v11 = sub_24D218EC0();
  uint64_t v13 = v12;

  *(void *)(v0 + 136) = v13;
  if (!v13)
  {
    uint64_t v25 = *(void *)(v0 + 112);
    uint64_t v24 = *(void *)(v0 + 120);
    uint64_t v26 = *(void *)(v0 + 104);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v24, v26);
    goto LABEL_10;
  }
  id v14 = *(id *)(v4 + 16);
  uint64_t v15 = sub_24D218D80();
  uint64_t v17 = v16;

  *(void *)(v0 + 144) = v17;
  if (!v17)
  {
    uint64_t v28 = *(void *)(v0 + 112);
    uint64_t v27 = *(void *)(v0 + 120);
    uint64_t v29 = *(void *)(v0 + 104);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v27, v29);
    goto LABEL_10;
  }
  uint64_t v35 = *(void *)(v0 + 80);
  uint64_t v33 = *(void *)(v0 + 72);
  uint64_t v34 = *(void *)(v0 + 120);
  uint64_t v18 = *(void *)(v0 + 48);
  uint64_t v19 = *(void *)(v0 + 24);
  uint64_t v20 = swift_task_alloc();
  *(void *)(v0 + 152) = v20;
  long long v21 = *(_OWORD *)(v0 + 32);
  *(void *)(v20 + 16) = v6;
  *(void *)(v20 + 24) = v8;
  *(void *)(v20 + 32) = v15;
  *(void *)(v20 + 40) = v17;
  *(void *)(v20 + 48) = v11;
  *(void *)(v20 + 56) = v13;
  *(void *)(v20 + 64) = v19;
  *(_OWORD *)(v20 + 72) = v21;
  *(void *)(v20 + 88) = v18;
  *(void *)(v20 + 96) = v34;
  *(void *)(v20 + 104) = v33;
  *(void *)(v20 + 112) = v35;
  char v22 = (void *)swift_task_alloc();
  *(void *)(v0 + 160) = v22;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(qword_26985BBD8);
  *char v22 = v0;
  v22[1] = sub_24D1C849C;
  return MEMORY[0x270FA2360](v0 + 16, 0, 0, 0xD000000000000045, 0x800000024D21B990, sub_24D1D65F0, v20, v23);
}

uint64_t sub_24D1C849C()
{
  *(void *)(*(void *)v1 + 168) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24D1C86C4;
  }
  else {
    uint64_t v2 = sub_24D1C862C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D1C862C()
{
  (*(void (**)(void, void))(v0[14] + 8))(v0[15], v0[13]);
  uint64_t v1 = v0[2];
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = (uint64_t (*)(uint64_t))v0[1];
  return v2(v1);
}

uint64_t sub_24D1C86C4()
{
  (*(void (**)(void, void))(v0[14] + 8))(v0[15], v0[13]);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_24D1C874C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  uint64_t v74 = a7;
  uint64_t v75 = a8;
  uint64_t v72 = a5;
  uint64_t v73 = a6;
  uint64_t v68 = a2;
  uint64_t v69 = a3;
  uint64_t v76 = a13;
  uint64_t v77 = a14;
  uint64_t v64 = a11;
  uint64_t v65 = a12;
  uint64_t v70 = a9;
  uint64_t v71 = a4;
  uint64_t v62 = a1;
  uint64_t v63 = a10;
  uint64_t v14 = sub_24D218BB0();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v79 = v14;
  uint64_t v80 = v15;
  unint64_t v67 = *(void *)(v15 + 64);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v56 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v61 = v17;
  uint64_t v78 = sub_24D218AC0();
  uint64_t v18 = *(void *)(v78 - 8);
  uint64_t v19 = *(void *)(v18 + 64);
  uint64_t v20 = MEMORY[0x270FA5388](v78);
  uint64_t v60 = (char *)&v56 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  char v22 = (char *)&v56 - v21;
  uint64_t v59 = (char *)&v56 - v21;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BE10);
  uint64_t v57 = v23;
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v25 = *(void *)(v24 + 64);
  MEMORY[0x270FA5388](v23);
  unint64_t v58 = (char *)&v56 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5B0);
  MEMORY[0x270FA5388](v26 - 8);
  uint64_t v28 = (char *)&v56 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = v28;
  uint64_t v29 = sub_24D219240();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v28, 1, 1, v29);
  (*(void (**)(char *, uint64_t, uint64_t))(v24 + 16))((char *)&v56 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0), v62, v23);
  uint64_t v56 = v18;
  unint64_t v30 = *(void (**)(char *, uint64_t, uint64_t))(v18 + 16);
  uint64_t v31 = v22;
  uint64_t v32 = v78;
  v30(v31, v63, v78);
  v30((char *)&v56 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0), v64, v32);
  uint64_t v33 = v80;
  (*(void (**)(char *, uint64_t, uint64_t))(v80 + 16))(v17, v65, v79);
  unint64_t v34 = (*(unsigned __int8 *)(v24 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
  unint64_t v35 = (v25 + v34 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v36 = (v35 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v37 = (v36 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v38 = *(unsigned __int8 *)(v18 + 80);
  uint64_t v39 = (v38 + v37 + 16) & ~v38;
  uint64_t v40 = (v19 + v38 + v39) & ~v38;
  unint64_t v41 = (v19 + *(unsigned __int8 *)(v33 + 80) + v40) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80);
  unint64_t v67 = (v67 + v41 + 7) & 0xFFFFFFFFFFFFFFF8;
  int v42 = (char *)swift_allocObject();
  *((void *)v42 + 2) = 0;
  *((void *)v42 + 3) = 0;
  uint64_t v43 = v69;
  *((void *)v42 + 4) = v68;
  *((void *)v42 + 5) = v43;
  (*(void (**)(char *, char *, uint64_t))(v24 + 32))(&v42[v34], v58, v57);
  char v44 = &v42[v35];
  uint64_t v45 = v72;
  *(void *)char v44 = v71;
  *((void *)v44 + 1) = v45;
  char v46 = &v42[v36];
  uint64_t v47 = v74;
  *(void *)char v46 = v73;
  *((void *)v46 + 1) = v47;
  uint64_t v48 = &v42[v37];
  uint64_t v49 = v70;
  *(void *)uint64_t v48 = v75;
  *((void *)v48 + 1) = v49;
  unint64_t v50 = &v42[v39];
  unint64_t v51 = *(void (**)(char *, char *, uint64_t))(v56 + 32);
  uint64_t v52 = v78;
  v51(v50, v59, v78);
  v51(&v42[v40], v60, v52);
  (*(void (**)(char *, char *, uint64_t))(v80 + 32))(&v42[v41], v61, v79);
  unint64_t v53 = &v42[v67];
  uint64_t v54 = v77;
  *(void *)unint64_t v53 = v76;
  *((void *)v53 + 1) = v54;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_24D1BA610((uint64_t)v66, (uint64_t)&unk_26985BE20, (uint64_t)v42);
  return swift_release();
}

uint64_t sub_24D1C8C1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 248) = v17;
  *(_OWORD *)(v8 + 232) = v16;
  *(_OWORD *)(v8 + 216) = v15;
  *(_OWORD *)(v8 + 200) = v14;
  *(_OWORD *)(v8 + 184) = v13;
  *(void *)(v8 + 168) = a7;
  *(void *)(v8 + 176) = a8;
  *(void *)(v8 + 152) = a5;
  *(void *)(v8 + 160) = a6;
  *(void *)(v8 + 144) = a4;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BE10);
  *(void *)(v8 + 256) = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  *(void *)(v8 + 264) = v10;
  *(void *)(v8 + 272) = *(void *)(v10 + 64);
  *(void *)(v8 + 280) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D1C8D14, 0, 0);
}

uint64_t sub_24D1C8D14()
{
  uint64_t v1 = v0[35];
  uint64_t v3 = v0[32];
  uint64_t v2 = v0[33];
  uint64_t v4 = v0[20];
  uint64_t v5 = v0[18];
  uint64_t v6 = v0[19];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[36] = sub_24D217288();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  unint64_t v7 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v5;
  *(void *)(v8 + 24) = v6;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v2 + 32))(v8 + v7, v1, v3);
  swift_bridgeObjectRetain();
  uint64_t v9 = (void *)sub_24D217944((uint64_t)sub_24D1DAC3C, v8);
  v0[37] = v9;
  swift_release();
  uint64_t v10 = sub_24D2190E0();
  v0[38] = v10;
  uint64_t v11 = sub_24D2190E0();
  v0[39] = v11;
  uint64_t v12 = sub_24D2190E0();
  v0[40] = v12;
  uint64_t v13 = sub_24D218A40();
  v0[41] = v13;
  uint64_t v14 = sub_24D218A40();
  v0[42] = v14;
  uint64_t v15 = sub_24D218BA0();
  v0[43] = v15;
  uint64_t v16 = sub_24D2190E0();
  v0[44] = v16;
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_24D1C8FCC;
  uint64_t v17 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_24D1C9600;
  v0[13] = &block_descriptor_152;
  v0[14] = v17;
  objc_msgSend(v9, sel_intervalReadingWithSubscriptionID_utilityID_interval_start_end_timeZone_flowDirection_completionHandler_, v10, v11, v12, v13, v14, v15, v16, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_24D1C8FCC()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 360) = v1;
  if (v1) {
    uint64_t v2 = sub_24D1C91C8;
  }
  else {
    uint64_t v2 = sub_24D1C90DC;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D1C90DC()
{
  uint64_t v2 = (void *)v0[43];
  uint64_t v1 = (void *)v0[44];
  uint64_t v4 = (void *)v0[41];
  uint64_t v3 = (void *)v0[42];
  uint64_t v6 = (void *)v0[39];
  uint64_t v5 = (void *)v0[40];
  unint64_t v7 = (void *)v0[38];
  uint64_t v8 = v0[36];
  uint64_t v9 = v0[15];
  swift_unknownObjectRelease();

  objc_msgSend(*(id *)(v8 + 16), sel_invalidate);
  v0[17] = v9;
  sub_24D219220();
  swift_release();
  swift_task_dealloc();
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_24D1C91C8()
{
  uint64_t v2 = (void *)v0[44];
  uint64_t v1 = v0[45];
  uint64_t v4 = (void *)v0[42];
  uint64_t v3 = (void *)v0[43];
  uint64_t v5 = (void *)v0[40];
  uint64_t v6 = (void *)v0[41];
  uint64_t v9 = (void *)v0[39];
  uint64_t v10 = (void *)v0[38];
  swift_willThrow();
  swift_release();
  swift_unknownObjectRelease();

  v0[16] = v1;
  sub_24D219210();
  swift_task_dealloc();
  unint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_24D1C92BC(void *a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_24D219020();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B18A2F8 != -1) {
    swift_once();
  }
  uint64_t v12 = __swift_project_value_buffer(v8, (uint64_t)qword_26B18A8F0);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v12, v8);
  id v13 = a1;
  swift_bridgeObjectRetain();
  id v14 = a1;
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_24D219000();
  os_log_type_t v16 = sub_24D2192D0();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    uint64_t v26 = a2;
    uint64_t v18 = v17;
    uint64_t v27 = swift_slowAlloc();
    uint64_t v30 = (uint64_t)a1;
    uint64_t v31 = v27;
    *(_DWORD *)uint64_t v18 = 136315394;
    uint64_t v29 = a4;
    id v19 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5D0);
    uint64_t v20 = sub_24D219100();
    uint64_t v28 = v8;
    uint64_t v30 = sub_24D1D0A78(v20, v21, &v31);
    sub_24D219310();
    swift_bridgeObjectRelease();

    *(_WORD *)(v18 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v30 = sub_24D1D0A78(v26, a3, &v31);
    sub_24D219310();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24D1B6000, v15, v16, "interval reading command failed for %s %s", (uint8_t *)v18, 0x16u);
    uint64_t v22 = v27;
    swift_arrayDestroy();
    MEMORY[0x253322AA0](v22, -1, -1);
    MEMORY[0x253322AA0](v18, -1, -1);

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v28);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  uint64_t v31 = (uint64_t)a1;
  id v23 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985BE10);
  return sub_24D219210();
}

uint64_t sub_24D1C9600(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5D0);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return MEMORY[0x270FA2410](v3, v5);
  }
  else
  {
    sub_24D218AC0();
    sub_24D1DA260(&qword_26985BD88, MEMORY[0x263F07490]);
    **(void **)(*(void *)(v3 + 64) + 40) = sub_24D219040();
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_24D1C9710()
{
  *(void *)(v1 + 16) = v0;
  return MEMORY[0x270FA2498](sub_24D1C9730, 0, 0);
}

uint64_t sub_24D1C9730()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24D1C980C;
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = MEMORY[0x263F8D4F8];
  return MEMORY[0x270FA2360](v0 + 40, 0, 0, 0xD000000000000011, 0x800000024D21B9E0, sub_24D1D6634, v2, v3);
}

uint64_t sub_24D1C980C()
{
  *(void *)(*(void *)v1 + 32) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24D1C993C;
  }
  else {
    uint64_t v2 = sub_24D1C9920;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D1C9920()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(unsigned __int8 *)(v0 + 40));
}

uint64_t sub_24D1C993C()
{
  return (*(uint64_t (**)(void))(v0 + 8))(0);
}

uint64_t sub_24D1C9958(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(a3);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x270FA5388]();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5B0);
  MEMORY[0x270FA5388]();
  uint64_t v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_24D219240();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 1, 1, v13);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v8);
  unint64_t v14 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = 0;
  *(void *)(v15 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v15 + v14, (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
  *(void *)(v15 + ((v10 + v14 + 7) & 0xFFFFFFFFFFFFFFF8)) = a2;
  swift_retain();
  sub_24D1BA610((uint64_t)v12, a5, v15);
  return swift_release();
}

uint64_t sub_24D1C9B34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[16] = a4;
  v5[17] = a5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BDF8);
  v5[18] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v5[19] = v7;
  v5[20] = *(void *)(v7 + 64);
  v5[21] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D1C9C00, 0, 0);
}

uint64_t sub_24D1C9C00()
{
  uint64_t v1 = v0[21];
  uint64_t v2 = v0[18];
  uint64_t v3 = v0[19];
  uint64_t v4 = v0[16];
  uint64_t v5 = v0[17];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[22] = sub_24D217288();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  unint64_t v6 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v7 + v6, v1, v2);
  uint64_t v8 = (void *)sub_24D217944((uint64_t)sub_24D1DA648, v7);
  v0[23] = v8;
  swift_release();
  id v9 = *(id *)(v5 + 16);
  sub_24D218E60();

  uint64_t v10 = sub_24D2190E0();
  v0[24] = v10;
  swift_bridgeObjectRelease();
  v0[2] = v0;
  v0[7] = v0 + 26;
  v0[3] = sub_24D1C9E14;
  uint64_t v11 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_24D2160E8;
  v0[13] = &block_descriptor_144;
  v0[14] = v11;
  objc_msgSend(v8, sel_isDataAvailableWithSiteID_completionHandler_, v10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_24D1C9E14()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 200) = v1;
  if (v1) {
    uint64_t v2 = sub_24D1C478C;
  }
  else {
    uint64_t v2 = sub_24D1C9F24;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D1C9F24()
{
  uint64_t v1 = *(void **)(v0 + 192);
  uint64_t v2 = *(void *)(v0 + 176);
  char v3 = *(unsigned char *)(v0 + 208);
  swift_unknownObjectRelease();

  objc_msgSend(*(id *)(v2 + 16), sel_invalidate);
  *(unsigned char *)(v0 + 209) = v3;
  sub_24D219220();
  swift_release();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_24D1C9FD8(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return MEMORY[0x270FA2498](sub_24D1C9FF8, 0, 0);
}

uint64_t sub_24D1C9FF8()
{
  id v1 = *(id *)(v0[3] + 16);
  uint64_t v2 = sub_24D218E60();
  uint64_t v4 = v3;

  v0[4] = v4;
  uint64_t v5 = (void *)swift_task_alloc();
  v0[5] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_24D1CA0B8;
  return sub_24D1D51D4(v2, v4);
}

uint64_t sub_24D1CA0B8(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 48) = a1;
  *(void *)(v3 + 56) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = sub_24D1CA29C;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v4 = sub_24D1CA1D4;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_24D1CA1D4()
{
  uint64_t v1 = (void *)v0[6];
  uint64_t v2 = v0[2];
  if (v1)
  {
    id v3 = v1;
    sub_24D218DA0();
  }
  else
  {
    uint64_t v4 = sub_24D218C20();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v2, 1, 1, v4);
  }
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_24D1CA29C()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24D1CA300()
{
  v1[9] = v0;
  uint64_t v2 = sub_24D219020();
  v1[10] = v2;
  v1[11] = *(void *)(v2 - 8);
  v1[12] = swift_task_alloc();
  v1[13] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A618);
  v1[14] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(qword_26985BC00);
  v1[15] = swift_task_alloc();
  uint64_t v3 = sub_24D218C10();
  v1[16] = v3;
  v1[17] = *(void *)(v3 - 8);
  v1[18] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D1CA48C, 0, 0);
}

uint64_t sub_24D1CA48C()
{
  id v1 = *(id *)(v0[9] + 16);
  uint64_t v2 = sub_24D218E60();
  uint64_t v4 = v3;

  v0[19] = v4;
  uint64_t v5 = (void *)swift_task_alloc();
  v0[20] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_24D1CA54C;
  return sub_24D1D51D4(v2, v4);
}

uint64_t sub_24D1CA54C(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 168) = a1;
  *(void *)(v3 + 176) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = sub_24D1CAC00;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v4 = sub_24D1CA668;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_24D1CA668()
{
  uint64_t v49 = v0;
  uint64_t v1 = (void *)v0[21];
  if (!v1) {
    goto LABEL_4;
  }
  uint64_t v2 = v0[14];
  id v3 = v1;
  sub_24D218DA0();

  uint64_t v4 = sub_24D218C20();
  int v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(v2, 1, v4);
  uint64_t v6 = v0[14];
  if (v5)
  {
    sub_24D1D9A80(v0[14], &qword_26B18A618);
LABEL_4:
    (*(void (**)(void, uint64_t, uint64_t, void))(v0[17] + 56))(v0[15], 1, 1, v0[16]);
LABEL_5:
    sub_24D1D9A80(v0[15], qword_26985BC00);
    goto LABEL_6;
  }
  uint64_t v21 = sub_24D218BD0();
  sub_24D1D9A80(v6, &qword_26B18A618);
  if (*(void *)(v21 + 16))
  {
    (*(void (**)(void, unint64_t, void))(v0[17] + 16))(v0[15], v21 + ((*(unsigned __int8 *)(v0[17] + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0[17] + 80)), v0[16]);
    uint64_t v22 = 0;
  }
  else
  {
    uint64_t v22 = 1;
  }
  uint64_t v23 = v0[16];
  uint64_t v24 = v0[17];
  uint64_t v25 = v0[15];
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v24 + 56))(v25, v22, 1, v23);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v24 + 48))(v25, 1, v23) == 1) {
    goto LABEL_5;
  }
  uint64_t v26 = (void *)v0[22];
  uint64_t v27 = v0[18];
  uint64_t v28 = (*(uint64_t (**)(uint64_t, void, void))(v0[17] + 32))(v27, v0[15], v0[16]);
  unint64_t v48 = MEMORY[0x263F8EE78];
  uint64_t v29 = (void *)MEMORY[0x2533225B0](v28);
  sub_24D1CACA4(v27, &v48);
  if (!v26)
  {
    uint64_t v43 = v0[17];
    uint64_t v42 = v0[18];
    uint64_t v44 = v0[16];

    (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v42, v44);
    unint64_t v18 = v48;
    goto LABEL_11;
  }
  if (qword_26985BA68 != -1) {
    swift_once();
  }
  uint64_t v30 = v0[13];
  uint64_t v31 = v0[10];
  uint64_t v32 = v0[11];
  uint64_t v33 = __swift_project_value_buffer(v31, (uint64_t)qword_26985D068);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v32 + 16))(v30, v33, v31);
  id v34 = v26;
  id v35 = v26;
  unint64_t v36 = sub_24D219000();
  os_log_type_t v37 = sub_24D2192D0();
  if (os_log_type_enabled(v36, v37))
  {
    uint64_t v38 = (uint8_t *)swift_slowAlloc();
    uint64_t v39 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v38 = 138412290;
    id v40 = v26;
    uint64_t v41 = _swift_stdlib_bridgeErrorToNSError();
    v0[8] = v41;
    sub_24D219310();
    *uint64_t v39 = v41;

    _os_log_impl(&dword_24D1B6000, v36, v37, "Failed to unarchive Readings %@", v38, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(qword_26985BB28);
    swift_arrayDestroy();
    MEMORY[0x253322AA0](v39, -1, -1);
    MEMORY[0x253322AA0](v38, -1, -1);
  }
  else
  {
  }
  uint64_t v46 = v0[17];
  uint64_t v45 = v0[18];
  uint64_t v47 = v0[16];
  (*(void (**)(void, void))(v0[11] + 8))(v0[13], v0[10]);
  (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v45, v47);
  swift_bridgeObjectRelease();
LABEL_6:
  if (qword_26985BA68 != -1) {
    swift_once();
  }
  uint64_t v8 = v0[11];
  uint64_t v7 = v0[12];
  uint64_t v9 = v0[10];
  uint64_t v10 = __swift_project_value_buffer(v9, (uint64_t)qword_26985D068);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v7, v10, v9);
  uint64_t v11 = sub_24D219000();
  os_log_type_t v12 = sub_24D2192E0();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_24D1B6000, v11, v12, "Found no Utility Peak Periods on EnergySite", v13, 2u);
    MEMORY[0x253322AA0](v13, -1, -1);
  }
  unint64_t v14 = (void *)v0[21];
  uint64_t v16 = v0[11];
  uint64_t v15 = v0[12];
  uint64_t v17 = v0[10];

  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
  unint64_t v18 = 0;
LABEL_11:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v19 = (uint64_t (*)(unint64_t))v0[1];
  return v19(v18);
}

uint64_t sub_24D1CAC00()
{
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24D1CACA4(uint64_t a1, unint64_t *a2)
{
  uint64_t v4 = sub_24D218FB0();
  uint64_t v35 = *(void *)(v4 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)v30 - v8;
  sub_24D1DA170();
  uint64_t v10 = sub_24D218C00();
  unint64_t v12 = v11;
  uint64_t v13 = (void *)sub_24D2192F0();
  uint64_t result = sub_24D1DA1B0(v10, v12);
  if (!v2)
  {
    uint64_t v15 = v35;
    uint64_t v33 = v9;
    uint64_t v34 = v4;
    os_log_type_t v37 = v7;
    if (!v13 || (v38 = 0, sub_24D219180(), v13, (uint64_t v16 = v38) == 0))
    {
      swift_bridgeObjectRelease();
      uint64_t v16 = MEMORY[0x263F8EE78];
    }
    uint64_t v17 = v33;
    uint64_t v18 = v34;
    uint64_t v19 = *(void *)(v16 + 16);
    if (v19)
    {
      v30[2] = v15 + 32;
      uint64_t v31 = (void (**)(char *, char *, uint64_t))(v15 + 16);
      v30[0] = v16;
      v30[1] = v15 + 8;
      uint64_t v20 = (unint64_t *)(v16 + 40);
      uint64_t v32 = a2;
      do
      {
        uint64_t v21 = *(v20 - 1);
        unint64_t v22 = *v20;
        uint64_t v23 = sub_24D1DA208(v21, *v20);
        unint64_t v36 = (void *)MEMORY[0x2533225B0](v23);
        sub_24D2189B0();
        swift_allocObject();
        sub_24D2189A0();
        sub_24D1DA260(&qword_26985BDD8, MEMORY[0x263F49B88]);
        sub_24D218990();
        swift_release();
        (*v31)(v37, v17, v18);
        unint64_t v24 = *a2;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *a2 = v24;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          unint64_t v24 = sub_24D1D0758(0, *(void *)(v24 + 16) + 1, 1, v24, &qword_26985BDE0, MEMORY[0x263F49B88], MEMORY[0x263F49B88]);
          *a2 = v24;
        }
        unint64_t v27 = *(void *)(v24 + 16);
        unint64_t v26 = *(void *)(v24 + 24);
        if (v27 >= v26 >> 1)
        {
          unint64_t v24 = sub_24D1D0758(v26 > 1, v27 + 1, 1, v24, &qword_26985BDE0, MEMORY[0x263F49B88], MEMORY[0x263F49B88]);
          unint64_t *v32 = v24;
        }
        v20 += 2;
        *(void *)(v24 + 16) = v27 + 1;
        uint64_t v18 = v34;
        uint64_t v28 = v35;
        (*(void (**)(unint64_t, char *, uint64_t))(v35 + 32))(v24+ ((*(unsigned __int8 *)(v28 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v28 + 80))+ *(void *)(v28 + 72) * v27, v37, v34);
        uint64_t v29 = v33;
        (*(void (**)(char *, uint64_t))(v28 + 8))(v33, v18);
        sub_24D1DA1B0(v21, v22);
        --v19;
        a2 = v32;
        uint64_t v17 = v29;
      }
      while (v19);
    }
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_24D1CB084(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A618);
  v2[4] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(qword_26985BC00);
  v2[5] = swift_task_alloc();
  uint64_t v3 = sub_24D218C10();
  v2[6] = v3;
  v2[7] = *(void *)(v3 - 8);
  v2[8] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D1CB1A4, 0, 0);
}

uint64_t sub_24D1CB1A4()
{
  id v1 = *(id *)(v0[3] + 16);
  uint64_t v2 = sub_24D218E60();
  uint64_t v4 = v3;

  v0[9] = v4;
  uint64_t v5 = (void *)swift_task_alloc();
  v0[10] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_24D1CB264;
  return sub_24D1D51D4(v2, v4);
}

uint64_t sub_24D1CB264(uint64_t a1)
{
  uint64_t v3 = (void *)*v2;
  v3[11] = a1;
  v3[12] = v1;
  swift_task_dealloc();
  if (v1)
  {
    return MEMORY[0x270FA2498](sub_24D1CB4EC, 0, 0);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v4 = (void *)swift_task_alloc();
    v3[13] = v4;
    *uint64_t v4 = v3;
    v4[1] = sub_24D1CB3D8;
    return sub_24D1CA300();
  }
}

uint64_t sub_24D1CB3D8(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 112) = a1;
  *(void *)(v3 + 120) = v1;
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = sub_24D1CB80C;
  }
  else {
    uint64_t v4 = sub_24D1CB574;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_24D1CB4EC()
{
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24D1CB574()
{
  uint64_t v1 = (void *)v0[11];
  if (!v1) {
    goto LABEL_4;
  }
  uint64_t v2 = v0[4];
  id v3 = v1;
  sub_24D218DA0();

  uint64_t v4 = sub_24D218C20();
  int v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(v2, 1, v4);
  uint64_t v6 = v0[4];
  if (v5)
  {
    sub_24D1D9A80(v0[4], &qword_26B18A618);
LABEL_4:
    (*(void (**)(void, uint64_t, uint64_t, void))(v0[7] + 56))(v0[5], 1, 1, v0[6]);
    id v3 = v1;
LABEL_5:

    uint64_t v7 = v0[5];
    swift_bridgeObjectRelease();
    sub_24D1D9A80(v7, qword_26985BC00);
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    goto LABEL_6;
  }
  uint64_t v16 = sub_24D218BD0();
  sub_24D1D9A80(v6, &qword_26B18A618);
  if (*(void *)(v16 + 16))
  {
    (*(void (**)(void, unint64_t, void))(v0[7] + 16))(v0[5], v16 + ((*(unsigned __int8 *)(v0[7] + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0[7] + 80)), v0[6]);
    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v17 = 1;
  }
  uint64_t v18 = v0[6];
  uint64_t v19 = v0[7];
  uint64_t v20 = v0[5];
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 56))(v20, v17, 1, v18);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v19 + 48))(v20, 1, v18) == 1) {
    goto LABEL_5;
  }
  uint64_t v21 = v0[14];
  uint64_t v23 = v0[7];
  uint64_t v22 = v0[8];
  uint64_t v24 = v0[6];
  (*(void (**)(uint64_t, void, uint64_t))(v23 + 32))(v22, v0[5], v24);
  uint64_t v9 = sub_24D218BE0();
  uint64_t v10 = v25;
  uint64_t v11 = sub_24D218BF0();
  uint64_t v12 = v26;

  (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v22, v24);
  if (v21) {
    uint64_t v8 = v21;
  }
  else {
    uint64_t v8 = MEMORY[0x263F8EE78];
  }
LABEL_6:
  uint64_t v13 = (void *)v0[2];
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  *uint64_t v13 = v8;
  v13[1] = v9;
  v13[2] = v10;
  v13[3] = v11;
  v13[4] = v12;
  unint64_t v14 = (uint64_t (*)(void))v0[1];
  return v14();
}

uint64_t sub_24D1CB80C()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24D1CB894()
{
  uint64_t v1 = sub_24D219020();
  v0[11] = v1;
  v0[12] = *(void *)(v1 - 8);
  v0[13] = swift_task_alloc();
  v0[14] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(qword_26985BC18);
  v0[15] = swift_task_alloc();
  uint64_t v2 = sub_24D218FB0();
  v0[16] = v2;
  v0[17] = *(void *)(v2 - 8);
  v0[18] = swift_task_alloc();
  v0[19] = swift_task_alloc();
  v0[20] = swift_task_alloc();
  uint64_t v3 = (void *)swift_task_alloc();
  v0[21] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_24D1CBA34;
  return sub_24D1CA300();
}

uint64_t sub_24D1CBA34(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 176) = a1;
  swift_task_dealloc();
  if (v1)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = *(uint64_t (**)(void))(v3 + 8);
    return v4(0);
  }
  else
  {
    return MEMORY[0x270FA2498](sub_24D1CBBC0, 0, 0);
  }
}

uint64_t sub_24D1CBBC0()
{
  uint64_t v56 = v0;
  uint64_t v1 = v0[22];
  if (v1)
  {
    if (*(void *)(v1 + 16))
    {
      (*(void (**)(void, unint64_t, void))(v0[17] + 16))(v0[15], v1 + ((*(unsigned __int8 *)(v0[17] + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0[17] + 80)), v0[16]);
      uint64_t v2 = 0;
    }
    else
    {
      uint64_t v2 = 1;
    }
    uint64_t v3 = v0[16];
    uint64_t v4 = v0[17];
    uint64_t v5 = v0[15];
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56))(v5, v2, 1, v3);
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v5, 1, v3) == 1)
    {
      sub_24D1D9A80(v0[15], qword_26985BC18);
      if (qword_26B18A2F8 != -1) {
        swift_once();
      }
      uint64_t v7 = v0[12];
      uint64_t v6 = v0[13];
      uint64_t v8 = v0[11];
      uint64_t v9 = __swift_project_value_buffer(v8, (uint64_t)qword_26B18A8F0);
      swift_beginAccess();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v6, v9, v8);
      uint64_t v10 = sub_24D219000();
      os_log_type_t v11 = sub_24D2192E0();
      BOOL v12 = os_log_type_enabled(v10, v11);
      uint64_t v13 = v0[12];
      uint64_t v14 = v0[13];
      uint64_t v15 = v0[11];
      if (v12)
      {
        uint64_t v53 = v0[13];
        uint64_t v16 = (uint8_t *)swift_slowAlloc();
        uint64_t v17 = swift_slowAlloc();
        uint64_t v55 = v17;
        *(_DWORD *)uint64_t v16 = 136315138;
        v0[8] = sub_24D1D0A78(0x2928554F547369, 0xE700000000000000, &v55);
        sub_24D219310();
        _os_log_impl(&dword_24D1B6000, v10, v11, "%s no first peak in currentUtilityPeakPeriods", v16, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x253322AA0](v17, -1, -1);
        MEMORY[0x253322AA0](v16, -1, -1);

        (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v53, v15);
      }
      else
      {

        (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v14, v15);
      }
    }
    else
    {
      (*(void (**)(void, void, void))(v0[17] + 32))(v0[20], v0[15], v0[16]);
      if (qword_26B18A2F8 != -1) {
        swift_once();
      }
      uint64_t v18 = v0[11];
      uint64_t v20 = v0[19];
      uint64_t v19 = v0[20];
      uint64_t v22 = v0[16];
      uint64_t v21 = v0[17];
      uint64_t v23 = v0[14];
      uint64_t v24 = v0[12];
      uint64_t v25 = __swift_project_value_buffer(v18, (uint64_t)qword_26B18A8F0);
      swift_beginAccess();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16))(v23, v25, v18);
      uint64_t v26 = *(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 16);
      v26(v20, v19, v22);
      uint64_t v27 = sub_24D219000();
      os_log_type_t v28 = sub_24D2192E0();
      BOOL v29 = os_log_type_enabled(v27, v28);
      uint64_t v30 = v0[19];
      uint64_t v31 = v0[17];
      uint64_t v32 = v0[14];
      uint64_t v34 = v0[11];
      uint64_t v33 = v0[12];
      if (v29)
      {
        uint64_t v50 = v0[16];
        uint64_t v52 = v26;
        uint64_t v35 = swift_slowAlloc();
        uint64_t v51 = swift_slowAlloc();
        uint64_t v55 = v51;
        *(_DWORD *)uint64_t v35 = 136315394;
        v0[9] = sub_24D1D0A78(0x2928554F547369, 0xE700000000000000, &v55);
        sub_24D219310();
        *(_WORD *)(v35 + 12) = 2048;
        uint64_t v54 = v34;
        uint64_t v36 = sub_24D218FA0();
        os_log_type_t type = v28;
        os_log_type_t v37 = *(void (**)(uint64_t, uint64_t))(v31 + 8);
        v37(v30, v50);
        v0[10] = v36;
        sub_24D219310();
        _os_log_impl(&dword_24D1B6000, v27, type, "%s firstPeak rank is: %ld", (uint8_t *)v35, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x253322AA0](v51, -1, -1);
        uint64_t v38 = v35;
        uint64_t v26 = v52;
        MEMORY[0x253322AA0](v38, -1, -1);

        (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v32, v54);
      }
      else
      {
        os_log_type_t v37 = *(void (**)(uint64_t, uint64_t))(v31 + 8);
        v37(v0[19], v0[16]);

        (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v32, v34);
      }
      uint64_t v39 = v0[20];
      uint64_t v40 = v0[18];
      uint64_t v41 = v0[16];
      uint64_t v42 = sub_24D218FA0();
      v26(v40, v39, v41);
      uint64_t v43 = v0[20];
      uint64_t v44 = v0[18];
      uint64_t v45 = v0[16];
      if ((v42 & 0x8000000000000000) == 0)
      {
        uint64_t v46 = sub_24D218FA0();
        v37(v44, v45);
        v37(v43, v45);
        uint64_t v1 = v46 < 5;
        goto LABEL_20;
      }
      v37(v0[18], v0[16]);
      v37(v43, v45);
    }
    uint64_t v1 = 0;
  }
LABEL_20:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v47 = (uint64_t (*)(uint64_t))v0[1];
  return v47(v1);
}

uint64_t sub_24D1CC200()
{
  uint64_t v1 = sub_24D219020();
  v0[11] = v1;
  v0[12] = *(void *)(v1 - 8);
  v0[13] = swift_task_alloc();
  v0[14] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(qword_26985BC18);
  v0[15] = swift_task_alloc();
  uint64_t v2 = sub_24D218FB0();
  v0[16] = v2;
  v0[17] = *(void *)(v2 - 8);
  v0[18] = swift_task_alloc();
  v0[19] = swift_task_alloc();
  uint64_t v3 = (void *)swift_task_alloc();
  v0[20] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_24D1CC394;
  return sub_24D1CA300();
}

uint64_t sub_24D1CC394(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 168) = a1;
  swift_task_dealloc();
  if (v1)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = *(uint64_t (**)(void))(v3 + 8);
    return v4(0);
  }
  else
  {
    return MEMORY[0x270FA2498](sub_24D1CC514, 0, 0);
  }
}

uint64_t sub_24D1CC514()
{
  unint64_t v48 = v0;
  uint64_t v1 = v0[21];
  if (v1)
  {
    if (*(void *)(v1 + 16))
    {
      (*(void (**)(void, unint64_t, void))(v0[17] + 16))(v0[15], v1 + ((*(unsigned __int8 *)(v0[17] + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0[17] + 80)), v0[16]);
      uint64_t v2 = 0;
    }
    else
    {
      uint64_t v2 = 1;
    }
    uint64_t v3 = v0[16];
    uint64_t v4 = v0[17];
    uint64_t v5 = v0[15];
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56))(v5, v2, 1, v3);
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v5, 1, v3) == 1)
    {
      sub_24D1D9A80(v0[15], qword_26985BC18);
      if (qword_26B18A2F8 != -1) {
        swift_once();
      }
      uint64_t v7 = v0[12];
      uint64_t v6 = v0[13];
      uint64_t v8 = v0[11];
      uint64_t v9 = __swift_project_value_buffer(v8, (uint64_t)qword_26B18A8F0);
      swift_beginAccess();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v6, v9, v8);
      uint64_t v10 = sub_24D219000();
      os_log_type_t v11 = sub_24D2192E0();
      BOOL v12 = os_log_type_enabled(v10, v11);
      uint64_t v13 = v0[12];
      uint64_t v14 = v0[13];
      uint64_t v15 = v0[11];
      if (v12)
      {
        uint64_t v44 = v0[13];
        uint64_t v16 = (uint8_t *)swift_slowAlloc();
        uint64_t v17 = swift_slowAlloc();
        uint64_t v47 = v17;
        *(_DWORD *)uint64_t v16 = 136315138;
        v0[8] = sub_24D1D0A78(0x6465726569547369, 0xEA00000000002928, &v47);
        sub_24D219310();
        _os_log_impl(&dword_24D1B6000, v10, v11, "%s no first peak in currentUtilityPeakPeriods", v16, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x253322AA0](v17, -1, -1);
        MEMORY[0x253322AA0](v16, -1, -1);

        (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v44, v15);
      }
      else
      {

        (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v14, v15);
      }
      uint64_t v1 = 0;
    }
    else
    {
      (*(void (**)(void, void, void))(v0[17] + 32))(v0[19], v0[15], v0[16]);
      if (qword_26B18A2F8 != -1) {
        swift_once();
      }
      uint64_t v18 = v0[11];
      uint64_t v20 = v0[18];
      uint64_t v19 = v0[19];
      uint64_t v21 = v0[16];
      uint64_t v22 = v0[17];
      uint64_t v23 = v0[14];
      uint64_t v24 = v0[12];
      uint64_t v25 = __swift_project_value_buffer(v18, (uint64_t)qword_26B18A8F0);
      swift_beginAccess();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16))(v23, v25, v18);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 16))(v20, v19, v21);
      uint64_t v26 = sub_24D219000();
      os_log_type_t v27 = sub_24D2192E0();
      BOOL v28 = os_log_type_enabled(v26, v27);
      uint64_t v30 = v0[17];
      uint64_t v29 = v0[18];
      uint64_t v31 = v0[14];
      uint64_t v33 = v0[11];
      uint64_t v32 = v0[12];
      if (v28)
      {
        uint64_t v42 = v0[16];
        uint64_t v45 = v0[14];
        uint64_t v34 = swift_slowAlloc();
        uint64_t v43 = swift_slowAlloc();
        uint64_t v47 = v43;
        *(_DWORD *)uint64_t v34 = 136315394;
        v0[9] = sub_24D1D0A78(0x6465726569547369, 0xEA00000000002928, &v47);
        sub_24D219310();
        *(_WORD *)(v34 + 12) = 2048;
        uint64_t v46 = v33;
        uint64_t v35 = sub_24D218FA0();
        uint64_t v36 = *(void (**)(uint64_t, uint64_t))(v30 + 8);
        v36(v29, v42);
        v0[10] = v35;
        sub_24D219310();
        _os_log_impl(&dword_24D1B6000, v26, v27, "%s firstPeak rank is: %ld", (uint8_t *)v34, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x253322AA0](v43, -1, -1);
        MEMORY[0x253322AA0](v34, -1, -1);

        (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v45, v46);
      }
      else
      {
        uint64_t v36 = *(void (**)(uint64_t, uint64_t))(v30 + 8);
        v36(v0[18], v0[16]);

        (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v31, v33);
      }
      uint64_t v37 = v0[19];
      uint64_t v38 = v0[16];
      uint64_t v39 = sub_24D218FA0();
      v36(v37, v38);
      uint64_t v1 = v39 == 999;
    }
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v40 = (uint64_t (*)(uint64_t))v0[1];
  return v40(v1);
}

uint64_t sub_24D1CCACC()
{
  uint64_t v1 = sub_24D219020();
  v0[11] = v1;
  v0[12] = *(void *)(v1 - 8);
  v0[13] = swift_task_alloc();
  v0[14] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(qword_26985BC18);
  v0[15] = swift_task_alloc();
  uint64_t v2 = sub_24D218FB0();
  v0[16] = v2;
  v0[17] = *(void *)(v2 - 8);
  v0[18] = swift_task_alloc();
  v0[19] = swift_task_alloc();
  uint64_t v3 = (void *)swift_task_alloc();
  v0[20] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_24D1CCC60;
  return sub_24D1CA300();
}

uint64_t sub_24D1CCC60(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 168) = a1;
  swift_task_dealloc();
  if (v1)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = *(uint64_t (**)(void))(v3 + 8);
    return v4(0);
  }
  else
  {
    return MEMORY[0x270FA2498](sub_24D1CCDE0, 0, 0);
  }
}

uint64_t sub_24D1CCDE0()
{
  unint64_t v48 = v0;
  uint64_t v1 = v0[21];
  if (v1)
  {
    if (*(void *)(v1 + 16))
    {
      (*(void (**)(void, unint64_t, void))(v0[17] + 16))(v0[15], v1 + ((*(unsigned __int8 *)(v0[17] + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0[17] + 80)), v0[16]);
      uint64_t v2 = 0;
    }
    else
    {
      uint64_t v2 = 1;
    }
    uint64_t v3 = v0[16];
    uint64_t v4 = v0[17];
    uint64_t v5 = v0[15];
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56))(v5, v2, 1, v3);
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v5, 1, v3) == 1)
    {
      sub_24D1D9A80(v0[15], qword_26985BC18);
      if (qword_26B18A2F8 != -1) {
        swift_once();
      }
      uint64_t v7 = v0[12];
      uint64_t v6 = v0[13];
      uint64_t v8 = v0[11];
      uint64_t v9 = __swift_project_value_buffer(v8, (uint64_t)qword_26B18A8F0);
      swift_beginAccess();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v6, v9, v8);
      uint64_t v10 = sub_24D219000();
      os_log_type_t v11 = sub_24D2192E0();
      BOOL v12 = os_log_type_enabled(v10, v11);
      uint64_t v13 = v0[12];
      uint64_t v14 = v0[13];
      uint64_t v15 = v0[11];
      if (v12)
      {
        uint64_t v44 = v0[13];
        uint64_t v16 = (uint8_t *)swift_slowAlloc();
        uint64_t v17 = swift_slowAlloc();
        uint64_t v47 = v17;
        *(_DWORD *)uint64_t v16 = 136315138;
        v0[8] = sub_24D1D0A78(0x292874616C467369, 0xE800000000000000, &v47);
        sub_24D219310();
        _os_log_impl(&dword_24D1B6000, v10, v11, "%s no first peak in currentUtilityPeakPeriods", v16, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x253322AA0](v17, -1, -1);
        MEMORY[0x253322AA0](v16, -1, -1);

        (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v44, v15);
      }
      else
      {

        (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v14, v15);
      }
      uint64_t v1 = 0;
    }
    else
    {
      (*(void (**)(void, void, void))(v0[17] + 32))(v0[19], v0[15], v0[16]);
      if (qword_26B18A2F8 != -1) {
        swift_once();
      }
      uint64_t v18 = v0[11];
      uint64_t v20 = v0[18];
      uint64_t v19 = v0[19];
      uint64_t v21 = v0[16];
      uint64_t v22 = v0[17];
      uint64_t v23 = v0[14];
      uint64_t v24 = v0[12];
      uint64_t v25 = __swift_project_value_buffer(v18, (uint64_t)qword_26B18A8F0);
      swift_beginAccess();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16))(v23, v25, v18);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 16))(v20, v19, v21);
      uint64_t v26 = sub_24D219000();
      os_log_type_t v27 = sub_24D2192E0();
      BOOL v28 = os_log_type_enabled(v26, v27);
      uint64_t v30 = v0[17];
      uint64_t v29 = v0[18];
      uint64_t v31 = v0[14];
      uint64_t v33 = v0[11];
      uint64_t v32 = v0[12];
      if (v28)
      {
        uint64_t v42 = v0[16];
        uint64_t v45 = v0[14];
        uint64_t v34 = swift_slowAlloc();
        uint64_t v43 = swift_slowAlloc();
        uint64_t v47 = v43;
        *(_DWORD *)uint64_t v34 = 136315394;
        v0[9] = sub_24D1D0A78(0x292874616C467369, 0xE800000000000000, &v47);
        sub_24D219310();
        *(_WORD *)(v34 + 12) = 2048;
        uint64_t v46 = v33;
        uint64_t v35 = sub_24D218FA0();
        uint64_t v36 = *(void (**)(uint64_t, uint64_t))(v30 + 8);
        v36(v29, v42);
        v0[10] = v35;
        sub_24D219310();
        _os_log_impl(&dword_24D1B6000, v26, v27, "%s firstPeak rank is: %ld", (uint8_t *)v34, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x253322AA0](v43, -1, -1);
        MEMORY[0x253322AA0](v34, -1, -1);

        (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v45, v46);
      }
      else
      {
        uint64_t v36 = *(void (**)(uint64_t, uint64_t))(v30 + 8);
        v36(v0[18], v0[16]);

        (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v31, v33);
      }
      uint64_t v37 = v0[19];
      uint64_t v38 = v0[16];
      uint64_t v39 = sub_24D218FA0();
      v36(v37, v38);
      uint64_t v1 = v39 == 998;
    }
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v40 = (uint64_t (*)(uint64_t))v0[1];
  return v40(v1);
}

uint64_t sub_24D1CD390()
{
  uint64_t v1 = sub_24D219020();
  v0[11] = v1;
  v0[12] = *(void *)(v1 - 8);
  v0[13] = swift_task_alloc();
  v0[14] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(qword_26985BC18);
  v0[15] = swift_task_alloc();
  uint64_t v2 = sub_24D218FB0();
  v0[16] = v2;
  v0[17] = *(void *)(v2 - 8);
  v0[18] = swift_task_alloc();
  v0[19] = swift_task_alloc();
  uint64_t v3 = (void *)swift_task_alloc();
  v0[20] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_24D1CD524;
  return sub_24D1CA300();
}

uint64_t sub_24D1CD524(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 168) = a1;
  swift_task_dealloc();
  if (v1)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = *(uint64_t (**)(void))(v3 + 8);
    return v4(0);
  }
  else
  {
    return MEMORY[0x270FA2498](sub_24D1CD6A4, 0, 0);
  }
}

uint64_t sub_24D1CD6A4()
{
  unint64_t v48 = v0;
  uint64_t v1 = v0[21];
  if (v1)
  {
    if (*(void *)(v1 + 16))
    {
      (*(void (**)(void, unint64_t, void))(v0[17] + 16))(v0[15], v1 + ((*(unsigned __int8 *)(v0[17] + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0[17] + 80)), v0[16]);
      uint64_t v2 = 0;
    }
    else
    {
      uint64_t v2 = 1;
    }
    uint64_t v3 = v0[16];
    uint64_t v4 = v0[17];
    uint64_t v5 = v0[15];
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56))(v5, v2, 1, v3);
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v5, 1, v3) == 1)
    {
      sub_24D1D9A80(v0[15], qword_26985BC18);
      if (qword_26B18A2F8 != -1) {
        swift_once();
      }
      uint64_t v7 = v0[12];
      uint64_t v6 = v0[13];
      uint64_t v8 = v0[11];
      uint64_t v9 = __swift_project_value_buffer(v8, (uint64_t)qword_26B18A8F0);
      swift_beginAccess();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v6, v9, v8);
      uint64_t v10 = sub_24D219000();
      os_log_type_t v11 = sub_24D2192E0();
      BOOL v12 = os_log_type_enabled(v10, v11);
      uint64_t v13 = v0[12];
      uint64_t v14 = v0[13];
      uint64_t v15 = v0[11];
      if (v12)
      {
        uint64_t v44 = v0[13];
        uint64_t v16 = (uint8_t *)swift_slowAlloc();
        uint64_t v17 = swift_slowAlloc();
        uint64_t v47 = v17;
        *(_DWORD *)uint64_t v16 = 136315138;
        v0[8] = sub_24D1D0A78(0x2864657869467369, 0xE900000000000029, &v47);
        sub_24D219310();
        _os_log_impl(&dword_24D1B6000, v10, v11, "%s no first peak in currentUtilityPeakPeriods", v16, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x253322AA0](v17, -1, -1);
        MEMORY[0x253322AA0](v16, -1, -1);

        (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v44, v15);
      }
      else
      {

        (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v14, v15);
      }
      uint64_t v1 = 0;
    }
    else
    {
      (*(void (**)(void, void, void))(v0[17] + 32))(v0[19], v0[15], v0[16]);
      if (qword_26B18A2F8 != -1) {
        swift_once();
      }
      uint64_t v18 = v0[11];
      uint64_t v20 = v0[18];
      uint64_t v19 = v0[19];
      uint64_t v21 = v0[16];
      uint64_t v22 = v0[17];
      uint64_t v23 = v0[14];
      uint64_t v24 = v0[12];
      uint64_t v25 = __swift_project_value_buffer(v18, (uint64_t)qword_26B18A8F0);
      swift_beginAccess();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16))(v23, v25, v18);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 16))(v20, v19, v21);
      uint64_t v26 = sub_24D219000();
      os_log_type_t v27 = sub_24D2192E0();
      BOOL v28 = os_log_type_enabled(v26, v27);
      uint64_t v30 = v0[17];
      uint64_t v29 = v0[18];
      uint64_t v31 = v0[14];
      uint64_t v33 = v0[11];
      uint64_t v32 = v0[12];
      if (v28)
      {
        uint64_t v42 = v0[16];
        uint64_t v45 = v0[14];
        uint64_t v34 = swift_slowAlloc();
        uint64_t v43 = swift_slowAlloc();
        uint64_t v47 = v43;
        *(_DWORD *)uint64_t v34 = 136315394;
        v0[9] = sub_24D1D0A78(0x2864657869467369, 0xE900000000000029, &v47);
        sub_24D219310();
        *(_WORD *)(v34 + 12) = 2048;
        uint64_t v46 = v33;
        uint64_t v35 = sub_24D218FA0();
        uint64_t v36 = *(void (**)(uint64_t, uint64_t))(v30 + 8);
        v36(v29, v42);
        v0[10] = v35;
        sub_24D219310();
        _os_log_impl(&dword_24D1B6000, v26, v27, "%s firstPeak rank is: %ld", (uint8_t *)v34, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x253322AA0](v43, -1, -1);
        MEMORY[0x253322AA0](v34, -1, -1);

        (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v45, v46);
      }
      else
      {
        uint64_t v36 = *(void (**)(uint64_t, uint64_t))(v30 + 8);
        v36(v0[18], v0[16]);

        (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v31, v33);
      }
      uint64_t v37 = v0[19];
      uint64_t v38 = v0[16];
      uint64_t v39 = sub_24D218FA0();
      v36(v37, v38);
      uint64_t v1 = v39 == 997;
    }
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v40 = (uint64_t (*)(uint64_t))v0[1];
  return v40(v1);
}

uint64_t sub_24D1CDC5C()
{
  uint64_t v1 = sub_24D219020();
  v0[11] = v1;
  v0[12] = *(void *)(v1 - 8);
  v0[13] = swift_task_alloc();
  v0[14] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(qword_26985BC18);
  v0[15] = swift_task_alloc();
  uint64_t v2 = sub_24D218FB0();
  v0[16] = v2;
  v0[17] = *(void *)(v2 - 8);
  v0[18] = swift_task_alloc();
  v0[19] = swift_task_alloc();
  uint64_t v3 = (void *)swift_task_alloc();
  v0[20] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_24D1CDDF0;
  return sub_24D1CA300();
}

uint64_t sub_24D1CDDF0(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 168) = a1;
  swift_task_dealloc();
  if (v1)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = *(uint64_t (**)(void))(v3 + 8);
    return v4(0);
  }
  else
  {
    return MEMORY[0x270FA2498](sub_24D1CDF70, 0, 0);
  }
}

uint64_t sub_24D1CDF70()
{
  unint64_t v48 = v0;
  uint64_t v1 = v0[21];
  if (v1)
  {
    if (*(void *)(v1 + 16))
    {
      (*(void (**)(void, unint64_t, void))(v0[17] + 16))(v0[15], v1 + ((*(unsigned __int8 *)(v0[17] + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0[17] + 80)), v0[16]);
      uint64_t v2 = 0;
    }
    else
    {
      uint64_t v2 = 1;
    }
    uint64_t v3 = v0[16];
    uint64_t v4 = v0[17];
    uint64_t v5 = v0[15];
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56))(v5, v2, 1, v3);
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v5, 1, v3) == 1)
    {
      sub_24D1D9A80(v0[15], qword_26985BC18);
      if (qword_26B18A2F8 != -1) {
        swift_once();
      }
      uint64_t v7 = v0[12];
      uint64_t v6 = v0[13];
      uint64_t v8 = v0[11];
      uint64_t v9 = __swift_project_value_buffer(v8, (uint64_t)qword_26B18A8F0);
      swift_beginAccess();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v6, v9, v8);
      uint64_t v10 = sub_24D219000();
      os_log_type_t v11 = sub_24D2192E0();
      BOOL v12 = os_log_type_enabled(v10, v11);
      uint64_t v13 = v0[12];
      uint64_t v14 = v0[13];
      uint64_t v15 = v0[11];
      if (v12)
      {
        uint64_t v44 = v0[13];
        uint64_t v16 = (uint8_t *)swift_slowAlloc();
        uint64_t v17 = swift_slowAlloc();
        uint64_t v47 = v17;
        *(_DWORD *)uint64_t v16 = 136315138;
        v0[8] = sub_24D1D0A78(0x707075736E557369, 0xEF2928646574726FLL, &v47);
        sub_24D219310();
        _os_log_impl(&dword_24D1B6000, v10, v11, "%s no first peak in currentUtilityPeakPeriods", v16, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x253322AA0](v17, -1, -1);
        MEMORY[0x253322AA0](v16, -1, -1);

        (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v44, v15);
      }
      else
      {

        (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v14, v15);
      }
      uint64_t v1 = 0;
    }
    else
    {
      (*(void (**)(void, void, void))(v0[17] + 32))(v0[19], v0[15], v0[16]);
      if (qword_26B18A2F8 != -1) {
        swift_once();
      }
      uint64_t v18 = v0[11];
      uint64_t v20 = v0[18];
      uint64_t v19 = v0[19];
      uint64_t v21 = v0[16];
      uint64_t v22 = v0[17];
      uint64_t v23 = v0[14];
      uint64_t v24 = v0[12];
      uint64_t v25 = __swift_project_value_buffer(v18, (uint64_t)qword_26B18A8F0);
      swift_beginAccess();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16))(v23, v25, v18);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 16))(v20, v19, v21);
      uint64_t v26 = sub_24D219000();
      os_log_type_t v27 = sub_24D2192E0();
      BOOL v28 = os_log_type_enabled(v26, v27);
      uint64_t v30 = v0[17];
      uint64_t v29 = v0[18];
      uint64_t v31 = v0[14];
      uint64_t v33 = v0[11];
      uint64_t v32 = v0[12];
      if (v28)
      {
        uint64_t v42 = v0[16];
        uint64_t v45 = v0[14];
        uint64_t v34 = swift_slowAlloc();
        uint64_t v43 = swift_slowAlloc();
        uint64_t v47 = v43;
        *(_DWORD *)uint64_t v34 = 136315394;
        v0[9] = sub_24D1D0A78(0x707075736E557369, 0xEF2928646574726FLL, &v47);
        sub_24D219310();
        *(_WORD *)(v34 + 12) = 2048;
        uint64_t v46 = v33;
        uint64_t v35 = sub_24D218FA0();
        uint64_t v36 = *(void (**)(uint64_t, uint64_t))(v30 + 8);
        v36(v29, v42);
        v0[10] = v35;
        sub_24D219310();
        _os_log_impl(&dword_24D1B6000, v26, v27, "%s firstPeak rank is: %ld", (uint8_t *)v34, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x253322AA0](v43, -1, -1);
        MEMORY[0x253322AA0](v34, -1, -1);

        (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v45, v46);
      }
      else
      {
        uint64_t v36 = *(void (**)(uint64_t, uint64_t))(v30 + 8);
        v36(v0[18], v0[16]);

        (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v31, v33);
      }
      uint64_t v37 = v0[19];
      uint64_t v38 = v0[16];
      uint64_t v39 = sub_24D218FA0();
      v36(v37, v38);
      uint64_t v1 = v39 == 404;
    }
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v40 = (uint64_t (*)(uint64_t))v0[1];
  return v40(v1);
}

uint64_t sub_24D1CE538(uint64_t a1)
{
  v2[5] = a1;
  v2[6] = v1;
  uint64_t v3 = sub_24D219020();
  v2[7] = v3;
  v2[8] = *(void *)(v3 - 8);
  v2[9] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D1CE5F8, 0, 0);
}

uint64_t sub_24D1CE5F8()
{
  id v1 = *(id *)(*(void *)(v0 + 48) + 16);
  uint64_t v2 = sub_24D218E60();
  unint64_t v4 = v3;

  swift_bridgeObjectRelease();
  uint64_t v5 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    uint64_t v5 = v2 & 0xFFFFFFFFFFFFLL;
  }
  if (v5)
  {
    uint64_t v6 = (int8x16_t *)swift_task_alloc();
    *(void *)(v0 + 80) = v6;
    v6[1] = vextq_s8(*(int8x16_t *)(v0 + 40), *(int8x16_t *)(v0 + 40), 8uLL);
    uint64_t v7 = (void *)swift_task_alloc();
    *(void *)(v0 + 88) = v7;
    *uint64_t v7 = v0;
    uint64_t v8 = MEMORY[0x263F8EE60];
    v7[1] = sub_24D1CE8B0;
    return MEMORY[0x270FA2360](v7, 0, 0, 0xD000000000000028, 0x800000024D21BA00, sub_24D1D6674, v6, v8 + 8);
  }
  else
  {
    if (qword_26B18A2F8 != -1) {
      swift_once();
    }
    uint64_t v10 = *(void *)(v0 + 64);
    uint64_t v9 = *(void *)(v0 + 72);
    uint64_t v11 = *(void *)(v0 + 56);
    uint64_t v12 = __swift_project_value_buffer(v11, (uint64_t)qword_26B18A8F0);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v9, v12, v11);
    uint64_t v13 = sub_24D219000();
    os_log_type_t v14 = sub_24D2192D0();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl(&dword_24D1B6000, v13, v14, "Failed to refresh peaks. Site ID is empty.", v15, 2u);
      MEMORY[0x253322AA0](v15, -1, -1);
    }
    uint64_t v17 = *(void *)(v0 + 64);
    uint64_t v16 = *(void *)(v0 + 72);
    uint64_t v18 = *(void *)(v0 + 56);

    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);
    sub_24D1D5A68();
    swift_allocError();
    *uint64_t v19 = 28;
    swift_willThrow();
    swift_task_dealloc();
    uint64_t v20 = *(uint64_t (**)(void))(v0 + 8);
    return v20();
  }
}

uint64_t sub_24D1CE8B0()
{
  *(void *)(*(void *)v1 + 96) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_24D1CEA30;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_24D1CE9CC;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D1CE9CC()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24D1CEA30()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24D1CEA9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v23 = a3;
  uint64_t v24 = a2;
  uint64_t v4 = sub_24D218AC0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4);
  uint64_t v22 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A808);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5B0);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_24D219240();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 1, 1, v14);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a1, v7);
  uint64_t v15 = v4;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v23, v4);
  unint64_t v16 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  unint64_t v17 = (v9 + v16 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v18 = (*(unsigned __int8 *)(v5 + 80) + v17 + 8) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = 0;
  *(void *)(v19 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v19 + v16, v10, v7);
  *(void *)(v19 + v17) = v24;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v19 + v18, v22, v15);
  swift_retain();
  sub_24D1BA610((uint64_t)v13, (uint64_t)&unk_26985BDD0, v19);
  return swift_release();
}

uint64_t sub_24D1CED60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[17] = a5;
  v6[18] = a6;
  v6[16] = a4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A808);
  v6[19] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v6[20] = v8;
  v6[21] = *(void *)(v8 + 64);
  v6[22] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D1CEE30, 0, 0);
}

uint64_t sub_24D1CEE30()
{
  uint64_t v1 = v0[22];
  uint64_t v2 = v0[19];
  uint64_t v3 = v0[20];
  uint64_t v4 = v0[17];
  uint64_t v5 = v0[16];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[23] = sub_24D217288();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v5, v2);
  unint64_t v6 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v7 + v6, v1, v2);
  uint64_t v8 = (void *)sub_24D217944((uint64_t)sub_24D1DA0B8, v7);
  v0[24] = v8;
  swift_release();
  id v9 = *(id *)(v4 + 16);
  sub_24D218E60();

  uint64_t v10 = sub_24D2190E0();
  v0[25] = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = sub_24D218A40();
  v0[26] = v11;
  v0[2] = v0;
  v0[3] = sub_24D1CF050;
  uint64_t v12 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_24D1C39CC;
  v0[13] = &block_descriptor_126;
  v0[14] = v12;
  objc_msgSend(v8, sel_refreshCurrentUtilityPeakPeriodsWithSiteID_start_completionHandler_, v10, v11);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_24D1CF050()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 216) = v1;
  if (v1) {
    uint64_t v2 = sub_24D1CF20C;
  }
  else {
    uint64_t v2 = sub_24D1CF160;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D1CF160()
{
  uint64_t v2 = (void *)v0[25];
  uint64_t v1 = (void *)v0[26];
  uint64_t v3 = v0[23];
  swift_unknownObjectRelease();

  objc_msgSend(*(id *)(v3 + 16), sel_invalidate);
  sub_24D219220();
  swift_release();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_24D1CF20C()
{
  uint64_t v2 = (void *)v0[26];
  uint64_t v1 = v0[27];
  uint64_t v3 = (void *)v0[25];
  swift_willThrow();
  swift_release();
  swift_unknownObjectRelease();

  v0[15] = v1;
  sub_24D219210();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_24D1CF2D0(void *a1, uint64_t a2, const char *a3, uint64_t *a4)
{
  uint64_t v8 = sub_24D219020();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B18A2F8 != -1) {
    swift_once();
  }
  uint64_t v12 = __swift_project_value_buffer(v8, (uint64_t)qword_26B18A8F0);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v12, v8);
  id v13 = a1;
  id v14 = a1;
  uint64_t v15 = sub_24D219000();
  os_log_type_t v16 = sub_24D2192D0();
  if (os_log_type_enabled(v15, v16))
  {
    os_log_type_t v27 = a4;
    uint64_t v17 = swift_slowAlloc();
    uint64_t v28 = a2;
    unint64_t v18 = (uint8_t *)v17;
    uint64_t v25 = (void *)swift_slowAlloc();
    uint64_t v26 = a3;
    *(_DWORD *)unint64_t v18 = 138412290;
    id v19 = a1;
    uint64_t v20 = v8;
    uint64_t v21 = _swift_stdlib_bridgeErrorToNSError();
    uint64_t v29 = v21;
    a4 = v27;
    sub_24D219310();
    uint64_t v22 = v25;
    *uint64_t v25 = v21;
    uint64_t v8 = v20;

    _os_log_impl(&dword_24D1B6000, v15, v16, v26, v18, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(qword_26985BB28);
    swift_arrayDestroy();
    MEMORY[0x253322AA0](v22, -1, -1);
    MEMORY[0x253322AA0](v18, -1, -1);
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v29 = (uint64_t)a1;
  id v23 = a1;
  __swift_instantiateConcreteTypeFromMangledName(a4);
  return sub_24D219210();
}

uint64_t EnergySite.deinit()
{
  sub_24D218C80();
  uint64_t v1 = (void *)sub_24D2190E0();
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void *)(v0 + 32);
  if (v2)
  {
    uint64_t v3 = *(void **)(v0 + 24);
    swift_unknownObjectRetain_n();
    objc_msgSend(v3, sel_removeObserver_name_object_, v2, v1, 0);
    swift_unknownObjectRelease_n();
  }

  swift_unknownObjectRelease();
  sub_24D1D667C(v0 + 48);
  return v0;
}

uint64_t EnergySite.__deallocating_deinit()
{
  EnergySite.deinit();

  return MEMORY[0x270FA0228](v0, 64, 7);
}

uint64_t sub_24D1CF66C@<X0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v52 = a3;
  uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BDC0);
  uint64_t v5 = MEMORY[0x270FA5388](v53);
  uint64_t v51 = (char *)&v49 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v50 = (char *)&v49 - v7;
  uint64_t v8 = sub_24D218B70();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v49 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  uint64_t v15 = (char *)&v49 - v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v54 = (char *)&v49 - v16;
  uint64_t v17 = sub_24D218AC0();
  uint64_t v56 = *(void *)(v17 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v49 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v49 - v21;
  uint64_t v23 = *a1;
  uint64_t v49 = a2;
  switch(v23)
  {
    case 1:
    case 2:
      uint64_t v24 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 104);
      uint64_t v25 = (_DWORD *)MEMORY[0x263F078A8];
      uint64_t v26 = v54;
      v24(v54, *MEMORY[0x263F07870], v8);
      os_log_type_t v27 = v26;
      uint64_t v28 = v20;
      uint64_t v29 = v22;
      uint64_t v30 = v25;
      goto LABEL_7;
    case 3:
      uint64_t v31 = *MEMORY[0x263F07830];
      goto LABEL_6;
    case 4:
      uint64_t v31 = *MEMORY[0x263F078A8];
      goto LABEL_6;
    default:
      uint64_t v31 = *MEMORY[0x263F07890];
LABEL_6:
      uint64_t v24 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 104);
      uint64_t v32 = v54;
      v24(v54, v31, v8);
      os_log_type_t v27 = v32;
      uint64_t v28 = v20;
      uint64_t v29 = v22;
      uint64_t v30 = (_DWORD *)MEMORY[0x263F078A8];
LABEL_7:
      (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v15, v27, v8);
      uint64_t v33 = (*(uint64_t (**)(char *, uint64_t))(v9 + 88))(v15, v8);
      if (v33 == *v30 || v33 == *MEMORY[0x263F07870]) {
        goto LABEL_9;
      }
      if (v33 == *MEMORY[0x263F07890])
      {
        sub_24D218F80();
        sub_24D218A30();
      }
      else if (v33 == *MEMORY[0x263F07830])
      {
LABEL_9:
        v24(v12, v33, v8);
        sub_24D218F60();
        (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v56 + 16))(v29, v55, v17);
        (*(void (**)(char *, uint64_t))(v9 + 8))(v15, v8);
      }
      uint64_t v34 = *(void (**)(char *, char *, uint64_t))(v56 + 16);
      v34(v28, v55, v17);
      sub_24D1DA260((unint64_t *)&qword_26985BC50, MEMORY[0x263F07490]);
      char v35 = sub_24D2190C0();
      (*(void (**)(char *, uint64_t))(v9 + 8))(v54, v8);
      if ((v35 & 1) == 0)
      {
        __break(1u);
        JUMPOUT(0x24D1CFC84);
      }
      uint64_t v54 = v29;
      uint64_t v36 = v28;
      uint64_t v37 = v50;
      uint64_t v38 = v51;
      uint64_t v39 = v56;
      uint64_t v40 = v53;
      uint64_t v41 = &v50[*(int *)(v53 + 48)];
      uint64_t v42 = *(void (**)(char *, char *, uint64_t))(v56 + 32);
      v42(v50, v36, v17);
      uint64_t v55 = v41;
      v42(v41, v54, v17);
      uint64_t v43 = &v38[*(int *)(v40 + 48)];
      v34(v38, v37, v17);
      v34(v43, v41, v17);
      uint64_t v44 = v52;
      v42(v52, v38, v17);
      uint64_t v45 = *(void (**)(char *, uint64_t))(v39 + 8);
      v45(v43, v17);
      uint64_t v46 = &v38[*(int *)(v53 + 48)];
      v42(v38, v37, v17);
      v42(v46, v55, v17);
      uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BC48);
      v42(&v44[*(int *)(v47 + 36)], v46, v17);
      return ((uint64_t (*)(char *, uint64_t))v45)(v38, v17);
  }
}

uint64_t EnergySite.EnergyUsage.containsDate(_:displayInterval:in:)(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v26 = a3;
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BC48);
  uint64_t v5 = MEMORY[0x270FA5388](v25);
  uint64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v25 - v8;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A610);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_24D218AC0();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v25 - v18;
  unsigned __int8 v20 = *a2;
  sub_24D1D9D68(a1, (uint64_t)v12, &qword_26B18A610);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
  {
    sub_24D1D9A80((uint64_t)v12, &qword_26B18A610);
    char v21 = 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v19, v12, v13);
    unsigned __int8 v27 = v20;
    sub_24D1CF66C(&v27, v26, v9);
    sub_24D1DA260((unint64_t *)&qword_26985BC50, MEMORY[0x263F07490]);
    char v22 = sub_24D2190C0();
    (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v17, v19, v13);
    sub_24D1D9D68((uint64_t)v9, (uint64_t)v7, &qword_26985BC48);
    if (v22) {
      char v21 = sub_24D2190B0();
    }
    else {
      char v21 = 0;
    }
    sub_24D1D9A80((uint64_t)v7, &qword_26985BC48);
    uint64_t v23 = *(void (**)(char *, uint64_t))(v14 + 8);
    v23(v17, v13);
    sub_24D1D9A80((uint64_t)v9, &qword_26985BC48);
    v23(v19, v13);
  }
  return v21 & 1;
}

uint64_t EnergySite.EnergyUsage.overlapsDateRange(_:displayInterval:in:)(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BC48);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = &v19[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BC58);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = &v19[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BC60);
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = &v19[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  unsigned __int8 v16 = *a2;
  sub_24D1D9D68(a1, (uint64_t)v11, &qword_26985BC58);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
    sub_24D1D9A80((uint64_t)v11, &qword_26985BC58);
    char v17 = 0;
  }
  else
  {
    sub_24D1DC0B8((uint64_t)v11, (uint64_t)v15, &qword_26985BC60);
    unsigned __int8 v20 = v16;
    sub_24D1CF66C(&v20, a3, v8);
    char v17 = sub_24D1D01DC((uint64_t)v15);
    sub_24D1D9A80((uint64_t)v8, &qword_26985BC48);
    sub_24D1D9A80((uint64_t)v15, &qword_26985BC60);
  }
  return v17 & 1;
}

uint64_t sub_24D1D01DC(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BC60);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BC48);
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v16 - v10;
  sub_24D218AC0();
  sub_24D1DA260((unint64_t *)&qword_26985BC50, MEMORY[0x263F07490]);
  char v12 = sub_24D2190B0();
  sub_24D1D9D68(v1, (uint64_t)v11, &qword_26985BC48);
  sub_24D1D9D68(a1, (uint64_t)v5, &qword_26985BC60);
  if (v12)
  {
    sub_24D1D9A80((uint64_t)v5, &qword_26985BC60);
    sub_24D1D9A80((uint64_t)v11, &qword_26985BC48);
    sub_24D1D9D68(v1, (uint64_t)v9, &qword_26985BC48);
    char v13 = 0;
  }
  else
  {
    char v14 = sub_24D2190C0();
    sub_24D1D9A80((uint64_t)v5, &qword_26985BC60);
    sub_24D1D9A80((uint64_t)v11, &qword_26985BC48);
    sub_24D1D9D68(v1, (uint64_t)v9, &qword_26985BC48);
    if (v14)
    {
      char v13 = 0;
    }
    else
    {
      sub_24D1DA260(&qword_26985BD90, MEMORY[0x263F07490]);
      char v13 = sub_24D2190D0() ^ 1;
    }
  }
  sub_24D1D9A80((uint64_t)v9, &qword_26985BC48);
  return v13 & 1;
}

uint64_t sub_24D1D0470(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_24D1D0480(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_24D1D04BC(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24D1D0598;
  return v6(a1);
}

uint64_t sub_24D1D0598()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24D1D0690(void (*a1)(void))
{
  a1();

  return _swift_stdlib_bridgeErrorToNSError();
}

uint64_t sub_24D1D06C8(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_24D1D06F0(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_24D1D0758(a1, a2, a3, a4, &qword_26985BE28, type metadata accessor for EnergySite.EnergyUsage, type metadata accessor for EnergySite.EnergyUsage);
}

uint64_t sub_24D1D0724(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_24D1D0758(a1, a2, a3, a4, &qword_26985BDB8, MEMORY[0x263F07490], MEMORY[0x263F07490]);
}

uint64_t sub_24D1D0758(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(void), uint64_t (*a7)(void))
{
  if (a3)
  {
    unint64_t v11 = *(void *)(a4 + 24);
    uint64_t v12 = v11 >> 1;
    if ((uint64_t)(v11 >> 1) < a2)
    {
      if (v12 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v11 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v12 = a2;
      }
    }
  }
  else
  {
    uint64_t v12 = a2;
  }
  uint64_t v13 = *(void *)(a4 + 16);
  if (v12 <= v13) {
    uint64_t v14 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v14 = v12;
  }
  if (!v14)
  {
    uint64_t v18 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v15 = *(void *)(a6(0) - 8);
  uint64_t v16 = *(void *)(v15 + 72);
  unint64_t v17 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  uint64_t v18 = (void *)swift_allocObject();
  size_t v19 = _swift_stdlib_malloc_size(v18);
  if (!v16 || (v19 - v17 == 0x8000000000000000 ? (BOOL v20 = v16 == -1) : (BOOL v20 = 0), v20))
  {
LABEL_29:
    uint64_t result = sub_24D219460();
    __break(1u);
    return result;
  }
  v18[2] = v13;
  v18[3] = 2 * ((uint64_t)(v19 - v17) / v16);
LABEL_19:
  uint64_t v21 = *(void *)(a6(0) - 8);
  unint64_t v22 = (*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  unint64_t v23 = (unint64_t)v18 + v22;
  if (a1)
  {
    if ((unint64_t)v18 < a4 || v23 >= a4 + v22 + *(void *)(v21 + 72) * v13)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v18 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_24D1D9C04(0, v13, v23, a4, a7);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v18;
}

uint64_t sub_24D1D09D8(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_24D1D0A00(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_24D1D0A78(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_24D219310();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_24D1D0A78(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_24D1D0B4C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_24D1D6414((uint64_t)v12, *a3);
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
      sub_24D1D6414((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_24D1D0B4C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_24D219320();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_24D1D0D08(a5, a6);
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
  uint64_t v8 = sub_24D2193F0();
  if (!v8)
  {
    sub_24D219460();
    __break(1u);
LABEL_17:
    uint64_t result = sub_24D2194A0();
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

uint64_t sub_24D1D0D08(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_24D1D0DA0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_24D1D0F80(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_24D1D0F80(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24D1D0DA0(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_24D1D0F18(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_24D2193E0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_24D219460();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_24D219140();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_24D2194A0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_24D219460();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_24D1D0F18(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5C8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24D1D0F80(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5C8);
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
  uint64_t result = sub_24D2194A0();
  __break(1u);
  return result;
}

unsigned char **sub_24D1D10D0(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

void *sub_24D1D10E0(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  if (__src) {
    uint64_t v5 = a2 - (void)__src;
  }
  else {
    uint64_t v5 = 0;
  }
  if (!__dst)
  {
    if (v5 <= 0) {
      return __src;
    }
LABEL_12:
    __src = (void *)sub_24D2194A0();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v5) {
    goto LABEL_12;
  }
  if (__src)
  {
    return memmove(__dst, __src, a2 - (void)__src);
  }
  return __src;
}

void sub_24D1D1184(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  unint64_t v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  sub_24D219310();
  *a1 = v7;
  int64_t v8 = *a2;
  if (*a2)
  {
    void *v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

uint64_t sub_24D1D123C@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

unint64_t sub_24D1D126C(uint64_t a1)
{
  uint64_t v2 = sub_24D219380();

  return sub_24D1D13FC(a1, v2);
}

unint64_t sub_24D1D12B0(uint64_t a1)
{
  uint64_t v2 = sub_24D219580();
  return sub_24D1D14C4(a1, v2);
}

unint64_t sub_24D1D12EC(uint64_t a1, uint64_t a2)
{
  sub_24D219590();
  sub_24D219120();
  uint64_t v4 = sub_24D2195B0();

  return sub_24D1D1560(a1, a2, v4);
}

unint64_t sub_24D1D1364(uint64_t a1)
{
  sub_24D218AC0();
  sub_24D1DA260(&qword_26985BD88, MEMORY[0x263F07490]);
  uint64_t v2 = sub_24D2190A0();

  return sub_24D1D1644(a1, v2);
}

unint64_t sub_24D1D13FC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_24D1D985C(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x253322330](v9, a1);
      sub_24D1D98B8((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_24D1D14C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(void *)(v7 + 8 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(void *)(v7 + 8 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

unint64_t sub_24D1D1560(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_24D2194E0() & 1) == 0)
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
      while (!v14 && (sub_24D2194E0() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_24D1D1644(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = sub_24D218AC0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = v2;
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v18 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    uint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    BOOL v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_24D1DA260(&qword_26985BD90, MEMORY[0x263F07490]);
      char v15 = sub_24D2190D0();
      (*(void (**)(char *, uint64_t))(v12 - 8))(v7, v4);
      if (v15) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v10;
    }
    while (((*(void *)(v18 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
  return v9;
}

uint64_t sub_24D1D1804(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  uint64_t v7 = sub_24D219580();
  uint64_t v8 = -1 << *(unsigned char *)(v6 + 32);
  unint64_t v9 = v7 & ~v8;
  if (((*(void *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
  {
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v14 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_24D1D38FC(a2, v9, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v14;
    swift_bridgeObjectRelease();
    uint64_t result = 1;
    goto LABEL_8;
  }
  uint64_t v10 = *(void *)(v6 + 48);
  if (*(void *)(v10 + 8 * v9) != a2)
  {
    uint64_t v11 = ~v8;
    do
    {
      unint64_t v9 = (v9 + 1) & v11;
      if (((*(void *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0) {
        goto LABEL_7;
      }
    }
    while (*(void *)(v10 + 8 * v9) != a2);
  }
  uint64_t result = 0;
LABEL_8:
  *a1 = a2;
  return result;
}

uint64_t sub_24D1D1900(uint64_t a1, char *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_24D218AC0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  unint64_t v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v2;
  sub_24D1DA260(&qword_26985BD88, MEMORY[0x263F07490]);
  swift_bridgeObjectRetain();
  uint64_t v33 = a2;
  uint64_t v11 = sub_24D2190A0();
  uint64_t v12 = -1 << *(unsigned char *)(v10 + 32);
  unint64_t v13 = v11 & ~v12;
  uint64_t v32 = v10 + 56;
  if ((*(void *)(v10 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
  {
    uint64_t v28 = v2;
    uint64_t v29 = a1;
    uint64_t v30 = ~v12;
    uint64_t v27 = v7;
    uint64_t v16 = *(void (**)(void, void, void))(v7 + 16);
    uint64_t v15 = v7 + 16;
    uint64_t v14 = v16;
    uint64_t v31 = *(void *)(v15 + 56);
    uint64_t v17 = (void (**)(char *, uint64_t))(v15 - 8);
    v26[1] = v15 & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    while (1)
    {
      uint64_t v18 = v10;
      unint64_t v19 = v31 * v13;
      uint64_t v20 = v14;
      v14(v9, *(void *)(v10 + 48) + v31 * v13, v6);
      sub_24D1DA260(&qword_26985BD90, MEMORY[0x263F07490]);
      char v21 = sub_24D2190D0();
      unint64_t v22 = *v17;
      (*v17)(v9, v6);
      if (v21) {
        break;
      }
      unint64_t v13 = (v13 + 1) & v30;
      uint64_t v10 = v18;
      uint64_t v14 = v20;
      if (((*(void *)(v32 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        uint64_t v3 = v28;
        a1 = v29;
        uint64_t v7 = v27;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v22(v33, v6);
    v20(v29, *(void *)(*v28 + 48) + v19, v6);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v14 = *(void (**)(void, void, void))(v7 + 16);
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v24 = v33;
    v14(v9, v33, v6);
    uint64_t v34 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_24D1D3A20((uint64_t)v9, v13, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v34;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(a1, v24, v6);
    return 1;
  }
}

uint64_t sub_24D1D1C24(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_24D219590();
  swift_bridgeObjectRetain();
  sub_24D219120();
  uint64_t v8 = sub_24D2195B0();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_24D2194E0() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
      uint64_t v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v17 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v17;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        break;
      }
      uint64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_24D2194E0() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_24D1D3CC0(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_24D1D1DD4(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985BE30);
  uint64_t result = sub_24D219480();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    char v35 = a2;
    uint64_t v34 = v3;
    int64_t v8 = 0;
    uint64_t v9 = (uint64_t *)(v5 + 64);
    uint64_t v10 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v32 = -1 << v10;
    uint64_t v33 = v10;
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    else {
      uint64_t v11 = -1;
    }
    unint64_t v12 = v11 & *(void *)(v5 + 64);
    int64_t v13 = (unint64_t)(v10 + 63) >> 6;
    uint64_t v14 = result + 64;
    while (1)
    {
      if (v12)
      {
        unint64_t v17 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v18 = v17 | (v8 << 6);
      }
      else
      {
        int64_t v19 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v19 >= v13) {
          goto LABEL_31;
        }
        unint64_t v20 = v9[v19];
        ++v8;
        if (!v20)
        {
          int64_t v8 = v19 + 1;
          if (v19 + 1 >= v13) {
            goto LABEL_31;
          }
          unint64_t v20 = v9[v8];
          if (!v20)
          {
            int64_t v21 = v19 + 2;
            if (v21 >= v13)
            {
LABEL_31:
              if ((v35 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v34;
                goto LABEL_38;
              }
              if (v33 >= 64) {
                bzero((void *)(v5 + 64), 8 * v13);
              }
              else {
                *uint64_t v9 = v32;
              }
              uint64_t v3 = v34;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v20 = v9[v21];
            if (!v20)
            {
              while (1)
              {
                int64_t v8 = v21 + 1;
                if (__OFADD__(v21, 1)) {
                  goto LABEL_40;
                }
                if (v8 >= v13) {
                  goto LABEL_31;
                }
                unint64_t v20 = v9[v8];
                ++v21;
                if (v20) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v8 = v21;
          }
        }
LABEL_21:
        unint64_t v12 = (v20 - 1) & v20;
        unint64_t v18 = __clz(__rbit64(v20)) + (v8 << 6);
      }
      uint64_t v22 = 8 * v18;
      uint64_t v23 = *(void *)(*(void *)(v5 + 48) + v22);
      uint64_t v24 = *(void *)(*(void *)(v5 + 56) + v22);
      uint64_t result = sub_24D219580();
      uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v26 = result & ~v25;
      unint64_t v27 = v26 >> 6;
      if (((-1 << v26) & ~*(void *)(v14 + 8 * (v26 >> 6))) != 0)
      {
        unint64_t v15 = __clz(__rbit64((-1 << v26) & ~*(void *)(v14 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v28 = 0;
        unint64_t v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          BOOL v30 = v27 == v29;
          if (v27 == v29) {
            unint64_t v27 = 0;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v14 + 8 * v27);
        }
        while (v31 == -1);
        unint64_t v15 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(void *)(v14 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      uint64_t v16 = 8 * v15;
      *(void *)(*(void *)(v7 + 48) + v16) = v23;
      *(void *)(*(void *)(v7 + 56) + v16) = v24;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_38:
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_24D1D2080(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v53 = sub_24D218CF0();
  uint64_t v5 = *(void *)(v53 - 8);
  MEMORY[0x270FA5388](v53);
  uint64_t v52 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_24D218AC0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985BDA0);
  int v50 = a2;
  uint64_t v12 = sub_24D219480();
  uint64_t v13 = v12;
  if (!*(void *)(v11 + 16)) {
    goto LABEL_41;
  }
  uint64_t v14 = 1 << *(unsigned char *)(v11 + 32);
  uint64_t v15 = *(void *)(v11 + 64);
  uint64_t v44 = (void *)(v11 + 64);
  if (v14 < 64) {
    uint64_t v16 = ~(-1 << v14);
  }
  else {
    uint64_t v16 = -1;
  }
  unint64_t v17 = v16 & v15;
  uint64_t v42 = v2;
  int64_t v43 = (unint64_t)(v14 + 63) >> 6;
  uint64_t v45 = v5 + 16;
  uint64_t v46 = (void (**)(char *, unint64_t, uint64_t))(v8 + 16);
  uint64_t v48 = v5;
  uint64_t v49 = v8;
  unint64_t v18 = (void (**)(char *, unint64_t, uint64_t))(v8 + 32);
  uint64_t v51 = (uint64_t (**)(unint64_t, char *, uint64_t))(v5 + 32);
  uint64_t v19 = v12 + 64;
  uint64_t result = swift_retain();
  int64_t v21 = 0;
  for (i = v11; ; uint64_t v11 = i)
  {
    if (v17)
    {
      unint64_t v23 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      unint64_t v24 = v23 | (v21 << 6);
      goto LABEL_22;
    }
    int64_t v25 = v21 + 1;
    if (__OFADD__(v21, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v25 >= v43) {
      break;
    }
    unint64_t v26 = v44;
    unint64_t v27 = v44[v25];
    ++v21;
    if (!v27)
    {
      int64_t v21 = v25 + 1;
      if (v25 + 1 >= v43) {
        goto LABEL_34;
      }
      unint64_t v27 = v44[v21];
      if (!v27)
      {
        int64_t v28 = v25 + 2;
        if (v28 >= v43)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v42;
          if ((v50 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v27 = v44[v28];
        if (!v27)
        {
          while (1)
          {
            int64_t v21 = v28 + 1;
            if (__OFADD__(v28, 1)) {
              goto LABEL_43;
            }
            if (v21 >= v43) {
              goto LABEL_34;
            }
            unint64_t v27 = v44[v21];
            ++v28;
            if (v27) {
              goto LABEL_21;
            }
          }
        }
        int64_t v21 = v28;
      }
    }
LABEL_21:
    unint64_t v17 = (v27 - 1) & v27;
    unint64_t v24 = __clz(__rbit64(v27)) + (v21 << 6);
LABEL_22:
    uint64_t v29 = *(void *)(v49 + 72);
    unint64_t v30 = *(void *)(v11 + 48) + v29 * v24;
    if (v50)
    {
      (*v18)(v10, v30, v7);
      uint64_t v31 = *(void *)(v11 + 56);
      uint64_t v32 = *(void *)(v48 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v48 + 32))(v52, v31 + v32 * v24, v53);
    }
    else
    {
      (*v46)(v10, v30, v7);
      uint64_t v33 = *(void *)(v11 + 56);
      uint64_t v32 = *(void *)(v48 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v48 + 16))(v52, v33 + v32 * v24, v53);
    }
    sub_24D1DA260(&qword_26985BD88, MEMORY[0x263F07490]);
    uint64_t result = sub_24D2190A0();
    uint64_t v34 = -1 << *(unsigned char *)(v13 + 32);
    unint64_t v35 = result & ~v34;
    unint64_t v36 = v35 >> 6;
    if (((-1 << v35) & ~*(void *)(v19 + 8 * (v35 >> 6))) != 0)
    {
      unint64_t v22 = __clz(__rbit64((-1 << v35) & ~*(void *)(v19 + 8 * (v35 >> 6)))) | v35 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v37 = 0;
      unint64_t v38 = (unint64_t)(63 - v34) >> 6;
      do
      {
        if (++v36 == v38 && (v37 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v39 = v36 == v38;
        if (v36 == v38) {
          unint64_t v36 = 0;
        }
        v37 |= v39;
        uint64_t v40 = *(void *)(v19 + 8 * v36);
      }
      while (v40 == -1);
      unint64_t v22 = __clz(__rbit64(~v40)) + (v36 << 6);
    }
    *(void *)(v19 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    (*v18)((char *)(*(void *)(v13 + 48) + v29 * v22), (unint64_t)v10, v7);
    uint64_t result = (*v51)(*(void *)(v13 + 56) + v32 * v22, v52, v53);
    ++*(void *)(v13 + 16);
  }
  swift_release();
  uint64_t v3 = v42;
  unint64_t v26 = v44;
  if ((v50 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v41 = 1 << *(unsigned char *)(v11 + 32);
  if (v41 >= 64) {
    bzero(v26, ((unint64_t)(v41 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v26 = -1 << v41;
  }
  *(void *)(v11 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v13;
  return result;
}

uint64_t sub_24D1D257C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985BDA8);
  uint64_t v6 = sub_24D219480();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v34 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v17 = v16 | (v13 << 6);
      }
      else
      {
        int64_t v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33) {
          goto LABEL_34;
        }
        unint64_t v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          int64_t v13 = v18 + 1;
          if (v18 + 1 >= v33) {
            goto LABEL_34;
          }
          unint64_t v19 = v34[v13];
          if (!v19)
          {
            int64_t v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v2;
              if (a2)
              {
                uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
                if (v32 >= 64) {
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v34 = -1 << v32;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                int64_t v13 = v20 + 1;
                if (__OFADD__(v20, 1)) {
                  goto LABEL_41;
                }
                if (v13 >= v33) {
                  goto LABEL_34;
                }
                unint64_t v19 = v34[v13];
                ++v20;
                if (v19) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v13 = v20;
          }
        }
LABEL_21:
        unint64_t v10 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      int64_t v21 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
      uint64_t v23 = *v21;
      uint64_t v22 = v21[1];
      unint64_t v24 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if (a2)
      {
        sub_24D1D97B4(v24, v35);
      }
      else
      {
        sub_24D1D6414((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_24D219590();
      sub_24D219120();
      uint64_t result = sub_24D2195B0();
      uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v26 = result & ~v25;
      unint64_t v27 = v26 >> 6;
      if (((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v28 = 0;
        unint64_t v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v30 = v27 == v29;
          if (v27 == v29) {
            unint64_t v27 = 0;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v11 + 8 * v27);
        }
        while (v31 == -1);
        unint64_t v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      uint64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
      *uint64_t v15 = v23;
      v15[1] = v22;
      uint64_t result = (uint64_t)sub_24D1D97B4(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

void *sub_24D1D287C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985BE30);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24D219470();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19) {
        break;
      }
    }
LABEL_25:
    unint64_t v21 = __clz(__rbit64(v19));
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = v21 + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = *(void *)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 56) + v16) = v17;
  }
  int64_t v20 = v18 + 2;
  if (v20 >= v13) {
    goto LABEL_26;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_24D1D2A0C()
{
  uint64_t v42 = sub_24D218CF0();
  uint64_t v45 = *(void *)(v42 - 8);
  MEMORY[0x270FA5388](v42);
  uint64_t v41 = (char *)&v32 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_24D218AC0();
  uint64_t v44 = *(void *)(v40 - 8);
  MEMORY[0x270FA5388](v40);
  BOOL v39 = (char *)&v32 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985BDA0);
  uint64_t v32 = v0;
  uint64_t v3 = *v0;
  uint64_t v4 = sub_24D219470();
  uint64_t v5 = *(void *)(v3 + 16);
  uint64_t v46 = v4;
  if (!v5)
  {
    uint64_t result = (void *)swift_release();
    uint64_t v31 = v46;
    BOOL v30 = v32;
LABEL_25:
    uint64_t *v30 = v31;
    return result;
  }
  uint64_t v6 = v4;
  uint64_t result = (void *)(v4 + 64);
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v6 + 32)) + 63) >> 6;
  if (v6 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8)
  {
    uint64_t result = memmove(result, (const void *)(v3 + 64), 8 * v8);
    uint64_t v6 = v46;
  }
  int64_t v9 = 0;
  *(void *)(v6 + 16) = *(void *)(v3 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v11 = -1;
  uint64_t v43 = v3;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v3 + 64);
  uint64_t v33 = v3 + 64;
  int64_t v34 = (unint64_t)(v10 + 63) >> 6;
  uint64_t v13 = v45;
  uint64_t v14 = v44;
  uint64_t v37 = v45 + 16;
  uint64_t v38 = v44 + 16;
  uint64_t v35 = v45 + 32;
  uint64_t v36 = v44 + 32;
  unint64_t v15 = v39;
  uint64_t v16 = v40;
  uint64_t v17 = v42;
  uint64_t v18 = v46;
  while (1)
  {
    if (v12)
    {
      unint64_t v19 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      int64_t v47 = v9;
      unint64_t v20 = v19 | (v9 << 6);
      uint64_t v21 = v43;
      goto LABEL_9;
    }
    int64_t v26 = v9 + 1;
    uint64_t v21 = v43;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v26 >= v34) {
      goto LABEL_23;
    }
    unint64_t v27 = *(void *)(v33 + 8 * v26);
    int64_t v28 = v9 + 1;
    if (!v27)
    {
      int64_t v28 = v26 + 1;
      if (v26 + 1 >= v34) {
        goto LABEL_23;
      }
      unint64_t v27 = *(void *)(v33 + 8 * v28);
      if (!v27) {
        break;
      }
    }
LABEL_22:
    unint64_t v12 = (v27 - 1) & v27;
    int64_t v47 = v28;
    unint64_t v20 = __clz(__rbit64(v27)) + (v28 << 6);
LABEL_9:
    unint64_t v22 = *(void *)(v14 + 72) * v20;
    (*(void (**)(char *, unint64_t, uint64_t))(v14 + 16))(v15, *(void *)(v21 + 48) + v22, v16);
    unint64_t v23 = *(void *)(v13 + 72) * v20;
    unint64_t v24 = *(void *)(v21 + 56) + v23;
    uint64_t v25 = v41;
    (*(void (**)(char *, unint64_t, uint64_t))(v13 + 16))(v41, v24, v17);
    (*(void (**)(unint64_t, char *, uint64_t))(v14 + 32))(*(void *)(v18 + 48) + v22, v15, v16);
    uint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v13 + 32))(*(void *)(v18 + 56) + v23, v25, v17);
    int64_t v9 = v47;
  }
  int64_t v29 = v26 + 2;
  if (v29 >= v34)
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    BOOL v30 = v32;
    uint64_t v31 = v46;
    goto LABEL_25;
  }
  unint64_t v27 = *(void *)(v33 + 8 * v29);
  if (v27)
  {
    int64_t v28 = v29;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v28 = v29 + 1;
    if (__OFADD__(v29, 1)) {
      break;
    }
    if (v28 >= v34) {
      goto LABEL_23;
    }
    unint64_t v27 = *(void *)(v33 + 8 * v28);
    ++v29;
    if (v27) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

void *sub_24D1D2DB4()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985BDA8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24D219470();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v25 = v1;
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 32 * v15;
    sub_24D1D6414(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v21 = v19;
    v21[1] = v18;
    sub_24D1D97B4(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v25;
    goto LABEL_28;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_24D1D2F9C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985BE38);
  uint64_t result = sub_24D2193C0();
  uint64_t v4 = result;
  if (*(void *)(v2 + 16))
  {
    int64_t v5 = 0;
    uint64_t v6 = (uint64_t *)(v2 + 56);
    uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v26 = -1 << v7;
    unint64_t v27 = v1;
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v9 = v8 & *(void *)(v2 + 56);
    uint64_t v28 = 1 << *(unsigned char *)(v2 + 32);
    int64_t v10 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v11 = result + 56;
    while (1)
    {
      if (v9)
      {
        unint64_t v13 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        unint64_t v14 = v13 | (v5 << 6);
      }
      else
      {
        int64_t v15 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v10) {
          goto LABEL_33;
        }
        unint64_t v16 = v6[v15];
        ++v5;
        if (!v16)
        {
          int64_t v5 = v15 + 1;
          if (v15 + 1 >= v10) {
            goto LABEL_33;
          }
          unint64_t v16 = v6[v5];
          if (!v16)
          {
            int64_t v5 = v15 + 2;
            if (v15 + 2 >= v10) {
              goto LABEL_33;
            }
            unint64_t v16 = v6[v5];
            if (!v16)
            {
              int64_t v17 = v15 + 3;
              if (v17 >= v10)
              {
LABEL_33:
                if (v28 >= 64) {
                  bzero((void *)(v2 + 56), 8 * v10);
                }
                else {
                  *uint64_t v6 = v26;
                }
                uint64_t v1 = v27;
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v16 = v6[v17];
              if (!v16)
              {
                while (1)
                {
                  int64_t v5 = v17 + 1;
                  if (__OFADD__(v17, 1)) {
                    goto LABEL_39;
                  }
                  if (v5 >= v10) {
                    goto LABEL_33;
                  }
                  unint64_t v16 = v6[v5];
                  ++v17;
                  if (v16) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v5 = v17;
            }
          }
        }
LABEL_23:
        unint64_t v9 = (v16 - 1) & v16;
        unint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
      }
      uint64_t v18 = *(void *)(*(void *)(v2 + 48) + 8 * v14);
      uint64_t result = sub_24D219580();
      uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v20 = result & ~v19;
      unint64_t v21 = v20 >> 6;
      if (((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v22 = 0;
        unint64_t v23 = (unint64_t)(63 - v19) >> 6;
        do
        {
          if (++v21 == v23 && (v22 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v24 = v21 == v23;
          if (v21 == v23) {
            unint64_t v21 = 0;
          }
          v22 |= v24;
          uint64_t v25 = *(void *)(v11 + 8 * v21);
        }
        while (v25 == -1);
        unint64_t v12 = __clz(__rbit64(~v25)) + (v21 << 6);
      }
      *(void *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      *(void *)(*(void *)(v4 + 48) + 8 * v12) = v18;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_24D1D3220()
{
  uint64_t v1 = v0;
  uint64_t v42 = sub_24D218AC0();
  uint64_t v2 = *(void *)(v42 - 8);
  MEMORY[0x270FA5388](v42);
  uint64_t v41 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985BD98);
  uint64_t v5 = sub_24D2193C0();
  uint64_t v6 = v5;
  if (*(void *)(v4 + 16))
  {
    uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
    uint64_t v8 = *(void *)(v4 + 56);
    uint64_t v37 = (void *)(v4 + 56);
    if (v7 < 64) {
      uint64_t v9 = ~(-1 << v7);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & v8;
    uint64_t v35 = v0;
    int64_t v36 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v39 = v2;
    uint64_t v11 = v5 + 56;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    uint64_t v38 = v6;
    unint64_t v14 = v41;
    uint64_t v15 = v42;
    while (1)
    {
      if (v10)
      {
        unint64_t v17 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        int64_t v40 = v13;
        unint64_t v18 = v17 | (v13 << 6);
      }
      else
      {
        int64_t v19 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v19 >= v36) {
          goto LABEL_33;
        }
        unint64_t v20 = v37[v19];
        int64_t v21 = v13 + 1;
        if (!v20)
        {
          int64_t v21 = v13 + 2;
          if (v13 + 2 >= v36) {
            goto LABEL_33;
          }
          unint64_t v20 = v37[v21];
          if (!v20)
          {
            int64_t v21 = v13 + 3;
            if (v13 + 3 >= v36) {
              goto LABEL_33;
            }
            unint64_t v20 = v37[v21];
            if (!v20)
            {
              uint64_t v22 = v13 + 4;
              if (v13 + 4 >= v36)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v35;
                uint64_t v34 = 1 << *(unsigned char *)(v4 + 32);
                if (v34 > 63) {
                  bzero(v37, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v37 = -1 << v34;
                }
                *(void *)(v4 + 16) = 0;
                break;
              }
              unint64_t v20 = v37[v22];
              if (!v20)
              {
                while (1)
                {
                  int64_t v21 = v22 + 1;
                  if (__OFADD__(v22, 1)) {
                    goto LABEL_39;
                  }
                  if (v21 >= v36) {
                    goto LABEL_33;
                  }
                  unint64_t v20 = v37[v21];
                  ++v22;
                  if (v20) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v21 = v13 + 4;
            }
          }
        }
LABEL_23:
        unint64_t v10 = (v20 - 1) & v20;
        int64_t v40 = v21;
        unint64_t v18 = __clz(__rbit64(v20)) + (v21 << 6);
      }
      uint64_t v23 = v4;
      uint64_t v24 = *(void *)(v4 + 48);
      uint64_t v25 = *(void *)(v39 + 72);
      uint64_t v26 = *(void (**)(char *, unint64_t, uint64_t))(v39 + 32);
      v26(v14, v24 + v25 * v18, v15);
      uint64_t v6 = v38;
      sub_24D1DA260(&qword_26985BD88, MEMORY[0x263F07490]);
      uint64_t result = sub_24D2190A0();
      uint64_t v27 = -1 << *(unsigned char *)(v6 + 32);
      unint64_t v28 = result & ~v27;
      unint64_t v29 = v28 >> 6;
      if (((-1 << v28) & ~*(void *)(v11 + 8 * (v28 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v28) & ~*(void *)(v11 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v30 = 0;
        unint64_t v31 = (unint64_t)(63 - v27) >> 6;
        do
        {
          if (++v29 == v31 && (v30 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v32 = v29 == v31;
          if (v29 == v31) {
            unint64_t v29 = 0;
          }
          v30 |= v32;
          uint64_t v33 = *(void *)(v11 + 8 * v29);
        }
        while (v33 == -1);
        unint64_t v16 = __clz(__rbit64(~v33)) + (v29 << 6);
      }
      *(void *)(v11 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v26)(*(void *)(v6 + 48) + v16 * v25, v41, v42);
      ++*(void *)(v6 + 16);
      uint64_t v4 = v23;
      int64_t v13 = v40;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v6;
  return result;
}

uint64_t sub_24D1D361C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985BD60);
  uint64_t v3 = sub_24D2193C0();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    char v30 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v11 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v15 = v14 | (v11 << 6);
      }
      else
      {
        int64_t v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8) {
          goto LABEL_33;
        }
        unint64_t v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          int64_t v11 = v16 + 1;
          if (v16 + 1 >= v8) {
            goto LABEL_33;
          }
          unint64_t v17 = v30[v11];
          if (!v17)
          {
            int64_t v11 = v16 + 2;
            if (v16 + 2 >= v8) {
              goto LABEL_33;
            }
            unint64_t v17 = v30[v11];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v30 = -1 << v29;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v11 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v11 >= v8) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v30[v11];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      int64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_24D219590();
      sub_24D219120();
      uint64_t result = sub_24D2195B0();
      uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *int64_t v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_24D1D38FC(uint64_t result, unint64_t a2, char a3)
{
  uint64_t v5 = result;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_24D1D2F9C();
  }
  else
  {
    if (v7 > v6)
    {
      uint64_t result = (uint64_t)sub_24D1D3E5C();
      goto LABEL_14;
    }
    sub_24D1D444C();
  }
  uint64_t v8 = *v3;
  uint64_t result = sub_24D219580();
  uint64_t v9 = -1 << *(unsigned char *)(v8 + 32);
  a2 = result & ~v9;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v10 = *(void *)(v8 + 48);
    if (*(void *)(v10 + 8 * a2) == v5)
    {
LABEL_13:
      uint64_t result = sub_24D219510();
      __break(1u);
    }
    else
    {
      uint64_t v11 = ~v9;
      while (1)
      {
        a2 = (a2 + 1) & v11;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        if (*(void *)(v10 + 8 * a2) == v5) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v12 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v12 + 48) + 8 * a2) = v5;
  uint64_t v13 = *(void *)(v12 + 16);
  BOOL v14 = __OFADD__(v13, 1);
  uint64_t v15 = v13 + 1;
  if (v14) {
    __break(1u);
  }
  else {
    *(void *)(v12 + 16) = v15;
  }
  return result;
}

uint64_t sub_24D1D3A20(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v31 = a1;
  uint64_t v6 = sub_24D218AC0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v10 = *(void *)(*v3 + 16);
  unint64_t v11 = *(void *)(*v3 + 24);
  uint64_t v28 = v3;
  uint64_t v29 = v7;
  if (v11 > v10 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if (a3)
  {
    sub_24D1D3220();
  }
  else
  {
    if (v11 > v10)
    {
      sub_24D1D3FF4();
      goto LABEL_12;
    }
    sub_24D1D46B0();
  }
  uint64_t v12 = *v3;
  sub_24D1DA260(&qword_26985BD88, MEMORY[0x263F07490]);
  uint64_t v13 = sub_24D2190A0();
  uint64_t v14 = -1 << *(unsigned char *)(v12 + 32);
  a2 = v13 & ~v14;
  uint64_t v30 = v12;
  uint64_t v15 = v12 + 56;
  if ((*(void *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v16 = ~v14;
    int64_t v19 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    uint64_t v18 = v7 + 16;
    unint64_t v17 = v19;
    uint64_t v20 = *(void *)(v18 + 56);
    do
    {
      v17(v9, *(void *)(v30 + 48) + v20 * a2, v6);
      sub_24D1DA260(&qword_26985BD90, MEMORY[0x263F07490]);
      char v21 = sub_24D2190D0();
      (*(void (**)(char *, uint64_t))(v18 - 8))(v9, v6);
      if (v21) {
        goto LABEL_15;
      }
      a2 = (a2 + 1) & v16;
    }
    while (((*(void *)(v15 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  uint64_t v22 = v29;
  uint64_t v23 = *v28;
  *(void *)(v23 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v22 + 32))(*(void *)(v23 + 48) + *(void *)(v22 + 72) * a2, v31, v6);
  uint64_t v25 = *(void *)(v23 + 16);
  BOOL v26 = __OFADD__(v25, 1);
  uint64_t v27 = v25 + 1;
  if (!v26)
  {
    *(void *)(v23 + 16) = v27;
    return result;
  }
  __break(1u);
LABEL_15:
  uint64_t result = sub_24D219510();
  __break(1u);
  return result;
}

uint64_t sub_24D1D3CC0(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_24D1D361C();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_24D1D4298();
      goto LABEL_22;
    }
    sub_24D1D4A60();
  }
  uint64_t v11 = *v4;
  sub_24D219590();
  sub_24D219120();
  uint64_t result = sub_24D2195B0();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    uint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_24D2194E0(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_24D219510();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) == 0) {
          break;
        }
        uint64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_24D2194E0();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  char v21 = (uint64_t *)(*(void *)(v20 + 48) + 16 * a3);
  *char v21 = v8;
  v21[1] = a2;
  uint64_t v22 = *(void *)(v20 + 16);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v24;
  }
  return result;
}

void *sub_24D1D3E5C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985BE38);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24D2193B0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(void *)(*(void *)(v4 + 48) + 8 * v15) = *(void *)(*(void *)(v2 + 48) + 8 * v15);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_24D1D3FF4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24D218AC0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985BD98);
  uint64_t v6 = *v0;
  uint64_t v7 = sub_24D2193B0();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_27:
    *uint64_t v1 = v8;
    return result;
  }
  uint64_t v22 = v1;
  uint64_t result = (void *)(v7 + 56);
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v10) {
    uint64_t result = memmove(result, (const void *)(v6 + 56), 8 * v10);
  }
  uint64_t v23 = v6 + 56;
  int64_t v11 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v6 + 56);
  int64_t v24 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      unint64_t v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v16 = v15 | (v11 << 6);
      goto LABEL_9;
    }
    int64_t v18 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v18 >= v24) {
      goto LABEL_25;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v18);
    ++v11;
    if (!v19)
    {
      int64_t v11 = v18 + 1;
      if (v18 + 1 >= v24) {
        goto LABEL_25;
      }
      unint64_t v19 = *(void *)(v23 + 8 * v11);
      if (!v19)
      {
        int64_t v11 = v18 + 2;
        if (v18 + 2 >= v24) {
          goto LABEL_25;
        }
        unint64_t v19 = *(void *)(v23 + 8 * v11);
        if (!v19) {
          break;
        }
      }
    }
LABEL_24:
    unint64_t v14 = (v19 - 1) & v19;
    unint64_t v16 = __clz(__rbit64(v19)) + (v11 << 6);
LABEL_9:
    unint64_t v17 = *(void *)(v3 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(void *)(v6 + 48) + v17, v2);
    uint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(void *)(v8 + 48) + v17, v5, v2);
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v24)
  {
LABEL_25:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v22;
    goto LABEL_27;
  }
  unint64_t v19 = *(void *)(v23 + 8 * v20);
  if (v19)
  {
    int64_t v11 = v20;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v11 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v11 >= v24) {
      goto LABEL_25;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v11);
    ++v20;
    if (v19) {
      goto LABEL_24;
    }
  }
LABEL_29:
  __break(1u);
  return result;
}

void *sub_24D1D4298()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985BD60);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24D2193B0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    unint64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_24D1D444C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985BE38);
  uint64_t result = sub_24D2193C0();
  uint64_t v4 = result;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  BOOL v26 = v1;
  int64_t v5 = 0;
  uint64_t v6 = v2 + 56;
  uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(v2 + 56);
  int64_t v10 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      unint64_t v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v14 = v13 | (v5 << 6);
      goto LABEL_24;
    }
    int64_t v15 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v10) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v15);
    ++v5;
    if (!v16)
    {
      int64_t v5 = v15 + 1;
      if (v15 + 1 >= v10) {
        goto LABEL_33;
      }
      unint64_t v16 = *(void *)(v6 + 8 * v5);
      if (!v16)
      {
        int64_t v5 = v15 + 2;
        if (v15 + 2 >= v10) {
          goto LABEL_33;
        }
        unint64_t v16 = *(void *)(v6 + 8 * v5);
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v9 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
LABEL_24:
    uint64_t v18 = *(void *)(*(void *)(v2 + 48) + 8 * v14);
    uint64_t result = sub_24D219580();
    uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v24 = v21 == v23;
        if (v21 == v23) {
          unint64_t v21 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)(v11 + 8 * v21);
      }
      while (v25 == -1);
      unint64_t v12 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(void *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    *(void *)(*(void *)(v4 + 48) + 8 * v12) = v18;
    ++*(void *)(v4 + 16);
  }
  int64_t v17 = v15 + 3;
  if (v17 >= v10)
  {
LABEL_33:
    uint64_t result = swift_release();
    uint64_t v1 = v26;
    goto LABEL_35;
  }
  unint64_t v16 = *(void *)(v6 + 8 * v17);
  if (v16)
  {
    int64_t v5 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v5 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v5 >= v10) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v5);
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_24D1D46B0()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24D218AC0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  int64_t v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985BD98);
  uint64_t v7 = sub_24D2193C0();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v8;
    return result;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v10 = *(void *)(v6 + 56);
  uint64_t v34 = v0;
  uint64_t v35 = v6 + 56;
  if (v9 < 64) {
    uint64_t v11 = ~(-1 << v9);
  }
  else {
    uint64_t v11 = -1;
  }
  unint64_t v12 = v11 & v10;
  int64_t v36 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v37 = v3 + 16;
  uint64_t v13 = v7 + 56;
  uint64_t v38 = v3;
  unint64_t v14 = (uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32);
  uint64_t result = swift_retain();
  int64_t v16 = 0;
  while (1)
  {
    if (v12)
    {
      unint64_t v18 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v19 = v18 | (v16 << 6);
      goto LABEL_24;
    }
    int64_t v20 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v20 >= v36) {
      goto LABEL_33;
    }
    unint64_t v21 = *(void *)(v35 + 8 * v20);
    ++v16;
    if (!v21)
    {
      int64_t v16 = v20 + 1;
      if (v20 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v21 = *(void *)(v35 + 8 * v16);
      if (!v21)
      {
        int64_t v16 = v20 + 2;
        if (v20 + 2 >= v36) {
          goto LABEL_33;
        }
        unint64_t v21 = *(void *)(v35 + 8 * v16);
        if (!v21) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v19 = __clz(__rbit64(v21)) + (v16 << 6);
LABEL_24:
    uint64_t v23 = v6;
    uint64_t v24 = *(void *)(v6 + 48);
    uint64_t v25 = *(void *)(v38 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v38 + 16))(v5, v24 + v25 * v19, v2);
    sub_24D1DA260(&qword_26985BD88, MEMORY[0x263F07490]);
    uint64_t result = sub_24D2190A0();
    uint64_t v26 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v27 = result & ~v26;
    unint64_t v28 = v27 >> 6;
    if (((-1 << v27) & ~*(void *)(v13 + 8 * (v27 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v27) & ~*(void *)(v13 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v29 = 0;
      unint64_t v30 = (unint64_t)(63 - v26) >> 6;
      do
      {
        if (++v28 == v30 && (v29 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v31 = v28 == v30;
        if (v28 == v30) {
          unint64_t v28 = 0;
        }
        v29 |= v31;
        uint64_t v32 = *(void *)(v13 + 8 * v28);
      }
      while (v32 == -1);
      unint64_t v17 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t result = (*v14)(*(void *)(v8 + 48) + v17 * v25, v5, v2);
    ++*(void *)(v8 + 16);
    uint64_t v6 = v23;
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v36)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v34;
    goto LABEL_35;
  }
  unint64_t v21 = *(void *)(v35 + 8 * v22);
  if (v21)
  {
    int64_t v16 = v22;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v16 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v16 >= v36) {
      goto LABEL_33;
    }
    unint64_t v21 = *(void *)(v35 + 8 * v16);
    ++v22;
    if (v21) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_24D1D4A60()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985BD60);
  uint64_t v3 = sub_24D2193C0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v11 = v16 + 2;
        if (v16 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v11);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    unint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_24D219590();
    swift_bridgeObjectRetain();
    sub_24D219120();
    uint64_t result = sub_24D2195B0();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    uint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *uint64_t v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

void *sub_24D1D4D10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v42[7] = a3;
  v42[8] = a4;
  uint64_t v46 = a1;
  uint64_t v47 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A610);
  uint64_t v4 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v45 = (char *)v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v44 = (char *)v42 - v7;
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v43 = (char *)v42 - v9;
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  unint64_t v12 = (char *)v42 - v11;
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  unint64_t v15 = (char *)v42 - v14;
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  int64_t v18 = (char *)v42 - v17;
  uint64_t v19 = MEMORY[0x270FA5388](v16);
  uint64_t v21 = (char *)v42 - v20;
  v42[1] = (char *)v42 - v20;
  uint64_t v22 = MEMORY[0x270FA5388](v19);
  unint64_t v24 = (char *)v42 - v23;
  v42[2] = (char *)v42 - v23;
  MEMORY[0x270FA5388](v22);
  unint64_t v26 = (char *)v42 - v25;
  v42[3] = (char *)v42 - v25;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A618);
  MEMORY[0x270FA5388](v27 - 8);
  int64_t v29 = (char *)v42 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42[4] = v29;
  unint64_t v30 = (objc_class *)sub_24D218ED0();
  uint64_t v31 = sub_24D218DF0();
  v42[5] = v32;
  v42[6] = v31;
  uint64_t v33 = sub_24D218C20();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v29, 1, 1, v33);
  uint64_t v34 = sub_24D218AC0();
  uint64_t v35 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56);
  v35(v26, 1, 1, v34);
  v35(v24, 1, 1, v34);
  v35(v21, 1, 1, v34);
  v35(v18, 1, 1, v34);
  v35(v15, 1, 1, v34);
  v35(v12, 1, 1, v34);
  v35(v43, 1, 1, v34);
  v35(v44, 1, 1, v34);
  v35(v45, 1, 1, v34);
  id v36 = objc_allocWithZone(v30);
  uint64_t v37 = (void *)sub_24D218E50();
  type metadata accessor for EnergySite();
  uint64_t v38 = (void *)swift_allocObject();
  v38[3] = objc_msgSend(self, sel_defaultCenter);
  v38[4] = 0;
  v38[5] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08A48]), sel_init);
  v38[7] = 0;
  swift_unknownObjectWeakInit();
  v38[2] = v37;
  uint64_t v39 = (void *)v38[5];
  id v40 = v37;
  objc_msgSend(v39, sel_setMaxConcurrentOperationCount_, 1);
  sub_24D1C2358();

  return v38;
}

uint64_t sub_24D1D51D4(uint64_t a1, uint64_t a2)
{
  v2[6] = a1;
  v2[7] = a2;
  uint64_t v3 = sub_24D219020();
  v2[8] = v3;
  v2[9] = *(void *)(v3 - 8);
  v2[10] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D1D5294, 0, 0);
}

uint64_t sub_24D1D5294()
{
  uint64_t v2 = v0[6];
  unint64_t v1 = v0[7];
  uint64_t v3 = HIBYTE(v1) & 0xF;
  if ((v1 & 0x2000000000000000) == 0) {
    uint64_t v3 = v2 & 0xFFFFFFFFFFFFLL;
  }
  if (v3)
  {
    uint64_t v4 = swift_task_alloc();
    v0[11] = v4;
    *(void *)(v4 + 16) = v2;
    *(void *)(v4 + 24) = v1;
    uint64_t v5 = (void *)swift_task_alloc();
    v0[12] = v5;
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(qword_26B18A620);
    *uint64_t v5 = v0;
    v5[1] = sub_24D1D5538;
    return MEMORY[0x270FA2360](v0 + 5, 0, 0, 0x7328657469736B65, 0xEF293A4449657469, sub_24D1DA2A8, v4, v6);
  }
  else
  {
    if (qword_26B18A2F8 != -1) {
      swift_once();
    }
    uint64_t v8 = v0[9];
    uint64_t v7 = v0[10];
    uint64_t v9 = v0[8];
    uint64_t v10 = __swift_project_value_buffer(v9, (uint64_t)qword_26B18A8F0);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v7, v10, v9);
    uint64_t v11 = sub_24D219000();
    os_log_type_t v12 = sub_24D2192D0();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_24D1B6000, v11, v12, "Failed to get site. Site ID is empty.", v13, 2u);
      MEMORY[0x253322AA0](v13, -1, -1);
    }
    uint64_t v15 = v0[9];
    uint64_t v14 = v0[10];
    uint64_t v16 = v0[8];

    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
    sub_24D1D5A68();
    swift_allocError();
    *uint64_t v17 = 28;
    swift_willThrow();
    swift_task_dealloc();
    int64_t v18 = (uint64_t (*)(void))v0[1];
    return v18();
  }
}

uint64_t sub_24D1D5538()
{
  *(void *)(*(void *)v1 + 104) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_24D1BC608;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_24D1D5654;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D1D5654()
{
  uint64_t v1 = *(void *)(v0 + 40);
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_24D1D56C0(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return MEMORY[0x270FA2498](sub_24D1D56E0, 0, 0);
}

uint64_t sub_24D1D56E0()
{
  unint64_t v1 = v0[3];
  uint64_t v2 = v0[2] & 0xFFFFFFFFFFFFLL;
  if ((v1 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(v1) & 0xF;
  }
  if (v2)
  {
    uint64_t v3 = (void *)swift_task_alloc();
    v0[4] = v3;
    *uint64_t v3 = v0;
    v3[1] = sub_24D1D57C4;
    uint64_t v5 = v0[2];
    uint64_t v4 = v0[3];
    return sub_24D1D51D4(v5, v4);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v7 = (uint64_t (*)(void))v0[1];
    return v7(0);
  }
}

uint64_t sub_24D1D57C4(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 40) = a1;
  *(void *)(v3 + 48) = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v1) {
    uint64_t v4 = sub_24D1D59FC;
  }
  else {
    uint64_t v4 = sub_24D1D58F8;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_24D1D58F8()
{
  uint64_t v1 = *(void **)(v0 + 40);
  if (v1)
  {
    type metadata accessor for EnergySite();
    uint64_t v2 = (void *)swift_allocObject();
    v2[3] = objc_msgSend(self, sel_defaultCenter);
    v2[4] = 0;
    v2[5] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08A48]), sel_init);
    v2[7] = 0;
    swift_unknownObjectWeakInit();
    v2[2] = v1;
    uint64_t v3 = (void *)v2[5];
    id v4 = v1;
    objc_msgSend(v3, sel_setMaxConcurrentOperationCount_, 1);
    sub_24D1C2358();
  }
  else
  {
    uint64_t v2 = 0;
  }
  uint64_t v5 = *(uint64_t (**)(void *))(v0 + 8);
  return v5(v2);
}

uint64_t sub_24D1D59FC()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1(0);
}

uint64_t sub_24D1D5A60(uint64_t a1)
{
  return sub_24D1B9DEC(a1, *(void *)(v1 + 16), *(void **)(v1 + 24));
}

unint64_t sub_24D1D5A68()
{
  unint64_t result = qword_26985BB20;
  if (!qword_26985BB20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26985BB20);
  }
  return result;
}

uint64_t sub_24D1D5ABC(uint64_t a1)
{
  return sub_24D1BB958(a1, v1[2], v1[3], v1[4], (uint64_t)&unk_26FF7B0E0, (uint64_t)&unk_26985BEE0);
}

uint64_t sub_24D1D5AF8(uint64_t a1)
{
  return sub_24D1BB958(a1, v1[2], v1[3], v1[4], (uint64_t)&unk_26FF7B090, (uint64_t)&unk_26985BED0);
}

uint64_t sub_24D1D5B34(uint64_t a1)
{
  return sub_24D1BC674(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_24D1D5B3C(uint64_t a1)
{
  return sub_24D1BD488(a1, v1[2], v1[3], v1[4], v1[5], v1[6], v1[7], v1[8], v1[9], v1[10], v1[11], v1[12], v1[13], v1[14], v1[15], v1[16], v1[17], v1[18], v1[19],
           v1[20],
           v1[21],
           v1[22],
           v1[23]);
}

uint64_t sub_24D1D5BA0(uint64_t a1)
{
  return sub_24D1BE7FC(a1, v1[2], v1[3], v1[4], v1[5], v1[6], v1[7], v1[8], v1[9], v1[10]);
}

uint64_t sub_24D1D5BD8(uint64_t a1)
{
  return sub_24D1BF6C0(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56), *(void *)(v1 + 64), *(void *)(v1 + 72), *(void *)(v1 + 80), *(void *)(v1 + 88), *(void *)(v1 + 96), *(void *)(v1 + 104));
}

uint64_t sub_24D1D5C1C(uint64_t a1)
{
  return sub_24D1C070C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56), *(void *)(v1 + 64), *(void *)(v1 + 72), *(void *)(v1 + 80), *(void *)(v1 + 88), *(void *)(v1 + 96), *(void *)(v1 + 104), *(void *)(v1 + 112), *(void *)(v1 + 120));
}

uint64_t sub_24D1D5C68(uint64_t a1)
{
  return sub_24D1C9958(a1, v1, &qword_26985BE50, (uint64_t)&unk_26FF7AEB0, (uint64_t)&unk_26985BE70);
}

uint64_t sub_24D1D5CA8(uint64_t a1)
{
  return sub_24D1C9958(a1, v1, &qword_26985BE50, (uint64_t)&unk_26FF7AE60, (uint64_t)&unk_26985BE60);
}

uint64_t sub_24D1D5CE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[8] = a3;
  v4[9] = a4;
  v4[6] = a1;
  v4[7] = a2;
  uint64_t v5 = sub_24D219020();
  v4[10] = v5;
  v4[11] = *(void *)(v5 - 8);
  v4[12] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D1D5DAC, 0, 0);
}

uint64_t sub_24D1D5DAC()
{
  uint64_t v1 = v0[8];
  uint64_t v2 = v0[9];
  uint64_t v4 = v0[6];
  uint64_t v3 = v0[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v0[13] = sub_24D1D4D10(v4, v3, v1, v2);
  uint64_t v5 = (void *)swift_task_alloc();
  v0[14] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_24D1D5E74;
  return sub_24D1C30D8();
}

uint64_t sub_24D1D5E74()
{
  uint64_t v2 = (void *)*v1;
  v2[15] = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_24D1D5FB4, 0, 0);
  }
  else
  {
    uint64_t v3 = v2[13];
    swift_task_dealloc();
    uint64_t v4 = (uint64_t (*)(uint64_t))v2[1];
    return v4(v3);
  }
}

uint64_t sub_24D1D5FB4()
{
  uint64_t v21 = v0;
  if (qword_26B18A2F8 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[11];
  uint64_t v1 = v0[12];
  uint64_t v3 = v0[10];
  uint64_t v4 = __swift_project_value_buffer(v3, (uint64_t)qword_26B18A8F0);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  swift_bridgeObjectRetain_n();
  uint64_t v5 = sub_24D219000();
  os_log_type_t v6 = sub_24D2192D0();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = (void *)v0[15];
  uint64_t v9 = v0[12];
  uint64_t v11 = v0[10];
  uint64_t v10 = v0[11];
  unint64_t v12 = v0[7];
  if (v7)
  {
    uint64_t v19 = v0[12];
    uint64_t v17 = v0[6];
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v18 = v11;
    uint64_t v14 = swift_slowAlloc();
    uint64_t v20 = v14;
    *(_DWORD *)uint64_t v13 = 136315138;
    swift_bridgeObjectRetain();
    v0[5] = sub_24D1D0A78(v17, v12, &v20);
    sub_24D219310();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24D1B6000, v5, v6, "Failed to register EnergySite(%s)", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253322AA0](v14, -1, -1);
    MEMORY[0x253322AA0](v13, -1, -1);

    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v19, v18);
  }
  else
  {
    swift_bridgeObjectRelease_n();

    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
  }
  swift_task_dealloc();
  uint64_t v15 = (uint64_t (*)(void))v0[1];
  return v15(0);
}

uint64_t sub_24D1D6244(uint64_t a1)
{
  return sub_24D1C9958(a1, v1, &qword_26B18A808, (uint64_t)&unk_26FF7AE10, (uint64_t)&unk_26985BE48);
}

uint64_t type metadata accessor for EnergySite.EnergyUsage(uint64_t a1)
{
  return sub_24D1D6490(a1, (uint64_t *)&unk_26985BD40);
}

unint64_t sub_24D1D62A4(uint64_t a1)
{
  return sub_24D1D62D4(a1, (uint64_t (*)(uint64_t))sub_24D1DCDE0);
}

unint64_t sub_24D1D62BC(uint64_t a1)
{
  return sub_24D1D62D4(a1, (uint64_t (*)(uint64_t))sub_24D1D12B0);
}

unint64_t sub_24D1D62D4(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26985BE30);
    uint64_t v5 = (void *)sub_24D219490();
    for (uint64_t i = (uint64_t *)(a1 + 40); ; i += 2)
    {
      uint64_t v7 = *(i - 1);
      uint64_t v8 = *i;
      unint64_t result = a2(v7);
      if (v10) {
        break;
      }
      *(void *)((char *)v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      uint64_t v11 = 8 * result;
      *(void *)(v5[6] + v11) = v7;
      *(void *)(v5[7] + v11) = v8;
      uint64_t v12 = v5[2];
      BOOL v13 = __OFADD__(v12, 1);
      uint64_t v14 = v12 + 1;
      if (v13) {
        goto LABEL_10;
      }
      v5[2] = v14;
      if (!--v2) {
        return (unint64_t)v5;
      }
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE80];
  }
  return result;
}

unint64_t sub_24D1D63C0()
{
  unint64_t result = qword_26985BB98;
  if (!qword_26985BB98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26985BB98);
  }
  return result;
}

uint64_t sub_24D1D6414(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t type metadata accessor for EnergySite.HistoricalEnergyUsage(uint64_t a1)
{
  return sub_24D1D6490(a1, (uint64_t *)&unk_26985BD50);
}

uint64_t sub_24D1D6490(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24D1D64C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for EnergySite.EnergyUsage(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24D1D652C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for EnergySite.EnergyUsage(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24D1D6588(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_24D1D65F0(uint64_t a1)
{
  return sub_24D1C874C(a1, v1[2], v1[3], v1[4], v1[5], v1[6], v1[7], v1[8], v1[9], v1[10], v1[11], v1[12], v1[13], v1[14]);
}

uint64_t sub_24D1D6634(uint64_t a1)
{
  return sub_24D1C9958(a1, v1, &qword_26985BDF8, (uint64_t)&unk_26FF7AD70, (uint64_t)&unk_26985BE08);
}

uint64_t sub_24D1D6674(uint64_t a1)
{
  return sub_24D1CEA9C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_24D1D667C(uint64_t a1)
{
  return a1;
}

unint64_t sub_24D1D66A8()
{
  unint64_t result = qword_26985BC68;
  if (!qword_26985BC68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26985BC68);
  }
  return result;
}

unint64_t sub_24D1D6700()
{
  unint64_t result = qword_26985BC70;
  if (!qword_26985BC70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26985BC70);
  }
  return result;
}

uint64_t sub_24D1D6754@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *a1 + 48;
  swift_beginAccess();
  uint64_t result = MEMORY[0x253322B70](v4);
  uint64_t v6 = *(void *)(v3 + 56);
  *a2 = result;
  a2[1] = v6;
  return result;
}

uint64_t sub_24D1D67B0(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *a2;
  swift_beginAccess();
  *(void *)(v3 + 56) = v2;
  return swift_unknownObjectWeakAssign();
}

uint64_t dispatch thunk of EnergySiteDelegate.siteDidUpdateGuidance(siteID:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of EnergySiteDelegate.siteZoneCreated(siteID:zoneName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 16))();
}

uint64_t dispatch thunk of EnergySiteDelegate.siteZoneDeleted(siteID:zoneName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 24))();
}

uint64_t type metadata accessor for EnergySite()
{
  return self;
}

uint64_t method lookup function for EnergySite(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for EnergySite);
}

uint64_t dispatch thunk of EnergySite.delegate.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of EnergySite.delegate.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of EnergySite.delegate.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t dispatch thunk of EnergySite.updateLocation(_:)(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 224) + **(int **)(*(void *)v1 + 224));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24D1DCDD0;
  return v6(a1);
}

uint64_t dispatch thunk of EnergySite.updateTimezone(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(*(void *)v2 + 232) + **(int **)(*(void *)v2 + 232));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *uint64_t v6 = v3;
  v6[1] = sub_24D1DCDD0;
  return v8(a1, a2);
}

uint64_t dispatch thunk of EnergySite.updateState(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(*(void *)v2 + 240) + **(int **)(*(void *)v2 + 240));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *uint64_t v6 = v3;
  v6[1] = sub_24D1DCDD0;
  return v8(a1, a2);
}

uint64_t dispatch thunk of EnergySite.updateFields(from:)(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 248) + **(int **)(*(void *)v1 + 248));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24D1DCDD0;
  return v6(a1);
}

uint64_t dispatch thunk of EnergySite.updateSubscription(utilityID:subscriptionID:accessToken:refreshToken:ckFunctionToken:accountName:accountNumber:address:serviceLocationID:alternateSupplier:accessTokenExpirationDate:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  uint64_t v25 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)v21 + 256) + **(int **)(*(void *)v21 + 256));
  uint64_t v23 = (void *)swift_task_alloc();
  *(void *)(v22 + 16) = v23;
  *uint64_t v23 = v22;
  v23[1] = sub_24D1DCDD0;
  return v25(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20, a21);
}

uint64_t dispatch thunk of EnergySite.createUtilitySubscription(utilityID:serviceLocationID:accessToken:refreshToken:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)v8 + 264) + **(int **)(*(void *)v8 + 264));
  uint64_t v18 = (void *)swift_task_alloc();
  *(void *)(v9 + 16) = v18;
  *uint64_t v18 = v9;
  v18[1] = sub_24D1DCDF0;
  return v20(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t dispatch thunk of EnergySite.createUtilitySubscription(utilityID:serviceLocationID:accessToken:accessTokenExpirationDate:refreshToken:utilityCustomerName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)v11 + 272) + **(int **)(*(void *)v11 + 272));
  uint64_t v18 = (void *)swift_task_alloc();
  *(void *)(v12 + 16) = v18;
  *uint64_t v18 = v12;
  v18[1] = sub_24D1DCDF0;
  return v20(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11);
}

uint64_t dispatch thunk of EnergySite.createUtilitySubscription(utilityID:serviceLocationID:accessToken:accessTokenExpirationDate:refreshToken:address:utilityCustomerName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)v13 + 280) + **(int **)(*(void *)v13 + 280));
  uint64_t v18 = (void *)swift_task_alloc();
  *(void *)(v14 + 16) = v18;
  *uint64_t v18 = v14;
  v18[1] = sub_24D1DCDF0;
  return v20(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13);
}

uint64_t dispatch thunk of EnergySite.revokeUtilitySubscription()()
{
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(*(void *)v0 + 288) + **(int **)(*(void *)v0 + 288));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_24D1DCDF0;
  return v4();
}

uint64_t dispatch thunk of EnergySite.renewUtilityAccessToken()()
{
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(*(void *)v0 + 296) + **(int **)(*(void *)v0 + 296));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_24D1DCDD0;
  return v4();
}

uint64_t dispatch thunk of EnergySite.delete()()
{
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(*(void *)v0 + 336) + **(int **)(*(void *)v0 + 336));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_24D1DCDD0;
  return v4();
}

uint64_t dispatch thunk of EnergySite.historicalEnergyUsage(interval:start:bulk:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)v4 + 344)
                                                                   + **(int **)(*(void *)v4 + 344));
  char v10 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v10;
  *char v10 = v5;
  v10[1] = sub_24D1D770C;
  return v12(a1, a2, a3, a4);
}

uint64_t sub_24D1D770C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t dispatch thunk of EnergySite.historicalEnergyUsage(interval:start:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)v3 + 352)
                                                          + **(int **)(*(void *)v3 + 352));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  void *v8 = v4;
  v8[1] = sub_24D1DCDD0;
  return v10(a1, a2, a3);
}

uint64_t dispatch thunk of EnergySite.intervalReading(interval:start:end:timeZoneIdentifier:flowDirection:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)v8 + 360) + **(int **)(*(void *)v8 + 360));
  uint64_t v18 = (void *)swift_task_alloc();
  *(void *)(v9 + 16) = v18;
  *uint64_t v18 = v9;
  v18[1] = sub_24D1D7A84;
  return v20(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_24D1D7A84(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t dispatch thunk of EnergySite.isDataAvailable()()
{
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(*(void *)v0 + 368) + **(int **)(*(void *)v0 + 368));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_24D1DCDF0;
  return v4();
}

uint64_t dispatch thunk of EnergySite.currentRatePlans()(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 376) + **(int **)(*(void *)v1 + 376));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24D1DCDD0;
  return v6(a1);
}

uint64_t dispatch thunk of EnergySite.currentUtilityPeakPeriods()()
{
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(*(void *)v0 + 384) + **(int **)(*(void *)v0 + 384));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_24D1DCDF0;
  return v4();
}

uint64_t dispatch thunk of EnergySite.currentUtilityPeakPeriodsWithInfo()(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 392) + **(int **)(*(void *)v1 + 392));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24D1DCDD0;
  return v6(a1);
}

uint64_t dispatch thunk of EnergySite.isTOU()()
{
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(*(void *)v0 + 400) + **(int **)(*(void *)v0 + 400));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_24D1DCDF0;
  return v4();
}

uint64_t dispatch thunk of EnergySite.isTiered()()
{
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(*(void *)v0 + 408) + **(int **)(*(void *)v0 + 408));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_24D1DCDF0;
  return v4();
}

uint64_t dispatch thunk of EnergySite.isFlat()()
{
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(*(void *)v0 + 416) + **(int **)(*(void *)v0 + 416));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_24D1DCDF0;
  return v4();
}

uint64_t dispatch thunk of EnergySite.isFixed()()
{
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(*(void *)v0 + 424) + **(int **)(*(void *)v0 + 424));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_24D1DCDF0;
  return v4();
}

uint64_t dispatch thunk of EnergySite.isUnsupported()()
{
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(*(void *)v0 + 432) + **(int **)(*(void *)v0 + 432));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_24D1D7A84;
  return v4();
}

uint64_t dispatch thunk of EnergySite.refreshCurrentUtilityPeakPeriods(start:)(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 440) + **(int **)(*(void *)v1 + 440));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24D1DCDD0;
  return v6(a1);
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for EnergySite.EnergyUsageTimeInterval()
{
  return &type metadata for EnergySite.EnergyUsageTimeInterval;
}

uint64_t _s9EnergyKit10EnergySiteC23EnergyUsageTimeIntervalOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s9EnergyKit10EnergySiteC23EnergyUsageTimeIntervalOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 4;
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
        JUMPOUT(0x24D1D8710);
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
          *uint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

uint64_t sub_24D1D8738(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_24D1D8740(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for EnergySite.HistoricalEnergyUsageError()
{
  return &type metadata for EnergySite.HistoricalEnergyUsageError;
}

void *initializeBufferWithCopyOfBuffer for EnergySite.EnergyUsage(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (void *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_24D218AC0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[6];
    *(void *)((char *)a1 + a3[5]) = *(void *)((char *)a2 + a3[5]);
    *(void *)((char *)a1 + v8) = *(void *)((char *)a2 + v8);
    uint64_t v9 = a3[8];
    *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
    *(void *)((char *)a1 + v9) = *(void *)((char *)a2 + v9);
    uint64_t v10 = a3[10];
    *(void *)((char *)a1 + a3[9]) = *(void *)((char *)a2 + a3[9]);
    *(void *)((char *)a1 + v10) = *(void *)((char *)a2 + v10);
    uint64_t v11 = a3[12];
    *(void *)((char *)a1 + a3[11]) = *(void *)((char *)a2 + a3[11]);
    *(void *)((char *)a1 + v11) = *(void *)((char *)a2 + v11);
    *((unsigned char *)a1 + a3[13]) = *((unsigned char *)a2 + a3[13]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for EnergySite.EnergyUsage(uint64_t a1)
{
  uint64_t v2 = sub_24D218AC0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for EnergySite.EnergyUsage(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24D218AC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  uint64_t v9 = a3[10];
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  *(void *)(a1 + v9) = *(void *)(a2 + v9);
  uint64_t v10 = a3[12];
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  *(void *)(a1 + v10) = *(void *)(a2 + v10);
  *(unsigned char *)(a1 + a3[13]) = *(unsigned char *)(a2 + a3[13]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for EnergySite.EnergyUsage(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24D218AC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[10]) = *(void *)(a2 + a3[10]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[12]) = *(void *)(a2 + a3[12]);
  *(unsigned char *)(a1 + a3[13]) = *(unsigned char *)(a2 + a3[13]);
  return a1;
}

uint64_t initializeWithTake for EnergySite.EnergyUsage(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24D218AC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  uint64_t v9 = a3[10];
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  *(void *)(a1 + v9) = *(void *)(a2 + v9);
  uint64_t v10 = a3[12];
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  *(void *)(a1 + v10) = *(void *)(a2 + v10);
  *(unsigned char *)(a1 + a3[13]) = *(unsigned char *)(a2 + a3[13]);
  return a1;
}

uint64_t assignWithTake for EnergySite.EnergyUsage(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24D218AC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[10]) = *(void *)(a2 + a3[10]);
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  swift_bridgeObjectRelease();
  uint64_t v9 = a3[13];
  *(void *)(a1 + a3[12]) = *(void *)(a2 + a3[12]);
  *(unsigned char *)(a1 + v9) = *(unsigned char *)(a2 + v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for EnergySite.EnergyUsage(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24D1D8D0C);
}

uint64_t sub_24D1D8D0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24D218AC0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 32));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for EnergySite.EnergyUsage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24D1D8DE0);
}

uint64_t sub_24D1D8DE0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_24D218AC0();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 32)) = (a2 - 1);
  }
  return result;
}

uint64_t sub_24D1D8E9C()
{
  uint64_t result = sub_24D218AC0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for EnergySite.HistoricalEnergyUsage(uint64_t *a1, uint64_t *a2, int *a3)
{
  unsigned int v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v23 = *a2;
    *unsigned int v4 = *a2;
    unsigned int v4 = (uint64_t *)(v23 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v7 = a3[5];
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_24D218AC0();
    (*(void (**)(unsigned char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    uint64_t v11 = a3[7];
    *(uint64_t *)((char *)v4 + a3[6]) = *(uint64_t *)((char *)a2 + a3[6]);
    uint64_t v12 = (char *)v4 + v11;
    uint64_t v13 = (char *)a2 + v11;
    v12[8] = v13[8];
    *(void *)uint64_t v12 = *(void *)v13;
    uint64_t v14 = a3[8];
    uint64_t v15 = a3[9];
    uint64_t v16 = (char *)v4 + v14;
    uint64_t v17 = (char *)a2 + v14;
    v16[8] = v17[8];
    *(void *)uint64_t v16 = *(void *)v17;
    uint64_t v18 = (char *)v4 + v15;
    uint64_t v19 = (char *)a2 + v15;
    *(void *)uint64_t v18 = *(void *)v19;
    v18[8] = v19[8];
    uint64_t v20 = a3[10];
    uint64_t v21 = (char *)v4 + v20;
    uint64_t v22 = (char *)a2 + v20;
    *(void *)uint64_t v21 = *(void *)v22;
    v21[8] = v22[8];
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for EnergySite.HistoricalEnergyUsage(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 20);
  uint64_t v3 = sub_24D218AC0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);

  return swift_bridgeObjectRelease();
}

unsigned char *initializeWithCopy for EnergySite.HistoricalEnergyUsage(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_24D218AC0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  uint64_t v10 = a3[7];
  *(void *)&a1[a3[6]] = *(void *)&a2[a3[6]];
  uint64_t v11 = &a1[v10];
  uint64_t v12 = &a2[v10];
  v11[8] = v12[8];
  *(void *)uint64_t v11 = *(void *)v12;
  uint64_t v13 = a3[8];
  uint64_t v14 = a3[9];
  uint64_t v15 = &a1[v13];
  uint64_t v16 = &a2[v13];
  v15[8] = v16[8];
  *(void *)uint64_t v15 = *(void *)v16;
  uint64_t v17 = &a1[v14];
  uint64_t v18 = &a2[v14];
  *(void *)uint64_t v17 = *(void *)v18;
  v17[8] = v18[8];
  uint64_t v19 = a3[10];
  uint64_t v20 = &a1[v19];
  uint64_t v21 = &a2[v19];
  *(void *)uint64_t v20 = *(void *)v21;
  v20[8] = v21[8];
  swift_bridgeObjectRetain();
  return a1;
}

unsigned char *assignWithCopy for EnergySite.HistoricalEnergyUsage(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_24D218AC0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  *(void *)&a1[a3[6]] = *(void *)&a2[a3[6]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = a3[7];
  uint64_t v11 = &a1[v10];
  uint64_t v12 = &a2[v10];
  uint64_t v13 = *(void *)v12;
  v11[8] = v12[8];
  *(void *)uint64_t v11 = v13;
  uint64_t v14 = a3[8];
  uint64_t v15 = &a1[v14];
  uint64_t v16 = &a2[v14];
  uint64_t v17 = *(void *)v16;
  v15[8] = v16[8];
  *(void *)uint64_t v15 = v17;
  uint64_t v18 = a3[9];
  uint64_t v19 = &a1[v18];
  uint64_t v20 = &a2[v18];
  uint64_t v21 = *(void *)v20;
  v19[8] = v20[8];
  *(void *)uint64_t v19 = v21;
  uint64_t v22 = a3[10];
  uint64_t v23 = &a1[v22];
  uint64_t v24 = &a2[v22];
  uint64_t v25 = *(void *)v24;
  v23[8] = v24[8];
  *(void *)uint64_t v23 = v25;
  return a1;
}

unsigned char *initializeWithTake for EnergySite.HistoricalEnergyUsage(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_24D218AC0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[7];
  *(void *)&a1[a3[6]] = *(void *)&a2[a3[6]];
  uint64_t v11 = &a1[v10];
  uint64_t v12 = &a2[v10];
  v11[8] = v12[8];
  *(void *)uint64_t v11 = *(void *)v12;
  uint64_t v13 = a3[8];
  uint64_t v14 = a3[9];
  uint64_t v15 = &a1[v13];
  uint64_t v16 = &a2[v13];
  v15[8] = v16[8];
  *(void *)uint64_t v15 = *(void *)v16;
  uint64_t v17 = &a1[v14];
  uint64_t v18 = &a2[v14];
  *(void *)uint64_t v17 = *(void *)v18;
  v17[8] = v18[8];
  uint64_t v19 = a3[10];
  uint64_t v20 = &a1[v19];
  uint64_t v21 = &a2[v19];
  *(void *)uint64_t v20 = *(void *)v21;
  v20[8] = v21[8];
  return a1;
}

unsigned char *assignWithTake for EnergySite.HistoricalEnergyUsage(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_24D218AC0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  *(void *)&a1[a3[6]] = *(void *)&a2[a3[6]];
  swift_bridgeObjectRelease();
  uint64_t v10 = a3[7];
  uint64_t v11 = a3[8];
  uint64_t v12 = &a1[v10];
  uint64_t v13 = &a2[v10];
  *(void *)uint64_t v12 = *(void *)v13;
  v12[8] = v13[8];
  uint64_t v14 = &a1[v11];
  uint64_t v15 = &a2[v11];
  *(void *)uint64_t v14 = *(void *)v15;
  v14[8] = v15[8];
  uint64_t v16 = a3[9];
  uint64_t v17 = a3[10];
  uint64_t v18 = &a1[v16];
  uint64_t v19 = &a2[v16];
  *(void *)uint64_t v18 = *(void *)v19;
  v18[8] = v19[8];
  uint64_t v20 = &a1[v17];
  uint64_t v21 = &a2[v17];
  v20[8] = v21[8];
  *(void *)uint64_t v20 = *(void *)v21;
  return a1;
}

uint64_t getEnumTagSinglePayload for EnergySite.HistoricalEnergyUsage(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24D1D9568);
}

uint64_t sub_24D1D9568(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24D218AC0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v10(v9, a2, v8);
  }
  else
  {
    unint64_t v12 = *(void *)(a1 + *(int *)(a3 + 24));
    if (v12 >= 0xFFFFFFFF) {
      LODWORD(v12) = -1;
    }
    return (v12 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for EnergySite.HistoricalEnergyUsage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24D1D9640);
}

uint64_t sub_24D1D9640(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_24D218AC0();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v11 = a1 + *(int *)(a4 + 20);
    unint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v12(v11, a2, a2, v10);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  }
  return result;
}

uint64_t sub_24D1D9700()
{
  uint64_t result = sub_24D218AC0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

_OWORD *sub_24D1D97B4(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_24D1D97C4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_24D219290();
  uint64_t v8 = result;
  if (v2)
  {
    unsigned int v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      uint64_t v6 = *v4;
      swift_bridgeObjectRetain();
      sub_24D1D1C24(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_24D1D985C(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_24D1D98B8(uint64_t a1)
{
  return a1;
}

uint64_t sub_24D1D990C(uint64_t a1)
{
  return sub_24D1C9958(a1, v1, &qword_26B18A808, (uint64_t)&unk_26FF7AC30, (uint64_t)&unk_26985BD70);
}

uint64_t sub_24D1D994C()
{
  return objectdestroyTm(&qword_26B18A808);
}

uint64_t sub_24D1D9958(uint64_t a1)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B18A808) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v1 + 16);
  uint64_t v7 = *(void *)(v1 + 24);
  uint64_t v8 = v1 + v5;
  uint64_t v9 = *(void *)(v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = sub_24D1DCDD0;
  return sub_24D1C3610(a1, v6, v7, v8, v9);
}

uint64_t sub_24D1D9A80(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24D1D9ADC()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24D1D9B14(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *unint64_t v5 = v2;
  v5[1] = sub_24D1DCDD0;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_26985BD78 + dword_26985BD78);
  return v6(a1, v4);
}

uint64_t sub_24D1D9BCC()
{
  return objectdestroy_116Tm(&qword_26B18A808);
}

uint64_t sub_24D1D9BD8(uint64_t a1)
{
  return sub_24D1DA0E4(a1, &qword_26B18A808, (uint64_t)"Registration of Site failed. %s", (uint64_t)&qword_26B18A808, (uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t))sub_24D1C4840);
}

uint64_t sub_24D1D9C04(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    uint64_t v9 = *(void *)(a5(0) - 8);
    uint64_t v10 = a4 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    uint64_t v11 = *(void *)(v9 + 72);
    unint64_t v12 = v10 + v11 * a1;
    unint64_t v13 = a3 + v11 * v5;
    if (v12 >= v13 || v12 + v11 * v5 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  uint64_t result = sub_24D2194A0();
  __break(1u);
  return result;
}

uint64_t sub_24D1D9D60(uint64_t a1)
{
  return sub_24D1C2484(a1, v1);
}

uint64_t sub_24D1D9D68(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24D1D9DCC()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A808);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  unint64_t v5 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = sub_24D218AC0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v5 + v8 + 8) & ~v8;
  uint64_t v10 = v9 + *(void *)(v7 + 64);
  uint64_t v11 = v3 | v8 | 7;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, v6);

  return MEMORY[0x270FA0238](v0, v10, v11);
}

uint64_t sub_24D1D9F3C(uint64_t a1)
{
  uint64_t v3 = v2;
  uint64_t v5 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B18A808) - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v7 = (*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v8 = *(unsigned __int8 *)(*(void *)(sub_24D218AC0() - 8) + 80);
  uint64_t v9 = v7 + v8 + 8;
  uint64_t v10 = *(void *)(v1 + 16);
  uint64_t v11 = *(void *)(v1 + 24);
  uint64_t v12 = v1 + v6;
  uint64_t v13 = *(void *)(v1 + v7);
  uint64_t v14 = v1 + (v9 & ~v8);
  uint64_t v15 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v15;
  *uint64_t v15 = v3;
  v15[1] = sub_24D1DCDD0;
  return sub_24D1CED60(a1, v10, v11, v12, v13, v14);
}

uint64_t sub_24D1DA0AC()
{
  return objectdestroy_116Tm(&qword_26B18A808);
}

uint64_t sub_24D1DA0B8(uint64_t a1)
{
  return sub_24D1DA0E4(a1, &qword_26B18A808, (uint64_t)"Failed to refresh current utility peak periods %@", (uint64_t)&qword_26B18A808, (uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t))sub_24D1CF2D0);
}

uint64_t sub_24D1DA0E4(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, unint64_t, uint64_t, uint64_t))
{
  uint64_t v10 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(a2) - 8);
  return a5(a1, v5 + ((*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80)), a3, a4);
}

unint64_t sub_24D1DA170()
{
  unint64_t result = qword_26B18A5C0;
  if (!qword_26B18A5C0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B18A5C0);
  }
  return result;
}

uint64_t sub_24D1DA1B0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }

  return swift_release();
}

uint64_t sub_24D1DA208(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }

  return swift_retain();
}

uint64_t sub_24D1DA260(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24D1DA2A8(uint64_t a1)
{
  return sub_24D1C3A64(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_24D1DA2B0()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A800);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, v6, v5);
}

uint64_t sub_24D1DA3A0(uint64_t a1)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B18A800) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v1 + 16);
  uint64_t v7 = *(void *)(v1 + 24);
  uint64_t v8 = v1 + v5;
  uint64_t v9 = (uint64_t *)(v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v10 = *v9;
  uint64_t v11 = v9[1];
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v12;
  *uint64_t v12 = v2;
  v12[1] = sub_24D1DCDD0;
  return sub_24D1C3C58(a1, v6, v7, v8, v10, v11);
}

uint64_t sub_24D1DA4D0()
{
  return objectdestroy_116Tm(&qword_26B18A800);
}

uint64_t sub_24D1DA4DC(uint64_t a1)
{
  return sub_24D1DA0E4(a1, &qword_26B18A800, (uint64_t)"Failed to get energysite. %s", (uint64_t)&qword_26B18A800, (uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t))sub_24D1C4840);
}

uint64_t sub_24D1DA508()
{
  return objectdestroyTm(&qword_26985BDF8);
}

uint64_t sub_24D1DA514(uint64_t a1)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26985BDF8) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v1 + 16);
  uint64_t v7 = *(void *)(v1 + 24);
  uint64_t v8 = v1 + v5;
  uint64_t v9 = *(void *)(v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = sub_24D1DCDD0;
  return sub_24D1C9B34(a1, v6, v7, v8, v9);
}

uint64_t sub_24D1DA63C()
{
  return objectdestroy_116Tm(&qword_26985BDF8);
}

uint64_t sub_24D1DA648(uint64_t a1)
{
  return sub_24D1DA0E4(a1, &qword_26985BDF8, (uint64_t)"Failed to check if data is available %@", (uint64_t)&qword_26985BDF8, (uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t))sub_24D1CF2D0);
}

uint64_t sub_24D1DA674()
{
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BE10);
  uint64_t v1 = *(void *)(v19 - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 48) & ~v2;
  unint64_t v15 = (((((*(void *)(v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v4 = sub_24D218AC0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v14 = (v6 + v15 + 16) & ~v6;
  uint64_t v7 = *(void *)(v5 + 64);
  uint64_t v8 = (v7 + v6 + v14) & ~v6;
  uint64_t v18 = sub_24D218BB0();
  uint64_t v9 = *(void *)(v18 - 8);
  uint64_t v10 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v11 = (v7 + v10 + v8) & ~v10;
  uint64_t v17 = v2 | v6 | v10 | 7;
  unint64_t v16 = ((*(void *)(v9 + 64) + v11 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v0 + v3, v19);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v12(v0 + v14, v4);
  v12(v0 + v8, v4);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v0 + v11, v18);
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, v16, v17);
}

uint64_t sub_24D1DA8FC(uint64_t a1)
{
  uint64_t v2 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26985BE10) - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  unint64_t v4 = (*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  sub_24D218AC0();
  sub_24D218BB0();
  uint64_t v11 = v1[3];
  uint64_t v12 = v1[2];
  uint64_t v9 = v1[5];
  uint64_t v10 = v1[4];
  uint64_t v5 = *(void *)((char *)v1 + v4 + 8);
  uint64_t v8 = *(void *)((char *)v1 + v4);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v13 + 16) = v6;
  *uint64_t v6 = v13;
  v6[1] = sub_24D1DCDD0;
  return sub_24D1C8C1C(a1, v12, v11, v10, v9, (uint64_t)v1 + v3, v8, v5);
}

uint64_t sub_24D1DAB6C()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BE10);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_24D1DAC3C(void *a1)
{
  uint64_t v3 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26985BE10) - 8);
  uint64_t v4 = *(void *)(v1 + 16);
  unint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_24D1C92BC(a1, v4, v5, v6);
}

uint64_t sub_24D1DACB4()
{
  return objectdestroyTm(&qword_26B18A808);
}

uint64_t sub_24D1DACC0(uint64_t a1)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B18A808) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v1 + 16);
  uint64_t v7 = *(void *)(v1 + 24);
  uint64_t v8 = v1 + v5;
  uint64_t v9 = *(void *)(v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = sub_24D1DCDD0;
  return sub_24D1C4330(a1, v6, v7, v8, v9);
}

uint64_t sub_24D1DADE8()
{
  return objectdestroy_116Tm(&qword_26B18A808);
}

uint64_t sub_24D1DADF4(uint64_t a1)
{
  return sub_24D1DA0E4(a1, &qword_26B18A808, (uint64_t)"Deletion of Site failed. %s", (uint64_t)&qword_26B18A808, (uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t))sub_24D1C4840);
}

uint64_t sub_24D1DAE20()
{
  return objectdestroyTm(&qword_26985BE50);
}

uint64_t sub_24D1DAE2C(uint64_t a1)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26985BE50) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v1 + 16);
  uint64_t v7 = *(void *)(v1 + 24);
  uint64_t v8 = v1 + v5;
  uint64_t v9 = *(void *)(v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = sub_24D1DCDD0;
  return sub_24D1C1AFC(a1, v6, v7, v8, v9);
}

uint64_t sub_24D1DAF54()
{
  return objectdestroy_116Tm(&qword_26985BE50);
}

uint64_t sub_24D1DAF60(uint64_t a1)
{
  return sub_24D1DA0E4(a1, &qword_26985BE50, 0xD000000000000019, 0x800000024D21B8D0, (uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t))sub_24D1C2054);
}

uint64_t sub_24D1DAF98()
{
  return objectdestroyTm(&qword_26985BE50);
}

uint64_t objectdestroyTm(uint64_t *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 32) & ~v4;
  uint64_t v6 = v4 | 7;
  unint64_t v7 = ((*(void *)(v3 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1 + v5, v2);
  swift_release();

  return MEMORY[0x270FA0238](v1, v7, v6);
}

uint64_t sub_24D1DB088(uint64_t a1)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26985BE50) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v1 + 16);
  uint64_t v7 = *(void *)(v1 + 24);
  uint64_t v8 = v1 + v5;
  uint64_t v9 = *(void *)(v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = sub_24D1DCDD0;
  return sub_24D1C1474(a1, v6, v7, v8, v9);
}

uint64_t sub_24D1DB1B0()
{
  return objectdestroy_116Tm(&qword_26985BE50);
}

uint64_t sub_24D1DB1BC(uint64_t a1)
{
  return sub_24D1DA0E4(a1, &qword_26985BE50, 0xD00000000000001BLL, 0x800000024D21B8B0, (uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t))sub_24D1C2054);
}

uint64_t sub_24D1DB1F4()
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BE50);
  uint64_t v1 = *(void *)(v9 - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  unint64_t v8 = (((((((*(void *)(v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)
      + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v10 = sub_24D218AC0();
  uint64_t v4 = *(void *)(v10 - 8);
  uint64_t v5 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = (v5 + v8 + 16) & ~v5;
  unint64_t v11 = ((((((*(void *)(v4 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)
      + 16;
  uint64_t v12 = v2 | v5 | 7;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v0 + v3, v9);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v0 + v6, v10);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, v11, v12);
}

uint64_t sub_24D1DB3F8(uint64_t a1)
{
  uint64_t v2 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26985BE50) - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  unint64_t v4 = (*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v5 = (v4 + 15) & 0xFFFFFFFFFFFFFFF8;
  sub_24D218AC0();
  uint64_t v13 = *(void *)(v1 + 16);
  uint64_t v12 = *(void *)(v1 + 24);
  uint64_t v11 = *(void *)(v1 + v4);
  uint64_t v9 = *(void *)(v1 + v5 + 8);
  uint64_t v10 = *(void *)(v1 + v5);
  uint64_t v8 = *(void *)(v1 + ((v5 + 23) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v14 + 16) = v6;
  *uint64_t v6 = v14;
  v6[1] = sub_24D1DCDD0;
  return sub_24D1C0AD8(a1, v13, v12, v1 + v3, v11, v10, v9, v8);
}

uint64_t sub_24D1DB624()
{
  return objectdestroy_116Tm(&qword_26985BE50);
}

uint64_t sub_24D1DB630(uint64_t a1)
{
  return sub_24D1DA0E4(a1, &qword_26985BE50, 0xD000000000000086, 0x800000024D21B820, (uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t))sub_24D1C2054);
}

uint64_t sub_24D1DB668()
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BE50);
  uint64_t v1 = *(void *)(v9 - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  unint64_t v8 = (((((((*(void *)(v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)
      + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v11 = sub_24D218AC0();
  uint64_t v4 = *(void *)(v11 - 8);
  uint64_t v5 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = (v5 + v8 + 16) & ~v5;
  uint64_t v12 = v2 | v5 | 7;
  unint64_t v10 = ((((*(void *)(v4 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v0 + v3, v9);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v0 + v6, v11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, v10, v12);
}

uint64_t sub_24D1DB858(uint64_t a1)
{
  uint64_t v3 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26985BE50) - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = (*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v6 = (v5 + 15) & 0xFFFFFFFFFFFFFFF8;
  sub_24D218AC0();
  uint64_t v13 = *(void *)(v1 + 24);
  uint64_t v14 = *(void *)(v1 + 16);
  uint64_t v12 = *(void *)(v1 + v5);
  uint64_t v10 = *(void *)(v1 + v6 + 8);
  uint64_t v11 = *(void *)(v1 + v6);
  uint64_t v7 = *(void *)(v1 + ((v6 + 23) & 0xFFFFFFFFFFFFFFF8));
  unint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_24D1DCDD0;
  return sub_24D1BFA50(a1, v14, v13, v1 + v4, v12, v11, v10, v7);
}

uint64_t sub_24D1DBA68()
{
  return objectdestroy_116Tm(&qword_26985BE50);
}

uint64_t sub_24D1DBA74(uint64_t a1)
{
  return sub_24D1DA0E4(a1, &qword_26985BE50, 0xD00000000000007ELL, 0x800000024D21B7A0, (uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t))sub_24D1C2054);
}

uint64_t sub_24D1DBAAC()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BE50);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v7 = v3 | 7;
  unint64_t v5 = (((((((((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)
        + 23) & 0xFFFFFFFFFFFFFFF8)
      + 23) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, v5 + 16, v7);
}

uint64_t sub_24D1DBBFC(uint64_t a1)
{
  uint64_t v3 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26985BE50) - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = (*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v6 = (v5 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v14 = *(void *)(v1 + 24);
  uint64_t v15 = *(void *)(v1 + 16);
  uint64_t v13 = v1 + v4;
  uint64_t v7 = *(void *)(v1 + v5);
  uint64_t v8 = *(void *)(v1 + v6);
  uint64_t v9 = *(void *)(v1 + v6 + 8);
  uint64_t v10 = *(void *)(v1 + ((v6 + 23) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  void *v11 = v2;
  v11[1] = sub_24D1DCDD0;
  return sub_24D1BEA80(a1, v15, v14, v13, v7, v8, v9, v10);
}

uint64_t sub_24D1DBD9C()
{
  return objectdestroy_116Tm(&qword_26985BE50);
}

uint64_t sub_24D1DBDA8(uint64_t a1)
{
  return sub_24D1DA0E4(a1, &qword_26985BE50, 0xD000000000000050, 0x800000024D21B740, (uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t))sub_24D1C2054);
}

uint64_t sub_24D1DBDE0()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BE50);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v12 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v3 = (v12 + 32) & ~v12;
  unint64_t v9 = (((((((((((((((((((((*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)
                    + 23) & 0xFFFFFFFFFFFFFFF8)
                  + 23) & 0xFFFFFFFFFFFFFFF8)
                + 23) & 0xFFFFFFFFFFFFFFF8)
              + 23) & 0xFFFFFFFFFFFFFFF8)
            + 23) & 0xFFFFFFFFFFFFFFF8)
          + 23) & 0xFFFFFFFFFFFFFFF8)
        + 23) & 0xFFFFFFFFFFFFFFF8)
      + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B18A610) - 8);
  uint64_t v11 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v5 = (v11 + v9 + 16) & ~v11;
  uint64_t v10 = *(void *)(v4 + 64);
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v6 = sub_24D218AC0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v0 + v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v5, v6);
  }

  return MEMORY[0x270FA0238](v0, v5 + v10, v12 | v11 | 7);
}

uint64_t sub_24D1DC0B8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_24D1DC11C(uint64_t a1)
{
  uint64_t v2 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26985BE50) - 8);
  unint64_t v10 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  unint64_t v3 = (*(void *)(v2 + 64) + v10 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v4 = (v3 + 15) & 0xFFFFFFFFFFFFFFF8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A610);
  uint64_t v14 = *(void *)(v1 + 16);
  uint64_t v13 = *(void *)(v1 + 24);
  uint64_t v12 = *(void *)(v1 + v3);
  uint64_t v8 = v1 + v10;
  uint64_t v9 = *(void *)(v1 + v4 + 8);
  uint64_t v11 = *(void *)(v1 + v4);
  uint64_t v7 = *(void *)(v1 + ((v4 + 23) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v15 + 16) = v5;
  *uint64_t v5 = v15;
  v5[1] = sub_24D1DCDD0;
  return sub_24D1BD940(a1, v14, v13, v8, v12, v11, v9, v7);
}

uint64_t sub_24D1DC3D8()
{
  return objectdestroy_116Tm(&qword_26985BE50);
}

uint64_t sub_24D1DC3E4(uint64_t a1)
{
  return sub_24D1DA0E4(a1, &qword_26985BE50, 0xD0000000000000B6, 0x800000024D21B680, (uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t))sub_24D1C2054);
}

uint64_t sub_24D1DC41C()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BE50);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, v6 + 8, v5);
}

uint64_t sub_24D1DC518(uint64_t a1)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26985BE50) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v6 = (*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v7 = *(void *)(v1 + 16);
  uint64_t v8 = *(void *)(v1 + 24);
  uint64_t v9 = v1 + v5;
  uint64_t v10 = *(void *)(v1 + v6);
  uint64_t v11 = *(void *)(v1 + ((v6 + 15) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v12;
  *uint64_t v12 = v2;
  v12[1] = sub_24D1DCDD0;
  return sub_24D1BC878(a1, v7, v8, v9, v10, v11);
}

uint64_t sub_24D1DC650()
{
  return objectdestroy_116Tm(&qword_26985BE50);
}

uint64_t sub_24D1DC65C(uint64_t a1)
{
  return sub_24D1DA0E4(a1, &qword_26985BE50, 0xD000000000000013, 0x800000024D21B660, (uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t))sub_24D1C2054);
}

uint64_t sub_24D1DC698(uint64_t a1)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26985BE50) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v6 = (*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v7 = *(void *)(v1 + 16);
  uint64_t v8 = *(void *)(v1 + 24);
  uint64_t v9 = *(void *)(v1 + v6);
  uint64_t v10 = v1 + v5;
  uint64_t v11 = (uint64_t *)(v1 + ((v6 + 15) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v12 = *v11;
  uint64_t v13 = v11[1];
  uint64_t v14 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v14;
  *uint64_t v14 = v2;
  v14[1] = sub_24D1D770C;
  return sub_24D1BBB5C(a1, v7, v8, v10, v9, v12, v13);
}

uint64_t sub_24D1DC7E0()
{
  return objectdestroy_116Tm(&qword_26985BE50);
}

uint64_t sub_24D1DC7EC(uint64_t a1)
{
  return sub_24D1DA0E4(a1, &qword_26985BE50, 0x7453657461647075, 0xEF293A5F28657461, (uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t))sub_24D1C2054);
}

uint64_t objectdestroy_219Tm()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BE50);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, v6 + 16, v5);
}

uint64_t sub_24D1DC930(uint64_t a1)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26985BE50) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v6 = (*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v7 = *(void *)(v1 + 16);
  uint64_t v8 = *(void *)(v1 + 24);
  uint64_t v9 = *(void *)(v1 + v6);
  uint64_t v10 = v1 + v5;
  uint64_t v11 = (uint64_t *)(v1 + ((v6 + 15) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v12 = *v11;
  uint64_t v13 = v11[1];
  uint64_t v14 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v14;
  *uint64_t v14 = v2;
  v14[1] = sub_24D1DCDD0;
  return sub_24D1BAFAC(a1, v7, v8, v10, v9, v12, v13);
}

uint64_t sub_24D1DCA78()
{
  return objectdestroy_116Tm(&qword_26985BE50);
}

uint64_t sub_24D1DCA84(uint64_t a1)
{
  return sub_24D1DA0E4(a1, &qword_26985BE50, 0xD000000000000012, 0x800000024D21B640, (uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t))sub_24D1C2054);
}

uint64_t sub_24D1DCABC()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BE50);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();

  return MEMORY[0x270FA0238](v0, v6 + 8, v5);
}

uint64_t sub_24D1DCBB8(uint64_t a1)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26985BE50) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v6 = (*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v7 = *(void *)(v1 + 16);
  uint64_t v8 = *(void *)(v1 + 24);
  uint64_t v9 = v1 + v5;
  uint64_t v10 = *(void *)(v1 + v6);
  uint64_t v11 = *(void *)(v1 + ((v6 + 15) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v12;
  *uint64_t v12 = v2;
  v12[1] = sub_24D1DCDD0;
  return sub_24D1B9FEC(a1, v7, v8, v9, v10, v11);
}

uint64_t sub_24D1DCCF0()
{
  return objectdestroy_116Tm(&qword_26985BE50);
}

uint64_t objectdestroy_116Tm(uint64_t *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 16) & ~v4;
  uint64_t v6 = v5 + *(void *)(v3 + 64);
  uint64_t v7 = v4 | 7;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1 + v5, v2);

  return MEMORY[0x270FA0238](v1, v6, v7);
}

uint64_t sub_24D1DCD88(uint64_t a1)
{
  return sub_24D1DA0E4(a1, &qword_26985BE50, 0xD000000000000012, 0x800000024D21B620, (uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t))sub_24D1C2054);
}

uint64_t sub_24D1DCDF4(uint64_t a1)
{
  uint64_t v2 = sub_24D218A00();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void (**)(char *))(a1 + 32);
  sub_24D2189D0();
  swift_retain();
  v6(v5);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_24D1DCEF0()
{
  swift_beginAccess();
  return MEMORY[0x253322B70](v0 + 16);
}

uint64_t sub_24D1DCF38(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(void *)(v2 + 24) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*sub_24D1DCF9C(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[5] = v1;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x253322B70](v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  v3[3] = v4;
  v3[4] = v5;
  return sub_24D1DD01C;
}

void sub_24D1DD01C(uint64_t a1, char a2)
{
  uint64_t v3 = *(void **)a1;
  *(void *)(*(void *)(*(void *)a1 + 40) + 24) = *(void *)(*(void *)a1 + 32);
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

uint64_t sub_24D1DD0A0()
{
  uint64_t v1 = sub_24D219020();
  v0[16] = v1;
  v0[17] = *(void *)(v1 - 8);
  v0[18] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D1DD15C, 0, 0);
}

uint64_t sub_24D1DD15C()
{
  *(void *)(v0 + 96) = MEMORY[0x263F8EE78];
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 152) = v1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A810);
  *uint64_t v1 = v0;
  v1[1] = sub_24D1DD254;
  return MEMORY[0x270FA2360](v0 + 88, 0, 0, 0x6953796772656E65, 0xEF29287344496574, sub_24D1DE71C, 0, v2);
}

uint64_t sub_24D1DD254()
{
  *(void *)(*(void *)v1 + 160) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24D1DDCCC;
  }
  else {
    uint64_t v2 = sub_24D1DD368;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

void sub_24D1DD368()
{
  int64_t v1 = 0;
  uint64_t v2 = *(void *)(v0 + 88);
  *(void *)(v0 + 168) = v2;
  char v3 = *(unsigned char *)(v2 + 32);
  *(unsigned char *)(v0 + 224) = v3;
  uint64_t v4 = 1 << v3;
  uint64_t v5 = *(void *)(v2 + 56);
  if (v4 < 64) {
    uint64_t v6 = ~(-1 << v4);
  }
  else {
    uint64_t v6 = -1;
  }
  unint64_t v7 = v6 & v5;
  if (!v7) {
    goto LABEL_6;
  }
LABEL_5:
  unint64_t v8 = __clz(__rbit64(v7));
  uint64_t v9 = (v7 - 1) & v7;
  unint64_t v10 = v8 | (v1 << 6);
  uint64_t v11 = *(void *)(v0 + 168);
  while (1)
  {
    *(void *)(v0 + 176) = v1;
    *(void *)(v0 + 184) = v9;
    uint64_t v17 = (uint64_t *)(*(void *)(v11 + 48) + 16 * v10);
    uint64_t v18 = *v17;
    unint64_t v19 = v17[1];
    *(void *)(v0 + 192) = v19;
    uint64_t v20 = (v19 & 0x2000000000000000) != 0 ? HIBYTE(v19) & 0xF : v18 & 0xFFFFFFFFFFFFLL;
    swift_bridgeObjectRetain();
    if (v20) {
      break;
    }
    swift_bridgeObjectRelease();
    int64_t v1 = *(void *)(v0 + 176);
    unint64_t v7 = *(void *)(v0 + 184);
    if (v7) {
      goto LABEL_5;
    }
LABEL_6:
    int64_t v12 = v1 + 1;
    if (__OFADD__(v1, 1))
    {
      __break(1u);
LABEL_33:
      __break(1u);
      return;
    }
    int64_t v13 = (unint64_t)((1 << *(unsigned char *)(v0 + 224)) + 63) >> 6;
    uint64_t v11 = *(void *)(v0 + 168);
    if (v12 >= v13) {
      goto LABEL_29;
    }
    uint64_t v14 = v11 + 56;
    unint64_t v15 = *(void *)(v11 + 56 + 8 * v12);
    ++v1;
    if (!v15)
    {
      int64_t v1 = v12 + 1;
      if (v12 + 1 >= v13) {
        goto LABEL_29;
      }
      unint64_t v15 = *(void *)(v14 + 8 * v1);
      if (!v15)
      {
        int64_t v1 = v12 + 2;
        if (v12 + 2 >= v13) {
          goto LABEL_29;
        }
        unint64_t v15 = *(void *)(v14 + 8 * v1);
        if (!v15)
        {
          int64_t v16 = v12 + 3;
          if (v16 >= v13)
          {
LABEL_29:
            swift_release();
            uint64_t v22 = *(void *)(v0 + 96);
            swift_task_dealloc();
            uint64_t v23 = *(void (**)(uint64_t))(v0 + 8);
            v23(v22);
            return;
          }
          unint64_t v15 = *(void *)(v14 + 8 * v16);
          if (!v15)
          {
            while (1)
            {
              int64_t v1 = v16 + 1;
              if (__OFADD__(v16, 1)) {
                goto LABEL_33;
              }
              if (v1 >= v13) {
                goto LABEL_29;
              }
              unint64_t v15 = *(void *)(v14 + 8 * v1);
              ++v16;
              if (v15) {
                goto LABEL_19;
              }
            }
          }
          int64_t v1 = v16;
        }
      }
    }
LABEL_19:
    uint64_t v9 = (v15 - 1) & v15;
    unint64_t v10 = __clz(__rbit64(v15)) + (v1 << 6);
  }
  uint64_t v21 = (void *)swift_task_alloc();
  *(void *)(v0 + 200) = v21;
  *uint64_t v21 = v0;
  v21[1] = sub_24D1DD594;
  sub_24D1D51D4(v18, v19);
}

uint64_t sub_24D1DD594(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 208) = a1;
  *(void *)(v3 + 216) = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v1) {
    uint64_t v4 = sub_24D1DDAC4;
  }
  else {
    uint64_t v4 = sub_24D1DD6C8;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_24D1DD6C8()
{
  uint64_t v1 = (void *)v0[26];
  if (!v1) {
    goto LABEL_4;
  }
  type metadata accessor for EnergySite();
  uint64_t v2 = (void *)swift_allocObject();
  v2[3] = objc_msgSend(self, sel_defaultCenter);
  v2[4] = 0;
  v2[5] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08A48]), sel_init);
  v2[7] = 0;
  swift_unknownObjectWeakInit();
  v2[2] = v1;
  uint64_t v3 = (void *)v2[5];
  id v4 = v1;
  objc_msgSend(v3, sel_setMaxConcurrentOperationCount_, 1);
  sub_24D218C80();
  uint64_t v5 = (void *)sub_24D2190E0();
  swift_bridgeObjectRelease();
  uint64_t v6 = (void *)v2[3];
  unint64_t v7 = (void *)v2[5];
  v0[6] = sub_24D1D9D60;
  v0[7] = v2;
  v0[2] = MEMORY[0x263EF8330];
  v0[3] = 1107296256;
  v0[4] = sub_24D1DCDF4;
  v0[5] = &block_descriptor_4;
  unint64_t v8 = _Block_copy(v0 + 2);
  id v9 = v5;
  id v10 = v7;
  swift_retain();
  swift_release();
  id v11 = objc_msgSend(v6, sel_addObserverForName_object_queue_usingBlock_, v9, 0, v10, v8);
  _Block_release(v8);

  v2[4] = v11;
  swift_unknownObjectRelease();
  uint64_t v12 = swift_retain();
  MEMORY[0x253322110](v12);
  if (*(void *)((v0[12] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v0[12] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    goto LABEL_34;
  }
LABEL_3:
  sub_24D2191E0();
  sub_24D2191B0();
  swift_release();
LABEL_4:
  int64_t v13 = v0[22];
  unint64_t v14 = v0[23];
  if (v14)
  {
LABEL_5:
    unint64_t v15 = __clz(__rbit64(v14));
    uint64_t v16 = (v14 - 1) & v14;
    unint64_t v17 = v15 | (v13 << 6);
    uint64_t v18 = v0[21];
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v19 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_33;
    }
    int64_t v20 = (unint64_t)((1 << *((unsigned char *)v0 + 224)) + 63) >> 6;
    uint64_t v18 = v0[21];
    if (v19 >= v20) {
      goto LABEL_29;
    }
    uint64_t v21 = v18 + 56;
    unint64_t v22 = *(void *)(v18 + 56 + 8 * v19);
    ++v13;
    if (!v22)
    {
      int64_t v13 = v19 + 1;
      if (v19 + 1 >= v20) {
        goto LABEL_29;
      }
      unint64_t v22 = *(void *)(v21 + 8 * v13);
      if (!v22)
      {
        int64_t v13 = v19 + 2;
        if (v19 + 2 >= v20) {
          goto LABEL_29;
        }
        unint64_t v22 = *(void *)(v21 + 8 * v13);
        if (!v22)
        {
          int64_t v23 = v19 + 3;
          if (v23 >= v20)
          {
LABEL_29:
            swift_release();
            uint64_t v30 = v0[12];
            swift_task_dealloc();
            uint64_t v31 = (uint64_t (*)(uint64_t))v0[1];
            return v31(v30);
          }
          unint64_t v22 = *(void *)(v21 + 8 * v23);
          if (!v22)
          {
            while (1)
            {
              int64_t v13 = v23 + 1;
              if (__OFADD__(v23, 1)) {
                break;
              }
              if (v13 >= v20) {
                goto LABEL_29;
              }
              unint64_t v22 = *(void *)(v21 + 8 * v13);
              ++v23;
              if (v22) {
                goto LABEL_19;
              }
            }
LABEL_33:
            __break(1u);
LABEL_34:
            sub_24D2191C0();
            goto LABEL_3;
          }
          int64_t v13 = v23;
        }
      }
    }
LABEL_19:
    uint64_t v16 = (v22 - 1) & v22;
    unint64_t v17 = __clz(__rbit64(v22)) + (v13 << 6);
LABEL_20:
    v0[22] = v13;
    v0[23] = v16;
    uint64_t v24 = (uint64_t *)(*(void *)(v18 + 48) + 16 * v17);
    uint64_t v25 = *v24;
    unint64_t v26 = v24[1];
    v0[24] = v26;
    uint64_t v27 = (v26 & 0x2000000000000000) != 0 ? HIBYTE(v26) & 0xF : v25 & 0xFFFFFFFFFFFFLL;
    swift_bridgeObjectRetain();
    if (v27) {
      break;
    }
    swift_bridgeObjectRelease();
    int64_t v13 = v0[22];
    unint64_t v14 = v0[23];
    if (v14) {
      goto LABEL_5;
    }
  }
  uint64_t v28 = (void *)swift_task_alloc();
  v0[25] = v28;
  void *v28 = v0;
  v28[1] = sub_24D1DD594;
  return sub_24D1D51D4(v25, v26);
}

void sub_24D1DDAC4()
{
  int64_t v1 = *(void *)(v0 + 176);
  unint64_t v2 = *(void *)(v0 + 184);
  if (!v2) {
    goto LABEL_3;
  }
LABEL_2:
  unint64_t v3 = __clz(__rbit64(v2));
  uint64_t v4 = (v2 - 1) & v2;
  unint64_t v5 = v3 | (v1 << 6);
  uint64_t v6 = *(void *)(v0 + 168);
  while (1)
  {
    *(void *)(v0 + 176) = v1;
    *(void *)(v0 + 184) = v4;
    uint64_t v12 = (uint64_t *)(*(void *)(v6 + 48) + 16 * v5);
    uint64_t v13 = *v12;
    unint64_t v14 = v12[1];
    *(void *)(v0 + 192) = v14;
    uint64_t v15 = (v14 & 0x2000000000000000) != 0 ? HIBYTE(v14) & 0xF : v13 & 0xFFFFFFFFFFFFLL;
    swift_bridgeObjectRetain();
    if (v15) {
      break;
    }
    swift_bridgeObjectRelease();
    int64_t v1 = *(void *)(v0 + 176);
    unint64_t v2 = *(void *)(v0 + 184);
    if (v2) {
      goto LABEL_2;
    }
LABEL_3:
    int64_t v7 = v1 + 1;
    if (__OFADD__(v1, 1))
    {
      __break(1u);
LABEL_30:
      __break(1u);
      return;
    }
    int64_t v8 = (unint64_t)((1 << *(unsigned char *)(v0 + 224)) + 63) >> 6;
    uint64_t v6 = *(void *)(v0 + 168);
    if (v7 >= v8) {
      goto LABEL_26;
    }
    uint64_t v9 = v6 + 56;
    unint64_t v10 = *(void *)(v6 + 56 + 8 * v7);
    ++v1;
    if (!v10)
    {
      int64_t v1 = v7 + 1;
      if (v7 + 1 >= v8) {
        goto LABEL_26;
      }
      unint64_t v10 = *(void *)(v9 + 8 * v1);
      if (!v10)
      {
        int64_t v1 = v7 + 2;
        if (v7 + 2 >= v8) {
          goto LABEL_26;
        }
        unint64_t v10 = *(void *)(v9 + 8 * v1);
        if (!v10)
        {
          int64_t v11 = v7 + 3;
          if (v11 >= v8)
          {
LABEL_26:
            swift_release();
            uint64_t v17 = *(void *)(v0 + 96);
            swift_task_dealloc();
            uint64_t v18 = *(void (**)(uint64_t))(v0 + 8);
            v18(v17);
            return;
          }
          unint64_t v10 = *(void *)(v9 + 8 * v11);
          if (!v10)
          {
            while (1)
            {
              int64_t v1 = v11 + 1;
              if (__OFADD__(v11, 1)) {
                goto LABEL_30;
              }
              if (v1 >= v8) {
                goto LABEL_26;
              }
              unint64_t v10 = *(void *)(v9 + 8 * v1);
              ++v11;
              if (v10) {
                goto LABEL_16;
              }
            }
          }
          int64_t v1 = v11;
        }
      }
    }
LABEL_16:
    uint64_t v4 = (v10 - 1) & v10;
    unint64_t v5 = __clz(__rbit64(v10)) + (v1 << 6);
  }
  uint64_t v16 = (void *)swift_task_alloc();
  *(void *)(v0 + 200) = v16;
  *uint64_t v16 = v0;
  v16[1] = sub_24D1DD594;
  sub_24D1D51D4(v13, v14);
}

uint64_t sub_24D1DDCCC()
{
  uint64_t v25 = v0;
  if (qword_26B18A2F8 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[16];
  unint64_t v2 = (void *)v0[20];
  uint64_t v4 = v0[17];
  uint64_t v3 = v0[18];
  uint64_t v5 = __swift_project_value_buffer(v1, (uint64_t)qword_26B18A8F0);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v3, v5, v1);
  id v6 = v2;
  id v7 = v2;
  int64_t v8 = sub_24D219000();
  os_log_type_t v9 = sub_24D2192D0();
  BOOL v10 = os_log_type_enabled(v8, v9);
  int64_t v11 = (void *)v0[20];
  uint64_t v13 = v0[17];
  uint64_t v12 = v0[18];
  uint64_t v14 = v0[16];
  if (v10)
  {
    uint64_t v23 = v0[18];
    uint64_t v15 = swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    uint64_t v24 = v22;
    *(_DWORD *)uint64_t v15 = 136315394;
    v0[15] = sub_24D1D0A78(0x7365746973, 0xE500000000000000, &v24);
    sub_24D219310();
    *(_WORD *)(v15 + 12) = 2080;
    v0[13] = v11;
    id v16 = v11;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5D0);
    uint64_t v17 = sub_24D219100();
    v0[14] = sub_24D1D0A78(v17, v18, &v24);
    sub_24D219310();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_24D1B6000, v8, v9, "%s error: %s", (uint8_t *)v15, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x253322AA0](v22, -1, -1);
    MEMORY[0x253322AA0](v15, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v23, v14);
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
  }
  uint64_t v19 = v0[12];
  swift_task_dealloc();
  int64_t v20 = (uint64_t (*)(uint64_t))v0[1];
  return v20(v19);
}

uint64_t static EnergyKitManager.energySiteIDs()()
{
  return MEMORY[0x270FA2498](sub_24D1DDFC8, 0, 0);
}

uint64_t sub_24D1DDFC8()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A810);
  *uint64_t v1 = v0;
  v1[1] = sub_24D1DE0B4;
  return MEMORY[0x270FA2360](v0 + 16, 0, 0, 0x6953796772656E65, 0xEF29287344496574, sub_24D1DE71C, 0, v2);
}

uint64_t sub_24D1DE0B4()
{
  *(void *)(*(void *)v1 + 32) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24D1C4318;
  }
  else {
    uint64_t v2 = sub_24D1DE1C8;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D1DE1C8()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 16));
}

void *EnergyKitManager.__allocating_init(delegate:queue:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (void *)swift_allocObject();
  v5[3] = 0;
  swift_unknownObjectWeakInit();
  v5[4] = objc_msgSend(self, sel_defaultCenter);
  swift_beginAccess();
  v5[3] = a2;
  swift_unknownObjectWeakAssign();
  v5[5] = a3;
  sub_24D1DE36C();
  swift_unknownObjectRelease();
  return v5;
}

void *EnergyKitManager.init(delegate:queue:)(uint64_t a1, uint64_t a2, void *a3)
{
  v3[3] = 0;
  swift_unknownObjectWeakInit();
  v3[4] = objc_msgSend(self, sel_defaultCenter);
  swift_beginAccess();
  v3[3] = a2;
  swift_unknownObjectWeakAssign();
  v3[5] = a3;
  id v6 = a3;
  sub_24D1DE36C();
  swift_unknownObjectRelease();

  return v3;
}

void sub_24D1DE36C()
{
  sub_24D218C80();
  uint64_t v1 = (void *)sub_24D2190E0();
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void **)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 40);
  v7[4] = sub_24D1DF4C8;
  uint64_t v8 = v0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 1107296256;
  v7[2] = sub_24D1DCDF4;
  v7[3] = &block_descriptor_11;
  uint64_t v4 = _Block_copy(v7);
  id v5 = v1;
  swift_retain();
  swift_release();
  id v6 = objc_msgSend(v2, sel_addObserverForName_object_queue_usingBlock_, v5, 0, v3, v4);
  _Block_release(v4);
  swift_unknownObjectRelease();
}

uint64_t sub_24D1DE480(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_24D2189F0();
  if (!v3)
  {
    long long v22 = 0u;
    long long v23 = 0u;
LABEL_11:
    sub_24D1DF4D0((uint64_t)&v22);
    goto LABEL_12;
  }
  uint64_t v4 = v3;
  sub_24D218C30();
  sub_24D2193A0();
  if (*(void *)(v4 + 16) && (unint64_t v5 = sub_24D1D126C((uint64_t)&v20), (v6 & 1) != 0))
  {
    sub_24D1D6414(*(void *)(v4 + 56) + 32 * v5, (uint64_t)&v22);
  }
  else
  {
    long long v22 = 0u;
    long long v23 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_24D1D98B8((uint64_t)&v20);
  if (!*((void *)&v23 + 1)) {
    goto LABEL_11;
  }
  if (swift_dynamicCast())
  {
    uint64_t v7 = v20;
    uint64_t v8 = v21;
    swift_beginAccess();
    if (MEMORY[0x253322B70](a2 + 16))
    {
      uint64_t v9 = *(void *)(a2 + 24);
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 8))(v7, v8, ObjectType, v9);
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
LABEL_12:
  uint64_t v11 = sub_24D2189F0();
  if (!v11)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    return sub_24D1DF4D0((uint64_t)&v22);
  }
  uint64_t v12 = v11;
  sub_24D218C40();
  sub_24D2193A0();
  if (*(void *)(v12 + 16) && (unint64_t v13 = sub_24D1D126C((uint64_t)&v20), (v14 & 1) != 0))
  {
    sub_24D1D6414(*(void *)(v12 + 56) + 32 * v13, (uint64_t)&v22);
  }
  else
  {
    long long v22 = 0u;
    long long v23 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_24D1D98B8((uint64_t)&v20);
  if (!*((void *)&v23 + 1)) {
    return sub_24D1DF4D0((uint64_t)&v22);
  }
  uint64_t result = swift_dynamicCast();
  if (result)
  {
    uint64_t v16 = v20;
    uint64_t v17 = v21;
    swift_beginAccess();
    if (MEMORY[0x253322B70](a2 + 16))
    {
      uint64_t v18 = *(void *)(a2 + 24);
      uint64_t v19 = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v18 + 16))(v16, v17, v19, v18);
      swift_bridgeObjectRelease();
      return swift_unknownObjectRelease();
    }
    else
    {
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t sub_24D1DE71C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BF10);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5B0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_24D219240();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  unint64_t v9 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = 0;
  *(void *)(v10 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v10 + v9, (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
  sub_24D1BA610((uint64_t)v7, (uint64_t)&unk_26985BF20, v10);
  return swift_release();
}

uint64_t sub_24D1DE8E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[18] = a4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BF10);
  v4[19] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v4[20] = v6;
  v4[21] = *(void *)(v6 + 64);
  v4[22] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D1DE9B0, 0, 0);
}

uint64_t sub_24D1DE9B0()
{
  uint64_t v1 = v0[22];
  uint64_t v2 = v0[19];
  uint64_t v3 = v0[20];
  uint64_t v4 = v0[18];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[23] = sub_24D217288();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v6 + v5, v1, v2);
  uint64_t v7 = (void *)sub_24D217944((uint64_t)sub_24D1DF784, v6);
  v0[24] = v7;
  swift_release();
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_24D1DEB88;
  uint64_t v8 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_24D1DF0F0;
  v0[13] = &block_descriptor_16;
  v0[14] = v8;
  objc_msgSend(v7, sel_getAllSiteIDsWithCompletionHandler_, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_24D1DEB88()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 200) = v1;
  if (v1) {
    uint64_t v2 = sub_24D1DED38;
  }
  else {
    uint64_t v2 = sub_24D1DEC98;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D1DEC98()
{
  uint64_t v1 = v0[23];
  uint64_t v2 = v0[15];
  swift_unknownObjectRelease();
  objc_msgSend(*(id *)(v1 + 16), sel_invalidate);
  v0[17] = v2;
  sub_24D219220();
  swift_release();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_24D1DED38()
{
  uint64_t v1 = v0[25];
  swift_willThrow();
  swift_release();
  swift_unknownObjectRelease();
  v0[16] = v1;
  sub_24D219210();
  swift_task_dealloc();
  uint64_t v2 = (uint64_t (*)(void))v0[1];
  return v2();
}

uint64_t sub_24D1DEDE4(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_24D219020();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B18A2F8 != -1) {
    swift_once();
  }
  uint64_t v8 = __swift_project_value_buffer(v4, (uint64_t)qword_26B18A8F0);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  id v9 = a1;
  id v10 = a1;
  uint64_t v11 = sub_24D219000();
  os_log_type_t v12 = sub_24D2192D0();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v21 = a2;
    uint64_t v14 = v13;
    uint64_t v15 = swift_slowAlloc();
    uint64_t v23 = v15;
    *(_DWORD *)uint64_t v14 = 136315394;
    uint64_t v22 = sub_24D1D0A78(0x6953796772656E65, 0xEF29287344496574, &v23);
    sub_24D219310();
    *(_WORD *)(v14 + 12) = 2080;
    uint64_t v22 = (uint64_t)a1;
    id v16 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5D0);
    uint64_t v17 = sub_24D219100();
    uint64_t v22 = sub_24D1D0A78(v17, v18, &v23);
    sub_24D219310();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_24D1B6000, v11, v12, "%s error: %s", (uint8_t *)v14, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x253322AA0](v15, -1, -1);
    MEMORY[0x253322AA0](v14, -1, -1);
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v23 = (uint64_t)a1;
  id v19 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985BF10);
  return sub_24D219210();
}

uint64_t sub_24D1DF0F0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5D0);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return MEMORY[0x270FA2410](v3, v5);
  }
  else
  {
    **(void **)(*(void *)(v3 + 64) + 40) = sub_24D219270();
    return swift_continuation_throwingResume();
  }
}

uint64_t EnergyKitManager.deinit()
{
  sub_24D1D667C(v0 + 16);

  return v0;
}

uint64_t EnergyKitManager.__deallocating_deinit()
{
  sub_24D1D667C(v0 + 16);

  return MEMORY[0x270FA0228](v0, 48, 7);
}

uint64_t sub_24D1DF238@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *a1 + 16;
  swift_beginAccess();
  uint64_t result = MEMORY[0x253322B70](v4);
  uint64_t v6 = *(void *)(v3 + 24);
  *a2 = result;
  a2[1] = v6;
  return result;
}

uint64_t sub_24D1DF294(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *a2;
  swift_beginAccess();
  *(void *)(v3 + 24) = v2;
  return swift_unknownObjectWeakAssign();
}

uint64_t dispatch thunk of EnergyKitManagerDelegate.energySiteAdded(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of EnergyKitManagerDelegate.energySiteDeleted(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t type metadata accessor for EnergyKitManager()
{
  return self;
}

uint64_t method lookup function for EnergyKitManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for EnergyKitManager);
}

uint64_t dispatch thunk of EnergyKitManager.delegate.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of EnergyKitManager.delegate.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of EnergyKitManager.delegate.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of EnergyKitManager.sites.getter()
{
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(*(void *)v0 + 128) + **(int **)(*(void *)v0 + 128));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_24D1B8FC4;
  return v4();
}

uint64_t dispatch thunk of EnergyKitManager.__allocating_init(delegate:queue:)()
{
  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t sub_24D1DF4C8(uint64_t a1)
{
  return sub_24D1DE480(a1, v1);
}

uint64_t sub_24D1DF4D0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5D8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24D1DF530()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BF10);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_24D1DF600(uint64_t a1)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26985BF10) - 8);
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t v7 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_24D1D770C;
  return sub_24D1DE8E4(a1, v5, v6, v7);
}

uint64_t sub_24D1DF6F0()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BF10);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_24D1DF784(void *a1)
{
  uint64_t v3 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26985BF10) - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_24D1DEDE4(a1, v4);
}

uint64_t defaultLogger(_:)@<X0>(unsigned char *a1@<X0>, uint64_t a2@<X8>)
{
  switch(*a1)
  {
    case 1:
      if (qword_26985BA68 != -1) {
        swift_once();
      }
      uint64_t v3 = sub_24D219020();
      uint64_t v4 = v3;
      uint64_t v5 = qword_26985D068;
      break;
    case 2:
      if (qword_26B18A2F8 != -1) {
        swift_once();
      }
      uint64_t v3 = sub_24D219020();
      uint64_t v4 = v3;
      uint64_t v5 = qword_26B18A8F0;
      break;
    case 3:
      if (qword_26985BA70 != -1) {
        swift_once();
      }
      uint64_t v3 = sub_24D219020();
      uint64_t v4 = v3;
      uint64_t v5 = qword_26985D080;
      break;
    default:
      if (qword_26B18A8E8 != -1) {
        swift_once();
      }
      uint64_t v3 = sub_24D219020();
      uint64_t v4 = v3;
      uint64_t v5 = qword_26B18A908;
      break;
  }
  uint64_t v6 = __swift_project_value_buffer(v3, (uint64_t)v5);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, v6, v4);
}

uint64_t sub_24D1DF9CC()
{
  sub_24D1E041C();
  uint64_t result = sub_24D219300();
  qword_26985D060 = result;
  return result;
}

uint64_t sub_24D1DFA28(uint64_t a1)
{
  return sub_24D1DFEF4(a1, qword_26B18A908);
}

uint64_t sub_24D1DFA44(uint64_t a1)
{
  return sub_24D1DFEF4(a1, qword_26B18A8F0);
}

uint64_t sub_24D1DFA70(uint64_t a1)
{
  return sub_24D1DFEF4(a1, qword_26985D068);
}

uint64_t sub_24D1DFA8C(uint64_t a1)
{
  return sub_24D1DFEF4(a1, qword_26985D080);
}

uint64_t sub_24D1DFAB0()
{
  uint64_t v0 = sub_24D218FF0();
  __swift_allocate_value_buffer(v0, qword_26985D098);
  __swift_project_value_buffer(v0, (uint64_t)qword_26985D098);
  return sub_24D218FE0();
}

uint64_t Logging.description.getter()
{
  return *(void *)&aShared_0[8 * *v0];
}

EnergyKit::Logging_optional __swiftcall Logging.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 4;
  if ((unint64_t)rawValue < 4) {
    char v2 = rawValue;
  }
  *uint64_t v1 = v2;
  return (EnergyKit::Logging_optional)rawValue;
}

uint64_t Logging.rawValue.getter()
{
  return *v0;
}

EnergyKit::Logging_optional sub_24D1DFB6C(Swift::Int *a1)
{
  return Logging.init(rawValue:)(*a1);
}

void sub_24D1DFB74(void *a1@<X8>)
{
  *a1 = *v1;
}

void setDefaultLog(_:)(void *a1)
{
  if (qword_26985BA60 != -1) {
    swift_once();
  }
  id v3 = (id)qword_26985D060;
  qword_26985D060 = (uint64_t)a1;
  id v2 = a1;
}

uint64_t setDefaultDaemonLogger(_:)(uint64_t a1)
{
  return sub_24D1DFC94(a1, &qword_26985BA68, (uint64_t)qword_26985D068);
}

uint64_t setDefaultFrameworkLogger(_:)(uint64_t a1)
{
  return sub_24D1DFC94(a1, &qword_26B18A2F8, (uint64_t)qword_26B18A8F0);
}

uint64_t setDefaultAnalyticsLogger(_:)(uint64_t a1)
{
  return sub_24D1DFC94(a1, &qword_26985BA70, (uint64_t)qword_26985D080);
}

uint64_t setDefaultLogger(_:)(uint64_t a1)
{
  return sub_24D1DFC94(a1, &qword_26B18A8E8, (uint64_t)qword_26B18A908);
}

uint64_t sub_24D1DFC94(uint64_t a1, void *a2, uint64_t a3)
{
  if (*a2 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_24D219020();
  uint64_t v6 = __swift_project_value_buffer(v5, a3);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 24))(v6, a1, v5);
  return swift_endAccess();
}

id defaultLog()()
{
  if (qword_26985BA60 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_26985D060;

  return v0;
}

Swift::Void __swiftcall setProcessName(_:)(Swift::String a1)
{
  xmmword_26985BF28 = (__int128)a1;
  swift_bridgeObjectRelease();

  swift_bridgeObjectRetain();
}

Swift::String_optional __swiftcall processName()()
{
  unsigned long long v0 = xmmword_26985BF28;
  swift_bridgeObjectRetain();
  id v2 = (void *)(v0 >> 64);
  uint64_t v1 = v0;
  result.value._object = v2;
  result.value._uint64_t countAndFlagsBits = v1;
  return result;
}

uint64_t ekSignposter()@<X0>(uint64_t a1@<X8>)
{
  if (qword_26985BA78 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_24D218FF0();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26985D098);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_24D1DFED0(uint64_t a1)
{
  return sub_24D1DFEF4(a1, qword_26985D0B0);
}

uint64_t sub_24D1DFEF4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_24D219020();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_24D219010();
}

Swift::Void __swiftcall logMilestone(tag:description:)(Swift::String tag, Swift::String description)
{
  object = description._object;
  uint64_t countAndFlagsBits = description._countAndFlagsBits;
  uint64_t v4 = tag._object;
  uint64_t v5 = tag._countAndFlagsBits;
  uint64_t v6 = sub_24D219020();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  id v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26985BA80 != -1) {
    swift_once();
  }
  uint64_t v10 = __swift_project_value_buffer(v6, (uint64_t)qword_26985D0B0);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v10, v6);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v11 = sub_24D219000();
  os_log_type_t v12 = sub_24D2192C0();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    uint64_t v18 = v16;
    *(_DWORD *)uint64_t v13 = 136315394;
    uint64_t v15 = countAndFlagsBits;
    swift_bridgeObjectRetain();
    uint64_t v17 = sub_24D1D0A78(v5, (unint64_t)v4, &v18);
    sub_24D219310();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v13 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v17 = sub_24D1D0A78(v15, (unint64_t)object, &v18);
    sub_24D219310();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24D1B6000, v11, v12, "(%s) %s", (uint8_t *)v13, 0x16u);
    uint64_t v14 = v16;
    swift_arrayDestroy();
    MEMORY[0x253322AA0](v14, -1, -1);
    MEMORY[0x253322AA0](v13, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

unint64_t sub_24D1E0234()
{
  unint64_t result = qword_26985BF38;
  if (!qword_26985BF38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26985BF38);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for Logging(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
  if (a2 + 3 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 3) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
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
      return (*a1 | (v4 << 8)) - 3;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for Logging(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *unint64_t result = a2 + 3;
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
        JUMPOUT(0x24D1E03E4);
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
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Logging()
{
  return &type metadata for Logging;
}

unint64_t sub_24D1E041C()
{
  unint64_t result = qword_26985BF40;
  if (!qword_26985BF40)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26985BF40);
  }
  return result;
}

void EnergyTrends.interval.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t EnergyTrends.usages.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t EnergyTrends.timeZone.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for EnergyTrends() + 24);
  uint64_t v4 = sub_24D218BB0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t type metadata accessor for EnergyTrends()
{
  uint64_t result = qword_26B18A830;
  if (!qword_26B18A830) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t EnergyTrends.debugIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for EnergyTrends() + 28));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t EnergyTrends.calendar.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for EnergyTrends() + 32);
  uint64_t v4 = sub_24D218B80();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t EnergyTrends.calendar.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for EnergyTrends() + 32);
  uint64_t v4 = sub_24D218B80();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40);

  return v5(v3, a1, v4);
}

uint64_t (*EnergyTrends.calendar.modify())()
{
  return nullsub_1;
}

uint64_t EnergyTrends.init(response:timeZone:debugIdentifier:)@<X0>(unsigned char *a1@<X0>, char *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v37 = a3;
  uint64_t v38 = a4;
  uint64_t v40 = a5;
  uint64_t v41 = a2;
  uint64_t v36 = sub_24D218B20();
  uint64_t v6 = *(void *)(v36 - 8);
  MEMORY[0x270FA5388](v36);
  int v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = sub_24D218B80();
  uint64_t v35 = *(void *)(v39 - 8);
  MEMORY[0x270FA5388](v39);
  uint64_t v33 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for EnergyTrends();
  uint64_t v11 = (int *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_24D218BB0();
  uint64_t v31 = *(void *)(v14 - 8);
  uint64_t v15 = v31;
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v32 = (char *)&v30 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  id v19 = (char *)&v30 - v18;
  uint64_t v20 = *(int *)(type metadata accessor for EnergySite.HistoricalEnergyUsage(0) + 24);
  uint64_t v34 = a1;
  uint64_t v21 = *(void *)&a1[v20];
  char v22 = *a1;
  uint64_t v23 = *(void (**)(char *, char *, uint64_t))(v15 + 16);
  uint64_t v30 = v23;
  v23(v19, v41, v14);
  *uint64_t v13 = v22;
  v23(&v13[v11[8]], v19, v14);
  uint64_t v24 = &v13[v11[9]];
  uint64_t v25 = v36;
  uint64_t v26 = v38;
  *(void *)uint64_t v24 = v37;
  *((void *)v24 + 1) = v26;
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x263F07740], v25);
  swift_bridgeObjectRetain();
  uint64_t v27 = v33;
  sub_24D218B30();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v25);
  (*(void (**)(char *, char *, uint64_t))(v35 + 32))(&v13[v11[10]], v27, v39);
  v30(v32, v19, v14);
  sub_24D218B60();
  uint64_t v28 = *(void (**)(char *, uint64_t))(v31 + 8);
  v28(v19, v14);
  *((void *)v13 + 1) = v21;
  sub_24D1E905C((uint64_t)v13, v40, (uint64_t (*)(void))type metadata accessor for EnergyTrends);
  v28(v41, v14);
  return sub_24D1E604C((uint64_t)v34, type metadata accessor for EnergySite.HistoricalEnergyUsage);
}

uint64_t EnergyTrends.init(usages:interval:timeZone:debugIdentifier:)@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v30 = a4;
  uint64_t v31 = a5;
  uint64_t v33 = a1;
  uint64_t v29 = sub_24D218BB0();
  uint64_t v26 = *(void *)(v29 - 8);
  uint64_t v9 = v26;
  MEMORY[0x270FA5388](v29);
  uint64_t v32 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_24D218B20();
  uint64_t v11 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388](v27);
  uint64_t v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = sub_24D218B80();
  uint64_t v14 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388](v28);
  uint64_t v16 = (char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(unsigned char *)a6 = *a2;
  uint64_t v17 = (int *)type metadata accessor for EnergyTrends();
  uint64_t v18 = a6 + v17[6];
  uint64_t v25 = *(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16);
  uint64_t v19 = v29;
  v25(v18, a3, v29);
  uint64_t v20 = (void *)(a6 + v17[7]);
  uint64_t v21 = v31;
  *uint64_t v20 = v30;
  v20[1] = v21;
  uint64_t v22 = v27;
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v13, *MEMORY[0x263F07740], v27);
  sub_24D218B30();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v22);
  (*(void (**)(uint64_t, char *, uint64_t))(v14 + 32))(a6 + v17[8], v16, v28);
  v25((uint64_t)v32, a3, v19);
  sub_24D218B60();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v26 + 8))(a3, v19);
  *(void *)(a6 + 8) = v33;
  return result;
}

uint64_t sub_24D1E0D3C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10 = sub_24D218B70();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)v22 - v15;
  if (a2)
  {
    v22[1] = a4;
    uint64_t v17 = (char)*a3;
    switch(*a3)
    {
      case 3:
        swift_bridgeObjectRelease();
        goto LABEL_6;
      default:
        char v19 = sub_24D2194E0();
        swift_bridgeObjectRelease();
        if ((v19 & 1) == 0)
        {
          (*(void (**)(char *, void, uint64_t))(v11 + 104))(v14, **((unsigned int **)&unk_265301910 + v17), v10);
          sub_24D218F70();
          (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
          goto LABEL_10;
        }
LABEL_6:
        if ((unsigned __int128)(a2 * (__int128)26) >> 64 == (26 * a2) >> 63)
        {
          if ((unsigned __int128)(26 * a2 * (__int128)7) >> 64 == (182 * a2) >> 63)
          {
            (*(void (**)(char *, void, uint64_t))(v11 + 104))(v16, *MEMORY[0x263F07870], v10);
            sub_24D218F70();
            (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
            goto LABEL_10;
          }
        }
        else
        {
          __break(1u);
        }
        __break(1u);
        JUMPOUT(0x24D1E1038);
    }
  }
  uint64_t v18 = sub_24D218AC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 16))(a5, a1, v18);
LABEL_10:
  uint64_t v20 = sub_24D218AC0();
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(a5, 0, 1, v20);
}

uint64_t static EnergyTrends.displayIntervalToCalendarComponent(_:)@<X0>(unsigned char *a1@<X0>, uint64_t a2@<X8>)
{
  switch(*a1)
  {
    case 1:
      uint64_t v3 = (unsigned int *)MEMORY[0x263F07830];
      break;
    case 2:
    case 3:
      uint64_t v3 = (unsigned int *)MEMORY[0x263F078A8];
      break;
    case 4:
      uint64_t v3 = (unsigned int *)MEMORY[0x263F078A0];
      break;
    default:
      uint64_t v3 = (unsigned int *)MEMORY[0x263F07870];
      break;
  }
  uint64_t v4 = *v3;
  uint64_t v5 = sub_24D218B70();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 104);

  return v6(a2, v4, v5);
}

double EnergyTrends.dailyAverageChangeForInterval(starting:)(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BC48);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = ((char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  char v16 = *v1;
  uint64_t v6 = type metadata accessor for EnergyTrends();
  static EnergyTrends.intervalDateRangeStartingAt(_:displayInterval:with:)(a1, &v16, (uint64_t)&v1[*(int *)(v6 + 32)], (uint64_t)v5);
  uint64_t v7 = EnergyTrends.totalImportsForDateRange(_:)((uint64_t)v5);
  double v9 = v8;
  uint64_t v10 = v7;
  EnergyTrends.totalExportsForDateRange(_:)(v5);
  double v12 = v11;
  sub_24D1D9A80((uint64_t)v5, &qword_26985BC48);
  if (v10) {
    double v13 = (v9 - v12) / (double)v10;
  }
  else {
    double v13 = 0.0;
  }
  return v13 - EnergyTrends.previousDailyAverageImportsForInterval(starting:)();
}

uint64_t EnergyTrends.calculateDeltaNetImports(startDate:)(uint64_t a1)
{
  return sub_24D1E6850(a1, (void (*)(char *))EnergyTrends.totalImportsForDateRange(_:), (void (*)(char *))EnergyTrends.totalExportsForDateRange(_:), (double (*)(uint64_t))EnergyTrends.previousDailyAverageImportsForInterval(starting:));
}

double EnergyTrends.dailyAveragePercentageChangeForInterval(starting:)(uint64_t a1)
{
  EnergyTrends.calculatedAvgIntervalNetImportPercentChange(startDate:)(a1);
  return (double)v1;
}

void EnergyTrends.calculatedAvgIntervalNetImportPercentChange(startDate:)(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BC48);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = ((char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  char v17 = *v1;
  uint64_t v6 = type metadata accessor for EnergyTrends();
  static EnergyTrends.intervalDateRangeStartingAt(_:displayInterval:with:)(a1, &v17, (uint64_t)&v1[*(int *)(v6 + 32)], (uint64_t)v5);
  uint64_t v7 = EnergyTrends.totalImportsForDateRange(_:)((uint64_t)v5);
  double v9 = v8;
  uint64_t v10 = v7;
  EnergyTrends.totalExportsForDateRange(_:)(v5);
  double v12 = v11;
  sub_24D1D9A80((uint64_t)v5, &qword_26985BC48);
  if (v10) {
    double v13 = (v9 - v12) / (double)v10;
  }
  else {
    double v13 = 0.0;
  }
  double v14 = EnergyTrends.previousDailyAverageImportsForInterval(starting:)();
  if (v14 != 0.0)
  {
    double v15 = rint((v13 / v14 + -1.0) * 100.0);
    if ((~*(void *)&v15 & 0x7FF0000000000000) != 0)
    {
      if (v15 > -9.22337204e18)
      {
        if (v15 < 9.22337204e18) {
          return;
        }
LABEL_12:
        __break(1u);
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_12;
  }
}

uint64_t EnergyTrends.adjustRequestedDateForAvailableData(from:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v172 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BC48);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  v184 = (char *)&v168 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v188 = (uint64_t)&v168 - v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v200 = (uint64_t)&v168 - v9;
  uint64_t v10 = type metadata accessor for EnergySite.EnergyUsage(0);
  uint64_t v189 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10 - 8);
  v193 = (unint64_t *)((char *)&v168 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A610);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  uint64_t v183 = (uint64_t)&v168 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  v197 = (char *)&v168 - v15;
  uint64_t v178 = type metadata accessor for EnergyTrends();
  uint64_t v16 = MEMORY[0x270FA5388](v178);
  uint64_t v170 = (uint64_t)&v168 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v187 = (uint64_t)&v168 - v19;
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  v179 = (void (**)(char *, char *, uint64_t))((char *)&v168 - v21);
  MEMORY[0x270FA5388](v20);
  v205 = (unsigned __int8 *)&v168 - v22;
  uint64_t v23 = sub_24D219020();
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  v171 = (char *)&v168 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = MEMORY[0x270FA5388](v25);
  v199 = (char *)&v168 - v28;
  uint64_t v29 = MEMORY[0x270FA5388](v27);
  v198 = (char **)((char *)&v168 - v30);
  MEMORY[0x270FA5388](v29);
  uint64_t v32 = (char **)((char *)&v168 - v31);
  uint64_t v33 = sub_24D218AC0();
  uint64_t v34 = *(void *)(v33 - 8);
  uint64_t v35 = MEMORY[0x270FA5388](v33);
  v169 = (char *)&v168 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = MEMORY[0x270FA5388](v35);
  v182 = (char *)&v168 - v38;
  uint64_t v39 = MEMORY[0x270FA5388](v37);
  v186 = (char *)&v168 - v40;
  uint64_t v41 = MEMORY[0x270FA5388](v39);
  v185 = (char *)&v168 - v42;
  uint64_t v43 = MEMORY[0x270FA5388](v41);
  v206 = (char *)&v168 - v44;
  uint64_t v45 = MEMORY[0x270FA5388](v43);
  v181 = (char *)&v168 - v46;
  uint64_t v47 = MEMORY[0x270FA5388](v45);
  v180 = (uint64_t (**)(uint64_t, uint64_t, uint64_t))((char *)&v168 - v48);
  uint64_t v49 = MEMORY[0x270FA5388](v47);
  v204 = (char *)&v168 - v50;
  uint64_t v51 = MEMORY[0x270FA5388](v49);
  uint64_t v53 = (char *)&v168 - v52;
  MEMORY[0x270FA5388](v51);
  uint64_t v207 = v34;
  uint64_t v56 = *(void (**)(void))(v34 + 16);
  uint64_t v54 = v34 + 16;
  uint64_t v55 = v56;
  v201 = (char *)&v168 - v57;
  v56();
  uint64_t v213 = 0;
  if (qword_26B18A2F8 != -1) {
    swift_once();
  }
  uint64_t v58 = __swift_project_value_buffer(v23, (uint64_t)qword_26B18A8F0);
  swift_beginAccess();
  uint64_t v59 = *(void (**)(char **, uint64_t, uint64_t))(v24 + 16);
  uint64_t v192 = v58;
  uint64_t v191 = v24 + 16;
  v190 = v59;
  v59(v32, v58, v23);
  v208 = v2;
  sub_24D1E5FE4((uint64_t)v2, (uint64_t)v205, (uint64_t (*)(void))type metadata accessor for EnergyTrends);
  uint64_t v173 = a1;
  uint64_t v196 = v54;
  v195 = v55;
  ((void (*)(char *, uint64_t, uint64_t))v55)(v53, a1, v33);
  uint64_t v60 = sub_24D219000();
  os_log_type_t v61 = sub_24D2192E0();
  BOOL v62 = os_log_type_enabled(v60, v61);
  uint64_t v63 = MEMORY[0x263F8EE58];
  uint64_t v202 = v23;
  uint64_t v194 = v33;
  uint64_t v64 = v32;
  uint64_t v65 = v24;
  uint64_t v203 = v24;
  if (v62)
  {
    uint64_t v66 = swift_slowAlloc();
    v177 = (unsigned __int8 **)swift_slowAlloc();
    v212 = v177;
    *(_DWORD *)uint64_t v66 = 136315650;
    uint64_t v211 = sub_24D1D0A78(0xD00000000000002ALL, 0x800000024D21BFA0, (uint64_t *)&v212);
    sub_24D219310();
    *(_WORD *)(v66 + 12) = 2080;
    uint64_t v67 = *(int *)(v178 + 28);
    *(void *)&long long v176 = v64;
    uint64_t v68 = v205;
    uint64_t v69 = (uint64_t *)&v205[v67];
    uint64_t v70 = *v69;
    unint64_t v71 = v69[1];
    swift_bridgeObjectRetain();
    uint64_t v211 = sub_24D1D0A78(v70, v71, (uint64_t *)&v212);
    sub_24D219310();
    swift_bridgeObjectRelease();
    sub_24D1E604C((uint64_t)v68, (uint64_t (*)(void))type metadata accessor for EnergyTrends);
    *(_WORD *)(v66 + 22) = 2080;
    uint64_t v72 = sub_24D218AA0();
    uint64_t v211 = sub_24D1D0A78(v72, v73, (uint64_t *)&v212);
    sub_24D219310();
    swift_bridgeObjectRelease();
    uint64_t v74 = *(void (**)(char *, uint64_t))(v207 + 8);
    v74(v53, v194);
    _os_log_impl(&dword_24D1B6000, v60, v61, "%s (%s) looking for data in interval containing %s", (uint8_t *)v66, 0x20u);
    uint64_t v75 = MEMORY[0x263F8EE58];
    uint64_t v76 = v177;
    swift_arrayDestroy();
    MEMORY[0x253322AA0](v76, -1, -1);
    uint64_t v77 = v66;
    uint64_t v33 = v194;
    MEMORY[0x253322AA0](v77, -1, -1);

    uint64_t v78 = *(unsigned __int8 **)(v65 + 8);
    ((void (*)(void, uint64_t))v78)(v176, v202);
  }
  else
  {
    sub_24D1E604C((uint64_t)v205, (uint64_t (*)(void))type metadata accessor for EnergyTrends);
    uint64_t v74 = *(void (**)(char *, uint64_t))(v207 + 8);
    v74(v53, v33);

    uint64_t v78 = *(unsigned __int8 **)(v65 + 8);
    ((void (*)(char **, uint64_t))v78)(v64, v23);
    uint64_t v75 = v63;
  }
  uint64_t v79 = (uint64_t)v197;
  uint64_t v80 = v208;
  uint64_t v81 = *((void *)v208 + 1);
  uint64_t v82 = v201;
  uint64_t v83 = v195;
  uint64_t v84 = v198;
  uint64_t v85 = v204;
  if (*(void *)(v81 + 16))
  {
    v205 = v78;
    uint64_t v86 = v193;
    sub_24D1E5FE4(v81 + ((*(unsigned __int8 *)(v189 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v189 + 80)), (uint64_t)v193, type metadata accessor for EnergySite.EnergyUsage);
    ((void (*)(uint64_t, void *, uint64_t))v83)(v79, v86, v33);
    sub_24D1E604C((uint64_t)v86, type metadata accessor for EnergySite.EnergyUsage);
    uint64_t v87 = v207;
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v207 + 56))(v79, 0, 1, v33);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v87 + 48))(v79, 1, v33) != 1)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v87 + 32))(v85, v79, v33);
      uint64_t v88 = v85;
      uint64_t v89 = v173;
      if (sub_24D218A50())
      {
        v190(v84, v192, v202);
        uint64_t v90 = v179;
        sub_24D1E5FE4((uint64_t)v80, (uint64_t)v179, (uint64_t (*)(void))type metadata accessor for EnergyTrends);
        ((void (*)(uint64_t (**)(uint64_t, uint64_t, uint64_t), uint64_t, uint64_t))v83)(v180, v89, v33);
        ((void (*)(char *, char *, uint64_t))v83)(v181, v88, v33);
        uint64_t v91 = sub_24D219000();
        os_log_type_t v92 = sub_24D2192E0();
        int v93 = v92;
        if (os_log_type_enabled(v91, v92))
        {
          uint64_t v94 = swift_slowAlloc();
          LODWORD(v197) = v93;
          uint64_t v95 = v94;
          v193 = (void *)swift_slowAlloc();
          v212 = v193;
          *(_DWORD *)uint64_t v95 = 136315906;
          uint64_t v211 = sub_24D1D0A78(0xD00000000000002ALL, 0x800000024D21BFA0, (uint64_t *)&v212);
          sub_24D219310();
          *(_WORD *)(v95 + 12) = 2080;
          v96 = (uint64_t *)((char *)v90 + *(int *)(v178 + 28));
          uint64_t v97 = *v96;
          unint64_t v98 = v96[1];
          swift_bridgeObjectRetain();
          uint64_t v211 = sub_24D1D0A78(v97, v98, (uint64_t *)&v212);
          sub_24D219310();
          uint64_t v80 = v208;
          swift_bridgeObjectRelease();
          sub_24D1E604C((uint64_t)v90, (uint64_t (*)(void))type metadata accessor for EnergyTrends);
          *(_WORD *)(v95 + 22) = 2080;
          v99 = v180;
          uint64_t v100 = sub_24D218AA0();
          uint64_t v211 = sub_24D1D0A78(v100, v101, (uint64_t *)&v212);
          sub_24D219310();
          swift_bridgeObjectRelease();
          v74((char *)v99, v194);
          *(_WORD *)(v95 + 32) = 2080;
          v102 = v181;
          uint64_t v103 = sub_24D218AA0();
          uint64_t v211 = sub_24D1D0A78(v103, v104, (uint64_t *)&v212);
          uint64_t v33 = v194;
          sub_24D219310();
          swift_bridgeObjectRelease();
          v74(v102, v33);
          uint64_t v82 = v201;
          _os_log_impl(&dword_24D1B6000, v91, (os_log_type_t)v197, "%s (%s) requested date %s is before snapshot start, pinning to snapshot start: %s", (uint8_t *)v95, 0x2Au);
          v105 = v193;
          swift_arrayDestroy();
          MEMORY[0x253322AA0](v105, -1, -1);
          MEMORY[0x253322AA0](v95, -1, -1);

          v106 = v198;
        }
        else
        {
          sub_24D1E604C((uint64_t)v90, (uint64_t (*)(void))type metadata accessor for EnergyTrends);
          v74((char *)v180, v33);
          v74(v181, v33);

          v106 = v84;
        }
        ((void (*)(char **, uint64_t))v205)(v106, v202);
        (*(void (**)(char *, char *, uint64_t))(v87 + 40))(v82, v204, v33);
        uint64_t v83 = v195;
        uint64_t v75 = MEMORY[0x263F8EE58];
      }
      else
      {
        v74(v88, v33);
      }
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v87 = v207;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v207 + 56))(v197, 1, 1, v33);
  }
  sub_24D1D9A80(v79, &qword_26B18A610);
LABEL_13:
  v205 = &v80[*(int *)(v178 + 32)];
  swift_beginAccess();
  swift_beginAccess();
  char v107 = 0;
  uint64_t v207 = 0;
  v198 = (char **)(v87 + 32);
  v193 = (void *)(v87 + 8);
  uint64_t v189 = v203 + 8;
  v177 = &v210;
  v180 = (uint64_t (**)(uint64_t, uint64_t, uint64_t))(v87 + 48);
  v179 = (void (**)(char *, char *, uint64_t))(v87 + 40);
  uint64_t v108 = -11;
  *(void *)&long long v109 = 136316162;
  long long v176 = v109;
  unint64_t v168 = (unint64_t)"com.apple.EnergyKit";
  unint64_t v175 = 0x800000024D21BFA0;
  uint64_t v174 = v75 + 8;
  do
  {
    ((void (*)(char *, char *, uint64_t))v83)(v206, v82, v33);
    v110 = v208;
    unsigned __int8 v111 = *v208;
    uint64_t v112 = *v208;
    v113 = v186;
    uint64_t v203 = v108;
    switch(v112)
    {
      case 1:
        v114 = v206;
        v115 = v205;
        sub_24D218F50();
        break;
      case 2:
        v114 = v206;
        v115 = v205;
        sub_24D218F20();
        break;
      case 3:
        v114 = v206;
        v115 = v205;
        sub_24D218F30();
        break;
      case 4:
        v114 = v206;
        v115 = v205;
        sub_24D218F10();
        break;
      default:
        v114 = v206;
        v115 = v205;
        sub_24D218B40();
        break;
    }
    uint64_t v116 = (uint64_t)v185;
    v197 = *v198;
    ((void (*)(char *, char *, uint64_t))v197)(v185, v113, v33);
    LOBYTE(v210) = v111;
    uint64_t v117 = v200;
    static EnergyTrends.intervalDateRangeStartingAt(_:displayInterval:with:)(v116, &v210, (uint64_t)v115, v200);
    v118 = (char *)*v193;
    ((void (*)(uint64_t, uint64_t))*v193)(v116, v33);
    v181 = v118;
    uint64_t v119 = ((uint64_t (*)(char *, uint64_t))v118)(v114, v33);
    uint64_t v120 = *((void *)v110 + 1);
    MEMORY[0x270FA5388](v119);
    *(&v168 - 2) = v117;
    swift_bridgeObjectRetain();
    uint64_t v121 = v207;
    uint64_t v122 = sub_24D1E4890((uint64_t (*)(char *))sub_24D1E60AC, (uint64_t)(&v168 - 4), v120);
    uint64_t v207 = v121;
    if (v107) {
      swift_bridgeObjectRelease();
    }
    v204 = (char *)v122;
    uint64_t v213 = *(void *)(v122 + 16);
    v123 = v199;
    uint64_t v124 = v202;
    v190((char **)v199, v192, v202);
    uint64_t v125 = v187;
    sub_24D1E5FE4((uint64_t)v110, v187, (uint64_t (*)(void))type metadata accessor for EnergyTrends);
    uint64_t v126 = v188;
    sub_24D1D9D68(v117, v188, &qword_26985BC48);
    v127 = sub_24D219000();
    os_log_type_t v128 = sub_24D2192E0();
    if (os_log_type_enabled(v127, v128))
    {
      uint64_t v129 = swift_slowAlloc();
      uint64_t v130 = v126;
      v131 = (unsigned __int8 *)swift_slowAlloc();
      v210 = v131;
      *(_DWORD *)uint64_t v129 = v176;
      uint64_t v209 = sub_24D1D0A78(0xD00000000000002ALL, v175, (uint64_t *)&v210);
      sub_24D219310();
      *(_WORD *)(v129 + 12) = 2080;
      v132 = (uint64_t *)(v125 + *(int *)(v178 + 28));
      uint64_t v133 = v125;
      uint64_t v134 = *v132;
      unint64_t v135 = v132[1];
      swift_bridgeObjectRetain();
      uint64_t v209 = sub_24D1D0A78(v134, v135, (uint64_t *)&v210);
      sub_24D219310();
      swift_bridgeObjectRelease();
      sub_24D1E604C(v133, (uint64_t (*)(void))type metadata accessor for EnergyTrends);
      *(_WORD *)(v129 + 22) = 2080;
      uint64_t v136 = sub_24D218AA0();
      uint64_t v209 = sub_24D1D0A78(v136, v137, (uint64_t *)&v210);
      sub_24D219310();
      swift_bridgeObjectRelease();
      *(_WORD *)(v129 + 32) = 2048;
      uint64_t v209 = v213;
      sub_24D219310();
      *(_WORD *)(v129 + 42) = 2080;
      uint64_t v138 = sub_24D218AA0();
      uint64_t v209 = sub_24D1D0A78(v138, v139, (uint64_t *)&v210);
      sub_24D219310();
      swift_bridgeObjectRelease();
      sub_24D1D9A80(v130, &qword_26985BC48);
      _os_log_impl(&dword_24D1B6000, v127, v128, "%s (%s) checking %s: found %ld usage values in interval starting on %s", (uint8_t *)v129, 0x34u);
      swift_arrayDestroy();
      uint64_t v117 = v200;
      MEMORY[0x253322AA0](v131, -1, -1);
      MEMORY[0x253322AA0](v129, -1, -1);

      v140 = *(void (**)(char *, uint64_t))v189;
      (*(void (**)(char *, uint64_t))v189)(v199, v202);
    }
    else
    {
      sub_24D1E604C(v125, (uint64_t (*)(void))type metadata accessor for EnergyTrends);
      sub_24D1D9A80(v126, &qword_26985BC48);

      v140 = *(void (**)(char *, uint64_t))v189;
      (*(void (**)(char *, uint64_t))v189)(v123, v124);
    }
    uint64_t v141 = (uint64_t)v184;
    uint64_t v83 = v195;
    uint64_t v142 = v183;
    v143 = v182;
    uint64_t v33 = v194;
    if (v213 >= 1)
    {
      swift_bridgeObjectRelease();
      sub_24D218EE0();
      sub_24D1D9A80(v117, &qword_26985BC48);
      return ((uint64_t (*)(char *, uint64_t))v181)(v201, v33);
    }
    LOBYTE(v210) = *v208;
    sub_24D1E0D3C(v117, -1, &v210, (uint64_t)v205, v183);
    sub_24D1DC0B8(v117, v141, &qword_26985BC48);
    int v144 = (*v180)(v142, 1, v33);
    uint64_t v82 = v201;
    if (v144 == 1)
    {
      ((void (*)(char *, uint64_t, uint64_t))v83)(v143, v141, v33);
      sub_24D1D9A80(v141, &qword_26985BC48);
      sub_24D1D9A80(v142, &qword_26B18A610);
    }
    else
    {
      sub_24D1D9A80(v141, &qword_26985BC48);
      ((void (*)(char *, uint64_t, uint64_t))v197)(v143, v142, v33);
    }
    (*v179)(v82, v143, v33);
    char v107 = 1;
    uint64_t v108 = v203 + 1;
  }
  while (v203 != -1);
  swift_bridgeObjectRelease();
  v146 = v83;
  v147 = v171;
  uint64_t v148 = v202;
  v190((char **)v171, v192, v202);
  uint64_t v149 = v170;
  sub_24D1E5FE4((uint64_t)v208, v170, (uint64_t (*)(void))type metadata accessor for EnergyTrends);
  v150 = v169;
  uint64_t v151 = v173;
  ((void (*)(char *, uint64_t, uint64_t))v146)(v169, v173, v33);
  v152 = sub_24D219000();
  os_log_type_t v153 = sub_24D2192E0();
  int v154 = v153;
  if (os_log_type_enabled(v152, v153))
  {
    uint64_t v155 = v149;
    uint64_t v156 = swift_slowAlloc();
    v208 = (unsigned __int8 *)swift_slowAlloc();
    v210 = v208;
    *(_DWORD *)uint64_t v156 = 136315650;
    uint64_t v209 = sub_24D1D0A78(0xD00000000000002ALL, v168 | 0x8000000000000000, (uint64_t *)&v210);
    LODWORD(v207) = v154;
    sub_24D219310();
    *(_WORD *)(v156 + 12) = 2080;
    v157 = (uint64_t *)(v155 + *(int *)(v178 + 28));
    uint64_t v158 = *v157;
    unint64_t v159 = v157[1];
    swift_bridgeObjectRetain();
    uint64_t v209 = sub_24D1D0A78(v158, v159, (uint64_t *)&v210);
    sub_24D219310();
    uint64_t v33 = v194;
    swift_bridgeObjectRelease();
    sub_24D1E604C(v155, (uint64_t (*)(void))type metadata accessor for EnergyTrends);
    *(_WORD *)(v156 + 22) = 2080;
    uint64_t v160 = sub_24D218AA0();
    uint64_t v209 = sub_24D1D0A78(v160, v161, (uint64_t *)&v210);
    uint64_t v82 = v201;
    sub_24D219310();
    swift_bridgeObjectRelease();
    v162 = v150;
    v163 = (uint64_t (*)(char *, uint64_t))v181;
    ((void (*)(char *, uint64_t))v181)(v162, v33);
    _os_log_impl(&dword_24D1B6000, v152, (os_log_type_t)v207, "%s (%s) could NOT find available data for %s", (uint8_t *)v156, 0x20u);
    v164 = v208;
    swift_arrayDestroy();
    uint64_t v151 = v173;
    MEMORY[0x253322AA0](v164, -1, -1);
    MEMORY[0x253322AA0](v156, -1, -1);

    v165 = v171;
    uint64_t v166 = v202;
  }
  else
  {
    sub_24D1E604C(v149, (uint64_t (*)(void))type metadata accessor for EnergyTrends);
    v167 = v150;
    v163 = (uint64_t (*)(char *, uint64_t))v181;
    ((void (*)(char *, uint64_t))v181)(v167, v33);

    v165 = v147;
    uint64_t v166 = v148;
  }
  v140(v165, v166);
  ((void (*)(uint64_t, uint64_t, uint64_t))v195)(v172, v151, v33);
  return v163(v82, v33);
}

uint64_t EnergyTrends.intervalDateRangeContaining(_:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_24D218AC0();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = &v13[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = &v13[-v8];
  uint64_t v10 = *v1;
  uint64_t v11 = (uint64_t)&v1[*(int *)(type metadata accessor for EnergyTrends() + 32)];
  switch(v10)
  {
    case 1:
      sub_24D218F50();
      break;
    case 2:
      sub_24D218F20();
      break;
    case 3:
      sub_24D218F30();
      break;
    case 4:
      sub_24D218F10();
      break;
    default:
      sub_24D218B40();
      break;
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v4 + 32))(v9, v7, v3);
  char v14 = v10;
  static EnergyTrends.intervalDateRangeStartingAt(_:displayInterval:with:)((uint64_t)v9, &v14, v11, a1);
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v9, v3);
}

uint64_t EnergyTrends.usagesIn(_:)(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + 8);
  v4[2] = a1;
  swift_bridgeObjectRetain();
  return sub_24D1E4890((uint64_t (*)(char *))sub_24D1E90C4, (uint64_t)v4, v2);
}

uint64_t static EnergyTrends.startOfSubinterval(for:displayInterval:with:)@<X0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_24D218B70();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v17 - v11;
  (*(void (**)(char *, void, uint64_t))(v7 + 104))((char *)&v17 - v11, **((unsigned int **)&unk_265301938 + *a2), v6);
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v6);
  int v13 = (*(uint64_t (**)(char *, uint64_t))(v7 + 88))(v10, v6);
  if (v13 == *MEMORY[0x263F078A8])
  {
    sub_24D218F20();
  }
  else if (v13 == *MEMORY[0x263F07870])
  {
    sub_24D218B40();
  }
  else if (v13 == *MEMORY[0x263F07890])
  {
    sub_24D218F00();
  }
  else
  {
    if (v13 != *MEMORY[0x263F07830])
    {
      uint64_t v15 = *(void (**)(char *, uint64_t))(v7 + 8);
      v15(v12, v6);
      uint64_t v16 = sub_24D218AC0();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 16))(a3, a1, v16);
      return ((uint64_t (*)(char *, uint64_t))v15)(v10, v6);
    }
    sub_24D218F50();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v12, v6);
}

uint64_t static EnergyTrends.roundToStartOfSubinterval(date:displayInterval:with:)@<X0>(char *a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v19 = a2;
  uint64_t v5 = sub_24D218AC0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_24D218B70();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  int v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v19 - v14;
  char v16 = *a1;
  (*(void (**)(char *, void, uint64_t))(v10 + 104))((char *)&v19 - v14, **((unsigned int **)&unk_265301938 + v16), v9);
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v15, v9);
  int v17 = (*(uint64_t (**)(char *, uint64_t))(v10 + 88))(v13, v9);
  if (v17 != *MEMORY[0x263F078A8]
    && v17 != *MEMORY[0x263F07870]
    && v17 != *MEMORY[0x263F07890]
    && v17 != *MEMORY[0x263F07830])
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
  }
  sub_24D218A70();
  char v20 = v16;
  static EnergyTrends.startOfSubinterval(for:displayInterval:with:)((uint64_t)v8, &v20, a3);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v15, v9);
}

uint64_t static EnergyTrends.beginningOfInterval(for:interval:with:)(uint64_t a1, unsigned char *a2)
{
  switch(*a2)
  {
    case 1:
      uint64_t result = sub_24D218F50();
      break;
    case 2:
      uint64_t result = sub_24D218F20();
      break;
    case 3:
      uint64_t result = sub_24D218F30();
      break;
    case 4:
      uint64_t result = sub_24D218F10();
      break;
    default:
      uint64_t result = sub_24D218B40();
      break;
  }
  return result;
}

uint64_t static EnergyTrends.beginningOfInterval(for:interval:in:)@<X0>(uint64_t a1@<X0>, unsigned __int8 *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v22 = a3;
  uint64_t v25 = a4;
  uint64_t v26 = a1;
  uint64_t v5 = sub_24D218AC0();
  uint64_t v23 = *(void *)(v5 - 8);
  uint64_t v24 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_24D218BB0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_24D218B20();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_24D218B80();
  uint64_t v16 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v21);
  uint64_t v18 = (char *)&v21 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = *a2;
  (*(void (**)(char *, void, uint64_t))(v13 + 104))(v15, *MEMORY[0x263F07740], v12);
  sub_24D218B30();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v22, v8);
  sub_24D218B60();
  switch(v19)
  {
    case 1:
      sub_24D218F50();
      break;
    case 2:
      sub_24D218F20();
      break;
    case 3:
      sub_24D218F30();
      break;
    case 4:
      sub_24D218F10();
      break;
    default:
      sub_24D218B40();
      break;
  }
  (*(void (**)(uint64_t, char *, uint64_t))(v23 + 32))(v25, v7, v24);
  return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, v21);
}

uint64_t EnergyTrends.beginningOfInterval(for:)()
{
  uint64_t v1 = *v0;
  type metadata accessor for EnergyTrends();
  switch(v1)
  {
    case 1:
      uint64_t result = sub_24D218F50();
      break;
    case 2:
      uint64_t result = sub_24D218F20();
      break;
    case 3:
      uint64_t result = sub_24D218F30();
      break;
    case 4:
      uint64_t result = sub_24D218F10();
      break;
    default:
      uint64_t result = sub_24D218B40();
      break;
  }
  return result;
}

uint64_t static EnergyTrends.intervalDateRangeStartingAt(_:displayInterval:with:)@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v50 = a4;
  uint64_t v51 = (char *)a3;
  uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BDC0);
  uint64_t v6 = MEMORY[0x270FA5388](v52);
  uint64_t v8 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v48 = (char *)&v47 - v9;
  uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BC48);
  MEMORY[0x270FA5388](v49);
  uint64_t v53 = (char *)&v47 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_24D218AC0();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v47 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A610);
  uint64_t v16 = MEMORY[0x270FA5388](v15 - 8);
  uint64_t v18 = (char *)&v47 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v16);
  uint64_t v21 = (char *)&v47 - v20;
  MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)&v47 - v22;
  LOBYTE(a2) = *a2;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))((char *)&v47 - v22, 1, 1, v11);
  char v54 = (char)a2;
  sub_24D1E0D3C(a1, 1, &v54, (uint64_t)v51, (uint64_t)v21);
  sub_24D1D9A80((uint64_t)v23, &qword_26B18A610);
  sub_24D1DC0B8((uint64_t)v21, (uint64_t)v23, &qword_26B18A610);
  sub_24D1D9D68((uint64_t)v23, (uint64_t)v18, &qword_26B18A610);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v18, 1, v11) == 1)
  {
    sub_24D1D9A80((uint64_t)v18, &qword_26B18A610);
LABEL_7:
    sub_24D1E854C();
    char v37 = sub_24D2190C0();
    uint64_t result = sub_24D1D9A80((uint64_t)v23, &qword_26B18A610);
    if (v37)
    {
      uint64_t v38 = v52;
      uint64_t v39 = v48;
      uint64_t v40 = &v48[*(int *)(v52 + 48)];
      uint64_t v41 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
      v41(v48, a1, v11);
      v41(v40, a1, v11);
      uint64_t v42 = &v8[*(int *)(v38 + 48)];
      v41(v8, (uint64_t)v39, v11);
      v41(v42, (uint64_t)v40, v11);
      uint64_t v43 = *(void (**)(char *, char *, uint64_t))(v12 + 32);
      v43(v53, v8, v11);
      uint64_t v44 = *(void (**)(char *, uint64_t))(v12 + 8);
      v44(v42, v11);
      uint64_t v45 = &v8[*(int *)(v38 + 48)];
      uint64_t v46 = v39;
      uint64_t v34 = (uint64_t)v53;
      v43(v8, v46, v11);
      v43(v45, v40, v11);
      v43((char *)(v34 + *(int *)(v49 + 36)), v45, v11);
      v44(v8, v11);
      return sub_24D1DC0B8(v34, v50, &qword_26985BC48);
    }
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v24 = *(void (**)(char *, char *, uint64_t))(v12 + 32);
  v24(v14, v18, v11);
  if ((sub_24D218A50() & 1) == 0)
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    goto LABEL_7;
  }
  sub_24D1E854C();
  char v25 = sub_24D2190C0();
  uint64_t result = sub_24D1D9A80((uint64_t)v23, &qword_26B18A610);
  if (v25)
  {
    uint64_t v27 = v12;
    uint64_t v47 = v12;
    uint64_t v28 = v52;
    uint64_t v29 = v48;
    uint64_t v51 = &v48[*(int *)(v52 + 48)];
    uint64_t v30 = v24;
    uint64_t v31 = *(void (**)(char *, uint64_t, uint64_t))(v27 + 16);
    v31(v48, a1, v11);
    uint64_t v32 = (uint64_t)v51;
    v24(v51, v14, v11);
    uint64_t v33 = &v8[*(int *)(v28 + 48)];
    v31(v8, (uint64_t)v29, v11);
    v31(v33, v32, v11);
    uint64_t v34 = (uint64_t)v53;
    v24(v53, v8, v11);
    uint64_t v35 = *(void (**)(char *, uint64_t))(v47 + 8);
    v35(v33, v11);
    uint64_t v36 = &v8[*(int *)(v52 + 48)];
    v30(v8, v29, v11);
    v30(v36, v51, v11);
    v30((char *)(v34 + *(int *)(v49 + 36)), v36, v11);
    v35(v8, v11);
    return sub_24D1DC0B8(v34, v50, &qword_26985BC48);
  }
LABEL_11:
  __break(1u);
  return result;
}

uint64_t EnergyTrends.intervalDateRangeStartingAt(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  char v7 = *v2;
  uint64_t v5 = type metadata accessor for EnergyTrends();
  return static EnergyTrends.intervalDateRangeStartingAt(_:displayInterval:with:)(a1, &v7, (uint64_t)&v2[*(int *)(v5 + 32)], a2);
}

uint64_t static EnergyTrends.intervalDateRangeContaining(startDate:interval:with:)@<X0>(unsigned __int8 *a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_24D218AC0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v15[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v15[-v11];
  uint64_t v13 = *a1;
  switch(v13)
  {
    case 1:
      sub_24D218F50();
      break;
    case 2:
      sub_24D218F20();
      break;
    case 3:
      sub_24D218F30();
      break;
    case 4:
      sub_24D218F10();
      break;
    default:
      sub_24D218B40();
      break;
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 32))(v12, v10, v6);
  char v16 = v13;
  static EnergyTrends.intervalDateRangeStartingAt(_:displayInterval:with:)((uint64_t)v12, &v16, a2, a3);
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
}

uint64_t EnergyTrends.numDaysIn(usage:)(uint64_t a1)
{
  uint64_t v25 = a1;
  uint64_t v2 = sub_24D218B70();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  uint64_t v9 = (char *)&v24 - v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v24 - v10;
  uint64_t v24 = sub_24D218AC0();
  uint64_t v12 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24);
  uint64_t v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = (_DWORD *)MEMORY[0x263F078A8];
  switch(*v1)
  {
    case 1:
    case 2:
      uint64_t v16 = *MEMORY[0x263F07870];
      break;
    case 3:
      uint64_t v16 = *MEMORY[0x263F07830];
      break;
    case 4:
      uint64_t v16 = *MEMORY[0x263F078A8];
      break;
    default:
      uint64_t v16 = *MEMORY[0x263F07890];
      break;
  }
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 104);
  v17(v11, v16, v2);
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v9, v11, v2);
  uint64_t v18 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v9, v2);
  if (v18 == *v15) {
    goto LABEL_7;
  }
  if (v18 == *MEMORY[0x263F07870])
  {
    (*(void (**)(char *, uint64_t))(v3 + 8))(v11, v2);
    return 1;
  }
  if (v18 == *MEMORY[0x263F07890])
  {
    sub_24D218F80();
    sub_24D218A30();
    goto LABEL_8;
  }
  if (v18 == *MEMORY[0x263F07830])
  {
LABEL_7:
    v17(v6, v18, v2);
    type metadata accessor for EnergyTrends();
    sub_24D218F60();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
LABEL_8:
    uint64_t v19 = v24;
    goto LABEL_9;
  }
  uint64_t v19 = v24;
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v25, v24);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v9, v2);
LABEL_9:
  type metadata accessor for EnergyTrends();
  uint64_t v20 = sub_24D218F40();
  char v22 = v21;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v11, v2);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v19);
  if (v22) {
    return 1;
  }
  else {
    return v20;
  }
}

uint64_t sub_24D1E45D0(uint64_t a1, uint64_t a2)
{
  uint64_t v22 = type metadata accessor for EnergySite.EnergyUsage(0);
  MEMORY[0x270FA5388](v22);
  uint64_t v23 = (uint64_t)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BC48);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_24D218AC0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24D1E854C();
  char v12 = sub_24D2190C0();
  uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  uint64_t v24 = a1;
  v13(v11, a1, v8);
  sub_24D1D9D68(a2, (uint64_t)v7, &qword_26985BC48);
  if (v12)
  {
    uint64_t v14 = v22;
    char v15 = sub_24D2190B0();
    sub_24D1D9A80((uint64_t)v7, &qword_26985BC48);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    uint64_t v16 = v23;
    sub_24D1E5FE4(v24, v23, type metadata accessor for EnergySite.EnergyUsage);
    uint64_t v17 = v16;
    if (v15) {
      uint64_t v18 = *(unsigned __int8 *)(v16 + *(int *)(v14 + 52));
    }
    else {
      uint64_t v18 = 0;
    }
  }
  else
  {
    sub_24D1D9A80((uint64_t)v7, &qword_26985BC48);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    uint64_t v19 = v23;
    sub_24D1E5FE4(v24, v23, type metadata accessor for EnergySite.EnergyUsage);
    uint64_t v18 = 0;
    uint64_t v17 = v19;
  }
  sub_24D1E604C(v17, type metadata accessor for EnergySite.EnergyUsage);
  return v18;
}

uint64_t sub_24D1E4890(uint64_t (*a1)(char *), uint64_t a2, uint64_t a3)
{
  uint64_t v7 = type metadata accessor for EnergySite.EnergyUsage(0);
  uint64_t v24 = *(void *)(v7 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v23 = (uint64_t)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x270FA5388](v8);
  char v12 = (char *)v20 - v11;
  uint64_t v13 = MEMORY[0x263F8EE78];
  uint64_t v25 = MEMORY[0x263F8EE78];
  uint64_t v22 = *(void *)(a3 + 16);
  if (v22)
  {
    unint64_t v14 = 0;
    uint64_t v15 = MEMORY[0x263F8EE78];
    v20[1] = a2;
    uint64_t v21 = a3;
    v20[0] = a1;
    while (v14 < *(void *)(a3 + 16))
    {
      unint64_t v16 = (*(unsigned __int8 *)(v24 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
      uint64_t v13 = *(void *)(v24 + 72);
      sub_24D1E5FE4(a3 + v16 + v13 * v14, (uint64_t)v12, type metadata accessor for EnergySite.EnergyUsage);
      char v17 = a1(v12);
      if (v3)
      {
        sub_24D1E604C((uint64_t)v12, type metadata accessor for EnergySite.EnergyUsage);
        swift_release();
        swift_bridgeObjectRelease();
        return v13;
      }
      if (v17)
      {
        sub_24D1E905C((uint64_t)v12, v23, type metadata accessor for EnergySite.EnergyUsage);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          sub_24D1E85B4(0, *(void *)(v15 + 16) + 1, 1);
        }
        uint64_t v15 = v25;
        unint64_t v19 = *(void *)(v25 + 16);
        unint64_t v18 = *(void *)(v25 + 24);
        if (v19 >= v18 >> 1)
        {
          sub_24D1E85B4(v18 > 1, v19 + 1, 1);
          uint64_t v15 = v25;
        }
        *(void *)(v15 + 16) = v19 + 1;
        uint64_t result = sub_24D1E905C(v23, v15 + v16 + v19 * v13, type metadata accessor for EnergySite.EnergyUsage);
        a3 = v21;
        a1 = (uint64_t (*)(char *))v20[0];
      }
      else
      {
        uint64_t result = sub_24D1E604C((uint64_t)v12, type metadata accessor for EnergySite.EnergyUsage);
      }
      if (v22 == ++v14)
      {
        uint64_t v13 = v25;
        goto LABEL_15;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_15:
    swift_bridgeObjectRelease();
    return v13;
  }
  return result;
}

uint64_t EnergyTrends.previousIntervalStart(for:)()
{
  uint64_t v1 = sub_24D218B70();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v5 = *v0;
  if (v5 > 3) {
    uint64_t v6 = (unsigned int *)MEMORY[0x263F078A0];
  }
  else {
    uint64_t v6 = (unsigned int *)qword_265301960[v5];
  }
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *v6, v1);
  type metadata accessor for EnergyTrends();
  sub_24D218F70();
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
}

uint64_t EnergyTrends.previousIntervalDateRange(before:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v14 = a1;
  uint64_t v2 = sub_24D218B70();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  unint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24D218AC0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v10 = *v1;
  if (v10 > 3) {
    uint64_t v11 = (unsigned int *)MEMORY[0x263F078A0];
  }
  else {
    uint64_t v11 = (unsigned int *)qword_265301960[v10];
  }
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *v11, v2);
  uint64_t v12 = (uint64_t)&v1[*(int *)(type metadata accessor for EnergyTrends() + 32)];
  sub_24D218F70();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  char v15 = *v1;
  static EnergyTrends.intervalDateRangeStartingAt(_:displayInterval:with:)((uint64_t)v9, &v15, v12, v14);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t EnergyTrends.dailyAverageNetImportsForInterval(starting:)(uint64_t a1)
{
  return sub_24D1E69A0(a1, (void (*)(char *))EnergyTrends.totalImportsForDateRange(_:), (void (*)(char *))EnergyTrends.totalExportsForDateRange(_:));
}

double EnergyTrends.previousDailyAverageImportsForInterval(starting:)()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BC48);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = ((char *)&v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v4 = sub_24D218B70();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_24D218AC0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v13 = *v0;
  uint64_t v24 = v10;
  if (v13 > 3) {
    uint64_t v14 = (unsigned int *)MEMORY[0x263F078A0];
  }
  else {
    uint64_t v14 = (unsigned int *)qword_265301960[v13];
  }
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *v14, v4);
  uint64_t v15 = (uint64_t)&v0[*(int *)(type metadata accessor for EnergyTrends() + 32)];
  sub_24D218F70();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  char v25 = *v0;
  static EnergyTrends.intervalDateRangeStartingAt(_:displayInterval:with:)((uint64_t)v12, &v25, v15, (uint64_t)v3);
  uint64_t v16 = EnergyTrends.totalImportsForDateRange(_:)((uint64_t)v3);
  double v18 = v17;
  uint64_t v19 = v16;
  EnergyTrends.totalExportsForDateRange(_:)(v3);
  double v21 = v20;
  sub_24D1D9A80((uint64_t)v3, &qword_26985BC48);
  if (v19) {
    double v22 = (v18 - v21) / (double)v19;
  }
  else {
    double v22 = 0.0;
  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v24);
  return v22;
}

uint64_t EnergyTrends.containsUsageForDate(_:)(uint64_t a1)
{
  uint64_t v35 = a1;
  uint64_t v1 = sub_24D218AC0();
  uint64_t v31 = *(void *)(v1 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v30 - v5;
  uint64_t v32 = sub_24D218BB0();
  uint64_t v7 = *(void *)(v32 - 8);
  MEMORY[0x270FA5388](v32);
  uint64_t v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_24D218B20();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  unint64_t v13 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_24D218B80();
  uint64_t v34 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)&v30 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v13, *MEMORY[0x263F07740], v10);
  sub_24D218B30();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  uint64_t v17 = type metadata accessor for EnergyTrends();
  uint64_t v18 = v33;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v33 + *(int *)(v17 + 24), v32);
  sub_24D218B60();
  uint64_t v19 = *(void *)(v18 + 8);
  uint64_t v20 = *(void *)(v19 + 16);
  if (v20)
  {
    uint64_t v33 = v14;
    uint64_t v21 = *(void *)(type metadata accessor for EnergySite.EnergyUsage(0) - 8);
    unint64_t v22 = v19 + ((*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80));
    uint64_t v23 = (void (**)(char *, uint64_t))(v31 + 8);
    uint64_t v24 = *(void *)(v21 + 72);
    uint64_t v32 = v19;
    swift_bridgeObjectRetain();
    uint64_t v25 = v20 - 1;
    do
    {
      uint64_t v26 = v25;
      sub_24D218B40();
      sub_24D218B40();
      char v27 = sub_24D218A80();
      uint64_t v28 = *v23;
      (*v23)(v4, v1);
      v28(v6, v1);
      if (v27) {
        break;
      }
      uint64_t v25 = v26 - 1;
      v22 += v24;
    }
    while (v26);
    swift_bridgeObjectRelease();
    uint64_t v14 = v33;
  }
  else
  {
    char v27 = 0;
  }
  (*(void (**)(char *, uint64_t))(v34 + 8))(v16, v14);
  return v27 & 1;
}

uint64_t EnergyTrends.totalImportsForDateRange(_:)(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for EnergySite.EnergyUsage(0);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v22[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = *(void *)(v1 + 8);
  uint64_t v23 = a1;
  swift_bridgeObjectRetain();
  uint64_t v8 = sub_24D1E4890((uint64_t (*)(char *))sub_24D1E90C4, (uint64_t)v22, v7);
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)(v8 + 16);
  if (v10)
  {
    uint64_t v11 = v8 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    uint64_t v12 = *(void *)(v4 + 72);
    swift_bridgeObjectRetain();
    double v13 = 0.0;
    uint64_t v14 = v10;
    do
    {
      sub_24D1E5FE4(v11, (uint64_t)v6, type metadata accessor for EnergySite.EnergyUsage);
      double v13 = v13 + *(double *)&v6[*(int *)(v3 + 24)] * (double)*(uint64_t *)&v6[*(int *)(v3 + 48)];
      sub_24D1E604C((uint64_t)v6, type metadata accessor for EnergySite.EnergyUsage);
      v11 += v12;
      --v14;
    }
    while (v14);
    swift_bridgeObjectRelease();
  }
  switch(*(unsigned char *)v1)
  {
    case 1:
    case 2:
    case 3:
    case 4:
      char v15 = sub_24D2194E0();
      swift_bridgeObjectRelease();
      if (v15) {
        goto LABEL_8;
      }
      if (v10)
      {
        uint64_t v17 = v9 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
        uint64_t v18 = *(void *)(v4 + 72);
        swift_bridgeObjectRetain();
        uint64_t v16 = 0;
        do
        {
          sub_24D1E5FE4(v17, (uint64_t)v6, type metadata accessor for EnergySite.EnergyUsage);
          uint64_t v19 = *(void *)&v6[*(int *)(v3 + 48)];
          BOOL v20 = __OFADD__(v16, v19);
          v16 += v19;
          if (v20)
          {
            __break(1u);
            JUMPOUT(0x24D1E5818);
          }
          sub_24D1E604C((uint64_t)v6, type metadata accessor for EnergySite.EnergyUsage);
          v17 += v18;
          --v10;
        }
        while (v10);
        swift_bridgeObjectRelease_n();
      }
      else
      {
        swift_bridgeObjectRelease();
        uint64_t v16 = 0;
      }
      break;
    default:
      swift_bridgeObjectRelease();
LABEL_8:
      swift_bridgeObjectRelease();
      uint64_t v16 = 1;
      break;
  }
  return v16;
}

uint64_t EnergyTrends.totalExportsForDateRange(_:)(NSObject *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for EnergySite.EnergyUsage(0);
  uint64_t v43 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BC48);
  MEMORY[0x270FA5388](v42);
  uint64_t v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = type metadata accessor for EnergyTrends();
  MEMORY[0x270FA5388](v41);
  uint64_t v10 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_24D219020();
  uint64_t v44 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (uint64_t)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(void *)(v2 + 8);
  uint64_t v46 = a1;
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_24D1E4890((uint64_t (*)(char *))sub_24D1E90C4, (uint64_t)v45, v14);
  if (qword_26B18A2F8 != -1) {
LABEL_21:
  }
    swift_once();
  uint64_t v16 = __swift_project_value_buffer(v11, (uint64_t)qword_26B18A8F0);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v44 + 16))(v13, v16, v11);
  sub_24D1E5FE4(v2, (uint64_t)v10, (uint64_t (*)(void))type metadata accessor for EnergyTrends);
  sub_24D1D9D68((uint64_t)a1, (uint64_t)v8, &qword_26985BC48);
  swift_bridgeObjectRetain();
  a1 = sub_24D219000();
  os_log_type_t v17 = sub_24D2192E0();
  int v40 = v17;
  if (os_log_type_enabled(a1, v17))
  {
    uint64_t v18 = swift_slowAlloc();
    uint64_t v39 = v2;
    uint64_t v19 = v18;
    uint64_t v37 = swift_slowAlloc();
    uint64_t v49 = v37;
    *(_DWORD *)uint64_t v19 = 136315906;
    uint64_t v47 = sub_24D1D0A78(0xD00000000000001CLL, 0x800000024D21BFD0, &v49);
    uint64_t v38 = v13;
    sub_24D219310();
    *(_WORD *)(v19 + 12) = 2080;
    BOOL v20 = (uint64_t *)&v10[*(int *)(v41 + 28)];
    uint64_t v41 = v11;
    os_log_t v36 = a1;
    uint64_t v21 = *v20;
    unint64_t v22 = v20[1];
    swift_bridgeObjectRetain();
    uint64_t v47 = sub_24D1D0A78(v21, v22, &v49);
    sub_24D219310();
    swift_bridgeObjectRelease();
    sub_24D1E604C((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for EnergyTrends);
    *(_WORD *)(v19 + 22) = 2048;
    uint64_t v47 = *(void *)(v15 + 16);
    sub_24D219310();
    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 32) = 2080;
    uint64_t v47 = 0;
    unint64_t v48 = 0xE000000000000000;
    sub_24D218AC0();
    sub_24D219450();
    a1 = (v19 + 34);
    sub_24D219130();
    sub_24D219450();
    uint64_t v47 = sub_24D1D0A78(v47, v48, &v49);
    sub_24D219310();
    swift_bridgeObjectRelease();
    sub_24D1D9A80((uint64_t)v8, &qword_26985BC48);
    os_log_t v23 = v36;
    _os_log_impl(&dword_24D1B6000, v36, (os_log_type_t)v40, "%s (%s) found %ld usages in %s", (uint8_t *)v19, 0x2Au);
    uint64_t v24 = v37;
    swift_arrayDestroy();
    MEMORY[0x253322AA0](v24, -1, -1);
    uint64_t v25 = v19;
    uint64_t v2 = v39;
    MEMORY[0x253322AA0](v25, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v38, v41);
  }
  else
  {
    sub_24D1E604C((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for EnergyTrends);
    swift_bridgeObjectRelease();
    sub_24D1D9A80((uint64_t)v8, &qword_26985BC48);

    (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v13, v11);
  }
  uint64_t v10 = *(char **)(v15 + 16);
  if (v10)
  {
    uint64_t v26 = v15 + ((*(unsigned __int8 *)(v43 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v43 + 80));
    uint64_t v27 = *(void *)(v43 + 72);
    swift_bridgeObjectRetain();
    double v28 = 0.0;
    uint64_t v29 = v10;
    do
    {
      sub_24D1E5FE4(v26, (uint64_t)v6, type metadata accessor for EnergySite.EnergyUsage);
      double v28 = v28 + *(double *)&v6[*(int *)(v4 + 28)] * (double)*(uint64_t *)&v6[*(int *)(v4 + 48)];
      sub_24D1E604C((uint64_t)v6, type metadata accessor for EnergySite.EnergyUsage);
      v26 += v27;
      --v29;
    }
    while (v29);
    swift_bridgeObjectRelease();
  }
  switch(*(unsigned char *)v2)
  {
    case 1:
    case 2:
    case 3:
    case 4:
      char v30 = sub_24D2194E0();
      swift_bridgeObjectRelease();
      if (v30) {
        goto LABEL_12;
      }
      if (v10)
      {
        uint64_t v31 = v15 + ((*(unsigned __int8 *)(v43 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v43 + 80));
        uint64_t v11 = *(void *)(v43 + 72);
        swift_bridgeObjectRetain();
        uint64_t v13 = 0;
        do
        {
          sub_24D1E5FE4(v31, (uint64_t)v6, type metadata accessor for EnergySite.EnergyUsage);
          uint64_t v32 = *(void *)&v6[*(int *)(v4 + 48)];
          BOOL v33 = __OFADD__(v13, v32);
          v13 += v32;
          if (v33)
          {
            __break(1u);
            goto LABEL_21;
          }
          sub_24D1E604C((uint64_t)v6, type metadata accessor for EnergySite.EnergyUsage);
          v31 += v11;
          --v10;
        }
        while (v10);
        swift_bridgeObjectRelease_n();
      }
      else
      {
        swift_bridgeObjectRelease();
        uint64_t v13 = 0;
      }
      break;
    default:
      swift_bridgeObjectRelease();
LABEL_12:
      swift_bridgeObjectRelease();
      uint64_t v13 = 1;
      break;
  }
  return v13;
}

uint64_t sub_24D1E5FE4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24D1E604C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24D1E60AC(uint64_t a1)
{
  return sub_24D1E45D0(a1, *(void *)(v1 + 16)) & 1;
}

BOOL EnergyTrends.isDailyAverageUsageUpForInterval(starting:)(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BC48);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = ((char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  char v16 = *v1;
  uint64_t v6 = type metadata accessor for EnergyTrends();
  static EnergyTrends.intervalDateRangeStartingAt(_:displayInterval:with:)(a1, &v16, (uint64_t)&v1[*(int *)(v6 + 32)], (uint64_t)v5);
  uint64_t v7 = EnergyTrends.totalImportsForDateRange(_:)((uint64_t)v5);
  double v9 = v8;
  uint64_t v10 = v7;
  EnergyTrends.totalExportsForDateRange(_:)(v5);
  double v12 = v11;
  sub_24D1D9A80((uint64_t)v5, &qword_26985BC48);
  if (v10) {
    double v13 = (v9 - v12) / (double)v10;
  }
  else {
    double v13 = 0.0;
  }
  return v13 - EnergyTrends.previousDailyAverageImportsForInterval(starting:)() > 0.0;
}

uint64_t EnergyTrends.importPricingPeriodsForInterval(starting:)(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for EnergySite.EnergyUsage(0);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v54 = (uint64_t)&v48 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BC48);
  MEMORY[0x270FA5388](v6 - 8);
  double v8 = (char *)&v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  LOBYTE(v58) = *(unsigned char *)v1;
  uint64_t v9 = type metadata accessor for EnergyTrends();
  static EnergyTrends.intervalDateRangeStartingAt(_:displayInterval:with:)(a1, &v58, v1 + *(int *)(v9 + 32), (uint64_t)v8);
  uint64_t v10 = *(void *)(v1 + 8);
  unint64_t v48 = v8;
  uint64_t v57 = v8;
  swift_bridgeObjectRetain();
  uint64_t v11 = sub_24D1E4890((uint64_t (*)(char *))sub_24D1E90C4, (uint64_t)v56, v10);
  uint64_t v53 = *(void *)(v11 + 16);
  if (!v53)
  {
    swift_bridgeObjectRelease();
    double v12 = 0;
    uint64_t v15 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_41;
  }
  double v12 = 0;
  unint64_t v13 = 0;
  uint64_t v14 = *(int *)(v3 + 36);
  unint64_t v51 = v11 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v52 = v14;
  uint64_t v15 = (void *)MEMORY[0x263F8EE80];
  uint64_t v49 = v11;
  uint64_t v50 = v4;
  while (2)
  {
    if (v13 >= *(void *)(v11 + 16))
    {
LABEL_49:
      __break(1u);
LABEL_50:
      uint64_t result = sub_24D219520();
      __break(1u);
      return result;
    }
    uint64_t v16 = v51 + *(void *)(v4 + 72) * v13;
    uint64_t v17 = v54;
    sub_24D1E5FE4(v16, v54, type metadata accessor for EnergySite.EnergyUsage);
    unint64_t v55 = v13 + 1;
    uint64_t v18 = *(void *)(v17 + v52);
    swift_bridgeObjectRetain();
    sub_24D1E604C(v17, type metadata accessor for EnergySite.EnergyUsage);
    int64_t v19 = 0;
    uint64_t v20 = v18 + 64;
    uint64_t v21 = 1 << *(unsigned char *)(v18 + 32);
    if (v21 < 64) {
      uint64_t v22 = ~(-1 << v21);
    }
    else {
      uint64_t v22 = -1;
    }
    unint64_t v23 = v22 & *(void *)(v18 + 64);
    int64_t v24 = (unint64_t)(v21 + 63) >> 6;
    while (1)
    {
      if (v23)
      {
        unint64_t v26 = __clz(__rbit64(v23));
        v23 &= v23 - 1;
        unint64_t v27 = v26 | (v19 << 6);
        goto LABEL_27;
      }
      int64_t v28 = v19 + 1;
      if (__OFADD__(v19, 1)) {
        goto LABEL_47;
      }
      if (v28 >= v24) {
        break;
      }
      unint64_t v29 = *(void *)(v20 + 8 * v28);
      ++v19;
      if (!v29)
      {
        int64_t v19 = v28 + 1;
        if (v28 + 1 >= v24) {
          break;
        }
        unint64_t v29 = *(void *)(v20 + 8 * v19);
        if (!v29)
        {
          int64_t v19 = v28 + 2;
          if (v28 + 2 >= v24) {
            break;
          }
          unint64_t v29 = *(void *)(v20 + 8 * v19);
          if (!v29)
          {
            int64_t v30 = v28 + 3;
            if (v30 >= v24) {
              break;
            }
            unint64_t v29 = *(void *)(v20 + 8 * v30);
            if (!v29)
            {
              while (1)
              {
                int64_t v19 = v30 + 1;
                if (__OFADD__(v30, 1)) {
                  goto LABEL_48;
                }
                if (v19 >= v24) {
                  goto LABEL_3;
                }
                unint64_t v29 = *(void *)(v20 + 8 * v19);
                ++v30;
                if (v29) {
                  goto LABEL_26;
                }
              }
            }
            int64_t v19 = v30;
          }
        }
      }
LABEL_26:
      unint64_t v23 = (v29 - 1) & v29;
      unint64_t v27 = __clz(__rbit64(v29)) + (v19 << 6);
LABEL_27:
      uint64_t v31 = 8 * v27;
      uint64_t v32 = *(void *)(*(void *)(v18 + 48) + v31);
      double v33 = *(double *)(*(void *)(v18 + 56) + v31);
      sub_24D1E85A4((uint64_t)v12);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v58 = v15;
      unint64_t v36 = sub_24D1D12B0(v32);
      uint64_t v37 = v15[2];
      BOOL v38 = (v35 & 1) == 0;
      uint64_t v39 = v37 + v38;
      if (__OFADD__(v37, v38))
      {
        __break(1u);
LABEL_46:
        __break(1u);
LABEL_47:
        __break(1u);
LABEL_48:
        __break(1u);
        goto LABEL_49;
      }
      char v40 = v35;
      if (v15[3] >= v39)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
          sub_24D1D287C();
        }
      }
      else
      {
        sub_24D1D1DD4(v39, isUniquelyReferenced_nonNull_native);
        unint64_t v41 = sub_24D1D12B0(v32);
        if ((v40 & 1) != (v42 & 1)) {
          goto LABEL_50;
        }
        unint64_t v36 = v41;
      }
      uint64_t v15 = v58;
      swift_bridgeObjectRelease();
      if (v40)
      {
        swift_bridgeObjectRetain();
      }
      else
      {
        v15[(v36 >> 6) + 8] |= 1 << v36;
        *(void *)(v15[6] + 8 * v36) = v32;
        *(void *)(v15[7] + 8 * v36) = 0;
        uint64_t v43 = v15[2];
        uint64_t v44 = v43 + 1;
        BOOL v45 = __OFADD__(v43, 1);
        swift_bridgeObjectRetain();
        if (v45) {
          goto LABEL_46;
        }
        _OWORD v15[2] = v44;
      }
      uint64_t v25 = v15[7];
      swift_bridgeObjectRelease();
      *(double *)(v25 + 8 * v36) = v33 + *(double *)(v25 + 8 * v36);
      double v12 = sub_24D1B7DD0;
    }
LABEL_3:
    swift_release();
    unint64_t v13 = v55;
    uint64_t v11 = v49;
    uint64_t v4 = v50;
    if (v55 != v53) {
      continue;
    }
    break;
  }
  swift_bridgeObjectRelease();
LABEL_41:
  uint64_t v46 = v15[2];
  sub_24D1D9A80((uint64_t)v48, &qword_26985BC48);
  if (v46)
  {
    sub_24D1E85A4((uint64_t)v12);
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_24D1E85A4((uint64_t)v12);
    return 0;
  }
  return (uint64_t)v15;
}

double EnergyTrends.totalImportsForPreviousInterval(starting:)()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BC48);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  EnergyTrends.previousIntervalDateRange(before:)((uint64_t)v2);
  EnergyTrends.totalImportsForDateRange(_:)((uint64_t)v2);
  double v4 = v3;
  sub_24D1D9A80((uint64_t)v2, &qword_26985BC48);
  return v4;
}

double EnergyTrends.totalImportsForInterval(starting:)(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BC48);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v11 = *v1;
  uint64_t v6 = type metadata accessor for EnergyTrends();
  static EnergyTrends.intervalDateRangeStartingAt(_:displayInterval:with:)(a1, &v11, (uint64_t)&v1[*(int *)(v6 + 32)], (uint64_t)v5);
  EnergyTrends.totalImportsForDateRange(_:)((uint64_t)v5);
  double v8 = v7;
  sub_24D1D9A80((uint64_t)v5, &qword_26985BC48);
  return v8;
}

uint64_t EnergyTrends.calculateDeltaNetExports(startDate:)(uint64_t a1)
{
  return sub_24D1E6850(a1, (void (*)(char *))EnergyTrends.totalExportsForDateRange(_:), (void (*)(char *))EnergyTrends.totalImportsForDateRange(_:), (double (*)(uint64_t))EnergyTrends.previousDailyAverageExportsForInterval(starting:));
}

uint64_t sub_24D1E6850(uint64_t a1, void (*a2)(char *), void (*a3)(char *), double (*a4)(uint64_t))
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BC48);
  MEMORY[0x270FA5388](v9 - 8);
  char v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v15 = *v4;
  uint64_t v12 = type metadata accessor for EnergyTrends();
  static EnergyTrends.intervalDateRangeStartingAt(_:displayInterval:with:)(a1, &v15, (uint64_t)&v4[*(int *)(v12 + 32)], (uint64_t)v11);
  a2(v11);
  a3(v11);
  sub_24D1D9A80((uint64_t)v11, &qword_26985BC48);
  a4(a1);
  return 1;
}

uint64_t EnergyTrends.dailyAverageNetExportsForInterval(starting:)(uint64_t a1)
{
  return sub_24D1E69A0(a1, (void (*)(char *))EnergyTrends.totalExportsForDateRange(_:), (void (*)(char *))EnergyTrends.totalImportsForDateRange(_:));
}

uint64_t sub_24D1E69A0(uint64_t a1, void (*a2)(char *), void (*a3)(char *))
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BC48);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v13 = *v3;
  uint64_t v10 = type metadata accessor for EnergyTrends();
  static EnergyTrends.intervalDateRangeStartingAt(_:displayInterval:with:)(a1, &v13, (uint64_t)&v3[*(int *)(v10 + 32)], (uint64_t)v9);
  a2(v9);
  a3(v9);
  return sub_24D1D9A80((uint64_t)v9, &qword_26985BC48);
}

double EnergyTrends.previousDailyAverageExportsForInterval(starting:)()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BC48);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = ((char *)&v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v4 = sub_24D218B70();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_24D218AC0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v13 = *v0;
  uint64_t v24 = v10;
  if (v13 > 3) {
    uint64_t v14 = (unsigned int *)MEMORY[0x263F078A0];
  }
  else {
    uint64_t v14 = (unsigned int *)qword_265301960[v13];
  }
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *v14, v4);
  uint64_t v15 = (uint64_t)&v0[*(int *)(type metadata accessor for EnergyTrends() + 32)];
  sub_24D218F70();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  char v25 = *v0;
  static EnergyTrends.intervalDateRangeStartingAt(_:displayInterval:with:)((uint64_t)v12, &v25, v15, (uint64_t)v3);
  uint64_t v16 = EnergyTrends.totalExportsForDateRange(_:)(v3);
  double v18 = v17;
  uint64_t v19 = v16;
  EnergyTrends.totalImportsForDateRange(_:)((uint64_t)v3);
  double v21 = v20;
  sub_24D1D9A80((uint64_t)v3, &qword_26985BC48);
  if (v19) {
    double v22 = (v18 - v21) / (double)v19;
  }
  else {
    double v22 = 0.0;
  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v24);
  return v22;
}

BOOL EnergyTrends.isDailyAverageSurplusUpForInterval(starting:)(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BC48);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = ((char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  char v16 = *v1;
  uint64_t v6 = type metadata accessor for EnergyTrends();
  static EnergyTrends.intervalDateRangeStartingAt(_:displayInterval:with:)(a1, &v16, (uint64_t)&v1[*(int *)(v6 + 32)], (uint64_t)v5);
  uint64_t v7 = EnergyTrends.totalImportsForDateRange(_:)((uint64_t)v5);
  double v9 = v8;
  uint64_t v10 = v7;
  EnergyTrends.totalExportsForDateRange(_:)(v5);
  double v12 = v11;
  sub_24D1D9A80((uint64_t)v5, &qword_26985BC48);
  if (v10) {
    double v13 = (v9 - v12) / (double)v10;
  }
  else {
    double v13 = 0.0;
  }
  return v13 - EnergyTrends.previousDailyAverageImportsForInterval(starting:)() < 0.0;
}

double EnergyTrends.avergeSurplusOrConsumption(startDate:)(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BC48);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v6 = &v37[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  double v9 = &v37[-v8];
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  double v12 = &v37[-v11];
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = &v37[-v13];
  char v41 = *v1;
  uint64_t v15 = (uint64_t)&v1[*(int *)(type metadata accessor for EnergyTrends() + 32)];
  static EnergyTrends.intervalDateRangeStartingAt(_:displayInterval:with:)(a1, &v41, v15, (uint64_t)v14);
  uint64_t v16 = EnergyTrends.totalImportsForDateRange(_:)((uint64_t)v14);
  double v18 = v17;
  uint64_t v19 = v16;
  EnergyTrends.totalExportsForDateRange(_:)(v14);
  double v21 = v20;
  sub_24D1D9A80((uint64_t)v14, &qword_26985BC48);
  if (v19) {
    BOOL v22 = (v18 - v21) / (double)v19 < 0.0;
  }
  else {
    BOOL v22 = 0;
  }
  char v23 = *v1;
  switch(*v1)
  {
    case 1:
    case 2:
    case 3:
    case 4:
      char v24 = sub_24D2194E0();
      swift_bridgeObjectRelease();
      if (v24) {
        goto LABEL_7;
      }
      if (!v22)
      {
        char v40 = v23;
        static EnergyTrends.intervalDateRangeStartingAt(_:displayInterval:with:)(a1, &v40, v15, (uint64_t)v6);
        uint64_t v33 = EnergyTrends.totalImportsForDateRange(_:)((uint64_t)v6);
        double v28 = v34;
        uint64_t v29 = v33;
        EnergyTrends.totalExportsForDateRange(_:)(v6);
        double v31 = v35;
        sub_24D1D9A80((uint64_t)v6, &qword_26985BC48);
        if (v29) {
          return (v28 - v31) / (double)v29;
        }
        return 0.0;
      }
      char v39 = v23;
      static EnergyTrends.intervalDateRangeStartingAt(_:displayInterval:with:)(a1, &v39, v15, (uint64_t)v9);
      uint64_t v26 = EnergyTrends.totalExportsForDateRange(_:)(v9);
      double v28 = v27;
      uint64_t v29 = v26;
      EnergyTrends.totalImportsForDateRange(_:)((uint64_t)v9);
      double v31 = v30;
      sub_24D1D9A80((uint64_t)v9, &qword_26985BC48);
      if (!v29) {
        return 0.0;
      }
      return (v28 - v31) / (double)v29;
    default:
      swift_bridgeObjectRelease();
LABEL_7:
      char v38 = v23;
      static EnergyTrends.intervalDateRangeStartingAt(_:displayInterval:with:)(a1, &v38, v15, (uint64_t)v12);
      if (v22) {
        EnergyTrends.totalExportsForDateRange(_:)(v12);
      }
      else {
        EnergyTrends.totalImportsForDateRange(_:)((uint64_t)v12);
      }
      double v32 = v25;
      sub_24D1D9A80((uint64_t)v12, &qword_26985BC48);
      return v32;
  }
}

BOOL EnergyTrends.isNetSurplusForInterval(starting:)(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BC48);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = ((char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  char v15 = *v1;
  uint64_t v6 = type metadata accessor for EnergyTrends();
  static EnergyTrends.intervalDateRangeStartingAt(_:displayInterval:with:)(a1, &v15, (uint64_t)&v1[*(int *)(v6 + 32)], (uint64_t)v5);
  uint64_t v7 = EnergyTrends.totalImportsForDateRange(_:)((uint64_t)v5);
  double v9 = v8;
  uint64_t v10 = v7;
  EnergyTrends.totalExportsForDateRange(_:)(v5);
  double v12 = v11;
  sub_24D1D9A80((uint64_t)v5, &qword_26985BC48);
  return v10 && (v9 - v12) / (double)v10 < 0.0;
}

unint64_t static EnergyTrends.requestSnapshotDates(intervalType:timeZone:)(unsigned __int8 *a1, char *a2)
{
  uint64_t v84 = a2;
  uint64_t v73 = sub_24D218B70();
  uint64_t v79 = *(void **)(v73 - 8);
  MEMORY[0x270FA5388](v73);
  uint64_t v72 = (char *)&v62 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_24D218AC0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v66 = (char *)&v62 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v65 = (char *)&v62 - v9;
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v77 = (char *)&v62 - v11;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v76 = (char *)&v62 - v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v82 = (char *)&v62 - v15;
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v81 = (char *)&v62 - v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v83 = (char *)&v62 - v19;
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v80 = (char *)&v62 - v21;
  MEMORY[0x270FA5388](v20);
  char v23 = (char *)&v62 - v22;
  uint64_t v78 = sub_24D218BB0();
  uint64_t v24 = *(void *)(v78 - 8);
  MEMORY[0x270FA5388](v78);
  uint64_t v26 = (char *)&v62 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_24D218B20();
  uint64_t v28 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388](v27);
  double v30 = (char *)&v62 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = sub_24D218B80();
  uint64_t v62 = *(void *)(v63 - 8);
  MEMORY[0x270FA5388](v63);
  double v32 = (char *)&v62 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = *a1;
  if (v70 < 2) {
    uint64_t v33 = -1;
  }
  else {
    uint64_t v33 = -5;
  }
  (*(void (**)(char *, void, uint64_t))(v28 + 104))(v30, *MEMORY[0x263F07740], v27);
  sub_24D218B30();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v30, v27);
  (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v26, v84, v78);
  uint64_t v84 = v32;
  sub_24D218B60();
  unsigned int v69 = *MEMORY[0x263F078A0];
  uint64_t v67 = (void (**)(char *, uint64_t))(v79 + 1);
  uint64_t v68 = (void (**)(char *, void, uint64_t))(v79 + 13);
  double v34 = (void (**)(char *, uint64_t))(v5 + 8);
  uint64_t v71 = v5;
  uint64_t v78 = v5 + 32;
  uint64_t v79 = (void *)(v5 + 16);
  double v35 = v23;
  unint64_t v36 = MEMORY[0x263F8EE78];
  uint64_t v64 = v23;
  uint64_t v75 = v34;
  while (2)
  {
    char v39 = v80;
    sub_24D218A90();
    char v41 = v72;
    uint64_t v40 = v73;
    (*v68)(v72, v69, v73);
    sub_24D218F70();
    (*v67)(v41, v40);
    char v42 = *v34;
    (*v34)(v39, v4);
    sub_24D218F10();
    switch(v43)
    {
      case 3:
        swift_bridgeObjectRelease();
        goto LABEL_10;
      default:
        char v44 = sub_24D2194E0();
        swift_bridgeObjectRelease();
        if (v44)
        {
LABEL_10:
          sub_24D218B40();
          BOOL v45 = v82;
          sub_24D218F30();
          uint64_t v46 = (void (*)(char *, char *, uint64_t))*v79;
          ((void (*)(char *, char *, uint64_t))*v79)(v76, v45, v4);
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          uint64_t v74 = v46;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
            unint64_t v36 = sub_24D1D0724(0, *(void *)(v36 + 16) + 1, 1, v36);
          }
          unint64_t v49 = *(void *)(v36 + 16);
          unint64_t v48 = *(void *)(v36 + 24);
          if (v49 >= v48 >> 1) {
            unint64_t v36 = sub_24D1D0724(v48 > 1, v49 + 1, 1, v36);
          }
          *(void *)(v36 + 16) = v49 + 1;
          unint64_t v50 = (*(unsigned __int8 *)(v71 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v71 + 80);
          uint64_t v51 = *(void *)(v71 + 72);
          unint64_t v52 = v36 + v50 + v51 * v49;
          uint64_t v53 = *(void (**)(unint64_t, char *, uint64_t))(v71 + 32);
          v53(v52, v76, v4);
          uint64_t v54 = v80;
          sub_24D218EF0();
          unint64_t v55 = v82;
          v42(v82, v4);
          v53((unint64_t)v55, v54, v4);
          v74(v77, v55, v4);
          unint64_t v57 = *(void *)(v36 + 16);
          unint64_t v56 = *(void *)(v36 + 24);
          if (v57 >= v56 >> 1) {
            unint64_t v36 = sub_24D1D0724(v56 > 1, v57 + 1, 1, v36);
          }
          double v34 = v75;
          *(void *)(v36 + 16) = v57 + 1;
          v53(v36 + v50 + v57 * v51, v77, v4);
          v42(v82, v4);
          uint64_t v37 = v81;
          char v38 = v83;
          double v35 = v64;
        }
        else
        {
          uint64_t v58 = v65;
          sub_24D218B40();
          ((void (*)(char *, char *, uint64_t))*v79)(v66, v58, v4);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            unint64_t v36 = sub_24D1D0724(0, *(void *)(v36 + 16) + 1, 1, v36);
          }
          unint64_t v60 = *(void *)(v36 + 16);
          unint64_t v59 = *(void *)(v36 + 24);
          if (v60 >= v59 >> 1) {
            unint64_t v36 = sub_24D1D0724(v59 > 1, v60 + 1, 1, v36);
          }
          *(void *)(v36 + 16) = v60 + 1;
          (*(void (**)(unint64_t, char *, uint64_t))(v71 + 32))(v36+ ((*(unsigned __int8 *)(v71 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v71 + 80))+ *(void *)(v71 + 72) * v60, v66, v4);
          uint64_t v37 = v65;
          char v38 = v83;
        }
        v42(v37, v4);
        v42(v38, v4);
        v42(v35, v4);
        if (++v33 != 1) {
          continue;
        }
        (*(void (**)(char *, uint64_t))(v62 + 8))(v84, v63);
        return v36;
    }
  }
}

uint64_t static EnergyTrends.allocateSeats<A>(for:seats:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24D219020();
  uint64_t v58 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  *(void *)&double v8 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v56 = *(void *)(TupleTypeMetadata2 - 8);
  uint64_t v57 = TupleTypeMetadata2;
  uint64_t v10 = MEMORY[0x270FA5388](TupleTypeMetadata2);
  unint64_t v60 = (char *)&v46 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  unint64_t v59 = (char *)&v46 - v13;
  MEMORY[0x270FA5388](v12);
  unint64_t v55 = (char *)&v46 - v14;
  uint64_t v62 = 0;
  v63[0] = a1;
  sub_24D219060();
  swift_bridgeObjectRetain();
  swift_getWitnessTable();
  unint64_t v15 = 0;
  sub_24D219150();
  uint64_t v16 = swift_bridgeObjectRelease();
  double v17 = v61[0];
  if (v61[0] <= 0.0)
  {
    unint64_t v15 = sub_24D219070();
    if (qword_26B18A2F8 == -1) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v6 = a2;
    double v17 = (double)a2 / v61[0];
    MEMORY[0x270FA5388](v16);
    *((double *)&v46 - 2) = v17;
    uint64_t v62 = sub_24D219070();
    v63[0] = v62;
    v61[4] = 0.0;
    sub_24D219060();
    swift_bridgeObjectRetain();
    swift_getWitnessTable();
    sub_24D219150();
    uint64_t v18 = swift_bridgeObjectRelease();
    if (!__OFSUB__(a2, *(void *)&v61[0]))
    {
      if (a2 - *(void *)&v61[0] < 1) {
        return v63[0];
      }
      MEMORY[0x270FA5388](v18);
      *((double *)&v46 - 2) = v17;
      *(void *)&v61[0] = sub_24D219070();
      MEMORY[0x270FA5388](*(void *)&v61[0]);
      *(&v46 - 2) = a3;
      *(&v46 - 1) = v19;
      uint64_t v58 = a3;
      uint64_t v53 = v19;
      sub_24D219080();
      swift_getWitnessTable();
      uint64_t v20 = sub_24D219160();
      swift_bridgeObjectRelease();
      uint64_t v62 = v20;
      uint64_t v21 = v57;
      sub_24D2191F0();
      swift_getWitnessTable();
      sub_24D2192A0();
      double v8 = v61[0];
      double v22 = v61[1];
      double v23 = v61[2];
      unint64_t v15 = *(void *)&v61[3];
      swift_unknownObjectRetain();
      uint64_t v24 = sub_24D219340();
      swift_unknownObjectRelease();
      uint64_t v25 = sub_24D219360();
      uint64_t v54 = v24;
      if (v24 == v25)
      {
LABEL_5:
        swift_unknownObjectRelease();
        return v63[0];
      }
      uint64_t v51 = *(int *)(v21 + 48);
      int64_t v52 = v15 >> 1;
      uint64_t v50 = v56 + 16;
      uint64_t v49 = v58 - 8;
      uint64_t v47 = (void (**)(char *, uint64_t))(v56 + 8);
      int64_t v36 = v54;
      unint64_t v48 = v15;
      uint64_t v6 = v58;
      while (1)
      {
        sub_24D219350();
        if (v54 < *(uint64_t *)&v23 || v52 <= v36) {
          break;
        }
        double v37 = v22;
        int64_t v38 = *(void *)&v22 + *(void *)(v56 + 72) * v36;
        char v39 = v55;
        (*(void (**)(char *, int64_t, uint64_t))(v56 + 16))(v55, v38, v21);
        double v17 = *(double *)&v39[v51];
        uint64_t v40 = *(int *)(v21 + 48);
        uint64_t v41 = *(void *)(v6 - 8);
        unint64_t v15 = (unint64_t)v59;
        (*(void (**)(char *, char *, uint64_t))(v41 + 32))(v59, v39, v6);
        *(double *)(v15 + v40) = v17;
        uint64_t v42 = *(int *)(v21 + 48);
        int v43 = v60;
        (*(void (**)(char *, unint64_t, uint64_t))(v41 + 16))(v60, v15, v6);
        *(double *)&v43[v42] = v17;
        sub_24D219080();
        BOOL v45 = (void (*)(double *, void))sub_24D219090();
        if ((*(unsigned char *)(v44 + 8) & 1) == 0)
        {
          if (__OFADD__(*(void *)v44, 1))
          {
            __break(1u);
            break;
          }
          ++*(void *)v44;
        }
        v45(v61, 0);
        ++v36;
        uint64_t v21 = v57;
        (*v47)(v59, v57);
        (*(void (**)(char *, uint64_t))(v41 + 8))(v60, v58);
        double v22 = v37;
        unint64_t v15 = v48;
        if (v36 == sub_24D219360()) {
          goto LABEL_5;
        }
      }
      __break(1u);
    }
    __break(1u);
  }
  swift_once();
LABEL_8:
  uint64_t v26 = __swift_project_value_buffer(v6, (uint64_t)qword_26B18A8F0);
  swift_beginAccess();
  uint64_t v27 = v58;
  (*(void (**)(double, uint64_t, uint64_t))(v58 + 16))(COERCE_DOUBLE(*(void *)&v8), v26, v6);
  swift_bridgeObjectRetain();
  uint64_t v28 = sub_24D219000();
  os_log_type_t v29 = sub_24D2192E0();
  if (os_log_type_enabled(v28, v29))
  {
    uint64_t v30 = swift_slowAlloc();
    uint64_t v31 = swift_slowAlloc();
    unint64_t v60 = *(char **)&v8;
    uint64_t v32 = v31;
    v63[0] = v31;
    *(_DWORD *)uint64_t v30 = 136315650;
    uint64_t v62 = sub_24D1D0A78(0xD000000000000019, 0x800000024D21C000, v63);
    unint64_t v59 = (char *)v6;
    sub_24D219310();
    *(_WORD *)(v30 + 12) = 2048;
    uint64_t v62 = *(void *)&v17;
    sub_24D219310();
    *(_WORD *)(v30 + 22) = 2080;
    uint64_t v33 = sub_24D219050();
    uint64_t v62 = sub_24D1D0A78(v33, v34, v63);
    sub_24D219310();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24D1B6000, v28, v29, "%s total %f !!! returning %s", (uint8_t *)v30, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x253322AA0](v32, -1, -1);
    MEMORY[0x253322AA0](v30, -1, -1);

    (*(void (**)(char *, char *))(v27 + 8))(v60, v59);
  }
  else
  {

    swift_bridgeObjectRelease();
    (*(void (**)(double, uint64_t))(v27 + 8))(COERCE_DOUBLE(*(void *)&v8), v6);
  }
  return v15;
}

double sub_24D1E84C0@<D0>(double *a1@<X0>, double *a2@<X1>, double *a3@<X8>)
{
  double result = *a1 + *a2;
  *a3 = result;
  return result;
}

void *sub_24D1E84D4@<X0>(void *result@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  if (__OFADD__(*result, *a2)) {
    __break(1u);
  }
  else {
    *a3 = *result + *a2;
  }
  return result;
}

double *sub_24D1E84F0@<X0>(double *result@<X0>, double *a2@<X8>, double a3@<D0>)
{
  double v3 = *result * a3;
  if ((~*(void *)&v3 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v3 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v3 < 9.22337204e18)
  {
    *a2 = v3 - (double)(uint64_t)v3;
    return result;
  }
LABEL_7:
  __break(1u);
  return result;
}

unint64_t sub_24D1E854C()
{
  unint64_t result = qword_26985BC50;
  if (!qword_26985BC50)
  {
    sub_24D218AC0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26985BC50);
  }
  return result;
}

uint64_t sub_24D1E85A4(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_24D1E85B4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24D211C20(a1, a2, a3, (void *)*v3);
  *double v3 = result;
  return result;
}

double *sub_24D1E85D4@<X0>(double *result@<X0>, void *a2@<X8>)
{
  double v3 = *(double *)(v2 + 16) * *result;
  if ((~*(void *)&v3 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v3 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v3 < 9.22337204e18)
  {
    *a2 = (uint64_t)v3;
    return result;
  }
LABEL_7:
  __break(1u);
  return result;
}

double *sub_24D1E862C@<X0>(double *a1@<X0>, double *a2@<X8>)
{
  return sub_24D1E84F0(a1, a2, *(double *)(v2 + 16));
}

BOOL sub_24D1E8648(uint64_t a1, uint64_t a2)
{
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  return *(double *)(a2 + *(int *)(TupleTypeMetadata2 + 48)) < *(double *)(a1 + *(int *)(TupleTypeMetadata2 + 48));
}

uint64_t *initializeBufferWithCopyOfBuffer for EnergyTrends(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v21 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v21 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    a1[1] = a2[1];
    uint64_t v7 = a3[6];
    double v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_24D218BB0();
    uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
    swift_bridgeObjectRetain();
    v11(v8, v9, v10);
    uint64_t v12 = a3[7];
    uint64_t v13 = a3[8];
    uint64_t v14 = (uint64_t *)((char *)v4 + v12);
    unint64_t v15 = (uint64_t *)((char *)a2 + v12);
    uint64_t v16 = v15[1];
    *uint64_t v14 = *v15;
    v14[1] = v16;
    double v17 = (char *)v4 + v13;
    uint64_t v18 = (char *)a2 + v13;
    uint64_t v19 = sub_24D218B80();
    uint64_t v20 = *(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 16);
    swift_bridgeObjectRetain();
    v20(v17, v18, v19);
  }
  return v4;
}

uint64_t destroy for EnergyTrends(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_24D218BB0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  uint64_t v6 = a1 + *(int *)(a2 + 32);
  uint64_t v7 = sub_24D218B80();
  double v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);

  return v8(v6, v7);
}

uint64_t initializeWithCopy for EnergyTrends(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v6 = a3[6];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_24D218BB0();
  uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  uint64_t v11 = a3[7];
  uint64_t v12 = a3[8];
  uint64_t v13 = (void *)(a1 + v11);
  uint64_t v14 = (void *)(a2 + v11);
  uint64_t v15 = v14[1];
  *uint64_t v13 = *v14;
  v13[1] = v15;
  uint64_t v16 = a1 + v12;
  uint64_t v17 = a2 + v12;
  uint64_t v18 = sub_24D218B80();
  uint64_t v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 16);
  swift_bridgeObjectRetain();
  v19(v16, v17, v18);
  return a1;
}

uint64_t assignWithCopy for EnergyTrends(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[6];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_24D218BB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = a3[7];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  void *v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v13 = a3[8];
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  uint64_t v16 = sub_24D218B80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 24))(v14, v15, v16);
  return a1;
}

uint64_t initializeWithTake for EnergyTrends(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v6 = a3[6];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_24D218BB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = sub_24D218B80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 32))(v11, v12, v13);
  return a1;
}

uint64_t assignWithTake for EnergyTrends(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[6];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_24D218BB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  uint64_t v10 = a3[7];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (uint64_t *)(a2 + v10);
  uint64_t v14 = *v12;
  uint64_t v13 = v12[1];
  void *v11 = v14;
  v11[1] = v13;
  swift_bridgeObjectRelease();
  uint64_t v15 = a3[8];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  uint64_t v18 = sub_24D218B80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 40))(v16, v17, v18);
  return a1;
}

uint64_t getEnumTagSinglePayload for EnergyTrends(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24D1E8D08);
}

uint64_t sub_24D1E8D08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_24D218BB0();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = a1 + *(int *)(a3 + 24);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
      return v12(v11, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_24D218B80();
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      uint64_t v16 = a1 + *(int *)(a3 + 32);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t storeEnumTagSinglePayload for EnergyTrends(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24D1E8E48);
}

uint64_t sub_24D1E8E48(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v8 = sub_24D218BB0();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = v5 + *(int *)(a4 + 24);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_24D218B80();
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = v5 + *(int *)(a4 + 32);
      return v14(v16, a2, a2, v15);
    }
  }
  return result;
}

uint64_t sub_24D1E8F74()
{
  uint64_t result = sub_24D218BB0();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_24D218B80();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_24D1E905C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_24D1E90C4(uint64_t a1)
{
  return sub_24D1E60AC(a1) & 1;
}

void *sub_24D1E90E0()
{
  type metadata accessor for HomeEnergyManager();
  uint64_t v0 = swift_allocObject();
  uint64_t result = sub_24D1E9178();
  qword_26B18A588 = v0;
  return result;
}

uint64_t static HomeEnergyManager.shared.getter()
{
  if (qword_26B18A590 != -1) {
    swift_once();
  }

  return swift_retain();
}

void *sub_24D1E9178()
{
  unint64_t v1 = v0;
  uint64_t v2 = sub_24D219020();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v1[2] = objc_msgSend(self, sel_defaultCenter);
  v1[3] = 0;
  v1[4] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08A48]), sel_init);
  if (qword_26B18A2F8 != -1) {
    swift_once();
  }
  uint64_t v6 = __swift_project_value_buffer(v2, (uint64_t)qword_26B18A8F0);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  uint64_t v7 = sub_24D219000();
  os_log_type_t v8 = sub_24D2192E0();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_24D1B6000, v7, v8, "[GridForecast] Setup notification observer", v9, 2u);
    MEMORY[0x253322AA0](v9, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_24D1E9374();
  return v1;
}

uint64_t sub_24D1E9374()
{
  sub_24D218CC0();
  unint64_t v1 = (void *)sub_24D2190E0();
  swift_bridgeObjectRelease();
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = (void *)v0[4];
  v9[4] = sub_24D1FCA98;
  uint64_t v10 = v0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 1107296256;
  v9[2] = sub_24D1DCDF4;
  v9[3] = &block_descriptor_5;
  uint64_t v4 = _Block_copy(v9);
  id v5 = v1;
  id v6 = v3;
  swift_retain();
  swift_release();
  id v7 = objc_msgSend(v2, sel_addObserverForName_object_queue_usingBlock_, v5, 0, v6, v4);
  _Block_release(v4);

  v0[3] = v7;
  return swift_unknownObjectRelease();
}

uint64_t sub_24D1E94A0()
{
  uint64_t v0 = sub_24D219020();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)&v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B18A2F8 != -1) {
    swift_once();
  }
  uint64_t v4 = __swift_project_value_buffer(v0, (uint64_t)qword_26B18A8F0);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  id v5 = sub_24D219000();
  os_log_type_t v6 = sub_24D2192E0();
  if (os_log_type_enabled(v5, v6))
  {
    id v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_24D1B6000, v5, v6, "[GridForecast] Received notification from daemon", v7, 2u);
    MEMORY[0x253322AA0](v7, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  uint64_t v8 = sub_24D2189F0();
  if (!v8)
  {
    long long v24 = 0u;
    long long v25 = 0u;
LABEL_14:
    sub_24D1D9A80((uint64_t)&v24, &qword_26B18A5D8);
    goto LABEL_15;
  }
  uint64_t v9 = v8;
  uint64_t v21 = sub_24D218C70();
  uint64_t v22 = v10;
  sub_24D2193A0();
  if (*(void *)(v9 + 16) && (unint64_t v11 = sub_24D1D126C((uint64_t)v23), (v12 & 1) != 0))
  {
    sub_24D1D6414(*(void *)(v9 + 56) + 32 * v11, (uint64_t)&v24);
  }
  else
  {
    long long v24 = 0u;
    long long v25 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_24D1D98B8((uint64_t)v23);
  if (!*((void *)&v25 + 1)) {
    goto LABEL_14;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A608);
  if (swift_dynamicCast())
  {
    uint64_t v13 = sub_24D1D97C4(v23[0]);
    swift_bridgeObjectRelease();
    sub_24D1FCB0C(v13);
    swift_bridgeObjectRelease();
  }
LABEL_15:
  uint64_t v14 = sub_24D2189F0();
  if (!v14)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    return sub_24D1D9A80((uint64_t)&v24, &qword_26B18A5D8);
  }
  uint64_t v15 = v14;
  uint64_t v21 = sub_24D218C60();
  uint64_t v22 = v16;
  sub_24D2193A0();
  if (*(void *)(v15 + 16) && (unint64_t v17 = sub_24D1D126C((uint64_t)v23), (v18 & 1) != 0))
  {
    sub_24D1D6414(*(void *)(v15 + 56) + 32 * v17, (uint64_t)&v24);
  }
  else
  {
    long long v24 = 0u;
    long long v25 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_24D1D98B8((uint64_t)v23);
  if (!*((void *)&v25 + 1)) {
    return sub_24D1D9A80((uint64_t)&v24, &qword_26B18A5D8);
  }
  uint64_t result = swift_dynamicCast();
  if ((result & 1) != 0 && LOBYTE(v23[0]) == 1) {
    return sub_24D1FCF9C();
  }
  return result;
}

uint64_t sub_24D1E9810()
{
  return MEMORY[0x270FA2498](sub_24D1E982C, 0, 0);
}

uint64_t sub_24D1E982C()
{
  if (sub_24D218C50())
  {
    uint64_t v1 = (void *)swift_task_alloc();
    *(void *)(v0 + 152) = v1;
    uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(qword_26985BF50);
    *uint64_t v1 = v0;
    v1[1] = sub_24D1E9A48;
    return MEMORY[0x270FA2360](v0 + 144, 0, 0, 0x446C6C41706D7564, 0xED00002928617461, sub_24D1E9B90, 0, v2);
  }
  else
  {
    *(void *)(v0 + 40) = MEMORY[0x263F8D4F8];
    *(unsigned char *)(v0 + 16) = 0;
    sub_24D1D97B4((_OWORD *)(v0 + 16), (_OWORD *)(v0 + 48));
    uint64_t v3 = MEMORY[0x263F8EE80];
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_24D1FADE4((_OWORD *)(v0 + 48), 0x737574617473, 0xE600000000000000, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    uint64_t v5 = MEMORY[0x263F8D310];
    *(void *)(v0 + 80) = 0xD00000000000002DLL;
    *(void *)(v0 + 104) = v5;
    *(void *)(v0 + 88) = 0x800000024D21C020;
    sub_24D1D97B4((_OWORD *)(v0 + 80), (_OWORD *)(v0 + 112));
    char v6 = swift_isUniquelyReferenced_nonNull_native();
    sub_24D1FADE4((_OWORD *)(v0 + 112), 0x654D737574617473, 0xED00006567617373, v6);
    swift_bridgeObjectRelease();
    id v7 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return v7(v3);
  }
}

uint64_t sub_24D1E9A48()
{
  *(void *)(*(void *)v1 + 160) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24D1E9B78;
  }
  else {
    uint64_t v2 = sub_24D1E9B5C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D1E9B5C()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 144));
}

uint64_t sub_24D1E9B78()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24D1E9B90(uint64_t a1)
{
  return sub_24D1F6AD4(a1, &qword_26985C200, (uint64_t)&unk_26FF7B8C8, (uint64_t)&unk_26985C210);
}

uint64_t sub_24D1E9BB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[17] = a4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985C200);
  v4[18] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v4[19] = v6;
  v4[20] = *(void *)(v6 + 64);
  v4[21] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D1E9C84, 0, 0);
}

uint64_t sub_24D1E9C84()
{
  uint64_t v1 = v0[21];
  uint64_t v2 = v0[18];
  uint64_t v3 = v0[19];
  uint64_t v4 = v0[17];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[22] = sub_24D217288();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v6 + v5, v1, v2);
  id v7 = (void *)sub_24D217944((uint64_t)sub_24D1FFB00, v6);
  v0[23] = v7;
  swift_release();
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_24D1E9E5C;
  uint64_t v8 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_24D1EA2AC;
  v0[13] = &block_descriptor_239;
  v0[14] = v8;
  objc_msgSend(v7, sel_dumpAllDataWithCompletionHandler_, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_24D1E9E5C()
{
  return MEMORY[0x270FA2498](sub_24D1E9F3C, 0, 0);
}

uint64_t sub_24D1E9F3C()
{
  uint64_t v1 = v0[22];
  uint64_t v2 = v0[15];
  swift_unknownObjectRelease();
  objc_msgSend(*(id *)(v1 + 16), sel_invalidate);
  v0[16] = v2;
  sub_24D219220();
  swift_release();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_24D1E9FE8(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_24D219020();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B18A8E8 != -1) {
    swift_once();
  }
  uint64_t v8 = __swift_project_value_buffer(v4, (uint64_t)qword_26B18A908);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  id v9 = a1;
  id v10 = a1;
  unint64_t v11 = sub_24D219000();
  os_log_type_t v12 = sub_24D2192D0();
  if (os_log_type_enabled(v11, v12))
  {
    void v20[2] = a2;
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v21 = (uint64_t)a1;
    uint64_t v22 = v14;
    *(_DWORD *)uint64_t v13 = 136315138;
    v20[1] = v13 + 4;
    id v15 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5D0);
    uint64_t v16 = sub_24D219100();
    uint64_t v21 = sub_24D1D0A78(v16, v17, &v22);
    sub_24D219310();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_24D1B6000, v11, v12, "Failed to dump all data. %s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253322AA0](v14, -1, -1);
    MEMORY[0x253322AA0](v13, -1, -1);
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v22 = (uint64_t)a1;
  id v18 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985C200);
  return sub_24D219210();
}

uint64_t sub_24D1EA2AC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  **(void **)(*(void *)(v1 + 64) + 40) = sub_24D219040();

  return swift_continuation_resume();
}

uint64_t sub_24D1EA324(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  *(void *)(v4 + 24) = a2;
  *(void *)(v4 + 32) = a4;
  *(unsigned char *)(v4 + 64) = a3;
  *(void *)(v4 + 16) = a1;
  return MEMORY[0x270FA2498](sub_24D1EA34C, 0, 0);
}

uint64_t sub_24D1EA34C()
{
  if (sub_24D218C50())
  {
    uint64_t v2 = *(void *)(v0 + 24);
    uint64_t v1 = *(void *)(v0 + 32);
    char v3 = *(unsigned char *)(v0 + 64);
    uint64_t v4 = *(void *)(v0 + 16);
    uint64_t v5 = swift_task_alloc();
    *(void *)(v0 + 40) = v5;
    *(void *)(v5 + 16) = v4;
    *(void *)(v5 + 24) = v2;
    *(unsigned char *)(v5 + 32) = v3;
    *(void *)(v5 + 40) = v1;
    uint64_t v6 = (void *)swift_task_alloc();
    *(void *)(v0 + 48) = v6;
    *uint64_t v6 = v0;
    uint64_t v7 = MEMORY[0x263F8EE60];
    v6[1] = sub_24D1EA49C;
    return MEMORY[0x270FA2360](v6, 0, 0, 0xD00000000000002FLL, 0x800000024D21C050, sub_24D1FAF38, v5, v7 + 8);
  }
  else
  {
    uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
    return v8();
  }
}

uint64_t sub_24D1EA49C()
{
  *(void *)(*(void *)v1 + 56) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_24D1EA5B8;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_24D1C4300;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D1EA5B8()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24D1EA61C(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5)
{
  int v27 = a4;
  uint64_t v25 = a2;
  uint64_t v26 = a3;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A610);
  uint64_t v24 = *(void *)(v7 - 8);
  uint64_t v8 = *(void *)(v24 + 64);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A808);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v9);
  os_log_type_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5B0);
  MEMORY[0x270FA5388](v13 - 8);
  id v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_24D219240();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v15, 1, 1, v16);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a1, v9);
  sub_24D1FF548(a5, (uint64_t)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v17 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v18 = (v11 + v17 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v19 = (*(unsigned __int8 *)(v24 + 80) + v18 + 17) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = 0;
  *(void *)(v20 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v20 + v17, v12, v9);
  unint64_t v21 = v20 + v18;
  uint64_t v22 = v26;
  *(void *)unint64_t v21 = v25;
  *(void *)(v21 + 8) = v22;
  *(unsigned char *)(v21 + 16) = v27;
  sub_24D1DC0B8((uint64_t)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v20 + v19, &qword_26B18A610);
  swift_bridgeObjectRetain();
  sub_24D1BA610((uint64_t)v15, (uint64_t)&unk_26985C1F8, v20);
  return swift_release();
}

uint64_t sub_24D1EA8D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8)
{
  *(unsigned char *)(v8 + 280) = a7;
  *(void *)(v8 + 168) = a6;
  *(void *)(v8 + 176) = a8;
  *(void *)(v8 + 152) = a4;
  *(void *)(v8 + 160) = a5;
  uint64_t v9 = sub_24D219020();
  *(void *)(v8 + 184) = v9;
  *(void *)(v8 + 192) = *(void *)(v9 - 8);
  *(void *)(v8 + 200) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A610);
  *(void *)(v8 + 208) = swift_task_alloc();
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A808);
  *(void *)(v8 + 216) = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  *(void *)(v8 + 224) = v11;
  *(void *)(v8 + 232) = *(void *)(v11 + 64);
  *(void *)(v8 + 240) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D1EAA30, 0, 0);
}

uint64_t sub_24D1EAA30()
{
  uint64_t v1 = *(void *)(v0 + 240);
  uint64_t v2 = *(void *)(v0 + 216);
  uint64_t v3 = *(void *)(v0 + 224);
  uint64_t v4 = *(void *)(v0 + 168);
  uint64_t v5 = *(void *)(v0 + 152);
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  *(void *)(v0 + 248) = sub_24D217288();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v5, v2);
  unint64_t v6 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v7 + v6, v1, v2);
  uint64_t v8 = (void *)sub_24D217944((uint64_t)sub_24D1FF910, v7);
  *(void *)(v0 + 256) = v8;
  swift_release();
  if (v4) {
    uint64_t v9 = sub_24D2190E0();
  }
  else {
    uint64_t v9 = 0;
  }
  *(void *)(v0 + 264) = v9;
  uint64_t v10 = *(void *)(v0 + 208);
  sub_24D1FF548(*(void *)(v0 + 176), v10);
  uint64_t v11 = sub_24D218AC0();
  uint64_t v12 = *(void *)(v11 - 8);
  int v13 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11);
  uint64_t v14 = 0;
  if (v13 != 1)
  {
    uint64_t v15 = *(void *)(v0 + 208);
    uint64_t v14 = sub_24D218A40();
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v15, v11);
  }
  *(void *)(v0 + 272) = v14;
  uint64_t v16 = *(unsigned __int8 *)(v0 + 280);
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 24) = sub_24D1EACBC;
  uint64_t v17 = swift_continuation_init();
  *(void *)(v0 + 80) = MEMORY[0x263EF8330];
  *(void *)(v0 + 88) = 0x40000000;
  *(void *)(v0 + 96) = sub_24D2000D4;
  *(void *)(v0 + 104) = &block_descriptor_231;
  *(void *)(v0 + 112) = v17;
  objc_msgSend(v8, sel_useMockDataWithFilePath_disableMock_validityDate_completionHandler_, v9, v16, v14, v0 + 80);
  return MEMORY[0x270FA23F0](v0 + 16);
}

uint64_t sub_24D1EACBC()
{
  return MEMORY[0x270FA2498](sub_24D1EAD9C, 0, 0);
}

uint64_t sub_24D1EAD9C()
{
  uint64_t v23 = v0;
  uint64_t v2 = *(void **)(v0 + 264);
  uint64_t v1 = *(void **)(v0 + 272);
  uint64_t v3 = *(void *)(v0 + 248);
  swift_unknownObjectRelease();

  objc_msgSend(*(id *)(v3 + 16), sel_invalidate);
  if (qword_26B18A2F8 != -1) {
    swift_once();
  }
  uint64_t v5 = *(void *)(v0 + 192);
  uint64_t v4 = *(void *)(v0 + 200);
  uint64_t v6 = *(void *)(v0 + 184);
  uint64_t v7 = __swift_project_value_buffer(v6, (uint64_t)qword_26B18A8F0);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v4, v7, v6);
  uint64_t v8 = sub_24D219000();
  os_log_type_t v9 = sub_24D2192E0();
  BOOL v10 = os_log_type_enabled(v8, v9);
  uint64_t v11 = *(void *)(v0 + 192);
  uint64_t v12 = *(void *)(v0 + 200);
  uint64_t v13 = *(void *)(v0 + 184);
  if (v10)
  {
    int v14 = *(unsigned __int8 *)(v0 + 280);
    uint64_t v21 = *(void *)(v0 + 200);
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    *(_DWORD *)uint64_t v15 = 136315138;
    uint64_t v22 = v16;
    if (v14) {
      uint64_t v17 = 0x64656C6261736964;
    }
    else {
      uint64_t v17 = 0x64656C62616E65;
    }
    if (v14) {
      unint64_t v18 = 0xE800000000000000;
    }
    else {
      unint64_t v18 = 0xE700000000000000;
    }
    *(void *)(v0 + 144) = sub_24D1D0A78(v17, v18, &v22);
    sub_24D219310();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24D1B6000, v8, v9, "Mock Data usage: %s", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253322AA0](v16, -1, -1);
    MEMORY[0x253322AA0](v15, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v21, v13);
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v12, v13);
  }
  sub_24D219220();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v19 = *(uint64_t (**)(void))(v0 + 8);
  return v19();
}

uint64_t sub_24D1EB048(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_24D219020();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B18A2F8 != -1) {
    swift_once();
  }
  uint64_t v8 = __swift_project_value_buffer(v4, (uint64_t)qword_26B18A8F0);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  id v9 = a1;
  id v10 = a1;
  uint64_t v11 = sub_24D219000();
  os_log_type_t v12 = sub_24D2192D0();
  if (os_log_type_enabled(v11, v12))
  {
    void v20[2] = a2;
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v21 = (uint64_t)a1;
    uint64_t v22 = v14;
    *(_DWORD *)uint64_t v13 = 136446210;
    v20[1] = v13 + 4;
    id v15 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5D0);
    uint64_t v16 = sub_24D219100();
    uint64_t v21 = sub_24D1D0A78(v16, v17, &v22);
    sub_24D219310();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_24D1B6000, v11, v12, "Failed to set mock data. %{public}s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253322AA0](v14, -1, -1);
    MEMORY[0x253322AA0](v13, -1, -1);
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v22 = (uint64_t)a1;
  id v18 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A808);
  return sub_24D219210();
}

uint64_t sub_24D1EB30C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 104) = a1;
  *(void *)(v3 + 112) = a2;
  long long v4 = *(_OWORD *)(a3 + 48);
  *(_OWORD *)(v3 + 48) = *(_OWORD *)(a3 + 32);
  *(_OWORD *)(v3 + 64) = v4;
  *(unsigned char *)(v3 + 80) = *(unsigned char *)(a3 + 64);
  long long v5 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)(v3 + 16) = *(_OWORD *)a3;
  *(_OWORD *)(v3 + 32) = v5;
  return MEMORY[0x270FA2498](sub_24D1EB344, 0, 0);
}

uint64_t sub_24D1EB344()
{
  if (sub_24D218C50())
  {
    uint64_t v2 = v0[13];
    uint64_t v1 = v0[14];
    uint64_t v3 = (void *)swift_task_alloc();
    v0[15] = v3;
    v3[2] = v2;
    v3[3] = v1;
    v3[4] = v0 + 2;
    long long v4 = (void *)swift_task_alloc();
    v0[16] = v4;
    *long long v4 = v0;
    v4[1] = sub_24D1EB49C;
    uint64_t v5 = MEMORY[0x263F8D310];
    return MEMORY[0x270FA2360](v0 + 11, 0, 0, 0xD000000000000031, 0x800000024D21C080, sub_24D1FAF48, v3, v5);
  }
  else
  {
    uint64_t v6 = (uint64_t (*)(void, unint64_t))v0[1];
    return v6(0, 0xE000000000000000);
  }
}

uint64_t sub_24D1EB49C()
{
  *(void *)(*(void *)v1 + 136) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_24D1EB5D4;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_24D1EB5B8;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D1EB5B8()
{
  return (*(uint64_t (**)(void, void))(v0 + 8))(*(void *)(v0 + 88), *(void *)(v0 + 96));
}

uint64_t sub_24D1EB5D4()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24D1EB638(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v24 = a2;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985C1D8);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x270FA5388](v7);
  id v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5B0);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_24D219240();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 1, 1, v14);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a1, v7);
  unint64_t v15 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  unint64_t v16 = (v9 + v15 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = 0;
  *(void *)(v17 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v17 + v15, v10, v7);
  id v18 = (void *)(v17 + v16);
  *id v18 = v24;
  v18[1] = a3;
  unint64_t v19 = v17 + ((v16 + 23) & 0xFFFFFFFFFFFFFFF8);
  *(unsigned char *)(v19 + 64) = *(unsigned char *)(a4 + 64);
  long long v20 = *(_OWORD *)(a4 + 48);
  *(_OWORD *)(v19 + 32) = *(_OWORD *)(a4 + 32);
  *(_OWORD *)(v19 + 48) = v20;
  long long v21 = *(_OWORD *)(a4 + 16);
  *(_OWORD *)unint64_t v19 = *(_OWORD *)a4;
  *(_OWORD *)(v19 + 16) = v21;
  swift_bridgeObjectRetain();
  sub_24D1FECA4(a4);
  sub_24D1BA610((uint64_t)v13, (uint64_t)&unk_26985C1E8, v17);
  return swift_release();
}

uint64_t sub_24D1EB864(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[24] = a6;
  v7[25] = a7;
  v7[22] = a4;
  v7[23] = a5;
  uint64_t v8 = sub_24D219020();
  v7[26] = v8;
  v7[27] = *(void *)(v8 - 8);
  v7[28] = swift_task_alloc();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985C1D8);
  v7[29] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v7[30] = v10;
  v7[31] = *(void *)(v10 + 64);
  v7[32] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D1EB990, 0, 0);
}

uint64_t sub_24D1EB990()
{
  uint64_t v1 = v0[32];
  uint64_t v3 = v0[29];
  uint64_t v2 = v0[30];
  uint64_t v4 = v0[22];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[33] = sub_24D217288();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  unint64_t v5 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v6 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v2 + 32))(v6 + v5, v1, v3);
  uint64_t v7 = (void *)sub_24D217944((uint64_t)sub_24D1FF528, v6);
  v0[34] = v7;
  swift_release();
  uint64_t v8 = sub_24D2190E0();
  v0[35] = v8;
  sub_24D215AD0();
  uint64_t v9 = sub_24D219030();
  v0[36] = v9;
  swift_bridgeObjectRelease();
  v0[2] = v0;
  v0[7] = v0 + 18;
  v0[3] = sub_24D1EBBDC;
  uint64_t v10 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_24D1EC168;
  v0[13] = &block_descriptor_223;
  v0[14] = v10;
  objc_msgSend(v7, sel_testNotificationsForGridID_notificationContext_completionHandler_, v8, v9);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_24D1EBBDC()
{
  return MEMORY[0x270FA2498](sub_24D1EBCBC, 0, 0);
}

uint64_t sub_24D1EBCBC()
{
  uint64_t v2 = (void *)v0[35];
  uint64_t v1 = (void *)v0[36];
  uint64_t v3 = v0[33];
  uint64_t v4 = v0[19];
  uint64_t v17 = v0[18];
  swift_unknownObjectRelease();

  objc_msgSend(*(id *)(v3 + 16), sel_invalidate);
  if (qword_26B18A2F8 != -1) {
    swift_once();
  }
  uint64_t v6 = v0[27];
  uint64_t v5 = v0[28];
  uint64_t v7 = v0[26];
  uint64_t v8 = __swift_project_value_buffer(v7, (uint64_t)qword_26B18A8F0);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v5, v8, v7);
  uint64_t v9 = sub_24D219000();
  os_log_type_t v10 = sub_24D2192B0();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_24D1B6000, v9, v10, "Test notification triggered", v11, 2u);
    MEMORY[0x253322AA0](v11, -1, -1);
  }
  uint64_t v12 = v0[28];
  uint64_t v13 = v0[26];
  uint64_t v14 = v0[27];

  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v12, v13);
  v0[20] = v17;
  v0[21] = v4;
  sub_24D219220();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v15 = (uint64_t (*)(void))v0[1];
  return v15();
}

uint64_t sub_24D1EBEA4(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_24D219020();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B18A2F8 != -1) {
    swift_once();
  }
  uint64_t v8 = __swift_project_value_buffer(v4, (uint64_t)qword_26B18A8F0);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  id v9 = a1;
  id v10 = a1;
  uint64_t v11 = sub_24D219000();
  os_log_type_t v12 = sub_24D2192D0();
  if (os_log_type_enabled(v11, v12))
  {
    void v20[2] = a2;
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v21 = (uint64_t)a1;
    uint64_t v22 = v14;
    *(_DWORD *)uint64_t v13 = 136446210;
    v20[1] = v13 + 4;
    id v15 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5D0);
    uint64_t v16 = sub_24D219100();
    uint64_t v21 = sub_24D1D0A78(v16, v17, &v22);
    sub_24D219310();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_24D1B6000, v11, v12, "Failed to set Home Energy Notification.%{public}s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253322AA0](v14, -1, -1);
    MEMORY[0x253322AA0](v13, -1, -1);
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v22 = (uint64_t)a1;
  id v18 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985C1D8);
  return sub_24D219210();
}

uint64_t sub_24D1EC168(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = sub_24D2190F0();
  uint64_t v3 = *(uint64_t **)(*(void *)(v1 + 64) + 40);
  *uint64_t v3 = v2;
  v3[1] = v4;

  return swift_continuation_resume();
}

uint64_t sub_24D1EC1C0(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return MEMORY[0x270FA2498](sub_24D1EC1E0, 0, 0);
}

uint64_t sub_24D1EC1E0()
{
  if (sub_24D218C50())
  {
    uint64_t v1 = v0[2];
    uint64_t v2 = swift_task_alloc();
    v0[3] = v2;
    *(void *)(v2 + 16) = v1;
    uint64_t v3 = (void *)swift_task_alloc();
    v0[4] = v3;
    *uint64_t v3 = v0;
    uint64_t v4 = MEMORY[0x263F8EE60];
    v3[1] = sub_24D1EC308;
    return MEMORY[0x270FA2360](v3, 0, 0, 0xD000000000000019, 0x800000024D21C0C0, sub_24D1FAF54, v2, v4 + 8);
  }
  else
  {
    uint64_t v5 = (uint64_t (*)(void))v0[1];
    return v5();
  }
}

uint64_t sub_24D1EC308()
{
  *(void *)(*(void *)v1 + 40) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_24D1EC424;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_24D1C4300;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D1EC424()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24D1EC488(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A808);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5B0);
  MEMORY[0x270FA5388](v7 - 8);
  id v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_24D219240();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  unint64_t v11 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = 0;
  *(void *)(v12 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v12 + v11, (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  *(void *)(v12 + ((v6 + v11 + 7) & 0xFFFFFFFFFFFFFFF8)) = a2;
  swift_bridgeObjectRetain();
  sub_24D1BA610((uint64_t)v9, (uint64_t)&unk_26985C1D0, v12);
  return swift_release();
}

uint64_t sub_24D1EC66C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[18] = a4;
  v5[19] = a5;
  uint64_t v6 = sub_24D219020();
  v5[20] = v6;
  v5[21] = *(void *)(v6 - 8);
  v5[22] = swift_task_alloc();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A808);
  v5[23] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v5[24] = v8;
  v5[25] = *(void *)(v8 + 64);
  v5[26] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D1EC794, 0, 0);
}

uint64_t sub_24D1EC794()
{
  uint64_t v1 = v0[26];
  uint64_t v2 = v0[23];
  uint64_t v3 = v0[24];
  uint64_t v4 = v0[18];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[27] = sub_24D217288();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v6 + v5, v1, v2);
  uint64_t v7 = (void *)sub_24D217944((uint64_t)sub_24D1FF298, v6);
  v0[28] = v7;
  swift_release();
  uint64_t v8 = sub_24D219260();
  v0[29] = v8;
  v0[2] = v0;
  v0[3] = sub_24D1EC984;
  uint64_t v9 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_24D2000D4;
  v0[13] = &block_descriptor_215;
  v0[14] = v9;
  objc_msgSend(v7, sel_testDelegateForGridIds_completionHandler_, v8, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_24D1EC984()
{
  return MEMORY[0x270FA2498](sub_24D1ECA64, 0, 0);
}

uint64_t sub_24D1ECA64()
{
  uint64_t v1 = (void *)v0[29];
  uint64_t v2 = v0[27];
  swift_unknownObjectRelease();

  objc_msgSend(*(id *)(v2 + 16), sel_invalidate);
  if (qword_26B18A2F8 != -1) {
    swift_once();
  }
  uint64_t v4 = v0[21];
  uint64_t v3 = v0[22];
  uint64_t v5 = v0[20];
  uint64_t v6 = __swift_project_value_buffer(v5, (uint64_t)qword_26B18A8F0);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v3, v6, v5);
  uint64_t v7 = sub_24D219000();
  os_log_type_t v8 = sub_24D2192B0();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_24D1B6000, v7, v8, "Test delegate", v9, 2u);
    MEMORY[0x253322AA0](v9, -1, -1);
  }
  uint64_t v10 = v0[22];
  uint64_t v11 = v0[20];
  uint64_t v12 = v0[21];

  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
  sub_24D219220();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v13 = (uint64_t (*)(void))v0[1];
  return v13();
}

uint64_t sub_24D1ECC28(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_24D219020();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B18A2F8 != -1) {
    swift_once();
  }
  uint64_t v8 = __swift_project_value_buffer(v4, (uint64_t)qword_26B18A8F0);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  id v9 = a1;
  id v10 = a1;
  uint64_t v11 = sub_24D219000();
  os_log_type_t v12 = sub_24D2192D0();
  if (os_log_type_enabled(v11, v12))
  {
    void v20[2] = a2;
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v21 = (uint64_t)a1;
    uint64_t v22 = v14;
    *(_DWORD *)uint64_t v13 = 136446210;
    v20[1] = v13 + 4;
    id v15 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5D0);
    uint64_t v16 = sub_24D219100();
    uint64_t v21 = sub_24D1D0A78(v16, v17, &v22);
    sub_24D219310();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_24D1B6000, v11, v12, "Failed to test Home Energy Delegate.%{public}s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253322AA0](v14, -1, -1);
    MEMORY[0x253322AA0](v13, -1, -1);
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v22 = (uint64_t)a1;
  id v18 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A808);
  return sub_24D219210();
}

uint64_t sub_24D1ECEEC()
{
  return MEMORY[0x270FA2498](sub_24D1ECF08, 0, 0);
}

uint64_t sub_24D1ECF08()
{
  if (sub_24D218C50())
  {
    uint64_t v1 = (void *)swift_task_alloc();
    *(void *)(v0 + 16) = v1;
    *uint64_t v1 = v0;
    uint64_t v2 = MEMORY[0x263F8EE60];
    v1[1] = sub_24D1ED018;
    return MEMORY[0x270FA2360](v1, 0, 0, 0xD000000000000017, 0x800000024D21C0E0, sub_24D1ED12C, 0, v2 + 8);
  }
  else
  {
    uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
    return v3();
  }
}

uint64_t sub_24D1ED018()
{
  *(void *)(*(void *)v1 + 24) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24D1FFD64;
  }
  else {
    uint64_t v2 = sub_24D1FFD8C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D1ED12C(uint64_t a1)
{
  return sub_24D1F6AD4(a1, &qword_26B18A808, (uint64_t)&unk_26FF7B788, (uint64_t)&unk_26985C1C0);
}

uint64_t sub_24D1ED154(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[18] = a4;
  uint64_t v5 = sub_24D219020();
  v4[19] = v5;
  v4[20] = *(void *)(v5 - 8);
  v4[21] = swift_task_alloc();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A808);
  v4[22] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v4[23] = v7;
  v4[24] = *(void *)(v7 + 64);
  v4[25] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D1ED27C, 0, 0);
}

uint64_t sub_24D1ED27C()
{
  uint64_t v1 = v0[25];
  uint64_t v2 = v0[22];
  uint64_t v3 = v0[23];
  uint64_t v4 = v0[18];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[26] = sub_24D217288();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v6 + v5, v1, v2);
  uint64_t v7 = (void *)sub_24D217944((uint64_t)sub_24D1FF058, v6);
  v0[27] = v7;
  swift_release();
  v0[2] = v0;
  v0[3] = sub_24D1ED444;
  uint64_t v8 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_24D2000D4;
  v0[13] = &block_descriptor_207;
  v0[14] = v8;
  objc_msgSend(v7, sel_testSetMockURLSessionWithCompletionHandler_, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_24D1ED444()
{
  return MEMORY[0x270FA2498](sub_24D1ED524, 0, 0);
}

uint64_t sub_24D1ED524()
{
  uint64_t v1 = v0[26];
  swift_unknownObjectRelease();
  objc_msgSend(*(id *)(v1 + 16), sel_invalidate);
  if (qword_26B18A2F8 != -1) {
    swift_once();
  }
  uint64_t v3 = v0[20];
  uint64_t v2 = v0[21];
  uint64_t v4 = v0[19];
  uint64_t v5 = __swift_project_value_buffer(v4, (uint64_t)qword_26B18A8F0);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  uint64_t v6 = sub_24D219000();
  os_log_type_t v7 = sub_24D2192B0();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_24D1B6000, v6, v7, "Set mock url session", v8, 2u);
    MEMORY[0x253322AA0](v8, -1, -1);
  }
  uint64_t v9 = v0[21];
  uint64_t v10 = v0[19];
  uint64_t v11 = v0[20];

  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
  sub_24D219220();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  os_log_type_t v12 = (uint64_t (*)(void))v0[1];
  return v12();
}

uint64_t sub_24D1ED6E0(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_24D219020();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  os_log_type_t v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B18A2F8 != -1) {
    swift_once();
  }
  uint64_t v8 = __swift_project_value_buffer(v4, (uint64_t)qword_26B18A8F0);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  id v9 = a1;
  id v10 = a1;
  uint64_t v11 = sub_24D219000();
  os_log_type_t v12 = sub_24D2192D0();
  if (os_log_type_enabled(v11, v12))
  {
    void v20[2] = a2;
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v21 = (uint64_t)a1;
    uint64_t v22 = v14;
    *(_DWORD *)uint64_t v13 = 136446210;
    v20[1] = v13 + 4;
    id v15 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5D0);
    uint64_t v16 = sub_24D219100();
    uint64_t v21 = sub_24D1D0A78(v16, v17, &v22);
    sub_24D219310();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_24D1B6000, v11, v12, "Failed to set URL Session for Home Services.%{public}s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253322AA0](v14, -1, -1);
    MEMORY[0x253322AA0](v13, -1, -1);
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v22 = (uint64_t)a1;
  id v18 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A808);
  return sub_24D219210();
}

uint64_t sub_24D1ED9A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[5] = a3;
  v4[6] = a4;
  v4[3] = a1;
  void v4[4] = a2;
  return MEMORY[0x270FA2498](sub_24D1ED9C8, 0, 0);
}

uint64_t sub_24D1ED9C8()
{
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v1 = *(void *)(v0 + 48);
  long long v6 = *(_OWORD *)(v0 + 24);
  uint64_t v3 = swift_task_alloc();
  *(void *)(v0 + 56) = v3;
  *(_OWORD *)(v3 + 16) = v6;
  *(void *)(v3 + 32) = v2;
  *(void *)(v3 + 40) = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_24D1EDADC;
  return MEMORY[0x270FA2360](v0 + 16, 0, 0, 0xD00000000000003DLL, 0x800000024D21C100, sub_24D1FAF5C, v3, &type metadata for HomeEnergyNotificationStatus);
}

uint64_t sub_24D1EDADC()
{
  *(void *)(*(void *)v1 + 72) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_24D1EDBF8;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_24D1DE1C8;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D1EDBF8()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24D1EDC5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v20 = a4;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5A0);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5B0);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_24D219240();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v14, 1, 1, v15);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v9);
  unint64_t v16 = (*(unsigned __int8 *)(v10 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v17 = (char *)swift_allocObject();
  *((void *)v17 + 2) = 0;
  *((void *)v17 + 3) = 0;
  *((void *)v17 + 4) = a2;
  *((void *)v17 + 5) = a3;
  *((void *)v17 + 6) = v20;
  *((void *)v17 + 7) = a5;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v17[v16], (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_24D1BA610((uint64_t)v14, (uint64_t)&unk_26985C1B0, (uint64_t)v17);
  return swift_release();
}

uint64_t sub_24D1EDE5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[25] = a7;
  v8[26] = a8;
  v8[23] = a5;
  v8[24] = a6;
  v8[22] = a4;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5A0);
  v8[27] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v8[28] = v10;
  v8[29] = *(void *)(v10 + 64);
  v8[30] = swift_task_alloc();
  uint64_t v11 = sub_24D219020();
  v8[31] = v11;
  v8[32] = *(void *)(v11 - 8);
  v8[33] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D1EDF8C, 0, 0);
}

uint64_t sub_24D1EDF8C()
{
  int64_t v36 = v0;
  if (qword_26B18A2F8 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[32];
  uint64_t v2 = v0[33];
  uint64_t v3 = v0[31];
  unint64_t v4 = v0[25];
  uint64_t v5 = __swift_project_value_buffer(v3, (uint64_t)qword_26B18A8F0);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v2, v5, v3);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  long long v6 = sub_24D219000();
  os_log_type_t v7 = sub_24D2192B0();
  BOOL v8 = os_log_type_enabled(v6, v7);
  uint64_t v10 = v0[32];
  uint64_t v9 = v0[33];
  uint64_t v11 = v0[31];
  if (v8)
  {
    os_log_type_t type = v7;
    uint64_t v12 = v0[22];
    uint64_t v28 = v0[25];
    uint64_t v29 = v0[24];
    uint64_t v33 = v0[33];
    unint64_t v13 = v0[23];
    uint64_t v14 = swift_slowAlloc();
    uint64_t v31 = swift_slowAlloc();
    uint64_t v35 = v31;
    *(_DWORD *)uint64_t v14 = 136380931;
    uint64_t v32 = v11;
    swift_bridgeObjectRetain();
    v0[20] = sub_24D1D0A78(v12, v13, &v35);
    sub_24D219310();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v14 + 12) = 2081;
    if (v28) {
      uint64_t v15 = v29;
    }
    else {
      uint64_t v15 = 0x20656D6F48206F4ELL;
    }
    if (v28) {
      unint64_t v16 = v4;
    }
    else {
      unint64_t v16 = 0xEA00000000004449;
    }
    swift_bridgeObjectRetain();
    v0[21] = sub_24D1D0A78(v15, v16, &v35);
    sub_24D219310();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24D1B6000, v6, type, "Checking if next clean energy window notification is enabled for %{private}s, %{private}s", (uint8_t *)v14, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x253322AA0](v31, -1, -1);
    MEMORY[0x253322AA0](v14, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v33, v32);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
  }
  uint64_t v17 = v0[30];
  uint64_t v18 = v0[27];
  uint64_t v19 = v0[28];
  uint64_t v20 = v0[26];
  uint64_t v34 = v0[25];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[34] = sub_24D217288();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v17, v20, v18);
  unint64_t v21 = (*(unsigned __int8 *)(v19 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  uint64_t v22 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v19 + 32))(v22 + v21, v17, v18);
  uint64_t v23 = (void *)sub_24D217944((uint64_t)sub_24D1FEF30, v22);
  v0[35] = v23;
  swift_release();
  uint64_t v24 = sub_24D2190E0();
  v0[36] = v24;
  if (v34) {
    uint64_t v25 = sub_24D2190E0();
  }
  else {
    uint64_t v25 = 0;
  }
  v0[37] = v25;
  v0[2] = v0;
  v0[7] = v0 + 18;
  v0[3] = sub_24D1EE434;
  uint64_t v26 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_24D1EE8A4;
  v0[13] = &block_descriptor_199;
  v0[14] = v26;
  objc_msgSend(v23, sel_isNextCleanEnergyWindowNotificationEnabledForGridID_homeID_completionHandler_, v24, v25, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_24D1EE434()
{
  return MEMORY[0x270FA2498](sub_24D1EE514, 0, 0);
}

uint64_t sub_24D1EE514()
{
  uint64_t v2 = (void *)v0[36];
  uint64_t v1 = (void *)v0[37];
  uint64_t v3 = v0[34];
  uint64_t v4 = v0[18];
  swift_unknownObjectRelease();

  objc_msgSend(*(id *)(v3 + 16), sel_invalidate);
  v0[19] = v4;
  sub_24D219220();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_24D1EE5E0(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_24D219020();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B18A2F8 != -1) {
    swift_once();
  }
  uint64_t v8 = __swift_project_value_buffer(v4, (uint64_t)qword_26B18A8F0);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  id v9 = a1;
  id v10 = a1;
  uint64_t v11 = sub_24D219000();
  os_log_type_t v12 = sub_24D2192D0();
  if (os_log_type_enabled(v11, v12))
  {
    void v20[2] = a2;
    unint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v21 = (uint64_t)a1;
    uint64_t v22 = v14;
    *(_DWORD *)unint64_t v13 = 136446210;
    v20[1] = v13 + 4;
    id v15 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5D0);
    uint64_t v16 = sub_24D219100();
    uint64_t v21 = sub_24D1D0A78(v16, v17, &v22);
    sub_24D219310();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_24D1B6000, v11, v12, "Failed to get Home Energy Notification status.%{public}s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253322AA0](v14, -1, -1);
    MEMORY[0x253322AA0](v13, -1, -1);
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v22 = (uint64_t)a1;
  id v18 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5A0);
  return sub_24D219210();
}

uint64_t sub_24D1EE8A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 96) = a1;
  *(void *)(v3 + 104) = a2;
  long long v4 = *(_OWORD *)(a3 + 48);
  *(_OWORD *)(v3 + 48) = *(_OWORD *)(a3 + 32);
  *(_OWORD *)(v3 + 64) = v4;
  *(unsigned char *)(v3 + 80) = *(unsigned char *)(a3 + 64);
  long long v5 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)(v3 + 16) = *(_OWORD *)a3;
  *(_OWORD *)(v3 + 32) = v5;
  return MEMORY[0x270FA2498](sub_24D1EE8E0, 0, 0);
}

uint64_t sub_24D1EE8E0()
{
  uint64_t v2 = v0[12];
  uint64_t v1 = v0[13];
  uint64_t v3 = (void *)swift_task_alloc();
  v0[14] = v3;
  v3[2] = v2;
  v3[3] = v1;
  v3[4] = v0 + 2;
  long long v4 = (void *)swift_task_alloc();
  v0[15] = v4;
  *long long v4 = v0;
  v4[1] = sub_24D1EE9EC;
  return MEMORY[0x270FA2360](v0 + 11, 0, 0, 0xD000000000000048, 0x800000024D21C140, sub_24D1FAF68, v3, &type metadata for HomeEnergyStatusCode);
}

uint64_t sub_24D1EE9EC()
{
  *(void *)(*(void *)v1 + 128) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_24D1EEB24;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_24D1EEB08;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D1EEB08()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 88));
}

uint64_t sub_24D1EEB24()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24D1EEB88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985C130);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5B0);
  MEMORY[0x270FA5388](v11 - 8);
  unint64_t v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_24D219240();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 1, 1, v14);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v8);
  unint64_t v15 = (*(unsigned __int8 *)(v9 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v16 = (char *)swift_allocObject();
  *((void *)v16 + 2) = 0;
  *((void *)v16 + 3) = 0;
  *((void *)v16 + 4) = a2;
  *((void *)v16 + 5) = a3;
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(&v16[v15], (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
  unint64_t v17 = &v16[(v10 + v15 + 7) & 0xFFFFFFFFFFFFFFF8];
  long long v18 = *(_OWORD *)(a4 + 48);
  *((_OWORD *)v17 + 2) = *(_OWORD *)(a4 + 32);
  *((_OWORD *)v17 + 3) = v18;
  v17[64] = *(unsigned char *)(a4 + 64);
  long long v19 = *(_OWORD *)(a4 + 16);
  *(_OWORD *)unint64_t v17 = *(_OWORD *)a4;
  *((_OWORD *)v17 + 1) = v19;
  swift_bridgeObjectRetain();
  sub_24D1FECA4(a4);
  sub_24D1BA610((uint64_t)v13, (uint64_t)&unk_26985C1A0, (uint64_t)v16);
  return swift_release();
}

uint64_t sub_24D1EEDA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[23] = a6;
  v7[24] = a7;
  v7[21] = a4;
  v7[22] = a5;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985C130);
  v7[25] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v7[26] = v9;
  v7[27] = *(void *)(v9 + 64);
  v7[28] = swift_task_alloc();
  uint64_t v10 = sub_24D219020();
  v7[29] = v10;
  v7[30] = *(void *)(v10 - 8);
  v7[31] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D1EEECC, 0, 0);
}

uint64_t sub_24D1EEECC()
{
  uint64_t v33 = v0;
  if (qword_26B18A2F8 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[30];
  uint64_t v1 = v0[31];
  uint64_t v3 = v0[29];
  uint64_t v4 = __swift_project_value_buffer(v3, (uint64_t)qword_26B18A8F0);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  swift_bridgeObjectRetain_n();
  long long v5 = sub_24D219000();
  os_log_type_t v6 = sub_24D2192B0();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v9 = v0[30];
  uint64_t v8 = v0[31];
  uint64_t v10 = v0[29];
  unint64_t v11 = v0[22];
  if (v7)
  {
    uint64_t v28 = v0[21];
    uint64_t v30 = v0[29];
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v29 = v8;
    uint64_t v13 = swift_slowAlloc();
    *(void *)&v31[0] = v13;
    *(_DWORD *)uint64_t v12 = 136380675;
    swift_bridgeObjectRetain();
    v0[20] = sub_24D1D0A78(v28, v11, (uint64_t *)v31);
    sub_24D219310();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24D1B6000, v5, v6, "Enabling next clean energy window notification for %{private}s\"", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253322AA0](v13, -1, -1);
    MEMORY[0x253322AA0](v12, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v29, v30);
  }
  else
  {
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  }
  uint64_t v14 = v0[28];
  uint64_t v16 = v0[25];
  uint64_t v15 = v0[26];
  uint64_t v17 = v0[23];
  uint64_t v18 = v0[24];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[32] = sub_24D217288();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16))(v14, v17, v16);
  unint64_t v19 = (*(unsigned __int8 *)(v15 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  uint64_t v20 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v15 + 32))(v20 + v19, v14, v16);
  uint64_t v21 = (void *)sub_24D217944((uint64_t)sub_24D1FED08, v20);
  v0[33] = v21;
  swift_release();
  uint64_t v22 = sub_24D2190E0();
  v0[34] = v22;
  long long v23 = *(_OWORD *)(v18 + 48);
  v31[2] = *(_OWORD *)(v18 + 32);
  v31[3] = v23;
  char v32 = *(unsigned char *)(v18 + 64);
  long long v24 = *(_OWORD *)(v18 + 16);
  v31[0] = *(_OWORD *)v18;
  v31[1] = v24;
  sub_24D215AD0();
  uint64_t v25 = sub_24D219030();
  v0[35] = v25;
  swift_bridgeObjectRelease();
  v0[2] = v0;
  v0[7] = v0 + 18;
  v0[3] = sub_24D1EF2F8;
  uint64_t v26 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_24D1EE8A4;
  v0[13] = &block_descriptor_191;
  v0[14] = v26;
  objc_msgSend(v21, sel_enableNextCleanEnergyWindowNotificationsForGridID_notificationContext_completionHandler_, v22, v25);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_24D1EF2F8()
{
  return MEMORY[0x270FA2498](sub_24D1EF3D8, 0, 0);
}

uint64_t sub_24D1EF3D8()
{
  uint64_t v2 = (void *)v0[34];
  uint64_t v1 = (void *)v0[35];
  uint64_t v3 = v0[32];
  uint64_t v4 = v0[18];
  swift_unknownObjectRelease();

  objc_msgSend(*(id *)(v3 + 16), sel_invalidate);
  v0[19] = v4;
  sub_24D219220();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  long long v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_24D1EF4A8(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_24D219020();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B18A2F8 != -1) {
    swift_once();
  }
  uint64_t v8 = __swift_project_value_buffer(v4, (uint64_t)qword_26B18A8F0);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  id v9 = a1;
  id v10 = a1;
  unint64_t v11 = sub_24D219000();
  os_log_type_t v12 = sub_24D2192D0();
  if (os_log_type_enabled(v11, v12))
  {
    void v20[2] = a2;
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v21 = (uint64_t)a1;
    uint64_t v22 = v14;
    *(_DWORD *)uint64_t v13 = 136446210;
    v20[1] = v13 + 4;
    id v15 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5D0);
    uint64_t v16 = sub_24D219100();
    uint64_t v21 = sub_24D1D0A78(v16, v17, &v22);
    sub_24D219310();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_24D1B6000, v11, v12, "Enable next clean energy forecast failed.%{public}s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253322AA0](v14, -1, -1);
    MEMORY[0x253322AA0](v13, -1, -1);
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v22 = (uint64_t)a1;
  id v18 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985C130);
  return sub_24D219210();
}

uint64_t sub_24D1EF76C(uint64_t a1, uint64_t a2)
{
  **(void **)(*(void *)(*(void *)(a1 + 32) + 64) + 40) = a2;
  return swift_continuation_resume();
}

uint64_t sub_24D1EF790(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[5] = a3;
  v4[6] = a4;
  v4[3] = a1;
  void v4[4] = a2;
  return MEMORY[0x270FA2498](sub_24D1EF7B4, 0, 0);
}

uint64_t sub_24D1EF7B4()
{
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v1 = *(void *)(v0 + 48);
  long long v6 = *(_OWORD *)(v0 + 24);
  uint64_t v3 = swift_task_alloc();
  *(void *)(v0 + 56) = v3;
  *(_OWORD *)(v3 + 16) = v6;
  *(void *)(v3 + 32) = v2;
  *(void *)(v3 + 40) = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_24D1EF8C8;
  return MEMORY[0x270FA2360](v0 + 16, 0, 0, 0xD00000000000003CLL, 0x800000024D21C190, sub_24D1FAF74, v3, &type metadata for HomeEnergyStatusCode);
}

uint64_t sub_24D1EF8C8()
{
  *(void *)(*(void *)v1 + 72) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_24D1FFD70;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_24D1FFD6C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D1EF9E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v20 = a4;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985C130);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5B0);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_24D219240();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v14, 1, 1, v15);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v9);
  unint64_t v16 = (*(unsigned __int8 *)(v10 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v17 = (char *)swift_allocObject();
  *((void *)v17 + 2) = 0;
  *((void *)v17 + 3) = 0;
  *((void *)v17 + 4) = a2;
  *((void *)v17 + 5) = a3;
  *((void *)v17 + 6) = v20;
  *((void *)v17 + 7) = a5;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v17[v16], (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_24D1BA610((uint64_t)v14, (uint64_t)&unk_26985C190, (uint64_t)v17);
  return swift_release();
}

uint64_t sub_24D1EFBE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[25] = a7;
  v8[26] = a8;
  v8[23] = a5;
  v8[24] = a6;
  v8[22] = a4;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985C130);
  v8[27] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v8[28] = v10;
  v8[29] = *(void *)(v10 + 64);
  v8[30] = swift_task_alloc();
  uint64_t v11 = sub_24D219020();
  v8[31] = v11;
  v8[32] = *(void *)(v11 - 8);
  v8[33] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D1EFD14, 0, 0);
}

uint64_t sub_24D1EFD14()
{
  uint64_t v31 = v0;
  if (qword_26B18A2F8 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[32];
  uint64_t v1 = v0[33];
  uint64_t v3 = v0[31];
  uint64_t v4 = __swift_project_value_buffer(v3, (uint64_t)qword_26B18A8F0);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v5 = sub_24D219000();
  os_log_type_t v6 = sub_24D2192B0();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v9 = v0[32];
  uint64_t v8 = v0[33];
  uint64_t v10 = v0[31];
  unint64_t v11 = v0[25];
  if (v7)
  {
    uint64_t v28 = v0[31];
    uint64_t v29 = v0[33];
    uint64_t v12 = v0[22];
    unint64_t v13 = v0[23];
    uint64_t v26 = v0[24];
    uint64_t v14 = swift_slowAlloc();
    uint64_t v27 = swift_slowAlloc();
    uint64_t v30 = v27;
    *(_DWORD *)uint64_t v14 = 136380931;
    swift_bridgeObjectRetain();
    v0[20] = sub_24D1D0A78(v12, v13, &v30);
    sub_24D219310();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v14 + 12) = 2081;
    swift_bridgeObjectRetain();
    v0[21] = sub_24D1D0A78(v26, v11, &v30);
    sub_24D219310();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24D1B6000, v5, v6, "Disabling next clean energy window notification for %{private}s, %{private}s\"", (uint8_t *)v14, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x253322AA0](v27, -1, -1);
    MEMORY[0x253322AA0](v14, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v29, v28);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  }
  uint64_t v15 = v0[30];
  uint64_t v17 = v0[27];
  uint64_t v16 = v0[28];
  uint64_t v18 = v0[26];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[34] = sub_24D217288();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v15, v18, v17);
  unint64_t v19 = (*(unsigned __int8 *)(v16 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v20 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v16 + 32))(v20 + v19, v15, v17);
  uint64_t v21 = (void *)sub_24D217944((uint64_t)sub_24D1FEA38, v20);
  v0[35] = v21;
  swift_release();
  uint64_t v22 = sub_24D2190E0();
  v0[36] = v22;
  uint64_t v23 = sub_24D2190E0();
  v0[37] = v23;
  v0[2] = v0;
  v0[7] = v0 + 18;
  v0[3] = sub_24D1EE434;
  uint64_t v24 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_24D1EE8A4;
  v0[13] = &block_descriptor_183;
  v0[14] = v24;
  objc_msgSend(v21, sel_disableNextCleanEnergyWindowNotificationsForGridID_homeID_completionHandler_, v22, v23);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_24D1F016C(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_24D219020();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  BOOL v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B18A2F8 != -1) {
    swift_once();
  }
  uint64_t v8 = __swift_project_value_buffer(v4, (uint64_t)qword_26B18A8F0);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  id v9 = a1;
  id v10 = a1;
  unint64_t v11 = sub_24D219000();
  os_log_type_t v12 = sub_24D2192D0();
  if (os_log_type_enabled(v11, v12))
  {
    void v20[2] = a2;
    unint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v21 = (uint64_t)a1;
    uint64_t v22 = v14;
    *(_DWORD *)unint64_t v13 = 136446210;
    v20[1] = v13 + 4;
    id v15 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5D0);
    uint64_t v16 = sub_24D219100();
    uint64_t v21 = sub_24D1D0A78(v16, v17, &v22);
    sub_24D219310();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_24D1B6000, v11, v12, "Disable next clean energy forecast failed.%{public}s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253322AA0](v14, -1, -1);
    MEMORY[0x253322AA0](v13, -1, -1);
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v22 = (uint64_t)a1;
  id v18 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985C130);
  return sub_24D219210();
}

uint64_t sub_24D1F0430(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = a2;
  return MEMORY[0x270FA2498](sub_24D1F0450, 0, 0);
}

uint64_t sub_24D1F0450()
{
  uint64_t v2 = v0[3];
  uint64_t v1 = v0[4];
  uint64_t v3 = swift_task_alloc();
  v0[5] = v3;
  *(void *)(v3 + 16) = v2;
  *(void *)(v3 + 24) = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[6] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_24D1F054C;
  return MEMORY[0x270FA2360](v0 + 2, 0, 0, 0xD000000000000035, 0x800000024D21C1D0, sub_24D1FAF80, v3, &type metadata for HomeEnergyStatusCode);
}

uint64_t sub_24D1F054C()
{
  *(void *)(*(void *)v1 + 56) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_24D1EA5B8;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_24D1DE1C8;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D1F0668(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[22] = a5;
  v6[23] = a6;
  v6[21] = a4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985C130);
  v6[24] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v6[25] = v8;
  v6[26] = *(void *)(v8 + 64);
  v6[27] = swift_task_alloc();
  uint64_t v9 = sub_24D219020();
  v6[28] = v9;
  v6[29] = *(void *)(v9 - 8);
  v6[30] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D1F0794, 0, 0);
}

uint64_t sub_24D1F0794()
{
  uint64_t v28 = v0;
  if (qword_26B18A2F8 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[29];
  uint64_t v1 = v0[30];
  uint64_t v3 = v0[28];
  uint64_t v4 = __swift_project_value_buffer(v3, (uint64_t)qword_26B18A8F0);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  swift_bridgeObjectRetain_n();
  uint64_t v5 = sub_24D219000();
  os_log_type_t v6 = sub_24D2192B0();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v9 = v0[29];
  uint64_t v8 = v0[30];
  uint64_t v10 = v0[28];
  unint64_t v11 = v0[22];
  if (v7)
  {
    uint64_t v24 = v0[21];
    uint64_t v26 = v0[28];
    os_log_type_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v25 = v8;
    uint64_t v13 = swift_slowAlloc();
    uint64_t v27 = v13;
    *(_DWORD *)os_log_type_t v12 = 136380675;
    swift_bridgeObjectRetain();
    v0[20] = sub_24D1D0A78(v24, v11, &v27);
    sub_24D219310();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24D1B6000, v5, v6, "Disabling next clean energy window notification for %{private}s\"", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253322AA0](v13, -1, -1);
    MEMORY[0x253322AA0](v12, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v25, v26);
  }
  else
  {
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  }
  uint64_t v14 = v0[27];
  uint64_t v15 = v0[24];
  uint64_t v16 = v0[25];
  uint64_t v17 = v0[23];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[31] = sub_24D217288();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v14, v17, v15);
  unint64_t v18 = (*(unsigned __int8 *)(v16 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v19 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v16 + 32))(v19 + v18, v14, v15);
  uint64_t v20 = (void *)sub_24D217944((uint64_t)sub_24D1FE8E8, v19);
  v0[32] = v20;
  swift_release();
  uint64_t v21 = sub_24D2190E0();
  v0[33] = v21;
  v0[2] = v0;
  v0[7] = v0 + 18;
  v0[3] = sub_24D1F0B68;
  uint64_t v22 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_24D1EE8A4;
  v0[13] = &block_descriptor_175;
  v0[14] = v22;
  objc_msgSend(v20, sel_disableNextCleanEnergyWindowNotificationsForGridID_completionHandler_, v21);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_24D1F0B68()
{
  return MEMORY[0x270FA2498](sub_24D1F0C48, 0, 0);
}

uint64_t sub_24D1F0C48()
{
  uint64_t v1 = (void *)v0[33];
  uint64_t v2 = v0[31];
  uint64_t v3 = v0[18];
  swift_unknownObjectRelease();

  objc_msgSend(*(id *)(v2 + 16), sel_invalidate);
  v0[19] = v3;
  sub_24D219220();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_24D1F0D0C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24D1DE0B4;
  return MEMORY[0x270FA2360](v0 + 16, 0, 0, 0xD00000000000002ELL, 0x800000024D21C210, sub_24D1F0DE8, 0, &type metadata for HomeEnergyStatusCode);
}

uint64_t sub_24D1F0DE8(uint64_t a1)
{
  return sub_24D1F6AD4(a1, &qword_26985C130, (uint64_t)&unk_26FF7B5F8, (uint64_t)&unk_26985C170);
}

uint64_t sub_24D1F0E10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[20] = a4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985C130);
  v4[21] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v4[22] = v6;
  v4[23] = *(void *)(v6 + 64);
  v4[24] = swift_task_alloc();
  uint64_t v7 = sub_24D219020();
  v4[25] = v7;
  v4[26] = *(void *)(v7 - 8);
  v4[27] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D1F0F38, 0, 0);
}

uint64_t sub_24D1F0F38()
{
  if (qword_26B18A2F8 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[26];
  uint64_t v1 = v0[27];
  uint64_t v3 = v0[25];
  uint64_t v4 = __swift_project_value_buffer(v3, (uint64_t)qword_26B18A8F0);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  uint64_t v5 = sub_24D219000();
  os_log_type_t v6 = sub_24D2192B0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_24D1B6000, v5, v6, "Disabling all next clean energy window notifications", v7, 2u);
    MEMORY[0x253322AA0](v7, -1, -1);
  }
  uint64_t v8 = v0[26];
  uint64_t v9 = v0[27];
  uint64_t v10 = v0[24];
  uint64_t v11 = v0[25];
  uint64_t v12 = v0[22];
  uint64_t v14 = v0[20];
  uint64_t v13 = v0[21];

  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v11);
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[28] = sub_24D217288();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v10, v14, v13);
  unint64_t v15 = (*(unsigned __int8 *)(v12 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  uint64_t v16 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v12 + 32))(v16 + v15, v10, v13);
  uint64_t v17 = (void *)sub_24D217944((uint64_t)sub_24D1FE6DC, v16);
  v0[29] = v17;
  swift_release();
  v0[2] = v0;
  v0[7] = v0 + 18;
  v0[3] = sub_24D1F1218;
  uint64_t v18 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_24D1EE8A4;
  v0[13] = &block_descriptor_167;
  v0[14] = v18;
  objc_msgSend(v17, sel_disableAllNextCleanEnergyWindowNotificationsWithCompletionHandler_);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_24D1F1218()
{
  return MEMORY[0x270FA2498](sub_24D1F12F8, 0, 0);
}

uint64_t sub_24D1F12F8()
{
  uint64_t v1 = v0[28];
  uint64_t v2 = v0[18];
  swift_unknownObjectRelease();
  objc_msgSend(*(id *)(v1 + 16), sel_invalidate);
  v0[19] = v2;
  sub_24D219220();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_24D1F13B0(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = a2;
  return MEMORY[0x270FA2498](sub_24D1F13D0, 0, 0);
}

uint64_t sub_24D1F13D0()
{
  uint64_t v2 = v0[3];
  uint64_t v1 = v0[4];
  uint64_t v3 = swift_task_alloc();
  v0[5] = v3;
  *(void *)(v3 + 16) = v2;
  *(void *)(v3 + 24) = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[6] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_24D1F14CC;
  return MEMORY[0x270FA2360](v0 + 2, 0, 0, 0xD00000000000002ELL, 0x800000024D21C240, sub_24D1FAFB8, v3, &type metadata for HomeEnergyStatusCode);
}

uint64_t sub_24D1F14CC()
{
  *(void *)(*(void *)v1 + 56) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_24D1FFD90;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_24D1FFD6C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D1F15E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[22] = a5;
  v6[23] = a6;
  v6[21] = a4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985C130);
  v6[24] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v6[25] = v8;
  v6[26] = *(void *)(v8 + 64);
  v6[27] = swift_task_alloc();
  uint64_t v9 = sub_24D219020();
  v6[28] = v9;
  v6[29] = *(void *)(v9 - 8);
  v6[30] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D1F1714, 0, 0);
}

uint64_t sub_24D1F1714()
{
  uint64_t v28 = v0;
  if (qword_26B18A2F8 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[29];
  uint64_t v1 = v0[30];
  uint64_t v3 = v0[28];
  uint64_t v4 = __swift_project_value_buffer(v3, (uint64_t)qword_26B18A8F0);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  swift_bridgeObjectRetain_n();
  uint64_t v5 = sub_24D219000();
  os_log_type_t v6 = sub_24D2192B0();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v9 = v0[29];
  uint64_t v8 = v0[30];
  uint64_t v10 = v0[28];
  unint64_t v11 = v0[22];
  if (v7)
  {
    uint64_t v24 = v0[21];
    uint64_t v26 = v0[28];
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v25 = v8;
    uint64_t v13 = swift_slowAlloc();
    uint64_t v27 = v13;
    *(_DWORD *)uint64_t v12 = 136380675;
    swift_bridgeObjectRetain();
    v0[20] = sub_24D1D0A78(v24, v11, &v27);
    sub_24D219310();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24D1B6000, v5, v6, "Enable energy forecast collection for %{private}s\"", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253322AA0](v13, -1, -1);
    MEMORY[0x253322AA0](v12, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v25, v26);
  }
  else
  {
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  }
  uint64_t v14 = v0[27];
  uint64_t v15 = v0[24];
  uint64_t v16 = v0[25];
  uint64_t v17 = v0[23];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[31] = sub_24D217288();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v14, v17, v15);
  unint64_t v18 = (*(unsigned __int8 *)(v16 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v19 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v16 + 32))(v19 + v18, v14, v15);
  uint64_t v20 = (void *)sub_24D217944((uint64_t)sub_24D1FE5B4, v19);
  v0[32] = v20;
  swift_release();
  uint64_t v21 = sub_24D2190E0();
  v0[33] = v21;
  v0[2] = v0;
  v0[7] = v0 + 18;
  v0[3] = sub_24D1F1AE8;
  uint64_t v22 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_24D1EE8A4;
  v0[13] = &block_descriptor_159;
  v0[14] = v22;
  objc_msgSend(v20, sel_enableEnergyForecastDataCollectionForGridID_completionHandler_, v21);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_24D1F1AE8()
{
  return MEMORY[0x270FA2498](sub_24D1FFD60, 0, 0);
}

uint64_t sub_24D1F1BC8(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_24D219020();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  BOOL v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B18A2F8 != -1) {
    swift_once();
  }
  uint64_t v8 = __swift_project_value_buffer(v4, (uint64_t)qword_26B18A8F0);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  id v9 = a1;
  id v10 = a1;
  unint64_t v11 = sub_24D219000();
  os_log_type_t v12 = sub_24D2192D0();
  if (os_log_type_enabled(v11, v12))
  {
    void v20[2] = a2;
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v21 = (uint64_t)a1;
    uint64_t v22 = v14;
    *(_DWORD *)uint64_t v13 = 136446210;
    v20[1] = v13 + 4;
    id v15 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5D0);
    uint64_t v16 = sub_24D219100();
    uint64_t v21 = sub_24D1D0A78(v16, v17, &v22);
    sub_24D219310();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_24D1B6000, v11, v12, "Enable energy forecast collection failed.%{public}s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253322AA0](v14, -1, -1);
    MEMORY[0x253322AA0](v13, -1, -1);
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v22 = (uint64_t)a1;
  id v18 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985C130);
  return sub_24D219210();
}

uint64_t sub_24D1F1E8C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24D1F1F68;
  return MEMORY[0x270FA2360](v0 + 16, 0, 0, 0xD000000000000025, 0x800000024D21C270, sub_24D1F207C, 0, &type metadata for HomeEnergyStatusCode);
}

uint64_t sub_24D1F1F68()
{
  *(void *)(*(void *)v1 + 32) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24D1FFD88;
  }
  else {
    uint64_t v2 = sub_24D1FFD6C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D1F207C(uint64_t a1)
{
  return sub_24D1F6AD4(a1, &qword_26985C130, (uint64_t)&unk_26FF7B558, (uint64_t)&unk_26985C150);
}

uint64_t sub_24D1F20A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[20] = a4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985C130);
  v4[21] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v4[22] = v6;
  v4[23] = *(void *)(v6 + 64);
  v4[24] = swift_task_alloc();
  uint64_t v7 = sub_24D219020();
  v4[25] = v7;
  v4[26] = *(void *)(v7 - 8);
  v4[27] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D1F21CC, 0, 0);
}

uint64_t sub_24D1F21CC()
{
  if (qword_26B18A2F8 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[26];
  uint64_t v1 = v0[27];
  uint64_t v3 = v0[25];
  uint64_t v4 = __swift_project_value_buffer(v3, (uint64_t)qword_26B18A8F0);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  uint64_t v5 = sub_24D219000();
  os_log_type_t v6 = sub_24D2192B0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_24D1B6000, v5, v6, "Disabling energy forecast collection", v7, 2u);
    MEMORY[0x253322AA0](v7, -1, -1);
  }
  uint64_t v8 = v0[26];
  uint64_t v9 = v0[27];
  uint64_t v10 = v0[24];
  uint64_t v11 = v0[25];
  uint64_t v12 = v0[22];
  uint64_t v14 = v0[20];
  uint64_t v13 = v0[21];

  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v11);
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[28] = sub_24D217288();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v10, v14, v13);
  unint64_t v15 = (*(unsigned __int8 *)(v12 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  uint64_t v16 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v12 + 32))(v16 + v15, v10, v13);
  unint64_t v17 = (void *)sub_24D217944((uint64_t)sub_24D1FE480, v16);
  v0[29] = v17;
  swift_release();
  v0[2] = v0;
  v0[7] = v0 + 18;
  v0[3] = sub_24D1F24AC;
  uint64_t v18 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_24D1EE8A4;
  v0[13] = &block_descriptor_151;
  v0[14] = v18;
  objc_msgSend(v17, sel_disableEnergyForecastDataCollectionWithCompletionHandler_);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_24D1F24AC()
{
  return MEMORY[0x270FA2498](sub_24D1FFD68, 0, 0);
}

uint64_t sub_24D1F258C(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = a2;
  return MEMORY[0x270FA2498](sub_24D1F25AC, 0, 0);
}

uint64_t sub_24D1F25AC()
{
  uint64_t v2 = v0[3];
  uint64_t v1 = v0[4];
  uint64_t v3 = swift_task_alloc();
  v0[5] = v3;
  *(void *)(v3 + 16) = v2;
  *(void *)(v3 + 24) = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[6] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_24D1F14CC;
  return MEMORY[0x270FA2360](v0 + 2, 0, 0, 0xD00000000000002FLL, 0x800000024D21C2A0, sub_24D1FAFF0, v3, &type metadata for HomeEnergyStatusCode);
}

uint64_t sub_24D1F26A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985C130);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5B0);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_24D219240();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v14, 1, 1, v15);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v9);
  unint64_t v16 = (*(unsigned __int8 *)(v10 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v17 = (char *)swift_allocObject();
  *((void *)v17 + 2) = 0;
  *((void *)v17 + 3) = 0;
  *((void *)v17 + 4) = a2;
  *((void *)v17 + 5) = a3;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v17[v16], (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
  swift_bridgeObjectRetain();
  sub_24D1BA610((uint64_t)v14, a5, (uint64_t)v17);
  return swift_release();
}

uint64_t sub_24D1F2880(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[22] = a5;
  v6[23] = a6;
  v6[21] = a4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985C130);
  v6[24] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v6[25] = v8;
  v6[26] = *(void *)(v8 + 64);
  v6[27] = swift_task_alloc();
  uint64_t v9 = sub_24D219020();
  v6[28] = v9;
  v6[29] = *(void *)(v9 - 8);
  v6[30] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D1F29AC, 0, 0);
}

uint64_t sub_24D1F29AC()
{
  uint64_t v28 = v0;
  if (qword_26B18A2F8 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[29];
  uint64_t v1 = v0[30];
  uint64_t v3 = v0[28];
  uint64_t v4 = __swift_project_value_buffer(v3, (uint64_t)qword_26B18A8F0);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  swift_bridgeObjectRetain_n();
  uint64_t v5 = sub_24D219000();
  os_log_type_t v6 = sub_24D2192B0();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v9 = v0[29];
  uint64_t v8 = v0[30];
  uint64_t v10 = v0[28];
  unint64_t v11 = v0[22];
  if (v7)
  {
    uint64_t v24 = v0[21];
    uint64_t v26 = v0[28];
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v25 = v8;
    uint64_t v13 = swift_slowAlloc();
    uint64_t v27 = v13;
    *(_DWORD *)uint64_t v12 = 136380675;
    swift_bridgeObjectRetain();
    v0[20] = sub_24D1D0A78(v24, v11, &v27);
    sub_24D219310();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24D1B6000, v5, v6, "Disabling energy window forecast collection for %{private}s\"", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253322AA0](v13, -1, -1);
    MEMORY[0x253322AA0](v12, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v25, v26);
  }
  else
  {
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  }
  uint64_t v14 = v0[27];
  uint64_t v15 = v0[24];
  uint64_t v16 = v0[25];
  uint64_t v17 = v0[23];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[31] = sub_24D217288();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v14, v17, v15);
  unint64_t v18 = (*(unsigned __int8 *)(v16 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v19 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v16 + 32))(v19 + v18, v14, v15);
  uint64_t v20 = (void *)sub_24D217944((uint64_t)sub_24D1FE358, v19);
  v0[32] = v20;
  swift_release();
  uint64_t v21 = sub_24D2190E0();
  v0[33] = v21;
  v0[2] = v0;
  v0[7] = v0 + 18;
  v0[3] = sub_24D1F1AE8;
  uint64_t v22 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_24D1EE8A4;
  v0[13] = &block_descriptor_143;
  v0[14] = v22;
  objc_msgSend(v20, sel_disableEnergyForecastDataCollectionForGridID_completionHandler_, v21);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_24D1F2D80(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_24D219020();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  BOOL v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B18A2F8 != -1) {
    swift_once();
  }
  uint64_t v8 = __swift_project_value_buffer(v4, (uint64_t)qword_26B18A8F0);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  id v9 = a1;
  id v10 = a1;
  unint64_t v11 = sub_24D219000();
  os_log_type_t v12 = sub_24D2192D0();
  if (os_log_type_enabled(v11, v12))
  {
    void v20[2] = a2;
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v21 = (uint64_t)a1;
    uint64_t v22 = v14;
    *(_DWORD *)uint64_t v13 = 136446210;
    v20[1] = v13 + 4;
    id v15 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5D0);
    uint64_t v16 = sub_24D219100();
    uint64_t v21 = sub_24D1D0A78(v16, v17, &v22);
    sub_24D219310();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_24D1B6000, v11, v12, "Failed to disable cache for energy forecast.%{public}s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253322AA0](v14, -1, -1);
    MEMORY[0x253322AA0](v13, -1, -1);
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v22 = (uint64_t)a1;
  id v18 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985C130);
  return sub_24D219210();
}

uint64_t sub_24D1F3044(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  *(unsigned char *)(v4 + 64) = a4;
  *(void *)(v4 + 24) = a2;
  *(void *)(v4 + 32) = a3;
  *(void *)(v4 + 16) = a1;
  return MEMORY[0x270FA2498](sub_24D1F306C, 0, 0);
}

uint64_t sub_24D1F306C()
{
  char v1 = *(unsigned char *)(v0 + 64);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v4 = swift_task_alloc();
  *(void *)(v0 + 40) = v4;
  *(void *)(v4 + 16) = v3;
  *(void *)(v4 + 24) = v2;
  *(unsigned char *)(v4 + 32) = v1;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A578);
  *uint64_t v5 = v0;
  v5[1] = sub_24D1F3174;
  uint64_t v7 = *(void *)(v0 + 16);
  return MEMORY[0x270FA2360](v7, 0, 0, 0xD00000000000001FLL, 0x800000024D21C2D0, sub_24D1FB028, v4, v6);
}

uint64_t sub_24D1F3174()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 56) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_24D1EA5B8, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_24D1F32B0(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A598);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5B0);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_24D219240();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 1, 1, v14);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v8);
  unint64_t v15 = (*(unsigned __int8 *)(v9 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v16 = (char *)swift_allocObject();
  *((void *)v16 + 2) = 0;
  *((void *)v16 + 3) = 0;
  *((void *)v16 + 4) = a2;
  *((void *)v16 + 5) = a3;
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(&v16[v15], (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
  v16[v15 + v10] = a4;
  swift_bridgeObjectRetain();
  sub_24D1BA610((uint64_t)v13, (uint64_t)&unk_26985C128, (uint64_t)v16);
  return swift_release();
}

uint64_t sub_24D1F34A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  *(unsigned char *)(v7 + 392) = a7;
  *(void *)(v7 + 208) = a5;
  *(void *)(v7 + 216) = a6;
  *(void *)(v7 + 200) = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A578);
  *(void *)(v7 + 224) = swift_task_alloc();
  uint64_t v8 = sub_24D218BC0();
  *(void *)(v7 + 232) = v8;
  *(void *)(v7 + 240) = *(void *)(v8 - 8);
  *(void *)(v7 + 248) = swift_task_alloc();
  *(void *)(v7 + 256) = swift_task_alloc();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A598);
  *(void *)(v7 + 264) = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  *(void *)(v7 + 272) = v10;
  *(void *)(v7 + 280) = *(void *)(v10 + 64);
  *(void *)(v7 + 288) = swift_task_alloc();
  uint64_t v11 = sub_24D219020();
  *(void *)(v7 + 296) = v11;
  *(void *)(v7 + 304) = *(void *)(v11 - 8);
  *(void *)(v7 + 312) = swift_task_alloc();
  *(void *)(v7 + 320) = swift_task_alloc();
  *(void *)(v7 + 328) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D1F3688, 0, 0);
}

uint64_t sub_24D1F3688()
{
  uint64_t v31 = v0;
  if (qword_26B18A2F8 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 328);
  uint64_t v2 = *(void *)(v0 + 296);
  uint64_t v3 = *(void *)(v0 + 304);
  uint64_t v4 = __swift_project_value_buffer(v2, (uint64_t)qword_26B18A8F0);
  *(void *)(v0 + 336) = v4;
  swift_beginAccess();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  *(void *)(v0 + 344) = v5;
  *(void *)(v0 + 352) = (v3 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v5(v1, v4, v2);
  swift_bridgeObjectRetain_n();
  uint64_t v6 = sub_24D219000();
  os_log_type_t v7 = sub_24D2192B0();
  BOOL v8 = os_log_type_enabled(v6, v7);
  uint64_t v9 = *(void *)(v0 + 328);
  uint64_t v10 = *(void *)(v0 + 296);
  uint64_t v11 = *(void *)(v0 + 304);
  unint64_t v12 = *(void *)(v0 + 208);
  if (v8)
  {
    uint64_t v26 = *(void *)(v0 + 200);
    uint64_t v28 = *(void *)(v0 + 296);
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v27 = v9;
    uint64_t v14 = swift_slowAlloc();
    uint64_t v30 = v14;
    *(_DWORD *)uint64_t v13 = 136380675;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 192) = sub_24D1D0A78(v26, v12, &v30);
    sub_24D219310();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24D1B6000, v6, v7, "Fetch energy windows for %{private}s\"", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253322AA0](v14, -1, -1);
    MEMORY[0x253322AA0](v13, -1, -1);

    unint64_t v15 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v15(v27, v28);
  }
  else
  {
    swift_bridgeObjectRelease_n();

    unint64_t v15 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v15(v9, v10);
  }
  *(void *)(v0 + 360) = v15;
  uint64_t v16 = *(void *)(v0 + 288);
  uint64_t v18 = *(void *)(v0 + 264);
  uint64_t v17 = *(void *)(v0 + 272);
  unsigned int v29 = *(unsigned __int8 *)(v0 + 392);
  uint64_t v19 = *(void *)(v0 + 216);
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  *(void *)(v0 + 368) = sub_24D217288();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v16, v19, v18);
  unint64_t v20 = (*(unsigned __int8 *)(v17 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
  uint64_t v21 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v17 + 32))(v21 + v20, v16, v18);
  uint64_t v22 = (void *)sub_24D217944((uint64_t)sub_24D1FE1B8, v21);
  *(void *)(v0 + 376) = v22;
  swift_release();
  uint64_t v23 = sub_24D2190E0();
  *(void *)(v0 + 384) = v23;
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 56) = v0 + 144;
  *(void *)(v0 + 24) = sub_24D1F3A7C;
  uint64_t v24 = swift_continuation_init();
  *(void *)(v0 + 80) = MEMORY[0x263EF8330];
  *(void *)(v0 + 88) = 0x40000000;
  *(void *)(v0 + 96) = sub_24D2000DC;
  *(void *)(v0 + 104) = &block_descriptor_135;
  *(void *)(v0 + 112) = v24;
  objc_msgSend(v22, sel_energyWindowsFor_withCaching_completionHandler_, v23, v29);
  return MEMORY[0x270FA23F0](v0 + 16);
}

uint64_t sub_24D1F3A7C()
{
  return MEMORY[0x270FA2498](sub_24D1F3B5C, 0, 0);
}

uint64_t sub_24D1F3B5C()
{
  uint64_t v27 = v0;
  uint64_t v1 = *(void **)(v0 + 384);
  uint64_t v2 = *(void *)(v0 + 368);
  uint64_t v4 = *(void *)(v0 + 144);
  unint64_t v3 = *(void *)(v0 + 152);
  swift_unknownObjectRelease();

  objc_msgSend(*(id *)(v2 + 16), sel_invalidate);
  if (v3 >> 60 == 15)
  {
    (*(void (**)(void, void, void))(v0 + 344))(*(void *)(v0 + 320), *(void *)(v0 + 336), *(void *)(v0 + 296));
    uint64_t v5 = sub_24D219000();
    os_log_type_t v6 = sub_24D2192D0();
    BOOL v7 = os_log_type_enabled(v5, v6);
    BOOL v8 = *(void (**)(uint64_t, uint64_t))(v0 + 360);
    uint64_t v9 = *(void *)(v0 + 320);
    uint64_t v10 = *(void *)(v0 + 296);
    if (v7)
    {
      uint64_t v25 = *(void *)(v0 + 320);
      uint64_t v24 = *(void (**)(uint64_t, uint64_t))(v0 + 360);
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      uint64_t v26 = v12;
      *(_DWORD *)uint64_t v11 = 136446210;
      *(void *)(v0 + 168) = sub_24D1D0A78(0xD00000000000001ELL, 0x800000024D21C490, &v26);
      sub_24D219310();
      _os_log_impl(&dword_24D1B6000, v5, v6, "%{public}s", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x253322AA0](v12, -1, -1);
      MEMORY[0x253322AA0](v11, -1, -1);

      v24(v25, v10);
    }
    else
    {

      v8(v9, v10);
    }
    sub_24D1D5A68();
    uint64_t v15 = swift_allocError();
    *uint64_t v16 = 3;
    *(void *)(v0 + 160) = v15;
    sub_24D219210();
    swift_release();
  }
  else
  {
    uint64_t v13 = sub_24D1DA208(v4, v3);
    uint64_t v14 = (void *)MEMORY[0x2533225B0](v13);
    sub_24D2189B0();
    swift_allocObject();
    sub_24D2189A0();
    sub_24D1FE1D8();
    sub_24D218990();
    uint64_t v17 = *(void *)(v0 + 256);
    uint64_t v18 = *(void *)(v0 + 240);
    uint64_t v19 = *(void *)(v0 + 248);
    uint64_t v21 = *(void *)(v0 + 224);
    uint64_t v20 = *(void *)(v0 + 232);
    swift_release();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 32))(v17, v19, v20);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v21, v17, v20);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v18 + 56))(v21, 0, 1, v20);
    sub_24D219220();
    sub_24D1FE230(v4, v3);
    swift_release();
    sub_24D1FE230(v4, v3);
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v20);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v22 = *(uint64_t (**)(void))(v0 + 8);
  return v22();
}

uint64_t sub_24D1F4130(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_24D219020();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  BOOL v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B18A2F8 != -1) {
    swift_once();
  }
  uint64_t v8 = __swift_project_value_buffer(v4, (uint64_t)qword_26B18A8F0);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  id v9 = a1;
  id v10 = a1;
  uint64_t v11 = sub_24D219000();
  os_log_type_t v12 = sub_24D2192D0();
  if (os_log_type_enabled(v11, v12))
  {
    void v20[2] = a2;
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v21 = (uint64_t)a1;
    uint64_t v22 = v14;
    *(_DWORD *)uint64_t v13 = 136446210;
    v20[1] = v13 + 4;
    id v15 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5D0);
    uint64_t v16 = sub_24D219100();
    uint64_t v21 = sub_24D1D0A78(v16, v17, &v22);
    sub_24D219310();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_24D1B6000, v11, v12, "Failed to fetch energy windows. %{public}s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253322AA0](v14, -1, -1);
    MEMORY[0x253322AA0](v13, -1, -1);
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v22 = (uint64_t)a1;
  id v18 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A598);
  return sub_24D219210();
}

uint64_t sub_24D1F43F4(double a1, double a2)
{
  *(double *)(v2 + 32) = a1;
  *(double *)(v2 + 40) = a2;
  return MEMORY[0x270FA2498](sub_24D1F4414, 0, 0);
}

uint64_t sub_24D1F4414()
{
  uint64_t v2 = v0[4];
  uint64_t v1 = v0[5];
  uint64_t v3 = swift_task_alloc();
  v0[6] = v3;
  *(void *)(v3 + 16) = v2;
  *(void *)(v3 + 24) = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[7] = v4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BAF8);
  *uint64_t v4 = v0;
  v4[1] = sub_24D1F4520;
  return MEMORY[0x270FA2360](v0 + 2, 0, 0, 0xD000000000000010, 0x800000024D21B600, sub_24D1B8D30, v3, v5);
}

uint64_t sub_24D1F4520()
{
  *(void *)(*(void *)v1 + 64) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_24D1F4658;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_24D1F463C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D1F463C()
{
  return (*(uint64_t (**)(void, void))(v0 + 8))(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_24D1F4658()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24D1F46BC(uint64_t a1, double a2, double a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985C218);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388]();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5B0);
  MEMORY[0x270FA5388]();
  id v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_24D219240();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  unint64_t v12 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = 0;
  *(void *)(v13 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v13 + v12, (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  uint64_t v14 = (double *)(v13 + ((v8 + v12 + 7) & 0xFFFFFFFFFFFFFFF8));
  *uint64_t v14 = a2;
  v14[1] = a3;
  sub_24D1BA610((uint64_t)v10, (uint64_t)&unk_26985C228, v13);
  return swift_release();
}

uint64_t sub_24D1F48A8(double a1, double a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(double *)(v6 + 200) = a1;
  *(double *)(v6 + 208) = a2;
  *(void *)(v6 + 192) = a6;
  uint64_t v7 = sub_24D219020();
  *(void *)(v6 + 216) = v7;
  *(void *)(v6 + 224) = *(void *)(v7 - 8);
  *(void *)(v6 + 232) = swift_task_alloc();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985C218);
  *(void *)(v6 + 240) = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  *(void *)(v6 + 248) = v9;
  *(void *)(v6 + 256) = *(void *)(v9 + 64);
  *(void *)(v6 + 264) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D1F49D4, 0, 0);
}

uint64_t sub_24D1F49D4()
{
  uint64_t v1 = *((void *)v0 + 33);
  uint64_t v2 = *((void *)v0 + 30);
  uint64_t v3 = *((void *)v0 + 31);
  double v5 = v0[25];
  double v4 = v0[26];
  uint64_t v6 = *((void *)v0 + 24);
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  *((void *)v0 + 34) = sub_24D217288();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v6, v2);
  unint64_t v7 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v8 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v8 + v7, v1, v2);
  uint64_t v9 = (void *)sub_24D217944((uint64_t)sub_24D1FFD40, v8);
  *((void *)v0 + 35) = v9;
  swift_release();
  *((void *)v0 + 2) = v0;
  *((void *)v0 + 7) = v0 + 18;
  *((void *)v0 + 3) = sub_24D1F4BC0;
  uint64_t v10 = swift_continuation_init();
  *((void *)v0 + 10) = MEMORY[0x263EF8330];
  *((void *)v0 + 11) = 0x40000000;
  *((void *)v0 + 12) = sub_24D1F5220;
  *((void *)v0 + 13) = &block_descriptor_247;
  *((void *)v0 + 14) = v10;
  objc_msgSend(v9, sel_gridIDLookupWithCoordinate_completionHandler_, v0 + 10, v5, v4);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_24D1F4BC0()
{
  return MEMORY[0x270FA2498](sub_24D1F4CA0, 0, 0);
}

uint64_t sub_24D1F4CA0()
{
  uint64_t v21 = v0;
  uint64_t v1 = v0[34];
  uint64_t v2 = v0[18];
  uint64_t v3 = v0[19];
  swift_unknownObjectRelease();
  objc_msgSend(*(id *)(v1 + 16), sel_invalidate);
  if (v3)
  {
    v0[20] = v2;
    v0[21] = v3;
    sub_24D219220();
  }
  else
  {
    if (qword_26B18A2F8 != -1) {
      swift_once();
    }
    uint64_t v4 = v0[28];
    uint64_t v5 = v0[29];
    uint64_t v6 = v0[27];
    uint64_t v7 = __swift_project_value_buffer(v6, (uint64_t)qword_26B18A8F0);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v5, v7, v6);
    uint64_t v8 = sub_24D219000();
    os_log_type_t v9 = sub_24D2192D0();
    BOOL v10 = os_log_type_enabled(v8, v9);
    uint64_t v12 = v0[28];
    uint64_t v11 = v0[29];
    uint64_t v13 = v0[27];
    if (v10)
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      uint64_t v15 = swift_slowAlloc();
      uint64_t v20 = v15;
      *(_DWORD *)uint64_t v14 = 136315138;
      v0[23] = sub_24D1D0A78(0xD000000000000018, 0x800000024D21C500, &v20);
      sub_24D219310();
      _os_log_impl(&dword_24D1B6000, v8, v9, "%s", v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x253322AA0](v15, -1, -1);
      MEMORY[0x253322AA0](v14, -1, -1);
    }

    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
    sub_24D1D5A68();
    uint64_t v16 = swift_allocError();
    *unint64_t v17 = 4;
    v0[22] = v16;
    sub_24D219210();
  }
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  id v18 = (uint64_t (*)(void))v0[1];
  return v18();
}

uint64_t sub_24D1F4F5C(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_24D219020();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B18A2F8 != -1) {
    swift_once();
  }
  uint64_t v8 = __swift_project_value_buffer(v4, (uint64_t)qword_26B18A8F0);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  id v9 = a1;
  id v10 = a1;
  uint64_t v11 = sub_24D219000();
  os_log_type_t v12 = sub_24D2192D0();
  if (os_log_type_enabled(v11, v12))
  {
    void v20[2] = a2;
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v21 = (uint64_t)a1;
    uint64_t v22 = v14;
    *(_DWORD *)uint64_t v13 = 136315138;
    v20[1] = v13 + 4;
    id v15 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5D0);
    uint64_t v16 = sub_24D219100();
    uint64_t v21 = sub_24D1D0A78(v16, v17, &v22);
    sub_24D219310();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_24D1B6000, v11, v12, "Grid ID lookup failed. %s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253322AA0](v14, -1, -1);
    MEMORY[0x253322AA0](v13, -1, -1);
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v22 = (uint64_t)a1;
  id v18 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985C218);
  return sub_24D219210();
}

uint64_t sub_24D1F5220(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2) {
    uint64_t v3 = sub_24D2190F0();
  }
  else {
    uint64_t v3 = 0;
  }
  v5[0] = v3;
  v5[1] = a2;
  sub_24D1DC0B8((uint64_t)v5, *(void *)(*(void *)(v2 + 64) + 40), &qword_26985BAF8);
  return swift_continuation_resume();
}

uint64_t sub_24D1F5290()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v1;
  unint64_t v2 = sub_24D1FB034();
  *uint64_t v1 = v0;
  v1[1] = sub_24D1F1F68;
  return MEMORY[0x270FA2360](v0 + 16, 0, 0, 0xD000000000000014, 0x800000024D21C2F0, sub_24D1F5370, 0, v2);
}

uint64_t sub_24D1F5370(uint64_t a1)
{
  return sub_24D1F6AD4(a1, &qword_26B18A5A8, (uint64_t)&unk_26FF7B468, (uint64_t)&unk_26985C118);
}

uint64_t sub_24D1F5398(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[17] = a4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5A8);
  v4[18] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v4[19] = v6;
  v4[20] = *(void *)(v6 + 64);
  v4[21] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D1F5464, 0, 0);
}

uint64_t sub_24D1F5464()
{
  uint64_t v1 = v0[21];
  uint64_t v2 = v0[18];
  uint64_t v3 = v0[19];
  uint64_t v4 = v0[17];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[22] = sub_24D217288();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v6 + v5, v1, v2);
  uint64_t v7 = (void *)sub_24D217944((uint64_t)sub_24D1FDF7C, v6);
  v0[23] = v7;
  swift_release();
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_24D1F563C;
  uint64_t v8 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_24D1F59E0;
  v0[13] = &block_descriptor_127;
  v0[14] = v8;
  objc_msgSend(v7, sel_getCurrentLocationWithCompletionHandler_, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_24D1F563C()
{
  return MEMORY[0x270FA2498](sub_24D1FFD84, 0, 0);
}

uint64_t sub_24D1F571C(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_24D219020();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B18A8E8 != -1) {
    swift_once();
  }
  uint64_t v8 = __swift_project_value_buffer(v4, (uint64_t)qword_26B18A908);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  id v9 = a1;
  id v10 = a1;
  uint64_t v11 = sub_24D219000();
  os_log_type_t v12 = sub_24D2192D0();
  if (os_log_type_enabled(v11, v12))
  {
    void v20[2] = a2;
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v21 = (uint64_t)a1;
    uint64_t v22 = v14;
    *(_DWORD *)uint64_t v13 = 136315138;
    v20[1] = v13 + 4;
    id v15 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5D0);
    uint64_t v16 = sub_24D219100();
    uint64_t v21 = sub_24D1D0A78(v16, v17, &v22);
    sub_24D219310();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_24D1B6000, v11, v12, "Failed to get Current Location. %s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253322AA0](v14, -1, -1);
    MEMORY[0x253322AA0](v13, -1, -1);
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v22 = (uint64_t)a1;
  id v18 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5A8);
  return sub_24D219210();
}

uint64_t sub_24D1F59E0(uint64_t a1, void *a2)
{
  **(void **)(*(void *)(*(void *)(a1 + 32) + 64) + 40) = a2;
  id v2 = a2;

  return swift_continuation_resume();
}

uint64_t sub_24D1F5A34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  return MEMORY[0x270FA2498](sub_24D1F5A58, 0, 0);
}

uint64_t sub_24D1F5A58()
{
  uint64_t v1 = *(void *)(v0 + 32);
  long long v6 = *(_OWORD *)(v0 + 16);
  uint64_t v2 = swift_task_alloc();
  *(void *)(v0 + 40) = v2;
  *(_OWORD *)(v2 + 16) = v6;
  *(void *)(v2 + 32) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v3;
  *uint64_t v3 = v0;
  uint64_t v4 = MEMORY[0x263F8EE60];
  v3[1] = sub_24D1F5B5C;
  return MEMORY[0x270FA2360](v3, 0, 0, 0xD000000000000026, 0x800000024D21C310, sub_24D1FB074, v2, v4 + 8);
}

uint64_t sub_24D1F5B5C()
{
  *(void *)(*(void *)v1 + 56) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_24D1FFD90;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_24D1FFD8C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D1F5C78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v25 = a3;
  uint64_t v26 = a4;
  uint64_t v24 = a2;
  uint64_t v5 = sub_24D218B10();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  MEMORY[0x270FA5388](v5);
  uint64_t v23 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A808);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5B0);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_24D219240();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v14, 1, 1, v15);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a1, v8);
  uint64_t v16 = v5;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v24, v5);
  unint64_t v17 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  unint64_t v18 = (v10 + *(unsigned __int8 *)(v6 + 80) + v17) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = 0;
  *(void *)(v19 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v19 + v17, v11, v8);
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v19 + v18, v23, v16);
  uint64_t v20 = (void *)(v19 + ((v7 + v18 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v21 = v26;
  *uint64_t v20 = v25;
  v20[1] = v21;
  swift_bridgeObjectRetain();
  sub_24D1F673C((uint64_t)v14, (uint64_t)&unk_26985C108, v19);
  return swift_release();
}

uint64_t sub_24D1F5F40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[17] = a6;
  v7[18] = a7;
  v7[15] = a4;
  v7[16] = a5;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A808);
  v7[19] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v7[20] = v9;
  v7[21] = *(void *)(v9 + 64);
  v7[22] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D1F6010, 0, 0);
}

uint64_t sub_24D1F6010()
{
  uint64_t v1 = v0[22];
  uint64_t v3 = v0[19];
  uint64_t v2 = v0[20];
  uint64_t v4 = v0[15];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[23] = sub_24D217288();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  unint64_t v5 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v6 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v2 + 32))(v6 + v5, v1, v3);
  uint64_t v7 = (void *)sub_24D217944((uint64_t)sub_24D1FDE54, v6);
  v0[24] = v7;
  swift_release();
  uint64_t v8 = sub_24D218AF0();
  v0[25] = v8;
  uint64_t v9 = sub_24D2190E0();
  v0[26] = v9;
  v0[2] = v0;
  v0[3] = sub_24D1F6210;
  uint64_t v10 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_24D1C39CC;
  v0[13] = &block_descriptor_118;
  v0[14] = v10;
  objc_msgSend(v7, sel_requestAddToShareForHomeUUID_siteID_completionHandler_, v8, v9);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_24D1F6210()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 216) = v1;
  if (v1) {
    uint64_t v2 = sub_24D1F63D4;
  }
  else {
    uint64_t v2 = sub_24D1F6320;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D1F6320()
{
  uint64_t v2 = (void *)v0[25];
  uint64_t v1 = (void *)v0[26];
  uint64_t v3 = v0[23];
  swift_unknownObjectRelease();

  objc_msgSend(*(id *)(v3 + 16), sel_invalidate);
  sub_24D219220();
  swift_release();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_24D1F63D4()
{
  uint64_t v1 = (void *)v0[26];
  uint64_t v2 = (void *)v0[25];
  swift_willThrow();
  swift_release();
  swift_unknownObjectRelease();

  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_24D1F6478(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_24D219020();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B18A8E8 != -1) {
    swift_once();
  }
  uint64_t v8 = __swift_project_value_buffer(v4, (uint64_t)qword_26B18A908);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  id v9 = a1;
  id v10 = a1;
  uint64_t v11 = sub_24D219000();
  os_log_type_t v12 = sub_24D2192D0();
  if (os_log_type_enabled(v11, v12))
  {
    void v20[2] = a2;
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v21 = (uint64_t)a1;
    uint64_t v22 = v14;
    *(_DWORD *)uint64_t v13 = 136315138;
    v20[1] = v13 + 4;
    id v15 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5D0);
    uint64_t v16 = sub_24D219100();
    uint64_t v21 = sub_24D1D0A78(v16, v17, &v22);
    sub_24D219310();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_24D1B6000, v11, v12, "Failed to request add to share. %s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253322AA0](v14, -1, -1);
    MEMORY[0x253322AA0](v13, -1, -1);
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v22 = (uint64_t)a1;
  id v18 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A808);
  return sub_24D219210();
}

uint64_t sub_24D1F673C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_24D219240();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_24D219230();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_24D1D9A80(a1, &qword_26B18A5B0);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24D219200();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_24D1F68C4()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  uint64_t v2 = MEMORY[0x263F8EE60];
  v1[1] = sub_24D1F6998;
  return MEMORY[0x270FA2360](v1, 0, 0, 0xD000000000000012, 0x800000024D21C340, sub_24D1F6AAC, 0, v2 + 8);
}

uint64_t sub_24D1F6998()
{
  *(void *)(*(void *)v1 + 24) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24D1C8068;
  }
  else {
    uint64_t v2 = sub_24D1C4300;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D1F6AAC(uint64_t a1)
{
  return sub_24D1F6AD4(a1, &qword_26B18A808, (uint64_t)&unk_26FF7B3C8, (uint64_t)&unk_26985C0F8);
}

uint64_t sub_24D1F6AD4(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5B0);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_24D219240();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  unint64_t v13 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = 0;
  *(void *)(v14 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v14 + v13, (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  sub_24D1BA610((uint64_t)v11, a4, v14);
  return swift_release();
}

uint64_t sub_24D1F6C8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[16] = a4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A808);
  v4[17] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v4[18] = v6;
  v4[19] = *(void *)(v6 + 64);
  v4[20] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D1F6D58, 0, 0);
}

uint64_t sub_24D1F6D58()
{
  uint64_t v1 = v0[20];
  uint64_t v2 = v0[17];
  uint64_t v3 = v0[18];
  uint64_t v4 = v0[16];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[21] = sub_24D217288();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v6 + v5, v1, v2);
  uint64_t v7 = (void *)sub_24D217944((uint64_t)sub_24D1FDB18, v6);
  v0[22] = v7;
  swift_release();
  v0[2] = v0;
  v0[3] = sub_24D1F6F20;
  uint64_t v8 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_24D1C39CC;
  v0[13] = &block_descriptor_110;
  v0[14] = v8;
  objc_msgSend(v7, sel_resetUtilityDataWithCompletionHandler_, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_24D1F6F20()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 184) = v1;
  if (v1) {
    uint64_t v2 = sub_24D1F70C4;
  }
  else {
    uint64_t v2 = sub_24D1F7030;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D1F7030()
{
  uint64_t v1 = *(void *)(v0 + 168);
  swift_unknownObjectRelease();
  objc_msgSend(*(id *)(v1 + 16), sel_invalidate);
  sub_24D219220();
  swift_release();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_24D1F70C4()
{
  uint64_t v1 = v0[23];
  swift_willThrow();
  swift_release();
  swift_unknownObjectRelease();
  v0[15] = v1;
  sub_24D219210();
  swift_task_dealloc();
  uint64_t v2 = (uint64_t (*)(void))v0[1];
  return v2();
}

uint64_t sub_24D1F7170(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_24D219020();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B18A8E8 != -1) {
    swift_once();
  }
  uint64_t v8 = __swift_project_value_buffer(v4, (uint64_t)qword_26B18A908);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  id v9 = a1;
  id v10 = a1;
  uint64_t v11 = sub_24D219000();
  os_log_type_t v12 = sub_24D2192D0();
  if (os_log_type_enabled(v11, v12))
  {
    void v20[2] = a2;
    unint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v21 = (uint64_t)a1;
    uint64_t v22 = v14;
    *(_DWORD *)unint64_t v13 = 136315138;
    v20[1] = v13 + 4;
    id v15 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5D0);
    uint64_t v16 = sub_24D219100();
    uint64_t v21 = sub_24D1D0A78(v16, v17, &v22);
    sub_24D219310();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_24D1B6000, v11, v12, "Failed to purge all data. %s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253322AA0](v14, -1, -1);
    MEMORY[0x253322AA0](v13, -1, -1);
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v22 = (uint64_t)a1;
  id v18 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A808);
  return sub_24D219210();
}

uint64_t sub_24D1F7434(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  return MEMORY[0x270FA2498](sub_24D1F7458, 0, 0);
}

uint64_t sub_24D1F7458()
{
  uint64_t v1 = *(void *)(v0 + 32);
  long long v6 = *(_OWORD *)(v0 + 16);
  uint64_t v2 = swift_task_alloc();
  *(void *)(v0 + 40) = v2;
  *(_OWORD *)(v2 + 16) = v6;
  *(void *)(v2 + 32) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v3;
  *uint64_t v3 = v0;
  uint64_t v4 = MEMORY[0x263F8EE60];
  v3[1] = sub_24D1F755C;
  return MEMORY[0x270FA2360](v3, 0, 0, 0xD00000000000001DLL, 0x800000024D21C360, sub_24D1FB080, v2, v4 + 8);
}

uint64_t sub_24D1F755C()
{
  *(void *)(*(void *)v1 + 56) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_24D1FFD90;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_24D1C4300;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D1F7678(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v21 = a4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A808);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x270FA5388](v7);
  id v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5B0);
  MEMORY[0x270FA5388](v11 - 8);
  unint64_t v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_24D219240();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 1, 1, v14);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a1, v7);
  unint64_t v15 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  unint64_t v16 = (v9 + v15 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = 0;
  *(void *)(v17 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v17 + v15, v10, v7);
  id v18 = (void *)(v17 + v16);
  *id v18 = a2;
  v18[1] = a3;
  *(void *)(v17 + ((v16 + 23) & 0xFFFFFFFFFFFFFFF8)) = v21;
  swift_bridgeObjectRetain();
  sub_24D1BA610((uint64_t)v13, (uint64_t)&unk_26985C0E8, v17);
  return swift_release();
}

uint64_t sub_24D1F7884(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[18] = a6;
  v7[19] = a7;
  v7[16] = a4;
  v7[17] = a5;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A808);
  v7[20] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v7[21] = v9;
  v7[22] = *(void *)(v9 + 64);
  v7[23] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D1F7954, 0, 0);
}

uint64_t sub_24D1F7954()
{
  uint64_t v1 = v0[23];
  uint64_t v3 = v0[20];
  uint64_t v2 = v0[21];
  uint64_t v11 = v0[19];
  uint64_t v4 = v0[16];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[24] = sub_24D217288();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  unint64_t v5 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v6 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v2 + 32))(v6 + v5, v1, v3);
  uint64_t v7 = (void *)sub_24D217944((uint64_t)sub_24D1FD9F0, v6);
  v0[25] = v7;
  swift_release();
  uint64_t v8 = sub_24D2190E0();
  v0[26] = v8;
  v0[2] = v0;
  v0[3] = sub_24D1F7B44;
  uint64_t v9 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_24D1C39CC;
  v0[13] = &block_descriptor_102;
  v0[14] = v9;
  objc_msgSend(v7, sel_submitTestTaskWithTaskID_delay_completionHandler_, v8, v11);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_24D1F7B44()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 216) = v1;
  if (v1) {
    uint64_t v2 = sub_24D1F7CF4;
  }
  else {
    uint64_t v2 = sub_24D1F7C54;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D1F7C54()
{
  uint64_t v1 = (void *)v0[26];
  uint64_t v2 = v0[24];
  swift_unknownObjectRelease();

  objc_msgSend(*(id *)(v2 + 16), sel_invalidate);
  sub_24D219220();
  swift_release();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_24D1F7CF4()
{
  uint64_t v2 = (void *)v0[26];
  uint64_t v1 = v0[27];
  swift_willThrow();
  swift_release();
  swift_unknownObjectRelease();

  v0[15] = v1;
  sub_24D219210();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_24D1F7DA8(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_24D219020();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B18A8E8 != -1) {
    swift_once();
  }
  uint64_t v8 = __swift_project_value_buffer(v4, (uint64_t)qword_26B18A908);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  id v9 = a1;
  id v10 = a1;
  uint64_t v11 = sub_24D219000();
  os_log_type_t v12 = sub_24D2192D0();
  if (os_log_type_enabled(v11, v12))
  {
    void v20[2] = a2;
    unint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v21 = (uint64_t)a1;
    uint64_t v22 = v14;
    *(_DWORD *)unint64_t v13 = 136315138;
    v20[1] = v13 + 4;
    id v15 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5D0);
    uint64_t v16 = sub_24D219100();
    uint64_t v21 = sub_24D1D0A78(v16, v17, &v22);
    sub_24D219310();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_24D1B6000, v11, v12, "Failed to submit test task. %s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253322AA0](v14, -1, -1);
    MEMORY[0x253322AA0](v13, -1, -1);
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v22 = (uint64_t)a1;
  id v18 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A808);
  return sub_24D219210();
}

uint64_t sub_24D1F806C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  return MEMORY[0x270FA2498](sub_24D1F8090, 0, 0);
}

uint64_t sub_24D1F8090()
{
  uint64_t v1 = *(void *)(v0 + 32);
  long long v6 = *(_OWORD *)(v0 + 16);
  uint64_t v2 = swift_task_alloc();
  *(void *)(v0 + 40) = v2;
  *(_OWORD *)(v2 + 16) = v6;
  *(void *)(v2 + 32) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v3;
  *uint64_t v3 = v0;
  uint64_t v4 = MEMORY[0x263F8EE60];
  v3[1] = sub_24D1F5B5C;
  return MEMORY[0x270FA2360](v3, 0, 0, 0xD00000000000001BLL, 0x800000024D21C380, sub_24D1FB08C, v2, v4 + 8);
}

uint64_t sub_24D1F8194(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v21 = a2;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A808);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x270FA5388](v7);
  id v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5B0);
  MEMORY[0x270FA5388](v11 - 8);
  unint64_t v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_24D219240();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 1, 1, v14);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a1, v7);
  unint64_t v15 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  unint64_t v16 = (v9 + v15 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = 0;
  *(void *)(v17 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v17 + v15, v10, v7);
  id v18 = (void *)(v17 + v16);
  *id v18 = v21;
  v18[1] = a3;
  *(void *)(v17 + ((v16 + 23) & 0xFFFFFFFFFFFFFFF8)) = a4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_24D1BA610((uint64_t)v13, (uint64_t)&unk_26985C0D8, v17);
  return swift_release();
}

uint64_t sub_24D1F83A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[18] = a6;
  v7[19] = a7;
  v7[16] = a4;
  v7[17] = a5;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A808);
  v7[20] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v7[21] = v9;
  v7[22] = *(void *)(v9 + 64);
  v7[23] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D1F8478, 0, 0);
}

uint64_t sub_24D1F8478()
{
  uint64_t v1 = v0[23];
  uint64_t v2 = v0[20];
  uint64_t v3 = v0[21];
  uint64_t v12 = v0[19];
  uint64_t v4 = v0[16];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[24] = sub_24D217288();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v6 + v5, v1, v2);
  uint64_t v7 = (void *)sub_24D217944((uint64_t)sub_24D1FD700, v6);
  v0[25] = v7;
  swift_release();
  uint64_t v8 = sub_24D2190E0();
  v0[26] = v8;
  if (v12) {
    uint64_t v9 = sub_24D219030();
  }
  else {
    uint64_t v9 = 0;
  }
  v0[27] = v9;
  v0[2] = v0;
  v0[3] = sub_24D1F869C;
  uint64_t v10 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_24D1C39CC;
  v0[13] = &block_descriptor_94;
  v0[14] = v10;
  objc_msgSend(v7, sel_setKVSDictionaryWithKey_dict_completionHandler_, v8, v9, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_24D1F869C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 224) = v1;
  if (v1) {
    uint64_t v2 = sub_24D1F8858;
  }
  else {
    uint64_t v2 = sub_24D1F87AC;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D1F87AC()
{
  uint64_t v2 = (void *)v0[26];
  uint64_t v1 = (void *)v0[27];
  uint64_t v3 = v0[24];
  swift_unknownObjectRelease();

  objc_msgSend(*(id *)(v3 + 16), sel_invalidate);
  sub_24D219220();
  swift_release();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_24D1F8858()
{
  uint64_t v2 = (void *)v0[27];
  uint64_t v1 = v0[28];
  uint64_t v3 = (void *)v0[26];
  swift_willThrow();
  swift_release();
  swift_unknownObjectRelease();

  v0[15] = v1;
  sub_24D219210();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_24D1F891C(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_24D219020();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B18A8E8 != -1) {
    swift_once();
  }
  uint64_t v8 = __swift_project_value_buffer(v4, (uint64_t)qword_26B18A908);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  id v9 = a1;
  id v10 = a1;
  uint64_t v11 = sub_24D219000();
  os_log_type_t v12 = sub_24D2192D0();
  if (os_log_type_enabled(v11, v12))
  {
    void v20[2] = a2;
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v21 = (uint64_t)a1;
    uint64_t v22 = v14;
    *(_DWORD *)uint64_t v13 = 136315138;
    v20[1] = v13 + 4;
    id v15 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5D0);
    uint64_t v16 = sub_24D219100();
    uint64_t v21 = sub_24D1D0A78(v16, v17, &v22);
    sub_24D219310();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_24D1B6000, v11, v12, "Failed to set kvs. %s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253322AA0](v14, -1, -1);
    MEMORY[0x253322AA0](v13, -1, -1);
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v22 = (uint64_t)a1;
  id v18 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A808);
  return sub_24D219210();
}

uint64_t sub_24D1F8BE0(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = a2;
  return MEMORY[0x270FA2498](sub_24D1F8C00, 0, 0);
}

uint64_t sub_24D1F8C00()
{
  uint64_t v2 = v0[3];
  uint64_t v1 = v0[4];
  uint64_t v3 = swift_task_alloc();
  v0[5] = v3;
  *(void *)(v3 + 16) = v2;
  *(void *)(v3 + 24) = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[6] = v4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A8D0);
  *uint64_t v4 = v0;
  v4[1] = sub_24D1F14CC;
  return MEMORY[0x270FA2360](v0 + 2, 0, 0, 0xD000000000000016, 0x800000024D21C3A0, sub_24D1FB098, v3, v5);
}

uint64_t sub_24D1F8D04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A8D8);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5B0);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_24D219240();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  unint64_t v13 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = 0;
  *(void *)(v14 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v14 + v13, (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  id v15 = (void *)(v14 + ((v8 + v13 + 7) & 0xFFFFFFFFFFFFFFF8));
  *id v15 = a2;
  v15[1] = a3;
  swift_bridgeObjectRetain();
  sub_24D1BA610((uint64_t)v11, (uint64_t)&unk_26985C0C8, v14);
  return swift_release();
}

uint64_t sub_24D1F8EF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[19] = a5;
  v6[20] = a6;
  v6[18] = a4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A8D8);
  v6[21] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v6[22] = v8;
  v6[23] = *(void *)(v8 + 64);
  v6[24] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D1F8FC8, 0, 0);
}

uint64_t sub_24D1F8FC8()
{
  uint64_t v1 = v0[24];
  uint64_t v2 = v0[21];
  uint64_t v3 = v0[22];
  uint64_t v4 = v0[18];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[25] = sub_24D217288();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v6 + v5, v1, v2);
  uint64_t v7 = (void *)sub_24D217944((uint64_t)sub_24D1FD48C, v6);
  v0[26] = v7;
  swift_release();
  uint64_t v8 = sub_24D2190E0();
  v0[27] = v8;
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_24D1BA2D8;
  uint64_t v9 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_24D1F9484;
  v0[13] = &block_descriptor_86;
  v0[14] = v9;
  objc_msgSend(v7, sel_getKVSDictionaryWithKey_completionHandler_, v8);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_24D1F91C0(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_24D219020();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B18A8E8 != -1) {
    swift_once();
  }
  uint64_t v8 = __swift_project_value_buffer(v4, (uint64_t)qword_26B18A908);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  id v9 = a1;
  id v10 = a1;
  uint64_t v11 = sub_24D219000();
  os_log_type_t v12 = sub_24D2192D0();
  if (os_log_type_enabled(v11, v12))
  {
    void v20[2] = a2;
    unint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v21 = (uint64_t)a1;
    uint64_t v22 = v14;
    *(_DWORD *)unint64_t v13 = 136315138;
    v20[1] = v13 + 4;
    id v15 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5D0);
    uint64_t v16 = sub_24D219100();
    uint64_t v21 = sub_24D1D0A78(v16, v17, &v22);
    sub_24D219310();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_24D1B6000, v11, v12, "Failed to get kvs. %s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253322AA0](v14, -1, -1);
    MEMORY[0x253322AA0](v13, -1, -1);
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v22 = (uint64_t)a1;
  id v18 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A8D8);
  return sub_24D219210();
}

uint64_t sub_24D1F9484(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5D0);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return MEMORY[0x270FA2410](v3, v5);
  }
  else
  {
    if (a2) {
      uint64_t v8 = sub_24D219040();
    }
    else {
      uint64_t v8 = 0;
    }
    uint64_t v10 = v8;
    sub_24D1DC0B8((uint64_t)&v10, *(void *)(*(void *)(v3 + 64) + 40), &qword_26B18A8D0);
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_24D1F957C(char a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 176) = a2;
  *(void *)(v3 + 184) = a3;
  *(unsigned char *)(v3 + 288) = a1;
  uint64_t v4 = sub_24D219020();
  *(void *)(v3 + 192) = v4;
  *(void *)(v3 + 200) = *(void *)(v4 - 8);
  *(void *)(v3 + 208) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D1F9640, 0, 0);
}

uint64_t sub_24D1F9640()
{
  uint64_t v1 = sub_24D218CA0();
  uint64_t v3 = v2;
  v0[27] = v2;
  uint64_t v4 = swift_task_alloc();
  v0[28] = v4;
  *(void *)(v4 + 16) = v1;
  *(void *)(v4 + 24) = v3;
  uint64_t v5 = (void *)swift_task_alloc();
  v0[29] = v5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A8D0);
  *uint64_t v5 = v0;
  v5[1] = sub_24D1F9750;
  return MEMORY[0x270FA2360](v0 + 20, 0, 0, 0xD000000000000016, 0x800000024D21C3A0, sub_24D1FFD94, v4, v6);
}

uint64_t sub_24D1F9750()
{
  *(void *)(*(void *)v1 + 240) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_24D1F9A58;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_24D1F986C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D1F986C()
{
  swift_bridgeObjectRelease();
  unint64_t v1 = *(void *)(v0 + 160);
  if (!v1) {
    unint64_t v1 = sub_24D1C5148(MEMORY[0x263F8EE78]);
  }
  int v2 = *(unsigned __int8 *)(v0 + 288);
  *(void *)(v0 + 136) = v1;
  uint64_t v4 = *(void *)(v0 + 176);
  uint64_t v3 = *(void *)(v0 + 184);
  if (v2 == 1)
  {
    *(void *)(v0 + 72) = MEMORY[0x263F8D4F8];
    *(unsigned char *)(v0 + 48) = 1;
    sub_24D1D97B4((_OWORD *)(v0 + 48), (_OWORD *)(v0 + 16));
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_24D1FADE4((_OWORD *)(v0 + 16), v4, v3, isUniquelyReferenced_nonNull_native);
    unint64_t v6 = v1;
    *(void *)(v0 + 136) = v1;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_24D1FAB08(v4, v3, (_OWORD *)(v0 + 80));
    swift_bridgeObjectRelease();
    sub_24D1D9A80(v0 + 80, &qword_26B18A5D8);
    unint64_t v6 = *(void *)(v0 + 136);
  }
  *(void *)(v0 + 248) = v6;
  uint64_t v7 = sub_24D218CA0();
  uint64_t v9 = v8;
  *(void *)(v0 + 256) = v8;
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v0 + 264) = v10;
  v10[2] = v7;
  v10[3] = v9;
  v10[4] = v6;
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v0 + 272) = v11;
  void *v11 = v0;
  uint64_t v12 = MEMORY[0x263F8EE60];
  v11[1] = sub_24D1F9DD8;
  return MEMORY[0x270FA2360](v11, 0, 0, 0xD00000000000001BLL, 0x800000024D21C380, sub_24D1FFD74, v10, v12 + 8);
}

uint64_t sub_24D1F9A58()
{
  uint64_t v25 = v0;
  swift_task_dealloc();
  unint64_t v1 = (void *)v0[30];
  swift_bridgeObjectRelease();
  if (qword_26B18A8E8 != -1) {
    swift_once();
  }
  uint64_t v3 = v0[25];
  uint64_t v2 = v0[26];
  uint64_t v4 = v0[24];
  uint64_t v5 = __swift_project_value_buffer(v4, (uint64_t)qword_26B18A908);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  swift_bridgeObjectRetain();
  id v6 = v1;
  swift_bridgeObjectRetain();
  id v7 = v1;
  uint64_t v8 = sub_24D219000();
  os_log_type_t v9 = sub_24D2192D0();
  BOOL v10 = os_log_type_enabled(v8, v9);
  uint64_t v12 = v0[25];
  uint64_t v11 = v0[26];
  unint64_t v13 = v0[23];
  uint64_t v14 = v0[24];
  if (v10)
  {
    uint64_t v20 = v0[22];
    uint64_t v23 = v0[24];
    uint64_t v15 = swift_slowAlloc();
    uint64_t v21 = (void *)swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    uint64_t v24 = v22;
    *(_DWORD *)uint64_t v15 = 136315650;
    v0[19] = sub_24D1D0A78(0xD00000000000002BLL, 0x800000024D21C3C0, &v24);
    sub_24D219310();
    *(_WORD *)(v15 + 12) = 2080;
    swift_bridgeObjectRetain();
    v0[21] = sub_24D1D0A78(v20, v13, &v24);
    sub_24D219310();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v15 + 22) = 2112;
    id v16 = v1;
    uint64_t v17 = _swift_stdlib_bridgeErrorToNSError();
    v0[18] = v17;
    sub_24D219310();
    *uint64_t v21 = v17;

    _os_log_impl(&dword_24D1B6000, v8, v9, "%s failed for homeID: %s error: %@", (uint8_t *)v15, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName(qword_26985BB28);
    swift_arrayDestroy();
    MEMORY[0x253322AA0](v21, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x253322AA0](v22, -1, -1);
    MEMORY[0x253322AA0](v15, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v23);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v14);
  }
  swift_task_dealloc();
  id v18 = (uint64_t (*)(void))v0[1];
  return v18();
}

uint64_t sub_24D1F9DD8()
{
  *(void *)(*(void *)v1 + 280) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_24D1F9F64;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_24D1F9EF4;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D1F9EF4()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24D1F9F64()
{
  uint64_t v25 = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  uint64_t v1 = (void *)v0[35];
  swift_bridgeObjectRelease();
  if (qword_26B18A8E8 != -1) {
    swift_once();
  }
  uint64_t v3 = v0[25];
  uint64_t v2 = v0[26];
  uint64_t v4 = v0[24];
  uint64_t v5 = __swift_project_value_buffer(v4, (uint64_t)qword_26B18A908);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  swift_bridgeObjectRetain();
  id v6 = v1;
  swift_bridgeObjectRetain();
  id v7 = v1;
  uint64_t v8 = sub_24D219000();
  os_log_type_t v9 = sub_24D2192D0();
  BOOL v10 = os_log_type_enabled(v8, v9);
  uint64_t v12 = v0[25];
  uint64_t v11 = v0[26];
  unint64_t v13 = v0[23];
  uint64_t v14 = v0[24];
  if (v10)
  {
    uint64_t v20 = v0[22];
    uint64_t v23 = v0[24];
    uint64_t v15 = swift_slowAlloc();
    uint64_t v21 = (void *)swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    uint64_t v24 = v22;
    *(_DWORD *)uint64_t v15 = 136315650;
    v0[19] = sub_24D1D0A78(0xD00000000000002BLL, 0x800000024D21C3C0, &v24);
    sub_24D219310();
    *(_WORD *)(v15 + 12) = 2080;
    swift_bridgeObjectRetain();
    v0[21] = sub_24D1D0A78(v20, v13, &v24);
    sub_24D219310();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v15 + 22) = 2112;
    id v16 = v1;
    uint64_t v17 = _swift_stdlib_bridgeErrorToNSError();
    v0[18] = v17;
    sub_24D219310();
    *uint64_t v21 = v17;

    _os_log_impl(&dword_24D1B6000, v8, v9, "%s failed for homeID: %s error: %@", (uint8_t *)v15, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName(qword_26985BB28);
    swift_arrayDestroy();
    MEMORY[0x253322AA0](v21, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x253322AA0](v22, -1, -1);
    MEMORY[0x253322AA0](v15, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v23);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v14);
  }
  swift_task_dealloc();
  id v18 = (uint64_t (*)(void))v0[1];
  return v18();
}

uint64_t sub_24D1FA2E4(uint64_t a1, uint64_t a2)
{
  v2[13] = a1;
  v2[14] = a2;
  uint64_t v3 = sub_24D219020();
  v2[15] = v3;
  v2[16] = *(void *)(v3 - 8);
  v2[17] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D1FA3A4, 0, 0);
}

uint64_t sub_24D1FA3A4()
{
  uint64_t v1 = sub_24D218CA0();
  uint64_t v3 = v2;
  v0[18] = v2;
  uint64_t v4 = swift_task_alloc();
  v0[19] = v4;
  *(void *)(v4 + 16) = v1;
  *(void *)(v4 + 24) = v3;
  uint64_t v5 = (void *)swift_task_alloc();
  v0[20] = v5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A8D0);
  *uint64_t v5 = v0;
  v5[1] = sub_24D1FA4B4;
  return MEMORY[0x270FA2360](v0 + 12, 0, 0, 0xD000000000000016, 0x800000024D21C3A0, sub_24D1FFD94, v4, v6);
}

uint64_t sub_24D1FA4B4()
{
  *(void *)(*(void *)v1 + 168) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_24D1FA710;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_24D1FA5D0;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D1FA5D0()
{
  swift_bridgeObjectRelease();
  unint64_t v1 = *(void *)(v0 + 96);
  if (!v1) {
    unint64_t v1 = sub_24D1C5148(MEMORY[0x263F8EE78]);
  }
  uint64_t v2 = (_OWORD *)(v0 + 16);
  if (*(void *)(v1 + 16))
  {
    uint64_t v4 = *(void *)(v0 + 104);
    uint64_t v3 = *(void *)(v0 + 112);
    swift_bridgeObjectRetain();
    unint64_t v5 = sub_24D1D12EC(v4, v3);
    if (v6)
    {
      sub_24D1D6414(*(void *)(v1 + 56) + 32 * v5, v0 + 16);
    }
    else
    {
      *uint64_t v2 = 0u;
      *(_OWORD *)(v0 + 32) = 0u;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    *uint64_t v2 = 0u;
    *(_OWORD *)(v0 + 32) = 0u;
  }
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + 40))
  {
    if (swift_dynamicCast())
    {
      uint64_t v7 = *(unsigned __int8 *)(v0 + 176);
      goto LABEL_14;
    }
  }
  else
  {
    sub_24D1D9A80(v0 + 16, &qword_26B18A5D8);
  }
  uint64_t v7 = 0;
LABEL_14:
  swift_task_dealloc();
  uint64_t v8 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v8(v7);
}

uint64_t sub_24D1FA710()
{
  uint64_t v27 = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (qword_26B18A8E8 != -1) {
    swift_once();
  }
  unint64_t v1 = (void *)v0[21];
  uint64_t v3 = v0[16];
  uint64_t v2 = v0[17];
  uint64_t v4 = v0[15];
  uint64_t v5 = __swift_project_value_buffer(v4, (uint64_t)qword_26B18A908);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  swift_bridgeObjectRetain();
  id v6 = v1;
  swift_bridgeObjectRetain();
  id v7 = v1;
  uint64_t v8 = sub_24D219000();
  os_log_type_t v9 = sub_24D2192D0();
  BOOL v10 = os_log_type_enabled(v8, v9);
  uint64_t v11 = (void *)v0[21];
  uint64_t v13 = v0[16];
  uint64_t v12 = v0[17];
  unint64_t v14 = v0[14];
  uint64_t v15 = v0[15];
  if (v10)
  {
    uint64_t v25 = v0[17];
    uint64_t v21 = v0[13];
    uint64_t v24 = v0[15];
    uint64_t v16 = swift_slowAlloc();
    uint64_t v22 = (void *)swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    uint64_t v26 = v23;
    *(_DWORD *)uint64_t v16 = 136315650;
    v0[9] = sub_24D1D0A78(0xD000000000000026, 0x800000024D21C3F0, &v26);
    sub_24D219310();
    *(_WORD *)(v16 + 12) = 2080;
    swift_bridgeObjectRetain();
    v0[10] = sub_24D1D0A78(v21, v14, &v26);
    sub_24D219310();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v16 + 22) = 2112;
    id v17 = v11;
    uint64_t v18 = _swift_stdlib_bridgeErrorToNSError();
    v0[11] = v18;
    sub_24D219310();
    *uint64_t v22 = v18;

    _os_log_impl(&dword_24D1B6000, v8, v9, "%s failed for homeID: %s error: %@", (uint8_t *)v16, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName(qword_26985BB28);
    swift_arrayDestroy();
    MEMORY[0x253322AA0](v22, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x253322AA0](v23, -1, -1);
    MEMORY[0x253322AA0](v16, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v25, v24);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v15);
  }
  swift_task_dealloc();
  uint64_t v19 = (uint64_t (*)(void))v0[1];
  return v19(0);
}

uint64_t HomeEnergyManager.deinit()
{
  swift_unknownObjectRelease();
  return v0;
}

uint64_t HomeEnergyManager.__deallocating_deinit()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0228](v0, 40, 7);
}

double sub_24D1FAB08@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_24D1D12EC(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v13 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_24D1D2DB4();
      uint64_t v11 = v13;
    }
    swift_bridgeObjectRelease();
    sub_24D1D97B4((_OWORD *)(*(void *)(v11 + 56) + 32 * v8), a3);
    sub_24D1FAC0C(v8, v11);
    *uint64_t v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

unint64_t sub_24D1FAC0C(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    double result = sub_24D219370();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_24D219590();
        swift_bridgeObjectRetain();
        sub_24D219120();
        uint64_t v10 = sub_24D2195B0();
        double result = swift_bridgeObjectRelease();
        unint64_t v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8) {
            goto LABEL_5;
          }
        }
        else if (v11 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v11)
        {
LABEL_11:
          uint64_t v12 = *(void *)(a2 + 48);
          uint64_t v13 = (_OWORD *)(v12 + 16 * v3);
          unint64_t v14 = (_OWORD *)(v12 + 16 * v6);
          if (v3 != v6 || v13 >= v14 + 1) {
            *uint64_t v13 = *v14;
          }
          uint64_t v15 = *(void *)(a2 + 56);
          uint64_t v16 = (_OWORD *)(v15 + 32 * v3);
          id v17 = (_OWORD *)(v15 + 32 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v16 >= v17 + 2))
          {
            long long v9 = v17[1];
            *uint64_t v16 = *v17;
            v16[1] = v9;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v19 = *v18;
    uint64_t v20 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v20 = *v18;
    uint64_t v19 = (-1 << result) - 1;
  }
  *uint64_t v18 = v20 & v19;
  uint64_t v21 = *(void *)(a2 + 16);
  BOOL v22 = __OFSUB__(v21, 1);
  uint64_t v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

_OWORD *sub_24D1FADE4(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_24D1D12EC(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 < v15 || (a4 & 1) == 0)
  {
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_24D1D2DB4();
      goto LABEL_7;
    }
    sub_24D1D257C(v15, a4 & 1);
    unint64_t v21 = sub_24D1D12EC(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      unint64_t v12 = v21;
      uint64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    double result = (_OWORD *)sub_24D219520();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = (_OWORD *)(v18[7] + 32 * v12);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v19);
    return sub_24D1D97B4(a1, v19);
  }
LABEL_13:
  sub_24D1FCAA0(v12, a2, a3, a1, v18);

  return (_OWORD *)swift_bridgeObjectRetain();
}

uint64_t sub_24D1FAF38(uint64_t a1)
{
  return sub_24D1EA61C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(unsigned __int8 *)(v1 + 32), *(void *)(v1 + 40));
}

uint64_t sub_24D1FAF48(uint64_t a1)
{
  return sub_24D1EB638(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_24D1FAF54(uint64_t a1)
{
  return sub_24D1EC488(a1, *(void *)(v1 + 16));
}

uint64_t sub_24D1FAF5C(uint64_t a1)
{
  return sub_24D1EDC5C(a1, v1[2], v1[3], v1[4], v1[5]);
}

uint64_t sub_24D1FAF68(uint64_t a1)
{
  return sub_24D1EEB88(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_24D1FAF74(uint64_t a1)
{
  return sub_24D1EF9E4(a1, v1[2], v1[3], v1[4], v1[5]);
}

uint64_t sub_24D1FAF80(uint64_t a1)
{
  return sub_24D1F26A8(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), (uint64_t)&unk_26FF7B648, (uint64_t)&unk_26985C180);
}

uint64_t sub_24D1FAFB8(uint64_t a1)
{
  return sub_24D1F26A8(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), (uint64_t)&unk_26FF7B5A8, (uint64_t)&unk_26985C160);
}

uint64_t sub_24D1FAFF0(uint64_t a1)
{
  return sub_24D1F26A8(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), (uint64_t)&unk_26FF7B508, (uint64_t)&unk_26985C140);
}

uint64_t sub_24D1FB028(uint64_t a1)
{
  return sub_24D1F32B0(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(unsigned char *)(v1 + 32));
}

unint64_t sub_24D1FB034()
{
  unint64_t result = qword_26B18A5B8;
  if (!qword_26B18A5B8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B18A5B8);
  }
  return result;
}

uint64_t sub_24D1FB074(uint64_t a1)
{
  return sub_24D1F5C78(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_24D1FB080(uint64_t a1)
{
  return sub_24D1F7678(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_24D1FB08C(uint64_t a1)
{
  return sub_24D1F8194(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_24D1FB098(uint64_t a1)
{
  return sub_24D1F8D04(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t type metadata accessor for HomeEnergyManager()
{
  return self;
}

uint64_t method lookup function for HomeEnergyManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HomeEnergyManager);
}

uint64_t dispatch thunk of HomeEnergyManager.dumpAllData()()
{
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(*(void *)v0 + 184) + **(int **)(*(void *)v0 + 184));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_24D1DCDF0;
  return v4();
}

uint64_t dispatch thunk of HomeEnergyManager.useMockData(filePath:disableMock:validityDate:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)v4 + 192)
                                                                   + **(int **)(*(void *)v4 + 192));
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v10;
  *uint64_t v10 = v5;
  v10[1] = sub_24D1D770C;
  return v12(a1, a2, a3, a4);
}

uint64_t dispatch thunk of HomeEnergyManager.testNotifications(forGridID:notificationContext:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)v3 + 200)
                                                          + **(int **)(*(void *)v3 + 200));
  unint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  void *v8 = v4;
  v8[1] = sub_24D1FFD98;
  return v10(a1, a2, a3);
}

uint64_t dispatch thunk of HomeEnergyManager.testDelegate(forGridIds:)(uint64_t a1)
{
  unint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 208) + **(int **)(*(void *)v1 + 208));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24D1DCDD0;
  return v6(a1);
}

uint64_t dispatch thunk of HomeEnergyManager.testSetMockURLSession()()
{
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(*(void *)v0 + 216) + **(int **)(*(void *)v0 + 216));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_24D1DCDD0;
  return v4();
}

uint64_t dispatch thunk of HomeEnergyManager.isNextCleanEnergyWindowNotificationEnabled(forGridID:homeID:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)v4 + 224)
                                                                   + **(int **)(*(void *)v4 + 224));
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v10;
  *uint64_t v10 = v5;
  v10[1] = sub_24D1D7A84;
  return v12(a1, a2, a3, a4);
}

uint64_t dispatch thunk of HomeEnergyManager.enableNextCleanEnergyWindowNotifications(forGridID:notificationContext:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)v3 + 232)
                                                          + **(int **)(*(void *)v3 + 232));
  unint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  void *v8 = v4;
  v8[1] = sub_24D1DCDF0;
  return v10(a1, a2, a3);
}

uint64_t dispatch thunk of HomeEnergyManager.disableNextCleanEnergyWindowNotifications(forGridID:homeID:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)v4 + 240)
                                                                   + **(int **)(*(void *)v4 + 240));
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v10;
  *uint64_t v10 = v5;
  v10[1] = sub_24D1DCDF0;
  return v12(a1, a2, a3, a4);
}

uint64_t dispatch thunk of HomeEnergyManager.disableNextCleanEnergyWindowNotifications(forGridID:)(uint64_t a1, uint64_t a2)
{
  unint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(*(void *)v2 + 248) + **(int **)(*(void *)v2 + 248));
  unint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *unint64_t v6 = v3;
  v6[1] = sub_24D1DCDF0;
  return v8(a1, a2);
}

uint64_t dispatch thunk of HomeEnergyManager.disableAllNextCleanEnergyWindowNotifications()()
{
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(*(void *)v0 + 256) + **(int **)(*(void *)v0 + 256));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_24D1DCDF0;
  return v4();
}

uint64_t dispatch thunk of HomeEnergyManager.enableEnergyForecastDataCollection(forGridID:)(uint64_t a1, uint64_t a2)
{
  unint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(*(void *)v2 + 264) + **(int **)(*(void *)v2 + 264));
  unint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *unint64_t v6 = v3;
  v6[1] = sub_24D1DCDF0;
  return v8(a1, a2);
}

uint64_t dispatch thunk of HomeEnergyManager.disableEnergyForecastDataCollection()()
{
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(*(void *)v0 + 272) + **(int **)(*(void *)v0 + 272));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_24D1DCDF0;
  return v4();
}

uint64_t dispatch thunk of HomeEnergyManager.disableEnergyForecastDataCollection(forGridID:)(uint64_t a1, uint64_t a2)
{
  unint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(*(void *)v2 + 280) + **(int **)(*(void *)v2 + 280));
  unint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *unint64_t v6 = v3;
  v6[1] = sub_24D1DCDF0;
  return v8(a1, a2);
}

uint64_t dispatch thunk of HomeEnergyManager.energyWindows(for:withCaching:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)v4 + 288)
                                                                   + **(int **)(*(void *)v4 + 288));
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v10;
  *uint64_t v10 = v5;
  v10[1] = sub_24D1DCDD0;
  return v12(a1, a2, a3, a4);
}

uint64_t dispatch thunk of HomeEnergyManager.gridIDLookup(_:)(double a1, double a2)
{
  uint64_t v10 = (uint64_t (*)(__n128, __n128))(*(void *)(*(void *)v2 + 296) + **(int **)(*(void *)v2 + 296));
  unint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *unint64_t v6 = v3;
  v6[1] = sub_24D1FC0DC;
  v7.n128_f64[0] = a1;
  v8.n128_f64[0] = a2;
  return v10(v7, v8);
}

uint64_t sub_24D1FC0DC(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *v2;
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 8);
  return v5(a1, a2);
}

uint64_t dispatch thunk of HomeEnergyManager.getCurrentLocation()()
{
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(*(void *)v0 + 304) + **(int **)(*(void *)v0 + 304));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_24D1DCDF0;
  return v4();
}

uint64_t dispatch thunk of HomeEnergyManager.requestAddToShareFor(homeUUID:siteID:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)v3 + 312)
                                                          + **(int **)(*(void *)v3 + 312));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  void *v8 = v4;
  v8[1] = sub_24D1DCDD0;
  return v10(a1, a2, a3);
}

uint64_t dispatch thunk of HomeEnergyManager.resetUtilityData()()
{
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(*(void *)v0 + 320) + **(int **)(*(void *)v0 + 320));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_24D1DCDD0;
  return v4();
}

uint64_t dispatch thunk of HomeEnergyManager.submitTestTask(taskID:delay:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)v3 + 328)
                                                          + **(int **)(*(void *)v3 + 328));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  void *v8 = v4;
  v8[1] = sub_24D1DCDD0;
  return v10(a1, a2, a3);
}

uint64_t dispatch thunk of HomeEnergyManager.setKVSDictionary(key:dict:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)v3 + 336)
                                                          + **(int **)(*(void *)v3 + 336));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  void *v8 = v4;
  v8[1] = sub_24D1DCDD0;
  return v10(a1, a2, a3);
}

uint64_t dispatch thunk of HomeEnergyManager.getKVSDictionary(key:)(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(*(void *)v2 + 344) + **(int **)(*(void *)v2 + 344));
  unint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *unint64_t v6 = v3;
  v6[1] = sub_24D1DCDF0;
  return v8(a1, a2);
}

uint64_t dispatch thunk of HomeEnergyManager.setHasDismissedConnectAccountBanner(_:for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)v3 + 352)
                                                          + **(int **)(*(void *)v3 + 352));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  void *v8 = v4;
  v8[1] = sub_24D1DCDD0;
  return v10(a1, a2, a3);
}

uint64_t dispatch thunk of HomeEnergyManager.hasDismissedConnectAccountBanner(for:)(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(*(void *)v2 + 360) + **(int **)(*(void *)v2 + 360));
  unint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *unint64_t v6 = v3;
  v6[1] = sub_24D1B8FC4;
  return v8(a1, a2);
}

uint64_t sub_24D1FCA98()
{
  return sub_24D1E94A0();
}

_OWORD *sub_24D1FCAA0(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  unint64_t v6 = (void *)(a5[6] + 16 * a1);
  *unint64_t v6 = a2;
  v6[1] = a3;
  unint64_t result = sub_24D1D97B4(a4, (_OWORD *)(a5[7] + 32 * a1));
  uint64_t v8 = a5[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a5[2] = v10;
  }
  return result;
}

uint64_t sub_24D1FCB0C(uint64_t a1)
{
  uint64_t v2 = sub_24D218A00();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24D219020();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  BOOL v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B18A2F8 != -1) {
    swift_once();
  }
  uint64_t v10 = __swift_project_value_buffer(v6, (uint64_t)qword_26B18A8F0);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v10, v6);
  swift_bridgeObjectRetain_n();
  uint64_t v11 = sub_24D219000();
  os_log_type_t v12 = sub_24D2192E0();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v31 = v6;
    uint64_t v13 = swift_slowAlloc();
    uint64_t v32 = v3;
    BOOL v14 = (uint8_t *)v13;
    uint64_t v29 = swift_slowAlloc();
    *(void *)&v35[0] = v29;
    *(_DWORD *)BOOL v14 = 136380675;
    uint64_t v28 = v14 + 4;
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_24D219280();
    uint64_t v30 = v7;
    char v16 = v5;
    uint64_t v17 = v2;
    uint64_t v18 = v15;
    unint64_t v20 = v19;
    swift_bridgeObjectRelease();
    uint64_t v21 = v18;
    uint64_t v2 = v17;
    uint64_t v5 = v16;
    uint64_t v33 = sub_24D1D0A78(v21, v20, (uint64_t *)v35);
    sub_24D219310();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24D1B6000, v11, v12, "[GridForecast] serverDidUpdateEnergyWindows called with %{private}s", v14, 0xCu);
    uint64_t v22 = v29;
    swift_arrayDestroy();
    MEMORY[0x253322AA0](v22, -1, -1);
    uint64_t v23 = v14;
    uint64_t v3 = v32;
    MEMORY[0x253322AA0](v23, -1, -1);

    (*(void (**)(char *, uint64_t))(v30 + 8))(v9, v31);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  sub_24D218C90();
  sub_24D2190E0();
  swift_bridgeObjectRelease();
  memset(v35, 0, sizeof(v35));
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A828);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24D21A2A0;
  uint64_t v33 = 7562345;
  unint64_t v34 = 0xE300000000000000;
  sub_24D2193A0();
  *(void *)(inited + 96) = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A810);
  *(void *)(inited + 72) = a1;
  swift_bridgeObjectRetain();
  sub_24D1C5004(inited);
  sub_24D2189E0();
  id v25 = objc_msgSend(self, sel_defaultCenter);
  uint64_t v26 = (void *)sub_24D2189C0();
  objc_msgSend(v25, sel_postNotification_, v26);

  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_24D1FCF9C()
{
  uint64_t v0 = sub_24D218A00();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_24D219020();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B18A2F8 != -1) {
    swift_once();
  }
  uint64_t v8 = __swift_project_value_buffer(v4, (uint64_t)qword_26B18A8F0);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  BOOL v9 = sub_24D219000();
  os_log_type_t v10 = sub_24D2192E0();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_24D1B6000, v9, v10, "[GridForecast] serverDidUpdateCoreLocation called", v11, 2u);
    MEMORY[0x253322AA0](v11, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_24D218CB0();
  sub_24D2190E0();
  swift_bridgeObjectRelease();
  memset(v15, 0, sizeof(v15));
  sub_24D2189E0();
  id v12 = objc_msgSend(self, sel_defaultCenter);
  uint64_t v13 = (void *)sub_24D2189C0();
  objc_msgSend(v12, sel_postNotification_, v13);

  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_24D1FD260()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A8D8);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, v6, v5);
}

uint64_t sub_24D1FD350(uint64_t a1)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B18A8D8) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v1 + 16);
  uint64_t v7 = *(void *)(v1 + 24);
  uint64_t v8 = v1 + v5;
  BOOL v9 = (uint64_t *)(v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v10 = *v9;
  uint64_t v11 = v9[1];
  id v12 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v12;
  *id v12 = v2;
  v12[1] = sub_24D1DCDD0;
  return sub_24D1F8EF8(a1, v6, v7, v8, v10, v11);
}

uint64_t sub_24D1FD480()
{
  return objectdestroy_116Tm(&qword_26B18A8D8);
}

uint64_t sub_24D1FD48C(uint64_t a1)
{
  return sub_24D1FD720(a1, &qword_26B18A8D8, (uint64_t (*)(uint64_t, uint64_t))sub_24D1F91C0);
}

uint64_t sub_24D1FD4AC()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A808);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, v6 + 8, v5);
}

uint64_t sub_24D1FD5AC(uint64_t a1)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B18A808) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v6 = (*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v7 = *(void *)(v1 + 16);
  uint64_t v8 = *(void *)(v1 + 24);
  uint64_t v9 = v1 + v5;
  uint64_t v10 = *(void *)(v1 + v6);
  uint64_t v11 = *(void *)(v1 + v6 + 8);
  uint64_t v12 = *(void *)(v1 + ((v6 + 23) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v13;
  *uint64_t v13 = v2;
  v13[1] = sub_24D1DCDD0;
  return sub_24D1F83A8(a1, v7, v8, v9, v10, v11, v12);
}

uint64_t sub_24D1FD6F4()
{
  return objectdestroy_116Tm(&qword_26B18A808);
}

uint64_t sub_24D1FD700(uint64_t a1)
{
  return sub_24D1FD720(a1, &qword_26B18A808, (uint64_t (*)(uint64_t, uint64_t))sub_24D1F891C);
}

uint64_t sub_24D1FD720(uint64_t a1, uint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  uint64_t v5 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(a2) - 8);
  uint64_t v6 = v3 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return a3(a1, v6);
}

uint64_t sub_24D1FD7A4()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A808);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, v6, v5);
}

uint64_t sub_24D1FD89C(uint64_t a1)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B18A808) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v6 = (*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v7 = *(void *)(v1 + 16);
  uint64_t v8 = *(void *)(v1 + 24);
  uint64_t v9 = v1 + v5;
  uint64_t v10 = *(void *)(v1 + v6);
  uint64_t v11 = *(void *)(v1 + v6 + 8);
  uint64_t v12 = *(void *)(v1 + ((v6 + 23) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v13;
  *uint64_t v13 = v2;
  v13[1] = sub_24D1DCDD0;
  return sub_24D1F7884(a1, v7, v8, v9, v10, v11, v12);
}

uint64_t sub_24D1FD9E4()
{
  return objectdestroy_116Tm(&qword_26B18A808);
}

uint64_t sub_24D1FD9F0(uint64_t a1)
{
  return sub_24D1FD720(a1, &qword_26B18A808, (uint64_t (*)(uint64_t, uint64_t))sub_24D1F7DA8);
}

uint64_t sub_24D1FDA10()
{
  return objectdestroy_104Tm(&qword_26B18A808);
}

uint64_t sub_24D1FDA1C(uint64_t a1)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B18A808) - 8);
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t v7 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_24D1DCDD0;
  return sub_24D1F6C8C(a1, v5, v6, v7);
}

uint64_t sub_24D1FDB0C()
{
  return objectdestroy_116Tm(&qword_26B18A808);
}

uint64_t sub_24D1FDB18(uint64_t a1)
{
  return sub_24D1FD720(a1, &qword_26B18A808, (uint64_t (*)(uint64_t, uint64_t))sub_24D1F7170);
}

uint64_t sub_24D1FDB38()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A808);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = sub_24D218B10();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v4 + v5 + v8) & ~v8;
  uint64_t v10 = v3 | v8 | 7;
  unint64_t v11 = ((*(void *)(v7 + 64) + v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, v6);
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, v11, v10);
}

uint64_t sub_24D1FDCAC(uint64_t a1)
{
  uint64_t v3 = v2;
  uint64_t v5 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B18A808) - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = *(void *)(v5 + 64);
  uint64_t v8 = *(void *)(sub_24D218B10() - 8);
  unint64_t v9 = (v6 + v7 + *(unsigned __int8 *)(v8 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = *(void *)(v1 + 16);
  uint64_t v11 = *(void *)(v1 + 24);
  uint64_t v12 = v1 + v6;
  uint64_t v13 = v1 + v9;
  uint64_t v14 = (uint64_t *)(v1 + ((*(void *)(v8 + 64) + v9 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v15 = *v14;
  uint64_t v16 = v14[1];
  uint64_t v17 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v17;
  *uint64_t v17 = v3;
  v17[1] = sub_24D1DCDD0;
  return sub_24D1F5F40(a1, v10, v11, v12, v13, v15, v16);
}

uint64_t sub_24D1FDE48()
{
  return objectdestroy_116Tm(&qword_26B18A808);
}

uint64_t sub_24D1FDE54(uint64_t a1)
{
  return sub_24D1FD720(a1, &qword_26B18A808, (uint64_t (*)(uint64_t, uint64_t))sub_24D1F6478);
}

uint64_t sub_24D1FDE74()
{
  return objectdestroy_104Tm(&qword_26B18A5A8);
}

uint64_t sub_24D1FDE80(uint64_t a1)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5A8) - 8);
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t v7 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_24D1DCDD0;
  return sub_24D1F5398(a1, v5, v6, v7);
}

uint64_t sub_24D1FDF70()
{
  return objectdestroy_116Tm(&qword_26B18A5A8);
}

uint64_t sub_24D1FDF7C(uint64_t a1)
{
  return sub_24D1FD720(a1, &qword_26B18A5A8, (uint64_t (*)(uint64_t, uint64_t))sub_24D1F571C);
}

uint64_t sub_24D1FDF9C()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A598);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = v3 | 7;
  uint64_t v6 = *(void *)(v2 + 64) + v4 + 1;
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v6, v5);
}

uint64_t sub_24D1FE078(uint64_t a1)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B18A598) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = v1[2];
  uint64_t v7 = v1[3];
  uint64_t v8 = v1[4];
  uint64_t v9 = v1[5];
  uint64_t v10 = (uint64_t)v1 + v5;
  char v11 = *((unsigned char *)v1 + v5 + *(void *)(v4 + 64));
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v12;
  *uint64_t v12 = v2;
  v12[1] = sub_24D1DCDD0;
  return sub_24D1F34A0(a1, v6, v7, v8, v9, v10, v11);
}

uint64_t sub_24D1FE1AC()
{
  return objectdestroy_116Tm(&qword_26B18A598);
}

uint64_t sub_24D1FE1B8(uint64_t a1)
{
  return sub_24D1FD720(a1, &qword_26B18A598, (uint64_t (*)(uint64_t, uint64_t))sub_24D1F4130);
}

unint64_t sub_24D1FE1D8()
{
  unint64_t result = qword_26B18A570;
  if (!qword_26B18A570)
  {
    sub_24D218BC0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B18A570);
  }
  return result;
}

uint64_t sub_24D1FE230(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_24D1DA1B0(a1, a2);
  }
  return a1;
}

uint64_t sub_24D1FE248(uint64_t a1)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26985C130) - 8);
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = v1[5];
  uint64_t v9 = (uint64_t)v1 + ((*(unsigned __int8 *)(v4 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = sub_24D1DCDD0;
  return sub_24D1F2880(a1, v5, v6, v7, v8, v9);
}

uint64_t sub_24D1FE34C()
{
  return objectdestroy_116Tm(&qword_26985C130);
}

uint64_t sub_24D1FE358(uint64_t a1)
{
  return sub_24D1FD720(a1, &qword_26985C130, (uint64_t (*)(uint64_t, uint64_t))sub_24D1F2D80);
}

uint64_t sub_24D1FE378()
{
  return objectdestroy_104Tm(&qword_26985C130);
}

uint64_t sub_24D1FE384(uint64_t a1)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26985C130) - 8);
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t v7 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_24D1DCDD0;
  return sub_24D1F20A4(a1, v5, v6, v7);
}

uint64_t sub_24D1FE474()
{
  return objectdestroy_116Tm(&qword_26985C130);
}

uint64_t sub_24D1FE480(uint64_t a1)
{
  return sub_24D1FD720(a1, &qword_26985C130, (uint64_t (*)(uint64_t, uint64_t))sub_24D1FFD80);
}

uint64_t sub_24D1FE4A4(uint64_t a1)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26985C130) - 8);
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = v1[5];
  uint64_t v9 = (uint64_t)v1 + ((*(unsigned __int8 *)(v4 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = sub_24D1DCDD0;
  return sub_24D1F15E8(a1, v5, v6, v7, v8, v9);
}

uint64_t sub_24D1FE5A8()
{
  return objectdestroy_116Tm(&qword_26985C130);
}

uint64_t sub_24D1FE5B4(uint64_t a1)
{
  return sub_24D1FD720(a1, &qword_26985C130, (uint64_t (*)(uint64_t, uint64_t))sub_24D1F1BC8);
}

uint64_t sub_24D1FE5D4()
{
  return objectdestroy_104Tm(&qword_26985C130);
}

uint64_t sub_24D1FE5E0(uint64_t a1)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26985C130) - 8);
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t v7 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_24D1DCDD0;
  return sub_24D1F0E10(a1, v5, v6, v7);
}

uint64_t sub_24D1FE6D0()
{
  return objectdestroy_116Tm(&qword_26985C130);
}

uint64_t sub_24D1FE6DC(uint64_t a1)
{
  return sub_24D1FD720(a1, &qword_26985C130, (uint64_t (*)(uint64_t, uint64_t))sub_24D1FFD7C);
}

uint64_t objectdestroy_137Tm()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985C130);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_24D1FE7D8(uint64_t a1)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26985C130) - 8);
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = v1[5];
  uint64_t v9 = (uint64_t)v1 + ((*(unsigned __int8 *)(v4 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = sub_24D1DCDD0;
  return sub_24D1F0668(a1, v5, v6, v7, v8, v9);
}

uint64_t sub_24D1FE8DC()
{
  return objectdestroy_116Tm(&qword_26985C130);
}

uint64_t sub_24D1FE8E8(uint64_t a1)
{
  return sub_24D1FD720(a1, &qword_26985C130, (uint64_t (*)(uint64_t, uint64_t))sub_24D1FFD78);
}

uint64_t sub_24D1FE908()
{
  return objectdestroy_177Tm(&qword_26985C130);
}

uint64_t sub_24D1FE914(uint64_t a1)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26985C130) - 8);
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = v1[5];
  uint64_t v9 = v1[6];
  uint64_t v10 = v1[7];
  uint64_t v11 = (uint64_t)v1 + ((*(unsigned __int8 *)(v4 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v12;
  *uint64_t v12 = v2;
  v12[1] = sub_24D1DCDD0;
  return sub_24D1EFBE4(a1, v5, v6, v7, v8, v9, v10, v11);
}

uint64_t sub_24D1FEA2C()
{
  return objectdestroy_116Tm(&qword_26985C130);
}

uint64_t sub_24D1FEA38(uint64_t a1)
{
  return sub_24D1FD720(a1, &qword_26985C130, (uint64_t (*)(uint64_t, uint64_t))sub_24D1F016C);
}

uint64_t sub_24D1FEA58()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985C130);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 65;
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, v6, v5);
}

uint64_t sub_24D1FEB68(uint64_t a1)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26985C130) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = v1[2];
  uint64_t v7 = v1[3];
  uint64_t v8 = v1[4];
  uint64_t v9 = v1[5];
  uint64_t v10 = (uint64_t)v1 + v5;
  uint64_t v11 = (uint64_t)v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v12;
  *uint64_t v12 = v2;
  v12[1] = sub_24D1DCDD0;
  return sub_24D1EEDA0(a1, v6, v7, v8, v9, v10, v11);
}

uint64_t sub_24D1FECA4(uint64_t a1)
{
  return a1;
}

uint64_t sub_24D1FECFC()
{
  return objectdestroy_116Tm(&qword_26985C130);
}

uint64_t sub_24D1FED08(uint64_t a1)
{
  return sub_24D1FD720(a1, &qword_26985C130, (uint64_t (*)(uint64_t, uint64_t))sub_24D1EF4A8);
}

uint64_t sub_24D1FED28()
{
  return objectdestroy_177Tm(&qword_26B18A5A0);
}

uint64_t objectdestroy_177Tm(uint64_t *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 64) & ~v4;
  uint64_t v6 = v5 + *(void *)(v3 + 64);
  uint64_t v7 = v4 | 7;
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1 + v5, v2);

  return MEMORY[0x270FA0238](v1, v6, v7);
}

uint64_t sub_24D1FEE0C(uint64_t a1)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5A0) - 8);
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = v1[5];
  uint64_t v9 = v1[6];
  uint64_t v10 = v1[7];
  uint64_t v11 = (uint64_t)v1 + ((*(unsigned __int8 *)(v4 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v12;
  *uint64_t v12 = v2;
  v12[1] = sub_24D1D770C;
  return sub_24D1EDE5C(a1, v5, v6, v7, v8, v9, v10, v11);
}

uint64_t sub_24D1FEF24()
{
  return objectdestroy_116Tm(&qword_26B18A5A0);
}

uint64_t sub_24D1FEF30(uint64_t a1)
{
  return sub_24D1FD720(a1, &qword_26B18A5A0, (uint64_t (*)(uint64_t, uint64_t))sub_24D1EE5E0);
}

uint64_t sub_24D1FEF50()
{
  return objectdestroy_104Tm(&qword_26B18A808);
}

uint64_t sub_24D1FEF5C(uint64_t a1)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B18A808) - 8);
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t v7 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_24D1DCDD0;
  return sub_24D1ED154(a1, v5, v6, v7);
}

uint64_t sub_24D1FF04C()
{
  return objectdestroy_116Tm(&qword_26B18A808);
}

uint64_t sub_24D1FF058(uint64_t a1)
{
  return sub_24D1FD720(a1, &qword_26B18A808, (uint64_t (*)(uint64_t, uint64_t))sub_24D1ED6E0);
}

uint64_t sub_24D1FF078()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A808);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, v6, v5);
}

uint64_t sub_24D1FF164(uint64_t a1)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B18A808) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v1 + 16);
  uint64_t v7 = *(void *)(v1 + 24);
  uint64_t v8 = v1 + v5;
  uint64_t v9 = *(void *)(v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = sub_24D1DCDD0;
  return sub_24D1EC66C(a1, v6, v7, v8, v9);
}

uint64_t sub_24D1FF28C()
{
  return objectdestroy_116Tm(&qword_26B18A808);
}

uint64_t sub_24D1FF298(uint64_t a1)
{
  return sub_24D1FD720(a1, &qword_26B18A808, (uint64_t (*)(uint64_t, uint64_t))sub_24D1ECC28);
}

uint64_t sub_24D1FF2B8()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985C1D8);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, v6 + 65, v5);
}

uint64_t sub_24D1FF3D4(uint64_t a1)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26985C1D8) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v6 = (*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v7 = *(void *)(v1 + 16);
  uint64_t v8 = *(void *)(v1 + 24);
  uint64_t v9 = v1 + v5;
  uint64_t v10 = *(void *)(v1 + v6);
  uint64_t v11 = *(void *)(v1 + v6 + 8);
  uint64_t v12 = v1 + ((v6 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v13;
  *uint64_t v13 = v2;
  v13[1] = sub_24D1DCDD0;
  return sub_24D1EB864(a1, v7, v8, v9, v10, v11, v12);
}

uint64_t sub_24D1FF51C()
{
  return objectdestroy_116Tm(&qword_26985C1D8);
}

uint64_t sub_24D1FF528(uint64_t a1)
{
  return sub_24D1FD720(a1, &qword_26985C1D8, (uint64_t (*)(uint64_t, uint64_t))sub_24D1EBEA4);
}

uint64_t sub_24D1FF548(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A610);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24D1FF5B0()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A808);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  unint64_t v5 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B18A610) - 8);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = (v5 + v7 + 17) & ~v7;
  uint64_t v9 = *(void *)(v6 + 64);
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease();
  uint64_t v10 = sub_24D218AC0();
  uint64_t v11 = *(void *)(v10 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v0 + v8, 1, v10)) {
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v0 + v8, v10);
  }

  return MEMORY[0x270FA0238](v0, v8 + v9, v3 | v7 | 7);
}

uint64_t sub_24D1FF778(uint64_t a1)
{
  uint64_t v3 = v2;
  uint64_t v5 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B18A808) - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v7 = (*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v8 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B18A610) - 8);
  unint64_t v9 = (v7 + *(unsigned __int8 *)(v8 + 80) + 17) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = *(void *)(v1 + 16);
  uint64_t v11 = *(void *)(v1 + 24);
  uint64_t v12 = v1 + v6;
  uint64_t v13 = v1 + v7;
  uint64_t v14 = *(void *)(v1 + v7);
  uint64_t v15 = *(void *)(v13 + 8);
  char v16 = *(unsigned char *)(v13 + 16);
  uint64_t v17 = v1 + v9;
  uint64_t v18 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v18;
  *uint64_t v18 = v3;
  v18[1] = sub_24D1DCDD0;
  return sub_24D1EA8D0(a1, v10, v11, v12, v14, v15, v16, v17);
}

uint64_t sub_24D1FF904()
{
  return objectdestroy_116Tm(&qword_26B18A808);
}

uint64_t sub_24D1FF910(uint64_t a1)
{
  return sub_24D1FD720(a1, &qword_26B18A808, (uint64_t (*)(uint64_t, uint64_t))sub_24D1EB048);
}

uint64_t sub_24D1FF930()
{
  return objectdestroy_104Tm(&qword_26985C200);
}

uint64_t objectdestroy_104Tm(uint64_t *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 32) & ~v4;
  uint64_t v6 = v5 + *(void *)(v3 + 64);
  uint64_t v7 = v4 | 7;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1 + v5, v2);

  return MEMORY[0x270FA0238](v1, v6, v7);
}

uint64_t sub_24D1FFA04(uint64_t a1)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26985C200) - 8);
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t v7 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_24D1DCDD0;
  return sub_24D1E9BB8(a1, v5, v6, v7);
}

uint64_t sub_24D1FFAF4()
{
  return objectdestroy_116Tm(&qword_26985C200);
}

uint64_t sub_24D1FFB00(uint64_t a1)
{
  return sub_24D1FD720(a1, &qword_26985C200, (uint64_t (*)(uint64_t, uint64_t))sub_24D1E9FE8);
}

uint64_t sub_24D1FFB20()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985C218);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v6, v5);
}

uint64_t sub_24D1FFBFC(uint64_t a1)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26985C218) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v6 = (*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v7 = *(void *)(v1 + 16);
  uint64_t v8 = *(void *)(v1 + 24);
  uint64_t v9 = v1 + v5;
  double v10 = *(double *)(v1 + v6);
  double v11 = *(double *)(v1 + v6 + 8);
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v12;
  *uint64_t v12 = v2;
  v12[1] = sub_24D1DCDD0;
  return sub_24D1F48A8(v10, v11, a1, v7, v8, v9);
}

uint64_t sub_24D1FFD34()
{
  return objectdestroy_116Tm(&qword_26985C218);
}

uint64_t sub_24D1FFD40(uint64_t a1)
{
  return sub_24D1FD720(a1, &qword_26985C218, (uint64_t (*)(uint64_t, uint64_t))sub_24D1F4F5C);
}

unint64_t HomeEnergyStatusCode.description.getter(uint64_t a1)
{
  unint64_t result = 0xD000000000000017;
  switch(a1)
  {
    case 0:
      unint64_t result = 0x73736563637553;
      break;
    case 1:
      return result;
    case 2:
      unint64_t result = 0xD000000000000013;
      break;
    case 3:
      unint64_t result = 0xD000000000000015;
      break;
    case 4:
      unint64_t result = 0xD000000000000014;
      break;
    case 5:
      unint64_t result = 0x6573616261746144;
      break;
    case 6:
      unint64_t result = 0x6961676120797254;
      break;
    case 7:
      unint64_t result = 0xD000000000000011;
      break;
    case 8:
      unint64_t result = 0x2065636976726553;
      break;
    case 9:
      unint64_t result = 0xD000000000000023;
      break;
    default:
      sub_24D219500();
      __break(1u);
      JUMPOUT(0x24D1FFF00);
  }
  return result;
}

unint64_t HomeEnergyStatusCode.init(rawValue:)(unint64_t a1)
{
  return sub_24D20005C(a1);
}

BOOL sub_24D1FFF48(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_24D1FFF5C()
{
  return sub_24D2195B0();
}

uint64_t sub_24D1FFFA4()
{
  return sub_24D2195A0();
}

uint64_t sub_24D1FFFD0()
{
  return sub_24D2195B0();
}

unint64_t sub_24D200014@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_24D20005C(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_24D200048(void *a1@<X8>)
{
  *a1 = *v1;
}

unint64_t sub_24D200054()
{
  return HomeEnergyStatusCode.description.getter(*v0);
}

unint64_t sub_24D20005C(unint64_t result)
{
  if (result > 9) {
    return 0;
  }
  return result;
}

unint64_t sub_24D200070()
{
  unint64_t result = qword_26985C230;
  if (!qword_26985C230)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26985C230);
  }
  return result;
}

ValueMetadata *type metadata accessor for HomeEnergyStatusCode()
{
  return &type metadata for HomeEnergyStatusCode;
}

uint64_t sub_24D2000D4()
{
  return swift_continuation_resume();
}

uint64_t sub_24D2000DC(uint64_t a1, void *a2)
{
  uint64_t v2 = (uint64_t)a2;
  uint64_t v3 = *(void *)(a1 + 32);
  if (a2)
  {
    id v4 = a2;
    uint64_t v2 = sub_24D218A20();
    unint64_t v6 = v5;
  }
  else
  {
    unint64_t v6 = 0xF000000000000000;
  }
  v8[0] = v2;
  v8[1] = v6;
  sub_24D1DC0B8((uint64_t)v8, *(void *)(*(void *)(v3 + 64) + 40), &qword_26B18A568);
  return swift_continuation_resume();
}

uint64_t HomeEnergyManager.completedOnboarding(id:)(uint64_t a1, uint64_t a2)
{
  v2[6] = a1;
  v2[7] = a2;
  uint64_t v3 = sub_24D219020();
  v2[8] = v3;
  v2[9] = *(void *)(v3 - 8);
  v2[10] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D20022C, 0, 0);
}

uint64_t sub_24D20022C()
{
  uint64_t v21 = v0;
  if (qword_26B18A2F8 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[9];
  uint64_t v1 = v0[10];
  uint64_t v3 = v0[8];
  uint64_t v4 = __swift_project_value_buffer(v3, (uint64_t)qword_26B18A8F0);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  uint64_t v5 = sub_24D219000();
  os_log_type_t v6 = sub_24D2192C0();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = v0[9];
  uint64_t v9 = v0[10];
  uint64_t v10 = v0[8];
  if (v7)
  {
    uint64_t v19 = v0[10];
    double v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v20 = v12;
    *(_DWORD *)double v11 = 136315138;
    v0[5] = sub_24D1D0A78(0xD000000000000018, 0x800000024D21C5F0, &v20);
    sub_24D219310();
    _os_log_impl(&dword_24D1B6000, v5, v6, "HomeEnergyManager %s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253322AA0](v12, -1, -1);
    MEMORY[0x253322AA0](v11, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v19, v10);
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v10);
  }
  uint64_t v14 = v0[6];
  uint64_t v13 = v0[7];
  uint64_t v15 = swift_task_alloc();
  v0[11] = v15;
  *(void *)(v15 + 16) = v14;
  *(void *)(v15 + 24) = v13;
  char v16 = (void *)swift_task_alloc();
  v0[12] = v16;
  *char v16 = v0;
  v16[1] = sub_24D2004F4;
  uint64_t v17 = MEMORY[0x263F8D4F8];
  return MEMORY[0x270FA2360](v0 + 14, 0, 0, 0xD000000000000018, 0x800000024D21C5F0, sub_24D2006EC, v15, v17);
}

uint64_t sub_24D2004F4()
{
  *(void *)(*(void *)v1 + 104) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_24D20067C;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_24D200610;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D200610()
{
  uint64_t v1 = *(unsigned __int8 *)(v0 + 112);
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_24D20067C()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1(0);
}

uint64_t sub_24D2006EC(uint64_t a1)
{
  return sub_24D205718(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), &qword_26985BDF8, (uint64_t)&unk_26FF7BC08, (uint64_t)&unk_26985C350);
}

uint64_t sub_24D20072C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[20] = a5;
  v6[21] = a6;
  v6[19] = a4;
  uint64_t v7 = sub_24D219020();
  v6[22] = v7;
  v6[23] = *(void *)(v7 - 8);
  v6[24] = swift_task_alloc();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BDF8);
  v6[25] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v6[26] = v9;
  v6[27] = *(void *)(v9 + 64);
  v6[28] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D200858, 0, 0);
}

uint64_t sub_24D200858()
{
  uint64_t v1 = v0[28];
  uint64_t v2 = v0[25];
  uint64_t v3 = v0[26];
  uint64_t v4 = v0[19];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[29] = sub_24D217288();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v6 + v5, v1, v2);
  uint64_t v7 = (void *)sub_24D217944((uint64_t)sub_24D209570, v6);
  v0[30] = v7;
  swift_release();
  uint64_t v8 = sub_24D2190E0();
  v0[31] = v8;
  v0[2] = v0;
  v0[7] = (char *)v0 + 261;
  v0[3] = sub_24D200A50;
  uint64_t v9 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_24D200DD4;
  v0[13] = &block_descriptor_86_0;
  v0[14] = v9;
  objc_msgSend(v7, sel_completedOnboardingWithId_completionHandler_, v8);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_24D200A50()
{
  return MEMORY[0x270FA2498](sub_24D200B30, 0, 0);
}

uint64_t sub_24D200B30()
{
  uint64_t v19 = v0;
  uint64_t v1 = *(void **)(v0 + 248);
  int v2 = *(unsigned __int8 *)(v0 + 261);
  swift_unknownObjectRelease();

  if (qword_26B18A2F8 != -1) {
    swift_once();
  }
  uint64_t v4 = *(void *)(v0 + 184);
  uint64_t v3 = *(void *)(v0 + 192);
  uint64_t v5 = *(void *)(v0 + 176);
  uint64_t v6 = __swift_project_value_buffer(v5, (uint64_t)qword_26B18A8F0);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v3, v6, v5);
  uint64_t v7 = sub_24D219000();
  os_log_type_t v8 = sub_24D2192C0();
  BOOL v9 = os_log_type_enabled(v7, v8);
  uint64_t v11 = *(void *)(v0 + 184);
  uint64_t v10 = *(void *)(v0 + 192);
  uint64_t v12 = *(void *)(v0 + 176);
  if (v9)
  {
    uint64_t v17 = *(void *)(v0 + 192);
    uint64_t v13 = swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v18 = v14;
    *(_DWORD *)uint64_t v13 = 136315394;
    *(void *)(v0 + 144) = sub_24D1D0A78(0xD000000000000018, 0x800000024D21C5F0, &v18);
    sub_24D219310();
    *(_WORD *)(v13 + 12) = 1024;
    *(_DWORD *)(v0 + 256) = v2;
    sub_24D219310();
    _os_log_impl(&dword_24D1B6000, v7, v8, "%s Completed onboarding:  %{BOOL}d", (uint8_t *)v13, 0x12u);
    swift_arrayDestroy();
    MEMORY[0x253322AA0](v14, -1, -1);
    MEMORY[0x253322AA0](v13, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v17, v12);
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
  }
  objc_msgSend(*(id *)(*(void *)(v0 + 232) + 16), sel_invalidate);
  *(unsigned char *)(v0 + 260) = v2;
  sub_24D219220();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v15 = *(uint64_t (**)(void))(v0 + 8);
  return v15();
}

uint64_t sub_24D200DD4(uint64_t a1, char a2)
{
  **(unsigned char **)(*(void *)(*(void *)(a1 + 32) + 64) + 40) = a2;
  return swift_continuation_resume();
}

uint64_t HomeEnergyManager.updateCompletedOnboarding(id:value:)(uint64_t a1, uint64_t a2, char a3)
{
  *(unsigned char *)(v3 + 112) = a3;
  *(void *)(v3 + 48) = a1;
  *(void *)(v3 + 56) = a2;
  uint64_t v4 = sub_24D219020();
  *(void *)(v3 + 64) = v4;
  *(void *)(v3 + 72) = *(void *)(v4 - 8);
  *(void *)(v3 + 80) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D200EBC, 0, 0);
}

uint64_t sub_24D200EBC()
{
  uint64_t v22 = v0;
  if (qword_26B18A2F8 != -1) {
    swift_once();
  }
  uint64_t v2 = *(void *)(v0 + 72);
  uint64_t v1 = *(void *)(v0 + 80);
  uint64_t v3 = *(void *)(v0 + 64);
  uint64_t v4 = __swift_project_value_buffer(v3, (uint64_t)qword_26B18A8F0);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  uint64_t v5 = sub_24D219000();
  os_log_type_t v6 = sub_24D2192C0();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = *(void *)(v0 + 72);
  uint64_t v9 = *(void *)(v0 + 80);
  uint64_t v10 = *(void *)(v0 + 64);
  if (v7)
  {
    uint64_t v20 = *(void *)(v0 + 80);
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v21 = v12;
    *(_DWORD *)uint64_t v11 = 136315138;
    *(void *)(v0 + 40) = sub_24D1D0A78(0xD000000000000024, 0x800000024D21C610, &v21);
    sub_24D219310();
    _os_log_impl(&dword_24D1B6000, v5, v6, "HomeEnergyManager %s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253322AA0](v12, -1, -1);
    MEMORY[0x253322AA0](v11, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v20, v10);
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v10);
  }
  char v13 = *(unsigned char *)(v0 + 112);
  uint64_t v15 = *(void *)(v0 + 48);
  uint64_t v14 = *(void *)(v0 + 56);
  uint64_t v16 = swift_task_alloc();
  *(void *)(v0 + 88) = v16;
  *(void *)(v16 + 16) = v15;
  *(void *)(v16 + 24) = v14;
  *(unsigned char *)(v16 + 32) = v13;
  uint64_t v17 = (void *)swift_task_alloc();
  *(void *)(v0 + 96) = v17;
  *uint64_t v17 = v0;
  v17[1] = sub_24D201184;
  uint64_t v18 = MEMORY[0x263F8EE60] + 8;
  return MEMORY[0x270FA2360](v17, 0, 0, 0xD000000000000024, 0x800000024D21C610, sub_24D2081E0, v16, v18);
}

uint64_t sub_24D201184()
{
  *(void *)(*(void *)v1 + 104) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_24D201304;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_24D2012A0;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D2012A0()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24D201304()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24D201370(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A808);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5B0);
  MEMORY[0x270FA5388](v11 - 8);
  char v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_24D219240();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 1, 1, v14);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v8);
  unint64_t v15 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = 0;
  *(void *)(v16 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v16 + v15, (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
  unint64_t v17 = v16 + ((v10 + v15 + 7) & 0xFFFFFFFFFFFFFFF8);
  *(void *)unint64_t v17 = a2;
  *(void *)(v17 + 8) = a3;
  *(unsigned char *)(v17 + 16) = a4;
  swift_bridgeObjectRetain();
  sub_24D1BA610((uint64_t)v13, (uint64_t)&unk_26985C340, v16);
  return swift_release();
}

uint64_t sub_24D20156C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  *(unsigned char *)(v7 + 256) = a7;
  *(void *)(v7 + 160) = a5;
  *(void *)(v7 + 168) = a6;
  *(void *)(v7 + 152) = a4;
  uint64_t v8 = sub_24D219020();
  *(void *)(v7 + 176) = v8;
  *(void *)(v7 + 184) = *(void *)(v8 - 8);
  *(void *)(v7 + 192) = swift_task_alloc();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A808);
  *(void *)(v7 + 200) = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  *(void *)(v7 + 208) = v10;
  *(void *)(v7 + 216) = *(void *)(v10 + 64);
  *(void *)(v7 + 224) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D20169C, 0, 0);
}

uint64_t sub_24D20169C()
{
  uint64_t v1 = *(void *)(v0 + 224);
  uint64_t v3 = *(void *)(v0 + 200);
  uint64_t v2 = *(void *)(v0 + 208);
  unsigned int v11 = *(unsigned __int8 *)(v0 + 256);
  uint64_t v4 = *(void *)(v0 + 152);
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  *(void *)(v0 + 232) = sub_24D217288();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  unint64_t v5 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v6 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v2 + 32))(v6 + v5, v1, v3);
  uint64_t v7 = (void *)sub_24D217944((uint64_t)sub_24D209314, v6);
  *(void *)(v0 + 240) = v7;
  swift_release();
  uint64_t v8 = sub_24D2190E0();
  *(void *)(v0 + 248) = v8;
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 24) = sub_24D201890;
  uint64_t v9 = swift_continuation_init();
  *(void *)(v0 + 80) = MEMORY[0x263EF8330];
  *(void *)(v0 + 88) = 0x40000000;
  *(void *)(v0 + 96) = sub_24D2000D4;
  *(void *)(v0 + 104) = &block_descriptor_78;
  *(void *)(v0 + 112) = v9;
  objc_msgSend(v7, sel_updateCompletedOnboardingWithId_value_completionHandler_, v8, v11);
  return MEMORY[0x270FA23F0](v0 + 16);
}

uint64_t sub_24D201890()
{
  return MEMORY[0x270FA2498](sub_24D201970, 0, 0);
}

uint64_t sub_24D201970()
{
  unint64_t v17 = v0;
  uint64_t v1 = (void *)v0[31];
  swift_unknownObjectRelease();

  if (qword_26B18A2F8 != -1) {
    swift_once();
  }
  uint64_t v3 = v0[23];
  uint64_t v2 = v0[24];
  uint64_t v4 = v0[22];
  uint64_t v5 = __swift_project_value_buffer(v4, (uint64_t)qword_26B18A8F0);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  uint64_t v6 = sub_24D219000();
  os_log_type_t v7 = sub_24D2192C0();
  BOOL v8 = os_log_type_enabled(v6, v7);
  uint64_t v10 = v0[23];
  uint64_t v9 = v0[24];
  uint64_t v11 = v0[22];
  if (v8)
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    uint64_t v16 = v13;
    *(_DWORD *)uint64_t v12 = 136315138;
    v0[18] = sub_24D1D0A78(0xD000000000000024, 0x800000024D21C610, &v16);
    sub_24D219310();
    _os_log_impl(&dword_24D1B6000, v6, v7, "%s Completed onboarding", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253322AA0](v13, -1, -1);
    MEMORY[0x253322AA0](v12, -1, -1);
  }

  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
  objc_msgSend(*(id *)(v0[29] + 16), sel_invalidate);
  sub_24D219220();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v14 = (uint64_t (*)(void))v0[1];
  return v14();
}

uint64_t HomeEnergyManager.utilitiesNearLocation(location:)(double a1, double a2)
{
  *(double *)(v2 + 56) = a1;
  *(double *)(v2 + 64) = a2;
  uint64_t v3 = sub_24D219020();
  *(void *)(v2 + 72) = v3;
  *(void *)(v2 + 80) = *(void *)(v3 - 8);
  *(void *)(v2 + 88) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D201C8C, 0, 0);
}

uint64_t sub_24D201C8C()
{
  uint64_t v21 = v0;
  if (qword_26B18A2F8 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[10];
  uint64_t v1 = v0[11];
  uint64_t v3 = v0[9];
  uint64_t v4 = __swift_project_value_buffer(v3, (uint64_t)qword_26B18A8F0);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  uint64_t v5 = sub_24D219000();
  os_log_type_t v6 = sub_24D2192C0();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = v0[10];
  uint64_t v9 = v0[11];
  uint64_t v10 = v0[9];
  if (v7)
  {
    uint64_t v19 = v0[11];
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v20 = v12;
    *(_DWORD *)uint64_t v11 = 136315138;
    v0[6] = sub_24D1D0A78(0xD000000000000020, 0x800000024D21C640, &v20);
    sub_24D219310();
    _os_log_impl(&dword_24D1B6000, v5, v6, "HomeEnergyManager %s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253322AA0](v12, -1, -1);
    MEMORY[0x253322AA0](v11, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v19, v10);
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v10);
  }
  uint64_t v14 = v0[7];
  uint64_t v13 = v0[8];
  uint64_t v15 = swift_task_alloc();
  v0[12] = v15;
  *(void *)(v15 + 16) = v14;
  *(void *)(v15 + 24) = v13;
  uint64_t v16 = (void *)swift_task_alloc();
  v0[13] = v16;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A608);
  *uint64_t v16 = v0;
  v16[1] = sub_24D201F64;
  return MEMORY[0x270FA2360](v0 + 5, 0, 0, 0xD000000000000020, 0x800000024D21C640, sub_24D2081EC, v15, v17);
}

uint64_t sub_24D201F64()
{
  *(void *)(*(void *)v1 + 112) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_24D2095A0;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_24D20959C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D202080(uint64_t a1, double a2, double a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985C318);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5B0);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_24D219240();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  unint64_t v13 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = 0;
  *(void *)(v14 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v14 + v13, (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  uint64_t v15 = (double *)(v14 + ((v8 + v13 + 7) & 0xFFFFFFFFFFFFFFF8));
  *uint64_t v15 = a2;
  v15[1] = a3;
  sub_24D1BA610((uint64_t)v11, (uint64_t)&unk_26985C328, v14);
  return swift_release();
}

uint64_t sub_24D20226C(double a1, double a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(double *)(v6 + 224) = a1;
  *(double *)(v6 + 232) = a2;
  *(void *)(v6 + 216) = a6;
  uint64_t v7 = sub_24D219020();
  *(void *)(v6 + 240) = v7;
  *(void *)(v6 + 248) = *(void *)(v7 - 8);
  *(void *)(v6 + 256) = swift_task_alloc();
  *(void *)(v6 + 264) = swift_task_alloc();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985C318);
  *(void *)(v6 + 272) = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  *(void *)(v6 + 280) = v9;
  *(void *)(v6 + 288) = *(void *)(v9 + 64);
  *(void *)(v6 + 296) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D2023A8, 0, 0);
}

uint64_t sub_24D2023A8()
{
  uint64_t v1 = *((void *)v0 + 37);
  uint64_t v2 = *((void *)v0 + 34);
  uint64_t v3 = *((void *)v0 + 35);
  double v5 = v0[28];
  double v4 = v0[29];
  uint64_t v6 = *((void *)v0 + 27);
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  *((void *)v0 + 38) = sub_24D217288();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v6, v2);
  unint64_t v7 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v8 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v8 + v7, v1, v2);
  uint64_t v9 = (void *)sub_24D217944((uint64_t)sub_24D2090AC, v8);
  *((void *)v0 + 39) = v9;
  swift_release();
  *((void *)v0 + 2) = v0;
  *((void *)v0 + 7) = v0 + 23;
  *((void *)v0 + 3) = sub_24D202594;
  uint64_t v10 = swift_continuation_init();
  *((void *)v0 + 10) = MEMORY[0x263EF8330];
  *((void *)v0 + 11) = 0x40000000;
  *((void *)v0 + 12) = sub_24D202B80;
  *((void *)v0 + 13) = &block_descriptor_70;
  *((void *)v0 + 14) = v10;
  objc_msgSend(v9, sel_utilitiesNearLocationWithLocation_completionHandler_, v0 + 10, v5, v4);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_24D202594()
{
  return MEMORY[0x270FA2498](sub_24D202674, 0, 0);
}

uint64_t sub_24D202674()
{
  char v39 = v0;
  uint64_t v1 = v0[23];
  uint64_t v2 = v0[38];
  swift_unknownObjectRelease();
  objc_msgSend(*(id *)(v2 + 16), sel_invalidate);
  if (v1)
  {
    if (qword_26B18A2F8 != -1) {
      swift_once();
    }
    uint64_t v3 = v0[31];
    uint64_t v4 = v0[32];
    uint64_t v5 = v0[30];
    uint64_t v6 = __swift_project_value_buffer(v5, (uint64_t)qword_26B18A8F0);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v4, v6, v5);
    swift_bridgeObjectRetain_n();
    unint64_t v7 = sub_24D219000();
    os_log_type_t v8 = sub_24D2192C0();
    BOOL v9 = os_log_type_enabled(v7, v8);
    uint64_t v11 = v0[31];
    uint64_t v10 = v0[32];
    uint64_t v12 = v0[30];
    if (v9)
    {
      uint64_t v37 = v0[32];
      uint64_t v13 = swift_slowAlloc();
      uint64_t v38 = swift_slowAlloc();
      uint64_t v35 = v38;
      *(_DWORD *)uint64_t v13 = 136315394;
      uint64_t v36 = v12;
      v0[25] = sub_24D1D0A78(0xD000000000000020, 0x800000024D21C640, &v38);
      sub_24D219310();
      *(_WORD *)(v13 + 12) = 2080;
      uint64_t v14 = swift_bridgeObjectRetain();
      uint64_t v15 = MEMORY[0x253322140](v14, MEMORY[0x263F8D310]);
      unint64_t v17 = v16;
      swift_bridgeObjectRelease();
      v0[26] = sub_24D1D0A78(v15, v17, &v38);
      sub_24D219310();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24D1B6000, v7, v8, "%s result: %s", (uint8_t *)v13, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x253322AA0](v35, -1, -1);
      MEMORY[0x253322AA0](v13, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v37, v36);
    }
    else
    {
      swift_bridgeObjectRelease_n();

      (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
    }
    v0[24] = v1;
    sub_24D219220();
  }
  else
  {
    if (qword_26B18A2F8 != -1) {
      swift_once();
    }
    uint64_t v18 = v0[33];
    uint64_t v20 = v0[30];
    uint64_t v19 = v0[31];
    uint64_t v21 = __swift_project_value_buffer(v20, (uint64_t)qword_26B18A8F0);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v18, v21, v20);
    uint64_t v22 = sub_24D219000();
    os_log_type_t v23 = sub_24D2192D0();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc();
      id v25 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v24 = 138412290;
      sub_24D1D5A68();
      swift_allocError();
      *uint64_t v26 = 16;
      uint64_t v27 = _swift_stdlib_bridgeErrorToNSError();
      v0[22] = v27;
      sub_24D219310();
      *id v25 = v27;
      _os_log_impl(&dword_24D1B6000, v22, v23, "%@", v24, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(qword_26985BB28);
      swift_arrayDestroy();
      MEMORY[0x253322AA0](v25, -1, -1);
      MEMORY[0x253322AA0](v24, -1, -1);
    }
    uint64_t v28 = v0[33];
    uint64_t v29 = v0[30];
    uint64_t v30 = v0[31];

    (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v28, v29);
    sub_24D1D5A68();
    uint64_t v31 = swift_allocError();
    unsigned char *v32 = 16;
    v0[21] = v31;
    sub_24D219210();
  }
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v33 = (uint64_t (*)(void))v0[1];
  return v33();
}

uint64_t sub_24D202B80(uint64_t a1, uint64_t a2)
{
  return sub_24D203E8C(a1, a2, MEMORY[0x263F8D310], &qword_26985C330);
}

uint64_t HomeEnergyManager.getAllUtilities(countryCode:)(uint64_t a1, uint64_t a2)
{
  v2[7] = a1;
  v2[8] = a2;
  uint64_t v3 = sub_24D219020();
  v2[9] = v3;
  v2[10] = *(void *)(v3 - 8);
  v2[11] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D202C54, 0, 0);
}

uint64_t sub_24D202C54()
{
  uint64_t v21 = v0;
  if (qword_26B18A2F8 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[10];
  uint64_t v1 = v0[11];
  uint64_t v3 = v0[9];
  uint64_t v4 = __swift_project_value_buffer(v3, (uint64_t)qword_26B18A8F0);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  uint64_t v5 = sub_24D219000();
  os_log_type_t v6 = sub_24D2192C0();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = v0[10];
  uint64_t v9 = v0[11];
  uint64_t v10 = v0[9];
  if (v7)
  {
    uint64_t v19 = v0[11];
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v20 = v12;
    *(_DWORD *)uint64_t v11 = 136315138;
    v0[6] = sub_24D1D0A78(0xD00000000000001DLL, 0x800000024D21C670, &v20);
    sub_24D219310();
    _os_log_impl(&dword_24D1B6000, v5, v6, "HomeEnergyManager %s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253322AA0](v12, -1, -1);
    MEMORY[0x253322AA0](v11, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v19, v10);
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v10);
  }
  uint64_t v14 = v0[7];
  uint64_t v13 = v0[8];
  uint64_t v15 = swift_task_alloc();
  v0[12] = v15;
  *(void *)(v15 + 16) = v14;
  *(void *)(v15 + 24) = v13;
  unint64_t v16 = (void *)swift_task_alloc();
  v0[13] = v16;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985C258);
  *unint64_t v16 = v0;
  v16[1] = sub_24D202F24;
  return MEMORY[0x270FA2360](v0 + 5, 0, 0, 0xD00000000000001DLL, 0x800000024D21C670, sub_24D2081F4, v15, v17);
}

uint64_t sub_24D202F24()
{
  *(void *)(*(void *)v1 + 112) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_24D2030AC;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_24D203040;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D203040()
{
  uint64_t v1 = *(void *)(v0 + 40);
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_24D2030AC()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24D203118(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985C2F0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5B0);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_24D219240();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  unint64_t v13 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = 0;
  *(void *)(v14 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v14 + v13, (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  uint64_t v15 = (void *)(v14 + ((v8 + v13 + 7) & 0xFFFFFFFFFFFFFFF8));
  *uint64_t v15 = a2;
  v15[1] = a3;
  swift_bridgeObjectRetain();
  sub_24D1BA610((uint64_t)v11, (uint64_t)&unk_26985C300, v14);
  return swift_release();
}

uint64_t sub_24D20330C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[30] = a5;
  v6[31] = a6;
  v6[29] = a4;
  uint64_t v7 = sub_24D219020();
  v6[32] = v7;
  v6[33] = *(void *)(v7 - 8);
  v6[34] = swift_task_alloc();
  v6[35] = swift_task_alloc();
  v6[36] = swift_task_alloc();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985C2F0);
  v6[37] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v6[38] = v9;
  v6[39] = *(void *)(v9 + 64);
  v6[40] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D203454, 0, 0);
}

uint64_t sub_24D203454()
{
  uint64_t v1 = v0[40];
  uint64_t v2 = v0[37];
  uint64_t v3 = v0[38];
  uint64_t v4 = v0[31];
  uint64_t v5 = v0[29];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[41] = sub_24D217288();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v5, v2);
  unint64_t v6 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v7 + v6, v1, v2);
  uint64_t v8 = (void *)sub_24D217944((uint64_t)sub_24D208CB4, v7);
  v0[42] = v8;
  swift_release();
  if (v4) {
    uint64_t v9 = sub_24D2190E0();
  }
  else {
    uint64_t v9 = 0;
  }
  v0[43] = v9;
  v0[2] = v0;
  v0[7] = v0 + 23;
  v0[3] = sub_24D203644;
  uint64_t v10 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_24D203E78;
  v0[13] = &block_descriptor_62;
  v0[14] = v10;
  objc_msgSend(v8, sel_getAllUtilitiesWithCountryCode_completionHandler_, v9, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_24D203644()
{
  return MEMORY[0x270FA2498](sub_24D203724, 0, 0);
}

uint64_t sub_24D203724()
{
  uint64_t v41 = v0;
  uint64_t v1 = v0[23];
  uint64_t v2 = (void *)v0[43];
  uint64_t v3 = v0[41];
  swift_unknownObjectRelease();

  objc_msgSend(*(id *)(v3 + 16), sel_invalidate);
  if (v1)
  {
    if (qword_26B18A2F8 != -1) {
      swift_once();
    }
    uint64_t v4 = v0[35];
    uint64_t v5 = v0[32];
    uint64_t v6 = v0[33];
    uint64_t v7 = __swift_project_value_buffer(v5, (uint64_t)qword_26B18A8F0);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v4, v7, v5);
    swift_bridgeObjectRetain_n();
    uint64_t v8 = sub_24D219000();
    os_log_type_t v9 = sub_24D2192C0();
    BOOL v10 = os_log_type_enabled(v8, v9);
    uint64_t v11 = v0[35];
    uint64_t v13 = v0[32];
    uint64_t v12 = v0[33];
    if (v10)
    {
      uint64_t v14 = swift_slowAlloc();
      uint64_t v37 = swift_slowAlloc();
      v40[0] = v37;
      *(_DWORD *)uint64_t v14 = 136315394;
      v0[27] = sub_24D1D0A78(0xD00000000000001DLL, 0x800000024D21C670, v40);
      sub_24D219310();
      *(_WORD *)(v14 + 12) = 2080;
      uint64_t v15 = swift_bridgeObjectRetain();
      uint64_t v16 = MEMORY[0x253322140](v15, MEMORY[0x263F06F78]);
      uint64_t v36 = v11;
      unint64_t v18 = v17;
      swift_bridgeObjectRelease();
      v0[28] = sub_24D1D0A78(v16, v18, v40);
      sub_24D219310();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24D1B6000, v8, v9, "%s result: %s", (uint8_t *)v14, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x253322AA0](v37, -1, -1);
      MEMORY[0x253322AA0](v14, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v36, v13);
    }
    else
    {
      swift_bridgeObjectRelease_n();

      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
    }
    sub_24D2189B0();
    swift_allocObject();
    sub_24D2189A0();
    uint64_t v31 = sub_24D208CE0(v1);
    swift_bridgeObjectRelease();
    v0[26] = v31;
    sub_24D219220();
    swift_release();
  }
  else
  {
    if (qword_26B18A2F8 != -1) {
      swift_once();
    }
    uint64_t v19 = v0[36];
    uint64_t v21 = v0[32];
    uint64_t v20 = v0[33];
    uint64_t v22 = __swift_project_value_buffer(v21, (uint64_t)qword_26B18A8F0);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16))(v19, v22, v21);
    os_log_type_t v23 = sub_24D219000();
    os_log_type_t v24 = sub_24D2192D0();
    BOOL v25 = os_log_type_enabled(v23, v24);
    uint64_t v26 = v0[36];
    uint64_t v27 = v0[32];
    uint64_t v28 = v0[33];
    if (v25)
    {
      uint64_t v39 = v0[32];
      uint64_t v38 = v0[36];
      uint64_t v29 = (uint8_t *)swift_slowAlloc();
      uint64_t v30 = swift_slowAlloc();
      v40[0] = v30;
      *(_DWORD *)uint64_t v29 = 136315138;
      v0[22] = sub_24D1D0A78(0xD00000000000001DLL, 0x800000024D21C670, v40);
      sub_24D219310();
      _os_log_impl(&dword_24D1B6000, v23, v24, "%s Failed to fetch utilities", v29, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x253322AA0](v30, -1, -1);
      MEMORY[0x253322AA0](v29, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v38, v39);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v26, v27);
    }
    sub_24D1D5A68();
    uint64_t v32 = swift_allocError();
    *uint64_t v33 = 14;
    v0[21] = v32;
    sub_24D219210();
  }
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v34 = (uint64_t (*)(void))v0[1];
  return v34();
}

uint64_t sub_24D203E78(uint64_t a1, uint64_t a2)
{
  return sub_24D203E8C(a1, a2, MEMORY[0x263F06F78], &qword_26985C310);
}

uint64_t sub_24D203E8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v5 = *(void *)(a1 + 32);
  if (a2) {
    uint64_t v6 = sub_24D219190();
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v8 = v6;
  sub_24D1DC0B8((uint64_t)&v8, *(void *)(*(void *)(v5 + 64) + 40), a4);
  return swift_continuation_resume();
}

uint64_t HomeEnergyManager.utilityInformation(utilityID:)(uint64_t a1, uint64_t a2)
{
  v2[8] = a1;
  v2[9] = a2;
  uint64_t v3 = sub_24D219020();
  v2[10] = v3;
  v2[11] = *(void *)(v3 - 8);
  v2[12] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D203FC0, 0, 0);
}

uint64_t sub_24D203FC0()
{
  os_log_type_t v23 = v0;
  if (qword_26B18A2F8 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[11];
  uint64_t v1 = v0[12];
  uint64_t v3 = v0[10];
  uint64_t v4 = __swift_project_value_buffer(v3, (uint64_t)qword_26B18A8F0);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  swift_bridgeObjectRetain_n();
  uint64_t v5 = sub_24D219000();
  os_log_type_t v6 = sub_24D2192C0();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v9 = v0[11];
  uint64_t v8 = v0[12];
  unint64_t v11 = v0[9];
  uint64_t v10 = v0[10];
  if (v7)
  {
    uint64_t v21 = v0[12];
    uint64_t v19 = v0[8];
    uint64_t v12 = swift_slowAlloc();
    uint64_t v20 = swift_slowAlloc();
    uint64_t v22 = v20;
    *(_DWORD *)uint64_t v12 = 136315394;
    v0[6] = sub_24D1D0A78(0xD00000000000001ELL, 0x800000024D21C690, &v22);
    sub_24D219310();
    *(_WORD *)(v12 + 12) = 2080;
    swift_bridgeObjectRetain();
    v0[7] = sub_24D1D0A78(v19, v11, &v22);
    sub_24D219310();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24D1B6000, v5, v6, "HomeEnergyManager %s: utility ID %s", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x253322AA0](v20, -1, -1);
    MEMORY[0x253322AA0](v12, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v21, v10);
  }
  else
  {
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  }
  uint64_t v14 = v0[8];
  uint64_t v13 = v0[9];
  uint64_t v15 = swift_task_alloc();
  v0[13] = v15;
  *(void *)(v15 + 16) = v14;
  *(void *)(v15 + 24) = v13;
  uint64_t v16 = (void *)swift_task_alloc();
  v0[14] = v16;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985C268);
  *uint64_t v16 = v0;
  v16[1] = sub_24D204300;
  return MEMORY[0x270FA2360](v0 + 5, 0, 0, 0xD00000000000001ELL, 0x800000024D21C690, sub_24D2081FC, v15, v17);
}

uint64_t sub_24D204300()
{
  *(void *)(*(void *)v1 + 120) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_24D204488;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_24D20441C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D20441C()
{
  uint64_t v1 = *(void *)(v0 + 40);
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_24D204488()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24D2044F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[32] = a5;
  v6[33] = a6;
  v6[31] = a4;
  uint64_t v7 = sub_24D219020();
  v6[34] = v7;
  v6[35] = *(void *)(v7 - 8);
  v6[36] = swift_task_alloc();
  v6[37] = swift_task_alloc();
  v6[38] = swift_task_alloc();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985C2D0);
  v6[39] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v6[40] = v9;
  v6[41] = *(void *)(v9 + 64);
  v6[42] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D20463C, 0, 0);
}

uint64_t sub_24D20463C()
{
  uint64_t v1 = v0[42];
  uint64_t v2 = v0[39];
  uint64_t v3 = v0[40];
  uint64_t v4 = v0[31];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[43] = sub_24D217288();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v6 + v5, v1, v2);
  uint64_t v7 = (void *)sub_24D217944((uint64_t)sub_24D208B2C, v6);
  v0[44] = v7;
  swift_release();
  uint64_t v8 = sub_24D2190E0();
  v0[45] = v8;
  v0[2] = v0;
  v0[7] = v0 + 21;
  v0[3] = sub_24D204834;
  uint64_t v9 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_24D2000DC;
  v0[13] = &block_descriptor_54;
  v0[14] = v9;
  objc_msgSend(v7, sel_utilityInformationWithUtilityID_completionHandler_, v8);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_24D204834()
{
  return MEMORY[0x270FA2498](sub_24D204914, 0, 0);
}

uint64_t sub_24D204914()
{
  uint64_t v42 = v0;
  uint64_t v1 = (void *)v0[45];
  uint64_t v2 = v0[43];
  uint64_t v4 = v0[21];
  unint64_t v3 = v0[22];
  swift_unknownObjectRelease();

  objc_msgSend(*(id *)(v2 + 16), sel_invalidate);
  if (v3 >> 60 == 15)
  {
    if (qword_26B18A2F8 != -1) {
      swift_once();
    }
    uint64_t v5 = v0[38];
    uint64_t v7 = v0[34];
    uint64_t v6 = v0[35];
    uint64_t v8 = __swift_project_value_buffer(v7, (uint64_t)qword_26B18A8F0);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v5, v8, v7);
    uint64_t v9 = sub_24D219000();
    os_log_type_t v10 = sub_24D2192D0();
    BOOL v11 = os_log_type_enabled(v9, v10);
    uint64_t v12 = v0[38];
    uint64_t v14 = v0[34];
    uint64_t v13 = v0[35];
    if (v11)
    {
      uint64_t v40 = v0[38];
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      v41[0] = v16;
      *(_DWORD *)uint64_t v15 = 136315138;
      v0[23] = sub_24D1D0A78(0xD00000000000001ELL, 0x800000024D21C690, v41);
      sub_24D219310();
      _os_log_impl(&dword_24D1B6000, v9, v10, "%s Failed to fetch utilities", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x253322AA0](v16, -1, -1);
      MEMORY[0x253322AA0](v15, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v40, v14);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
    }
    sub_24D1D5A68();
    uint64_t v32 = swift_allocError();
    *uint64_t v33 = 15;
    v0[24] = v32;
    sub_24D219210();
  }
  else
  {
    sub_24D1DA208(v4, v3);
    if (qword_26B18A2F8 != -1) {
      swift_once();
    }
    uint64_t v17 = v0[37];
    uint64_t v18 = v0[34];
    uint64_t v19 = v0[35];
    uint64_t v20 = __swift_project_value_buffer(v18, (uint64_t)qword_26B18A8F0);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v17, v20, v18);
    sub_24D208B58(v4, v3);
    sub_24D1DA208(v4, v3);
    uint64_t v21 = sub_24D219000();
    os_log_type_t v22 = sub_24D2192C0();
    BOOL v23 = os_log_type_enabled(v21, v22);
    uint64_t v24 = v0[37];
    uint64_t v26 = v0[34];
    uint64_t v25 = v0[35];
    if (v23)
    {
      uint64_t v39 = v0[34];
      os_log_type_t type = v22;
      uint64_t v27 = swift_slowAlloc();
      uint64_t v38 = swift_slowAlloc();
      v41[0] = v38;
      *(_DWORD *)uint64_t v27 = 136315394;
      v0[29] = sub_24D1D0A78(0xD00000000000001ELL, 0x800000024D21C690, v41);
      sub_24D219310();
      *(_WORD *)(v27 + 12) = 2080;
      sub_24D1DA208(v4, v3);
      uint64_t v28 = sub_24D218A10();
      unint64_t v30 = v29;
      sub_24D1FE230(v4, v3);
      v0[30] = sub_24D1D0A78(v28, v30, v41);
      sub_24D219310();
      swift_bridgeObjectRelease();
      sub_24D1FE230(v4, v3);
      sub_24D1FE230(v4, v3);
      _os_log_impl(&dword_24D1B6000, v21, type, "%s result: %s", (uint8_t *)v27, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x253322AA0](v38, -1, -1);
      MEMORY[0x253322AA0](v27, -1, -1);

      uint64_t v31 = (*(uint64_t (**)(uint64_t, uint64_t))(v25 + 8))(v24, v39);
    }
    else
    {
      sub_24D1FE230(v4, v3);
      sub_24D1FE230(v4, v3);

      uint64_t v31 = (*(uint64_t (**)(uint64_t, uint64_t))(v25 + 8))(v24, v26);
    }
    unint64_t v34 = (void *)MEMORY[0x2533225B0](v31);
    sub_24D2189B0();
    swift_allocObject();
    sub_24D2189A0();
    sub_24D218FC0();
    sub_24D208E44(&qword_26985C2E8, MEMORY[0x263F49BF8]);
    sub_24D218990();
    swift_release();
    v0[28] = v0[25];
    sub_24D219220();
    sub_24D1FE230(v4, v3);
    sub_24D1FE230(v4, v3);
  }
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v35 = (uint64_t (*)(void))v0[1];
  return v35();
}

uint64_t HomeEnergyManager.isTAFEnabled(utilityID:)(uint64_t a1, uint64_t a2)
{
  v2[7] = a1;
  v2[8] = a2;
  uint64_t v3 = sub_24D219020();
  v2[9] = v3;
  v2[10] = *(void *)(v3 - 8);
  v2[11] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D2051E8, 0, 0);
}

uint64_t sub_24D2051E8()
{
  BOOL v23 = v0;
  if (qword_26B18A2F8 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[10];
  uint64_t v1 = v0[11];
  uint64_t v3 = v0[9];
  uint64_t v4 = __swift_project_value_buffer(v3, (uint64_t)qword_26B18A8F0);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  swift_bridgeObjectRetain_n();
  uint64_t v5 = sub_24D219000();
  os_log_type_t v6 = sub_24D2192C0();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v9 = v0[10];
  uint64_t v8 = v0[11];
  unint64_t v11 = v0[8];
  uint64_t v10 = v0[9];
  if (v7)
  {
    uint64_t v21 = v0[11];
    uint64_t v19 = v0[7];
    uint64_t v12 = swift_slowAlloc();
    uint64_t v20 = swift_slowAlloc();
    uint64_t v22 = v20;
    *(_DWORD *)uint64_t v12 = 136315394;
    v0[5] = sub_24D1D0A78(0xD000000000000018, 0x800000024D21C6B0, &v22);
    sub_24D219310();
    *(_WORD *)(v12 + 12) = 2080;
    swift_bridgeObjectRetain();
    v0[6] = sub_24D1D0A78(v19, v11, &v22);
    sub_24D219310();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24D1B6000, v5, v6, "HomeEnergyManager %s: utility ID %s", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x253322AA0](v20, -1, -1);
    MEMORY[0x253322AA0](v12, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v21, v10);
  }
  else
  {
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  }
  uint64_t v14 = v0[7];
  uint64_t v13 = v0[8];
  uint64_t v15 = swift_task_alloc();
  v0[12] = v15;
  *(void *)(v15 + 16) = v14;
  *(void *)(v15 + 24) = v13;
  uint64_t v16 = (void *)swift_task_alloc();
  v0[13] = v16;
  *uint64_t v16 = v0;
  v16[1] = sub_24D205520;
  uint64_t v17 = MEMORY[0x263F8D4F8];
  return MEMORY[0x270FA2360](v0 + 15, 0, 0, 0xD000000000000018, 0x800000024D21C6B0, sub_24D20823C, v15, v17);
}

uint64_t sub_24D205520()
{
  *(void *)(*(void *)v1 + 112) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_24D2056A8;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_24D20563C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D20563C()
{
  uint64_t v1 = *(unsigned __int8 *)(v0 + 120);
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_24D2056A8()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1(0);
}

uint64_t sub_24D205718(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(a4);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5B0);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_24D219240();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v15, 1, 1, v16);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))((char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v10);
  unint64_t v17 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = 0;
  *(void *)(v18 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v18 + v17, (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v10);
  uint64_t v19 = (void *)(v18 + ((v12 + v17 + 7) & 0xFFFFFFFFFFFFFFF8));
  *uint64_t v19 = a2;
  v19[1] = a3;
  swift_bridgeObjectRetain();
  sub_24D1BA610((uint64_t)v15, a6, v18);
  return swift_release();
}

uint64_t sub_24D2058FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[21] = a5;
  v6[22] = a6;
  v6[20] = a4;
  uint64_t v7 = sub_24D219020();
  v6[23] = v7;
  v6[24] = *(void *)(v7 - 8);
  v6[25] = swift_task_alloc();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BDF8);
  v6[26] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v6[27] = v9;
  v6[28] = *(void *)(v9 + 64);
  v6[29] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D205A28, 0, 0);
}

uint64_t sub_24D205A28()
{
  uint64_t v1 = v0[29];
  uint64_t v2 = v0[26];
  uint64_t v3 = v0[27];
  uint64_t v4 = v0[20];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[30] = sub_24D217288();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v6 + v5, v1, v2);
  uint64_t v7 = (void *)sub_24D217944((uint64_t)sub_24D2089B8, v6);
  v0[31] = v7;
  swift_release();
  uint64_t v8 = sub_24D2190E0();
  v0[32] = v8;
  v0[2] = v0;
  v0[7] = (char *)v0 + 277;
  v0[3] = sub_24D205C20;
  uint64_t v9 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_24D2160E8;
  v0[13] = &block_descriptor_46;
  v0[14] = v9;
  objc_msgSend(v7, sel_isTAFEnabledWithUtilityID_completionHandler_, v8);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_24D205C20()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 264) = v1;
  if (v1) {
    uint64_t v2 = sub_24D205FD4;
  }
  else {
    uint64_t v2 = sub_24D205D30;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D205D30()
{
  uint64_t v20 = v0;
  uint64_t v1 = *(void **)(v0 + 256);
  uint64_t v2 = *(void *)(v0 + 240);
  int v3 = *(unsigned __int8 *)(v0 + 277);
  swift_unknownObjectRelease();

  objc_msgSend(*(id *)(v2 + 16), sel_invalidate);
  if (qword_26B18A2F8 != -1) {
    swift_once();
  }
  uint64_t v5 = *(void *)(v0 + 192);
  uint64_t v4 = *(void *)(v0 + 200);
  uint64_t v6 = *(void *)(v0 + 184);
  uint64_t v7 = __swift_project_value_buffer(v6, (uint64_t)qword_26B18A8F0);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v4, v7, v6);
  uint64_t v8 = sub_24D219000();
  os_log_type_t v9 = sub_24D2192C0();
  BOOL v10 = os_log_type_enabled(v8, v9);
  uint64_t v12 = *(void *)(v0 + 192);
  uint64_t v11 = *(void *)(v0 + 200);
  uint64_t v13 = *(void *)(v0 + 184);
  if (v10)
  {
    uint64_t v18 = *(void *)(v0 + 200);
    uint64_t v14 = swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    uint64_t v19 = v15;
    *(_DWORD *)uint64_t v14 = 136315394;
    *(void *)(v0 + 152) = sub_24D1D0A78(0xD000000000000018, 0x800000024D21C6B0, &v19);
    sub_24D219310();
    *(_WORD *)(v14 + 12) = 1024;
    *(_DWORD *)(v0 + 272) = v3;
    sub_24D219310();
    _os_log_impl(&dword_24D1B6000, v8, v9, "%s result: %{BOOL}d", (uint8_t *)v14, 0x12u);
    swift_arrayDestroy();
    MEMORY[0x253322AA0](v15, -1, -1);
    MEMORY[0x253322AA0](v14, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v18, v13);
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  }
  *(unsigned char *)(v0 + 276) = v3;
  sub_24D219220();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v16 = *(uint64_t (**)(void))(v0 + 8);
  return v16();
}

uint64_t sub_24D205FD4()
{
  uint64_t v2 = (void *)v0[32];
  uint64_t v1 = v0[33];
  swift_willThrow();
  swift_release();
  swift_unknownObjectRelease();

  v0[18] = v1;
  sub_24D219210();
  swift_task_dealloc();
  swift_task_dealloc();
  int v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t HomeEnergyManager.useUtilityMockData(enableMock:)(char a1)
{
  *(unsigned char *)(v1 + 96) = a1;
  uint64_t v2 = sub_24D219020();
  *(void *)(v1 + 48) = v2;
  *(void *)(v1 + 56) = *(void *)(v2 - 8);
  *(void *)(v1 + 64) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D206154, 0, 0);
}

uint64_t sub_24D206154()
{
  uint64_t v22 = v0;
  if (qword_26B18A2F8 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 48);
  uint64_t v3 = *(void *)(v0 + 56);
  uint64_t v2 = *(void *)(v0 + 64);
  uint64_t v4 = __swift_project_value_buffer(v1, (uint64_t)qword_26B18A8F0);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v4, v1);
  uint64_t v5 = sub_24D219000();
  os_log_type_t v6 = sub_24D2192C0();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v9 = *(void *)(v0 + 56);
  uint64_t v8 = *(void *)(v0 + 64);
  uint64_t v10 = *(void *)(v0 + 48);
  if (v7)
  {
    uint64_t v20 = *(void *)(v0 + 64);
    uint64_t v19 = *(void *)(v0 + 48);
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v21 = v12;
    *(_DWORD *)uint64_t v11 = 136315138;
    *(void *)(v0 + 40) = sub_24D1D0A78(0xD00000000000001FLL, 0x800000024D21C6D0, &v21);
    sub_24D219310();
    _os_log_impl(&dword_24D1B6000, v5, v6, "HomeEnergyManager %s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253322AA0](v12, -1, -1);
    MEMORY[0x253322AA0](v11, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v20, v19);
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  }
  if (sub_24D218C50())
  {
    char v13 = *(unsigned char *)(v0 + 96);
    uint64_t v14 = swift_task_alloc();
    *(void *)(v0 + 72) = v14;
    *(unsigned char *)(v14 + 16) = v13;
    uint64_t v15 = (void *)swift_task_alloc();
    *(void *)(v0 + 80) = v15;
    *uint64_t v15 = v0;
    v15[1] = sub_24D206468;
    uint64_t v16 = MEMORY[0x263F8EE60] + 8;
    return MEMORY[0x270FA2360](v15, 0, 0, 0xD00000000000001FLL, 0x800000024D21C6D0, sub_24D20827C, v14, v16);
  }
  else
  {
    swift_task_dealloc();
    unint64_t v17 = *(uint64_t (**)(void))(v0 + 8);
    return v17();
  }
}

uint64_t sub_24D206468()
{
  *(void *)(*(void *)v1 + 88) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_24D206584;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_24D1C3548;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D206584()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24D2065F0(uint64_t a1, char a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A808);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5B0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_24D219240();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  unint64_t v11 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = 0;
  *(void *)(v12 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v12 + v11, (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  *(unsigned char *)(v12 + v11 + v6) = a2;
  sub_24D1BA610((uint64_t)v9, (uint64_t)&unk_26985C2B8, v12);
  return swift_release();
}

uint64_t sub_24D2067C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(unsigned char *)(v5 + 232) = a5;
  *(void *)(v5 + 152) = a4;
  uint64_t v6 = sub_24D219020();
  *(void *)(v5 + 160) = v6;
  *(void *)(v5 + 168) = *(void *)(v6 - 8);
  *(void *)(v5 + 176) = swift_task_alloc();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A808);
  *(void *)(v5 + 184) = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  *(void *)(v5 + 192) = v8;
  *(void *)(v5 + 200) = *(void *)(v8 + 64);
  *(void *)(v5 + 208) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D2068F0, 0, 0);
}

uint64_t sub_24D2068F0()
{
  uint64_t v1 = *(void *)(v0 + 208);
  uint64_t v2 = *(void *)(v0 + 184);
  uint64_t v3 = *(void *)(v0 + 192);
  unsigned int v10 = *(unsigned __int8 *)(v0 + 232);
  uint64_t v4 = *(void *)(v0 + 152);
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  *(void *)(v0 + 216) = sub_24D217288();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v6 + v5, v1, v2);
  uint64_t v7 = (void *)sub_24D217944((uint64_t)sub_24D208844, v6);
  *(void *)(v0 + 224) = v7;
  swift_release();
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 24) = sub_24D206AC4;
  uint64_t v8 = swift_continuation_init();
  *(void *)(v0 + 80) = MEMORY[0x263EF8330];
  *(void *)(v0 + 88) = 0x40000000;
  *(void *)(v0 + 96) = sub_24D2000D4;
  *(void *)(v0 + 104) = &block_descriptor_38;
  *(void *)(v0 + 112) = v8;
  objc_msgSend(v7, sel_useUtilityMockDataWithEnableMock_completionHandler_, v10, v0 + 80);
  return MEMORY[0x270FA23F0](v0 + 16);
}

uint64_t sub_24D206AC4()
{
  return MEMORY[0x270FA2498](sub_24D206BA4, 0, 0);
}

uint64_t sub_24D206BA4()
{
  uint64_t v21 = v0;
  uint64_t v1 = *(void *)(v0 + 216);
  swift_unknownObjectRelease();
  objc_msgSend(*(id *)(v1 + 16), sel_invalidate);
  if (qword_26B18A2F8 != -1) {
    swift_once();
  }
  uint64_t v3 = *(void *)(v0 + 168);
  uint64_t v2 = *(void *)(v0 + 176);
  uint64_t v4 = *(void *)(v0 + 160);
  uint64_t v5 = __swift_project_value_buffer(v4, (uint64_t)qword_26B18A8F0);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  uint64_t v6 = sub_24D219000();
  os_log_type_t v7 = sub_24D2192E0();
  BOOL v8 = os_log_type_enabled(v6, v7);
  uint64_t v9 = *(void *)(v0 + 168);
  uint64_t v10 = *(void *)(v0 + 176);
  uint64_t v11 = *(void *)(v0 + 160);
  if (v8)
  {
    int v12 = *(unsigned __int8 *)(v0 + 232);
    uint64_t v19 = *(void *)(v0 + 176);
    char v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    *(_DWORD *)char v13 = 136315138;
    uint64_t v20 = v14;
    if (v12) {
      uint64_t v15 = 0x64656C6261736964;
    }
    else {
      uint64_t v15 = 0x64656C62616E65;
    }
    if (v12) {
      unint64_t v16 = 0xE800000000000000;
    }
    else {
      unint64_t v16 = 0xE700000000000000;
    }
    *(void *)(v0 + 144) = sub_24D1D0A78(v15, v16, &v20);
    sub_24D219310();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24D1B6000, v6, v7, "Utility Mock Data usage: %s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253322AA0](v14, -1, -1);
    MEMORY[0x253322AA0](v13, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v19, v11);
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v10, v11);
  }
  sub_24D219220();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v17 = *(uint64_t (**)(void))(v0 + 8);
  return v17();
}

uint64_t HomeEnergyManager.clearCache()()
{
  uint64_t v1 = sub_24D219020();
  v0[6] = v1;
  v0[7] = *(void *)(v1 - 8);
  v0[8] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D206EF4, 0, 0);
}

uint64_t sub_24D206EF4()
{
  uint64_t v20 = v0;
  if (qword_26B18A2F8 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[6];
  uint64_t v3 = v0[7];
  uint64_t v2 = v0[8];
  uint64_t v4 = __swift_project_value_buffer(v1, (uint64_t)qword_26B18A8F0);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v4, v1);
  uint64_t v5 = sub_24D219000();
  os_log_type_t v6 = sub_24D2192C0();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v9 = v0[7];
  uint64_t v8 = v0[8];
  uint64_t v10 = v0[6];
  if (v7)
  {
    uint64_t v18 = v0[8];
    uint64_t v17 = v0[6];
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v19 = v12;
    *(_DWORD *)uint64_t v11 = 136315138;
    v0[5] = sub_24D1D0A78(0x6361437261656C63, 0xEC00000029286568, &v19);
    sub_24D219310();
    _os_log_impl(&dword_24D1B6000, v5, v6, "HomeEnergyManager %s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253322AA0](v12, -1, -1);
    MEMORY[0x253322AA0](v11, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v18, v17);
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  }
  if (sub_24D218C50())
  {
    char v13 = (void *)swift_task_alloc();
    v0[9] = v13;
    *char v13 = v0;
    v13[1] = sub_24D2071F8;
    uint64_t v14 = MEMORY[0x263F8EE60] + 8;
    return MEMORY[0x270FA2360](v13, 0, 0, 0x6361437261656C63, 0xEC00000029286568, sub_24D207370, 0, v14);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v15 = (uint64_t (*)(void))v0[1];
    return v15();
  }
}

uint64_t sub_24D2071F8()
{
  *(void *)(*(void *)v1 + 80) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24D20730C;
  }
  else {
    uint64_t v2 = sub_24D1C3548;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D20730C()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24D207370(uint64_t a1)
{
  return sub_24D207A68(a1, (uint64_t)&unk_26FF7B9D8, (uint64_t)&unk_26985C2A8);
}

uint64_t sub_24D207390(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[18] = a4;
  uint64_t v5 = sub_24D219020();
  v4[19] = v5;
  v4[20] = *(void *)(v5 - 8);
  v4[21] = swift_task_alloc();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A808);
  v4[22] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v4[23] = v7;
  v4[24] = *(void *)(v7 + 64);
  v4[25] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D2074B8, 0, 0);
}

uint64_t sub_24D2074B8()
{
  uint64_t v1 = v0[25];
  uint64_t v2 = v0[22];
  uint64_t v3 = v0[23];
  uint64_t v4 = v0[18];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[26] = sub_24D217288();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v6 + v5, v1, v2);
  uint64_t v7 = (void *)sub_24D217944((uint64_t)sub_24D208580, v6);
  v0[27] = v7;
  swift_release();
  v0[2] = v0;
  v0[3] = sub_24D207680;
  uint64_t v8 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_24D2000D4;
  v0[13] = &block_descriptor_30;
  v0[14] = v8;
  objc_msgSend(v7, sel_clearCacheWithCompletionHandler_, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_24D207680()
{
  return MEMORY[0x270FA2498](sub_24D207760, 0, 0);
}

uint64_t sub_24D207760()
{
  uint64_t v1 = v0[26];
  swift_unknownObjectRelease();
  objc_msgSend(*(id *)(v1 + 16), sel_invalidate);
  if (qword_26B18A2F8 != -1) {
    swift_once();
  }
  uint64_t v3 = v0[20];
  uint64_t v2 = v0[21];
  uint64_t v4 = v0[19];
  uint64_t v5 = __swift_project_value_buffer(v4, (uint64_t)qword_26B18A8F0);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  uint64_t v6 = sub_24D219000();
  os_log_type_t v7 = sub_24D2192E0();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_24D1B6000, v6, v7, "Clearing UtilityServices cache)", v8, 2u);
    MEMORY[0x253322AA0](v8, -1, -1);
  }
  uint64_t v9 = v0[21];
  uint64_t v10 = v0[19];
  uint64_t v11 = v0[20];

  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
  sub_24D219220();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v12 = (uint64_t (*)(void))v0[1];
  return v12();
}

uint64_t HomeEnergyManager.triggerAMIFetchFromDropbox()()
{
  return MEMORY[0x270FA2498](sub_24D207938, 0, 0);
}

uint64_t sub_24D207938()
{
  if (sub_24D218C50())
  {
    uint64_t v1 = (void *)swift_task_alloc();
    *(void *)(v0 + 16) = v1;
    *uint64_t v1 = v0;
    uint64_t v2 = MEMORY[0x263F8EE60];
    v1[1] = sub_24D1F6998;
    return MEMORY[0x270FA2360](v1, 0, 0, 0xD00000000000001CLL, 0x800000024D21C6F0, sub_24D207A48, 0, v2 + 8);
  }
  else
  {
    uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
    return v3();
  }
}

uint64_t sub_24D207A48(uint64_t a1)
{
  return sub_24D207A68(a1, (uint64_t)&unk_26FF7B988, (uint64_t)&unk_26985C298);
}

uint64_t sub_24D207A68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A808);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5B0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_24D219240();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v5);
  unint64_t v12 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = 0;
  *(void *)(v13 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v13 + v12, (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v5);
  sub_24D1BA610((uint64_t)v10, a3, v13);
  return swift_release();
}

uint64_t sub_24D207C24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[16] = a4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A808);
  v4[17] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v4[18] = v6;
  v4[19] = *(void *)(v6 + 64);
  v4[20] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D207CF0, 0, 0);
}

uint64_t sub_24D207CF0()
{
  uint64_t v1 = v0[20];
  uint64_t v2 = v0[17];
  uint64_t v3 = v0[18];
  uint64_t v4 = v0[16];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[21] = sub_24D217288();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v6 + v5, v1, v2);
  uint64_t v7 = (void *)sub_24D217944((uint64_t)sub_24D208384, v6);
  v0[22] = v7;
  swift_release();
  v0[2] = v0;
  v0[3] = sub_24D1F6F20;
  uint64_t v8 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_24D1C39CC;
  v0[13] = &block_descriptor_0;
  v0[14] = v8;
  objc_msgSend(v7, sel_triggerAMIFetchFromDropboxWithCompletionHandler_, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_24D207EB8(void *a1, uint64_t a2, uint64_t a3, unint64_t a4, const char *a5, uint64_t *a6)
{
  unint64_t v33 = a4;
  unint64_t v34 = a5;
  uint64_t v10 = sub_24D219020();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B18A2F8 != -1) {
    swift_once();
  }
  uint64_t v14 = __swift_project_value_buffer(v10, (uint64_t)qword_26B18A8F0);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v14, v10);
  id v15 = a1;
  id v16 = a1;
  uint64_t v17 = sub_24D219000();
  os_log_type_t v18 = sub_24D2192D0();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = swift_slowAlloc();
    uint64_t v31 = a6;
    uint64_t v20 = v19;
    unint64_t v29 = (void *)swift_slowAlloc();
    uint64_t v30 = swift_slowAlloc();
    uint64_t v36 = v30;
    *(_DWORD *)uint64_t v20 = 136315394;
    uint64_t v32 = a2;
    uint64_t v35 = sub_24D1D0A78(a3, v33, &v36);
    sub_24D219310();
    *(_WORD *)(v20 + 12) = 2112;
    id v21 = a1;
    uint64_t v22 = _swift_stdlib_bridgeErrorToNSError();
    uint64_t v35 = v22;
    sub_24D219310();
    uint64_t v23 = v29;
    *unint64_t v29 = v22;

    _os_log_impl(&dword_24D1B6000, v17, v18, v34, (uint8_t *)v20, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(qword_26985BB28);
    swift_arrayDestroy();
    MEMORY[0x253322AA0](v23, -1, -1);
    uint64_t v24 = v30;
    swift_arrayDestroy();
    MEMORY[0x253322AA0](v24, -1, -1);
    uint64_t v25 = v20;
    a6 = v31;
    MEMORY[0x253322AA0](v25, -1, -1);
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  uint64_t v36 = (uint64_t)a1;
  id v26 = a1;
  __swift_instantiateConcreteTypeFromMangledName(a6);
  return sub_24D219210();
}

uint64_t sub_24D2081E0(uint64_t a1)
{
  return sub_24D201370(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(unsigned char *)(v1 + 32));
}

uint64_t sub_24D2081EC(uint64_t a1)
{
  return sub_24D202080(a1, *(double *)(v1 + 16), *(double *)(v1 + 24));
}

uint64_t sub_24D2081F4(uint64_t a1)
{
  return sub_24D203118(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_24D2081FC(uint64_t a1)
{
  return sub_24D205718(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), &qword_26985C2D0, (uint64_t)&unk_26FF7BAC8, (uint64_t)&unk_26985C2E0);
}

uint64_t sub_24D20823C(uint64_t a1)
{
  return sub_24D205718(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), &qword_26985BDF8, (uint64_t)&unk_26FF7BA78, (uint64_t)&unk_26985C2C8);
}

uint64_t sub_24D20827C(uint64_t a1)
{
  return sub_24D2065F0(a1, *(unsigned char *)(v1 + 16));
}

uint64_t sub_24D208288(uint64_t a1)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B18A808) - 8);
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t v7 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_24D1DCDD0;
  return sub_24D207C24(a1, v5, v6, v7);
}

uint64_t sub_24D208378()
{
  return objectdestroy_116Tm(&qword_26B18A808);
}

uint64_t sub_24D208384(void *a1)
{
  return sub_24D2085B0(a1, &qword_26B18A808, 0xD00000000000001CLL, 0x800000024D21C6F0, "%s Failed to open xpc connection. %@");
}

uint64_t objectdestroyTm_0()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A808);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_24D208484(uint64_t a1)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B18A808) - 8);
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t v7 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_24D1D770C;
  return sub_24D207390(a1, v5, v6, v7);
}

uint64_t sub_24D208574()
{
  return objectdestroy_116Tm(&qword_26B18A808);
}

uint64_t sub_24D208580(void *a1)
{
  return sub_24D2085B0(a1, &qword_26B18A808, 0x6361437261656C63, 0xEC00000029286568, "%s Failed to open xpc connection. %@");
}

uint64_t sub_24D2085B0(void *a1, uint64_t *a2, uint64_t a3, unint64_t a4, const char *a5)
{
  uint64_t v11 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(a2) - 8);
  return sub_24D207EB8(a1, v5 + ((*(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80)), a3, a4, a5, a2);
}

uint64_t sub_24D208644()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A808);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  uint64_t v6 = *(void *)(v2 + 64) + v4 + 1;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v6, v5);
}

uint64_t sub_24D208718(uint64_t a1)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B18A808) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v1 + 16);
  uint64_t v7 = *(void *)(v1 + 24);
  uint64_t v8 = v1 + v5;
  char v9 = *(unsigned char *)(v1 + v5 + *(void *)(v4 + 64));
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = sub_24D1DCDD0;
  return sub_24D2067C4(a1, v6, v7, v8, v9);
}

uint64_t sub_24D208838()
{
  return objectdestroy_116Tm(&qword_26B18A808);
}

uint64_t sub_24D208844(void *a1)
{
  return sub_24D2085B0(a1, &qword_26B18A808, 0xD00000000000001FLL, 0x800000024D21C6D0, "%s Failed to open xpc connection. %@");
}

uint64_t sub_24D208870()
{
  return objectdestroy_40Tm(&qword_26985BDF8);
}

uint64_t sub_24D20887C(uint64_t a1)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26985BDF8) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v1 + 16);
  uint64_t v7 = *(void *)(v1 + 24);
  uint64_t v8 = v1 + v5;
  char v9 = (uint64_t *)(v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v10 = *v9;
  uint64_t v11 = v9[1];
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v12;
  *uint64_t v12 = v2;
  v12[1] = sub_24D1DCDD0;
  return sub_24D2058FC(a1, v6, v7, v8, v10, v11);
}

uint64_t sub_24D2089AC()
{
  return objectdestroy_116Tm(&qword_26985BDF8);
}

uint64_t sub_24D2089B8(void *a1)
{
  return sub_24D2085B0(a1, &qword_26985BDF8, 0xD000000000000018, 0x800000024D21C6B0, "%s Failed to establish daemon connection. %@");
}

uint64_t sub_24D2089E4()
{
  return objectdestroy_40Tm(&qword_26985C2D0);
}

uint64_t sub_24D2089F0(uint64_t a1)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26985C2D0) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v1 + 16);
  uint64_t v7 = *(void *)(v1 + 24);
  uint64_t v8 = v1 + v5;
  char v9 = (uint64_t *)(v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v10 = *v9;
  uint64_t v11 = v9[1];
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v12;
  *uint64_t v12 = v2;
  v12[1] = sub_24D1DCDD0;
  return sub_24D2044F4(a1, v6, v7, v8, v10, v11);
}

uint64_t sub_24D208B20()
{
  return objectdestroy_116Tm(&qword_26985C2D0);
}

uint64_t sub_24D208B2C(void *a1)
{
  return sub_24D2085B0(a1, &qword_26985C2D0, 0xD00000000000001ELL, 0x800000024D21C690, "%s Failed to establish daemon connection. %@");
}

uint64_t sub_24D208B58(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_24D1DA208(a1, a2);
  }
  return a1;
}

uint64_t sub_24D208B6C()
{
  return objectdestroy_40Tm(&qword_26985C2F0);
}

uint64_t sub_24D208B78(uint64_t a1)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26985C2F0) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v1 + 16);
  uint64_t v7 = *(void *)(v1 + 24);
  uint64_t v8 = v1 + v5;
  char v9 = (uint64_t *)(v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v10 = *v9;
  uint64_t v11 = v9[1];
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v12;
  *uint64_t v12 = v2;
  v12[1] = sub_24D1DCDD0;
  return sub_24D20330C(a1, v6, v7, v8, v10, v11);
}

uint64_t sub_24D208CA8()
{
  return objectdestroy_116Tm(&qword_26985C2F0);
}

uint64_t sub_24D208CB4(void *a1)
{
  return sub_24D2085B0(a1, &qword_26985C2F0, 0xD00000000000001DLL, 0x800000024D21C670, "%s Failed to establish daemon connection. %@");
}

uint64_t sub_24D208CE0(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t result = MEMORY[0x263F8EE78];
  if (v3)
  {
    uint64_t v8 = MEMORY[0x263F8EE78];
    sub_24D219420();
    sub_24D218FD0();
    unint64_t v5 = (unint64_t *)(a1 + 40);
    while (1)
    {
      uint64_t v6 = *(v5 - 1);
      unint64_t v7 = *v5;
      sub_24D1DA208(v6, *v5);
      sub_24D208E44(&qword_26985C308, MEMORY[0x263F49C50]);
      sub_24D218990();
      if (v1) {
        break;
      }
      v5 += 2;
      sub_24D1DA1B0(v6, v7);
      sub_24D219400();
      sub_24D219430();
      sub_24D219440();
      sub_24D219410();
      if (!--v3) {
        return v8;
      }
    }
    sub_24D1DA1B0(v6, v7);
    return swift_release();
  }
  return result;
}

uint64_t sub_24D208E44(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24D208E8C()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985C318);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v6, v5);
}

uint64_t sub_24D208F68(uint64_t a1)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26985C318) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v6 = (*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v7 = *(void *)(v1 + 16);
  uint64_t v8 = *(void *)(v1 + 24);
  uint64_t v9 = v1 + v5;
  double v10 = *(double *)(v1 + v6);
  double v11 = *(double *)(v1 + v6 + 8);
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v12;
  *uint64_t v12 = v2;
  v12[1] = sub_24D1DCDD0;
  return sub_24D20226C(v10, v11, a1, v7, v8, v9);
}

uint64_t sub_24D2090A0()
{
  return objectdestroy_116Tm(&qword_26985C318);
}

uint64_t sub_24D2090AC(void *a1)
{
  return sub_24D2085B0(a1, &qword_26985C318, 0xD000000000000020, 0x800000024D21C640, "%s Failed to establish daemon connection. %@");
}

uint64_t sub_24D2090D8()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A808);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 17;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, v6, v5);
}

uint64_t sub_24D2091C8(uint64_t a1)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B18A808) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v1 + 16);
  uint64_t v7 = *(void *)(v1 + 24);
  uint64_t v8 = v1 + v5;
  uint64_t v9 = v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v10 = *(void *)v9;
  uint64_t v11 = *(void *)(v9 + 8);
  char v12 = *(unsigned char *)(v9 + 16);
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v13;
  *uint64_t v13 = v2;
  v13[1] = sub_24D1DCDD0;
  return sub_24D20156C(a1, v6, v7, v8, v10, v11, v12);
}

uint64_t sub_24D209308()
{
  return objectdestroy_116Tm(&qword_26B18A808);
}

uint64_t sub_24D209314(void *a1)
{
  return sub_24D2085B0(a1, &qword_26B18A808, 0xD000000000000024, 0x800000024D21C610, "%s Failed to establish daemon connection. %@");
}

uint64_t sub_24D209340()
{
  return objectdestroy_40Tm(&qword_26985BDF8);
}

uint64_t objectdestroy_40Tm(uint64_t *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 32) & ~v4;
  uint64_t v6 = v4 | 7;
  unint64_t v7 = ((*(void *)(v3 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1 + v5, v2);
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v1, v7, v6);
}

uint64_t sub_24D209434(uint64_t a1)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26985BDF8) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v1 + 16);
  uint64_t v7 = *(void *)(v1 + 24);
  uint64_t v8 = v1 + v5;
  uint64_t v9 = (uint64_t *)(v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v10 = *v9;
  uint64_t v11 = v9[1];
  char v12 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v12;
  *char v12 = v2;
  v12[1] = sub_24D1DCDD0;
  return sub_24D20072C(a1, v6, v7, v8, v10, v11);
}

uint64_t sub_24D209564()
{
  return objectdestroy_116Tm(&qword_26985BDF8);
}

uint64_t sub_24D209570(void *a1)
{
  return sub_24D2085B0(a1, &qword_26985BDF8, 0xD000000000000018, 0x800000024D21C5F0, "%s Failed to establish daemon connection. %@");
}

uint64_t EnergySite.generateMockAMIData(startDate:endDate:forceAllReadingsToConstant:recordInterval:batchSize:rateSchedule:netMetering:direction:randomization:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(unsigned char *)(v9 + 123) = v14;
  *(void *)(v9 + 80) = v13;
  *(void *)(v9 + 88) = v8;
  *(unsigned char *)(v9 + 122) = v12;
  *(void *)(v9 + 64) = a8;
  *(void *)(v9 + 72) = v11;
  *(void *)(v9 + 48) = a6;
  *(void *)(v9 + 56) = a7;
  *(unsigned char *)(v9 + 121) = a5;
  *(void *)(v9 + 32) = a3;
  *(void *)(v9 + 40) = a4;
  *(void *)(v9 + 16) = a1;
  *(void *)(v9 + 24) = a2;
  return MEMORY[0x270FA2498](sub_24D2095F4, 0, 0);
}

uint64_t sub_24D2095F4()
{
  if (sub_24D218C50())
  {
    char v16 = *(unsigned char *)(v0 + 123);
    uint64_t v2 = *(void *)(v0 + 80);
    uint64_t v1 = *(void *)(v0 + 88);
    char v3 = *(unsigned char *)(v0 + 122);
    uint64_t v5 = *(void *)(v0 + 64);
    uint64_t v4 = *(void *)(v0 + 72);
    char v6 = *(unsigned char *)(v0 + 121);
    uint64_t v7 = *(void *)(v0 + 40);
    long long v14 = *(_OWORD *)(v0 + 24);
    long long v15 = *(_OWORD *)(v0 + 48);
    uint64_t v8 = *(void *)(v0 + 16);
    uint64_t v9 = swift_task_alloc();
    *(void *)(v0 + 96) = v9;
    *(void *)(v9 + 16) = v1;
    *(void *)(v9 + 24) = v8;
    *(_OWORD *)(v9 + 32) = v14;
    *(void *)(v9 + 48) = v7;
    *(unsigned char *)(v9 + 56) = v6;
    *(_OWORD *)(v9 + 64) = v15;
    *(void *)(v9 + 80) = v5;
    *(void *)(v9 + 88) = v4;
    *(unsigned char *)(v9 + 96) = v3;
    *(void *)(v9 + 104) = v2;
    *(unsigned char *)(v9 + 112) = v16;
    uint64_t v10 = (void *)swift_task_alloc();
    *(void *)(v0 + 104) = v10;
    *uint64_t v10 = v0;
    v10[1] = sub_24D2097AC;
    uint64_t v11 = MEMORY[0x263F8D4F8];
    return MEMORY[0x270FA2360](v0 + 120, 0, 0, 0xD00000000000008CLL, 0x800000024D21C760, sub_24D209C28, v9, v11);
  }
  else
  {
    char v12 = *(uint64_t (**)(void))(v0 + 8);
    return v12(0);
  }
}

uint64_t sub_24D2097AC()
{
  *(void *)(*(void *)v1 + 112) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_24D2098E0;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_24D2098C8;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D2098C8()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(unsigned __int8 *)(v0 + 120));
}

uint64_t sub_24D2098E0()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1(0);
}

uint64_t sub_24D209950(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, unsigned __int8 a12, uint64_t a13, unsigned __int8 a14)
{
  uint64_t v52 = a8;
  uint64_t v42 = a3;
  uint64_t v43 = a4;
  int v50 = a7;
  int v51 = a14;
  uint64_t v48 = a6;
  uint64_t v49 = a13;
  int v47 = a12;
  uint64_t v45 = a11;
  uint64_t v46 = a5;
  uint64_t v44 = a10;
  uint64_t v40 = a2;
  uint64_t v41 = a9;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BDF8);
  uint64_t v38 = v15;
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(void *)(v16 + 64);
  MEMORY[0x270FA5388](v15);
  os_log_type_t v18 = (char *)&v37 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5B0);
  MEMORY[0x270FA5388](v19 - 8);
  id v21 = (char *)&v37 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = v21;
  uint64_t v22 = sub_24D219240();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v21, 1, 1, v22);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, a1, v15);
  unint64_t v23 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v24 = (v17 + v23 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v25 = (v24 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v37 = (v25 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v26 = (v25 + 47) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v27 = (v26 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v28 = swift_allocObject();
  *(void *)(v28 + 16) = 0;
  *(void *)(v28 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v16 + 32))(v28 + v23, v18, v38);
  *(void *)(v28 + v24) = v40;
  unint64_t v29 = (void *)(v28 + v25);
  uint64_t v30 = v43;
  *unint64_t v29 = v42;
  v29[1] = v30;
  unint64_t v31 = v28 + v37;
  uint64_t v32 = v45;
  uint64_t v33 = v48;
  *(void *)unint64_t v31 = v46;
  *(void *)(v31 + 8) = v33;
  *(unsigned char *)(v31 + 16) = v50;
  *(void *)(v28 + v26) = v52;
  *(void *)(v28 + v27) = v41;
  unint64_t v34 = v28 + ((v27 + 15) & 0xFFFFFFFFFFFFFFF8);
  *(void *)unint64_t v34 = v44;
  *(void *)(v34 + 8) = v32;
  *(unsigned char *)(v34 + 16) = v47;
  unint64_t v35 = v28 + ((v27 + 39) & 0xFFFFFFFFFFFFFFF8);
  *(void *)unint64_t v35 = v49;
  *(unsigned char *)(v35 + 8) = v51;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_24D1BA610((uint64_t)v39, (uint64_t)&unk_26985C380, v28);
  return swift_release();
}

uint64_t sub_24D209C28(uint64_t a1)
{
  return sub_24D209950(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(unsigned __int8 *)(v1 + 56), *(void *)(v1 + 64), *(void *)(v1 + 72), *(void *)(v1 + 80), *(void *)(v1 + 88), *(unsigned char *)(v1 + 96), *(void *)(v1 + 104), *(unsigned char *)(v1 + 112));
}

uint64_t sub_24D209C84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(unsigned char *)(v8 + 308) = v21;
  *(void *)(v8 + 200) = v18;
  *(void *)(v8 + 208) = v20;
  *(unsigned char *)(v8 + 307) = v19;
  *(void *)(v8 + 184) = v16;
  *(void *)(v8 + 192) = v17;
  *(void *)(v8 + 168) = v13;
  *(void *)(v8 + 176) = v15;
  *(unsigned char *)(v8 + 306) = v14;
  *(void *)(v8 + 152) = a7;
  *(void *)(v8 + 160) = a8;
  *(void *)(v8 + 136) = a5;
  *(void *)(v8 + 144) = a6;
  *(void *)(v8 + 128) = a4;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BDF8);
  *(void *)(v8 + 216) = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  *(void *)(v8 + 224) = v10;
  *(void *)(v8 + 232) = *(void *)(v10 + 64);
  *(void *)(v8 + 240) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D209D90, 0, 0);
}

uint64_t sub_24D209D90()
{
  uint64_t v1 = *(void *)(v0 + 240);
  uint64_t v2 = *(void *)(v0 + 224);
  char v20 = *(unsigned char *)(v0 + 308);
  uint64_t v3 = *(void *)(v0 + 216);
  uint64_t v19 = *(void *)(v0 + 208);
  char v18 = *(unsigned char *)(v0 + 307);
  uint64_t v22 = *(void *)(v0 + 176);
  uint64_t v23 = *(void *)(v0 + 184);
  unsigned int v21 = *(unsigned __int8 *)(v0 + 306);
  uint64_t v4 = *(void *)(v0 + 136);
  uint64_t v5 = *(void *)(v0 + 128);
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  *(void *)(v0 + 248) = sub_24D217288();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v5, v3);
  unint64_t v6 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v7 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v2 + 32))(v7 + v6, v1, v3);
  uint64_t v8 = (void *)sub_24D217944((uint64_t)sub_24D20B918, v7);
  *(void *)(v0 + 256) = v8;
  swift_release();
  id v9 = *(id *)(v4 + 16);
  sub_24D218E60();

  uint64_t v10 = sub_24D2190E0();
  *(void *)(v0 + 264) = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = sub_24D2190E0();
  *(void *)(v0 + 272) = v11;
  uint64_t v12 = sub_24D2190E0();
  *(void *)(v0 + 280) = v12;
  uint64_t v13 = sub_24D2190E0();
  *(void *)(v0 + 288) = v13;
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 56) = v0 + 304;
  *(void *)(v0 + 24) = sub_24D20A058;
  uint64_t v14 = swift_continuation_init();
  *(void *)(v0 + 80) = MEMORY[0x263EF8330];
  *(void *)(v0 + 88) = 0x40000000;
  *(void *)(v0 + 96) = sub_24D2160E8;
  *(void *)(v0 + 104) = &block_descriptor_14;
  *(void *)(v0 + 112) = v14;
  LOBYTE(v17) = v20;
  LOBYTE(v16) = v18;
  objc_msgSend(v8, sel_generateMockAMIDataWithSiteID_startDate_endDate_forceAllReadingsToConstant_recordInterval_batchSize_rateSchedule_netMetering_direction_randomization_completionHandler_, v10, v11, v12, v21, v22, v23, v13, v16, v19, v17, v0 + 80);
  return MEMORY[0x270FA23F0](v0 + 16);
}

uint64_t sub_24D20A058()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 296) = v1;
  if (v1) {
    uint64_t v2 = sub_24D20A240;
  }
  else {
    uint64_t v2 = sub_24D20A168;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D20A168()
{
  uint64_t v2 = *(void **)(v0 + 280);
  uint64_t v1 = *(void **)(v0 + 288);
  uint64_t v4 = *(void **)(v0 + 264);
  uint64_t v3 = *(void **)(v0 + 272);
  uint64_t v5 = *(void *)(v0 + 248);
  char v6 = *(unsigned char *)(v0 + 304);
  swift_unknownObjectRelease();

  objc_msgSend(*(id *)(v5 + 16), sel_invalidate);
  *(unsigned char *)(v0 + 305) = v6;
  sub_24D219220();
  swift_release();
  swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_24D20A240()
{
  uint64_t v2 = (void *)v0[36];
  uint64_t v1 = v0[37];
  uint64_t v4 = (void *)v0[34];
  uint64_t v3 = (void *)v0[35];
  uint64_t v5 = (void *)v0[33];
  swift_willThrow();
  swift_release();
  swift_unknownObjectRelease();

  v0[15] = v1;
  sub_24D219210();
  swift_task_dealloc();
  char v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t EnergySite.generateMultipleMeterMockAMIData(startDate:endDate:recordInterval:rateSchedule:multipleMeters:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v9[9] = a8;
  v9[10] = v8;
  v9[7] = a6;
  v9[8] = a7;
  void v9[5] = a4;
  v9[6] = a5;
  v9[3] = a2;
  v9[4] = a3;
  v9[2] = a1;
  return MEMORY[0x270FA2498](sub_24D20A344, 0, 0);
}

uint64_t sub_24D20A344()
{
  if (sub_24D218C50())
  {
    uint64_t v2 = *(void *)(v0 + 72);
    uint64_t v1 = *(void *)(v0 + 80);
    uint64_t v3 = *(void *)(v0 + 48);
    long long v11 = *(_OWORD *)(v0 + 32);
    long long v12 = *(_OWORD *)(v0 + 56);
    uint64_t v5 = *(void *)(v0 + 16);
    uint64_t v4 = *(void *)(v0 + 24);
    uint64_t v6 = swift_task_alloc();
    *(void *)(v0 + 88) = v6;
    *(void *)(v6 + 16) = v1;
    *(void *)(v6 + 24) = v5;
    *(void *)(v6 + 32) = v4;
    *(_OWORD *)(v6 + 40) = v11;
    *(void *)(v6 + 56) = v3;
    *(_OWORD *)(v6 + 64) = v12;
    *(void *)(v6 + 80) = v2;
    uint64_t v7 = (void *)swift_task_alloc();
    *(void *)(v0 + 96) = v7;
    *uint64_t v7 = v0;
    v7[1] = sub_24D20A4C8;
    uint64_t v8 = MEMORY[0x263F8D4F8];
    return MEMORY[0x270FA2360](v0 + 112, 0, 0, 0xD00000000000005FLL, 0x800000024D21C7F0, sub_24D20A8F0, v6, v8);
  }
  else
  {
    uint64_t v9 = *(uint64_t (**)(void))(v0 + 8);
    return v9(0);
  }
}

uint64_t sub_24D20A4C8()
{
  *(void *)(*(void *)v1 + 104) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_24D20A5FC;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_24D20A5E4;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D20A5E4()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(unsigned __int8 *)(v0 + 112));
}

uint64_t sub_24D20A5FC()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1(0);
}

uint64_t sub_24D20A66C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v45 = a7;
  uint64_t v46 = a8;
  uint64_t v39 = a3;
  uint64_t v40 = a4;
  uint64_t v38 = a2;
  uint64_t v43 = a10;
  uint64_t v44 = a6;
  uint64_t v41 = a9;
  uint64_t v42 = a5;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BDF8);
  uint64_t v36 = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5B0);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (char *)&v35 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v37 = v17;
  uint64_t v18 = sub_24D219240();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v17, 1, 1, v18);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a1, v11);
  unint64_t v19 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  unint64_t v20 = (v13 + v19 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v21 = (v20 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v22 = (v21 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v23 = (v22 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v24 = (v23 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = 0;
  *(void *)(v25 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v12 + 32))(v25 + v19, v14, v36);
  uint64_t v26 = v39;
  *(void *)(v25 + v20) = v38;
  unint64_t v27 = (void *)(v25 + v21);
  uint64_t v29 = v40;
  uint64_t v28 = v41;
  void *v27 = v26;
  v27[1] = v29;
  uint64_t v30 = (void *)(v25 + v22);
  uint64_t v31 = v44;
  void *v30 = v42;
  v30[1] = v31;
  uint64_t v32 = v46;
  *(void *)(v25 + v23) = v45;
  uint64_t v33 = (void *)(v25 + v24);
  *uint64_t v33 = v32;
  v33[1] = v28;
  *(void *)(v25 + ((v24 + 23) & 0xFFFFFFFFFFFFFFF8)) = v43;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_24D1BA610((uint64_t)v37, (uint64_t)&unk_26985C370, v25);
  return swift_release();
}

uint64_t sub_24D20A8F0(uint64_t a1)
{
  return sub_24D20A66C(a1, v1[2], v1[3], v1[4], v1[5], v1[6], v1[7], v1[8], v1[9], v1[10]);
}

uint64_t sub_24D20A928(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 200) = v15;
  *(_OWORD *)(v8 + 184) = v14;
  *(_OWORD *)(v8 + 168) = v13;
  *(void *)(v8 + 152) = a7;
  *(void *)(v8 + 160) = a8;
  *(void *)(v8 + 136) = a5;
  *(void *)(v8 + 144) = a6;
  *(void *)(v8 + 128) = a4;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BDF8);
  *(void *)(v8 + 208) = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  *(void *)(v8 + 216) = v10;
  *(void *)(v8 + 224) = *(void *)(v10 + 64);
  *(void *)(v8 + 232) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D20AA14, 0, 0);
}

uint64_t sub_24D20AA14()
{
  uint64_t v1 = v0[29];
  uint64_t v2 = v0[26];
  uint64_t v3 = v0[27];
  uint64_t v16 = v0[22];
  uint64_t v17 = v0[25];
  uint64_t v4 = v0[17];
  uint64_t v5 = v0[16];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[30] = sub_24D217288();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v5, v2);
  unint64_t v6 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v7 + v6, v1, v2);
  uint64_t v8 = (void *)sub_24D217944((uint64_t)sub_24D20B548, v7);
  v0[31] = v8;
  swift_release();
  id v9 = *(id *)(v4 + 16);
  sub_24D218E60();

  uint64_t v10 = sub_24D2190E0();
  v0[32] = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = sub_24D2190E0();
  v0[33] = v11;
  uint64_t v12 = sub_24D2190E0();
  v0[34] = v12;
  uint64_t v13 = sub_24D2190E0();
  v0[35] = v13;
  v0[2] = v0;
  v0[7] = v0 + 37;
  v0[3] = sub_24D20AC9C;
  uint64_t v14 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_24D2160E8;
  v0[13] = &block_descriptor_1;
  v0[14] = v14;
  objc_msgSend(v8, sel_generateMultipleMeterMockAMIDataWithSiteID_startDate_endDate_recordInterval_rateSchedule_multipleMeters_completionHandler_, v10, v11, v12, v16, v13, v17, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_24D20AC9C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 288) = v1;
  if (v1) {
    uint64_t v2 = sub_24D20AE84;
  }
  else {
    uint64_t v2 = sub_24D20ADAC;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D20ADAC()
{
  uint64_t v2 = *(void **)(v0 + 272);
  uint64_t v1 = *(void **)(v0 + 280);
  uint64_t v4 = *(void **)(v0 + 256);
  uint64_t v3 = *(void **)(v0 + 264);
  uint64_t v5 = *(void *)(v0 + 240);
  char v6 = *(unsigned char *)(v0 + 296);
  swift_unknownObjectRelease();

  objc_msgSend(*(id *)(v5 + 16), sel_invalidate);
  *(unsigned char *)(v0 + 297) = v6;
  sub_24D219220();
  swift_release();
  swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_24D20AE84()
{
  uint64_t v2 = (void *)v0[35];
  uint64_t v1 = v0[36];
  uint64_t v4 = (void *)v0[33];
  uint64_t v3 = (void *)v0[34];
  uint64_t v5 = (void *)v0[32];
  swift_willThrow();
  swift_release();
  swift_unknownObjectRelease();

  v0[15] = v1;
  sub_24D219210();
  swift_task_dealloc();
  char v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_24D20AF58()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BDF8);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((((((((((((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)
           + 23) & 0xFFFFFFFFFFFFFFF8)
         + 15) & 0xFFFFFFFFFFFFFFF8)
       + 23) & 0xFFFFFFFFFFFFFFF8)
     + 8;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, v6, v5);
}

uint64_t sub_24D20B098(uint64_t a1)
{
  uint64_t v3 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26985BDF8) - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = (*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v6 = (v5 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v15 = *(void *)(v1 + 16);
  uint64_t v13 = v1 + v4;
  uint64_t v14 = *(void *)(v1 + 24);
  uint64_t v7 = *(void *)(v1 + v5);
  uint64_t v8 = *(void *)(v1 + v6);
  uint64_t v9 = *(void *)(v1 + v6 + 8);
  uint64_t v10 = *(void *)(v1 + ((v6 + 23) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  void *v11 = v2;
  v11[1] = sub_24D1DCDD0;
  return sub_24D20A928(a1, v15, v14, v13, v7, v8, v9, v10);
}

uint64_t sub_24D20B240(void *a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = sub_24D219020();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B18A2F8 != -1) {
    swift_once();
  }
  uint64_t v12 = __swift_project_value_buffer(v8, (uint64_t)qword_26B18A8F0);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v12, v8);
  id v13 = a1;
  id v14 = a1;
  uint64_t v15 = sub_24D219000();
  os_log_type_t v16 = sub_24D2192D0();
  if (os_log_type_enabled(v15, v16))
  {
    unint64_t v17 = a4;
    uint64_t v18 = swift_slowAlloc();
    uint64_t v26 = swift_slowAlloc();
    uint64_t v29 = v26;
    *(_DWORD *)uint64_t v18 = 136315394;
    uint64_t v27 = a2;
    uint64_t v28 = sub_24D1D0A78(a3, v17, &v29);
    sub_24D219310();
    *(_WORD *)(v18 + 12) = 2080;
    uint64_t v28 = (uint64_t)a1;
    id v19 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5D0);
    uint64_t v20 = sub_24D219100();
    uint64_t v28 = sub_24D1D0A78(v20, v21, &v29);
    sub_24D219310();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_24D1B6000, v15, v16, "%s error: %s", (uint8_t *)v18, 0x16u);
    uint64_t v22 = v26;
    swift_arrayDestroy();
    MEMORY[0x253322AA0](v22, -1, -1);
    MEMORY[0x253322AA0](v18, -1, -1);
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v29 = (uint64_t)a1;
  id v23 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985BDF8);
  return sub_24D219210();
}

uint64_t sub_24D20B548(void *a1)
{
  return sub_24D20B934(a1, 0xD00000000000005FLL, 0x800000024D21C7F0);
}

uint64_t sub_24D20B564()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BDF8);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((((((((((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 47) & 0xFFFFFFFFFFFFFFF8)
         + 15) & 0xFFFFFFFFFFFFFFF8)
       + 39) & 0xFFFFFFFFFFFFFFF8)
     + 9;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, v6, v5);
}

uint64_t sub_24D20B6AC(uint64_t a1)
{
  uint64_t v3 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26985BDF8) - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = (*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v6 = (v5 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v7 = (v6 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v17 = *(void *)(v1 + v5);
  uint64_t v12 = *(void *)(v1 + 16);
  uint64_t v13 = *(void *)(v1 + 24);
  uint64_t v8 = (uint64_t *)(v1 + v6);
  uint64_t v15 = *v8;
  uint64_t v16 = v8[1];
  uint64_t v11 = v1 + v4;
  uint64_t v14 = *(void *)(v1 + v7);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_24D1D770C;
  return sub_24D209C84(a1, v12, v13, v11, v17, v15, v16, v14);
}

uint64_t objectdestroy_5Tm()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BDF8);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_24D20B918(void *a1)
{
  return sub_24D20B934(a1, 0xD00000000000008CLL, 0x800000024D21C760);
}

uint64_t sub_24D20B934(void *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v7 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26985BDF8) - 8);
  return sub_24D20B240(a1, v3 + ((*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80)), a2, a3);
}

uint64_t sub_24D20B9B4(char a1, char a2)
{
  if (*(void *)&aDay_1[8 * a1] == *(void *)&aDay_1[8 * a2] && qword_24D21A440[a1] == qword_24D21A440[a2]) {
    char v3 = 1;
  }
  else {
    char v3 = sub_24D2194E0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t EnergySite.historicalEnergyUsage(interval:start:timezone:utilityID:subscriptionID:bulk:)(uint64_t a1, unsigned char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(unsigned char *)(v9 + 297) = v15;
  *(void *)(v9 + 160) = a8;
  *(void *)(v9 + 168) = v8;
  *(void *)(v9 + 144) = a6;
  *(void *)(v9 + 152) = a7;
  *(void *)(v9 + 128) = a4;
  *(void *)(v9 + 136) = a5;
  *(void *)(v9 + 112) = a1;
  *(void *)(v9 + 120) = a3;
  uint64_t v11 = sub_24D219020();
  *(void *)(v9 + 176) = v11;
  *(void *)(v9 + 184) = *(void *)(v11 - 8);
  *(void *)(v9 + 192) = swift_task_alloc();
  *(void *)(v9 + 200) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985C390);
  *(void *)(v9 + 208) = swift_task_alloc();
  *(void *)(v9 + 216) = swift_task_alloc();
  uint64_t v12 = sub_24D218AC0();
  *(void *)(v9 + 224) = v12;
  *(void *)(v9 + 232) = *(void *)(v12 - 8);
  *(void *)(v9 + 240) = swift_task_alloc();
  *(void *)(v9 + 248) = swift_task_alloc();
  *(void *)(v9 + 256) = swift_task_alloc();
  *(void *)(v9 + 264) = swift_task_alloc();
  *(void *)(v9 + 272) = swift_task_alloc();
  *(unsigned char *)(v9 + 298) = *a2;
  return MEMORY[0x270FA2498](sub_24D20BC00, 0, 0);
}

uint64_t sub_24D20BC00()
{
  uint64_t v1 = *(void *)(v0 + 216);
  uint64_t v2 = *(void *)(v0 + 120);
  LOBYTE(v99) = *(unsigned char *)(v0 + 298);
  sub_24D20CAA8((unsigned __int8 *)&v99, v2, v1);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985C398);
  uint64_t v4 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 48);
  if (v4(v1, 1, v3) == 1)
  {
    sub_24D1D9A80(*(void *)(v0 + 216), &qword_26985C390);
    if (qword_26985BA68 != -1) {
      swift_once();
    }
    uint64_t v6 = *(void *)(v0 + 232);
    uint64_t v5 = *(void *)(v0 + 240);
    uint64_t v7 = *(void *)(v0 + 224);
    uint64_t v8 = *(void *)(v0 + 184);
    uint64_t v9 = *(void *)(v0 + 192);
    uint64_t v10 = *(void *)(v0 + 176);
    uint64_t v11 = *(void *)(v0 + 120);
    uint64_t v12 = __swift_project_value_buffer(v10, (uint64_t)qword_26985D068);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v9, v12, v10);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v5, v11, v7);
    uint64_t v13 = sub_24D219000();
    os_log_type_t v14 = sub_24D2192D0();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = *(char *)(v0 + 298);
      uint64_t v16 = swift_slowAlloc();
      uint64_t v92 = swift_slowAlloc();
      uint64_t v99 = v92;
      *(_DWORD *)uint64_t v16 = 136315650;
      *(void *)(v0 + 88) = sub_24D1D0A78(0xD00000000000004DLL, 0x800000024D21C850, &v99);
      sub_24D219310();
      uint64_t v17 = *(void *)&aDay_1[8 * v15];
      *(_WORD *)(v16 + 12) = 2080;
      uint64_t v19 = *(void *)(v0 + 232);
      uint64_t v18 = *(void *)(v0 + 240);
      uint64_t v20 = *(void *)(v0 + 224);
      uint64_t v90 = *(void *)(v0 + 184);
      uint64_t v95 = *(void *)(v0 + 176);
      uint64_t v97 = *(void *)(v0 + 192);
      *(void *)(v0 + 64) = sub_24D1D0A78(v17, qword_24D21A440[v15], &v99);
      sub_24D219310();
      swift_bridgeObjectRelease();
      *(_WORD *)(v16 + 22) = 2080;
      sub_24D2154D0(&qword_26985C3A0, MEMORY[0x263F07490]);
      uint64_t v21 = sub_24D2194D0();
      *(void *)(v0 + 72) = sub_24D1D0A78(v21, v22, &v99);
      sub_24D219310();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v20);
      _os_log_impl(&dword_24D1B6000, v13, v14, "%s error calculating intervals parameters. interval:%s, start:%s", (uint8_t *)v16, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x253322AA0](v92, -1, -1);
      MEMORY[0x253322AA0](v16, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v90 + 8))(v97, v95);
    }
    else
    {
      uint64_t v35 = *(void *)(v0 + 184);
      uint64_t v34 = *(void *)(v0 + 192);
      uint64_t v36 = *(void *)(v0 + 176);
      (*(void (**)(void, void))(*(void *)(v0 + 232) + 8))(*(void *)(v0 + 240), *(void *)(v0 + 224));

      (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v34, v36);
    }
LABEL_23:
    uint64_t v81 = *(void *)(v0 + 112);
    uint64_t v82 = type metadata accessor for EnergySite.HistoricalEnergyUsage(0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v82 - 8) + 56))(v81, 1, 1, v82);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v83 = *(uint64_t (**)(void))(v0 + 8);
    return v83();
  }
  int v93 = v4;
  uint64_t v23 = *(void *)(v0 + 264);
  uint64_t v24 = *(void *)(v0 + 272);
  uint64_t v26 = *(void *)(v0 + 224);
  uint64_t v25 = *(void *)(v0 + 232);
  uint64_t v27 = *(void *)(v0 + 216);
  int v28 = *(unsigned __int8 *)(v0 + 297);
  uint64_t v29 = v27 + *(int *)(v3 + 48);
  uint64_t v30 = sub_24D218B70();
  uint64_t v86 = *(void (**)(uint64_t))(*(void *)(v30 - 8) + 8);
  uint64_t v88 = v30;
  v86(v27);
  uint64_t v84 = *(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 32);
  v84(v24, v29, v26);
  uint64_t v31 = *(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 16);
  v31(v23, v24, v26);
  if (v28 == 1)
  {
    char v32 = *(unsigned char *)(v0 + 298);
    uint64_t v33 = v31;
    switch(v32)
    {
      case 3:
        swift_bridgeObjectRelease();
        char v37 = 3;
        break;
      default:
        char v38 = sub_24D2194E0();
        swift_bridgeObjectRelease();
        if (v38) {
          char v37 = v32;
        }
        else {
          char v37 = 4;
        }
        break;
    }
    uint64_t v39 = *(void *)(v0 + 208);
    uint64_t v40 = *(void *)(v0 + 120);
    LOBYTE(v99) = v37;
    sub_24D20CAA8((unsigned __int8 *)&v99, v40, v39);
    if (v93(v39, 1, v3) == 1)
    {
      sub_24D1D9A80(*(void *)(v0 + 208), &qword_26985C390);
      if (qword_26985BA68 != -1) {
        swift_once();
      }
      uint64_t v41 = *(void *)(v0 + 248);
      uint64_t v42 = *(void *)(v0 + 224);
      uint64_t v43 = *(void *)(v0 + 200);
      uint64_t v45 = *(void *)(v0 + 176);
      uint64_t v44 = *(void *)(v0 + 184);
      uint64_t v46 = *(void *)(v0 + 120);
      uint64_t v47 = __swift_project_value_buffer(v45, (uint64_t)qword_26985D068);
      swift_beginAccess();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v44 + 16))(v43, v47, v45);
      v33(v41, v46, v42);
      uint64_t v48 = sub_24D219000();
      os_log_type_t v49 = sub_24D2192D0();
      if (os_log_type_enabled(v48, v49))
      {
        uint64_t v50 = *(char *)(v0 + 298);
        uint64_t v51 = swift_slowAlloc();
        uint64_t v94 = swift_slowAlloc();
        uint64_t v99 = v94;
        *(_DWORD *)uint64_t v51 = 136315650;
        *(void *)(v0 + 96) = sub_24D1D0A78(0xD00000000000004DLL, 0x800000024D21C850, &v99);
        sub_24D219310();
        uint64_t v52 = *(void *)&aDay_1[8 * v50];
        *(_WORD *)(v51 + 12) = 2080;
        uint64_t v96 = *(void *)(v0 + 272);
        uint64_t v53 = *(void *)(v0 + 248);
        uint64_t v55 = *(void *)(v0 + 224);
        uint64_t v54 = *(void *)(v0 + 232);
        uint64_t v89 = *(void *)(v0 + 200);
        uint64_t v91 = *(void *)(v0 + 264);
        uint64_t v85 = *(void *)(v0 + 184);
        uint64_t v87 = *(void *)(v0 + 176);
        *(void *)(v0 + 104) = sub_24D1D0A78(v52, qword_24D21A440[v50], &v99);
        sub_24D219310();
        swift_bridgeObjectRelease();
        *(_WORD *)(v51 + 22) = 2080;
        sub_24D2154D0(&qword_26985C3A0, MEMORY[0x263F07490]);
        uint64_t v56 = sub_24D2194D0();
        *(void *)(v0 + 80) = sub_24D1D0A78(v56, v57, &v99);
        sub_24D219310();
        swift_bridgeObjectRelease();
        uint64_t v58 = *(void (**)(uint64_t, uint64_t))(v54 + 8);
        v58(v53, v55);
        _os_log_impl(&dword_24D1B6000, v48, v49, "%s error calculating intervals parameters. interval:%s, start:%s", (uint8_t *)v51, 0x20u);
        swift_arrayDestroy();
        MEMORY[0x253322AA0](v94, -1, -1);
        MEMORY[0x253322AA0](v51, -1, -1);

        (*(void (**)(uint64_t, uint64_t))(v85 + 8))(v89, v87);
        v58(v91, v55);
        v58(v96, v55);
      }
      else
      {
        uint64_t v72 = *(void *)(v0 + 264);
        uint64_t v73 = *(void *)(v0 + 272);
        uint64_t v74 = *(void *)(v0 + 248);
        uint64_t v75 = *(void *)(v0 + 224);
        uint64_t v76 = *(void *)(v0 + 232);
        uint64_t v77 = *(void *)(v0 + 200);
        uint64_t v78 = *(void *)(v0 + 176);
        uint64_t v79 = *(void *)(v0 + 184);

        uint64_t v80 = *(void (**)(uint64_t, uint64_t))(v76 + 8);
        v80(v74, v75);
        (*(void (**)(uint64_t, uint64_t))(v79 + 8))(v77, v78);
        v80(v72, v75);
        v80(v73, v75);
      }
      goto LABEL_23;
    }
    uint64_t v59 = *(void *)(v0 + 256);
    uint64_t v60 = *(void *)(v0 + 264);
    uint64_t v61 = *(void *)(v0 + 224);
    uint64_t v62 = *(void *)(v0 + 208);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v0 + 232) + 8))(v60, v61);
    v84(v59, v62 + *(int *)(v3 + 48), v61);
    ((void (*)(uint64_t, uint64_t))v86)(v62, v88);
    v84(v60, v59, v61);
  }
  *(unsigned char *)(v0 + 296) = *(unsigned char *)(v0 + 298);
  uint64_t v63 = (void *)swift_task_alloc();
  *(void *)(v0 + 280) = v63;
  *uint64_t v63 = v0;
  v63[1] = sub_24D20C6F0;
  uint64_t v64 = *(void *)(v0 + 264);
  uint64_t v65 = *(void *)(v0 + 144);
  uint64_t v66 = *(void *)(v0 + 152);
  uint64_t v67 = *(void *)(v0 + 128);
  uint64_t v68 = *(void *)(v0 + 136);
  uint64_t v69 = *(void *)(v0 + 112);
  uint64_t v70 = *(void *)(v0 + 120);
  return EnergySite.historicalEnergyUsageInterval(interval:start:end:timezone:utilityID:subscriptionID:)(v69, (unsigned char *)(v0 + 296), v70, v64, v67, v68, v65, v66);
}

uint64_t sub_24D20C6F0()
{
  *(void *)(*(void *)v1 + 288) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24D20C950;
  }
  else {
    uint64_t v2 = sub_24D20C804;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D20C804()
{
  uint64_t v1 = v0[34];
  uint64_t v2 = v0[28];
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(v0[29] + 8);
  v3(v0[33], v2);
  v3(v1, v2);
  uint64_t v4 = v0[14];
  uint64_t v5 = type metadata accessor for EnergySite.HistoricalEnergyUsage(0);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 0, 1, v5);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_24D20C950()
{
  uint64_t v1 = (void *)v0[36];
  uint64_t v2 = v0[34];
  uint64_t v3 = v0[28];
  uint64_t v4 = *(void (**)(uint64_t, uint64_t))(v0[29] + 8);
  v4(v0[33], v3);
  v4(v2, v3);

  uint64_t v5 = v0[14];
  uint64_t v6 = type metadata accessor for EnergySite.HistoricalEnergyUsage(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_24D20CAA8@<X0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v89 = a2;
  uint64_t v98 = a3;
  uint64_t v4 = sub_24D219020();
  uint64_t v96 = *(void *)(v4 - 8);
  uint64_t v97 = v4;
  MEMORY[0x270FA5388](v4);
  v105 = (char *)&v84 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A610);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v87 = (char *)&v84 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v86 = (char *)&v84 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v85 = (char *)&v84 - v11;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(qword_26985BBC0);
  MEMORY[0x270FA5388](v12 - 8);
  os_log_type_t v14 = (char *)&v84 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_24D218BB0();
  uint64_t v95 = *(void *)(v15 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v84 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v94 = (char *)&v84 - v19;
  uint64_t v20 = sub_24D218B20();
  uint64_t v21 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  uint64_t v23 = (char *)&v84 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_24D218B80();
  uint64_t v25 = *(void *)(v24 - 8);
  uint64_t v99 = v24;
  uint64_t v100 = v25;
  MEMORY[0x270FA5388](v24);
  uint64_t v27 = (char *)&v84 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v102 = sub_24D218AC0();
  uint64_t v104 = *(void *)(v102 - 8);
  uint64_t v28 = MEMORY[0x270FA5388](v102);
  uint64_t v88 = (char *)&v84 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v28);
  uint64_t v31 = (char *)&v84 - v30;
  uint64_t v32 = sub_24D218B70();
  uint64_t v91 = *(void *)(v32 - 8);
  uint64_t v92 = v32;
  uint64_t v33 = MEMORY[0x270FA5388](v32);
  uint64_t v35 = (char *)&v84 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v33);
  int v93 = (char *)&v84 - v36;
  uint64_t v90 = *a1;
  unint64_t v101 = v31;
  char v37 = v27;
  sub_24D218AB0();
  (*(void (**)(char *, void, uint64_t))(v21 + 104))(v23, *MEMORY[0x263F07740], v20);
  sub_24D218B30();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v23, v20);
  id v38 = *(id *)(v103 + 16);
  sub_24D218EB0();
  uint64_t v40 = v39;

  if (!v40)
  {
LABEL_4:
    if (qword_26985BA68 != -1) {
      swift_once();
    }
    uint64_t v42 = v97;
    uint64_t v43 = __swift_project_value_buffer(v97, (uint64_t)qword_26985D068);
    swift_beginAccess();
    uint64_t v44 = v96;
    uint64_t v45 = v105;
    (*(void (**)(char *, uint64_t, uint64_t))(v96 + 16))(v105, v43, v42);
    uint64_t v46 = sub_24D219000();
    os_log_type_t v47 = sub_24D2192D0();
    BOOL v48 = os_log_type_enabled(v46, v47);
    uint64_t v49 = v98;
    if (v48)
    {
      uint64_t v50 = (uint8_t *)swift_slowAlloc();
      uint64_t v51 = swift_slowAlloc();
      uint64_t v107 = v51;
      *(_DWORD *)uint64_t v50 = 136315138;
      uint64_t v106 = sub_24D1D0A78(0xD00000000000002ALL, 0x800000024D21C9A0, &v107);
      sub_24D219310();
      _os_log_impl(&dword_24D1B6000, v46, v47, "%s valid timezone set for EnergySite required", v50, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x253322AA0](v51, -1, -1);
      MEMORY[0x253322AA0](v50, -1, -1);

      (*(void (**)(char *, uint64_t))(v44 + 8))(v105, v42);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v44 + 8))(v45, v42);
    }
    (*(void (**)(char *, uint64_t))(v100 + 8))(v37, v99);
    (*(void (**)(char *, uint64_t))(v104 + 8))(v101, v102);
    uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985C398);
    uint64_t v53 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v52 - 8) + 56);
    uint64_t v54 = v49;
LABEL_10:
    uint64_t v55 = 1;
    return v53(v54, v55, 1, v52);
  }
  sub_24D218B90();
  swift_bridgeObjectRelease();
  uint64_t v41 = v95;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v95 + 48))(v14, 1, v15) == 1)
  {
    sub_24D1D9A80((uint64_t)v14, qword_26985BBC0);
    goto LABEL_4;
  }
  uint64_t v56 = v94;
  (*(void (**)(char *, char *, uint64_t))(v41 + 32))(v94, v14, v15);
  (*(void (**)(char *, char *, uint64_t))(v41 + 16))(v18, v56, v15);
  sub_24D218B60();
  uint64_t v57 = v91;
  uint64_t v58 = v104;
  uint64_t v59 = v92;
  switch(v90)
  {
    case 1:
      uint64_t v65 = v15;
      uint64_t v66 = *MEMORY[0x263F07870];
      uint64_t v67 = *(void (**)(char *, uint64_t, uint64_t))(v91 + 104);
      v67(v93, v66, v92);
      v67(v35, v66, v59);
      uint64_t v68 = v85;
      sub_24D218B50();
      uint64_t v69 = *(void (**)(char *, uint64_t))(v57 + 8);
      v69(v35, v59);
      (*(void (**)(char *, uint64_t))(v41 + 8))(v94, v65);
      (*(void (**)(char *, uint64_t))(v100 + 8))(v37, v99);
      uint64_t v62 = v101;
      uint64_t v61 = v102;
      (*(void (**)(char *, uint64_t))(v58 + 8))(v101, v102);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v58 + 48))(v68, 1, v61) == 1)
      {
        v69(v93, v59);
        uint64_t v70 = (uint64_t)v68;
        goto LABEL_21;
      }
      uint64_t v80 = v68;
      uint64_t v63 = *(void (**)(char *, char *, uint64_t))(v58 + 32);
      v63(v62, v80, v61);
      goto LABEL_24;
    case 2:
      uint64_t v71 = *(void (**)(char *, void, uint64_t))(v91 + 104);
      v71(v93, *MEMORY[0x263F07870], v92);
      v71(v35, *MEMORY[0x263F078A8], v59);
      uint64_t v72 = &v108;
      goto LABEL_19;
    case 3:
      uint64_t v73 = v93;
      (*(void (**)(char *, void, uint64_t))(v91 + 104))(v93, *MEMORY[0x263F07830], v92);
      uint64_t v74 = v88;
      sub_24D218EF0();
      (*(void (**)(char *, uint64_t))(v41 + 8))(v94, v15);
      uint64_t v75 = v37;
      uint64_t v64 = v73;
      (*(void (**)(char *, uint64_t))(v100 + 8))(v75, v99);
      uint64_t v62 = v101;
      uint64_t v61 = v102;
      (*(void (**)(char *, uint64_t))(v58 + 8))(v101, v102);
      uint64_t v63 = *(void (**)(char *, char *, uint64_t))(v58 + 32);
      v63(v62, v74, v61);
      goto LABEL_17;
    case 4:
      uint64_t v77 = *(void (**)(char *, void, uint64_t))(v91 + 104);
      v77(v93, *MEMORY[0x263F078A8], v92);
      v77(v35, *MEMORY[0x263F078A0], v59);
      uint64_t v72 = &v109;
LABEL_19:
      uint64_t v78 = *(v72 - 32);
      sub_24D218B50();
      uint64_t v79 = *(void (**)(char *, uint64_t))(v57 + 8);
      v79(v35, v59);
      (*(void (**)(char *, uint64_t))(v41 + 8))(v94, v15);
      (*(void (**)(char *, uint64_t))(v100 + 8))(v37, v99);
      uint64_t v62 = v101;
      uint64_t v61 = v102;
      (*(void (**)(char *, uint64_t))(v58 + 8))(v101, v102);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v58 + 48))(v78, 1, v61) == 1)
      {
        v79(v93, v59);
        uint64_t v70 = v78;
LABEL_21:
        sub_24D1D9A80(v70, &qword_26B18A610);
        uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985C398);
        uint64_t v53 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v52 - 8) + 56);
        uint64_t v54 = v98;
        goto LABEL_10;
      }
      uint64_t v63 = *(void (**)(char *, char *, uint64_t))(v58 + 32);
      v63(v62, (char *)v78, v61);
LABEL_24:
      uint64_t v76 = v98;
      uint64_t v64 = v93;
LABEL_25:
      uint64_t v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985C398);
      uint64_t v82 = (char *)(v76 + *(int *)(v81 + 48));
      (*(void (**)(uint64_t, char *, uint64_t))(v57 + 32))(v76, v64, v59);
      v63(v82, v62, v61);
      uint64_t v53 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v81 - 8) + 56);
      uint64_t v54 = v76;
      uint64_t v55 = 0;
      uint64_t v52 = v81;
      break;
    default:
      uint64_t v60 = v88;
      sub_24D218F90();
      (*(void (**)(char *, uint64_t))(v41 + 8))(v94, v15);
      (*(void (**)(char *, uint64_t))(v100 + 8))(v37, v99);
      uint64_t v62 = v101;
      uint64_t v61 = v102;
      (*(void (**)(char *, uint64_t))(v58 + 8))(v101, v102);
      uint64_t v63 = *(void (**)(char *, char *, uint64_t))(v58 + 32);
      v63(v62, v60, v61);
      uint64_t v64 = v93;
      (*(void (**)(char *, void, uint64_t))(v57 + 104))(v93, *MEMORY[0x263F07890], v59);
LABEL_17:
      uint64_t v76 = v98;
      goto LABEL_25;
  }
  return v53(v54, v55, 1, v52);
}

uint64_t EnergySite.historicalEnergyUsageInterval(interval:start:end:timezone:utilityID:subscriptionID:)(uint64_t a1, unsigned char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v9 + 136) = v16;
  *(void *)(v9 + 144) = v8;
  *(void *)(v9 + 120) = a7;
  *(void *)(v9 + 128) = a8;
  *(void *)(v9 + 104) = a5;
  *(void *)(v9 + 112) = a6;
  *(void *)(v9 + 88) = a3;
  *(void *)(v9 + 96) = a4;
  *(void *)(v9 + 80) = a1;
  uint64_t v11 = sub_24D219020();
  *(void *)(v9 + 152) = v11;
  *(void *)(v9 + 160) = *(void *)(v11 - 8);
  *(void *)(v9 + 168) = swift_task_alloc();
  *(void *)(v9 + 176) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985C3B0);
  *(void *)(v9 + 184) = swift_task_alloc();
  *(void *)(v9 + 192) = swift_task_alloc();
  *(void *)(v9 + 200) = swift_task_alloc();
  *(void *)(v9 + 208) = swift_task_alloc();
  *(void *)(v9 + 216) = swift_task_alloc();
  *(void *)(v9 + 224) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A610);
  *(void *)(v9 + 232) = swift_task_alloc();
  *(void *)(v9 + 240) = swift_task_alloc();
  uint64_t v12 = sub_24D218AC0();
  *(void *)(v9 + 248) = v12;
  *(void *)(v9 + 256) = *(void *)(v12 - 8);
  *(void *)(v9 + 264) = swift_task_alloc();
  *(void *)(v9 + 272) = swift_task_alloc();
  *(void *)(v9 + 280) = swift_task_alloc();
  *(void *)(v9 + 288) = swift_task_alloc();
  *(void *)(v9 + 296) = *(void *)(type metadata accessor for EnergySite.EnergyUsage(0) - 8);
  *(void *)(v9 + 304) = swift_task_alloc();
  *(void *)(v9 + 312) = swift_task_alloc();
  *(void *)(v9 + 320) = swift_task_alloc();
  *(void *)(v9 + 328) = swift_task_alloc();
  *(void *)(v9 + 336) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985C3B8);
  *(void *)(v9 + 344) = swift_task_alloc();
  *(void *)(v9 + 352) = swift_task_alloc();
  uint64_t v13 = sub_24D218CF0();
  *(void *)(v9 + 360) = v13;
  *(void *)(v9 + 368) = *(void *)(v13 - 8);
  *(void *)(v9 + 376) = swift_task_alloc();
  *(void *)(v9 + 384) = swift_task_alloc();
  *(void *)(v9 + 392) = swift_task_alloc();
  *(void *)(v9 + 400) = swift_task_alloc();
  *(void *)(v9 + 408) = swift_task_alloc();
  *(void *)(v9 + 416) = __swift_instantiateConcreteTypeFromMangledName(&qword_26985C3C0);
  *(void *)(v9 + 424) = swift_task_alloc();
  *(void *)(v9 + 432) = swift_task_alloc();
  *(void *)(v9 + 440) = swift_task_alloc();
  *(void *)(v9 + 448) = swift_task_alloc();
  *(void *)(v9 + 456) = swift_task_alloc();
  *(void *)(v9 + 464) = swift_task_alloc();
  *(void *)(v9 + 472) = swift_task_alloc();
  *(void *)(v9 + 480) = swift_task_alloc();
  *(void *)(v9 + 488) = swift_task_alloc();
  *(void *)(v9 + 496) = swift_task_alloc();
  *(void *)(v9 + 504) = swift_task_alloc();
  *(unsigned char *)(v9 + 576) = *a2;
  return MEMORY[0x270FA2498](sub_24D20DC04, 0, 0);
}

uint64_t sub_24D20DC04()
{
  char v1 = *(unsigned char *)(v0 + 576);
  uint64_t v2 = *(void *)(v0 + 144);
  long long v9 = *(_OWORD *)(v0 + 112);
  long long v10 = *(_OWORD *)(v0 + 128);
  uint64_t v3 = *(void *)(v0 + 104);
  uint64_t v4 = swift_task_alloc();
  *(void *)(v0 + 512) = v4;
  long long v5 = *(_OWORD *)(v0 + 88);
  *(unsigned char *)(v4 + 16) = v1;
  *(_OWORD *)(v4 + 24) = v5;
  *(_OWORD *)(v4 + 40) = v10;
  *(_OWORD *)(v4 + 56) = v9;
  *(void *)(v4 + 72) = v3;
  *(void *)(v4 + 80) = v2;
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v0 + 520) = v6;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985C3C8);
  *(void *)(v0 + 528) = v7;
  *uint64_t v6 = v0;
  v6[1] = sub_24D20DD44;
  return MEMORY[0x270FA2360](v0 + 64, 0, 0, 0xD000000000000054, 0x800000024D21C8B0, sub_24D21168C, v4, v7);
}

uint64_t sub_24D20DD44()
{
  *(void *)(*(void *)v1 + 536) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_24D20FF70;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_24D20DE60;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D20DE60(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, uint64_t (*a6)(uint64_t a1), uint64_t a7, uint64_t a8)
{
  uint64_t v117 = v8;
  int64_t v9 = 0;
  uint64_t v10 = v8[8];
  uint64_t v11 = *(void *)(v10 + 64);
  uint64_t v92 = v10 + 64;
  uint64_t v12 = -1;
  uint64_t v101 = v8[8];
  uint64_t v13 = -1 << *(unsigned char *)(v101 + 32);
  uint64_t v104 = v8[52];
  if (-v13 < 64) {
    uint64_t v12 = ~(-1 << -(char)v13);
  }
  unint64_t v14 = v12 & v11;
  uint64_t v15 = v8[20];
  int64_t v93 = (unint64_t)(63 - v13) >> 6;
  uint64_t v98 = (void *)v8[32];
  uint64_t v103 = (void (**)(uint64_t, uint64_t))(v98 + 1);
  uint64_t v96 = (void (**)(uint64_t, uint64_t))(v15 + 8);
  uint64_t v97 = (void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16);
  uint64_t v90 = v8[46];
  uint64_t v91 = (uint64_t (**)(uint64_t, uint64_t, uint64_t))(v90 + 32);
  uint64_t v16 = (void *)MEMORY[0x263F8EE80];
  uint64_t v17 = (void *)v8[67];
  while (2)
  {
    for (i = (uint64_t)v16; ; uint64_t v16 = (void *)i)
    {
      *(void *)(v115 + 544) = v16;
      uint64_t v112 = v17;
      if (v14)
      {
        uint64_t v105 = (v14 - 1) & v14;
        int64_t v106 = v9;
        unint64_t v21 = __clz(__rbit64(v14)) | (v9 << 6);
      }
      else
      {
        int64_t v22 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
          __break(1u);
          goto LABEL_46;
        }
        if (v22 >= v93) {
          goto LABEL_39;
        }
        unint64_t v23 = *(void *)(v92 + 8 * v22);
        int64_t v24 = v9 + 1;
        if (!v23)
        {
          int64_t v24 = v9 + 2;
          if (v9 + 2 >= v93) {
            goto LABEL_39;
          }
          unint64_t v23 = *(void *)(v92 + 8 * v24);
          if (!v23)
          {
            int64_t v24 = v9 + 3;
            if (v9 + 3 >= v93) {
              goto LABEL_39;
            }
            unint64_t v23 = *(void *)(v92 + 8 * v24);
            if (!v23)
            {
              uint64_t v25 = v9 + 4;
              if (v9 + 4 >= v93)
              {
LABEL_39:
                char v84 = *(unsigned char *)(v115 + 576);
                uint64_t v85 = *(void *)(v115 + 144);
                long long v113 = *(_OWORD *)(v115 + 112);
                long long v114 = *(_OWORD *)(v115 + 128);
                uint64_t v86 = *(void *)(v115 + 104);
                long long v111 = *(_OWORD *)(v115 + 88);
                swift_release();
                uint64_t v87 = swift_task_alloc();
                *(void *)(v115 + 552) = v87;
                *(unsigned char *)(v87 + 16) = v84;
                *(_OWORD *)(v87 + 24) = v111;
                *(_OWORD *)(v87 + 40) = v114;
                *(_OWORD *)(v87 + 56) = v113;
                *(void *)(v87 + 72) = v86;
                *(void *)(v87 + 80) = v85;
                uint64_t v88 = (void *)swift_task_alloc();
                *(void *)(v115 + 560) = v88;
                *uint64_t v88 = v115;
                v88[1] = sub_24D20E830;
                a8 = *(void *)(v115 + 528);
                a5 = 0x800000024D21C8B0;
                a6 = sub_24D2116AC;
                a1 = v115 + 72;
                a2 = 0;
                a3 = 0;
                a4 = 0xD000000000000054;
                a7 = v87;
                return MEMORY[0x270FA2360](a1, a2, a3, a4, a5, a6, a7, a8);
              }
              unint64_t v23 = *(void *)(v92 + 8 * v25);
              if (!v23)
              {
                while (1)
                {
                  int64_t v24 = v25 + 1;
                  if (__OFADD__(v25, 1)) {
                    break;
                  }
                  if (v24 >= v93) {
                    goto LABEL_39;
                  }
                  unint64_t v23 = *(void *)(v92 + 8 * v24);
                  ++v25;
                  if (v23) {
                    goto LABEL_22;
                  }
                }
LABEL_46:
                __break(1u);
LABEL_47:
                __break(1u);
LABEL_48:
                __break(1u);
                return MEMORY[0x270FA2360](a1, a2, a3, a4, a5, a6, a7, a8);
              }
              int64_t v24 = v9 + 4;
            }
          }
        }
LABEL_22:
        uint64_t v105 = (v23 - 1) & v23;
        int64_t v106 = v24;
        unint64_t v21 = __clz(__rbit64(v23)) + (v24 << 6);
      }
      uint64_t v26 = *(void *)(v115 + 496);
      uint64_t v27 = *(void *)(v115 + 504);
      uint64_t v107 = *(void *)(v115 + 488);
      uint64_t v28 = *(void *)(v115 + 248);
      uint64_t v99 = v98[9];
      uint64_t v29 = (void (*)(uint64_t, unint64_t, uint64_t))v98[2];
      v29(v27, *(void *)(v101 + 48) + v99 * v21, v28);
      uint64_t v30 = (uint64_t *)(*(void *)(v101 + 56) + 16 * v21);
      uint64_t v31 = (uint64_t *)(v27 + *(int *)(v104 + 48));
      uint64_t v33 = *v30;
      unint64_t v32 = v30[1];
      *uint64_t v31 = *v30;
      v31[1] = v32;
      uint64_t v34 = (uint64_t *)(v26 + *(int *)(v104 + 48));
      uint64_t v35 = (void (*)(uint64_t, uint64_t, uint64_t))v98[4];
      v35(v26, v27, v28);
      *uint64_t v34 = v33;
      v34[1] = v32;
      uint64_t v36 = (uint64_t *)(v107 + *(int *)(v104 + 48));
      uint64_t v108 = (void (*)(uint64_t, uint64_t, uint64_t))v29;
      ((void (*)(void))v29)();
      *uint64_t v36 = v33;
      v36[1] = v32;
      sub_24D2189B0();
      swift_allocObject();
      sub_24D1DA208(v33, v32);
      sub_24D1DA208(v33, v32);
      sub_24D2189A0();
      sub_24D2154D0(&qword_26985C3D0, MEMORY[0x263F3B698]);
      sub_24D218990();
      uint64_t v37 = *(void *)(v115 + 488);
      if (!v112) {
        break;
      }
      v110 = v35;
      uint64_t v38 = *(void *)(v115 + 248);
      swift_release();
      uint64_t v109 = *v103;
      (*v103)(v37, v38);
      if (qword_26B18A2F8 != -1) {
        swift_once();
      }
      uint64_t v39 = *(void *)(v115 + 496);
      uint64_t v41 = *(void *)(v115 + 448);
      uint64_t v40 = *(void *)(v115 + 456);
      uint64_t v42 = *(void *)(v115 + 248);
      uint64_t v43 = *(void *)(v115 + 176);
      uint64_t v44 = *(void *)(v115 + 152);
      uint64_t v45 = __swift_project_value_buffer(v44, (uint64_t)qword_26B18A8F0);
      swift_beginAccess();
      (*v97)(v43, v45, v44);
      uint64_t v46 = (uint64_t *)(v40 + *(int *)(v104 + 48));
      v108(v40, v39, v42);
      uint64_t *v46 = v33;
      v46[1] = v32;
      sub_24D1DC0B8(v40, v41, &qword_26985C3C0);
      os_log_type_t v47 = sub_24D219000();
      os_log_type_t v48 = sub_24D2192D0();
      BOOL v49 = os_log_type_enabled(v47, v48);
      uint64_t v50 = *(void *)(v115 + 496);
      uint64_t v51 = *(void *)(v115 + 448);
      if (v49)
      {
        uint64_t v52 = *(void *)(v115 + 440);
        uint64_t v53 = *(void *)(v115 + 288);
        uint64_t v54 = *(void *)(v115 + 248);
        uint64_t v100 = *(void *)(v115 + 176);
        uint64_t v95 = *(void *)(v115 + 152);
        uint64_t v55 = swift_slowAlloc();
        uint64_t v94 = swift_slowAlloc();
        v116[0] = v94;
        *(_DWORD *)uint64_t v55 = 136315138;
        v108(v52, v51, v54);
        v110(v53, v52, v54);
        sub_24D2154D0(&qword_26985C3A0, MEMORY[0x263F07490]);
        uint64_t v56 = sub_24D2194D0();
        uint64_t v57 = v50;
        unint64_t v59 = v58;
        v109(v53, v54);
        *(void *)(v55 + 4) = sub_24D1D0A78(v56, v59, v116);
        swift_bridgeObjectRelease();
        sub_24D1D9A80(v51, &qword_26985C3C0);
        _os_log_impl(&dword_24D1B6000, v47, v48, "Failed to decode entry for imports on %s", (uint8_t *)v55, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x253322AA0](v94, -1, -1);
        MEMORY[0x253322AA0](v55, -1, -1);

        (*v96)(v100, v95);
        uint64_t v20 = v57;
      }
      else
      {
        uint64_t v18 = *(void *)(v115 + 176);
        uint64_t v19 = *(void *)(v115 + 152);

        sub_24D1D9A80(v51, &qword_26985C3C0);
        (*v96)(v18, v19);
        uint64_t v20 = v50;
      }
      a1 = sub_24D1D9A80(v20, &qword_26985C3C0);
      uint64_t v17 = 0;
      unint64_t v14 = v105;
      int64_t v9 = v106;
    }
    uint64_t v61 = *(void *)(v115 + 400);
    uint64_t v60 = *(void *)(v115 + 408);
    uint64_t v62 = *(void *)(v115 + 360);
    sub_24D1DA1B0(v33, v32);
    swift_release();
    uint64_t v63 = *v91;
    (*v91)(v61, v60, v62);
    uint64_t v16 = (void *)i;
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v116[0] = i;
    unint64_t v65 = sub_24D1D1364(v37);
    uint64_t v66 = *(void *)(i + 16);
    BOOL v67 = (a2 & 1) == 0;
    a1 = v66 + v67;
    if (__OFADD__(v66, v67)) {
      goto LABEL_47;
    }
    char v68 = a2;
    if (*(void *)(i + 24) >= a1)
    {
      uint64_t v72 = (void (*)(unint64_t, uint64_t, uint64_t))v108;
      if (isUniquelyReferenced_nonNull_native)
      {
LABEL_33:
        uint64_t v73 = v99;
        if (v68)
        {
LABEL_34:
          (*(void (**)(unint64_t, void, void))(v90 + 40))(v16[7] + *(void *)(v90 + 72) * v65, *(void *)(v115 + 400), *(void *)(v115 + 360));
LABEL_38:
          uint64_t v81 = *(void *)(v115 + 488);
          uint64_t v82 = *(void *)(v115 + 496);
          uint64_t v83 = *(void *)(v115 + 248);
          swift_bridgeObjectRelease();
          (*v103)(v81, v83);
          a1 = sub_24D1D9A80(v82, &qword_26985C3C0);
          uint64_t v17 = 0;
          unint64_t v14 = v105;
          int64_t v9 = v106;
          continue;
        }
      }
      else
      {
        sub_24D1D2A0C();
        uint64_t v73 = v99;
        uint64_t v72 = (void (*)(unint64_t, uint64_t, uint64_t))v108;
        uint64_t v16 = (void *)v116[0];
        if (v68) {
          goto LABEL_34;
        }
      }
      uint64_t v74 = *(void *)(v115 + 488);
      uint64_t v75 = *(void *)(v115 + 400);
      uint64_t v76 = *(void *)(v115 + 360);
      uint64_t v77 = *(void *)(v115 + 248);
      v16[(v65 >> 6) + 8] |= 1 << v65;
      v72(v16[6] + v65 * v73, v74, v77);
      a1 = v63(v16[7] + *(void *)(v90 + 72) * v65, v75, v76);
      uint64_t v78 = v16[2];
      BOOL v79 = __OFADD__(v78, 1);
      uint64_t v80 = v78 + 1;
      if (!v79)
      {
        v16[2] = v80;
        goto LABEL_38;
      }
      goto LABEL_48;
    }
    break;
  }
  uint64_t v69 = *(void *)(v115 + 488);
  sub_24D1D2080(a1, isUniquelyReferenced_nonNull_native);
  uint64_t v16 = (void *)v116[0];
  unint64_t v70 = sub_24D1D1364(v69);
  if ((v68 & 1) == (v71 & 1))
  {
    unint64_t v65 = v70;
    uint64_t v72 = (void (*)(unint64_t, uint64_t, uint64_t))v108;
    goto LABEL_33;
  }
  return sub_24D219520();
}

uint64_t sub_24D20E830()
{
  *(void *)(*(void *)v1 + 568) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_24D2101D8;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_24D20E94C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

void sub_24D20E94C()
{
  uint64_t v247 = v0;
  int64_t v1 = 0;
  uint64_t v2 = *(void *)(v0 + 72);
  uint64_t v3 = *(void *)(v2 + 64);
  uint64_t v211 = v2 + 64;
  uint64_t v220 = v2;
  uint64_t v4 = -1;
  uint64_t v5 = -1 << *(unsigned char *)(v220 + 32);
  if (-v5 < 64) {
    uint64_t v4 = ~(-1 << -(char)v5);
  }
  unint64_t v6 = v4 & v3;
  int64_t v212 = (unint64_t)(63 - v5) >> 6;
  v210 = (void *)MEMORY[0x263F8EE80];
  for (uint64_t i = *(void **)(v0 + 568); ; uint64_t i = 0)
  {
    v241 = i;
    if (v6)
    {
      uint64_t v228 = (v6 - 1) & v6;
      int64_t v230 = v1;
      unint64_t v13 = __clz(__rbit64(v6)) | (v1 << 6);
      unint64_t v14 = (void *)v245;
      goto LABEL_22;
    }
    int64_t v15 = v1 + 1;
    unint64_t v14 = (void *)v245;
    if (__OFADD__(v1, 1))
    {
      __break(1u);
      goto LABEL_92;
    }
    if (v15 >= v212) {
      goto LABEL_38;
    }
    unint64_t v16 = *(void *)(v211 + 8 * v15);
    int64_t v17 = v1 + 1;
    if (!v16)
    {
      int64_t v17 = v1 + 2;
      if (v1 + 2 >= v212) {
        goto LABEL_38;
      }
      unint64_t v16 = *(void *)(v211 + 8 * v17);
      if (!v16)
      {
        int64_t v17 = v1 + 3;
        if (v1 + 3 >= v212) {
          goto LABEL_38;
        }
        unint64_t v16 = *(void *)(v211 + 8 * v17);
        if (!v16) {
          break;
        }
      }
    }
LABEL_21:
    uint64_t v228 = (v16 - 1) & v16;
    int64_t v230 = v17;
    unint64_t v13 = __clz(__rbit64(v16)) + (v17 << 6);
LABEL_22:
    uint64_t v20 = v14[59];
    uint64_t v19 = v14[60];
    uint64_t v21 = v14[52];
    uint64_t v232 = v14[58];
    int64_t v24 = v14 + 31;
    uint64_t v23 = v14[31];
    int64_t v22 = (void *)v24[1];
    uint64_t v222 = v22[9];
    uint64_t v25 = (void (*)(uint64_t, unint64_t, uint64_t))v22[2];
    v25(v19, *(void *)(v220 + 48) + v222 * v13, v23);
    uint64_t v26 = (void (*)(uint64_t, uint64_t, uint64_t))v22[4];
    uint64_t v27 = (uint64_t *)(*(void *)(v220 + 56) + 16 * v13);
    uint64_t v28 = (uint64_t *)(v19 + *(int *)(v21 + 48));
    uint64_t v29 = *v27;
    unint64_t v30 = v27[1];
    uint64_t *v28 = *v27;
    v28[1] = v30;
    uint64_t v31 = (uint64_t *)(v20 + *(int *)(v21 + 48));
    v225 = v26;
    v26(v20, v19, v23);
    *uint64_t v31 = v29;
    v31[1] = v30;
    unint64_t v32 = (uint64_t *)(v232 + *(int *)(v21 + 48));
    v233 = v25;
    ((void (*)(void))v25)();
    uint64_t v33 = v29;
    uint64_t *v32 = v29;
    v32[1] = v30;
    sub_24D2189B0();
    swift_allocObject();
    sub_24D1DA208(v29, v30);
    sub_24D1DA208(v29, v30);
    sub_24D2189A0();
    sub_24D2154D0(&qword_26985C3D0, MEMORY[0x263F3B698]);
    sub_24D218990();
    uint64_t v34 = *(void *)(v245 + 464);
    if (!v241)
    {
      uint64_t v60 = v29;
      uint64_t v62 = *(void *)(v245 + 384);
      uint64_t v61 = *(void *)(v245 + 392);
      uint64_t v63 = *(void *)(v245 + 368);
      uint64_t v64 = *(void *)(v245 + 360);
      sub_24D1DA1B0(v60, v30);
      swift_release();
      unint64_t v65 = *(void (**)(uint64_t, uint64_t, uint64_t))(v63 + 32);
      v65(v62, v61, v64);
      int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v246[0] = v210;
      unint64_t v68 = sub_24D1D1364(v34);
      uint64_t v69 = v210[2];
      BOOL v70 = (v67 & 1) == 0;
      uint64_t v71 = v69 + v70;
      if (__OFADD__(v69, v70)) {
        goto LABEL_94;
      }
      char v72 = v67;
      if (v210[3] >= v71)
      {
        uint64_t v76 = (void (*)(unint64_t, uint64_t, uint64_t))v233;
        if (isUniquelyReferenced_nonNull_native) {
          goto LABEL_32;
        }
        sub_24D1D2A0C();
        uint64_t v77 = v222;
        uint64_t v76 = (void (*)(unint64_t, uint64_t, uint64_t))v233;
        v210 = v246[0];
        if ((v72 & 1) == 0) {
          goto LABEL_35;
        }
LABEL_33:
        uint64_t v78 = (void *)v245;
        (*(void (**)(unint64_t, void, void))(*(void *)(v245 + 368) + 40))(v210[7] + *(void *)(*(void *)(v245 + 368) + 72) * v68, *(void *)(v245 + 384), *(void *)(v245 + 360));
      }
      else
      {
        uint64_t v73 = *(void *)(v245 + 464);
        sub_24D1D2080(v71, isUniquelyReferenced_nonNull_native);
        v210 = v246[0];
        unint64_t v74 = sub_24D1D1364(v73);
        if ((v72 & 1) != (v75 & 1))
        {
          sub_24D219520();
          return;
        }
        unint64_t v68 = v74;
        uint64_t v76 = (void (*)(unint64_t, uint64_t, uint64_t))v233;
LABEL_32:
        uint64_t v77 = v222;
        if (v72) {
          goto LABEL_33;
        }
LABEL_35:
        uint64_t v79 = *(void *)(v245 + 464);
        uint64_t v80 = *(void *)(v245 + 384);
        uint64_t v81 = *(void *)(v245 + 360);
        uint64_t v82 = *(void *)(v245 + 368);
        uint64_t v83 = *(void *)(v245 + 248);
        v210[(v68 >> 6) + 8] |= 1 << v68;
        v76(v210[6] + v68 * v77, v79, v83);
        v65(v210[7] + *(void *)(v82 + 72) * v68, v80, v81);
        uint64_t v84 = v210[2];
        BOOL v85 = __OFADD__(v84, 1);
        uint64_t v86 = v84 + 1;
        if (v85) {
          goto LABEL_95;
        }
        v210[2] = v86;
        uint64_t v78 = (void *)v245;
      }
      uint64_t v87 = v78[58];
      uint64_t v88 = v78[59];
      uint64_t v89 = v78;
      uint64_t v90 = v78[32];
      uint64_t v91 = v89[31];
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v90 + 8))(v87, v91);
      uint64_t v12 = v88;
      goto LABEL_5;
    }
    uint64_t v36 = *(void *)(v245 + 248);
    uint64_t v35 = *(void *)(v245 + 256);
    swift_release();
    v223 = *(void (**)(uint64_t, uint64_t))(v35 + 8);
    v223(v34, v36);
    if (qword_26B18A2F8 != -1) {
      swift_once();
    }
    unint64_t v37 = *(void *)(v245 + 472);
    uint64_t v38 = *(void *)(v245 + 432);
    uint64_t v237 = *(void *)(v245 + 424);
    uint64_t v39 = *(void *)(v245 + 416);
    uint64_t v40 = *(void *)(v245 + 248);
    uint64_t v41 = *(void *)(v245 + 168);
    uint64_t v42 = *(void *)(v245 + 160);
    uint64_t v43 = *(void *)(v245 + 152);
    uint64_t v44 = __swift_project_value_buffer(v43, (uint64_t)qword_26B18A8F0);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v42 + 16))(v41, v44, v43);
    uint64_t v45 = (uint64_t *)(v38 + *(int *)(v39 + 48));
    v233(v38, v37, v40);
    *uint64_t v45 = v33;
    v45[1] = v30;
    sub_24D1DC0B8(v38, v237, &qword_26985C3C0);
    uint64_t v46 = sub_24D219000();
    os_log_type_t v47 = sub_24D2192D0();
    BOOL v48 = os_log_type_enabled(v46, v47);
    uint64_t v49 = *(void *)(v245 + 472);
    if (v48)
    {
      uint64_t v50 = *(void *)(v245 + 440);
      uint64_t v51 = *(void *)(v245 + 424);
      uint64_t v52 = *(void *)(v245 + 288);
      uint64_t v53 = *(void *)(v245 + 248);
      uint64_t v238 = *(void *)(v245 + 168);
      uint64_t v215 = *(void *)(v245 + 160);
      uint64_t v217 = *(void *)(v245 + 152);
      uint64_t v213 = *(void *)(v245 + 472);
      uint64_t v54 = swift_slowAlloc();
      uint64_t v55 = (void *)swift_slowAlloc();
      v246[0] = v55;
      *(_DWORD *)uint64_t v54 = 136315138;
      uint64_t v56 = v51;
      v233(v50, v51, v53);
      v225(v52, v50, v53);
      sub_24D2154D0(&qword_26985C3A0, MEMORY[0x263F07490]);
      uint64_t v57 = sub_24D2194D0();
      unint64_t v59 = v58;
      v223(v52, v53);
      *(void *)(v54 + 4) = sub_24D1D0A78(v57, v59, (uint64_t *)v246);
      swift_bridgeObjectRelease();
      sub_24D1D9A80(v56, &qword_26985C3C0);
      _os_log_impl(&dword_24D1B6000, v46, v47, "Failed to decode entry for exports on %s", (uint8_t *)v54, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x253322AA0](v55, -1, -1);
      MEMORY[0x253322AA0](v54, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v215 + 8))(v238, v217);
      uint64_t v12 = v213;
    }
    else
    {
      uint64_t v8 = *(void *)(v245 + 424);
      uint64_t v10 = *(void *)(v245 + 160);
      uint64_t v9 = *(void *)(v245 + 168);
      uint64_t v11 = *(void *)(v245 + 152);

      sub_24D1D9A80(v8, &qword_26985C3C0);
      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
      uint64_t v12 = v49;
    }
LABEL_5:
    sub_24D1D9A80(v12, &qword_26985C3C0);
    unint64_t v6 = v228;
    int64_t v1 = v230;
  }
  uint64_t v18 = v1 + 4;
  if (v1 + 4 >= v212)
  {
LABEL_38:
    uint64_t v92 = *(void *)(v245 + 544);
    swift_release();
    uint64_t v227 = v92;
    unint64_t v244 = sub_24D1D06F0(0, *(void *)(v92 + 16), 0, MEMORY[0x263F8EE78]);
    uint64_t v93 = *(void *)(v245 + 544);
    if (v210[2])
    {
      uint64_t v94 = swift_bridgeObjectRetain();
      uint64_t v95 = sub_24D1C59A8(v94);
      uint64_t v96 = swift_bridgeObjectRetain();
      sub_24D1C5EB4(v96, v95);
      uint64_t v97 = swift_bridgeObjectRetain();
      uint64_t v98 = (void *)sub_24D211710(v97);
      swift_bridgeObjectRelease();
      v246[0] = v98;
      sub_24D211E88(v246);
      if (!i)
      {
        swift_bridgeObjectRelease();
        uint64_t v99 = v246[0][2];
        if (v99)
        {
          uint64_t v214 = *(void *)(v245 + 544);
          uint64_t v100 = *(void *)(v245 + 368);
          uint64_t v221 = *(void *)(v245 + 296);
          uint64_t v101 = *(void *)(v245 + 256);
          uint64_t v102 = (char *)v246[0]
               + ((*(unsigned __int8 *)(v101 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v101 + 80));
          uint64_t v219 = *(void *)(v101 + 72);
          v242 = *(void (**)(uint64_t, char *, uint64_t))(v101 + 16);
          v224 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v101 + 48);
          v234 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v100 + 56);
          v216 = (void (**)(uint64_t, unint64_t, uint64_t))(v100 + 16);
          uint64_t v103 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v100 + 48);
          v235 = (void (**)(uint64_t, uint64_t))(v100 + 8);
          v226 = (void *)(v101 + 56);
          v239 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v100 + 48);
          while (1)
          {
            uint64_t v104 = v14[31];
            uint64_t v105 = v14[30];
            v242(v105, v102, v104);
            int64_t v106 = (void (*)(uint64_t, void, uint64_t, uint64_t))*v226;
            ((void (*)(uint64_t, void, uint64_t, uint64_t))*v226)(v105, 0, 1, v104);
            if ((*v224)(v105, 1, v104) == 1) {
              break;
            }
            (*(void (**)(void, void, void))(v14[32] + 32))(v14[35], v14[30], v14[31]);
            v218 = v106;
            uint64_t v229 = v99;
            if (*(void *)(v227 + 16) && (unint64_t v107 = sub_24D1D1364(v14[35]), (v108 & 1) != 0))
            {
              uint64_t v109 = v14[45];
              uint64_t v110 = v14[28];
              (*v216)(v110, *(void *)(v214 + 56) + *(void *)(v14[46] + 72) * v107, v109);
              long long v111 = *v234;
              (*v234)(v110, 0, 1, v109);
            }
            else
            {
              long long v111 = *v234;
              (*v234)(v14[28], 1, 1, v14[45]);
            }
            uint64_t v112 = v14[45];
            uint64_t v113 = v14[27];
            sub_24D1D9D68(v14[28], v113, &qword_26985C3B0);
            long long v114 = *v103;
            if ((*v103)(v113, 1, v112) == 1)
            {
              sub_24D1D9A80(v14[27], &qword_26985C3B0);
              double v115 = 0.0;
            }
            else
            {
              uint64_t v116 = v14[45];
              uint64_t v117 = v14[27];
              sub_24D218CE0();
              double v115 = v118;
              (*v235)(v117, v116);
            }
            uint64_t v119 = v14[45];
            uint64_t v120 = v14[26];
            sub_24D1D9D68(v14[28], v120, &qword_26985C3B0);
            if (v114(v120, 1, v119) == 1)
            {
              sub_24D1D9A80(v14[26], &qword_26985C3B0);
              uint64_t v121 = sub_24D1D62BC(MEMORY[0x263F8EE78]);
            }
            else
            {
              uint64_t v122 = v14[45];
              uint64_t v123 = v14[26];
              uint64_t v121 = sub_24D218CD0();
              (*v235)(v123, v122);
            }
            if (v210[2] && (unint64_t v124 = sub_24D1D1364(*(void *)(v245 + 280)), (v125 & 1) != 0))
            {
              (*v216)(*(void *)(v245 + 200), v210[7] + *(void *)(*(void *)(v245 + 368) + 72) * v124, *(void *)(v245 + 360));
              uint64_t v126 = 0;
            }
            else
            {
              uint64_t v126 = 1;
            }
            uint64_t v127 = *(void *)(v245 + 360);
            uint64_t v129 = *(void *)(v245 + 192);
            uint64_t v128 = *(void *)(v245 + 200);
            v111(v128, v126, 1, v127);
            sub_24D1D9D68(v128, v129, &qword_26985C3B0);
            if (v114(v129, 1, v127) == 1)
            {
              sub_24D1D9A80(*(void *)(v245 + 192), &qword_26985C3B0);
              double v130 = 0.0;
            }
            else
            {
              uint64_t v131 = *(void *)(v245 + 360);
              uint64_t v132 = *(void *)(v245 + 192);
              sub_24D218CE0();
              double v130 = v133;
              (*v235)(v132, v131);
            }
            uint64_t v134 = *(void *)(v245 + 360);
            uint64_t v135 = *(void *)(v245 + 184);
            sub_24D1D9D68(*(void *)(v245 + 200), v135, &qword_26985C3B0);
            if (v114(v135, 1, v134) == 1)
            {
              sub_24D1D9A80(*(void *)(v245 + 184), &qword_26985C3B0);
              uint64_t v136 = sub_24D1D62BC(MEMORY[0x263F8EE78]);
            }
            else
            {
              uint64_t v137 = *(void *)(v245 + 360);
              uint64_t v138 = *(void *)(v245 + 184);
              uint64_t v136 = sub_24D218CD0();
              (*v235)(v138, v137);
            }
            uint64_t v140 = *(void *)(v245 + 312);
            uint64_t v139 = *(void *)(v245 + 320);
            uint64_t v141 = *(void *)(v245 + 288);
            v242(v141, *(char **)(v245 + 280), *(void *)(v245 + 248));
            EnergySite.EnergyUsage.init(startTime:imports:exports:importsByPricingPeriod:exportsByPricingPeriod:subintervalCount:isValid:)(v141, v121, v136, 1, 1, v139, v115, v130);
            sub_24D1D64C8(v139, v140);
            uint64_t v142 = v244;
            unint64_t v144 = *(void *)(v244 + 16);
            unint64_t v143 = *(void *)(v244 + 24);
            if (v144 >= v143 >> 1) {
              uint64_t v142 = sub_24D1D06F0(v143 > 1, v144 + 1, 1, v244);
            }
            unint64_t v14 = (void *)v245;
            uint64_t v145 = *(void *)(v245 + 312);
            uint64_t v146 = *(void *)(v245 + 320);
            uint64_t v147 = *(void *)(v245 + 280);
            uint64_t v149 = *(void *)(v245 + 248);
            uint64_t v148 = *(void *)(v245 + 256);
            uint64_t v150 = *(void *)(v245 + 224);
            uint64_t v151 = *(void *)(v245 + 200);
            *(void *)(v142 + 16) = v144 + 1;
            unint64_t v244 = v142;
            sub_24D215208(v145, v142+ ((*(unsigned __int8 *)(v221 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v221 + 80))+ *(void *)(v221 + 72) * v144);
            sub_24D1D652C(v146);
            sub_24D1D9A80(v151, &qword_26985C3B0);
            sub_24D1D9A80(v150, &qword_26985C3B0);
            (*(void (**)(uint64_t, uint64_t))(v148 + 8))(v147, v149);
            v102 += v219;
            uint64_t v99 = v229 - 1;
            uint64_t v103 = v239;
            if (v229 == 1)
            {
              v218(*(void *)(v245 + 240), 1, 1, *(void *)(v245 + 248));
              break;
            }
          }
        }
        else
        {
          (*(void (**)(void, uint64_t, uint64_t, void))(*(void *)(v245 + 256) + 56))(*(void *)(v245 + 240), 1, 1, *(void *)(v245 + 248));
        }
LABEL_79:
        swift_release();
        if (*(void *)(v244 + 16))
        {
          uint64_t v183 = v14[38];
          uint64_t v184 = v14[31];
          uint64_t v185 = v14[32];
          uint64_t v186 = v14[29];
          uint64_t v187 = *(unsigned __int8 *)(v14[37] + 80);
          sub_24D1D64C8(v244 + ((v187 + 32) & ~v187), v183);
          uint64_t v188 = *(void (**)(uint64_t, uint64_t, uint64_t))(v185 + 16);
          v188(v186, v183, v184);
          sub_24D1D652C(v183);
          (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v185 + 56))(v186, 0, 1, v184);
        }
        else
        {
          uint64_t v189 = v14[32];
          (*(void (**)(void, uint64_t, uint64_t, void))(v189 + 56))(v14[29], 1, 1, v14[31]);
          uint64_t v188 = *(void (**)(uint64_t, uint64_t, uint64_t))(v189 + 16);
        }
        uint64_t v190 = v14[32];
        uint64_t v191 = v14[31];
        uint64_t v192 = v14[29];
        v188(v14[33], v14[11], v191);
        int v193 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v190 + 48))(v192, 1, v191);
        uint64_t v194 = v14[33];
        uint64_t v195 = v14[34];
        uint64_t v196 = v14[31];
        uint64_t v197 = v14[32];
        uint64_t v198 = v14[29];
        if (v193 == 1)
        {
          v199 = *(void (**)(uint64_t, uint64_t, uint64_t))(v197 + 32);
          v199(v195, v194, v196);
          sub_24D1D9A80(v198, &qword_26B18A610);
        }
        else
        {
          (*(void (**)(void, void))(v197 + 8))(v14[33], v14[31]);
          v199 = *(void (**)(uint64_t, uint64_t, uint64_t))(v197 + 32);
          v199(v195, v198, v196);
        }
        char v200 = *(unsigned char *)(v245 + 576);
        uint64_t v201 = *(void *)(v245 + 272);
        uint64_t v202 = *(void *)(v245 + 248);
        uint64_t v203 = *(unsigned char **)(v245 + 80);
        v204 = (int *)type metadata accessor for EnergySite.HistoricalEnergyUsage(0);
        v205 = &v203[v204[7]];
        *(void *)v205 = 0;
        v205[8] = 1;
        v206 = &v203[v204[8]];
        *(void *)v206 = 0;
        v206[8] = 1;
        *uint64_t v203 = v200;
        v199((uint64_t)&v203[v204[5]], v201, v202);
        *(void *)&v203[v204[6]] = v244;
        uint64_t v207 = &v203[v204[9]];
        *(void *)uint64_t v207 = 0;
        v207[8] = 0;
        v208 = &v203[v204[10]];
        *(void *)v208 = 0;
        v208[8] = 0;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        uint64_t v209 = *(void (**)(void))(v245 + 8);
        v209();
        return;
      }
    }
    else
    {
      swift_bridgeObjectRetain_n();
      v152 = (void *)sub_24D211844(v93);
      swift_bridgeObjectRelease();
      v246[0] = v152;
      sub_24D211F30(v246);
      if (!i)
      {
        uint64_t v153 = *(void *)(v245 + 368);
        uint64_t v240 = *(void *)(v245 + 296);
        swift_bridgeObjectRelease();
        unint64_t v154 = 0;
        uint64_t v155 = v246[0];
        unint64_t v156 = v246[0][2];
        v236 = (void (**)(uint64_t, uint64_t))(v153 + 8);
        v231 = v246[0];
        if (v156) {
          goto LABEL_71;
        }
LABEL_70:
        uint64_t v157 = v14[43];
        uint64_t v158 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985C3D8);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v158 - 8) + 56))(v157, 1, 1, v158);
        unint64_t v159 = v156;
        while (1)
        {
          uint64_t v163 = v14[44];
          sub_24D1DC0B8(v14[43], v163, &qword_26985C3B8);
          uint64_t v164 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985C3D8);
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v164 - 8) + 48))(v163, 1, v164) == 1)goto LABEL_79; {
          unint64_t v243 = v159;
          }
          unint64_t v165 = v156;
          uint64_t v166 = v14[44];
          uint64_t v167 = v14[41];
          uint64_t v168 = v14[42];
          uint64_t v169 = v14[36];
          uint64_t v171 = v14[31];
          uint64_t v170 = v14[32];
          (*(void (**)(void, uint64_t, void))(v14[46] + 32))(v14[47], v166 + *(int *)(v164 + 48), v14[45]);
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v170 + 32))(v169, v166, v171);
          sub_24D218CE0();
          double v173 = v172;
          uint64_t v174 = sub_24D218CD0();
          unint64_t v175 = sub_24D1D62A4(MEMORY[0x263F8EE78]);
          EnergySite.EnergyUsage.init(startTime:imports:exports:importsByPricingPeriod:exportsByPricingPeriod:subintervalCount:isValid:)(v169, v174, v175, 1, 1, v168, v173, 0.0);
          sub_24D1D64C8(v168, v167);
          uint64_t v176 = v244;
          unint64_t v178 = *(void *)(v244 + 16);
          unint64_t v177 = *(void *)(v244 + 24);
          if (v178 >= v177 >> 1) {
            uint64_t v176 = sub_24D1D06F0(v177 > 1, v178 + 1, 1, v244);
          }
          unint64_t v156 = v165;
          unint64_t v14 = (void *)v245;
          uint64_t v179 = *(void *)(v245 + 376);
          uint64_t v180 = *(void *)(v245 + 360);
          uint64_t v181 = *(void *)(v245 + 328);
          uint64_t v182 = *(void *)(v245 + 336);
          *(void *)(v176 + 16) = v178 + 1;
          unint64_t v244 = v176;
          sub_24D215208(v181, v176+ ((*(unsigned __int8 *)(v240 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v240 + 80))+ *(void *)(v240 + 72) * v178);
          sub_24D1D652C(v182);
          (*v236)(v179, v180);
          uint64_t v155 = v231;
          unint64_t v154 = v243;
          if (v243 == v165) {
            goto LABEL_70;
          }
LABEL_71:
          if (v154 >= v155[2]) {
            goto LABEL_93;
          }
          uint64_t v160 = v14[43];
          uint64_t v161 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985C3D8);
          uint64_t v162 = *(void *)(v161 - 8);
          sub_24D1D9D68((uint64_t)v155+ ((*(unsigned __int8 *)(v162 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v162 + 80))+ *(void *)(v162 + 72) * v154, v160, &qword_26985C3D8);
          unint64_t v159 = v154 + 1;
          (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v162 + 56))(v160, 0, 1, v161);
        }
      }
    }
    swift_release();
    return;
  }
  unint64_t v16 = *(void *)(v211 + 8 * v18);
  if (v16)
  {
    int64_t v17 = v1 + 4;
    goto LABEL_21;
  }
  while (1)
  {
    int64_t v17 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v17 >= v212) {
      goto LABEL_38;
    }
    unint64_t v16 = *(void *)(v211 + 8 * v17);
    ++v18;
    if (v16) {
      goto LABEL_21;
    }
  }
LABEL_92:
  __break(1u);
LABEL_93:
  __break(1u);
LABEL_94:
  __break(1u);
LABEL_95:
  __break(1u);
}

uint64_t sub_24D20FF70()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  int64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24D2101D8()
{
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  int64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24D21044C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 200) = v15;
  *(_OWORD *)(v8 + 184) = v14;
  *(_OWORD *)(v8 + 168) = v13;
  *(void *)(v8 + 152) = a7;
  *(void *)(v8 + 160) = a8;
  *(unsigned char *)(v8 + 312) = a5;
  *(void *)(v8 + 136) = a4;
  *(void *)(v8 + 144) = a6;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985C3F0);
  *(void *)(v8 + 208) = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  *(void *)(v8 + 216) = v10;
  *(void *)(v8 + 224) = *(void *)(v10 + 64);
  *(void *)(v8 + 232) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D210538, 0, 0);
}

uint64_t sub_24D210538()
{
  uint64_t v1 = v0[29];
  uint64_t v2 = v0[26];
  uint64_t v3 = v0[27];
  uint64_t v4 = v0[17];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[30] = sub_24D217288();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v6 + v5, v1, v2);
  id v18 = (id)sub_24D217944((uint64_t)sub_24D2154CC, v6);
  v0[31] = v18;
  swift_release();
  uint64_t v7 = v0[25];
  uint64_t v17 = sub_24D2190E0();
  v0[32] = v17;
  swift_bridgeObjectRelease();
  uint64_t v8 = sub_24D218A40();
  v0[33] = v8;
  uint64_t v9 = sub_24D218A40();
  v0[34] = v9;
  uint64_t v10 = sub_24D2190E0();
  v0[35] = v10;
  uint64_t v11 = sub_24D2190E0();
  v0[36] = v11;
  uint64_t v12 = sub_24D218BA0();
  v0[37] = v12;
  id v13 = *(id *)(v7 + 16);
  sub_24D218E60();

  uint64_t v14 = sub_24D2190E0();
  v0[38] = v14;
  swift_bridgeObjectRelease();
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_24D210808;
  uint64_t v15 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_24D2108E8;
  v0[13] = &block_descriptor_16_0;
  v0[14] = v15;
  objc_msgSend(v18, sel_leanHistoricalEnergyUsageWithInterval_start_end_subscriptionID_utilityID_timeZone_flowDirection_siteID_completionHandler_, v17, v8, v9, v10, v11, v12, 1, v14, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_24D210808()
{
  return MEMORY[0x270FA2498](sub_24D215ACC, 0, 0);
}

uint64_t sub_24D2108E8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    sub_24D218AC0();
    sub_24D2154D0(&qword_26985BD88, MEMORY[0x263F07490]);
    uint64_t v3 = sub_24D219040();
  }
  else
  {
    uint64_t v3 = 0;
  }
  uint64_t v5 = v3;
  sub_24D1DC0B8((uint64_t)&v5, *(void *)(*(void *)(v2 + 64) + 40), &qword_26985C408);
  return swift_continuation_resume();
}

uint64_t sub_24D2109B4(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v63 = a6;
  uint64_t v64 = a7;
  uint64_t v62 = a5;
  uint64_t v54 = a1;
  uint64_t v55 = a3;
  int v61 = a2;
  uint64_t v66 = a8;
  uint64_t v67 = a12;
  uint64_t v60 = a11;
  uint64_t v65 = a10;
  uint64_t v57 = a4;
  uint64_t v58 = a9;
  uint64_t v12 = sub_24D218BB0();
  uint64_t v69 = *(void *)(v12 - 8);
  uint64_t v70 = v12;
  uint64_t v59 = *(void *)(v69 + 64);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v48 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = v14;
  uint64_t v68 = sub_24D218AC0();
  uint64_t v15 = *(void *)(v68 - 8);
  uint64_t v16 = *(void *)(v15 + 64);
  uint64_t v17 = MEMORY[0x270FA5388](v68);
  uint64_t v52 = (char *)&v48 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (char *)&v48 - v18;
  uint64_t v51 = (char *)&v48 - v18;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985C3F0);
  uint64_t v49 = v20;
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = *(void *)(v21 + 64);
  MEMORY[0x270FA5388](v20);
  uint64_t v50 = (char *)&v48 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5B0);
  MEMORY[0x270FA5388](v23 - 8);
  uint64_t v25 = (char *)&v48 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = v25;
  uint64_t v26 = sub_24D219240();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v25, 1, 1, v26);
  (*(void (**)(char *, uint64_t, uint64_t))(v21 + 16))((char *)&v48 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0), v54, v20);
  uint64_t v48 = v15;
  uint64_t v27 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
  uint64_t v28 = v19;
  uint64_t v29 = v68;
  v27(v28, v55, v68);
  v27((char *)&v48 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), v57, v29);
  uint64_t v30 = v69;
  (*(void (**)(char *, uint64_t, uint64_t))(v69 + 16))(v14, v58, v70);
  unint64_t v31 = (*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  uint64_t v32 = v31 + v22;
  uint64_t v33 = *(unsigned __int8 *)(v15 + 80);
  uint64_t v34 = (v33 + v31 + v22 + 1) & ~v33;
  uint64_t v35 = (v16 + v33 + v34) & ~v33;
  unint64_t v36 = (v16 + v35 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v37 = (v36 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v38 = (*(unsigned __int8 *)(v30 + 80) + v37 + 16) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80);
  unint64_t v39 = (v59 + v38 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v40 = swift_allocObject();
  *(void *)(v40 + 16) = 0;
  *(void *)(v40 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v21 + 32))(v40 + v31, v50, v49);
  *(unsigned char *)(v40 + v32) = v61;
  uint64_t v41 = *(void (**)(uint64_t, char *, uint64_t))(v48 + 32);
  uint64_t v42 = v68;
  v41(v40 + v34, v51, v68);
  v41(v40 + v35, v52, v42);
  uint64_t v43 = (void *)(v40 + v36);
  uint64_t v44 = v63;
  *uint64_t v43 = v62;
  v43[1] = v44;
  uint64_t v45 = (void *)(v40 + v37);
  uint64_t v46 = v66;
  *uint64_t v45 = v64;
  v45[1] = v46;
  (*(void (**)(unint64_t, char *, uint64_t))(v69 + 32))(v40 + v38, v53, v70);
  *(void *)(v40 + v39) = v65;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_24D1BA610((uint64_t)v56, v67, v40);
  return swift_release();
}

uint64_t sub_24D210E2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 200) = v15;
  *(_OWORD *)(v8 + 184) = v14;
  *(_OWORD *)(v8 + 168) = v13;
  *(void *)(v8 + 152) = a7;
  *(void *)(v8 + 160) = a8;
  *(unsigned char *)(v8 + 312) = a5;
  *(void *)(v8 + 136) = a4;
  *(void *)(v8 + 144) = a6;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985C3F0);
  *(void *)(v8 + 208) = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  *(void *)(v8 + 216) = v10;
  *(void *)(v8 + 224) = *(void *)(v10 + 64);
  *(void *)(v8 + 232) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D210F18, 0, 0);
}

uint64_t sub_24D210F18()
{
  uint64_t v1 = v0[29];
  uint64_t v2 = v0[26];
  uint64_t v3 = v0[27];
  uint64_t v4 = v0[17];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[30] = sub_24D217288();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v6 + v5, v1, v2);
  id v18 = (id)sub_24D217944((uint64_t)sub_24D2154CC, v6);
  v0[31] = v18;
  swift_release();
  uint64_t v7 = v0[25];
  uint64_t v17 = sub_24D2190E0();
  v0[32] = v17;
  swift_bridgeObjectRelease();
  uint64_t v8 = sub_24D218A40();
  v0[33] = v8;
  uint64_t v9 = sub_24D218A40();
  v0[34] = v9;
  uint64_t v10 = sub_24D2190E0();
  v0[35] = v10;
  uint64_t v11 = sub_24D2190E0();
  v0[36] = v11;
  uint64_t v12 = sub_24D218BA0();
  v0[37] = v12;
  id v13 = *(id *)(v7 + 16);
  sub_24D218E60();

  uint64_t v14 = sub_24D2190E0();
  v0[38] = v14;
  swift_bridgeObjectRelease();
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_24D2111E8;
  uint64_t v15 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_24D2108E8;
  v0[13] = &block_descriptor_2;
  v0[14] = v15;
  objc_msgSend(v18, sel_leanHistoricalEnergyUsageWithInterval_start_end_subscriptionID_utilityID_timeZone_flowDirection_siteID_completionHandler_, v17, v8, v9, v10, v11, v12, 2, v14, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_24D2111E8()
{
  return MEMORY[0x270FA2498](sub_24D2112C8, 0, 0);
}

uint64_t sub_24D2112C8()
{
  uint64_t v2 = (void *)v0[37];
  uint64_t v1 = (void *)v0[38];
  uint64_t v4 = (void *)v0[35];
  uint64_t v3 = (void *)v0[36];
  unint64_t v5 = (void *)v0[33];
  uint64_t v6 = (void *)v0[34];
  uint64_t v7 = (void *)v0[32];
  uint64_t v8 = v0[30];
  uint64_t v9 = v0[15];
  swift_unknownObjectRelease();

  objc_msgSend(*(id *)(v8 + 16), sel_invalidate);
  uint64_t v10 = MEMORY[0x263F8EE80];
  if (v9) {
    uint64_t v10 = v9;
  }
  v0[16] = v10;
  sub_24D219220();
  swift_release();
  swift_task_dealloc();
  uint64_t v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_24D2113C8(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_24D219020();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B18A2F8 != -1) {
    swift_once();
  }
  uint64_t v8 = __swift_project_value_buffer(v4, (uint64_t)qword_26B18A8F0);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  id v9 = a1;
  id v10 = a1;
  uint64_t v11 = sub_24D219000();
  os_log_type_t v12 = sub_24D2192D0();
  if (os_log_type_enabled(v11, v12))
  {
    void v20[2] = a2;
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v21 = (uint64_t)a1;
    uint64_t v22 = v14;
    *(_DWORD *)uint64_t v13 = 136315138;
    v20[1] = v13 + 4;
    id v15 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5D0);
    uint64_t v16 = sub_24D219100();
    uint64_t v21 = sub_24D1D0A78(v16, v17, &v22);
    sub_24D219310();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_24D1B6000, v11, v12, "Failed to get insights. %s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253322AA0](v14, -1, -1);
    MEMORY[0x253322AA0](v13, -1, -1);
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v22 = (uint64_t)a1;
  id v18 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985C3F0);
  return sub_24D219210();
}

uint64_t sub_24D21168C(uint64_t a1)
{
  return sub_24D2116CC(a1, (uint64_t)&unk_26FF7BD48, (uint64_t)&unk_26985C418);
}

uint64_t sub_24D2116AC(uint64_t a1)
{
  return sub_24D2116CC(a1, (uint64_t)&unk_26FF7BCF8, (uint64_t)&unk_26985C400);
}

uint64_t sub_24D2116CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24D2109B4(a1, *(unsigned __int8 *)(v3 + 16), *(void *)(v3 + 24), *(void *)(v3 + 32), *(void *)(v3 + 40), *(void *)(v3 + 48), *(void *)(v3 + 56), *(void *)(v3 + 64), *(void *)(v3 + 72), *(void *)(v3 + 80), a2, a3);
}

size_t sub_24D211710(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985BDB8);
  uint64_t v3 = *(void *)(sub_24D218AC0() - 8);
  uint64_t v4 = *(void *)(v3 + 72);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = (void *)swift_allocObject();
  size_t result = _swift_stdlib_malloc_size(v6);
  if (v4)
  {
    if (result - v5 != 0x8000000000000000 || v4 != -1)
    {
      v6[2] = v1;
      v6[3] = 2 * ((uint64_t)(result - v5) / v4);
      swift_bridgeObjectRetain();
      uint64_t v9 = sub_24D214A30(&v10, (char *)v6 + v5, v1, a1);
      sub_24D21526C();
      if (v9 == v1) {
        return (size_t)v6;
      }
      __break(1u);
      return MEMORY[0x263F8EE78];
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

size_t sub_24D211844(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985C3E0);
  uint64_t v3 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26985C3D8) - 8);
  uint64_t v4 = *(void *)(v3 + 72);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = (void *)swift_allocObject();
  size_t result = _swift_stdlib_malloc_size(v6);
  if (v4)
  {
    if (result - v5 != 0x8000000000000000 || v4 != -1)
    {
      v6[2] = v1;
      v6[3] = 2 * ((uint64_t)(result - v5) / v4);
      uint64_t v9 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26985C3D8) - 8);
      uint64_t v10 = sub_24D214E24(&v11, (uint64_t)v6 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80)), v1, a1);
      swift_bridgeObjectRetain();
      sub_24D21526C();
      if (v10 == v1) {
        return (size_t)v6;
      }
      __break(1u);
      return MEMORY[0x263F8EE78];
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_24D2119D8(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  if (!v9)
  {
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985C3E0);
  uint64_t v10 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26985C3D8) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_34;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26985C3D8) - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  id v18 = (char *)v13 + v17;
  uint64_t v19 = (char *)a4 + v17;
  if (a1)
  {
    if (v13 < a4 || v18 >= &v19[*(void *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v20 = *(void *)(v16 + 72) * v8;
  uint64_t v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = sub_24D2194A0();
  __break(1u);
  return result;
}

uint64_t sub_24D211C20(char a1, int64_t a2, char a3, void *a4)
{
  return sub_24D211C40(a1, a2, a3, a4, &qword_26985BE28, type metadata accessor for EnergySite.EnergyUsage);
}

uint64_t sub_24D211C40(char a1, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t (*a6)(void))
{
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v10 = a2;
      }
    }
  }
  else
  {
    int64_t v10 = a2;
  }
  uint64_t v11 = a4[2];
  if (v10 <= v11) {
    uint64_t v12 = a4[2];
  }
  else {
    uint64_t v12 = v10;
  }
  if (!v12)
  {
    uint64_t v16 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v13 = *(void *)(a6(0) - 8);
  uint64_t v14 = *(void *)(v13 + 72);
  unint64_t v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v16 = (void *)swift_allocObject();
  size_t v17 = _swift_stdlib_malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v17 - v15 == 0x8000000000000000 && v14 == -1) {
    goto LABEL_34;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  uint64_t v19 = *(void *)(a6(0) - 8);
  unint64_t v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  uint64_t v21 = (char *)v16 + v20;
  unint64_t v22 = (char *)a4 + v20;
  if (a1)
  {
    if (v16 < a4 || v21 >= &v22[*(void *)(v19 + 72) * v11])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v23 = *(void *)(v19 + 72) * v11;
  uint64_t v24 = &v21[v23];
  unint64_t v25 = (unint64_t)&v22[v23];
  if (v22 >= v24 || (unint64_t)v21 >= v25)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v16;
  }
LABEL_36:
  uint64_t result = sub_24D2194A0();
  __break(1u);
  return result;
}

uint64_t sub_24D211E88(void **a1)
{
  uint64_t v2 = *(void *)(sub_24D218AC0() - 8);
  uint64_t v3 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v3 = (void *)sub_24D2151B0(v3);
  }
  uint64_t v4 = v3[2];
  v6[0] = (char *)v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v6[1] = v4;
  uint64_t result = sub_24D211FDC(v6);
  *a1 = v3;
  return result;
}

uint64_t sub_24D211F30(void **a1)
{
  uint64_t v2 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26985C3D8) - 8);
  uint64_t v3 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v3 = (void *)sub_24D2151F4(v3);
  }
  uint64_t v4 = v3[2];
  v6[0] = (char *)v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v6[1] = v4;
  uint64_t result = sub_24D212B9C(v6);
  *a1 = v3;
  return result;
}

uint64_t sub_24D211FDC(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_24D218AC0();
  unint64_t v5 = *(void **)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v136 = (char *)&v131 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v151 = (char *)&v131 - v9;
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v146 = (char *)&v131 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v147 = (char *)&v131 - v12;
  uint64_t v13 = a1[1];
  uint64_t result = sub_24D2194C0();
  if (result >= v13)
  {
    if (v13 < 0) {
      goto LABEL_140;
    }
    if (v13) {
      return sub_24D2135F0(0, v13, 1, a1);
    }
    return result;
  }
  if (v13 >= 0) {
    uint64_t v15 = v13;
  }
  else {
    uint64_t v15 = v13 + 1;
  }
  if (v13 < -1) {
    goto LABEL_148;
  }
  uint64_t v149 = v4;
  uint64_t v150 = a1;
  uint64_t v133 = result;
  if (v13 < 2)
  {
    uint64_t v19 = (char *)MEMORY[0x263F8EE78];
    unint64_t v138 = MEMORY[0x263F8EE78]
         + ((*((unsigned __int8 *)v5 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v5 + 80));
    uint64_t v132 = MEMORY[0x263F8EE78];
    if (v13 != 1)
    {
      unint64_t v21 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_106:
      if (v21 >= 2)
      {
        uint64_t v125 = *v150;
        do
        {
          unint64_t v126 = v21 - 2;
          if (v21 < 2) {
            goto LABEL_135;
          }
          if (!v125) {
            goto LABEL_147;
          }
          uint64_t v127 = *(void *)&v19[16 * v126 + 32];
          uint64_t v128 = *(void *)&v19[16 * v21 + 24];
          sub_24D213B94(v125 + v5[9] * v127, v125 + v5[9] * *(void *)&v19[16 * v21 + 16], v125 + v5[9] * v128, v138);
          if (v2) {
            break;
          }
          if (v128 < v127) {
            goto LABEL_136;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v19 = sub_24D214A1C((uint64_t)v19);
          }
          if (v126 >= *((void *)v19 + 2)) {
            goto LABEL_137;
          }
          uint64_t v129 = &v19[16 * v126 + 32];
          *(void *)uint64_t v129 = v127;
          *((void *)v129 + 1) = v128;
          unint64_t v130 = *((void *)v19 + 2);
          if (v21 > v130) {
            goto LABEL_138;
          }
          memmove(&v19[16 * v21 + 16], &v19[16 * v21 + 32], 16 * (v130 - v21));
          *((void *)v19 + 2) = v130 - 1;
          unint64_t v21 = v130 - 1;
        }
        while (v130 > 2);
      }
LABEL_117:
      swift_bridgeObjectRelease();
      *(void *)(v132 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    uint64_t v16 = v15 >> 1;
    uint64_t v17 = sub_24D2191D0();
    *(void *)(v17 + 16) = v16;
    unint64_t v18 = (*((unsigned __int8 *)v5 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v5 + 80);
    uint64_t v132 = v17;
    unint64_t v138 = v17 + v18;
  }
  uint64_t v20 = 0;
  unint64_t v144 = (void (**)(char *, uint64_t))(v5 + 1);
  uint64_t v145 = v5 + 2;
  unint64_t v154 = (void (**)(char *, uint64_t, uint64_t))(v5 + 4);
  uint64_t v19 = (char *)MEMORY[0x263F8EE78];
  uint64_t v139 = v5;
  while (1)
  {
    uint64_t v22 = v20;
    uint64_t v23 = v20 + 1;
    uint64_t v137 = v20;
    if (v20 + 1 >= v13) {
      goto LABEL_37;
    }
    uint64_t v24 = v149;
    uint64_t v25 = *v150;
    uint64_t v141 = v25;
    uint64_t v142 = v20 + 1;
    uint64_t v153 = v139[9];
    uint64_t v26 = v153;
    uint64_t v27 = (void (*)(char *, uint64_t, uint64_t))v139[2];
    v27(v147, v25 + v153 * v23, v149);
    uint64_t v28 = v25 + v26 * v22;
    uint64_t v29 = v146;
    v27(v146, v28, v24);
    uint64_t v30 = sub_24D2154D0((unint64_t *)&qword_26985BC50, MEMORY[0x263F07490]);
    unint64_t v31 = v147;
    uint64_t v148 = v30;
    LODWORD(v152) = sub_24D2190B0();
    uint64_t v32 = v13;
    uint64_t v33 = (void (*)(char *, uint64_t))v139[1];
    uint64_t v34 = v29;
    uint64_t v22 = v137;
    v33(v34, v24);
    v33(v31, v24);
    uint64_t v35 = v153;
    uint64_t v23 = v22 + 2;
    uint64_t v143 = v32;
    if (v22 + 2 >= v32)
    {
      uint64_t v13 = v143;
      if ((v152 & 1) == 0) {
        goto LABEL_37;
      }
    }
    else
    {
      uint64_t v134 = v19;
      uint64_t v131 = v2;
      v142 *= v153;
      uint64_t v36 = v141;
      uint64_t v37 = v153 * v23;
      while (1)
      {
        uint64_t v38 = v23;
        unint64_t v39 = v147;
        uint64_t v40 = v149;
        v27(v147, v36 + v37, v149);
        uint64_t v41 = v146;
        v27(v146, v36 + v142, v40);
        int v42 = sub_24D2190B0();
        v33(v41, v40);
        v33(v39, v40);
        if ((v152 ^ v42)) {
          break;
        }
        uint64_t v23 = v38 + 1;
        uint64_t v35 = v153;
        v36 += v153;
        if (v143 == v38 + 1)
        {
          uint64_t v13 = v143;
          uint64_t v23 = v143;
          uint64_t v2 = v131;
          uint64_t v19 = v134;
          uint64_t v22 = v137;
          if (v152) {
            goto LABEL_25;
          }
          goto LABEL_37;
        }
      }
      uint64_t v2 = v131;
      uint64_t v19 = v134;
      uint64_t v23 = v38;
      uint64_t v22 = v137;
      uint64_t v13 = v143;
      uint64_t v35 = v153;
      if ((v152 & 1) == 0) {
        goto LABEL_37;
      }
    }
LABEL_25:
    if (v23 < v22) {
      goto LABEL_141;
    }
    if (v22 >= v23)
    {
LABEL_37:
      os_log_type_t v47 = v150;
      goto LABEL_38;
    }
    uint64_t v134 = v19;
    uint64_t v43 = 0;
    uint64_t v44 = v35 * (v23 - 1);
    uint64_t v45 = v23 * v35;
    uint64_t v46 = v22 * v35;
    os_log_type_t v47 = v150;
    uint64_t v148 = v23;
    do
    {
      if (v22 != v23 + v43 - 1)
      {
        uint64_t v49 = v141;
        if (!v141) {
          goto LABEL_146;
        }
        uint64_t v50 = v2;
        unint64_t v51 = v141 + v46;
        uint64_t v52 = (char *)(v141 + v44);
        v152 = *v154;
        v152(v136, v141 + v46, v149);
        if (v46 < v44 || v51 >= v49 + v45)
        {
          uint64_t v48 = v149;
          swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          uint64_t v48 = v149;
          if (v46 != v44) {
            swift_arrayInitWithTakeBackToFront();
          }
        }
        v152(v52, (uint64_t)v136, v48);
        uint64_t v2 = v50;
        os_log_type_t v47 = v150;
        uint64_t v23 = v148;
        uint64_t v35 = v153;
      }
      ++v22;
      --v43;
      v44 -= v35;
      v45 -= v35;
      v46 += v35;
    }
    while (v22 < v23 + v43);
    uint64_t v19 = v134;
    uint64_t v22 = v137;
    uint64_t v13 = v143;
LABEL_38:
    uint64_t v53 = v149;
    if (v23 >= v13) {
      goto LABEL_57;
    }
    if (__OFSUB__(v23, v22)) {
      goto LABEL_139;
    }
    if (v23 - v22 >= v133) {
      goto LABEL_57;
    }
    if (__OFADD__(v22, v133)) {
      goto LABEL_142;
    }
    uint64_t v54 = v22 + v133 >= v13 ? v13 : v22 + v133;
    if (v54 < v22) {
      break;
    }
    if (v23 != v54)
    {
      uint64_t v134 = v19;
      uint64_t v131 = v2;
      uint64_t v55 = v139[9];
      uint64_t v140 = (void (*)(char *, uint64_t, uint64_t))v139[2];
      uint64_t v141 = v55;
      uint64_t v56 = v55 * (v23 - 1);
      uint64_t v57 = v23 * v55;
      uint64_t v135 = v54;
      do
      {
        uint64_t v59 = 0;
        uint64_t v148 = v23;
        uint64_t v142 = v57;
        uint64_t v143 = v56;
        while (1)
        {
          uint64_t v60 = *v47;
          v152 = (void (*)(char *, uint64_t, uint64_t))(v57 + v59);
          uint64_t v153 = v22;
          uint64_t v61 = v57 + v59 + v60;
          uint64_t v62 = v147;
          uint64_t v63 = v47;
          uint64_t v64 = v140;
          v140(v147, v61, v53);
          uint64_t v65 = v56 + v59 + v60;
          uint64_t v66 = v146;
          v64(v146, v65, v53);
          sub_24D2154D0((unint64_t *)&qword_26985BC50, MEMORY[0x263F07490]);
          LOBYTE(v60) = sub_24D2190B0();
          uint64_t v67 = *v144;
          (*v144)(v66, v53);
          v67(v62, v53);
          if ((v60 & 1) == 0) {
            break;
          }
          uint64_t v68 = *v63;
          if (!*v63) {
            goto LABEL_144;
          }
          uint64_t v57 = v142;
          uint64_t v56 = v143;
          uint64_t v69 = (char *)(v68 + v143 + v59);
          uint64_t v70 = *v154;
          uint64_t v71 = v149;
          (*v154)(v151, v68 + v142 + v59, v149);
          uint64_t v53 = v71;
          swift_arrayInitWithTakeFrontToBack();
          v70(v69, (uint64_t)v151, v71);
          v59 -= v141;
          uint64_t v22 = v153 + 1;
          uint64_t v58 = v148;
          os_log_type_t v47 = v150;
          if (v148 == v153 + 1) {
            goto LABEL_49;
          }
        }
        uint64_t v58 = v148;
        uint64_t v53 = v149;
        os_log_type_t v47 = v63;
        uint64_t v57 = v142;
        uint64_t v56 = v143;
LABEL_49:
        uint64_t v23 = v58 + 1;
        v56 += v141;
        v57 += v141;
        uint64_t v22 = v137;
      }
      while (v23 != v135);
      uint64_t v23 = v135;
      uint64_t v2 = v131;
      uint64_t v19 = v134;
    }
LABEL_57:
    if (v23 < v22) {
      goto LABEL_134;
    }
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v148 = v23;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      uint64_t v19 = sub_24D21469C(0, *((void *)v19 + 2) + 1, 1, v19);
    }
    unint64_t v74 = *((void *)v19 + 2);
    unint64_t v73 = *((void *)v19 + 3);
    unint64_t v21 = v74 + 1;
    if (v74 >= v73 >> 1) {
      uint64_t v19 = sub_24D21469C((char *)(v73 > 1), v74 + 1, 1, v19);
    }
    *((void *)v19 + 2) = v21;
    char v75 = v19 + 32;
    uint64_t v76 = &v19[16 * v74 + 32];
    uint64_t v77 = v148;
    *(void *)uint64_t v76 = v22;
    *((void *)v76 + 1) = v77;
    if (v74)
    {
      while (1)
      {
        unint64_t v78 = v21 - 1;
        if (v21 >= 4)
        {
          uint64_t v83 = &v75[16 * v21];
          uint64_t v84 = *((void *)v83 - 8);
          uint64_t v85 = *((void *)v83 - 7);
          BOOL v89 = __OFSUB__(v85, v84);
          uint64_t v86 = v85 - v84;
          if (v89) {
            goto LABEL_123;
          }
          uint64_t v88 = *((void *)v83 - 6);
          uint64_t v87 = *((void *)v83 - 5);
          BOOL v89 = __OFSUB__(v87, v88);
          uint64_t v81 = v87 - v88;
          char v82 = v89;
          if (v89) {
            goto LABEL_124;
          }
          unint64_t v90 = v21 - 2;
          uint64_t v91 = &v75[16 * v21 - 32];
          uint64_t v93 = *(void *)v91;
          uint64_t v92 = *((void *)v91 + 1);
          BOOL v89 = __OFSUB__(v92, v93);
          uint64_t v94 = v92 - v93;
          if (v89) {
            goto LABEL_126;
          }
          BOOL v89 = __OFADD__(v81, v94);
          uint64_t v95 = v81 + v94;
          if (v89) {
            goto LABEL_129;
          }
          if (v95 >= v86)
          {
            uint64_t v113 = &v75[16 * v78];
            uint64_t v115 = *(void *)v113;
            uint64_t v114 = *((void *)v113 + 1);
            BOOL v89 = __OFSUB__(v114, v115);
            uint64_t v116 = v114 - v115;
            if (v89) {
              goto LABEL_133;
            }
            BOOL v106 = v81 < v116;
            goto LABEL_94;
          }
        }
        else
        {
          if (v21 != 3)
          {
            uint64_t v107 = *((void *)v19 + 4);
            uint64_t v108 = *((void *)v19 + 5);
            BOOL v89 = __OFSUB__(v108, v107);
            uint64_t v100 = v108 - v107;
            char v101 = v89;
            goto LABEL_88;
          }
          uint64_t v80 = *((void *)v19 + 4);
          uint64_t v79 = *((void *)v19 + 5);
          BOOL v89 = __OFSUB__(v79, v80);
          uint64_t v81 = v79 - v80;
          char v82 = v89;
        }
        if (v82) {
          goto LABEL_125;
        }
        unint64_t v90 = v21 - 2;
        uint64_t v96 = &v75[16 * v21 - 32];
        uint64_t v98 = *(void *)v96;
        uint64_t v97 = *((void *)v96 + 1);
        BOOL v99 = __OFSUB__(v97, v98);
        uint64_t v100 = v97 - v98;
        char v101 = v99;
        if (v99) {
          goto LABEL_128;
        }
        uint64_t v102 = &v75[16 * v78];
        uint64_t v104 = *(void *)v102;
        uint64_t v103 = *((void *)v102 + 1);
        BOOL v89 = __OFSUB__(v103, v104);
        uint64_t v105 = v103 - v104;
        if (v89) {
          goto LABEL_131;
        }
        if (__OFADD__(v100, v105)) {
          goto LABEL_132;
        }
        if (v100 + v105 >= v81)
        {
          BOOL v106 = v81 < v105;
LABEL_94:
          if (v106) {
            unint64_t v78 = v90;
          }
          goto LABEL_96;
        }
LABEL_88:
        if (v101) {
          goto LABEL_127;
        }
        uint64_t v109 = &v75[16 * v78];
        uint64_t v111 = *(void *)v109;
        uint64_t v110 = *((void *)v109 + 1);
        BOOL v89 = __OFSUB__(v110, v111);
        uint64_t v112 = v110 - v111;
        if (v89) {
          goto LABEL_130;
        }
        if (v112 < v100) {
          goto LABEL_14;
        }
LABEL_96:
        unint64_t v117 = v78 - 1;
        if (v78 - 1 >= v21)
        {
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
          goto LABEL_143;
        }
        if (!*v150) {
          goto LABEL_145;
        }
        double v118 = v19;
        uint64_t v119 = &v75[16 * v117];
        uint64_t v120 = *(void *)v119;
        uint64_t v121 = &v75[16 * v78];
        uint64_t v122 = *((void *)v121 + 1);
        sub_24D213B94(*v150 + v139[9] * *(void *)v119, *v150 + v139[9] * *(void *)v121, *v150 + v139[9] * v122, v138);
        if (v2) {
          goto LABEL_117;
        }
        if (v122 < v120) {
          goto LABEL_120;
        }
        if (v78 > *((void *)v118 + 2)) {
          goto LABEL_121;
        }
        uint64_t v123 = v118;
        *(void *)uint64_t v119 = v120;
        *(void *)&v75[16 * v117 + 8] = v122;
        unint64_t v124 = *((void *)v118 + 2);
        if (v78 >= v124) {
          goto LABEL_122;
        }
        uint64_t v19 = v123;
        unint64_t v21 = v124 - 1;
        memmove(&v75[16 * v78], v121 + 16, 16 * (v124 - 1 - v78));
        *((void *)v19 + 2) = v124 - 1;
        if (v124 <= 2) {
          goto LABEL_14;
        }
      }
    }
    unint64_t v21 = 1;
LABEL_14:
    uint64_t v13 = v150[1];
    uint64_t v20 = v148;
    unint64_t v5 = v139;
    if (v148 >= v13) {
      goto LABEL_106;
    }
  }
LABEL_143:
  __break(1u);
LABEL_144:
  __break(1u);
LABEL_145:
  __break(1u);
LABEL_146:
  __break(1u);
LABEL_147:
  __break(1u);
LABEL_148:
  uint64_t result = sub_24D219460();
  __break(1u);
  return result;
}

uint64_t sub_24D212B9C(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v130 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985C3D8);
  uint64_t v4 = *(void *)(v130 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v130);
  uint64_t v126 = (uint64_t)&v121 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v136 = (uint64_t)&v121 - v8;
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v133 = (uint64_t)&v121 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v132 = (uint64_t)&v121 - v11;
  uint64_t v12 = a1;
  uint64_t v13 = a1[1];
  uint64_t result = sub_24D2194C0();
  if (result >= v13)
  {
    if (v13 < 0) {
      goto LABEL_141;
    }
    if (v13) {
      return sub_24D213910(0, v13, 1, a1);
    }
    return result;
  }
  if (v13 >= 0) {
    uint64_t v15 = v13;
  }
  else {
    uint64_t v15 = v13 + 1;
  }
  if (v13 < -1) {
    goto LABEL_149;
  }
  uint64_t v129 = v4;
  uint64_t v123 = result;
  if (v13 < 2)
  {
    uint64_t v20 = (char *)MEMORY[0x263F8EE78];
    unint64_t v128 = MEMORY[0x263F8EE78]
         + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    uint64_t v19 = a1;
    uint64_t v122 = MEMORY[0x263F8EE78];
    if (v13 != 1)
    {
      unint64_t v22 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_107:
      uint64_t v114 = v20;
      if (v22 >= 2)
      {
        uint64_t v115 = *v19;
        do
        {
          unint64_t v116 = v22 - 2;
          if (v22 < 2) {
            goto LABEL_136;
          }
          if (!v115) {
            goto LABEL_148;
          }
          uint64_t v117 = *(void *)&v114[16 * v116 + 32];
          uint64_t v118 = *(void *)&v114[16 * v22 + 24];
          sub_24D2141C8(v115 + *(void *)(v129 + 72) * v117, v115 + *(void *)(v129 + 72) * *(void *)&v114[16 * v22 + 16], v115 + *(void *)(v129 + 72) * v118, v128);
          if (v2) {
            break;
          }
          if (v118 < v117) {
            goto LABEL_137;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v114 = sub_24D214A1C((uint64_t)v114);
          }
          if (v116 >= *((void *)v114 + 2)) {
            goto LABEL_138;
          }
          uint64_t v119 = &v114[16 * v116 + 32];
          *(void *)uint64_t v119 = v117;
          *((void *)v119 + 1) = v118;
          unint64_t v120 = *((void *)v114 + 2);
          if (v22 > v120) {
            goto LABEL_139;
          }
          memmove(&v114[16 * v22 + 16], &v114[16 * v22 + 32], 16 * (v120 - v22));
          *((void *)v114 + 2) = v120 - 1;
          unint64_t v22 = v120 - 1;
        }
        while (v120 > 2);
      }
LABEL_118:
      swift_bridgeObjectRelease();
      *(void *)(v122 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    uint64_t v16 = v15 >> 1;
    uint64_t v17 = sub_24D2191D0();
    *(void *)(v17 + 16) = v16;
    uint64_t v18 = *(unsigned __int8 *)(v4 + 80);
    uint64_t v122 = v17;
    unint64_t v128 = v17 + ((v18 + 32) & ~v18);
    uint64_t v19 = v12;
  }
  uint64_t v21 = 0;
  uint64_t v20 = (char *)MEMORY[0x263F8EE78];
  uint64_t v135 = v19;
  while (1)
  {
    uint64_t v23 = v21 + 1;
    uint64_t v127 = v21;
    if (v21 + 1 >= v13)
    {
      uint64_t v41 = v21 + 1;
      goto LABEL_58;
    }
    uint64_t v24 = *v19;
    uint64_t v25 = *(void *)(v129 + 72);
    uint64_t v26 = *v19 + v25 * v23;
    uint64_t v27 = v132;
    uint64_t v134 = v13;
    sub_24D1D9D68(v26, v132, &qword_26985C3D8);
    uint64_t v28 = v24 + v25 * v21;
    uint64_t v29 = v133;
    sub_24D1D9D68(v28, v133, &qword_26985C3D8);
    LODWORD(v131) = sub_24D218A60();
    uint64_t v30 = v29;
    uint64_t v21 = v127;
    sub_24D1D9A80(v30, &qword_26985C3D8);
    uint64_t v31 = v134;
    sub_24D1D9A80(v27, &qword_26985C3D8);
    uint64_t v32 = v21 + 2;
    uint64_t v125 = v24;
    uint64_t v137 = v25;
    if (v21 + 2 >= v31)
    {
      uint64_t v35 = v21 + 2;
      uint64_t v19 = v135;
      uint64_t v40 = v25;
      if ((v131 & 1) == 0) {
        goto LABEL_37;
      }
    }
    else
    {
      uint64_t v124 = v2;
      uint64_t v33 = v25 * v23;
      uint64_t v34 = v24;
      uint64_t v35 = v32;
      uint64_t v36 = v25 * v32;
      do
      {
        uint64_t v37 = v132;
        sub_24D1D9D68(v34 + v36, v132, &qword_26985C3D8);
        uint64_t v38 = v133;
        sub_24D1D9D68(v34 + v33, v133, &qword_26985C3D8);
        int v39 = sub_24D218A60();
        sub_24D1D9A80(v38, &qword_26985C3D8);
        sub_24D1D9A80(v37, &qword_26985C3D8);
        if ((v131 ^ v39))
        {
          uint64_t v31 = v134;
          uint64_t v19 = v135;
          uint64_t v2 = v124;
          uint64_t v24 = v125;
          uint64_t v21 = v127;
          uint64_t v40 = v137;
          if ((v131 & 1) == 0) {
            goto LABEL_37;
          }
          goto LABEL_24;
        }
        uint64_t v40 = v137;
        v34 += v137;
        ++v35;
        uint64_t v31 = v134;
      }
      while (v134 != v35);
      uint64_t v35 = v134;
      uint64_t v19 = v135;
      uint64_t v2 = v124;
      uint64_t v24 = v125;
      uint64_t v21 = v127;
      if ((v131 & 1) == 0)
      {
LABEL_37:
        uint64_t v41 = v35;
        break;
      }
    }
LABEL_24:
    if (v35 < v21) {
      goto LABEL_142;
    }
    uint64_t v41 = v35;
    if (v21 >= v35) {
      break;
    }
    uint64_t v124 = v2;
    uint64_t v42 = 0;
    uint64_t v43 = v40 * (v35 - 1);
    uint64_t v44 = v35 * v40;
    uint64_t v45 = v21 * v40;
    do
    {
      if (v21 != v41 + v42 - 1)
      {
        if (!v24) {
          goto LABEL_147;
        }
        uint64_t v131 = v24 + v43;
        sub_24D1DC0B8(v24 + v45, v126, &qword_26985C3D8);
        if (v45 < v43 || v24 + v45 >= (unint64_t)(v24 + v44))
        {
          uint64_t v46 = v131;
          swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          uint64_t v46 = v131;
          if (v45 != v43) {
            swift_arrayInitWithTakeBackToFront();
          }
        }
        sub_24D1DC0B8(v126, v46, &qword_26985C3D8);
        uint64_t v19 = v135;
        uint64_t v41 = v35;
        uint64_t v24 = v125;
        uint64_t v40 = v137;
      }
      ++v21;
      --v42;
      v43 -= v40;
      v44 -= v40;
      v45 += v40;
    }
    while (v21 < v41 + v42);
    uint64_t v2 = v124;
    uint64_t v21 = v127;
    uint64_t v31 = v134;
    if (v41 < v134) {
      goto LABEL_39;
    }
LABEL_58:
    if (v41 < v21) {
      goto LABEL_135;
    }
    uint64_t v60 = v19;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v134 = v41;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      uint64_t v20 = sub_24D21469C(0, *((void *)v20 + 2) + 1, 1, v20);
    }
    unint64_t v63 = *((void *)v20 + 2);
    unint64_t v62 = *((void *)v20 + 3);
    unint64_t v22 = v63 + 1;
    if (v63 >= v62 >> 1) {
      uint64_t v20 = sub_24D21469C((char *)(v62 > 1), v63 + 1, 1, v20);
    }
    uint64_t v19 = v60;
    uint64_t v64 = v2;
    *((void *)v20 + 2) = v22;
    uint64_t v65 = v20 + 32;
    uint64_t v66 = &v20[16 * v63 + 32];
    uint64_t v67 = v134;
    *(void *)uint64_t v66 = v127;
    *((void *)v66 + 1) = v67;
    if (v63)
    {
      while (1)
      {
        unint64_t v68 = v22 - 1;
        if (v22 >= 4)
        {
          unint64_t v73 = &v65[16 * v22];
          uint64_t v74 = *((void *)v73 - 8);
          uint64_t v75 = *((void *)v73 - 7);
          BOOL v79 = __OFSUB__(v75, v74);
          uint64_t v76 = v75 - v74;
          if (v79) {
            goto LABEL_124;
          }
          uint64_t v78 = *((void *)v73 - 6);
          uint64_t v77 = *((void *)v73 - 5);
          BOOL v79 = __OFSUB__(v77, v78);
          uint64_t v71 = v77 - v78;
          char v72 = v79;
          if (v79) {
            goto LABEL_125;
          }
          unint64_t v80 = v22 - 2;
          uint64_t v81 = &v65[16 * v22 - 32];
          uint64_t v83 = *(void *)v81;
          uint64_t v82 = *((void *)v81 + 1);
          BOOL v79 = __OFSUB__(v82, v83);
          uint64_t v84 = v82 - v83;
          if (v79) {
            goto LABEL_127;
          }
          BOOL v79 = __OFADD__(v71, v84);
          uint64_t v85 = v71 + v84;
          if (v79) {
            goto LABEL_130;
          }
          if (v85 >= v76)
          {
            uint64_t v103 = &v65[16 * v68];
            uint64_t v105 = *(void *)v103;
            uint64_t v104 = *((void *)v103 + 1);
            BOOL v79 = __OFSUB__(v104, v105);
            uint64_t v106 = v104 - v105;
            if (v79) {
              goto LABEL_134;
            }
            BOOL v96 = v71 < v106;
            goto LABEL_95;
          }
        }
        else
        {
          if (v22 != 3)
          {
            uint64_t v97 = *((void *)v20 + 4);
            uint64_t v98 = *((void *)v20 + 5);
            BOOL v79 = __OFSUB__(v98, v97);
            uint64_t v90 = v98 - v97;
            char v91 = v79;
            goto LABEL_89;
          }
          uint64_t v70 = *((void *)v20 + 4);
          uint64_t v69 = *((void *)v20 + 5);
          BOOL v79 = __OFSUB__(v69, v70);
          uint64_t v71 = v69 - v70;
          char v72 = v79;
        }
        if (v72) {
          goto LABEL_126;
        }
        unint64_t v80 = v22 - 2;
        uint64_t v86 = &v65[16 * v22 - 32];
        uint64_t v88 = *(void *)v86;
        uint64_t v87 = *((void *)v86 + 1);
        BOOL v89 = __OFSUB__(v87, v88);
        uint64_t v90 = v87 - v88;
        char v91 = v89;
        if (v89) {
          goto LABEL_129;
        }
        uint64_t v92 = &v65[16 * v68];
        uint64_t v94 = *(void *)v92;
        uint64_t v93 = *((void *)v92 + 1);
        BOOL v79 = __OFSUB__(v93, v94);
        uint64_t v95 = v93 - v94;
        if (v79) {
          goto LABEL_132;
        }
        if (__OFADD__(v90, v95)) {
          goto LABEL_133;
        }
        if (v90 + v95 >= v71)
        {
          BOOL v96 = v71 < v95;
LABEL_95:
          if (v96) {
            unint64_t v68 = v80;
          }
          goto LABEL_97;
        }
LABEL_89:
        if (v91) {
          goto LABEL_128;
        }
        BOOL v99 = &v65[16 * v68];
        uint64_t v101 = *(void *)v99;
        uint64_t v100 = *((void *)v99 + 1);
        BOOL v79 = __OFSUB__(v100, v101);
        uint64_t v102 = v100 - v101;
        if (v79) {
          goto LABEL_131;
        }
        if (v102 < v90) {
          goto LABEL_14;
        }
LABEL_97:
        unint64_t v107 = v68 - 1;
        if (v68 - 1 >= v22)
        {
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
LABEL_143:
          __break(1u);
          goto LABEL_144;
        }
        if (!*v19) {
          goto LABEL_146;
        }
        uint64_t v108 = v20;
        uint64_t v109 = &v65[16 * v107];
        uint64_t v110 = *(void *)v109;
        uint64_t v111 = &v65[16 * v68];
        uint64_t v112 = *((void *)v111 + 1);
        sub_24D2141C8(*v19 + *(void *)(v129 + 72) * *(void *)v109, *v19 + *(void *)(v129 + 72) * *(void *)v111, *v19 + *(void *)(v129 + 72) * v112, v128);
        if (v64) {
          goto LABEL_118;
        }
        if (v112 < v110) {
          goto LABEL_121;
        }
        if (v68 > *((void *)v108 + 2)) {
          goto LABEL_122;
        }
        *(void *)uint64_t v109 = v110;
        *(void *)&v65[16 * v107 + 8] = v112;
        unint64_t v113 = *((void *)v108 + 2);
        if (v68 >= v113) {
          goto LABEL_123;
        }
        uint64_t v20 = v108;
        unint64_t v22 = v113 - 1;
        memmove(&v65[16 * v68], v111 + 16, 16 * (v113 - 1 - v68));
        *((void *)v108 + 2) = v113 - 1;
        uint64_t v19 = v135;
        if (v113 <= 2) {
          goto LABEL_14;
        }
      }
    }
    unint64_t v22 = 1;
LABEL_14:
    uint64_t v13 = v19[1];
    uint64_t v21 = v134;
    uint64_t v2 = v64;
    if (v134 >= v13) {
      goto LABEL_107;
    }
  }
  if (v41 >= v31) {
    goto LABEL_58;
  }
LABEL_39:
  if (__OFSUB__(v41, v21)) {
    goto LABEL_140;
  }
  if (v41 - v21 >= v123) {
    goto LABEL_58;
  }
  if (__OFADD__(v21, v123)) {
    goto LABEL_143;
  }
  if (v21 + v123 >= v31) {
    uint64_t v47 = v31;
  }
  else {
    uint64_t v47 = v21 + v123;
  }
  if (v47 >= v21)
  {
    if (v41 != v47)
    {
      uint64_t v121 = v20;
      uint64_t v124 = v2;
      uint64_t v125 = v47;
      uint64_t v48 = *(void *)(v129 + 72);
      uint64_t v137 = v48 * (v41 - 1);
      uint64_t v131 = v48;
      uint64_t v49 = v41 * v48;
      do
      {
        uint64_t v51 = 0;
        uint64_t v134 = v41;
        while (1)
        {
          uint64_t v52 = *v19;
          uint64_t v53 = v49;
          uint64_t v54 = v49 + v51;
          uint64_t v55 = v19;
          uint64_t v56 = v132;
          sub_24D1D9D68(v54 + *v19, v132, &qword_26985C3D8);
          uint64_t v57 = v133;
          sub_24D1D9D68(v137 + v51 + v52, v133, &qword_26985C3D8);
          LOBYTE(v52) = sub_24D218A60();
          sub_24D1D9A80(v57, &qword_26985C3D8);
          sub_24D1D9A80(v56, &qword_26985C3D8);
          if ((v52 & 1) == 0) {
            break;
          }
          uint64_t v58 = *v55;
          if (!*v55) {
            goto LABEL_145;
          }
          uint64_t v49 = v53;
          uint64_t v59 = v58 + v137 + v51;
          sub_24D1DC0B8(v58 + v53 + v51, v136, &qword_26985C3D8);
          swift_arrayInitWithTakeFrontToBack();
          sub_24D1DC0B8(v136, v59, &qword_26985C3D8);
          v51 -= v131;
          ++v21;
          uint64_t v50 = v134;
          uint64_t v19 = v135;
          if (v134 == v21) {
            goto LABEL_49;
          }
        }
        uint64_t v50 = v134;
        uint64_t v19 = v55;
        uint64_t v49 = v53;
LABEL_49:
        uint64_t v41 = v50 + 1;
        v137 += v131;
        v49 += v131;
        uint64_t v21 = v127;
      }
      while (v41 != v125);
      uint64_t v41 = v125;
      uint64_t v2 = v124;
      uint64_t v20 = v121;
    }
    goto LABEL_58;
  }
LABEL_144:
  __break(1u);
LABEL_145:
  __break(1u);
LABEL_146:
  __break(1u);
LABEL_147:
  __break(1u);
LABEL_148:
  __break(1u);
LABEL_149:
  uint64_t result = sub_24D219460();
  __break(1u);
  return result;
}

uint64_t sub_24D2135F0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v31 = a1;
  uint64_t v7 = sub_24D218AC0();
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v41 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v37 = (char *)&v29 - v11;
  uint64_t result = MEMORY[0x270FA5388](v10);
  uint64_t v36 = (char *)&v29 - v14;
  uint64_t v39 = a3;
  uint64_t v30 = a2;
  if (a3 != a2)
  {
    uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
    uint64_t v15 = v13 + 16;
    uint64_t v17 = *(void *)(v15 + 56);
    uint64_t v32 = (uint64_t (**)(char *, uint64_t))(v15 - 8);
    uint64_t v33 = v16;
    uint64_t v34 = a4;
    uint64_t v35 = v15;
    uint64_t v40 = (void (**)(char *, uint64_t, uint64_t))(v15 + 16);
    uint64_t v44 = v17 * (v39 - 1);
    uint64_t v38 = v17;
    uint64_t v43 = v17 * v39;
LABEL_5:
    uint64_t v18 = 0;
    uint64_t v42 = v31;
    while (1)
    {
      uint64_t v19 = *a4;
      uint64_t v20 = v43 + v18 + *a4;
      uint64_t v21 = v36;
      unint64_t v22 = v33;
      v33(v36, v20, v7);
      uint64_t v23 = v37;
      v22(v37, v44 + v18 + v19, v7);
      sub_24D2154D0((unint64_t *)&qword_26985BC50, MEMORY[0x263F07490]);
      LOBYTE(v22) = sub_24D2190B0();
      uint64_t v24 = *v32;
      (*v32)(v23, v7);
      uint64_t v25 = v21;
      a4 = v34;
      uint64_t result = v24(v25, v7);
      if ((v22 & 1) == 0)
      {
LABEL_4:
        v44 += v38;
        v43 += v38;
        if (++v39 == v30) {
          return result;
        }
        goto LABEL_5;
      }
      uint64_t v26 = *a4;
      if (!*a4) {
        break;
      }
      uint64_t v27 = v26 + v44 + v18;
      uint64_t v28 = *v40;
      (*v40)(v41, v26 + v43 + v18, v7);
      swift_arrayInitWithTakeFrontToBack();
      uint64_t result = ((uint64_t (*)(uint64_t, char *, uint64_t))v28)(v27, v41, v7);
      v18 -= v38;
      if (v39 == ++v42) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_24D213910(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v25 = a1;
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985C3D8);
  uint64_t v7 = MEMORY[0x270FA5388](v26);
  uint64_t v30 = (uint64_t)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v27 = (uint64_t)&v23 - v10;
  uint64_t result = MEMORY[0x270FA5388](v9);
  uint64_t v14 = (char *)&v23 - v13;
  uint64_t v29 = a3;
  uint64_t v24 = a2;
  if (a3 != a2)
  {
    uint64_t v15 = *(void *)(v12 + 72);
    uint64_t v32 = v15 * (v29 - 1);
    uint64_t v28 = v15;
    uint64_t v31 = v15 * v29;
LABEL_5:
    uint64_t v16 = 0;
    uint64_t v17 = v25;
    while (1)
    {
      uint64_t v18 = *a4;
      sub_24D1D9D68(v31 + v16 + *a4, (uint64_t)v14, &qword_26985C3D8);
      uint64_t v19 = v27;
      sub_24D1D9D68(v32 + v16 + v18, v27, &qword_26985C3D8);
      LOBYTE(v18) = sub_24D218A60();
      sub_24D1D9A80(v19, &qword_26985C3D8);
      uint64_t result = sub_24D1D9A80((uint64_t)v14, &qword_26985C3D8);
      if ((v18 & 1) == 0)
      {
LABEL_4:
        v32 += v28;
        v31 += v28;
        if (++v29 == v24) {
          return result;
        }
        goto LABEL_5;
      }
      uint64_t v20 = *a4;
      if (!*a4) {
        break;
      }
      uint64_t v21 = a4;
      uint64_t v22 = v20 + v32 + v16;
      sub_24D1DC0B8(v20 + v31 + v16, v30, &qword_26985C3D8);
      swift_arrayInitWithTakeFrontToBack();
      uint64_t result = sub_24D1DC0B8(v30, v22, &qword_26985C3D8);
      v16 -= v28;
      ++v17;
      a4 = v21;
      if (v29 == v17) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_24D213B94(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v8 = sub_24D218AC0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v56 = (char *)v49 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v55 = (char *)v49 - v12;
  uint64_t v57 = *(void *)(v13 + 72);
  if (!v57)
  {
    __break(1u);
LABEL_68:
    __break(1u);
LABEL_69:
    __break(1u);
    goto LABEL_70;
  }
  if (a2 - a1 == 0x8000000000000000 && v57 == -1) {
    goto LABEL_68;
  }
  int64_t v14 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v57 == -1) {
    goto LABEL_69;
  }
  uint64_t v15 = (uint64_t)(a2 - a1) / v57;
  unint64_t v60 = a1;
  unint64_t v59 = a4;
  uint64_t v16 = v14 / v57;
  if (v15 >= v14 / v57)
  {
    if ((v16 & 0x8000000000000000) == 0)
    {
      uint64_t v18 = v16 * v57;
      if (a4 < a2 || a2 + v18 <= a4)
      {
        swift_arrayInitWithTakeFrontToBack();
        uint64_t v19 = v9;
      }
      else
      {
        uint64_t v19 = v9;
        if (a4 != a2) {
          swift_arrayInitWithTakeBackToFront();
        }
      }
      unint64_t v34 = a4 + v18;
      unint64_t v58 = a4 + v18;
      unint64_t v60 = a2;
      unint64_t v52 = a1;
      if (v18 >= 1 && a1 < a2)
      {
        unint64_t v36 = -v57;
        uint64_t v38 = *(void (**)(char *, unint64_t, uint64_t))(v19 + 16);
        uint64_t v37 = v19 + 16;
        v49[1] = v37 - 8;
        uint64_t v50 = v38;
        unint64_t v53 = -v57;
        uint64_t v54 = v37;
        unint64_t v51 = a4;
        uint64_t v39 = v55;
        uint64_t v40 = (void (**)(char *, uint64_t))(v37 - 8);
        do
        {
          uint64_t v57 = a3 + v36;
          uint64_t v41 = v50;
          v50(v39, v34 + v36, v8);
          unint64_t v42 = a2 + v36;
          unint64_t v43 = a3;
          uint64_t v44 = v56;
          v41(v56, v42, v8);
          sub_24D2154D0((unint64_t *)&qword_26985BC50, MEMORY[0x263F07490]);
          LOBYTE(v41) = sub_24D2190B0();
          uint64_t v45 = *v40;
          (*v40)(v44, v8);
          v45(v39, v8);
          if (v41)
          {
            a3 = v57;
            if (v43 < a2 || v57 >= a2)
            {
              swift_arrayInitWithTakeFrontToBack();
              unint64_t v46 = v51;
            }
            else
            {
              unint64_t v46 = v51;
              if (v43 != a2) {
                swift_arrayInitWithTakeBackToFront();
              }
            }
            unint64_t v36 = v53;
            v60 += v53;
          }
          else
          {
            a3 = v57;
            unint64_t v47 = v58;
            v58 += v53;
            if (v43 < v47 || v57 >= v47)
            {
              swift_arrayInitWithTakeFrontToBack();
              unint64_t v42 = a2;
              unint64_t v36 = v53;
              unint64_t v46 = v51;
            }
            else
            {
              unint64_t v46 = v51;
              if (v43 != v47) {
                swift_arrayInitWithTakeBackToFront();
              }
              unint64_t v42 = a2;
              unint64_t v36 = v53;
            }
          }
          unint64_t v34 = v58;
          if (v58 <= v46) {
            break;
          }
          a2 = v42;
        }
        while (v42 > v52);
      }
      goto LABEL_66;
    }
  }
  else if ((v15 & 0x8000000000000000) == 0)
  {
    uint64_t v17 = v15 * v57;
    if (a4 < a1 || a1 + v17 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != a1)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    unint64_t v53 = a4 + v17;
    unint64_t v58 = a4 + v17;
    if (v17 >= 1 && a2 < a3)
    {
      uint64_t v21 = *(void (**)(char *, unint64_t, uint64_t))(v9 + 16);
      uint64_t v54 = v9 + 16;
      uint64_t v22 = (void (**)(char *, uint64_t))(v9 + 8);
      do
      {
        unint64_t v23 = a3;
        uint64_t v24 = v55;
        v21(v55, a2, v8);
        unint64_t v25 = a4;
        uint64_t v26 = v56;
        v21(v56, v25, v8);
        sub_24D2154D0((unint64_t *)&qword_26985BC50, MEMORY[0x263F07490]);
        char v27 = sub_24D2190B0();
        uint64_t v28 = *v22;
        (*v22)(v26, v8);
        v28(v24, v8);
        unint64_t v29 = v60;
        if (v27)
        {
          unint64_t v30 = a2 + v57;
          if (v60 < a2 || v60 >= v30)
          {
            swift_arrayInitWithTakeFrontToBack();
            a3 = v23;
          }
          else
          {
            a3 = v23;
            if (v60 == a2) {
              unint64_t v29 = a2;
            }
            else {
              swift_arrayInitWithTakeBackToFront();
            }
          }
        }
        else
        {
          unint64_t v32 = v59 + v57;
          if (v60 < v59 || v60 >= v32)
          {
            swift_arrayInitWithTakeFrontToBack();
            a3 = v23;
          }
          else
          {
            a3 = v23;
            if (v60 != v59) {
              swift_arrayInitWithTakeBackToFront();
            }
          }
          unint64_t v59 = v32;
          unint64_t v30 = a2;
        }
        unint64_t v60 = v29 + v57;
        a4 = v59;
        if (v59 >= v53) {
          break;
        }
        a2 = v30;
      }
      while (v30 < a3);
    }
LABEL_66:
    sub_24D214798(&v60, &v59, (uint64_t *)&v58);
    return 1;
  }
LABEL_70:
  uint64_t result = sub_24D2194A0();
  __break(1u);
  return result;
}

uint64_t sub_24D2141C8(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985C3D8);
  uint64_t v8 = MEMORY[0x270FA5388](v43);
  uint64_t v44 = (uint64_t)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v40 - v10;
  uint64_t v13 = *(void *)(v12 + 72);
  if (!v13)
  {
    __break(1u);
LABEL_62:
    __break(1u);
LABEL_63:
    __break(1u);
    goto LABEL_64;
  }
  if (a2 - a1 == 0x8000000000000000 && v13 == -1) {
    goto LABEL_62;
  }
  int64_t v14 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v13 == -1) {
    goto LABEL_63;
  }
  uint64_t v15 = (uint64_t)(a2 - a1) / v13;
  unint64_t v47 = a1;
  unint64_t v46 = a4;
  uint64_t v16 = v14 / v13;
  if (v15 >= v14 / v13)
  {
    if ((v16 & 0x8000000000000000) == 0)
    {
      uint64_t v18 = v16 * v13;
      if (a4 < a2 || a2 + v18 <= a4)
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else if (a4 != a2)
      {
        swift_arrayInitWithTakeBackToFront();
      }
      unint64_t v25 = a4 + v18;
      unint64_t v45 = a4 + v18;
      unint64_t v47 = a2;
      if (v18 >= 1 && a1 < a2)
      {
        uint64_t v27 = -v13;
        unint64_t v41 = a4;
        unint64_t v42 = a1;
        do
        {
          unint64_t v28 = a3 + v27;
          sub_24D1D9D68(v25 + v27, (uint64_t)v11, &qword_26985C3D8);
          unint64_t v29 = a2 + v27;
          unint64_t v30 = a3;
          uint64_t v31 = (uint64_t)v11;
          uint64_t v32 = v44;
          sub_24D1D9D68(a2 + v27, v44, &qword_26985C3D8);
          char v33 = sub_24D218A60();
          uint64_t v34 = v32;
          uint64_t v11 = (char *)v31;
          sub_24D1D9A80(v34, &qword_26985C3D8);
          sub_24D1D9A80(v31, &qword_26985C3D8);
          if (v33)
          {
            if (v30 < a2 || v28 >= a2)
            {
              swift_arrayInitWithTakeFrontToBack();
              unint64_t v37 = v41;
              unint64_t v36 = v42;
            }
            else
            {
              BOOL v35 = v30 == a2;
              unint64_t v37 = v41;
              unint64_t v36 = v42;
              if (!v35) {
                swift_arrayInitWithTakeBackToFront();
              }
            }
            v47 += v27;
          }
          else
          {
            unint64_t v38 = v45;
            v45 += v27;
            if (v30 < v38 || v28 >= v38)
            {
              swift_arrayInitWithTakeFrontToBack();
              unint64_t v29 = a2;
              unint64_t v37 = v41;
              unint64_t v36 = v42;
            }
            else
            {
              BOOL v35 = v30 == v38;
              unint64_t v37 = v41;
              unint64_t v36 = v42;
              if (!v35) {
                swift_arrayInitWithTakeBackToFront();
              }
              unint64_t v29 = a2;
            }
          }
          unint64_t v25 = v45;
          if (v45 <= v37) {
            break;
          }
          a2 = v29;
          a3 = v28;
        }
        while (v29 > v36);
      }
      goto LABEL_60;
    }
  }
  else if ((v15 & 0x8000000000000000) == 0)
  {
    uint64_t v17 = v15 * v13;
    if (a4 < a1 || a1 + v17 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != a1)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    unint64_t v42 = a4 + v17;
    unint64_t v45 = a4 + v17;
    if (v17 >= 1 && a2 < a3)
    {
      uint64_t v20 = v44;
      do
      {
        sub_24D1D9D68(a2, (uint64_t)v11, &qword_26985C3D8);
        sub_24D1D9D68(a4, v20, &qword_26985C3D8);
        char v21 = sub_24D218A60();
        sub_24D1D9A80(v20, &qword_26985C3D8);
        sub_24D1D9A80((uint64_t)v11, &qword_26985C3D8);
        unint64_t v22 = v47;
        if (v21)
        {
          unint64_t v23 = a2 + v13;
          if (v47 < a2 || v47 >= v23)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v47 == a2)
          {
            unint64_t v22 = a2;
          }
          else
          {
            swift_arrayInitWithTakeBackToFront();
          }
        }
        else
        {
          unint64_t v24 = v46 + v13;
          if (v47 < v46 || v47 >= v24)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v47 != v46)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          unint64_t v46 = v24;
          unint64_t v23 = a2;
        }
        unint64_t v47 = v22 + v13;
        a4 = v46;
        if (v46 >= v42) {
          break;
        }
        a2 = v23;
      }
      while (v23 < a3);
    }
LABEL_60:
    sub_24D2148D8(&v47, &v46, (uint64_t *)&v45);
    return 1;
  }
LABEL_64:
  uint64_t result = sub_24D2194A0();
  __break(1u);
  return result;
}

char *sub_24D21469C(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26985C3E8);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  int64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_24D214798(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3 = *a1;
  unint64_t v4 = *a2;
  uint64_t v5 = *a3;
  uint64_t result = sub_24D218AC0();
  uint64_t v7 = *(void *)(*(void *)(result - 8) + 72);
  if (!v7)
  {
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v8 = v5 - v4;
  if (v5 - v4 == 0x8000000000000000 && v7 == -1) {
    goto LABEL_18;
  }
  if (v8 / v7 < 0)
  {
LABEL_19:
    uint64_t result = sub_24D2194A0();
    __break(1u);
    return result;
  }
  if (v3 < v4 || v3 >= v4 + v8 / v7 * v7)
  {
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (v3 != v4)
  {
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

uint64_t sub_24D2148D8(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3 = *a1;
  unint64_t v4 = *a2;
  uint64_t v5 = *a3;
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_26985C3D8);
  uint64_t v7 = *(void *)(*(void *)(result - 8) + 72);
  if (!v7)
  {
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v8 = v5 - v4;
  if (v5 - v4 == 0x8000000000000000 && v7 == -1) {
    goto LABEL_18;
  }
  if (v8 / v7 < 0)
  {
LABEL_19:
    uint64_t result = sub_24D2194A0();
    __break(1u);
    return result;
  }
  if (v3 < v4 || v3 >= v4 + v8 / v7 * v7)
  {
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (v3 != v4)
  {
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

char *sub_24D214A1C(uint64_t a1)
{
  return sub_24D21469C(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_24D214A30(void *a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A610);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_24D218AC0();
  uint64_t v41 = *(void *)(v11 - 8);
  uint64_t result = MEMORY[0x270FA5388](v11);
  uint64_t v40 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = a4;
  uint64_t v15 = a4 + 56;
  uint64_t v14 = *(void *)(a4 + 56);
  uint64_t v32 = -1 << *(unsigned char *)(a4 + 32);
  if (-v32 < 64) {
    uint64_t v16 = ~(-1 << -(char)v32);
  }
  else {
    uint64_t v16 = -1;
  }
  unint64_t v17 = v16 & v14;
  if (!a2)
  {
    int64_t v18 = 0;
    a3 = 0;
LABEL_39:
    uint64_t v28 = ~v32;
    *a1 = v42;
    a1[1] = v15;
    a1[2] = v28;
    a1[3] = v18;
    a1[4] = v17;
    return a3;
  }
  if (!a3)
  {
    int64_t v18 = 0;
    goto LABEL_39;
  }
  if (a3 < 0) {
    goto LABEL_41;
  }
  uint64_t v36 = a3;
  int64_t v18 = 0;
  a3 = 0;
  uint64_t v19 = v40;
  uint64_t v38 = v41 + 16;
  uint64_t v39 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v41 + 56);
  uint64_t v37 = v41 + 48;
  BOOL v35 = (uint64_t (**)(char *, char *, uint64_t))(v41 + 32);
  uint64_t v33 = v15;
  int64_t v34 = (unint64_t)(63 - v32) >> 6;
  int64_t v30 = v34 - 1;
  uint64_t v31 = a1;
  if (!v17) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v20 = __clz(__rbit64(v17));
  v17 &= v17 - 1;
  unint64_t v21 = v20 | (v18 << 6);
  while (1)
  {
    uint64_t v25 = v41;
    uint64_t v26 = *(void *)(v41 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v41 + 16))(v10, *(void *)(v42 + 48) + v26 * v21, v11);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v10, 0, 1, v11);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v10, 1, v11) == 1)
    {
      uint64_t v15 = v33;
      goto LABEL_38;
    }
    ++a3;
    uint64_t v27 = *v35;
    (*v35)(v19, v10, v11);
    uint64_t result = v27(a2, v19, v11);
    if (a3 == v36)
    {
      a3 = v36;
      a1 = v31;
      uint64_t v15 = v33;
      goto LABEL_39;
    }
    a2 += v26;
    if (v17) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v22 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    uint64_t v15 = v33;
    if (v22 >= v34) {
      goto LABEL_37;
    }
    unint64_t v23 = *(void *)(v33 + 8 * v22);
    if (!v23)
    {
      int64_t v24 = v18 + 2;
      ++v18;
      if (v22 + 1 >= v34) {
        goto LABEL_37;
      }
      unint64_t v23 = *(void *)(v33 + 8 * v24);
      if (v23) {
        goto LABEL_14;
      }
      int64_t v18 = v22 + 1;
      if (v22 + 2 >= v34) {
        goto LABEL_37;
      }
      unint64_t v23 = *(void *)(v33 + 8 * (v22 + 2));
      if (v23)
      {
        v22 += 2;
      }
      else
      {
        int64_t v18 = v22 + 2;
        if (v22 + 3 >= v34) {
          goto LABEL_37;
        }
        unint64_t v23 = *(void *)(v33 + 8 * (v22 + 3));
        if (!v23)
        {
          int64_t v24 = v22 + 4;
          int64_t v18 = v22 + 3;
          if (v22 + 4 < v34)
          {
            unint64_t v23 = *(void *)(v33 + 8 * v24);
            if (!v23)
            {
              while (1)
              {
                int64_t v22 = v24 + 1;
                if (__OFADD__(v24, 1)) {
                  goto LABEL_42;
                }
                if (v22 >= v34)
                {
                  int64_t v18 = v30;
                  goto LABEL_37;
                }
                unint64_t v23 = *(void *)(v33 + 8 * v22);
                ++v24;
                if (v23) {
                  goto LABEL_21;
                }
              }
            }
LABEL_14:
            int64_t v22 = v24;
            goto LABEL_21;
          }
LABEL_37:
          (*v39)(v10, 1, 1, v11);
          unint64_t v17 = 0;
LABEL_38:
          sub_24D1D9A80((uint64_t)v10, &qword_26B18A610);
          a1 = v31;
          goto LABEL_39;
        }
        v22 += 3;
      }
    }
LABEL_21:
    unint64_t v17 = (v23 - 1) & v23;
    unint64_t v21 = __clz(__rbit64(v23)) + (v22 << 6);
    int64_t v18 = v22;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_24D214E24(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985C3D8);
  uint64_t v38 = *(void *)(v8 - 8);
  uint64_t v39 = v8;
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x270FA5388](v9);
  uint64_t v14 = (char *)&v32 - v13;
  uint64_t v15 = *(void *)(a4 + 64);
  uint64_t v37 = a4 + 64;
  uint64_t v16 = -1 << *(unsigned char *)(a4 + 32);
  if (-v16 < 64) {
    uint64_t v17 = ~(-1 << -(char)v16);
  }
  else {
    uint64_t v17 = -1;
  }
  unint64_t v18 = v17 & v15;
  if (!a2)
  {
    int64_t v19 = 0;
    a3 = 0;
LABEL_39:
    uint64_t v31 = v37;
    *a1 = a4;
    a1[1] = v31;
    a1[2] = ~v16;
    a1[3] = v19;
    a1[4] = v18;
    return a3;
  }
  if (!a3)
  {
    int64_t v19 = 0;
    goto LABEL_39;
  }
  if (a3 < 0) {
    goto LABEL_41;
  }
  uint64_t v34 = -1 << *(unsigned char *)(a4 + 32);
  BOOL v35 = a1;
  int64_t v19 = 0;
  uint64_t v20 = 0;
  int64_t v36 = (unint64_t)(63 - v16) >> 6;
  int64_t v33 = v36 - 1;
  uint64_t v21 = a3;
  if (!v18) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v22 = __clz(__rbit64(v18));
  v18 &= v18 - 1;
  unint64_t v23 = v22 | (v19 << 6);
  while (1)
  {
    ++v20;
    uint64_t v27 = *(void *)(a4 + 48);
    uint64_t v28 = sub_24D218AC0();
    (*(void (**)(char *, unint64_t, uint64_t))(*(void *)(v28 - 8) + 16))(v11, v27 + *(void *)(*(void *)(v28 - 8) + 72) * v23, v28);
    uint64_t v29 = *(void *)(a4 + 56);
    uint64_t v30 = sub_24D218CF0();
    (*(void (**)(char *, unint64_t, uint64_t))(*(void *)(v30 - 8) + 16))(&v11[*(int *)(v39 + 48)], v29 + *(void *)(*(void *)(v30 - 8) + 72) * v23, v30);
    sub_24D1DC0B8((uint64_t)v11, (uint64_t)v14, &qword_26985C3D8);
    uint64_t result = sub_24D1DC0B8((uint64_t)v14, a2, &qword_26985C3D8);
    if (v20 == v21)
    {
      a3 = v21;
      goto LABEL_38;
    }
    a2 += *(void *)(v38 + 72);
    if (v18) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v24 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v24 >= v36) {
      goto LABEL_33;
    }
    unint64_t v25 = *(void *)(v37 + 8 * v24);
    if (!v25)
    {
      v19 += 2;
      if (v24 + 1 >= v36)
      {
        unint64_t v18 = 0;
        int64_t v19 = v24;
      }
      else
      {
        unint64_t v25 = *(void *)(v37 + 8 * v19);
        if (v25) {
          goto LABEL_14;
        }
        int64_t v26 = v24 + 2;
        if (v24 + 2 >= v36) {
          goto LABEL_33;
        }
        unint64_t v25 = *(void *)(v37 + 8 * v26);
        if (v25)
        {
LABEL_17:
          int64_t v24 = v26;
          goto LABEL_18;
        }
        int64_t v19 = v24 + 3;
        if (v24 + 3 < v36)
        {
          unint64_t v25 = *(void *)(v37 + 8 * v19);
          if (v25)
          {
LABEL_14:
            int64_t v24 = v19;
            goto LABEL_18;
          }
          int64_t v26 = v24 + 4;
          if (v24 + 4 >= v36)
          {
LABEL_33:
            unint64_t v18 = 0;
            goto LABEL_37;
          }
          unint64_t v25 = *(void *)(v37 + 8 * v26);
          if (!v25)
          {
            while (1)
            {
              int64_t v24 = v26 + 1;
              if (__OFADD__(v26, 1)) {
                goto LABEL_42;
              }
              if (v24 >= v36)
              {
                unint64_t v18 = 0;
                int64_t v19 = v33;
                goto LABEL_37;
              }
              unint64_t v25 = *(void *)(v37 + 8 * v24);
              ++v26;
              if (v25) {
                goto LABEL_18;
              }
            }
          }
          goto LABEL_17;
        }
        unint64_t v18 = 0;
        int64_t v19 = v24 + 2;
      }
LABEL_37:
      a3 = v20;
LABEL_38:
      uint64_t v16 = v34;
      a1 = v35;
      goto LABEL_39;
    }
LABEL_18:
    unint64_t v18 = (v25 - 1) & v25;
    unint64_t v23 = __clz(__rbit64(v25)) + (v24 << 6);
    int64_t v19 = v24;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_24D2151B0(void *a1)
{
  return sub_24D211C40(0, a1[2], 0, a1, &qword_26985BDB8, MEMORY[0x263F07490]);
}

uint64_t sub_24D2151F4(void *a1)
{
  return sub_24D2119D8(0, a1[2], 0, a1);
}

uint64_t sub_24D215208(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for EnergySite.EnergyUsage(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24D21526C()
{
  return swift_release();
}

uint64_t sub_24D215278(uint64_t a1)
{
  uint64_t v2 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26985C3F0) - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  unint64_t v4 = v3 + *(void *)(v2 + 64);
  uint64_t v5 = *(void *)(sub_24D218AC0() - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = (v4 + v6 + 1) & ~v6;
  uint64_t v8 = *(void *)(v5 + 64);
  uint64_t v9 = (v8 + v6 + v7) & ~v6;
  unint64_t v10 = (v8 + v9 + 7) & 0xFFFFFFFFFFFFFFF8;
  sub_24D218BB0();
  uint64_t v11 = *(void *)(v1 + 24);
  uint64_t v12 = v1 + v3;
  uint64_t v19 = v1 + v7;
  uint64_t v17 = *(void *)(v1 + 16);
  uint64_t v18 = v1 + v9;
  uint64_t v13 = *(void *)(v1 + v10);
  char v14 = *(unsigned char *)(v1 + v4);
  uint64_t v15 = (void *)swift_task_alloc();
  *(void *)(v20 + 16) = v15;
  *uint64_t v15 = v20;
  v15[1] = sub_24D1D770C;
  return sub_24D210E2C(a1, v17, v11, v12, v14, v19, v18, v13);
}

uint64_t sub_24D2154D0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t objectdestroyTm_1()
{
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985C3F0);
  uint64_t v1 = *(void *)(v20 - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = *(void *)(v1 + 64);
  uint64_t v4 = sub_24D218AC0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = (v3 + v6 + ((v2 + 32) & ~v2) + 1) & ~v6;
  uint64_t v8 = *(void *)(v5 + 64);
  uint64_t v9 = (v8 + v6 + v7) & ~v6;
  unint64_t v17 = (((v8 + v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v19 = sub_24D218BB0();
  uint64_t v10 = *(void *)(v19 - 8);
  uint64_t v11 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v12 = (v11 + v17 + 16) & ~v11;
  uint64_t v18 = v2 | v6 | v11 | 7;
  unint64_t v13 = ((*(void *)(v10 + 64) + v12 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v0 + ((v2 + 32) & ~v2), v20);
  uint64_t v14 = v0 + v7;
  uint64_t v15 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v15(v14, v4);
  v15(v0 + v9, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v0 + v12, v19);
  swift_release();

  return MEMORY[0x270FA0238](v0, v13, v18);
}

uint64_t sub_24D21577C(uint64_t a1)
{
  uint64_t v2 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26985C3F0) - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  unint64_t v4 = v3 + *(void *)(v2 + 64);
  uint64_t v5 = *(void *)(sub_24D218AC0() - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = (v4 + v6 + 1) & ~v6;
  uint64_t v8 = *(void *)(v5 + 64);
  uint64_t v9 = (v8 + v6 + v7) & ~v6;
  unint64_t v10 = (v8 + v9 + 7) & 0xFFFFFFFFFFFFFFF8;
  sub_24D218BB0();
  uint64_t v11 = *(void *)(v1 + 24);
  uint64_t v12 = v1 + v3;
  uint64_t v19 = v1 + v7;
  uint64_t v17 = *(void *)(v1 + 16);
  uint64_t v18 = v1 + v9;
  uint64_t v13 = *(void *)(v1 + v10);
  char v14 = *(unsigned char *)(v1 + v4);
  uint64_t v15 = (void *)swift_task_alloc();
  *(void *)(v20 + 16) = v15;
  *uint64_t v15 = v20;
  v15[1] = sub_24D1DCDD0;
  return sub_24D21044C(a1, v17, v11, v12, v14, v19, v18, v13);
}

uint64_t objectdestroy_7Tm()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985C3F0);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_24D215A64(void *a1)
{
  uint64_t v3 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26985C3F0) - 8);
  return sub_24D2113C8(a1, v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)));
}

unint64_t sub_24D215AD0()
{
  uint64_t v2 = *v0;
  uint64_t v1 = v0[1];
  uint64_t v4 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v6 = v0[4];
  uint64_t v5 = v0[5];
  uint64_t v8 = v0[6];
  uint64_t v7 = v0[7];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985C428);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24D21A470;
  *(void *)(inited + 32) = 0x656C746974;
  *(void *)(inited + 40) = 0xE500000000000000;
  uint64_t v10 = MEMORY[0x263F8D310];
  *(void *)(inited + 48) = v2;
  *(void *)(inited + 56) = v1;
  *(void *)(inited + 72) = v10;
  *(void *)(inited + 80) = 2036625250;
  *(void *)(inited + 120) = v10;
  *(void *)(inited + 88) = 0xE400000000000000;
  *(void *)(inited + 96) = v4;
  *(void *)(inited + 104) = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v11 = sub_24D1C5148(inited);
  if (v5)
  {
    uint64_t v17 = v10;
    *(void *)&long long v16 = v6;
    *((void *)&v16 + 1) = v5;
    sub_24D1D97B4(&v16, v15);
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_24D1FADE4(v15, 0x4C5255706174, 0xE600000000000000, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
  }
  if (v7)
  {
    uint64_t v17 = v10;
    *(void *)&long long v16 = v8;
    *((void *)&v16 + 1) = v7;
    sub_24D1D97B4(&v16, v15);
    swift_bridgeObjectRetain();
    char v13 = swift_isUniquelyReferenced_nonNull_native();
    sub_24D1FADE4(v15, 0x4449656D6F68, 0xE600000000000000, v13);
    swift_bridgeObjectRelease();
  }
  return v11;
}

unint64_t HomeEnergyNotificationStatus.description.getter(uint64_t a1)
{
  unint64_t result = 0xD000000000000025;
  switch(a1)
  {
    case 0:
    case 1:
      return result;
    case 2:
      unint64_t result = 0xD00000000000003ALL;
      break;
    case 3:
      unint64_t result = 0xD000000000000037;
      break;
    default:
      sub_24D219500();
      __break(1u);
      JUMPOUT(0x24D215D00);
  }
  return result;
}

unint64_t HomeEnergyNotificationStatus.init(rawValue:)(unint64_t a1)
{
  return sub_24D215D88(a1);
}

unint64_t sub_24D215D30@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_24D215D88(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

unint64_t sub_24D215D64()
{
  return HomeEnergyNotificationStatus.description.getter(*v0);
}

void __swiftcall HomeEnergyNotificationContext.init(title:body:tapURL:homeID:seriesNotifications:)(EnergyKit::HomeEnergyNotificationContext *__return_ptr retstr, Swift::String title, Swift::String body, Swift::String_optional tapURL, Swift::String_optional homeID, Swift::Bool seriesNotifications)
{
  retstr->title = title;
  retstr->body = body;
  retstr->tapURL = tapURL;
  retstr->homeID = homeID;
  retstr->seriesNotifications = seriesNotifications;
}

unint64_t sub_24D215D88(unint64_t result)
{
  if (result > 3) {
    return 0;
  }
  return result;
}

unint64_t sub_24D215D9C()
{
  unint64_t result = qword_26985C420;
  if (!qword_26985C420)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26985C420);
  }
  return result;
}

ValueMetadata *type metadata accessor for HomeEnergyNotificationStatus()
{
  return &type metadata for HomeEnergyNotificationStatus;
}

uint64_t initializeBufferWithCopyOfBuffer for HomeEnergyNotificationContext(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for HomeEnergyNotificationContext()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for HomeEnergyNotificationContext(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for HomeEnergyNotificationContext(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  return a1;
}

__n128 __swift_memcpy65_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for HomeEnergyNotificationContext(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  return a1;
}

uint64_t getEnumTagSinglePayload for HomeEnergyNotificationContext(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 65)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HomeEnergyNotificationContext(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 64) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 65) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 65) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HomeEnergyNotificationContext()
{
  return &type metadata for HomeEnergyNotificationContext;
}

uint64_t sub_24D2160E8(uint64_t a1, char a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5D0);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return MEMORY[0x270FA2410](v3, v5);
  }
  else
  {
    **(unsigned char **)(*(void *)(v3 + 64) + 40) = a2;
    return swift_continuation_throwingResume();
  }
}

uint64_t static PerfDebug.forceIndependentTokenRotate(token:utility:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  return MEMORY[0x270FA2498](sub_24D2161C0, 0, 0);
}

uint64_t sub_24D2161C0()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v1 = *(void *)(v0 + 40);
  long long v7 = *(_OWORD *)(v0 + 16);
  uint64_t v3 = swift_task_alloc();
  *(void *)(v0 + 48) = v3;
  *(_OWORD *)(v3 + 16) = v7;
  *(void *)(v3 + 32) = v2;
  *(void *)(v3 + 40) = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_24D2162D4;
  uint64_t v5 = MEMORY[0x263F8D4F8];
  return MEMORY[0x270FA2360](v0 + 72, 0, 0, 0xD00000000000002BLL, 0x800000024D21CAB0, sub_24D216690, v3, v5);
}

uint64_t sub_24D2162D4()
{
  *(void *)(*(void *)v1 + 64) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_24D21640C;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_24D2163F0;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D2163F0()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(unsigned __int8 *)(v0 + 72));
}

uint64_t sub_24D21640C()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1(0);
}

uint64_t sub_24D216474(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v22 = a2;
  uint64_t v23 = a4;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BDF8);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x270FA5388](v8);
  unint64_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5B0);
  MEMORY[0x270FA5388](v12 - 8);
  char v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_24D219240();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v14, 1, 1, v15);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a1, v8);
  unint64_t v16 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  unint64_t v17 = (v10 + v16 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = 0;
  *(void *)(v18 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v18 + v16, v11, v8);
  uint64_t v19 = (void *)(v18 + v17);
  *uint64_t v19 = v22;
  v19[1] = a3;
  uint64_t v20 = (void *)(v18 + ((v17 + 23) & 0xFFFFFFFFFFFFFFF8));
  *uint64_t v20 = v23;
  v20[1] = a5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_24D1BA610((uint64_t)v14, (uint64_t)&unk_26985C440, v18);
  return swift_release();
}

uint64_t sub_24D216690(uint64_t a1)
{
  return sub_24D216474(a1, v1[2], v1[3], v1[4], v1[5]);
}

uint64_t sub_24D21669C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[19] = a7;
  v8[20] = a8;
  v8[17] = a5;
  v8[18] = a6;
  v8[16] = a4;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BDF8);
  v8[21] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v8[22] = v10;
  v8[23] = *(void *)(v10 + 64);
  v8[24] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D216770, 0, 0);
}

uint64_t sub_24D216770()
{
  uint64_t v1 = v0[24];
  uint64_t v2 = v0[22];
  uint64_t v3 = v0[21];
  uint64_t v4 = v0[16];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[25] = sub_24D217288();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  unint64_t v5 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v6 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v2 + 32))(v6 + v5, v1, v3);
  long long v7 = (void *)sub_24D217944((uint64_t)sub_24D217214, v6);
  v0[26] = v7;
  swift_release();
  uint64_t v8 = sub_24D2190E0();
  v0[27] = v8;
  uint64_t v9 = sub_24D2190E0();
  v0[28] = v9;
  v0[2] = v0;
  v0[7] = v0 + 30;
  v0[3] = sub_24D216988;
  uint64_t v10 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_24D2160E8;
  v0[13] = &block_descriptor_3;
  v0[14] = v10;
  objc_msgSend(v7, sel_forceIndependentTokenRotateWithToken_utility_completionHandler_, v8, v9);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_24D216988()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 232) = v1;
  if (v1) {
    uint64_t v2 = sub_24D216B50;
  }
  else {
    uint64_t v2 = sub_24D216A98;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D216A98()
{
  uint64_t v2 = *(void **)(v0 + 216);
  uint64_t v1 = *(void **)(v0 + 224);
  uint64_t v3 = *(void *)(v0 + 200);
  char v4 = *(unsigned char *)(v0 + 240);
  swift_unknownObjectRelease();

  objc_msgSend(*(id *)(v3 + 16), sel_invalidate);
  *(unsigned char *)(v0 + 241) = v4;
  sub_24D219220();
  swift_release();
  swift_task_dealloc();
  unint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_24D216B50()
{
  uint64_t v2 = (void *)v0[28];
  uint64_t v1 = v0[29];
  uint64_t v3 = (void *)v0[27];
  swift_willThrow();
  swift_unknownObjectRelease();

  v0[15] = v1;
  sub_24D219210();
  swift_release();
  swift_task_dealloc();
  char v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_24D216C14(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_24D219020();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B18A8E8 != -1) {
    swift_once();
  }
  uint64_t v8 = __swift_project_value_buffer(v4, (uint64_t)qword_26B18A908);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  id v9 = a1;
  id v10 = a1;
  unint64_t v11 = sub_24D219000();
  os_log_type_t v12 = sub_24D2192D0();
  if (os_log_type_enabled(v11, v12))
  {
    void v20[2] = a2;
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v21 = (uint64_t)a1;
    uint64_t v22 = v14;
    *(_DWORD *)uint64_t v13 = 136315138;
    v20[1] = v13 + 4;
    id v15 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5D0);
    uint64_t v16 = sub_24D219100();
    uint64_t v21 = sub_24D1D0A78(v16, v17, &v22);
    sub_24D219310();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_24D1B6000, v11, v12, "Failed to conduct perf test. %s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253322AA0](v14, -1, -1);
    MEMORY[0x253322AA0](v13, -1, -1);
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v22 = (uint64_t)a1;
  id v18 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985BDF8);
  return sub_24D219210();
}

uint64_t PerfDebug.deinit()
{
  return v0;
}

uint64_t PerfDebug.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for PerfDebug()
{
  return self;
}

uint64_t method lookup function for PerfDebug(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PerfDebug);
}

uint64_t sub_24D216F2C()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BDF8);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, v6 + 16, v5);
}

uint64_t sub_24D217030(uint64_t a1)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26985BDF8) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v6 = (*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v7 = *(void *)(v1 + 16);
  uint64_t v8 = *(void *)(v1 + 24);
  uint64_t v9 = v1 + v5;
  uint64_t v10 = *(void *)(v1 + v6);
  uint64_t v11 = *(void *)(v1 + v6 + 8);
  os_log_type_t v12 = (uint64_t *)(v1 + ((v6 + 23) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v13 = *v12;
  uint64_t v14 = v12[1];
  id v15 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v15;
  *id v15 = v2;
  v15[1] = sub_24D1D770C;
  return sub_24D21669C(a1, v7, v8, v9, v10, v11, v13, v14);
}

uint64_t sub_24D217180()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985BDF8);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_24D217214(void *a1)
{
  uint64_t v3 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26985BDF8) - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_24D216C14(a1, v4);
}

uint64_t sub_24D217288()
{
  *(void *)(v0 + 16) = 0;
  id v1 = objc_allocWithZone(MEMORY[0x263F08D68]);
  uint64_t v2 = (void *)sub_24D2190E0();
  id v3 = objc_msgSend(v1, sel_initWithMachServiceName_options_, v2, 0);

  uint64_t v4 = *(void **)(v0 + 16);
  *(void *)(v0 + 16) = v3;

  uint64_t v5 = *(void **)(v0 + 16);
  if (v5)
  {
    uint64_t v6 = self;
    id v7 = v5;
    id v8 = objc_msgSend(v6, sel_interfaceWithProtocol_, &unk_26FF7F0A0);
    objc_msgSend(v7, sel_setRemoteObjectInterface_, v8);

    uint64_t v9 = *(void **)(v0 + 16);
    if (v9)
    {
      uint64_t v21 = sub_24D218144;
      uint64_t v22 = v0;
      uint64_t v17 = MEMORY[0x263EF8330];
      uint64_t v18 = 1107296256;
      uint64_t v19 = sub_24D2174E0;
      uint64_t v20 = &block_descriptor_16_1;
      uint64_t v10 = _Block_copy(&v17);
      id v11 = v9;
      swift_retain();
      swift_release();
      objc_msgSend(v11, sel_setInterruptionHandler_, v10);
      _Block_release(v10);

      os_log_type_t v12 = *(void **)(v0 + 16);
      if (v12)
      {
        uint64_t v21 = sub_24D218168;
        uint64_t v22 = v0;
        uint64_t v17 = MEMORY[0x263EF8330];
        uint64_t v18 = 1107296256;
        uint64_t v19 = sub_24D2174E0;
        uint64_t v20 = &block_descriptor_19;
        uint64_t v13 = _Block_copy(&v17);
        swift_retain();
        id v14 = v12;
        swift_release();
        objc_msgSend(v14, sel_setInvalidationHandler_, v13);
        _Block_release(v13);

        id v15 = *(void **)(v0 + 16);
        if (v15) {
          objc_msgSend(v15, sel_resume);
        }
      }
    }
  }
  return v0;
}

uint64_t sub_24D2174E0(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

id sub_24D217524()
{
  id v1 = *(void **)(v0 + 16);
  if (v1)
  {
    objc_msgSend(v1, sel_suspend);
    uint64_t v2 = *(void **)(v0 + 16);
    *(void *)(v0 + 16) = 0;
  }
  id v3 = objc_allocWithZone(MEMORY[0x263F08D68]);
  uint64_t v4 = (void *)sub_24D2190E0();
  id v5 = objc_msgSend(v3, sel_initWithMachServiceName_options_, v4, 0);

  uint64_t v6 = *(void **)(v0 + 16);
  *(void *)(v0 + 16) = v5;

  id v7 = *(void **)(v0 + 16);
  if (!v7) {
    goto LABEL_7;
  }
  id v8 = self;
  id v9 = v7;
  id v10 = objc_msgSend(v8, sel_interfaceWithProtocol_, &unk_26FF7F0A0);
  objc_msgSend(v9, sel_setRemoteObjectInterface_, v10);

  id v11 = *(void **)(v0 + 16);
  if (!v11) {
    goto LABEL_7;
  }
  uint64_t v23 = sub_24D218144;
  uint64_t v24 = v0;
  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 1107296256;
  uint64_t v21 = sub_24D2174E0;
  uint64_t v22 = &block_descriptor_10;
  os_log_type_t v12 = _Block_copy(&v19);
  id v13 = v11;
  swift_retain();
  swift_release();
  objc_msgSend(v13, sel_setInterruptionHandler_, v12);
  _Block_release(v12);

  id v14 = *(void **)(v0 + 16);
  if (v14)
  {
    uint64_t v23 = sub_24D218168;
    uint64_t v24 = v0;
    uint64_t v19 = MEMORY[0x263EF8330];
    uint64_t v20 = 1107296256;
    uint64_t v21 = sub_24D2174E0;
    uint64_t v22 = &block_descriptor_13;
    id v15 = _Block_copy(&v19);
    swift_retain();
    id v16 = v14;
    swift_release();
    objc_msgSend(v16, sel_setInvalidationHandler_, v15);
    _Block_release(v15);

    uint64_t v17 = *(void **)(v0 + 16);
  }
  else
  {
LABEL_7:
    uint64_t v17 = 0;
  }
  return objc_msgSend(v17, sel_resume);
}

uint64_t sub_24D217798(uint64_t a1, const char *a2)
{
  uint64_t v3 = sub_24D219020();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B18A2F8 != -1) {
    swift_once();
  }
  uint64_t v7 = __swift_project_value_buffer(v3, (uint64_t)qword_26B18A8F0);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v7, v3);
  id v8 = sub_24D219000();
  os_log_type_t v9 = sub_24D2192D0();
  if (os_log_type_enabled(v8, v9))
  {
    id v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_24D1B6000, v8, v9, a2, v10, 2u);
    MEMORY[0x253322AA0](v10, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_24D217944(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_24D219020();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  id v8 = (char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  os_log_type_t v9 = *(void **)(v2 + 16);
  if (v9 || (sub_24D217524(), (os_log_type_t v9 = *(void **)(v2 + 16)) != 0))
  {
    id v10 = (void *)swift_allocObject();
    v10[2] = v2;
    v10[3] = a1;
    v10[4] = a2;
    uint64_t v23 = sub_24D2180D0;
    uint64_t v24 = v10;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_24D217FCC;
    uint64_t v22 = &block_descriptor_6;
    id v11 = _Block_copy(aBlock);
    id v12 = v9;
    swift_retain();
    swift_retain();
    swift_release();
    id v13 = objc_msgSend(v12, sel_remoteObjectProxyWithErrorHandler_, v11);
    _Block_release(v11);

    sub_24D219330();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v25, 0, sizeof(v25));
  }
  sub_24D2180DC((uint64_t)v25, (uint64_t)aBlock);
  if (!v22)
  {
    sub_24D1DF4D0((uint64_t)aBlock);
LABEL_9:
    if (qword_26985BA68 != -1) {
      swift_once();
    }
    uint64_t v16 = __swift_project_value_buffer(v5, (uint64_t)qword_26985D068);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v16, v5);
    uint64_t v17 = sub_24D219000();
    os_log_type_t v18 = sub_24D2192D0();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl(&dword_24D1B6000, v17, v18, "Returned host vended by XPC service doesn't conform to HomeEnergyXPCProtocol.", v19, 2u);
      MEMORY[0x253322AA0](v19, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    exit(1);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A580);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_9;
  }
  uint64_t v14 = v20[1];
  sub_24D1DF4D0((uint64_t)v25);
  return v14;
}

uint64_t sub_24D217C64(void *a1, uint64_t a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t v8 = sub_24D219020();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  id v11 = (char *)v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B18A2F8 != -1) {
    swift_once();
  }
  uint64_t v12 = __swift_project_value_buffer(v8, (uint64_t)qword_26B18A8F0);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v12, v8);
  swift_retain();
  id v13 = a1;
  swift_retain();
  id v14 = a1;
  id v15 = sub_24D219000();
  os_log_type_t v16 = sub_24D2192D0();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    v26[0] = v18;
    *(_DWORD *)uint64_t v17 = 136315394;
    uint64_t v27 = a3;
    uint64_t v28 = *(void *)a2;
    uint64_t v29 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A8E0);
    uint64_t v19 = sub_24D219100();
    v26[1] = a4;
    uint64_t v28 = sub_24D1D0A78(v19, v20, &v29);
    sub_24D219310();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 12) = 2082;
    uint64_t v28 = (uint64_t)a1;
    id v21 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5D0);
    uint64_t v22 = sub_24D219100();
    uint64_t v28 = sub_24D1D0A78(v22, v23, &v29);
    a3 = v27;
    sub_24D219310();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_24D1B6000, v15, v16, "%s: remoteObjectProxyWithErrorHandler error: %{public}s", (uint8_t *)v17, 0x16u);
    uint64_t v24 = v26[0];
    swift_arrayDestroy();
    MEMORY[0x253322AA0](v24, -1, -1);
    MEMORY[0x253322AA0](v17, -1, -1);
  }
  else
  {
    swift_release_n();
  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  objc_msgSend(*(id *)(a2 + 16), sel_invalidate);
  return a3(a1);
}

void sub_24D217FCC(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_24D218034()
{
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t type metadata accessor for HomeEnergyXPCConnection()
{
  return self;
}

uint64_t sub_24D218090()
{
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24D2180D0(void *a1)
{
  return sub_24D217C64(a1, *(void *)(v1 + 16), *(uint64_t (**)(void))(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_24D2180DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A5D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24D218144()
{
  return sub_24D217798(v0, "XPC connection interrupted");
}

uint64_t sub_24D218168()
{
  return sub_24D217798(v0, "XPC connection invalidated");
}

unint64_t HomeEnergyError.description.getter()
{
  unint64_t result = 0xD000000000000011;
  switch(*v0)
  {
    case 1:
      return result;
    case 2:
      unint64_t result = 0xD000000000000014;
      break;
    case 3:
      unint64_t result = 0xD00000000000001ELL;
      break;
    case 4:
    case 0x12:
    case 0x13:
      unint64_t result = 0xD000000000000018;
      break;
    case 5:
      unint64_t result = 0xD000000000000020;
      break;
    case 6:
      unint64_t result = 0xD000000000000021;
      break;
    case 7:
      unint64_t result = 0xD000000000000019;
      break;
    case 8:
      unint64_t result = 0x6C706D6920746F4ELL;
      break;
    case 9:
      unint64_t result = 0x69746E6520746F4ELL;
      break;
    case 0xA:
      unint64_t result = 0x746F6E2065746953;
      break;
    case 0xB:
      unint64_t result = 0x6E6F697461636F4CLL;
      break;
    case 0xC:
      unint64_t result = 0xD000000000000017;
      break;
    case 0xD:
      unint64_t result = 0x74694B64756F6C43;
      break;
    case 0xE:
      unint64_t result = 0xD000000000000019;
      break;
    case 0xF:
      unint64_t result = 0xD000000000000023;
      break;
    case 0x10:
      unint64_t result = 0xD00000000000001BLL;
      break;
    case 0x11:
      unint64_t result = 0xD00000000000001CLL;
      break;
    case 0x14:
      unint64_t result = 0xD000000000000013;
      break;
    case 0x15:
      unint64_t result = 0xD00000000000001BLL;
      break;
    case 0x16:
      unint64_t result = 0x20656E6F5A204B43;
      break;
    case 0x17:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 0x18:
      unint64_t result = 0xD00000000000002ALL;
      break;
    case 0x19:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 0x1A:
      unint64_t result = 0xD000000000000029;
      break;
    case 0x1B:
      unint64_t result = 0xD000000000000010;
      break;
    case 0x1C:
      unint64_t result = 0x6920444965746953;
      break;
    default:
      unint64_t result = 0x206E776F6E6B6E55;
      break;
  }
  return result;
}

EnergyKit::HomeEnergyError_optional __swiftcall HomeEnergyError.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 0;
  char v3 = 11;
  switch(rawValue)
  {
    case 0:
      goto LABEL_13;
    case 1:
      char v2 = 1;
      goto LABEL_13;
    case 2:
      char v2 = 2;
      goto LABEL_13;
    case 3:
      char v2 = 3;
      goto LABEL_13;
    case 4:
      char v2 = 4;
      goto LABEL_13;
    case 5:
      char v2 = 5;
      goto LABEL_13;
    case 6:
      char v2 = 6;
      goto LABEL_13;
    case 7:
      char v2 = 7;
      goto LABEL_13;
    case 8:
      char v2 = 8;
      goto LABEL_13;
    case 9:
      char v2 = 9;
      goto LABEL_13;
    case 10:
      char v2 = 10;
LABEL_13:
      char v3 = v2;
      goto LABEL_14;
    case 11:
LABEL_14:
      *uint64_t v1 = v3;
      break;
    case 12:
      *uint64_t v1 = 12;
      break;
    case 13:
      *uint64_t v1 = 13;
      break;
    case 14:
      *uint64_t v1 = 14;
      break;
    case 15:
      *uint64_t v1 = 15;
      break;
    case 16:
      *uint64_t v1 = 16;
      break;
    case 17:
      *uint64_t v1 = 17;
      break;
    case 18:
      *uint64_t v1 = 18;
      break;
    case 19:
      *uint64_t v1 = 19;
      break;
    case 20:
      *uint64_t v1 = 20;
      break;
    case 21:
      *uint64_t v1 = 21;
      break;
    case 22:
      *uint64_t v1 = 22;
      break;
    case 23:
      *uint64_t v1 = 23;
      break;
    case 24:
      *uint64_t v1 = 24;
      break;
    case 25:
      *uint64_t v1 = 25;
      break;
    case 26:
      *uint64_t v1 = 26;
      break;
    case 27:
      *uint64_t v1 = 27;
      break;
    case 28:
      *uint64_t v1 = 28;
      break;
    default:
      *uint64_t v1 = 29;
      break;
  }
  return (EnergyKit::HomeEnergyError_optional)rawValue;
}

uint64_t HomeEnergyError.rawValue.getter()
{
  return *v0;
}

unint64_t sub_24D21869C()
{
  unint64_t result = qword_26985C448;
  if (!qword_26985C448)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26985C448);
  }
  return result;
}

EnergyKit::HomeEnergyError_optional sub_24D2186F0(Swift::Int *a1)
{
  return HomeEnergyError.init(rawValue:)(*a1);
}

uint64_t sub_24D2186F8(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_24D2188E8();
  unint64_t v5 = sub_24D21893C();

  return MEMORY[0x270F9FB50](a1, a2, v4, v5);
}

uint64_t getEnumTagSinglePayload for HomeEnergyError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xE4) {
    goto LABEL_17;
  }
  if (a2 + 28 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 28) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 28;
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
      return (*a1 | (v4 << 8)) - 28;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 28;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x1D;
  int v8 = v6 - 29;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for HomeEnergyError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 28 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 28) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xE4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xE3)
  {
    unsigned int v6 = ((a2 - 228) >> 8) + 1;
    *unint64_t result = a2 + 28;
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
        JUMPOUT(0x24D2188B0);
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
          *unint64_t result = a2 + 28;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HomeEnergyError()
{
  return &type metadata for HomeEnergyError;
}

unint64_t sub_24D2188E8()
{
  unint64_t result = qword_26985C450;
  if (!qword_26985C450)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26985C450);
  }
  return result;
}

unint64_t sub_24D21893C()
{
  unint64_t result = qword_26985C458;
  if (!qword_26985C458)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26985C458);
  }
  return result;
}

uint64_t sub_24D218990()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_24D2189A0()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_24D2189B0()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_24D2189C0()
{
  return MEMORY[0x270EEE360]();
}

uint64_t sub_24D2189D0()
{
  return MEMORY[0x270EEE378]();
}

uint64_t sub_24D2189E0()
{
  return MEMORY[0x270EEE388]();
}

uint64_t sub_24D2189F0()
{
  return MEMORY[0x270EEE3B8]();
}

uint64_t sub_24D218A00()
{
  return MEMORY[0x270EEE3D0]();
}

uint64_t sub_24D218A10()
{
  return MEMORY[0x270EF0020]();
}

uint64_t sub_24D218A20()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_24D218A30()
{
  return MEMORY[0x270EF0898]();
}

uint64_t sub_24D218A40()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_24D218A50()
{
  return MEMORY[0x270EF09A8]();
}

uint64_t sub_24D218A60()
{
  return MEMORY[0x270EF09B8]();
}

uint64_t sub_24D218A70()
{
  return MEMORY[0x270EF09C0]();
}

uint64_t sub_24D218A80()
{
  return MEMORY[0x270EF0B88]();
}

uint64_t sub_24D218A90()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_24D218AA0()
{
  return MEMORY[0x270EF0C10]();
}

uint64_t sub_24D218AB0()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_24D218AC0()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_24D218AD0()
{
  return MEMORY[0x270F27130]();
}

uint64_t sub_24D218AE0()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_24D218AF0()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t sub_24D218B00()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_24D218B10()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_24D218B20()
{
  return MEMORY[0x270EF10C8]();
}

uint64_t sub_24D218B30()
{
  return MEMORY[0x270EF10D8]();
}

uint64_t sub_24D218B40()
{
  return MEMORY[0x270EF1100]();
}

uint64_t sub_24D218B50()
{
  return MEMORY[0x270EF1388]();
}

uint64_t sub_24D218B60()
{
  return MEMORY[0x270EF1410]();
}

uint64_t sub_24D218B70()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_24D218B80()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_24D218B90()
{
  return MEMORY[0x270EF1570]();
}

uint64_t sub_24D218BA0()
{
  return MEMORY[0x270EF15C8]();
}

uint64_t sub_24D218BB0()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_24D218BC0()
{
  return MEMORY[0x270F3C418]();
}

uint64_t sub_24D218BD0()
{
  return MEMORY[0x270F271A0]();
}

uint64_t sub_24D218BE0()
{
  return MEMORY[0x270F271A8]();
}

uint64_t sub_24D218BF0()
{
  return MEMORY[0x270F271B8]();
}

uint64_t sub_24D218C00()
{
  return MEMORY[0x270F271C8]();
}

uint64_t sub_24D218C10()
{
  return MEMORY[0x270F271E0]();
}

uint64_t sub_24D218C20()
{
  return MEMORY[0x270F271F0]();
}

uint64_t sub_24D218C30()
{
  return MEMORY[0x270F27300]();
}

uint64_t sub_24D218C40()
{
  return MEMORY[0x270F27308]();
}

uint64_t sub_24D218C50()
{
  return MEMORY[0x270F27310]();
}

uint64_t sub_24D218C60()
{
  return MEMORY[0x270F27318]();
}

uint64_t sub_24D218C70()
{
  return MEMORY[0x270F27320]();
}

uint64_t sub_24D218C80()
{
  return MEMORY[0x270F27328]();
}

uint64_t sub_24D218C90()
{
  return MEMORY[0x270F27330]();
}

uint64_t sub_24D218CA0()
{
  return MEMORY[0x270F27338]();
}

uint64_t sub_24D218CB0()
{
  return MEMORY[0x270F27340]();
}

uint64_t sub_24D218CC0()
{
  return MEMORY[0x270F27348]();
}

uint64_t sub_24D218CD0()
{
  return MEMORY[0x270F273C0]();
}

uint64_t sub_24D218CE0()
{
  return MEMORY[0x270F273D0]();
}

uint64_t sub_24D218CF0()
{
  return MEMORY[0x270F273E0]();
}

uint64_t sub_24D218D00()
{
  return MEMORY[0x270F273E8]();
}

uint64_t sub_24D218D10()
{
  return MEMORY[0x270F273F8]();
}

uint64_t sub_24D218D20()
{
  return MEMORY[0x270F27408]();
}

uint64_t sub_24D218D30()
{
  return MEMORY[0x270F27418]();
}

uint64_t sub_24D218D40()
{
  return MEMORY[0x270F27428]();
}

uint64_t sub_24D218D50()
{
  return MEMORY[0x270F27430]();
}

uint64_t sub_24D218D60()
{
  return MEMORY[0x270F27440]();
}

uint64_t sub_24D218D70()
{
  return MEMORY[0x270F27450]();
}

uint64_t sub_24D218D80()
{
  return MEMORY[0x270F27468]();
}

uint64_t sub_24D218D90()
{
  return MEMORY[0x270F27478]();
}

uint64_t sub_24D218DA0()
{
  return MEMORY[0x270F27488]();
}

uint64_t sub_24D218DB0()
{
  return MEMORY[0x270F274A8]();
}

uint64_t sub_24D218DC0()
{
  return MEMORY[0x270F274B8]();
}

uint64_t sub_24D218DD0()
{
  return MEMORY[0x270F274C8]();
}

uint64_t sub_24D218DE0()
{
  return MEMORY[0x270F274D0]();
}

uint64_t sub_24D218DF0()
{
  return MEMORY[0x270F274E0]();
}

uint64_t sub_24D218E00()
{
  return MEMORY[0x270F274F0]();
}

uint64_t sub_24D218E10()
{
  return MEMORY[0x270F27530]();
}

uint64_t sub_24D218E20()
{
  return MEMORY[0x270F27540]();
}

uint64_t sub_24D218E30()
{
  return MEMORY[0x270F27560]();
}

uint64_t sub_24D218E40()
{
  return MEMORY[0x270F27590]();
}

uint64_t sub_24D218E50()
{
  return MEMORY[0x270F275A0]();
}

uint64_t sub_24D218E60()
{
  return MEMORY[0x270F275A8]();
}

uint64_t sub_24D218E70()
{
  return MEMORY[0x270F275B0]();
}

uint64_t sub_24D218E80()
{
  return MEMORY[0x270F275C0]();
}

uint64_t sub_24D218E90()
{
  return MEMORY[0x270F275D0]();
}

uint64_t sub_24D218EA0()
{
  return MEMORY[0x270F275D8]();
}

uint64_t sub_24D218EB0()
{
  return MEMORY[0x270F275E0]();
}

uint64_t sub_24D218EC0()
{
  return MEMORY[0x270F275F0]();
}

uint64_t sub_24D218ED0()
{
  return MEMORY[0x270F27600]();
}

uint64_t sub_24D218EE0()
{
  return MEMORY[0x270F27658]();
}

uint64_t sub_24D218EF0()
{
  return MEMORY[0x270F27660]();
}

uint64_t sub_24D218F00()
{
  return MEMORY[0x270F27670]();
}

uint64_t sub_24D218F10()
{
  return MEMORY[0x270F27678]();
}

uint64_t sub_24D218F20()
{
  return MEMORY[0x270F276A0]();
}

uint64_t sub_24D218F30()
{
  return MEMORY[0x270F276B0]();
}

uint64_t sub_24D218F40()
{
  return MEMORY[0x270F276D8]();
}

uint64_t sub_24D218F50()
{
  return MEMORY[0x270F27718]();
}

uint64_t sub_24D218F60()
{
  return MEMORY[0x270F27738]();
}

uint64_t sub_24D218F70()
{
  return MEMORY[0x270F27740]();
}

uint64_t sub_24D218F80()
{
  return MEMORY[0x270F27750]();
}

uint64_t sub_24D218F90()
{
  return MEMORY[0x270F27760]();
}

uint64_t sub_24D218FA0()
{
  return MEMORY[0x270F3C4E8]();
}

uint64_t sub_24D218FB0()
{
  return MEMORY[0x270F3C500]();
}

uint64_t sub_24D218FC0()
{
  return MEMORY[0x270F3C558]();
}

uint64_t sub_24D218FD0()
{
  return MEMORY[0x270F3C6A8]();
}

uint64_t sub_24D218FE0()
{
  return MEMORY[0x270FA2D68]();
}

uint64_t sub_24D218FF0()
{
  return MEMORY[0x270FA2D88]();
}

uint64_t sub_24D219000()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24D219010()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_24D219020()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24D219030()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_24D219040()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_24D219050()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_24D219060()
{
  return MEMORY[0x270F9D148]();
}

uint64_t sub_24D219070()
{
  return MEMORY[0x270F9D1C0]();
}

uint64_t sub_24D219080()
{
  return MEMORY[0x270F9D1D0]();
}

uint64_t sub_24D219090()
{
  return MEMORY[0x270F9D200]();
}

uint64_t sub_24D2190A0()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_24D2190B0()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_24D2190C0()
{
  return MEMORY[0x270F9D498]();
}

uint64_t sub_24D2190D0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_24D2190E0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_24D2190F0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_24D219100()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_24D219110()
{
  return MEMORY[0x270F9D610]();
}

uint64_t sub_24D219120()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24D219130()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24D219140()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24D219150()
{
  return MEMORY[0x270F9D9A8]();
}

uint64_t sub_24D219160()
{
  return MEMORY[0x270F9D9B0]();
}

uint64_t sub_24D219170()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_24D219180()
{
  return MEMORY[0x270EF1BA8]();
}

uint64_t sub_24D219190()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_24D2191A0()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_24D2191B0()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_24D2191C0()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_24D2191D0()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_24D2191E0()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_24D2191F0()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_24D219200()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_24D219210()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_24D219220()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_24D219230()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_24D219240()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_24D219250()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_24D219260()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_24D219270()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_24D219280()
{
  return MEMORY[0x270F9DEB0]();
}

uint64_t sub_24D219290()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_24D2192A0()
{
  return MEMORY[0x270F9E168]();
}

uint64_t sub_24D2192B0()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_24D2192C0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_24D2192D0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_24D2192E0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_24D2192F0()
{
  return MEMORY[0x270F277B8]();
}

uint64_t sub_24D219300()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_24D219310()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24D219320()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24D219330()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_24D219340()
{
  return MEMORY[0x270F9E6C0]();
}

uint64_t sub_24D219350()
{
  return MEMORY[0x270F9E6E0]();
}

uint64_t sub_24D219360()
{
  return MEMORY[0x270F9E700]();
}

uint64_t sub_24D219370()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_24D219380()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_24D219390()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_24D2193A0()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_24D2193B0()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_24D2193C0()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_24D2193D0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_24D2193E0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24D2193F0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24D219400()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_24D219410()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_24D219420()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_24D219430()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_24D219440()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_24D219450()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_24D219460()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24D219470()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_24D219480()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_24D219490()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_24D2194A0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24D2194B0()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_24D2194C0()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_24D2194D0()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_24D2194E0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24D219500()
{
  return MEMORY[0x270F9FA68]();
}

uint64_t sub_24D219510()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_24D219520()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_24D219530()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_24D219540()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_24D219550()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_24D219560()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_24D219580()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_24D219590()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24D2195A0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24D2195B0()
{
  return MEMORY[0x270F9FC90]();
}

BOOL CLLocationCoordinate2DIsValid(CLLocationCoordinate2D coord)
{
  return MEMORY[0x270EE7460]((__n128)coord, *(__n128 *)&coord.longitude);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

{
  return MEMORY[0x270F9A3C0]();
}

{
  return MEMORY[0x270F9A3C8]();
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

void exit(int a1)
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

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
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

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x270FA01D0]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x270FA01D8]();
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

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x270FA2400]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x270FA2408]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
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

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x270FA0598]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
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