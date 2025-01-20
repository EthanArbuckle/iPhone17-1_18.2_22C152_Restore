uint64_t sub_247E9B774(uint64_t a1, uint64_t a2)
{
  return sub_247E9B8E0(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_247E9B78C(uint64_t a1, id *a2)
{
  uint64_t result = sub_247EBC410();
  *a2 = 0;
  return result;
}

uint64_t sub_247E9B804(uint64_t a1, id *a2)
{
  char v3 = sub_247EBC420();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_247E9B884@<X0>(uint64_t *a1@<X8>)
{
  sub_247EBC430();
  uint64_t v2 = sub_247EBC400();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_247E9B8C8(uint64_t a1, uint64_t a2)
{
  return sub_247E9B8E0(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_247E9B8E0(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_247EBC430();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_247E9B924()
{
  sub_247EBC430();
  sub_247EBC470();
  return swift_bridgeObjectRelease();
}

uint64_t sub_247E9B978()
{
  sub_247EBC430();
  sub_247EBC9D0();
  sub_247EBC470();
  uint64_t v0 = sub_247EBC9F0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_247E9B9EC()
{
  uint64_t v0 = sub_247EBC430();
  uint64_t v2 = v1;
  if (v0 == sub_247EBC430() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_247EBC910();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_247E9BA78@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_247EBC400();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_247E9BAC0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_247EBC430();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void type metadata accessor for OpenExternalURLOptionsKey(uint64_t a1)
{
}

uint64_t sub_247E9BB00(uint64_t a1)
{
  uint64_t v2 = sub_247E9BC00(&qword_2692D0EC8);
  uint64_t v3 = sub_247E9BC00(&qword_2692D0ED0);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_247E9BB98()
{
  return sub_247E9BC00(&qword_2692D0DF0);
}

uint64_t sub_247E9BBCC()
{
  return sub_247E9BC00(&qword_2692D0DF8);
}

uint64_t sub_247E9BC00(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for OpenExternalURLOptionsKey(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_247E9BC44()
{
  return sub_247E9BC00(&qword_2692D0E00);
}

void type metadata accessor for SecCertificate(uint64_t a1)
{
}

void type metadata accessor for CFError(uint64_t a1)
{
}

void type metadata accessor for SecAccessControl(uint64_t a1)
{
}

void type metadata accessor for ACAccountCredentialRenewResult(uint64_t a1)
{
}

void sub_247E9BCC8(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t destroy for ErrorWithTelemetryEvent(id *a1)
{
  return swift_release();
}

void *_s16AppleCareSupport23ErrorWithTelemetryEventVwCP_0(void *a1, uint64_t a2)
{
  id v4 = *(id *)a2;
  id v5 = *(id *)a2;
  uint64_t v6 = *(void *)(a2 + 8);
  *a1 = v4;
  a1[1] = v6;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for ErrorWithTelemetryEvent(uint64_t a1, uint64_t a2)
{
  id v4 = *(id *)a2;
  id v5 = *(id *)a2;
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

id *assignWithTake for ErrorWithTelemetryEvent(id *a1, _OWORD *a2)
{
  *(_OWORD *)a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ErrorWithTelemetryEvent(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ErrorWithTelemetryEvent(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ErrorWithTelemetryEvent()
{
  return &type metadata for ErrorWithTelemetryEvent;
}

ValueMetadata *type metadata accessor for AnisetteHeadersProvider()
{
  return &type metadata for AnisetteHeadersProvider;
}

unint64_t sub_247E9BEF8()
{
  return 0xD000000000000017;
}

uint64_t sub_247E9BF14()
{
  uint64_t v3 = (uint64_t (__cdecl *)())((char *)&dword_2692D0F68 + dword_2692D0F68);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_247E9BFBC;
  return v3();
}

uint64_t sub_247E9BFBC(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  id v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_247E9C0BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v6 = v5;
  uint64_t v12 = *v5;
  unint64_t v14 = sub_247EAF8A4(a3, a4);
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
  if (v19 >= v17 && (a5 & 1) != 0) {
    goto LABEL_7;
  }
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_247EB7508();
LABEL_7:
    v20 = (void *)*v6;
    if (v18)
    {
LABEL_8:
      v21 = (void *)(v20[7] + 16 * v14);
      uint64_t result = swift_bridgeObjectRelease();
      void *v21 = a1;
      v21[1] = a2;
      return result;
    }
    goto LABEL_11;
  }
  sub_247EB6B34(v17, a5 & 1);
  unint64_t v23 = sub_247EAF8A4(a3, a4);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_17:
    uint64_t result = sub_247EBC950();
    __break(1u);
    return result;
  }
  unint64_t v14 = v23;
  v20 = (void *)*v6;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  v20[(v14 >> 6) + 8] |= 1 << v14;
  v25 = (uint64_t *)(v20[6] + 16 * v14);
  uint64_t *v25 = a3;
  v25[1] = a4;
  v26 = (void *)(v20[7] + 16 * v14);
  void *v26 = a1;
  v26[1] = a2;
  uint64_t v27 = v20[2];
  BOOL v28 = __OFADD__(v27, 1);
  uint64_t v29 = v27 + 1;
  if (v28)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v20[2] = v29;
  return swift_bridgeObjectRetain();
}

uint64_t sub_247E9C244()
{
  return MEMORY[0x270FA2498](sub_247E9C260, 0, 0);
}

uint64_t sub_247E9C260()
{
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F089E0]), sel_init);
  objc_msgSend(v1, sel_ak_addClientInfoHeader);
  objc_msgSend(v1, sel_ak_addDeviceUDIDHeader);
  id v2 = objc_msgSend(v1, sel_allHTTPHeaderFields);
  if (v2)
  {
    uint64_t v3 = v2;
    unint64_t v4 = sub_247EBC3D0();
  }
  else
  {
    unint64_t v4 = sub_247EAF0E8(MEMORY[0x263F8EE78]);
  }
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_247E9C0BC(0xD000000000000022, 0x8000000247EBE340, 0xD000000000000010, 0x8000000247EBE320, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();

  uint64_t v6 = *(uint64_t (**)(unint64_t))(v0 + 8);
  return v6(v4);
}

id sub_247E9C3B0(uint64_t a1)
{
  id v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  uint64_t v3 = v1(v2);
  swift_release();
  if (v3)
  {
    sub_247E9D5A0();
    unint64_t v4 = (void *)sub_247EBC3C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v4 = 0;
  }
  return v4;
}

void sub_247E9C43C(void *a1, char a2, void *a3)
{
  if (!a1[2])
  {
    swift_bridgeObjectRelease();
    return;
  }
  uint64_t v43 = a1[2];
  uint64_t v7 = a1[4];
  uint64_t v6 = a1[5];
  uint64_t v8 = (void *)a1[6];
  swift_bridgeObjectRetain();
  v9 = (void *)*a3;
  swift_bridgeObjectRetain();
  id v10 = v8;
  unint64_t v12 = sub_247EAF8A4(v7, v6);
  uint64_t v13 = v9[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14)) {
    goto LABEL_23;
  }
  char v16 = v11;
  if (v9[3] >= v15)
  {
    if (a2)
    {
      if (v11) {
        goto LABEL_10;
      }
    }
    else
    {
      sub_247EB76C4();
      if (v16) {
        goto LABEL_10;
      }
    }
LABEL_13:
    v21 = (void *)*a3;
    *(void *)(*a3 + 8 * (v12 >> 6) + 64) |= 1 << v12;
    v22 = (uint64_t *)(v21[6] + 16 * v12);
    uint64_t *v22 = v7;
    v22[1] = v6;
    *(void *)(v21[7] + 8 * v12) = v10;
    uint64_t v23 = v21[2];
    BOOL v24 = __OFADD__(v23, 1);
    uint64_t v25 = v23 + 1;
    if (v24)
    {
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v21[2] = v25;
    uint64_t v26 = v43 - 1;
    if (v43 == 1)
    {
LABEL_22:
      swift_bridgeObjectRelease_n();
      return;
    }
    uint64_t v27 = (void **)(a1 + 9);
    while (1)
    {
      uint64_t v29 = (uint64_t)*(v27 - 2);
      uint64_t v28 = (uint64_t)*(v27 - 1);
      v30 = *v27;
      v31 = (void *)*a3;
      swift_bridgeObjectRetain();
      id v10 = v30;
      unint64_t v32 = sub_247EAF8A4(v29, v28);
      uint64_t v34 = v31[2];
      BOOL v35 = (v33 & 1) == 0;
      BOOL v24 = __OFADD__(v34, v35);
      uint64_t v36 = v34 + v35;
      if (v24) {
        break;
      }
      char v37 = v33;
      if (v31[3] < v36)
      {
        sub_247EB6E5C(v36, 1);
        unint64_t v32 = sub_247EAF8A4(v29, v28);
        if ((v37 & 1) != (v38 & 1)) {
          goto LABEL_25;
        }
      }
      if (v37) {
        goto LABEL_10;
      }
      v39 = (void *)*a3;
      *(void *)(*a3 + 8 * (v32 >> 6) + 64) |= 1 << v32;
      v40 = (uint64_t *)(v39[6] + 16 * v32);
      uint64_t *v40 = v29;
      v40[1] = v28;
      *(void *)(v39[7] + 8 * v32) = v10;
      uint64_t v41 = v39[2];
      BOOL v24 = __OFADD__(v41, 1);
      uint64_t v42 = v41 + 1;
      if (v24) {
        goto LABEL_24;
      }
      v39[2] = v42;
      v27 += 3;
      if (!--v26) {
        goto LABEL_22;
      }
    }
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  sub_247EB6E5C(v15, a2 & 1);
  unint64_t v17 = sub_247EAF8A4(v7, v6);
  if ((v16 & 1) == (v18 & 1))
  {
    unint64_t v12 = v17;
    if ((v16 & 1) == 0) {
      goto LABEL_13;
    }
LABEL_10:
    uint64_t v19 = (void *)swift_allocError();
    swift_willThrow();
    id v20 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2692D0F90);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease_n();
      return;
    }
    goto LABEL_26;
  }
LABEL_25:
  sub_247EBC950();
  __break(1u);
LABEL_26:
  sub_247EBC6A0();
  sub_247EBC480();
  sub_247EBC800();
  sub_247EBC480();
  sub_247EBC830();
  __break(1u);
}

uint64_t sub_247E9C7CC(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_247E9C80C(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_247E9C7EC(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_247E9C9B4(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_247E9C80C(char a1, int64_t a2, char a3, void *a4)
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2692D0F98);
    id v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    id v10 = (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = (unint64_t)(v10 + 4);
  unint64_t v13 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v12 >= v13 + 24 * v8) {
      memmove(v10 + 4, a4 + 4, 24 * v8);
    }
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 24 * v8 || v12 >= v13 + 24 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2692D0FA0);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_247EBC880();
  __break(1u);
  return result;
}

uint64_t sub_247E9C9B4(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2692D0FA8);
    id v10 = (char *)swift_allocObject();
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
    id v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = v10 + 32;
  BOOL v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_247EBC880();
  __break(1u);
  return result;
}

uint64_t sub_247E9CB20(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  uint64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 64;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

uint64_t sub_247E9CBA8(uint64_t a1)
{
  *(void *)(v1 + 264) = a1;
  return MEMORY[0x270FA2498](sub_247E9CBC8, a1, 0);
}

uint64_t sub_247E9CBC8()
{
  uint64_t v1 = *(void *)(v0 + 264);
  swift_beginAccess();
  *(void *)(v0 + 272) = *(void *)(v1 + 128);
  swift_bridgeObjectRetain();
  return MEMORY[0x270FA2498](sub_247E9CC50, 0, 0);
}

uint64_t sub_247E9CC50()
{
  uint64_t v49 = v0;
  uint64_t v1 = *(void *)(v0 + 272);
  int64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v47 = MEMORY[0x263F8EE78];
    sub_247E9C7CC(0, v2, 0);
    uint64_t v3 = sub_247E9CB20(v1);
    if (v3 < 0) {
      goto LABEL_48;
    }
    unint64_t v5 = v3;
    if (v3 >= 1 << *(unsigned char *)(v1 + 32)) {
      goto LABEL_48;
    }
    uint64_t v6 = 0;
    uint64_t v7 = v0 + 128;
    uint64_t v8 = v1 + 64;
    uint64_t v41 = v0 + 32;
    uint64_t v46 = v0 + 200;
    v45 = (void *)(v0 + 144);
    uint64_t v38 = v1 + 80;
    int v39 = v4;
    uint64_t v40 = v1 + 64;
    uint64_t v42 = v1;
    while (1)
    {
      unint64_t v9 = v5 >> 6;
      if ((*(void *)(v8 + 8 * (v5 >> 6)) & (1 << v5)) == 0)
      {
        __break(1u);
LABEL_44:
        __break(1u);
LABEL_45:
        __break(1u);
LABEL_46:
        __break(1u);
LABEL_47:
        __break(1u);
LABEL_48:
        __break(1u);
        JUMPOUT(0x247E9D1C8);
      }
      if (*(_DWORD *)(v1 + 36) != v4) {
        goto LABEL_44;
      }
      uint64_t v43 = v6;
      uint64_t v10 = *(void *)(v1 + 56);
      int64_t v11 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v5);
      uint64_t v12 = *v11;
      unint64_t v13 = v11[1];
      sub_247E9D384(v10 + 40 * v5, v41);
      *(void *)(v0 + 16) = v12;
      *(void *)(v0 + 24) = v13;
      *(void *)(v0 + 72) = v12;
      *(void *)(v0 + 80) = v13;
      sub_247E9D384(v41, v0 + 88);
      long long v14 = *(_OWORD *)(v0 + 88);
      *(_OWORD *)uint64_t v7 = *(_OWORD *)(v0 + 72);
      *(_OWORD *)(v7 + 16) = v14;
      *(_OWORD *)(v7 + 32) = *(_OWORD *)(v0 + 104);
      *(void *)(v7 + 48) = *(void *)(v0 + 120);
      sub_247E9D3E8(v12, v13);
      sub_247E9D3E8(v12, v13);
      sub_247E9D3FC(v0 + 16);
      uint64_t v16 = *(void *)(v0 + 128);
      unint64_t v15 = *(void *)(v0 + 136);
      *(void *)(v0 + 184) = v16;
      *(void *)(v0 + 192) = v15;
      sub_247E9D384((uint64_t)v45, v46);
      unint64_t v17 = 0x8000000247EBE3F0;
      unint64_t v18 = 0xD000000000000014;
      switch(v15)
      {
        case 0uLL:
          unint64_t v17 = 0xE800000000000000;
          unint64_t v18 = 0x6E6F697461727564;
          break;
        case 1uLL:
          unint64_t v17 = 0xE700000000000000;
          unint64_t v18 = 0x656D6F6374756FLL;
          break;
        case 2uLL:
          unint64_t v17 = 0xE700000000000000;
          unint64_t v18 = 0x6572756C696166;
          break;
        case 3uLL:
          unint64_t v17 = 0xEA0000000000746ELL;
          unint64_t v18 = 0x756F437972746572;
          break;
        case 4uLL:
          break;
        case 5uLL:
          uint64_t v19 = "@\"NSDictionary\"8@?0";
          goto LABEL_15;
        case 6uLL:
          unint64_t v18 = 0xD00000000000001DLL;
          uint64_t v19 = "lecaresupport.auth";
LABEL_15:
          unint64_t v17 = (unint64_t)v19 | 0x8000000000000000;
          break;
        default:
          v48[0] = 0x6E6F697461727564;
          v48[1] = 0xEB00000000726F46;
          sub_247E9D3E8(v16, v15);
          sub_247EBC480();
          sub_247E9D58C(v16, v15);
          unint64_t v18 = 0x6E6F697461727564;
          unint64_t v17 = 0xEB00000000726F46;
          break;
      }
      unint64_t v44 = v17;
      uint64_t v20 = *(void *)(v0 + 168);
      uint64_t v21 = *(void *)(v0 + 176);
      __swift_project_boxed_opaque_existential_1(v45, v20);
      uint64_t v22 = (*(uint64_t (**)(uint64_t, uint64_t))(v21 + 8))(v20, v21);
      __swift_destroy_boxed_opaque_existential_1(v46);
      sub_247E9D3FC(v7);
      uint64_t v23 = v47;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_247E9C7CC(0, *(void *)(v47 + 16) + 1, 1);
        uint64_t v23 = v47;
      }
      unint64_t v25 = *(void *)(v23 + 16);
      unint64_t v24 = *(void *)(v23 + 24);
      if (v25 >= v24 >> 1)
      {
        sub_247E9C7CC(v24 > 1, v25 + 1, 1);
        uint64_t v23 = v47;
      }
      *(void *)(v23 + 16) = v25 + 1;
      uint64_t v26 = (void *)(v23 + 24 * v25);
      v26[4] = v18;
      v26[5] = v44;
      v26[6] = v22;
      uint64_t v1 = v42;
      uint64_t v27 = 1 << *(unsigned char *)(v42 + 32);
      if ((uint64_t)v5 >= v27) {
        goto LABEL_45;
      }
      uint64_t v8 = v40;
      uint64_t v28 = *(void *)(v40 + 8 * v9);
      if ((v28 & (1 << v5)) == 0) {
        goto LABEL_46;
      }
      int v4 = v39;
      if (*(_DWORD *)(v42 + 36) != v39) {
        goto LABEL_47;
      }
      unint64_t v29 = v28 & (-2 << (v5 & 0x3F));
      if (v29)
      {
        unint64_t v5 = __clz(__rbit64(v29)) | v5 & 0xFFFFFFFFFFFFFFC0;
        uint64_t v7 = v0 + 128;
        int64_t v30 = v2;
        goto LABEL_32;
      }
      unint64_t v31 = v9 + 1;
      unint64_t v32 = (unint64_t)(v27 + 63) >> 6;
      uint64_t v7 = v0 + 128;
      int64_t v30 = v2;
      if (v9 + 1 < v32)
      {
        unint64_t v33 = *(void *)(v40 + 8 * v31);
        if (v33)
        {
LABEL_30:
          unint64_t v5 = __clz(__rbit64(v33)) + (v31 << 6);
          goto LABEL_32;
        }
        while (v32 - 2 != v9)
        {
          unint64_t v33 = *(void *)(v38 + 8 * v9++);
          if (v33)
          {
            unint64_t v31 = v9 + 1;
            goto LABEL_30;
          }
        }
      }
      unint64_t v5 = 1 << *(unsigned char *)(v42 + 32);
LABEL_32:
      uint64_t v6 = v43 + 1;
      if (v43 + 1 == v30)
      {
        swift_bridgeObjectRelease();
        if (*(void *)(v23 + 16)) {
          goto LABEL_37;
        }
LABEL_39:
        uint64_t v34 = MEMORY[0x263F8EE80];
        goto LABEL_40;
      }
      if ((v5 & 0x8000000000000000) != 0 || (uint64_t)v5 >= v27) {
        goto LABEL_48;
      }
    }
  }
  swift_bridgeObjectRelease();
  if (!*(void *)(MEMORY[0x263F8EE78] + 16)) {
    goto LABEL_39;
  }
LABEL_37:
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692D0F80);
  uint64_t v34 = sub_247EBC870();
LABEL_40:
  v48[0] = v34;
  BOOL v35 = (void *)swift_bridgeObjectRetain();
  sub_247E9C43C(v35, 1, v48);
  uint64_t v36 = *(void *)(v0 + 264);
  swift_bridgeObjectRelease();
  *(void *)(v0 + 280) = v48[0];
  return MEMORY[0x270FA2498](sub_247E9D1E4, v36, 0);
}

uint64_t sub_247E9D1E4()
{
  uint64_t v1 = v0[33];
  v0[36] = *(void *)(v1 + 112);
  v0[37] = *(void *)(v1 + 120);
  swift_bridgeObjectRetain();
  return MEMORY[0x270FA2498](sub_247E9D260, 0, 0);
}

void sub_247E9D260()
{
  if (v0[37])
  {
    uint64_t v1 = v0[35];
    int64_t v2 = (void *)sub_247EBC400();
    swift_bridgeObjectRelease();
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = v1;
    v0[6] = sub_247E9D56C;
    v0[7] = v3;
    v0[2] = MEMORY[0x263EF8330];
    v0[3] = 1107296256;
    v0[4] = sub_247E9C3B0;
    v0[5] = &block_descriptor;
    int v4 = _Block_copy(v0 + 2);
    swift_release();
    AnalyticsSendEventLazy();
    _Block_release(v4);

    unint64_t v5 = (void (*)(void))v0[1];
    v5();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_247E9D384(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_247E9D3E8(uint64_t a1, unint64_t a2)
{
  if (a2 >= 7) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_247E9D3FC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D0F78);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
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

uint64_t sub_247E9D534()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_247E9D56C()
{
  return swift_bridgeObjectRetain();
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

uint64_t sub_247E9D58C(uint64_t a1, unint64_t a2)
{
  if (a2 >= 7) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_247E9D5A0()
{
  unint64_t result = qword_2692D0F88;
  if (!qword_2692D0F88)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2692D0F88);
  }
  return result;
}

ValueMetadata *type metadata accessor for CoreAnalyticsReporter()
{
  return &type metadata for CoreAnalyticsReporter;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for RequestManagerError(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for RequestManagerError(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)unint64_t result = (a2 - 1);
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
  *(unsigned char *)(result + 8) = v3;
  return result;
}

uint64_t sub_247E9D64C()
{
  return 0;
}

ValueMetadata *type metadata accessor for RequestManagerError()
{
  return &type metadata for RequestManagerError;
}

BOOL sub_247E9D668(void *a1, void *a2)
{
  return *a1 == *a2;
}

void sub_247E9D67C()
{
  id v0 = objc_msgSend(self, sel_defaultSessionConfiguration);
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F29120]), sel_init);
  objc_msgSend(v0, sel_set_appleIDContext_, v1);

  qword_2692D2D30 = (uint64_t)v0;
}

uint64_t initializeBufferWithCopyOfBuffer for AuthenticationHeadersProvider(uint64_t a1, uint64_t a2)
{
  char v3 = *(void **)a2;
  int v4 = *(void **)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  id v5 = v3;
  id v6 = v4;
  return a1;
}

void destroy for AuthenticationHeadersProvider(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 8);
}

uint64_t assignWithCopy for AuthenticationHeadersProvider(uint64_t a1, uint64_t a2)
{
  int v4 = *(void **)a1;
  id v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  uint64_t v7 = *(void **)(a1 + 8);
  uint64_t v8 = *(void **)(a2 + 8);
  *(void *)(a1 + 8) = v8;
  id v9 = v8;

  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for AuthenticationHeadersProvider(uint64_t a1, uint64_t a2)
{
  int v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for AuthenticationHeadersProvider(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 17)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AuthenticationHeadersProvider(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(void *)__n128 result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AuthenticationHeadersProvider()
{
  return &type metadata for AuthenticationHeadersProvider;
}

unint64_t sub_247E9D8EC(uint64_t a1, char a2)
{
  if (a2)
  {
    unint64_t result = 0xD000000000000019;
    switch(a1)
    {
      case 1:
        unint64_t result = 0xD000000000000021;
        break;
      case 2:
        unint64_t result = 0xD000000000000018;
        break;
      case 3:
        return result;
      case 4:
        unint64_t result = 0xD000000000000020;
        break;
      default:
        unint64_t result = 0xD000000000000012;
        break;
    }
  }
  else
  {
    sub_247EBC6A0();
    sub_247EBC480();
    type metadata accessor for ACAccountCredentialRenewResult(0);
    sub_247EBC800();
    return 0;
  }
  return result;
}

unint64_t sub_247E9DA30()
{
  return sub_247E9D8EC(*(void *)v0, *(unsigned char *)(v0 + 8));
}

void sub_247E9DA3C(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D0FE0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388]();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  unint64_t v9 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v10 + v9, (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  aBlock[4] = sub_247E9F284;
  aBlock[5] = v10;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_247E9DE24;
  aBlock[3] = &block_descriptor_0;
  int64_t v11 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(a2, sel_authenticateWithContext_completion_, a3, v11);
  _Block_release(v11);
}

void sub_247E9DBEC(uint64_t a1, id a2)
{
  if (a2)
  {
    *(void *)&long long v14 = a2;
    id v2 = a2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2692D0FE0);
    sub_247EBC4D0();
    return;
  }
  if (!a1) {
    goto LABEL_10;
  }
  uint64_t v4 = sub_247EBC430();
  if (!*(void *)(a1 + 16) || (sub_247EAF8A4(v4, v5), (v6 & 1) == 0))
  {
    swift_bridgeObjectRelease();
LABEL_10:
    uint64_t v8 = 0;
    long long v14 = 0u;
    long long v15 = 0u;
LABEL_11:
    sub_247E9F320((uint64_t)&v14);
    goto LABEL_12;
  }
  swift_unknownObjectRetain();
  swift_bridgeObjectRelease();
  self;
  uint64_t v7 = (void *)swift_dynamicCastObjCClass();
  if (!v7)
  {
    swift_unknownObjectRelease();
    goto LABEL_10;
  }
  uint64_t v8 = v7;
  *(void *)&v13[0] = 0xD000000000000022;
  *((void *)&v13[0] + 1) = 0x8000000247EBE340;
  id v9 = v7;
  id v10 = objc_msgSend(v9, sel___swift_objectForKeyedSubscript_, sub_247EBC940());
  swift_unknownObjectRelease();

  if (v10)
  {
    sub_247EBC650();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v13, 0, sizeof(v13));
  }
  sub_247E9F380((uint64_t)v13, (uint64_t)&v14);
  if (!*((void *)&v15 + 1)) {
    goto LABEL_11;
  }
  if (swift_dynamicCast())
  {
    long long v14 = v13[0];
    __swift_instantiateConcreteTypeFromMangledName(&qword_2692D0FE0);
    sub_247EBC4E0();

    return;
  }
LABEL_12:
  sub_247E9F0F0();
  uint64_t v11 = swift_allocError();
  *(void *)uint64_t v12 = 2;
  *(unsigned char *)(v12 + 8) = 1;
  *(void *)&long long v14 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692D0FE0);
  sub_247EBC4D0();
}

uint64_t sub_247E9DE24(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a2;
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2692D0FE8);
    uint64_t v4 = sub_247EBC3D0();
  }
  swift_retain();
  id v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

unint64_t sub_247E9DECC()
{
  return 0xD00000000000001DLL;
}

uint64_t sub_247E9DEE8(uint64_t a1)
{
  uint64_t v4 = *v1;
  uint64_t v5 = v1[1];
  uint64_t v6 = *((unsigned __int8 *)v1 + 16);
  id v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_2692D0FB8 + dword_2692D0FB8);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_247E9BFBC;
  return v9(a1, v4, v5, v6);
}

uint64_t sub_247E9DFB0(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return MEMORY[0x270FA2498](sub_247E9DFD0, 0, 0);
}

uint64_t sub_247E9DFD0()
{
  id v1 = (void *)v0[4];
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F29110]), sel_init);
  v0[6] = v2;
  objc_msgSend(v2, sel_setAuthenticationType_, 1);
  objc_msgSend(v2, sel_setIsUsernameEditable_, 0);
  objc_msgSend(v2, sel_setServiceType_, 1);
  uint64_t v3 = (void *)sub_247EBC400();
  objc_msgSend(v2, sel_setServiceIdentifier_, v3);

  objc_msgSend(v2, sel_setShouldUpdatePersistentServiceTokens_, 1);
  id v4 = objc_msgSend(v1, sel_aida_alternateDSID);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = sub_247EBC430();
    unint64_t v8 = v7;
    swift_bridgeObjectRelease();
    uint64_t v9 = HIBYTE(v8) & 0xF;
    if ((v8 & 0x2000000000000000) == 0) {
      uint64_t v9 = v6 & 0xFFFFFFFFFFFFLL;
    }
    if (v9) {
      objc_msgSend(v2, sel_setAltDSID_, v5);
    }
  }
  uint64_t v10 = (void *)v0[5];
  if (v10)
  {
    uint64_t v11 = swift_task_alloc();
    v0[7] = v11;
    *(void *)(v11 + 16) = v10;
    *(void *)(v11 + 24) = v2;
    id v12 = v10;
    unint64_t v13 = (void *)swift_task_alloc();
    v0[8] = v13;
    *unint64_t v13 = v0;
    v13[1] = sub_247E9E260;
    uint64_t v14 = MEMORY[0x263F8D310];
    return MEMORY[0x270FA2360](v0 + 2, 0, 0, 0xD000000000000018, 0x8000000247EBE4D0, sub_247E9F1E8, v11, v14);
  }
  else
  {
    sub_247E9F0F0();
    swift_allocError();
    *(void *)uint64_t v15 = 1;
    *(unsigned char *)(v15 + 8) = 1;
    swift_willThrow();

    uint64_t v16 = (uint64_t (*)(void))v0[1];
    return v16();
  }
}

uint64_t sub_247E9E260()
{
  *(void *)(*(void *)v1 + 72) = v0;
  swift_task_dealloc();
  if (v0)
  {
    id v2 = sub_247E9E3E8;
  }
  else
  {
    swift_task_dealloc();
    id v2 = sub_247E9E37C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_247E9E37C()
{
  uint64_t v1 = *(void **)(v0 + 40);

  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return v4(v2, v3);
}

uint64_t sub_247E9E3E8()
{
  uint64_t v1 = *(void **)(v0 + 40);

  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_247E9E45C(uint64_t a1, uint64_t a2, char a3)
{
  *(unsigned char *)(v3 + 80) = a3;
  *(void *)(v3 + 16) = a1;
  *(void *)(v3 + 24) = a2;
  uint64_t v4 = sub_247EBC3B0();
  *(void *)(v3 + 32) = v4;
  *(void *)(v3 + 40) = *(void *)(v4 - 8);
  *(void *)(v3 + 48) = swift_task_alloc();
  *(void *)(v3 + 56) = swift_task_alloc();
  *(void *)(v3 + 64) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_247E9E53C, 0, 0);
}

uint64_t sub_247E9E53C()
{
  if (*(unsigned char *)(v0 + 80))
  {
    if (qword_2692D0DB8 != -1) {
      swift_once();
    }
    uint64_t v2 = (uint64_t *)(v0 + 56);
    uint64_t v1 = *(void *)(v0 + 56);
    uint64_t v3 = *(void *)(v0 + 32);
    uint64_t v4 = *(void *)(v0 + 40);
    uint64_t v5 = __swift_project_value_buffer(v3, (uint64_t)qword_2692D2D78);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v1, v5, v3);
    uint64_t v6 = sub_247EBC390();
    os_log_type_t v7 = sub_247EBC5E0();
    if (os_log_type_enabled(v6, v7))
    {
      unint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v8 = 0;
      uint64_t v9 = "Forcing GS token refresh due to retry…";
LABEL_18:
      _os_log_impl(&dword_247E99000, v6, v7, v9, v8, 2u);
      uint64_t v32 = *v2;
      MEMORY[0x24C56FD50](v8, -1, -1);
LABEL_20:
      uint64_t v33 = *(void *)(v0 + 32);
      uint64_t v34 = *(void *)(v0 + 40);

      (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v32, v33);
      BOOL v35 = (void *)swift_task_alloc();
      *(void *)(v0 + 72) = v35;
      *BOOL v35 = v0;
      v35[1] = sub_247E9E95C;
      uint64_t v36 = *(void *)(v0 + 24);
      v35[4] = *(void *)(v0 + 16);
      v35[5] = v36;
      return MEMORY[0x270FA2498](sub_247E9DFD0, 0, 0);
    }
    goto LABEL_19;
  }
  uint64_t v10 = *(void **)(v0 + 16);
  uint64_t v11 = (void *)sub_247EBC400();
  id v12 = objc_msgSend(v10, sel_aida_tokenWithExpiryCheckForService_, v11);

  if (!v12)
  {
    if (qword_2692D0DB8 != -1) {
      swift_once();
    }
    uint64_t v2 = (uint64_t *)(v0 + 48);
    uint64_t v28 = *(void *)(v0 + 48);
    uint64_t v29 = *(void *)(v0 + 32);
    uint64_t v30 = *(void *)(v0 + 40);
    uint64_t v31 = __swift_project_value_buffer(v29, (uint64_t)qword_2692D2D78);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v30 + 16))(v28, v31, v29);
    uint64_t v6 = sub_247EBC390();
    os_log_type_t v7 = sub_247EBC5E0();
    if (os_log_type_enabled(v6, v7))
    {
      unint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v8 = 0;
      uint64_t v9 = "Did not find cached valid GS token, fetching a new one…";
      goto LABEL_18;
    }
LABEL_19:
    uint64_t v32 = *v2;
    goto LABEL_20;
  }
  uint64_t v13 = sub_247EBC430();
  uint64_t v15 = v14;

  if (qword_2692D0DB8 != -1) {
    swift_once();
  }
  uint64_t v16 = *(void *)(v0 + 64);
  uint64_t v17 = *(void *)(v0 + 32);
  uint64_t v18 = *(void *)(v0 + 40);
  uint64_t v19 = __swift_project_value_buffer(v17, (uint64_t)qword_2692D2D78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v16, v19, v17);
  uint64_t v20 = sub_247EBC390();
  os_log_type_t v21 = sub_247EBC5E0();
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v22 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v22 = 0;
    _os_log_impl(&dword_247E99000, v20, v21, "Using cached GS token", v22, 2u);
    MEMORY[0x24C56FD50](v22, -1, -1);
  }
  uint64_t v23 = *(void *)(v0 + 64);
  uint64_t v24 = *(void *)(v0 + 32);
  uint64_t v25 = *(void *)(v0 + 40);

  (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v23, v24);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v26 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return v26(v13, v15);
}

uint64_t sub_247E9E95C(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v3;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = swift_task_dealloc();
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8);
  if (!v2)
  {
    uint64_t v7 = a1;
    uint64_t v8 = a2;
  }
  return v9(v7, v8);
}

uint64_t sub_247E9EAD0(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  *(unsigned char *)(v4 + 160) = a4;
  *(void *)(v4 + 80) = a2;
  *(void *)(v4 + 88) = a3;
  uint64_t v5 = sub_247EBC460();
  *(void *)(v4 + 96) = v5;
  *(void *)(v4 + 104) = *(void *)(v5 - 8);
  *(void *)(v4 + 112) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_247E9EB94, 0, 0);
}

uint64_t sub_247E9EB94()
{
  uint64_t v1 = *(void **)(v0 + 80);
  if (v1)
  {
    id v2 = v1;
    id v3 = objc_msgSend(v2, sel_aida_accountForPrimaryiCloudAccount);
    *(void *)(v0 + 120) = v3;
    if (v3)
    {
      uint64_t v4 = (uint64_t)v3;
      uint64_t v5 = (void *)swift_task_alloc();
      *(void *)(v0 + 128) = v5;
      *uint64_t v5 = v0;
      v5[1] = sub_247E9ECD8;
      char v6 = *(unsigned char *)(v0 + 160);
      uint64_t v7 = *(void *)(v0 + 88);
      return sub_247E9E45C(v4, v7, v6);
    }
  }
  sub_247E9F0F0();
  swift_allocError();
  *(void *)uint64_t v9 = 0;
  *(unsigned char *)(v9 + 8) = 1;
  swift_willThrow();
  swift_task_dealloc();
  uint64_t v10 = *(uint64_t (**)(void))(v0 + 8);
  return v10();
}

uint64_t sub_247E9ECD8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)*v3;
  v4[17] = a1;
  v4[18] = a2;
  v4[19] = v2;
  swift_task_dealloc();
  if (v2) {
    uint64_t v5 = sub_247E9F07C;
  }
  else {
    uint64_t v5 = sub_247E9EDF0;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_247E9EDF0()
{
  id v1 = objc_msgSend(*(id *)(v0 + 120), sel_aida_alternateDSID);
  if (!v1)
  {
    uint64_t v9 = *(void **)(v0 + 120);
    uint64_t v10 = *(void **)(v0 + 80);
    swift_bridgeObjectRelease();
    sub_247E9F0F0();
    swift_allocError();
    uint64_t v12 = 3;
    goto LABEL_5;
  }
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)(v0 + 104);
  uint64_t v3 = *(void *)(v0 + 112);
  uint64_t v5 = *(void *)(v0 + 96);
  sub_247EBC430();

  sub_247EBC480();
  sub_247EBC480();
  swift_bridgeObjectRelease();
  sub_247EBC450();
  uint64_t v6 = sub_247EBC440();
  unint64_t v8 = v7;
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  if (v8 >> 60 == 15)
  {
    uint64_t v9 = *(void **)(v0 + 120);
    uint64_t v10 = *(void **)(v0 + 80);
    sub_247E9F0F0();
    swift_allocError();
    uint64_t v12 = 4;
LABEL_5:
    *(void *)uint64_t v11 = v12;
    *(unsigned char *)(v11 + 8) = 1;
    swift_willThrow();

    swift_task_dealloc();
    uint64_t v13 = *(uint64_t (**)(void))(v0 + 8);
    return v13();
  }
  uint64_t v15 = *(void **)(v0 + 120);
  uint64_t v16 = *(void **)(v0 + 80);
  uint64_t v17 = sub_247EBC2D0();
  uint64_t v19 = v18;
  sub_247E9F144(v6, v8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692D0FD0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_247EBD6D0;
  *(void *)(inited + 32) = 0xD000000000000010;
  *(void *)(inited + 40) = 0x8000000247EBE4B0;
  *(void *)(inited + 48) = v17;
  *(void *)(inited + 56) = v19;
  unint64_t v21 = sub_247EAF0E8(inited);

  swift_task_dealloc();
  uint64_t v22 = *(uint64_t (**)(unint64_t))(v0 + 8);
  return v22(v21);
}

uint64_t sub_247E9F07C()
{
  id v1 = *(void **)(v0 + 80);

  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

unint64_t sub_247E9F0F0()
{
  unint64_t result = qword_2692D0FC0;
  if (!qword_2692D0FC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_2692D0FC0);
  }
  return result;
}

uint64_t sub_247E9F144(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_247E9F158(a1, a2);
  }
  return a1;
}

uint64_t sub_247E9F158(uint64_t a1, unint64_t a2)
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

void sub_247E9F1E8(uint64_t a1)
{
  sub_247E9DA3C(a1, *(void **)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_247E9F1F0()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D0FE0);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

void sub_247E9F284(uint64_t a1, void *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692D0FE0);
  sub_247E9DBEC(a1, a2);
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

uint64_t sub_247E9F320(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2692D0FF0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_247E9F380(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2692D0FF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)uint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for AuthenticationHeadersProvider.AuthenticationError(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for AuthenticationHeadersProvider.AuthenticationError(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)uint64_t result = 0;
    *(unsigned char *)(result + 8) = 0;
    *(_DWORD *)uint64_t result = a2 - 1;
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
  *(unsigned char *)(result + 9) = v3;
  return result;
}

uint64_t sub_247E9F44C(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_247E9F468(uint64_t result, int a2)
{
  if (a2)
  {
    *(void *)uint64_t result = (a2 - 1);
    *(unsigned char *)(result + 8) = 1;
  }
  else
  {
    *(unsigned char *)(result + 8) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for AuthenticationHeadersProvider.AuthenticationError()
{
  return &type metadata for AuthenticationHeadersProvider.AuthenticationError;
}

void destroy for HTTPHeadersProviderError(uint64_t a1)
{
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void **)(a1 + 16);
}

void *_s16AppleCareSupport24HTTPHeadersProviderErrorVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = (void *)a2[2];
  swift_bridgeObjectRetain();
  id v5 = v4;
  a1[2] = v4;
  return a1;
}

void *assignWithCopy for HTTPHeadersProviderError(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)a2[2];
  id v5 = v4;
  uint64_t v6 = (void *)a1[2];
  a1[2] = v4;

  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for HTTPHeadersProviderError(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  return a1;
}

uint64_t getEnumTagSinglePayload for HTTPHeadersProviderError(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HTTPHeadersProviderError(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
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
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HTTPHeadersProviderError()
{
  return &type metadata for HTTPHeadersProviderError;
}

uint64_t initializeBufferWithCopyOfBuffer for HandoffRequest(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for HandoffRequest()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for HandoffRequest(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for HandoffRequest(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for HandoffRequest(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for HandoffRequest(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HandoffRequest(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 56) = 1;
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
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HandoffRequest()
{
  return &type metadata for HandoffRequest;
}

uint64_t sub_247E9F930(char a1)
{
  return *(void *)&aSource_0[8 * a1];
}

BOOL sub_247E9F950(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_247E9F964()
{
  return sub_247EBC9F0();
}

uint64_t sub_247E9F9AC()
{
  return sub_247EBC9E0();
}

uint64_t sub_247E9F9D8()
{
  return sub_247EBC9F0();
}

uint64_t sub_247E9FA1C()
{
  return sub_247E9F930(*v0);
}

uint64_t sub_247E9FA24@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_247EA0108(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_247E9FA4C()
{
  return 0;
}

void sub_247E9FA58(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_247E9FA64(uint64_t a1)
{
  unint64_t v2 = sub_247E9FD98();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247E9FAA0(uint64_t a1)
{
  unint64_t v2 = sub_247E9FD98();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247E9FADC(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D1000);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  unint64_t v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247E9FD98();
  sub_247EBCA10();
  char v14 = 0;
  sub_247EBC8E0();
  if (!v2)
  {
    char v13 = 1;
    sub_247EBC8E0();
    char v12 = 2;
    sub_247EBC8E0();
    uint64_t v11 = *(void *)(v3 + 48);
    v10[15] = 3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2692D1010);
    sub_247EA062C(&qword_2692D1018);
    sub_247EBC8F0();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

double sub_247E9FCD4@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_247EA0294(a1, (uint64_t *)v6);
  if (!v2)
  {
    long long v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + 16) = v5;
    double result = *(double *)&v7;
    *(_OWORD *)(a2 + 32) = v7;
    *(void *)(a2 + 48) = v8;
  }
  return result;
}

uint64_t sub_247E9FD24(void *a1)
{
  return sub_247E9FADC(a1);
}

uint64_t sub_247E9FD3C(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a1 + 16);
  v5[0] = *(_OWORD *)a1;
  v5[1] = v2;
  v5[2] = *(_OWORD *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);
  long long v3 = *(_OWORD *)(a2 + 16);
  v7[0] = *(_OWORD *)a2;
  v7[1] = v3;
  v7[2] = *(_OWORD *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 48);
  return sub_247EA0054(v5, v7) & 1;
}

unint64_t sub_247E9FD98()
{
  unint64_t result = qword_2692D1008;
  if (!qword_2692D1008)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692D1008);
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

uint64_t sub_247E9FE34(uint64_t result, uint64_t a2)
{
  if (result == a2) {
    return 1;
  }
  uint64_t v3 = result;
  if (*(void *)(result + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v4 = 0;
  uint64_t v5 = result + 64;
  uint64_t v6 = 1 << *(unsigned char *)(result + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(result + 64);
  int64_t v27 = (unint64_t)(v6 + 63) >> 6;
  while (1)
  {
    if (v8)
    {
      unint64_t v9 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v10 = v9 | (v4 << 6);
      goto LABEL_25;
    }
    int64_t v11 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_36;
    }
    if (v11 >= v27) {
      return 1;
    }
    unint64_t v12 = *(void *)(v5 + 8 * v11);
    ++v4;
    if (!v12)
    {
      int64_t v4 = v11 + 1;
      if (v11 + 1 >= v27) {
        return 1;
      }
      unint64_t v12 = *(void *)(v5 + 8 * v4);
      if (!v12)
      {
        int64_t v4 = v11 + 2;
        if (v11 + 2 >= v27) {
          return 1;
        }
        unint64_t v12 = *(void *)(v5 + 8 * v4);
        if (!v12)
        {
          int64_t v4 = v11 + 3;
          if (v11 + 3 >= v27) {
            return 1;
          }
          unint64_t v12 = *(void *)(v5 + 8 * v4);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_24:
    unint64_t v8 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v4 << 6);
LABEL_25:
    uint64_t v14 = 16 * v10;
    uint64_t v15 = (uint64_t *)(*(void *)(v3 + 48) + v14);
    uint64_t v16 = *v15;
    uint64_t v17 = v15[1];
    uint64_t v18 = (uint64_t *)(*(void *)(v3 + 56) + v14);
    uint64_t v20 = *v18;
    uint64_t v19 = v18[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v21 = sub_247EAF8A4(v16, v17);
    char v23 = v22;
    swift_bridgeObjectRelease();
    if ((v23 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      return 0;
    }
    uint64_t v24 = (void *)(*(void *)(a2 + 56) + 16 * v21);
    if (*v24 == v20 && v24[1] == v19)
    {
      uint64_t result = swift_bridgeObjectRelease();
    }
    else
    {
      char v26 = sub_247EBC910();
      uint64_t result = swift_bridgeObjectRelease();
      if ((v26 & 1) == 0) {
        return 0;
      }
    }
  }
  int64_t v13 = v11 + 4;
  if (v13 >= v27) {
    return 1;
  }
  unint64_t v12 = *(void *)(v5 + 8 * v13);
  if (v12)
  {
    int64_t v4 = v13;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v4 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      break;
    }
    if (v4 >= v27) {
      return 1;
    }
    unint64_t v12 = *(void *)(v5 + 8 * v4);
    ++v13;
    if (v12) {
      goto LABEL_24;
    }
  }
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_247EA0054(void *a1, void *a2)
{
  BOOL v4 = *a1 == *a2 && a1[1] == a2[1];
  if (!v4 && (sub_247EBC910() & 1) == 0) {
    return 0;
  }
  BOOL v5 = a1[2] == a2[2] && a1[3] == a2[3];
  if (!v5 && (sub_247EBC910() & 1) == 0 || (a1[4] != a2[4] || a1[5] != a2[5]) && (sub_247EBC910() & 1) == 0) {
    return 0;
  }
  uint64_t v6 = a1[6];
  uint64_t v7 = a2[6];
  return sub_247E9FE34(v6, v7);
}

uint64_t sub_247EA0108(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x656372756F73 && a2 == 0xE600000000000000;
  if (v3 || (sub_247EBC910() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x72656C6C6163 && a2 == 0xE600000000000000 || (sub_247EBC910() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6575737369 && a2 == 0xE500000000000000 || (sub_247EBC910() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x736E6F6974706FLL && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_247EBC910();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_247EA0294@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D1020);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  unint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v26 = sub_247EAF0E8(MEMORY[0x263F8EE78]);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247E9FD98();
  sub_247EBCA00();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v25 = a2;
    char v31 = 0;
    uint64_t v9 = sub_247EBC8C0();
    uint64_t v11 = v10;
    char v30 = 1;
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_247EBC8C0();
    uint64_t v24 = v13;
    uint64_t v22 = v12;
    uint64_t v23 = v9;
    char v29 = 2;
    swift_bridgeObjectRetain();
    uint64_t v21 = sub_247EBC8C0();
    uint64_t v15 = v14;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2692D1010);
    char v28 = 3;
    sub_247EA062C(&qword_2692D1028);
    swift_bridgeObjectRetain();
    sub_247EBC8D0();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    uint64_t v16 = v27;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v17 = v24;
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v19 = v25;
    uint64_t *v25 = v23;
    v19[1] = v11;
    v19[2] = v22;
    v19[3] = v17;
    v19[4] = v21;
    v19[5] = v15;
    v19[6] = v16;
  }
  return result;
}

uint64_t sub_247EA062C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2692D1010);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for HandoffRequest.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for HandoffRequest.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 3;
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
        JUMPOUT(0x247EA07F8);
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
          *uint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

uint64_t sub_247EA0820(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_247EA0828(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for HandoffRequest.CodingKeys()
{
  return &type metadata for HandoffRequest.CodingKeys;
}

unint64_t sub_247EA0844()
{
  unint64_t result = qword_2692D1030;
  if (!qword_2692D1030)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692D1030);
  }
  return result;
}

unint64_t sub_247EA089C()
{
  unint64_t result = qword_2692D1038;
  if (!qword_2692D1038)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692D1038);
  }
  return result;
}

unint64_t sub_247EA08F4()
{
  unint64_t result = qword_2692D1040;
  if (!qword_2692D1040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_2692D1040);
  }
  return result;
}

uint64_t sub_247EA0948(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[5] = a3;
  v4[6] = v3;
  v4[3] = a1;
  v4[4] = a2;
  return MEMORY[0x270FA2498](sub_247EA096C, 0, 0);
}

uint64_t sub_247EA096C()
{
  uint64_t v2 = v0[5];
  uint64_t v1 = v0[6];
  uint64_t v4 = v0[3];
  uint64_t v3 = v0[4];
  uint64_t v5 = sub_247EBC1B0();
  v0[7] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v0[8] = v6;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v4, v3, v5);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D1010);
  int v8 = (void *)swift_task_alloc();
  v0[9] = v8;
  v8[2] = v1;
  v8[3] = v4;
  v8[4] = v2;
  uint64_t v9 = (void *)swift_task_alloc();
  v0[10] = v9;
  void *v9 = v0;
  v9[1] = sub_247EA0AD4;
  return MEMORY[0x270FA22B8](v0 + 2, v7, v7, 0, 0, &unk_2692D1108, v8, v7);
}

uint64_t sub_247EA0AD4()
{
  *(void *)(*(void *)v1 + 88) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_247EA0DE8;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_247EA0BF0;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_247EA0BF0()
{
  int64_t v1 = 0;
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v2 + 64);
  uint64_t v13 = v2 + 64;
  uint64_t v4 = -1;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  if (-v5 < 64) {
    uint64_t v4 = ~(-1 << -(char)v5);
  }
  uint64_t v6 = v4 & v3;
  int64_t v7 = (unint64_t)(63 - v5) >> 6;
  while (1)
  {
    if (v6)
    {
      v6 &= v6 - 1;
      goto LABEL_5;
    }
    int64_t v9 = v1 + 1;
    if (__OFADD__(v1, 1))
    {
      __break(1u);
LABEL_27:
      __break(1u);
      return result;
    }
    if (v9 >= v7) {
      goto LABEL_23;
    }
    uint64_t v10 = *(void *)(v13 + 8 * v9);
    ++v1;
    if (!v10)
    {
      int64_t v1 = v9 + 1;
      if (v9 + 1 >= v7) {
        goto LABEL_23;
      }
      uint64_t v10 = *(void *)(v13 + 8 * v1);
      if (!v10)
      {
        int64_t v1 = v9 + 2;
        if (v9 + 2 >= v7) {
          goto LABEL_23;
        }
        uint64_t v10 = *(void *)(v13 + 8 * v1);
        if (!v10)
        {
          int64_t v1 = v9 + 3;
          if (v9 + 3 >= v7) {
            goto LABEL_23;
          }
          uint64_t v10 = *(void *)(v13 + 8 * v1);
          if (!v10) {
            break;
          }
        }
      }
    }
LABEL_22:
    uint64_t v6 = (v10 - 1) & v10;
LABEL_5:
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_247EBC1A0();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v11 = v9 + 4;
  if (v11 < v7)
  {
    uint64_t v10 = *(void *)(v13 + 8 * v11);
    if (!v10)
    {
      while (1)
      {
        int64_t v1 = v11 + 1;
        if (__OFADD__(v11, 1)) {
          goto LABEL_27;
        }
        if (v1 >= v7) {
          goto LABEL_23;
        }
        uint64_t v10 = *(void *)(v13 + 8 * v1);
        ++v11;
        if (v10) {
          goto LABEL_22;
        }
      }
    }
    int64_t v1 = v11;
    goto LABEL_22;
  }
LABEL_23:
  swift_release();
  uint64_t v12 = *(uint64_t (**)(void))(v0 + 8);
  return v12();
}

uint64_t sub_247EA0DE8()
{
  uint64_t v1 = v0[8];
  uint64_t v2 = v0[7];
  uint64_t v3 = v0[3];
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v3, v2);
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_247EA0E74(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (*(void *)(a1 + 24))
  {
    sub_247EADA8C((long long *)a1, (uint64_t)v15);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v14 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    uint64_t v7 = v16;
    uint64_t v8 = v17;
    uint64_t v9 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v15, v16);
    MEMORY[0x270FA5388](v9, v9);
    int64_t v11 = &v15[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
    (*(void (**)(unsigned char *))(v12 + 16))(v11);
    sub_247EAC21C((uint64_t)v11, a2, a3, isUniquelyReferenced_nonNull_native, &v14, v7, v8);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
    *uint64_t v3 = v14;
    swift_bridgeObjectRelease();
    return sub_247E9D58C(a2, a3);
  }
  else
  {
    sub_247EAE614(a1, &qword_2692D1210);
    sub_247EAB228(a2, a3, (uint64_t)v15);
    sub_247E9D58C(a2, a3);
    return sub_247EAE614((uint64_t)v15, &qword_2692D1210);
  }
}

uint64_t sub_247EA1004()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D1138);
  MEMORY[0x270FA5388](v0 - 8, v1);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_247EBC2B0();
  __swift_allocate_value_buffer(v4, qword_2692D2D38);
  uint64_t v5 = __swift_project_value_buffer(v4, (uint64_t)qword_2692D2D38);
  sub_247EBC280();
  uint64_t v6 = *(void *)(v4 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v3, 1, v4);
  if (result != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v6 + 32))(v5, v3, v4);
  }
  __break(1u);
  return result;
}

char *BatteryServiceBookingCoordinator.__allocating_init()()
{
  swift_allocObject();
  sub_247EB2538((uint64_t)&unk_2692D13F8, 0, (uint64_t)sub_247EB2034, 0, v4);
  type metadata accessor for UserDefaultsActor();
  uint64_t v0 = swift_allocObject();
  swift_defaultActor_initialize();
  *(void *)(v0 + 112) = objc_msgSend(self, sel_standardUserDefaults);
  id v1 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for BatteryServiceOptions()), sel_init);
  uint64_t v2 = sub_247EABCB8((uint64_t)v4, (uint64_t)sub_247EA1880, 0, v0, v1);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v2;
}

char *BatteryServiceBookingCoordinator.init()()
{
  sub_247EB2538((uint64_t)&unk_2692D13F8, 0, (uint64_t)sub_247EB2034, 0, v4);
  type metadata accessor for UserDefaultsActor();
  uint64_t v0 = swift_allocObject();
  swift_defaultActor_initialize();
  *(void *)(v0 + 112) = objc_msgSend(self, sel_standardUserDefaults);
  id v1 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for BatteryServiceOptions()), sel_init);
  uint64_t v2 = sub_247EABCB8((uint64_t)v4, (uint64_t)sub_247EA1880, 0, v0, v1);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v2;
}

char *BatteryServiceBookingCoordinator.__allocating_init(options:)(void *a1)
{
  swift_allocObject();
  sub_247EB2538((uint64_t)&unk_2692D13F8, 0, (uint64_t)sub_247EB2034, 0, v5);
  type metadata accessor for UserDefaultsActor();
  uint64_t v2 = swift_allocObject();
  swift_defaultActor_initialize();
  *(void *)(v2 + 112) = objc_msgSend(self, sel_standardUserDefaults);
  uint64_t v3 = sub_247EABCB8((uint64_t)v5, (uint64_t)sub_247EA1880, 0, v2, a1);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v3;
}

char *BatteryServiceBookingCoordinator.init(options:)(void *a1)
{
  sub_247EB2538((uint64_t)&unk_2692D13F8, 0, (uint64_t)sub_247EB2034, 0, v5);
  type metadata accessor for UserDefaultsActor();
  uint64_t v2 = swift_allocObject();
  swift_defaultActor_initialize();
  *(void *)(v2 + 112) = objc_msgSend(self, sel_standardUserDefaults);
  uint64_t v3 = sub_247EABCB8((uint64_t)v5, (uint64_t)sub_247EA1880, 0, v2, a1);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v3;
}

void sub_247EA1880()
{
  id v0 = objc_msgSend(self, sel_sharedApplication);
  id v1 = (void *)sub_247EBC270();
  sub_247EAF20C(MEMORY[0x263F8EE78]);
  type metadata accessor for OpenExternalURLOptionsKey(0);
  sub_247EAEF60(&qword_2692D0EC8, type metadata accessor for OpenExternalURLOptionsKey);
  id v2 = (id)sub_247EBC3C0();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_openURL_options_completionHandler_, v1, v2, 0);
}

uint64_t sub_247EA198C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[10] = a3;
  v4[11] = a4;
  v4[8] = a1;
  v4[9] = a2;
  uint64_t v5 = sub_247EBC7F0();
  v4[12] = v5;
  v4[13] = *(void *)(v5 - 8);
  v4[14] = swift_task_alloc();
  uint64_t v6 = sub_247EBC7D0();
  v4[15] = v6;
  v4[16] = *(void *)(v6 - 8);
  v4[17] = swift_task_alloc();
  v4[18] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_247EA1ABC, 0, 0);
}

uint64_t sub_247EA1ABC()
{
  uint64_t v2 = v0[17];
  uint64_t v1 = v0[18];
  uint64_t v3 = v0[15];
  uint64_t v4 = v0[16];
  uint64_t v5 = v0[14];
  uint64_t v7 = v0[10];
  uint64_t v6 = v0[11];
  uint64_t v8 = v0[9];
  type metadata accessor for TelemetryEvent();
  uint64_t v9 = (void *)swift_allocObject();
  v0[19] = v9;
  swift_defaultActor_initialize();
  v9[14] = 0;
  v9[15] = 0;
  v9[16] = sub_247EAF33C(MEMORY[0x263F8EE78]);
  sub_247EBC7B0();
  sub_247EBC7A0();
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v0[20] = v10;
  v0[21] = (v4 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v10(v2, v3);
  int64_t v11 = (void *)swift_allocObject();
  v0[22] = v11;
  v11[2] = v8;
  v11[3] = v9;
  v11[4] = v7;
  v11[5] = v6;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_247EBC7E0();
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D11C8);
  uint64_t v13 = (void *)swift_task_alloc();
  v0[23] = v13;
  _OWORD v13[2] = &unk_2692D1238;
  v13[3] = v11;
  v13[4] = v1;
  v13[5] = v5;
  uint64_t v14 = (void *)swift_task_alloc();
  v0[24] = v14;
  *uint64_t v14 = v0;
  v14[1] = sub_247EA1CB4;
  uint64_t v15 = v0[8];
  return MEMORY[0x270FA22B8](v15, v12, v12, 0, 0, &unk_2692D1248, v13, v12);
}

uint64_t sub_247EA1CB4()
{
  *(void *)(*(void *)v1 + 200) = v0;
  swift_task_dealloc();
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_247EA1EB8;
  }
  else {
    uint64_t v2 = sub_247EA1DE8;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_247EA1DE8()
{
  uint64_t v1 = (void (*)(uint64_t, uint64_t))v0[20];
  uint64_t v2 = v0[18];
  uint64_t v3 = v0[15];
  (*(void (**)(void, void))(v0[13] + 8))(v0[14], v0[12]);
  v1(v2, v3);
  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_247EA1EB8()
{
  uint64_t v1 = *(void **)(v0 + 200);
  uint64_t v2 = *(void *)(v0 + 152);
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(v0 + 160);
  uint64_t v4 = *(void *)(v0 + 144);
  uint64_t v5 = *(void *)(v0 + 120);
  (*(void (**)(void, void))(*(void *)(v0 + 104) + 8))(*(void *)(v0 + 112), *(void *)(v0 + 96));
  v3(v4, v5);
  swift_release();
  *(void *)(v0 + 56) = v1;
  id v6 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692D0F90);
  if (swift_dynamicCast())
  {

    *(_OWORD *)(v0 + 208) = *(_OWORD *)(v0 + 40);
    uint64_t v7 = sub_247EA1FD4;
  }
  else
  {

    uint64_t v7 = sub_247EA21C0;
  }
  return MEMORY[0x270FA2498](v7, v2, 0);
}

uint64_t sub_247EA1FD4()
{
  uint64_t v7 = v0;
  uint64_t v1 = MEMORY[0x263F8D310];
  uint64_t v5 = MEMORY[0x263F8D310];
  id v6 = &off_26FC21048;
  unint64_t v3 = 0x6572756C696166;
  unint64_t v4 = 0xE700000000000000;
  swift_beginAccess();
  sub_247EA0E74((uint64_t)&v3, 0, 1uLL);
  uint64_t v5 = v1;
  id v6 = &off_26FC21048;
  unint64_t v3 = 0xD00000000000002CLL;
  unint64_t v4 = 0x8000000247EBEAC0;
  sub_247EA0E74((uint64_t)&v3, 0, 2uLL);
  swift_endAccess();
  return MEMORY[0x270FA2498](sub_247EA20D8, 0, 0);
}

uint64_t sub_247EA20D8()
{
  uint64_t v2 = *(void *)(v0 + 208);
  uint64_t v1 = *(void *)(v0 + 216);
  uint64_t v3 = *(void *)(v0 + 152);
  sub_247EAEA94();
  uint64_t v4 = swift_allocError();
  *uint64_t v5 = v2;
  v5[1] = v1;
  sub_247EAEA40();
  swift_allocError();
  *id v6 = v4;
  v6[1] = v3;
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_247EA21C0()
{
  sub_247EB14E0(0xD00000000000001DLL, 0x8000000247EBEAA0);
  return MEMORY[0x270FA2498](sub_247EA2240, 0, 0);
}

uint64_t sub_247EA2240()
{
  uint64_t v1 = v0[25];
  uint64_t v2 = v0[19];
  sub_247EAEA40();
  swift_allocError();
  *uint64_t v3 = v1;
  v3[1] = v2;
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_247EA22F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[13] = a4;
  v5[14] = a5;
  v5[11] = a2;
  v5[12] = a3;
  v5[10] = a1;
  uint64_t v6 = sub_247EBC2B0();
  v5[15] = v6;
  v5[16] = *(void *)(v6 - 8);
  v5[17] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_247EA23B8, 0, 0);
}

uint64_t sub_247EA23B8()
{
  uint64_t v1 = v0[14];
  if (v1)
  {
    uint64_t v2 = v0[13];
    __swift_instantiateConcreteTypeFromMangledName(&qword_2692D0FD0);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_247EBD6D0;
    *(void *)(inited + 32) = sub_247EBC430();
    *(void *)(inited + 40) = v4;
    *(void *)(inited + 48) = v2;
    *(void *)(inited + 56) = v1;
    swift_bridgeObjectRetain();
    uint64_t v5 = inited;
  }
  else
  {
    uint64_t v5 = MEMORY[0x263F8EE78];
  }
  unint64_t v6 = sub_247EAF0E8(v5);
  v0[18] = v6;
  uint64_t v7 = (void *)swift_task_alloc();
  v0[19] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_247EA24CC;
  uint64_t v8 = v0[17];
  uint64_t v9 = v0[12];
  return sub_247EA4DAC(v8, v9, v6);
}

uint64_t sub_247EA24CC()
{
  *(void *)(*(void *)v1 + 160) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_247EA26A4;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v2 = sub_247EA25E8;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_247EA25E8()
{
  uint64_t v2 = v0[16];
  uint64_t v1 = v0[17];
  uint64_t v3 = v0[15];
  uint64_t v4 = v0[12];
  uint64_t v5 = v0[10];
  uint64_t v6 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2692D11C8) + 48);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32))(v5, v1, v3);
  *(void *)(v5 + v6) = v4;
  swift_retain();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_247EA26A4()
{
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_247EA2710()
{
  *(void *)(v1 + 104) = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692D1050);
  *(void *)(v1 + 112) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_247EA27A4, v0, 0);
}

uint64_t sub_247EA27A4()
{
  uint64_t v1 = v0[13];
  uint64_t v2 = v0[14];
  v0[12] = 0;
  uint64_t v3 = v1 + OBJC_IVAR____ACSBatteryServiceBookingCoordinator_clock;
  sub_247EBC730();
  uint64_t v4 = sub_247EBC750();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v2, 0, 1, v4);
  uint64_t v5 = v1 + OBJC_IVAR____ACSBatteryServiceBookingCoordinator_lastPrepareInstant;
  swift_beginAccess();
  sub_247EAE368(v2, v5, &qword_2692D1050);
  swift_endAccess();
  uint64_t v9 = (char *)&dword_2692D1468 + dword_2692D1468;
  swift_retain();
  uint64_t v6 = (void *)swift_task_alloc();
  v0[15] = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_247EA2910;
  uint64_t v7 = v0[13];
  return ((uint64_t (*)(uint64_t, void *, uint64_t))v9)(v3, v0 + 12, v7);
}

uint64_t sub_247EA2910(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)*v3;
  uint64_t v5 = (void *)*v3;
  v5[2] = v3;
  _OWORD v5[3] = a1;
  v5[4] = a2;
  uint64_t v5[5] = v2;
  uint64_t v6 = v4[13];
  swift_task_dealloc();
  swift_release();
  return MEMORY[0x270FA2498](sub_247EA2A30, v6, 0);
}

uint64_t sub_247EA2A30(uint64_t (*a1)(), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(v3 + 96);
  *(void *)(v3 + 128) = v4;
  if (v4)
  {
    *(int8x16_t *)(v3 + 136) = vextq_s8(*(int8x16_t *)(v3 + 24), *(int8x16_t *)(v3 + 24), 8uLL);
    swift_retain();
    a1 = sub_247EA2AB8;
    a2 = v4;
    a3 = 0;
  }
  else
  {
    __break(1u);
  }
  return MEMORY[0x270FA2498](a1, a2, a3);
}

uint64_t sub_247EA2AB8()
{
  uint64_t v6 = v0;
  uint64_t v1 = *(void *)(v0 + 104);
  double v2 = (double)sub_247EBCAE0();
  sub_247EBCAE0();
  *(void *)&_OWORD v5[3] = MEMORY[0x263F8D538];
  *(void *)&v5[4] = &off_26FC21068;
  v5[0] = (double)v3 * 1.0e-18 + v2;
  swift_beginAccess();
  sub_247EA0E74((uint64_t)v5, 0, 0);
  swift_endAccess();
  swift_release();
  return MEMORY[0x270FA2498](sub_247EA2BC0, v1, 0);
}

uint64_t sub_247EA2BC0(uint64_t (*a1)(), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(v3 + 96);
  *(void *)(v3 + 152) = v4;
  if (v4)
  {
    swift_retain();
    a1 = sub_247EA2C3C;
    a2 = v4;
    a3 = 0;
  }
  else
  {
    __break(1u);
  }
  return MEMORY[0x270FA2498](a1, a2, a3);
}

uint64_t sub_247EA2C3C()
{
  uint64_t v1 = *(void *)(v0 + 152);
  uint64_t v2 = *(void *)(v0 + 104);
  sub_247EBC6A0();
  swift_bridgeObjectRelease();
  *(void *)(v1 + 112) = 0xD000000000000022;
  *(void *)(v1 + 120) = 0x8000000247EBE600;
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_247EA2CF8, v2, 0);
}

void sub_247EA2CF8()
{
  uint64_t v1 = v0[12];
  v0[20] = v1;
  if (v1)
  {
    uint64_t v3 = (void (*)(uint64_t))((char *)&dword_2692D0F70 + dword_2692D0F70);
    swift_retain();
    uint64_t v2 = (void *)swift_task_alloc();
    v0[21] = v2;
    *uint64_t v2 = v0;
    v2[1] = sub_247EA2DBC;
    v3(v1);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_247EA2DBC()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 176) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 104);
    uint64_t v4 = sub_247EA2F54;
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 104);
    swift_release();
    uint64_t v4 = sub_247EA2EE4;
    uint64_t v3 = v5;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_247EA2EE4()
{
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_247EA2F54()
{
  swift_release();
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_247EA2FCC(uint64_t a1, uint64_t a2)
{
  v2[9] = a1;
  v2[10] = a2;
  v2[11] = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D11C8);
  v2[12] = swift_task_alloc();
  uint64_t v4 = sub_247EBC3B0();
  v2[13] = v4;
  v2[14] = *(void *)(v4 - 8);
  v2[15] = swift_task_alloc();
  v2[16] = swift_task_alloc();
  v2[17] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_247EA30E0, a2, 0);
}

uint64_t sub_247EA30E0()
{
  if (qword_2692D0DB8 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[17];
  uint64_t v2 = v0[13];
  uint64_t v3 = v0[14];
  uint64_t v4 = __swift_project_value_buffer(v2, (uint64_t)qword_2692D2D78);
  v0[18] = v4;
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v0[19] = v5;
  v0[20] = (v3 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v5(v1, v4, v2);
  uint64_t v6 = sub_247EBC390();
  os_log_type_t v7 = sub_247EBC5E0();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_247E99000, v6, v7, "Preparing battery service booking flow.", v8, 2u);
    MEMORY[0x24C56FD50](v8, -1, -1);
  }
  uint64_t v9 = v0[17];
  uint64_t v10 = v0[13];
  uint64_t v11 = v0[14];
  uint64_t v12 = v0[10];

  uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t))(v11 + 8);
  v0[21] = v13;
  v0[22] = (v11 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  uint64_t result = v13(v9, v10);
  uint64_t v15 = *(void *)(v12 + OBJC_IVAR____ACSBatteryServiceBookingCoordinator_retrieveSupportHandoffURLTask);
  v0[23] = v15;
  if (v15)
  {
    uint64_t v18 = (uint64_t (*)(uint64_t))((char *)&dword_2692D11D0 + dword_2692D11D0);
    swift_retain();
    uint64_t v16 = (void *)swift_task_alloc();
    v0[24] = v16;
    *uint64_t v16 = v0;
    v16[1] = sub_247EA32CC;
    uint64_t v17 = v0[12];
    return v18(v17);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_247EA32CC()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 200) = v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v3 = *(void *)(v2 + 80);
  if (v0) {
    uint64_t v4 = sub_247EA36B4;
  }
  else {
    uint64_t v4 = sub_247EA3414;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_247EA3414()
{
  uint64_t v1 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 152);
  uint64_t v2 = *(void *)(v0 + 144);
  uint64_t v3 = *(void *)(v0 + 128);
  uint64_t v5 = *(void *)(v0 + 96);
  uint64_t v4 = *(void *)(v0 + 104);
  **(void **)(v0 + 72) = *(void *)(v5 + *(int *)(*(void *)(v0 + 88) + 48));
  swift_release();
  uint64_t v6 = sub_247EBC2B0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  v1(v3, v2, v4);
  os_log_type_t v7 = sub_247EBC390();
  os_log_type_t v8 = sub_247EBC5E0();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_247E99000, v7, v8, "Successfully prepared battery booking flow.", v9, 2u);
    MEMORY[0x24C56FD50](v9, -1, -1);
  }
  uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 168);
  uint64_t v11 = *(void *)(v0 + 128);
  uint64_t v12 = *(void *)(v0 + 104);
  uint64_t v13 = *(uint64_t **)(v0 + 72);

  uint64_t v14 = (uint64_t (*)())v10(v11, v12);
  uint64_t v17 = *v13;
  *(void *)(v0 + 208) = *v13;
  if (v17)
  {
    swift_retain();
    uint64_t v14 = sub_247EA35A0;
    uint64_t v15 = v17;
    uint64_t v16 = 0;
  }
  else
  {
    __break(1u);
  }
  return MEMORY[0x270FA2498](v14, v15, v16);
}

uint64_t sub_247EA35A0()
{
  uint64_t v6 = v0;
  *((void *)&v4 + 1) = MEMORY[0x263F8D310];
  uint64_t v5 = &off_26FC21048;
  *(void *)&long long v3 = 0x73736563637573;
  *((void *)&v3 + 1) = 0xE700000000000000;
  swift_beginAccess();
  sub_247EA0E74((uint64_t)&v3, 0, 1uLL);
  uint64_t v5 = 0;
  long long v3 = 0u;
  long long v4 = 0u;
  sub_247EA0E74((uint64_t)&v3, 0, 2uLL);
  swift_endAccess();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_247EA36B4()
{
  uint64_t v1 = *(void **)(v0 + 200);
  *(void *)(v0 + 56) = v1;
  uint64_t v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 152);
  uint64_t v3 = *(void *)(v0 + 144);
  uint64_t v4 = *(void *)(v0 + 120);
  uint64_t v5 = *(void *)(v0 + 104);
  uint64_t v6 = *(void **)(v0 + 72);
  id v7 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692D0F90);
  swift_dynamicCast();
  os_log_type_t v8 = *(void **)(v0 + 40);
  *uint64_t v6 = *(void *)(v0 + 48);
  swift_retain();
  swift_release();
  v2(v4, v3, v5);
  id v9 = v8;
  id v10 = v8;
  swift_retain();
  uint64_t v11 = sub_247EBC390();
  os_log_type_t v12 = sub_247EBC5F0();
  if (os_log_type_enabled(v11, v12))
  {
    id v19 = *(id *)(v0 + 200);
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 138412290;
    id v15 = v8;
    uint64_t v16 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 64) = v16;
    sub_247EBC630();
    *uint64_t v14 = v16;

    swift_release();
    _os_log_impl(&dword_247E99000, v11, v12, "Could not prepare battery service booking flow: '%@'.", v13, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2692D11D8);
    swift_arrayDestroy();
    MEMORY[0x24C56FD50](v14, -1, -1);
    MEMORY[0x24C56FD50](v13, -1, -1);

    swift_release();
  }
  else
  {

    swift_release();
    swift_release();
  }
  (*(void (**)(void, void))(v0 + 168))(*(void *)(v0 + 120), *(void *)(v0 + 104));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v17 = *(uint64_t (**)(void))(v0 + 8);
  return v17();
}

uint64_t sub_247EA3AD0(const void *a1, uint64_t a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  v2[4] = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_247EAEFA8;
  return sub_247EA2710();
}

uint64_t sub_247EA3B78()
{
  v1[18] = v0;
  uint64_t v2 = sub_247EBC750();
  v1[19] = v2;
  v1[20] = *(void *)(v2 - 8);
  v1[21] = swift_task_alloc();
  v1[22] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692D1050);
  v1[23] = swift_task_alloc();
  v1[24] = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D1060);
  v1[25] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_247EA3CAC, v0, 0);
}

uint64_t sub_247EA3CAC(uint64_t (*a1)(), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3[18];
  v3[17] = 0;
  uint64_t v5 = *(void *)(v4 + OBJC_IVAR____ACSBatteryServiceBookingCoordinator_retrieveSupportHandoffURLTask);
  v3[26] = v5;
  if (v5)
  {
    swift_retain();
    a1 = sub_247EA3D38;
    a2 = v5;
    a3 = 0;
  }
  else
  {
    __break(1u);
  }
  return MEMORY[0x270FA2498](a1, a2, a3);
}

uint64_t sub_247EA3D38()
{
  uint64_t v1 = *(void *)(v0 + 200);
  uint64_t v2 = *(void *)(v0 + 144);
  uint64_t v3 = *(void *)(v0 + 208) + *(void *)(**(void **)(v0 + 208) + 112);
  swift_beginAccess();
  sub_247EAEEFC(v3, v1, &qword_2692D1060);
  *(_DWORD *)(v0 + 312) = swift_getEnumCaseMultiPayload();
  sub_247EAE614(v1, &qword_2692D1060);
  swift_release();
  return MEMORY[0x270FA2498](sub_247EA3E1C, v2, 0);
}

uint64_t sub_247EA3E1C()
{
  uint64_t v1 = *(void *)(v0 + 184);
  uint64_t v2 = *(void *)(v0 + 152);
  uint64_t v3 = *(void *)(v0 + 160);
  uint64_t v4 = *(void *)(v0 + 144) + OBJC_IVAR____ACSBatteryServiceBookingCoordinator_lastPrepareInstant;
  swift_beginAccess();
  sub_247EAEEFC(v4, v1, &qword_2692D1050);
  int v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2);
  *(_DWORD *)(v0 + 316) = v5;
  uint64_t v6 = *(void *)(v0 + 184);
  if (v5)
  {
    sub_247EAE614(*(void *)(v0 + 184), &qword_2692D1050);
    uint64_t v7 = 0;
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v10 = *(void *)(v0 + 168);
    uint64_t v9 = *(void *)(v0 + 176);
    uint64_t v11 = *(void *)(v0 + 152);
    uint64_t v12 = *(void *)(v0 + 160);
    (*(void (**)(uint64_t, void, uint64_t))(v12 + 16))(v9, *(void *)(v0 + 184), v11);
    sub_247EAE614(v6, &qword_2692D1050);
    sub_247EBC730();
    uint64_t v7 = sub_247EBC740();
    uint64_t v8 = v13;
    uint64_t v14 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
    v14(v10, v11);
    v14(v9, v11);
  }
  *(void *)(v0 + 216) = v7;
  *(void *)(v0 + 224) = v8;
  uint64_t v15 = *(void *)(v0 + 144) + OBJC_IVAR____ACSBatteryServiceBookingCoordinator_clock;
  id v19 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_2692D1458 + dword_2692D1458);
  swift_retain();
  uint64_t v16 = (void *)swift_task_alloc();
  *(void *)(v0 + 232) = v16;
  *uint64_t v16 = v0;
  v16[1] = sub_247EA4014;
  uint64_t v17 = *(void *)(v0 + 144);
  return v19(v15, v17, v0 + 136);
}

uint64_t sub_247EA4014(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *(void *)(*v2 + 144);
  *(void *)(v3 + 240) = a1;
  *(void *)(v3 + 248) = a2;
  swift_task_dealloc();
  swift_release();
  return MEMORY[0x270FA2498](sub_247EA4134, v4, 0);
}

uint64_t sub_247EA4134(uint64_t (*a1)(), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(v3 + 136);
  *(void *)(v3 + 256) = v4;
  if (v4)
  {
    swift_retain();
    a1 = sub_247EA41B0;
    a2 = v4;
    a3 = 0;
  }
  else
  {
    __break(1u);
  }
  return MEMORY[0x270FA2498](a1, a2, a3);
}

uint64_t sub_247EA41B0()
{
  uint64_t v7 = v0;
  uint64_t v1 = *(void *)(v0 + 144);
  BOOL v2 = *(_DWORD *)(v0 + 312) == 1;
  uint64_t v5 = MEMORY[0x263F8D4F8];
  uint64_t v6 = &off_26FC21078;
  v4[0] = v2;
  swift_beginAccess();
  sub_247EA0E74((uint64_t)v4, 0, 4uLL);
  swift_endAccess();
  swift_release();
  return MEMORY[0x270FA2498](sub_247EA4288, v1, 0);
}

uint64_t sub_247EA4288(uint64_t (*a1)(), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(v3 + 136);
  if (*(_DWORD *)(v3 + 316))
  {
    *(void *)(v3 + 272) = v4;
    if (v4)
    {
      uint64_t v5 = sub_247EA44AC;
      goto LABEL_6;
    }
    __break(1u);
LABEL_10:
    __break(1u);
    return MEMORY[0x270FA2498](a1, a2, a3);
  }
  *(void *)(v3 + 264) = v4;
  if (!v4) {
    goto LABEL_10;
  }
  uint64_t v5 = sub_247EA4328;
LABEL_6:
  uint64_t v6 = v5;
  swift_retain();
  a1 = v6;
  a2 = v4;
  a3 = 0;
  return MEMORY[0x270FA2498](a1, a2, a3);
}

uint64_t sub_247EA4328()
{
  uint64_t v6 = v0;
  uint64_t v1 = *(void *)(v0 + 144);
  double v2 = (double)sub_247EBCAE0();
  sub_247EBCAE0();
  *(void *)&_OWORD v5[3] = MEMORY[0x263F8D538];
  *(void *)&v5[4] = &off_26FC21068;
  v5[0] = (double)v3 * 1.0e-18 + v2;
  swift_beginAccess();
  sub_247EA0E74((uint64_t)v5, 0, 5uLL);
  swift_endAccess();
  swift_release();
  return MEMORY[0x270FA2498](sub_247EA4430, v1, 0);
}

uint64_t sub_247EA4430(uint64_t (*a1)(), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(v3 + 136);
  *(void *)(v3 + 272) = v4;
  if (v4)
  {
    swift_retain();
    a1 = sub_247EA44AC;
    a2 = v4;
    a3 = 0;
  }
  else
  {
    __break(1u);
  }
  return MEMORY[0x270FA2498](a1, a2, a3);
}

uint64_t sub_247EA44AC()
{
  uint64_t v6 = v0;
  uint64_t v1 = *(void *)(v0 + 144);
  double v2 = (double)sub_247EBCAE0();
  sub_247EBCAE0();
  *(void *)&_OWORD v5[3] = MEMORY[0x263F8D538];
  *(void *)&v5[4] = &off_26FC21068;
  v5[0] = (double)v3 * 1.0e-18 + v2;
  swift_beginAccess();
  sub_247EA0E74((uint64_t)v5, 0, 0);
  swift_endAccess();
  swift_release();
  return MEMORY[0x270FA2498](sub_247EA45B4, v1, 0);
}

uint64_t sub_247EA45B4(uint64_t (*a1)(), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(v3 + 136);
  *(void *)(v3 + 280) = v4;
  if (v4)
  {
    swift_retain();
    a1 = sub_247EA4630;
    a2 = v4;
    a3 = 0;
  }
  else
  {
    __break(1u);
  }
  return MEMORY[0x270FA2498](a1, a2, a3);
}

uint64_t sub_247EA4630()
{
  uint64_t v1 = *(void *)(v0 + 280);
  uint64_t v2 = *(void *)(v0 + 144);
  sub_247EBC6A0();
  swift_bridgeObjectRelease();
  *(void *)(v1 + 112) = 0xD000000000000021;
  *(void *)(v1 + 120) = 0x8000000247EBE630;
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_247EA46EC, v2, 0);
}

void sub_247EA46EC()
{
  uint64_t v1 = v0[17];
  v0[36] = v1;
  if (v1)
  {
    uint64_t v3 = (void (*)(uint64_t))((char *)&dword_2692D0F70 + dword_2692D0F70);
    swift_retain();
    uint64_t v2 = (void *)swift_task_alloc();
    v0[37] = v2;
    *uint64_t v2 = v0;
    v2[1] = sub_247EA47B0;
    v3(v1);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_247EA47B0()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 304) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 144);
    uint64_t v4 = sub_247EA4970;
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 144);
    swift_release();
    uint64_t v4 = sub_247EA48D8;
    uint64_t v3 = v5;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_247EA48D8()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_247EA4970()
{
  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_247EA4B7C(const void *a1, uint64_t a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  v2[4] = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_247EA4C24;
  return sub_247EA3B78();
}

uint64_t sub_247EA4C24()
{
  uint64_t v2 = v0;
  uint64_t v4 = *v1;
  uint64_t v3 = *v1;
  uint64_t v5 = *v1;
  swift_task_dealloc();
  swift_release();
  uint64_t v6 = *(void *)(v3 + 24);
  if (v2)
  {
    uint64_t v7 = (void *)sub_247EBC240();

    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  }
  else
  {
    (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0);
  }
  _Block_release(*(const void **)(v4 + 24));
  uint64_t v8 = *(uint64_t (**)(void))(v5 + 8);
  return v8();
}

uint64_t sub_247EA4DAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[13] = a3;
  v4[14] = v3;
  v4[11] = a1;
  v4[12] = a2;
  uint64_t v5 = sub_247EBC260();
  v4[15] = v5;
  v4[16] = *(void *)(v5 - 8);
  v4[17] = swift_task_alloc();
  uint64_t v6 = sub_247EBC1B0();
  v4[18] = v6;
  v4[19] = *(void *)(v6 - 8);
  v4[20] = swift_task_alloc();
  uint64_t v7 = sub_247EBC360();
  v4[21] = v7;
  v4[22] = *(void *)(v7 - 8);
  v4[23] = swift_task_alloc();
  uint64_t v8 = sub_247EBC380();
  BOOL v4[24] = v8;
  v4[25] = *(void *)(v8 - 8);
  v4[26] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692D1130);
  v4[27] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692D1138);
  v4[28] = swift_task_alloc();
  v4[29] = swift_task_alloc();
  uint64_t v9 = sub_247EBC2B0();
  v4[30] = v9;
  v4[31] = *(void *)(v9 - 8);
  v4[32] = swift_task_alloc();
  v4[33] = swift_task_alloc();
  v4[34] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_247EA506C, v3, 0);
}

uint64_t sub_247EA506C()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 112) + 168);
  *(void *)(v0 + 280) = v1;
  return MEMORY[0x270FA2498](sub_247EA5090, v1, 0);
}

uint64_t sub_247EA5090()
{
  id v1 = *(id *)(v0[35] + 112);
  uint64_t v2 = (void *)sub_247EBC400();
  id v3 = objc_msgSend(v1, sel_stringForKey_, v2);

  uint64_t v4 = v0[14];
  if (v3)
  {
    uint64_t v5 = sub_247EBC430();
    uint64_t v7 = v6;

    v0[36] = v5;
    v0[37] = v7;
    uint64_t v8 = sub_247EA5180;
  }
  else
  {
    uint64_t v8 = sub_247EA5850;
  }
  return MEMORY[0x270FA2498](v8, v4, 0);
}

uint64_t sub_247EA5180()
{
  uint64_t v1 = *(void *)(v0 + 240);
  uint64_t v2 = *(void *)(v0 + 248);
  uint64_t v3 = *(void *)(v0 + 232);
  swift_bridgeObjectRetain();
  sub_247EBC280();
  swift_bridgeObjectRelease_n();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    uint64_t v4 = *(void *)(v0 + 240);
    uint64_t v5 = *(void *)(v0 + 248);
    uint64_t v6 = *(void *)(v0 + 224);
    sub_247EBC280();
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v6, 1, v4);
    if (result == 1)
    {
      __break(1u);
      return result;
    }
    uint64_t v8 = *(void *)(v0 + 232);
    (*(void (**)(void, void, void))(*(void *)(v0 + 248) + 32))(*(void *)(v0 + 272), *(void *)(v0 + 224), *(void *)(v0 + 240));
    sub_247EAE614(v8, &qword_2692D1138);
  }
  else
  {
    (*(void (**)(void, void, void))(*(void *)(v0 + 248) + 32))(*(void *)(v0 + 272), *(void *)(v0 + 232), *(void *)(v0 + 240));
  }
  uint64_t v9 = *(void *)(v0 + 208);
  uint64_t v10 = *(void *)(v0 + 216);
  uint64_t v11 = *(void *)(v0 + 192);
  uint64_t v12 = *(void *)(v0 + 200);
  uint64_t v14 = *(void *)(v0 + 176);
  uint64_t v13 = *(void *)(v0 + 184);
  uint64_t v15 = *(void *)(v0 + 168);
  sub_247EBC340();
  sub_247EBC370();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v9, v11);
  sub_247EBC350();
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
  uint64_t v16 = sub_247EBC330();
  uint64_t v17 = *(void *)(v16 - 8);
  int v18 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v17 + 48))(v10, 1, v16);
  uint64_t v19 = *(void *)(v0 + 216);
  if (v18 == 1)
  {
    sub_247EAE614(v19, &qword_2692D1130);
  }
  else
  {
    sub_247EBC320();
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v19, v16);
  }
  uint64_t v20 = *(void *)(v0 + 248);
  uint64_t v21 = *(void *)(v0 + 256);
  uint64_t v30 = *(void *)(v0 + 240);
  uint64_t v22 = *(void *)(v0 + 128);
  uint64_t v23 = *(void *)(v0 + 136);
  uint64_t v24 = *(void *)(v0 + 120);
  uint64_t v31 = *(void *)(v0 + 104);
  *(void *)(v0 + 72) = 0xD000000000000019;
  *(void *)(v0 + 80) = 0x8000000247EBEA20;
  (*(void (**)(uint64_t, void, uint64_t))(v22 + 104))(v23, *MEMORY[0x263F06E50], v24);
  sub_247EADE30();
  sub_247EBC2A0();
  (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v23, v24);
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692D1148);
  sub_247EBC230();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_247EBD6D0;
  sub_247EBC220();
  swift_bridgeObjectRelease();
  sub_247EBC290();
  swift_bridgeObjectRelease();
  uint64_t v25 = *(void (**)(uint64_t, uint64_t))(v20 + 8);
  *(void *)(v0 + 304) = v25;
  *(void *)(v0 + 312) = (v20 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v25(v21, v30);
  sub_247EBC170();
  sub_247EBC150();
  sub_247EBC210();
  swift_allocObject();
  sub_247EBC200();
  strcpy((char *)(v0 + 16), "ios_settings");
  *(unsigned char *)(v0 + 29) = 0;
  *(_WORD *)(v0 + 30) = -5120;
  *(void *)(v0 + 32) = 0xD000000000000010;
  *(void *)(v0 + 40) = 0x8000000247EBEA40;
  *(void *)(v0 + 48) = 0x5F79726574746162;
  *(void *)(v0 + 56) = 0xEF65636976726573;
  *(void *)(v0 + 64) = v31;
  sub_247EADE84();
  swift_bridgeObjectRetain();
  sub_247EBC1F0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  sub_247EBC190();
  unint64_t v26 = (void *)swift_task_alloc();
  *(void *)(v0 + 320) = v26;
  void *v26 = v0;
  v26[1] = sub_247EA5ED0;
  uint64_t v27 = *(void *)(v0 + 160);
  uint64_t v28 = *(void *)(v0 + 88);
  uint64_t v29 = *(void *)(v0 + 96);
  return sub_247EA6230(v28, v27, v29);
}

uint64_t sub_247EA5850()
{
  (*(void (**)(void, uint64_t, uint64_t, void))(*(void *)(v0 + 248) + 56))(*(void *)(v0 + 232), 1, 1, *(void *)(v0 + 240));
  uint64_t v1 = *(void *)(v0 + 240);
  uint64_t v2 = *(void *)(v0 + 248);
  uint64_t v3 = *(void *)(v0 + 224);
  sub_247EBC280();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v5 = *(void *)(v0 + 232);
    (*(void (**)(void, void, void))(*(void *)(v0 + 248) + 32))(*(void *)(v0 + 272), *(void *)(v0 + 224), *(void *)(v0 + 240));
    sub_247EAE614(v5, &qword_2692D1138);
    uint64_t v6 = *(void *)(v0 + 208);
    uint64_t v7 = *(void *)(v0 + 216);
    uint64_t v8 = *(void *)(v0 + 192);
    uint64_t v9 = *(void *)(v0 + 200);
    uint64_t v11 = *(void *)(v0 + 176);
    uint64_t v10 = *(void *)(v0 + 184);
    uint64_t v12 = *(void *)(v0 + 168);
    sub_247EBC340();
    sub_247EBC370();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v6, v8);
    sub_247EBC350();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
    uint64_t v13 = sub_247EBC330();
    uint64_t v14 = *(void *)(v13 - 8);
    int v15 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 48))(v7, 1, v13);
    uint64_t v16 = *(void *)(v0 + 216);
    if (v15 == 1)
    {
      sub_247EAE614(v16, &qword_2692D1130);
    }
    else
    {
      sub_247EBC320();
      (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v16, v13);
    }
    uint64_t v17 = *(void *)(v0 + 248);
    uint64_t v18 = *(void *)(v0 + 256);
    uint64_t v27 = *(void *)(v0 + 240);
    uint64_t v19 = *(void *)(v0 + 128);
    uint64_t v20 = *(void *)(v0 + 136);
    uint64_t v21 = *(void *)(v0 + 120);
    uint64_t v28 = *(void *)(v0 + 104);
    *(void *)(v0 + 72) = 0xD000000000000019;
    *(void *)(v0 + 80) = 0x8000000247EBEA20;
    (*(void (**)(uint64_t, void, uint64_t))(v19 + 104))(v20, *MEMORY[0x263F06E50], v21);
    sub_247EADE30();
    sub_247EBC2A0();
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v20, v21);
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2692D1148);
    sub_247EBC230();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_247EBD6D0;
    sub_247EBC220();
    swift_bridgeObjectRelease();
    sub_247EBC290();
    swift_bridgeObjectRelease();
    uint64_t v22 = *(void (**)(uint64_t, uint64_t))(v17 + 8);
    *(void *)(v0 + 304) = v22;
    *(void *)(v0 + 312) = (v17 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v22(v18, v27);
    sub_247EBC170();
    sub_247EBC150();
    sub_247EBC210();
    swift_allocObject();
    sub_247EBC200();
    strcpy((char *)(v0 + 16), "ios_settings");
    *(unsigned char *)(v0 + 29) = 0;
    *(_WORD *)(v0 + 30) = -5120;
    *(void *)(v0 + 32) = 0xD000000000000010;
    *(void *)(v0 + 40) = 0x8000000247EBEA40;
    *(void *)(v0 + 48) = 0x5F79726574746162;
    *(void *)(v0 + 56) = 0xEF65636976726573;
    *(void *)(v0 + 64) = v28;
    sub_247EADE84();
    swift_bridgeObjectRetain();
    sub_247EBC1F0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    sub_247EBC190();
    uint64_t v23 = (void *)swift_task_alloc();
    *(void *)(v0 + 320) = v23;
    *uint64_t v23 = v0;
    v23[1] = sub_247EA5ED0;
    uint64_t v24 = *(void *)(v0 + 160);
    uint64_t v25 = *(void *)(v0 + 88);
    uint64_t v26 = *(void *)(v0 + 96);
    return sub_247EA6230(v25, v24, v26);
  }
  return result;
}

uint64_t sub_247EA5ED0()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 328) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 112);
  if (v0) {
    uint64_t v4 = sub_247EA6114;
  }
  else {
    uint64_t v4 = sub_247EA5FFC;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_247EA5FFC()
{
  uint64_t v1 = (void (*)(uint64_t, uint64_t))v0[38];
  uint64_t v2 = v0[34];
  uint64_t v3 = v0[30];
  (*(void (**)(void, void))(v0[19] + 8))(v0[20], v0[18]);
  v1(v2, v3);
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
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_247EA6114()
{
  uint64_t v1 = (void (*)(uint64_t, uint64_t))v0[38];
  uint64_t v2 = v0[34];
  uint64_t v3 = v0[30];
  (*(void (**)(void, void))(v0[19] + 8))(v0[20], v0[18]);
  v1(v2, v3);
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
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_247EA6230(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[25] = a3;
  v4[26] = v3;
  v4[23] = a1;
  BOOL v4[24] = a2;
  uint64_t v5 = sub_247EBC3B0();
  v4[27] = v5;
  v4[28] = *(void *)(v5 - 8);
  v4[29] = swift_task_alloc();
  v4[30] = swift_task_alloc();
  type metadata accessor for HandoffResponse();
  v4[31] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_247EA6330, v3, 0);
}

uint64_t sub_247EA6330()
{
  uint64_t v1 = v0[25];
  v0[32] = 0;
  v0[33] = 0;
  return MEMORY[0x270FA2498](sub_247EA6350, v1, 0);
}

uint64_t sub_247EA6350()
{
  uint64_t v11 = v0;
  uint64_t v1 = *(void *)(v0 + 264);
  uint64_t v3 = *(void *)(v0 + 200);
  uint64_t v2 = *(void *)(v0 + 208);
  *(void *)(v0 + 80) = MEMORY[0x263F8D6C8];
  *(void *)(v0 + 88) = &off_26FC21058;
  *(void *)(v0 + 56) = v1;
  swift_beginAccess();
  sub_247EADA8C((long long *)(v0 + 56), v0 + 96);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v10 = *(void *)(v3 + 128);
  *(void *)(v3 + 128) = 0x8000000000000000;
  uint64_t v5 = *(void *)(v0 + 120);
  uint64_t v6 = __swift_mutable_project_boxed_opaque_existential_1(v0 + 96, v5);
  uint64_t v7 = *(void *)(v5 - 8);
  uint64_t v8 = (uint64_t *)swift_task_alloc();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v7 + 16))(v8, v6, v5);
  sub_247EAC024(*v8, 0, 3uLL, isUniquelyReferenced_nonNull_native, &v10);
  __swift_destroy_boxed_opaque_existential_1(v0 + 96);
  swift_task_dealloc();
  *(void *)(v3 + 128) = v10;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return MEMORY[0x270FA2498](sub_247EA64F8, v2, 0);
}

uint64_t sub_247EA64F8()
{
  uint64_t v1 = *(void *)(v0 + 264);
  uint64_t v2 = __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 208) + 112), *(void *)(*(void *)(v0 + 208) + 136));
  uint64_t v3 = v2[4];
  long long v4 = *((_OWORD *)v2 + 1);
  *(_OWORD *)(v0 + 16) = *(_OWORD *)v2;
  *(_OWORD *)(v0 + 32) = v4;
  *(void *)(v0 + 48) = v3;
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, BOOL, uint64_t))((char *)&dword_2692D10A0 + dword_2692D10A0);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 272) = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_247EA65DC;
  uint64_t v6 = *(void *)(v0 + 248);
  uint64_t v7 = *(void *)(v0 + 192);
  uint64_t v8 = *(void *)(v0 + 200);
  return v10(v6, v7, v1 != 0, v8);
}

uint64_t sub_247EA65DC()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 280) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 208);
  if (v0) {
    long long v4 = sub_247EA67D0;
  }
  else {
    long long v4 = sub_247EA6708;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_247EA6708()
{
  uint64_t v1 = *(void *)(v0 + 248);
  uint64_t v2 = *(void *)(v0 + 184);

  uint64_t v3 = sub_247EBC2B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 32))(v2, v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  long long v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_247EA67D0()
{
  uint64_t v1 = *(void **)(v0 + 280);
  *(void *)(v0 + 160) = v1;
  id v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692D0F90);
  if ((swift_dynamicCast() & 1) == 0 || *(void *)(v0 + 168) != 401)
  {

LABEL_12:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v24 = *(uint64_t (**)(void))(v0 + 8);
    return v24();
  }

  if (qword_2692D0DB8 != -1) {
    swift_once();
  }
  uint64_t v3 = *(void *)(v0 + 240);
  uint64_t v4 = *(void *)(v0 + 216);
  uint64_t v5 = *(void *)(v0 + 224);
  uint64_t v6 = __swift_project_value_buffer(v4, (uint64_t)qword_2692D2D78);
  uint64_t v28 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  v28(v3, v6, v4);
  uint64_t v7 = sub_247EBC390();
  os_log_type_t v8 = sub_247EBC5F0();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_247E99000, v7, v8, "Support handoff API returned 401, retrying…", v9, 2u);
    MEMORY[0x24C56FD50](v9, -1, -1);
  }
  uint64_t v10 = *(void **)(v0 + 256);
  uint64_t v11 = *(void *)(v0 + 264);
  uint64_t v12 = *(void *)(v0 + 240);
  uint64_t v13 = *(void *)(v0 + 216);
  uint64_t v14 = *(void *)(v0 + 224);

  int v15 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
  v15(v12, v13);
  sub_247EADAF4();
  uint64_t v16 = swift_allocError();
  *uint64_t v17 = 401;

  if (v11 == 2)
  {
    uint64_t v18 = v15;
    v28(*(void *)(v0 + 232), v6, *(void *)(v0 + 216));
    uint64_t v19 = sub_247EBC390();
    os_log_type_t v20 = sub_247EBC5F0();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v21 = 134217984;
      *(void *)(v0 + 176) = 3;
      sub_247EBC630();
      _os_log_impl(&dword_247E99000, v19, v20, "Failed to retrieve handoff URL after %ld attempts.", v21, 0xCu);
      MEMORY[0x24C56FD50](v21, -1, -1);
    }
    uint64_t v22 = *(void *)(v0 + 232);
    uint64_t v23 = *(void *)(v0 + 216);

    v18(v22, v23);
    swift_willThrow();
    goto LABEL_12;
  }
  uint64_t v26 = *(void *)(v0 + 264) + 1;
  *(void *)(v0 + 256) = v16;
  *(void *)(v0 + 264) = v26;
  uint64_t v27 = *(void *)(v0 + 200);
  return MEMORY[0x270FA2498](sub_247EA6350, v27, 0);
}

uint64_t BatteryServiceBookingCoordinator.deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 112);
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 176);
  uint64_t v1 = v0 + OBJC_IVAR____ACSBatteryServiceBookingCoordinator_clock;
  uint64_t v2 = sub_247EBC770();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  sub_247EAE614(v0 + OBJC_IVAR____ACSBatteryServiceBookingCoordinator_lastPrepareInstant, &qword_2692D1050);
  swift_release();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t BatteryServiceBookingCoordinator.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 112);
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 176);
  uint64_t v1 = v0 + OBJC_IVAR____ACSBatteryServiceBookingCoordinator_clock;
  uint64_t v2 = sub_247EBC770();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  sub_247EAE614(v0 + OBJC_IVAR____ACSBatteryServiceBookingCoordinator_lastPrepareInstant, &qword_2692D1050);
  swift_release();
  swift_defaultActor_destroy();
  return MEMORY[0x270FA2418](v0);
}

uint64_t BatteryServiceBookingCoordinator.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_247EA6CC8()
{
  return v0;
}

uint64_t sub_247EA6CD4(uint64_t a1)
{
  v2[14] = a1;
  v2[15] = v1;
  v2[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D11C8);
  v2[17] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692D1158);
  v2[18] = swift_task_alloc();
  v2[19] = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D1060);
  v2[20] = swift_task_alloc();
  v2[21] = swift_task_alloc();
  v2[22] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_247EA6DEC, v1, 0);
}

uint64_t sub_247EA6DEC()
{
  uint64_t v1 = v0[22];
  uint64_t v2 = v0[15];
  uint64_t v3 = *(void *)(*(void *)v2 + 112);
  v0[23] = v3;
  uint64_t v4 = v2 + v3;
  swift_beginAccess();
  sub_247EAEEFC(v4, v1, &qword_2692D1060);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      sub_247EAE3CC(v0[22], v0[14], &qword_2692D11C8);
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v6 = (uint64_t (*)(void))v0[1];
      return v6();
    }
    else
    {
      uint64_t v14 = v0[20];
      int v15 = (uint64_t *)v0[21];
      uint64_t v16 = v0[18];
      uint64_t v17 = v0[15];
      uint64_t v18 = sub_247EBC540();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v16, 1, 1, v18);
      unint64_t v19 = sub_247EAE430();
      os_log_type_t v20 = (void *)swift_allocObject();
      v20[2] = v17;
      v20[3] = v19;
      v20[4] = v17;
      swift_retain_n();
      uint64_t v21 = sub_247EA7C40(v16, (uint64_t)&unk_2692D11F8, (uint64_t)v20);
      v0[24] = v21;
      *int v15 = v21;
      swift_storeEnumTagMultiPayload();
      sub_247EAE3CC((uint64_t)v15, v14, &qword_2692D1060);
      swift_beginAccess();
      swift_retain();
      sub_247EAE368(v14, v4, &qword_2692D1060);
      swift_endAccess();
      uint64_t v22 = (void *)swift_task_alloc();
      v0[25] = v22;
      void *v22 = v0;
      v22[1] = sub_247EA7184;
      uint64_t v23 = v0[16];
      uint64_t v24 = v0[14];
      return MEMORY[0x270FA2338](v24, &unk_2692D1208, v21, sub_247EAE60C, v21, v17, v19, v23);
    }
  }
  else
  {
    uint64_t v8 = *(void *)v0[22];
    v0[27] = v8;
    uint64_t v9 = (void *)swift_task_alloc();
    v0[28] = v9;
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D0F90);
    void *v9 = v0;
    v9[1] = sub_247EA72B0;
    uint64_t v12 = v0[16];
    uint64_t v11 = v0[17];
    uint64_t v13 = MEMORY[0x263F8E4E0];
    return MEMORY[0x270FA1FA8](v11, v8, v12, v10, v13);
  }
}

uint64_t sub_247EA7184()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 208) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 120);
  if (v0) {
    uint64_t v4 = sub_247EA7478;
  }
  else {
    uint64_t v4 = sub_247EA73DC;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_247EA72B0()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 232) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 120);
  if (v0) {
    uint64_t v4 = sub_247EA76CC;
  }
  else {
    uint64_t v4 = sub_247EA7588;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_247EA73DC()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_247EA7478()
{
  uint64_t v1 = v0[23];
  uint64_t v2 = v0[21];
  uint64_t v3 = v0[15];
  swift_release();
  swift_storeEnumTagMultiPayload();
  swift_beginAccess();
  sub_247EAE368(v2, v3 + v1, &qword_2692D1060);
  swift_endAccess();
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_247EA7588()
{
  uint64_t v1 = v0[23];
  uint64_t v3 = v0[20];
  uint64_t v2 = v0[21];
  uint64_t v4 = v0[17];
  uint64_t v5 = v0[14];
  uint64_t v6 = v0[15];
  swift_release();
  sub_247EAEEFC(v4, v2, &qword_2692D11C8);
  swift_storeEnumTagMultiPayload();
  sub_247EAE3CC(v2, v3, &qword_2692D1060);
  swift_beginAccess();
  sub_247EAE368(v3, v6 + v1, &qword_2692D1060);
  swift_endAccess();
  sub_247EAE3CC(v4, v5, &qword_2692D11C8);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_247EA76CC()
{
  uint64_t v1 = v0[23];
  uint64_t v2 = v0[21];
  uint64_t v3 = v0[15];
  swift_release();
  swift_storeEnumTagMultiPayload();
  swift_beginAccess();
  sub_247EAE368(v2, v3 + v1, &qword_2692D1060);
  swift_endAccess();
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_247EA77E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4[5] = a1;
  v4[6] = a4;
  v4[7] = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D1060);
  v4[8] = swift_task_alloc();
  v4[9] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_247EA788C, a4, 0);
}

uint64_t sub_247EA788C()
{
  uint64_t v1 = (int **)(v0[6] + *(void *)(*(void *)v0[6] + 120));
  uint64_t v2 = *v1;
  v0[10] = v1[1];
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)v2 + *v2);
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  v0[11] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_247EA798C;
  uint64_t v4 = v0[5];
  return v6(v4);
}

uint64_t sub_247EA798C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 96) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 48);
  if (v0) {
    uint64_t v4 = sub_247EA7BC8;
  }
  else {
    uint64_t v4 = sub_247EA7AB8;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_247EA7AB8()
{
  uint64_t v1 = v0[9];
  uint64_t v2 = v0[8];
  uint64_t v3 = v0[5];
  uint64_t v4 = v0[6];
  swift_release();
  sub_247EAEEFC(v3, v1, &qword_2692D11C8);
  swift_storeEnumTagMultiPayload();
  sub_247EAE3CC(v1, v2, &qword_2692D1060);
  uint64_t v5 = v4 + *(void *)(*(void *)v4 + 112);
  swift_beginAccess();
  sub_247EAE368(v2, v5, &qword_2692D1060);
  swift_endAccess();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_247EA7BC8()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_247EA7C40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_247EBC540();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_247EBC530();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_247EAE614(a1, &qword_2692D1158);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_247EBC4C0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692D11C8);
  return swift_task_create();
}

uint64_t sub_247EA7DC8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D11C8);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D0F90);
  *uint64_t v5 = v2;
  v5[1] = sub_247EA7EA0;
  uint64_t v8 = MEMORY[0x263F8E4E0];
  return MEMORY[0x270FA1FA8](a1, a2, v6, v7, v8);
}

uint64_t sub_247EA7EA0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_247EA7F94(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D11C8);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D0F90);
  uint64_t v4 = MEMORY[0x263F8E4E0];
  return MEMORY[0x270FA1FB0](a1, v2, v3, v4);
}

uint64_t sub_247EA7FF4(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  *(void *)(v5 + 312) = a4;
  *(void *)(v5 + 320) = v4;
  *(unsigned char *)(v5 + 568) = a3;
  *(void *)(v5 + 296) = a1;
  *(void *)(v5 + 304) = a2;
  uint64_t v6 = sub_247EBC3B0();
  *(void *)(v5 + 328) = v6;
  *(void *)(v5 + 336) = *(void *)(v6 - 8);
  *(void *)(v5 + 344) = swift_task_alloc();
  sub_247EBCA60();
  *(void *)(v5 + 352) = swift_task_alloc();
  sub_247EBCA40();
  *(void *)(v5 + 360) = swift_task_alloc();
  sub_247EBCAB0();
  *(void *)(v5 + 368) = swift_task_alloc();
  uint64_t v7 = sub_247EBCAC0();
  *(void *)(v5 + 376) = v7;
  *(void *)(v5 + 384) = *(void *)(v7 - 8);
  *(void *)(v5 + 392) = swift_task_alloc();
  uint64_t v8 = sub_247EBC770();
  *(void *)(v5 + 400) = v8;
  *(void *)(v5 + 408) = *(void *)(v8 - 8);
  *(void *)(v5 + 416) = swift_task_alloc();
  *(void *)(v5 + 424) = type metadata accessor for CompositeHTTPHeadersProvider();
  *(void *)(v5 + 432) = swift_task_alloc();
  uint64_t v9 = sub_247EBC1B0();
  *(void *)(v5 + 440) = v9;
  *(void *)(v5 + 448) = *(void *)(v9 - 8);
  *(void *)(v5 + 456) = swift_task_alloc();
  *(void *)(v5 + 464) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_247EA8294, 0, 0);
}

uint64_t sub_247EA8294()
{
  uint64_t v1 = *(void **)(v0 + 432);
  uint64_t v2 = *(uint64_t **)(v0 + 320);
  uint64_t v3 = *(unsigned __int8 *)(v0 + 568);
  (*(void (**)(void, void, void))(*(void *)(v0 + 448) + 16))(*(void *)(v0 + 464), *(void *)(v0 + 304), *(void *)(v0 + 440));
  uint64_t v4 = *v2;
  *(void *)(v0 + 272) = *v2;
  uint64_t v5 = (void (*)(uint64_t))v2[3];
  swift_bridgeObjectRetain();
  v5(v3);
  sub_247EAEEFC(v0 + 56, v0 + 16, &qword_2692D10B0);
  swift_bridgeObjectRetain();
  sub_247EAB748(v0 + 16);
  sub_247EAE614(v0 + 56, &qword_2692D10B0);
  sub_247EADB48(v0 + 272);
  sub_247EBC760();
  *uint64_t v1 = v4;
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_2692D10B8 + dword_2692D10B8);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v0 + 472) = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_247EA8414;
  uint64_t v7 = *(void *)(v0 + 456);
  uint64_t v8 = *(void *)(v0 + 464);
  uint64_t v9 = *(void *)(v0 + 312);
  return v11(v7, v8, v9);
}

uint64_t sub_247EA8414()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 480) = v0;
  swift_task_dealloc();
  sub_247EADB74(*(void *)(v2 + 432));
  if (v0) {
    uint64_t v3 = sub_247EA8618;
  }
  else {
    uint64_t v3 = sub_247EA8548;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_247EA8548()
{
  (*(void (**)(void, void, void))(*(void *)(v0 + 448) + 40))(*(void *)(v0 + 464), *(void *)(v0 + 456), *(void *)(v0 + 440));
  uint64_t v1 = sub_247EBC160();
  if (v1)
  {
    if (*(void *)(v1 + 16))
    {
      sub_247EAF8A4(0xD000000000000010, 0x8000000247EBE4B0);
      char v3 = v2;
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    swift_bridgeObjectRelease();
  }
  char v3 = 0;
LABEL_6:
  *(unsigned char *)(v0 + 569) = v3 & 1;
  uint64_t v4 = *(void *)(v0 + 312);
  return MEMORY[0x270FA2498](sub_247EA8964, v4, 0);
}

uint64_t sub_247EA8618()
{
  uint64_t v1 = *(void **)(v0 + 480);
  uint64_t v2 = *(void *)(v0 + 312);
  *(void *)(v0 + 280) = v1;
  id v3 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692D0F90);
  swift_dynamicCast();
  *(_OWORD *)(v0 + 488) = *(_OWORD *)(v0 + 152);
  sub_247EBC6A0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_247EBC480();
  swift_bridgeObjectRelease();
  *(void *)(v0 + 504) = 0xD00000000000001DLL;
  *(void *)(v0 + 512) = 0x8000000247EBE750;
  return MEMORY[0x270FA2498](sub_247EA8744, v2, 0);
}

uint64_t sub_247EA8744()
{
  uint64_t v9 = v0;
  uint64_t v2 = *(void *)(v0 + 504);
  unint64_t v1 = *(void *)(v0 + 512);
  uint64_t v3 = MEMORY[0x263F8D310];
  uint64_t v7 = MEMORY[0x263F8D310];
  uint64_t v8 = &off_26FC21048;
  uint64_t v5 = 0x6572756C696166;
  unint64_t v6 = 0xE700000000000000;
  swift_beginAccess();
  sub_247EA0E74((uint64_t)&v5, 0, 1uLL);
  uint64_t v7 = v3;
  uint64_t v8 = &off_26FC21048;
  uint64_t v5 = v2;
  unint64_t v6 = v1;
  swift_bridgeObjectRetain();
  sub_247EA0E74((uint64_t)&v5, 0, 2uLL);
  swift_endAccess();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_247EA884C, 0, 0);
}

uint64_t sub_247EA884C()
{
  unint64_t v1 = (void *)v0[62];
  swift_willThrow();
  swift_bridgeObjectRelease();

  (*(void (**)(void, void))(v0[56] + 8))(v0[58], v0[55]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = (uint64_t (*)(void))v0[1];
  return v2();
}

uint64_t sub_247EA8964()
{
  uint64_t v6 = v0;
  char v1 = *(unsigned char *)(v0 + 569);
  uint64_t v4 = MEMORY[0x263F8D4F8];
  uint64_t v5 = &off_26FC21078;
  v3[0] = v1;
  swift_beginAccess();
  sub_247EA0E74((uint64_t)v3, 0, 6uLL);
  swift_endAccess();
  return MEMORY[0x270FA2498](sub_247EA8A20, 0, 0);
}

uint64_t sub_247EA8A20()
{
  uint64_t v1 = v0[58];
  uint64_t v2 = v0[40];
  v0[28] = 0;
  v0[29] = 0;
  v0[27] = 0;
  sub_247EBC760();
  uint64_t v3 = (void *)swift_task_alloc();
  v0[65] = v3;
  v3[2] = v0 + 27;
  v3[3] = v2;
  v3[4] = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[66] = v4;
  uint64_t v5 = sub_247EAEF60(&qword_2692D10C8, MEMORY[0x263F8F710]);
  *uint64_t v4 = v0;
  v4[1] = sub_247EA8B58;
  uint64_t v6 = v0[50];
  return MEMORY[0x270FA2390](v0 + 30, &unk_2692D10C0, v3, v6, v5);
}

uint64_t sub_247EA8B58()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 536) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 416);
  uint64_t v4 = *(void *)(v2 + 408);
  uint64_t v5 = *(void *)(v2 + 400);
  if (v0)
  {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    swift_task_dealloc();
    uint64_t v6 = sub_247EA8D2C;
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v8 = *(void *)(v2 + 312);
    *(_OWORD *)(v2 + 544) = *(_OWORD *)(v2 + 240);
    swift_task_dealloc();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    uint64_t v6 = sub_247EA8DA4;
    uint64_t v7 = v8;
  }
  return MEMORY[0x270FA2498](v6, v7, 0);
}

uint64_t sub_247EA8D2C()
{
  *(void *)(v0 + 560) = *(void *)(v0 + 536);
  uint64_t v1 = *(void *)(v0 + 312);
  sub_247EADC78(*(void *)(v0 + 216), *(void *)(v0 + 224), *(void **)(v0 + 232));
  return MEMORY[0x270FA2498](sub_247EA94E4, v1, 0);
}

uint64_t sub_247EA8DA4()
{
  uint64_t v5 = v0;
  double v1 = (double)sub_247EBCAE0();
  sub_247EBCAE0();
  *(void *)&v4[3] = MEMORY[0x263F8D538];
  *(void *)&v4[4] = &off_26FC21068;
  v4[0] = (double)v2 * 1.0e-18 + v1;
  swift_beginAccess();
  sub_247EA0E74((uint64_t)v4, 0xD000000000000012, 0x8000000247EBE790);
  swift_endAccess();
  return MEMORY[0x270FA2498](sub_247EA8EB8, 0, 0);
}

uint64_t sub_247EA8EB8()
{
  uint64_t v40 = v0;
  uint64_t v1 = *(void *)(v0 + 384);
  uint64_t v2 = *(void *)(v0 + 392);
  uint64_t v37 = *(void *)(v0 + 376);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692D10D0);
  sub_247EBCA90();
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_247EBDA00;
  sub_247EBCA80();
  sub_247EBCA70();
  sub_247EAC6D0(v3);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  sub_247EBCAA0();
  sub_247EBCA30();
  sub_247EBCA50();
  sub_247EBCA20();
  sub_247EAEF60(&qword_2692D10D8, MEMORY[0x263F07F20]);
  sub_247EBCAD0();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v2, v37);
  uint64_t v5 = *(void *)(v0 + 256);
  unint64_t v4 = *(void *)(v0 + 264);
  if (qword_2692D0DB8 != -1) {
    swift_once();
  }
  uint64_t v7 = *(void *)(v0 + 336);
  uint64_t v6 = *(void *)(v0 + 344);
  uint64_t v8 = *(void *)(v0 + 328);
  uint64_t v9 = __swift_project_value_buffer(v8, (uint64_t)qword_2692D2D78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v6, v9, v8);
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_247EBC390();
  os_log_type_t v11 = sub_247EBC5E0();
  BOOL v12 = os_log_type_enabled(v10, v11);
  uint64_t v14 = *(void *)(v0 + 336);
  uint64_t v13 = *(void *)(v0 + 344);
  uint64_t v15 = *(void *)(v0 + 328);
  if (v12)
  {
    uint64_t v38 = *(void *)(v0 + 328);
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    uint64_t v39 = v17;
    *(_DWORD *)uint64_t v16 = 136315138;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 288) = sub_247EAABD0(v5, v4, &v39);
    sub_247EBC630();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_247E99000, v10, v11, "Support service call completed in %s", v16, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C56FD50](v17, -1, -1);
    MEMORY[0x24C56FD50](v16, -1, -1);

    uint64_t v18 = (*(uint64_t (**)(uint64_t, uint64_t))(v14 + 8))(v13, v38);
  }
  else
  {
    swift_bridgeObjectRelease_n();

    uint64_t v18 = (*(uint64_t (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
  }
  uint64_t v21 = *(void **)(v0 + 232);
  if (!v21)
  {
    __break(1u);
    goto LABEL_21;
  }
  self;
  uint64_t v22 = swift_dynamicCastObjCClass();
  if (v22)
  {
    uint64_t v23 = (void *)v22;
    id v24 = v21;
    if ((char *)objc_msgSend(v23, sel_statusCode) - 200 >= (char *)0x64)
    {
      id v29 = objc_msgSend(v23, sel_statusCode);
      sub_247EADAF4();
      uint64_t v28 = swift_allocError();
      void *v30 = v29;
      swift_willThrow();

LABEL_14:
      *(void *)(v0 + 560) = v28;
      uint64_t v31 = *(void *)(v0 + 312);
      sub_247EADC78(*(void *)(v0 + 216), *(void *)(v0 + 224), *(void **)(v0 + 232));
      uint64_t v18 = (uint64_t)sub_247EA94E4;
      uint64_t v19 = v31;
      uint64_t v20 = 0;
      return MEMORY[0x270FA2498](v18, v19, v20);
    }
  }
  sub_247EBC1E0();
  swift_allocObject();
  uint64_t v18 = sub_247EBC1D0();
  if (!*(void *)(v0 + 232))
  {
LABEL_21:
    __break(1u);
    return MEMORY[0x270FA2498](v18, v19, v20);
  }
  uint64_t v25 = *(void *)(v0 + 536);
  type metadata accessor for HandoffResponse();
  uint64_t v26 = *(void *)(v0 + 216);
  unint64_t v27 = *(void *)(v0 + 224);
  sub_247EADCB8(v26, v27);
  sub_247EAEF60(&qword_2692D10E0, (void (*)(uint64_t))type metadata accessor for HandoffResponse);
  sub_247EBC1C0();
  if (v25)
  {
    uint64_t v28 = v25;
    sub_247E9F158(v26, v27);
    swift_release();
    goto LABEL_14;
  }
  uint64_t v32 = *(void *)(v0 + 464);
  uint64_t v34 = *(void *)(v0 + 440);
  uint64_t v33 = *(void *)(v0 + 448);
  sub_247E9F158(v26, v27);
  swift_release();
  sub_247EADC78(*(void *)(v0 + 216), *(void *)(v0 + 224), *(void **)(v0 + 232));
  (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v32, v34);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  BOOL v35 = *(uint64_t (**)(void))(v0 + 8);
  return v35();
}

uint64_t sub_247EA94E4()
{
  uint64_t v7 = v0;
  uint64_t v1 = MEMORY[0x263F8D310];
  uint64_t v5 = MEMORY[0x263F8D310];
  uint64_t v6 = &off_26FC21048;
  unint64_t v3 = 0x6572756C696166;
  unint64_t v4 = 0xE700000000000000;
  swift_beginAccess();
  sub_247EA0E74((uint64_t)&v3, 0, 1uLL);
  uint64_t v5 = v1;
  uint64_t v6 = &off_26FC21048;
  unint64_t v3 = 0xD00000000000001ELL;
  unint64_t v4 = 0x8000000247EBE770;
  sub_247EA0E74((uint64_t)&v3, 0, 2uLL);
  swift_endAccess();
  return MEMORY[0x270FA2498](sub_247EA95E8, 0, 0);
}

uint64_t sub_247EA95E8()
{
  swift_willThrow();
  (*(void (**)(void, void))(v0[56] + 8))(v0[58], v0[55]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_247EA96EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4 = v3;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D1158);
  MEMORY[0x270FA5388](v7 - 8, v8);
  uint64_t v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_247EAEEFC(a1, (uint64_t)v10, &qword_2692D1158);
  uint64_t v11 = sub_247EBC540();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_247EAE614((uint64_t)v10, &qword_2692D1158);
    if (*(void *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v13 = sub_247EBC4C0();
      uint64_t v15 = v14;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_247EBC530();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v10, v11);
    if (*(void *)(a3 + 16)) {
      goto LABEL_3;
    }
  }
  uint64_t v13 = 0;
  uint64_t v15 = 0;
LABEL_6:
  uint64_t v16 = *v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692D11C8);
  uint64_t v17 = (void *)(v15 | v13);
  if (v15 | v13)
  {
    v20[0] = 0;
    v20[1] = 0;
    uint64_t v17 = v20;
    v20[2] = v13;
    v20[3] = v15;
  }
  v19[1] = 1;
  v19[2] = v17;
  v19[3] = v16;
  swift_task_create();
  return swift_release();
}

uint64_t sub_247EA98D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[6] = a5;
  v6[7] = a6;
  v6[4] = a3;
  v6[5] = a4;
  _OWORD v6[2] = a1;
  v6[3] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692D1260);
  v6[8] = swift_task_alloc();
  uint64_t v7 = sub_247EBC7F0();
  v6[9] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v6[10] = v8;
  v6[11] = *(void *)(v8 + 64);
  v6[12] = swift_task_alloc();
  uint64_t v9 = sub_247EBC7D0();
  v6[13] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v6[14] = v10;
  v6[15] = *(void *)(v10 + 64);
  v6[16] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692D1158);
  v6[17] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_247EA9A64, 0, 0);
}

uint64_t sub_247EA9A64()
{
  uint64_t v1 = v0[17];
  uint64_t v2 = v0[14];
  uint64_t v3 = v0[13];
  uint64_t v22 = v0[15];
  uint64_t v17 = v0[10];
  uint64_t v18 = v0[16];
  uint64_t v20 = v0[9];
  uint64_t v21 = v0[12];
  uint64_t v19 = v0[7];
  uint64_t v4 = v0[5];
  uint64_t v16 = v0[6];
  uint64_t v5 = v0[4];
  uint64_t v6 = sub_247EBC540();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
  v7(v1, 1, 1, v6);
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = v5;
  v8[5] = v4;
  swift_retain();
  sub_247EA96EC(v1, (uint64_t)&unk_2692D1270, (uint64_t)v8);
  sub_247EAE614(v1, &qword_2692D1158);
  sub_247EBC520();
  v7(v1, 0, 1, v6);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v18, v16, v3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v21, v19, v20);
  unint64_t v9 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  unint64_t v10 = (v22 + *(unsigned __int8 *)(v17 + 80) + v9) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = 0;
  *(void *)(v11 + 24) = 0;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v2 + 32))(v11 + v9, v18, v3);
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v17 + 32))(v11 + v10, v21, v20);
  sub_247EA96EC(v1, (uint64_t)&unk_2692D1280, v11);
  sub_247EAE614(v1, &qword_2692D1158);
  uint64_t v12 = (void *)swift_task_alloc();
  v0[18] = v12;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D1288);
  *uint64_t v12 = v0;
  v12[1] = sub_247EA9D40;
  uint64_t v14 = v0[8];
  return MEMORY[0x270FA2048](v14, 0, 0, v13);
}

uint64_t sub_247EA9D40()
{
  *(void *)(*(void *)v1 + 152) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_247EA9F78;
  }
  else {
    uint64_t v2 = sub_247EA9E54;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_247EA9E54()
{
  uint64_t v1 = v0[8];
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D11C8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(v1, 1, v2);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    sub_247EAE3CC(v1, v0[2], &qword_2692D11C8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2692D0F90);
    sub_247EBC5A0();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = (uint64_t (*)(void))v0[1];
    return v4();
  }
  return result;
}

uint64_t sub_247EA9F78()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692D11C8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692D0F90);
  sub_247EBC5A0();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_247EAA04C(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v8 = (uint64_t (*)(uint64_t))((char *)a4 + *a4);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v6;
  *uint64_t v6 = v4;
  v6[1] = sub_247EAEFAC;
  return v8(a1);
}

uint64_t sub_247EAA128(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 40) = a4;
  *(void *)(v5 + 48) = a5;
  uint64_t v8 = sub_247EBC7D0();
  *(void *)(v5 + 56) = v8;
  *(void *)(v5 + 64) = *(void *)(v8 - 8);
  *(void *)(v5 + 72) = swift_task_alloc();
  *(void *)(v5 + 80) = swift_task_alloc();
  uint64_t v9 = sub_247EBC7F0();
  *(void *)(v5 + 88) = v9;
  *(void *)(v5 + 96) = *(void *)(v9 - 8);
  *(void *)(v5 + 104) = swift_task_alloc();
  *(void *)(v5 + 16) = 0;
  *(void *)(v5 + 24) = 0;
  *(unsigned char *)(v5 + 32) = 1;
  unint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v5 + 112) = v10;
  uint64_t v11 = sub_247EAEF60(&qword_2692D1290, MEMORY[0x263F8F740]);
  *unint64_t v10 = v5;
  v10[1] = sub_247EAA304;
  return MEMORY[0x270FA1FF8](a4, v5 + 16, a5, v9, v11);
}

uint64_t sub_247EAA304()
{
  swift_task_dealloc();
  if (v0) {

  }
  return MEMORY[0x270FA2498](sub_247EAA41C, 0, 0);
}

uint64_t sub_247EAA41C()
{
  uint64_t v2 = v0[12];
  uint64_t v1 = v0[13];
  uint64_t v4 = v0[10];
  uint64_t v3 = v0[11];
  uint64_t v6 = v0[8];
  uint64_t v5 = v0[9];
  uint64_t v7 = v0[7];
  uint64_t v8 = v0[5];
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 16))(v1, v0[6], v3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v4, v8, v7);
  sub_247EBC790();
  uint64_t v15 = sub_247EBC740();
  uint64_t v10 = v9;
  uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  v11(v4, v7);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  v11(v5, v7);
  sub_247EAEA94();
  swift_allocError();
  *uint64_t v12 = v15;
  v12[1] = v10;
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v13 = (uint64_t (*)(void))v0[1];
  return v13();
}

uint64_t sub_247EAA594(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_247EAEFAC;
  return v6();
}

uint64_t sub_247EAA660(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_247EAEFAC;
  return v7();
}

uint64_t sub_247EAA72C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_247EBC540();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_247EBC530();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_247EAE614(a1, &qword_2692D1158);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_247EBC4C0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_247EAA8D8(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_247EAA9B4;
  return v6(a1);
}

uint64_t sub_247EAA9B4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

void *sub_247EAAAAC(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_2692D1120);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
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
    sub_247EAC5C0(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_247EAABD0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_247EAACA4(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_247EADD10((uint64_t)v12, *a3);
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
      sub_247EADD10((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_247EAACA4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_247EBC640();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_247EAAE60(a5, a6);
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
  uint64_t v8 = sub_247EBC6D0();
  if (!v8)
  {
    sub_247EBC820();
    __break(1u);
LABEL_17:
    uint64_t result = sub_247EBC880();
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

uint64_t sub_247EAAE60(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_247EAAEF8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_247EAB0D8(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_247EAB0D8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_247EAAEF8(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_247EAB070(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_247EBC6B0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_247EBC820();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_247EBC490();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_247EBC880();
    __break(1u);
LABEL_14:
    uint64_t result = sub_247EBC820();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_247EAB070(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692D10E8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_247EAB0D8(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2692D10E8);
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
  uint64_t result = sub_247EBC880();
  __break(1u);
  return result;
}

double sub_247EAB228@<D0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_247EAFA54(a1, a2);
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
      sub_247EB7878();
      uint64_t v11 = v13;
    }
    sub_247E9D58C(*(void *)(*(void *)(v11 + 48) + 16 * v8), *(void *)(*(void *)(v11 + 48) + 16 * v8 + 8));
    sub_247EADA8C((long long *)(*(void *)(v11 + 56) + 40 * v8), a3);
    sub_247EAB334(v8, v11);
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

unint64_t sub_247EAB334(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    double result = sub_247EBC660();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        uint64_t v11 = (uint64_t *)(*(void *)(a2 + 48) + 16 * v6);
        uint64_t v13 = *v11;
        unint64_t v12 = v11[1];
        sub_247EBC9D0();
        switch(v12)
        {
          case 0uLL:
          case 1uLL:
          case 2uLL:
          case 3uLL:
          case 4uLL:
          case 5uLL:
          case 6uLL:
            sub_247EBC9E0();
            break;
          default:
            sub_247EBC9E0();
            swift_bridgeObjectRetain();
            sub_247EBC470();
            break;
        }
        uint64_t v14 = sub_247EBC9F0();
        double result = sub_247E9D58C(v13, v12);
        unint64_t v15 = v14 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v15 < v8) {
            goto LABEL_5;
          }
        }
        else if (v15 >= v8)
        {
          goto LABEL_14;
        }
        if (v3 >= (uint64_t)v15)
        {
LABEL_14:
          uint64_t v16 = *(void *)(a2 + 48);
          uint64_t v17 = (_OWORD *)(v16 + 16 * v3);
          uint64_t v18 = (_OWORD *)(v16 + 16 * v6);
          if (v3 != v6 || v17 >= v18 + 1) {
            *uint64_t v17 = *v18;
          }
          uint64_t v19 = *(void *)(a2 + 56);
          unint64_t v20 = v19 + 40 * v3;
          uint64_t v21 = (long long *)(v19 + 40 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v20 >= (unint64_t)v21 + 40))
          {
            long long v9 = *v21;
            long long v10 = v21[1];
            *(void *)(v20 + 32) = *((void *)v21 + 4);
            *(_OWORD *)unint64_t v20 = v9;
            *(_OWORD *)(v20 + 16) = v10;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v22 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v23 = *v22;
    uint64_t v24 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v22 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v24 = *v22;
    uint64_t v23 = (-1 << result) - 1;
  }
  uint64_t *v22 = v24 & v23;
  uint64_t v25 = *(void *)(a2 + 16);
  BOOL v26 = __OFSUB__(v25, 1);
  uint64_t v27 = v25 - 1;
  if (v26)
  {
    __break(1u);
    JUMPOUT(0x247EAB5B4);
  }
  *(void *)(a2 + 16) = v27;
  ++*(_DWORD *)(a2 + 36);
  return result;
}

uint64_t sub_247EAB5D0(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 16);
  int64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  int isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    unint64_t v8 = *(void *)(a1 + 16);
    if (v8) {
      goto LABEL_5;
    }
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  if (v4 <= v5) {
    int64_t v15 = v4 + v2;
  }
  else {
    int64_t v15 = v4;
  }
  int64_t v3 = sub_247EAAAAC(isUniquelyReferenced_nonNull_native, v15, 1, v3);
  unint64_t v8 = *(void *)(a1 + 16);
  if (!v8) {
    goto LABEL_18;
  }
LABEL_5:
  uint64_t v9 = v3[2];
  if ((v3[3] >> 1) - v9 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v10 = (unint64_t)&v3[5 * v9 + 4];
  if (a1 + 32 < v10 + 40 * v8 && v10 < a1 + 32 + 40 * v8) {
    goto LABEL_24;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692D1128);
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v12 = v3[2];
  BOOL v13 = __OFADD__(v12, v8);
  uint64_t v14 = v12 + v8;
  if (!v13)
  {
    v3[2] = v14;
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_247EBC880();
  __break(1u);
  return result;
}

uint64_t sub_247EAB748(uint64_t a1)
{
  unint64_t v2 = v1;
  int64_t v4 = *v1;
  unint64_t v5 = v4[2];
  int isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  *unint64_t v2 = v4;
  if (!isUniquelyReferenced_nonNull_native || (unint64_t v7 = v4[3] >> 1, v7 <= v5))
  {
    int64_t v4 = sub_247EAAAAC(isUniquelyReferenced_nonNull_native, v5 + 1, 1, v4);
    *unint64_t v2 = v4;
    unint64_t v7 = v4[3] >> 1;
  }
  uint64_t v8 = v4[2];
  uint64_t v9 = v7 - v8;
  uint64_t v10 = (uint64_t)&v4[5 * v8 + 4];
  sub_247EAEEFC(a1, (uint64_t)v27, &qword_2692D10B0);
  uint64_t v11 = sub_247EABED8((uint64_t)&v28, v10, v9);
  sub_247EAE614(a1, &qword_2692D10B0);
  if (v11 < 1)
  {
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v12 = (*v2)[2];
  BOOL v13 = __OFADD__(v12, v11);
  uint64_t v14 = v12 + v11;
  if (v13)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  (*v2)[2] = v14;
  if (v11 != v9)
  {
    int64_t v15 = &qword_2692D1110;
    uint64_t v16 = &v28;
    return sub_247EAE614((uint64_t)v16, v15);
  }
LABEL_11:
  int64_t v18 = (*v2)[2];
  sub_247EAE3CC((uint64_t)&v28, (uint64_t)v27, &qword_2692D1118);
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v30 = 0;
  sub_247EAEEFC((uint64_t)v27, (uint64_t)&v25, &qword_2692D1118);
  while (v26)
  {
    sub_247EAE614((uint64_t)&v25, &qword_2692D1118);
    unint64_t v20 = *v2;
    unint64_t v21 = (*v2)[3];
    int64_t v19 = v21 >> 1;
    if ((uint64_t)(v21 >> 1) < v18 + 1)
    {
      unint64_t v20 = sub_247EAAAAC((void *)(v21 > 1), v18 + 1, 1, *v2);
      *unint64_t v2 = v20;
      int64_t v19 = v20[3] >> 1;
    }
    sub_247EAEEFC((uint64_t)v27, (uint64_t)&v23, &qword_2692D1118);
    if (v24)
    {
      if (v18 > v19) {
        int64_t v19 = v18;
      }
      uint64_t v22 = (uint64_t)&v20[5 * v18 + 4];
      while (1)
      {
        sub_247EADA8C(&v23, (uint64_t)&v25);
        if (v19 == v18) {
          break;
        }
        sub_247EAE614((uint64_t)v27, &qword_2692D1118);
        sub_247EADA8C(&v25, v22);
        ++v18;
        sub_247EAE3CC((uint64_t)&v28, (uint64_t)v27, &qword_2692D1118);
        long long v28 = 0u;
        long long v29 = 0u;
        uint64_t v30 = 0;
        sub_247EAEEFC((uint64_t)v27, (uint64_t)&v23, &qword_2692D1118);
        v22 += 40;
        if (!v24) {
          goto LABEL_13;
        }
      }
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v25);
      int64_t v18 = v19;
    }
    else
    {
LABEL_13:
      sub_247EAE614((uint64_t)&v23, &qword_2692D1118);
      int64_t v19 = v18;
    }
    (*v2)[2] = v19;
    sub_247EAEEFC((uint64_t)v27, (uint64_t)&v25, &qword_2692D1118);
  }
  sub_247EAE614((uint64_t)v27, &qword_2692D1118);
  sub_247EAE614((uint64_t)&v28, &qword_2692D1110);
  uint64_t v16 = &v25;
  int64_t v15 = &qword_2692D1118;
  return sub_247EAE614((uint64_t)v16, v15);
}

char *sub_247EABA08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  uint64_t ObjectType = swift_getObjectType();
  v30[3] = &type metadata for SignedRequestManager;
  v30[4] = &off_26FC211C8;
  uint64_t v13 = swift_allocObject();
  v30[0] = v13;
  long long v14 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v13 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v13 + 32) = v14;
  *(void *)(v13 + 48) = *(void *)(a1 + 32);
  long long v28 = &type metadata for CoreAnalyticsReporter;
  long long v29 = &off_26FC20928;
  swift_defaultActor_initialize();
  swift_retain();
  sub_247EBC760();
  int64_t v15 = (char *)a6 + OBJC_IVAR____ACSBatteryServiceBookingCoordinator_lastPrepareInstant;
  uint64_t v16 = sub_247EBC750();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v15, 1, 1, v16);
  *(void *)((char *)a6 + OBJC_IVAR____ACSBatteryServiceBookingCoordinator_retrieveSupportHandoffURLTask) = 0;
  sub_247E9D384((uint64_t)v30, (uint64_t)(a6 + 14));
  a6[19] = a2;
  a6[20] = a3;
  a6[21] = a4;
  sub_247E9D384((uint64_t)v27, (uint64_t)(a6 + 22));
  swift_retain();
  swift_retain();
  swift_release();
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  if ((sub_247EAF4B4() & 0x100000000) == 0)
  {
    uint64_t v17 = sub_247EBC900();
    uint64_t v18 = v19;
  }
  v26.receiver = a6;
  v26.super_class = (Class)type metadata accessor for BatteryServiceBookingCoordinator();
  id v20 = objc_msgSendSuper2(&v26, sel_init);
  unint64_t v21 = (void *)swift_allocObject();
  v21[2] = v20;
  v21[3] = v17;
  v21[4] = v18;
  v21[5] = ObjectType;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692D11E8);
  uint64_t v22 = swift_allocObject();
  long long v23 = (char *)v20;
  swift_defaultActor_initialize();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692D1060);
  swift_storeEnumTagMultiPayload();
  uint64_t v24 = (void *)(v22 + *(void *)(*(void *)v22 + 120));
  *uint64_t v24 = &unk_2692D1228;
  v24[1] = v21;

  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v27);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
  *(void *)&v23[OBJC_IVAR____ACSBatteryServiceBookingCoordinator_retrieveSupportHandoffURLTask] = v22;
  swift_release();
  return v23;
}

char *sub_247EABCB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  v25[3] = &type metadata for SignedRequestManager;
  v25[4] = &off_26FC211C8;
  uint64_t v10 = swift_allocObject();
  v25[0] = v10;
  long long v11 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v10 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v10 + 32) = v11;
  *(void *)(v10 + 48) = *(void *)(a1 + 32);
  long long v23 = &type metadata for CoreAnalyticsReporter;
  uint64_t v24 = &off_26FC20928;
  type metadata accessor for BatteryServiceBookingCoordinator();
  uint64_t v12 = (void *)swift_allocObject();
  uint64_t v13 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v25, (uint64_t)&type metadata for SignedRequestManager);
  MEMORY[0x270FA5388](v13, v13);
  int64_t v15 = &v22[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(unsigned char *))(v16 + 16))(v15);
  uint64_t v17 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v22, (uint64_t)&type metadata for CoreAnalyticsReporter);
  MEMORY[0x270FA5388](v17, v17);
  (*(void (**)(void))(v18 + 16))();
  long long v19 = *((_OWORD *)v15 + 1);
  v26[0] = *(_OWORD *)v15;
  v26[1] = v19;
  uint64_t v27 = *((void *)v15 + 4);
  id v20 = sub_247EABA08((uint64_t)v26, a2, a3, a4, a5, v12);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
  return v20;
}

uint64_t sub_247EABED8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int64_t v4 = v3;
  sub_247EADA8C(v4, (uint64_t)v14);
  uint64_t v13 = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t result = sub_247EAE368((uint64_t)v14, (uint64_t)&v11, &qword_2692D1118);
  long long v15 = v11;
  long long v16 = v12;
  uint64_t v17 = v13;
  if (!a2)
  {
    a3 = 0;
    goto LABEL_12;
  }
  if (!a3)
  {
LABEL_12:
    long long v10 = v16;
    *(_OWORD *)a1 = v15;
    *(_OWORD *)(a1 + 16) = v10;
    *(void *)(a1 + 32) = v17;
    return a3;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    sub_247EAE3CC((uint64_t)&v15, (uint64_t)&v11, &qword_2692D1118);
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v17 = 0;
    if (*((void *)&v12 + 1))
    {
      uint64_t v9 = 0;
      while (1)
      {
        sub_247EADA8C(&v11, (uint64_t)v14);
        sub_247EADA8C(v14, a2);
        if (a3 - 1 == v9) {
          break;
        }
        a2 += 40;
        sub_247EAE3CC((uint64_t)&v15, (uint64_t)&v11, &qword_2692D1118);
        long long v15 = 0u;
        long long v16 = 0u;
        uint64_t v17 = 0;
        ++v9;
        if (!*((void *)&v12 + 1)) {
          goto LABEL_11;
        }
      }
    }
    else
    {
      uint64_t v9 = 0;
LABEL_11:
      sub_247EAE614((uint64_t)&v11, &qword_2692D1118);
      a3 = v9;
    }
    goto LABEL_12;
  }
  __break(1u);
  return result;
}

uint64_t sub_247EAC024(uint64_t a1, uint64_t a2, unint64_t a3, char a4, void *a5)
{
  *(void *)&long long v28 = a1;
  uint64_t v9 = MEMORY[0x263F8D6C8];
  uint64_t v29 = MEMORY[0x263F8D6C8];
  uint64_t v30 = &off_26FC21058;
  long long v10 = (void *)*a5;
  unint64_t v12 = sub_247EAFA54(a2, a3);
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
    uint64_t v18 = (void *)*a5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7] + 40 * v12;
      __swift_destroy_boxed_opaque_existential_1(v19);
      return sub_247EADA8C(&v28, v19);
    }
    goto LABEL_11;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_247EB7878();
    goto LABEL_7;
  }
  sub_247EB716C(v15, a4 & 1);
  unint64_t v21 = sub_247EAFA54(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_14:
    uint64_t result = sub_247EBC950();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  uint64_t v18 = (void *)*a5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  uint64_t v23 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v28, v9);
  MEMORY[0x270FA5388](v23, v23);
  long long v25 = (uint64_t *)((char *)&v27 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v26 + 16))(v25);
  sub_247EAC454(v12, a2, a3, *v25, v18);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v28);
  return sub_247E9D3E8(a2, a3);
}

uint64_t sub_247EAC21C(uint64_t a1, uint64_t a2, unint64_t a3, char a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v34 = a6;
  uint64_t v35 = a7;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v33);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a6 - 8) + 32))(boxed_opaque_existential_1, a1, a6);
  uint64_t v15 = (void *)*a5;
  unint64_t v17 = sub_247EAFA54(a2, a3);
  uint64_t v18 = v15[2];
  BOOL v19 = (v16 & 1) == 0;
  uint64_t v20 = v18 + v19;
  if (__OFADD__(v18, v19))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v21 = v16;
  uint64_t v22 = v15[3];
  if (v22 >= v20 && (a4 & 1) != 0)
  {
LABEL_7:
    uint64_t v23 = (void *)*a5;
    if (v21)
    {
LABEL_8:
      uint64_t v24 = v23[7] + 40 * v17;
      __swift_destroy_boxed_opaque_existential_1(v24);
      return sub_247EADA8C(&v33, v24);
    }
    goto LABEL_11;
  }
  if (v22 >= v20 && (a4 & 1) == 0)
  {
    sub_247EB7878();
    goto LABEL_7;
  }
  sub_247EB716C(v20, a4 & 1);
  unint64_t v26 = sub_247EAFA54(a2, a3);
  if ((v21 & 1) != (v27 & 1))
  {
LABEL_14:
    uint64_t result = sub_247EBC950();
    __break(1u);
    return result;
  }
  unint64_t v17 = v26;
  uint64_t v23 = (void *)*a5;
  if (v21) {
    goto LABEL_8;
  }
LABEL_11:
  uint64_t v28 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v33, v34);
  MEMORY[0x270FA5388](v28, v28);
  uint64_t v30 = (char *)&v32 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v31 + 16))(v30);
  sub_247EAC4E8(v17, a2, a3, (uint64_t)v30, v23, a6, a7);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v33);
  return sub_247E9D3E8(a2, a3);
}

uint64_t sub_247EAC454(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  *(void *)&long long v11 = a4;
  uint64_t v12 = MEMORY[0x263F8D6C8];
  uint64_t v13 = &off_26FC21058;
  a5[(a1 >> 6) + 8] |= 1 << a1;
  unint64_t v6 = (void *)(a5[6] + 16 * a1);
  *unint64_t v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_247EADA8C(&v11, a5[7] + 40 * a1);
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

uint64_t sub_247EAC4E8(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v20 = a6;
  uint64_t v21 = a7;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v19);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a6 - 8) + 32))(boxed_opaque_existential_1, a4, a6);
  a5[(a1 >> 6) + 8] |= 1 << a1;
  BOOL v14 = (void *)(a5[6] + 16 * a1);
  *BOOL v14 = a2;
  v14[1] = a3;
  uint64_t result = sub_247EADA8C(&v19, a5[7] + 40 * a1);
  uint64_t v16 = a5[2];
  BOOL v17 = __OFADD__(v16, 1);
  uint64_t v18 = v16 + 1;
  if (v17) {
    __break(1u);
  }
  else {
    a5[2] = v18;
  }
  return result;
}

uint64_t sub_247EAC5C0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_2692D1128);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_247EBC880();
  __break(1u);
  return result;
}

uint64_t sub_247EAC6D0(uint64_t a1)
{
  uint64_t v2 = sub_247EBCA90();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v2, v4);
  unint64_t v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5, v8);
  uint64_t v39 = (char *)&v32 - v9;
  uint64_t v10 = *(void *)(a1 + 16);
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2692D10F0);
    uint64_t v11 = sub_247EBC690();
    uint64_t v12 = 0;
    BOOL v14 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v13 = v3 + 16;
    uint64_t v37 = v14;
    uint64_t v38 = v11 + 56;
    uint64_t v15 = *(unsigned __int8 *)(v13 + 64);
    uint64_t v34 = v10;
    uint64_t v35 = a1 + ((v15 + 32) & ~v15);
    uint64_t v16 = *(void *)(v13 + 56);
    BOOL v17 = (void (**)(char *, uint64_t))(v13 - 8);
    long long v33 = (uint64_t (**)(unint64_t, char *, uint64_t))(v13 + 16);
    while (1)
    {
      uint64_t v36 = v12;
      v37(v39, v35 + v16 * v12, v2);
      sub_247EAEF60(&qword_2692D10F8, MEMORY[0x263F07EC8]);
      uint64_t v18 = sub_247EBC3E0();
      uint64_t v19 = ~(-1 << *(unsigned char *)(v11 + 32));
      unint64_t v20 = v18 & v19;
      unint64_t v21 = (v18 & (unint64_t)v19) >> 6;
      uint64_t v22 = *(void *)(v38 + 8 * v21);
      uint64_t v23 = 1 << (v18 & v19);
      if ((v23 & v22) != 0)
      {
        while (1)
        {
          uint64_t v24 = v13;
          v37(v7, *(void *)(v11 + 48) + v20 * v16, v2);
          sub_247EAEF60(&qword_2692D1100, MEMORY[0x263F07EC8]);
          char v25 = sub_247EBC3F0();
          unint64_t v26 = *v17;
          (*v17)(v7, v2);
          if (v25) {
            break;
          }
          unint64_t v20 = (v20 + 1) & v19;
          unint64_t v21 = v20 >> 6;
          uint64_t v22 = *(void *)(v38 + 8 * (v20 >> 6));
          uint64_t v23 = 1 << v20;
          uint64_t v13 = v24;
          if ((v22 & (1 << v20)) == 0) {
            goto LABEL_8;
          }
        }
        v26(v39, v2);
        uint64_t v13 = v24;
      }
      else
      {
LABEL_8:
        char v27 = v39;
        *(void *)(v38 + 8 * v21) = v23 | v22;
        uint64_t result = (*v33)(*(void *)(v11 + 48) + v20 * v16, v27, v2);
        uint64_t v29 = *(void *)(v11 + 16);
        BOOL v30 = __OFADD__(v29, 1);
        uint64_t v31 = v29 + 1;
        if (v30)
        {
          __break(1u);
          return result;
        }
        *(void *)(v11 + 16) = v31;
      }
      uint64_t v12 = v36 + 1;
      if (v36 + 1 == v34) {
        return v11;
      }
    }
  }
  return MEMORY[0x263F8EE88];
}

uint64_t sub_247EAC9E8(uint64_t a1, uint64_t a2)
{
  v2[9] = a1;
  v2[10] = a2;
  uint64_t v4 = sub_247EBC3B0();
  v2[11] = v4;
  v2[12] = *(void *)(v4 - 8);
  v2[13] = swift_task_alloc();
  v2[14] = swift_task_alloc();
  v2[15] = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D11C8);
  v2[16] = swift_task_alloc();
  uint64_t v5 = sub_247EBC2B0();
  v2[17] = v5;
  v2[18] = *(void *)(v5 - 8);
  v2[19] = swift_task_alloc();
  v2[20] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_247EACB5C, a1, 0);
}

void sub_247EACB5C()
{
  uint64_t v1 = *(void *)(v0[9] + OBJC_IVAR____ACSBatteryServiceBookingCoordinator_retrieveSupportHandoffURLTask);
  v0[21] = v1;
  if (v1)
  {
    uint64_t v4 = (void (*)(uint64_t))((char *)&dword_2692D11D0 + dword_2692D11D0);
    swift_retain();
    uint64_t v2 = (void *)swift_task_alloc();
    v0[22] = v2;
    *uint64_t v2 = v0;
    v2[1] = sub_247EACC30;
    uint64_t v3 = v0[16];
    v4(v3);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_247EACC30()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 184) = v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v3 = *(void *)(v2 + 72);
  if (v0) {
    uint64_t v4 = sub_247EAD380;
  }
  else {
    uint64_t v4 = sub_247EACD78;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_247EACD78()
{
  uint64_t v1 = v0[20];
  uint64_t v2 = v0[18];
  uint64_t v3 = (void *)v0[10];
  uint64_t v4 = *(void *)(v0[16] + *(int *)(v0[15] + 48));
  v0[24] = v4;
  (*(void (**)(uint64_t))(v2 + 32))(v1);
  *uint64_t v3 = v4;
  swift_retain();
  swift_release();
  if (qword_2692D0DB8 != -1) {
    swift_once();
  }
  uint64_t v5 = v0[14];
  uint64_t v6 = v0[11];
  uint64_t v7 = v0[12];
  uint64_t v8 = __swift_project_value_buffer(v6, (uint64_t)qword_2692D2D78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v5, v8, v6);
  uint64_t v9 = sub_247EBC390();
  os_log_type_t v10 = sub_247EBC5E0();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_247E99000, v9, v10, "Opening handoff URL.", v11, 2u);
    MEMORY[0x24C56FD50](v11, -1, -1);
  }
  uint64_t v12 = v0[14];
  uint64_t v13 = v0[11];
  uint64_t v14 = v0[12];
  uint64_t v15 = (uint64_t *)v0[10];

  uint64_t v16 = (uint64_t (*)())(*(uint64_t (**)(uint64_t, uint64_t))(v14 + 8))(v12, v13);
  uint64_t v19 = *v15;
  v0[25] = *v15;
  if (v19)
  {
    swift_retain();
    uint64_t v16 = sub_247EACF3C;
    uint64_t v17 = v19;
    uint64_t v18 = 0;
  }
  else
  {
    __break(1u);
  }
  return MEMORY[0x270FA2498](v16, v17, v18);
}

uint64_t sub_247EACF3C()
{
  uint64_t v6 = v0;
  uint64_t v1 = *(void *)(v0 + 72);
  *((void *)&v4 + 1) = MEMORY[0x263F8D310];
  uint64_t v5 = &off_26FC21048;
  *(void *)&long long v3 = 0x73736563637573;
  *((void *)&v3 + 1) = 0xE700000000000000;
  swift_beginAccess();
  sub_247EA0E74((uint64_t)&v3, 0, 1uLL);
  uint64_t v5 = 0;
  long long v3 = 0u;
  long long v4 = 0u;
  sub_247EA0E74((uint64_t)&v3, 0, 2uLL);
  swift_endAccess();
  swift_release();
  return MEMORY[0x270FA2498](sub_247EAD038, v1, 0);
}

uint64_t sub_247EAD038()
{
  uint64_t v1 = v0[9];
  v0[26] = *(void *)(v1 + 152);
  v0[27] = *(void *)(v1 + 160);
  sub_247EBC510();
  v0[28] = sub_247EBC500();
  uint64_t v3 = sub_247EBC4C0();
  return MEMORY[0x270FA2498](sub_247EAD0E0, v3, v2);
}

uint64_t sub_247EAD0E0()
{
  uint64_t v1 = (void (*)(uint64_t))v0[26];
  uint64_t v2 = v0[20];
  uint64_t v3 = v0[9];
  swift_release();
  v1(v2);
  return MEMORY[0x270FA2498](sub_247EAD168, v3, 0);
}

uint64_t sub_247EAD168()
{
  uint64_t v1 = v0[20];
  uint64_t v2 = v0[17];
  uint64_t v3 = v0[18];
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  long long v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_247EAD224()
{
  uint64_t v1 = (void (*)(uint64_t))v0[29];
  uint64_t v3 = v0[18];
  uint64_t v2 = v0[19];
  uint64_t v4 = v0[17];
  uint64_t v5 = v0[9];
  swift_release();
  v1(v2);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  return MEMORY[0x270FA2498](sub_247EAD2D0, v5, 0);
}

uint64_t sub_247EAD2D0()
{
  uint64_t v1 = *(void **)(v0 + 184);

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_247EAD380()
{
  uint64_t v1 = (void *)v0[23];
  v0[7] = v1;
  uint64_t v2 = (void *)v0[10];
  id v3 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692D0F90);
  swift_dynamicCast();
  uint64_t v4 = v0[6];
  v0[32] = v0[5];
  v0[33] = v4;
  *uint64_t v2 = v4;
  swift_retain();
  swift_release();
  if (qword_2692D0DB8 != -1) {
    swift_once();
  }
  uint64_t v5 = (void *)v0[23];
  uint64_t v7 = v0[12];
  uint64_t v6 = v0[13];
  uint64_t v8 = v0[11];
  uint64_t v9 = __swift_project_value_buffer(v8, (uint64_t)qword_2692D2D78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v6, v9, v8);
  id v10 = v5;
  id v11 = v5;
  uint64_t v12 = sub_247EBC390();
  os_log_type_t v13 = sub_247EBC5F0();
  BOOL v14 = os_log_type_enabled(v12, v13);
  uint64_t v15 = (void *)v0[23];
  if (v14)
  {
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    uint64_t v17 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v16 = 138412290;
    id v18 = v15;
    uint64_t v19 = _swift_stdlib_bridgeErrorToNSError();
    v0[8] = v19;
    sub_247EBC630();
    *uint64_t v17 = v19;

    _os_log_impl(&dword_247E99000, v12, v13, "Failed to retrieve handoff URL: '%@'. Using fallback URL.", v16, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2692D11D8);
    swift_arrayDestroy();
    MEMORY[0x24C56FD50](v17, -1, -1);
    MEMORY[0x24C56FD50](v16, -1, -1);
  }
  else
  {
  }
  uint64_t v21 = v0[12];
  uint64_t v20 = v0[13];
  uint64_t v22 = v0[11];
  uint64_t v23 = v0[9];

  (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v20, v22);
  v0[29] = *(void *)(v23 + 152);
  v0[30] = *(void *)(v23 + 160);
  if (qword_2692D0DA8 != -1) {
    swift_once();
  }
  uint64_t v25 = v0[18];
  uint64_t v24 = v0[19];
  uint64_t v26 = v0[17];
  uint64_t v27 = __swift_project_value_buffer(v26, (uint64_t)qword_2692D2D38);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 16))(v24, v27, v26);
  sub_247EBC510();
  v0[31] = sub_247EBC500();
  uint64_t v29 = sub_247EBC4C0();
  return MEMORY[0x270FA2498](sub_247EAD224, v29, v28);
}

uint64_t sub_247EAD6BC()
{
  return type metadata accessor for BatteryServiceBookingCoordinator();
}

uint64_t type metadata accessor for BatteryServiceBookingCoordinator()
{
  uint64_t result = qword_2692D1068;
  if (!qword_2692D1068) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_247EAD710()
{
  sub_247EBC770();
  if (v0 <= 0x3F)
  {
    sub_247EADA34();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t method lookup function for BatteryServiceBookingCoordinator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for BatteryServiceBookingCoordinator);
}

uint64_t dispatch thunk of BatteryServiceBookingCoordinator.prepareBatteryServiceBookingFlow()()
{
  uint64_t v2 = *(int **)((*MEMORY[0x263F8EED0] & *v0) + 0xC8);
  uint64_t v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  id v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *id v3 = v1;
  v3[1] = sub_247EAEFAC;
  return v5();
}

uint64_t dispatch thunk of BatteryServiceBookingCoordinator.launchBatteryServiceBookingFlow()()
{
  uint64_t v2 = *(int **)((*MEMORY[0x263F8EED0] & *v0) + 0xD0);
  uint64_t v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  id v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *id v3 = v1;
  v3[1] = sub_247EAEFAC;
  return v5();
}

void sub_247EADA34()
{
  if (!qword_2692D1098)
  {
    sub_247EBC750();
    unint64_t v0 = sub_247EBC620();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2692D1098);
    }
  }
}

uint64_t sub_247EADA8C(long long *a1, uint64_t a2)
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

unint64_t sub_247EADAF4()
{
  unint64_t result = qword_2692D10A8;
  if (!qword_2692D10A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692D10A8);
  }
  return result;
}

uint64_t sub_247EADB48(uint64_t a1)
{
  return a1;
}

uint64_t sub_247EADB74(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CompositeHTTPHeadersProvider();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_247EADBD0()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_247EAEFAC;
  return sub_247EB20F4(v2, v3, v4);
}

void sub_247EADC78(uint64_t a1, unint64_t a2, void *a3)
{
  if (a3)
  {
    sub_247E9F158(a1, a2);
  }
}

uint64_t sub_247EADCB8(uint64_t a1, unint64_t a2)
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

uint64_t sub_247EADD10(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_247EADD6C(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2[2];
  uint64_t v7 = v2[3];
  uint64_t v8 = v2[4];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v9;
  void *v9 = v3;
  v9[1] = sub_247EAEFAC;
  return sub_247EB44AC(a1, a2, v6, v7, v8);
}

unint64_t sub_247EADE30()
{
  unint64_t result = qword_2692D1140;
  if (!qword_2692D1140)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692D1140);
  }
  return result;
}

unint64_t sub_247EADE84()
{
  unint64_t result = qword_2692D1150;
  if (!qword_2692D1150)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692D1150);
  }
  return result;
}

uint64_t sub_247EADEDC()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_247EA7EA0;
  uint64_t v5 = (uint64_t (*)(const void *, uint64_t))((char *)&dword_2692D1160 + dword_2692D1160);
  return v5(v2, v3);
}

uint64_t sub_247EADF8C()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_247EAEFAC;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_2692D1170 + dword_2692D1170);
  return v6(v2, v3, v4);
}

uint64_t sub_247EAE050(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_247EAEFAC;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_2692D1180 + dword_2692D1180);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_247EAE11C()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_247EAE154(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_247EAEFAC;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2692D1190 + dword_2692D1190);
  return v6(a1, v4);
}

uint64_t objectdestroyTm()
{
  _Block_release(*(const void **)(v0 + 16));
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_247EAE250()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_247EAEFAC;
  uint64_t v5 = (uint64_t (*)(const void *, uint64_t))((char *)&dword_2692D11A0 + dword_2692D11A0);
  return v5(v2, v3);
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

uint64_t sub_247EAE368(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t sub_247EAE3CC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_247EAE430()
{
  unint64_t result = qword_2692D11E0;
  if (!qword_2692D11E0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2692D11E8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692D11E0);
  }
  return result;
}

uint64_t sub_247EAE48C()
{
  return objectdestroy_63Tm(MEMORY[0x263F8EEE8], MEMORY[0x263F8EED8], 40);
}

uint64_t sub_247EAE4BC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_247EAEFAC;
  return sub_247EA77E0(a1, v4, v5, v6);
}

uint64_t sub_247EAE570(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_247EA7EA0;
  return sub_247EA7DC8(a1, v1);
}

uint64_t sub_247EAE60C()
{
  return sub_247EA7F94(v0);
}

uint64_t sub_247EAE614(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_247EAE6D4()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_247EAE71C()
{
  return objectdestroy_63Tm(MEMORY[0x263F8EED8], MEMORY[0x263F8EEA0], 48);
}

uint64_t objectdestroy_63Tm(void (*a1)(void), void (*a2)(void), uint64_t a3)
{
  a1(*(void *)(v3 + 16));
  a2(*(void *)(v3 + 32));
  return MEMORY[0x270FA0238](v3, a3, 7);
}

uint64_t sub_247EAE7B0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_247EAEFAC;
  return sub_247EA198C(a1, v4, v5, v6);
}

uint64_t sub_247EAE870()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_247EAE8B8(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_247EAEFAC;
  return sub_247EA22F0(a1, v4, v5, v7, v6);
}

uint64_t sub_247EAE978(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2[2];
  uint64_t v7 = v2[3];
  uint64_t v9 = v2[4];
  uint64_t v8 = v2[5];
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v10;
  *uint64_t v10 = v3;
  v10[1] = sub_247EAEFAC;
  return sub_247EA98D0(a1, a2, v6, v7, v9, v8);
}

unint64_t sub_247EAEA40()
{
  unint64_t result = qword_2692D1250;
  if (!qword_2692D1250)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692D1250);
  }
  return result;
}

unint64_t sub_247EAEA94()
{
  unint64_t result = qword_2692D1258;
  if (!qword_2692D1258)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692D1258);
  }
  return result;
}

uint64_t objectdestroy_29Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_247EAEB2C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 32);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_247EAEFAC;
  uint64_t v8 = (uint64_t (*)(uint64_t))((char *)v4 + *v4);
  uint64_t v6 = (void *)swift_task_alloc();
  v5[2] = v6;
  *uint64_t v6 = v5;
  v6[1] = sub_247EAEFAC;
  return v8(a1);
}

uint64_t sub_247EAEC50()
{
  uint64_t v1 = sub_247EBC7D0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = sub_247EBC7F0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v4 + v5 + v8) & ~v8;
  uint64_t v10 = v9 + *(void *)(v7 + 64);
  uint64_t v11 = v3 | v8 | 7;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, v6);
  return MEMORY[0x270FA0238](v0, v10, v11);
}

uint64_t sub_247EAEDA8(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_247EBC7D0() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v4 + 64);
  uint64_t v7 = *(unsigned __int8 *)(*(void *)(sub_247EBC7F0() - 8) + 80);
  unint64_t v8 = v5 + v6 + v7;
  uint64_t v9 = *(void *)(v1 + 16);
  uint64_t v10 = *(void *)(v1 + 24);
  uint64_t v11 = v1 + v5;
  uint64_t v12 = v1 + (v8 & ~v7);
  os_log_type_t v13 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v13;
  *os_log_type_t v13 = v2;
  v13[1] = sub_247EAEFAC;
  return sub_247EAA128(a1, v9, v10, v11, v12);
}

uint64_t sub_247EAEEFC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_247EAEF60(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_247EAEFB0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692D12A0);
  uint64_t v2 = sub_247EBC870();
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
    sub_247EAEEFC(v6, (uint64_t)&v15, &qword_2692D12A8);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_247EAF8A4(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_247EB003C(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_247EAF0E8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692D12B0);
  uint64_t v2 = (void *)sub_247EBC870();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v8 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_247EAF8A4(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    uint64_t v12 = (void *)(v2[7] + 16 * result);
    *uint64_t v12 = v8;
    v12[1] = v7;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4 += 4;
    v2[2] = v15;
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

unint64_t sub_247EAF20C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692D12C8);
  uint64_t v2 = sub_247EBC870();
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
    sub_247EAEEFC(v6, (uint64_t)&v13, &qword_2692D12D0);
    uint64_t v7 = v13;
    unint64_t result = sub_247EAF9C0(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_247EB003C(&v14, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_247EAF33C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692D12B8);
  uint64_t v2 = sub_247EBC870();
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
    sub_247EAEEFC(v6, (uint64_t)&v15, &qword_2692D12C0);
    uint64_t v7 = v15;
    unint64_t v8 = v16;
    unint64_t result = sub_247EAFA54(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    BOOL v11 = (uint64_t *)(v3[6] + 16 * result);
    *BOOL v11 = v7;
    v11[1] = v8;
    unint64_t result = sub_247EADA8C(&v17, v3[7] + 40 * result);
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

id BatteryServiceOptions.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

unint64_t sub_247EAF4B4()
{
  uint64_t v1 = sub_247EBC430();
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(v0 + OBJC_IVAR____ACSBatteryServiceOptions_storage);
  if (!*(void *)(v4 + 16))
  {
    long long v12 = 0u;
    long long v13 = 0u;
LABEL_8:
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  uint64_t v5 = v1;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_247EAF8A4(v5, v3);
  if ((v7 & 1) == 0)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  sub_247EADD10(*(void *)(v4 + 56) + 32 * v6, (uint64_t)&v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*((void *)&v13 + 1))
  {
LABEL_9:
    sub_247E9F320((uint64_t)&v12);
    goto LABEL_10;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_10:
    uint64_t v9 = 0;
    unsigned __int8 v8 = 1;
    return v9 | ((unint64_t)v8 << 32);
  }
  unsigned __int8 v8 = 0;
  uint64_t v9 = v11;
  return v9 | ((unint64_t)v8 << 32);
}

id BatteryServiceOptions.init()()
{
  uint64_t v1 = v0;
  *(void *)&v1[OBJC_IVAR____ACSBatteryServiceOptions_storage] = sub_247EAEFB0(MEMORY[0x263F8EE78]);

  v3.receiver = v1;
  v3.super_class = (Class)type metadata accessor for BatteryServiceOptions();
  return objc_msgSendSuper2(&v3, sel_init);
}

uint64_t type metadata accessor for BatteryServiceOptions()
{
  return self;
}

id BatteryServiceOptions.__allocating_init(values:)(uint64_t a1)
{
  objc_super v3 = (char *)objc_allocWithZone(v1);
  *(void *)&v3[OBJC_IVAR____ACSBatteryServiceOptions_storage] = a1;
  v5.receiver = v3;
  v5.super_class = v1;
  return objc_msgSendSuper2(&v5, sel_init);
}

id BatteryServiceOptions.init(values:)(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR____ACSBatteryServiceOptions_storage] = a1;
  v3.receiver = v1;
  v3.super_class = (Class)type metadata accessor for BatteryServiceOptions();
  return objc_msgSendSuper2(&v3, sel_init);
}

uint64_t sub_247EAF7AC@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v5 = *(void *)(v3 + OBJC_IVAR____ACSBatteryServiceOptions_storage);
  if (*(void *)(v5 + 16))
  {
    uint64_t v7 = result;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v8 = sub_247EAF8A4(v7, a2);
    if (v9)
    {
      sub_247EADD10(*(void *)(v5 + 56) + 32 * v8, (uint64_t)a3);
    }
    else
    {
      *a3 = 0u;
      a3[1] = 0u;
    }
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

id BatteryServiceOptions.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BatteryServiceOptions();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_247EAF8A4(uint64_t a1, uint64_t a2)
{
  sub_247EBC9D0();
  sub_247EBC470();
  uint64_t v4 = sub_247EBC9F0();
  return sub_247EAFB78(a1, a2, v4);
}

uint64_t method lookup function for BatteryServiceOptions(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for BatteryServiceOptions);
}

uint64_t dispatch thunk of BatteryServiceOptions.__allocating_init(values:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of BatteryServiceOptions.subscript.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

unint64_t sub_247EAF97C(uint64_t a1)
{
  uint64_t v2 = sub_247EBC600();
  return sub_247EAFC5C(a1, v2);
}

unint64_t sub_247EAF9C0(uint64_t a1)
{
  sub_247EBC430();
  sub_247EBC9D0();
  sub_247EBC470();
  uint64_t v2 = sub_247EBC9F0();
  swift_bridgeObjectRelease();
  return sub_247EAFD68(a1, v2);
}

unint64_t sub_247EAFA54(uint64_t a1, unint64_t a2)
{
  sub_247EBC9D0();
  switch(a2)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
      sub_247EBC9E0();
      break;
    default:
      sub_247EBC9E0();
      sub_247EBC470();
      break;
  }
  uint64_t v4 = sub_247EBC9F0();
  return sub_247EAFEE0(a1, a2, v4);
}

unint64_t sub_247EAFB78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_247EBC910() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        long long v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_247EBC910() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_247EAFC5C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    sub_247E9D5A0();
    id v6 = *(id *)(*(void *)(v2 + 48) + 8 * i);
    char v7 = sub_247EBC610();

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = ~v4;
      for (unint64_t i = (i + 1) & v8; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v8)
      {
        id v9 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v10 = sub_247EBC610();

        if (v10) {
          break;
        }
      }
    }
  }
  return i;
}

unint64_t sub_247EAFD68(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_247EBC430();
    uint64_t v8 = v7;
    if (v6 == sub_247EBC430() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_247EBC910();
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
          uint64_t v13 = sub_247EBC430();
          uint64_t v15 = v14;
          if (v13 == sub_247EBC430() && v15 == v16) {
            break;
          }
          char v18 = sub_247EBC910();
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

unint64_t sub_247EAFEE0(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = ~v5;
    uint64_t v10 = *(void *)(v3 + 48);
    while (2)
    {
      char v11 = (void *)(v10 + 16 * v6);
      uint64_t v12 = v11[1];
      switch(v12)
      {
        case 0:
          if (a2) {
            goto LABEL_4;
          }
          break;
        case 1:
          if (a2 != 1) {
            goto LABEL_4;
          }
          break;
        case 2:
          if (a2 != 2) {
            goto LABEL_4;
          }
          break;
        case 3:
          if (a2 != 3) {
            goto LABEL_4;
          }
          break;
        case 4:
          if (a2 != 4) {
            goto LABEL_4;
          }
          break;
        case 5:
          if (a2 != 5) {
            goto LABEL_4;
          }
          break;
        case 6:
          if (a2 != 6) {
            goto LABEL_4;
          }
          break;
        default:
          if (a2 < 7 || (*v11 == a1 ? (BOOL v13 = v12 == a2) : (BOOL v13 = 0), !v13 && (sub_247EBC910() & 1) == 0))
          {
LABEL_4:
            unint64_t v6 = (v6 + 1) & v9;
            if ((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6)) {
              continue;
            }
          }
          break;
      }
      break;
    }
  }
  return v6;
}

_OWORD *sub_247EB003C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_247EB004C()
{
  swift_defaultActor_destroy();
  return MEMORY[0x270FA2418](v0);
}

uint64_t type metadata accessor for UserDefaultsActor()
{
  return self;
}

ValueMetadata *type metadata accessor for TransactionIDHeadersProvider()
{
  return &type metadata for TransactionIDHeadersProvider;
}

void sub_247EB00B8()
{
  unk_2692D2D77 = -18;
}

unint64_t sub_247EB00E8()
{
  return 0xD00000000000001CLL;
}

uint64_t sub_247EB0104()
{
  uint64_t v1 = sub_247EBC310();
  v0[10] = v1;
  v0[11] = *(void *)(v1 - 8);
  v0[12] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_247EB01C0, 0, 0);
}

uint64_t sub_247EB01C0()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692D0FD0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_247EBD6D0;
  if (qword_2692D0DB0 != -1) {
    swift_once();
  }
  uint64_t v3 = v0[11];
  uint64_t v2 = v0[12];
  uint64_t v4 = v0[10];
  uint64_t v5 = unk_2692D2D70;
  *(void *)(inited + 32) = qword_2692D2D68;
  *(void *)(inited + 40) = v5;
  swift_bridgeObjectRetain();
  sub_247EBC300();
  uint64_t v6 = sub_247EBC2F0();
  uint64_t v8 = v7;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  *(void *)(inited + 48) = v6;
  *(void *)(inited + 56) = v8;
  unint64_t v9 = sub_247EAF0E8(inited);
  swift_task_dealloc();
  uint64_t v10 = (uint64_t (*)(unint64_t))v0[1];
  return v10(v9);
}

uint64_t sub_247EB02EC()
{
  uint64_t result = type metadata accessor for CachingTask.State();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_247EB039C()
{
  uint64_t v1 = v0 + *(void *)(*(void *)v0 + 112);
  uint64_t v2 = type metadata accessor for CachingTask.State();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t sub_247EB0474()
{
  sub_247EB039C();
  return MEMORY[0x270FA2418](v0);
}

uint64_t type metadata accessor for CachingTask()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for CachingTask.State()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_247EB04D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 32);
}

uint64_t sub_247EB04D8()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

void *sub_247EB0574(void *__dst, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v3 = __dst;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  if (*(void *)(v4 + 64) <= 8uLL) {
    uint64_t v5 = 8;
  }
  else {
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  int v6 = *(_DWORD *)(v4 + 80);
  if ((v6 & 0x1000F8) != 0 || (unint64_t)(v5 + 1) > 0x18)
  {
    uint64_t v8 = *(void *)a2;
    *uint64_t v3 = *(void *)a2;
    uint64_t v3 = (void *)(v8 + ((unsigned __int16)((v6 & 0xF8) + 23) & (unsigned __int16)~(v6 & 0xF8) & 0x1F8));
  }
  else
  {
    unsigned int v9 = a2[v5];
    unsigned int v10 = v9 - 2;
    if (v9 >= 2)
    {
      if (v5 <= 3) {
        uint64_t v11 = v5;
      }
      else {
        uint64_t v11 = 4;
      }
      switch(v11)
      {
        case 1:
          int v12 = *a2;
          goto LABEL_19;
        case 2:
          int v12 = *(unsigned __int16 *)a2;
          goto LABEL_19;
        case 3:
          int v12 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_19;
        case 4:
          int v12 = *(_DWORD *)a2;
LABEL_19:
          int v13 = (v12 | (v10 << (8 * v5))) + 2;
          unsigned int v9 = v12 + 2;
          if (v5 < 4) {
            unsigned int v9 = v13;
          }
          break;
        default:
          break;
      }
    }
    if (v9 == 1)
    {
      (*(void (**)(void *))(v4 + 16))(__dst);
      *((unsigned char *)v3 + v5) = 1;
      return v3;
    }
    if (v9)
    {
      memcpy(__dst, a2, v5 + 1);
      return v3;
    }
    *__dst = *(void *)a2;
    *((unsigned char *)__dst + v5) = 0;
  }
  swift_retain();
  return v3;
}

unsigned __int8 *sub_247EB0700(unsigned __int8 *result, uint64_t a2)
{
  unint64_t v2 = *(void *)(*(void *)(*(void *)(a2 + 16) - 8) + 64);
  if (v2 <= 8) {
    unint64_t v2 = 8;
  }
  unsigned int v3 = result[v2];
  unsigned int v4 = v3 - 2;
  if (v3 >= 2)
  {
    if (v2 <= 3) {
      uint64_t v5 = v2;
    }
    else {
      uint64_t v5 = 4;
    }
    switch(v5)
    {
      case 1:
        int v6 = *result;
        goto LABEL_12;
      case 2:
        int v6 = *(unsigned __int16 *)result;
        goto LABEL_12;
      case 3:
        int v6 = *(unsigned __int16 *)result | (result[2] << 16);
        goto LABEL_12;
      case 4:
        int v6 = *(_DWORD *)result;
LABEL_12:
        int v7 = (v6 | (v4 << (8 * v2))) + 2;
        unsigned int v3 = v6 + 2;
        if (v2 < 4) {
          unsigned int v3 = v7;
        }
        break;
      default:
        break;
    }
  }
  if (v3 == 1) {
    return (unsigned __int8 *)(*(uint64_t (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();
  }
  if (!v3) {
    return (unsigned __int8 *)swift_release();
  }
  return result;
}

unsigned char *sub_247EB0808(unsigned char *__dst, unsigned __int8 *a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 8uLL) {
    uint64_t v4 = 8;
  }
  else {
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  unsigned int v5 = a2[v4];
  unsigned int v6 = v5 - 2;
  if (v5 >= 2)
  {
    if (v4 <= 3) {
      uint64_t v7 = v4;
    }
    else {
      uint64_t v7 = 4;
    }
    switch(v7)
    {
      case 1:
        int v8 = *a2;
        goto LABEL_13;
      case 2:
        int v8 = *(unsigned __int16 *)a2;
        goto LABEL_13;
      case 3:
        int v8 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_13;
      case 4:
        int v8 = *(_DWORD *)a2;
LABEL_13:
        int v9 = (v8 | (v6 << (8 * v4))) + 2;
        unsigned int v5 = v8 + 2;
        if (v4 < 4) {
          unsigned int v5 = v9;
        }
        break;
      default:
        break;
    }
  }
  if (v5 == 1)
  {
    (*(void (**)(unsigned char *))(*(void *)(*(void *)(a3 + 16) - 8) + 16))(__dst);
    __dst[v4] = 1;
  }
  else if (v5)
  {
    memcpy(__dst, a2, v4 + 1);
  }
  else
  {
    *(void *)__dst = *(void *)a2;
    __dst[v4] = 0;
    swift_retain();
  }
  return __dst;
}

unsigned __int8 *sub_247EB0958(unsigned __int8 *__dst, unsigned __int8 *__src, uint64_t a3)
{
  if (__dst != __src)
  {
    uint64_t v5 = *(void *)(a3 + 16);
    uint64_t v6 = *(void *)(v5 - 8);
    if (*(void *)(v6 + 64) <= 8uLL) {
      uint64_t v7 = 8;
    }
    else {
      uint64_t v7 = *(void *)(v6 + 64);
    }
    unsigned int v8 = __dst[v7];
    unsigned int v9 = v8 - 2;
    if (v8 >= 2)
    {
      if (v7 <= 3) {
        uint64_t v10 = v7;
      }
      else {
        uint64_t v10 = 4;
      }
      switch(v10)
      {
        case 1:
          int v11 = *__dst;
          goto LABEL_14;
        case 2:
          int v11 = *(unsigned __int16 *)__dst;
          goto LABEL_14;
        case 3:
          int v11 = *(unsigned __int16 *)__dst | (__dst[2] << 16);
          goto LABEL_14;
        case 4:
          int v11 = *(_DWORD *)__dst;
LABEL_14:
          int v12 = (v11 | (v9 << (8 * v7))) + 2;
          unsigned int v8 = v11 + 2;
          if (v7 < 4) {
            unsigned int v8 = v12;
          }
          break;
        default:
          break;
      }
    }
    if (v8 == 1)
    {
      (*(void (**)(unsigned __int8 *, uint64_t))(v6 + 8))(__dst, v5);
    }
    else if (!v8)
    {
      swift_release();
    }
    unsigned int v13 = __src[v7];
    unsigned int v14 = v13 - 2;
    if (v13 >= 2)
    {
      if (v7 <= 3) {
        uint64_t v15 = v7;
      }
      else {
        uint64_t v15 = 4;
      }
      switch(v15)
      {
        case 1:
          int v16 = *__src;
          goto LABEL_29;
        case 2:
          int v16 = *(unsigned __int16 *)__src;
          goto LABEL_29;
        case 3:
          int v16 = *(unsigned __int16 *)__src | (__src[2] << 16);
          goto LABEL_29;
        case 4:
          int v16 = *(_DWORD *)__src;
LABEL_29:
          int v17 = (v16 | (v14 << (8 * v7))) + 2;
          unsigned int v13 = v16 + 2;
          if (v7 < 4) {
            unsigned int v13 = v17;
          }
          break;
        default:
          break;
      }
    }
    if (v13 == 1)
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 16))(__dst, __src, v5);
      __dst[v7] = 1;
    }
    else if (v13)
    {
      memcpy(__dst, __src, v7 + 1);
    }
    else
    {
      *(void *)__dst = *(void *)__src;
      __dst[v7] = 0;
      swift_retain();
    }
  }
  return __dst;
}

unsigned char *sub_247EB0B90(unsigned char *__dst, unsigned __int8 *a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 8uLL) {
    uint64_t v4 = 8;
  }
  else {
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  unsigned int v5 = a2[v4];
  unsigned int v6 = v5 - 2;
  if (v5 >= 2)
  {
    if (v4 <= 3) {
      uint64_t v7 = v4;
    }
    else {
      uint64_t v7 = 4;
    }
    switch(v7)
    {
      case 1:
        int v8 = *a2;
        goto LABEL_13;
      case 2:
        int v8 = *(unsigned __int16 *)a2;
        goto LABEL_13;
      case 3:
        int v8 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_13;
      case 4:
        int v8 = *(_DWORD *)a2;
LABEL_13:
        int v9 = (v8 | (v6 << (8 * v4))) + 2;
        unsigned int v5 = v8 + 2;
        if (v4 < 4) {
          unsigned int v5 = v9;
        }
        break;
      default:
        break;
    }
  }
  if (v5 == 1)
  {
    (*(void (**)(unsigned char *))(*(void *)(*(void *)(a3 + 16) - 8) + 32))(__dst);
    __dst[v4] = 1;
  }
  else if (v5)
  {
    memcpy(__dst, a2, v4 + 1);
  }
  else
  {
    *(void *)__dst = *(void *)a2;
    __dst[v4] = 0;
  }
  return __dst;
}

unsigned __int8 *sub_247EB0CDC(unsigned __int8 *__dst, unsigned __int8 *__src, uint64_t a3)
{
  if (__dst != __src)
  {
    uint64_t v5 = *(void *)(a3 + 16);
    uint64_t v6 = *(void *)(v5 - 8);
    if (*(void *)(v6 + 64) <= 8uLL) {
      uint64_t v7 = 8;
    }
    else {
      uint64_t v7 = *(void *)(v6 + 64);
    }
    unsigned int v8 = __dst[v7];
    unsigned int v9 = v8 - 2;
    if (v8 >= 2)
    {
      if (v7 <= 3) {
        uint64_t v10 = v7;
      }
      else {
        uint64_t v10 = 4;
      }
      switch(v10)
      {
        case 1:
          int v11 = *__dst;
          goto LABEL_14;
        case 2:
          int v11 = *(unsigned __int16 *)__dst;
          goto LABEL_14;
        case 3:
          int v11 = *(unsigned __int16 *)__dst | (__dst[2] << 16);
          goto LABEL_14;
        case 4:
          int v11 = *(_DWORD *)__dst;
LABEL_14:
          int v12 = (v11 | (v9 << (8 * v7))) + 2;
          unsigned int v8 = v11 + 2;
          if (v7 < 4) {
            unsigned int v8 = v12;
          }
          break;
        default:
          break;
      }
    }
    if (v8 == 1)
    {
      (*(void (**)(unsigned __int8 *, uint64_t))(v6 + 8))(__dst, v5);
    }
    else if (!v8)
    {
      swift_release();
    }
    unsigned int v13 = __src[v7];
    unsigned int v14 = v13 - 2;
    if (v13 >= 2)
    {
      if (v7 <= 3) {
        uint64_t v15 = v7;
      }
      else {
        uint64_t v15 = 4;
      }
      switch(v15)
      {
        case 1:
          int v16 = *__src;
          goto LABEL_29;
        case 2:
          int v16 = *(unsigned __int16 *)__src;
          goto LABEL_29;
        case 3:
          int v16 = *(unsigned __int16 *)__src | (__src[2] << 16);
          goto LABEL_29;
        case 4:
          int v16 = *(_DWORD *)__src;
LABEL_29:
          int v17 = (v16 | (v14 << (8 * v7))) + 2;
          unsigned int v13 = v16 + 2;
          if (v7 < 4) {
            unsigned int v13 = v17;
          }
          break;
        default:
          break;
      }
    }
    if (v13 == 1)
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 32))(__dst, __src, v5);
      __dst[v7] = 1;
    }
    else if (v13)
    {
      memcpy(__dst, __src, v7 + 1);
    }
    else
    {
      *(void *)__dst = *(void *)__src;
      __dst[v7] = 0;
    }
  }
  return __dst;
}

uint64_t sub_247EB0F10(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v4 = 8;
  if (*(void *)(v3 + 64) > 8uLL) {
    uint64_t v4 = *(void *)(v3 + 64);
  }
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_22;
  }
  uint64_t v5 = v4 + 1;
  char v6 = 8 * (v4 + 1);
  if ((v4 + 1) <= 3)
  {
    unsigned int v9 = ((a2 + ~(-1 << v6) - 253) >> v6) + 1;
    if (HIWORD(v9))
    {
      int v7 = *(_DWORD *)((char *)a1 + v5);
      if (!v7) {
        goto LABEL_22;
      }
      goto LABEL_14;
    }
    if (v9 > 0xFF)
    {
      int v7 = *(unsigned __int16 *)((char *)a1 + v5);
      if (!*(unsigned __int16 *)((char *)a1 + v5)) {
        goto LABEL_22;
      }
      goto LABEL_14;
    }
    if (v9 < 2)
    {
LABEL_22:
      unsigned int v11 = *((unsigned __int8 *)a1 + v4);
      if (v11 >= 3) {
        return (v11 ^ 0xFF) + 1;
      }
      else {
        return 0;
      }
    }
  }
  int v7 = *((unsigned __int8 *)a1 + v5);
  if (!*((unsigned char *)a1 + v5)) {
    goto LABEL_22;
  }
LABEL_14:
  int v10 = (v7 - 1) << v6;
  if (v5 > 3) {
    int v10 = 0;
  }
  if (v5)
  {
    if (v5 > 3) {
      LODWORD(v5) = 4;
    }
    switch((int)v5)
    {
      case 2:
        LODWORD(v5) = *a1;
        break;
      case 3:
        LODWORD(v5) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v5) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v5) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return (v5 | v10) + 254;
}

void sub_247EB1044(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unint64_t v5 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  if (v5 <= 8) {
    unint64_t v5 = 8;
  }
  size_t v6 = v5 + 1;
  if (a3 < 0xFE)
  {
    int v7 = 0;
  }
  else if (v6 <= 3)
  {
    unsigned int v10 = ((a3 + ~(-1 << (8 * v6)) - 253) >> (8 * v6)) + 1;
    if (HIWORD(v10))
    {
      int v7 = 4;
    }
    else if (v10 >= 0x100)
    {
      int v7 = 2;
    }
    else
    {
      int v7 = v10 > 1;
    }
  }
  else
  {
    int v7 = 1;
  }
  if (a2 > 0xFD)
  {
    unsigned int v8 = a2 - 254;
    if (v6 < 4)
    {
      int v9 = (v8 >> (8 * v6)) + 1;
      if (v5 != -1)
      {
        int v11 = v8 & ~(-1 << (8 * v6));
        bzero(a1, v6);
        if (v6 == 3)
        {
          *(_WORD *)a1 = v11;
          a1[2] = BYTE2(v11);
        }
        else if (v6 == 2)
        {
          *(_WORD *)a1 = v11;
        }
        else
        {
          *a1 = v11;
        }
      }
    }
    else
    {
      bzero(a1, v5 + 1);
      *(_DWORD *)a1 = v8;
      int v9 = 1;
    }
    switch(v7)
    {
      case 1:
        a1[v6] = v9;
        break;
      case 2:
        *(_WORD *)&a1[v6] = v9;
        break;
      case 3:
LABEL_34:
        __break(1u);
        JUMPOUT(0x247EB120CLL);
      case 4:
        *(_DWORD *)&a1[v6] = v9;
        break;
      default:
        return;
    }
  }
  else
  {
    switch(v7)
    {
      case 1:
        a1[v6] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_23;
      case 2:
        *(_WORD *)&a1[v6] = 0;
        goto LABEL_22;
      case 3:
        goto LABEL_34;
      case 4:
        *(_DWORD *)&a1[v6] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_23;
      default:
LABEL_22:
        if (a2) {
LABEL_23:
        }
          a1[v5] = -(char)a2;
        break;
    }
  }
}

uint64_t sub_247EB1234(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(a2 + 16) - 8);
  uint64_t v3 = 8;
  if (*(void *)(v2 + 64) > 8uLL) {
    uint64_t v3 = *(void *)(v2 + 64);
  }
  uint64_t v4 = a1[v3];
  int v5 = v4 - 2;
  if (v4 >= 2)
  {
    if (v3 <= 3) {
      uint64_t v6 = v3;
    }
    else {
      uint64_t v6 = 4;
    }
    switch(v6)
    {
      case 1:
        int v7 = *a1;
        goto LABEL_12;
      case 2:
        int v7 = *(unsigned __int16 *)a1;
        goto LABEL_12;
      case 3:
        int v7 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        goto LABEL_12;
      case 4:
        int v7 = *(_DWORD *)a1;
LABEL_12:
        unsigned int v8 = (v7 | (v5 << (8 * v3))) + 2;
        LODWORD(v4) = v7 + 2;
        if (v3 >= 4) {
          uint64_t v4 = v4;
        }
        else {
          uint64_t v4 = v8;
        }
        break;
      default:
        return v4;
    }
  }
  return v4;
}

void sub_247EB12EC(unsigned char *a1, unsigned int a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 8uLL) {
    size_t v4 = 8;
  }
  else {
    size_t v4 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  if (a2 > 1)
  {
    unsigned int v5 = a2 - 2;
    if (v4 < 4)
    {
      unsigned int v6 = v5 >> (8 * v4);
      int v7 = v5 & ~(-1 << (8 * v4));
      a1[v4] = v6 + 2;
      bzero(a1, v4);
      if (v4 == 3)
      {
        *(_WORD *)a1 = v7;
        a1[2] = BYTE2(v7);
      }
      else if (v4 == 2)
      {
        *(_WORD *)a1 = v7;
      }
      else
      {
        *a1 = v7;
      }
    }
    else
    {
      a1[v4] = 2;
      bzero(a1, v4);
      *(_DWORD *)a1 = v5;
    }
  }
  else
  {
    a1[v4] = a2;
  }
}

uint64_t sub_247EB13C4()
{
  return sub_247EA6CC8();
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

void sub_247EB1410()
{
  uint64_t v0 = sub_247EBC3B0();
  __swift_allocate_value_buffer(v0, qword_2692D2D78);
  __swift_project_value_buffer(v0, (uint64_t)qword_2692D2D78);
  id v1 = objc_msgSend(self, sel_mainBundle);
  id v2 = objc_msgSend(v1, sel_bundleIdentifier);

  if (v2)
  {
    sub_247EBC430();

    sub_247EBC3A0();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_247EB14E0(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  if (!*(void *)(*(void *)(v2 + 128) + 16)
    || (swift_bridgeObjectRetain(),
        sub_247EAFA54(0, 1uLL),
        char v6 = v5,
        uint64_t result = swift_bridgeObjectRelease(),
        (v6 & 1) == 0))
  {
    uint64_t v8 = 0x6572756C696166;
    uint64_t v9 = MEMORY[0x263F8D310];
    if (!a2) {
      uint64_t v8 = 0x73736563637573;
    }
    *((void *)&v11 + 1) = MEMORY[0x263F8D310];
    int v12 = &off_26FC21048;
    *(void *)&long long v10 = v8;
    *((void *)&v10 + 1) = 0xE700000000000000;
    swift_beginAccess();
    sub_247EA0E74((uint64_t)&v10, 0, 1uLL);
    if (a2)
    {
      *((void *)&v11 + 1) = v9;
      int v12 = &off_26FC21048;
      *(void *)&long long v10 = a1;
      *((void *)&v10 + 1) = a2;
    }
    else
    {
      int v12 = 0;
      long long v10 = 0u;
      long long v11 = 0u;
    }
    swift_bridgeObjectRetain();
    sub_247EA0E74((uint64_t)&v10, 0, 2uLL);
    return swift_endAccess();
  }
  return result;
}

uint64_t sub_247EB1610()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return MEMORY[0x270FA2418](v0);
}

uint64_t sub_247EB1650(uint64_t a1, uint64_t a2)
{
  switch(a2)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
      sub_247EBC9E0();
      break;
    default:
      sub_247EBC9E0();
      sub_247EBC470();
      break;
  }
  return sub_247EBC9F0();
}

uint64_t sub_247EB1754()
{
  return sub_247EB1650(*v0, v0[1]);
}

uint64_t sub_247EB175C()
{
  switch(*(void *)(v0 + 8))
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
      uint64_t result = sub_247EBC9E0();
      break;
    default:
      sub_247EBC9E0();
      uint64_t result = sub_247EBC470();
      break;
  }
  return result;
}

uint64_t sub_247EB1848()
{
  uint64_t v1 = *(void *)(v0 + 8);
  sub_247EBC9D0();
  switch(v1)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
      sub_247EBC9E0();
      break;
    default:
      sub_247EBC9E0();
      sub_247EBC470();
      break;
  }
  return sub_247EBC9F0();
}

uint64_t sub_247EB1944(uint64_t *a1, uint64_t a2)
{
  return sub_247EB1C58(*a1, a1[1], *(void *)a2, *(void *)(a2 + 8));
}

uint64_t sub_247EB1958()
{
  return sub_247EBC400();
}

uint64_t sub_247EB1960()
{
  return MEMORY[0x270EF1CE0](*v0);
}

uint64_t sub_247EB1968()
{
  return MEMORY[0x270EF1C18](*v0);
}

uint64_t sub_247EB1970()
{
  return MEMORY[0x270EF1BD8](*v0);
}

uint64_t type metadata accessor for TelemetryEvent()
{
  return self;
}

unint64_t destroy for TelemetryEvent.Key(uint64_t a1)
{
  unint64_t result = *(void *)(a1 + 8);
  if (result >= 0xFFFFFFFF) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s16AppleCareSupport14TelemetryEventC3KeyOwCP_0(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if (v3 < 0xFFFFFFFF)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v3;
    swift_bridgeObjectRetain();
  }
  return a1;
}

void *assignWithCopy for TelemetryEvent.Key(void *a1, void *a2)
{
  unint64_t v4 = a2[1];
  if (a1[1] < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for TelemetryEvent.Key(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 8) < 0xFFFFFFFFuLL) {
    goto LABEL_5;
  }
  unint64_t v4 = *(void *)(a2 + 8);
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TelemetryEvent.Key(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFF9 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 2147483641);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 6;
  if (v4 >= 8) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for TelemetryEvent.Key(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFF9)
  {
    *(void *)unint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)unint64_t result = a2 - 2147483641;
    if (a3 >= 0x7FFFFFF9) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFF9) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2 + 6;
    }
  }
  return result;
}

uint64_t sub_247EB1BB8(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_247EB1BD0(void *result, int a2)
{
  if (a2 < 0)
  {
    *unint64_t result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for TelemetryEvent.Key()
{
  return &type metadata for TelemetryEvent.Key;
}

unint64_t sub_247EB1C04()
{
  unint64_t result = qword_2692D13E0;
  if (!qword_2692D13E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_2692D13E0);
  }
  return result;
}

uint64_t sub_247EB1C58(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  switch(a2)
  {
    case 0:
      if (a4) {
        goto LABEL_20;
      }
      uint64_t result = 1;
      break;
    case 1:
      if (a4 != 1) {
        goto LABEL_20;
      }
      uint64_t result = 1;
      break;
    case 2:
      if (a4 != 2) {
        goto LABEL_20;
      }
      uint64_t result = 1;
      break;
    case 3:
      if (a4 != 3) {
        goto LABEL_20;
      }
      uint64_t result = 1;
      break;
    case 4:
      if (a4 != 4) {
        goto LABEL_20;
      }
      uint64_t result = 1;
      break;
    case 5:
      if (a4 != 5) {
        goto LABEL_20;
      }
      uint64_t result = 1;
      break;
    case 6:
      if (a4 != 6) {
        goto LABEL_20;
      }
      uint64_t result = 1;
      break;
    default:
      if (a4 < 7)
      {
LABEL_20:
        uint64_t result = 0;
      }
      else if (a1 == a3 && a2 == a4)
      {
        uint64_t result = 1;
      }
      else
      {
        uint64_t result = sub_247EBC910();
      }
      break;
  }
  return result;
}

uint64_t sub_247EB1D3C(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return MEMORY[0x270FA2498](sub_247EB1D5C, 0, 0);
}

uint64_t sub_247EB1D5C()
{
  if (qword_2692D0DA0 != -1) {
    swift_once();
  }
  v0[3] = objc_msgSend(self, sel_sessionWithConfiguration_, qword_2692D2D30);
  uint64_t v1 = (void *)swift_task_alloc();
  v0[4] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_247EB1E5C;
  uint64_t v2 = v0[2];
  return MEMORY[0x270EF1EB0](v2, 0);
}

uint64_t sub_247EB1E5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = *v4;
  uint64_t v9 = *v4;
  *(void *)(*v4 + 40) = v3;
  swift_task_dealloc();
  if (v3)
  {
    return MEMORY[0x270FA2498](sub_247EB1FD0, 0, 0);
  }
  else
  {

    long long v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 8);
    return v10(a1, a2, a3);
  }
}

uint64_t sub_247EB1FD0()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_247EB2034@<X0>(char a1@<W0>, uint64_t *a2@<X8>)
{
  id v4 = objc_msgSend(self, sel_defaultStore);
  id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F29118]), sel_init);
  unint64_t v6 = sub_247EAF0E8(MEMORY[0x263F8EE78]);
  a2[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D13F0);
  a2[4] = (uint64_t)&off_26FC21540;
  uint64_t result = swift_allocObject();
  *a2 = result;
  *(void *)(result + 16) = v4;
  *(void *)(result + 24) = v5;
  *(unsigned char *)(result + 32) = a1;
  *(void *)(result + 40) = v6;
  return result;
}

uint64_t sub_247EB20F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  uint64_t v4 = sub_247EBC1B0();
  v3[5] = v4;
  v3[6] = *(void *)(v4 - 8);
  v3[7] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_247EB21B8, 0, 0);
}

uint64_t sub_247EB21B8()
{
  uint64_t v1 = *(int **)(v0[3] + 8);
  (*(void (**)(void, void, void))(v0[6] + 16))(v0[7], v0[4], v0[5]);
  id v5 = (uint64_t (*)(uint64_t))((char *)v1 + *v1);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[8] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_247EB22AC;
  uint64_t v3 = v0[7];
  return v5(v3);
}

uint64_t sub_247EB22AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = (void *)*v4;
  v8[9] = v3;
  swift_task_dealloc();
  uint64_t v9 = v8[7];
  uint64_t v10 = v8[6];
  uint64_t v11 = v8[5];
  if (v3)
  {
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
    uint64_t v12 = sub_247EB24D4;
  }
  else
  {
    v8[10] = a3;
    v8[11] = a2;
    v8[12] = a1;
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
    uint64_t v12 = sub_247EB2448;
  }
  return MEMORY[0x270FA2498](v12, 0, 0);
}

uint64_t sub_247EB2448()
{
  uint64_t v1 = *(void *)(v0 + 80);
  uint64_t v2 = *(uint64_t **)(v0 + 16);
  uint64_t v3 = *v2;
  unint64_t v4 = v2[1];
  id v5 = (void *)v2[2];
  *(int8x16_t *)uint64_t v2 = vextq_s8(*(int8x16_t *)(v0 + 88), *(int8x16_t *)(v0 + 88), 8uLL);
  v2[2] = v1;
  sub_247EADC78(v3, v4, v5);
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_247EB24D4()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_247EB2538@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692D1120);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_247EBDD60;
  *(void *)(v10 + 56) = &type metadata for UserAgentHeadersProvider;
  *(void *)(v10 + 64) = &off_26FC214D0;
  *(void *)(v10 + 96) = &type metadata for TransactionIDHeadersProvider;
  *(void *)(v10 + 104) = &off_26FC20F08;
  *(void *)(v10 + 136) = &type metadata for ContentTypeHeadersProvider;
  *(void *)(v10 + 144) = &off_26FC21288;
  *(void *)(v10 + 176) = &type metadata for AnisetteHeadersProvider;
  *(void *)(v10 + 184) = &off_26FC208A0;
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_247EBD6D0;
  *(void *)(inited + 56) = &type metadata for BAAHeadersProvider;
  *(void *)(inited + 64) = &off_26FC21300;
  uint64_t result = sub_247EAB5D0(inited);
  *a5 = v10;
  a5[1] = a1;
  a5[2] = a2;
  a5[3] = a3;
  a5[4] = a4;
  return result;
}

uint64_t sub_247EB2678()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t destroy for SignedRequestManager()
{
  swift_bridgeObjectRelease();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for SignedRequestManager(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = v3;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for SignedRequestManager(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = a2[2];
  a1[1] = a2[1];
  a1[2] = v4;
  swift_retain();
  swift_release();
  uint64_t v5 = a2[4];
  a1[3] = a2[3];
  a1[4] = v5;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for SignedRequestManager(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  uint64_t v4 = *(void *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = v4;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SignedRequestManager(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SignedRequestManager(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SignedRequestManager()
{
  return &type metadata for SignedRequestManager;
}

uint64_t sub_247EB28E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_247EBC2B0();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);
  return v5(a1, a2, v4);
}

uint64_t sub_247EB2950(uint64_t a1)
{
  uint64_t v2 = sub_247EBC2B0();
  long long v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t sub_247EB29B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_247EBC2B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_247EB2A18(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_247EBC2B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_247EB2A7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_247EBC2B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_247EB2AE0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_247EBC2B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_247EB2B44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_247EB2B58);
}

uint64_t sub_247EB2B58(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_247EBC2B0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t sub_247EB2BC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_247EB2BD8);
}

uint64_t sub_247EB2BD8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_247EBC2B0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for HandoffResponse()
{
  uint64_t result = qword_2692D1400;
  if (!qword_2692D1400) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_247EB2C94()
{
  uint64_t result = sub_247EBC2B0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_247EB2D20@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v18 = a2;
  uint64_t v4 = sub_247EBC2B0();
  uint64_t v17 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v5);
  uint64_t v20 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D1410);
  uint64_t v19 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7, v8);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for HandoffResponse();
  MEMORY[0x270FA5388](v11 - 8, v12);
  uint64_t v14 = (char *)&v16 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247EB32C8();
  sub_247EBCA00();
  if (!v2)
  {
    sub_247EB3380(&qword_2692D1420);
    sub_247EBC8D0();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v10, v7);
    (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v14, v20, v4);
    sub_247EB331C((uint64_t)v14, v18);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_247EB2F90()
{
  return sub_247EB3670();
}

uint64_t sub_247EB2FC4()
{
  return sub_247EB3610();
}

uint64_t sub_247EB2FF4@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_247EBC8A0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_247EB3048@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_247EB36F0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_247EB3074@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_247EBC8A0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void sub_247EB30CC(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_247EB30D8(uint64_t a1)
{
  unint64_t v2 = sub_247EB32C8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247EB3114(uint64_t a1)
{
  unint64_t v2 = sub_247EB32C8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247EB3150@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_247EB2D20(a1, a2);
}

uint64_t sub_247EB3168(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D1428);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247EB32C8();
  sub_247EBCA10();
  sub_247EBC2B0();
  sub_247EB3380(&qword_2692D1430);
  sub_247EBC8F0();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
}

unint64_t sub_247EB32C8()
{
  unint64_t result = qword_2692D1418;
  if (!qword_2692D1418)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692D1418);
  }
  return result;
}

uint64_t sub_247EB331C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for HandoffResponse();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_247EB3380(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_247EBC2B0();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for HandoffResponse.CodingKeys(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *storeEnumTagSinglePayload for HandoffResponse.CodingKeys(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x247EB34B4);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for HandoffResponse.CodingKeys()
{
  return &type metadata for HandoffResponse.CodingKeys;
}

unint64_t sub_247EB34F0()
{
  unint64_t result = qword_2692D1438;
  if (!qword_2692D1438)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692D1438);
  }
  return result;
}

unint64_t sub_247EB3548()
{
  unint64_t result = qword_2692D1440;
  if (!qword_2692D1440)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692D1440);
  }
  return result;
}

unint64_t sub_247EB35A0()
{
  unint64_t result = qword_2692D1448;
  if (!qword_2692D1448)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692D1448);
  }
  return result;
}

uint64_t sub_247EB35F4()
{
  return 1;
}

uint64_t sub_247EB35FC()
{
  return sub_247EB3610();
}

uint64_t sub_247EB3610()
{
  return sub_247EBC9F0();
}

uint64_t sub_247EB365C()
{
  return sub_247EB3670();
}

uint64_t sub_247EB3670()
{
  return sub_247EBC9F0();
}

uint64_t sub_247EB36C0()
{
  return sub_247EBC470();
}

uint64_t sub_247EB36DC()
{
  return sub_247EBC470();
}

uint64_t sub_247EB36F0()
{
  return 0x5566666F646E6168;
}

uint64_t Clock.measureInheritingActorContext(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[6] = a5;
  v6[7] = v5;
  v6[4] = a3;
  v6[5] = a4;
  _OWORD v6[2] = a1;
  v6[3] = a2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v6[8] = AssociatedTypeWitness;
  v6[9] = *(void *)(AssociatedTypeWitness - 8);
  v6[10] = swift_task_alloc();
  v6[11] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_247EB3804, 0, 0);
}

uint64_t sub_247EB3804()
{
  unint64_t v1 = *(int **)(v0 + 24);
  sub_247EBC960();
  unsigned int v4 = (uint64_t (*)(void))((char *)v1 + *v1);
  int v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 96) = v2;
  *int v2 = v0;
  v2[1] = sub_247EB38E8;
  return v4();
}

uint64_t sub_247EB38E8()
{
  *(void *)(*(void *)v1 + 104) = v0;
  swift_task_dealloc();
  if (v0) {
    int v2 = sub_247EB3B08;
  }
  else {
    int v2 = sub_247EB39FC;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_247EB39FC()
{
  uint64_t v2 = v0[10];
  uint64_t v1 = v0[11];
  uint64_t v3 = v0[8];
  uint64_t v4 = v0[9];
  sub_247EBC960();
  swift_getAssociatedConformanceWitness();
  sub_247EBC780();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v5(v2, v3);
  v5(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_247EB3B08()
{
  (*(void (**)(void, void))(v0[9] + 8))(v0[11], v0[8]);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_247EB3B90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[5] = a2;
  v3[6] = a3;
  v3[4] = a1;
  uint64_t v4 = sub_247EBC750();
  v3[7] = v4;
  v3[8] = *(void *)(v4 - 8);
  v3[9] = swift_task_alloc();
  v3[10] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_247EB3C64, 0, 0);
}

uint64_t sub_247EB3C64()
{
  v0[11] = sub_247EBC770();
  v0[12] = sub_247EB42FC(&qword_2692D10C8, MEMORY[0x263F8F710]);
  sub_247EBC960();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[13] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_247EB3D60;
  uint64_t v3 = v0[5];
  uint64_t v2 = v0[6];
  return sub_247EA2FCC(v3, v2);
}

uint64_t sub_247EB3D60()
{
  *(void *)(*(void *)v1 + 112) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_247EB4348;
  }
  else {
    uint64_t v2 = sub_247EB4344;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_247EB3E74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[5] = a2;
  v3[6] = a3;
  v3[4] = a1;
  uint64_t v4 = sub_247EBC750();
  v3[7] = v4;
  v3[8] = *(void *)(v4 - 8);
  v3[9] = swift_task_alloc();
  v3[10] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_247EB3F48, 0, 0);
}

uint64_t sub_247EB3F48()
{
  v0[11] = sub_247EBC770();
  v0[12] = sub_247EB42FC(&qword_2692D10C8, MEMORY[0x263F8F710]);
  sub_247EBC960();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[13] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_247EB4044;
  uint64_t v3 = v0[5];
  uint64_t v2 = v0[6];
  return sub_247EAC9E8(v3, v2);
}

uint64_t sub_247EB4044()
{
  *(void *)(*(void *)v1 + 112) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_247EB4274;
  }
  else {
    uint64_t v2 = sub_247EB4158;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_247EB4158()
{
  uint64_t v2 = v0[9];
  uint64_t v1 = v0[10];
  uint64_t v3 = v0[7];
  uint64_t v4 = v0[8];
  sub_247EBC960();
  sub_247EB42FC(&qword_2692D1460, MEMORY[0x263F8F6D8]);
  sub_247EBC780();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v5(v2, v3);
  v5(v1, v3);
  uint64_t v7 = v0[2];
  uint64_t v6 = v0[3];
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))v0[1];
  return v8(v7, v6);
}

uint64_t sub_247EB4274()
{
  (*(void (**)(void, void))(v0[8] + 8))(v0[10], v0[7]);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_247EB42FC(unint64_t *a1, void (*a2)(uint64_t))
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

ValueMetadata *type metadata accessor for ContentTypeHeadersProvider()
{
  return &type metadata for ContentTypeHeadersProvider;
}

void sub_247EB435C()
{
  algn_2692D2D98[5] = 0;
  *(_WORD *)&algn_2692D2D98[6] = -5120;
}

unint64_t sub_247EB4388()
{
  return 0xD00000000000001ALL;
}

uint64_t sub_247EB43A4()
{
  return MEMORY[0x270FA2498](sub_247EB43C0, 0, 0);
}

uint64_t sub_247EB43C0()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692D0FD0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_247EBD6D0;
  if (qword_2692D0DC0 != -1) {
    swift_once();
  }
  uint64_t v2 = *(void *)algn_2692D2D98;
  *(void *)(inited + 32) = qword_2692D2D90;
  *(void *)(inited + 40) = v2;
  *(void *)(inited + 48) = 0xD000000000000010;
  *(void *)(inited + 56) = 0x8000000247EBEBD0;
  swift_bridgeObjectRetain();
  unint64_t v3 = sub_247EAF0E8(inited);
  uint64_t v4 = *(uint64_t (**)(unint64_t))(v0 + 8);
  return v4(v3);
}

uint64_t sub_247EB44AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[19] = a4;
  v5[20] = a5;
  v5[17] = a2;
  v5[18] = a3;
  v5[16] = a1;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D1480);
  v5[21] = v6;
  v5[22] = *(void *)(v6 - 8);
  v5[23] = swift_task_alloc();
  uint64_t v7 = sub_247EBC1B0();
  v5[24] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v5[25] = v8;
  v5[26] = *(void *)(v8 + 64);
  v5[27] = swift_task_alloc();
  uint64_t v9 = *(void *)(type metadata accessor for CompositeHTTPHeadersProvider() - 8);
  v5[28] = v9;
  v5[29] = *(void *)(v9 + 64);
  v5[30] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692D1158);
  v5[31] = swift_task_alloc();
  v5[32] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_247EB467C, 0, 0);
}

uint64_t sub_247EB467C()
{
  uint64_t v1 = *(void *)(v0 + 144);
  uint64_t v2 = *(void *)(*(void *)v1 + 16);
  if (v2)
  {
    long long v33 = (long long *)(v0 + 16);
    uint64_t v3 = *(void *)v1 + 32;
    uint64_t v30 = *(void *)(v0 + 208) + 7;
    uint64_t v31 = *(void *)(v0 + 200);
    uint64_t v32 = *(void *)(v0 + 224);
    uint64_t v4 = sub_247EBC540();
    uint64_t v5 = *(void *)(v4 - 8);
    uint64_t v29 = *(void (**)(void))(v5 + 56);
    uint64_t v28 = (uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
    uint64_t v27 = (void (**)(uint64_t, uint64_t))(v5 + 8);
    swift_bridgeObjectRetain();
    while (1)
    {
      uint64_t v34 = v2;
      uint64_t v8 = *(void *)(v0 + 232);
      uint64_t v7 = *(void *)(v0 + 240);
      uint64_t v9 = *(void *)(v0 + 216);
      uint64_t v35 = v9;
      uint64_t v36 = *(void *)(v0 + 256);
      uint64_t v10 = *(void *)(v0 + 192);
      uint64_t v11 = *(void *)(v0 + 152);
      uint64_t v37 = *(void *)(v0 + 160);
      uint64_t v38 = *(void *)(v0 + 248);
      uint64_t v12 = *(void *)(v0 + 144);
      v29();
      sub_247E9D384(v3, (uint64_t)v33);
      sub_247EB6040(v12, v7);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v31 + 16))(v9, v11, v10);
      unint64_t v13 = (*(unsigned __int8 *)(v32 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80);
      unint64_t v14 = (v8 + *(unsigned __int8 *)(v31 + 80) + v13) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80);
      uint64_t v15 = swift_allocObject();
      *(void *)(v15 + 16) = 0;
      uint64_t v16 = (void *)(v15 + 16);
      *(void *)(v15 + 24) = 0;
      sub_247EADA8C(v33, v15 + 32);
      sub_247EB6248(v7, v15 + v13);
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v31 + 32))(v15 + v14, v35, v10);
      *(void *)(v15 + ((v30 + v14) & 0xFFFFFFFFFFFFFFF8)) = v37;
      sub_247EB6444(v36, v38);
      LODWORD(v10) = (*v28)(v38, 1, v4);
      swift_retain();
      uint64_t v17 = *(void *)(v0 + 248);
      if (v10 == 1)
      {
        sub_247EB64AC(*(void *)(v0 + 248));
        if (!*v16) {
          goto LABEL_8;
        }
      }
      else
      {
        sub_247EBC530();
        (*v27)(v17, v4);
        if (!*v16)
        {
LABEL_8:
          uint64_t v18 = 0;
          uint64_t v20 = 0;
          goto LABEL_9;
        }
      }
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v18 = sub_247EBC4C0();
      uint64_t v20 = v19;
      swift_unknownObjectRelease();
LABEL_9:
      uint64_t v21 = **(void **)(v0 + 136);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2692D1010);
      uint64_t v22 = v20 | v18;
      if (v20 | v18)
      {
        uint64_t v22 = v0 + 56;
        *(void *)(v0 + 56) = 0;
        *(void *)(v0 + 64) = 0;
        *(void *)(v0 + 72) = v18;
        *(void *)(v0 + 80) = v20;
      }
      uint64_t v6 = *(void *)(v0 + 256);
      *(void *)(v0 + 88) = 1;
      *(void *)(v0 + 96) = v22;
      *(void *)(v0 + 104) = v21;
      swift_task_create();
      swift_release();
      sub_247EB64AC(v6);
      v3 += 40;
      uint64_t v2 = v34 - 1;
      if (v34 == 1)
      {
        swift_bridgeObjectRelease();
        break;
      }
    }
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692D1010);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692D0F90);
  sub_247EBC580();
  *(void *)(v0 + 264) = MEMORY[0x263F8EE80];
  unint64_t v23 = sub_247EB650C();
  uint64_t v24 = (void *)swift_task_alloc();
  *(void *)(v0 + 272) = v24;
  *uint64_t v24 = v0;
  v24[1] = sub_247EB4A98;
  uint64_t v25 = *(void *)(v0 + 168);
  return MEMORY[0x270FA1E80](v0 + 112, v25, v23);
}

uint64_t sub_247EB4A98()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 280) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v4 = v2[22];
    uint64_t v3 = v2[23];
    uint64_t v5 = v2[21];
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    uint64_t v6 = sub_247EB5068;
  }
  else
  {
    uint64_t v6 = sub_247EB4BDC;
  }
  return MEMORY[0x270FA2498](v6, 0, 0);
}

uint64_t sub_247EB4BDC()
{
  uint64_t v1 = v0[14];
  uint64_t v2 = v0[33];
  if (v1)
  {
    uint64_t v42 = v0 + 14;
    uint64_t v46 = v0 + 15;
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v0[15] = v2;
    uint64_t v44 = v1 + 64;
    uint64_t v4 = -1;
    uint64_t v5 = -1 << *(unsigned char *)(v1 + 32);
    if (-v5 < 64) {
      uint64_t v4 = ~(-1 << -(char)v5);
    }
    unint64_t v6 = v4 & *(void *)(v1 + 64);
    int64_t v45 = (unint64_t)(63 - v5) >> 6;
    uint64_t v7 = swift_bridgeObjectRetain();
    int64_t v10 = 0;
    uint64_t v43 = v0;
    uint64_t v11 = (void *)v0[33];
    while (1)
    {
      if (v6)
      {
        char v13 = isUniquelyReferenced_nonNull_native;
        unint64_t v14 = __clz(__rbit64(v6));
        v6 &= v6 - 1;
        int64_t v47 = v10;
        unint64_t v15 = v14 | (v10 << 6);
      }
      else
      {
        int64_t v16 = v10 + 1;
        if (__OFADD__(v10, 1)) {
          goto LABEL_45;
        }
        if (v16 >= v45)
        {
LABEL_37:
          swift_bridgeObjectRelease();
          swift_release();
          swift_bridgeObjectRelease_n();
          v43[33] = v11;
          unint64_t v40 = sub_247EB650C();
          uint64_t v41 = (void *)swift_task_alloc();
          v43[34] = v41;
          *uint64_t v41 = v43;
          v41[1] = sub_247EB4A98;
          uint64_t v8 = v43[21];
          uint64_t v7 = (uint64_t)v42;
          unint64_t v9 = v40;
          return MEMORY[0x270FA1E80](v7, v8, v9);
        }
        unint64_t v17 = *(void *)(v44 + 8 * v16);
        int64_t v18 = v10 + 1;
        if (!v17)
        {
          int64_t v18 = v10 + 2;
          if (v10 + 2 >= v45) {
            goto LABEL_37;
          }
          unint64_t v17 = *(void *)(v44 + 8 * v18);
          if (!v17)
          {
            int64_t v18 = v10 + 3;
            if (v10 + 3 >= v45) {
              goto LABEL_37;
            }
            unint64_t v17 = *(void *)(v44 + 8 * v18);
            if (!v17)
            {
              int64_t v18 = v10 + 4;
              if (v10 + 4 >= v45) {
                goto LABEL_37;
              }
              unint64_t v17 = *(void *)(v44 + 8 * v18);
              if (!v17)
              {
                uint64_t v19 = v10 + 5;
                if (v10 + 5 >= v45) {
                  goto LABEL_37;
                }
                unint64_t v17 = *(void *)(v44 + 8 * v19);
                if (!v17)
                {
                  while (1)
                  {
                    int64_t v18 = v19 + 1;
                    if (__OFADD__(v19, 1)) {
                      goto LABEL_46;
                    }
                    if (v18 >= v45) {
                      goto LABEL_37;
                    }
                    unint64_t v17 = *(void *)(v44 + 8 * v18);
                    ++v19;
                    if (v17) {
                      goto LABEL_24;
                    }
                  }
                }
                int64_t v18 = v10 + 5;
              }
            }
          }
        }
LABEL_24:
        char v13 = isUniquelyReferenced_nonNull_native;
        unint64_t v6 = (v17 - 1) & v17;
        int64_t v47 = v18;
        unint64_t v15 = __clz(__rbit64(v17)) + (v18 << 6);
      }
      uint64_t v20 = 16 * v15;
      uint64_t v21 = v1;
      uint64_t v22 = (uint64_t *)(*(void *)(v1 + 48) + v20);
      uint64_t v24 = *v22;
      uint64_t v23 = v22[1];
      uint64_t v25 = (uint64_t *)(*(void *)(v1 + 56) + v20);
      uint64_t v26 = *v25;
      uint64_t v27 = v25[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v28 = sub_247EAF8A4(v24, v23);
      uint64_t v29 = v11[2];
      BOOL v30 = (v8 & 1) == 0;
      uint64_t v7 = v29 + v30;
      if (__OFADD__(v29, v30))
      {
        __break(1u);
LABEL_44:
        __break(1u);
LABEL_45:
        __break(1u);
LABEL_46:
        __break(1u);
        return MEMORY[0x270FA1E80](v7, v8, v9);
      }
      char v31 = v8;
      if (v11[3] >= v7)
      {
        if ((v13 & 1) == 0) {
          uint64_t v7 = (uint64_t)sub_247EB7508();
        }
      }
      else
      {
        sub_247EB6B34(v7, v13 & 1);
        uint64_t v7 = sub_247EAF8A4(v24, v23);
        if ((v31 & 1) != (v8 & 1))
        {
          return sub_247EBC950();
        }
        unint64_t v28 = v7;
      }
      uint64_t v11 = (void *)*v46;
      if (v31)
      {
        swift_bridgeObjectRelease();
        uint64_t v12 = (void *)(v11[7] + 16 * v28);
        uint64_t v7 = swift_bridgeObjectRelease();
        *uint64_t v12 = v26;
        v12[1] = v27;
      }
      else
      {
        v11[(v28 >> 6) + 8] |= 1 << v28;
        uint64_t v32 = (uint64_t *)(v11[6] + 16 * v28);
        *uint64_t v32 = v24;
        v32[1] = v23;
        long long v33 = (void *)(v11[7] + 16 * v28);
        *long long v33 = v26;
        v33[1] = v27;
        uint64_t v34 = v11[2];
        BOOL v35 = __OFADD__(v34, 1);
        uint64_t v36 = v34 + 1;
        if (v35) {
          goto LABEL_44;
        }
        v11[2] = v36;
      }
      char isUniquelyReferenced_nonNull_native = 1;
      uint64_t v1 = v21;
      int64_t v10 = v47;
    }
  }
  uint64_t v37 = (void *)v0[16];
  (*(void (**)(void, void))(v0[22] + 8))(v0[23], v0[21]);
  swift_bridgeObjectRelease();
  *uint64_t v37 = v2;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v38 = (uint64_t (*)(void))v0[1];
  return v38();
}

uint64_t sub_247EB5068()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t type metadata accessor for CompositeHTTPHeadersProvider()
{
  uint64_t result = qword_2692D14C0;
  if (!qword_2692D14C0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_247EB514C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[26] = a6;
  v7[27] = a7;
  v7[24] = a4;
  v7[25] = a5;
  v7[23] = a1;
  sub_247EBCA60();
  v7[28] = swift_task_alloc();
  sub_247EBCA40();
  v7[29] = swift_task_alloc();
  sub_247EBCAB0();
  v7[30] = swift_task_alloc();
  uint64_t v8 = sub_247EBCAC0();
  v7[31] = v8;
  v7[32] = *(void *)(v8 - 8);
  v7[33] = swift_task_alloc();
  uint64_t v9 = sub_247EBC770();
  v7[34] = v9;
  v7[35] = *(void *)(v9 - 8);
  v7[36] = swift_task_alloc();
  uint64_t v10 = sub_247EBC3B0();
  v7[37] = v10;
  v7[38] = *(void *)(v10 - 8);
  v7[39] = swift_task_alloc();
  v7[40] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_247EB5360, 0, 0);
}

uint64_t sub_247EB5360()
{
  uint64_t v33 = v0;
  if (qword_2692D0DB8 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 320);
  uint64_t v2 = *(void *)(v0 + 296);
  uint64_t v3 = *(void *)(v0 + 304);
  uint64_t v4 = *(void *)(v0 + 192);
  uint64_t v5 = __swift_project_value_buffer(v2, (uint64_t)qword_2692D2D78);
  *(void *)(v0 + 328) = v5;
  unint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  *(void *)(v0 + 336) = v6;
  *(void *)(v0 + 344) = (v3 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v6(v1, v5, v2);
  sub_247E9D384(v4, v0 + 16);
  uint64_t v7 = sub_247EBC390();
  os_log_type_t v8 = sub_247EBC5E0();
  BOOL v9 = os_log_type_enabled(v7, v8);
  uint64_t v10 = *(void *)(v0 + 320);
  uint64_t v11 = *(void *)(v0 + 296);
  uint64_t v12 = *(void *)(v0 + 304);
  if (v9)
  {
    char v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v29 = swift_slowAlloc();
    uint64_t v32 = v29;
    *(_DWORD *)char v13 = 136315138;
    uint64_t v30 = v11;
    uint64_t v15 = *(void *)(v0 + 40);
    uint64_t v14 = *(void *)(v0 + 48);
    __swift_project_boxed_opaque_existential_1((void *)(v0 + 16), v15);
    uint64_t v16 = (*(uint64_t (**)(uint64_t, uint64_t))(v14 + 8))(v15, v14);
    *(void *)(v0 + 176) = sub_247EAABD0(v16, v17, &v32);
    sub_247EBC630();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
    _os_log_impl(&dword_247E99000, v7, v8, "Computing headers using %s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C56FD50](v29, -1, -1);
    MEMORY[0x24C56FD50](v13, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v30);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);

    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
  }
  uint64_t v19 = *(void *)(v0 + 280);
  uint64_t v18 = *(void *)(v0 + 288);
  uint64_t v20 = *(void *)(v0 + 272);
  uint64_t v22 = *(void *)(v0 + 192);
  uint64_t v21 = *(void *)(v0 + 200);
  *(void *)(v0 + 152) = 0;
  uint64_t v23 = type metadata accessor for CompositeHTTPHeadersProvider();
  long long v31 = *(_OWORD *)(v0 + 208);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v18, v21 + *(int *)(v23 + 20), v20);
  uint64_t v24 = swift_task_alloc();
  *(void *)(v0 + 352) = v24;
  *(void *)(v24 + 16) = v0 + 152;
  *(void *)(v24 + 24) = v22;
  *(_OWORD *)(v24 + 32) = v31;
  uint64_t v25 = (void *)swift_task_alloc();
  *(void *)(v0 + 360) = v25;
  uint64_t v26 = sub_247EB7B68(&qword_2692D10C8, MEMORY[0x263F8F710]);
  void *v25 = v0;
  v25[1] = sub_247EB56C8;
  uint64_t v27 = *(void *)(v0 + 272);
  return MEMORY[0x270FA2390](v0 + 120, &unk_2692D14A8, v24, v27, v26);
}

uint64_t sub_247EB56C8()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 368) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 288);
  uint64_t v4 = *(void *)(v2 + 280);
  uint64_t v5 = *(void *)(v2 + 272);
  if (v0)
  {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    swift_task_dealloc();
    unint64_t v6 = sub_247EB5890;
  }
  else
  {
    *(_OWORD *)(v2 + 376) = *(_OWORD *)(v2 + 120);
    swift_task_dealloc();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    unint64_t v6 = sub_247EB59DC;
  }
  return MEMORY[0x270FA2498](v6, 0, 0);
}

uint64_t sub_247EB5890()
{
  uint64_t v1 = v0[46];
  uint64_t v2 = (void *)v0[24];
  swift_bridgeObjectRelease();
  uint64_t v4 = v2[3];
  uint64_t v3 = v2[4];
  __swift_project_boxed_opaque_existential_1(v2, v4);
  uint64_t v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v4, v3);
  uint64_t v7 = v6;
  sub_247EB7B14();
  swift_allocError();
  *uint64_t v8 = v5;
  v8[1] = v7;
  v8[2] = v1;
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  BOOL v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_247EB59DC()
{
  uint64_t v1 = v0[27];
  uint64_t v2 = (void *)v0[24];
  uint64_t v3 = v2[3];
  uint64_t v4 = v2[4];
  __swift_project_boxed_opaque_existential_1(v2, v3);
  v0[49] = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v3, v4);
  v0[50] = v5;
  return MEMORY[0x270FA2498](sub_247EB5A7C, v1, 0);
}

uint64_t sub_247EB5A7C()
{
  uint64_t v7 = v0;
  uint64_t v1 = *(void *)(v0 + 392);
  unint64_t v2 = *(void *)(v0 + 400);
  double v3 = (double)sub_247EBCAE0();
  sub_247EBCAE0();
  *(void *)&v6[3] = MEMORY[0x263F8D538];
  *(void *)&v6[4] = &off_26FC21068;
  v6[0] = (double)v4 * 1.0e-18 + v3;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_247EA0E74((uint64_t)v6, v1, v2);
  swift_endAccess();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_247EB5B98, 0, 0);
}

uint64_t sub_247EB5B98()
{
  uint64_t v32 = v0;
  uint64_t v30 = (void *)(v0 + 152);
  uint64_t v27 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 336);
  uint64_t v23 = *(void *)(v0 + 296);
  uint64_t v25 = *(void *)(v0 + 328);
  uint64_t v2 = *(void *)(v0 + 256);
  uint64_t v1 = *(void *)(v0 + 264);
  uint64_t v20 = *(void *)(v0 + 248);
  uint64_t v21 = *(void *)(v0 + 192);
  uint64_t v22 = *(void *)(v0 + 312);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692D10D0);
  sub_247EBCA90();
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_247EBDA00;
  sub_247EBCA80();
  sub_247EBCA70();
  sub_247EAC6D0(v3);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  sub_247EBCAA0();
  sub_247EBCA30();
  sub_247EBCA50();
  sub_247EBCA20();
  sub_247EB7B68(&qword_2692D10D8, MEMORY[0x263F07F20]);
  sub_247EBCAD0();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v20);
  uint64_t v4 = *(void *)(v0 + 136);
  unint64_t v5 = *(void *)(v0 + 144);
  v27(v22, v25, v23);
  uint64_t v6 = (void *)(v0 + 56);
  sub_247E9D384(v21, v0 + 56);
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_247EBC390();
  os_log_type_t v8 = sub_247EBC5E0();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v26 = *(void *)(v0 + 304);
    uint64_t v28 = *(void *)(v0 + 296);
    uint64_t v29 = *(void *)(v0 + 312);
    uint64_t v9 = swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v31 = v10;
    *(_DWORD *)uint64_t v9 = 136315394;
    uint64_t v24 = v4;
    uint64_t v11 = *(void *)(v0 + 80);
    uint64_t v12 = *(void *)(v0 + 88);
    __swift_project_boxed_opaque_existential_1(v6, v11);
    uint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t))(v12 + 8))(v11, v12);
    *(void *)(v0 + 160) = sub_247EAABD0(v13, v14, &v31);
    sub_247EBC630();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
    *(_WORD *)(v9 + 12) = 2080;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 168) = sub_247EAABD0(v24, v5, &v31);
    sub_247EBC630();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_247E99000, v7, v8, "Computed headers using %s in %s", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24C56FD50](v10, -1, -1);
    MEMORY[0x24C56FD50](v9, -1, -1);

    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v26 + 8))(v29, v28);
  }
  else
  {
    uint64_t v17 = *(void *)(v0 + 304);
    uint64_t v16 = *(void *)(v0 + 312);
    uint64_t v18 = *(void *)(v0 + 296);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
    swift_bridgeObjectRelease_n();

    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);
  }
  if (*v30)
  {
    **(void **)(v0 + 184) = *v30;
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v19 = *(uint64_t (**)(void))(v0 + 8);
    return v19();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_247EB6040(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CompositeHTTPHeadersProvider();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_247EB60A4()
{
  uint64_t v1 = (int *)(type metadata accessor for CompositeHTTPHeadersProvider() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 72) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  uint64_t v5 = sub_247EBC1B0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = (v3 + v4 + v7) & ~v7;
  uint64_t v9 = v2 | v7 | 7;
  unint64_t v10 = ((*(void *)(v6 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 32);
  swift_bridgeObjectRelease();
  uint64_t v11 = v0 + v3 + v1[7];
  uint64_t v12 = sub_247EBC770();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v8, v5);
  swift_release();
  return MEMORY[0x270FA0238](v0, v10, v9);
}

uint64_t sub_247EB6248(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CompositeHTTPHeadersProvider();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_247EB62AC(uint64_t a1)
{
  uint64_t v3 = v2;
  uint64_t v5 = *(void *)(type metadata accessor for CompositeHTTPHeadersProvider() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = *(void *)(v5 + 64);
  uint64_t v8 = *(void *)(sub_247EBC1B0() - 8);
  unint64_t v9 = (v6 + v7 + *(unsigned __int8 *)(v8 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = *(void *)(v1 + 16);
  uint64_t v11 = *(void *)(v1 + 24);
  uint64_t v12 = v1 + 32;
  uint64_t v13 = v1 + v6;
  uint64_t v14 = v1 + v9;
  uint64_t v15 = *(void *)(v1 + ((*(void *)(v8 + 64) + v9 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v16 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v16;
  *uint64_t v16 = v3;
  v16[1] = sub_247EA7EA0;
  return sub_247EB514C(a1, v10, v11, v12, v13, v14, v15);
}

uint64_t sub_247EB6444(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D1158);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_247EB64AC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D1158);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_247EB650C()
{
  unint64_t result = qword_2692D1498;
  if (!qword_2692D1498)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2692D1480);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_2692D1498);
  }
  return result;
}

uint64_t sub_247EB6568(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[4] = a3;
  double v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  return MEMORY[0x270FA2498](sub_247EB658C, 0, 0);
}

uint64_t sub_247EB658C()
{
  uint64_t v1 = (void *)v0[3];
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v2);
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v3 + 16) + **(int **)(v3 + 16));
  uint64_t v4 = (void *)swift_task_alloc();
  v0[6] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_247EB6694;
  uint64_t v6 = v0[4];
  uint64_t v5 = v0[5];
  return v8(v6, v5, v2, v3);
}

uint64_t sub_247EB6694(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
  else
  {
    *(void *)(v4 + 56) = a1;
    return MEMORY[0x270FA2498](sub_247EB67E0, 0, 0);
  }
}

uint64_t sub_247EB67E0()
{
  **(void **)(v0 + 16) = *(void *)(v0 + 56);
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

unint64_t sub_247EB6850()
{
  return 0xD00000000000001CLL;
}

uint64_t sub_247EB686C(uint64_t a1, uint64_t a2)
{
  v3[4] = a2;
  v3[5] = v2;
  v3[3] = a1;
  return MEMORY[0x270FA2498](sub_247EB6890, 0, 0);
}

uint64_t sub_247EB6890()
{
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D1010);
  uint64_t v3 = swift_task_alloc();
  *(void *)(v0 + 48) = v3;
  long long v4 = *(_OWORD *)(v0 + 24);
  *(void *)(v3 + 16) = v1;
  *(_OWORD *)(v3 + 24) = v4;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_247EB6998;
  return MEMORY[0x270FA22B8](v0 + 16, v2, v2, 0, 0, &unk_2692D1108, v3, v2);
}

uint64_t sub_247EB6998()
{
  *(void *)(*(void *)v1 + 64) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_247EB6AD0;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_247EB6AB4;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_247EB6AB4()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 16));
}

uint64_t sub_247EB6AD0()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_247EB6B34(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692D12B0);
  char v42 = a2;
  uint64_t v6 = sub_247EBC860();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v41 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v39 = v2;
  int64_t v40 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v22 = v21 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v23 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v40) {
      break;
    }
    uint64_t v24 = (void *)(v5 + 64);
    unint64_t v25 = *(void *)(v41 + 8 * v23);
    ++v13;
    if (!v25)
    {
      int64_t v13 = v23 + 1;
      if (v23 + 1 >= v40) {
        goto LABEL_33;
      }
      unint64_t v25 = *(void *)(v41 + 8 * v13);
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v39;
          if ((v42 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v25 = *(void *)(v41 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            int64_t v13 = v26 + 1;
            if (__OFADD__(v26, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v40) {
              goto LABEL_33;
            }
            unint64_t v25 = *(void *)(v41 + 8 * v13);
            ++v26;
            if (v25) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v26;
      }
    }
LABEL_30:
    unint64_t v10 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v13 << 6);
LABEL_31:
    uint64_t v31 = 16 * v22;
    uint64_t v32 = (uint64_t *)(*(void *)(v5 + 48) + v31);
    uint64_t v34 = *v32;
    uint64_t v33 = v32[1];
    BOOL v35 = (uint64_t *)(*(void *)(v5 + 56) + v31);
    uint64_t v36 = *v35;
    uint64_t v37 = v35[1];
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_247EBC9D0();
    sub_247EBC470();
    uint64_t result = sub_247EBC9F0();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v29 = v16 == v28;
        if (v16 == v28) {
          unint64_t v16 = 0;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v11 + 8 * v16);
      }
      while (v30 == -1);
      unint64_t v17 = __clz(__rbit64(~v30)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = 16 * v17;
    uint64_t v19 = (void *)(*(void *)(v7 + 48) + v18);
    *uint64_t v19 = v34;
    v19[1] = v33;
    uint64_t v20 = (void *)(*(void *)(v7 + 56) + v18);
    void *v20 = v36;
    v20[1] = v37;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v39;
  uint64_t v24 = (void *)(v5 + 64);
  if ((v42 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v38 = 1 << *(unsigned char *)(v5 + 32);
  if (v38 >= 64) {
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v24 = -1 << v38;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_247EB6E5C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692D0F80);
  char v38 = a2;
  uint64_t v6 = sub_247EBC860();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  BOOL v35 = v2;
  int64_t v36 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v36) {
      break;
    }
    unint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v37 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v35;
          if ((v38 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v36) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v37 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    BOOL v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
    }
    sub_247EBC9D0();
    sub_247EBC470();
    uint64_t result = sub_247EBC9F0();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *uint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  unint64_t v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_247EB716C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692D12B8);
  uint64_t v6 = (void *)sub_247EBC860();
  if (*(void *)(v5 + 16))
  {
    int64_t v24 = v3;
    uint64_t v7 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v8 = (void *)(v5 + 64);
    uint64_t v9 = -1;
    if (v7 < 64) {
      uint64_t v9 = ~(-1 << v7);
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v11 = (unint64_t)(v7 + 63) >> 6;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v14 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v15 = v14 | (v13 << 6);
      }
      else
      {
        int64_t v16 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
          __break(1u);
LABEL_32:
          __break(1u);
          return result;
        }
        if (v16 >= v11) {
          goto LABEL_23;
        }
        unint64_t v17 = v8[v16];
        ++v13;
        if (!v17)
        {
          int64_t v13 = v16 + 1;
          if (v16 + 1 >= v11) {
            goto LABEL_23;
          }
          unint64_t v17 = v8[v13];
          if (!v17)
          {
            int64_t v18 = v16 + 2;
            if (v18 >= v11)
            {
LABEL_23:
              swift_release();
              if ((a2 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v24;
                goto LABEL_30;
              }
              uint64_t v23 = 1 << *(unsigned char *)(v5 + 32);
              if (v23 >= 64) {
                bzero((void *)(v5 + 64), ((unint64_t)(v23 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *uint64_t v8 = -1 << v23;
              }
              uint64_t v3 = v24;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v17 = v8[v18];
            if (!v17)
            {
              while (1)
              {
                int64_t v13 = v18 + 1;
                if (__OFADD__(v18, 1)) {
                  goto LABEL_32;
                }
                if (v13 >= v11) {
                  goto LABEL_23;
                }
                unint64_t v17 = v8[v13];
                ++v18;
                if (v17) {
                  goto LABEL_20;
                }
              }
            }
            int64_t v13 = v18;
          }
        }
LABEL_20:
        unint64_t v10 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v13 << 6);
      }
      unint64_t v19 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      unint64_t v21 = v19[1];
      unint64_t v22 = (long long *)(*(void *)(v5 + 56) + 40 * v15);
      if (a2)
      {
        sub_247EADA8C(v22, (uint64_t)v25);
      }
      else
      {
        sub_247E9D384((uint64_t)v22, (uint64_t)v25);
        sub_247E9D3E8(v20, v21);
      }
      uint64_t result = sub_247EB738C(v20, v21, v25, v6);
    }
  }
  uint64_t result = swift_release();
LABEL_30:
  *uint64_t v3 = v6;
  return result;
}

uint64_t sub_247EB738C(uint64_t a1, uint64_t a2, long long *a3, void *a4)
{
  sub_247EBC9D0();
  switch(a2)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
      sub_247EBC9E0();
      break;
    default:
      sub_247EBC9E0();
      sub_247EBC470();
      break;
  }
  sub_247EBC9F0();
  unint64_t v8 = sub_247EBC670();
  *(void *)((char *)a4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << v8;
  uint64_t v9 = (void *)(a4[6] + 16 * v8);
  void *v9 = a1;
  v9[1] = a2;
  uint64_t result = sub_247EADA8C(a3, a4[7] + 40 * v8);
  ++a4[2];
  return result;
}

void *sub_247EB7508()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692D12B0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_247EBC850();
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
    int64_t v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      int64_t v9 = v25 + 1;
      if (v25 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v26 = *(void *)(v6 + 8 * v9);
      if (!v26) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v26 - 1) & v26;
    unint64_t v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = (uint64_t *)(*(void *)(v2 + 56) + v16);
    uint64_t v21 = *v20;
    uint64_t v22 = v20[1];
    uint64_t v23 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v23 = v19;
    v23[1] = v18;
    int64_t v24 = (void *)(*(void *)(v4 + 56) + v16);
    *int64_t v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v27 = v25 + 2;
  if (v27 >= v13) {
    goto LABEL_26;
  }
  unint64_t v26 = *(void *)(v6 + 8 * v27);
  if (v26)
  {
    int64_t v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v9);
    ++v27;
    if (v26) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_247EB76C4()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692D0F80);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_247EBC850();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
      goto LABEL_28;
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
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    void *v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = v20;
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
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
LABEL_28:
  __break(1u);
  return result;
}

void *sub_247EB7878()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692D12B8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_247EBC850();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    id result = (void *)swift_release();
LABEL_28:
    *uint64_t v1 = v4;
    return result;
  }
  int64_t v25 = v1;
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    unint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = *v17;
    unint64_t v19 = v17[1];
    uint64_t v20 = 40 * v15;
    sub_247E9D384(*(void *)(v2 + 56) + 40 * v15, (uint64_t)v26);
    uint64_t v21 = (uint64_t *)(*(void *)(v4 + 48) + v16);
    uint64_t *v21 = v18;
    v21[1] = v19;
    sub_247EADA8C(v26, *(void *)(v4 + 56) + v20);
    id result = (void *)sub_247E9D3E8(v18, v19);
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    id result = (void *)swift_release();
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

uint64_t sub_247EB7A68()
{
  uint64_t v2 = swift_task_alloc();
  long long v3 = *(_OWORD *)(v0 + 16);
  long long v4 = *(_OWORD *)(v0 + 32);
  *(void *)(v1 + 16) = v2;
  *(void *)uint64_t v2 = v1;
  *(void *)(v2 + 8) = sub_247EAEFAC;
  *(_OWORD *)(v2 + 16) = v3;
  *(_OWORD *)(v2 + 32) = v4;
  return MEMORY[0x270FA2498](sub_247EB658C, 0, 0);
}

unint64_t sub_247EB7B14()
{
  unint64_t result = qword_2692D14B0;
  if (!qword_2692D14B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692D14B0);
  }
  return result;
}

uint64_t sub_247EB7B68(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t *sub_247EB7BB0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v5 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a1;
    uint64_t v6 = *(int *)(a3 + 20);
    unint64_t v7 = (char *)a1 + v6;
    unint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = sub_247EBC770();
    uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
    swift_bridgeObjectRetain();
    v10(v7, v8, v9);
  }
  return v5;
}

uint64_t sub_247EB7C94(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_247EBC770();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

void *sub_247EB7D0C(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_247EBC770();
  unint64_t v8 = *(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16);
  swift_bridgeObjectRetain();
  v8(v5, v6, v7);
  return a1;
}

void *sub_247EB7DA4(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  unint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_247EBC770();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

void *sub_247EB7E38(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_247EBC770();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

void *sub_247EB7EB4(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  unint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_247EBC770();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  return a1;
}

uint64_t sub_247EB7F40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_247EB7F54);
}

uint64_t sub_247EB7F54(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_247EBC770();
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_247EB8004(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_247EB8018);
}

void *sub_247EB8018(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_247EBC770();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_247EB80C0()
{
  uint64_t result = sub_247EBC770();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for BAAHeadersProvider()
{
  return &type metadata for BAAHeadersProvider;
}

void sub_247EB816C()
{
  *(_WORD *)&algn_2692D14D8[6] = -4864;
}

void sub_247EB819C()
{
  qword_2692D14E0 = 0x2D656C7070412D58;
  *(void *)algn_2692D14E8 = 0xEB00000000616142;
}

uint64_t sub_247EB81C8()
{
  sub_247EBC6A0();
  swift_bridgeObjectRelease();
  id v0 = objc_msgSend(self, sel_processInfo);
  id v1 = objc_msgSend(v0, sel_processName);

  sub_247EBC430();
  sub_247EBC480();
  uint64_t result = swift_bridgeObjectRelease();
  qword_2692D14F0 = 0xD00000000000001BLL;
  unk_2692D14F8 = 0x8000000247EBECA0;
  return result;
}

uint64_t sub_247EB82A8(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 344) = a1;
  *(void *)(v2 + 352) = a2;
  return MEMORY[0x270FA2498](sub_247EB82C8, 0, 0);
}

uint64_t sub_247EB82C8()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692D1510);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_247EBDFC0;
  *(void *)(inited + 32) = sub_247EBC430();
  uint64_t v2 = MEMORY[0x263F8D310];
  *(void *)(inited + 72) = MEMORY[0x263F8D310];
  *(void *)(inited + 40) = v3;
  *(void *)(inited + 48) = 0xD00000000000002ALL;
  *(void *)(inited + 56) = 0x8000000247EBEBF0;
  *(void *)(inited + 80) = sub_247EBC430();
  *(void *)(inited + 88) = v4;
  if (qword_2692D0DD8 != -1) {
    swift_once();
  }
  uint64_t v5 = qword_2692D14F0;
  uint64_t v6 = unk_2692D14F8;
  *(void *)(inited + 120) = v2;
  *(void *)(inited + 96) = v5;
  *(void *)(inited + 104) = v6;
  *(void *)(inited + 128) = sub_247EBC430();
  uint64_t v7 = MEMORY[0x263F8D6C8];
  *(void *)(inited + 168) = MEMORY[0x263F8D6C8];
  *(void *)(inited + 136) = v8;
  *(void *)(inited + 144) = 60;
  *(void *)(inited + 176) = sub_247EBC430();
  *(void *)(inited + 216) = v7;
  *(void *)(inited + 184) = v9;
  *(void *)(inited + 192) = 262800;
  *(void *)(inited + 224) = sub_247EBC430();
  *(void *)(inited + 232) = v10;
  swift_bridgeObjectRetain();
  SecAccessControlRef v11 = sub_247EB9BC0();
  uint64_t v13 = v0[43];
  uint64_t v12 = v0[44];
  type metadata accessor for SecAccessControl(0);
  *(void *)(inited + 264) = v14;
  *(void *)(inited + 240) = v11;
  *(void *)(inited + 272) = sub_247EBC430();
  *(void *)(inited + 280) = v15;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2692D0FA8);
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_247EBDA00;
  *(void *)(v16 + 32) = sub_247EBC430();
  *(void *)(v16 + 40) = v17;
  *(void *)(v16 + 48) = sub_247EBC430();
  *(void *)(v16 + 56) = v18;
  *(void *)(inited + 312) = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D1518);
  *(void *)(inited + 288) = v16;
  unint64_t v19 = sub_247EAEFB0(inited);
  v0[45] = v19;
  uint64_t v20 = (void *)swift_task_alloc();
  v0[46] = v20;
  v20[2] = v19;
  v20[3] = v13;
  void v20[4] = v12;
  uint64_t v21 = (void *)swift_task_alloc();
  v0[47] = v21;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D1010);
  void *v21 = v0;
  v21[1] = sub_247EB8654;
  return MEMORY[0x270FA2360](v0 + 42, 0, 0, 0xD000000000000010, 0x8000000247EBEC20, sub_247EB9D18, v20, v22);
}

uint64_t sub_247EB8654()
{
  *(void *)(*(void *)v1 + 384) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_247EB8794;
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    uint64_t v2 = sub_247EB8778;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_247EB8778()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 336));
}

uint64_t sub_247EB8794()
{
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_247EB8800(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D1520);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x270FA5388](v8, v11);
  sub_247EB8A04(a2);
  uint64_t v12 = (void *)sub_247EBC3C0();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)aBlock - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v8);
  unint64_t v13 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a3;
  *(void *)(v14 + 24) = a4;
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v14 + v13, (char *)aBlock - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
  aBlock[4] = sub_247EB9DF4;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_247EB915C;
  aBlock[3] = &block_descriptor_1;
  uint64_t v15 = _Block_copy(aBlock);
  sub_247EADCB8(a3, a4);
  swift_release();
  DeviceIdentityIssueClientCertificateWithCompletion();
  _Block_release(v15);
}

uint64_t sub_247EB8A04(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2692D1540);
    uint64_t v2 = sub_247EBC870();
  }
  else
  {
    uint64_t v2 = MEMORY[0x263F8EE80];
  }
  uint64_t v28 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v27 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = v2 + 64;
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    int64_t v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v27) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v28 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v27) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v28 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v27) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v28 + 8 * v15);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v5 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
    int64_t v8 = v15;
LABEL_28:
    uint64_t v17 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    sub_247EADD10(*(void *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(void *)&long long v39 = v19;
    *((void *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(void *)&v37[0] = v19;
    *((void *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_247EB003C(v38, v32);
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    sub_247EB003C(v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    sub_247EB003C(v36, v37);
    sub_247EB003C(v37, &v33);
    uint64_t result = sub_247EBC680();
    uint64_t v20 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v6 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v21) & ~*(void *)(v6 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v25 = v22 == v24;
        if (v22 == v24) {
          unint64_t v22 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)(v6 + 8 * v22);
      }
      while (v26 == -1);
      unint64_t v9 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    uint64_t v10 = *(void *)(v2 + 48) + 40 * v9;
    *(_OWORD *)uint64_t v10 = v29;
    *(_OWORD *)(v10 + 16) = v30;
    *(void *)(v10 + 32) = v31;
    uint64_t result = (uint64_t)sub_247EB003C(&v33, (_OWORD *)(*(void *)(v2 + 56) + 32 * v9));
    ++*(void *)(v2 + 16);
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_247EBA390();
    return v2;
  }
  unint64_t v14 = *(void *)(v28 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v15 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_247EB8DCC(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  if (!a1 || !a2) {
    goto LABEL_15;
  }
  id v9 = a1;
  unint64_t v10 = sub_247EB9060(a2);
  if (!v10)
  {

LABEL_15:
    sub_247EB9E9C();
    swift_allocError();
    *(void *)uint64_t v25 = a3;
    *(unsigned char *)(v25 + 8) = 2;
    id v26 = a3;
    swift_willThrow();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2692D1520);
    return sub_247EBC4D0();
  }
  unint64_t v11 = v10;
  if (!(v10 >> 62))
  {
    if (*(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
  if (!sub_247EBC840())
  {
LABEL_14:

    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
LABEL_6:
  uint64_t v12 = sub_247EB9EF0(a4, a5, (__SecKey *)v9);
  unint64_t v14 = v13;
  uint64_t v15 = sub_247EBA028(v11);
  unint64_t v17 = v16;
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692D0FD0);
  uint64_t inited = swift_initStackObject();
  uint64_t v19 = (void *)inited;
  *(_OWORD *)(inited + 16) = xmmword_247EBDA00;
  if (qword_2692D0DC8 != -1) {
    swift_once();
  }
  uint64_t v20 = *(void *)algn_2692D14D8;
  void v19[4] = qword_2692D14D0;
  v19[5] = v20;
  swift_bridgeObjectRetain();
  v19[6] = sub_247EBC2D0();
  v19[7] = v21;
  if (qword_2692D0DD0 != -1) {
    swift_once();
  }
  uint64_t v22 = *(void *)algn_2692D14E8;
  v19[8] = qword_2692D14E0;
  v19[9] = v22;
  swift_bridgeObjectRetain();
  v19[10] = sub_247EBC2D0();
  v19[11] = v23;
  sub_247EAF0E8((uint64_t)v19);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692D1520);
  sub_247EBC4E0();

  sub_247E9F158(v15, v17);
  sub_247E9F158(v12, v14);
  return swift_bridgeObjectRelease();
}

uint64_t sub_247EB9060(uint64_t a1)
{
  uint64_t v6 = MEMORY[0x263F8EE78];
  uint64_t v2 = *(void *)(a1 + 16);
  sub_247EBC700();
  if (!v2) {
    return v6;
  }
  for (uint64_t i = a1 + 32; ; i += 32)
  {
    sub_247EADD10(i, (uint64_t)v5);
    type metadata accessor for SecCertificate(0);
    if (!swift_dynamicCast()) {
      break;
    }
    sub_247EBC6E0();
    sub_247EBC710();
    sub_247EBC720();
    sub_247EBC6F0();
    if (!--v2) {
      return v6;
    }
  }
  swift_release();

  return 0;
}

uint64_t sub_247EB915C(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v6 = *(void (**)(void *, uint64_t, void *))(a1 + 32);
  if (a3) {
    uint64_t v7 = sub_247EBC4A0();
  }
  else {
    uint64_t v7 = 0;
  }
  swift_retain();
  id v8 = a2;
  id v9 = a4;
  v6(a2, v7, a4);
  swift_release();

  return swift_bridgeObjectRelease();
}

void *sub_247EB9210()
{
  v5[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v0 = (void *)sub_247EBC2C0();
  v5[0] = 0;
  id v1 = objc_msgSend(v0, sel_compressedDataUsingAlgorithm_error_, 3, v5);

  id v2 = v5[0];
  if (v1)
  {
    uint64_t v3 = (void *)sub_247EBC2E0();
  }
  else
  {
    uint64_t v3 = v2;
    sub_247EBC250();

    swift_willThrow();
  }
  return v3;
}

unint64_t sub_247EB92E4(id a1, char a2)
{
  if (a2)
  {
    if (a2 == 1)
    {
      id v3 = a1;
      sub_247EBC6A0();
      swift_bridgeObjectRelease();
      unint64_t v12 = 0xD00000000000001CLL;
      if (a1)
      {
        swift_getErrorValue();
        id v4 = a1;
        sub_247EBC980();
        sub_247EBA414(a1, 1u);
      }
      sub_247EBC480();
      swift_bridgeObjectRelease();
      id v9 = a1;
      unsigned __int8 v10 = 1;
    }
    else
    {
      id v7 = a1;
      sub_247EBC6A0();
      swift_bridgeObjectRelease();
      unint64_t v12 = 0xD000000000000024;
      if (a1)
      {
        swift_getErrorValue();
        id v8 = a1;
        sub_247EBC980();
        sub_247EBA414(a1, 2u);
      }
      sub_247EBC480();
      swift_bridgeObjectRelease();
      id v9 = a1;
      unsigned __int8 v10 = 2;
    }
  }
  else
  {
    id v5 = a1;
    sub_247EBC6A0();
    swift_bridgeObjectRelease();
    unint64_t v12 = 0xD000000000000021;
    if (a1)
    {
      swift_getErrorValue();
      id v6 = a1;
      sub_247EBC980();
      sub_247EBA414(a1, 0);
    }
    sub_247EBC480();
    swift_bridgeObjectRelease();
    id v9 = a1;
    unsigned __int8 v10 = 0;
  }
  sub_247EBA414(v9, v10);
  return v12;
}

uint64_t sub_247EB9564(void *a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D1548);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6);
  id v8 = (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247EBA568();
  sub_247EBCA10();
  v10[1] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692D1518);
  sub_247EBA76C(&qword_2692D1558);
  sub_247EBC8F0();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

unint64_t sub_247EB96D8()
{
  return sub_247EB92E4(*(id *)v0, *(unsigned char *)(v0 + 8));
}

unint64_t sub_247EB96E4()
{
  return 0xD000000000000012;
}

uint64_t sub_247EB9700(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return MEMORY[0x270FA2498](sub_247EB9720, 0, 0);
}

uint64_t sub_247EB9720()
{
  uint64_t v1 = sub_247EBC180();
  v0[3] = v1;
  v0[4] = v2;
  if (v2 >> 60 == 15)
  {
    unint64_t v3 = sub_247EAF0E8(MEMORY[0x263F8EE78]);
    uint64_t v4 = (uint64_t (*)(unint64_t))v0[1];
    return v4(v3);
  }
  else
  {
    uint64_t v6 = v1;
    unint64_t v7 = v2;
    id v8 = (void *)swift_task_alloc();
    v0[5] = v8;
    *id v8 = v0;
    v8[1] = sub_247EB9828;
    v8[43] = v6;
    v8[44] = v7;
    return MEMORY[0x270FA2498](sub_247EB82C8, 0, 0);
  }
}

uint64_t sub_247EB9828(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 48) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_247EB99B8;
  }
  else
  {
    *(void *)(v4 + 56) = a1;
    uint64_t v5 = sub_247EB9950;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_247EB9950()
{
  sub_247E9F144(v0[3], v0[4]);
  uint64_t v1 = v0[7];
  unint64_t v2 = (uint64_t (*)(uint64_t))v0[1];
  return v2(v1);
}

uint64_t sub_247EB99B8()
{
  sub_247E9F144(v0[3], v0[4]);
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_247EB9A28@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_247EBC8A0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_247EB9A7C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_247EBA5BC();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_247EB9AA8@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_247EBC8A0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_247EB9B00(uint64_t a1)
{
  unint64_t v2 = sub_247EBA568();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247EB9B3C(uint64_t a1)
{
  unint64_t v2 = sub_247EBA568();
  return MEMORY[0x270FA00B8](a1, v2);
}

void *sub_247EB9B78@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = sub_247EBA5D0(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_247EB9BA4(void *a1)
{
  return sub_247EB9564(a1, *v1);
}

SecAccessControlRef sub_247EB9BC0()
{
  v6[1] = *(CFErrorRef *)MEMORY[0x263EF8340];
  v6[0] = 0;
  SecAccessControlRef v0 = SecAccessControlCreateWithFlags(0, (CFTypeRef)*MEMORY[0x263F16EA0], 0x40000000uLL, v6);
  if (!v0)
  {
    CFErrorRef v1 = v6[0];
    if (v6[0])
    {
      type metadata accessor for CFError(0);
      sub_247EBA338();
      uint64_t v2 = swift_allocError();
      *uint64_t v3 = v1;
    }
    else
    {
      uint64_t v2 = 0;
    }
    sub_247EB9E9C();
    swift_allocError();
    *(void *)uint64_t v4 = v2;
    *(unsigned char *)(v4 + 8) = 0;
    swift_willThrow();
  }
  return v0;
}

uint64_t sub_247EB9CB8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D12A8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_247EB9D18(uint64_t a1)
{
  sub_247EB8800(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_247EB9D24()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D1520);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  sub_247E9F158(*(void *)(v0 + 16), *(void *)(v0 + 24));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_247EB9DF4(void *a1, uint64_t a2, void *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692D1520);
  uint64_t v7 = *(void *)(v3 + 16);
  uint64_t v8 = *(void *)(v3 + 24);
  return sub_247EB8DCC(a1, a2, a3, v7, v8);
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

unint64_t sub_247EB9E9C()
{
  unint64_t result = qword_2692D1528;
  if (!qword_2692D1528)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692D1528);
  }
  return result;
}

uint64_t sub_247EB9EF0(uint64_t a1, uint64_t a2, __SecKey *a3)
{
  v13[1] = *(CFErrorRef *)MEMORY[0x263EF8340];
  v13[0] = 0;
  CFStringRef v4 = (const __CFString *)*MEMORY[0x263F172E8];
  CFDataRef v5 = (const __CFData *)sub_247EBC2C0();
  CFDataRef Signature = SecKeyCreateSignature(a3, v4, v5, v13);

  if (Signature)
  {
    CFDataRef v7 = Signature;
    uint64_t v8 = sub_247EBC2E0();
  }
  else
  {
    CFErrorRef v9 = v13[0];
    if (v13[0])
    {
      type metadata accessor for CFError(0);
      sub_247EBA338();
      uint64_t v8 = swift_allocError();
      *unsigned __int8 v10 = v9;
    }
    else
    {
      uint64_t v8 = 0;
    }
    sub_247EB9E9C();
    swift_allocError();
    *(void *)uint64_t v11 = v8;
    *(unsigned char *)(v11 + 8) = 1;
    swift_willThrow();
  }
  return v8;
}

uint64_t sub_247EBA028(unint64_t a1)
{
  uint64_t v2 = v1;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_247EBC840();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v4)
  {
    uint64_t v35 = MEMORY[0x263F8EE78];
    uint64_t result = sub_247E9C7EC(0, v4 & ~(v4 >> 63), 0);
    if (v4 < 0)
    {
      __break(1u);
      return result;
    }
    if ((a1 & 0xC000000000000001) != 0)
    {
      uint64_t v6 = 0;
      do
      {
        CFDataRef v7 = (__SecCertificate *)MEMORY[0x24C56F2F0](v6, a1);
        CFDataRef v8 = SecCertificateCopyData(v7);
        uint64_t v9 = sub_247EBC2E0();
        unint64_t v11 = v10;

        uint64_t v12 = sub_247EBC2D0();
        uint64_t v14 = v13;
        sub_247E9F158(v9, v11);
        swift_unknownObjectRelease();
        unint64_t v16 = *(void *)(v35 + 16);
        unint64_t v15 = *(void *)(v35 + 24);
        if (v16 >= v15 >> 1) {
          sub_247E9C7EC(v15 > 1, v16 + 1, 1);
        }
        ++v6;
        *(void *)(v35 + 16) = v16 + 1;
        uint64_t v17 = v35 + 16 * v16;
        *(void *)(v17 + 32) = v12;
        *(void *)(v17 + 40) = v14;
      }
      while (v4 != v6);
    }
    else
    {
      uint64_t v18 = (id *)(a1 + 32);
      do
      {
        uint64_t v19 = (__SecCertificate *)*v18;
        CFDataRef v20 = SecCertificateCopyData(v19);
        uint64_t v21 = sub_247EBC2E0();
        unint64_t v23 = v22;

        uint64_t v24 = sub_247EBC2D0();
        uint64_t v26 = v25;
        sub_247E9F158(v21, v23);

        unint64_t v28 = *(void *)(v35 + 16);
        unint64_t v27 = *(void *)(v35 + 24);
        if (v28 >= v27 >> 1) {
          sub_247E9C7EC(v27 > 1, v28 + 1, 1);
        }
        *(void *)(v35 + 16) = v28 + 1;
        uint64_t v29 = v35 + 16 * v28;
        *(void *)(v29 + 32) = v24;
        *(void *)(v29 + 40) = v26;
        ++v18;
        --v4;
      }
      while (v4);
    }
    uint64_t v2 = v1;
  }
  sub_247EBC210();
  swift_allocObject();
  uint64_t v30 = sub_247EBC200();
  sub_247EBA2E4();
  uint64_t v31 = sub_247EBC1F0();
  if (v2)
  {
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v33 = v31;
    unint64_t v34 = v32;
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v30 = (uint64_t)sub_247EB9210();
    sub_247E9F158(v33, v34);
  }
  return v30;
}

unint64_t sub_247EBA2E4()
{
  unint64_t result = qword_2692D1530;
  if (!qword_2692D1530)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692D1530);
  }
  return result;
}

unint64_t sub_247EBA338()
{
  unint64_t result = qword_2692D1538;
  if (!qword_2692D1538)
  {
    type metadata accessor for CFError(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692D1538);
  }
  return result;
}

uint64_t sub_247EBA390()
{
  return swift_release();
}

ValueMetadata *type metadata accessor for Attestation()
{
  return &type metadata for Attestation;
}

uint64_t initializeBufferWithCopyOfBuffer for BAAHeadersProvider.BAASigningError(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  unsigned __int8 v4 = *(unsigned char *)(a2 + 8);
  sub_247EBA3F0(*(id *)a2, v4);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  return a1;
}

id sub_247EBA3F0(id result, unsigned __int8 a2)
{
  if (a2 <= 2u) {
    return result;
  }
  return result;
}

void destroy for BAAHeadersProvider.BAASigningError(uint64_t a1)
{
}

void sub_247EBA414(id a1, unsigned __int8 a2)
{
  if (a2 <= 2u) {
}
  }

uint64_t assignWithCopy for BAAHeadersProvider.BAASigningError(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  unsigned __int8 v4 = *(unsigned char *)(a2 + 8);
  sub_247EBA3F0(*(id *)a2, v4);
  CFDataRef v5 = *(void **)a1;
  *(void *)a1 = v3;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 8);
  *(unsigned char *)(a1 + 8) = v4;
  sub_247EBA414(v5, v6);
  return a1;
}

uint64_t assignWithTake for BAAHeadersProvider.BAASigningError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  unsigned __int8 v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  unsigned __int8 v5 = *(unsigned char *)(a1 + 8);
  *(unsigned char *)(a1 + 8) = v3;
  sub_247EBA414(v4, v5);
  return a1;
}

uint64_t getEnumTagSinglePayload for BAAHeadersProvider.BAASigningError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for BAAHeadersProvider.BAASigningError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)unint64_t result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_247EBA548(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_247EBA550(uint64_t result, char a2)
{
  *(unsigned char *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for BAAHeadersProvider.BAASigningError()
{
  return &type metadata for BAAHeadersProvider.BAASigningError;
}

unint64_t sub_247EBA568()
{
  unint64_t result = qword_2692D1550;
  if (!qword_2692D1550)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692D1550);
  }
  return result;
}

uint64_t sub_247EBA5BC()
{
  return 0x7374726563;
}

void *sub_247EBA5D0(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D1560);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3, v5);
  CFDataRef v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  CFDataRef v8 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247EBA568();
  sub_247EBCA00();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2692D1518);
    sub_247EBA76C(&qword_2692D1568);
    sub_247EBC8D0();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    CFDataRef v8 = (void *)v10[1];
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v8;
}

uint64_t sub_247EBA76C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2692D1518);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for Attestation.CodingKeys(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x247EBA86CLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for Attestation.CodingKeys()
{
  return &type metadata for Attestation.CodingKeys;
}

unint64_t sub_247EBA8A8()
{
  unint64_t result = qword_2692D1570;
  if (!qword_2692D1570)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692D1570);
  }
  return result;
}

unint64_t sub_247EBA900()
{
  unint64_t result = qword_2692D1578;
  if (!qword_2692D1578)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692D1578);
  }
  return result;
}

unint64_t sub_247EBA958()
{
  unint64_t result = qword_2692D1580;
  if (!qword_2692D1580)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692D1580);
  }
  return result;
}

ValueMetadata *type metadata accessor for UserAgentHeadersProvider()
{
  return &type metadata for UserAgentHeadersProvider;
}

unint64_t sub_247EBA9C0()
{
  return 0xD000000000000018;
}

uint64_t sub_247EBA9DC()
{
  int v3 = (uint64_t (__cdecl *)())((char *)&dword_2692D1590 + dword_2692D1590);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_247E9BFBC;
  return v3();
}

uint64_t sub_247EBAA84()
{
  return MEMORY[0x270FA2498](sub_247EBAAA0, 0, 0);
}

uint64_t sub_247EBAAA0()
{
  v0[15] = self;
  v0[16] = sub_247EBC510();
  v0[17] = sub_247EBC500();
  uint64_t v2 = sub_247EBC4C0();
  return MEMORY[0x270FA2498](sub_247EBAB48, v2, v1);
}

uint64_t sub_247EBAB48()
{
  uint64_t v1 = *(void **)(v0 + 120);
  swift_release();
  *(void *)(v0 + 144) = objc_msgSend(v1, sel_currentDevice);
  return MEMORY[0x270FA2498](sub_247EBABD0, 0, 0);
}

uint64_t sub_247EBABD0()
{
  *(void *)(v0 + 152) = sub_247EBC500();
  uint64_t v2 = sub_247EBC4C0();
  return MEMORY[0x270FA2498](sub_247EBAC5C, v2, v1);
}

uint64_t sub_247EBAC5C()
{
  uint64_t v1 = *(void **)(v0 + 144);
  swift_release();
  *(void *)(v0 + 160) = objc_msgSend(v1, sel_systemVersion);

  return MEMORY[0x270FA2498](sub_247EBACE4, 0, 0);
}

uint64_t sub_247EBACE4()
{
  uint64_t v2 = (void *)v1[20];
  v1[12] = sub_247EBC430();
  v1[13] = v3;

  uint64_t v4 = _CFCopySystemVersionDictionary();
  if (!v4)
  {
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v5 = (void *)v4;
  sub_247E9D5A0();
  sub_247EBB1C4();
  uint64_t v6 = sub_247EBC3D0();

  CFDataRef v7 = (void *)*MEMORY[0x263EFFAB0];
  if (!*MEMORY[0x263EFFAB0])
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if ((v6 & 0xC000000000000001) == 0)
  {
    if (!*(void *)(v6 + 16))
    {
LABEL_15:
      uint64_t v10 = swift_bridgeObjectRelease();
LABEL_16:
      __break(1u);
      return MEMORY[0x270FA2498](v10, v11, v12);
    }
    id v0 = v7;
    unint64_t v13 = sub_247EAF97C((uint64_t)v0);
    if (v14)
    {
      uint64_t v9 = *(void *)(*(void *)(v6 + 56) + 8 * v13);
      swift_unknownObjectRetain();
      swift_bridgeObjectRelease();

      goto LABEL_9;
    }
LABEL_14:

    goto LABEL_15;
  }
  id v8 = v7;
  uint64_t v9 = sub_247EBC810();
  swift_bridgeObjectRelease();

  if (!v9) {
    goto LABEL_16;
  }
LABEL_9:
  v1[14] = v9;
  swift_dynamicCast();
  uint64_t v15 = v1[11];
  v1[21] = v1[10];
  v1[22] = v15;
  v1[23] = sub_247EBC500();
  uint64_t v16 = sub_247EBC4C0();
  uint64_t v18 = v17;
  uint64_t v10 = (uint64_t)sub_247EBAE8C;
  uint64_t v11 = v16;
  uint64_t v12 = v18;
  return MEMORY[0x270FA2498](v10, v11, v12);
}

uint64_t sub_247EBAE8C()
{
  uint64_t v1 = *(void **)(v0 + 120);
  swift_release();
  *(void *)(v0 + 192) = objc_msgSend(v1, sel_currentDevice);
  return MEMORY[0x270FA2498](sub_247EBAF14, 0, 0);
}

uint64_t sub_247EBAF14()
{
  *(void *)(v0 + 200) = sub_247EBC500();
  uint64_t v2 = sub_247EBC4C0();
  return MEMORY[0x270FA2498](sub_247EBAFA0, v2, v1);
}

uint64_t sub_247EBAFA0()
{
  uint64_t v1 = *(void **)(v0 + 192);
  swift_release();
  *(void *)(v0 + 208) = objc_msgSend(v1, sel_model);

  return MEMORY[0x270FA2498](sub_247EBB028, 0, 0);
}

uint64_t sub_247EBB028()
{
  uint64_t v1 = *(void **)(v0 + 208);
  sub_247EBC430();

  __swift_instantiateConcreteTypeFromMangledName(&qword_2692D0FD0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_247EBD6D0;
  *(void *)(inited + 32) = 0x6567412D72657355;
  *(void *)(inited + 40) = 0xEA0000000000746ELL;
  sub_247EBC6A0();
  swift_bridgeObjectRelease();
  sub_247EBC480();
  swift_bridgeObjectRelease();
  sub_247EBC480();
  sub_247EBC480();
  swift_bridgeObjectRelease();
  sub_247EBC480();
  sub_247EBC480();
  swift_bridgeObjectRelease();
  *(void *)(inited + 48) = 0x73676E6974746553;
  *(void *)(inited + 56) = 0xEB000000002F312FLL;
  unint64_t v3 = sub_247EAF0E8(inited);
  uint64_t v4 = *(uint64_t (**)(unint64_t))(v0 + 8);
  return v4(v3);
}

unint64_t sub_247EBB1C4()
{
  unint64_t result = qword_2692D1598[0];
  if (!qword_2692D1598[0])
  {
    sub_247E9D5A0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2692D1598);
  }
  return result;
}

uint64_t sub_247EBB21C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t sub_247EBB224()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_247EBB2C0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  int v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    uint64_t v9 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    *(void *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_247EBB3BC(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();
  return swift_bridgeObjectRelease();
}

uint64_t sub_247EBB42C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 16;
  (*(void (**)(void))v5)();
  *(void *)((*(void *)(v5 + 48) + 7 + a1) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v5 + 48) + 7 + a2) & 0xFFFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_247EBB4AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 24;
  (*(void (**)(void))v5)();
  *(void *)((*(void *)(v5 + 40) + 7 + a1) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v5 + 40) + 7 + a2) & 0xFFFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_247EBB538(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 32;
  (*(void (**)(void))v5)();
  *(void *)((*(void *)(v5 + 32) + 7 + a1) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v5 + 32) + 7 + a2) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_247EBB5B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 40;
  (*(void (**)(void))v5)();
  *(void *)((*(void *)(v5 + 24) + 7 + a1) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v5 + 24) + 7 + a2) & 0xFFFFFFFFFFFFFFF8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_247EBB638(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(void *)(v4 + 64);
  if (v5 <= 0x7FFFFFFF) {
    unsigned int v7 = 0x7FFFFFFF;
  }
  else {
    unsigned int v7 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0;
  }
  if (v7 < a2)
  {
    unint64_t v8 = ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
    unsigned int v9 = a2 - v7;
    uint64_t v10 = v8 & 0xFFFFFFF8;
    if ((v8 & 0xFFFFFFF8) != 0) {
      unsigned int v11 = 2;
    }
    else {
      unsigned int v11 = v9 + 1;
    }
    if (v11 >= 0x10000) {
      unsigned int v12 = 4;
    }
    else {
      unsigned int v12 = 2;
    }
    if (v11 < 0x100) {
      unsigned int v12 = 1;
    }
    if (v11 >= 2) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0;
    }
    switch(v13)
    {
      case 1:
        int v14 = *((unsigned __int8 *)a1 + v8);
        if (!v14) {
          break;
        }
        goto LABEL_22;
      case 2:
        int v14 = *(unsigned __int16 *)((char *)a1 + v8);
        if (v14) {
          goto LABEL_22;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x247EBB784);
      case 4:
        int v14 = *(_DWORD *)((char *)a1 + v8);
        if (!v14) {
          break;
        }
LABEL_22:
        int v16 = v14 - 1;
        if (v10)
        {
          int v16 = 0;
          LODWORD(v10) = *a1;
        }
        return v7 + (v10 | v16) + 1;
      default:
        break;
    }
  }
  if (v5 >= 0x7FFFFFFF) {
    return (*(uint64_t (**)(void))(v4 + 48))();
  }
  unint64_t v17 = *(void *)(((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
  if (v17 >= 0xFFFFFFFF) {
    LODWORD(v17) = -1;
  }
  return (v17 + 1);
}

void sub_247EBB798(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v9 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  unint64_t v10 = ((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  if (((v9 + 7) & 0xFFFFFFF8) == 0xFFFFFFF8) {
    unsigned int v11 = a3 - v8 + 1;
  }
  else {
    unsigned int v11 = 2;
  }
  if (v11 >= 0x10000) {
    int v12 = 4;
  }
  else {
    int v12 = 2;
  }
  if (v11 < 0x100) {
    int v12 = 1;
  }
  if (v11 >= 2) {
    unsigned int v13 = v12;
  }
  else {
    unsigned int v13 = 0;
  }
  if (v8 < a3) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 0;
  }
  if (a2 > v8)
  {
    if (((v9 + 7) & 0xFFFFFFF8) == 0xFFFFFFF8) {
      int v15 = a2 - v8;
    }
    else {
      int v15 = 1;
    }
    if (((v9 + 7) & 0xFFFFFFF8) != 0xFFFFFFF8)
    {
      int v16 = ~v8 + a2;
      bzero(a1, ((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 8);
      *(_DWORD *)a1 = v16;
    }
    switch(v14)
    {
      case 1:
        a1[v10] = v15;
        return;
      case 2:
        *(_WORD *)&a1[v10] = v15;
        return;
      case 3:
        goto LABEL_44;
      case 4:
        *(_DWORD *)&a1[v10] = v15;
        return;
      default:
        return;
    }
  }
  switch(v14)
  {
    case 1:
      a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_33;
    case 2:
      *(_WORD *)&a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_33;
    case 3:
LABEL_44:
      __break(1u);
      JUMPOUT(0x247EBB974);
    case 4:
      *(_DWORD *)&a1[v10] = 0;
      goto LABEL_32;
    default:
LABEL_32:
      if (a2)
      {
LABEL_33:
        if (v7 < 0x7FFFFFFF)
        {
          uint64_t v18 = (void *)((unint64_t)&a1[v9 + 7] & 0xFFFFFFFFFFFFFFF8);
          if ((a2 & 0x80000000) != 0) {
            uint64_t v19 = a2 ^ 0x80000000;
          }
          else {
            uint64_t v19 = a2 - 1;
          }
          *uint64_t v18 = v19;
        }
        else
        {
          unint64_t v17 = *(void (**)(void))(v6 + 56);
          v17();
        }
      }
      return;
  }
}

uint64_t type metadata accessor for ErrorHandlingHeadersProvider()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_247EBB9B4(uint64_t a1)
{
  sub_247EBC6A0();
  uint64_t v2 = (*(uint64_t (**)(void))(*(void *)(a1 + 24) + 8))(*(void *)(a1 + 16));
  swift_bridgeObjectRelease();
  sub_247EBC480();
  return v2;
}

uint64_t sub_247EBBA54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[4] = a3;
  double v4[5] = v3;
  uint64_t v8 = sub_247EBC3B0();
  v4[6] = v8;
  v4[7] = *(void *)(v8 - 8);
  v4[8] = swift_task_alloc();
  uint64_t v11 = a3 + 16;
  uint64_t v9 = *(void *)(a3 + 16);
  uint64_t v10 = *(void *)(v11 + 8);
  int v12 = *(int **)(v10 + 16);
  v4[9] = v9;
  int v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)v12 + *v12);
  unsigned int v13 = (void *)swift_task_alloc();
  v4[10] = v13;
  *unsigned int v13 = v4;
  v13[1] = sub_247EBBBC4;
  return v15(a1, a2, v9, v10);
}

uint64_t sub_247EBBBC4(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 88) = v1;
  swift_task_dealloc();
  if (v1)
  {
    return MEMORY[0x270FA2498](sub_247EBBD1C, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    unsigned int v5 = *(uint64_t (**)(uint64_t))(v4 + 8);
    return v5(a1);
  }
}

uint64_t sub_247EBBD1C()
{
  uint64_t v29 = v0;
  if (qword_2692D0DB8 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[11];
  uint64_t v3 = v0[7];
  uint64_t v2 = v0[8];
  uint64_t v4 = v0[6];
  uint64_t v5 = __swift_project_value_buffer(v4, (uint64_t)qword_2692D2D78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  id v6 = v1;
  id v7 = v1;
  uint64_t v8 = sub_247EBC390();
  os_log_type_t v9 = sub_247EBC5F0();
  BOOL v10 = os_log_type_enabled(v8, v9);
  uint64_t v11 = (void *)v0[11];
  if (v10)
  {
    uint64_t v25 = v0[7];
    uint64_t v26 = v0[6];
    uint64_t v27 = v0[8];
    uint64_t v12 = swift_slowAlloc();
    unsigned int v13 = (void *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v28 = v14;
    *(_DWORD *)uint64_t v12 = 136315394;
    swift_getMetatypeMetadata();
    uint64_t v15 = sub_247EBCB10();
    v0[2] = sub_247EAABD0(v15, v16, &v28);
    sub_247EBC630();
    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 12) = 2112;
    id v17 = v11;
    uint64_t v18 = _swift_stdlib_bridgeErrorToNSError();
    v0[3] = v18;
    sub_247EBC630();
    *unsigned int v13 = v18;

    _os_log_impl(&dword_247E99000, v8, v9, "Failed to retrieve headers using %s: '%@'. using fallback value.", (uint8_t *)v12, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2692D11D8);
    swift_arrayDestroy();
    MEMORY[0x24C56FD50](v13, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x24C56FD50](v14, -1, -1);
    MEMORY[0x24C56FD50](v12, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v27, v26);
  }
  else
  {
    uint64_t v20 = v0[7];
    uint64_t v19 = v0[8];
    uint64_t v21 = v0[6];

    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
  }
  uint64_t v22 = *(void *)(v0[5] + *(int *)(v0[4] + 36));
  swift_bridgeObjectRetain();
  swift_task_dealloc();
  unint64_t v23 = (uint64_t (*)(uint64_t))v0[1];
  return v23(v22);
}

uint64_t sub_247EBC030(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *id v7 = v3;
  v7[1] = sub_247E9BFBC;
  return sub_247EBBA54(a1, a2, a3);
}

uint64_t getEnumTagSinglePayload for TimeoutError(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for TimeoutError(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)uint64_t result = (a2 - 1);
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

ValueMetadata *type metadata accessor for TimeoutError()
{
  return &type metadata for TimeoutError;
}

unint64_t sub_247EBC134()
{
  return 0xD000000000000013;
}

uint64_t sub_247EBC150()
{
  return MEMORY[0x270EEDBB0]();
}

uint64_t sub_247EBC160()
{
  return MEMORY[0x270EEDC10]();
}

uint64_t sub_247EBC170()
{
  return MEMORY[0x270EEDC50]();
}

uint64_t sub_247EBC180()
{
  return MEMORY[0x270EEDC88]();
}

uint64_t sub_247EBC190()
{
  return MEMORY[0x270EEDC90]();
}

uint64_t sub_247EBC1A0()
{
  return MEMORY[0x270EEDCA0]();
}

uint64_t sub_247EBC1B0()
{
  return MEMORY[0x270EEDCB8]();
}

uint64_t sub_247EBC1C0()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_247EBC1D0()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_247EBC1E0()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_247EBC1F0()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_247EBC200()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_247EBC210()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_247EBC220()
{
  return MEMORY[0x270EEE3E0]();
}

uint64_t sub_247EBC230()
{
  return MEMORY[0x270EEE410]();
}

uint64_t sub_247EBC240()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_247EBC250()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_247EBC260()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t sub_247EBC270()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_247EBC280()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_247EBC290()
{
  return MEMORY[0x270EEFF38]();
}

uint64_t sub_247EBC2A0()
{
  return MEMORY[0x270EEFF40]();
}

uint64_t sub_247EBC2B0()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_247EBC2C0()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_247EBC2D0()
{
  return MEMORY[0x270EF0130]();
}

uint64_t sub_247EBC2E0()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_247EBC2F0()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_247EBC300()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_247EBC310()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_247EBC320()
{
  return MEMORY[0x270EF0F48]();
}

uint64_t sub_247EBC330()
{
  return MEMORY[0x270EF0F70]();
}

uint64_t sub_247EBC340()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_247EBC350()
{
  return MEMORY[0x270EF1050]();
}

uint64_t sub_247EBC360()
{
  return MEMORY[0x270EF1060]();
}

uint64_t sub_247EBC370()
{
  return MEMORY[0x270EF1080]();
}

uint64_t sub_247EBC380()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_247EBC390()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_247EBC3A0()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_247EBC3B0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_247EBC3C0()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_247EBC3D0()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_247EBC3E0()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_247EBC3F0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_247EBC400()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_247EBC410()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_247EBC420()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_247EBC430()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_247EBC440()
{
  return MEMORY[0x270EF19F8]();
}

uint64_t sub_247EBC450()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_247EBC460()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_247EBC470()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_247EBC480()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_247EBC490()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_247EBC4A0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_247EBC4C0()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_247EBC4D0()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_247EBC4E0()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_247EBC500()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_247EBC510()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_247EBC520()
{
  return MEMORY[0x270FA1EF0]();
}

uint64_t sub_247EBC530()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_247EBC540()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_247EBC580()
{
  return MEMORY[0x270FA2040]();
}

uint64_t sub_247EBC5A0()
{
  return MEMORY[0x270FA2068]();
}

uint64_t sub_247EBC5E0()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_247EBC5F0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_247EBC600()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_247EBC610()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_247EBC620()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_247EBC630()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_247EBC640()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_247EBC650()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_247EBC660()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_247EBC670()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_247EBC680()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_247EBC690()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_247EBC6A0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_247EBC6B0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_247EBC6C0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_247EBC6D0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_247EBC6E0()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_247EBC6F0()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_247EBC700()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_247EBC710()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_247EBC720()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_247EBC730()
{
  return MEMORY[0x270FA2160]();
}

uint64_t sub_247EBC740()
{
  return MEMORY[0x270FA2198]();
}

uint64_t sub_247EBC750()
{
  return MEMORY[0x270FA21A0]();
}

uint64_t sub_247EBC760()
{
  return MEMORY[0x270FA21A8]();
}

uint64_t sub_247EBC770()
{
  return MEMORY[0x270FA21B0]();
}

uint64_t sub_247EBC780()
{
  return MEMORY[0x270F9ECE0]();
}

uint64_t sub_247EBC790()
{
  return MEMORY[0x270FA21B8]();
}

uint64_t sub_247EBC7A0()
{
  return MEMORY[0x270FA21D0]();
}

uint64_t sub_247EBC7B0()
{
  return MEMORY[0x270FA21E0]();
}

uint64_t sub_247EBC7C0()
{
  return MEMORY[0x270FA21F0]();
}

uint64_t sub_247EBC7D0()
{
  return MEMORY[0x270FA21F8]();
}

uint64_t sub_247EBC7E0()
{
  return MEMORY[0x270FA2200]();
}

uint64_t sub_247EBC7F0()
{
  return MEMORY[0x270FA2208]();
}

uint64_t sub_247EBC800()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_247EBC810()
{
  return MEMORY[0x270F9EFB0]();
}

uint64_t sub_247EBC820()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_247EBC830()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_247EBC840()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_247EBC850()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_247EBC860()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_247EBC870()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_247EBC880()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_247EBC8A0()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_247EBC8C0()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_247EBC8D0()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_247EBC8E0()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_247EBC8F0()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_247EBC900()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_247EBC910()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_247EBC940()
{
  return MEMORY[0x270F9FA88]();
}

uint64_t sub_247EBC950()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_247EBC960()
{
  return MEMORY[0x270FA2378]();
}

uint64_t sub_247EBC980()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_247EBC990()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_247EBC9A0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_247EBC9B0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_247EBC9C0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_247EBC9D0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_247EBC9E0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_247EBC9F0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_247EBCA00()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_247EBCA10()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_247EBCA20()
{
  return MEMORY[0x270EF2840]();
}

uint64_t sub_247EBCA30()
{
  return MEMORY[0x270EF2860]();
}

uint64_t sub_247EBCA40()
{
  return MEMORY[0x270EF2870]();
}

uint64_t sub_247EBCA50()
{
  return MEMORY[0x270EF2920]();
}

uint64_t sub_247EBCA60()
{
  return MEMORY[0x270EF2928]();
}

uint64_t sub_247EBCA70()
{
  return MEMORY[0x270EF2948]();
}

uint64_t sub_247EBCA80()
{
  return MEMORY[0x270EF2978]();
}

uint64_t sub_247EBCA90()
{
  return MEMORY[0x270EF2980]();
}

uint64_t sub_247EBCAA0()
{
  return MEMORY[0x270EF29A0]();
}

uint64_t sub_247EBCAB0()
{
  return MEMORY[0x270EF29D0]();
}

uint64_t sub_247EBCAC0()
{
  return MEMORY[0x270EF29F0]();
}

uint64_t sub_247EBCAD0()
{
  return MEMORY[0x270EF2A10]();
}

uint64_t sub_247EBCAE0()
{
  return MEMORY[0x270F9FF68]();
}

uint64_t sub_247EBCB10()
{
  return MEMORY[0x270FA0128]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

uint64_t DeviceIdentityIssueClientCertificateWithCompletion()
{
  return MEMORY[0x270F25E68]();
}

SecAccessControlRef SecAccessControlCreateWithFlags(CFAllocatorRef allocator, CFTypeRef protection, SecAccessControlCreateFlags flags, CFErrorRef *error)
{
  return (SecAccessControlRef)MEMORY[0x270EFD650](allocator, protection, flags, error);
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x270EFD710](certificate);
}

CFDataRef SecKeyCreateSignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef dataToSign, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x270EFDA50](key, algorithm, dataToSign, error);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x270EE55F0]();
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x270FA01A0]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x270FA2420]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x270FA2428]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x270FA03C8]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
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

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x270FA0550]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}