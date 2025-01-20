uint64_t sub_24CA1EB80()
{
  uint64_t v0;
  uint64_t v1;

  swift_getKeyPath();
  sub_24CA207F0(&qword_269806358);
  sub_24CA40228();
  swift_release();
  v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_24CA1EC1C@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_24CA207F0(&qword_269806358);
  sub_24CA40228();
  swift_release();
  uint64_t v4 = *(void *)(v3 + 24);
  *a2 = *(void *)(v3 + 16);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_24CA1ECB4()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_24CA1ED84()
{
  swift_getKeyPath();
  sub_24CA207F0(&qword_269806358);
  sub_24CA40228();
  swift_release();
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_24CA1EE20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 32) = a2;
  *(void *)(a1 + 40) = a3;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24CA1EE5C()
{
  swift_getKeyPath();
  sub_24CA207F0(&qword_269806358);
  sub_24CA40228();
  swift_release();
  uint64_t v1 = *(void *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_24CA1EEF8@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_24CA207F0(&qword_269806358);
  sub_24CA40228();
  swift_release();
  uint64_t v4 = *(void *)(v3 + 56);
  *a2 = *(void *)(v3 + 48);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_24CA1EF90()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_24CA1F060()
{
  swift_getKeyPath();
  sub_24CA207F0(&qword_269806358);
  sub_24CA40228();
  swift_release();
  uint64_t v1 = *(void **)(v0 + 64);
  if (v1)
  {
    id v2 = objc_msgSend(v1, sel_bundleIdentifier);
    if (v2)
    {
      uint64_t v3 = v2;
      sub_24CA40668();
    }
  }
  swift_getKeyPath();
  MEMORY[0x270FA5388]();
  sub_24CA40218();
  swift_release();
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  sub_24CA40228();
  swift_release();
  uint64_t v4 = *(void **)(v0 + 64);
  if (v4)
  {
    id v5 = objc_msgSend(v4, sel_localizedName);
    sub_24CA40668();
  }
  swift_getKeyPath();
  MEMORY[0x270FA5388]();
  sub_24CA40218();
  swift_release();
  return swift_bridgeObjectRelease();
}

void *sub_24CA1F2A4()
{
  swift_getKeyPath();
  sub_24CA207F0(&qword_269806358);
  sub_24CA40228();
  swift_release();
  uint64_t v1 = *(void **)(v0 + 64);
  id v2 = v1;
  return v1;
}

void sub_24CA1F338(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 64);
  *(void *)(a1 + 64) = a2;
  id v3 = a2;

  sub_24CA1F060();
}

uint64_t sub_24CA1F388(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_24CA401E8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = &v12[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  *(void *)(v2 + 16) = 0;
  *(void *)(v2 + 24) = 0;
  *(void *)(v2 + 32) = 0;
  *(void *)(v2 + 40) = 0xE000000000000000;
  sub_24CA401D8();
  uint64_t v8 = sub_24CA401B8();
  uint64_t v10 = v9;
  (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
  *(void *)(v2 + 48) = v8;
  *(void *)(v2 + 56) = v10;
  *(void *)(v2 + 64) = 0;
  *(void *)(v2 + 72) = 0;
  *(unsigned char *)(v2 + 80) = 3;
  sub_24CA40258();
  swift_getKeyPath();
  uint64_t v13 = v2;
  v14 = a1;
  uint64_t v15 = v2;
  sub_24CA207F0(&qword_269806358);
  sub_24CA40218();
  swift_release();

  return v2;
}

uint64_t sub_24CA1F520()
{
  swift_getKeyPath();
  sub_24CA207F0(&qword_269806358);
  sub_24CA40228();
  swift_release();
  uint64_t v1 = *(void **)(v0 + 72);
  if (v1)
  {
    id v2 = objc_msgSend(v1, sel_bundleId);
    if (v2)
    {
      id v3 = v2;
      sub_24CA40668();
    }
  }
  swift_getKeyPath();
  MEMORY[0x270FA5388]();
  sub_24CA40218();
  swift_release();
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  sub_24CA40228();
  swift_release();
  uint64_t v4 = *(void **)(v0 + 72);
  if (v4)
  {
    id v5 = objc_msgSend(v4, sel_localizedDisplayName);
    if (v5)
    {
      uint64_t v6 = v5;
      sub_24CA40668();
    }
  }
  swift_getKeyPath();
  MEMORY[0x270FA5388]();
  sub_24CA40218();
  swift_release();
  return swift_bridgeObjectRelease();
}

void *sub_24CA1F768()
{
  swift_getKeyPath();
  sub_24CA207F0(&qword_269806358);
  sub_24CA40228();
  swift_release();
  uint64_t v1 = *(void **)(v0 + 72);
  id v2 = v1;
  return v1;
}

id sub_24CA1F7FC@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_24CA207F0(&qword_269806358);
  sub_24CA40228();
  swift_release();
  uint64_t v4 = *(void **)(v3 + 72);
  *a2 = v4;

  return v4;
}

void sub_24CA1F8A0(void **a1)
{
  uint64_t v1 = *a1;
  swift_getKeyPath();
  sub_24CA207F0(&qword_269806358);
  id v2 = v1;
  sub_24CA40218();
  swift_release();
}

void sub_24CA1F968(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 72);
  *(void *)(a1 + 72) = a2;
  id v3 = a2;

  sub_24CA1F520();
}

uint64_t sub_24CA1F9B8(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_24CA401E8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = &v12[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  *(void *)(v2 + 16) = 0;
  *(void *)(v2 + 24) = 0;
  *(void *)(v2 + 32) = 0;
  *(void *)(v2 + 40) = 0xE000000000000000;
  sub_24CA401D8();
  uint64_t v8 = sub_24CA401B8();
  uint64_t v10 = v9;
  (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
  *(void *)(v2 + 48) = v8;
  *(void *)(v2 + 56) = v10;
  *(void *)(v2 + 64) = 0;
  *(void *)(v2 + 72) = 0;
  *(unsigned char *)(v2 + 80) = 3;
  sub_24CA40258();
  swift_getKeyPath();
  uint64_t v13 = v2;
  v14 = a1;
  uint64_t v15 = v2;
  sub_24CA207F0(&qword_269806358);
  sub_24CA40218();
  swift_release();

  return v2;
}

uint64_t sub_24CA1FB50()
{
  swift_getKeyPath();
  sub_24CA207F0(&qword_269806358);
  sub_24CA40228();
  swift_release();
  return *(unsigned __int8 *)(v0 + 80);
}

uint64_t sub_24CA1FBDC(uint64_t result, char a2)
{
  *(unsigned char *)(result + 80) = a2;
  return result;
}

unint64_t sub_24CA1FBE4(unsigned __int8 a1)
{
  unint64_t v2 = v1;
  uint64_t v4 = sub_24CA401E8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(v2 + 16) = 0;
  *(void *)(v2 + 24) = 0;
  *(void *)(v2 + 32) = 0;
  *(void *)(v2 + 40) = 0xE000000000000000;
  sub_24CA401D8();
  uint64_t v8 = sub_24CA401B8();
  uint64_t v10 = v9;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  *(void *)(v2 + 48) = v8;
  *(void *)(v2 + 56) = v10;
  *(void *)(v2 + 64) = 0;
  *(void *)(v2 + 72) = 0;
  *(unsigned char *)(v2 + 80) = 3;
  sub_24CA40258();
  if (a1)
  {
    char v11 = sub_24CA40978();
    swift_bridgeObjectRelease();
    if (v11)
    {
      swift_release();
      return 0;
    }
    else
    {
      uint64_t KeyPath = swift_getKeyPath();
      MEMORY[0x270FA5388](KeyPath);
      *(&v21 - 2) = v2;
      *((unsigned char *)&v21 - 8) = a1;
      int v22 = a1;
      unint64_t v23 = v2;
      sub_24CA207F0(&qword_269806358);
      unint64_t v21 = (unint64_t)"RelayCallingNotApplicable";
      sub_24CA40218();
      swift_release();
      uint64_t v13 = sub_24CA3B22C();
      uint64_t v15 = v14;
      uint64_t v16 = swift_getKeyPath();
      MEMORY[0x270FA5388](v16);
      *(&v21 - 4) = v2;
      *(&v21 - 3) = v13;
      *(&v21 - 2) = (unint64_t)v15;
      unint64_t v23 = v2;
      sub_24CA40218();
      swift_release();
      swift_bridgeObjectRelease();
      if (v22 == 2) {
        unint64_t v17 = 0xD000000000000016;
      }
      else {
        unint64_t v17 = 0xD000000000000010;
      }
      if (v22 == 2) {
        unint64_t v18 = 0x800000024CA41FF0;
      }
      else {
        unint64_t v18 = v21 | 0x8000000000000000;
      }
      uint64_t v19 = swift_getKeyPath();
      MEMORY[0x270FA5388](v19);
      *(&v21 - 4) = v2;
      *(&v21 - 3) = v17;
      *(&v21 - 2) = v18;
      unint64_t v23 = v2;
      sub_24CA40218();
      swift_release();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    swift_release();
    swift_bridgeObjectRelease();
    return 0;
  }
  return v2;
}

uint64_t AppRecord.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  uint64_t v1 = v0 + OBJC_IVAR____TtC21DefaultAppsSettingsUI9AppRecord___observationRegistrar;
  uint64_t v2 = sub_24CA40268();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t AppRecord.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  uint64_t v1 = (char *)v0 + OBJC_IVAR____TtC21DefaultAppsSettingsUI9AppRecord___observationRegistrar;
  uint64_t v2 = sub_24CA40268();
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *((unsigned int *)*v0 + 12);
  uint64_t v4 = *((unsigned __int16 *)*v0 + 26);

  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t AppRecord.id.getter()
{
  swift_getKeyPath();
  sub_24CA207F0(&qword_269806358);
  sub_24CA40228();
  swift_release();
  if (v0[3])
  {
    uint64_t v1 = v0[2];
  }
  else
  {
    swift_getKeyPath();
    sub_24CA40228();
    swift_release();
    uint64_t v1 = v0[6];
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t type metadata accessor for AppRecord()
{
  uint64_t result = qword_269806368;
  if (!qword_269806368) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24CA2021C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = AppRecord.id.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_24CA2024C(uint64_t *a1, uint64_t *a2)
{
  return _s21DefaultAppsSettingsUI9AppRecordC2eeoiySbAC_ACtFZ_0(*a1, *a2);
}

uint64_t AppRecord.hash(into:)()
{
  swift_getKeyPath();
  sub_24CA207F0(&qword_269806358);
  sub_24CA40228();
  swift_release();
  if (!*(void *)(v0 + 24))
  {
    swift_getKeyPath();
    sub_24CA40228();
    swift_release();
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRetain();
  sub_24CA40698();
  return swift_bridgeObjectRelease();
}

uint64_t AppRecord.hashValue.getter()
{
  return sub_24CA409A8();
}

uint64_t sub_24CA2039C()
{
  return sub_24CA409A8();
}

uint64_t sub_24CA203E0()
{
  return AppRecord.hash(into:)();
}

uint64_t sub_24CA20404()
{
  return sub_24CA409A8();
}

void sub_24CA20444(void *a1@<X8>)
{
  *a1 = *v1;
}

void *sub_24CA20450@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

BOOL sub_24CA20460(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t _s21DefaultAppsSettingsUI9AppRecordC2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  swift_getKeyPath();
  sub_24CA207F0(&qword_269806358);
  sub_24CA40228();
  swift_release();
  if (*(unsigned char *)(a1 + 80) != 3)
  {
    swift_getKeyPath();
    sub_24CA40228();
    swift_release();
    if (*(unsigned char *)(a2 + 80) != 3)
    {
      swift_getKeyPath();
      sub_24CA40228();
      swift_release();
      int v8 = *(unsigned __int8 *)(a1 + 80);
      swift_getKeyPath();
      sub_24CA40228();
      swift_release();
      int v9 = *(unsigned __int8 *)(a2 + 80);
      char v7 = v9 == 3 && v8 == 3;
      if (v8 == 3 || v9 == 3) {
        return v7 & 1;
      }
      unint64_t v10 = 0xD000000000000010;
      unint64_t v11 = 0x800000024CA41FB0;
      if (v8)
      {
        if (v8 == 1)
        {
          unint64_t v12 = 0x800000024CA41FD0;
          unint64_t v13 = 0xD000000000000010;
          if (v9) {
            goto LABEL_16;
          }
LABEL_23:
          if (v13 == 0xD000000000000019) {
            goto LABEL_27;
          }
          goto LABEL_30;
        }
        unint64_t v13 = 0xD000000000000016;
        unint64_t v12 = 0x800000024CA41FF0;
        if (!v9) {
          goto LABEL_23;
        }
      }
      else
      {
        unint64_t v13 = 0xD000000000000019;
        unint64_t v12 = 0x800000024CA41FB0;
        if (!v9) {
          goto LABEL_23;
        }
      }
LABEL_16:
      if (v9 == 1)
      {
        v14 = "RelayCallingNone";
      }
      else
      {
        unint64_t v10 = 0xD000000000000016;
        v14 = "RelayCallingFromiPhone";
      }
      unint64_t v11 = (unint64_t)(v14 - 32) | 0x8000000000000000;
      if (v13 == v10)
      {
LABEL_27:
        if (v12 == v11)
        {
          swift_bridgeObjectRelease_n();
          goto LABEL_29;
        }
      }
LABEL_30:
      char v7 = sub_24CA40978();
      swift_bridgeObjectRelease();
      goto LABEL_31;
    }
  }
  swift_getKeyPath();
  sub_24CA40228();
  swift_release();
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 24);
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  sub_24CA40228();
  swift_release();
  uint64_t v6 = *(void *)(a2 + 24);
  char v7 = v6 == 0;
  if (v4)
  {
    if (v6)
    {
      if (v5 == *(void *)(a2 + 16) && v4 == v6)
      {
        swift_bridgeObjectRelease();
LABEL_29:
        char v7 = 1;
        return v7 & 1;
      }
      char v7 = sub_24CA40978();
LABEL_31:
      swift_bridgeObjectRelease();
      return v7 & 1;
    }
    swift_bridgeObjectRelease();
    char v7 = 0;
  }
  return v7 & 1;
}

uint64_t sub_24CA207B0()
{
  return MEMORY[0x263F8D320];
}

uint64_t sub_24CA207BC()
{
  return sub_24CA207F0(&qword_269806360);
}

uint64_t sub_24CA207F0(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for AppRecord();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24CA20834()
{
  return type metadata accessor for AppRecord();
}

uint64_t sub_24CA2083C()
{
  uint64_t result = sub_24CA40268();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for AppRecord(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AppRecord);
}

void type metadata accessor for LSDefaultAppCategory(uint64_t a1)
{
}

uint64_t sub_24CA2093C()
{
  return sub_24CA20A4C();
}

uint64_t sub_24CA20954()
{
  return sub_24CA209B0();
}

void sub_24CA2096C()
{
  *(unsigned char *)(*(void *)(v0 + 16) + 80) = *(unsigned char *)(v0 + 24);
}

uint64_t sub_24CA2097C()
{
  return sub_24CA20A0C();
}

void sub_24CA20994()
{
  sub_24CA1F968(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_24CA209B0()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[4];
  *(void *)(v1 + 32) = v0[3];
  *(void *)(v1 + 40) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

void sub_24CA209F0()
{
  sub_24CA1F338(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_24CA20A0C()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[4];
  *(void *)(v1 + 48) = v0[3];
  *(void *)(v1 + 56) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24CA20A4C()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[4];
  *(void *)(v1 + 16) = v0[3];
  *(void *)(v1 + 24) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
}

void sub_24CA20AA0(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

void sub_24CA20AE8()
{
}

uint64_t sub_24CA20B04()
{
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CA217AC(&qword_2698063B8, (void (*)(uint64_t))type metadata accessor for DefaultAppsSettingsGroup);
  sub_24CA40228();
  swift_release();
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC21DefaultAppsSettingsUI24DefaultAppsSettingsGroup__providers);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  swift_release();
  return v2;
}

uint64_t sub_24CA20C34()
{
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_24CA217AC(&qword_2698063B8, (void (*)(uint64_t))type metadata accessor for DefaultAppsSettingsGroup);
  sub_24CA40218();
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24CA20D94(uint64_t a1, uint64_t a2)
{
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v4 = (void *)(a1 + OBJC_IVAR____TtC21DefaultAppsSettingsUI24DefaultAppsSettingsGroup__providers);
  swift_beginAccess();
  *uint64_t v4 = a2;
  swift_bridgeObjectRetain();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24CA20E70()
{
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CA217AC(&qword_2698063B8, (void (*)(uint64_t))type metadata accessor for DefaultAppsSettingsGroup);
  sub_24CA40228();
  swift_release();
  uint64_t v1 = *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC21DefaultAppsSettingsUI24DefaultAppsSettingsGroup__isVisible);
  swift_release();
  return v1;
}

uint64_t sub_24CA20F80()
{
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_24CA217AC(&qword_2698063B8, (void (*)(uint64_t))type metadata accessor for DefaultAppsSettingsGroup);
  sub_24CA40218();
  swift_release();
  return swift_release();
}

uint64_t sub_24CA210E0(uint64_t a1, char a2)
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  *(unsigned char *)(a1 + OBJC_IVAR____TtC21DefaultAppsSettingsUI24DefaultAppsSettingsGroup__isVisible) = a2 & 1;
  return swift_release();
}

uint64_t sub_24CA2118C()
{
  uint64_t v1 = v0;
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  v8[0] = v0;
  sub_24CA217AC(&qword_2698063B8, (void (*)(uint64_t))type metadata accessor for DefaultAppsSettingsGroup);
  sub_24CA40228();
  swift_release();
  uint64_t v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC21DefaultAppsSettingsUI24DefaultAppsSettingsGroup__providers);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_bridgeObjectRetain();
  swift_release();
  uint64_t v4 = *(void *)(v3 + 16);
  if (v4)
  {
    uint64_t v5 = v3 + 32;
    while (1)
    {
      sub_24CA2181C(v5, (uint64_t)v8);
      __swift_project_boxed_opaque_existential_1(v8, v8[3]);
      if (sub_24CA402C8()) {
        break;
      }
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
      v5 += 40;
      if (!--v4)
      {
        swift_bridgeObjectRelease();
        goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
  }
  else
  {
    swift_bridgeObjectRelease();
  }
LABEL_12:
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  v8[0] = v1;
  sub_24CA40218();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_24CA2149C()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC21DefaultAppsSettingsUI24DefaultAppsSettingsGroup_id;
  uint64_t v2 = sub_24CA401E8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  uint64_t v3 = v0 + OBJC_IVAR____TtC21DefaultAppsSettingsUI24DefaultAppsSettingsGroup___observationRegistrar;
  uint64_t v4 = sub_24CA40268();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v6 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v5, v6);
}

uint64_t sub_24CA21590()
{
  return type metadata accessor for DefaultAppsSettingsGroup();
}

uint64_t type metadata accessor for DefaultAppsSettingsGroup()
{
  uint64_t result = qword_2698063A0;
  if (!qword_2698063A0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24CA215E4()
{
  uint64_t result = sub_24CA401E8();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_24CA40268();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_updateClassMetadata2();
      if (!result) {
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_24CA216C8()
{
  return sub_24CA217AC(&qword_2698063B0, MEMORY[0x263F07508]);
}

uint64_t sub_24CA21710@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1 + OBJC_IVAR____TtC21DefaultAppsSettingsUI24DefaultAppsSettingsGroup_id;
  uint64_t v4 = sub_24CA401E8();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t sub_24CA21790()
{
  return sub_24CA20D94(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_24CA217AC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24CA217FC()
{
  return sub_24CA210E0(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

uint64_t sub_24CA2181C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_24CA21914()
{
  return sub_24CA217FC();
}

uint64_t sub_24CA2192C@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_24CA2D15C(&qword_269806358, (void (*)(uint64_t))type metadata accessor for AppRecord);
  sub_24CA40228();
  swift_release();
  uint64_t v4 = *(void *)(v3 + 40);
  *a2 = *(void *)(v3 + 32);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_24CA219D8()
{
  return swift_bridgeObjectRelease();
}

id sub_24CA21ABC@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_24CA2D15C(&qword_269806358, (void (*)(uint64_t))type metadata accessor for AppRecord);
  sub_24CA40228();
  swift_release();
  uint64_t v4 = *(void **)(v3 + 64);
  *a2 = v4;

  return v4;
}

void sub_24CA21B74(void **a1)
{
  uint64_t v1 = *a1;
  swift_getKeyPath();
  sub_24CA2D15C(&qword_269806358, (void (*)(uint64_t))type metadata accessor for AppRecord);
  id v2 = v1;
  sub_24CA40218();
  swift_release();
}

uint64_t sub_24CA21C50@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_24CA2D15C(&qword_269806358, (void (*)(uint64_t))type metadata accessor for AppRecord);
  sub_24CA40228();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 80);
  return result;
}

uint64_t sub_24CA21CF8()
{
  return swift_release();
}

uint64_t sub_24CA21DC8()
{
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CA2D15C(&qword_2698064C8, (void (*)(uint64_t))type metadata accessor for DefaultLSAppsSettingsProvider);
  sub_24CA40228();
  swift_release();
  uint64_t v1 = *(unsigned __int8 *)(v0 + 32);
  swift_release();
  return v1;
}

uint64_t sub_24CA21ED0()
{
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_24CA2D15C(&qword_2698064C8, (void (*)(uint64_t))type metadata accessor for DefaultLSAppsSettingsProvider);
  sub_24CA40218();
  swift_release();
  return swift_release();
}

uint64_t sub_24CA22030(uint64_t a1, char a2)
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  *(unsigned char *)(a1 + 32) = a2 & 1;
  return swift_release();
}

uint64_t sub_24CA220D4()
{
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CA2D15C(&qword_2698064C8, (void (*)(uint64_t))type metadata accessor for DefaultLSAppsSettingsProvider);
  sub_24CA40228();
  swift_release();
  uint64_t v1 = *(void *)(v0 + 56);
  swift_bridgeObjectRetain();
  swift_release();
  return v1;
}

uint64_t sub_24CA221E8()
{
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_24CA2D15C(&qword_2698064C8, (void (*)(uint64_t))type metadata accessor for DefaultLSAppsSettingsProvider);
  sub_24CA40218();
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24CA22358(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  *(void *)(a1 + 56) = a2;
  *(void *)(a1 + 64) = a3;
  swift_bridgeObjectRetain();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24CA22418()
{
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CA2D15C(&qword_2698064C8, (void (*)(uint64_t))type metadata accessor for DefaultLSAppsSettingsProvider);
  sub_24CA40228();
  swift_release();
  uint64_t v1 = *(void *)(v0 + 96);
  swift_bridgeObjectRetain();
  swift_release();
  return v1;
}

uint64_t sub_24CA2252C()
{
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_24CA2D15C(&qword_2698064C8, (void (*)(uint64_t))type metadata accessor for DefaultLSAppsSettingsProvider);
  sub_24CA40218();
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24CA2269C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  *(void *)(a1 + 96) = a2;
  *(void *)(a1 + 104) = a3;
  swift_bridgeObjectRetain();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24CA2275C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24CA40208();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v3 = sub_24CA40648();
  MEMORY[0x270FA5388](v3 - 8);
  sub_24CA40768();
  v15[0] = sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  uint64_t v16 = v0;
  sub_24CA2D15C(&qword_2698064C8, (void (*)(uint64_t))type metadata accessor for DefaultLSAppsSettingsProvider);
  sub_24CA40228();
  swift_release();
  uint64_t v4 = *(void *)(v0 + 112);
  swift_retain();
  swift_release();
  swift_getKeyPath();
  uint64_t v16 = v4;
  sub_24CA2D15C(&qword_269806358, (void (*)(uint64_t))type metadata accessor for AppRecord);
  sub_24CA40228();
  swift_release();
  uint64_t v5 = *(void *)(v4 + 32);
  unint64_t v6 = *(void *)(v4 + 40);
  swift_release();
  uint64_t v7 = HIBYTE(v6) & 0xF;
  if ((v6 & 0x2000000000000000) == 0) {
    uint64_t v7 = v5 & 0xFFFFFFFFFFFFLL;
  }
  if (v7)
  {
    sub_24CA40758();
    sub_24CA40718();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_getKeyPath();
    uint64_t v16 = v1;
    sub_24CA40228();
    swift_release();
    uint64_t v8 = *(void *)(v1 + 112);
    swift_retain();
    swift_release();
    swift_getKeyPath();
    uint64_t v16 = v8;
    sub_24CA40228();
    swift_release();
    uint64_t v10 = *(void *)(v8 + 32);
    uint64_t v9 = *(void *)(v8 + 40);
    swift_bridgeObjectRetain();
    swift_release();
  }
  else
  {
    sub_24CA405E8();
    if (qword_269806338 != -1) {
      swift_once();
    }
    id v11 = (id)qword_269807580;
    sub_24CA401F8();
    uint64_t v10 = sub_24CA40678();
    uint64_t v9 = v12;
  }
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  v15[-4] = v1;
  v15[-3] = v10;
  v15[-2] = v9;
  uint64_t v16 = v1;
  sub_24CA40218();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  sub_24CA22D64();
  return swift_release();
}

uint64_t sub_24CA22C54()
{
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CA2D15C(&qword_2698064C8, (void (*)(uint64_t))type metadata accessor for DefaultLSAppsSettingsProvider);
  sub_24CA40228();
  swift_release();
  uint64_t v1 = *(void *)(v0 + 112);
  swift_retain();
  swift_release();
  return v1;
}

uint64_t sub_24CA22D64()
{
  uint64_t v1 = v0;
  sub_24CA40628();
  uint64_t v2 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  MEMORY[0x270FA5388](v4);
  uint64_t v5 = sub_24CA40208();
  MEMORY[0x270FA5388](v5 - 8);
  v37[0] = (char *)v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_24CA40648();
  MEMORY[0x270FA5388](v7 - 8);
  sub_24CA40768();
  v37[1] = sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  uint64_t v8 = v0 + OBJC_IVAR____TtC21DefaultAppsSettingsUI29DefaultLSAppsSettingsProvider___observationRegistrar;
  uint64_t v38 = v1;
  v37[2] = sub_24CA2D15C(&qword_2698064C8, (void (*)(uint64_t))type metadata accessor for DefaultLSAppsSettingsProvider);
  v37[3] = v8;
  sub_24CA40228();
  swift_release();
  LOBYTE(v8) = *(unsigned char *)(v1 + 128);
  swift_release();
  if (v8) {
    return swift_release();
  }
  switch(*(void *)(v1 + 88))
  {
    case 1:
      sub_24CA40758();
      sub_24CA40718();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      swift_getKeyPath();
      uint64_t v38 = v1;
      sub_24CA40228();
      swift_release();
      uint64_t v10 = *(void *)(v1 + 112);
      swift_retain();
      swift_release();
      swift_getKeyPath();
      uint64_t v38 = v10;
      sub_24CA2D15C(&qword_269806358, (void (*)(uint64_t))type metadata accessor for AppRecord);
      sub_24CA40228();
      swift_release();
      uint64_t v11 = *(void *)(v10 + 64);
      swift_release();
      if (!v11)
      {
        sub_24CA405E8();
        if (qword_269806338 == -1) {
          goto LABEL_50;
        }
        goto LABEL_62;
      }
      sub_24CA40618();
      sub_24CA40608();
      sub_24CA40758();
      sub_24CA40718();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      swift_getKeyPath();
      uint64_t v38 = v1;
      sub_24CA40228();
      swift_release();
      uint64_t v12 = *(void *)(v1 + 112);
      swift_retain();
      swift_release();
      swift_getKeyPath();
      uint64_t v38 = v12;
      sub_24CA40228();
      swift_release();
      swift_bridgeObjectRetain();
      swift_release();
      sub_24CA405F8();
      swift_bridgeObjectRelease();
      sub_24CA40608();
      sub_24CA40638();
      if (qword_269806338 != -1) {
LABEL_62:
      }
        swift_once();
LABEL_50:
      id v30 = (id)qword_269807580;
      sub_24CA401F8();
      uint64_t v25 = sub_24CA40678();
      uint64_t v27 = v31;
      sub_24CA40758();
      sub_24CA40718();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
LABEL_56:
      uint64_t KeyPath = swift_getKeyPath();
      MEMORY[0x270FA5388](KeyPath);
      v37[-4] = v1;
      v37[-3] = v25;
      uint64_t v35 = v27;
      uint64_t v38 = v1;
      sub_24CA40218();
      swift_release();
      swift_release();
      swift_release();
      return swift_bridgeObjectRelease();
    case 2:
      sub_24CA40758();
      sub_24CA40718();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      swift_getKeyPath();
      uint64_t v38 = v1;
      sub_24CA40228();
      swift_release();
      uint64_t v20 = *(void *)(v1 + 112);
      swift_retain();
      swift_release();
      swift_getKeyPath();
      uint64_t v38 = v20;
      sub_24CA2D15C(&qword_269806358, (void (*)(uint64_t))type metadata accessor for AppRecord);
      sub_24CA40228();
      swift_release();
      uint64_t v21 = *(void *)(v20 + 64);
      swift_release();
      if (v21)
      {
        sub_24CA40618();
        sub_24CA40608();
        sub_24CA40758();
        sub_24CA40718();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        swift_getKeyPath();
        uint64_t v38 = v1;
        sub_24CA40228();
        swift_release();
        uint64_t v22 = *(void *)(v1 + 112);
        swift_retain();
        swift_release();
        swift_getKeyPath();
        uint64_t v38 = v22;
        sub_24CA40228();
        swift_release();
        swift_bridgeObjectRetain();
        swift_release();
        sub_24CA405F8();
        swift_bridgeObjectRelease();
        sub_24CA40608();
        sub_24CA40638();
        if (qword_269806338 == -1)
        {
LABEL_54:
          id v32 = (id)qword_269807580;
          sub_24CA401F8();
          uint64_t v25 = sub_24CA40678();
          uint64_t v27 = v33;
          sub_24CA40758();
          sub_24CA40718();
          if ((swift_task_isCurrentExecutor() & 1) == 0) {
            swift_task_reportUnexpectedExecutor();
          }
          goto LABEL_56;
        }
      }
      else
      {
        sub_24CA405E8();
        if (qword_269806338 == -1) {
          goto LABEL_54;
        }
      }
      swift_once();
      goto LABEL_54;
    case 3:
      sub_24CA40758();
      sub_24CA40718();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      swift_getKeyPath();
      uint64_t v38 = v1;
      sub_24CA40228();
      swift_release();
      uint64_t v13 = *(void *)(v1 + 112);
      swift_retain();
      swift_release();
      swift_getKeyPath();
      uint64_t v38 = v13;
      sub_24CA2D15C(&qword_269806358, (void (*)(uint64_t))type metadata accessor for AppRecord);
      sub_24CA40228();
      swift_release();
      uint64_t v14 = *(void *)(v13 + 64);
      swift_release();
      if (v14)
      {
        sub_24CA40618();
        sub_24CA40608();
        sub_24CA40758();
        sub_24CA40718();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        swift_getKeyPath();
        uint64_t v38 = v1;
        sub_24CA40228();
        swift_release();
        uint64_t v15 = *(void *)(v1 + 112);
        swift_retain();
        swift_release();
        swift_getKeyPath();
        uint64_t v38 = v15;
        sub_24CA40228();
        swift_release();
        swift_bridgeObjectRetain();
        swift_release();
        sub_24CA405F8();
        swift_bridgeObjectRelease();
        sub_24CA40608();
        sub_24CA40638();
        if (qword_269806338 == -1)
        {
LABEL_46:
          id v28 = (id)qword_269807580;
          sub_24CA401F8();
          uint64_t v25 = sub_24CA40678();
          uint64_t v27 = v29;
          sub_24CA40758();
          sub_24CA40718();
          if ((swift_task_isCurrentExecutor() & 1) == 0) {
            swift_task_reportUnexpectedExecutor();
          }
          goto LABEL_56;
        }
      }
      else
      {
        sub_24CA405E8();
        if (qword_269806338 == -1) {
          goto LABEL_46;
        }
      }
      swift_once();
      goto LABEL_46;
    case 4:
      sub_24CA40758();
      sub_24CA40718();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      swift_getKeyPath();
      uint64_t v38 = v1;
      sub_24CA40228();
      swift_release();
      uint64_t v16 = *(void *)(v1 + 112);
      swift_retain();
      swift_release();
      swift_getKeyPath();
      uint64_t v38 = v16;
      sub_24CA2D15C(&qword_269806358, (void (*)(uint64_t))type metadata accessor for AppRecord);
      sub_24CA40228();
      swift_release();
      uint64_t v17 = *(void *)(v16 + 64);
      swift_release();
      if (v17) {
        goto LABEL_39;
      }
      sub_24CA40758();
      sub_24CA40718();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      sub_24CA40758();
      sub_24CA40718();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      swift_getKeyPath();
      uint64_t v38 = v1;
      sub_24CA40228();
      swift_release();
      uint64_t v18 = *(void *)(v1 + 112);
      swift_retain();
      swift_release();
      swift_getKeyPath();
      uint64_t v38 = v18;
      sub_24CA40228();
      swift_release();
      int v19 = *(unsigned __int8 *)(v18 + 80);
      swift_release();
      swift_release();
      if (v19 != 3)
      {
LABEL_39:
        sub_24CA40618();
        sub_24CA40608();
        sub_24CA40758();
        sub_24CA40718();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        swift_getKeyPath();
        uint64_t v38 = v1;
        sub_24CA40228();
        swift_release();
        uint64_t v23 = *(void *)(v1 + 112);
        swift_retain();
        swift_release();
        swift_getKeyPath();
        uint64_t v38 = v23;
        sub_24CA40228();
        swift_release();
        swift_bridgeObjectRetain();
        swift_release();
        sub_24CA405F8();
        swift_bridgeObjectRelease();
        sub_24CA40608();
        sub_24CA40638();
        if (qword_269806338 == -1)
        {
LABEL_42:
          id v24 = (id)qword_269807580;
          sub_24CA401F8();
          uint64_t v25 = sub_24CA40678();
          uint64_t v27 = v26;
          sub_24CA40758();
          sub_24CA40718();
          if ((swift_task_isCurrentExecutor() & 1) == 0) {
            swift_task_reportUnexpectedExecutor();
          }
          goto LABEL_56;
        }
      }
      else
      {
        sub_24CA405E8();
        if (qword_269806338 == -1) {
          goto LABEL_42;
        }
      }
      swift_once();
      goto LABEL_42;
    default:
      sub_24CA40758();
      sub_24CA40718();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      swift_release();
      int v36 = 0;
      uint64_t v35 = 189;
      sub_24CA408E8();
      __break(1u);
      JUMPOUT(0x24CA24278);
  }
}

uint64_t sub_24CA24288()
{
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_24CA2D15C(&qword_2698064C8, (void (*)(uint64_t))type metadata accessor for DefaultLSAppsSettingsProvider);
  sub_24CA40218();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_24CA243E8(uint64_t a1, uint64_t a2)
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_retain();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  *(void *)(a1 + 112) = a2;
  swift_retain();
  swift_release();
  sub_24CA2275C();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_24CA2451C()
{
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CA2D15C(&qword_2698064C8, (void (*)(uint64_t))type metadata accessor for DefaultLSAppsSettingsProvider);
  sub_24CA40228();
  swift_release();
  uint64_t v1 = *(void *)(v0 + 120);
  swift_bridgeObjectRetain();
  swift_release();
  return v1;
}

uint64_t sub_24CA2462C()
{
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_24CA2D15C(&qword_2698064C8, (void (*)(uint64_t))type metadata accessor for DefaultLSAppsSettingsProvider);
  sub_24CA40218();
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24CA2478C(uint64_t a1, uint64_t a2)
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  *(void *)(a1 + 120) = a2;
  swift_bridgeObjectRetain();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24CA24840()
{
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CA2D15C(&qword_2698064C8, (void (*)(uint64_t))type metadata accessor for DefaultLSAppsSettingsProvider);
  sub_24CA40228();
  swift_release();
  uint64_t v1 = *(unsigned __int8 *)(v0 + 128);
  swift_release();
  return v1;
}

uint64_t sub_24CA24948()
{
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_24CA2D15C(&qword_2698064C8, (void (*)(uint64_t))type metadata accessor for DefaultLSAppsSettingsProvider);
  sub_24CA40218();
  swift_release();
  return swift_release();
}

uint64_t sub_24CA24AA8(uint64_t a1, char a2)
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  *(unsigned char *)(a1 + 128) = a2 & 1;
  return swift_release();
}

uint64_t sub_24CA24B4C()
{
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CA2D15C(&qword_2698064C8, (void (*)(uint64_t))type metadata accessor for DefaultLSAppsSettingsProvider);
  sub_24CA40228();
  swift_release();
  uint64_t v1 = *(void *)(v0 + 136);
  swift_unknownObjectRetain();
  swift_release();
  return v1;
}

uint64_t sub_24CA24C5C()
{
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_24CA2D15C(&qword_2698064C8, (void (*)(uint64_t))type metadata accessor for DefaultLSAppsSettingsProvider);
  sub_24CA40218();
  swift_release();
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t sub_24CA24DBC(uint64_t a1, uint64_t a2)
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  *(void *)(a1 + 136) = a2;
  swift_unknownObjectRetain();
  swift_release();
  return swift_unknownObjectRelease();
}

unsigned __int8 *sub_24CA24E70(uint64_t a1)
{
  uint64_t v2 = (unsigned __int8 *)v1;
  uint64_t v4 = sub_24CA40208();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v5 = sub_24CA40648();
  MEMORY[0x270FA5388](v5 - 8);
  *(unsigned char *)(v1 + 32) = 0;
  type metadata accessor for AppRecord();
  *(void *)(v1 + 56) = 0;
  *(void *)(v1 + 64) = 0;
  *(void *)(v1 + 96) = 0;
  *(void *)(v1 + 104) = 0;
  swift_allocObject();
  uint64_t v6 = sub_24CA1F388(0);
  uint64_t v7 = MEMORY[0x263F8EE78];
  *(void *)(v1 + 112) = v6;
  *(void *)(v1 + 120) = v7;
  *(unsigned char *)(v1 + 128) = 0;
  *(void *)(v1 + 136) = 0;
  sub_24CA40258();
  *(void *)(v1 + 88) = a1;
  switch(a1)
  {
    case 1:
      *(void *)(v1 + 16) = 0xD000000000000021;
      *(void *)(v1 + 24) = 0x800000024CA42A40;
      sub_24CA405E8();
      if (qword_269806338 != -1) {
        swift_once();
      }
      id v8 = (id)qword_269807580;
      sub_24CA401F8();
      *(void *)(v1 + 40) = sub_24CA40678();
      *(void *)(v1 + 48) = v9;
      sub_24CA405E8();
      id v10 = v8;
      sub_24CA401F8();
      *(void *)(v1 + 72) = sub_24CA40678();
      *(void *)(v1 + 80) = v11;
      id v12 = objc_msgSend(self, sel_sharedConnection);
      if (!v12)
      {
        __break(1u);
LABEL_27:
        sub_24CA40768();
        sub_24CA40758();
        sub_24CA40718();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        swift_release();
        LODWORD(v44) = 0;
        uint64_t v43 = 80;
        sub_24CA408E8();
        __break(1u);
        JUMPOUT(0x24CA25A94);
      }
      uint64_t v13 = v12;
      unsigned __int8 v14 = objc_msgSend(v12, sel_isDefaultBrowserModificationAllowed);

      sub_24CA40768();
      sub_24CA40758();
      sub_24CA40718();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t KeyPath = swift_getKeyPath();
      MEMORY[0x270FA5388](KeyPath);
      uint64_t v43 = (uint64_t)v2;
      LOBYTE(v44) = v14 ^ 1;
      uint64_t v16 = &v2[OBJC_IVAR____TtC21DefaultAppsSettingsUI29DefaultLSAppsSettingsProvider___observationRegistrar];
      v46 = v2;
      sub_24CA2D15C(&qword_2698064C8, (void (*)(uint64_t))type metadata accessor for DefaultLSAppsSettingsProvider);
      v45[1] = v16;
      sub_24CA40218();
      swift_release();
      swift_release();
      sub_24CA40758();
      sub_24CA40718();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      swift_getKeyPath();
      v46 = v2;
      sub_24CA40228();
      swift_release();
      int v17 = v2[128];
      swift_release();
      if (v17 == 1)
      {
        sub_24CA405E8();
        id v18 = (id)qword_269807580;
        sub_24CA401F8();
        uint64_t v19 = sub_24CA40678();
        uint64_t v21 = v20;
        sub_24CA40758();
        sub_24CA40718();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        uint64_t v22 = swift_getKeyPath();
        MEMORY[0x270FA5388](v22);
        v45[-4] = v2;
        v45[-3] = v19;
        uint64_t v43 = v21;
        v46 = v2;
        sub_24CA40218();
        swift_release();
        swift_release();
        swift_bridgeObjectRelease();
      }
LABEL_24:
      sub_24CA269E8();
      sub_24CA25BA0();
      sub_24CA2629C();
      sub_24CA22D64();
      uint64_t v41 = swift_allocObject();
      swift_weakInit();
      swift_retain();
      swift_retain();
      sub_24CA3ADAC((uint64_t)v2, (uint64_t)sub_24CA2DDB0, v41);
      swift_release();
      swift_release_n();
      return v2;
    case 2:
      *(void *)(v1 + 16) = 0xD00000000000001FLL;
      *(void *)(v1 + 24) = 0x800000024CA42A00;
      sub_24CA405E8();
      if (qword_269806338 == -1) {
        goto LABEL_23;
      }
      goto LABEL_25;
    case 3:
      *(void *)(v1 + 16) = 0xD000000000000023;
      *(void *)(v1 + 24) = 0x800000024CA429B0;
      sub_24CA405E8();
      if (qword_269806338 == -1) {
        goto LABEL_23;
      }
LABEL_25:
      swift_once();
LABEL_23:
      id v37 = (id)qword_269807580;
      sub_24CA401F8();
      *(void *)(v1 + 40) = sub_24CA40678();
      *(void *)(v1 + 48) = v38;
      sub_24CA405E8();
      id v39 = v37;
      sub_24CA401F8();
      *(void *)(v1 + 72) = sub_24CA40678();
      *(void *)(v1 + 80) = v40;
      goto LABEL_24;
    case 4:
      *(void *)(v1 + 16) = 0xD000000000000024;
      *(void *)(v1 + 24) = 0x800000024CA42940;
      sub_24CA405E8();
      if (qword_269806338 != -1) {
        swift_once();
      }
      id v23 = (id)qword_269807580;
      sub_24CA401F8();
      *(void *)(v1 + 40) = sub_24CA40678();
      *(void *)(v1 + 48) = v24;
      sub_24CA405E8();
      id v25 = v23;
      sub_24CA401F8();
      *(void *)(v1 + 72) = sub_24CA40678();
      *(void *)(v1 + 80) = v26;
      uint64_t v27 = swift_allocObject();
      swift_weakInit();
      id v28 = (objc_class *)type metadata accessor for DefaultLSAppsSettingsProvider.CallCapabilitiesMonitor();
      uint64_t v29 = (char *)objc_allocWithZone(v28);
      id v30 = (uint64_t (**)())&v29[OBJC_IVAR____TtCC21DefaultAppsSettingsUI29DefaultLSAppsSettingsProviderP33_6339B278615E8A6CFC693041365478EF23CallCapabilitiesMonitor_notify];
      *id v30 = sub_24CA2DD34;
      v30[1] = (uint64_t (*)())v27;
      v47.receiver = v29;
      v47.super_class = v28;
      swift_retain_n();
      id v31 = objc_msgSendSuper2(&v47, sel_init);
      id v32 = self;
      sub_24CA2DDC8(0, &qword_269806610);
      id v33 = v31;
      v34 = (void *)sub_24CA407C8();
      objc_msgSend(v32, sel_addDelegate_queue_, v33, v34);

      swift_release_n();
      sub_24CA40768();
      sub_24CA40758();
      sub_24CA40718();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t v35 = swift_getKeyPath();
      MEMORY[0x270FA5388](v35);
      uint64_t v43 = (uint64_t)v2;
      id v44 = v31;
      v46 = v2;
      sub_24CA2D15C(&qword_2698064C8, (void (*)(uint64_t))type metadata accessor for DefaultLSAppsSettingsProvider);
      sub_24CA40218();
      swift_release();
      swift_release();

      int v36 = CFNotificationCenterGetDarwinNotifyCenter();
      if (qword_269806320 != -1) {
        swift_once();
      }
      CFNotificationCenterAddObserver(v36, v2, (CFNotificationCallback)sub_24CA269E0, (CFStringRef)qword_2698063C0, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

      goto LABEL_24;
    default:
      goto LABEL_27;
  }
}

uint64_t sub_24CA25AA4()
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    sub_24CA25BA0();
    swift_release();
  }
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    sub_24CA2629C();
    swift_release();
  }
  return swift_release();
}

unint64_t sub_24CA25BA0()
{
  uint64_t v31 = sub_24CA401E8();
  uint64_t v1 = *(void *)(v31 - 8);
  MEMORY[0x270FA5388](v31);
  uint64_t v3 = (char *)v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_24CA40198();
  uint64_t v27 = *(void *)(v4 - 8);
  uint64_t v28 = v4;
  MEMORY[0x270FA5388](v4);
  id v32 = (char *)v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24CA40768();
  v24[1] = sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v37[0] = MEMORY[0x263F8EE78];
  uint64_t v7 = self;
  uint64_t v8 = *(void *)(v0 + 88);
  uint64_t v25 = v0;
  uint64_t v26 = v8;
  id v9 = objc_msgSend(v7, sel_enumeratorForViableDefaultAppsForCategory_options_);
  sub_24CA40798();

  sub_24CA40188();
  uint64_t v29 = v6;
  if (v36)
  {
    uint64_t v30 = MEMORY[0x263F8EE58] + 8;
    do
    {
      sub_24CA2DDB8(&v35, &v34);
      sub_24CA2DDC8(0, &qword_269806618);
      if (swift_dynamicCast()) {
        id v10 = v33;
      }
      else {
        id v10 = 0;
      }
      type metadata accessor for AppRecord();
      uint64_t v11 = swift_allocObject();
      *(void *)(v11 + 16) = 0;
      *(void *)(v11 + 24) = 0;
      *(void *)(v11 + 32) = 0;
      *(void *)(v11 + 40) = 0xE000000000000000;
      sub_24CA401D8();
      uint64_t v12 = sub_24CA401B8();
      uint64_t v14 = v13;
      (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v31);
      *(void *)(v11 + 48) = v12;
      *(void *)(v11 + 56) = v14;
      *(void *)(v11 + 64) = 0;
      *(void *)(v11 + 72) = 0;
      *(unsigned char *)(v11 + 80) = 3;
      sub_24CA40258();
      uint64_t KeyPath = swift_getKeyPath();
      MEMORY[0x270FA5388](KeyPath);
      v24[-2] = v11;
      v24[-1] = v10;
      id v33 = (void *)v11;
      sub_24CA2D15C(&qword_269806358, (void (*)(uint64_t))type metadata accessor for AppRecord);
      sub_24CA40218();
      swift_release();

      MEMORY[0x253305190]();
      if (*(void *)((v37[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v37[0] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_24CA406E8();
      }
      sub_24CA40708();
      sub_24CA406D8();
      sub_24CA40188();
    }
    while (v36);
  }
  (*(void (**)(char *, uint64_t))(v27 + 8))(v32, v28);
  sub_24CA270B8(v37);
  if (v26 != 4) {
    goto LABEL_25;
  }
  id v16 = objc_msgSend(self, sel_currentDevice);
  id v17 = objc_msgSend(v16, sel_userInterfaceIdiom);

  if (v17 != (id)1) {
    goto LABEL_25;
  }
  id v18 = self;
  if (objc_msgSend(v18, sel_isThumperCallingEnabled)) {
    goto LABEL_17;
  }
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  unsigned int v19 = objc_msgSend(v18, sel_isRelayCallingEnabled);
  swift_release();
  if (v19)
  {
LABEL_17:
    type metadata accessor for AppRecord();
    swift_allocObject();
    unint64_t result = sub_24CA1FBE4(2u);
    if (!result)
    {
LABEL_29:
      __break(1u);
      return result;
    }
    MEMORY[0x253305190]();
    if (*(void *)((v37[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v37[0] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_24CA406E8();
    }
    sub_24CA40708();
    sub_24CA406D8();
    sub_24CA270B8(v37);
  }
  type metadata accessor for AppRecord();
  swift_allocObject();
  unint64_t result = sub_24CA1FBE4(1u);
  if (!result)
  {
    __break(1u);
    goto LABEL_29;
  }
  MEMORY[0x253305190]();
  if (*(void *)((v37[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v37[0] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_24CA406E8();
  }
  sub_24CA40708();
  sub_24CA406D8();
LABEL_25:
  unint64_t v21 = v37[0];
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v22 = swift_getKeyPath();
  MEMORY[0x270FA5388](v22);
  uint64_t v23 = v25;
  v24[-2] = v25;
  v24[-1] = v21;
  *(void *)&long long v35 = v23;
  sub_24CA2D15C(&qword_2698064C8, (void (*)(uint64_t))type metadata accessor for DefaultLSAppsSettingsProvider);
  sub_24CA40218();
  swift_release();
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

void sub_24CA2629C()
{
  uint64_t v1 = v0;
  v33[1] = *MEMORY[0x263EF8340];
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v2 = objc_msgSend(self, sel_defaultWorkspace);
  if (!v2) {
    __break(1u);
  }
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(v0 + 88);
  v33[0] = 0;
  uint64_t v31 = v4;
  id v5 = objc_msgSend(v2, sel_defaultApplicationForCategory_error_);

  id v6 = 0;
  uint64_t v28 = v0;
  if (v5)
  {
    uint64_t v7 = v5;
  }
  else
  {
    uint64_t v8 = v6;
    id v9 = (void *)sub_24CA40178();

    swift_willThrow();
    if (qword_269806330 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_24CA40308();
    __swift_project_value_buffer(v10, (uint64_t)qword_269807568);
    swift_retain();
    id v11 = v9;
    swift_retain();
    id v12 = v9;
    uint64_t v13 = sub_24CA402E8();
    os_log_type_t v14 = sub_24CA407A8();
    if (os_log_type_enabled(v13, v14))
    {
      os_log_type_t v27 = v14;
      uint64_t v15 = swift_slowAlloc();
      uint64_t v26 = (void *)swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      v33[0] = v29;
      *(_DWORD *)uint64_t v15 = 136446466;
      sub_24CA40758();
      sub_24CA40718();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      type metadata accessor for LSDefaultAppCategory(0);
      uint64_t v16 = sub_24CA40688();
      unint64_t v18 = v17;
      swift_release();
      sub_24CA2B1F0(v16, v18, v33);
      sub_24CA407D8();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v15 + 12) = 2112;
      sub_24CA40758();
      sub_24CA40718();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      id v19 = v9;
      swift_release();
      uint64_t v32 = _swift_stdlib_bridgeErrorToNSError();
      sub_24CA407D8();
      *uint64_t v26 = v32;

      _os_log_impl(&dword_24CA1C000, v13, v27, "Could not fetch default app for category %{public}s. Error: %@", (uint8_t *)v15, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269806608);
      swift_arrayDestroy();
      MEMORY[0x253305A30](v26, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x253305A30](v29, -1, -1);
      MEMORY[0x253305A30](v15, -1, -1);

      uint64_t v7 = 0;
      uint64_t v1 = v0;
    }
    else
    {

      swift_release_n();
      uint64_t v7 = 0;
    }
  }
  type metadata accessor for AppRecord();
  swift_allocObject();
  id v30 = v5;
  sub_24CA1F388(v7);
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  v33[0] = v1;
  sub_24CA2D15C(&qword_2698064C8, (void (*)(uint64_t))type metadata accessor for DefaultLSAppsSettingsProvider);
  sub_24CA40218();
  swift_release();
  swift_release();
  swift_release();
  if (v31 == 4
    && (id v21 = objc_msgSend(self, sel_currentDevice),
        id v22 = objc_msgSend(v21, sel_userInterfaceIdiom),
        v21,
        v22 == (id)1)
    && (unint64_t v23 = defaultAppRelayTelephonySetting(), v23 < 3)
    && (unsigned __int8 v24 = v23, swift_allocObject(), sub_24CA1FBE4(v24)))
  {
    sub_24CA40758();
    sub_24CA40718();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v25 = swift_getKeyPath();
    MEMORY[0x270FA5388](v25);
    v33[0] = v28;
    sub_24CA40218();
    swift_release();

    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
  }
}

uint64_t sub_24CA269E0(uint64_t a1, uint64_t a2)
{
  return sub_24CA2DE04(a2);
}

id sub_24CA269E8()
{
  uint64_t v1 = v0;
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id result = objc_msgSend(self, sel_defaultWorkspace);
  if (result)
  {
    uint64_t v3 = result;
    objc_msgSend(result, sel_canChangeDefaultAppForCategory_, *(void *)(v1 + 88));

    sub_24CA40758();
    sub_24CA40718();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t KeyPath = swift_getKeyPath();
    MEMORY[0x270FA5388](KeyPath);
    sub_24CA2D15C(&qword_2698064C8, (void (*)(uint64_t))type metadata accessor for DefaultLSAppsSettingsProvider);
    sub_24CA40218();
    swift_release();
    swift_release();
    return (id)swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_24CA26BE8()
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    sub_24CA269E8();
    swift_release();
  }
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    sub_24CA25BA0();
    swift_release();
  }
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    sub_24CA2629C();
    swift_release();
  }
  return swift_release();
}

char *sub_24CA26D14()
{
  sub_24CA3AC58((uint64_t)v0);
  uint64_t v1 = CFNotificationCenterGetDarwinNotifyCenter();
  if (qword_269806328 != -1) {
    swift_once();
  }
  CFNotificationCenterRemoveObserver(v1, v0, (CFNotificationName)qword_2698063C8, 0);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  id v2 = &v0[OBJC_IVAR____TtC21DefaultAppsSettingsUI29DefaultLSAppsSettingsProvider___observationRegistrar];
  uint64_t v3 = sub_24CA40268();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  return v0;
}

uint64_t sub_24CA26E1C()
{
  sub_24CA26D14();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_24CA26E74()
{
  return type metadata accessor for DefaultLSAppsSettingsProvider();
}

uint64_t type metadata accessor for DefaultLSAppsSettingsProvider()
{
  uint64_t result = qword_2698063E0;
  if (!qword_2698063E0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24CA26EC8()
{
  uint64_t result = sub_24CA40268();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_24CA26FB4(unsigned __int8 a1, unsigned __int8 a2)
{
  unint64_t v2 = 0x800000024CA41FB0;
  int v3 = a1;
  if (a1)
  {
    if (a1 == 1) {
      unint64_t v4 = 0xD000000000000010;
    }
    else {
      unint64_t v4 = 0xD000000000000016;
    }
    if (v3 == 1) {
      unint64_t v5 = 0x800000024CA41FD0;
    }
    else {
      unint64_t v5 = 0x800000024CA41FF0;
    }
    int v6 = a2;
    if (a2)
    {
LABEL_9:
      if (v6 == 1) {
        unint64_t v7 = 0xD000000000000010;
      }
      else {
        unint64_t v7 = 0xD000000000000016;
      }
      if (v6 == 1) {
        unint64_t v2 = 0x800000024CA41FD0;
      }
      else {
        unint64_t v2 = 0x800000024CA41FF0;
      }
      if (v4 != v7) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v4 = 0xD000000000000019;
    unint64_t v5 = 0x800000024CA41FB0;
    int v6 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }
  if (v4 != 0xD000000000000019)
  {
LABEL_21:
    char v8 = sub_24CA40978();
    goto LABEL_22;
  }
LABEL_19:
  if (v5 != v2) {
    goto LABEL_21;
  }
  char v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_24CA270B8(unint64_t *a1)
{
  unint64_t v2 = *a1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *a1 = v2;
  if (!isUniquelyReferenced_nonNull_bridgeObject
    || (v2 & 0x8000000000000000) != 0
    || (v2 & 0x4000000000000000) != 0)
  {
    sub_24CA2D330(v2);
    unint64_t v2 = v4;
    *a1 = v4;
  }
  uint64_t v5 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v7[0] = (v2 & 0xFFFFFFFFFFFFFF8) + 32;
  v7[1] = v5;
  sub_24CA2B848(v7);
  return sub_24CA406D8();
}

uint64_t sub_24CA27148(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698065A0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_retain();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  v21[-2] = v1;
  v21[-1] = a1;
  uint64_t v22 = v1;
  sub_24CA2D15C(&qword_2698064C8, (void (*)(uint64_t))type metadata accessor for DefaultLSAppsSettingsProvider);
  sub_24CA40218();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v7 = *(void *)(v1 + 88);
  if (v7 != 4) {
    goto LABEL_23;
  }
  id v8 = objc_msgSend(self, sel_currentDevice);
  id v9 = objc_msgSend(v8, sel_userInterfaceIdiom);

  if (v9 != (id)1) {
    goto LABEL_23;
  }
  swift_getKeyPath();
  uint64_t v10 = a1 + OBJC_IVAR____TtC21DefaultAppsSettingsUI9AppRecord___observationRegistrar;
  uint64_t v22 = a1;
  uint64_t v11 = sub_24CA2D15C(&qword_269806358, (void (*)(uint64_t))type metadata accessor for AppRecord);
  sub_24CA40228();
  swift_release();
  unsigned int v12 = *(unsigned __int8 *)(a1 + 80);
  v21[2] = v11;
  v21[3] = v10;
  if (v12 == 3)
  {
    sub_24CA40758();
    sub_24CA40718();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_release();
  }
  else
  {
    if (v12 > 1)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v13 = sub_24CA40978();
      swift_bridgeObjectRelease();
      if ((v13 & 1) == 0) {
        goto LABEL_21;
      }
    }
    sub_24CA40758();
    sub_24CA40718();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    os_log_type_t v14 = self;
    unsigned __int8 v15 = objc_msgSend(v14, sel_isThumperCallingEnabled);
    swift_release();
    if ((v15 & 1) == 0)
    {
      v21[1] = sub_24CA40758();
      sub_24CA40718();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      objc_msgSend(v14, sel_isRelayCallingEnabled);
      swift_release();
    }
  }
LABEL_21:
  setDefaultAppRelayTelephonySetting();
  swift_getKeyPath();
  uint64_t v22 = a1;
  sub_24CA40228();
  swift_release();
  if (v12 == 3 || *(void *)(a1 + 64))
  {
LABEL_23:
    uint64_t v16 = sub_24CA40788();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v5, 1, 1, v16);
    uint64_t v17 = swift_allocObject();
    swift_weakInit();
    swift_retain();
    swift_retain();
    uint64_t v18 = sub_24CA40758();
    id v19 = (void *)swift_allocObject();
    v19[2] = v18;
    v19[3] = MEMORY[0x263F8F500];
    v19[4] = v7;
    v19[5] = a1;
    v19[6] = v17;
    swift_release();
    sub_24CA282D4((uint64_t)v5, (uint64_t)&unk_2698065B0, (uint64_t)v19);
    swift_release();
  }
  return swift_release();
}

uint64_t sub_24CA27738(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[27] = a5;
  v6[28] = a6;
  v6[26] = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698065A0);
  v6[29] = swift_task_alloc();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698065C8);
  v6[30] = v7;
  v6[31] = *(void *)(v7 - 8);
  v6[32] = swift_task_alloc();
  v6[33] = sub_24CA40768();
  v6[34] = sub_24CA40758();
  uint64_t v9 = sub_24CA40718();
  v6[35] = v9;
  v6[36] = v8;
  return MEMORY[0x270FA2498](sub_24CA27868, v9, v8);
}

uint64_t sub_24CA27868()
{
  id v1 = objc_msgSend(self, sel_defaultWorkspace);
  v0[37] = v1;
  if (v1)
  {
    unint64_t v2 = v1;
    uint64_t v3 = v0[31];
    uint64_t v10 = v0[32];
    uint64_t v4 = v0[30];
    uint64_t v5 = v0[27];
    uint64_t v11 = v0[26];
    swift_getKeyPath();
    v0[21] = v5;
    sub_24CA2D15C(&qword_269806358, (void (*)(uint64_t))type metadata accessor for AppRecord);
    sub_24CA40228();
    swift_release();
    int v6 = *(void **)(v5 + 64);
    v0[38] = v6;
    v0[2] = v0;
    v0[7] = v0 + 40;
    v0[3] = sub_24CA27AB4;
    swift_continuation_init();
    v0[17] = v4;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v0 + 14);
    id v8 = v6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698065D0);
    sub_24CA40728();
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v3 + 32))(boxed_opaque_existential_0, v10, v4);
    v0[10] = MEMORY[0x263EF8330];
    v0[11] = 1107296256;
    v0[12] = sub_24CA280FC;
    v0[13] = &block_descriptor;
    objc_msgSend(v2, sel_setDefaultApplicationForCategory_toApplicationRecord_completionHandler_, v11, v8);
    id v1 = v0 + 2;
  }
  else
  {
    __break(1u);
  }
  return MEMORY[0x270FA23F0](v1);
}

uint64_t sub_24CA27AB4()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 312) = v2;
  uint64_t v3 = *(void *)(v1 + 288);
  uint64_t v4 = *(void *)(v1 + 280);
  if (v2) {
    uint64_t v5 = sub_24CA27C64;
  }
  else {
    uint64_t v5 = sub_24CA27BE4;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_24CA27BE4()
{
  uint64_t v1 = (void *)v0[37];
  uint64_t v2 = (void *)v0[38];
  swift_release();

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_24CA27C64()
{
  id v30 = v0;
  uint64_t v1 = (void *)v0[38];
  uint64_t v2 = (void *)v0[37];
  swift_release();
  swift_willThrow();

  if (qword_269806330 != -1) {
    swift_once();
  }
  uint64_t v3 = (void *)v0[39];
  uint64_t v4 = sub_24CA40308();
  __swift_project_value_buffer(v4, (uint64_t)qword_269807568);
  id v5 = v3;
  id v6 = v3;
  uint64_t v7 = sub_24CA402E8();
  os_log_type_t v8 = sub_24CA407A8();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v28 = swift_slowAlloc();
    v29[0] = v28;
    *(_DWORD *)uint64_t v9 = 136446466;
    sub_24CA40758();
    sub_24CA40718();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    v0[25] = v0[26];
    type metadata accessor for LSDefaultAppCategory(0);
    uint64_t v10 = sub_24CA40688();
    unint64_t v12 = v11;
    swift_release();
    v0[23] = sub_24CA2B1F0(v10, v12, v29);
    sub_24CA407D8();
    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2080;
    sub_24CA40758();
    sub_24CA40718();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    char v13 = (void *)v0[39];
    swift_getErrorValue();
    uint64_t v14 = *(void *)(v0[19] - 8);
    swift_task_alloc();
    (*(void (**)(void))(v14 + 16))();
    uint64_t v15 = sub_24CA40688();
    unint64_t v17 = v16;
    swift_release();
    swift_task_dealloc();
    v0[22] = sub_24CA2B1F0(v15, v17, v29);
    sub_24CA407D8();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_24CA1C000, v7, v8, "Could not change default app for category %{public}s. Error: %s", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x253305A30](v28, -1, -1);
    MEMORY[0x253305A30](v9, -1, -1);
  }
  else
  {
    uint64_t v18 = (void *)v0[39];
  }
  id v19 = (void *)v0[39];
  uint64_t v21 = v0[28];
  uint64_t v20 = v0[29];
  uint64_t v22 = sub_24CA40788();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v20, 1, 1, v22);
  swift_retain();
  uint64_t v23 = sub_24CA40758();
  unsigned __int8 v24 = (void *)swift_allocObject();
  uint64_t v25 = MEMORY[0x263F8F500];
  void v24[2] = v23;
  v24[3] = v25;
  v24[4] = v21;
  sub_24CA28480(v20, (uint64_t)&unk_2698065E0, (uint64_t)v24);
  swift_release();

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v26 = (uint64_t (*)(void))v0[1];
  return v26();
}

void sub_24CA280FC(uint64_t a1, uint64_t a2, void *a3)
{
  __swift_project_boxed_opaque_existential_1((void *)(a1 + 32), *(void *)(a1 + 56));
  if (a3)
  {
    id v4 = a3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698065C8);
    sub_24CA40738();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698065C8);
    sub_24CA40748();
  }
}

uint64_t sub_24CA28194(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[5] = a1;
  v4[6] = a4;
  sub_24CA40768();
  v4[7] = sub_24CA40758();
  uint64_t v6 = sub_24CA40718();
  return MEMORY[0x270FA2498](sub_24CA2822C, v6, v5);
}

uint64_t sub_24CA2822C()
{
  swift_release();
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    sub_24CA2629C();
    swift_release();
  }
  **(unsigned char **)(v0 + 40) = Strong == 0;
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_24CA282D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24CA40788();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_24CA40778();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_24CA2D800(a1, &qword_2698065A0);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24CA40718();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_24CA28480(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24CA40788();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_24CA40778();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_24CA2D800(a1, &qword_2698065A0);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24CA40718();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269806600);
  return swift_task_create();
}

uint64_t sub_24CA28634@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v28 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269806480);
  uint64_t v26 = *(void *)(v3 - 8);
  uint64_t v27 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_269806468);
  uint64_t v6 = MEMORY[0x270FA5388](v24);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v25 = (uint64_t)&v23 - v9;
  sub_24CA40768();
  uint64_t v23 = sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CA2A554(a1, v33);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698064C0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698064A8);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269806488);
  uint64_t v11 = sub_24CA40398();
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269806490);
  uint64_t v13 = sub_24CA2DF30(&qword_269806498, &qword_269806490);
  uint64_t v29 = v12;
  uint64_t v30 = v13;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v29 = v10;
  uint64_t v30 = v11;
  uint64_t v31 = OpaqueTypeConformance2;
  uint64_t v32 = MEMORY[0x263F19670];
  swift_getOpaqueTypeConformance2();
  sub_24CA2AEB4();
  sub_24CA405C8();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  v33[0] = a1;
  sub_24CA2D15C(&qword_2698064C8, (void (*)(uint64_t))type metadata accessor for DefaultLSAppsSettingsProvider);
  sub_24CA40228();
  swift_release();
  char v15 = *(unsigned char *)(a1 + 128);
  swift_release();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v17 = swift_allocObject();
  *(unsigned char *)(v17 + 16) = v15;
  uint64_t v19 = v26;
  uint64_t v18 = v27;
  (*(void (**)(char *, char *, uint64_t))(v26 + 16))(v8, v5, v27);
  uint64_t v20 = (uint64_t *)&v8[*(int *)(v24 + 36)];
  *uint64_t v20 = KeyPath;
  v20[1] = (uint64_t)sub_24CA2CD28;
  v20[2] = v17;
  (*(void (**)(char *, uint64_t))(v19 + 8))(v5, v18);
  uint64_t v21 = v25;
  sub_24CA2D1AC((uint64_t)v8, v25, &qword_269806468);
  sub_24CA2D1AC(v21, v28, &qword_269806468);
  return swift_release();
}

uint64_t sub_24CA28A64@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v37 = a2;
  uint64_t v3 = sub_24CA40398();
  uint64_t v35 = *(void *)(v3 - 8);
  uint64_t v36 = v3;
  MEMORY[0x270FA5388](v3);
  long long v34 = (char *)v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269806490);
  uint64_t v29 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269806488);
  uint64_t v32 = *(void *)(v8 - 8);
  uint64_t v33 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698064C0);
  uint64_t v30 = *(void *)(v11 - 8);
  uint64_t v31 = v11;
  MEMORY[0x270FA5388](v11);
  uint64_t v28 = (char *)v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CA40768();
  uint64_t v13 = sub_24CA40758();
  uint64_t v14 = MEMORY[0x263F8F500];
  v27[2] = v13;
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v15 = sub_24CA403B8();
  v27[0] = v16;
  v27[1] = v15;
  swift_retain();
  uint64_t v17 = sub_24CA40758();
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = v17;
  v18[3] = v14;
  v18[4] = a1;
  swift_retain();
  uint64_t v19 = sub_24CA40758();
  uint64_t v20 = (void *)swift_allocObject();
  v20[2] = v19;
  v20[3] = v14;
  v20[4] = a1;
  type metadata accessor for AppRecord();
  sub_24CA40558();
  uint64_t v38 = v40;
  long long v39 = v41;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698064D8);
  sub_24CA2D15C(&qword_2698064E0, (void (*)(uint64_t))type metadata accessor for AppRecord);
  sub_24CA2CE40();
  sub_24CA40528();
  uint64_t v21 = sub_24CA2DF30(&qword_269806498, &qword_269806490);
  sub_24CA40448();
  (*(void (**)(char *, uint64_t))(v29 + 8))(v7, v5);
  uint64_t v22 = v34;
  sub_24CA40388();
  uint64_t v40 = v5;
  *(void *)&long long v41 = v21;
  swift_getOpaqueTypeConformance2();
  uint64_t v23 = v28;
  uint64_t v24 = v33;
  uint64_t v25 = v36;
  sub_24CA40438();
  (*(void (**)(char *, uint64_t))(v35 + 8))(v22, v25);
  (*(void (**)(char *, uint64_t))(v32 + 8))(v10, v24);
  (*(void (**)(uint64_t, char *, uint64_t))(v30 + 32))(v37, v23, v31);
  return swift_release();
}

uint64_t sub_24CA28F78@<X0>(uint64_t a1@<X2>, void *a2@<X8>)
{
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CA2D15C(&qword_2698064C8, (void (*)(uint64_t))type metadata accessor for DefaultLSAppsSettingsProvider);
  sub_24CA40228();
  swift_release();
  uint64_t v4 = *(void *)(a1 + 112);
  swift_retain();
  swift_release();
  uint64_t result = swift_release();
  *a2 = v4;
  return result;
}

uint64_t sub_24CA290F0(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = *a1;
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CA2D15C(&qword_2698064C8, (void (*)(uint64_t))type metadata accessor for DefaultLSAppsSettingsProvider);
  sub_24CA40228();
  swift_release();
  uint64_t v7 = *(void *)(a5 + 112);
  swift_retain();
  swift_release();
  char v8 = _s21DefaultAppsSettingsUI9AppRecordC2eeoiySbAC_ACtFZ_0(v7, v6);
  swift_release();
  if ((v8 & 1) == 0) {
    sub_24CA27148(v6);
  }
  return swift_release();
}

uint64_t sub_24CA2928C@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v14 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698064D8);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)v13 - v8;
  sub_24CA40768();
  v13[1] = sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  uint64_t v15 = a1;
  sub_24CA2D15C(&qword_2698064C8, (void (*)(uint64_t))type metadata accessor for DefaultLSAppsSettingsProvider);
  sub_24CA40228();
  swift_release();
  uint64_t v10 = *(void *)(a1 + 120);
  swift_bridgeObjectRetain();
  swift_release();
  uint64_t v15 = v10;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269806500);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698064F8);
  type metadata accessor for AppRecord();
  sub_24CA2DF30(&qword_269806508, &qword_269806500);
  sub_24CA2DF30(&qword_2698064F0, &qword_2698064F8);
  sub_24CA2D15C(&qword_269806510, (void (*)(uint64_t))type metadata accessor for AppRecord);
  sub_24CA40598();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(v4 + 32);
  v11(v9, v7, v3);
  v11(v14, v9, v3);
  return swift_release();
}

uint64_t sub_24CA295E8(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  uint64_t isCurrentExecutor = swift_task_isCurrentExecutor();
  if ((isCurrentExecutor & 1) == 0) {
    uint64_t isCurrentExecutor = swift_task_reportUnexpectedExecutor();
  }
  uint64_t v11 = v3;
  MEMORY[0x270FA5388](isCurrentExecutor);
  v10[2] = v3;
  v10[3] = a2;
  uint64_t v5 = type metadata accessor for AppRecord();
  swift_retain();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269806518);
  uint64_t v7 = sub_24CA2D15C(&qword_2698064E0, (void (*)(uint64_t))type metadata accessor for AppRecord);
  uint64_t v8 = sub_24CA2DF30(&qword_269806520, &qword_269806518);
  MEMORY[0x253304E10](&v11, sub_24CA2CF38, v10, v5, v6, v7, v8);
  return swift_release();
}

uint64_t sub_24CA29778()
{
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  uint64_t isCurrentExecutor = swift_task_isCurrentExecutor();
  if ((isCurrentExecutor & 1) == 0) {
    uint64_t isCurrentExecutor = swift_task_reportUnexpectedExecutor();
  }
  MEMORY[0x270FA5388](isCurrentExecutor);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269806528);
  sub_24CA2D024(&qword_269806530, &qword_269806528, (void (*)(void))sub_24CA2CF50);
  sub_24CA404D8();
  return swift_release();
}

uint64_t sub_24CA298D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CA2D15C(&qword_269806358, (void (*)(uint64_t))type metadata accessor for AppRecord);
  sub_24CA40228();
  swift_release();
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  swift_bridgeObjectRetain();
  uint64_t result = swift_release();
  *(void *)a2 = v5;
  *(void *)(a2 + 8) = v4;
  *(unsigned char *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = MEMORY[0x263F8EE78];
  return result;
}

uint64_t sub_24CA29A00@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v54 = a3;
  uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_269806580);
  MEMORY[0x270FA5388](v48);
  uint64_t v49 = (uint64_t)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_269806570);
  uint64_t v6 = MEMORY[0x270FA5388](v44);
  uint64_t v8 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v41 = (uint64_t)&v40 - v9;
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_269806588);
  MEMORY[0x270FA5388](v42);
  uint64_t v43 = (uint64_t)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_269806560);
  MEMORY[0x270FA5388](v47);
  v45 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269806590);
  MEMORY[0x270FA5388](v51);
  uint64_t v13 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269806540);
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v40 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_269806550);
  MEMORY[0x270FA5388](v53);
  v46 = (char *)&v40 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269806528);
  MEMORY[0x270FA5388](v19 - 8);
  v52 = (char *)&v40 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CA40768();
  uint64_t v50 = sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  uint64_t v55 = a1;
  sub_24CA2D15C(&qword_269806358, (void (*)(uint64_t))type metadata accessor for AppRecord);
  sub_24CA40228();
  swift_release();
  if (*(void *)(a1 + 24))
  {
    id v21 = objc_allocWithZone(MEMORY[0x263F4B540]);
    swift_bridgeObjectRetain();
    uint64_t v22 = (void *)sub_24CA40658();
    swift_bridgeObjectRelease();
    objc_msgSend(v21, sel_initWithBundleIdentifier_, v22);

    id v23 = objc_msgSend(self, sel_imageDescriptorNamed_, *MEMORY[0x263F4B5A0]);
    sub_24CA402D8();
    (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v13, v17, v14);
    swift_storeEnumTagMultiPayload();
    sub_24CA2DF30(&qword_269806538, &qword_269806540);
    sub_24CA2CF50();
    uint64_t v24 = (uint64_t)v52;
    sub_24CA403C8();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
    uint64_t v25 = v54;
  }
  else
  {
    if (*(void *)(a2 + 88) == 4
      && (id v26 = objc_msgSend(self, sel_currentDevice),
          id v27 = objc_msgSend(v26, sel_userInterfaceIdiom),
          v26,
          v27 == (id)1))
    {
      swift_getKeyPath();
      uint64_t v55 = a1;
      sub_24CA40228();
      swift_release();
      switch(*(unsigned char *)(a1 + 80))
      {
        case 2:
          swift_bridgeObjectRelease();
          goto LABEL_12;
        case 3:
          goto LABEL_9;
        default:
          char v28 = sub_24CA40978();
          swift_bridgeObjectRelease();
          if (v28)
          {
LABEL_12:
            id v36 = objc_allocWithZone(MEMORY[0x263F4B540]);
            uint64_t v37 = (void *)sub_24CA40658();
            objc_msgSend(v36, sel_initWithBundleIdentifier_, v37);

            id v38 = objc_msgSend(self, sel_imageDescriptorNamed_, *MEMORY[0x263F4B5A0]);
            sub_24CA402D8();
            (*(void (**)(uint64_t, char *, uint64_t))(v15 + 16))(v43, v17, v14);
            swift_storeEnumTagMultiPayload();
            sub_24CA2DF30(&qword_269806538, &qword_269806540);
            sub_24CA2D0C4();
            uint64_t v32 = (uint64_t)v45;
            sub_24CA403C8();
            (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
          }
          else
          {
LABEL_9:
            id v29 = objc_msgSend(self, sel_genericApplicationIcon);
            id v30 = objc_msgSend(self, sel_imageDescriptorNamed_, *MEMORY[0x263F4B5A0]);
            sub_24CA402D8();
            (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v8, v17, v14);
            (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
            uint64_t v31 = v41;
            sub_24CA2D1AC((uint64_t)v8, v41, &qword_269806570);
            sub_24CA2D210(v31, v43, &qword_269806570);
            swift_storeEnumTagMultiPayload();
            sub_24CA2DF30(&qword_269806538, &qword_269806540);
            sub_24CA2D0C4();
            uint64_t v32 = (uint64_t)v45;
            sub_24CA403C8();
            sub_24CA2D800(v31, &qword_269806570);
          }
          uint64_t v35 = (uint64_t)v46;
          sub_24CA2D210(v32, v49, &qword_269806560);
          swift_storeEnumTagMultiPayload();
          sub_24CA2D024(&qword_269806558, &qword_269806560, (void (*)(void))sub_24CA2D0C4);
          sub_24CA2DF30(&qword_269806538, &qword_269806540);
          sub_24CA403C8();
          sub_24CA2D800(v32, &qword_269806560);
          uint64_t v25 = v54;
          uint64_t v24 = (uint64_t)v52;
          break;
      }
    }
    else
    {
      id v33 = objc_msgSend(self, sel_genericApplicationIcon);
      id v34 = objc_msgSend(self, sel_imageDescriptorNamed_, *MEMORY[0x263F4B5A0]);
      sub_24CA402D8();
      (*(void (**)(uint64_t, char *, uint64_t))(v15 + 16))(v49, v17, v14);
      swift_storeEnumTagMultiPayload();
      sub_24CA2D024(&qword_269806558, &qword_269806560, (void (*)(void))sub_24CA2D0C4);
      sub_24CA2DF30(&qword_269806538, &qword_269806540);
      uint64_t v35 = (uint64_t)v46;
      sub_24CA403C8();
      (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
      uint64_t v25 = v54;
      uint64_t v24 = (uint64_t)v52;
    }
    sub_24CA2D210(v35, (uint64_t)v13, &qword_269806550);
    swift_storeEnumTagMultiPayload();
    sub_24CA2DF30(&qword_269806538, &qword_269806540);
    sub_24CA2CF50();
    sub_24CA403C8();
    sub_24CA2D800(v35, &qword_269806550);
  }
  sub_24CA2D1AC(v24, v25, &qword_269806528);
  return swift_release();
}

uint64_t sub_24CA2A554@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CA2D15C(&qword_2698064C8, (void (*)(uint64_t))type metadata accessor for DefaultLSAppsSettingsProvider);
  sub_24CA40228();
  swift_release();
  uint64_t v4 = *(void *)(a1 + 104);
  swift_bridgeObjectRetain();
  swift_release();
  if (v4)
  {
    sub_24CA2CDA4();
    uint64_t v4 = sub_24CA403F8();
    uint64_t v6 = v5;
    char v8 = v7;
    uint64_t v10 = v9;
    uint64_t result = swift_release();
    uint64_t v12 = v8 & 1;
  }
  else
  {
    uint64_t result = swift_release();
    uint64_t v6 = 0;
    uint64_t v12 = 0;
    uint64_t v10 = 0;
  }
  *a2 = v4;
  a2[1] = v6;
  a2[2] = v12;
  a2[3] = v10;
  return result;
}

id sub_24CA2A71C()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for DefaultLSAppsSettingsProvider.CallCapabilitiesMonitor()
{
  return self;
}

uint64_t sub_24CA2A93C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_24CA2A970()
{
  return sub_24CA21DC8() & 1;
}

uint64_t sub_24CA2A998()
{
  uint64_t v1 = *v0;
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v2 = *(void *)(v1 + 40);
  swift_bridgeObjectRetain();
  swift_release();
  return v2;
}

uint64_t sub_24CA2AA34()
{
  return sub_24CA220D4();
}

uint64_t sub_24CA2AA58()
{
  uint64_t v1 = *v0;
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v2 = *(void *)(v1 + 72);
  swift_bridgeObjectRetain();
  swift_release();
  return v2;
}

uint64_t sub_24CA2AAF4()
{
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269806468);
  sub_24CA2AC90();
  sub_24CA403D8();

  return swift_release();
}

uint64_t sub_24CA2ABD0@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 24);
  *a1 = *(void *)(*(void *)v1 + 16);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_24CA2ABE0()
{
  return sub_24CA2D15C(&qword_269806460, (void (*)(uint64_t))type metadata accessor for DefaultLSAppsSettingsProvider);
}

uint64_t sub_24CA2AC28()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24CA2AC44@<X0>(uint64_t a1@<X8>)
{
  return sub_24CA28634(v1, a1);
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

unint64_t sub_24CA2AC90()
{
  unint64_t result = qword_269806470;
  if (!qword_269806470)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269806468);
    sub_24CA2AD78();
    sub_24CA2DF30(&qword_2698064B0, &qword_2698064B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269806470);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_24CA2AD78()
{
  unint64_t result = qword_269806478;
  if (!qword_269806478)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269806480);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269806488);
    sub_24CA40398();
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269806490);
    sub_24CA2DF30(&qword_269806498, &qword_269806490);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    sub_24CA2AEB4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269806478);
  }
  return result;
}

unint64_t sub_24CA2AEB4()
{
  unint64_t result = qword_2698064A0;
  if (!qword_2698064A0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2698064A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698064A0);
  }
  return result;
}

uint64_t sub_24CA2AF20@<X0>(uint64_t a1@<X8>)
{
  return sub_24CA28A64(v1, a1);
}

uint64_t sub_24CA2AF28@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24CA24840();
  *a1 = result & 1;
  return result;
}

uint64_t sub_24CA2AF58()
{
  return sub_24CA24948();
}

uint64_t sub_24CA2AF80()
{
  uint64_t result = sub_24CA40658();
  qword_2698063C0 = result;
  return result;
}

id sub_24CA2AFB8()
{
  if (qword_269806320 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_2698063C0;
  qword_2698063C8 = qword_2698063C0;

  return v0;
}

uint64_t sub_24CA2B01C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24CA2B0F8;
  return v6(a1);
}

uint64_t sub_24CA2B0F8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24CA2B1F0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_24CA2B2C4(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_24CA2D9C0((uint64_t)v12, *a3);
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
      sub_24CA2D9C0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_24CA2B2C4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_24CA407E8();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_24CA2B480(a5, a6);
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
  uint64_t v8 = sub_24CA40878();
  if (!v8)
  {
    sub_24CA408D8();
    __break(1u);
LABEL_17:
    uint64_t result = sub_24CA40938();
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

uint64_t sub_24CA2B480(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_24CA2B518(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_24CA2B6F8(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_24CA2B6F8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24CA2B518(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_24CA2B690(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_24CA40848();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_24CA408D8();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_24CA406A8();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_24CA40938();
    __break(1u);
LABEL_14:
    uint64_t result = sub_24CA408D8();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_24CA2B690(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698065E8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24CA2B6F8(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698065E8);
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
  uint64_t result = sub_24CA40938();
  __break(1u);
  return result;
}

uint64_t sub_24CA2B848(uint64_t *a1)
{
  uint64_t v2 = a1[1];
  uint64_t result = sub_24CA40958();
  uint64_t v92 = v2;
  if (result >= v2)
  {
    if (v2 < 0) {
      goto LABEL_146;
    }
    if ((unint64_t)v2 >= 2)
    {
      int64_t v8 = (void *)*a1;
      sub_24CA40768();
      uint64_t v9 = -1;
      uint64_t v10 = 1;
      v101 = v8;
      do
      {
        v93 = v8;
        uint64_t v97 = v10;
        uint64_t v99 = v9;
        do
        {
          swift_retain();
          swift_retain();
          sub_24CA40758();
          sub_24CA40718();
          if ((swift_task_isCurrentExecutor() & 1) == 0) {
            swift_task_reportUnexpectedExecutor();
          }
          swift_getKeyPath();
          sub_24CA2D15C(&qword_269806358, (void (*)(uint64_t))type metadata accessor for AppRecord);
          sub_24CA40228();
          swift_release();
          swift_getKeyPath();
          swift_bridgeObjectRetain();
          sub_24CA40228();
          swift_release();
          sub_24CA2CDA4();
          uint64_t v11 = sub_24CA407F8();
          swift_release();
          swift_release();
          swift_release();
          uint64_t result = swift_bridgeObjectRelease();
          if (v11 != -1) {
            break;
          }
          if (!v101) {
            goto LABEL_149;
          }
          uint64_t v12 = *v8;
          *int64_t v8 = v8[1];
          v8[1] = v12;
          --v8;
        }
        while (!__CFADD__(v9++, 1));
        uint64_t v10 = v97 + 1;
        int64_t v8 = v93 + 1;
        uint64_t v9 = v99 - 1;
      }
      while (v97 + 1 != v92);
    }
    return result;
  }
  if (v2 >= 0) {
    uint64_t v4 = v2;
  }
  else {
    uint64_t v4 = v2 + 1;
  }
  if (v2 < -1) {
    goto LABEL_155;
  }
  uint64_t v5 = result;
  v87 = a1;
  if (v2 < 2)
  {
    uint64_t v14 = (char *)MEMORY[0x263F8EE78];
    uint64_t v104 = MEMORY[0x263F8EE78];
    v96 = (char *)((MEMORY[0x263F8EE78] & 0xFFFFFFFFFFFFFF8) + 32);
    if (v2 != 1)
    {
      unint64_t v16 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_112:
      if (v16 >= 2)
      {
        uint64_t v81 = *v87;
        do
        {
          unint64_t v82 = v16 - 2;
          if (v16 < 2) {
            goto LABEL_141;
          }
          if (!v81) {
            goto LABEL_154;
          }
          uint64_t v83 = *(void *)&v14[16 * v82 + 32];
          uint64_t v84 = *(void *)&v14[16 * v16 + 24];
          sub_24CA2C508((char *)(v81 + 8 * v83), (char *)(v81 + 8 * *(void *)&v14[16 * v16 + 16]), v81 + 8 * v84, v96);
          if (v98) {
            break;
          }
          if (v84 < v83) {
            goto LABEL_142;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v14 = sub_24CA2CCAC((uint64_t)v14);
          }
          if (v82 >= *((void *)v14 + 2)) {
            goto LABEL_143;
          }
          v85 = &v14[16 * v82 + 32];
          *(void *)v85 = v83;
          *((void *)v85 + 1) = v84;
          unint64_t v86 = *((void *)v14 + 2);
          if (v16 > v86) {
            goto LABEL_144;
          }
          memmove(&v14[16 * v16 + 16], &v14[16 * v16 + 32], 16 * (v86 - v16));
          *((void *)v14 + 2) = v86 - 1;
          unint64_t v16 = v86 - 1;
        }
        while (v86 > 2);
      }
LABEL_123:
      swift_bridgeObjectRelease();
      *(void *)((v104 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
      sub_24CA406D8();
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    uint64_t v6 = v4 >> 1;
    type metadata accessor for AppRecord();
    uint64_t v7 = sub_24CA406F8();
    *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) = v6;
    v96 = (char *)((v7 & 0xFFFFFFFFFFFFFF8) + 32);
    uint64_t v104 = v7;
  }
  uint64_t v90 = v5;
  uint64_t v15 = 0;
  uint64_t v89 = *a1 + 16;
  uint64_t v14 = (char *)MEMORY[0x263F8EE78];
  uint64_t v88 = *a1 - 8;
  uint64_t v100 = *a1;
  while (1)
  {
    uint64_t v17 = v15 + 1;
    uint64_t v91 = v15;
    if (v15 + 1 < v2)
    {
      sub_24CA40768();
      swift_retain();
      swift_retain();
      sub_24CA40758();
      sub_24CA40718();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      swift_getKeyPath();
      sub_24CA2D15C(&qword_269806358, (void (*)(uint64_t))type metadata accessor for AppRecord);
      sub_24CA40228();
      swift_release();
      swift_getKeyPath();
      swift_bridgeObjectRetain();
      sub_24CA40228();
      swift_release();
      sub_24CA2CDA4();
      uint64_t v94 = sub_24CA407F8();
      swift_release();
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      uint64_t v17 = v15 + 2;
      if (v15 + 2 < v2)
      {
        uint64_t v18 = v89 + 8 * v15;
        while (1)
        {
          uint64_t v102 = v17;
          swift_retain();
          swift_retain();
          sub_24CA40758();
          sub_24CA40718();
          if ((swift_task_isCurrentExecutor() & 1) == 0) {
            swift_task_reportUnexpectedExecutor();
          }
          swift_getKeyPath();
          sub_24CA40228();
          swift_release();
          swift_getKeyPath();
          swift_bridgeObjectRetain();
          sub_24CA40228();
          swift_release();
          uint64_t v19 = sub_24CA407F8();
          swift_release();
          swift_release();
          swift_release();
          swift_bridgeObjectRelease();
          if ((v94 == -1) == (v19 != -1)) {
            break;
          }
          ++v17;
          v18 += 8;
          uint64_t v2 = v92;
          if (v92 == v102 + 1)
          {
            uint64_t v17 = v92;
            goto LABEL_35;
          }
        }
        uint64_t v2 = v92;
LABEL_35:
        uint64_t v15 = v91;
      }
      if (v94 == -1)
      {
        if (v17 < v15) {
          goto LABEL_150;
        }
        if (v15 < v17)
        {
          uint64_t v20 = (uint64_t *)(v88 + 8 * v17);
          uint64_t v21 = v17;
          uint64_t v22 = v15;
          id v23 = (uint64_t *)(v100 + 8 * v15);
          do
          {
            if (v22 != --v21)
            {
              if (!v100) {
                goto LABEL_153;
              }
              uint64_t v24 = *v23;
              *id v23 = *v20;
              *uint64_t v20 = v24;
            }
            ++v22;
            --v20;
            ++v23;
          }
          while (v22 < v21);
        }
      }
    }
    if (v17 < v2)
    {
      if (__OFSUB__(v17, v15)) {
        goto LABEL_145;
      }
      if (v17 - v15 < v90) {
        break;
      }
    }
LABEL_64:
    if (v17 < v15) {
      goto LABEL_140;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v14 = sub_24CA2CAF4(0, *((void *)v14 + 2) + 1, 1, v14);
    }
    unint64_t v31 = *((void *)v14 + 2);
    unint64_t v30 = *((void *)v14 + 3);
    unint64_t v16 = v31 + 1;
    uint64_t v32 = v100;
    if (v31 >= v30 >> 1)
    {
      v80 = sub_24CA2CAF4((char *)(v30 > 1), v31 + 1, 1, v14);
      uint64_t v32 = v100;
      uint64_t v14 = v80;
    }
    *((void *)v14 + 2) = v16;
    id v33 = v14 + 32;
    id v34 = &v14[16 * v31 + 32];
    *(void *)id v34 = v15;
    *((void *)v34 + 1) = v17;
    if (v31)
    {
      while (1)
      {
        unint64_t v35 = v16 - 1;
        if (v16 >= 4)
        {
          uint64_t v40 = &v33[16 * v16];
          uint64_t v41 = *((void *)v40 - 8);
          uint64_t v42 = *((void *)v40 - 7);
          BOOL v46 = __OFSUB__(v42, v41);
          uint64_t v43 = v42 - v41;
          if (v46) {
            goto LABEL_129;
          }
          uint64_t v45 = *((void *)v40 - 6);
          uint64_t v44 = *((void *)v40 - 5);
          BOOL v46 = __OFSUB__(v44, v45);
          uint64_t v38 = v44 - v45;
          char v39 = v46;
          if (v46) {
            goto LABEL_130;
          }
          unint64_t v47 = v16 - 2;
          uint64_t v48 = &v33[16 * v16 - 32];
          uint64_t v50 = *(void *)v48;
          uint64_t v49 = *((void *)v48 + 1);
          BOOL v46 = __OFSUB__(v49, v50);
          uint64_t v51 = v49 - v50;
          if (v46) {
            goto LABEL_132;
          }
          BOOL v46 = __OFADD__(v38, v51);
          uint64_t v52 = v38 + v51;
          if (v46) {
            goto LABEL_135;
          }
          if (v52 >= v43)
          {
            v70 = &v33[16 * v35];
            uint64_t v72 = *(void *)v70;
            uint64_t v71 = *((void *)v70 + 1);
            BOOL v46 = __OFSUB__(v71, v72);
            uint64_t v73 = v71 - v72;
            if (v46) {
              goto LABEL_139;
            }
            BOOL v63 = v38 < v73;
            goto LABEL_101;
          }
        }
        else
        {
          if (v16 != 3)
          {
            uint64_t v64 = *((void *)v14 + 4);
            uint64_t v65 = *((void *)v14 + 5);
            BOOL v46 = __OFSUB__(v65, v64);
            uint64_t v57 = v65 - v64;
            char v58 = v46;
            goto LABEL_95;
          }
          uint64_t v37 = *((void *)v14 + 4);
          uint64_t v36 = *((void *)v14 + 5);
          BOOL v46 = __OFSUB__(v36, v37);
          uint64_t v38 = v36 - v37;
          char v39 = v46;
        }
        if (v39) {
          goto LABEL_131;
        }
        unint64_t v47 = v16 - 2;
        uint64_t v53 = &v33[16 * v16 - 32];
        uint64_t v55 = *(void *)v53;
        uint64_t v54 = *((void *)v53 + 1);
        BOOL v56 = __OFSUB__(v54, v55);
        uint64_t v57 = v54 - v55;
        char v58 = v56;
        if (v56) {
          goto LABEL_134;
        }
        v59 = &v33[16 * v35];
        uint64_t v61 = *(void *)v59;
        uint64_t v60 = *((void *)v59 + 1);
        BOOL v46 = __OFSUB__(v60, v61);
        uint64_t v62 = v60 - v61;
        if (v46) {
          goto LABEL_137;
        }
        if (__OFADD__(v57, v62)) {
          goto LABEL_138;
        }
        if (v57 + v62 >= v38)
        {
          BOOL v63 = v38 < v62;
LABEL_101:
          if (v63) {
            unint64_t v35 = v47;
          }
          goto LABEL_103;
        }
LABEL_95:
        if (v58) {
          goto LABEL_133;
        }
        v66 = &v33[16 * v35];
        uint64_t v68 = *(void *)v66;
        uint64_t v67 = *((void *)v66 + 1);
        BOOL v46 = __OFSUB__(v67, v68);
        uint64_t v69 = v67 - v68;
        if (v46) {
          goto LABEL_136;
        }
        if (v69 < v57) {
          goto LABEL_23;
        }
LABEL_103:
        unint64_t v74 = v35 - 1;
        if (v35 - 1 >= v16)
        {
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
LABEL_144:
          __break(1u);
LABEL_145:
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
          goto LABEL_148;
        }
        if (!v32) {
          goto LABEL_152;
        }
        v75 = &v33[16 * v74];
        uint64_t v76 = *(void *)v75;
        v77 = &v33[16 * v35];
        uint64_t v78 = *((void *)v77 + 1);
        sub_24CA2C508((char *)(v32 + 8 * *(void *)v75), (char *)(v32 + 8 * *(void *)v77), v32 + 8 * v78, v96);
        if (v98) {
          goto LABEL_123;
        }
        if (v78 < v76) {
          goto LABEL_126;
        }
        if (v35 > *((void *)v14 + 2)) {
          goto LABEL_127;
        }
        *(void *)v75 = v76;
        *(void *)&v33[16 * v74 + 8] = v78;
        unint64_t v79 = *((void *)v14 + 2);
        if (v35 >= v79) {
          goto LABEL_128;
        }
        unint64_t v16 = v79 - 1;
        memmove(&v33[16 * v35], v77 + 16, 16 * (v79 - 1 - v35));
        *((void *)v14 + 2) = v79 - 1;
        uint64_t v32 = v100;
        if (v79 <= 2) {
          goto LABEL_23;
        }
      }
    }
    unint64_t v16 = 1;
LABEL_23:
    uint64_t v2 = v92;
    uint64_t v15 = v17;
    if (v17 >= v92) {
      goto LABEL_112;
    }
  }
  if (__OFADD__(v15, v90)) {
    goto LABEL_147;
  }
  if (v15 + v90 >= v2) {
    uint64_t v25 = v2;
  }
  else {
    uint64_t v25 = v15 + v90;
  }
  if (v25 >= v15)
  {
    if (v17 != v25)
    {
      sub_24CA40768();
      id v26 = (void *)(v88 + 8 * v17);
      do
      {
        v95 = v26;
        uint64_t v103 = v17;
        while (1)
        {
          swift_retain();
          swift_retain();
          sub_24CA40758();
          sub_24CA40718();
          if ((swift_task_isCurrentExecutor() & 1) == 0) {
            swift_task_reportUnexpectedExecutor();
          }
          swift_getKeyPath();
          sub_24CA2D15C(&qword_269806358, (void (*)(uint64_t))type metadata accessor for AppRecord);
          sub_24CA40228();
          swift_release();
          swift_getKeyPath();
          swift_bridgeObjectRetain();
          sub_24CA40228();
          swift_release();
          sub_24CA2CDA4();
          uint64_t v28 = sub_24CA407F8();
          swift_release();
          swift_release();
          swift_release();
          swift_bridgeObjectRelease();
          if (v28 != -1) {
            break;
          }
          uint64_t v27 = v103;
          if (!v100) {
            goto LABEL_151;
          }
          uint64_t v29 = *v26;
          *id v26 = v26[1];
          v26[1] = v29;
          --v26;
          if (v103 == ++v15) {
            goto LABEL_55;
          }
        }
        uint64_t v27 = v103;
LABEL_55:
        uint64_t v17 = v27 + 1;
        id v26 = v95 + 1;
        uint64_t v15 = v91;
      }
      while (v17 != v25);
      uint64_t v17 = v25;
    }
    goto LABEL_64;
  }
LABEL_148:
  __break(1u);
LABEL_149:
  __break(1u);
LABEL_150:
  __break(1u);
LABEL_151:
  __break(1u);
LABEL_152:
  __break(1u);
LABEL_153:
  __break(1u);
LABEL_154:
  __break(1u);
LABEL_155:
  uint64_t result = sub_24CA408D8();
  __break(1u);
  return result;
}

uint64_t sub_24CA2C508(char *__src, char *a2, unint64_t a3, char *__dst)
{
  uint64_t v4 = __dst;
  uint64_t v5 = a2;
  uint64_t v6 = __src;
  int64_t v7 = a2 - __src;
  int64_t v8 = a2 - __src + 7;
  if (a2 - __src >= 0) {
    int64_t v8 = a2 - __src;
  }
  uint64_t v9 = v8 >> 3;
  uint64_t v10 = a3 - (void)a2;
  uint64_t v11 = a3 - (void)a2 + 7;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v11 = a3 - (void)a2;
  }
  uint64_t v12 = v11 >> 3;
  unint64_t v31 = __src;
  unint64_t v30 = __dst;
  if (v9 >= v11 >> 3)
  {
    if (v10 < -7) {
      goto LABEL_52;
    }
    if (__dst != a2 || &a2[8 * v12] <= __dst) {
      memmove(__dst, a2, 8 * v12);
    }
    unint64_t v16 = &v4[8 * v12];
    uint64_t v29 = v16;
    unint64_t v31 = v5;
    if (v6 >= v5 || v10 < 8) {
      goto LABEL_51;
    }
    sub_24CA40768();
    uint64_t v22 = v4;
    uint64_t v17 = (char *)(a3 - 8);
    uint64_t v18 = v5;
    while (1)
    {
      unint64_t v28 = (unint64_t)v16;
      id v23 = v18 - 8;
      uint64_t v24 = v16 - 8;
      swift_retain();
      swift_retain();
      sub_24CA40758();
      sub_24CA40718();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t v25 = v17 + 8;
      swift_getKeyPath();
      sub_24CA2D15C(&qword_269806358, (void (*)(uint64_t))type metadata accessor for AppRecord);
      sub_24CA40228();
      swift_release();
      swift_getKeyPath();
      swift_bridgeObjectRetain();
      sub_24CA40228();
      swift_release();
      sub_24CA2CDA4();
      uint64_t v19 = sub_24CA407F8();
      swift_release();
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      if (v19 == -1)
      {
        uint64_t v18 = v23;
        if (v25 != v5 || v17 >= v5) {
          *(void *)uint64_t v17 = *(void *)v23;
        }
        unint64_t v31 = v23;
      }
      else
      {
        v16 -= 8;
        uint64_t v29 = v24;
        if ((unint64_t)v25 >= v28 && (unint64_t)v17 < v28)
        {
          uint64_t v20 = v22;
          if (v25 != (char *)v28) {
            *(void *)uint64_t v17 = *(void *)v24;
          }
          uint64_t v18 = v5;
          goto LABEL_47;
        }
        *(void *)uint64_t v17 = *(void *)v24;
        uint64_t v18 = v5;
      }
      uint64_t v20 = v22;
LABEL_47:
      if (v18 > v6)
      {
        v17 -= 8;
        uint64_t v5 = v18;
        if (v16 > v20) {
          continue;
        }
      }
      goto LABEL_51;
    }
  }
  if (v7 >= -7)
  {
    if (__dst != __src || &__src[8 * v9] <= __dst) {
      memmove(__dst, __src, 8 * v9);
    }
    id v26 = &v4[8 * v9];
    uint64_t v29 = v26;
    if ((unint64_t)v5 < a3 && v7 >= 8)
    {
      sub_24CA40768();
      do
      {
        uint64_t v13 = v4;
        swift_retain();
        swift_retain();
        sub_24CA40758();
        sub_24CA40718();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        swift_getKeyPath();
        sub_24CA2D15C(&qword_269806358, (void (*)(uint64_t))type metadata accessor for AppRecord);
        sub_24CA40228();
        swift_release();
        swift_getKeyPath();
        swift_bridgeObjectRetain();
        sub_24CA40228();
        swift_release();
        sub_24CA2CDA4();
        uint64_t v14 = sub_24CA407F8();
        swift_release();
        swift_release();
        swift_release();
        swift_bridgeObjectRelease();
        if (v14 == -1)
        {
          uint64_t v15 = v5 + 8;
          if (v6 < v5 || v6 >= v15 || v6 != v5) {
            *(void *)uint64_t v6 = *(void *)v5;
          }
        }
        else
        {
          if (v6 != v4) {
            *(void *)uint64_t v6 = *(void *)v4;
          }
          v4 += 8;
          unint64_t v30 = v13 + 8;
          uint64_t v15 = v5;
        }
        v6 += 8;
        unint64_t v31 = v6;
        if (v4 >= v26) {
          break;
        }
        uint64_t v5 = v15;
      }
      while ((unint64_t)v15 < a3);
    }
LABEL_51:
    sub_24CA2CBF0((void **)&v31, &v30, &v29);
    return 1;
  }
LABEL_52:
  uint64_t result = sub_24CA40938();
  __break(1u);
  return result;
}

char *sub_24CA2CAF4(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269806620);
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
  uint64_t v14 = a4 + 32;
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

char *sub_24CA2CBF0(void **a1, const void **a2, void *a3)
{
  unint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 7;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -8)
  {
    uint64_t result = (char *)sub_24CA40938();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7])
    {
      return (char *)memmove(result, v3, 8 * v7);
    }
  }
  return result;
}

char *sub_24CA2CCAC(uint64_t a1)
{
  return sub_24CA2CAF4(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_24CA2CCC0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24CA40368();
  *a1 = result & 1;
  return result;
}

uint64_t sub_24CA2CCF0()
{
  return sub_24CA40378();
}

uint64_t sub_24CA2CD18()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

unsigned char *sub_24CA2CD28(unsigned char *result)
{
  *result &= ~*(unsigned char *)(v1 + 16) & 1;
  return result;
}

uint64_t sub_24CA2CD40()
{
  return sub_24CA24AA8(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

uint64_t sub_24CA2CD60@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24CA22418();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_24CA2CD8C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_14Tm(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t))sub_24CA2252C);
}

unint64_t sub_24CA2CDA4()
{
  unint64_t result = qword_2698064D0;
  if (!qword_2698064D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698064D0);
  }
  return result;
}

uint64_t sub_24CA2CDF8()
{
  return sub_24CA2269C(v0[2], v0[3], v0[4]);
}

uint64_t sub_24CA2CE1C@<X0>(void *a1@<X8>)
{
  return sub_24CA28F78(*(void *)(v1 + 32), a1);
}

uint64_t sub_24CA2CE2C(uint64_t *a1, uint64_t a2)
{
  return sub_24CA290F0(a1, a2, v2[2], v2[3], v2[4]);
}

uint64_t sub_24CA2CE38@<X0>(char *a1@<X8>)
{
  return sub_24CA2928C(v1, a1);
}

unint64_t sub_24CA2CE40()
{
  unint64_t result = qword_2698064E8;
  if (!qword_2698064E8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2698064D8);
    sub_24CA2DF30(&qword_2698064F0, &qword_2698064F8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698064E8);
  }
  return result;
}

uint64_t sub_24CA2CED8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24CA2451C();
  *a1 = result;
  return result;
}

uint64_t sub_24CA2CF04()
{
  return sub_24CA2462C();
}

uint64_t sub_24CA2CF30(uint64_t *a1)
{
  return sub_24CA295E8(a1, v1);
}

uint64_t sub_24CA2CF38()
{
  return sub_24CA29778();
}

uint64_t sub_24CA2CF40@<X0>(uint64_t a1@<X8>)
{
  return sub_24CA298D4(v1, a1);
}

uint64_t sub_24CA2CF48@<X0>(uint64_t a1@<X8>)
{
  return sub_24CA29A00(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

unint64_t sub_24CA2CF50()
{
  unint64_t result = qword_269806548;
  if (!qword_269806548)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269806550);
    sub_24CA2D024(&qword_269806558, &qword_269806560, (void (*)(void))sub_24CA2D0C4);
    sub_24CA2DF30(&qword_269806538, &qword_269806540);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269806548);
  }
  return result;
}

uint64_t sub_24CA2D024(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    sub_24CA2DF30(&qword_269806538, &qword_269806540);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24CA2D0C4()
{
  return sub_24CA2D024(&qword_269806568, &qword_269806570, (void (*)(void))sub_24CA2D100);
}

unint64_t sub_24CA2D100()
{
  unint64_t result = qword_269806578;
  if (!qword_269806578)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269806578);
  }
  return result;
}

uint64_t sub_24CA2D15C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24CA2D1AC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_24CA2D210(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24CA2D274()
{
  return sub_24CA1FBDC(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

uint64_t sub_24CA2D29C()
{
  return sub_24CA1EE20(v0[2], v0[3], v0[4]);
}

uint64_t sub_24CA2D2BC()
{
  return sub_24CA2478C(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_24CA2D2D8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24CA22C54();
  *a1 = result;
  return result;
}

uint64_t sub_24CA2D304()
{
  return sub_24CA24288();
}

void sub_24CA2D330(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_24CA408F8();
    swift_bridgeObjectRelease();
  }

  JUMPOUT(0x253305340);
}

uint64_t sub_24CA2D3AC(uint64_t a1, int *a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_24CA2D48C;
  return v5(v2 + 32);
}

uint64_t sub_24CA2D48C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(unsigned char **)(*v0 + 16);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  *uint64_t v2 = *(unsigned char *)(v1 + 32);
  uint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

uint64_t sub_24CA2D5A0()
{
  return sub_24CA243E8(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_24CA2D5BC()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24CA2D5F4()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_24CA2D63C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_24CA2D704;
  return sub_24CA27738(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_24CA2D704()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24CA2D800(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24CA2D85C()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24CA2D894(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24CA2DF74;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2698065B8 + dword_2698065B8);
  return v6(a1, v4);
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  return sub_24CA2D9C0(a2 + 32, a1 + 32);
}

uint64_t sub_24CA2D9C0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t block_destroy_helper(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_1(a1 + 32);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t objectdestroy_17Tm()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24CA2DAA0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_24CA2DF74;
  return sub_24CA28194(a1, v4, v5, v6);
}

uint64_t sub_24CA2DB58(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24CA2D704;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2698065F0 + dword_2698065F0);
  return v6(a1, v4);
}

uint64_t sub_24CA2DC10@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24CA220D4();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_24CA2DC3C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_14Tm(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t))sub_24CA221E8);
}

uint64_t keypath_set_14Tm(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  uint64_t v7 = *a1;
  uint64_t v6 = a1[1];
  swift_bridgeObjectRetain();
  return a5(v7, v6);
}

uint64_t sub_24CA2DC9C()
{
  return sub_24CA22358(v0[2], v0[3], v0[4]);
}

uint64_t sub_24CA2DCBC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24CA21DC8();
  *a1 = result & 1;
  return result;
}

uint64_t sub_24CA2DCEC()
{
  return sub_24CA21ED0();
}

uint64_t sub_24CA2DD14()
{
  return sub_24CA22030(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

uint64_t sub_24CA2DD34()
{
  return sub_24CA25AA4();
}

uint64_t sub_24CA2DD3C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24CA24B4C();
  *a1 = result;
  return result;
}

uint64_t sub_24CA2DD68()
{
  return sub_24CA24C5C();
}

uint64_t sub_24CA2DD94()
{
  return sub_24CA24DBC(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_24CA2DDB0()
{
  return sub_24CA26BE8();
}

_OWORD *sub_24CA2DDB8(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_24CA2DDC8(uint64_t a1, unint64_t *a2)
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

uint64_t sub_24CA2DE04(uint64_t a1)
{
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (a1)
  {
    type metadata accessor for DefaultLSAppsSettingsProvider();
    swift_unknownObjectRetain();
    if (swift_dynamicCastClass()) {
      sub_24CA2629C();
    }
    swift_release();
    return swift_unknownObjectRelease();
  }
  else
  {
    return swift_release();
  }
}

uint64_t sub_24CA2DEF4()
{
  return sub_24CA2DF30(&qword_269806628, (uint64_t *)&unk_269806630);
}

uint64_t sub_24CA2DF30(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24CA2DF7C()
{
  return sub_24CA2D5A0();
}

uint64_t sub_24CA2DF94()
{
  return sub_24CA2CD40();
}

uint64_t sub_24CA2DFAC()
{
  return sub_24CA2D2BC();
}

void sub_24CA2DFC4()
{
}

uint64_t sub_24CA2DFDC()
{
  return sub_24CA2DD14();
}

uint64_t sub_24CA2DFF4()
{
  return sub_24CA2DD94();
}

uint64_t sub_24CA2E00C()
{
  return sub_24CA2CDF8();
}

uint64_t sub_24CA2E024()
{
  return sub_24CA2DC9C();
}

uint64_t sub_24CA2E03C()
{
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CA33054(&qword_269806718, (void (*)(uint64_t))type metadata accessor for DefaultAppsSettingsModel);
  sub_24CA40228();
  swift_release();
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  swift_release();
  return v1;
}

uint64_t sub_24CA2E14C()
{
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_24CA33054(&qword_269806718, (void (*)(uint64_t))type metadata accessor for DefaultAppsSettingsModel);
  sub_24CA40218();
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24CA2E2AC(uint64_t a1, uint64_t a2)
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  *(void *)(a1 + 16) = a2;
  swift_bridgeObjectRetain();
  swift_release();
  return swift_bridgeObjectRelease();
}

unint64_t sub_24CA2E360(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    long long v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269806768);
  long long v2 = (void *)sub_24CA40928();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  uint64_t v4 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_24CA2D210(v4, (uint64_t)v13, &qword_269806770);
    unint64_t result = sub_24CA30F90((uint64_t)v13);
    if (v6) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v7 = v2[6] + 40 * result;
    long long v8 = v13[0];
    long long v9 = v13[1];
    *(void *)(v7 + 32) = v14;
    *(_OWORD *)uint64_t v7 = v8;
    *(_OWORD *)(v7 + 16) = v9;
    *(_OWORD *)(v2[7] + 16 * result) = v15;
    uint64_t v10 = v2[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v2[2] = v12;
    v4 += 56;
    if (!--v3)
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

unint64_t sub_24CA2E490(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269806758);
  uint64_t v2 = sub_24CA40928();
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
    sub_24CA2D210(v6, (uint64_t)&v15, &qword_269806760);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_24CA30FD4(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    BOOL v11 = (uint64_t *)(v3[6] + 16 * result);
    *BOOL v11 = v7;
    v11[1] = v8;
    unint64_t result = sub_24CA32F1C(&v17, v3[7] + 40 * result);
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 56;
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

uint64_t sub_24CA2E5D4()
{
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CA33054(&qword_269806718, (void (*)(uint64_t))type metadata accessor for DefaultAppsSettingsModel);
  sub_24CA40228();
  swift_release();
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 64);
  swift_bridgeObjectRetain();
  swift_release();
  return v1;
}

uint64_t sub_24CA2E6F8()
{
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_24CA33054(&qword_269806718, (void (*)(uint64_t))type metadata accessor for DefaultAppsSettingsModel);
  sub_24CA40218();
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24CA2E858(uint64_t a1, uint64_t a2)
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_beginAccess();
  *(void *)(a1 + 64) = a2;
  swift_bridgeObjectRetain();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24CA2E928()
{
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CA33054(&qword_269806718, (void (*)(uint64_t))type metadata accessor for DefaultAppsSettingsModel);
  sub_24CA40228();
  swift_release();
  uint64_t v1 = *(void *)(v0 + 72);
  swift_bridgeObjectRetain();
  swift_release();
  return v1;
}

uint64_t sub_24CA2EA38()
{
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_24CA33054(&qword_269806718, (void (*)(uint64_t))type metadata accessor for DefaultAppsSettingsModel);
  sub_24CA40218();
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24CA2EB98(uint64_t a1, uint64_t a2)
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  *(void *)(a1 + 72) = a2;
  swift_bridgeObjectRetain();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24CA2EC4C()
{
  uint64_t v1 = v0;
  uint64_t v2 = MEMORY[0x263F8EE78];
  v0[2] = MEMORY[0x263F8EE78];
  uint64_t v3 = type metadata accessor for DefaultLSAppsSettingsProvider();
  swift_allocObject();
  uint64_t v4 = sub_24CA24E70(2);
  v0[3] = v4;
  swift_allocObject();
  v0[4] = sub_24CA24E70(3);
  swift_allocObject();
  v0[5] = sub_24CA24E70(4);
  swift_allocObject();
  v0[6] = sub_24CA24E70(1);
  uint64_t v50 = type metadata accessor for DefaultContactlessPaymentSettingsProvider();
  swift_allocObject();
  v0[7] = DefaultContactlessPaymentSettingsProvider.init(for:)(0, 0);
  v0[8] = sub_24CA2E490(v2);
  v0[9] = sub_24CA2E490(v2);
  sub_24CA40258();
  type metadata accessor for DefaultAppsSettingsGroup();
  uint64_t v51 = swift_allocObject();
  sub_24CA401D8();
  *(unsigned char *)(v51 + OBJC_IVAR____TtC21DefaultAppsSettingsUI24DefaultAppsSettingsGroup__isVisible) = 0;
  sub_24CA40258();
  *(void *)(v51 + OBJC_IVAR____TtC21DefaultAppsSettingsUI24DefaultAppsSettingsGroup__providers) = v2;
  sub_24CA2118C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269806728);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_24CA418E0;
  *(void *)(v5 + 56) = v3;
  uint64_t v6 = sub_24CA33054(&qword_269806748, (void (*)(uint64_t))type metadata accessor for DefaultLSAppsSettingsProvider);
  *(void *)(v5 + 32) = v4;
  *(void *)(v5 + 96) = v3;
  *(void *)(v5 + 104) = v6;
  uint64_t v7 = v1[4];
  uint64_t v8 = v1[5];
  *(void *)(v5 + 64) = v6;
  *(void *)(v5 + 72) = v7;
  *(void *)(v5 + 136) = v3;
  *(void *)(v5 + 144) = v6;
  *(void *)(v5 + 112) = v8;
  uint64_t v9 = swift_allocObject();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_24CA401D8();
  *(unsigned char *)(v9 + OBJC_IVAR____TtC21DefaultAppsSettingsUI24DefaultAppsSettingsGroup__isVisible) = 0;
  sub_24CA40258();
  *(void *)(v9 + OBJC_IVAR____TtC21DefaultAppsSettingsUI24DefaultAppsSettingsGroup__providers) = v5;
  sub_24CA2118C();
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_24CA418F0;
  uint64_t v11 = v1[6];
  uint64_t v49 = v3;
  *(void *)(v10 + 56) = v3;
  *(void *)(v10 + 64) = v6;
  *(void *)(v10 + 32) = v11;
  uint64_t v12 = swift_allocObject();
  swift_retain();
  sub_24CA401D8();
  *(unsigned char *)(v12 + OBJC_IVAR____TtC21DefaultAppsSettingsUI24DefaultAppsSettingsGroup__isVisible) = 0;
  sub_24CA40258();
  *(void *)(v12 + OBJC_IVAR____TtC21DefaultAppsSettingsUI24DefaultAppsSettingsGroup__providers) = v10;
  sub_24CA2118C();
  uint64_t v52 = v1;
  uint64_t v13 = swift_retain();
  sub_24CA324B8(v13, v12);
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269806750);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_24CA41900;
  *(void *)(v14 + 32) = v51;
  *(void *)(v14 + 40) = v9;
  *(void *)(v14 + 48) = v12;
  v54[0] = v14;
  sub_24CA406D8();
  sub_24CA40768();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  v54[0] = v1;
  sub_24CA33054(&qword_269806718, (void (*)(uint64_t))type metadata accessor for DefaultAppsSettingsModel);
  sub_24CA40218();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v16 = v1[3];
  uint64_t v55 = v49;
  uint64_t v56 = v6;
  v54[0] = v16;
  swift_retain();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CA40228();
  swift_release();
  swift_getKeyPath();
  sub_24CA40248();
  swift_release();
  swift_beginAccess();
  sub_24CA2FDB4((uint64_t)v54, 0x6C69616D45, 0xE500000000000000);
  swift_endAccess();
  *(void *)&v53[0] = v1;
  swift_getKeyPath();
  sub_24CA40238();
  swift_release();
  swift_release();
  uint64_t v17 = v1[4];
  uint64_t v55 = v49;
  uint64_t v56 = v6;
  v54[0] = v17;
  swift_retain();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CA40228();
  swift_release();
  swift_getKeyPath();
  sub_24CA40248();
  swift_release();
  swift_beginAccess();
  sub_24CA2FDB4((uint64_t)v54, 0x6E6967617373654DLL, 0xE900000000000067);
  swift_endAccess();
  *(void *)&v53[0] = v1;
  swift_getKeyPath();
  sub_24CA40238();
  swift_release();
  swift_release();
  uint64_t v18 = v1[5];
  uint64_t v55 = v49;
  uint64_t v56 = v6;
  v54[0] = v18;
  swift_retain();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CA40228();
  swift_release();
  swift_getKeyPath();
  sub_24CA40248();
  swift_release();
  swift_beginAccess();
  sub_24CA2FDB4((uint64_t)v54, 0x676E696C6C6143, 0xE700000000000000);
  swift_endAccess();
  *(void *)&v53[0] = v1;
  swift_getKeyPath();
  sub_24CA40238();
  swift_release();
  swift_release();
  uint64_t v19 = v1[6];
  uint64_t v55 = v49;
  uint64_t v56 = v6;
  v54[0] = v19;
  swift_retain();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CA40228();
  swift_release();
  swift_getKeyPath();
  sub_24CA40248();
  swift_release();
  swift_beginAccess();
  sub_24CA2FDB4((uint64_t)v54, 0x41726573776F7242, 0xEA00000000007070);
  swift_endAccess();
  *(void *)&v53[0] = v1;
  swift_getKeyPath();
  sub_24CA40238();
  swift_release();
  swift_release();
  uint64_t v20 = v1[7];
  uint64_t v55 = v50;
  uint64_t v56 = sub_24CA33054(&qword_269806738, (void (*)(uint64_t))type metadata accessor for DefaultContactlessPaymentSettingsProvider);
  v54[0] = v20;
  swift_retain();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CA40228();
  swift_release();
  swift_getKeyPath();
  sub_24CA40248();
  swift_release();
  swift_beginAccess();
  sub_24CA2FDB4((uint64_t)v54, 0x6C746361746E6F43, 0xEE00707041737365);
  swift_endAccess();
  *(void *)&v53[0] = v1;
  swift_getKeyPath();
  sub_24CA40238();
  swift_release();
  swift_release();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  v54[0] = v1;
  sub_24CA40228();
  swift_release();
  unint64_t v21 = v1[2];
  swift_bridgeObjectRetain();
  swift_release();
  v54[0] = MEMORY[0x263F8EE78];
  if (v21 >> 62) {
    goto LABEL_47;
  }
  uint64_t v22 = *(void *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (v22) {
    goto LABEL_17;
  }
  while (2)
  {
    swift_bridgeObjectRelease_n();
    uint64_t v27 = MEMORY[0x263F8EE78];
    uint64_t v28 = *(void *)(MEMORY[0x263F8EE78] + 16);
    if (!v28) {
      goto LABEL_49;
    }
LABEL_28:
    uint64_t v29 = v27 + 32;
    swift_bridgeObjectRetain();
    unint64_t v21 = MEMORY[0x263F8EE80];
    while (1)
    {
      sub_24CA2181C(v29, (uint64_t)v54);
      sub_24CA40758();
      sub_24CA40718();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      __swift_project_boxed_opaque_existential_1(v54, v55);
      uint64_t v31 = sub_24CA402A8();
      uint64_t v33 = v32;
      sub_24CA2181C((uint64_t)v54, (uint64_t)v53);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v36 = sub_24CA30FD4(v31, v33);
      uint64_t v37 = *(void *)(v21 + 16);
      BOOL v38 = (v35 & 1) == 0;
      uint64_t v39 = v37 + v38;
      if (__OFADD__(v37, v38)) {
        break;
      }
      char v40 = v35;
      if (*(void *)(v21 + 24) >= v39)
      {
        if (isUniquelyReferenced_nonNull_native)
        {
          if (v35) {
            goto LABEL_29;
          }
        }
        else
        {
          sub_24CA32158();
          if (v40) {
            goto LABEL_29;
          }
        }
      }
      else
      {
        sub_24CA31360(v39, isUniquelyReferenced_nonNull_native);
        unint64_t v41 = sub_24CA30FD4(v31, v33);
        if ((v40 & 1) != (v42 & 1)) {
          goto LABEL_53;
        }
        unint64_t v36 = v41;
        if (v40)
        {
LABEL_29:
          uint64_t v30 = *(void *)(v21 + 56) + 40 * v36;
          __swift_destroy_boxed_opaque_existential_1(v30);
          sub_24CA32F1C(v53, v30);
          goto LABEL_30;
        }
      }
      *(void *)(v21 + 8 * (v36 >> 6) + 64) |= 1 << v36;
      uint64_t v43 = (uint64_t *)(*(void *)(v21 + 48) + 16 * v36);
      *uint64_t v43 = v31;
      v43[1] = v33;
      sub_24CA32F1C(v53, *(void *)(v21 + 56) + 40 * v36);
      uint64_t v44 = *(void *)(v21 + 16);
      BOOL v45 = __OFADD__(v44, 1);
      uint64_t v46 = v44 + 1;
      if (v45) {
        goto LABEL_46;
      }
      *(void *)(v21 + 16) = v46;
      swift_bridgeObjectRetain();
LABEL_30:
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v54);
      v29 += 40;
      if (!--v28)
      {
        swift_bridgeObjectRelease();
        goto LABEL_49;
      }
    }
    __break(1u);
LABEL_46:
    __break(1u);
LABEL_47:
    swift_bridgeObjectRetain();
    uint64_t v22 = sub_24CA408F8();
    if (!v22) {
      continue;
    }
    break;
  }
LABEL_17:
  if (v22 < 1)
  {
    __break(1u);
LABEL_53:
    uint64_t result = sub_24CA40988();
    __break(1u);
  }
  else
  {
    uint64_t v23 = 0;
    do
    {
      if ((v21 & 0xC000000000000001) != 0)
      {
        uint64_t v26 = MEMORY[0x253305330](v23, v21);
      }
      else
      {
        uint64_t v26 = *(void *)(v21 + 8 * v23 + 32);
        swift_retain();
      }
      sub_24CA40758();
      sub_24CA40718();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      sub_24CA40758();
      sub_24CA40718();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      ++v23;
      swift_getKeyPath();
      *(void *)&v53[0] = v26;
      sub_24CA33054(&qword_2698063B8, (void (*)(uint64_t))type metadata accessor for DefaultAppsSettingsGroup);
      sub_24CA40228();
      swift_release();
      uint64_t v24 = (uint64_t *)(v26 + OBJC_IVAR____TtC21DefaultAppsSettingsUI24DefaultAppsSettingsGroup__providers);
      swift_beginAccess();
      uint64_t v25 = *v24;
      swift_bridgeObjectRetain();
      swift_release();
      swift_release();
      swift_release();
      sub_24CA32344(v25);
    }
    while (v22 != v23);
    swift_bridgeObjectRelease_n();
    uint64_t v27 = v54[0];
    uint64_t v28 = *(void *)(v54[0] + 16);
    if (v28) {
      goto LABEL_28;
    }
LABEL_49:
    swift_bridgeObjectRelease();
    sub_24CA40758();
    sub_24CA40718();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v47 = swift_getKeyPath();
    MEMORY[0x270FA5388](v47);
    v54[0] = v52;
    sub_24CA40218();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    return (uint64_t)v52;
  }
  return result;
}

uint64_t sub_24CA2FDB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 24))
  {
    sub_24CA32F1C((long long *)a1, (uint64_t)v9);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v8 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_24CA31B68(v9, a2, a3, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v8;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_24CA32EBC(a1);
    sub_24CA30E84(a2, a3, (uint64_t)v9);
    swift_bridgeObjectRelease();
    return sub_24CA32EBC((uint64_t)v9);
  }
}

uint64_t sub_24CA2FE74@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_bridgeObjectRetain();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CA33054(&qword_269806718, (void (*)(uint64_t))type metadata accessor for DefaultAppsSettingsModel);
  sub_24CA40228();
  swift_release();
  uint64_t v7 = *(void *)(v3 + 72);
  swift_bridgeObjectRetain();
  swift_release();
  if (*(void *)(v7 + 16) && (unint64_t v8 = sub_24CA30FD4(a1, a2), (v9 & 1) != 0))
  {
    sub_24CA2181C(*(void *)(v7 + 56) + 40 * v8, a3);
  }
  else
  {
    *(void *)(a3 + 32) = 0;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_24CA3004C(uint64_t a1, uint64_t a2)
{
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CA33054(&qword_269806718, (void (*)(uint64_t))type metadata accessor for DefaultAppsSettingsModel);
  sub_24CA40228();
  swift_release();
  unint64_t v5 = *(void *)(v2 + 16);
  swift_bridgeObjectRetain();
  swift_release();
  uint64_t v21 = MEMORY[0x263F8EE78];
  if (!(v5 >> 62))
  {
    uint64_t v6 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v6) {
      goto LABEL_7;
    }
LABEL_23:
    swift_bridgeObjectRelease_n();
    uint64_t v12 = MEMORY[0x263F8EE78];
    if (a2)
    {
LABEL_18:
      id v13 = objc_allocWithZone(MEMORY[0x263F01878]);
      swift_bridgeObjectRetain();
      id v14 = sub_24CA30A98(a1, a2, 1);
      uint64_t v15 = v14;
      if (v14)
      {
        char v16 = objc_msgSend(v14, sel_supportedDefaultAppCategories);
        char v17 = 0;
      }
      else
      {
        char v16 = 0;
        char v17 = 1;
      }
      uint64_t v18 = sub_24CA32A34(v16, v17);
      swift_bridgeObjectRetain();
      uint64_t v19 = sub_24CA32CA4(v12, (uint64_t)v18, a1, a2);
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      return (uint64_t)v19;
    }
LABEL_24:
    swift_release();
    return v12;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_24CA408F8();
  uint64_t v6 = result;
  if (!result) {
    goto LABEL_23;
  }
LABEL_7:
  if (v6 >= 1)
  {
    uint64_t v20 = a2;
    uint64_t v8 = 0;
    do
    {
      if ((v5 & 0xC000000000000001) != 0)
      {
        uint64_t v11 = MEMORY[0x253305330](v8, v5);
      }
      else
      {
        uint64_t v11 = *(void *)(v5 + 8 * v8 + 32);
        swift_retain();
      }
      sub_24CA40758();
      sub_24CA40718();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      sub_24CA40758();
      sub_24CA40718();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      ++v8;
      swift_getKeyPath();
      sub_24CA33054(&qword_2698063B8, (void (*)(uint64_t))type metadata accessor for DefaultAppsSettingsGroup);
      sub_24CA40228();
      swift_release();
      char v9 = (uint64_t *)(v11 + OBJC_IVAR____TtC21DefaultAppsSettingsUI24DefaultAppsSettingsGroup__providers);
      swift_beginAccess();
      uint64_t v10 = *v9;
      swift_bridgeObjectRetain();
      swift_release();
      swift_release();
      swift_release();
      sub_24CA32344(v10);
    }
    while (v6 != v8);
    swift_bridgeObjectRelease_n();
    uint64_t v12 = v21;
    a2 = v20;
    if (v20) {
      goto LABEL_18;
    }
    goto LABEL_24;
  }
  __break(1u);
  return result;
}

uint64_t sub_24CA304CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v25 = 0;
  long long v23 = 0u;
  long long v24 = 0u;
  sub_24CA2181C(a1, (uint64_t)v22);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269806730);
  type metadata accessor for DefaultLSAppsSettingsProvider();
  if (swift_dynamicCast())
  {
    swift_release();
    sub_24CA2181C(a1, (uint64_t)v21);
    swift_dynamicCast();
    uint64_t v10 = *(void *)(v20[1] + 88);
    swift_release();
    if (sub_24CA307E8(v10, a2))
    {
      sub_24CA32EBC((uint64_t)&v23);
      sub_24CA2181C(a1, (uint64_t)&v23);
    }
  }
  else
  {
    uint64_t v11 = type metadata accessor for DefaultContactlessPaymentSettingsProvider();
    if (swift_dynamicCast())
    {
      swift_release();
      swift_allocObject();
      swift_bridgeObjectRetain();
      uint64_t v12 = DefaultContactlessPaymentSettingsProvider.init(for:)(a3, a4);
      v21[3] = v11;
      v21[4] = sub_24CA33054(&qword_269806738, (void (*)(uint64_t))type metadata accessor for DefaultContactlessPaymentSettingsProvider);
      v21[0] = v12;
      sub_24CA32FEC((uint64_t)v21, (uint64_t)&v23);
    }
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
  uint64_t v13 = *((void *)&v24 + 1);
  if (*((void *)&v24 + 1))
  {
    id v14 = __swift_project_boxed_opaque_existential_1(&v23, *((uint64_t *)&v24 + 1));
    uint64_t v15 = *(void *)(v13 - 8);
    MEMORY[0x270FA5388](v14);
    char v17 = (char *)v20 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v15 + 16))(v17);
    char v18 = sub_24CA402C8();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v13);
    if ((v18 & 1) == 0)
    {
      sub_24CA32EBC((uint64_t)&v23);
      long long v23 = 0u;
      long long v24 = 0u;
      uint64_t v25 = 0;
    }
  }
  sub_24CA32F84((uint64_t)&v23, a5);
  return swift_release();
}

uint64_t sub_24CA307E8(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  if (*(void *)(a2 + 32) == result) {
    return 1;
  }
  if (v2 == 1) {
    return 0;
  }
  for (uint64_t i = 5; ; ++i)
  {
    uint64_t v4 = i - 3;
    if (__OFADD__(i - 4, 1)) {
      break;
    }
    BOOL v6 = *(void *)(a2 + 8 * i) == result;
    BOOL v5 = v6;
    BOOL v6 = v6 || v4 == v2;
    if (v6) {
      return v5;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_24CA3084C()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC21DefaultAppsSettingsUI24DefaultAppsSettingsModel___observationRegistrar;
  uint64_t v2 = sub_24CA40268();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t sub_24CA308F0()
{
  sub_24CA3084C();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_24CA30948()
{
  return type metadata accessor for DefaultAppsSettingsModel();
}

uint64_t type metadata accessor for DefaultAppsSettingsModel()
{
  uint64_t result = qword_269806708;
  if (!qword_269806708) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24CA3099C()
{
  uint64_t result = sub_24CA40268();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_24CA30A54@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24CA2E928();
  *a1 = result;
  return result;
}

uint64_t sub_24CA30A80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, (uint64_t (*)(uint64_t))sub_24CA2EA38);
}

id sub_24CA30A98(uint64_t a1, uint64_t a2, char a3)
{
  v10[1] = *(id *)MEMORY[0x263EF8340];
  BOOL v5 = (void *)sub_24CA40658();
  swift_bridgeObjectRelease();
  v10[0] = 0;
  id v6 = objc_msgSend(v3, sel_initWithBundleIdentifier_allowPlaceholder_error_, v5, a3 & 1, v10);

  if (v6)
  {
    id v7 = v10[0];
  }
  else
  {
    id v8 = v10[0];
    sub_24CA40178();

    swift_willThrow();
  }
  return v6;
}

void *sub_24CA30B74(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_269806728);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      id v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[5 * v8 + 4]) {
          memmove(v12, a4 + 4, 40 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v12 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_24CA32838(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_24CA30C98(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_269806740);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      id v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
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
        if (v10 != a4 || v13 >= &a4[v8 + 4]) {
          memmove(v13, a4 + 4, 8 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_24CA32948(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_24CA30DA8(uint64_t a1)
{
  uint64_t v2 = v1;
  swift_bridgeObjectRetain();
  unint64_t v4 = sub_24CA30F90(a1);
  LOBYTE(a1) = v5;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v7 = *v2;
  uint64_t v10 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_24CA31F78();
    uint64_t v7 = v10;
  }
  sub_24CA33130(*(void *)(v7 + 48) + 40 * v4);
  uint64_t v8 = *(void *)(*(void *)(v7 + 56) + 16 * v4);
  sub_24CA31688(v4, v7);
  *uint64_t v2 = v7;
  swift_bridgeObjectRelease();
  return v8;
}

double sub_24CA30E84@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_24CA30FD4(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v13 = *v4;
    *unint64_t v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_24CA32158();
      uint64_t v11 = v13;
    }
    swift_bridgeObjectRelease();
    sub_24CA32F1C((long long *)(*(void *)(v11 + 56) + 40 * v8), a3);
    sub_24CA31854(v8, v11);
    *unint64_t v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    *(void *)(a3 + 32) = 0;
    double result = 0.0;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
  }
  return result;
}

unint64_t sub_24CA30F90(uint64_t a1)
{
  uint64_t v2 = sub_24CA40818();

  return sub_24CA31D8C(a1, v2);
}

unint64_t sub_24CA30FD4(uint64_t a1, uint64_t a2)
{
  sub_24CA40998();
  sub_24CA40698();
  uint64_t v4 = sub_24CA409A8();

  return sub_24CA31E54(a1, a2, v4);
}

uint64_t sub_24CA3104C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269806768);
  uint64_t v6 = sub_24CA40918();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_41;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v14 << 6);
      goto LABEL_22;
    }
    int64_t v21 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v21 >= v11) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v36 + 8 * v21);
    ++v14;
    if (!v23)
    {
      int64_t v14 = v21 + 1;
      if (v21 + 1 >= v11) {
        goto LABEL_34;
      }
      unint64_t v23 = *(void *)(v36 + 8 * v14);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v11)
        {
LABEL_34:
          swift_release();
          if ((a2 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v23 = *(void *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v14 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_43;
            }
            if (v14 >= v11) {
              goto LABEL_34;
            }
            unint64_t v23 = *(void *)(v36 + 8 * v14);
            ++v24;
            if (v23) {
              goto LABEL_21;
            }
          }
        }
        int64_t v14 = v24;
      }
    }
LABEL_21:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v14 << 6);
LABEL_22:
    uint64_t v25 = *(void *)(v5 + 48) + 40 * v20;
    if (a2)
    {
      long long v26 = *(_OWORD *)v25;
      long long v27 = *(_OWORD *)(v25 + 16);
      uint64_t v40 = *(void *)(v25 + 32);
      long long v38 = v26;
      long long v39 = v27;
      long long v37 = *(_OWORD *)(*(void *)(v5 + 56) + 16 * v20);
    }
    else
    {
      sub_24CA33184(v25, (uint64_t)&v38);
      long long v37 = *(_OWORD *)(*(void *)(v5 + 56) + 16 * v20);
      swift_retain();
    }
    uint64_t result = sub_24CA40818();
    uint64_t v28 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v29 = result & ~v28;
    unint64_t v30 = v29 >> 6;
    if (((-1 << v29) & ~*(void *)(v12 + 8 * (v29 >> 6))) != 0)
    {
      unint64_t v15 = __clz(__rbit64((-1 << v29) & ~*(void *)(v12 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v31 = 0;
      unint64_t v32 = (unint64_t)(63 - v28) >> 6;
      do
      {
        if (++v30 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v33 = v30 == v32;
        if (v30 == v32) {
          unint64_t v30 = 0;
        }
        v31 |= v33;
        uint64_t v34 = *(void *)(v12 + 8 * v30);
      }
      while (v34 == -1);
      unint64_t v15 = __clz(__rbit64(~v34)) + (v30 << 6);
    }
    *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    uint64_t v16 = *(void *)(v7 + 48) + 40 * v15;
    long long v17 = v38;
    long long v18 = v39;
    *(void *)(v16 + 32) = v40;
    *(_OWORD *)uint64_t v16 = v17;
    *(_OWORD *)(v16 + 16) = v18;
    *(_OWORD *)(*(void *)(v7 + 56) + 16 * v15) = v37;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v22 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v22, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_24CA31360(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269806758);
  char v37 = a2;
  uint64_t v6 = sub_24CA40918();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_41;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v34 = v2;
  int64_t v35 = (unint64_t)(v8 + 63) >> 6;
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
      goto LABEL_22;
    }
    int64_t v18 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v18 >= v35) {
      break;
    }
    unint64_t v19 = (void *)(v5 + 64);
    unint64_t v20 = *(void *)(v36 + 8 * v18);
    ++v13;
    if (!v20)
    {
      int64_t v13 = v18 + 1;
      if (v18 + 1 >= v35) {
        goto LABEL_34;
      }
      unint64_t v20 = *(void *)(v36 + 8 * v13);
      if (!v20)
      {
        int64_t v21 = v18 + 2;
        if (v21 >= v35)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v34;
          if ((v37 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v20 = *(void *)(v36 + 8 * v21);
        if (!v20)
        {
          while (1)
          {
            int64_t v13 = v21 + 1;
            if (__OFADD__(v21, 1)) {
              goto LABEL_43;
            }
            if (v13 >= v35) {
              goto LABEL_34;
            }
            unint64_t v20 = *(void *)(v36 + 8 * v13);
            ++v21;
            if (v20) {
              goto LABEL_21;
            }
          }
        }
        int64_t v13 = v21;
      }
    }
LABEL_21:
    unint64_t v10 = (v20 - 1) & v20;
    unint64_t v17 = __clz(__rbit64(v20)) + (v13 << 6);
LABEL_22:
    uint64_t v22 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
    uint64_t v24 = *v22;
    uint64_t v23 = v22[1];
    uint64_t v25 = (long long *)(*(void *)(v5 + 56) + 40 * v17);
    if (v37)
    {
      sub_24CA32F1C(v25, (uint64_t)v38);
    }
    else
    {
      sub_24CA2181C((uint64_t)v25, (uint64_t)v38);
      swift_bridgeObjectRetain();
    }
    sub_24CA40998();
    sub_24CA40698();
    uint64_t result = sub_24CA409A8();
    uint64_t v26 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v27 = result & ~v26;
    unint64_t v28 = v27 >> 6;
    if (((-1 << v27) & ~*(void *)(v11 + 8 * (v27 >> 6))) != 0)
    {
      unint64_t v14 = __clz(__rbit64((-1 << v27) & ~*(void *)(v11 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_42;
        }
        BOOL v31 = v28 == v30;
        if (v28 == v30) {
          unint64_t v28 = 0;
        }
        v29 |= v31;
        uint64_t v32 = *(void *)(v11 + 8 * v28);
      }
      while (v32 == -1);
      unint64_t v14 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    unint64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
    *unint64_t v15 = v24;
    v15[1] = v23;
    uint64_t result = sub_24CA32F1C(v38, *(void *)(v7 + 56) + 40 * v14);
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v34;
  unint64_t v19 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v19, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v19 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_24CA31688(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_24CA40808();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_24CA33184(*(void *)(a2 + 48) + 40 * v6, (uint64_t)v27);
        uint64_t v9 = sub_24CA40818();
        uint64_t result = sub_24CA33130((uint64_t)v27);
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 >= v8 && v3 >= (uint64_t)v10)
          {
LABEL_16:
            uint64_t v13 = *(void *)(a2 + 48);
            unint64_t v14 = v13 + 40 * v3;
            unint64_t v15 = (long long *)(v13 + 40 * v6);
            if (v3 != v6 || v14 >= (unint64_t)v15 + 40)
            {
              long long v16 = *v15;
              long long v17 = v15[1];
              *(void *)(v14 + 32) = *((void *)v15 + 4);
              *(_OWORD *)unint64_t v14 = v16;
              *(_OWORD *)(v14 + 16) = v17;
            }
            uint64_t v18 = *(void *)(a2 + 56);
            unint64_t v19 = (_OWORD *)(v18 + 16 * v3);
            unint64_t v20 = (_OWORD *)(v18 + 16 * v6);
            if (v3 != v6 || (int64_t v3 = v6, v19 >= v20 + 1))
            {
              *unint64_t v19 = *v20;
              int64_t v3 = v6;
            }
          }
        }
        else if (v10 >= v8 || v3 >= (uint64_t)v10)
        {
          goto LABEL_16;
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    int64_t v21 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v22 = *v21;
    uint64_t v23 = (-1 << v3) - 1;
  }
  else
  {
    int64_t v21 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v23 = *v21;
    uint64_t v22 = (-1 << result) - 1;
  }
  *int64_t v21 = v23 & v22;
  uint64_t v24 = *(void *)(a2 + 16);
  BOOL v25 = __OFSUB__(v24, 1);
  uint64_t v26 = v24 - 1;
  if (v25)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v26;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_24CA31854(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_24CA40808();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_24CA40998();
        swift_bridgeObjectRetain();
        sub_24CA40698();
        uint64_t v11 = sub_24CA409A8();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v12 = v11 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v12 < v8) {
            goto LABEL_5;
          }
        }
        else if (v12 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v12)
        {
LABEL_11:
          uint64_t v13 = *(void *)(a2 + 48);
          unint64_t v14 = (_OWORD *)(v13 + 16 * v3);
          unint64_t v15 = (_OWORD *)(v13 + 16 * v6);
          if (v3 != v6 || v14 >= v15 + 1) {
            _OWORD *v14 = *v15;
          }
          uint64_t v16 = *(void *)(a2 + 56);
          unint64_t v17 = v16 + 40 * v3;
          uint64_t v18 = (long long *)(v16 + 40 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v17 >= (unint64_t)v18 + 40))
          {
            long long v9 = *v18;
            long long v10 = v18[1];
            *(void *)(v17 + 32) = *((void *)v18 + 4);
            *(_OWORD *)unint64_t v17 = v9;
            *(_OWORD *)(v17 + 16) = v10;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v19 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v20 = *v19;
    uint64_t v21 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v19 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v21 = *v19;
    uint64_t v20 = (-1 << result) - 1;
  }
  *unint64_t v19 = v21 & v20;
  uint64_t v22 = *(void *)(a2 + 16);
  BOOL v23 = __OFSUB__(v22, 1);
  uint64_t v24 = v22 - 1;
  if (v23)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v24;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_24CA31A40(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  long long v10 = (void *)*v4;
  unint64_t v12 = sub_24CA30F90(a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 >= v15 && (a4 & 1) != 0)
  {
LABEL_7:
    uint64_t v18 = *v5;
    if (v16)
    {
LABEL_8:
      unint64_t v19 = (uint64_t *)(v18[7] + 16 * v12);
      unint64_t result = swift_release();
      *unint64_t v19 = a1;
      v19[1] = a2;
      return result;
    }
    goto LABEL_11;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_24CA31F78();
    goto LABEL_7;
  }
  sub_24CA3104C(v15, a4 & 1);
  unint64_t v21 = sub_24CA30F90(a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_14:
    unint64_t result = sub_24CA40988();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  uint64_t v18 = *v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  sub_24CA33184(a3, (uint64_t)v23);
  return sub_24CA31CC0(v12, (uint64_t)v23, a1, a2, v18);
}

uint64_t sub_24CA31B68(long long *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  long long v10 = (void *)*v4;
  unint64_t v12 = sub_24CA30FD4(a2, a3);
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
      sub_24CA32158();
      goto LABEL_7;
    }
    sub_24CA31360(v15, a4 & 1);
    unint64_t v21 = sub_24CA30FD4(a2, a3);
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
    uint64_t result = sub_24CA40988();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = v18[7] + 40 * v12;
    __swift_destroy_boxed_opaque_existential_1(v19);
    return sub_24CA32F1C(a1, v19);
  }
LABEL_13:
  sub_24CA31D1C(v12, a2, a3, a1, v18);

  return swift_bridgeObjectRetain();
}

unint64_t sub_24CA31CC0(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(result >> 6) + 8] |= 1 << result;
  uint64_t v5 = a5[6] + 40 * result;
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)uint64_t v5 = *(_OWORD *)a2;
  *(_OWORD *)(v5 + 16) = v6;
  *(void *)(v5 + 32) = *(void *)(a2 + 32);
  uint64_t v7 = (void *)(a5[7] + 16 * result);
  void *v7 = a3;
  v7[1] = a4;
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

uint64_t sub_24CA31D1C(unint64_t a1, uint64_t a2, uint64_t a3, long long *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  long long v6 = (void *)(a5[6] + 16 * a1);
  *long long v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_24CA32F1C(a4, a5[7] + 40 * a1);
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

unint64_t sub_24CA31D8C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_24CA33184(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x253305300](v9, a1);
      sub_24CA33130((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_24CA31E54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_24CA40978() & 1) == 0)
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
      while (!v14 && (sub_24CA40978() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_24CA31F38()
{
  return sub_24CA2EB98(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_24CA31F5C()
{
  return sub_24CA2E2AC(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

void *sub_24CA31F78()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269806768);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24CA40908();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *unint64_t v1 = v4;
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    sub_24CA33184(*(void *)(v2 + 48) + 40 * v15, (uint64_t)v23);
    long long v16 = *(_OWORD *)(*(void *)(v2 + 56) + 16 * v15);
    uint64_t v17 = *(void *)(v4 + 48) + 40 * v15;
    long long v18 = v23[0];
    long long v19 = v23[1];
    *(void *)(v17 + 32) = v24;
    *(_OWORD *)uint64_t v17 = v18;
    *(_OWORD *)(v17 + 16) = v19;
    *(_OWORD *)(*(void *)(v4 + 56) + 16 * v15) = v16;
    uint64_t result = (void *)swift_retain();
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v13) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_24CA32158()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269806758);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24CA40908();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    *unint64_t v1 = v4;
    return result;
  }
  BOOL v25 = v1;
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
    uint64_t v20 = 40 * v15;
    sub_24CA2181C(*(void *)(v2 + 56) + 40 * v15, (uint64_t)v26);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = v19;
    v21[1] = v18;
    sub_24CA32F1C(v26, *(void *)(v4 + 56) + v20);
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    unint64_t v1 = v25;
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

uint64_t sub_24CA32344(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  int isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  if (v4 <= v5) {
    int64_t v14 = v4 + v2;
  }
  else {
    int64_t v14 = v4;
  }
  uint64_t v3 = sub_24CA30B74(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v9 = (unint64_t)&v3[5 * v8 + 4];
  if (a1 + 32 < v9 + 40 * v2 && v9 < a1 + 32 + 40 * v2) {
    goto LABEL_24;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269806730);
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
  uint64_t v11 = v3[2];
  BOOL v12 = __OFADD__(v11, v2);
  uint64_t v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_24CA40938();
  __break(1u);
  return result;
}

uint64_t sub_24CA324B8(uint64_t a1, uint64_t a2)
{
  sub_24CA40768();
  swift_retain();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CA33054(&qword_2698063B8, (void (*)(uint64_t))type metadata accessor for DefaultAppsSettingsGroup);
  sub_24CA40228();
  swift_release();
  *(void *)&long long v10 = a2;
  swift_getKeyPath();
  sub_24CA40248();
  swift_release();
  int64_t v4 = (void **)(a2 + OBJC_IVAR____TtC21DefaultAppsSettingsUI24DefaultAppsSettingsGroup__providers);
  swift_beginAccess();
  int64_t v5 = *v4;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *int64_t v4 = v5;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    int64_t v5 = sub_24CA30B74(0, v5[2] + 1, 1, v5);
    *int64_t v4 = v5;
  }
  unint64_t v8 = v5[2];
  unint64_t v7 = v5[3];
  if (v8 >= v7 >> 1)
  {
    int64_t v5 = sub_24CA30B74((void *)(v7 > 1), v8 + 1, 1, v5);
    *int64_t v4 = v5;
  }
  uint64_t v11 = type metadata accessor for DefaultContactlessPaymentSettingsProvider();
  uint64_t v12 = sub_24CA33054(&qword_269806738, (void (*)(uint64_t))type metadata accessor for DefaultContactlessPaymentSettingsProvider);
  *(void *)&long long v10 = a1;
  v5[2] = v8 + 1;
  sub_24CA32F1C(&v10, (uint64_t)&v5[5 * v8 + 4]);
  swift_endAccess();
  *(void *)&long long v10 = a2;
  swift_getKeyPath();
  swift_retain();
  sub_24CA40238();
  swift_release();
  swift_release();
  sub_24CA2118C();
  swift_release();
  return swift_release();
}

uint64_t sub_24CA327A0(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v13 = a4;
  uint64_t v14 = a5;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v12);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a4 - 8) + 32))(boxed_opaque_existential_0, a2, a4);
  uint64_t v10 = *a3;
  *(void *)(v10 + 16) = a1 + 1;
  return sub_24CA32F1C(&v12, v10 + 40 * a1 + 32);
}

uint64_t sub_24CA32838(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 40 * a1 + 32;
    unint64_t v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_269806730);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_24CA40938();
  __break(1u);
  return result;
}

char *sub_24CA32948(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = (char *)(a4 + 8 * a1 + 32);
    size_t v6 = 8 * v4;
    unint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_24CA40938();
  __break(1u);
  return result;
}

void *sub_24CA32A34(char a1, char a2)
{
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (a2)
  {
    uint64_t v4 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_29;
  }
  if ((a1 & 2) == 0)
  {
    uint64_t v4 = (void *)MEMORY[0x263F8EE78];
    if ((a1 & 4) == 0) {
      goto LABEL_16;
    }
    goto LABEL_11;
  }
  uint64_t v4 = sub_24CA30C98(0, 1, 1, MEMORY[0x263F8EE78]);
  unint64_t v6 = v4[2];
  unint64_t v5 = v4[3];
  if (v6 >= v5 >> 1) {
    uint64_t v4 = sub_24CA30C98((void *)(v5 > 1), v6 + 1, 1, v4);
  }
  v4[2] = v6 + 1;
  v4[v6 + 4] = 1;
  if ((a1 & 4) != 0)
  {
LABEL_11:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v4 = sub_24CA30C98(0, v4[2] + 1, 1, v4);
    }
    unint64_t v8 = v4[2];
    unint64_t v7 = v4[3];
    if (v8 >= v7 >> 1) {
      uint64_t v4 = sub_24CA30C98((void *)(v7 > 1), v8 + 1, 1, v4);
    }
    v4[2] = v8 + 1;
    v4[v8 + 4] = 2;
  }
LABEL_16:
  if ((a1 & 8) == 0)
  {
    if ((a1 & 0x10) == 0) {
      goto LABEL_29;
    }
    goto LABEL_24;
  }
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v4 = sub_24CA30C98(0, v4[2] + 1, 1, v4);
  }
  unint64_t v10 = v4[2];
  unint64_t v9 = v4[3];
  if (v10 >= v9 >> 1) {
    uint64_t v4 = sub_24CA30C98((void *)(v9 > 1), v10 + 1, 1, v4);
  }
  v4[2] = v10 + 1;
  v4[v10 + 4] = 3;
  if ((a1 & 0x10) != 0)
  {
LABEL_24:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v4 = sub_24CA30C98(0, v4[2] + 1, 1, v4);
    }
    unint64_t v12 = v4[2];
    unint64_t v11 = v4[3];
    if (v12 >= v11 >> 1) {
      uint64_t v4 = sub_24CA30C98((void *)(v11 > 1), v12 + 1, 1, v4);
    }
    v4[2] = v12 + 1;
    v4[v12 + 4] = 4;
  }
LABEL_29:
  swift_release();
  return v4;
}

void *sub_24CA32CA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v20 = a3;
  uint64_t v21 = a4;
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t result = (void *)MEMORY[0x263F8EE78];
  uint64_t v26 = (void *)MEMORY[0x263F8EE78];
  if (v6)
  {
    uint64_t v9 = a1 + 32;
    v19[1] = a1;
    swift_bridgeObjectRetain();
    do
    {
      sub_24CA304CC(v9, a2, v20, v21, (uint64_t)&v22);
      if (v4)
      {
        swift_bridgeObjectRelease();
        return (void *)swift_bridgeObjectRelease();
      }
      if (v23)
      {
        sub_24CA32F1C(&v22, (uint64_t)v25);
        sub_24CA32F1C(v25, (uint64_t)&v22);
        unint64_t v10 = v26;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          unint64_t v10 = sub_24CA30B74(0, v10[2] + 1, 1, v10);
          uint64_t v26 = v10;
        }
        unint64_t v12 = v10[2];
        unint64_t v11 = v10[3];
        if (v12 >= v11 >> 1) {
          uint64_t v26 = sub_24CA30B74((void *)(v11 > 1), v12 + 1, 1, v10);
        }
        uint64_t v13 = v23;
        uint64_t v14 = v24;
        uint64_t v15 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v22, v23);
        MEMORY[0x270FA5388](v15);
        uint64_t v17 = (char *)v19 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *))(v18 + 16))(v17);
        sub_24CA327A0(v12, (uint64_t)v17, (uint64_t *)&v26, v13, v14);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
      }
      else
      {
        sub_24CA32EBC((uint64_t)&v22);
      }
      v9 += 40;
      --v6;
    }
    while (v6);
    swift_bridgeObjectRelease();
    return v26;
  }
  return result;
}

uint64_t sub_24CA32EBC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269806720);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24CA32F1C(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_24CA32F84(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269806720);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CA32FEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269806720);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CA33054(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24CA3309C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24CA2E5D4();
  *a1 = result;
  return result;
}

uint64_t sub_24CA330C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, (uint64_t (*)(uint64_t))sub_24CA2E6F8);
}

uint64_t keypath_setTm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t))
{
  uint64_t v6 = swift_bridgeObjectRetain();
  return a5(v6);
}

uint64_t sub_24CA33114()
{
  return sub_24CA2E858(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_24CA33130(uint64_t a1)
{
  return a1;
}

uint64_t sub_24CA33184(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_24CA331E0()
{
  return sub_24CA31F5C();
}

uint64_t sub_24CA331F8()
{
  return sub_24CA31F38();
}

uint64_t sub_24CA33210()
{
  uint64_t v0 = sub_24CA40308();
  __swift_allocate_value_buffer(v0, qword_269807568);
  __swift_project_value_buffer(v0, (uint64_t)qword_269807568);
  return sub_24CA402F8();
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

id sub_24CA332E0()
{
  type metadata accessor for DefaultAppsSettingsModel();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  qword_269807580 = (uint64_t)result;
  return result;
}

uint64_t DefaultContactlessPaymentSettingsProvider.__allocating_init(for:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  DefaultContactlessPaymentSettingsProvider.init(for:)(a1, a2);
  return v4;
}

uint64_t DefaultContactlessPaymentSettingsProvider.id.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DefaultContactlessPaymentSettingsProvider.available.getter()
{
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CA3A278(&qword_269806780, (void (*)(uint64_t))type metadata accessor for DefaultContactlessPaymentSettingsProvider);
  sub_24CA40228();
  swift_release();
  uint64_t v1 = *(unsigned __int8 *)(v0 + 32);
  swift_release();
  return v1;
}

uint64_t sub_24CA334C0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = DefaultContactlessPaymentSettingsProvider.available.getter();
  *a1 = result & 1;
  return result;
}

uint64_t sub_24CA334F0()
{
  return sub_24CA33518();
}

uint64_t sub_24CA33518()
{
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_24CA3A278(&qword_269806780, (void (*)(uint64_t))type metadata accessor for DefaultContactlessPaymentSettingsProvider);
  sub_24CA40218();
  swift_release();
  return swift_release();
}

uint64_t sub_24CA33678(uint64_t a1, char a2)
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  *(unsigned char *)(a1 + 32) = a2 & 1;
  return swift_release();
}

uint64_t DefaultContactlessPaymentSettingsProvider.localizedTitle.getter()
{
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = *(void *)(v0 + 40);
  swift_bridgeObjectRetain();
  swift_release();
  return v1;
}

uint64_t DefaultContactlessPaymentSettingsProvider.localizedDetail.getter()
{
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CA3A278(&qword_269806780, (void (*)(uint64_t))type metadata accessor for DefaultContactlessPaymentSettingsProvider);
  sub_24CA40228();
  swift_release();
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 56);
  swift_bridgeObjectRetain();
  swift_release();
  return v1;
}

uint64_t sub_24CA338E0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = DefaultContactlessPaymentSettingsProvider.localizedDetail.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_24CA3390C()
{
  return DefaultContactlessPaymentSettingsProvider.localizedDetail.setter();
}

uint64_t DefaultContactlessPaymentSettingsProvider.localizedDetail.setter()
{
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_24CA3A278(&qword_269806780, (void (*)(uint64_t))type metadata accessor for DefaultContactlessPaymentSettingsProvider);
  sub_24CA40218();
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24CA33ABC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_beginAccess();
  *(void *)(a1 + 56) = a2;
  *(void *)(a1 + 64) = a3;
  swift_bridgeObjectRetain();
  swift_release();
  return swift_bridgeObjectRelease();
}

void (*DefaultContactlessPaymentSettingsProvider.localizedDetail.modify(void *a1))(void **a1)
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  v3[3] = v1;
  sub_24CA40768();
  v3[4] = sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  v3[5] = OBJC_IVAR____TtC21DefaultAppsSettingsUI41DefaultContactlessPaymentSettingsProvider___observationRegistrar;
  *uint64_t v3 = v1;
  v3[6] = sub_24CA3A278(&qword_269806780, (void (*)(uint64_t))type metadata accessor for DefaultContactlessPaymentSettingsProvider);
  sub_24CA40228();
  swift_release();
  *uint64_t v3 = v1;
  swift_getKeyPath();
  sub_24CA40248();
  swift_release();
  swift_beginAccess();
  return sub_24CA33D1C;
}

void sub_24CA33D1C(void **a1)
{
  uint64_t v1 = *a1;
  swift_endAccess();
  *uint64_t v1 = v1[3];
  swift_getKeyPath();
  sub_24CA40238();
  swift_release();
  swift_release();

  free(v1);
}

uint64_t DefaultContactlessPaymentSettingsProvider.localizedNavigationTitle.getter()
{
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = *(void *)(v0 + 72);
  swift_bridgeObjectRetain();
  swift_release();
  return v1;
}

uint64_t sub_24CA33E44()
{
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CA3A278(&qword_269806780, (void (*)(uint64_t))type metadata accessor for DefaultContactlessPaymentSettingsProvider);
  sub_24CA40228();
  swift_release();
  uint64_t v1 = *(void *)(v0 + 88);
  swift_bridgeObjectRetain();
  swift_release();
  return v1;
}

uint64_t sub_24CA33F58()
{
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_24CA3A278(&qword_269806780, (void (*)(uint64_t))type metadata accessor for DefaultContactlessPaymentSettingsProvider);
  sub_24CA40218();
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24CA340C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  *(void *)(a1 + 88) = a2;
  *(void *)(a1 + 96) = a3;
  swift_bridgeObjectRetain();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24CA34188()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24CA40208();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v3 = sub_24CA40648();
  MEMORY[0x270FA5388](v3 - 8);
  sub_24CA40768();
  v15[0] = sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  uint64_t v16 = v0;
  sub_24CA3A278(&qword_269806780, (void (*)(uint64_t))type metadata accessor for DefaultContactlessPaymentSettingsProvider);
  sub_24CA40228();
  swift_release();
  uint64_t v4 = *(void *)(v0 + 112);
  swift_retain();
  swift_release();
  swift_getKeyPath();
  uint64_t v16 = v4;
  sub_24CA3A278(&qword_269806358, (void (*)(uint64_t))type metadata accessor for AppRecord);
  sub_24CA40228();
  swift_release();
  uint64_t v5 = *(void *)(v4 + 32);
  unint64_t v6 = *(void *)(v4 + 40);
  swift_release();
  uint64_t v7 = HIBYTE(v6) & 0xF;
  if ((v6 & 0x2000000000000000) == 0) {
    uint64_t v7 = v5 & 0xFFFFFFFFFFFFLL;
  }
  if (v7)
  {
    sub_24CA40758();
    sub_24CA40718();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_getKeyPath();
    uint64_t v16 = v1;
    sub_24CA40228();
    swift_release();
    uint64_t v8 = *(void *)(v1 + 112);
    swift_retain();
    swift_release();
    swift_getKeyPath();
    uint64_t v16 = v8;
    sub_24CA40228();
    swift_release();
    uint64_t v10 = *(void *)(v8 + 32);
    uint64_t v9 = *(void *)(v8 + 40);
    swift_bridgeObjectRetain();
    swift_release();
  }
  else
  {
    sub_24CA405E8();
    if (qword_269806338 != -1) {
      swift_once();
    }
    id v11 = (id)qword_269807580;
    sub_24CA401F8();
    uint64_t v10 = sub_24CA40678();
    uint64_t v9 = v12;
  }
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  v15[-4] = v1;
  v15[-3] = v10;
  v15[-2] = v9;
  uint64_t v16 = v1;
  sub_24CA40218();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  sub_24CA34790();
  return swift_release();
}

uint64_t sub_24CA34680()
{
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CA3A278(&qword_269806780, (void (*)(uint64_t))type metadata accessor for DefaultContactlessPaymentSettingsProvider);
  sub_24CA40228();
  swift_release();
  uint64_t v1 = *(void *)(v0 + 112);
  swift_retain();
  swift_release();
  return v1;
}

uint64_t sub_24CA34790()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24CA40208();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v3 = sub_24CA40648();
  MEMORY[0x270FA5388](v3 - 8);
  sub_24CA40768();
  v14[1] = sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  uint64_t v15 = v0;
  sub_24CA3A278(&qword_269806780, (void (*)(uint64_t))type metadata accessor for DefaultContactlessPaymentSettingsProvider);
  sub_24CA40228();
  swift_release();
  uint64_t v4 = *(void *)(v0 + 112);
  swift_retain();
  swift_release();
  swift_getKeyPath();
  uint64_t v15 = v4;
  sub_24CA3A278(&qword_269806358, (void (*)(uint64_t))type metadata accessor for AppRecord);
  sub_24CA40228();
  swift_release();
  uint64_t v5 = *(void *)(v4 + 64);
  swift_release();
  if (v5) {
    goto LABEL_13;
  }
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  uint64_t v15 = v1;
  sub_24CA40228();
  swift_release();
  unint64_t v6 = *(void *)(v1 + 120);
  swift_bridgeObjectRetain();
  swift_release();
  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_24CA408F8();
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_release();
  }
  swift_bridgeObjectRelease();
  if (v7)
  {
LABEL_13:
    sub_24CA405E8();
    if (qword_269806338 == -1) {
      goto LABEL_14;
    }
    goto LABEL_19;
  }
  sub_24CA405E8();
  if (qword_269806338 != -1) {
LABEL_19:
  }
    swift_once();
LABEL_14:
  id v8 = (id)qword_269807580;
  sub_24CA401F8();
  uint64_t v9 = sub_24CA40678();
  uint64_t v11 = v10;
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  v14[-4] = v1;
  v14[-3] = v9;
  v14[-2] = v11;
  uint64_t v15 = v1;
  sub_24CA40218();
  swift_release();
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24CA34D5C()
{
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_24CA3A278(&qword_269806780, (void (*)(uint64_t))type metadata accessor for DefaultContactlessPaymentSettingsProvider);
  sub_24CA40218();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_24CA34EBC(uint64_t a1, uint64_t a2)
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_retain();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  *(void *)(a1 + 112) = a2;
  swift_retain();
  swift_release();
  sub_24CA34188();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_24CA34FF0()
{
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CA3A278(&qword_269806780, (void (*)(uint64_t))type metadata accessor for DefaultContactlessPaymentSettingsProvider);
  sub_24CA40228();
  swift_release();
  uint64_t v1 = *(void *)(v0 + 120);
  swift_bridgeObjectRetain();
  swift_release();
  return v1;
}

uint64_t sub_24CA35100()
{
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_24CA3A278(&qword_269806780, (void (*)(uint64_t))type metadata accessor for DefaultContactlessPaymentSettingsProvider);
  sub_24CA40218();
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24CA35260(uint64_t a1, uint64_t a2)
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  *(void *)(a1 + 120) = a2;
  swift_bridgeObjectRetain();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24CA35314()
{
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CA3A278(&qword_269806780, (void (*)(uint64_t))type metadata accessor for DefaultContactlessPaymentSettingsProvider);
  sub_24CA40228();
  swift_release();
  uint64_t v1 = *(void *)(v0 + 128);
  swift_bridgeObjectRetain();
  swift_release();
  return v1;
}

uint64_t sub_24CA35428()
{
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_24CA3A278(&qword_269806780, (void (*)(uint64_t))type metadata accessor for DefaultContactlessPaymentSettingsProvider);
  sub_24CA40218();
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24CA35598(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  *(void *)(a1 + 128) = a2;
  *(void *)(a1 + 136) = a3;
  swift_bridgeObjectRetain();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t DefaultContactlessPaymentSettingsProvider.init(for:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = sub_24CA40208();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_24CA40648();
  MEMORY[0x270FA5388](v6 - 8);
  *(void *)(v2 + 16) = 0xD00000000000002CLL;
  *(void *)(v2 + 24) = 0x800000024CA42DD0;
  *(unsigned char *)(v2 + 32) = 0;
  sub_24CA405E8();
  if (qword_269806338 != -1) {
    swift_once();
  }
  id v7 = (id)qword_269807580;
  sub_24CA401F8();
  *(void *)(v2 + 40) = sub_24CA40678();
  *(void *)(v2 + 48) = v8;
  *(void *)(v2 + 56) = 0;
  *(void *)(v2 + 64) = 0;
  sub_24CA405E8();
  id v9 = v7;
  sub_24CA401F8();
  *(void *)(v2 + 72) = sub_24CA40678();
  *(void *)(v2 + 80) = v10;
  type metadata accessor for AppRecord();
  *(void *)(v2 + 96) = 0;
  *(void *)(v2 + 104) = 0;
  *(void *)(v2 + 88) = 0;
  swift_allocObject();
  uint64_t v11 = sub_24CA1F388(0);
  uint64_t v12 = MEMORY[0x263F8EE78];
  *(void *)(v2 + 112) = v11;
  *(void *)(v2 + 120) = v12;
  *(void *)(v2 + 128) = 0;
  *(void *)(v2 + 136) = 0;
  sub_24CA40258();
  uint64_t v13 = swift_allocObject();
  swift_weakInit();
  swift_retain();
  if (a2)
  {
    uint64_t v14 = (void *)sub_24CA40658();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v14 = 0;
  }
  aBlock[4] = sub_24CA35CE4;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24CA36880;
  aBlock[3] = &block_descriptor_0;
  uint64_t v15 = _Block_copy(aBlock);
  id v16 = objc_msgSend(self, sel_contextWithBundleId_onChange_, v14, v15);

  _Block_release(v15);
  swift_release();
  swift_release();
  uint64_t v17 = *(void **)(v3 + 104);
  *(void *)(v3 + 104) = v16;

  sub_24CA35E9C();
  sub_24CA360CC();
  sub_24CA36664();
  sub_24CA34790();
  uint64_t v18 = swift_allocObject();
  swift_weakInit();
  swift_retain();
  swift_retain();
  sub_24CA3ADAC(v3, (uint64_t)sub_24CA36A08, v18);
  swift_release();
  swift_release_n();
  return v3;
}

uint64_t sub_24CA35A1C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = DefaultContactlessPaymentSettingsProvider.available.getter();
  *a1 = result & 1;
  return result;
}

uint64_t sub_24CA35A4C()
{
  return sub_24CA33518();
}

uint64_t type metadata accessor for DefaultContactlessPaymentSettingsProvider()
{
  uint64_t result = qword_2698067E0;
  if (!qword_2698067E0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24CA35AC0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = DefaultContactlessPaymentSettingsProvider.localizedDetail.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_24CA35AEC(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_3Tm(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t))DefaultContactlessPaymentSettingsProvider.localizedDetail.setter);
}

uint64_t sub_24CA35B04()
{
  return sub_24CA33ABC(v0[2], v0[3], v0[4]);
}

uint64_t sub_24CA35B24()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24CA35B5C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698065A0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CA40768();
  sub_24CA40758();
  uint64_t v5 = MEMORY[0x263F8F500];
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v6 = sub_24CA40788();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v4, 1, 1, v6);
  swift_retain();
  uint64_t v7 = sub_24CA40758();
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = v7;
  v8[3] = v5;
  void v8[4] = a1;
  sub_24CA282D4((uint64_t)v4, (uint64_t)&unk_269806868, (uint64_t)v8);
  swift_release();
  return swift_release();
}

uint64_t sub_24CA35CE4()
{
  return sub_24CA35B5C(v0);
}

uint64_t sub_24CA35CEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 88) = a4;
  sub_24CA40768();
  *(void *)(v4 + 96) = sub_24CA40758();
  uint64_t v6 = sub_24CA40718();
  return MEMORY[0x270FA2498](sub_24CA35D84, v6, v5);
}

uint64_t sub_24CA35D84()
{
  swift_release();
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    sub_24CA35E9C();
    swift_release();
  }
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    sub_24CA360CC();
    swift_release();
  }
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    sub_24CA36664();
    swift_release();
  }
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24CA35E9C()
{
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = *(void **)(v0 + 104);
  if (v1)
  {
    objc_msgSend(v1, sel_shouldShowDefaultNFCAppPicker);
  }
  else
  {
    sub_24CA40758();
    sub_24CA40718();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_release();
  }
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_24CA3A278(&qword_269806780, (void (*)(uint64_t))type metadata accessor for DefaultContactlessPaymentSettingsProvider);
  sub_24CA40218();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_24CA360CC()
{
  uint64_t v1 = v0;
  uint64_t v33 = sub_24CA401E8();
  uint64_t v2 = *(void *)(v33 - 8);
  MEMORY[0x270FA5388](v33);
  uint64_t v32 = (char *)v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_24CA40768();
  uint64_t v5 = sub_24CA40758();
  uint64_t v34 = v4;
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v6 = *(void **)(v0 + 104);
  uint64_t v7 = MEMORY[0x263F8EE60];
  if (!v6)
  {
    sub_24CA40758();
    sub_24CA40718();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_release();
    goto LABEL_20;
  }
  id v8 = objc_msgSend(v6, sel_defaultAppCandidates);
  sub_24CA3A3FC();
  unint64_t v9 = sub_24CA406C8();

  if (v9 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_24CA408F8();
    swift_bridgeObjectRelease();
    if (v10) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
  uint64_t v10 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v10)
  {
LABEL_19:
    swift_bridgeObjectRelease();
LABEL_20:
    uint64_t v23 = MEMORY[0x263F8EE78];
    goto LABEL_21;
  }
LABEL_6:
  uint64_t v36 = MEMORY[0x263F8EE78];
  uint64_t result = sub_24CA408A8();
  if (v10 < 0)
  {
    __break(1u);
    return result;
  }
  v25[1] = v5;
  uint64_t v26 = v1;
  uint64_t v12 = v7;
  uint64_t v13 = 0;
  unint64_t v28 = (void (**)(char *, uint64_t))(v2 + 8);
  unint64_t v29 = v9 & 0xC000000000000001;
  uint64_t v27 = v12 + 8;
  uint64_t v30 = v10;
  unint64_t v31 = v9;
  do
  {
    if (v29) {
      id v21 = (id)MEMORY[0x253305330](v13, v9);
    }
    else {
      id v21 = *(id *)(v9 + 8 * v13 + 32);
    }
    long long v22 = v21;
    sub_24CA40758();
    sub_24CA40718();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    ++v13;
    type metadata accessor for AppRecord();
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = 0;
    *(void *)(v14 + 24) = 0;
    *(void *)(v14 + 32) = 0;
    *(void *)(v14 + 40) = 0xE000000000000000;
    id v15 = v22;
    id v16 = v32;
    sub_24CA401D8();
    uint64_t v17 = sub_24CA401B8();
    uint64_t v19 = v18;
    (*v28)(v16, v33);
    *(void *)(v14 + 48) = v17;
    *(void *)(v14 + 56) = v19;
    *(void *)(v14 + 64) = 0;
    *(void *)(v14 + 72) = 0;
    *(unsigned char *)(v14 + 80) = 3;
    sub_24CA40258();
    uint64_t KeyPath = swift_getKeyPath();
    MEMORY[0x270FA5388](KeyPath);
    v25[-2] = v14;
    v25[-1] = v22;
    uint64_t v35 = v14;
    sub_24CA3A278(&qword_269806358, (void (*)(uint64_t))type metadata accessor for AppRecord);
    sub_24CA40218();
    swift_release();
    swift_release();

    sub_24CA40888();
    sub_24CA408B8();
    sub_24CA408C8();
    sub_24CA40898();
    unint64_t v9 = v31;
  }
  while (v30 != v13);
  uint64_t v23 = v36;
  swift_bridgeObjectRelease();
  uint64_t v1 = v26;
LABEL_21:
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v24 = swift_getKeyPath();
  MEMORY[0x270FA5388](v24);
  v25[-2] = v1;
  v25[-1] = v23;
  uint64_t v36 = v1;
  sub_24CA3A278(&qword_269806780, (void (*)(uint64_t))type metadata accessor for DefaultContactlessPaymentSettingsProvider);
  sub_24CA40218();
  swift_release();
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24CA36664()
{
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = *(void **)(v0 + 104);
  if (v1) {
    id v2 = objc_msgSend(v1, sel_getDefaultNFCApplication);
  }
  else {
    id v2 = 0;
  }
  type metadata accessor for AppRecord();
  swift_allocObject();
  id v3 = v2;
  sub_24CA1F9B8(v2);
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_24CA3A278(&qword_269806780, (void (*)(uint64_t))type metadata accessor for DefaultContactlessPaymentSettingsProvider);
  sub_24CA40218();
  swift_release();

  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_24CA36880(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t sub_24CA368DC()
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    sub_24CA35E9C();
    swift_release();
  }
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    sub_24CA360CC();
    swift_release();
  }
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    sub_24CA36664();
    swift_release();
  }
  return swift_release();
}

uint64_t sub_24CA36A08()
{
  return sub_24CA368DC();
}

uint64_t DefaultContactlessPaymentSettingsProvider.deinit()
{
  uint64_t v1 = *(void **)(v0 + 104);
  if (v1)
  {
    objc_msgSend(v1, sel_invalidate);
    uint64_t v2 = *(void **)(v0 + 104);
  }
  else
  {
    uint64_t v2 = 0;
  }
  *(void *)(v0 + 104) = 0;

  sub_24CA3AC58(v0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = v0 + OBJC_IVAR____TtC21DefaultAppsSettingsUI41DefaultContactlessPaymentSettingsProvider___observationRegistrar;
  uint64_t v4 = sub_24CA40268();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  return v0;
}

uint64_t DefaultContactlessPaymentSettingsProvider.__deallocating_deinit()
{
  DefaultContactlessPaymentSettingsProvider.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t DefaultContactlessPaymentSettingsProvider.content.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v33 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269806788);
  uint64_t v31 = *(void *)(v3 - 8);
  uint64_t v32 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269806790);
  uint64_t v29 = *(void *)(v6 - 8);
  uint64_t v30 = v6;
  MEMORY[0x270FA5388](v6);
  unint64_t v28 = (char *)v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CA40768();
  uint64_t v8 = sub_24CA40758();
  uint64_t v9 = MEMORY[0x263F8F500];
  uint64_t v27 = v8;
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269806798);
  sub_24CA39BE8();
  sub_24CA403D8();
  sub_24CA403B8();
  uint64_t v26 = v5;
  if (qword_269806338 != -1) {
    swift_once();
  }
  id v10 = (id)qword_269807580;
  uint64_t v11 = sub_24CA403E8();
  uint64_t v13 = v12;
  v25[1] = v14;
  char v16 = v15 & 1;
  swift_retain();
  uint64_t v17 = sub_24CA40758();
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = v17;
  v18[3] = v9;
  v18[4] = v2;
  swift_retain();
  uint64_t v19 = sub_24CA40758();
  uint64_t v20 = (void *)swift_allocObject();
  void v20[2] = v19;
  v20[3] = v9;
  v20[4] = v2;
  sub_24CA40568();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698067C0);
  sub_24CA2DF30(&qword_2698067C8, &qword_269806788);
  sub_24CA2DF30(&qword_2698067D0, &qword_2698067C0);
  uint64_t v21 = v32;
  long long v22 = v28;
  uint64_t v23 = v26;
  sub_24CA404B8();
  swift_release();
  swift_release();
  sub_24CA39D54(v11, v13, v16);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v31 + 8))(v23, v21);
  (*(void (**)(uint64_t, char *, uint64_t))(v29 + 32))(v33, v22, v30);
  return swift_release();
}

uint64_t sub_24CA36FD8(uint64_t a1)
{
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CA389FC(a1, v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269806808);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698064A8);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2698067A8);
  sub_24CA40398();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2698067B0);
  sub_24CA2DF30(&qword_2698067B8, &qword_2698067B0);
  swift_getOpaqueTypeConformance2();
  swift_getOpaqueTypeConformance2();
  sub_24CA2AEB4();
  sub_24CA405C8();
  return swift_release();
}

uint64_t sub_24CA37194@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v37 = a2;
  uint64_t v3 = sub_24CA40398();
  uint64_t v35 = *(void *)(v3 - 8);
  uint64_t v36 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v34 = (char *)v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698067B0);
  uint64_t v29 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698067A8);
  uint64_t v32 = *(void *)(v8 - 8);
  uint64_t v33 = v8;
  MEMORY[0x270FA5388](v8);
  id v10 = (char *)v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269806808);
  uint64_t v30 = *(void *)(v11 - 8);
  uint64_t v31 = v11;
  MEMORY[0x270FA5388](v11);
  unint64_t v28 = (char *)v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CA40768();
  uint64_t v13 = sub_24CA40758();
  uint64_t v14 = MEMORY[0x263F8F500];
  v27[2] = v13;
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v15 = sub_24CA403B8();
  v27[0] = v16;
  v27[1] = v15;
  swift_retain();
  uint64_t v17 = sub_24CA40758();
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = v17;
  v18[3] = v14;
  v18[4] = a1;
  swift_retain();
  uint64_t v19 = sub_24CA40758();
  uint64_t v20 = (void *)swift_allocObject();
  void v20[2] = v19;
  v20[3] = v14;
  v20[4] = a1;
  type metadata accessor for AppRecord();
  sub_24CA40558();
  uint64_t v38 = v40;
  long long v39 = v41;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269806810);
  sub_24CA3A278(&qword_2698064E0, (void (*)(uint64_t))type metadata accessor for AppRecord);
  sub_24CA3A188();
  sub_24CA40528();
  uint64_t v21 = sub_24CA2DF30(&qword_2698067B8, &qword_2698067B0);
  sub_24CA40448();
  (*(void (**)(char *, uint64_t))(v29 + 8))(v7, v5);
  long long v22 = v34;
  sub_24CA40388();
  uint64_t v40 = v5;
  *(void *)&long long v41 = v21;
  swift_getOpaqueTypeConformance2();
  uint64_t v23 = v28;
  uint64_t v24 = v33;
  uint64_t v25 = v36;
  sub_24CA40438();
  (*(void (**)(char *, uint64_t))(v35 + 8))(v22, v25);
  (*(void (**)(char *, uint64_t))(v32 + 8))(v10, v24);
  (*(void (**)(uint64_t, char *, uint64_t))(v30 + 32))(v37, v23, v31);
  return swift_release();
}

uint64_t sub_24CA376A8@<X0>(uint64_t a1@<X2>, void *a2@<X8>)
{
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CA3A278(&qword_269806780, (void (*)(uint64_t))type metadata accessor for DefaultContactlessPaymentSettingsProvider);
  sub_24CA40228();
  swift_release();
  uint64_t v4 = *(void *)(a1 + 112);
  swift_retain();
  swift_release();
  uint64_t result = swift_release();
  *a2 = v4;
  return result;
}

uint64_t sub_24CA37820(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = *a1;
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CA3A278(&qword_269806780, (void (*)(uint64_t))type metadata accessor for DefaultContactlessPaymentSettingsProvider);
  sub_24CA40228();
  swift_release();
  uint64_t v7 = *(void *)(a5 + 112);
  swift_retain();
  swift_release();
  char v8 = _s21DefaultAppsSettingsUI9AppRecordC2eeoiySbAC_ACtFZ_0(v7, v6);
  swift_release();
  if (v8) {
    return swift_release();
  }
  swift_retain();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_24CA40218();
  swift_release();
  swift_release();
  swift_release();
  swift_getKeyPath();
  sub_24CA3A278(&qword_269806358, (void (*)(uint64_t))type metadata accessor for AppRecord);
  sub_24CA40228();
  swift_release();
  if (!*(void *)(v6 + 24)) {
    return swift_release();
  }
  id v10 = *(void **)(a5 + 104);
  if (!v10
    || (id v11 = v10,
        swift_bridgeObjectRetain(),
        uint64_t v12 = (void *)sub_24CA40658(),
        swift_bridgeObjectRelease(),
        id v13 = objc_msgSend(v11, sel_alertMessageForDefaultAppChangeTo_, v12),
        v11,
        v12,
        !v13))
  {
    sub_24CA37C9C(v6);
    return swift_release();
  }
  sub_24CA40668();

  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v14 = swift_getKeyPath();
  MEMORY[0x270FA5388](v14);
  sub_24CA40218();
  swift_release();
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

void sub_24CA37C9C(uint64_t a1)
{
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CA3A278(&qword_269806358, (void (*)(uint64_t))type metadata accessor for AppRecord);
  sub_24CA40228();
  swift_release();
  if (*(void *)(a1 + 24))
  {
    swift_bridgeObjectRetain();
    swift_retain();
    sub_24CA40758();
    sub_24CA40718();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t KeyPath = swift_getKeyPath();
    MEMORY[0x270FA5388](KeyPath);
    sub_24CA3A278(&qword_269806780, (void (*)(uint64_t))type metadata accessor for DefaultContactlessPaymentSettingsProvider);
    sub_24CA40218();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v4 = *(void **)(v1 + 104);
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = (void *)sub_24CA40658();
      swift_bridgeObjectRelease();
      objc_msgSend(v5, sel_setDefaultNFCApplication_, v6);
      swift_release();
    }
    else
    {
      swift_release();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    swift_release();
  }
}

uint64_t sub_24CA37F5C@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  id v13 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269806810);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v13 - v8;
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  uint64_t v14 = a1;
  sub_24CA3A278(&qword_269806780, (void (*)(uint64_t))type metadata accessor for DefaultContactlessPaymentSettingsProvider);
  sub_24CA40228();
  swift_release();
  uint64_t v10 = *(void *)(a1 + 120);
  swift_bridgeObjectRetain();
  swift_release();
  uint64_t v14 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269806500);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269806828);
  type metadata accessor for AppRecord();
  sub_24CA2DF30(&qword_269806508, &qword_269806500);
  sub_24CA2DF30(&qword_269806820, &qword_269806828);
  sub_24CA3A278(&qword_269806510, (void (*)(uint64_t))type metadata accessor for AppRecord);
  sub_24CA40598();
  id v11 = *(void (**)(char *, char *, uint64_t))(v4 + 32);
  v11(v9, v7, v3);
  v11(v13, v9, v3);
  return swift_release();
}

uint64_t sub_24CA382B0(uint64_t *a1)
{
  uint64_t v1 = *a1;
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v7 = v1;
  uint64_t v2 = type metadata accessor for AppRecord();
  swift_retain();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269806830);
  uint64_t v4 = sub_24CA3A278(&qword_2698064E0, (void (*)(uint64_t))type metadata accessor for AppRecord);
  uint64_t v5 = sub_24CA2DF30(&qword_269806838, &qword_269806830);
  MEMORY[0x253304E10](&v7, sub_24CA3A2C0, v1, v2, v3, v4, v5);
  return swift_release();
}

uint64_t sub_24CA38410()
{
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269806840);
  sub_24CA3A2D8();
  sub_24CA404D8();

  return swift_release();
}

uint64_t sub_24CA38514@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CA3A278(&qword_269806358, (void (*)(uint64_t))type metadata accessor for AppRecord);
  sub_24CA40228();
  swift_release();
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  swift_bridgeObjectRetain();
  uint64_t result = swift_release();
  *(void *)a2 = v5;
  *(void *)(a2 + 8) = v4;
  *(unsigned char *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = MEMORY[0x263F8EE78];
  return result;
}

uint64_t sub_24CA38640@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v18[0] = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269806850);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269806540);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269806840);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  v18[1] = a1;
  sub_24CA3A278(&qword_269806358, (void (*)(uint64_t))type metadata accessor for AppRecord);
  sub_24CA40228();
  swift_release();
  if (*(void *)(a1 + 24))
  {
    id v13 = objc_allocWithZone(MEMORY[0x263F4B540]);
    swift_bridgeObjectRetain();
    uint64_t v14 = (void *)sub_24CA40658();
    swift_bridgeObjectRelease();
    objc_msgSend(v13, sel_initWithBundleIdentifier_, v14, v18[0]);

    id v15 = objc_msgSend(self, sel_imageDescriptorNamed_, *MEMORY[0x263F4B5A0]);
  }
  else
  {
    id v16 = objc_msgSend(self, sel_genericApplicationIcon, v18[0]);
  }
  sub_24CA402D8();
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v5, v9, v6);
  swift_storeEnumTagMultiPayload();
  sub_24CA2DF30(&qword_269806538, &qword_269806540);
  sub_24CA403C8();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_24CA3A370((uint64_t)v12, v18[0]);
  return swift_release();
}

uint64_t sub_24CA389FC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CA3A278(&qword_269806780, (void (*)(uint64_t))type metadata accessor for DefaultContactlessPaymentSettingsProvider);
  sub_24CA40228();
  swift_release();
  uint64_t v4 = *(void *)(a1 + 96);
  swift_bridgeObjectRetain();
  swift_release();
  if (v4)
  {
    sub_24CA2CDA4();
    uint64_t v4 = sub_24CA403F8();
    uint64_t v6 = v5;
    char v8 = v7;
    uint64_t v10 = v9;
    uint64_t result = swift_release();
    uint64_t v12 = v8 & 1;
  }
  else
  {
    uint64_t result = swift_release();
    uint64_t v6 = 0;
    uint64_t v12 = 0;
    uint64_t v10 = 0;
  }
  *a2 = v4;
  a2[1] = v6;
  a2[2] = v12;
  a2[3] = v10;
  return result;
}

uint64_t sub_24CA38BC4@<X0>(uint64_t a1@<X2>, BOOL *a2@<X8>)
{
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CA3A278(&qword_269806780, (void (*)(uint64_t))type metadata accessor for DefaultContactlessPaymentSettingsProvider);
  sub_24CA40228();
  swift_release();
  uint64_t v4 = *(void *)(a1 + 136);
  swift_bridgeObjectRetain();
  swift_release();
  uint64_t result = swift_release();
  if (v4) {
    uint64_t result = swift_bridgeObjectRelease();
  }
  *a2 = v4 != 0;
  return result;
}

uint64_t sub_24CA38D50()
{
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_24CA3A278(&qword_269806780, (void (*)(uint64_t))type metadata accessor for DefaultContactlessPaymentSettingsProvider);
  sub_24CA40218();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_24CA38F04@<X0>(char *a1@<X8>)
{
  uint64_t v24 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698067F0);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698067F8);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v23 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v23 - v9;
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  id v13 = (char *)&v23 - v12;
  MEMORY[0x270FA5388](v11);
  id v15 = (char *)&v23 - v14;
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_retain();
  sub_24CA40518();
  sub_24CA40318();
  uint64_t v16 = sub_24CA40328();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v3, 0, 1, v16);
  swift_retain();
  sub_24CA40508();
  uint64_t v17 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
  v17(v10, v15, v4);
  uint64_t v18 = v23;
  v17(v23, v13, v4);
  uint64_t v19 = v24;
  v17(v24, v10, v4);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269806800);
  v17(&v19[*(int *)(v20 + 48)], v18, v4);
  uint64_t v21 = *(void (**)(char *, uint64_t))(v5 + 8);
  v21(v13, v4);
  v21(v15, v4);
  v21(v18, v4);
  v21(v10, v4);
  return swift_release();
}

uint64_t sub_24CA39298(uint64_t a1)
{
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CA3A278(&qword_269806780, (void (*)(uint64_t))type metadata accessor for DefaultContactlessPaymentSettingsProvider);
  sub_24CA40228();
  swift_release();
  uint64_t v2 = *(void *)(a1 + 112);
  swift_retain();
  swift_release();
  sub_24CA37C9C(v2);
  swift_release();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_24CA40218();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_24CA39500@<X0>(uint64_t a1@<X8>)
{
  return sub_24CA396F0(a1);
}

uint64_t sub_24CA3951C()
{
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CA36664();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_24CA3A278(&qword_269806780, (void (*)(uint64_t))type metadata accessor for DefaultContactlessPaymentSettingsProvider);
  sub_24CA40218();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_24CA396D8@<X0>(uint64_t a1@<X8>)
{
  return sub_24CA396F0(a1);
}

uint64_t sub_24CA396F0@<X0>(uint64_t a1@<X8>)
{
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CA403B8();
  if (qword_269806338 != -1) {
    swift_once();
  }
  id v2 = (id)qword_269807580;
  uint64_t v3 = sub_24CA403E8();
  uint64_t v5 = v4;
  char v7 = v6;
  uint64_t v9 = v8;
  uint64_t result = swift_release();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v7 & 1;
  *(void *)(a1 + 24) = v9;
  return result;
}

uint64_t sub_24CA3984C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24CA3A278(&qword_269806780, (void (*)(uint64_t))type metadata accessor for DefaultContactlessPaymentSettingsProvider);
  sub_24CA40228();
  swift_release();
  uint64_t v5 = *(void *)(a1 + 128);
  unint64_t v4 = *(void *)(a1 + 136);
  swift_bridgeObjectRetain();
  swift_release();
  if (!v4)
  {
    sub_24CA40758();
    sub_24CA40718();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_release();
    uint64_t v5 = 0;
    unint64_t v4 = 0xE000000000000000;
  }
  uint64_t result = swift_release();
  *(void *)a2 = v5;
  *(void *)(a2 + 8) = v4;
  *(unsigned char *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = MEMORY[0x263F8EE78];
  return result;
}

uint64_t sub_24CA39A38()
{
  return DefaultContactlessPaymentSettingsProvider.available.getter() & 1;
}

uint64_t sub_24CA39A60()
{
  uint64_t v1 = *v0;
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v2 = *(void *)(v1 + 40);
  swift_bridgeObjectRetain();
  swift_release();
  return v2;
}

uint64_t sub_24CA39AFC()
{
  return DefaultContactlessPaymentSettingsProvider.localizedDetail.getter();
}

uint64_t sub_24CA39B20()
{
  uint64_t v1 = *v0;
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v2 = *(void *)(v1 + 72);
  swift_bridgeObjectRetain();
  swift_release();
  return v2;
}

uint64_t sub_24CA39BBC@<X0>(uint64_t a1@<X8>)
{
  return DefaultContactlessPaymentSettingsProvider.content.getter(a1);
}

uint64_t sub_24CA39BE0()
{
  return sub_24CA36FD8(v0);
}

unint64_t sub_24CA39BE8()
{
  unint64_t result = qword_2698067A0;
  if (!qword_2698067A0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269806798);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2698067A8);
    sub_24CA40398();
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2698067B0);
    sub_24CA2DF30(&qword_2698067B8, &qword_2698067B0);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    sub_24CA2AEB4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698067A0);
  }
  return result;
}

uint64_t sub_24CA39D28@<X0>(BOOL *a1@<X8>)
{
  return sub_24CA38BC4(*(void *)(v1 + 32), a1);
}

uint64_t sub_24CA39D38()
{
  return sub_24CA38D50();
}

uint64_t sub_24CA39D44@<X0>(char *a1@<X8>)
{
  return sub_24CA38F04(a1);
}

uint64_t sub_24CA39D4C@<X0>(uint64_t a1@<X8>)
{
  return sub_24CA3984C(v1, a1);
}

uint64_t sub_24CA39D54(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_24CA39D64()
{
  return sub_24CA3A278(&qword_2698067D8, (void (*)(uint64_t))type metadata accessor for DefaultContactlessPaymentSettingsProvider);
}

uint64_t sub_24CA39DAC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24CA39DC8()
{
  return type metadata accessor for DefaultContactlessPaymentSettingsProvider();
}

uint64_t sub_24CA39DD0()
{
  uint64_t result = sub_24CA40268();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for DefaultContactlessPaymentSettingsProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DefaultContactlessPaymentSettingsProvider);
}

uint64_t dispatch thunk of DefaultContactlessPaymentSettingsProvider.__allocating_init(for:)()
{
  return (*(uint64_t (**)(void))(v0 + 168))();
}

uint64_t sub_24CA39ED8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24CA39FB4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24CA35314();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_24CA39FE0(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_3Tm(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t))sub_24CA35428);
}

uint64_t sub_24CA39FF8()
{
  return sub_24CA35598(v0[2], v0[3], v0[4]);
}

uint64_t sub_24CA3A018()
{
  return sub_24CA39298(v0);
}

uint64_t sub_24CA3A020()
{
  return sub_24CA3951C();
}

uint64_t sub_24CA3A028@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24CA34680();
  *a1 = result;
  return result;
}

uint64_t sub_24CA3A054()
{
  return sub_24CA34D5C();
}

uint64_t sub_24CA3A088()
{
  return sub_24CA34EBC(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_24CA3A0AC@<X0>(uint64_t a1@<X8>)
{
  return sub_24CA37194(v1, a1);
}

uint64_t sub_24CA3A0B4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24CA33E44();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_24CA3A0E0(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_3Tm(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t))sub_24CA33F58);
}

uint64_t keypath_set_3Tm(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  uint64_t v7 = *a1;
  uint64_t v6 = a1[1];
  swift_bridgeObjectRetain();
  return a5(v7, v6);
}

uint64_t sub_24CA3A140()
{
  return sub_24CA340C8(v0[2], v0[3], v0[4]);
}

uint64_t sub_24CA3A164@<X0>(void *a1@<X8>)
{
  return sub_24CA376A8(*(void *)(v1 + 32), a1);
}

uint64_t sub_24CA3A174(uint64_t *a1, uint64_t a2)
{
  return sub_24CA37820(a1, a2, v2[2], v2[3], v2[4]);
}

uint64_t sub_24CA3A180@<X0>(char *a1@<X8>)
{
  return sub_24CA37F5C(v1, a1);
}

unint64_t sub_24CA3A188()
{
  unint64_t result = qword_269806818;
  if (!qword_269806818)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269806810);
    sub_24CA2DF30(&qword_269806820, &qword_269806828);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269806818);
  }
  return result;
}

uint64_t sub_24CA3A220@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24CA34FF0();
  *a1 = result;
  return result;
}

uint64_t sub_24CA3A24C()
{
  return sub_24CA35100();
}

uint64_t sub_24CA3A278(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24CA3A2C0()
{
  return sub_24CA38410();
}

uint64_t sub_24CA3A2C8@<X0>(uint64_t a1@<X8>)
{
  return sub_24CA38514(v1, a1);
}

uint64_t sub_24CA3A2D0@<X0>(uint64_t a1@<X8>)
{
  return sub_24CA38640(v1, a1);
}

unint64_t sub_24CA3A2D8()
{
  unint64_t result = qword_269806848;
  if (!qword_269806848)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269806840);
    sub_24CA2DF30(&qword_269806538, &qword_269806540);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269806848);
  }
  return result;
}

uint64_t sub_24CA3A370(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269806840);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CA3A3D8()
{
  return sub_24CA35260(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

unint64_t sub_24CA3A3FC()
{
  unint64_t result = qword_269806858;
  if (!qword_269806858)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_269806858);
  }
  return result;
}

uint64_t sub_24CA3A444()
{
  return sub_24CA33678(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

uint64_t sub_24CA3A468(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_24CA2D704;
  return sub_24CA35CEC(a1, v4, v5, v6);
}

uint64_t sub_24CA3A51C()
{
  return sub_24CA3A088();
}

uint64_t sub_24CA3A534()
{
  return sub_24CA3A3D8();
}

uint64_t sub_24CA3A54C()
{
  return sub_24CA3A444();
}

uint64_t sub_24CA3A564()
{
  return sub_24CA39FF8();
}

uint64_t sub_24CA3A57C()
{
  return sub_24CA35B04();
}

uint64_t sub_24CA3A594()
{
  return sub_24CA3A140();
}

uint64_t static DefaultAppsPerAppSettings.orderedProviders(for:)(uint64_t a1, uint64_t a2)
{
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  type metadata accessor for DefaultAppsSettingsModel();
  swift_allocObject();
  sub_24CA2EC4C();
  uint64_t v4 = sub_24CA3004C(a1, a2);
  swift_release();
  swift_release();
  return v4;
}

uint64_t DefaultAppsPerAppSettings.deinit()
{
  return v0;
}

uint64_t DefaultAppsPerAppSettings.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for DefaultAppsPerAppSettings()
{
  return self;
}

uint64_t method lookup function for DefaultAppsPerAppSettings(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DefaultAppsPerAppSettings);
}

uint64_t sub_24CA3A6D4()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269806908);
  uint64_t result = swift_allocObject();
  *(_DWORD *)(result + 16) = 0;
  qword_269806870 = result;
  return result;
}

void *sub_24CA3A70C()
{
  uint64_t result = (void *)sub_24CA2E360(MEMORY[0x263F8EE78]);
  off_269806878 = result;
  return result;
}

uint64_t sub_24CA3A734(uint64_t a1)
{
  uint64_t v2 = a1 + 64;
  uint64_t v3 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v4 = -1;
  if (v3 < 64) {
    uint64_t v4 = ~(-1 << v3);
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v6 = (unint64_t)(v3 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v9 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v10 = v9 | (v8 << 6);
      goto LABEL_5;
    }
    int64_t v12 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v12 >= v6) {
      return swift_release();
    }
    unint64_t v13 = *(void *)(v2 + 8 * v12);
    ++v8;
    if (!v13)
    {
      int64_t v8 = v12 + 1;
      if (v12 + 1 >= v6) {
        return swift_release();
      }
      unint64_t v13 = *(void *)(v2 + 8 * v8);
      if (!v13)
      {
        int64_t v8 = v12 + 2;
        if (v12 + 2 >= v6) {
          return swift_release();
        }
        unint64_t v13 = *(void *)(v2 + 8 * v8);
        if (!v13)
        {
          int64_t v8 = v12 + 3;
          if (v12 + 3 >= v6) {
            return swift_release();
          }
          unint64_t v13 = *(void *)(v2 + 8 * v8);
          if (!v13) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v5 = (v13 - 1) & v13;
    unint64_t v10 = __clz(__rbit64(v13)) + (v8 << 6);
LABEL_5:
    sub_24CA33184(*(void *)(a1 + 48) + 40 * v10, (uint64_t)v16);
    long long v17 = *(_OWORD *)(*(void *)(a1 + 56) + 16 * v10);
    id v15 = (void (*)(uint64_t))v17;
    uint64_t v11 = swift_retain_n();
    v15(v11);
    swift_release();
    uint64_t result = sub_24CA3B014((uint64_t)v16);
  }
  int64_t v14 = v12 + 4;
  if (v14 >= v6) {
    return swift_release();
  }
  unint64_t v13 = *(void *)(v2 + 8 * v14);
  if (v13)
  {
    int64_t v8 = v14;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v8 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v8 >= v6) {
      return swift_release();
    }
    unint64_t v13 = *(void *)(v2 + 8 * v8);
    ++v14;
    if (v13) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

id sub_24CA3A8DC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = &v2[OBJC_IVAR____TtCC21DefaultAppsSettingsUI16LSChangeObserverP33_7689C6B5CF2FFB3629BA237567A0B8718Observer_notify];
  *(void *)uint64_t v3 = a1;
  *((void *)v3 + 1) = a2;
  id v4 = objc_allocWithZone(MEMORY[0x263F018B8]);
  unint64_t v5 = v2;
  swift_retain();
  id v6 = objc_msgSend(v4, sel_init);
  id v7 = objc_msgSend(self, sel_mainQueue);
  objc_msgSend(v6, sel_setQueue_, v7);

  *(void *)&v5[OBJC_IVAR____TtCC21DefaultAppsSettingsUI16LSChangeObserverP33_7689C6B5CF2FFB3629BA237567A0B8718Observer_lsObserver] = v6;
  id v8 = v6;

  v11.receiver = v5;
  v11.super_class = (Class)type metadata accessor for LSChangeObserver.Observer();
  id v9 = objc_msgSendSuper2(&v11, sel_init);
  objc_msgSend(v8, sel_setDelegate_, v9);

  swift_release();
  return v9;
}

id sub_24CA3AA98()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LSChangeObserver.Observer();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_24CA3AB20()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for LSChangeObserver()
{
  return self;
}

uint64_t type metadata accessor for LSChangeObserver.Observer()
{
  return self;
}

void sub_24CA3AB78()
{
  if (qword_269806340 != -1) {
    swift_once();
  }
  os_unfair_lock_lock((os_unfair_lock_t)(qword_269806870 + 16));
  if (qword_269806348 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v0 = swift_bridgeObjectRetain();
  sub_24CA3A734(v0);
  swift_bridgeObjectRelease();
  os_unfair_lock_unlock((os_unfair_lock_t)(qword_269806870 + 16));
}

void sub_24CA3AC58(uint64_t a1)
{
  if (qword_269806340 != -1) {
    swift_once();
  }
  os_unfair_lock_lock((os_unfair_lock_t)(qword_269806870 + 16));
  if (qword_269806348 != -1) {
    swift_once();
  }
  uint64_t v3 = a1;
  sub_24CA40838();
  swift_beginAccess();
  uint64_t v2 = sub_24CA30DA8((uint64_t)v4);
  sub_24CA33130((uint64_t)v4);
  swift_endAccess();
  sub_24CA3AD9C(v2);
  if (!*((void *)off_269806878 + 2) && qword_269806880) {
    objc_msgSend(*(id *)(qword_269806880+ OBJC_IVAR____TtCC21DefaultAppsSettingsUI16LSChangeObserverP33_7689C6B5CF2FFB3629BA237567A0B8718Observer_lsObserver), sel_stopObserving, v3);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(qword_269806870 + 16));
}

uint64_t sub_24CA3AD9C(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

void sub_24CA3ADAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (qword_269806340 != -1) {
    swift_once();
  }
  os_unfair_lock_lock((os_unfair_lock_t)(qword_269806870 + 16));
  if (!qword_269806880)
  {
    id v5 = objc_allocWithZone((Class)type metadata accessor for LSChangeObserver.Observer());
    id v6 = sub_24CA3A8DC((uint64_t)sub_24CA3AB78, 0);
    id v7 = (void *)qword_269806880;
    qword_269806880 = (uint64_t)v6;
  }
  if (qword_269806348 != -1) {
    swift_once();
  }
  swift_beginAccess();
  if (!*((void *)off_269806878 + 2) && qword_269806880) {
    objc_msgSend(*(id *)(qword_269806880+ OBJC_IVAR____TtCC21DefaultAppsSettingsUI16LSChangeObserverP33_7689C6B5CF2FFB3629BA237567A0B8718Observer_lsObserver), sel_startObserving);
  }
  sub_24CA40838();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  swift_beginAccess();
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v10 = off_269806878;
  off_269806878 = (_UNKNOWN *)0x8000000000000000;
  sub_24CA31A40((uint64_t)sub_24CA3AFEC, v8, (uint64_t)v11, isUniquelyReferenced_nonNull_native);
  off_269806878 = v10;
  swift_bridgeObjectRelease();
  sub_24CA33130((uint64_t)v11);
  swift_endAccess();
  os_unfair_lock_unlock((os_unfair_lock_t)(qword_269806870 + 16));
}

uint64_t sub_24CA3AFB4()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24CA3AFEC()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_24CA3B014(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269806910);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for RelayCallingOption(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
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
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for RelayCallingOption(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *uint64_t result = a2 + 2;
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
        JUMPOUT(0x24CA3B1E0);
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
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_24CA3B208(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_24CA3B214(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for RelayCallingOption()
{
  return &type metadata for RelayCallingOption;
}

uint64_t sub_24CA3B22C()
{
  uint64_t v0 = sub_24CA40208();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_24CA40648();
  MEMORY[0x270FA5388](v1 - 8);
  sub_24CA405E8();
  if (qword_269806338 != -1) {
    swift_once();
  }
  id v2 = (id)qword_269807580;
  sub_24CA401F8();
  return sub_24CA40678();
}

unint64_t sub_24CA3B3BC(char a1)
{
  if (!a1) {
    return 0xD000000000000019;
  }
  if (a1 == 1) {
    return 0xD000000000000010;
  }
  return 0xD000000000000016;
}

uint64_t sub_24CA3B41C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_24CA26FB4(*a1, *a2);
}

uint64_t sub_24CA3B428()
{
  return sub_24CA3B430();
}

uint64_t sub_24CA3B430()
{
  return sub_24CA409A8();
}

uint64_t sub_24CA3B4DC()
{
  return sub_24CA3B4E4();
}

uint64_t sub_24CA3B4E4()
{
  sub_24CA40698();

  return swift_bridgeObjectRelease();
}

uint64_t sub_24CA3B578()
{
  return sub_24CA3B580();
}

uint64_t sub_24CA3B580()
{
  return sub_24CA409A8();
}

uint64_t sub_24CA3B628@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24CA3B6DC();
  *a1 = result;
  return result;
}

unint64_t sub_24CA3B658@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_24CA3B3BC(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_24CA3B688()
{
  unint64_t result = qword_269806920;
  if (!qword_269806920)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269806920);
  }
  return result;
}

uint64_t sub_24CA3B6DC()
{
  unint64_t v0 = sub_24CA40948();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3;
  }
  else {
    return v0;
  }
}

uint64_t sub_24CA3B728@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24CA20B04();
  *a1 = result;
  return result;
}

uint64_t sub_24CA3B754()
{
  return sub_24CA20C34();
}

uint64_t sub_24CA3B780@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24CA20E70();
  *a1 = result & 1;
  return result;
}

uint64_t sub_24CA3B7B0()
{
  return sub_24CA20F80();
}

uint64_t sub_24CA3B7D8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24CA2E03C();
  *a1 = result;
  return result;
}

uint64_t sub_24CA3B804()
{
  return sub_24CA2E14C();
}

uint64_t DefaultAppsSettingsView.body.getter@<X0>(char *a1@<X8>)
{
  v95 = a1;
  uint64_t v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_269806928);
  MEMORY[0x270FA5388](v93);
  uint64_t v94 = (char *)&v64 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_24CA403A8();
  uint64_t v84 = *(void *)(v3 - 8);
  uint64_t v85 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v83 = (char *)&v64 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v92 = type metadata accessor for DefaultAppsSettingsView();
  uint64_t v69 = *(void *)(v92 - 8);
  uint64_t v5 = *(void *)(v69 + 64);
  MEMORY[0x270FA5388](v92);
  unsigned int v6 = (char *)&v64 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_269806930);
  uint64_t v7 = *(void *)(v70 - 8);
  MEMORY[0x270FA5388](v70);
  id v9 = (char *)&v64 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_269806938);
  uint64_t v72 = *(void *)(v75 - 8);
  MEMORY[0x270FA5388](v75);
  objc_super v11 = (char *)&v64 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_269806940);
  uint64_t v76 = *(void *)(v78 - 8);
  MEMORY[0x270FA5388](v78);
  uint64_t v73 = (char *)&v64 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_269806948);
  uint64_t v77 = *(void *)(v79 - 8);
  MEMORY[0x270FA5388](v79);
  unint64_t v74 = (char *)&v64 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_269806950);
  uint64_t v81 = *(void *)(v82 - 8);
  MEMORY[0x270FA5388](v82);
  v80 = (char *)&v64 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_269806958);
  MEMORY[0x270FA5388](v96);
  uint64_t v89 = (char *)&v64 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269806960);
  uint64_t v90 = *(void *)(v16 - 8);
  uint64_t v91 = v16;
  uint64_t v17 = MEMORY[0x270FA5388](v16);
  uint64_t v88 = (char *)&v64 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  v87 = (char *)&v64 - v19;
  uint64_t v20 = sub_24CA40768();
  uint64_t v86 = sub_24CA40758();
  uint64_t v71 = v20;
  sub_24CA40718();
  uint64_t isCurrentExecutor = swift_task_isCurrentExecutor();
  if ((isCurrentExecutor & 1) == 0) {
    uint64_t isCurrentExecutor = swift_task_reportUnexpectedExecutor();
  }
  MEMORY[0x270FA5388](isCurrentExecutor);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269806968);
  sub_24CA2DF30(&qword_269806970, &qword_269806968);
  sub_24CA403D8();
  sub_24CA3DF60(v1, (uint64_t)&v64 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v22 = *(unsigned __int8 *)(v69 + 80);
  uint64_t v23 = (v22 + 16) & ~v22;
  uint64_t v68 = v23 + v5;
  uint64_t v67 = v22 | 7;
  uint64_t v24 = swift_allocObject();
  uint64_t v69 = v23;
  sub_24CA3DFC8((uint64_t)&v64 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v24 + v23);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_269806980);
  uint64_t v26 = sub_24CA2DF30(&qword_269806988, &qword_269806930);
  uint64_t v66 = v1;
  uint64_t v27 = v26;
  unint64_t v28 = sub_24CA3E0AC();
  uint64_t v65 = v6;
  unint64_t v29 = v28;
  uint64_t v30 = v70;
  sub_24CA40498();
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v30);
  sub_24CA403B8();
  if (qword_269806338 != -1) {
    swift_once();
  }
  id v31 = (id)qword_269807580;
  uint64_t v32 = sub_24CA403E8();
  uint64_t v34 = v33;
  uint64_t v97 = v30;
  uint64_t v98 = MEMORY[0x263F8D310];
  uint64_t v99 = v25;
  char v36 = v35 & 1;
  uint64_t v100 = v27;
  uint64_t v101 = MEMORY[0x263F8D320];
  unint64_t v102 = v29;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v38 = v73;
  uint64_t v39 = v75;
  sub_24CA40478();
  sub_24CA39D54(v32, v34, v36);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v72 + 8))(v11, v39);
  uint64_t v41 = v84;
  uint64_t v40 = v85;
  char v42 = v83;
  (*(void (**)(char *, void, uint64_t))(v84 + 104))(v83, *MEMORY[0x263F19698], v85);
  uint64_t v97 = v39;
  uint64_t v98 = OpaqueTypeConformance2;
  uint64_t v43 = swift_getOpaqueTypeConformance2();
  uint64_t v44 = v74;
  uint64_t v45 = v78;
  sub_24CA404A8();
  (*(void (**)(char *, uint64_t))(v41 + 8))(v42, v40);
  (*(void (**)(char *, uint64_t))(v76 + 8))(v38, v45);
  uint64_t v97 = v45;
  uint64_t v98 = v43;
  swift_getOpaqueTypeConformance2();
  uint64_t v46 = v80;
  uint64_t v47 = v79;
  sub_24CA40408();
  (*(void (**)(char *, uint64_t))(v77 + 8))(v44, v47);
  uint64_t v48 = v66;
  uint64_t v49 = (uint64_t)v65;
  sub_24CA3DF60(v66, (uint64_t)v65);
  uint64_t v50 = swift_allocObject();
  uint64_t v51 = v69;
  sub_24CA3DFC8(v49, v50 + v69);
  uint64_t v52 = v81;
  uint64_t v53 = (uint64_t)v89;
  uint64_t v54 = v82;
  (*(void (**)(char *, char *, uint64_t))(v81 + 16))(v89, v46, v82);
  uint64_t v55 = (uint64_t (**)())(v53 + *(int *)(v96 + 36));
  *uint64_t v55 = sub_24CA3E65C;
  v55[1] = (uint64_t (*)())v50;
  v55[2] = 0;
  v55[3] = 0;
  (*(void (**)(char *, uint64_t))(v52 + 8))(v46, v54);
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_269806978);
  uint64_t v57 = (uint64_t)v94;
  MEMORY[0x253305020](v56);
  swift_release();
  sub_24CA3DF60(v48, v49);
  uint64_t v58 = swift_allocObject();
  sub_24CA3DFC8(v49, v58 + v51);
  sub_24CA3ED6C();
  sub_24CA3EF24();
  v59 = v88;
  sub_24CA404C8();
  swift_release();
  sub_24CA2D800(v57, &qword_269806928);
  sub_24CA2D800(v53, &qword_269806958);
  uint64_t v60 = v91;
  uint64_t v61 = *(void (**)(char *, char *, uint64_t))(v90 + 32);
  uint64_t v62 = v87;
  v61(v87, v59, v91);
  v61(v95, v62, v60);
  return swift_release();
}

uint64_t type metadata accessor for DefaultAppsSettingsView()
{
  uint64_t result = qword_2698069B0;
  if (!qword_2698069B0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24CA3C490@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
{
  uint64_t v30 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698069E0);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  id v31 = (char *)v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  id v9 = (char *)v29 - v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v32 = (char *)v29 - v10;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698069E8);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v33 = (char *)v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v34 = (char *)v29 - v15;
  sub_24CA40768();
  v29[1] = sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698069F0);
  sub_24CA2DF30(&qword_2698069F8, &qword_2698069F0);
  sub_24CA405B8();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v16 = a1[1];
  uint64_t v35 = *a1;
  uint64_t v36 = v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698069D8);
  sub_24CA404F8();
  swift_release();
  uint64_t v17 = v37;
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  uint64_t v35 = v17;
  sub_24CA40120(&qword_269806718, (void (*)(uint64_t))type metadata accessor for DefaultAppsSettingsModel);
  sub_24CA40228();
  swift_release();
  uint64_t v18 = *(void *)(v17 + 16);
  swift_bridgeObjectRetain();
  swift_release();
  swift_release();
  uint64_t v35 = v18;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269806A00);
  sub_24CA401E8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269806A08);
  sub_24CA2DF30(&qword_269806A10, &qword_269806A00);
  sub_24CA3FD24(&qword_269806A18, &qword_269806A08, (void (*)(void))sub_24CA3FD90);
  sub_24CA40120(&qword_269806A60, (void (*)(uint64_t))type metadata accessor for DefaultAppsSettingsGroup);
  sub_24CA405A8();
  uint64_t v19 = v32;
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v32, v9, v3);
  uint64_t v20 = *(void (**)(char *, char *, uint64_t))(v12 + 16);
  v20(v33, v34, v11);
  v29[0] = *(void *)(v4 + 16);
  uint64_t v21 = v31;
  ((void (*)(char *, char *, uint64_t))v29[0])(v31, v19, v3);
  uint64_t v22 = v4;
  uint64_t v23 = v30;
  uint64_t v24 = v33;
  v20(v30, v33, v11);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_269806A68);
  ((void (*)(char *, char *, uint64_t))v29[0])(&v23[*(int *)(v25 + 48)], v21, v3);
  uint64_t v26 = *(void (**)(char *, uint64_t))(v22 + 8);
  v26(v32, v3);
  uint64_t v27 = *(void (**)(char *, uint64_t))(v12 + 8);
  v27(v34, v11);
  v26(v21, v3);
  v27(v24, v11);
  return swift_release();
}

uint64_t sub_24CA3CA80@<X0>(char *a1@<X8>)
{
  return sub_24CA3C490(*(uint64_t **)(v1 + 16), a1);
}

uint64_t sub_24CA3CA88()
{
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (qword_269806338 != -1) {
    swift_once();
  }
  unint64_t v0 = (void *)qword_269807580;
  uint64_t v1 = (void *)sub_24CA40658();
  id v2 = objc_msgSend(v0, sel_localizedStringForKey_value_table_, v1, 0, 0);

  sub_24CA40668();
  uint64_t v3 = (void *)qword_269807580;
  uint64_t v4 = (void *)sub_24CA40658();
  id v5 = objc_msgSend(v3, sel_localizedStringForKey_value_table_, v4, 0, 0);

  sub_24CA40668();
  sub_24CA405D8();

  return swift_release();
}

uint64_t sub_24CA3CC74()
{
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }

  return swift_release();
}

uint64_t sub_24CA3CD04@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269806A08);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *a1;
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  v12[1] = v7;
  sub_24CA40120(&qword_2698063B8, (void (*)(uint64_t))type metadata accessor for DefaultAppsSettingsGroup);
  sub_24CA40228();
  swift_release();
  int v8 = *(unsigned __int8 *)(v7 + OBJC_IVAR____TtC21DefaultAppsSettingsUI24DefaultAppsSettingsGroup__isVisible);
  swift_release();
  if (v8 == 1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269806A38);
    sub_24CA3FD24(&qword_269806A30, &qword_269806A38, (void (*)(void))sub_24CA3FE48);
    sub_24CA405B8();
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269806A28);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v6, 0, 1, v9);
  }
  else
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269806A28);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v6, 1, 1, v10);
  }
  sub_24CA2D1AC((uint64_t)v6, a2, &qword_269806A08);
  return swift_release();
}

uint64_t sub_24CA3CFD8@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269806A38);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  int v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)v15 - v9;
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  v15[1] = a1;
  sub_24CA40120(&qword_2698063B8, (void (*)(uint64_t))type metadata accessor for DefaultAppsSettingsGroup);
  sub_24CA40228();
  swift_release();
  uint64_t v11 = (uint64_t *)(a1 + OBJC_IVAR____TtC21DefaultAppsSettingsUI24DefaultAppsSettingsGroup__providers);
  swift_beginAccess();
  uint64_t v12 = *v11;
  swift_bridgeObjectRetain();
  swift_release();
  v15[0] = v12;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269806A70);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269806A48);
  sub_24CA2DF30(&qword_269806A78, &qword_269806A70);
  sub_24CA3FE48();
  sub_24CA40588();
  uint64_t v13 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
  v13(v10, v8, v4);
  v13(a2, v10, v4);
  return swift_release();
}

uint64_t sub_24CA3D2F4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269806A48);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  if (sub_24CA402C8())
  {
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    v11[0] = sub_24CA402A8();
    v11[1] = v7;
    MEMORY[0x270FA5388](v11[0]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269806A80);
    sub_24CA40008();
    sub_24CA40358();
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269806A58);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v6, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269806A58);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v6, 1, 1, v9);
  }
  sub_24CA2D1AC((uint64_t)v6, a2, &qword_269806A48);
  return swift_release();
}

uint64_t sub_24CA3D550@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269806A98);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269806A80);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  uint64_t isCurrentExecutor = swift_task_isCurrentExecutor();
  if ((isCurrentExecutor & 1) == 0) {
    uint64_t isCurrentExecutor = swift_task_reportUnexpectedExecutor();
  }
  uint64_t v12 = MEMORY[0x270FA5388](isCurrentExecutor);
  *(&v14 - 2) = (uint64_t)a1;
  MEMORY[0x270FA5388](v12);
  *(&v14 - 2) = (uint64_t)a1;
  sub_24CA40348();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CA402A8();
  sub_24CA400B4();
  sub_24CA40458();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_24CA2D1AC((uint64_t)v10, a2, &qword_269806A80);
  return swift_release();
}

uint64_t sub_24CA3D7D4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CA40288();
  if (!v4)
  {
    sub_24CA40758();
    sub_24CA40718();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_release();
  }
  sub_24CA2CDA4();
  uint64_t v5 = sub_24CA403F8();
  uint64_t v7 = v6;
  char v9 = v8;
  uint64_t v11 = v10;
  uint64_t result = swift_release();
  *(void *)a2 = v5;
  *(void *)(a2 + 8) = v7;
  *(unsigned char *)(a2 + 16) = v9 & 1;
  *(void *)(a2 + 24) = v11;
  return result;
}

uint64_t sub_24CA3D938@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_24CA40768();
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CA40278();
  sub_24CA2CDA4();
  uint64_t v4 = sub_24CA403F8();
  uint64_t v6 = v5;
  char v8 = v7;
  uint64_t v10 = v9;
  uint64_t result = swift_release();
  *(void *)a2 = v4;
  *(void *)(a2 + 8) = v6;
  *(unsigned char *)(a2 + 16) = v8 & 1;
  *(void *)(a2 + 24) = v10;
  return result;
}

uint64_t sub_24CA3DA34@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v34 = a3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698069D0);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v32 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  id v31 = (char *)&v30 - v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269806980);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *a1;
  uint64_t v13 = a1[1];
  sub_24CA40768();
  uint64_t v33 = sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v15 = a2[1];
  uint64_t v35 = *a2;
  uint64_t v36 = v15;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698069D8);
  sub_24CA404F8();
  swift_release();
  sub_24CA2FE74(v14, v13, (uint64_t)&v39);
  swift_release();
  if (v40)
  {
    sub_24CA32F1C(&v39, (uint64_t)v42);
    __swift_project_boxed_opaque_existential_1(v42, v43);
    uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    uint64_t v40 = AssociatedTypeWitness;
    uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v39);
    uint64_t v18 = sub_24CA402B8();
    MEMORY[0x270FA5388](v18);
    (*(void (**)(char *, uint64_t *, uint64_t))(v20 + 16))((char *)&v30 - v19, boxed_opaque_existential_0, AssociatedTypeWitness);
    uint64_t v38 = sub_24CA40538();
    __swift_project_boxed_opaque_existential_1(v42, v43);
    uint64_t v21 = sub_24CA40298();
    uint64_t v23 = v22;
    sub_24CA2181C((uint64_t)v42, (uint64_t)&v35);
    if (!v23)
    {
      sub_24CA40758();
      sub_24CA40718();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      __swift_project_boxed_opaque_existential_1(&v35, v37);
      uint64_t v21 = sub_24CA40278();
      uint64_t v23 = v24;
      swift_release();
    }
    uint64_t v25 = v34;
    uint64_t v27 = v31;
    uint64_t v26 = v32;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v35);
    uint64_t v35 = v21;
    uint64_t v36 = v23;
    sub_24CA2CDA4();
    sub_24CA40488();
    swift_bridgeObjectRelease();
    swift_release();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v39);
    unint64_t v28 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
    v28(v27, v26, v5);
    v28(v12, v27, v5);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v12, 0, 1, v5);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v42);
  }
  else
  {
    sub_24CA2D800((uint64_t)&v39, &qword_269806720);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v12, 1, 1, v5);
    uint64_t v25 = v34;
  }
  sub_24CA2D1AC((uint64_t)v12, v25, &qword_269806980);
  return swift_release();
}

uint64_t sub_24CA3DF60(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DefaultAppsSettingsView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CA3DFC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DefaultAppsSettingsView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CA3E02C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for DefaultAppsSettingsView() - 8);
  uint64_t v6 = (uint64_t *)(v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80)));

  return sub_24CA3DA34(a1, v6, a2);
}

unint64_t sub_24CA3E0AC()
{
  unint64_t result = qword_269806990;
  if (!qword_269806990)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269806980);
    sub_24CA2CDA4();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269806990);
  }
  return result;
}

uint64_t sub_24CA3E160()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_269806928);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_24CA401A8();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v22 - v8;
  sub_24CA40768();
  uint64_t v25 = sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  type metadata accessor for DefaultAppsSettingsView();
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269806978);
  MEMORY[0x253305020](v10);
  swift_release();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
  {
    sub_24CA2D800((uint64_t)v2, &qword_269806928);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v9, v2, v3);
    if (qword_269806330 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_24CA40308();
    __swift_project_value_buffer(v11, (uint64_t)qword_269807568);
    (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v7, v9, v3);
    uint64_t v12 = sub_24CA402E8();
    os_log_type_t v13 = sub_24CA407B8();
    uint64_t v14 = v9;
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v24 = v9;
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      uint64_t v27 = v23;
      *(_DWORD *)uint64_t v15 = 136380675;
      sub_24CA40758();
      sub_24CA40718();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      swift_release();
      sub_24CA40120(&qword_2698069C8, MEMORY[0x263F06EA8]);
      uint64_t v16 = sub_24CA40968();
      uint64_t v26 = sub_24CA2B1F0(v16, v17, &v27);
      sub_24CA407D8();
      swift_bridgeObjectRelease();
      uint64_t v18 = *(void (**)(char *, uint64_t))(v4 + 8);
      v18(v7, v3);
      _os_log_impl(&dword_24CA1C000, v12, v13, "Received deep link request on appear with URL: %{private}s", v15, 0xCu);
      uint64_t v19 = v23;
      swift_arrayDestroy();
      MEMORY[0x253305A30](v19, -1, -1);
      MEMORY[0x253305A30](v15, -1, -1);

      v18(v24, v3);
    }
    else
    {

      uint64_t v20 = *(void (**)(char *, uint64_t))(v4 + 8);
      v20(v7, v3);
      v20(v14, v3);
    }
  }
  sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_release();
  return swift_release();
}

uint64_t sub_24CA3E65C()
{
  type metadata accessor for DefaultAppsSettingsView();

  return sub_24CA3E160();
}

uint64_t sub_24CA3E6BC(uint64_t a1, uint64_t a2)
{
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_269806928);
  uint64_t v4 = MEMORY[0x270FA5388](v31);
  uint64_t v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  uint64_t v9 = (char *)&v27 - v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v27 - v10;
  sub_24CA40768();
  uint64_t v12 = sub_24CA40758();
  sub_24CA40718();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (qword_269806330 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_24CA40308();
  __swift_project_value_buffer(v13, (uint64_t)qword_269807568);
  uint64_t v32 = a1;
  sub_24CA3FC78(a1, (uint64_t)v11);
  sub_24CA3FC78(a2, (uint64_t)v9);
  uint64_t v14 = sub_24CA402E8();
  int v15 = sub_24CA407B8();
  if (os_log_type_enabled(v14, (os_log_type_t)v15))
  {
    int v28 = v15;
    uint64_t v29 = a2;
    uint64_t v30 = v12;
    uint64_t v16 = swift_slowAlloc();
    uint64_t v27 = swift_slowAlloc();
    uint64_t v34 = v27;
    *(_DWORD *)uint64_t v16 = 136380931;
    sub_24CA40758();
    sub_24CA40718();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    sub_24CA3FC78((uint64_t)v11, (uint64_t)v6);
    uint64_t v17 = sub_24CA40688();
    unint64_t v19 = v18;
    swift_release();
    uint64_t v33 = sub_24CA2B1F0(v17, v19, &v34);
    sub_24CA407D8();
    swift_bridgeObjectRelease();
    sub_24CA2D800((uint64_t)v11, &qword_269806928);
    *(_WORD *)(v16 + 12) = 2081;
    sub_24CA40758();
    sub_24CA40718();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    sub_24CA3FC78((uint64_t)v9, (uint64_t)v6);
    uint64_t v20 = sub_24CA40688();
    unint64_t v22 = v21;
    swift_release();
    uint64_t v33 = sub_24CA2B1F0(v20, v22, &v34);
    sub_24CA407D8();
    swift_bridgeObjectRelease();
    sub_24CA2D800((uint64_t)v9, &qword_269806928);
    _os_log_impl(&dword_24CA1C000, v14, (os_log_type_t)v28, "Deep link URL changed from %{private}s to %{private}s", (uint8_t *)v16, 0x16u);
    uint64_t v23 = v27;
    swift_arrayDestroy();
    MEMORY[0x253305A30](v23, -1, -1);
    MEMORY[0x253305A30](v16, -1, -1);

    a2 = v29;
  }
  else
  {
    sub_24CA2D800((uint64_t)v11, &qword_269806928);
    sub_24CA2D800((uint64_t)v9, &qword_269806928);
  }
  uint64_t v24 = sub_24CA401A8();
  uint64_t v25 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 48);
  if (v25(v32, 1, v24) == 1 && v25(a2, 1, v24) != 1)
  {
    sub_24CA40758();
    sub_24CA40718();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_release();
  }
  return swift_release();
}

uint64_t objectdestroyTm()
{
  uint64_t v1 = (int *)(type metadata accessor for DefaultAppsSettingsView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  swift_release();
  swift_release();
  uint64_t v5 = v0 + v3 + v1[7];
  swift_release();
  swift_release();
  uint64_t v6 = v5 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269806978) + 32);
  uint64_t v7 = sub_24CA401A8();
  uint64_t v8 = *(void *)(v7 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7)) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  }

  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_24CA3ECEC(uint64_t a1, uint64_t a2)
{
  type metadata accessor for DefaultAppsSettingsView();

  return sub_24CA3E6BC(a1, a2);
}

unint64_t sub_24CA3ED6C()
{
  unint64_t result = qword_269806998;
  if (!qword_269806998)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269806958);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269806948);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269806940);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269806938);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269806930);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269806980);
    sub_24CA2DF30(&qword_269806988, &qword_269806930);
    sub_24CA3E0AC();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269806998);
  }
  return result;
}

unint64_t sub_24CA3EF24()
{
  unint64_t result = qword_2698069A0;
  if (!qword_2698069A0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269806928);
    sub_24CA40120(&qword_2698069A8, MEMORY[0x263F06EA8]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698069A0);
  }
  return result;
}

uint64_t DefaultAppsSettingsView.init(deepLinkURL:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  type metadata accessor for DefaultAppsSettingsModel();
  swift_allocObject();
  sub_24CA2EC4C();
  sub_24CA404E8();
  *a2 = v6;
  a2[1] = v7;
  uint64_t v4 = type metadata accessor for DefaultAppsSettingsView();
  return sub_24CA2D1AC(a1, (uint64_t)a2 + *(int *)(v4 + 20), &qword_269806978);
}

uint64_t sub_24CA3F058()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24CA3F07C()
{
  return sub_24CA40468();
}

uint64_t *initializeBufferWithCopyOfBuffer for DefaultAppsSettingsView(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v5 = *a2;
  *a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = (uint64_t *)(v5 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    a1[1] = a2[1];
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (uint64_t *)((char *)a1 + v6);
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = *(uint64_t *)((char *)a2 + v6 + 8);
    void *v7 = *(uint64_t *)((char *)a2 + v6);
    v7[1] = v9;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    uint64_t v10 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269806978) + 32);
    uint64_t v11 = (char *)v7 + v10;
    uint64_t v12 = &v8[v10];
    uint64_t v13 = sub_24CA401A8();
    uint64_t v14 = *(void *)(v13 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13))
    {
      uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269806928);
      memcpy(v11, v12, *(void *)(*(void *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v11, v12, v13);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
    }
  }
  return a1;
}

uint64_t destroy for DefaultAppsSettingsView(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  swift_release();
  swift_release();
  uint64_t v5 = v4 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269806978) + 32);
  uint64_t v6 = sub_24CA401A8();
  uint64_t v9 = *(void *)(v6 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v5, 1, v6);
  if (!result)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(v9 + 8);
    return v8(v5, v6);
  }
  return result;
}

void *initializeWithCopy for DefaultAppsSettingsView(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = (void *)((char *)a1 + v5);
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = *(void *)((char *)a2 + v5 + 8);
  *uint64_t v6 = *(void *)((char *)a2 + v5);
  v6[1] = v8;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  uint64_t v9 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269806978) + 32);
  uint64_t v10 = (char *)v6 + v9;
  uint64_t v11 = &v7[v9];
  uint64_t v12 = sub_24CA401A8();
  uint64_t v13 = *(void *)(v12 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
  {
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269806928);
    memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v10, v11, v12);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  }
  return a1;
}

void *assignWithCopy for DefaultAppsSettingsView(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (void *)((char *)a2 + v6);
  *(void *)((char *)a1 + v6) = *v8;
  swift_retain();
  swift_release();
  *((void *)v7 + 1) = v8[1];
  swift_retain();
  swift_release();
  uint64_t v9 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269806978) + 32);
  uint64_t v10 = &v7[v9];
  uint64_t v11 = (char *)v8 + v9;
  uint64_t v12 = sub_24CA401A8();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48);
  int v15 = v14(v10, 1, v12);
  int v16 = v14(v11, 1, v12);
  if (!v15)
  {
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 24))(v10, v11, v12);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v13 + 8))(v10, v12);
    goto LABEL_6;
  }
  if (v16)
  {
LABEL_6:
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_269806928);
    memcpy(v10, v11, *(void *)(*(void *)(v17 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v10, v11, v12);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  return a1;
}

_OWORD *initializeWithTake for DefaultAppsSettingsView(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (void *)((char *)a1 + v4);
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = *(void *)((char *)a2 + v4 + 8);
  *uint64_t v5 = *(void *)((char *)a2 + v4);
  v5[1] = v7;
  uint64_t v8 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269806978) + 32);
  uint64_t v9 = (char *)v5 + v8;
  uint64_t v10 = &v6[v8];
  uint64_t v11 = sub_24CA401A8();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269806928);
    memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v9, v10, v11);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  return a1;
}

void *assignWithTake for DefaultAppsSettingsView(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (void *)((char *)a2 + v6);
  *(void *)((char *)a1 + v6) = *v8;
  swift_release();
  *((void *)v7 + 1) = v8[1];
  swift_release();
  uint64_t v9 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269806978) + 32);
  uint64_t v10 = &v7[v9];
  uint64_t v11 = (char *)v8 + v9;
  uint64_t v12 = sub_24CA401A8();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48);
  int v15 = v14(v10, 1, v12);
  int v16 = v14(v11, 1, v12);
  if (!v15)
  {
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 40))(v10, v11, v12);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v13 + 8))(v10, v12);
    goto LABEL_6;
  }
  if (v16)
  {
LABEL_6:
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_269806928);
    memcpy(v10, v11, *(void *)(*(void *)(v17 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v10, v11, v12);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  return a1;
}

uint64_t getEnumTagSinglePayload for DefaultAppsSettingsView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24CA3F990);
}

uint64_t sub_24CA3F990(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269806978);
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for DefaultAppsSettingsView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24CA3FA58);
}

void *sub_24CA3FA58(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269806978);
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_24CA3FB04()
{
  sub_24CA3FB9C();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_24CA3FB9C()
{
  if (!qword_2698069C0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269806928);
    unint64_t v0 = sub_24CA40578();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2698069C0);
    }
  }
}

uint64_t sub_24CA3FBF8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24CA3FC78(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269806928);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CA3FCE0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24CA2E03C();
  *a1 = result;
  return result;
}

uint64_t sub_24CA3FD0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm_0(a1, a2, a3, a4, (uint64_t (*)(uint64_t))sub_24CA2E14C);
}

uint64_t sub_24CA3FD24(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_24CA3FD90()
{
  unint64_t result = qword_269806A20;
  if (!qword_269806A20)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269806A28);
    sub_24CA3FD24(&qword_269806A30, &qword_269806A38, (void (*)(void))sub_24CA3FE48);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269806A20);
  }
  return result;
}

unint64_t sub_24CA3FE48()
{
  unint64_t result = qword_269806A40;
  if (!qword_269806A40)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269806A48);
    sub_24CA2DF30(&qword_269806A50, &qword_269806A58);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269806A40);
  }
  return result;
}

uint64_t sub_24CA3FEE0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24CA20E70();
  *a1 = result & 1;
  return result;
}

uint64_t sub_24CA3FF10()
{
  return sub_24CA20F80();
}

uint64_t sub_24CA3FF38@<X0>(char *a1@<X8>)
{
  return sub_24CA3CFD8(v1, a1);
}

uint64_t sub_24CA3FF40@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24CA20B04();
  *a1 = result;
  return result;
}

uint64_t sub_24CA3FF6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm_0(a1, a2, a3, a4, (uint64_t (*)(uint64_t))sub_24CA20C34);
}

uint64_t keypath_setTm_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t))
{
  uint64_t v6 = swift_bridgeObjectRetain();
  return a5(v6);
}

uint64_t sub_24CA3FFB8@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t result = sub_24CA402A8();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_24CA40000@<X0>(uint64_t a1@<X8>)
{
  return sub_24CA3D550(*(void **)(v1 + 16), a1);
}

unint64_t sub_24CA40008()
{
  unint64_t result = qword_269806A88;
  if (!qword_269806A88)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269806A80);
    sub_24CA400B4();
    sub_24CA40120((unint64_t *)&unk_269806AA0, MEMORY[0x263F1A470]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269806A88);
  }
  return result;
}

unint64_t sub_24CA400B4()
{
  unint64_t result = qword_269806A90;
  if (!qword_269806A90)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269806A98);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269806A90);
  }
  return result;
}

uint64_t sub_24CA40120(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24CA40168@<X0>(uint64_t a1@<X8>)
{
  return sub_24CA3D7D4(*(void **)(v1 + 16), a1);
}

uint64_t sub_24CA40170@<X0>(uint64_t a1@<X8>)
{
  return sub_24CA3D938(*(void **)(v1 + 16), a1);
}

uint64_t sub_24CA40178()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_24CA40188()
{
  return MEMORY[0x270EEFA08]();
}

uint64_t sub_24CA40198()
{
  return MEMORY[0x270EEFA18]();
}

uint64_t sub_24CA401A8()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_24CA401B8()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_24CA401C8()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_24CA401D8()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_24CA401E8()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_24CA401F8()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_24CA40208()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_24CA40218()
{
  return MEMORY[0x270FA11F8]();
}

uint64_t sub_24CA40228()
{
  return MEMORY[0x270FA1208]();
}

uint64_t sub_24CA40238()
{
  return MEMORY[0x270FA1220]();
}

uint64_t sub_24CA40248()
{
  return MEMORY[0x270FA1228]();
}

uint64_t sub_24CA40258()
{
  return MEMORY[0x270FA1238]();
}

uint64_t sub_24CA40268()
{
  return MEMORY[0x270FA1250]();
}

uint64_t sub_24CA40278()
{
  return MEMORY[0x270F25950]();
}

uint64_t sub_24CA40288()
{
  return MEMORY[0x270F25958]();
}

uint64_t sub_24CA40298()
{
  return MEMORY[0x270F25960]();
}

uint64_t sub_24CA402A8()
{
  return MEMORY[0x270F25968]();
}

uint64_t sub_24CA402B8()
{
  return MEMORY[0x270F25970]();
}

uint64_t sub_24CA402C8()
{
  return MEMORY[0x270F25978]();
}

uint64_t sub_24CA402D8()
{
  return MEMORY[0x270F87508]();
}

uint64_t sub_24CA402E8()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24CA402F8()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_24CA40308()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24CA40318()
{
  return MEMORY[0x270EFEC70]();
}

uint64_t sub_24CA40328()
{
  return MEMORY[0x270EFEC88]();
}

uint64_t sub_24CA40338()
{
  return MEMORY[0x270EFF370]();
}

uint64_t sub_24CA40348()
{
  return MEMORY[0x270EFFA48]();
}

uint64_t sub_24CA40358()
{
  return MEMORY[0x270EFFAF8]();
}

uint64_t sub_24CA40368()
{
  return MEMORY[0x270F00E50]();
}

uint64_t sub_24CA40378()
{
  return MEMORY[0x270F00E68]();
}

uint64_t sub_24CA40388()
{
  return MEMORY[0x270F00F50]();
}

uint64_t sub_24CA40398()
{
  return MEMORY[0x270F00F68]();
}

uint64_t sub_24CA403A8()
{
  return MEMORY[0x270F00F88]();
}

uint64_t sub_24CA403B8()
{
  return MEMORY[0x270F01270]();
}

uint64_t sub_24CA403C8()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_24CA403D8()
{
  return MEMORY[0x270F02DC8]();
}

uint64_t sub_24CA403E8()
{
  return MEMORY[0x270F03228]();
}

uint64_t sub_24CA403F8()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_24CA40408()
{
  return MEMORY[0x270F5D070]();
}

uint64_t sub_24CA40418()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_24CA40428()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_24CA40438()
{
  return MEMORY[0x270F034F0]();
}

uint64_t sub_24CA40448()
{
  return MEMORY[0x270F035C0]();
}

uint64_t sub_24CA40458()
{
  return MEMORY[0x270F03630]();
}

uint64_t sub_24CA40468()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_24CA40478()
{
  return MEMORY[0x270F037F8]();
}

uint64_t sub_24CA40488()
{
  return MEMORY[0x270F03810]();
}

uint64_t sub_24CA40498()
{
  return MEMORY[0x270F03C80]();
}

uint64_t sub_24CA404A8()
{
  return MEMORY[0x270F03E60]();
}

uint64_t sub_24CA404B8()
{
  return MEMORY[0x270F03FA8]();
}

uint64_t sub_24CA404C8()
{
  return MEMORY[0x270F04188]();
}

uint64_t sub_24CA404D8()
{
  return MEMORY[0x270F04748]();
}

uint64_t sub_24CA404E8()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_24CA404F8()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_24CA40508()
{
  return MEMORY[0x270F04890]();
}

uint64_t sub_24CA40518()
{
  return MEMORY[0x270F048B0]();
}

uint64_t sub_24CA40528()
{
  return MEMORY[0x270F049C0]();
}

uint64_t sub_24CA40538()
{
  return MEMORY[0x270F04B20]();
}

uint64_t sub_24CA40548()
{
  return MEMORY[0x270F04B30]();
}

uint64_t sub_24CA40558()
{
  return MEMORY[0x270F04B70]();
}

uint64_t sub_24CA40568()
{
  return MEMORY[0x270F04B80]();
}

uint64_t sub_24CA40578()
{
  return MEMORY[0x270F04BF8]();
}

uint64_t sub_24CA40588()
{
  return MEMORY[0x270F04C90]();
}

uint64_t sub_24CA40598()
{
  return MEMORY[0x270F04CA0]();
}

uint64_t sub_24CA405A8()
{
  return MEMORY[0x270F04CA8]();
}

uint64_t sub_24CA405B8()
{
  return MEMORY[0x270F04D68]();
}

uint64_t sub_24CA405C8()
{
  return MEMORY[0x270F04D70]();
}

uint64_t sub_24CA405D8()
{
  return MEMORY[0x270F5D0E0]();
}

uint64_t sub_24CA405E8()
{
  return MEMORY[0x270EF18D0]();
}

uint64_t sub_24CA405F8()
{
  return MEMORY[0x270EF1908]();
}

uint64_t sub_24CA40608()
{
  return MEMORY[0x270EF1918]();
}

uint64_t sub_24CA40618()
{
  return MEMORY[0x270EF1928]();
}

uint64_t sub_24CA40628()
{
  return MEMORY[0x270EF1938]();
}

uint64_t sub_24CA40638()
{
  return MEMORY[0x270EF1950]();
}

uint64_t sub_24CA40648()
{
  return MEMORY[0x270EF1958]();
}

uint64_t sub_24CA40658()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_24CA40668()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_24CA40678()
{
  return MEMORY[0x270EF1AF8]();
}

uint64_t sub_24CA40688()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_24CA40698()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24CA406A8()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24CA406B8()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_24CA406C8()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_24CA406D8()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_24CA406E8()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_24CA406F8()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_24CA40708()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_24CA40718()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_24CA40728()
{
  return MEMORY[0x270FA1E10]();
}

uint64_t sub_24CA40738()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_24CA40748()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_24CA40758()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_24CA40768()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_24CA40778()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_24CA40788()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_24CA40798()
{
  return MEMORY[0x270EF1E08]();
}

uint64_t sub_24CA407A8()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_24CA407B8()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_24CA407C8()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_24CA407D8()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24CA407E8()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24CA407F8()
{
  return MEMORY[0x270EF24F0]();
}

uint64_t sub_24CA40808()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_24CA40818()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_24CA40828()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_24CA40838()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_24CA40848()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24CA40858()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_24CA40868()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_24CA40878()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24CA40888()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_24CA40898()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_24CA408A8()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_24CA408B8()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_24CA408C8()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_24CA408D8()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24CA408E8()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_24CA408F8()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_24CA40908()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_24CA40918()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_24CA40928()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_24CA40938()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24CA40948()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_24CA40958()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_24CA40968()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_24CA40978()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24CA40988()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_24CA40998()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24CA409A8()
{
  return MEMORY[0x270F9FC90]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void bzero(void *a1, size_t a2)
{
}

uint64_t defaultAppRelayTelephonySetting()
{
  return MEMORY[0x270F7CB90]();
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t setDefaultAppRelayTelephonySetting()
{
  return MEMORY[0x270F7CB98]();
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
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

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x270FA04D8]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
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

uint64_t swift_task_isCurrentExecutor()
{
  return MEMORY[0x270FA2478]();
}

uint64_t swift_task_reportUnexpectedExecutor()
{
  return MEMORY[0x270FA2490]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x270FA0648]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x270FA0650]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x270FA0658]();
}