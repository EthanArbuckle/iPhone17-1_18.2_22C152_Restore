BOOL sub_1A4CA0A60(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1A4CA0A74()
{
  return sub_1A4CBB65C();
}

uint64_t sub_1A4CA0ABC()
{
  return sub_1A4CBB64C();
}

uint64_t sub_1A4CA0AE8()
{
  return sub_1A4CBB65C();
}

uint64_t sub_1A4CA0B2C(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_1A4B0E048(&qword_1E965DAD8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1A4B0BC88(a1, a1[3]);
  sub_1A4CA148C();
  sub_1A4CBB67C();
  sub_1A4CA08A0(v3, (uint64_t)&v12);
  sub_1A4CA08A0((uint64_t)&v12, (uint64_t)&v11);
  v10[13] = 0;
  sub_1A4CA1534();
  sub_1A4CBB58C();
  if (!v2)
  {
    v10[12] = 1;
    sub_1A4CBB59C();
    v10[11] = 2;
    sub_1A4CBB59C();
    v10[10] = 3;
    sub_1A4CBB59C();
    v10[9] = 4;
    sub_1A4CBB59C();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_1A4CA0D2C()
{
  uint64_t result = 0x707954746E756F63;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x6465636E7973;
      break;
    case 2:
      uint64_t result = 0x6C61746F74;
      break;
    case 3:
      uint64_t result = 0x736574656C6564;
      break;
    case 4:
      uint64_t result = 0x766C6F7365726E75;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1A4CA0DD8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A4CA101C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A4CA0E00(uint64_t a1)
{
  unint64_t v2 = sub_1A4CA148C();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A4CA0E3C(uint64_t a1)
{
  unint64_t v2 = sub_1A4CA148C();

  return MEMORY[0x1F41862B0](a1, v2);
}

double sub_1A4CA0E78@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_1A4CA1244(a1, (uint64_t)v6);
  if (!v2)
  {
    double result = *(double *)v6;
    long long v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + 16) = v5;
    *(void *)(a2 + 32) = v7;
  }
  return result;
}

uint64_t sub_1A4CA0EC0(void *a1)
{
  return sub_1A4CA0B2C(a1);
}

BOOL sub_1A4CA0EFC(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a1 + 16);
  v5[0] = *(_OWORD *)a1;
  v5[1] = v2;
  uint64_t v6 = *(void *)(a1 + 32);
  long long v3 = *(_OWORD *)(a2 + 16);
  v7[0] = *(_OWORD *)a2;
  v7[1] = v3;
  uint64_t v8 = *(void *)(a2 + 32);
  return sub_1A4CA0F84(v5, v7);
}

uint64_t sub_1A4CA0F48()
{
  return sub_1A4CA0568();
}

BOOL sub_1A4CA0F84(void *a1, void *a2)
{
  int v4 = *(unsigned __int8 *)a1;
  int v5 = *(unsigned __int8 *)a2;
  if (v4 == 5)
  {
    if (v5 != 5) {
      return 0;
    }
  }
  else if (v5 == 5 || (sub_1A4CA3650(v4, v5) & 1) == 0)
  {
    return 0;
  }
  if (a1[1] == a2[1] && a1[2] == a2[2] && a1[3] == a2[3]) {
    return a1[4] == a2[4];
  }
  return 0;
}

uint64_t sub_1A4CA101C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x707954746E756F63 && a2 == 0xE900000000000065;
  if (v2 || (sub_1A4CBB5EC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6465636E7973 && a2 == 0xE600000000000000 || (sub_1A4CBB5EC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6C61746F74 && a2 == 0xE500000000000000 || (sub_1A4CBB5EC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x736574656C6564 && a2 == 0xE700000000000000 || (sub_1A4CBB5EC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x766C6F7365726E75 && a2 == 0xEA00000000006465)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v6 = sub_1A4CBB5EC();
    swift_bridgeObjectRelease();
    if (v6) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

uint64_t sub_1A4CA1244@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_1A4B0E048(&qword_1E965DAC0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A4B0BC88(a1, a1[3]);
  sub_1A4CA148C();
  sub_1A4CBB66C();
  if (v2) {
    return sub_1A4B0BDA0((uint64_t)a1);
  }
  char v20 = 0;
  sub_1A4CA14E0();
  sub_1A4CBB55C();
  char v9 = v21;
  char v19 = 1;
  uint64_t v10 = sub_1A4CBB56C();
  char v18 = 2;
  uint64_t v15 = sub_1A4CBB56C();
  char v17 = 3;
  uint64_t v14 = sub_1A4CBB56C();
  char v16 = 4;
  uint64_t v11 = sub_1A4CBB56C();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t result = sub_1A4B0BDA0((uint64_t)a1);
  *(unsigned char *)a2 = v9;
  uint64_t v13 = v15;
  *(void *)(a2 + 8) = v10;
  *(void *)(a2 + 16) = v13;
  *(void *)(a2 + 24) = v14;
  *(void *)(a2 + 32) = v11;
  return result;
}

unint64_t sub_1A4CA148C()
{
  unint64_t result = qword_1E965DAC8;
  if (!qword_1E965DAC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E965DAC8);
  }
  return result;
}

unint64_t sub_1A4CA14E0()
{
  unint64_t result = qword_1E965DAD0;
  if (!qword_1E965DAD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E965DAD0);
  }
  return result;
}

unint64_t sub_1A4CA1534()
{
  unint64_t result = qword_1E965DAE0;
  if (!qword_1E965DAE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E965DAE0);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for LiveDatabaseCounts.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A4CA1654);
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

ValueMetadata *type metadata accessor for LiveDatabaseCounts.CodingKeys()
{
  return &type metadata for LiveDatabaseCounts.CodingKeys;
}

unint64_t sub_1A4CA1690()
{
  unint64_t result = qword_1E965DAE8;
  if (!qword_1E965DAE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E965DAE8);
  }
  return result;
}

unint64_t sub_1A4CA16E8()
{
  unint64_t result = qword_1E965DAF0;
  if (!qword_1E965DAF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E965DAF0);
  }
  return result;
}

unint64_t sub_1A4CA1740()
{
  unint64_t result = qword_1E965DAF8;
  if (!qword_1E965DAF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E965DAF8);
  }
  return result;
}

uint64_t sub_1A4CA1794(unsigned __int8 *a1, char *a2)
{
  return sub_1A4CA3650(*a1, *a2);
}

uint64_t sub_1A4CA17A0()
{
  return sub_1A4C90FC4();
}

uint64_t sub_1A4CA17A8()
{
  sub_1A4CBB0EC();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1A4CA189C()
{
  return sub_1A4C913D8();
}

uint64_t sub_1A4CA18A4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1A4CA1C04();
  *a1 = result;
  return result;
}

void sub_1A4CA18D4(uint64_t a1@<X8>)
{
  unint64_t v2 = 0xE500000000000000;
  uint64_t v3 = 0x7374616863;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xE800000000000000;
      uint64_t v3 = 0x736567617373656DLL;
      goto LABEL_3;
    case 2:
      *(void *)a1 = 0x656D686361747461;
      *(void *)(a1 + 8) = 0xEB0000000073746ELL;
      break;
    case 3:
      strcpy((char *)a1, "messageUpdates");
      *(unsigned char *)(a1 + 15) = -18;
      break;
    case 4:
      *(void *)a1 = 0xD000000000000013;
      *(void *)(a1 + 8) = 0x80000001A4CF6640;
      break;
    default:
LABEL_3:
      *(void *)a1 = v3;
      *(void *)(a1 + 8) = v2;
      break;
  }
}

unsigned char *storeEnumTagSinglePayload for SyncCountType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A4CA1A70);
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

ValueMetadata *type metadata accessor for SyncCountType()
{
  return &type metadata for SyncCountType;
}

unint64_t sub_1A4CA1AAC()
{
  unint64_t result = qword_1E965DB00;
  if (!qword_1E965DB00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E965DB00);
  }
  return result;
}

uint64_t sub_1A4CA1B00()
{
  return sub_1A4CBB12C();
}

uint64_t sub_1A4CA1B60()
{
  return sub_1A4CBB11C();
}

unint64_t sub_1A4CA1BB0()
{
  unint64_t result = qword_1E965DB08;
  if (!qword_1E965DB08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E965DB08);
  }
  return result;
}

uint64_t sub_1A4CA1C04()
{
  unint64_t v0 = sub_1A4CBB52C();
  swift_bridgeObjectRelease();
  if (v0 >= 5) {
    return 5;
  }
  else {
    return v0;
  }
}

uint64_t sub_1A4CA1C50(char a1)
{
  if (a1 != 5)
  {
    sub_1A4CBB43C();
    sub_1A4CA0948();
    sub_1A4CBB38C();
    swift_bridgeObjectRelease();
    sub_1A4CBB0FC();
    swift_bridgeObjectRelease();
    sub_1A4CBB0FC();
    sub_1A4CBB5BC();
    sub_1A4CBB0FC();
    swift_bridgeObjectRelease();
    sub_1A4CBB0FC();
    sub_1A4CBB5BC();
    sub_1A4CBB0FC();
    swift_bridgeObjectRelease();
    sub_1A4CBB0FC();
  }
  return 0;
}

__n128 initializeBufferWithCopyOfBuffer for SyncStoreCounts(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for SyncStoreCounts(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFB && a1[24]) {
    return (*(_DWORD *)a1 + 251);
  }
  if (*a1 <= 5u) {
    int v3 = 5;
  }
  else {
    int v3 = *a1;
  }
  int v4 = v3 - 6;
  if (*a1 < 5u) {
    int v5 = -1;
  }
  else {
    int v5 = v4;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for SyncStoreCounts(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFA)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 251;
    if (a3 >= 0xFB) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFB) {
      *(unsigned char *)(result + 24) = 0;
    }
    if (a2) {
      *(unsigned char *)__n128 result = a2 + 5;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ServerRecordCounts()
{
  return &type metadata for ServerRecordCounts;
}

uint64_t sub_1A4CA1F38(void *a1, char a2, uint64_t a3)
{
  v11[1] = a3;
  uint64_t v6 = sub_1A4B0E048(&qword_1E965DB20);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  char v9 = (char *)v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A4B0BC88(a1, a1[3]);
  sub_1A4CA25F4();
  sub_1A4CBB67C();
  char v15 = a2;
  char v14 = 0;
  sub_1A4CA1534();
  sub_1A4CBB58C();
  if (!v3)
  {
    char v13 = 1;
    sub_1A4CBB59C();
    char v12 = 2;
    sub_1A4CBB59C();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_1A4CA20E4()
{
  uint64_t v1 = 0x6C61746F74;
  if (*v0 != 1) {
    uint64_t v1 = 1702259052;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x707954746E756F63;
  }
}

uint64_t sub_1A4CA2138@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A4CA22C4(a1, a2);
  *a3 = result;
  return result;
}

void sub_1A4CA2160(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_1A4CA216C(uint64_t a1)
{
  unint64_t v2 = sub_1A4CA25F4();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A4CA21A8(uint64_t a1)
{
  unint64_t v2 = sub_1A4CA25F4();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A4CA21E4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_1A4CA2410(a1);
  if (!v2)
  {
    *(unsigned char *)a2 = result;
    *(void *)(a2 + 8) = v5;
    *(void *)(a2 + 16) = v6;
  }
  return result;
}

uint64_t sub_1A4CA2214(void *a1)
{
  return sub_1A4CA1F38(a1, *(unsigned char *)v1, *(void *)(v1 + 8));
}

BOOL sub_1A4CA2234(unsigned __int8 *a1, unsigned __int8 *a2)
{
  int v4 = *a1;
  uint64_t v6 = *((void *)a1 + 1);
  uint64_t v5 = *((void *)a1 + 2);
  int v7 = *a2;
  uint64_t v9 = *((void *)a2 + 1);
  uint64_t v8 = *((void *)a2 + 2);
  if (v4 == 5)
  {
    if (v7 != 5 || v6 != v9) {
      return 0;
    }
    return v5 == v8;
  }
  if (v7 == 5) {
    return 0;
  }
  char v12 = sub_1A4CA3650(v4, v7);
  BOOL result = 0;
  if ((v12 & 1) != 0 && v6 == v9) {
    return v5 == v8;
  }
  return result;
}

uint64_t sub_1A4CA22B8()
{
  return sub_1A4CA1C50(*v0);
}

uint64_t sub_1A4CA22C4(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x707954746E756F63 && a2 == 0xE900000000000065;
  if (v2 || (sub_1A4CBB5EC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6C61746F74 && a2 == 0xE500000000000000 || (sub_1A4CBB5EC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 1702259052 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_1A4CBB5EC();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_1A4CA2410(void *a1)
{
  uint64_t v2 = sub_1A4B0E048(&qword_1E965DB10);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = &v8[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1A4B0BC88(a1, a1[3]);
  sub_1A4CA25F4();
  sub_1A4CBB66C();
  v8[14] = 0;
  sub_1A4CA14E0();
  sub_1A4CBB55C();
  uint64_t v6 = v8[15];
  v8[13] = 1;
  sub_1A4CBB56C();
  v8[12] = 2;
  sub_1A4CBB56C();
  (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
  sub_1A4B0BDA0((uint64_t)a1);
  return v6;
}

unint64_t sub_1A4CA25F4()
{
  unint64_t result = qword_1E965DB18;
  if (!qword_1E965DB18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E965DB18);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ServerRecordCounts.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ServerRecordCounts.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 2;
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
        JUMPOUT(0x1A4CA27A4);
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
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ServerRecordCounts.CodingKeys()
{
  return &type metadata for ServerRecordCounts.CodingKeys;
}

unint64_t sub_1A4CA27E0()
{
  unint64_t result = qword_1E965DB28;
  if (!qword_1E965DB28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E965DB28);
  }
  return result;
}

unint64_t sub_1A4CA2838()
{
  unint64_t result = qword_1E965DB30;
  if (!qword_1E965DB30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E965DB30);
  }
  return result;
}

unint64_t sub_1A4CA2890()
{
  unint64_t result = qword_1E965DB38;
  if (!qword_1E965DB38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E965DB38);
  }
  return result;
}

uint64_t sub_1A4CA2D3C()
{
  sub_1A4CBADEC();
  swift_allocObject();
  uint64_t result = sub_1A4CBADDC();
  qword_1E965B528 = result;
  return result;
}

id sub_1A4CA2D7C()
{
  __src[63] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v1 = self;
  int v2 = v0;
  int v3 = (void *)sub_1A4CBB09C();
  swift_bridgeObjectRelease();
  __src[0] = 0;
  id v4 = objc_msgSend(v1, sel_dataWithJSONObject_options_error_, v3, 0, __src);

  id v5 = __src[0];
  if (v4)
  {
    uint64_t v6 = sub_1A4CBAE3C();
    unint64_t v8 = v7;

    if (qword_1E965B4B0 != -1) {
      swift_once();
    }
    sub_1A4CA34C8();
    sub_1A4CBADCC();
    sub_1A4CA351C(v6, v8);
    memcpy(&v2[OBJC_IVAR___IMCloudKitSyncStatistics_statistics], __src, 0x1F8uLL);
  }
  else
  {
    uint64_t v9 = v5;
    uint64_t v10 = (void *)sub_1A4CBAE2C();

    swift_willThrow();
    if (qword_1E965B478 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_1A4CBB03C();
    sub_1A4B0C4D8(v11, (uint64_t)qword_1E9660AD0);
    char v12 = sub_1A4CBB01C();
    os_log_type_t v13 = sub_1A4CBB26C();
    if (os_log_type_enabled(v12, v13))
    {
      char v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v14 = 0;
      _os_log_impl(&dword_1A4AF7000, v12, v13, "Failed to get data from dictionary. Resetting statistic counts", v14, 2u);
      MEMORY[0x1A6264920](v14, -1, -1);
    }

    char v15 = &v2[OBJC_IVAR___IMCloudKitSyncStatistics_statistics];
    *((void *)v15 + 2) = 0;
    *(_OWORD *)char v15 = 0u;
    v15[24] = 5;
    v15[32] = 5;
    *(_OWORD *)(v15 + 40) = 0u;
    *(_OWORD *)(v15 + 56) = 0u;
    v15[72] = 5;
    *((_OWORD *)v15 + 5) = 0u;
    v15[96] = 5;
    *(_OWORD *)(v15 + 104) = 0u;
    v15[120] = 5;
    v15[128] = 5;
    *(_OWORD *)(v15 + 152) = 0u;
    *(_OWORD *)(v15 + 136) = 0u;
    v15[168] = 5;
    *((void *)v15 + 22) = 0;
    *((void *)v15 + 23) = 0;
    v15[192] = 5;
    *((void *)v15 + 25) = 0;
    *((void *)v15 + 26) = 0;
    v15[216] = 5;
    v15[224] = 5;
    *(_OWORD *)(v15 + 232) = 0u;
    *(_OWORD *)(v15 + 248) = 0u;
    v15[264] = 5;
    *((void *)v15 + 34) = 0;
    *((void *)v15 + 35) = 0;
    v15[288] = 5;
    *((void *)v15 + 37) = 0;
    *((void *)v15 + 38) = 0;
    v15[312] = 5;
    v15[320] = 5;
    *(_OWORD *)(v15 + 328) = 0u;
    *(_OWORD *)(v15 + 344) = 0u;
    v15[360] = 5;
    *((void *)v15 + 46) = 0;
    *((void *)v15 + 47) = 0;
    v15[384] = 5;
    *((void *)v15 + 49) = 0;
    *((void *)v15 + 50) = 0;
    v15[408] = 5;
    v15[416] = 5;
    *(_OWORD *)(v15 + 424) = 0u;
    *(_OWORD *)(v15 + 440) = 0u;
    v15[456] = 5;
    *((void *)v15 + 58) = 0;
    *((void *)v15 + 59) = 0;
    v15[480] = 5;
    *((void *)v15 + 61) = 0;
    *((void *)v15 + 62) = 0;
  }

  v17.receiver = v2;
  v17.super_class = (Class)IMCloudKitSyncStatistics;
  return objc_msgSendSuper2(&v17, sel_init);
}

unint64_t IMCloudKitSyncStatistics.description.getter()
{
  uint64_t v1 = v0;
  swift_getObjectType();
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  objc_msgSend(v1, sel_percentSynced);
  id v3 = objc_msgSend(ObjCClassFromMetadata, sel_percentStringFromDouble_);
  if (v3)
  {
    id v4 = v3;
    sub_1A4CBB0CC();
  }
  __dst[0] = 0;
  __dst[1] = 0xE000000000000000;
  sub_1A4CBB43C();
  swift_bridgeObjectRelease();
  unint64_t v7 = 0xD000000000000014;
  unint64_t v8 = 0x80000001A4CF78E0;
  sub_1A4CBB0FC();
  swift_bridgeObjectRelease();
  sub_1A4CBB0FC();
  memcpy(__dst, &v1[OBJC_IVAR___IMCloudKitSyncStatistics_statistics], sizeof(__dst));
  CountStatistics.description.getter();
  sub_1A4CBB0FC();
  swift_bridgeObjectRelease();
  return v7;
}

void __swiftcall IMCloudKitSyncStatistics.init()(IMCloudKitSyncStatistics *__return_ptr retstr)
{
  id v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());

  objc_msgSend(v1, sel_init);
}

void IMCloudKitSyncStatistics.init()()
{
}

uint64_t type metadata accessor for IMCloudKitSyncStatistics(uint64_t a1)
{
  return sub_1A4B0C510(a1, &qword_1E965DB48);
}

unint64_t sub_1A4CA34C8()
{
  unint64_t result = qword_1E965B520;
  if (!qword_1E965B520)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E965B520);
  }
  return result;
}

uint64_t sub_1A4CA351C(uint64_t a1, unint64_t a2)
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

__n128 initializeWithCopy for OverallCounts(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v4;
  return result;
}

uint64_t getEnumTagSinglePayload for OverallCounts(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFB && a1[96]) {
    return (*(_DWORD *)a1 + 251);
  }
  if (*a1 <= 5u) {
    int v3 = 5;
  }
  else {
    int v3 = *a1;
  }
  int v4 = v3 - 6;
  if (*a1 < 5u) {
    int v5 = -1;
  }
  else {
    int v5 = v4;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for OverallCounts(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFA)
  {
    *(void *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 251;
    if (a3 >= 0xFB) {
      *(unsigned char *)(result + 96) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFB) {
      *(unsigned char *)(result + 96) = 0;
    }
    if (a2) {
      *(unsigned char *)__n128 result = a2 + 5;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for OverallCounts()
{
  return &type metadata for OverallCounts;
}

uint64_t sub_1A4CA3650(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 0x7374616863;
  unint64_t v3 = 0xE500000000000000;
  uint64_t v4 = a1;
  unint64_t v5 = 0x7374616863;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE800000000000000;
      unint64_t v5 = 0x736567617373656DLL;
      break;
    case 2:
      unint64_t v5 = 0x656D686361747461;
      unint64_t v3 = 0xEB0000000073746ELL;
      break;
    case 3:
      unint64_t v5 = 0x556567617373656DLL;
      unint64_t v3 = 0xEE00736574616470;
      break;
    case 4:
      unint64_t v3 = 0x80000001A4CF6640;
      unint64_t v5 = 0xD000000000000013;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE500000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE800000000000000;
      if (v5 == 0x736567617373656DLL) {
        goto LABEL_13;
      }
      goto LABEL_16;
    case 2:
      unint64_t v6 = 0xEB0000000073746ELL;
      if (v5 != 0x656D686361747461) {
        goto LABEL_16;
      }
      goto LABEL_13;
    case 3:
      uint64_t v2 = 0x556567617373656DLL;
      unint64_t v6 = 0xEE00736574616470;
      goto LABEL_12;
    case 4:
      unint64_t v6 = 0x80000001A4CF6640;
      if (v5 != 0xD000000000000013) {
        goto LABEL_16;
      }
      goto LABEL_13;
    default:
LABEL_12:
      if (v5 != v2) {
        goto LABEL_16;
      }
LABEL_13:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_16:
      }
        char v7 = sub_1A4CBB5EC();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_1A4CA3844()
{
  unint64_t v0 = CountStatistics.RootKeys.rawValue.getter();
  uint64_t v2 = v1;
  if (v0 == CountStatistics.RootKeys.rawValue.getter() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_1A4CBB5EC();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_1A4CA38DC(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xEF656E6F5A656574;
  unint64_t v3 = 0x616E614D74616863;
  uint64_t v4 = a1;
  unint64_t v5 = 0x616E614D74616863;
  unint64_t v6 = 0xEF656E6F5A656574;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0xD000000000000012;
      char v7 = "messageManateeZone";
      goto LABEL_6;
    case 2:
      unint64_t v5 = 0xD000000000000015;
      char v7 = "attachmentManateeZone";
      goto LABEL_6;
    case 3:
      unint64_t v6 = 0x80000001A4CF65B0;
      unint64_t v5 = 0xD000000000000011;
      break;
    case 4:
      unint64_t v5 = 0xD00000000000001CLL;
      char v7 = "recoverableMessageDeleteZone";
LABEL_6:
      unint64_t v6 = (unint64_t)(v7 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  switch(a2)
  {
    case 1:
      unint64_t v3 = 0xD000000000000012;
      unint64_t v8 = "messageManateeZone";
      goto LABEL_12;
    case 2:
      unint64_t v3 = 0xD000000000000015;
      unint64_t v8 = "attachmentManateeZone";
      goto LABEL_12;
    case 3:
      unint64_t v2 = 0x80000001A4CF65B0;
      unint64_t v3 = 0xD000000000000011;
      break;
    case 4:
      unint64_t v3 = 0xD00000000000001CLL;
      unint64_t v8 = "recoverableMessageDeleteZone";
LABEL_12:
      unint64_t v2 = (unint64_t)(v8 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  if (v5 == v3 && v6 == v2) {
    char v9 = 1;
  }
  else {
    char v9 = sub_1A4CBB5EC();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

uint64_t sub_1A4CA3A9C(char a1, char a2)
{
  unint64_t v3 = 0xD000000000000014;
  unint64_t v4 = 0x80000001A4CF6400;
  switch(a1)
  {
    case 1:
      unint64_t v4 = 0x80000001A4CF6420;
      unint64_t v3 = 0xD000000000000013;
      break;
    case 2:
      unint64_t v3 = 0xD000000000000017;
      unint64_t v5 = "writable_message_counts";
      goto LABEL_11;
    case 3:
      unint64_t v3 = 0xD000000000000016;
      unint64_t v5 = "written_message_counts";
      goto LABEL_11;
    case 4:
      unint64_t v3 = 0xD00000000000001ALL;
      unint64_t v5 = "writable_attachment_counts";
      goto LABEL_11;
    case 5:
      unint64_t v3 = 0xD000000000000019;
      unint64_t v5 = "written_attachment_counts";
      goto LABEL_11;
    case 6:
      unint64_t v3 = 0xD00000000000001ELL;
      unint64_t v5 = "writable_message_update_counts";
      goto LABEL_11;
    case 7:
      unint64_t v3 = 0xD00000000000001DLL;
      unint64_t v5 = "written_message_update_counts";
      goto LABEL_11;
    case 8:
      unint64_t v3 = 0xD000000000000023;
      unint64_t v5 = "writable_recoverable_message_counts";
      goto LABEL_11;
    case 9:
      unint64_t v3 = 0xD000000000000022;
      unint64_t v5 = "written_recoverable_message_counts";
LABEL_11:
      unint64_t v4 = (unint64_t)(v5 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xD000000000000014;
  unint64_t v7 = 0x80000001A4CF6400;
  switch(a2)
  {
    case 1:
      unint64_t v7 = 0x80000001A4CF6420;
      unint64_t v6 = 0xD000000000000013;
      break;
    case 2:
      unint64_t v6 = 0xD000000000000017;
      unint64_t v8 = "writable_message_counts";
      goto LABEL_22;
    case 3:
      unint64_t v6 = 0xD000000000000016;
      unint64_t v8 = "written_message_counts";
      goto LABEL_22;
    case 4:
      unint64_t v6 = 0xD00000000000001ALL;
      unint64_t v8 = "writable_attachment_counts";
      goto LABEL_22;
    case 5:
      unint64_t v6 = 0xD000000000000019;
      unint64_t v8 = "written_attachment_counts";
      goto LABEL_22;
    case 6:
      unint64_t v6 = 0xD00000000000001ELL;
      unint64_t v8 = "writable_message_update_counts";
      goto LABEL_22;
    case 7:
      unint64_t v6 = 0xD00000000000001DLL;
      unint64_t v8 = "written_message_update_counts";
      goto LABEL_22;
    case 8:
      unint64_t v6 = 0xD000000000000023;
      unint64_t v8 = "writable_recoverable_message_counts";
      goto LABEL_22;
    case 9:
      unint64_t v6 = 0xD000000000000022;
      unint64_t v8 = "written_recoverable_message_counts";
LABEL_22:
      unint64_t v7 = (unint64_t)(v8 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  if (v3 == v6 && v4 == v7) {
    char v9 = 1;
  }
  else {
    char v9 = sub_1A4CBB5EC();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

uint64_t sub_1A4CA3D04(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x6365725F6576696CLL;
  }
  else {
    uint64_t v3 = 0x65725F6C61746F74;
  }
  if (v2) {
    unint64_t v4 = 0xED00007364726F63;
  }
  else {
    unint64_t v4 = 0xEC0000007364726FLL;
  }
  if (a2) {
    uint64_t v5 = 0x6365725F6576696CLL;
  }
  else {
    uint64_t v5 = 0x65725F6C61746F74;
  }
  if (a2) {
    unint64_t v6 = 0xEC0000007364726FLL;
  }
  else {
    unint64_t v6 = 0xED00007364726F63;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_1A4CBB5EC();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_1A4CA3DC0(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_1A4B0E048(&qword_1E965DB78);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  unint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A4B0BC88(a1, a1[3]);
  sub_1A4CA49F0();
  sub_1A4CBB67C();
  sub_1A4CA08A0(v3, (uint64_t)&v15);
  sub_1A4CA08A0((uint64_t)&v15, (uint64_t)&v11);
  char v14 = 0;
  sub_1A4CA1534();
  sub_1A4CBB58C();
  if (!v2)
  {
    long long v9 = *(_OWORD *)(v3 + 24);
    long long v11 = *(_OWORD *)(v3 + 8);
    long long v12 = v9;
    uint64_t v13 = *(void *)(v3 + 40);
    char v14 = 1;
    sub_1A4CA4B40();
    sub_1A4CBB5AC();
    long long v11 = *(_OWORD *)(v3 + 48);
    *(void *)&long long v12 = *(void *)(v3 + 64);
    char v14 = 2;
    sub_1A4CA4B94();
    sub_1A4CBB5AC();
    long long v11 = *(_OWORD *)(v3 + 72);
    *(void *)&long long v12 = *(void *)(v3 + 88);
    char v14 = 3;
    sub_1A4CA4BE8();
    sub_1A4CBB5AC();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_1A4CA3FFC()
{
  unint64_t result = 0x707954746E756F63;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0xD000000000000012;
      break;
    case 2:
      unint64_t result = 0x726F7453636E7973;
      break;
    case 3:
      unint64_t result = 0x6F43726576726573;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1A4CA40A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A4CA4538(a1, a2);
  *a3 = result;
  return result;
}

void sub_1A4CA40D0(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_1A4CA40DC(uint64_t a1)
{
  unint64_t v2 = sub_1A4CA49F0();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A4CA4118(uint64_t a1)
{
  unint64_t v2 = sub_1A4CA49F0();

  return MEMORY[0x1F41862B0](a1, v2);
}

double sub_1A4CA4154@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  sub_1A4CA4734(a1, (uint64_t)v8);
  if (!v2)
  {
    long long v5 = v8[3];
    a2[2] = v8[2];
    a2[3] = v5;
    long long v6 = v8[5];
    a2[4] = v8[4];
    a2[5] = v6;
    double result = *(double *)v8;
    long long v7 = v8[1];
    *a2 = v8[0];
    a2[1] = v7;
  }
  return result;
}

uint64_t sub_1A4CA41A0(void *a1)
{
  return sub_1A4CA3DC0(a1);
}

BOOL sub_1A4CA41E4(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[3];
  v9[2] = a1[2];
  v9[3] = v2;
  long long v3 = a1[5];
  v9[4] = a1[4];
  v9[5] = v3;
  long long v4 = a1[1];
  v9[0] = *a1;
  v9[1] = v4;
  long long v5 = a2[3];
  v10[2] = a2[2];
  v10[3] = v5;
  long long v6 = a2[5];
  v10[4] = a2[4];
  v10[5] = v6;
  long long v7 = a2[1];
  v10[0] = *a2;
  v10[1] = v7;
  return sub_1A4CA4318((unsigned __int8 *)v9, (unsigned __int8 *)v10);
}

uint64_t sub_1A4CA4240()
{
  uint64_t v1 = *(void *)(v0 + 56);
  unint64_t v2 = *(void *)(v0 + 64);
  char v3 = *(unsigned char *)(v0 + 72);
  char v4 = *(unsigned char *)(v0 + 48);
  uint64_t v6 = sub_1A4CA0568();
  sub_1A4CBB0FC();
  sub_1A4CA1C50(v3);
  sub_1A4CBB0FC();
  swift_bridgeObjectRelease();
  sub_1A4CBB0FC();
  sub_1A4CA8A18(v4, v1, v2);
  sub_1A4CBB0FC();
  swift_bridgeObjectRelease();
  return v6;
}

BOOL sub_1A4CA4318(unsigned __int8 *a1, unsigned __int8 *a2)
{
  int v4 = *a1;
  int v5 = *a2;
  if (v4 == 5)
  {
    if (v5 != 5) {
      return 0;
    }
  }
  else if (v5 == 5 || (sub_1A4CA3650(v4, v5) & 1) == 0)
  {
    return 0;
  }
  int v6 = a1[8];
  uint64_t v8 = *((void *)a1 + 2);
  uint64_t v7 = *((void *)a1 + 3);
  uint64_t v10 = *((void *)a1 + 4);
  uint64_t v9 = *((void *)a1 + 5);
  int v11 = a2[8];
  uint64_t v13 = *((void *)a2 + 2);
  uint64_t v12 = *((void *)a2 + 3);
  uint64_t v15 = *((void *)a2 + 4);
  uint64_t v14 = *((void *)a2 + 5);
  if (v6 == 5)
  {
    BOOL result = 0;
    if (v11 != 5) {
      return result;
    }
  }
  else
  {
    if (v11 == 5) {
      return 0;
    }
    char v17 = sub_1A4CA3650(v6, v11);
    BOOL result = 0;
    if ((v17 & 1) == 0) {
      return result;
    }
  }
  if (v8 != v13 || v7 != v12 || v10 != v15 || v9 != v14) {
    return result;
  }
  int v18 = a1[48];
  uint64_t v20 = *((void *)a1 + 7);
  uint64_t v19 = *((void *)a1 + 8);
  int v21 = a2[48];
  uint64_t v23 = *((void *)a2 + 7);
  uint64_t v22 = *((void *)a2 + 8);
  if (v18 == 5)
  {
    BOOL result = 0;
    if (v21 != 5) {
      return result;
    }
    goto LABEL_20;
  }
  if (v21 == 5) {
    return 0;
  }
  char v24 = sub_1A4CA3650(v18, v21);
  BOOL result = 0;
  if ((v24 & 1) == 0) {
    return result;
  }
LABEL_20:
  if (v20 == v23 && v19 == v22)
  {
    int v25 = a1[72];
    uint64_t v27 = *((void *)a1 + 10);
    uint64_t v26 = *((void *)a1 + 11);
    int v28 = a2[72];
    uint64_t v30 = *((void *)a2 + 10);
    uint64_t v29 = *((void *)a2 + 11);
    if (v25 == 5)
    {
      if (v28 != 5) {
        return 0;
      }
    }
    else if (v28 == 5 || (sub_1A4CA3650(v25, v28) & 1) == 0)
    {
      return 0;
    }
    return v27 == v30 && v26 == v29;
  }
  return result;
}

uint64_t sub_1A4CA4490@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  if (a2 < 0 || a3 < 0 || a4 < 0 || a5 < 0 || a8 < 0 || a10 < 0 || a6 < 0 || a7 < 0)
  {
    BOOL result = sub_1A4CBB4BC();
    __break(1u);
  }
  else
  {
    *(unsigned char *)a9 = result;
    *(unsigned char *)(a9 + 8) = result;
    *(void *)(a9 + 16) = a2;
    *(void *)(a9 + 24) = a3;
    *(void *)(a9 + 32) = a4;
    *(void *)(a9 + 40) = a5;
    *(unsigned char *)(a9 + 48) = result;
    *(void *)(a9 + 56) = a8;
    *(void *)(a9 + 64) = a10;
    *(unsigned char *)(a9 + 72) = result;
    *(void *)(a9 + 80) = a6;
    *(void *)(a9 + 88) = a7;
  }
  return result;
}

uint64_t sub_1A4CA4538(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x707954746E756F63 && a2 == 0xE900000000000065;
  if (v2 || (sub_1A4CBB5EC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x80000001A4CF7E30 || (sub_1A4CBB5EC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x726F7453636E7973 && a2 == 0xEF73746E756F4365 || (sub_1A4CBB5EC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6F43726576726573 && a2 == 0xEC00000073746E75)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_1A4CBB5EC();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_1A4CA4734@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_1A4B0E048(&qword_1E965DB50);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A4B0BC88(a1, a1[3]);
  sub_1A4CA49F0();
  sub_1A4CBB66C();
  if (v2) {
    return sub_1A4B0BDA0((uint64_t)a1);
  }
  char v33 = 0;
  sub_1A4CA14E0();
  sub_1A4CBB55C();
  int v9 = v27;
  char v33 = 1;
  sub_1A4CA4A44();
  sub_1A4CBB57C();
  int v25 = v9;
  int v32 = v27;
  uint64_t v26 = v28;
  uint64_t v10 = v30;
  uint64_t v24 = v29;
  uint64_t v11 = v31;
  char v33 = 2;
  sub_1A4CA4A98();
  sub_1A4CBB57C();
  uint64_t v22 = v11;
  uint64_t v23 = v10;
  LOBYTE(v11) = v27;
  uint64_t v12 = v28;
  uint64_t v21 = v29;
  char v33 = 3;
  sub_1A4CA4AEC();
  sub_1A4CBB57C();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  unsigned __int8 v13 = v27;
  uint64_t v14 = v28;
  uint64_t v15 = v29;
  uint64_t result = sub_1A4B0BDA0((uint64_t)a1);
  *(unsigned char *)a2 = v25;
  *(unsigned char *)(a2 + 8) = v32;
  uint64_t v17 = v24;
  *(void *)(a2 + 16) = v26;
  *(void *)(a2 + 24) = v17;
  uint64_t v18 = v22;
  *(void *)(a2 + 32) = v23;
  *(void *)(a2 + 40) = v18;
  *(unsigned char *)(a2 + 48) = v11;
  uint64_t v19 = v21;
  *(void *)(a2 + 56) = v12;
  *(void *)(a2 + 64) = v19;
  *(unsigned char *)(a2 + 72) = v13;
  *(void *)(a2 + 80) = v14;
  *(void *)(a2 + 88) = v15;
  return result;
}

unint64_t sub_1A4CA49F0()
{
  unint64_t result = qword_1E965DB58;
  if (!qword_1E965DB58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E965DB58);
  }
  return result;
}

unint64_t sub_1A4CA4A44()
{
  unint64_t result = qword_1E965DB60;
  if (!qword_1E965DB60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E965DB60);
  }
  return result;
}

unint64_t sub_1A4CA4A98()
{
  unint64_t result = qword_1E965DB68;
  if (!qword_1E965DB68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E965DB68);
  }
  return result;
}

unint64_t sub_1A4CA4AEC()
{
  unint64_t result = qword_1E965DB70;
  if (!qword_1E965DB70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E965DB70);
  }
  return result;
}

unint64_t sub_1A4CA4B40()
{
  unint64_t result = qword_1E965DB80;
  if (!qword_1E965DB80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E965DB80);
  }
  return result;
}

unint64_t sub_1A4CA4B94()
{
  unint64_t result = qword_1E965DB88;
  if (!qword_1E965DB88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E965DB88);
  }
  return result;
}

unint64_t sub_1A4CA4BE8()
{
  unint64_t result = qword_1E965DB90;
  if (!qword_1E965DB90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E965DB90);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for OverallCounts.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for OverallCounts.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1A4CA4D98);
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

ValueMetadata *type metadata accessor for OverallCounts.CodingKeys()
{
  return &type metadata for OverallCounts.CodingKeys;
}

unint64_t sub_1A4CA4DD4()
{
  unint64_t result = qword_1E965DB98;
  if (!qword_1E965DB98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E965DB98);
  }
  return result;
}

unint64_t sub_1A4CA4E2C()
{
  unint64_t result = qword_1E965DBA0;
  if (!qword_1E965DBA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E965DBA0);
  }
  return result;
}

unint64_t sub_1A4CA4E84()
{
  unint64_t result = qword_1E965DBA8;
  if (!qword_1E965DBA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E965DBA8);
  }
  return result;
}

uint64_t MultiplexedDaemonConnection.label.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___IMMultiplexedDaemonConnection_label);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t MultiplexedDaemonConnection.capabilities.getter()
{
  return *(void *)(v0 + OBJC_IVAR___IMMultiplexedDaemonConnection_capabilities);
}

uint64_t MultiplexedDaemonConnection.context.getter()
{
  return swift_bridgeObjectRetain();
}

id MultiplexedDaemonConnection.remoteProxy.getter()
{
  return sub_1A4CA5054((SEL *)&selRef_remoteDaemon);
}

id sub_1A4CA4FB8(void *a1, uint64_t a2, SEL *a3)
{
  uint64_t v5 = self;
  id v6 = a1;
  id v7 = objc_msgSend(v5, sel_sharedController);
  id v8 = [v7 *a3];

  return v8;
}

id MultiplexedDaemonConnection.synchronousRemoteProxy.getter()
{
  return sub_1A4CA5054((SEL *)&selRef_synchronousRemoteDaemon);
}

id sub_1A4CA5054(SEL *a1)
{
  id v2 = objc_msgSend(self, sel_sharedController);
  id v3 = [v2 *a1];

  return v3;
}

Swift::Void __swiftcall MultiplexedDaemonConnection.waitForSetup()()
{
  if (qword_1EB3F20D0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_1A4CBB03C();
  sub_1A4B0C4D8(v1, (uint64_t)qword_1EB3F2588);
  id v2 = v0;
  id v3 = sub_1A4CBB01C();
  os_log_type_t v4 = sub_1A4CBB24C();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v14 = v6;
    *(_DWORD *)uint64_t v5 = 136315394;
    uint64_t v7 = *(void *)&v2[OBJC_IVAR___IMMultiplexedDaemonConnection_label];
    unint64_t v8 = *(void *)&v2[OBJC_IVAR___IMMultiplexedDaemonConnection_label + 8];
    swift_bridgeObjectRetain();
    sub_1A4B0BCCC(v7, v8, &v14);
    sub_1A4CBB36C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v5 + 12) = 2080;
    id v9 = (id)IMStringFromClientCapabilities();
    uint64_t v10 = sub_1A4CBB0CC();
    unint64_t v12 = v11;

    sub_1A4B0BCCC(v10, v12, &v14);
    sub_1A4CBB36C();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1A4AF7000, v3, v4, "Multiplexed connection %s is waiting for setup with capabilities %s", (uint8_t *)v5, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1A6264920](v6, -1, -1);
    MEMORY[0x1A6264920](v5, -1, -1);
  }
  else
  {
  }
  id v13 = objc_msgSend(self, sel_sharedController);
  objc_msgSend(v13, sel_blockUntilConnected);
}

uint64_t MultiplexedDaemonConnection.connect()()
{
  *(void *)(v1 + 120) = v0;
  return MEMORY[0x1F4188298](sub_1A4CA5370, 0, 0);
}

uint64_t sub_1A4CA5370()
{
  uint64_t v24 = v0;
  uint64_t v1 = v0;
  id v2 = v0 + 10;
  if (qword_1EB3F20D0 != -1) {
    swift_once();
  }
  id v3 = (void *)v0[15];
  uint64_t v4 = sub_1A4CBB03C();
  sub_1A4B0C4D8(v4, (uint64_t)qword_1EB3F2588);
  id v5 = v3;
  uint64_t v6 = sub_1A4CBB01C();
  os_log_type_t v7 = sub_1A4CBB24C();
  BOOL v8 = os_log_type_enabled(v6, v7);
  id v9 = (char *)v1[15];
  if (v8)
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    uint64_t v23 = v22;
    *(_DWORD *)uint64_t v10 = 136315394;
    uint64_t v11 = *(void *)&v9[OBJC_IVAR___IMMultiplexedDaemonConnection_label];
    unint64_t v12 = *(void *)&v9[OBJC_IVAR___IMMultiplexedDaemonConnection_label + 8];
    swift_bridgeObjectRetain();
    v1[10] = sub_1A4B0BCCC(v11, v12, &v23);
    sub_1A4CBB36C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2080;
    id v13 = (id)IMStringFromClientCapabilities();
    uint64_t v14 = v2;
    uint64_t v15 = sub_1A4CBB0CC();
    unint64_t v17 = v16;

    uint64_t v18 = v15;
    id v2 = v14;
    v1[10] = sub_1A4B0BCCC(v18, v17, &v23);
    sub_1A4CBB36C();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1A4AF7000, v6, v7, "Multiplexed connection %s is requesting asynchronous connection with capabilities %s", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1A6264920](v22, -1, -1);
    MEMORY[0x1A6264920](v10, -1, -1);
  }
  else
  {
  }
  id v19 = objc_msgSend(self, sel_sharedController);
  v1[16] = v19;
  v1[2] = v1;
  v1[3] = sub_1A4CA5684;
  uint64_t v20 = swift_continuation_init();
  v1[10] = MEMORY[0x1E4F143A8];
  v1[11] = 0x40000000;
  v1[12] = sub_1A4CA57C4;
  v1[13] = &unk_1E5B7AAF0;
  v1[14] = v20;
  objc_msgSend(v19, sel__connectWithCompletion_, v2);
  return MEMORY[0x1F41881E8](v1 + 2);
}

uint64_t sub_1A4CA5684()
{
  return MEMORY[0x1F4188298](sub_1A4CA5764, 0, 0);
}

uint64_t sub_1A4CA5764()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1A4CA57C4()
{
  return swift_continuation_resume();
}

uint64_t sub_1A4CA5934(const void *a1, void *a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  id v4 = a2;
  id v5 = (void *)swift_task_alloc();
  v2[4] = v5;
  *id v5 = v2;
  v5[1] = sub_1A4CA59F8;
  v5[15] = v4;
  return MEMORY[0x1F4188298](sub_1A4CA5370, 0, 0);
}

uint64_t sub_1A4CA59F8()
{
  uint64_t v1 = *(void (***)(void))(*v0 + 24);
  id v2 = *(void **)(*v0 + 16);
  uint64_t v5 = *v0;
  swift_task_dealloc();

  v1[2](v1);
  _Block_release(v1);
  uint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

Swift::Void __swiftcall MultiplexedDaemonConnection.invalidate()()
{
  if (qword_1EB3F20D0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_1A4CBB03C();
  sub_1A4B0C4D8(v1, (uint64_t)qword_1EB3F2588);
  id v2 = v0;
  uint64_t v3 = sub_1A4CBB01C();
  os_log_type_t v4 = sub_1A4CBB24C();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v11 = v6;
    *(_DWORD *)uint64_t v5 = 136315138;
    uint64_t v7 = *(void *)&v2[OBJC_IVAR___IMMultiplexedDaemonConnection_label];
    unint64_t v8 = *(void *)&v2[OBJC_IVAR___IMMultiplexedDaemonConnection_label + 8];
    swift_bridgeObjectRetain();
    sub_1A4B0BCCC(v7, v8, &v11);
    sub_1A4CBB36C();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1A4AF7000, v3, v4, "Multiplexed connection %s was invalidated by caller", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1A6264920](v6, -1, -1);
    MEMORY[0x1A6264920](v5, -1, -1);
  }
  else
  {
  }
  (*(void (**)(uint64_t, uint64_t))&v2[OBJC_IVAR___IMMultiplexedDaemonConnection_onInvalidate])(v9, v10);
}

id MultiplexedDaemonConnection.__allocating_init(label:capabilities:context:onInvalidate:onDeinit:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v17 = (char *)objc_allocWithZone(v8);
  uint64_t v18 = &v17[OBJC_IVAR___IMMultiplexedDaemonConnection_label];
  *(void *)uint64_t v18 = a1;
  *((void *)v18 + 1) = a2;
  *(void *)&v17[OBJC_IVAR___IMMultiplexedDaemonConnection_capabilities] = a3;
  *(void *)&v17[OBJC_IVAR___IMMultiplexedDaemonConnection_context] = a4;
  id v19 = &v17[OBJC_IVAR___IMMultiplexedDaemonConnection_onInvalidate];
  *(void *)id v19 = a5;
  *((void *)v19 + 1) = a6;
  uint64_t v20 = &v17[OBJC_IVAR___IMMultiplexedDaemonConnection_onDeinit];
  *(void *)uint64_t v20 = a7;
  *((void *)v20 + 1) = a8;
  v22.receiver = v17;
  v22.super_class = v8;
  return objc_msgSendSuper2(&v22, sel_init);
}

id MultiplexedDaemonConnection.init(label:capabilities:context:onInvalidate:onDeinit:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v18 = &v8[OBJC_IVAR___IMMultiplexedDaemonConnection_label];
  *(void *)uint64_t v18 = a1;
  *((void *)v18 + 1) = a2;
  *(void *)&v8[OBJC_IVAR___IMMultiplexedDaemonConnection_capabilities] = a3;
  *(void *)&v8[OBJC_IVAR___IMMultiplexedDaemonConnection_context] = a4;
  id v19 = &v8[OBJC_IVAR___IMMultiplexedDaemonConnection_onInvalidate];
  *(void *)id v19 = a5;
  *((void *)v19 + 1) = a6;
  uint64_t v20 = &v8[OBJC_IVAR___IMMultiplexedDaemonConnection_onDeinit];
  *(void *)uint64_t v20 = a7;
  *((void *)v20 + 1) = a8;
  v22.receiver = v8;
  v22.super_class = ObjectType;
  return objc_msgSendSuper2(&v22, sel_init);
}

id MultiplexedDaemonConnection.__deallocating_deinit()
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v2 = *(void (**)(uint64_t))&v0[OBJC_IVAR___IMMultiplexedDaemonConnection_onDeinit];
  uint64_t v3 = swift_retain();
  v2(v3);
  swift_release();
  v5.receiver = v0;
  v5.super_class = ObjectType;
  return objc_msgSendSuper2(&v5, sel_dealloc);
}

id MultiplexedDaemonConnection.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void MultiplexedDaemonConnection.init()()
{
}

uint64_t type metadata accessor for MultiplexedDaemonConnection()
{
  return self;
}

uint64_t method lookup function for MultiplexedDaemonConnection(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for MultiplexedDaemonConnection);
}

uint64_t dispatch thunk of MultiplexedDaemonConnection.__allocating_init(label:capabilities:context:onInvalidate:onDeinit:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t sub_1A4CA6120()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1A4CA6158()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_1A4CA6168()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1A4CA61A8()
{
  id v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  os_log_type_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *os_log_type_t v4 = v1;
  v4[1] = sub_1A4C90044;
  objc_super v5 = (uint64_t (*)(const void *, void *))((char *)&dword_1E965DBE0 + dword_1E965DBE0);
  return v5(v2, v3);
}

uint64_t sub_1A4CA6258()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  os_log_type_t v4 = (int *)v0[4];
  objc_super v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *objc_super v5 = v1;
  v5[1] = sub_1A4C90918;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_1E965DCE0 + dword_1E965DCE0);
  return v6(v2, v3, v4);
}

uint64_t sub_1A4CA631C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_1A4CA63B4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1A4CA6594(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1A4CA6594(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1A4CA63B4(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_1A4CA652C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1A4CBB44C();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_1A4CBB4BC();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1A4CBB10C();
      if (!v2) {
        return MEMORY[0x1E4FBC860];
      }
    }
    sub_1A4CBB50C();
    __break(1u);
LABEL_14:
    uint64_t result = sub_1A4CBB4BC();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E4FBC860];
  }
  return result;
}

void *sub_1A4CA652C(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  sub_1A4B0E048((uint64_t *)&unk_1EB3F2130);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1A4CA6594(char a1, int64_t a2, char a3, char *a4)
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
    sub_1A4B0E048((uint64_t *)&unk_1EB3F2130);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  unint64_t v12 = v10 + 32;
  id v13 = a4 + 32;
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
  uint64_t result = sub_1A4CBB50C();
  __break(1u);
  return result;
}

void sub_1A4CA66EC(uint64_t a1, void *a2)
{
  unint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_1A4CA6754()
{
  uint64_t v0 = sub_1A4CBB03C();
  sub_1A4AFFB14(v0, qword_1E965B5C8);
  sub_1A4B0C4D8(v0, (uint64_t)qword_1E965B5C8);
  sub_1A4CBB00C();
  return sub_1A4CBB02C();
}

uint64_t sub_1A4CA67C0()
{
  uint64_t v1 = sub_1A4CBAEAC();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  uint64_t v4 = MEMORY[0x1F4188790](v1);
  size_t v5 = (char *)aBlock - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v4);
  int64_t v7 = (char *)aBlock - v6;
  sub_1A4CBAE9C();
  id v8 = objc_msgSend(self, sel_sharedController);
  uint64_t v9 = swift_allocObject();
  swift_unknownObjectWeakInit();
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v5, v7, v1);
  unint64_t v10 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v9;
  (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(v11 + v10, v5, v1);
  aBlock[4] = sub_1A4CA7A6C;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1A4CA66EC;
  aBlock[3] = &unk_1EF8E6178;
  unint64_t v12 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(v8, sel_calculateServiceForSendingToChat_completionBlock_, v0, v12);
  _Block_release(v12);

  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v7, v1);
}

void sub_1A4CA69FC(char **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = a2 + 16;
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x1A62649D0](v5);
  if (v6)
  {
    int64_t v7 = (void *)v6;
    sub_1A4CA6A6C(a1, a3);
  }
}

NSObject *sub_1A4CA6A6C(char **a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v99 = a2;
  uint64_t v5 = sub_1A4B0E048(&qword_1E965B568);
  MEMORY[0x1F4188790](v5 - 8);
  int64_t v7 = (char *)&v97 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = (char **)sub_1A4CBAEAC();
  uint64_t v9 = (uint64_t)*(v8 - 1);
  uint64_t v10 = MEMORY[0x1F4188790](v8);
  unint64_t v12 = (char *)&v97 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x1F4188790](v10);
  uint64_t v15 = (char *)&v97 - v14;
  uint64_t v16 = MEMORY[0x1F4188790](v13);
  uint64_t v18 = (char *)&v97 - v17;
  MEMORY[0x1F4188790](v16);
  uint64_t v20 = (char **)((char *)&v97 - v19);
  uint64_t v100 = (uint64_t)v3;
  id v21 = objc_msgSend(v3, sel_lastCompletedServiceReachabilityRequestStartTime);
  if (v21)
  {
    objc_super v22 = v21;
    sub_1A4CBAE8C();

    uint64_t v23 = *(void (**)(char *, char *, char **))(v9 + 32);
    v23(v7, v18, v8);
    (*(void (**)(char *, void, uint64_t, char **))(v9 + 56))(v7, 0, 1, v8);
    if ((*(unsigned int (**)(char *, uint64_t, char **))(v9 + 48))(v7, 1, v8) != 1)
    {
      v23((char *)v20, v7, v8);
      if (sub_1A4CBAE7C())
      {
        id v24 = objc_msgSend(a1, sel_bestResult);
        if (v24)
        {
          uint64_t v25 = v24;
          id v26 = objc_msgSend(v24, sel_service);

          uint64_t v100 = sub_1A4CBB0CC();
          a1 = v27;
        }
        else
        {
          a1 = (char **)0xE300000000000000;
          uint64_t v100 = 4999502;
        }
        uint64_t v30 = (uint64_t)v12;
        if (qword_1E965B5E8 != -1) {
          goto LABEL_85;
        }
        goto LABEL_59;
      }
      (*(void (**)(char **, char **))(v9 + 8))(v20, v8);
      goto LABEL_8;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, char **))(v9 + 56))(v7, 1, 1, v8);
  }
  sub_1A4B0E2A4((uint64_t)v7, &qword_1E965B568);
LABEL_8:
  id v8 = &selRef_setResponseHandlers_;
  if (objc_msgSend(a1, sel_isFinal))
  {
    uint64_t v28 = (void *)sub_1A4CBAE6C();
    objc_msgSend((id)v100, sel_setLastCompletedServiceReachabilityRequestStartTime_, v28);
  }
  if (qword_1E965B5E8 != -1) {
LABEL_63:
  }
    swift_once();
  uint64_t v29 = sub_1A4CBB03C();
  uint64_t v30 = sub_1A4B0C4D8(v29, (uint64_t)qword_1E965B5C8);
  uint64_t v20 = a1;
  uint64_t v31 = sub_1A4CBB01C();
  os_log_type_t v32 = sub_1A4CBB24C();
  if (os_log_type_enabled(v31, v32))
  {
    uint64_t v33 = swift_slowAlloc();
    uint64_t v34 = swift_slowAlloc();
    uint64_t v102 = v34;
    *(_DWORD *)uint64_t v33 = 136315394;
    id v35 = objc_msgSend(v20, sel_bestResult);
    uint64_t v99 = v30;
    if (v35)
    {
      v36 = v35;
      id v37 = objc_msgSend(v35, sel_service);

      uint64_t v38 = sub_1A4CBB0CC();
      unint64_t v40 = v39;
    }
    else
    {
      unint64_t v40 = 0xE500000000000000;
      uint64_t v38 = 0x3E6C696E3CLL;
    }
    uint64_t v101 = sub_1A4B0BCCC(v38, v40, &v102);
    sub_1A4CBB36C();

    swift_bridgeObjectRelease();
    *(_WORD *)(v33 + 12) = 1024;
    unsigned int v41 = [v20 v8[502]];

    LODWORD(v101) = v41;
    sub_1A4CBB36C();

    _os_log_impl(&dword_1A4AF7000, v31, v32, "Preferred service for sending updated to %s isFinal %{BOOL}d", (uint8_t *)v33, 0x12u);
    swift_arrayDestroy();
    MEMORY[0x1A6264920](v34, -1, -1);
    MEMORY[0x1A6264920](v33, -1, -1);

    uint64_t v30 = v99;
  }
  else
  {
  }
  id v42 = objc_msgSend(v20, sel_resultsByAccountID);
  uint64_t v9 = sub_1A4B0C510(0, &qword_1E965B650);
  uint64_t v43 = sub_1A4CBB0AC();

  id v8 = (char **)(v43 + 64);
  uint64_t v44 = 1 << *(unsigned char *)(v43 + 32);
  uint64_t v45 = -1;
  if (v44 < 64) {
    uint64_t v45 = ~(-1 << v44);
  }
  unint64_t v46 = v45 & *(void *)(v43 + 64);
  uint64_t v15 = (char *)((unint64_t)(v44 + 63) >> 6);
  swift_bridgeObjectRetain();
  uint64_t v47 = 0;
  a1 = &selRef_databaseUpdated_;
  while (v46)
  {
    unint64_t v48 = __clz(__rbit64(v46));
    v46 &= v46 - 1;
    unint64_t v49 = v48 | (v47 << 6);
LABEL_21:
    if (objc_msgSend(*(id *)(*(void *)(v43 + 56) + 8 * v49), sel_error) == (id)5)
    {
      swift_release();
      swift_bridgeObjectRelease();
      id v53 = (id)v100;
      sub_1A4CA7AE0();
      if ((v54 & 1) != 0 || (uint64_t v55 = sub_1A4CA7AE0(), (v56 & 1) == 0) && v55 == -1)
      {
        uint64_t result = objc_msgSend(self, sel_sharedInstance);
        if (!result)
        {
          __break(1u);
          goto LABEL_87;
        }
        v58 = result;
        [result trackSpamEvent:2];

        v59 = (void *)sub_1A4CBB22C();
        objc_msgSend(v53, sel_setValue_forChatProperty_, v59, @"smsHandshakeState");
      }
LABEL_47:
      uint64_t v15 = (char *)objc_msgSend(v20, sel_resultsForServiceName_, *MEMORY[0x1E4F6E1B0]);
      unint64_t v60 = sub_1A4CBB15C();

      if (v60 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v9 = sub_1A4CBB4CC();
        swift_bridgeObjectRelease();
        if (v9) {
          goto LABEL_49;
        }
      }
      else
      {
        uint64_t v9 = *(void *)((v60 & 0xFFFFFFFFFFFFFF8) + 0x10);
        if (v9)
        {
LABEL_49:
          if ((v60 & 0xC000000000000001) != 0)
          {
            id v61 = (id)MEMORY[0x1A6262970](0, v60);
          }
          else
          {
            if (!*(void *)((v60 & 0xFFFFFFFFFFFFFF8) + 0x10))
            {
              __break(1u);
              goto LABEL_84;
            }
            id v61 = *(id *)(v60 + 32);
          }
          v62 = v61;
          swift_bridgeObjectRelease();
          objc_msgSend(v53, sel__updateHybridGroupStateWithReachabilityResult_, v62);
          if (v62)
          {
            id v63 = v62;
            sub_1A4CA8798(v63);
            if (objc_msgSend(v63, sel_allAreReachable)) {
              objc_msgSend(v53, sel_setHasHadSuccessfulQuery_, 1);
            }
          }
          goto LABEL_66;
        }
      }
      swift_bridgeObjectRelease();
      objc_msgSend(v53, sel__updateHybridGroupStateWithReachabilityResult_, 0);
LABEL_66:
      if (sub_1A4CA8088())
      {
        if (sub_1A4CA8310(v20))
        {
          id v80 = objc_msgSend(v20, sel_bestResult);
          if (!v80) {
            return objc_msgSend(v53, sel_setHasRefreshedServiceForSending_, 1);
          }
          v81 = v80;
          id v82 = objc_msgSend(v80, sel_service);
          if (!v82)
          {
            sub_1A4CBB0CC();
            id v82 = (id)sub_1A4CBB0BC();
            swift_bridgeObjectRelease();
          }
          id v83 = objc_msgSend(self, sel_serviceWithInternalName_, v82);

          if (v83)
          {
            objc_msgSend(v53, sel__targetToService_newComposition_, v83, 0);

            return objc_msgSend(v53, sel_setHasRefreshedServiceForSending_, 1);
          }
          id v85 = v81;
          id v86 = v53;
          id v87 = v85;
          id v53 = v86;
          v84 = sub_1A4CBB01C();
          os_log_type_t v88 = sub_1A4CBB27C();
          if (!os_log_type_enabled(v84, v88))
          {

            return objc_msgSend(v53, sel_setHasRefreshedServiceForSending_, 1);
          }
          uint64_t v89 = swift_slowAlloc();
          v90 = (void *)swift_slowAlloc();
          uint64_t v100 = swift_slowAlloc();
          uint64_t v102 = v100;
          *(_DWORD *)uint64_t v89 = 136315394;
          id v91 = objc_msgSend(v87, sel_service);
          uint64_t v92 = sub_1A4CBB0CC();
          unint64_t v94 = v93;

          uint64_t v101 = sub_1A4B0BCCC(v92, v94, &v102);
          sub_1A4CBB36C();

          swift_bridgeObjectRelease();
          *(_WORD *)(v89 + 12) = 2112;
          uint64_t v101 = (uint64_t)v53;
          id v95 = v53;
          sub_1A4CBB36C();
          void *v90 = v53;

          _os_log_impl(&dword_1A4AF7000, v84, v88, "Daemon told us %s was the best service for sending on %@ but I can't find the service instance", (uint8_t *)v89, 0x16u);
          sub_1A4B0E048(&qword_1E965B5C0);
          swift_arrayDestroy();
          MEMORY[0x1A6264920](v90, -1, -1);
          uint64_t v96 = v100;
          swift_arrayDestroy();
          MEMORY[0x1A6264920](v96, -1, -1);
          MEMORY[0x1A6264920](v89, -1, -1);

LABEL_77:
          return objc_msgSend(v53, sel_setHasRefreshedServiceForSending_, 1);
        }
      }
      else
      {
        sub_1A4B0C510(0, (unint64_t *)&qword_1EB3F1FE8);
        uint64_t result = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_iMessageService);
        if (result)
        {
LABEL_76:
          v84 = result;
          objc_msgSend(v53, sel__targetToService_newComposition_, result, 0);
          goto LABEL_77;
        }
        __break(1u);
      }
      sub_1A4B0C510(0, (unint64_t *)&qword_1EB3F1FE8);
      uint64_t result = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_rcsService);
      if (result) {
        goto LABEL_76;
      }
LABEL_87:
      __break(1u);
      return result;
    }
  }
  uint64_t v50 = v47 + 1;
  if (__OFADD__(v47, 1))
  {
    __break(1u);
    goto LABEL_63;
  }
  if (v50 >= (uint64_t)v15)
  {
LABEL_46:
    swift_release();
    swift_bridgeObjectRelease();
    id v53 = (id)v100;
    goto LABEL_47;
  }
  unint64_t v51 = (unint64_t)v8[v50];
  ++v47;
  if (v51) {
    goto LABEL_40;
  }
  uint64_t v47 = v50 + 1;
  if (v50 + 1 >= (uint64_t)v15) {
    goto LABEL_46;
  }
  unint64_t v51 = (unint64_t)v8[v47];
  if (v51) {
    goto LABEL_40;
  }
  uint64_t v47 = v50 + 2;
  if (v50 + 2 >= (uint64_t)v15) {
    goto LABEL_46;
  }
  unint64_t v51 = (unint64_t)v8[v47];
  if (v51) {
    goto LABEL_40;
  }
  uint64_t v47 = v50 + 3;
  if (v50 + 3 >= (uint64_t)v15) {
    goto LABEL_46;
  }
  unint64_t v51 = (unint64_t)v8[v47];
  if (v51) {
    goto LABEL_40;
  }
  uint64_t v47 = v50 + 4;
  if (v50 + 4 >= (uint64_t)v15) {
    goto LABEL_46;
  }
  unint64_t v51 = (unint64_t)v8[v47];
  if (v51)
  {
LABEL_40:
    unint64_t v46 = (v51 - 1) & v51;
    unint64_t v49 = __clz(__rbit64(v51)) + (v47 << 6);
    goto LABEL_21;
  }
  uint64_t v52 = v50 + 5;
  if (v52 >= (uint64_t)v15) {
    goto LABEL_46;
  }
  unint64_t v51 = (unint64_t)v8[v52];
  if (v51)
  {
    uint64_t v47 = v52;
    goto LABEL_40;
  }
  while (1)
  {
    uint64_t v47 = v52 + 1;
    if (__OFADD__(v52, 1)) {
      break;
    }
    if (v47 >= (uint64_t)v15) {
      goto LABEL_46;
    }
    unint64_t v51 = (unint64_t)v8[v47];
    ++v52;
    if (v51) {
      goto LABEL_40;
    }
  }
LABEL_84:
  __break(1u);
LABEL_85:
  swift_once();
LABEL_59:
  uint64_t v64 = sub_1A4CBB03C();
  sub_1A4B0C4D8(v64, (uint64_t)qword_1E965B5C8);
  v65 = *(void (**)(char *, uint64_t, char **))(v9 + 16);
  v65(v15, v99, v8);
  v65((char *)v30, (uint64_t)v20, v8);
  swift_bridgeObjectRetain();
  v66 = sub_1A4CBB01C();
  os_log_type_t v67 = sub_1A4CBB24C();
  int v68 = v67;
  if (os_log_type_enabled(v66, v67))
  {
    uint64_t v69 = swift_slowAlloc();
    uint64_t v99 = swift_slowAlloc();
    uint64_t v102 = v99;
    *(_DWORD *)uint64_t v69 = 136315650;
    int v98 = v68;
    swift_bridgeObjectRetain();
    uint64_t v70 = sub_1A4B0BCCC(v100, (unint64_t)a1, &v102);
    uint64_t v100 = v30;
    uint64_t v101 = v70;
    sub_1A4CBB36C();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v69 + 12) = 2080;
    sub_1A4CA89C0();
    uint64_t v71 = sub_1A4CBB5BC();
    uint64_t v101 = sub_1A4B0BCCC(v71, v72, &v102);
    sub_1A4CBB36C();
    swift_bridgeObjectRelease();
    v73 = *(void (**)(char *, char **))(v9 + 8);
    v73(v15, v8);
    *(_WORD *)(v69 + 22) = 2080;
    os_log_t v97 = v66;
    uint64_t v74 = v100;
    uint64_t v75 = sub_1A4CBB5BC();
    uint64_t v101 = sub_1A4B0BCCC(v75, v76, &v102);
    sub_1A4CBB36C();
    swift_bridgeObjectRelease();
    v73((char *)v74, v8);
    os_log_t v77 = v97;
    _os_log_impl(&dword_1A4AF7000, v97, (os_log_type_t)v98, "Dropping service for sending result %s because task's startTime (%s) is older than the chat's last known start time (%s)", (uint8_t *)v69, 0x20u);
    uint64_t v78 = v99;
    swift_arrayDestroy();
    MEMORY[0x1A6264920](v78, -1, -1);
    MEMORY[0x1A6264920](v69, -1, -1);

    return ((uint64_t (*)(char **, char **))v73)(v20, v8);
  }
  else
  {

    v79 = *(void (**)(uint64_t, char **))(v9 + 8);
    v79(v30, v8);
    v79((uint64_t)v15, v8);
    swift_bridgeObjectRelease_n();
    return ((uint64_t (*)(char **, char **))v79)(v20, v8);
  }
}

uint64_t sub_1A4CA7968()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1A4CA79A0()
{
  uint64_t v1 = sub_1A4CBAEAC();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x1F4186498](v0, v5, v6);
}

void sub_1A4CA7A6C(char **a1)
{
  uint64_t v3 = *(void *)(sub_1A4CBAEAC() - 8);
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  sub_1A4CA69FC(a1, v4, v5);
}

uint64_t sub_1A4CA7AE0()
{
  if (objc_msgSend(v0, sel_valueForChatProperty_, @"smsHandshakeState"))
  {
    sub_1A4CBB39C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v3, 0, sizeof(v3));
  }
  sub_1A4B0B9B8((uint64_t)v3, (uint64_t)v4);
  if (v5)
  {
    if (swift_dynamicCast()) {
      return v2;
    }
  }
  else
  {
    sub_1A4B0E2A4((uint64_t)v4, &qword_1EB3F2040);
  }
  return 0;
}

uint64_t sub_1A4CA7BAC()
{
  id v1 = objc_msgSend(v0, sel_participants);
  sub_1A4B0C510(0, (unint64_t *)&qword_1E965B670);
  unint64_t v2 = sub_1A4CBB15C();

  if (!(v2 >> 62))
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v3) {
      goto LABEL_3;
    }
LABEL_10:
    swift_bridgeObjectRelease_n();
    return 0;
  }
LABEL_18:
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_1A4CBB4CC();
  if (!v3) {
    goto LABEL_10;
  }
LABEL_3:
  id v23 = self;
  uint64_t v4 = 4;
  while (1)
  {
    if ((v2 & 0xC000000000000001) != 0) {
      id v5 = (id)MEMORY[0x1A6262970](v4 - 4, v2);
    }
    else {
      id v5 = *(id *)(v2 + 8 * v4);
    }
    uint64_t v6 = v5;
    uint64_t v7 = v4 - 3;
    if (__OFADD__(v4 - 4, 1))
    {
      __break(1u);
      goto LABEL_18;
    }
    id v8 = [v5 ID];
    sub_1A4CBB0CC();

    uint64_t v9 = (void *)sub_1A4CBB0BC();
    swift_bridgeObjectRelease();
    sub_1A4CBB0CC();
    uint64_t v10 = (void *)sub_1A4CBB0BC();
    swift_bridgeObjectRelease();
    id v11 = objc_msgSend(v23, sel_mapID_usingKey_, v9, v10);

    uint64_t v12 = sub_1A4CBB0CC();
    unint64_t v14 = v13;

    uint64_t v15 = (void *)sub_1A4CBB0BC();
    LODWORD(v10) = IMStringIsEmail();

    if (v10) {
      break;
    }
    swift_bridgeObjectRelease();
    ++v4;
    if (v7 == v3) {
      goto LABEL_10;
    }
  }
  if (qword_1E965B5E8 != -1) {
    swift_once();
  }
  uint64_t v18 = sub_1A4CBB03C();
  sub_1A4B0C4D8(v18, (uint64_t)qword_1E965B5C8);
  swift_bridgeObjectRetain_n();
  uint64_t v19 = sub_1A4CBB01C();
  os_log_type_t v20 = sub_1A4CBB24C();
  if (os_log_type_enabled(v19, v20))
  {
    id v21 = (uint8_t *)swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    uint64_t v24 = v22;
    *(_DWORD *)id v21 = 136315138;
    swift_bridgeObjectRetain();
    sub_1A4B0BCCC(v12, v14, &v24);
    sub_1A4CBB36C();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1A4AF7000, v19, v20, "%s was email, so not retargeting", v21, 0xCu);
    uint64_t v16 = 1;
    swift_arrayDestroy();
    MEMORY[0x1A6264920](v22, -1, -1);
    MEMORY[0x1A6264920](v21, -1, -1);
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease_n();

    swift_bridgeObjectRelease_n();
    return 1;
  }
  return v16;
}

void *sub_1A4CA7F50()
{
  id v1 = objc_msgSend(v0, sel_lastAddressedHandleID);
  if (v1)
  {
    unint64_t v2 = v1;
    id v3 = objc_msgSend(self, sel_mapID_usingKey_, v1, *MEMORY[0x1E4F6EB38]);

    uint64_t v4 = sub_1A4CBB0CC();
    unint64_t v6 = v5;

    uint64_t v7 = HIBYTE(v6) & 0xF;
    if ((v6 & 0x2000000000000000) == 0) {
      uint64_t v7 = v4 & 0xFFFFFFFFFFFFLL;
    }
    if (v7)
    {
LABEL_9:
      id v11 = (void *)sub_1A4CBB0BC();
      swift_bridgeObjectRelease();
      IsEmail = (void *)IMStringIsEmail();

      return IsEmail;
    }
    swift_bridgeObjectRelease();
  }
  id v8 = objc_msgSend(v0, sel_account);
  IsEmail = v8;
  if (v8)
  {
    id v10 = objc_msgSend(v8, sel_displayName);

    if (!v10) {
      return 0;
    }
    sub_1A4CBB0CC();

    goto LABEL_9;
  }
  return IsEmail;
}

uint64_t sub_1A4CA8088()
{
  id v1 = v0;
  id v2 = objc_msgSend(v0, sel_account);
  id v3 = objc_msgSend(v2, sel_service);

  sub_1A4B0C510(0, (unint64_t *)&qword_1EB3F1FE8);
  id v4 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_iMessageService);
  unint64_t v5 = v4;
  if (v3)
  {
    if (v4)
    {
      id v6 = v3;
      char v7 = sub_1A4CBB35C();

      if (v7) {
        goto LABEL_7;
      }
    }
    else
    {
    }
    return 1;
  }
  if (v4)
  {

    return 1;
  }
LABEL_7:
  if (!objc_msgSend(v1, sel_isGroupChat)
    || (sub_1A4CA7BAC() & 1) == 0 && (sub_1A4CA7F50() & 1) == 0)
  {
    return 1;
  }
  if (qword_1E965B5E8 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_1A4CBB03C();
  sub_1A4B0C4D8(v8, (uint64_t)qword_1E965B5C8);
  id v9 = v1;
  id v10 = sub_1A4CBB01C();
  os_log_type_t v11 = sub_1A4CBB24C();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    unint64_t v13 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 138412290;
    id v14 = v9;
    sub_1A4CBB36C();
    *unint64_t v13 = v9;

    _os_log_impl(&dword_1A4AF7000, v10, v11, "This group contains emails, don't downgrade: %@", v12, 0xCu);
    sub_1A4B0E048(&qword_1E965B5C0);
    swift_arrayDestroy();
    MEMORY[0x1A6264920](v13, -1, -1);
    MEMORY[0x1A6264920](v12, -1, -1);
  }
  else
  {
  }
  return 0;
}

uint64_t sub_1A4CA8310(void *a1)
{
  id v2 = v1;
  id v4 = objc_msgSend(v1, sel_account);
  id v5 = objc_msgSend(v4, sel_service);

  sub_1A4B0C510(0, (unint64_t *)&qword_1EB3F1FE8);
  id v6 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_rcsService);
  char v7 = v6;
  if (v5)
  {
    if (!v6)
    {

      return 1;
    }
    id v8 = v5;
    char v9 = sub_1A4CBB35C();

    if ((v9 & 1) == 0) {
      return 1;
    }
  }
  else if (v6)
  {

    return 1;
  }
  id v11 = objc_msgSend(v2, sel_account);
  if (v11)
  {
    uint64_t v12 = v11;
    id v13 = objc_msgSend(v11, sel_login);

    if (v13)
    {
      sub_1A4CBB0CC();

      id v13 = (id)sub_1A4CBB0BC();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    id v13 = 0;
  }
  id v14 = self;
  id v15 = objc_msgSend(v2, sel_lastAddressedSIMID);
  signed int v16 = objc_msgSend(v14, sel_IMMMSMaxRecipientsForPhoneNumber_simID_, v13, v15);

  id v17 = objc_msgSend(a1, sel_bestResult);
  if (!v17) {
    return 1;
  }
  uint64_t v18 = v17;
  id v19 = objc_msgSend(v17, sel_service);

  uint64_t v20 = sub_1A4CBB0CC();
  uint64_t v22 = v21;

  if (v20 != sub_1A4CBB0CC() || v22 != v23)
  {
    char v24 = sub_1A4CBB5EC();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v24) {
      goto LABEL_17;
    }
    return 1;
  }
  swift_bridgeObjectRelease_n();
LABEL_17:
  if (!objc_msgSend(v2, sel_isGroupChat)) {
    return 1;
  }
  id v25 = objc_msgSend(v2, sel_participantsWithState_, 16);
  sub_1A4B0C510(0, (unint64_t *)&qword_1E965B670);
  unint64_t v26 = sub_1A4CBB15C();

  if (v26 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v27 = sub_1A4CBB4CC();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v27 = *(void *)((v26 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v27 <= v16) {
    return 1;
  }
  if (qword_1E965B5E8 != -1) {
    swift_once();
  }
  uint64_t v28 = sub_1A4CBB03C();
  sub_1A4B0C4D8(v28, (uint64_t)qword_1E965B5C8);
  id v29 = v2;
  uint64_t v30 = sub_1A4CBB01C();
  os_log_type_t v31 = sub_1A4CBB24C();
  if (os_log_type_enabled(v30, v31))
  {
    os_log_type_t v32 = (uint8_t *)swift_slowAlloc();
    uint64_t v33 = (void *)swift_slowAlloc();
    *(_DWORD *)os_log_type_t v32 = 138412290;
    id v34 = v29;
    sub_1A4CBB36C();
    *uint64_t v33 = v29;

    _os_log_impl(&dword_1A4AF7000, v30, v31, "This group contains more participants than MMS allows, don't downgrade: %@", v32, 0xCu);
    sub_1A4B0E048(&qword_1E965B5C0);
    swift_arrayDestroy();
    MEMORY[0x1A6264920](v33, -1, -1);
    MEMORY[0x1A6264920](v32, -1, -1);
  }
  else
  {
  }
  return 0;
}

void sub_1A4CA8798(void *a1)
{
  id v2 = objc_msgSend(a1, sel_ktData);
  if (v2)
  {
    id v3 = v2;
    sub_1A4B0C510(0, (unint64_t *)&unk_1E965B620);
    uint64_t v4 = sub_1A4CBB0AC();

    id v5 = objc_msgSend(self, sel_sharedController);
    sub_1A4CA95C8(v4);
    swift_bridgeObjectRelease();
    id v6 = (void *)sub_1A4CBB09C();
    swift_bridgeObjectRelease();
    objc_msgSend(v5, sel_setKTVerifierResultsFromIDSInfoResultsDictionary_, v6);
  }
  id v7 = objc_msgSend(a1, sel_selfKTData);
  if (v7)
  {
    id v8 = v7;
    id v9 = objc_msgSend(self, sel_sharedController);
    sub_1A4B0E048(&qword_1E965B6D8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1A4CD16F0;
    id v11 = objc_msgSend(v8, sel_uri);
    uint64_t v12 = sub_1A4CBB0CC();
    uint64_t v14 = v13;

    *(void *)(inited + 32) = v12;
    *(void *)(inited + 40) = v14;
    *(void *)(inited + 72) = sub_1A4B0C510(0, (unint64_t *)&unk_1E965B620);
    *(void *)(inited + 48) = v8;
    id v15 = v8;
    sub_1A4B35210(inited);
    signed int v16 = (void *)sub_1A4CBB09C();
    swift_bridgeObjectRelease();
    objc_msgSend(v9, sel_setKTVerifierResultsFromIDSInfoResultsDictionary_, v16);
  }
}

unint64_t sub_1A4CA89C0()
{
  unint64_t result = qword_1E965DBF8;
  if (!qword_1E965DBF8)
  {
    sub_1A4CBAEAC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E965DBF8);
  }
  return result;
}

uint64_t sub_1A4CA8A18(char a1, uint64_t a2, unint64_t a3)
{
  if (a1 == 5) {
    return 0;
  }
  unint64_t v5 = a2 + a3;
  if (__CFADD__(a2, a3))
  {
    __break(1u);
    goto LABEL_7;
  }
  sub_1A4CA0908();
  sub_1A4CBB2DC();
  sub_1A4CBB43C();
  sub_1A4CA0948();
  sub_1A4CBB38C();
  swift_bridgeObjectRelease();
  sub_1A4CBB0FC();
  swift_bridgeObjectRelease();
  sub_1A4CBB0FC();
  sub_1A4CBB0FC();
  swift_bridgeObjectRelease();
  sub_1A4CBB0FC();
  sub_1A4CBB5BC();
  sub_1A4CBB0FC();
  swift_bridgeObjectRelease();
  sub_1A4CBB0FC();
  sub_1A4CBB5BC();
  sub_1A4CBB0FC();
  swift_bridgeObjectRelease();
  sub_1A4CBB0FC();
  if (v5 < a3)
  {
LABEL_7:
    __break(1u);
    JUMPOUT(0x1A4CA8CF4);
  }
  sub_1A4CBB5BC();
  sub_1A4CBB0FC();
  swift_bridgeObjectRelease();
  sub_1A4CBB0FC();
  return 0;
}

ValueMetadata *type metadata accessor for SyncStoreCounts()
{
  return &type metadata for SyncStoreCounts;
}

uint64_t sub_1A4CA8D18(void *a1, char a2, uint64_t a3)
{
  v11[1] = a3;
  uint64_t v6 = sub_1A4B0E048(&qword_1E965DC10);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  id v9 = (char *)v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A4B0BC88(a1, a1[3]);
  sub_1A4CA9368();
  sub_1A4CBB67C();
  char v15 = a2;
  char v14 = 0;
  sub_1A4CA1534();
  sub_1A4CBB58C();
  if (!v3)
  {
    char v13 = 1;
    sub_1A4CBB59C();
    char v12 = 2;
    sub_1A4CBB59C();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_1A4CA8EC4()
{
  uint64_t v1 = 0x656C626174697277;
  if (*v0 != 1) {
    uint64_t v1 = 0x6E657474697277;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x707954746E756F63;
  }
}

uint64_t sub_1A4CA8F24@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A4CA9020(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A4CA8F4C(uint64_t a1)
{
  unint64_t v2 = sub_1A4CA9368();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A4CA8F88(uint64_t a1)
{
  unint64_t v2 = sub_1A4CA9368();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A4CA8FC4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_1A4CA9184(a1);
  if (!v2)
  {
    *(unsigned char *)a2 = result;
    *(void *)(a2 + 8) = v5;
    *(void *)(a2 + 16) = v6;
  }
  return result;
}

uint64_t sub_1A4CA8FF4(void *a1)
{
  return sub_1A4CA8D18(a1, *(unsigned char *)v1, *(void *)(v1 + 8));
}

uint64_t sub_1A4CA9014()
{
  return sub_1A4CA8A18(*(unsigned char *)v0, *(void *)(v0 + 8), *(void *)(v0 + 16));
}

uint64_t sub_1A4CA9020(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x707954746E756F63 && a2 == 0xE900000000000065;
  if (v2 || (sub_1A4CBB5EC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656C626174697277 && a2 == 0xE800000000000000 || (sub_1A4CBB5EC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6E657474697277 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_1A4CBB5EC();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_1A4CA9184(void *a1)
{
  uint64_t v2 = sub_1A4B0E048(&qword_1E965DC00);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = &v8[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1A4B0BC88(a1, a1[3]);
  sub_1A4CA9368();
  sub_1A4CBB66C();
  v8[14] = 0;
  sub_1A4CA14E0();
  sub_1A4CBB55C();
  uint64_t v6 = v8[15];
  v8[13] = 1;
  sub_1A4CBB56C();
  v8[12] = 2;
  sub_1A4CBB56C();
  (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
  sub_1A4B0BDA0((uint64_t)a1);
  return v6;
}

unint64_t sub_1A4CA9368()
{
  unint64_t result = qword_1E965DC08;
  if (!qword_1E965DC08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E965DC08);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for SyncStoreCounts.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 2;
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
        JUMPOUT(0x1A4CA9488);
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
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SyncStoreCounts.CodingKeys()
{
  return &type metadata for SyncStoreCounts.CodingKeys;
}

unint64_t sub_1A4CA94C4()
{
  unint64_t result = qword_1E965DC18;
  if (!qword_1E965DC18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E965DC18);
  }
  return result;
}

unint64_t sub_1A4CA951C()
{
  unint64_t result = qword_1E965DC20;
  if (!qword_1E965DC20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E965DC20);
  }
  return result;
}

unint64_t sub_1A4CA9574()
{
  unint64_t result = qword_1E965DC28;
  if (!qword_1E965DC28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E965DC28);
  }
  return result;
}

unint64_t sub_1A4CA95C8(uint64_t a1)
{
  uint64_t v1 = a1;
  if (*(void *)(a1 + 16))
  {
    sub_1A4B0E048((uint64_t *)&unk_1E965B6B0);
    uint64_t v2 = (void *)sub_1A4CBB4FC();
  }
  else
  {
    uint64_t v2 = (void *)MEMORY[0x1E4FBC868];
  }
  uint64_t v33 = v1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(v1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(v1 + 64);
  int64_t v32 = (unint64_t)(63 - v3) >> 6;
  unsigned int v6 = &v38;
  uint64_t v7 = &v40;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t v34 = 0;
  id v9 = (unint64_t *)&unk_1E965B620;
  unint64_t v10 = 0x1E4F6B4A8uLL;
  if (v5) {
    goto LABEL_10;
  }
LABEL_11:
  int64_t v19 = v34 + 1;
  if (__OFADD__(v34, 1)) {
    goto LABEL_35;
  }
  if (v19 >= v32) {
    goto LABEL_32;
  }
  unint64_t v20 = *(void *)(v33 + 8 * v19);
  int64_t v21 = v34 + 1;
  if (!v20)
  {
    int64_t v21 = v34 + 2;
    if (v34 + 2 >= v32) {
      goto LABEL_32;
    }
    unint64_t v20 = *(void *)(v33 + 8 * v21);
    if (!v20)
    {
      int64_t v21 = v34 + 3;
      if (v34 + 3 >= v32) {
        goto LABEL_32;
      }
      unint64_t v20 = *(void *)(v33 + 8 * v21);
      if (!v20)
      {
        int64_t v21 = v34 + 4;
        if (v34 + 4 >= v32) {
          goto LABEL_32;
        }
        unint64_t v20 = *(void *)(v33 + 8 * v21);
        if (!v20)
        {
          int64_t v22 = v34 + 5;
          if (v34 + 5 < v32)
          {
            unint64_t v20 = *(void *)(v33 + 8 * v22);
            if (v20)
            {
              int64_t v21 = v34 + 5;
              goto LABEL_26;
            }
            while (1)
            {
              int64_t v21 = v22 + 1;
              if (__OFADD__(v22, 1)) {
                goto LABEL_36;
              }
              if (v21 >= v32) {
                break;
              }
              unint64_t v20 = *(void *)(v33 + 8 * v21);
              ++v22;
              if (v20) {
                goto LABEL_26;
              }
            }
          }
LABEL_32:
          sub_1A4C990AC();
          return (unint64_t)v2;
        }
      }
    }
  }
LABEL_26:
  int64_t v34 = v21;
  uint64_t v35 = (v20 - 1) & v20;
  for (unint64_t i = __clz(__rbit64(v20)) + (v21 << 6); ; unint64_t i = __clz(__rbit64(v5)) | (v34 << 6))
  {
    uint64_t v23 = (uint64_t *)(*(void *)(v1 + 48) + 16 * i);
    char v24 = *(void **)(*(void *)(v1 + 56) + 8 * i);
    uint64_t v36 = *v23;
    uint64_t v37 = v23[1];
    sub_1A4B0C510(0, v9);
    swift_bridgeObjectRetain();
    id v25 = v24;
    swift_dynamicCast();
    sub_1A4B0C5E4(v6, v7);
    sub_1A4B0C5E4(v7, v41);
    sub_1A4B0C5E4(v41, &v39);
    unint64_t result = sub_1A4AFB26C(v36, v37);
    unint64_t v26 = result;
    if (v27)
    {
      id v11 = v7;
      char v12 = v6;
      uint64_t v13 = v1;
      unint64_t v14 = v10;
      char v15 = v9;
      signed int v16 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *signed int v16 = v36;
      v16[1] = v37;
      id v9 = v15;
      unint64_t v10 = v14;
      uint64_t v1 = v13;
      unsigned int v6 = v12;
      uint64_t v7 = v11;
      id v17 = (_OWORD *)(v2[7] + 32 * v26);
      sub_1A4B0BDA0((uint64_t)v17);
      unint64_t result = (unint64_t)sub_1A4B0C5E4(&v39, v17);
      unint64_t v5 = v35;
      if (!v35) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v28 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v28 = v36;
    v28[1] = v37;
    unint64_t result = (unint64_t)sub_1A4B0C5E4(&v39, (_OWORD *)(v2[7] + 32 * result));
    uint64_t v29 = v2[2];
    BOOL v30 = __OFADD__(v29, 1);
    uint64_t v31 = v29 + 1;
    if (v30) {
      goto LABEL_34;
    }
    v2[2] = v31;
    unint64_t v5 = v35;
    if (!v35) {
      goto LABEL_11;
    }
LABEL_10:
    uint64_t v35 = (v5 - 1) & v5;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_1A4CA9948(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_1A4B0E048(&qword_1E965B6C0);
    uint64_t v2 = sub_1A4CBB4FC();
  }
  else
  {
    uint64_t v2 = MEMORY[0x1E4FBC868];
  }
  uint64_t v27 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v26 = (unint64_t)(63 - v3) >> 6;
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
    if (v13 >= v26) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v27 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v26) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v27 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v26) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v27 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v26) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v27 + 8 * v15);
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
    id v17 = (void *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v18 = v17[1];
    *(void *)&v36[0] = *v17;
    *((void *)&v36[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_1A4B0E048(&qword_1E965B618);
    swift_dynamicCast();
    long long v32 = v28;
    long long v33 = v29;
    uint64_t v34 = v30;
    sub_1A4B0C5E4(&v31, v35);
    long long v28 = v32;
    long long v29 = v33;
    uint64_t v30 = v34;
    sub_1A4B0C5E4(v35, v36);
    sub_1A4B0C5E4(v36, &v32);
    uint64_t result = sub_1A4CBB3DC();
    uint64_t v19 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v6 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v20) & ~*(void *)(v6 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
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
        uint64_t v25 = *(void *)(v6 + 8 * v21);
      }
      while (v25 == -1);
      unint64_t v9 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(void *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    uint64_t v10 = *(void *)(v2 + 48) + 40 * v9;
    *(_OWORD *)uint64_t v10 = v28;
    *(_OWORD *)(v10 + 16) = v29;
    *(void *)(v10 + 32) = v30;
    uint64_t result = (uint64_t)sub_1A4B0C5E4(&v32, (_OWORD *)(*(void *)(v2 + 56) + 32 * v9));
    ++*(void *)(v2 + 16);
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v26)
  {
LABEL_37:
    swift_release();
    sub_1A4C990AC();
    return v2;
  }
  unint64_t v14 = *(void *)(v27 + 8 * v16);
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
    if (v15 >= v26) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v27 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_1A4CA9D44()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___IMKeyTransparencyController_state);
  swift_getKeyPath();
  swift_retain();
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v1 + 40));
  sub_1A4CAC180((unsigned __int8 *)(v1 + 16), &v4);
  os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 40));
  uint64_t v2 = v4;
  swift_release();
  swift_release_n();
  return v2;
}

uint64_t sub_1A4CA9E00()
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_getAtKeyPath();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v1;
}

void *sub_1A4CA9EE4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(v2 + OBJC_IVAR___IMKeyTransparencyController_state);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v5 + 40));
  uint64_t v6 = *(void *)(v5 + 24);
  if (*(void *)(v6 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v7 = sub_1A4AFB26C(a1, a2);
    if (v8)
    {
      unint64_t v9 = *(void **)(*(void *)(v6 + 56) + 8 * v7);
      id v10 = v9;
    }
    else
    {
      unint64_t v9 = 0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v9 = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 40));
  swift_release();
  return v9;
}

uint64_t sub_1A4CA9FAC(uint64_t a1, void *a2, uint64_t a3, unint64_t a4)
{
  if (qword_1E965B700 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_1A4CBB03C();
  sub_1A4B0C4D8(v8, (uint64_t)qword_1E965B6E0);
  id v9 = a2;
  swift_bridgeObjectRetain_n();
  id v10 = v9;
  unint64_t v11 = sub_1A4CBB01C();
  os_log_type_t v12 = sub_1A4CBB24C();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v19 = a3;
    uint64_t v14 = swift_slowAlloc();
    uint64_t v20 = v14;
    *(_DWORD *)uint64_t v13 = 134218242;
    objc_msgSend(v10, sel_uiStatus);

    sub_1A4CBB36C();
    *(_WORD *)(v13 + 12) = 2080;
    swift_bridgeObjectRetain();
    sub_1A4B0BCCC(v19, a4, &v20);
    sub_1A4CBB36C();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1A4AF7000, v11, v12, "Setting KTVerifierResult with uiStatus: %lu for handle: %s", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    uint64_t v15 = v14;
    a3 = v19;
    MEMORY[0x1A6264920](v15, -1, -1);
    MEMORY[0x1A6264920](v13, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  id v16 = v10;
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v20 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = 0x8000000000000000;
  sub_1A4C9BFB4((uint64_t)v16, a3, a4, isUniquelyReferenced_nonNull_native);
  *(void *)(a1 + 8) = v20;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *sub_1A4CAA248(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(v2 + OBJC_IVAR___IMKeyTransparencyController_state);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v5 + 40));
  uint64_t v6 = *(void *)(v5 + 32);
  if (*(void *)(v6 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v7 = sub_1A4AFB26C(a1, a2);
    if (v8)
    {
      id v9 = *(void **)(*(void *)(v6 + 56) + 8 * v7);
      id v10 = v9;
    }
    else
    {
      id v9 = 0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    id v9 = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 40));
  swift_release();
  return v9;
}

id sub_1A4CAA310(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v6 = sub_1A4CBB0CC();
  uint64_t v8 = v7;
  id v9 = a1;
  id v10 = (void *)a4(v6, v8);

  swift_bridgeObjectRelease();

  return v10;
}

uint64_t sub_1A4CAA388(uint64_t a1, id a2, uint64_t a3, unint64_t a4)
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v8 = objc_msgSend(a2, sel_ktData);
  if (v8
    && (id v9 = v8, v10 = objc_msgSend(v8, sel_verifierResult), v9, v10))
  {
    objc_msgSend(v10, sel_uiStatus);

    if (qword_1E965B700 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_1A4CBB03C();
    sub_1A4B0C4D8(v11, (uint64_t)qword_1E965B6E0);
    swift_bridgeObjectRetain_n();
    os_log_type_t v12 = sub_1A4CBB01C();
    os_log_type_t v13 = sub_1A4CBB24C();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = swift_slowAlloc();
      uint64_t v30 = swift_slowAlloc();
      v32[0] = v30;
      *(_DWORD *)uint64_t v14 = 134218242;
      sub_1A4CBB36C();
      *(_WORD *)(v14 + 12) = 2080;
      swift_bridgeObjectRetain();
      sub_1A4B0BCCC(a3, a4, v32);
      sub_1A4CBB36C();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1A4AF7000, v12, v13, "Setting IDSIDInfoResult with uiStatus: %lu for handle: %s", (uint8_t *)v14, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1A6264920](v30, -1, -1);
      MEMORY[0x1A6264920](v14, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
  else
  {
    if (qword_1E965B700 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_1A4CBB03C();
    sub_1A4B0C4D8(v15, (uint64_t)qword_1E965B6E0);
    id v16 = a2;
    swift_bridgeObjectRetain_n();
    id v17 = v16;
    uint64_t v18 = sub_1A4CBB01C();
    os_log_type_t v19 = sub_1A4CBB24C();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = swift_slowAlloc();
      long long v31 = (void *)swift_slowAlloc();
      uint64_t v28 = swift_slowAlloc();
      v32[0] = v28;
      *(_DWORD *)uint64_t v20 = 136315650;
      swift_bridgeObjectRetain();
      uint64_t v29 = a3;
      sub_1A4B0BCCC(a3, a4, v32);
      sub_1A4CBB36C();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v20 + 12) = 2112;
      id v21 = objc_msgSend(v17, sel_ktData);
      sub_1A4CBB36C();
      *long long v31 = v21;

      *(_WORD *)(v20 + 22) = 2112;
      id v22 = objc_msgSend(v17, sel_ktData);
      if (v22
        && (unint64_t v23 = v22,
            id v24 = objc_msgSend(v22, sel_verifierResult),
            v23,
            v24))
      {
        sub_1A4CBB36C();
      }
      else
      {
        sub_1A4CBB36C();
        id v24 = 0;
      }
      v31[1] = v24;

      _os_log_impl(&dword_1A4AF7000, v18, v19, "IDSIDInfoResult did not have a UIStatus for handle: %s. ktData %@ verifierResult %@", (uint8_t *)v20, 0x20u);
      sub_1A4B0E048(&qword_1E965B5C0);
      swift_arrayDestroy();
      MEMORY[0x1A6264920](v31, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x1A6264920](v28, -1, -1);
      MEMORY[0x1A6264920](v20, -1, -1);

      a3 = v29;
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
  id v25 = a2;
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v32[0] = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = 0x8000000000000000;
  sub_1A4C9C148((uint64_t)v25, a3, a4, isUniquelyReferenced_nonNull_native);
  *(void *)(a1 + 16) = v32[0];
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1A4CAA948(char *a1, uint64_t a2, void *a3, uint64_t a4, void (*a5)(os_unfair_lock_s *, id, uint64_t, uint64_t))
{
  uint64_t v8 = sub_1A4CBB0CC();
  uint64_t v10 = v9;
  uint64_t v11 = *(os_unfair_lock_s **)&a1[OBJC_IVAR___IMKeyTransparencyController_state];
  id v12 = a3;
  os_log_type_t v13 = a1;
  swift_retain();
  os_unfair_lock_lock(v11 + 10);
  a5(v11 + 4, v12, v8, v10);
  os_unfair_lock_unlock(v11 + 10);

  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t sub_1A4CAAA24(uint64_t a1, unint64_t a2, void *a3)
{
  unsigned __int8 v4 = v3;
  uint64_t v8 = (void *)sub_1A4CBB0BC();
  id v9 = objc_msgSend(v4, sel_ktVerifierResultForHandleID_, v8);

  if (v9)
  {
    id v10 = objc_msgSend(v4, sel_verifier);
    sub_1A4B0E048(&qword_1E965DC50);
    uint64_t v11 = swift_allocObject();
    *(_OWORD *)(v11 + 16) = xmmword_1A4CD2000;
    *(void *)(v11 + 32) = v9;
    uint64_t v23 = v11;
    sub_1A4CBB17C();
    sub_1A4B0C510(0, &qword_1E965DC58);
    id v12 = v9;
    os_log_type_t v13 = (void *)sub_1A4CBB14C();
    swift_bridgeObjectRelease();
    id v14 = objc_msgSend(v10, sel_getDisplayStatusForResults_isSelfOptedIn_, v13, objc_msgSend(v4, sel_selfOptedIn));

    if (a3) {
      unsigned int v15 = objc_msgSend(a3, sel_isLastIncomingFinishedMessageNotiMessage) ^ 1;
    }
    else {
      unsigned int v15 = 1;
    }
    uint64_t v21 = IMKeyTransparencyStatusFromKTUIStatus((uint64_t)v14, v15);

    return v21;
  }
  else
  {
    if (qword_1E965B700 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_1A4CBB03C();
    sub_1A4B0C4D8(v16, (uint64_t)qword_1E965B6E0);
    swift_bridgeObjectRetain_n();
    id v17 = sub_1A4CBB01C();
    os_log_type_t v18 = sub_1A4CBB24C();
    if (os_log_type_enabled(v17, v18))
    {
      os_log_type_t v19 = (uint8_t *)swift_slowAlloc();
      uint64_t v20 = swift_slowAlloc();
      uint64_t v23 = v20;
      *(_DWORD *)os_log_type_t v19 = 136315138;
      swift_bridgeObjectRetain();
      sub_1A4B0BCCC(a1, a2, &v23);
      sub_1A4CBB36C();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1A4AF7000, v17, v18, "Could not find a verifier result for handleID: %s returning pending status", v19, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1A6264920](v20, -1, -1);
      MEMORY[0x1A6264920](v19, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return 2;
  }
}

void sub_1A4CAAD80(uint64_t a1)
{
  uint64_t v44 = a1 + 64;
  uint64_t v2 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v3 = -1;
  if (v2 < 64) {
    uint64_t v3 = ~(-1 << v2);
  }
  unint64_t v4 = v3 & *(void *)(a1 + 64);
  unint64_t v5 = (unint64_t)(v2 + 63) >> 6;
  unint64_t v40 = v5 - 1;
  unint64_t v6 = 0;
  int64_t v46 = v5;
  uint64_t v41 = swift_bridgeObjectRetain() + 104;
  unint64_t v42 = v5 - 5;
  uint64_t v43 = (void *)MEMORY[0x1E4FBC860];
  while (1)
  {
    if (v4)
    {
      unint64_t v7 = __clz(__rbit64(v4));
      v4 &= v4 - 1;
      unint64_t v8 = v7 | (v6 << 6);
      goto LABEL_9;
    }
    int64_t v12 = v6 + 1;
    if (__OFADD__(v6, 1)) {
      break;
    }
    if (v12 >= v46)
    {
      unint64_t v14 = v6;
LABEL_15:
      unint64_t v4 = 0;
      memset(v50, 0, sizeof(v50));
      unint64_t v6 = v14;
      long long v49 = 0u;
      goto LABEL_16;
    }
    unint64_t v13 = *(void *)(v44 + 8 * v12);
    if (!v13)
    {
      unint64_t v14 = v6 + 1;
      if ((uint64_t)(v6 + 2) >= v46) {
        goto LABEL_15;
      }
      unint64_t v13 = *(void *)(v44 + 8 * (v6 + 2));
      if (v13)
      {
        int64_t v12 = v6 + 2;
      }
      else
      {
        unint64_t v14 = v6 + 2;
        if ((uint64_t)(v6 + 3) >= v46) {
          goto LABEL_15;
        }
        unint64_t v13 = *(void *)(v44 + 8 * (v6 + 3));
        if (v13)
        {
          int64_t v12 = v6 + 3;
        }
        else
        {
          int64_t v12 = v6 + 4;
          unint64_t v14 = v6 + 3;
          if ((uint64_t)(v6 + 4) >= v46) {
            goto LABEL_15;
          }
          unint64_t v13 = *(void *)(v44 + 8 * v12);
          if (!v13)
          {
            while (v42 != v6)
            {
              unint64_t v13 = *(void *)(v41 + 8 * v6++);
              if (v13)
              {
                int64_t v12 = v6 + 4;
                goto LABEL_13;
              }
            }
            unint64_t v14 = v40;
            goto LABEL_15;
          }
        }
      }
    }
LABEL_13:
    unint64_t v4 = (v13 - 1) & v13;
    unint64_t v8 = __clz(__rbit64(v13)) + (v12 << 6);
    unint64_t v6 = v12;
LABEL_9:
    uint64_t v9 = *(void *)(a1 + 56);
    id v10 = (void *)(*(void *)(a1 + 48) + 16 * v8);
    uint64_t v11 = v10[1];
    *(void *)&long long v49 = *v10;
    *((void *)&v49 + 1) = v11;
    sub_1A4B0E248(v9 + 32 * v8, (uint64_t)v50);
    swift_bridgeObjectRetain();
LABEL_16:
    sub_1A4CAB534((uint64_t)&v49, (uint64_t)v51);
    if (!v51[1])
    {
      swift_release();
      sub_1A4CABDDC((uint64_t)v43);
      swift_bridgeObjectRelease();
      return;
    }
    sub_1A4B0C5E4(&v52, &v49);
    unsigned int v15 = (void *)sub_1A4CBB0BC();
    swift_bridgeObjectRelease();
    id v16 = objc_msgSend(v15, sel__stripFZIDPrefix);

    if (v16)
    {
      uint64_t v17 = sub_1A4CBB0CC();
      unint64_t v19 = v18;
      sub_1A4B0E248((uint64_t)&v49, (uint64_t)v48);
      sub_1A4B0C510(0, (unint64_t *)&unk_1E965B620);
      if (!swift_dynamicCast())
      {

        if (qword_1E965B700 != -1) {
          swift_once();
        }
        uint64_t v28 = sub_1A4CBB03C();
        sub_1A4B0C4D8(v28, (uint64_t)qword_1E965B6E0);
        swift_bridgeObjectRetain();
        uint64_t v29 = sub_1A4CBB01C();
        os_log_type_t v30 = sub_1A4CBB24C();
        if (os_log_type_enabled(v29, v30))
        {
          uint64_t v31 = swift_slowAlloc();
          uint64_t v32 = swift_slowAlloc();
          v48[0] = v32;
          *(_DWORD *)uint64_t v31 = 136315138;
          swift_bridgeObjectRetain();
          *(void *)(v31 + 4) = sub_1A4B0BCCC(v17, v19, v48);
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_1A4AF7000, v29, v30, "No IDSIDInfoResult found in IDS query results for handle: %s", (uint8_t *)v31, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x1A6264920](v32, -1, -1);
          MEMORY[0x1A6264920](v31, -1, -1);
        }
        else
        {
          swift_bridgeObjectRelease_n();
        }

        goto LABEL_6;
      }
      objc_msgSend(v45, sel_setIDSIDInfoResult_forHandleID_, v47, v16);
      id v20 = objc_msgSend(v47, sel_ktData);
      if (!v20
        || (uint64_t v21 = v20,
            id v22 = objc_msgSend(v20, sel_verifierResult),
            v21,
            !v22))
      {

        if (qword_1E965B700 != -1) {
          swift_once();
        }
        uint64_t v23 = sub_1A4CBB03C();
        sub_1A4B0C4D8(v23, (uint64_t)qword_1E965B6E0);
        swift_bridgeObjectRetain();
        id v24 = sub_1A4CBB01C();
        os_log_type_t v25 = sub_1A4CBB24C();
        if (os_log_type_enabled(v24, v25))
        {
          uint64_t v26 = swift_slowAlloc();
          uint64_t v27 = swift_slowAlloc();
          v48[0] = v27;
          *(_DWORD *)uint64_t v26 = 136315138;
          swift_bridgeObjectRetain();
          *(void *)(v26 + 4) = sub_1A4B0BCCC(v17, v19, v48);
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_1A4AF7000, v24, v25, "No KTVerifierResult in IDS query results for handle: %s", (uint8_t *)v26, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x1A6264920](v27, -1, -1);
          MEMORY[0x1A6264920](v26, -1, -1);
        }
        else
        {
          swift_bridgeObjectRelease_n();
        }

        goto LABEL_6;
      }
      id v33 = objc_msgSend(v45, sel_ktVerifierResultForHandleID_, v16);
      if ((objc_msgSend(v22, sel_isEqual_, v33) & 1) == 0)
      {
        long long v39 = v33;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v43 = sub_1A4CAB59C(0, v43[2] + 1, 1, v43);
        }
        unint64_t v35 = v43[2];
        unint64_t v34 = v43[3];
        unint64_t v36 = v35 + 1;
        if (v35 >= v34 >> 1)
        {
          uint64_t v38 = sub_1A4CAB59C((void *)(v34 > 1), v35 + 1, 1, v43);
          unint64_t v36 = v35 + 1;
          uint64_t v43 = v38;
        }
        v43[2] = v36;
        uint64_t v37 = &v43[2 * v35];
        v37[4] = v17;
        v37[5] = v19;
        objc_msgSend(v45, sel_setKTVerifierResult_forHandleID_, v22, v16);

        goto LABEL_6;
      }
      sub_1A4B0BDA0((uint64_t)&v49);

      swift_bridgeObjectRelease();
    }
    else
    {
LABEL_6:
      sub_1A4B0BDA0((uint64_t)&v49);
    }
  }
  __break(1u);
}

uint64_t type metadata accessor for IMKeyTransparencyController(uint64_t a1)
{
  return sub_1A4B0C510(a1, &qword_1E965DC48);
}

uint64_t sub_1A4CAB534(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1A4B0E048(&qword_1E965B600);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void *sub_1A4CAB59C(void *result, int64_t a2, char a3, void *a4)
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
      sub_1A4B0E048((uint64_t *)&unk_1EB3F1EF0);
      id v10 = (void *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      unint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      id v10 = (void *)MEMORY[0x1E4FBC860];
      unint64_t v13 = (void *)(MEMORY[0x1E4FBC860] + 32);
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
    sub_1A4CAB6AC(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1A4CAB6AC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_1A4CBB50C();
  __break(1u);
  return result;
}

void sub_1A4CAB7A0(id a1, unint64_t a2)
{
  if (qword_1E965B700 != -1) {
    goto LABEL_40;
  }
  while (1)
  {
    uint64_t v4 = sub_1A4CBB03C();
    sub_1A4B0C4D8(v4, (uint64_t)qword_1E965B6E0);
    swift_bridgeObjectRetain_n();
    unint64_t v5 = sub_1A4CBB01C();
    os_log_type_t v6 = sub_1A4CBB24C();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v8 = swift_slowAlloc();
      v51[0] = v8;
      *(_DWORD *)uint64_t v7 = 136380675;
      swift_bridgeObjectRetain();
      sub_1A4B0BCCC((uint64_t)a1, a2, v51);
      sub_1A4CBB36C();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1A4AF7000, v5, v6, "Received flushed cache for KT Peer URI %{private}s", v7, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1A6264920](v8, -1, -1);
      MEMORY[0x1A6264920](v7, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    uint64_t v9 = (void *)sub_1A4CBB0BC();
    id v10 = objc_msgSend(v9, sel__stripFZIDPrefix);

    if (!v10) {
      break;
    }
    uint64_t v11 = sub_1A4CBB0CC();
    a2 = v12;

    sub_1A4B0E048(&qword_1E965DA68);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1A4CD16F0;
    v51[0] = sub_1A4CBB0CC();
    v51[1] = v14;
    uint64_t v15 = MEMORY[0x1E4FBB1A0];
    sub_1A4CBB3FC();
    *(void *)(inited + 96) = v15;
    uint64_t v50 = v11;
    *(void *)(inited + 72) = v11;
    *(void *)(inited + 80) = a2;
    swift_bridgeObjectRetain();
    sub_1A4C997D4(inited);
    id v16 = objc_msgSend(self, sel_sharedRegistry);
    id v17 = objc_msgSend(v16, sel_cachedChats);

    sub_1A4B0C510(0, (unint64_t *)&unk_1E965DC60);
    unint64_t v18 = sub_1A4CBB15C();

    if (v18 >> 62)
    {
      swift_bridgeObjectRetain();
      a1 = (id)sub_1A4CBB4CC();
      swift_bridgeObjectRelease();
      if (!a1)
      {
LABEL_42:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return;
      }
    }
    else
    {
      a1 = *(id *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (!a1) {
        goto LABEL_42;
      }
    }
    unint64_t v19 = 0;
    unint64_t v47 = v18 & 0xC000000000000001;
    uint64_t v44 = v18 & 0xFFFFFFFFFFFFFF8;
    unint64_t v43 = v18 + 32;
    unint64_t v45 = v18;
    id v46 = a1;
    while (1)
    {
      if (v47)
      {
        id v20 = (id)MEMORY[0x1A6262970](v19, v18);
      }
      else
      {
        if (v19 >= *(void *)(v44 + 16)) {
          goto LABEL_39;
        }
        id v20 = *(id *)(v43 + 8 * v19);
      }
      id v21 = v20;
      BOOL v22 = __OFADD__(v19, 1);
      uint64_t v23 = (void *)(v19 + 1);
      if (v22) {
        goto LABEL_38;
      }
      id v24 = objc_msgSend(v20, sel_participants);
      sub_1A4B0C510(0, (unint64_t *)&qword_1E965B670);
      unint64_t v25 = sub_1A4CBB15C();

      unint64_t v48 = v21;
      id v49 = v23;
      if (v25 >> 62) {
        break;
      }
      uint64_t v26 = *(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v26) {
        goto LABEL_18;
      }
LABEL_9:

      swift_bridgeObjectRelease_n();
LABEL_10:
      unint64_t v18 = v45;
      unint64_t v19 = (unint64_t)v49;
      if (v49 == v46) {
        goto LABEL_42;
      }
    }
    swift_bridgeObjectRetain();
    uint64_t v26 = sub_1A4CBB4CC();
    if (!v26) {
      goto LABEL_9;
    }
LABEL_18:
    a1 = (id)(v25 & 0xC000000000000001);
    uint64_t v27 = 4;
    while (1)
    {
      uint64_t v28 = v27 - 4;
      if (!a1) {
        break;
      }
      id v29 = (id)MEMORY[0x1A6262970](v27 - 4, v25);
      uint64_t v30 = v27 - 3;
      if (__OFADD__(v28, 1)) {
        goto LABEL_37;
      }
LABEL_26:
      id v31 = v29;
      id v32 = [v31 ID];
      sub_1A4CBB0CC();

      id v33 = (void *)sub_1A4CBB0BC();
      id v34 = objc_msgSend(v33, sel__stripFZIDPrefix);

      if (v34)
      {
        uint64_t v35 = sub_1A4CBB0CC();
        uint64_t v37 = v36;
        swift_bridgeObjectRelease();

        if (v35 == v50 && v37 == a2)
        {
          swift_bridgeObjectRelease();
LABEL_34:
          swift_bridgeObjectRelease();
          id v40 = objc_msgSend(self, sel_defaultCenter);
          sub_1A4CBB0CC();
          uint64_t v41 = (void *)sub_1A4CBB0BC();
          swift_bridgeObjectRelease();
          a1 = v48;
          unint64_t v42 = (void *)sub_1A4CBB09C();
          objc_msgSend(v40, sel___mainThreadPostNotificationName_object_userInfo_, v41, a1, v42);

          swift_bridgeObjectRelease();
          goto LABEL_10;
        }
        char v39 = sub_1A4CBB5EC();
        swift_bridgeObjectRelease();
        if (v39) {
          goto LABEL_34;
        }
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      ++v27;
      if (v30 == v26) {
        goto LABEL_9;
      }
    }
    id v29 = *(id *)(v25 + 8 * v27);
    uint64_t v30 = v27 - 3;
    if (!__OFADD__(v28, 1)) {
      goto LABEL_26;
    }
LABEL_37:
    __break(1u);
LABEL_38:
    __break(1u);
LABEL_39:
    __break(1u);
LABEL_40:
    swift_once();
  }
}

void sub_1A4CABDDC(uint64_t a1)
{
  if (qword_1E965B700 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1A4CBB03C();
  sub_1A4B0C4D8(v2, (uint64_t)qword_1E965B6E0);
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_1A4CBB01C();
  os_log_type_t v4 = sub_1A4CBB24C();
  if (os_log_type_enabled(v3, v4))
  {
    unint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)unint64_t v5 = 134217984;
    uint64_t v20 = *(void *)(a1 + 16);
    sub_1A4CBB36C();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1A4AF7000, v3, v4, "Notifying clients of %ld handles with updated KT status'.", v5, 0xCu);
    MEMORY[0x1A6264920](v5, -1, -1);

    if (!*(void *)(a1 + 16)) {
      return;
    }
  }
  else
  {

    swift_bridgeObjectRelease();
    if (!*(void *)(a1 + 16)) {
      return;
    }
  }
  swift_bridgeObjectRetain_n();
  os_log_type_t v6 = sub_1A4CBB01C();
  os_log_type_t v7 = sub_1A4CBB24C();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t v20 = v9;
    *(_DWORD *)uint64_t v8 = 136315138;
    uint64_t v10 = swift_bridgeObjectRetain();
    uint64_t v11 = MEMORY[0x1A6262680](v10, MEMORY[0x1E4FBB1A0]);
    unint64_t v13 = v12;
    swift_bridgeObjectRelease();
    sub_1A4B0BCCC(v11, v13, &v20);
    sub_1A4CBB36C();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1A4AF7000, v6, v7, "Handles with updated kt status: %s.", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1A6264920](v9, -1, -1);
    MEMORY[0x1A6264920](v8, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  sub_1A4B0E048(&qword_1E965B6C8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1A4CD16F0;
  *(void *)(inited + 32) = sub_1A4CBB0CC();
  *(void *)(inited + 40) = v15;
  *(void *)(inited + 48) = a1;
  swift_bridgeObjectRetain();
  unint64_t v16 = sub_1A4C99918(inited);
  id v17 = objc_msgSend(self, sel_defaultCenter);
  sub_1A4CBB0CC();
  unint64_t v18 = (void *)sub_1A4CBB0BC();
  swift_bridgeObjectRelease();
  sub_1A4CA9948(v16);
  swift_bridgeObjectRelease();
  unint64_t v19 = (void *)sub_1A4CBB09C();
  swift_bridgeObjectRelease();
  objc_msgSend(v17, sel___mainThreadPostNotificationName_object_userInfo_, v18, 0, v19);
}

uint64_t sub_1A4CAC170()
{
  return sub_1A4CA9E00();
}

uint64_t sub_1A4CAC180@<X0>(unsigned __int8 *a1@<X0>, unsigned char *a2@<X8>)
{
  if (a1[1]) {
    int v4 = 256;
  }
  else {
    int v4 = 0;
  }
  uint64_t result = (*(uint64_t (**)(void, void, void))(v2 + 16))(v4 | *a1, *((void *)a1 + 1), *((void *)a1 + 2));
  *a2 = result & 1;
  return result;
}

uint64_t _s5StateVwxx()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t _s5StateVwCP_0(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s5StateVwca(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s5StateVwta(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s5StateVwet(uint64_t a1, int a2)
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

uint64_t _s5StateVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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

id sub_1A4CAC3F0()
{
  swift_unknownObjectWeakInit();
  *(void *)&v0[OBJC_IVAR___IMSPICollaborationMessageListener_connection] = 0;
  uint64_t v5 = 0;
  unint64_t v6 = 0xE000000000000000;
  unsigned __int8 v1 = v0;
  sub_1A4CBB43C();
  sub_1A4CBB0FC();
  sub_1A4CBB0FC();
  swift_bridgeObjectRelease();
  unint64_t v2 = &v1[OBJC_IVAR___IMSPICollaborationMessageListener_listenerID];
  *(void *)unint64_t v2 = 0;
  *((void *)v2 + 1) = 0xE000000000000000;

  v4.receiver = v1;
  v4.super_class = (Class)IMSPICollaborationMessageListener;
  return objc_msgSendSuper2(&v4, sel_init);
}

uint64_t sub_1A4CAC500()
{
  objc_msgSend(v0, sel_stopListening);
  unsigned __int8 v1 = self;
  id v2 = objc_msgSend(v1, sel_sharedController);
  id v3 = objc_msgSend(v2, sel_listener);

  objc_msgSend(v3, sel_addHandler_, v0);
  id v4 = objc_msgSend(v1, sel_sharedController);
  uint64_t v5 = (void *)sub_1A4CBB0BC();
  id v6 = objc_msgSend(v4, sel_multiplexedConnectionWithLabel_capabilities_context_, v5, 0x80000000, 0);

  *(void *)&v0[OBJC_IVAR___IMSPICollaborationMessageListener_connection] = v6;

  return swift_unknownObjectRelease();
}

void __swiftcall IMSPICollaborationMessageListener.init()(IMSPICollaborationMessageListener *__return_ptr retstr)
{
  id v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());

  objc_msgSend(v1, sel_init);
}

void IMSPICollaborationMessageListener.init()()
{
}

unint64_t type metadata accessor for IMSPICollaborationMessageListener()
{
  unint64_t result = qword_1E965DC90;
  if (!qword_1E965DC90)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1E965DC90);
  }
  return result;
}

uint64_t sub_1A4CAC9A0(uint64_t a1)
{
  return a1;
}

uint64_t sub_1A4CAC9FC()
{
  id v1 = v0;
  if ((objc_msgSend(v0, sel_isGroupChat) & 1) == 0)
  {
    id v2 = objc_msgSend(v0, sel_allChatProperties);
    if (v2)
    {
      id v3 = v2;
      uint64_t v4 = sub_1A4CBB0AC();

      unint64_t v5 = sub_1A4CAE480(v4);
      swift_bridgeObjectRelease();
      if (v5)
      {
        uint64_t v6 = sub_1A4CBB0CC();
        if (*(void *)(v5 + 16) && (unint64_t v8 = sub_1A4AFB26C(v6, v7), (v9 & 1) != 0))
        {
          sub_1A4B0E248(*(void *)(v5 + 56) + 32 * v8, (uint64_t)&v19);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (*((void *)&v20 + 1))
          {
            sub_1A4B0C5F4((uint64_t)&v19);
            return 1;
          }
        }
        else
        {
          long long v19 = 0u;
          long long v20 = 0u;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        sub_1A4B0C5F4((uint64_t)&v19);
      }
    }
    id v11 = objc_msgSend(v1, sel_participants, v19, (void)v20, *((void *)&v20 + 1));
    sub_1A4CACD3C();
    unint64_t v12 = sub_1A4CBB15C();

    if (v12 >> 62) {
      goto LABEL_23;
    }
    uint64_t v13 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    for (; v13; uint64_t v13 = sub_1A4CBB4CC())
    {
      uint64_t v14 = 4;
      while (1)
      {
        id v15 = (v12 & 0xC000000000000001) != 0
            ? (id)MEMORY[0x1A6262970](v14 - 4, v12)
            : *(id *)(v12 + 8 * v14);
        unint64_t v16 = v15;
        uint64_t v17 = v14 - 3;
        if (__OFADD__(v14 - 4, 1)) {
          break;
        }
        unsigned int v18 = objc_msgSend(v15, sel_isChatBot);

        if (v18)
        {
          swift_bridgeObjectRelease_n();
          return 1;
        }
        ++v14;
        if (v17 == v13) {
          goto LABEL_19;
        }
      }
      __break(1u);
LABEL_23:
      swift_bridgeObjectRetain();
    }
LABEL_19:
    swift_bridgeObjectRelease_n();
  }
  return 0;
}

unint64_t sub_1A4CACD3C()
{
  unint64_t result = qword_1E965B670;
  if (!qword_1E965B670)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1E965B670);
  }
  return result;
}

void __swiftcall IMStickerTapback.message(for:messageGUID:messagePart:messageSummaryInfo:threadIdentifier:)(IMMessage_optional *__return_ptr retstr, IMChat *a2, Swift::String messageGUID, _NSRange messagePart, Swift::OpaquePointer messageSummaryInfo, Swift::String_optional threadIdentifier)
{
}

id sub_1A4CACD9C(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v13 = sub_1A4CBB0CC();
  uint64_t v15 = v14;
  uint64_t v16 = sub_1A4CBB0AC();
  if (a8)
  {
    uint64_t v17 = sub_1A4CBB0CC();
    a8 = v18;
  }
  else
  {
    uint64_t v17 = 0;
  }
  id v19 = a3;
  id v20 = a1;
  id v21 = (void *)sub_1A4CAD230(v13, v15, a5, a6, v16, v17, a8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v21;
}

id IMStickerTapback.transferExistsLocally.getter()
{
  id result = objc_msgSend(self, sel_sharedInstance);
  if (result)
  {
    id v2 = result;
    id v3 = objc_msgSend(v0, sel_transferGUID);
    if (!v3)
    {
      sub_1A4CBB0CC();
      id v3 = (id)sub_1A4CBB0BC();
      swift_bridgeObjectRelease();
    }
    id v4 = objc_msgSend(v2, sel_transferForGUID_, v3);

    id result = 0;
    if (v4)
    {
      unsigned __int8 v5 = objc_msgSend(v4, sel_existsAtLocalPath);

      if (v5) {
        return (id)1;
      }
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_1A4CACF8C(void *a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  uint64_t v21 = sub_1A4CBAEAC();
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v23 = 0;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v22 + 48))(a2, 1, v21) != 1)
  {
    uint64_t v23 = (void *)sub_1A4CBAE6C();
    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(a2, v21);
  }
  if (a5)
  {
    id v34 = (void *)sub_1A4CBB14C();
    swift_bridgeObjectRelease();
    uint64_t v24 = a9;
    if (a7) {
      goto LABEL_5;
    }
  }
  else
  {
    id v34 = 0;
    uint64_t v24 = a9;
    if (a7)
    {
LABEL_5:
      id v33 = (void *)sub_1A4CBAE1C();

      uint64_t v25 = a12;
      if (v24) {
        goto LABEL_6;
      }
      goto LABEL_11;
    }
  }
  id v33 = 0;
  uint64_t v25 = a12;
  if (v24)
  {
LABEL_6:
    uint64_t v26 = (void *)sub_1A4CBB0BC();
    swift_bridgeObjectRelease();
    uint64_t v27 = a16;
    if (v25) {
      goto LABEL_7;
    }
LABEL_12:
    uint64_t v28 = 0;
    uint64_t v29 = a18;
    if (v27) {
      goto LABEL_8;
    }
    goto LABEL_13;
  }
LABEL_11:
  uint64_t v26 = 0;
  uint64_t v27 = a16;
  if (!v25) {
    goto LABEL_12;
  }
LABEL_7:
  uint64_t v28 = (void *)sub_1A4CBB0BC();
  swift_bridgeObjectRelease();
  uint64_t v29 = a18;
  if (v27)
  {
LABEL_8:
    uint64_t v30 = (void *)sub_1A4CBB09C();
    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v30 = 0;
LABEL_14:
  if (v29)
  {
    id v31 = (void *)sub_1A4CBB0BC();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v31 = 0;
  }
  id v37 = objc_msgSend(v35, sel_initWithSender_time_text_messageSubject_fileTransferGUIDs_flags_error_guid_subject_associatedMessageGUID_associatedMessageType_associatedMessageRange_messageSummaryInfo_threadIdentifier_, a1, v23, a3, a4, v34, a6, v33, v26, a10, v28, a13, a14, a15, v30, v31);

  return v37;
}

uint64_t sub_1A4CAD230(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  unint64_t v8 = v7;
  uint64_t v55 = a7;
  uint64_t v56 = a6;
  uint64_t v57 = a4;
  uint64_t v12 = sub_1A4B0E048(&qword_1E965B568);
  MEMORY[0x1F4188790](v12 - 8);
  uint64_t v14 = (char *)&v50 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = (void *)sub_1A4CBB09C();
  id v16 = objc_msgSend(v7, sel_adjustMessageSummaryInfoForSending_, v15);

  uint64_t v17 = sub_1A4CBB0AC();
  uint64_t v54 = v17;
  uint64_t v18 = (void *)sub_1A4CBB09C();
  v62 = sub_1A4C99178;
  uint64_t v63 = 0;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v59 = 1107296256;
  unint64_t v60 = sub_1A4C99238;
  id v61 = &unk_1EF8E61A0;
  id v19 = _Block_copy(&aBlock);
  swift_release();
  v62 = sub_1A4C99234;
  uint64_t v63 = 0;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v59 = 1107296256;
  unint64_t v60 = sub_1A4C99238;
  id v61 = &unk_1EF8E6268;
  id v20 = _Block_copy(&aBlock);
  swift_release();
  id v21 = objc_msgSend(v8, sel_backwardCompatibilityStringWithMessageSummaryInfo_isAdaptiveImageGlyphProvider_isCommSafetySensitiveProvider_, v18, v19, v20);
  _Block_release(v19);

  _Block_release(v20);
  uint64_t result = swift_isEscapingClosureAtFileLocation();
  if (result)
  {
    __break(1u);
    goto LABEL_11;
  }
  uint64_t result = swift_isEscapingClosureAtFileLocation();
  if (result)
  {
LABEL_11:
    __break(1u);
    return result;
  }
  uint64_t v52 = a3;
  uint64_t v53 = a1;
  uint64_t v51 = a2;
  if (v21)
  {
    id v23 = objc_msgSend(v21, sel___stringByStrippingControlCharacters);

    if (v23)
    {
      sub_1A4CBB0CC();
    }
  }
  id v24 = objc_allocWithZone(MEMORY[0x1E4F28B18]);
  uint64_t v25 = (void *)sub_1A4CBB0BC();
  swift_bridgeObjectRelease();
  id v26 = objc_msgSend(v24, sel_initWithString_, v25);

  sub_1A4B0E048((uint64_t *)&unk_1EB3F1EF0);
  uint64_t v27 = swift_allocObject();
  long long v50 = xmmword_1A4CD16F0;
  *(_OWORD *)(v27 + 16) = xmmword_1A4CD16F0;
  id v28 = objc_msgSend(v8, sel_transferGUID);
  uint64_t v29 = sub_1A4CBB0CC();
  uint64_t v31 = v30;

  *(void *)(v27 + 32) = v29;
  *(void *)(v27 + 40) = v31;
  id v32 = (void *)sub_1A4CBB14C();
  swift_bridgeObjectRelease();
  id v33 = objc_msgSend(v26, sel___im_attributedStringByAppendingFileTransfers_, v32);

  id v34 = objc_msgSend(v33, sel___im_attributedStringByAssigningMessagePartNumbers);
  sub_1A4CBAE9C();
  uint64_t v35 = sub_1A4CBAEAC();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56))(v14, 0, 1, v35);
  uint64_t v36 = swift_allocObject();
  *(_OWORD *)(v36 + 16) = v50;
  id v37 = objc_msgSend(v8, sel_transferGUID);
  uint64_t v38 = sub_1A4CBB0CC();
  uint64_t v40 = v39;

  *(void *)(v36 + 32) = v38;
  *(void *)(v36 + 40) = v40;
  id v41 = objc_msgSend(self, sel_stringGUID);
  if (v41)
  {
    unint64_t v42 = v41;
    uint64_t v43 = sub_1A4CBB0CC();
    uint64_t v45 = v44;
  }
  else
  {
    uint64_t v43 = 0;
    uint64_t v45 = 0;
  }
  id v46 = objc_msgSend(v8, sel_associatedMessageType);
  objc_allocWithZone((Class)IMMessage);
  uint64_t v47 = v55;
  swift_bridgeObjectRetain();
  uint64_t v48 = swift_bridgeObjectRetain();
  id v49 = sub_1A4CACF8C(0, (uint64_t)v14, v34, 0, v36, 5, 0, v43, v45, 0, v53, v48, (uint64_t)v46, v52, v57, v54, v56, v47);

  return (uint64_t)v49;
}

uint64_t sub_1A4CAD79C(char a1)
{
  id v2 = (void *)sub_1A4CBB0BC();
  swift_bridgeObjectRelease();
  id v3 = (void *)sub_1A4CBB0BC();
  swift_bridgeObjectRelease();
  id v4 = (void *)sub_1A4CBB0BC();
  id v5 = IMCoreLocalizedString(v2, v3);

  if (v5)
  {
    uint64_t v6 = sub_1A4CBB0CC();
  }
  else
  {
    if (qword_1E965B478 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_1A4CBB03C();
    sub_1A4B0C4D8(v7, (uint64_t)qword_1E9660AD0);
    unint64_t v8 = sub_1A4CBB01C();
    os_log_type_t v9 = sub_1A4CBB26C();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      uint64_t v11 = swift_slowAlloc();
      uint64_t v17 = v11;
      *(_DWORD *)uint64_t v10 = 136315138;
      uint64_t v12 = 0xD000000000000015;
      unint64_t v13 = 0x80000001A4CF8640;
      switch(a1)
      {
        case 1:
          uint64_t v12 = 0xD000000000000021;
          uint64_t v14 = "SYNC_PROGRESS_DEVICE_STORAGE_FULL";
          goto LABEL_9;
        case 2:
          uint64_t v12 = 0xD000000000000021;
          uint64_t v14 = "SYNC_PROGRESS_ICLOUD_STORAGE_FULL";
LABEL_9:
          unint64_t v13 = (unint64_t)(v14 - 32) | 0x8000000000000000;
          break;
        case 3:
          uint64_t v15 = "SYNC_PROGRESS_CONNECT_TO_WIFI";
          goto LABEL_12;
        case 4:
          uint64_t v15 = "SYNC_PROGRESS_CONNECT_TO_WLAN";
LABEL_12:
          unint64_t v13 = (unint64_t)(v15 - 32) | 0x8000000000000000;
          uint64_t v12 = 0xD00000000000001DLL;
          break;
        default:
          break;
      }
      sub_1A4B0BCCC(v12, v13, &v17);
      sub_1A4CBB36C();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1A4AF7000, v8, v9, "Failed to generate localized string for %s", v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1A6264920](v11, -1, -1);
      MEMORY[0x1A6264920](v10, -1, -1);
    }

    return 0;
  }
  return v6;
}

uint64_t sub_1A4CADB70(char a1)
{
  id v2 = (void *)sub_1A4CBB0BC();
  swift_bridgeObjectRelease();
  id v3 = (void *)sub_1A4CBB0BC();
  swift_bridgeObjectRelease();
  id v4 = (void *)sub_1A4CBB0BC();
  id v5 = IMCoreLocalizedString(v2, v3);

  if (v5)
  {
    uint64_t v6 = sub_1A4CBB0CC();
  }
  else
  {
    if (qword_1E965B478 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_1A4CBB03C();
    sub_1A4B0C4D8(v7, (uint64_t)qword_1E9660AD0);
    unint64_t v8 = sub_1A4CBB01C();
    os_log_type_t v9 = sub_1A4CBB26C();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      uint64_t v11 = swift_slowAlloc();
      uint64_t v16 = v11;
      *(_DWORD *)uint64_t v10 = 136315138;
      uint64_t v12 = 0xD00000000000001FLL;
      unint64_t v13 = 0x80000001A4CF8500;
      switch(a1)
      {
        case 1:
          uint64_t v12 = 0xD00000000000001DLL;
          uint64_t v14 = "SYNC_PROGRESS_UPLOADING_ITEMS";
          goto LABEL_10;
        case 2:
          unint64_t v13 = 0x80000001A4CF84C0;
          uint64_t v12 = 0xD000000000000014;
          break;
        case 3:
          uint64_t v12 = 0xD000000000000026;
          uint64_t v14 = "SYNC_PROGRESS_SYNC_DISABLED_LABEL_TEXT";
LABEL_10:
          unint64_t v13 = (unint64_t)(v14 - 32) | 0x8000000000000000;
          break;
        default:
          break;
      }
      sub_1A4B0BCCC(v12, v13, &v16);
      sub_1A4CBB36C();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1A4AF7000, v8, v9, "Failed to generate localized string for %s", v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1A6264920](v11, -1, -1);
      MEMORY[0x1A6264920](v10, -1, -1);
    }

    return 0;
  }
  return v6;
}

uint64_t sub_1A4CADEFC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v4 = objc_msgSend(self, sel_sharedFeatureFlags);
  unsigned int v5 = objc_msgSend(v4, sel_isMessagesIniCloudVersion2);

  if (v5)
  {
    if (a1 && (char *)objc_msgSend(a1, sel_syncJobState) - 1 <= (char *)4)
    {
      uint64_t result = sub_1A4CAD79C(0);
      char v8 = 0;
    }
    else
    {
      char v8 = 0;
      uint64_t result = 0;
      uint64_t v7 = 0;
    }
    uint64_t v10 = 0;
    uint64_t v12 = 0;
  }
  else if (a1 && (id v9 = objc_msgSend(a1, sel_syncControllerSyncState), (unint64_t)v9 >= 4))
  {
    if (v9 == (id)4)
    {
      uint64_t v10 = sub_1A4CADB70(1);
      uint64_t v12 = v13;
      char v8 = 0;
      uint64_t result = 0;
      uint64_t v7 = 0;
    }
    else
    {
      uint64_t result = 0;
      uint64_t v7 = 0;
      uint64_t v10 = 0;
      uint64_t v12 = 0;
      char v8 = 1;
    }
  }
  else
  {
    uint64_t v10 = sub_1A4CADB70(0);
    uint64_t v12 = v11;
    uint64_t result = 0;
    uint64_t v7 = 0;
    char v8 = 1;
  }
  *(void *)a2 = v10;
  *(void *)(a2 + 8) = v12;
  *(void *)(a2 + 16) = result;
  *(void *)(a2 + 24) = v7;
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 40) = 0;
  *(unsigned char *)(a2 + 48) = v5 ^ 1;
  *(unsigned char *)(a2 + 49) = v8;
  *(void *)(a2 + 56) = 0;
  return result;
}

void sub_1A4CAE03C(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_1A4CADB70(3);
  uint64_t v4 = v3;
  unsigned int v5 = (void *)sub_1A4CBB0BC();
  uint64_t v6 = (void *)sub_1A4CBB0BC();
  uint64_t v7 = (void *)sub_1A4CBB0BC();
  id v8 = IMCoreLocalizedString(v5, v6);

  if (v8)
  {
    uint64_t v9 = sub_1A4CBB0CC();
    uint64_t v11 = v10;
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v11 = 0;
  }
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = v9;
  *(void *)(a1 + 40) = v11;
  *(_WORD *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 0;
}

void sub_1A4CAE13C(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1A4CADB70(2);
  uint64_t v6 = v5;
  uint64_t v7 = sub_1A4CAD79C(a1);
  uint64_t v9 = v8;
  uint64_t v10 = (void *)sub_1A4CBB0BC();
  uint64_t v11 = (void *)sub_1A4CBB0BC();
  uint64_t v12 = (void *)sub_1A4CBB0BC();
  id v13 = IMCoreLocalizedString(v10, v11);

  if (v13)
  {
    uint64_t v14 = sub_1A4CBB0CC();
    uint64_t v16 = v15;
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v16 = 0;
  }
  *(void *)a2 = v4;
  *(void *)(a2 + 8) = v6;
  *(void *)(a2 + 16) = v7;
  *(void *)(a2 + 24) = v9;
  *(void *)(a2 + 32) = v14;
  *(void *)(a2 + 40) = v16;
  *(_WORD *)(a2 + 48) = 0;
  *(void *)(a2 + 56) = 0;
}

uint64_t sub_1A4CAE250@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  char v5 = 0;
  uint64_t result = 0;
  long long v7 = 0uLL;
  double v8 = 0.0;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  char v13 = 0;
  switch(a1)
  {
    case 0:
      sub_1A4CADEFC(a2, (uint64_t)v21);
      goto LABEL_13;
    case 1:
      if ((IMDeviceIsGreenTea() & 1) != 0 || objc_msgSend(self, sel_IMDeviceIsChinaRegion)) {
        char v14 = 4;
      }
      else {
        char v14 = 3;
      }
      uint64_t v11 = sub_1A4CAD79C(v14);
      unint64_t v18 = v17;
      uint64_t result = sub_1A4CADB70(2);
      uint64_t v12 = 0;
      char v5 = 0;
      char v13 = 0;
      long long v7 = v18;
      double v8 = 10.0;
      break;
    case 2:
      break;
    case 3:
      sub_1A4CAE03C((uint64_t)v21);
      goto LABEL_13;
    case 4:
      char v16 = 2;
      goto LABEL_12;
    case 5:
      char v16 = 1;
LABEL_12:
      sub_1A4CAE13C(v16, (uint64_t)v21);
LABEL_13:
      double v8 = v26;
      char v13 = v25;
      char v5 = v24;
      uint64_t v12 = v23;
      uint64_t v10 = v21[1];
      uint64_t v11 = v21[2];
      long long v7 = v22;
      uint64_t result = v21[0];
      break;
    case 6:
      if ((IMDeviceIsGreenTea() & 1) != 0 || objc_msgSend(self, sel_IMDeviceIsChinaRegion)) {
        char v15 = 4;
      }
      else {
        char v15 = 3;
      }
      uint64_t v11 = sub_1A4CAD79C(v15);
      unint64_t v20 = v19;
      uint64_t result = sub_1A4CADB70(2);
      uint64_t v12 = 0;
      char v5 = 0;
      char v13 = 0;
      long long v7 = v20;
      break;
    default:
      uint64_t v10 = 0;
      uint64_t v11 = 0;
      uint64_t v12 = 0;
      char v13 = 0;
      break;
  }
  *(void *)a3 = result;
  *(void *)(a3 + 8) = v10;
  *(void *)(a3 + 16) = v11;
  *(_OWORD *)(a3 + 24) = v7;
  *(void *)(a3 + 40) = v12;
  *(unsigned char *)(a3 + 48) = v5;
  *(unsigned char *)(a3 + 49) = v13;
  *(double *)(a3 + 56) = v8;
  return result;
}

uint64_t sub_1A4CAE430(uint64_t a1)
{
  return sub_1A4AFFAAC(a1, qword_1E9660B00);
}

uint64_t sub_1A4CAE454(uint64_t a1)
{
  return sub_1A4AFFAAC(a1, qword_1EB3F2570);
}

unint64_t sub_1A4CAE480(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_1A4B0E048((uint64_t *)&unk_1E965B6B0);
    uint64_t v2 = (void *)sub_1A4CBB4FC();
  }
  else
  {
    uint64_t v2 = (void *)MEMORY[0x1E4FBC868];
  }
  uint64_t v23 = a1 + 64;
  uint64_t v3 = -1;
  uint64_t v4 = -1 << *(unsigned char *)(a1 + 32);
  if (-v4 < 64) {
    uint64_t v3 = ~(-1 << -(char)v4);
  }
  unint64_t v5 = v3 & *(void *)(a1 + 64);
  int64_t v22 = (unint64_t)(63 - v4) >> 6;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t v7 = 0;
  while (1)
  {
    if (v5)
    {
      uint64_t v10 = (v5 - 1) & v5;
      unint64_t v11 = __clz(__rbit64(v5)) | (v7 << 6);
      int64_t v12 = v7;
    }
    else
    {
      int64_t v13 = v7 + 1;
      if (__OFADD__(v7, 1)) {
        goto LABEL_37;
      }
      if (v13 >= v22)
      {
LABEL_33:
        sub_1A4C990AC();
        return (unint64_t)v2;
      }
      unint64_t v14 = *(void *)(v23 + 8 * v13);
      int64_t v12 = v7 + 1;
      if (!v14)
      {
        int64_t v12 = v7 + 2;
        if (v7 + 2 >= v22) {
          goto LABEL_33;
        }
        unint64_t v14 = *(void *)(v23 + 8 * v12);
        if (!v14)
        {
          int64_t v12 = v7 + 3;
          if (v7 + 3 >= v22) {
            goto LABEL_33;
          }
          unint64_t v14 = *(void *)(v23 + 8 * v12);
          if (!v14)
          {
            int64_t v12 = v7 + 4;
            if (v7 + 4 >= v22) {
              goto LABEL_33;
            }
            unint64_t v14 = *(void *)(v23 + 8 * v12);
            if (!v14)
            {
              int64_t v15 = v7 + 5;
              if (v7 + 5 >= v22) {
                goto LABEL_33;
              }
              unint64_t v14 = *(void *)(v23 + 8 * v15);
              if (!v14)
              {
                while (1)
                {
                  int64_t v12 = v15 + 1;
                  if (__OFADD__(v15, 1)) {
                    goto LABEL_38;
                  }
                  if (v12 >= v22) {
                    goto LABEL_33;
                  }
                  unint64_t v14 = *(void *)(v23 + 8 * v12);
                  ++v15;
                  if (v14) {
                    goto LABEL_26;
                  }
                }
              }
              int64_t v12 = v7 + 5;
            }
          }
        }
      }
LABEL_26:
      uint64_t v10 = (v14 - 1) & v14;
      unint64_t v11 = __clz(__rbit64(v14)) + (v12 << 6);
    }
    sub_1A4B0E1EC(*(void *)(a1 + 48) + 40 * v11, (uint64_t)v33);
    sub_1A4B0E248(*(void *)(a1 + 56) + 32 * v11, (uint64_t)v34 + 8);
    v31[0] = v34[0];
    v31[1] = v34[1];
    uint64_t v32 = v35;
    v30[0] = v33[0];
    v30[1] = v33[1];
    sub_1A4B0E1EC((uint64_t)v30, (uint64_t)v25);
    if (!swift_dynamicCast())
    {
      sub_1A4B0E2A4((uint64_t)v30, &qword_1EB3F1F68);
      swift_bridgeObjectRelease();
      sub_1A4C990AC();
      swift_release();
      return 0;
    }
    sub_1A4B0E248((uint64_t)v31 + 8, (uint64_t)v25);
    sub_1A4B0E2A4((uint64_t)v30, &qword_1EB3F1F68);
    sub_1A4B0C5E4(v25, v26);
    long long v27 = v24;
    sub_1A4B0C5E4(v26, v28);
    long long v16 = v27;
    sub_1A4B0C5E4(v28, v29);
    sub_1A4B0C5E4(v29, &v27);
    unint64_t result = sub_1A4AFB26C(v16, *((uint64_t *)&v16 + 1));
    unint64_t v17 = result;
    if (v18)
    {
      double v8 = (_OWORD *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      _OWORD *v8 = v16;
      uint64_t v9 = (_OWORD *)(v2[7] + 32 * v17);
      sub_1A4B0BDA0((uint64_t)v9);
      unint64_t result = (unint64_t)sub_1A4B0C5E4(&v27, v9);
      goto LABEL_8;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_OWORD *)(v2[6] + 16 * result) = v16;
    unint64_t result = (unint64_t)sub_1A4B0C5E4(&v27, (_OWORD *)(v2[7] + 32 * result));
    uint64_t v19 = v2[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (v20) {
      goto LABEL_36;
    }
    v2[2] = v21;
LABEL_8:
    int64_t v7 = v12;
    unint64_t v5 = v10;
  }
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
  return result;
}

unint64_t sub_1A4CAE854(uint64_t a1)
{
  uint64_t v1 = a1;
  if (*(void *)(a1 + 16))
  {
    sub_1A4B0E048((uint64_t *)&unk_1EB3F1EE0);
    uint64_t v2 = (void *)sub_1A4CBB4FC();
  }
  else
  {
    uint64_t v2 = (void *)MEMORY[0x1E4FBC868];
  }
  uint64_t v28 = v1 + 64;
  uint64_t v3 = -1;
  uint64_t v4 = -1 << *(unsigned char *)(v1 + 32);
  if (-v4 < 64) {
    uint64_t v3 = ~(-1 << -(char)v4);
  }
  unint64_t v5 = v3 & *(void *)(v1 + 64);
  int64_t v27 = (unint64_t)(63 - v4) >> 6;
  uint64_t v6 = (char *)v36 + 8;
  int64_t v7 = (char *)v33 + 8;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t v9 = 0;
  uint64_t v26 = v1;
  while (1)
  {
    if (v5)
    {
      uint64_t v14 = (v5 - 1) & v5;
      unint64_t v15 = __clz(__rbit64(v5)) | (v9 << 6);
      int64_t v16 = v9;
    }
    else
    {
      int64_t v17 = v9 + 1;
      if (__OFADD__(v9, 1)) {
        goto LABEL_40;
      }
      if (v17 >= v27)
      {
LABEL_36:
        sub_1A4C990AC();
        return (unint64_t)v2;
      }
      unint64_t v18 = *(void *)(v28 + 8 * v17);
      int64_t v16 = v9 + 1;
      if (!v18)
      {
        int64_t v16 = v9 + 2;
        if (v9 + 2 >= v27) {
          goto LABEL_36;
        }
        unint64_t v18 = *(void *)(v28 + 8 * v16);
        if (!v18)
        {
          int64_t v16 = v9 + 3;
          if (v9 + 3 >= v27) {
            goto LABEL_36;
          }
          unint64_t v18 = *(void *)(v28 + 8 * v16);
          if (!v18)
          {
            int64_t v16 = v9 + 4;
            if (v9 + 4 >= v27) {
              goto LABEL_36;
            }
            unint64_t v18 = *(void *)(v28 + 8 * v16);
            if (!v18)
            {
              int64_t v19 = v9 + 5;
              if (v9 + 5 >= v27) {
                goto LABEL_36;
              }
              unint64_t v18 = *(void *)(v28 + 8 * v19);
              if (!v18)
              {
                while (1)
                {
                  int64_t v16 = v19 + 1;
                  if (__OFADD__(v19, 1)) {
                    goto LABEL_41;
                  }
                  if (v16 >= v27) {
                    goto LABEL_36;
                  }
                  unint64_t v18 = *(void *)(v28 + 8 * v16);
                  ++v19;
                  if (v18) {
                    goto LABEL_26;
                  }
                }
              }
              int64_t v16 = v9 + 5;
            }
          }
        }
      }
LABEL_26:
      uint64_t v14 = (v18 - 1) & v18;
      unint64_t v15 = __clz(__rbit64(v18)) + (v16 << 6);
    }
    sub_1A4B0E1EC(*(void *)(v1 + 48) + 40 * v15, (uint64_t)v35);
    sub_1A4B0E248(*(void *)(v1 + 56) + 32 * v15, (uint64_t)v6);
    v33[0] = v36[0];
    v33[1] = v36[1];
    uint64_t v34 = v37;
    v32[0] = v35[0];
    v32[1] = v35[1];
    sub_1A4B0E1EC((uint64_t)v32, (uint64_t)v31);
    if (!swift_dynamicCast())
    {
      sub_1A4B0E2A4((uint64_t)v32, &qword_1EB3F1F68);
LABEL_35:
      swift_bridgeObjectRelease();
      sub_1A4C990AC();
      swift_release();
      return 0;
    }
    sub_1A4B0E248((uint64_t)v7, (uint64_t)v31);
    sub_1A4B0E2A4((uint64_t)v32, &qword_1EB3F1F68);
    sub_1A4B0E048(&qword_1EB3F1EC8);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      goto LABEL_35;
    }
    unint64_t result = sub_1A4AFB26C(v29, v30);
    unint64_t v20 = result;
    if (v21)
    {
      uint64_t v10 = v7;
      unint64_t v11 = v6;
      int64_t v12 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *int64_t v12 = v29;
      v12[1] = v30;
      uint64_t v13 = v2[7];
      unint64_t result = swift_bridgeObjectRelease();
      *(void *)(v13 + 8 * v20) = v29;
      uint64_t v6 = v11;
      int64_t v7 = v10;
      uint64_t v1 = v26;
      goto LABEL_8;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    int64_t v22 = (uint64_t *)(v2[6] + 16 * result);
    *int64_t v22 = v29;
    v22[1] = v30;
    *(void *)(v2[7] + 8 * result) = v29;
    uint64_t v23 = v2[2];
    BOOL v24 = __OFADD__(v23, 1);
    uint64_t v25 = v23 + 1;
    if (v24) {
      goto LABEL_39;
    }
    v2[2] = v25;
LABEL_8:
    int64_t v9 = v16;
    unint64_t v5 = v14;
  }
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

id NicknameProvider.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id NicknameProvider.init()()
{
  swift_unknownObjectWeakInit();
  uint64_t v1 = OBJC_IVAR___IMNicknameProvider_Impl_nicknameController;
  uint64_t v2 = self;
  uint64_t v3 = v0;
  *(void *)&v0[v1] = objc_msgSend(v2, sel_sharedInstance);
  if (qword_1EB3F1F60 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_1A4CBB03C();
  sub_1A4B0C4D8(v4, (uint64_t)qword_1EB3F2570);
  unint64_t v5 = sub_1A4CBB01C();
  os_log_type_t v6 = sub_1A4CBB28C();
  if (os_log_type_enabled(v5, v6))
  {
    int64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)int64_t v7 = 0;
    _os_log_impl(&dword_1A4AF7000, v5, v6, "Opening Daemon connection", v7, 2u);
    MEMORY[0x1A6264920](v7, -1, -1);
  }

  id v8 = objc_msgSend(self, sel_sharedController);
  int64_t v9 = (objc_class *)type metadata accessor for NicknameProvider();
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
  unint64_t v11 = NSStringFromClass(ObjCClassFromMetadata);
  if (!v11)
  {
    sub_1A4CBB0CC();
    unint64_t v11 = (NSString *)sub_1A4CBB0BC();
    swift_bridgeObjectRelease();
  }
  id v12 = objc_msgSend(v8, sel_multiplexedConnectionWithLabel_capabilities_context_, v11, 512, 0);

  *(void *)&v3[OBJC_IVAR___IMNicknameProvider_Impl_daemonConnection] = v12;
  v21.receiver = v3;
  v21.super_class = v9;
  id v13 = objc_msgSendSuper2(&v21, sel_init);
  v20[4] = sub_1A4CAEFAC;
  v20[5] = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 1107296256;
  v20[2] = sub_1A4B02D48;
  v20[3] = &unk_1EF8E61C8;
  uint64_t v14 = _Block_copy(v20);
  id v15 = v13;
  objc_msgSend((id)swift_unknownObjectRetain(), sel_connectWithCompletion_, v14);
  _Block_release(v14);
  swift_unknownObjectRelease();
  int64_t v16 = self;
  id v17 = objc_msgSend(v16, sel_defaultCenter);
  objc_msgSend(v17, sel_addObserver_selector_name_object_, v15, sel_nicknamesDidChangeWithNotification_, @"__kIMPendingNicknamesDidChangeNotification", 0);

  id v18 = objc_msgSend(v16, sel_defaultCenter);
  objc_msgSend(v18, sel_addObserver_selector_name_object_, v15, sel_connectionStartedWithNotification_, @"__kIMDaemonDidConnectNotification", 0);

  return v15;
}

uint64_t type metadata accessor for NicknameProvider()
{
  return self;
}

void sub_1A4CAEFAC()
{
  if (qword_1EB3F1F60 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1A4CBB03C();
  sub_1A4B0C4D8(v0, (uint64_t)qword_1EB3F2570);
  oslog = sub_1A4CBB01C();
  os_log_type_t v1 = sub_1A4CBB28C();
  if (os_log_type_enabled(oslog, v1))
  {
    uint64_t v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_1A4AF7000, oslog, v1, "Opened Daemon connection", v2, 2u);
    MEMORY[0x1A6264920](v2, -1, -1);
  }
}

id sub_1A4CAF0D0()
{
  return objc_msgSend(*(id *)(v0 + OBJC_IVAR___IMNicknameProvider_Impl_nicknameController), sel_isInitialLoadComplete);
}

id sub_1A4CAF0FC()
{
  uint64_t v1 = v0;
  if (qword_1EB3F1F60 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1A4CBB03C();
  sub_1A4B0C4D8(v2, (uint64_t)qword_1EB3F2570);
  uint64_t v3 = sub_1A4CBB01C();
  os_log_type_t v4 = sub_1A4CBB28C();
  if (os_log_type_enabled(v3, v4))
  {
    unint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v5 = 0;
    _os_log_impl(&dword_1A4AF7000, v3, v4, "Connection started, updating local nickname store.", v5, 2u);
    MEMORY[0x1A6264920](v5, -1, -1);
  }

  os_log_type_t v6 = *(void **)(v1 + OBJC_IVAR___IMNicknameProvider_Impl_nicknameController);

  return objc_msgSend(v6, sel_updateLocalNicknameStore);
}

id NicknameProvider.__deallocating_deinit()
{
  uint64_t v1 = v0;
  if (qword_1EB3F1F60 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1A4CBB03C();
  sub_1A4B0C4D8(v2, (uint64_t)qword_1EB3F2570);
  uint64_t v3 = sub_1A4CBB01C();
  os_log_type_t v4 = sub_1A4CBB28C();
  if (os_log_type_enabled(v3, v4))
  {
    unint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v5 = 0;
    _os_log_impl(&dword_1A4AF7000, v3, v4, "Closing Daemon connection", v5, 2u);
    MEMORY[0x1A6264920](v5, -1, -1);
  }

  objc_msgSend(*(id *)&v1[OBJC_IVAR___IMNicknameProvider_Impl_daemonConnection], sel_invalidate);
  v7.receiver = v1;
  v7.super_class = (Class)type metadata accessor for NicknameProvider();
  return objc_msgSendSuper2(&v7, sel_dealloc);
}

uint64_t sub_1A4CAF478()
{
  *(void *)(v1 + 136) = v0;
  return MEMORY[0x1F4188298](sub_1A4CAF498, 0, 0);
}

uint64_t sub_1A4CAF498()
{
  uint64_t v1 = *(void **)(v0[17] + OBJC_IVAR___IMNicknameProvider_Impl_daemonConnection);
  v0[14] = nullsub_31;
  v0[15] = 0;
  uint64_t v2 = MEMORY[0x1E4F143A8];
  v0[10] = MEMORY[0x1E4F143A8];
  v0[11] = 1107296256;
  v0[12] = sub_1A4B02D48;
  v0[13] = &unk_1EF8E6290;
  uint64_t v3 = _Block_copy(v0 + 10);
  objc_msgSend(v1, sel_connectWithCompletion_, v3);
  _Block_release(v3);
  if (qword_1EB3F1F60 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_1A4CBB03C();
  v0[18] = sub_1A4B0C4D8(v4, (uint64_t)qword_1EB3F2570);
  unint64_t v5 = sub_1A4CBB01C();
  os_log_type_t v6 = sub_1A4CBB28C();
  if (os_log_type_enabled(v5, v6))
  {
    objc_super v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)objc_super v7 = 0;
    _os_log_impl(&dword_1A4AF7000, v5, v6, "Asked to get the nickname for the current user", v7, 2u);
    MEMORY[0x1A6264920](v7, -1, -1);
  }
  uint64_t v8 = v0[17];

  int64_t v9 = *(void **)(v8 + OBJC_IVAR___IMNicknameProvider_Impl_nicknameController);
  id v10 = objc_msgSend(v9, sel_personalNickname);
  if (v10)
  {
    id v11 = v10;
    id v12 = sub_1A4CBB01C();
    os_log_type_t v13 = sub_1A4CBB28C();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_1A4AF7000, v12, v13, "Personal nickname found", v14, 2u);
      MEMORY[0x1A6264920](v14, -1, -1);
    }

    id v15 = (uint64_t (*)(id))v0[1];
    return v15(v11);
  }
  else
  {
    v0[2] = v0;
    v0[7] = v0 + 16;
    v0[3] = sub_1A4CAF7AC;
    uint64_t v17 = swift_continuation_init();
    v0[10] = v2;
    v0[11] = 0x40000000;
    v0[12] = sub_1A4CAF964;
    v0[13] = &unk_1E5B7FC10;
    v0[14] = v17;
    objc_msgSend(v9, sel_fetchPersonalNicknameWithCompletion_, v0 + 10);
    return MEMORY[0x1F41881E8](v0 + 2);
  }
}

uint64_t sub_1A4CAF7AC()
{
  return MEMORY[0x1F4188298](sub_1A4CAF88C, 0, 0);
}

uint64_t sub_1A4CAF88C()
{
  uint64_t v1 = *(void *)(v0 + 128);
  uint64_t v2 = sub_1A4CBB01C();
  os_log_type_t v3 = sub_1A4CBB28C();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1A4AF7000, v2, v3, "Personal nickname found after fetch", v4, 2u);
    MEMORY[0x1A6264920](v4, -1, -1);
  }

  unint64_t v5 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v5(v1);
}

uint64_t sub_1A4CAF964(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  os_log_type_t v6 = a2;
  uint64_t v3 = *(void *)(*(void *)(v2 + 64) + 40);
  id v4 = a2;
  sub_1A4CB5204((uint64_t)&v6, v3);
  return swift_continuation_resume();
}

uint64_t sub_1A4CAFB28(const void *a1, void *a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  id v4 = a2;
  unint64_t v5 = (void *)swift_task_alloc();
  v2[4] = v5;
  *unint64_t v5 = v2;
  v5[1] = sub_1A4CAFBEC;
  v5[17] = v4;
  return MEMORY[0x1F4188298](sub_1A4CAF498, 0, 0);
}

uint64_t sub_1A4CAFBEC(void *a1)
{
  uint64_t v3 = *(void (***)(void, void))(*v1 + 24);
  id v4 = *(void **)(*v1 + 16);
  uint64_t v7 = *v1;
  swift_task_dealloc();

  ((void (**)(void, void *))v3)[2](v3, a1);
  _Block_release(v3);

  unint64_t v5 = *(uint64_t (**)(void))(v7 + 8);
  return v5();
}

id sub_1A4CAFD38(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = *(void **)(v2 + OBJC_IVAR___IMNicknameProvider_Impl_daemonConnection);
  aBlock[4] = nullsub_31;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1A4B02D48;
  aBlock[3] = &unk_1EF8E4630;
  os_log_type_t v6 = _Block_copy(aBlock);
  objc_msgSend(v5, sel_connectWithCompletion_, v6);
  _Block_release(v6);
  uint64_t v7 = *(void **)(v2 + OBJC_IVAR___IMNicknameProvider_Impl_nicknameController);
  sub_1A4B0E048((uint64_t *)&unk_1EB3F1EF0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1A4CD16F0;
  *(void *)(inited + 32) = a1;
  *(void *)(inited + 40) = a2;
  swift_bridgeObjectRetain();
  sub_1A4CB48BC(inited);
  swift_setDeallocating();
  swift_arrayDestroy();
  int64_t v9 = (void *)sub_1A4CBB1FC();
  swift_bridgeObjectRelease();
  id v10 = objc_msgSend(v7, sel_nicknameForHandleIDs_, v9);

  return v10;
}

id sub_1A4CAFF2C(uint64_t a1)
{
  return sub_1A4CB0028(a1, (uint64_t)&unk_1EF8E43B0, (SEL *)&selRef_nicknameForHandleIDs_);
}

id sub_1A4CAFFA0(uint64_t a1)
{
  return sub_1A4CB0028(a1, (uint64_t)&unk_1EF8E43D8, (SEL *)&selRef_currentNicknameForHandleIDs_);
}

id sub_1A4CB0014(uint64_t a1)
{
  return sub_1A4CB0028(a1, (uint64_t)&unk_1EF8E4400, (SEL *)&selRef_pendingNicknameForHandleIDs_);
}

id sub_1A4CB0028(uint64_t a1, uint64_t a2, SEL *a3)
{
  os_log_type_t v6 = *(void **)(v3 + OBJC_IVAR___IMNicknameProvider_Impl_daemonConnection);
  v15[4] = nullsub_31;
  v15[5] = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 1107296256;
  v15[2] = sub_1A4B02D48;
  v15[3] = a2;
  uint64_t v7 = _Block_copy(v15);
  objc_msgSend(v6, sel_connectWithCompletion_, v7);
  _Block_release(v7);
  sub_1A4CB0768(a1);
  uint64_t v8 = *(void **)(v3 + OBJC_IVAR___IMNicknameProvider_Impl_nicknameController);
  int64_t v9 = (void *)sub_1A4CBB1FC();
  swift_bridgeObjectRelease();
  id v10 = objc_msgSend(v8, *a3, v9);

  if (!v10)
  {
    id v11 = objc_msgSend(self, sel_emailsForCNContact_, a1);
    uint64_t v12 = sub_1A4CBB15C();

    sub_1A4CB4824(v12);
    swift_bridgeObjectRelease();
    os_log_type_t v13 = (void *)sub_1A4CBB1FC();
    swift_bridgeObjectRelease();
    id v10 = objc_msgSend(v8, *a3, v13);
  }
  return v10;
}

id sub_1A4CB023C()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR___IMNicknameProvider_Impl_daemonConnection);
  v7[4] = nullsub_31;
  v7[5] = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 1107296256;
  _OWORD v7[2] = sub_1A4B02D48;
  v7[3] = &unk_1EF8E6218;
  uint64_t v2 = _Block_copy(v7);
  objc_msgSend(v1, sel_connectWithCompletion_, v2);
  _Block_release(v2);
  uint64_t v3 = *(void **)(v0 + OBJC_IVAR___IMNicknameProvider_Impl_nicknameController);
  id v4 = (void *)sub_1A4CBB0BC();
  id v5 = objc_msgSend(v3, sel_hasObservedTransitionForHandleID_, v4);

  return v5;
}

void sub_1A4CB0464(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *(void **)(v3 + OBJC_IVAR___IMNicknameProvider_Impl_daemonConnection);
  aBlock[4] = (uint64_t)nullsub_31;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_1A4B02D48;
  aBlock[3] = (uint64_t)&unk_1EF8E4450;
  int64_t v9 = _Block_copy(aBlock);
  objc_msgSend(v8, sel_connectWithCompletion_, v9);
  _Block_release(v9);
  if (qword_1EB3F1F60 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_1A4CBB03C();
  sub_1A4B0C4D8(v10, (uint64_t)qword_1EB3F2570);
  swift_bridgeObjectRetain_n();
  id v11 = sub_1A4CBB01C();
  os_log_type_t v12 = sub_1A4CBB28C();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    aBlock[0] = v14;
    *(_DWORD *)uint64_t v13 = 136315394;
    swift_bridgeObjectRetain();
    sub_1A4B0BCCC(a1, a2, aBlock);
    sub_1A4CBB36C();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v13 + 12) = 1024;
    sub_1A4CBB36C();
    _os_log_impl(&dword_1A4AF7000, v11, v12, "Marking handle ID %s as transitioned with auto-update: %{BOOL}d", (uint8_t *)v13, 0x12u);
    swift_arrayDestroy();
    MEMORY[0x1A6264920](v14, -1, -1);
    MEMORY[0x1A6264920](v13, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  id v15 = *(void **)(v4 + OBJC_IVAR___IMNicknameProvider_Impl_nicknameController);
  int64_t v16 = (void *)sub_1A4CBB0BC();
  objc_msgSend(v15, sel_markTransitionAsObservedForHandleID_isAutoUpdate_, v16, a3 & 1);
}

uint64_t sub_1A4CB0768(uint64_t a1)
{
  uint64_t v3 = *(void **)(v1 + OBJC_IVAR___IMNicknameProvider_Impl_daemonConnection);
  v20[4] = nullsub_31;
  v20[5] = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 1107296256;
  v20[2] = sub_1A4B02D48;
  v20[3] = &unk_1EF8E76A0;
  uint64_t v4 = _Block_copy(v20);
  objc_msgSend(v3, sel_connectWithCompletion_, v4);
  _Block_release(v4);
  id v5 = objc_msgSend(self, sel_phoneNumbersForCNContact_, a1);
  uint64_t v6 = sub_1A4CBB15C();

  uint64_t v7 = *(void *)(v6 + 16);
  if (v7)
  {
    swift_bridgeObjectRetain();
    uint64_t v8 = v6 + 40;
    int64_t v9 = (void *)MEMORY[0x1E4FBC860];
    do
    {
      swift_bridgeObjectRetain();
      uint64_t v10 = (void *)sub_1A4CBB0BC();
      id v11 = (id)IMInternationalForPhoneNumberWithOptions();

      if (v11)
      {
        uint64_t v12 = sub_1A4CBB0CC();
        uint64_t v14 = v13;
        swift_bridgeObjectRelease();

        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          int64_t v9 = sub_1A4CAB59C(0, v9[2] + 1, 1, v9);
        }
        unint64_t v16 = v9[2];
        unint64_t v15 = v9[3];
        if (v16 >= v15 >> 1) {
          int64_t v9 = sub_1A4CAB59C((void *)(v15 > 1), v16 + 1, 1, v9);
        }
        v9[2] = v16 + 1;
        uint64_t v17 = &v9[2 * v16];
        v17[4] = v12;
        v17[5] = v14;
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      v8 += 16;
      --v7;
    }
    while (v7);
    swift_bridgeObjectRelease();
  }
  else
  {
    int64_t v9 = (void *)MEMORY[0x1E4FBC860];
  }
  swift_bridgeObjectRelease();
  uint64_t v18 = sub_1A4CB4824((uint64_t)v9);
  swift_bridgeObjectRelease();
  return v18;
}

uint64_t sub_1A4CB099C(uint64_t a1)
{
  uint64_t v3 = *(void **)(v1 + OBJC_IVAR___IMNicknameProvider_Impl_daemonConnection);
  v35[4] = nullsub_31;
  v35[5] = 0;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 1107296256;
  _OWORD v35[2] = sub_1A4B02D48;
  v35[3] = &unk_1EF8E4478;
  uint64_t v4 = _Block_copy(v35);
  objc_msgSend(v3, sel_connectWithCompletion_, v4);
  _Block_release(v4);
  sub_1A4CB0768(a1);
  id v5 = objc_msgSend(self, sel_emailsForCNContact_, a1);
  uint64_t v6 = sub_1A4CBB15C();

  sub_1A4CB4824(v6);
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void **)(v1 + OBJC_IVAR___IMNicknameProvider_Impl_nicknameController);
  uint64_t v8 = (void *)sub_1A4CBB1FC();
  id v9 = objc_msgSend(v7, sel_pendingNicknameForHandleIDs_, v8);

  if (!v9)
  {
    uint64_t v10 = (void *)sub_1A4CBB1FC();
    id v9 = objc_msgSend(v7, sel_pendingNicknameForHandleIDs_, v10);
  }
  id v11 = (void *)sub_1A4CBB1FC();
  id v12 = objc_msgSend(v7, sel_currentNicknameForHandleIDs_, v11);

  if (!v12)
  {
    uint64_t v13 = (void *)sub_1A4CBB1FC();
    id v12 = objc_msgSend(v7, sel_currentNicknameForHandleIDs_, v13);
  }
  uint64_t v14 = (void *)sub_1A4CBB1FC();
  swift_bridgeObjectRelease();
  id v15 = objc_msgSend(v7, sel_archivedNicknameForHandleIDs_, v14);

  if (v15)
  {
    swift_bridgeObjectRelease();
    if (v9) {
      goto LABEL_7;
    }
  }
  else
  {
    id v33 = (void *)sub_1A4CBB1FC();
    swift_bridgeObjectRelease();
    id v15 = objc_msgSend(v7, sel_archivedNicknameForHandleIDs_, v33);

    if (v9)
    {
LABEL_7:
      uint64_t v16 = MEMORY[0x1E4FBC868];
      uint64_t v17 = sub_1A4CBB0CC();
      uint64_t v19 = v18;
      id v20 = v9;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v35[0] = v16;
      sub_1A4C9C154((uint64_t)v20, v17, v19, isUniquelyReferenced_nonNull_native);
      uint64_t v22 = v35[0];
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (!v12) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  uint64_t v22 = MEMORY[0x1E4FBC868];
  if (v12)
  {
LABEL_8:
    uint64_t v23 = sub_1A4CBB0CC();
    uint64_t v25 = v24;
    id v26 = v12;
    char v27 = swift_isUniquelyReferenced_nonNull_native();
    v35[0] = v22;
    sub_1A4C9C154((uint64_t)v26, v23, v25, v27);
    uint64_t v22 = v35[0];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
LABEL_9:
  if (v15)
  {
    uint64_t v28 = sub_1A4CBB0CC();
    uint64_t v30 = v29;
    id v31 = v15;
    char v32 = swift_isUniquelyReferenced_nonNull_native();
    v35[0] = v22;
    sub_1A4C9C154((uint64_t)v31, v28, v30, v32);
    uint64_t v22 = v35[0];

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
  }
  return v22;
}

void sub_1A4CB0E44(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void **)(v2 + OBJC_IVAR___IMNicknameProvider_Impl_daemonConnection);
  v19[4] = nullsub_31;
  v19[5] = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 1107296256;
  v19[2] = sub_1A4B02D48;
  v19[3] = &unk_1EF8E44A0;
  id v5 = _Block_copy(v19);
  objc_msgSend(v4, sel_connectWithCompletion_, v5);
  _Block_release(v5);
  if (qword_1EB3F1F60 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_1A4CBB03C();
  sub_1A4B0C4D8(v6, (uint64_t)qword_1EB3F2570);
  uint64_t v7 = a1;
  uint64_t v8 = sub_1A4CBB01C();
  os_log_type_t v9 = sub_1A4CBB28C();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    id v11 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 138412290;
    v19[0] = v7;
    id v12 = v7;
    sub_1A4CBB36C();
    *id v11 = v7;

    _os_log_impl(&dword_1A4AF7000, v8, v9, "Update pending nickname with contact %@", v10, 0xCu);
    sub_1A4B0E048(&qword_1E965B5C0);
    swift_arrayDestroy();
    MEMORY[0x1A6264920](v11, -1, -1);
    MEMORY[0x1A6264920](v10, -1, -1);
  }
  else
  {

    uint64_t v8 = v7;
  }

  uint64_t v13 = sub_1A4CB0768((uint64_t)v7);
  id v14 = objc_msgSend(self, sel_emailsForCNContact_, v7);
  uint64_t v15 = sub_1A4CBB15C();

  uint64_t v16 = sub_1A4CB4824(v15);
  swift_bridgeObjectRelease();
  sub_1A4CB112C(v16, v13);
  uint64_t v17 = *(void **)(v2 + OBJC_IVAR___IMNicknameProvider_Impl_nicknameController);
  uint64_t v18 = (void *)sub_1A4CBB1FC();
  swift_bridgeObjectRelease();
  objc_msgSend(v17, sel_updatePendingNicknameForHandleIDs_, v18);
}

uint64_t sub_1A4CB112C(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result;
  int64_t v3 = 0;
  uint64_t v18 = a2;
  uint64_t v4 = result + 56;
  uint64_t v5 = 1 << *(unsigned char *)(result + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(result + 56);
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
    int64_t v14 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v14 >= v8) {
      goto LABEL_23;
    }
    unint64_t v15 = *(void *)(v4 + 8 * v14);
    ++v3;
    if (!v15)
    {
      int64_t v3 = v14 + 1;
      if (v14 + 1 >= v8) {
        goto LABEL_23;
      }
      unint64_t v15 = *(void *)(v4 + 8 * v3);
      if (!v15)
      {
        int64_t v3 = v14 + 2;
        if (v14 + 2 >= v8) {
          goto LABEL_23;
        }
        unint64_t v15 = *(void *)(v4 + 8 * v3);
        if (!v15)
        {
          int64_t v3 = v14 + 3;
          if (v14 + 3 >= v8) {
            goto LABEL_23;
          }
          unint64_t v15 = *(void *)(v4 + 8 * v3);
          if (!v15) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v7 = (v15 - 1) & v15;
    unint64_t v10 = __clz(__rbit64(v15)) + (v3 << 6);
LABEL_5:
    id v11 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v10);
    uint64_t v12 = *v11;
    uint64_t v13 = v11[1];
    swift_bridgeObjectRetain();
    sub_1A4CB3CC4(&v17, v12, v13);
    unint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v16 = v14 + 4;
  if (v16 >= v8)
  {
LABEL_23:
    swift_release();
    return v18;
  }
  unint64_t v15 = *(void *)(v4 + 8 * v16);
  if (v15)
  {
    int64_t v3 = v16;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v3 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v3 >= v8) {
      goto LABEL_23;
    }
    unint64_t v15 = *(void *)(v4 + 8 * v3);
    ++v16;
    if (v15) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

void sub_1A4CB1314(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void **)(v2 + OBJC_IVAR___IMNicknameProvider_Impl_daemonConnection);
  v14[4] = nullsub_31;
  v14[5] = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 1107296256;
  v14[2] = sub_1A4B02D48;
  v14[3] = &unk_1EF8E44F0;
  uint64_t v5 = _Block_copy(v14);
  objc_msgSend(v4, sel_connectWithCompletion_, v5);
  _Block_release(v5);
  if (qword_1EB3F1F60 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_1A4CBB03C();
  sub_1A4B0C4D8(v6, (uint64_t)qword_1EB3F2570);
  unint64_t v7 = a1;
  int64_t v8 = sub_1A4CBB01C();
  os_log_type_t v9 = sub_1A4CBB28C();
  if (os_log_type_enabled(v8, v9))
  {
    unint64_t v10 = (uint8_t *)swift_slowAlloc();
    id v11 = (void *)swift_slowAlloc();
    *(_DWORD *)unint64_t v10 = 138412290;
    v14[0] = v7;
    uint64_t v12 = v7;
    sub_1A4CBB36C();
    *id v11 = v7;

    _os_log_impl(&dword_1A4AF7000, v8, v9, "Setting personal nickname with contact %@", v10, 0xCu);
    sub_1A4B0E048(&qword_1E965B5C0);
    swift_arrayDestroy();
    MEMORY[0x1A6264920](v11, -1, -1);
    MEMORY[0x1A6264920](v10, -1, -1);
  }
  else
  {

    int64_t v8 = v7;
  }

  id v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F6E8B8]), sel_initWithMeContact_, v7);
  objc_msgSend(*(id *)(v2 + OBJC_IVAR___IMNicknameProvider_Impl_nicknameController), sel_setPersonalNickname_, v13);
}

id sub_1A4CB15EC(void *a1)
{
  id result = objc_msgSend(a1, sel_userInfo);
  if (result)
  {
    int64_t v3 = result;
    uint64_t v4 = sub_1A4CBB0AC();

    unint64_t v5 = sub_1A4CAE854(v4);
    id result = (id)swift_bridgeObjectRelease();
    if (v5)
    {
      if (*(void *)(v5 + 16) && (uint64_t v6 = MEMORY[0x1A62649D0](v1 + OBJC_IVAR___IMNicknameProvider_Impl_listener)) != 0)
      {
        unint64_t v7 = (void *)v6;
        sub_1A4B0E048(&qword_1EB3F1EC8);
        int64_t v8 = (void *)sub_1A4CBB09C();
        swift_bridgeObjectRelease();
        objc_msgSend(v7, sel_nicknameStoreDidChange_, v8);

        return (id)swift_unknownObjectRelease();
      }
      else
      {
        return (id)swift_bridgeObjectRelease();
      }
    }
  }
  return result;
}

uint64_t sub_1A4CB1788()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR___IMNicknameProvider_Impl_daemonConnection);
  v4[4] = nullsub_31;
  v4[5] = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 1107296256;
  v4[2] = sub_1A4B02D48;
  v4[3] = &unk_1EF8E4540;
  uint64_t v2 = _Block_copy(v4);
  objc_msgSend(v1, sel_connectWithCompletion_, v2);
  _Block_release(v2);
  return swift_unknownObjectWeakAssign();
}

void sub_1A4CB1948(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *(void **)(v2 + OBJC_IVAR___IMNicknameProvider_Impl_daemonConnection);
  aBlock[4] = (uint64_t)nullsub_31;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_1A4B02D48;
  aBlock[3] = (uint64_t)&unk_1EF8E4568;
  unint64_t v7 = _Block_copy(aBlock);
  objc_msgSend(v6, sel_connectWithCompletion_, v7);
  _Block_release(v7);
  if (qword_1EB3F1F60 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_1A4CBB03C();
  sub_1A4B0C4D8(v8, (uint64_t)qword_1EB3F2570);
  swift_bridgeObjectRetain_n();
  os_log_type_t v9 = sub_1A4CBB01C();
  os_log_type_t v10 = sub_1A4CBB28C();
  if (os_log_type_enabled(v9, v10))
  {
    id v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    aBlock[0] = v12;
    *(_DWORD *)id v11 = 136315138;
    swift_bridgeObjectRetain();
    sub_1A4B0BCCC(a1, a2, aBlock);
    sub_1A4CBB36C();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1A4AF7000, v9, v10, "Sending personal nickname to handle %s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1A6264920](v12, -1, -1);
    MEMORY[0x1A6264920](v11, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  id v13 = *(void **)(v3 + OBJC_IVAR___IMNicknameProvider_Impl_nicknameController);
  int64_t v14 = (void *)sub_1A4CBB0BC();
  objc_msgSend(v13, sel_sendPersonalNicknameToHandle_, v14);
}

void sub_1A4CB1C24(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v5 = v4;
  os_log_type_t v10 = *(void **)(v4 + OBJC_IVAR___IMNicknameProvider_Impl_daemonConnection);
  aBlock[4] = (uint64_t)nullsub_31;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_1A4B02D48;
  aBlock[3] = (uint64_t)&unk_1EF8E4590;
  id v11 = _Block_copy(aBlock);
  objc_msgSend(v10, sel_connectWithCompletion_, v11);
  _Block_release(v11);
  if (qword_1EB3F1F60 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_1A4CBB03C();
  sub_1A4B0C4D8(v12, (uint64_t)qword_1EB3F2570);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  id v13 = sub_1A4CBB01C();
  os_log_type_t v14 = sub_1A4CBB28C();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = swift_slowAlloc();
    uint64_t v21 = v5;
    uint64_t v16 = a1;
    uint64_t v17 = swift_slowAlloc();
    aBlock[0] = v17;
    *(_DWORD *)uint64_t v15 = 136315394;
    swift_bridgeObjectRetain();
    sub_1A4B0BCCC(a3, a4, aBlock);
    sub_1A4CBB36C();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v15 + 12) = 2080;
    swift_bridgeObjectRetain();
    sub_1A4B0BCCC(v16, a2, aBlock);
    sub_1A4CBB36C();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1A4AF7000, v13, v14, "Sending personal nickname update from handle %s to handle %s", (uint8_t *)v15, 0x16u);
    swift_arrayDestroy();
    uint64_t v5 = v21;
    MEMORY[0x1A6264920](v17, -1, -1);
    MEMORY[0x1A6264920](v15, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  uint64_t v18 = *(void **)(v5 + OBJC_IVAR___IMNicknameProvider_Impl_nicknameController);
  uint64_t v19 = (void *)sub_1A4CBB0BC();
  id v20 = (void *)sub_1A4CBB0BC();
  objc_msgSend(v18, sel_sendPersonalNicknameToHandle_fromHandle_, v19, v20);
}

void sub_1A4CB1FB4(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v4 = v3;
  unint64_t v7 = *(void **)(v3 + OBJC_IVAR___IMNicknameProvider_Impl_daemonConnection);
  aBlock[4] = (uint64_t)nullsub_31;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_1A4B02D48;
  aBlock[3] = (uint64_t)&unk_1EF8E45B8;
  uint64_t v8 = _Block_copy(aBlock);
  objc_msgSend(v7, sel_connectWithCompletion_, v8);
  _Block_release(v8);
  if (qword_1EB3F1F60 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_1A4CBB03C();
  sub_1A4B0C4D8(v9, (uint64_t)qword_1EB3F2570);
  swift_bridgeObjectRetain_n();
  os_log_type_t v10 = sub_1A4CBB01C();
  os_log_type_t v11 = sub_1A4CBB28C();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    aBlock[0] = v13;
    *(_DWORD *)uint64_t v12 = 136315138;
    swift_bridgeObjectRetain();
    sub_1A4B0BCCC(a2, a3, aBlock);
    sub_1A4CBB36C();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1A4AF7000, v10, v11, "Sending name only update from handle %s", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1A6264920](v13, -1, -1);
    MEMORY[0x1A6264920](v12, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  os_log_type_t v14 = *(void **)(v4 + OBJC_IVAR___IMNicknameProvider_Impl_nicknameController);
  uint64_t v15 = (void *)sub_1A4CBB14C();
  uint64_t v16 = (void *)sub_1A4CBB0BC();
  objc_msgSend(v14, sel_sendNameOnlyToHandleIDs_fromHandleID_, v15, v16);
}

uint64_t sub_1A4CB22D0(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *(void **)(v2 + OBJC_IVAR___IMNicknameProvider_Impl_daemonConnection);
  aBlock[4] = (uint64_t)nullsub_31;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_1A4B02D48;
  aBlock[3] = (uint64_t)&unk_1EF8E45E0;
  unint64_t v7 = _Block_copy(aBlock);
  objc_msgSend(v6, sel_connectWithCompletion_, v7);
  _Block_release(v7);
  if (qword_1EB3F1F60 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_1A4CBB03C();
  sub_1A4B0C4D8(v8, (uint64_t)qword_1EB3F2570);
  swift_bridgeObjectRetain_n();
  uint64_t v9 = sub_1A4CBB01C();
  os_log_type_t v10 = sub_1A4CBB28C();
  if (os_log_type_enabled(v9, v10))
  {
    os_log_type_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    aBlock[0] = v12;
    *(_DWORD *)os_log_type_t v11 = 136315138;
    swift_bridgeObjectRetain();
    sub_1A4B0BCCC(a1, a2, aBlock);
    sub_1A4CBB36C();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1A4AF7000, v9, v10, "Requesting unknown sender records for %s.", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1A6264920](v12, -1, -1);
    MEMORY[0x1A6264920](v11, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v13 = *(void **)(v3 + OBJC_IVAR___IMNicknameProvider_Impl_nicknameController);
  os_log_type_t v14 = (void *)sub_1A4CBB0BC();
  id v15 = objc_msgSend(v13, sel_unknownSenderRecordInfoFor_, v14);

  sub_1A4B0E048((uint64_t *)&unk_1E965B5F0);
  uint64_t v16 = sub_1A4CBB15C();

  return v16;
}

void sub_1A4CB2618(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *(void **)(v3 + OBJC_IVAR___IMNicknameProvider_Impl_daemonConnection);
  aBlock[4] = (uint64_t)nullsub_31;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_1A4B02D48;
  aBlock[3] = (uint64_t)&unk_1EF8E75B0;
  uint64_t v9 = _Block_copy(aBlock);
  objc_msgSend(v8, sel_connectWithCompletion_, v9);
  _Block_release(v9);
  uint64_t v10 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v10 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v10)
  {
    if (qword_1EB3F1F60 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_1A4CBB03C();
    sub_1A4B0C4D8(v11, (uint64_t)qword_1EB3F2570);
    uint64_t v12 = sub_1A4CBB01C();
    os_log_type_t v13 = sub_1A4CBB28C();
    if (os_log_type_enabled(v12, v13))
    {
      os_log_type_t v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v14 = 0;
      _os_log_impl(&dword_1A4AF7000, v12, v13, "No handle is found when update banner is tapped", v14, 2u);
      MEMORY[0x1A6264920](v14, -1, -1);
    }
  }
  switch(a3)
  {
    case 1:
      if (qword_1EB3F1F60 != -1) {
        swift_once();
      }
      uint64_t v15 = sub_1A4CBB03C();
      sub_1A4B0C4D8(v15, (uint64_t)qword_1EB3F2570);
      swift_bridgeObjectRetain_n();
      uint64_t v16 = sub_1A4CBB01C();
      os_log_type_t v17 = sub_1A4CBB28C();
      if (os_log_type_enabled(v16, v17))
      {
        uint64_t v18 = (uint8_t *)swift_slowAlloc();
        uint64_t v19 = swift_slowAlloc();
        aBlock[0] = v19;
        *(_DWORD *)uint64_t v18 = 136315138;
        swift_bridgeObjectRetain();
        sub_1A4B0BCCC(a1, a2, aBlock);
        sub_1A4CBB36C();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_1A4AF7000, v16, v17, "Accept nickname action received for handle ID: %s", v18, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1A6264920](v19, -1, -1);
        MEMORY[0x1A6264920](v18, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      uint64_t v35 = *(void **)(v4 + OBJC_IVAR___IMNicknameProvider_Impl_nicknameController);
      uint64_t v36 = (void *)sub_1A4CBB0BC();
      objc_msgSend(v35, sel_acceptPendingNicknameForHandleID_updateType_, v36, 12);

      sub_1A4B0E048((uint64_t *)&unk_1EB3F1EF0);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_1A4CD16F0;
      *(void *)(inited + 32) = a1;
      *(void *)(inited + 40) = a2;
      swift_bridgeObjectRetain();
      sub_1A4CB4824(inited);
      swift_setDeallocating();
      swift_arrayDestroy();
      uint64_t v38 = (void *)sub_1A4CBB1FC();
      swift_bridgeObjectRelease();
      id v39 = objc_msgSend(v35, sel_archivedNicknameForHandleIDs_, v38);

      if (!v39) {
        goto LABEL_37;
      }
      objc_msgSend(v35, sel_markNickname_asActive_, v39, 0);
      goto LABEL_43;
    case 2:
      if (qword_1EB3F1F60 != -1) {
        swift_once();
      }
      uint64_t v20 = sub_1A4CBB03C();
      sub_1A4B0C4D8(v20, (uint64_t)qword_1EB3F2570);
      swift_bridgeObjectRetain_n();
      uint64_t v21 = sub_1A4CBB01C();
      os_log_type_t v22 = sub_1A4CBB28C();
      if (os_log_type_enabled(v21, v22))
      {
        uint64_t v23 = (uint8_t *)swift_slowAlloc();
        uint64_t v24 = swift_slowAlloc();
        aBlock[0] = v24;
        *(_DWORD *)uint64_t v23 = 136315138;
        swift_bridgeObjectRetain();
        sub_1A4B0BCCC(a1, a2, aBlock);
        sub_1A4CBB36C();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_1A4AF7000, v21, v22, "Revert nickname action received for handle ID: %s", v23, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1A6264920](v24, -1, -1);
        MEMORY[0x1A6264920](v23, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      uint64_t v35 = *(void **)(v4 + OBJC_IVAR___IMNicknameProvider_Impl_nicknameController);
      sub_1A4B0E048((uint64_t *)&unk_1EB3F1EF0);
      uint64_t v40 = swift_initStackObject();
      *(_OWORD *)(v40 + 16) = xmmword_1A4CD16F0;
      *(void *)(v40 + 32) = a1;
      *(void *)(v40 + 40) = a2;
      swift_bridgeObjectRetain();
      sub_1A4CB4824(v40);
      swift_setDeallocating();
      swift_arrayDestroy();
      id v41 = (void *)sub_1A4CBB1FC();
      swift_bridgeObjectRelease();
      id v42 = objc_msgSend(v35, sel_archivedNicknameForHandleIDs_, v41);

      if (v42)
      {
        objc_msgSend(v35, sel_markNickname_asActive_, v42, 1);
      }
      else
      {
        swift_bridgeObjectRetain_n();
        uint64_t v52 = sub_1A4CBB01C();
        os_log_type_t v53 = sub_1A4CBB28C();
        if (os_log_type_enabled(v52, v53))
        {
          uint64_t v54 = (uint8_t *)swift_slowAlloc();
          uint64_t v55 = swift_slowAlloc();
          aBlock[0] = v55;
          *(_DWORD *)uint64_t v54 = 136315138;
          swift_bridgeObjectRetain();
          sub_1A4B0BCCC(a1, a2, aBlock);
          sub_1A4CBB36C();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_1A4AF7000, v52, v53, "No archived nickname found for handle ID: %s", v54, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x1A6264920](v55, -1, -1);
          MEMORY[0x1A6264920](v54, -1, -1);
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
      }
      uint64_t v56 = swift_initStackObject();
      *(_OWORD *)(v56 + 16) = xmmword_1A4CD16F0;
      *(void *)(v56 + 32) = a1;
      *(void *)(v56 + 40) = a2;
      swift_bridgeObjectRetain();
      sub_1A4CB4824(v56);
      swift_setDeallocating();
      swift_arrayDestroy();
      uint64_t v57 = (void *)sub_1A4CBB1FC();
      swift_bridgeObjectRelease();
      id v39 = objc_msgSend(v35, sel_pendingNicknameForHandleIDs_, v57);

      if (v39) {
        goto LABEL_43;
      }
      goto LABEL_44;
    case 3:
      if (qword_1EB3F1F60 != -1) {
        swift_once();
      }
      uint64_t v25 = sub_1A4CBB03C();
      sub_1A4B0C4D8(v25, (uint64_t)qword_1EB3F2570);
      swift_bridgeObjectRetain_n();
      id v26 = sub_1A4CBB01C();
      os_log_type_t v27 = sub_1A4CBB28C();
      if (os_log_type_enabled(v26, v27))
      {
        uint64_t v28 = (uint8_t *)swift_slowAlloc();
        uint64_t v29 = swift_slowAlloc();
        aBlock[0] = v29;
        *(_DWORD *)uint64_t v28 = 136315138;
        swift_bridgeObjectRetain();
        sub_1A4B0BCCC(a1, a2, aBlock);
        sub_1A4CBB36C();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_1A4AF7000, v26, v27, "Ignore dismiss update received for handle ID: %s", v28, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1A6264920](v29, -1, -1);
        MEMORY[0x1A6264920](v28, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      uint64_t v35 = *(void **)(v4 + OBJC_IVAR___IMNicknameProvider_Impl_nicknameController);
      sub_1A4B0E048((uint64_t *)&unk_1EB3F1EF0);
      uint64_t v43 = swift_initStackObject();
      *(_OWORD *)(v43 + 16) = xmmword_1A4CD16F0;
      *(void *)(v43 + 32) = a1;
      *(void *)(v43 + 40) = a2;
      swift_bridgeObjectRetain();
      sub_1A4CB4824(v43);
      swift_setDeallocating();
      swift_arrayDestroy();
      uint64_t v44 = (void *)sub_1A4CBB1FC();
      swift_bridgeObjectRelease();
      id v39 = objc_msgSend(v35, sel_pendingNicknameForHandleIDs_, v44);

      if (v39) {
        goto LABEL_43;
      }
LABEL_44:
      swift_bridgeObjectRetain_n();
      uint64_t v47 = sub_1A4CBB01C();
      os_log_type_t v48 = sub_1A4CBB28C();
      if (!os_log_type_enabled(v47, v48)) {
        goto LABEL_47;
      }
      id v49 = (uint8_t *)swift_slowAlloc();
      uint64_t v50 = swift_slowAlloc();
      aBlock[0] = v50;
      *(_DWORD *)id v49 = 136315138;
      swift_bridgeObjectRetain();
      sub_1A4B0BCCC(a1, a2, aBlock);
      sub_1A4CBB36C();
      swift_bridgeObjectRelease_n();
      uint64_t v51 = "No pending nickname found for handle ID: %s";
      goto LABEL_46;
    case 4:
      if (qword_1EB3F1F60 != -1) {
        swift_once();
      }
      uint64_t v30 = sub_1A4CBB03C();
      sub_1A4B0C4D8(v30, (uint64_t)qword_1EB3F2570);
      swift_bridgeObjectRetain_n();
      id v31 = sub_1A4CBB01C();
      os_log_type_t v32 = sub_1A4CBB28C();
      if (os_log_type_enabled(v31, v32))
      {
        id v33 = (uint8_t *)swift_slowAlloc();
        uint64_t v34 = swift_slowAlloc();
        aBlock[0] = v34;
        *(_DWORD *)id v33 = 136315138;
        swift_bridgeObjectRetain();
        sub_1A4B0BCCC(a1, a2, aBlock);
        sub_1A4CBB36C();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_1A4AF7000, v31, v32, "Ignore dismiss revert received for handle ID: %s", v33, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1A6264920](v34, -1, -1);
        MEMORY[0x1A6264920](v33, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      uint64_t v35 = *(void **)(v4 + OBJC_IVAR___IMNicknameProvider_Impl_nicknameController);
      sub_1A4B0E048((uint64_t *)&unk_1EB3F1EF0);
      uint64_t v45 = swift_initStackObject();
      *(_OWORD *)(v45 + 16) = xmmword_1A4CD16F0;
      *(void *)(v45 + 32) = a1;
      *(void *)(v45 + 40) = a2;
      swift_bridgeObjectRetain();
      sub_1A4CB4824(v45);
      swift_setDeallocating();
      swift_arrayDestroy();
      id v46 = (void *)sub_1A4CBB1FC();
      swift_bridgeObjectRelease();
      id v39 = objc_msgSend(v35, sel_archivedNicknameForHandleIDs_, v46);

      if (v39)
      {
LABEL_43:
        objc_msgSend(v35, sel_markNicknameAsIgnored_, v39);
      }
      else
      {
LABEL_37:
        swift_bridgeObjectRetain_n();
        uint64_t v47 = sub_1A4CBB01C();
        os_log_type_t v48 = sub_1A4CBB28C();
        if (os_log_type_enabled(v47, v48))
        {
          id v49 = (uint8_t *)swift_slowAlloc();
          uint64_t v50 = swift_slowAlloc();
          aBlock[0] = v50;
          *(_DWORD *)id v49 = 136315138;
          swift_bridgeObjectRetain();
          sub_1A4B0BCCC(a1, a2, aBlock);
          sub_1A4CBB36C();
          swift_bridgeObjectRelease_n();
          uint64_t v51 = "No archived nickname found for handle ID: %s";
LABEL_46:
          _os_log_impl(&dword_1A4AF7000, v47, v48, v51, v49, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x1A6264920](v50, -1, -1);
          MEMORY[0x1A6264920](v49, -1, -1);
        }
        else
        {
LABEL_47:

          swift_bridgeObjectRelease_n();
        }
      }
      return;
    default:
      return;
  }
}

id IMNickname.isEqual(to:options:)(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(v2, sel_isUpdateFromNickname_withOptions_, a1, a2);
}

id sub_1A4CB3530(void *a1)
{
  return objc_msgSend(a1, sel_isUpdateFromNickname_withOptions_);
}

id sub_1A4CB353C(void *a1)
{
  uint64_t v2 = self;
  id v3 = a1;
  id v4 = objc_msgSend(v2, sel_sharedInstance);
  id v5 = objc_msgSend(v3, sel_handle);
  if (!v5)
  {
    sub_1A4CBB0CC();
    id v5 = (id)sub_1A4CBB0BC();
    swift_bridgeObjectRelease();
  }
  id v6 = objc_msgSend(v4, sel_hasObservedTransitionForHandleID_, v5);

  return v6;
}

id IMNickname.hasObservedTransition.getter()
{
  id v1 = objc_msgSend(self, sel_sharedInstance);
  id v2 = objc_msgSend(v0, sel_handle);
  if (!v2)
  {
    sub_1A4CBB0CC();
    id v2 = (id)sub_1A4CBB0BC();
    swift_bridgeObjectRelease();
  }
  id v3 = objc_msgSend(v1, sel_hasObservedTransitionForHandleID_, v2);

  return v3;
}

id sub_1A4CB369C(void *a1, uint64_t a2)
{
  return sub_1A4CB36C0(a1, a2, (SEL *)&selRef_isActiveForNickname_);
}

id IMNickname.isActive.getter()
{
  return sub_1A4CB3748((SEL *)&selRef_isActiveForNickname_);
}

id sub_1A4CB36B4(void *a1, uint64_t a2)
{
  return sub_1A4CB36C0(a1, a2, (SEL *)&selRef_isIgnoredForNickname_);
}

id sub_1A4CB36C0(void *a1, uint64_t a2, SEL *a3)
{
  id v5 = self;
  id v6 = a1;
  id v7 = objc_msgSend(v5, sel_sharedInstance);
  id v8 = objc_msgSend(v7, *a3, v6);

  return v8;
}

id IMNickname.isIgnored.getter()
{
  return sub_1A4CB3748((SEL *)&selRef_isIgnoredForNickname_);
}

id sub_1A4CB3748(SEL *a1)
{
  id v3 = objc_msgSend(self, sel_sharedInstance);
  id v4 = objc_msgSend(v3, *a1, v1);

  return v4;
}

uint64_t sub_1A4CB37AC(uint64_t a1, uint64_t a2, int *a3)
{
  id v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  id v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *id v4 = v3;
  v4[1] = sub_1A4C90918;
  return v6();
}

uint64_t sub_1A4CB3878(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  id v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *id v5 = v4;
  v5[1] = sub_1A4C90918;
  return v7();
}

uint64_t sub_1A4CB3944(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1A4CBB1DC();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1A4CBB1CC();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_1A4B0E2A4(a1, (uint64_t *)&unk_1EB3F2030);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1A4CBB1AC();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1A4CB3AF0(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1A4CB3BCC;
  return v6(a1);
}

uint64_t sub_1A4CB3BCC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1A4CB3CC4(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_1A4CBB63C();
  swift_bridgeObjectRetain();
  sub_1A4CBB0EC();
  uint64_t v8 = sub_1A4CBB65C();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_1A4CBB5EC() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      os_log_type_t v14 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
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
      if (v19 || (sub_1A4CBB5EC() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_1A4CB4154(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_1A4CB3E74()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_1A4B0E048(&qword_1E965DD18);
  uint64_t v3 = sub_1A4CBB41C();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v30 = (void *)(v2 + 56);
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
                  *uint64_t v30 = -1 << v29;
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
      BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_1A4CBB63C();
      sub_1A4CBB0EC();
      uint64_t result = sub_1A4CBB65C();
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
      BOOL v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *BOOL v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_1A4CB4154(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_1A4CB3E74();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_1A4CB42F0();
      goto LABEL_22;
    }
    sub_1A4CB44A4();
  }
  uint64_t v11 = *v4;
  sub_1A4CBB63C();
  sub_1A4CBB0EC();
  uint64_t result = sub_1A4CBB65C();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_1A4CBB5EC(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_1A4CBB60C();
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
        int64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_1A4CBB5EC();
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
  uint64_t v21 = (uint64_t *)(*(void *)(v20 + 48) + 16 * a3);
  *uint64_t v21 = v8;
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

void *sub_1A4CB42F0()
{
  uint64_t v1 = v0;
  sub_1A4B0E048(&qword_1E965DD18);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1A4CBB40C();
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
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    BOOL v19 = (void *)(*(void *)(v4 + 48) + v16);
    *BOOL v19 = *v17;
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

uint64_t sub_1A4CB44A4()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_1A4B0E048(&qword_1E965DD18);
  uint64_t v3 = sub_1A4CBB41C();
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
    BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_1A4CBB63C();
    swift_bridgeObjectRetain();
    sub_1A4CBB0EC();
    uint64_t result = sub_1A4CBB65C();
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
    int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *int64_t v13 = v20;
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

uint64_t sub_1A4CB4754(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_1A4AFB26C(a1, a2);
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
    sub_1A4C9BC40();
    uint64_t v9 = v12;
  }
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(*(void *)(v9 + 56) + 8 * v6);
  sub_1A4C9B88C(v6, v9);
  *uint64_t v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1A4CB4824(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_1A4CBB21C();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      uint64_t v6 = *v4;
      swift_bridgeObjectRetain();
      sub_1A4CB3CC4(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_1A4CB48BC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_1A4B0E048(&qword_1E965DD18);
    uint64_t v3 = sub_1A4CBB42C();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v25 = a1 + 32;
    while (1)
    {
      uint64_t v6 = (uint64_t *)(v25 + 16 * v4);
      uint64_t v8 = *v6;
      uint64_t v7 = v6[1];
      sub_1A4CBB63C();
      swift_bridgeObjectRetain();
      sub_1A4CBB0EC();
      uint64_t result = sub_1A4CBB65C();
      uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v11 = result & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        uint64_t v15 = *(void *)(v3 + 48);
        int64_t v16 = (void *)(v15 + 16 * v11);
        BOOL v17 = *v16 == v8 && v16[1] == v7;
        if (v17 || (uint64_t result = sub_1A4CBB5EC(), (result & 1) != 0))
        {
LABEL_3:
          swift_bridgeObjectRelease();
          goto LABEL_4;
        }
        uint64_t v18 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v18;
          unint64_t v12 = v11 >> 6;
          uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
          uint64_t v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0) {
            break;
          }
          BOOL v19 = (void *)(v15 + 16 * v11);
          if (*v19 != v8 || v19[1] != v7)
          {
            uint64_t result = sub_1A4CBB5EC();
            if ((result & 1) == 0) {
              continue;
            }
          }
          goto LABEL_3;
        }
      }
      *(void *)(v5 + 8 * v12) = v14 | v13;
      uint64_t v21 = (void *)(*(void *)(v3 + 48) + 16 * v11);
      *uint64_t v21 = v8;
      v21[1] = v7;
      uint64_t v22 = *(void *)(v3 + 16);
      BOOL v23 = __OFADD__(v22, 1);
      uint64_t v24 = v22 + 1;
      if (v23)
      {
        __break(1u);
        return result;
      }
      *(void *)(v3 + 16) = v24;
LABEL_4:
      if (++v4 == v1) {
        return v3;
      }
    }
  }
  return MEMORY[0x1E4FBC870];
}

uint64_t method lookup function for NicknameProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for NicknameProvider);
}

uint64_t dispatch thunk of NicknameProvider.haveNicknamesLoaded.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of NicknameProvider.nicknameForCurrentUser()()
{
  uint64_t v2 = *(int **)((*MEMORY[0x1E4FBC8C8] & *v0) + 0x98);
  uint64_t v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_1A4CB4BB0;
  return v5();
}

uint64_t sub_1A4CB4BB0(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t dispatch thunk of NicknameProvider.nickname(for:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA0))();
}

{
  void *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of NicknameProvider.currentNickname(for:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of NicknameProvider.pendingNickname(for:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of NicknameProvider.hasObservedTransition(for:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of NicknameProvider.markTransitionAsObserved(for:isAutoUpdate:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of NicknameProvider.allNicknames(for:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of NicknameProvider.updatePendingNickname(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of NicknameProvider.setPersonalNickname(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of NicknameProvider.setNicknameListener(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of NicknameProvider.sendPersonalNickname(to:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x100))();
}

uint64_t dispatch thunk of NicknameProvider.sendPersonalNickname(to:from:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x108))();
}

uint64_t dispatch thunk of NicknameProvider.sendNameOnly(to:from:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x110))();
}

uint64_t dispatch thunk of NicknameProvider.unknownSenderRecordInfo(for:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x118))();
}

uint64_t dispatch thunk of NicknameProvider.bannerActionTapped(from:on:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x120))();
}

unint64_t sub_1A4CB4FE0()
{
  unint64_t result = qword_1EB3F1ED0;
  if (!qword_1EB3F1ED0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EB3F1ED0);
  }
  return result;
}

uint64_t sub_1A4CB5020()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1A4CB5060()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_1A4C90044;
  uint64_t v5 = (uint64_t (*)(const void *, void *))((char *)&dword_1E965DCD0 + dword_1E965DCD0);
  return v5(v2, v3);
}

uint64_t sub_1A4CB5114()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1A4CB514C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1A4C90044;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1E965DD00 + dword_1E965DD00);
  return v6(a1, v4);
}

uint64_t sub_1A4CB5204(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1A4B0E048((uint64_t *)&unk_1E965B460);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void __swiftcall IMEmojiTapback.message(for:messageGUID:messagePart:messageSummaryInfo:threadIdentifier:)(IMMessage_optional *__return_ptr retstr, IMChat *a2, Swift::String messageGUID, _NSRange messagePart, Swift::OpaquePointer messageSummaryInfo, Swift::String_optional threadIdentifier)
{
}

id sub_1A4CB5324(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  uint64_t v13 = sub_1A4CBB0CC();
  uint64_t v15 = v14;
  uint64_t v16 = sub_1A4CBB0AC();
  if (a8)
  {
    uint64_t v17 = sub_1A4CBB0CC();
    a8 = v18;
  }
  else
  {
    uint64_t v17 = 0;
  }
  id v19 = a3;
  id v20 = a1;
  uint64_t v21 = (void *)sub_1A4CB5438(v13, v15, a5, a6, v16, v17, a8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v21;
}

uint64_t sub_1A4CB5438(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  uint64_t v8 = v7;
  unint64_t v11 = (void *)sub_1A4CBB09C();
  id v12 = objc_msgSend(v8, sel_adjustMessageSummaryInfoForSending_, v11);

  sub_1A4CBB0AC();
  uint64_t v13 = (void *)sub_1A4CBB09C();
  int64_t v29 = sub_1A4C99178;
  uint64_t v30 = 0;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v26 = 1107296256;
  BOOL v27 = sub_1A4C99238;
  uint64_t v28 = &unk_1EF8E61F0;
  uint64_t v14 = _Block_copy(&aBlock);
  swift_release();
  int64_t v29 = sub_1A4C99234;
  uint64_t v30 = 0;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v26 = 1107296256;
  BOOL v27 = sub_1A4C99238;
  uint64_t v28 = &unk_1EF8E62B8;
  uint64_t v15 = _Block_copy(&aBlock);
  swift_release();
  id v16 = objc_msgSend(v8, sel_backwardCompatibilityStringWithMessageSummaryInfo_isAdaptiveImageGlyphProvider_isCommSafetySensitiveProvider_, v13, v14, v15);
  _Block_release(v14);

  _Block_release(v15);
  uint64_t result = swift_isEscapingClosureAtFileLocation();
  if (result)
  {
    __break(1u);
    goto LABEL_9;
  }
  uint64_t result = swift_isEscapingClosureAtFileLocation();
  if (result)
  {
LABEL_9:
    __break(1u);
    return result;
  }
  uint64_t v18 = (void *)IMCreateSuperFormatStringFromPlainTextString();

  id v19 = (void *)sub_1A4CBB0BC();
  id v20 = objc_msgSend(v8, sel_associatedMessageType);
  id v21 = objc_msgSend(v8, sel_associatedMessageEmoji);
  if (!v21)
  {
    sub_1A4CBB0CC();
    id v21 = (id)sub_1A4CBB0BC();
    swift_bridgeObjectRelease();
  }
  uint64_t v22 = (void *)sub_1A4CBB09C();
  swift_bridgeObjectRelease();
  if (a7) {
    a7 = (void *)sub_1A4CBB0BC();
  }
  id v23 = objc_msgSend(self, sel_instantMessageWithAssociatedMessageContent_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_messageSummaryInfo_threadIdentifier_, v18, v19, v20, a3, a4, v21, v22, a7);

  return (uint64_t)v23;
}

id IMCoreHelloWorldClass.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id IMCoreHelloWorldClass.init()()
{
  uint64_t v1 = OBJC_IVAR___IMCoreHelloWorldClass_Impl_sharedUtilitiesHelloWorld;
  id v2 = objc_allocWithZone((Class)sub_1A4CBAF7C());
  uint64_t v3 = v0;
  *(void *)&v0[v1] = objc_msgSend(v2, sel_init);
  uint64_t v4 = OBJC_IVAR___IMCoreHelloWorldClass_Impl_persistenceHelloWorld;
  *(void *)&v3[v4] = objc_msgSend(objc_allocWithZone((Class)sub_1A4CBAF2C()), sel_init);

  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for IMCoreHelloWorldClass();
  return objc_msgSendSuper2(&v6, sel_init);
}

uint64_t type metadata accessor for IMCoreHelloWorldClass()
{
  return self;
}

uint64_t sub_1A4CB59B0()
{
  return sub_1A4CBAF1C();
}

id IMCoreHelloWorldClass.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IMCoreHelloWorldClass();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t IMCoreHelloWorld.init()()
{
  return sub_1A4CBAEFC();
}

uint64_t type metadata accessor for IMCoreHelloWorld()
{
  uint64_t result = qword_1E965DD30;
  if (!qword_1E965DD30) {
    return swift_getSingletonMetadata();
  }
  return result;
}

Swift::Void __swiftcall IMCoreHelloWorld.printGreeting()()
{
}

uint64_t method lookup function for IMCoreHelloWorldClass(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for IMCoreHelloWorldClass);
}

uint64_t dispatch thunk of IMCoreHelloWorldClass.printGreeting()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x60))();
}

uint64_t *initializeBufferWithCopyOfBuffer for IMCoreHelloWorld(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1A4CBAF5C();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_1A4CBAF0C();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  }
  return a1;
}

uint64_t destroy for IMCoreHelloWorld(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1A4CBAF5C();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = sub_1A4CBAF0C();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);

  return v7(v5, v6);
}

uint64_t initializeWithCopy for IMCoreHelloWorld(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1A4CBAF5C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_1A4CBAF0C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  return a1;
}

uint64_t assignWithCopy for IMCoreHelloWorld(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1A4CBAF5C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_1A4CBAF0C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t initializeWithTake for IMCoreHelloWorld(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1A4CBAF5C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_1A4CBAF0C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  return a1;
}

uint64_t assignWithTake for IMCoreHelloWorld(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1A4CBAF5C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_1A4CBAF0C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for IMCoreHelloWorld(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1A4CB607C);
}

uint64_t sub_1A4CB607C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1A4CBAF5C();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = sub_1A4CBAF0C();
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 20);
    return v11(v13, a2, v12);
  }
}

uint64_t storeEnumTagSinglePayload for IMCoreHelloWorld(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1A4CB6188);
}

uint64_t sub_1A4CB6188(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_1A4CBAF5C();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = sub_1A4CBAF0C();
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 20);
    return v13(v15, a2, a2, v14);
  }
}

uint64_t sub_1A4CB628C()
{
  uint64_t result = sub_1A4CBAF5C();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_1A4CBAF0C();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

id sub_1A4CB64D4()
{
  swift_getObjectType();
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  id v14 = objc_msgSend(v0, sel_totalMessageCount);
  id v13 = objc_msgSend(v0, sel_syncedMessageCount);
  id v1 = objc_msgSend(v0, sel_unresolvedMessageCount);
  id v2 = objc_msgSend(v0, sel_totalChatCount);
  id v3 = objc_msgSend(v0, sel_syncedChatCount);
  id v4 = objc_msgSend(v0, sel_unresolvedChatCount);
  id v5 = objc_msgSend(v0, sel_totalAttachmentCount);
  id v6 = objc_msgSend(v0, sel_syncedAttachmentCount);
  id v7 = objc_msgSend(v0, sel_unresolvedAttachmentCount);
  uint64_t v8 = MEMORY[0x1E4FBC860];
  sub_1A4C997D4(MEMORY[0x1E4FBC860]);
  uint64_t v9 = (void *)sub_1A4CBB09C();
  swift_bridgeObjectRelease();
  sub_1A4C99A34(v8);
  sub_1A4B0C510(0, &qword_1E965DD40);
  uint64_t v10 = (void *)sub_1A4CBB09C();
  swift_bridgeObjectRelease();
  id v11 = objc_msgSend(ObjCClassFromMetadata, sel__createSyncStatisticsDictionary_messageSyncCount_messageUnresolvedCount_chatCount_chatSyncCount_chatUnresolvedCount_attachmentCount_attachmentSyncCount_attachmentUnresolvedCount_serverRecordCounts_syncStoreCounts_, v14, v13, v1, v2, v3, v4, v5, v6, v7, v9, v10);

  return v11;
}

uint64_t sub_1A4CB66F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  sub_1A4B0E048(&qword_1E965DD48);
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_1A4CD20D0;
  uint64_t v19 = sub_1A4CBB0CC();
  uint64_t v20 = MEMORY[0x1E4FBB1A0];
  *(void *)(v18 + 32) = v19;
  *(void *)(v18 + 40) = v21;
  uint64_t v22 = MEMORY[0x1E4FBC1C8];
  *(void *)(v18 + 88) = MEMORY[0x1E4FBC1C8];
  *(void *)(v18 + 56) = v20;
  *(void *)(v18 + 64) = a1;
  *(void *)(v18 + 96) = sub_1A4CBB0CC();
  *(void *)(v18 + 104) = v23;
  *(void *)(v18 + 152) = v22;
  *(void *)(v18 + 120) = v20;
  *(void *)(v18 + 128) = a2;
  *(void *)(v18 + 160) = sub_1A4CBB0CC();
  *(void *)(v18 + 168) = v24;
  *(void *)(v18 + 216) = v22;
  *(void *)(v18 + 184) = v20;
  *(void *)(v18 + 192) = a3;
  *(void *)(v18 + 224) = sub_1A4CBB0CC();
  *(void *)(v18 + 232) = v25;
  *(void *)(v18 + 280) = v22;
  *(void *)(v18 + 248) = v20;
  *(void *)(v18 + 256) = a4;
  *(void *)(v18 + 288) = sub_1A4CBB0CC();
  *(void *)(v18 + 296) = v26;
  *(void *)(v18 + 344) = v22;
  *(void *)(v18 + 312) = v20;
  *(void *)(v18 + 320) = a5;
  *(void *)(v18 + 352) = sub_1A4CBB0CC();
  *(void *)(v18 + 360) = v27;
  *(void *)(v18 + 408) = v22;
  *(void *)(v18 + 376) = v20;
  *(void *)(v18 + 384) = a6;
  *(void *)(v18 + 416) = sub_1A4CBB0CC();
  *(void *)(v18 + 424) = v28;
  *(void *)(v18 + 472) = v22;
  *(void *)(v18 + 440) = v20;
  *(void *)(v18 + 448) = a7;
  *(void *)(v18 + 480) = sub_1A4CBB0CC();
  *(void *)(v18 + 488) = v29;
  *(void *)(v18 + 536) = v22;
  *(void *)(v18 + 504) = v20;
  *(void *)(v18 + 512) = a8;
  uint64_t v30 = sub_1A4CBB0CC();
  *(void *)(v18 + 568) = v20;
  *(void *)(v18 + 544) = v30;
  *(void *)(v18 + 552) = v31;
  *(void *)(v18 + 600) = v22;
  *(void *)(v18 + 576) = a9;
  uint64_t result = sub_1A4CBB0CC();
  *(void *)(v18 + 632) = v20;
  *(void *)(v18 + 608) = result;
  *(void *)(v18 + 616) = v33;
  uint64_t v34 = a5 + a2;
  if (__OFADD__(a5, a2))
  {
    __break(1u);
    goto LABEL_7;
  }
  BOOL v35 = __OFADD__(v34, a8);
  uint64_t v36 = v34 + a8;
  if (v35)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  *(void *)(v18 + 664) = v22;
  *(void *)(v18 + 640) = v36;
  uint64_t result = sub_1A4CBB0CC();
  *(void *)(v18 + 696) = v20;
  *(void *)(v18 + 672) = result;
  *(void *)(v18 + 680) = v37;
  uint64_t v38 = a4 + a1;
  if (__OFADD__(a4, a1))
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  BOOL v35 = __OFADD__(v38, a7);
  uint64_t v39 = v38 + a7;
  if (!v35)
  {
    *(void *)(v18 + 728) = v22;
    *(void *)(v18 + 704) = v39;
    *(void *)(v18 + 760) = v20;
    strcpy((char *)(v18 + 736), "serverCounts");
    *(unsigned char *)(v18 + 749) = 0;
    *(_WORD *)(v18 + 750) = -5120;
    *(void *)(v18 + 792) = sub_1A4B0E048((uint64_t *)&unk_1E965B5F0);
    *(void *)(v18 + 768) = a10;
    *(void *)(v18 + 824) = v20;
    *(void *)(v18 + 800) = 0x726F7453636E7973;
    *(void *)(v18 + 808) = 0xEF73746E756F4365;
    *(void *)(v18 + 856) = sub_1A4B0E048(&qword_1E965DD50);
    *(void *)(v18 + 832) = a11;
    sub_1A4B0C510(0, &qword_1E965DD58);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return sub_1A4CBB23C();
  }
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_1A4CB69DC(uint64_t a1, double a2, double a3, double a4)
{
  if (a1 == 2)
  {
    uint64_t result = swift_getObjCClassFromMetadata();
    if (a3 > -9.22337204e18)
    {
      if (a3 < 9.22337204e18)
      {
        if (a2 > -9.22337204e18)
        {
          if (a2 < 9.22337204e18)
          {
            if ((*(void *)&a2 & 0x7FF0000000000000) != 0x7FF0000000000000
              && (*(void *)&a3 & 0x7FF0000000000000) != 0x7FF0000000000000
              && (*(void *)&a4 & 0x7FF0000000000000) != 0x7FF0000000000000)
            {
              if (a4 > -9.22337204e18)
              {
                if (a4 < 9.22337204e18)
                {
                  id v16 = (void *)result;
                  uint64_t v17 = MEMORY[0x1E4FBC860];
                  sub_1A4C997D4(MEMORY[0x1E4FBC860]);
                  uint64_t v10 = (void *)sub_1A4CBB09C();
                  swift_bridgeObjectRelease();
                  sub_1A4C99A34(v17);
                  sub_1A4B0C510(0, &qword_1E965DD40);
                  id v11 = (void *)sub_1A4CBB09C();
                  swift_bridgeObjectRelease();
                  id v18 = objc_msgSend(v16, sel__createSyncStatisticsDictionary_messageSyncCount_messageUnresolvedCount_chatCount_chatSyncCount_chatUnresolvedCount_attachmentCount_attachmentSyncCount_attachmentUnresolvedCount_serverRecordCounts_syncStoreCounts_, 0, 0, 0, (uint64_t)a3, (uint64_t)a2, (uint64_t)a4, 0, 0, 0, v10, v11);
LABEL_34:
                  id v21 = v18;

                  return (uint64_t)v21;
                }
                goto LABEL_48;
              }
LABEL_47:
              __break(1u);
LABEL_48:
              __break(1u);
              goto LABEL_49;
            }
LABEL_46:
            __break(1u);
            goto LABEL_47;
          }
LABEL_45:
          __break(1u);
          goto LABEL_46;
        }
LABEL_44:
        __break(1u);
        goto LABEL_45;
      }
LABEL_43:
      __break(1u);
      goto LABEL_44;
    }
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  if (a1 == 3)
  {
    uint64_t result = swift_getObjCClassFromMetadata();
    if (a3 <= -9.22337204e18)
    {
      __break(1u);
    }
    else if (a3 < 9.22337204e18)
    {
      if (a2 > -9.22337204e18)
      {
        if (a2 < 9.22337204e18)
        {
          if ((*(void *)&a2 & 0x7FF0000000000000) != 0x7FF0000000000000
            && (*(void *)&a3 & 0x7FF0000000000000) != 0x7FF0000000000000
            && (*(void *)&a4 & 0x7FF0000000000000) != 0x7FF0000000000000)
          {
            if (a4 > -9.22337204e18)
            {
              if (a4 < 9.22337204e18)
              {
                uint64_t v8 = (void *)result;
                uint64_t v9 = MEMORY[0x1E4FBC860];
                sub_1A4C997D4(MEMORY[0x1E4FBC860]);
                uint64_t v10 = (void *)sub_1A4CBB09C();
                swift_bridgeObjectRelease();
                sub_1A4C99A34(v9);
                sub_1A4B0C510(0, &qword_1E965DD40);
                id v11 = (void *)sub_1A4CBB09C();
                swift_bridgeObjectRelease();
                uint64_t v25 = v10;
                uint64_t v26 = v11;
                uint64_t v23 = (uint64_t)a2;
                uint64_t v24 = (uint64_t)a4;
                uint64_t v22 = (uint64_t)a3;
                uint64_t v12 = v8;
                uint64_t v13 = 0;
                uint64_t v14 = 0;
                uint64_t v15 = 0;
LABEL_33:
                id v18 = objc_msgSend(v12, sel__createSyncStatisticsDictionary_messageSyncCount_messageUnresolvedCount_chatCount_chatSyncCount_chatUnresolvedCount_attachmentCount_attachmentSyncCount_attachmentUnresolvedCount_serverRecordCounts_syncStoreCounts_, v13, v14, v15, 0, 0, 0, v22, v23, v24, v25, v26);
                goto LABEL_34;
              }
              goto LABEL_41;
            }
LABEL_40:
            __break(1u);
LABEL_41:
            __break(1u);
            goto LABEL_42;
          }
LABEL_39:
          __break(1u);
          goto LABEL_40;
        }
LABEL_38:
        __break(1u);
        goto LABEL_39;
      }
LABEL_37:
      __break(1u);
      goto LABEL_38;
    }
    __break(1u);
    goto LABEL_37;
  }
  uint64_t result = swift_getObjCClassFromMetadata();
  if (a3 <= -9.22337204e18)
  {
LABEL_49:
    __break(1u);
    goto LABEL_50;
  }
  if (a3 >= 9.22337204e18)
  {
LABEL_50:
    __break(1u);
    goto LABEL_51;
  }
  if (a2 <= -9.22337204e18)
  {
LABEL_51:
    __break(1u);
    goto LABEL_52;
  }
  if (a2 >= 9.22337204e18)
  {
LABEL_52:
    __break(1u);
LABEL_53:
    __break(1u);
    goto LABEL_54;
  }
  if ((*(void *)&a2 & 0x7FF0000000000000) == 0x7FF0000000000000
    || (*(void *)&a3 & 0x7FF0000000000000) == 0x7FF0000000000000
    || (*(void *)&a4 & 0x7FF0000000000000) == 0x7FF0000000000000)
  {
    goto LABEL_53;
  }
  if (a4 <= -9.22337204e18)
  {
LABEL_54:
    __break(1u);
    goto LABEL_55;
  }
  if (a4 < 9.22337204e18)
  {
    uint64_t v19 = (void *)result;
    uint64_t v20 = MEMORY[0x1E4FBC860];
    sub_1A4C997D4(MEMORY[0x1E4FBC860]);
    uint64_t v10 = (void *)sub_1A4CBB09C();
    swift_bridgeObjectRelease();
    sub_1A4C99A34(v20);
    sub_1A4B0C510(0, &qword_1E965DD40);
    id v11 = (void *)sub_1A4CBB09C();
    swift_bridgeObjectRelease();
    uint64_t v22 = 0;
    uint64_t v23 = 0;
    uint64_t v25 = v10;
    uint64_t v26 = v11;
    uint64_t v24 = 0;
    uint64_t v12 = v19;
    uint64_t v13 = (uint64_t)a3;
    uint64_t v14 = (uint64_t)a2;
    uint64_t v15 = (uint64_t)a4;
    goto LABEL_33;
  }
LABEL_55:
  __break(1u);
  return result;
}

void sub_1A4CB6F14(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_1A4AF7000, log, OS_LOG_TYPE_ERROR, "Process that does not support pinning attempted to initialize IMPinnedConversationController", v1, 2u);
}

void sub_1A4CB6F58(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A4AF7000, a2, OS_LOG_TYPE_ERROR, "migratedPinConfig is nil, but localPinConfig was not. localPinConfig: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1A4CB6FD0()
{
  sub_1A4B40310();
  sub_1A4B40328(&dword_1A4AF7000, v0, v1, "Pin config migration failed. We migrated the given pin config, but the migrated pin config had a different version. given config: %@, migrated config: %@");
}

void sub_1A4CB7038()
{
  sub_1A4B40310();
  sub_1A4B40328(&dword_1A4AF7000, v0, v1, "Pin config migration failed. We migrated the given pin config, but the migrated pin config was not valid. given config: %@, migrated config: %@");
}

void sub_1A4CB70A0(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1A4AF7000, log, OS_LOG_TYPE_ERROR, "Pin config migration from version 1 to higher versions is not supported. If some of the chats in the pin config were group SMS chats, they may not pin properly. Please update all of your devices to the latest build and re-pin the offending group SMS chats.", v1, 2u);
}

void sub_1A4CB70E4(uint64_t a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend_account(*(void **)(a1 + 32), a2, a3, a4);
  uint64_t v9 = objc_msgSend_service(v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_internalName(v9, v10, v11, v12);
  int v14 = 138412290;
  uint64_t v15 = v13;
  _os_log_fault_impl(&dword_1A4AF7000, (os_log_t)a2, OS_LOG_TYPE_FAULT, "Assuming hybrid groups are eligible for unexpected service %@", (uint8_t *)&v14, 0xCu);
}

void sub_1A4CB71A8(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1A4AF7000, log, OS_LOG_TYPE_ERROR, "IMService ******* This is unexpected. atSign > [email length]. Email %@ doman %@", (uint8_t *)&v3, 0x16u);
}

void sub_1A4CB7230(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A4AF7000, a2, OS_LOG_TYPE_ERROR, "Failed to find conversation with requested UUID %@", (uint8_t *)&v2, 0xCu);
}

void sub_1A4CB72A8(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1A4AF7000, log, OS_LOG_TYPE_ERROR, "tapback descriptor is nil", v1, 2u);
}

void sub_1A4CB72EC(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  __int16 v5 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, a3, a4);
  uint64_t v8 = objc_msgSend_stringWithUTF8String_(NSString, v6, (uint64_t)"void *WebPrivacyLibrary(void)", v7);
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v5, v9, (uint64_t)v8, @"IMWebPrivacyUtilities.m", 32, @"%s", *a1);

  __break(1u);
}

void sub_1A4CB736C(uint64_t a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  __int16 v5 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, a2, a1, a4);
  int v6 = 138412290;
  uint64_t v7 = v5;
  _os_log_error_impl(&dword_1A4AF7000, (os_log_t)a2, OS_LOG_TYPE_ERROR, "unrecognized KT status received: %@", (uint8_t *)&v6, 0xCu);
}

void sub_1A4CB7410(uint64_t a1, void *a2, NSObject *a3, uint64_t a4)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v6 = objc_msgSend_vettedAliases(a2, (const char *)a2, (uint64_t)a3, a4);
  int v7 = 138412546;
  uint64_t v8 = a1;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  _os_log_error_impl(&dword_1A4AF7000, a3, OS_LOG_TYPE_ERROR, " Attempted to change display name to %@, but it wasn't in vetted set (%@)", (uint8_t *)&v7, 0x16u);
}

void sub_1A4CB74C8(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl(&dword_1A4AF7000, log, OS_LOG_TYPE_DEBUG, "Fetching sync statistics", v1, 2u);
}

void sub_1A4CB750C(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1A4AF7000, log, OS_LOG_TYPE_ERROR, "statistics dictionary is unexpectedly nil", v1, 2u);
}

void sub_1A4CB7550(void *a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  __int16 v5 = objc_msgSend_description(a1, a2, a3, a4);
  int v6 = 138412290;
  int v7 = v5;
  _os_log_debug_impl(&dword_1A4AF7000, (os_log_t)a2, OS_LOG_TYPE_DEBUG, "fetched sync state statistics: %@", (uint8_t *)&v6, 0xCu);
}

void sub_1A4CB75E8(void *a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  __int16 v5 = objc_msgSend_error(a1, a2, a3, a4);
  int v6 = 138412290;
  int v7 = v5;
  _os_log_error_impl(&dword_1A4AF7000, (os_log_t)a2, OS_LOG_TYPE_ERROR, "Got error fetching sync statistics: %@", (uint8_t *)&v6, 0xCu);
}

void sub_1A4CB7680(os_log_t log, double a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  double v3 = a2;
  _os_log_debug_impl(&dword_1A4AF7000, log, OS_LOG_TYPE_DEBUG, "Deferring send progress to event listeners for %f sec", (uint8_t *)&v2, 0xCu);
}

void sub_1A4CB76FC(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl(&dword_1A4AF7000, log, OS_LOG_TYPE_DEBUG, "We have progress listeners, attempting to send progress...", v1, 2u);
}

void sub_1A4CB7740(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1A4AF7000, log, OS_LOG_TYPE_ERROR, "No handle ID provided", v1, 2u);
}

void sub_1A4CB7784(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1A4AF7000, log, OS_LOG_TYPE_ERROR, "Nickname feature is not enabled", v1, 2u);
}

void sub_1A4CB77C8(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  int v2 = "-[IMNicknameController createSharedProfileStateOracleForHandles:]";
  _os_log_error_impl(&dword_1A4AF7000, log, OS_LOG_TYPE_ERROR, "No recipients provided for %s", (uint8_t *)&v1, 0xCu);
}

void sub_1A4CB784C(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A4AF7000, a2, OS_LOG_TYPE_ERROR, "Cache miss lookup failed with error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1A4CB78C4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, a3, a4);
  int v7 = objc_msgSend_stringWithUTF8String_(NSString, v5, (uint64_t)"Class getPXPhotoKitMomentShareStatusClass(void)_block_invoke", v6);
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v4, v8, (uint64_t)v7, @"IMMomentSharePresentationCache.m", 26, @"Unable to find class %s", "PXPhotoKitMomentShareStatus");

  __break(1u);
}

void sub_1A4CB7940(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  __int16 v5 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, a3, a4);
  uint64_t v8 = objc_msgSend_stringWithUTF8String_(NSString, v6, (uint64_t)"void *PhotosUICoreLibrary(void)", v7);
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v5, v9, (uint64_t)v8, @"IMMomentSharePresentationCache.m", 25, @"%s", *a1);

  __break(1u);
}

void sub_1A4CB79C0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, a3, a4);
  uint64_t v7 = objc_msgSend_stringWithUTF8String_(NSString, v5, (uint64_t)"Class getPXMomentShareStatusPresentationClass(void)_block_invoke", v6);
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v4, v8, (uint64_t)v7, @"IMMomentSharePresentationCache.m", 27, @"Unable to find class %s", "PXMomentShareStatusPresentation");

  __break(1u);
}

void sub_1A4CB7A3C(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_1A4AF7000, log, OS_LOG_TYPE_ERROR, "Failed to create SyndicationAction", v1, 2u);
}

void sub_1A4CB7A80()
{
  sub_1A4BA8010();
  sub_1A4BA7FF4(&dword_1A4AF7000, v0, v1, "CMM state was zero in the client!", v2, v3, v4, v5, v6);
}

void sub_1A4CB7AB4(void *a1)
{
  objc_end_catch();
}

void sub_1A4CB7AE4()
{
  sub_1A4BA8010();
  sub_1A4BA7FF4(&dword_1A4AF7000, v0, v1, "Message text contains a part index that has been retracted, ignoring it.", v2, v3, v4, v5, v6);
}

void sub_1A4CB7B18()
{
  sub_1A4BA8010();
  sub_1A4BA7FF4(&dword_1A4AF7000, v0, v1, "File transfer missing for multi-character message with a first character transfer, assuming that character is a genmoji.", v2, v3, v4, v5, v6);
}

void sub_1A4CB7B4C()
{
  sub_1A4BA8010();
  sub_1A4BA7FF4(&dword_1A4AF7000, v0, v1, "Message part references a non-genmoji file transfer at the first character, followed by other text content. The text content will not be displayed.", v2, v3, v4, v5, v6);
}

void sub_1A4CB7B80()
{
  sub_1A4BA8010();
  sub_1A4BA7FF4(&dword_1A4AF7000, v0, v1, "File transfer missing for message with a first character transfer, assuming that character is a genmoji.", v2, v3, v4, v5, v6);
}

void sub_1A4CB7BB4()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  sub_1A4BA801C();
  uint64_t v1 = "additionalIDToHandleNameMap";
  _os_log_error_impl(&dword_1A4AF7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v0, 0x16u);
}

void sub_1A4CB7C48()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  sub_1A4BA801C();
  uint64_t v1 = "additionalIDToHandleNameMap";
  _os_log_error_impl(&dword_1A4AF7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v0, 0x16u);
}

void sub_1A4CB7CDC(void *a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_guid(a1, a2, a3, a4);
  int v6 = 138412290;
  uint64_t v7 = v5;
  _os_log_fault_impl(&dword_1A4AF7000, (os_log_t)a2, OS_LOG_TYPE_FAULT, "transferGUID is nil. ChatItem's GUID is %@", (uint8_t *)&v6, 0xCu);
}

void sub_1A4CB7D74(void *a1, NSObject *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_opt_class();
  id v5 = v4;
  __int16 v9 = objc_msgSend_guid(a1, v6, v7, v8);
  int v10 = 138412546;
  uint64_t v11 = v4;
  __int16 v12 = 2112;
  uint64_t v13 = v9;
  _os_log_fault_impl(&dword_1A4AF7000, a2, OS_LOG_TYPE_FAULT, "%@ transferGUIDs is nil. ChatItem's GUID is %@", (uint8_t *)&v10, 0x16u);
}

void sub_1A4CB7E3C(void *a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend_localizedDescription(a1, a2, a3, a4);
  int v6 = 138412290;
  uint64_t v7 = v5;
  _os_log_error_impl(&dword_1A4AF7000, (os_log_t)a2, OS_LOG_TYPE_ERROR, "Request Satellite error: %@", (uint8_t *)&v6, 0xCu);
}

void sub_1A4CB7ED4(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A4AF7000, a2, OS_LOG_TYPE_ERROR, "Error sharing off grid mode with handle: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1A4CB7F4C(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A4AF7000, a2, OS_LOG_TYPE_ERROR, "Error sharing availbaility with handle: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1A4CB7FC4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A4AF7000, log, OS_LOG_TYPE_ERROR, "BrandURI cannot be nil", v1, 2u);
}

void sub_1A4CB8008(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A4AF7000, log, OS_LOG_TYPE_ERROR, "Attempted to register a nil listener", v1, 2u);
}

void sub_1A4CB804C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A4AF7000, log, OS_LOG_TYPE_ERROR, "Attempted to unregister a nil listener", v1, 2u);
}

void sub_1A4CB8090(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A4AF7000, a2, OS_LOG_TYPE_ERROR, "Error prewarming the opening of sharedPhotoLibrary: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1A4CB8108(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, a3, a4);
  uint64_t v7 = objc_msgSend_stringWithUTF8String_(NSString, v5, (uint64_t)"Class getPHAssetClass(void)_block_invoke", v6);
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v4, v8, (uint64_t)v7, @"IMPhotoLibraryPersistenceManager.m", 21, @"Unable to find class %s", "PHAsset");

  __break(1u);
}

void sub_1A4CB8184(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  id v5 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, a3, a4);
  uint64_t v8 = objc_msgSend_stringWithUTF8String_(NSString, v6, (uint64_t)"void *PhotosLibrary(void)", v7);
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v5, v9, (uint64_t)v8, @"IMPhotoLibraryPersistenceManager.m", 20, @"%s", *a1);

  __break(1u);
}

void sub_1A4CB8204(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, a3, a4);
  uint64_t v7 = objc_msgSend_stringWithUTF8String_(NSString, v5, (uint64_t)"Class getPHPhotoLibraryClass(void)_block_invoke", v6);
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v4, v8, (uint64_t)v7, @"IMPhotoLibraryPersistenceManager.m", 22, @"Unable to find class %s", "PHPhotoLibrary");

  __break(1u);
}

void sub_1A4CB8280()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  sub_1A4BC190C();
  _os_log_error_impl(&dword_1A4AF7000, v0, OS_LOG_TYPE_ERROR, "Failed to find a sending handle. Dropping notice %@ to %@", v1, 0x16u);
}

void sub_1A4CB82F8()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  sub_1A4BC190C();
  _os_log_error_impl(&dword_1A4AF7000, v0, OS_LOG_TYPE_ERROR, "Failed to find a sending handle. Dropping clear notice %@ to %@", v1, 0x16u);
}

void sub_1A4CB8370()
{
  sub_1A4BC2CC8();
  sub_1A4BC2CAC(&dword_1A4AF7000, v0, v1, "Invalid chat identifier: %@, can't open application", v2, v3, v4, v5, v6);
}

void sub_1A4CB83D8(void *a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_localizedDescription(a1, a2, a3, a4);
  sub_1A4BC2CC8();
  _os_log_error_impl(&dword_1A4AF7000, (os_log_t)a2, OS_LOG_TYPE_ERROR, "Request Stewie error: %@", v6, 0xCu);
}

void sub_1A4CB8470()
{
  sub_1A4BC2CC8();
  sub_1A4BC2CAC(&dword_1A4AF7000, v0, v1, "DialRequest isn't valid %@", v2, v3, v4, v5, v6);
}

void sub_1A4CB84D8()
{
  sub_1A4BC2CC8();
  sub_1A4BC2CAC(&dword_1A4AF7000, v0, v1, "Requesting to place emergency call: %@", v2, v3, v4, v5, v6);
}

void sub_1A4CB8540()
{
  sub_1A4BC2CC8();
  sub_1A4BC2CAC(&dword_1A4AF7000, v0, v1, "Failed to trigger dialRequest: %@", v2, v3, v4, v5, v6);
}

void sub_1A4CB85A8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A4AF7000, log, OS_LOG_TYPE_ERROR, "No providers are available right now", v1, 2u);
}

void sub_1A4CB85EC()
{
  sub_1A4BC2CC8();
  sub_1A4BC2CAC(&dword_1A4AF7000, v0, v1, "fetchRoadsideProvidersWithContext failed with error: %@", v2, v3, v4, v5, v6);
}

void sub_1A4CB8654()
{
  sub_1A4BC73D4();
  sub_1A4BC73B8(&dword_1A4AF7000, MEMORY[0x1E4F14500], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, 2u);
}

void sub_1A4CB86DC()
{
  sub_1A4BC73D4();
  sub_1A4BC73B8(&dword_1A4AF7000, MEMORY[0x1E4F14500], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, 2u);
}

void sub_1A4CB8764()
{
  sub_1A4BC73D4();
  sub_1A4BC73B8(&dword_1A4AF7000, MEMORY[0x1E4F14500], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, 2u);
}

void sub_1A4CB87EC()
{
  sub_1A4BA8010();
  sub_1A4BA7FF4(&dword_1A4AF7000, v0, v1, "tapback descriptor cannot be nil", v2, v3, v4, v5, v6);
}

void sub_1A4CB8820()
{
  sub_1A4BA8010();
  sub_1A4BA7FF4(&dword_1A4AF7000, v0, v1, "chat cannot be nil", v2, v3, v4, v5, v6);
}

void sub_1A4CB8854()
{
  sub_1A4BA8010();
  sub_1A4BA7FF4(&dword_1A4AF7000, v0, v1, "messageGUID cannot be nil", v2, v3, v4, v5, v6);
}

void sub_1A4CB8888()
{
  sub_1A4BA8010();
  sub_1A4BA7FF4(&dword_1A4AF7000, v0, v1, "message summary info cannot be nil", v2, v3, v4, v5, v6);
}

void sub_1A4CB88BC()
{
  sub_1A4BA8010();
  sub_1A4BA7FF4(&dword_1A4AF7000, v0, v1, "message content type must be set on message summary info", v2, v3, v4, v5, v6);
}

void sub_1A4CB88F0()
{
  sub_1A4BA8010();
  sub_1A4BA7FF4(&dword_1A4AF7000, v0, v1, "Backward compatibility string cannot be nil", v2, v3, v4, v5, v6);
}

void sub_1A4CB8924()
{
  sub_1A4BA8010();
  sub_1A4BA7FF4(&dword_1A4AF7000, v0, v1, "Attributed content string cannot be nil", v2, v3, v4, v5, v6);
}

void sub_1A4CB8958()
{
  sub_1A4BA8010();
  _os_log_fault_impl(&dword_1A4AF7000, v0, OS_LOG_TYPE_FAULT, "chatItemRules are nil", v1, 2u);
}

void sub_1A4CB8998()
{
  sub_1A4BA8010();
  sub_1A4BA7FF4(&dword_1A4AF7000, v0, v1, "Stewie chat has no participants", v2, v3, v4, v5, v6);
}

void sub_1A4CB89CC()
{
  sub_1A4BA8010();
  sub_1A4BA7FF4(&dword_1A4AF7000, v0, v1, "Requested to report RCS spam for a non-RCS message!", v2, v3, v4, v5, v6);
}

void sub_1A4CB8A00()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  sub_1A4BC2CC8();
  sub_1A4BF4A30(&dword_1A4AF7000, v0, v1, "Failed to decode summary from chat properties %@", v2);
}

void sub_1A4CB8A6C()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  sub_1A4BC2CC8();
  sub_1A4BF4A30(&dword_1A4AF7000, v0, v1, "Invalid businessID: %@", v2);
}

void sub_1A4CB8AD8()
{
  sub_1A4BA8010();
  sub_1A4BA7FF4(&dword_1A4AF7000, v0, v1, "Setting associated bizID is not supported", v2, v3, v4, v5, v6);
}

void sub_1A4CB8B0C()
{
  sub_1A4BA8010();
  sub_1A4BA7FF4(&dword_1A4AF7000, v0, v1, "Not updating sortID of edited message item, the previous message had a sortID of 0", v2, v3, v4, v5, v6);
}

void sub_1A4CB8B40()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  sub_1A4BC2CC8();
  sub_1A4BF4A30(&dword_1A4AF7000, v0, v1, "Did not find a valid date to send the message. Date: %@", v2);
}

void sub_1A4CB8BAC(void *a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_guid(a1, a2, a3, a4);
  sub_1A4BC2CC8();
  sub_1A4BF4A30(&dword_1A4AF7000, a2, v6, "**Bailing**, Tried to Edit the schedule time of a non-scheduled message with guid %@ ", v7);
}

void sub_1A4CB8C38()
{
  sub_1A4BA8010();
  sub_1A4BA7FF4(&dword_1A4AF7000, v0, v1, "Not resending group photo for chat that did not have a group photo", v2, v3, v4, v5, v6);
}

void sub_1A4CB8C6C()
{
  sub_1A4BA8010();
  sub_1A4BA7FF4(&dword_1A4AF7000, v0, v1, "No chat property specified, aborting.", v2, v3, v4, v5, v6);
}

void sub_1A4CB8CA0()
{
  sub_1A4BA8010();
  sub_1A4BA7FF4(&dword_1A4AF7000, v0, v1, "Not able share focus status in non 1-1 chat, this method should not have been called", v2, v3, v4, v5, v6);
}

void sub_1A4CB8CD4()
{
  sub_1A4BA8010();
  sub_1A4BA7FF4(&dword_1A4AF7000, v0, v1, "Focus Status authorization status is restricted. Treating as not authorized.", v2, v3, v4, v5, v6);
}

void sub_1A4CB8D08()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  sub_1A4BF4A48();
  uint64_t v5 = v0;
  __int16 v6 = v1;
  uint64_t v7 = v2;
  _os_log_error_impl(&dword_1A4AF7000, v3, OS_LOG_TYPE_ERROR, "Query failed for fetchMessageHistoryForDateInterval: %@ chatGUIDs: %@, error: %@", v4, 0x20u);
}

void sub_1A4CB8D90()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  sub_1A4BF4A48();
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_1A4AF7000, v1, OS_LOG_TYPE_ERROR, "Query failed for fetchOldestMessageDate chatGUID: %@, error: %@", v2, 0x16u);
}

void sub_1A4CB8E10(void *a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_guid(a1, a2, a3, a4);
  sub_1A4BC2CC8();
  sub_1A4BF4A30(&dword_1A4AF7000, a2, v6, "Chat %@ is ending holds on updates for all keys", v7);
}

void sub_1A4CB8E9C(void *a1)
{
  objc_end_catch();
}

void sub_1A4CB8EC0(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1A4AF7000, log, OS_LOG_TYPE_ERROR, "chatItemAssociatedWithMessageGUID included exactly 1 IMAggregateAttachmentMessagePartChatItem, but we found an item in toDeleteChatItems that was not associated with the stack", buf, 2u);
}

void sub_1A4CB8F00(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A4AF7000, a2, OS_LOG_TYPE_ERROR, "Could not get chat from notification: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1A4CB8F78(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_fault_impl(&dword_1A4AF7000, log, OS_LOG_TYPE_FAULT, "Not allowing IMChatRegistry to be instantiated from IMDPersistenceAgent. If this is a shared code path, consider using sharedRegistryIfAvailable.", v1, 2u);
}

void sub_1A4CB8FBC()
{
  sub_1A4BFFCB0();
  sub_1A4BC73B8(&dword_1A4AF7000, MEMORY[0x1E4F14500], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
}

void sub_1A4CB9038()
{
  sub_1A4BFFCB0();
  sub_1A4BC73B8(&dword_1A4AF7000, MEMORY[0x1E4F14500], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
}

void sub_1A4CB90B4()
{
  sub_1A4BFFCB0();
  sub_1A4BC73B8(&dword_1A4AF7000, MEMORY[0x1E4F14500], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
}

void sub_1A4CB9130(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_guid(0, a2, a3, a4);
  sub_1A4BFFCB0();
  sub_1A4BC73B8(&dword_1A4AF7000, MEMORY[0x1E4F14500], v5, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v6, v7, v8, v9, v10);
}

void sub_1A4CB91C8()
{
  sub_1A4C0459C();
  sub_1A4C045D4(&dword_1A4AF7000, v0, v1, "Error retaining transient subscription assertion for subscription: \"%@\" and handle: \"%@\". Error: %@");
}

void sub_1A4CB9234()
{
  sub_1A4C045BC();
  sub_1A4B40328(&dword_1A4AF7000, v0, v1, "Error releasing transient subscription assertion for handle %@. Error: %@");
}

void sub_1A4CB92A0(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1A4AF7000, log, OS_LOG_TYPE_ERROR, "empty input", v1, 2u);
}

void sub_1A4CB92E4(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1A4AF7000, log, OS_LOG_TYPE_ERROR, "digest value is empty", v1, 2u);
}

void sub_1A4CB9328(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1A4AF7000, log, OS_LOG_TYPE_ERROR, "Invalid phone number found, not adding number changed chat item.", v1, 2u);
}

void sub_1A4CB936C(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  uint64_t v7 = objc_msgSend_localizedDescription(a2, (const char *)a2, (uint64_t)a3, (uint64_t)a4);
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_1A4AF7000, a4, OS_LOG_TYPE_ERROR, "momentShareForURLString error: %@", a1, 0xCu);
}

void sub_1A4CB93E4()
{
  sub_1A4C367AC(*MEMORY[0x1E4F143B8]);
  sub_1A4BC190C();
  sub_1A4C367C4(&dword_1A4AF7000, v0, v1, "Edited status items to insert: %@ did not match indexes: %@");
}

void sub_1A4CB944C()
{
  sub_1A4C367AC(*MEMORY[0x1E4F143B8]);
  sub_1A4BC190C();
  sub_1A4C367C4(&dword_1A4AF7000, v0, v1, "Edited status items to replace: %@ did not match indexes: %@");
}

void sub_1A4CB94B4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1A4CB94EC(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1A4AF7000, a2, OS_LOG_TYPE_ERROR, "failed to add the device salt to the keychain with error: %d", (uint8_t *)v2, 8u);
}

void sub_1A4CB9564(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1A4CB959C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1A4CB95D4(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(*(void *)(*(void *)a1 + 8) + 40);
  uint64_t v4 = *a2;
  int v5 = 138412546;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  _os_log_error_impl(&dword_1A4AF7000, log, OS_LOG_TYPE_ERROR, "Something wrong when creating stringDigest: %@ for: %@", (uint8_t *)&v5, 0x16u);
}

void sub_1A4CB966C()
{
  sub_1A4BA8010();
  sub_1A4BA7FF4(&dword_1A4AF7000, v0, v1, "messageSummaryInfo is a required overide", v2, v3, v4, v5, v6);
}

void sub_1A4CB96A0()
{
  sub_1A4BA8010();
  sub_1A4BA7FF4(&dword_1A4AF7000, v0, v1, "contentType is a required overide", v2, v3, v4, v5, v6);
}

void sub_1A4CB96D4()
{
  sub_1A4BA8010();
  sub_1A4BA7FF4(&dword_1A4AF7000, v0, v1, "Failed to get content type", v2, v3, v4, v5, v6);
}

void sub_1A4CB9708(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A4AF7000, a2, OS_LOG_TYPE_ERROR, "summary text for tapback is nil for type: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1A4CB9780(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A4AF7000, a2, OS_LOG_TYPE_ERROR, "Failed to unarchive the data source pluginPayload. Error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1A4CB97F8(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1A4AF7000, a2, OS_LOG_TYPE_DEBUG, "strict-decoding 017 exception/error after _enableStrictSecureDecodingMode: [%@]", (uint8_t *)&v2, 0xCu);
}

void sub_1A4CB9870()
{
  sub_1A4BA8010();
  _os_log_debug_impl(&dword_1A4AF7000, v0, OS_LOG_TYPE_DEBUG, "strict-decoding 017 _enableStrictSecureDecodingMode called", v1, 2u);
}

void sub_1A4CB98B0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1A4CB98E8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1A4CB9920(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1A4CB9958()
{
  sub_1A4BA8010();
  sub_1A4BA7FF4(&dword_1A4AF7000, v0, v1, "FindMyLocateSession class not found! Is FindMyLocate installed correctly? This breaks FindMy functionality in Messages, please file a radar.", v2, v3, v4, v5, v6);
}

void sub_1A4CB998C()
{
  sub_1A4BA8010();
  sub_1A4BA7FF4(&dword_1A4AF7000, v0, v1, "Attempted to initialize IMFMFSession in a non-Messages process, or when lockdown is enabled. This check is in place to prevent FindMyLocate from crashing your process with a fatalError if you do not have the required entitlement.", v2, v3, v4, v5, v6);
}

void sub_1A4CB99C0()
{
  sub_1A4BA8010();
  sub_1A4BA7FF4(&dword_1A4AF7000, v0, v1, "FindMyLocateSession could not set a me device update callback because the FindMyLocateSession did not respond to the expected selector. This breaks FindMy functionality in Messages! Please file a radar.", v2, v3, v4, v5, v6);
}

void sub_1A4CB99F4()
{
  sub_1A4BA8010();
  sub_1A4BA7FF4(&dword_1A4AF7000, v0, v1, "FindMyLocateSession could not set a friendship update callback because the FindMyLocateSession did not respond to the expected selector. This breaks FindMy functionality in Messages! Please file a radar.", v2, v3, v4, v5, v6);
}

void sub_1A4CB9A28()
{
  sub_1A4BA8010();
  sub_1A4BA7FF4(&dword_1A4AF7000, v0, v1, "FindMyLocateSession could not set a location update callback because the FindMyLocateSession did not respond to the expected selector. This breaks FindMy functionality in Messages! Please file a radar.", v2, v3, v4, v5, v6);
}

void sub_1A4CB9A5C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1A4CB9ACC()
{
  sub_1A4BA8010();
  sub_1A4BA7FF4(&dword_1A4AF7000, v0, v1, "FindMyLocateSession did not respond to the expected selector: startMonitoringActiveLocationSharingDeviceChangeWithCompletion. Is FindMyLocate installed correctly? This breaks our ability to detect when the active FindMy device changes. If you see this error, please file a radar to the FindMy team.", v2, v3, v4, v5, v6);
}

void sub_1A4CB9B00()
{
  sub_1A4BA8010();
  sub_1A4BA7FF4(&dword_1A4AF7000, v0, v1, "FindMyLocateSession did not respond to the expected selector: getFriendsSharingLocationsWithMeWithCompletion. Is FindMyLocate installed correctly? This breaks our ability to get FindMy friendship updates throughout the app. If you see this error, please file a radar to the FindMy team.", v2, v3, v4, v5, v6);
}

void sub_1A4CB9B34()
{
  sub_1A4BA8010();
  sub_1A4BA7FF4(&dword_1A4AF7000, v0, v1, "FindMyLocateSession did not respond to the expected selector: startUpdatingFriendsWithCompletion. Is FindMyLocate installed correctly? This breaks our ability to get FindMy friendship updates throughout the app. If you see this error, please file a radar to the FindMy team.", v2, v3, v4, v5, v6);
}

void sub_1A4CB9B68()
{
  sub_1A4BC2CC8();
  sub_1A4BC2CAC(&dword_1A4AF7000, v0, v1, "FindMyLocateSession startUpdatingFriendsWithCompletion failed with an error. This breaks our ability to get FindMy friendship updates throughout the app. If you see this error, please file a radar to the FindMy team. Error: %@", v2, v3, v4, v5, v6);
}

void sub_1A4CB9BD0()
{
  sub_1A4BC2CC8();
  sub_1A4BC2CAC(&dword_1A4AF7000, v0, v1, "FindMyLocateSession startMonitoringActiveLocationSharingDeviceChangeWithCompletion failed with an error. This breaks our ability to detect when the active FindMy device changes. If you see this error, please file a radar to the FindMy team. Error: %@", v2, v3, v4, v5, v6);
}

void sub_1A4CB9C38()
{
  sub_1A4BA8010();
  sub_1A4BA7FF4(&dword_1A4AF7000, v0, v1, "Could not call FindMyLocateSession startRefreshingLocationForHandles either because there are no handles, or because fmlSession didn't respond to the selector", v2, v3, v4, v5, v6);
}

void sub_1A4CB9C6C(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  sub_1A4C564A4();
  sub_1A4B40328(&dword_1A4AF7000, v1, v2, "Error with FindMyLocateSession startRefreshingLocationForHandles. Handles: %@, error: %@", (void)v3, DWORD2(v3));
}

void sub_1A4CB9CE0(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  sub_1A4C564A4();
  sub_1A4B40328(&dword_1A4AF7000, v1, v2, "Error with FindMyLocateSession stopRefreshingLocationForHandles: %@, error: %@", (void)v3, DWORD2(v3));
}

void sub_1A4CB9D54()
{
  sub_1A4BA8010();
  sub_1A4BA7FF4(&dword_1A4AF7000, v0, v1, "findMyLocationForFindMyHandle: No location to retrieve because the fmlHandle is nil", v2, v3, v4, v5, v6);
}

void sub_1A4CB9D88()
{
  sub_1A4BA8010();
  sub_1A4BA7FF4(&dword_1A4AF7000, v0, v1, "findMyLocationForFindMyHandle: fmlSession did not respond to the selector cachedLocationForHandle:", v2, v3, v4, v5, v6);
}

void sub_1A4CB9DBC()
{
  sub_1A4BA8010();
  sub_1A4BA7FF4(&dword_1A4AF7000, v0, v1, "findMyLocationForFindMyHandle: No location to retrieve because the fmfHandle is nil", v2, v3, v4, v5, v6);
}

void sub_1A4CB9DF0()
{
  sub_1A4BC2CC8();
  sub_1A4BC2CAC(&dword_1A4AF7000, v0, v1, "refreshLocationForHandles - Failed to generate FMFHandle for %@", v2, v3, v4, v5, v6);
}

void sub_1A4CB9E58()
{
  sub_1A4BC2CC8();
  sub_1A4BC2CAC(&dword_1A4AF7000, v0, v1, "_canShareLocationWithFMLHandle: could not call FindMyLocate SPI for handle: %@. Either the handle is nil or the FMLSession did not respond to the expected selector.", v2, v3, v4, v5, v6);
}

void sub_1A4CB9EC0()
{
  sub_1A4BC2CC8();
  sub_1A4C564A4();
  sub_1A4B40328(&dword_1A4AF7000, v0, v1, "FindMyLocateSession getActiveLocationSharingDeviceWithCompletion device: %@ error %@");
}

void sub_1A4CB9F2C()
{
  sub_1A4BA8010();
  sub_1A4BA7FF4(&dword_1A4AF7000, v0, v1, "FindMyLocateSession makeThisDeviceActiveDevice is not implemented", v2, v3, v4, v5, v6);
}

void sub_1A4CB9F60()
{
  sub_1A4BC2CC8();
  sub_1A4C045D4(&dword_1A4AF7000, v0, v1, "sendFriendshipOfferToHandles returned error: %@, handles: %@, duration: %ld");
}

void sub_1A4CB9FE4(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v4 = 138412802;
  if (*(unsigned char *)(a2 + 40)) {
    uint64_t v3 = @"YES";
  }
  else {
    uint64_t v3 = @"NO";
  }
  *(void *)&v4[4] = a1;
  *(_WORD *)&v4[12] = 2112;
  *(void *)&uint8_t v4[14] = *(void *)(a2 + 32);
  *(_WORD *)&v4[22] = 2112;
  sub_1A4C045D4(&dword_1A4AF7000, a2, a3, "FindMyLocateSession stopSharingLocationWith returned error: %@, handles: %@, isFromGroup: %@", *(void *)v4, *(void *)&v4[8], *(void *)&v4[16], v3);
}

void sub_1A4CBA084(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v3 = 136315650;
  uint64_t v4 = "void _IMReplaceChatItemsInRange(NSMutableArray<IMChatItem *> *__strong, __strong id<IMChatItemRules>, NSRange, IMItem *__strong)";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_1A4AF7000, log, OS_LOG_TYPE_ERROR, "%s Failed to generate chatItems for newItem: %@ with prevItem: %@", (uint8_t *)&v3, 0x20u);
}

void sub_1A4CBA11C(uint64_t a1, const char *a2, NSObject *a3, uint64_t a4)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend_handleString(*(void **)(a1 + 32), a2, (uint64_t)a3, a4);
  int v7 = 138412546;
  uint64_t v8 = v6;
  __int16 v9 = 2112;
  uint8_t v10 = a2;
  _os_log_error_impl(&dword_1A4AF7000, a3, OS_LOG_TYPE_ERROR, "Error fetching subscription service for handle: \"%@\" Error: %@", (uint8_t *)&v7, 0x16u);
}

void sub_1A4CBA1D4(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A4AF7000, a2, OS_LOG_TYPE_ERROR, "Availability could not be decoded for handle \"%@\", returning unknown availability", (uint8_t *)&v2, 0xCu);
}

void sub_1A4CBA24C()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  sub_1A4BF4A48();
  uint64_t v5 = v0;
  __int16 v6 = v1;
  uint64_t v7 = v2;
  _os_log_error_impl(&dword_1A4AF7000, v3, OS_LOG_TYPE_ERROR, "Error retaining transient subscription assertion for subscription: \"%@\" and handle: \"%@\". Error: %@", v4, 0x20u);
}

void sub_1A4CBA2D4()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  sub_1A4BF4A48();
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_1A4AF7000, v1, OS_LOG_TYPE_ERROR, "Error releasing transient subscription assertion for handle %@. Error: %@", v2, 0x16u);
}

void sub_1A4CBA354(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A4AF7000, a2, OS_LOG_TYPE_ERROR, "No normalizedID available for handle, falling back to regular ID. Handle: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1A4CBA3CC(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1A4AF7000, log, OS_LOG_TYPE_ERROR, "No message item provided", v1, 2u);
}

void sub_1A4CBA410(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1A4AF7000, log, OS_LOG_TYPE_ERROR, "IMSPIGetGroupPhotosForChatsWithGroupIDs resulting 'groupIDsToGroupPhotos' is NIL", v1, 2u);
}

void sub_1A4CBA454(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1A4AF7000, log, OS_LOG_TYPE_ERROR, "Unable to access group photo file for groupID: '%@', sandboxedFileURL: '%@'", (uint8_t *)&v3, 0x16u);
}

void sub_1A4CBA4DC(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1A4AF7000, log, OS_LOG_TYPE_ERROR, "NIL resource returned by accessResourceByConsumingSandboxExtensionWithBlock", v1, 2u);
}

void sub_1A4CBA520(void *a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  __int16 v5 = objc_msgSend_description(a1, a2, a3, a4);
  int v6 = 138412290;
  uint64_t v7 = v5;
  _os_log_error_impl(&dword_1A4AF7000, (os_log_t)a2, OS_LOG_TYPE_ERROR, "Failed to load groupPhotoData with error: '%@'", (uint8_t *)&v6, 0xCu);
}

void sub_1A4CBA5B8()
{
  sub_1A4BC2CC8();
  sub_1A4C87420(&dword_1A4AF7000, v0, v1, "Will fetch moment share for URL: %@", v2, v3, v4, v5, v6);
}

void sub_1A4CBA620()
{
  sub_1A4BC2CC8();
  sub_1A4C87420(&dword_1A4AF7000, v0, v1, "Waiting for already executing fetch of moment share for URL: %@", v2, v3, v4, v5, v6);
}

void sub_1A4CBA688()
{
  sub_1A4BC2CC8();
  sub_1A4C87420(&dword_1A4AF7000, v0, v1, "Returning a generic error while fetching moment share for URL: %@", v2, v3, v4, v5, v6);
}

void sub_1A4CBA6F0()
{
  sub_1A4BC2CC8();
  sub_1A4C87420(&dword_1A4AF7000, v0, v1, "Will fetch local moment share for URL: %@", v2, v3, v4, v5, v6);
}

void sub_1A4CBA758(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_1A4AF7000, log, OS_LOG_TYPE_DEBUG, "Returning cached moment share: %{public}@, for URL: %@", buf, 0x16u);
}

void sub_1A4CBA7C0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, a3, a4);
  uint64_t v7 = objc_msgSend_stringWithUTF8String_(NSString, v5, (uint64_t)"BOOL SOFT_LINKED_PXIsMomentShareErrorPermanent(NSError *__strong)", v6);
  uint64_t v8 = dlerror();
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v4, v9, (uint64_t)v7, @"IMMomentShareCache.m", 31, @"%s", v8);

  __break(1u);
}

void sub_1A4CBA838()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  sub_1A4C8743C();
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_1A4AF7000, v1, OS_LOG_TYPE_ERROR, "Failed to fetch moment share for URL: %@, error: %@", v2, 0x16u);
}

void sub_1A4CBA8B4(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_uuid(a1, a2, a3, a4);
  sub_1A4C8743C();
  sub_1A4C87450(&dword_1A4AF7000, v5, v6, "Returning fetched moment share: %{public}@, for URL: %@", v7, v8, v9, v10, v11);
}

void sub_1A4CBA94C(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl(&dword_1A4AF7000, log, OS_LOG_TYPE_DEBUG, "Posting the IMMomentShareCacheDidChangeNotification", v1, 2u);
}

void sub_1A4CBA990(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_uuid(a1, a2, a3, a4);
  sub_1A4C8743C();
  sub_1A4C87450(&dword_1A4AF7000, v5, v6, "Moment share was changed: %{public}@, URL: %@", v7, v8, v9, v10, v11);
}

void sub_1A4CBAA24(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, a3, a4);
  uint64_t v7 = objc_msgSend_stringWithUTF8String_(NSString, v5, (uint64_t)"Class getPHPhotoLibraryClass(void)_block_invoke", v6);
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v4, v8, (uint64_t)v7, @"IMMomentShareCache.m", 24, @"Unable to find class %s", "PHPhotoLibrary");

  __break(1u);
}

void sub_1A4CBAAA0(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, a3, a4);
  uint64_t v8 = objc_msgSend_stringWithUTF8String_(NSString, v6, (uint64_t)"void *PhotosLibrary(void)", v7);
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v5, v9, (uint64_t)v8, @"IMMomentShareCache.m", 23, @"%s", *a1);

  __break(1u);
}

void sub_1A4CBAB20(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, a3, a4);
  uint64_t v7 = objc_msgSend_stringWithUTF8String_(NSString, v5, (uint64_t)"Class getPHMomentShareClass(void)_block_invoke", v6);
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v4, v8, (uint64_t)v7, @"IMMomentShareCache.m", 25, @"Unable to find class %s", "PHMomentShare");

  __break(1u);
}

void sub_1A4CBAB9C(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, a3, a4);
  uint64_t v8 = objc_msgSend_stringWithUTF8String_(NSString, v6, (uint64_t)"void *PhotosUICoreLibrary(void)", v7);
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v5, v9, (uint64_t)v8, @"IMMomentShareCache.m", 29, @"%s", *a1);

  __break(1u);
}

void sub_1A4CBAC1C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, a3, a4);
  uint64_t v7 = objc_msgSend_stringWithUTF8String_(NSString, v5, (uint64_t)"Class getPXTwoTupleClass(void)_block_invoke", v6);
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v4, v8, (uint64_t)v7, @"IMMomentShareCache.m", 30, @"Unable to find class %s", "PXTwoTuple");

  __break(1u);
}

void sub_1A4CBAC98(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1A4AF7000, a2, OS_LOG_TYPE_DEBUG, "updateCloudKitState was updated by the daemon with %@", (uint8_t *)&v2, 0xCu);
}

void sub_1A4CBAD10(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1A4AF7000, a2, OS_LOG_TYPE_DEBUG, "updateCloudKitProgress was updated by the daemon with %@", (uint8_t *)&v2, 0xCu);
}

void sub_1A4CBAD88(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl(&dword_1A4AF7000, log, OS_LOG_TYPE_DEBUG, "updateCloudKitState was updated by the daemon, clients should values", v1, 2u);
}

uint64_t sub_1A4CBADCC()
{
  return MEMORY[0x1F40E3038]();
}

uint64_t sub_1A4CBADDC()
{
  return MEMORY[0x1F40E3060]();
}

uint64_t sub_1A4CBADEC()
{
  return MEMORY[0x1F40E3070]();
}

uint64_t sub_1A4CBADFC()
{
  return MEMORY[0x1F40E3550]();
}

uint64_t sub_1A4CBAE0C()
{
  return MEMORY[0x1F40E35A8]();
}

uint64_t sub_1A4CBAE1C()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_1A4CBAE2C()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1A4CBAE3C()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_1A4CBAE4C()
{
  return MEMORY[0x1F40E5078]();
}

uint64_t sub_1A4CBAE5C()
{
  return MEMORY[0x1F40E50E0]();
}

uint64_t sub_1A4CBAE6C()
{
  return MEMORY[0x1F40E5188]();
}

uint64_t sub_1A4CBAE7C()
{
  return MEMORY[0x1F40E51A8]();
}

uint64_t sub_1A4CBAE8C()
{
  return MEMORY[0x1F40E52E0]();
}

uint64_t sub_1A4CBAE9C()
{
  return MEMORY[0x1F40E5378]();
}

uint64_t sub_1A4CBAEAC()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1A4CBAEBC()
{
  return MEMORY[0x1F40E53B0]();
}

uint64_t sub_1A4CBAECC()
{
  return MEMORY[0x1F40E5438]();
}

uint64_t sub_1A4CBAEDC()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1A4CBAEEC()
{
  return MEMORY[0x1F4123020]();
}

uint64_t sub_1A4CBAEFC()
{
  return MEMORY[0x1F4123028]();
}

uint64_t sub_1A4CBAF0C()
{
  return MEMORY[0x1F4123038]();
}

uint64_t sub_1A4CBAF1C()
{
  return MEMORY[0x1F4123048]();
}

uint64_t sub_1A4CBAF2C()
{
  return MEMORY[0x1F4123058]();
}

uint64_t sub_1A4CBAF3C()
{
  return MEMORY[0x1F4123C58]();
}

uint64_t sub_1A4CBAF4C()
{
  return MEMORY[0x1F4123C60]();
}

uint64_t sub_1A4CBAF5C()
{
  return MEMORY[0x1F4123C68]();
}

uint64_t sub_1A4CBAF6C()
{
  return MEMORY[0x1F4123C70]();
}

uint64_t sub_1A4CBAF7C()
{
  return MEMORY[0x1F4123C78]();
}

uint64_t sub_1A4CBAF8C()
{
  return MEMORY[0x1F4123CA8]();
}

uint64_t sub_1A4CBAF9C()
{
  return MEMORY[0x1F4123CB0]();
}

uint64_t sub_1A4CBAFAC()
{
  return MEMORY[0x1F4123CB8]();
}

uint64_t sub_1A4CBAFBC()
{
  return MEMORY[0x1F4123CC0]();
}

uint64_t sub_1A4CBAFCC()
{
  return MEMORY[0x1F4123CC8]();
}

uint64_t sub_1A4CBAFDC()
{
  return MEMORY[0x1F4123CD0]();
}

uint64_t sub_1A4CBAFEC()
{
  return MEMORY[0x1F4123CD8]();
}

uint64_t sub_1A4CBAFFC()
{
  return MEMORY[0x1F4123CE0]();
}

uint64_t sub_1A4CBB00C()
{
  return MEMORY[0x1F4123E08]();
}

uint64_t sub_1A4CBB01C()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1A4CBB02C()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1A4CBB03C()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1A4CBB04C()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_1A4CBB05C()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1A4CBB06C()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1A4CBB07C()
{
  return MEMORY[0x1F4186EF8]();
}

uint64_t sub_1A4CBB08C()
{
  return MEMORY[0x1F4186F40]();
}

uint64_t sub_1A4CBB09C()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1A4CBB0AC()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_1A4CBB0BC()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1A4CBB0CC()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1A4CBB0DC()
{
  return MEMORY[0x1F40E6238]();
}

uint64_t sub_1A4CBB0EC()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1A4CBB0FC()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1A4CBB10C()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1A4CBB11C()
{
  return MEMORY[0x1F4183D80]();
}

uint64_t sub_1A4CBB12C()
{
  return MEMORY[0x1F4183DF8]();
}

uint64_t sub_1A4CBB13C()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_1A4CBB14C()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1A4CBB15C()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1A4CBB16C()
{
  return MEMORY[0x1F4183E90]();
}

uint64_t sub_1A4CBB17C()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1A4CBB18C()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_1A4CBB19C()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_1A4CBB1AC()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1A4CBB1BC()
{
  return MEMORY[0x1F4187C08]();
}

uint64_t sub_1A4CBB1CC()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1A4CBB1DC()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1A4CBB1EC()
{
  return MEMORY[0x1F40E63C8]();
}

uint64_t sub_1A4CBB1FC()
{
  return MEMORY[0x1F40E6430]();
}

uint64_t sub_1A4CBB20C()
{
  return MEMORY[0x1F40E6458]();
}

uint64_t sub_1A4CBB21C()
{
  return MEMORY[0x1F4184138]();
}

uint64_t sub_1A4CBB22C()
{
  return MEMORY[0x1F40E6478]();
}

uint64_t sub_1A4CBB23C()
{
  return MEMORY[0x1F40E6538]();
}

uint64_t sub_1A4CBB24C()
{
  return MEMORY[0x1F41886C0]();
}

uint64_t sub_1A4CBB25C()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_1A4CBB26C()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1A4CBB27C()
{
  return MEMORY[0x1F41886E8]();
}

uint64_t sub_1A4CBB28C()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1A4CBB29C()
{
  return MEMORY[0x1F4123E28]();
}

uint64_t sub_1A4CBB2AC()
{
  return MEMORY[0x1F4123E30]();
}

uint64_t sub_1A4CBB2BC()
{
  return MEMORY[0x1F4123E40]();
}

uint64_t sub_1A4CBB2CC()
{
  return MEMORY[0x1F4123E48]();
}

uint64_t sub_1A4CBB2DC()
{
  return MEMORY[0x1F4123E50]();
}

uint64_t sub_1A4CBB2EC()
{
  return MEMORY[0x1F4186FD8]();
}

uint64_t sub_1A4CBB2FC()
{
  return MEMORY[0x1F41870A0]();
}

uint64_t sub_1A4CBB30C()
{
  return MEMORY[0x1F41870B8]();
}

uint64_t sub_1A4CBB31C()
{
  return MEMORY[0x1F41870E0]();
}

uint64_t sub_1A4CBB32C()
{
  return MEMORY[0x1F4123E58]();
}

uint64_t sub_1A4CBB33C()
{
  return MEMORY[0x1F4123E70]();
}

uint64_t sub_1A4CBB34C()
{
  return MEMORY[0x1F4123E88]();
}

uint64_t sub_1A4CBB35C()
{
  return MEMORY[0x1F41874C0]();
}

uint64_t sub_1A4CBB36C()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1A4CBB37C()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1A4CBB38C()
{
  return MEMORY[0x1F40E6BF0]();
}

uint64_t sub_1A4CBB39C()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1A4CBB3BC()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1A4CBB3CC()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t sub_1A4CBB3DC()
{
  return MEMORY[0x1F4184C18]();
}

uint64_t sub_1A4CBB3EC()
{
  return MEMORY[0x1F4184C20]();
}

uint64_t sub_1A4CBB3FC()
{
  return MEMORY[0x1F4184C38]();
}

uint64_t sub_1A4CBB40C()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1A4CBB41C()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1A4CBB42C()
{
  return MEMORY[0x1F4184CA8]();
}

uint64_t sub_1A4CBB43C()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1A4CBB44C()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1A4CBB45C()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1A4CBB46C()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1A4CBB47C()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t sub_1A4CBB48C()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t sub_1A4CBB49C()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t sub_1A4CBB4AC()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t sub_1A4CBB4BC()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1A4CBB4CC()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1A4CBB4DC()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1A4CBB4EC()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1A4CBB4FC()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1A4CBB50C()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1A4CBB51C()
{
  return MEMORY[0x1F41854A0]();
}

uint64_t sub_1A4CBB52C()
{
  return MEMORY[0x1F41854C8]();
}

uint64_t sub_1A4CBB53C()
{
  return MEMORY[0x1F41854D8]();
}

uint64_t sub_1A4CBB54C()
{
  return MEMORY[0x1F4185518]();
}

uint64_t sub_1A4CBB55C()
{
  return MEMORY[0x1F4185528]();
}

uint64_t sub_1A4CBB56C()
{
  return MEMORY[0x1F4185590]();
}

uint64_t sub_1A4CBB57C()
{
  return MEMORY[0x1F4185598]();
}

uint64_t sub_1A4CBB58C()
{
  return MEMORY[0x1F4185658]();
}

uint64_t sub_1A4CBB59C()
{
  return MEMORY[0x1F41856B8]();
}

uint64_t sub_1A4CBB5AC()
{
  return MEMORY[0x1F41856C0]();
}

uint64_t sub_1A4CBB5BC()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1A4CBB5DC()
{
  return MEMORY[0x1F4185A30]();
}

uint64_t sub_1A4CBB5EC()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1A4CBB5FC()
{
  return MEMORY[0x1F4185D10]();
}

uint64_t sub_1A4CBB60C()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1A4CBB61C()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1A4CBB62C()
{
  return MEMORY[0x1F40E6E30]();
}

uint64_t sub_1A4CBB63C()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1A4CBB64C()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1A4CBB65C()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1A4CBB66C()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t sub_1A4CBB67C()
{
  return MEMORY[0x1F4185FF0]();
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x1F40C9738](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x1F40C9740](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9748](c, data, *(void *)&len);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7198](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

CFIndex CFArrayGetLastIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1F40D71D0](theArray, range.location, range.length, value);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

void CFArrayInsertValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

void CFArrayReplaceValues(CFMutableArrayRef theArray, CFRange range, const void **newValues, CFIndex newCount)
{
}

void CFArraySortValues(CFMutableArrayRef theArray, CFRange range, CFComparatorFunction comparator, void *context)
{
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1F40D77E8](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopAddObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B8]();
}

CFRunLoopObserverRef CFRunLoopObserverCreateWithHandler(CFAllocatorRef allocator, CFOptionFlags activities, Boolean repeats, CFIndex order, void *block)
{
  return (CFRunLoopObserverRef)MEMORY[0x1F40D80E0](allocator, activities, repeats, order, block);
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x1F40D8140](allocator, order, context);
}

void CFRunLoopSourceSignal(CFRunLoopSourceRef source)
{
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x1F40D8210](allocator, capacity, callBacks);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFComparisonResult CFStringCompareWithOptionsAndLocale(CFStringRef theString1, CFStringRef theString2, CFRange rangeToCompare, CFStringCompareFlags compareOptions, CFLocaleRef locale)
{
  return MEMORY[0x1F40D8398](theString1, theString2, rangeToCompare.location, rangeToCompare.length, compareOptions, locale);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8408](alloc, maxLength);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1F40D8500](theString, range.location, range.length, *(void *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1F40D8520](theString, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x1F41096C8]();
}

uint64_t ExtractURLQueries()
{
  return MEMORY[0x1F4123650]();
}

uint64_t IDSCopyIDForEmailAddress()
{
  return MEMORY[0x1F4122BD8]();
}

uint64_t IDSCopyIDForPhoneNumber()
{
  return MEMORY[0x1F4122BE0]();
}

uint64_t IDSCopyIDForPhoneNumberWithOptions()
{
  return MEMORY[0x1F4122BE8]();
}

uint64_t IMAdditionalChatRegistryLoggingEnabled()
{
  return MEMORY[0x1F4123EB0]();
}

uint64_t IMAppBundleRootDirectory()
{
  return MEMORY[0x1F4123EC8]();
}

uint64_t IMAreEmailsLogicallyTheSame()
{
  return MEMORY[0x1F4123660]();
}

uint64_t IMAreObjectsLogicallySame()
{
  return MEMORY[0x1F4123668]();
}

uint64_t IMAssociatedMessageDecodeGUID()
{
  return MEMORY[0x1F4123ED0]();
}

uint64_t IMAssociatedMessageDecodePartIndex()
{
  return MEMORY[0x1F4123ED8]();
}

uint64_t IMBagIntValueWithDefault()
{
  return MEMORY[0x1F4123F20]();
}

uint64_t IMBalloonBundleIDFromExtensionID()
{
  return MEMORY[0x1F4123F28]();
}

uint64_t IMBalloonExtensionIDWithSuffix()
{
  return MEMORY[0x1F4123F30]();
}

uint64_t IMBalloonProviderBundlePaths()
{
  return MEMORY[0x1F4123F40]();
}

uint64_t IMBalloonProviderBundleRootDirectory()
{
  return MEMORY[0x1F4123F48]();
}

uint64_t IMBundleIdentifiersShowingMessagesTranscript()
{
  return MEMORY[0x1F4123F60]();
}

uint64_t IMCanonicalFormForEmail()
{
  return MEMORY[0x1F4123670]();
}

uint64_t IMCanonicalizeFormattedString()
{
  return MEMORY[0x1F4123678]();
}

uint64_t IMChatCanonicalIDSIDsForAddress()
{
  return MEMORY[0x1F4123F90]();
}

uint64_t IMCleanupPhoneNumber()
{
  return MEMORY[0x1F4123680]();
}

uint64_t IMComponentsFromChatGUID()
{
  return MEMORY[0x1F4123688]();
}

uint64_t IMCopyGUIDForChat()
{
  return MEMORY[0x1F4123698]();
}

uint64_t IMCopyStringWithLocalizedNumbers()
{
  return MEMORY[0x1F41236A8]();
}

uint64_t IMCopyThreadNameForChat()
{
  return MEMORY[0x1F41236B0]();
}

uint64_t IMCountryCodeForIncomingTextMessage()
{
  return MEMORY[0x1F41236C0]();
}

uint64_t IMCountryCodeForNumber()
{
  return MEMORY[0x1F41236C8]();
}

uint64_t IMCreateItemsFromSerializedArray()
{
  return MEMORY[0x1F4124008]();
}

uint64_t IMCreateSerializedItemsFromArray()
{
  return MEMORY[0x1F4124018]();
}

uint64_t IMCreateSimpleComponentString()
{
  return MEMORY[0x1F41236D8]();
}

uint64_t IMCreateSuperFormatStringFromPlainTextString()
{
  return MEMORY[0x1F4124020]();
}

uint64_t IMCroppedImageDataFromDataWithCropRect()
{
  return MEMORY[0x1F4124030]();
}

uint64_t IMCurrentLocationURLFromLocation()
{
  return MEMORY[0x1F4124038]();
}

uint64_t IMDAttachmentFindLargestConversations()
{
  return MEMORY[0x1F4123098]();
}

uint64_t IMDAttachmentRecordCopyAttachmentForGUID()
{
  return MEMORY[0x1F41230C0]();
}

uint64_t IMDAttachmentRecordCopyFilename()
{
  return MEMORY[0x1F41230F8]();
}

uint64_t IMDAttachmentRecordCopyUTIType()
{
  return MEMORY[0x1F4123120]();
}

uint64_t IMDAttachmentRecordGetIsOutgoing()
{
  return MEMORY[0x1F4123148]();
}

uint64_t IMDAttachmentRecordIsSticker()
{
  return MEMORY[0x1F4123160]();
}

uint64_t IMDChatGetChatsThatContainRecipient()
{
  return MEMORY[0x1F41231D8]();
}

uint64_t IMDChatGetMessageDateAndLastAddressedHandleFromChatIdentifiersAndLastAddressedHandles()
{
  return MEMORY[0x1F41231E0]();
}

uint64_t IMDChatGetMessageDateAndLastAddressedLabelIDFromChatIdentifiersAndLastAddressedLabelIDs()
{
  return MEMORY[0x1F41231E8]();
}

uint64_t IMDChatRecordCopyChatForGUID()
{
  return MEMORY[0x1F4123238]();
}

uint64_t IMDChatRemapChatsWithLastAddressedSIMIDToNewLastAddressedIDs()
{
  return MEMORY[0x1F41232E8]();
}

uint64_t IMDDScanAttributedStringWithContext()
{
  return MEMORY[0x1F4123708]();
}

uint64_t IMDHandleRecordGetIdentifier()
{
  return MEMORY[0x1F41233B0]();
}

uint64_t IMDMessageRecordCopyAttachments()
{
  return MEMORY[0x1F4123440]();
}

uint64_t IMDMessageRecordCopyMessageForGUID()
{
  return MEMORY[0x1F4123478]();
}

uint64_t IMDMessageRecordCopyMessagesWithChatIdentifiersOnServicesBeforeAndAfterGUIDWithOptionalThreadIdentifier()
{
  return MEMORY[0x1F41234D8]();
}

uint64_t IMDMessageRecordCopyMessagesWithChatIdentifiersOnServicesWithOnlyUnreadAndLimit()
{
  return MEMORY[0x1F41234F0]();
}

uint64_t IMDMessageRecordGetIdentifier()
{
  return MEMORY[0x1F4123548]();
}

uint64_t IMDaemonBackgroundMessagingProtocolXPCInterface()
{
  return MEMORY[0x1F4124048]();
}

uint64_t IMDeviceIsGreenTea()
{
  return MEMORY[0x1F4124050]();
}

uint64_t IMDispatchForNotify()
{
  return MEMORY[0x1F4123718]();
}

uint64_t IMEnumerateArrayInRange()
{
  return MEMORY[0x1F4123720]();
}

uint64_t IMExtensionPayloadUnarchivingClasses()
{
  return MEMORY[0x1F4124098]();
}

uint64_t IMFileLocationTrimFileName()
{
  return MEMORY[0x1F4123728]();
}

uint64_t IMFileTransferGUIDForAttachmentMessagePartAtMessageGUIDAndMessagePartIndex()
{
  return MEMORY[0x1F41240B8]();
}

uint64_t IMFileTransferGUIDIsTemporary()
{
  return MEMORY[0x1F41240D8]();
}

uint64_t IMFileTransferStateIsNotActive()
{
  return MEMORY[0x1F41240E8]();
}

uint64_t IMFileURLIsActuallyAnimated()
{
  return MEMORY[0x1F41240F0]();
}

uint64_t IMFormatPhoneNumber()
{
  return MEMORY[0x1F4123730]();
}

uint64_t IMFormattedDisplayStringForIDWithCountryCode()
{
  return MEMORY[0x1F4123740]();
}

uint64_t IMFormattedDisplayStringForNumber()
{
  return MEMORY[0x1F4123748]();
}

uint64_t IMFormattedNumberForUnformattedNumber()
{
  return MEMORY[0x1F4123750]();
}

uint64_t IMGenerateLoginID()
{
  return MEMORY[0x1F4123760]();
}

uint64_t IMGetAssertionFailureHandler()
{
  return MEMORY[0x1F4123780]();
}

uint64_t IMGetCachedDomainBoolForKey()
{
  return MEMORY[0x1F4123788]();
}

uint64_t IMGetCachedDomainIntForKey()
{
  return MEMORY[0x1F4123798]();
}

uint64_t IMGetCachedDomainValueForKey()
{
  return MEMORY[0x1F41237A8]();
}

uint64_t IMGetDomainBoolForKey()
{
  return MEMORY[0x1F41237B8]();
}

uint64_t IMGetDomainBoolForKeyWithDefaultValue()
{
  return MEMORY[0x1F41237C0]();
}

uint64_t IMGetDomainIntForKey()
{
  return MEMORY[0x1F41237C8]();
}

uint64_t IMGetDomainValueForKey()
{
  return MEMORY[0x1F41237D0]();
}

uint64_t IMGetEnvironmentName()
{
  return MEMORY[0x1F41237D8]();
}

uint64_t IMGetKeychainPassword()
{
  return MEMORY[0x1F41237F8]();
}

uint64_t IMGetMainBundleIdentifier()
{
  return MEMORY[0x1F4123800]();
}

uint64_t IMGreenTeaMessageReadLog()
{
  return MEMORY[0x1F4124128]();
}

uint64_t IMInternationalForPhoneNumberWithOptions()
{
  return MEMORY[0x1F41238A0]();
}

uint64_t IMIsRunningInAutomation()
{
  return MEMORY[0x1F4124170]();
}

uint64_t IMIsRunningInDebugMode()
{
  return MEMORY[0x1F4124178]();
}

uint64_t IMIsRunningInGameCenter()
{
  return MEMORY[0x1F4124180]();
}

uint64_t IMIsRunningInIDSAccountCapableClient()
{
  return MEMORY[0x1F4124188]();
}

uint64_t IMIsRunningInIMDPersistenceAgent()
{
  return MEMORY[0x1F4124190]();
}

uint64_t IMIsRunningInImagent()
{
  return MEMORY[0x1F4124198]();
}

uint64_t IMIsRunningInMessages()
{
  return MEMORY[0x1F41241A0]();
}

uint64_t IMIsRunningInMessagesComposeViewService()
{
  return MEMORY[0x1F41241A8]();
}

uint64_t IMIsRunningInMessagesTranscriptExtension()
{
  return MEMORY[0x1F41241B8]();
}

uint64_t IMIsRunningInMessagesUIProcess()
{
  return MEMORY[0x1F41241C0]();
}

uint64_t IMIsRunningInMessagesViewService()
{
  return MEMORY[0x1F41241C8]();
}

uint64_t IMIsRunningInMobileSMS()
{
  return MEMORY[0x1F41241D0]();
}

uint64_t IMIsRunningInPhotosPersistenceDependentClient()
{
  return MEMORY[0x1F41241D8]();
}

uint64_t IMIsRunningInUnitTesting()
{
  return MEMORY[0x1F41241E8]();
}

uint64_t IMIsRunningOnAudioAccessory()
{
  return MEMORY[0x1F4124200]();
}

uint64_t IMIsStringStewieEmergency()
{
  return MEMORY[0x1F4124210]();
}

uint64_t IMIsStringStewieRoadside()
{
  return MEMORY[0x1F4124218]();
}

uint64_t IMLogBacktrace()
{
  return MEMORY[0x1F41238B0]();
}

uint64_t IMLogExceptionBacktrace()
{
  return MEMORY[0x1F41238B8]();
}

uint64_t IMLogGenerateStackshotWithReason()
{
  return MEMORY[0x1F41238C0]();
}

uint64_t IMLogHandleForCategory()
{
  return MEMORY[0x1F4124230]();
}

uint64_t IMLogSimulateCrashForException()
{
  return MEMORY[0x1F41238C8]();
}

uint64_t IMLoggingStringForMessageData()
{
  return MEMORY[0x1F41238F0]();
}

uint64_t IMMMSPartCombinationCanBeSent()
{
  return MEMORY[0x1F4123930]();
}

uint64_t IMMentionContactKeysForMe()
{
  return MEMORY[0x1F4124240]();
}

uint64_t IMMentionMeTokensForContact()
{
  return MEMORY[0x1F4124248]();
}

uint64_t IMMessageCreateAssociatedMessageGUIDFromThreadIdentifier()
{
  return MEMORY[0x1F4124250]();
}

uint64_t IMMessageCreateThreadIdentifierWithOriginatorGUID()
{
  return MEMORY[0x1F4124260]();
}

uint64_t IMMessageItemShouldAutomaticallySave()
{
  return MEMORY[0x1F4124278]();
}

uint64_t IMMessageItemTimeIntervalSinceStartedExpiring()
{
  return MEMORY[0x1F4124280]();
}

uint64_t IMMessagePartDescriptionGetMessagePartIndex()
{
  return MEMORY[0x1F4124288]();
}

uint64_t IMMessageThreadIdentifierGetComponents()
{
  return MEMORY[0x1F41242A0]();
}

uint64_t IMMessageThreadIdentifierGetOriginatorGUID()
{
  return MEMORY[0x1F41242A8]();
}

uint64_t IMMessageThreadIdentifierGetOriginatorMessagePart()
{
  return MEMORY[0x1F41242B0]();
}

uint64_t IMMessageThreadIdentifierGetOriginatorRange()
{
  return MEMORY[0x1F41242B8]();
}

uint64_t IMMetricsValueForAssociatedMessageContentType()
{
  return MEMORY[0x1F41242D0]();
}

uint64_t IMNormalizeFormattedString()
{
  return MEMORY[0x1F4123948]();
}

uint64_t IMNormalizePhoneNumber()
{
  return MEMORY[0x1F41242E0]();
}

uint64_t IMNormalizedPhoneNumberForCFPhoneNumberRef()
{
  return MEMORY[0x1F4123950]();
}

uint64_t IMOSLoggingEnabled()
{
  return MEMORY[0x1F4123960]();
}

uint64_t IMPhoneNumberRefCopyForPhoneNumber()
{
  return MEMORY[0x1F4123980]();
}

uint64_t IMPreferredAccountMap()
{
  return MEMORY[0x1F4123988]();
}

uint64_t IMRegisterForPreferredAccountChangeNotificationsInternal()
{
  return MEMORY[0x1F41239A8]();
}

uint64_t IMRemoveKeychainPassword()
{
  return MEMORY[0x1F41239C0]();
}

uint64_t IMRemoveTemporaryKeychainPassword()
{
  return MEMORY[0x1F41239C8]();
}

uint64_t IMRescaledImageDataFromDataForBiomeDonation()
{
  return MEMORY[0x1F4124348]();
}

uint64_t IMSHA1HashFromStrings()
{
  return MEMORY[0x1F4124350]();
}

uint64_t IMSMSFallbackEnabled()
{
  return MEMORY[0x1F41239E8]();
}

uint64_t IMSMSReportSpamActivateExtensions()
{
  return MEMORY[0x1F4124360]();
}

uint64_t IMSMSReportSpamExtensionAvailable()
{
  return MEMORY[0x1F4124368]();
}

uint64_t IMSSMSReportSpamShouldShowReportMessagesForItems()
{
  return MEMORY[0x1F4124378]();
}

uint64_t IMSafeTemporaryDirectory()
{
  return MEMORY[0x1F4124380]();
}

uint64_t IMSanitizedSessionIdentifierForIMExtensionPayloadUserSessionIdentifierKey()
{
  return MEMORY[0x1F41243A0]();
}

uint64_t IMServiceNameForCanonicalIDSAddresses()
{
  return MEMORY[0x1F41243B0]();
}

uint64_t IMSetAlwaysUseSingletonProxies()
{
  return MEMORY[0x1F41243C0]();
}

uint64_t IMSetDomainBoolForKey()
{
  return MEMORY[0x1F41239F8]();
}

uint64_t IMSetDomainValueForKey()
{
  return MEMORY[0x1F4123A08]();
}

uint64_t IMSetKeychainPassword()
{
  return MEMORY[0x1F4123A20]();
}

uint64_t IMSetUserRegistrationFailureIntent()
{
  return MEMORY[0x1F41243F0]();
}

uint64_t IMSharedHelperAreObjectsLogicallySame()
{
  return MEMORY[0x1F4124408]();
}

uint64_t IMSharedHelperBusinessAllowlist()
{
  return MEMORY[0x1F4124410]();
}

uint64_t IMSharedHelperCombinedPluginPayloadDictionaryData()
{
  return MEMORY[0x1F4124428]();
}

uint64_t IMSharedHelperContactsBasedMergingEnabled()
{
  return MEMORY[0x1F4124438]();
}

uint64_t IMSharedHelperDeviceHasMultipleSubscriptions()
{
  return MEMORY[0x1F4124448]();
}

uint64_t IMSharedHelperDeviceHasMultipleSubscriptionsWithAtLeastOneActive()
{
  return MEMORY[0x1F4124450]();
}

uint64_t IMSharedHelperDeviceIsAltAccount()
{
  return MEMORY[0x1F4124458]();
}

uint64_t IMSharedHelperEnsureDirectoryExistsAtPath()
{
  return MEMORY[0x1F4124470]();
}

uint64_t IMSharedHelperExternalLocationForFile()
{
  return MEMORY[0x1F4124478]();
}

uint64_t IMSharedHelperGet_IMDaemonRequestConnectionWithSync()
{
  return MEMORY[0x1F4124480]();
}

uint64_t IMSharedHelperIsAppleURI()
{
  return MEMORY[0x1F4124488]();
}

uint64_t IMSharedHelperIsMakoURI()
{
  return MEMORY[0x1F4124490]();
}

uint64_t IMSharedHelperMD5OfDataInBytes()
{
  return MEMORY[0x1F41244B0]();
}

uint64_t IMSharedHelperPayloadFromCombinedPluginPayloadData()
{
  return MEMORY[0x1F41244E0]();
}

uint64_t IMSharedHelperPersonCentricMergingEnabled()
{
  return MEMORY[0x1F41244F8]();
}

uint64_t IMSharedHelperPinUnsentMessagesToBottom()
{
  return MEMORY[0x1F4124500]();
}

uint64_t IMSharedHelperRetrieveSimDetailsFromTelephony()
{
  return MEMORY[0x1F4124508]();
}

uint64_t IMSharedHelperStickerAppsTemporarilyDisplayedInSendMenu()
{
  return MEMORY[0x1F4124520]();
}

uint64_t IMSharedHelperTruncatedGroupDisplayName()
{
  return MEMORY[0x1F4124528]();
}

uint64_t IMSharedMessageSummaryCreate()
{
  return MEMORY[0x1F4124530]();
}

uint64_t IMSharedUtilitiesFrameworkBundle()
{
  return MEMORY[0x1F4124540]();
}

uint64_t IMShouldAllowInteractionlessUsageOfUTITypeWithPreviewGenerationState()
{
  return MEMORY[0x1F4124548]();
}

uint64_t IMShouldHandleInternalPhishingAttempts()
{
  return MEMORY[0x1F4124558]();
}

uint64_t IMShouldShowEmotes()
{
  return MEMORY[0x1F4124568]();
}

uint64_t IMSingleObjectArray()
{
  return MEMORY[0x1F4123A38]();
}

uint64_t IMStringFromClientCapabilities()
{
  return MEMORY[0x1F41245A0]();
}

uint64_t IMStringFromCloudKitChangingSettingState()
{
  return MEMORY[0x1F41245A8]();
}

uint64_t IMStringFromIMCloudKitAccountStatus()
{
  return MEMORY[0x1F41245B8]();
}

uint64_t IMStringFromIMCloudKitSyncControllerSyncRecordType()
{
  return MEMORY[0x1F41245C0]();
}

uint64_t IMStringFromIMCloudKitSyncControllerSyncState()
{
  return MEMORY[0x1F41245C8]();
}

uint64_t IMStringFromIMCloudKitSyncControllerSyncType()
{
  return MEMORY[0x1F41245D0]();
}

uint64_t IMStringFromIMCloudKitSyncJobState()
{
  return MEMORY[0x1F41245D8]();
}

uint64_t IMStringFromIMCloudKitSyncStatus()
{
  return MEMORY[0x1F41245E0]();
}

uint64_t IMStringFromIMCloudKitSyncType()
{
  return MEMORY[0x1F41245E8]();
}

uint64_t IMStringFromTransferState()
{
  return MEMORY[0x1F41245F8]();
}

uint64_t IMStringIsBusinessID()
{
  return MEMORY[0x1F4123A40]();
}

uint64_t IMStringIsEmail()
{
  return MEMORY[0x1F4123A48]();
}

uint64_t IMStringIsPhoneNumber()
{
  return MEMORY[0x1F4123A70]();
}

uint64_t IMStringIsStewie()
{
  return MEMORY[0x1F4123A80]();
}

uint64_t IMStripFormattingFromAddress()
{
  return MEMORY[0x1F4123A90]();
}

uint64_t IMStripLoginID()
{
  return MEMORY[0x1F4123A98]();
}

uint64_t IMSyncronizeAppPreferences()
{
  return MEMORY[0x1F4123AA8]();
}

uint64_t IMTemporaryFileTransferGUIDForNewOutgoingTransfer()
{
  return MEMORY[0x1F4124620]();
}

uint64_t IMTimingStartTimingForKey()
{
  return MEMORY[0x1F4123AC0]();
}

uint64_t IMTimingStopTimingForKey()
{
  return MEMORY[0x1F4123AC8]();
}

uint64_t IMUTITypeForFilename()
{
  return MEMORY[0x1F4124660]();
}

uint64_t IMUTITypeIsPhoto()
{
  return MEMORY[0x1F4124678]();
}

uint64_t IMUTITypeIsSupportedByPhotos()
{
  return MEMORY[0x1F4124680]();
}

uint64_t IMUTITypeIsVideo()
{
  return MEMORY[0x1F4124690]();
}

uint64_t IMUTTypeIsAudio()
{
  return MEMORY[0x1F4124698]();
}

uint64_t IMUTTypeIsCalendar()
{
  return MEMORY[0x1F41246A0]();
}

uint64_t IMUTTypeIsGIF()
{
  return MEMORY[0x1F41246A8]();
}

uint64_t IMUTTypeIsImage()
{
  return MEMORY[0x1F41246B0]();
}

uint64_t IMUTTypeIsMap()
{
  return MEMORY[0x1F41246B8]();
}

uint64_t IMUTTypeIsMovie()
{
  return MEMORY[0x1F41246C0]();
}

uint64_t IMUTTypeIsPass()
{
  return MEMORY[0x1F41246C8]();
}

uint64_t IMUTTypeIsSupportedAnimatedImage()
{
  return MEMORY[0x1F41246D0]();
}

uint64_t IMUTTypeIsVCard()
{
  return MEMORY[0x1F41246E0]();
}

uint64_t IMUTTypeIsWalletOrder()
{
  return MEMORY[0x1F41246E8]();
}

uint64_t IMUnformattedDisplayStringForIDWithCountryCode()
{
  return MEMORY[0x1F4123AD0]();
}

uint64_t IMUpdatePreferredAccountForService()
{
  return MEMORY[0x1F4123AD8]();
}

uint64_t IMWeakLinkClass()
{
  return MEMORY[0x1F4123AF0]();
}

uint64_t IMWeakLinkSymbol()
{
  return MEMORY[0x1F4123AF8]();
}

uint64_t JWDecodeCodableObjectWithStandardAllowlist()
{
  return MEMORY[0x1F4123B58]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGCopyMultipleAnswers()
{
  return MEMORY[0x1F417CDF8]();
}

uint64_t MarcoLoggingStringForMessageData()
{
  return MEMORY[0x1F412C640]();
}

uint64_t MarcoSyncLoggingsPreferences()
{
  return MEMORY[0x1F412C668]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

void NSLog(NSString *format, ...)
{
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1F40E7258](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1F40E72A0](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x1F40E72E0](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

uint64_t OSLogHandleForIMEventCategory()
{
  return MEMORY[0x1F4123B88]();
}

uint64_t OSLogHandleForIMFoundationCategory()
{
  return MEMORY[0x1F4123B90]();
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x1F40F6DD8](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x1F40F6DE0](query, result);
}

uint64_t StringGUID()
{
  return MEMORY[0x1F4123BA8]();
}

uint64_t TUHandlesAreCanonicallyEqual()
{
  return MEMORY[0x1F4163A40]();
}

uint64_t TUOpenURL()
{
  return MEMORY[0x1F4163AA8]();
}

uint64_t _AXSReduceMotionAutoplayMessagesEffectsEnabled()
{
  return MEMORY[0x1F4178E50]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFURLCopySecurityScopeFromFileURL()
{
  return MEMORY[0x1F40D92B0]();
}

uint64_t _IDSCopyCallerID()
{
  return MEMORY[0x1F4122DA0]();
}

uint64_t _IDSCopyOrderedAliasStrings()
{
  return MEMORY[0x1F4122DD8]();
}

uint64_t _IMAlwaysLog()
{
  return MEMORY[0x1F4123BB8]();
}

uint64_t _IMDAttachmentRecordBulkCopy()
{
  return MEMORY[0x1F4123638]();
}

uint64_t _IMDaemonIsRunning()
{
  return MEMORY[0x1F4123BC8]();
}

uint64_t _IMFrameworkBundle()
{
  return MEMORY[0x1F4123BD0]();
}

uint64_t _IMShouldProcessURLForPhotosExtension()
{
  return MEMORY[0x1F4124728]();
}

uint64_t _IMStringFromFZCapabilities()
{
  return MEMORY[0x1F4123BF0]();
}

uint64_t _IMStringFromFZListenerCapabilities()
{
  return MEMORY[0x1F4123BF8]();
}

uint64_t _IMWarn()
{
  return MEMORY[0x1F4123C00]();
}

uint64_t _IMWillLog()
{
  return MEMORY[0x1F4123C08]();
}

uint64_t _NSNewStringByAppendingStrings()
{
  return MEMORY[0x1F40E73A0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _signpostSendFileMessage()
{
  return MEMORY[0x1F4124748]();
}

uint64_t _signpostSendMessage()
{
  return MEMORY[0x1F4124750]();
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

void abort(void)
{
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
}

void bzero(void *a1, size_t a2)
{
}

Method class_getClassMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1F4181518](cls, name);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C8](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

void free(void *a1)
{
}

uint64_t im_dispatch_after()
{
  return MEMORY[0x1F4123C10]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1F40CC700]();
}

uint64_t localizedTextForAppName()
{
  return MEMORY[0x1F4124778]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void method_exchangeImplementations(Method m1, Method m2)
{
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)((uint64_t (*)(id, SEL))MEMORY[0x1F4181798])(a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x1F4181A58](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1F40CD558](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1F40CD560](log, ptr);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x1F40CD610]();
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1F40CDE00]();
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1F40CE078](*(void *)&a1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1F4186458]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1F41881F0]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x1F41881F8]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1F41864A0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastObjCProtocolUnconditional()
{
  return MEMORY[0x1F41864F8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x1F4186550]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1F4186580]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1F41865E8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1F4186670]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1F41866C8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1F4186760]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1F4186790]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1F4188250]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1F4188258]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1F4188260]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1F4186840]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1F4186858]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1F4186860]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1F4186868]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}

uint64_t sub_1A4CBD4EC(double a1)
{
  if (!atomic_load((unsigned int *)&unk_1E965B570)) {
    sub_1A4CBD544(a1);
  }
  return MEMORY[0x1F40DEEC8]();
}

uint64_t sub_1A4CBD518(double a1)
{
  if (!atomic_load((unsigned int *)&unk_1E965B570)) {
    sub_1A4CBD544(a1);
  }
  return MEMORY[0x1F40DEEC0]();
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1A4CBD544(double a1)
{
  return a1;
}

double sub_1A4CBD5E8(double result)
{
  if (!atomic_load((unsigned int *)&unk_1E965B570)) {
    return sub_1A4CBD544(result);
  }
  return result;
}

double sub_1A4CBD60C(double result)
{
  if (!atomic_load((unsigned int *)&unk_1E965B570)) {
    return sub_1A4CBD544(result);
  }
  return result;
}