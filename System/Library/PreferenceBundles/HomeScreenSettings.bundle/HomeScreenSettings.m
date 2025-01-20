unint64_t sub_46C0(char a1)
{
  unint64_t result;

  result = 0xD000000000000013;
  switch(a1)
  {
    case 1:
      result = 0xD000000000000015;
      break;
    case 2:
      result = 0xD000000000000010;
      break;
    case 3:
      result = 0xD000000000000022;
      break;
    case 4:
      result = 0xD00000000000001ELL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_476C(char *a1, char *a2)
{
  return sub_4778(*a1, *a2);
}

uint64_t sub_4778(char a1, char a2)
{
  unint64_t v3 = 0xD000000000000013;
  unint64_t v4 = 0x800000000000E1A0;
  switch(a1)
  {
    case 1:
      unint64_t v3 = 0xD000000000000015;
      v5 = "BADGES_IN_APP_LIBRARY";
      goto LABEL_6;
    case 2:
      unint64_t v4 = 0x800000000000E1E0;
      unint64_t v3 = 0xD000000000000010;
      break;
    case 3:
      unint64_t v3 = 0xD000000000000022;
      v5 = "MULTITASKING_DOCK#SHOW_APP_LIBRARY";
      goto LABEL_6;
    case 4:
      unint64_t v3 = 0xD00000000000001ELL;
      v5 = "HOME_SCREEN_DOCK#ALLOW_RECENTS";
LABEL_6:
      unint64_t v4 = (unint64_t)(v5 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xD000000000000013;
  unint64_t v7 = 0x800000000000E1A0;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xD000000000000015;
      v8 = "BADGES_IN_APP_LIBRARY";
      goto LABEL_12;
    case 2:
      unint64_t v7 = 0x800000000000E1E0;
      unint64_t v6 = 0xD000000000000010;
      break;
    case 3:
      unint64_t v6 = 0xD000000000000022;
      v8 = "MULTITASKING_DOCK#SHOW_APP_LIBRARY";
      goto LABEL_12;
    case 4:
      unint64_t v6 = 0xD00000000000001ELL;
      v8 = "HOME_SCREEN_DOCK#ALLOW_RECENTS";
LABEL_12:
      unint64_t v7 = (unint64_t)(v8 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  if (v3 == v6 && v4 == v7) {
    char v9 = 1;
  }
  else {
    char v9 = sub_D810();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

Swift::Int sub_4918()
{
  return sub_4920();
}

Swift::Int sub_4920()
{
  return sub_D830();
}

uint64_t sub_4A1C()
{
  return sub_4A24();
}

uint64_t sub_4A24()
{
  sub_D740();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_4B04()
{
  return sub_4B0C();
}

Swift::Int sub_4B0C()
{
  return sub_D830();
}

uint64_t sub_4C04()
{
  return sub_4C88();
}

uint64_t sub_4C18@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_9F6C(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

unint64_t sub_4C48@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_46C0(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_4C74()
{
  return sub_4C88();
}

uint64_t sub_4C88()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_D490();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_4CF4()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC18HomeScreenSettings18HomeScreenDeepLink__sectionPath;
  uint64_t v2 = sub_A290(&qword_14590);
  unint64_t v3 = *(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  v3(v1, v2);
  v3(v0 + OBJC_IVAR____TtC18HomeScreenSettings18HomeScreenDeepLink__highlightPath, v2);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v5 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v4, v5);
}

uint64_t sub_4DDC()
{
  return type metadata accessor for HomeScreenDeepLink(0);
}

uint64_t type metadata accessor for HomeScreenDeepLink(uint64_t a1)
{
  return sub_5CBC(a1, (uint64_t *)&unk_143F0);
}

void sub_4E04()
{
  sub_4EA0();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_4EA0()
{
  if (!qword_14400)
  {
    sub_4EFC((uint64_t *)&unk_14408);
    unint64_t v0 = sub_D4B0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_14400);
    }
  }
}

uint64_t sub_4EFC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for HomeScreenItemPath(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for HomeScreenItemPath(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for HomeScreenItemPath(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x50B0);
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

uint64_t sub_50D8(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_50E4(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for HomeScreenItemPath()
{
  return &type metadata for HomeScreenItemPath;
}

uint64_t sub_50FC(uint64_t a1, uint64_t *a2, int *a3)
{
  int v4 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v5 = *a2;
  *(void *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = v5 + ((v4 + 16) & ~(unint64_t)v4);
    swift_retain();
  }
  else
  {
    uint64_t v8 = a2[2];
    *(void *)(a1 + 8) = a2[1];
    uint64_t v9 = a2[3];
    char v10 = *((unsigned char *)a2 + 32);
    swift_retain();
    sub_52B8(v8, v9, v10);
    *(void *)(a1 + 16) = v8;
    *(void *)(a1 + 24) = v9;
    *(unsigned char *)(a1 + 32) = v10;
    uint64_t v11 = a2[6];
    *(void *)(a1 + 40) = a2[5];
    *(void *)(a1 + 48) = v11;
    uint64_t v12 = a3[8];
    uint64_t v13 = a1 + v12;
    uint64_t v14 = (uint64_t)a2 + v12;
    uint64_t v15 = sub_D700();
    v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16);
    swift_retain();
    swift_retain();
    v16(v13, v14, v15);
    uint64_t v17 = a3[9];
    uint64_t v18 = a1 + v17;
    uint64_t v19 = (uint64_t)a2 + v17;
    uint64_t v20 = sub_D400();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
    uint64_t v21 = a3[10];
    uint64_t v22 = a1 + v21;
    uint64_t v23 = (uint64_t)a2 + v21;
    uint64_t v24 = sub_D430();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 16))(v22, v23, v24);
  }
  return a1;
}

uint64_t sub_52B8(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return _objc_retain_x1();
  }
  else {
    return swift_retain();
  }
}

uint64_t sub_52C8(uint64_t a1, int *a2)
{
  swift_release();
  sub_53E4(*(void *)(a1 + 16), *(void *)(a1 + 24), *(unsigned char *)(a1 + 32));
  swift_release();
  swift_release();
  uint64_t v4 = a1 + a2[8];
  uint64_t v5 = sub_D700();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = a1 + a2[9];
  uint64_t v7 = sub_D400();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  uint64_t v8 = a1 + a2[10];
  uint64_t v9 = sub_D430();
  char v10 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8);

  return v10(v8, v9);
}

uint64_t sub_53E4(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return _objc_release_x1();
  }
  else {
    return swift_release();
  }
}

uint64_t sub_53F4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  uint64_t v7 = *(void *)(a2 + 16);
  uint64_t v8 = *(void *)(a2 + 24);
  char v9 = *(unsigned char *)(a2 + 32);
  swift_retain();
  sub_52B8(v7, v8, v9);
  *(void *)(a1 + 16) = v7;
  *(void *)(a1 + 24) = v8;
  *(unsigned char *)(a1 + 32) = v9;
  uint64_t v10 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v10;
  uint64_t v11 = a3[8];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_D700();
  uint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16);
  swift_retain();
  swift_retain();
  v15(v12, v13, v14);
  uint64_t v16 = a3[9];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = sub_D400();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 16))(v17, v18, v19);
  uint64_t v20 = a3[10];
  uint64_t v21 = a1 + v20;
  uint64_t v22 = a2 + v20;
  uint64_t v23 = sub_D430();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 16))(v21, v22, v23);
  return a1;
}

uint64_t sub_5560(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 24);
  char v8 = *(unsigned char *)(a2 + 32);
  sub_52B8(v6, v7, v8);
  uint64_t v9 = *(void *)(a1 + 16);
  uint64_t v10 = *(void *)(a1 + 24);
  char v11 = *(unsigned char *)(a1 + 32);
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  *(unsigned char *)(a1 + 32) = v8;
  sub_53E4(v9, v10, v11);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_retain();
  swift_release();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_retain();
  swift_release();
  uint64_t v12 = a3[8];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = sub_D700();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 24))(v13, v14, v15);
  uint64_t v16 = a3[9];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = sub_D400();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 24))(v17, v18, v19);
  uint64_t v20 = a3[10];
  uint64_t v21 = a1 + v20;
  uint64_t v22 = a2 + v20;
  uint64_t v23 = sub_D430();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 24))(v21, v22, v23);
  return a1;
}

uint64_t sub_56F0(uint64_t a1, uint64_t a2, int *a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  uint64_t v7 = a3[8];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_D700();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = a3[9];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_D400();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
  uint64_t v15 = a3[10];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  uint64_t v18 = sub_D430();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 32))(v16, v17, v18);
  return a1;
}

uint64_t sub_581C(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  uint64_t v6 = *(void *)(a2 + 24);
  char v7 = *(unsigned char *)(a2 + 32);
  uint64_t v8 = *(void *)(a1 + 16);
  uint64_t v9 = *(void *)(a1 + 24);
  char v10 = *(unsigned char *)(a1 + 32);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = v6;
  *(unsigned char *)(a1 + 32) = v7;
  sub_53E4(v8, v9, v10);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_release();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_release();
  uint64_t v11 = a3[8];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_D700();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 40))(v12, v13, v14);
  uint64_t v15 = a3[9];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  uint64_t v18 = sub_D400();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 40))(v16, v17, v18);
  uint64_t v19 = a3[10];
  uint64_t v20 = a1 + v19;
  uint64_t v21 = a2 + v19;
  uint64_t v22 = sub_D430();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 40))(v20, v21, v22);
  return a1;
}

uint64_t sub_5984(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_5998);
}

uint64_t sub_5998(uint64_t a1, uint64_t a2, int *a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 40);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  uint64_t v8 = sub_D700();
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a2)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a3[8];
LABEL_9:
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
    return v13(a1 + v11, a2, v9);
  }
  uint64_t v12 = sub_D400();
  if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a2)
  {
    uint64_t v9 = v12;
    uint64_t v10 = *(void *)(v12 - 8);
    uint64_t v11 = a3[9];
    goto LABEL_9;
  }
  uint64_t v14 = sub_D430();
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48);
  uint64_t v16 = v14;
  uint64_t v17 = a1 + a3[10];

  return v15(v17, a2, v16);
}

uint64_t sub_5B10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_5B24);
}

uint64_t sub_5B24(uint64_t result, uint64_t a2, int a3, int *a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 40) = (a2 - 1);
    return result;
  }
  uint64_t v8 = sub_D700();
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a3)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a4[8];
LABEL_7:
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56);
    return v13(v5 + v11, a2, a2, v9);
  }
  uint64_t v12 = sub_D400();
  if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a3)
  {
    uint64_t v9 = v12;
    uint64_t v10 = *(void *)(v12 - 8);
    uint64_t v11 = a4[9];
    goto LABEL_7;
  }
  uint64_t v14 = sub_D430();
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  uint64_t v16 = v14;
  uint64_t v17 = v5 + a4[10];

  return v15(v17, a2, a2, v16);
}

uint64_t type metadata accessor for HomeScreenSettingsList(uint64_t a1)
{
  return sub_5CBC(a1, qword_144F0);
}

uint64_t sub_5CBC(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_5CF4()
{
  uint64_t result = sub_D700();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_D400();
    if (v2 <= 0x3F)
    {
      uint64_t result = sub_D430();
      if (v3 <= 0x3F)
      {
        swift_initStructMetadata();
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_5E1C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_5E38@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_D460();
  *a1 = result;
  return result;
}

id sub_5E88()
{
  id v0 = objc_allocWithZone((Class)SBSHomeScreenService);

  return [v0 init];
}

uint64_t sub_5EC0@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v45 = a1;
  uint64_t v51 = a3;
  uint64_t v49 = sub_D570();
  uint64_t v4 = *(void *)(v49 - 8);
  __chkstk_darwin(v49);
  uint64_t v44 = v5;
  v47 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = type metadata accessor for HomeScreenSettingsList(0);
  uint64_t v34 = *(void *)(v50 - 8);
  __chkstk_darwin(v50);
  uint64_t v37 = v6;
  uint64_t v42 = (uint64_t)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = sub_A290(&qword_14548);
  uint64_t v46 = *(void *)(v48 - 8);
  __chkstk_darwin(v48);
  uint64_t v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_A290(&qword_14550);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_A290(&qword_14558);
  uint64_t v38 = *(void *)(v40 - 8);
  __chkstk_darwin(v40);
  uint64_t v14 = (char *)&v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = sub_A290(&qword_14560);
  __chkstk_darwin(v43);
  uint64_t v16 = (char *)&v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = sub_A290(&qword_14568);
  uint64_t v39 = *(void *)(v41 - 8);
  __chkstk_darwin(v41);
  v36 = (char *)&v34 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = a2;
  sub_A290(&qword_14570);
  sub_AE58(&qword_14578, &qword_14570);
  sub_D5E0();
  sub_AE58(&qword_14580, &qword_14550);
  v35 = v14;
  sub_D600();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  if (*a2)
  {
    swift_beginAccess();
    swift_retain();
    sub_A290(&qword_14590);
    sub_D480();
    swift_endAccess();
    swift_release();
    uint64_t v18 = (uint64_t)a2;
    uint64_t v19 = v42;
    sub_9FB8(v18, v42);
    uint64_t v20 = v47;
    uint64_t v21 = v49;
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v47, v45, v49);
    unint64_t v22 = (*(unsigned __int8 *)(v34 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80);
    unint64_t v23 = (v37 + *(unsigned __int8 *)(v4 + 80) + v22) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
    uint64_t v24 = swift_allocObject();
    sub_A1AC(v19, v24 + v22);
    (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v24 + v23, v20, v21);
    uint64_t v25 = v38;
    v26 = v35;
    uint64_t v27 = v40;
    (*(void (**)(char *, char *, uint64_t))(v38 + 16))(v16, v35, v40);
    uint64_t v28 = v43;
    uint64_t v29 = v46;
    uint64_t v30 = v48;
    (*(void (**)(char *, char *, uint64_t))(v46 + 16))(&v16[*(int *)(v43 + 52)], v8, v48);
    v31 = (uint64_t (**)(unsigned __int8 *))&v16[*(int *)(v28 + 56)];
    *v31 = sub_A4F8;
    v31[1] = (uint64_t (*)(unsigned __int8 *))v24;
    (*(void (**)(char *, uint64_t))(v29 + 8))(v8, v30);
    (*(void (**)(char *, uint64_t))(v25 + 8))(v26, v27);
    sub_AE58(&qword_14598, &qword_14560);
    v32 = v36;
    sub_D610();
    sub_ACE8((uint64_t)v16, &qword_14560);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v39 + 32))(v51, v32, v41);
  }
  else
  {
    type metadata accessor for HomeScreenDeepLink(0);
    sub_AB04((unint64_t *)&qword_14588, (void (*)(uint64_t))type metadata accessor for HomeScreenDeepLink);
    uint64_t result = sub_D580();
    __break(1u);
  }
  return result;
}

uint64_t sub_65CC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v96 = a2;
  uint64_t v104 = sub_A290(&qword_145C0);
  uint64_t v3 = *(void *)(v104 - 8);
  uint64_t v4 = __chkstk_darwin(v104);
  v102 = (char *)&v90 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __chkstk_darwin(v4);
  v94 = (char *)&v90 - v7;
  __chkstk_darwin(v6);
  v108 = (char *)&v90 - v8;
  uint64_t v9 = sub_A290(&qword_145C8);
  uint64_t v10 = __chkstk_darwin(v9 - 8);
  uint64_t v101 = (uint64_t)&v90 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v107 = (uint64_t)&v90 - v12;
  uint64_t v93 = sub_A290(&qword_145D0);
  uint64_t v92 = *(void *)(v93 - 8);
  __chkstk_darwin(v93);
  uint64_t v14 = (char *)&v90 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_A290(&qword_145D8);
  uint64_t v16 = __chkstk_darwin(v15 - 8);
  uint64_t v100 = (uint64_t)&v90 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __chkstk_darwin(v16);
  uint64_t v20 = (char *)&v90 - v19;
  __chkstk_darwin(v18);
  uint64_t v106 = (uint64_t)&v90 - v21;
  uint64_t v22 = sub_A290(&qword_145E0);
  uint64_t v23 = __chkstk_darwin(v22 - 8);
  uint64_t v98 = (uint64_t)&v90 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __chkstk_darwin(v23);
  uint64_t v99 = (uint64_t)&v90 - v26;
  uint64_t v27 = __chkstk_darwin(v25);
  v95 = (char *)&v90 - v28;
  __chkstk_darwin(v27);
  uint64_t v30 = (char *)&v90 - v29;
  id v97 = self;
  id v31 = [v97 currentDevice];
  unsigned int v32 = objc_msgSend(v31, "sf_isiPad");

  v105 = v30;
  uint64_t v103 = v3;
  if (v32)
  {
    __chkstk_darwin(v33);
    v91 = a1;
    sub_D5C0();
    if (qword_143A0 != -1) {
      swift_once();
    }
    id v34 = (id)qword_14808;
    uint64_t v113 = sub_D5F0();
    uint64_t v114 = v35;
    char v115 = v36 & 1;
    uint64_t v116 = v37;
    sub_A290(&qword_14630);
    sub_AA34();
    uint64_t v38 = (uint64_t)v105;
    sub_D6D0();
    uint64_t v39 = sub_A290(&qword_145E8);
    uint64_t v40 = (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v39 - 8) + 56))(v38, 0, 1, v39);
    a1 = v91;
  }
  else
  {
    uint64_t v41 = sub_A290(&qword_145E8);
    uint64_t v40 = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v41 - 8) + 56))(v30, 1, 1, v41);
  }
  __chkstk_darwin(v40);
  sub_D5C0();
  uint64_t v42 = a1;
  if (qword_143A0 != -1) {
    swift_once();
  }
  id v43 = (id)qword_14808;
  uint64_t v113 = sub_D5F0();
  uint64_t v114 = v44;
  char v115 = v45 & 1;
  uint64_t v116 = v46;
  sub_A290(&qword_145F0);
  uint64_t v47 = sub_4EFC(&qword_145F8);
  uint64_t v48 = sub_4EFC(&qword_14600);
  uint64_t v49 = sub_D5B0();
  uint64_t v50 = sub_AE58(&qword_14608, &qword_14600);
  uint64_t v109 = v48;
  uint64_t v110 = v49;
  uint64_t v111 = v50;
  v112 = &protocol witness table for InlinePickerStyle;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v109 = v47;
  uint64_t v110 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  sub_D6D0();
  if (*v42)
  {
    swift_retain();
    sub_7BFC((uint64_t)&off_10928, (uint64_t)v20);
    swift_release();
    (*(void (**)(char *, uint64_t))(v92 + 8))(v14, v93);
    sub_ABF8((uint64_t)v20, v106, &qword_145D8);
    id v52 = [v97 currentDevice];
    unsigned __int8 v53 = objc_msgSend(v52, "sf_isiPad");

    if (v53)
    {
      __chkstk_darwin(v54);
      sub_D5C0();
      id v55 = (id)qword_14808;
      uint64_t v113 = sub_D5F0();
      uint64_t v114 = v56;
      char v115 = v57 & 1;
      uint64_t v116 = v58;
      sub_A290(&qword_14658);
      sub_AE58(&qword_14660, &qword_14658);
      uint64_t v59 = v107;
      sub_D6D0();
      uint64_t v60 = sub_A290(&qword_14610);
      uint64_t v61 = (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v60 - 8) + 56))(v59, 0, 1, v60);
    }
    else
    {
      uint64_t v62 = sub_A290(&qword_14610);
      uint64_t v61 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v62 - 8) + 56))(v107, 1, 1, v62);
    }
    __chkstk_darwin(v61);
    sub_D5C0();
    id v63 = (id)qword_14808;
    uint64_t v113 = sub_D5F0();
    uint64_t v114 = v64;
    char v115 = v65 & 1;
    uint64_t v116 = v66;
    sub_A290(&qword_14618);
    sub_AE58(&qword_14620, &qword_14618);
    v67 = v94;
    sub_D6D0();
    (*(void (**)(char *, char *, uint64_t))(v103 + 32))(v108, v67, v104);
    id v68 = [v97 currentDevice];
    LODWORD(v67) = objc_msgSend(v68, "sf_isiPhone");

    if (v67)
    {
      __chkstk_darwin(v69);
      sub_D5C0();
      id v70 = (id)qword_14808;
      uint64_t v113 = sub_D5F0();
      uint64_t v114 = v71;
      char v115 = v72 & 1;
      uint64_t v116 = v73;
      sub_A290(&qword_14630);
      sub_AA34();
      uint64_t v74 = (uint64_t)v95;
      sub_D6D0();
      uint64_t v75 = sub_A290(&qword_145E8);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v75 - 8) + 56))(v74, 0, 1, v75);
    }
    else
    {
      uint64_t v76 = sub_A290(&qword_145E8);
      uint64_t v74 = (uint64_t)v95;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v76 - 8) + 56))(v95, 1, 1, v76);
    }
    uint64_t v77 = v99;
    sub_AC84((uint64_t)v105, v99, &qword_145E0);
    uint64_t v78 = v100;
    sub_AC84(v106, v100, &qword_145D8);
    uint64_t v79 = v101;
    sub_AC84(v107, v101, &qword_145C8);
    uint64_t v80 = v103;
    v81 = *(void (**)(char *, char *, uint64_t))(v103 + 16);
    uint64_t v82 = v104;
    v81(v102, v108, v104);
    sub_AC84(v74, v98, &qword_145E0);
    uint64_t v83 = v96;
    sub_AC84(v77, v96, &qword_145E0);
    uint64_t v84 = v74;
    v85 = (int *)sub_A290(&qword_14628);
    sub_AC84(v78, v83 + v85[12], &qword_145D8);
    sub_AC84(v79, v83 + v85[16], &qword_145C8);
    v86 = v102;
    v81((char *)(v83 + v85[20]), v102, v82);
    uint64_t v87 = v98;
    sub_AC84(v98, v83 + v85[24], &qword_145E0);
    sub_ACE8(v84, &qword_145E0);
    v88 = *(void (**)(char *, uint64_t))(v80 + 8);
    v88(v108, v82);
    sub_ACE8(v107, &qword_145C8);
    sub_ACE8(v106, &qword_145D8);
    sub_ACE8((uint64_t)v105, &qword_145E0);
    sub_ACE8(v87, &qword_145E0);
    v88(v86, v82);
    sub_ACE8(v101, &qword_145C8);
    sub_ACE8(v100, &qword_145D8);
    return sub_ACE8(v99, &qword_145E0);
  }
  else
  {
    type metadata accessor for HomeScreenDeepLink(0);
    sub_AB04((unint64_t *)&qword_14588, (void (*)(uint64_t))type metadata accessor for HomeScreenDeepLink);
    uint64_t result = sub_D580();
    __break(1u);
  }
  return result;
}

uint64_t sub_7450@<X0>(uint64_t a1@<X8>)
{
  return sub_8BB8(a1);
}

uint64_t sub_746C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v27 = a1;
  uint64_t v1 = sub_D5B0();
  uint64_t v26 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v3 = (char *)v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_A290(&qword_14600);
  uint64_t v23 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_A290(&qword_145F8);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v24 = v7;
  uint64_t v25 = v8;
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_D5C0();
  uint64_t v21 = v12;
  uint64_t v22 = v11;
  v19[1] = v13;
  uint64_t v20 = v14;
  sub_ABA4();
  sub_AB04(&qword_14670, (void (*)(uint64_t))sub_ABA4);
  uint64_t v15 = (void *)sub_D520();
  swift_getKeyPath();
  sub_D550();
  swift_release();

  uint64_t v32 = v28;
  uint64_t v33 = v29;
  char v34 = v30;
  sub_A290(&qword_146A0);
  sub_AE58(&qword_146A8, &qword_146A0);
  sub_D6A0();
  sub_D5A0();
  uint64_t v16 = sub_AE58(&qword_14608, &qword_14600);
  sub_D640();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v3, v1);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v6, v4);
  uint64_t v28 = v4;
  uint64_t v29 = v1;
  uint64_t v30 = v16;
  id v31 = &protocol witness table for InlinePickerStyle;
  swift_getOpaqueTypeConformance2();
  uint64_t v17 = v24;
  sub_D650();
  return (*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v10, v17);
}

uint64_t sub_7858()
{
  uint64_t v0 = sub_A290(&qword_146B0);
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v4 = &v9[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v2);
  uint64_t v6 = &v9[-v5];
  v9[15] = 1;
  sub_A290(&qword_146B8);
  sub_AD58();
  sub_D530();
  v9[14] = 0;
  sub_D530();
  sub_AE58(&qword_146C8, &qword_146B0);
  sub_D540();
  sub_A290(&qword_146D0);
  sub_D540();
  uint64_t v7 = *(void (**)(unsigned char *, uint64_t))(v1 + 8);
  v7(v4, v0);
  return ((uint64_t (*)(unsigned char *, uint64_t))v7)(v6, v0);
}

uint64_t sub_7A68()
{
  return sub_7ADC();
}

uint64_t sub_7AA0()
{
  return sub_7ADC();
}

uint64_t sub_7ADC()
{
  sub_D5C0();
  if (qword_143A0 != -1) {
    swift_once();
  }
  id v0 = (id)qword_14808;
  uint64_t v1 = sub_D5F0();
  uint64_t v3 = v2;
  char v5 = v4 & 1;
  sub_D670();
  sub_AE04(v1, v3, v5);
  return swift_bridgeObjectRelease();
}

id sub_7BFC@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_A290(&qword_14698);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_A290(&qword_145D8);
  __chkstk_darwin();
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_D490();
  swift_release();
  swift_release();
  uint64_t v19 = v8;
  if v20 != 5 && (sub_9C34(v20, a1))
  {
    uint64_t v11 = v5;
    uint64_t v12 = sub_D690();
LABEL_6:
    uint64_t v14 = v12;
    uint64_t v15 = sub_D6E0();
    uint64_t v20 = v14;
    uint64_t v21 = v15;
    swift_retain();
    swift_retain();
    sub_A290(&qword_14688);
    sub_AE58(&qword_14690, &qword_14688);
    uint64_t v16 = sub_D6C0();
    uint64_t v17 = sub_A290(&qword_145D0);
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v17 - 8) + 16))(v7, v2, v17);
    swift_release();
    swift_release();
    *(void *)&v7[*(int *)(v11 + 36)] = v16;
    sub_AC84((uint64_t)v7, (uint64_t)v10, &qword_14698);
    *(void *)&v10[*(int *)(v19 + 52)] = a1;
    swift_bridgeObjectRetain();
    sub_ACE8((uint64_t)v7, &qword_14698);
    return (id)sub_ABF8((uint64_t)v10, a2, &qword_145D8);
  }
  id result = [self tableCellGroupedBackgroundColor];
  if (result)
  {
    uint64_t v11 = v5;
    uint64_t v12 = sub_D680();
    goto LABEL_6;
  }
  __break(1u);
  return result;
}

id sub_7E9C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_A290(&qword_14680);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_A290(&qword_14618);
  __chkstk_darwin(v17);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_D490();
  swift_release();
  swift_release();
  if v18 != 5 && (sub_9C34(v18, a1))
  {
    uint64_t v10 = a2;
    uint64_t v11 = sub_D690();
LABEL_6:
    uint64_t v13 = v11;
    uint64_t v14 = sub_D6E0();
    uint64_t v18 = v13;
    uint64_t v19 = v14;
    swift_retain();
    swift_retain();
    sub_A290(&qword_14688);
    sub_AE58(&qword_14690, &qword_14688);
    uint64_t v15 = sub_D6C0();
    sub_AC84(v2, (uint64_t)v7, &qword_14630);
    swift_release();
    swift_release();
    *(void *)&v7[*(int *)(v5 + 36)] = v15;
    sub_AC84((uint64_t)v7, (uint64_t)v9, &qword_14680);
    *(void *)&v9[*(int *)(v17 + 52)] = a1;
    swift_bridgeObjectRetain();
    sub_ACE8((uint64_t)v7, &qword_14680);
    return (id)sub_ABF8((uint64_t)v9, v10, &qword_14618);
  }
  id result = [self tableCellGroupedBackgroundColor];
  if (result)
  {
    uint64_t v10 = a2;
    uint64_t v11 = sub_D680();
    goto LABEL_6;
  }
  __break(1u);
  return result;
}

uint64_t sub_810C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v43 = a2;
  uint64_t v3 = sub_A290(&qword_14648);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_A290(&qword_14630);
  uint64_t v8 = __chkstk_darwin(v7 - 8);
  uint64_t v39 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v35 - v10;
  uint64_t v12 = sub_A290(&qword_14618);
  uint64_t v13 = __chkstk_darwin(v12 - 8);
  uint64_t v42 = (uint64_t)&v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v41 = (uint64_t)&v35 - v16;
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v36 = (uint64_t)&v35 - v18;
  uint64_t v19 = __chkstk_darwin(v17);
  uint64_t v38 = (uint64_t)&v35 - v20;
  uint64_t v21 = __chkstk_darwin(v19);
  uint64_t v23 = (char *)&v35 - v22;
  __chkstk_darwin(v21);
  uint64_t v37 = (uint64_t)&v35 - v24;
  sub_D510();
  sub_D6B0();
  sub_AE58(&qword_14640, &qword_14648);
  sub_D670();
  uint64_t v25 = *(void (**)(char *, uint64_t))(v4 + 8);
  uint64_t v40 = v4 + 8;
  v25(v6, v3);
  if (*a1)
  {
    swift_retain();
    sub_7E9C((uint64_t)&off_10950, (uint64_t)v23);
    swift_release();
    sub_ACE8((uint64_t)v11, &qword_14630);
    uint64_t v26 = v37;
    sub_ABF8((uint64_t)v23, v37, &qword_14618);
    sub_D510();
    sub_D6B0();
    uint64_t v27 = (uint64_t)v39;
    sub_D670();
    v25(v6, v3);
    swift_retain();
    uint64_t v28 = v36;
    sub_7E9C((uint64_t)&off_10978, v36);
    swift_release();
    sub_ACE8(v27, &qword_14630);
    uint64_t v29 = v38;
    sub_ABF8(v28, v38, &qword_14618);
    uint64_t v30 = v41;
    sub_AC84(v26, v41, &qword_14618);
    uint64_t v31 = v42;
    sub_AC84(v29, v42, &qword_14618);
    uint64_t v32 = v43;
    sub_AC84(v30, v43, &qword_14618);
    uint64_t v33 = sub_A290(&qword_14678);
    sub_AC84(v31, v32 + *(int *)(v33 + 48), &qword_14618);
    sub_ACE8(v29, &qword_14618);
    sub_ACE8(v26, &qword_14618);
    sub_ACE8(v31, &qword_14618);
    return sub_ACE8(v30, &qword_14618);
  }
  else
  {
    type metadata accessor for HomeScreenDeepLink(0);
    sub_AB04((unint64_t *)&qword_14588, (void (*)(uint64_t))type metadata accessor for HomeScreenDeepLink);
    uint64_t result = sub_D580();
    __break(1u);
  }
  return result;
}

uint64_t sub_8628@<X0>(uint64_t a1@<X8>)
{
  return sub_8BB8(a1);
}

uint64_t sub_8644@<X0>(uint64_t a1@<X8>)
{
  return sub_8BB8(a1);
}

uint64_t sub_8660@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v17 = a2;
  uint64_t v16 = sub_A290(&qword_14648);
  uint64_t v3 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_A290(&qword_14630);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_A290(&qword_14618);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_ABA4();
  sub_AB04(&qword_14670, (void (*)(uint64_t))sub_ABA4);
  uint64_t v12 = (void *)sub_D520();
  swift_getKeyPath();
  sub_D550();
  swift_release();

  sub_D6B0();
  sub_AE58(&qword_14640, &qword_14648);
  uint64_t v13 = v16;
  sub_D670();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v13);
  if (*a1)
  {
    swift_retain();
    sub_7E9C((uint64_t)&off_109A0, (uint64_t)v11);
    swift_release();
    sub_ACE8((uint64_t)v8, &qword_14630);
    return sub_ABF8((uint64_t)v11, v17, &qword_14618);
  }
  else
  {
    type metadata accessor for HomeScreenDeepLink(0);
    sub_AB04((unint64_t *)&qword_14588, (void (*)(uint64_t))type metadata accessor for HomeScreenDeepLink);
    uint64_t result = sub_D580();
    __break(1u);
  }
  return result;
}

uint64_t sub_899C@<X0>(uint64_t a1@<X8>)
{
  return sub_8BB8(a1);
}

uint64_t sub_89B8@<X0>(uint64_t a1@<X3>, uint64_t a2@<X4>, uint64_t a3@<X8>)
{
  v9[1] = a1;
  v9[2] = a2;
  v9[0] = a3;
  uint64_t v3 = sub_A290(&qword_14648);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_ABA4();
  sub_AB04(&qword_14670, (void (*)(uint64_t))sub_ABA4);
  uint64_t v7 = (void *)sub_D520();
  swift_getKeyPath();
  sub_D550();
  swift_release();

  sub_D6B0();
  sub_AE58(&qword_14640, &qword_14648);
  sub_D670();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_8B9C@<X0>(uint64_t a1@<X8>)
{
  return sub_8BB8(a1);
}

uint64_t sub_8BB8@<X0>(uint64_t a1@<X8>)
{
  sub_D5C0();
  if (qword_143A0 != -1) {
    swift_once();
  }
  id v2 = (id)qword_14808;
  uint64_t result = sub_D5F0();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5 & 1;
  *(void *)(a1 + 24) = v6;
  return result;
}

uint64_t sub_8C80(unsigned __int8 *a1, void *a2)
{
  uint64_t v4 = type metadata accessor for HomeScreenSettingsList(0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v4 - 8);
  uint64_t v7 = &v18[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = sub_A290(&qword_145A0);
  uint64_t result = __chkstk_darwin(v8 - 8);
  uint64_t v11 = &v18[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  int v12 = *a1;
  if (v12 != 5)
  {
    if (*a2)
    {
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_D490();
      swift_release();
      swift_release();
      uint64_t result = swift_release();
      if (v18[15] == 5)
      {
        v18[14] = v12;
        sub_D6F0();
        sub_A5CC();
        sub_D560();
        uint64_t v13 = sub_D7B0();
        (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v11, 1, 1, v13);
        sub_9FB8((uint64_t)a2, (uint64_t)&v18[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)]);
        sub_D790();
        uint64_t v14 = sub_D780();
        unint64_t v15 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
        uint64_t v16 = v15 + v6;
        uint64_t v17 = swift_allocObject();
        *(void *)(v17 + 16) = v14;
        *(void *)(v17 + 24) = &protocol witness table for MainActor;
        sub_A1AC((uint64_t)v7, v17 + v15);
        *(unsigned char *)(v17 + v16) = v12;
        sub_95F8((uint64_t)v11, (uint64_t)&unk_145B8, v17);
        return swift_release();
      }
    }
    else
    {
      type metadata accessor for HomeScreenDeepLink(0);
      sub_AB04((unint64_t *)&qword_14588, (void (*)(uint64_t))type metadata accessor for HomeScreenDeepLink);
      uint64_t result = sub_D580();
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_8F50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(unsigned char *)(v5 + 90) = a5;
  *(void *)(v5 + 16) = a4;
  sub_D790();
  *(void *)(v5 + 24) = sub_D780();
  uint64_t v7 = sub_D770();
  *(void *)(v5 + 32) = v7;
  *(void *)(v5 + 40) = v6;
  return _swift_task_switch(sub_8FEC, v7, v6);
}

uint64_t sub_8FEC()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v1;
  void *v1 = v0;
  v1[1] = sub_9084;
  return static Task<>.sleep(nanoseconds:)(1000000000);
}

uint64_t sub_9084()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 56) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 40);
  uint64_t v4 = *(void *)(v2 + 32);
  if (v0) {
    uint64_t v5 = sub_9530;
  }
  else {
    uint64_t v5 = sub_91C0;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_91C0()
{
  uint64_t v1 = *(uint64_t **)(v0 + 16);
  uint64_t v2 = *v1;
  *(void *)(v0 + 64) = *v1;
  if (v2)
  {
    char v3 = *(unsigned char *)(v0 + 90);
    swift_getKeyPath();
    swift_getKeyPath();
    *(unsigned char *)(v0 + 88) = v3;
    swift_retain();
    sub_D4A0();
    uint64_t v4 = (void *)swift_task_alloc();
    *(void *)(v0 + 72) = v4;
    *uint64_t v4 = v0;
    v4[1] = sub_933C;
    return static Task<>.sleep(nanoseconds:)(500000000);
  }
  else
  {
    type metadata accessor for HomeScreenDeepLink(0);
    sub_AB04((unint64_t *)&qword_14588, (void (*)(uint64_t))type metadata accessor for HomeScreenDeepLink);
    return sub_D580();
  }
}

uint64_t sub_933C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 80) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 40);
  uint64_t v4 = *(void *)(v2 + 32);
  if (v0) {
    uint64_t v5 = sub_9594;
  }
  else {
    uint64_t v5 = sub_9478;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_9478()
{
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  *(unsigned char *)(v0 + 89) = 5;
  swift_retain();
  sub_D4A0();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_9530()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_9594()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_95F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_D7B0();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_D7A0();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_ACE8(a1, &qword_145A0);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_D770();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_9780@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_A290(&qword_146D8);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for HomeScreenDeepLink(0);
  sub_AB04((unint64_t *)&qword_14588, (void (*)(uint64_t))type metadata accessor for HomeScreenDeepLink);
  *(void *)a1 = sub_D590();
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = sub_5E88;
  *(void *)(a1 + 24) = 0;
  *(unsigned char *)(a1 + 32) = 0;
  if (qword_143B0 != -1) {
    swift_once();
  }
  id v6 = (id)qword_14818;
  *(void *)(a1 + 40) = sub_D500();
  id v7 = v6;
  *(void *)(a1 + 48) = sub_D500();
  id v8 = [self currentDevice];
  unsigned int v9 = objc_msgSend(v8, "sf_isiPad");

  if (v9) {
    uint64_t v10 = 1684107369;
  }
  else {
    uint64_t v10 = 0x656E6F687069;
  }
  if (v9) {
    uint64_t v11 = (void *)0xE400000000000000;
  }
  else {
    uint64_t v11 = (void *)0xE600000000000000;
  }
  uint64_t v12 = type metadata accessor for HomeScreenSettingsList(0);
  uint64_t v13 = (unint64_t *)(a1 + *(int *)(v12 + 32));
  unint64_t v20 = 0xD00000000000001FLL;
  unint64_t v21 = 0x800000000000E4A0;
  v22._countAndFlagsBits = v10;
  v22._object = v11;
  sub_D750(v22);
  swift_bridgeObjectRelease();
  unint64_t v14 = v21;
  *uint64_t v13 = v20;
  v13[1] = v14;
  uint64_t v15 = enum case for SettingsEventImage.graphicIcon(_:);
  uint64_t v16 = sub_D700();
  (*(void (**)(unint64_t *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 104))(v13, v15, v16);
  sub_D3F0();
  sub_D420();
  uint64_t v17 = sub_D430();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 48))(v4, 1, v17);
  if (result != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v18 + 32))(a1 + *(int *)(v12 + 40), v4, v17);
  }
  __break(1u);
  return result;
}

uint64_t sub_9AC8()
{
  return sub_D660();
}

uint64_t sub_9AE4@<X0>(uint64_t a1@<X0>, uint64_t (**a2)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)@<X8>)
{
  uint64_t v4 = *(void *)(a1 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  __chkstk_darwin(a1 - 8);
  sub_9FB8(v2, (uint64_t)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v6 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = swift_allocObject();
  uint64_t result = sub_A1AC((uint64_t)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v7 + v6);
  *a2 = sub_A210;
  a2[1] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))v7;
  return result;
}

unint64_t sub_9BD4()
{
  unint64_t result = qword_14540;
  if (!qword_14540)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_14540);
  }
  return result;
}

void *sub_9C28()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_9C34(char a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = 0;
    while (2)
    {
      uint64_t v6 = a2 + v5++;
      unint64_t v7 = 0xD000000000000013;
      unint64_t v8 = 0x800000000000E1A0;
      switch(*(unsigned char *)(v6 + 32))
      {
        case 1:
          unint64_t v7 = 0xD000000000000015;
          unint64_t v8 = 0x800000000000E1C0;
          break;
        case 2:
          unint64_t v8 = 0x800000000000E1E0;
          unint64_t v7 = 0xD000000000000010;
          break;
        case 3:
          unint64_t v7 = 0xD000000000000022;
          unint64_t v8 = 0x800000000000E200;
          break;
        case 4:
          unint64_t v7 = 0xD00000000000001ELL;
          unint64_t v8 = 0x800000000000E230;
          break;
        default:
          break;
      }
      unint64_t v9 = 0xD000000000000013;
      unint64_t v10 = 0x800000000000E1A0;
      switch(a1)
      {
        case 1:
          unint64_t v10 = 0x800000000000E1C0;
          if (v7 == 0xD000000000000015) {
            goto LABEL_15;
          }
          goto LABEL_16;
        case 2:
          unint64_t v10 = 0x800000000000E1E0;
          if (v7 != 0xD000000000000010) {
            goto LABEL_16;
          }
          goto LABEL_15;
        case 3:
          unint64_t v9 = 0xD000000000000022;
          unint64_t v10 = 0x800000000000E200;
          goto LABEL_14;
        case 4:
          unint64_t v10 = 0x800000000000E230;
          if (v7 != 0xD00000000000001ELL) {
            goto LABEL_16;
          }
          goto LABEL_15;
        default:
LABEL_14:
          if (v7 != v9) {
            goto LABEL_16;
          }
LABEL_15:
          if (v8 == v10)
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease_n();
            return 1;
          }
LABEL_16:
          char v11 = sub_D810();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v11)
          {
            swift_bridgeObjectRelease();
            return 1;
          }
          if (v2 != v5) {
            continue;
          }
          swift_bridgeObjectRelease();
          break;
      }
      break;
    }
  }
  return 0;
}

uint64_t sub_9E78@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_D490();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_9EF8()
{
  return sub_D4A0();
}

uint64_t sub_9F6C(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_10890;
  v6._object = a2;
  unint64_t v4 = sub_D800(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 5) {
    return 5;
  }
  else {
    return v4;
  }
}

uint64_t sub_9FB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for HomeScreenSettingsList(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_A01C()
{
  uint64_t v1 = (int *)(type metadata accessor for HomeScreenSettingsList(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  swift_release();
  sub_53E4(*(void *)(v6 + 16), *(void *)(v6 + 24), *(unsigned char *)(v6 + 32));
  swift_release();
  swift_release();
  uint64_t v7 = v6 + v1[10];
  uint64_t v8 = sub_D700();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  uint64_t v9 = v6 + v1[11];
  uint64_t v10 = sub_D400();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  uint64_t v11 = v6 + v1[12];
  uint64_t v12 = sub_D430();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);

  return _swift_deallocObject(v0, v4, v5);
}

uint64_t sub_A1AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for HomeScreenSettingsList(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_A210@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for HomeScreenSettingsList(0) - 8);
  uint64_t v6 = (void *)(v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80)));

  return sub_5EC0(a1, v6, a2);
}

uint64_t sub_A290(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_A2D4@<X0>(uint64_t a1@<X8>)
{
  return sub_65CC(*(void **)(v1 + 16), a1);
}

uint64_t sub_A2DC()
{
  uint64_t v1 = (int *)(type metadata accessor for HomeScreenSettingsList(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  uint64_t v5 = sub_D570();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = (v3 + v4 + v7) & ~v7;
  uint64_t v9 = v8 + *(void *)(v6 + 64);
  uint64_t v10 = v2 | v7 | 7;
  uint64_t v11 = v0 + v3;
  swift_release();
  sub_53E4(*(void *)(v11 + 16), *(void *)(v11 + 24), *(unsigned char *)(v11 + 32));
  swift_release();
  swift_release();
  uint64_t v12 = v0 + v3 + v1[10];
  uint64_t v13 = sub_D700();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
  uint64_t v14 = v11 + v1[11];
  uint64_t v15 = sub_D400();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
  uint64_t v16 = v11 + v1[12];
  uint64_t v17 = sub_D430();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v17 - 8) + 8))(v16, v17);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v8, v5);

  return _swift_deallocObject(v0, v9, v10);
}

uint64_t sub_A4F8(unsigned __int8 *a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for HomeScreenSettingsList(0) - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  sub_D570();

  return sub_8C80(a1, (void *)(v1 + v4));
}

unint64_t sub_A5CC()
{
  unint64_t result = qword_145A8;
  if (!qword_145A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_145A8);
  }
  return result;
}

uint64_t sub_A620()
{
  uint64_t v1 = (int *)(type metadata accessor for HomeScreenSettingsList(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = v2 | 7;
  uint64_t v5 = *(void *)(*(void *)v1 + 64) + v3 + 1;
  swift_unknownObjectRelease();
  uint64_t v6 = v0 + v3;
  swift_release();
  sub_53E4(*(void *)(v6 + 16), *(void *)(v6 + 24), *(unsigned char *)(v6 + 32));
  swift_release();
  swift_release();
  uint64_t v7 = v0 + v3 + v1[10];
  uint64_t v8 = sub_D700();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  uint64_t v9 = v6 + v1[11];
  uint64_t v10 = sub_D400();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  uint64_t v11 = v6 + v1[12];
  uint64_t v12 = sub_D430();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);

  return _swift_deallocObject(v0, v5, v4);
}

uint64_t sub_A7BC(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for HomeScreenSettingsList(0) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v1 + 16);
  uint64_t v7 = *(void *)(v1 + 24);
  uint64_t v8 = v1 + v5;
  char v9 = *(unsigned char *)(v1 + v5 + *(void *)(v4 + 64));
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = sub_A8D8;
  return sub_8F50(a1, v6, v7, v8, v9);
}

uint64_t sub_A8D8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_A9CC@<X0>(uint64_t a1@<X8>)
{
  return sub_746C(a1);
}

uint64_t sub_A9D4@<X0>(uint64_t a1@<X8>)
{
  return sub_8660(*(void **)(v1 + 16), a1);
}

uint64_t sub_A9DC@<X0>(uint64_t a1@<X8>)
{
  return sub_89B8(0x4F50535F574F4853, 0xEE00544847494C54, a1);
}

unint64_t sub_AA34()
{
  unint64_t result = qword_14638;
  if (!qword_14638)
  {
    sub_4EFC(&qword_14630);
    sub_AE58(&qword_14640, &qword_14648);
    sub_AB04(&qword_14650, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_14638);
  }
  return result;
}

uint64_t sub_AB04(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_AB4C@<X0>(uint64_t a1@<X8>)
{
  return sub_810C(*(void **)(v1 + 16), a1);
}

uint64_t sub_AB54@<X0>(uint64_t a1@<X8>)
{
  return sub_89B8(0xD000000000000011, 0x800000000000E2F0, a1);
}

unint64_t sub_ABA4()
{
  unint64_t result = qword_14668;
  if (!qword_14668)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_14668);
  }
  return result;
}

const char *sub_ABE4()
{
  return "isLargeIconLayoutEnabled";
}

uint64_t sub_ABF8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_A290(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

const char *sub_AC5C()
{
  return "showsHomeScreenSearchAffordance";
}

const char *sub_AC70()
{
  return "showsBadgesInAppLibrary";
}

uint64_t sub_AC84(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_A290(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_ACE8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_A290(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

const char *sub_AD44()
{
  return "addsNewIconsToHomeScreen";
}

unint64_t sub_AD58()
{
  unint64_t result = qword_146C0;
  if (!qword_146C0)
  {
    sub_4EFC(&qword_146B8);
    sub_AB04(&qword_14650, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_146C0);
  }
  return result;
}

uint64_t sub_AE04(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_AE1C()
{
  return sub_AE58(&qword_146E0, &qword_146E8);
}

uint64_t sub_AE58(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_4EFC(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

id sub_AEDC()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for FindClass()
{
  return self;
}

id sub_AF38()
{
  type metadata accessor for FindClass();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = [self bundleForClass:ObjCClassFromMetadata];
  qword_14808 = (uint64_t)result;
  return result;
}

id sub_AF90@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = [*a1 isLargeIconLayoutEnabled];
  *a2 = (_BYTE)result;
  return result;
}

id sub_AFC4(unsigned __int8 *a1, id *a2)
{
  return [*a2 setLargeIconLayoutEnabled:*a1];
}

id sub_AFD8@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = [*a1 addsNewIconsToHomeScreen];
  *a2 = (_BYTE)result;
  return result;
}

id sub_B00C(unsigned __int8 *a1, id *a2)
{
  return [*a2 setAddsNewIconsToHomeScreen:*a1];
}

id sub_B020@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = [*a1 showsBadgesInAppLibrary];
  *a2 = (_BYTE)result;
  return result;
}

id sub_B054(unsigned __int8 *a1, id *a2)
{
  return [*a2 setShowsBadgesInAppLibrary:*a1];
}

id sub_B068@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = [*a1 showsHomeScreenSearchAffordance];
  *a2 = (_BYTE)result;
  return result;
}

id sub_B09C(unsigned __int8 *a1, id *a2)
{
  return [*a2 setShowsHomeScreenSearchAffordance:*a1];
}

uint64_t SBSHomeScreenService.objectWillChange.getter()
{
  uint64_t v0 = sub_A290(&qword_14718);
  uint64_t v79 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  objc_super v2 = (char *)&v51 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v78 = sub_A290(&qword_14720);
  uint64_t v80 = *(void *)(v78 - 8);
  __chkstk_darwin(v78);
  uint64_t v4 = (char *)&v51 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_A290(&qword_14728);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v51 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = sub_A290(&qword_14730);
  uint64_t v81 = *(void *)(v68 - 8);
  __chkstk_darwin(v68);
  v67 = (char *)&v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = sub_A290(&qword_14738);
  uint64_t v57 = *(void *)(v56 - 8);
  __chkstk_darwin(v56);
  id v55 = (char *)&v51 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_A290(&qword_14740);
  uint64_t v66 = swift_allocObject();
  *(_OWORD *)(v66 + 16) = xmmword_DFE0;
  swift_getKeyPath();
  sub_D410();
  swift_release();
  LOBYTE(v82) = 2;
  uint64_t v62 = sub_A290(&qword_14748);
  uint64_t v65 = sub_AE58(&qword_14750, &qword_14728);
  id v63 = sub_BC14;
  sub_D4F0();
  uint64_t v11 = sub_AE58(&qword_14758, &qword_14718);
  uint64_t v71 = sub_BC30;
  uint64_t v60 = v0;
  uint64_t v58 = v11;
  sub_D4D0();
  uint64_t v61 = *(void (**)(char *, uint64_t))(v79 + 8);
  v79 += 8;
  v61(v2, v0);
  uint64_t v70 = sub_AE58(&qword_14760, &qword_14720);
  uint64_t v12 = v78;
  uint64_t v59 = v4;
  uint64_t v13 = sub_D4C0();
  uint64_t v14 = *(void (**)(char *, uint64_t))(v80 + 8);
  v80 += 8;
  uint64_t v69 = v14;
  v14(v4, v12);
  uint64_t v64 = *(void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v77 = v6 + 8;
  v64(v8, v5);
  uint64_t v82 = v13;
  uint64_t v76 = sub_A290(&qword_14768);
  uint64_t v54 = &protocol conformance descriptor for AnyPublisher<A, B>;
  uint64_t v75 = sub_AE58(&qword_14770, &qword_14768);
  uint64_t v74 = (char *)&type metadata for () + 8;
  uint64_t v15 = v67;
  sub_D4E0();
  swift_release();
  uint64_t v73 = sub_AE58(&qword_14778, &qword_14730);
  uint64_t v16 = v68;
  uint64_t v17 = sub_D4C0();
  uint64_t v18 = *(void (**)(char *, uint64_t))(v81 + 8);
  v81 += 8;
  char v72 = v18;
  v18(v15, v16);
  uint64_t v19 = v66;
  *(void *)(v66 + 32) = v17;
  swift_getKeyPath();
  unint64_t v20 = v8;
  sub_D410();
  swift_release();
  LOBYTE(v82) = 2;
  unsigned __int8 v53 = v2;
  sub_D4F0();
  unint64_t v21 = v59;
  uint64_t v22 = v60;
  sub_D4D0();
  uint64_t v23 = v61;
  v61(v2, v22);
  uint64_t v24 = v78;
  uint64_t v25 = sub_D4C0();
  v69(v21, v24);
  uint64_t v26 = v5;
  v64(v20, v5);
  uint64_t v82 = v25;
  uint64_t v27 = v67;
  sub_D4E0();
  swift_release();
  uint64_t v28 = v68;
  uint64_t v29 = sub_D4C0();
  v72(v27, v28);
  *(void *)(v19 + 40) = v29;
  swift_getKeyPath();
  sub_D410();
  swift_release();
  LOBYTE(v82) = 2;
  uint64_t v30 = v53;
  uint64_t v52 = v26;
  uint64_t v31 = v20;
  sub_D4F0();
  uint64_t v32 = v59;
  uint64_t v33 = v60;
  sub_D4D0();
  v23(v30, v33);
  uint64_t v34 = v78;
  uint64_t v35 = sub_D4C0();
  uint64_t v36 = v32;
  v69(v32, v34);
  uint64_t v37 = v64;
  v64(v31, v26);
  uint64_t v82 = v35;
  uint64_t v38 = v67;
  sub_D4E0();
  swift_release();
  uint64_t v39 = v68;
  uint64_t v40 = sub_D4C0();
  v72(v38, v39);
  *(void *)(v66 + 48) = v40;
  swift_getKeyPath();
  uint64_t v41 = v31;
  sub_D410();
  swift_release();
  LOBYTE(v82) = 2;
  uint64_t v42 = v52;
  sub_D4F0();
  sub_D4D0();
  v61(v30, v33);
  uint64_t v43 = v78;
  uint64_t v44 = sub_D4C0();
  v69(v36, v43);
  v37(v41, v42);
  uint64_t v82 = v44;
  sub_D4E0();
  swift_release();
  uint64_t v45 = sub_D4C0();
  v72(v38, v39);
  uint64_t v46 = v66;
  *(void *)(v66 + 56) = v45;
  uint64_t v82 = v46;
  sub_D760();
  sub_A290(&qword_14780);
  sub_AE58(&qword_14788, &qword_14780);
  uint64_t v47 = v55;
  sub_D440();
  sub_AE58(&qword_14790, &qword_14738);
  uint64_t v48 = v56;
  uint64_t v49 = sub_D4C0();
  (*(void (**)(char *, uint64_t))(v57 + 8))(v47, v48);
  return v49;
}

id sub_BBA4@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = [*a1 addsNewIconsToHomeScreen];
  *a2 = (_BYTE)result;
  return result;
}

id sub_BBD8(unsigned __int8 *a1, id *a2)
{
  return [*a2 setAddsNewIconsToHomeScreen:*a1];
}

uint64_t sub_BBEC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = SBSHomeScreenService.objectWillChange.getter();
  *a1 = result;
  return result;
}

unsigned char *sub_BC14@<X0>(unsigned char *result@<X0>, char *a2@<X1>, char *a3@<X8>)
{
  if (*result == 2) {
    char v3 = *a2;
  }
  else {
    char v3 = 2;
  }
  *a3 = v3;
  return result;
}

unsigned char *sub_BC30@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X8>)
{
  *a2 = *result;
  return result;
}

id sub_BC3C@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = [*a1 showsBadgesInAppLibrary];
  *a2 = (_BYTE)result;
  return result;
}

id sub_BC70(unsigned __int8 *a1, id *a2)
{
  return [*a2 setShowsBadgesInAppLibrary:*a1];
}

id sub_BC84@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = [*a1 showsHomeScreenSearchAffordance];
  *a2 = (_BYTE)result;
  return result;
}

id sub_BCB8(unsigned __int8 *a1, id *a2)
{
  return [*a2 setShowsHomeScreenSearchAffordance:*a1];
}

id sub_BCCC@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = [*a1 isLargeIconLayoutEnabled];
  *a2 = (_BYTE)result;
  return result;
}

id sub_BD00(unsigned __int8 *a1, id *a2)
{
  return [*a2 setLargeIconLayoutEnabled:*a1];
}

uint64_t sub_BD14()
{
  return sub_AE58(&qword_14788, &qword_14780);
}

uint64_t sub_BD50()
{
  type metadata accessor for HomeScreenDeepLink(0);
  uint64_t v0 = swift_allocObject();
  sub_A290((uint64_t *)&unk_14408);
  sub_D470();
  uint64_t result = sub_D470();
  objc_super v2 = (void *)(v0 + OBJC_IVAR____TtC18HomeScreenSettings18HomeScreenDeepLink_referrer);
  *objc_super v2 = 0;
  v2[1] = 0;
  qword_14810 = v0;
  return result;
}

Swift::Void __swiftcall HomeScreenSettings.viewDidLoad()()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for HomeScreenSettingsList(0);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_A290(&qword_14798);
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v29 - v9;
  v29.receiver = v0;
  v29.super_class = (Class)HomeScreenSettings;
  objc_msgSendSuper2(&v29, "viewDidLoad");
  sub_9780((uint64_t)v4);
  if (qword_143A8 != -1) {
    swift_once();
  }
  uint64_t v11 = qword_14810;
  type metadata accessor for HomeScreenDeepLink(0);
  sub_C1B0();
  swift_retain();
  uint64_t v12 = sub_D450();
  sub_9FB8((uint64_t)v4, (uint64_t)v10);
  uint64_t v13 = (uint64_t *)&v10[*(int *)(v5 + 36)];
  *uint64_t v13 = v12;
  v13[1] = v11;
  sub_C208((uint64_t)v4);
  sub_C264((uint64_t)v10, (uint64_t)v8);
  id v14 = objc_allocWithZone((Class)sub_A290(&qword_147A0));
  uint64_t v15 = (void *)sub_D5D0();
  if (qword_143A0 != -1) {
    swift_once();
  }
  id v16 = (id)qword_14808;
  NSString v17 = sub_D720();
  NSString v18 = [v16 localizedStringForKey:v17 value:0 table:0];

  if (!v18)
  {
    sub_D730();
    NSString v18 = sub_D720();
    swift_bridgeObjectRelease();
  }
  [v1 setTitle:v18];

  id v19 = [v15 view];
  if (v19)
  {
    unint64_t v20 = v19;
    id v21 = [v1 view];
    if (v21)
    {
      uint64_t v22 = v21;
      [v21 addSubview:v20];

      id v23 = [v1 view];
      if (v23)
      {
        uint64_t v24 = v23;
        [v23 bounds];
        double v26 = v25;
        double v28 = v27;

        objc_msgSend(v20, "setFrame:", 0.0, 0.0, v26, v28);
        [v20 setAutoresizingMask:18];
        [v1 addChildViewController:v15];
        [v15 didMoveToParentViewController:v1];

        sub_ACE8((uint64_t)v10, &qword_14798);
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
  else
  {
    sub_ACE8((uint64_t)v10, &qword_14798);
  }
}

unint64_t sub_C1B0()
{
  unint64_t result = qword_14588;
  if (!qword_14588)
  {
    type metadata accessor for HomeScreenDeepLink(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_14588);
  }
  return result;
}

uint64_t sub_C208(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for HomeScreenSettingsList(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_C264(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_A290(&qword_14798);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

Swift::Void __swiftcall HomeScreenSettings.handleURL(_:)(Swift::OpaquePointer a1)
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v3 = sub_A290(&qword_145A0);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = 1752457584;
  uint64_t v15 = (void *)0xE400000000000000;
  sub_D7F0();
  if (*((void *)a1._rawValue + 2) && (unint64_t v6 = sub_CF20((uint64_t)v16), (v7 & 1) != 0))
  {
    sub_D188(*((void *)a1._rawValue + 7) + 32 * v6, (uint64_t)&v17);
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
  }
  sub_CF64((uint64_t)v16);
  if (*((void *)&v18 + 1))
  {
    if (swift_dynamicCast())
    {
      char v8 = sub_9F6C(v14, v15);
      if (v8 != 5)
      {
        char v9 = v8;
        uint64_t v10 = sub_D7B0();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v5, 1, 1, v10);
        sub_D790();
        swift_bridgeObjectRetain();
        uint64_t v11 = sub_D780();
        uint64_t v12 = swift_allocObject();
        *(void *)(v12 + 16) = v11;
        *(void *)(v12 + 24) = &protocol witness table for MainActor;
        *(unsigned char *)(v12 + 32) = v9;
        *(Swift::OpaquePointer *)(v12 + 40) = a1;
        *(void *)(v12 + 48) = ObjectType;
        sub_C7B4((uint64_t)v5, (uint64_t)&unk_147B8, v12);
        swift_release();
      }
    }
  }
  else
  {
    sub_ACE8((uint64_t)&v17, &qword_147A8);
  }
}

uint64_t sub_C50C(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  *(void *)(v5 + 104) = a5;
  *(unsigned char *)(v5 + 120) = a4;
  sub_D790();
  *(void *)(v5 + 112) = sub_D780();
  uint64_t v7 = sub_D770();
  return _swift_task_switch(sub_C5A8, v7, v6);
}

uint64_t sub_C5A8()
{
  swift_release();
  if (qword_143A8 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 104);
  char v2 = *(unsigned char *)(v0 + 120);
  swift_getKeyPath();
  swift_getKeyPath();
  *(unsigned char *)(v0 + 16) = v2;
  swift_retain();
  sub_D4A0();
  uint64_t v3 = qword_14810;
  *(void *)(v0 + 88) = 0x7265727265666572;
  *(void *)(v0 + 96) = 0xE800000000000000;
  swift_retain();
  sub_D7F0();
  if (*(void *)(v1 + 16) && (unint64_t v4 = sub_CF20(v0 + 16), (v5 & 1) != 0))
  {
    sub_D188(*(void *)(*(void *)(v0 + 104) + 56) + 32 * v4, v0 + 56);
  }
  else
  {
    *(_OWORD *)(v0 + 56) = 0u;
    *(_OWORD *)(v0 + 72) = 0u;
  }
  sub_CF64(v0 + 16);
  if (*(void *)(v0 + 80))
  {
    int v6 = swift_dynamicCast();
    uint64_t v7 = *(void *)(v0 + 88);
    uint64_t v8 = *(void *)(v0 + 96);
    if (!v6)
    {
      uint64_t v7 = 0;
      uint64_t v8 = 0;
    }
  }
  else
  {
    sub_ACE8(v0 + 56, &qword_147A8);
    uint64_t v7 = 0;
    uint64_t v8 = 0;
  }
  uint64_t v9 = (void *)(v3 + OBJC_IVAR____TtC18HomeScreenSettings18HomeScreenDeepLink_referrer);
  *uint64_t v9 = v7;
  v9[1] = v8;
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v10 = *(uint64_t (**)(void))(v0 + 8);
  return v10();
}

uint64_t sub_C7B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_D7B0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_D7A0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_ACE8(a1, &qword_145A0);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_D770();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

void __swiftcall HomeScreenSettings.init(nibName:bundle:)(HomeScreenSettings *__return_ptr retstr, Swift::String_optional nibName, NSBundle_optional bundle)
{
  Class isa = bundle.value.super.isa;
  if (nibName.value._object)
  {
    NSString v4 = sub_D720();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v4 = 0;
  }
  [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithNibName:v4 bundle:isa];
}

id HomeScreenSettings.init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    NSString v5 = sub_D720();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)HomeScreenSettings;
  id v6 = objc_msgSendSuper2(&v8, "initWithNibName:bundle:", v5, a3);

  return v6;
}

void __swiftcall HomeScreenSettings.init(coder:)(HomeScreenSettings_optional *__return_ptr retstr, NSCoder coder)
{
}

id HomeScreenSettings.init(coder:)(void *a1)
{
  v4.super_class = (Class)HomeScreenSettings;
  id v2 = objc_msgSendSuper2(&v4, "initWithCoder:", a1);

  return v2;
}

uint64_t sub_CC58@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_D490();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_CCD8()
{
  return sub_D4A0();
}

uint64_t sub_CD4C(uint64_t a1, int *a2)
{
  id v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  objc_super v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *objc_super v4 = v2;
  v4[1] = sub_CE28;
  return v6(a1);
}

uint64_t sub_CE28()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

unint64_t sub_CF20(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_D7D0(*(void *)(v2 + 40));

  return sub_CFB8(a1, v4);
}

uint64_t sub_CF64(uint64_t a1)
{
  return a1;
}

unint64_t sub_CFB8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_D31C(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_D7E0();
      sub_CF64((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_D080()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_D0C0(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 40);
  char v7 = *(unsigned char *)(v1 + 32);
  objc_super v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_A8D8;
  return sub_C50C(a1, v4, v5, v7, v6);
}

uint64_t sub_D188(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t type metadata accessor for HomeScreenSettings()
{
  unint64_t result = qword_147E8;
  if (!qword_147E8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_147E8);
  }
  return result;
}

uint64_t sub_D224()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_D25C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_A8D8;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_147F0 + dword_147F0);
  return v6(a1, v4);
}

uint64_t sub_D31C(uint64_t a1, uint64_t a2)
{
  return a2;
}

void sub_D378()
{
  id v0 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v1 = sub_D720();
  id v2 = [v0 initWithSuiteName:v1];

  if (v2)
  {
    qword_14818 = (uint64_t)v2;
  }
  else
  {
    __break(1u);
    sub_D3F0();
  }
}

uint64_t sub_D3F0()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_D400()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_D410()
{
  return _KeyValueCodingAndObservingPublishing<>.publisher<A>(for:options:)();
}

uint64_t sub_D420()
{
  return URL.init(string:)();
}

uint64_t sub_D430()
{
  return type metadata accessor for URL();
}

uint64_t sub_D440()
{
  return Publishers.MergeMany.init(_:)();
}

uint64_t sub_D450()
{
  return static ObservableObject.environmentStore.getter();
}

uint64_t sub_D460()
{
  return ObservableObject<>.objectWillChange.getter();
}

uint64_t sub_D470()
{
  return Published.init(initialValue:)();
}

uint64_t sub_D480()
{
  return Published.projectedValue.getter();
}

uint64_t sub_D490()
{
  return static Published.subscript.getter();
}

uint64_t sub_D4A0()
{
  return static Published.subscript.setter();
}

uint64_t sub_D4B0()
{
  return type metadata accessor for Published();
}

uint64_t sub_D4C0()
{
  return Publisher.eraseToAnyPublisher()();
}

uint64_t sub_D4D0()
{
  return Publisher.compactMap<A>(_:)();
}

uint64_t sub_D4E0()
{
  return Publisher.map<A>(_:)();
}

uint64_t sub_D4F0()
{
  return Publisher.scan<A>(_:_:)();
}

uint64_t sub_D500()
{
  return AppStorage.init<A>(wrappedValue:_:store:)();
}

uint64_t sub_D510()
{
  return AppStorage.projectedValue.getter();
}

uint64_t sub_D520()
{
  return StateObject.projectedValue.getter();
}

uint64_t sub_D530()
{
  return PickerOption.init(value:content:)();
}

uint64_t sub_D540()
{
  return dispatch thunk of PickerContent._identifiedView.getter();
}

uint64_t sub_D550()
{
  return ObservedObject.Wrapper.subscript.getter();
}

uint64_t sub_D560()
{
  return ScrollViewProxy.scrollTo<A>(_:anchor:)();
}

uint64_t sub_D570()
{
  return type metadata accessor for ScrollViewProxy();
}

uint64_t sub_D580()
{
  return EnvironmentObject.error()();
}

uint64_t sub_D590()
{
  return EnvironmentObject.init()();
}

uint64_t sub_D5A0()
{
  return InlinePickerStyle.init()();
}

uint64_t sub_D5B0()
{
  return type metadata accessor for InlinePickerStyle();
}

uint64_t sub_D5C0()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_D5D0()
{
  return UIHostingController.init(rootView:)();
}

uint64_t sub_D5E0()
{
  return List<>.init(content:)();
}

uint64_t sub_D5F0()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t sub_D600()
{
  return View.settingsListAppearance()();
}

uint64_t sub_D610()
{
  return View.emitNavigationEventOnAppearForSystemSetting(icon:title:localizedNavigationComponents:deepLink:)();
}

uint64_t sub_D620()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_D630()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_D640()
{
  return View.pickerStyle<A>(_:)();
}

uint64_t sub_D650()
{
  return View.labelsHidden()();
}

uint64_t sub_D660()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_D670()
{
  return View.accessibilityIdentifier(_:)();
}

uint64_t sub_D680()
{
  return Color.init(uiColor:)();
}

uint64_t sub_D690()
{
  return static Color.emphasizedGroupBackground.getter();
}

uint64_t sub_D6A0()
{
  return Picker<>.init<A>(_:selection:content:)();
}

uint64_t sub_D6B0()
{
  return Toggle.init(isOn:label:)();
}

uint64_t sub_D6C0()
{
  return AnyView.init<A>(_:)();
}

uint64_t sub_D6D0()
{
  return Section<>.init(header:content:)();
}

uint64_t sub_D6E0()
{
  return static Animation.easeInOut(duration:)();
}

uint64_t sub_D6F0()
{
  return static UnitPoint.center.getter();
}

uint64_t sub_D700()
{
  return type metadata accessor for SettingsEventImage();
}

uint64_t sub_D710()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

NSString sub_D720()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_D730()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_D740()
{
  return String.hash(into:)();
}

void sub_D750(Swift::String a1)
{
}

uint64_t sub_D760()
{
  return specialized Array._endMutation()();
}

uint64_t sub_D770()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_D780()
{
  return static MainActor.shared.getter();
}

uint64_t sub_D790()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_D7A0()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_D7B0()
{
  return type metadata accessor for TaskPriority();
}

Swift::Int sub_D7D0(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_D7E0()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_D7F0()
{
  return AnyHashable.init<A>(_:)();
}

Swift::Int sub_D800(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_D810()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_D820()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_D830()
{
  return Hasher._finalize()();
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
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

uint64_t swift_allocObject()
{
  return _swift_allocObject();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
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

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}